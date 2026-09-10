---
type: run
id: 01m1rpg68xbff2gj5abt28ake5
created: 2026-09-05T11:50:42.717911+00:00
updated: 2026-09-05T11:50:42.871238+00:00
summary: D256 selected attention component passes, full-state failure and component slowdown
binary: candidate-selected-attention-v36
captured_at: 2026-09-05
command: V33 through V36 selected attention qualification
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: D256 selected attention component passes, full-state failure and component slowdown
tool: Native diagnostics and pinned MLX kernel probe
---
# D256 selected attention: component validity is insufficient; reject this kernel

OPT10 now has a compact complete-block ID producer with unchanged score arithmetic, full original partition domain, invisible sentinels and absolute-position tail handling. Its independent scalar expansion matches the reference keep masks across every four-token remainder, the sparse boundary, batch two, ties, NaNs and infinities. This is separate from the attention arithmetic.

OPT15's prototype consumes those IDs and uses one 256-thread group per query/head, eight keys per iteration, FP32 online softmax/value accumulation, and BF16-rounded scores. It retains short-query native attention at eight or fewer queries. Tail query tiles merge when needed to preserve that domain restriction. The first prototype failed initialization because a scalar placeholder produced an unindexable Metal argument; the corrected vector placeholder initializes on this machine. V35 exposed two saturated BF16 short-query numerical failures and a test that incorrectly included unmasked rows in an all-masked assertion. V36 restricts the custom kernel to its intended prefill domain and directly tests exact native short-query fallback; the all-masked assertion now covers only wholly masked rows. The prefill fallback's finite-minimum mask yields a uniform full-key output on wholly masked rows, explicitly handled and tested. Initialization failure preserves the existing implementation; no resumed fallback after a GPU execution failure is claimed.

The corrected native component passes all 208 assertions against independent Float64 arithmetic and exact compact-mask expansion. Nevertheless, the 2,051-token, three-arm full-model comparison FAILS 52 of 807 assertions. Main retained KV/indexer and recurrent tensors drift outside the frozen existing 512-vs-256 rechunk band. For example index.43 relative maximum error is 0.81953 versus 0.08984 in the control. The exact routes differ on 4.7173% of entries versus 3.6143% in the control; that route-band check passes, but cannot override the failed tensor gates. The candidate executes 96 attention tiles. This workload's only sparse chronological pass has three tokens and therefore uses the native fallback; it does not qualify compact-ID attention inside a full-model sparse prefill. The compact-ID shader is tested only at component level. No larger or serving-quality run is justified after this numerical failure.

Five clean paired component rounds per shape show this scalar design is also slower: median paired candidate/reference latency factors are 4.83837 at 256 queries/256 keys, 21.97858 at 256/2,048 dense keys and 7.07025 at 256/8,192 stored keys with 512 selected complete blocks. All use BF16 B1 H24 HK2 D256. The observed MLX allocator high-water marks fall (about 13.24 to 6.88 MB, 39.86 to 11.01 MB and 129.50 to 28.84 MB), but these are allocator observations, not physical-footprint or request gains. Fixed inputs, warmups, full round output, pinned Python MLX 0.31.1 and the shader extracted from the frozen Swift source follow.

**Disposition: reject this one-query-per-group online-softmax implementation.** Do not enable it, relax quality bands or exchange increased numerical error for the measured slowdown. Preserving BF16 probability rounding would require another pass or a score buffer and does not fix this implementation's serial key traversal and lack of query/matrix reuse. A materially different matrix-tiled kernel is a future candidate with its own cost, BF16-rounding and compatibility proof; it has not been implemented or measured. The validated native bounded attention remains the production and N6 dependency path. This closes the present prototype investigation, not every possible D256 kernel. All rejected source identities and failed diagnostics remain evidence.

## .build/optimization/candidate-selected-attention-v33/build-identity.json

SHA-256 `673740bab7c16cd3fe04634ae7ab58d39cad3d794c27c72e5b3b038adc26d860`; 9689 bytes.

```
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
    "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
    "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
    "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "8c6a09c202ad6b970258d334d2bf53f3efd2a207089d944f12e1bbd640045ad4",
    "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
    "Sources/Slotstream/Layers.swift": "d5c867dd302a816cfa832560ab07b0ac1ddfcfc6eca0355c7e7aa667cf618118",
    "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "3c96b535d34f1d1d4d916a1918059f26e71b29b14bc6346580d9cc616511e6de",
    "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
    "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
    "Sources/Slotstream/Optimizations.swift": "d8f3da196fae79b93e08d58bda977e3eb05d0a59eb298bf54c31ae97da1d41b2",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
    "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "47ddc5a078c2376624a9f583af2595b1ae576db36bccf8ae3c7eef8e305ed88f",
    "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
    "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
    "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d6b34fefde61bc70af151e2827d2185e67cdf2222b1b08f5cee427914a05d8f9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "a93cb40a0a3e9532caffa7973bec0636706b6577a94b4de93e4f56f7ff13a1c1",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "74674f9f60bdc91453e6ed5e321ba663b5e534c5135389e783b6248a03722315",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "652341c251b1a74e5debcb6e130fa67725c6fd1cf3a7ffa6b489c9449a14b5c1",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
    "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "48bdad40bb16a8214db62a3a88bb8e7d597a66685556127e50c5ce1769d15786",
  "binary_sha256": "1e8a6ddb087af0df06a4b93fe093e2fad587292d66b6ac12d83b477ec6761895",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/selected-attention-component-v33/manifest.json

SHA-256 `9b904797fa552dc7f12f0da84ddbbd1f5790c7481a596898aed80b4029f558c1`; 14519 bytes.

```
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-selected-attention-v33/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
      "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "8c6a09c202ad6b970258d334d2bf53f3efd2a207089d944f12e1bbd640045ad4",
      "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
      "Sources/Slotstream/Layers.swift": "d5c867dd302a816cfa832560ab07b0ac1ddfcfc6eca0355c7e7aa667cf618118",
      "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "3c96b535d34f1d1d4d916a1918059f26e71b29b14bc6346580d9cc616511e6de",
      "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
      "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
      "Sources/Slotstream/Optimizations.swift": "d8f3da196fae79b93e08d58bda977e3eb05d0a59eb298bf54c31ae97da1d41b2",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "47ddc5a078c2376624a9f583af2595b1ae576db36bccf8ae3c7eef8e305ed88f",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d6b34fefde61bc70af151e2827d2185e67cdf2222b1b08f5cee427914a05d8f9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "a93cb40a0a3e9532caffa7973bec0636706b6577a94b4de93e4f56f7ff13a1c1",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "74674f9f60bdc91453e6ed5e321ba663b5e534c5135389e783b6248a03722315",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "652341c251b1a74e5debcb6e130fa67725c6fd1cf3a7ffa6b489c9449a14b5c1",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "48bdad40bb16a8214db62a3a88bb8e7d597a66685556127e50c5ce1769d15786",
    "binary_sha256": "1e8a6ddb087af0df06a4b93fe093e2fad587292d66b6ac12d83b477ec6761895",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-selected-attention-v33/slotstream",
    "optimization-state-check",
    "--variant",
    "selected-attention-component",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32417693696,
    "swapins": 41705296,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   343010.\nPages active:                                1013626.\nPages inactive:                               949672.\nPages speculative:                            187056.\nPages throttled:                                   0.\nPages wired down:                             223163.\nPages purgeable:                                5546.\n\"Translation faults\":                    13815253422.\nPages copy-on-write:                       628624005.\nPages zero filled:                       15502909315.\nPages reactivated:                        2329324883.\nPages purged:                               61909556.\nFile-backed pages:                           1630063.\nAnonymous pages:                              520291.\nPages stored in compressor:                  1322978.\nPages occupied by compressor:                 367571.\nDecompressions:                            964478416.\nCompressions:                             1258371630.\nPageins:                                  5877938985.\nPageouts:                                   10629188.\nSwapins:                                    41705296.\nSwapouts:                                   69922789.\nPages tagged:                                 175486.\nPages tagged resident:                        130271.\nPages tagged compressed:                       45215.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7208.\nPages tag-storage free:                         1508.\nPages tag-storage non-tag pageable:            89580.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7273984.\nTagged compressions:                         9446881.\nTagged decompressions:                       8693392.\n"
  },
  "exit_code": 1,
  "result_key": "passed",
  "assertions": 1,
  "duration_seconds": 0.75961425,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32415432704,
    "swapins": 41705296,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   343258.\nPages active:                                1013294.\nPages inactive:                               949658.\nPages speculative:                            187180.\nPages throttled:                                   0.\nPages wired down:                             223182.\nPages purgeable:                                5034.\n\"Translation faults\":                    13815264156.\nPages copy-on-write:                       628624654.\nPages zero filled:                       15502915415.\nPages reactivated:                        2329324883.\nPages purged:                               61909556.\nFile-backed pages:                           1630189.\nAnonymous pages:                              519943.\nPages stored in compressor:                  1322970.\nPages occupied by compressor:                 367571.\nDecompressions:                            964478424.\nCompressions:                             1258371630.\nPageins:                                  5877939045.\nPageouts:                                   10629188.\nSwapins:                                    41705296.\nSwapouts:                                   69922789.\nPages tagged:                                 175518.\nPages tagged resident:                        130303.\nPages tagged compressed:                       45215.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7208.\nPages tag-storage free:                         1502.\nPages tag-storage non-tag pageable:            89586.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7273984.\nTagged compressions:                         9446881.\nTagged decompressions:                       8693392.\n"
  }
}

```

## .build/optimization/selected-attention-component-v33/stdout.txt

SHA-256 `d14be4c02de553a257b3afe400511aca87cc0b0597f1f27d1215ce7a90d7fb01`; 210 bytes.

```
{
  "items" : [
    {
      "name" : "D256 kernel initialized for BF16 and FP32",
      "passed" : false
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-selected-attention",
  "passed" : false
}

```

## .build/optimization/selected-attention-component-v33/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/candidate-selected-attention-v34/build-identity.json

SHA-256 `a13a9497887af9393815ab533a4a4afe86fe22094c748c4fba615645be7650a1`; 9689 bytes.

```
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
    "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
    "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
    "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "8c6a09c202ad6b970258d334d2bf53f3efd2a207089d944f12e1bbd640045ad4",
    "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
    "Sources/Slotstream/Layers.swift": "d5c867dd302a816cfa832560ab07b0ac1ddfcfc6eca0355c7e7aa667cf618118",
    "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "3c96b535d34f1d1d4d916a1918059f26e71b29b14bc6346580d9cc616511e6de",
    "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
    "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
    "Sources/Slotstream/Optimizations.swift": "d8f3da196fae79b93e08d58bda977e3eb05d0a59eb298bf54c31ae97da1d41b2",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
    "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "b8b8b2fefd76f801ff71bd46c9bc48c36dcf1a3517e23018bd473eab5b7ca0f9",
    "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
    "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
    "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d6b34fefde61bc70af151e2827d2185e67cdf2222b1b08f5cee427914a05d8f9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "a93cb40a0a3e9532caffa7973bec0636706b6577a94b4de93e4f56f7ff13a1c1",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "7c566b0fbb41bd5c03c5043bee6362a8aca81d9d437e68846f0e2e3215c98964",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "652341c251b1a74e5debcb6e130fa67725c6fd1cf3a7ffa6b489c9449a14b5c1",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
    "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "4a23bf20f1374449ceeb923d24f92c1e4ff17858c44f10b7da356ec1a90153eb",
  "binary_sha256": "a0c01e4a07586cd61ebd88298b2cc4e72cbfa7b47b6c9b47d35584b2aac72bd8",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/selected-attention-component-v34/manifest.json

SHA-256 `3a3cc36ea22b3c486401979ee96b54333075f9c8809fd6816f1c29231a182da3`; 14520 bytes.

```
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-selected-attention-v34/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
      "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "8c6a09c202ad6b970258d334d2bf53f3efd2a207089d944f12e1bbd640045ad4",
      "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
      "Sources/Slotstream/Layers.swift": "d5c867dd302a816cfa832560ab07b0ac1ddfcfc6eca0355c7e7aa667cf618118",
      "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "3c96b535d34f1d1d4d916a1918059f26e71b29b14bc6346580d9cc616511e6de",
      "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
      "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
      "Sources/Slotstream/Optimizations.swift": "d8f3da196fae79b93e08d58bda977e3eb05d0a59eb298bf54c31ae97da1d41b2",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "b8b8b2fefd76f801ff71bd46c9bc48c36dcf1a3517e23018bd473eab5b7ca0f9",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d6b34fefde61bc70af151e2827d2185e67cdf2222b1b08f5cee427914a05d8f9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "a93cb40a0a3e9532caffa7973bec0636706b6577a94b4de93e4f56f7ff13a1c1",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "7c566b0fbb41bd5c03c5043bee6362a8aca81d9d437e68846f0e2e3215c98964",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "652341c251b1a74e5debcb6e130fa67725c6fd1cf3a7ffa6b489c9449a14b5c1",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "4a23bf20f1374449ceeb923d24f92c1e4ff17858c44f10b7da356ec1a90153eb",
    "binary_sha256": "a0c01e4a07586cd61ebd88298b2cc4e72cbfa7b47b6c9b47d35584b2aac72bd8",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-selected-attention-v34/slotstream",
    "optimization-state-check",
    "--variant",
    "selected-attention-component",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32251068416,
    "swapins": 41705308,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316988.\nPages active:                                1018741.\nPages inactive:                               962833.\nPages speculative:                            193163.\nPages throttled:                                   0.\nPages wired down:                             225294.\nPages purgeable:                                3827.\n\"Translation faults\":                    13816106998.\nPages copy-on-write:                       628695276.\nPages zero filled:                       15503442858.\nPages reactivated:                        2329325548.\nPages purged:                               61910851.\nFile-backed pages:                           1647634.\nAnonymous pages:                              527103.\nPages stored in compressor:                  1321662.\nPages occupied by compressor:                 367147.\nDecompressions:                            964479609.\nCompressions:                             1258371630.\nPageins:                                  5877949640.\nPageouts:                                   10629188.\nSwapins:                                    41705308.\nSwapouts:                                   69922789.\nPages tagged:                                 174468.\nPages tagged resident:                        129304.\nPages tagged compressed:                       45164.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7208.\nPages tag-storage free:                         1530.\nPages tag-storage non-tag pageable:            89558.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7266560.\nTagged compressions:                         9446881.\nTagged decompressions:                       8693434.\n"
  },
  "exit_code": 1,
  "result_key": "passed",
  "assertions": 1,
  "duration_seconds": 0.656182167,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32246628352,
    "swapins": 41705308,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   316637.\nPages active:                                1020398.\nPages inactive:                               962801.\nPages speculative:                            193275.\nPages throttled:                                   0.\nPages wired down:                             223712.\nPages purgeable:                                3827.\n\"Translation faults\":                    13816117069.\nPages copy-on-write:                       628695925.\nPages zero filled:                       15503448830.\nPages reactivated:                        2329325548.\nPages purged:                               61910851.\nFile-backed pages:                           1647714.\nAnonymous pages:                              528760.\nPages stored in compressor:                  1321659.\nPages occupied by compressor:                 367147.\nDecompressions:                            964479612.\nCompressions:                             1258371630.\nPageins:                                  5877949676.\nPageouts:                                   10629188.\nSwapins:                                    41705308.\nSwapouts:                                   69922789.\nPages tagged:                                 174438.\nPages tagged resident:                        129274.\nPages tagged compressed:                       45164.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7208.\nPages tag-storage free:                         1519.\nPages tag-storage non-tag pageable:            89569.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7266560.\nTagged compressions:                         9446881.\nTagged decompressions:                       8693434.\n"
  }
}

```

## .build/optimization/selected-attention-component-v34/stdout.txt

SHA-256 `000b04acfb1954ada2ce29e192b1f9bcc126f58c98e3d2095f73c625e3803387`; 299 bytes.

```
{
  "items" : [
    {
      "detail" : "selected attention initialization produced incorrect bfloat16 values",
      "name" : "D256 kernel initialized for BF16 and FP32",
      "passed" : false
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-selected-attention",
  "passed" : false
}

```

## .build/optimization/selected-attention-component-v34/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/candidate-selected-attention-v35/build-identity.json

SHA-256 `34488724f4b5b9bd2f504e9a307a8cd110aed9e88bafc906f3372f73c1cebc2a`; 9689 bytes.

```
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
    "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
    "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
    "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "8c6a09c202ad6b970258d334d2bf53f3efd2a207089d944f12e1bbd640045ad4",
    "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
    "Sources/Slotstream/Layers.swift": "0794df325e66167f0686a9bb1ca09fc3529052041cf4ba3e1357b99443e89559",
    "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "3c96b535d34f1d1d4d916a1918059f26e71b29b14bc6346580d9cc616511e6de",
    "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
    "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
    "Sources/Slotstream/Optimizations.swift": "d8f3da196fae79b93e08d58bda977e3eb05d0a59eb298bf54c31ae97da1d41b2",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
    "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "4fc8f49e2015ebdeda5fb2d85a2c86ba0532b13ba6578e34bceb0384841adcff",
    "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
    "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
    "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d6b34fefde61bc70af151e2827d2185e67cdf2222b1b08f5cee427914a05d8f9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "a93cb40a0a3e9532caffa7973bec0636706b6577a94b4de93e4f56f7ff13a1c1",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "86896034d08c242d726d5dfa53a109d3101f6e35393e5c9f3943b8294634bd28",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "652341c251b1a74e5debcb6e130fa67725c6fd1cf3a7ffa6b489c9449a14b5c1",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
    "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "bf1e4cdac6853772ad14ce282dc3c9d4a68cb0e24b549a379b04612a126c5844",
  "binary_sha256": "35840c4080682a9636a32e2cb4ae8da7bf5463e51d4304a499f0d9d9c008028c",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/selected-attention-component-v35/manifest.json

SHA-256 `a1bf02686d04aeeac697164a54cdf8de5580014462a9bfe643ac6e31d1566f39`; 14522 bytes.

```
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-selected-attention-v35/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
      "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "8c6a09c202ad6b970258d334d2bf53f3efd2a207089d944f12e1bbd640045ad4",
      "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
      "Sources/Slotstream/Layers.swift": "0794df325e66167f0686a9bb1ca09fc3529052041cf4ba3e1357b99443e89559",
      "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "3c96b535d34f1d1d4d916a1918059f26e71b29b14bc6346580d9cc616511e6de",
      "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
      "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
      "Sources/Slotstream/Optimizations.swift": "d8f3da196fae79b93e08d58bda977e3eb05d0a59eb298bf54c31ae97da1d41b2",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "4fc8f49e2015ebdeda5fb2d85a2c86ba0532b13ba6578e34bceb0384841adcff",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d6b34fefde61bc70af151e2827d2185e67cdf2222b1b08f5cee427914a05d8f9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "a93cb40a0a3e9532caffa7973bec0636706b6577a94b4de93e4f56f7ff13a1c1",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "86896034d08c242d726d5dfa53a109d3101f6e35393e5c9f3943b8294634bd28",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "652341c251b1a74e5debcb6e130fa67725c6fd1cf3a7ffa6b489c9449a14b5c1",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "bf1e4cdac6853772ad14ce282dc3c9d4a68cb0e24b549a379b04612a126c5844",
    "binary_sha256": "35840c4080682a9636a32e2cb4ae8da7bf5463e51d4304a499f0d9d9c008028c",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-selected-attention-v35/slotstream",
    "optimization-state-check",
    "--variant",
    "selected-attention-component",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32304250880,
    "swapins": 41705312,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   304085.\nPages active:                                1018979.\nPages inactive:                               972032.\nPages speculative:                            196842.\nPages throttled:                                   0.\nPages wired down:                             225071.\nPages purgeable:                                3899.\n\"Translation faults\":                    13817154814.\nPages copy-on-write:                       628791632.\nPages zero filled:                       15504107502.\nPages reactivated:                        2329326478.\nPages purged:                               61913022.\nFile-backed pages:                           1663711.\nAnonymous pages:                              524142.\nPages stored in compressor:                  1320464.\nPages occupied by compressor:                 366910.\nDecompressions:                            964480760.\nCompressions:                             1258371630.\nPageins:                                  5877963450.\nPageouts:                                   10629188.\nSwapins:                                    41705312.\nSwapouts:                                   69922789.\nPages tagged:                                 175622.\nPages tagged resident:                        130531.\nPages tagged compressed:                       45091.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7208.\nPages tag-storage free:                         1518.\nPages tag-storage non-tag pageable:            89570.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7254144.\nTagged compressions:                         9446881.\nTagged decompressions:                       8693495.\n"
  },
  "exit_code": 1,
  "result_key": "passed",
  "assertions": 220,
  "duration_seconds": 3.341906166,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32470876160,
    "swapins": 41705312,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   303851.\nPages active:                                1035447.\nPages inactive:                               972015.\nPages speculative:                            196985.\nPages throttled:                                   0.\nPages wired down:                             208971.\nPages purgeable:                               13922.\n\"Translation faults\":                    13817180384.\nPages copy-on-write:                       628792482.\nPages zero filled:                       15504122580.\nPages reactivated:                        2329326478.\nPages purged:                               61913022.\nFile-backed pages:                           1664092.\nAnonymous pages:                              540355.\nPages stored in compressor:                  1320462.\nPages occupied by compressor:                 366909.\nDecompressions:                            964480762.\nCompressions:                             1258371630.\nPageins:                                  5877963795.\nPageouts:                                   10629188.\nSwapins:                                    41705312.\nSwapouts:                                   69922789.\nPages tagged:                                 175567.\nPages tagged resident:                        130476.\nPages tagged compressed:                       45091.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7208.\nPages tag-storage free:                         1521.\nPages tag-storage non-tag pageable:            89567.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7254144.\nTagged compressions:                         9446881.\nTagged decompressions:                       8693495.\n"
  }
}

