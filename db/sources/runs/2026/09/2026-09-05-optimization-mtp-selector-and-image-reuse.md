---
type: run
id: 01m1resvjt4ezbwzvyka60tkjk
created: 2026-09-05T09:36:10.842941+00:00
updated: 2026-09-05T09:43:31.990725+00:00
summary: Cached MTP selector and request-local image feature reuse
binary: Frozen V23 and V24 identities in body
captured_at: 2026-09-05
command: Exact manifests, stdout and host test sources in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Cached MTP selector and request-local image feature reuse
tool: Frozen native real-model/tower diagnostics and host-only harness tests
---
# Cached MTP selector and request-local image reuse

The V23 native diagnostic first seeds two independent prefix caches with the reference selector, then enables, disables and re-enables block selection on genuine cached MTP requests. The common 256-token compute schedule, bounded indexer/PLE and compact windows are held fixed. All 514 assertions pass: exact output IDs, finish reasons, ordered main and draft router traces, all retained tensors, consumed-token counts and aligned MTP state. Counters prove that both the main and draft selectors execute only on the enabled arms. The prompt starts at 2,112 tokens, above the 512-block selection threshold; continuation preserves the cache. This is correctness evidence, not request timing or older-device qualification.

V24 adds optional duplicate-image reuse inside a single VisionPrompt.runs call. Cache identity includes encoded-content hash, full preprocessing plan, source dimensions and hidden size; one immutable tower instance owns the call. It cannot carry features across model/processor instances or requests, and creates no persistent memory allowance. Images already represented by the reused prefix are skipped before lookup/encoding. A repeated uncovered image shares the full feature rows and clips them independently at each prompt offset. This is the first OPT28 substep; cross-request feature caching, source decoding deduplication, startup work and long-request/serving qualification remain open.

The real-tower V24 diagnostic passes all 64 assertions, with two distinct tiny PNG fixtures: exact every-row comparisons, changed content, partial-image prefix consumption, fully covered images, changed preprocessing geometry and cache lifetime. The images are bounded to 64/256 merged rows; this is neither known-content task-quality evidence nor a speed claim. The flag remains default off. Generation now completes the previously lazy final image merger at the image timing boundary; imageEncodeSeconds includes that projection instead of charging it to text prefill. Full image-serving integration and its overhead remain to be tested.

The harness has explicit fixed-pool versus fixed-total-memory comparison semantics, frozen acceptance assessment and fail-closed resource types. It preserves an interrupted cell and completion status while stopping the owned child. Ten host-only tests pass, including actual main-loop interruption with mocked process/network operations and exact-byte memory limits. Those tests load no model, produce no performance evidence and do not replace real TCP recovery tests. The acceptance battery is being changed to use structured sampled footprint plus RSS/current footprint and swap checks; the legacy max(RSS,current footprint) is not an upper bound on historical physical footprint.

## .build/optimization/candidate-mtp-indexer-v23/build-identity.json

SHA-256: `e9ac05b14aa1a56c1d6c14f446fce90770151ca74f9675b4fc64413c9ba67032`; 7894 bytes.

```
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "7088ff6c9e71f50520b008ef3090680d2eb1bdac6395625a31f6f736a77ac07c",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "db919590b13c88edf4b8d92fa221092cea3476855d41d2fcfbaf815447abcc03",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "03f029b78801b5215db21f5be2a8e515474726a594f36cda936d2018d853226f",
    "Sources/Slotstream/MTP.swift": "868f0d7d45171d29569f94390feaba02ae567504721e327667fe2bad4dcf73a2",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "5d2cb9e955a52b4b559744c111a6990f4edd4e8465fd27d2a8ec88cc61743cb4",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "b644e35ce391071cd824edd56062e545f5015d0d326d4b595c75df5ed3446847",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
    "Sources/Slotstream/ProcessMemory.swift": "44ca16d77b15463278ad5f044719673afe76ff043bfda4edb0c373e1545c3714",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "efe29406a51ab3c02aa6ecee6c566215f63ddc03e196ab0ac975b4d1c8209ae7",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "8db839c3c4458cf72ce96cf7c1ef783370f67f4a41bc0d51d3fed4cd8d9a6515",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "0de477a8d69784656da892eb6a290354c95875563c7fad9fea46bc2894c63277",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "c928569be702c8c1db2fcfb82925c69a3d99a8f13ab8e73aec94712b9b8820a7",
  "binary_sha256": "7112e1eb858a1bd7ade5fc9c658507d612ad084fcac4dac6a19fff7278bdfa4e",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/candidate-image-reuse-v24/build-identity.json

SHA-256: `fdfdab8d806fb341ba74f79ba384dcd2ffc2c7747fdb081434a03d9f66822a70`; 8028 bytes.

```
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
    "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
    "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "7088ff6c9e71f50520b008ef3090680d2eb1bdac6395625a31f6f736a77ac07c",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "928410f62043837e8eb317943d9a1e71fe7103442715b54a371db2df710eba43",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "03f029b78801b5215db21f5be2a8e515474726a594f36cda936d2018d853226f",
    "Sources/Slotstream/MTP.swift": "868f0d7d45171d29569f94390feaba02ae567504721e327667fe2bad4dcf73a2",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "5d2cb9e955a52b4b559744c111a6990f4edd4e8465fd27d2a8ec88cc61743cb4",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "38b1bf81398dd850e91f3df3483ba25fda7af4c23868b96d82e0e2c9bb86a129",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
    "Sources/Slotstream/ProcessMemory.swift": "44ca16d77b15463278ad5f044719673afe76ff043bfda4edb0c373e1545c3714",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "a67ad545b322660705a9c67808efffc6b55f25ed70909c913281d577aadefd50",
    "Sources/Slotstream/VisionPrompt.swift": "9ac17789a3c630c6adf9a8088bd260b430e75dbcd867dd0e1ab532c5119bfa81",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "33750ac12019268ce4fb53ec5107d00163a0687fc61ceed5a9f39a514179ab40",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "efe29406a51ab3c02aa6ecee6c566215f63ddc03e196ab0ac975b4d1c8209ae7",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "8db839c3c4458cf72ce96cf7c1ef783370f67f4a41bc0d51d3fed4cd8d9a6515",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "c02aab8a587ee834d936b58bfbf420ca5f22c3b28023c8d5e52c66221a4988f6",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
    "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "c9f08f8c96119c456eb819423764776020d7cf63a73ceae37393c300a4ff99a1",
  "binary_sha256": "5459d5c207c80299ddb09965b9446344927b932cbb422a010ee1b0894d7b53d6",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/serving-harness-eight-tests-v23.txt

SHA-256: `f8f7b0ac7f2b53ac4e96000f166430c488f2c37e059ad5502b09d60f29d363b8`; 106 bytes.

```
........
----------------------------------------------------------------------
Ran 8 tests in 0.000s

OK

```

## .build/optimization/serving-harness-ten-tests-v25.txt

SHA-256: `8c4b1532288f3c2237a75b4778a19116380135ed2658033225c3d1a1a8446867`; 109 bytes.

