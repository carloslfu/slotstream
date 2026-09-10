---
type: run
id: 01m1r7y5a3r1wzc474zx22mv2z
created: 2026-09-05T07:36:11.843379+00:00
updated: 2026-09-05T07:36:44.135411+00:00
summary: Sparse indexer drops the current partial block because tensor true division replaced integer floor division
binary: Frozen candidate-indexer-visibility-v12 identity in body
captured_at: 2026-09-05
command: Exact commands in embedded manifest; MLX reproduction in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Sparse indexer partial-tail counterexample
tool: Native mask gate, source inspection and pinned MLX tensor reproduction
---
# Sparse-attention partial-tail counterexample

The new visibility/dense-shortcut probe failed 32 of 96 assertions on frozen V12. The native reference masks omit each query's incomplete current block: for example, at absolute query 2,044 they retain 2,044 keys instead of 2,045; at query 2,048 they retain 2,048 instead of 2,049. The discrepancy is present in the reference path, not introduced by the optional shortcut. The subsequent real-model commands in the shell sequence did not run because the component gate failed.

The production expression `((qp + 1) / Int32(ratio)) * Int32(ratio)` uses MLX tensor true division. Tensor integer operands promote to float32, so dividing then multiplying returns `qp + 1`; the subsequent condition requires a key both >= qp+1 and <= qp and can never retain the current partial tail. The local Python reference explicitly uses floor division `//`. A separate MLX 0.31.1 reproduction records the different values and dtypes. Scalar Swift Int divisions and CPU router-index divisions are distinct and were checked separately; this finding concerns the tensor expression.

This is a correctness bug in the existing sparse-attention path once the stored context exceeds its dense threshold. Fix it unconditionally with tensor floorDivide; do not add an optimization switch that restores incorrect semantics. Expand first-query/four-token-boundary/2,048-budget/NaN-overflow tests and verify against the independent reference mask and continued model state before adopting the optional dense shortcut. New long-context optimization comparisons must bind a corrected reference; old exact-control comparisons remain historical equivalence evidence for their frozen code, not proof that the old partial-tail math was correct. Existing short-prompt ownership/final-forward observations below the sparse threshold are not reclassified as failures by this finding.

## .build/optimization/candidate-indexer-visibility-v12/build-identity.json

SHA-256: `59d2c497394e2d415c7784209904230af7ef84c68fb216b8333ad4e8340a5e91`