```

## .build/optimization/selected-attention-component-v35/stdout.txt

SHA-256 `1d9ddc10e716da6048706815bc6e62db2a190c940490261d31bcaa2dbd9f9eac`; 37436 bytes.

```
{
  "items" : [
    {
      "name" : "D256 kernel initialized for BF16 and FP32",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S1.N1.float32.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S1.N1.float32.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S1.N1.float32.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S1.N1.float32.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S1.N1.float32.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S1.N1.float32.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S1.N1.bfloat16.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S1.N1.bfloat16.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S1.N1.bfloat16.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S1.N1.bfloat16.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S1.N1.bfloat16.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S1.N1.bfloat16.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.float32.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.float32.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.float32.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.float32.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.float32.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.float32.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.float32.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.float32.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.float32.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.float32.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.float32.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.float32.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.bfloat16.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.bfloat16.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.bfloat16.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.bfloat16.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.bfloat16.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.bfloat16.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.bfloat16.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.bfloat16.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.bfloat16.pattern2.sparsefalse: Float64 oracle band",
      "passed" : false
    },
    {
      "name" : "B2.H4.HK2.S8.N31.bfloat16.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B2.H4.HK2.S8.N31.bfloat16.pattern2.sparsetrue: Float64 oracle band",
      "passed" : false
    },
    {
      "name" : "B2.H4.HK2.S8.N31.bfloat16.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "negative base rejected",
      "passed" : true
    },
    {
      "name" : "keys cannot end before queries",
      "passed" : true
    },
    {
      "name" : "mismatched dtype rejected",
      "passed" : true
    },
    {
      "name" : "wrong head dimension rejected",
      "passed" : true
    },
    {
      "name" : "wrong selection shape rejected",
      "passed" : true
    },
    {
      "name" : "all-masked rows retain finite-minimum uniform semantics float32",
      "passed" : false
    },
    {
      "name" : "all-masked rows retain finite-minimum uniform semantics bfloat16",
      "passed" : true
    }
  ],
  "measurements" : {
    "B1.H2.HK1.S1.N1.bfloat16.pattern0.sparsefalse.candidate_error" : 0,
    "B1.H2.HK1.S1.N1.bfloat16.pattern0.sparsefalse.reference_error" : 0,
    "B1.H2.HK1.S1.N1.bfloat16.pattern1.sparsefalse.candidate_error" : 0,
    "B1.H2.HK1.S1.N1.bfloat16.pattern1.sparsefalse.reference_error" : 0,
    "B1.H2.HK1.S1.N1.bfloat16.pattern2.sparsefalse.candidate_error" : 0,
    "B1.H2.HK1.S1.N1.bfloat16.pattern2.sparsefalse.reference_error" : 0,
    "B1.H2.HK1.S1.N1.float32.pattern0.sparsefalse.candidate_error" : 0,
    "B1.H2.HK1.S1.N1.float32.pattern0.sparsefalse.reference_error" : 0,
    "B1.H2.HK1.S1.N1.float32.pattern1.sparsefalse.candidate_error" : 0,
    "B1.H2.HK1.S1.N1.float32.pattern1.sparsefalse.reference_error" : 0,
    "B1.H2.HK1.S1.N1.float32.pattern2.sparsefalse.candidate_error" : 0,
    "B1.H2.HK1.S1.N1.float32.pattern2.sparsefalse.reference_error" : 0,
    "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsefalse.candidate_error" : 0.0007320175751898972,
    "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsefalse.reference_error" : 0.0008732456141934686,
    "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsetrue.candidate_error" : 0.0007320175751898972,
    "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsetrue.reference_error" : 0.0008732456141934686,
    "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsefalse.candidate_error" : 6.006634424602503e-05,
    "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsefalse.reference_error" : 0.00013228336653386963,
    "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsetrue.candidate_error" : 6.006634424602503e-05,
    "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsetrue.reference_error" : 0.00013228336653386963,
    "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsefalse.candidate_error" : 0.7025656878312996,
    "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsefalse.reference_error" : 0.7025656878312996,
    "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsetrue.candidate_error" : 0.7025656878312996,
    "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsetrue.reference_error" : 0.7025656878312996,
    "B1.H2.HK1.S17.N257.float32.pattern0.sparsefalse.candidate_error" : 1.463244495569782e-07,
    "B1.H2.HK1.S17.N257.float32.pattern0.sparsefalse.reference_error" : 1.0068949751751433e-07,
    "B1.H2.HK1.S17.N257.float32.pattern0.sparsetrue.candidate_error" : 1.4060791621306468e-07,
    "B1.H2.HK1.S17.N257.float32.pattern0.sparsetrue.reference_error" : 1.0068949751751433e-07,
    "B1.H2.HK1.S17.N257.float32.pattern1.sparsefalse.candidate_error" : 9.276121364087953e-10,
    "B1.H2.HK1.S17.N257.float32.pattern1.sparsefalse.reference_error" : 1.2521536998238991e-08,
    "B1.H2.HK1.S17.N257.float32.pattern1.sparsetrue.candidate_error" : 9.276121364087953e-10,
    "B1.H2.HK1.S17.N257.float32.pattern1.sparsetrue.reference_error" : 1.2521536998238991e-08,
    "B1.H2.HK1.S17.N257.float32.pattern2.sparsefalse.candidate_error" : 2.986150393624598e-07,
    "B1.H2.HK1.S17.N257.float32.pattern2.sparsefalse.reference_error" : 3.118523657086314e-07,
    "B1.H2.HK1.S17.N257.float32.pattern2.sparsetrue.candidate_error" : 4.668260706885974e-07,
    "B1.H2.HK1.S17.N257.float32.pattern2.sparsetrue.reference_error" : 3.118523657086314e-07,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsefalse.candidate_error" : 0.00012627942827406202,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsefalse.reference_error" : 0.00018423559886806065,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsetrue.candidate_error" : 0.00012627942827406202,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsetrue.reference_error" : 0.00018423559886806065,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsefalse.candidate_error" : 7.62939453125e-06,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsefalse.reference_error" : 1.3921871175987758e-05,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsetrue.candidate_error" : 7.62939453125e-06,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsetrue.reference_error" : 1.3921871175987758e-05,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsefalse.candidate_error" : 0.0011611688677465315,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsefalse.reference_error" : 0.0027450811322540236,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsetrue.candidate_error" : 0.0011611688677465315,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsetrue.reference_error" : 0.0027450811322540236,
    "B1.H2.HK1.S9.N2051.float32.pattern0.sparsefalse.candidate_error" : 1.1607579641567667e-07,
    "B1.H2.HK1.S9.N2051.float32.pattern0.sparsefalse.reference_error" : 2.0543974150327715e-08,
    "B1.H2.HK1.S9.N2051.float32.pattern0.sparsetrue.candidate_error" : 1.3472793925980997e-07,
    "B1.H2.HK1.S9.N2051.float32.pattern0.sparsetrue.reference_error" : 2.0543974150327715e-08,
    "B1.H2.HK1.S9.N2051.float32.pattern1.sparsefalse.candidate_error" : 1.1521985926118972e-10,
    "B1.H2.HK1.S9.N2051.float32.pattern1.sparsefalse.reference_error" : 4.882277747017549e-09,
    "B1.H2.HK1.S9.N2051.float32.pattern1.sparsetrue.candidate_error" : 1.1521985926118972e-10,
    "B1.H2.HK1.S9.N2051.float32.pattern1.sparsetrue.reference_error" : 4.882277747017549e-09,
    "B1.H2.HK1.S9.N2051.float32.pattern2.sparsefalse.candidate_error" : 2.707280445934934e-07,
    "B1.H2.HK1.S9.N2051.float32.pattern2.sparsefalse.reference_error" : 1.1069854594092376e-07,
    "B1.H2.HK1.S9.N2051.float32.pattern2.sparsetrue.candidate_error" : 2.0750046081374762e-07,
    "B1.H2.HK1.S9.N2051.float32.pattern2.sparsetrue.reference_error" : 1.1069854594092376e-07,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsefalse.candidate_error" : 9.48952492512492e-05,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsefalse.reference_error" : 0.0001357667231576959,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsetrue.candidate_error" : 0.00012464393926901046,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsetrue.reference_error" : 0.00016303014988200415,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsefalse.candidate_error" : 3.814697265625e-06,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsefalse.reference_error" : 5.543902334199328e-06,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsetrue.candidate_error" : 7.62939453125e-06,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsetrue.reference_error" : 1.833148004961498e-05,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsefalse.candidate_error" : 0.0009765691188454717,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsefalse.reference_error" : 0.0023437500136719858,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsetrue.candidate_error" : 0.0011160714285713969,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsetrue.reference_error" : 0.0018420679742033874,
    "B1.H2.HK1.S9.N4097.float32.pattern0.sparsefalse.candidate_error" : 1.3250931629044116e-07,
    "B1.H2.HK1.S9.N4097.float32.pattern0.sparsefalse.reference_error" : 1.4994373662841065e-08,
    "B1.H2.HK1.S9.N4097.float32.pattern0.sparsetrue.candidate_error" : 1.4906853488053096e-07,
    "B1.H2.HK1.S9.N4097.float32.pattern0.sparsetrue.reference_error" : 2.480535938806372e-08,
    "B1.H2.HK1.S9.N4097.float32.pattern1.sparsefalse.candidate_error" : 5.776722503125775e-11,
    "B1.H2.HK1.S9.N4097.float32.pattern1.sparsefalse.reference_error" : 4.360125159140124e-09,
    "B1.H2.HK1.S9.N4097.float32.pattern1.sparsetrue.candidate_error" : 1.1521985926118972e-10,
    "B1.H2.HK1.S9.N4097.float32.pattern1.sparsetrue.reference_error" : 4.882277747017549e-09,
    "B1.H2.HK1.S9.N4097.float32.pattern2.sparsefalse.candidate_error" : 1.7365967119875592e-07,
    "B1.H2.HK1.S9.N4097.float32.pattern2.sparsefalse.reference_error" : 1.5517636992035122e-07,
    "B1.H2.HK1.S9.N4097.float32.pattern2.sparsetrue.candidate_error" : 1.7764150339605322e-07,
    "B1.H2.HK1.S9.N4097.float32.pattern2.sparsetrue.reference_error" : 1.1519915266156033e-07,
    "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsefalse.candidate_error" : 0.0029644549826893796,
    "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsefalse.reference_error" : 0.003282908528961348,
    "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsetrue.candidate_error" : 0.0029644549826893796,
    "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsetrue.reference_error" : 0.003282908528961348,
    "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsefalse.candidate_error" : 0.00048828125,
    "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsefalse.reference_error" : 0.0008463541666666741,
    "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsetrue.candidate_error" : 0.00048828125,
    "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsetrue.reference_error" : 0.0008463541666666741,
    "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsefalse.candidate_error" : 0.7613768355949793,
    "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsefalse.reference_error" : 0.7613768355949793,
    "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsetrue.candidate_error" : 0.7613768355949793,
    "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsetrue.reference_error" : 0.7613768355949793,
    "B1.H24.HK2.S9.N33.float32.pattern0.sparsefalse.candidate_error" : 2.194149861800554e-07,
    "B1.H24.HK2.S9.N33.float32.pattern0.sparsefalse.reference_error" : 0.0003641857628875478,
    "B1.H24.HK2.S9.N33.float32.pattern0.sparsetrue.candidate_error" : 2.455566465164871e-07,
    "B1.H24.HK2.S9.N33.float32.pattern0.sparsetrue.reference_error" : 0.0003641857628875478,
    "B1.H24.HK2.S9.N33.float32.pattern1.sparsefalse.candidate_error" : 6.729556689677452e-09,
    "B1.H24.HK2.S9.N33.float32.pattern1.sparsefalse.reference_error" : 0.0001576029021164438,
    "B1.H24.HK2.S9.N33.float32.pattern1.sparsetrue.candidate_error" : 6.729556689677452e-09,
    "B1.H24.HK2.S9.N33.float32.pattern1.sparsetrue.reference_error" : 0.0001576029021164438,
    "B1.H24.HK2.S9.N33.float32.pattern2.sparsefalse.candidate_error" : 3.203850500455019e-07,
    "B1.H24.HK2.S9.N33.float32.pattern2.sparsefalse.reference_error" : 0.0010223287019104355,
    "B1.H24.HK2.S9.N33.float32.pattern2.sparsetrue.candidate_error" : 3.5509220341900516e-07,
    "B1.H24.HK2.S9.N33.float32.pattern2.sparsetrue.reference_error" : 0.0010223287019104355,
    "B2.H4.HK2.S8.N31.bfloat16.pattern0.sparsefalse.candidate_error" : 0.0028709168903080506,
    "B2.H4.HK2.S8.N31.bfloat16.pattern0.sparsefalse.reference_error" : 0.0019429162245603315,
    "B2.H4.HK2.S8.N31.bfloat16.pattern0.sparsetrue.candidate_error" : 0.0028709168903080506,
    "B2.H4.HK2.S8.N31.bfloat16.pattern0.sparsetrue.reference_error" : 0.0019429162245603315,
    "B2.H4.HK2.S8.N31.bfloat16.pattern1.sparsefalse.candidate_error" : 0.0004725302419354982,
    "B2.H4.HK2.S8.N31.bfloat16.pattern1.sparsefalse.reference_error" : 0.0004725302419354982,
    "B2.H4.HK2.S8.N31.bfloat16.pattern1.sparsetrue.candidate_error" : 0.0004725302419354982,
    "B2.H4.HK2.S8.N31.bfloat16.pattern1.sparsetrue.reference_error" : 0.0004725302419354982,
    "B2.H4.HK2.S8.N31.bfloat16.pattern2.sparsefalse.candidate_error" : 0.43776715560242363,
    "B2.H4.HK2.S8.N31.bfloat16.pattern2.sparsefalse.reference_error" : 0.004785136819953184,
    "B2.H4.HK2.S8.N31.bfloat16.pattern2.sparsetrue.candidate_error" : 0.437767178885488,
    "B2.H4.HK2.S8.N31.bfloat16.pattern2.sparsetrue.reference_error" : 0.004785136819953184,
    "B2.H4.HK2.S8.N31.float32.pattern0.sparsefalse.candidate_error" : 2.134849234058933e-07,
    "B2.H4.HK2.S8.N31.float32.pattern0.sparsefalse.reference_error" : 1.3473682580755764e-07,
    "B2.H4.HK2.S8.N31.float32.pattern0.sparsetrue.candidate_error" : 2.0681565737756813e-07,
    "B2.H4.HK2.S8.N31.float32.pattern0.sparsetrue.reference_error" : 1.3473682580755764e-07,
    "B2.H4.HK2.S8.N31.float32.pattern1.sparsefalse.candidate_error" : 6.729556689677452e-09,
    "B2.H4.HK2.S8.N31.float32.pattern1.sparsefalse.reference_error" : 6.729556689677452e-09,
    "B2.H4.HK2.S8.N31.float32.pattern1.sparsetrue.candidate_error" : 6.729556689677452e-09,
    "B2.H4.HK2.S8.N31.float32.pattern1.sparsetrue.reference_error" : 6.729556689677452e-09,
    "B2.H4.HK2.S8.N31.float32.pattern2.sparsefalse.candidate_error" : 2.968448025164605e-07,
    "B2.H4.HK2.S8.N31.float32.pattern2.sparsefalse.reference_error" : 2.9400404066848296e-07,
    "B2.H4.HK2.S8.N31.float32.pattern2.sparsetrue.candidate_error" : 3.4357152367547883e-07,
    "B2.H4.HK2.S8.N31.float32.pattern2.sparsetrue.reference_error" : 2.9400404066848296e-07
  },
  "name" : "optimization-selected-attention",
  "passed" : false
}

```

## .build/optimization/selected-attention-component-v35/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/candidate-selected-attention-v36/build-identity.json

SHA-256 `22bdfc6ae3433f2172ec863315129caa7d34e8e561ebc53e3f702479d4c68a8f`; 9689 bytes.

```
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
    "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
    "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
    "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
    "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
    "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "8c6a09c202ad6b970258d334d2bf53f3efd2a207089d944f12e1bbd640045ad4",
    "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
    "Sources/Slotstream/Layers.swift": "7140e68b03c501dbfbe775daf511145a6ad19ad8d932f8e2fa9b3c6f12f05628",
    "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
    "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "3c96b535d34f1d1d4d916a1918059f26e71b29b14bc6346580d9cc616511e6de",
    "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
    "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
    "Sources/Slotstream/Optimizations.swift": "d8f3da196fae79b93e08d58bda977e3eb05d0a59eb298bf54c31ae97da1d41b2",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
    "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
    "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
    "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d6b34fefde61bc70af151e2827d2185e67cdf2222b1b08f5cee427914a05d8f9",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "a93cb40a0a3e9532caffa7973bec0636706b6577a94b4de93e4f56f7ff13a1c1",
    "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
    "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
    "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
    "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
    "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
    "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
    "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
    "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
    "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
    "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "652341c251b1a74e5debcb6e130fa67725c6fd1cf3a7ffa6b489c9449a14b5c1",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
    "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "d5fe4e4f071f68a81e5a109c28aa1d1d0281d1b9ff6b9cc62f8d78597b100760",
  "binary_sha256": "f659d9ba4f35fbe68b1d6251df91215a58496e3970fc8e2f1dcb83a10959a7bd",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

```

## .build/optimization/selected-attention-component-v36/manifest.json

SHA-256 `6f187627be59f7d456a9df2d4f5b725371fb3ac4ae882b3a0b780acb891065b4`; 14520 bytes.

```
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-selected-attention-v36/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
      "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "8c6a09c202ad6b970258d334d2bf53f3efd2a207089d944f12e1bbd640045ad4",
      "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
      "Sources/Slotstream/Layers.swift": "7140e68b03c501dbfbe775daf511145a6ad19ad8d932f8e2fa9b3c6f12f05628",
      "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "3c96b535d34f1d1d4d916a1918059f26e71b29b14bc6346580d9cc616511e6de",
      "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
      "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
      "Sources/Slotstream/Optimizations.swift": "d8f3da196fae79b93e08d58bda977e3eb05d0a59eb298bf54c31ae97da1d41b2",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d6b34fefde61bc70af151e2827d2185e67cdf2222b1b08f5cee427914a05d8f9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "a93cb40a0a3e9532caffa7973bec0636706b6577a94b4de93e4f56f7ff13a1c1",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "652341c251b1a74e5debcb6e130fa67725c6fd1cf3a7ffa6b489c9449a14b5c1",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "d5fe4e4f071f68a81e5a109c28aa1d1d0281d1b9ff6b9cc62f8d78597b100760",
    "binary_sha256": "f659d9ba4f35fbe68b1d6251df91215a58496e3970fc8e2f1dcb83a10959a7bd",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-selected-attention-v36/slotstream",
    "optimization-state-check",
    "--variant",
    "selected-attention-component",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32082444288,
    "swapins": 41705328,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   548170.\nPages active:                                 827963.\nPages inactive:                               945007.\nPages speculative:                            172574.\nPages throttled:                                   0.\nPages wired down:                             224763.\nPages purgeable:                                3999.\n\"Translation faults\":                    13818268817.\nPages copy-on-write:                       628869146.\nPages zero filled:                       15504917139.\nPages reactivated:                        2329327727.\nPages purged:                               61915313.\nFile-backed pages:                           1405988.\nAnonymous pages:                              539556.\nPages stored in compressor:                  1317636.\nPages occupied by compressor:                 365575.\nDecompressions:                            964483247.\nCompressions:                             1258371630.\nPageins:                                  5877976195.\nPageouts:                                   10629188.\nSwapins:                                    41705328.\nSwapouts:                                   69922789.\nPages tagged:                                 175145.\nPages tagged resident:                        130228.\nPages tagged compressed:                       44917.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7207.\nPages tag-storage free:                         1562.\nPages tag-storage non-tag pageable:            89527.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7234944.\nTagged compressions:                         9446881.\nTagged decompressions:                       8693653.\n"
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 208,
  "duration_seconds": 1.32116925,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32248594432,
    "swapins": 41705328,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   548191.\nPages active:                                 843623.\nPages inactive:                               944973.\nPages speculative:                            172700.\nPages throttled:                                   0.\nPages wired down:                             208902.\nPages purgeable:                               14022.\n\"Translation faults\":                    13818286123.\nPages copy-on-write:                       628869882.\nPages zero filled:                       15504928950.\nPages reactivated:                        2329327727.\nPages purged:                               61915313.\nFile-backed pages:                           1406085.\nAnonymous pages:                              555211.\nPages stored in compressor:                  1317629.\nPages occupied by compressor:                 365572.\nDecompressions:                            964483254.\nCompressions:                             1258371630.\nPageins:                                  5877976239.\nPageouts:                                   10629188.\nSwapins:                                    41705328.\nSwapouts:                                   69922789.\nPages tagged:                                 175135.\nPages tagged resident:                        130221.\nPages tagged compressed:                       44914.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7207.\nPages tag-storage free:                         1559.\nPages tag-storage non-tag pageable:            89530.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7234944.\nTagged compressions:                         9446881.\nTagged decompressions:                       8693656.\n"
  }
}

```

## .build/optimization/selected-attention-component-v36/stdout.txt

SHA-256 `662addf8b133a48b4cec2790eec40a605d32e2273391163dfe837650560b2c9e`; 32778 bytes.

```
{
  "items" : [
    {
      "name" : "D256 kernel initialized for BF16 and FP32",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 1, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 3, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 5, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2048, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2049, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2050, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2051, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 2052, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value 0.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value 0.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value 1.0: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value 1.0: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value nan: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value nan: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value inf: unique visible IDs",
      "passed" : true
    },
    {
      "name" : "compact IDs end 4097, value inf: exact reference keep set",
      "passed" : true
    },
    {
      "name" : "short-query shape S1.float32.pattern0 rejects prefill kernel",
      "passed" : true
    },
    {
      "name" : "short-query S1.float32.pattern0: exact production fallback",
      "passed" : true
    },
    {
      "name" : "short-query shape S1.float32.pattern1 rejects prefill kernel",
      "passed" : true
    },
    {
      "name" : "short-query S1.float32.pattern1: exact production fallback",
      "passed" : true
    },
    {
      "name" : "short-query shape S1.float32.pattern2 rejects prefill kernel",
      "passed" : true
    },
    {
      "name" : "short-query S1.float32.pattern2: exact production fallback",
      "passed" : true
    },
    {
      "name" : "short-query shape S1.bfloat16.pattern0 rejects prefill kernel",
      "passed" : true
    },
    {
      "name" : "short-query S1.bfloat16.pattern0: exact production fallback",
      "passed" : true
    },
    {
      "name" : "short-query shape S1.bfloat16.pattern1 rejects prefill kernel",
      "passed" : true
    },
    {
      "name" : "short-query S1.bfloat16.pattern1: exact production fallback",
      "passed" : true
    },
    {
      "name" : "short-query shape S1.bfloat16.pattern2 rejects prefill kernel",
      "passed" : true
    },
    {
      "name" : "short-query S1.bfloat16.pattern2: exact production fallback",
      "passed" : true
    },
    {
      "name" : "short-query shape S8.float32.pattern0 rejects prefill kernel",
      "passed" : true
    },
    {
      "name" : "short-query S8.float32.pattern0: exact production fallback",
      "passed" : true
    },
    {
      "name" : "short-query shape S8.float32.pattern1 rejects prefill kernel",
      "passed" : true
    },
    {
      "name" : "short-query S8.float32.pattern1: exact production fallback",
      "passed" : true
    },
    {
      "name" : "short-query shape S8.float32.pattern2 rejects prefill kernel",
      "passed" : true
    },
    {
      "name" : "short-query S8.float32.pattern2: exact production fallback",
      "passed" : true
    },
    {
      "name" : "short-query shape S8.bfloat16.pattern0 rejects prefill kernel",
      "passed" : true
    },
    {
      "name" : "short-query S8.bfloat16.pattern0: exact production fallback",
      "passed" : true
    },
    {
      "name" : "short-query shape S8.bfloat16.pattern1 rejects prefill kernel",
      "passed" : true
    },
    {
      "name" : "short-query S8.bfloat16.pattern1: exact production fallback",
      "passed" : true
    },
    {
      "name" : "short-query shape S8.bfloat16.pattern2 rejects prefill kernel",
      "passed" : true
    },
    {
      "name" : "short-query S8.bfloat16.pattern2: exact production fallback",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.float32.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.float32.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.float32.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.float32.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsefalse: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsefalse: repeatable output",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsetrue: Float64 oracle band",
      "passed" : true
    },
    {
      "name" : "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsetrue: repeatable output",
      "passed" : true
    },
    {
      "name" : "negative base rejected",
      "passed" : true
    },
    {
      "name" : "keys cannot end before queries",
      "passed" : true
    },
    {
      "name" : "mismatched dtype rejected",
      "passed" : true
    },
    {
      "name" : "wrong head dimension rejected",
      "passed" : true
    },
    {
      "name" : "wrong selection shape rejected",
      "passed" : true
    },
    {
      "name" : "all-masked rows retain finite-minimum uniform semantics float32",
      "passed" : true
    },
    {
      "name" : "all-masked rows retain finite-minimum uniform semantics bfloat16",
      "passed" : true
    }
  ],
  "measurements" : {
    "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsefalse.candidate_error" : 0.0007320175751898972,
    "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsefalse.reference_error" : 0.0008732456141934686,
    "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsetrue.candidate_error" : 0.0007320175751898972,
    "B1.H2.HK1.S17.N257.bfloat16.pattern0.sparsetrue.reference_error" : 0.0008732456141934686,
    "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsefalse.candidate_error" : 6.006634424602503e-05,
    "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsefalse.reference_error" : 0.00013228336653386963,
    "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsetrue.candidate_error" : 6.006634424602503e-05,
    "B1.H2.HK1.S17.N257.bfloat16.pattern1.sparsetrue.reference_error" : 0.00013228336653386963,
    "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsefalse.candidate_error" : 0.7025656878312996,
    "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsefalse.reference_error" : 0.7025656878312996,
    "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsetrue.candidate_error" : 0.7025656878312996,
    "B1.H2.HK1.S17.N257.bfloat16.pattern2.sparsetrue.reference_error" : 0.7025656878312996,
    "B1.H2.HK1.S17.N257.float32.pattern0.sparsefalse.candidate_error" : 1.463244495569782e-07,
    "B1.H2.HK1.S17.N257.float32.pattern0.sparsefalse.reference_error" : 1.0068949751751433e-07,
    "B1.H2.HK1.S17.N257.float32.pattern0.sparsetrue.candidate_error" : 1.4060791621306468e-07,
    "B1.H2.HK1.S17.N257.float32.pattern0.sparsetrue.reference_error" : 1.0068949751751433e-07,
    "B1.H2.HK1.S17.N257.float32.pattern1.sparsefalse.candidate_error" : 9.276121364087953e-10,
    "B1.H2.HK1.S17.N257.float32.pattern1.sparsefalse.reference_error" : 1.2521536998238991e-08,
    "B1.H2.HK1.S17.N257.float32.pattern1.sparsetrue.candidate_error" : 9.276121364087953e-10,
    "B1.H2.HK1.S17.N257.float32.pattern1.sparsetrue.reference_error" : 1.2521536998238991e-08,
    "B1.H2.HK1.S17.N257.float32.pattern2.sparsefalse.candidate_error" : 2.986150393624598e-07,
    "B1.H2.HK1.S17.N257.float32.pattern2.sparsefalse.reference_error" : 3.118523657086314e-07,
    "B1.H2.HK1.S17.N257.float32.pattern2.sparsetrue.candidate_error" : 4.668260706885974e-07,
    "B1.H2.HK1.S17.N257.float32.pattern2.sparsetrue.reference_error" : 3.118523657086314e-07,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsefalse.candidate_error" : 0.00012627942827406202,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsefalse.reference_error" : 0.00018423559886806065,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsetrue.candidate_error" : 0.00012627942827406202,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern0.sparsetrue.reference_error" : 0.00018423559886806065,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsefalse.candidate_error" : 7.62939453125e-06,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsefalse.reference_error" : 1.3921871175987758e-05,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsetrue.candidate_error" : 7.62939453125e-06,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern1.sparsetrue.reference_error" : 1.3921871175987758e-05,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsefalse.candidate_error" : 0.0011611688677465315,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsefalse.reference_error" : 0.0027450811322540236,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsetrue.candidate_error" : 0.0011611688677465315,
    "B1.H2.HK1.S9.N2051.bfloat16.pattern2.sparsetrue.reference_error" : 0.0027450811322540236,
    "B1.H2.HK1.S9.N2051.float32.pattern0.sparsefalse.candidate_error" : 1.1607579641567667e-07,
    "B1.H2.HK1.S9.N2051.float32.pattern0.sparsefalse.reference_error" : 2.0543974150327715e-08,
    "B1.H2.HK1.S9.N2051.float32.pattern0.sparsetrue.candidate_error" : 1.3472793925980997e-07,
    "B1.H2.HK1.S9.N2051.float32.pattern0.sparsetrue.reference_error" : 2.0543974150327715e-08,
    "B1.H2.HK1.S9.N2051.float32.pattern1.sparsefalse.candidate_error" : 1.1521985926118972e-10,
    "B1.H2.HK1.S9.N2051.float32.pattern1.sparsefalse.reference_error" : 4.882277747017549e-09,
    "B1.H2.HK1.S9.N2051.float32.pattern1.sparsetrue.candidate_error" : 1.1521985926118972e-10,
    "B1.H2.HK1.S9.N2051.float32.pattern1.sparsetrue.reference_error" : 4.882277747017549e-09,
    "B1.H2.HK1.S9.N2051.float32.pattern2.sparsefalse.candidate_error" : 2.707280445934934e-07,
    "B1.H2.HK1.S9.N2051.float32.pattern2.sparsefalse.reference_error" : 1.1069854594092376e-07,
    "B1.H2.HK1.S9.N2051.float32.pattern2.sparsetrue.candidate_error" : 2.0750046081374762e-07,
    "B1.H2.HK1.S9.N2051.float32.pattern2.sparsetrue.reference_error" : 1.1069854594092376e-07,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsefalse.candidate_error" : 9.48952492512492e-05,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsefalse.reference_error" : 0.0001357667231576959,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsetrue.candidate_error" : 0.00012464393926901046,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern0.sparsetrue.reference_error" : 0.00016303014988200415,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsefalse.candidate_error" : 3.814697265625e-06,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsefalse.reference_error" : 5.543902334199328e-06,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsetrue.candidate_error" : 7.62939453125e-06,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern1.sparsetrue.reference_error" : 1.833148004961498e-05,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsefalse.candidate_error" : 0.0009765691188454717,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsefalse.reference_error" : 0.0023437500136719858,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsetrue.candidate_error" : 0.0011160714285713969,
    "B1.H2.HK1.S9.N4097.bfloat16.pattern2.sparsetrue.reference_error" : 0.0018420679742033874,
    "B1.H2.HK1.S9.N4097.float32.pattern0.sparsefalse.candidate_error" : 1.3250931629044116e-07,
    "B1.H2.HK1.S9.N4097.float32.pattern0.sparsefalse.reference_error" : 1.4994373662841065e-08,
    "B1.H2.HK1.S9.N4097.float32.pattern0.sparsetrue.candidate_error" : 1.4906853488053096e-07,
    "B1.H2.HK1.S9.N4097.float32.pattern0.sparsetrue.reference_error" : 2.480535938806372e-08,
    "B1.H2.HK1.S9.N4097.float32.pattern1.sparsefalse.candidate_error" : 5.776722503125775e-11,
    "B1.H2.HK1.S9.N4097.float32.pattern1.sparsefalse.reference_error" : 4.360125159140124e-09,
    "B1.H2.HK1.S9.N4097.float32.pattern1.sparsetrue.candidate_error" : 1.1521985926118972e-10,
    "B1.H2.HK1.S9.N4097.float32.pattern1.sparsetrue.reference_error" : 4.882277747017549e-09,
    "B1.H2.HK1.S9.N4097.float32.pattern2.sparsefalse.candidate_error" : 1.7365967119875592e-07,
    "B1.H2.HK1.S9.N4097.float32.pattern2.sparsefalse.reference_error" : 1.5517636992035122e-07,
    "B1.H2.HK1.S9.N4097.float32.pattern2.sparsetrue.candidate_error" : 1.7764150339605322e-07,
    "B1.H2.HK1.S9.N4097.float32.pattern2.sparsetrue.reference_error" : 1.1519915266156033e-07,
    "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsefalse.candidate_error" : 0.0029644549826893796,
    "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsefalse.reference_error" : 0.003282908528961348,
    "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsetrue.candidate_error" : 0.0029644549826893796,
    "B1.H24.HK2.S9.N33.bfloat16.pattern0.sparsetrue.reference_error" : 0.003282908528961348,
    "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsefalse.candidate_error" : 0.00048828125,
    "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsefalse.reference_error" : 0.0008463541666666741,
    "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsetrue.candidate_error" : 0.00048828125,
    "B1.H24.HK2.S9.N33.bfloat16.pattern1.sparsetrue.reference_error" : 0.0008463541666666741,
    "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsefalse.candidate_error" : 0.7613768355949793,
    "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsefalse.reference_error" : 0.7613768355949793,
    "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsetrue.candidate_error" : 0.7613768355949793,
    "B1.H24.HK2.S9.N33.bfloat16.pattern2.sparsetrue.reference_error" : 0.7613768355949793,
    "B1.H24.HK2.S9.N33.float32.pattern0.sparsefalse.candidate_error" : 2.194149861800554e-07,
    "B1.H24.HK2.S9.N33.float32.pattern0.sparsefalse.reference_error" : 0.0003641857628875478,
    "B1.H24.HK2.S9.N33.float32.pattern0.sparsetrue.candidate_error" : 2.455566465164871e-07,
    "B1.H24.HK2.S9.N33.float32.pattern0.sparsetrue.reference_error" : 0.0003641857628875478,
    "B1.H24.HK2.S9.N33.float32.pattern1.sparsefalse.candidate_error" : 6.729556689677452e-09,
    "B1.H24.HK2.S9.N33.float32.pattern1.sparsefalse.reference_error" : 0.0001576029021164438,
    "B1.H24.HK2.S9.N33.float32.pattern1.sparsetrue.candidate_error" : 6.729556689677452e-09,
    "B1.H24.HK2.S9.N33.float32.pattern1.sparsetrue.reference_error" : 0.0001576029021164438,
    "B1.H24.HK2.S9.N33.float32.pattern2.sparsefalse.candidate_error" : 3.203850500455019e-07,
    "B1.H24.HK2.S9.N33.float32.pattern2.sparsefalse.reference_error" : 0.0010223287019104355,
    "B1.H24.HK2.S9.N33.float32.pattern2.sparsetrue.candidate_error" : 3.5509220341900516e-07,
    "B1.H24.HK2.S9.N33.float32.pattern2.sparsetrue.reference_error" : 0.0010223287019104355
  },
  "name" : "optimization-selected-attention",
  "passed" : true
}

