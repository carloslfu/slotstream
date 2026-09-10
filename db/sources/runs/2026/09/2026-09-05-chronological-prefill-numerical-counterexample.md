---
type: run
id: 01m1ra1d63rjtf795fx2dc2vpz
created: 2026-09-05T08:12:55.363097+00:00
updated: 2026-09-05T08:12:55.418089+00:00
summary: Larger chronological pass fails full-state and greedy continuation gates despite fewer expert reads
binary: Frozen V15 identity in body
captured_at: 2026-09-05
command: Exact command in embedded manifest; dependent 2051-token command did not run
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Chronological prefill numerical counterexample
tool: Three-schedule native state and continuation diagnostic
---
# Expanded chronological-prefill numerical counterexample

Frozen V15's 1,024-token synthetic three-schedule diagnostic failed 41 of 806 assertions. Reference, control and candidate use the same model/640-slot pool and compact-state, bounded-indexer and bounded-PLE controls; their chronological passes are 256, 512 and 1,024 tokens. The numerical threshold is the previously recorded rechunking band, max(3 times the control delta, 0.01), with additional whole-state, exact identity and greedy next-token checks after teacher-forced continuation and speculative rollback. No threshold was relaxed after this result. The dependent 2,051-token command did not run.

The failed gates include four greedy choices, the first affected stored key/indexer/value tensors at layer 7, one recurrent state at prefill, and additional continuation states. The prefill logit spread fractions (candidate 0.11919504404067993, control 0.10681114345788956) and routing set disagreement (candidate 0.03799031575520833, control 0.028643798828125) individually fit the broad historical band; that does not erase the failed state and greedy gates. Candidate reads fell from 32,471 to 11,579 (control 19,565), but this is a correctness-run mechanism observation, never a speed claim. Arbitrary synthetic token IDs do not estimate task quality. The result neither proves a new production bug nor qualifies the larger chronological schedule. It exposes a concrete numerical limitation requiring isolation or a schedule that preserves reference arithmetic.

All chronological-family controls remain off and no planner constants or goldens changed. The next independent scope comparison preserves the original 256-token compute schedule and requires exact candidate state, logits and ordered routes, while sharing expert reads across several passes. That comparison is not a relaxed rerun of this failed chronological candidate.

## .build/optimization/candidate-prefill-qualification-v15/build-identity.json

SHA-256: `2d9f7d52b611c3ce3d3b351ea07ae9cb4a7891deeff9f9e3f9597b4d75cc4613`

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
    "Sources/Slotstream/Generate.swift": "83e6ae7c6819bbe56c600623bc4acc72fc0464875658e9847312507578ae067e",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "96ca7f035e447d65a75d4dda76c40b321deeacaf5dd3a26aa6553f3735675c3e",
    "Sources/Slotstream/MTP.swift": "69d9bb321e31bb79f735e7f5541df67207819b9341ebd98b9bbf46c6e81407e9",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "dd2cad083896513b5889bf12eee31853087abbbc3f5f9b1ea7879ab6c2b81bd6",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "9384a3494fef7bee578ab1b952ed87f679f85e295d88af8a1528bf6d6bca21b3",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d460a82f2d03de5c50eee83c66f13570a144647f1aa714e7bb6efc80efcb0fb4",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "98f294996508854befcdbe06333d9ec349a1cb73e3993fc90e48bd00ef20792c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "4f32bd7d73eb42eadb41a1f1c2422d310056f64c090c6ce07a855945b1507d25",
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
    "Sources/slotstream-cli/OptimizationCommands.swift": "a508a2bb3e08852134179a117af1f175df2db2decedf3a8ef4c1cde0e799a6da",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "251d4f8bf00efd9a8b2189a72e4441f7bf6fecb1efc3621304ae565a6b78ee6b",
  "binary_sha256": "c99ce52681f1b01975fabe131e35c879bc2d6bc5102aa3394d5d47cedd87d0ac",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/build-prefill-qualification-v15.log

SHA-256: `164b45b5160c394536b27a8a2294f3392ecfb6ae66a3b1f7dcd2ccb225843777`

```text
python3 Tools/build_identity.py before .build/release
swift build -c release
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[0/1] Planning build
[1/1] Compiling plugin GenerateManual
[2/2] Compiling plugin GenerateDoccReference
[3/3] Compiling plugin CudaBuild
Building for production...
[3/10] Write sources
[5/10] Write swift-version--1AB21518FC5DEDBE.txt
[7/11] Compiling SlotstreamDiagnostics CheckReport.swift
[8/13] Compiling SlotstreamTestKit Catalogue.swift
[8/13] Write Objects.LinkFileList
[10/13] Compiling slotstream_cli CheckRendering.swift
[10/13] Write Objects.LinkFileList
[11/13] Linking slotstream-checks
[12/13] Linking slotstream
Build complete! (16.35s)
cp Tools/lib/mlx-0.31.1.metallib .build/release/mlx.metallib
python3 Tools/build_identity.py after .build/release

```

## .build/optimization/prefill-family-1024-v15/manifest.json

SHA-256: `62a7df217df9def51dc084cac994a8029f6472df9e55a0eb67cda5a466be6fd5`

```text
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-prefill-qualification-v15/slotstream",
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
      "Sources/Slotstream/Generate.swift": "83e6ae7c6819bbe56c600623bc4acc72fc0464875658e9847312507578ae067e",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "96ca7f035e447d65a75d4dda76c40b321deeacaf5dd3a26aa6553f3735675c3e",
      "Sources/Slotstream/MTP.swift": "69d9bb321e31bb79f735e7f5541df67207819b9341ebd98b9bbf46c6e81407e9",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "dd2cad083896513b5889bf12eee31853087abbbc3f5f9b1ea7879ab6c2b81bd6",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "9384a3494fef7bee578ab1b952ed87f679f85e295d88af8a1528bf6d6bca21b3",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d460a82f2d03de5c50eee83c66f13570a144647f1aa714e7bb6efc80efcb0fb4",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "98f294996508854befcdbe06333d9ec349a1cb73e3993fc90e48bd00ef20792c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "4f32bd7d73eb42eadb41a1f1c2422d310056f64c090c6ce07a855945b1507d25",
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
      "Sources/slotstream-cli/OptimizationCommands.swift": "a508a2bb3e08852134179a117af1f175df2db2decedf3a8ef4c1cde0e799a6da",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "251d4f8bf00efd9a8b2189a72e4441f7bf6fecb1efc3621304ae565a6b78ee6b",
    "binary_sha256": "c99ce52681f1b01975fabe131e35c879bc2d6bc5102aa3394d5d47cedd87d0ac",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 14.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-prefill-qualification-v15/slotstream",
    "optimization-state-check",
    "--variant",
    "prefill-family",
    "--tokens",
    "1024",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32821329920,
    "swapins": 41698285,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   179272.\nPages active:                                1119710.\nPages inactive:                               804168.\nPages speculative:                            328654.\nPages throttled:                                   0.\nPages wired down:                             227742.\nPages purgeable:                                2605.\n\"Translation faults\":                    13743289043.\nPages copy-on-write:                       625435682.\nPages zero filled:                       14875106194.\nPages reactivated:                        2147762363.\nPages purged:                               61225165.\nFile-backed pages:                           1821378.\nAnonymous pages:                              431154.\nPages stored in compressor:                  1428741.\nPages occupied by compressor:                 424479.\nDecompressions:                            956842061.\nCompressions:                             1250593378.\nPageins:                                  5709111628.\nPageouts:                                   10618956.\nSwapins:                                    41698285.\nSwapouts:                                   69922789.\nPages tagged:                                 174873.\nPages tagged resident:                        127539.\nPages tagged compressed:                       47334.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6909.\nPages tag-storage free:                         1643.\nPages tag-storage non-tag pageable:            89744.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7714240.\nTagged compressions:                         9328292.\nTagged decompressions:                       8579652.\n"
  },
  "exit_code": 1,
  "result_key": "passed",
  "assertions": 806,
  "duration_seconds": 27.609990708,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32637222912,
    "swapins": 41698289,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   396999.\nPages active:                                1024522.\nPages inactive:                               811677.\nPages speculative:                            211481.\nPages throttled:                                   0.\nPages wired down:                             225653.\nPages purgeable:                                  10.\n\"Translation faults\":                    13743623630.\nPages copy-on-write:                       625439401.\nPages zero filled:                       14883953619.\nPages reactivated:                        2148352128.\nPages purged:                               61240126.\nFile-backed pages:                           1595009.\nAnonymous pages:                              452671.\nPages stored in compressor:                  1419326.\nPages occupied by compressor:                 413894.\nDecompressions:                            956851406.\nCompressions:                             1250593378.\nPageins:                                  5709601146.\nPageouts:                                   10619037.\nSwapins:                                    41698289.\nSwapouts:                                   69922789.\nPages tagged:                                 174530.\nPages tagged resident:                        127243.\nPages tagged compressed:                       47287.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6907.\nPages tag-storage free:                         1251.\nPages tag-storage non-tag pageable:            90138.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7706496.\nTagged compressions:                         9328292.\nTagged decompressions:                       8579697.\n"
  }
}

```

## .build/optimization/prefill-family-1024-v15/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/prefill-family-1024-v15/stdout.txt

SHA-256: `1ee86ce6891b454f9077c18e103fbd14141e857408b2cdad279204165a067d25`