```
..........
----------------------------------------------------------------------
Ran 10 tests in 0.005s

OK

```

## .build/optimization/mtp-indexer-cached-prefix-v23/manifest.json

SHA-256: `6b4a272343049ffba8731a26f08100e602fcd9136957a8a5188cceab5c8e2473`; 12670 bytes.

```
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-mtp-indexer-v23/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "7088ff6c9e71f50520b008ef3090680d2eb1bdac6395625a31f6f736a77ac07c",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "db919590b13c88edf4b8d92fa221092cea3476855d41d2fcfbaf815447abcc03",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "03f029b78801b5215db21f5be2a8e515474726a594f36cda936d2018d853226f",
      "Sources/Slotstream/MTP.swift": "868f0d7d45171d29569f94390feaba02ae567504721e327667fe2bad4dcf73a2",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "5d2cb9e955a52b4b559744c111a6990f4edd4e8465fd27d2a8ec88cc61743cb4",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "b644e35ce391071cd824edd56062e545f5015d0d326d4b595c75df5ed3446847",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
      "Sources/Slotstream/ProcessMemory.swift": "44ca16d77b15463278ad5f044719673afe76ff043bfda4edb0c373e1545c3714",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "efe29406a51ab3c02aa6ecee6c566215f63ddc03e196ab0ac975b4d1c8209ae7",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "8db839c3c4458cf72ce96cf7c1ef783370f67f4a41bc0d51d3fed4cd8d9a6515",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "0de477a8d69784656da892eb6a290354c95875563c7fad9fea46bc2894c63277",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "c928569be702c8c1db2fcfb82925c69a3d99a8f13ab8e73aec94712b9b8820a7",
    "binary_sha256": "7112e1eb858a1bd7ade5fc9c658507d612ad084fcac4dac6a19fff7278bdfa4e",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 18.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-mtp-indexer-v23/slotstream",
    "optimization-state-check",
    "--variant",
    "mtp-indexer",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33290862592,
    "swapins": 41703890,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   326871.\nPages active:                                1037697.\nPages inactive:                               713790.\nPages speculative:                            350412.\nPages throttled:                                   0.\nPages wired down:                             216700.\nPages purgeable:                                6069.\n\"Translation faults\":                    13768405744.\nPages copy-on-write:                       626390818.\nPages zero filled:                       15296331128.\nPages reactivated:                        2264236358.\nPages purged:                               61600103.\nFile-backed pages:                           1698973.\nAnonymous pages:                              402926.\nPages stored in compressor:                  1457961.\nPages occupied by compressor:                 437271.\nDecompressions:                            962155601.\nCompressions:                             1256121421.\nPageins:                                  5819898725.\nPageouts:                                   10625308.\nSwapins:                                    41703890.\nSwapouts:                                   69922789.\nPages tagged:                                 168750.\nPages tagged resident:                        120311.\nPages tagged compressed:                       48439.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         3123.\nPages tag-storage non-tag pageable:            88287.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8026688.\nTagged compressions:                         9399984.\nTagged decompressions:                       8646020.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 514,
  "duration_seconds": 48.500234375,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33227636736,
    "swapins": 41703890,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   486554.\nPages active:                                 973854.\nPages inactive:                               696095.\nPages speculative:                            275905.\nPages throttled:                                   0.\nPages wired down:                             216644.\nPages purgeable:                                  40.\n\"Translation faults\":                    13768897859.\nPages copy-on-write:                       626401105.\nPages zero filled:                       15306914360.\nPages reactivated:                        2265029991.\nPages purged:                               61621139.\nFile-backed pages:                           1541460.\nAnonymous pages:                              404394.\nPages stored in compressor:                  1459471.\nPages occupied by compressor:                 433257.\nDecompressions:                            962181440.\nCompressions:                             1256148906.\nPageins:                                  5820722670.\nPageouts:                                   10625472.\nSwapins:                                    41703890.\nSwapouts:                                   69922789.\nPages tagged:                                 168615.\nPages tagged resident:                        119569.\nPages tagged compressed:                       49046.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         3558.\nPages tag-storage non-tag pageable:            87852.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8149184.\nTagged compressions:                         9401374.\nTagged decompressions:                       8646802.\n"
  }
}

```

## .build/optimization/mtp-indexer-cached-prefix-v23/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/mtp-indexer-cached-prefix-v23/stdout.txt

SHA-256: `1a3aca01070aa519fd29bb47572fd5e8dc67fd6530da2192ae26ae76ed38aeaa`; 39054 bytes.

