---
type: run
id: 01m1r790a3nhj8j3rma0fnas96
created: 2026-09-05T07:24:38.595982+00:00
updated: 2026-09-05T07:25:49.587797+00:00
summary: Exact router and MTP selection checks pass; real request timing gates do not qualify selector or queue adoption
binary: Frozen V9 to V11 identities in body
captured_at: 2026-09-05
command: Exact commands in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Router selector and request-level gate evidence
tool: Native state and selector diagnostics plus paired serving harness
---
# Fixed router selection and request-level non-adoption

Partial OPT36 and OPT30 execution. The specialized selector maps float32 bit patterns to an integer total order: descending finite values, equal signed zeros, NaNs last, ties by original index. One SIMD group selects ten of 512 candidates without a full sorted row. Other widths, K and dtypes retain the pinned reference. Initialization executes and checks the all-tie case before model state advances. No GPU execution failure is caught and resumed on a partially advanced request. The selector is opt-in and not activated on unqualified hardware by default.

V9 passed 41 fixed-score assertions against the pinned MLX selection and an independent CPU ordering oracle. V10 adds explicit initialization evidence, finite-input exploratory timings and opt-in main/MTP integration: 42 component assertions and 1,127 exact model-state/logit/rollback/continuation assertions passed. V11 adds recorded ordered IDs: 1,128 main-state/route assertions and 367 MTP state/route/future-draft assertions passed. The current ordinary-generation pending-token, EOS and cancellation suite also passed 702 assertions. These are correctness gates, not latency claims.

V9's five-round kernel probe had unchanged swap counters and suggested a larger saving at 4,096 rows, but each measured call includes evaluation/host overhead and that is not a whole-model result. V10 uses finite synthetic logits, preserving the original exceptional-value cases for correctness. Both raw component results are retained.

The real serving development protocol froze five interleaved rounds of a 17-token raw prompt, 16 greedy output tokens, a 640-slot pool and the same compact-state/final-forward baseline. Prefix caching was disabled, each process received a full-prompt warmup, and queue and selector arms were independent. Every valid comparison had identical emitted IDs and reassembled wire text.

Router/reference has four valid pairs after the second router cell was swap-excluded. All four were slower, with a median paired client regression of 9.43445%. It fails both the minimum-five-clean-pair requirement and the improvement/sign gates. The short-request selector is not adopted; a kernel-only improvement cannot substitute for this failed product gate.

Queue/reference has four valid pairs after the third queue cell was swap-excluded. Median paired client regression is 5.000338%, narrowly outside the predeclared 5% nonregression limit; the corresponding generator-only figure happens to be 4.999911%, but the primary client metric must not be switched after seeing results. Individual pairs varied substantially (including a 31% reduction and 24% regression). This is a noisy nominal gate failure, not evidence that the queue is precisely 5% slower. Keep it opt-in while finishing live stall/Gateway qualification and investigating overhead. Do not round the result into a pass or add replacement cells to this protocol.

Small independent source patches were applied during this timing block; no workspace shell command, build or second model ran. Executable/metallib/source archive identities bind the frozen V11 process. Every swapping pair stays excluded. No production defaults changed.

## .build/optimization/candidate-router-selection-v9/build-identity.json

SHA-256: `f5889e5016ed354422f892fa69cd055048eb9ac0d09850c39db1543ff81df152`

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
    "Sources/Slotstream/Layers.swift": "d78528b5ce2953054ac951885e9205e8f46a220f67627d4533aa188055251c35",
    "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "49304162cd372a40b7c5d19f52da19542a88daf762cdb139a659ea39e3087f67",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "de3bd12df90f8b6ee74784dafb748103b5fb60378639e379665bf1ce2c399b37",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
    "Sources/Slotstream/ProcessMemory.swift": "6df720e0a166025acce188b1bf6de5d4793e32b0453ac26cd82424861207f190",
    "Sources/Slotstream/RouterSelection.swift": "7ef78d055dc7775cc3bad18ce1b38104af331e6f097c2221fab3fb54fd2d44c5",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "a4d8da0101450355a2689b42d8f79386feeff481f4df658dee9a45f3afb05f5e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "c719d509d6fe65e8f21a042300e1a25d5d9dcf47a5d3823c890d0af6fa213cfb",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "ba8ec1907a6a6c176ad5f22dbf2ce597f976290f8b429918e5fc1b1fb0cadfec",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "ea104a617d88a1064409a7a2b7d2abf462ba9841f72a642f52aac249c2883527",
  "binary_sha256": "a45e9365a8122841bffd95500b9088f3ae7f5ff6f41027b58a469b3d64ff0400",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/candidate-router-integration-v10/build-identity.json

SHA-256: `ffbad6de41c39647bfee6f9401cec535096ebf7b04af442fbff45e96c33d636e`

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
    "Sources/Slotstream/Layers.swift": "5c3589731c0479fd6d7e3571f2e8f7a715308f1de2e907971b1e7f55089d58f7",
    "Sources/Slotstream/MTP.swift": "b14344bb491f162ac1b786e776e70c30186c25fd5447590ef6a2acde4075aac7",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "995989d388ddb6faa05fa934deb1ed222e495abd7d162d59c2e86f41aaa9ad67",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "c2e4ebbc3a9d12a7e1b2a5ca08ff9eb0605822494f237ecd8372604c7fac8533",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "37e87a89be2e19159846f628ae4e8fb97f5bc0bfdddefd0457ee20618dad6610",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "9600d97f4df495c63df6d446d0128624bdaf3f860083a665a17a0faacccc8b73",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "6999b417164cc27e3826d4af939a7a84ed4859b575e4c45693ead3d66b15e1c3",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "8d9a7e8d35bfee549afac9cc46c9767c0106ba5568de902604e7201cfebefb42",
  "binary_sha256": "0e80ea241651a231895610cf85f29f4e91ffb931214c7cbf0265eef27ed4d091",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/candidate-router-traces-v11/build-identity.json

SHA-256: `f3574f7b935377165ce5a24d545bcb126e1cc25221bff1f04a5f20028ea5f3ad`

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
    "Sources/Slotstream/Layers.swift": "5c3589731c0479fd6d7e3571f2e8f7a715308f1de2e907971b1e7f55089d58f7",
    "Sources/Slotstream/MTP.swift": "69d9bb321e31bb79f735e7f5541df67207819b9341ebd98b9bbf46c6e81407e9",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
    "Sources/Slotstream/Model.swift": "995989d388ddb6faa05fa934deb1ed222e495abd7d162d59c2e86f41aaa9ad67",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "c2e4ebbc3a9d12a7e1b2a5ca08ff9eb0605822494f237ecd8372604c7fac8533",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "a6123fa3db39162d5f6190440b69f09d983d2ebc55b66bee08faf687430fe907",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "9600d97f4df495c63df6d446d0128624bdaf3f860083a665a17a0faacccc8b73",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "36e1aff6b61b1d0428dc19aa67c5b2bc9160df811ff0ec09ceeb4f567be9fb8f",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "bc025822a392e6e8e01dbfa6bf8fbf57c0f34d6f67bf8b154d83d5cbe12801e0",
  "binary_sha256": "6ece6e0861849f431bb4ffc4f5b2b4bd8333b4ff063cc1fbd03abd20f27f02f1",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/router-selection-protocol-v9.json

SHA-256: `75942a808aa9c1ded9d2f48598e021b11e2ee0ae0ed3e2723c67b4f5b0220425`

```text
{
  "classification": "fixed-score selector correctness and kernel-only exploratory timing; no model integration or request speed claim",
  "primary_gate": "exact ordered indices against pinned MLX and independent stable IEEE-bit ordering oracle",
  "cases": "ascending/descending, all ties, signed zeros, kth ties, infinities, NaNs, subnormals, 24 deterministic random IEEE rows, repeatability, strided views and width/K/dtype fallbacks",
  "timing": "five AB/BA rounds, twenty evaluated selections per cell, shapes 1/32/256/4096 rows; input is deterministic random IEEE row, not model logit distribution",
  "minimum_useful_kernel_benefit": 0.1,
  "request_gate": "independent real-model state/route and paired end-to-end gate needed before activation",
  "swap_rule": "kernel timings discarded if global counters change; correctness assertions remain"
}

```

## .build/optimization/router-selection-protocol-v10.json

SHA-256: `24f474255f0c9979987147cbac087a765d4c1c88b3fc3132a9df02cec61f71ae`

```text
{
  "classification": "fixed-score selector correctness and kernel-only exploratory timing; no model integration or request speed claim",
  "primary_gate": "exact ordered indices against pinned MLX and independent stable IEEE-bit ordering oracle",
  "cases": "ascending/descending, all ties, signed zeros, kth ties, infinities, NaNs, subnormals, 24 deterministic random IEEE rows, repeatability, strided views and width/K/dtype fallbacks",
  "timing": "five AB/BA rounds, twenty evaluated selections per cell, shapes 1/32/256/4096 rows; deterministic finite synthetic logits in [-8,8), rather than random IEEE patterns",
  "minimum_useful_kernel_benefit": 0.1,
  "request_gate": "independent real-model state/route and paired end-to-end gate needed before activation",
  "swap_rule": "kernel timings discarded if global counters change; correctness assertions remain",
  "additional_gates": "kernel initialization checked before state mutation, explicit opt-in integration; full 1024-token state/route/verify/rollback check required"
}

```

## .build/optimization/serving-selector-queue-protocol-v11.json

SHA-256: `25b23ef3222b6e35df7b2d12939a06add815009e7550c62389f529fcb4d25250`

```text
{
  "label": "serving-selector-and-queue-v11",
  "classification": "five paired development rounds; same 640-slot pool, short prompt, 16 greedy outputs; separate router speed and output-queue nonregression gates",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
  "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "memory_gb": 8.1,
  "mtp": "off",
  "rounds": 5,
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
    "router": {
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "1"
      }
    },
    "queue": {
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1"
      }
    }
  },
  "conditions": "one full-prompt warmup then one measured streamed request per server, warm expert/ngram/kernel caches, prefix cache off; startup excluded from request interval; unchanged global client and generator VM counters required",
  "primary_metric": "router: at least five clean exact-ID pairs, median client reduction >=3%, at least 4/5 positive; output queue: at least three clean exact-ID/wire pairs, median request regression <=5%; swap excludes the entire pair; no replacement cells"
}

```

## .build/optimization/router-selection-v9/manifest.json

SHA-256: `9430f3c346e028c7fea497084211c8fb57d29a6f33148c734a1105036d22a5e3`

```text
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-selection-v9/slotstream",
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
      "Sources/Slotstream/Layers.swift": "d78528b5ce2953054ac951885e9205e8f46a220f67627d4533aa188055251c35",
      "Sources/Slotstream/MTP.swift": "887ca25d9beb7f63273e70bd6827362d861f91ef027f86627f024ebd6d9ab082",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "49304162cd372a40b7c5d19f52da19542a88daf762cdb139a659ea39e3087f67",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "de3bd12df90f8b6ee74784dafb748103b5fb60378639e379665bf1ce2c399b37",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
      "Sources/Slotstream/ProcessMemory.swift": "6df720e0a166025acce188b1bf6de5d4793e32b0453ac26cd82424861207f190",
      "Sources/Slotstream/RouterSelection.swift": "7ef78d055dc7775cc3bad18ce1b38104af331e6f097c2221fab3fb54fd2d44c5",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "a4d8da0101450355a2689b42d8f79386feeff481f4df658dee9a45f3afb05f5e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "c719d509d6fe65e8f21a042300e1a25d5d9dcf47a5d3823c890d0af6fa213cfb",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "ba8ec1907a6a6c176ad5f22dbf2ce597f976290f8b429918e5fc1b1fb0cadfec",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "ea104a617d88a1064409a7a2b7d2abf462ba9841f72a642f52aac249c2883527",
    "binary_sha256": "a45e9365a8122841bffd95500b9088f3ae7f5ff6f41027b58a469b3d64ff0400",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 7.0,
  "timeout_seconds": 90,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-selection-v9/slotstream",
    "optimization-state-check",
    "--variant",
    "router-selection",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29628203008,
    "swapins": 41697577,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   399242.\nPages active:                                1011680.\nPages inactive:                               969487.\nPages speculative:                             89377.\nPages throttled:                                   0.\nPages wired down:                             234000.\nPages purgeable:                                7978.\n\"Translation faults\":                    13716716586.\nPages copy-on-write:                       624057177.\nPages zero filled:                       14733368041.\nPages reactivated:                        2141623901.\nPages purged:                               61119235.\nFile-backed pages:                           1401142.\nAnonymous pages:                              669402.\nPages stored in compressor:                  1319456.\nPages occupied by compressor:                 380302.\nDecompressions:                            954546555.\nCompressions:                             1247902295.\nPageins:                                  5703409265.\nPageouts:                                   10616016.\nSwapins:                                    41697577.\nSwapouts:                                   69922789.\nPages tagged:                                 177040.\nPages tagged resident:                        136277.\nPages tagged compressed:                       40763.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6948.\nPages tag-storage free:                         1599.\nPages tag-storage non-tag pageable:            89749.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6432256.\nTagged compressions:                         9283822.\nTagged decompressions:                       8543461.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 41,
  "duration_seconds": 0.9048069169999999,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29624647680,
    "swapins": 41697577,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   398697.\nPages active:                                1013412.\nPages inactive:                               969505.\nPages speculative:                             89591.\nPages throttled:                                   0.\nPages wired down:                             232425.\nPages purgeable:                                7978.\n\"Translation faults\":                    13716729321.\nPages copy-on-write:                       624057827.\nPages zero filled:                       14733378322.\nPages reactivated:                        2141623901.\nPages purged:                               61119235.\nFile-backed pages:                           1401470.\nAnonymous pages:                              671038.\nPages stored in compressor:                  1319446.\nPages occupied by compressor:                 380301.\nDecompressions:                            954546565.\nCompressions:                             1247902295.\nPageins:                                  5703409476.\nPageouts:                                   10616016.\nSwapins:                                    41697577.\nSwapouts:                                   69922789.\nPages tagged:                                 177065.\nPages tagged resident:                        136302.\nPages tagged compressed:                       40763.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6948.\nPages tag-storage free:                         1602.\nPages tag-storage non-tag pageable:            89746.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6432256.\nTagged compressions:                         9283822.\nTagged decompressions:                       8543461.\n"
  }
}

```

## .build/optimization/router-selection-v9/stdout.txt

SHA-256: `28c2d1da64d1b5c9fc13284d7e37390c167b65a073921e46c0c653c7585ee97e`

```text
{
  "items" : [
    {
      "name" : "ordered indices equal pinned MLX sort",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 0",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 1",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 2",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 3",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 4",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 5",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 6",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 7",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 8",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 9",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 10",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 11",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 12",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 13",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 14",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 15",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 16",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 17",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 18",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 19",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 20",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 21",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 22",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 23",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 24",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 25",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 26",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 27",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 28",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 29",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 30",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 31",
      "passed" : true
    },
    {
      "name" : "selector repeatability",
      "passed" : true
    },
    {
      "name" : "selector repeatability",
      "passed" : true
    },
    {
      "name" : "selector repeatability",
      "passed" : true
    },
    {
      "name" : "noncontiguous input",
      "passed" : true
    },
    {
      "name" : "unsupported width uses reference",
      "passed" : true
    },
    {
      "name" : "unsupported K uses reference",
      "passed" : true
    },
    {
      "name" : "BF16 uses reference",
      "passed" : true
    },
    {
      "name" : "explicit reference switch",
      "passed" : true
    }
  ],
  "measurements" : {
    "candidate_1_seconds" : 0.00016872085000000002,
    "candidate_256_seconds" : 0.0001640292,
    "candidate_32_seconds" : 0.00015372085,
    "candidate_4096_seconds" : 0.00020697085000000002,
    "paired_1_reduction" : 0.1135877093565042,
    "paired_256_reduction" : 0.08248301886792442,
    "paired_32_reduction" : 0.08130375018676239,
    "paired_4096_reduction" : 0.602005401447588,
    "reference_1_seconds" : 0.00019852500000000001,
    "reference_256_seconds" : 0.000178875,
    "reference_32_seconds" : 0.0001659271,
    "reference_4096_seconds" : 0.00051592295
  },
  "name" : "optimization-router-selection",
  "passed" : true
}

```

## .build/optimization/router-selection-v9/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/router-selection-v10/manifest.json

SHA-256: `b1f8e388bb04939066dbee53b693bb9a985d374dd7c010ce173a858a4fbd3b0f`

```text
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-integration-v10/slotstream",
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
      "Sources/Slotstream/Layers.swift": "5c3589731c0479fd6d7e3571f2e8f7a715308f1de2e907971b1e7f55089d58f7",
      "Sources/Slotstream/MTP.swift": "b14344bb491f162ac1b786e776e70c30186c25fd5447590ef6a2acde4075aac7",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "995989d388ddb6faa05fa934deb1ed222e495abd7d162d59c2e86f41aaa9ad67",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "c2e4ebbc3a9d12a7e1b2a5ca08ff9eb0605822494f237ecd8372604c7fac8533",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "37e87a89be2e19159846f628ae4e8fb97f5bc0bfdddefd0457ee20618dad6610",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "9600d97f4df495c63df6d446d0128624bdaf3f860083a665a17a0faacccc8b73",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "6999b417164cc27e3826d4af939a7a84ed4859b575e4c45693ead3d66b15e1c3",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "8d9a7e8d35bfee549afac9cc46c9767c0106ba5568de902604e7201cfebefb42",
    "binary_sha256": "0e80ea241651a231895610cf85f29f4e91ffb931214c7cbf0265eef27ed4d091",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 7.0,
  "timeout_seconds": 90,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-integration-v10/slotstream",
    "optimization-state-check",
    "--variant",
    "router-selection",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28916137984,
    "swapins": 41697669,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   158708.\nPages active:                                1113758.\nPages inactive:                              1126774.\nPages speculative:                            114832.\nPages throttled:                                   0.\nPages wired down:                             218800.\nPages purgeable:                               26430.\n\"Translation faults\":                    13718279744.\nPages copy-on-write:                       624157179.\nPages zero filled:                       14734441006.\nPages reactivated:                        2141625200.\nPages purged:                               61121418.\nFile-backed pages:                           1579763.\nAnonymous pages:                              775601.\nPages stored in compressor:                  1282651.\nPages occupied by compressor:                 350905.\nDecompressions:                            954580983.\nCompressions:                             1247902295.\nPageins:                                  5703534646.\nPageouts:                                   10616019.\nSwapins:                                    41697669.\nSwapouts:                                   69922789.\nPages tagged:                                 176555.\nPages tagged resident:                        137450.\nPages tagged compressed:                       39105.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6948.\nPages tag-storage free:                         1904.\nPages tag-storage non-tag pageable:            89444.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6118848.\nTagged compressions:                         9283822.\nTagged decompressions:                       8545118.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 42,
  "duration_seconds": 0.8458797499999999,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28758654976,
    "swapins": 41697669,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   159750.\nPages active:                                1098918.\nPages inactive:                              1126778.\nPages speculative:                            114903.\nPages throttled:                                   0.\nPages wired down:                             232572.\nPages purgeable:                               15639.\n\"Translation faults\":                    13718294620.\nPages copy-on-write:                       624157834.\nPages zero filled:                       14734456041.\nPages reactivated:                        2141625200.\nPages purged:                               61121418.\nFile-backed pages:                           1579900.\nAnonymous pages:                              760699.\nPages stored in compressor:                  1282649.\nPages occupied by compressor:                 350905.\nDecompressions:                            954580985.\nCompressions:                             1247902295.\nPageins:                                  5703534734.\nPageouts:                                   10616019.\nSwapins:                                    41697669.\nSwapouts:                                   69922789.\nPages tagged:                                 176614.\nPages tagged resident:                        137509.\nPages tagged compressed:                       39105.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6948.\nPages tag-storage free:                         1913.\nPages tag-storage non-tag pageable:            89435.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6118848.\nTagged compressions:                         9283822.\nTagged decompressions:                       8545118.\n"
  }
}

```

## .build/optimization/router-selection-v10/stdout.txt

SHA-256: `d958bfd30618d5cde3732203b729517c0ead07c431703fb0e1de414b0b870a9b`

```text
{
  "items" : [
    {
      "name" : "specialized kernel initialized and active",
      "passed" : true
    },
    {
      "name" : "ordered indices equal pinned MLX sort",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 0",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 1",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 2",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 3",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 4",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 5",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 6",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 7",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 8",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 9",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 10",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 11",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 12",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 13",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 14",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 15",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 16",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 17",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 18",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 19",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 20",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 21",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 22",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 23",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 24",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 25",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 26",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 27",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 28",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 29",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 30",
      "passed" : true
    },
    {
      "name" : "stable bit-order oracle row 31",
      "passed" : true
    },
    {
      "name" : "selector repeatability",
      "passed" : true
    },
    {
      "name" : "selector repeatability",
      "passed" : true
    },
    {
      "name" : "selector repeatability",
      "passed" : true
    },
    {
      "name" : "noncontiguous input",
      "passed" : true
    },
    {
      "name" : "unsupported width uses reference",
      "passed" : true
    },
    {
      "name" : "unsupported K uses reference",
      "passed" : true
    },
    {
      "name" : "BF16 uses reference",
      "passed" : true
    },
    {
      "name" : "explicit reference switch",
      "passed" : true
    }
  ],
  "measurements" : {
    "candidate_1_seconds" : 0.00017370205000000002,
    "candidate_256_seconds" : 0.00016548335,
    "candidate_32_seconds" : 0.00016190835,
    "candidate_4096_seconds" : 0.0002031625,
    "paired_1_reduction" : 0.08357806574999171,
    "paired_256_reduction" : 0.048033057599760176,
    "paired_32_reduction" : 0.038965719323276304,
    "paired_4096_reduction" : 0.6076271128337245,
    "reference_1_seconds" : 0.0002051646,
    "reference_256_seconds" : 0.0001731958,
    "reference_32_seconds" : 0.00016884585,
    "reference_4096_seconds" : 0.0005141458
  },
  "name" : "optimization-router-selection",
  "passed" : true
}

```

## .build/optimization/router-selection-v10/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/router-state-v10/manifest.json

SHA-256: `efdbfd10f78989e7df746b7fc5d00fc4b772127dc9f95c6c0c4fdd489ae177a5`