```text
{
  "items" : [
    {
      "name" : "prefill.logits: existing rechunk band",
      "passed" : true
    },
    {
      "detail" : "got 220, want 95753",
      "name" : "prefill: greedy final token",
      "passed" : false
    },
    {
      "name" : "prefill: control fields",
      "passed" : true
    },
    {
      "name" : "prefill: candidate fields",
      "passed" : true
    },
    {
      "name" : "prefill.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill: exact ngram",
      "passed" : true
    },
    {
      "name" : "prefill.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill: exact tokens",
      "passed" : true
    },
    {
      "name" : "prefill.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "route keep sets inside existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907: greedy final token",
      "passed" : true
    },
    {
      "name" : "continued-907: control fields",
      "passed" : true
    },
    {
      "name" : "continued-907: candidate fields",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907: exact ngram",
      "passed" : true
    },
    {
      "name" : "continued-907.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907: exact tokens",
      "passed" : true
    },
    {
      "name" : "continued-907.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337: greedy final token",
      "passed" : true
    },
    {
      "name" : "continued-1337: control fields",
      "passed" : true
    },
    {
      "name" : "continued-1337: candidate fields",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337: exact ngram",
      "passed" : true
    },
    {
      "name" : "continued-1337.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.ssm.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337: exact tokens",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.logits: existing rechunk band",
      "passed" : true
    },
    {
      "detail" : "got 367, want 330",
      "name" : "continued-2103: greedy final token",
      "passed" : false
    },
    {
      "name" : "continued-2103: control fields",
      "passed" : true
    },
    {
      "name" : "continued-2103: candidate fields",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.conv.9: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103: exact ngram",
      "passed" : true
    },
    {
      "name" : "continued-2103.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.ssm.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103: exact tokens",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1: greedy final token",
      "passed" : true
    },
    {
      "name" : "rollback-1: control fields",
      "passed" : true
    },
    {
      "name" : "rollback-1: candidate fields",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.12: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.8: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.conv.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1: exact ngram",
      "passed" : true
    },
    {
      "name" : "rollback-1.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.10: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.ssm.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1: exact tokens",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.logits: existing rechunk band",
      "passed" : true
    },
    {
      "detail" : "got 31921, want 248046",
      "name" : "rollback-2: greedy final token",
      "passed" : false
    },
    {
      "name" : "rollback-2: control fields",
      "passed" : true
    },
    {
      "name" : "rollback-2: candidate fields",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.6: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2: exact ngram",
      "passed" : true
    },
    {
      "name" : "rollback-2.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.13: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.ssm.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2: exact tokens",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.logits: existing rechunk band",
      "passed" : true
    },
    {
      "detail" : "got 907, want 8",
      "name" : "rollback-3: greedy final token",
      "passed" : false
    },
    {
      "name" : "rollback-3: control fields",
      "passed" : true
    },
    {
      "name" : "rollback-3: candidate fields",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.conv.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.index.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.key.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.7: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3: exact ngram",
      "passed" : true
    },
    {
      "name" : "rollback-3.ple.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.0: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.1: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.10: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.12: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.13: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.14: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.16: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.17: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.18: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.2: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.20: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.21: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.22: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.24: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.25: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.26: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.28: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.29: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.30: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.32: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.33: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.34: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.36: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.37: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.38: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.4: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.40: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.41: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.42: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.44: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.45: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.46: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.5: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.ssm.9: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3: exact tokens",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.11: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.15: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.19: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.23: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.27: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.3: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.31: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.35: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.39: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.43: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.7: existing rechunk band",
      "passed" : false
    }
  ],
  "measurements" : {
    "arm0.chunk" : 256,
    "arm0.read_records" : 32471,
    "arm1.chunk" : 512,
    "arm1.read_records" : 19565,
    "arm2.chunk" : 1024,
    "arm2.read_records" : 11579,
    "continued-1337.conv.0.candidate" : 0,
    "continued-1337.conv.0.control" : 0,
    "continued-1337.conv.1.candidate" : 0,
    "continued-1337.conv.1.control" : 0,
    "continued-1337.conv.10.candidate" : 0.016791045665740967,
    "continued-1337.conv.10.control" : 0.01616915501654148,
    "continued-1337.conv.12.candidate" : 0.008027522824704647,
    "continued-1337.conv.12.control" : 0.014621559530496597,
    "continued-1337.conv.13.candidate" : 0.012640449218451977,
    "continued-1337.conv.13.control" : 0.011587078683078289,
    "continued-1337.conv.14.candidate" : 0.013277201913297176,
    "continued-1337.conv.14.control" : 0.01165803149342537,
    "continued-1337.conv.16.candidate" : 0.017407463863492012,
    "continued-1337.conv.16.control" : 0.021389562636613846,
    "continued-1337.conv.17.candidate" : 0.024358974769711494,
    "continued-1337.conv.17.control" : 0.020512821152806282,
    "continued-1337.conv.18.candidate" : 0.012051569297909737,
    "continued-1337.conv.18.control" : 0.011210761964321136,
    "continued-1337.conv.2.candidate" : 0,
    "continued-1337.conv.2.control" : 0,
    "continued-1337.conv.20.candidate" : 0.028985507786273956,
    "continued-1337.conv.20.control" : 0.040458936244249344,
    "continued-1337.conv.21.candidate" : 0.022269275039434433,
    "continued-1337.conv.21.control" : 0.03504673019051552,
    "continued-1337.conv.22.candidate" : 0.01222826074808836,
    "continued-1337.conv.22.control" : 0.016304347664117813,
    "continued-1337.conv.24.candidate" : 0.0357142873108387,
    "continued-1337.conv.24.control" : 0.04670329764485359,
    "continued-1337.conv.25.candidate" : 0.023923445492982864,
    "continued-1337.conv.25.control" : 0.028708133846521378,
    "continued-1337.conv.26.candidate" : 0.04672897234559059,
    "continued-1337.conv.26.control" : 0.029534170404076576,
    "continued-1337.conv.28.candidate" : 0.08533653616905212,
    "continued-1337.conv.28.control" : 0.037139423191547394,
    "continued-1337.conv.29.candidate" : 0.08450071513652802,
    "continued-1337.conv.29.control" : 0.07758620381355286,
    "continued-1337.conv.30.candidate" : 0.09962870925664902,
    "continued-1337.conv.30.control" : 0.05693069472908974,
    "continued-1337.conv.32.candidate" : 0.08185840398073196,
    "continued-1337.conv.32.control" : 0.0752212405204773,
    "continued-1337.conv.33.candidate" : 0.06145423278212547,
    "continued-1337.conv.33.control" : 0.04527559131383896,
    "continued-1337.conv.34.candidate" : 0.10050676017999649,
    "continued-1337.conv.34.control" : 0.08220721036195755,
    "continued-1337.conv.36.candidate" : 0.10116279125213623,
    "continued-1337.conv.36.control" : 0.06656976789236069,
    "continued-1337.conv.37.candidate" : 0.06849315017461777,
    "continued-1337.conv.37.control" : 0.077625572681427,
    "continued-1337.conv.38.candidate" : 0.04442771151661873,
    "continued-1337.conv.38.control" : 0.08734939992427826,
    "continued-1337.conv.4.candidate" : 0,
    "continued-1337.conv.4.control" : 0,
    "continued-1337.conv.40.candidate" : 0.09910714626312256,
    "continued-1337.conv.40.control" : 0.0920758917927742,
    "continued-1337.conv.41.candidate" : 0.08030523359775543,
    "continued-1337.conv.41.control" : 0.07848837226629257,
    "continued-1337.conv.42.candidate" : 0.06551723927259445,
    "continued-1337.conv.42.control" : 0.05948275700211525,
    "continued-1337.conv.44.candidate" : 0.10967741906642914,
    "continued-1337.conv.44.control" : 0.10322580486536026,
    "continued-1337.conv.45.candidate" : 0.12232142686843872,
    "continued-1337.conv.45.control" : 0.12678571045398712,
    "continued-1337.conv.46.candidate" : 0.0828700140118599,
    "continued-1337.conv.46.control" : 0.08627300709486008,
    "continued-1337.conv.5.candidate" : 0,
    "continued-1337.conv.5.control" : 0,
    "continued-1337.conv.6.candidate" : 0.005980861373245716,
    "continued-1337.conv.6.control" : 0,
    "continued-1337.conv.8.candidate" : 0.005868544802069664,
    "continued-1337.conv.8.control" : 0,
    "continued-1337.conv.9.candidate" : 0.006443298887461424,
    "continued-1337.conv.9.control" : 0.005154639016836882,
    "continued-1337.index.11.candidate" : 0.03086419776082039,
    "continued-1337.index.11.control" : 0.013888888992369175,
    "continued-1337.index.15.candidate" : 0.04985954985022545,
    "continued-1337.index.15.control" : 0.03089887648820877,
    "continued-1337.index.19.candidate" : 0.04566210135817528,
    "continued-1337.index.19.control" : 0.0445205494761467,
    "continued-1337.index.23.candidate" : 0.04843749850988388,
    "continued-1337.index.23.control" : 0.02276785671710968,
    "continued-1337.index.27.candidate" : 0.04393564537167549,
    "continued-1337.index.27.control" : 0.037128712981939316,
    "continued-1337.index.3.candidate" : 0.001479289960116148,
    "continued-1337.index.3.control" : 0,
    "continued-1337.index.31.candidate" : 0.1794605851173401,
    "continued-1337.index.31.control" : 0.19605809450149536,
    "continued-1337.index.35.candidate" : 0.14652317762374878,
    "continued-1337.index.35.control" : 0.15169702470302582,
    "continued-1337.index.39.candidate" : 0.04430379718542099,
    "continued-1337.index.39.control" : 0.07515823096036911,
    "continued-1337.index.43.candidate" : 0.04765624925494194,
    "continued-1337.index.43.control" : 0.07187499850988388,
    "continued-1337.index.47.candidate" : 0.11833333224058151,
    "continued-1337.index.47.control" : 0.11666666716337204,
    "continued-1337.index.7.candidate" : 0.012867647223174572,
    "continued-1337.index.7.control" : 0,
    "continued-1337.key.11.candidate" : 0.09158653765916824,
    "continued-1337.key.11.control" : 0.03413461521267891,
    "continued-1337.key.15.candidate" : 0.08188868314027786,
    "continued-1337.key.15.control" : 0.05930656939744949,
    "continued-1337.key.19.candidate" : 0.0859375,
    "continued-1337.key.19.control" : 0.09213361889123917,
    "continued-1337.key.23.candidate" : 0.09833333641290665,
    "continued-1337.key.23.control" : 0.06541666388511658,
    "continued-1337.key.27.candidate" : 0.12664473056793213,
    "continued-1337.key.27.control" : 0.10896381735801697,
    "continued-1337.key.3.candidate" : 0,
    "continued-1337.key.3.control" : 0,
    "continued-1337.key.31.candidate" : 0.1436661034822464,
    "continued-1337.key.31.control" : 0.14901426434516907,
    "continued-1337.key.35.candidate" : 0.19040697813034058,
    "continued-1337.key.35.control" : 0.213662788271904,
    "continued-1337.key.39.candidate" : 0.10507812350988388,
    "continued-1337.key.39.control" : 0.11406250298023224,
    "continued-1337.key.43.candidate" : 0.0892857164144516,
    "continued-1337.key.43.control" : 0.08758503198623657,
    "continued-1337.key.47.candidate" : 0.21296297013759613,
    "continued-1337.key.47.control" : 0.09786522388458252,
    "continued-1337.key.7.candidate" : 0.041086647659540176,
    "continued-1337.key.7.control" : 0,
    "continued-1337.logits.candidate" : 0.09191986918449402,
    "continued-1337.logits.control" : 0.10138539224863052,
    "continued-1337.ple.1.candidate" : 0,
    "continued-1337.ple.1.control" : 0,
    "continued-1337.ssm.0.candidate" : 0,
    "continued-1337.ssm.0.control" : 0,
    "continued-1337.ssm.1.candidate" : 0,
    "continued-1337.ssm.1.control" : 0,
    "continued-1337.ssm.10.candidate" : 0.01667938381433487,
    "continued-1337.ssm.10.control" : 0.012819468975067139,
    "continued-1337.ssm.12.candidate" : 0.0014707790687680244,
    "continued-1337.ssm.12.control" : 0.001538076438009739,
    "continued-1337.ssm.13.candidate" : 0.011411391198635101,
    "continued-1337.ssm.13.control" : 0.00910919439047575,
    "continued-1337.ssm.14.candidate" : 0.007715280167758465,
    "continued-1337.ssm.14.control" : 0.004649302922189236,
    "continued-1337.ssm.16.candidate" : 0.012258724309504032,
    "continued-1337.ssm.16.control" : 0.01728716306388378,
    "continued-1337.ssm.17.candidate" : 0.020991820842027664,
    "continued-1337.ssm.17.control" : 0.03261277452111244,
    "continued-1337.ssm.18.candidate" : 0.01907898671925068,
    "continued-1337.ssm.18.control" : 0.017653698101639748,
    "continued-1337.ssm.2.candidate" : 0,
    "continued-1337.ssm.2.control" : 0,
    "continued-1337.ssm.20.candidate" : 0.01822488382458687,
    "continued-1337.ssm.20.control" : 0.016659831628203392,
    "continued-1337.ssm.21.candidate" : 0.01353592798113823,
    "continued-1337.ssm.21.control" : 0.015566712245345116,
    "continued-1337.ssm.22.candidate" : 0.00567028159275651,
    "continued-1337.ssm.22.control" : 0.003573796944692731,
    "continued-1337.ssm.24.candidate" : 0.037962187081575394,
    "continued-1337.ssm.24.control" : 0.01853477768599987,
    "continued-1337.ssm.25.candidate" : 0.04212751239538193,
    "continued-1337.ssm.25.control" : 0.03595717251300812,
    "continued-1337.ssm.26.candidate" : 0.10652533918619156,
    "continued-1337.ssm.26.control" : 0.07120426744222641,
    "continued-1337.ssm.28.candidate" : 0.011697604320943356,
    "continued-1337.ssm.28.control" : 0.00587508175522089,
    "continued-1337.ssm.29.candidate" : 0.08432771265506744,
    "continued-1337.ssm.29.control" : 0.06704694777727127,
    "continued-1337.ssm.30.candidate" : 0.10942339152097702,
    "continued-1337.ssm.30.control" : 0.08174991607666016,
    "continued-1337.ssm.32.candidate" : 0.09930247813463211,
    "continued-1337.ssm.32.control" : 0.07884819060564041,
    "continued-1337.ssm.33.candidate" : 0.13233627378940582,
    "continued-1337.ssm.33.control" : 0.10500305145978928,
    "continued-1337.ssm.34.candidate" : 0.1291729211807251,
    "continued-1337.ssm.34.control" : 0.10231394320726395,
    "continued-1337.ssm.36.candidate" : 0.08457451313734055,
    "continued-1337.ssm.36.control" : 0.05079161748290062,
    "continued-1337.ssm.37.candidate" : 0.09125860035419464,
    "continued-1337.ssm.37.control" : 0.0681229904294014,
    "continued-1337.ssm.38.candidate" : 0.026002341881394386,
    "continued-1337.ssm.38.control" : 0.02494955062866211,
    "continued-1337.ssm.4.candidate" : 0,
    "continued-1337.ssm.4.control" : 0,
    "continued-1337.ssm.40.candidate" : 0.019154056906700134,
    "continued-1337.ssm.40.control" : 0.027350297197699547,
    "continued-1337.ssm.41.candidate" : 0.03224184736609459,
    "continued-1337.ssm.41.control" : 0.021054932847619057,
    "continued-1337.ssm.42.candidate" : 0.0425557903945446,
    "continued-1337.ssm.42.control" : 0.05017009750008583,
    "continued-1337.ssm.44.candidate" : 0.02615615911781788,
    "continued-1337.ssm.44.control" : 0.05458412691950798,
    "continued-1337.ssm.45.candidate" : 0.1837233155965805,
    "continued-1337.ssm.45.control" : 0.2030525803565979,
    "continued-1337.ssm.46.candidate" : 0.1385447382926941,
    "continued-1337.ssm.46.control" : 0.09757190942764282,
    "continued-1337.ssm.5.candidate" : 2.7416739612817764e-05,
    "continued-1337.ssm.5.control" : 0,
    "continued-1337.ssm.6.candidate" : 0.00520355673506856,
    "continued-1337.ssm.6.control" : 0,
    "continued-1337.ssm.8.candidate" : 0.004208301194012165,
    "continued-1337.ssm.8.control" : 9.452774634155503e-07,
    "continued-1337.ssm.9.candidate" : 0.011922834441065788,
    "continued-1337.ssm.9.control" : 0.006907882168889046,
    "continued-1337.value.11.candidate" : 0.013489208184182644,
    "continued-1337.value.11.control" : 0.010791366919875145,
    "continued-1337.value.15.candidate" : 0.028884463012218475,
    "continued-1337.value.15.control" : 0.017056772485375404,
    "continued-1337.value.19.candidate" : 0.021954718977212906,
    "continued-1337.value.19.control" : 0.03214285895228386,
    "continued-1337.value.23.candidate" : 0.04593023285269737,
    "continued-1337.value.23.control" : 0.0417151153087616,
    "continued-1337.value.27.candidate" : 0.012674825266003609,
    "continued-1337.value.27.control" : 0.014546001330018044,
    "continued-1337.value.3.candidate" : 0,
    "continued-1337.value.3.control" : 0,
    "continued-1337.value.31.candidate" : 0.06331522017717361,
    "continued-1337.value.31.control" : 0.072826087474823,
    "continued-1337.value.35.candidate" : 0.07336956262588501,
    "continued-1337.value.35.control" : 0.06159420311450958,
    "continued-1337.value.39.candidate" : 0.03690476343035698,
    "continued-1337.value.39.control" : 0.0494791679084301,
    "continued-1337.value.43.candidate" : 0.0628930851817131,
    "continued-1337.value.43.control" : 0.07547169923782349,
    "continued-1337.value.47.candidate" : 0.3550295829772949,
    "continued-1337.value.47.control" : 0.23150888085365295,
    "continued-1337.value.7.candidate" : 0.013473053462803364,
    "continued-1337.value.7.control" : 0,
    "continued-2103.conv.0.candidate" : 0,
    "continued-2103.conv.0.control" : 0,
    "continued-2103.conv.1.candidate" : 0,
    "continued-2103.conv.1.control" : 0,
    "continued-2103.conv.10.candidate" : 0.01584506966173649,
    "continued-2103.conv.10.control" : 0.015258216299116611,
    "continued-2103.conv.12.candidate" : 0.007882882840931416,
    "continued-2103.conv.12.control" : 0.006756756920367479,
    "continued-2103.conv.13.candidate" : 0.012162161991000175,
    "continued-2103.conv.13.control" : 0.010135134682059288,
    "continued-2103.conv.14.candidate" : 0.013277201913297176,
    "continued-2103.conv.14.control" : 0.031088082119822502,
    "continued-2103.conv.16.candidate" : 0.017407463863492012,
    "continued-2103.conv.16.control" : 0.02427184395492077,
    "continued-2103.conv.17.candidate" : 0.024358974769711494,
    "continued-2103.conv.17.control" : 0.04242788627743721,
    "continued-2103.conv.18.candidate" : 0.021335482597351074,
    "continued-2103.conv.18.control" : 0.022421523928642273,
    "continued-2103.conv.2.candidate" : 0,
    "continued-2103.conv.2.control" : 0,
    "continued-2103.conv.20.candidate" : 0.028985507786273956,
    "continued-2103.conv.20.control" : 0.030193237587809563,
    "continued-2103.conv.21.candidate" : 0.022269275039434433,
    "continued-2103.conv.21.control" : 0.028037382289767265,
    "continued-2103.conv.22.candidate" : 0.014184396713972092,
    "continued-2103.conv.22.control" : 0.015514184720814228,
    "continued-2103.conv.24.candidate" : 0.03532608598470688,
    "continued-2103.conv.24.control" : 0.027173912152647972,
    "continued-2103.conv.25.candidate" : 0.024038461968302727,
    "continued-2103.conv.25.control" : 0.028846153989434242,
    "continued-2103.conv.26.candidate" : 0.0446428582072258,
    "continued-2103.conv.26.control" : 0.02678571455180645,
    "continued-2103.conv.28.candidate" : 0.08533653616905212,
    "continued-2103.conv.28.control" : 0.03677884489297867,
    "continued-2103.conv.29.candidate" : 0.07779431343078613,
    "continued-2103.conv.29.control" : 0.0714285746216774,
    "continued-2103.conv.30.candidate" : 0.10012438148260117,
    "continued-2103.conv.30.control" : 0.057213928550481796,
    "continued-2103.conv.32.candidate" : 0.08185840398073196,
    "continued-2103.conv.32.control" : 0.0752212405204773,
    "continued-2103.conv.33.candidate" : 0.06145423278212547,
    "continued-2103.conv.33.control" : 0.04773622006177902,
    "continued-2103.conv.34.candidate" : 0.099609375,
    "continued-2103.conv.34.control" : 0.0814732164144516,
    "continued-2103.conv.36.candidate" : 0.11096938699483871,
    "continued-2103.conv.36.control" : 0.07302296161651611,
    "continued-2103.conv.37.candidate" : 0.0714285746216774,
    "continued-2103.conv.37.control" : 0.0625,
    "continued-2103.conv.38.candidate" : 0.04442771151661873,
    "continued-2103.conv.38.control" : 0.08734939992427826,
    "continued-2103.conv.4.candidate" : 0,
    "continued-2103.conv.4.control" : 0,
    "continued-2103.conv.40.candidate" : 0.09840425848960876,
    "continued-2103.conv.40.control" : 0.09142287075519562,
    "continued-2103.conv.41.candidate" : 0.08030523359775543,
    "continued-2103.conv.41.control" : 0.07848837226629257,
    "continued-2103.conv.42.candidate" : 0.06551723927259445,
    "continued-2103.conv.42.control" : 0.05862069129943848,
    "continued-2103.conv.44.candidate" : 0.076636902987957,
    "continued-2103.conv.44.control" : 0.095238097012043,
    "continued-2103.conv.45.candidate" : 0.12232142686843872,
    "continued-2103.conv.45.control" : 0.12678571045398712,
    "continued-2103.conv.46.candidate" : 0.0789930522441864,
    "continued-2103.conv.46.control" : 0.09356725215911865,
    "continued-2103.conv.5.candidate" : 0,
    "continued-2103.conv.5.control" : 0,
    "continued-2103.conv.6.candidate" : 0.005980861373245716,
    "continued-2103.conv.6.control" : 0,
    "continued-2103.conv.8.candidate" : 0.010930164717137814,
    "continued-2103.conv.8.control" : 0,
    "continued-2103.conv.9.candidate" : 0.008463541977107525,
    "continued-2103.conv.9.control" : 0.0052083334885537624,
    "continued-2103.index.11.candidate" : 0.03086419776082039,
    "continued-2103.index.11.control" : 0.013888888992369175,
    "continued-2103.index.15.candidate" : 0.04985954985022545,
    "continued-2103.index.15.control" : 0.03089887648820877,
    "continued-2103.index.19.candidate" : 0.04566210135817528,
    "continued-2103.index.19.control" : 0.0445205494761467,
    "continued-2103.index.23.candidate" : 0.04843749850988388,
    "continued-2103.index.23.control" : 0.02276785671710968,
    "continued-2103.index.27.candidate" : 0.04393564537167549,
    "continued-2103.index.27.control" : 0.037128712981939316,
    "continued-2103.index.3.candidate" : 0.001479289960116148,
    "continued-2103.index.3.control" : 0,
    "continued-2103.index.31.candidate" : 0.1794605851173401,
    "continued-2103.index.31.control" : 0.19605809450149536,
    "continued-2103.index.35.candidate" : 0.14652317762374878,
    "continued-2103.index.35.control" : 0.15169702470302582,
    "continued-2103.index.39.candidate" : 0.04430379718542099,
    "continued-2103.index.39.control" : 0.07515823096036911,
    "continued-2103.index.43.candidate" : 0.04765624925494194,
    "continued-2103.index.43.control" : 0.07187499850988388,
    "continued-2103.index.47.candidate" : 0.11833333224058151,
    "continued-2103.index.47.control" : 0.11666666716337204,
    "continued-2103.index.7.candidate" : 0.012867647223174572,
    "continued-2103.index.7.control" : 0,
    "continued-2103.key.11.candidate" : 0.09158653765916824,
    "continued-2103.key.11.control" : 0.03413461521267891,
    "continued-2103.key.15.candidate" : 0.08188868314027786,
    "continued-2103.key.15.control" : 0.05930656939744949,
    "continued-2103.key.19.candidate" : 0.0859375,
    "continued-2103.key.19.control" : 0.09213361889123917,
    "continued-2103.key.23.candidate" : 0.09833333641290665,
    "continued-2103.key.23.control" : 0.06541666388511658,
    "continued-2103.key.27.candidate" : 0.12664473056793213,
    "continued-2103.key.27.control" : 0.10896381735801697,
    "continued-2103.key.3.candidate" : 0,
    "continued-2103.key.3.control" : 0,
    "continued-2103.key.31.candidate" : 0.1436661034822464,
    "continued-2103.key.31.control" : 0.14901426434516907,
    "continued-2103.key.35.candidate" : 0.19040697813034058,
    "continued-2103.key.35.control" : 0.213662788271904,
    "continued-2103.key.39.candidate" : 0.10507812350988388,
    "continued-2103.key.39.control" : 0.11406250298023224,
    "continued-2103.key.43.candidate" : 0.0892857164144516,
    "continued-2103.key.43.control" : 0.08758503198623657,
    "continued-2103.key.47.candidate" : 0.21296297013759613,
    "continued-2103.key.47.control" : 0.09786522388458252,
    "continued-2103.key.7.candidate" : 0.041086647659540176,
    "continued-2103.key.7.control" : 0,
    "continued-2103.logits.candidate" : 0.10412371158599854,
    "continued-2103.logits.control" : 0.09729381650686264,
    "continued-2103.ple.1.candidate" : 0,
    "continued-2103.ple.1.control" : 0,
    "continued-2103.ssm.0.candidate" : 0,
    "continued-2103.ssm.0.control" : 0,
    "continued-2103.ssm.1.candidate" : 0,
    "continued-2103.ssm.1.control" : 0,
    "continued-2103.ssm.10.candidate" : 0.011998595669865608,
    "continued-2103.ssm.10.control" : 0.009407877922058105,
    "continued-2103.ssm.12.candidate" : 0.0013659774558618665,
    "continued-2103.ssm.12.control" : 0.0011646226048469543,
    "continued-2103.ssm.13.candidate" : 0.015644477680325508,
    "continued-2103.ssm.13.control" : 0.008149847388267517,
    "continued-2103.ssm.14.candidate" : 0.009248350746929646,
    "continued-2103.ssm.14.control" : 0.005370251834392548,
    "continued-2103.ssm.16.candidate" : 0.020999114960432053,
    "continued-2103.ssm.16.control" : 0.031165463849902153,
    "continued-2103.ssm.17.candidate" : 0.04960125684738159,
    "continued-2103.ssm.17.control" : 0.0285192858427763,
    "continued-2103.ssm.18.candidate" : 0.024471838027238846,
    "continued-2103.ssm.18.control" : 0.04279892146587372,
    "continued-2103.ssm.2.candidate" : 0,
    "continued-2103.ssm.2.control" : 0,
    "continued-2103.ssm.20.candidate" : 0.012750333175063133,
    "continued-2103.ssm.20.control" : 0.013267675414681435,
    "continued-2103.ssm.21.candidate" : 0.029057996347546577,
    "continued-2103.ssm.21.control" : 0.011780587024986744,
    "continued-2103.ssm.22.candidate" : 0.0056619890965521336,
    "continued-2103.ssm.22.control" : 0.00357077713124454,
    "continued-2103.ssm.24.candidate" : 0.014858454465866089,
    "continued-2103.ssm.24.control" : 0.01253355760127306,
    "continued-2103.ssm.25.candidate" : 0.059530146420001984,
    "continued-2103.ssm.25.control" : 0.04201075807213783,
    "continued-2103.ssm.26.candidate" : 0.06484311074018478,
    "continued-2103.ssm.26.control" : 0.039298467338085175,
    "continued-2103.ssm.28.candidate" : 0.006083679851144552,
    "continued-2103.ssm.28.control" : 0.005385346710681915,
    "continued-2103.ssm.29.candidate" : 0.08174773305654526,
    "continued-2103.ssm.29.control" : 0.07092992216348648,
    "continued-2103.ssm.30.candidate" : 0.04494684934616089,
    "continued-2103.ssm.30.control" : 0.04586699604988098,
    "continued-2103.ssm.32.candidate" : 0.06989427655935287,
    "continued-2103.ssm.32.control" : 0.053631123155355453,
    "continued-2103.ssm.33.candidate" : 0.1220017820596695,
    "continued-2103.ssm.33.control" : 0.14648748934268951,
    "continued-2103.ssm.34.candidate" : 0.0905192494392395,
    "continued-2103.ssm.34.control" : 0.12021945416927338,
    "continued-2103.ssm.36.candidate" : 0.04646896943449974,
    "continued-2103.ssm.36.control" : 0.08397997170686722,
    "continued-2103.ssm.37.candidate" : 0.08600600063800812,
    "continued-2103.ssm.37.control" : 0.06620132923126221,
    "continued-2103.ssm.38.candidate" : 0.02299419231712818,
    "continued-2103.ssm.38.control" : 0.02472028136253357,
    "continued-2103.ssm.4.candidate" : 0,
    "continued-2103.ssm.4.control" : 0,
    "continued-2103.ssm.40.candidate" : 0.01954561658203602,
    "continued-2103.ssm.40.control" : 0.02741079032421112,
    "continued-2103.ssm.41.candidate" : 0.033464089035987854,
    "continued-2103.ssm.41.control" : 0.021559322252869606,
    "continued-2103.ssm.42.candidate" : 0.03819851204752922,
    "continued-2103.ssm.42.control" : 0.05506773293018341,
    "continued-2103.ssm.44.candidate" : 0.02408159151673317,
    "continued-2103.ssm.44.control" : 0.028637029230594635,
    "continued-2103.ssm.45.candidate" : 0.1394186168909073,
    "continued-2103.ssm.45.control" : 0.17466990649700165,
    "continued-2103.ssm.46.candidate" : 0.1278502196073532,
    "continued-2103.ssm.46.control" : 0.1275632083415985,
    "continued-2103.ssm.5.candidate" : 2.8338854463072494e-05,
    "continued-2103.ssm.5.control" : 0,
    "continued-2103.ssm.6.candidate" : 0.0049362340942025185,
    "continued-2103.ssm.6.control" : 0,
    "continued-2103.ssm.8.candidate" : 0.005929137580096722,
    "continued-2103.ssm.8.control" : 9.516638215245621e-07,
    "continued-2103.ssm.9.candidate" : 0.02123107947409153,
    "continued-2103.ssm.9.control" : 0.004560967441648245,
    "continued-2103.value.11.candidate" : 0.013489208184182644,
    "continued-2103.value.11.control" : 0.010791366919875145,
    "continued-2103.value.15.candidate" : 0.028884463012218475,
    "continued-2103.value.15.control" : 0.017056772485375404,
    "continued-2103.value.19.candidate" : 0.021954718977212906,
    "continued-2103.value.19.control" : 0.03214285895228386,
    "continued-2103.value.23.candidate" : 0.04593023285269737,
    "continued-2103.value.23.control" : 0.0417151153087616,
    "continued-2103.value.27.candidate" : 0.012674825266003609,
    "continued-2103.value.27.control" : 0.014546001330018044,
    "continued-2103.value.3.candidate" : 0,
    "continued-2103.value.3.control" : 0,
    "continued-2103.value.31.candidate" : 0.06331522017717361,
    "continued-2103.value.31.control" : 0.072826087474823,
    "continued-2103.value.35.candidate" : 0.07336956262588501,
    "continued-2103.value.35.control" : 0.06159420311450958,
    "continued-2103.value.39.candidate" : 0.03690476343035698,
    "continued-2103.value.39.control" : 0.0494791679084301,
    "continued-2103.value.43.candidate" : 0.0628930851817131,
    "continued-2103.value.43.control" : 0.07547169923782349,
    "continued-2103.value.47.candidate" : 0.3550295829772949,
    "continued-2103.value.47.control" : 0.23150888085365295,
    "continued-2103.value.7.candidate" : 0.013473053462803364,
    "continued-2103.value.7.control" : 0,
    "continued-907.conv.0.candidate" : 0,
    "continued-907.conv.0.control" : 0,
    "continued-907.conv.1.candidate" : 0,
    "continued-907.conv.1.control" : 0,
    "continued-907.conv.10.candidate" : 0.008004926145076752,
    "continued-907.conv.10.control" : 0.004926108289510012,
    "continued-907.conv.12.candidate" : 0.004545454401522875,
    "continued-907.conv.12.control" : 0.014488636516034603,
    "continued-907.conv.13.candidate" : 0.010182584635913372,
    "continued-907.conv.13.control" : 0.011587078683078289,
    "continued-907.conv.14.candidate" : 0.010302198119461536,
    "continued-907.conv.14.control" : 0.012362637557089329,
    "continued-907.conv.16.candidate" : 0.013227513059973717,
    "continued-907.conv.16.control" : 0.0233134925365448,
    "continued-907.conv.17.candidate" : 0.01801108382642269,
    "continued-907.conv.17.control" : 0.019704433158040047,
    "continued-907.conv.18.candidate" : 0.010555555112659931,
    "continued-907.conv.18.control" : 0.011111111380159855,
    "continued-907.conv.2.candidate" : 0,
    "continued-907.conv.2.control" : 0,
    "continued-907.conv.20.candidate" : 0.02926829271018505,
    "continued-907.conv.20.control" : 0.04085365682840347,
    "continued-907.conv.21.candidate" : 0.022269275039434433,
    "continued-907.conv.21.control" : 0.03504673019051552,
    "continued-907.conv.22.candidate" : 0.012687969952821732,
    "continued-907.conv.22.control" : 0.016917293891310692,
    "continued-907.conv.24.candidate" : 0.0357142873108387,
    "continued-907.conv.24.control" : 0.04670329764485359,
    "continued-907.conv.25.candidate" : 0.023474179208278656,
    "continued-907.conv.25.control" : 0.027582159265875816,
    "continued-907.conv.26.candidate" : 0.04672897234559059,
    "continued-907.conv.26.control" : 0.029534170404076576,
    "continued-907.conv.28.candidate" : 0.08946572244167328,
    "continued-907.conv.28.control" : 0.039818547666072845,
    "continued-907.conv.29.candidate" : 0.08354048430919647,
    "continued-907.conv.29.control" : 0.07670454680919647,
    "continued-907.conv.30.candidate" : 0.09962870925664902,
    "continued-907.conv.30.control" : 0.05693069472908974,
    "continued-907.conv.32.candidate" : 0.08851674944162369,
    "continued-907.conv.32.control" : 0.08133970946073532,
    "continued-907.conv.33.candidate" : 0.06145423278212547,
    "continued-907.conv.33.control" : 0.05708661302924156,
    "continued-907.conv.34.candidate" : 0.09701087325811386,
    "continued-907.conv.34.control" : 0.07934782654047012,
    "continued-907.conv.36.candidate" : 0.10116279125213623,
    "continued-907.conv.36.control" : 0.06656976789236069,
    "continued-907.conv.37.candidate" : 0.06849315017461777,
    "continued-907.conv.37.control" : 0.077625572681427,
    "continued-907.conv.38.candidate" : 0.04667721688747406,
    "continued-907.conv.38.control" : 0.0917721539735794,
    "continued-907.conv.4.candidate" : 0,
    "continued-907.conv.4.control" : 0,
    "continued-907.conv.40.candidate" : 0.10127737373113632,
    "continued-907.conv.40.control" : 0.09409215301275253,
    "continued-907.conv.41.candidate" : 0.08030523359775543,
    "continued-907.conv.41.control" : 0.07848837226629257,
    "continued-907.conv.42.candidate" : 0.06737588346004486,
    "continued-907.conv.42.control" : 0.06560283899307251,
    "continued-907.conv.44.candidate" : 0.10967741906642914,
    "continued-907.conv.44.control" : 0.09677419066429138,
    "continued-907.conv.45.candidate" : 0.12232142686843872,
    "continued-907.conv.45.control" : 0.12678571045398712,
    "continued-907.conv.46.candidate" : 0.08338155597448349,
    "continued-907.conv.46.control" : 0.0868055522441864,
    "continued-907.conv.5.candidate" : 0,
    "continued-907.conv.5.control" : 0,
    "continued-907.conv.6.candidate" : 0.0047846888191998005,
    "continued-907.conv.6.control" : 0,
    "continued-907.conv.8.candidate" : 0.005868544802069664,
    "continued-907.conv.8.control" : 0,
    "continued-907.conv.9.candidate" : 0.005154639016836882,
    "continued-907.conv.9.control" : 0.005154639016836882,
    "continued-907.index.11.candidate" : 0.03086419776082039,
    "continued-907.index.11.control" : 0.013888888992369175,
    "continued-907.index.15.candidate" : 0.04985954985022545,
    "continued-907.index.15.control" : 0.03089887648820877,
    "continued-907.index.19.candidate" : 0.04566210135817528,
    "continued-907.index.19.control" : 0.0445205494761467,
    "continued-907.index.23.candidate" : 0.04843749850988388,
    "continued-907.index.23.control" : 0.02276785671710968,
    "continued-907.index.27.candidate" : 0.04393564537167549,
    "continued-907.index.27.control" : 0.037128712981939316,
    "continued-907.index.3.candidate" : 0.001479289960116148,
    "continued-907.index.3.control" : 0,
    "continued-907.index.31.candidate" : 0.1794605851173401,
    "continued-907.index.31.control" : 0.19605809450149536,
    "continued-907.index.35.candidate" : 0.14652317762374878,
    "continued-907.index.35.control" : 0.15169702470302582,
    "continued-907.index.39.candidate" : 0.04430379718542099,
    "continued-907.index.39.control" : 0.07515823096036911,
    "continued-907.index.43.candidate" : 0.04765624925494194,
    "continued-907.index.43.control" : 0.07187499850988388,
    "continued-907.index.47.candidate" : 0.11833333224058151,
    "continued-907.index.47.control" : 0.11666666716337204,
    "continued-907.index.7.candidate" : 0.012867647223174572,
    "continued-907.index.7.control" : 0,
    "continued-907.key.11.candidate" : 0.09158653765916824,
    "continued-907.key.11.control" : 0.03413461521267891,
    "continued-907.key.15.candidate" : 0.08188868314027786,
    "continued-907.key.15.control" : 0.05930656939744949,
    "continued-907.key.19.candidate" : 0.0859375,
    "continued-907.key.19.control" : 0.09213361889123917,
    "continued-907.key.23.candidate" : 0.09833333641290665,
    "continued-907.key.23.control" : 0.06541666388511658,
    "continued-907.key.27.candidate" : 0.12664473056793213,
    "continued-907.key.27.control" : 0.10896381735801697,
    "continued-907.key.3.candidate" : 0,
    "continued-907.key.3.control" : 0,
    "continued-907.key.31.candidate" : 0.1436661034822464,
    "continued-907.key.31.control" : 0.14901426434516907,
    "continued-907.key.35.candidate" : 0.19040697813034058,
    "continued-907.key.35.control" : 0.213662788271904,
    "continued-907.key.39.candidate" : 0.10507812350988388,
    "continued-907.key.39.control" : 0.11406250298023224,
    "continued-907.key.43.candidate" : 0.0892857164144516,
    "continued-907.key.43.control" : 0.08758503198623657,
    "continued-907.key.47.candidate" : 0.21296297013759613,
    "continued-907.key.47.control" : 0.09786522388458252,
    "continued-907.key.7.candidate" : 0.041086647659540176,
    "continued-907.key.7.control" : 0,
    "continued-907.logits.candidate" : 0.10964912176132202,
    "continued-907.logits.control" : 0.10701754689216614,
    "continued-907.ple.1.candidate" : 0,
    "continued-907.ple.1.control" : 0,
    "continued-907.ssm.0.candidate" : 0,
    "continued-907.ssm.0.control" : 0,
    "continued-907.ssm.1.candidate" : 0,
    "continued-907.ssm.1.control" : 0,
    "continued-907.ssm.10.candidate" : 0.014050903730094433,
    "continued-907.ssm.10.control" : 0.008055453188717365,
    "continued-907.ssm.12.candidate" : 0.001356004737317562,
    "continued-907.ssm.12.control" : 0.002932221395894885,
    "continued-907.ssm.13.candidate" : 0.010054010897874832,
    "continued-907.ssm.13.control" : 0.01993088237941265,
    "continued-907.ssm.14.candidate" : 0.004136876668781042,
    "continued-907.ssm.14.control" : 0.005400707945227623,
    "continued-907.ssm.16.candidate" : 0.01283870730549097,
    "continued-907.ssm.16.control" : 0.028166215866804123,
    "continued-907.ssm.17.candidate" : 0.02476091869175434,
    "continued-907.ssm.17.control" : 0.024336550384759903,
    "continued-907.ssm.18.candidate" : 0.01908751390874386,
    "continued-907.ssm.18.control" : 0.017790907993912697,
    "continued-907.ssm.2.candidate" : 0,
    "continued-907.ssm.2.control" : 0,
    "continued-907.ssm.20.candidate" : 0.017364198341965675,
    "continued-907.ssm.20.control" : 0.02465974912047386,
    "continued-907.ssm.21.candidate" : 0.022077597677707672,
    "continued-907.ssm.21.control" : 0.026389794424176216,
    "continued-907.ssm.22.candidate" : 0.005611239466816187,
    "continued-907.ssm.22.control" : 0.003786894492805004,
    "continued-907.ssm.24.candidate" : 0.033691804856061935,
    "continued-907.ssm.24.control" : 0.02429320104420185,
    "continued-907.ssm.25.candidate" : 0.0362636037170887,
    "continued-907.ssm.25.control" : 0.04649028182029724,
    "continued-907.ssm.26.candidate" : 0.09904762357473373,
    "continued-907.ssm.26.control" : 0.0722435787320137,
    "continued-907.ssm.28.candidate" : 0.005111499223858118,
    "continued-907.ssm.28.control" : 0.00420372886583209,
    "continued-907.ssm.29.candidate" : 0.07196347415447235,
    "continued-907.ssm.29.control" : 0.0511699914932251,
    "continued-907.ssm.30.candidate" : 0.028379295021295547,
    "continued-907.ssm.30.control" : 0.05029706656932831,
    "continued-907.ssm.32.candidate" : 0.046316031366586685,
    "continued-907.ssm.32.control" : 0.065693698823452,
    "continued-907.ssm.33.candidate" : 0.21654033660888672,
    "continued-907.ssm.33.control" : 0.09655304253101349,
    "continued-907.ssm.34.candidate" : 0.14223894476890564,
    "continued-907.ssm.34.control" : 0.07706210017204285,
    "continued-907.ssm.36.candidate" : 0.06492874771356583,
    "continued-907.ssm.36.control" : 0.21558280289173126,
    "continued-907.ssm.37.candidate" : 0.038373399525880814,
    "continued-907.ssm.37.control" : 0.06618130952119827,
    "continued-907.ssm.38.candidate" : 0.022755473852157593,
    "continued-907.ssm.38.control" : 0.02593768760561943,
    "continued-907.ssm.4.candidate" : 0,
    "continued-907.ssm.4.control" : 0,
    "continued-907.ssm.40.candidate" : 0.01941109634935856,
    "continued-907.ssm.40.control" : 0.028272151947021484,
    "continued-907.ssm.41.candidate" : 0.03184276819229126,
    "continued-907.ssm.41.control" : 0.021057913079857826,
    "continued-907.ssm.42.candidate" : 0.028303006663918495,
    "continued-907.ssm.42.control" : 0.027590937912464142,
    "continued-907.ssm.44.candidate" : 0.024075409397482872,
    "continued-907.ssm.44.control" : 0.028128040954470634,
    "continued-907.ssm.45.candidate" : 0.145893394947052,
    "continued-907.ssm.45.control" : 0.1299469918012619,
    "continued-907.ssm.46.candidate" : 0.1668688952922821,
    "continued-907.ssm.46.control" : 0.14846739172935486,
    "continued-907.ssm.5.candidate" : 3.15963952743914e-05,
    "continued-907.ssm.5.control" : 0,
    "continued-907.ssm.6.candidate" : 0.006001689471304417,
    "continued-907.ssm.6.control" : 0,
    "continued-907.ssm.8.candidate" : 0.004029124043881893,
    "continued-907.ssm.8.control" : 9.477923299527902e-07,
    "continued-907.ssm.9.candidate" : 0.006596952211111784,
    "continued-907.ssm.9.control" : 0.004747708328068256,
    "continued-907.value.11.candidate" : 0.013489208184182644,
    "continued-907.value.11.control" : 0.010791366919875145,
    "continued-907.value.15.candidate" : 0.028884463012218475,
    "continued-907.value.15.control" : 0.017056772485375404,
    "continued-907.value.19.candidate" : 0.021954718977212906,
    "continued-907.value.19.control" : 0.03214285895228386,
    "continued-907.value.23.candidate" : 0.04593023285269737,
    "continued-907.value.23.control" : 0.0417151153087616,
    "continued-907.value.27.candidate" : 0.012674825266003609,
    "continued-907.value.27.control" : 0.014546001330018044,
    "continued-907.value.3.candidate" : 0,
    "continued-907.value.3.control" : 0,
    "continued-907.value.31.candidate" : 0.06331522017717361,
    "continued-907.value.31.control" : 0.072826087474823,
    "continued-907.value.35.candidate" : 0.07336956262588501,
    "continued-907.value.35.control" : 0.06159420311450958,
    "continued-907.value.39.candidate" : 0.03690476343035698,
    "continued-907.value.39.control" : 0.0494791679084301,
    "continued-907.value.43.candidate" : 0.0628930851817131,
    "continued-907.value.43.control" : 0.07547169923782349,
    "continued-907.value.47.candidate" : 0.3550295829772949,
    "continued-907.value.47.control" : 0.23150888085365295,
    "continued-907.value.7.candidate" : 0.013473053462803364,
    "continued-907.value.7.control" : 0,
    "prefill.conv.0.candidate" : 0,
    "prefill.conv.0.control" : 0,
    "prefill.conv.1.candidate" : 0,
    "prefill.conv.1.control" : 0,
    "prefill.conv.10.candidate" : 0.0047846888191998005,
    "prefill.conv.10.control" : 0.0023923444095999002,
    "prefill.conv.12.candidate" : 0.004385964944958687,
    "prefill.conv.12.control" : 0.013980262912809849,
    "prefill.conv.13.candidate" : 0.005586592014878988,
    "prefill.conv.13.control" : 0.011522346176207066,
    "prefill.conv.14.candidate" : 0.005291005130857229,
    "prefill.conv.14.control" : 0.012896825559437275,
    "prefill.conv.16.candidate" : 0.012820512987673283,
    "prefill.conv.16.control" : 0.016025641933083534,
    "prefill.conv.17.candidate" : 0.01500923652201891,
    "prefill.conv.17.control" : 0.014162561856210232,
    "prefill.conv.18.candidate" : 0.009688864462077618,
    "prefill.conv.18.control" : 0.013850982300937176,
    "prefill.conv.2.candidate" : 0,
    "prefill.conv.2.control" : 0,
    "prefill.conv.20.candidate" : 0.01097560953348875,
    "prefill.conv.20.control" : 0.04085365682840347,
    "prefill.conv.21.candidate" : 0.009615384973585606,
    "prefill.conv.21.control" : 0.036057692021131516,
    "prefill.conv.22.candidate" : 0.007352941203862429,
    "prefill.conv.22.control" : 0.016544118523597717,
    "prefill.conv.24.candidate" : 0.018465908244252205,
    "prefill.conv.24.control" : 0.04829545319080353,
    "prefill.conv.25.candidate" : 0.011737089604139328,
    "prefill.conv.25.control" : 0.022300468757748604,
    "prefill.conv.26.candidate" : 0.02570093423128128,
    "prefill.conv.26.control" : 0.029534170404076576,
    "prefill.conv.28.candidate" : 0.03654233738780022,
    "prefill.conv.28.control" : 0.039818547666072845,
    "prefill.conv.29.candidate" : 0.05823863670229912,
    "prefill.conv.29.control" : 0.06667258590459824,
    "prefill.conv.30.candidate" : 0.0625,
    "prefill.conv.30.control" : 0.055693067610263824,
    "prefill.conv.32.candidate" : 0.05932203307747841,
    "prefill.conv.32.control" : 0.07070974260568619,
    "prefill.conv.33.candidate" : 0.05864197388291359,
    "prefill.conv.33.control" : 0.05967078357934952,
    "prefill.conv.34.candidate" : 0.062367022037506104,
    "prefill.conv.34.control" : 0.0659574493765831,
    "prefill.conv.36.candidate" : 0.06810897588729858,
    "prefill.conv.36.control" : 0.05635683611035347,
    "prefill.conv.37.candidate" : 0.06221461296081543,
    "prefill.conv.37.control" : 0.077625572681427,
    "prefill.conv.38.candidate" : 0.04141104221343994,
    "prefill.conv.38.control" : 0.0525306761264801,
    "prefill.conv.4.candidate" : 0,
    "prefill.conv.4.control" : 0,
    "prefill.conv.40.candidate" : 0.06843065470457077,
    "prefill.conv.40.control" : 0.07025547325611115,
    "prefill.conv.41.candidate" : 0.08914728462696075,
    "prefill.conv.41.control" : 0.06734496355056763,
    "prefill.conv.42.candidate" : 0.05448717996478081,
    "prefill.conv.42.control" : 0.05929487198591232,
    "prefill.conv.44.candidate" : 0.10967741906642914,
    "prefill.conv.44.control" : 0.09677419066429138,
    "prefill.conv.45.candidate" : 0.06969424337148666,
    "prefill.conv.45.control" : 0.06958183646202087,
    "prefill.conv.46.candidate" : 0.05703125149011612,
    "prefill.conv.46.control" : 0.07822265475988388,
    "prefill.conv.5.candidate" : 0,
    "prefill.conv.5.control" : 0,
    "prefill.conv.6.candidate" : 0.0023923444095999002,
    "prefill.conv.6.control" : 0,
    "prefill.conv.8.candidate" : 0.005025125574320555,
    "prefill.conv.8.control" : 0,
    "prefill.conv.9.candidate" : 0.005154639016836882,
    "prefill.conv.9.control" : 0,
    "prefill.index.11.candidate" : 0.03086419776082039,
    "prefill.index.11.control" : 0.013888888992369175,
    "prefill.index.15.candidate" : 0.04985954985022545,
    "prefill.index.15.control" : 0.03089887648820877,
    "prefill.index.19.candidate" : 0.04566210135817528,
    "prefill.index.19.control" : 0.0445205494761467,
    "prefill.index.23.candidate" : 0.04843749850988388,
    "prefill.index.23.control" : 0.02276785671710968,
    "prefill.index.27.candidate" : 0.04393564537167549,
    "prefill.index.27.control" : 0.037128712981939316,
    "prefill.index.3.candidate" : 0.001479289960116148,
    "prefill.index.3.control" : 0,
    "prefill.index.31.candidate" : 0.1794605851173401,
    "prefill.index.31.control" : 0.19605809450149536,
    "prefill.index.35.candidate" : 0.14652317762374878,
    "prefill.index.35.control" : 0.15169702470302582,
    "prefill.index.39.candidate" : 0.04430379718542099,
    "prefill.index.39.control" : 0.07515823096036911,
    "prefill.index.43.candidate" : 0.04765624925494194,
    "prefill.index.43.control" : 0.07187499850988388,
    "prefill.index.47.candidate" : 0.11833333224058151,
    "prefill.index.47.control" : 0.11666666716337204,
    "prefill.index.7.candidate" : 0.012867647223174572,
    "prefill.index.7.control" : 0,
    "prefill.key.11.candidate" : 0.09158653765916824,
    "prefill.key.11.control" : 0.03413461521267891,
    "prefill.key.15.candidate" : 0.08188868314027786,
    "prefill.key.15.control" : 0.05930656939744949,
    "prefill.key.19.candidate" : 0.0859375,
    "prefill.key.19.control" : 0.09213361889123917,
    "prefill.key.23.candidate" : 0.09833333641290665,
    "prefill.key.23.control" : 0.06541666388511658,
    "prefill.key.27.candidate" : 0.12664473056793213,
    "prefill.key.27.control" : 0.10896381735801697,
    "prefill.key.3.candidate" : 0,
    "prefill.key.3.control" : 0,
    "prefill.key.31.candidate" : 0.1436661034822464,
    "prefill.key.31.control" : 0.14901426434516907,
    "prefill.key.35.candidate" : 0.19040697813034058,
    "prefill.key.35.control" : 0.213662788271904,
    "prefill.key.39.candidate" : 0.10507812350988388,
    "prefill.key.39.control" : 0.11406250298023224,
    "prefill.key.43.candidate" : 0.0892857164144516,
    "prefill.key.43.control" : 0.08758503198623657,
    "prefill.key.47.candidate" : 0.21296297013759613,
    "prefill.key.47.control" : 0.09786522388458252,
    "prefill.key.7.candidate" : 0.041086647659540176,
    "prefill.key.7.control" : 0,
    "prefill.logits.candidate" : 0.11919504404067993,
    "prefill.logits.control" : 0.10681114345788956,
    "prefill.ple.1.candidate" : 0,
    "prefill.ple.1.control" : 0,
    "prefill.ssm.0.candidate" : 0,
    "prefill.ssm.0.control" : 0,
    "prefill.ssm.1.candidate" : 0,
    "prefill.ssm.1.control" : 0,
    "prefill.ssm.10.candidate" : 0.016299240291118622,
    "prefill.ssm.10.control" : 0.0038636515382677317,
    "prefill.ssm.12.candidate" : 0.001379893976263702,
    "prefill.ssm.12.control" : 0.0013274591183289886,
    "prefill.ssm.13.candidate" : 0.007524046581238508,
    "prefill.ssm.13.control" : 0.00896113459020853,
    "prefill.ssm.14.candidate" : 0.004239929374307394,
    "prefill.ssm.14.control" : 0.004692330956459045,
    "prefill.ssm.16.candidate" : 0.009504727087914944,
    "prefill.ssm.16.control" : 0.007526895962655544,
    "prefill.ssm.17.candidate" : 0.011916744522750378,
    "prefill.ssm.17.control" : 0.01633318141102791,
    "prefill.ssm.18.candidate" : 0.01760265976190567,
    "prefill.ssm.18.control" : 0.019592825323343277,
    "prefill.ssm.2.candidate" : 0,
    "prefill.ssm.2.control" : 0,
    "prefill.ssm.20.candidate" : 0.005966728553175926,
    "prefill.ssm.20.control" : 0.008874649181962013,
    "prefill.ssm.21.candidate" : 0.008637295104563236,
    "prefill.ssm.21.control" : 0.013708473183214664,
    "prefill.ssm.22.candidate" : 0.005578243639320135,
    "prefill.ssm.22.control" : 0.0037633648607879877,
    "prefill.ssm.24.candidate" : 0.020849255844950676,
    "prefill.ssm.24.control" : 0.01989121176302433,
    "prefill.ssm.25.candidate" : 0.020323390141129494,
    "prefill.ssm.25.control" : 0.044036321341991425,
    "prefill.ssm.26.candidate" : 0.036231640726327896,
    "prefill.ssm.26.control" : 0.06096608564257622,
    "prefill.ssm.28.candidate" : 0.00511162681505084,
    "prefill.ssm.28.control" : 0.0036538804415613413,
    "prefill.ssm.29.candidate" : 0.04490214213728905,
    "prefill.ssm.29.control" : 0.04074140265583992,
    "prefill.ssm.30.candidate" : 0.036741748452186584,
    "prefill.ssm.30.control" : 0.03186096251010895,
    "prefill.ssm.32.candidate" : 0.08880911022424698,
    "prefill.ssm.32.control" : 0.11297553777694702,
    "prefill.ssm.33.candidate" : 0.0674646645784378,
    "prefill.ssm.33.control" : 0.07643678784370422,
    "prefill.ssm.34.candidate" : 0.06176359951496124,
    "prefill.ssm.34.control" : 0.11365082114934921,
    "prefill.ssm.36.candidate" : 0.08319814503192902,
    "prefill.ssm.36.control" : 0.07293701171875,
    "prefill.ssm.37.candidate" : 0.03297487646341324,
    "prefill.ssm.37.control" : 0.03821268677711487,
    "prefill.ssm.38.candidate" : 0.023304887115955353,
    "prefill.ssm.38.control" : 0.026004239916801453,
    "prefill.ssm.4.candidate" : 0,
    "prefill.ssm.4.control" : 0,
    "prefill.ssm.40.candidate" : 0.019404403865337372,
    "prefill.ssm.40.control" : 0.028296949341893196,
    "prefill.ssm.41.candidate" : 0.033912044018507004,
    "prefill.ssm.41.control" : 0.021679602563381195,
    "prefill.ssm.42.candidate" : 0.04702324420213699,
    "prefill.ssm.42.control" : 0.04219093173742294,
    "prefill.ssm.44.candidate" : 0.03829928860068321,
    "prefill.ssm.44.control" : 0.028147032484412193,
    "prefill.ssm.45.candidate" : 0.1058168038725853,
    "prefill.ssm.45.control" : 0.0839296355843544,
    "prefill.ssm.46.candidate" : 0.19653581082820892,
    "prefill.ssm.46.control" : 0.2359997034072876,
    "prefill.ssm.5.candidate" : 2.909840077336412e-05,
    "prefill.ssm.5.control" : 0,
    "prefill.ssm.6.candidate" : 0.0036011000629514456,
    "prefill.ssm.6.control" : 0,
    "prefill.ssm.8.candidate" : 0.0044950442388653755,
    "prefill.ssm.8.control" : 9.479240929977095e-07,
    "prefill.ssm.9.candidate" : 0.00518636591732502,
    "prefill.ssm.9.control" : 0.0007165002170950174,
    "prefill.value.11.candidate" : 0.013489208184182644,
    "prefill.value.11.control" : 0.010791366919875145,
    "prefill.value.15.candidate" : 0.028884463012218475,
    "prefill.value.15.control" : 0.017056772485375404,
    "prefill.value.19.candidate" : 0.021954718977212906,
    "prefill.value.19.control" : 0.03214285895228386,
    "prefill.value.23.candidate" : 0.04593023285269737,
    "prefill.value.23.control" : 0.0417151153087616,
    "prefill.value.27.candidate" : 0.012674825266003609,
    "prefill.value.27.control" : 0.014546001330018044,
    "prefill.value.3.candidate" : 0,
    "prefill.value.3.control" : 0,
    "prefill.value.31.candidate" : 0.06331522017717361,
    "prefill.value.31.control" : 0.072826087474823,
    "prefill.value.35.candidate" : 0.07336956262588501,
    "prefill.value.35.control" : 0.06159420311450958,
    "prefill.value.39.candidate" : 0.0345982126891613,
    "prefill.value.39.control" : 0.0494791679084301,
    "prefill.value.43.candidate" : 0.05345911905169487,
    "prefill.value.43.control" : 0.04088050499558449,
    "prefill.value.47.candidate" : 0.3550295829772949,
    "prefill.value.47.control" : 0.23150888085365295,
    "prefill.value.7.candidate" : 0.013473053462803364,
    "prefill.value.7.control" : 0,
    "rollback-1.conv.0.candidate" : 0,
    "rollback-1.conv.0.control" : 0,
    "rollback-1.conv.1.candidate" : 0,
    "rollback-1.conv.1.control" : 0,
    "rollback-1.conv.10.candidate" : 0.017605634406208992,
    "rollback-1.conv.10.control" : 0.005465082358568907,
    "rollback-1.conv.12.candidate" : 0.017454955726861954,
    "rollback-1.conv.12.control" : 0.005630630534142256,
    "rollback-1.conv.13.candidate" : 0.02432432398200035,
    "rollback-1.conv.13.control" : 0.010135134682059288,
    "rollback-1.conv.14.candidate" : 0.03815789520740509,
    "rollback-1.conv.14.control" : 0.031578946858644485,
    "rollback-1.conv.16.candidate" : 0.03814338147640228,
    "rollback-1.conv.16.control" : 0.02450980432331562,
    "rollback-1.conv.17.candidate" : 0.057591624557971954,
    "rollback-1.conv.17.control" : 0.04331642761826515,
    "rollback-1.conv.18.candidate" : 0.03862748667597771,
    "rollback-1.conv.18.control" : 0.022727273404598236,
    "rollback-1.conv.2.candidate" : 0,
    "rollback-1.conv.2.control" : 0,
    "rollback-1.conv.20.candidate" : 0.04679802805185318,
    "rollback-1.conv.20.control" : 0.030788177624344826,
    "rollback-1.conv.21.candidate" : 0.03755868598818779,
    "rollback-1.conv.21.control" : 0.018779342994093895,
    "rollback-1.conv.22.candidate" : 0.021276595070958138,
    "rollback-1.conv.22.control" : 0.011829565279185772,
    "rollback-1.conv.24.candidate" : 0.029891304671764374,
    "rollback-1.conv.24.control" : 0.02445652149617672,
    "rollback-1.conv.25.candidate" : 0.0416666679084301,
    "rollback-1.conv.25.control" : 0.02023809589445591,
    "rollback-1.conv.26.candidate" : 0.0513392873108387,
    "rollback-1.conv.26.control" : 0.0373883917927742,
    "rollback-1.conv.28.candidate" : 0.04268292710185051,
    "rollback-1.conv.28.control" : 0.05436991900205612,
    "rollback-1.conv.29.candidate" : 0.0714285746216774,
    "rollback-1.conv.29.control" : 0.07671957463026047,
    "rollback-1.conv.30.candidate" : 0.0703125,
    "rollback-1.conv.30.control" : 0.1015625,
    "rollback-1.conv.32.candidate" : 0.08478260785341263,
    "rollback-1.conv.32.control" : 0.06847826391458511,
    "rollback-1.conv.33.candidate" : 0.08956693112850189,
    "rollback-1.conv.33.control" : 0.0701279491186142,
    "rollback-1.conv.34.candidate" : 0.11622807383537292,
    "rollback-1.conv.34.control" : 0.08298211544752121,
    "rollback-1.conv.36.candidate" : 0.10663507133722305,
    "rollback-1.conv.36.control" : 0.15728673338890076,
    "rollback-1.conv.37.candidate" : 0.11071428656578064,
    "rollback-1.conv.37.control" : 0.104538694024086,
    "rollback-1.conv.38.candidate" : 0.06212121248245239,
    "rollback-1.conv.38.control" : 0.04469696804881096,
    "rollback-1.conv.4.candidate" : 0,
    "rollback-1.conv.4.control" : 0,
    "rollback-1.conv.40.candidate" : 0.11702127754688263,
    "rollback-1.conv.40.control" : 0.1233377680182457,
    "rollback-1.conv.41.candidate" : 0.09930829703807831,
    "rollback-1.conv.41.control" : 0.09584980458021164,
    "rollback-1.conv.42.candidate" : 0.09507042169570923,
    "rollback-1.conv.42.control" : 0.10387323796749115,
    "rollback-1.conv.44.candidate" : 0.1369047611951828,
    "rollback-1.conv.44.control" : 0.1636904776096344,
    "rollback-1.conv.45.candidate" : 0.10249999910593033,
    "rollback-1.conv.45.control" : 0.10437499731779099,
    "rollback-1.conv.46.candidate" : 0.0989304780960083,
    "rollback-1.conv.46.control" : 0.08556149899959564,
    "rollback-1.conv.5.candidate" : 0,
    "rollback-1.conv.5.control" : 0,
    "rollback-1.conv.6.candidate" : 0.01097560953348875,
    "rollback-1.conv.6.control" : 0,
    "rollback-1.conv.8.candidate" : 0.011468595825135708,
    "rollback-1.conv.8.control" : 0,
    "rollback-1.conv.9.candidate" : 0.025273224338889122,
    "rollback-1.conv.9.control" : 0,
    "rollback-1.index.11.candidate" : 0.03086419776082039,
    "rollback-1.index.11.control" : 0.013888888992369175,
    "rollback-1.index.15.candidate" : 0.04985954985022545,
    "rollback-1.index.15.control" : 0.03089887648820877,
    "rollback-1.index.19.candidate" : 0.04566210135817528,
    "rollback-1.index.19.control" : 0.0445205494761467,
    "rollback-1.index.23.candidate" : 0.04843749850988388,
    "rollback-1.index.23.control" : 0.02276785671710968,
    "rollback-1.index.27.candidate" : 0.04393564537167549,
    "rollback-1.index.27.control" : 0.037128712981939316,
    "rollback-1.index.3.candidate" : 0.001479289960116148,
    "rollback-1.index.3.control" : 0,
    "rollback-1.index.31.candidate" : 0.1794605851173401,
    "rollback-1.index.31.control" : 0.19605809450149536,
    "rollback-1.index.35.candidate" : 0.14652317762374878,
    "rollback-1.index.35.control" : 0.15169702470302582,
    "rollback-1.index.39.candidate" : 0.04430379718542099,
    "rollback-1.index.39.control" : 0.07515823096036911,
    "rollback-1.index.43.candidate" : 0.04765624925494194,
    "rollback-1.index.43.control" : 0.07187499850988388,
    "rollback-1.index.47.candidate" : 0.11833333224058151,
    "rollback-1.index.47.control" : 0.11666666716337204,
    "rollback-1.index.7.candidate" : 0.012867647223174572,
    "rollback-1.index.7.control" : 0,
    "rollback-1.key.11.candidate" : 0.09158653765916824,
    "rollback-1.key.11.control" : 0.03413461521267891,
    "rollback-1.key.15.candidate" : 0.08188868314027786,
    "rollback-1.key.15.control" : 0.05930656939744949,
    "rollback-1.key.19.candidate" : 0.0859375,
    "rollback-1.key.19.control" : 0.09213361889123917,
    "rollback-1.key.23.candidate" : 0.09833333641290665,
    "rollback-1.key.23.control" : 0.06541666388511658,
    "rollback-1.key.27.candidate" : 0.12664473056793213,
    "rollback-1.key.27.control" : 0.10896381735801697,
    "rollback-1.key.3.candidate" : 0,
    "rollback-1.key.3.control" : 0,
    "rollback-1.key.31.candidate" : 0.1436661034822464,
    "rollback-1.key.31.control" : 0.14901426434516907,
    "rollback-1.key.35.candidate" : 0.19040697813034058,
    "rollback-1.key.35.control" : 0.213662788271904,
    "rollback-1.key.39.candidate" : 0.11308594048023224,
    "rollback-1.key.39.control" : 0.11406250298023224,
    "rollback-1.key.43.candidate" : 0.0892857164144516,
    "rollback-1.key.43.control" : 0.09183673560619354,
    "rollback-1.key.47.candidate" : 0.21296297013759613,
    "rollback-1.key.47.control" : 0.11072530597448349,
    "rollback-1.key.7.candidate" : 0.041086647659540176,
    "rollback-1.key.7.control" : 0,
    "rollback-1.logits.candidate" : 0.10973967611789703,
    "rollback-1.logits.control" : 0.12028725445270538,
    "rollback-1.ple.1.candidate" : 0,
    "rollback-1.ple.1.control" : 0,
    "rollback-1.ssm.0.candidate" : 0,
    "rollback-1.ssm.0.control" : 0,
    "rollback-1.ssm.1.candidate" : 0,
    "rollback-1.ssm.1.control" : 0,
    "rollback-1.ssm.10.candidate" : 0.038488030433654785,
    "rollback-1.ssm.10.control" : 0.009438063949346542,
    "rollback-1.ssm.12.candidate" : 0.003591698594391346,
    "rollback-1.ssm.12.control" : 0.0026818979531526566,
    "rollback-1.ssm.13.candidate" : 0.030375108122825623,
    "rollback-1.ssm.13.control" : 0.011135676875710487,
    "rollback-1.ssm.14.candidate" : 0.011718735098838806,
    "rollback-1.ssm.14.control" : 0.009318400174379349,
    "rollback-1.ssm.16.candidate" : 0.056262820959091187,
    "rollback-1.ssm.16.control" : 0.025126270949840546,
    "rollback-1.ssm.17.candidate" : 0.049261510372161865,
    "rollback-1.ssm.17.control" : 0.026340575888752937,
    "rollback-1.ssm.18.candidate" : 0.0567813478410244,
    "rollback-1.ssm.18.control" : 0.03297446295619011,
    "rollback-1.ssm.2.candidate" : 0,
    "rollback-1.ssm.2.control" : 0,
    "rollback-1.ssm.20.candidate" : 0.026672400534152985,
    "rollback-1.ssm.20.control" : 0.019522663205862045,
    "rollback-1.ssm.21.candidate" : 0.014372038654983044,
    "rollback-1.ssm.21.control" : 0.011369375512003899,
    "rollback-1.ssm.22.candidate" : 0.005492490250617266,
    "rollback-1.ssm.22.control" : 0.003483425360172987,
    "rollback-1.ssm.24.candidate" : 0.029211845248937607,
    "rollback-1.ssm.24.control" : 0.019101383164525032,
    "rollback-1.ssm.25.candidate" : 0.10360472649335861,
    "rollback-1.ssm.25.control" : 0.05291891098022461,
    "rollback-1.ssm.26.candidate" : 0.06149054318666458,
    "rollback-1.ssm.26.control" : 0.06445784121751785,
    "rollback-1.ssm.28.candidate" : 0.005833746865391731,
    "rollback-1.ssm.28.control" : 0.004319107625633478,
    "rollback-1.ssm.29.candidate" : 0.07548607885837555,
    "rollback-1.ssm.29.control" : 0.07453969120979309,
    "rollback-1.ssm.30.candidate" : 0.08027821779251099,
    "rollback-1.ssm.30.control" : 0.051076602190732956,
    "rollback-1.ssm.32.candidate" : 0.20917218923568726,
    "rollback-1.ssm.32.control" : 0.1482885330915451,
    "rollback-1.ssm.33.candidate" : 0.08142773807048798,
    "rollback-1.ssm.33.control" : 0.08754516392946243,
    "rollback-1.ssm.34.candidate" : 0.15170124173164368,
    "rollback-1.ssm.34.control" : 0.10217013210058212,
    "rollback-1.ssm.36.candidate" : 0.09676819294691086,
    "rollback-1.ssm.36.control" : 0.11649440228939056,
    "rollback-1.ssm.37.candidate" : 0.0822695642709732,
    "rollback-1.ssm.37.control" : 0.1195233017206192,
    "rollback-1.ssm.38.candidate" : 0.0193987637758255,
    "rollback-1.ssm.38.control" : 0.0222556721419096,
    "rollback-1.ssm.4.candidate" : 0,
    "rollback-1.ssm.4.control" : 0,
    "rollback-1.ssm.40.candidate" : 0.0262050349265337,
    "rollback-1.ssm.40.control" : 0.025919819250702858,
    "rollback-1.ssm.41.candidate" : 0.03271828219294548,
    "rollback-1.ssm.41.control" : 0.02337496727705002,
    "rollback-1.ssm.42.candidate" : 0.06077048182487488,
    "rollback-1.ssm.42.control" : 0.12465807050466537,
    "rollback-1.ssm.44.candidate" : 0.036525532603263855,
    "rollback-1.ssm.44.control" : 0.04653371125459671,
    "rollback-1.ssm.45.candidate" : 0.12923306226730347,
    "rollback-1.ssm.45.control" : 0.2061835378408432,
    "rollback-1.ssm.46.candidate" : 0.12761716544628143,
    "rollback-1.ssm.46.control" : 0.14527957141399384,
    "rollback-1.ssm.5.candidate" : 3.162374923704192e-05,
    "rollback-1.ssm.5.control" : 0,
    "rollback-1.ssm.6.candidate" : 0.009536011144518852,
    "rollback-1.ssm.6.control" : 0,
    "rollback-1.ssm.8.candidate" : 0.006958138197660446,
    "rollback-1.ssm.8.control" : 9.49848583786661e-07,
    "rollback-1.ssm.9.candidate" : 0.03701417148113251,
    "rollback-1.ssm.9.control" : 0.0032079708762466908,
    "rollback-1.value.11.candidate" : 0.013489208184182644,
    "rollback-1.value.11.control" : 0.010791366919875145,
    "rollback-1.value.15.candidate" : 0.029195716604590416,
    "rollback-1.value.15.control" : 0.017056772485375404,
    "rollback-1.value.19.candidate" : 0.021954718977212906,
    "rollback-1.value.19.control" : 0.03214285895228386,
    "rollback-1.value.23.candidate" : 0.04593023285269737,
    "rollback-1.value.23.control" : 0.0417151153087616,
    "rollback-1.value.27.candidate" : 0.012674825266003609,
    "rollback-1.value.27.control" : 0.014546001330018044,
    "rollback-1.value.3.candidate" : 0,
    "rollback-1.value.3.control" : 0,
    "rollback-1.value.31.candidate" : 0.06331522017717361,
    "rollback-1.value.31.control" : 0.072826087474823,
    "rollback-1.value.35.candidate" : 0.07336956262588501,
    "rollback-1.value.35.control" : 0.06159420311450958,
    "rollback-1.value.39.candidate" : 0.0446428582072258,
    "rollback-1.value.39.control" : 0.0625,
    "rollback-1.value.43.candidate" : 0.0628930851817131,
    "rollback-1.value.43.control" : 0.07547169923782349,
    "rollback-1.value.47.candidate" : 0.38176947832107544,
    "rollback-1.value.47.control" : 0.2965976297855377,
    "rollback-1.value.7.candidate" : 0.013473053462803364,
    "rollback-1.value.7.control" : 0,
    "rollback-2.conv.0.candidate" : 0,
    "rollback-2.conv.0.control" : 0,
    "rollback-2.conv.1.candidate" : 0,
    "rollback-2.conv.1.control" : 0,
    "rollback-2.conv.10.candidate" : 0.018115941435098648,
    "rollback-2.conv.10.control" : 0.012077294290065765,
    "rollback-2.conv.12.candidate" : 0.024886878207325935,
    "rollback-2.conv.12.control" : 0.011312217451632023,
    "rollback-2.conv.13.candidate" : 0.024566473439335823,
    "rollback-2.conv.13.control" : 0.012283236719667912,
    "rollback-2.conv.14.candidate" : 0.03076923079788685,
    "rollback-2.conv.14.control" : 0.023076923564076424,
    "rollback-2.conv.16.candidate" : 0.027093596756458282,
    "rollback-2.conv.16.control" : 0.017241379246115685,
    "rollback-2.conv.17.candidate" : 0.03509489446878433,
    "rollback-2.conv.17.control" : 0.02585078589618206,
    "rollback-2.conv.18.candidate" : 0.03295454382896423,
    "rollback-2.conv.18.control" : 0.0286931823939085,
    "rollback-2.conv.2.candidate" : 0,
    "rollback-2.conv.2.control" : 0,
    "rollback-2.conv.20.candidate" : 0.05693069472908974,
    "rollback-2.conv.20.control" : 0.030940594151616096,
    "rollback-2.conv.21.candidate" : 0.0404929593205452,
    "rollback-2.conv.21.control" : 0.03403756022453308,
    "rollback-2.conv.22.candidate" : 0.019281914457678795,
    "rollback-2.conv.22.control" : 0.017515791580080986,
    "rollback-2.conv.24.candidate" : 0.04371584579348564,
    "rollback-2.conv.24.control" : 0.03620218485593796,
    "rollback-2.conv.25.candidate" : 0.0446428582072258,
    "rollback-2.conv.25.control" : 0.04226190596818924,
    "rollback-2.conv.26.candidate" : 0.05528846010565758,
    "rollback-2.conv.26.control" : 0.040264423936605453,
    "rollback-2.conv.28.candidate" : 0.04285714402794838,
    "rollback-2.conv.28.control" : 0.054591838270425797,
    "rollback-2.conv.29.candidate" : 0.06891892105340958,
    "rollback-2.conv.29.control" : 0.07837837934494019,
    "rollback-2.conv.30.candidate" : 0.08568548411130905,
    "rollback-2.conv.30.control" : 0.10483870655298233,
    "rollback-2.conv.32.candidate" : 0.09154929220676422,
    "rollback-2.conv.32.control" : 0.07394365966320038,
    "rollback-2.conv.33.candidate" : 0.08267716318368912,
    "rollback-2.conv.33.control" : 0.0701279491186142,
    "rollback-2.conv.34.candidate" : 0.1142241358757019,
    "rollback-2.conv.34.control" : 0.08155138790607452,
    "rollback-2.conv.36.candidate" : 0.11194030195474625,
    "rollback-2.conv.36.control" : 0.1651119440793991,
    "rollback-2.conv.37.candidate" : 0.10064934939146042,
    "rollback-2.conv.37.control" : 0.09503517299890518,
    "rollback-2.conv.38.candidate" : 0.07012195140123367,
    "rollback-2.conv.38.control" : 0.0518292672932148,
    "rollback-2.conv.4.candidate" : 0,
    "rollback-2.conv.4.control" : 0,
    "rollback-2.conv.40.candidate" : 0.12410714477300644,
    "rollback-2.conv.40.control" : 0.12421874701976776,
    "rollback-2.conv.41.candidate" : 0.09663461893796921,
    "rollback-2.conv.41.control" : 0.0932692289352417,
    "rollback-2.conv.42.candidate" : 0.08774834126234055,
    "rollback-2.conv.42.control" : 0.09768211841583252,
    "rollback-2.conv.44.candidate" : 0.16772152483463287,
    "rollback-2.conv.44.control" : 0.12974683940410614,
    "rollback-2.conv.45.candidate" : 0.10249999910593033,
    "rollback-2.conv.45.control" : 0.07656250149011612,
    "rollback-2.conv.46.candidate" : 0.09189189225435257,
    "rollback-2.conv.46.control" : 0.10000000149011612,
    "rollback-2.conv.5.candidate" : 0,
    "rollback-2.conv.5.control" : 0,
    "rollback-2.conv.6.candidate" : 0.011029412038624287,
    "rollback-2.conv.6.control" : 0,
    "rollback-2.conv.8.candidate" : 0.007233104202896357,
    "rollback-2.conv.8.control" : 0,
    "rollback-2.conv.9.candidate" : 0.02569444477558136,
    "rollback-2.conv.9.control" : 0,
    "rollback-2.index.11.candidate" : 0.03086419776082039,
    "rollback-2.index.11.control" : 0.013888888992369175,
    "rollback-2.index.15.candidate" : 0.04985954985022545,
    "rollback-2.index.15.control" : 0.03089887648820877,
    "rollback-2.index.19.candidate" : 0.04566210135817528,
    "rollback-2.index.19.control" : 0.0445205494761467,
    "rollback-2.index.23.candidate" : 0.04843749850988388,
    "rollback-2.index.23.control" : 0.02276785671710968,
    "rollback-2.index.27.candidate" : 0.04393564537167549,
    "rollback-2.index.27.control" : 0.037128712981939316,
    "rollback-2.index.3.candidate" : 0.001479289960116148,
    "rollback-2.index.3.control" : 0,
    "rollback-2.index.31.candidate" : 0.1794605851173401,
    "rollback-2.index.31.control" : 0.19605809450149536,
    "rollback-2.index.35.candidate" : 0.14652317762374878,
    "rollback-2.index.35.control" : 0.15169702470302582,
    "rollback-2.index.39.candidate" : 0.04430379718542099,
    "rollback-2.index.39.control" : 0.07515823096036911,
    "rollback-2.index.43.candidate" : 0.04765624925494194,
    "rollback-2.index.43.control" : 0.07187499850988388,
    "rollback-2.index.47.candidate" : 0.11833333224058151,
    "rollback-2.index.47.control" : 0.11666666716337204,
    "rollback-2.index.7.candidate" : 0.012867647223174572,
    "rollback-2.index.7.control" : 0,
    "rollback-2.key.11.candidate" : 0.09158653765916824,
    "rollback-2.key.11.control" : 0.03413461521267891,
    "rollback-2.key.15.candidate" : 0.08188868314027786,
    "rollback-2.key.15.control" : 0.05930656939744949,
    "rollback-2.key.19.candidate" : 0.0859375,
    "rollback-2.key.19.control" : 0.09213361889123917,
    "rollback-2.key.23.candidate" : 0.09833333641290665,
    "rollback-2.key.23.control" : 0.06541666388511658,
    "rollback-2.key.27.candidate" : 0.12664473056793213,
    "rollback-2.key.27.control" : 0.10896381735801697,
    "rollback-2.key.3.candidate" : 0,
    "rollback-2.key.3.control" : 0,
    "rollback-2.key.31.candidate" : 0.1436661034822464,
    "rollback-2.key.31.control" : 0.14901426434516907,
    "rollback-2.key.35.candidate" : 0.19040697813034058,
    "rollback-2.key.35.control" : 0.213662788271904,
    "rollback-2.key.39.candidate" : 0.11308594048023224,
    "rollback-2.key.39.control" : 0.11406250298023224,
    "rollback-2.key.43.candidate" : 0.10905612260103226,
    "rollback-2.key.43.control" : 0.09433460980653763,
    "rollback-2.key.47.candidate" : 0.21296297013759613,
    "rollback-2.key.47.control" : 0.11072530597448349,
    "rollback-2.key.7.candidate" : 0.041086647659540176,
    "rollback-2.key.7.control" : 0,
    "rollback-2.logits.candidate" : 0.09362322837114334,
    "rollback-2.logits.control" : 0.0950811356306076,
    "rollback-2.ple.1.candidate" : 0,
    "rollback-2.ple.1.control" : 0,
    "rollback-2.ssm.0.candidate" : 0,
    "rollback-2.ssm.0.control" : 0,
    "rollback-2.ssm.1.candidate" : 0,
    "rollback-2.ssm.1.control" : 0,
    "rollback-2.ssm.10.candidate" : 0.014463994652032852,
    "rollback-2.ssm.10.control" : 0.008286555297672749,
    "rollback-2.ssm.12.candidate" : 0.002703837351873517,
    "rollback-2.ssm.12.control" : 0.004054144024848938,
    "rollback-2.ssm.13.candidate" : 0.038982514292001724,
    "rollback-2.ssm.13.control" : 0.011599944904446602,
    "rollback-2.ssm.14.candidate" : 0.014064083807170391,
    "rollback-2.ssm.14.control" : 0.008571170270442963,
    "rollback-2.ssm.16.candidate" : 0.020307186990976334,
    "rollback-2.ssm.16.control" : 0.023697061464190483,
    "rollback-2.ssm.17.candidate" : 0.048132941126823425,
    "rollback-2.ssm.17.control" : 0.034377824515104294,
    "rollback-2.ssm.18.candidate" : 0.03732742369174957,
    "rollback-2.ssm.18.control" : 0.03482795134186745,
    "rollback-2.ssm.2.candidate" : 0,
    "rollback-2.ssm.2.control" : 0,
    "rollback-2.ssm.20.candidate" : 0.014113792218267918,
    "rollback-2.ssm.20.control" : 0.010010099038481712,
    "rollback-2.ssm.21.candidate" : 0.026993760839104652,
    "rollback-2.ssm.21.control" : 0.016638923436403275,
    "rollback-2.ssm.22.candidate" : 0.007527681067585945,
    "rollback-2.ssm.22.control" : 0.003252446884289384,
    "rollback-2.ssm.24.candidate" : 0.026453200727701187,
    "rollback-2.ssm.24.control" : 0.018920836970210075,
    "rollback-2.ssm.25.candidate" : 0.06467095762491226,
    "rollback-2.ssm.25.control" : 0.043438248336315155,
    "rollback-2.ssm.26.candidate" : 0.0745721310377121,
    "rollback-2.ssm.26.control" : 0.07812841981649399,
    "rollback-2.ssm.28.candidate" : 0.005203597247600555,
    "rollback-2.ssm.28.control" : 0.0037894139531999826,
    "rollback-2.ssm.29.candidate" : 0.07869324833154678,
    "rollback-2.ssm.29.control" : 0.055060919374227524,
    "rollback-2.ssm.30.candidate" : 0.08954343944787979,
    "rollback-2.ssm.30.control" : 0.030681753531098366,
    "rollback-2.ssm.32.candidate" : 0.07580220699310303,
    "rollback-2.ssm.32.control" : 0.062347397208213806,
    "rollback-2.ssm.33.candidate" : 0.11424876749515533,
    "rollback-2.ssm.33.control" : 0.0854666456580162,
    "rollback-2.ssm.34.candidate" : 0.10423333197832108,
    "rollback-2.ssm.34.control" : 0.09039344638586044,
    "rollback-2.ssm.36.candidate" : 0.06623061746358871,
    "rollback-2.ssm.36.control" : 0.10472457855939865,
    "rollback-2.ssm.37.candidate" : 0.20705460011959076,
    "rollback-2.ssm.37.control" : 0.11167700588703156,
    "rollback-2.ssm.38.candidate" : 0.02385893650352955,
    "rollback-2.ssm.38.control" : 0.02426041290163994,
    "rollback-2.ssm.4.candidate" : 0,
    "rollback-2.ssm.4.control" : 0,
    "rollback-2.ssm.40.candidate" : 0.01982325315475464,
    "rollback-2.ssm.40.control" : 0.027036301791667938,
    "rollback-2.ssm.41.candidate" : 0.03247678652405739,
    "rollback-2.ssm.41.control" : 0.023284321650862694,
    "rollback-2.ssm.42.candidate" : 0.06137028709053993,
    "rollback-2.ssm.42.control" : 0.06792883574962616,
    "rollback-2.ssm.44.candidate" : 0.0325947143137455,
    "rollback-2.ssm.44.control" : 0.028299976140260696,
    "rollback-2.ssm.45.candidate" : 0.10496456176042557,
    "rollback-2.ssm.45.control" : 0.13055308163166046,
    "rollback-2.ssm.46.candidate" : 0.12538957595825195,
    "rollback-2.ssm.46.control" : 0.12158092856407166,
    "rollback-2.ssm.5.candidate" : 3.2678864954505116e-05,
    "rollback-2.ssm.5.control" : 0,
    "rollback-2.ssm.6.candidate" : 0.005637730471789837,
    "rollback-2.ssm.6.control" : 0,
    "rollback-2.ssm.8.candidate" : 0.006040974520146847,
    "rollback-2.ssm.8.control" : 9.461443255531776e-07,
    "rollback-2.ssm.9.candidate" : 0.02301143854856491,
    "rollback-2.ssm.9.control" : 0.0028131133876740932,
    "rollback-2.value.11.candidate" : 0.013489208184182644,
    "rollback-2.value.11.control" : 0.010791366919875145,
    "rollback-2.value.15.candidate" : 0.028884463012218475,
    "rollback-2.value.15.control" : 0.017056772485375404,
    "rollback-2.value.19.candidate" : 0.021954718977212906,
    "rollback-2.value.19.control" : 0.03214285895228386,
    "rollback-2.value.23.candidate" : 0.04593023285269737,
    "rollback-2.value.23.control" : 0.0417151153087616,
    "rollback-2.value.27.candidate" : 0.012674825266003609,
    "rollback-2.value.27.control" : 0.014546001330018044,
    "rollback-2.value.3.candidate" : 0,
    "rollback-2.value.3.control" : 0,
    "rollback-2.value.31.candidate" : 0.06331522017717361,
    "rollback-2.value.31.control" : 0.072826087474823,
    "rollback-2.value.35.candidate" : 0.07336956262588501,
    "rollback-2.value.35.control" : 0.06159420311450958,
    "rollback-2.value.39.candidate" : 0.03690476343035698,
    "rollback-2.value.39.control" : 0.0494791679084301,
    "rollback-2.value.43.candidate" : 0.0628930851817131,
    "rollback-2.value.43.control" : 0.07547169923782349,
    "rollback-2.value.47.candidate" : 0.3550295829772949,
    "rollback-2.value.47.control" : 0.23150888085365295,
    "rollback-2.value.7.candidate" : 0.013473053462803364,
    "rollback-2.value.7.control" : 0,
    "rollback-3.conv.0.candidate" : 0,
    "rollback-3.conv.0.control" : 0,
    "rollback-3.conv.1.candidate" : 0,
    "rollback-3.conv.1.control" : 0,
    "rollback-3.conv.10.candidate" : 0.012077294290065765,
    "rollback-3.conv.10.control" : 0.005236639641225338,
    "rollback-3.conv.12.candidate" : 0.013574660755693913,
    "rollback-3.conv.12.control" : 0.011312217451632023,
    "rollback-3.conv.13.candidate" : 0.017045455053448677,
    "rollback-3.conv.13.control" : 0.01278409082442522,
    "rollback-3.conv.14.candidate" : 0.023076923564076424,
    "rollback-3.conv.14.control" : 0.023076923564076424,
    "rollback-3.conv.16.candidate" : 0.029556650668382645,
    "rollback-3.conv.16.control" : 0.01662561483681202,
    "rollback-3.conv.17.candidate" : 0.03074866347014904,
    "rollback-3.conv.17.control" : 0.026403743773698807,
    "rollback-3.conv.18.candidate" : 0.021590908989310265,
    "rollback-3.conv.18.control" : 0.017045455053448677,
    "rollback-3.conv.2.candidate" : 0,
    "rollback-3.conv.2.control" : 0,
    "rollback-3.conv.20.candidate" : 0.07858911156654358,
    "rollback-3.conv.20.control" : 0.047029703855514526,
    "rollback-3.conv.21.candidate" : 0.036358173936605453,
    "rollback-3.conv.21.control" : 0.032451923936605453,
    "rollback-3.conv.22.candidate" : 0.017287233844399452,
    "rollback-3.conv.22.control" : 0.013076241128146648,
    "rollback-3.conv.24.candidate" : 0.040697675198316574,
    "rollback-3.conv.24.control" : 0.025413336232304573,
    "rollback-3.conv.25.candidate" : 0.043062202632427216,
    "rollback-3.conv.25.control" : 0.02033492736518383,
    "rollback-3.conv.26.candidate" : 0.04139122739434242,
    "rollback-3.conv.26.control" : 0.026742788031697273,
    "rollback-3.conv.28.candidate" : 0.02908163331449032,
    "rollback-3.conv.28.control" : 0.029591836035251617,
    "rollback-3.conv.29.candidate" : 0.060650888830423355,
    "rollback-3.conv.29.control" : 0.0747041404247284,
    "rollback-3.conv.30.candidate" : 0.07307692617177963,
    "rollback-3.conv.30.control" : 0.06794872134923935,
    "rollback-3.conv.32.candidate" : 0.09282700717449188,
    "rollback-3.conv.32.control" : 0.08728902786970139,
    "rollback-3.conv.33.candidate" : 0.0721982792019844,
    "rollback-3.conv.33.control" : 0.06923491507768631,
    "rollback-3.conv.34.candidate" : 0.08508403599262238,
    "rollback-3.conv.34.control" : 0.08534663915634155,
    "rollback-3.conv.36.candidate" : 0.08640553057193756,
    "rollback-3.conv.36.control" : 0.08294931054115295,
    "rollback-3.conv.37.candidate" : 0.06872294098138809,
    "rollback-3.conv.37.control" : 0.05248917639255524,
    "rollback-3.conv.38.candidate" : 0.07012195140123367,
    "rollback-3.conv.38.control" : 0.0518292672932148,
    "rollback-3.conv.4.candidate" : 0,
    "rollback-3.conv.4.control" : 0,
    "rollback-3.conv.40.candidate" : 0.08169642835855484,
    "rollback-3.conv.40.control" : 0.0848214253783226,
    "rollback-3.conv.41.candidate" : 0.07707510143518448,
    "rollback-3.conv.41.control" : 0.06916996091604233,
    "rollback-3.conv.42.candidate" : 0.06581126153469086,
    "rollback-3.conv.42.control" : 0.05887831002473831,
    "rollback-3.conv.44.candidate" : 0.1666666716337204,
    "rollback-3.conv.44.control" : 0.07232704758644104,
    "rollback-3.conv.45.candidate" : 0.07080419361591339,
    "rollback-3.conv.45.control" : 0.054632868617773056,
    "rollback-3.conv.46.candidate" : 0.06351350992918015,
    "rollback-3.conv.46.control" : 0.0648648664355278,
    "rollback-3.conv.5.candidate" : 0,
    "rollback-3.conv.5.control" : 0,
    "rollback-3.conv.6.candidate" : 0.004878048785030842,
    "rollback-3.conv.6.control" : 0,
    "rollback-3.conv.8.candidate" : 0.007097271271049976,
    "rollback-3.conv.8.control" : 0,
    "rollback-3.conv.9.candidate" : 0.021739130839705467,
    "rollback-3.conv.9.control" : 0.005434782709926367,
    "rollback-3.index.11.candidate" : 0.03086419776082039,
    "rollback-3.index.11.control" : 0.013888888992369175,
    "rollback-3.index.15.candidate" : 0.04985954985022545,
    "rollback-3.index.15.control" : 0.03089887648820877,
    "rollback-3.index.19.candidate" : 0.04566210135817528,
    "rollback-3.index.19.control" : 0.0445205494761467,
    "rollback-3.index.23.candidate" : 0.04843749850988388,
    "rollback-3.index.23.control" : 0.02276785671710968,
    "rollback-3.index.27.candidate" : 0.04393564537167549,
    "rollback-3.index.27.control" : 0.037128712981939316,
    "rollback-3.index.3.candidate" : 0.001479289960116148,
    "rollback-3.index.3.control" : 0,
    "rollback-3.index.31.candidate" : 0.1794605851173401,
    "rollback-3.index.31.control" : 0.19605809450149536,
    "rollback-3.index.35.candidate" : 0.14652317762374878,
    "rollback-3.index.35.control" : 0.15169702470302582,
    "rollback-3.index.39.candidate" : 0.04430379718542099,
    "rollback-3.index.39.control" : 0.07515823096036911,
    "rollback-3.index.43.candidate" : 0.04765624925494194,
    "rollback-3.index.43.control" : 0.07187499850988388,
    "rollback-3.index.47.candidate" : 0.11833333224058151,
    "rollback-3.index.47.control" : 0.11666666716337204,
    "rollback-3.index.7.candidate" : 0.012867647223174572,
    "rollback-3.index.7.control" : 0,
    "rollback-3.key.11.candidate" : 0.09158653765916824,
    "rollback-3.key.11.control" : 0.03413461521267891,
    "rollback-3.key.15.candidate" : 0.08188868314027786,
    "rollback-3.key.15.control" : 0.05930656939744949,
    "rollback-3.key.19.candidate" : 0.0859375,
    "rollback-3.key.19.control" : 0.09213361889123917,
    "rollback-3.key.23.candidate" : 0.09833333641290665,
    "rollback-3.key.23.control" : 0.06541666388511658,
    "rollback-3.key.27.candidate" : 0.12664473056793213,
    "rollback-3.key.27.control" : 0.10896381735801697,
    "rollback-3.key.3.candidate" : 0,
    "rollback-3.key.3.control" : 0,
    "rollback-3.key.31.candidate" : 0.1436661034822464,
    "rollback-3.key.31.control" : 0.14901426434516907,
    "rollback-3.key.35.candidate" : 0.19040697813034058,
    "rollback-3.key.35.control" : 0.213662788271904,
    "rollback-3.key.39.candidate" : 0.11308594048023224,
    "rollback-3.key.39.control" : 0.11406250298023224,
    "rollback-3.key.43.candidate" : 0.13196216523647308,
    "rollback-3.key.43.control" : 0.0892857164144516,
    "rollback-3.key.47.candidate" : 0.21296297013759613,
    "rollback-3.key.47.control" : 0.11072530597448349,
    "rollback-3.key.7.candidate" : 0.041086647659540176,
    "rollback-3.key.7.control" : 0,
    "rollback-3.logits.candidate" : 0.10543893277645111,
    "rollback-3.logits.control" : 0.08015266805887222,
    "rollback-3.ple.1.candidate" : 0,
    "rollback-3.ple.1.control" : 0,
    "rollback-3.ssm.0.candidate" : 0,
    "rollback-3.ssm.0.control" : 0,
    "rollback-3.ssm.1.candidate" : 0,
    "rollback-3.ssm.1.control" : 0,
    "rollback-3.ssm.10.candidate" : 0.032438844442367554,
    "rollback-3.ssm.10.control" : 0.01215583086013794,
    "rollback-3.ssm.12.candidate" : 0.0029803456272929907,
    "rollback-3.ssm.12.control" : 0.0015523579204455018,
    "rollback-3.ssm.13.candidate" : 0.01983049511909485,
    "rollback-3.ssm.13.control" : 0.01133750006556511,
    "rollback-3.ssm.14.candidate" : 0.010367841459810734,
    "rollback-3.ssm.14.control" : 0.008393186144530773,
    "rollback-3.ssm.16.candidate" : 0.04629676789045334,
    "rollback-3.ssm.16.control" : 0.02709614485502243,
    "rollback-3.ssm.17.candidate" : 0.03386036306619644,
    "rollback-3.ssm.17.control" : 0.021923786029219627,
    "rollback-3.ssm.18.candidate" : 0.041865576058626175,
    "rollback-3.ssm.18.control" : 0.019926315173506737,
    "rollback-3.ssm.2.candidate" : 0,
    "rollback-3.ssm.2.control" : 0,
    "rollback-3.ssm.20.candidate" : 0.035104770213365555,
    "rollback-3.ssm.20.control" : 0.022324558347463608,
    "rollback-3.ssm.21.candidate" : 0.01712137833237648,
    "rollback-3.ssm.21.control" : 0.011454805731773376,
    "rollback-3.ssm.22.candidate" : 0.005530104506760836,
    "rollback-3.ssm.22.control" : 0.003465141635388136,
    "rollback-3.ssm.24.candidate" : 0.035002563148736954,
    "rollback-3.ssm.24.control" : 0.019002093002200127,
    "rollback-3.ssm.25.candidate" : 0.07210097461938858,
    "rollback-3.ssm.25.control" : 0.04831517115235329,
    "rollback-3.ssm.26.candidate" : 0.17417828738689423,
    "rollback-3.ssm.26.control" : 0.06596001982688904,
    "rollback-3.ssm.28.candidate" : 0.005178334657102823,
    "rollback-3.ssm.28.control" : 0.0035594624932855368,
    "rollback-3.ssm.29.candidate" : 0.06791247427463531,
    "rollback-3.ssm.29.control" : 0.05225862190127373,
    "rollback-3.ssm.30.candidate" : 0.03733590617775917,
    "rollback-3.ssm.30.control" : 0.026170946657657623,
    "rollback-3.ssm.32.candidate" : 0.06389404833316803,
    "rollback-3.ssm.32.control" : 0.11242713034152985,
    "rollback-3.ssm.33.candidate" : 0.19111044704914093,
    "rollback-3.ssm.33.control" : 0.09297727793455124,
    "rollback-3.ssm.34.candidate" : 0.17028166353702545,
    "rollback-3.ssm.34.control" : 0.0816265419125557,
    "rollback-3.ssm.36.candidate" : 0.10445909947156906,
    "rollback-3.ssm.36.control" : 0.07383568584918976,
    "rollback-3.ssm.37.candidate" : 0.048803940415382385,
    "rollback-3.ssm.37.control" : 0.06573573499917984,
    "rollback-3.ssm.38.candidate" : 0.02401871606707573,
    "rollback-3.ssm.38.control" : 0.024166760966181755,
    "rollback-3.ssm.4.candidate" : 0,
    "rollback-3.ssm.4.control" : 0,
    "rollback-3.ssm.40.candidate" : 0.020246801897883415,
    "rollback-3.ssm.40.control" : 0.02701573073863983,
    "rollback-3.ssm.41.candidate" : 0.03203709423542023,
    "rollback-3.ssm.41.control" : 0.023030178621411324,
    "rollback-3.ssm.42.candidate" : 0.06132623553276062,
    "rollback-3.ssm.42.control" : 0.06906863301992416,
    "rollback-3.ssm.44.candidate" : 0.031375668942928314,
    "rollback-3.ssm.44.control" : 0.028231170028448105,
    "rollback-3.ssm.45.candidate" : 0.17313940823078156,
    "rollback-3.ssm.45.control" : 0.08998844772577286,
    "rollback-3.ssm.46.candidate" : 0.09293881058692932,
    "rollback-3.ssm.46.control" : 0.09238725900650024,
    "rollback-3.ssm.5.candidate" : 2.9656732294824906e-05,
    "rollback-3.ssm.5.control" : 0,
    "rollback-3.ssm.6.candidate" : 0.007601742632687092,
    "rollback-3.ssm.6.control" : 0,
    "rollback-3.ssm.8.candidate" : 0.008744255639612675,
    "rollback-3.ssm.8.control" : 9.476989930590207e-07,
    "rollback-3.ssm.9.candidate" : 0.02372596599161625,
    "rollback-3.ssm.9.control" : 0.005887977778911591,
    "rollback-3.value.11.candidate" : 0.013489208184182644,
    "rollback-3.value.11.control" : 0.010791366919875145,
    "rollback-3.value.15.candidate" : 0.028884463012218475,
    "rollback-3.value.15.control" : 0.017056772485375404,
    "rollback-3.value.19.candidate" : 0.021954718977212906,
    "rollback-3.value.19.control" : 0.03214285895228386,
    "rollback-3.value.23.candidate" : 0.04593023285269737,
    "rollback-3.value.23.control" : 0.0417151153087616,
    "rollback-3.value.27.candidate" : 0.012674825266003609,
    "rollback-3.value.27.control" : 0.014546001330018044,
    "rollback-3.value.3.candidate" : 0,
    "rollback-3.value.3.control" : 0,
    "rollback-3.value.31.candidate" : 0.06331522017717361,
    "rollback-3.value.31.control" : 0.072826087474823,
    "rollback-3.value.35.candidate" : 0.07336956262588501,
    "rollback-3.value.35.control" : 0.06159420311450958,
    "rollback-3.value.39.candidate" : 0.03690476343035698,
    "rollback-3.value.39.control" : 0.0494791679084301,
    "rollback-3.value.43.candidate" : 0.0628930851817131,
    "rollback-3.value.43.control" : 0.07547169923782349,
    "rollback-3.value.47.candidate" : 0.3550295829772949,
    "rollback-3.value.47.control" : 0.23150888085365295,
    "rollback-3.value.7.candidate" : 0.013473053462803364,
    "rollback-3.value.7.control" : 0,
    "routing.candidate" : 0.03799031575520833,
    "routing.control" : 0.028643798828125
  },
  "name" : "optimization-chronological-prefill-family",
  "passed" : false
}

```
