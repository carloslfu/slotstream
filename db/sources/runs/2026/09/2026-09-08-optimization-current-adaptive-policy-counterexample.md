---
type: run
id: 01m1z5z2czc33dcn16w98krm3f
created: 2026-09-08T00:16:25.503305+00:00
updated: 2026-09-08T00:16:25.759114+00:00
summary: Current adaptive speculation retains its exact-output rejection
binary: V304 af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d
captured_at: 2026-09-08
command: Original V332 vision native commands; V330 MTP/image native commands; complete static_gates.sh on V304. Exact invocations and captured outputs below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Current adaptive speculation retains its exact-output rejection
tool: python3
---
# Adaptive policy remains rejected

The original V330 adaptive-mtp command completed its native assertions but failed overall: 258 of 259 assertions pass, and adaptive greedy output differs from target-only decoding at the final token, 1002 versus 3431. The complete report stays failed with process exit one. This is a current counterexample on V304, not an adopted mode and not a successful native prerequisite. The replay, cancellation, EOS, pending-token and retained-state observations are preserved individually, without turning them into an overall pass. Runtime and proposed serving controls continue to set adaptive speculation off.

The executor currently makes both original MTP-tail studies depend on a wholly passing adaptive-mtp report. Source inspection distinguishes that rejected adaptive-quality assertion from the original V179 requirement for corrected cancellation/EOS/pending-state/continuation coverage. The fixed-tail native separately passes 284 assertions, and both original paired MTP protocols explicitly disable adaptive speculation. The dependency requires an explicit, source-grounded resolution before either MTP serving study can run; no failure is ignored and no revised gate or protocol is frozen here. No MTP-tail serving run occurred.

The native run lasts 92.261168916 seconds, has unchanged swap counters, and is fully drained. Its numerical failure is retained; adaptive mode remains off.


## Evidence inventory

````json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/adaptive-mtp/attempt.json",
    "bytes": 22699,
    "sha256": "af84ca9b85863cfba32651f52240952006f65e36bf75c2d1e5de5ab5268b7bc6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/adaptive-mtp/memory.json",
    "bytes": 93084,
    "sha256": "c7a722812e2618a6f46b5e8f1caf189e1b172802dad54be6ef3353ee6615fbd2"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/adaptive-mtp/memory.samples.jsonl",
    "bytes": 67269,
    "sha256": "03db865e9de9e462bbf4faaf9a4a2c4b1e27f6dce298bc9df17f2fafe30f260e"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/adaptive-mtp/receipt.json",
    "bytes": 2510,
    "sha256": "5d82a8cb600417eb81d1b6a3bce6674e03727e51cac95a94e7c6eaf8523d0e5e"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/adaptive-mtp/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/adaptive-mtp/stdout.txt",
    "bytes": 22515,
    "sha256": "085a6f2e7949a2061d276cc73c14c88f1052337ea8d79f29898ea957b8fde84f"
  }
]
````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/adaptive-mtp/attempt.json

SHA-256 `af84ca9b85863cfba32651f52240952006f65e36bf75c2d1e5de5ab5268b7bc6`.

````text
{
  "started_at": "2026-09-08T00:05:01.252035+00:00",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
    "optimization-state-check",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--variant",
    "adaptive-mtp",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
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
        "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
      "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "deadline_utc": "2026-09-08T02:30:00Z",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 15782821888,
    "swapins": 44129728,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   404145.\nPages active:                                 896014.\nPages inactive:                               889341.\nPages speculative:                             11612.\nPages throttled:                                   0.\nPages wired down:                             243504.\nPages purgeable:                                7522.\n\"Translation faults\":                    16724352203.\nPages copy-on-write:                       855207015.\nPages zero filled:                       22528096936.\nPages reactivated:                        3728195509.\nPages purged:                               78894466.\nFile-backed pages:                            551640.\nAnonymous pages:                             1245327.\nPages stored in compressor:                  1485317.\nPages occupied by compressor:                 640289.\nDecompressions:                           1274665397.\nCompressions:                             1597623333.\nPageins:                                  8050480446.\nPageouts:                                   11387418.\nSwapins:                                    44129728.\nSwapouts:                                   77538158.\nPages tagged:                                 173732.\nPages tagged resident:                        131564.\nPages tagged compressed:                       42168.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7595.\nPages tag-storage free:                          573.\nPages tag-storage non-tag pageable:            90128.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6647104.\nTagged compressions:                        12384891.\nTagged decompressions:                      11438115.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-08T00:05:01.251913+00:00",
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
    "maximum_build_seconds": 600,
    "stop_on_new_swapouts": false
  },
  "preparation_sha256": "3479e62de5ffbe569b3bd0f9c63953a3cfec0bbaea197ba8b6237b1e43b5f974",
  "classification": "Original native correctness workload on current V304. No performance, memory-capacity, adaptive-policy adoption or automatic activation claim."
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/adaptive-mtp/receipt.json

SHA-256 `5d82a8cb600417eb81d1b6a3bce6674e03727e51cac95a94e7c6eaf8523d0e5e`.