```text
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-integration-v10/slotstream",
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
      "Sources/Slotstream/Layers.swift": "5c3589731c0479fd6d7e3571f2e8f7a715308f1de2e907971b1e7f55089d58f7",
      "Sources/Slotstream/MTP.swift": "b14344bb491f162ac1b786e776e70c30186c25fd5447590ef6a2acde4075aac7",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "995989d388ddb6faa05fa934deb1ed222e495abd7d162d59c2e86f41aaa9ad67",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "c2e4ebbc3a9d12a7e1b2a5ca08ff9eb0605822494f237ecd8372604c7fac8533",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "37e87a89be2e19159846f628ae4e8fb97f5bc0bfdddefd0457ee20618dad6610",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "9600d97f4df495c63df6d446d0128624bdaf3f860083a665a17a0faacccc8b73",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "6999b417164cc27e3826d4af939a7a84ed4859b575e4c45693ead3d66b15e1c3",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "8d9a7e8d35bfee549afac9cc46c9767c0106ba5568de902604e7201cfebefb42",
    "binary_sha256": "0e80ea241651a231895610cf85f29f4e91ffb931214c7cbf0265eef27ed4d091",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-integration-v10/slotstream",
    "optimization-state-check",
    "--variant",
    "router",
    "--tokens",
    "1024",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28765437952,
    "swapins": 41697669,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   160166.\nPages active:                                1098700.\nPages inactive:                              1126860.\nPages speculative:                            114853.\nPages throttled:                                   0.\nPages wired down:                             232553.\nPages purgeable:                               15639.\n\"Translation faults\":                    13718300665.\nPages copy-on-write:                       624158224.\nPages zero filled:                       14734458528.\nPages reactivated:                        2141625200.\nPages purged:                               61121418.\nFile-backed pages:                           1579898.\nAnonymous pages:                              760515.\nPages stored in compressor:                  1282647.\nPages occupied by compressor:                 350905.\nDecompressions:                            954580987.\nCompressions:                             1247902295.\nPageins:                                  5703534755.\nPageouts:                                   10616019.\nSwapins:                                    41697669.\nSwapouts:                                   69922789.\nPages tagged:                                 176575.\nPages tagged resident:                        137471.\nPages tagged compressed:                       39104.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6948.\nPages tag-storage free:                         1919.\nPages tag-storage non-tag pageable:            89429.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6118784.\nTagged compressions:                         9283822.\nTagged decompressions:                       8545119.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 1127,
  "duration_seconds": 14.985566875,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31658131456,
    "swapins": 41697788,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   489351.\nPages active:                                 850345.\nPages inactive:                               758896.\nPages speculative:                             90156.\nPages throttled:                                   0.\nPages wired down:                             301640.\nPages purgeable:                               10636.\n\"Translation faults\":                    13718999983.\nPages copy-on-write:                       624167046.\nPages zero filled:                       14740614086.\nPages reactivated:                        2142457010.\nPages purged:                               61134368.\nFile-backed pages:                           1432272.\nAnonymous pages:                              267125.\nPages stored in compressor:                  1708124.\nPages occupied by compressor:                 592644.\nDecompressions:                            955485076.\nCompressions:                             1249294496.\nPageins:                                  5704261516.\nPageouts:                                   10616281.\nSwapins:                                    41697788.\nSwapouts:                                   69922789.\nPages tagged:                                 173909.\nPages tagged resident:                        122059.\nPages tagged compressed:                       51850.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         2914.\nPages tag-storage non-tag pageable:            88481.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8566528.\nTagged compressions:                         9303542.\nTagged decompressions:                       8551781.\n"
  }
}

```

## .build/optimization/router-state-v10/stdout.txt

SHA-256: `b746e1bc1e6e9d2698f113b76a21c78d905ad6b4a387c17d30c80093251944fc`

```text
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
    "physical_footprint_bytes" : 7760744024,
    "prompt_tokens" : 1024
  },
  "name" : "optimization-state-router",
  "passed" : true
}

```

## .build/optimization/router-state-v10/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/router-traces-v11/manifest.json

SHA-256: `112c3fe49131409238738032fde0732273459508a712f64a9b6fda81c2ec816d`

```text
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream",
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
      "Sources/Slotstream/Layers.swift": "5c3589731c0479fd6d7e3571f2e8f7a715308f1de2e907971b1e7f55089d58f7",
      "Sources/Slotstream/MTP.swift": "69d9bb321e31bb79f735e7f5541df67207819b9341ebd98b9bbf46c6e81407e9",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "995989d388ddb6faa05fa934deb1ed222e495abd7d162d59c2e86f41aaa9ad67",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "c2e4ebbc3a9d12a7e1b2a5ca08ff9eb0605822494f237ecd8372604c7fac8533",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "a6123fa3db39162d5f6190440b69f09d983d2ebc55b66bee08faf687430fe907",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "9600d97f4df495c63df6d446d0128624bdaf3f860083a665a17a0faacccc8b73",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "36e1aff6b61b1d0428dc19aa67c5b2bc9160df811ff0ec09ceeb4f567be9fb8f",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "bc025822a392e6e8e01dbfa6bf8fbf57c0f34d6f67bf8b154d83d5cbe12801e0",
    "binary_sha256": "6ece6e0861849f431bb4ffc4f5b2b4bd8333b4ff063cc1fbd03abd20f27f02f1",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream",
    "optimization-state-check",
    "--variant",
    "router",
    "--tokens",
    "1024",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29841178624,
    "swapins": 41697879,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   326127.\nPages active:                                1028194.\nPages inactive:                               824941.\nPages speculative:                            215889.\nPages throttled:                                   0.\nPages wired down:                             232910.\nPages purgeable:                                7337.\n\"Translation faults\":                    13720538150.\nPages copy-on-write:                       624233523.\nPages zero filled:                       14741548086.\nPages reactivated:                        2142458800.\nPages purged:                               61138012.\nFile-backed pages:                           1487897.\nAnonymous pages:                              581127.\nPages stored in compressor:                  1435031.\nPages occupied by compressor:                 452354.\nDecompressions:                            955741218.\nCompressions:                             1249294496.\nPageins:                                  5704322020.\nPageouts:                                   10616281.\nSwapins:                                    41697879.\nSwapouts:                                   69922789.\nPages tagged:                                 175136.\nPages tagged resident:                        130225.\nPages tagged compressed:                       44911.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         4995.\nPages tag-storage non-tag pageable:            86400.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7199488.\nTagged compressions:                         9303542.\nTagged decompressions:                       8558693.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 1128,
  "duration_seconds": 12.398803625000001,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30598119424,
    "swapins": 41697883,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   479021.\nPages active:                                 947777.\nPages inactive:                               708594.\nPages speculative:                            237871.\nPages throttled:                                   0.\nPages wired down:                             256197.\nPages purgeable:                                   2.\n\"Translation faults\":                    13720769500.\nPages copy-on-write:                       624234267.\nPages zero filled:                       14747529945.\nPages reactivated:                        2142918577.\nPages purged:                               61145627.\nFile-backed pages:                           1388538.\nAnonymous pages:                              505704.\nPages stored in compressor:                  1476402.\nPages occupied by compressor:                 454032.\nDecompressions:                            955744389.\nCompressions:                             1249339647.\nPageins:                                  5704702241.\nPageouts:                                   10616421.\nSwapins:                                    41697883.\nSwapouts:                                   69922789.\nPages tagged:                                 175099.\nPages tagged resident:                        129643.\nPages tagged compressed:                       45456.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         2452.\nPages tag-storage non-tag pageable:            88943.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7266816.\nTagged compressions:                         9304087.\nTagged decompressions:                       8558693.\n"
  }
}

```

## .build/optimization/router-traces-v11/stdout.txt

SHA-256: `a05517371386b498dda3b9bb7aed3c32cab4cb1c254feba13861203e62d8edee`

```text
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
      "name" : "ordered router traces across prefill, verify and continuation",
      "passed" : true
    }
  ],
  "measurements" : {
    "physical_footprint_bytes" : 7729368712,
    "prompt_tokens" : 1024
  },
  "name" : "optimization-state-router",
  "passed" : true
}

```

## .build/optimization/router-traces-v11/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/mtp-router-v11/manifest.json

SHA-256: `f0fd9f61289000b1b96c79b31056d33483efc1bb1e2169910089812600728264`

```text
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream",
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
      "Sources/Slotstream/Layers.swift": "5c3589731c0479fd6d7e3571f2e8f7a715308f1de2e907971b1e7f55089d58f7",
      "Sources/Slotstream/MTP.swift": "69d9bb321e31bb79f735e7f5541df67207819b9341ebd98b9bbf46c6e81407e9",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "995989d388ddb6faa05fa934deb1ed222e495abd7d162d59c2e86f41aaa9ad67",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "c2e4ebbc3a9d12a7e1b2a5ca08ff9eb0605822494f237ecd8372604c7fac8533",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "a6123fa3db39162d5f6190440b69f09d983d2ebc55b66bee08faf687430fe907",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "9600d97f4df495c63df6d446d0128624bdaf3f860083a665a17a0faacccc8b73",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "36e1aff6b61b1d0428dc19aa67c5b2bc9160df811ff0ec09ceeb4f567be9fb8f",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "bc025822a392e6e8e01dbfa6bf8fbf57c0f34d6f67bf8b154d83d5cbe12801e0",
    "binary_sha256": "6ece6e0861849f431bb4ffc4f5b2b4bd8333b4ff063cc1fbd03abd20f27f02f1",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream",
    "optimization-state-check",
    "--variant",
    "mtp-router",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31024611328,
    "swapins": 41697883,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   504936.\nPages active:                                 947179.\nPages inactive:                               707513.\nPages speculative:                            238392.\nPages throttled:                                   0.\nPages wired down:                             231393.\nPages purgeable:                                   4.\n\"Translation faults\":                    13720774206.\nPages copy-on-write:                       624234708.\nPages zero filled:                       14747532218.\nPages reactivated:                        2142918577.\nPages purged:                               61145627.\nFile-backed pages:                           1388652.\nAnonymous pages:                              504432.\nPages stored in compressor:                  1476396.\nPages occupied by compressor:                 454032.\nDecompressions:                            955744395.\nCompressions:                             1249339647.\nPageins:                                  5704702321.\nPageouts:                                   10616421.\nSwapins:                                    41697883.\nSwapouts:                                   69922789.\nPages tagged:                                 174361.\nPages tagged resident:                        128905.\nPages tagged compressed:                       45456.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         2264.\nPages tag-storage non-tag pageable:            89131.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7266816.\nTagged compressions:                         9304087.\nTagged decompressions:                       8558693.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 367,
  "duration_seconds": 7.53558025,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30740185088,
    "swapins": 41697883,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   452881.\nPages active:                                 975744.\nPages inactive:                               820239.\nPages speculative:                            156990.\nPages throttled:                                   0.\nPages wired down:                             232822.\nPages purgeable:                                5945.\n\"Translation faults\":                    13721168679.\nPages copy-on-write:                       624237263.\nPages zero filled:                       14748044370.\nPages reactivated:                        2142927366.\nPages purged:                               61145641.\nFile-backed pages:                           1417406.\nAnonymous pages:                              535567.\nPages stored in compressor:                  1462401.\nPages occupied by compressor:                 444835.\nDecompressions:                            955756152.\nCompressions:                             1249339647.\nPageins:                                  5704809020.\nPageouts:                                   10616421.\nSwapins:                                    41697883.\nSwapouts:                                   69922789.\nPages tagged:                                 174259.\nPages tagged resident:                        128817.\nPages tagged compressed:                       45442.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         2084.\nPages tag-storage non-tag pageable:            89311.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7265472.\nTagged compressions:                         9304087.\nTagged decompressions:                       8558707.\n"
  }
}

```

## .build/optimization/mtp-router-v11/stdout.txt

SHA-256: `f6e9987cd4d920dfdd735403e1e4085b2f57222e49a2194241c51e500a0ca259`

```text
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
    },
    {
      "name" : "ordered draft router traces",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-mtp-router",
  "passed" : true
}

```

## .build/optimization/mtp-router-v11/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/generation-v11/manifest.json

SHA-256: `3eb2fe83e1712e663b27a8b0d8a832a18dfba42ec591265c605b3588a71c41bb`

```text
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream",
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
      "Sources/Slotstream/Layers.swift": "5c3589731c0479fd6d7e3571f2e8f7a715308f1de2e907971b1e7f55089d58f7",
      "Sources/Slotstream/MTP.swift": "69d9bb321e31bb79f735e7f5541df67207819b9341ebd98b9bbf46c6e81407e9",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "995989d388ddb6faa05fa934deb1ed222e495abd7d162d59c2e86f41aaa9ad67",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "c2e4ebbc3a9d12a7e1b2a5ca08ff9eb0605822494f237ecd8372604c7fac8533",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "a6123fa3db39162d5f6190440b69f09d983d2ebc55b66bee08faf687430fe907",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "9600d97f4df495c63df6d446d0128624bdaf3f860083a665a17a0faacccc8b73",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "36e1aff6b61b1d0428dc19aa67c5b2bc9160df811ff0ec09ceeb4f567be9fb8f",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "bc025822a392e6e8e01dbfa6bf8fbf57c0f34d6f67bf8b154d83d5cbe12801e0",
    "binary_sha256": "6ece6e0861849f431bb4ffc4f5b2b4bd8333b4ff063cc1fbd03abd20f27f02f1",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream",
    "optimization-state-check",
    "--generation",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30742446080,
    "swapins": 41697883,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   453021.\nPages active:                                 976091.\nPages inactive:                               819954.\nPages speculative:                            156905.\nPages throttled:                                   0.\nPages wired down:                             232805.\nPages purgeable:                                5945.\n\"Translation faults\":                    13721173512.\nPages copy-on-write:                       624237650.\nPages zero filled:                       14748046849.\nPages reactivated:                        2142927366.\nPages purged:                               61145641.\nFile-backed pages:                           1417404.\nAnonymous pages:                              535546.\nPages stored in compressor:                  1462401.\nPages occupied by compressor:                 444835.\nDecompressions:                            955756152.\nCompressions:                             1249339647.\nPageins:                                  5704809041.\nPageouts:                                   10616421.\nSwapins:                                    41697883.\nSwapouts:                                   69922789.\nPages tagged:                                 174255.\nPages tagged resident:                        128813.\nPages tagged compressed:                       45442.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         2050.\nPages tag-storage non-tag pageable:            89345.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7265472.\nTagged compressions:                         9304087.\nTagged decompressions:                       8558707.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 702,
  "duration_seconds": 8.443595167000002,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30659543040,
    "swapins": 41697883,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   446903.\nPages active:                                 980021.\nPages inactive:                               842760.\nPages speculative:                            141936.\nPages throttled:                                   0.\nPages wired down:                             231239.\nPages purgeable:                                4171.\n\"Translation faults\":                    13721401941.\nPages copy-on-write:                       624238343.\nPages zero filled:                       14748396772.\nPages reactivated:                        2142927386.\nPages purged:                               61145641.\nFile-backed pages:                           1420236.\nAnonymous pages:                              544481.\nPages stored in compressor:                  1453719.\nPages occupied by compressor:                 440527.\nDecompressions:                            955764312.\nCompressions:                             1249339647.\nPageins:                                  5704811701.\nPageouts:                                   10616421.\nSwapins:                                    41697883.\nSwapouts:                                   69922789.\nPages tagged:                                 174225.\nPages tagged resident:                        128788.\nPages tagged compressed:                       45437.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         2250.\nPages tag-storage non-tag pageable:            89145.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7264448.\nTagged compressions:                         9304087.\nTagged decompressions:                       8558712.\n"
  }
}

```

## .build/optimization/generation-v11/stdout.txt

SHA-256: `32dc92564d5911ed8a41fe2260facd112c69d763947a18e4d960a31831b59ee3`

```text
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

## .build/optimization/generation-v11/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`

```text

```

## .build/optimization/serving-selector-queue-v11/manifest.json

SHA-256: `371b65b16d936275668f6d7b6c8912e9d70352b0c09e7db4a7a5b430dc71b79b`

```text
{
  "protocol": {
    "label": "serving-selector-and-queue-v11",
    "classification": "five paired development rounds; same 640-slot pool, short prompt, 16 greedy outputs; separate router speed and output-queue nonregression gates",
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream",
    "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
    "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
    "memory_gb": 8.1,
    "mtp": "off",
    "rounds": 5,
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
      "router": {
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "1",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
          "SLOTSTREAM_OPT_ROUTER_TOPK": "1"
        }
      },
      "queue": {
        "chunk": 256,
        "env": {
          "SLOTSTREAM_OPT_COMPACT_STATE": "1",
          "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
          "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1"
        }
      }
    },
    "conditions": "one full-prompt warmup then one measured streamed request per server, warm expert/ngram/kernel caches, prefix cache off; startup excluded from request interval; unchanged global client and generator VM counters required",
    "primary_metric": "router: at least five clean exact-ID pairs, median client reduction >=3%, at least 4/5 positive; output queue: at least three clean exact-ID/wire pairs, median request regression <=5%; swap excludes the entire pair; no replacement cells"
  },
  "protocol_sha256": "25b23ef3222b6e35df7b2d12939a06add815009e7550c62389f529fcb4d25250",
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
      "Sources/Slotstream/Layers.swift": "5c3589731c0479fd6d7e3571f2e8f7a715308f1de2e907971b1e7f55089d58f7",
      "Sources/Slotstream/MTP.swift": "69d9bb321e31bb79f735e7f5541df67207819b9341ebd98b9bbf46c6e81407e9",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "099ff96196227fb066e17f030f6685af84884c0958171c18e0bd432efef9634a",
      "Sources/Slotstream/Model.swift": "995989d388ddb6faa05fa934deb1ed222e495abd7d162d59c2e86f41aaa9ad67",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "c2e4ebbc3a9d12a7e1b2a5ca08ff9eb0605822494f237ecd8372604c7fac8533",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "a6123fa3db39162d5f6190440b69f09d983d2ebc55b66bee08faf687430fe907",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "9600d97f4df495c63df6d446d0128624bdaf3f860083a665a17a0faacccc8b73",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "416667ccd20c82312a0d468b7374ad65309ae9ec8319e744e2e88731fdaac6ec",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "36e1aff6b61b1d0428dc19aa67c5b2bc9160df811ff0ec09ceeb4f567be9fb8f",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "bc025822a392e6e8e01dbfa6bf8fbf57c0f34d6f67bf8b154d83d5cbe12801e0",
    "binary_sha256": "6ece6e0861849f431bb4ffc4f5b2b4bd8333b4ff063cc1fbd03abd20f27f02f1",
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
  "harness_sha256": "4a2c53aa4036e3da37a56fda98cc86119785e38cb233067ab7db8d54b518b870"
}

```

## .build/optimization/serving-selector-queue-v11/results.jsonl

SHA-256: `ef88a5aa43170d5d9fc0a0d02bf736fe27cb4a2346b19190318752fa1210f834`