```
{
  "items" : [
    {
      "name" : "step 0: exact output IDs",
      "passed" : true
    },
    {
      "name" : "step 0: output count",
      "passed" : true
    },
    {
      "name" : "step 0: finish reason",
      "passed" : true
    },
    {
      "name" : "step 0: ordered main routes",
      "passed" : true
    },
    {
      "name" : "step 0: ordered draft routes",
      "passed" : true
    },
    {
      "name" : "step 0: verification executes",
      "passed" : true
    },
    {
      "name" : "step 0: main selector dispatch",
      "passed" : true
    },
    {
      "name" : "step 0: head selector dispatch",
      "passed" : true
    },
    {
      "name" : "step 0: both draft states aligned",
      "passed" : true
    },
    {
      "name" : "step 0: consumed tokens",
      "passed" : true
    },
    {
      "name" : "step 0: fields",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.0",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.1",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.10",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.12",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.13",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.14",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.16",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.17",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.18",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.2",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.20",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.21",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.22",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.24",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.25",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.26",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.28",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.29",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.30",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.32",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.33",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.34",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.36",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.37",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.38",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.4",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.40",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.41",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.42",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.44",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.45",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.46",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.5",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.6",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.8",
      "passed" : true
    },
    {
      "name" : "step 0: exact conv.9",
      "passed" : true
    },
    {
      "name" : "step 0: exact index.11",
      "passed" : true
    },
    {
      "name" : "step 0: exact index.15",
      "passed" : true
    },
    {
      "name" : "step 0: exact index.19",
      "passed" : true
    },
    {
      "name" : "step 0: exact index.23",
      "passed" : true
    },
    {
      "name" : "step 0: exact index.27",
      "passed" : true
    },
    {
      "name" : "step 0: exact index.3",
      "passed" : true
    },
    {
      "name" : "step 0: exact index.31",
      "passed" : true
    },
    {
      "name" : "step 0: exact index.35",
      "passed" : true
    },
    {
      "name" : "step 0: exact index.39",
      "passed" : true
    },
    {
      "name" : "step 0: exact index.43",
      "passed" : true
    },
    {
      "name" : "step 0: exact index.47",
      "passed" : true
    },
    {
      "name" : "step 0: exact index.7",
      "passed" : true
    },
    {
      "name" : "step 0: exact key.11",
      "passed" : true
    },
    {
      "name" : "step 0: exact key.15",
      "passed" : true
    },
    {
      "name" : "step 0: exact key.19",
      "passed" : true
    },
    {
      "name" : "step 0: exact key.23",
      "passed" : true
    },
    {
      "name" : "step 0: exact key.27",
      "passed" : true
    },
    {
      "name" : "step 0: exact key.3",
      "passed" : true
    },
    {
      "name" : "step 0: exact key.31",
      "passed" : true
    },
    {
      "name" : "step 0: exact key.35",
      "passed" : true
    },
    {
      "name" : "step 0: exact key.39",
      "passed" : true
    },
    {
      "name" : "step 0: exact key.43",
      "passed" : true
    },
    {
      "name" : "step 0: exact key.47",
      "passed" : true
    },
    {
      "name" : "step 0: exact key.7",
      "passed" : true
    },
    {
      "name" : "step 0: exact lastMulti",
      "passed" : true
    },
    {
      "name" : "step 0: exact mtp.index",
      "passed" : true
    },
    {
      "name" : "step 0: exact mtp.key",
      "passed" : true
    },
    {
      "name" : "step 0: exact mtp.offset",
      "passed" : true
    },
    {
      "name" : "step 0: exact mtp.value",
      "passed" : true
    },
    {
      "name" : "step 0: exact ngram",
      "passed" : true
    },
    {
      "name" : "step 0: exact ple.1",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.0",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.1",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.10",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.12",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.13",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.14",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.16",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.17",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.18",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.2",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.20",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.21",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.22",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.24",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.25",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.26",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.28",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.29",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.30",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.32",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.33",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.34",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.36",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.37",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.38",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.4",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.40",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.41",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.42",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.44",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.45",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.46",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.5",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.6",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.8",
      "passed" : true
    },
    {
      "name" : "step 0: exact ssm.9",
      "passed" : true
    },
    {
      "name" : "step 0: exact tokens",
      "passed" : true
    },
    {
      "name" : "step 0: exact value.11",
      "passed" : true
    },
    {
      "name" : "step 0: exact value.15",
      "passed" : true
    },
    {
      "name" : "step 0: exact value.19",
      "passed" : true
    },
    {
      "name" : "step 0: exact value.23",
      "passed" : true
    },
    {
      "name" : "step 0: exact value.27",
      "passed" : true
    },
    {
      "name" : "step 0: exact value.3",
      "passed" : true
    },
    {
      "name" : "step 0: exact value.31",
      "passed" : true
    },
    {
      "name" : "step 0: exact value.35",
      "passed" : true
    },
    {
      "name" : "step 0: exact value.39",
      "passed" : true
    },
    {
      "name" : "step 0: exact value.43",
      "passed" : true
    },
    {
      "name" : "step 0: exact value.47",
      "passed" : true
    },
    {
      "name" : "step 0: exact value.7",
      "passed" : true
    },
    {
      "name" : "step 1: exact output IDs",
      "passed" : true
    },
    {
      "name" : "step 1: output count",
      "passed" : true
    },
    {
      "name" : "step 1: finish reason",
      "passed" : true
    },
    {
      "name" : "step 1: ordered main routes",
      "passed" : true
    },
    {
      "name" : "step 1: ordered draft routes",
      "passed" : true
    },
    {
      "name" : "step 1: verification executes",
      "passed" : true
    },
    {
      "name" : "step 1: both reuse cached prefixes",
      "passed" : true
    },
    {
      "name" : "step 1: same reused prefix",
      "passed" : true
    },
    {
      "name" : "step 1: main selector dispatch",
      "passed" : true
    },
    {
      "name" : "step 1: head selector dispatch",
      "passed" : true
    },
    {
      "name" : "step 1: both draft states aligned",
      "passed" : true
    },
    {
      "name" : "step 1: consumed tokens",
      "passed" : true
    },
    {
      "name" : "step 1: fields",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.0",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.1",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.10",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.12",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.13",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.14",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.16",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.17",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.18",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.2",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.20",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.21",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.22",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.24",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.25",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.26",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.28",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.29",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.30",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.32",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.33",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.34",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.36",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.37",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.38",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.4",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.40",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.41",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.42",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.44",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.45",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.46",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.5",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.6",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.8",
      "passed" : true
    },
    {
      "name" : "step 1: exact conv.9",
      "passed" : true
    },
    {
      "name" : "step 1: exact index.11",
      "passed" : true
    },
    {
      "name" : "step 1: exact index.15",
      "passed" : true
    },
    {
      "name" : "step 1: exact index.19",
      "passed" : true
    },
    {
      "name" : "step 1: exact index.23",
      "passed" : true
    },
    {
      "name" : "step 1: exact index.27",
      "passed" : true
    },
    {
      "name" : "step 1: exact index.3",
      "passed" : true
    },
    {
      "name" : "step 1: exact index.31",
      "passed" : true
    },
    {
      "name" : "step 1: exact index.35",
      "passed" : true
    },
    {
      "name" : "step 1: exact index.39",
      "passed" : true
    },
    {
      "name" : "step 1: exact index.43",
      "passed" : true
    },
    {
      "name" : "step 1: exact index.47",
      "passed" : true
    },
    {
      "name" : "step 1: exact index.7",
      "passed" : true
    },
    {
      "name" : "step 1: exact key.11",
      "passed" : true
    },
    {
      "name" : "step 1: exact key.15",
      "passed" : true
    },
    {
      "name" : "step 1: exact key.19",
      "passed" : true
    },
    {
      "name" : "step 1: exact key.23",
      "passed" : true
    },
    {
      "name" : "step 1: exact key.27",
      "passed" : true
    },
    {
      "name" : "step 1: exact key.3",
      "passed" : true
    },
    {
      "name" : "step 1: exact key.31",
      "passed" : true
    },
    {
      "name" : "step 1: exact key.35",
      "passed" : true
    },
    {
      "name" : "step 1: exact key.39",
      "passed" : true
    },
    {
      "name" : "step 1: exact key.43",
      "passed" : true
    },
    {
      "name" : "step 1: exact key.47",
      "passed" : true
    },
    {
      "name" : "step 1: exact key.7",
      "passed" : true
    },
    {
      "name" : "step 1: exact lastMulti",
      "passed" : true
    },
    {
      "name" : "step 1: exact mtp.index",
      "passed" : true
    },
    {
      "name" : "step 1: exact mtp.key",
      "passed" : true
    },
    {
      "name" : "step 1: exact mtp.offset",
      "passed" : true
    },
    {
      "name" : "step 1: exact mtp.value",
      "passed" : true
    },
    {
      "name" : "step 1: exact ngram",
      "passed" : true
    },
    {
      "name" : "step 1: exact ple.1",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.0",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.1",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.10",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.12",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.13",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.14",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.16",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.17",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.18",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.2",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.20",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.21",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.22",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.24",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.25",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.26",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.28",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.29",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.30",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.32",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.33",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.34",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.36",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.37",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.38",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.4",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.40",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.41",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.42",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.44",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.45",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.46",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.5",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.6",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.8",
      "passed" : true
    },
    {
      "name" : "step 1: exact ssm.9",
      "passed" : true
    },
    {
      "name" : "step 1: exact tokens",
      "passed" : true
    },
    {
      "name" : "step 1: exact value.11",
      "passed" : true
    },
    {
      "name" : "step 1: exact value.15",
      "passed" : true
    },
    {
      "name" : "step 1: exact value.19",
      "passed" : true
    },
    {
      "name" : "step 1: exact value.23",
      "passed" : true
    },
    {
      "name" : "step 1: exact value.27",
      "passed" : true
    },
    {
      "name" : "step 1: exact value.3",
      "passed" : true
    },
    {
      "name" : "step 1: exact value.31",
      "passed" : true
    },
    {
      "name" : "step 1: exact value.35",
      "passed" : true
    },
    {
      "name" : "step 1: exact value.39",
      "passed" : true
    },
    {
      "name" : "step 1: exact value.43",
      "passed" : true
    },
    {
      "name" : "step 1: exact value.47",
      "passed" : true
    },
    {
      "name" : "step 1: exact value.7",
      "passed" : true
    },
    {
      "name" : "step 2: exact output IDs",
      "passed" : true
    },
    {
      "name" : "step 2: output count",
      "passed" : true
    },
    {
      "name" : "step 2: finish reason",
      "passed" : true
    },
    {
      "name" : "step 2: ordered main routes",
      "passed" : true
    },
    {
      "name" : "step 2: ordered draft routes",
      "passed" : true
    },
    {
      "name" : "step 2: verification executes",
      "passed" : true
    },
    {
      "name" : "step 2: both reuse cached prefixes",
      "passed" : true
    },
    {
      "name" : "step 2: same reused prefix",
      "passed" : true
    },
    {
      "name" : "step 2: main selector dispatch",
      "passed" : true
    },
    {
      "name" : "step 2: head selector dispatch",
      "passed" : true
    },
    {
      "name" : "step 2: both draft states aligned",
      "passed" : true
    },
    {
      "name" : "step 2: consumed tokens",
      "passed" : true
    },
    {
      "name" : "step 2: fields",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.0",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.1",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.10",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.12",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.13",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.14",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.16",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.17",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.18",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.2",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.20",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.21",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.22",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.24",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.25",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.26",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.28",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.29",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.30",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.32",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.33",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.34",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.36",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.37",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.38",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.4",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.40",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.41",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.42",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.44",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.45",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.46",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.5",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.6",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.8",
      "passed" : true
    },
    {
      "name" : "step 2: exact conv.9",
      "passed" : true
    },
    {
      "name" : "step 2: exact index.11",
      "passed" : true
    },
    {
      "name" : "step 2: exact index.15",
      "passed" : true
    },
    {
      "name" : "step 2: exact index.19",
      "passed" : true
    },
    {
      "name" : "step 2: exact index.23",
      "passed" : true
    },
    {
      "name" : "step 2: exact index.27",
      "passed" : true
    },
    {
      "name" : "step 2: exact index.3",
      "passed" : true
    },
    {
      "name" : "step 2: exact index.31",
      "passed" : true
    },
    {
      "name" : "step 2: exact index.35",
      "passed" : true
    },
    {
      "name" : "step 2: exact index.39",
      "passed" : true
    },
    {
      "name" : "step 2: exact index.43",
      "passed" : true
    },
    {
      "name" : "step 2: exact index.47",
      "passed" : true
    },
    {
      "name" : "step 2: exact index.7",
      "passed" : true
    },
    {
      "name" : "step 2: exact key.11",
      "passed" : true
    },
    {
      "name" : "step 2: exact key.15",
      "passed" : true
    },
    {
      "name" : "step 2: exact key.19",
      "passed" : true
    },
    {
      "name" : "step 2: exact key.23",
      "passed" : true
    },
    {
      "name" : "step 2: exact key.27",
      "passed" : true
    },
    {
      "name" : "step 2: exact key.3",
      "passed" : true
    },
    {
      "name" : "step 2: exact key.31",
      "passed" : true
    },
    {
      "name" : "step 2: exact key.35",
      "passed" : true
    },
    {
      "name" : "step 2: exact key.39",
      "passed" : true
    },
    {
      "name" : "step 2: exact key.43",
      "passed" : true
    },
    {
      "name" : "step 2: exact key.47",
      "passed" : true
    },
    {
      "name" : "step 2: exact key.7",
      "passed" : true
    },
    {
      "name" : "step 2: exact lastMulti",
      "passed" : true
    },
    {
      "name" : "step 2: exact mtp.index",
      "passed" : true
    },
    {
      "name" : "step 2: exact mtp.key",
      "passed" : true
    },
    {
      "name" : "step 2: exact mtp.offset",
      "passed" : true
    },
    {
      "name" : "step 2: exact mtp.value",
      "passed" : true
    },
    {
      "name" : "step 2: exact ngram",
      "passed" : true
    },
    {
      "name" : "step 2: exact ple.1",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.0",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.1",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.10",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.12",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.13",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.14",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.16",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.17",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.18",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.2",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.20",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.21",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.22",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.24",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.25",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.26",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.28",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.29",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.30",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.32",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.33",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.34",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.36",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.37",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.38",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.4",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.40",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.41",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.42",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.44",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.45",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.46",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.5",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.6",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.8",
      "passed" : true
    },
    {
      "name" : "step 2: exact ssm.9",
      "passed" : true
    },
    {
      "name" : "step 2: exact tokens",
      "passed" : true
    },
    {
      "name" : "step 2: exact value.11",
      "passed" : true
    },
    {
      "name" : "step 2: exact value.15",
      "passed" : true
    },
    {
      "name" : "step 2: exact value.19",
      "passed" : true
    },
    {
      "name" : "step 2: exact value.23",
      "passed" : true
    },
    {
      "name" : "step 2: exact value.27",
      "passed" : true
    },
    {
      "name" : "step 2: exact value.3",
      "passed" : true
    },
    {
      "name" : "step 2: exact value.31",
      "passed" : true
    },
    {
      "name" : "step 2: exact value.35",
      "passed" : true
    },
    {
      "name" : "step 2: exact value.39",
      "passed" : true
    },
    {
      "name" : "step 2: exact value.43",
      "passed" : true
    },
    {
      "name" : "step 2: exact value.47",
      "passed" : true
    },
    {
      "name" : "step 2: exact value.7",
      "passed" : true
    },
    {
      "name" : "step 3: exact output IDs",
      "passed" : true
    },
    {
      "name" : "step 3: output count",
      "passed" : true
    },
    {
      "name" : "step 3: finish reason",
      "passed" : true
    },
    {
      "name" : "step 3: ordered main routes",
      "passed" : true
    },
    {
      "name" : "step 3: ordered draft routes",
      "passed" : true
    },
    {
      "name" : "step 3: verification executes",
      "passed" : true
    },
    {
      "name" : "step 3: both reuse cached prefixes",
      "passed" : true
    },
    {
      "name" : "step 3: same reused prefix",
      "passed" : true
    },
    {
      "name" : "step 3: main selector dispatch",
      "passed" : true
    },
    {
      "name" : "step 3: head selector dispatch",
      "passed" : true
    },
    {
      "name" : "step 3: both draft states aligned",
      "passed" : true
    },
    {
      "name" : "step 3: consumed tokens",
      "passed" : true
    },
    {
      "name" : "step 3: fields",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.0",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.1",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.10",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.12",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.13",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.14",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.16",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.17",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.18",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.2",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.20",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.21",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.22",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.24",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.25",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.26",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.28",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.29",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.30",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.32",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.33",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.34",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.36",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.37",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.38",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.4",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.40",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.41",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.42",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.44",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.45",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.46",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.5",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.6",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.8",
      "passed" : true
    },
    {
      "name" : "step 3: exact conv.9",
      "passed" : true
    },
    {
      "name" : "step 3: exact index.11",
      "passed" : true
    },
    {
      "name" : "step 3: exact index.15",
      "passed" : true
    },
    {
      "name" : "step 3: exact index.19",
      "passed" : true
    },
    {
      "name" : "step 3: exact index.23",
      "passed" : true
    },
    {
      "name" : "step 3: exact index.27",
      "passed" : true
    },
    {
      "name" : "step 3: exact index.3",
      "passed" : true
    },
    {
      "name" : "step 3: exact index.31",
      "passed" : true
    },
    {
      "name" : "step 3: exact index.35",
      "passed" : true
    },
    {
      "name" : "step 3: exact index.39",
      "passed" : true
    },
    {
      "name" : "step 3: exact index.43",
      "passed" : true
    },
    {
      "name" : "step 3: exact index.47",
      "passed" : true
    },
    {
      "name" : "step 3: exact index.7",
      "passed" : true
    },
    {
      "name" : "step 3: exact key.11",
      "passed" : true
    },
    {
      "name" : "step 3: exact key.15",
      "passed" : true
    },
    {
      "name" : "step 3: exact key.19",
      "passed" : true
    },
    {
      "name" : "step 3: exact key.23",
      "passed" : true
    },
    {
      "name" : "step 3: exact key.27",
      "passed" : true
    },
    {
      "name" : "step 3: exact key.3",
      "passed" : true
    },
    {
      "name" : "step 3: exact key.31",
      "passed" : true
    },
    {
      "name" : "step 3: exact key.35",
      "passed" : true
    },
    {
      "name" : "step 3: exact key.39",
      "passed" : true
    },
    {
      "name" : "step 3: exact key.43",
      "passed" : true
    },
    {
      "name" : "step 3: exact key.47",
      "passed" : true
    },
    {
      "name" : "step 3: exact key.7",
      "passed" : true
    },
    {
      "name" : "step 3: exact lastMulti",
      "passed" : true
    },
    {
      "name" : "step 3: exact mtp.index",
      "passed" : true
    },
    {
      "name" : "step 3: exact mtp.key",
      "passed" : true
    },
    {
      "name" : "step 3: exact mtp.offset",
      "passed" : true
    },
    {
      "name" : "step 3: exact mtp.value",
      "passed" : true
    },
    {
      "name" : "step 3: exact ngram",
      "passed" : true
    },
    {
      "name" : "step 3: exact ple.1",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.0",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.1",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.10",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.12",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.13",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.14",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.16",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.17",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.18",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.2",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.20",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.21",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.22",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.24",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.25",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.26",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.28",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.29",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.30",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.32",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.33",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.34",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.36",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.37",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.38",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.4",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.40",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.41",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.42",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.44",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.45",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.46",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.5",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.6",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.8",
      "passed" : true
    },
    {
      "name" : "step 3: exact ssm.9",
      "passed" : true
    },
    {
      "name" : "step 3: exact tokens",
      "passed" : true
    },
    {
      "name" : "step 3: exact value.11",
      "passed" : true
    },
    {
      "name" : "step 3: exact value.15",
      "passed" : true
    },
    {
      "name" : "step 3: exact value.19",
      "passed" : true
    },
    {
      "name" : "step 3: exact value.23",
      "passed" : true
    },
    {
      "name" : "step 3: exact value.27",
      "passed" : true
    },
    {
      "name" : "step 3: exact value.3",
      "passed" : true
    },
    {
      "name" : "step 3: exact value.31",
      "passed" : true
    },
    {
      "name" : "step 3: exact value.35",
      "passed" : true
    },
    {
      "name" : "step 3: exact value.39",
      "passed" : true
    },
    {
      "name" : "step 3: exact value.43",
      "passed" : true
    },
    {
      "name" : "step 3: exact value.47",
      "passed" : true
    },
    {
      "name" : "step 3: exact value.7",
      "passed" : true
    }
  ],
  "measurements" : {
    "step_0_head_specialized_rows" : 0,
    "step_0_main_specialized_rows" : 0,
    "step_1_head_specialized_rows" : 4,
    "step_1_main_specialized_rows" : 36,
    "step_2_head_specialized_rows" : 0,
    "step_2_main_specialized_rows" : 0,
    "step_3_head_specialized_rows" : 5,
    "step_3_main_specialized_rows" : 48
  },
  "name" : "optimization-mtp-indexer",
  "passed" : true
}

```