```text
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "b9b6934c600c4b667b8a6998c89baded501ac75fff66257725582a96170c4c15",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "4f29ac09c9a25e4173438a622d90f1e42856667ed1723177c25fb715fb9dab86",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "bfd93576914d8fd2ffb41c62ccf4d924950530502d03a7c215fd58a06784a47e",
    "Sources/Slotstream/MTP.swift": "69d9bb321e31bb79f735e7f5541df67207819b9341ebd98b9bbf46c6e81407e9",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "d470d94351ebed06f7b51624e1634093bc3475ddbb9bab240479105f50e60f53",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "a7dd84168ef011455bd6406c97d78b27e716daaf833ec6456d4a94792dc52d0c",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
    "Sources/Slotstream/ProcessMemory.swift": "6df720e0a166025acce188b1bf6de5d4793e32b0453ac26cd82424861207f190",
    "Sources/Slotstream/RouterSelection.swift": "d5c98ec697ed79c54a27346b71604b43a2318ca4827798eb8ff9ed9fce131f00",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "70132edccecf9ea1aa000f2bb5dd2de841e48bc8f81945db3e05ce20a6761988",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "0782f1c8db544072c0775c2f295414ae3b8db5e99f52e1d3f9f10707ce2f074a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "56db102e38ee234f506cacb90983894b6513a1a2c88f4aec3f5f95edd53c0d0f",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "8164029a078076622bbe7018f44b5a2249a9040673850a2214aaf6ba9091e866",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "84c0c07d5c9294189cfb584ef5f39edfeafb62f8dc03316b94b7655df4972445",
  "binary_sha256": "7eade267233d13b7038dd5cea62e35c2c5933041658084cbfc9faf5a2a22e41c",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/indexer-visibility-v12/manifest.json

SHA-256: `dc2e2ca8c9152a040e704afefbd3295fa2f03bd29ccbc8a9f32778026c7cccea`

```text
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-indexer-visibility-v12/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "b9b6934c600c4b667b8a6998c89baded501ac75fff66257725582a96170c4c15",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "4f29ac09c9a25e4173438a622d90f1e42856667ed1723177c25fb715fb9dab86",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "bfd93576914d8fd2ffb41c62ccf4d924950530502d03a7c215fd58a06784a47e",
      "Sources/Slotstream/MTP.swift": "69d9bb321e31bb79f735e7f5541df67207819b9341ebd98b9bbf46c6e81407e9",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "d470d94351ebed06f7b51624e1634093bc3475ddbb9bab240479105f50e60f53",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "a7dd84168ef011455bd6406c97d78b27e716daaf833ec6456d4a94792dc52d0c",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
      "Sources/Slotstream/ProcessMemory.swift": "6df720e0a166025acce188b1bf6de5d4793e32b0453ac26cd82424861207f190",
      "Sources/Slotstream/RouterSelection.swift": "d5c98ec697ed79c54a27346b71604b43a2318ca4827798eb8ff9ed9fce131f00",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "70132edccecf9ea1aa000f2bb5dd2de841e48bc8f81945db3e05ce20a6761988",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "0782f1c8db544072c0775c2f295414ae3b8db5e99f52e1d3f9f10707ce2f074a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "56db102e38ee234f506cacb90983894b6513a1a2c88f4aec3f5f95edd53c0d0f",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "8164029a078076622bbe7018f44b5a2249a9040673850a2214aaf6ba9091e866",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "84c0c07d5c9294189cfb584ef5f39edfeafb62f8dc03316b94b7655df4972445",
    "binary_sha256": "7eade267233d13b7038dd5cea62e35c2c5933041658084cbfc9faf5a2a22e41c",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 7.0,
  "timeout_seconds": 90,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-indexer-visibility-v12/slotstream",
    "optimization-state-check",
    "--variant",
    "indexer-visibility",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30854692864,
    "swapins": 41697979,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                  1135471.\nPages active:                                 645125.\nPages inactive:                               663209.\nPages speculative:                             57058.\nPages throttled:                                   0.\nPages wired down:                             226312.\nPages purgeable:                                5349.\n\"Translation faults\":                    13732694832.\nPages copy-on-write:                       624970381.\nPages zero filled:                       14757997585.\nPages reactivated:                        2142960364.\nPages purged:                               61161389.\nFile-backed pages:                            742401.\nAnonymous pages:                              622991.\nPages stored in compressor:                  1278235.\nPages occupied by compressor:                 351711.\nDecompressions:                            955882483.\nCompressions:                             1249339647.\nPageins:                                  5704911813.\nPageouts:                                   10616553.\nSwapins:                                    41697979.\nSwapouts:                                   69922789.\nPages tagged:                                 176314.\nPages tagged resident:                        134555.\nPages tagged compressed:                       41759.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         6813.\nPages tag-storage non-tag pageable:            84582.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6616064.\nTagged compressions:                         9304087.\nTagged decompressions:                       8562296.\n"
  },
  "exit_code": 1,
  "result_key": "passed",
  "assertions": 96,
  "duration_seconds": 0.787207583,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30858903552,
    "swapins": 41697979,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                  1134983.\nPages active:                                 644991.\nPages inactive:                               663524.\nPages speculative:                             57312.\nPages throttled:                                   0.\nPages wired down:                             226332.\nPages purgeable:                                5349.\n\"Translation faults\":                    13732706617.\nPages copy-on-write:                       624971031.\nPages zero filled:                       14758005796.\nPages reactivated:                        2142960366.\nPages purged:                               61161389.\nFile-backed pages:                            743146.\nAnonymous pages:                              622681.\nPages stored in compressor:                  1278222.\nPages occupied by compressor:                 351707.\nDecompressions:                            955882496.\nCompressions:                             1249339647.\nPageins:                                  5704912471.\nPageouts:                                   10616553.\nSwapins:                                    41697979.\nSwapouts:                                   69922789.\nPages tagged:                                 176239.\nPages tagged resident:                        134480.\nPages tagged compressed:                       41759.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         6815.\nPages tag-storage non-tag pageable:            84580.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6616064.\nTagged compressions:                         9304087.\nTagged decompressions:                       8562296.\n"
  }
}