```text
{"round": 1, "arm": "reference", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 30228234240, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   412275.\nPages active:                                1009769.\nPages inactive:                               860996.\nPages speculative:                            148459.\nPages throttled:                                   0.\nPages wired down:                             230931.\nPages purgeable:                                1669.\n\"Translation faults\":                    13721883229.\nPages copy-on-write:                       624267812.\nPages zero filled:                       14748733736.\nPages reactivated:                        2142928238.\nPages purged:                               61147401.\nFile-backed pages:                           1431041.\nAnonymous pages:                              588183.\nPages stored in compressor:                  1408073.\nPages occupied by compressor:                 421028.\nDecompressions:                            955808054.\nCompressions:                             1249339647.\nPageins:                                  5704815570.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 174977.\nPages tagged resident:                        130260.\nPages tagged compressed:                       44717.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1929.\nPages tag-storage non-tag pageable:            89466.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7130368.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559420.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "62890", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 24737284096, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    75845.\nPages active:                                1028360.\nPages inactive:                               877096.\nPages speculative:                            149474.\nPages throttled:                                   0.\nPages wired down:                             532383.\nPages purgeable:                                1747.\n\"Translation faults\":                    13722116269.\nPages copy-on-write:                       624269503.\nPages zero filled:                       14749073357.\nPages reactivated:                        2142928243.\nPages purged:                               61147401.\nFile-backed pages:                           1432252.\nAnonymous pages:                              622678.\nPages stored in compressor:                  1407943.\nPages occupied by compressor:                 420958.\nDecompressions:                            955808184.\nCompressions:                             1249339647.\nPageins:                                  5704816734.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 175600.\nPages tagged resident:                        130885.\nPages tagged compressed:                       44715.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1877.\nPages tag-storage non-tag pageable:            89518.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7130176.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559422.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 24726192128, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    67226.\nPages active:                                1028117.\nPages inactive:                               885952.\nPages speculative:                            150481.\nPages throttled:                                   0.\nPages wired down:                             530973.\nPages purgeable:                                1750.\n\"Translation faults\":                    13722127290.\nPages copy-on-write:                       624269735.\nPages zero filled:                       14749079975.\nPages reactivated:                        2142928249.\nPages purged:                               61147401.\nFile-backed pages:                           1440191.\nAnonymous pages:                              624359.\nPages stored in compressor:                  1407650.\nPages occupied by compressor:                 420829.\nDecompressions:                            955808446.\nCompressions:                             1249339647.\nPageins:                                  5704824398.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 175651.\nPages tagged resident:                        130936.\nPages tagged compressed:                       44715.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1922.\nPages tag-storage non-tag pageable:            89473.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7130176.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559422.\n"}, "client_seconds": 3.3525258329999996, "headers_seconds": 0.0004900420000000238, "first_protocol_delta_seconds": 1.0738872079999995, "first_visible_text_seconds": 1.2703492919999997, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "effective_mtp": false, "effective_pool_slots": 640, "stats": {"decodeIOSeconds": 1.11735637, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillPhysicalFootprintBytes": 5443816784, "prefillTokens": 17, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 3.33e-07, "finishReason": "length", "mlxCacheEndBytes": 37649269, "sampledFootprint": {"samples": 169, "intervalMilliseconds": 20, "peakBytes": 5444177232}, "tokenCallbackSeconds": 0.003337041, "prefillScatterSeconds": 0.0027607109999999995, "prefillRecords": 3359, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "mlxActiveEndBytes": 4848326832, "firstTextSeconds": 1.073183375, "verifyPasses": 0, "decodeForwardPasses": 15, "generatorVMBefore": {"reclaimableBytes": 27185594368, "swapins": 41697895, "swapouts": 69922789}, "imageEncodeSeconds": 4.1e-08, "reconciledHeadTokens": 0, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 39062389, "promptTokens": 17, "reusedHeadTokens": 0, "prefillComputePasses": [17], "interTokenSeconds": [0.196477458, 0.144141459, 0.122243333, 0.136427125, 0.152728083, 0.152076208, 0.12266875, 0.133117375, 0.159934958, 0.156496, 0.15933325, 0.177405292, 0.144428167, 0.171705167, 0.148879667], "acceptedDrafts": 0, "mlxPeakMemoryGB": 5.09042779, "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 3.351770125, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "decodeScatterSeconds": 0.011551461999999988, "peakMemoryGB": 5.443472744, "prefillMLXActiveBytes": 4846815408, "ngramRowMisses": 0, "prefillIOSeconds": 0.6734279139999998, "decodeSeconds": 2.278543834, "decodeRecords": 4722, "reusedPrefixTokens": 0, "lifetimeRSSPeakBytes": 3478011904, "sampleSeconds": 0.0035902919999999997, "reconciliationSeconds": 0, "generatorVMAfter": {"reclaimableBytes": 27192475648, "swapins": 41697895, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 1.072867958, "firstTokenSeconds": 1.073160917, "physicalFootprintEndBytes": 5443472744}, "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "incrementalIndexer": false, "valueOnlySamplerThreshold": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": false, "boundedIndexer": false, "workspaceTokenTile": 256, "boundedOutputQueue": false, "boundedPLE": false, "demandedPrefillOutput": false, "compactStateWindows": true, "disjointSweepOutput": false, "readScopeTokens": 0, "boundedDraftTail": false, "reuseFirstMTPEntry": false, "compactNgramRows": false, "boundedSweepRows": false}, "effective_prefill_chunk": 256, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351]}}
{"round": 1, "arm": "router", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_ROUTER_TOPK": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 30219255808, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   402589.\nPages active:                                1013232.\nPages inactive:                               865244.\nPages speculative:                            150482.\nPages throttled:                                   0.\nPages wired down:                             231285.\nPages purgeable:                                1688.\n\"Translation faults\":                    13722127979.\nPages copy-on-write:                       624269886.\nPages zero filled:                       14749080061.\nPages reactivated:                        2142929210.\nPages purged:                               61147401.\nFile-backed pages:                           1440160.\nAnonymous pages:                              588798.\nPages stored in compressor:                  1407635.\nPages occupied by compressor:                 420828.\nDecompressions:                            955808461.\nCompressions:                             1249339647.\nPageins:                                  5704824399.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 175013.\nPages tagged resident:                        130298.\nPages tagged compressed:                       44715.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1923.\nPages tag-storage non-tag pageable:            89472.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7130176.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559422.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "62898", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 24938266624, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    64703.\nPages active:                                1036792.\nPages inactive:                               885815.\nPages speculative:                            157523.\nPages throttled:                                   0.\nPages wired down:                             518098.\nPages purgeable:                                9984.\n\"Translation faults\":                    13722369524.\nPages copy-on-write:                       624276061.\nPages zero filled:                       14749420773.\nPages reactivated:                        2142929252.\nPages purged:                               61147401.\nFile-backed pages:                           1447424.\nAnonymous pages:                              632706.\nPages stored in compressor:                  1407596.\nPages occupied by compressor:                 420820.\nDecompressions:                            955808496.\nCompressions:                             1249339647.\nPageins:                                  5704829066.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 175142.\nPages tagged resident:                        130427.\nPages tagged compressed:                       44715.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1755.\nPages tag-storage non-tag pageable:            89630.\nPages tag-storage non-tag wired:                  18.\nBytes of compressed tags:                    7130176.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559422.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 24757551104, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    61886.\nPages active:                                1031687.\nPages inactive:                               877981.\nPages speculative:                            157538.\nPages throttled:                                   0.\nPages wired down:                             533995.\nPages purgeable:                                1753.\n\"Translation faults\":                    13722371025.\nPages copy-on-write:                       624276210.\nPages zero filled:                       14749424240.\nPages reactivated:                        2142929255.\nPages purged:                               61147401.\nFile-backed pages:                           1447442.\nAnonymous pages:                              619764.\nPages stored in compressor:                  1407557.\nPages occupied by compressor:                 420811.\nDecompressions:                            955808535.\nCompressions:                             1249339647.\nPageins:                                  5704829067.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 175248.\nPages tagged resident:                        130533.\nPages tagged compressed:                       44715.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1697.\nPages tag-storage non-tag pageable:            89688.\nPages tag-storage non-tag wired:                  18.\nBytes of compressed tags:                    7130176.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559422.\n"}, "client_seconds": 3.375211, "headers_seconds": 0.000525207999999111, "first_protocol_delta_seconds": 1.049313999999999, "first_visible_text_seconds": 1.2475711249999986, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false, "incrementalIndexer": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": true, "boundedIndexer": false, "workspaceTokenTile": 256, "boundedOutputQueue": false, "demandedPrefillOutput": false, "boundedPLE": false, "compactStateWindows": true, "disjointSweepOutput": false, "reuseFirstMTPEntry": false, "boundedDraftTail": false, "readScopeTokens": 0, "compactNgramRows": false, "boundedSweepRows": false}, "stats": {"decodeIOSeconds": 1.1512762989999974, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillPhysicalFootprintBytes": 5443685736, "prefillTokens": 17, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 3.34e-07, "finishReason": "length", "mlxCacheEndBytes": 37650647, "sampledFootprint": {"samples": 170, "intervalMilliseconds": 20, "peakBytes": 5444210024}, "tokenCallbackSeconds": 0.0033906270000000002, "prefillScatterSeconds": 0.002707657, "prefillRecords": 3359, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "decodeForwardPasses": 15, "reconciledHeadTokens": 0, "verifyPasses": 0, "generatorVMBefore": {"swapins": 41697895, "reclaimableBytes": 27520516096, "swapouts": 69922789}, "mlxActiveEndBytes": 4848326832, "imageEncodeSeconds": 4.2e-08, "firstTextSeconds": 1.048568375, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 38331987, "promptTokens": 17, "interTokenSeconds": [0.198275125, 0.144352417, 0.125884166, 0.138312958, 0.157616709, 0.155020458, 0.126817959, 0.136251167, 0.163095708, 0.15982, 0.165980375, 0.180719833, 0.148274709, 0.173090708, 0.15181625], "prefillComputePasses": [17], "reusedHeadTokens": 0, "acceptedDrafts": 0, "mlxPeakMemoryGB": 5.090379318, "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 3.374425292, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "decodeScatterSeconds": 0.011255586999999992, "peakMemoryGB": 5.443308904, "prefillMLXActiveBytes": 4847547188, "ngramRowMisses": 0, "prefillIOSeconds": 0.667810169, "decodeSeconds": 2.3258045, "decodeRecords": 4722, "reusedPrefixTokens": 0, "sampleSeconds": 0.0036661260000000005, "lifetimeRSSPeakBytes": 3477782528, "reconciliationSeconds": 0, "generatorVMAfter": {"swapins": 41697895, "reclaimableBytes": 27337441280, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 1.048257209, "firstTokenSeconds": 1.048549709, "physicalFootprintEndBytes": 5443308904}, "effective_prefill_chunk": 256, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "effective_pool_slots": 640, "effective_mtp": false}}
{"round": 1, "arm": "queue", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 30228611072, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   395907.\nPages active:                                1013680.\nPages inactive:                               863090.\nPages speculative:                            157537.\nPages throttled:                                   0.\nPages wired down:                             232628.\nPages purgeable:                                1688.\n\"Translation faults\":                    13722371666.\nPages copy-on-write:                       624276354.\nPages zero filled:                       14749424302.\nPages reactivated:                        2142929255.\nPages purged:                               61147401.\nFile-backed pages:                           1447413.\nAnonymous pages:                              586894.\nPages stored in compressor:                  1407555.\nPages occupied by compressor:                 420810.\nDecompressions:                            955808537.\nCompressions:                             1249339647.\nPageins:                                  5704829068.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 175180.\nPages tagged resident:                        130465.\nPages tagged compressed:                       44715.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1849.\nPages tag-storage non-tag pageable:            89546.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7130176.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559422.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "62904", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 24939741184, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    63257.\nPages active:                                1041242.\nPages inactive:                               882960.\nPages speculative:                            157568.\nPages throttled:                                   0.\nPages wired down:                             518054.\nPages purgeable:                               11468.\n\"Translation faults\":                    13722590244.\nPages copy-on-write:                       624276890.\nPages zero filled:                       14749764878.\nPages reactivated:                        2142929255.\nPages purged:                               61147401.\nFile-backed pages:                           1447476.\nAnonymous pages:                              634294.\nPages stored in compressor:                  1407490.\nPages occupied by compressor:                 420792.\nDecompressions:                            955808600.\nCompressions:                             1249339647.\nPageins:                                  5704829117.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 175149.\nPages tagged resident:                        130442.\nPages tagged compressed:                       44707.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1669.\nPages tag-storage non-tag pageable:            89715.\nPages tag-storage non-tag wired:                  19.\nBytes of compressed tags:                    7129920.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559428.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 24774082560, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    62863.\nPages active:                                1034301.\nPages inactive:                               876030.\nPages speculative:                            157576.\nPages throttled:                                   0.\nPages wired down:                             532360.\nPages purgeable:                                1740.\n\"Translation faults\":                    13722591411.\nPages copy-on-write:                       624277039.\nPages zero filled:                       14749768361.\nPages reactivated:                        2142929389.\nPages purged:                               61147401.\nFile-backed pages:                           1447487.\nAnonymous pages:                              620420.\nPages stored in compressor:                  1407395.\nPages occupied by compressor:                 420769.\nDecompressions:                            955808695.\nCompressions:                             1249339647.\nPageins:                                  5704829118.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 175257.\nPages tagged resident:                        130556.\nPages tagged compressed:                       44701.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1673.\nPages tag-storage non-tag pageable:            89711.\nPages tag-storage non-tag wired:                  19.\nBytes of compressed tags:                    7128640.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559434.\n"}, "client_seconds": 3.431559749999998, "headers_seconds": 0.0005335419999994429, "first_protocol_delta_seconds": 1.0581369169999988, "first_visible_text_seconds": 1.2571401249999994, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "effective_prefill_chunk": 256, "effective_pool_slots": 640, "effective_mtp": false, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "incrementalIndexer": false, "valueOnlySamplerThreshold": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": false, "boundedIndexer": false, "workspaceTokenTile": 256, "boundedOutputQueue": true, "boundedPLE": false, "demandedPrefillOutput": false, "compactStateWindows": true, "disjointSweepOutput": false, "readScopeTokens": 0, "boundedDraftTail": false, "reuseFirstMTPEntry": false, "compactNgramRows": false, "boundedSweepRows": false}, "output_before_completion_frame": {"failed": false, "queuedFrames": 16, "firstWriteSeconds": 1.057582208, "writtenFrames": 16, "writtenBytes": 1765, "queuedBytes": 1765, "peakOwnedBytes": 116, "socketWaitSeconds": 0}, "stats": {"decodeIOSeconds": 1.162768801, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillTokens": 17, "prefillPhysicalFootprintBytes": 5443636584, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 1.25e-07, "finishReason": "length", "mlxCacheEndBytes": 37649269, "sampledFootprint": {"samples": 173, "intervalMilliseconds": 20, "peakBytes": 5444242792}, "tokenCallbackSeconds": 0.003008666, "prefillRecords": 3359, "prefillScatterSeconds": 0.002712161999999999, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "mlxActiveEndBytes": 4848326832, "firstTextSeconds": 1.057368292, "verifyPasses": 0, "generatorVMBefore": {"swapouts": 69922789, "swapins": 41697895, "reclaimableBytes": 27522727936}, "decodeForwardPasses": 15, "imageEncodeSeconds": 0, "reconciledHeadTokens": 0, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 38341491, "promptTokens": 17, "interTokenSeconds": [0.199048083, 0.148424667, 0.128496166, 0.137359125, 0.158295875, 0.159634917, 0.128023834, 0.139882125, 0.168559, 0.164728208, 0.165869667, 0.189715042, 0.153252458, 0.174754959, 0.156855875], "mlxPeakMemoryGB": 5.09042779, "reusedHeadTokens": 0, "acceptedDrafts": 0, "prefillComputePasses": [17], "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 3.430770542, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "decodeScatterSeconds": 0.01189740100000001, "peakMemoryGB": 5.443489128, "prefillMLXActiveBytes": 4847536306, "ngramRowMisses": 0, "prefillIOSeconds": 0.6677918340000004, "decodeSeconds": 2.374154, "decodeRecords": 4722, "reusedPrefixTokens": 0, "sampleSeconds": 0.00442525, "lifetimeRSSPeakBytes": 3477946368, "reconciliationSeconds": 0, "generatorVMAfter": {"swapouts": 69922789, "swapins": 41697895, "reclaimableBytes": 27358642176}, "decodeTokens": 16, "prefillSeconds": 1.056243708, "firstTokenSeconds": 1.057347958, "physicalFootprintEndBytes": 5443489128}}}
{"round": 2, "arm": "queue", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 30247223296, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   396999.\nPages active:                                1013060.\nPages inactive:                               864376.\nPages speculative:                            157580.\nPages throttled:                                   0.\nPages wired down:                             231000.\nPages purgeable:                                1688.\n\"Translation faults\":                    13722592087.\nPages copy-on-write:                       624277192.\nPages zero filled:                       14749768443.\nPages reactivated:                        2142929389.\nPages purged:                               61147401.\nFile-backed pages:                           1447457.\nAnonymous pages:                              587559.\nPages stored in compressor:                  1407394.\nPages occupied by compressor:                 420769.\nDecompressions:                            955808696.\nCompressions:                             1249339647.\nPageins:                                  5704829119.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 175189.\nPages tagged resident:                        130488.\nPages tagged compressed:                       44701.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1869.\nPages tag-storage non-tag pageable:            89526.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7128640.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559434.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "62909", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 24415354880, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    41244.\nPages active:                                1038754.\nPages inactive:                               879302.\nPages speculative:                            157718.\nPages throttled:                                   0.\nPages wired down:                             546802.\nPages purgeable:                                1304.\n\"Translation faults\":                    13722834208.\nPages copy-on-write:                       624278805.\nPages zero filled:                       14750135613.\nPages reactivated:                        2142929389.\nPages purged:                               61147401.\nFile-backed pages:                           1447647.\nAnonymous pages:                              628127.\nPages stored in compressor:                  1407312.\nPages occupied by compressor:                 420738.\nDecompressions:                            955808778.\nCompressions:                             1249339647.\nPageins:                                  5704829171.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 175195.\nPages tagged resident:                        130495.\nPages tagged compressed:                       44700.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                          986.\nPages tag-storage non-tag pageable:            90409.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7128384.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559435.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 24780472320, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    47674.\nPages active:                                1049637.\nPages inactive:                               890736.\nPages speculative:                            157729.\nPages throttled:                                   0.\nPages wired down:                             518150.\nPages purgeable:                               17152.\n\"Translation faults\":                    13722855127.\nPages copy-on-write:                       624279015.\nPages zero filled:                       14750149695.\nPages reactivated:                        2142929389.\nPages purged:                               61147401.\nFile-backed pages:                           1447654.\nAnonymous pages:                              650448.\nPages stored in compressor:                  1407282.\nPages occupied by compressor:                 420725.\nDecompressions:                            955808808.\nCompressions:                             1249339647.\nPageins:                                  5704829174.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 175286.\nPages tagged resident:                        130586.\nPages tagged compressed:                       44700.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1053.\nPages tag-storage non-tag pageable:            90342.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7128384.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559435.\n"}, "client_seconds": 3.4197731250000025, "headers_seconds": 0.0006565420000015365, "first_protocol_delta_seconds": 1.0613374580000006, "first_visible_text_seconds": 1.266620083000003, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "effective_pool_slots": 640, "output_before_completion_frame": {"failed": false, "queuedFrames": 16, "writtenBytes": 1765, "writtenFrames": 16, "firstWriteSeconds": 1.060679042, "queuedBytes": 1765, "peakOwnedBytes": 116, "socketWaitSeconds": 0}, "effective_prefill_chunk": 256, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false, "incrementalIndexer": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": false, "boundedIndexer": false, "workspaceTokenTile": 256, "boundedOutputQueue": true, "demandedPrefillOutput": false, "boundedPLE": false, "compactStateWindows": true, "disjointSweepOutput": false, "reuseFirstMTPEntry": false, "readScopeTokens": 0, "boundedDraftTail": false, "compactNgramRows": false, "boundedSweepRows": false}, "stats": {"decodeIOSeconds": 1.1573107479999993, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillTokens": 17, "prefillPhysicalFootprintBytes": 5446339944, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 2.09e-07, "finishReason": "length", "mlxCacheEndBytes": 37649269, "sampledFootprint": {"samples": 172, "intervalMilliseconds": 20, "peakBytes": 5446733160}, "tokenCallbackSeconds": 0.0031155790000000007, "prefillRecords": 3359, "prefillScatterSeconds": 0.0028510429999999997, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "decodeForwardPasses": 15, "firstTextSeconds": 1.060450125, "generatorVMBefore": {"swapins": 41697895, "reclaimableBytes": 27003666432, "swapouts": 69922789}, "verifyPasses": 0, "reconciledHeadTokens": 0, "mlxActiveEndBytes": 4848326832, "imageEncodeSeconds": 4.1e-08, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 38330609, "promptTokens": 17, "reusedHeadTokens": 0, "mlxPeakMemoryGB": 5.09042779, "prefillComputePasses": [17], "acceptedDrafts": 0, "interTokenSeconds": [0.205307709, 0.151715625, 0.125947875, 0.1384265, 0.154925958, 0.158612625, 0.126877041, 0.137333083, 0.163239208, 0.164905, 0.161787875, 0.187028959, 0.150429375, 0.175101042, 0.156256708], "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 3.418827, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "prefillMLXActiveBytes": 4847547188, "peakMemoryGB": 5.445946728, "decodeScatterSeconds": 0.011838625, "ngramRowMisses": 0, "prefillIOSeconds": 0.6702517940000001, "decodeSeconds": 2.358243959, "decodeRecords": 4722, "reusedPrefixTokens": 0, "lifetimeRSSPeakBytes": 3480502272, "sampleSeconds": 0.003803417, "reconciliationSeconds": 0, "generatorVMAfter": {"swapins": 41697895, "reclaimableBytes": 27365720064, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 1.060219917, "firstTokenSeconds": 1.060425584, "physicalFootprintEndBytes": 5445946728}, "effective_mtp": false}}
{"round": 2, "arm": "router", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_ROUTER_TOPK": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 30252400640, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   381751.\nPages active:                                1033223.\nPages inactive:                               874198.\nPages speculative:                            157732.\nPages throttled:                                   0.\nPages wired down:                             216783.\nPages purgeable:                               17087.\n\"Translation faults\":                    13722855924.\nPages copy-on-write:                       624279162.\nPages zero filled:                       14750149942.\nPages reactivated:                        2142929389.\nPages purged:                               61147401.\nFile-backed pages:                           1447622.\nAnonymous pages:                              617531.\nPages stored in compressor:                  1407282.\nPages occupied by compressor:                 420725.\nDecompressions:                            955808808.\nCompressions:                             1249339647.\nPageins:                                  5704829175.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 175218.\nPages tagged resident:                        130518.\nPages tagged compressed:                       44700.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1223.\nPages tag-storage non-tag pageable:            90172.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7128384.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559435.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "62914", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 24616042496, "swapins": 41697895, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    50694.\nPages active:                                1037461.\nPages inactive:                               885502.\nPages speculative:                            157773.\nPages throttled:                                   0.\nPages wired down:                             532410.\nPages purgeable:                                4044.\n\"Translation faults\":                    13723089368.\nPages copy-on-write:                       624280468.\nPages zero filled:                       14750496273.\nPages reactivated:                        2142929393.\nPages purged:                               61147401.\nFile-backed pages:                           1447706.\nAnonymous pages:                              633030.\nPages stored in compressor:                  1407200.\nPages occupied by compressor:                 420702.\nDecompressions:                            955808890.\nCompressions:                             1249339647.\nPageins:                                  5704829217.\nPageouts:                                   10616421.\nSwapins:                                    41697895.\nSwapouts:                                   69922789.\nPages tagged:                                 175289.\nPages tagged resident:                        130589.\nPages tagged compressed:                       44700.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                          952.\nPages tag-storage non-tag pageable:            90443.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7128384.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559435.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 24493539328, "swapins": 41697899, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    44800.\nPages active:                                1044283.\nPages inactive:                               885983.\nPages speculative:                            156753.\nPages throttled:                                   0.\nPages wired down:                             533005.\nPages purgeable:                                1767.\n\"Translation faults\":                    13723170105.\nPages copy-on-write:                       624293686.\nPages zero filled:                       14750519787.\nPages reactivated:                        2142929399.\nPages purged:                               61147657.\nFile-backed pages:                           1448400.\nAnonymous pages:                              638619.\nPages stored in compressor:                  1405471.\nPages occupied by compressor:                 420018.\nDecompressions:                            955810559.\nCompressions:                             1249339647.\nPageins:                                  5704829652.\nPageouts:                                   10616421.\nSwapins:                                    41697899.\nSwapouts:                                   69922789.\nPages tagged:                                 175250.\nPages tagged resident:                        130568.\nPages tagged compressed:                       44682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                          901.\nPages tag-storage non-tag pageable:            90494.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7126528.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559453.\n"}, "client_seconds": 3.5987297909999967, "headers_seconds": 0.0005010830000031774, "first_protocol_delta_seconds": 1.0467624999999998, "first_visible_text_seconds": 1.2380862079999986, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "stats": {"decodeIOSeconds": 1.1131137360000005, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillTokens": 17, "prefillPhysicalFootprintBytes": 5443571024, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 2.08e-07, "finishReason": "length", "mlxCacheEndBytes": 37650647, "sampledFootprint": {"samples": 181, "intervalMilliseconds": 20, "peakBytes": 5447388568}, "tokenCallbackSeconds": 0.003461960999999999, "prefillRecords": 3359, "prefillScatterSeconds": 0.0026416339999999995, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "mlxActiveEndBytes": 4848326832, "firstTextSeconds": 1.046039333, "reconciledHeadTokens": 0, "decodeForwardPasses": 15, "generatorVMBefore": {"swapins": 41697895, "reclaimableBytes": 27202404352, "swapouts": 69922789}, "imageEncodeSeconds": 4.1e-08, "verifyPasses": 0, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 38703317, "promptTokens": 17, "reusedHeadTokens": 0, "interTokenSeconds": [0.19136025, 0.137798, 0.119986542, 0.128728292, 0.150333917, 0.149731, 0.120292708, 0.133643292, 0.167795792, 0.158573417, 0.157909708, 0.243488, 0.222762334, 0.246596416, 0.222261292], "prefillComputePasses": [17], "acceptedDrafts": 0, "mlxPeakMemoryGB": 5.090379318, "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 3.597926083, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "decodeScatterSeconds": 0.012575018999999991, "peakMemoryGB": 5.446667672, "prefillMLXActiveBytes": 4847175858, "ngramRowMisses": 0, "prefillIOSeconds": 0.661642823, "decodeSeconds": 2.551755042, "decodeRecords": 4722, "reusedPrefixTokens": 0, "sampleSeconds": 0.0042038760000000005, "lifetimeRSSPeakBytes": 3481223168, "reconciliationSeconds": 0, "generatorVMAfter": {"swapins": 41697899, "reclaimableBytes": 27064434688, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 1.045744292, "firstTokenSeconds": 1.046016459, "physicalFootprintEndBytes": 5446667672}, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "effective_prefill_chunk": 256, "effective_pool_slots": 640, "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false, "incrementalIndexer": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": true, "workspaceTokenTile": 256, "boundedIndexer": false, "boundedOutputQueue": false, "boundedPLE": false, "demandedPrefillOutput": false, "compactStateWindows": true, "disjointSweepOutput": false, "readScopeTokens": 0, "reuseFirstMTPEntry": false, "boundedDraftTail": false, "compactNgramRows": false, "boundedSweepRows": false}, "effective_mtp": false}, "exclusion": "swap activity during measured request; pair excluded"}
{"round": 2, "arm": "reference", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 29952212992, "swapins": 41697899, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   377980.\nPages active:                                1026203.\nPages inactive:                               871781.\nPages speculative:                            156833.\nPages throttled:                                   0.\nPages wired down:                             231697.\nPages purgeable:                                1702.\n\"Translation faults\":                    13723172137.\nPages copy-on-write:                       624294068.\nPages zero filled:                       14750520457.\nPages reactivated:                        2142929399.\nPages purged:                               61147657.\nFile-backed pages:                           1448456.\nAnonymous pages:                              606361.\nPages stored in compressor:                  1405470.\nPages occupied by compressor:                 420018.\nDecompressions:                            955810560.\nCompressions:                             1249339647.\nPageins:                                  5704829662.\nPageouts:                                   10616421.\nSwapins:                                    41697899.\nSwapouts:                                   69922789.\nPages tagged:                                 175182.\nPages tagged resident:                        130500.\nPages tagged compressed:                       44682.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1237.\nPages tag-storage non-tag pageable:            90158.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7126528.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559453.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "62920", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 22783852544, "swapins": 41697899, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     5693.\nPages active:                                1070177.\nPages inactive:                               994716.\nPages speculative:                             73288.\nPages throttled:                                   0.\nPages wired down:                             521629.\nPages purgeable:                                8840.\n\"Translation faults\":                    13724010200.\nPages copy-on-write:                       624370363.\nPages zero filled:                       14751057771.\nPages reactivated:                        2142941913.\nPages purged:                               61148985.\nFile-backed pages:                           1376083.\nAnonymous pages:                              762098.\nPages stored in compressor:                  1405027.\nPages occupied by compressor:                 419891.\nDecompressions:                            955810978.\nCompressions:                             1249339647.\nPageins:                                  5704830795.\nPageouts:                                   10616421.\nSwapins:                                    41697899.\nSwapouts:                                   69922789.\nPages tagged:                                 175176.\nPages tagged resident:                        130557.\nPages tagged compressed:                       44619.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                          184.\nPages tag-storage non-tag pageable:            91201.\nPages tag-storage non-tag wired:                  18.\nBytes of compressed tags:                    7113728.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559514.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 21232418816, "swapins": 41697899, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4086.\nPages active:                                1061124.\nPages inactive:                              1047287.\nPages speculative:                             11900.\nPages throttled:                                   0.\nPages wired down:                             541266.\nPages purgeable:                                 118.\n\"Translation faults\":                    13724717515.\nPages copy-on-write:                       624463008.\nPages zero filled:                       14751259022.\nPages reactivated:                        2142954119.\nPages purged:                               61149760.\nFile-backed pages:                           1291720.\nAnonymous pages:                              828591.\nPages stored in compressor:                  1404871.\nPages occupied by compressor:                 419876.\nDecompressions:                            955811052.\nCompressions:                             1249339647.\nPageins:                                  5704832079.\nPageouts:                                   10616542.\nSwapins:                                    41697899.\nSwapouts:                                   69922789.\nPages tagged:                                 175208.\nPages tagged resident:                        130590.\nPages tagged compressed:                       44618.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                          162.\nPages tag-storage non-tag pageable:            91203.\nPages tag-storage non-tag wired:                  38.\nBytes of compressed tags:                    7113664.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559515.\n"}, "client_seconds": 4.981613000000003, "headers_seconds": 0.0008542090000034364, "first_protocol_delta_seconds": 1.288570834000005, "first_visible_text_seconds": 1.5968338750000015, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false, "incrementalIndexer": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": false, "boundedIndexer": false, "workspaceTokenTile": 256, "boundedOutputQueue": false, "boundedPLE": false, "demandedPrefillOutput": false, "compactStateWindows": true, "disjointSweepOutput": false, "readScopeTokens": 0, "boundedDraftTail": false, "reuseFirstMTPEntry": false, "compactNgramRows": false, "boundedSweepRows": false}, "effective_prefill_chunk": 256, "stats": {"decodeIOSeconds": 1.2708309440000007, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillTokens": 17, "prefillPhysicalFootprintBytes": 5508271560, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 5.84e-07, "finishReason": "length", "mlxCacheEndBytes": 37649269, "sampledFootprint": {"samples": 250, "intervalMilliseconds": 20, "peakBytes": 5508648392}, "tokenCallbackSeconds": 0.004486376, "prefillRecords": 3359, "prefillScatterSeconds": 0.004707619999999998, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "mlxActiveEndBytes": 4848326832, "firstTextSeconds": 1.28740325, "verifyPasses": 0, "generatorVMBefore": {"reclaimableBytes": 23983931392, "swapins": 41697899, "swapouts": 69922789}, "decodeForwardPasses": 15, "imageEncodeSeconds": 8.4e-08, "reconciledHeadTokens": 0, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 36921305, "promptTokens": 17, "interTokenSeconds": [0.308444375, 0.224126834, 0.236955875, 0.257261875, 0.237010875, 0.252840166, 0.2059835, 0.221407042, 0.251166334, 0.244927792, 0.24063525, 0.266903375, 0.233074334, 0.267544583, 0.244127333], "reusedHeadTokens": 0, "prefillComputePasses": [17], "mlxPeakMemoryGB": 5.09042779, "acceptedDrafts": 0, "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 4.980487917, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "decodeScatterSeconds": 0.021979125999999977, "peakMemoryGB": 5.507894728, "prefillMLXActiveBytes": 4848956492, "ngramRowMisses": 0, "prefillIOSeconds": 0.7502530379999998, "decodeSeconds": 3.693362708, "decodeRecords": 4722, "reusedPrefixTokens": 0, "sampleSeconds": 0.006789249999999999, "lifetimeRSSPeakBytes": 3541794816, "reconciliationSeconds": 0, "generatorVMAfter": {"reclaimableBytes": 21436203008, "swapins": 41697899, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 1.2866095, "firstTokenSeconds": 1.287365416, "physicalFootprintEndBytes": 5507894728}, "effective_mtp": false, "effective_pool_slots": 640}}
{"round": 3, "arm": "reference", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 26721615872, "swapins": 41697899, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   339176.\nPages active:                                1044326.\nPages inactive:                              1029913.\nPages speculative:                             11903.\nPages throttled:                                   0.\nPages wired down:                             240070.\nPages purgeable:                                  94.\n\"Translation faults\":                    13724733089.\nPages copy-on-write:                       624464969.\nPages zero filled:                       14751263892.\nPages reactivated:                        2142954119.\nPages purged:                               61149760.\nFile-backed pages:                           1291688.\nAnonymous pages:                              794454.\nPages stored in compressor:                  1404871.\nPages occupied by compressor:                 419876.\nDecompressions:                            955811052.\nCompressions:                             1249339647.\nPageins:                                  5704832086.\nPageouts:                                   10616542.\nSwapins:                                    41697899.\nSwapouts:                                   69922789.\nPages tagged:                                 175140.\nPages tagged resident:                        130522.\nPages tagged compressed:                       44618.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                          480.\nPages tag-storage non-tag pageable:            90915.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7113664.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559515.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "62952", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 20514390016, "swapins": 41697899, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     4181.\nPages active:                                1060143.\nPages inactive:                              1057890.\nPages speculative:                               447.\nPages throttled:                                   0.\nPages wired down:                             543856.\nPages purgeable:                                 202.\n\"Translation faults\":                    13725756593.\nPages copy-on-write:                       624576106.\nPages zero filled:                       14751792321.\nPages reactivated:                        2142954503.\nPages purged:                               61149928.\nFile-backed pages:                           1247716.\nAnonymous pages:                              870764.\nPages stored in compressor:                  1403039.\nPages occupied by compressor:                 419201.\nDecompressions:                            955811419.\nCompressions:                             1249339647.\nPageins:                                  5704833532.\nPageouts:                                   10616545.\nSwapins:                                    41697899.\nSwapouts:                                   69922789.\nPages tagged:                                 175126.\nPages tagged resident:                        130508.\nPages tagged compressed:                       44618.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                          144.\nPages tag-storage non-tag pageable:            91234.\nPages tag-storage non-tag wired:                  25.\nBytes of compressed tags:                    7113664.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559515.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 24298209280, "swapins": 41697899, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   238031.\nPages active:                                 945553.\nPages inactive:                               894648.\nPages speculative:                             52500.\nPages throttled:                                   0.\nPages wired down:                             534382.\nPages purgeable:                                 113.\n\"Translation faults\":                    13725905416.\nPages copy-on-write:                       624579780.\nPages zero filled:                       14751891330.\nPages reactivated:                        2142954561.\nPages purged:                               61150052.\nFile-backed pages:                           1244901.\nAnonymous pages:                              647800.\nPages stored in compressor:                  1402955.\nPages occupied by compressor:                 419187.\nDecompressions:                            955811502.\nCompressions:                             1249339647.\nPageins:                                  5704834168.\nPageouts:                                   10616553.\nSwapins:                                    41697899.\nSwapouts:                                   69922789.\nPages tagged:                                 175301.\nPages tagged resident:                        130684.\nPages tagged compressed:                       44617.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1270.\nPages tag-storage non-tag pageable:            90108.\nPages tag-storage non-tag wired:                  25.\nBytes of compressed tags:                    7113600.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559516.\n"}, "client_seconds": 4.103558291999995, "headers_seconds": 0.0006495419999978935, "first_protocol_delta_seconds": 1.2029857919999998, "first_visible_text_seconds": 1.4177241249999994, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "effective_pool_slots": 640, "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "incrementalIndexer": false, "valueOnlySamplerThreshold": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": false, "workspaceTokenTile": 256, "boundedIndexer": false, "boundedOutputQueue": false, "boundedPLE": false, "demandedPrefillOutput": false, "compactStateWindows": true, "disjointSweepOutput": false, "reuseFirstMTPEntry": false, "readScopeTokens": 0, "boundedDraftTail": false, "compactNgramRows": false, "boundedSweepRows": false}, "stats": {"decodeIOSeconds": 1.2580071410000004, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillTokens": 17, "prefillPhysicalFootprintBytes": 5458152880, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 4.17e-07, "finishReason": "length", "mlxCacheEndBytes": 37661559, "sampledFootprint": {"samples": 206, "intervalMilliseconds": 20, "peakBytes": 5461773744}, "tokenCallbackSeconds": 0.0038225019999999998, "prefillScatterSeconds": 0.003561082, "prefillRecords": 3359, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "mlxActiveEndBytes": 4848326832, "firstTextSeconds": 1.202092917, "generatorVMBefore": {"swapins": 41697899, "swapouts": 69922789, "reclaimableBytes": 20521107456}, "reconciledHeadTokens": 0, "decodeForwardPasses": 15, "imageEncodeSeconds": 4.2e-08, "verifyPasses": 0, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 38701939, "promptTokens": 17, "interTokenSeconds": [0.214802959, 0.285749375, 0.322976833, 0.220552458, 0.218620041, 0.184284167, 0.131583125, 0.140379375, 0.17261775, 0.169282959, 0.166428959, 0.187353709, 0.1496435, 0.175482792, 0.160277333], "mlxPeakMemoryGB": 5.09042779, "prefillComputePasses": [17], "acceptedDrafts": 0, "reusedHeadTokens": 0, "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 4.102661375, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "decodeScatterSeconds": 0.01657565300000001, "peakMemoryGB": 5.460889008, "prefillMLXActiveBytes": 4847175858, "ngramRowMisses": 0, "prefillIOSeconds": 0.700822414, "decodeSeconds": 2.900549042, "decodeRecords": 4722, "reusedPrefixTokens": 0, "sampleSeconds": 0.004548956000000001, "lifetimeRSSPeakBytes": 3495051264, "reconciliationSeconds": 0, "generatorVMAfter": {"swapins": 41697899, "swapouts": 69922789, "reclaimableBytes": 25157353472}, "decodeTokens": 16, "prefillSeconds": 1.201722, "firstTokenSeconds": 1.202065625, "physicalFootprintEndBytes": 5460889008}, "effective_mtp": false, "effective_prefill_chunk": 256, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521]}}
{"round": 3, "arm": "router", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_ROUTER_TOPK": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 29785538560, "swapins": 41697899, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   573047.\nPages active:                                 929556.\nPages inactive:                               874832.\nPages speculative:                             54370.\nPages throttled:                                   0.\nPages wired down:                             233012.\nPages purgeable:                                  48.\n\"Translation faults\":                    13725906023.\nPages copy-on-write:                       624579926.\nPages zero filled:                       14751891391.\nPages reactivated:                        2142954561.\nPages purged:                               61150052.\nFile-backed pages:                           1244870.\nAnonymous pages:                              613888.\nPages stored in compressor:                  1402952.\nPages occupied by compressor:                 419187.\nDecompressions:                            955811505.\nCompressions:                             1249339647.\nPageins:                                  5704834169.\nPageouts:                                   10616553.\nSwapins:                                    41697899.\nSwapouts:                                   69922789.\nPages tagged:                                 175233.\nPages tagged resident:                        130616.\nPages tagged compressed:                       44617.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1601.\nPages tag-storage non-tag pageable:            89794.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7113600.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559516.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "62959", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 23619158016, "swapins": 41697899, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   180442.\nPages active:                                 982442.\nPages inactive:                               920009.\nPages speculative:                             59890.\nPages throttled:                                   0.\nPages wired down:                             522760.\nPages purgeable:                               10191.\n\"Translation faults\":                    13726247647.\nPages copy-on-write:                       624593749.\nPages zero filled:                       14752296785.\nPages reactivated:                        2142954566.\nPages purged:                               61150052.\nFile-backed pages:                           1250966.\nAnonymous pages:                              711375.\nPages stored in compressor:                  1402576.\nPages occupied by compressor:                 419104.\nDecompressions:                            955811742.\nCompressions:                             1249339647.\nPageins:                                  5704835683.\nPageouts:                                   10616553.\nSwapins:                                    41697899.\nSwapouts:                                   69922789.\nPages tagged:                                 175301.\nPages tagged resident:                        130716.\nPages tagged compressed:                       44585.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                          868.\nPages tag-storage non-tag pageable:            90504.\nPages tag-storage non-tag wired:                  31.\nBytes of compressed tags:                    7108608.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559548.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 24214142976, "swapins": 41697899, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   218113.\nPages active:                                 963698.\nPages inactive:                               902909.\nPages speculative:                             60296.\nPages throttled:                                   0.\nPages wired down:                             520417.\nPages purgeable:                                8412.\n\"Translation faults\":                    13726298315.\nPages copy-on-write:                       624593904.\nPages zero filled:                       14752346674.\nPages reactivated:                        2142954591.\nPages purged:                               61150052.\nFile-backed pages:                           1251389.\nAnonymous pages:                              675514.\nPages stored in compressor:                  1402473.\nPages occupied by compressor:                 419077.\nDecompressions:                            955811845.\nCompressions:                             1249339647.\nPageins:                                  5704835685.\nPageouts:                                   10616553.\nSwapins:                                    41697899.\nSwapouts:                                   69922789.\nPages tagged:                                 175251.\nPages tagged resident:                        130667.\nPages tagged compressed:                       44584.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1111.\nPages tag-storage non-tag pageable:            90261.\nPages tag-storage non-tag wired:                  31.\nBytes of compressed tags:                    7108096.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559549.\n"}, "client_seconds": 4.768366792000009, "headers_seconds": 0.0006270420000049626, "first_protocol_delta_seconds": 1.194217542000004, "first_visible_text_seconds": 1.448919917000012, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "effective_prefill_chunk": 256, "effective_mtp": false, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "stats": {"decodeIOSeconds": 1.2552987070000003, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillPhysicalFootprintBytes": 5478059440, "prefillTokens": 17, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 3.75e-07, "finishReason": "length", "mlxCacheEndBytes": 37650647, "sampledFootprint": {"samples": 240, "intervalMilliseconds": 20, "peakBytes": 5478485424}, "tokenCallbackSeconds": 0.004162791999999999, "prefillRecords": 3359, "prefillScatterSeconds": 0.003883377, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "mlxActiveEndBytes": 4848326832, "firstTextSeconds": 1.19332725, "verifyPasses": 0, "generatorVMBefore": {"reclaimableBytes": 24601788416, "swapins": 41697899, "swapouts": 69922789}, "decodeForwardPasses": 15, "imageEncodeSeconds": 4.2e-08, "reconciledHeadTokens": 0, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 36922679, "promptTokens": 17, "reusedHeadTokens": 0, "prefillComputePasses": [17], "mlxPeakMemoryGB": 5.090379318, "acceptedDrafts": 0, "interTokenSeconds": [0.25471525, 0.235873042, 0.20826075, 0.220585917, 0.244345667, 0.243632042, 0.207015458, 0.215396542, 0.252430458, 0.24712725, 0.251889375, 0.268815208, 0.237124542, 0.258718958, 0.227612125], "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 4.767451416, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "decodeScatterSeconds": 0.018696337999999996, "prefillMLXActiveBytes": 4848956496, "peakMemoryGB": 5.477715376, "ngramRowMisses": 0, "prefillIOSeconds": 0.7033501259999997, "decodeSeconds": 3.574143209, "decodeRecords": 4722, "reusedPrefixTokens": 0, "lifetimeRSSPeakBytes": 3512205312, "sampleSeconds": 0.006612581000000001, "reconciliationSeconds": 0, "generatorVMAfter": {"reclaimableBytes": 25202524160, "swapins": 41697899, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 1.192899416, "firstTokenSeconds": 1.19330075, "physicalFootprintEndBytes": 5477715376}, "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "incrementalIndexer": false, "valueOnlySamplerThreshold": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": true, "workspaceTokenTile": 256, "boundedIndexer": false, "boundedOutputQueue": false, "boundedPLE": false, "demandedPrefillOutput": false, "compactStateWindows": true, "disjointSweepOutput": false, "reuseFirstMTPEntry": false, "boundedDraftTail": false, "readScopeTokens": 0, "compactNgramRows": false, "boundedSweepRows": false}, "effective_pool_slots": 640}}
{"round": 3, "arm": "queue", "valid": false, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 29717168128, "swapins": 41697899, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   554088.\nPages active:                                 946610.\nPages inactive:                               885066.\nPages speculative:                             60299.\nPages throttled:                                   0.\nPages wired down:                             219055.\nPages purgeable:                                8347.\n\"Translation faults\":                    13726299096.\nPages copy-on-write:                       624594057.\nPages zero filled:                       14752346830.\nPages reactivated:                        2142954591.\nPages purged:                               61150052.\nFile-backed pages:                           1251357.\nAnonymous pages:                              640618.\nPages stored in compressor:                  1402473.\nPages occupied by compressor:                 419077.\nDecompressions:                            955811845.\nCompressions:                             1249339647.\nPageins:                                  5704835686.\nPageouts:                                   10616553.\nSwapins:                                    41697899.\nSwapouts:                                   69922789.\nPages tagged:                                 175183.\nPages tagged resident:                        130599.\nPages tagged compressed:                       44584.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1382.\nPages tag-storage non-tag pageable:            90013.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7108096.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559549.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "62965", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 24009375744, "swapins": 41697899, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   213645.\nPages active:                                 956780.\nPages inactive:                               898394.\nPages speculative:                             60428.\nPages throttled:                                   0.\nPages wired down:                             536327.\nPages purgeable:                                 178.\n\"Translation faults\":                    13726544287.\nPages copy-on-write:                       624595333.\nPages zero filled:                       14752711067.\nPages reactivated:                        2142954591.\nPages purged:                               61150052.\nFile-backed pages:                           1251593.\nAnonymous pages:                              664009.\nPages stored in compressor:                  1402411.\nPages occupied by compressor:                 419061.\nDecompressions:                            955811907.\nCompressions:                             1249339647.\nPageins:                                  5704835855.\nPageouts:                                   10616553.\nSwapins:                                    41697899.\nSwapouts:                                   69922789.\nPages tagged:                                 175229.\nPages tagged resident:                        130647.\nPages tagged compressed:                       44582.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1155.\nPages tag-storage non-tag pageable:            90223.\nPages tag-storage non-tag wired:                  25.\nBytes of compressed tags:                    7107968.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559551.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 24005361664, "swapins": 41697903, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   212987.\nPages active:                                 952105.\nPages inactive:                               904909.\nPages speculative:                             60595.\nPages throttled:                                   0.\nPages wired down:                             535032.\nPages purgeable:                                 188.\n\"Translation faults\":                    13726778184.\nPages copy-on-write:                       624612226.\nPages zero filled:                       14752772504.\nPages reactivated:                        2142954591.\nPages purged:                               61150052.\nFile-backed pages:                           1251996.\nAnonymous pages:                              665613.\nPages stored in compressor:                  1402369.\nPages occupied by compressor:                 419053.\nDecompressions:                            955811949.\nCompressions:                             1249339647.\nPageins:                                  5704836256.\nPageouts:                                   10616553.\nSwapins:                                    41697903.\nSwapouts:                                   69922789.\nPages tagged:                                 175164.\nPages tagged resident:                        130582.\nPages tagged compressed:                       44582.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1132.\nPages tag-storage non-tag pageable:            90246.\nPages tag-storage non-tag wired:                  25.\nBytes of compressed tags:                    7107968.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559551.\n"}, "client_seconds": 4.018808415999999, "headers_seconds": 0.0005474999999961483, "first_protocol_delta_seconds": 1.1506341249999963, "first_visible_text_seconds": 1.3603965829999964, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "output_before_completion_frame": {"failed": false, "queuedFrames": 16, "writtenBytes": 1765, "writtenFrames": 16, "firstWriteSeconds": 1.150073458, "queuedBytes": 1765, "peakOwnedBytes": 116, "socketWaitSeconds": 0}, "stats": {"decodeIOSeconds": 1.1860206970000005, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillPhysicalFootprintBytes": 5453761920, "prefillTokens": 17, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 3.34e-07, "finishReason": "length", "mlxCacheEndBytes": 37649269, "sampledFootprint": {"samples": 202, "intervalMilliseconds": 20, "peakBytes": 5454089600}, "tokenCallbackSeconds": 0.0035015429999999993, "prefillRecords": 3359, "prefillScatterSeconds": 0.0031255440000000005, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "decodeForwardPasses": 15, "mlxActiveEndBytes": 4848326832, "verifyPasses": 0, "generatorVMBefore": {"swapins": 41697899, "reclaimableBytes": 25000706048, "swapouts": 69922789}, "reconciledHeadTokens": 0, "imageEncodeSeconds": 4.2e-08, "firstTextSeconds": 1.149835834, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 36921309, "promptTokens": 17, "interTokenSeconds": [0.20980475, 0.18375675, 0.189342417, 0.143563042, 0.169706833, 0.165400417, 0.17066625, 0.204941292, 0.241087375, 0.224275125, 0.221434959, 0.188021459, 0.156153667, 0.180726167, 0.218666208], "prefillComputePasses": [17], "mlxPeakMemoryGB": 5.09042779, "acceptedDrafts": 0, "reusedHeadTokens": 0, "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 4.017954334, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "decodeScatterSeconds": 0.013857004000000003, "peakMemoryGB": 5.453385088, "prefillMLXActiveBytes": 4848956488, "ngramRowMisses": 0, "prefillIOSeconds": 0.6871767880000001, "decodeSeconds": 2.868049833, "decodeRecords": 4722, "reusedPrefixTokens": 0, "lifetimeRSSPeakBytes": 3487924224, "sampleSeconds": 0.004927124, "reconciliationSeconds": 0, "generatorVMAfter": {"swapins": 41697903, "reclaimableBytes": 24998608896, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 1.149505334, "firstTokenSeconds": 1.149808792, "physicalFootprintEndBytes": 5453385088}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "effective_mtp": false, "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "incrementalIndexer": false, "valueOnlySamplerThreshold": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": false, "workspaceTokenTile": 256, "boundedIndexer": false, "boundedOutputQueue": true, "boundedPLE": false, "demandedPrefillOutput": false, "compactStateWindows": true, "disjointSweepOutput": false, "readScopeTokens": 0, "reuseFirstMTPEntry": false, "boundedDraftTail": false, "compactNgramRows": false, "boundedSweepRows": false}, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "effective_pool_slots": 640, "effective_prefill_chunk": 256}, "exclusion": "swap activity during measured request; pair excluded"}
{"round": 4, "arm": "queue", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 29469179904, "swapins": 41697903, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   546566.\nPages active:                                 942854.\nPages inactive:                               881566.\nPages speculative:                             60597.\nPages throttled:                                   0.\nPages wired down:                             233749.\nPages purgeable:                                 126.\n\"Translation faults\":                    13726786564.\nPages copy-on-write:                       624612630.\nPages zero filled:                       14752775476.\nPages reactivated:                        2142954591.\nPages purged:                               61150052.\nFile-backed pages:                           1251964.\nAnonymous pages:                              633053.\nPages stored in compressor:                  1402369.\nPages occupied by compressor:                 419053.\nDecompressions:                            955811949.\nCompressions:                             1249339647.\nPageins:                                  5704836257.\nPageouts:                                   10616553.\nSwapins:                                    41697903.\nSwapouts:                                   69922789.\nPages tagged:                                 175126.\nPages tagged resident:                        130544.\nPages tagged compressed:                       44582.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1204.\nPages tag-storage non-tag pageable:            90191.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7107968.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559551.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "63002", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 24119984128, "swapins": 41697903, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   219329.\nPages active:                                 950528.\nPages inactive:                               900102.\nPages speculative:                             61058.\nPages throttled:                                   0.\nPages wired down:                             534422.\nPages purgeable:                                 215.\n\"Translation faults\":                    13727108303.\nPages copy-on-write:                       624631748.\nPages zero filled:                       14753139750.\nPages reactivated:                        2142954735.\nPages purged:                               61150052.\nFile-backed pages:                           1252623.\nAnonymous pages:                              659065.\nPages stored in compressor:                  1402169.\nPages occupied by compressor:                 419017.\nDecompressions:                            955812149.\nCompressions:                             1249339647.\nPageins:                                  5704837367.\nPageouts:                                   10616553.\nSwapins:                                    41697903.\nSwapouts:                                   69922789.\nPages tagged:                                 175309.\nPages tagged resident:                        130736.\nPages tagged compressed:                       44573.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1326.\nPages tag-storage non-tag pageable:            90057.\nPages tag-storage non-tag wired:                  20.\nBytes of compressed tags:                    7105728.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559560.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 23855300608, "swapins": 41697903, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   191672.\nPages active:                                 970143.\nPages inactive:                               907666.\nPages speculative:                             61197.\nPages throttled:                                   0.\nPages wired down:                             534768.\nPages purgeable:                               10421.\n\"Translation faults\":                    13727353352.\nPages copy-on-write:                       624675848.\nPages zero filled:                       14753215597.\nPages reactivated:                        2142954745.\nPages purged:                               61150052.\nFile-backed pages:                           1253919.\nAnonymous pages:                              685087.\nPages stored in compressor:                  1401938.\nPages occupied by compressor:                 418884.\nDecompressions:                            955812378.\nCompressions:                             1249339647.\nPageins:                                  5704838486.\nPageouts:                                   10616553.\nSwapins:                                    41697903.\nSwapouts:                                   69922789.\nPages tagged:                                 175283.\nPages tagged resident:                        130722.\nPages tagged compressed:                       44561.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1247.\nPages tag-storage non-tag pageable:            90136.\nPages tag-storage non-tag wired:                  20.\nBytes of compressed tags:                    7105088.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559570.\n"}, "client_seconds": 4.282666958000007, "headers_seconds": 0.0005355830000013384, "first_protocol_delta_seconds": 1.099262416000002, "first_visible_text_seconds": 1.3350569159999992, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "incrementalIndexer": false, "valueOnlySamplerThreshold": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": false, "boundedIndexer": false, "workspaceTokenTile": 256, "boundedOutputQueue": true, "boundedPLE": false, "demandedPrefillOutput": false, "compactStateWindows": true, "disjointSweepOutput": false, "reuseFirstMTPEntry": false, "readScopeTokens": 0, "boundedDraftTail": false, "compactNgramRows": false, "boundedSweepRows": false}, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "output_before_completion_frame": {"failed": false, "queuedFrames": 16, "firstWriteSeconds": 1.098681708, "writtenFrames": 16, "writtenBytes": 1765, "queuedBytes": 1765, "peakOwnedBytes": 116, "socketWaitSeconds": 0}, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "effective_mtp": false, "stats": {"decodeIOSeconds": 1.2101133550000003, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillTokens": 17, "prefillPhysicalFootprintBytes": 5451271552, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 1.25e-07, "finishReason": "length", "mlxCacheEndBytes": 37649269, "sampledFootprint": {"samples": 215, "intervalMilliseconds": 20, "peakBytes": 5454253488}, "tokenCallbackSeconds": 0.0035768759999999997, "prefillScatterSeconds": 0.0028200780000000006, "prefillRecords": 3359, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "decodeForwardPasses": 15, "reconciledHeadTokens": 0, "generatorVMBefore": {"swapins": 41697903, "reclaimableBytes": 25119653888, "swapouts": 69922789}, "verifyPasses": 0, "mlxActiveEndBytes": 4848326832, "imageEncodeSeconds": 0, "firstTextSeconds": 1.098440791, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 39160693, "promptTokens": 17, "reusedHeadTokens": 0, "prefillComputePasses": [17], "interTokenSeconds": [0.235857209, 0.221299875, 0.194046666, 0.210036708, 0.230227041, 0.233281, 0.193262875, 0.171024333, 0.216702792, 0.167828208, 0.225494, 0.19879975, 0.210871, 0.25569825, 0.218411458], "mlxPeakMemoryGB": 5.09042779, "acceptedDrafts": 0, "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 4.281844083, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "prefillMLXActiveBytes": 4846717104, "peakMemoryGB": 5.454040496, "decodeScatterSeconds": 0.01577107999999999, "ngramRowMisses": 0, "prefillIOSeconds": 0.688946414, "decodeSeconds": 3.183312542, "decodeRecords": 4722, "reusedPrefixTokens": 0, "lifetimeRSSPeakBytes": 3488546816, "sampleSeconds": 0.004960959, "reconciliationSeconds": 0, "generatorVMAfter": {"swapins": 41697903, "reclaimableBytes": 24858722304, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 1.09814075, "firstTokenSeconds": 1.098417834, "physicalFootprintEndBytes": 5454040496}}}
{"round": 4, "arm": "router", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_ROUTER_TOPK": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 29334618112, "swapins": 41697903, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   526200.\nPages active:                                 953468.\nPages inactive:                               890906.\nPages speculative:                             61200.\nPages throttled:                                   0.\nPages wired down:                             233398.\nPages purgeable:                               10356.\n\"Translation faults\":                    13727354408.\nPages copy-on-write:                       624675996.\nPages zero filled:                       14753215903.\nPages reactivated:                        2142954745.\nPages purged:                               61150052.\nFile-backed pages:                           1253887.\nAnonymous pages:                              651687.\nPages stored in compressor:                  1401938.\nPages occupied by compressor:                 418884.\nDecompressions:                            955812378.\nCompressions:                             1249339647.\nPageins:                                  5704838487.\nPageouts:                                   10616553.\nSwapins:                                    41697903.\nSwapouts:                                   69922789.\nPages tagged:                                 175215.\nPages tagged resident:                        130654.\nPages tagged compressed:                       44561.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1414.\nPages tag-storage non-tag pageable:            89981.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7105088.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559570.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "63022", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 23464263680, "swapins": 41697903, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   171718.\nPages active:                                 979658.\nPages inactive:                               915073.\nPages speculative:                             62796.\nPages throttled:                                   0.\nPages wired down:                             536007.\nPages purgeable:                                3536.\n\"Translation faults\":                    13727662966.\nPages copy-on-write:                       624679867.\nPages zero filled:                       14753614362.\nPages reactivated:                        2142954749.\nPages purged:                               61150052.\nFile-backed pages:                           1256891.\nAnonymous pages:                              700636.\nPages stored in compressor:                  1401767.\nPages occupied by compressor:                 418820.\nDecompressions:                            955812549.\nCompressions:                             1249339647.\nPageins:                                  5704839390.\nPageouts:                                   10616553.\nSwapins:                                    41697903.\nSwapouts:                                   69922789.\nPages tagged:                                 175521.\nPages tagged resident:                        131008.\nPages tagged compressed:                       44513.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1270.\nPages tag-storage non-tag pageable:            90125.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7096576.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559618.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 24527552512, "swapins": 41697903, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   238828.\nPages active:                                 945102.\nPages inactive:                               886034.\nPages speculative:                             63096.\nPages throttled:                                   0.\nPages wired down:                             532452.\nPages purgeable:                                 739.\n\"Translation faults\":                    13727693974.\nPages copy-on-write:                       624680161.\nPages zero filled:                       14753645919.\nPages reactivated:                        2142954749.\nPages purged:                               61150308.\nFile-backed pages:                           1257476.\nAnonymous pages:                              636756.\nPages stored in compressor:                  1401411.\nPages occupied by compressor:                 418729.\nDecompressions:                            955812905.\nCompressions:                             1249339647.\nPageins:                                  5704839472.\nPageouts:                                   10616553.\nSwapins:                                    41697903.\nSwapouts:                                   69922789.\nPages tagged:                                 175346.\nPages tagged resident:                        130833.\nPages tagged compressed:                       44513.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1492.\nPages tag-storage non-tag pageable:            89903.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7096576.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559618.\n"}, "client_seconds": 3.972135792000003, "headers_seconds": 0.0006371669999936103, "first_protocol_delta_seconds": 1.124325916999993, "first_visible_text_seconds": 1.3649663340000018, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "stats": {"decodeIOSeconds": 1.1868920169999992, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillTokens": 17, "prefillPhysicalFootprintBytes": 5457694152, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 4.17e-07, "finishReason": "length", "mlxCacheEndBytes": 37650647, "sampledFootprint": {"samples": 200, "intervalMilliseconds": 20, "peakBytes": 5462871496}, "tokenCallbackSeconds": 0.0036754150000000005, "prefillScatterSeconds": 0.003512998000000001, "prefillRecords": 3359, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "decodeForwardPasses": 15, "firstTextSeconds": 1.123441584, "verifyPasses": 0, "generatorVMBefore": {"reclaimableBytes": 24494505984, "swapins": 41697903, "swapouts": 69922789}, "mlxActiveEndBytes": 4848326832, "imageEncodeSeconds": 4.2e-08, "reconciledHeadTokens": 0, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 37627199, "promptTokens": 17, "interTokenSeconds": [0.240684542, 0.218742834, 0.193335583, 0.205412125, 0.230077292, 0.231523583, 0.19364525, 0.166274542, 0.172347292, 0.161887375, 0.163803916, 0.182805916, 0.151145292, 0.177101959, 0.158480667], "prefillComputePasses": [17], "reusedHeadTokens": 0, "acceptedDrafts": 0, "mlxPeakMemoryGB": 5.090379318, "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 3.971259375, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "decodeScatterSeconds": 0.013783744999999993, "prefillMLXActiveBytes": 4848251976, "peakMemoryGB": 5.462003144, "ngramRowMisses": 0, "prefillIOSeconds": 0.687346956, "decodeSeconds": 2.847798834, "decodeRecords": 4722, "reusedPrefixTokens": 0, "lifetimeRSSPeakBytes": 3496411136, "sampleSeconds": 0.004779332000000001, "reconciliationSeconds": 0, "generatorVMAfter": {"reclaimableBytes": 25562398720, "swapins": 41697903, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 1.123072208, "firstTokenSeconds": 1.123415583, "physicalFootprintEndBytes": 5462003144}, "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "incrementalIndexer": false, "valueOnlySamplerThreshold": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": true, "boundedIndexer": false, "workspaceTokenTile": 256, "boundedOutputQueue": false, "demandedPrefillOutput": false, "boundedPLE": false, "compactStateWindows": true, "disjointSweepOutput": false, "readScopeTokens": 0, "reuseFirstMTPEntry": false, "boundedDraftTail": false, "compactNgramRows": false, "boundedSweepRows": false}, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "effective_mtp": false}}
{"round": 4, "arm": "reference", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 30016667648, "swapins": 41697903, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   573955.\nPages active:                                 930431.\nPages inactive:                               866634.\nPages speculative:                             63127.\nPages throttled:                                   0.\nPages wired down:                             231081.\nPages purgeable:                                 674.\n\"Translation faults\":                    13727694584.\nPages copy-on-write:                       624680310.\nPages zero filled:                       14753645984.\nPages reactivated:                        2142954749.\nPages purged:                               61150308.\nFile-backed pages:                           1257443.\nAnonymous pages:                              602749.\nPages stored in compressor:                  1401411.\nPages occupied by compressor:                 418729.\nDecompressions:                            955812905.\nCompressions:                             1249339647.\nPageins:                                  5704839473.\nPageouts:                                   10616553.\nSwapins:                                    41697903.\nSwapouts:                                   69922789.\nPages tagged:                                 175278.\nPages tagged resident:                        130765.\nPages tagged compressed:                       44513.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1676.\nPages tag-storage non-tag pageable:            89719.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7096576.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559618.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "63028", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 24545411072, "swapins": 41697903, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   239867.\nPages active:                                 945826.\nPages inactive:                               883898.\nPages speculative:                             63220.\nPages throttled:                                   0.\nPages wired down:                             532378.\nPages purgeable:                                 729.\n\"Translation faults\":                    13727913025.\nPages copy-on-write:                       624680763.\nPages zero filled:                       14753984071.\nPages reactivated:                        2142954772.\nPages purged:                               61150308.\nFile-backed pages:                           1257537.\nAnonymous pages:                              635407.\nPages stored in compressor:                  1401200.\nPages occupied by compressor:                 418684.\nDecompressions:                            955813116.\nCompressions:                             1249339647.\nPageins:                                  5704839513.\nPageouts:                                   10616553.\nSwapins:                                    41697903.\nSwapouts:                                   69922789.\nPages tagged:                                 175355.\nPages tagged resident:                        130867.\nPages tagged compressed:                       44488.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         1510.\nPages tag-storage non-tag pageable:            89885.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7089152.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559643.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 26374569984, "swapins": 41697903, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   350853.\nPages active:                                 893855.\nPages inactive:                               860815.\nPages speculative:                             63107.\nPages throttled:                                   0.\nPages wired down:                             528258.\nPages purgeable:                                 771.\n\"Translation faults\":                    13727987946.\nPages copy-on-write:                       624693338.\nPages zero filled:                       14754007756.\nPages reactivated:                        2142954772.\nPages purged:                               61150308.\nFile-backed pages:                           1258152.\nAnonymous pages:                              559625.\nPages stored in compressor:                  1351464.\nPages occupied by compressor:                 385996.\nDecompressions:                            955814533.\nCompressions:                             1249339647.\nPageins:                                  5704839904.\nPageouts:                                   10616553.\nSwapins:                                    41697903.\nSwapouts:                                   69922789.\nPages tagged:                                 175375.\nPages tagged resident:                        130996.\nPages tagged compressed:                       44379.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         2671.\nPages tag-storage non-tag pageable:            88724.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7067712.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559752.\n"}, "client_seconds": 3.4636819170000024, "headers_seconds": 0.0006056670000020858, "first_protocol_delta_seconds": 1.0856313330000091, "first_visible_text_seconds": 1.2839275420000007, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "effective_mtp": false, "effective_pool_slots": 640, "effective_prefill_chunk": 256, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false, "incrementalIndexer": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": false, "workspaceTokenTile": 256, "boundedIndexer": false, "boundedOutputQueue": false, "boundedPLE": false, "demandedPrefillOutput": false, "compactStateWindows": true, "disjointSweepOutput": false, "reuseFirstMTPEntry": false, "boundedDraftTail": false, "readScopeTokens": 0, "compactNgramRows": false, "boundedSweepRows": false}, "stats": {"decodeIOSeconds": 1.129257968999999, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillPhysicalFootprintBytes": 5443898752, "prefillTokens": 17, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 5e-07, "finishReason": "length", "mlxCacheEndBytes": 37649269, "sampledFootprint": {"samples": 174, "intervalMilliseconds": 20, "peakBytes": 5446978944}, "tokenCallbackSeconds": 0.003600959, "prefillScatterSeconds": 0.003278874000000002, "prefillRecords": 3359, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "decodeForwardPasses": 15, "firstTextSeconds": 1.084819459, "mlxActiveEndBytes": 4848326832, "generatorVMBefore": {"swapins": 41697903, "reclaimableBytes": 25582665728, "swapouts": 69922789}, "verifyPasses": 0, "imageEncodeSeconds": 0, "reconciledHeadTokens": 0, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 38701939, "promptTokens": 17, "reusedHeadTokens": 0, "interTokenSeconds": [0.19832825, 0.15613275, 0.127875, 0.137239833, 0.208096709, 0.151055334, 0.1229285, 0.1322425, 0.162001792, 0.156062625, 0.158342833, 0.185353625, 0.151012917, 0.1757845, 0.155048959], "mlxPeakMemoryGB": 5.09042779, "acceptedDrafts": 0, "prefillComputePasses": [17], "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 3.462824084, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "decodeScatterSeconds": 0.012788432999999995, "peakMemoryGB": 5.446028672, "prefillMLXActiveBytes": 4847536306, "ngramRowMisses": 0, "prefillIOSeconds": 0.6829969140000001, "decodeSeconds": 2.377928666, "decodeRecords": 4722, "reusedPrefixTokens": 0, "lifetimeRSSPeakBytes": 3480584192, "sampleSeconds": 0.003716957, "reconciliationSeconds": 0, "generatorVMAfter": {"swapins": 41697903, "reclaimableBytes": 27407089664, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 1.084538583, "firstTokenSeconds": 1.084791625, "physicalFootprintEndBytes": 5446028672}, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351]}}
{"round": 5, "arm": "reference", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 31841583104, "swapins": 41697903, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   684515.\nPages active:                                 868830.\nPages inactive:                               853177.\nPages speculative:                             63192.\nPages throttled:                                   0.\nPages wired down:                             226888.\nPages purgeable:                                 714.\n\"Translation faults\":                    13727989313.\nPages copy-on-write:                       624693485.\nPages zero filled:                       14754007860.\nPages reactivated:                        2142954772.\nPages purged:                               61150308.\nFile-backed pages:                           1258227.\nAnonymous pages:                              526972.\nPages stored in compressor:                  1351105.\nPages occupied by compressor:                 385917.\nDecompressions:                            955814892.\nCompressions:                             1249339647.\nPageins:                                  5704839966.\nPageouts:                                   10616553.\nSwapins:                                    41697903.\nSwapouts:                                   69922789.\nPages tagged:                                 175382.\nPages tagged resident:                        131056.\nPages tagged compressed:                       44326.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         2985.\nPages tag-storage non-tag pageable:            88410.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7058432.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559805.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "63038", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 26374225920, "swapins": 41697907, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   350691.\nPages active:                                 894395.\nPages inactive:                               860463.\nPages speculative:                             63213.\nPages throttled:                                   0.\nPages wired down:                             527968.\nPages purgeable:                                 779.\n\"Translation faults\":                    13728206134.\nPages copy-on-write:                       624693894.\nPages zero filled:                       14754347226.\nPages reactivated:                        2142954772.\nPages purged:                               61150308.\nFile-backed pages:                           1258285.\nAnonymous pages:                              559786.\nPages stored in compressor:                  1351023.\nPages occupied by compressor:                 385898.\nDecompressions:                            955814969.\nCompressions:                             1249339647.\nPageins:                                  5704840006.\nPageouts:                                   10616553.\nSwapins:                                    41697907.\nSwapouts:                                   69922789.\nPages tagged:                                 175507.\nPages tagged resident:                        131196.\nPages tagged compressed:                       44311.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         2963.\nPages tag-storage non-tag pageable:            88425.\nPages tag-storage non-tag wired:                  15.\nBytes of compressed tags:                    7057344.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559815.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 26391052288, "swapins": 41697907, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   351685.\nPages active:                                 893507.\nPages inactive:                               859361.\nPages speculative:                             63231.\nPages throttled:                                   0.\nPages wired down:                             527868.\nPages purgeable:                                 789.\n\"Translation faults\":                    13728208108.\nPages copy-on-write:                       624694044.\nPages zero filled:                       14754348358.\nPages reactivated:                        2142954804.\nPages purged:                               61150308.\nFile-backed pages:                           1258308.\nAnonymous pages:                              557791.\nPages stored in compressor:                  1350978.\nPages occupied by compressor:                 385889.\nDecompressions:                            955815014.\nCompressions:                             1249339647.\nPageins:                                  5704840007.\nPageouts:                                   10616553.\nSwapins:                                    41697907.\nSwapouts:                                   69922789.\nPages tagged:                                 175455.\nPages tagged resident:                        131146.\nPages tagged compressed:                       44309.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         3614.\nPages tag-storage non-tag pageable:            87774.\nPages tag-storage non-tag wired:                  15.\nBytes of compressed tags:                    7057216.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559817.\n"}, "client_seconds": 3.294058375000006, "headers_seconds": 0.0005570000000005848, "first_protocol_delta_seconds": 1.0398370829999948, "first_visible_text_seconds": 1.2330100829999964, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "effective_prefill_chunk": 256, "effective_pool_slots": 640, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "effective_mtp": false, "stats": {"decodeIOSeconds": 1.106866294999999, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillPhysicalFootprintBytes": 5443587480, "prefillTokens": 17, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 2.08e-07, "finishReason": "length", "mlxCacheEndBytes": 37649269, "sampledFootprint": {"samples": 166, "intervalMilliseconds": 20, "peakBytes": 5444193688}, "tokenCallbackSeconds": 0.003366332, "prefillRecords": 3359, "prefillScatterSeconds": 0.002685200000000001, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "decodeForwardPasses": 15, "reconciledHeadTokens": 0, "generatorVMBefore": {"swapins": 41697907, "reclaimableBytes": 27411283968, "swapouts": 69922789}, "verifyPasses": 0, "mlxActiveEndBytes": 4848326832, "imageEncodeSeconds": 0, "firstTextSeconds": 1.039076958, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 38701939, "promptTokens": 17, "interTokenSeconds": [0.193197, 0.139204083, 0.119606583, 0.132201709, 0.1530435, 0.150026875, 0.120063875, 0.132605875, 0.16254675, 0.155279292, 0.155708458, 0.176468125, 0.143483792, 0.167983708, 0.152210541], "mlxPeakMemoryGB": 5.09042779, "reusedHeadTokens": 0, "acceptedDrafts": 0, "prefillComputePasses": [17], "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 3.293256458, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "prefillMLXActiveBytes": 4847175858, "peakMemoryGB": 5.443440024, "decodeScatterSeconds": 0.011752473, "ngramRowMisses": 0, "prefillIOSeconds": 0.6709226660000002, "decodeSeconds": 2.254039834, "decodeRecords": 4722, "reusedPrefixTokens": 0, "lifetimeRSSPeakBytes": 3477929984, "sampleSeconds": 0.0031877070000000006, "reconciliationSeconds": 0, "generatorVMAfter": {"swapins": 41697907, "reclaimableBytes": 27432501248, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 1.038826291, "firstTokenSeconds": 1.039054333, "physicalFootprintEndBytes": 5443440024}, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351], "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false, "incrementalIndexer": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": false, "boundedIndexer": false, "workspaceTokenTile": 256, "boundedOutputQueue": false, "demandedPrefillOutput": false, "boundedPLE": false, "compactStateWindows": true, "disjointSweepOutput": false, "readScopeTokens": 0, "reuseFirstMTPEntry": false, "boundedDraftTail": false, "compactNgramRows": false, "boundedSweepRows": false}}}
{"round": 5, "arm": "router", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_ROUTER_TOPK": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 31863013376, "swapins": 41697907, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   685767.\nPages active:                                 868382.\nPages inactive:                               851559.\nPages speculative:                             63233.\nPages throttled:                                   0.\nPages wired down:                             226500.\nPages purgeable:                                 722.\n\"Translation faults\":                    13728208707.\nPages copy-on-write:                       624694193.\nPages zero filled:                       14754348411.\nPages reactivated:                        2142954804.\nPages purged:                               61150308.\nFile-backed pages:                           1258275.\nAnonymous pages:                              524899.\nPages stored in compressor:                  1350978.\nPages occupied by compressor:                 385889.\nDecompressions:                            955815014.\nCompressions:                             1249339647.\nPageins:                                  5704840008.\nPageouts:                                   10616553.\nSwapins:                                    41697907.\nSwapouts:                                   69922789.\nPages tagged:                                 175387.\nPages tagged resident:                        131078.\nPages tagged compressed:                       44309.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         3965.\nPages tag-storage non-tag pageable:            87430.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7057216.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559817.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "63050", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 26754875392, "swapins": 41697907, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   365606.\nPages active:                                 904494.\nPages inactive:                               849726.\nPages speculative:                             63276.\nPages throttled:                                   0.\nPages wired down:                             513481.\nPages purgeable:                                9020.\n\"Translation faults\":                    13728427331.\nPages copy-on-write:                       624694737.\nPages zero filled:                       14754688938.\nPages reactivated:                        2142954916.\nPages purged:                               61150308.\nFile-backed pages:                           1258362.\nAnonymous pages:                              559134.\nPages stored in compressor:                  1350941.\nPages occupied by compressor:                 385883.\nDecompressions:                            955815050.\nCompressions:                             1249339647.\nPageins:                                  5704840053.\nPageouts:                                   10616553.\nSwapins:                                    41697907.\nSwapouts:                                   69922789.\nPages tagged:                                 175458.\nPages tagged resident:                        131149.\nPages tagged compressed:                       44309.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         3065.\nPages tag-storage non-tag pageable:            88307.\nPages tag-storage non-tag wired:                  31.\nBytes of compressed tags:                    7057216.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559817.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 26508214272, "swapins": 41697907, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   358715.\nPages active:                                 897205.\nPages inactive:                               847890.\nPages speculative:                             63300.\nPages throttled:                                   0.\nPages wired down:                             529473.\nPages purgeable:                                 791.\n\"Translation faults\":                    13728450662.\nPages copy-on-write:                       624696467.\nPages zero filled:                       14754698102.\nPages reactivated:                        2142954920.\nPages purged:                               61150308.\nFile-backed pages:                           1258427.\nAnonymous pages:                              549968.\nPages stored in compressor:                  1350805.\nPages occupied by compressor:                 385826.\nDecompressions:                            955815184.\nCompressions:                             1249339647.\nPageins:                                  5704840091.\nPageouts:                                   10616553.\nSwapins:                                    41697907.\nSwapouts:                                   69922789.\nPages tagged:                                 175405.\nPages tagged resident:                        131101.\nPages tagged compressed:                       44304.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         2833.\nPages tag-storage non-tag pageable:            88539.\nPages tag-storage non-tag wired:                  31.\nBytes of compressed tags:                    7055936.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559822.\n"}, "client_seconds": 3.4320572910000067, "headers_seconds": 0.0006801659999950971, "first_protocol_delta_seconds": 1.063785750000008, "first_visible_text_seconds": 1.2674612499999967, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "effective_prefill_chunk": 256, "effective_mtp": false, "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "incrementalIndexer": false, "valueOnlySamplerThreshold": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": true, "workspaceTokenTile": 256, "boundedIndexer": false, "boundedOutputQueue": false, "boundedPLE": false, "demandedPrefillOutput": false, "compactStateWindows": true, "disjointSweepOutput": false, "reuseFirstMTPEntry": false, "boundedDraftTail": false, "readScopeTokens": 0, "compactNgramRows": false, "boundedSweepRows": false}, "stats": {"decodeIOSeconds": 1.171596829, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillPhysicalFootprintBytes": 5443407232, "prefillTokens": 17, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 3.75e-07, "finishReason": "length", "mlxCacheEndBytes": 37650647, "sampledFootprint": {"samples": 173, "intervalMilliseconds": 20, "peakBytes": 5443997056}, "tokenCallbackSeconds": 0.003515253, "prefillRecords": 3359, "prefillScatterSeconds": 0.002816336, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "mlxActiveEndBytes": 4848326832, "firstTextSeconds": 1.0628715, "verifyPasses": 0, "reconciledHeadTokens": 0, "decodeForwardPasses": 15, "imageEncodeSeconds": 0, "generatorVMBefore": {"swapins": 41697907, "reclaimableBytes": 27790934016, "swapouts": 69922789}, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 38331987, "promptTokens": 17, "reusedHeadTokens": 0, "interTokenSeconds": [0.203750834, 0.146591041, 0.125891667, 0.1366725, 0.158303, 0.157642084, 0.129973916, 0.139592542, 0.166264334, 0.161131417, 0.163457083, 0.191674333, 0.15232175, 0.175141292, 0.159199125], "mlxPeakMemoryGB": 5.090379318, "acceptedDrafts": 0, "prefillComputePasses": [17], "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 3.431061083, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "prefillMLXActiveBytes": 4847547188, "decodeScatterSeconds": 0.011592793000000006, "peakMemoryGB": 5.44327616, "ngramRowMisses": 0, "prefillIOSeconds": 0.6770270799999999, "decodeSeconds": 2.36867825, "decodeRecords": 4722, "reusedPrefixTokens": 0, "sampleSeconds": 0.004345292999999999, "lifetimeRSSPeakBytes": 3477733376, "reconciliationSeconds": 0, "generatorVMAfter": {"swapins": 41697907, "reclaimableBytes": 27545976832, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 1.061970292, "firstTokenSeconds": 1.062844125, "physicalFootprintEndBytes": 5443276160}, "effective_pool_slots": 640, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351]}}
{"round": 5, "arm": "queue", "valid": true, "extra_preflight_allowance_gb": 0.0, "env": {"SLOTSTREAM_OPT_COMPACT_STATE": "1", "SLOTSTREAM_OPT_FINAL_FORWARD": "1", "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1", "SLOTSTREAM_BENCH_DETAILS": "1", "SLOTSTREAM_PREFILL_CHUNK": "256"}, "before_startup": {"page_bytes": 16384, "reclaimable_bytes": 31969411072, "swapins": 41697907, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   692139.\nPages active:                                 872047.\nPages inactive:                               840149.\nPages speculative:                             63303.\nPages throttled:                                   0.\nPages wired down:                             228108.\nPages purgeable:                                 724.\n\"Translation faults\":                    13728451269.\nPages copy-on-write:                       624696617.\nPages zero filled:                       14754698161.\nPages reactivated:                        2142954920.\nPages purged:                               61150308.\nFile-backed pages:                           1258395.\nAnonymous pages:                              517104.\nPages stored in compressor:                  1350805.\nPages occupied by compressor:                 385826.\nDecompressions:                            955815184.\nCompressions:                             1249339647.\nPageins:                                  5704840092.\nPageouts:                                   10616553.\nSwapins:                                    41697907.\nSwapouts:                                   69922789.\nPages tagged:                                 175337.\nPages tagged resident:                        131033.\nPages tagged compressed:                       44304.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         3705.\nPages tag-storage non-tag pageable:            87690.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7055936.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559822.\n"}, "command": ["/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-traces-v11/slotstream", "serve", "--port", "63059", "--model", "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit", "--memory-gb", "8.1", "--mtp", "off", "--no-elastic", "--no-prefix-cache"], "before": {"page_bytes": 16384, "reclaimable_bytes": 26508132352, "swapins": 41697907, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   358526.\nPages active:                                 895670.\nPages inactive:                               849379.\nPages speculative:                             63421.\nPages throttled:                                   0.\nPages wired down:                             529703.\nPages purgeable:                                 838.\n\"Translation faults\":                    13728670595.\nPages copy-on-write:                       624697152.\nPages zero filled:                       14755041944.\nPages reactivated:                        2142954920.\nPages purged:                               61150308.\nFile-backed pages:                           1258564.\nAnonymous pages:                              549906.\nPages stored in compressor:                  1350557.\nPages occupied by compressor:                 385745.\nDecompressions:                            955815432.\nCompressions:                             1249339647.\nPageins:                                  5704840137.\nPageouts:                                   10616553.\nSwapins:                                    41697907.\nSwapouts:                                   69922789.\nPages tagged:                                 175425.\nPages tagged resident:                        131223.\nPages tagged compressed:                       44202.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         2991.\nPages tag-storage non-tag pageable:            88384.\nPages tag-storage non-tag wired:                  28.\nBytes of compressed tags:                    7041856.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559924.\n"}, "after": {"page_bytes": 16384, "reclaimable_bytes": 26159775744, "swapins": 41697907, "swapouts": 69922789, "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   327177.\nPages active:                                 920079.\nPages inactive:                               855209.\nPages speculative:                             63702.\nPages throttled:                                   0.\nPages wired down:                             531625.\nPages purgeable:                               10412.\n\"Translation faults\":                    13728721724.\nPages copy-on-write:                       624699442.\nPages zero filled:                       14755083330.\nPages reactivated:                        2142954931.\nPages purged:                               61150308.\nFile-backed pages:                           1259077.\nAnonymous pages:                              579913.\nPages stored in compressor:                  1347995.\nPages occupied by compressor:                 385091.\nDecompressions:                            955817147.\nCompressions:                             1249339647.\nPageins:                                  5704840299.\nPageouts:                                   10616553.\nSwapins:                                    41697907.\nSwapouts:                                   69922789.\nPages tagged:                                 175514.\nPages tagged resident:                        131313.\nPages tagged compressed:                       44201.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6901.\nPages tag-storage free:                         2887.\nPages tag-storage non-tag pageable:            88488.\nPages tag-storage non-tag wired:                  28.\nBytes of compressed tags:                    7041792.\nTagged compressions:                         9304087.\nTagged decompressions:                       8559925.\n"}, "client_seconds": 3.5458309170000035, "headers_seconds": 0.0005737500000009277, "first_protocol_delta_seconds": 1.062714000000014, "first_visible_text_seconds": 1.2633251669999908, "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates", "metrics": {"schema_version": 1, "effective_mtp": false, "stats": {"decodeIOSeconds": 1.1757926469999989, "draftSeconds": 0, "prefillRowSortSeconds": 0, "prefillTokens": 17, "prefillPhysicalFootprintBytes": 5443669376, "abortedReadScopes": 0, "ngramCachePayloadBytes": 327680, "expertHitRate": 0.3441666666666667, "queueSeconds": 1.67e-07, "finishReason": "length", "mlxCacheEndBytes": 37649269, "sampledFootprint": {"samples": 179, "intervalMilliseconds": 20, "peakBytes": 5446749616}, "tokenCallbackSeconds": 0.003431457, "prefillRecords": 3359, "prefillScatterSeconds": 0.002758079000000001, "allocatedSequenceBytes": 28311552, "draftedTokens": 0, "decodeForwardPasses": 15, "firstTextSeconds": 1.061911, "generatorVMBefore": {"swapins": 41697907, "reclaimableBytes": 27548598272, "swapouts": 69922789}, "reconciledHeadTokens": 0, "mlxActiveEndBytes": 4848326832, "imageEncodeSeconds": 0, "verifyPasses": 0, "decodeReadBytes": 13055385600, "prefillReadBytes": 9286963200, "ngramCachedRows": 512, "prefillMLXCacheBytes": 39062389, "promptTokens": 17, "interTokenSeconds": [0.200631709, 0.145901833, 0.128610667, 0.1396435, 0.157485875, 0.165332583, 0.127260209, 0.137513125, 0.1687365, 0.167116042, 0.163694291, 0.237820917, 0.197369417, 0.187211125, 0.158152459], "mlxPeakMemoryGB": 5.09042779, "prefillComputePasses": [17], "acceptedDrafts": 0, "reusedHeadTokens": 0, "decodeModelTokens": 15, "verifySeconds": 0, "requestSeconds": 3.544955, "prefillPasses": [17], "prefillGPUWaitSeconds": 0, "ngramRowHits": 240, "decodeScatterSeconds": 0.014018449999999984, "peakMemoryGB": 5.446749616, "prefillMLXActiveBytes": 4846815408, "ngramRowMisses": 0, "prefillIOSeconds": 0.6782294159999999, "decodeSeconds": 2.482935833, "decodeRecords": 4722, "reusedPrefixTokens": 0, "lifetimeRSSPeakBytes": 3481337856, "sampleSeconds": 0.0038521250000000005, "reconciliationSeconds": 0, "generatorVMAfter": {"swapins": 41697907, "reclaimableBytes": 27202109440, "swapouts": 69922789}, "decodeTokens": 16, "prefillSeconds": 1.061631292, "firstTokenSeconds": 1.061892625, "physicalFootprintEndBytes": 5446749616}, "effective_pool_slots": 640, "optimizations": {"compactScopeFrontier": false, "tailAwarePrefill": false, "valueOnlySamplerThreshold": false, "incrementalIndexer": false, "compactMTPRow": false, "skipUnusedFinalForward": true, "sharedRoPE": false, "fusedGDNRecording": false, "layerExpertWorkspace": false, "routerTopK": false, "boundedIndexer": false, "workspaceTokenTile": 256, "boundedOutputQueue": true, "boundedPLE": false, "demandedPrefillOutput": false, "compactStateWindows": true, "disjointSweepOutput": false, "readScopeTokens": 0, "reuseFirstMTPEntry": false, "boundedDraftTail": false, "compactNgramRows": false, "boundedSweepRows": false}, "output_before_completion_frame": {"failed": false, "queuedFrames": 16, "firstWriteSeconds": 1.062120166, "writtenFrames": 16, "writtenBytes": 1765, "queuedBytes": 1765, "peakOwnedBytes": 116, "socketWaitSeconds": 0}, "prompt_ids": [12188, 411, 11316, 440, 264, 61446, 15673, 25, 357, 18826, 45351, 2450, 1970, 1083, 5484, 10895, 1521], "effective_prefill_chunk": 256, "output_ids": [271, 248068, 198, 760, 1156, 6587, 728, 310, 4434, 264, 11316, 883, 3069, 264, 18826, 45351]}}

```