## .build/optimization/image-reuse-tower-v24/manifest.json

SHA-256: `2d17187db9ed030168ede9ca06df3b662e62f32bc10f0e90d96fd9f5bbd10643`; 12801 bytes.

```
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-image-reuse-v24/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "36224708b7a5a5f1b6fe5f2b4316be22298f48f6d4fe5c814699997677f12515",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "7088ff6c9e71f50520b008ef3090680d2eb1bdac6395625a31f6f736a77ac07c",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "928410f62043837e8eb317943d9a1e71fe7103442715b54a371db2df710eba43",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "03f029b78801b5215db21f5be2a8e515474726a594f36cda936d2018d853226f",
      "Sources/Slotstream/MTP.swift": "868f0d7d45171d29569f94390feaba02ae567504721e327667fe2bad4dcf73a2",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "5d2cb9e955a52b4b559744c111a6990f4edd4e8465fd27d2a8ec88cc61743cb4",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "38b1bf81398dd850e91f3df3483ba25fda7af4c23868b96d82e0e2c9bb86a129",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "bb4f3a3480d321eab5eb3ad593e06071a29ae2f3b7ff19e476567a247d9ccbf3",
      "Sources/Slotstream/ProcessMemory.swift": "44ca16d77b15463278ad5f044719673afe76ff043bfda4edb0c373e1545c3714",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "a67ad545b322660705a9c67808efffc6b55f25ed70909c913281d577aadefd50",
      "Sources/Slotstream/VisionPrompt.swift": "9ac17789a3c630c6adf9a8088bd260b430e75dbcd867dd0e1ab532c5119bfa81",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "33750ac12019268ce4fb53ec5107d00163a0687fc61ceed5a9f39a514179ab40",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "efe29406a51ab3c02aa6ecee6c566215f63ddc03e196ab0ac975b4d1c8209ae7",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "8db839c3c4458cf72ce96cf7c1ef783370f67f4a41bc0d51d3fed4cd8d9a6515",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "c02aab8a587ee834d936b58bfbf420ca5f22c3b28023c8d5e52c66221a4988f6",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "27301cdbb470718e5bf4a2a61481d891dccc4192aa267de04a262428134b2b18",
      "Sources/slotstream-cli/main.swift": "c3df94da7a0d4aea136e98abcc9e74fb65076b49f367693d4eb4180b027a43f3",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "c9f08f8c96119c456eb819423764776020d7cf63a73ceae37393c300a4ff99a1",
    "binary_sha256": "5459d5c207c80299ddb09965b9446344927b932cbb422a010ee1b0894d7b53d6",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 8.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-image-reuse-v24/slotstream",
    "optimization-state-check",
    "--variant",
    "image-reuse",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31905251328,
    "swapins": 41703921,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   301992.\nPages active:                                1076830.\nPages inactive:                               742676.\nPages speculative:                            349267.\nPages throttled:                                   0.\nPages wired down:                             217324.\nPages purgeable:                                2593.\n\"Translation faults\":                    13770761438.\nPages copy-on-write:                       626512506.\nPages zero filled:                       15308099607.\nPages reactivated:                        2265032165.\nPages purged:                               61624690.\nFile-backed pages:                           1642757.\nAnonymous pages:                              526016.\nPages stored in compressor:                  1363025.\nPages occupied by compressor:                 394164.\nDecompressions:                            962276802.\nCompressions:                             1256148906.\nPageins:                                  5820776559.\nPageouts:                                   10625472.\nSwapins:                                    41703921.\nSwapouts:                                   69922789.\nPages tagged:                                 180020.\nPages tagged resident:                        135339.\nPages tagged compressed:                       44681.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         3290.\nPages tag-storage non-tag pageable:            88120.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7279168.\nTagged compressions:                         9401374.\nTagged decompressions:                       8651128.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 64,
  "duration_seconds": 1.5946445,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31531810816,
    "swapins": 41703921,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   224518.\nPages active:                                1088797.\nPages inactive:                               795251.\nPages speculative:                            351308.\nPages throttled:                                   0.\nPages wired down:                             230000.\nPages purgeable:                                2189.\n\"Translation faults\":                    13770920316.\nPages copy-on-write:                       626520159.\nPages zero filled:                       15308232336.\nPages reactivated:                        2265032168.\nPages purged:                               61624690.\nFile-backed pages:                           1697842.\nAnonymous pages:                              537514.\nPages stored in compressor:                  1361053.\nPages occupied by compressor:                 392344.\nDecompressions:                            962278770.\nCompressions:                             1256148906.\nPageins:                                  5820829688.\nPageouts:                                   10625472.\nSwapins:                                    41703921.\nSwapouts:                                   69922789.\nPages tagged:                                 180027.\nPages tagged resident:                        135346.\nPages tagged compressed:                       44681.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         3311.\nPages tag-storage non-tag pageable:            88099.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7279168.\nTagged compressions:                         9401374.\nTagged decompressions:                       8651128.\n"
  }
}

```

