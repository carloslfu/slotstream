---
type: run
id: 01m1rhgxfd0gax2ght93v9ctrs
created: 2026-09-05T10:23:43.596878+00:00
updated: 2026-09-05T10:24:12.972218+00:00
summary: Vision identity and router promotion with an open memory failure
binary: Frozen V25 and V26 identities in body
captured_at: 2026-09-05
command: Exact manifests and source snapshots in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Vision identity and router promotion with an open memory failure
tool: Frozen native and live serving correctness diagnostics
---
# Vision identity and router promotion: correctness with an open memory failure

Frozen V25 preserves the original 72-dimensional attention scale while padding to 128 and cropping the result. The Swift component has 60 passing numerical assertions, and request-local duplicate feature reuse plus preparation identity has 68. The full 27-block tower passes the existing unchanged pinned MLX/NumPy reference bands on secret1.jpg, 2,808 patches / 702 merged rows. The global cosine to MLX BF16 is 0.99875814; the worst token cosine is 0.926120. These declared bands are not bit identity or evidence about every possible image.

The 10 GB, MTP-off, padding-128 plus request-reuse serving sequence passes 22 correctness checks. It DOES NOT pass memory qualification: the two-image request samples 10,335,933,408 bytes and the changed-tree request 10,042,627,136 bytes, both above the 10,000,000,000-byte target. The original planner deliberately left tower residency outside its total target; repeated-prefix state and allocator transients also require accounting. No request-speed, budget-fit or default-adoption claim follows from this run. Its historical harness and exact responses are preserved below. Its order response was dog,pomelo and satisfies the later stricter comma-order assertion, but that stricter harness was not the one run for the original 22 checks.

The first same-geometry content test passes only three of four checks. A seed answer with a leading space retokenizes when the client replays it, so its text prefix is ineligible; this is an invalid test of image-identity rejection, not evidence of stale pixels. That failed run is retained. The corrected independent run seeds the established Say only: ok workload and passes all four checks: the incoming token IDs genuinely extend the cached IDs, changed same-size image content misses and re-encodes, and the output identifies blue. Neither run establishes latency.

Frozen V26 caches a materialized float32 copy of each original BF16 router matrix behind a default-off control. Actual pinned matmul promotes both operands to float32 already; the cached path preserves that arithmetic. The original BF16 weights remain resident and the full extra float32 payload is counted: 251,658,240 bytes for the 48 main routers, 256,901,120 with the MTP router. Thirty component assertions cover row shapes, ordered routes, idempotent preparation and release. The main-state gate passes 1,130 assertions; the MTP gate passes 370, covering unchanged outputs, complete retained states, routing and future draft alignment across bounded output limits. The V26 T0/T1 catalogue passes all 27 groups. None of these correctness durations is paired performance evidence. Fixed-total-memory benefit, cold promotion cost, compatibility and combined qualification remain open. The router control stays off.

Binary, source archive, metallib and model identities are in the exact manifests below. The check-runner executable has a separate hash because the build identity currently binds the CLI executable. Raw files remain in the local frozen run directories; this source copies the text evidence and records the binary coordinates.

- `.build/optimization/candidate-vision-padding-v25/slotstream`: 39314696 bytes; sha256 `866407ae0548668eb15c18b185d13e3f9656a2ea3394f988e6a7bb92f4467b9a`.

- `.build/optimization/candidate-vision-padding-v25/slotstream-checks`: 37249856 bytes; sha256 `f18401d24242f3cc6b24c888f2428e6a0f9c6c17797c50aca585f8887a767eeb`.

- `.build/optimization/candidate-vision-padding-v25/mlx.metallib`: 131041909 bytes; sha256 `198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597`.

- `.build/optimization/candidate-vision-padding-v25/build-source.tar.gz`: 277993 bytes; sha256 `c7b8f391c41635975c9c184fa8f78fd107f1e8c6d49678af608dd38d785b56a6`.

- `.build/optimization/candidate-router-weights-v26/slotstream`: 39339560 bytes; sha256 `1316fc18731f7809a93d66ba782dddee1e6623c99bf2dc9a97d63cd346afd4d1`.

- `.build/optimization/candidate-router-weights-v26/slotstream-checks`: 37274896 bytes; sha256 `c0e9065d57c6610557f2ae00a14826fdc70f2e226087307c44098f818db6735f`.

- `.build/optimization/candidate-router-weights-v26/mlx.metallib`: 131041909 bytes; sha256 `198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597`.

- `.build/optimization/candidate-router-weights-v26/build-source.tar.gz`: 279703 bytes; sha256 `2aa2d60edef2cc49073160b4250a13d416ebb0105bb7f2e93bae4c400c244f48`.

## .build/optimization/candidate-vision-padding-v25/build-identity.json

SHA-256 `c1f562ed96333584675ad99356e746009a8248117f94d3497762ef7f5c92487c`; 8283 bytes.

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
    "Sources/Slotstream/Generate.swift": "a9727ce9083dcdc39723ec1bd1c0faef4d8749e6c92ca315ecfe32b556256b67",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "03f029b78801b5215db21f5be2a8e515474726a594f36cda936d2018d853226f",
    "Sources/Slotstream/MTP.swift": "868f0d7d45171d29569f94390feaba02ae567504721e327667fe2bad4dcf73a2",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "5d2cb9e955a52b4b559744c111a6990f4edd4e8465fd27d2a8ec88cc61743cb4",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "bfd0989c009f6866c736ae17fa2f1e14db44fb493d542c14f3619e538ef1604b",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
    "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
    "Sources/Slotstream/VisionPrompt.swift": "65be7945e2dd57ec975810e6ba6e5a17cd0b9de4c3b4608b423f04df41352549",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "efe29406a51ab3c02aa6ecee6c566215f63ddc03e196ab0ac975b4d1c8209ae7",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "27aaf2f516d4dd836545837e209acd3aa8fc00f967fbc60eac1d8b2b1c672b00",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "4faccb1ab32f840ff3e03f08c15c33c35d365464063776e96d8dc914ef9ed22c",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
    "Sources/slotstream-cli/main.swift": "dafcf24e2a43f819719558f0a7613f42427553a779c11c2d959067a6ebe32459",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "c7b8f391c41635975c9c184fa8f78fd107f1e8c6d49678af608dd38d785b56a6",
  "binary_sha256": "866407ae0548668eb15c18b185d13e3f9656a2ea3394f988e6a7bb92f4467b9a",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/candidate-router-weights-v26/build-identity.json

SHA-256 `369834da61c1b8b555b558ab62c8e9cc5bfc92d5589324f1db92b492bbb4c045`; 8540 bytes.

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
    "Sources/Slotstream/Engine.swift": "9d303c4035ad64a29a3d50a8166d7492936cbeb1b278e443ffb65333effc3256",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExpertStore.swift": "7088ff6c9e71f50520b008ef3090680d2eb1bdac6395625a31f6f736a77ac07c",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "dd4ab74370d7e5dd267ed070b05c26c411394c0d511a8062c2e040b40944a21d",
    "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
    "Sources/Slotstream/Layers.swift": "06a364af34c4cef1b7e0b4ce15c44a879449f996ddb62d3e481e2d6d8bcdd6dc",
    "Sources/Slotstream/MTP.swift": "ea5c1a6dbc47fc1c38a01b055d375fa3a9b3d419562ce97a15be51aefdacbb8a",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "aa26a9fa9ca96a20e3d4865f613d15827daa86c77e6191ee825f1767ed7f60ce",
    "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
    "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
    "Sources/Slotstream/Optimizations.swift": "1c75201ae9a224ee80faf0a294efa4f561c0e87d10af1f654b4fd23ebc7d4893",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
    "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
    "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
    "Sources/Slotstream/VisionPrompt.swift": "65be7945e2dd57ec975810e6ba6e5a17cd0b9de4c3b4608b423f04df41352549",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f5334668142f8c52ea1a1f374469eb4588e92dcd42b1f37893fbfbf35146f397",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "c6ba9fdd29b8271e6761dc28d8431fc7645276966f60b624217b3022e2d760b0",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "7a193da93b2cbb2b62b76c401628dabcbbe6cbde03c6799ee29c01776e092cf7",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
    "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "2aa2d60edef2cc49073160b4250a13d416ebb0105bb7f2e93bae4c400c244f48",
  "binary_sha256": "1316fc18731f7809a93d66ba782dddee1e6623c99bf2dc9a97d63cd346afd4d1",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/catalogue-v26.json

SHA-256 `baa42d550224251c8344de55656f48581a0e19ff0061099b2a0a4c257ae88de6`; 146613 bytes.

```
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
          "name" : "read scopes preserve every bounded compute pass",
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
          "name" : "request VM counters are monotonic",
          "passed" : true
        },
        {
          "name" : "request VM reclaimable bytes are available",
          "passed" : true
        },
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
          "name" : "invalid read scope -1 refused",
          "passed" : true
        },
        {
          "name" : "invalid read scope 1 refused",
          "passed" : true
        },
        {
          "name" : "invalid read scope 16384 refused",
          "passed" : true
        },
        {
          "name" : "invalid read scope bad refused",
          "passed" : true
        },
        {
          "name" : "unbounded read scope refused",
          "passed" : true
        },
        {
          "name" : "explicit workspace tile is recorded",
          "passed" : true
        },
        {
          "name" : "unbounded workspace tile refused",
          "passed" : true
        },
        {
          "name" : "terminal output needs no speculative draft",
          "passed" : true
        },
        {
          "name" : "draft count fits remaining output",
          "passed" : true
        },
        {
          "name" : "public depth cannot exceed recording cap",
          "passed" : true
        },
        {
          "name" : "negative remaining output cannot underflow",
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
        "free_disk_bytes" : 457442377728,
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
          "name" : "output queue is opt-in",
          "passed" : true
        },
        {
          "name" : "typed output queue control",
          "passed" : true
        },
        {
          "name" : "empty queue finishes",
          "passed" : true
        },
        {
          "name" : "finished queue rejects new bytes",
          "passed" : true
        },
        {
          "name" : "empty queue writes nothing",
          "passed" : true
        },
        {
          "name" : "finish is idempotent",
          "passed" : true
        },
        {
          "name" : "enqueue fragment 0",
          "passed" : true
        },
        {
          "name" : "enqueue fragment 1",
          "passed" : true
        },
        {
          "name" : "enqueue fragment 2",
          "passed" : true
        },
        {
          "name" : "enqueue fragment 3",
          "passed" : true
        },
        {
          "name" : "ordered frames drain",
          "passed" : true
        },
        {
          "name" : "descriptor flags restored after joining",
          "passed" : true
        },
        {
          "name" : "byte-exact FIFO across scalar and framing splits",
          "passed" : true
        },
        {
          "name" : "written frame count",
          "passed" : true
        },
        {
          "name" : "queued bytes",
          "passed" : true
        },
        {
          "name" : "written bytes",
          "passed" : true
        },
        {
          "name" : "first socket write observed",
          "passed" : true
        },
        {
          "name" : "owned storage bounded",
          "passed" : true
        },
        {
          "name" : "oversized frame rejected atomically",
          "passed" : true
        },
        {
          "name" : "oversized frame cancels producer",
          "passed" : true
        },
        {
          "name" : "oversized frame drain fails",
          "passed" : true
        },
        {
          "name" : "oversized frame never queued",
          "passed" : true
        },
        {
          "name" : "oversized frame never written",
          "passed" : true
        },
        {
          "name" : "one in-flight frame accepted",
          "passed" : true
        },
        {
          "name" : "in-flight frame counts toward saturation",
          "passed" : true
        },
        {
          "name" : "saturation never blocks inference callback",
          "passed" : true
        },
        {
          "name" : "saturated writer joins with failure",
          "passed" : true
        },
        {
          "name" : "saturation cleanup is bounded",
          "passed" : true
        },
        {
          "name" : "saturated owned storage bounded",
          "passed" : true
        },
        {
          "name" : "stalled-peer frame accepted",
          "passed" : true
        },
        {
          "name" : "non-reading peer times out",
          "passed" : true
        },
        {
          "name" : "stalled peer cannot extend drain deadline",
          "passed" : true
        },
        {
          "name" : "socket stalls observed",
          "passed" : true
        },
        {
          "name" : "queued and written bytes stay distinct",
          "passed" : true
        },
        {
          "name" : "partial frame is not a written frame",
          "passed" : true
        },
        {
          "name" : "disconnected peer fails without SIGPIPE",
          "passed" : true
        },
        {
          "name" : "disconnect latched for cancellation",
          "passed" : true
        },
        {
          "name" : "disconnected frame not delivered",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "optimization-bounded-output",
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
          "name" : "N1.float32.pattern0.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N1.float32.pattern0.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N1.float32.pattern1.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N1.float32.pattern1.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N1.float32.pattern2.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N1.float32.pattern2.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N1.bfloat16.pattern0.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N1.bfloat16.pattern0.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N1.bfloat16.pattern1.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N1.bfloat16.pattern1.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N1.bfloat16.pattern2.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N1.bfloat16.pattern2.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N8.float32.pattern0.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N8.float32.pattern0.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N8.float32.pattern1.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N8.float32.pattern1.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N8.float32.pattern2.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N8.float32.pattern2.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N8.bfloat16.pattern0.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N8.bfloat16.pattern0.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N8.bfloat16.pattern1.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N8.bfloat16.pattern1.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N8.bfloat16.pattern2.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N8.bfloat16.pattern2.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N9.float32.pattern0.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N9.float32.pattern0.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N9.float32.pattern1.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N9.float32.pattern1.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N9.float32.pattern2.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N9.float32.pattern2.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N9.bfloat16.pattern0.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N9.bfloat16.pattern0.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N9.bfloat16.pattern1.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N9.bfloat16.pattern1.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N9.bfloat16.pattern2.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N9.bfloat16.pattern2.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N64.float32.pattern0.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N64.float32.pattern0.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N64.float32.pattern1.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N64.float32.pattern1.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N64.float32.pattern2.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N64.float32.pattern2.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N64.bfloat16.pattern0.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N64.bfloat16.pattern0.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N64.bfloat16.pattern1.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N64.bfloat16.pattern1.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N64.bfloat16.pattern2.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N64.bfloat16.pattern2.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N257.float32.pattern0.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N257.float32.pattern0.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N257.float32.pattern1.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N257.float32.pattern1.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N257.float32.pattern2.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N257.float32.pattern2.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N257.bfloat16.pattern0.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N257.bfloat16.pattern0.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N257.bfloat16.pattern1.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N257.bfloat16.pattern1.pad128: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N257.bfloat16.pattern2.pad80: independent Float64 oracle",
          "passed" : true
        },
        {
          "name" : "N257.bfloat16.pattern2.pad128: independent Float64 oracle",
          "passed" : true
        }
      ],
      "measurements" : {
        "N1.bfloat16.pattern0.pad128.candidate_max_error" : 0,
        "N1.bfloat16.pattern0.pad128.reference_max_error" : 0,
        "N1.bfloat16.pattern0.pad80.candidate_max_error" : 0,
        "N1.bfloat16.pattern0.pad80.reference_max_error" : 0,
        "N1.bfloat16.pattern1.pad128.candidate_max_error" : 0,
        "N1.bfloat16.pattern1.pad128.reference_max_error" : 0,
        "N1.bfloat16.pattern1.pad80.candidate_max_error" : 0,
        "N1.bfloat16.pattern1.pad80.reference_max_error" : 0,
        "N1.bfloat16.pattern2.pad128.candidate_max_error" : 0,
        "N1.bfloat16.pattern2.pad128.reference_max_error" : 0,
        "N1.bfloat16.pattern2.pad80.candidate_max_error" : 0,
        "N1.bfloat16.pattern2.pad80.reference_max_error" : 0,
        "N1.float32.pattern0.pad128.candidate_max_error" : 0,
        "N1.float32.pattern0.pad128.reference_max_error" : 0,
        "N1.float32.pattern0.pad80.candidate_max_error" : 0,
        "N1.float32.pattern0.pad80.reference_max_error" : 0,
        "N1.float32.pattern1.pad128.candidate_max_error" : 0,
        "N1.float32.pattern1.pad128.reference_max_error" : 0,
        "N1.float32.pattern1.pad80.candidate_max_error" : 0,
        "N1.float32.pattern1.pad80.reference_max_error" : 0,
        "N1.float32.pattern2.pad128.candidate_max_error" : 0,
        "N1.float32.pattern2.pad128.reference_max_error" : 0,
        "N1.float32.pattern2.pad80.candidate_max_error" : 0,
        "N1.float32.pattern2.pad80.reference_max_error" : 0,
        "N257.bfloat16.pattern0.pad128.candidate_max_error" : 0.000538285401837757,
        "N257.bfloat16.pattern0.pad128.reference_max_error" : 0.0018114159081796324,
        "N257.bfloat16.pattern0.pad80.candidate_max_error" : 0.0004874594102699803,
        "N257.bfloat16.pattern0.pad80.reference_max_error" : 0.0018114159081796324,
        "N257.bfloat16.pattern1.pad128.candidate_max_error" : 2.9211378283088354e-05,
        "N257.bfloat16.pattern1.pad128.reference_max_error" : 2.9211378283088354e-05,
        "N257.bfloat16.pattern1.pad80.candidate_max_error" : 2.9211378283088354e-05,
        "N257.bfloat16.pattern1.pad80.reference_max_error" : 2.9211378283088354e-05,
        "N257.bfloat16.pattern2.pad128.candidate_max_error" : 0.007789692562811368,
        "N257.bfloat16.pattern2.pad128.reference_max_error" : 2.6857565813341067,
        "N257.bfloat16.pattern2.pad80.candidate_max_error" : 0.007789692562811368,
        "N257.bfloat16.pattern2.pad80.reference_max_error" : 2.6857565813341067,
        "N257.float32.pattern0.pad128.candidate_max_error" : 0.00010778801288374718,
        "N257.float32.pattern0.pad128.reference_max_error" : 0.00023909109307282406,
        "N257.float32.pattern0.pad80.candidate_max_error" : 1.1854338682892873e-07,
        "N257.float32.pattern0.pad80.reference_max_error" : 0.00023909109307282406,
        "N257.float32.pattern1.pad128.candidate_max_error" : 4.4573027387084796e-10,
        "N257.float32.pattern1.pad128.reference_max_error" : 3.0892368420298855e-07,
        "N257.float32.pattern1.pad80.candidate_max_error" : 4.4573027387084796e-10,
        "N257.float32.pattern1.pad80.reference_max_error" : 3.0892368420298855e-07,
        "N257.float32.pattern2.pad128.candidate_max_error" : 0.0005860100193580686,
        "N257.float32.pattern2.pad128.reference_max_error" : 0.2511821600332157,
        "N257.float32.pattern2.pad80.candidate_max_error" : 0.0001352797162260666,
        "N257.float32.pattern2.pad80.reference_max_error" : 0.2511821600332157,
        "N64.bfloat16.pattern0.pad128.candidate_max_error" : 0.0010267481686909163,
        "N64.bfloat16.pattern0.pad128.reference_max_error" : 0.002610792950366758,
        "N64.bfloat16.pattern0.pad80.candidate_max_error" : 0.0009747228888511428,
        "N64.bfloat16.pattern0.pad80.reference_max_error" : 0.002610792950366758,
        "N64.bfloat16.pattern1.pad128.candidate_max_error" : 0.000244140625,
        "N64.bfloat16.pattern1.pad128.reference_max_error" : 0.000244140625,
        "N64.bfloat16.pattern1.pad80.candidate_max_error" : 0.000244140625,
        "N64.bfloat16.pattern1.pad80.reference_max_error" : 0.000244140625,
        "N64.bfloat16.pattern2.pad128.candidate_max_error" : 0.006639587043577588,
        "N64.bfloat16.pattern2.pad128.reference_max_error" : 1.7981864968523573,
        "N64.bfloat16.pattern2.pad80.candidate_max_error" : 0.006639587043577588,
        "N64.bfloat16.pattern2.pad80.reference_max_error" : 1.7981864968523573,
        "N64.float32.pattern0.pad128.candidate_max_error" : 0.0002290959595714348,
        "N64.float32.pattern0.pad128.reference_max_error" : 0.0004726405381236809,
        "N64.float32.pattern0.pad80.candidate_max_error" : 1.322241877099728e-07,
        "N64.float32.pattern0.pad80.reference_max_error" : 0.0004726405381236809,
        "N64.float32.pattern1.pad128.candidate_max_error" : 0,
        "N64.float32.pattern1.pad128.reference_max_error" : 0,
        "N64.float32.pattern1.pad80.candidate_max_error" : 0,
        "N64.float32.pattern1.pad80.reference_max_error" : 0,
        "N64.float32.pattern2.pad128.candidate_max_error" : 0.0003739941924431056,
        "N64.float32.pattern2.pad128.reference_max_error" : 0.1525549215722088,
        "N64.float32.pattern2.pad80.candidate_max_error" : 7.487927299765218e-05,
        "N64.float32.pattern2.pad80.reference_max_error" : 0.1525549215722088,
        "N8.bfloat16.pattern0.pad128.candidate_max_error" : 0.003436534384367418,
        "N8.bfloat16.pattern0.pad128.reference_max_error" : 0.0068027835380852775,
        "N8.bfloat16.pattern0.pad80.candidate_max_error" : 0.0068027835380852775,
        "N8.bfloat16.pattern0.pad80.reference_max_error" : 0.0068027835380852775,
        "N8.bfloat16.pattern1.pad128.candidate_max_error" : 0.001953125,
        "N8.bfloat16.pattern1.pad128.reference_max_error" : 0.001953125,
        "N8.bfloat16.pattern1.pad80.candidate_max_error" : 0.001953125,
        "N8.bfloat16.pattern1.pad80.reference_max_error" : 0.001953125,
        "N8.bfloat16.pattern2.pad128.candidate_max_error" : 1.5543122344752192e-15,
        "N8.bfloat16.pattern2.pad128.reference_max_error" : 1.5543122344752192e-15,
        "N8.bfloat16.pattern2.pad80.candidate_max_error" : 1.5543122344752192e-15,
        "N8.bfloat16.pattern2.pad80.reference_max_error" : 1.5543122344752192e-15,
        "N8.float32.pattern0.pad128.candidate_max_error" : 2.5610936960074326e-07,
        "N8.float32.pattern0.pad128.reference_max_error" : 0.0009692851125615576,
        "N8.float32.pattern0.pad80.candidate_max_error" : 0.0009692851125615576,
        "N8.float32.pattern0.pad80.reference_max_error" : 0.0009692851125615576,
        "N8.float32.pattern1.pad128.candidate_max_error" : 0,
        "N8.float32.pattern1.pad128.reference_max_error" : 0,
        "N8.float32.pattern1.pad80.candidate_max_error" : 0,
        "N8.float32.pattern1.pad80.reference_max_error" : 0,
        "N8.float32.pattern2.pad128.candidate_max_error" : 1.5543122344752192e-15,
        "N8.float32.pattern2.pad128.reference_max_error" : 1.5543122344752192e-15,
        "N8.float32.pattern2.pad80.candidate_max_error" : 1.5543122344752192e-15,
        "N8.float32.pattern2.pad80.reference_max_error" : 1.5543122344752192e-15,
        "N9.bfloat16.pattern0.pad128.candidate_max_error" : 0.0037608110287787877,
        "N9.bfloat16.pattern0.pad128.reference_max_error" : 0.00496113798519493,
        "N9.bfloat16.pattern0.pad80.candidate_max_error" : 0.0037608110287787877,
        "N9.bfloat16.pattern0.pad80.reference_max_error" : 0.00496113798519493,
        "N9.bfloat16.pattern1.pad128.candidate_max_error" : 0.0008680555555555802,
        "N9.bfloat16.pattern1.pad128.reference_max_error" : 0.001519097222222321,
        "N9.bfloat16.pattern1.pad80.candidate_max_error" : 0.0008680555555555802,
        "N9.bfloat16.pattern1.pad80.reference_max_error" : 0.001519097222222321,
        "N9.bfloat16.pattern2.pad128.candidate_max_error" : 1.2714274078007293e-12,
        "N9.bfloat16.pattern2.pad128.reference_max_error" : 1.2714274078007293e-12,
        "N9.bfloat16.pattern2.pad80.candidate_max_error" : 1.2714274078007293e-12,
        "N9.bfloat16.pattern2.pad80.reference_max_error" : 1.2714274078007293e-12,
        "N9.float32.pattern0.pad128.candidate_max_error" : 0.00038922965377508056,
        "N9.float32.pattern0.pad128.reference_max_error" : 0.0008949004986882336,
        "N9.float32.pattern0.pad80.candidate_max_error" : 1.5681310983062247e-07,
        "N9.float32.pattern0.pad80.reference_max_error" : 0.0008949004986882336,
        "N9.float32.pattern1.pad128.candidate_max_error" : 1.6556845838788803e-08,
        "N9.float32.pattern1.pad128.reference_max_error" : 0.0001127454969617192,
        "N9.float32.pattern1.pad80.candidate_max_error" : 1.3245476715439963e-08,
        "N9.float32.pattern1.pad80.reference_max_error" : 0.0001127454969617192,
        "N9.float32.pattern2.pad128.candidate_max_error" : 1.2714274078007293e-12,
        "N9.float32.pattern2.pad128.reference_max_error" : 1.2714274078007293e-12,
        "N9.float32.pattern2.pad80.candidate_max_error" : 1.2714274078007293e-12,
        "N9.float32.pattern2.pad80.reference_max_error" : 1.2714274078007293e-12
      },
      "name" : "optimization-vision-attention",
      "passed" : true
    },
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
          "name" : "stable bit-order oracle row 32",
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
        "candidate_1_seconds" : 0.00017656250000000002,
        "candidate_256_seconds" : 0.00016268125,
        "candidate_32_seconds" : 0.00016482915000000001,
        "candidate_4096_seconds" : 0.00020470624999999998,
        "paired_1_reduction" : 0.02261526427929672,
        "paired_256_reduction" : 0.061217464868059124,
        "paired_32_reduction" : 0.02405417199305815,
        "paired_4096_reduction" : 0.60144315643259,
        "reference_1_seconds" : 0.0001819896,
        "reference_256_seconds" : 0.0001761792,
        "reference_32_seconds" : 0.0001689854,
        "reference_4096_seconds" : 0.0005205395500000001
      },
      "name" : "optimization-router-selection",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "default holds no promoted copy",
          "passed" : true
        },
        {
          "name" : "full FP32 copy is charged",
          "passed" : true
        },
        {
          "name" : "one materialized promotion",
          "passed" : true
        },
        {
          "name" : "rows 1: exact logits",
          "passed" : true
        },
        {
          "name" : "rows 1: exact ordered routes",
          "passed" : true
        },
        {
          "name" : "rows 1: no repeated weight conversion",
          "passed" : true
        },
        {
          "name" : "rows 2: exact logits",
          "passed" : true
        },
        {
          "name" : "rows 2: exact ordered routes",
          "passed" : true
        },
        {
          "name" : "rows 2: no repeated weight conversion",
          "passed" : true
        },
        {
          "name" : "rows 8: exact logits",
          "passed" : true
        },
        {
          "name" : "rows 8: exact ordered routes",
          "passed" : true
        },
        {
          "name" : "rows 8: no repeated weight conversion",
          "passed" : true
        },
        {
          "name" : "rows 16: exact logits",
          "passed" : true
        },
        {
          "name" : "rows 16: exact ordered routes",
          "passed" : true
        },
        {
          "name" : "rows 16: no repeated weight conversion",
          "passed" : true
        },
        {
          "name" : "rows 32: exact logits",
          "passed" : true
        },
        {
          "name" : "rows 32: exact ordered routes",
          "passed" : true
        },
        {
          "name" : "rows 32: no repeated weight conversion",
          "passed" : true
        },
        {
          "name" : "rows 256: exact logits",
          "passed" : true
        },
        {
          "name" : "rows 256: exact ordered routes",
          "passed" : true
        },
        {
          "name" : "rows 256: no repeated weight conversion",
          "passed" : true
        },
        {
          "name" : "rows 257: exact logits",
          "passed" : true
        },
        {
          "name" : "rows 257: exact ordered routes",
          "passed" : true
        },
        {
          "name" : "rows 257: no repeated weight conversion",
          "passed" : true
        },
        {
          "name" : "rows 1024: exact logits",
          "passed" : true
        },
        {
          "name" : "rows 1024: exact ordered routes",
          "passed" : true
        },
        {
          "name" : "rows 1024: no repeated weight conversion",
          "passed" : true
        },
        {
          "name" : "disable releases cache",
          "passed" : true
        },
        {
          "name" : "reenable rebuilds exactly once",
          "passed" : true
        },
        {
          "name" : "native FP32 does not allocate a duplicate",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "optimization-router-projection",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "specialized block selector initialized",
          "passed" : true
        },
        {
          "name" : "N=513: pinned MLX exact keep set",
          "passed" : true
        },
        {
          "name" : "N=513: exactly 512 unique keys per row",
          "passed" : true
        },
        {
          "name" : "N=513, row 0: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=513, row 1: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=513, row 2: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=513, row 3: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=513, row 4: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=513, row 5: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=513, row 6: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=513, row 7: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=513: strided input",
          "passed" : true
        },
        {
          "name" : "N=513: repeatable",
          "passed" : true
        },
        {
          "name" : "N=513: repeatable",
          "passed" : true
        },
        {
          "name" : "N=514: pinned MLX exact keep set",
          "passed" : true
        },
        {
          "name" : "N=514: exactly 512 unique keys per row",
          "passed" : true
        },
        {
          "name" : "N=514, row 0: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=514, row 1: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=514, row 2: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=514, row 3: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=514, row 4: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=514, row 5: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=514, row 6: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=514, row 7: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=514: strided input",
          "passed" : true
        },
        {
          "name" : "N=514: repeatable",
          "passed" : true
        },
        {
          "name" : "N=514: repeatable",
          "passed" : true
        },
        {
          "name" : "N=767: pinned MLX exact keep set",
          "passed" : true
        },
        {
          "name" : "N=767: exactly 512 unique keys per row",
          "passed" : true
        },
        {
          "name" : "N=767, row 0: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=767, row 1: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=767, row 2: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=767, row 3: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=767, row 4: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=767, row 5: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=767, row 6: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=767, row 7: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=767: strided input",
          "passed" : true
        },
        {
          "name" : "N=767: repeatable",
          "passed" : true
        },
        {
          "name" : "N=767: repeatable",
          "passed" : true
        },
        {
          "name" : "N=768: pinned MLX exact keep set",
          "passed" : true
        },
        {
          "name" : "N=768: exactly 512 unique keys per row",
          "passed" : true
        },
        {
          "name" : "N=768, row 0: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=768, row 1: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=768, row 2: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=768, row 3: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=768, row 4: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=768, row 5: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=768, row 6: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=768, row 7: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=768: strided input",
          "passed" : true
        },
        {
          "name" : "N=768: repeatable",
          "passed" : true
        },
        {
          "name" : "N=768: repeatable",
          "passed" : true
        },
        {
          "name" : "N=1024: pinned MLX exact keep set",
          "passed" : true
        },
        {
          "name" : "N=1024: exactly 512 unique keys per row",
          "passed" : true
        },
        {
          "name" : "N=1024, row 0: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1024, row 1: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1024, row 2: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1024, row 3: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1024, row 4: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1024, row 5: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1024, row 6: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1024, row 7: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1024: strided input",
          "passed" : true
        },
        {
          "name" : "N=1024: repeatable",
          "passed" : true
        },
        {
          "name" : "N=1024: repeatable",
          "passed" : true
        },
        {
          "name" : "N=1025: pinned MLX exact keep set",
          "passed" : true
        },
        {
          "name" : "N=1025: exactly 512 unique keys per row",
          "passed" : true
        },
        {
          "name" : "N=1025, row 0: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1025, row 1: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1025, row 2: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1025, row 3: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1025, row 4: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1025, row 5: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1025, row 6: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1025, row 7: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1025: strided input",
          "passed" : true
        },
        {
          "name" : "N=1025: repeatable",
          "passed" : true
        },
        {
          "name" : "N=1025: repeatable",
          "passed" : true
        },
        {
          "name" : "N=1536: pinned MLX exact keep set",
          "passed" : true
        },
        {
          "name" : "N=1536: exactly 512 unique keys per row",
          "passed" : true
        },
        {
          "name" : "N=1536, row 0: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1536, row 1: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1536, row 2: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1536, row 3: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1536, row 4: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1536, row 5: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1536, row 6: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1536, row 7: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=1536: strided input",
          "passed" : true
        },
        {
          "name" : "N=1536: repeatable",
          "passed" : true
        },
        {
          "name" : "N=1536: repeatable",
          "passed" : true
        },
        {
          "name" : "N=2048: pinned MLX exact keep set",
          "passed" : true
        },
        {
          "name" : "N=2048: exactly 512 unique keys per row",
          "passed" : true
        },
        {
          "name" : "N=2048, row 0: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2048, row 1: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2048, row 2: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2048, row 3: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2048, row 4: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2048, row 5: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2048, row 6: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2048, row 7: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2048: strided input",
          "passed" : true
        },
        {
          "name" : "N=2048: repeatable",
          "passed" : true
        },
        {
          "name" : "N=2048: repeatable",
          "passed" : true
        },
        {
          "name" : "N=2051: pinned MLX exact keep set",
          "passed" : true
        },
        {
          "name" : "N=2051: exactly 512 unique keys per row",
          "passed" : true
        },
        {
          "name" : "N=2051, row 0: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2051, row 1: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2051, row 2: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2051, row 3: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2051, row 4: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2051, row 5: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2051, row 6: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2051, row 7: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=2051: strided input",
          "passed" : true
        },
        {
          "name" : "N=2051: repeatable",
          "passed" : true
        },
        {
          "name" : "N=2051: repeatable",
          "passed" : true
        },
        {
          "name" : "N=4095: pinned MLX exact keep set",
          "passed" : true
        },
        {
          "name" : "N=4095: exactly 512 unique keys per row",
          "passed" : true
        },
        {
          "name" : "N=4095, row 0: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4095, row 1: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4095, row 2: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4095, row 3: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4095, row 4: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4095, row 5: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4095, row 6: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4095, row 7: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4095: strided input",
          "passed" : true
        },
        {
          "name" : "N=4095: repeatable",
          "passed" : true
        },
        {
          "name" : "N=4095: repeatable",
          "passed" : true
        },
        {
          "name" : "N=4096: pinned MLX exact keep set",
          "passed" : true
        },
        {
          "name" : "N=4096: exactly 512 unique keys per row",
          "passed" : true
        },
        {
          "name" : "N=4096, row 0: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4096, row 1: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4096, row 2: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4096, row 3: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4096, row 4: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4096, row 5: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4096, row 6: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4096, row 7: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=4096: strided input",
          "passed" : true
        },
        {
          "name" : "N=4096: repeatable",
          "passed" : true
        },
        {
          "name" : "N=4096: repeatable",
          "passed" : true
        },
        {
          "name" : "N=8192: pinned MLX exact keep set",
          "passed" : true
        },
        {
          "name" : "N=8192: exactly 512 unique keys per row",
          "passed" : true
        },
        {
          "name" : "N=8192, row 0: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=8192, row 1: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=8192, row 2: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=8192, row 3: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=8192, row 4: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=8192, row 5: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=8192, row 6: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=8192, row 7: scalar stable oracle",
          "passed" : true
        },
        {
          "name" : "N=8192: strided input",
          "passed" : true
        },
        {
          "name" : "N=8192: repeatable",
          "passed" : true
        },
        {
          "name" : "N=8192: repeatable",
          "passed" : true
        },
        {
          "name" : "fallback N=512, K=512, float32",
          "passed" : true
        },
        {
          "name" : "fallback N=1024, K=1, float32",
          "passed" : true
        },
        {
          "name" : "fallback N=8193, K=512, float32",
          "passed" : true
        },
        {
          "name" : "fallback N=1024, K=512, bfloat16",
          "passed" : true
        },
        {
          "name" : "fallback N=513, K=0, float32",
          "passed" : true
        },
        {
          "name" : "fallback N=513, K=514, float32",
          "passed" : true
        }
      ],
      "measurements" : {
        "N1024.rows1.candidate_seconds" : 0.000178975,
        "N1024.rows1.paired_reduction" : 0.08253235934896841,
        "N1024.rows1.reference_seconds" : 0.000195075,
        "N1024.rows256.candidate_seconds" : 0.00018610835,
        "N1024.rows256.paired_reduction" : 0.23296439645033673,
        "N1024.rows256.reference_seconds" : 0.000233825,
        "N2048.rows1.candidate_seconds" : 0.00017431454999999998,
        "N2048.rows1.paired_reduction" : 0.015021127586607452,
        "N2048.rows1.reference_seconds" : 0.00017944790000000001,
        "N2048.rows256.candidate_seconds" : 0.00019066875,
        "N2048.rows256.paired_reduction" : 0.34127749841538124,
        "N2048.rows256.reference_seconds" : 0.00028870835,
        "N8192.rows1.candidate_seconds" : 0.00017669999999999999,
        "N8192.rows1.paired_reduction" : 0.1267515007568648,
        "N8192.rows1.reference_seconds" : 0.0002023479,
        "N8192.rows256.candidate_seconds" : 0.00026827915,
        "N8192.rows256.paired_reduction" : 0.7316235635417838,
        "N8192.rows256.reference_seconds" : 0.0009996375
      },
      "name" : "optimization-indexer-block-selection",
      "passed" : true
    },
    {
      "items" : [
        {
          "name" : "partial-block starts retain integer dtype",
          "passed" : true
        },
        {
          "name" : "floor-division oracle at every remainder",
          "passed" : true
        },
        {
          "name" : "batch 1, end 1, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 1, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 1, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 1, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 1, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 1, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 1, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 1, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 3, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 3, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 3, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 3, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 3, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 3, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 3, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 3, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 4, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 4, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 4, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 4, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 4, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 4, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 4, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 4, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 5, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 5, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 5, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 5, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 5, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 5, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 5, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 5, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 6, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 6, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 6, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 6, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 6, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 6, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 6, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 6, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 7, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 7, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 7, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 7, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 7, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 7, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 7, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 7, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 8, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 8, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 8, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 8, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 8, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 8, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 8, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 8, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 256, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 256, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 256, pattern 1: exact mask",
          "passed" : true
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
          "name" : "batch 1, end 256, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 256, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2048, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2048, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2048, pattern 1: exact mask",
          "passed" : true
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
          "name" : "batch 1, end 2048, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2048, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2049, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2049, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2049, pattern 1: exact mask",
          "passed" : true
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
          "name" : "batch 1, end 2049, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2049, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2050, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2050, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2050, pattern 1: exact mask",
          "passed" : true
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
          "name" : "batch 1, end 2050, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2050, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2051, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2051, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2051, pattern 1: exact mask",
          "passed" : true
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
          "name" : "batch 1, end 2051, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2051, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2052, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2052, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2052, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2052, pattern 1: exact causal cardinalities",
          "passed" : true
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
          "name" : "batch 1, end 2052, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2052, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2053, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2053, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2053, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2053, pattern 1: exact causal cardinalities",
          "passed" : true
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
          "name" : "batch 1, end 2053, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2053, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2060, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2060, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2060, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2060, pattern 1: exact causal cardinalities",
          "passed" : true
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
          "name" : "batch 1, end 2060, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 1, end 2060, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 1, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 1, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 1, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 1, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 1, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 1, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 1, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 1, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 3, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 3, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 3, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 3, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 3, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 3, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 3, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 3, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 4, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 4, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 4, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 4, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 4, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 4, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 4, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 4, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 5, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 5, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 5, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 5, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 5, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 5, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 5, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 5, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 6, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 6, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 6, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 6, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 6, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 6, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 6, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 6, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 7, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 7, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 7, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 7, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 7, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 7, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 7, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 7, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 8, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 8, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 8, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 8, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 8, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 8, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 8, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 8, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 256, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 256, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 256, pattern 1: exact mask",
          "passed" : true
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
          "name" : "batch 2, end 256, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 256, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2048, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2048, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2048, pattern 1: exact mask",
          "passed" : true
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
          "name" : "batch 2, end 2048, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2048, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2049, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2049, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2049, pattern 1: exact mask",
          "passed" : true
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
          "name" : "batch 2, end 2049, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2049, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2050, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2050, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2050, pattern 1: exact mask",
          "passed" : true
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
          "name" : "batch 2, end 2050, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2050, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2051, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2051, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2051, pattern 1: exact mask",
          "passed" : true
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
          "name" : "batch 2, end 2051, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2051, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2052, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2052, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2052, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2052, pattern 1: exact causal cardinalities",
          "passed" : true
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
          "name" : "batch 2, end 2052, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2052, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2053, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2053, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2053, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2053, pattern 1: exact causal cardinalities",
          "passed" : true
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
          "name" : "batch 2, end 2053, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2053, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2060, pattern 0: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2060, pattern 0: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2060, pattern 1: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2060, pattern 1: exact causal cardinalities",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2060, pattern 2: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2060, pattern 3: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2060, pattern 4: exact mask",
          "passed" : true
        },
        {
          "name" : "batch 2, end 2060, pattern 5: exact mask",
          "passed" : true
        },
        {
          "name" : "scalar score\/key-set oracle, dense false",
          "passed" : true
        },
        {
          "name" : "tiled scalar score\/key-set oracle, dense false",
          "passed" : true
        },
        {
          "name" : "scalar score\/key-set oracle, dense true",
          "passed" : true
        },
        {
          "name" : "tiled scalar score\/key-set oracle, dense true",
          "passed" : true
        }
      ],
      "measurements" : {

      },
      "name" : "optimization-indexer-visibility",
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
  "passed" : 27,
  "skipped" : 0
}

```