```

## .build/optimization/indexer-visibility-v12/stdout.txt

SHA-256: `7cde16d48062d17628c35043390968d68a702e1c86dbc19a38ed134dcb01c000`

```text
{
  "items" : [
    {
      "name" : "batch 1, end 256, pattern 0: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 1, end 256, pattern 0: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 1, end 256, pattern 1: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 1, end 256, pattern 1: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 1, end 256, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 256, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2048, pattern 0: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2048, pattern 0: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2048, pattern 1: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2048, pattern 1: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2048, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2048, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2049, pattern 0: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2049, pattern 0: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2049, pattern 1: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2049, pattern 1: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2049, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2049, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2050, pattern 0: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2050, pattern 0: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2050, pattern 1: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2050, pattern 1: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2050, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2050, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2051, pattern 0: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2051, pattern 0: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2051, pattern 1: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2051, pattern 1: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2051, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2051, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2052, pattern 0: exact mask",
      "passed" : true
    },
    {
      "detail" : "got [2044, 2044, 2044, 2048, 2048, 2048, 2048, 2048], want [2045, 2046, 2047, 2048, 2049, 2050, 2051, 2048]",
      "name" : "batch 1, end 2052, pattern 0: exact causal cardinalities",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2052, pattern 1: exact mask",
      "passed" : true
    },
    {
      "detail" : "got [2044, 2044, 2044, 2048, 2048, 2048, 2048, 2048], want [2045, 2046, 2047, 2048, 2049, 2050, 2051, 2048]",
      "name" : "batch 1, end 2052, pattern 1: exact causal cardinalities",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2052, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2052, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2053, pattern 0: exact mask",
      "passed" : true
    },
    {
      "detail" : "got [2044, 2044, 2048, 2048, 2048, 2048, 2048, 2048], want [2046, 2047, 2048, 2049, 2050, 2051, 2048, 2049]",
      "name" : "batch 1, end 2053, pattern 0: exact causal cardinalities",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2053, pattern 1: exact mask",
      "passed" : true
    },
    {
      "detail" : "got [2044, 2044, 2048, 2048, 2048, 2048, 2048, 2048], want [2046, 2047, 2048, 2049, 2050, 2051, 2048, 2049]",
      "name" : "batch 1, end 2053, pattern 1: exact causal cardinalities",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2053, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2053, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2060, pattern 0: exact mask",
      "passed" : true
    },
    {
      "detail" : "got [2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048], want [2049, 2050, 2051, 2048, 2049, 2050, 2051, 2048]",
      "name" : "batch 1, end 2060, pattern 0: exact causal cardinalities",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2060, pattern 1: exact mask",
      "passed" : true
    },
    {
      "detail" : "got [2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048], want [2049, 2050, 2051, 2048, 2049, 2050, 2051, 2048]",
      "name" : "batch 1, end 2060, pattern 1: exact causal cardinalities",
      "passed" : false
    },
    {
      "name" : "batch 1, end 2060, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 1, end 2060, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 256, pattern 0: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 2, end 256, pattern 0: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 2, end 256, pattern 1: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 2, end 256, pattern 1: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 2, end 256, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 256, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2048, pattern 0: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2048, pattern 0: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2048, pattern 1: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2048, pattern 1: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2048, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2048, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2049, pattern 0: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2049, pattern 0: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2049, pattern 1: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2049, pattern 1: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2049, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2049, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2050, pattern 0: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2050, pattern 0: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2050, pattern 1: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2050, pattern 1: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2050, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2050, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2051, pattern 0: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2051, pattern 0: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2051, pattern 1: exact mask",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2051, pattern 1: exact causal cardinalities",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2051, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2051, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2052, pattern 0: exact mask",
      "passed" : true
    },
    {
      "detail" : "got [2044, 2044, 2044, 2048, 2048, 2048, 2048, 2048, 2044, 2044, 2044, 2048, 2048, 2048, 2048, 2048], want [2045, 2046, 2047, 2048, 2049, 2050, 2051, 2048, 2045, 2046, 2047, 2048, 2049, 2050, 2051, 2048]",
      "name" : "batch 2, end 2052, pattern 0: exact causal cardinalities",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2052, pattern 1: exact mask",
      "passed" : true
    },
    {
      "detail" : "got [2044, 2044, 2044, 2048, 2048, 2048, 2048, 2048, 2044, 2044, 2044, 2048, 2048, 2048, 2048, 2048], want [2045, 2046, 2047, 2048, 2049, 2050, 2051, 2048, 2045, 2046, 2047, 2048, 2049, 2050, 2051, 2048]",
      "name" : "batch 2, end 2052, pattern 1: exact causal cardinalities",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2052, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2052, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2053, pattern 0: exact mask",
      "passed" : true
    },
    {
      "detail" : "got [2044, 2044, 2048, 2048, 2048, 2048, 2048, 2048, 2044, 2044, 2048, 2048, 2048, 2048, 2048, 2048], want [2046, 2047, 2048, 2049, 2050, 2051, 2048, 2049, 2046, 2047, 2048, 2049, 2050, 2051, 2048, 2049]",
      "name" : "batch 2, end 2053, pattern 0: exact causal cardinalities",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2053, pattern 1: exact mask",
      "passed" : true
    },
    {
      "detail" : "got [2044, 2044, 2048, 2048, 2048, 2048, 2048, 2048, 2044, 2044, 2048, 2048, 2048, 2048, 2048, 2048], want [2046, 2047, 2048, 2049, 2050, 2051, 2048, 2049, 2046, 2047, 2048, 2049, 2050, 2051, 2048, 2049]",
      "name" : "batch 2, end 2053, pattern 1: exact causal cardinalities",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2053, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2053, pattern 3: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2060, pattern 0: exact mask",
      "passed" : true
    },
    {
      "detail" : "got [2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048], want [2049, 2050, 2051, 2048, 2049, 2050, 2051, 2048, 2049, 2050, 2051, 2048, 2049, 2050, 2051, 2048]",
      "name" : "batch 2, end 2060, pattern 0: exact causal cardinalities",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2060, pattern 1: exact mask",
      "passed" : true
    },
    {
      "detail" : "got [2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048, 2048], want [2049, 2050, 2051, 2048, 2049, 2050, 2051, 2048, 2049, 2050, 2051, 2048, 2049, 2050, 2051, 2048]",
      "name" : "batch 2, end 2060, pattern 1: exact causal cardinalities",
      "passed" : false
    },
    {
      "name" : "batch 2, end 2060, pattern 2: exact mask",
      "passed" : true
    },
    {
      "name" : "batch 2, end 2060, pattern 3: exact mask",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-indexer-visibility",
  "passed" : false
}

```

## .build/optimization/indexer-division-reproduction/python.json

SHA-256: `b69e7141769743da5995e8374844e05461ee5854b76ca8615b453fd0d7af7cd9`

```text
{
  "mlx_version": "0.31.1",
  "positions": [
    0,
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11
  ],
  "current_expression": [
    1.0,
    2.0,
    3.0,
    4.0,
    5.0,
    6.0,
    7.0,
    8.0,
    9.0,
    10.0,
    11.0,
    12.0
  ],
  "current_dtype": "mlx.core.float32",
  "floor_expression": [
    0,
    0,
    0,
    4,
    4,
    4,
    4,
    8,
    8,
    8,
    8,
    12
  ],
  "floor_dtype": "mlx.core.int32"
}

```

## Sources/Slotstream/Layers.swift

Whole-file SHA-256: `bfd93576914d8fd2ffb41c62ccf4d924950530502d03a7c215fd58a06784a47e`

```text
381:         var top = argPartition(-scores, kth: k - 1, axis: -1)[.ellipsis, ..<k].asType(.int32)
382:         top = which(takeAlong(broadcast(visible, to: [B, S, nBlocks]), top, axis: -1), top, MLXArray(Int32(nBlocks)))
383:         var keepBlock = MLXArray.zeros([B, S, nBlocks + 1], dtype: .bool)
384:         keepBlock = putAlong(keepBlock, top, values: MLXArray(true), axis: -1)[.ellipsis, ..<nBlocks]
385: 
386:         var keep = repeated(keepBlock, count: ratio, axis: -1)
387:         let tail = kvLen - nBlocks * ratio
388:         if tail > 0 {
389:             keep = concatenated([keep, MLXArray.zeros([B, S, tail], dtype: .bool)], axis: -1)
390:         }
391:         let keyPos = MLXArray((0 ..< kvLen).map { Int32($0) }).reshaped([1, 1, kvLen])
392:         let qp = qPos.reshaped([1, S, 1])
393:         let ownBlockStart = ((qp + 1) / Int32(ratio)) * Int32(ratio)
394:         let ownTail = (keyPos .>= ownBlockStart) .&& (keyPos .<= qp)
395:         keep = (keep .|| ownTail) .&& (keyPos .<= qp)
396:         return keep[0..., 0..., 0 ..< keyEnd].expandedDimensions(axis: 1)
397:     }
398: }
```

## Tools/reference/qwen4_exp.py

Whole-file SHA-256: `6fae4ec0decbf77ca4a4571de683bc5580ec75e84325ecb432dfcd2fc81df75e`

```text
248:         # so the query's trailing partial block (`(q_pos+1) % ratio` tokens, itself included)
249:         # is always visible, and nothing after the query ever is.
250:         keep = mx.repeat(keep_block, self.compress_ratio, axis=-1)
251:         tail = kv_len - n_blocks * self.compress_ratio
252:         if tail:
253:             keep = mx.concatenate(
254:                 [keep, mx.zeros((B, S, tail), dtype=mx.bool_)], axis=-1
255:             )
256:         key_pos = mx.arange(kv_len)[None, None, :]
257:         qp = q_pos[None, :, None]
258:         own_block_start = ((qp + 1) // self.compress_ratio) * self.compress_ratio
259:         own_tail = (key_pos >= own_block_start) & (key_pos <= qp)
260:         keep = (keep | own_tail) & (key_pos <= qp)
261:         return keep[:, None]  # (B, 1, S, kv_len), boolean, already causal
262: 
263: 
264: class Attention(nn.Module):
```

## .build/checkouts/mlx-swift/Source/MLX/MLXArray+Ops.swift

Whole-file SHA-256: `05f7e518eda6776b82860518a392c717eeeb1a5d2f70c6f91897d9d8f3b5915c`

```text
310:     ///
311:     /// let r = a / b / 7
312:     /// ```
313:     ///
314:     /// ### See Also
315:     /// - <doc:arithmetic>
316:     /// - ``divide(_:_:stream:)``
317:     /// - ``floorDivide(_:_:stream:)``
318:     public static func / (lhs: MLXArray, rhs: MLXArray) -> MLXArray {
319:         let s = StreamOrDevice.default
320:         var result = mlx_array_new()
321:         mlx_divide(&result, lhs.ctx, rhs.ctx, s.ctx)
322:         return MLXArray(result)
323:     }
324: 
325:     /// Element-wise division.
326:     ///
327:     /// Divide two arrays with <doc:broadcasting> and store the result in the left-hand side array.
328:     ///
329:     /// For example:
330:     ///
331:     /// ```swift
332:     /// let a = MLXArray(0 ..< 12, [4, 3])
333:     /// let b = MLXArray([4, 5, 6])
334:     ///
335:     /// a /= b
336:     /// ```
337:     ///
338:     /// ### See Also
339:     /// - <doc:arithmetic>
340:     /// - ``divide(_:_:stream:)``
341:     /// - ``floorDivide(_:_:stream:)``
342:     public static func /= (lhs: inout MLXArray, rhs: MLXArray) {
343:         lhs._updateInternal(lhs / rhs)
344:     }
345: 
346:     /// Element-wise division with a ``ScalarOrArray`` (scalar) argument.
347:     ///
348:     /// ### See Also
349:     /// - <doc:arithmetic>
350:     public static func / (lhs: MLXArray, rhs: some ScalarOrArray) -> MLXArray {
351:         lhs / rhs.asMLXArray(dtype: lhs.dtype)
352:     }
353: 
354:     /// Element-wise division with a ``ScalarOrArray`` (scalar) argument and store the result in the left-hand side array.
355:     ///
356:     /// ### See Also
357:     /// - <doc:arithmetic>
358:     public static func /= (lhs: inout MLXArray, rhs: some ScalarOrArray) {
359:         lhs /= rhs.asMLXArray(dtype: lhs.dtype)
360:     }
361: 
362:     /// Element-wise division with a ``ScalarOrArray`` (scalar) argument.
363:     ///
364:     /// ### See Also
365:     /// - <doc:arithmetic>
366:     public static func / (lhs: some ScalarOrArray, rhs: MLXArray) -> MLXArray {
367:         lhs.asMLXArray(dtype: rhs.dtype) / rhs
368:     }
369: 
```