```

## .build/optimization/selected-attention-component-v36/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/selected-attention-family-2051-v36/manifest.json

SHA-256 `2f31565ae88efa27bbb5033993bdd3cd19ece2813d15be6de17a9966f0714169`; 14547 bytes.

```
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/candidate-selected-attention-v36/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
      "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "8c6a09c202ad6b970258d334d2bf53f3efd2a207089d944f12e1bbd640045ad4",
      "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
      "Sources/Slotstream/Layers.swift": "7140e68b03c501dbfbe775daf511145a6ad19ad8d932f8e2fa9b3c6f12f05628",
      "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "3c96b535d34f1d1d4d916a1918059f26e71b29b14bc6346580d9cc616511e6de",
      "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
      "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
      "Sources/Slotstream/Optimizations.swift": "d8f3da196fae79b93e08d58bda977e3eb05d0a59eb298bf54c31ae97da1d41b2",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d6b34fefde61bc70af151e2827d2185e67cdf2222b1b08f5cee427914a05d8f9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "a93cb40a0a3e9532caffa7973bec0636706b6577a94b4de93e4f56f7ff13a1c1",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "652341c251b1a74e5debcb6e130fa67725c6fd1cf3a7ffa6b489c9449a14b5c1",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "d5fe4e4f071f68a81e5a109c28aa1d1d0281d1b9ff6b9cc62f8d78597b100760",
    "binary_sha256": "f659d9ba4f35fbe68b1d6251df91215a58496e3970fc8e2f1dcb83a10959a7bd",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13,
  "timeout_seconds": 900,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/candidate-selected-attention-v36/slotstream",
    "optimization-state-check",
    "--variant",
    "selected-attention-family",
    "--tokens",
    "2051",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32225820672,
    "swapins": 41705328,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   556752.\nPages active:                                 822189.\nPages inactive:                               944086.\nPages speculative:                            172717.\nPages throttled:                                   0.\nPages wired down:                             223109.\nPages purgeable:                                4011.\n\"Translation faults\":                    13818333305.\nPages copy-on-write:                       628876992.\nPages zero filled:                       15504958437.\nPages reactivated:                        2329327755.\nPages purged:                               61915313.\nFile-backed pages:                           1406145.\nAnonymous pages:                              532847.\nPages stored in compressor:                  1316480.\nPages occupied by compressor:                 365298.\nDecompressions:                            964484402.\nCompressions:                             1258371630.\nPageins:                                  5877976321.\nPageouts:                                   10629188.\nSwapins:                                    41705328.\nSwapouts:                                   69922789.\nPages tagged:                                 175403.\nPages tagged resident:                        130599.\nPages tagged compressed:                       44804.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7207.\nPages tag-storage free:                         1593.\nPages tag-storage non-tag pageable:            89496.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7214400.\nTagged compressions:                         9446881.\nTagged decompressions:                       8693766.\n"
  },
  "exit_code": 1,
  "result_key": "passed",
  "assertions": 807,
  "duration_seconds": 52.75928075,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32203980800,
    "swapins": 41705328,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   403495.\nPages active:                                1047183.\nPages inactive:                               978148.\nPages speculative:                             67520.\nPages throttled:                                   0.\nPages wired down:                             222867.\nPages purgeable:                                  66.\n\"Translation faults\":                    13818664257.\nPages copy-on-write:                       628887100.\nPages zero filled:                       15521381298.\nPages reactivated:                        2329839262.\nPages purged:                               61931659.\nFile-backed pages:                           1562014.\nAnonymous pages:                              530837.\nPages stored in compressor:                  1316389.\nPages occupied by compressor:                 365261.\nDecompressions:                            964484487.\nCompressions:                             1258371630.\nPageins:                                  5878365914.\nPageouts:                                   10629264.\nSwapins:                                    41705328.\nSwapouts:                                   69922789.\nPages tagged:                                 175127.\nPages tagged resident:                        130344.\nPages tagged compressed:                       44783.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7207.\nPages tag-storage free:                         1433.\nPages tag-storage non-tag pageable:            89656.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7213696.\nTagged compressions:                         9446881.\nTagged decompressions:                       8693781.\n"
  }
}