## .build/optimization/vision-attention-native-v25/manifest.json

SHA-256 `ba1cfb2737bb2c4d1438198c1e61a124d76f5ac6912a620d676d72c89b43a06b`; 13073 bytes.

```
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-vision-padding-v25/slotstream",
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
      "Sources/Slotstream/Generate.swift": "a9727ce9083dcdc39723ec1bd1c0faef4d8749e6c92ca315ecfe32b556256b67",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "03f029b78801b5215db21f5be2a8e515474726a594f36cda936d2018d853226f",
      "Sources/Slotstream/MTP.swift": "868f0d7d45171d29569f94390feaba02ae567504721e327667fe2bad4dcf73a2",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "5d2cb9e955a52b4b559744c111a6990f4edd4e8465fd27d2a8ec88cc61743cb4",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "bfd0989c009f6866c736ae17fa2f1e14db44fb493d542c14f3619e538ef1604b",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "65be7945e2dd57ec975810e6ba6e5a17cd0b9de4c3b4608b423f04df41352549",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "efe29406a51ab3c02aa6ecee6c566215f63ddc03e196ab0ac975b4d1c8209ae7",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "27aaf2f516d4dd836545837e209acd3aa8fc00f967fbc60eac1d8b2b1c672b00",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "4faccb1ab32f840ff3e03f08c15c33c35d365464063776e96d8dc914ef9ed22c",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "dafcf24e2a43f819719558f0a7613f42427553a779c11c2d959067a6ebe32459",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "c7b8f391c41635975c9c184fa8f78fd107f1e8c6d49678af608dd38d785b56a6",
    "binary_sha256": "866407ae0548668eb15c18b185d13e3f9656a2ea3394f988e6a7bb92f4467b9a",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 8.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-vision-padding-v25/slotstream",
    "optimization-state-check",
    "--variant",
    "vision-attention",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31686246400,
    "swapins": 41703977,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   571890.\nPages active:                                 956439.\nPages inactive:                               615079.\nPages speculative:                            351985.\nPages throttled:                                   0.\nPages wired down:                             203396.\nPages purgeable:                               12571.\n\"Translation faults\":                    13773424342.\nPages copy-on-write:                       626699124.\nPages zero filled:                       15310435990.\nPages reactivated:                        2265036670.\nPages purged:                               61633918.\nFile-backed pages:                           1349514.\nAnonymous pages:                              573989.\nPages stored in compressor:                  1342783.\nPages occupied by compressor:                 383809.\nDecompressions:                            962296869.\nCompressions:                             1256148906.\nPageins:                                  5820848156.\nPageouts:                                   10625472.\nSwapins:                                    41703977.\nSwapouts:                                   69922789.\nPages tagged:                                 178167.\nPages tagged resident:                        134123.\nPages tagged compressed:                       44044.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         2894.\nPages tag-storage non-tag pageable:            88516.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7155072.\nTagged compressions:                         9401374.\nTagged decompressions:                       8651762.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 60,
  "duration_seconds": 2.603685041,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31521816576,
    "swapins": 41703977,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   570677.\nPages active:                                 944617.\nPages inactive:                               612383.\nPages speculative:                            352253.\nPages throttled:                                   0.\nPages wired down:                             218760.\nPages purgeable:                                3060.\n\"Translation faults\":                    13773479471.\nPages copy-on-write:                       626706866.\nPages zero filled:                       15310460167.\nPages reactivated:                        2265036791.\nPages purged:                               61633918.\nFile-backed pages:                           1350202.\nAnonymous pages:                              559051.\nPages stored in compressor:                  1342767.\nPages occupied by compressor:                 383801.\nDecompressions:                            962296885.\nCompressions:                             1256148906.\nPageins:                                  5820848825.\nPageouts:                                   10625472.\nSwapins:                                    41703977.\nSwapouts:                                   69922789.\nPages tagged:                                 178319.\nPages tagged resident:                        134275.\nPages tagged compressed:                       44044.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         2969.\nPages tag-storage non-tag pageable:            88441.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7155072.\nTagged compressions:                         9401374.\nTagged decompressions:                       8651762.\n"
  }
}

```

## .build/optimization/vision-attention-native-v25/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/vision-attention-native-v25/stdout.txt

SHA-256 `071d874bcd7917ee8bb111b2d0eb2901c2fafc5fe18dc12b6f23c47bf7f89a32`; 15344 bytes.

```
{
  "items" : [
    {
      "name" : "N1.float32.pattern0.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N1.float32.pattern0.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N1.float32.pattern1.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N1.float32.pattern1.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N1.float32.pattern2.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N1.float32.pattern2.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N1.bfloat16.pattern0.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N1.bfloat16.pattern0.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N1.bfloat16.pattern1.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N1.bfloat16.pattern1.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N1.bfloat16.pattern2.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N1.bfloat16.pattern2.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N8.float32.pattern0.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N8.float32.pattern0.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N8.float32.pattern1.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N8.float32.pattern1.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N8.float32.pattern2.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N8.float32.pattern2.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N8.bfloat16.pattern0.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N8.bfloat16.pattern0.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N8.bfloat16.pattern1.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N8.bfloat16.pattern1.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N8.bfloat16.pattern2.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N8.bfloat16.pattern2.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N9.float32.pattern0.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N9.float32.pattern0.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N9.float32.pattern1.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N9.float32.pattern1.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N9.float32.pattern2.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N9.float32.pattern2.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N9.bfloat16.pattern0.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N9.bfloat16.pattern0.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N9.bfloat16.pattern1.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N9.bfloat16.pattern1.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N9.bfloat16.pattern2.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N9.bfloat16.pattern2.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N64.float32.pattern0.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N64.float32.pattern0.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N64.float32.pattern1.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N64.float32.pattern1.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N64.float32.pattern2.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N64.float32.pattern2.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N64.bfloat16.pattern0.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N64.bfloat16.pattern0.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N64.bfloat16.pattern1.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N64.bfloat16.pattern1.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N64.bfloat16.pattern2.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N64.bfloat16.pattern2.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N257.float32.pattern0.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N257.float32.pattern0.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N257.float32.pattern1.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N257.float32.pattern1.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N257.float32.pattern2.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N257.float32.pattern2.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N257.bfloat16.pattern0.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N257.bfloat16.pattern0.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N257.bfloat16.pattern1.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N257.bfloat16.pattern1.pad128: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N257.bfloat16.pattern2.pad80: independent Float64 oracle",
      "passed" : true
    },
    {
      "name" : "N257.bfloat16.pattern2.pad128: independent Float64 oracle",
      "passed" : true
    }
  ],
  "measurements" : {
    "N1.bfloat16.pattern0.pad128.candidate_max_error" : 0,
    "N1.bfloat16.pattern0.pad128.reference_max_error" : 0,
    "N1.bfloat16.pattern0.pad80.candidate_max_error" : 0,
    "N1.bfloat16.pattern0.pad80.reference_max_error" : 0,
    "N1.bfloat16.pattern1.pad128.candidate_max_error" : 0,
    "N1.bfloat16.pattern1.pad128.reference_max_error" : 0,
    "N1.bfloat16.pattern1.pad80.candidate_max_error" : 0,
    "N1.bfloat16.pattern1.pad80.reference_max_error" : 0,
    "N1.bfloat16.pattern2.pad128.candidate_max_error" : 0,
    "N1.bfloat16.pattern2.pad128.reference_max_error" : 0,
    "N1.bfloat16.pattern2.pad80.candidate_max_error" : 0,
    "N1.bfloat16.pattern2.pad80.reference_max_error" : 0,
    "N1.float32.pattern0.pad128.candidate_max_error" : 0,
    "N1.float32.pattern0.pad128.reference_max_error" : 0,
    "N1.float32.pattern0.pad80.candidate_max_error" : 0,
    "N1.float32.pattern0.pad80.reference_max_error" : 0,
    "N1.float32.pattern1.pad128.candidate_max_error" : 0,
    "N1.float32.pattern1.pad128.reference_max_error" : 0,
    "N1.float32.pattern1.pad80.candidate_max_error" : 0,
    "N1.float32.pattern1.pad80.reference_max_error" : 0,
    "N1.float32.pattern2.pad128.candidate_max_error" : 0,
    "N1.float32.pattern2.pad128.reference_max_error" : 0,
    "N1.float32.pattern2.pad80.candidate_max_error" : 0,
    "N1.float32.pattern2.pad80.reference_max_error" : 0,
    "N257.bfloat16.pattern0.pad128.candidate_max_error" : 0.000538285401837757,
    "N257.bfloat16.pattern0.pad128.reference_max_error" : 0.0018114159081796324,
    "N257.bfloat16.pattern0.pad80.candidate_max_error" : 0.0004874594102699803,
    "N257.bfloat16.pattern0.pad80.reference_max_error" : 0.0018114159081796324,
    "N257.bfloat16.pattern1.pad128.candidate_max_error" : 2.9211378283088354e-05,
    "N257.bfloat16.pattern1.pad128.reference_max_error" : 2.9211378283088354e-05,
    "N257.bfloat16.pattern1.pad80.candidate_max_error" : 2.9211378283088354e-05,
    "N257.bfloat16.pattern1.pad80.reference_max_error" : 2.9211378283088354e-05,
    "N257.bfloat16.pattern2.pad128.candidate_max_error" : 0.007789692562811368,
    "N257.bfloat16.pattern2.pad128.reference_max_error" : 2.6857565813341067,
    "N257.bfloat16.pattern2.pad80.candidate_max_error" : 0.007789692562811368,
    "N257.bfloat16.pattern2.pad80.reference_max_error" : 2.6857565813341067,
    "N257.float32.pattern0.pad128.candidate_max_error" : 0.00010778801288374718,
    "N257.float32.pattern0.pad128.reference_max_error" : 0.00023909109307282406,
    "N257.float32.pattern0.pad80.candidate_max_error" : 1.1854338682892873e-07,
    "N257.float32.pattern0.pad80.reference_max_error" : 0.00023909109307282406,
    "N257.float32.pattern1.pad128.candidate_max_error" : 4.4573027387084796e-10,
    "N257.float32.pattern1.pad128.reference_max_error" : 3.0892368420298855e-07,
    "N257.float32.pattern1.pad80.candidate_max_error" : 4.4573027387084796e-10,
    "N257.float32.pattern1.pad80.reference_max_error" : 3.0892368420298855e-07,
    "N257.float32.pattern2.pad128.candidate_max_error" : 0.0005860100193580686,
    "N257.float32.pattern2.pad128.reference_max_error" : 0.2511821600332157,
    "N257.float32.pattern2.pad80.candidate_max_error" : 0.0001352797162260666,
    "N257.float32.pattern2.pad80.reference_max_error" : 0.2511821600332157,
    "N64.bfloat16.pattern0.pad128.candidate_max_error" : 0.0010267481686909163,
    "N64.bfloat16.pattern0.pad128.reference_max_error" : 0.002610792950366758,
    "N64.bfloat16.pattern0.pad80.candidate_max_error" : 0.0009747228888511428,
    "N64.bfloat16.pattern0.pad80.reference_max_error" : 0.002610792950366758,
    "N64.bfloat16.pattern1.pad128.candidate_max_error" : 0.000244140625,
    "N64.bfloat16.pattern1.pad128.reference_max_error" : 0.000244140625,
    "N64.bfloat16.pattern1.pad80.candidate_max_error" : 0.000244140625,
    "N64.bfloat16.pattern1.pad80.reference_max_error" : 0.000244140625,
    "N64.bfloat16.pattern2.pad128.candidate_max_error" : 0.006639587043577588,
    "N64.bfloat16.pattern2.pad128.reference_max_error" : 1.7981864968523573,
    "N64.bfloat16.pattern2.pad80.candidate_max_error" : 0.006639587043577588,
    "N64.bfloat16.pattern2.pad80.reference_max_error" : 1.7981864968523573,
    "N64.float32.pattern0.pad128.candidate_max_error" : 0.0002290959595714348,
    "N64.float32.pattern0.pad128.reference_max_error" : 0.0004726405381236809,
    "N64.float32.pattern0.pad80.candidate_max_error" : 1.322241877099728e-07,
    "N64.float32.pattern0.pad80.reference_max_error" : 0.0004726405381236809,
    "N64.float32.pattern1.pad128.candidate_max_error" : 0,
    "N64.float32.pattern1.pad128.reference_max_error" : 0,
    "N64.float32.pattern1.pad80.candidate_max_error" : 0,
    "N64.float32.pattern1.pad80.reference_max_error" : 0,
    "N64.float32.pattern2.pad128.candidate_max_error" : 0.0003739941924431056,
    "N64.float32.pattern2.pad128.reference_max_error" : 0.1525549215722088,
    "N64.float32.pattern2.pad80.candidate_max_error" : 7.487927299765218e-05,
    "N64.float32.pattern2.pad80.reference_max_error" : 0.1525549215722088,
    "N8.bfloat16.pattern0.pad128.candidate_max_error" : 0.003436534384367418,
    "N8.bfloat16.pattern0.pad128.reference_max_error" : 0.0068027835380852775,
    "N8.bfloat16.pattern0.pad80.candidate_max_error" : 0.0068027835380852775,
    "N8.bfloat16.pattern0.pad80.reference_max_error" : 0.0068027835380852775,
    "N8.bfloat16.pattern1.pad128.candidate_max_error" : 0.001953125,
    "N8.bfloat16.pattern1.pad128.reference_max_error" : 0.001953125,
    "N8.bfloat16.pattern1.pad80.candidate_max_error" : 0.001953125,
    "N8.bfloat16.pattern1.pad80.reference_max_error" : 0.001953125,
    "N8.bfloat16.pattern2.pad128.candidate_max_error" : 1.5543122344752192e-15,
    "N8.bfloat16.pattern2.pad128.reference_max_error" : 1.5543122344752192e-15,
    "N8.bfloat16.pattern2.pad80.candidate_max_error" : 1.5543122344752192e-15,
    "N8.bfloat16.pattern2.pad80.reference_max_error" : 1.5543122344752192e-15,
    "N8.float32.pattern0.pad128.candidate_max_error" : 2.5610936960074326e-07,
    "N8.float32.pattern0.pad128.reference_max_error" : 0.0009692851125615576,
    "N8.float32.pattern0.pad80.candidate_max_error" : 0.0009692851125615576,
    "N8.float32.pattern0.pad80.reference_max_error" : 0.0009692851125615576,
    "N8.float32.pattern1.pad128.candidate_max_error" : 0,
    "N8.float32.pattern1.pad128.reference_max_error" : 0,
    "N8.float32.pattern1.pad80.candidate_max_error" : 0,
    "N8.float32.pattern1.pad80.reference_max_error" : 0,
    "N8.float32.pattern2.pad128.candidate_max_error" : 1.5543122344752192e-15,
    "N8.float32.pattern2.pad128.reference_max_error" : 1.5543122344752192e-15,
    "N8.float32.pattern2.pad80.candidate_max_error" : 1.5543122344752192e-15,
    "N8.float32.pattern2.pad80.reference_max_error" : 1.5543122344752192e-15,
    "N9.bfloat16.pattern0.pad128.candidate_max_error" : 0.0037608110287787877,
    "N9.bfloat16.pattern0.pad128.reference_max_error" : 0.00496113798519493,
    "N9.bfloat16.pattern0.pad80.candidate_max_error" : 0.0037608110287787877,
    "N9.bfloat16.pattern0.pad80.reference_max_error" : 0.00496113798519493,
    "N9.bfloat16.pattern1.pad128.candidate_max_error" : 0.0008680555555555802,
    "N9.bfloat16.pattern1.pad128.reference_max_error" : 0.001519097222222321,
    "N9.bfloat16.pattern1.pad80.candidate_max_error" : 0.0008680555555555802,
    "N9.bfloat16.pattern1.pad80.reference_max_error" : 0.001519097222222321,
    "N9.bfloat16.pattern2.pad128.candidate_max_error" : 1.2714274078007293e-12,
    "N9.bfloat16.pattern2.pad128.reference_max_error" : 1.2714274078007293e-12,
    "N9.bfloat16.pattern2.pad80.candidate_max_error" : 1.2714274078007293e-12,
    "N9.bfloat16.pattern2.pad80.reference_max_error" : 1.2714274078007293e-12,
    "N9.float32.pattern0.pad128.candidate_max_error" : 0.00038922965377508056,
    "N9.float32.pattern0.pad128.reference_max_error" : 0.0008949004986882336,
    "N9.float32.pattern0.pad80.candidate_max_error" : 1.5681310983062247e-07,
    "N9.float32.pattern0.pad80.reference_max_error" : 0.0008949004986882336,
    "N9.float32.pattern1.pad128.candidate_max_error" : 1.6556845838788803e-08,
    "N9.float32.pattern1.pad128.reference_max_error" : 0.0001127454969617192,
    "N9.float32.pattern1.pad80.candidate_max_error" : 1.3245476715439963e-08,
    "N9.float32.pattern1.pad80.reference_max_error" : 0.0001127454969617192,
    "N9.float32.pattern2.pad128.candidate_max_error" : 1.2714274078007293e-12,
    "N9.float32.pattern2.pad128.reference_max_error" : 1.2714274078007293e-12,
    "N9.float32.pattern2.pad80.candidate_max_error" : 1.2714274078007293e-12,
    "N9.float32.pattern2.pad80.reference_max_error" : 1.2714274078007293e-12
  },
  "name" : "optimization-vision-attention",
  "passed" : true
}

```

## .build/optimization/image-reuse-identity-v25/manifest.json

SHA-256 `bbead88c9d7f97e22db2b7358ed4ba55e15b964360e7a8df4a6b947d6083db14`; 13075 bytes.

```
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-vision-padding-v25/slotstream",
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
      "Sources/Slotstream/Generate.swift": "a9727ce9083dcdc39723ec1bd1c0faef4d8749e6c92ca315ecfe32b556256b67",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "03f029b78801b5215db21f5be2a8e515474726a594f36cda936d2018d853226f",
      "Sources/Slotstream/MTP.swift": "868f0d7d45171d29569f94390feaba02ae567504721e327667fe2bad4dcf73a2",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "5d2cb9e955a52b4b559744c111a6990f4edd4e8465fd27d2a8ec88cc61743cb4",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "bfd0989c009f6866c736ae17fa2f1e14db44fb493d542c14f3619e538ef1604b",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "65be7945e2dd57ec975810e6ba6e5a17cd0b9de4c3b4608b423f04df41352549",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "efe29406a51ab3c02aa6ecee6c566215f63ddc03e196ab0ac975b4d1c8209ae7",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "27aaf2f516d4dd836545837e209acd3aa8fc00f967fbc60eac1d8b2b1c672b00",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "4faccb1ab32f840ff3e03f08c15c33c35d365464063776e96d8dc914ef9ed22c",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "dafcf24e2a43f819719558f0a7613f42427553a779c11c2d959067a6ebe32459",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "c7b8f391c41635975c9c184fa8f78fd107f1e8c6d49678af608dd38d785b56a6",
    "binary_sha256": "866407ae0548668eb15c18b185d13e3f9656a2ea3394f988e6a7bb92f4467b9a",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 8.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-vision-padding-v25/slotstream",
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
    "reclaimable_bytes": 31739215872,
    "swapins": 41703981,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   580890.\nPages active:                                 950346.\nPages inactive:                               597196.\nPages speculative:                            352375.\nPages throttled:                                   0.\nPages wired down:                             218604.\nPages purgeable:                                5916.\n\"Translation faults\":                    13773564865.\nPages copy-on-write:                       626720252.\nPages zero filled:                       15310522445.\nPages reactivated:                        2265036980.\nPages purged:                               61634174.\nFile-backed pages:                           1350402.\nAnonymous pages:                              549515.\nPages stored in compressor:                  1341708.\nPages occupied by compressor:                 383162.\nDecompressions:                            962297853.\nCompressions:                             1256148906.\nPageins:                                  5820849006.\nPageouts:                                   10625472.\nSwapins:                                    41703981.\nSwapouts:                                   69922789.\nPages tagged:                                 178317.\nPages tagged resident:                        134273.\nPages tagged compressed:                       44044.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         2962.\nPages tag-storage non-tag pageable:            88448.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7155072.\nTagged compressions:                         9401374.\nTagged decompressions:                       8651762.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 68,
  "duration_seconds": 1.1285891659999998,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31738003456,
    "swapins": 41703981,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   526407.\nPages active:                                 949921.\nPages inactive:                               650148.\nPages speculative:                            354258.\nPages throttled:                                   0.\nPages wired down:                             218613.\nPages purgeable:                                5404.\n\"Translation faults\":                    13773630714.\nPages copy-on-write:                       626720910.\nPages zero filled:                       15310595802.\nPages reactivated:                        2265036980.\nPages purged:                               61634174.\nFile-backed pages:                           1405323.\nAnonymous pages:                              549004.\nPages stored in compressor:                  1341705.\nPages occupied by compressor:                 383161.\nDecompressions:                            962297856.\nCompressions:                             1256148906.\nPageins:                                  5820902034.\nPageouts:                                   10625472.\nSwapins:                                    41703981.\nSwapouts:                                   69922789.\nPages tagged:                                 178213.\nPages tagged resident:                        134169.\nPages tagged compressed:                       44044.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         2957.\nPages tag-storage non-tag pageable:            88453.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7155072.\nTagged compressions:                         9401374.\nTagged decompressions:                       8651762.\n"
  }
}

```

