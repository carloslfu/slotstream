---
type: run
id: 01m225emmmd4vnc4ayp5mjksvg
created: 2026-09-09T04:05:10.419958+00:00
updated: 2026-09-09T04:05:10.928147+00:00
summary: Current automatic-scope candidate passes original ordinary and MTP integrations
binary: /Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream
captured_at: 2026-09-08
command: V444 run.py native --name combined-plain; then combined-mtp, each with full900-second work plus30-second cleanup
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Current automatic-scope candidate passes original ordinary and MTP integrations
tool: Slotstream exact native and source qualification capture
---
On exact V436, the original ordinary integration passes286assertions in249.793905417seconds and fixed-MTP integration passes327assertions in295.050282459seconds. Exact binary/source/Metal/driver proofs and full cleanup pass for both. No new swap-outs occurred; native policy separately records swap-ins and is not performance evidence. These are current native correctness passes, not a final serving/default qualification. The recovery case has not started because its preflight observed non-nominal conditions. The prior consumed pressure cases stay preserved.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-mtp/attempt.json",
    "bytes": 23160,
    "sha256": "b9e995e1ad9a637f23e9a1964f9d6096f36552ba37e58ee73ca70c7d8a5c59da"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-mtp/memory.json",
    "bytes": 278867,
    "sha256": "9192dafc2a1a44d817f4a1b9f8c3e6d4be1654f5b47a5e989489c5dd41cac41b"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-mtp/memory.samples.jsonl",
    "bytes": 212459,
    "sha256": "74b3408d8c47126e38a50976d752548a113af2fd875d9afd0a9686e814bdd79b"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-mtp/qualification.json",
    "bytes": 2544,
    "sha256": "1fd5e855b9f68a3878f529ad0d8330dd07ad74fd3ec1458efc18ae57d77b6f0f"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-mtp/receipt.json",
    "bytes": 2446,
    "sha256": "aabc46da26824d3a6fa72fac341786e7376452b6cc5131ffa35b3118735ba997"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-mtp/stderr.txt",
    "bytes": 486,
    "sha256": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-mtp/stdout.txt",
    "bytes": 33531,
    "sha256": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-plain/attempt.json",
    "bytes": 23156,
    "sha256": "c530d0c0d169df0ddfcf9869c2d69d7dbb2cf7a43b9596d0edddd601c02af6cf"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-plain/memory.json",
    "bytes": 241757,
    "sha256": "7500014bd321e0e6a73a21f2f0a997eb9ea840794d555e9133e5bed44c12c168"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-plain/memory.samples.jsonl",
    "bytes": 183442,
    "sha256": "d30893bfa606f2e1c5b20eb71add8fd82167270629e8c4565da31fbe2c1a7b85"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-plain/qualification.json",
    "bytes": 2544,
    "sha256": "87c4100cf32c6d43f3f3357f07b9cb7966bef321986749b9becd4ed722c6f0dd"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-plain/receipt.json",
    "bytes": 2446,
    "sha256": "0ecd081160a21b14a869ecee5d096dfb586a9953a10ba66da2c5e8a7d7756946"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-plain/stderr.txt",
    "bytes": 486,
    "sha256": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-plain/stdout.txt",
    "bytes": 29460,
    "sha256": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-native-v444/preparation.json",
    "bytes": 25195,
    "sha256": "dd06ee5e063c0d41b14bb498d30db23a6afe09522a56ad9c8d0ca24d87c6c52d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-native-v444/run.py",
    "bytes": 9062,
    "sha256": "87385ce367a4bbe1bc43e8756c8e3ec68232c640f794d9ae6fd5d5a89d94729d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-native-v444/source-binding-review.json",
    "bytes": 403,
    "sha256": "317fc372a9eeed53dee115338acdd89af8c03c35d9d0acf63252a5b6a9430272"
  }
]
```

## Artifact SHA-256 b9e995e1ad9a637f23e9a1964f9d6096f36552ba37e58ee73ca70c7d8a5c59da

Encoding: `utf-8`. Original bytes: 23160.

````````````text
{
  "started_at": "2026-09-09T03:57:46.955665+00:00",
  "deadline_utc": "2026-09-09T04:30:00Z",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated-mtp",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "09f19ca477799aa70abbaf1aff6d6d956e4b9e5f126bd08d24a171b9c4e7d1a7",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
        "Sources/Slotstream/MTP.swift": "10b63deee430c1e1d5792221f128bea0a6158161911676679665a168116cf743",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
        "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
        "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
        "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "3073de4167c10667101cf3e46e332632b38303d94b50896d3e4c05dd3eafafd3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "236415bb0c4650ee8ea5c2c906157cd3e736ebeb718a68f59ca6da4e03ce64cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
        "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
        "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
        "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "1f8ee35ea3c3a8551b8b9cede882e27798cf06667ae93fe1138a5441fc91d3c1",
      "binary_sha256": "d626d992404099949e57114c3520dc3bf6ca4aef9d6b5860e0b99f4113256b1f",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31814336512,
    "swapins": 44352209,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   426901.\nPages active:                                 968731.\nPages inactive:                               790999.\nPages speculative:                            182784.\nPages throttled:                                   0.\nPages wired down:                             279439.\nPages purgeable:                                4342.\n\"Translation faults\":                    18079419833.\nPages copy-on-write:                       990848976.\nPages zero filled:                       25864277934.\nPages reactivated:                        4942873278.\nPages purged:                               94025904.\nFile-backed pages:                           1510550.\nAnonymous pages:                              431964.\nPages stored in compressor:                  1032079.\nPages occupied by compressor:                 435948.\nDecompressions:                           1460486687.\nCompressions:                             1800036699.\nPageins:                                  9232471416.\nPageouts:                                   11598614.\nSwapins:                                    44352209.\nSwapouts:                                   77895019.\nPages tagged:                                 165805.\nPages tagged resident:                        125749.\nPages tagged compressed:                       40056.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7121.\nPages tag-storage free:                          916.\nPages tag-storage non-tag pageable:            90259.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6834560.\nTagged compressions:                        14659902.\nTagged decompressions:                      13612278.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T03:57:46.955541+00:00",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "ready": true,
    "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
  },
  "policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 10000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 900,
    "stop_on_new_swapouts": false
  },
  "preparation_sha256": "dd06ee5e063c0d41b14bb498d30db23a6afe09522a56ad9c8d0ca24d87c6c52d",
  "classification": "Exact V436 automatic scope/local options and atomic fallback integration, preserving all three original V405 integrated workloads; the four scope workloads use separate V439 with their original scope-native envelope, original assertion minima (raised only by new cache-restoration checks), fixed MTP verification, workspace1024/frontier1 and full 900/1800-second work allowances plus30-second cleanup. All native runs use stricter22.2GB admission and the original live guard plus V341 failure-footprint observer. Native correctness only: no timing qualification, final composition selection or activation."
}

````````````

## Artifact SHA-256 9192dafc2a1a44d817f4a1b9f8c3e6d4be1654f5b47a5e989489c5dd41cac41b

Encoding: `gzip+base64`. Original bytes: 278867.

````````````text
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
````````````

## Artifact SHA-256 74b3408d8c47126e38a50976d752548a113af2fd875d9afd0a9686e814bdd79b

Encoding: `gzip+base64`. Original bytes: 212459.

````````````text
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
````````````

## Artifact SHA-256 1fd5e855b9f68a3878f529ad0d8330dd07ad74fd3ec1458efc18ae57d77b6f0f

Encoding: `utf-8`. Original bytes: 2544.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "b9e995e1ad9a637f23e9a1964f9d6096f36552ba37e58ee73ca70c7d8a5c59da",
  "exit_code": 0,
  "assertions": 327,
  "elapsed_seconds": 295.050282459,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31705464832,
    "swapins": 44352272,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   582288.\nPages active:                                 900874.\nPages inactive:                               728012.\nPages speculative:                            166070.\nPages throttled:                                   0.\nPages wired down:                             262446.\nPages purgeable:                                4485.\n\"Translation faults\":                    18087306561.\nPages copy-on-write:                       991641935.\nPages zero filled:                       25914510099.\nPages reactivated:                        4946181268.\nPages purged:                               94260527.\nFile-backed pages:                           1348375.\nAnonymous pages:                              446581.\nPages stored in compressor:                  1045515.\nPages occupied by compressor:                 442191.\nDecompressions:                           1461087032.\nCompressions:                             1800736275.\nPageins:                                  9234893168.\nPageouts:                                   11599685.\nSwapins:                                    44352272.\nSwapouts:                                   77895019.\nPages tagged:                                 166226.\nPages tagged resident:                        125060.\nPages tagged compressed:                       41166.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7099.\nPages tag-storage free:                         3418.\nPages tag-storage non-tag pageable:            87779.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7085184.\nTagged compressions:                        14672257.\nTagged decompressions:                      13623202.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e",
  "execution_receipt_sha256": "aabc46da26824d3a6fa72fac341786e7376452b6cc5131ffa35b3118735ba997"
}

````````````

## Artifact SHA-256 aabc46da26824d3a6fa72fac341786e7376452b6cc5131ffa35b3118735ba997

Encoding: `utf-8`. Original bytes: 2446.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "b9e995e1ad9a637f23e9a1964f9d6096f36552ba37e58ee73ca70c7d8a5c59da",
  "exit_code": 0,
  "assertions": 327,
  "elapsed_seconds": 295.050282459,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31705464832,
    "swapins": 44352272,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   582288.\nPages active:                                 900874.\nPages inactive:                               728012.\nPages speculative:                            166070.\nPages throttled:                                   0.\nPages wired down:                             262446.\nPages purgeable:                                4485.\n\"Translation faults\":                    18087306561.\nPages copy-on-write:                       991641935.\nPages zero filled:                       25914510099.\nPages reactivated:                        4946181268.\nPages purged:                               94260527.\nFile-backed pages:                           1348375.\nAnonymous pages:                              446581.\nPages stored in compressor:                  1045515.\nPages occupied by compressor:                 442191.\nDecompressions:                           1461087032.\nCompressions:                             1800736275.\nPageins:                                  9234893168.\nPageouts:                                   11599685.\nSwapins:                                    44352272.\nSwapouts:                                   77895019.\nPages tagged:                                 166226.\nPages tagged resident:                        125060.\nPages tagged compressed:                       41166.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7099.\nPages tag-storage free:                         3418.\nPages tag-storage non-tag pageable:            87779.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7085184.\nTagged compressions:                        14672257.\nTagged decompressions:                      13623202.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e"
}

````````````

## Artifact SHA-256 ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6

Encoding: `utf-8`. Original bytes: 486.

````````````text
integrated reference / cached17
integrated reference / boundary255
integrated reference / boundary256
integrated reference / boundary257
integrated reference / long1025
integrated reference / image-before
integrated reference / image-crossing
integrated candidate / cached17
integrated candidate / boundary255
integrated candidate / boundary256
integrated candidate / boundary257
integrated candidate / long1025
integrated candidate / image-before
integrated candidate / image-crossing

````````````

## Artifact SHA-256 529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e

Encoding: `utf-8`. Original bytes: 33531.

````````````text
{
  "items" : [
    {
      "name" : "false: embedding selection",
      "passed" : true
    },
    {
      "name" : "false: original MTP verification shape selected",
      "passed" : true
    },
    {
      "name" : "false: invalid public offset rejected",
      "passed" : true
    },
    {
      "name" : "false: rejected offset leaves state unchanged",
      "passed" : true
    },
    {
      "name" : "false: invalid public offset rejected",
      "passed" : true
    },
    {
      "name" : "false: rejected offset leaves state unchanged",
      "passed" : true
    },
    {
      "name" : "false: invalid public offset rejected",
      "passed" : true
    },
    {
      "name" : "false: rejected offset leaves state unchanged",
      "passed" : true
    },
    {
      "name" : "false: empty public State rejected",
      "passed" : true
    },
    {
      "name" : "false: empty-state rejection is atomic",
      "passed" : true
    },
    {
      "name" : "false\/cached17: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/cached17: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/cached17: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/cached17: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/cached17: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/cached17: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/cached17: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/cached17: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/cached17: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/cached17: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/cached17: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/long1025: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/long1025: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/long1025: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/long1025: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/long1025: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/long1025: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/long1025: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/long1025: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/long1025: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/long1025: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/long1025: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/image-before: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/image-before: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/image-before: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/image-before: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/image-before: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/image-before: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/image-before: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/image-before: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/image-before: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/image-before: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/image-before: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7: sampled output completes",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7046029254386353130: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7046029254386353130: sampled output completes",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7046029254386353130: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7046029254386353130: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7: sampled output completes",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7046029254386353130: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7046029254386353130: sampled output completes",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7046029254386353130: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7046029254386353130: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "false: first retained request succeeds",
      "passed" : true
    },
    {
      "name" : "false\/same: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/same: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false: complete checkpoint is exercised",
      "passed" : true
    },
    {
      "name" : "false: complete hit is observed",
      "passed" : true
    },
    {
      "name" : "false: complete hit eliminates prefill",
      "passed" : true
    },
    {
      "name" : "false: same prompt repeats exactly",
      "passed" : true
    },
    {
      "name" : "false\/same: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "false\/auxiliary: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/auxiliary: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false\/auxiliary: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "false\/divergent: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/divergent: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false\/divergent: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "false\/same-after-auxiliary: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/same-after-auxiliary: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false\/same-after-auxiliary: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "false\/edited: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/edited: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false: edited prefix refuses prior state",
      "passed" : true
    },
    {
      "name" : "false\/edited: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "false: partial fallback succeeds",
      "passed" : true
    },
    {
      "name" : "false: edited tail uses the shorter checkpoint",
      "passed" : true
    },
    {
      "name" : "false: partial fallback is not a complete hit",
      "passed" : true
    },
    {
      "name" : "false: combined retention respects physical-state count",
      "passed" : true
    },
    {
      "name" : "false: callback cancellation releases request pins",
      "passed" : true
    },
    {
      "name" : "false: callback cancellation has no hidden output",
      "passed" : true
    },
    {
      "name" : "false: callback stops at two emissions",
      "passed" : true
    },
    {
      "name" : "false: cancellation preserves exact output prefix",
      "passed" : true
    },
    {
      "name" : "false: client cancellation is not a model error",
      "passed" : true
    },
    {
      "name" : "false: retry returns an idle pool",
      "passed" : true
    },
    {
      "name" : "false: retry after cancellation is exact",
      "passed" : true
    },
    {
      "name" : "false: prefix capacity stays bounded",
      "passed" : true
    },
    {
      "name" : "false: one-token request releases pins",
      "passed" : true
    },
    {
      "name" : "false: one-token request emits exactly one token",
      "passed" : true
    },
    {
      "name" : "false: two-token MTP request completes",
      "passed" : true
    },
    {
      "name" : "false: two-token MTP releases pins",
      "passed" : true
    },
    {
      "name" : "false: terminal draft work is explicit",
      "passed" : true
    },
    {
      "name" : "false: terminal target work is explicit",
      "passed" : true
    },
    {
      "name" : "false: terminal verification executes once",
      "passed" : true
    },
    {
      "name" : "false: terminal forward executes once",
      "passed" : true
    },
    {
      "name" : "false: bounded output preserves the longer greedy prefix",
      "passed" : true
    },
    {
      "name" : "false: immediate EOS succeeds without emitted output",
      "passed" : true
    },
    {
      "name" : "false: immediate EOS releases pins",
      "passed" : true
    },
    {
      "name" : "false: fused RoPE evaluated paths",
      "passed" : true
    },
    {
      "name" : "false: shared RoPE evaluated paths",
      "passed" : true
    },
    {
      "name" : "true: embedding selection",
      "passed" : true
    },
    {
      "name" : "true: original MTP verification shape selected",
      "passed" : true
    },
    {
      "name" : "true: invalid public offset rejected",
      "passed" : true
    },
    {
      "name" : "true: rejected offset leaves state unchanged",
      "passed" : true
    },
    {
      "name" : "true: invalid public offset rejected",
      "passed" : true
    },
    {
      "name" : "true: rejected offset leaves state unchanged",
      "passed" : true
    },
    {
      "name" : "true: invalid public offset rejected",
      "passed" : true
    },
    {
      "name" : "true: rejected offset leaves state unchanged",
      "passed" : true
    },
    {
      "name" : "true: empty public State rejected",
      "passed" : true
    },
    {
      "name" : "true: empty-state rejection is atomic",
      "passed" : true
    },
    {
      "name" : "true\/cached17: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/cached17: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/cached17: exact committed offset",
      "passed" : true
    },
    {
      "name" : "true\/cached17: head is aligned",
      "passed" : true
    },
    {
      "name" : "cached17: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/cached17: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/cached17: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/cached17: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/cached17: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/cached17: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/cached17: verification executes",
      "passed" : true
    },
    {
      "name" : "true\/cached17: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "cached17: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: exact committed offset",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: head is aligned",
      "passed" : true
    },
    {
      "name" : "boundary255: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: verification executes",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "boundary255: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: exact committed offset",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: head is aligned",
      "passed" : true
    },
    {
      "name" : "boundary256: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: verification executes",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "boundary256: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: exact committed offset",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: head is aligned",
      "passed" : true
    },
    {
      "name" : "boundary257: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: verification executes",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "boundary257: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/long1025: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/long1025: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/long1025: exact committed offset",
      "passed" : true
    },
    {
      "name" : "true\/long1025: head is aligned",
      "passed" : true
    },
    {
      "name" : "long1025: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/long1025: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/long1025: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/long1025: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/long1025: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/long1025: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/long1025: verification executes",
      "passed" : true
    },
    {
      "name" : "true\/long1025: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "long1025: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/image-before: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/image-before: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/image-before: exact committed offset",
      "passed" : true
    },
    {
      "name" : "true\/image-before: head is aligned",
      "passed" : true
    },
    {
      "name" : "image-before: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/image-before: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/image-before: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/image-before: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/image-before: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/image-before: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/image-before: verification executes",
      "passed" : true
    },
    {
      "name" : "true\/image-before: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "image-before: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: exact committed offset",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: head is aligned",
      "passed" : true
    },
    {
      "name" : "image-crossing: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: verification executes",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "image-crossing: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7: sampled output completes",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "sample\/false\/7: integrated sampled IDs match reference",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "sample\/false\/7: integrated sampled verification work matches reference",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7046029254386353130: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7046029254386353130: sampled output completes",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7046029254386353130: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "sample\/false\/7046029254386353130: integrated sampled IDs match reference",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7046029254386353130: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "sample\/false\/7046029254386353130: integrated sampled verification work matches reference",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7: sampled output completes",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "sample\/true\/7: integrated sampled IDs match reference",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "sample\/true\/7: integrated sampled verification work matches reference",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7046029254386353130: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7046029254386353130: sampled output completes",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7046029254386353130: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "sample\/true\/7046029254386353130: integrated sampled IDs match reference",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7046029254386353130: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "sample\/true\/7046029254386353130: integrated sampled verification work matches reference",
      "passed" : true
    },
    {
      "name" : "true: first retained request succeeds",
      "passed" : true
    },
    {
      "name" : "true\/same: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/same: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true: complete checkpoint is exercised",
      "passed" : true
    },
    {
      "name" : "true: complete hit is observed",
      "passed" : true
    },
    {
      "name" : "true: complete hit eliminates prefill",
      "passed" : true
    },
    {
      "name" : "true: same prompt repeats exactly",
      "passed" : true
    },
    {
      "name" : "true\/same: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "same: interleaved output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true\/auxiliary: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/auxiliary: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true\/auxiliary: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "auxiliary: interleaved output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true\/divergent: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/divergent: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true\/divergent: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "divergent: interleaved output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true\/same-after-auxiliary: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/same-after-auxiliary: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true\/same-after-auxiliary: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "same-after-auxiliary: interleaved output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true\/edited: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/edited: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true: edited prefix refuses prior state",
      "passed" : true
    },
    {
      "name" : "true\/edited: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "edited: interleaved output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true: partial fallback succeeds",
      "passed" : true
    },
    {
      "name" : "true: edited tail uses the shorter checkpoint",
      "passed" : true
    },
    {
      "name" : "true: partial fallback is not a complete hit",
      "passed" : true
    },
    {
      "name" : "true: combined retention respects physical-state count",
      "passed" : true
    },
    {
      "name" : "partial fallback output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true: callback cancellation releases request pins",
      "passed" : true
    },
    {
      "name" : "true: callback cancellation has no hidden output",
      "passed" : true
    },
    {
      "name" : "true: callback stops at two emissions",
      "passed" : true
    },
    {
      "name" : "true: cancellation preserves exact output prefix",
      "passed" : true
    },
    {
      "name" : "true: client cancellation is not a model error",
      "passed" : true
    },
    {
      "name" : "true: retry returns an idle pool",
      "passed" : true
    },
    {
      "name" : "true: retry after cancellation is exact",
      "passed" : true
    },
    {
      "name" : "true: prefix capacity stays bounded",
      "passed" : true
    },
    {
      "name" : "true: one-token request releases pins",
      "passed" : true
    },
    {
      "name" : "true: one-token request emits exactly one token",
      "passed" : true
    },
    {
      "name" : "true: two-token MTP request completes",
      "passed" : true
    },
    {
      "name" : "true: two-token MTP releases pins",
      "passed" : true
    },
    {
      "name" : "true: terminal draft work is explicit",
      "passed" : true
    },
    {
      "name" : "true: terminal target work is explicit",
      "passed" : true
    },
    {
      "name" : "true: terminal verification executes once",
      "passed" : true
    },
    {
      "name" : "true: terminal forward executes once",
      "passed" : true
    },
    {
      "name" : "true: bounded output preserves the longer greedy prefix",
      "passed" : true
    },
    {
      "name" : "two-token MTP integrated output matches reference",
      "passed" : true
    },
    {
      "name" : "true: immediate EOS succeeds without emitted output",
      "passed" : true
    },
    {
      "name" : "true: immediate EOS releases pins",
      "passed" : true
    },
    {
      "name" : "true: fused RoPE evaluated paths",
      "passed" : true
    },
    {
      "name" : "true: shared RoPE evaluated paths",
      "passed" : true
    }
  ],
  "measurements" : {
    "false.fused_rotations_scheduled" : 0,
    "true.fused_rotations_scheduled" : 5248
  },
  "name" : "optimization-integrated-mtp",
  "passed" : true
}

````````````

## Artifact SHA-256 c530d0c0d169df0ddfcf9869c2d69d7dbb2cf7a43b9596d0edddd601c02af6cf

Encoding: `utf-8`. Original bytes: 23156.

````````````text
{
  "started_at": "2026-09-09T03:53:05.481943+00:00",
  "deadline_utc": "2026-09-09T04:30:00Z",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "09f19ca477799aa70abbaf1aff6d6d956e4b9e5f126bd08d24a171b9c4e7d1a7",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
        "Sources/Slotstream/MTP.swift": "10b63deee430c1e1d5792221f128bea0a6158161911676679665a168116cf743",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
        "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
        "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
        "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "3073de4167c10667101cf3e46e332632b38303d94b50896d3e4c05dd3eafafd3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "236415bb0c4650ee8ea5c2c906157cd3e736ebeb718a68f59ca6da4e03ce64cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
        "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
        "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
        "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "1f8ee35ea3c3a8551b8b9cede882e27798cf06667ae93fe1138a5441fc91d3c1",
      "binary_sha256": "d626d992404099949e57114c3520dc3bf6ca4aef9d6b5860e0b99f4113256b1f",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29569335296,
    "swapins": 44352185,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   182109.\nPages active:                                1150984.\nPages inactive:                               861217.\nPages speculative:                            288785.\nPages throttled:                                   0.\nPages wired down:                             248058.\nPages purgeable:                               26642.\n\"Translation faults\":                    18069337309.\nPages copy-on-write:                       989698150.\nPages zero filled:                       25816452435.\nPages reactivated:                        4939161047.\nPages purged:                               93829978.\nFile-backed pages:                           1596018.\nAnonymous pages:                              704968.\nPages stored in compressor:                   856274.\nPages occupied by compressor:                 352071.\nDecompressions:                           1460134571.\nCompressions:                             1799446643.\nPageins:                                  9229817641.\nPageouts:                                   11597863.\nSwapins:                                    44352185.\nSwapouts:                                   77895019.\nPages tagged:                                 168570.\nPages tagged resident:                        137239.\nPages tagged compressed:                       31331.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7160.\nPages tag-storage free:                         2642.\nPages tag-storage non-tag pageable:            88494.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5363584.\nTagged compressions:                        14644225.\nTagged decompressions:                      13605467.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T03:53:05.481823+00:00",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "ready": true,
    "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
  },
  "policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 10000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 900,
    "stop_on_new_swapouts": false
  },
  "preparation_sha256": "dd06ee5e063c0d41b14bb498d30db23a6afe09522a56ad9c8d0ca24d87c6c52d",
  "classification": "Exact V436 automatic scope/local options and atomic fallback integration, preserving all three original V405 integrated workloads; the four scope workloads use separate V439 with their original scope-native envelope, original assertion minima (raised only by new cache-restoration checks), fixed MTP verification, workspace1024/frontier1 and full 900/1800-second work allowances plus30-second cleanup. All native runs use stricter22.2GB admission and the original live guard plus V341 failure-footprint observer. Native correctness only: no timing qualification, final composition selection or activation."
}

````````````

## Artifact SHA-256 7500014bd321e0e6a73a21f2f0a997eb9ea840794d555e9133e5bed44c12c168

Encoding: `gzip+base64`. Original bytes: 241757.

````````````text
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
````````````

## Artifact SHA-256 d30893bfa606f2e1c5b20eb71add8fd82167270629e8c4565da31fbe2c1a7b85

Encoding: `gzip+base64`. Original bytes: 183442.

````````````text
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
````````````

## Artifact SHA-256 87c4100cf32c6d43f3f3357f07b9cb7966bef321986749b9becd4ed722c6f0dd

Encoding: `utf-8`. Original bytes: 2544.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "c530d0c0d169df0ddfcf9869c2d69d7dbb2cf7a43b9596d0edddd601c02af6cf",
  "exit_code": 0,
  "assertions": 286,
  "elapsed_seconds": 249.793905417,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32061538304,
    "swapins": 44352201,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   476368.\nPages active:                                 947452.\nPages inactive:                               768903.\nPages speculative:                            177383.\nPages throttled:                                   0.\nPages wired down:                             273329.\nPages purgeable:                                 362.\n\"Translation faults\":                    18079012370.\nPages copy-on-write:                       990814166.\nPages zero filled:                       25863973747.\nPages reactivated:                        4942872926.\nPages purged:                               94025343.\nFile-backed pages:                           1480151.\nAnonymous pages:                              413587.\nPages stored in compressor:                  1038875.\nPages occupied by compressor:                 439324.\nDecompressions:                           1460480569.\nCompressions:                             1800036699.\nPageins:                                  9232446852.\nPageouts:                                   11598614.\nSwapins:                                    44352201.\nSwapouts:                                   77895019.\nPages tagged:                                 166030.\nPages tagged resident:                        125352.\nPages tagged compressed:                       40678.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7121.\nPages tag-storage free:                         2956.\nPages tag-storage non-tag pageable:            88219.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6954624.\nTagged compressions:                        14659902.\nTagged decompressions:                      13611673.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41",
  "execution_receipt_sha256": "0ecd081160a21b14a869ecee5d096dfb586a9953a10ba66da2c5e8a7d7756946"
}

````````````

## Artifact SHA-256 0ecd081160a21b14a869ecee5d096dfb586a9953a10ba66da2c5e8a7d7756946

Encoding: `utf-8`. Original bytes: 2446.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "c530d0c0d169df0ddfcf9869c2d69d7dbb2cf7a43b9596d0edddd601c02af6cf",
  "exit_code": 0,
  "assertions": 286,
  "elapsed_seconds": 249.793905417,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 32061538304,
    "swapins": 44352201,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   476368.\nPages active:                                 947452.\nPages inactive:                               768903.\nPages speculative:                            177383.\nPages throttled:                                   0.\nPages wired down:                             273329.\nPages purgeable:                                 362.\n\"Translation faults\":                    18079012370.\nPages copy-on-write:                       990814166.\nPages zero filled:                       25863973747.\nPages reactivated:                        4942872926.\nPages purged:                               94025343.\nFile-backed pages:                           1480151.\nAnonymous pages:                              413587.\nPages stored in compressor:                  1038875.\nPages occupied by compressor:                 439324.\nDecompressions:                           1460480569.\nCompressions:                             1800036699.\nPageins:                                  9232446852.\nPageouts:                                   11598614.\nSwapins:                                    44352201.\nSwapouts:                                   77895019.\nPages tagged:                                 166030.\nPages tagged resident:                        125352.\nPages tagged compressed:                       40678.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7121.\nPages tag-storage free:                         2956.\nPages tag-storage non-tag pageable:            88219.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6954624.\nTagged compressions:                        14659902.\nTagged decompressions:                      13611673.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41"
}

````````````

## Artifact SHA-256 afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41

Encoding: `utf-8`. Original bytes: 29460.

````````````text
{
  "items" : [
    {
      "name" : "false: embedding selection",
      "passed" : true
    },
    {
      "name" : "false: original MTP verification shape selected",
      "passed" : true
    },
    {
      "name" : "false: invalid public offset rejected",
      "passed" : true
    },
    {
      "name" : "false: rejected offset leaves state unchanged",
      "passed" : true
    },
    {
      "name" : "false: invalid public offset rejected",
      "passed" : true
    },
    {
      "name" : "false: rejected offset leaves state unchanged",
      "passed" : true
    },
    {
      "name" : "false: invalid public offset rejected",
      "passed" : true
    },
    {
      "name" : "false: rejected offset leaves state unchanged",
      "passed" : true
    },
    {
      "name" : "false: empty public State rejected",
      "passed" : true
    },
    {
      "name" : "false: empty-state rejection is atomic",
      "passed" : true
    },
    {
      "name" : "false\/cached17: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/cached17: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/cached17: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/cached17: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/cached17: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/cached17: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/cached17: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/cached17: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/cached17: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "false\/cached17: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/long1025: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/long1025: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/long1025: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/long1025: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/long1025: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/long1025: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/long1025: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/long1025: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/long1025: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "false\/long1025: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/image-before: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/image-before: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/image-before: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/image-before: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/image-before: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/image-before: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/image-before: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/image-before: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/image-before: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "false\/image-before: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7: sampled output completes",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7046029254386353130: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7046029254386353130: sampled output completes",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7046029254386353130: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7: sampled output completes",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7046029254386353130: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7046029254386353130: sampled output completes",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7046029254386353130: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "false: first retained request succeeds",
      "passed" : true
    },
    {
      "name" : "false\/same: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/same: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false: complete checkpoint is exercised",
      "passed" : true
    },
    {
      "name" : "false: complete hit is observed",
      "passed" : true
    },
    {
      "name" : "false: complete hit eliminates prefill",
      "passed" : true
    },
    {
      "name" : "false: same prompt repeats exactly",
      "passed" : true
    },
    {
      "name" : "false\/same: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "false\/auxiliary: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/auxiliary: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false\/auxiliary: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "false\/divergent: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/divergent: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false\/divergent: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "false\/same-after-auxiliary: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/same-after-auxiliary: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false\/same-after-auxiliary: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "false\/edited: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/edited: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false: edited prefix refuses prior state",
      "passed" : true
    },
    {
      "name" : "false\/edited: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "false: partial fallback succeeds",
      "passed" : true
    },
    {
      "name" : "false: edited tail uses the shorter checkpoint",
      "passed" : true
    },
    {
      "name" : "false: partial fallback is not a complete hit",
      "passed" : true
    },
    {
      "name" : "false: combined retention respects physical-state count",
      "passed" : true
    },
    {
      "name" : "false: callback cancellation releases request pins",
      "passed" : true
    },
    {
      "name" : "false: callback cancellation has no hidden output",
      "passed" : true
    },
    {
      "name" : "false: callback stops at two emissions",
      "passed" : true
    },
    {
      "name" : "false: cancellation preserves exact output prefix",
      "passed" : true
    },
    {
      "name" : "false: client cancellation is not a model error",
      "passed" : true
    },
    {
      "name" : "false: retry returns an idle pool",
      "passed" : true
    },
    {
      "name" : "false: retry after cancellation is exact",
      "passed" : true
    },
    {
      "name" : "false: prefix capacity stays bounded",
      "passed" : true
    },
    {
      "name" : "false: one-token request releases pins",
      "passed" : true
    },
    {
      "name" : "false: one-token request emits exactly one token",
      "passed" : true
    },
    {
      "name" : "false: immediate EOS succeeds without emitted output",
      "passed" : true
    },
    {
      "name" : "false: immediate EOS releases pins",
      "passed" : true
    },
    {
      "name" : "false: fused RoPE evaluated paths",
      "passed" : true
    },
    {
      "name" : "false: shared RoPE evaluated paths",
      "passed" : true
    },
    {
      "name" : "true: embedding selection",
      "passed" : true
    },
    {
      "name" : "true: original MTP verification shape selected",
      "passed" : true
    },
    {
      "name" : "true: invalid public offset rejected",
      "passed" : true
    },
    {
      "name" : "true: rejected offset leaves state unchanged",
      "passed" : true
    },
    {
      "name" : "true: invalid public offset rejected",
      "passed" : true
    },
    {
      "name" : "true: rejected offset leaves state unchanged",
      "passed" : true
    },
    {
      "name" : "true: invalid public offset rejected",
      "passed" : true
    },
    {
      "name" : "true: rejected offset leaves state unchanged",
      "passed" : true
    },
    {
      "name" : "true: empty public State rejected",
      "passed" : true
    },
    {
      "name" : "true: empty-state rejection is atomic",
      "passed" : true
    },
    {
      "name" : "true\/cached17: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/cached17: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/cached17: exact committed offset",
      "passed" : true
    },
    {
      "name" : "cached17: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/cached17: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/cached17: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/cached17: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/cached17: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/cached17: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/cached17: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "true\/cached17: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "cached17: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: exact committed offset",
      "passed" : true
    },
    {
      "name" : "boundary255: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "boundary255: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: exact committed offset",
      "passed" : true
    },
    {
      "name" : "boundary256: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "boundary256: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: exact committed offset",
      "passed" : true
    },
    {
      "name" : "boundary257: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "boundary257: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/long1025: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/long1025: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/long1025: exact committed offset",
      "passed" : true
    },
    {
      "name" : "long1025: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/long1025: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/long1025: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/long1025: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/long1025: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/long1025: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/long1025: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "true\/long1025: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "long1025: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/image-before: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/image-before: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/image-before: exact committed offset",
      "passed" : true
    },
    {
      "name" : "image-before: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/image-before: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/image-before: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/image-before: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/image-before: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/image-before: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/image-before: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "true\/image-before: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "image-before: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: cancelled prefill releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: exact committed offset",
      "passed" : true
    },
    {
      "name" : "image-crossing: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: final forward work is explicit",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "image-crossing: exact complete greedy IDs",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7: sampled output completes",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "sample\/false\/7: integrated sampled IDs match reference",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7046029254386353130: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7046029254386353130: sampled output completes",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7046029254386353130: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "sample\/false\/7046029254386353130: integrated sampled IDs match reference",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7: sampled output completes",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "sample\/true\/7: integrated sampled IDs match reference",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7046029254386353130: sampled requests return an idle pool",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7046029254386353130: sampled output completes",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7046029254386353130: seeded replay exact",
      "passed" : true
    },
    {
      "name" : "sample\/true\/7046029254386353130: integrated sampled IDs match reference",
      "passed" : true
    },
    {
      "name" : "true: first retained request succeeds",
      "passed" : true
    },
    {
      "name" : "true\/same: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/same: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true: complete checkpoint is exercised",
      "passed" : true
    },
    {
      "name" : "true: complete hit is observed",
      "passed" : true
    },
    {
      "name" : "true: complete hit eliminates prefill",
      "passed" : true
    },
    {
      "name" : "true: same prompt repeats exactly",
      "passed" : true
    },
    {
      "name" : "true\/same: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "same: interleaved output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true\/auxiliary: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/auxiliary: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true\/auxiliary: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "auxiliary: interleaved output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true\/divergent: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/divergent: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true\/divergent: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "divergent: interleaved output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true\/same-after-auxiliary: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/same-after-auxiliary: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true\/same-after-auxiliary: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "same-after-auxiliary: interleaved output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true\/edited: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/edited: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true: edited prefix refuses prior state",
      "passed" : true
    },
    {
      "name" : "true\/edited: no invalid checkpoint published",
      "passed" : true
    },
    {
      "name" : "edited: interleaved output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true: partial fallback succeeds",
      "passed" : true
    },
    {
      "name" : "true: edited tail uses the shorter checkpoint",
      "passed" : true
    },
    {
      "name" : "true: partial fallback is not a complete hit",
      "passed" : true
    },
    {
      "name" : "true: combined retention respects physical-state count",
      "passed" : true
    },
    {
      "name" : "partial fallback output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true: callback cancellation releases request pins",
      "passed" : true
    },
    {
      "name" : "true: callback cancellation has no hidden output",
      "passed" : true
    },
    {
      "name" : "true: callback stops at two emissions",
      "passed" : true
    },
    {
      "name" : "true: cancellation preserves exact output prefix",
      "passed" : true
    },
    {
      "name" : "true: client cancellation is not a model error",
      "passed" : true
    },
    {
      "name" : "true: retry returns an idle pool",
      "passed" : true
    },
    {
      "name" : "true: retry after cancellation is exact",
      "passed" : true
    },
    {
      "name" : "true: prefix capacity stays bounded",
      "passed" : true
    },
    {
      "name" : "true: one-token request releases pins",
      "passed" : true
    },
    {
      "name" : "true: one-token request emits exactly one token",
      "passed" : true
    },
    {
      "name" : "true: immediate EOS succeeds without emitted output",
      "passed" : true
    },
    {
      "name" : "true: immediate EOS releases pins",
      "passed" : true
    },
    {
      "name" : "true: fused RoPE evaluated paths",
      "passed" : true
    },
    {
      "name" : "true: shared RoPE evaluated paths",
      "passed" : true
    }
  ],
  "measurements" : {
    "false.fused_rotations_scheduled" : 0,
    "true.fused_rotations_scheduled" : 5400
  },
  "name" : "optimization-integrated",
  "passed" : true
}

````````````

## Artifact SHA-256 dd06ee5e063c0d41b14bb498d30db23a6afe09522a56ad9c8d0ca24d87c6c52d

Encoding: `utf-8`. Original bytes: 25195.

````````````text
{
  "prepared_at": "2026-09-09T01:36:15.620840+00:00",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "e5082f0416f2d534a8a84a9f89fe1ed555f24bda661041e27bba9acd0282758d",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "c12d46bb51943700c05f7de0269574de2077a15d347a542f7bb229f47b0d4353",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "09f19ca477799aa70abbaf1aff6d6d956e4b9e5f126bd08d24a171b9c4e7d1a7",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
        "Sources/Slotstream/MTP.swift": "10b63deee430c1e1d5792221f128bea0a6158161911676679665a168116cf743",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
        "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
        "Sources/Slotstream/PlannerDevice.swift": "528cdf93cf0fe600b8c53a3eb828b9b1922ee4817fa100393a11d4e2714784f8",
        "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
        "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RequestControl.swift": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "325b2c29e6fc03f17c642d5a72eccf77eb5e3f82be1df1df4b910b65519fb00a",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "8d740b5437ef927435deaba810b2f1209443189386106a1c238221f2f616abd8",
        "Sources/Slotstream/Vision.swift": "38565f564bf8ba73d2dc87e2f1874fa6fda2652e094a324048bfa8cb1278a79e",
        "Sources/Slotstream/VisionAttention.swift": "83b1012cb0b3a2c22098f71515e3e853cf1ca3affb01cb667a8248e3c34c63a5",
        "Sources/Slotstream/VisionPrompt.swift": "61b90891a5ec9944406287fa73b4c0e5bdd29b4e3903dff345cbeb80638c6435",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "3073de4167c10667101cf3e46e332632b38303d94b50896d3e4c05dd3eafafd3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "51e505bd3279983263ad731133b2f1e20606387cf03ba360ffcb2fba34dd33a3",
        "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "983a071e562451dbc22cfe09b005d9c68af687c10e7d94802d7d3cb28af1c7cd",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "236415bb0c4650ee8ea5c2c906157cd3e736ebeb718a68f59ca6da4e03ce64cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "5de9452266e8e59da03b078990689554fc7a419a5cd8e5879cc68e2e277ea8cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "f84979a3da94bc5ac0cfeb5cc84b61af43716c5664cc71853085ffa1b116d325",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "be63108d11318a9469d26587ade08c79bf34274c61b847d752663d8ce007f9af",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "98ff2ba72838b5346d45ff18b87e43c2598a4ecf09a54b50c050150108a9fa03",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
        "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "f260bb03cdf9aea5bd4e02ba8742ee6063bcafa2d7b838f46f8916716d0e27b4",
        "Sources/slotstream-cli/MTPCommands.swift": "b33d034d2e61ac5351b1feb7ff0dee45bcc829988f30aef97aa5aa73252f693b",
        "Sources/slotstream-cli/OptimizationCommands.swift": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "1f8ee35ea3c3a8551b8b9cede882e27798cf06667ae93fe1138a5441fc91d3c1",
      "binary_sha256": "d626d992404099949e57114c3520dc3bf6ca4aef9d6b5860e0b99f4113256b1f",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "dependencies": {
    "/tmp/slotstream-optimization-execution/automatic-scope-integration-v435/preparation.json": "812adfe2182e4aefdb2ac7c0d80c8cd537bc2788782d50224954a30bb0b2dec5",
    "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-metadata-v438/manifest.json": "428e15b61a25cf635ec9b132d26dd38f5bbb966f1cda7a36a15fe8c828e70b71",
    "/tmp/slotstream-optimization-execution/optional-current-serving-v330/run.py": "5793aa8bcb3af55fb99c9da698475ee54272ee791ccef30141c94ba6c405b95f",
    "/tmp/slotstream-optimization-execution/pressure-footprint-v341/guard_with_footprint.py": "72836a3c6bc03366b6f546c21d1f32636f01373d29a49e2ae2246e5090a0f215",
    "/tmp/slotstream-optimization-execution/pressure-footprint-v341/pressure_footprint.py": "2ff6061c46f588979da498ea67e93b8e6f887a845b6daab2e115da72a367f73e",
    "/tmp/slotstream-optimization-execution/automatic-scope-build-v436/lease-result.json": "7dfedd13ce6b5cb0d552bf18cb74523400d8d7fb240f7421fdd186d6ad2828d3",
    "/tmp/slotstream-optimization-execution/automatic-scope-build-v436/protocol.json": "a0a194f3fbe98bfd06f80822b865235af5ae713e929e791823cf0098b4deb320",
    "/tmp/slotstream-optimization-execution/scope-buffer-cache-correction-v391/preparation.json": "7f7ab8715855a99f3fbd2077aef1df4b95e2b09d592901f76b9c6c59ff291e1e",
    "/tmp/slotstream-optimization-execution/scope-allocation-accounting-v401/preparation.json": "f383a7bcdeccc4d32baf4efd2d62522a2311d42e9771a0f726e54f709d100be2",
    "/Users/carlos/Projects/slotstream/Tools/optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "/Users/carlos/Projects/slotstream/Tools/optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "/Users/carlos/Projects/slotstream/Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "/Users/carlos/Projects/slotstream/Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "/Users/carlos/Projects/slotstream/Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "/Users/carlos/Projects/slotstream/Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "/Users/carlos/Projects/slotstream/Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "/Users/carlos/Projects/slotstream/Tools/thermal_readiness.py": "461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048"
  },
  "executor_sha256": "87385ce367a4bbe1bc43e8756c8e3ec68232c640f794d9ae6fd5d5a89d94729d",
  "native_specs": {
    "combined-plain": [
      "integrated",
      "optimization-integrated",
      286
    ],
    "combined-mtp": [
      "integrated-mtp",
      "optimization-integrated-mtp",
      327
    ],
    "read-failure-serving": [
      "read-failure-serving",
      "optimization-read-failure-serving",
      522
    ]
  },
  "commands": {
    "combined-plain": [
      "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "integrated",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ],
    "combined-mtp": [
      "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "integrated-mtp",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ],
    "read-failure-serving": [
      "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "read-failure-serving",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ]
  },
  "environment": {},
  "seconds": {
    "combined-plain": 900,
    "combined-mtp": 900,
    "read-failure-serving": 900
  },
  "policies": {
    "combined-plain": {
      "startup_reclaimable_bytes": 13000000000,
      "minimum_live_reclaimable_bytes": 3000000000,
      "maximum_owned_rss_bytes": 10000000000,
      "sample_interval_seconds": 0.2,
      "maximum_build_seconds": 900,
      "stop_on_new_swapouts": false
    },
    "combined-mtp": {
      "startup_reclaimable_bytes": 13000000000,
      "minimum_live_reclaimable_bytes": 3000000000,
      "maximum_owned_rss_bytes": 10000000000,
      "sample_interval_seconds": 0.2,
      "maximum_build_seconds": 900,
      "stop_on_new_swapouts": false
    },
    "read-failure-serving": {
      "startup_reclaimable_bytes": 13000000000,
      "minimum_live_reclaimable_bytes": 3000000000,
      "maximum_owned_rss_bytes": 10000000000,
      "sample_interval_seconds": 0.2,
      "maximum_build_seconds": 900,
      "stop_on_new_swapouts": false
    }
  },
  "classification": "Exact V436 automatic scope/local options and atomic fallback integration, preserving all three original V405 integrated workloads; the four scope workloads use separate V439 with their original scope-native envelope, original assertion minima (raised only by new cache-restoration checks), fixed MTP verification, workspace1024/frontier1 and full 900/1800-second work allowances plus30-second cleanup. All native runs use stricter22.2GB admission and the original live guard plus V341 failure-footprint observer. Native correctness only: no timing qualification, final composition selection or activation."
}

````````````

## Artifact SHA-256 87385ce367a4bbe1bc43e8756c8e3ec68232c640f794d9ae6fd5d5a89d94729d

Encoding: `utf-8`. Original bytes: 9062.

````````````text
"""Original complete native cases on the exact compiled scope-cache correction."""
from pathlib import Path
import argparse,datetime,fcntl,importlib.util,inspect,json,os,signal,sys,threading,time
ROOT=Path('/Users/carlos/Projects/slotstream');BASE=Path('/tmp/slotstream-optimization-execution');HERE=Path(__file__).resolve().parent
OUT=ROOT/'.build/optimization/automatic-scope-integration-native-v444'
sys.path.insert(0,str(ROOT/'Tools'));sys.path.insert(0,str(BASE/'pressure-footprint-v341'))
import optimization_campaign as c
import thermal_readiness
from optimization_readiness import pressure_snapshot,require_normal
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from guard_with_footprint import guarded_run
CORE=BASE/'optional-current-serving-v330/run.py'
spec=importlib.util.spec_from_file_location('original_execution',CORE);original=importlib.util.module_from_spec(spec);spec.loader.exec_module(original)
require,now,allowance,readiness=original.require,original.now,original.allowance,original.readiness
EXECUTE_SOURCE=inspect.getsource(original.execute)
exec(compile(EXECUTE_SOURCE,str(CORE)+'::execute','exec'),globals())
NATIVE={
 'combined-plain':('integrated','optimization-integrated',286),
 'combined-mtp':('integrated-mtp','optimization-integrated-mtp',327),
 'read-failure-serving':('read-failure-serving','optimization-read-failure-serving',522),
}
BINARY=ROOT/'.build/optimization/automatic-scope-build-v436/candidate/slotstream'
MODEL='/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit'
BUILD=BASE/'automatic-scope-build-v436'
SCOPE_ENV={'SLOTSTREAM_OPT_WORKSPACE_TILE':'1024','SLOTSTREAM_OPT_SCOPE_FRONTIER':'1'}
def seconds(name): return 1800 if name.startswith('scope-') else 900
def policy(name): return dict(c.NATIVE_POLICY,maximum_build_seconds=seconds(name))
def commands():
 result={}
 for name,item in NATIVE.items():
  command=[str(BINARY),'optimization-state-check','--variant',item[0]]
  if name.startswith('scope-family-'): command+=['--tokens',name.rsplit('-',1)[1]]
  command+=['--model',MODEL,'--json']
  if name.startswith('scope-'):command=['/usr/bin/env']+[k+'='+v for k,v in SCOPE_ENV.items()]+command
  result[name]=command
 return result
def dependencies():
 files=[BASE/'automatic-scope-integration-v435/preparation.json',ROOT/'.build/optimization/automatic-scope-metadata-v438/manifest.json',CORE,BASE/'pressure-footprint-v341/guard_with_footprint.py',BASE/'pressure-footprint-v341/pressure_footprint.py',BUILD/'lease-result.json',BUILD/'protocol.json',BASE/'scope-buffer-cache-correction-v391/preparation.json',BASE/'scope-allocation-accounting-v401/preparation.json']+[ROOT/'Tools'/x for x in c.DRIVERS+('thermal_readiness.py',)]
 return {str(p):digest(p) for p in files}
def prepare():
 require(not (HERE/'preparation.json').exists() and not OUT.exists(),'already prepared/attempted')
 build=verified_build(BINARY);lease=c.read(BUILD/'lease-result.json');protocol=c.read(BUILD/'protocol.json')
 require(lease['passed'] and lease['restored'],'build did not pass/restore')
 pure=c.read(ROOT/'.build/optimization/automatic-scope-metadata-v438/manifest.json')
 require(pure.get('passed') is True and pure['candidate']==build,'exact candidate pure/CLI tests must pass before native preparation')
 require(build['identity']['source']==protocol['candidate_source'],'compiled source differs from the corrected candidate')
 value={'prepared_at':now(),'build':build,'dependencies':dependencies(),'executor_sha256':digest(Path(__file__)),'native_specs':NATIVE,'commands':commands(),'environment':{},'seconds':{n:seconds(n) for n in NATIVE},'policies':{n:policy(n) for n in NATIVE},'classification':'Exact V436 automatic scope/local options and atomic fallback integration, preserving all three original V405 integrated workloads; the four scope workloads use separate V439 with their original scope-native envelope, original assertion minima (raised only by new cache-restoration checks), fixed MTP verification, workspace1024/frontier1 and full 900/1800-second work allowances plus30-second cleanup. All native runs use stricter22.2GB admission and the original live guard plus V341 failure-footprint observer. Native correctness only: no timing qualification, final composition selection or activation.'}
 c.write_new(HERE/'preparation.json',value)
 return {'prepared':True,'model_launched':False,'cases':list(NATIVE),'build_sha256':build['identity']['binary_sha256']}
def load():
 value=c.read(HERE/'preparation.json')
 require(value['executor_sha256']==digest(Path(__file__)) and value['dependencies']==dependencies(),'executor/dependencies changed')
 require(verified_build(BINARY)==value['build'],'binary/source/metal identity changed')
 require(value['native_specs']=={k:list(v) for k,v in NATIVE.items()} and value['seconds']=={n:seconds(n) for n in NATIVE} and value['policies']=={n:policy(n) for n in NATIVE},'native workload/policy changed')
 require(value['environment']=={} and value['commands']==commands(),'native commands changed')
 return value
def assess(name,report):
 items=report.get('items',[]);names={x['name'] for x in items}
 require(report.get('name')==NATIVE[name][1] and report.get('passed') is True and report.get('skipped') is None and len(items)>=NATIVE[name][2] and all(x.get('passed') is True for x in items),'complete native assertions absent or failing')
 if name.startswith('combined'):
  required={f'{arm}: original MTP verification shape selected' for arm in ['false','true']}
  required|={f'{arm}/{case}: {label}' for arm in ['false','true'] for case in ['cached17','boundary255','boundary256','boundary257','long1025','image-before','image-crossing'] for label in ['selected n-gram cache format','n-gram cache contains real rows','exact n-gram cache payload accounting']}
  if name=='combined-mtp':
   required|={f'{arm}: {label}' for arm in ['false','true'] for label in ['terminal draft work is explicit','terminal target work is explicit','terminal verification executes once','terminal forward executes once','bounded output preserves the longer greedy prefix']}
   required.add('two-token MTP integrated output matches reference')
  require(required<=names,'original full composition assertions missing')
 if name.startswith('scope-'):
  m=report.get('measurements',{});require(m.get('integrated_base')==1,'scope integrated base absent')
  if name.startswith('scope-family-'):
   tokens=int(name.rsplit('-',1)[1]);require(m.get('workspace_token_tile')==1024 and m.get('compact_scope_frontier')==1 and [m.get(f'arm{i}.chunk') for i in range(3)]==[256,512,min(4096,tokens)],'original scope geometry differs')
   require({'workspace allocation actually observed','workspace retains no disposable MLX buffers'}|{f'arm{i}: caller buffer-cache limit restored' for i in range(3)} <= names,'new cache behavior assertions absent')
  if name=='scope-mtp-vision':
   require({'direct scope cancellation restores buffer-cache limit','direct scope success restores buffer-cache limit','direct scope read error returned','direct scope read fault fired','direct scope error restores buffer-cache limit','direct scope read-error retry commits','direct scope read-error retry restores buffer-cache limit'} <= names,'direct checked lifecycle assertions absent')
 return {'passed':True,'completed':True,'qualified':True,'assertions':len(items)}
def run(name,deadline):
 allowance(deadline,seconds(name)+30);value=load();target=OUT/name
 require(not target.exists(),'attempted native cannot retry')
 limit,before,thermal=readiness(deadline,seconds(name)+30,22.2)
 attempt={'started_at':now(),'deadline_utc':deadline,'command':value['commands'][name],'environment':{},'build':value['build'],'before':before,'thermal_prelaunch':thermal,'policy':policy(name),'preparation_sha256':digest(HERE/'preparation.json'),'classification':value['classification']}
 def assessment(code):
  load();require(code==0,'native process failed');return assess(name,c.read(target/'stdout.txt'))
 result=execute(attempt['command'],target,seconds(name),policy(name),assessment,limit,attempt)
 result['execution_receipt_sha256']=digest(target/'receipt.json');c.write_new(target/'qualification.json',result)
 return result
def main():
 parser=argparse.ArgumentParser();parser.add_argument('action',choices=['prepare','check','native']);parser.add_argument('--name',choices=list(NATIVE));parser.add_argument('--deadline');args=parser.parse_args()
 with (HERE/'.run.lock').open('a') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
  if args.action=='prepare':result=prepare()
  elif args.action=='check':load();result={'passed':True,'unrun':[n for n in NATIVE if not (OUT/n).exists()]}
  else:require(args.name is not None and args.deadline is not None,'one named case/deadline required');result=run(args.name,args.deadline)
 print(json.dumps({k:v for k,v in result.items() if k not in ['before','after']},indent=2),flush=True)
 return 0 if args.action!='native' or result.get('qualified') else 1
if __name__=='__main__':raise SystemExit(main())

````````````

## Artifact SHA-256 317fc372a9eeed53dee115338acdd89af8c03c35d9d0acf63252a5b6a9430272

Encoding: `utf-8`. Original bytes: 403.

````````````text
{
  "original_sha256": "794f8bbbca67d09d53fdbdd1230a7065526d8828b58eaf1a6f6dd7f5a6a36b12",
  "executor_sha256": "87385ce367a4bbe1bc43e8756c8e3ec68232c640f794d9ae6fd5d5a89d94729d",
  "functions_byte_identical_to_original": [
    "seconds",
    "policy",
    "commands",
    "assess",
    "run"
  ],
  "original_workloads_guards_and_assessor_unchanged": true,
  "no_model_launched_by_preparation": true
}

````````````