## .build/optimization/serving-selector-queue-v11/summary.json

SHA-256: `f3a61c2dd0a5470a3e4efdacd744d30d5eea8df36c84c24f4ce0e3afc59fef03`

```text
[
  {
    "reference": "reference",
    "candidate": "queue",
    "pairs": [
      {
        "round": 1,
        "client_reduction_fraction": -0.023574439374051126,
        "generator_reduction_fraction": -0.023569759874269458,
        "output_ids_equal": true,
        "wire_text_equal": true
      },
      {
        "round": 2,
        "client_reduction_fraction": 0.313520916819512,
        "generator_reduction_fraction": 0.31355580879326117,
        "output_ids_equal": true,
        "wire_text_equal": true
      },
      {
        "round": 4,
        "client_reduction_fraction": -0.23644926428733726,
        "generator_reduction_fraction": -0.2365179342445627,
        "output_ids_equal": true,
        "wire_text_equal": true
      },
      {
        "round": 5,
        "client_reduction_fraction": -0.07643232552003498,
        "generator_reduction_fraction": -0.07642846684125426,
        "output_ids_equal": true,
        "wire_text_equal": true
      }
    ],
    "excluded_rounds": [
      3
    ],
    "median_client_reduction_fraction": -0.050003382447043054,
    "median_generator_reduction_fraction": -0.04999911335776186
  },
  {
    "reference": "reference",
    "candidate": "router",
    "pairs": [
      {
        "round": 1,
        "client_reduction_fraction": -0.006766589768437692,
        "generator_reduction_fraction": -0.006759164905439485,
        "output_ids_equal": true,
        "wire_text_equal": true
      },
      {
        "round": 3,
        "client_reduction_fraction": -0.16200781192656066,
        "generator_reduction_fraction": -0.16203873053013051,
        "output_ids_equal": true,
        "wire_text_equal": true
      },
      {
        "round": 4,
        "client_reduction_fraction": -0.146795776051049,
        "generator_reduction_fraction": -0.1468267745246512,
        "output_ids_equal": true,
        "wire_text_equal": true
      },
      {
        "round": 5,
        "client_reduction_fraction": -0.0418932818699671,
        "generator_reduction_fraction": -0.04184448637920202,
        "output_ids_equal": true,
        "wire_text_equal": true
      }
    ],
    "excluded_rounds": [
      2
    ],
    "median_client_reduction_fraction": -0.09434452896050805,
    "median_generator_reduction_fraction": -0.09433563045192661
  }
]

```