## .build/optimization/image-reuse-identity-v25/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/image-reuse-identity-v25/stdout.txt

SHA-256 `8f3666abe3e0003f984b41e48eb29de4d7ac5808b8bf94a9f6b8f4a77f93b07b`; 5719 bytes.

```
{
  "items" : [
    {
      "name" : "fixture encoded-byte identities differ",
      "passed" : true
    },
    {
      "name" : "unchanged preparation permits prefix reuse",
      "passed" : true
    },
    {
      "name" : "changed attention arithmetic invalidates prefix",
      "passed" : true
    },
    {
      "name" : "partial image retains processor identity",
      "passed" : true
    },
    {
      "name" : "partial image rejects changed attention arithmetic",
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

## .build/optimization/vision-padding-128-parity-v25/manifest.json

SHA-256 `0d9d54c2980ea5f98da2dea4fbbea1bbcfe36e5f44bc946e9eef1d5dd0a8b4f1`; 13138 bytes.

```
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-vision-padding-v25/slotstream",
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
      "Sources/Slotstream/Generate.swift": "a9727ce9083dcdc39723ec1bd1c0faef4d8749e6c92ca315ecfe32b556256b67",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "03f029b78801b5215db21f5be2a8e515474726a594f36cda936d2018d853226f",
      "Sources/Slotstream/MTP.swift": "868f0d7d45171d29569f94390feaba02ae567504721e327667fe2bad4dcf73a2",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "5d2cb9e955a52b4b559744c111a6990f4edd4e8465fd27d2a8ec88cc61743cb4",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "bfd0989c009f6866c736ae17fa2f1e14db44fb493d542c14f3619e538ef1604b",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "65be7945e2dd57ec975810e6ba6e5a17cd0b9de4c3b4608b423f04df41352549",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "efe29406a51ab3c02aa6ecee6c566215f63ddc03e196ab0ac975b4d1c8209ae7",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "27aaf2f516d4dd836545837e209acd3aa8fc00f967fbc60eac1d8b2b1c672b00",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "4faccb1ab32f840ff3e03f08c15c33c35d365464063776e96d8dc914ef9ed22c",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "dafcf24e2a43f819719558f0a7613f42427553a779c11c2d959067a6ebe32459",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "c7b8f391c41635975c9c184fa8f78fd107f1e8c6d49678af608dd38d785b56a6",
    "binary_sha256": "866407ae0548668eb15c18b185d13e3f9656a2ea3394f988e6a7bb92f4467b9a",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 9.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-vision-padding-v25/slotstream",
    "vision-parity",
    "--image",
    "Tools/assets/vision_test/secret1.jpg",
    "--out",
    ".build/optimization/vision-padding-128-embeddings-v25"
  ],
  "environment": {
    "SLOTSTREAM_OPT_VISION_PADDING": "128"
  },
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31730499584,
    "swapins": 41703981,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   516387.\nPages active:                                 974934.\nPages inactive:                               650738.\nPages speculative:                            354255.\nPages throttled:                                   0.\nPages wired down:                             203351.\nPages purgeable:                               14915.\n\"Translation faults\":                    13773728215.\nPages copy-on-write:                       626729360.\nPages zero filled:                       15310676892.\nPages reactivated:                        2265037129.\nPages purged:                               61634430.\nFile-backed pages:                           1405374.\nAnonymous pages:                              574553.\nPages stored in compressor:                  1341358.\nPages occupied by compressor:                 382917.\nDecompressions:                            962298203.\nCompressions:                             1256148906.\nPageins:                                  5820902133.\nPageouts:                                   10625472.\nSwapins:                                    41703981.\nSwapouts:                                   69922789.\nPages tagged:                                 178217.\nPages tagged resident:                        134173.\nPages tagged compressed:                       44044.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         2953.\nPages tag-storage non-tag pageable:            88457.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7155072.\nTagged compressions:                         9401374.\nTagged decompressions:                       8651762.\n"
  },
  "exit_code": 0,
  "duration_seconds": 0.4347605,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31575261184,
    "swapins": 41703981,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   515662.\nPages active:                                 960995.\nPages inactive:                               651681.\nPages speculative:                            353984.\nPages throttled:                                   0.\nPages wired down:                             217347.\nPages purgeable:                                4636.\n\"Translation faults\":                    13773793235.\nPages copy-on-write:                       626729748.\nPages zero filled:                       15310760966.\nPages reactivated:                        2265037129.\nPages purged:                               61634430.\nFile-backed pages:                           1406903.\nAnonymous pages:                              559757.\nPages stored in compressor:                  1341356.\nPages occupied by compressor:                 382916.\nDecompressions:                            962298205.\nCompressions:                             1256148906.\nPageins:                                  5820902191.\nPageouts:                                   10625472.\nSwapins:                                    41703981.\nSwapouts:                                   69922789.\nPages tagged:                                 178197.\nPages tagged resident:                        134153.\nPages tagged compressed:                       44044.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         2957.\nPages tag-storage non-tag pageable:            88453.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7155072.\nTagged compressions:                         9401374.\nTagged decompressions:                       8651762.\n"
  }
}

```

## .build/optimization/vision-padding-128-parity-v25/stderr.txt

SHA-256 `e437da7e8d3b5c8da999936acb72e78224b70988cb55118cc02cd7103adcfc8f`; 45 bytes.

```
loading the vision tower (0.898 GB resident)

```

## .build/optimization/vision-padding-128-parity-v25/stdout.txt

SHA-256 `6082ad752d426e9186302f0ffa4ee5b78a2e57eff2f7dbc5e85256a46b146877`; 112 bytes.

```
wrote 2808 patches -> 702 tokens (832x864, grid 52x54) to .build/optimization/vision-padding-128-embeddings-v25

```

## .build/optimization/vision-padding-128-oracle-v25/manifest.json

SHA-256 `5bae2ab162ae13bab4e0520e56c1c663404caaceb8011c285cd3e159830cda63`; 4445 bytes.

```
{
  "command": [
    ".venv31/bin/python",
    ".build/optimization/vision-padding-128-oracle-v25/vision_ref.py",
    ".build/optimization/vision-padding-128-embeddings-v25"
  ],
  "classification": "full tower correctness only; no timing evidence",
  "source_sha256": "fa62575c947392f990841e6ac90656737eb67edb000ab369d7b7a0f66a05ef29",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31761301504,
    "swapins": 41703981,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   519671.\nPages active:                                 970426.\nPages inactive:                               650492.\nPages speculative:                            355085.\nPages throttled:                                   0.\nPages wired down:                             203603.\nPages purgeable:                               10819.\n\"Translation faults\":                    13773896060.\nPages copy-on-write:                       626745786.\nPages zero filled:                       15310803169.\nPages reactivated:                        2265037311.\nPages purged:                               61634944.\nFile-backed pages:                           1408066.\nAnonymous pages:                              567937.\nPages stored in compressor:                  1341294.\nPages occupied by compressor:                 382886.\nDecompressions:                            962298267.\nCompressions:                             1256148906.\nPageins:                                  5820903460.\nPageouts:                                   10625472.\nSwapins:                                    41703981.\nSwapouts:                                   69922789.\nPages tagged:                                 179613.\nPages tagged resident:                        135569.\nPages tagged compressed:                       44044.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         2932.\nPages tag-storage non-tag pageable:            88478.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7155072.\nTagged compressions:                         9401374.\nTagged decompressions:                       8651762.\n"
  },
  "exit_code": 0,
  "duration_seconds": 10.798263041999999,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31589269504,
    "swapins": 41703981,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   516787.\nPages active:                                 957639.\nPages inactive:                               652975.\nPages speculative:                            353353.\nPages throttled:                                   0.\nPages wired down:                             218987.\nPages purgeable:                                3100.\n\"Translation faults\":                    13774157376.\nPages copy-on-write:                       626746521.\nPages zero filled:                       15311151059.\nPages reactivated:                        2265037320.\nPages purged:                               61634944.\nFile-backed pages:                           1408169.\nAnonymous pages:                              555798.\nPages stored in compressor:                  1341262.\nPages occupied by compressor:                 382877.\nDecompressions:                            962298299.\nCompressions:                             1256148906.\nPageins:                                  5820903531.\nPageouts:                                   10625472.\nSwapins:                                    41703981.\nSwapouts:                                   69922789.\nPages tagged:                                 179606.\nPages tagged resident:                        135563.\nPages tagged compressed:                       44043.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         2949.\nPages tag-storage non-tag pageable:            88461.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7154816.\nTagged compressions:                         9401374.\nTagged decompressions:                       8651763.\n"
  }
}

```

## .build/optimization/vision-padding-128-oracle-v25/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/vision-padding-128-oracle-v25/stdout.txt

SHA-256 `99b33c2bd56e40082006266f9e596fda822b6da329b2037d973f653c17f57385`; 707 bytes.

```
loading the vision tower from /Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit
  333 tensors
reference forward over 2808 patches (grid 52x54) ...
  tokens          702 x 2560
  mean |ref|      0.031092
  swift        vs numpy f32:  cosine 0.99847068  worst token 0.860668
  swift        vs mlx  f32:  cosine 0.99848032  worst token 0.884195
  swift        vs mlx  bf16:  cosine 0.99875814  worst token 0.926120
  mlx bf16     vs numpy f32:  cosine 0.99840382  worst token 0.839186
  mlx f32      vs numpy f32:  cosine 0.99996241  worst token 0.997329
  float32 implementations agree      True
  slotstream inside the dtype band   True
  slotstream matches bf16 reference  True
VISION PARITY PASS

```

## .build/optimization/vision-padding-128-oracle-v25/vision_ref.py

SHA-256 `fa62575c947392f990841e6ac90656737eb67edb000ab369d7b7a0f66a05ef29`; 13707 bytes.

```
#!/usr/bin/env python3
"""Independent reference for the vision tower, and the comparison against Swift.

The tower fails silently. A transposed weight, a rotary embedding laid out in
the wrong half, a merger norm applied after the 2x2 shuffle instead of before —
every one of those still produces embeddings of the right shape, and the model
still writes fluent sentences, about a picture it did not see. Nothing
downstream can tell. So this is written from the Qwen3-VL reference
(`transformers/models/qwen3_vl/modeling_qwen3_vl.py`, `Qwen3VLVisionModel`)
rather than from `Vision.swift`, in mlx, and the two are compared.

    .build/release/slotstream vision-parity --out .build/vision-parity
    .venv31/bin/python Tools/vision_ref.py .build/vision-parity

Uses the same mlx 0.31.1 the parity goldens use (Tools/parity_ref.py, and see
CLAUDE.md: 0.31.x and 0.32.x kernels differ measurably). It loads the 333
`vision_tower.*` tensors only — about 0.9 GB — never the 105 GB trunk.
"""
import json
import math
import os
import sys

import mlx.core as mx
import numpy as np


def load_tower(model_dir):
    """The vision tensors, from whichever shard holds them."""
    index = json.load(open(os.path.join(model_dir, "model.safetensors.index.json")))
    want = {k: f for k, f in index["weight_map"].items() if k.startswith("vision_tower.")}
    out = {}
    for shard in sorted(set(want.values())):
        arrays = mx.load(os.path.join(model_dir, shard))
        for k in want:
            if want[k] == shard:
                out[k] = arrays[k]
    return out


def config(model_dir):
    v = json.load(open(os.path.join(model_dir, "config.json")))["vision_config"]
    return {
        "hidden": v["hidden_size"], "depth": v["depth"], "heads": v["num_heads"],
        "patch": v["patch_size"], "merge": v["spatial_merge_size"],
        "tps": v["temporal_patch_size"], "out": v["out_hidden_size"],
        "npos": v["num_position_embeddings"],
    }