```

## .build/optimization/selected-attention-family-2051-v36/stdout.txt

SHA-256 `e0ccf7a7165fd5672688d6f17818940be25aca02b6de1ba9d1c96b83b139a036`; 164245 bytes.

```
{
  "items" : [
    {
      "name" : "selected attention actually executed",
      "passed" : true
    },
    {
      "name" : "prefill.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill: greedy final token",
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "prefill.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.index.7: existing rechunk band",
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "prefill.key.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.key.7: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "prefill.value.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "prefill.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "prefill.value.7: existing rechunk band",
      "passed" : true
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
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-907.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.index.7: existing rechunk band",
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "continued-907.key.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.key.7: existing rechunk band",
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "continued-907.value.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-907.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-907.value.7: existing rechunk band",
      "passed" : true
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
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-1337.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.index.7: existing rechunk band",
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "continued-1337.key.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.key.7: existing rechunk band",
      "passed" : true
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
      "passed" : false
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
      "passed" : false
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
      "passed" : false
    },
    {
      "name" : "continued-1337.value.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-1337.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-1337.value.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103: greedy final token",
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "continued-2103.conv.6: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.conv.8: existing rechunk band",
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "continued-2103.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.index.7: existing rechunk band",
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "continued-2103.key.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.key.7: existing rechunk band",
      "passed" : true
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
      "passed" : false
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
      "passed" : false
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
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "continued-2103.value.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "continued-2103.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "continued-2103.value.7: existing rechunk band",
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.12: existing rechunk band",
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.conv.9: existing rechunk band",
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "rollback-1.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.index.7: existing rechunk band",
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "rollback-1.key.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.key.7: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : false
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
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "rollback-1.value.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-1.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-1.value.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2: greedy final token",
      "passed" : true
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
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.8: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.conv.9: existing rechunk band",
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "rollback-2.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.index.7: existing rechunk band",
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "rollback-2.key.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.key.7: existing rechunk band",
      "passed" : true
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
      "passed" : true
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
      "passed" : false
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
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "rollback-2.value.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-2.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-2.value.7: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.logits: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3: greedy final token",
      "passed" : true
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
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "rollback-3.index.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.index.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.index.7: existing rechunk band",
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "rollback-3.key.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.key.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.key.7: existing rechunk band",
      "passed" : true
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
      "passed" : false
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
      "passed" : true
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
      "passed" : false
    },
    {
      "name" : "rollback-3.value.43: existing rechunk band",
      "passed" : false
    },
    {
      "name" : "rollback-3.value.47: existing rechunk band",
      "passed" : true
    },
    {
      "name" : "rollback-3.value.7: existing rechunk band",
      "passed" : true
    }
  ],
  "measurements" : {
    "arm0.chunk" : 256,
    "arm0.read_records" : 65104,
    "arm0.workspace_piece_writes" : 0,
    "arm1.chunk" : 512,
    "arm1.read_records" : 36867,
    "arm1.workspace_piece_writes" : 0,
    "arm2.chunk" : 256,
    "arm2.read_records" : 59970,
    "arm2.workspace_piece_writes" : 0,
    "compact_scope_frontier" : 0,
    "continued-1337.conv.0.candidate" : 0,
    "continued-1337.conv.0.control" : 0,
    "continued-1337.conv.1.candidate" : 0,
    "continued-1337.conv.1.control" : 0,
    "continued-1337.conv.10.candidate" : 0.015776699408888817,
    "continued-1337.conv.10.control" : 0.014563106931746006,
    "continued-1337.conv.12.candidate" : 0.02371651865541935,
    "continued-1337.conv.12.control" : 0.010345458984375,
    "continued-1337.conv.13.candidate" : 0.023876404389739037,
    "continued-1337.conv.13.control" : 0.02668539248406887,
    "continued-1337.conv.14.candidate" : 0.029847756028175354,
    "continued-1337.conv.14.control" : 0.023076923564076424,
    "continued-1337.conv.16.candidate" : 0.026829268783330917,
    "continued-1337.conv.16.control" : 0.029878048226237297,
    "continued-1337.conv.17.candidate" : 0.02857142873108387,
    "continued-1337.conv.17.control" : 0.02961309440433979,
    "continued-1337.conv.18.candidate" : 0.034246575087308884,
    "continued-1337.conv.18.control" : 0.03503139317035675,
    "continued-1337.conv.2.candidate" : 0,
    "continued-1337.conv.2.control" : 0,
    "continued-1337.conv.20.candidate" : 0.037371132522821426,
    "continued-1337.conv.20.control" : 0.025773195549845695,
    "continued-1337.conv.21.candidate" : 0.03183962404727936,
    "continued-1337.conv.21.control" : 0.01886792480945587,
    "continued-1337.conv.22.candidate" : 0.016304347664117813,
    "continued-1337.conv.22.control" : 0.014492753893136978,
    "continued-1337.conv.24.candidate" : 0.03456703945994377,
    "continued-1337.conv.24.control" : 0.02758379839360714,
    "continued-1337.conv.25.candidate" : 0.037383176386356354,
    "continued-1337.conv.25.control" : 0.023218458518385887,
    "continued-1337.conv.26.candidate" : 0.03483952581882477,
    "continued-1337.conv.26.control" : 0.025056306272745132,
    "continued-1337.conv.28.candidate" : 0.03662109375,
    "continued-1337.conv.28.control" : 0.037109375,
    "continued-1337.conv.29.candidate" : 0.06122076138854027,
    "continued-1337.conv.29.control" : 0.044499270617961884,
    "continued-1337.conv.30.candidate" : 0.04267723858356476,
    "continued-1337.conv.30.control" : 0.04477611929178238,
    "continued-1337.conv.32.candidate" : 0.04405968636274338,
    "continued-1337.conv.32.control" : 0.07207207381725311,
    "continued-1337.conv.33.candidate" : 0.06578947603702545,
    "continued-1337.conv.33.control" : 0.05498120188713074,
    "continued-1337.conv.34.candidate" : 0.05844155699014664,
    "continued-1337.conv.34.control" : 0.05735930800437927,
    "continued-1337.conv.36.candidate" : 0.08048780262470245,
    "continued-1337.conv.36.control" : 0.0585365854203701,
    "continued-1337.conv.37.candidate" : 0.05714285746216774,
    "continued-1337.conv.37.control" : 0.04285714402794838,
    "continued-1337.conv.38.candidate" : 0.04546310380101204,
    "continued-1337.conv.38.control" : 0.030944088473916054,
    "continued-1337.conv.4.candidate" : 0,
    "continued-1337.conv.4.control" : 0.016326529905200005,
    "continued-1337.conv.40.candidate" : 0.08163265138864517,
    "continued-1337.conv.40.control" : 0.058673471212387085,
    "continued-1337.conv.41.candidate" : 0.05620155110955238,
    "continued-1337.conv.41.control" : 0.05184108391404152,
    "continued-1337.conv.42.candidate" : 0.06705298274755478,
    "continued-1337.conv.42.control" : 0.05380794778466225,
    "continued-1337.conv.44.candidate" : 0.062106918543577194,
    "continued-1337.conv.44.control" : 0.07547169923782349,
    "continued-1337.conv.45.candidate" : 0.053854167461395264,
    "continued-1337.conv.45.control" : 0.043697915971279144,
    "continued-1337.conv.46.candidate" : 0.050757575780153275,
    "continued-1337.conv.46.control" : 0.05454545468091965,
    "continued-1337.conv.5.candidate" : 0.06224899739027023,
    "continued-1337.conv.5.control" : 0.01606425642967224,
    "continued-1337.conv.6.candidate" : 0.014354066923260689,
    "continued-1337.conv.6.control" : 0.022727273404598236,
    "continued-1337.conv.8.candidate" : 0.01690821163356304,
    "continued-1337.conv.8.control" : 0.012077294290065765,
    "continued-1337.conv.9.candidate" : 0.01595744676887989,
    "continued-1337.conv.9.control" : 0.018617020919919014,
    "continued-1337.index.11.candidate" : 0.03433641791343689,
    "continued-1337.index.11.control" : 0.03086419776082039,
    "continued-1337.index.15.candidate" : 0.05056179687380791,
    "continued-1337.index.15.control" : 0.056179776787757874,
    "continued-1337.index.19.candidate" : 0.053082190454006195,
    "continued-1337.index.19.control" : 0.050513699650764465,
    "continued-1337.index.23.candidate" : 0.03660714253783226,
    "continued-1337.index.23.control" : 0.03437500074505806,
    "continued-1337.index.27.candidate" : 0.0476098395884037,
    "continued-1337.index.27.control" : 0.03774752467870712,
    "continued-1337.index.3.candidate" : 0,
    "continued-1337.index.3.control" : 0.04289940744638443,
    "continued-1337.index.31.candidate" : 0.211345374584198,
    "continued-1337.index.31.control" : 0.1897590309381485,
    "continued-1337.index.35.candidate" : 0.22889073193073273,
    "continued-1337.index.35.control" : 0.17715232074260712,
    "continued-1337.index.39.candidate" : 0.7784810066223145,
    "continued-1337.index.39.control" : 0.09691455960273743,
    "continued-1337.index.43.candidate" : 0.819531261920929,
    "continued-1337.index.43.control" : 0.08984375,
    "continued-1337.index.47.candidate" : 0.1912499964237213,
    "continued-1337.index.47.control" : 0.11666666716337204,
    "continued-1337.index.7.candidate" : 0.026654411107301712,
    "continued-1337.index.7.control" : 0.03079044073820114,
    "continued-1337.key.11.candidate" : 0.09062500298023224,
    "continued-1337.key.11.control" : 0.1042630672454834,
    "continued-1337.key.15.candidate" : 0.07846715301275253,
    "continued-1337.key.15.control" : 0.07572992891073227,
    "continued-1337.key.19.candidate" : 0.12042026221752167,
    "continued-1337.key.19.control" : 0.10721983015537262,
    "continued-1337.key.23.candidate" : 0.11041666567325592,
    "continued-1337.key.23.control" : 0.08958332985639572,
    "continued-1337.key.27.candidate" : 0.16077302396297455,
    "continued-1337.key.27.control" : 0.109375,
    "continued-1337.key.3.candidate" : 0,
    "continued-1337.key.3.control" : 0.05710659921169281,
    "continued-1337.key.31.candidate" : 0.268456369638443,
    "continued-1337.key.31.control" : 0.16023489832878113,
    "continued-1337.key.35.candidate" : 0.2160852700471878,
    "continued-1337.key.35.control" : 0.213662788271904,
    "continued-1337.key.39.candidate" : 0.6546875238418579,
    "continued-1337.key.39.control" : 0.16171875596046448,
    "continued-1337.key.43.candidate" : 0.6696428656578064,
    "continued-1337.key.43.control" : 0.09651360660791397,
    "continued-1337.key.47.candidate" : 0.30349794030189514,
    "continued-1337.key.47.control" : 0.11985597014427185,
    "continued-1337.key.7.candidate" : 0.06647727638483047,
    "continued-1337.key.7.control" : 0.08671875298023224,
    "continued-1337.logits.candidate" : 0.10576923191547394,
    "continued-1337.logits.control" : 0.07071959972381592,
    "continued-1337.ple.1.candidate" : 0,
    "continued-1337.ple.1.control" : 0,
    "continued-1337.ssm.0.candidate" : 0,
    "continued-1337.ssm.0.control" : 0,
    "continued-1337.ssm.1.candidate" : 0,
    "continued-1337.ssm.1.control" : 1.4859934083233384e-07,
    "continued-1337.ssm.10.candidate" : 0.03298352286219597,
    "continued-1337.ssm.10.control" : 0.017946045845746994,
    "continued-1337.ssm.12.candidate" : 0.003657813183963299,
    "continued-1337.ssm.12.control" : 0.0024685910902917385,
    "continued-1337.ssm.13.candidate" : 0.021494299173355103,
    "continued-1337.ssm.13.control" : 0.01606699451804161,
    "continued-1337.ssm.14.candidate" : 0.01057357620447874,
    "continued-1337.ssm.14.control" : 0.01275806687772274,
    "continued-1337.ssm.16.candidate" : 0.03721167892217636,
    "continued-1337.ssm.16.control" : 0.021283524110913277,
    "continued-1337.ssm.17.candidate" : 0.03176159784197807,
    "continued-1337.ssm.17.control" : 0.03377751260995865,
    "continued-1337.ssm.18.candidate" : 0.05847328528761864,
    "continued-1337.ssm.18.control" : 0.043973956257104874,
    "continued-1337.ssm.2.candidate" : 0,
    "continued-1337.ssm.2.control" : 0.0005797273479402065,
    "continued-1337.ssm.20.candidate" : 0.046816516667604446,
    "continued-1337.ssm.20.control" : 0.009465457871556282,
    "continued-1337.ssm.21.candidate" : 0.026289895176887512,
    "continued-1337.ssm.21.control" : 0.04039791598916054,
    "continued-1337.ssm.22.candidate" : 0.009751962497830391,
    "continued-1337.ssm.22.control" : 0.00699956901371479,
    "continued-1337.ssm.24.candidate" : 0.047120969742536545,
    "continued-1337.ssm.24.control" : 0.017084628343582153,
    "continued-1337.ssm.25.candidate" : 0.05798488110303879,
    "continued-1337.ssm.25.control" : 0.046965617686510086,
    "continued-1337.ssm.26.candidate" : 0.09854105859994888,
    "continued-1337.ssm.26.control" : 0.0507342703640461,
    "continued-1337.ssm.28.candidate" : 0.005139131098985672,
    "continued-1337.ssm.28.control" : 0.0038330673705786467,
    "continued-1337.ssm.29.candidate" : 0.059854522347450256,
    "continued-1337.ssm.29.control" : 0.042529232800006866,
    "continued-1337.ssm.30.candidate" : 0.03665047138929367,
    "continued-1337.ssm.30.control" : 0.04200661554932594,
    "continued-1337.ssm.32.candidate" : 0.043512023985385895,
    "continued-1337.ssm.32.control" : 0.10962694883346558,
    "continued-1337.ssm.33.candidate" : 0.05656253173947334,
    "continued-1337.ssm.33.control" : 0.06466139853000641,
    "continued-1337.ssm.34.candidate" : 0.06787344813346863,
    "continued-1337.ssm.34.control" : 0.09360650181770325,
    "continued-1337.ssm.36.candidate" : 0.05511008948087692,
    "continued-1337.ssm.36.control" : 0.07386511564254761,
    "continued-1337.ssm.37.candidate" : 0.03298042342066765,
    "continued-1337.ssm.37.control" : 0.05174458399415016,
    "continued-1337.ssm.38.candidate" : 0.034419674426317215,
    "continued-1337.ssm.38.control" : 0.02626541443169117,
    "continued-1337.ssm.4.candidate" : 0.003712112084031105,
    "continued-1337.ssm.4.control" : 0.009954106993973255,
    "continued-1337.ssm.40.candidate" : 0.05121994763612747,
    "continued-1337.ssm.40.control" : 0.03917728364467621,
    "continued-1337.ssm.41.candidate" : 0.04064137861132622,
    "continued-1337.ssm.41.control" : 0.02775118499994278,
    "continued-1337.ssm.42.candidate" : 0.03361700102686882,
    "continued-1337.ssm.42.control" : 0.02123378962278366,
    "continued-1337.ssm.44.candidate" : 0.03956596925854683,
    "continued-1337.ssm.44.control" : 0.028902489691972733,
    "continued-1337.ssm.45.candidate" : 0.1831180453300476,
    "continued-1337.ssm.45.control" : 0.15728546679019928,
    "continued-1337.ssm.46.candidate" : 0.10638822615146637,
    "continued-1337.ssm.46.control" : 0.09054373949766159,
    "continued-1337.ssm.5.candidate" : 0.12074702978134155,
    "continued-1337.ssm.5.control" : 0.012138858437538147,
    "continued-1337.ssm.6.candidate" : 0.009837242774665356,
    "continued-1337.ssm.6.control" : 0.014194991439580917,
    "continued-1337.ssm.8.candidate" : 0.01663748174905777,
    "continued-1337.ssm.8.control" : 0.00603906437754631,
    "continued-1337.ssm.9.candidate" : 0.03875800594687462,
    "continued-1337.ssm.9.control" : 0.02003120630979538,
    "continued-1337.value.11.candidate" : 0.020346222445368767,
    "continued-1337.value.11.control" : 0.018041817471385002,
    "continued-1337.value.15.candidate" : 0.028884463012218475,
    "continued-1337.value.15.control" : 0.03187251091003418,
    "continued-1337.value.19.candidate" : 0.02908163331449032,
    "continued-1337.value.19.control" : 0.03214285895228386,
    "continued-1337.value.23.candidate" : 0.05755813792347908,
    "continued-1337.value.23.control" : 0.041860464960336685,
    "continued-1337.value.27.candidate" : 0.018028846010565758,
    "continued-1337.value.27.control" : 0.014546001330018044,
    "continued-1337.value.3.candidate" : 0,
    "continued-1337.value.3.control" : 0.0380515530705452,
    "continued-1337.value.31.candidate" : 0.09089674055576324,
    "continued-1337.value.31.control" : 0.072826087474823,
    "continued-1337.value.35.candidate" : 0.10711050778627396,
    "continued-1337.value.35.control" : 0.10688405483961105,
    "continued-1337.value.39.candidate" : 0.8035714030265808,
    "continued-1337.value.39.control" : 0.10833333432674408,
    "continued-1337.value.43.candidate" : 0.35845303535461426,
    "continued-1337.value.43.control" : 0.05745341628789902,
    "continued-1337.value.47.candidate" : 0.4168814420700073,
    "continued-1337.value.47.control" : 0.23518040776252747,
    "continued-1337.value.7.candidate" : 0.019086826592683792,
    "continued-1337.value.7.control" : 0.021800149232149124,
    "continued-2103.conv.0.candidate" : 0,
    "continued-2103.conv.0.control" : 0,
    "continued-2103.conv.1.candidate" : 0,
    "continued-2103.conv.1.control" : 0,
    "continued-2103.conv.10.candidate" : 0.015476190485060215,
    "continued-2103.conv.10.control" : 0.012500000186264515,
    "continued-2103.conv.12.candidate" : 0.02330043911933899,
    "continued-2103.conv.12.control" : 0.009868420660495758,
    "continued-2103.conv.13.candidate" : 0.02374301664531231,
    "continued-2103.conv.13.control" : 0.026536311954259872,
    "continued-2103.conv.14.candidate" : 0.029847756028175354,
    "continued-2103.conv.14.control" : 0.018269231542944908,
    "continued-2103.conv.16.candidate" : 0.026829268783330917,
    "continued-2103.conv.16.control" : 0.01554878056049347,
    "continued-2103.conv.17.candidate" : 0.02857142873108387,
    "continued-2103.conv.17.control" : 0.02961309440433979,
    "continued-2103.conv.18.candidate" : 0.034246575087308884,
    "continued-2103.conv.18.control" : 0.03503139317035675,
    "continued-2103.conv.2.candidate" : 0,
    "continued-2103.conv.2.control" : 0,
    "continued-2103.conv.20.candidate" : 0.03606965020298958,
    "continued-2103.conv.20.control" : 0.024875622242689133,
    "continued-2103.conv.21.candidate" : 0.03183962404727936,
    "continued-2103.conv.21.control" : 0.017688678577542305,
    "continued-2103.conv.22.candidate" : 0.016187049448490143,
    "continued-2103.conv.22.control" : 0.014388489536941051,
    "continued-2103.conv.24.candidate" : 0.03456703945994377,
    "continued-2103.conv.24.control" : 0.02758379839360714,
    "continued-2103.conv.25.candidate" : 0.037383176386356354,
    "continued-2103.conv.25.control" : 0.023218458518385887,
    "continued-2103.conv.26.candidate" : 0.03483952581882477,
    "continued-2103.conv.26.control" : 0.025056306272745132,
    "continued-2103.conv.28.candidate" : 0.03662109375,
    "continued-2103.conv.28.control" : 0.037109375,
    "continued-2103.conv.29.candidate" : 0.0545247383415699,
    "continued-2103.conv.29.control" : 0.0484212227165699,
    "continued-2103.conv.30.candidate" : 0.04601990059018135,
    "continued-2103.conv.30.control" : 0.05472636967897415,
    "continued-2103.conv.32.candidate" : 0.07648419588804245,
    "continued-2103.conv.32.control" : 0.07207207381725311,
    "continued-2103.conv.33.candidate" : 0.06578947603702545,
    "continued-2103.conv.33.control" : 0.04135338217020035,
    "continued-2103.conv.34.candidate" : 0.05844155699014664,
    "continued-2103.conv.34.control" : 0.05735930800437927,
    "continued-2103.conv.36.candidate" : 0.08461538702249527,
    "continued-2103.conv.36.control" : 0.07179487496614456,
    "continued-2103.conv.37.candidate" : 0.057416267693042755,
    "continued-2103.conv.37.control" : 0.043062202632427216,
    "continued-2103.conv.38.candidate" : 0.04546310380101204,
    "continued-2103.conv.38.control" : 0.029932228848338127,
    "continued-2103.conv.4.candidate" : 0,
    "continued-2103.conv.4.control" : 0.012295082211494446,
    "continued-2103.conv.40.candidate" : 0.08571428805589676,
    "continued-2103.conv.40.control" : 0.06160714104771614,
    "continued-2103.conv.41.candidate" : 0.05620155110955238,
    "continued-2103.conv.41.control" : 0.05184108391404152,
    "continued-2103.conv.42.candidate" : 0.06705298274755478,
    "continued-2103.conv.42.control" : 0.05380794778466225,
    "continued-2103.conv.44.candidate" : 0.0872092992067337,
    "continued-2103.conv.44.control" : 0.06976744532585144,
    "continued-2103.conv.45.candidate" : 0.053854167461395264,
    "continued-2103.conv.45.control" : 0.043697915971279144,
    "continued-2103.conv.46.candidate" : 0.04869186133146286,
    "continued-2103.conv.46.control" : 0.05232558026909828,
    "continued-2103.conv.5.candidate" : 0.06224899739027023,
    "continued-2103.conv.5.control" : 0.01185209583491087,
    "continued-2103.conv.6.candidate" : 0.009569377638399601,
    "continued-2103.conv.6.control" : 0.011961722746491432,
    "continued-2103.conv.8.candidate" : 0.01690821163356304,
    "continued-2103.conv.8.control" : 0.012077294290065765,
    "continued-2103.conv.9.candidate" : 0.01595744676887989,
    "continued-2103.conv.9.control" : 0.012632979080080986,
    "continued-2103.index.11.candidate" : 0.03433641791343689,
    "continued-2103.index.11.control" : 0.03086419776082039,
    "continued-2103.index.15.candidate" : 0.05056179687380791,
    "continued-2103.index.15.control" : 0.056179776787757874,
    "continued-2103.index.19.candidate" : 0.053082190454006195,
    "continued-2103.index.19.control" : 0.050513699650764465,
    "continued-2103.index.23.candidate" : 0.03660714253783226,
    "continued-2103.index.23.control" : 0.03437500074505806,
    "continued-2103.index.27.candidate" : 0.0476098395884037,
    "continued-2103.index.27.control" : 0.03774752467870712,
    "continued-2103.index.3.candidate" : 0,
    "continued-2103.index.3.control" : 0.04289940744638443,
    "continued-2103.index.31.candidate" : 0.211345374584198,
    "continued-2103.index.31.control" : 0.1897590309381485,
    "continued-2103.index.35.candidate" : 0.22889073193073273,
    "continued-2103.index.35.control" : 0.17715232074260712,
    "continued-2103.index.39.candidate" : 0.7784810066223145,
    "continued-2103.index.39.control" : 0.09691455960273743,
    "continued-2103.index.43.candidate" : 0.819531261920929,
    "continued-2103.index.43.control" : 0.08984375,
    "continued-2103.index.47.candidate" : 0.1912499964237213,
    "continued-2103.index.47.control" : 0.11666666716337204,
    "continued-2103.index.7.candidate" : 0.026654411107301712,
    "continued-2103.index.7.control" : 0.03079044073820114,
    "continued-2103.key.11.candidate" : 0.09062500298023224,
    "continued-2103.key.11.control" : 0.1042630672454834,
    "continued-2103.key.15.candidate" : 0.07846715301275253,
    "continued-2103.key.15.control" : 0.07572992891073227,
    "continued-2103.key.19.candidate" : 0.12042026221752167,
    "continued-2103.key.19.control" : 0.10721983015537262,
    "continued-2103.key.23.candidate" : 0.11041666567325592,
    "continued-2103.key.23.control" : 0.08958332985639572,
    "continued-2103.key.27.candidate" : 0.16077302396297455,
    "continued-2103.key.27.control" : 0.109375,
    "continued-2103.key.3.candidate" : 0,
    "continued-2103.key.3.control" : 0.05710659921169281,
    "continued-2103.key.31.candidate" : 0.268456369638443,
    "continued-2103.key.31.control" : 0.16023489832878113,
    "continued-2103.key.35.candidate" : 0.2160852700471878,
    "continued-2103.key.35.control" : 0.213662788271904,
    "continued-2103.key.39.candidate" : 0.6546875238418579,
    "continued-2103.key.39.control" : 0.16171875596046448,
    "continued-2103.key.43.candidate" : 0.6696428656578064,
    "continued-2103.key.43.control" : 0.09651360660791397,
    "continued-2103.key.47.candidate" : 0.30349794030189514,
    "continued-2103.key.47.control" : 0.11985597014427185,
    "continued-2103.key.7.candidate" : 0.06647727638483047,
    "continued-2103.key.7.control" : 0.08671875298023224,
    "continued-2103.logits.candidate" : 0.06112469360232353,
    "continued-2103.logits.control" : 0.09260391443967819,
    "continued-2103.ple.1.candidate" : 0,
    "continued-2103.ple.1.control" : 0,
    "continued-2103.ssm.0.candidate" : 0,
    "continued-2103.ssm.0.control" : 0,
    "continued-2103.ssm.1.candidate" : 0,
    "continued-2103.ssm.1.control" : 1.4848660612187814e-07,
    "continued-2103.ssm.10.candidate" : 0.02458675391972065,
    "continued-2103.ssm.10.control" : 0.023309165611863136,
    "continued-2103.ssm.12.candidate" : 0.0035040248185396194,
    "continued-2103.ssm.12.control" : 0.0016079462366178632,
    "continued-2103.ssm.13.candidate" : 0.01840241067111492,
    "continued-2103.ssm.13.control" : 0.014130616560578346,
    "continued-2103.ssm.14.candidate" : 0.01081310585141182,
    "continued-2103.ssm.14.control" : 0.014955168589949608,
    "continued-2103.ssm.16.candidate" : 0.026413096114993095,
    "continued-2103.ssm.16.control" : 0.05738374590873718,
    "continued-2103.ssm.17.candidate" : 0.021412592381238937,
    "continued-2103.ssm.17.control" : 0.02103946916759014,
    "continued-2103.ssm.18.candidate" : 0.04072824865579605,
    "continued-2103.ssm.18.control" : 0.029536956921219826,
    "continued-2103.ssm.2.candidate" : 0,
    "continued-2103.ssm.2.control" : 0.0005818858626298606,
    "continued-2103.ssm.20.candidate" : 0.02243894338607788,
    "continued-2103.ssm.20.control" : 0.01767282374203205,
    "continued-2103.ssm.21.candidate" : 0.021185383200645447,
    "continued-2103.ssm.21.control" : 0.017284682020545006,
    "continued-2103.ssm.22.candidate" : 0.009759008884429932,
    "continued-2103.ssm.22.control" : 0.006969330366700888,
    "continued-2103.ssm.24.candidate" : 0.026938844472169876,
    "continued-2103.ssm.24.control" : 0.01959054358303547,
    "continued-2103.ssm.25.candidate" : 0.09350466728210449,
    "continued-2103.ssm.25.control" : 0.048088591545820236,
    "continued-2103.ssm.26.candidate" : 0.10715926438570023,
    "continued-2103.ssm.26.control" : 0.03541165962815285,
    "continued-2103.ssm.28.candidate" : 0.004931758623570204,
    "continued-2103.ssm.28.control" : 0.004361960105597973,
    "continued-2103.ssm.29.candidate" : 0.05767828971147537,
    "continued-2103.ssm.29.control" : 0.051568303257226944,
    "continued-2103.ssm.30.candidate" : 0.039003752171993256,
    "continued-2103.ssm.30.control" : 0.0419645756483078,
    "continued-2103.ssm.32.candidate" : 0.06846784055233002,
    "continued-2103.ssm.32.control" : 0.0491204671561718,
    "continued-2103.ssm.33.candidate" : 0.1438147872686386,
    "continued-2103.ssm.33.control" : 0.09468135237693787,
    "continued-2103.ssm.34.candidate" : 0.061500415205955505,
    "continued-2103.ssm.34.control" : 0.07859969884157181,
    "continued-2103.ssm.36.candidate" : 0.06384759396314621,
    "continued-2103.ssm.36.control" : 0.07384496927261353,
    "continued-2103.ssm.37.candidate" : 0.03449949994683266,
    "continued-2103.ssm.37.control" : 0.05203186348080635,
    "continued-2103.ssm.38.candidate" : 0.034429263323545456,
    "continued-2103.ssm.38.control" : 0.026067469269037247,
    "continued-2103.ssm.4.candidate" : 0.0037002512253820896,
    "continued-2103.ssm.4.control" : 0.0048232972621917725,
    "continued-2103.ssm.40.candidate" : 0.0505061037838459,
    "continued-2103.ssm.40.control" : 0.03876867890357971,
    "continued-2103.ssm.41.candidate" : 0.04013790190219879,
    "continued-2103.ssm.41.control" : 0.02758770063519478,
    "continued-2103.ssm.42.candidate" : 0.030765900388360023,
    "continued-2103.ssm.42.control" : 0.0161909069865942,
    "continued-2103.ssm.44.candidate" : 0.03957502171397209,
    "continued-2103.ssm.44.control" : 0.028859423473477364,
    "continued-2103.ssm.45.candidate" : 0.0956776887178421,
    "continued-2103.ssm.45.control" : 0.09914406388998032,
    "continued-2103.ssm.46.candidate" : 0.09662275016307831,
    "continued-2103.ssm.46.control" : 0.08144426345825195,
    "continued-2103.ssm.5.candidate" : 0.16756391525268555,
    "continued-2103.ssm.5.control" : 0.012542186304926872,
    "continued-2103.ssm.6.candidate" : 0.01098040770739317,
    "continued-2103.ssm.6.control" : 0.014274529181420803,
    "continued-2103.ssm.8.candidate" : 0.015809478238224983,
    "continued-2103.ssm.8.control" : 0.006848316174000502,
    "continued-2103.ssm.9.candidate" : 0.02901245281100273,
    "continued-2103.ssm.9.control" : 0.023298263549804688,
    "continued-2103.value.11.candidate" : 0.020346222445368767,
    "continued-2103.value.11.control" : 0.018041817471385002,
    "continued-2103.value.15.candidate" : 0.028884463012218475,
    "continued-2103.value.15.control" : 0.03187251091003418,
    "continued-2103.value.19.candidate" : 0.02908163331449032,
    "continued-2103.value.19.control" : 0.03214285895228386,
    "continued-2103.value.23.candidate" : 0.05755813792347908,
    "continued-2103.value.23.control" : 0.041860464960336685,
    "continued-2103.value.27.candidate" : 0.018028846010565758,
    "continued-2103.value.27.control" : 0.014546001330018044,
    "continued-2103.value.3.candidate" : 0,
    "continued-2103.value.3.control" : 0.0380515530705452,
    "continued-2103.value.31.candidate" : 0.09089674055576324,
    "continued-2103.value.31.control" : 0.072826087474823,
    "continued-2103.value.35.candidate" : 0.10711050778627396,
    "continued-2103.value.35.control" : 0.10688405483961105,
    "continued-2103.value.39.candidate" : 0.8035714030265808,
    "continued-2103.value.39.control" : 0.10833333432674408,
    "continued-2103.value.43.candidate" : 0.35845303535461426,
    "continued-2103.value.43.control" : 0.05745341628789902,
    "continued-2103.value.47.candidate" : 0.4168814420700073,
    "continued-2103.value.47.control" : 0.23518040776252747,
    "continued-2103.value.7.candidate" : 0.019086826592683792,
    "continued-2103.value.7.control" : 0.021800149232149124,
    "continued-907.conv.0.candidate" : 0,
    "continued-907.conv.0.control" : 0,
    "continued-907.conv.1.candidate" : 0,
    "continued-907.conv.1.control" : 0,
    "continued-907.conv.10.candidate" : 0.010514019057154655,
    "continued-907.conv.10.control" : 0.016939252614974976,
    "continued-907.conv.12.candidate" : 0.008928571827709675,
    "continued-907.conv.12.control" : 0.0184151791036129,
    "continued-907.conv.13.candidate" : 0.02247191034257412,
    "continued-907.conv.13.control" : 0.02668539248406887,
    "continued-907.conv.14.candidate" : 0.029695900157094002,
    "continued-907.conv.14.control" : 0.024193547666072845,
    "continued-907.conv.16.candidate" : 0.02777777798473835,
    "continued-907.conv.16.control" : 0.030934343114495277,
    "continued-907.conv.17.candidate" : 0.02857142873108387,
    "continued-907.conv.17.control" : 0.02976190485060215,
    "continued-907.conv.18.candidate" : 0.03488372266292572,
    "continued-907.conv.18.control" : 0.0286337211728096,
    "continued-907.conv.2.candidate" : 0,
    "continued-907.conv.2.control" : 0,
    "continued-907.conv.20.candidate" : 0.03856382891535759,
    "continued-907.conv.20.control" : 0.027925532311201096,
    "continued-907.conv.21.candidate" : 0.028301887214183807,
    "continued-907.conv.21.control" : 0.02299528382718563,
    "continued-907.conv.22.candidate" : 0.016187049448490143,
    "continued-907.conv.22.control" : 0.014388489536941051,
    "continued-907.conv.24.candidate" : 0.02793296054005623,
    "continued-907.conv.24.control" : 0.02374301664531231,
    "continued-907.conv.25.candidate" : 0.018691588193178177,
    "continued-907.conv.25.control" : 0.022780373692512512,
    "continued-907.conv.26.candidate" : 0.027027027681469917,
    "continued-907.conv.26.control" : 0.028153153136372566,
    "continued-907.conv.28.candidate" : 0.031497035175561905,
    "continued-907.conv.28.control" : 0.03489377349615097,
    "continued-907.conv.29.candidate" : 0.046783626079559326,
    "continued-907.conv.29.control" : 0.056652046740055084,
    "continued-907.conv.30.candidate" : 0.0401785708963871,
    "continued-907.conv.30.control" : 0.051020409911870956,
    "continued-907.conv.32.candidate" : 0.05349099263548851,
    "continued-907.conv.32.control" : 0.07207207381725311,
    "continued-907.conv.33.candidate" : 0.06578947603702545,
    "continued-907.conv.33.control" : 0.05498120188713074,
    "continued-907.conv.34.candidate" : 0.0602678582072258,
    "continued-907.conv.34.control" : 0.0591517873108387,
    "continued-907.conv.36.candidate" : 0.08048780262470245,
    "continued-907.conv.36.control" : 0.053658537566661835,
    "continued-907.conv.37.candidate" : 0.05714285746216774,
    "continued-907.conv.37.control" : 0.05000000074505806,
    "continued-907.conv.38.candidate" : 0.03162650763988495,
    "continued-907.conv.38.control" : 0.030944088473916054,
    "continued-907.conv.4.candidate" : 0,
    "continued-907.conv.4.control" : 0.016260161995887756,
    "continued-907.conv.40.candidate" : 0.08163265138864517,
    "continued-907.conv.40.control" : 0.058673471212387085,
    "continued-907.conv.41.candidate" : 0.056640625,
    "continued-907.conv.41.control" : 0.05224609375,
    "continued-907.conv.42.candidate" : 0.06465516984462738,
    "continued-907.conv.42.control" : 0.04461206868290901,
    "continued-907.conv.44.candidate" : 0.07228915393352509,
    "continued-907.conv.44.control" : 0.07228915393352509,
    "continued-907.conv.45.candidate" : 0.053854167461395264,
    "continued-907.conv.45.control" : 0.043697915971279144,
    "continued-907.conv.46.candidate" : 0.050757575780153275,
    "continued-907.conv.46.control" : 0.048106059432029724,
    "continued-907.conv.5.candidate" : 0.0659574493765831,
    "continued-907.conv.5.control" : 0.01702127605676651,
    "continued-907.conv.6.candidate" : 0.01755952462553978,
    "continued-907.conv.6.control" : 0.02261904813349247,
    "continued-907.conv.8.candidate" : 0.01026570051908493,
    "continued-907.conv.8.control" : 0.012077294290065765,
    "continued-907.conv.9.candidate" : 0.01314684096723795,
    "continued-907.conv.9.control" : 0.03494623675942421,
    "continued-907.index.11.candidate" : 0.03433641791343689,
    "continued-907.index.11.control" : 0.03086419776082039,
    "continued-907.index.15.candidate" : 0.05056179687380791,
    "continued-907.index.15.control" : 0.056179776787757874,
    "continued-907.index.19.candidate" : 0.053082190454006195,
    "continued-907.index.19.control" : 0.050513699650764465,
    "continued-907.index.23.candidate" : 0.03660714253783226,
    "continued-907.index.23.control" : 0.03437500074505806,
    "continued-907.index.27.candidate" : 0.0476098395884037,
    "continued-907.index.27.control" : 0.03774752467870712,
    "continued-907.index.3.candidate" : 0,
    "continued-907.index.3.control" : 0.04289940744638443,
    "continued-907.index.31.candidate" : 0.211345374584198,
    "continued-907.index.31.control" : 0.1897590309381485,
    "continued-907.index.35.candidate" : 0.22889073193073273,
    "continued-907.index.35.control" : 0.17715232074260712,
    "continued-907.index.39.candidate" : 0.7784810066223145,
    "continued-907.index.39.control" : 0.09691455960273743,
    "continued-907.index.43.candidate" : 0.819531261920929,
    "continued-907.index.43.control" : 0.08984375,
    "continued-907.index.47.candidate" : 0.1912499964237213,
    "continued-907.index.47.control" : 0.11666666716337204,
    "continued-907.index.7.candidate" : 0.026654411107301712,
    "continued-907.index.7.control" : 0.03079044073820114,
    "continued-907.key.11.candidate" : 0.09062500298023224,
    "continued-907.key.11.control" : 0.1042630672454834,
    "continued-907.key.15.candidate" : 0.07846715301275253,
    "continued-907.key.15.control" : 0.07572992891073227,
    "continued-907.key.19.candidate" : 0.12042026221752167,
    "continued-907.key.19.control" : 0.10721983015537262,
    "continued-907.key.23.candidate" : 0.11041666567325592,
    "continued-907.key.23.control" : 0.08958332985639572,
    "continued-907.key.27.candidate" : 0.16077302396297455,
    "continued-907.key.27.control" : 0.109375,
    "continued-907.key.3.candidate" : 0,
    "continued-907.key.3.control" : 0.05710659921169281,
    "continued-907.key.31.candidate" : 0.268456369638443,
    "continued-907.key.31.control" : 0.16023489832878113,
    "continued-907.key.35.candidate" : 0.2160852700471878,
    "continued-907.key.35.control" : 0.213662788271904,
    "continued-907.key.39.candidate" : 0.6546875238418579,
    "continued-907.key.39.control" : 0.16171875596046448,
    "continued-907.key.43.candidate" : 0.6696428656578064,
    "continued-907.key.43.control" : 0.09651360660791397,
    "continued-907.key.47.candidate" : 0.30349794030189514,
    "continued-907.key.47.control" : 0.11985597014427185,
    "continued-907.key.7.candidate" : 0.06647727638483047,
    "continued-907.key.7.control" : 0.08671875298023224,
    "continued-907.logits.candidate" : 0.09536812454462051,
    "continued-907.logits.control" : 0.08828883618116379,
    "continued-907.ple.1.candidate" : 0,
    "continued-907.ple.1.control" : 0,
    "continued-907.ssm.0.candidate" : 0,
    "continued-907.ssm.0.control" : 0,
    "continued-907.ssm.1.candidate" : 0,
    "continued-907.ssm.1.control" : 1.487297112134911e-07,
    "continued-907.ssm.10.candidate" : 0.014145378023386002,
    "continued-907.ssm.10.control" : 0.023793399333953857,
    "continued-907.ssm.12.candidate" : 0.001992544624954462,
    "continued-907.ssm.12.control" : 0.0035540047101676464,
    "continued-907.ssm.13.candidate" : 0.024072472006082535,
    "continued-907.ssm.13.control" : 0.02006775513291359,
    "continued-907.ssm.14.candidate" : 0.014349027536809444,
    "continued-907.ssm.14.control" : 0.01423268485814333,
    "continued-907.ssm.16.candidate" : 0.04037190601229668,
    "continued-907.ssm.16.control" : 0.045852772891521454,
    "continued-907.ssm.17.candidate" : 0.03215348720550537,
    "continued-907.ssm.17.control" : 0.01413152739405632,
    "continued-907.ssm.18.candidate" : 0.05150836706161499,
    "continued-907.ssm.18.control" : 0.026003865525126457,
    "continued-907.ssm.2.candidate" : 0,
    "continued-907.ssm.2.control" : 0.0005904034478589892,
    "continued-907.ssm.20.candidate" : 0.01636633463203907,
    "continued-907.ssm.20.control" : 0.023326480761170387,
    "continued-907.ssm.21.candidate" : 0.021480681374669075,
    "continued-907.ssm.21.control" : 0.02348085306584835,
    "continued-907.ssm.22.candidate" : 0.009756521321833134,
    "continued-907.ssm.22.control" : 0.007093328982591629,
    "continued-907.ssm.24.candidate" : 0.017809128388762474,
    "continued-907.ssm.24.control" : 0.0183302890509367,
    "continued-907.ssm.25.candidate" : 0.05054289102554321,
    "continued-907.ssm.25.control" : 0.027647152543067932,
    "continued-907.ssm.26.candidate" : 0.0576922707259655,
    "continued-907.ssm.26.control" : 0.05218126252293587,
    "continued-907.ssm.28.candidate" : 0.004096075892448425,
    "continued-907.ssm.28.control" : 0.0038103177212178707,
    "continued-907.ssm.29.candidate" : 0.035877909511327744,
    "continued-907.ssm.29.control" : 0.03958282619714737,
    "continued-907.ssm.30.candidate" : 0.04884827882051468,
    "continued-907.ssm.30.control" : 0.03798343986272812,
    "continued-907.ssm.32.candidate" : 0.046462900936603546,
    "continued-907.ssm.32.control" : 0.07071585208177567,
    "continued-907.ssm.33.candidate" : 0.06876777857542038,
    "continued-907.ssm.33.control" : 0.06194170191884041,
    "continued-907.ssm.34.candidate" : 0.07895324379205704,
    "continued-907.ssm.34.control" : 0.08009520173072815,
    "continued-907.ssm.36.candidate" : 0.05515369400382042,
    "continued-907.ssm.36.control" : 0.07785206288099289,
    "continued-907.ssm.37.candidate" : 0.033028267323970795,
    "continued-907.ssm.37.control" : 0.05156552046537399,
    "continued-907.ssm.38.candidate" : 0.03448543697595596,
    "continued-907.ssm.38.control" : 0.026286127045750618,
    "continued-907.ssm.4.candidate" : 0.0037753970827907324,
    "continued-907.ssm.4.control" : 0.02579164318740368,
    "continued-907.ssm.40.candidate" : 0.0518663227558136,
    "continued-907.ssm.40.control" : 0.03981095924973488,
    "continued-907.ssm.41.candidate" : 0.04046304151415825,
    "continued-907.ssm.41.control" : 0.027334757149219513,
    "continued-907.ssm.42.candidate" : 0.0308939591050148,
    "continued-907.ssm.42.control" : 0.027964167296886444,
    "continued-907.ssm.44.candidate" : 0.03956926241517067,
    "continued-907.ssm.44.control" : 0.028940217569470406,
    "continued-907.ssm.45.candidate" : 0.13789694011211395,
    "continued-907.ssm.45.control" : 0.16529259085655212,
    "continued-907.ssm.46.candidate" : 0.11674344539642334,
    "continued-907.ssm.46.control" : 0.10494326800107956,
    "continued-907.ssm.5.candidate" : 0.022977391257882118,
    "continued-907.ssm.5.control" : 0.010875709354877472,
    "continued-907.ssm.6.candidate" : 0.010556052438914776,
    "continued-907.ssm.6.control" : 0.012257643975317478,
    "continued-907.ssm.8.candidate" : 0.00678966986015439,
    "continued-907.ssm.8.control" : 0.006824527867138386,
    "continued-907.ssm.9.candidate" : 0.015269409865140915,
    "continued-907.ssm.9.control" : 0.031943295150995255,
    "continued-907.value.11.candidate" : 0.020346222445368767,
    "continued-907.value.11.control" : 0.018041817471385002,
    "continued-907.value.15.candidate" : 0.028884463012218475,
    "continued-907.value.15.control" : 0.03187251091003418,
    "continued-907.value.19.candidate" : 0.02908163331449032,
    "continued-907.value.19.control" : 0.03214285895228386,
    "continued-907.value.23.candidate" : 0.05755813792347908,
    "continued-907.value.23.control" : 0.041860464960336685,
    "continued-907.value.27.candidate" : 0.018028846010565758,
    "continued-907.value.27.control" : 0.014546001330018044,
    "continued-907.value.3.candidate" : 0,
    "continued-907.value.3.control" : 0.0380515530705452,
    "continued-907.value.31.candidate" : 0.09089674055576324,
    "continued-907.value.31.control" : 0.072826087474823,
    "continued-907.value.35.candidate" : 0.10711050778627396,
    "continued-907.value.35.control" : 0.10688405483961105,
    "continued-907.value.39.candidate" : 0.8035714030265808,
    "continued-907.value.39.control" : 0.10833333432674408,
    "continued-907.value.43.candidate" : 0.35845303535461426,
    "continued-907.value.43.control" : 0.05745341628789902,
    "continued-907.value.47.candidate" : 0.4168814420700073,
    "continued-907.value.47.control" : 0.23518040776252747,
    "continued-907.value.7.candidate" : 0.019086826592683792,
    "continued-907.value.7.control" : 0.021800149232149124,
    "prefill.conv.0.candidate" : 0,
    "prefill.conv.0.control" : 0,
    "prefill.conv.1.candidate" : 0,
    "prefill.conv.1.control" : 0,
    "prefill.conv.10.candidate" : 0.019567757844924927,
    "prefill.conv.10.control" : 0.016939252614974976,
    "prefill.conv.12.candidate" : 0.015557940118014812,
    "prefill.conv.12.control" : 0.017703862860798836,
    "prefill.conv.13.candidate" : 0.028089888393878937,
    "prefill.conv.13.control" : 0.025983145460486412,
    "prefill.conv.14.candidate" : 0.02368421107530594,
    "prefill.conv.14.control" : 0.02368421107530594,
    "prefill.conv.16.candidate" : 0.036249998956918716,
    "prefill.conv.16.control" : 0.030625000596046448,
    "prefill.conv.17.candidate" : 0.03333333507180214,
    "prefill.conv.17.control" : 0.03205128386616707,
    "prefill.conv.18.candidate" : 0.02534562163054943,
    "prefill.conv.18.control" : 0.02836981602013111,
    "prefill.conv.2.candidate" : 0,
    "prefill.conv.2.control" : 0,
    "prefill.conv.20.candidate" : 0.02777777798473835,
    "prefill.conv.20.control" : 0.02777777798473835,
    "prefill.conv.21.candidate" : 0.02638190984725952,
    "prefill.conv.21.control" : 0.024497486650943756,
    "prefill.conv.22.candidate" : 0.013151978142559528,
    "prefill.conv.22.control" : 0.014388489536941051,
    "prefill.conv.24.candidate" : 0.025663407519459724,
    "prefill.conv.24.control" : 0.025139665231108665,
    "prefill.conv.25.candidate" : 0.03000876121222973,
    "prefill.conv.25.control" : 0.022780373692512512,
    "prefill.conv.26.candidate" : 0.030516432598233223,
    "prefill.conv.26.control" : 0.02934272214770317,
    "prefill.conv.28.candidate" : 0.033596839755773544,
    "prefill.conv.28.control" : 0.03489377349615097,
    "prefill.conv.29.candidate" : 0.052448831498622894,
    "prefill.conv.29.control" : 0.056652046740055084,
    "prefill.conv.30.candidate" : 0.042889028787612915,
    "prefill.conv.30.control" : 0.051020409911870956,
    "prefill.conv.32.candidate" : 0.05818965658545494,
    "prefill.conv.32.control" : 0.05549569055438042,
    "prefill.conv.33.candidate" : 0.0540674589574337,
    "prefill.conv.33.control" : 0.0580357126891613,
    "prefill.conv.34.candidate" : 0.05859375,
    "prefill.conv.34.control" : 0.0518973208963871,
    "prefill.conv.36.candidate" : 0.043902438133955,
    "prefill.conv.36.control" : 0.04878048598766327,
    "prefill.conv.37.candidate" : 0.04047619178891182,
    "prefill.conv.37.control" : 0.05000000074505806,
    "prefill.conv.38.candidate" : 0.03520331159234047,
    "prefill.conv.38.control" : 0.030944088473916054,
    "prefill.conv.4.candidate" : 0,
    "prefill.conv.4.control" : 0.01593625545501709,
    "prefill.conv.40.candidate" : 0.08163265138864517,
    "prefill.conv.40.control" : 0.04719387739896774,
    "prefill.conv.41.candidate" : 0.05343511328101158,
    "prefill.conv.41.control" : 0.04007633402943611,
    "prefill.conv.42.candidate" : 0.05000000074505806,
    "prefill.conv.42.control" : 0.03663793206214905,
    "prefill.conv.44.candidate" : 0.07228915393352509,
    "prefill.conv.44.control" : 0.05421686917543411,
    "prefill.conv.45.candidate" : 0.03883928433060646,
    "prefill.conv.45.control" : 0.03214285895228386,
    "prefill.conv.46.candidate" : 0.036556605249643326,
    "prefill.conv.46.control" : 0.03144654259085655,
    "prefill.conv.5.candidate" : 0.017553191632032394,
    "prefill.conv.5.control" : 0.01702127605676651,
    "prefill.conv.6.candidate" : 0.01755952462553978,
    "prefill.conv.6.control" : 0.02261904813349247,
    "prefill.conv.8.candidate" : 0.010841837152838707,
    "prefill.conv.8.control" : 0.012755102477967739,
    "prefill.conv.9.candidate" : 0.01314684096723795,
    "prefill.conv.9.control" : 0.03494623675942421,
    "prefill.index.11.candidate" : 0.03433641791343689,
    "prefill.index.11.control" : 0.03086419776082039,
    "prefill.index.15.candidate" : 0.05056179687380791,
    "prefill.index.15.control" : 0.056179776787757874,
    "prefill.index.19.candidate" : 0.053082190454006195,
    "prefill.index.19.control" : 0.050513699650764465,
    "prefill.index.23.candidate" : 0.03660714253783226,
    "prefill.index.23.control" : 0.03437500074505806,
    "prefill.index.27.candidate" : 0.0476098395884037,
    "prefill.index.27.control" : 0.03774752467870712,
    "prefill.index.3.candidate" : 0,
    "prefill.index.3.control" : 0.04289940744638443,
    "prefill.index.31.candidate" : 0.211345374584198,
    "prefill.index.31.control" : 0.1897590309381485,
    "prefill.index.35.candidate" : 0.22889073193073273,
    "prefill.index.35.control" : 0.17715232074260712,
    "prefill.index.39.candidate" : 0.7784810066223145,
    "prefill.index.39.control" : 0.09691455960273743,
    "prefill.index.43.candidate" : 0.819531261920929,
    "prefill.index.43.control" : 0.08984375,
    "prefill.index.47.candidate" : 0.1912499964237213,
    "prefill.index.47.control" : 0.11666666716337204,
    "prefill.index.7.candidate" : 0.026654411107301712,
    "prefill.index.7.control" : 0.03079044073820114,
    "prefill.key.11.candidate" : 0.09062500298023224,
    "prefill.key.11.control" : 0.1042630672454834,
    "prefill.key.15.candidate" : 0.07846715301275253,
    "prefill.key.15.control" : 0.07572992891073227,
    "prefill.key.19.candidate" : 0.12042026221752167,
    "prefill.key.19.control" : 0.10721983015537262,
    "prefill.key.23.candidate" : 0.11041666567325592,
    "prefill.key.23.control" : 0.08958332985639572,
    "prefill.key.27.candidate" : 0.16077302396297455,
    "prefill.key.27.control" : 0.109375,
    "prefill.key.3.candidate" : 0,
    "prefill.key.3.control" : 0.05710659921169281,
    "prefill.key.31.candidate" : 0.268456369638443,
    "prefill.key.31.control" : 0.16023489832878113,
    "prefill.key.35.candidate" : 0.2160852700471878,
    "prefill.key.35.control" : 0.213662788271904,
    "prefill.key.39.candidate" : 0.6546875238418579,
    "prefill.key.39.control" : 0.16171875596046448,
    "prefill.key.43.candidate" : 0.6696428656578064,
    "prefill.key.43.control" : 0.09651360660791397,
    "prefill.key.47.candidate" : 0.30349794030189514,
    "prefill.key.47.control" : 0.11985597014427185,
    "prefill.key.7.candidate" : 0.06647727638483047,
    "prefill.key.7.control" : 0.08671875298023224,
    "prefill.logits.candidate" : 0.06320678442716599,
    "prefill.logits.control" : 0.058966074138879776,
    "prefill.ple.1.candidate" : 0,
    "prefill.ple.1.control" : 0,
    "prefill.ssm.0.candidate" : 0,
    "prefill.ssm.0.control" : 0,
    "prefill.ssm.1.candidate" : 0,
    "prefill.ssm.1.control" : 1.4872892961648176e-07,
    "prefill.ssm.10.candidate" : 0.027653560042381287,
    "prefill.ssm.10.control" : 0.03798101097345352,
    "prefill.ssm.12.candidate" : 0.0017902684630826116,
    "prefill.ssm.12.control" : 0.001855105278082192,
    "prefill.ssm.13.candidate" : 0.019509289413690567,
    "prefill.ssm.13.control" : 0.025619911029934883,
    "prefill.ssm.14.candidate" : 0.0109479408711195,
    "prefill.ssm.14.control" : 0.012629499658942223,
    "prefill.ssm.16.candidate" : 0.026316724717617035,
    "prefill.ssm.16.control" : 0.036108095198869705,
    "prefill.ssm.17.candidate" : 0.0322265699505806,
    "prefill.ssm.17.control" : 0.02621637098491192,
    "prefill.ssm.18.candidate" : 0.03311743587255478,
    "prefill.ssm.18.control" : 0.04948531091213226,
    "prefill.ssm.2.candidate" : 0,
    "prefill.ssm.2.control" : 0.0005882292171008885,
    "prefill.ssm.20.candidate" : 0.015331869944930077,
    "prefill.ssm.20.control" : 0.017137831076979637,
    "prefill.ssm.21.candidate" : 0.013419666327536106,
    "prefill.ssm.21.control" : 0.014947080053389072,
    "prefill.ssm.22.candidate" : 0.009780003689229488,
    "prefill.ssm.22.control" : 0.006906559225171804,
    "prefill.ssm.24.candidate" : 0.017351580783724785,
    "prefill.ssm.24.control" : 0.02122267335653305,
    "prefill.ssm.25.candidate" : 0.049657028168439865,
    "prefill.ssm.25.control" : 0.05054915323853493,
    "prefill.ssm.26.candidate" : 0.07039554417133331,
    "prefill.ssm.26.control" : 0.13928501307964325,
    "prefill.ssm.28.candidate" : 0.004414928611367941,
    "prefill.ssm.28.control" : 0.00892320554703474,
    "prefill.ssm.29.candidate" : 0.05743744969367981,
    "prefill.ssm.29.control" : 0.03830548748373985,
    "prefill.ssm.30.candidate" : 0.05085068196058273,
    "prefill.ssm.30.control" : 0.04149722680449486,
    "prefill.ssm.32.candidate" : 0.08457177132368088,
    "prefill.ssm.32.control" : 0.06493595242500305,
    "prefill.ssm.33.candidate" : 0.05658440291881561,
    "prefill.ssm.33.control" : 0.1348571479320526,
    "prefill.ssm.34.candidate" : 0.05778682231903076,
    "prefill.ssm.34.control" : 0.07296093553304672,
    "prefill.ssm.36.candidate" : 0.0588543526828289,
    "prefill.ssm.36.control" : 0.0750972181558609,
    "prefill.ssm.37.candidate" : 0.03290482982993126,
    "prefill.ssm.37.control" : 0.05116703733801842,
    "prefill.ssm.38.candidate" : 0.034460149705410004,
    "prefill.ssm.38.control" : 0.02630005218088627,
    "prefill.ssm.4.candidate" : 0.0036652039270848036,
    "prefill.ssm.4.control" : 0.011633213609457016,
    "prefill.ssm.40.candidate" : 0.053629688918590546,
    "prefill.ssm.40.control" : 0.03989412635564804,
    "prefill.ssm.41.candidate" : 0.03990946710109711,
    "prefill.ssm.41.control" : 0.027259230613708496,
    "prefill.ssm.42.candidate" : 0.03464094549417496,
    "prefill.ssm.42.control" : 0.019122162833809853,
    "prefill.ssm.44.candidate" : 0.03958119824528694,
    "prefill.ssm.44.control" : 0.028670184314250946,
    "prefill.ssm.45.candidate" : 0.09077055007219315,
    "prefill.ssm.45.control" : 0.09350579231977463,
    "prefill.ssm.46.candidate" : 0.11332356184720993,
    "prefill.ssm.46.control" : 0.09845295548439026,
    "prefill.ssm.5.candidate" : 0.005677877459675074,
    "prefill.ssm.5.control" : 0.010840381495654583,
    "prefill.ssm.6.candidate" : 0.010610525496304035,
    "prefill.ssm.6.control" : 0.019964609295129776,
    "prefill.ssm.8.candidate" : 0.006789430044591427,
    "prefill.ssm.8.control" : 0.012559122405946255,
    "prefill.ssm.9.candidate" : 0.03241119161248207,
    "prefill.ssm.9.control" : 0.045938048511743546,
    "prefill.value.11.candidate" : 0.020346222445368767,
    "prefill.value.11.control" : 0.018041817471385002,
    "prefill.value.15.candidate" : 0.028884463012218475,
    "prefill.value.15.control" : 0.03187251091003418,
    "prefill.value.19.candidate" : 0.02908163331449032,
    "prefill.value.19.control" : 0.03214285895228386,
    "prefill.value.23.candidate" : 0.05755813792347908,
    "prefill.value.23.control" : 0.041860464960336685,
    "prefill.value.27.candidate" : 0.018028846010565758,
    "prefill.value.27.control" : 0.014546001330018044,
    "prefill.value.3.candidate" : 0,
    "prefill.value.3.control" : 0.0380515530705452,
    "prefill.value.31.candidate" : 0.09089674055576324,
    "prefill.value.31.control" : 0.072826087474823,
    "prefill.value.35.candidate" : 0.10711050778627396,
    "prefill.value.35.control" : 0.10688405483961105,
    "prefill.value.39.candidate" : 0.8035714030265808,
    "prefill.value.39.control" : 0.10833333432674408,
    "prefill.value.43.candidate" : 0.35845303535461426,
    "prefill.value.43.control" : 0.05745341628789902,
    "prefill.value.47.candidate" : 0.4168814420700073,
    "prefill.value.47.control" : 0.23518040776252747,
    "prefill.value.7.candidate" : 0.019086826592683792,
    "prefill.value.7.control" : 0.021800149232149124,
    "rollback-1.conv.0.candidate" : 0,
    "rollback-1.conv.0.control" : 0,
    "rollback-1.conv.1.candidate" : 0,
    "rollback-1.conv.1.control" : 0,
    "rollback-1.conv.10.candidate" : 0.02425595186650753,
    "rollback-1.conv.10.control" : 0.01532738097012043,
    "rollback-1.conv.12.candidate" : 0.024396929889917374,
    "rollback-1.conv.12.control" : 0.01151315774768591,
    "rollback-1.conv.13.candidate" : 0.03351955488324165,
    "rollback-1.conv.13.control" : 0.020251397043466568,
    "rollback-1.conv.14.candidate" : 0.03360215201973915,
    "rollback-1.conv.14.control" : 0.02083333395421505,
    "rollback-1.conv.16.candidate" : 0.03482586890459061,
    "rollback-1.conv.16.control" : 0.0317358523607254,
    "rollback-1.conv.17.candidate" : 0.04868420958518982,
    "rollback-1.conv.17.control" : 0.030427630990743637,
    "rollback-1.conv.18.candidate" : 0.041860464960336685,
    "rollback-1.conv.18.control" : 0.03962572664022446,
    "rollback-1.conv.2.candidate" : 0,
    "rollback-1.conv.2.control" : 0,
    "rollback-1.conv.20.candidate" : 0.05223880708217621,
    "rollback-1.conv.20.control" : 0.03731343150138855,
    "rollback-1.conv.21.candidate" : 0.03110465034842491,
    "rollback-1.conv.21.control" : 0.03608284890651703,
    "rollback-1.conv.22.candidate" : 0.016074640676379204,
    "rollback-1.conv.22.control" : 0.020683452486991882,
    "rollback-1.conv.24.candidate" : 0.04236111044883728,
    "rollback-1.conv.24.control" : 0.03541666641831398,
    "rollback-1.conv.25.candidate" : 0.029911238700151443,
    "rollback-1.conv.25.control" : 0.051643192768096924,
    "rollback-1.conv.26.candidate" : 0.0441388264298439,
    "rollback-1.conv.26.control" : 0.05573156848549843,
    "rollback-1.conv.28.candidate" : 0.04878048598766327,
    "rollback-1.conv.28.control" : 0.058943089097738266,
    "rollback-1.conv.29.candidate" : 0.0696614608168602,
    "rollback-1.conv.29.control" : 0.0651041641831398,
    "rollback-1.conv.30.candidate" : 0.11578947305679321,
    "rollback-1.conv.30.control" : 0.07664473354816437,
    "rollback-1.conv.32.candidate" : 0.07614122331142426,
    "rollback-1.conv.32.control" : 0.06726457178592682,
    "rollback-1.conv.33.candidate" : 0.059068627655506134,
    "rollback-1.conv.33.control" : 0.06372549384832382,
    "rollback-1.conv.34.candidate" : 0.07964134961366653,
    "rollback-1.conv.34.control" : 0.07172995805740356,
    "rollback-1.conv.36.candidate" : 0.09615384787321091,
    "rollback-1.conv.36.control" : 0.0833333358168602,
    "rollback-1.conv.37.candidate" : 0.07578502595424652,
    "rollback-1.conv.37.control" : 0.07729468494653702,
    "rollback-1.conv.38.candidate" : 0.034156434237957,
    "rollback-1.conv.38.control" : 0.0394345223903656,
    "rollback-1.conv.4.candidate" : 0,
    "rollback-1.conv.4.control" : 0.006172839552164078,
    "rollback-1.conv.40.candidate" : 0.07232142984867096,
    "rollback-1.conv.40.control" : 0.09252232313156128,
    "rollback-1.conv.41.candidate" : 0.07135827094316483,
    "rollback-1.conv.41.control" : 0.1683070808649063,
    "rollback-1.conv.42.candidate" : 0.06333892792463303,
    "rollback-1.conv.42.control" : 0.06837248057126999,
    "rollback-1.conv.44.candidate" : 0.0872092992067337,
    "rollback-1.conv.44.control" : 0.4981377124786377,
    "rollback-1.conv.45.candidate" : 0.0625,
    "rollback-1.conv.45.control" : 0.06499999761581421,
    "rollback-1.conv.46.candidate" : 0.06043956056237221,
    "rollback-1.conv.46.control" : 0.04670329764485359,
    "rollback-1.conv.5.candidate" : 0.017391303554177284,
    "rollback-1.conv.5.control" : 0.01983695663511753,
    "rollback-1.conv.6.candidate" : 0.018583131954073906,
    "rollback-1.conv.6.control" : 0.018146995455026627,
    "rollback-1.conv.8.candidate" : 0.02073170803487301,
    "rollback-1.conv.8.control" : 0.014634146355092525,
    "rollback-1.conv.9.candidate" : 0.036684781312942505,
    "rollback-1.conv.9.control" : 0.019913382828235626,
    "rollback-1.index.11.candidate" : 0.03433641791343689,
    "rollback-1.index.11.control" : 0.03086419776082039,
    "rollback-1.index.15.candidate" : 0.05056179687380791,
    "rollback-1.index.15.control" : 0.056179776787757874,
    "rollback-1.index.19.candidate" : 0.053082190454006195,
    "rollback-1.index.19.control" : 0.050513699650764465,
    "rollback-1.index.23.candidate" : 0.03660714253783226,
    "rollback-1.index.23.control" : 0.03437500074505806,
    "rollback-1.index.27.candidate" : 0.0476098395884037,
    "rollback-1.index.27.control" : 0.03774752467870712,
    "rollback-1.index.3.candidate" : 0,
    "rollback-1.index.3.control" : 0.04289940744638443,
    "rollback-1.index.31.candidate" : 0.211345374584198,
    "rollback-1.index.31.control" : 0.1897590309381485,
    "rollback-1.index.35.candidate" : 0.22889073193073273,
    "rollback-1.index.35.control" : 0.17715232074260712,
    "rollback-1.index.39.candidate" : 0.7784810066223145,
    "rollback-1.index.39.control" : 0.09691455960273743,
    "rollback-1.index.43.candidate" : 0.819531261920929,
    "rollback-1.index.43.control" : 0.08984375,
    "rollback-1.index.47.candidate" : 0.1912499964237213,
    "rollback-1.index.47.control" : 0.11666666716337204,
    "rollback-1.index.7.candidate" : 0.026654411107301712,
    "rollback-1.index.7.control" : 0.03079044073820114,
    "rollback-1.key.11.candidate" : 0.09062500298023224,
    "rollback-1.key.11.control" : 0.1042630672454834,
    "rollback-1.key.15.candidate" : 0.07846715301275253,
    "rollback-1.key.15.control" : 0.07572992891073227,
    "rollback-1.key.19.candidate" : 0.12042026221752167,
    "rollback-1.key.19.control" : 0.10721983015537262,
    "rollback-1.key.23.candidate" : 0.11041666567325592,
    "rollback-1.key.23.control" : 0.08958332985639572,
    "rollback-1.key.27.candidate" : 0.16077302396297455,
    "rollback-1.key.27.control" : 0.109375,
    "rollback-1.key.3.candidate" : 0,
    "rollback-1.key.3.control" : 0.05710659921169281,
    "rollback-1.key.31.candidate" : 0.268456369638443,
    "rollback-1.key.31.control" : 0.16023489832878113,
    "rollback-1.key.35.candidate" : 0.2160852700471878,
    "rollback-1.key.35.control" : 0.213662788271904,
    "rollback-1.key.39.candidate" : 0.6546875238418579,
    "rollback-1.key.39.control" : 0.16171875596046448,
    "rollback-1.key.43.candidate" : 0.6696428656578064,
    "rollback-1.key.43.control" : 0.09651360660791397,
    "rollback-1.key.47.candidate" : 0.30349794030189514,
    "rollback-1.key.47.control" : 0.11985597014427185,
    "rollback-1.key.7.candidate" : 0.06647727638483047,
    "rollback-1.key.7.control" : 0.08671875298023224,
    "rollback-1.logits.candidate" : 0.06820341944694519,
    "rollback-1.logits.control" : 0.08792775869369507,
    "rollback-1.ple.1.candidate" : 0,
    "rollback-1.ple.1.control" : 0,
    "rollback-1.ssm.0.candidate" : 0,
    "rollback-1.ssm.0.control" : 0,
    "rollback-1.ssm.1.candidate" : 0,
    "rollback-1.ssm.1.control" : 1.4430391104269802e-07,
    "rollback-1.ssm.10.candidate" : 0.060425687581300735,
    "rollback-1.ssm.10.control" : 0.03884135186672211,
    "rollback-1.ssm.12.candidate" : 0.005092724226415157,
    "rollback-1.ssm.12.control" : 0.0019352049566805363,
    "rollback-1.ssm.13.candidate" : 0.031990159302949905,
    "rollback-1.ssm.13.control" : 0.01628757268190384,
    "rollback-1.ssm.14.candidate" : 0.015694573521614075,
    "rollback-1.ssm.14.control" : 0.012379494495689869,
    "rollback-1.ssm.16.candidate" : 0.06386733055114746,
    "rollback-1.ssm.16.control" : 0.028569580987095833,
    "rollback-1.ssm.17.candidate" : 0.06572525203227997,
    "rollback-1.ssm.17.control" : 0.03324773162603378,
    "rollback-1.ssm.18.candidate" : 0.049671921879053116,
    "rollback-1.ssm.18.control" : 0.053620319813489914,
    "rollback-1.ssm.2.candidate" : 0,
    "rollback-1.ssm.2.control" : 0.000569728494156152,
    "rollback-1.ssm.20.candidate" : 0.01586427353322506,
    "rollback-1.ssm.20.control" : 0.017535438761115074,
    "rollback-1.ssm.21.candidate" : 0.015406063757836819,
    "rollback-1.ssm.21.control" : 0.017873108386993408,
    "rollback-1.ssm.22.candidate" : 0.009713050909340382,
    "rollback-1.ssm.22.control" : 0.006684947293251753,
    "rollback-1.ssm.24.candidate" : 0.06553415954113007,
    "rollback-1.ssm.24.control" : 0.031159264966845512,
    "rollback-1.ssm.25.candidate" : 0.11287657916545868,
    "rollback-1.ssm.25.control" : 0.08096238225698471,
    "rollback-1.ssm.26.candidate" : 0.07819768041372299,
    "rollback-1.ssm.26.control" : 0.12616541981697083,
    "rollback-1.ssm.28.candidate" : 0.004106000531464815,
    "rollback-1.ssm.28.control" : 0.006023193709552288,
    "rollback-1.ssm.29.candidate" : 0.0730171948671341,
    "rollback-1.ssm.29.control" : 0.06098897010087967,
    "rollback-1.ssm.30.candidate" : 0.10424552857875824,
    "rollback-1.ssm.30.control" : 0.07973350584506989,
    "rollback-1.ssm.32.candidate" : 0.114621102809906,
    "rollback-1.ssm.32.control" : 0.09186255931854248,
    "rollback-1.ssm.33.candidate" : 0.0717260017991066,
    "rollback-1.ssm.33.control" : 0.11352404206991196,
    "rollback-1.ssm.34.candidate" : 0.11726324260234833,
    "rollback-1.ssm.34.control" : 0.11447658389806747,
    "rollback-1.ssm.36.candidate" : 0.06010494381189346,
    "rollback-1.ssm.36.control" : 0.07429130375385284,
    "rollback-1.ssm.37.candidate" : 0.031238364055752754,
    "rollback-1.ssm.37.control" : 0.05292356759309769,
    "rollback-1.ssm.38.candidate" : 0.03441648930311203,
    "rollback-1.ssm.38.control" : 0.02613392286002636,
    "rollback-1.ssm.4.candidate" : 0.003922025207430124,
    "rollback-1.ssm.4.control" : 0.004595475271344185,
    "rollback-1.ssm.40.candidate" : 0.04740646108984947,
    "rollback-1.ssm.40.control" : 0.03709370270371437,
    "rollback-1.ssm.41.candidate" : 0.03894895315170288,
    "rollback-1.ssm.41.control" : 0.027676962316036224,
    "rollback-1.ssm.42.candidate" : 0.0404047928750515,
    "rollback-1.ssm.42.control" : 0.056950539350509644,
    "rollback-1.ssm.44.candidate" : 0.03967198356986046,
    "rollback-1.ssm.44.control" : 0.04519997909665108,
    "rollback-1.ssm.45.candidate" : 0.09635422378778458,
    "rollback-1.ssm.45.control" : 0.12880128622055054,
    "rollback-1.ssm.46.candidate" : 0.10832377523183823,
    "rollback-1.ssm.46.control" : 0.09470987319946289,
    "rollback-1.ssm.5.candidate" : 0.07309345155954361,
    "rollback-1.ssm.5.control" : 0.020608723163604736,
    "rollback-1.ssm.6.candidate" : 0.02295873314142227,
    "rollback-1.ssm.6.control" : 0.017864404246211052,
    "rollback-1.ssm.8.candidate" : 0.01262947078794241,
    "rollback-1.ssm.8.control" : 0.005705313757061958,
    "rollback-1.ssm.9.candidate" : 0.04425971582531929,
    "rollback-1.ssm.9.control" : 0.028329720720648766,
    "rollback-1.value.11.candidate" : 0.020346222445368767,
    "rollback-1.value.11.control" : 0.018041817471385002,
    "rollback-1.value.15.candidate" : 0.028884463012218475,
    "rollback-1.value.15.control" : 0.03187251091003418,
    "rollback-1.value.19.candidate" : 0.02908163331449032,
    "rollback-1.value.19.control" : 0.03214285895228386,
    "rollback-1.value.23.candidate" : 0.05755813792347908,
    "rollback-1.value.23.control" : 0.041860464960336685,
    "rollback-1.value.27.candidate" : 0.018028846010565758,
    "rollback-1.value.27.control" : 0.014546001330018044,
    "rollback-1.value.3.candidate" : 0,
    "rollback-1.value.3.control" : 0.0380515530705452,
    "rollback-1.value.31.candidate" : 0.09089674055576324,
    "rollback-1.value.31.control" : 0.072826087474823,
    "rollback-1.value.35.candidate" : 0.10711050778627396,
    "rollback-1.value.35.control" : 0.10688405483961105,
    "rollback-1.value.39.candidate" : 0.8035714030265808,
    "rollback-1.value.39.control" : 0.10833333432674408,
    "rollback-1.value.43.candidate" : 0.35845303535461426,
    "rollback-1.value.43.control" : 0.05745341628789902,
    "rollback-1.value.47.candidate" : 0.4168814420700073,
    "rollback-1.value.47.control" : 0.23518040776252747,
    "rollback-1.value.7.candidate" : 0.019086826592683792,
    "rollback-1.value.7.control" : 0.021800149232149124,
    "rollback-2.conv.0.candidate" : 0,
    "rollback-2.conv.0.control" : 0,
    "rollback-2.conv.1.candidate" : 0,
    "rollback-2.conv.1.control" : 0,
    "rollback-2.conv.10.candidate" : 0.020078502595424652,
    "rollback-2.conv.10.control" : 0.03064613603055477,
    "rollback-2.conv.12.candidate" : 0.014639639295637608,
    "rollback-2.conv.12.control" : 0.01576576568186283,
    "rollback-2.conv.13.candidate" : 0.020014045760035515,
    "rollback-2.conv.13.control" : 0.021067416295409203,
    "rollback-2.conv.14.candidate" : 0.02371794916689396,
    "rollback-2.conv.14.control" : 0.020512821152806282,
    "rollback-2.conv.16.candidate" : 0.02599009871482849,
    "rollback-2.conv.16.control" : 0.022896040230989456,
    "rollback-2.conv.17.candidate" : 0.03684210404753685,
    "rollback-2.conv.17.control" : 0.04210526496171951,
    "rollback-2.conv.18.candidate" : 0.02466367743909359,
    "rollback-2.conv.18.control" : 0.02970851957798004,
    "rollback-2.conv.2.candidate" : 0,
    "rollback-2.conv.2.control" : 0,
    "rollback-2.conv.20.candidate" : 0.05269451439380646,
    "rollback-2.conv.20.control" : 0.03826530650258064,
    "rollback-2.conv.21.candidate" : 0.030232558026909828,
    "rollback-2.conv.21.control" : 0.0325581394135952,
    "rollback-2.conv.22.candidate" : 0.023381294682621956,
    "rollback-2.conv.22.control" : 0.01708633080124855,
    "rollback-2.conv.24.candidate" : 0.04076087102293968,
    "rollback-2.conv.24.control" : 0.027853261679410934,
    "rollback-2.conv.25.candidate" : 0.033608488738536835,
    "rollback-2.conv.25.control" : 0.033608488738536835,
    "rollback-2.conv.26.candidate" : 0.04539395868778229,
    "rollback-2.conv.26.control" : 0.04739336669445038,
    "rollback-2.conv.28.candidate" : 0.04878048598766327,
    "rollback-2.conv.28.control" : 0.057926829904317856,
    "rollback-2.conv.29.candidate" : 0.07389502972364426,
    "rollback-2.conv.29.control" : 0.06906077265739441,
    "rollback-2.conv.30.candidate" : 0.11578947305679321,
    "rollback-2.conv.30.control" : 0.08421052992343903,
    "rollback-2.conv.32.candidate" : 0.06782510876655579,
    "rollback-2.conv.32.control" : 0.07847533375024796,
    "rollback-2.conv.33.candidate" : 0.059068627655506134,
    "rollback-2.conv.33.control" : 0.06372549384832382,
    "rollback-2.conv.34.candidate" : 0.0793067216873169,
    "rollback-2.conv.34.control" : 0.0903361365199089,
    "rollback-2.conv.36.candidate" : 0.09517766535282135,
    "rollback-2.conv.36.control" : 0.0824873074889183,
    "rollback-2.conv.37.candidate" : 0.08444444090127945,
    "rollback-2.conv.37.control" : 0.05999999865889549,
    "rollback-2.conv.38.candidate" : 0.03915662690997124,
    "rollback-2.conv.38.control" : 0.04518072307109833,
    "rollback-2.conv.4.candidate" : 0,
    "rollback-2.conv.4.control" : 0.011829453520476818,
    "rollback-2.conv.40.candidate" : 0.0699300691485405,
    "rollback-2.conv.40.control" : 0.09615384787321091,
    "rollback-2.conv.41.candidate" : 0.06730769574642181,
    "rollback-2.conv.41.control" : 0.0615384615957737,
    "rollback-2.conv.42.candidate" : 0.06464041024446487,
    "rollback-2.conv.42.control" : 0.05821917951107025,
    "rollback-2.conv.44.candidate" : 0.1808176040649414,
    "rollback-2.conv.44.control" : 0.08805031329393387,
    "rollback-2.conv.45.candidate" : 0.0625,
    "rollback-2.conv.45.control" : 0.06499999761581421,
    "rollback-2.conv.46.candidate" : 0.06010929122567177,
    "rollback-2.conv.46.control" : 0.0625,
    "rollback-2.conv.5.candidate" : 0.01600000075995922,
    "rollback-2.conv.5.control" : 0.012000000104308128,
    "rollback-2.conv.6.candidate" : 0.009708737954497337,
    "rollback-2.conv.6.control" : 0.018146995455026627,
    "rollback-2.conv.8.candidate" : 0.014634146355092525,
    "rollback-2.conv.8.control" : 0.019969511777162552,
    "rollback-2.conv.9.candidate" : 0.0372190997004509,
    "rollback-2.conv.9.control" : 0.02247191034257412,
    "rollback-2.index.11.candidate" : 0.03433641791343689,
    "rollback-2.index.11.control" : 0.03086419776082039,
    "rollback-2.index.15.candidate" : 0.05056179687380791,
    "rollback-2.index.15.control" : 0.056179776787757874,
    "rollback-2.index.19.candidate" : 0.053082190454006195,
    "rollback-2.index.19.control" : 0.050513699650764465,
    "rollback-2.index.23.candidate" : 0.03660714253783226,
    "rollback-2.index.23.control" : 0.03437500074505806,
    "rollback-2.index.27.candidate" : 0.0476098395884037,
    "rollback-2.index.27.control" : 0.03774752467870712,
    "rollback-2.index.3.candidate" : 0,
    "rollback-2.index.3.control" : 0.04289940744638443,
    "rollback-2.index.31.candidate" : 0.211345374584198,
    "rollback-2.index.31.control" : 0.1897590309381485,
    "rollback-2.index.35.candidate" : 0.22889073193073273,
    "rollback-2.index.35.control" : 0.17715232074260712,
    "rollback-2.index.39.candidate" : 0.7784810066223145,
    "rollback-2.index.39.control" : 0.09691455960273743,
    "rollback-2.index.43.candidate" : 0.819531261920929,
    "rollback-2.index.43.control" : 0.08984375,
    "rollback-2.index.47.candidate" : 0.1912499964237213,
    "rollback-2.index.47.control" : 0.11666666716337204,
    "rollback-2.index.7.candidate" : 0.026654411107301712,
    "rollback-2.index.7.control" : 0.03079044073820114,
    "rollback-2.key.11.candidate" : 0.09062500298023224,
    "rollback-2.key.11.control" : 0.1042630672454834,
    "rollback-2.key.15.candidate" : 0.07846715301275253,
    "rollback-2.key.15.control" : 0.07572992891073227,
    "rollback-2.key.19.candidate" : 0.12042026221752167,
    "rollback-2.key.19.control" : 0.10721983015537262,
    "rollback-2.key.23.candidate" : 0.11041666567325592,
    "rollback-2.key.23.control" : 0.08958332985639572,
    "rollback-2.key.27.candidate" : 0.16077302396297455,
    "rollback-2.key.27.control" : 0.109375,
    "rollback-2.key.3.candidate" : 0,
    "rollback-2.key.3.control" : 0.05710659921169281,
    "rollback-2.key.31.candidate" : 0.268456369638443,
    "rollback-2.key.31.control" : 0.16023489832878113,
    "rollback-2.key.35.candidate" : 0.2160852700471878,
    "rollback-2.key.35.control" : 0.213662788271904,
    "rollback-2.key.39.candidate" : 0.6546875238418579,
    "rollback-2.key.39.control" : 0.16171875596046448,
    "rollback-2.key.43.candidate" : 0.6696428656578064,
    "rollback-2.key.43.control" : 0.09651360660791397,
    "rollback-2.key.47.candidate" : 0.30349794030189514,
    "rollback-2.key.47.control" : 0.11985597014427185,
    "rollback-2.key.7.candidate" : 0.06647727638483047,
    "rollback-2.key.7.control" : 0.08671875298023224,
    "rollback-2.logits.candidate" : 0.0680927112698555,
    "rollback-2.logits.control" : 0.06595940887928009,
    "rollback-2.ple.1.candidate" : 0,
    "rollback-2.ple.1.control" : 0,
    "rollback-2.ssm.0.candidate" : 0,
    "rollback-2.ssm.0.control" : 0,
    "rollback-2.ssm.1.candidate" : 0,
    "rollback-2.ssm.1.control" : 1.4438664663884992e-07,
    "rollback-2.ssm.10.candidate" : 0.033273182809352875,
    "rollback-2.ssm.10.control" : 0.0371362529695034,
    "rollback-2.ssm.12.candidate" : 0.005353019572794437,
    "rollback-2.ssm.12.control" : 0.0028564748354256153,
    "rollback-2.ssm.13.candidate" : 0.021800963208079338,
    "rollback-2.ssm.13.control" : 0.03110891953110695,
    "rollback-2.ssm.14.candidate" : 0.01120645273476839,
    "rollback-2.ssm.14.control" : 0.013031921349465847,
    "rollback-2.ssm.16.candidate" : 0.05567852407693863,
    "rollback-2.ssm.16.control" : 0.031234335154294968,
    "rollback-2.ssm.17.candidate" : 0.03600139915943146,
    "rollback-2.ssm.17.control" : 0.05315547436475754,
    "rollback-2.ssm.18.candidate" : 0.05542033165693283,
    "rollback-2.ssm.18.control" : 0.024985024705529213,
    "rollback-2.ssm.2.candidate" : 0,
    "rollback-2.ssm.2.control" : 0.000572355231270194,
    "rollback-2.ssm.20.candidate" : 0.02101042866706848,
    "rollback-2.ssm.20.control" : 0.02178126573562622,
    "rollback-2.ssm.21.candidate" : 0.02097313478589058,
    "rollback-2.ssm.21.control" : 0.03926648944616318,
    "rollback-2.ssm.22.candidate" : 0.009791098535060883,
    "rollback-2.ssm.22.control" : 0.006624168250709772,
    "rollback-2.ssm.24.candidate" : 0.025456732138991356,
    "rollback-2.ssm.24.control" : 0.0217464417219162,
    "rollback-2.ssm.25.candidate" : 0.04997745528817177,
    "rollback-2.ssm.25.control" : 0.07034531980752945,
    "rollback-2.ssm.26.candidate" : 0.07308058440685272,
    "rollback-2.ssm.26.control" : 0.08221815526485443,
    "rollback-2.ssm.28.candidate" : 0.004100750666111708,
    "rollback-2.ssm.28.control" : 0.003875714959576726,
    "rollback-2.ssm.29.candidate" : 0.08364250510931015,
    "rollback-2.ssm.29.control" : 0.06277282536029816,
    "rollback-2.ssm.30.candidate" : 0.03954983875155449,
    "rollback-2.ssm.30.control" : 0.08665049076080322,
    "rollback-2.ssm.32.candidate" : 0.05384548008441925,
    "rollback-2.ssm.32.control" : 0.09383157640695572,
    "rollback-2.ssm.33.candidate" : 0.06949125230312347,
    "rollback-2.ssm.33.control" : 0.08954506367444992,
    "rollback-2.ssm.34.candidate" : 0.10795404016971588,
    "rollback-2.ssm.34.control" : 0.117633156478405,
    "rollback-2.ssm.36.candidate" : 0.10239371657371521,
    "rollback-2.ssm.36.control" : 0.07414287328720093,
    "rollback-2.ssm.37.candidate" : 0.07399536669254303,
    "rollback-2.ssm.37.control" : 0.127573162317276,
    "rollback-2.ssm.38.candidate" : 0.03459339216351509,
    "rollback-2.ssm.38.control" : 0.02555782161653042,
    "rollback-2.ssm.4.candidate" : 0.003828616812825203,
    "rollback-2.ssm.4.control" : 0.0076591926626861095,
    "rollback-2.ssm.40.candidate" : 0.05075783282518387,
    "rollback-2.ssm.40.control" : 0.038233187049627304,
    "rollback-2.ssm.41.candidate" : 0.0389065183699131,
    "rollback-2.ssm.41.control" : 0.027964729815721512,
    "rollback-2.ssm.42.candidate" : 0.040565669536590576,
    "rollback-2.ssm.42.control" : 0.03802715241909027,
    "rollback-2.ssm.44.candidate" : 0.03966482728719711,
    "rollback-2.ssm.44.control" : 0.028996184468269348,
    "rollback-2.ssm.45.candidate" : 0.0885743796825409,
    "rollback-2.ssm.45.control" : 0.1084364727139473,
    "rollback-2.ssm.46.candidate" : 0.09685635566711426,
    "rollback-2.ssm.46.control" : 0.08414211124181747,
    "rollback-2.ssm.5.candidate" : 0.07100304961204529,
    "rollback-2.ssm.5.control" : 0.011950308457016945,
    "rollback-2.ssm.6.candidate" : 0.011114725843071938,
    "rollback-2.ssm.6.control" : 0.01669519953429699,
    "rollback-2.ssm.8.candidate" : 0.0068156179040670395,
    "rollback-2.ssm.8.control" : 0.012213550508022308,
    "rollback-2.ssm.9.candidate" : 0.021882839500904083,
    "rollback-2.ssm.9.control" : 0.03799200803041458,
    "rollback-2.value.11.candidate" : 0.020346222445368767,
    "rollback-2.value.11.control" : 0.018041817471385002,
    "rollback-2.value.15.candidate" : 0.028884463012218475,
    "rollback-2.value.15.control" : 0.03187251091003418,
    "rollback-2.value.19.candidate" : 0.02908163331449032,
    "rollback-2.value.19.control" : 0.03214285895228386,
    "rollback-2.value.23.candidate" : 0.05755813792347908,
    "rollback-2.value.23.control" : 0.041860464960336685,
    "rollback-2.value.27.candidate" : 0.018028846010565758,
    "rollback-2.value.27.control" : 0.014546001330018044,
    "rollback-2.value.3.candidate" : 0,
    "rollback-2.value.3.control" : 0.0380515530705452,
    "rollback-2.value.31.candidate" : 0.09089674055576324,
    "rollback-2.value.31.control" : 0.072826087474823,
    "rollback-2.value.35.candidate" : 0.10711050778627396,
    "rollback-2.value.35.control" : 0.10688405483961105,
    "rollback-2.value.39.candidate" : 0.8035714030265808,
    "rollback-2.value.39.control" : 0.10833333432674408,
    "rollback-2.value.43.candidate" : 0.35845303535461426,
    "rollback-2.value.43.control" : 0.05745341628789902,
    "rollback-2.value.47.candidate" : 0.4168814420700073,
    "rollback-2.value.47.control" : 0.23518040776252747,
    "rollback-2.value.7.candidate" : 0.019086826592683792,
    "rollback-2.value.7.control" : 0.021800149232149124,
    "rollback-3.conv.0.candidate" : 0,
    "rollback-3.conv.0.control" : 0,
    "rollback-3.conv.1.candidate" : 0,
    "rollback-3.conv.1.control" : 0,
    "rollback-3.conv.10.candidate" : 0.01777626760303974,
    "rollback-3.conv.10.control" : 0.03064613603055477,
    "rollback-3.conv.12.candidate" : 0.015554617159068584,
    "rollback-3.conv.12.control" : 0.01576576568186283,
    "rollback-3.conv.13.candidate" : 0.03035714291036129,
    "rollback-3.conv.13.control" : 0.018571428954601288,
    "rollback-3.conv.14.candidate" : 0.020512821152806282,
    "rollback-3.conv.14.control" : 0.020913461223244667,
    "rollback-3.conv.16.candidate" : 0.025680692866444588,
    "rollback-3.conv.16.control" : 0.024752475321292877,
    "rollback-3.conv.17.candidate" : 0.044736843556165695,
    "rollback-3.conv.17.control" : 0.04210526496171951,
    "rollback-3.conv.18.candidate" : 0.03811659291386604,
    "rollback-3.conv.18.control" : 0.02970851957798004,
    "rollback-3.conv.2.candidate" : 0,
    "rollback-3.conv.2.control" : 0,
    "rollback-3.conv.20.candidate" : 0.06592793017625809,
    "rollback-3.conv.20.control" : 0.040816325694322586,
    "rollback-3.conv.21.candidate" : 0.025473933666944504,
    "rollback-3.conv.21.control" : 0.033175356686115265,
    "rollback-3.conv.22.candidate" : 0.023295968770980835,
    "rollback-3.conv.22.control" : 0.036231882870197296,
    "rollback-3.conv.24.candidate" : 0.03100328892469406,
    "rollback-3.conv.24.control" : 0.030921053141355515,
    "rollback-3.conv.25.candidate" : 0.048076923936605453,
    "rollback-3.conv.25.control" : 0.028846153989434242,
    "rollback-3.conv.26.candidate" : 0.03799019753932953,
    "rollback-3.conv.26.control" : 0.046568628400564194,
    "rollback-3.conv.28.candidate" : 0.056910570710897446,
    "rollback-3.conv.28.control" : 0.030487805604934692,
    "rollback-3.conv.29.candidate" : 0.09195402264595032,
    "rollback-3.conv.29.control" : 0.05316092073917389,
    "rollback-3.conv.30.candidate" : 0.09947644174098969,
    "rollback-3.conv.30.control" : 0.05431937053799629,
    "rollback-3.conv.32.candidate" : 0.06307339668273926,
    "rollback-3.conv.32.control" : 0.07052752375602722,
    "rollback-3.conv.33.candidate" : 0.06623931974172592,
    "rollback-3.conv.33.control" : 0.06730769574642181,
    "rollback-3.conv.34.candidate" : 0.0626329779624939,
    "rollback-3.conv.34.control" : 0.06276595592498779,
    "rollback-3.conv.36.candidate" : 0.051435407251119614,
    "rollback-3.conv.36.control" : 0.12081339955329895,
    "rollback-3.conv.37.candidate" : 0.0672222226858139,
    "rollback-3.conv.37.control" : 0.05055555701255798,
    "rollback-3.conv.38.candidate" : 0.041039157658815384,
    "rollback-3.conv.38.control" : 0.03915662690997124,
    "rollback-3.conv.4.candidate" : 0,
    "rollback-3.conv.4.control" : 0.011829453520476818,
    "rollback-3.conv.40.candidate" : 0.08916083723306656,
    "rollback-3.conv.40.control" : 0.05856643244624138,
    "rollback-3.conv.41.candidate" : 0.06104651093482971,
    "rollback-3.conv.41.control" : 0.06201550364494324,
    "rollback-3.conv.42.candidate" : 0.06967037916183472,
    "rollback-3.conv.42.control" : 0.06506849080324173,
    "rollback-3.conv.44.candidate" : 0.1808176040649414,
    "rollback-3.conv.44.control" : 0.08962263911962509,
    "rollback-3.conv.45.candidate" : 0.048426419496536255,
    "rollback-3.conv.45.control" : 0.04920212924480438,
    "rollback-3.conv.46.candidate" : 0.040812842547893524,
    "rollback-3.conv.46.control" : 0.0625,
    "rollback-3.conv.5.candidate" : 0.013828124850988388,
    "rollback-3.conv.5.control" : 0.009999999776482582,
    "rollback-3.conv.6.candidate" : 0.009852216579020023,
    "rollback-3.conv.6.control" : 0.012315270490944386,
    "rollback-3.conv.8.candidate" : 0.011848341673612595,
    "rollback-3.conv.8.control" : 0.014218009077012539,
    "rollback-3.conv.9.candidate" : 0.013521634973585606,
    "rollback-3.conv.9.control" : 0.01923076994717121,
    "rollback-3.index.11.candidate" : 0.03433641791343689,
    "rollback-3.index.11.control" : 0.03086419776082039,
    "rollback-3.index.15.candidate" : 0.05056179687380791,
    "rollback-3.index.15.control" : 0.056179776787757874,
    "rollback-3.index.19.candidate" : 0.053082190454006195,
    "rollback-3.index.19.control" : 0.050513699650764465,
    "rollback-3.index.23.candidate" : 0.03660714253783226,
    "rollback-3.index.23.control" : 0.03437500074505806,
    "rollback-3.index.27.candidate" : 0.0476098395884037,
    "rollback-3.index.27.control" : 0.03774752467870712,
    "rollback-3.index.3.candidate" : 0,
    "rollback-3.index.3.control" : 0.04289940744638443,
    "rollback-3.index.31.candidate" : 0.211345374584198,
    "rollback-3.index.31.control" : 0.1897590309381485,
    "rollback-3.index.35.candidate" : 0.22889073193073273,
    "rollback-3.index.35.control" : 0.17715232074260712,
    "rollback-3.index.39.candidate" : 0.7784810066223145,
    "rollback-3.index.39.control" : 0.09691455960273743,
    "rollback-3.index.43.candidate" : 0.819531261920929,
    "rollback-3.index.43.control" : 0.08984375,
    "rollback-3.index.47.candidate" : 0.1912499964237213,
    "rollback-3.index.47.control" : 0.11666666716337204,
    "rollback-3.index.7.candidate" : 0.026654411107301712,
    "rollback-3.index.7.control" : 0.03079044073820114,
    "rollback-3.key.11.candidate" : 0.09062500298023224,
    "rollback-3.key.11.control" : 0.1042630672454834,
    "rollback-3.key.15.candidate" : 0.07846715301275253,
    "rollback-3.key.15.control" : 0.07572992891073227,
    "rollback-3.key.19.candidate" : 0.12042026221752167,
    "rollback-3.key.19.control" : 0.10721983015537262,
    "rollback-3.key.23.candidate" : 0.11041666567325592,
    "rollback-3.key.23.control" : 0.08958332985639572,
    "rollback-3.key.27.candidate" : 0.16077302396297455,
    "rollback-3.key.27.control" : 0.109375,
    "rollback-3.key.3.candidate" : 0,
    "rollback-3.key.3.control" : 0.05710659921169281,
    "rollback-3.key.31.candidate" : 0.268456369638443,
    "rollback-3.key.31.control" : 0.16023489832878113,
    "rollback-3.key.35.candidate" : 0.2160852700471878,
    "rollback-3.key.35.control" : 0.213662788271904,
    "rollback-3.key.39.candidate" : 0.6546875238418579,
    "rollback-3.key.39.control" : 0.16171875596046448,
    "rollback-3.key.43.candidate" : 0.6696428656578064,
    "rollback-3.key.43.control" : 0.09651360660791397,
    "rollback-3.key.47.candidate" : 0.30349794030189514,
    "rollback-3.key.47.control" : 0.11985597014427185,
    "rollback-3.key.7.candidate" : 0.06647727638483047,
    "rollback-3.key.7.control" : 0.08671875298023224,
    "rollback-3.logits.candidate" : 0.0684523805975914,
    "rollback-3.logits.control" : 0.06333333253860474,
    "rollback-3.ple.1.candidate" : 0,
    "rollback-3.ple.1.control" : 0,
    "rollback-3.ssm.0.candidate" : 0,
    "rollback-3.ssm.0.control" : 0,
    "rollback-3.ssm.1.candidate" : 0,
    "rollback-3.ssm.1.control" : 1.4425486938307586e-07,
    "rollback-3.ssm.10.candidate" : 0.03273482620716095,
    "rollback-3.ssm.10.control" : 0.026640664786100388,
    "rollback-3.ssm.12.candidate" : 0.0034412697423249483,
    "rollback-3.ssm.12.control" : 0.004058625549077988,
    "rollback-3.ssm.13.candidate" : 0.02577158436179161,
    "rollback-3.ssm.13.control" : 0.011790953576564789,
    "rollback-3.ssm.14.candidate" : 0.013295663520693779,
    "rollback-3.ssm.14.control" : 0.012165108695626259,
    "rollback-3.ssm.16.candidate" : 0.027100929990410805,
    "rollback-3.ssm.16.control" : 0.054637789726257324,
    "rollback-3.ssm.17.candidate" : 0.03255302086472511,
    "rollback-3.ssm.17.control" : 0.031236644834280014,
    "rollback-3.ssm.18.candidate" : 0.05342353135347366,
    "rollback-3.ssm.18.control" : 0.05317336320877075,
    "rollback-3.ssm.2.candidate" : 0,
    "rollback-3.ssm.2.control" : 0.0005542455473914742,
    "rollback-3.ssm.20.candidate" : 0.02305455692112446,
    "rollback-3.ssm.20.control" : 0.032887183129787445,
    "rollback-3.ssm.21.candidate" : 0.014654142782092094,
    "rollback-3.ssm.21.control" : 0.02062305063009262,
    "rollback-3.ssm.22.candidate" : 0.009887740015983582,
    "rollback-3.ssm.22.control" : 0.00666456064209342,
    "rollback-3.ssm.24.candidate" : 0.027024026960134506,
    "rollback-3.ssm.24.control" : 0.02849329262971878,
    "rollback-3.ssm.25.candidate" : 0.08216427266597748,
    "rollback-3.ssm.25.control" : 0.06434132158756256,
    "rollback-3.ssm.26.candidate" : 0.13274617493152618,
    "rollback-3.ssm.26.control" : 0.12099526822566986,
    "rollback-3.ssm.28.candidate" : 0.00593763031065464,
    "rollback-3.ssm.28.control" : 0.00379572412930429,
    "rollback-3.ssm.29.candidate" : 0.06446044147014618,
    "rollback-3.ssm.29.control" : 0.03388648107647896,
    "rollback-3.ssm.30.candidate" : 0.03994300961494446,
    "rollback-3.ssm.30.control" : 0.03583269938826561,
    "rollback-3.ssm.32.candidate" : 0.08191616833209991,
    "rollback-3.ssm.32.control" : 0.07988747954368591,
    "rollback-3.ssm.33.candidate" : 0.1007867231965065,
    "rollback-3.ssm.33.control" : 0.09801417589187622,
    "rollback-3.ssm.34.candidate" : 0.08720456063747406,
    "rollback-3.ssm.34.control" : 0.09388510882854462,
    "rollback-3.ssm.36.candidate" : 0.08048050105571747,
    "rollback-3.ssm.36.control" : 0.10559970885515213,
    "rollback-3.ssm.37.candidate" : 0.03993075713515282,
    "rollback-3.ssm.37.control" : 0.05218388885259628,
    "rollback-3.ssm.38.candidate" : 0.03438298776745796,
    "rollback-3.ssm.38.control" : 0.026103714480996132,
    "rollback-3.ssm.4.candidate" : 0.0038271185476332903,
    "rollback-3.ssm.4.control" : 0.005692209582775831,
    "rollback-3.ssm.40.candidate" : 0.05026060715317726,
    "rollback-3.ssm.40.control" : 0.04014786705374718,
    "rollback-3.ssm.41.candidate" : 0.038929183036088943,
    "rollback-3.ssm.41.control" : 0.027849625796079636,
    "rollback-3.ssm.42.candidate" : 0.03303338959813118,
    "rollback-3.ssm.42.control" : 0.030415106564760208,
    "rollback-3.ssm.44.candidate" : 0.03956456109881401,
    "rollback-3.ssm.44.control" : 0.04299299791455269,
    "rollback-3.ssm.45.candidate" : 0.10303895175457001,
    "rollback-3.ssm.45.control" : 0.10401055216789246,
    "rollback-3.ssm.46.candidate" : 0.08807634562253952,
    "rollback-3.ssm.46.control" : 0.08697135001420975,
    "rollback-3.ssm.5.candidate" : 0.0615759901702404,
    "rollback-3.ssm.5.control" : 0.01093192957341671,
    "rollback-3.ssm.6.candidate" : 0.011944379657506943,
    "rollback-3.ssm.6.control" : 0.012290812097489834,
    "rollback-3.ssm.8.candidate" : 0.008806849829852581,
    "rollback-3.ssm.8.control" : 0.00747230788692832,
    "rollback-3.ssm.9.candidate" : 0.024294741451740265,
    "rollback-3.ssm.9.control" : 0.03970598056912422,
    "rollback-3.value.11.candidate" : 0.020346222445368767,
    "rollback-3.value.11.control" : 0.018041817471385002,
    "rollback-3.value.15.candidate" : 0.028884463012218475,
    "rollback-3.value.15.control" : 0.03187251091003418,
    "rollback-3.value.19.candidate" : 0.02908163331449032,
    "rollback-3.value.19.control" : 0.03214285895228386,
    "rollback-3.value.23.candidate" : 0.05755813792347908,
    "rollback-3.value.23.control" : 0.041860464960336685,
    "rollback-3.value.27.candidate" : 0.018028846010565758,
    "rollback-3.value.27.control" : 0.014546001330018044,
    "rollback-3.value.3.candidate" : 0,
    "rollback-3.value.3.control" : 0.0380515530705452,
    "rollback-3.value.31.candidate" : 0.09089674055576324,
    "rollback-3.value.31.control" : 0.072826087474823,
    "rollback-3.value.35.candidate" : 0.10711050778627396,
    "rollback-3.value.35.control" : 0.10688405483961105,
    "rollback-3.value.39.candidate" : 0.8035714030265808,
    "rollback-3.value.39.control" : 0.10833333432674408,
    "rollback-3.value.43.candidate" : 0.35845303535461426,
    "rollback-3.value.43.control" : 0.05745341628789902,
    "rollback-3.value.47.candidate" : 0.4168814420700073,
    "rollback-3.value.47.control" : 0.23518040776252747,
    "rollback-3.value.7.candidate" : 0.019086826592683792,
    "rollback-3.value.7.control" : 0.021800149232149124,
    "routing.candidate" : 0.04717312692995287,
    "routing.control" : 0.03614293840403055,
    "selected_attention_tiles" : 96,
    "workspace_token_tile" : 256
  },
  "name" : "optimization-selected-attention-family",
  "passed" : false
}