## .build/optimization/serving-selector-queue-v11/1-queue/warmup.json

SHA-256: `6cf7032a70dc59d9f087fb7c67509ea32ebda0f435501685d116cb476e96483b`

```text
{
  "client_seconds": 3.520556415999998,
  "headers_seconds": 0.0015801250000002653,
  "first_protocol_delta_seconds": 1.1108200410000002,
  "first_visible_text_seconds": 1.317863415999998,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
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
    "effective_pool_slots": 640,
    "effective_mtp": false,
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
    "optimizations": {
      "compactScopeFrontier": false,
      "tailAwarePrefill": false,
      "incrementalIndexer": false,
      "valueOnlySamplerThreshold": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": false,
      "boundedIndexer": false,
      "workspaceTokenTile": 256,
      "boundedOutputQueue": true,
      "boundedPLE": false,
      "demandedPrefillOutput": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "readScopeTokens": 0,
      "boundedDraftTail": false,
      "reuseFirstMTPEntry": false,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
    "output_before_completion_frame": {
      "failed": false,
      "queuedFrames": 16,
      "firstWriteSeconds": 1.109200959,
      "writtenFrames": 16,
      "writtenBytes": 1765,
      "queuedBytes": 1765,
      "peakOwnedBytes": 116,
      "socketWaitSeconds": 0
    },
    "stats": {
      "decodeIOSeconds": 1.1816552159999996,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillTokens": 17,
      "prefillPhysicalFootprintBytes": 5433740624,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 4.58e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37550965,
      "sampledFootprint": {
        "samples": 177,
        "intervalMilliseconds": 20,
        "peakBytes": 5442211176
      },
      "tokenCallbackSeconds": 0.004056541,
      "prefillRecords": 3383,
      "prefillScatterSeconds": 0.0029363309999999995,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "mlxActiveEndBytes": 4848326832,
      "firstTextSeconds": 1.108178375,
      "verifyPasses": 0,
      "generatorVMBefore": {
        "swapouts": 69922789,
        "swapins": 41697895,
        "reclaimableBytes": 32802275328
      },
      "decodeForwardPasses": 15,
      "imageEncodeSeconds": 8.4e-08,
      "reconciledHeadTokens": 0,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 32147997,
      "promptTokens": 17,
      "interTokenSeconds": [
        0.207909209,
        0.143635792,
        0.157249833,
        0.133420334,
        0.174577792,
        0.155145167,
        0.130726167,
        0.147559542,
        0.170287625,
        0.164830083,
        0.160628708,
        0.179562375,
        0.154305,
        0.174141,
        0.155855917
      ],
      "mlxPeakMemoryGB": 5.090460558,
      "reusedHeadTokens": 0,
      "acceptedDrafts": 0,
      "prefillComputePasses": [
        17
      ],
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 3.518507333,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "decodeScatterSeconds": 0.011853201999999997,
      "peakMemoryGB": 5.442211176,
      "prefillMLXActiveBytes": 4847579960,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.6774192069999997,
      "decodeSeconds": 2.410519583,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "sampleSeconds": 0.004485707,
      "lifetimeRSSPeakBytes": 3476570112,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapouts": 69922789,
        "swapins": 41697895,
        "reclaimableBytes": 27524055040
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.107467875,
      "firstTokenSeconds": 1.108087584,
      "physicalFootprintEndBytes": 5442211176
    }
  }
}

```

