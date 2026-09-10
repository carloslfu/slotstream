---
type: run
id: 01m21x92pdn41f10byrsy9gaq7
created: 2026-09-09T01:42:19.597520+00:00
updated: 2026-09-09T01:42:19.905252+00:00
summary: Expanded automatic MTP native stops at macOS pressure level2 with no report; all processes drained
binary: /Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream
captured_at: 2026-09-08
command: python3 /tmp/slotstream-optimization-execution/automatic-scope-native-v439/run.py native --name scope-mtp-vision --deadline 2026-09-09T03:00:00Z
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Expanded automatic MTP native stops at macOS pressure level2 with no report; all processes drained
tool: Slotstream exact native and source qualification capture
---
Expanded original MTP/vision native on exactV436 stops after110.244883seconds at macOS pressure level2. No report or assertion count exists; not qualified. Original guards, source proofs and complete cleanup remain intact. This consumed case cannot resume or retry; no new speed or memory-saving claim. Both shorter original scope geometry families separately passed. After vision and both expanded native pressure stops, further model launches wait for a material live-resource change. The accompanying read-only app snapshot shows per-process OS memory charges, not unique physical RAM or guaranteed recoverable bytes.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-mtp-vision/attempt.json",
    "bytes": 23258,
    "sha256": "ed9ba3ee314a19f84d05c8f932a5e5d86c7fec7a6c3db94991ea1012527c649c"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-mtp-vision/memory.failure-footprint.json",
    "bytes": 914,
    "sha256": "bdafec2a92176c24c22ad799cbfa538d2a88ae76f7cc5e29e54352fd5aa885ad"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-mtp-vision/memory.json",
    "bytes": 107436,
    "sha256": "4752e4bc2c86f1a2f1a366718ce29600a1a81242b70d9241fe0706ad8d3da342"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-mtp-vision/memory.samples.jsonl",
    "bytes": 78166,
    "sha256": "1f0a6c3258c6e2a5d71b405dfb8965c7bb700861e324a999286e5acc727fb4de"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-mtp-vision/qualification.json",
    "bytes": 2613,
    "sha256": "dbdb7a98a569791034466d08f6ea127e3e31c710682f208ada25a968f9f60e37"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-mtp-vision/receipt.json",
    "bytes": 2515,
    "sha256": "3bfdb1876b8e9ea381c411e23f8f93044be71e4403091cba966bc8e7d87d7e42"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-mtp-vision/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-mtp-vision/stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/app-memory-snapshot-v445.json",
    "bytes": 44398,
    "sha256": "71a44263a7523decb9b7be4a0aa979c30cb1eeb893da0bbe0a2e3e6f051b980e"
  }
]
```

## Artifact SHA-256 ed9ba3ee314a19f84d05c8f932a5e5d86c7fec7a6c3db94991ea1012527c649c

Encoding: `utf-8`. Original bytes: 23258.

````````````text
{
  "started_at": "2026-09-09T01:38:27.881861+00:00",
  "deadline_utc": "2026-09-09T03:00:00Z",
  "command": [
    "/usr/bin/env",
    "SLOTSTREAM_OPT_WORKSPACE_TILE=1024",
    "SLOTSTREAM_OPT_SCOPE_FRONTIER=1",
    "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "scope-integrated-mtp-vision",
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
    "reclaimable_bytes": 23434313728,
    "swapins": 44233744,
    "swapouts": 77586649,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   344947.\nPages active:                                 764222.\nPages inactive:                               635919.\nPages speculative:                            126429.\nPages throttled:                                   0.\nPages wired down:                             259269.\nPages purgeable:                                8693.\n\"Translation faults\":                    17965807886.\nPages copy-on-write:                       981988129.\nPages zero filled:                       25570367414.\nPages reactivated:                        4834830199.\nPages purged:                               91700998.\nFile-backed pages:                           1076677.\nAnonymous pages:                              449893.\nPages stored in compressor:                  1882448.\nPages occupied by compressor:                 954642.\nDecompressions:                           1449805937.\nCompressions:                             1788483880.\nPageins:                                  9115605138.\nPageouts:                                   11584445.\nSwapins:                                    44233744.\nSwapouts:                                   77586649.\nPages tagged:                                 171470.\nPages tagged resident:                        116007.\nPages tagged compressed:                       55463.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7072.\nPages tag-storage free:                          500.\nPages tag-storage non-tag pageable:            90723.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                    9227136.\nTagged compressions:                        14503329.\nTagged decompressions:                      13451729.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T01:38:27.881740+00:00",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "ready": true,
    "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
  },
  "policy": {
    "startup_reclaimable_bytes": 20112000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17112000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1800,
    "stop_on_new_swapouts": false
  },
  "preparation_sha256": "812425a2899db09de616d4527ca56165fa4eb77b43bad2140abcec10a0309f6c",
  "classification": "Exact V436 build from V435 automatic scheduling/local options and V416/V419 memory guards. Retains all four original V404 cases, source-bound original assertion coverage, workspace1024/frontier1, 1800 seconds plus30 cleanup, original20.112GB startup/17.112GB owned/3GB live envelope and original guard policy. Expanded actual-Generator lifecycle and MTP cases must report all three planner geometries, both memory fallbacks, aligned4096 MTP prefill, and pass every assertion. Native correctness only; serving process-cap/benefit and complete final gates are separate. No default adoption."
}

````````````

## Artifact SHA-256 bdafec2a92176c24c22ad799cbfa538d2a88ae76f7cc5e29e54352fd5aa885ad

Encoding: `utf-8`. Original bytes: 914.

````````````text
{
  "original_error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
  "observation": {
    "at_utc": "2026-09-09T01:40:17.712632+00:00",
    "complete": true,
    "root_identity": {
      "pid": 8484,
      "start_abstime": 35301198220756
    },
    "processes": [
      {
        "pid": 8484,
        "start_abstime": 35301198220756,
        "exit_abstime": 0,
        "physical_footprint_bytes": 9059094848,
        "resident_size_bytes": 396886016
      }
    ],
    "classification": "Failure-time diagnostic only; not a sampled peak or admission/cleanup proof",
    "sum_process_footprints_bytes": 9059094848,
    "sum_process_resident_sizes_bytes": 396886016,
    "sum_scope": "Sum of OS charges to these processes; not unique system memory or free/reclaimable memory.",
    "elapsed_seconds": 0.0459167500000035
  },
  "original_failure_preserved": true
}

````````````

## Artifact SHA-256 4752e4bc2c86f1a2f1a366718ce29600a1a81242b70d9241fe0706ad8d3da342

Encoding: `gzip+base64`. Original bytes: 107436.

````````````text
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
````````````

## Artifact SHA-256 1f0a6c3258c6e2a5d71b405dfb8965c7bb700861e324a999286e5acc727fb4de

Encoding: `gzip+base64`. Original bytes: 78166.

````````````text
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
````````````

## Artifact SHA-256 dbdb7a98a569791034466d08f6ea127e3e31c710682f208ada25a968f9f60e37

Encoding: `utf-8`. Original bytes: 2613.

````````````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "ed9ba3ee314a19f84d05c8f932a5e5d86c7fec7a6c3db94991ea1012527c649c",
  "error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
  "elapsed_seconds": 110.244883,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 25446957056,
    "swapins": 44233744,
    "swapouts": 77586649,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   562873.\nPages active:                                 588550.\nPages inactive:                               483236.\nPages speculative:                            105757.\nPages throttled:                                   0.\nPages wired down:                             277141.\nPages purgeable:                                   2.\n\"Translation faults\":                    17969140582.\nPages copy-on-write:                       982292258.\nPages zero filled:                       25641406643.\nPages reactivated:                        4838430838.\nPages purged:                               91835543.\nFile-backed pages:                            990284.\nAnonymous pages:                              187259.\nPages stored in compressor:                  2120864.\nPages occupied by compressor:                1066636.\nDecompressions:                           1450812101.\nCompressions:                             1789987148.\nPageins:                                  9118277354.\nPageouts:                                   11585261.\nSwapins:                                    44233744.\nSwapouts:                                   77586649.\nPages tagged:                                 169869.\nPages tagged resident:                        109621.\nPages tagged compressed:                       60248.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7047.\nPages tag-storage free:                         1650.\nPages tag-storage non-tag pageable:            89599.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                   10221312.\nTagged compressions:                        14518313.\nTagged decompressions:                      13461532.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
  "execution_receipt_sha256": "3bfdb1876b8e9ea381c411e23f8f93044be71e4403091cba966bc8e7d87d7e42"
}

````````````

## Artifact SHA-256 3bfdb1876b8e9ea381c411e23f8f93044be71e4403091cba966bc8e7d87d7e42

Encoding: `utf-8`. Original bytes: 2515.

````````````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "ed9ba3ee314a19f84d05c8f932a5e5d86c7fec7a6c3db94991ea1012527c649c",
  "error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
  "elapsed_seconds": 110.244883,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 25446957056,
    "swapins": 44233744,
    "swapouts": 77586649,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   562873.\nPages active:                                 588550.\nPages inactive:                               483236.\nPages speculative:                            105757.\nPages throttled:                                   0.\nPages wired down:                             277141.\nPages purgeable:                                   2.\n\"Translation faults\":                    17969140582.\nPages copy-on-write:                       982292258.\nPages zero filled:                       25641406643.\nPages reactivated:                        4838430838.\nPages purged:                               91835543.\nFile-backed pages:                            990284.\nAnonymous pages:                              187259.\nPages stored in compressor:                  2120864.\nPages occupied by compressor:                1066636.\nDecompressions:                           1450812101.\nCompressions:                             1789987148.\nPageins:                                  9118277354.\nPageouts:                                   11585261.\nSwapins:                                    44233744.\nSwapouts:                                   77586649.\nPages tagged:                                 169869.\nPages tagged resident:                        109621.\nPages tagged compressed:                       60248.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7047.\nPages tag-storage free:                         1650.\nPages tag-storage non-tag pageable:            89599.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                   10221312.\nTagged compressions:                        14518313.\nTagged decompressions:                      13461532.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
}

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 71a44263a7523decb9b7be4a0aa979c30cb1eeb893da0bbe0a2e3e6f051b980e

Encoding: `utf-8`. Original bytes: 44398.

````````````text
{
  "observed_at": "2026-09-09T01:37:34.926422+00:00",
  "classification": "Read-only app accounting. Sums of OS per-process footprint charges include compressed memory and are not unique physical RAM or guaranteed reclaim on quit. No process stopped.",
  "summary": {
    "ChatGPT": {
      "processes": 160,
      "sum_os_footprint_gib": 8.68,
      "sum_resident_gib": 5.04
    },
    "Google Chrome": {
      "processes": 55,
      "sum_os_footprint_gib": 10.65,
      "sum_resident_gib": 8.19
    },
    "Wispr Flow": {
      "processes": 11,
      "sum_os_footprint_gib": 0.87,
      "sum_resident_gib": 0.9
    }
  },
  "errors": [],
  "processes": {
    "ChatGPT": [
      {
        "pid": 3523,
        "start_abstime": 34609819070249,
        "exit_abstime": 0,
        "physical_footprint_bytes": 25969768,
        "resident_size_bytes": 60293120
      },
      {
        "pid": 16075,
        "start_abstime": 32533634159989,
        "exit_abstime": 0,
        "physical_footprint_bytes": 37508736,
        "resident_size_bytes": 16908288
      },
      {
        "pid": 16076,
        "start_abstime": 32533634160713,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15763592,
        "resident_size_bytes": 16236544
      },
      {
        "pid": 16077,
        "start_abstime": 32533634160967,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13681720,
        "resident_size_bytes": 8257536
      },
      {
        "pid": 16099,
        "start_abstime": 32533635290542,
        "exit_abstime": 0,
        "physical_footprint_bytes": 11813800,
        "resident_size_bytes": 8257536
      },
      {
        "pid": 16205,
        "start_abstime": 32441164802008,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15747208,
        "resident_size_bytes": 16121856
      },
      {
        "pid": 16206,
        "start_abstime": 32441164804258,
        "exit_abstime": 0,
        "physical_footprint_bytes": 41178992,
        "resident_size_bytes": 16891904
      },
      {
        "pid": 16207,
        "start_abstime": 32441164802841,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13419576,
        "resident_size_bytes": 8224768
      },
      {
        "pid": 16236,
        "start_abstime": 32441165706639,
        "exit_abstime": 0,
        "physical_footprint_bytes": 12895288,
        "resident_size_bytes": 8224768
      },
      {
        "pid": 18211,
        "start_abstime": 34902049579458,
        "exit_abstime": 0,
        "physical_footprint_bytes": 123668064,
        "resident_size_bytes": 100237312
      },
      {
        "pid": 23489,
        "start_abstime": 31246663641105,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15747232,
        "resident_size_bytes": 6242304
      },
      {
        "pid": 23490,
        "start_abstime": 31246663642680,
        "exit_abstime": 0,
        "physical_footprint_bytes": 42227832,
        "resident_size_bytes": 6242304
      },
      {
        "pid": 23491,
        "start_abstime": 31246663643831,
        "exit_abstime": 0,
        "physical_footprint_bytes": 11781080,
        "resident_size_bytes": 5275648
      },
      {
        "pid": 23492,
        "start_abstime": 31246663658326,
        "exit_abstime": 0,
        "physical_footprint_bytes": 40622080,
        "resident_size_bytes": 6291456
      },
      {
        "pid": 23493,
        "start_abstime": 31246663659416,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14944320,
        "resident_size_bytes": 3981312
      },
      {
        "pid": 23494,
        "start_abstime": 31246663660301,
        "exit_abstime": 0,
        "physical_footprint_bytes": 11846544,
        "resident_size_bytes": 5275648
      },
      {
        "pid": 23495,
        "start_abstime": 31246664437827,
        "exit_abstime": 0,
        "physical_footprint_bytes": 11666344,
        "resident_size_bytes": 5275648
      },
      {
        "pid": 23496,
        "start_abstime": 31246664446821,
        "exit_abstime": 0,
        "physical_footprint_bytes": 11715472,
        "resident_size_bytes": 5275648
      },
      {
        "pid": 23666,
        "start_abstime": 32458909206622,
        "exit_abstime": 0,
        "physical_footprint_bytes": 40556304,
        "resident_size_bytes": 16777216
      },
      {
        "pid": 23668,
        "start_abstime": 32458909207175,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15648832,
        "resident_size_bytes": 16187392
      },
      {
        "pid": 23669,
        "start_abstime": 32458909211577,
        "exit_abstime": 0,
        "physical_footprint_bytes": 10699664,
        "resident_size_bytes": 8224768
      },
      {
        "pid": 23692,
        "start_abstime": 32458909892498,
        "exit_abstime": 0,
        "physical_footprint_bytes": 10486576,
        "resident_size_bytes": 8224768
      },
      {
        "pid": 25579,
        "start_abstime": 34728135017417,
        "exit_abstime": 0,
        "physical_footprint_bytes": 41834328,
        "resident_size_bytes": 16744448
      },
      {
        "pid": 25580,
        "start_abstime": 34728135018113,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15190056,
        "resident_size_bytes": 16121856
      },
      {
        "pid": 25581,
        "start_abstime": 34728135020550,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14665648,
        "resident_size_bytes": 14041088
      },
      {
        "pid": 25582,
        "start_abstime": 34728135019753,
        "exit_abstime": 0,
        "physical_footprint_bytes": 12846064,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25583,
        "start_abstime": 34728135101200,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15288360,
        "resident_size_bytes": 16154624
      },
      {
        "pid": 25584,
        "start_abstime": 34728135102276,
        "exit_abstime": 0,
        "physical_footprint_bytes": 39589648,
        "resident_size_bytes": 16826368
      },
      {
        "pid": 25585,
        "start_abstime": 34728135102881,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13517856,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25586,
        "start_abstime": 34728135103182,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15059008,
        "resident_size_bytes": 14041088
      },
      {
        "pid": 25587,
        "start_abstime": 34728135118455,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15812696,
        "resident_size_bytes": 17154048
      },
      {
        "pid": 25588,
        "start_abstime": 34728135122377,
        "exit_abstime": 0,
        "physical_footprint_bytes": 12862520,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25589,
        "start_abstime": 34728135126385,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14223208,
        "resident_size_bytes": 13975552
      },
      {
        "pid": 25590,
        "start_abstime": 34728135133951,
        "exit_abstime": 0,
        "physical_footprint_bytes": 39212792,
        "resident_size_bytes": 16842752
      },
      {
        "pid": 25591,
        "start_abstime": 34728135136593,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14321560,
        "resident_size_bytes": 13975552
      },
      {
        "pid": 25592,
        "start_abstime": 34728135137179,
        "exit_abstime": 0,
        "physical_footprint_bytes": 12583968,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25593,
        "start_abstime": 34728135137564,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14862400,
        "resident_size_bytes": 14041088
      },
      {
        "pid": 25594,
        "start_abstime": 34728135138324,
        "exit_abstime": 0,
        "physical_footprint_bytes": 40752888,
        "resident_size_bytes": 16711680
      },
      {
        "pid": 25595,
        "start_abstime": 34728135428184,
        "exit_abstime": 0,
        "physical_footprint_bytes": 40621816,
        "resident_size_bytes": 16728064
      },
      {
        "pid": 25596,
        "start_abstime": 34728135438964,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14075728,
        "resident_size_bytes": 13975552
      },
      {
        "pid": 25597,
        "start_abstime": 34728135456079,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13517880,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25598,
        "start_abstime": 34728135458782,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14895120,
        "resident_size_bytes": 14041088
      },
      {
        "pid": 25599,
        "start_abstime": 34728135646331,
        "exit_abstime": 0,
        "physical_footprint_bytes": 41047920,
        "resident_size_bytes": 16809984
      },
      {
        "pid": 25600,
        "start_abstime": 34728135653626,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13894880,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25601,
        "start_abstime": 34728135683641,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15321152,
        "resident_size_bytes": 16121856
      },
      {
        "pid": 25602,
        "start_abstime": 34728135726559,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15927456,
        "resident_size_bytes": 17039360
      },
      {
        "pid": 25603,
        "start_abstime": 34728135812073,
        "exit_abstime": 0,
        "physical_footprint_bytes": 40752912,
        "resident_size_bytes": 16826368
      },
      {
        "pid": 25604,
        "start_abstime": 34728136014035,
        "exit_abstime": 0,
        "physical_footprint_bytes": 38229752,
        "resident_size_bytes": 16875520
      },
      {
        "pid": 25605,
        "start_abstime": 34728136036515,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15157312,
        "resident_size_bytes": 16318464
      },
      {
        "pid": 25606,
        "start_abstime": 34728136047099,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13485160,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25607,
        "start_abstime": 34728136048171,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13829272,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25608,
        "start_abstime": 34728136057785,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15976584,
        "resident_size_bytes": 17121280
      },
      {
        "pid": 25609,
        "start_abstime": 34728136207504,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14190440,
        "resident_size_bytes": 13975552
      },
      {
        "pid": 25610,
        "start_abstime": 34728136291042,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14977016,
        "resident_size_bytes": 14041088
      },
      {
        "pid": 25611,
        "start_abstime": 34728136303400,
        "exit_abstime": 0,
        "physical_footprint_bytes": 41686704,
        "resident_size_bytes": 16809984
      },
      {
        "pid": 25612,
        "start_abstime": 34728136393488,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15370352,
        "resident_size_bytes": 16072704
      },
      {
        "pid": 25613,
        "start_abstime": 34728136413078,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13485160,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25614,
        "start_abstime": 34728136415385,
        "exit_abstime": 0,
        "physical_footprint_bytes": 40195808,
        "resident_size_bytes": 16809984
      },
      {
        "pid": 25615,
        "start_abstime": 34728136429183,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14911456,
        "resident_size_bytes": 14041088
      },
      {
        "pid": 25616,
        "start_abstime": 34728136430418,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13452344,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25617,
        "start_abstime": 34728136470199,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13485088,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25618,
        "start_abstime": 34728136504686,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13026336,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25619,
        "start_abstime": 34728136641357,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13780048,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25620,
        "start_abstime": 34728136649017,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15190104,
        "resident_size_bytes": 16154624
      },
      {
        "pid": 25621,
        "start_abstime": 34728137322081,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13173816,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25622,
        "start_abstime": 34728137740906,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13222968,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25623,
        "start_abstime": 34728137747656,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13730920,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25624,
        "start_abstime": 34728137778907,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13206584,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25625,
        "start_abstime": 34728137781176,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13255688,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 25626,
        "start_abstime": 34728137855410,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13075512,
        "resident_size_bytes": 8306688
      },
      {
        "pid": 27551,
        "start_abstime": 35166122047475,
        "exit_abstime": 0,
        "physical_footprint_bytes": 40490696,
        "resident_size_bytes": 26132480
      },
      {
        "pid": 27552,
        "start_abstime": 35166122048505,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14747664,
        "resident_size_bytes": 23248896
      },
      {
        "pid": 27553,
        "start_abstime": 35166122049491,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14387096,
        "resident_size_bytes": 24838144
      },
      {
        "pid": 27554,
        "start_abstime": 35166122050399,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14058600,
        "resident_size_bytes": 11272192
      },
      {
        "pid": 27614,
        "start_abstime": 35166123663327,
        "exit_abstime": 0,
        "physical_footprint_bytes": 39634120,
        "resident_size_bytes": 15728640
      },
      {
        "pid": 28901,
        "start_abstime": 34143104885613,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14649384,
        "resident_size_bytes": 14024704
      },
      {
        "pid": 28902,
        "start_abstime": 34143104887103,
        "exit_abstime": 0,
        "physical_footprint_bytes": 41490480,
        "resident_size_bytes": 18792448
      },
      {
        "pid": 28903,
        "start_abstime": 34143104886966,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15583248,
        "resident_size_bytes": 16089088
      },
      {
        "pid": 28904,
        "start_abstime": 34143104887310,
        "exit_abstime": 0,
        "physical_footprint_bytes": 10781488,
        "resident_size_bytes": 10076160
      },
      {
        "pid": 28961,
        "start_abstime": 34143106096693,
        "exit_abstime": 0,
        "physical_footprint_bytes": 10044256,
        "resident_size_bytes": 8290304
      },
      {
        "pid": 30750,
        "start_abstime": 35170822451286,
        "exit_abstime": 0,
        "physical_footprint_bytes": 40097504,
        "resident_size_bytes": 26198016
      },
      {
        "pid": 30751,
        "start_abstime": 35170822451511,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14239592,
        "resident_size_bytes": 24870912
      },
      {
        "pid": 30752,
        "start_abstime": 35170822452699,
        "exit_abstime": 0,
        "physical_footprint_bytes": 11584448,
        "resident_size_bytes": 11272192
      },
      {
        "pid": 30753,
        "start_abstime": 35170822453093,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14993448,
        "resident_size_bytes": 25165824
      },
      {
        "pid": 30794,
        "start_abstime": 35170823302450,
        "exit_abstime": 0,
        "physical_footprint_bytes": 11387792,
        "resident_size_bytes": 11173888
      },
      {
        "pid": 31246,
        "start_abstime": 35171101173262,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14977064,
        "resident_size_bytes": 25214976
      },
      {
        "pid": 31248,
        "start_abstime": 35171101174349,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14305080,
        "resident_size_bytes": 24854528
      },
      {
        "pid": 31249,
        "start_abstime": 35171101174876,
        "exit_abstime": 0,
        "physical_footprint_bytes": 40212216,
        "resident_size_bytes": 26034176
      },
      {
        "pid": 31250,
        "start_abstime": 35171101176303,
        "exit_abstime": 0,
        "physical_footprint_bytes": 11813800,
        "resident_size_bytes": 11272192
      },
      {
        "pid": 31291,
        "start_abstime": 35171101798214,
        "exit_abstime": 0,
        "physical_footprint_bytes": 38716544,
        "resident_size_bytes": 15597568
      },
      {
        "pid": 31330,
        "start_abstime": 26275758095650,
        "exit_abstime": 0,
        "physical_footprint_bytes": 456625656,
        "resident_size_bytes": 395182080
      },
      {
        "pid": 31332,
        "start_abstime": 26275760236377,
        "exit_abstime": 0,
        "physical_footprint_bytes": 4948592,
        "resident_size_bytes": 2113536
      },
      {
        "pid": 31334,
        "start_abstime": 26275760420340,
        "exit_abstime": 0,
        "physical_footprint_bytes": 2474536,
        "resident_size_bytes": 1605632
      },
      {
        "pid": 31338,
        "start_abstime": 26275765020453,
        "exit_abstime": 0,
        "physical_footprint_bytes": 463455816,
        "resident_size_bytes": 76054528
      },
      {
        "pid": 31339,
        "start_abstime": 26275765064070,
        "exit_abstime": 0,
        "physical_footprint_bytes": 74089816,
        "resident_size_bytes": 61882368
      },
      {
        "pid": 31340,
        "start_abstime": 26275765528288,
        "exit_abstime": 0,
        "physical_footprint_bytes": 37323808,
        "resident_size_bytes": 16498688
      },
      {
        "pid": 31546,
        "start_abstime": 26275782959873,
        "exit_abstime": 0,
        "physical_footprint_bytes": 8880872,
        "resident_size_bytes": 7143424
      },
      {
        "pid": 31549,
        "start_abstime": 26275785030885,
        "exit_abstime": 0,
        "physical_footprint_bytes": 1063389968,
        "resident_size_bytes": 297500672
      },
      {
        "pid": 31551,
        "start_abstime": 26275787552059,
        "exit_abstime": 0,
        "physical_footprint_bytes": 308267168,
        "resident_size_bytes": 124174336
      },
      {
        "pid": 31552,
        "start_abstime": 26275787561460,
        "exit_abstime": 0,
        "physical_footprint_bytes": 3035372528,
        "resident_size_bytes": 1739472896
      },
      {
        "pid": 32236,
        "start_abstime": 26275993264314,
        "exit_abstime": 0,
        "physical_footprint_bytes": 239355824,
        "resident_size_bytes": 89128960
      },
      {
        "pid": 32474,
        "start_abstime": 35172219927131,
        "exit_abstime": 0,
        "physical_footprint_bytes": 34297016,
        "resident_size_bytes": 32522240
      },
      {
        "pid": 32475,
        "start_abstime": 35172219936621,
        "exit_abstime": 0,
        "physical_footprint_bytes": 121483600,
        "resident_size_bytes": 60456960
      },
      {
        "pid": 32486,
        "start_abstime": 35172222992923,
        "exit_abstime": 0,
        "physical_footprint_bytes": 33293392,
        "resident_size_bytes": 48070656
      },
      {
        "pid": 33730,
        "start_abstime": 31286654536970,
        "exit_abstime": 0,
        "physical_footprint_bytes": 24888448,
        "resident_size_bytes": 17301504
      },
      {
        "pid": 34254,
        "start_abstime": 26316610260752,
        "exit_abstime": 0,
        "physical_footprint_bytes": 34063176,
        "resident_size_bytes": 22855680
      },
      {
        "pid": 34400,
        "start_abstime": 35175366981318,
        "exit_abstime": 0,
        "physical_footprint_bytes": 11862976,
        "resident_size_bytes": 11272192
      },
      {
        "pid": 34401,
        "start_abstime": 35175366982247,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14059272,
        "resident_size_bytes": 22937600
      },
      {
        "pid": 34402,
        "start_abstime": 35175366982601,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14731232,
        "resident_size_bytes": 23248896
      },
      {
        "pid": 34403,
        "start_abstime": 35175366984486,
        "exit_abstime": 0,
        "physical_footprint_bytes": 38508328,
        "resident_size_bytes": 26116096
      },
      {
        "pid": 34449,
        "start_abstime": 35175367696387,
        "exit_abstime": 0,
        "physical_footprint_bytes": 35669120,
        "resident_size_bytes": 15613952
      },
      {
        "pid": 36818,
        "start_abstime": 35178123363669,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14206824,
        "resident_size_bytes": 24788992
      },
      {
        "pid": 36819,
        "start_abstime": 35178123364249,
        "exit_abstime": 0,
        "physical_footprint_bytes": 41735880,
        "resident_size_bytes": 26083328
      },
      {
        "pid": 36820,
        "start_abstime": 35178123366826,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14960656,
        "resident_size_bytes": 25133056
      },
      {
        "pid": 36821,
        "start_abstime": 35178123368511,
        "exit_abstime": 0,
        "physical_footprint_bytes": 10371912,
        "resident_size_bytes": 11173888
      },
      {
        "pid": 36868,
        "start_abstime": 35178124060657,
        "exit_abstime": 0,
        "physical_footprint_bytes": 9372488,
        "resident_size_bytes": 11173888
      },
      {
        "pid": 38985,
        "start_abstime": 35180635213862,
        "exit_abstime": 0,
        "physical_footprint_bytes": 42653240,
        "resident_size_bytes": 26198016
      },
      {
        "pid": 38986,
        "start_abstime": 35180635214469,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14223256,
        "resident_size_bytes": 24870912
      },
      {
        "pid": 38987,
        "start_abstime": 35180635215121,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14238848,
        "resident_size_bytes": 11272192
      },
      {
        "pid": 38988,
        "start_abstime": 35180635216010,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15124568,
        "resident_size_bytes": 25067520
      },
      {
        "pid": 39030,
        "start_abstime": 35180636571712,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14206056,
        "resident_size_bytes": 11173888
      },
      {
        "pid": 40214,
        "start_abstime": 35181738788993,
        "exit_abstime": 0,
        "physical_footprint_bytes": 41064280,
        "resident_size_bytes": 26198016
      },
      {
        "pid": 40215,
        "start_abstime": 35181738790529,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14174056,
        "resident_size_bytes": 24821760
      },
      {
        "pid": 40216,
        "start_abstime": 35181738789437,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14845968,
        "resident_size_bytes": 23248896
      },
      {
        "pid": 40217,
        "start_abstime": 35181738792623,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13190152,
        "resident_size_bytes": 13484032
      },
      {
        "pid": 40261,
        "start_abstime": 35181739918382,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13878424,
        "resident_size_bytes": 11173888
      },
      {
        "pid": 53009,
        "start_abstime": 35197946066724,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14026600,
        "resident_size_bytes": 22937600
      },
      {
        "pid": 53010,
        "start_abstime": 35197946067631,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13337632,
        "resident_size_bytes": 11173888
      },
      {
        "pid": 53011,
        "start_abstime": 35197946068589,
        "exit_abstime": 0,
        "physical_footprint_bytes": 40703640,
        "resident_size_bytes": 26165248
      },
      {
        "pid": 53012,
        "start_abstime": 35197946070589,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14944296,
        "resident_size_bytes": 25149440
      },
      {
        "pid": 53070,
        "start_abstime": 35197947023382,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13190152,
        "resident_size_bytes": 11173888
      },
      {
        "pid": 55542,
        "start_abstime": 28348551467586,
        "exit_abstime": 0,
        "physical_footprint_bytes": 10322520,
        "resident_size_bytes": 2637824
      },
      {
        "pid": 55806,
        "start_abstime": 35199939355573,
        "exit_abstime": 0,
        "physical_footprint_bytes": 33215768,
        "resident_size_bytes": 32636928
      },
      {
        "pid": 55807,
        "start_abstime": 35199939362103,
        "exit_abstime": 0,
        "physical_footprint_bytes": 122644416,
        "resident_size_bytes": 51937280
      },
      {
        "pid": 55811,
        "start_abstime": 35199941622913,
        "exit_abstime": 0,
        "physical_footprint_bytes": 33473592,
        "resident_size_bytes": 49086464
      },
      {
        "pid": 60189,
        "start_abstime": 35204621502612,
        "exit_abstime": 0,
        "physical_footprint_bytes": 35460736,
        "resident_size_bytes": 32686080
      },
      {
        "pid": 60190,
        "start_abstime": 35204621509755,
        "exit_abstime": 0,
        "physical_footprint_bytes": 122380664,
        "resident_size_bytes": 51036160
      },
      {
        "pid": 60191,
        "start_abstime": 35204623801205,
        "exit_abstime": 0,
        "physical_footprint_bytes": 31343696,
        "resident_size_bytes": 48988160
      },
      {
        "pid": 60202,
        "start_abstime": 35204640068954,
        "exit_abstime": 0,
        "physical_footprint_bytes": 27280584,
        "resident_size_bytes": 76005376
      },
      {
        "pid": 65277,
        "start_abstime": 34812355919898,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15762080,
        "resident_size_bytes": 8159232
      },
      {
        "pid": 67212,
        "start_abstime": 35047360286970,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14977040,
        "resident_size_bytes": 25198592
      },
      {
        "pid": 67213,
        "start_abstime": 35047360288423,
        "exit_abstime": 0,
        "physical_footprint_bytes": 12846016,
        "resident_size_bytes": 13516800
      },
      {
        "pid": 67214,
        "start_abstime": 35047360288992,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14206872,
        "resident_size_bytes": 22937600
      },
      {
        "pid": 67215,
        "start_abstime": 35047360290027,
        "exit_abstime": 0,
        "physical_footprint_bytes": 40507104,
        "resident_size_bytes": 26083328
      },
      {
        "pid": 67256,
        "start_abstime": 35047361113814,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13026288,
        "resident_size_bytes": 11124736
      },
      {
        "pid": 81237,
        "start_abstime": 34457162727639,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14911528,
        "resident_size_bytes": 14041088
      },
      {
        "pid": 81240,
        "start_abstime": 34457164637511,
        "exit_abstime": 0,
        "physical_footprint_bytes": 30950480,
        "resident_size_bytes": 11042816
      },
      {
        "pid": 81242,
        "start_abstime": 34457167665050,
        "exit_abstime": 0,
        "physical_footprint_bytes": 32494680,
        "resident_size_bytes": 15007744
      },
      {
        "pid": 81243,
        "start_abstime": 34457167672537,
        "exit_abstime": 0,
        "physical_footprint_bytes": 134953624,
        "resident_size_bytes": 30162944
      },
      {
        "pid": 81249,
        "start_abstime": 34457170374910,
        "exit_abstime": 0,
        "physical_footprint_bytes": 35554360,
        "resident_size_bytes": 28049408
      },
      {
        "pid": 89526,
        "start_abstime": 30164684401185,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14026600,
        "resident_size_bytes": 3555328
      },
      {
        "pid": 89527,
        "start_abstime": 30164684402635,
        "exit_abstime": 0,
        "physical_footprint_bytes": 11682776,
        "resident_size_bytes": 4587520
      },
      {
        "pid": 89528,
        "start_abstime": 30164684403140,
        "exit_abstime": 0,
        "physical_footprint_bytes": 14878736,
        "resident_size_bytes": 3555328
      },
      {
        "pid": 89529,
        "start_abstime": 30164684403345,
        "exit_abstime": 0,
        "physical_footprint_bytes": 39966768,
        "resident_size_bytes": 5849088
      },
      {
        "pid": 89553,
        "start_abstime": 30164685084754,
        "exit_abstime": 0,
        "physical_footprint_bytes": 10978192,
        "resident_size_bytes": 4587520
      },
      {
        "pid": 90523,
        "start_abstime": 27996762650322,
        "exit_abstime": 0,
        "physical_footprint_bytes": 13911816,
        "resident_size_bytes": 1359872
      },
      {
        "pid": 90524,
        "start_abstime": 27996762650491,
        "exit_abstime": 0,
        "physical_footprint_bytes": 40442024,
        "resident_size_bytes": 3637248
      },
      {
        "pid": 90525,
        "start_abstime": 27996762651036,
        "exit_abstime": 0,
        "physical_footprint_bytes": 15632496,
        "resident_size_bytes": 4308992
      },
      {
        "pid": 90526,
        "start_abstime": 27996762655276,
        "exit_abstime": 0,
        "physical_footprint_bytes": 10535752,
        "resident_size_bytes": 2228224
      },
      {
        "pid": 90632,
        "start_abstime": 27996763372983,
        "exit_abstime": 0,
        "physical_footprint_bytes": 10896368,
        "resident_size_bytes": 2228224
      }
    ],
    "Google Chrome": [
      {
        "pid": 4486,
        "start_abstime": 35130733696940,
        "exit_abstime": 0,
        "physical_footprint_bytes": 211240928,
        "resident_size_bytes": 175521792
      },
      {
        "pid": 7658,
        "start_abstime": 35299030495360,
        "exit_abstime": 0,
        "physical_footprint_bytes": 105973512,
        "resident_size_bytes": 259194880
      },
      {
        "pid": 7752,
        "start_abstime": 35299430110190,
        "exit_abstime": 0,
        "physical_footprint_bytes": 31180072,
        "resident_size_bytes": 118915072
      },
      {
        "pid": 9006,
        "start_abstime": 35136970384818,
        "exit_abstime": 0,
        "physical_footprint_bytes": 191776448,
        "resident_size_bytes": 158187520
      },
      {
        "pid": 9248,
        "start_abstime": 34890405422785,
        "exit_abstime": 0,
        "physical_footprint_bytes": 65668584,
        "resident_size_bytes": 78266368
      },
      {
        "pid": 9265,
        "start_abstime": 34890431679478,
        "exit_abstime": 0,
        "physical_footprint_bytes": 57886160,
        "resident_size_bytes": 61685760
      },
      {
        "pid": 9266,
        "start_abstime": 34890434449415,
        "exit_abstime": 0,
        "physical_footprint_bytes": 80840240,
        "resident_size_bytes": 62226432
      },
      {
        "pid": 10027,
        "start_abstime": 34891249853518,
        "exit_abstime": 0,
        "physical_footprint_bytes": 403999744,
        "resident_size_bytes": 139067392
      },
      {
        "pid": 17454,
        "start_abstime": 34984889725854,
        "exit_abstime": 0,
        "physical_footprint_bytes": 434899704,
        "resident_size_bytes": 194412544
      },
      {
        "pid": 17869,
        "start_abstime": 34986022884800,
        "exit_abstime": 0,
        "physical_footprint_bytes": 495766432,
        "resident_size_bytes": 241582080
      },
      {
        "pid": 19073,
        "start_abstime": 34972034082831,
        "exit_abstime": 0,
        "physical_footprint_bytes": 141756144,
        "resident_size_bytes": 128303104
      },
      {
        "pid": 28910,
        "start_abstime": 35167781417750,
        "exit_abstime": 0,
        "physical_footprint_bytes": 328944664,
        "resident_size_bytes": 250200064
      },
      {
        "pid": 29616,
        "start_abstime": 35169041501628,
        "exit_abstime": 0,
        "physical_footprint_bytes": 107857528,
        "resident_size_bytes": 154353664
      },
      {
        "pid": 33901,
        "start_abstime": 34927546361858,
        "exit_abstime": 0,
        "physical_footprint_bytes": 262948832,
        "resident_size_bytes": 150077440
      },
      {
        "pid": 34058,
        "start_abstime": 34927815212146,
        "exit_abstime": 0,
        "physical_footprint_bytes": 62227944,
        "resident_size_bytes": 86097920
      },
      {
        "pid": 34059,
        "start_abstime": 34927817671162,
        "exit_abstime": 0,
        "physical_footprint_bytes": 66782720,
        "resident_size_bytes": 86835200
      },
      {
        "pid": 34144,
        "start_abstime": 34927960099157,
        "exit_abstime": 0,
        "physical_footprint_bytes": 515852904,
        "resident_size_bytes": 239042560
      },
      {
        "pid": 35569,
        "start_abstime": 34930571009425,
        "exit_abstime": 0,
        "physical_footprint_bytes": 223791096,
        "resident_size_bytes": 133365760
      },
      {
        "pid": 40538,
        "start_abstime": 35181762986341,
        "exit_abstime": 0,
        "physical_footprint_bytes": 89081464,
        "resident_size_bytes": 138248192
      },
      {
        "pid": 40837,
        "start_abstime": 35182300916026,
        "exit_abstime": 0,
        "physical_footprint_bytes": 223692696,
        "resident_size_bytes": 167526400
      },
      {
        "pid": 40840,
        "start_abstime": 35182306807606,
        "exit_abstime": 0,
        "physical_footprint_bytes": 232425416,
        "resident_size_bytes": 170967040
      },
      {
        "pid": 42586,
        "start_abstime": 35184408209497,
        "exit_abstime": 0,
        "physical_footprint_bytes": 409749712,
        "resident_size_bytes": 407535616
      },
      {
        "pid": 42775,
        "start_abstime": 34943559189401,
        "exit_abstime": 0,
        "physical_footprint_bytes": 80152112,
        "resident_size_bytes": 101629952
      },
      {
        "pid": 45059,
        "start_abstime": 35187520807389,
        "exit_abstime": 0,
        "physical_footprint_bytes": 546851144,
        "resident_size_bytes": 230391808
      },
      {
        "pid": 48578,
        "start_abstime": 35192175928119,
        "exit_abstime": 0,
        "physical_footprint_bytes": 438995248,
        "resident_size_bytes": 237518848
      },
      {
        "pid": 49775,
        "start_abstime": 34952467300391,
        "exit_abstime": 0,
        "physical_footprint_bytes": 320604368,
        "resident_size_bytes": 121880576
      },
      {
        "pid": 51880,
        "start_abstime": 35015055029511,
        "exit_abstime": 0,
        "physical_footprint_bytes": 220759888,
        "resident_size_bytes": 136462336
      },
      {
        "pid": 59785,
        "start_abstime": 35204318193490,
        "exit_abstime": 0,
        "physical_footprint_bytes": 382241024,
        "resident_size_bytes": 250789888
      },
      {
        "pid": 59789,
        "start_abstime": 35204328289707,
        "exit_abstime": 0,
        "physical_footprint_bytes": 108774984,
        "resident_size_bytes": 147800064
      },
      {
        "pid": 61451,
        "start_abstime": 35027039459427,
        "exit_abstime": 0,
        "physical_footprint_bytes": 268339168,
        "resident_size_bytes": 223051776
      },
      {
        "pid": 61458,
        "start_abstime": 35027068986286,
        "exit_abstime": 0,
        "physical_footprint_bytes": 250399240,
        "resident_size_bytes": 221593600
      },
      {
        "pid": 61511,
        "start_abstime": 35027268917266,
        "exit_abstime": 0,
        "physical_footprint_bytes": 94062344,
        "resident_size_bytes": 142475264
      },
      {
        "pid": 64294,
        "start_abstime": 35209945818238,
        "exit_abstime": 0,
        "physical_footprint_bytes": 149407520,
        "resident_size_bytes": 175144960
      },
      {
        "pid": 64550,
        "start_abstime": 35037315400573,
        "exit_abstime": 0,
        "physical_footprint_bytes": 90277496,
        "resident_size_bytes": 146833408
      },
      {
        "pid": 65218,
        "start_abstime": 34812323688844,
        "exit_abstime": 0,
        "physical_footprint_bytes": 844451152,
        "resident_size_bytes": 477790208
      },
      {
        "pid": 65221,
        "start_abstime": 34812327959211,
        "exit_abstime": 0,
        "physical_footprint_bytes": 3261016,
        "resident_size_bytes": 7831552
      },
      {
        "pid": 65231,
        "start_abstime": 34812338597816,
        "exit_abstime": 0,
        "physical_footprint_bytes": 475318048,
        "resident_size_bytes": 130777088
      },
      {
        "pid": 65232,
        "start_abstime": 34812338910510,
        "exit_abstime": 0,
        "physical_footprint_bytes": 78923096,
        "resident_size_bytes": 128663552
      },
      {
        "pid": 65234,
        "start_abstime": 34812340683780,
        "exit_abstime": 0,
        "physical_footprint_bytes": 36340792,
        "resident_size_bytes": 60719104
      },
      {
        "pid": 65260,
        "start_abstime": 34812349268100,
        "exit_abstime": 0,
        "physical_footprint_bytes": 96519896,
        "resident_size_bytes": 92356608
      },
      {
        "pid": 65275,
        "start_abstime": 35211540915345,
        "exit_abstime": 0,
        "physical_footprint_bytes": 123537136,
        "resident_size_bytes": 162840576
      },
      {
        "pid": 65278,
        "start_abstime": 34812356284642,
        "exit_abstime": 0,
        "physical_footprint_bytes": 74253944,
        "resident_size_bytes": 92110848
      },
      {
        "pid": 65292,
        "start_abstime": 35039772523365,
        "exit_abstime": 0,
        "physical_footprint_bytes": 90424880,
        "resident_size_bytes": 149618688
      },
      {
        "pid": 65314,
        "start_abstime": 34812409707461,
        "exit_abstime": 0,
        "physical_footprint_bytes": 120489640,
        "resident_size_bytes": 125960192
      },
      {
        "pid": 65334,
        "start_abstime": 34812433007884,
        "exit_abstime": 0,
        "physical_footprint_bytes": 169740088,
        "resident_size_bytes": 158351360
      },
      {
        "pid": 65338,
        "start_abstime": 34812437663617,
        "exit_abstime": 0,
        "physical_footprint_bytes": 187336576,
        "resident_size_bytes": 189448192
      },
      {
        "pid": 65374,
        "start_abstime": 34812492965229,
        "exit_abstime": 0,
        "physical_footprint_bytes": 99108400,
        "resident_size_bytes": 120979456
      },
      {
        "pid": 65466,
        "start_abstime": 34812654188766,
        "exit_abstime": 0,
        "physical_footprint_bytes": 28607592,
        "resident_size_bytes": 64798720
      },
      {
        "pid": 65485,
        "start_abstime": 34812676742711,
        "exit_abstime": 0,
        "physical_footprint_bytes": 55625192,
        "resident_size_bytes": 75464704
      },
      {
        "pid": 65487,
        "start_abstime": 34812677695344,
        "exit_abstime": 0,
        "physical_footprint_bytes": 376474096,
        "resident_size_bytes": 141606912
      },
      {
        "pid": 65600,
        "start_abstime": 35211925354783,
        "exit_abstime": 0,
        "physical_footprint_bytes": 304662736,
        "resident_size_bytes": 195428352
      },
      {
        "pid": 66329,
        "start_abstime": 34813914021219,
        "exit_abstime": 0,
        "physical_footprint_bytes": 303894776,
        "resident_size_bytes": 297172992
      },
      {
        "pid": 67512,
        "start_abstime": 35215059734719,
        "exit_abstime": 0,
        "physical_footprint_bytes": 122242848,
        "resident_size_bytes": 162611200
      },
      {
        "pid": 67529,
        "start_abstime": 35215088879994,
        "exit_abstime": 0,
        "physical_footprint_bytes": 37160112,
        "resident_size_bytes": 81625088
      },
      {
        "pid": 67607,
        "start_abstime": 34815918474622,
        "exit_abstime": 0,
        "physical_footprint_bytes": 106940288,
        "resident_size_bytes": 144719872
      }
    ],
    "Wispr Flow": [
      {
        "pid": 15116,
        "start_abstime": 34898507372677,
        "exit_abstime": 0,
        "physical_footprint_bytes": 196266384,
        "resident_size_bytes": 250986496
      },
      {
        "pid": 15127,
        "start_abstime": 34898520931768,
        "exit_abstime": 0,
        "physical_footprint_bytes": 3129920,
        "resident_size_bytes": 7831552
      },
      {
        "pid": 15131,
        "start_abstime": 34898523431335,
        "exit_abstime": 0,
        "physical_footprint_bytes": 72008880,
        "resident_size_bytes": 60702720
      },
      {
        "pid": 15132,
        "start_abstime": 34898523605736,
        "exit_abstime": 0,
        "physical_footprint_bytes": 9110464,
        "resident_size_bytes": 42860544
      },
      {
        "pid": 15178,
        "start_abstime": 34898591641422,
        "exit_abstime": 0,
        "physical_footprint_bytes": 24609608,
        "resident_size_bytes": 65241088
      },
      {
        "pid": 15179,
        "start_abstime": 34898593201335,
        "exit_abstime": 0,
        "physical_footprint_bytes": 146179776,
        "resident_size_bytes": 146571264
      },
      {
        "pid": 15180,
        "start_abstime": 34898593434998,
        "exit_abstime": 0,
        "physical_footprint_bytes": 110937696,
        "resident_size_bytes": 70942720
      },
      {
        "pid": 15181,
        "start_abstime": 34898593803259,
        "exit_abstime": 0,
        "physical_footprint_bytes": 244664672,
        "resident_size_bytes": 233881600
      },
      {
        "pid": 15183,
        "start_abstime": 34898594052467,
        "exit_abstime": 0,
        "physical_footprint_bytes": 103286440,
        "resident_size_bytes": 23773184
      },
      {
        "pid": 15189,
        "start_abstime": 34898604066140,
        "exit_abstime": 0,
        "physical_footprint_bytes": 10732576,
        "resident_size_bytes": 35340288
      },
      {
        "pid": 15190,
        "start_abstime": 34898605289587,
        "exit_abstime": 0,
        "physical_footprint_bytes": 11502648,
        "resident_size_bytes": 30162944
      }
    ]
  }
}

````````````