````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "af84ca9b85863cfba32651f52240952006f65e36bf75c2d1e5de5ab5268b7bc6",
  "exit_code": 1,
  "error": "ValueError: native correctness failed or required assertions missing",
  "elapsed_seconds": 92.261168916,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 16415719424,
    "swapins": 44129728,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   454230.\nPages active:                                 825496.\nPages inactive:                               823329.\nPages speculative:                               479.\nPages throttled:                                   0.\nPages wired down:                             235556.\nPages purgeable:                                3438.\n\"Translation faults\":                    16726061155.\nPages copy-on-write:                       855398274.\nPages zero filled:                       22530105676.\nPages reactivated:                        3728218843.\nPages purged:                               78902367.\nFile-backed pages:                            544268.\nAnonymous pages:                             1105036.\nPages stored in compressor:                  1641054.\nPages occupied by compressor:                 745761.\nDecompressions:                           1274678003.\nCompressions:                             1597792076.\nPageins:                                  8050539266.\nPageouts:                                   11387840.\nSwapins:                                    44129728.\nSwapouts:                                   77538158.\nPages tagged:                                 173852.\nPages tagged resident:                        131223.\nPages tagged compressed:                       42629.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7581.\nPages tag-storage free:                          497.\nPages tag-storage non-tag pageable:            90218.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6721408.\nTagged compressions:                        12385735.\nTagged decompressions:                      11438492.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "085a6f2e7949a2061d276cc73c14c88f1052337ea8d79f29898ea957b8fde84f"
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/adaptive-mtp/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/adaptive-mtp/stdout.txt

SHA-256 `085a6f2e7949a2061d276cc73c14c88f1052337ea8d79f29898ea957b8fde84f`.