## .build/optimization/serving-selector-queue-v11/1-reference/warmup.json

SHA-256: `5a236e6fa501f682e926bf650d67393734abaa1d2fc8ecbbebdbd5c38cffbd42`

```text
{
  "client_seconds": 3.6422497920000003,
  "headers_seconds": 0.001145625000000039,
  "first_protocol_delta_seconds": 1.1625287089999998,
  "first_visible_text_seconds": 1.4360203750000002,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
    "effective_mtp": false,
    "effective_pool_slots": 640,
    "stats": {
      "decodeIOSeconds": 1.1779817029999993,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillPhysicalFootprintBytes": 5433691448,
      "prefillTokens": 17,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 4.17e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37550965,
      "sampledFootprint": {
        "samples": 183,
        "intervalMilliseconds": 20,
        "peakBytes": 5441965392
      },
      "tokenCallbackSeconds": 0.004520751,
      "prefillScatterSeconds": 0.0029922069999999993,
      "prefillRecords": 3383,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "mlxActiveEndBytes": 4848326832,
      "firstTextSeconds": 1.160229542,
      "verifyPasses": 0,
      "decodeForwardPasses": 15,
      "generatorVMBefore": {
        "reclaimableBytes": 27904983040,
        "swapins": 41697895,
        "swapouts": 69922789
      },
      "imageEncodeSeconds": 4.2e-08,
      "reconciledHeadTokens": 0,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 30738701,
      "promptTokens": 17,
      "reusedHeadTokens": 0,
      "prefillComputePasses": [
        17
      ],
      "interTokenSeconds": [
        0.274431834,
        0.159739209,
        0.1595045,
        0.135458,
        0.173035667,
        0.150833541,
        0.126649416,
        0.145096333,
        0.167975084,
        0.16535725,
        0.160109,
        0.178778084,
        0.150247458,
        0.17525925,
        0.157406583
      ],
      "acceptedDrafts": 0,
      "mlxPeakMemoryGB": 5.090460558,
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 3.640622,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "decodeScatterSeconds": 0.012151005000000012,
      "peakMemoryGB": 5.441965392,
      "prefillMLXActiveBytes": 4848989256,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.6835305830000001,
      "decodeSeconds": 2.480581125,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "lifetimeRSSPeakBytes": 3476389888,
      "sampleSeconds": 0.077310708,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "reclaimableBytes": 27186970624,
        "swapins": 41697895,
        "swapouts": 69922789
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.159540584,
      "firstTokenSeconds": 1.160139959,
      "physicalFootprintEndBytes": 5441965392
    },
    "optimizations": {
      "compactScopeFrontier": false,
      "tailAwarePrefill": false,
      "incrementalIndexer": false,
      "valueOnlySamplerThreshold": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": false,
      "boundedIndexer": false,
      "workspaceTokenTile": 256,
      "boundedOutputQueue": false,
      "boundedPLE": false,
      "demandedPrefillOutput": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "readScopeTokens": 0,
      "boundedDraftTail": false,
      "reuseFirstMTPEntry": false,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
    "effective_prefill_chunk": 256,
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
    ]
  }
}

```