## .build/optimization/image-reuse-tower-v24/stderr.txt

SHA-256: `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/image-reuse-tower-v24/stdout.txt

SHA-256: `abae7a2c0dd595f76a85f7cdbb4dce14caca12c03a01261c23ab0d6d6c8431a9`; 5324 bytes.

```
{
  "items" : [
    {
      "name" : "fixture encoded-byte identities differ",
      "passed" : true
    },
    {
      "name" : "consumed 0: real tower encodes",
      "passed" : true
    },
    {
      "name" : "consumed 0: duplicate reuse",
      "passed" : true
    },
    {
      "name" : "consumed 0: prefix skip",
      "passed" : true
    },
    {
      "name" : "consumed 0: run count",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 0: start",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 0: shape",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 0: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 0: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 1: start",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 1: shape",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 1: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 1: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 2: start",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 2: shape",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 2: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 2: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 33: real tower encodes",
      "passed" : true
    },
    {
      "name" : "consumed 33: duplicate reuse",
      "passed" : true
    },
    {
      "name" : "consumed 33: prefix skip",
      "passed" : true
    },
    {
      "name" : "consumed 33: run count",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 0: start",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 0: shape",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 0: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 0: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 1: start",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 1: shape",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 1: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 1: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 2: start",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 2: shape",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 2: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 2: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 65: real tower encodes",
      "passed" : true
    },
    {
      "name" : "consumed 65: duplicate reuse",
      "passed" : true
    },
    {
      "name" : "consumed 65: prefix skip",
      "passed" : true
    },
    {
      "name" : "consumed 65: run count",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 0: start",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 0: shape",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 0: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 0: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 1: start",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 1: shape",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 1: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 1: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 195: real tower encodes",
      "passed" : true
    },
    {
      "name" : "consumed 195: duplicate reuse",
      "passed" : true
    },
    {
      "name" : "consumed 195: prefix skip",
      "passed" : true
    },
    {
      "name" : "consumed 195: run count",
      "passed" : true
    },
    {
      "name" : "processor fixture changes geometry",
      "passed" : true
    },
    {
      "name" : "changed processor: both encoded",
      "passed" : true
    },
    {
      "name" : "changed processor: no stale reuse",
      "passed" : true
    },
    {
      "name" : "changed processor: run count",
      "passed" : true
    },
    {
      "name" : "changed processor run 0: start",
      "passed" : true
    },
    {
      "name" : "changed processor run 0: shape",
      "passed" : true
    },
    {
      "name" : "changed processor run 0: dtype",
      "passed" : true
    },
    {
      "name" : "changed processor run 0: exact features",
      "passed" : true
    },
    {
      "name" : "changed processor run 1: start",
      "passed" : true
    },
    {
      "name" : "changed processor run 1: shape",
      "passed" : true
    },
    {
      "name" : "changed processor run 1: dtype",
      "passed" : true
    },
    {
      "name" : "changed processor run 1: exact features",
      "passed" : true
    },
    {
      "name" : "request-local cache is released",
      "passed" : true
    },
    {
      "name" : "same request still deduplicates",
      "passed" : true
    },
    {
      "name" : "changed image changes features",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-image-reuse",
  "passed" : true
}

```

## Host-only source Tools/serve_bench.py

SHA-256: `aaaaa8f2037d6a786405ed9cdb7279adce226b31ff9128ba5c4c433fccf7ad1e`

```python
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import hashlib
import http.client
import json
import os
from pathlib import Path
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot


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
    if not 8.1<=protocol['memory_gb']<=10 or protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity=json.loads((binary.parent/'build-identity.json').read_text())
    for name,key in [('slotstream','binary_sha256'),('mlx.metallib','metallib_sha256'),('build-source.tar.gz','source_archive_sha256')]:
        if digest(binary.parent/name)!=identity[key]: raise ValueError('frozen identity mismatch')
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
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
            scope=int(env.get('SLOTSTREAM_OPT_READ_SCOPE','0'))
            if scope: extra+=max(0,scope-arm['chunk'])*1.30e-3+.12
            row={'round':number,'arm':name,'valid':False,'extra_preflight_allowance_gb':extra,
                 'env':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')}}
            child=None
            try:
                row['before_startup']=preflight(protocol['memory_gb']+extra+3)
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

## Host-only source Tools/memory_gate.py

SHA-256: `89d955b84997689aa21df96f3c32cb7909f0099f21e75d4c739e99ee459b2aff`

```python
#!/usr/bin/env python3
"""Check sampled process memory from structured generation observations."""
import argparse
from decimal import Decimal, InvalidOperation
import json


def check_memory(payload, limit_gb):
    limit = Decimal(str(limit_gb)) * 1_000_000_000
    if not limit.is_finite() or limit <= 0: raise ValueError('memory limit must be finite and positive')
    stats = payload['stats']
    sample = stats['sampledFootprint']
    def integer(value, name, positive=False):
        if type(value) is not int or value < (1 if positive else 0):
            raise ValueError(name + ' must be a valid integer observation')
        return value
    sampled = integer(sample['peakBytes'], 'sampled peak', True)
    integer(sample['samples'], 'sample count', True)
    integer(sample['intervalMilliseconds'], 'sample interval', True)
    rss = integer(stats['lifetimeRSSPeakBytes'], 'lifetime RSS', True)
    end = integer(stats['physicalFootprintEndBytes'], 'end footprint', True)
    for name in ['swapins', 'swapouts']:
        before = integer(stats['generatorVMBefore'][name], 'VM before ' + name)
        after = integer(stats['generatorVMAfter'][name], 'VM after ' + name)
        if before != after: raise ValueError('swap activity during generator interval')
    peak = max(sampled, rss, end)
    if peak > limit: raise ValueError(f'observed {peak} bytes exceeds {limit} byte target')
    return {'passed': True, 'maximum_observed_bytes': peak,
            'sampled_footprint_bytes': sampled, 'lifetime_rss_bytes': rss,
            'physical_footprint_end_bytes': end, 'sampling_interval_ms': sample['intervalMilliseconds']}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('input'); p.add_argument('--limit-gb', required=True)
    args = p.parse_args()
    try:
        with open(args.input) as f: payload = json.load(f)
        result = check_memory(payload, args.limit_gb)
    except (ValueError, TypeError, KeyError, OSError, InvalidOperation) as e:
        print(json.dumps({'passed': False, 'error': str(e)})); return 1
    print(json.dumps(result)); return 0


if __name__ == '__main__': raise SystemExit(main())

```

## Host-only source Tools/prefill_bench_test.py

SHA-256: `e92ec42691df2a6504824d43ab270e6cb33a1ecb32f70527bb7fb3f1fb92e6f5`

```python
#!/usr/bin/env python3
import copy
import unittest
from prefill_bench import vm_snapshot, validate_metrics, paired_summary
from serve_bench import request_body, resource_exclusions, summaries, acceptance_results
import json
from memory_gate import check_memory
from contextlib import redirect_stdout
import io
from pathlib import Path
from tempfile import TemporaryDirectory
from unittest.mock import patch
from types import SimpleNamespace
import serve_bench


class HarnessTests(unittest.TestCase):
    def test_memory_gate_uses_bytes_and_rejects_missing_samples_or_swap(self):
        stats = {'sampledFootprint': {'peakBytes': 10_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                 'lifetimeRSSPeakBytes': 1_000_000_000, 'physicalFootprintEndBytes': 2_000_000_000,
                 'generatorVMBefore': {'swapins': 4, 'swapouts': 5},
                 'generatorVMAfter': {'swapins': 4, 'swapouts': 5}}
        self.assertTrue(check_memory({'stats': stats}, '10')['passed'])
        bad = copy.deepcopy(stats); bad['sampledFootprint']['peakBytes'] += 1
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        bad = copy.deepcopy(stats); bad['generatorVMAfter']['swapins'] += 1
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        bad = copy.deepcopy(stats); bad['sampledFootprint']['peakBytes'] = True
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        for missing in ['sampledFootprint', 'generatorVMBefore', 'physicalFootprintEndBytes']:
            bad = copy.deepcopy(stats); del bad[missing]
            with self.assertRaises(KeyError): check_memory({'stats': bad}, '10')

    def test_interrupted_serving_cell_stops_child_and_preserves_incomplete_result(self):
        # Exercise main's actual cleanup/persistence path without a model,
        # sockets, memory pressure, or an unbounded subprocess.
        with TemporaryDirectory() as directory:
            root = Path(directory); binary = root/'slotstream'; binary.write_bytes(b'fixture')
            (root/'build-source.tar.gz').write_bytes(b'fixture')
            (root/'mlx.metallib').write_bytes(b'fixture')
            (root/'build-identity.json').write_text(json.dumps({k: 'bound' for k in
                ['binary_sha256', 'metallib_sha256', 'source_archive_sha256']}))
            fixture = root/'prompt.txt'; fixture.write_text('test')
            protocol = {'arms': {'reference': {'chunk': 256, 'env': {}}},
                        'model': str(root), 'binary': str(binary), 'fixture': str(fixture),
                        'fixture_sha256': 'bound', 'memory_gb': 8.1, 'rounds': 1,
                        'max_tokens': 16, 'seed': 7}
            p = root/'protocol.json'; p.write_text(json.dumps(protocol)); out = root/'result'
            child = SimpleNamespace(pid=999_999)
            warm = {'metrics': {'stats': {}}}
            with patch.object(serve_bench, 'digest', return_value='bound'), \
                 patch.object(serve_bench, 'model_identity', return_value={}), \
                 patch.object(serve_bench, 'preflight', return_value={}), \
                 patch.object(serve_bench, 'host_conditions', return_value={}), \
                 patch.object(serve_bench, 'vm_snapshot', return_value={}), \
                 patch.object(serve_bench.subprocess, 'Popen', return_value=child), \
                 patch.object(serve_bench, 'wait_ready'), \
                 patch.object(serve_bench, 'exchange', side_effect=[(warm, b'{}\n'), KeyboardInterrupt]), \
                 patch.object(serve_bench, 'stop_server') as stopped, \
                 patch('sys.argv', ['serve_bench', '--protocol', str(p), '--out', str(out)]), \
                 redirect_stdout(io.StringIO()):
                code = serve_bench.main()
            self.assertEqual(code, 130); stopped.assert_called_once_with(child)
            row = json.loads((out/'1-reference/result.json').read_text())
            self.assertTrue(row['interrupted']); self.assertFalse(row['valid'])
            completion = json.loads((out/'completion.json').read_text())
            self.assertTrue(completion['interrupted']); self.assertEqual(completion['recorded_cells'], 1)
            self.assertIsNone(completion['acceptance'])

    def test_declared_resource_limits_fail_closed(self):
        p = {'maximum_sampled_footprint_bytes': 10_000_000_000}
        self.assertTrue(resource_exclusions({}, p))
        self.assertTrue(resource_exclusions({'sampledFootprint': None}, p))
        self.assertTrue(resource_exclusions({'sampledFootprint': {'peakBytes': 10_000_000_001}}, p))
        self.assertFalse(resource_exclusions({'sampledFootprint': {'peakBytes': 10_000_000_000}}, p))
        self.assertFalse(resource_exclusions({}, {}))
        with self.assertRaises(ValueError): resource_exclusions({}, {'maximum_sampled_footprint_bytes': True})
        nominal = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
        s = {'generatorSystemBefore': nominal, 'generatorSystemAfter': nominal}
        p = {'require_nominal_power_state': True}
        self.assertFalse(resource_exclusions(s, p))
        self.assertTrue(resource_exclusions({}, p))
        s['generatorSystemAfter'] = nominal | {'thermalState': 'serious'}
        self.assertTrue(resource_exclusions(s, p))
        s['generatorSystemAfter'] = 'nominal'
        self.assertTrue(resource_exclusions(s, p))
        with self.assertRaises(ValueError): resource_exclusions({}, {'require_nominal_power_state': 'true'})

    def test_frozen_acceptance_rejects_insufficient_or_unequal_work(self):
        contract = {'minimum_pairs': 2, 'minimum_median_client_reduction': .05,
                    'minimum_positive_fraction': .8, 'all_outputs_exact': True}
        pair = {'client_reduction_fraction': .1, 'output_ids_equal': True, 'wire_text_equal': True}
        item = {'candidate': 'c', 'pairs': [pair.copy(), pair.copy()], 'median_client_reduction_fraction': .1}
        self.assertTrue(acceptance_results([item], contract)[0]['passed'])
        item['pairs'][-1]['output_ids_equal'] = False
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['pairs'].pop()
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['pairs'] = []; item['median_client_reduction_fraction'] = None
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        for value in [float('nan'), float('inf'), True, -.1]:
            with self.assertRaises(ValueError): acceptance_results([], contract | {'minimum_positive_fraction': value})

    def test_serving_workload_uses_explicit_template_and_seed(self):
        protocol = {'max_tokens': 16, 'seed': 7}
        body = json.loads(request_body(protocol, 'λ\n"query"'))
        self.assertEqual(body['prompt'], 'λ\n"query"')
        self.assertTrue(body['raw'])
        self.assertNotIn('think', body)
        body = json.loads(request_body(protocol | {'raw': False, 'think': False}, 'query'))
        self.assertFalse(body['raw']); self.assertFalse(body['think'])
        self.assertEqual(body['options'], {'temperature': 0, 'num_predict': 16, 'seed': 7})
        for setting in [{'raw': 'false'}, {'think': False}, {'raw': False, 'think': 'false'}]:
            with self.assertRaises(ValueError): request_body(protocol | setting, 'query')

    def test_serving_summary_keeps_client_and_generator_metrics_separate(self):
        rows = [{'round': 1, 'arm': arm, 'valid': True, 'client_seconds': client, 'text': 'same',
                 'metrics': {'prompt_ids': [1], 'output_ids': [2], 'effective_pool_slots': 640,
                             'effective_mtp': False, 'stats': {'requestSeconds': generator}}}
                for arm, client, generator in [('reference', 10, 10), ('candidate', 10.6, 10.4)]]
        result = summaries(rows, 'reference')[0]
        self.assertAlmostEqual(result['median_client_reduction_fraction'], -.06)
        self.assertAlmostEqual(result['median_generator_reduction_fraction'], -.04)
        rows[-1]['metrics']['effective_pool_slots'] = 639
        self.assertEqual(summaries(rows, 'reference')[0]['pairs'], [])
        self.assertEqual(len(summaries(rows, 'reference', 'fixed-total-memory')[0]['pairs']), 1)
        with self.assertRaises(ValueError): summaries([], 'reference', 'unbounded')
        rows[-1]['valid'] = False
        result = summaries(rows, 'reference')[0]
        self.assertEqual(result['pairs'], []); self.assertEqual(result['excluded_rounds'], [1])

    def test_comparison_excludes_whole_pair(self):
        rows = []
        for round_number in [1, 2]:
            for arm in ["reference", "candidate"]:
                rows.append({"prompt":"p", "chunk":256, "round":round_number, "arm":arm,
                    "valid": not (round_number == 1 and arm == "candidate"),
                    "metrics":{"prompt_ids":[1,2], "output_ids":[3], "effective_pool_slots":640,
                               "stats":{"requestSeconds": 100 if round_number == 1 else (2 if arm == "reference" else 1)}}})
        result = paired_summary(rows, "reference")[0]
        self.assertEqual(result["excluded_rounds"], [1])
        self.assertEqual(result["median_request_reduction_fraction"], .5)
        self.assertEqual(len(result["pairs"]), 1)
        rows[-1]["metrics"]["prompt_ids"] = [2,3]
        self.assertIsNone(paired_summary(rows, "reference")[0]["median_request_reduction_fraction"])

    def test_reclaimable_uses_real_page_size_and_file_backed(self):
        for size in (4096, 16384):
            raw = f'''Mach Virtual Memory Statistics: (page size of {size} bytes)
Pages free: 11.
Pages inactive: 9999.
Pages speculative: 9999.
Pages purgeable: 13.
File-backed pages: 17.
Swapins: 19.
Swapouts: 23.
'''
            s = vm_snapshot(raw)
            self.assertEqual(s["reclaimable_bytes"], 41*size)
            self.assertEqual((s["swapins"], s["swapouts"]), (19, 23))

    def test_missing_memory_fields_fail_closed(self):
        with self.assertRaises(ValueError): vm_snapshot("page size of 4096 bytes\nPages free: 9.\n")

    def test_metrics_fail_closed(self):
        good = {"schema_version": 1, "stats": {"prefillSeconds": 1.0, "decodeSeconds": 0.2,
                "requestSeconds": 1.2, "imageEncodeSeconds": 0, "prefillRecords": 17,
                "decodeRecords": 3, "prefillTokens": 2, "promptTokens": 2, "decodeTokens": 1,
                "lifetimeRSSPeakBytes": 123, "prefillPasses": [2]}, "prompt_ids": [1,2], "output_ids": [3]}
        self.assertEqual(validate_metrics(good)["prefillRecords"], 17)
        for key, value in [("prefillSeconds", float("nan")), ("decodeSeconds", -1),
                           ("prefillRecords", None), ("decodeRecords", 0.5),
                           ("prefillTokens", 0), ("prefillPasses", [1]), ("decodeTokens", 2)]:
            with self.subTest(key=key):
                bad = copy.deepcopy(good); bad["stats"][key] = value
                with self.assertRaises(ValueError): validate_metrics(bad)
        bad = copy.deepcopy(good); del bad["stats"]["prefillRecords"]
        with self.assertRaises(ValueError): validate_metrics(bad)


if __name__ == "__main__": unittest.main()

```