def merge_order(gh, gw, merge):
    """Patch indices in the order the processor emits them.

    Both the reference and slotstream reorder patches into 2x2 merge blocks
    before the tower runs, because the merger consumes four consecutive rows as
    one token. Every position-dependent quantity below — the interpolated
    position embedding, the rotary angles — is built in this order, so getting
    it wrong shifts the whole picture by one block and produces a plausible
    embedding of a scrambled image.
    """
    order = []
    for bh in range(gh // merge):
        for bw in range(gw // merge):
            for ir in range(merge):
                for ic in range(merge):
                    order.append((bh * merge + ir, bw * merge + ic))
    return order


def pos_embed(weights, cfg, gh, gw):
    """`fast_pos_embed_interpolate`: bilinear resample of the 48x48 grid."""
    g = int(round(math.sqrt(cfg["npos"])))
    table = np.array(weights["vision_tower.pos_embed.weight"].astype(mx.float32))

    def axis(n):
        # linspace(0, g-1, n), then floor/ceil with the ceil clipped.
        v = np.zeros(n) if n == 1 else np.linspace(0, g - 1, n)
        f = v.astype(int)
        return f, np.minimum(f + 1, g - 1), v - f

    hf, hc, dh = axis(gh)
    wf, wc, dw = axis(gw)
    rows = []
    for r, c in merge_order(gh, gw, cfg["merge"]):
        a = table[hf[r] * g + wf[c]] * ((1 - dh[r]) * (1 - dw[c]))
        b = table[hf[r] * g + wc[c]] * ((1 - dh[r]) * dw[c])
        d = table[hc[r] * g + wf[c]] * (dh[r] * (1 - dw[c]))
        e = table[hc[r] * g + wc[c]] * (dh[r] * dw[c])
        rows.append(a + b + d + e)
    return np.stack(rows).astype(np.float32)


def rope(cfg, gh, gw):
    """2-D rotary angles, h-frequencies then w-frequencies, doubled."""
    head_dim = cfg["hidden"] // cfg["heads"]
    dim = head_dim // 2
    inv = 1.0 / (10000.0 ** (np.arange(0, dim, 2) / dim))
    rows = []
    for r, c in merge_order(gh, gw, cfg["merge"]):
        half = np.concatenate([r * inv, c * inv])
        rows.append(np.concatenate([half, half]))
    ang = np.stack(rows)
    return np.cos(ang).astype(np.float32), np.sin(ang).astype(np.float32)


def layer_norm(x, w, b, eps=1e-6):
    m = x.mean(-1, keepdims=True)
    v = x.var(-1, keepdims=True)
    return (x - m) / np.sqrt(v + eps) * w + b


def gelu_tanh(x):
    return 0.5 * x * (1 + np.tanh(0.7978845608 * (x + 0.044715 * x ** 3)))




def gelu_exact_np(x):
    # math.erf elementwise; scipy is not a dependency of this repo.
    return 0.5 * x * (1 + np.vectorize(math.erf)(x / math.sqrt(2)))


def forward(weights, cfg, pixels, gh, gw):
    """The reference tower, in float32 numpy. Slow and obvious on purpose."""
    def w(name):
        return np.array(weights["vision_tower." + name].astype(mx.float32))

    n = gh * gw
    heads, hidden = cfg["heads"], cfg["hidden"]
    head_dim = hidden // heads

    # patch embed: [out, C, t, h, w] flattened to [out, C*t*h*w]
    pw = w("patch_embed.proj.weight").reshape(hidden, -1)
    x = pixels @ pw.T + w("patch_embed.proj.bias")
    x = x + pos_embed(weights, cfg, gh, gw)

    cos, sin = rope(cfg, gh, gw)

    def rotate_half(v):
        half = v.shape[-1] // 2
        return np.concatenate([-v[..., half:], v[..., :half]], axis=-1)

    for i in range(cfg["depth"]):
        p = f"blocks.{i}."
        h = layer_norm(x, w(p + "norm1.weight"), w(p + "norm1.bias"))
        qkv = h @ w(p + "attn.qkv.weight").T + w(p + "attn.qkv.bias")
        qkv = qkv.reshape(n, 3, heads, head_dim)
        q, k, v = qkv[:, 0], qkv[:, 1], qkv[:, 2]
        c = cos[:, None, :]
        s = sin[:, None, :]
        q = q * c + rotate_half(q) * s
        k = k * c + rotate_half(k) * s
        q = q.transpose(1, 0, 2)
        k = k.transpose(1, 0, 2)
        v = v.transpose(1, 0, 2)
        scores = q @ k.transpose(0, 2, 1) / math.sqrt(head_dim)
        scores = scores - scores.max(-1, keepdims=True)
        p_attn = np.exp(scores)
        p_attn = p_attn / p_attn.sum(-1, keepdims=True)
        ctx = (p_attn @ v).transpose(1, 0, 2).reshape(n, hidden)
        x = x + ctx @ w(p + "attn.proj.weight").T + w(p + "attn.proj.bias")

        h = layer_norm(x, w(p + "norm2.weight"), w(p + "norm2.bias"))
        h = gelu_tanh(h @ w(p + "mlp.linear_fc1.weight").T + w(p + "mlp.linear_fc1.bias"))
        x = x + h @ w(p + "mlp.linear_fc2.weight").T + w(p + "mlp.linear_fc2.bias")

    # merger: norm BEFORE the shuffle (the checkpoint's norm is [hidden], not
    # [hidden*merge^2], which is what says so).
    x = layer_norm(x, w("merger.norm.weight"), w("merger.norm.bias"))
    m2 = cfg["merge"] ** 2
    x = x.reshape(n // m2, hidden * m2)
    x = x @ w("merger.linear_fc1.weight").T + w("merger.linear_fc1.bias")
    x = gelu_exact_np(x)
    return x @ w("merger.linear_fc2.weight").T + w("merger.linear_fc2.bias")


def cosine(a, b):
    return float((a * b).sum() / (np.linalg.norm(a) * np.linalg.norm(b) + 1e-12))


def per_token_cosine(a, b):
    return (a * b).sum(1) / (
        np.linalg.norm(a, axis=1) * np.linalg.norm(b, axis=1) + 1e-12)


def main():
    if len(sys.argv) < 2:
        print(__doc__, file=sys.stderr)
        return 2
    d = sys.argv[1]
    man = json.load(open(os.path.join(d, "manifest.json")))
    cfg = config(man["model_dir"])
    for key, got in [("depth", cfg["depth"]), ("num_heads", cfg["heads"]),
                     ("hidden_size", cfg["hidden"]), ("out_hidden_size", cfg["out"])]:
        if man[key] != got:
            print(f"FAIL  manifest {key}={man[key]} but config.json says {got}")
            return 1

    pixels = np.fromfile(os.path.join(d, "pixels.bin"), dtype=np.float32)
    pixels = pixels.reshape(man["patches"], man["features_per_patch"])
    swift = np.fromfile(os.path.join(d, "embed.bin"), dtype=np.float32)
    swift = swift.reshape(man["merged_tokens"], man["out_hidden_size"])

    print(f"loading the vision tower from {man['model_dir']}")
    weights = load_tower(man["model_dir"])
    print(f"  {len(weights)} tensors")
    print(f"reference forward over {man['patches']} patches "
          f"(grid {man['grid_w']}x{man['grid_h']}) ...")
    # Three implementations, two of them independent of MLX kernels:
    #   numpy  float32 — written from the transformers reference, no mlx ops
    #   mlx    float32 — same math, mlx kernels, fused attention
    #   mlx  bfloat16  — same math at the dtype slotstream runs
    ref = forward(weights, cfg, pixels.astype(np.float32), man["grid_h"], man["grid_w"])
    mlx32 = forward_mlx(weights, cfg, pixels, man["grid_h"], man["grid_w"], mx.float32)
    mlx16 = forward_mlx(weights, cfg, pixels, man["grid_h"], man["grid_w"], mx.bfloat16)

    if ref.shape != swift.shape:
        print(f"FAIL  shape {swift.shape} vs reference {ref.shape}")
        return 1

    # WHAT THIS GATE IS, AND WHY IT IS NOT AN EQUALITY.
    #
    # The tower runs in bfloat16: 8 mantissa bits, 27 residual blocks deep. The
    # same reference at float32 and at bfloat16 disagrees with itself by more
    # than slotstream disagrees with either (measured: 0.99841 between the two
    # dtypes, 0.99870 Swift-to-float32, 0.99878 Swift-to-bfloat16), and the
    # tokens they disagree on most are the low-norm ones, where a tiny absolute
    # error is a large angle. So an absolute tolerance would either be so loose
    # it proves nothing or so tight nothing can pass — the same trap
    # `prefix-check` documents for reuse-versus-rebuild.
    #
    # The property that IS decidable: slotstream must sit inside the band the
    # dtype itself spans. A transposed weight, a rotary half swapped, a merger
    # norm on the wrong side of the shuffle — none of those land inside it.
    band = cosine(mlx16, ref)
    rows = [
        ("swift        vs numpy f32", cosine(swift, ref), per_token_cosine(swift, ref).min()),
        ("swift        vs mlx  f32", cosine(swift, mlx32), per_token_cosine(swift, mlx32).min()),
        ("swift        vs mlx  bf16", cosine(swift, mlx16), per_token_cosine(swift, mlx16).min()),
        ("mlx bf16     vs numpy f32", band, per_token_cosine(mlx16, ref).min()),
        ("mlx f32      vs numpy f32", cosine(mlx32, ref), per_token_cosine(mlx32, ref).min()),
    ]
    print(f"  tokens          {ref.shape[0]} x {ref.shape[1]}")
    print(f"  mean |ref|      {np.abs(ref).mean():.6f}")
    for name, c, worst in rows:
        print(f"  {name}:  cosine {c:.8f}  worst token {worst:.6f}")

    # The two float32 implementations share no kernels, so they must agree
    # tightly; that is what makes the band above trustworthy.
    kernels_agree = cosine(mlx32, ref) > 0.9999
    inside_band = cosine(swift, ref) >= band - 1e-4
    close_at_dtype = cosine(swift, mlx16) > 0.998
    print(f"  float32 implementations agree      {kernels_agree}")
    print(f"  slotstream inside the dtype band   {inside_band}")
    print(f"  slotstream matches bf16 reference  {close_at_dtype}")

    ok = kernels_agree and inside_band and close_at_dtype
    print("VISION PARITY PASS" if ok else "VISION PARITY FAIL")
    return 0 if ok else 1


# --- dtype diagnostic -------------------------------------------------------
# Kept next to the reference because "the two differ" is not a finding on its
# own: bf16 carries 8 mantissa bits and the tower is 27 residual blocks deep,
# so some drift is arithmetic, not logic. Running the SAME reference in
# bfloat16 separates the two — if the bf16 reference lands on Swift, the
# implementations agree and only the precision differs.
def forward_mlx(weights, cfg, pixels, gh, gw, dtype):
    def w(name):
        return weights["vision_tower." + name].astype(dtype)

    n = gh * gw
    heads, hidden = cfg["heads"], cfg["hidden"]
    head_dim = hidden // heads
    x = mx.array(pixels).astype(dtype) @ w("patch_embed.proj.weight").reshape(hidden, -1).T
    x = x + w("patch_embed.proj.bias")
    x = x + mx.array(pos_embed(weights, cfg, gh, gw)).astype(dtype)
    cos_np, sin_np = rope(cfg, gh, gw)
    cos = mx.array(cos_np).astype(dtype)[:, None, :]
    sin = mx.array(sin_np).astype(dtype)[:, None, :]

    def rot(v):
        half = v.shape[-1] // 2
        return mx.concatenate([-v[..., half:], v[..., :half]], axis=-1)

    for i in range(cfg["depth"]):
        p = f"blocks.{i}."
        h = mx.fast.layer_norm(x, w(p + "norm1.weight"), w(p + "norm1.bias"), 1e-6)
        qkv = (h @ w(p + "attn.qkv.weight").T + w(p + "attn.qkv.bias")).reshape(
            n, 3, heads, head_dim)
        q, k, v = qkv[:, 0], qkv[:, 1], qkv[:, 2]
        q = (q * cos + rot(q) * sin).transpose(1, 0, 2)[None]
        k = (k * cos + rot(k) * sin).transpose(1, 0, 2)[None]
        v = v.transpose(1, 0, 2)[None]
        o = mx.fast.scaled_dot_product_attention(q, k, v, scale=1 / math.sqrt(head_dim))
        ctx = o.reshape(heads, n, head_dim).transpose(1, 0, 2).reshape(n, hidden)
        x = x + ctx @ w(p + "attn.proj.weight").T + w(p + "attn.proj.bias")
        h = mx.fast.layer_norm(x, w(p + "norm2.weight"), w(p + "norm2.bias"), 1e-6)
        h = h @ w(p + "mlp.linear_fc1.weight").T + w(p + "mlp.linear_fc1.bias")
        h = 0.5 * h * (1 + mx.tanh(0.79788456 * (h + 0.044715 * h * h * h)))
        x = x + h @ w(p + "mlp.linear_fc2.weight").T + w(p + "mlp.linear_fc2.bias")
        mx.eval(x)
    x = mx.fast.layer_norm(x, w("merger.norm.weight"), w("merger.norm.bias"), 1e-6)
    m2 = cfg["merge"] ** 2
    x = x.reshape(n // m2, hidden * m2)
    x = x @ w("merger.linear_fc1.weight").T + w("merger.linear_fc1.bias")
    x = 0.5 * x * (1 + mx.erf(x / math.sqrt(2)))
    out = x @ w("merger.linear_fc2.weight").T + w("merger.linear_fc2.bias")
    mx.eval(out)
    return np.array(out.astype(mx.float32))


if __name__ == "__main__":
    sys.exit(main())

```

## .build/optimization/vision-serving-padding-reuse-v25/manifest.json

SHA-256 `3c65dc78400bcc75e77a08733a41b33edbfdefb6dc2e7d8bb49eab62ec7b66be`; 17781 bytes.

```
{
  "classification": "bounded real image-serving correctness; not paired performance evidence",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31492734976,
    "swapins": 41704012,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   500646.\nPages active:                                 978072.\nPages inactive:                               651486.\nPages speculative:                            353764.\nPages throttled:                                   0.\nPages wired down:                             217088.\nPages purgeable:                               12894.\n\"Translation faults\":                    13775009838.\nPages copy-on-write:                       626817119.\nPages zero filled:                       15311930307.\nPages reactivated:                        2265039294.\nPages purged:                               61638756.\nFile-backed pages:                           1408624.\nAnonymous pages:                              574698.\nPages stored in compressor:                  1337247.\nPages occupied by compressor:                 381238.\nDecompressions:                            962301171.\nCompressions:                             1256148906.\nPageins:                                  5820904470.\nPageouts:                                   10625472.\nSwapins:                                    41704012.\nSwapouts:                                   69922789.\nPages tagged:                                 178345.\nPages tagged resident:                        134419.\nPages tagged compressed:                       43926.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6886.\nPages tag-storage free:                         3153.\nPages tag-storage non-tag pageable:            88257.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7133120.\nTagged compressions:                         9401374.\nTagged decompressions:                       8651880.\n"
  },
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-vision-padding-v25/slotstream",
    "serve",
    "--port",
    "63949",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--memory-gb",
    "10",
    "--mtp",
    "off",
    "--no-elastic"
  ],
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
      "Sources/Slotstream/Generate.swift": "a9727ce9083dcdc39723ec1bd1c0faef4d8749e6c92ca315ecfe32b556256b67",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "03f029b78801b5215db21f5be2a8e515474726a594f36cda936d2018d853226f",
      "Sources/Slotstream/MTP.swift": "868f0d7d45171d29569f94390feaba02ae567504721e327667fe2bad4dcf73a2",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "5d2cb9e955a52b4b559744c111a6990f4edd4e8465fd27d2a8ec88cc61743cb4",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "bfd0989c009f6866c736ae17fa2f1e14db44fb493d542c14f3619e538ef1604b",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "65be7945e2dd57ec975810e6ba6e5a17cd0b9de4c3b4608b423f04df41352549",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "efe29406a51ab3c02aa6ecee6c566215f63ddc03e196ab0ac975b4d1c8209ae7",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "27aaf2f516d4dd836545837e209acd3aa8fc00f967fbc60eac1d8b2b1c672b00",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "4faccb1ab32f840ff3e03f08c15c33c35d365464063776e96d8dc914ef9ed22c",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "dafcf24e2a43f819719558f0a7613f42427553a779c11c2d959067a6ebe32459",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "c7b8f391c41635975c9c184fa8f78fd107f1e8c6d49678af608dd38d785b56a6",
    "binary_sha256": "866407ae0548668eb15c18b185d13e3f9656a2ea3394f988e6a7bb92f4467b9a",
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
  "harness_sha256": "94bb5f7f3e78554612c6fb1dcd4268ad348300322b3f12d88d87c8a6b1d39b24",
  "environment": {
    "SLOTSTREAM_OPT_IMAGE_REUSE": "1",
    "SLOTSTREAM_OPT_VISION_PADDING": "128",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_VISION_CAPTURE_DIR": "/Users/carlos/Projects/slotstream/.build/optimization/vision-serving-padding-reuse-v25/responses"
  },
  "fixtures": {
    "Tools/assets/vision_test/secret1.jpg": "427250bd24a93e98cac3d4ae83619040aa167dde63fa6e7272117bd9a1a17e7d",
    "Tools/assets/vision_test/secret2.jpg": "41802c151fbfc248f0af72790fe0eeba00cbbd6632c3ccd5200fef5421d2610f"
  },
  "exit_code": 0,
  "duration_seconds": 182.733931542,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 34165129216,
    "swapins": 41704012,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   577957.\nPages active:                                 913820.\nPages inactive:                               673715.\nPages speculative:                            238410.\nPages throttled:                                   0.\nPages wired down:                             216560.\nPages purgeable:                                7181.\n\"Translation faults\":                    13776008757.\nPages copy-on-write:                       626857461.\nPages zero filled:                       15320224699.\nPages reactivated:                        2287778698.\nPages purged:                               61693941.\nFile-backed pages:                           1500136.\nAnonymous pages:                              325809.\nPages stored in compressor:                  1509216.\nPages occupied by compressor:                 461226.\nDecompressions:                            962706823.\nCompressions:                             1256740868.\nPageins:                                  5841743053.\nPageouts:                                   10626197.\nSwapins:                                    41704012.\nSwapouts:                                   69922789.\nPages tagged:                                 166803.\nPages tagged resident:                        115279.\nPages tagged compressed:                       51524.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6875.\nPages tag-storage free:                         3837.\nPages tag-storage non-tag pageable:            87584.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8523712.\nTagged compressions:                         9414342.\nTagged decompressions:                       8656561.\n"
  },
  "harness_unchanged": true
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/01.json

SHA-256 `ab7208066b2343ff2b96fd55a9ec12bdd2e3fbd7618d79592b6f8ab49b443f93`; 200 bytes.

```
{
  "path": "/api/version",
  "request_sha256": "44136fa355b3678a1146ad16f7e8649e94fb4fc21fe77e8310c060f61caaff8a",
  "status": 404,
  "response": "{\"error\":\"not found: POST \\/api\\/version\"}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/02.json

SHA-256 `5b47331b25758439f9a1cc6e957151b5e9c9a452bee4ec5df9a430023b8370f3`; 8762 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "d9148979e14a0f3e651d7e899cc60c8d6ac0b0b179d2596f0602d90725413307",
  "status": 200,
  "response": "{\"total_duration\":12904909333,\"model\":\"qwen3.8-flash-next:4bit\",\"prompt_eval_duration\":11993908500,\"eval_count\":4,\"message\":{\"content\":\" Dog nose close-up\",\"role\":\"assistant\"},\"done\":true,\"prompt_eval_count\":725,\"eval_duration\":634246750,\"created_at\":\"2026-09-05T09:54:06Z\",\"done_reason\":\"stop\",\"slotstream_benchmark\":{\"effective_prefill_chunk\":256,\"effective_pool_slots\":961,\"stats\":{\"decodeIOSeconds\":0.27895170799999985,\"draftSeconds\":0,\"reusedImageFeatures\":0,\"prefillTokens\":725,\"prefillRowSortSeconds\":0.004045577000000001,\"prefillPhysicalFootprintBytes\":8589120264,\"encodedImages\":1,\"abortedReadScopes\":0,\"ngramCachePayloadBytes\":302080,\"expertHitRate\":0.37864583333333335,\"queueSeconds\":8.3999999999999998e-08,\"finishReason\":\"stop\",\"mlxCacheEndBytes\":704481168,\"sampledFootprint\":{\"samples\":646,\"intervalMilliseconds\":20,\"peakBytes\":8789218080},\"tokenCallbackSeconds\":4.1999999999999999e-08,\"prefillScatterSeconds\":0.0098257589999999895,\"prefillRecords\":40986,\"allocatedSequenceBytes\":28311552,\"generatorSystemBefore\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"draftedTokens\":0,\"mlxActiveEndBytes\":6677164688,\"reconciledHeadTokens\":0,\"generatorVMBefore\":{\"swapins\":41704012,\"swapouts\":69922789,\"reclaimableBytes\":30893441024},\"verifyPasses\":0,\"decodeForwardPasses\":4,\"imageEncodeSeconds\":0.27531362500000001,\"decodeReadBytes\":3298406400,\"generatorSystemAfter\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"prefillReadBytes\":113318092800,\"ngramCachedRows\":472,\"prefillMLXCacheBytes\":510486116,\"promptTokens\":725,\"reusedHeadTokens\":0,\"prefillComputePasses\":[256,256,213],\"mlxPeakMemoryGB\":7.7926084839999996,\"interTokenSeconds\":[0.23671700000000001,0.13984791599999999,0.13223729200000001],\"acceptedDrafts\":0,\"decodeModelTokens\":4,\"verifySeconds\":0,\"requestSeconds\":12.904094167,\"prefillPasses\":[256,256,213],\"prefillGPUWaitSeconds\":0.35026998699999995,\"ngramRowHits\":0,\"decodeScatterSeconds\":0.003082577999999998,\"peakMemoryGB\":8.5977055040000003,\"prefillMLXActiveBytes\":6865027048,\"ngramRowMisses\":64,\"prefillIOSeconds\":8.2364748769999974,\"decodeSeconds\":0.63424674999999997,\"decodeRecords\":1193,\"reusedPrefixTokens\":0,\"sampleSeconds\":0.003270584,\"lifetimeRSSPeakBytes\":4380344320,\"reconciliationSeconds\":0,\"generatorVMAfter\":{\"swapins\":41704012,\"swapouts\":69922789,\"reclaimableBytes\":27051180032},\"decodeTokens\":4,\"prefillSeconds\":11.9939085,\"firstTokenSeconds\":12.270864417,\"prefixSkippedImages\":0,\"sharedExpertPrelaunches\":0,\"physicalFootprintEndBytes\":8597705504},\"effective_mtp\":false,\"prompt_ids\":[248045,846,198,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,623,2250,4105,11,1092,9572,369,411,30,248046,198,248045,74455,198,248068,271,248069,271],\"output_ids\":[13846,18563,3160,5072],\"optimizations\":{\"compactScopeFrontier\":false,\"tailAwarePrefill\":false,\"incrementalIndexer\":false,\"workspacePiecewiseWrites\":false,\"deduplicateImages\":true,\"compactMTPRow\":false,\"valueOnlySamplerThreshold\":false,\"skipUnusedFinalForward\":false,\"sharedRoPE\":false,\"fusedGDNRecording\":false,\"indexerBlockTopK\":false,\"layerExpertWorkspace\":false,\"routerTopK\":false,\"boundedIndexer\":false,\"workspaceTokenTile\":256,\"visionAttentionPadding\":128,\"overlapSharedExpert\":false,\"boundedOutputQueue\":false,\"demandedPrefillOutput\":false,\"compactStateWindows\":false,\"boundedPLE\":false,\"disjointSweepOutput\":false,\"reuseFirstMTPEntry\":false,\"readScopeTokens\":0,\"boundedDraftTail\":false,\"denseIndexerBypass\":false,\"compactNgramRows\":false,\"boundedSweepRows\":false}}}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/03.json

SHA-256 `d61facf6e0821c9e4264824791f4ca3062aac9205610f6f8862792458eb4e80f`; 3728 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "b5532b9cd847180409f5d723ae57f1e37d12fa0273ab5d9a0690a15dbcc3fc31",
  "status": 200,
  "response": "{\"total_duration\":1645431166,\"model\":\"qwen3.8-flash-next:4bit\",\"prompt_eval_duration\":1179019167,\"eval_count\":3,\"message\":{\"role\":\"assistant\",\"content\":\"I cannot see\"},\"done\":true,\"prompt_eval_count\":21,\"eval_duration\":466148500,\"created_at\":\"2026-09-05T09:54:07Z\",\"done_reason\":\"stop\",\"slotstream_benchmark\":{\"effective_prefill_chunk\":256,\"effective_pool_slots\":961,\"stats\":{\"decodeIOSeconds\":0.21710583899999999,\"draftSeconds\":0,\"reusedImageFeatures\":0,\"prefillPhysicalFootprintBytes\":8771932960,\"prefillRowSortSeconds\":0,\"prefillTokens\":21,\"encodedImages\":0,\"abortedReadScopes\":0,\"ngramCachePayloadBytes\":348160,\"expertHitRate\":0.36041666666666666,\"queueSeconds\":2.0900000000000001e-07,\"finishReason\":\"stop\",\"mlxCacheEndBytes\":736266468,\"sampledFootprint\":{\"samples\":84,\"intervalMilliseconds\":20,\"peakBytes\":8775291680},\"tokenCallbackSeconds\":0,\"prefillRecords\":3777,\"prefillScatterSeconds\":0.0029131709999999996,\"allocatedSequenceBytes\":28311552,\"generatorSystemBefore\":{\"thermalState\":\"nominal\",\"lowPowerModeEnabled\":false},\"draftedTokens\":0,\"decodeForwardPasses\":3,\"reconciledHeadTokens\":0,\"verifyPasses\":0,\"mlxActiveEndBytes\":6820348584,\"generatorVMBefore\":{\"swapins\":41704012,\"swapouts\":69922789,\"reclaimableBytes\":27047002112},\"imageEncodeSeconds\":4.1999999999999999e-08,\"decodeReadBytes\":2546380800,\"generatorSystemAfter\":{\"thermalState\":\"nominal\",\"lowPowerModeEnabled\":false},\"prefillReadBytes\":10442649600,\"ngramCachedRows\":544,\"prefillMLXCacheBytes\":715608648,\"promptTokens\":21,\"interTokenSeconds\":[0.20219108299999999,0.120044584],\"prefillComputePasses\":[21],\"mlxPeakMemoryGB\":7.0995557040000001,\"acceptedDrafts\":0,\"reusedHeadTokens\":0,\"decodeModelTokens\":3,\"verifySeconds\":0,\"requestSeconds\":1.645275375,\"prefillPasses\":[21],\"prefillGPUWaitSeconds\":0,\"ngramRowHits\":0,\"decodeScatterSeconds\":0.0022490809999999996,\"peakMemoryGB\":8.7752916800000005,\"prefillMLXActiveBytes\":6838036804,\"ngramRowMisses\":48,\"prefillIOSeconds\":0.72311866699999927,\"decodeSeconds\":0.46614850000000002,\"decodeRecords\":921,\"reusedPrefixTokens\":0,\"lifetimeRSSPeakBytes\":4380344320,\"sampleSeconds\":0.00098550099999999996,\"reconciliationSeconds\":0,\"generatorVMAfter\":{\"swapins\":41704012,\"swapouts\":69922789,\"reclaimableBytes\":26791624704},\"decodeTokens\":3,\"prefillSeconds\":1.1790191670000001,\"firstTokenSeconds\":1.179313625,\"prefixSkippedImages\":0,\"sharedExpertPrelaunches\":0,\"physicalFootprintEndBytes\":8775291680},\"effective_mtp\":false,\"prompt_ids\":[248045,846,198,623,2250,4105,11,1092,9572,369,411,30,248046,198,248045,74455,198,248068,271,248069,271],\"output_ids\":[40,4021,1436],\"optimizations\":{\"compactScopeFrontier\":false,\"tailAwarePrefill\":false,\"incrementalIndexer\":false,\"workspacePiecewiseWrites\":false,\"deduplicateImages\":true,\"valueOnlySamplerThreshold\":false,\"compactMTPRow\":false,\"skipUnusedFinalForward\":false,\"sharedRoPE\":false,\"fusedGDNRecording\":false,\"indexerBlockTopK\":false,\"layerExpertWorkspace\":false,\"routerTopK\":false,\"boundedIndexer\":false,\"workspaceTokenTile\":256,\"visionAttentionPadding\":128,\"overlapSharedExpert\":false,\"boundedPLE\":false,\"compactStateWindows\":false,\"demandedPrefillOutput\":false,\"boundedOutputQueue\":false,\"disjointSweepOutput\":false,\"reuseFirstMTPEntry\":false,\"readScopeTokens\":0,\"boundedDraftTail\":false,\"denseIndexerBypass\":false,\"compactNgramRows\":false,\"boundedSweepRows\":false}}}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/04.json

SHA-256 `72b183d6a7ca891cbb180e3e83c1e112e3154e4021304147bcb06fc5edf0c0d8`; 490 bytes.

```
{
  "path": "/v1/chat/completions",
  "request_sha256": "6c1f0c07463c1e08290731881d50cc6e62882f849051b691939f4bdd7796294d",
  "status": 200,
  "response": "{\"choices\":[{\"message\":{\"content\":\"Green citrus fruit\",\"role\":\"assistant\"},\"finish_reason\":\"stop\",\"index\":0}],\"object\":\"chat.completion\",\"usage\":{\"prompt_tokens\":1885,\"total_tokens\":1888,\"completion_tokens\":3},\"created\":1788602076,\"id\":\"chatcmpl-D95A5D58\",\"model\":\"qwen3.8-flash-next:4bit\"}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/05.json

SHA-256 `1d770f19d038fe82228bc83be554fdd8ed8f20167cde58c5b33d9eeb3c0c2bf7`; 8713 bytes.

```
{
  "path": "/api/generate",
  "request_sha256": "7a17e517ac924ef306cade2ca8dcc329607384e05a291425e2520b68a2124b27",
  "status": 200,
  "response": "{\"total_duration\":12064425291,\"model\":\"qwen3.8-flash-next:4bit\",\"prompt_eval_duration\":11138805291,\"eval_count\":4,\"done\":true,\"prompt_eval_count\":725,\"eval_duration\":652289750,\"created_at\":\"2026-09-05T09:54:48Z\",\"response\":\" Dog nose close-up\",\"done_reason\":\"stop\",\"slotstream_benchmark\":{\"effective_prefill_chunk\":256,\"effective_pool_slots\":961,\"stats\":{\"decodeIOSeconds\":0.29487812599999996,\"draftSeconds\":0,\"reusedImageFeatures\":0,\"prefillRowSortSeconds\":0.004733042000000001,\"prefillPhysicalFootprintBytes\":9274987416,\"prefillTokens\":725,\"encodedImages\":1,\"abortedReadScopes\":0,\"ngramCachePayloadBytes\":424960,\"expertHitRate\":0.38437500000000002,\"queueSeconds\":4.1999999999999999e-08,\"finishReason\":\"stop\",\"mlxCacheEndBytes\":890607336,\"sampledFootprint\":{\"samples\":605,\"intervalMilliseconds\":20,\"peakBytes\":9429406616},\"tokenCallbackSeconds\":8.3999999999999998e-08,\"prefillRecords\":39618,\"prefillScatterSeconds\":0.11657946299999986,\"generatorSystemBefore\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"allocatedSequenceBytes\":28311552,\"draftedTokens\":0,\"mlxActiveEndBytes\":7103320792,\"reconciledHeadTokens\":0,\"generatorVMBefore\":{\"swapins\":41704012,\"reclaimableBytes\":28249030656,\"swapouts\":69922789},\"decodeForwardPasses\":4,\"verifyPasses\":0,\"imageEncodeSeconds\":0.273067,\"decodeReadBytes\":3267993600,\"generatorSystemAfter\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"prefillReadBytes\":109535846400,\"ngramCachedRows\":664,\"prefillMLXCacheBytes\":527796114,\"promptTokens\":725,\"interTokenSeconds\":[0.24220287500000001,0.142048333,0.135748542],\"mlxPeakMemoryGB\":8.4052470360000004,\"prefillComputePasses\":[256,256,213],\"acceptedDrafts\":0,\"reusedHeadTokens\":0,\"decodeModelTokens\":4,\"verifySeconds\":0,\"requestSeconds\":12.064260833000001,\"prefillPasses\":[256,256,213],\"prefillGPUWaitSeconds\":0.27927827899999985,\"ngramRowHits\":64,\"decodeScatterSeconds\":0.0033140409999999993,\"prefillMLXActiveBytes\":7460033266,\"peakMemoryGB\":9.2813116400000002,\"ngramRowMisses\":0,\"prefillIOSeconds\":7.6470140179999921,\"decodeSeconds\":0.65228975,\"decodeRecords\":1182,\"reusedPrefixTokens\":0,\"sampleSeconds\":0.001286042,\"lifetimeRSSPeakBytes\":4380344320,\"reconciliationSeconds\":0,\"generatorVMAfter\":{\"swapins\":41704012,\"reclaimableBytes\":28121726976,\"swapouts\":69922789},\"decodeTokens\":4,\"prefillSeconds\":11.138805291000001,\"firstTokenSeconds\":11.412226499999999,\"prefixSkippedImages\":0,\"sharedExpertPrelaunches\":0,\"physicalFootprintEndBytes\":9281311640},\"effective_mtp\":false,\"prompt_ids\":[248045,846,198,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,623,2250,4105,11,1092,9572,369,411,30,248046,198,248045,74455,198,248068,271,248069,271],\"output_ids\":[13846,18563,3160,5072],\"optimizations\":{\"compactScopeFrontier\":false,\"tailAwarePrefill\":false,\"valueOnlySamplerThreshold\":false,\"incrementalIndexer\":false,\"deduplicateImages\":true,\"compactMTPRow\":false,\"workspacePiecewiseWrites\":false,\"skipUnusedFinalForward\":false,\"sharedRoPE\":false,\"fusedGDNRecording\":false,\"indexerBlockTopK\":false,\"layerExpertWorkspace\":false,\"routerTopK\":false,\"workspaceTokenTile\":256,\"boundedIndexer\":false,\"visionAttentionPadding\":128,\"overlapSharedExpert\":false,\"demandedPrefillOutput\":false,\"boundedPLE\":false,\"compactStateWindows\":false,\"boundedOutputQueue\":false,\"disjointSweepOutput\":false,\"reuseFirstMTPEntry\":false,\"boundedDraftTail\":false,\"readScopeTokens\":0,\"denseIndexerBypass\":false,\"compactNgramRows\":false,\"boundedSweepRows\":false}}}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/06.json

SHA-256 `e37020b6e149bdb24a513d7f1ef35f9c8a3b16ec6ff6fc99d833ccce02fc0512`; 1012 bytes.

```
{
  "path": "/v3/ai/language-model",
  "request_sha256": "2088b47e4d16c9e969887434036233dcf7357e323b9f364e32db14cfee74f5ff",
  "status": 200,
  "response": "data: {\"type\":\"stream-start\",\"warnings\":[]}\n\ndata: {\"id\":\"gen_0babe6cc\",\"modelId\":\"slotstream\\/qwen3.8-flash-next:4bit\",\"timestamp\":\"2026-09-05T09:54:48Z\",\"type\":\"response-metadata\"}\n\n: keepalive\n\ndata: {\"id\":\"t0\",\"type\":\"text-start\"}\n\ndata: {\"delta\":\" Dog\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" nose\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\" close\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"delta\":\"-up\",\"id\":\"t0\",\"type\":\"text-delta\"}\n\ndata: {\"id\":\"t0\",\"type\":\"text-end\"}\n\ndata: {\"finishReason\":{\"raw\":\"stop\",\"unified\":\"stop\"},\"type\":\"finish\",\"usage\":{\"inputTokens\":{\"cacheRead\":0,\"cacheWrite\":0,\"noCache\":725,\"total\":725},\"outputTokens\":{\"reasoning\":0,\"text\":4,\"total\":4}}}\n\ndata: [DONE]\n\n"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/07.json

SHA-256 `e96d9a673c382018466c371eaf0cea25f321152f101129b05b82352533503257`; 355 bytes.

```
{
  "path": "/v3/ai/language-model",
  "request_sha256": "aabd31c6b71c7f3f7844b51ecee22851e5e2e5ffc6491f193dc4592f34f78350",
  "status": 400,
  "response": "{\"error\":{\"code\":\"unsupported_file_part\",\"message\":\"prompt[0]: this model reads images; a `file` part of type 'application\\/pdf' is not supported\",\"type\":\"invalid_request_error\"}}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/08.json

SHA-256 `78ff5ab97b7a9dfa9208a8b4ef5dc94054297e01195d2737994256627814e933`; 21942 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "a888194ad331b5270d70443a0a71e5f2b7dd17d8b8d4672b995a60d1a5700f44",
  "status": 200,
  "response": "{\"total_duration\":38631118500,\"model\":\"qwen3.8-flash-next:4bit\",\"prompt_eval_duration\":36665837125,\"eval_count\":4,\"message\":{\"role\":\"assistant\",\"content\":\"dog, pomelo\"},\"done\":true,\"prompt_eval_count\":2602,\"eval_duration\":703107375,\"created_at\":\"2026-09-05T09:55:39Z\",\"done_reason\":\"stop\",\"slotstream_benchmark\":{\"effective_prefill_chunk\":256,\"effective_pool_slots\":961,\"stats\":{\"decodeIOSeconds\":0.32006125100000016,\"draftSeconds\":0,\"reusedImageFeatures\":0,\"prefillTokens\":2602,\"prefillRowSortSeconds\":0.023546291000000011,\"prefillPhysicalFootprintBytes\":9208615952,\"encodedImages\":2,\"abortedReadScopes\":0,\"ngramCachePayloadBytes\":716800,\"expertHitRate\":0.30729166666666669,\"queueSeconds\":2.0800000000000001e-07,\"finishReason\":\"stop\",\"mlxCacheEndBytes\":577974315,\"sampledFootprint\":{\"samples\":1933,\"intervalMilliseconds\":20,\"peakBytes\":10335933408},\"tokenCallbackSeconds\":4.1999999999999999e-08,\"prefillScatterSeconds\":0.65543396100000006,\"prefillRecords\":144281,\"allocatedSequenceBytes\":84934656,\"generatorSystemBefore\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"draftedTokens\":0,\"mlxActiveEndBytes\":7305138904,\"reconciledHeadTokens\":0,\"generatorVMBefore\":{\"swapins\":41704012,\"reclaimableBytes\":27779563520,\"swapouts\":69922789},\"verifyPasses\":0,\"decodeForwardPasses\":4,\"imageEncodeSeconds\":1.2618720839999999,\"decodeReadBytes\":3677184000,\"generatorSystemAfter\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"prefillReadBytes\":398908108800,\"ngramCachedRows\":1120,\"prefillMLXCacheBytes\":540408751,\"promptTokens\":2602,\"reusedHeadTokens\":0,\"prefillComputePasses\":[256,256,256,256,256,256,256,256,256,256,42],\"mlxPeakMemoryGB\":8.0263866959999994,\"interTokenSeconds\":[0.23735604199999999,0.162867084,0.160151459],\"acceptedDrafts\":0,\"decodeModelTokens\":4,\"verifySeconds\":0,\"requestSeconds\":38.630944124999999,\"prefillPasses\":[256,256,256,256,256,256,256,256,256,256,42],\"prefillGPUWaitSeconds\":1.2049393809999986,\"ngramRowHits\":0,\"decodeScatterSeconds\":0.003221711999999999,\"peakMemoryGB\":9.2151695520000008,\"prefillMLXActiveBytes\":7336432344,\"ngramRowMisses\":64,\"prefillIOSeconds\":28.348486095999974,\"decodeSeconds\":0.70310737499999998,\"decodeRecords\":1330,\"reusedPrefixTokens\":0,\"sampleSeconds\":0.0013892089999999998,\"lifetimeRSSPeakBytes\":4380344320,\"reconciliationSeconds\":0,\"generatorVMAfter\":{\"swapins\":41704012,\"reclaimableBytes\":28430729216,\"swapouts\":69922789},\"decodeTokens\":4,\"prefillSeconds\":36.665837125000003,\"firstTokenSeconds\":37.928051250000003,\"prefixSkippedImages\":0,\"sharedExpertPrelaunches\":0,\"physicalFootprintEndBytes\":9215169552},\"effective_mtp\":false,\"prompt_ids\":[248045,846,198,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,15666,440,6681,1330,4105,18101,539,264,30644,25,279,3704,314,279,1118,6588,11,1179,314,279,2018,13,248046,198,248045,74455,198,248068,271,248069,271],\"output_ids\":[17907,11,28523,19559],\"optimizations\":{\"compactScopeFrontier\":false,\"tailAwarePrefill\":false,\"incrementalIndexer\":false,\"workspacePiecewiseWrites\":false,\"deduplicateImages\":true,\"valueOnlySamplerThreshold\":false,\"compactMTPRow\":false,\"skipUnusedFinalForward\":false,\"sharedRoPE\":false,\"indexerBlockTopK\":false,\"fusedGDNRecording\":false,\"layerExpertWorkspace\":false,\"routerTopK\":false,\"boundedIndexer\":false,\"workspaceTokenTile\":256,\"boundedOutputQueue\":false,\"boundedPLE\":false,\"overlapSharedExpert\":false,\"compactStateWindows\":false,\"visionAttentionPadding\":128,\"demandedPrefillOutput\":false,\"disjointSweepOutput\":false,\"reuseFirstMTPEntry\":false,\"boundedDraftTail\":false,\"readScopeTokens\":0,\"denseIndexerBypass\":false,\"compactNgramRows\":false,\"boundedSweepRows\":false}}}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/09.json

SHA-256 `f1fe798160da8d4b01178abe019c1b464c9e9a217b58f9f690c3c7dbf61006cb`; 8642 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "b7fab4496873d6ada50483bb6ccc92e00d75d48a784176d5c7642d5d511ccfb5",
  "status": 200,
  "response": "{\"total_duration\":11638625584,\"model\":\"qwen3.8-flash-next:4bit\",\"prompt_eval_duration\":11126990875,\"eval_count\":1,\"message\":{\"role\":\"assistant\",\"content\":\"ok\"},\"done\":true,\"prompt_eval_count\":720,\"eval_duration\":236029792,\"created_at\":\"2026-09-05T09:55:51Z\",\"done_reason\":\"stop\",\"slotstream_benchmark\":{\"effective_prefill_chunk\":256,\"effective_pool_slots\":961,\"stats\":{\"decodeIOSeconds\":0.10132466500000001,\"draftSeconds\":0,\"reusedImageFeatures\":0,\"prefillRowSortSeconds\":0.004866917000000003,\"prefillPhysicalFootprintBytes\":9370473440,\"prefillTokens\":720,\"encodedImages\":1,\"abortedReadScopes\":0,\"ngramCachePayloadBytes\":783360,\"expertHitRate\":0.041666666666666664,\"queueSeconds\":2.0800000000000001e-07,\"finishReason\":\"stop\",\"mlxCacheEndBytes\":704283172,\"sampledFootprint\":{\"samples\":583,\"intervalMilliseconds\":20,\"peakBytes\":9536230416},\"tokenCallbackSeconds\":0,\"prefillRecords\":39226,\"prefillScatterSeconds\":0.1212362589999998,\"generatorSystemBefore\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"allocatedSequenceBytes\":28311552,\"draftedTokens\":0,\"mlxActiveEndBytes\":7347892952,\"reconciledHeadTokens\":0,\"generatorVMBefore\":{\"swapins\":41704012,\"reclaimableBytes\":28430974976,\"swapouts\":69922789},\"decodeForwardPasses\":1,\"verifyPasses\":0,\"imageEncodeSeconds\":0.27522833299999999,\"decodeReadBytes\":1271808000,\"generatorSystemAfter\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"prefillReadBytes\":108452044800,\"ngramCachedRows\":1224,\"prefillMLXCacheBytes\":532203752,\"promptTokens\":720,\"interTokenSeconds\":[],\"mlxPeakMemoryGB\":8.4406489839999992,\"prefillComputePasses\":[256,256,208],\"acceptedDrafts\":0,\"reusedHeadTokens\":0,\"decodeModelTokens\":1,\"verifySeconds\":0,\"requestSeconds\":11.638462916,\"prefillPasses\":[256,256,208],\"prefillGPUWaitSeconds\":0.27649249300000001,\"ngramRowHits\":0,\"decodeScatterSeconds\":0.0008828379999999997,\"prefillMLXActiveBytes\":7514522336,\"peakMemoryGB\":9.3759784639999992,\"ngramRowMisses\":16,\"prefillIOSeconds\":7.6574831000000003,\"decodeSeconds\":0.23602979199999999,\"decodeRecords\":460,\"reusedPrefixTokens\":0,\"sampleSeconds\":0.000604417,\"lifetimeRSSPeakBytes\":4380344320,\"reconciliationSeconds\":0,\"generatorVMAfter\":{\"swapins\":41704012,\"reclaimableBytes\":27930312704,\"swapouts\":69922789},\"decodeTokens\":1,\"prefillSeconds\":11.126990875000001,\"firstTokenSeconds\":11.402692375000001,\"prefixSkippedImages\":0,\"sharedExpertPrelaunches\":0,\"physicalFootprintEndBytes\":9375978464},\"effective_mtp\":false,\"prompt_ids\":[248045,846,198,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,44240,1132,25,5226,248046,198,248045,74455,198,248068,271,248069,271],\"output_ids\":[547],\"optimizations\":{\"compactScopeFrontier\":false,\"tailAwarePrefill\":false,\"incrementalIndexer\":false,\"workspacePiecewiseWrites\":false,\"deduplicateImages\":true,\"valueOnlySamplerThreshold\":false,\"compactMTPRow\":false,\"skipUnusedFinalForward\":false,\"sharedRoPE\":false,\"indexerBlockTopK\":false,\"fusedGDNRecording\":false,\"layerExpertWorkspace\":false,\"routerTopK\":false,\"boundedIndexer\":false,\"workspaceTokenTile\":256,\"boundedOutputQueue\":false,\"boundedPLE\":false,\"overlapSharedExpert\":false,\"compactStateWindows\":false,\"visionAttentionPadding\":128,\"demandedPrefillOutput\":false,\"disjointSweepOutput\":false,\"reuseFirstMTPEntry\":false,\"boundedDraftTail\":false,\"readScopeTokens\":0,\"denseIndexerBypass\":false,\"compactNgramRows\":false,\"boundedSweepRows\":false}}}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/10.json

SHA-256 `450ca9fe054114bded676cdd463e6787aefaca4343d62705f88168b363099c93`; 8716 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "bfcfa262d554ecff8df0146f038c958d9e2a79db5aeb31d402b5dda5a1c223aa",
  "status": 200,
  "response": "{\"total_duration\":1387132542,\"model\":\"qwen3.8-flash-next:4bit\",\"prompt_eval_duration\":1049244625,\"eval_count\":2,\"message\":{\"content\":\"still ok\",\"role\":\"assistant\"},\"done\":true,\"prompt_eval_count\":741,\"eval_duration\":337632458,\"created_at\":\"2026-09-05T09:55:52Z\",\"done_reason\":\"stop\",\"slotstream_benchmark\":{\"effective_prefill_chunk\":256,\"effective_pool_slots\":961,\"stats\":{\"decodeIOSeconds\":0.16270062699999996,\"draftSeconds\":0,\"prefillRowSortSeconds\":0,\"prefillTokens\":20,\"prefillPhysicalFootprintBytes\":9416381408,\"reusedImageFeatures\":0,\"encodedImages\":0,\"abortedReadScopes\":0,\"ngramCachePayloadBytes\":885760,\"expertHitRate\":0.26666666666666666,\"queueSeconds\":1.67e-07,\"finishReason\":\"stop\",\"mlxCacheEndBytes\":743166110,\"sampledFootprint\":{\"samples\":71,\"intervalMilliseconds\":20,\"peakBytes\":9424802784},\"tokenCallbackSeconds\":4.1000000000000003e-08,\"prefillRecords\":3273,\"prefillScatterSeconds\":0.0029337909999999998,\"generatorSystemBefore\":{\"thermalState\":\"nominal\",\"lowPowerModeEnabled\":false},\"allocatedSequenceBytes\":28311552,\"draftedTokens\":0,\"decodeForwardPasses\":2,\"reconciledHeadTokens\":0,\"verifyPasses\":0,\"generatorVMBefore\":{\"reclaimableBytes\":27930492928,\"swapins\":41704012,\"swapouts\":69922789},\"mlxActiveEndBytes\":7349359320,\"imageEncodeSeconds\":1.67e-07,\"decodeReadBytes\":1946419200,\"generatorSystemAfter\":{\"thermalState\":\"nominal\",\"lowPowerModeEnabled\":false},\"prefillReadBytes\":9049190400,\"ngramCachedRows\":1384,\"prefillMLXCacheBytes\":726294228,\"promptTokens\":741,\"interTokenSeconds\":[0.190168166],\"prefillComputePasses\":[20],\"mlxPeakMemoryGB\":7.6066271480000003,\"reusedHeadTokens\":0,\"acceptedDrafts\":0,\"decodeModelTokens\":2,\"verifySeconds\":0,\"requestSeconds\":1.386969084,\"prefillPasses\":[20],\"prefillGPUWaitSeconds\":0,\"ngramRowHits\":0,\"prefillMLXActiveBytes\":7366912032,\"peakMemoryGB\":9.4248027840000006,\"decodeScatterSeconds\":0.0016638779999999995,\"ngramRowMisses\":32,\"prefillIOSeconds\":0.63514775399999968,\"decodeSeconds\":0.33763245800000002,\"decodeRecords\":704,\"reusedPrefixTokens\":721,\"lifetimeRSSPeakBytes\":4380344320,\"sampleSeconds\":0.00075191600000000004,\"reconciliationSeconds\":0,\"generatorVMAfter\":{\"reclaimableBytes\":27269627904,\"swapins\":41704012,\"swapouts\":69922789},\"decodeTokens\":2,\"prefillSeconds\":1.049244625,\"firstTokenSeconds\":1.0495237079999999,\"prefixSkippedImages\":1,\"sharedExpertPrelaunches\":0,\"physicalFootprintEndBytes\":9424802784},\"effective_mtp\":false,\"prompt_ids\":[248045,846,198,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,44240,1132,25,5226,248046,198,248045,74455,198,248068,271,248069,271,547,248046,198,248045,846,198,6820,1910,1132,25,1990,5226,248046,198,248045,74455,198,248068,271,248069,271],\"output_ids\":[41933,5226],\"optimizations\":{\"compactScopeFrontier\":false,\"tailAwarePrefill\":false,\"valueOnlySamplerThreshold\":false,\"workspacePiecewiseWrites\":false,\"deduplicateImages\":true,\"compactMTPRow\":false,\"incrementalIndexer\":false,\"skipUnusedFinalForward\":false,\"sharedRoPE\":false,\"fusedGDNRecording\":false,\"indexerBlockTopK\":false,\"layerExpertWorkspace\":false,\"routerTopK\":false,\"boundedIndexer\":false,\"workspaceTokenTile\":256,\"visionAttentionPadding\":128,\"overlapSharedExpert\":false,\"boundedPLE\":false,\"boundedOutputQueue\":false,\"demandedPrefillOutput\":false,\"compactStateWindows\":false,\"disjointSweepOutput\":false,\"readScopeTokens\":0,\"reuseFirstMTPEntry\":false,\"boundedDraftTail\":false,\"denseIndexerBypass\":false,\"compactNgramRows\":false,\"boundedSweepRows\":false}}}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/11.json

SHA-256 `6be43a60a9cb465fa69b081ac62cdb62611a1769266ba69fb2dd90465d22f268`; 8755 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "7f16460cc84162749450da9d1f74b3b93e79e2781db8771f800b2d73998aa323",
  "status": 200,
  "response": "{\"total_duration\":12268002916,\"model\":\"qwen3.8-flash-next:4bit\",\"prompt_eval_duration\":11342879000,\"eval_count\":4,\"message\":{\"content\":\" Dog nose close-up\",\"role\":\"assistant\"},\"done\":true,\"prompt_eval_count\":724,\"eval_duration\":647579125,\"created_at\":\"2026-09-05T09:56:04Z\",\"done_reason\":\"stop\",\"slotstream_benchmark\":{\"effective_prefill_chunk\":256,\"effective_pool_slots\":961,\"stats\":{\"decodeIOSeconds\":0.29572317200000026,\"draftSeconds\":0,\"prefillRowSortSeconds\":0.004406741000000001,\"prefillTokens\":724,\"prefillPhysicalFootprintBytes\":9278510024,\"reusedImageFeatures\":0,\"encodedImages\":1,\"abortedReadScopes\":0,\"ngramCachePayloadBytes\":890880,\"expertHitRate\":0.34531250000000002,\"queueSeconds\":4.1000000000000003e-08,\"finishReason\":\"stop\",\"mlxCacheEndBytes\":695229872,\"sampledFootprint\":{\"samples\":615,\"intervalMilliseconds\":20,\"peakBytes\":9724597288},\"tokenCallbackSeconds\":4.1999999999999999e-08,\"prefillRecords\":39571,\"prefillScatterSeconds\":0.1278738970000001,\"generatorSystemBefore\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"allocatedSequenceBytes\":28311552,\"draftedTokens\":0,\"decodeForwardPasses\":4,\"reconciledHeadTokens\":0,\"verifyPasses\":0,\"generatorVMBefore\":{\"swapins\":41704012,\"reclaimableBytes\":27269791744,\"swapouts\":69922789},\"mlxActiveEndBytes\":7252951744,\"imageEncodeSeconds\":0.27701458299999998,\"decodeReadBytes\":3475353600,\"generatorSystemAfter\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"prefillReadBytes\":109405900800,\"ngramCachedRows\":1392,\"prefillMLXCacheBytes\":502170340,\"promptTokens\":724,\"interTokenSeconds\":[0.227877625,0.14850812499999999,0.132620292],\"prefillComputePasses\":[256,256,212],\"mlxPeakMemoryGB\":8.3543909559999996,\"reusedHeadTokens\":0,\"acceptedDrafts\":0,\"decodeModelTokens\":4,\"verifySeconds\":0,\"requestSeconds\":12.267845250000001,\"prefillPasses\":[256,256,212],\"prefillGPUWaitSeconds\":0.19822700499999985,\"ngramRowHits\":64,\"prefillMLXActiveBytes\":7440044040,\"peakMemoryGB\":9.2846704080000002,\"decodeScatterSeconds\":0.0032264150000000007,\"ngramRowMisses\":0,\"prefillIOSeconds\":7.9471975470000054,\"decodeSeconds\":0.64757912500000003,\"decodeRecords\":1257,\"reusedPrefixTokens\":0,\"lifetimeRSSPeakBytes\":4380344320,\"sampleSeconds\":0.0012410850000000001,\"reconciliationSeconds\":0,\"generatorVMAfter\":{\"swapins\":41704012,\"reclaimableBytes\":27891400704,\"swapouts\":69922789},\"decodeTokens\":4,\"prefillSeconds\":11.342879,\"firstTokenSeconds\":11.620568333,\"prefixSkippedImages\":0,\"sharedExpertPrelaunches\":0,\"physicalFootprintEndBytes\":9284670408},\"effective_mtp\":false,\"prompt_ids\":[248045,846,198,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,623,2250,4105,11,1092,369,411,30,248046,198,248045,74455,198,248068,271,248069,271],\"output_ids\":[13846,18563,3160,5072],\"optimizations\":{\"compactScopeFrontier\":false,\"tailAwarePrefill\":false,\"incrementalIndexer\":false,\"workspacePiecewiseWrites\":false,\"deduplicateImages\":true,\"compactMTPRow\":false,\"valueOnlySamplerThreshold\":false,\"skipUnusedFinalForward\":false,\"sharedRoPE\":false,\"fusedGDNRecording\":false,\"indexerBlockTopK\":false,\"layerExpertWorkspace\":false,\"routerTopK\":false,\"workspaceTokenTile\":256,\"boundedIndexer\":false,\"boundedOutputQueue\":false,\"boundedPLE\":false,\"demandedPrefillOutput\":false,\"compactStateWindows\":false,\"visionAttentionPadding\":128,\"overlapSharedExpert\":false,\"disjointSweepOutput\":false,\"reuseFirstMTPEntry\":false,\"readScopeTokens\":0,\"boundedDraftTail\":false,\"denseIndexerBypass\":false,\"compactNgramRows\":false,\"boundedSweepRows\":false}}}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/12.json

SHA-256 `cc83ad7e6ec2a47069318f33777341b1004e6e8c4d008f8fcdc788b4b69a4329`; 16885 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "6b4f9e584de0aa8f2e13134c889112d0449d84579e5c06026b88a112ddf6ae92",
  "status": 200,
  "response": "{\"total_duration\":28884332791,\"model\":\"qwen3.8-flash-next:4bit\",\"prompt_eval_duration\":27394353792,\"eval_count\":3,\"message\":{\"role\":\"assistant\",\"content\":\"Green citrus fruit\"},\"done\":true,\"prompt_eval_count\":1884,\"eval_duration\":495015625,\"created_at\":\"2026-09-05T09:56:33Z\",\"done_reason\":\"stop\",\"slotstream_benchmark\":{\"effective_prefill_chunk\":256,\"effective_pool_slots\":961,\"stats\":{\"decodeIOSeconds\":0.22495175699999992,\"draftSeconds\":0,\"reusedImageFeatures\":0,\"prefillTokens\":1884,\"prefillRowSortSeconds\":0.016340256999999997,\"prefillPhysicalFootprintBytes\":9295795120,\"encodedImages\":1,\"abortedReadScopes\":0,\"ngramCachePayloadBytes\":890880,\"expertHitRate\":0.3840277777777778,\"queueSeconds\":2.0800000000000001e-07,\"finishReason\":\"stop\",\"mlxCacheEndBytes\":615507904,\"sampledFootprint\":{\"samples\":1446,\"intervalMilliseconds\":20,\"peakBytes\":10042627136},\"tokenCallbackSeconds\":4.1999999999999999e-08,\"prefillScatterSeconds\":0.38745604300000014,\"prefillRecords\":103507,\"generatorSystemBefore\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"allocatedSequenceBytes\":56623104,\"draftedTokens\":0,\"mlxActiveEndBytes\":7349195480,\"reconciledHeadTokens\":0,\"generatorVMBefore\":{\"swapins\":41704012,\"swapouts\":69922789,\"reclaimableBytes\":27891466240},\"verifyPasses\":0,\"decodeForwardPasses\":3,\"imageEncodeSeconds\":0.994503833,\"decodeReadBytes\":2452377600,\"generatorSystemAfter\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"prefillReadBytes\":286176153600,\"ngramCachedRows\":1392,\"prefillMLXCacheBytes\":534827128,\"promptTokens\":1884,\"interTokenSeconds\":[0.22988645899999999,0.132697709],\"prefillComputePasses\":[256,256,256,256,256,256,256,92],\"mlxPeakMemoryGB\":8.24230996,\"acceptedDrafts\":0,\"reusedHeadTokens\":0,\"decodeModelTokens\":3,\"verifySeconds\":0,\"requestSeconds\":28.884152958000001,\"prefillPasses\":[256,256,256,256,256,256,256,92],\"prefillGPUWaitSeconds\":0.93760066399999697,\"ngramRowHits\":48,\"prefillMLXActiveBytes\":7422362332,\"peakMemoryGB\":9.3033809119999997,\"decodeScatterSeconds\":0.0023525799999999999,\"ngramRowMisses\":0,\"prefillIOSeconds\":20.849299055000014,\"decodeSeconds\":0.49501562500000001,\"decodeRecords\":887,\"reusedPrefixTokens\":0,\"sampleSeconds\":0.001008541,\"lifetimeRSSPeakBytes\":4380344320,\"reconciliationSeconds\":0,\"generatorVMAfter\":{\"swapins\":41704012,\"swapouts\":69922789,\"reclaimableBytes\":27814789120},\"decodeTokens\":3,\"prefillSeconds\":27.394353792,\"firstTokenSeconds\":28.389378666999999,\"prefixSkippedImages\":0,\"sharedExpertPrelaunches\":0,\"physicalFootprintEndBytes\":9303380912},\"effective_mtp\":false,\"prompt_ids\":[248045,846,198,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,623,2250,4105,11,1092,369,411,30,248046,198,248045,74455,198,248068,271,248069,271],\"output_ids\":[18978,57189,13383],\"optimizations\":{\"compactScopeFrontier\":false,\"tailAwarePrefill\":false,\"incrementalIndexer\":false,\"workspacePiecewiseWrites\":false,\"valueOnlySamplerThreshold\":false,\"compactMTPRow\":false,\"deduplicateImages\":true,\"skipUnusedFinalForward\":false,\"sharedRoPE\":false,\"fusedGDNRecording\":false,\"indexerBlockTopK\":false,\"layerExpertWorkspace\":false,\"routerTopK\":false,\"workspaceTokenTile\":256,\"boundedIndexer\":false,\"visionAttentionPadding\":128,\"overlapSharedExpert\":false,\"boundedPLE\":false,\"demandedPrefillOutput\":false,\"compactStateWindows\":false,\"boundedOutputQueue\":false,\"disjointSweepOutput\":false,\"reuseFirstMTPEntry\":false,\"boundedDraftTail\":false,\"readScopeTokens\":0,\"denseIndexerBypass\":false,\"compactNgramRows\":false,\"boundedSweepRows\":false}}}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/13.json

SHA-256 `634a81397a3fad8818bd9957a30f6d770bdf0fa67207f6b7d0414e26f7615d89`; 13670 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "3fcfc9b3483dccac0b619971ee7047f5abd648d7cca88bb25d4f82975184f4d6",
  "status": 200,
  "response": "{\"total_duration\":21344833667,\"model\":\"qwen3.8-flash-next:4bit\",\"prompt_eval_duration\":20655250792,\"eval_count\":2,\"message\":{\"role\":\"assistant\",\"content\":\" A dog\"},\"done\":true,\"prompt_eval_count\":1433,\"eval_duration\":416192333,\"created_at\":\"2026-09-05T09:56:54Z\",\"done_reason\":\"stop\",\"slotstream_benchmark\":{\"effective_prefill_chunk\":256,\"effective_pool_slots\":961,\"stats\":{\"decodeIOSeconds\":0.19517829400000006,\"draftSeconds\":0,\"reusedImageFeatures\":1,\"prefillPhysicalFootprintBytes\":9397294000,\"prefillRowSortSeconds\":0.012135090999999997,\"prefillTokens\":1433,\"encodedImages\":1,\"abortedReadScopes\":0,\"ngramCachePayloadBytes\":1039360,\"expertHitRate\":0.14791666666666667,\"queueSeconds\":1.67e-07,\"finishReason\":\"stop\",\"mlxCacheEndBytes\":656831612,\"sampledFootprint\":{\"samples\":1069,\"intervalMilliseconds\":20,\"peakBytes\":9604813792},\"tokenCallbackSeconds\":4.1999999999999999e-08,\"prefillRecords\":80248,\"prefillScatterSeconds\":0.31450045200000021,\"allocatedSequenceBytes\":56623104,\"generatorSystemBefore\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"draftedTokens\":0,\"decodeForwardPasses\":2,\"reconciledHeadTokens\":0,\"verifyPasses\":0,\"mlxActiveEndBytes\":7402501872,\"generatorVMBefore\":{\"swapins\":41704012,\"swapouts\":69922789,\"reclaimableBytes\":27813117952},\"imageEncodeSeconds\":0.27304304200000001,\"decodeReadBytes\":2261606400,\"generatorSystemAfter\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"prefillReadBytes\":221869670400,\"ngramCachedRows\":1624,\"prefillMLXCacheBytes\":522541120,\"promptTokens\":1433,\"interTokenSeconds\":[0.236874375],\"prefillComputePasses\":[256,256,256,256,256,153],\"mlxPeakMemoryGB\":8.4591390799999999,\"acceptedDrafts\":0,\"reusedHeadTokens\":0,\"decodeModelTokens\":2,\"verifySeconds\":0,\"requestSeconds\":21.344670749999999,\"prefillPasses\":[256,256,256,256,256,153],\"prefillGPUWaitSeconds\":0.68286443799999808,\"ngramRowHits\":0,\"decodeScatterSeconds\":0.0016857810000000001,\"peakMemoryGB\":9.403241392,\"prefillMLXActiveBytes\":7530962080,\"ngramRowMisses\":32,\"prefillIOSeconds\":15.181034304999994,\"decodeSeconds\":0.41619233300000003,\"decodeRecords\":818,\"reusedPrefixTokens\":0,\"lifetimeRSSPeakBytes\":4380344320,\"sampleSeconds\":0.00082295800000000004,\"reconciliationSeconds\":0,\"generatorVMAfter\":{\"swapins\":41704012,\"swapouts\":69922789,\"reclaimableBytes\":27251867648},\"decodeTokens\":2,\"prefillSeconds\":20.655250792,\"firstTokenSeconds\":20.928725291999999,\"prefixSkippedImages\":0,\"sharedExpertPrelaunches\":0,\"physicalFootprintEndBytes\":9403241392},\"effective_mtp\":false,\"prompt_ids\":[248045,846,198,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,3710,9572,369,6625,303,2107,5167,30,17308,303,2250,4105,13,248046,198,248045,74455,198,248068,271,248069,271],\"output_ids\":[357,5388],\"optimizations\":{\"compactScopeFrontier\":false,\"tailAwarePrefill\":false,\"valueOnlySamplerThreshold\":false,\"workspacePiecewiseWrites\":false,\"incrementalIndexer\":false,\"compactMTPRow\":false,\"deduplicateImages\":true,\"skipUnusedFinalForward\":false,\"sharedRoPE\":false,\"fusedGDNRecording\":false,\"indexerBlockTopK\":false,\"layerExpertWorkspace\":false,\"routerTopK\":false,\"boundedIndexer\":false,\"workspaceTokenTile\":256,\"boundedOutputQueue\":false,\"demandedPrefillOutput\":false,\"overlapSharedExpert\":false,\"compactStateWindows\":false,\"visionAttentionPadding\":128,\"boundedPLE\":false,\"disjointSweepOutput\":false,\"readScopeTokens\":0,\"reuseFirstMTPEntry\":false,\"boundedDraftTail\":false,\"denseIndexerBypass\":false,\"compactNgramRows\":false,\"boundedSweepRows\":false}}}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/14.json

SHA-256 `95ad22ef1ba148756e12e8f1155875bd0392fa9e8a6ae032315f332763619d66`; 261 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "5d98419f478f626c4da355eab72e94b803b2b91167d56c5fa7ba6d2a4aed64e1",
  "status": 400,
  "response": "{\"error\":\"image 1: image source must be inline bytes (a data: URL or base64); 'file:' URLs are not fetched\"}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/15.json

SHA-256 `9b63139ad2961ed30778e1ce70060e86d0ef968af52cc928dc5fbbcb67a535aa`; 196 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "a6e1796233bc26506dac1003eccff0eddd1c6c12126436ccbb029f1263635021",
  "status": 400,
  "response": "{\"error\":\"image 1: failed to decode image\"}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/responses/16.json

SHA-256 `95a9c412111960be72fbe34c0b97478d7df74b83f35a3a48d5bf7f4e75839fe8`; 287 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "70a658bba3e4d71f3789d707d8c5abe7af1fa787f949aace2be7d116c8bce328",
  "status": 400,
  "response": "{\"error\":\"image 1: image data is incomplete \u2014 it ends mid-file, so it was probably truncated in transit; send the whole picture\"}"
}

```

## .build/optimization/vision-serving-padding-reuse-v25/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/vision-serving-padding-reuse-v25/stdout.txt

SHA-256 `50d51eb5ac538387d9db71964eb057639e6637e94482daa8394b86912ae98972`; 1243 bytes.

```
PASS  ollama /api/chat answers an image request
PASS  and it recognises the dog
      -> 'Dog nose close-up' in 13.0s, 725 prompt tokens
PASS  the picture is worth its 702 placeholder tokens, plus the two sentinels
PASS  /v1/chat/completions answers an image_url part
PASS  and it sees the fruit on the tree
      -> 'Green citrus fruit'
PASS  /api/generate answers an image request
PASS  and it recognises the dog there too
PASS  the fx gateway accepts an image file part
PASS  and answers about the dog
PASS  and still refuses a file part that is not an image
PASS  two pictures in one turn are accepted
PASS  and they arrive in the order they were sent
      -> 'dog, pomelo'
PASS  a follow-up turn on the same picture succeeds
PASS  and reuses the state instead of re-running the tower
      -> first 11.6s, follow-up 1.4s
PASS  the same words with a different picture get a different answer
PASS  duplicate images preserve the visible subject
PASS  duplicate image work is counted
PASS  duplicate images execute the tower once
PASS  a file:// image is a 400
PASS  that says URLs are not fetched
PASS  bytes that are not an image are a 400
PASS  a truncated image is a 400, not a blank description

22 passed, 0 failed
VISION SERVING PASS

```

## .build/optimization/vision-serving-padding-reuse-v25/vision_serving.py

SHA-256 `94bb5f7f3e78554612c6fb1dcd4268ad348300322b3f12d88d87c8a6b1d39b24`; 14843 bytes.

```
#!/usr/bin/env python3
"""Every serving surface, with a picture, against a running server.

    Tools/vision_serving.py [port]

Assertions, not a transcript. Its predecessor printed the model's answers and a
trimmed log for a human to read, opened two image files by names that were not
the ones in the repository, and defaulted the model directory to a path on the
contributor's own machine — so it could not run anywhere and, if it had, would
not have failed at anything.

Raw sockets on purpose: this repository's agent sandbox proxies localhost HTTP
clients (CLAUDE.md), and a proxied curl answering for the server is a test that
passes without the server.

The server must already be running (`serve --memory-gb 10 --port N`) with the
vision assets in `Tools/assets/vision_test`.
"""
import base64
import json
import os
import socket
import sys
import time
import hashlib
from pathlib import Path

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ASSETS = os.path.join(ROOT, "Tools", "assets", "vision_test")
DOG = os.path.join(ASSETS, "secret1.jpg")     # a close-up of a dog's face
TREE = os.path.join(ASSETS, "secret2.jpg")    # green citrus on a tree
MODEL = "qwen3.8-flash-next:4bit"

PASS, FAIL = [], []
REQUEST_NUMBER = 0


def ok(name):
    PASS.append(name)
    print(f"PASS  {name}", flush=True)


def bad(name, detail=""):
    FAIL.append(name)
    print(f"FAIL  {name}" + (f"\n        {detail}" if detail else ""), flush=True)


def check(name, cond, detail=""):
    ok(name) if cond else bad(name, detail)


def post(port, path, obj, timeout=1800):
    """One HTTP/1.1 POST over a raw socket. Returns (status, body)."""
    body = json.dumps(obj).encode()
    head = (
        f"POST {path} HTTP/1.1\r\nHost: 127.0.0.1:{port}\r\n"
        f"Content-Type: application/json\r\nContent-Length: {len(body)}\r\n"
        "Connection: close\r\n\r\n"
    ).encode()
    try:
        s = socket.create_connection(("127.0.0.1", port), timeout=timeout)
    except OSError as e:
        # A server the kernel killed mid-suite is not a vision failure, and a
        # traceback here would report it as one.
        return 0, f"connection failed: {e}"
    s.settimeout(timeout)
    s.sendall(head + body)
    buf = b""
    while True:
        try:
            d = s.recv(1 << 16)
        except socket.timeout:
            break
        if not d:
            break
        buf += d
    s.close()
    if not buf:
        return 0, ""
    header, _, rest = buf.partition(b"\r\n\r\n")
    status = int(header.split(b" ")[1]) if b" " in header else 0
    if b"Transfer-Encoding: chunked" in header:
        out, i = bytearray(), 0
        while i < len(rest):
            j = rest.find(b"\r\n", i)
            if j < 0:
                break
            try:
                n = int(rest[i:j].split(b";")[0], 16)
            except ValueError:
                break
            if n == 0:
                break
            out += rest[j + 2 : j + 2 + n]
            i = j + 2 + n + 2
        rest = bytes(out)
    text = rest.decode("utf-8", "replace")
    if capture := os.environ.get('SLOTSTREAM_VISION_CAPTURE_DIR'):
        global REQUEST_NUMBER
        REQUEST_NUMBER += 1
        directory = Path(capture); directory.mkdir(parents=True, exist_ok=True)
        # Exact request bytes are reconstructible from this frozen script and
        # the image fixtures; their digest is retained without copying every
        # repeated base64 image into the response ledger.
        (directory/f'{REQUEST_NUMBER:02d}.json').write_text(json.dumps({
            'path': path, 'request_sha256': hashlib.sha256(body).hexdigest(),
            'status': status, 'response': text}, indent=2)+'\n')
    return status, text


def b64(path):
    with open(path, "rb") as f:
        return base64.b64encode(f.read()).decode()


def chat(port, messages, **extra):
    payload = {"model": MODEL, "stream": False, "messages": messages, "think": False,
               "options": {"num_predict": 32, "temperature": 0, "seed": 7}}
    payload.update(extra)
    t0 = time.time()
    status, text = post(port, "/api/chat", payload)
    try:
        obj = json.loads(text)
    except json.JSONDecodeError:
        return status, {}, time.time() - t0, text
    return status, obj, time.time() - t0, text


def says(reply, *words):
    """Does the answer mention any of these? Case-insensitive."""
    low = reply.lower()
    return any(w in low for w in words)


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    port = int(args[0]) if args else 11434
    for p in (DOG, TREE):
        if not os.path.exists(p):
            print(f"missing asset {p}")
            return 1

    status, text = post(port, "/api/version", {})
    if status not in (200, 405, 404):
        print(f"no server on {port} (status {status})")
        return 1

    dog, tree = b64(DOG), b64(TREE)

    # 1. Ollama dialect: base64 in `images`. The model must describe the
    #    picture, which is the only end-to-end proof the tower's rows reached
    #    the language model at the right positions — every wiring bug in this
    #    feature produces confident text about nothing in particular.
    st, obj, secs, raw = chat(
        port,
        [{"role": "user", "content": "In three words, what animal is this?",
          "images": [dog]}])
    reply = obj.get("message", {}).get("content", "")
    check("ollama /api/chat answers an image request", st == 200, raw[:200])
    check("and it recognises the dog", says(reply, "dog", "puppy", "canine"), reply[:120])
    print(f"      -> {reply.strip()[:100]!r} in {secs:.1f}s, "
          f"{obj.get('prompt_eval_count')} prompt tokens")
    dog_tokens = obj.get("prompt_eval_count", 0)

    # 2. A picture costs real tokens, and the count must match the geometry the
    #    weights-free check pins (846x859 -> 702 tokens for this asset).
    st, obj, _, _ = chat(port, [{"role": "user", "content": "In three words, what animal is this?"}])
    text_tokens = obj.get("prompt_eval_count", 0)
    # 702 placeholders (the geometry `vision-check` pins for this 846x859
    # asset) plus the template's own <|vision_start|> and <|vision_end|>.
    check(
        "the picture is worth its 702 placeholder tokens, plus the two sentinels",
        dog_tokens - text_tokens == 704,
        f"{dog_tokens} - {text_tokens} = {dog_tokens - text_tokens}")

    # 3. OpenAI dialect: an image_url part with a data: URL.
    st, text = post(
        port, "/v1/chat/completions",
        {"model": MODEL, "max_tokens": 32, "temperature": 0, "seed": 7, "messages": [{
            "role": "user",
            "content": [
                {"type": "image_url",
                 "image_url": {"url": "data:image/jpeg;base64," + tree}},
                {"type": "text", "text": "In three words, what is growing here?"},
            ]}]})
    obj = json.loads(text) if text.startswith("{") else {}
    reply = (obj.get("choices") or [{}])[0].get("message", {}).get("content", "")
    check("/v1/chat/completions answers an image_url part", st == 200, text[:200])
    check(
        "and it sees the fruit on the tree",
        says(reply, "citrus", "fruit", "lime", "grapefruit", "pomelo", "orange", "lemon", "tree"),
        reply[:120])
    print(f"      -> {reply.strip()[:100]!r}")

    # 4. Ollama /api/generate, the other half of that dialect.
    st, text = post(
        port, "/api/generate",
        {"model": MODEL, "stream": False, "prompt": "In three words, what animal is this?",
         "images": [dog], "think": False, "options": {"num_predict": 32, "temperature": 0, "seed": 7}})
    obj = json.loads(text) if text.startswith("{") else {}
    check("/api/generate answers an image request", st == 200, text[:200])
    check(
        "and it recognises the dog there too",
        says(obj.get("response", ""), "dog", "puppy", "canine"),
        obj.get("response", "")[:120])

    # 5. The fx gateway: a `file` part with an image media type.
    # The model is named by the route, not the body: an unknown body field is
    # a 400 by design, so the shape here is the one fx actually sends.
    st, text = post(
        port, "/v3/ai/language-model",
        {"prompt": [{
            "role": "user",
            "content": [
                {"type": "file", "mediaType": "image/jpeg", "data": dog},
                {"type": "text", "text": "In three words, what animal is this?"},
            ]}],
         "toolChoice": {"type": "auto"}, "maxOutputTokens": 32, "temperature": 0, "seed": 7})
    check("the fx gateway accepts an image file part", st == 200, text[:300])
    check(
        "and answers about the dog",
        says(text, "dog", "puppy", "canine"), text[-400:])
    st, text = post(
        port, "/v3/ai/language-model",
        {"prompt": [{
            "role": "user",
            "content": [{"type": "file", "mediaType": "application/pdf", "data": dog}]}],
         "toolChoice": {"type": "auto"}, "maxOutputTokens": 8})
    check(
        "and still refuses a file part that is not an image",
        "unsupported_file_part" in text, text[:300])

    # 6. Two pictures in one conversation, in order. A swapped pair is the
    #    failure this cannot be allowed to have: both answers stay fluent.
    st, obj, _, raw = chat(
        port,
        [{"role": "user",
          "content": [
              {"type": "image_url", "image_url": {"url": "data:image/jpeg;base64," + dog}},
              {"type": "image_url", "image_url": {"url": "data:image/jpeg;base64," + tree}},
              {"type": "text",
               "text": "Answer with exactly two words separated by a comma: "
                       "the subject of the first picture, then of the second."},
          ]}])
    reply = obj.get("message", {}).get("content", "")
    check("two pictures in one turn are accepted", st == 200, raw[:200])
    check(
        "and they arrive in the order they were sent",
        says(reply, "dog", "puppy") and says(reply, "fruit", "citrus", "tree", "lime",
                                             "pomelo", "grapefruit", "orange"),
        reply[:160])
    print(f"      -> {reply.strip()[:100]!r}")

    # 7. Prefix reuse. A follow-up turn extends the previous prompt, so the
    #    state is handed over whole: the tower does not run again and prefill
    #    reads only new text. Benchmark observations prove reuse directly;
    #    a short elapsed time alone is not evidence that a cache was used.
    history = [
        {"role": "user", "content": "Say only: ok",
         "images": [dog]},
    ]
    st, obj, first_secs, _ = chat(port, history)
    first_stats = obj.get('slotstream_benchmark', {}).get('stats', {})
    history.append({"role": "assistant", "content": obj.get("message", {}).get("content", "")})
    history.append({"role": "user", "content": "Now say only: still ok"})
    st, obj, second_secs, raw = chat(port, history)
    second_stats = obj.get('slotstream_benchmark', {}).get('stats', {})
    check("a follow-up turn on the same picture succeeds", st == 200, raw[:200])
    check(
        "and reuses the state instead of re-running the tower",
        first_stats.get('encodedImages') == 1 and second_stats.get('encodedImages') == 0
        and second_stats.get('reusedPrefixTokens', 0) > 0 and second_stats.get('prefixSkippedImages') == 1,
        f"encoded first={first_stats.get('encodedImages')}, follow-up={second_stats.get('encodedImages')}, "
        f"reused={second_stats.get('reusedPrefixTokens')}; requires SLOTSTREAM_BENCH_DETAILS=1")
    print(f"      -> first {first_secs:.1f}s, follow-up {second_secs:.1f}s")

    # 8. The same ids with a different picture must NOT reuse. Both images
    #    resize to different grids, so to make the ids identical the second
    #    request replays the first conversation with the other picture at the
    #    same place — a cache keyed on ids alone would answer from the dog's
    #    state about the tree.
    st, obj, _, _ = chat(
        port, [{"role": "user", "content": "In three words, what is this?", "images": [dog]}])
    first = obj.get("message", {}).get("content", "")
    st, obj, _, _ = chat(
        port, [{"role": "user", "content": "In three words, what is this?", "images": [tree]}])
    second = obj.get("message", {}).get("content", "")
    check(
        "the same words with a different picture get a different answer",
        says(first, "dog", "puppy", "canine")
        and not says(second, "dog", "puppy", "canine"),
        f"{first[:60]!r} then {second[:60]!r}")

    st, obj, _, raw = chat(port, [{'role': 'user', 'images': [dog, dog],
        'content': 'What animal is shown in both images? Reply in three words.'}])
    reply = obj.get('message', {}).get('content', '')
    observed = obj.get('slotstream_benchmark', {}).get('stats', {})
    check('duplicate images preserve the visible subject', st == 200 and says(reply, 'dog', 'puppy', 'canine'), raw[:200])
    check('duplicate image work is counted', observed.get('encodedImages', -1) + observed.get('reusedImageFeatures', -1) == 2,
          f"encoded={observed.get('encodedImages')}, reused={observed.get('reusedImageFeatures')}")
    if '--expect-image-reuse' in sys.argv:
        check('duplicate images execute the tower once', observed.get('encodedImages') == 1 and observed.get('reusedImageFeatures') == 1,
              f"encoded={observed.get('encodedImages')}, reused={observed.get('reusedImageFeatures')}")

    # 9. Refusals, on the surface a user meets them on.
    st, obj, _, raw = chat(
        port, [{"role": "user",
                "content": [{"type": "image_url",
                             "image_url": {"url": "file:///etc/passwd"}}]}])
    check("a file:// image is a 400", st == 400, f"{st}: {raw[:160]}")
    check("that says URLs are not fetched", "not fetched" in raw, raw[:160])
    st, obj, _, raw = chat(
        port, [{"role": "user", "content": "hi", "images": ["bm90IGFuIGltYWdl"]}])
    check("bytes that are not an image are a 400", st == 400, f"{st}: {raw[:160]}")
    # An upload cut short decodes, in ImageIO, to the rows it has plus blank
    # space — and the model then describes a mostly empty picture with
    # confidence. The container's end marker is what catches it.
    half = base64.b64encode(open(DOG, "rb").read()[: os.path.getsize(DOG) // 2]).decode()
    st, obj, _, raw = chat(port, [{"role": "user", "content": "hi", "images": [half]}])
    check("a truncated image is a 400, not a blank description",
          st == 400 and "incomplete" in raw, f"{st}: {raw[:160]}")

    print()
    print(f"{len(PASS)} passed, {len(FAIL)} failed")
    if FAIL:
        for f in FAIL:
            print(f"  FAILED: {f}")
        return 1
    print("VISION SERVING PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())

```

## .build/optimization/vision-same-geometry-v25/manifest.json

SHA-256 `0001c71621183cb70c3177af12072e45e90702012b4f83336c76044d1e09bada`; 18508 bytes.

```
{
  "classification": "bounded image-serving correctness only; not paired performance evidence",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-vision-padding-v25/slotstream",
    "serve",
    "--port",
    "64016",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--memory-gb",
    "10",
    "--mtp",
    "off",
    "--no-elastic"
  ],
  "test_command": [
    "python3",
    "/Users/carlos/Projects/slotstream/Tools/vision_serving.py",
    "64016",
    "--expect-image-reuse",
    "--same-geometry-only"
  ],
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
      "Sources/Slotstream/Generate.swift": "a9727ce9083dcdc39723ec1bd1c0faef4d8749e6c92ca315ecfe32b556256b67",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "03f029b78801b5215db21f5be2a8e515474726a594f36cda936d2018d853226f",
      "Sources/Slotstream/MTP.swift": "868f0d7d45171d29569f94390feaba02ae567504721e327667fe2bad4dcf73a2",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "5d2cb9e955a52b4b559744c111a6990f4edd4e8465fd27d2a8ec88cc61743cb4",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "bfd0989c009f6866c736ae17fa2f1e14db44fb493d542c14f3619e538ef1604b",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "65be7945e2dd57ec975810e6ba6e5a17cd0b9de4c3b4608b423f04df41352549",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "efe29406a51ab3c02aa6ecee6c566215f63ddc03e196ab0ac975b4d1c8209ae7",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "27aaf2f516d4dd836545837e209acd3aa8fc00f967fbc60eac1d8b2b1c672b00",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "4faccb1ab32f840ff3e03f08c15c33c35d365464063776e96d8dc914ef9ed22c",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "dafcf24e2a43f819719558f0a7613f42427553a779c11c2d959067a6ebe32459",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "c7b8f391c41635975c9c184fa8f78fd107f1e8c6d49678af608dd38d785b56a6",
    "binary_sha256": "866407ae0548668eb15c18b185d13e3f9656a2ea3394f988e6a7bb92f4467b9a",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "source_hashes": {
    "/Users/carlos/Projects/slotstream/Tools/vision_qualification.py": "ed9998c2191b802ca25965d30d381b1b323c599291fce8f6b7c42fa6caa54a2a",
    "/Users/carlos/Projects/slotstream/Tools/vision_serving.py": "46437b7014dfe14a1ab09807fcf9218a267cc79ad7052818dc0d78f556957fce",
    "/Users/carlos/Projects/slotstream/Tools/prefill_bench.py": "0661085989282cccdbcc54645f4f751dc8cd8e50c4de3b8bf21eb047bc65628e",
    "/Users/carlos/Projects/slotstream/Tools/serve_bench.py": "4b5d6a3cd982e408cd2d3eddda119fbeeca3ddd61a3598735d3deb8a6157631d"
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
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33441906688,
    "swapins": 41704048,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   422330.\nPages active:                                1010119.\nPages inactive:                               699923.\nPages speculative:                            319510.\nPages throttled:                                   0.\nPages wired down:                             217800.\nPages purgeable:                                3047.\n\"Translation faults\":                    13777727705.\nPages copy-on-write:                       626957841.\nPages zero filled:                       15321556905.\nPages reactivated:                        2287781405.\nPages purged:                               61699160.\nFile-backed pages:                           1615755.\nAnonymous pages:                              413797.\nPages stored in compressor:                  1413665.\nPages occupied by compressor:                 412681.\nDecompressions:                            962800169.\nCompressions:                             1256740868.\nPageins:                                  5841803096.\nPageouts:                                   10626197.\nSwapins:                                    41704048.\nSwapouts:                                   69922789.\nPages tagged:                                 167415.\nPages tagged resident:                        120595.\nPages tagged compressed:                       46820.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6875.\nPages tag-storage free:                         3600.\nPages tag-storage non-tag pageable:            87821.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7590976.\nTagged compressions:                         9414342.\nTagged decompressions:                       8661235.\n"
  },
  "environment": {
    "SLOTSTREAM_OPT_IMAGE_REUSE": "1",
    "SLOTSTREAM_OPT_VISION_PADDING": "128",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_VISION_CAPTURE_DIR": "/Users/carlos/Projects/slotstream/.build/optimization/vision-same-geometry-v25/responses"
  },
  "fixtures": {
    "/Users/carlos/Projects/slotstream/Tools/assets/vision_test/secret1.jpg": "427250bd24a93e98cac3d4ae83619040aa167dde63fa6e7272117bd9a1a17e7d",
    "/Users/carlos/Projects/slotstream/Tools/assets/vision_test/secret2.jpg": "41802c151fbfc248f0af72790fe0eeba00cbbd6632c3ccd5200fef5421d2610f"
  },
  "exit_code": 1,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33458847744,
    "swapins": 41704048,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   513814.\nPages active:                                 970717.\nPages inactive:                               833795.\nPages speculative:                            136427.\nPages throttled:                                   0.\nPages wired down:                             216324.\nPages purgeable:                                  17.\n\"Translation faults\":                    13778037624.\nPages copy-on-write:                       626958669.\nPages zero filled:                       15322078239.\nPages reactivated:                        2287782147.\nPages purged:                               61702270.\nFile-backed pages:                           1528335.\nAnonymous pages:                              412604.\nPages stored in compressor:                  1413424.\nPages occupied by compressor:                 411508.\nDecompressions:                            962800407.\nCompressions:                             1256740868.\nPageins:                                  5841938592.\nPageouts:                                   10626248.\nSwapins:                                    41704048.\nSwapouts:                                   69922789.\nPages tagged:                                 167597.\nPages tagged resident:                        120778.\nPages tagged compressed:                       46819.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6875.\nPages tag-storage free:                         2942.\nPages tag-storage non-tag pageable:            88479.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7590912.\nTagged compressions:                         9414342.\nTagged decompressions:                       8661236.\n"
  },
  "duration_seconds": 8.346805499999999,
  "sources_unchanged": true,
  "passed": false
}

```

## .build/optimization/vision-same-geometry-v25/prefill_bench.py

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

## .build/optimization/vision-same-geometry-v25/responses/01.json

SHA-256 `ab7208066b2343ff2b96fd55a9ec12bdd2e3fbd7618d79592b6f8ab49b443f93`; 200 bytes.

```
{
  "path": "/api/version",
  "request_sha256": "44136fa355b3678a1146ad16f7e8649e94fb4fc21fe77e8310c060f61caaff8a",
  "status": 404,
  "response": "{\"error\":\"not found: POST \\/api\\/version\"}"
}

```

## .build/optimization/vision-same-geometry-v25/responses/02.json

SHA-256 `3eab97f97dc6e330d895587bc165720ebdc4c9ada6b06a0dd440f3919be6a2fc`; 4148 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "7af99267e4d24008e1691038be025f88c096b443b128a48d09253125d581609a",
  "status": 200,
  "response": "{\"done_reason\":\"stop\",\"slotstream_benchmark\":{\"effective_prefill_chunk\":256,\"stats\":{\"decodeIOSeconds\":0.10638987599999998,\"draftSeconds\":0,\"reusedImageFeatures\":0,\"prefillPhysicalFootprintBytes\":7849546096,\"prefillTokens\":89,\"prefillRowSortSeconds\":0,\"encodedImages\":1,\"abortedReadScopes\":0,\"ngramCachePayloadBytes\":291840,\"expertHitRate\":0.043749999999999997,\"queueSeconds\":0,\"finishReason\":\"stop\",\"mlxCacheEndBytes\":229921030,\"sampledFootprint\":{\"samples\":171,\"intervalMilliseconds\":20,\"peakBytes\":7856066976},\"tokenCallbackSeconds\":4.1999999999999999e-08,\"prefillScatterSeconds\":0.0072087489999999995,\"prefillRecords\":9528,\"allocatedSequenceBytes\":28311552,\"generatorSystemBefore\":{\"thermalState\":\"nominal\",\"lowPowerModeEnabled\":false},\"draftedTokens\":0,\"decodeForwardPasses\":1,\"mlxActiveEndBytes\":6637838992,\"verifyPasses\":0,\"reconciledHeadTokens\":0,\"generatorVMBefore\":{\"swapins\":41704048,\"reclaimableBytes\":30101323776,\"swapouts\":69922789},\"imageEncodeSeconds\":0.067337833,\"decodeReadBytes\":1269043200,\"generatorSystemAfter\":{\"thermalState\":\"nominal\",\"lowPowerModeEnabled\":false},\"prefillReadBytes\":26343014400,\"ngramCachedRows\":456,\"prefillMLXCacheBytes\":145976730,\"promptTokens\":89,\"reusedHeadTokens\":0,\"interTokenSeconds\":[],\"prefillComputePasses\":[89],\"acceptedDrafts\":0,\"mlxPeakMemoryGB\":7.3141274159999998,\"decodeModelTokens\":1,\"verifySeconds\":0,\"requestSeconds\":3.3906703330000001,\"prefillPasses\":[89],\"prefillGPUWaitSeconds\":0,\"ngramRowHits\":0,\"prefillMLXActiveBytes\":6715930668,\"peakMemoryGB\":7.8560669760000001,\"decodeScatterSeconds\":0.0008752039999999999,\"ngramRowMisses\":16,\"prefillIOSeconds\":1.8928972560000015,\"decodeSeconds\":0.22504270800000001,\"decodeRecords\":459,\"reusedPrefixTokens\":0,\"sampleSeconds\":0.001297875,\"lifetimeRSSPeakBytes\":4808376320,\"reconciliationSeconds\":0,\"generatorVMAfter\":{\"swapins\":41704048,\"reclaimableBytes\":27968241664,\"swapouts\":69922789},\"decodeTokens\":1,\"prefillSeconds\":3.0977822499999998,\"firstTokenSeconds\":3.1659575420000001,\"prefixSkippedImages\":0,\"sharedExpertPrelaunches\":0,\"physicalFootprintEndBytes\":7856066976},\"effective_pool_slots\":961,\"effective_mtp\":false,\"prompt_ids\":[248045,846,198,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,3710,1829,39248,279,2099,30,21134,303,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271],\"optimizations\":{\"compactScopeFrontier\":false,\"tailAwarePrefill\":false,\"incrementalIndexer\":false,\"workspacePiecewiseWrites\":false,\"valueOnlySamplerThreshold\":false,\"compactMTPRow\":false,\"deduplicateImages\":true,\"skipUnusedFinalForward\":false,\"sharedRoPE\":false,\"fusedGDNRecording\":false,\"indexerBlockTopK\":false,\"layerExpertWorkspace\":false,\"routerTopK\":false,\"boundedIndexer\":false,\"workspaceTokenTile\":256,\"visionAttentionPadding\":128,\"overlapSharedExpert\":false,\"demandedPrefillOutput\":false,\"compactStateWindows\":false,\"boundedOutputQueue\":false,\"boundedPLE\":false,\"disjointSweepOutput\":false,\"readScopeTokens\":0,\"boundedDraftTail\":false,\"reuseFirstMTPEntry\":false,\"denseIndexerBypass\":false,\"compactNgramRows\":false,\"boundedSweepRows\":false},\"output_ids\":[3605]},\"prompt_eval_duration\":3097782250,\"done\":true,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-05T10:05:40Z\",\"message\":{\"role\":\"assistant\",\"content\":\" Red\"},\"eval_count\":1,\"eval_duration\":225042708,\"total_duration\":3391524042,\"prompt_eval_count\":89}"
}

```

## .build/optimization/vision-same-geometry-v25/responses/03.json

SHA-256 `7d1430e4411bcc4934ca03811ad732f4b9528360647a98d3afc1171a0889db05`; 4311 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "784e77897e3b6617ecc5f9ccc1b46b39bfa87a5b750a3697aae01956fabcbad0",
  "status": 200,
  "response": "{\"eval_count\":1,\"eval_duration\":231740500,\"total_duration\":3889855000,\"slotstream_benchmark\":{\"optimizations\":{\"compactScopeFrontier\":false,\"tailAwarePrefill\":false,\"incrementalIndexer\":false,\"workspacePiecewiseWrites\":false,\"valueOnlySamplerThreshold\":false,\"compactMTPRow\":false,\"deduplicateImages\":true,\"skipUnusedFinalForward\":false,\"sharedRoPE\":false,\"fusedGDNRecording\":false,\"indexerBlockTopK\":false,\"layerExpertWorkspace\":false,\"routerTopK\":false,\"boundedIndexer\":false,\"workspaceTokenTile\":256,\"visionAttentionPadding\":128,\"overlapSharedExpert\":false,\"demandedPrefillOutput\":false,\"compactStateWindows\":false,\"boundedOutputQueue\":false,\"boundedPLE\":false,\"disjointSweepOutput\":false,\"readScopeTokens\":0,\"boundedDraftTail\":false,\"reuseFirstMTPEntry\":false,\"denseIndexerBypass\":false,\"compactNgramRows\":false,\"boundedSweepRows\":false},\"effective_pool_slots\":961,\"effective_mtp\":false,\"output_ids\":[10025],\"prompt_ids\":[248045,846,198,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,3710,1829,39248,279,2099,30,21134,303,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271,5844,248046,198,248045,846,198,1349,279,1829,314,279,2099,11,29890,279,6575,4087,13,5272,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271],\"effective_prefill_chunk\":256,\"stats\":{\"decodeIOSeconds\":0.10938591500000001,\"draftSeconds\":0,\"reusedImageFeatures\":0,\"prefillPhysicalFootprintBytes\":8347996696,\"prefillTokens\":120,\"prefillRowSortSeconds\":0,\"encodedImages\":1,\"abortedReadScopes\":0,\"ngramCachePayloadBytes\":476160,\"expertHitRate\":0.039583333333333331,\"queueSeconds\":2.91e-07,\"finishReason\":\"stop\",\"mlxCacheEndBytes\":480326054,\"sampledFootprint\":{\"samples\":196,\"intervalMilliseconds\":20,\"peakBytes\":8351273496},\"tokenCallbackSeconds\":0,\"prefillScatterSeconds\":0.007987372999999992,\"prefillRecords\":10851,\"allocatedSequenceBytes\":28311552,\"generatorSystemBefore\":{\"thermalState\":\"nominal\",\"lowPowerModeEnabled\":false},\"draftedTokens\":0,\"decodeForwardPasses\":1,\"mlxActiveEndBytes\":6786945704,\"verifyPasses\":0,\"reconciledHeadTokens\":0,\"generatorVMBefore\":{\"swapins\":41704048,\"reclaimableBytes\":27968307200,\"swapouts\":69922789},\"imageEncodeSeconds\":0.047382874999999998,\"decodeReadBytes\":1274572800,\"generatorSystemAfter\":{\"thermalState\":\"nominal\",\"lowPowerModeEnabled\":false},\"prefillReadBytes\":30000844800,\"ngramCachedRows\":744,\"prefillMLXCacheBytes\":387002790,\"promptTokens\":120,\"reusedHeadTokens\":0,\"interTokenSeconds\":[],\"prefillComputePasses\":[120],\"acceptedDrafts\":0,\"mlxPeakMemoryGB\":7.5426285379999998,\"decodeModelTokens\":1,\"verifySeconds\":0,\"requestSeconds\":3.8896798330000002,\"prefillPasses\":[120],\"prefillGPUWaitSeconds\":0,\"ngramRowHits\":0,\"prefillMLXActiveBytes\":6877209256,\"peakMemoryGB\":8.3512734959999992,\"decodeScatterSeconds\":0.0008651649999999999,\"ngramRowMisses\":16,\"prefillIOSeconds\":2.1575576249999999,\"decodeSeconds\":0.23174049999999999,\"decodeRecords\":461,\"reusedPrefixTokens\":0,\"sampleSeconds\":0.00044320900000000002,\"lifetimeRSSPeakBytes\":4906467328,\"reconciliationSeconds\":0,\"generatorVMAfter\":{\"swapins\":41704048,\"reclaimableBytes\":26839760896,\"swapouts\":69922789},\"decodeTokens\":1,\"prefillSeconds\":3.6104788339999998,\"firstTokenSeconds\":3.6581149169999998,\"prefixSkippedImages\":0,\"sharedExpertPrelaunches\":0,\"physicalFootprintEndBytes\":8351273496}},\"done_reason\":\"stop\",\"created_at\":\"2026-09-05T10:05:43Z\",\"done\":true,\"model\":\"qwen3.8-flash-next:4bit\",\"prompt_eval_count\":120,\"prompt_eval_duration\":3610478834,\"message\":{\"role\":\"assistant\",\"content\":\"Blue\"}}"
}

```

## .build/optimization/vision-same-geometry-v25/serve_bench.py

SHA-256 `4b5d6a3cd982e408cd2d3eddda119fbeeca3ddd61a3598735d3deb8a6157631d`; 16151 bytes.

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
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
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

## .build/optimization/vision-same-geometry-v25/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/vision-same-geometry-v25/stdout.txt

SHA-256 `45df75e9236a39f1a903b96c0d9889d178b718bd708be630f7108480dd598b2d`; 304 bytes.

```
PASS  same-geometry seed recognises red
FAIL  changed image would extend the cached token IDs
        this must be an eligible textual prefix, otherwise it does not test image identity
PASS  same-geometry changed content misses and re-encodes
PASS  same-geometry changed image is blue
3 passed, 1 failed

```

## .build/optimization/vision-same-geometry-v25/vision_qualification.py

SHA-256 `ed9998c2191b802ca25965d30d381b1b323c599291fce8f6b7c42fa6caa54a2a`; 4490 bytes.

```
#!/usr/bin/env python3
"""Run bounded image-serving correctness against a verified frozen executable."""
import argparse
import json
import os
from pathlib import Path
import shutil
import socket
import subprocess
import time
from prefill_bench import ROOT, digest, model_identity, preflight, vm_snapshot
from serve_bench import wait_ready, stop_server


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binary', type=Path, required=True); p.add_argument('--out', type=Path, required=True)
    p.add_argument('--model', type=Path, default=Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit')
    p.add_argument('--padding', type=int, choices=[0, 80, 128], default=0)
    p.add_argument('--reuse', action='store_true')
    p.add_argument('--case', choices=['all', 'same-geometry'], default='all')
    p.add_argument('--memory-gb', type=float, default=10)
    a = p.parse_args()
    if not 8.1 <= a.memory_gb <= 10: p.error('bounded memory target required')
    binary = a.binary.resolve(); model = a.model.resolve(); out = a.out.resolve()
    identity = json.loads((binary.parent/'build-identity.json').read_text())
    for name, key in [('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'), ('build-source.tar.gz', 'source_archive_sha256')]:
        if digest(binary.parent/name) != identity[key]: raise ValueError('frozen build identity differs')
    out.mkdir(parents=True, exist_ok=False)
    harness = ROOT/'Tools/vision_serving.py'
    sources = [Path(__file__).resolve(), harness, ROOT/'Tools/prefill_bench.py', ROOT/'Tools/serve_bench.py']
    source_hashes = {str(path): digest(path) for path in sources}
    for path in sources: shutil.copy2(path, out/path.name)
    env = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
    env.update({'SLOTSTREAM_OPT_IMAGE_REUSE': str(int(a.reuse)), 'SLOTSTREAM_OPT_VISION_PADDING': str(a.padding),
                'SLOTSTREAM_BENCH_DETAILS': '1', 'SLOTSTREAM_VISION_CAPTURE_DIR': str(out/'responses')})
    with socket.socket() as reservation:
        reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
    command = [str(binary), 'serve', '--port', str(port), '--model', str(model),
               '--memory-gb', str(a.memory_gb), '--mtp', 'off', '--no-elastic']
    test_command = ['python3', str(harness), str(port)]
    if a.reuse: test_command.append('--expect-image-reuse')
    if a.case == 'same-geometry': test_command.append('--same-geometry-only')
    record = {'classification': 'bounded image-serving correctness only; not paired performance evidence',
              'command': command, 'test_command': test_command, 'identity': identity, 'source_hashes': source_hashes,
              'model': model_identity(model), 'before': preflight(a.memory_gb + 6),
              'environment': {k: v for k, v in env.items() if k.startswith('SLOTSTREAM_')},
              'fixtures': {str(path): digest(path) for path in (ROOT/'Tools/assets/vision_test').glob('*.jpg')}}
    server = client = None; started = time.monotonic()
    try:
        with (out/'server.stdout').open('wb') as stdout, (out/'server.stderr').open('wb') as stderr:
            server = subprocess.Popen(command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
            wait_ready(server, port)
            with (out/'stdout.txt').open('wb') as stdout, (out/'stderr.txt').open('wb') as stderr:
                client = subprocess.Popen(test_command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
                record['exit_code'] = client.wait(timeout=900)
    except (KeyboardInterrupt, subprocess.TimeoutExpired) as e:
        record['error'] = type(e).__name__; record['exit_code'] = 130 if isinstance(e, KeyboardInterrupt) else 1
    finally:
        if client is not None: stop_server(client)
        if server is not None: stop_server(server)
        record['after'] = vm_snapshot(); record['duration_seconds'] = time.monotonic() - started
        record['sources_unchanged'] = all(digest(Path(path)) == value for path, value in source_hashes.items())
        record['passed'] = record.get('exit_code') == 0 and record['sources_unchanged']
        (out/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    print(json.dumps({k: record[k] for k in ['passed', 'duration_seconds']}))
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())

```

## .build/optimization/vision-same-geometry-v25/vision_serving.py

SHA-256 `46437b7014dfe14a1ab09807fcf9218a267cc79ad7052818dc0d78f556957fce`; 17270 bytes.

```
#!/usr/bin/env python3
"""Every serving surface, with a picture, against a running server.

    Tools/vision_serving.py [port]

Assertions, not a transcript. Its predecessor printed the model's answers and a
trimmed log for a human to read, opened two image files by names that were not
the ones in the repository, and defaulted the model directory to a path on the
contributor's own machine — so it could not run anywhere and, if it had, would
not have failed at anything.

Raw sockets on purpose: this repository's agent sandbox proxies localhost HTTP
clients (CLAUDE.md), and a proxied curl answering for the server is a test that
passes without the server.

The server must already be running (`serve --memory-gb 10 --port N`) with the
vision assets in `Tools/assets/vision_test`.
"""
import base64
import json
import os
import socket
import sys
import time
import hashlib
import struct
import zlib
from pathlib import Path

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ASSETS = os.path.join(ROOT, "Tools", "assets", "vision_test")
DOG = os.path.join(ASSETS, "secret1.jpg")     # a close-up of a dog's face
TREE = os.path.join(ASSETS, "secret2.jpg")    # green citrus on a tree
MODEL = "qwen3.8-flash-next:4bit"

PASS, FAIL = [], []
REQUEST_NUMBER = 0


def ok(name):
    PASS.append(name)
    print(f"PASS  {name}", flush=True)


def bad(name, detail=""):
    FAIL.append(name)
    print(f"FAIL  {name}" + (f"\n        {detail}" if detail else ""), flush=True)


def check(name, cond, detail=""):
    ok(name) if cond else bad(name, detail)


def post(port, path, obj, timeout=1800):
    """One HTTP/1.1 POST over a raw socket. Returns (status, body)."""
    body = json.dumps(obj).encode()
    head = (
        f"POST {path} HTTP/1.1\r\nHost: 127.0.0.1:{port}\r\n"
        f"Content-Type: application/json\r\nContent-Length: {len(body)}\r\n"
        "Connection: close\r\n\r\n"
    ).encode()
    try:
        s = socket.create_connection(("127.0.0.1", port), timeout=timeout)
    except OSError as e:
        # A server the kernel killed mid-suite is not a vision failure, and a
        # traceback here would report it as one.
        return 0, f"connection failed: {e}"
    s.settimeout(timeout)
    s.sendall(head + body)
    buf = b""
    while True:
        try:
            d = s.recv(1 << 16)
        except socket.timeout:
            break
        if not d:
            break
        buf += d
    s.close()
    if not buf:
        return 0, ""
    header, _, rest = buf.partition(b"\r\n\r\n")
    status = int(header.split(b" ")[1]) if b" " in header else 0
    if b"Transfer-Encoding: chunked" in header:
        out, i = bytearray(), 0
        while i < len(rest):
            j = rest.find(b"\r\n", i)
            if j < 0:
                break
            try:
                n = int(rest[i:j].split(b";")[0], 16)
            except ValueError:
                break
            if n == 0:
                break
            out += rest[j + 2 : j + 2 + n]
            i = j + 2 + n + 2
        rest = bytes(out)
    text = rest.decode("utf-8", "replace")
    if capture := os.environ.get('SLOTSTREAM_VISION_CAPTURE_DIR'):
        global REQUEST_NUMBER
        REQUEST_NUMBER += 1
        directory = Path(capture); directory.mkdir(parents=True, exist_ok=True)
        # Exact request bytes are reconstructible from this frozen script and
        # the image fixtures; their digest is retained without copying every
        # repeated base64 image into the response ledger.
        (directory/f'{REQUEST_NUMBER:02d}.json').write_text(json.dumps({
            'path': path, 'request_sha256': hashlib.sha256(body).hexdigest(),
            'status': status, 'response': text}, indent=2)+'\n')
    return status, text


def b64(path):
    with open(path, "rb") as f:
        return base64.b64encode(f.read()).decode()


def chat(port, messages, **extra):
    payload = {"model": MODEL, "stream": False, "messages": messages, "think": False,
               "options": {"num_predict": 32, "temperature": 0, "seed": 7}}
    payload.update(extra)
    t0 = time.time()
    status, text = post(port, "/api/chat", payload)
    try:
        obj = json.loads(text)
    except json.JSONDecodeError:
        return status, {}, time.time() - t0, text
    return status, obj, time.time() - t0, text


def says(reply, *words):
    """Does the answer mention any of these? Case-insensitive."""
    low = reply.lower()
    return any(w in low for w in words)


def solid_image_base64(rgb):
    """Deterministic equal-geometry inputs; no external image service or file."""
    def chunk(kind, data):
        return struct.pack('>I', len(data)) + kind + data + struct.pack('>I', zlib.crc32(kind + data) & 0xffffffff)
    pixels = b''.join(b'\x00' + bytes(rgb) * 256 for _ in range(256))
    png = b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>2I5B', 256, 256, 8, 2, 0, 0, 0))
    png += chunk(b'IDAT', zlib.compress(pixels)) + chunk(b'IEND', b'')
    return base64.b64encode(png).decode()


def same_geometry_invalidation(port):
    red, blue = solid_image_base64((255, 0, 0)), solid_image_base64((0, 0, 255))
    question = 'What color fills the image? Answer in one word.'
    st, first, _, raw = chat(port, [{'role': 'user', 'content': question, 'images': [red]}])
    answer = first.get('message', {}).get('content', '')
    check('same-geometry seed recognises red', st == 200 and says(answer, 'red'), raw[:200])
    a = first.get('slotstream_benchmark', {})
    history = [{'role': 'user', 'content': question, 'images': [blue]},
               {'role': 'assistant', 'content': answer},
               {'role': 'user', 'content': 'State the color of the image, ignoring the earlier answer. Use one word.'}]
    st, second, _, raw = chat(port, history)
    b = second.get('slotstream_benchmark', {})
    held = a.get('prompt_ids', []) + a.get('output_ids', [])
    incoming = b.get('prompt_ids', [])
    check('changed image would extend the cached token IDs', bool(held) and len(incoming) > len(held) and incoming[:len(held)] == held,
          'this must be an eligible textual prefix, otherwise it does not test image identity')
    stats = b.get('stats', {})
    check('same-geometry changed content misses and re-encodes', stats.get('reusedPrefixTokens') == 0 and stats.get('encodedImages') == 1,
          f"reused={stats.get('reusedPrefixTokens')}, encoded={stats.get('encodedImages')}")
    answer = second.get('message', {}).get('content', '')
    check('same-geometry changed image is blue', st == 200 and says(answer, 'blue') and not says(answer, 'red'), answer)


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    port = int(args[0]) if args else 11434
    for p in (DOG, TREE):
        if not os.path.exists(p):
            print(f"missing asset {p}")
            return 1

    status, text = post(port, "/api/version", {})
    if status not in (200, 405, 404):
        print(f"no server on {port} (status {status})")
        return 1

    if "--same-geometry-only" in sys.argv:
        same_geometry_invalidation(port)
        print(f"{len(PASS)} passed, {len(FAIL)} failed")
        return 1 if FAIL else 0

    dog, tree = b64(DOG), b64(TREE)

    # 1. Ollama dialect: base64 in `images`. The model must describe the
    #    picture, which is the only end-to-end proof the tower's rows reached
    #    the language model at the right positions — every wiring bug in this
    #    feature produces confident text about nothing in particular.
    st, obj, secs, raw = chat(
        port,
        [{"role": "user", "content": "In three words, what animal is this?",
          "images": [dog]}])
    reply = obj.get("message", {}).get("content", "")
    check("ollama /api/chat answers an image request", st == 200, raw[:200])
    check("and it recognises the dog", says(reply, "dog", "puppy", "canine"), reply[:120])
    print(f"      -> {reply.strip()[:100]!r} in {secs:.1f}s, "
          f"{obj.get('prompt_eval_count')} prompt tokens")
    dog_tokens = obj.get("prompt_eval_count", 0)

    # 2. A picture costs real tokens, and the count must match the geometry the
    #    weights-free check pins (846x859 -> 702 tokens for this asset).
    st, obj, _, _ = chat(port, [{"role": "user", "content": "In three words, what animal is this?"}])
    text_tokens = obj.get("prompt_eval_count", 0)
    # 702 placeholders (the geometry `vision-check` pins for this 846x859
    # asset) plus the template's own <|vision_start|> and <|vision_end|>.
    check(
        "the picture is worth its 702 placeholder tokens, plus the two sentinels",
        dog_tokens - text_tokens == 704,
        f"{dog_tokens} - {text_tokens} = {dog_tokens - text_tokens}")

    # 3. OpenAI dialect: an image_url part with a data: URL.
    st, text = post(
        port, "/v1/chat/completions",
        {"model": MODEL, "max_tokens": 32, "temperature": 0, "seed": 7, "messages": [{
            "role": "user",
            "content": [
                {"type": "image_url",
                 "image_url": {"url": "data:image/jpeg;base64," + tree}},
                {"type": "text", "text": "In three words, what is growing here?"},
            ]}]})
    obj = json.loads(text) if text.startswith("{") else {}
    reply = (obj.get("choices") or [{}])[0].get("message", {}).get("content", "")
    check("/v1/chat/completions answers an image_url part", st == 200, text[:200])
    check(
        "and it sees the fruit on the tree",
        says(reply, "citrus", "fruit", "lime", "grapefruit", "pomelo", "orange", "lemon", "tree"),
        reply[:120])
    print(f"      -> {reply.strip()[:100]!r}")

    # 4. Ollama /api/generate, the other half of that dialect.
    st, text = post(
        port, "/api/generate",
        {"model": MODEL, "stream": False, "prompt": "In three words, what animal is this?",
         "images": [dog], "think": False, "options": {"num_predict": 32, "temperature": 0, "seed": 7}})
    obj = json.loads(text) if text.startswith("{") else {}
    check("/api/generate answers an image request", st == 200, text[:200])
    check(
        "and it recognises the dog there too",
        says(obj.get("response", ""), "dog", "puppy", "canine"),
        obj.get("response", "")[:120])

    # 5. The fx gateway: a `file` part with an image media type.
    # The model is named by the route, not the body: an unknown body field is
    # a 400 by design, so the shape here is the one fx actually sends.
    st, text = post(
        port, "/v3/ai/language-model",
        {"prompt": [{
            "role": "user",
            "content": [
                {"type": "file", "mediaType": "image/jpeg", "data": dog},
                {"type": "text", "text": "In three words, what animal is this?"},
            ]}],
         "toolChoice": {"type": "auto"}, "maxOutputTokens": 32, "temperature": 0, "seed": 7})
    check("the fx gateway accepts an image file part", st == 200, text[:300])
    check(
        "and answers about the dog",
        says(text, "dog", "puppy", "canine"), text[-400:])
    st, text = post(
        port, "/v3/ai/language-model",
        {"prompt": [{
            "role": "user",
            "content": [{"type": "file", "mediaType": "application/pdf", "data": dog}]}],
         "toolChoice": {"type": "auto"}, "maxOutputTokens": 8})
    check(
        "and still refuses a file part that is not an image",
        "unsupported_file_part" in text, text[:300])

    # 6. Two pictures in one conversation, in order. A swapped pair is the
    #    failure this cannot be allowed to have: both answers stay fluent.
    st, obj, _, raw = chat(
        port,
        [{"role": "user",
          "content": [
              {"type": "image_url", "image_url": {"url": "data:image/jpeg;base64," + dog}},
              {"type": "image_url", "image_url": {"url": "data:image/jpeg;base64," + tree}},
              {"type": "text",
               "text": "Answer with exactly two words separated by a comma: "
                       "the subject of the first picture, then of the second."},
          ]}])
    reply = obj.get("message", {}).get("content", "")
    check("two pictures in one turn are accepted", st == 200, raw[:200])
    ordered_subjects = reply.split(",", 1)
    check(
        "and they arrive in the order they were sent",
        len(ordered_subjects) == 2 and says(ordered_subjects[0], "dog", "puppy")
        and says(ordered_subjects[1], "fruit", "citrus", "tree", "lime", "pomelo", "grapefruit", "orange"),
        reply[:160])
    print(f"      -> {reply.strip()[:100]!r}")

    # 7. Prefix reuse. A follow-up turn extends the previous prompt, so the
    #    state is handed over whole: the tower does not run again and prefill
    #    reads only new text. Benchmark observations prove reuse directly;
    #    a short elapsed time alone is not evidence that a cache was used.
    history = [
        {"role": "user", "content": "Say only: ok",
         "images": [dog]},
    ]
    st, obj, first_secs, _ = chat(port, history)
    first_stats = obj.get('slotstream_benchmark', {}).get('stats', {})
    history.append({"role": "assistant", "content": obj.get("message", {}).get("content", "")})
    history.append({"role": "user", "content": "Now say only: still ok"})
    st, obj, second_secs, raw = chat(port, history)
    second_stats = obj.get('slotstream_benchmark', {}).get('stats', {})
    check("a follow-up turn on the same picture succeeds", st == 200, raw[:200])
    check(
        "and reuses the state instead of re-running the tower",
        first_stats.get('encodedImages') == 1 and second_stats.get('encodedImages') == 0
        and second_stats.get('reusedPrefixTokens', 0) > 0 and second_stats.get('prefixSkippedImages') == 1,
        f"encoded first={first_stats.get('encodedImages')}, follow-up={second_stats.get('encodedImages')}, "
        f"reused={second_stats.get('reusedPrefixTokens')}; requires SLOTSTREAM_BENCH_DETAILS=1")
    print(f"      -> first {first_secs:.1f}s, follow-up {second_secs:.1f}s")

    # 8. The same ids with a different picture must NOT reuse. Both images
    #    resize to different grids, so to make the ids identical the second
    #    request replays the first conversation with the other picture at the
    #    same place — a cache keyed on ids alone would answer from the dog's
    #    state about the tree.
    st, obj, _, _ = chat(
        port, [{"role": "user", "content": "In three words, what is this?", "images": [dog]}])
    first = obj.get("message", {}).get("content", "")
    st, obj, _, _ = chat(
        port, [{"role": "user", "content": "In three words, what is this?", "images": [tree]}])
    second = obj.get("message", {}).get("content", "")
    check(
        "the same words with a different picture get a different answer",
        says(first, "dog", "puppy", "canine")
        and not says(second, "dog", "puppy", "canine"),
        f"{first[:60]!r} then {second[:60]!r}")

    st, obj, _, raw = chat(port, [{'role': 'user', 'images': [dog, dog],
        'content': 'What animal is shown in both images? Reply in three words.'}])
    reply = obj.get('message', {}).get('content', '')
    observed = obj.get('slotstream_benchmark', {}).get('stats', {})
    check('duplicate images preserve the visible subject', st == 200 and says(reply, 'dog', 'puppy', 'canine'), raw[:200])
    check('duplicate image work is counted', observed.get('encodedImages', -1) + observed.get('reusedImageFeatures', -1) == 2,
          f"encoded={observed.get('encodedImages')}, reused={observed.get('reusedImageFeatures')}")
    if '--expect-image-reuse' in sys.argv:
        check('duplicate images execute the tower once', observed.get('encodedImages') == 1 and observed.get('reusedImageFeatures') == 1,
              f"encoded={observed.get('encodedImages')}, reused={observed.get('reusedImageFeatures')}")

    same_geometry_invalidation(port)

    # 9. Refusals, on the surface a user meets them on.
    st, obj, _, raw = chat(
        port, [{"role": "user",
                "content": [{"type": "image_url",
                             "image_url": {"url": "file:///etc/passwd"}}]}])
    check("a file:// image is a 400", st == 400, f"{st}: {raw[:160]}")
    check("that says URLs are not fetched", "not fetched" in raw, raw[:160])
    st, obj, _, raw = chat(
        port, [{"role": "user", "content": "hi", "images": ["bm90IGFuIGltYWdl"]}])
    check("bytes that are not an image are a 400", st == 400, f"{st}: {raw[:160]}")
    # An upload cut short decodes, in ImageIO, to the rows it has plus blank
    # space — and the model then describes a mostly empty picture with
    # confidence. The container's end marker is what catches it.
    half = base64.b64encode(open(DOG, "rb").read()[: os.path.getsize(DOG) // 2]).decode()
    st, obj, _, raw = chat(port, [{"role": "user", "content": "hi", "images": [half]}])
    check("a truncated image is a 400, not a blank description",
          st == 400 and "incomplete" in raw, f"{st}: {raw[:160]}")

    print()
    print(f"{len(PASS)} passed, {len(FAIL)} failed")
    if FAIL:
        for f in FAIL:
            print(f"  FAILED: {f}")
        return 1
    print("VISION SERVING PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())

```

## .build/optimization/vision-same-geometry-v25b/manifest.json

SHA-256 `883da7b24a8cdc076eb1fe9f784363a709fccc6e4562b938665a85c3a7d2848e`; 18502 bytes.

```
{
  "classification": "bounded image-serving correctness only; not paired performance evidence",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-vision-padding-v25/slotstream",
    "serve",
    "--port",
    "64038",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--memory-gb",
    "10",
    "--mtp",
    "off",
    "--no-elastic"
  ],
  "test_command": [
    "python3",
    "/Users/carlos/Projects/slotstream/Tools/vision_serving.py",
    "64038",
    "--expect-image-reuse",
    "--same-geometry-only"
  ],
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
      "Sources/Slotstream/Generate.swift": "a9727ce9083dcdc39723ec1bd1c0faef4d8749e6c92ca315ecfe32b556256b67",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "03f029b78801b5215db21f5be2a8e515474726a594f36cda936d2018d853226f",
      "Sources/Slotstream/MTP.swift": "868f0d7d45171d29569f94390feaba02ae567504721e327667fe2bad4dcf73a2",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "5d2cb9e955a52b4b559744c111a6990f4edd4e8465fd27d2a8ec88cc61743cb4",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "bfd0989c009f6866c736ae17fa2f1e14db44fb493d542c14f3619e538ef1604b",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "65be7945e2dd57ec975810e6ba6e5a17cd0b9de4c3b4608b423f04df41352549",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "efe29406a51ab3c02aa6ecee6c566215f63ddc03e196ab0ac975b4d1c8209ae7",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "27aaf2f516d4dd836545837e209acd3aa8fc00f967fbc60eac1d8b2b1c672b00",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "4faccb1ab32f840ff3e03f08c15c33c35d365464063776e96d8dc914ef9ed22c",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "dafcf24e2a43f819719558f0a7613f42427553a779c11c2d959067a6ebe32459",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "c7b8f391c41635975c9c184fa8f78fd107f1e8c6d49678af608dd38d785b56a6",
    "binary_sha256": "866407ae0548668eb15c18b185d13e3f9656a2ea3394f988e6a7bb92f4467b9a",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "source_hashes": {
    "/Users/carlos/Projects/slotstream/Tools/vision_qualification.py": "ed9998c2191b802ca25965d30d381b1b323c599291fce8f6b7c42fa6caa54a2a",
    "/Users/carlos/Projects/slotstream/Tools/vision_serving.py": "907470b077a40a82d38cee70e5921502dfbe4f3b61e5e2d2a5d72a440cc6bdc3",
    "/Users/carlos/Projects/slotstream/Tools/prefill_bench.py": "0661085989282cccdbcc54645f4f751dc8cd8e50c4de3b8bf21eb047bc65628e",
    "/Users/carlos/Projects/slotstream/Tools/serve_bench.py": "4b5d6a3cd982e408cd2d3eddda119fbeeca3ddd61a3598735d3deb8a6157631d"
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
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32662667264,
    "swapins": 41704056,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   471277.\nPages active:                                 986903.\nPages inactive:                               759214.\nPages speculative:                            248319.\nPages throttled:                                   0.\nPages wired down:                             216579.\nPages purgeable:                               11016.\n\"Translation faults\":                    13779192843.\nPages copy-on-write:                       627015058.\nPages zero filled:                       15335197257.\nPages reactivated:                        2289048912.\nPages purged:                               61709547.\nFile-backed pages:                           1511278.\nAnonymous pages:                              483158.\nPages stored in compressor:                  1387083.\nPages occupied by compressor:                 401679.\nDecompressions:                            962952971.\nCompressions:                             1256870191.\nPageins:                                  5842925562.\nPageouts:                                   10626411.\nSwapins:                                    41704056.\nSwapouts:                                   69922789.\nPages tagged:                                 168861.\nPages tagged resident:                        123841.\nPages tagged compressed:                       45020.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6875.\nPages tag-storage free:                         1684.\nPages tag-storage non-tag pageable:            89737.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7273728.\nTagged compressions:                         9414686.\nTagged decompressions:                       8663290.\n"
  },
  "environment": {
    "SLOTSTREAM_OPT_IMAGE_REUSE": "1",
    "SLOTSTREAM_OPT_VISION_PADDING": "128",
    "SLOTSTREAM_BENCH_DETAILS": "1",
    "SLOTSTREAM_VISION_CAPTURE_DIR": "/Users/carlos/Projects/slotstream/.build/optimization/vision-same-geometry-v25b/responses"
  },
  "fixtures": {
    "/Users/carlos/Projects/slotstream/Tools/assets/vision_test/secret1.jpg": "427250bd24a93e98cac3d4ae83619040aa167dde63fa6e7272117bd9a1a17e7d",
    "/Users/carlos/Projects/slotstream/Tools/assets/vision_test/secret2.jpg": "41802c151fbfc248f0af72790fe0eeba00cbbd6632c3ccd5200fef5421d2610f"
  },
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32681984000,
    "swapins": 41704056,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   510096.\nPages active:                                 978848.\nPages inactive:                               764700.\nPages speculative:                            213110.\nPages throttled:                                   0.\nPages wired down:                             216680.\nPages purgeable:                                3122.\n\"Translation faults\":                    13779546432.\nPages copy-on-write:                       627021827.\nPages zero filled:                       15335735531.\nPages reactivated:                        2289055065.\nPages purged:                               61718658.\nFile-backed pages:                           1481532.\nAnonymous pages:                              475126.\nPages stored in compressor:                  1386819.\nPages occupied by compressor:                 399838.\nDecompressions:                            962953220.\nCompressions:                             1256870191.\nPageins:                                  5842938472.\nPageouts:                                   10626411.\nSwapins:                                    41704056.\nSwapouts:                                   69922789.\nPages tagged:                                 168891.\nPages tagged resident:                        123962.\nPages tagged compressed:                       44929.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6875.\nPages tag-storage free:                         2272.\nPages tag-storage non-tag pageable:            89149.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7260096.\nTagged compressions:                         9414686.\nTagged decompressions:                       8663366.\n"
  },
  "duration_seconds": 7.971545375,
  "sources_unchanged": true,
  "passed": true
}

```

## .build/optimization/vision-same-geometry-v25b/prefill_bench.py

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

## .build/optimization/vision-same-geometry-v25b/responses/01.json

SHA-256 `ab7208066b2343ff2b96fd55a9ec12bdd2e3fbd7618d79592b6f8ab49b443f93`; 200 bytes.

```
{
  "path": "/api/version",
  "request_sha256": "44136fa355b3678a1146ad16f7e8649e94fb4fc21fe77e8310c060f61caaff8a",
  "status": 404,
  "response": "{\"error\":\"not found: POST \\/api\\/version\"}"
}

```

## .build/optimization/vision-same-geometry-v25b/responses/02.json

SHA-256 `c651f05ce7b679316c3624588730c8f2f5555e2cae9f3f157c28145752eb83ba`; 4114 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "50bffd41629178de08cd5eb78cedec202135d46dae67f2bd6cfb323e88e78856",
  "status": 200,
  "response": "{\"eval_duration\":214915167,\"total_duration\":3181935708,\"prompt_eval_count\":82,\"eval_count\":1,\"created_at\":\"2026-09-05T10:10:11Z\",\"message\":{\"role\":\"assistant\",\"content\":\"ok\"},\"slotstream_benchmark\":{\"effective_mtp\":false,\"prompt_ids\":[248045,846,198,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,44240,1132,25,5226,248046,198,248045,74455,198,248068,271,248069,271],\"optimizations\":{\"compactScopeFrontier\":false,\"tailAwarePrefill\":false,\"valueOnlySamplerThreshold\":false,\"incrementalIndexer\":false,\"deduplicateImages\":true,\"workspacePiecewiseWrites\":false,\"compactMTPRow\":false,\"skipUnusedFinalForward\":false,\"sharedRoPE\":false,\"fusedGDNRecording\":false,\"indexerBlockTopK\":false,\"layerExpertWorkspace\":false,\"routerTopK\":false,\"boundedIndexer\":false,\"workspaceTokenTile\":256,\"boundedOutputQueue\":false,\"demandedPrefillOutput\":false,\"boundedPLE\":false,\"compactStateWindows\":false,\"visionAttentionPadding\":128,\"overlapSharedExpert\":false,\"disjointSweepOutput\":false,\"readScopeTokens\":0,\"boundedDraftTail\":false,\"reuseFirstMTPEntry\":false,\"denseIndexerBypass\":false,\"compactNgramRows\":false,\"boundedSweepRows\":false},\"effective_pool_slots\":961,\"stats\":{\"decodeIOSeconds\":0.10249866800000001,\"draftSeconds\":0,\"reusedImageFeatures\":0,\"prefillPhysicalFootprintBytes\":7741641144,\"prefillRowSortSeconds\":0,\"prefillTokens\":82,\"encodedImages\":1,\"abortedReadScopes\":0,\"ngramCachePayloadBytes\":220160,\"expertHitRate\":0.0625,\"queueSeconds\":8.3999999999999998e-08,\"finishReason\":\"stop\",\"mlxCacheEndBytes\":214662588,\"sampledFootprint\":{\"samples\":160,\"intervalMilliseconds\":20,\"peakBytes\":7746212304},\"tokenCallbackSeconds\":4.1000000000000003e-08,\"prefillRecords\":8815,\"prefillScatterSeconds\":0.006831089999999997,\"allocatedSequenceBytes\":28311552,\"generatorSystemBefore\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"draftedTokens\":0,\"mlxActiveEndBytes\":6637773456,\"decodeForwardPasses\":1,\"verifyPasses\":0,\"reconciledHeadTokens\":0,\"generatorVMBefore\":{\"swapouts\":69922789,\"swapins\":41704056,\"reclaimableBytes\":30022877184},\"imageEncodeSeconds\":0.115189167,\"decodeReadBytes\":1244160000,\"generatorSystemAfter\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"prefillReadBytes\":24371712000,\"ngramCachedRows\":344,\"prefillMLXCacheBytes\":138440372,\"promptTokens\":82,\"reusedHeadTokens\":0,\"mlxPeakMemoryGB\":7.2704724220000001,\"prefillComputePasses\":[82],\"interTokenSeconds\":[],\"acceptedDrafts\":0,\"decodeModelTokens\":1,\"verifySeconds\":0,\"requestSeconds\":3.181041542,\"prefillPasses\":[82],\"prefillGPUWaitSeconds\":0,\"ngramRowHits\":0,\"prefillMLXActiveBytes\":6710097848,\"peakMemoryGB\":7.7462123040000002,\"decodeScatterSeconds\":0.00092533100000000005,\"ngramRowMisses\":16,\"prefillIOSeconds\":1.8725700799999998,\"decodeSeconds\":0.21491516699999999,\"decodeRecords\":450,\"reusedPrefixTokens\":0,\"sampleSeconds\":0.001179958,\"lifetimeRSSPeakBytes\":4714332160,\"reconciliationSeconds\":0,\"generatorVMAfter\":{\"swapouts\":69922789,\"swapins\":41704056,\"reclaimableBytes\":29131685888},\"decodeTokens\":1,\"prefillSeconds\":2.8504808750000001,\"firstTokenSeconds\":2.9664275419999999,\"prefixSkippedImages\":0,\"sharedExpertPrelaunches\":0,\"physicalFootprintEndBytes\":7746212304},\"effective_prefill_chunk\":256,\"output_ids\":[547]},\"prompt_eval_duration\":2850480875,\"model\":\"qwen3.8-flash-next:4bit\",\"done\":true,\"done_reason\":\"stop\"}"
}

```

## .build/optimization/vision-same-geometry-v25b/responses/03.json

SHA-256 `772c18762dd52323de6a3dd499ef0f6277b1df29fb38e885c984fde736b9b17d`; 4247 bytes.

```
{
  "path": "/api/chat",
  "request_sha256": "1dd9e2f5098adf562b0012761630f8fab68dbcafc5bc22f2e4a7d23187db63a3",
  "status": 200,
  "response": "{\"message\":{\"content\":\"Blue\",\"role\":\"assistant\"},\"prompt_eval_duration\":3460163917,\"eval_count\":1,\"eval_duration\":223516750,\"slotstream_benchmark\":{\"effective_prefill_chunk\":256,\"effective_mtp\":false,\"optimizations\":{\"compactScopeFrontier\":false,\"tailAwarePrefill\":false,\"valueOnlySamplerThreshold\":false,\"incrementalIndexer\":false,\"deduplicateImages\":true,\"workspacePiecewiseWrites\":false,\"compactMTPRow\":false,\"skipUnusedFinalForward\":false,\"sharedRoPE\":false,\"fusedGDNRecording\":false,\"indexerBlockTopK\":false,\"layerExpertWorkspace\":false,\"routerTopK\":false,\"boundedIndexer\":false,\"workspaceTokenTile\":256,\"boundedOutputQueue\":false,\"demandedPrefillOutput\":false,\"boundedPLE\":false,\"compactStateWindows\":false,\"visionAttentionPadding\":128,\"overlapSharedExpert\":false,\"disjointSweepOutput\":false,\"readScopeTokens\":0,\"boundedDraftTail\":false,\"reuseFirstMTPEntry\":false,\"denseIndexerBypass\":false,\"compactNgramRows\":false,\"boundedSweepRows\":false},\"prompt_ids\":[248045,846,198,248053,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248056,248054,44240,1132,25,5226,248046,198,248045,74455,198,248068,271,248069,271,547,248046,198,248045,846,198,3710,1829,39248,279,2099,30,21134,303,799,3299,13,248046,198,248045,74455,198,248068,271,248069,271],\"effective_pool_slots\":961,\"stats\":{\"decodeIOSeconds\":0.10541429299999999,\"draftSeconds\":0,\"reusedImageFeatures\":0,\"prefillPhysicalFootprintBytes\":8283722360,\"prefillRowSortSeconds\":0,\"prefillTokens\":108,\"encodedImages\":1,\"abortedReadScopes\":0,\"ngramCachePayloadBytes\":378880,\"expertHitRate\":0.041666666666666664,\"queueSeconds\":2.0800000000000001e-07,\"finishReason\":\"stop\",\"mlxCacheEndBytes\":431297980,\"sampledFootprint\":{\"samples\":188,\"intervalMilliseconds\":20,\"peakBytes\":8286933624},\"tokenCallbackSeconds\":0,\"prefillRecords\":10121,\"prefillScatterSeconds\":0.007592664999999997,\"allocatedSequenceBytes\":28311552,\"generatorSystemBefore\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"draftedTokens\":0,\"mlxActiveEndBytes\":6786142888,\"decodeForwardPasses\":1,\"verifyPasses\":0,\"reconciledHeadTokens\":0,\"generatorVMBefore\":{\"swapouts\":69922789,\"swapins\":41704056,\"reclaimableBytes\":29131849728},\"imageEncodeSeconds\":0.039678708,\"decodeReadBytes\":1271808000,\"generatorSystemAfter\":{\"lowPowerModeEnabled\":false,\"thermalState\":\"nominal\"},\"prefillReadBytes\":27982540800,\"ngramCachedRows\":592,\"prefillMLXCacheBytes\":337810868,\"promptTokens\":108,\"reusedHeadTokens\":0,\"mlxPeakMemoryGB\":7.5111098380000003,\"prefillComputePasses\":[108],\"interTokenSeconds\":[],\"acceptedDrafts\":0,\"decodeModelTokens\":1,\"verifySeconds\":0,\"requestSeconds\":3.723449,\"prefillPasses\":[108],\"prefillGPUWaitSeconds\":0,\"ngramRowHits\":0,\"prefillMLXActiveBytes\":6876783280,\"peakMemoryGB\":8.2869336239999996,\"decodeScatterSeconds\":0.0009286260000000001,\"ngramRowMisses\":16,\"prefillIOSeconds\":2.2219370070000015,\"decodeSeconds\":0.22351674999999999,\"decodeRecords\":460,\"reusedPrefixTokens\":0,\"sampleSeconds\":0.00049237499999999997,\"lifetimeRSSPeakBytes\":4891672576,\"reconciliationSeconds\":0,\"generatorVMAfter\":{\"swapouts\":69922789,\"swapins\":41704056,\"reclaimableBytes\":27875852288},\"decodeTokens\":1,\"prefillSeconds\":3.460163917,\"firstTokenSeconds\":3.5001461250000001,\"prefixSkippedImages\":0,\"sharedExpertPrelaunches\":0,\"physicalFootprintEndBytes\":8286933624},\"output_ids\":[10025]},\"done\":true,\"model\":\"qwen3.8-flash-next:4bit\",\"created_at\":\"2026-09-05T10:10:15Z\",\"done_reason\":\"stop\",\"total_duration\":3723622500,\"prompt_eval_count\":108}"
}

```

## .build/optimization/vision-same-geometry-v25b/serve_bench.py

SHA-256 `4b5d6a3cd982e408cd2d3eddda119fbeeca3ddd61a3598735d3deb8a6157631d`; 16151 bytes.

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
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
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

## .build/optimization/vision-same-geometry-v25b/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/vision-same-geometry-v25b/stdout.txt

SHA-256 `d40c14953b5e038440276e0cad998ada23e595fcfac4b5fa7fff5a85d3ba2809`; 221 bytes.

```
PASS  same-geometry seed acknowledges the image
PASS  changed image would extend the cached token IDs
PASS  same-geometry changed content misses and re-encodes
PASS  same-geometry changed image is blue
4 passed, 0 failed

```

## .build/optimization/vision-same-geometry-v25b/vision_qualification.py

SHA-256 `ed9998c2191b802ca25965d30d381b1b323c599291fce8f6b7c42fa6caa54a2a`; 4490 bytes.

```
#!/usr/bin/env python3
"""Run bounded image-serving correctness against a verified frozen executable."""
import argparse
import json
import os
from pathlib import Path
import shutil
import socket
import subprocess
import time
from prefill_bench import ROOT, digest, model_identity, preflight, vm_snapshot
from serve_bench import wait_ready, stop_server


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binary', type=Path, required=True); p.add_argument('--out', type=Path, required=True)
    p.add_argument('--model', type=Path, default=Path.home()/'.slotstream/models/qwen38-flash-next-mlx-4bit')
    p.add_argument('--padding', type=int, choices=[0, 80, 128], default=0)
    p.add_argument('--reuse', action='store_true')
    p.add_argument('--case', choices=['all', 'same-geometry'], default='all')
    p.add_argument('--memory-gb', type=float, default=10)
    a = p.parse_args()
    if not 8.1 <= a.memory_gb <= 10: p.error('bounded memory target required')
    binary = a.binary.resolve(); model = a.model.resolve(); out = a.out.resolve()
    identity = json.loads((binary.parent/'build-identity.json').read_text())
    for name, key in [('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'), ('build-source.tar.gz', 'source_archive_sha256')]:
        if digest(binary.parent/name) != identity[key]: raise ValueError('frozen build identity differs')
    out.mkdir(parents=True, exist_ok=False)
    harness = ROOT/'Tools/vision_serving.py'
    sources = [Path(__file__).resolve(), harness, ROOT/'Tools/prefill_bench.py', ROOT/'Tools/serve_bench.py']
    source_hashes = {str(path): digest(path) for path in sources}
    for path in sources: shutil.copy2(path, out/path.name)
    env = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
    env.update({'SLOTSTREAM_OPT_IMAGE_REUSE': str(int(a.reuse)), 'SLOTSTREAM_OPT_VISION_PADDING': str(a.padding),
                'SLOTSTREAM_BENCH_DETAILS': '1', 'SLOTSTREAM_VISION_CAPTURE_DIR': str(out/'responses')})
    with socket.socket() as reservation:
        reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
    command = [str(binary), 'serve', '--port', str(port), '--model', str(model),
               '--memory-gb', str(a.memory_gb), '--mtp', 'off', '--no-elastic']
    test_command = ['python3', str(harness), str(port)]
    if a.reuse: test_command.append('--expect-image-reuse')
    if a.case == 'same-geometry': test_command.append('--same-geometry-only')
    record = {'classification': 'bounded image-serving correctness only; not paired performance evidence',
              'command': command, 'test_command': test_command, 'identity': identity, 'source_hashes': source_hashes,
              'model': model_identity(model), 'before': preflight(a.memory_gb + 6),
              'environment': {k: v for k, v in env.items() if k.startswith('SLOTSTREAM_')},
              'fixtures': {str(path): digest(path) for path in (ROOT/'Tools/assets/vision_test').glob('*.jpg')}}
    server = client = None; started = time.monotonic()
    try:
        with (out/'server.stdout').open('wb') as stdout, (out/'server.stderr').open('wb') as stderr:
            server = subprocess.Popen(command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
            wait_ready(server, port)
            with (out/'stdout.txt').open('wb') as stdout, (out/'stderr.txt').open('wb') as stderr:
                client = subprocess.Popen(test_command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
                record['exit_code'] = client.wait(timeout=900)
    except (KeyboardInterrupt, subprocess.TimeoutExpired) as e:
        record['error'] = type(e).__name__; record['exit_code'] = 130 if isinstance(e, KeyboardInterrupt) else 1
    finally:
        if client is not None: stop_server(client)
        if server is not None: stop_server(server)
        record['after'] = vm_snapshot(); record['duration_seconds'] = time.monotonic() - started
        record['sources_unchanged'] = all(digest(Path(path)) == value for path, value in source_hashes.items())
        record['passed'] = record.get('exit_code') == 0 and record['sources_unchanged']
        (out/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    print(json.dumps({k: record[k] for k in ['passed', 'duration_seconds']}))
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())

```

## .build/optimization/vision-same-geometry-v25b/vision_serving.py

SHA-256 `907470b077a40a82d38cee70e5921502dfbe4f3b61e5e2d2a5d72a440cc6bdc3`; 17229 bytes.

```
#!/usr/bin/env python3
"""Every serving surface, with a picture, against a running server.

    Tools/vision_serving.py [port]

Assertions, not a transcript. Its predecessor printed the model's answers and a
trimmed log for a human to read, opened two image files by names that were not
the ones in the repository, and defaulted the model directory to a path on the
contributor's own machine — so it could not run anywhere and, if it had, would
not have failed at anything.

Raw sockets on purpose: this repository's agent sandbox proxies localhost HTTP
clients (CLAUDE.md), and a proxied curl answering for the server is a test that
passes without the server.

The server must already be running (`serve --memory-gb 10 --port N`) with the
vision assets in `Tools/assets/vision_test`.
"""
import base64
import json
import os
import socket
import sys
import time
import hashlib
import struct
import zlib
from pathlib import Path

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ASSETS = os.path.join(ROOT, "Tools", "assets", "vision_test")
DOG = os.path.join(ASSETS, "secret1.jpg")     # a close-up of a dog's face
TREE = os.path.join(ASSETS, "secret2.jpg")    # green citrus on a tree
MODEL = "qwen3.8-flash-next:4bit"

PASS, FAIL = [], []
REQUEST_NUMBER = 0


def ok(name):
    PASS.append(name)
    print(f"PASS  {name}", flush=True)


def bad(name, detail=""):
    FAIL.append(name)
    print(f"FAIL  {name}" + (f"\n        {detail}" if detail else ""), flush=True)


def check(name, cond, detail=""):
    ok(name) if cond else bad(name, detail)


def post(port, path, obj, timeout=1800):
    """One HTTP/1.1 POST over a raw socket. Returns (status, body)."""
    body = json.dumps(obj).encode()
    head = (
        f"POST {path} HTTP/1.1\r\nHost: 127.0.0.1:{port}\r\n"
        f"Content-Type: application/json\r\nContent-Length: {len(body)}\r\n"
        "Connection: close\r\n\r\n"
    ).encode()
    try:
        s = socket.create_connection(("127.0.0.1", port), timeout=timeout)
    except OSError as e:
        # A server the kernel killed mid-suite is not a vision failure, and a
        # traceback here would report it as one.
        return 0, f"connection failed: {e}"
    s.settimeout(timeout)
    s.sendall(head + body)
    buf = b""
    while True:
        try:
            d = s.recv(1 << 16)
        except socket.timeout:
            break
        if not d:
            break
        buf += d
    s.close()
    if not buf:
        return 0, ""
    header, _, rest = buf.partition(b"\r\n\r\n")
    status = int(header.split(b" ")[1]) if b" " in header else 0
    if b"Transfer-Encoding: chunked" in header:
        out, i = bytearray(), 0
        while i < len(rest):
            j = rest.find(b"\r\n", i)
            if j < 0:
                break
            try:
                n = int(rest[i:j].split(b";")[0], 16)
            except ValueError:
                break
            if n == 0:
                break
            out += rest[j + 2 : j + 2 + n]
            i = j + 2 + n + 2
        rest = bytes(out)
    text = rest.decode("utf-8", "replace")
    if capture := os.environ.get('SLOTSTREAM_VISION_CAPTURE_DIR'):
        global REQUEST_NUMBER
        REQUEST_NUMBER += 1
        directory = Path(capture); directory.mkdir(parents=True, exist_ok=True)
        # Exact request bytes are reconstructible from this frozen script and
        # the image fixtures; their digest is retained without copying every
        # repeated base64 image into the response ledger.
        (directory/f'{REQUEST_NUMBER:02d}.json').write_text(json.dumps({
            'path': path, 'request_sha256': hashlib.sha256(body).hexdigest(),
            'status': status, 'response': text}, indent=2)+'\n')
    return status, text


def b64(path):
    with open(path, "rb") as f:
        return base64.b64encode(f.read()).decode()


def chat(port, messages, **extra):
    payload = {"model": MODEL, "stream": False, "messages": messages, "think": False,
               "options": {"num_predict": 32, "temperature": 0, "seed": 7}}
    payload.update(extra)
    t0 = time.time()
    status, text = post(port, "/api/chat", payload)
    try:
        obj = json.loads(text)
    except json.JSONDecodeError:
        return status, {}, time.time() - t0, text
    return status, obj, time.time() - t0, text


def says(reply, *words):
    """Does the answer mention any of these? Case-insensitive."""
    low = reply.lower()
    return any(w in low for w in words)


def solid_image_base64(rgb):
    """Deterministic equal-geometry inputs; no external image service or file."""
    def chunk(kind, data):
        return struct.pack('>I', len(data)) + kind + data + struct.pack('>I', zlib.crc32(kind + data) & 0xffffffff)
    pixels = b''.join(b'\x00' + bytes(rgb) * 256 for _ in range(256))
    png = b'\x89PNG\r\n\x1a\n' + chunk(b'IHDR', struct.pack('>2I5B', 256, 256, 8, 2, 0, 0, 0))
    png += chunk(b'IDAT', zlib.compress(pixels)) + chunk(b'IEND', b'')
    return base64.b64encode(png).decode()


def same_geometry_invalidation(port):
    red, blue = solid_image_base64((255, 0, 0)), solid_image_base64((0, 0, 255))
    question = 'Say only: ok'
    st, first, _, raw = chat(port, [{'role': 'user', 'content': question, 'images': [red]}])
    answer = first.get('message', {}).get('content', '')
    check('same-geometry seed acknowledges the image', st == 200 and answer.strip().lower() == 'ok', raw[:200])
    a = first.get('slotstream_benchmark', {})
    history = [{'role': 'user', 'content': question, 'images': [blue]},
               {'role': 'assistant', 'content': answer},
               {'role': 'user', 'content': 'What color fills the image? Answer in one word.'}]
    st, second, _, raw = chat(port, history)
    b = second.get('slotstream_benchmark', {})
    held = a.get('prompt_ids', []) + a.get('output_ids', [])
    incoming = b.get('prompt_ids', [])
    check('changed image would extend the cached token IDs', bool(held) and len(incoming) > len(held) and incoming[:len(held)] == held,
          'this must be an eligible textual prefix, otherwise it does not test image identity')
    stats = b.get('stats', {})
    check('same-geometry changed content misses and re-encodes', stats.get('reusedPrefixTokens') == 0 and stats.get('encodedImages') == 1,
          f"reused={stats.get('reusedPrefixTokens')}, encoded={stats.get('encodedImages')}")
    answer = second.get('message', {}).get('content', '')
    check('same-geometry changed image is blue', st == 200 and says(answer, 'blue') and not says(answer, 'red'), answer)


def main():
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    port = int(args[0]) if args else 11434
    for p in (DOG, TREE):
        if not os.path.exists(p):
            print(f"missing asset {p}")
            return 1

    status, text = post(port, "/api/version", {})
    if status not in (200, 405, 404):
        print(f"no server on {port} (status {status})")
        return 1

    if "--same-geometry-only" in sys.argv:
        same_geometry_invalidation(port)
        print(f"{len(PASS)} passed, {len(FAIL)} failed")
        return 1 if FAIL else 0

    dog, tree = b64(DOG), b64(TREE)

    # 1. Ollama dialect: base64 in `images`. The model must describe the
    #    picture, which is the only end-to-end proof the tower's rows reached
    #    the language model at the right positions — every wiring bug in this
    #    feature produces confident text about nothing in particular.
    st, obj, secs, raw = chat(
        port,
        [{"role": "user", "content": "In three words, what animal is this?",
          "images": [dog]}])
    reply = obj.get("message", {}).get("content", "")
    check("ollama /api/chat answers an image request", st == 200, raw[:200])
    check("and it recognises the dog", says(reply, "dog", "puppy", "canine"), reply[:120])
    print(f"      -> {reply.strip()[:100]!r} in {secs:.1f}s, "
          f"{obj.get('prompt_eval_count')} prompt tokens")
    dog_tokens = obj.get("prompt_eval_count", 0)

    # 2. A picture costs real tokens, and the count must match the geometry the
    #    weights-free check pins (846x859 -> 702 tokens for this asset).
    st, obj, _, _ = chat(port, [{"role": "user", "content": "In three words, what animal is this?"}])
    text_tokens = obj.get("prompt_eval_count", 0)
    # 702 placeholders (the geometry `vision-check` pins for this 846x859
    # asset) plus the template's own <|vision_start|> and <|vision_end|>.
    check(
        "the picture is worth its 702 placeholder tokens, plus the two sentinels",
        dog_tokens - text_tokens == 704,
        f"{dog_tokens} - {text_tokens} = {dog_tokens - text_tokens}")

    # 3. OpenAI dialect: an image_url part with a data: URL.
    st, text = post(
        port, "/v1/chat/completions",
        {"model": MODEL, "max_tokens": 32, "temperature": 0, "seed": 7, "messages": [{
            "role": "user",
            "content": [
                {"type": "image_url",
                 "image_url": {"url": "data:image/jpeg;base64," + tree}},
                {"type": "text", "text": "In three words, what is growing here?"},
            ]}]})
    obj = json.loads(text) if text.startswith("{") else {}
    reply = (obj.get("choices") or [{}])[0].get("message", {}).get("content", "")
    check("/v1/chat/completions answers an image_url part", st == 200, text[:200])
    check(
        "and it sees the fruit on the tree",
        says(reply, "citrus", "fruit", "lime", "grapefruit", "pomelo", "orange", "lemon", "tree"),
        reply[:120])
    print(f"      -> {reply.strip()[:100]!r}")

    # 4. Ollama /api/generate, the other half of that dialect.
    st, text = post(
        port, "/api/generate",
        {"model": MODEL, "stream": False, "prompt": "In three words, what animal is this?",
         "images": [dog], "think": False, "options": {"num_predict": 32, "temperature": 0, "seed": 7}})
    obj = json.loads(text) if text.startswith("{") else {}
    check("/api/generate answers an image request", st == 200, text[:200])
    check(
        "and it recognises the dog there too",
        says(obj.get("response", ""), "dog", "puppy", "canine"),
        obj.get("response", "")[:120])

    # 5. The fx gateway: a `file` part with an image media type.
    # The model is named by the route, not the body: an unknown body field is
    # a 400 by design, so the shape here is the one fx actually sends.
    st, text = post(
        port, "/v3/ai/language-model",
        {"prompt": [{
            "role": "user",
            "content": [
                {"type": "file", "mediaType": "image/jpeg", "data": dog},
                {"type": "text", "text": "In three words, what animal is this?"},
            ]}],
         "toolChoice": {"type": "auto"}, "maxOutputTokens": 32, "temperature": 0, "seed": 7})
    check("the fx gateway accepts an image file part", st == 200, text[:300])
    check(
        "and answers about the dog",
        says(text, "dog", "puppy", "canine"), text[-400:])
    st, text = post(
        port, "/v3/ai/language-model",
        {"prompt": [{
            "role": "user",
            "content": [{"type": "file", "mediaType": "application/pdf", "data": dog}]}],
         "toolChoice": {"type": "auto"}, "maxOutputTokens": 8})
    check(
        "and still refuses a file part that is not an image",
        "unsupported_file_part" in text, text[:300])

    # 6. Two pictures in one conversation, in order. A swapped pair is the
    #    failure this cannot be allowed to have: both answers stay fluent.
    st, obj, _, raw = chat(
        port,
        [{"role": "user",
          "content": [
              {"type": "image_url", "image_url": {"url": "data:image/jpeg;base64," + dog}},
              {"type": "image_url", "image_url": {"url": "data:image/jpeg;base64," + tree}},
              {"type": "text",
               "text": "Answer with exactly two words separated by a comma: "
                       "the subject of the first picture, then of the second."},
          ]}])
    reply = obj.get("message", {}).get("content", "")
    check("two pictures in one turn are accepted", st == 200, raw[:200])
    ordered_subjects = reply.split(",", 1)
    check(
        "and they arrive in the order they were sent",
        len(ordered_subjects) == 2 and says(ordered_subjects[0], "dog", "puppy")
        and says(ordered_subjects[1], "fruit", "citrus", "tree", "lime", "pomelo", "grapefruit", "orange"),
        reply[:160])
    print(f"      -> {reply.strip()[:100]!r}")

    # 7. Prefix reuse. A follow-up turn extends the previous prompt, so the
    #    state is handed over whole: the tower does not run again and prefill
    #    reads only new text. Benchmark observations prove reuse directly;
    #    a short elapsed time alone is not evidence that a cache was used.
    history = [
        {"role": "user", "content": "Say only: ok",
         "images": [dog]},
    ]
    st, obj, first_secs, _ = chat(port, history)
    first_stats = obj.get('slotstream_benchmark', {}).get('stats', {})
    history.append({"role": "assistant", "content": obj.get("message", {}).get("content", "")})
    history.append({"role": "user", "content": "Now say only: still ok"})
    st, obj, second_secs, raw = chat(port, history)
    second_stats = obj.get('slotstream_benchmark', {}).get('stats', {})
    check("a follow-up turn on the same picture succeeds", st == 200, raw[:200])
    check(
        "and reuses the state instead of re-running the tower",
        first_stats.get('encodedImages') == 1 and second_stats.get('encodedImages') == 0
        and second_stats.get('reusedPrefixTokens', 0) > 0 and second_stats.get('prefixSkippedImages') == 1,
        f"encoded first={first_stats.get('encodedImages')}, follow-up={second_stats.get('encodedImages')}, "
        f"reused={second_stats.get('reusedPrefixTokens')}; requires SLOTSTREAM_BENCH_DETAILS=1")
    print(f"      -> first {first_secs:.1f}s, follow-up {second_secs:.1f}s")

    # 8. The same ids with a different picture must NOT reuse. Both images
    #    resize to different grids, so to make the ids identical the second
    #    request replays the first conversation with the other picture at the
    #    same place — a cache keyed on ids alone would answer from the dog's
    #    state about the tree.
    st, obj, _, _ = chat(
        port, [{"role": "user", "content": "In three words, what is this?", "images": [dog]}])
    first = obj.get("message", {}).get("content", "")
    st, obj, _, _ = chat(
        port, [{"role": "user", "content": "In three words, what is this?", "images": [tree]}])
    second = obj.get("message", {}).get("content", "")
    check(
        "the same words with a different picture get a different answer",
        says(first, "dog", "puppy", "canine")
        and not says(second, "dog", "puppy", "canine"),
        f"{first[:60]!r} then {second[:60]!r}")

    st, obj, _, raw = chat(port, [{'role': 'user', 'images': [dog, dog],
        'content': 'What animal is shown in both images? Reply in three words.'}])
    reply = obj.get('message', {}).get('content', '')
    observed = obj.get('slotstream_benchmark', {}).get('stats', {})
    check('duplicate images preserve the visible subject', st == 200 and says(reply, 'dog', 'puppy', 'canine'), raw[:200])
    check('duplicate image work is counted', observed.get('encodedImages', -1) + observed.get('reusedImageFeatures', -1) == 2,
          f"encoded={observed.get('encodedImages')}, reused={observed.get('reusedImageFeatures')}")
    if '--expect-image-reuse' in sys.argv:
        check('duplicate images execute the tower once', observed.get('encodedImages') == 1 and observed.get('reusedImageFeatures') == 1,
              f"encoded={observed.get('encodedImages')}, reused={observed.get('reusedImageFeatures')}")

    same_geometry_invalidation(port)

    # 9. Refusals, on the surface a user meets them on.
    st, obj, _, raw = chat(
        port, [{"role": "user",
                "content": [{"type": "image_url",
                             "image_url": {"url": "file:///etc/passwd"}}]}])
    check("a file:// image is a 400", st == 400, f"{st}: {raw[:160]}")
    check("that says URLs are not fetched", "not fetched" in raw, raw[:160])
    st, obj, _, raw = chat(
        port, [{"role": "user", "content": "hi", "images": ["bm90IGFuIGltYWdl"]}])
    check("bytes that are not an image are a 400", st == 400, f"{st}: {raw[:160]}")
    # An upload cut short decodes, in ImageIO, to the rows it has plus blank
    # space — and the model then describes a mostly empty picture with
    # confidence. The container's end marker is what catches it.
    half = base64.b64encode(open(DOG, "rb").read()[: os.path.getsize(DOG) // 2]).decode()
    st, obj, _, raw = chat(port, [{"role": "user", "content": "hi", "images": [half]}])
    check("a truncated image is a 400, not a blank description",
          st == 400 and "incomplete" in raw, f"{st}: {raw[:160]}")

    print()
    print(f"{len(PASS)} passed, {len(FAIL)} failed")
    if FAIL:
        for f in FAIL:
            print(f"  FAILED: {f}")
        return 1
    print("VISION SERVING PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())

```

## .build/optimization/router-projection-component-v26/manifest.json

SHA-256 `209f15445f0b30c09d308a37028460fc950196d32c1585bb86e39ddc8520d314`; 13342 bytes.

```
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-weights-v26/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "9d303c4035ad64a29a3d50a8166d7492936cbeb1b278e443ffb65333effc3256",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "7088ff6c9e71f50520b008ef3090680d2eb1bdac6395625a31f6f736a77ac07c",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "dd4ab74370d7e5dd267ed070b05c26c411394c0d511a8062c2e040b40944a21d",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "06a364af34c4cef1b7e0b4ce15c44a879449f996ddb62d3e481e2d6d8bcdd6dc",
      "Sources/Slotstream/MTP.swift": "ea5c1a6dbc47fc1c38a01b055d375fa3a9b3d419562ce97a15be51aefdacbb8a",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "aa26a9fa9ca96a20e3d4865f613d15827daa86c77e6191ee825f1767ed7f60ce",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "1c75201ae9a224ee80faf0a294efa4f561c0e87d10af1f654b4fd23ebc7d4893",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "65be7945e2dd57ec975810e6ba6e5a17cd0b9de4c3b4608b423f04df41352549",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f5334668142f8c52ea1a1f374469eb4588e92dcd42b1f37893fbfbf35146f397",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "c6ba9fdd29b8271e6761dc28d8431fc7645276966f60b624217b3022e2d760b0",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "7a193da93b2cbb2b62b76c401628dabcbbe6cbde03c6799ee29c01776e092cf7",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "2aa2d60edef2cc49073160b4250a13d416ebb0105bb7f2e93bae4c400c244f48",
    "binary_sha256": "1316fc18731f7809a93d66ba782dddee1e6623c99bf2dc9a97d63cd346afd4d1",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 8.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-weights-v26/slotstream",
    "optimization-state-check",
    "--variant",
    "router-projection",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33311293440,
    "swapins": 41704044,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   431455.\nPages active:                                1001034.\nPages inactive:                               711203.\nPages speculative:                            303308.\nPages throttled:                                   0.\nPages wired down:                             216616.\nPages purgeable:                                3026.\n\"Translation faults\":                    13777566959.\nPages copy-on-write:                       626946462.\nPages zero filled:                       15321414747.\nPages reactivated:                        2287781083.\nPages purged:                               61698616.\nFile-backed pages:                           1598679.\nAnonymous pages:                              416866.\nPages stored in compressor:                  1426029.\nPages occupied by compressor:                 418727.\nDecompressions:                            962787811.\nCompressions:                             1256740868.\nPageins:                                  5841794870.\nPageouts:                                   10626197.\nSwapins:                                    41704044.\nSwapouts:                                   69922789.\nPages tagged:                                 169267.\nPages tagged resident:                        122354.\nPages tagged compressed:                       46913.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6875.\nPages tag-storage free:                         3385.\nPages tag-storage non-tag pageable:            88036.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7605696.\nTagged compressions:                         9414342.\nTagged decompressions:                       8661146.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 30,
  "duration_seconds": 0.8850939579999999,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33449115648,
    "swapins": 41704044,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   431473.\nPages active:                                1014256.\nPages inactive:                               711536.\nPages speculative:                            303614.\nPages throttled:                                   0.\nPages wired down:                             202889.\nPages purgeable:                               10777.\n\"Translation faults\":                    13777581880.\nPages copy-on-write:                       626947106.\nPages zero filled:                       15321430844.\nPages reactivated:                        2287781087.\nPages purged:                               61698616.\nFile-backed pages:                           1599322.\nAnonymous pages:                              430084.\nPages stored in compressor:                  1425540.\nPages occupied by compressor:                 418588.\nDecompressions:                            962788300.\nCompressions:                             1256740868.\nPageins:                                  5841795408.\nPageouts:                                   10626197.\nSwapins:                                    41704044.\nSwapouts:                                   69922789.\nPages tagged:                                 169094.\nPages tagged resident:                        122200.\nPages tagged compressed:                       46894.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6875.\nPages tag-storage free:                         3389.\nPages tag-storage non-tag pageable:            88032.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7601728.\nTagged compressions:                         9414342.\nTagged decompressions:                       8661165.\n"
  }
}

```

## .build/optimization/router-projection-component-v26/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/router-projection-component-v26/stdout.txt

SHA-256 `e1a4c5e6e99387a82b472c3d6018f42a3b9683b651225e87e42b2f17a6aef905`; 2613 bytes.

```
{
  "items" : [
    {
      "name" : "default holds no promoted copy",
      "passed" : true
    },
    {
      "name" : "full FP32 copy is charged",
      "passed" : true
    },
    {
      "name" : "one materialized promotion",
      "passed" : true
    },
    {
      "name" : "rows 1: exact logits",
      "passed" : true
    },
    {
      "name" : "rows 1: exact ordered routes",
      "passed" : true
    },
    {
      "name" : "rows 1: no repeated weight conversion",
      "passed" : true
    },
    {
      "name" : "rows 2: exact logits",
      "passed" : true
    },
    {
      "name" : "rows 2: exact ordered routes",
      "passed" : true
    },
    {
      "name" : "rows 2: no repeated weight conversion",
      "passed" : true
    },
    {
      "name" : "rows 8: exact logits",
      "passed" : true
    },
    {
      "name" : "rows 8: exact ordered routes",
      "passed" : true
    },
    {
      "name" : "rows 8: no repeated weight conversion",
      "passed" : true
    },
    {
      "name" : "rows 16: exact logits",
      "passed" : true
    },
    {
      "name" : "rows 16: exact ordered routes",
      "passed" : true
    },
    {
      "name" : "rows 16: no repeated weight conversion",
      "passed" : true
    },
    {
      "name" : "rows 32: exact logits",
      "passed" : true
    },
    {
      "name" : "rows 32: exact ordered routes",
      "passed" : true
    },
    {
      "name" : "rows 32: no repeated weight conversion",
      "passed" : true
    },
    {
      "name" : "rows 256: exact logits",
      "passed" : true
    },
    {
      "name" : "rows 256: exact ordered routes",
      "passed" : true
    },
    {
      "name" : "rows 256: no repeated weight conversion",
      "passed" : true
    },
    {
      "name" : "rows 257: exact logits",
      "passed" : true
    },
    {
      "name" : "rows 257: exact ordered routes",
      "passed" : true
    },
    {
      "name" : "rows 257: no repeated weight conversion",
      "passed" : true
    },
    {
      "name" : "rows 1024: exact logits",
      "passed" : true
    },
    {
      "name" : "rows 1024: exact ordered routes",
      "passed" : true
    },
    {
      "name" : "rows 1024: no repeated weight conversion",
      "passed" : true
    },
    {
      "name" : "disable releases cache",
      "passed" : true
    },
    {
      "name" : "reenable rebuilds exactly once",
      "passed" : true
    },
    {
      "name" : "native FP32 does not allocate a duplicate",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-router-projection",
  "passed" : true
}

```

## .build/optimization/router-weights-state-v26/manifest.json

SHA-256 `7a32e1d8495ff5b83e1abc26ab631de982a8f9c8e735615ca31a1976978e27a4`; 13370 bytes.

```
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-weights-v26/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "9d303c4035ad64a29a3d50a8166d7492936cbeb1b278e443ffb65333effc3256",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "7088ff6c9e71f50520b008ef3090680d2eb1bdac6395625a31f6f736a77ac07c",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "dd4ab74370d7e5dd267ed070b05c26c411394c0d511a8062c2e040b40944a21d",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "06a364af34c4cef1b7e0b4ce15c44a879449f996ddb62d3e481e2d6d8bcdd6dc",
      "Sources/Slotstream/MTP.swift": "ea5c1a6dbc47fc1c38a01b055d375fa3a9b3d419562ce97a15be51aefdacbb8a",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "aa26a9fa9ca96a20e3d4865f613d15827daa86c77e6191ee825f1767ed7f60ce",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "1c75201ae9a224ee80faf0a294efa4f561c0e87d10af1f654b4fd23ebc7d4893",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "65be7945e2dd57ec975810e6ba6e5a17cd0b9de4c3b4608b423f04df41352549",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f5334668142f8c52ea1a1f374469eb4588e92dcd42b1f37893fbfbf35146f397",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "c6ba9fdd29b8271e6761dc28d8431fc7645276966f60b624217b3022e2d760b0",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "7a193da93b2cbb2b62b76c401628dabcbbe6cbde03c6799ee29c01776e092cf7",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "2aa2d60edef2cc49073160b4250a13d416ebb0105bb7f2e93bae4c400c244f48",
    "binary_sha256": "1316fc18731f7809a93d66ba782dddee1e6623c99bf2dc9a97d63cd346afd4d1",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 15.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-weights-v26/slotstream",
    "optimization-state-check",
    "--variant",
    "router-weights",
    "--tokens",
    "2112",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32871366656,
    "swapins": 41704048,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   464714.\nPages active:                                 997158.\nPages inactive:                               835046.\nPages speculative:                            162794.\nPages throttled:                                   0.\nPages wired down:                             226380.\nPages purgeable:                                6133.\n\"Translation faults\":                    13778324656.\nPages copy-on-write:                       626982512.\nPages zero filled:                       15322279047.\nPages reactivated:                        2287782599.\nPages purged:                               61703185.\nFile-backed pages:                           1535462.\nAnonymous pages:                              459536.\nPages stored in compressor:                  1381564.\nPages occupied by compressor:                 398083.\nDecompressions:                            962832052.\nCompressions:                             1256740868.\nPageins:                                  5841939291.\nPageouts:                                   10626248.\nSwapins:                                    41704048.\nSwapouts:                                   69922789.\nPages tagged:                                 167549.\nPages tagged resident:                        120965.\nPages tagged compressed:                       46584.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6875.\nPages tag-storage free:                         1321.\nPages tag-storage non-tag pageable:            90100.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7540928.\nTagged compressions:                         9414342.\nTagged decompressions:                       8661467.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 1130,
  "duration_seconds": 16.191591541999998,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33542291456,
    "swapins": 41704048,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   617839.\nPages active:                                 917851.\nPages inactive:                               718795.\nPages speculative:                            198103.\nPages throttled:                                   0.\nPages wired down:                             217642.\nPages purgeable:                                 610.\n\"Translation faults\":                    13778560838.\nPages copy-on-write:                       626983072.\nPages zero filled:                       15334658121.\nPages reactivated:                        2289047081.\nPages purged:                               61708499.\nFile-backed pages:                           1428810.\nAnonymous pages:                              405939.\nPages stored in compressor:                  1413194.\nPages occupied by compressor:                 413527.\nDecompressions:                            962929549.\nCompressions:                             1256870191.\nPageins:                                  5842892636.\nPageouts:                                   10626411.\nSwapins:                                    41704048.\nSwapouts:                                   69922789.\nPages tagged:                                 166586.\nPages tagged resident:                        119686.\nPages tagged compressed:                       46900.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6875.\nPages tag-storage free:                         1903.\nPages tag-storage non-tag pageable:            89518.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7600128.\nTagged compressions:                         9414686.\nTagged decompressions:                       8661492.\n"
  }
}

```

## .build/optimization/router-weights-state-v26/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/router-weights-state-v26/stdout.txt

SHA-256 `a2fb3bba5bcf3fa13f31fc884561358372d2c7078dd4d132482d0d1471c24df8`; 83371 bytes.

```
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
    },
    {
      "name" : "promoted routers charged in full",
      "passed" : true
    },
    {
      "name" : "disabling router cache releases promoted tensors",
      "passed" : true
    }
  ],
  "measurements" : {
    "additional_cached_router_bytes" : 251658240,
    "physical_footprint_bytes" : 7775457048,
    "prompt_tokens" : 2112
  },
  "name" : "optimization-state-router-weights",
  "passed" : true
}

```

## .build/optimization/mtp-router-weights-v26/manifest.json

SHA-256 `41d2f6d94b71865cede3fa2a6834921e3218a4cc75af158af4ec7b8e57f89852`; 13338 bytes.

```
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-weights-v26/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/Checkpoint.swift": "5ec5759bce71c480c0d4f676c725e8f44530bc7ccdceb3957d883f3658a984c5",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "9d303c4035ad64a29a3d50a8166d7492936cbeb1b278e443ffb65333effc3256",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExpertStore.swift": "7088ff6c9e71f50520b008ef3090680d2eb1bdac6395625a31f6f736a77ac07c",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "dd4ab74370d7e5dd267ed070b05c26c411394c0d511a8062c2e040b40944a21d",
      "Sources/Slotstream/Governor.swift": "e951d7bb22860cc513ac9e726c3cfc10f71a4e9ab4835dd7e0dad02fd1f4df55",
      "Sources/Slotstream/Layers.swift": "06a364af34c4cef1b7e0b4ce15c44a879449f996ddb62d3e481e2d6d8bcdd6dc",
      "Sources/Slotstream/MTP.swift": "ea5c1a6dbc47fc1c38a01b055d375fa3a9b3d419562ce97a15be51aefdacbb8a",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "aa26a9fa9ca96a20e3d4865f613d15827daa86c77e6191ee825f1767ed7f60ce",
      "Sources/Slotstream/NgramStore.swift": "24e527279aacfef9eb238fc295209caaaf74d5eda98f39bc35f2a89e0aa6816c",
      "Sources/Slotstream/Observation.swift": "9920a5611a96ff9a9657371d88797f27ce7267f5e65afeeba50ba1f8c3ce481b",
      "Sources/Slotstream/Optimizations.swift": "1c75201ae9a224ee80faf0a294efa4f561c0e87d10af1f654b4fd23ebc7d4893",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "ec421397310dc95af1f5e8586197717e4ee04ab60de18142bfdc499a9cbe822f",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "65be7945e2dd57ec975810e6ba6e5a17cd0b9de4c3b4608b423f04df41352549",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "5c176aa9f00c8530a068d7bc8cbca8c2ad4732fd2819eb96961a15c265675e60",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f5334668142f8c52ea1a1f374469eb4588e92dcd42b1f37893fbfbf35146f397",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "4283fe2257892a28b260ce9424514d35546693d944d1f204fd0c1e404829fe7b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "e4c7fb7cb1944d378a037494147a536580dcbca76b754074302b0a3155d59e95",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "c6ba9fdd29b8271e6761dc28d8431fc7645276966f60b624217b3022e2d760b0",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "7a193da93b2cbb2b62b76c401628dabcbbe6cbde03c6799ee29c01776e092cf7",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "2aa2d60edef2cc49073160b4250a13d416ebb0105bb7f2e93bae4c400c244f48",
    "binary_sha256": "1316fc18731f7809a93d66ba782dddee1e6623c99bf2dc9a97d63cd346afd4d1",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 18.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-router-weights-v26/slotstream",
    "optimization-state-check",
    "--variant",
    "mtp-router-weights",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32340033536,
    "swapins": 41704076,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   471345.\nPages active:                                1005348.\nPages inactive:                               786290.\nPages speculative:                            218887.\nPages throttled:                                   0.\nPages wired down:                             218758.\nPages purgeable:                                6233.\n\"Translation faults\":                    13780363249.\nPages copy-on-write:                       627059665.\nPages zero filled:                       15336538206.\nPages reactivated:                        2289058821.\nPages purged:                               61722165.\nFile-backed pages:                           1496301.\nAnonymous pages:                              514224.\nPages stored in compressor:                  1345751.\nPages occupied by compressor:                 382083.\nDecompressions:                            962992803.\nCompressions:                             1256870191.\nPageins:                                  5842947558.\nPageouts:                                   10626411.\nSwapins:                                    41704076.\nSwapouts:                                   69922789.\nPages tagged:                                 169563.\nPages tagged resident:                        125369.\nPages tagged compressed:                       44194.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6875.\nPages tag-storage free:                         2663.\nPages tag-storage non-tag pageable:            88758.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7140672.\nTagged compressions:                         9414686.\nTagged decompressions:                       8664039.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 370,
  "duration_seconds": 7.615071583,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31523946496,
    "swapins": 41704076,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   427689.\nPages active:                                1011454.\nPages inactive:                               893863.\nPages speculative:                            115493.\nPages throttled:                                   0.\nPages wired down:                             255227.\nPages purgeable:                                8382.\n\"Translation faults\":                    13780763488.\nPages copy-on-write:                       627073898.\nPages zero filled:                       15337064795.\nPages reactivated:                        2289068856.\nPages purged:                               61728028.\nFile-backed pages:                           1487998.\nAnonymous pages:                              532812.\nPages stored in compressor:                  1341261.\nPages occupied by compressor:                 379693.\nDecompressions:                            962997246.\nCompressions:                             1256870191.\nPageins:                                  5843038462.\nPageouts:                                   10626411.\nSwapins:                                    41704076.\nSwapouts:                                   69922789.\nPages tagged:                                 169623.\nPages tagged resident:                        125429.\nPages tagged compressed:                       44194.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6874.\nPages tag-storage free:                         2520.\nPages tag-storage non-tag pageable:            88902.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7140672.\nTagged compressions:                         9414686.\nTagged decompressions:                       8664039.\n"
  }
}

```

## .build/optimization/mtp-router-weights-v26/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/mtp-router-weights-v26/stdout.txt

SHA-256 `10d2251d4c61b677260cca3d9297a9404533148af0df96f4bdbb1a51bfc78f6e`; 27605 bytes.

```
{
  "items" : [
    {
      "name" : "MTP limit 1: all main\/head copies charged",
      "passed" : true
    },
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
      "name" : "MTP limit 2: all main\/head copies charged",
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
      "name" : "MTP limit 5: all main\/head copies charged",
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
  "name" : "optimization-mtp-router-weights",
  "passed" : true
}

```