## .build/optimization/serving-selector-queue-v11/1-router/warmup.json

SHA-256: `68f46e382436bf5f69f0c12a44a4f9dd446fbff10a65d07ff702dd4efa9e8769`

```text
{
  "client_seconds": 3.5844122090000017,
  "headers_seconds": 0.0010118750000014387,
  "first_protocol_delta_seconds": 1.1720642090000002,
  "first_visible_text_seconds": 1.3808862920000013,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
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
      "tailAwarePrefill": false,
      "valueOnlySamplerThreshold": false,
      "incrementalIndexer": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": true,
      "boundedIndexer": false,
      "workspaceTokenTile": 256,
      "boundedOutputQueue": false,
      "demandedPrefillOutput": false,
      "boundedPLE": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "readScopeTokens": 0,
      "boundedDraftTail": false,
      "reuseFirstMTPEntry": false,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
    "stats": {
      "decodeIOSeconds": 1.1766593290000018,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillPhysicalFootprintBytes": 5433773392,
      "prefillTokens": 17,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 5.42e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37552343,
      "sampledFootprint": {
        "samples": 180,
        "intervalMilliseconds": 20,
        "peakBytes": 5442014568
      },
      "tokenCallbackSeconds": 0.004372541999999999,
      "prefillScatterSeconds": 0.0029904149999999993,
      "prefillRecords": 3383,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "decodeForwardPasses": 15,
      "reconciledHeadTokens": 0,
      "verifyPasses": 0,
      "generatorVMBefore": {
        "swapins": 41697895,
        "swapouts": 69922789,
        "reclaimableBytes": 27877588992
      },
      "mlxActiveEndBytes": 4848326832,
      "imageEncodeSeconds": 8.3e-08,
      "firstTextSeconds": 1.170032208,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 30608999,
      "promptTokens": 17,
      "interTokenSeconds": [
        0.209633875,
        0.167670125,
        0.158655958,
        0.131047958,
        0.171771458,
        0.149825083,
        0.123615833,
        0.14623225,
        0.169360666,
        0.161477167,
        0.160529292,
        0.180475167,
        0.151180292,
        0.174042583,
        0.156881291
      ],
      "prefillComputePasses": [
        17
      ],
      "reusedHeadTokens": 0,
      "acceptedDrafts": 0,
      "mlxPeakMemoryGB": 5.090412086,
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 3.582943208,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "decodeScatterSeconds": 0.011464475999999989,
      "peakMemoryGB": 5.442014568,
      "prefillMLXActiveBytes": 4848989264,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.7102546720000001,
      "decodeSeconds": 2.413457667,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "sampleSeconds": 0.005170747999999999,
      "lifetimeRSSPeakBytes": 3476373504,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41697895,
        "swapouts": 69922789,
        "reclaimableBytes": 27521826816
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.168991417,
      "firstTokenSeconds": 1.169952625,
      "physicalFootprintEndBytes": 5442014568
    },
    "effective_prefill_chunk": 256,
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
    "effective_pool_slots": 640,
    "effective_mtp": false
  }
}

```

## .build/optimization/serving-selector-queue-v11/2-queue/warmup.json

SHA-256: `438268ea2e9c0f085ab58a7908daa20d9ebf44a552e692e3d0e192f00fbbb54b`

```text
{
  "client_seconds": 3.524444374999998,
  "headers_seconds": 0.0010047079999999653,
  "first_protocol_delta_seconds": 1.1169421249999978,
  "first_visible_text_seconds": 1.3262883749999972,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
    "effective_pool_slots": 640,
    "output_before_completion_frame": {
      "failed": false,
      "queuedFrames": 16,
      "writtenBytes": 1765,
      "writtenFrames": 16,
      "firstWriteSeconds": 1.115899125,
      "queuedBytes": 1765,
      "peakOwnedBytes": 116,
      "socketWaitSeconds": 0
    },
    "effective_prefill_chunk": 256,
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
    "optimizations": {
      "compactScopeFrontier": false,
      "tailAwarePrefill": false,
      "valueOnlySamplerThreshold": false,
      "incrementalIndexer": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": false,
      "boundedIndexer": false,
      "workspaceTokenTile": 256,
      "boundedOutputQueue": true,
      "demandedPrefillOutput": false,
      "boundedPLE": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "reuseFirstMTPEntry": false,
      "readScopeTokens": 0,
      "boundedDraftTail": false,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
    "stats": {
      "decodeIOSeconds": 1.1788960190000002,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillTokens": 17,
      "prefillPhysicalFootprintBytes": 5433822520,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 4.17e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37550965,
      "sampledFootprint": {
        "samples": 177,
        "intervalMilliseconds": 20,
        "peakBytes": 5444685160
      },
      "tokenCallbackSeconds": 0.004071333000000001,
      "prefillRecords": 3383,
      "prefillScatterSeconds": 0.002897676000000001,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "decodeForwardPasses": 15,
      "firstTextSeconds": 1.114941417,
      "generatorVMBefore": {
        "swapins": 41697895,
        "reclaimableBytes": 27908210688,
        "swapouts": 69922789
      },
      "verifyPasses": 0,
      "reconciledHeadTokens": 0,
      "mlxActiveEndBytes": 4848326832,
      "imageEncodeSeconds": 8.3e-08,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 31443485,
      "promptTokens": 17,
      "reusedHeadTokens": 0,
      "mlxPeakMemoryGB": 5.090460558,
      "prefillComputePasses": [
        17
      ],
      "acceptedDrafts": 0,
      "interTokenSeconds": [
        0.210141791,
        0.144384167,
        0.159020917,
        0.131185625,
        0.174675291,
        0.1499285,
        0.125720667,
        0.145708208,
        0.170843417,
        0.164193291,
        0.161381834,
        0.180277542,
        0.153376042,
        0.178870834,
        0.157794958
      ],
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 3.522944042,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "prefillMLXActiveBytes": 4848284472,
      "peakMemoryGB": 5.44468516,
      "decodeScatterSeconds": 0.012065110999999991,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.679825749,
      "decodeSeconds": 2.409370333,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "lifetimeRSSPeakBytes": 3479093248,
      "sampleSeconds": 0.005882709999999999,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41697895,
        "reclaimableBytes": 27004059648,
        "swapouts": 69922789
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.113062583,
      "firstTokenSeconds": 1.114853625,
      "physicalFootprintEndBytes": 5444685160
    },
    "effective_mtp": false
  }
}

```

## .build/optimization/serving-selector-queue-v11/2-reference/warmup.json

SHA-256: `a553109665631aa533e449e5d7845c0c7527775eb3d77162ac963ce53b9b18a3`

```text
{
  "client_seconds": 4.918629375000002,
  "headers_seconds": 0.0014012500000006867,
  "first_protocol_delta_seconds": 1.3241266250000052,
  "first_visible_text_seconds": 1.610695291000006,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
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
    "optimizations": {
      "compactScopeFrontier": false,
      "tailAwarePrefill": false,
      "valueOnlySamplerThreshold": false,
      "incrementalIndexer": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": false,
      "boundedIndexer": false,
      "workspaceTokenTile": 256,
      "boundedOutputQueue": false,
      "boundedPLE": false,
      "demandedPrefillOutput": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "readScopeTokens": 0,
      "boundedDraftTail": false,
      "reuseFirstMTPEntry": false,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
    "effective_prefill_chunk": 256,
    "stats": {
      "decodeIOSeconds": 1.2609163250000002,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillTokens": 17,
      "prefillPhysicalFootprintBytes": 5485055384,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 9.16e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37550965,
      "sampledFootprint": {
        "samples": 247,
        "intervalMilliseconds": 20,
        "peakBytes": 5493296560
      },
      "tokenCallbackSeconds": 0.005775873000000001,
      "prefillRecords": 3383,
      "prefillScatterSeconds": 0.0054511640000000005,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "mlxActiveEndBytes": 4848326832,
      "firstTextSeconds": 1.321049666,
      "verifyPasses": 0,
      "generatorVMBefore": {
        "swapins": 41697899,
        "swapouts": 69922789,
        "reclaimableBytes": 27355496448
      },
      "decodeForwardPasses": 15,
      "imageEncodeSeconds": 0,
      "reconciledHeadTokens": 0,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 32148001,
      "promptTokens": 17,
      "interTokenSeconds": [
        0.288057291,
        0.228866792,
        0.247608334,
        0.172668958,
        0.262589125,
        0.226238208,
        0.1939685,
        0.216987083,
        0.244165958,
        0.247074416,
        0.242733042,
        0.271230333,
        0.227047583,
        0.269309834,
        0.255952875
      ],
      "reusedHeadTokens": 0,
      "prefillComputePasses": [
        17
      ],
      "mlxPeakMemoryGB": 5.090460558,
      "acceptedDrafts": 0,
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 4.916400541,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "decodeScatterSeconds": 0.019221906999999976,
      "peakMemoryGB": 5.49329656,
      "prefillMLXActiveBytes": 4847579956,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.7508804170000001,
      "decodeSeconds": 3.5955165,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "sampleSeconds": 0.007259624999999999,
      "lifetimeRSSPeakBytes": 3527262208,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41697899,
        "swapouts": 69922789,
        "reclaimableBytes": 23988928512
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.319989792,
      "firstTokenSeconds": 1.320938459,
      "physicalFootprintEndBytes": 5493296560
    },
    "effective_mtp": false,
    "effective_pool_slots": 640
  }
}

```

## .build/optimization/serving-selector-queue-v11/2-router/warmup.json

SHA-256: `669f69e59d9a94b00b47810117484a8386d7ef60a064c9423b0b26cb012829c7`

```text
{
  "client_seconds": 3.4431742090000057,
  "headers_seconds": 0.0010512919999996484,
  "first_protocol_delta_seconds": 1.109981917000006,
  "first_visible_text_seconds": 1.316864625000001,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
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
    "stats": {
      "decodeIOSeconds": 1.1447786709999987,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillTokens": 17,
      "prefillPhysicalFootprintBytes": 5433625912,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 4.58e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37552343,
      "sampledFootprint": {
        "samples": 173,
        "intervalMilliseconds": 20,
        "peakBytes": 5442194768
      },
      "tokenCallbackSeconds": 0.004266249,
      "prefillRecords": 3383,
      "prefillScatterSeconds": 0.002832617000000001,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "mlxActiveEndBytes": 4848326832,
      "firstTextSeconds": 1.107975125,
      "reconciledHeadTokens": 0,
      "decodeForwardPasses": 15,
      "generatorVMBefore": {
        "reclaimableBytes": 32832831488,
        "swapins": 41697895,
        "swapouts": 69922789
      },
      "imageEncodeSeconds": 4.1e-08,
      "verifyPasses": 0,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 30609003,
      "promptTokens": 17,
      "reusedHeadTokens": 0,
      "interTokenSeconds": [
        0.207692125,
        0.144402417,
        0.159142584,
        0.13161525,
        0.172618666,
        0.1500655,
        0.120167292,
        0.138421208,
        0.164805417,
        0.157625417,
        0.154222791,
        0.174017458,
        0.143388375,
        0.168324208,
        0.146741167
      ],
      "prefillComputePasses": [
        17
      ],
      "acceptedDrafts": 0,
      "mlxPeakMemoryGB": 5.090412086,
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 3.441701917,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "decodeScatterSeconds": 0.011466979999999998,
      "peakMemoryGB": 5.442194768,
      "prefillMLXActiveBytes": 4848989260,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.678471164,
      "decodeSeconds": 2.333867959,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "sampleSeconds": 0.0042767099999999995,
      "lifetimeRSSPeakBytes": 3476504576,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "reclaimableBytes": 27201617920,
        "swapins": 41697895,
        "swapouts": 69922789
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.107329625,
      "firstTokenSeconds": 1.107885459,
      "physicalFootprintEndBytes": 5442194768
    },
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
    "effective_pool_slots": 640,
    "optimizations": {
      "compactScopeFrontier": false,
      "tailAwarePrefill": false,
      "valueOnlySamplerThreshold": false,
      "incrementalIndexer": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": true,
      "workspaceTokenTile": 256,
      "boundedIndexer": false,
      "boundedOutputQueue": false,
      "boundedPLE": false,
      "demandedPrefillOutput": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "readScopeTokens": 0,
      "reuseFirstMTPEntry": false,
      "boundedDraftTail": false,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
    "effective_mtp": false
  }
}

```

## .build/optimization/serving-selector-queue-v11/3-queue/warmup.json

SHA-256: `c266d6d6243e7f09625dd66113e4820b1866a99f9c68a822ca27e1ecb8237da6`

```text
{
  "client_seconds": 4.529009666000007,
  "headers_seconds": 0.0011022910000093589,
  "first_protocol_delta_seconds": 1.2214698749999968,
  "first_visible_text_seconds": 1.4480430410000054,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
    "output_before_completion_frame": {
      "failed": false,
      "queuedFrames": 16,
      "writtenBytes": 1765,
      "writtenFrames": 16,
      "firstWriteSeconds": 1.220339,
      "queuedBytes": 1765,
      "peakOwnedBytes": 116,
      "socketWaitSeconds": 0
    },
    "stats": {
      "decodeIOSeconds": 1.2184707459999995,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillPhysicalFootprintBytes": 5443669352,
      "prefillTokens": 17,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 4.17e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37550965,
      "sampledFootprint": {
        "samples": 228,
        "intervalMilliseconds": 20,
        "peakBytes": 5452189056
      },
      "tokenCallbackSeconds": 0.004575168,
      "prefillRecords": 3383,
      "prefillScatterSeconds": 0.0033225379999999994,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "decodeForwardPasses": 15,
      "mlxActiveEndBytes": 4848326832,
      "verifyPasses": 0,
      "generatorVMBefore": {
        "swapins": 41697899,
        "swapouts": 69922789,
        "reclaimableBytes": 25593544704
      },
      "reconciledHeadTokens": 0,
      "imageEncodeSeconds": 4.2e-08,
      "firstTextSeconds": 1.219300834,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 31443485,
      "promptTokens": 17,
      "interTokenSeconds": [
        0.227449667,
        0.214071,
        0.229320375,
        0.202789709,
        0.25052875,
        0.22032325,
        0.193537625,
        0.213748,
        0.240502708,
        0.233454083,
        0.23577625,
        0.25863425,
        0.221996084,
        0.191863667,
        0.173658875
      ],
      "prefillComputePasses": [
        17
      ],
      "mlxPeakMemoryGB": 5.090460558,
      "acceptedDrafts": 0,
      "reusedHeadTokens": 0,
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 4.527449709,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "decodeScatterSeconds": 0.013669762000000018,
      "peakMemoryGB": 5.452189056,
      "prefillMLXActiveBytes": 4848284472,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.704790162,
      "decodeSeconds": 3.308379625,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "lifetimeRSSPeakBytes": 3486531584,
      "sampleSeconds": 0.006560959,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41697899,
        "swapouts": 69922789,
        "reclaimableBytes": 25000067072
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.218565833,
      "firstTokenSeconds": 1.219210917,
      "physicalFootprintEndBytes": 5452189056
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
    "effective_mtp": false,
    "optimizations": {
      "compactScopeFrontier": false,
      "tailAwarePrefill": false,
      "incrementalIndexer": false,
      "valueOnlySamplerThreshold": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": false,
      "workspaceTokenTile": 256,
      "boundedIndexer": false,
      "boundedOutputQueue": true,
      "boundedPLE": false,
      "demandedPrefillOutput": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "readScopeTokens": 0,
      "reuseFirstMTPEntry": false,
      "boundedDraftTail": false,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
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
    "effective_pool_slots": 640,
    "effective_prefill_chunk": 256
  }
}

```

## .build/optimization/serving-selector-queue-v11/3-reference/warmup.json

SHA-256: `f562ecc80a3dfca4a086163d4d188f0fa3d0ddc9dbdb145682029f4ceb508b08`

```text
{
  "client_seconds": 5.013202665999998,
  "headers_seconds": 0.0013478750000004425,
  "first_protocol_delta_seconds": 1.3160272080000013,
  "first_visible_text_seconds": 1.6110304580000019,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
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
    "effective_pool_slots": 640,
    "optimizations": {
      "compactScopeFrontier": false,
      "tailAwarePrefill": false,
      "incrementalIndexer": false,
      "valueOnlySamplerThreshold": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": false,
      "workspaceTokenTile": 256,
      "boundedIndexer": false,
      "boundedOutputQueue": false,
      "boundedPLE": false,
      "demandedPrefillOutput": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "reuseFirstMTPEntry": false,
      "readScopeTokens": 0,
      "boundedDraftTail": false,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
    "stats": {
      "decodeIOSeconds": 1.2830704379999984,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillTokens": 17,
      "prefillPhysicalFootprintBytes": 5445242264,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 9.16e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37550965,
      "sampledFootprint": {
        "samples": 252,
        "intervalMilliseconds": 20,
        "peakBytes": 5456645552
      },
      "tokenCallbackSeconds": 0.005480664999999999,
      "prefillScatterSeconds": 0.004198831000000002,
      "prefillRecords": 3383,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "mlxActiveEndBytes": 4848326832,
      "firstTextSeconds": 1.313323583,
      "generatorVMBefore": {
        "swapins": 41697899,
        "swapouts": 69922789,
        "reclaimableBytes": 21983363072
      },
      "reconciledHeadTokens": 0,
      "decodeForwardPasses": 15,
      "imageEncodeSeconds": 8.3e-08,
      "verifyPasses": 0,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 32879781,
      "promptTokens": 17,
      "interTokenSeconds": [
        0.29615225,
        0.237477584,
        0.253158625,
        0.220881875,
        0.263038333,
        0.237595084,
        0.210192375,
        0.23322775,
        0.255867625,
        0.251395333,
        0.243370958,
        0.265165584,
        0.240192583,
        0.256042875,
        0.233714834
      ],
      "mlxPeakMemoryGB": 5.090460558,
      "prefillComputePasses": [
        17
      ],
      "acceptedDrafts": 0,
      "reusedHeadTokens": 0,
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 5.011394083,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "decodeScatterSeconds": 0.020777908999999987,
      "peakMemoryGB": 5.456645552,
      "prefillMLXActiveBytes": 4846848176,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.7099087909999997,
      "decodeSeconds": 3.698266666,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "sampleSeconds": 0.007987249,
      "lifetimeRSSPeakBytes": 3490643968,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41697899,
        "swapouts": 69922789,
        "reclaimableBytes": 20522106880
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.312504625,
      "firstTokenSeconds": 1.313219292,
      "physicalFootprintEndBytes": 5456645552
    },
    "effective_mtp": false,
    "effective_prefill_chunk": 256,
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
    ]
  }
}

```

## .build/optimization/serving-selector-queue-v11/3-router/warmup.json

SHA-256: `63fdc7608ac626d4b715a27c387dac4a64e2385c8ca2109c7a9b6e613cc78dfb`

