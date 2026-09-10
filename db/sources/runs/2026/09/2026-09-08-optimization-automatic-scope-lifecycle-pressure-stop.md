---
type: run
id: 01m21wtysge6k5yym37gr79cff
created: 2026-09-09T01:34:36.848419+00:00
updated: 2026-09-09T01:34:37.432414+00:00
summary: Expanded V439 lifecycle stops before report at macOS pressure warning; exact failure footprint and binary locations preserved
binary: /Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream
captured_at: 2026-09-08
command: python3 /tmp/slotstream-optimization-execution/automatic-scope-native-v439/run.py native --name scope-lifecycle --deadline 2026-09-09T03:00:00Z
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Expanded V439 lifecycle stops before report at macOS pressure warning; exact failure footprint and binary locations preserved
tool: Slotstream exact native and source qualification capture
---
Original full expanded native lifecycle stopped after159.558152459seconds at macOS memory pressure level2. At failure the task Mach footprint was7,913,999,672bytes; this is a diagnostic instantaneous observation, not its sampled peak. No assertion report was emitted, so no native pass or assertion count is claimed. Exact source/binary proofs and cleanup pass, with no owned jobs left. No retry/continuation of this case. A path audit distinguishes unchanged shared .build/release SHA9002c67... from actual PATH-installed ~/.slotstream/bin/slotstream SHA7f540b73...; neither was activated by this task.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-lifecycle/attempt.json",
    "bytes": 23257,
    "sha256": "c18b7f56044f17be1f60aab0b0090a4d6e6e86f2413109b9ec58285d69bd7e71"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-lifecycle/memory.failure-footprint.json",
    "bytes": 916,
    "sha256": "3266d80d343479ff5d4303da890510b9c19847dac4903e28b2729a0205a6e0b8"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-lifecycle/memory.json",
    "bytes": 151507,
    "sha256": "85d32aca4d1391e8330c9e5d7e7f7f5a32393b542b4498250811dc4f5906c797"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-lifecycle/memory.samples.jsonl",
    "bytes": 112601,
    "sha256": "3b4367313c06410d68719c561d04c12c5fe9d9088eb86b52be890939ae404b80"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-lifecycle/qualification.json",
    "bytes": 2616,
    "sha256": "446cd79bfd38a1f49a84315abf54a4eff075ecf88f8e84b7e27f94d3dc87e772"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-lifecycle/receipt.json",
    "bytes": 2518,
    "sha256": "fe4a430fb2ffd9d4a4eb47144e601b704db36193e8dbbc72646f618b6c938f04"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-lifecycle/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-lifecycle/stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-lifecycle-pressure-v442/audit.json",
    "bytes": 4638,
    "sha256": "6931447d57c65c332121286c3acb0f490087f9e5f5c468c1c4847ab4cd38e47d"
  }
]
```

## Artifact SHA-256 c18b7f56044f17be1f60aab0b0090a4d6e6e86f2413109b9ec58285d69bd7e71

Encoding: `utf-8`. Original bytes: 23257.

````````````text
{
  "started_at": "2026-09-09T01:28:01.314561+00:00",
  "deadline_utc": "2026-09-09T03:00:00Z",
  "command": [
    "/usr/bin/env",
    "SLOTSTREAM_OPT_WORKSPACE_TILE=1024",
    "SLOTSTREAM_OPT_SCOPE_FRONTIER=1",
    "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "scope-integrated-lifecycle",
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
    "reclaimable_bytes": 22772318208,
    "swapins": 44233736,
    "swapouts": 77586649,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     7545.\nPages active:                                 712315.\nPages inactive:                              1218764.\nPages speculative:                              3108.\nPages throttled:                                   0.\nPages wired down:                             255813.\nPages purgeable:                                3980.\n\"Translation faults\":                    17954862495.\nPages copy-on-write:                       981112741.\nPages zero filled:                       25391421616.\nPages reactivated:                        4825087246.\nPages purged:                               91469787.\nFile-backed pages:                           1378387.\nAnonymous pages:                              555800.\nPages stored in compressor:                  1780679.\nPages occupied by compressor:                 887764.\nDecompressions:                           1445284974.\nCompressions:                             1783415182.\nPageins:                                  9107712230.\nPageouts:                                   11581857.\nSwapins:                                    44233736.\nSwapouts:                                   77586649.\nPages tagged:                                 179890.\nPages tagged resident:                        127786.\nPages tagged compressed:                       52104.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7216.\nPages tag-storage free:                          371.\nPages tag-storage non-tag pageable:            90709.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8540992.\nTagged compressions:                        14462533.\nTagged decompressions:                      13415249.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T01:28:01.314438+00:00",
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

## Artifact SHA-256 3266d80d343479ff5d4303da890510b9c19847dac4903e28b2729a0205a6e0b8

Encoding: `utf-8`. Original bytes: 916.

````````````text
{
  "original_error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
  "observation": {
    "at_utc": "2026-09-09T01:30:40.447842+00:00",
    "complete": true,
    "root_identity": {
      "pid": 1969,
      "start_abstime": 35286160795646
    },
    "processes": [
      {
        "pid": 1969,
        "start_abstime": 35286160795646,
        "exit_abstime": 0,
        "physical_footprint_bytes": 7913999672,
        "resident_size_bytes": 230146048
      }
    ],
    "classification": "Failure-time diagnostic only; not a sampled peak or admission/cleanup proof",
    "sum_process_footprints_bytes": 7913999672,
    "sum_process_resident_sizes_bytes": 230146048,
    "sum_scope": "Sum of OS charges to these processes; not unique system memory or free/reclaimable memory.",
    "elapsed_seconds": 0.050706165999997665
  },
  "original_failure_preserved": true
}

````````````

## Artifact SHA-256 85d32aca4d1391e8330c9e5d7e7f7f5a32393b542b4498250811dc4f5906c797

Encoding: `gzip+base64`. Original bytes: 151507.

````````````text
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
````````````

## Artifact SHA-256 3b4367313c06410d68719c561d04c12c5fe9d9088eb86b52be890939ae404b80

Encoding: `gzip+base64`. Original bytes: 112601.

````````````text
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
````````````

## Artifact SHA-256 446cd79bfd38a1f49a84315abf54a4eff075ecf88f8e84b7e27f94d3dc87e772

Encoding: `utf-8`. Original bytes: 2616.

````````````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "c18b7f56044f17be1f60aab0b0090a4d6e6e86f2413109b9ec58285d69bd7e71",
  "error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
  "elapsed_seconds": 159.558152459,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 26813235200,
    "swapins": 44233736,
    "swapouts": 77586649,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   479664.\nPages active:                                 632555.\nPages inactive:                               550727.\nPages speculative:                             82607.\nPages throttled:                                   0.\nPages wired down:                             239898.\nPages purgeable:                                   2.\n\"Translation faults\":                    17958334170.\nPages copy-on-write:                       981459461.\nPages zero filled:                       25505290803.\nPages reactivated:                        4829015306.\nPages purged:                               91508206.\nFile-backed pages:                           1156884.\nAnonymous pages:                              109005.\nPages stored in compressor:                  2199962.\nPages occupied by compressor:                1098464.\nDecompressions:                           1448285290.\nCompressions:                             1787198248.\nPageins:                                  9110892764.\nPageouts:                                   11582833.\nSwapins:                                    44233736.\nSwapouts:                                   77586649.\nPages tagged:                                 171717.\nPages tagged resident:                        110031.\nPages tagged compressed:                       61686.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7105.\nPages tag-storage free:                         1785.\nPages tag-storage non-tag pageable:            89406.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                   10547840.\nTagged compressions:                        14486294.\nTagged decompressions:                      13428848.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
  "execution_receipt_sha256": "fe4a430fb2ffd9d4a4eb47144e601b704db36193e8dbbc72646f618b6c938f04"
}

````````````

## Artifact SHA-256 fe4a430fb2ffd9d4a4eb47144e601b704db36193e8dbbc72646f618b6c938f04

Encoding: `utf-8`. Original bytes: 2518.

````````````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "c18b7f56044f17be1f60aab0b0090a4d6e6e86f2413109b9ec58285d69bd7e71",
  "error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
  "elapsed_seconds": 159.558152459,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 26813235200,
    "swapins": 44233736,
    "swapouts": 77586649,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   479664.\nPages active:                                 632555.\nPages inactive:                               550727.\nPages speculative:                             82607.\nPages throttled:                                   0.\nPages wired down:                             239898.\nPages purgeable:                                   2.\n\"Translation faults\":                    17958334170.\nPages copy-on-write:                       981459461.\nPages zero filled:                       25505290803.\nPages reactivated:                        4829015306.\nPages purged:                               91508206.\nFile-backed pages:                           1156884.\nAnonymous pages:                              109005.\nPages stored in compressor:                  2199962.\nPages occupied by compressor:                1098464.\nDecompressions:                           1448285290.\nCompressions:                             1787198248.\nPageins:                                  9110892764.\nPageouts:                                   11582833.\nSwapins:                                    44233736.\nSwapouts:                                   77586649.\nPages tagged:                                 171717.\nPages tagged resident:                        110031.\nPages tagged compressed:                       61686.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7105.\nPages tag-storage free:                         1785.\nPages tag-storage non-tag pageable:            89406.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                   10547840.\nTagged compressions:                        14486294.\nTagged decompressions:                      13428848.\n"
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

## Artifact SHA-256 6931447d57c65c332121286c3acb0f490087f9e5f5c468c1c4847ab4cd38e47d

Encoding: `utf-8`. Original bytes: 4638.

````````````text
{
  "observed_at": "2026-09-09T01:34:36.739943+00:00",
  "classification": "V439 actual expanded lifecycle interrupted by OS pressure before emitting a report; no assertion count/native pass exists. Case consumed, no retry.",
  "receipt": {
    "passed": false,
    "completed": false,
    "qualified": false,
    "attempt_sha256": "c18b7f56044f17be1f60aab0b0090a4d6e6e86f2413109b9ec58285d69bd7e71",
    "error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
    "elapsed_seconds": 159.558152459,
    "proofs_unchanged": true,
    "after": {
      "page_bytes": 16384,
      "reclaimable_bytes": 26813235200,
      "swapins": 44233736,
      "swapouts": 77586649,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   479664.\nPages active:                                 632555.\nPages inactive:                               550727.\nPages speculative:                             82607.\nPages throttled:                                   0.\nPages wired down:                             239898.\nPages purgeable:                                   2.\n\"Translation faults\":                    17958334170.\nPages copy-on-write:                       981459461.\nPages zero filled:                       25505290803.\nPages reactivated:                        4829015306.\nPages purged:                               91508206.\nFile-backed pages:                           1156884.\nAnonymous pages:                              109005.\nPages stored in compressor:                  2199962.\nPages occupied by compressor:                1098464.\nDecompressions:                           1448285290.\nCompressions:                             1787198248.\nPageins:                                  9110892764.\nPageouts:                                   11582833.\nSwapins:                                    44233736.\nSwapouts:                                   77586649.\nPages tagged:                                 171717.\nPages tagged resident:                        110031.\nPages tagged compressed:                       61686.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7105.\nPages tag-storage free:                         1785.\nPages tag-storage non-tag pageable:            89406.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                   10547840.\nTagged compressions:                        14486294.\nTagged decompressions:                      13428848.\n"
    },
    "remaining_jobs": [],
    "cleanup_complete": true,
    "within_reservation": true,
    "stdout_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "execution_receipt_sha256": "fe4a430fb2ffd9d4a4eb47144e601b704db36193e8dbbc72646f618b6c938f04"
  },
  "failure_footprint": {
    "original_error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
    "observation": {
      "at_utc": "2026-09-09T01:30:40.447842+00:00",
      "complete": true,
      "root_identity": {
        "pid": 1969,
        "start_abstime": 35286160795646
      },
      "processes": [
        {
          "pid": 1969,
          "start_abstime": 35286160795646,
          "exit_abstime": 0,
          "physical_footprint_bytes": 7913999672,
          "resident_size_bytes": 230146048
        }
      ],
      "classification": "Failure-time diagnostic only; not a sampled peak or admission/cleanup proof",
      "sum_process_footprints_bytes": 7913999672,
      "sum_process_resident_sizes_bytes": 230146048,
      "sum_scope": "Sum of OS charges to these processes; not unique system memory or free/reclaimable memory.",
      "elapsed_seconds": 0.050706165999997665
    },
    "original_failure_preserved": true
  },
  "no_stdout_report": true,
  "path_binary": "/Users/carlos/.slotstream/bin/slotstream",
  "binaries": {
    "/Users/carlos/Projects/slotstream/.build/release/slotstream": {
      "sha256": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
      "mtime": 1788740524.6128774,
      "bytes": 43520216
    },
    "/Users/carlos/.slotstream/bin/slotstream": {
      "sha256": "7f540b73b5ff4cf48975ff122a3d17f57e53103e616ad84a76cfc71d551be5b8",
      "mtime": 1788732943.0,
      "bytes": 40338680
    }
  },
  "identity_correction": "The preserved .build/release binary SHA9002c67... and actual PATH installation SHA7f540b73... are distinct. This task activated neither; previous summaries calling the former installed were imprecise."
}

````````````