```

## .build/optimization/selected-attention-family-2051-v36/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/selected-attention-component-performance-v36/result.json

SHA-256 `bb738a1dfe51148db52f167ec34d27631137342be94bd718109a02ceeb68aa9a`; 25622 bytes.

```
{
  "classification": "fixed-input exploratory component performance only",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "daf5cfb9d82dee06f19d1faf8be0761035eeacc4ab779177c169482bb2d3f796",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "1c2a2fd6a9cf947b1f592278d8ec3104159365b5ebef3af77976711de5ece31d",
      "Sources/Slotstream/Engine.swift": "049409573b87d6207ca180c0e88e1addb54c7ac8f3613d102e341728432a4ce6",
      "Sources/Slotstream/Errors.swift": "e6e0b22c57a4bb34e21b2cf203a91b3b2576fbc61d12b7cc7adc8648f66c0aa5",
      "Sources/Slotstream/ExactRead.swift": "ff52d7b1fab76ab520f6906680a57c5fd00f8ade50710ae8e71401e90ba3b0c2",
      "Sources/Slotstream/ExpertStore.swift": "cf7f8c33357a1ec4a2531f46adecf84f98ac5ade03d61f449c941c96b55b13d4",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "8c6a09c202ad6b970258d334d2bf53f3efd2a207089d944f12e1bbd640045ad4",
      "Sources/Slotstream/Governor.swift": "ec5e9d348525a5c9318d305d4a03f8977852330756051eff45bdaecd246141ce",
      "Sources/Slotstream/Layers.swift": "7140e68b03c501dbfbe775daf511145a6ad19ad8d932f8e2fa9b3c6f12f05628",
      "Sources/Slotstream/MTP.swift": "3fdc2513b8deb4fb63f0b9c136233fc9fac5840db3a6531f71327a3fb708b171",
      "Sources/Slotstream/Machine.swift": "0adecd0d8f3c92fd9d0e9779336d8824fe8403071bd2b86fea8637ea5311b3df",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "3c96b535d34f1d1d4d916a1918059f26e71b29b14bc6346580d9cc616511e6de",
      "Sources/Slotstream/NgramStore.swift": "38890c4cc5ea75360c1b83a8fa1aecc60a44da97728327c5240cd136632f9f58",
      "Sources/Slotstream/Observation.swift": "08762fd346e3131d408d5e1cf6c5c4d9916afff938ce201d3b17b197337d4507",
      "Sources/Slotstream/Optimizations.swift": "d8f3da196fae79b93e08d58bda977e3eb05d0a59eb298bf54c31ae97da1d41b2",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "fa6f1e6f5357e2873c8746d53ea259ed238c6fcf9f4b2fd1bacf7b1c11127bf9",
      "Sources/Slotstream/PrefixCache.swift": "35c8ccfff73d6711fcd7cc7e794406efaf7b3d0b6d2faceb4fa5775a43bbc494",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "6d2e84b18ec8bddc3c815e6a69de4a8eb1820ecdc395109375d614bac695b478",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "11fcc7c35158ff8a457fb114badb24e4c219ba1131243d59d6a6dc0fd2eea4f9",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "8cb5944f1cf3ac958ea2467daba0c286c706af4a7547eb1bb638e4fcc748cf10",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "dc981a71bf382209d0b194c9f567a2a88d7bdb238f98ecd467a41353ad4983cd",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "b45780b10a0924a9ed08e2c51867f8e0ce6d9fb41bd4b7069130ff3abcaed90b",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "d6b34fefde61bc70af151e2827d2185e67cdf2222b1b08f5cee427914a05d8f9",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "a93cb40a0a3e9532caffa7973bec0636706b6577a94b4de93e4f56f7ff13a1c1",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "c4bd6cc76eacf7a18907d6271d607feb6f9d23da6d823e819ea96492cf61afe3",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "39c4c677023dccd6dea4307904f43ba34a231341d13febd53130f73496131816",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/T0Checks.swift": "6cb398c4f528f4eb1c9af94045fc424ed2b75ebc250eefb2c8174e4092119053",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "aa0d77c63a619a0c9f66094be317f8187cd6155f822e3815d7fb7decc0a49ab9",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "652341c251b1a74e5debcb6e130fa67725c6fd1cf3a7ffa6b489c9449a14b5c1",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "9a135fe1ea8f50511e048fcb90479cb921d57a1abe973ccfdbd5f811f41ee033",
      "Sources/slotstream-cli/main.swift": "c61bfd9d667f5a72be4741133c428853b63d9026a1fbd4d28cac6ec35fd8ec68",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "d5fe4e4f071f68a81e5a109c28aa1d1d0281d1b9ff6b9cc62f8d78597b100760",
    "binary_sha256": "f659d9ba4f35fbe68b1d6251df91215a58496e3970fc8e2f1dcb83a10959a7bd",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "mlx": "0.31.1",
  "probe_sha256": "e4e5a4a4980f4f20dddca7c8a7633c3d4b66dfc2034a4a83f1b791e3f5497328",
  "shapes": [
    {
      "s": 256,
      "n": 256,
      "sparse": false,
      "input_sha256": [
        "d6e276e4ea233daaf59f3e185b264e44cb463c7c167470f5f3d1c639a05cf1f9",
        "6df24ac4ce736c55aa18e8d73363ffc8c806e727da9af3fbc734d64de253e73e",
        "2772ebeac17adea67ec52c7999039a9cc43a056e5e89eb1ad3eb9fb2ce818a22"
      ],
      "rounds": [
        {
          "round": 1,
          "cells": [
            {
              "candidate": false,
              "seconds": 0.0005047334358096123,
              "mlx_peak_bytes": 13240362,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": true,
              "seconds": 0.0023843500297516585,
              "mlx_peak_bytes": 6881316,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -3.7239787590593583
        },
        {
          "round": 2,
          "cells": [
            {
              "candidate": true,
              "seconds": 0.00215162499807775,
              "mlx_peak_bytes": 6881316,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": false,
              "seconds": 0.00044200001284480097,
              "mlx_peak_bytes": 13240364,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -3.86792971843928
        },
        {
          "round": 3,
          "cells": [
            {
              "candidate": false,
              "seconds": 0.0003766583744436502,
              "mlx_peak_bytes": 13240364,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": true,
              "seconds": 0.0018315084278583526,
              "mlx_peak_bytes": 6881316,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -3.8625188025186317
        },
        {
          "round": 4,
          "cells": [
            {
              "candidate": true,
              "seconds": 0.001849950011819601,
              "mlx_peak_bytes": 6881316,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": false,
              "seconds": 0.00039499159902334213,
              "mlx_peak_bytes": 13240362,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -3.683517361872493
        },
        {
          "round": 5,
          "cells": [
            {
              "candidate": false,
              "seconds": 0.0003779249731451273,
              "mlx_peak_bytes": 13240364,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": true,
              "seconds": 0.0018285417929291726,
              "mlx_peak_bytes": 6881316,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -3.8383724888881394
        }
      ],
      "valid_pairs": 5,
      "median_reduction": -3.8383724888881394
    },
    {
      "s": 256,
      "n": 2048,
      "sparse": false,
      "input_sha256": [
        "48a96654ec83f1bfebc9f7adaff9c28e0012676bb55f020c238b283c1a4cfd53",
        "2baba601e7dbaaca6c4a6586beb671d45f9afd678fc5330cbaa2f35f9ed863f7",
        "9f62b7fff42ce26408b4268bb2f7ef1b519bc2e3102b1c62dd45d808e6a1eb2f"
      ],
      "rounds": [
        {
          "round": 1,
          "cells": [
            {
              "candidate": false,
              "seconds": 0.000974524999037385,
              "mlx_peak_bytes": 39855148,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": true,
              "seconds": 0.022849858412519096,
              "mlx_peak_bytes": 11010084,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -22.447175223919036
        },
        {
          "round": 2,
          "cells": [
            {
              "candidate": true,
              "seconds": 0.02285891678184271,
              "mlx_peak_bytes": 11010084,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": false,
              "seconds": 0.001073375018313527,
              "mlx_peak_bytes": 39855148,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -20.296300353401502
        },
        {
          "round": 3,
          "cells": [
            {
              "candidate": false,
              "seconds": 0.0010442915838211775,
              "mlx_peak_bytes": 39855148,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": true,
              "seconds": 0.022857299959287047,
              "mlx_peak_bytes": 11010084,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -20.88785231386207
        },
        {
          "round": 4,
          "cells": [
            {
              "candidate": true,
              "seconds": 0.022892066603526474,
              "mlx_peak_bytes": 11010084,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": false,
              "seconds": 0.0010413581971079112,
              "mlx_peak_bytes": 39855148,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -20.982893750779468
        },
        {
          "round": 5,
          "cells": [
            {
              "candidate": false,
              "seconds": 0.001044041570276022,
              "mlx_peak_bytes": 39863338,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": true,
              "seconds": 0.02294654999859631,
              "mlx_peak_bytes": 11010084,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -20.978578872611113
        }
      ],
      "valid_pairs": 5,
      "median_reduction": -20.978578872611113
    },
    {
      "s": 256,
      "n": 8192,
      "sparse": true,
      "input_sha256": [
        "fa70dd22e000d7f784e3c3c3a62846f9638f12e74a089b18e5f21a5a756cea3c",
        "a29eae057e311d93974de83df8a47753544d2cff7cb19f0eccee7048b91accfe",
        "63ca602efb732a9d6a09af82a97deb70df728522d350841bee7faf0887548461"
      ],
      "rounds": [
        {
          "round": 1,
          "cells": [
            {
              "candidate": false,
              "seconds": 0.0036414416041225194,
              "mlx_peak_bytes": 129499172,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": true,
              "seconds": 0.02568450840190053,
              "mlx_peak_bytes": 25690144,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -6.053390166362353
        },
        {
          "round": 2,
          "cells": [
            {
              "candidate": true,
              "seconds": 0.02566688321530819,
              "mlx_peak_bytes": 28835872,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": false,
              "seconds": 0.003667166596278548,
              "mlx_peak_bytes": 129499172,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -5.9991047697028606
        },
        {
          "round": 3,
          "cells": [
            {
              "candidate": false,
              "seconds": 0.003640425018966198,
              "mlx_peak_bytes": 129499172,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": true,
              "seconds": 0.02573870844207704,
              "mlx_peak_bytes": 25690144,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -6.070248201235106
        },
        {
          "round": 4,
          "cells": [
            {
              "candidate": true,
              "seconds": 0.025615975027903914,
              "mlx_peak_bytes": 25690144,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": false,
              "seconds": 0.003557708393782377,
              "mlx_peak_bytes": 129499172,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -6.2001333984178215
        },
        {
          "round": 5,
          "cells": [
            {
              "candidate": false,
              "seconds": 0.003583808382973075,
              "mlx_peak_bytes": 129499172,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            },
            {
              "candidate": true,
              "seconds": 0.025670166593044996,
              "mlx_peak_bytes": 25690144,
              "swap_delta": {
                "swapins": 0,
                "swapouts": 0
              }
            }
          ],
          "valid": true,
          "reduction": -6.162817832283042
        }
      ],
      "valid_pairs": 5,
      "median_reduction": -6.070248201235106
    }
  ],
  "contract": "Five interleaved AB/BA rounds, five completed calls per arm, two warmups. Fixed BF16 B1 H24 HK2 D256 inputs. Any global swap excludes a whole pair; no replacement. Observe MLX allocator peak separately from process footprint. This cannot establish request benefit, energy, tail latency or model quality.",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32054345728,
    "swapins": 41705340,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   375773.\nPages active:                                1058758.\nPages inactive:                               988360.\nPages speculative:                             75346.\nPages throttled:                                   0.\nPages wired down:                             223160.\nPages purgeable:                               10367.\n\"Translation faults\":                    13818951421.\nPages copy-on-write:                       628909657.\nPages zero filled:                       15521661301.\nPages reactivated:                        2329839930.\nPages purged:                               61933007.\nFile-backed pages:                           1570302.\nAnonymous pages:                              552162.\nPages stored in compressor:                  1312668.\nPages occupied by compressor:                 363936.\nDecompressions:                            964488197.\nCompressions:                             1258371630.\nPageins:                                  5878366917.\nPageouts:                                   10629264.\nSwapins:                                    41705340.\nSwapouts:                                   69922789.\nPages tagged:                                 176675.\nPages tagged resident:                        131999.\nPages tagged compressed:                       44676.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7207.\nPages tag-storage free:                          388.\nPages tag-storage non-tag pageable:            90701.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7195584.\nTagged compressions:                         9446881.\nTagged decompressions:                       8693879.\n"
  },
  "completed": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31395151872,
    "swapins": 41705340,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   331871.\nPages active:                                1071015.\nPages inactive:                               993654.\nPages speculative:                             76189.\nPages throttled:                                   0.\nPages wired down:                             249121.\nPages purgeable:                                8063.\n\"Translation faults\":                    13819027912.\nPages copy-on-write:                       628918920.\nPages zero filled:                       15521719662.\nPages reactivated:                        2329840075.\nPages purged:                               61933007.\nFile-backed pages:                           1576274.\nAnonymous pages:                              564584.\nPages stored in compressor:                  1311991.\nPages occupied by compressor:                 363697.\nDecompressions:                            964488874.\nCompressions:                             1258371630.\nPageins:                                  5878373888.\nPageouts:                                   10629264.\nSwapins:                                    41705340.\nSwapouts:                                   69922789.\nPages tagged:                                 178331.\nPages tagged resident:                        133663.\nPages tagged compressed:                       44668.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7207.\nPages tag-storage free:                          302.\nPages tag-storage non-tag pageable:            90787.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7194688.\nTagged compressions:                         9446881.\nTagged decompressions:                       8693887.\n"
  }
}

```

## .build/optimization/selected-attention-component-performance-v36/SelectedAttention.swift

SHA-256 `70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db`; 7601 bytes.

```
import MLX

/// Experimental D256 GQA attention. Eight keys at a time, one query/head
/// per threadgroup, FP32 online softmax and value accumulation. This changes
/// reduction/rounding from the pinned BF16 matmul-softmax-matmul fallback;
/// it must pass the numerical-change contract before any default adoption.
package enum SelectedAttention {
    private final class Kernels: Sendable {
        static let shared = Kernels()
        let attend: MLXFast.MLXFastKernel? = MLXFast.metalKernel(
            name: "slotstream_selected_attention_d256",
            inputNames: ["query", "key", "value", "blocks", "metadata"],
            outputNames: ["output"], source: """
            uint tid = thread_position_in_grid.x % 256;
            uint row = thread_position_in_grid.x / 256;
            uint lane = thread_index_in_simdgroup;
            uint group = tid / 32;
            int S = metadata[0], N = metadata[1], H = metadata[2];
            int HK = metadata[3], base = metadata[4], K = metadata[5];
            int pos = row % S, head = (row / S) % H, batch = row / (S * H);
            int absolute = base + pos;
            int kvbase = (batch * HK + head / (H / HK)) * N * 256;
            int own = ((absolute + 1) / 4) * 4;
            int count = K ? K * 4 + absolute + 1 - own : absolute + 1;
            threadgroup float scores[8];
            threadgroup int keys[8];
            float maximum = -INFINITY, denominator = 0.0f, accumulated = 0.0f;
            // Scale is exactly 1/sqrt(256), representable in BF16 and FP32.
            float q[8];
            for (uint d = 0; d < 8; ++d)
                q[d] = float(InT(query[row * 256 + d * 32 + lane] * InT(0.0625f)));
            for (int lo = 0; lo < count; lo += 8) {
                int rank = lo + group, index = -1;
                if (rank < count) {
                    if (!K) index = rank;
                    else if (rank < K * 4) {
                        int block = blocks[(batch * S + pos) * K + rank / 4];
                        if (block >= 0 && block < N / 4 && block * 4 + 3 <= absolute)
                            index = block * 4 + rank % 4;
                    } else index = own + rank - K * 4;
                }
                float dot = 0.0f;
                if (index >= 0 && index < N) {
                    for (uint d = 0; d < 8; ++d)
                        dot += q[d] * float(key[kvbase + index * 256 + d * 32 + lane]);
                }
                dot = simd_sum(dot);
                if (lane == 0) {
                    keys[group] = index;
                    scores[group] = index >= 0 && index < N ? float(InT(dot)) : -INFINITY;
                }
                threadgroup_barrier(mem_flags::mem_threadgroup);
                float nextMax = maximum;
                for (uint i = 0; i < 8; ++i) nextMax = max(nextMax, scores[i]);
                // Entirely invisible groups are possible before the own tail.
                if (nextMax != -INFINITY) {
                    float correction = maximum == -INFINITY ? 0.0f : exp(maximum - nextMax);
                    accumulated *= correction;
                    denominator *= correction;
                    for (uint i = 0; i < 8; ++i) {
                        if (keys[i] >= 0 && keys[i] < N) {
                            float weight = exp(scores[i] - nextMax);
                            denominator += weight;
                            accumulated += weight * float(value[kvbase + keys[i] * 256 + tid]);
                        }
                    }
                    maximum = nextMax;
                }
                threadgroup_barrier(mem_flags::mem_threadgroup);
            }
            if (denominator == 0.0f) {
                // The pinned prefill fallback uses the finite dtype minimum
                // for masked scores. An entirely masked row is consequently
                // uniform over the full key domain, not a zero/NaN output.
                float weight = float(InT(1.0f / float(N)));
                for (int index = 0; index < N; ++index)
                    accumulated += weight * float(value[kvbase + index * 256 + tid]);
                output[row * 256 + tid] = InT(accumulated);
            } else output[row * 256 + tid] = InT(accumulated / denominator);
            """)
    }

    package static func supported(q: MLXArray, k: MLXArray, v: MLXArray, base: Int, blocks: MLXArray?) -> Bool {
        guard q.ndim == 4, k.ndim == 4, v.shape == k.shape,
              q.dtype == k.dtype, v.dtype == q.dtype, [.bfloat16, .float32].contains(q.dtype),
              q.dim(0) >= 1, q.dim(0) == k.dim(0), q.dim(1) >= 1, k.dim(1) >= 1,
              q.dim(1) % k.dim(1) == 0, q.dim(2) > 8, q.dim(2) <= 511,
              q.dim(3) == 256, k.dim(3) == 256, k.dim(2) <= 32768,
              base >= 0, base <= k.dim(2), q.dim(2) <= k.dim(2) - base else { return false }
        if let blocks {
            return blocks.ndim == 3 && blocks.dtype == .int32
                && blocks.shape == [q.dim(0), q.dim(2), blocks.dim(2)]
                && blocks.dim(2) > 0 && blocks.dim(2) <= 512
        }
        return true
    }

    package static func diagnosticProductionAttention(q: MLXArray, k: MLXArray, v: MLXArray, base: Int) -> MLXArray {
        QSAAttention.attend(q: q, k: k, v: v, sparse: nil, base: base,
            scale: 0.0625, block: 256, selectedAttention: true)
    }

    /// Callers supply unique complete-block IDs or sentinels. Causal checks
    /// and the own partial block are applied in the kernel; no host readback.
    package static func execute(q: MLXArray, k: MLXArray, v: MLXArray, base: Int, blocks: MLXArray? = nil) -> MLXArray {
        precondition(supported(q: q, k: k, v: v, base: base, blocks: blocks))
        guard let kernel = Kernels.shared.attend else { return MLXArray(0) }
        // Keep a one-element vector even in dense mode: scalar inputs are
        // generated as scalar Metal arguments and cannot be indexed at all.
        let ids = blocks ?? MLXArray([Int32(0)])
        let metadata = MLXArray([q.dim(2), k.dim(2), q.dim(1), k.dim(1), base, blocks?.dim(2) ?? 0].map(Int32.init))
        return kernel([contiguous(q), contiguous(k), contiguous(v), contiguous(ids), metadata],
            template: [("InT", q.dtype)], grid: (q.size, 1, 1), threadGroup: (256, 1, 1),
            outputShapes: [q.shape], outputDTypes: [q.dtype]).first ?? MLXArray(0)
    }

    private static let initialization: Result<Void, Error> = Result {
            try withError {
                guard Kernels.shared.attend != nil else { throw ModelError("selected attention kernel unavailable") }
                for dtype: DType in [.bfloat16, .float32] {
                    let q = MLXArray.zeros([1, 2, 9, 256], dtype: dtype)
                    let k = MLXArray.zeros([1, 1, 9, 256], dtype: dtype)
                    let v = MLXArray.ones([1, 1, 9, 256], dtype: dtype)
                    let got = execute(q: q, k: k, v: v, base: 0)
                    eval(got)
                    guard got.shape == q.shape, (got .== 1).all().item(Bool.self) else {
                        throw ModelError("selected attention initialization produced incorrect \(dtype) values")
                    }
                }
            }
    }
    package static var initializationIssue: String? {
        if case .failure(let error) = initialization { return String(describing: error) }
        return nil
    }
    @discardableResult package static func prepare() -> Bool {
        if case .success = initialization { return true }
        return false
    }
}

```

## .build/optimization/selected-attention-component-performance-v36/kernel.metal

SHA-256 `2cfb2d790ae68daee0a0c478d41cf67a77a420505b71ac9f1c603b0dbb8cd30d`; 2820 bytes.

```

uint tid = thread_position_in_grid.x % 256;
uint row = thread_position_in_grid.x / 256;
uint lane = thread_index_in_simdgroup;
uint group = tid / 32;
int S = metadata[0], N = metadata[1], H = metadata[2];
int HK = metadata[3], base = metadata[4], K = metadata[5];
int pos = row % S, head = (row / S) % H, batch = row / (S * H);
int absolute = base + pos;
int kvbase = (batch * HK + head / (H / HK)) * N * 256;
int own = ((absolute + 1) / 4) * 4;
int count = K ? K * 4 + absolute + 1 - own : absolute + 1;
threadgroup float scores[8];
threadgroup int keys[8];
float maximum = -INFINITY, denominator = 0.0f, accumulated = 0.0f;
// Scale is exactly 1/sqrt(256), representable in BF16 and FP32.
float q[8];
for (uint d = 0; d < 8; ++d)
    q[d] = float(InT(query[row * 256 + d * 32 + lane] * InT(0.0625f)));
for (int lo = 0; lo < count; lo += 8) {
    int rank = lo + group, index = -1;
    if (rank < count) {
        if (!K) index = rank;
        else if (rank < K * 4) {
            int block = blocks[(batch * S + pos) * K + rank / 4];
            if (block >= 0 && block < N / 4 && block * 4 + 3 <= absolute)
                index = block * 4 + rank % 4;
        } else index = own + rank - K * 4;
    }
    float dot = 0.0f;
    if (index >= 0 && index < N) {
        for (uint d = 0; d < 8; ++d)
            dot += q[d] * float(key[kvbase + index * 256 + d * 32 + lane]);
    }
    dot = simd_sum(dot);
    if (lane == 0) {
        keys[group] = index;
        scores[group] = index >= 0 && index < N ? float(InT(dot)) : -INFINITY;
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
    float nextMax = maximum;
    for (uint i = 0; i < 8; ++i) nextMax = max(nextMax, scores[i]);
    // Entirely invisible groups are possible before the own tail.
    if (nextMax != -INFINITY) {
        float correction = maximum == -INFINITY ? 0.0f : exp(maximum - nextMax);
        accumulated *= correction;
        denominator *= correction;
        for (uint i = 0; i < 8; ++i) {
            if (keys[i] >= 0 && keys[i] < N) {
                float weight = exp(scores[i] - nextMax);
                denominator += weight;
                accumulated += weight * float(value[kvbase + keys[i] * 256 + tid]);
            }
        }
        maximum = nextMax;
    }
    threadgroup_barrier(mem_flags::mem_threadgroup);
}
if (denominator == 0.0f) {
    // The pinned prefill fallback uses the finite dtype minimum
    // for masked scores. An entirely masked row is consequently
    // uniform over the full key domain, not a zero/NaN output.
    float weight = float(InT(1.0f / float(N)));
    for (int index = 0; index < N; ++index)
        accumulated += weight * float(value[kvbase + index * 256 + tid]);
    output[row * 256 + tid] = InT(accumulated);
} else output[row * 256 + tid] = InT(accumulated / denominator);

```

## .build/optimization/selected-attention-component-performance-v36/selected_attention_probe.py

SHA-256 `e4e5a4a4980f4f20dddca7c8a7633c3d4b66dfc2034a4a83f1b791e3f5497328`; 6029 bytes.

```
#!/usr/bin/env python3
"""Fixed-input D256 kernel experiment extracted from a frozen source archive.
This measures a component, never a request or an inference-quality result.
"""
import argparse
import hashlib
import importlib.metadata
import json
from pathlib import Path
import re
import shutil
import statistics
import tarfile
import textwrap
import time

import mlx.core as mx
import numpy as np
from prefill_bench import digest, preflight, vm_snapshot


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--candidate', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    args.out.mkdir(parents=True, exist_ok=False)
    version = importlib.metadata.version('mlx')
    if version != '0.31.1': raise ValueError('requires pinned MLX 0.31.1')
    identity = json.loads((args.candidate/'build-identity.json').read_text())
    archive = args.candidate/'build-source.tar.gz'
    if digest(archive) != identity['source_archive_sha256']: raise ValueError('source archive identity mismatch')
    name = 'Sources/Slotstream/SelectedAttention.swift'
    with tarfile.open(archive) as tar: swift = tar.extractfile(name).read()
    if hashlib.sha256(swift).hexdigest() != identity['source'][name]: raise ValueError('kernel source identity mismatch')
    source = textwrap.dedent(re.search(r'source: """(.*?)"""', swift.decode(), re.S).group(1))
    (args.out/'SelectedAttention.swift').write_bytes(swift)
    (args.out/'kernel.metal').write_text(source)
    shutil.copy2(__file__, args.out/Path(__file__).name)
    record = {'classification': 'fixed-input exploratory component performance only', 'identity': identity,
              'mlx': version, 'probe_sha256': digest(Path(__file__)), 'shapes': [],
              'contract': 'Five interleaved AB/BA rounds, five completed calls per arm, two warmups. Fixed BF16 B1 H24 HK2 D256 inputs. Any global swap excludes a whole pair; no replacement. Observe MLX allocator peak separately from process footprint. This cannot establish request benefit, energy, tail latency or model quality.'}
    mx.set_cache_limit(128 << 20)
    kernel = mx.fast.metal_kernel(name='slotstream_selected_attention_frozen_probe',
        input_names=['query', 'key', 'value', 'blocks', 'metadata'], output_names=['output'], source=source)
    rng = np.random.default_rng(26090515)
    try:
        record['before'] = preflight(7)
        for s, n, sparse in [(256, 256, False), (256, 2048, False), (256, 8192, True)]:
            q = mx.array(rng.standard_normal((1, 24, s, 256)).astype(np.float32)).astype(mx.bfloat16)
            k = mx.array(rng.standard_normal((1, 2, n, 256)).astype(np.float32)).astype(mx.bfloat16)
            v = mx.array(rng.standard_normal((1, 2, n, 256)).astype(np.float32)).astype(mx.bfloat16)
            base = n-s
            mask = np.zeros((1, 1, s, n), dtype=np.bool_)
            if sparse:
                ids = np.stack([rng.choice(n//4, 512, replace=False) for _ in range(s)]).astype(np.int32)
                for row in range(s):
                    for block in ids[row]:
                        if block*4+3 <= base+row: mask[0, 0, row, block*4:block*4+4] = True
                    own = ((base+row+1)//4)*4
                    mask[0, 0, row, own:base+row+1] = True
                blocks = mx.array(ids[None])
            else:
                for row in range(s): mask[0, 0, row, :base+row+1] = True
                blocks = mx.array([0], dtype=mx.int32)
            array_mask = mx.array(mask)
            metadata = mx.array([s, n, 24, 2, base, 512 if sparse else 0], dtype=mx.int32)
            mx.eval(q, k, v, blocks, metadata, array_mask)
            input_hashes = [hashlib.sha256(np.array(x.astype(mx.float32)).tobytes()).hexdigest() for x in [q,k,v]]
            def run(candidate):
                if not candidate:
                    return mx.fast.scaled_dot_product_attention(q, k, v, scale=1/16,
                        mask=array_mask if sparse else 'causal')
                return kernel(inputs=[q,k,v,blocks,metadata], template=[('InT', mx.bfloat16)],
                    grid=(q.size,1,1), threadgroup=(256,1,1), output_shapes=[q.shape], output_dtypes=[q.dtype])[0]
            for candidate in [False, True]:
                for _ in range(2): mx.eval(run(candidate))
            rounds = []
            for r in range(5):
                cells = []
                for candidate in [False, True] if r%2 == 0 else [True, False]:
                    before = vm_snapshot(); mx.reset_peak_memory(); start = time.monotonic()
                    for _ in range(5): mx.eval(run(candidate))
                    elapsed = (time.monotonic()-start)/5
                    after = vm_snapshot()
                    cells.append({'candidate':candidate, 'seconds':elapsed,
                        'mlx_peak_bytes':max(mx.get_peak_memory(),mx.get_active_memory()),
                        'swap_delta':{key:after[key]-before[key] for key in ['swapins','swapouts']}})
                valid = all(not any(c['swap_delta'].values()) for c in cells)
                by_arm = {c['candidate']:c for c in cells}
                rounds.append({'round':r+1,'cells':cells,'valid':valid,
                    'reduction':1-by_arm[True]['seconds']/by_arm[False]['seconds']})
            valid = [r['reduction'] for r in rounds if r['valid']]
            record['shapes'].append({'s':s,'n':n,'sparse':sparse,'input_sha256':input_hashes,
                'rounds':rounds,'valid_pairs':len(valid),'median_reduction':statistics.median(valid) if valid else None})
            (args.out/'result.json').write_text(json.dumps(record,indent=2)+'\n')
        record['completed'] = True
    finally:
        record['after'] = vm_snapshot()
        (args.out/'result.json').write_text(json.dumps(record,indent=2)+'\n')
    print(json.dumps([{k:v for k,v in row.items() if k not in ['rounds','input_sha256']} for row in record['shapes']]))


if __name__ == '__main__': main()

```

## .build/optimization/selected-attention-debug-v34.py

SHA-256 `bd20e284f8a0dee925ddb8ba9829574a72324f3d9198f8df2ba5bfa76ab2adcd`; 978 bytes.

```
import mlx.core as mx
from pathlib import Path
import re,textwrap,json
s=Path('Sources/Slotstream/SelectedAttention.swift').read_text()
source=textwrap.dedent(re.search(r'source: """(.*?)"""',s,re.S).group(1))
kernel=mx.fast.metal_kernel(name='slotstream_selected_attention_debug_v34',input_names=['query','key','value','blocks','metadata'],output_names=['output'],source=source)
records=[]
for dtype in [mx.bfloat16,mx.float32]:
 q=mx.zeros([1,2,9,256],dtype=dtype);k=mx.zeros([1,1,9,256],dtype=dtype);v=mx.ones([1,1,9,256],dtype=dtype)
 out=kernel(inputs=[q,k,v,mx.array(0,dtype=mx.int32),mx.array([9,9,2,1,0,0],dtype=mx.int32)],template=[('InT',dtype)],grid=(q.size,1,1),threadgroup=(256,1,1),output_shapes=[q.shape],output_dtypes=[dtype])[0]
 mx.eval(out)
 records.append({'dtype':str(dtype),'shape':out.shape,'rows':out[:,:, :,0].tolist(),'nonfinite':int((~mx.isfinite(out)).sum().item()),'min':out.min().item(),'max':out.max().item()})
print(json.dumps(records,indent=2))

```

## .build/optimization/selected-attention-debug-v35.py

SHA-256 `9e5b13268b4207c778ebd1186705a12ad3409aecec9ac8f609619158b87aa709`; 980 bytes.

```
import mlx.core as mx
from pathlib import Path
import re,textwrap,json
s=Path('Sources/Slotstream/SelectedAttention.swift').read_text()
source=textwrap.dedent(re.search(r'source: """(.*?)"""',s,re.S).group(1))
kernel=mx.fast.metal_kernel(name='slotstream_selected_attention_debug_v34',input_names=['query','key','value','blocks','metadata'],output_names=['output'],source=source)
records=[]
for dtype in [mx.bfloat16,mx.float32]:
 q=mx.zeros([1,2,9,256],dtype=dtype);k=mx.zeros([1,1,9,256],dtype=dtype);v=mx.ones([1,1,9,256],dtype=dtype)
 out=kernel(inputs=[q,k,v,mx.array([0],dtype=mx.int32),mx.array([9,9,2,1,0,0],dtype=mx.int32)],template=[('InT',dtype)],grid=(q.size,1,1),threadgroup=(256,1,1),output_shapes=[q.shape],output_dtypes=[dtype])[0]
 mx.eval(out)
 records.append({'dtype':str(dtype),'shape':out.shape,'rows':out[:,:, :,0].tolist(),'nonfinite':int((~mx.isfinite(out)).sum().item()),'min':out.min().item(),'max':out.max().item()})
print(json.dumps(records,indent=2))

```

## .build/optimization/selected-attention-masked-debug-v35.py

SHA-256 `ab7841247294307006899724310141dcfc542a1c4b1ad16417b54249962db5e8`; 1231 bytes.

```
import mlx.core as mx
from pathlib import Path
import re,textwrap,json
s=Path('Sources/Slotstream/SelectedAttention.swift').read_text()
source=textwrap.dedent(re.search(r'source: """(.*?)"""',s,re.S).group(1))
kernel=mx.fast.metal_kernel(name='slotstream_selected_attention_debug_v34',input_names=['query','key','value','blocks','metadata'],output_names=['output'],source=source)
records=[]
for dtype in [mx.bfloat16,mx.float32]:
 q=mx.zeros([1,2,9,256],dtype=dtype);k=mx.zeros([1,1,32,256],dtype=dtype)
 v=mx.array([float(i%131)/64 for i in range(32*256)]).reshape(1,1,32,256).astype(dtype)
 ids=mx.full((1,9,1),8,dtype=mx.int32)
 mask=mx.array([[((r+1)//4)*4<=i<=r for i in range(32)] for r in range(9)])[None,None]
 out=kernel(inputs=[q,k,v,ids,mx.array([9,32,2,1,0,1],dtype=mx.int32)],template=[('InT',dtype)],grid=(q.size,1,1),threadgroup=(256,1,1),output_shapes=[q.shape],output_dtypes=[dtype])[0]
 ref=mx.fast.scaled_dot_product_attention(q,k,v,scale=1/16,mask=mask)
 mx.eval(out,ref)
 records.append({'dtype':str(dtype),'delta':mx.abs(out.astype(mx.float32)-ref.astype(mx.float32)).max().item(),'rows':out[:,:,:,0].tolist(),'ref':ref[:,:,:,0].tolist(),'nan':mx.isnan(out).sum().item()})
print(json.dumps(records,indent=2))

```

## .build/optimization/selected-attention-debug-v34.json

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```

## .build/optimization/selected-attention-debug-v35.json

SHA-256 `e8a48d1811bafa59aba0a758d057ee2e6a78fbb1882b9ccfab1b1eec538928fa`; 1000 bytes.

```
[
  {
    "dtype": "mlx.core.bfloat16",
    "shape": [
      1,
      2,
      9,
      256
    ],
    "rows": [
      [
        [
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0
        ],
        [
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0
        ]
      ]
    ],
    "nonfinite": 0,
    "min": 1.0,
    "max": 1.0
  },
  {
    "dtype": "mlx.core.float32",
    "shape": [
      1,
      2,
      9,
      256
    ],
    "rows": [
      [
        [
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0
        ],
        [
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0
        ]
      ]
    ],
    "nonfinite": 0,
    "min": 1.0,
    "max": 1.0
  }
]

```

## .build/optimization/selected-attention-masked-debug-v35.json

SHA-256 `a24e94c8f9a42976a8cd25604648b05a0a54f8717e6ec368221de1841a139016`; 1955 bytes.

```
[
  {
    "dtype": "mlx.core.bfloat16",
    "delta": 0.0,
    "rows": [
      [
        [
          0.0,
          0.9765625,
          1.2734375,
          1.171875,
          1.671875,
          1.625,
          1.578125,
          1.171875,
          1.296875
        ],
        [
          0.0,
          0.9765625,
          1.2734375,
          1.171875,
          1.671875,
          1.625,
          1.578125,
          1.171875,
          1.296875
        ]
      ]
    ],
    "ref": [
      [
        [
          0.0,
          0.9765625,
          1.2734375,
          1.171875,
          1.671875,
          1.625,
          1.578125,
          1.171875,
          1.296875
        ],
        [
          0.0,
          0.9765625,
          1.2734375,
          1.171875,
          1.671875,
          1.625,
          1.578125,
          1.171875,
          1.296875
        ]
      ]
    ],
    "nan": 0
  },
  {
    "dtype": "mlx.core.float32",
    "delta": 0.0004730224609375,
    "rows": [
      [
        [
          0.0,
          0.9765625,
          1.2708333730697632,
          1.16943359375,
          1.671875,
          1.625,
          1.578125,
          1.16943359375,
          1.296875
        ],
        [
          0.0,
          0.9765625,
          1.2708333730697632,
          1.16943359375,
          1.671875,
          1.625,
          1.578125,
          1.16943359375,
          1.296875
        ]
      ]
    ],
    "ref": [
      [
        [
          0.0,
          0.9765625,
          1.2705230712890625,
          1.16943359375,
          1.671875,
          1.625,
          1.5777397155761719,
          1.16943359375,
          1.296875
        ],
        [
          0.0,
          0.9765625,
          1.2705230712890625,
          1.16943359375,
          1.671875,
          1.625,
          1.5777397155761719,
          1.16943359375,
          1.296875
        ]
      ]
    ],
    "nan": 0
  }
]

```

## .build/optimization/selected-attention-debug-v34.stderr

SHA-256 `b3df639f412f2cb22cebd4ea16d053f816621edb7dfb1004c7cf017a207bd43c`; 476 bytes.

```
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/.build/optimization/selected-attention-debug-v34.py", line 11, in <module>
    mx.eval(out)
RuntimeError: [metal::Device] Unable to build metal library from source
mlx/backend/metal/kernels/utils.h:476:31: error: subscripted value is not an array, pointer, or vector
            int block = blocks[(batch * S + pos) * K + rank / 4];
                        ~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



```

## .build/optimization/selected-attention-debug-v35.stderr

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

```

```