```text
{
  "client_seconds": 4.636521999999999,
  "headers_seconds": 0.0010788750000045866,
  "first_protocol_delta_seconds": 1.2369992500000038,
  "first_visible_text_seconds": 1.452540374999998,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
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
    "effective_mtp": false,
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
    "stats": {
      "decodeIOSeconds": 1.243543258,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillPhysicalFootprintBytes": 5443259728,
      "prefillTokens": 17,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 4.58e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37552343,
      "sampledFootprint": {
        "samples": 233,
        "intervalMilliseconds": 20,
        "peakBytes": 5460102552
      },
      "tokenCallbackSeconds": 0.005224585,
      "prefillRecords": 3383,
      "prefillScatterSeconds": 0.003362456,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "mlxActiveEndBytes": 4848326832,
      "firstTextSeconds": 1.234951083,
      "verifyPasses": 0,
      "generatorVMBefore": {
        "swapins": 41697899,
        "reclaimableBytes": 25759203328,
        "swapouts": 69922789
      },
      "decodeForwardPasses": 15,
      "imageEncodeSeconds": 8.4e-08,
      "reconciledHeadTokens": 0,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 32018307,
      "promptTokens": 17,
      "reusedHeadTokens": 0,
      "prefillComputePasses": [
        17
      ],
      "mlxPeakMemoryGB": 5.090412086,
      "acceptedDrafts": 0,
      "interTokenSeconds": [
        0.216308834,
        0.171938125,
        0.203176417,
        0.169421375,
        0.209205875,
        0.211352709,
        0.201175833,
        0.227495083,
        0.260517375,
        0.255003417,
        0.25204825,
        0.270056959,
        0.234232,
        0.268178458,
        0.24906725
      ],
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 4.634817375,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "decodeScatterSeconds": 0.017105472999999996,
      "prefillMLXActiveBytes": 4847579956,
      "peakMemoryGB": 5.460102552,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.7075181629999997,
      "decodeSeconds": 3.399921709,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "lifetimeRSSPeakBytes": 3494363136,
      "sampleSeconds": 0.007426541000000001,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41697899,
        "reclaimableBytes": 24600870912,
        "swapouts": 69922789
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.23427725,
      "firstTokenSeconds": 1.234870792,
      "physicalFootprintEndBytes": 5460102552
    },
    "optimizations": {
      "compactScopeFrontier": false,
      "tailAwarePrefill": false,
      "incrementalIndexer": false,
      "valueOnlySamplerThreshold": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": true,
      "workspaceTokenTile": 256,
      "boundedIndexer": false,
      "boundedOutputQueue": false,
      "boundedPLE": false,
      "demandedPrefillOutput": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "reuseFirstMTPEntry": false,
      "boundedDraftTail": false,
      "readScopeTokens": 0,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
    "effective_pool_slots": 640
  }
}

```

## .build/optimization/serving-selector-queue-v11/4-queue/warmup.json

SHA-256: `66373fd6cb522e8adef8db02caa1057884092686372760f58e51ce0b3545cece`

```text
{
  "client_seconds": 3.726838583000003,
  "headers_seconds": 0.001093874999995137,
  "first_protocol_delta_seconds": 1.2207240409999969,
  "first_visible_text_seconds": 1.4349784999999997,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
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
    "optimizations": {
      "compactScopeFrontier": false,
      "tailAwarePrefill": false,
      "incrementalIndexer": false,
      "valueOnlySamplerThreshold": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": false,
      "boundedIndexer": false,
      "workspaceTokenTile": 256,
      "boundedOutputQueue": true,
      "boundedPLE": false,
      "demandedPrefillOutput": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "reuseFirstMTPEntry": false,
      "readScopeTokens": 0,
      "boundedDraftTail": false,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
    "effective_pool_slots": 640,
    "effective_prefill_chunk": 256,
    "output_before_completion_frame": {
      "failed": false,
      "queuedFrames": 16,
      "firstWriteSeconds": 1.2196115,
      "writtenFrames": 16,
      "writtenBytes": 1765,
      "queuedBytes": 1765,
      "peakOwnedBytes": 116,
      "socketWaitSeconds": 0
    },
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
    "effective_mtp": false,
    "stats": {
      "decodeIOSeconds": 1.2019209109999998,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillTokens": 17,
      "prefillPhysicalFootprintBytes": 5441162624,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 3.75e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37550965,
      "sampledFootprint": {
        "samples": 187,
        "intervalMilliseconds": 20,
        "peakBytes": 5449452928
      },
      "tokenCallbackSeconds": 0.004415916,
      "prefillScatterSeconds": 0.0031905320000000003,
      "prefillRecords": 3383,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "decodeForwardPasses": 15,
      "reconciledHeadTokens": 0,
      "generatorVMBefore": {
        "swapins": 41697903,
        "reclaimableBytes": 25524240384,
        "swapouts": 69922789
      },
      "verifyPasses": 0,
      "mlxActiveEndBytes": 4848326832,
      "imageEncodeSeconds": 8.3e-08,
      "firstTextSeconds": 1.218537291,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 29673733,
      "promptTokens": 17,
      "reusedHeadTokens": 0,
      "prefillComputePasses": [
        17
      ],
      "interTokenSeconds": [
        0.215161041,
        0.152878041,
        0.175622958,
        0.136749458,
        0.18207425,
        0.161116125,
        0.127415292,
        0.179476625,
        0.171427417,
        0.175920458,
        0.163713959,
        0.181739083,
        0.151702,
        0.17569425,
        0.1555655
      ],
      "mlxPeakMemoryGB": 5.090460558,
      "acceptedDrafts": 0,
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 3.725287958,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "prefillMLXActiveBytes": 4850054224,
      "peakMemoryGB": 5.449452928,
      "decodeScatterSeconds": 0.01266825399999998,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.6998725030000001,
      "decodeSeconds": 2.507055708,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "lifetimeRSSPeakBytes": 3483860992,
      "sampleSeconds": 0.004908666,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41697903,
        "reclaimableBytes": 25120915456,
        "swapouts": 69922789
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.217709042,
      "firstTokenSeconds": 1.218440375,
      "physicalFootprintEndBytes": 5449452928
    }
  }
}

```

## .build/optimization/serving-selector-queue-v11/4-reference/warmup.json

SHA-256: `d8c153ecc9f75c406ca9c67a09ac6db48e378d871db7473d516c25376d76657d`

```text
{
  "client_seconds": 3.480022875000003,
  "headers_seconds": 0.0022015420000087715,
  "first_protocol_delta_seconds": 1.135585833999997,
  "first_visible_text_seconds": 1.347727458999998,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
    "effective_mtp": false,
    "effective_pool_slots": 640,
    "effective_prefill_chunk": 256,
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
    "optimizations": {
      "compactScopeFrontier": false,
      "tailAwarePrefill": false,
      "valueOnlySamplerThreshold": false,
      "incrementalIndexer": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": false,
      "workspaceTokenTile": 256,
      "boundedIndexer": false,
      "boundedOutputQueue": false,
      "boundedPLE": false,
      "demandedPrefillOutput": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "reuseFirstMTPEntry": false,
      "boundedDraftTail": false,
      "readScopeTokens": 0,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
    "stats": {
      "decodeIOSeconds": 1.141384305999999,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillPhysicalFootprintBytes": 5433625912,
      "prefillTokens": 17,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 1.042e-06,
      "finishReason": "length",
      "mlxCacheEndBytes": 37550965,
      "sampledFootprint": {
        "samples": 175,
        "intervalMilliseconds": 20,
        "peakBytes": 5442178384
      },
      "tokenCallbackSeconds": 0.004317041,
      "prefillScatterSeconds": 0.002947748,
      "prefillRecords": 3383,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "decodeForwardPasses": 15,
      "firstTextSeconds": 1.132434167,
      "mlxActiveEndBytes": 4848326832,
      "generatorVMBefore": {
        "swapins": 41697903,
        "swapouts": 69922789,
        "reclaimableBytes": 26130219008
      },
      "verifyPasses": 0,
      "imageEncodeSeconds": 8.3e-08,
      "reconciledHeadTokens": 0,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 31443485,
      "promptTokens": 17,
      "reusedHeadTokens": 0,
      "interTokenSeconds": [
        0.21299525,
        0.147239834,
        0.160873083,
        0.128364583,
        0.168059125,
        0.147167084,
        0.119984833,
        0.1439025,
        0.162825208,
        0.158772208,
        0.155218833,
        0.175594458,
        0.144624584,
        0.170086208,
        0.148831958
      ],
      "mlxPeakMemoryGB": 5.090460558,
      "acceptedDrafts": 0,
      "prefillComputePasses": [
        17
      ],
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 3.477463292,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "decodeScatterSeconds": 0.012179275999999998,
      "peakMemoryGB": 5.442178384,
      "prefillMLXActiveBytes": 4848284472,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.6932017090000004,
      "decodeSeconds": 2.345218292,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "lifetimeRSSPeakBytes": 3476520960,
      "sampleSeconds": 0.004479335,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41697903,
        "swapouts": 69922789,
        "reclaimableBytes": 25584156672
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.131633833,
      "firstTokenSeconds": 1.132349709,
      "physicalFootprintEndBytes": 5442178384
    },
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
    ]
  }
}

```

## .build/optimization/serving-selector-queue-v11/4-router/warmup.json

SHA-256: `b3041347344d90ebf35eeeba2b80adc4e95af5e245fa0f7189e34ec52daa3b82`

```text
{
  "client_seconds": 4.704180292000004,
  "headers_seconds": 0.0010689579999905163,
  "first_protocol_delta_seconds": 1.2113343329999964,
  "first_visible_text_seconds": 1.4625922919999965,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
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
    "stats": {
      "decodeIOSeconds": 1.249024648000001,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillPhysicalFootprintBytes": 5444193640,
      "prefillTokens": 17,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 4.59e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37552343,
      "sampledFootprint": {
        "samples": 236,
        "intervalMilliseconds": 20,
        "peakBytes": 5456170416
      },
      "tokenCallbackSeconds": 0.0049300440000000015,
      "prefillRecords": 3383,
      "prefillScatterSeconds": 0.003518661999999997,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "decodeForwardPasses": 15,
      "reconciledHeadTokens": 0,
      "generatorVMBefore": {
        "swapins": 41697903,
        "swapouts": 69922789,
        "reclaimableBytes": 25422888960
      },
      "mlxActiveEndBytes": 4848326832,
      "firstTextSeconds": 1.20918675,
      "imageEncodeSeconds": 4.1e-08,
      "verifyPasses": 0,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 31313519,
      "promptTokens": 17,
      "interTokenSeconds": [
        0.252126083,
        0.211753625,
        0.238418292,
        0.2053925,
        0.25222325,
        0.226964041,
        0.197160209,
        0.215644875,
        0.238578459,
        0.243994958,
        0.236473792,
        0.258142,
        0.227182666,
        0.25312175,
        0.235736583
      ],
      "prefillComputePasses": [
        17
      ],
      "mlxPeakMemoryGB": 5.090412086,
      "reusedHeadTokens": 0,
      "acceptedDrafts": 0,
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 4.702640125,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "decodeScatterSeconds": 0.016414913999999996,
      "peakMemoryGB": 5.456170416,
      "prefillMLXActiveBytes": 4848989256,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.701639911,
      "decodeSeconds": 3.494066708,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "lifetimeRSSPeakBytes": 3490414592,
      "sampleSeconds": 0.007483165,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41697903,
        "swapouts": 69922789,
        "reclaimableBytes": 24491622400
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.208034958,
      "firstTokenSeconds": 1.209086875,
      "physicalFootprintEndBytes": 5456170416
    },
    "optimizations": {
      "compactScopeFrontier": false,
      "tailAwarePrefill": false,
      "valueOnlySamplerThreshold": false,
      "incrementalIndexer": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": true,
      "boundedIndexer": false,
      "workspaceTokenTile": 256,
      "boundedOutputQueue": false,
      "demandedPrefillOutput": false,
      "boundedPLE": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "readScopeTokens": 0,
      "boundedDraftTail": false,
      "reuseFirstMTPEntry": false,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
    "effective_pool_slots": 640,
    "effective_prefill_chunk": 256,
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
    "effective_mtp": false
  }
}

```

## .build/optimization/serving-selector-queue-v11/5-queue/warmup.json

SHA-256: `88e5ecc3b9f072beeae33bceea41c50c537f9ee92c757edc2f6ec4fcc32e5169`

```text
{
  "client_seconds": 3.5911123749999945,
  "headers_seconds": 0.0013748749999962229,
  "first_protocol_delta_seconds": 1.1610337919999978,
  "first_visible_text_seconds": 1.366642541999994,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
    "effective_mtp": false,
    "stats": {
      "decodeIOSeconds": 1.1976250659999987,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillTokens": 17,
      "prefillPhysicalFootprintBytes": 5433773416,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 3.75e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37550965,
      "sampledFootprint": {
        "samples": 181,
        "intervalMilliseconds": 20,
        "peakBytes": 5442030976
      },
      "tokenCallbackSeconds": 0.004208958999999999,
      "prefillRecords": 3383,
      "prefillScatterSeconds": 0.003061082,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "decodeForwardPasses": 15,
      "firstTextSeconds": 1.158658584,
      "generatorVMBefore": {
        "swapins": 41697907,
        "reclaimableBytes": 28090925056,
        "swapouts": 69922789
      },
      "reconciledHeadTokens": 0,
      "mlxActiveEndBytes": 4848326832,
      "imageEncodeSeconds": 0,
      "verifyPasses": 0,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 32879781,
      "promptTokens": 17,
      "interTokenSeconds": [
        0.206449417,
        0.145606084,
        0.160719583,
        0.137774958,
        0.176195667,
        0.1578125,
        0.130013875,
        0.14610275,
        0.170767125,
        0.165165292,
        0.163051375,
        0.18356775,
        0.152702208,
        0.176723708,
        0.157478375
      ],
      "mlxPeakMemoryGB": 5.090460558,
      "prefillComputePasses": [
        17
      ],
      "acceptedDrafts": 0,
      "reusedHeadTokens": 0,
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 3.589279417,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "decodeScatterSeconds": 0.012235154999999992,
      "peakMemoryGB": 5.442030976,
      "prefillMLXActiveBytes": 4846848176,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.6912051289999995,
      "decodeSeconds": 2.430728209,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "lifetimeRSSPeakBytes": 3476422656,
      "sampleSeconds": 0.004530330999999999,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41697907,
        "reclaimableBytes": 27548123136,
        "swapouts": 69922789
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.158033709,
      "firstTokenSeconds": 1.158579916,
      "physicalFootprintEndBytes": 5442030976
    },
    "effective_pool_slots": 640,
    "optimizations": {
      "compactScopeFrontier": false,
      "tailAwarePrefill": false,
      "valueOnlySamplerThreshold": false,
      "incrementalIndexer": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": false,
      "boundedIndexer": false,
      "workspaceTokenTile": 256,
      "boundedOutputQueue": true,
      "boundedPLE": false,
      "demandedPrefillOutput": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "readScopeTokens": 0,
      "reuseFirstMTPEntry": false,
      "boundedDraftTail": false,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
    "output_before_completion_frame": {
      "failed": false,
      "queuedFrames": 16,
      "firstWriteSeconds": 1.159654208,
      "writtenFrames": 16,
      "writtenBytes": 1765,
      "queuedBytes": 1765,
      "peakOwnedBytes": 116,
      "socketWaitSeconds": 0
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
    ]
  }
}

```

## .build/optimization/serving-selector-queue-v11/5-reference/warmup.json

SHA-256: `8c6468f108bb63c79a05d6406b7d3397fb82c57c4b9953b922186d77e068495d`

```text
{
  "client_seconds": 3.543523042000004,
  "headers_seconds": 0.0010493750000080126,
  "first_protocol_delta_seconds": 1.1298126670000102,
  "first_visible_text_seconds": 1.3396145420000067,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
    "effective_prefill_chunk": 256,
    "effective_pool_slots": 640,
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
    "effective_mtp": false,
    "stats": {
      "decodeIOSeconds": 1.1931416230000005,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillPhysicalFootprintBytes": 5433822592,
      "prefillTokens": 17,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 4.58e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37550965,
      "sampledFootprint": {
        "samples": 178,
        "intervalMilliseconds": 20,
        "peakBytes": 5441899928
      },
      "tokenCallbackSeconds": 0.004424831000000001,
      "prefillRecords": 3383,
      "prefillScatterSeconds": 0.0029199609999999996,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "decodeForwardPasses": 15,
      "reconciledHeadTokens": 0,
      "generatorVMBefore": {
        "swapins": 41697907,
        "reclaimableBytes": 27953774592,
        "swapouts": 69922789
      },
      "verifyPasses": 0,
      "mlxActiveEndBytes": 4848326832,
      "imageEncodeSeconds": 4.1e-08,
      "firstTextSeconds": 1.127728958,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 32879781,
      "promptTokens": 17,
      "interTokenSeconds": [
        0.210680083,
        0.145026375,
        0.15990625,
        0.136519375,
        0.175878125,
        0.153126959,
        0.127093792,
        0.148624042,
        0.169324375,
        0.163292542,
        0.1608655,
        0.180324125,
        0.14979425,
        0.175783959,
        0.15756625
      ],
      "mlxPeakMemoryGB": 5.090460558,
      "reusedHeadTokens": 0,
      "acceptedDrafts": 0,
      "prefillComputePasses": [
        17
      ],
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 3.542024833,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "prefillMLXActiveBytes": 4846848176,
      "peakMemoryGB": 5.441899928,
      "decodeScatterSeconds": 0.011768831999999988,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.6866998800000003,
      "decodeSeconds": 2.414450625,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "lifetimeRSSPeakBytes": 3476291584,
      "sampleSeconds": 0.004597787999999999,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41697907,
        "reclaimableBytes": 27412824064,
        "swapouts": 69922789
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.127081125,
      "firstTokenSeconds": 1.127637917,
      "physicalFootprintEndBytes": 5441899928
    },
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
      "tailAwarePrefill": false,
      "valueOnlySamplerThreshold": false,
      "incrementalIndexer": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": false,
      "boundedIndexer": false,
      "workspaceTokenTile": 256,
      "boundedOutputQueue": false,
      "demandedPrefillOutput": false,
      "boundedPLE": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "readScopeTokens": 0,
      "reuseFirstMTPEntry": false,
      "boundedDraftTail": false,
      "compactNgramRows": false,
      "boundedSweepRows": false
    }
  }
}

```

## .build/optimization/serving-selector-queue-v11/5-router/warmup.json

SHA-256: `cbed5400ed86069005ed8d885fe1d7df7c1ba415297890d5ffcd28e3fbbe0935`

```text
{
  "client_seconds": 3.5394203749999917,
  "headers_seconds": 0.0009585829999991802,
  "first_protocol_delta_seconds": 1.1175195830000035,
  "first_visible_text_seconds": 1.3234389999999934,
  "text": "\n\n<think>\nThe user wants me to complete a sentence about why a compiler translates",
  "metrics": {
    "schema_version": 1,
    "effective_prefill_chunk": 256,
    "effective_mtp": false,
    "optimizations": {
      "compactScopeFrontier": false,
      "tailAwarePrefill": false,
      "incrementalIndexer": false,
      "valueOnlySamplerThreshold": false,
      "compactMTPRow": false,
      "skipUnusedFinalForward": true,
      "sharedRoPE": false,
      "fusedGDNRecording": false,
      "layerExpertWorkspace": false,
      "routerTopK": true,
      "workspaceTokenTile": 256,
      "boundedIndexer": false,
      "boundedOutputQueue": false,
      "boundedPLE": false,
      "demandedPrefillOutput": false,
      "compactStateWindows": true,
      "disjointSweepOutput": false,
      "reuseFirstMTPEntry": false,
      "boundedDraftTail": false,
      "readScopeTokens": 0,
      "compactNgramRows": false,
      "boundedSweepRows": false
    },
    "stats": {
      "decodeIOSeconds": 1.203838041,
      "draftSeconds": 0,
      "prefillRowSortSeconds": 0,
      "prefillTokens": 17,
      "prefillPhysicalFootprintBytes": 5433953640,
      "abortedReadScopes": 0,
      "ngramCachePayloadBytes": 327680,
      "expertHitRate": 0.3204166666666667,
      "queueSeconds": 5e-07,
      "finishReason": "length",
      "mlxCacheEndBytes": 37552343,
      "sampledFootprint": {
        "samples": 178,
        "intervalMilliseconds": 20,
        "peakBytes": 5442194816
      },
      "tokenCallbackSeconds": 0.004520875,
      "prefillRecords": 3383,
      "prefillScatterSeconds": 0.0028537900000000006,
      "allocatedSequenceBytes": 28311552,
      "draftedTokens": 0,
      "mlxActiveEndBytes": 4848326832,
      "decodeForwardPasses": 15,
      "generatorVMBefore": {
        "swapouts": 69922789,
        "swapins": 41697907,
        "reclaimableBytes": 27993882624
      },
      "verifyPasses": 0,
      "reconciledHeadTokens": 0,
      "imageEncodeSeconds": 8.3e-08,
      "firstTextSeconds": 1.115394042,
      "decodeReadBytes": 13528166400,
      "prefillReadBytes": 9353318400,
      "ngramCachedRows": 512,
      "prefillMLXCacheBytes": 30609003,
      "promptTokens": 17,
      "interTokenSeconds": [
        0.206926917,
        0.1445085,
        0.162273667,
        0.134963125,
        0.179667791,
        0.156232792,
        0.126982917,
        0.146127667,
        0.170918292,
        0.166021875,
        0.163105917,
        0.179769333,
        0.149525584,
        0.177910666,
        0.157175375
      ],
      "prefillComputePasses": [
        17
      ],
      "mlxPeakMemoryGB": 5.090412086,
      "acceptedDrafts": 0,
      "reusedHeadTokens": 0,
      "decodeModelTokens": 15,
      "verifySeconds": 0,
      "requestSeconds": 3.538025084,
      "prefillPasses": [
        17
      ],
      "prefillGPUWaitSeconds": 0,
      "ngramRowHits": 0,
      "decodeScatterSeconds": 0.011552352000000002,
      "peakMemoryGB": 5.442194816,
      "prefillMLXActiveBytes": 4848989260,
      "ngramRowMisses": 240,
      "prefillIOSeconds": 0.6845659169999995,
      "decodeSeconds": 2.42276175,
      "decodeRecords": 4893,
      "reusedPrefixTokens": 0,
      "sampleSeconds": 0.004668459000000001,
      "lifetimeRSSPeakBytes": 3476537344,
      "reconciliationSeconds": 0,
      "generatorVMAfter": {
        "swapins": 41697907,
        "swapouts": 69922789,
        "reclaimableBytes": 27790049280
      },
      "decodeTokens": 16,
      "prefillSeconds": 1.114758041,
      "firstTokenSeconds": 1.115304834,
      "physicalFootprintEndBytes": 5442194816
    },
    "effective_pool_slots": 640,
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
    ]
  }
}

```