````text
{
  "items" : [
    {
      "name" : "replayed cost observations preserve exact IDs",
      "passed" : true
    },
    {
      "name" : "replayed cost observations preserve exact decisions",
      "passed" : true
    },
    {
      "name" : "three useful target steps calibrate before drafting",
      "passed" : true
    },
    {
      "name" : "three expensive draft rounds then disable",
      "passed" : true
    },
    {
      "name" : "requested output count is preserved",
      "passed" : true
    },
    {
      "name" : "plain fallback emits real target tokens",
      "passed" : true
    },
    {
      "name" : "plain fallback leaves the final emitted token pending",
      "passed" : true
    },
    {
      "name" : "disabled head state is invalidated",
      "passed" : true
    },
    {
      "name" : "replayed state has exactly the same fields",
      "passed" : true
    },
    {
      "name" : "replayed state conv.0 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.1 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.10 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.12 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.13 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.14 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.16 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.17 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.18 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.2 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.20 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.21 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.22 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.24 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.25 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.26 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.28 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.29 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.30 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.32 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.33 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.34 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.36 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.37 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.38 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.4 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.40 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.41 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.42 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.44 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.45 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.46 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.5 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.6 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.8 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state conv.9 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.11 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.15 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.19 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.23 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.27 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.3 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.31 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.35 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.39 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.43 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.47 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state index.7 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.11 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.15 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.19 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.23 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.27 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.3 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.31 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.35 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.39 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.43 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.47 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state key.7 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ngram is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ple.1 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.0 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.1 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.10 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.12 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.13 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.14 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.16 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.17 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.18 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.2 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.20 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.21 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.22 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.24 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.25 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.26 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.28 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.29 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.30 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.32 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.33 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.34 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.36 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.37 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.38 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.4 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.40 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.41 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.42 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.44 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.45 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.46 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.5 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.6 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.8 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state ssm.9 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state tokens is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.11 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.15 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.19 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.23 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.27 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.3 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.31 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.35 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.39 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.43 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.47 is exact",
      "passed" : true
    },
    {
      "name" : "replayed state value.7 is exact",
      "passed" : true
    },
    {
      "name" : "continued invalid-head prefix emits exact tokens",
      "passed" : true
    },
    {
      "name" : "continued invalid-head prefix is reused",
      "passed" : true
    },
    {
      "name" : "continued prefix never drafts on stale head state",
      "passed" : true
    },
    {
      "name" : "continued prefix has no adaptive head decisions",
      "passed" : true
    },
    {
      "name" : "stop at first plain output preserves exact prefix",
      "passed" : true
    },
    {
      "name" : "stop at first plain output is reported",
      "passed" : true
    },
    {
      "name" : "stop leaves its emitted token unconsumed",
      "passed" : true
    },
    {
      "name" : "stop cannot reactivate the head",
      "passed" : true
    },
    {
      "name" : "resident head stays loaded and must remain charged",
      "passed" : true
    },
    {
      "detail" : "got [418, 11, 198, 27, 91, 1152, 52933, 91, 29, 27, 91, 244288, 60470, 91, 29, 1002], want [418, 11, 198, 27, 91, 1152, 52933, 91, 29, 27, 91, 244288, 60470, 91, 29, 3431]",
      "name" : "adaptive greedy IDs agree with target-only decode",
      "passed" : false
    },
    {
      "name" : "short 1: exact target prefix",
      "passed" : true
    },
    {
      "name" : "short 1: no unused draft",
      "passed" : true
    },
    {
      "name" : "short 1: exact useful calibration count",
      "passed" : true
    },
    {
      "name" : "short 1: pending output accounting",
      "passed" : true
    },
    {
      "name" : "short 1: aligned head",
      "passed" : true
    },
    {
      "name" : "short 2: exact target prefix",
      "passed" : true
    },
    {
      "name" : "short 2: no unused draft",
      "passed" : true
    },
    {
      "name" : "short 2: exact useful calibration count",
      "passed" : true
    },
    {
      "name" : "short 2: pending output accounting",
      "passed" : true
    },
    {
      "name" : "short 2: aligned head",
      "passed" : true
    },
    {
      "name" : "short 3: exact target prefix",
      "passed" : true
    },
    {
      "name" : "short 3: no unused draft",
      "passed" : true
    },
    {
      "name" : "short 3: exact useful calibration count",
      "passed" : true
    },
    {
      "name" : "short 3: pending output accounting",
      "passed" : true
    },
    {
      "name" : "short 3: aligned head",
      "passed" : true
    },
    {
      "name" : "short 4: exact target prefix",
      "passed" : true
    },
    {
      "name" : "short 4: no unused draft",
      "passed" : true
    },
    {
      "name" : "short 4: exact useful calibration count",
      "passed" : true
    },
    {
      "name" : "short 4: pending output accounting",
      "passed" : true
    },
    {
      "name" : "short 4: aligned head",
      "passed" : true
    },
    {
      "name" : "callback 1: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 1: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 1: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 1: head validity",
      "passed" : true
    },
    {
      "name" : "callback 2: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 2: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 2: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 2: head validity",
      "passed" : true
    },
    {
      "name" : "callback 3: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 3: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 3: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 3: head validity",
      "passed" : true
    },
    {
      "name" : "callback 4: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 4: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 4: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 4: head validity",
      "passed" : true
    },
    {
      "name" : "callback 5: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 5: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 5: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 5: head validity",
      "passed" : true
    },
    {
      "name" : "callback 6: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 6: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 6: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 6: head validity",
      "passed" : true
    },
    {
      "name" : "callback 7: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 7: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 7: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 7: head validity",
      "passed" : true
    },
    {
      "name" : "callback 8: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 8: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 8: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 8: head validity",
      "passed" : true
    },
    {
      "name" : "callback 9: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 9: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 9: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 9: head validity",
      "passed" : true
    },
    {
      "name" : "callback 10: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 10: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 10: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 10: head validity",
      "passed" : true
    },
    {
      "name" : "callback 11: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 11: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 11: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 11: head validity",
      "passed" : true
    },
    {
      "name" : "callback 12: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 12: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 12: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 12: head validity",
      "passed" : true
    },
    {
      "name" : "callback 13: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 13: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 13: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 13: head validity",
      "passed" : true
    },
    {
      "name" : "callback 14: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 14: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 14: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 14: head validity",
      "passed" : true
    },
    {
      "name" : "callback 15: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 15: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 15: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 15: head validity",
      "passed" : true
    },
    {
      "name" : "callback 16: exact emitted prefix",
      "passed" : true
    },
    {
      "name" : "callback 16: stop reason",
      "passed" : true
    },
    {
      "name" : "callback 16: no consumed unobserved output",
      "passed" : true
    },
    {
      "name" : "callback 16: head validity",
      "passed" : true
    },
    {
      "name" : "EOS 0: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 0: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 0: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 1: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 1: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 1: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 2: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 2: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 2: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 3: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 3: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 3: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 4: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 4: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 4: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 5: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 5: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 5: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 6: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 6: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 6: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 8: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 8: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 8: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 11: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 11: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 11: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 12: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 12: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 12: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "EOS 15: exact preceding prefix",
      "passed" : true
    },
    {
      "name" : "EOS 15: stop reason",
      "passed" : true
    },
    {
      "name" : "EOS 15: only emitted tokens consumed",
      "passed" : true
    },
    {
      "name" : "committed cancellation 1: exact prefix",
      "passed" : true
    },
    {
      "name" : "committed cancellation 1: cancellation reason",
      "passed" : true
    },
    {
      "name" : "committed cancellation 1: typed cancellation",
      "passed" : true
    },
    {
      "name" : "committed cancellation 1: no unrequested fallback",
      "passed" : true
    },
    {
      "name" : "committed cancellation 1: pending output accounting",
      "passed" : true
    },
    {
      "name" : "committed cancellation 1: aligned reusable head",
      "passed" : true
    },
    {
      "name" : "committed cancellation 3: exact prefix",
      "passed" : true
    },
    {
      "name" : "committed cancellation 3: cancellation reason",
      "passed" : true
    },
    {
      "name" : "committed cancellation 3: typed cancellation",
      "passed" : true
    },
    {
      "name" : "committed cancellation 3: no unrequested fallback",
      "passed" : true
    },
    {
      "name" : "committed cancellation 3: pending output accounting",
      "passed" : true
    },
    {
      "name" : "committed cancellation 3: aligned reusable head",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-adaptive-mtp",
  "passed" : false
}

````

