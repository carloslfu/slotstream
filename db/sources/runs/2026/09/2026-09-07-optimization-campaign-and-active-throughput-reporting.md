---
type: run
id: 01m1xd9zgpd4vk7m0fw6jcrbph
created: 2026-09-07T07:46:14.166837+00:00
updated: 2026-09-07T07:46:14.473372+00:00
summary: Frozen complete campaign and paired active-emission reporting are executable
binary: Per-file exact binary/source identities retained; current-source release build did not publish a candidate
captured_at: 2026-09-07
command: python3 -m unittest optimization_campaign_test optimization_results_test; optimization_campaign.py prepare/status; optimization_results.py --packet campaign-preparation-v269
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Frozen complete campaign and paired active-emission reporting are executable
tool: python3
---
# Frozen complete campaign and paired active-emission reporting are executable

V266 adds optimization_campaign.py and optimization_results.py, their focused suites and nine portable workload templates preserving original thresholds. Preparation binds the complete same-build three-native/eight-paired/two-soak contract before a model launches. Run-one owns and records one sequential stage, refuses before claiming a stage when resources are unavailable, preserves every attempted failure, revalidates raw outputs/build/artifact hashes and requires all native plus eight paired prerequisites before either soak. Actual V269 prepare/status/report runs on V255 create thirteen unrun stages and no performance result; V269 is a workflow preparation on the older device seam, not the final current-source candidate. The original prerequisite suite30, soak11, final campaign13, reporting8 and final static17 tests pass. A first static fixture failure from a stale suite-order expectation is preserved and repaired. The full campaign fixture traverses13stages,256paired cells and120soak requests without launching a process; those are simulated fixtures, not live inference. Active emission rate uses(N-1)/sum(interTokenSeconds), excluding first-token latency and post-terminal work, while decode-phase rate remainsN/decodeSeconds. Percentages are medians of per-pair ratios within separately qualified workloads, with at least five eligible pairs; one-token requests have no active emission rate. Physical peaks use the maximum of successive preparation/generation intervals, never their sum. No final gain or equilibrium-throughput claim is produced.

## /Users/carlos/Projects/slotstream/.build/optimization/campaign-preparation-v269/packet.json

SHA-256 `3b697b7c29b3aa8603ce0aed70679bd0db80c4601efeafb603ad98c26b3933bf`; 21884 bytes.

````text
{
  "format": "slotstream-campaign-v1",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "457d65426cca792bd8c1bd28e7d5bbcc812664090b535eeb0d355302679995d6",
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
        "Sources/Slotstream/Layers.swift": "1522eb6f8ca71a0712ed9d918696b2175f96fe8a48b8447289a2a1966cd6b120",
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
        "Sources/Slotstream/Plan.swift": "fb788e98e388a2a4bed06743ada61c5f9f9173f237ef2a8f95cef82cd673d1ae",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
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
      "source_archive_sha256": "3fa7a653fe11e14661ebc6204c68deb2f0839bf2ef432fb9c0d45f935e36f3ef",
      "binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "created_at": "2026-09-07T07:23:38.019419+00:00",
  "scope": "Combined candidate qualification only; full release/client/resource acceptance and activation remain separate",
  "contract_sha256": "4ca8464ad0357ff4b7f8ae2b44ce2bc08b5864b3d4731d84b2c84ad793824cea",
  "stages": [
    "native/combined-plain",
    "native/combined-mtp",
    "native/read-failure-serving",
    "paired/short-one",
    "paired/unique-prose",
    "paired/sampled-short",
    "paired/mtp-resource",
    "paired/distinct-tail",
    "paired/complete-repeat",
    "paired/unique-with-retention",
    "paired/actual-default-one-token",
    "soak/off",
    "soak/on"
  ],
  "native_policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 10000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1800,
    "stop_on_new_swapouts": false
  },
  "drivers": {
    "optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "optimization_readiness.py": "ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc",
    "optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86"
  },
  "templates": {
    "actual-default-one-token.json": "8481bffb4721fbd594eca609506308480e7979a486c327732cba6ff138daf26b",
    "complete-repeat.json": "9b8308d23621b55ae70dfb34258571ed00a97c9ea2932127aa787d438085ba6e",
    "distinct-tail.json": "7d80ab65e1ed821e24922c050afc4ff24b83f9e3a2b560383efd4e7868aad59e",
    "mtp-resource.json": "5a0c57424e2097b5ec7b4199dd9ae28d40e24f6c4eef24d13098f3ce8d652613",
    "sampled-short.json": "ec97a77e98417def8f7489b5fd58ded65790659e15ebe6f4d2328c8688d76a7a",
    "short-one.json": "5c736b2eec31378f0b3d2beb64d20561569ce8dfd765e363afde72b0755278a9",
    "soak.json": "0b79f271e4dbaabe77802a54a125c371ee4519848c2e01e5019bd5d8a36a065b",
    "unique-prose.json": "6831b8f47138d175f28ac9716bacaa8c937515a970df709393004bff84a45c35",
    "unique-with-retention.json": "0b2593dab6a12e10226dd94d60c43d40b085160b2c23680b79545d7fe41dbb2d"
  }
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/campaign-preparation-v269/qualification-contract.json

SHA-256 `4ca8464ad0357ff4b7f8ae2b44ce2bc08b5864b3d4731d84b2c84ad793824cea`; 68605 bytes.

````text
{
  "format": "slotstream-qualification-v1",
  "build_identity": {
    "binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64",
    "source_archive_sha256": "3fa7a653fe11e14661ebc6204c68deb2f0839bf2ef432fb9c0d45f935e36f3ef",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "native": {
    "combined-plain": {
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
        "optimization-state-check",
        "--variant",
        "integrated",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "environment": {}
    },
    "combined-mtp": {
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
        "optimization-state-check",
        "--variant",
        "integrated-mtp",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "environment": {}
    },
    "read-failure-serving": {
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
        "optimization-state-check",
        "--variant",
        "read-failure-serving",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "environment": {}
    }
  },
  "paired_protocols": {
    "short-one": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
      "memory_gb": 8.1,
      "mtp": "off",
      "raw": true,
      "seed": 7,
      "rounds": 16,
      "comparison_basis": "fixed-pool",
      "maximum_sampled_footprint_bytes": 8100000000,
      "require_nominal_power_state": true,
      "between_cells_seconds": 60,
      "model_reservation_wait_seconds": 1800,
      "arms": {
        "reference": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "0",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
            "SLOTSTREAM_OPT_COMPACT_MTP": "0",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "0",
            "SLOTSTREAM_OPT_FUSED_ROPE": "0",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "0"
          }
        },
        "combined": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "1",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
            "SLOTSTREAM_OPT_COMPACT_MTP": "1",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "1",
            "SLOTSTREAM_OPT_FUSED_ROPE": "1",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "1"
          }
        }
      },
      "label": "integrated-short-one",
      "classification": "Frozen combined paired qualification",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
      "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
      "max_tokens": 1,
      "minimum_output_tokens": 1,
      "acceptance": {
        "minimum_pairs": 5,
        "minimum_median_client_reduction": 0.05,
        "minimum_positive_fraction": 0.8,
        "all_outputs_exact": true,
        "replacement_rounds": 0
      },
      "initial_workspace_quiet": {
        "stable_seconds": 180,
        "maximum_wait_seconds": 1800
      },
      "stop_on_workspace_contention": true,
      "startup_acceptance": {
        "minimum_pairs": 5,
        "maximum_median_first_job_regression": 0.05,
        "all_outputs_exact": true
      },
      "frozen_binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64"
    },
    "unique-prose": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
      "memory_gb": 8.1,
      "mtp": "off",
      "raw": true,
      "seed": 7,
      "rounds": 16,
      "comparison_basis": "fixed-pool",
      "maximum_sampled_footprint_bytes": 8100000000,
      "require_nominal_power_state": true,
      "between_cells_seconds": 60,
      "model_reservation_wait_seconds": 1800,
      "arms": {
        "reference": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "0",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
            "SLOTSTREAM_OPT_COMPACT_MTP": "0",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "0",
            "SLOTSTREAM_OPT_FUSED_ROPE": "0",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "0"
          }
        },
        "combined": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "1",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
            "SLOTSTREAM_OPT_COMPACT_MTP": "1",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "1",
            "SLOTSTREAM_OPT_FUSED_ROPE": "1",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "1"
          }
        }
      },
      "label": "integrated-unique-prose",
      "classification": "Frozen combined paired qualification",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
      "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
      "max_tokens": 16,
      "minimum_output_tokens": 16,
      "acceptance": {
        "minimum_pairs": 5,
        "maximum_median_client_regression": 0.05,
        "minimum_positive_fraction": 0,
        "all_outputs_exact": true,
        "replacement_rounds": 0,
        "minimum_active_savings_bytes": 300000000,
        "minimum_sampled_peak_savings_bytes": 200000000
      },
      "initial_workspace_quiet": {
        "stable_seconds": 180,
        "maximum_wait_seconds": 1800
      },
      "stop_on_workspace_contention": true,
      "startup_acceptance": {
        "minimum_pairs": 5,
        "maximum_median_first_job_regression": 0.05,
        "all_outputs_exact": true
      },
      "frozen_binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64"
    },
    "sampled-short": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
      "memory_gb": 8.1,
      "mtp": "off",
      "raw": true,
      "seed": 7,
      "rounds": 16,
      "comparison_basis": "fixed-pool",
      "maximum_sampled_footprint_bytes": 8100000000,
      "require_nominal_power_state": true,
      "between_cells_seconds": 60,
      "model_reservation_wait_seconds": 1800,
      "arms": {
        "reference": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "0",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
            "SLOTSTREAM_OPT_COMPACT_MTP": "0",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "0",
            "SLOTSTREAM_OPT_FUSED_ROPE": "0",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "0"
          }
        },
        "combined": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "1",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
            "SLOTSTREAM_OPT_COMPACT_MTP": "1",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "1",
            "SLOTSTREAM_OPT_FUSED_ROPE": "1",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "1"
          }
        }
      },
      "label": "integrated-sampled-short",
      "classification": "Frozen combined paired qualification",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
      "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
      "max_tokens": 16,
      "minimum_output_tokens": 16,
      "acceptance": {
        "minimum_pairs": 5,
        "maximum_median_client_regression": 0.05,
        "minimum_positive_fraction": 0,
        "all_outputs_exact": true,
        "replacement_rounds": 0,
        "minimum_active_savings_bytes": 300000000,
        "minimum_sampled_peak_savings_bytes": 200000000
      },
      "sampling": {
        "temperature": 0.7,
        "top_k": 40,
        "top_p": 0.8,
        "min_p": 0.05,
        "presence_penalty": 1.1
      },
      "initial_workspace_quiet": {
        "stable_seconds": 180,
        "maximum_wait_seconds": 1800
      },
      "stop_on_workspace_contention": true,
      "startup_acceptance": {
        "minimum_pairs": 5,
        "maximum_median_first_job_regression": 0.05,
        "all_outputs_exact": true
      },
      "frozen_binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64"
    },
    "mtp-resource": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
      "memory_gb": 10,
      "mtp": "on",
      "raw": true,
      "seed": 7,
      "rounds": 16,
      "comparison_basis": "fixed-pool",
      "maximum_sampled_footprint_bytes": 10000000000,
      "require_nominal_power_state": true,
      "between_cells_seconds": 60,
      "model_reservation_wait_seconds": 1800,
      "arms": {
        "reference": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "0",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
            "SLOTSTREAM_OPT_COMPACT_MTP": "0",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "0",
            "SLOTSTREAM_OPT_FUSED_ROPE": "0",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "0"
          }
        },
        "combined": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "1",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
            "SLOTSTREAM_OPT_COMPACT_MTP": "1",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "1",
            "SLOTSTREAM_OPT_FUSED_ROPE": "1",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "1"
          }
        }
      },
      "label": "integrated-mtp-resource",
      "classification": "Frozen combined paired qualification",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
      "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
      "max_tokens": 16,
      "minimum_output_tokens": 16,
      "acceptance": {
        "minimum_pairs": 5,
        "maximum_median_client_regression": 0.05,
        "minimum_positive_fraction": 0,
        "all_outputs_exact": true,
        "replacement_rounds": 0,
        "minimum_active_savings_bytes": 300000000,
        "minimum_sampled_peak_savings_bytes": 200000000
      },
      "initial_workspace_quiet": {
        "stable_seconds": 180,
        "maximum_wait_seconds": 1800
      },
      "stop_on_workspace_contention": true,
      "startup_acceptance": {
        "minimum_pairs": 5,
        "maximum_median_first_job_regression": 0.05,
        "all_outputs_exact": true
      },
      "frozen_binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64"
    },
    "distinct-tail": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
      "memory_gb": 8.1,
      "mtp": "off",
      "raw": true,
      "seed": 7,
      "rounds": 16,
      "comparison_basis": "fixed-pool",
      "maximum_sampled_footprint_bytes": 8100000000,
      "require_nominal_power_state": true,
      "between_cells_seconds": 60,
      "model_reservation_wait_seconds": 1800,
      "arms": {
        "reference": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "0",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
            "SLOTSTREAM_OPT_COMPACT_MTP": "0",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "0",
            "SLOTSTREAM_OPT_FUSED_ROPE": "0",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "0"
          }
        },
        "combined": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "1",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "1",
            "SLOTSTREAM_OPT_COMPACT_MTP": "1",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "1",
            "SLOTSTREAM_OPT_FUSED_ROPE": "1",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "256",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "1"
          }
        }
      },
      "label": "integrated-distinct-tail",
      "classification": "Frozen combined paired qualification",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose-distinct-tail.txt",
      "fixture_sha256": "d13b427927e9266ae8a9949b85a704ff6439df50aea54bfd7b5bf46f12b7c784",
      "max_tokens": 16,
      "minimum_output_tokens": 16,
      "acceptance": {
        "minimum_pairs": 5,
        "minimum_median_client_reduction": 0.05,
        "minimum_positive_fraction": 0.8,
        "all_outputs_exact": true,
        "replacement_rounds": 0
      },
      "prefix_cache": {
        "expected_reused_tokens": {
          "reference": 0,
          "combined": 256
        },
        "partial_prefix": true
      },
      "warmup_fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
      "warmup_fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
      "work_constraints": {
        "reference": {
          "completePromptHits": {
            "min": 0,
            "max": 0
          },
          "prefillTokens": {
            "min": 445,
            "max": 445
          }
        },
        "combined": {
          "completePromptHits": {
            "min": 0,
            "max": 0
          },
          "prefillTokens": {
            "min": 189,
            "max": 189
          }
        }
      },
      "stop_on_workspace_contention": true,
      "initial_workspace_quiet": {
        "stable_seconds": 180,
        "maximum_wait_seconds": 1800
      },
      "startup_acceptance": {
        "minimum_pairs": 5,
        "maximum_median_first_job_regression": 0.05,
        "all_outputs_exact": true
      },
      "frozen_binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64"
    },
    "complete-repeat": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
      "memory_gb": 8.1,
      "mtp": "off",
      "raw": true,
      "seed": 7,
      "rounds": 16,
      "comparison_basis": "fixed-pool",
      "maximum_sampled_footprint_bytes": 8100000000,
      "require_nominal_power_state": true,
      "between_cells_seconds": 60,
      "model_reservation_wait_seconds": 1800,
      "arms": {
        "reference": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "0",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
            "SLOTSTREAM_OPT_COMPACT_MTP": "0",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "0",
            "SLOTSTREAM_OPT_FUSED_ROPE": "0",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "0"
          }
        },
        "combined": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "1",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "1",
            "SLOTSTREAM_OPT_COMPACT_MTP": "1",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "1",
            "SLOTSTREAM_OPT_FUSED_ROPE": "1",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "256",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "1"
          }
        }
      },
      "label": "integrated-complete-repeat",
      "classification": "Frozen combined paired qualification",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
      "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
      "max_tokens": 16,
      "minimum_output_tokens": 16,
      "acceptance": {
        "minimum_pairs": 5,
        "minimum_median_client_reduction": 0.05,
        "minimum_positive_fraction": 0.8,
        "all_outputs_exact": true,
        "replacement_rounds": 0
      },
      "prefix_cache": {
        "expected_reused_tokens": {
          "reference": 0,
          "combined": 440
        },
        "complete_prompt": true,
        "expected_warmup_checkpoint_stores": {
          "reference": 0,
          "combined": 1
        }
      },
      "work_constraints": {
        "reference": {
          "completePromptHits": {
            "min": 0,
            "max": 0
          },
          "completePromptStores": {
            "min": 0,
            "max": 0
          }
        },
        "combined": {
          "completePromptHits": {
            "min": 1,
            "max": 1
          },
          "completePromptStores": {
            "min": 0,
            "max": 0
          },
          "prefillTokens": {
            "min": 0,
            "max": 0
          },
          "prefillRecords": {
            "min": 0,
            "max": 0
          }
        }
      },
      "required_equal_work": [
        "decodeTokens",
        "draftedTokens",
        "verifyPasses"
      ],
      "stop_on_workspace_contention": true,
      "initial_workspace_quiet": {
        "stable_seconds": 180,
        "maximum_wait_seconds": 1800
      },
      "startup_acceptance": {
        "minimum_pairs": 5,
        "maximum_median_first_job_regression": 0.05,
        "all_outputs_exact": true
      },
      "frozen_binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64"
    },
    "unique-with-retention": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
      "memory_gb": 8.1,
      "mtp": "off",
      "raw": true,
      "seed": 7,
      "rounds": 16,
      "comparison_basis": "fixed-pool",
      "maximum_sampled_footprint_bytes": 8100000000,
      "require_nominal_power_state": true,
      "between_cells_seconds": 60,
      "model_reservation_wait_seconds": 1800,
      "arms": {
        "reference": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "0",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
            "SLOTSTREAM_OPT_COMPACT_MTP": "0",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "0",
            "SLOTSTREAM_OPT_FUSED_ROPE": "0",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "0"
          }
        },
        "combined": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "1",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "1",
            "SLOTSTREAM_OPT_COMPACT_MTP": "1",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "1",
            "SLOTSTREAM_OPT_FUSED_ROPE": "1",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "256",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "1"
          }
        }
      },
      "label": "integrated-unique-with-retention",
      "classification": "Frozen combined paired qualification",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
      "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
      "max_tokens": 16,
      "minimum_output_tokens": 16,
      "acceptance": {
        "minimum_pairs": 5,
        "maximum_median_client_regression": 0.05,
        "minimum_positive_fraction": 0,
        "all_outputs_exact": true,
        "replacement_rounds": 0
      },
      "prefix_cache": {
        "expected_reused_tokens": {
          "reference": 0,
          "combined": 0
        },
        "retention_only": true
      },
      "work_constraints": {
        "reference": {
          "completePromptStores": {
            "min": 0,
            "max": 0
          },
          "completePromptHits": {
            "min": 0,
            "max": 0
          }
        },
        "combined": {
          "completePromptStores": {
            "min": 1,
            "max": 1
          },
          "completePromptHits": {
            "min": 0,
            "max": 0
          }
        }
      },
      "required_equal_work": [
        "prefillTokens",
        "decodeTokens",
        "draftedTokens",
        "verifyPasses"
      ],
      "warmup_fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
      "warmup_fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
      "stop_on_workspace_contention": true,
      "initial_workspace_quiet": {
        "stable_seconds": 180,
        "maximum_wait_seconds": 1800
      },
      "startup_acceptance": {
        "minimum_pairs": 5,
        "maximum_median_first_job_regression": 0.05,
        "all_outputs_exact": true
      },
      "frozen_binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64"
    },
    "actual-default-one-token": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
      "memory_gb": 8.1,
      "mtp": "off",
      "raw": true,
      "seed": 7,
      "rounds": 16,
      "comparison_basis": "fixed-pool",
      "maximum_sampled_footprint_bytes": 8100000000,
      "require_nominal_power_state": true,
      "between_cells_seconds": 60,
      "model_reservation_wait_seconds": 1800,
      "arms": {
        "reference": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {
            "SLOTSTREAM_OPT_COMPACT_STATE": "0",
            "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
            "SLOTSTREAM_OPT_COMPACT_MTP": "0",
            "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
            "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
            "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
            "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
            "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
            "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
            "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
            "SLOTSTREAM_OPT_INDEXER_RAW": "0",
            "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
            "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
            "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
            "SLOTSTREAM_OPT_SWEEP_TILES": "0",
            "SLOTSTREAM_OPT_INDEXER_TILES": "0",
            "SLOTSTREAM_OPT_SHARED_ROPE": "0",
            "SLOTSTREAM_OPT_FUSED_ROPE": "0",
            "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
            "SLOTSTREAM_OPT_GDN_RECORD": "0",
            "SLOTSTREAM_OPT_PLE_TILES": "0",
            "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
            "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
            "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
            "SLOTSTREAM_OPT_MTP_TAIL": "0",
            "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
            "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
            "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
            "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
            "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
            "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
            "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
            "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
            "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
            "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
            "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
            "SLOTSTREAM_OPT_READ_HANDLES": "0",
            "SLOTSTREAM_OPT_COMPILED_NORM": "0",
            "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
            "SLOTSTREAM_OPT_NGRAM_RING": "0",
            "SLOTSTREAM_OPT_EXPERT_MAP": "0",
            "SLOTSTREAM_OPT_POOL_PINS": "0",
            "SLOTSTREAM_OPT_SLOT_SLICES": "0",
            "SLOTSTREAM_OPT_SLOT_WORDS": "0",
            "SLOTSTREAM_OPT_SLOT_CPU": "0",
            "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
            "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
            "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
            "SLOTSTREAM_OPT_VISION_PADDING": "0",
            "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
            "SLOTSTREAM_OPT_READ_SCOPE": "0",
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
            "SLOTSTREAM_EMBEDDING_ROWS": "0"
          }
        },
        "combined": {
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
          "chunk": 256,
          "env": {}
        }
      },
      "label": "integrated-actual-default-one-token",
      "classification": "Frozen combined paired qualification",
      "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
      "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
      "max_tokens": 1,
      "minimum_output_tokens": 1,
      "acceptance": {
        "minimum_pairs": 5,
        "maximum_median_client_regression": 0.05,
        "minimum_positive_fraction": 0,
        "all_outputs_exact": true,
        "replacement_rounds": 0
      },
      "prefix_cache": {
        "expected_reused_tokens": {
          "reference": 0,
          "combined": 0
        },
        "retention_only": true
      },
      "work_constraints": {
        "reference": {
          "completePromptStores": {
            "min": 0,
            "max": 0
          },
          "completePromptHits": {
            "min": 0,
            "max": 0
          }
        },
        "combined": {
          "completePromptStores": {
            "min": 1,
            "max": 1
          },
          "completePromptHits": {
            "min": 0,
            "max": 0
          }
        }
      },
      "required_equal_work": [
        "prefillTokens",
        "decodeTokens",
        "draftedTokens",
        "verifyPasses"
      ],
      "warmup_fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
      "warmup_fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
      "stop_on_workspace_contention": true,
      "initial_workspace_quiet": {
        "stable_seconds": 180,
        "maximum_wait_seconds": 1800
      },
      "startup_acceptance": {
        "minimum_pairs": 5,
        "maximum_median_first_job_regression": 0.05,
        "all_outputs_exact": true
      },
      "frozen_binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64"
    }
  },
  "soak_modes": {
    "off": {
      "classification": "Frozen combined lifetime qualification",
      "purpose": "Bounded lifetime qualification of the final combined runtime in one long-lived server",
      "memory_gb": 10,
      "max_context": 32768,
      "warmup_cycles": 2,
      "measured_cycles": 8,
      "maximum_duration_seconds_per_mode": 900,
      "maximum_prompt_tokens": 1024,
      "maximum_output_tokens": 8,
      "sequence": [
        {
          "name": "short",
          "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
          "raw": true,
          "outputs": 8,
          "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9"
        },
        {
          "name": "prose",
          "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
          "raw": true,
          "outputs": 8,
          "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b"
        },
        {
          "name": "prose-repeat",
          "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
          "raw": true,
          "outputs": 8,
          "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b"
        },
        {
          "name": "prose-distinct-tail",
          "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose-distinct-tail.txt",
          "raw": true,
          "outputs": 8,
          "fixture_sha256": "d13b427927e9266ae8a9949b85a704ff6439df50aea54bfd7b5bf46f12b7c784"
        },
        {
          "name": "sampled-short",
          "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
          "raw": true,
          "outputs": 8,
          "sampling": {
            "temperature": 0.7,
            "top_k": 40,
            "top_p": 0.8,
            "min_p": 0.05,
            "presence_penalty": 1.1
          },
          "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9"
        },
        {
          "name": "image",
          "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/prompt.txt",
          "image": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-512.png",
          "raw": false,
          "think": false,
          "outputs": 1,
          "fixture_sha256": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
          "image_sha256": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed"
        }
      ],
      "acceptance": {
        "all_expected_requests_complete": true,
        "exact_per_position_replay_after_warmup": true,
        "maximum_sampled_physical_peak_bytes": 10000000000,
        "maximum_active_growth_bytes_per_position": 67108864,
        "maximum_physical_end_growth_bytes_per_position": 268435456,
        "maximum_cached_embedding_payload_bytes": 11796480,
        "maximum_prefix_entries": 4,
        "prefix_charge_within_declared_capacity": true,
        "minimum_clean_observations_per_position": 5,
        "minimum_clean_early_observations_per_position": 2,
        "minimum_clean_late_observations_per_position": 2,
        "nominal_power_and_unchanged_request_vm_for_resource_observations": true,
        "replacement_cycles": 0
      },
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "env": {},
      "mtp": "off",
      "frozen_binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64"
    },
    "on": {
      "classification": "Frozen combined lifetime qualification",
      "purpose": "Bounded lifetime qualification of the final combined runtime in one long-lived server",
      "memory_gb": 10,
      "max_context": 32768,
      "warmup_cycles": 2,
      "measured_cycles": 8,
      "maximum_duration_seconds_per_mode": 900,
      "maximum_prompt_tokens": 1024,
      "maximum_output_tokens": 8,
      "sequence": [
        {
          "name": "short",
          "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
          "raw": true,
          "outputs": 8,
          "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9"
        },
        {
          "name": "prose",
          "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
          "raw": true,
          "outputs": 8,
          "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b"
        },
        {
          "name": "prose-repeat",
          "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
          "raw": true,
          "outputs": 8,
          "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b"
        },
        {
          "name": "prose-distinct-tail",
          "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose-distinct-tail.txt",
          "raw": true,
          "outputs": 8,
          "fixture_sha256": "d13b427927e9266ae8a9949b85a704ff6439df50aea54bfd7b5bf46f12b7c784"
        },
        {
          "name": "sampled-short",
          "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
          "raw": true,
          "outputs": 8,
          "sampling": {
            "temperature": 0.7,
            "top_k": 40,
            "top_p": 0.8,
            "min_p": 0.05,
            "presence_penalty": 1.1
          },
          "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9"
        },
        {
          "name": "image",
          "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/prompt.txt",
          "image": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-512.png",
          "raw": false,
          "think": false,
          "outputs": 1,
          "fixture_sha256": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
          "image_sha256": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed"
        }
      ],
      "acceptance": {
        "all_expected_requests_complete": true,
        "exact_per_position_replay_after_warmup": true,
        "maximum_sampled_physical_peak_bytes": 10000000000,
        "maximum_active_growth_bytes_per_position": 67108864,
        "maximum_physical_end_growth_bytes_per_position": 268435456,
        "maximum_cached_embedding_payload_bytes": 11796480,
        "maximum_prefix_entries": 4,
        "prefix_charge_within_declared_capacity": true,
        "minimum_clean_observations_per_position": 5,
        "minimum_clean_early_observations_per_position": 2,
        "minimum_clean_late_observations_per_position": 2,
        "nominal_power_and_unchanged_request_vm_for_resource_observations": true,
        "replacement_cycles": 0
      },
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "env": {},
      "mtp": "on",
      "frozen_binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64"
    }
  }
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/actual-results.json

SHA-256 `0de1c904ec18d0b428ab1e9eea8eae3bd9049e744a32e21094b2e504ade7b8f4`; 1265 bytes.

````text
{
  "classification": "Descriptive paired measurements within individually qualified workloads",
  "build_identity": {
    "binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64",
    "source_archive_sha256": "3fa7a653fe11e14661ebc6204c68deb2f0839bf2ef432fb9c0d45f935e36f3ef",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "contract_sha256": "4ca8464ad0357ff4b7f8ae2b44ce2bc08b5864b3d4731d84b2c84ad793824cea",
  "reporter_sha256": "d4b9b0d6e82dd5d38f043c1b681cede8cfc2c764bcf80b9031e8438b51fece9c",
  "qualification_complete": false,
  "activation_performed": false,
  "workloads": {},
  "percentage_method": "Median of per-pair percentage improvements; positive means faster or less memory. No cross-workload aggregation.",
  "active_emission_method": "(output tokens - 1) / sum(interTokenSeconds), between the first and last sampled emissions. No rate for one-token requests.",
  "decode_phase_method": "output tokens / decodeSeconds, including any terminal work and retention bookkeeping.",
  "limits": "Active emission rates cover these short fixed workloads; they do not establish longer-run equilibrium throughput. Tensor allocation and sampled process footprint are distinct."
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/actual-results.stdout

SHA-256 `0de1c904ec18d0b428ab1e9eea8eae3bd9049e744a32e21094b2e504ade7b8f4`; 1265 bytes.

````text
{
  "classification": "Descriptive paired measurements within individually qualified workloads",
  "build_identity": {
    "binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64",
    "source_archive_sha256": "3fa7a653fe11e14661ebc6204c68deb2f0839bf2ef432fb9c0d45f935e36f3ef",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "contract_sha256": "4ca8464ad0357ff4b7f8ae2b44ce2bc08b5864b3d4731d84b2c84ad793824cea",
  "reporter_sha256": "d4b9b0d6e82dd5d38f043c1b681cede8cfc2c764bcf80b9031e8438b51fece9c",
  "qualification_complete": false,
  "activation_performed": false,
  "workloads": {},
  "percentage_method": "Median of per-pair percentage improvements; positive means faster or less memory. No cross-workload aggregation.",
  "active_emission_method": "(output tokens - 1) / sum(interTokenSeconds), between the first and last sampled emissions. No rate for one-token requests.",
  "decode_phase_method": "output tokens / decodeSeconds, including any terminal work and retention bookkeeping.",
  "limits": "Active emission rates cover these short fixed workloads; they do not establish longer-run equilibrium throughput. Tensor allocation and sampled process footprint are distinct."
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/actual-status.json

SHA-256 `41d24da72a9601c86c18250670401a82892f20ab1ebfcd92c0c81bfc0bd4b9f8`; 1198 bytes.

````text
{
  "scope": "Combined candidate qualification only; full release/client/resource acceptance and activation remain separate",
  "stages": [
    {
      "stage": "native/combined-plain",
      "status": "unrun"
    },
    {
      "stage": "native/combined-mtp",
      "status": "unrun"
    },
    {
      "stage": "native/read-failure-serving",
      "status": "unrun"
    },
    {
      "stage": "paired/short-one",
      "status": "unrun"
    },
    {
      "stage": "paired/unique-prose",
      "status": "unrun"
    },
    {
      "stage": "paired/sampled-short",
      "status": "unrun"
    },
    {
      "stage": "paired/mtp-resource",
      "status": "unrun"
    },
    {
      "stage": "paired/distinct-tail",
      "status": "unrun"
    },
    {
      "stage": "paired/complete-repeat",
      "status": "unrun"
    },
    {
      "stage": "paired/unique-with-retention",
      "status": "unrun"
    },
    {
      "stage": "paired/actual-default-one-token",
      "status": "unrun"
    },
    {
      "stage": "soak/off",
      "status": "unrun"
    },
    {
      "stage": "soak/on",
      "status": "unrun"
    }
  ],
  "qualification_complete": false,
  "activation_performed": false
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/before/Tools/optimization_prerequisites_test.py

SHA-256 `215ab0cead0daafd4d95f469254870159c66b9d719997410838cea83c151d41b`; 19262 bytes.

````text
"""Receipt binding tests; benchmark statistics are tested by prefill_bench_test."""
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from optimization_soak import validate_prerequisites
from prefill_bench import digest


class PrerequisiteTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.identity = {k: c * 64 for k, c in [('binary_sha256', 'a'),
            ('source_archive_sha256', 'b'), ('metallib_sha256', 'c')]}
        self.build = {'identity': self.identity}
        self.decision = [{'candidate': 'combined', 'passed': True, 'checks': {'fixture': True}}]
        self.protocol = {'mtp': 'off', 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '1'},
                         'prerequisites': {'native': {}, 'paired': {}}}
        for name, variant in [('combined-plain', 'integrated'), ('combined-mtp', 'integrated-mtp'),
                              ('read-failure-serving', 'read-failure-serving')]:
            entry = self.entry('native', name)
            self.write(entry, 'manifest.json', {'identity': self.identity, 'passed': True, 'exit_code': 0,
                'assertions': 1, 'command': ['/unused/slotstream', 'optimization-state-check', '--variant', variant]})
            self.write(entry, 'stdout.txt', {'passed': True, 'items': [{'passed': True}]})
        for name in ['short-one', 'unique-prose', 'sampled-short', 'mtp-resource', 'distinct-tail',
                     'complete-repeat', 'unique-with-retention', 'actual-default-one-token']:
            entry = self.entry('paired', name)
            gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
            if name in ['short-one', 'distinct-tail', 'complete-repeat']:
                gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
            else:
                gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
            if name in ['unique-prose', 'sampled-short', 'mtp-resource']:
                gate.update(minimum_active_savings_bytes=300_000_000, minimum_sampled_peak_savings_bytes=200_000_000)
            self.write(entry, 'manifest.json', {'protocol': {'rounds': 16,
                'mtp': 'off', 'minimum_output_tokens': 1, 'max_tokens': 1,
                'maximum_sampled_footprint_bytes': 8_100_000_000,
                'arms': {arm: {'chunk': 256, 'env': {}} for arm in ['reference', 'combined']},
                'acceptance': gate,
                'startup_acceptance': {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05,
                    'all_outputs_exact': True}},
                'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
            self.write(entry, 'completion.json', {'interrupted': False, 'stopped_early': False,
                'planned_cells': 32, 'recorded_cells': 32, 'acceptance': self.decision,
                'startup_acceptance': self.decision})
            rows = [self.response_row(i, arm) for i in range(1, 17) for arm in ['reference', 'combined']]
            self.write(entry, 'results.jsonl', rows)
            for row in rows:
                self.write(entry, f"{row['round']}-{row['arm']}/warmup.json", self.warmup_response(row))
        self.modify('paired', 'actual-default-one-token', 'manifest.json',
            lambda m: m['protocol'].update(arms={'reference': {'chunk': 256, 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}},
                'combined': {'chunk': 256, 'env': {}}}, max_tokens=1, minimum_output_tokens=1,
                prefix_cache={'retention_only': True, 'expected_reused_tokens': {'reference': 0, 'combined': 0}}))
        self.contract_path = self.root / 'qualification-contract.json'
        self.contract = {'format': 'slotstream-qualification-v1', 'build_identity': copy.deepcopy(self.identity),
            'native': {}, 'paired_protocols': {}, 'soak_modes': {}}
        for name, entry in self.protocol['prerequisites']['native'].items():
            manifest = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
            self.contract['native'][name] = {'command': manifest['command'], 'environment': {}}
        for name, entry in self.protocol['prerequisites']['paired'].items():
            self.contract['paired_protocols'][name] = json.loads(
                (Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        for mode in ['off', 'on']:
            self.contract['soak_modes'][mode] = {'mtp': mode, 'env': copy.deepcopy(self.protocol['env'])}
        self.freeze_contract()

    @staticmethod
    def response_row(number, arm):
        return {'round': number, 'arm': arm, 'valid': True,
            'client_seconds': 1.0, 'startup_seconds': 1.0,
            'startup_and_warmup_valid': True, 'text': 'measured',
            'first_request': {'prompt_ids': [17], 'output_ids': [7], 'text': 'first',
                'effective_mtp': False, 'effective_pool_slots': 640, 'complete_seconds_from_launch': 2.0},
            'metrics': {'schema_version': 1, 'prompt_ids': [101, 102], 'output_ids': [7],
                'effective_mtp': False, 'effective_pool_slots': 640, 'effective_prefill_chunk': 256,
                'stats': {'prefillSeconds': .5, 'decodeSeconds': .5, 'requestSeconds': 1.0,
                    'imageEncodeSeconds': 0.0, 'prefillRecords': 1, 'decodeRecords': 0,
                    'prefillTokens': 2, 'decodeTokens': 1, 'promptTokens': 2, 'prefillPasses': [2],
                    'lifetimeRSSPeakBytes': 1_000_000, 'sampledFootprint': {'peakBytes': 2_000_000}}}}

    def execution_mutation(self, change):
        self.modify('paired', 'unique-prose', 'results.jsonl', lambda rows: change(rows[-1]))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    @staticmethod
    def warmup_response(row):
        metrics = copy.deepcopy(row['metrics'])
        metrics.update({key: row['first_request'][key] for key in
            ['prompt_ids', 'output_ids', 'effective_mtp', 'effective_pool_slots']})
        count = len(metrics['prompt_ids'])
        metrics['stats'].update(promptTokens=count, prefillTokens=count, prefillPasses=[count])
        return {'text': row['first_request']['text'], 'metrics': metrics}

    def test_vm_excluded_warmup_peak_overflow_still_fails(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics']['stats']['sampledFootprint'].update(peakBytes=8_100_000_001))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_warmup_body_must_match_the_captured_first_request(self):
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics'].update(output_ids=[8]))
        with self.assertRaisesRegex(ValueError, 'hashed warmup response'):
            self.validate()

    def test_every_warmup_body_requires_an_unchanged_digest(self):
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        path = Path(entry['directory'])/'16-combined/warmup.json'
        path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'):
            self.validate()

    def test_warmup_body_without_a_digest_is_not_accepted(self):
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        del entry['sha256']['16-combined/warmup.json']
        with self.assertRaisesRegex(ValueError, 'digest differs'):
            self.validate()

    def test_vm_excluded_measured_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_excluded_first_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity')
            row['first_request']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_vm_excluded_absolute_peak_overflow_still_fails(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['stats']['sampledFootprint']['peakBytes'] = 8_100_000_001
        self.execution_mutation(mutate)

    def test_request_failure_is_not_a_discardable_timing_sample(self):
        self.execution_mutation(lambda row: row.update(valid=False, error='HTTP 500 fixture'))

    def test_runtime_error_in_completed_measured_metadata_still_fails(self):
        self.execution_mutation(lambda row: row['metrics']['stats'].update(runtimeError='fixture failure'))

    def test_runtime_error_in_completed_first_metadata_still_fails(self):
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics']['stats'].update(runtimeError='fixture failure'))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_measured_token_counters_must_match_captured_ids(self):
        self.execution_mutation(lambda row: row['metrics']['stats'].update(decodeTokens=2))

    def test_first_token_counters_must_match_captured_ids(self):
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics']['stats'].update(promptTokens=3))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_reused_and_computed_tokens_must_account_for_the_whole_prompt(self):
        self.execution_mutation(lambda row: row['metrics']['stats'].update(reusedPrefixTokens=1))

    def test_preflight_refusal_leaves_the_final_matrix_incomplete(self):
        def mutate(row):
            row.pop('metrics'); row.pop('first_request')
            row.update(valid=False, error='InsufficientHeadroom fixture')
        self.execution_mutation(mutate)

    def test_completed_wrong_configuration_is_not_a_discardable_sample(self):
        def mutate(row):
            row.update(valid=False)
            row['metrics']['effective_prefill_chunk'] = 512
        self.execution_mutation(mutate)

    def test_wrong_or_truncated_token_metadata_is_not_discardable(self):
        self.execution_mutation(lambda row: row['metrics'].update(output_ids=[]))

    def test_vm_excluded_identical_complete_responses_remain_eligible_for_correctness(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.assertEqual(len(self.validate()), 12)

    def test_actual_default_guard_rejects_forced_controls_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p['arms']['combined']['env'].update(SLOTSTREAM_OPT_FINAL_FORWARD='1'))

    def test_actual_default_guard_rejects_disabled_retention_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.pop('prefix_cache'))

    def test_actual_default_guard_rejects_larger_reply_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.update(max_tokens=16, minimum_output_tokens=16))

    def actual_default_mutation(self, change):
        name = 'actual-default-one-token'
        self.modify('paired', name, 'manifest.json', lambda m: change(m['protocol']))
        entry = self.protocol['prerequisites']['paired'][name]
        self.contract['paired_protocols'][name] = json.loads((Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        self.freeze_contract()
        with self.assertRaisesRegex(ValueError, 'actual-default guard'):
            self.validate()

    def freeze_contract(self):
        self.contract_path.write_text(json.dumps(self.contract))
        self.protocol['qualification_contract'] = {'path': str(self.contract_path),
            'sha256': digest(self.contract_path)}

    def entry(self, kind, name):
        path = self.root / name; path.mkdir()
        entry = {'directory': str(path), 'sha256': {}}
        self.protocol['prerequisites'][kind][name] = entry
        return entry

    def write(self, entry, name, data):
        path = Path(entry['directory']) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(''.join(json.dumps(row) + '\n' for row in data)
                        if name.endswith('jsonl') else json.dumps(data))
        entry['sha256'][name] = digest(path)

    def modify(self, kind, name, file, change):
        entry = self.protocol['prerequisites'][kind][name]
        path = Path(entry['directory']) / file
        data = ([json.loads(line) for line in path.read_text().splitlines()]
                if file.endswith('jsonl') else json.loads(path.read_text()))
        change(data); self.write(entry, file, data)

    def validate(self, *, recomputed=None):
        with ExitStack() as stack:
            summary = stack.enter_context(patch('optimization_soak.bench.summaries', return_value=['fixture']))
            acceptance = stack.enter_context(patch('optimization_soak.bench.acceptance_results',
                return_value=self.decision if recomputed is None else recomputed))
            startup = stack.enter_context(patch('optimization_soak.bench.startup_acceptance_results',
                return_value=self.decision))
            result = validate_prerequisites(self.protocol, self.build)
            self.assertEqual((summary.call_count, acceptance.call_count, startup.call_count), (8, 8, 8))
            return result

    def test_complete_same_build_evidence_is_recomputed_and_accepted(self):
        self.assertEqual(len(self.validate()), 12)
        self.protocol['mtp'] = 'on'
        self.assertEqual(self.validate()['qualification_contract'], self.contract)

    def test_different_soak_controls_cannot_borrow_passing_evidence(self):
        self.protocol['env']['SLOTSTREAM_OPT_FINAL_FORWARD'] = '0'
        with self.assertRaisesRegex(ValueError, 'soak workload or controls'): self.validate()

    def test_relabeling_or_changing_a_paired_workload_is_rejected(self):
        # Even a newly signed report from the same binary may not replace the
        # pre-run workload with another prompt, budget, mode or control.
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        before = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
        for field, value in [('fixture_sha256', 'f' * 64), ('memory_gb', 10),
                             ('mtp', 'on'), ('arms', {'combined': {'env': {}}}),
                             ('required_equal_work', [])]:
            self.modify('paired', 'unique-prose', 'manifest.json', lambda d: d['protocol'].update({field: value}))
            with self.assertRaisesRegex(ValueError, 'paired workload or controls'): self.validate()
            self.write(entry, 'manifest.json', before)

    def test_native_environment_must_match_the_same_pre_run_contract(self):
        self.modify('native', 'combined-plain', 'manifest.json',
                    lambda d: d.update(environment={'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}))
        with self.assertRaisesRegex(ValueError, 'native workload or controls'): self.validate()

    def test_contract_identity_build_and_complete_workloads_are_required(self):
        self.contract_path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'contract identity'): self.validate()
        self.freeze_contract()
        original = copy.deepcopy(self.contract)
        for mutate in [lambda c: c['build_identity'].update(source_archive_sha256='e' * 64),
                       lambda c: c['paired_protocols'].pop('short-one'),
                       lambda c: c['soak_modes'].pop('on')]:
            mutate(self.contract); self.freeze_contract()
            with self.assertRaises(ValueError): self.validate()
            self.contract = copy.deepcopy(original)
        self.freeze_contract()

    def test_missing_and_duplicate_workload_evidence_refused(self):
        with self.assertRaises(ValueError): validate_prerequisites({}, self.build)
        original = copy.deepcopy(self.protocol)
        del self.protocol['prerequisites']['native']['combined-mtp']
        with self.assertRaises(ValueError): self.validate()
        self.protocol = original
        p = self.protocol['prerequisites']['paired']; p['short-one'] = p['unique-prose']
        with self.assertRaisesRegex(ValueError, 'own study'): self.validate()

    def test_changed_receipt_digest_is_rejected(self):
        entry = self.protocol['prerequisites']['native']['combined-plain']
        (Path(entry['directory']) / 'stdout.txt').write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'): self.validate()

    def test_native_wrong_source_failed_assertion_and_wrong_variant_are_rejected(self):
        original = copy.deepcopy(self.protocol)
        for file, mutate in [
            ('manifest.json', lambda d: d['identity'].update(source_archive_sha256='d' * 64)),
            ('stdout.txt', lambda d: d['items'][0].update(passed=False)),
            ('manifest.json', lambda d: d.update(command=['slotstream', 'optimization-state-check', '--variant', 'integrated-mtp']))]:
            entry = self.protocol['prerequisites']['native']['combined-plain']
            data = json.loads((Path(entry['directory']) / file).read_text())
            self.modify('native', 'combined-plain', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            self.write(entry, file, data)
            self.protocol = copy.deepcopy(original)

    def test_incomplete_duplicate_and_other_build_paired_runs_refused(self):
        entry = self.protocol['prerequisites']['paired']['short-one']
        for file, mutate in [
            ('completion.json', lambda d: d.update(stopped_early=True)),
            ('results.jsonl', lambda d: d.__setitem__(-1, d[0])),
            ('manifest.json', lambda d: d['arm_builds']['combined']['identity'].update(binary_sha256='e' * 64)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_pairs=1)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_median_client_reduction=0))]:
            path = Path(entry['directory']) / file; content = path.read_bytes(); before = entry['sha256'][file]
            self.modify('paired', 'short-one', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            path.write_bytes(content); entry['sha256'][file] = before

    def test_claimed_pass_does_not_override_recomputed_failure(self):
        with self.assertRaisesRegex(ValueError, 'recomputed'):
            self.validate(recomputed=[{'candidate': 'combined', 'passed': False}])


if __name__ == '__main__': unittest.main()
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/before/Tools/optimization_soak.py

SHA-256 `424e9ba21eca260b248b216270060a0d82139cc62b96b4a03af9036e8c415cd2`; 31781 bytes.

````text
#!/usr/bin/env python3
"""Bounded repeated-request lifetime qualification; no latency improvement claims."""
import argparse
from contextlib import contextmanager
import http.client
import json
import math
import os
from pathlib import Path
import shutil
import signal
import socket
import subprocess
import time

import serve_bench as bench
from prefill_bench import ROOT, digest, model_identity, preflight, vm_snapshot


@contextmanager
def wall_deadline(seconds):
    """Bound the complete live-server interval, including a stalled response.

    Socket timeouts alone bound each blocking read, not a stream that keeps
    delivering small frames. This standalone driver owns its main-thread timer.
    Cleanup happens outside the deadline so the owned server is always reaped.
    """
    if signal.getitimer(signal.ITIMER_REAL) != (0.0, 0.0):
        raise RuntimeError('another real-time alarm is already active')
    previous = signal.getsignal(signal.SIGALRM)
    def expired(signum, frame):
        raise TimeoutError('fixed lifetime duration exhausted')
    signal.signal(signal.SIGALRM, expired)
    try:
        signal.setitimer(signal.ITIMER_REAL, seconds)
        yield
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0)
        signal.signal(signal.SIGALRM, previous)


def clean_resource_observation(row, protocol):
    metrics = row.get('metrics') or {}
    stats = metrics.get('stats') or {}
    errors = bench.resource_exclusions(stats, {
        'maximum_sampled_footprint_bytes': protocol['acceptance']['maximum_sampled_physical_peak_bytes'],
        'require_nominal_power_state': True,
        'images': row.get('has_image', False),
    })
    for before, after in [(row.get('before'), row.get('after')),
                          (stats.get('generatorVMBefore'), stats.get('generatorVMAfter'))]:
        if not isinstance(before, dict) or not isinstance(after, dict) or any(
            type(before.get(k)) is not int or type(after.get(k)) is not int or before[k] != after[k]
            for k in ['swapins', 'swapouts']):
            errors.append('missing or changed VM interval')
    return not errors, errors


def assess(protocol, rows):
    gate = protocol['acceptance']
    names = [item['name'] for item in protocol['sequence']]
    cycles = protocol['measured_cycles']
    warmup = protocol['warmup_cycles']
    expected = [(cycle, name) for cycle in range(-warmup, cycles) for name in names]
    coordinates = [(row['cycle'], row['name']) for row in rows]
    if len(coordinates) != len(set(coordinates)) or any(c not in expected for c in coordinates):
        raise ValueError('duplicate or undeclared soak request')
    checks = {'fixed_sequence_completed': coordinates == expected,
              'all_requests_succeeded': all(row.get('succeeded') is True for row in rows)}
    # Runtime failures and absolute overflows are failures even during warmup.
    peaks = [bench.sampled_request_peak((r.get('metrics') or {}).get('stats') or {}) for r in rows]
    checks['physical_ceiling'] = bool(peaks) and all(type(p) is int and 0 < p <=
        gate['maximum_sampled_physical_peak_bytes'] for p in peaks)
    details = []
    for name in names:
        selected = [r for r in rows if r['cycle'] >= 0 and r['name'] == name]
        clean = [r for r in selected if clean_resource_observation(r, protocol)[0]]
        early = [r for r in clean if r['cycle'] < cycles // 2]
        late = [r for r in clean if r['cycle'] >= cycles // 2]
        one = {'minimum_clean_observations': len(clean) >= gate['minimum_clean_observations_per_position'],
               'early_observations': len(early) >= gate['minimum_clean_early_observations_per_position'],
               'late_observations': len(late) >= gate['minimum_clean_late_observations_per_position']}
        outputs = [(r.get('metrics', {}).get('output_ids'), r.get('text')) for r in selected]
        one['exact_replay'] = bool(outputs) and bool(outputs[0][0]) and all(v == outputs[0] for v in outputs)
        growth = {}
        for field, limit in [('mlxActiveEndBytes', gate['maximum_active_growth_bytes_per_position']),
                             ('physicalFootprintEndBytes', gate['maximum_physical_end_growth_bytes_per_position'])]:
            a = [r['metrics']['stats'].get(field) for r in early]
            b = [r['metrics']['stats'].get(field) for r in late]
            valid = bool(a) and bool(b) and all(type(v) is int and v > 0 for v in a + b)
            growth[field] = max(b) - min(a) if valid else None
            one[field] = valid and growth[field] <= limit
        embedding_bytes = [(r.get('metrics') or {}).get('stats', {}).get('embeddingCachedPayloadBytes')
                           for r in selected]
        one['bounded_embedding_rows'] = bool(embedding_bytes) and all(
            type(value) is int and 0 <= value <= gate['maximum_cached_embedding_payload_bytes']
            for value in embedding_bytes)
        one['embedding_rows_enabled'] = bool(selected) and all(
            (r.get('metrics') or {}).get('stats', {}).get('embeddingRowsEnabled') is True for r in selected)
        one['bounded_prefix_capacity'] = bool(selected) and all(
            r.get('prefix', {}).get('enabled') is True
            and type(r['prefix'].get('conversations')) is int
            and 1 <= r['prefix']['conversations'] <= gate['maximum_prefix_entries']
            and type(r['prefix'].get('charged_token_capacity')) is int
            and type(r['prefix'].get('max_tokens')) is int
            and 0 <= r['prefix']['charged_token_capacity'] <= r['prefix']['max_tokens']
            for r in selected)
        details.append({'name': name, 'passed': all(one.values()), 'checks': one,
                        'clean_cycles': [r['cycle'] for r in clean], 'observed_growth_bytes': growth})
    checks['positions_pass'] = all(d['passed'] for d in details)
    return {'classification': 'Bounded repeated-request lifetime qualification; no throughput or unbounded-lifetime claim',
            'passed': all(checks.values()), 'checks': checks, 'positions': details}


def prefix_snapshot(port):
    connection = http.client.HTTPConnection('127.0.0.1', port, timeout=10)
    try:
        connection.request('POST', '/api/show', b'{}', {'Content-Type': 'application/json'})
        response = connection.getresponse()
        data = response.read(1 << 20)
        if response.status != 200 or len(data) >= 1 << 20:
            raise ValueError('bounded prefix snapshot unavailable')
        return json.loads(data)['details']['prefix_cache']
    finally:
        connection.close()


def qualification_contract(protocol, build):
    """Bind every workload and control to one reviewed pre-run matrix.

    A passing report with the right build and a different directory can still
    be the wrong workload. The separate frozen contract prevents relabeling a
    study or changing the soak's controls after its prerequisites were run.
    """
    binding = protocol.get('qualification_contract')
    if not isinstance(binding, dict) or set(binding) != {'path', 'sha256'}:
        raise ValueError('a frozen qualification contract is required')
    path = Path(binding['path'])
    if not path.is_file() or not 0 < path.stat().st_size <= 2_000_000 or digest(path) != binding['sha256']:
        raise ValueError('qualification contract identity or size differs')
    contract = json.loads(path.read_text())
    keys = {'format', 'build_identity', 'native', 'paired_protocols', 'soak_modes'}
    if not isinstance(contract, dict) or set(contract) != keys or contract['format'] != 'slotstream-qualification-v1':
        raise ValueError('invalid qualification contract format')
    identity_keys = {'binary_sha256', 'source_archive_sha256', 'metallib_sha256'}
    identity = contract['build_identity']
    if not isinstance(identity, dict) or set(identity) != identity_keys or any(
            not isinstance(identity[k], str) or len(identity[k]) != 64
            or identity[k] != build['identity'].get(k) for k in identity_keys):
        raise ValueError('qualification contract belongs to another build')
    modes = contract['soak_modes']
    declared = {k: v for k, v in protocol.items() if k not in {'qualification_contract', 'prerequisites'}}
    if (not isinstance(modes, dict) or set(modes) != {'off', 'on'}
            or declared != modes.get(protocol.get('mtp'))):
        raise ValueError('soak workload or controls differ from the frozen qualification contract')
    return contract


def validate_paired_execution(name, protocol, rows, warmups):
    """Timing exclusions never excuse wrong, missing or over-budget requests.

    The final matrix may exclude completed cells from timing for VM/thermal
    activity. Every attempted cell must still deliver the frozen workload and
    the same outputs. A preflight refusal leaves final qualification incomplete.
    This does not rescore or modify earlier component studies.
    """
    def refuse(reason):
        raise ValueError(f'paired execution failed for {name}: {reason}')

    mode = protocol.get('mtp', 'off')
    ceiling = protocol.get('maximum_sampled_footprint_bytes')
    minimum, maximum = protocol.get('minimum_output_tokens'), protocol.get('max_tokens')
    if (type(mode) is not str or mode not in {'off', 'on'} or type(ceiling) is not int or ceiling <= 0
            or type(minimum) is not int or type(maximum) is not int
            or not 1 <= minimum <= maximum <= 512):
        refuse('missing or invalid workload/resource bounds')
    anchors, pools, work = {}, {}, {}
    for row in rows:
        if 'error' in row or row.get('interrupted') is True:
            refuse('failed or interrupted request, regardless of timing eligibility')
        arm = protocol.get('arms', {}).get(row.get('arm'), {})
        metrics, first = row.get('metrics'), row.get('first_request')
        if type(metrics) is not dict or type(first) is not dict:
            refuse('both first and measured responses must be captured')
        for phase, data, text in [('first', first, first.get('text')),
                                  ('measured', metrics, row.get('text'))]:
            prompt, output = data.get('prompt_ids'), data.get('output_ids')
            if (type(prompt) is not list or not prompt or type(output) is not list
                    or not minimum <= len(output) <= maximum
                    or any(type(token) is not int or token < 0 for token in prompt + output)
                    or type(text) is not str):
                refuse(f'{phase} response has missing, malformed or truncated tokens/text')
            if type(data.get('effective_mtp')) is not bool or data['effective_mtp'] != (mode == 'on'):
                refuse(f'{phase} speculative mode differs from the declared workload')
            slots = data.get('effective_pool_slots')
            if type(slots) is not int or slots <= 0:
                refuse(f'{phase} pool size is missing or invalid')
            if protocol.get('comparison_basis', 'fixed-pool') == 'fixed-pool':
                if slots != pools.setdefault(phase, slots):
                    refuse(f'{phase} fixed pool differs between cells')
            observation = (tuple(prompt), tuple(output), text)
            if observation != anchors.setdefault(phase, observation):
                refuse(f'{phase} input/output differs, including a timing-excluded cell')
        if metrics.get('effective_prefill_chunk') != arm.get('chunk'):
            refuse('measured prefill setting differs from the frozen arm')
        if type(metrics.get('stats')) is not dict:
            refuse('measured statistics are missing or malformed')
        warm = warmups[(row['round'], row['arm'])]
        warm_metrics = warm.get('metrics') if type(warm) is dict else None
        if (type(warm_metrics) is not dict or type(warm_metrics.get('stats')) is not dict
                or warm.get('text') != first.get('text')
                or any(warm_metrics.get(field) != first.get(field) for field in
                       ['prompt_ids', 'output_ids', 'effective_mtp', 'effective_pool_slots'])
                or warm_metrics.get('effective_prefill_chunk') != arm.get('chunk')):
            refuse('hashed warmup response differs from its captured first request')
        prefix = protocol.get('prefix_cache', {})
        complete = (prefix.get('complete_prompt') is True
                    and prefix.get('expected_reused_tokens', {}).get(row['arm'], 0) > 0)
        try:
            stats = bench.validate_metrics(metrics, allow_complete_prompt=complete)
            warm_stats = bench.validate_metrics(warm_metrics)
        except (KeyError, TypeError, ValueError) as error:
            refuse(f'invalid measured response: {error}')
        for phase, data, observation in [('first', warm_metrics, warm_stats),
                                          ('measured', metrics, stats)]:
            reused = observation.get('reusedPrefixTokens', 0)
            if (observation.get('runtimeError') is not None
                    or observation['decodeTokens'] != len(data['output_ids'])
                    or type(observation.get('promptTokens')) is not int
                    or observation['promptTokens'] != len(data['prompt_ids'])
                    or type(reused) is not int or reused < 0
                    or observation['prefillTokens'] + reused != observation['promptTokens']):
                refuse(f'{phase} completion error or token counters differ from captured IDs')
        peaks = [bench.sampled_request_peak(s) for s in [stats, warm_stats]]
        if any(type(peak) is not int or not 0 < peak <= ceiling for peak in peaks):
            refuse('absolute first/measured footprint ceiling, regardless of timing eligibility')
        durations = [row.get('client_seconds'), row.get('startup_seconds'),
                     first.get('complete_seconds_from_launch'), stats.get('requestSeconds')]
        if any(type(value) not in (int, float) or not math.isfinite(value) or value <= 0
               for value in durations):
            refuse('missing or invalid completed-request duration')
        for field in protocol.get('required_equal_work', []):
            value = stats.get(field)
            if type(value) is not int or value < 0 or value != work.setdefault(field, value):
                refuse(f'declared equal work differs: {field}')


def validate_prerequisites(protocol, build):
    """Require the final candidate's native and paired evidence before launch.

    Digests bind the exact reports; same-binary/source/Metal identity prevents
    borrowing a passing gate from an earlier implementation. Paired decisions
    are recomputed from their frozen rows using the ordinary benchmark gates.
    """
    required_native = {'combined-plain', 'combined-mtp', 'read-failure-serving'}
    required_paired = {'short-one', 'unique-prose', 'sampled-short', 'mtp-resource',
                       'distinct-tail', 'complete-repeat', 'unique-with-retention', 'actual-default-one-token'}
    prerequisites = protocol.get('prerequisites')
    if not isinstance(prerequisites, dict) or set(prerequisites) != {'native', 'paired'}:
        raise ValueError('native and paired final-candidate prerequisites are mandatory')
    for kind, names in [('native', required_native), ('paired', required_paired)]:
        if not isinstance(prerequisites[kind], dict) or set(prerequisites[kind]) != names:
            raise ValueError(f'complete {kind} prerequisite set required')
    contract = qualification_contract(protocol, build)
    for field, names in [('native', required_native), ('paired_protocols', required_paired)]:
        if not isinstance(contract[field], dict) or set(contract[field]) != names:
            raise ValueError(f'qualification contract requires every {field} workload')

    def same_identity(identity):
        return isinstance(identity, dict) and all(identity.get(k) == build['identity'].get(k)
            and isinstance(identity.get(k), str) and len(identity[k]) == 64
            for k in ['binary_sha256', 'source_archive_sha256', 'metallib_sha256'])

    def evidence(entry, name):
        path = Path(entry['directory']) / name
        expected = entry.get('sha256', {}).get(name)
        if type(expected) is not str or not path.is_file() or digest(path) != expected:
            raise ValueError(f'prerequisite digest differs: {path}')
        return path

    # Preserve the exact parsed contract with the receipt, not just its path.
    observed = {'qualification_contract': contract}
    for name, entry in prerequisites['native'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        report = json.loads(evidence(entry, 'stdout.txt').read_text())
        items = report.get('items')
        if (not same_identity(manifest.get('identity')) or manifest.get('passed') is not True
                or manifest.get('exit_code') != 0 or report.get('passed') is not True
                or report.get('skipped') is not None or not isinstance(items, list) or not items
                or any(item.get('passed') is not True for item in items)
                or manifest.get('assertions') != len(items)):
            raise ValueError(f'native prerequisite failed or belongs to another build: {name}')
        command = manifest.get('command') or []
        if contract['native'][name] != {'command': command, 'environment': manifest.get('environment', {})}:
            raise ValueError(f'native workload or controls differ from the frozen contract: {name}')
        variants = {'combined-plain': ['integrated', 'integrated-vision-query'],
                    'combined-mtp': ['integrated-mtp', 'integrated-vision-query-mtp'],
                    'read-failure-serving': ['read-failure-serving']}[name]
        if ('optimization-state-check' not in command or '--variant' not in command
                or command.index('--variant') + 1 >= len(command)
                or command[command.index('--variant') + 1] not in variants):
            raise ValueError(f'native prerequisite has the wrong diagnostic: {name}')
        observed[name] = {'passed': True, 'assertions': len(items)}

    paired_directories = [str(Path(entry['directory']).resolve()) for entry in prerequisites['paired'].values()]
    if len(set(paired_directories)) != len(required_paired):
        raise ValueError('each paired workload requires its own study')
    for name, entry in prerequisites['paired'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        completion = json.loads(evidence(entry, 'completion.json').read_text())
        rows = [json.loads(line) for line in evidence(entry, 'results.jsonl').read_text().splitlines()]
        declared = manifest['protocol']
        if declared != contract['paired_protocols'][name]:
            raise ValueError(f'paired workload or controls differ from the frozen contract: {name}')
        if name == 'actual-default-one-token':
            selected = declared.get('arms', {}).get('combined', {})
            prefix = declared.get('prefix_cache', {})
            if (selected.get('env') != {} or declared.get('max_tokens') != 1
                    or declared.get('minimum_output_tokens') != 1
                    or prefix.get('retention_only') is not True
                    or prefix.get('expected_reused_tokens') != {'reference': 0, 'combined': 0}):
                raise ValueError('actual-default guard requires unoverridden defaults, one output token and enabled unique-prompt retention')
        arms = manifest.get('arm_builds') or {}
        if (not arms or any(not same_identity(arm.get('identity')) for arm in arms.values())
                or completion.get('interrupted') is not False or completion.get('stopped_early') is not False
                or declared.get('rounds') != 16 or len(arms) != 2 or 'reference' not in arms
                or completion.get('planned_cells') != 32 or completion.get('recorded_cells') != 32
                or len(rows) != 32 or 'error' in completion):
            raise ValueError(f'paired prerequisite incomplete or belongs to another build: {name}')
        coordinates = [(row['round'], row['arm']) for row in rows]
        if len(set(coordinates)) != 32 or set(coordinates) != {
                (i, arm) for i in range(1, 17) for arm in arms}:
            raise ValueError(f'paired prerequisite has missing or duplicate cells: {name}')
        warmups = {(row['round'], row['arm']): json.loads(evidence(entry,
            f"{row['round']}-{row['arm']}/warmup.json").read_text()) for row in rows}
        validate_paired_execution(name, declared, rows, warmups)
        if not declared.get('acceptance') or not declared.get('startup_acceptance'):
            raise ValueError(f'paired prerequisite lacks both frozen acceptance gates: {name}')
        gate, first = declared['acceptance'], declared['startup_acceptance']
        required_gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
        if name in {'short-one', 'distinct-tail', 'complete-repeat'}:
            required_gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
        else:
            required_gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
        if name in {'unique-prose', 'sampled-short', 'mtp-resource'}:
            required_gate.update(minimum_active_savings_bytes=300_000_000,
                                 minimum_sampled_peak_savings_bytes=200_000_000)
        if (gate != required_gate or first != {'minimum_pairs': 5,
                'maximum_median_first_job_regression': .05, 'all_outputs_exact': True}):
            raise ValueError(f'paired prerequisite weakens final-matrix bounds: {name}')
        summary = bench.summaries(rows, 'reference', declared.get('comparison_basis', 'fixed-pool'),
                                  declared.get('required_equal_work'))
        accepted = bench.acceptance_results(summary, declared['acceptance'])
        startup = bench.startup_acceptance_results(rows, 'reference', declared['startup_acceptance'])
        if (not accepted or not startup or any(item.get('passed') is not True for item in accepted + startup)
                or accepted != completion.get('acceptance') or startup != completion.get('startup_acceptance')):
            raise ValueError(f'paired prerequisite fails recomputed request/first-job gates: {name}')
        observed[name] = {'passed': True, 'cells': len(rows)}
    return observed


def validate_protocol(protocol):
    integer_fields = ['memory_gb', 'max_context', 'warmup_cycles', 'measured_cycles',
                      'maximum_duration_seconds_per_mode', 'maximum_prompt_tokens', 'maximum_output_tokens']
    if any(type(protocol.get(key)) is not int for key in integer_fields):
        raise ValueError('soak limits require explicit integer values')
    if (protocol.get('classification') != 'Frozen combined lifetime qualification'
            or protocol.get('memory_gb') != 10 or protocol.get('max_context') != 32768
            or protocol.get('mtp') not in ['off', 'on']
            or protocol.get('warmup_cycles') != 2 or protocol.get('measured_cycles') != 8
            or protocol.get('maximum_duration_seconds_per_mode') != 900
            or protocol.get('maximum_prompt_tokens') != 1024 or protocol.get('maximum_output_tokens') != 8):
        raise ValueError('soak requires the explicit bounded and frozen lifetime protocol')
    sequence = protocol.get('sequence')
    if not isinstance(sequence, list) or len(sequence) != 6:
        raise ValueError('soak requires the frozen six-request cycle')
    names = [item.get('name') for item in sequence]
    if any(type(n) is not str or not n.replace('-', '').isalnum() for n in names) or len(set(names)) != len(names):
        raise ValueError('request labels must be unique safe names')
    gate = protocol.get('acceptance') or {}
    limits = {'maximum_sampled_physical_peak_bytes': 10_000_000_000,
              'maximum_active_growth_bytes_per_position': 64 << 20,
              'maximum_physical_end_growth_bytes_per_position': 256 << 20,
              'maximum_cached_embedding_payload_bytes': 11_796_480,
              'maximum_prefix_entries': 4, 'minimum_clean_observations_per_position': 5,
              'minimum_clean_early_observations_per_position': 2,
              'minimum_clean_late_observations_per_position': 2, 'replacement_cycles': 0}
    if any(type(gate.get(k)) is not int or gate[k] != v for k, v in limits.items()):
        raise ValueError('lifetime bounds must match the frozen contract')
    if any(gate.get(k) is not True for k in ['all_expected_requests_complete',
        'exact_per_position_replay_after_warmup', 'prefix_charge_within_declared_capacity',
        'nominal_power_and_unchanged_request_vm_for_resource_observations']):
        raise ValueError('lifetime evidence and exactness requirements cannot be weakened')
    arm = {'reference': {'chunk': 256, 'env': protocol.get('env')}}
    bench.validate_arms(arm)
    requests = {}
    for item in sequence:
        path = Path(item['fixture'])
        if not path.is_file() or not 1 <= path.stat().st_size <= 4096 or digest(path) != item['fixture_sha256']:
            raise ValueError('soak fixture identity/size differs')
        count = item.get('outputs')
        if type(count) is not int or not 1 <= count <= 8:
            raise ValueError('bounded explicit output required')
        request = {'memory_gb': 10, 'raw': item['raw'], 'max_tokens': count, 'seed': 7}
        for key in ['think', 'sampling']:
            if key in item: request[key] = item[key]
        if 'image' in item:
            request['images'] = [{'path': item['image'], 'sha256': item['image_sha256']}]
        requests[item['name']] = bench.request_body(request, path.read_text())
    return requests


def main():
    def interrupted(signum, frame):
        raise KeyboardInterrupt(f'received signal {signum}')
    signal.signal(signal.SIGTERM, interrupted)
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    protocol = json.loads(args.protocol.read_text())
    requests = validate_protocol(protocol)
    build = bench.verified_build(protocol['binary'])
    bench.validate_declared_binary(protocol, {'reference': build})
    if 'frozen_binary_sha256' not in protocol:
        raise ValueError('a frozen binary binding is mandatory')
    prerequisites = validate_prerequisites(protocol, build)
    model = Path(protocol['model']).resolve()
    args.out.mkdir(parents=True, exist_ok=False)
    for name, request in requests.items():
        (args.out / f'request-{name}.json').write_bytes(request)
    for source in [Path(__file__), Path(bench.__file__), ROOT / 'Tools/prefill_bench.py']:
        shutil.copyfile(source, args.out / source.name)
    shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', args.out / 'build-source.tar.gz')
    manifest = {'protocol': protocol, 'protocol_sha256': digest(args.protocol), 'build': build,
                'model': model_identity(model), 'classification': 'One sequential bounded model process',
                'prerequisites': prerequisites, 'passed': False}
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    rows = []
    child = None
    try:
        if bench.competing_jobs(): raise RuntimeError('competing build/storage work; model not launched')
        manifest['before'] = preflight(13)
        with socket.socket() as reservation:
            reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
        command = [build['binary'], 'serve', '--port', str(port), '--model', str(model),
                   '--memory-gb', '10', '--max-context', '32768', '--mtp', protocol['mtp'], '--no-elastic']
        env = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(protocol['env'], SLOTSTREAM_BENCH_DETAILS='1', SLOTSTREAM_PREFILL_CHUNK='256')
        manifest['command'] = command
        start = time.monotonic()
        with wall_deadline(protocol['maximum_duration_seconds_per_mode']), \
                (args.out / 'server.stdout').open('wb') as stdout, \
                (args.out / 'server.stderr').open('wb') as stderr:
            child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
            bench.wait_ready(child, port)
            for cycle in range(-protocol['warmup_cycles'], protocol['measured_cycles']):
                for item in protocol['sequence']:
                    remaining = protocol['maximum_duration_seconds_per_mode'] - (time.monotonic() - start)
                    if remaining <= 0: raise TimeoutError('fixed lifetime duration exhausted')
                    if bench.competing_jobs(): raise RuntimeError('competing build/storage work during soak')
                    row = {'cycle': cycle, 'name': item['name'], 'has_image': 'image' in item,
                           'before': vm_snapshot(), 'succeeded': False}
                    try:
                        measured, wire = bench.exchange(port, requests[item['name']], min(120, remaining),
                                                        allow_complete_prompt=True)
                        row.update(measured, after=vm_snapshot())
                        row['prefix'] = prefix_snapshot(port)
                        (args.out / f'{cycle}-{item["name"]}.ndjson').write_bytes(wire)
                        metrics = row['metrics']; stats = metrics['stats']
                        if (stats.get('runtimeError') is not None or stats['decodeTokens'] != item['outputs']
                                or not 0 < stats['promptTokens'] <= protocol['maximum_prompt_tokens']
                                or metrics['effective_mtp'] != (protocol['mtp'] == 'on')
                                or metrics['effective_prefill_chunk'] != 256):
                            raise ValueError('request output, context or effective mode differs from the protocol')
                        peak = bench.sampled_request_peak(stats)
                        if type(peak) is not int or peak > protocol['acceptance']['maximum_sampled_physical_peak_bytes']:
                            raise ValueError('absolute physical resource bound exceeded or unavailable')
                        row['resource_clean'], row['resource_exclusions'] = clean_resource_observation(row, protocol)
                        row['succeeded'] = True
                    finally:
                        rows.append(row)
                        with (args.out / 'results.jsonl').open('a') as output:
                            output.write(json.dumps(row) + '\n')
                    print(json.dumps({'cycle': cycle, 'name': item['name'], 'resource_clean': row['resource_clean']}), flush=True)
    except (Exception, KeyboardInterrupt) as error:
        manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        if child is not None: bench.stop_server(child)
        manifest['after'] = vm_snapshot()
    report = assess(protocol, rows)
    manifest['passed'] = report['passed'] and 'error' not in manifest
    (args.out / 'assessment.json').write_text(json.dumps(report, indent=2) + '\n')
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print(json.dumps({'passed': manifest['passed'], 'recorded_requests': len(rows), 'error': manifest.get('error')}))
    return 0 if manifest['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/before/Tools/static_gates.sh

SHA-256 `58d584542f5dd873b95594ac3fdfb18d05d1550a0c2c7739aac87e0913026c26`; 1867 bytes.

````text
#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
export BIN SLOTSTREAM_TEST_BINARY="$BIN"

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
python3 Tools/static_gates_binary_test.py
python3 Tools/installer_gates_binary_test.py
python3 Tools/verify_binary_test.py
python3 Tools/sampler_gates_test.py
python3 Tools/api_generation_test.py
python3 Tools/consumer_smoke_test.py
python3 Tools/e2e_release_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build optimization_serial_build optimization_readiness prefill_bench expert_layout_probe \
             ngram_cache_probe indexer_score_probe vision_capacity_gate \
             optimization_prerequisites optimization_soak; do
  python3 "Tools/${suite}_test.py"
done
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

"$BIN" runtime-check
"$BIN" pull-check
python3 Tools/slotpack/checks.py
Tools/planner_gates.sh
Tools/installer_gates.sh

echo "STATIC GATES PASS"
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/before/Tools/static_gates_binary_test.py

SHA-256 `4050c79d6c8f102d8bcc9731c8b50c00ff9833e8fe2ef813dd6ff68549e72707`; 9495 bytes.

````text
"""Execute the real static entry point against tiny, model-free fixture tools."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("static_gates.sh").resolve()
OPTIMIZATION_SUITES = [
    'build_identity', 'optimization_build', 'optimization_serial_build', 'optimization_readiness', 'prefill_bench', 'expert_layout_probe',
    'ngram_cache_probe', 'indexer_score_probe', 'vision_capacity_gate',
    'optimization_prerequisites', 'optimization_soak',
]


class StaticBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-static-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.suite_trace = self.root/'suite-trace.jsonl'
        for directory in ['Tools/reference', 'Tools/slotpack', '.githooks',
                          'bench/parity31', 'Sources/Slotstream', '.build/release',
                          'legacy binary', 'frozen binary']:
            (self.root/directory).mkdir(parents=True, exist_ok=True)
        self.write('Tools/static_gates.sh', SCRIPT.read_text())
        for path in ['install.sh', '.githooks/pre-commit', 'Tools/llms_full.sh',
                     'Tools/brain_gates.sh', 'Tools/installer_gates.sh']:
            self.write(path, '#!/bin/bash\nexit 0\n')
        # Record the forwarded environment at the nested planner boundary.
        # This stub does not certify the real planner's argument handling.
        self.write('Tools/planner_gates.sh', '''#!/bin/bash
set -eu
BIN=${BIN:-.build/release/slotstream}
"$BIN" doctor --json
''')
        for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
                     'Tools/process_cleanup_checks.py', 'Tools/context_qualification_checks.py',
                     'Tools/installer_gates_binary_test.py',
                     'Tools/verify_binary_test.py',
                     'Tools/sampler_gates_test.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        self.write('Tools/e2e_release_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_E2E') == '1' else 0)\n")
        self.write('Tools/api_generation_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_API_GENERATION') == '1' else 0)\n")
        self.write('Tools/consumer_smoke_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_CONSUMER') == '1' else 0)\n")
        for suite in OPTIMIZATION_SUITES:
            self.write(f'Tools/{suite}_test.py', f'''import json, os
with open(os.environ['SLOTSTREAM_SUITE_TRACE'], 'a') as output:
    output.write(json.dumps({suite!r})+'\\n')
raise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_SUITE') == {suite!r} else 0)
''')
        self.write('Sources/Slotstream/PinnedModel.swift', '// pinned manifest fixture\n')
        self.write('bench/parity31/fixture.txt', 'exact fixture\n')
        sha = hashlib.sha256((self.root/'bench/parity31/fixture.txt').read_bytes()).hexdigest()
        self.write('bench/parity31/SHA256SUMS', f'{sha}  fixture.txt\n')
        self.binaries = {}
        for name, path in [('release', '.build/release/slotstream'),
                           ('legacy', 'legacy binary/slotstream'),
                           ('frozen', 'frozen binary/slotstream')]:
            self.binaries[name] = self.root/path
            self.write(path, f'''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['SLOTSTREAM_SELECTION_TRACE'], 'a') as output:
    output.write(json.dumps({{'selected': {name!r}, 'arguments': sys.argv[1:],
        'BIN': os.environ.get('BIN'), 'SLOTSTREAM_TEST_BINARY': os.environ.get('SLOTSTREAM_TEST_BINARY')}})+'\\n')
raise SystemExit(int(os.environ.get('SLOTSTREAM_SELECTION_EXIT', '0')))
''')

    def write(self, relative, text):
        path = self.root/relative
        path.write_text(text)
        path.chmod(0o755)

    def run_entry(self, changes):
        env = {k: v for k, v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(SLOTSTREAM_SELECTION_TRACE=str(self.trace))
        env.update(SLOTSTREAM_SUITE_TRACE=str(self.suite_trace))
        env.update(changes)
        p = subprocess.run(['bash', 'Tools/static_gates.sh'], cwd=self.root,
                           env=env, text=True, capture_output=True, timeout=15)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] \
            if self.trace.exists() else []
        return p, rows

    def expect_selected(self, changes, name):
        p, rows = self.run_entry(changes)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual([row['selected'] for row in rows], [name]*3)
        self.assertEqual([row['arguments'] for row in rows],
                         [['runtime-check'], ['pull-check'], ['doctor', '--json']])
        expected = str(self.binaries[name]) if name != 'release' else '.build/release/slotstream'
        self.assertTrue(all(row['BIN'] == expected and row['SLOTSTREAM_TEST_BINARY'] == expected
                            for row in rows), rows)

    def test_default_release_is_used_and_forwarded(self):
        self.expect_selected({}, 'release')

    def test_legacy_bin_override_is_used_and_forwarded(self):
        self.expect_selected({'BIN': str(self.binaries['legacy'])}, 'legacy')

    def test_frozen_override_with_spaces_is_used_and_forwarded(self):
        self.expect_selected({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_frozen_override_takes_precedence_over_legacy_bin(self):
        self.expect_selected({'BIN': str(self.binaries['legacy']),
                              'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_missing_selected_binary_fails_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing binary')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_binary_failure_stops_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen']),
                                  'SLOTSTREAM_SELECTION_EXIT': '23'})
        self.assertEqual(p.returncode, 23)
        self.assertEqual([row['selected'] for row in rows], ['frozen'])

    def test_failed_installed_release_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_E2E': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_installed_release_fixture_is_a_failure(self):
        (self.root/'Tools/e2e_release_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_failed_api_generation_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_API_GENERATION': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_api_generation_fixture_is_a_failure(self):
        (self.root/'Tools/api_generation_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_every_optimization_suite_runs_before_native_checks(self):
        p, rows = self.run_entry({})
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()] \
            if self.suite_trace.exists() else []
        self.assertEqual(suites, OPTIMIZATION_SUITES)
        self.assertEqual(len(rows), 3)

    def test_failed_consumer_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_CONSUMER': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_consumer_fixture_is_a_failure(self):
        (self.root/'Tools/consumer_smoke_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_failed_optimization_suite_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_prerequisites'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:-1])

    def test_missing_optimization_suite_is_a_failure(self):
        (self.root/'Tools/optimization_prerequisites_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/campaign-final.stderr

SHA-256 `1897d26e8edefef8acbb5e7075817b8d3c5b98037bce4bc3eed9699702710f48`; 112 bytes.

````text
.............
----------------------------------------------------------------------
Ran 13 tests in 1.152s

OK
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/campaign-final.stdout

SHA-256 `4ca3311c459d0c3a56ef16381184a9e21e8ea77ca7bbcf074f5cbbc04cb2f94b`; 935 bytes.

````text
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
{"starting": "paired/sampled-short"}
{"starting": "paired/mtp-resource"}
{"starting": "paired/distinct-tail"}
{"starting": "paired/complete-repeat"}
{"starting": "paired/unique-with-retention"}
{"starting": "paired/actual-default-one-token"}
{"starting": "soak/off"}
{"starting": "soak/on"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/fixtures/optimization/qualification/actual-default-one-token.json

SHA-256 `8481bffb4721fbd594eca609506308480e7979a486c327732cba6ff138daf26b`; 4499 bytes.

````text
{
  "model": "@MODEL@",
  "binary": "@BINARY@",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "0",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "0",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {}
    }
  },
  "label": "integrated-actual-default-one-token",
  "classification": "Frozen combined paired qualification",
  "fixture": "@ROOT@/Tools/fixtures/optimization/prose.txt",
  "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
  "max_tokens": 1,
  "minimum_output_tokens": 1,
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "prefix_cache": {
    "expected_reused_tokens": {
      "reference": 0,
      "combined": 0
    },
    "retention_only": true
  },
  "work_constraints": {
    "reference": {
      "completePromptStores": {
        "min": 0,
        "max": 0
      },
      "completePromptHits": {
        "min": 0,
        "max": 0
      }
    },
    "combined": {
      "completePromptStores": {
        "min": 1,
        "max": 1
      },
      "completePromptHits": {
        "min": 0,
        "max": 0
      }
    }
  },
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "draftedTokens",
    "verifyPasses"
  ],
  "warmup_fixture": "@ROOT@/Tools/fixtures/optimization/short.txt",
  "warmup_fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "stop_on_workspace_contention": true,
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  }
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/fixtures/optimization/qualification/complete-repeat.json

SHA-256 `9b8308d23621b55ae70dfb34258571ed00a97c9ea2932127aa787d438085ba6e`; 6971 bytes.

````text
{
  "model": "@MODEL@",
  "binary": "@BINARY@",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "0",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "0",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "1",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "256",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-complete-repeat",
  "classification": "Frozen combined paired qualification",
  "fixture": "@ROOT@/Tools/fixtures/optimization/prose.txt",
  "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "acceptance": {
    "minimum_pairs": 5,
    "minimum_median_client_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "prefix_cache": {
    "expected_reused_tokens": {
      "reference": 0,
      "combined": 440
    },
    "complete_prompt": true,
    "expected_warmup_checkpoint_stores": {
      "reference": 0,
      "combined": 1
    }
  },
  "work_constraints": {
    "reference": {
      "completePromptHits": {
        "min": 0,
        "max": 0
      },
      "completePromptStores": {
        "min": 0,
        "max": 0
      }
    },
    "combined": {
      "completePromptHits": {
        "min": 1,
        "max": 1
      },
      "completePromptStores": {
        "min": 0,
        "max": 0
      },
      "prefillTokens": {
        "min": 0,
        "max": 0
      },
      "prefillRecords": {
        "min": 0,
        "max": 0
      }
    }
  },
  "required_equal_work": [
    "decodeTokens",
    "draftedTokens",
    "verifyPasses"
  ],
  "stop_on_workspace_contention": true,
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  }
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/fixtures/optimization/qualification/distinct-tail.json

SHA-256 `7d80ab65e1ed821e24922c050afc4ff24b83f9e3a2b560383efd4e7868aad59e`; 6816 bytes.

````text
{
  "model": "@MODEL@",
  "binary": "@BINARY@",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "0",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "0",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "1",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "256",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-distinct-tail",
  "classification": "Frozen combined paired qualification",
  "fixture": "@ROOT@/Tools/fixtures/optimization/prose-distinct-tail.txt",
  "fixture_sha256": "d13b427927e9266ae8a9949b85a704ff6439df50aea54bfd7b5bf46f12b7c784",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "acceptance": {
    "minimum_pairs": 5,
    "minimum_median_client_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "prefix_cache": {
    "expected_reused_tokens": {
      "reference": 0,
      "combined": 256
    },
    "partial_prefix": true
  },
  "warmup_fixture": "@ROOT@/Tools/fixtures/optimization/prose.txt",
  "warmup_fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
  "work_constraints": {
    "reference": {
      "completePromptHits": {
        "min": 0,
        "max": 0
      },
      "prefillTokens": {
        "min": 445,
        "max": 445
      }
    },
    "combined": {
      "completePromptHits": {
        "min": 0,
        "max": 0
      },
      "prefillTokens": {
        "min": 189,
        "max": 189
      }
    }
  },
  "stop_on_workspace_contention": true,
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  }
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/fixtures/optimization/qualification/mtp-resource.json

SHA-256 `5a0c57424e2097b5ec7b4199dd9ae28d40e24f6c4eef24d13098f3ce8d652613`; 6228 bytes.

````text
{
  "model": "@MODEL@",
  "binary": "@BINARY@",
  "memory_gb": 10,
  "mtp": "on",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 10000000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "0",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "0",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-mtp-resource",
  "classification": "Frozen combined paired qualification",
  "fixture": "@ROOT@/Tools/fixtures/optimization/short.txt",
  "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0,
    "minimum_active_savings_bytes": 300000000,
    "minimum_sampled_peak_savings_bytes": 200000000
  },
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "stop_on_workspace_contention": true,
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  }
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/fixtures/optimization/qualification/sampled-short.json

SHA-256 `ec97a77e98417def8f7489b5fd58ded65790659e15ebe6f4d2328c8688d76a7a`; 6357 bytes.

````text
{
  "model": "@MODEL@",
  "binary": "@BINARY@",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "0",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "0",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-sampled-short",
  "classification": "Frozen combined paired qualification",
  "fixture": "@ROOT@/Tools/fixtures/optimization/short.txt",
  "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0,
    "minimum_active_savings_bytes": 300000000,
    "minimum_sampled_peak_savings_bytes": 200000000
  },
  "sampling": {
    "temperature": 0.7,
    "top_k": 40,
    "top_p": 0.8,
    "min_p": 0.05,
    "presence_penalty": 1.1
  },
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "stop_on_workspace_contention": true,
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  }
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/fixtures/optimization/qualification/short-one.json

SHA-256 `5c736b2eec31378f0b3d2beb64d20561569ce8dfd765e363afde72b0755278a9`; 6125 bytes.

````text
{
  "model": "@MODEL@",
  "binary": "@BINARY@",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "0",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "0",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-short-one",
  "classification": "Frozen combined paired qualification",
  "fixture": "@ROOT@/Tools/fixtures/optimization/short.txt",
  "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "max_tokens": 1,
  "minimum_output_tokens": 1,
  "acceptance": {
    "minimum_pairs": 5,
    "minimum_median_client_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "stop_on_workspace_contention": true,
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  }
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/fixtures/optimization/qualification/soak.json

SHA-256 `0b79f271e4dbaabe77802a54a125c371ee4519848c2e01e5019bd5d8a36a065b`; 2925 bytes.

````text
{
  "classification": "Frozen combined lifetime qualification",
  "purpose": "Bounded lifetime qualification of the final combined runtime in one long-lived server",
  "memory_gb": 10,
  "max_context": 32768,
  "warmup_cycles": 2,
  "measured_cycles": 8,
  "maximum_duration_seconds_per_mode": 900,
  "maximum_prompt_tokens": 1024,
  "maximum_output_tokens": 8,
  "sequence": [
    {
      "name": "short",
      "fixture": "@ROOT@/Tools/fixtures/optimization/short.txt",
      "raw": true,
      "outputs": 8,
      "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9"
    },
    {
      "name": "prose",
      "fixture": "@ROOT@/Tools/fixtures/optimization/prose.txt",
      "raw": true,
      "outputs": 8,
      "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b"
    },
    {
      "name": "prose-repeat",
      "fixture": "@ROOT@/Tools/fixtures/optimization/prose.txt",
      "raw": true,
      "outputs": 8,
      "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b"
    },
    {
      "name": "prose-distinct-tail",
      "fixture": "@ROOT@/Tools/fixtures/optimization/prose-distinct-tail.txt",
      "raw": true,
      "outputs": 8,
      "fixture_sha256": "d13b427927e9266ae8a9949b85a704ff6439df50aea54bfd7b5bf46f12b7c784"
    },
    {
      "name": "sampled-short",
      "fixture": "@ROOT@/Tools/fixtures/optimization/short.txt",
      "raw": true,
      "outputs": 8,
      "sampling": {
        "temperature": 0.7,
        "top_k": 40,
        "top_p": 0.8,
        "min_p": 0.05,
        "presence_penalty": 1.1
      },
      "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9"
    },
    {
      "name": "image",
      "fixture": "@ROOT@/Tools/fixtures/optimization/vision/prompt.txt",
      "image": "@ROOT@/Tools/fixtures/optimization/vision/red-512.png",
      "raw": false,
      "think": false,
      "outputs": 1,
      "fixture_sha256": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
      "image_sha256": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed"
    }
  ],
  "acceptance": {
    "all_expected_requests_complete": true,
    "exact_per_position_replay_after_warmup": true,
    "maximum_sampled_physical_peak_bytes": 10000000000,
    "maximum_active_growth_bytes_per_position": 67108864,
    "maximum_physical_end_growth_bytes_per_position": 268435456,
    "maximum_cached_embedding_payload_bytes": 11796480,
    "maximum_prefix_entries": 4,
    "prefix_charge_within_declared_capacity": true,
    "minimum_clean_observations_per_position": 5,
    "minimum_clean_early_observations_per_position": 2,
    "minimum_clean_late_observations_per_position": 2,
    "nominal_power_and_unchanged_request_vm_for_resource_observations": true,
    "replacement_cycles": 0
  },
  "binary": "@BINARY@",
  "model": "@MODEL@",
  "env": {}
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/fixtures/optimization/qualification/unique-prose.json

SHA-256 `6831b8f47138d175f28ac9716bacaa8c937515a970df709393004bff84a45c35`; 6229 bytes.

````text
{
  "model": "@MODEL@",
  "binary": "@BINARY@",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "0",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "0",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-unique-prose",
  "classification": "Frozen combined paired qualification",
  "fixture": "@ROOT@/Tools/fixtures/optimization/prose.txt",
  "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0,
    "minimum_active_savings_bytes": 300000000,
    "minimum_sampled_peak_savings_bytes": 200000000
  },
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "stop_on_workspace_contention": true,
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  }
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/fixtures/optimization/qualification/unique-with-retention.json

SHA-256 `0b2593dab6a12e10226dd94d60c43d40b085160b2c23680b79545d7fe41dbb2d`; 6926 bytes.

````text
{
  "model": "@MODEL@",
  "binary": "@BINARY@",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "0",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "0",
        "SLOTSTREAM_OPT_COMPACT_MTP": "0",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "0",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "0",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "0",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "0",
        "SLOTSTREAM_OPT_FUSED_ROPE": "0",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "0",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "0",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      }
    },
    "combined": {
      "binary": "@BINARY@",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPLETE_PROMPT": "1",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_TAIL_SCHEDULE": "0",
        "SLOTSTREAM_OPT_OUTPUT_DEMAND": "0",
        "SLOTSTREAM_OPT_TERMINAL_PREFILL": "0",
        "SLOTSTREAM_OPT_TERMINAL_QUERY": "0",
        "SLOTSTREAM_OPT_NGRAM_ROWS": "0",
        "SLOTSTREAM_OPT_INDEXER_BLOCKS": "0",
        "SLOTSTREAM_OPT_INDEXER_RAW": "0",
        "SLOTSTREAM_OPT_SAMPLER_THRESHOLD": "1",
        "SLOTSTREAM_OPT_SAMPLER_DRAW": "1",
        "SLOTSTREAM_OPT_SWEEP_PLACEMENT": "0",
        "SLOTSTREAM_OPT_SWEEP_TILES": "0",
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "0",
        "SLOTSTREAM_OPT_ADAPTIVE_MTP": "0",
        "SLOTSTREAM_OPT_RUNTIME_BUDGET": "0",
        "SLOTSTREAM_OPT_FLOOR_CACHE": "0",
        "SLOTSTREAM_OPT_OUTPUT_QUEUE": "1",
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1",
        "SLOTSTREAM_OPT_ROUTER_TOPK": "0",
        "SLOTSTREAM_OPT_INDEXER_DENSE": "0",
        "SLOTSTREAM_OPT_INDEXER_TOPK": "0",
        "SLOTSTREAM_OPT_SHARED_OVERLAP": "0",
        "SLOTSTREAM_OPT_RESIDENT_OVERLAP": "0",
        "SLOTSTREAM_OPT_IMAGE_REUSE": "0",
        "SLOTSTREAM_OPT_READ_HANDLES": "0",
        "SLOTSTREAM_OPT_COMPILED_NORM": "0",
        "SLOTSTREAM_OPT_SELECTED_ATTENTION": "0",
        "SLOTSTREAM_OPT_NGRAM_RING": "0",
        "SLOTSTREAM_OPT_EXPERT_MAP": "0",
        "SLOTSTREAM_OPT_POOL_PINS": "0",
        "SLOTSTREAM_OPT_SLOT_SLICES": "0",
        "SLOTSTREAM_OPT_SLOT_WORDS": "0",
        "SLOTSTREAM_OPT_SLOT_CPU": "0",
        "SLOTSTREAM_OPT_ROUTER_WEIGHTS": "0",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "0",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "256",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "0",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "integrated-unique-with-retention",
  "classification": "Frozen combined paired qualification",
  "fixture": "@ROOT@/Tools/fixtures/optimization/prose.txt",
  "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "prefix_cache": {
    "expected_reused_tokens": {
      "reference": 0,
      "combined": 0
    },
    "retention_only": true
  },
  "work_constraints": {
    "reference": {
      "completePromptStores": {
        "min": 0,
        "max": 0
      },
      "completePromptHits": {
        "min": 0,
        "max": 0
      }
    },
    "combined": {
      "completePromptStores": {
        "min": 1,
        "max": 1
      },
      "completePromptHits": {
        "min": 0,
        "max": 0
      }
    }
  },
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "draftedTokens",
    "verifyPasses"
  ],
  "warmup_fixture": "@ROOT@/Tools/fixtures/optimization/short.txt",
  "warmup_fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "stop_on_workspace_contention": true,
  "initial_workspace_quiet": {
    "stable_seconds": 180,
    "maximum_wait_seconds": 1800
  },
  "startup_acceptance": {
    "minimum_pairs": 5,
    "maximum_median_first_job_regression": 0.05,
    "all_outputs_exact": true
  }
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/optimization_campaign.py

SHA-256 `ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4`; 22126 bytes.

````text
#!/usr/bin/env python3
"""Prepare and run the exact combined native, paired and lifetime qualification.

Preparation and status are model-free. Execution advances one stage at a time,
never repeats an attempted stage, and never activates production defaults.
"""
import argparse
import copy
import datetime
import fcntl
import json
import os
from pathlib import Path
import signal
import sys
import time

import optimization_soak as soak
import serve_bench as bench
from optimization_readiness import pressure_snapshot, require_normal
from optimization_serial_build import guarded_run
from prefill_bench import ROOT, digest, preflight, vm_snapshot


PAIRED = ('short-one', 'unique-prose', 'sampled-short', 'mtp-resource',
          'distinct-tail', 'complete-repeat', 'unique-with-retention', 'actual-default-one-token')
NATIVE = {'combined-plain': 'integrated', 'combined-mtp': 'integrated-mtp',
          'read-failure-serving': 'read-failure-serving'}
STAGES = tuple('native/' + name for name in NATIVE) + tuple('paired/' + name for name in PAIRED) + ('soak/off', 'soak/on')
TEMPLATES = ROOT / 'Tools/fixtures/optimization/qualification'
DRIVERS = ('optimization_campaign.py', 'optimization_soak.py', 'serve_bench.py',
           'prefill_bench.py', 'optimization_readiness.py', 'optimization_serial_build.py',
           'optimization_build.py', 'build_identity.py')
IDENTITY_KEYS = ('binary_sha256', 'source_archive_sha256', 'metallib_sha256')
NATIVE_POLICY = {'startup_reclaimable_bytes': 13_000_000_000,
                 'minimum_live_reclaimable_bytes': 3_000_000_000,
                 'maximum_owned_rss_bytes': 10_000_000_000,
                 'sample_interval_seconds': .2, 'maximum_build_seconds': 1800,
                 'stop_on_new_swapouts': False}


def read(path):
    return json.loads(Path(path).read_text())


def write_new(path, value):
    with Path(path).open('x') as output:
        output.write(json.dumps(value, indent=2) + '\n')


def materialize(value, binary, model):
    if isinstance(value, dict):
        return {k: materialize(v, binary, model) for k, v in value.items()}
    if isinstance(value, list):
        return [materialize(v, binary, model) for v in value]
    if isinstance(value, str):
        return value.replace('@ROOT@', str(ROOT)).replace('@BINARY@', str(binary)).replace('@MODEL@', str(model))
    return value


def prepare(binary, model, destination):
    build = bench.verified_build(binary)
    binary, model, destination = Path(build['binary']), Path(model).resolve(), Path(destination).resolve()
    contract = {'format': 'slotstream-qualification-v1',
                'build_identity': {k: build['identity'][k] for k in IDENTITY_KEYS},
                'native': {}, 'paired_protocols': {}, 'soak_modes': {}}
    for name, variant in NATIVE.items():
        contract['native'][name] = {'command': [str(binary), 'optimization-state-check',
            '--variant', variant, '--model', str(model), '--json'], 'environment': {}}
    for name in PAIRED:
        protocol = materialize(read(TEMPLATES / (name + '.json')), binary, model)
        protocol['frozen_binary_sha256'] = build['identity']['binary_sha256']
        validate_paired_protocol(name, protocol)
        contract['paired_protocols'][name] = protocol
    for mode in ('off', 'on'):
        protocol = materialize(read(TEMPLATES / 'soak.json'), binary, model)
        protocol.update(mtp=mode, frozen_binary_sha256=build['identity']['binary_sha256'])
        soak.validate_protocol(protocol)
        contract['soak_modes'][mode] = protocol
    destination.mkdir(parents=True, exist_ok=False)
    write_new(destination / 'qualification-contract.json', contract)
    packet = {'format': 'slotstream-campaign-v1', 'build': build,
        'created_at': datetime.datetime.now(datetime.timezone.utc).isoformat(),
        'scope': 'Combined candidate qualification only; full release/client/resource acceptance and activation remain separate',
        'contract_sha256': digest(destination / 'qualification-contract.json'),
        'stages': list(STAGES), 'native_policy': copy.deepcopy(NATIVE_POLICY),
        'drivers': {n: digest(ROOT / 'Tools' / n) for n in DRIVERS},
        'templates': {p.name: digest(p) for p in sorted(TEMPLATES.glob('*.json'))}}
    write_new(destination / 'packet.json', packet)
    return {'packet': str(destination), 'contract_sha256': packet['contract_sha256'],
            'stages': len(STAGES), 'launched': False, 'qualification_complete': False}


def validate_paired_protocol(name, protocol):
    """Keep the reviewed workloads and every bound from the portable templates."""
    if name not in PAIRED:
        raise ValueError('unknown final paired workload')
    expected = materialize(read(TEMPLATES / (name + '.json')), protocol['binary'], protocol['model'])
    expected['frozen_binary_sha256'] = protocol['frozen_binary_sha256']
    if protocol != expected:
        raise ValueError('paired workload differs from its reviewed template')
    bench.validate_arms(protocol['arms'])
    bench.prefix_study(protocol)
    bench.work_constraints(protocol)
    bench.measurement_memory(protocol)
    bench.workspace_quiet_requirement(protocol)
    bench.resource_exclusions({}, protocol)
    for key in ('fixture', 'warmup_fixture'):
        if key in protocol and digest(protocol[key]) != protocol[key + '_sha256']:
            raise ValueError('paired fixture identity differs')


def load_packet(directory):
    directory = Path(directory).resolve()
    packet = read(directory / 'packet.json')
    if (packet.get('format') != 'slotstream-campaign-v1' or packet.get('stages') != list(STAGES)
            or packet.get('native_policy') != NATIVE_POLICY):
        raise ValueError('campaign format, stage order or native bounds differ')
    if set(packet.get('drivers', {})) != set(DRIVERS) or any(
            digest(ROOT / 'Tools' / n) != h for n, h in packet['drivers'].items()):
        raise ValueError('campaign driver changed; prepare a distinct candidate campaign')
    templates = {p.name: digest(p) for p in sorted(TEMPLATES.glob('*.json'))}
    if packet.get('templates') != templates:
        raise ValueError('campaign templates changed')
    if digest(directory / 'qualification-contract.json') != packet['contract_sha256']:
        raise ValueError('frozen qualification contract changed')
    if bench.verified_build(packet['build']['binary']) != packet['build']:
        raise ValueError('candidate build identity changed')
    contract = read(directory / 'qualification-contract.json')
    if (contract.get('build_identity') != {k: packet['build']['identity'][k] for k in IDENTITY_KEYS}
            or set(contract.get('native', {})) != set(NATIVE)
            or set(contract.get('paired_protocols', {})) != set(PAIRED)
            or set(contract.get('soak_modes', {})) != {'off', 'on'}):
        raise ValueError('complete same-build native/eight-paired/two-soak contract required')
    binary = packet['build']['binary']
    model = contract['paired_protocols']['short-one']['model']
    for name, variant in NATIVE.items():
        expected = {'command': [binary, 'optimization-state-check', '--variant', variant,
                                '--model', model, '--json'], 'environment': {}}
        if contract['native'][name] != expected:
            raise ValueError('native command or controls differ from the selected build/workload')
    for name, protocol in contract['paired_protocols'].items():
        if (protocol['binary'] != binary or protocol['model'] != model
                or protocol['frozen_binary_sha256'] != packet['build']['identity']['binary_sha256']):
            raise ValueError('paired protocol points to another model or build')
        validate_paired_protocol(name, protocol)
    for mode, protocol in contract['soak_modes'].items():
        expected = materialize(read(TEMPLATES / 'soak.json'), binary, model)
        expected.update(mtp=mode, frozen_binary_sha256=packet['build']['identity']['binary_sha256'])
        if protocol != expected:
            raise ValueError('soak mode differs from its reviewed build/workload')
        soak.validate_protocol(protocol)
        bound = dict(protocol, qualification_contract={'path': str(directory / 'qualification-contract.json'),
                                                       'sha256': packet['contract_sha256']})
        soak.qualification_contract(bound, packet['build'])
    return directory, packet, contract


def evidence(directory, filenames):
    return {'directory': str(directory), 'sha256': {name: digest(directory / name) for name in filenames}}


def artifact_hashes(directory):
    paths = sorted(directory.rglob('*'))
    if any(p.is_symlink() for p in paths):
        raise ValueError('qualification output may not redirect to external evidence')
    return {str(p.relative_to(directory)): digest(p) for p in paths if p.is_file()}


def prerequisite_protocol(directory, contract, *, paired=False, mode='off'):
    result = copy.deepcopy(contract['soak_modes'][mode])
    result['qualification_contract'] = {'path': str(directory / 'qualification-contract.json'),
                                       'sha256': digest(directory / 'qualification-contract.json')}
    result['prerequisites'] = {'native': {}, 'paired': {}}
    for name in NATIVE:
        result['prerequisites']['native'][name] = evidence(directory / 'native' / name / 'evidence',
                                                          ['manifest.json', 'stdout.txt'])
    if paired:
        for name in PAIRED:
            target = directory / 'paired' / name / 'evidence'
            files = ['manifest.json', 'completion.json', 'results.jsonl']
            files += [f'{number}-{arm}/warmup.json' for number in range(1, 17) for arm in ('reference', 'combined')]
            result['prerequisites']['paired'][name] = evidence(target, files)
    return result


def assess_stage(directory, packet, contract, stage):
    """Recompute acceptance from raw evidence; receipts alone never pass a stage."""
    kind, name = stage.split('/')
    target = directory / stage
    attempt, receipt = read(target / 'attempt.json'), read(target / 'receipt.json')
    if (attempt.get('contract_sha256') != packet['contract_sha256'] or attempt.get('stage') != stage
            or receipt.get('error') is not None or receipt.get('cleanup_complete') is not True):
        raise ValueError('stage failed or its ownership/contract differs')
    raw = target / 'evidence'
    if receipt.get('artifact_sha256') != artifact_hashes(raw):
        raise ValueError('captured stage evidence changed after execution')
    if kind == 'native':
        manifest, report = read(raw / 'manifest.json'), read(raw / 'stdout.txt')
        expected_name = {'combined-plain': 'optimization-integrated',
                         'combined-mtp': 'optimization-integrated-mtp',
                         'read-failure-serving': 'optimization-read-failure-serving'}[name]
        items = report.get('items')
        if (receipt.get('exit_code') != 0 or manifest.get('exit_code') != 0
                or manifest.get('passed') is not True or report.get('passed') is not True
                or report.get('skipped') is not None or report.get('name') != expected_name
                or not isinstance(items, list) or not items or any(i.get('passed') is not True for i in items)
                or manifest.get('assertions') != len(items)
                or manifest.get('identity') != packet['build']['identity']
                or {k: manifest.get(k) for k in ('command', 'environment')} != contract['native'][name]):
            raise ValueError('native evidence failed, was skipped or belongs to another workload/build')
        return {'assertions': len(items)}
    if kind == 'paired':
        manifest, completion = read(raw / 'manifest.json'), read(raw / 'completion.json')
        protocol = contract['paired_protocols'][name]
        builds = manifest.get('arm_builds', {})
        if (receipt.get('exit_code') not in (0, 1) or manifest.get('protocol') != protocol
                or set(builds) != {'reference', 'combined'}
                or any(v != packet['build'] for v in builds.values())
                or completion.get('interrupted') is not False or completion.get('stopped_early') is not False
                or 'error' in completion or completion.get('planned_cells') != 32 or completion.get('recorded_cells') != 32):
            raise ValueError('paired study incomplete or belongs to another build/workload')
        rows = [json.loads(line) for line in (raw / 'results.jsonl').read_text().splitlines()]
        if len(rows) != 32 or {(r['round'], r['arm']) for r in rows} != {
                (number, arm) for number in range(1, 17) for arm in ('reference', 'combined')}:
            raise ValueError('missing or repeated paired cells')
        warmups = {(r['round'], r['arm']): read(raw / f"{r['round']}-{r['arm']}/warmup.json") for r in rows}
        soak.validate_paired_execution(name, protocol, rows, warmups)
        summary = bench.summaries(rows, 'reference', protocol.get('comparison_basis', 'fixed-pool'), protocol.get('required_equal_work'))
        accepted = bench.acceptance_results(summary, protocol['acceptance'])
        startup = bench.startup_acceptance_results(rows, 'reference', protocol['startup_acceptance'])
        if (not accepted or not startup or any(r.get('passed') is not True for r in accepted + startup)
                or accepted != completion.get('acceptance') or startup != completion.get('startup_acceptance')):
            raise ValueError('paired request or startup acceptance failed')
        return {'cells': len(rows), 'acceptance': accepted, 'startup_acceptance': startup}
    protocol = prerequisite_protocol(directory, contract, paired=True, mode=name)
    soak.validate_prerequisites(protocol, packet['build'])
    manifest = read(raw / 'manifest.json')
    rows = [json.loads(line) for line in (raw / 'results.jsonl').read_text().splitlines()]
    assessment = soak.assess(protocol, rows)
    if (receipt.get('exit_code') != 0 or manifest.get('protocol') != protocol
            or manifest.get('build') != packet['build'] or manifest.get('passed') is not True
            or 'error' in manifest or assessment.get('passed') is not True
            or assessment != read(raw / 'assessment.json')):
        raise ValueError('lifetime qualification failed or belongs to another build/workload')
    return {'requests': len(rows)}


def status(directory):
    directory, packet, contract = load_packet(directory)
    rows = []
    for stage in STAGES:
        target = directory / stage
        row = {'stage': stage, 'status': 'unrun'}
        if target.exists():
            try:
                row.update(assess_stage(directory, packet, contract, stage), status='passed')
            except (OSError, ValueError, KeyError, TypeError) as error:
                row.update(status='incomplete_or_failed', error=str(error))
        rows.append(row)
    return {'scope': packet['scope'], 'stages': rows,
            'qualification_complete': all(r['status'] == 'passed' for r in rows), 'activation_performed': False}


def run_native(target, specification, build):
    target.mkdir()
    manifest = {'identity': build['identity'], **specification, 'passed': False}
    def snapshot():
        state = vm_snapshot()
        require_normal(pressure_snapshot())
        return state
    try:
        with (target / 'stdout.txt').open('w') as out, (target / 'stderr.txt').open('w') as err:
            process = guarded_run(specification['command'], cwd=ROOT, stdout=out, stderr=err,
                record_path=target / 'memory.json', snapshot=snapshot, policy=NATIVE_POLICY,
                classification='Native correctness only; VM activity is recorded, never performance/resource qualification')
        manifest['exit_code'] = process.returncode
        report = read(target / 'stdout.txt')
        manifest['assertions'] = len(report.get('items', []))
        manifest['passed'] = (process.returncode == 0 and report.get('passed') is True
            and report.get('skipped') is None and manifest['assertions'] > 0
            and all(i.get('passed') is True for i in report['items']))
        return process.returncode
    finally:
        write_new(target / 'manifest.json', manifest)


def run_one(directory):
    directory, packet, contract = load_packet(directory)
    with (directory / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        current = status(directory)
        pending = next((r for r in current['stages'] if r['status'] != 'passed'), None)
        if pending is None:
            return current
        if pending['status'] != 'unrun':
            raise ValueError('an attempted stage is incomplete or failed; preserved evidence cannot be retried in this campaign')
        stage = pending['stage']
        kind, name = stage.split('/')
        if kind != 'native':
            prerequisites = prerequisite_protocol(directory, contract, paired=kind == 'soak', mode=name if kind == 'soak' else 'off')
            soak.validate_prerequisites(prerequisites, packet['build'], native_only=kind == 'paired')
        # Refuse before claiming a stage or creating a model process. A later
        # readiness check is not a replacement measurement cell.
        if bench.competing_jobs():
            raise RuntimeError('competing storage/build work; no stage launched')
        require_normal(pressure_snapshot())
        before = preflight(13)
        target = directory / stage
        target.mkdir(parents=True, exist_ok=False)
        write_new(target / 'attempt.json', {'stage': stage, 'contract_sha256': packet['contract_sha256'], 'before': before})
        print(json.dumps({'starting': stage}), flush=True)
        receipt = {'cleanup_complete': False}
        start = time.monotonic()
        saved = {k: v for k, v in os.environ.items() if k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        for key in saved:
            os.environ.pop(key)
        try:
            if kind == 'native':
                os.environ.update(contract['native'][name]['environment'])
                receipt['exit_code'] = run_native(target / 'evidence', contract['native'][name], packet['build'])
            else:
                protocol = contract['paired_protocols'][name] if kind == 'paired' else prerequisites
                write_new(target / 'execution-protocol.json', protocol)
                driver = 'serve_bench.py' if kind == 'paired' else 'optimization_soak.py'
                command = [sys.executable, str(ROOT / 'Tools' / driver), '--protocol',
                           str(target / 'execution-protocol.json'), '--out', str(target / 'evidence')]
                # Includes all original bounded reservation waits, cooldowns,
                # startup and two request timeouts for every fixed cell.
                timeout = 100_000 if kind == 'paired' else 960
                policy = dict(NATIVE_POLICY, maximum_build_seconds=timeout)
                def snapshot():
                    state = vm_snapshot()
                    require_normal(pressure_snapshot())
                    return state
                with (target / 'stdout.txt').open('w') as out, (target / 'stderr.txt').open('w') as err:
                    process = guarded_run(command, cwd=ROOT, stdout=out, stderr=err,
                        record_path=target / 'ownership-memory.json', snapshot=snapshot, policy=policy,
                        classification='Campaign ownership/memory guard; original per-cell correctness, resource and timing gates remain mandatory')
                receipt['exit_code'] = process.returncode
        except BaseException as error:
            receipt['error'] = f'{type(error).__name__}: {error}'
        finally:
            for key in list(os.environ):
                if key.startswith(('SLOTSTREAM_', 'SS_DEBUG')):
                    os.environ.pop(key)
            os.environ.update(saved)
            receipt['elapsed_seconds'] = time.monotonic() - start
            try:
                receipt['after'] = preflight(0)
                receipt['remaining_jobs'] = bench.competing_jobs()
                receipt['cleanup_complete'] = not receipt['remaining_jobs']
                load_packet(directory)
                receipt['artifact_sha256'] = artifact_hashes(target / 'evidence')
            except BaseException as error:
                receipt['cleanup_error'] = f'{type(error).__name__}: {error}'
                receipt['cleanup_complete'] = False
            write_new(target / 'receipt.json', receipt)
        result = assess_stage(directory, packet, contract, stage)
        return {'stage': stage, 'passed': True, 'result': result, 'activation_performed': False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    commands = parser.add_subparsers(dest='command', required=True)
    prepare_parser = commands.add_parser('prepare', help='Freeze a complete contract without running a model')
    prepare_parser.add_argument('--binary', type=Path, required=True)
    prepare_parser.add_argument('--model', type=Path, required=True)
    prepare_parser.add_argument('--out', type=Path, required=True)
    for name in ('status', 'run-one'):
        sub = commands.add_parser(name)
        sub.add_argument('--packet', type=Path, required=True)
    args = parser.parse_args()
    def interrupted(number, _frame):
        raise KeyboardInterrupt(f'campaign interrupted by signal {number}')
    signal.signal(signal.SIGTERM, interrupted)
    try:
        result = (prepare(args.binary, args.model, args.out) if args.command == 'prepare'
                  else status(args.packet) if args.command == 'status' else run_one(args.packet))
        print(json.dumps(result, indent=2), flush=True)
        return 0
    except (Exception, KeyboardInterrupt) as error:
        print(json.dumps({'passed': False, 'error': f'{type(error).__name__}: {error}'}), flush=True)
        return 1


if __name__ == '__main__':
    raise SystemExit(main())
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/optimization_campaign_test.py

SHA-256 `7d35ef74a8184224b2ec8aabb29f94c4f416c27bdae2d51ee7c794404e36745d`; 15377 bytes.

````text
"""Exercise the complete campaign with fixture processes; never load a model."""
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch

import optimization_campaign as campaign
from prefill_bench import digest, InsufficientHeadroom


class CampaignTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.binary = self.root / 'fixture build/slotstream'
        self.binary.parent.mkdir()
        identity = {'source': {}}
        for filename, field in [('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'),
                                 ('build-source.tar.gz', 'source_archive_sha256')]:
            path = self.binary.parent / filename
            path.write_bytes(b'non-executable campaign identity fixture: ' + filename.encode())
            identity[field] = digest(path)
        campaign.write_new(self.binary.parent / 'build-identity.json', identity)
        self.packet = self.root / 'campaign'
        self.build = campaign.bench.verified_build(self.binary)
        self.calls = []
        self.corrupt = None
        self.exit_code = 0
        self.vm = {'reclaimable_bytes': 14_000_000_000, 'swapins': 0, 'swapouts': 0}
        self.stack = ExitStack()
        self.addCleanup(self.stack.close)
        self.stack.enter_context(patch.object(campaign, 'preflight', return_value=self.vm))
        self.stack.enter_context(patch.object(campaign, 'pressure_snapshot', return_value={'level': 1}))
        self.stack.enter_context(patch.object(campaign.bench, 'competing_jobs', return_value=[]))
        self.stack.enter_context(patch.object(campaign, 'guarded_run', side_effect=self.fixture_process))
        self.launch = self.stack.enter_context(patch('subprocess.Popen', side_effect=AssertionError('fixture must never launch a process')))
        self.prepared = campaign.prepare(self.binary, self.root / 'missing model', self.packet)

    def fixture_process(self, command, **kwargs):
        """Substitute only the process boundary; use real serializers/assessors."""
        self.calls.append(command)
        if command[1] == 'optimization-state-check':
            variant = command[command.index('--variant') + 1]
            name = {'integrated': 'optimization-integrated', 'integrated-mtp': 'optimization-integrated-mtp',
                    'read-failure-serving': 'optimization-read-failure-serving'}[variant]
            report = {'name': name, 'passed': True, 'items': [{'name': 'fixture assertion', 'passed': True}]}
            if self.corrupt:
                self.corrupt(report)
            kwargs['stdout'].write(json.dumps(report))
            kwargs['stdout'].flush()
        else:
            protocol = campaign.read(command[command.index('--protocol') + 1])
            target = Path(command[command.index('--out') + 1])
            target.mkdir()
            if Path(command[1]).name == 'serve_bench.py':
                self.paired_fixture(target, protocol)
            else:
                self.soak_fixture(target, protocol)
        return subprocess.CompletedProcess(command, self.exit_code)

    @staticmethod
    def metrics(count, outputs, *, candidate=False, reused=0, mtp=False):
        computed = count - reused
        return {'schema_version': 1, 'prompt_ids': list(range(100, 100 + count)),
            'output_ids': [7] * outputs, 'effective_mtp': mtp,
            'effective_pool_slots': 640, 'effective_prefill_chunk': 256,
            'stats': {'prefillSeconds': .5 if computed else 0, 'decodeSeconds': .5,
                'requestSeconds': .8 if candidate else 1.0, 'imageEncodeSeconds': 0.0,
                'prefillRecords': 1 if computed else 0, 'decodeRecords': 0,
                'prefillTokens': computed, 'decodeTokens': outputs, 'promptTokens': count,
                'prefillPasses': [computed] if computed else [], 'prefillComputePasses': [computed] if computed else [],
                'prefillReadBytes': 10 if computed else 0, 'reusedPrefixTokens': reused,
                'completePromptHits': int(reused == count), 'completePromptStores': 0,
                'draftedTokens': 0, 'verifyPasses': 0, 'lifetimeRSSPeakBytes': 2_000_000_000,
                'mlxActiveEndBytes': 500_000_000 if candidate else 1_000_000_000,
                'sampledFootprint': {'peakBytes': 1_500_000_000 if candidate else 2_000_000_000}}}

    def paired_fixture(self, target, protocol):
        campaign.write_new(target / 'manifest.json', {'protocol': protocol,
            'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
        filename = Path(protocol['fixture']).name
        count = 17 if filename == 'short.txt' else 445 if filename == 'prose-distinct-tail.txt' else 440
        warm_name = Path(protocol.get('warmup_fixture', protocol['fixture'])).name
        warm_count = 17 if warm_name == 'short.txt' else 440
        rows = []
        for number in range(1, 17):
            for arm in ('reference', 'combined'):
                candidate = arm == 'combined'
                reused = protocol.get('prefix_cache', {}).get('expected_reused_tokens', {}).get(arm, 0)
                args = {'outputs': protocol['max_tokens'], 'candidate': candidate, 'mtp': protocol['mtp'] == 'on'}
                metrics = self.metrics(count, reused=reused, **args)
                warm = self.metrics(warm_count, **args)
                row = {'round': number, 'arm': arm, 'valid': True,
                    'client_seconds': .8 if candidate else 1.0, 'startup_seconds': 1.0,
                    'startup_and_warmup_valid': True, 'text': 'measured fixture', 'metrics': metrics,
                    'first_request': {k: warm[k] for k in ['prompt_ids', 'output_ids', 'effective_mtp', 'effective_pool_slots']}}
                row['first_request'].update(text='first fixture', complete_seconds_from_launch=2.0)
                cell = target / f'{number}-{arm}'
                cell.mkdir()
                campaign.write_new(cell / 'warmup.json', {'text': 'first fixture', 'metrics': warm})
                rows.append(row)
        if self.corrupt:
            self.corrupt(rows)
        (target / 'results.jsonl').write_text(''.join(json.dumps(row) + '\n' for row in rows))
        summary = campaign.bench.summaries(rows, 'reference', protocol['comparison_basis'], protocol.get('required_equal_work'))
        campaign.write_new(target / 'completion.json', {'interrupted': False, 'stopped_early': False,
            'planned_cells': 32, 'recorded_cells': len(rows),
            'acceptance': campaign.bench.acceptance_results(summary, protocol['acceptance']),
            'startup_acceptance': campaign.bench.startup_acceptance_results(rows, 'reference', protocol['startup_acceptance'])})

    def soak_fixture(self, target, protocol):
        rows = []
        vm = {'swapins': 0, 'swapouts': 0}
        system = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
        for cycle in range(-2, 8):
            for item in protocol['sequence']:
                metrics = self.metrics(17, item['outputs'], mtp=protocol['mtp'] == 'on')
                metrics['stats'].update(physicalFootprintEndBytes=2_000_000_000,
                    embeddingCachedPayloadBytes=1000, embeddingRowsEnabled=True,
                    generatorVMBefore=vm, generatorVMAfter=vm,
                    generatorSystemBefore=system, generatorSystemAfter=system)
                image = 'image' in item
                if image:
                    metrics['stats']['imagePreparation'] = {'sampledFootprint': {'peakBytes': 2_000_000_000, 'samples': 2},
                        'seconds': 1.0, 'sourceDecodeSeconds': .1, 'towerReadySeconds': .1}
                rows.append({'cycle': cycle, 'name': item['name'], 'succeeded': True,
                    'before': vm, 'after': vm, 'has_image': image, 'text': 'soak fixture', 'metrics': metrics,
                    'prefix': {'enabled': True, 'conversations': 4, 'charged_token_capacity': 256, 'max_tokens': 8192}})
        if self.corrupt:
            self.corrupt(rows)
        assessment = campaign.soak.assess(protocol, rows)
        (target / 'results.jsonl').write_text(''.join(json.dumps(row) + '\n' for row in rows))
        campaign.write_new(target / 'assessment.json', assessment)
        campaign.write_new(target / 'manifest.json', {'protocol': protocol, 'build': self.build, 'passed': assessment['passed']})

    def complete_native(self):
        for _ in range(3):
            self.assertTrue(campaign.run_one(self.packet)['passed'])

    def test_preparation_binds_all_stages_and_launches_nothing(self):
        self.assertEqual(self.prepared['stages'], 13)
        self.assertFalse(self.prepared['launched'])
        result = campaign.status(self.packet)
        self.assertFalse(result['qualification_complete'])
        self.assertEqual([r['status'] for r in result['stages']], ['unrun'] * 13)
        contract = campaign.read(self.packet / 'qualification-contract.json')
        self.assertEqual(contract['paired_protocols']['actual-default-one-token']['arms']['combined']['env'], {})
        self.assertEqual(set(contract['soak_modes']), {'off', 'on'})
        self.assertEqual(self.calls, [])
        self.launch.assert_not_called()

    def test_full_process_fixture_advances_once_in_order_and_recomputes_all_gates(self):
        for stage in campaign.STAGES:
            result = campaign.run_one(self.packet)
            self.assertEqual(result['stage'], stage)
            self.assertTrue(result['passed'])
        result = campaign.run_one(self.packet)
        self.assertTrue(result['qualification_complete'])
        self.assertFalse(result['activation_performed'])
        self.assertEqual(len(self.calls), 13)
        self.assertEqual(sum(r.get('cells', 0) for r in result['stages']), 256)
        self.assertEqual(sum(r.get('requests', 0) for r in result['stages']), 120)
        self.launch.assert_not_called()

    def test_insufficient_memory_refuses_before_attempt_and_does_not_consume_a_cell(self):
        with patch.object(campaign, 'preflight', side_effect=InsufficientHeadroom('fixture memory refusal')):
            with self.assertRaises(InsufficientHeadroom):
                campaign.run_one(self.packet)
        self.assertFalse((self.packet / 'native/combined-plain').exists())
        self.assertEqual(self.calls, [])

    def test_native_skip_or_false_pass_stops_without_retry(self):
        self.corrupt = lambda report: report.update(skipped='fixture unavailable')
        with self.assertRaisesRegex(ValueError, 'native evidence'):
            campaign.run_one(self.packet)
        with self.assertRaisesRegex(ValueError, 'cannot be retried'):
            campaign.run_one(self.packet)
        self.assertEqual(len(self.calls), 1)

    def test_native_failed_assertion_cannot_hide_behind_a_passed_report(self):
        self.corrupt = lambda report: report['items'][0].update(passed=False)
        with self.assertRaisesRegex(ValueError, 'native evidence'):
            campaign.run_one(self.packet)
        self.assertFalse(campaign.read(self.packet / 'native/combined-plain/evidence/manifest.json')['passed'])

    def test_process_failure_and_cancellation_preserve_attempts_and_stop(self):
        with patch.object(campaign, 'guarded_run', side_effect=KeyboardInterrupt('fixture cancelled')):
            with self.assertRaisesRegex(ValueError, 'stage failed'):
                campaign.run_one(self.packet)
        receipt = campaign.read(self.packet / 'native/combined-plain/receipt.json')
        self.assertIn('KeyboardInterrupt', receipt['error'])
        with self.assertRaisesRegex(ValueError, 'cannot be retried'):
            campaign.run_one(self.packet)

    def test_native_only_boundary_does_not_waive_actual_soak_prerequisites(self):
        self.complete_native()
        _, _, contract = campaign.load_packet(self.packet)
        protocol = campaign.prerequisite_protocol(self.packet, contract)
        self.assertIn('combined-plain', campaign.soak.validate_prerequisites(protocol, self.build, native_only=True))
        with self.assertRaisesRegex(ValueError, 'complete paired'):
            campaign.soak.validate_prerequisites(protocol, self.build)

    def test_completed_vm_exclusion_may_pass_but_wrong_excluded_output_cannot(self):
        self.complete_native()
        self.exit_code = 1  # The unchanged benchmark returns 1 for any timing exclusion.
        self.corrupt = lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False)
        self.assertTrue(campaign.run_one(self.packet)['passed'])
        def wrong(rows):
            rows[-1].update(valid=False, startup_and_warmup_valid=False)
            rows[-1]['metrics']['output_ids'][0] = 99
        self.corrupt = wrong
        with self.assertRaisesRegex(ValueError, 'input/output differs'):
            campaign.run_one(self.packet)

    def test_frozen_contract_and_build_changes_refuse_before_launch(self):
        self.binary.write_bytes(b'changed fixture')
        with self.assertRaisesRegex(ValueError, 'identity mismatch'):
            campaign.run_one(self.packet)
        self.assertEqual(self.calls, [])

    def rewrite_contract(self, change):
        path = self.packet / 'qualification-contract.json'
        contract = campaign.read(path)
        change(contract)
        path.write_text(json.dumps(contract))
        path = self.packet / 'packet.json'
        packet = campaign.read(path)
        packet['contract_sha256'] = digest(self.packet / 'qualification-contract.json')
        path.write_text(json.dumps(packet))

    def test_incomplete_contract_refuses_even_with_a_matching_file_hash(self):
        self.rewrite_contract(lambda contract: contract['paired_protocols'].pop('actual-default-one-token'))
        with self.assertRaisesRegex(ValueError, 'complete same-build'):
            campaign.run_one(self.packet)
        self.assertEqual(self.calls, [])

    def test_native_command_cannot_redirect_execution(self):
        self.rewrite_contract(lambda contract: contract['native']['combined-plain']['command'].__setitem__(0, '/unused/different-program'))
        with self.assertRaisesRegex(ValueError, 'native command'):
            campaign.run_one(self.packet)
        self.assertEqual(self.calls, [])

    def test_soak_workload_cannot_change_after_paired_studies_are_frozen(self):
        self.rewrite_contract(lambda contract: contract['soak_modes']['off'].update(env={'SLOTSTREAM_OPT_COMPLETE_PROMPT': '0'}))
        with self.assertRaisesRegex(ValueError, 'soak mode differs'):
            campaign.run_one(self.packet)
        self.assertEqual(self.calls, [])

    def test_edited_completed_evidence_cannot_be_reused(self):
        campaign.run_one(self.packet)
        path = self.packet / 'native/combined-plain/evidence/stdout.txt'
        report = campaign.read(path)
        report['items'][0]['name'] = 'changed fixture assertion'
        path.write_text(json.dumps(report))
        state = campaign.status(self.packet)
        self.assertEqual(state['stages'][0]['status'], 'incomplete_or_failed')
        self.assertIn('evidence changed', state['stages'][0]['error'])


if __name__ == '__main__':
    unittest.main()
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/optimization_prerequisites_test.py

SHA-256 `215ab0cead0daafd4d95f469254870159c66b9d719997410838cea83c151d41b`; 19262 bytes.

````text
"""Receipt binding tests; benchmark statistics are tested by prefill_bench_test."""
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from optimization_soak import validate_prerequisites
from prefill_bench import digest


class PrerequisiteTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.identity = {k: c * 64 for k, c in [('binary_sha256', 'a'),
            ('source_archive_sha256', 'b'), ('metallib_sha256', 'c')]}
        self.build = {'identity': self.identity}
        self.decision = [{'candidate': 'combined', 'passed': True, 'checks': {'fixture': True}}]
        self.protocol = {'mtp': 'off', 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '1'},
                         'prerequisites': {'native': {}, 'paired': {}}}
        for name, variant in [('combined-plain', 'integrated'), ('combined-mtp', 'integrated-mtp'),
                              ('read-failure-serving', 'read-failure-serving')]:
            entry = self.entry('native', name)
            self.write(entry, 'manifest.json', {'identity': self.identity, 'passed': True, 'exit_code': 0,
                'assertions': 1, 'command': ['/unused/slotstream', 'optimization-state-check', '--variant', variant]})
            self.write(entry, 'stdout.txt', {'passed': True, 'items': [{'passed': True}]})
        for name in ['short-one', 'unique-prose', 'sampled-short', 'mtp-resource', 'distinct-tail',
                     'complete-repeat', 'unique-with-retention', 'actual-default-one-token']:
            entry = self.entry('paired', name)
            gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
            if name in ['short-one', 'distinct-tail', 'complete-repeat']:
                gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
            else:
                gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
            if name in ['unique-prose', 'sampled-short', 'mtp-resource']:
                gate.update(minimum_active_savings_bytes=300_000_000, minimum_sampled_peak_savings_bytes=200_000_000)
            self.write(entry, 'manifest.json', {'protocol': {'rounds': 16,
                'mtp': 'off', 'minimum_output_tokens': 1, 'max_tokens': 1,
                'maximum_sampled_footprint_bytes': 8_100_000_000,
                'arms': {arm: {'chunk': 256, 'env': {}} for arm in ['reference', 'combined']},
                'acceptance': gate,
                'startup_acceptance': {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05,
                    'all_outputs_exact': True}},
                'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
            self.write(entry, 'completion.json', {'interrupted': False, 'stopped_early': False,
                'planned_cells': 32, 'recorded_cells': 32, 'acceptance': self.decision,
                'startup_acceptance': self.decision})
            rows = [self.response_row(i, arm) for i in range(1, 17) for arm in ['reference', 'combined']]
            self.write(entry, 'results.jsonl', rows)
            for row in rows:
                self.write(entry, f"{row['round']}-{row['arm']}/warmup.json", self.warmup_response(row))
        self.modify('paired', 'actual-default-one-token', 'manifest.json',
            lambda m: m['protocol'].update(arms={'reference': {'chunk': 256, 'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}},
                'combined': {'chunk': 256, 'env': {}}}, max_tokens=1, minimum_output_tokens=1,
                prefix_cache={'retention_only': True, 'expected_reused_tokens': {'reference': 0, 'combined': 0}}))
        self.contract_path = self.root / 'qualification-contract.json'
        self.contract = {'format': 'slotstream-qualification-v1', 'build_identity': copy.deepcopy(self.identity),
            'native': {}, 'paired_protocols': {}, 'soak_modes': {}}
        for name, entry in self.protocol['prerequisites']['native'].items():
            manifest = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
            self.contract['native'][name] = {'command': manifest['command'], 'environment': {}}
        for name, entry in self.protocol['prerequisites']['paired'].items():
            self.contract['paired_protocols'][name] = json.loads(
                (Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        for mode in ['off', 'on']:
            self.contract['soak_modes'][mode] = {'mtp': mode, 'env': copy.deepcopy(self.protocol['env'])}
        self.freeze_contract()

    @staticmethod
    def response_row(number, arm):
        return {'round': number, 'arm': arm, 'valid': True,
            'client_seconds': 1.0, 'startup_seconds': 1.0,
            'startup_and_warmup_valid': True, 'text': 'measured',
            'first_request': {'prompt_ids': [17], 'output_ids': [7], 'text': 'first',
                'effective_mtp': False, 'effective_pool_slots': 640, 'complete_seconds_from_launch': 2.0},
            'metrics': {'schema_version': 1, 'prompt_ids': [101, 102], 'output_ids': [7],
                'effective_mtp': False, 'effective_pool_slots': 640, 'effective_prefill_chunk': 256,
                'stats': {'prefillSeconds': .5, 'decodeSeconds': .5, 'requestSeconds': 1.0,
                    'imageEncodeSeconds': 0.0, 'prefillRecords': 1, 'decodeRecords': 0,
                    'prefillTokens': 2, 'decodeTokens': 1, 'promptTokens': 2, 'prefillPasses': [2],
                    'lifetimeRSSPeakBytes': 1_000_000, 'sampledFootprint': {'peakBytes': 2_000_000}}}}

    def execution_mutation(self, change):
        self.modify('paired', 'unique-prose', 'results.jsonl', lambda rows: change(rows[-1]))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    @staticmethod
    def warmup_response(row):
        metrics = copy.deepcopy(row['metrics'])
        metrics.update({key: row['first_request'][key] for key in
            ['prompt_ids', 'output_ids', 'effective_mtp', 'effective_pool_slots']})
        count = len(metrics['prompt_ids'])
        metrics['stats'].update(promptTokens=count, prefillTokens=count, prefillPasses=[count])
        return {'text': row['first_request']['text'], 'metrics': metrics}

    def test_vm_excluded_warmup_peak_overflow_still_fails(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics']['stats']['sampledFootprint'].update(peakBytes=8_100_000_001))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_warmup_body_must_match_the_captured_first_request(self):
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics'].update(output_ids=[8]))
        with self.assertRaisesRegex(ValueError, 'hashed warmup response'):
            self.validate()

    def test_every_warmup_body_requires_an_unchanged_digest(self):
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        path = Path(entry['directory'])/'16-combined/warmup.json'
        path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'):
            self.validate()

    def test_warmup_body_without_a_digest_is_not_accepted(self):
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        del entry['sha256']['16-combined/warmup.json']
        with self.assertRaisesRegex(ValueError, 'digest differs'):
            self.validate()

    def test_vm_excluded_measured_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_excluded_first_output_change_is_a_correctness_failure(self):
        def mutate(row):
            row.update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity')
            row['first_request']['output_ids'] = [8]
        self.execution_mutation(mutate)

    def test_vm_excluded_absolute_peak_overflow_still_fails(self):
        def mutate(row):
            row.update(valid=False, exclusion='swap activity')
            row['metrics']['stats']['sampledFootprint']['peakBytes'] = 8_100_000_001
        self.execution_mutation(mutate)

    def test_request_failure_is_not_a_discardable_timing_sample(self):
        self.execution_mutation(lambda row: row.update(valid=False, error='HTTP 500 fixture'))

    def test_runtime_error_in_completed_measured_metadata_still_fails(self):
        self.execution_mutation(lambda row: row['metrics']['stats'].update(runtimeError='fixture failure'))

    def test_runtime_error_in_completed_first_metadata_still_fails(self):
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics']['stats'].update(runtimeError='fixture failure'))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_measured_token_counters_must_match_captured_ids(self):
        self.execution_mutation(lambda row: row['metrics']['stats'].update(decodeTokens=2))

    def test_first_token_counters_must_match_captured_ids(self):
        self.modify('paired', 'unique-prose', '16-combined/warmup.json',
            lambda warm: warm['metrics']['stats'].update(promptTokens=3))
        with self.assertRaisesRegex(ValueError, 'paired execution failed'):
            self.validate()

    def test_reused_and_computed_tokens_must_account_for_the_whole_prompt(self):
        self.execution_mutation(lambda row: row['metrics']['stats'].update(reusedPrefixTokens=1))

    def test_preflight_refusal_leaves_the_final_matrix_incomplete(self):
        def mutate(row):
            row.pop('metrics'); row.pop('first_request')
            row.update(valid=False, error='InsufficientHeadroom fixture')
        self.execution_mutation(mutate)

    def test_completed_wrong_configuration_is_not_a_discardable_sample(self):
        def mutate(row):
            row.update(valid=False)
            row['metrics']['effective_prefill_chunk'] = 512
        self.execution_mutation(mutate)

    def test_wrong_or_truncated_token_metadata_is_not_discardable(self):
        self.execution_mutation(lambda row: row['metrics'].update(output_ids=[]))

    def test_vm_excluded_identical_complete_responses_remain_eligible_for_correctness(self):
        self.modify('paired', 'unique-prose', 'results.jsonl',
            lambda rows: rows[-1].update(valid=False, startup_and_warmup_valid=False, exclusion='swap activity'))
        self.assertEqual(len(self.validate()), 12)

    def test_actual_default_guard_rejects_forced_controls_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p['arms']['combined']['env'].update(SLOTSTREAM_OPT_FINAL_FORWARD='1'))

    def test_actual_default_guard_rejects_disabled_retention_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.pop('prefix_cache'))

    def test_actual_default_guard_rejects_larger_reply_even_when_frozen(self):
        self.actual_default_mutation(lambda p: p.update(max_tokens=16, minimum_output_tokens=16))

    def actual_default_mutation(self, change):
        name = 'actual-default-one-token'
        self.modify('paired', name, 'manifest.json', lambda m: change(m['protocol']))
        entry = self.protocol['prerequisites']['paired'][name]
        self.contract['paired_protocols'][name] = json.loads((Path(entry['directory']) / 'manifest.json').read_text())['protocol']
        self.freeze_contract()
        with self.assertRaisesRegex(ValueError, 'actual-default guard'):
            self.validate()

    def freeze_contract(self):
        self.contract_path.write_text(json.dumps(self.contract))
        self.protocol['qualification_contract'] = {'path': str(self.contract_path),
            'sha256': digest(self.contract_path)}

    def entry(self, kind, name):
        path = self.root / name; path.mkdir()
        entry = {'directory': str(path), 'sha256': {}}
        self.protocol['prerequisites'][kind][name] = entry
        return entry

    def write(self, entry, name, data):
        path = Path(entry['directory']) / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(''.join(json.dumps(row) + '\n' for row in data)
                        if name.endswith('jsonl') else json.dumps(data))
        entry['sha256'][name] = digest(path)

    def modify(self, kind, name, file, change):
        entry = self.protocol['prerequisites'][kind][name]
        path = Path(entry['directory']) / file
        data = ([json.loads(line) for line in path.read_text().splitlines()]
                if file.endswith('jsonl') else json.loads(path.read_text()))
        change(data); self.write(entry, file, data)

    def validate(self, *, recomputed=None):
        with ExitStack() as stack:
            summary = stack.enter_context(patch('optimization_soak.bench.summaries', return_value=['fixture']))
            acceptance = stack.enter_context(patch('optimization_soak.bench.acceptance_results',
                return_value=self.decision if recomputed is None else recomputed))
            startup = stack.enter_context(patch('optimization_soak.bench.startup_acceptance_results',
                return_value=self.decision))
            result = validate_prerequisites(self.protocol, self.build)
            self.assertEqual((summary.call_count, acceptance.call_count, startup.call_count), (8, 8, 8))
            return result

    def test_complete_same_build_evidence_is_recomputed_and_accepted(self):
        self.assertEqual(len(self.validate()), 12)
        self.protocol['mtp'] = 'on'
        self.assertEqual(self.validate()['qualification_contract'], self.contract)

    def test_different_soak_controls_cannot_borrow_passing_evidence(self):
        self.protocol['env']['SLOTSTREAM_OPT_FINAL_FORWARD'] = '0'
        with self.assertRaisesRegex(ValueError, 'soak workload or controls'): self.validate()

    def test_relabeling_or_changing_a_paired_workload_is_rejected(self):
        # Even a newly signed report from the same binary may not replace the
        # pre-run workload with another prompt, budget, mode or control.
        entry = self.protocol['prerequisites']['paired']['unique-prose']
        before = json.loads((Path(entry['directory']) / 'manifest.json').read_text())
        for field, value in [('fixture_sha256', 'f' * 64), ('memory_gb', 10),
                             ('mtp', 'on'), ('arms', {'combined': {'env': {}}}),
                             ('required_equal_work', [])]:
            self.modify('paired', 'unique-prose', 'manifest.json', lambda d: d['protocol'].update({field: value}))
            with self.assertRaisesRegex(ValueError, 'paired workload or controls'): self.validate()
            self.write(entry, 'manifest.json', before)

    def test_native_environment_must_match_the_same_pre_run_contract(self):
        self.modify('native', 'combined-plain', 'manifest.json',
                    lambda d: d.update(environment={'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}))
        with self.assertRaisesRegex(ValueError, 'native workload or controls'): self.validate()

    def test_contract_identity_build_and_complete_workloads_are_required(self):
        self.contract_path.write_text('{}')
        with self.assertRaisesRegex(ValueError, 'contract identity'): self.validate()
        self.freeze_contract()
        original = copy.deepcopy(self.contract)
        for mutate in [lambda c: c['build_identity'].update(source_archive_sha256='e' * 64),
                       lambda c: c['paired_protocols'].pop('short-one'),
                       lambda c: c['soak_modes'].pop('on')]:
            mutate(self.contract); self.freeze_contract()
            with self.assertRaises(ValueError): self.validate()
            self.contract = copy.deepcopy(original)
        self.freeze_contract()

    def test_missing_and_duplicate_workload_evidence_refused(self):
        with self.assertRaises(ValueError): validate_prerequisites({}, self.build)
        original = copy.deepcopy(self.protocol)
        del self.protocol['prerequisites']['native']['combined-mtp']
        with self.assertRaises(ValueError): self.validate()
        self.protocol = original
        p = self.protocol['prerequisites']['paired']; p['short-one'] = p['unique-prose']
        with self.assertRaisesRegex(ValueError, 'own study'): self.validate()

    def test_changed_receipt_digest_is_rejected(self):
        entry = self.protocol['prerequisites']['native']['combined-plain']
        (Path(entry['directory']) / 'stdout.txt').write_text('{}')
        with self.assertRaisesRegex(ValueError, 'digest differs'): self.validate()

    def test_native_wrong_source_failed_assertion_and_wrong_variant_are_rejected(self):
        original = copy.deepcopy(self.protocol)
        for file, mutate in [
            ('manifest.json', lambda d: d['identity'].update(source_archive_sha256='d' * 64)),
            ('stdout.txt', lambda d: d['items'][0].update(passed=False)),
            ('manifest.json', lambda d: d.update(command=['slotstream', 'optimization-state-check', '--variant', 'integrated-mtp']))]:
            entry = self.protocol['prerequisites']['native']['combined-plain']
            data = json.loads((Path(entry['directory']) / file).read_text())
            self.modify('native', 'combined-plain', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            self.write(entry, file, data)
            self.protocol = copy.deepcopy(original)

    def test_incomplete_duplicate_and_other_build_paired_runs_refused(self):
        entry = self.protocol['prerequisites']['paired']['short-one']
        for file, mutate in [
            ('completion.json', lambda d: d.update(stopped_early=True)),
            ('results.jsonl', lambda d: d.__setitem__(-1, d[0])),
            ('manifest.json', lambda d: d['arm_builds']['combined']['identity'].update(binary_sha256='e' * 64)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_pairs=1)),
            ('manifest.json', lambda d: d['protocol']['acceptance'].update(minimum_median_client_reduction=0))]:
            path = Path(entry['directory']) / file; content = path.read_bytes(); before = entry['sha256'][file]
            self.modify('paired', 'short-one', file, mutate)
            with self.assertRaises(ValueError): self.validate()
            path.write_bytes(content); entry['sha256'][file] = before

    def test_claimed_pass_does_not_override_recomputed_failure(self):
        with self.assertRaisesRegex(ValueError, 'recomputed'):
            self.validate(recomputed=[{'candidate': 'combined', 'passed': False}])


if __name__ == '__main__': unittest.main()
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/optimization_results.py

SHA-256 `d4b9b0d6e82dd5d38f043c1b681cede8cfc2c764bcf80b9031e8438b51fece9c`; 6784 bytes.

````text
#!/usr/bin/env python3
"""Report paired latency, active emission rate and memory from campaign evidence.

Read-only analysis. Workloads stay separate and percentages are medians of
paired ratios, never ratios of medians or sums of independent improvements.
"""
import argparse
import json
import math
from pathlib import Path
import statistics

import optimization_campaign as campaign
from prefill_bench import digest


def field(row, *path):
    value = row
    for key in path:
        if not isinstance(value, dict):
            return None
        value = value.get(key)
    return value


def number(value, *, zero=False):
    try:
        return type(value) in (int, float) and math.isfinite(value) and (value >= 0 if zero else value > 0)
    except OverflowError:
        return False


def active_emission_tps(row):
    """N-1 emission intervals exclude prefill and work after the last token."""
    ids = field(row, 'metrics', 'output_ids')
    count = field(row, 'metrics', 'stats', 'decodeTokens')
    intervals = field(row, 'metrics', 'stats', 'interTokenSeconds')
    if (not isinstance(ids, list) or type(count) is not int or count != len(ids) or count < 2
            or not isinstance(intervals, list) or len(intervals) != count - 1
            or any(not number(value, zero=True) for value in intervals)):
        return None
    try:
        seconds = math.fsum(intervals)
    except OverflowError:
        return None
    value = (count - 1) / seconds if number(seconds) else None
    return value if number(value) else None


def decode_phase_tps(row):
    count = field(row, 'metrics', 'stats', 'decodeTokens')
    seconds = field(row, 'metrics', 'stats', 'decodeSeconds')
    return count / seconds if type(count) is int and count > 0 and number(seconds) else None


METRICS = {
    'request_seconds': ('seconds', 'lower', lambda r: r.get('client_seconds'), 'valid'),
    'first_protocol_delta_seconds': ('seconds', 'lower', lambda r: r.get('first_protocol_delta_seconds'), 'valid'),
    'first_visible_text_seconds': ('seconds', 'lower', lambda r: r.get('first_visible_text_seconds'), 'valid'),
    'fresh_process_first_job_seconds': ('seconds', 'lower', lambda r: field(r, 'first_request', 'complete_seconds_from_launch'), 'startup_and_warmup_valid'),
    'prefill_seconds': ('seconds', 'lower', lambda r: field(r, 'metrics', 'stats', 'prefillSeconds'), 'valid'),
    'active_emission_tokens_per_second': ('tokens/second', 'higher', active_emission_tps, 'valid'),
    'decode_phase_tokens_per_second': ('tokens/second', 'higher', decode_phase_tps, 'valid'),
    'sampled_process_peak_bytes': ('bytes', 'lower', lambda r: campaign.bench.sampled_request_peak(field(r, 'metrics', 'stats') or {}), 'valid'),
    'active_tensor_bytes': ('bytes', 'lower', lambda r: field(r, 'metrics', 'stats', 'mlxActiveEndBytes'), 'valid'),
}


def summarize_metric(rows, name):
    unit, direction, extract, eligible = METRICS[name]
    grouped = {}
    for row in rows:
        arms = grouped.setdefault(row['round'], {})
        if row['arm'] in arms:
            raise ValueError('duplicate measurement coordinate')
        arms[row['arm']] = row
    samples, excluded = [], []
    for number_of_round, arms in sorted(grouped.items()):
        a, b = arms.get('reference'), arms.get('combined')
        if a is None or b is None or a.get(eligible) is not True or b.get(eligible) is not True:
            excluded.append(number_of_round)
            continue
        av, bv = extract(a), extract(b)
        if not number(av) or not number(bv, zero=direction == 'lower'):
            excluded.append(number_of_round)
            continue
        ratio = bv / av
        improvement = 100 * ((1 - ratio) if direction == 'lower' else (ratio - 1))
        if not math.isfinite(improvement):
            excluded.append(number_of_round)
            continue
        samples.append({'round': number_of_round, 'reference': av, 'combined': bv,
                        'improvement_percent': improvement})
    enough = len(samples) >= 5
    return {'unit': unit, 'better': direction, 'clean_pairs': len(samples), 'minimum_pairs': 5,
            'measured': enough, 'excluded_or_unavailable_rounds': excluded,
            'median_reference': statistics.median(s['reference'] for s in samples) if enough else None,
            'median_combined': statistics.median(s['combined'] for s in samples) if enough else None,
            'median_improvement_percent': statistics.median(s['improvement_percent'] for s in samples) if enough else None,
            'samples': samples}


def report(directory):
    directory, packet, contract = campaign.load_packet(directory)
    state = campaign.status(directory)
    workloads = {}
    for row in state['stages']:
        if not row['stage'].startswith('paired/') or row['status'] != 'passed':
            continue
        name = row['stage'].split('/')[1]
        path = directory / row['stage'] / 'evidence/results.jsonl'
        rows = [json.loads(line) for line in path.read_text().splitlines()]
        protocol = contract['paired_protocols'][name]
        workloads[name] = {'results_sha256': digest(path), 'output_tokens': protocol['max_tokens'],
            'memory_target_gb': protocol['memory_gb'], 'mtp': protocol['mtp'],
            'metrics': {name: summarize_metric(rows, name) for name in METRICS}}
    return {'classification': 'Descriptive paired measurements within individually qualified workloads',
        'build_identity': contract['build_identity'], 'contract_sha256': packet['contract_sha256'],
        'reporter_sha256': digest(Path(__file__)), 'qualification_complete': state['qualification_complete'],
        'activation_performed': False, 'workloads': workloads,
        'percentage_method': 'Median of per-pair percentage improvements; positive means faster or less memory. No cross-workload aggregation.',
        'active_emission_method': '(output tokens - 1) / sum(interTokenSeconds), between the first and last sampled emissions. No rate for one-token requests.',
        'decode_phase_method': 'output tokens / decodeSeconds, including any terminal work and retention bookkeeping.',
        'limits': 'Active emission rates cover these short fixed workloads; they do not establish longer-run equilibrium throughput. Tensor allocation and sampled process footprint are distinct.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--packet', type=Path, required=True)
    parser.add_argument('--out', type=Path)
    args = parser.parse_args()
    result = report(args.packet)
    if args.out:
        campaign.write_new(args.out, result)
    print(json.dumps(result, indent=2, allow_nan=False))
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/optimization_results_test.py

SHA-256 `7cc829aa16726312d115dad41692010a19c5637f6206bc481fd721eae99c15e1`; 4969 bytes.

````text
"""Numerical reporting checks, including the terminal-forward TPS distinction."""
import copy
import math
import unittest

import optimization_campaign as campaign
import optimization_campaign_test as fixtures
import optimization_results as results


class ResultTests(unittest.TestCase):
    def test_active_rate_excludes_first_token_and_terminal_work(self):
        row = {'metrics': {'output_ids': [1, 2, 3, 4], 'stats': {
            'decodeTokens': 4, 'decodeSeconds': .8, 'interTokenSeconds': [.1, .1, .1]}}}
        before = results.active_emission_tps(row)
        row['metrics']['stats']['decodeSeconds'] = .4
        self.assertAlmostEqual(before, 10)
        self.assertEqual(before, results.active_emission_tps(row))
        self.assertEqual(results.decode_phase_tps(row), 10)

    def test_missing_single_token_and_invalid_intervals_have_no_active_rate(self):
        row = {'metrics': {'output_ids': [1, 2, 3], 'stats': {'decodeTokens': 3, 'interTokenSeconds': [.1, .1]}}}
        for values in (None, [], [.1], [0, 0], [.1, -1], [.1, True], [.1, math.nan], [.1, math.inf], [1e308, 1e308], [1e-320, 1e-320], [10**1000, 0]):
            current = copy.deepcopy(row)
            current['metrics']['stats']['interTokenSeconds'] = values
            self.assertIsNone(results.active_emission_tps(current), values)
        row['metrics'].update(output_ids=[1], stats={'decodeTokens': 1, 'interTokenSeconds': []})
        self.assertIsNone(results.active_emission_tps(row))

    @staticmethod
    def pairs(reference, candidate):
        return [{'round': index, 'arm': arm, 'valid': True, 'client_seconds': value}
                for index, values in enumerate(zip(reference, candidate), 1)
                for arm, value in zip(('reference', 'combined'), values)]

    def test_percentages_use_median_of_paired_ratios(self):
        rows = self.pairs([1, 2, 3, 100, 200], [.9, .2, 2.7, 50, 100])
        report = results.summarize_metric(rows, 'request_seconds')
        self.assertTrue(report['measured'])
        self.assertEqual(report['median_improvement_percent'], 50)
        self.assertAlmostEqual(100 * (1 - report['median_combined'] / report['median_reference']), 10)

    def test_timing_exclusions_and_missing_values_cannot_fill_the_minimum(self):
        rows = self.pairs([1] * 5, [.8] * 5)
        rows[-1]['valid'] = False
        report = results.summarize_metric(rows, 'request_seconds')
        self.assertFalse(report['measured'])
        self.assertIsNone(report['median_improvement_percent'])
        self.assertEqual(report['clean_pairs'], 4)
        rows[-1].update(valid=True, client_seconds=None)
        self.assertFalse(results.summarize_metric(rows, 'request_seconds')['measured'])

    def test_startup_and_measured_eligibility_are_separate(self):
        rows = self.pairs([1] * 5, [.8] * 5)
        for row in rows:
            row.update(valid=False, startup_and_warmup_valid=True,
                       first_request={'complete_seconds_from_launch': 2.0})
        self.assertTrue(results.summarize_metric(rows, 'fresh_process_first_job_seconds')['measured'])
        self.assertFalse(results.summarize_metric(rows, 'request_seconds')['measured'])

    def test_peak_savings_use_the_maximum_physical_interval_without_adding_it(self):
        rows = self.pairs([1] * 5, [.8] * 5)
        for row in rows:
            peak = 800 if row['arm'] == 'reference' else 600
            row['metrics'] = {'stats': {'sampledFootprint': {'peakBytes': peak},
                'imagePreparation': {'sampledFootprint': {'peakBytes': 1000 if row['arm'] == 'reference' else 700}}}}
        value = results.summarize_metric(rows, 'sampled_process_peak_bytes')
        self.assertEqual(value['median_reference'], 1000)
        self.assertEqual(value['median_combined'], 700)
        self.assertAlmostEqual(value['median_improvement_percent'], 30)

    def test_duplicate_coordinate_cannot_multiply_its_statistical_weight(self):
        rows = self.pairs([1] * 5, [.8] * 5)
        with self.assertRaisesRegex(ValueError, 'duplicate'):
            results.summarize_metric(rows + [rows[0]], 'request_seconds')

    def test_unqualified_workloads_never_generate_speedup_claims(self):
        fixture = fixtures.CampaignTests()
        fixture.setUp()
        self.addCleanup(fixture.doCleanups)
        self.assertEqual(results.report(fixture.packet)['workloads'], {})
        fixture.complete_native()
        campaign.run_one(fixture.packet)
        report = results.report(fixture.packet)
        self.assertFalse(report['qualification_complete'])
        self.assertEqual(set(report['workloads']), {'short-one'})
        metrics = report['workloads']['short-one']['metrics']
        self.assertFalse(metrics['active_emission_tokens_per_second']['measured'])
        self.assertAlmostEqual(metrics['request_seconds']['median_improvement_percent'], 20)
        fixture.launch.assert_not_called()


if __name__ == '__main__':
    unittest.main()
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/optimization_soak.py

SHA-256 `61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e`; 32183 bytes.

````text
#!/usr/bin/env python3
"""Bounded repeated-request lifetime qualification; no latency improvement claims."""
import argparse
from contextlib import contextmanager
import http.client
import json
import math
import os
from pathlib import Path
import shutil
import signal
import socket
import subprocess
import time

import serve_bench as bench
from prefill_bench import ROOT, digest, model_identity, preflight, vm_snapshot


@contextmanager
def wall_deadline(seconds):
    """Bound the complete live-server interval, including a stalled response.

    Socket timeouts alone bound each blocking read, not a stream that keeps
    delivering small frames. This standalone driver owns its main-thread timer.
    Cleanup happens outside the deadline so the owned server is always reaped.
    """
    if signal.getitimer(signal.ITIMER_REAL) != (0.0, 0.0):
        raise RuntimeError('another real-time alarm is already active')
    previous = signal.getsignal(signal.SIGALRM)
    def expired(signum, frame):
        raise TimeoutError('fixed lifetime duration exhausted')
    signal.signal(signal.SIGALRM, expired)
    try:
        signal.setitimer(signal.ITIMER_REAL, seconds)
        yield
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0)
        signal.signal(signal.SIGALRM, previous)


def clean_resource_observation(row, protocol):
    metrics = row.get('metrics') or {}
    stats = metrics.get('stats') or {}
    errors = bench.resource_exclusions(stats, {
        'maximum_sampled_footprint_bytes': protocol['acceptance']['maximum_sampled_physical_peak_bytes'],
        'require_nominal_power_state': True,
        'images': row.get('has_image', False),
    })
    for before, after in [(row.get('before'), row.get('after')),
                          (stats.get('generatorVMBefore'), stats.get('generatorVMAfter'))]:
        if not isinstance(before, dict) or not isinstance(after, dict) or any(
            type(before.get(k)) is not int or type(after.get(k)) is not int or before[k] != after[k]
            for k in ['swapins', 'swapouts']):
            errors.append('missing or changed VM interval')
    return not errors, errors


def assess(protocol, rows):
    gate = protocol['acceptance']
    names = [item['name'] for item in protocol['sequence']]
    cycles = protocol['measured_cycles']
    warmup = protocol['warmup_cycles']
    expected = [(cycle, name) for cycle in range(-warmup, cycles) for name in names]
    coordinates = [(row['cycle'], row['name']) for row in rows]
    if len(coordinates) != len(set(coordinates)) or any(c not in expected for c in coordinates):
        raise ValueError('duplicate or undeclared soak request')
    checks = {'fixed_sequence_completed': coordinates == expected,
              'all_requests_succeeded': all(row.get('succeeded') is True for row in rows)}
    # Runtime failures and absolute overflows are failures even during warmup.
    peaks = [bench.sampled_request_peak((r.get('metrics') or {}).get('stats') or {}) for r in rows]
    checks['physical_ceiling'] = bool(peaks) and all(type(p) is int and 0 < p <=
        gate['maximum_sampled_physical_peak_bytes'] for p in peaks)
    details = []
    for name in names:
        selected = [r for r in rows if r['cycle'] >= 0 and r['name'] == name]
        clean = [r for r in selected if clean_resource_observation(r, protocol)[0]]
        early = [r for r in clean if r['cycle'] < cycles // 2]
        late = [r for r in clean if r['cycle'] >= cycles // 2]
        one = {'minimum_clean_observations': len(clean) >= gate['minimum_clean_observations_per_position'],
               'early_observations': len(early) >= gate['minimum_clean_early_observations_per_position'],
               'late_observations': len(late) >= gate['minimum_clean_late_observations_per_position']}
        outputs = [(r.get('metrics', {}).get('output_ids'), r.get('text')) for r in selected]
        one['exact_replay'] = bool(outputs) and bool(outputs[0][0]) and all(v == outputs[0] for v in outputs)
        growth = {}
        for field, limit in [('mlxActiveEndBytes', gate['maximum_active_growth_bytes_per_position']),
                             ('physicalFootprintEndBytes', gate['maximum_physical_end_growth_bytes_per_position'])]:
            a = [r['metrics']['stats'].get(field) for r in early]
            b = [r['metrics']['stats'].get(field) for r in late]
            valid = bool(a) and bool(b) and all(type(v) is int and v > 0 for v in a + b)
            growth[field] = max(b) - min(a) if valid else None
            one[field] = valid and growth[field] <= limit
        embedding_bytes = [(r.get('metrics') or {}).get('stats', {}).get('embeddingCachedPayloadBytes')
                           for r in selected]
        one['bounded_embedding_rows'] = bool(embedding_bytes) and all(
            type(value) is int and 0 <= value <= gate['maximum_cached_embedding_payload_bytes']
            for value in embedding_bytes)
        one['embedding_rows_enabled'] = bool(selected) and all(
            (r.get('metrics') or {}).get('stats', {}).get('embeddingRowsEnabled') is True for r in selected)
        one['bounded_prefix_capacity'] = bool(selected) and all(
            r.get('prefix', {}).get('enabled') is True
            and type(r['prefix'].get('conversations')) is int
            and 1 <= r['prefix']['conversations'] <= gate['maximum_prefix_entries']
            and type(r['prefix'].get('charged_token_capacity')) is int
            and type(r['prefix'].get('max_tokens')) is int
            and 0 <= r['prefix']['charged_token_capacity'] <= r['prefix']['max_tokens']
            for r in selected)
        details.append({'name': name, 'passed': all(one.values()), 'checks': one,
                        'clean_cycles': [r['cycle'] for r in clean], 'observed_growth_bytes': growth})
    checks['positions_pass'] = all(d['passed'] for d in details)
    return {'classification': 'Bounded repeated-request lifetime qualification; no throughput or unbounded-lifetime claim',
            'passed': all(checks.values()), 'checks': checks, 'positions': details}


def prefix_snapshot(port):
    connection = http.client.HTTPConnection('127.0.0.1', port, timeout=10)
    try:
        connection.request('POST', '/api/show', b'{}', {'Content-Type': 'application/json'})
        response = connection.getresponse()
        data = response.read(1 << 20)
        if response.status != 200 or len(data) >= 1 << 20:
            raise ValueError('bounded prefix snapshot unavailable')
        return json.loads(data)['details']['prefix_cache']
    finally:
        connection.close()


def qualification_contract(protocol, build):
    """Bind every workload and control to one reviewed pre-run matrix.

    A passing report with the right build and a different directory can still
    be the wrong workload. The separate frozen contract prevents relabeling a
    study or changing the soak's controls after its prerequisites were run.
    """
    binding = protocol.get('qualification_contract')
    if not isinstance(binding, dict) or set(binding) != {'path', 'sha256'}:
        raise ValueError('a frozen qualification contract is required')
    path = Path(binding['path'])
    if not path.is_file() or not 0 < path.stat().st_size <= 2_000_000 or digest(path) != binding['sha256']:
        raise ValueError('qualification contract identity or size differs')
    contract = json.loads(path.read_text())
    keys = {'format', 'build_identity', 'native', 'paired_protocols', 'soak_modes'}
    if not isinstance(contract, dict) or set(contract) != keys or contract['format'] != 'slotstream-qualification-v1':
        raise ValueError('invalid qualification contract format')
    identity_keys = {'binary_sha256', 'source_archive_sha256', 'metallib_sha256'}
    identity = contract['build_identity']
    if not isinstance(identity, dict) or set(identity) != identity_keys or any(
            not isinstance(identity[k], str) or len(identity[k]) != 64
            or identity[k] != build['identity'].get(k) for k in identity_keys):
        raise ValueError('qualification contract belongs to another build')
    modes = contract['soak_modes']
    declared = {k: v for k, v in protocol.items() if k not in {'qualification_contract', 'prerequisites'}}
    if (not isinstance(modes, dict) or set(modes) != {'off', 'on'}
            or declared != modes.get(protocol.get('mtp'))):
        raise ValueError('soak workload or controls differ from the frozen qualification contract')
    return contract


def validate_paired_execution(name, protocol, rows, warmups):
    """Timing exclusions never excuse wrong, missing or over-budget requests.

    The final matrix may exclude completed cells from timing for VM/thermal
    activity. Every attempted cell must still deliver the frozen workload and
    the same outputs. A preflight refusal leaves final qualification incomplete.
    This does not rescore or modify earlier component studies.
    """
    def refuse(reason):
        raise ValueError(f'paired execution failed for {name}: {reason}')

    mode = protocol.get('mtp', 'off')
    ceiling = protocol.get('maximum_sampled_footprint_bytes')
    minimum, maximum = protocol.get('minimum_output_tokens'), protocol.get('max_tokens')
    if (type(mode) is not str or mode not in {'off', 'on'} or type(ceiling) is not int or ceiling <= 0
            or type(minimum) is not int or type(maximum) is not int
            or not 1 <= minimum <= maximum <= 512):
        refuse('missing or invalid workload/resource bounds')
    anchors, pools, work = {}, {}, {}
    for row in rows:
        if 'error' in row or row.get('interrupted') is True:
            refuse('failed or interrupted request, regardless of timing eligibility')
        arm = protocol.get('arms', {}).get(row.get('arm'), {})
        metrics, first = row.get('metrics'), row.get('first_request')
        if type(metrics) is not dict or type(first) is not dict:
            refuse('both first and measured responses must be captured')
        for phase, data, text in [('first', first, first.get('text')),
                                  ('measured', metrics, row.get('text'))]:
            prompt, output = data.get('prompt_ids'), data.get('output_ids')
            if (type(prompt) is not list or not prompt or type(output) is not list
                    or not minimum <= len(output) <= maximum
                    or any(type(token) is not int or token < 0 for token in prompt + output)
                    or type(text) is not str):
                refuse(f'{phase} response has missing, malformed or truncated tokens/text')
            if type(data.get('effective_mtp')) is not bool or data['effective_mtp'] != (mode == 'on'):
                refuse(f'{phase} speculative mode differs from the declared workload')
            slots = data.get('effective_pool_slots')
            if type(slots) is not int or slots <= 0:
                refuse(f'{phase} pool size is missing or invalid')
            if protocol.get('comparison_basis', 'fixed-pool') == 'fixed-pool':
                if slots != pools.setdefault(phase, slots):
                    refuse(f'{phase} fixed pool differs between cells')
            observation = (tuple(prompt), tuple(output), text)
            if observation != anchors.setdefault(phase, observation):
                refuse(f'{phase} input/output differs, including a timing-excluded cell')
        if metrics.get('effective_prefill_chunk') != arm.get('chunk'):
            refuse('measured prefill setting differs from the frozen arm')
        if type(metrics.get('stats')) is not dict:
            refuse('measured statistics are missing or malformed')
        warm = warmups[(row['round'], row['arm'])]
        warm_metrics = warm.get('metrics') if type(warm) is dict else None
        if (type(warm_metrics) is not dict or type(warm_metrics.get('stats')) is not dict
                or warm.get('text') != first.get('text')
                or any(warm_metrics.get(field) != first.get(field) for field in
                       ['prompt_ids', 'output_ids', 'effective_mtp', 'effective_pool_slots'])
                or warm_metrics.get('effective_prefill_chunk') != arm.get('chunk')):
            refuse('hashed warmup response differs from its captured first request')
        prefix = protocol.get('prefix_cache', {})
        complete = (prefix.get('complete_prompt') is True
                    and prefix.get('expected_reused_tokens', {}).get(row['arm'], 0) > 0)
        try:
            stats = bench.validate_metrics(metrics, allow_complete_prompt=complete)
            warm_stats = bench.validate_metrics(warm_metrics)
        except (KeyError, TypeError, ValueError) as error:
            refuse(f'invalid measured response: {error}')
        for phase, data, observation in [('first', warm_metrics, warm_stats),
                                          ('measured', metrics, stats)]:
            reused = observation.get('reusedPrefixTokens', 0)
            if (observation.get('runtimeError') is not None
                    or observation['decodeTokens'] != len(data['output_ids'])
                    or type(observation.get('promptTokens')) is not int
                    or observation['promptTokens'] != len(data['prompt_ids'])
                    or type(reused) is not int or reused < 0
                    or observation['prefillTokens'] + reused != observation['promptTokens']):
                refuse(f'{phase} completion error or token counters differ from captured IDs')
        peaks = [bench.sampled_request_peak(s) for s in [stats, warm_stats]]
        if any(type(peak) is not int or not 0 < peak <= ceiling for peak in peaks):
            refuse('absolute first/measured footprint ceiling, regardless of timing eligibility')
        durations = [row.get('client_seconds'), row.get('startup_seconds'),
                     first.get('complete_seconds_from_launch'), stats.get('requestSeconds')]
        if any(type(value) not in (int, float) or not math.isfinite(value) or value <= 0
               for value in durations):
            refuse('missing or invalid completed-request duration')
        for field in protocol.get('required_equal_work', []):
            value = stats.get(field)
            if type(value) is not int or value < 0 or value != work.setdefault(field, value):
                refuse(f'declared equal work differs: {field}')


def validate_prerequisites(protocol, build, *, native_only=False):
    """Require the final candidate's native and paired evidence before launch.

    Digests bind the exact reports; same-binary/source/Metal identity prevents
    borrowing a passing gate from an earlier implementation. Paired decisions
    are recomputed from their frozen rows using the ordinary benchmark gates.
    The campaign's pre-benchmark boundary may request native_only; the actual
    soak entry point always requires every native and paired prerequisite.
    """
    if type(native_only) is not bool:
        raise ValueError('native-only boundary requires an explicit Boolean')
    required_native = {'combined-plain', 'combined-mtp', 'read-failure-serving'}
    required_paired = {'short-one', 'unique-prose', 'sampled-short', 'mtp-resource',
                       'distinct-tail', 'complete-repeat', 'unique-with-retention', 'actual-default-one-token'}
    prerequisites = protocol.get('prerequisites')
    if not isinstance(prerequisites, dict) or set(prerequisites) != {'native', 'paired'}:
        raise ValueError('native and paired final-candidate prerequisites are mandatory')
    for kind, names in [('native', required_native), ('paired', required_paired)]:
        if native_only and kind == 'paired':
            continue
        if not isinstance(prerequisites[kind], dict) or set(prerequisites[kind]) != names:
            raise ValueError(f'complete {kind} prerequisite set required')
    contract = qualification_contract(protocol, build)
    for field, names in [('native', required_native), ('paired_protocols', required_paired)]:
        if not isinstance(contract[field], dict) or set(contract[field]) != names:
            raise ValueError(f'qualification contract requires every {field} workload')

    def same_identity(identity):
        return isinstance(identity, dict) and all(identity.get(k) == build['identity'].get(k)
            and isinstance(identity.get(k), str) and len(identity[k]) == 64
            for k in ['binary_sha256', 'source_archive_sha256', 'metallib_sha256'])

    def evidence(entry, name):
        path = Path(entry['directory']) / name
        expected = entry.get('sha256', {}).get(name)
        if type(expected) is not str or not path.is_file() or digest(path) != expected:
            raise ValueError(f'prerequisite digest differs: {path}')
        return path

    # Preserve the exact parsed contract with the receipt, not just its path.
    observed = {'qualification_contract': contract}
    for name, entry in prerequisites['native'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        report = json.loads(evidence(entry, 'stdout.txt').read_text())
        items = report.get('items')
        if (not same_identity(manifest.get('identity')) or manifest.get('passed') is not True
                or manifest.get('exit_code') != 0 or report.get('passed') is not True
                or report.get('skipped') is not None or not isinstance(items, list) or not items
                or any(item.get('passed') is not True for item in items)
                or manifest.get('assertions') != len(items)):
            raise ValueError(f'native prerequisite failed or belongs to another build: {name}')
        command = manifest.get('command') or []
        if contract['native'][name] != {'command': command, 'environment': manifest.get('environment', {})}:
            raise ValueError(f'native workload or controls differ from the frozen contract: {name}')
        variants = {'combined-plain': ['integrated', 'integrated-vision-query'],
                    'combined-mtp': ['integrated-mtp', 'integrated-vision-query-mtp'],
                    'read-failure-serving': ['read-failure-serving']}[name]
        if ('optimization-state-check' not in command or '--variant' not in command
                or command.index('--variant') + 1 >= len(command)
                or command[command.index('--variant') + 1] not in variants):
            raise ValueError(f'native prerequisite has the wrong diagnostic: {name}')
        observed[name] = {'passed': True, 'assertions': len(items)}

    if native_only:
        return observed

    paired_directories = [str(Path(entry['directory']).resolve()) for entry in prerequisites['paired'].values()]
    if len(set(paired_directories)) != len(required_paired):
        raise ValueError('each paired workload requires its own study')
    for name, entry in prerequisites['paired'].items():
        manifest = json.loads(evidence(entry, 'manifest.json').read_text())
        completion = json.loads(evidence(entry, 'completion.json').read_text())
        rows = [json.loads(line) for line in evidence(entry, 'results.jsonl').read_text().splitlines()]
        declared = manifest['protocol']
        if declared != contract['paired_protocols'][name]:
            raise ValueError(f'paired workload or controls differ from the frozen contract: {name}')
        if name == 'actual-default-one-token':
            selected = declared.get('arms', {}).get('combined', {})
            prefix = declared.get('prefix_cache', {})
            if (selected.get('env') != {} or declared.get('max_tokens') != 1
                    or declared.get('minimum_output_tokens') != 1
                    or prefix.get('retention_only') is not True
                    or prefix.get('expected_reused_tokens') != {'reference': 0, 'combined': 0}):
                raise ValueError('actual-default guard requires unoverridden defaults, one output token and enabled unique-prompt retention')
        arms = manifest.get('arm_builds') or {}
        if (not arms or any(not same_identity(arm.get('identity')) for arm in arms.values())
                or completion.get('interrupted') is not False or completion.get('stopped_early') is not False
                or declared.get('rounds') != 16 or len(arms) != 2 or 'reference' not in arms
                or completion.get('planned_cells') != 32 or completion.get('recorded_cells') != 32
                or len(rows) != 32 or 'error' in completion):
            raise ValueError(f'paired prerequisite incomplete or belongs to another build: {name}')
        coordinates = [(row['round'], row['arm']) for row in rows]
        if len(set(coordinates)) != 32 or set(coordinates) != {
                (i, arm) for i in range(1, 17) for arm in arms}:
            raise ValueError(f'paired prerequisite has missing or duplicate cells: {name}')
        warmups = {(row['round'], row['arm']): json.loads(evidence(entry,
            f"{row['round']}-{row['arm']}/warmup.json").read_text()) for row in rows}
        validate_paired_execution(name, declared, rows, warmups)
        if not declared.get('acceptance') or not declared.get('startup_acceptance'):
            raise ValueError(f'paired prerequisite lacks both frozen acceptance gates: {name}')
        gate, first = declared['acceptance'], declared['startup_acceptance']
        required_gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
        if name in {'short-one', 'distinct-tail', 'complete-repeat'}:
            required_gate.update(minimum_median_client_reduction=.05, minimum_positive_fraction=.8)
        else:
            required_gate.update(maximum_median_client_regression=.05, minimum_positive_fraction=0)
        if name in {'unique-prose', 'sampled-short', 'mtp-resource'}:
            required_gate.update(minimum_active_savings_bytes=300_000_000,
                                 minimum_sampled_peak_savings_bytes=200_000_000)
        if (gate != required_gate or first != {'minimum_pairs': 5,
                'maximum_median_first_job_regression': .05, 'all_outputs_exact': True}):
            raise ValueError(f'paired prerequisite weakens final-matrix bounds: {name}')
        summary = bench.summaries(rows, 'reference', declared.get('comparison_basis', 'fixed-pool'),
                                  declared.get('required_equal_work'))
        accepted = bench.acceptance_results(summary, declared['acceptance'])
        startup = bench.startup_acceptance_results(rows, 'reference', declared['startup_acceptance'])
        if (not accepted or not startup or any(item.get('passed') is not True for item in accepted + startup)
                or accepted != completion.get('acceptance') or startup != completion.get('startup_acceptance')):
            raise ValueError(f'paired prerequisite fails recomputed request/first-job gates: {name}')
        observed[name] = {'passed': True, 'cells': len(rows)}
    return observed


def validate_protocol(protocol):
    integer_fields = ['memory_gb', 'max_context', 'warmup_cycles', 'measured_cycles',
                      'maximum_duration_seconds_per_mode', 'maximum_prompt_tokens', 'maximum_output_tokens']
    if any(type(protocol.get(key)) is not int for key in integer_fields):
        raise ValueError('soak limits require explicit integer values')
    if (protocol.get('classification') != 'Frozen combined lifetime qualification'
            or protocol.get('memory_gb') != 10 or protocol.get('max_context') != 32768
            or protocol.get('mtp') not in ['off', 'on']
            or protocol.get('warmup_cycles') != 2 or protocol.get('measured_cycles') != 8
            or protocol.get('maximum_duration_seconds_per_mode') != 900
            or protocol.get('maximum_prompt_tokens') != 1024 or protocol.get('maximum_output_tokens') != 8):
        raise ValueError('soak requires the explicit bounded and frozen lifetime protocol')
    sequence = protocol.get('sequence')
    if not isinstance(sequence, list) or len(sequence) != 6:
        raise ValueError('soak requires the frozen six-request cycle')
    names = [item.get('name') for item in sequence]
    if any(type(n) is not str or not n.replace('-', '').isalnum() for n in names) or len(set(names)) != len(names):
        raise ValueError('request labels must be unique safe names')
    gate = protocol.get('acceptance') or {}
    limits = {'maximum_sampled_physical_peak_bytes': 10_000_000_000,
              'maximum_active_growth_bytes_per_position': 64 << 20,
              'maximum_physical_end_growth_bytes_per_position': 256 << 20,
              'maximum_cached_embedding_payload_bytes': 11_796_480,
              'maximum_prefix_entries': 4, 'minimum_clean_observations_per_position': 5,
              'minimum_clean_early_observations_per_position': 2,
              'minimum_clean_late_observations_per_position': 2, 'replacement_cycles': 0}
    if any(type(gate.get(k)) is not int or gate[k] != v for k, v in limits.items()):
        raise ValueError('lifetime bounds must match the frozen contract')
    if any(gate.get(k) is not True for k in ['all_expected_requests_complete',
        'exact_per_position_replay_after_warmup', 'prefix_charge_within_declared_capacity',
        'nominal_power_and_unchanged_request_vm_for_resource_observations']):
        raise ValueError('lifetime evidence and exactness requirements cannot be weakened')
    arm = {'reference': {'chunk': 256, 'env': protocol.get('env')}}
    bench.validate_arms(arm)
    requests = {}
    for item in sequence:
        path = Path(item['fixture'])
        if not path.is_file() or not 1 <= path.stat().st_size <= 4096 or digest(path) != item['fixture_sha256']:
            raise ValueError('soak fixture identity/size differs')
        count = item.get('outputs')
        if type(count) is not int or not 1 <= count <= 8:
            raise ValueError('bounded explicit output required')
        request = {'memory_gb': 10, 'raw': item['raw'], 'max_tokens': count, 'seed': 7}
        for key in ['think', 'sampling']:
            if key in item: request[key] = item[key]
        if 'image' in item:
            request['images'] = [{'path': item['image'], 'sha256': item['image_sha256']}]
        requests[item['name']] = bench.request_body(request, path.read_text())
    return requests


def main():
    def interrupted(signum, frame):
        raise KeyboardInterrupt(f'received signal {signum}')
    signal.signal(signal.SIGTERM, interrupted)
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    protocol = json.loads(args.protocol.read_text())
    requests = validate_protocol(protocol)
    build = bench.verified_build(protocol['binary'])
    bench.validate_declared_binary(protocol, {'reference': build})
    if 'frozen_binary_sha256' not in protocol:
        raise ValueError('a frozen binary binding is mandatory')
    prerequisites = validate_prerequisites(protocol, build)
    model = Path(protocol['model']).resolve()
    args.out.mkdir(parents=True, exist_ok=False)
    for name, request in requests.items():
        (args.out / f'request-{name}.json').write_bytes(request)
    for source in [Path(__file__), Path(bench.__file__), ROOT / 'Tools/prefill_bench.py']:
        shutil.copyfile(source, args.out / source.name)
    shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', args.out / 'build-source.tar.gz')
    manifest = {'protocol': protocol, 'protocol_sha256': digest(args.protocol), 'build': build,
                'model': model_identity(model), 'classification': 'One sequential bounded model process',
                'prerequisites': prerequisites, 'passed': False}
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    rows = []
    child = None
    try:
        if bench.competing_jobs(): raise RuntimeError('competing build/storage work; model not launched')
        manifest['before'] = preflight(13)
        with socket.socket() as reservation:
            reservation.bind(('127.0.0.1', 0)); port = reservation.getsockname()[1]
        command = [build['binary'], 'serve', '--port', str(port), '--model', str(model),
                   '--memory-gb', '10', '--max-context', '32768', '--mtp', protocol['mtp'], '--no-elastic']
        env = {k: v for k, v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(protocol['env'], SLOTSTREAM_BENCH_DETAILS='1', SLOTSTREAM_PREFILL_CHUNK='256')
        manifest['command'] = command
        start = time.monotonic()
        with wall_deadline(protocol['maximum_duration_seconds_per_mode']), \
                (args.out / 'server.stdout').open('wb') as stdout, \
                (args.out / 'server.stderr').open('wb') as stderr:
            child = subprocess.Popen(command, cwd=ROOT, env=env, stdout=stdout, stderr=stderr, start_new_session=True)
            bench.wait_ready(child, port)
            for cycle in range(-protocol['warmup_cycles'], protocol['measured_cycles']):
                for item in protocol['sequence']:
                    remaining = protocol['maximum_duration_seconds_per_mode'] - (time.monotonic() - start)
                    if remaining <= 0: raise TimeoutError('fixed lifetime duration exhausted')
                    if bench.competing_jobs(): raise RuntimeError('competing build/storage work during soak')
                    row = {'cycle': cycle, 'name': item['name'], 'has_image': 'image' in item,
                           'before': vm_snapshot(), 'succeeded': False}
                    try:
                        measured, wire = bench.exchange(port, requests[item['name']], min(120, remaining),
                                                        allow_complete_prompt=True)
                        row.update(measured, after=vm_snapshot())
                        row['prefix'] = prefix_snapshot(port)
                        (args.out / f'{cycle}-{item["name"]}.ndjson').write_bytes(wire)
                        metrics = row['metrics']; stats = metrics['stats']
                        if (stats.get('runtimeError') is not None or stats['decodeTokens'] != item['outputs']
                                or not 0 < stats['promptTokens'] <= protocol['maximum_prompt_tokens']
                                or metrics['effective_mtp'] != (protocol['mtp'] == 'on')
                                or metrics['effective_prefill_chunk'] != 256):
                            raise ValueError('request output, context or effective mode differs from the protocol')
                        peak = bench.sampled_request_peak(stats)
                        if type(peak) is not int or peak > protocol['acceptance']['maximum_sampled_physical_peak_bytes']:
                            raise ValueError('absolute physical resource bound exceeded or unavailable')
                        row['resource_clean'], row['resource_exclusions'] = clean_resource_observation(row, protocol)
                        row['succeeded'] = True
                    finally:
                        rows.append(row)
                        with (args.out / 'results.jsonl').open('a') as output:
                            output.write(json.dumps(row) + '\n')
                    print(json.dumps({'cycle': cycle, 'name': item['name'], 'resource_clean': row['resource_clean']}), flush=True)
    except (Exception, KeyboardInterrupt) as error:
        manifest['error'] = f'{type(error).__name__}: {error}'
    finally:
        if child is not None: bench.stop_server(child)
        manifest['after'] = vm_snapshot()
    report = assess(protocol, rows)
    manifest['passed'] = report['passed'] and 'error' not in manifest
    (args.out / 'assessment.json').write_text(json.dumps(report, indent=2) + '\n')
    (args.out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    print(json.dumps({'passed': manifest['passed'], 'recorded_requests': len(rows), 'error': manifest.get('error')}))
    return 0 if manifest['passed'] else 1


if __name__ == '__main__':
    raise SystemExit(main())
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/optimization_soak_test.py

SHA-256 `3b61d9e63a6c5fbe79b618324b283826d51ab3085582200df4e276cb1befd0be`; 12472 bytes.

````text
#!/usr/bin/env python3
import copy
from contextlib import ExitStack
import json
from pathlib import Path
import signal
import tempfile
import time
import unittest
from unittest.mock import patch, Mock

import optimization_soak as soak
from optimization_soak import assess, clean_resource_observation, validate_protocol, wall_deadline
from prefill_bench import digest


class SoakTests(unittest.TestCase):
    def setUp(self):
        fixture = Path(__file__).parent / 'fixtures/optimization/short.txt'
        self.protocol = {'classification': 'Frozen combined lifetime qualification',
            'memory_gb': 10, 'max_context': 32768, 'mtp': 'off',
            'warmup_cycles': 2, 'measured_cycles': 8, 'maximum_duration_seconds_per_mode': 900,
            'maximum_prompt_tokens': 1024, 'maximum_output_tokens': 8, 'env': {},
            'sequence': [{'name': str(i), 'fixture': str(fixture), 'fixture_sha256': digest(fixture),
                          'raw': True, 'outputs': 8} for i in range(6)],
            'acceptance': {'all_expected_requests_complete': True,
                'exact_per_position_replay_after_warmup': True, 'prefix_charge_within_declared_capacity': True,
                'nominal_power_and_unchanged_request_vm_for_resource_observations': True,
                'maximum_sampled_physical_peak_bytes': 10_000_000_000,
                'maximum_active_growth_bytes_per_position': 64 << 20,
                'maximum_physical_end_growth_bytes_per_position': 256 << 20,
                'maximum_cached_embedding_payload_bytes': 11_796_480,
                'maximum_prefix_entries': 4, 'minimum_clean_observations_per_position': 5,
                'minimum_clean_early_observations_per_position': 2,
                'minimum_clean_late_observations_per_position': 2, 'replacement_cycles': 0}}
        vm = {'swapins': 0, 'swapouts': 0}
        system = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
        stats = {'mlxActiveEndBytes': 1_000_000_000, 'physicalFootprintEndBytes': 2_000_000_000,
                 'sampledFootprint': {'peakBytes': 3_000_000_000}, 'embeddingCachedPayloadBytes': 1000,
                 'embeddingRowsEnabled': True,
                 'generatorVMBefore': vm, 'generatorVMAfter': vm,
                 'generatorSystemBefore': system, 'generatorSystemAfter': system}
        base = {'succeeded': True, 'before': vm, 'after': vm, 'text': 'same', 'has_image': False,
                'prefix': {'enabled': True, 'conversations': 4, 'charged_token_capacity': 256, 'max_tokens': 1024},
                'metrics': {'output_ids': [7], 'stats': stats}}
        self.rows = [copy.deepcopy(base) | {'cycle': cycle, 'name': str(i)}
                     for cycle in range(-2, 8) for i in range(6)]

    def test_fixed_completed_sequence_and_bounded_growth_pass(self):
        self.assertEqual(len(validate_protocol(self.protocol)), 6)
        self.assertTrue(assess(self.protocol, self.rows)['passed'])

    def test_late_growth_cannot_hide_behind_stable_other_positions(self):
        for field, growth in [('mlxActiveEndBytes', (64 << 20) + 1),
                               ('physicalFootprintEndBytes', (256 << 20) + 1)]:
            rows = copy.deepcopy(self.rows)
            rows[-1]['metrics']['stats'][field] += growth
            self.assertFalse(assess(self.protocol, rows)['passed'])

    def test_swap_exclusions_need_enough_early_and_late_evidence(self):
        for cycle in [0, 1, 4]:
            row = next(r for r in self.rows if r['cycle'] == cycle and r['name'] == '0')
            row['after'] = {'swapins': 1, 'swapouts': 0}
            self.assertFalse(clean_resource_observation(row, self.protocol)[0])
        self.assertTrue(assess(self.protocol, self.rows)['passed'])
        next(r for r in self.rows if r['cycle'] == 2 and r['name'] == '0')['after'] = {'swapins': 1, 'swapouts': 0}
        self.assertFalse(assess(self.protocol, self.rows)['passed'])

    def test_excluded_output_changes_are_still_correctness_failures(self):
        self.rows[-1]['after'] = {'swapins': 1, 'swapouts': 0}
        self.rows[-1]['metrics']['output_ids'] = [9]
        self.assertFalse(assess(self.protocol, self.rows)['passed'])

    def test_failure_before_metrics_and_missing_requests_fail_without_crashing(self):
        self.rows[-1] = {'cycle': 7, 'name': '5', 'succeeded': False}
        self.assertFalse(assess(self.protocol, self.rows)['passed'])
        self.assertFalse(assess(self.protocol, self.rows[:-1])['passed'])
        with self.assertRaises(ValueError): assess(self.protocol, self.rows + [self.rows[0]])

    def test_absolute_peak_prefix_and_embedding_caps_are_independent(self):
        for mutate in [lambda r: r['metrics']['stats']['sampledFootprint'].update(peakBytes=10_000_000_001),
                       lambda r: r['prefix'].update(enabled=False),
                       lambda r: r['prefix'].update(conversations=0),
                       lambda r: r['prefix'].update(conversations=5),
                       lambda r: r['prefix'].update(charged_token_capacity=1025),
                       lambda r: r['metrics']['stats'].update(embeddingRowsEnabled=False),
                       lambda r: r['metrics']['stats'].update(embeddingCachedPayloadBytes=11_796_481)]:
            rows = copy.deepcopy(self.rows); mutate(rows[-1])
            self.assertFalse(assess(self.protocol, rows)['passed'])

    def test_draft_or_relaxed_limits_refuse_before_execution(self):
        for key, value in [('classification', 'UNRUN DRAFT'), ('memory_gb', 20), ('max_context', 65536),
                           ('mtp', 'auto'), ('measured_cycles', 100), ('maximum_output_tokens', 999),
                           ('warmup_cycles', 2.0), ('measured_cycles', True)]:
            with self.assertRaises(ValueError): validate_protocol(self.protocol | {key: value})
        p = copy.deepcopy(self.protocol); p['acceptance']['replacement_cycles'] = 1
        with self.assertRaises(ValueError): validate_protocol(p)
        p = copy.deepcopy(self.protocol); p['sequence'][0]['fixture_sha256'] = '0' * 64
        with self.assertRaises(ValueError): validate_protocol(p)

    def test_total_deadline_interrupts_a_blocking_operation_and_restores_alarm(self):
        original = signal.getsignal(signal.SIGALRM)
        start = time.monotonic()
        with self.assertRaisesRegex(TimeoutError, 'fixed lifetime duration exhausted'):
            with wall_deadline(.02):
                signal.pause()
        self.assertLess(time.monotonic() - start, 2)
        self.assertEqual(signal.getitimer(signal.ITIMER_REAL), (0.0, 0.0))
        self.assertEqual(signal.getsignal(signal.SIGALRM), original)
        with wall_deadline(1): pass
        self.assertEqual(signal.getitimer(signal.ITIMER_REAL), (0.0, 0.0))
        with patch.object(signal, 'getitimer', return_value=(1.0, 0.0)):
            with self.assertRaisesRegex(RuntimeError, 'already active'):
                with wall_deadline(1): pass

    def run_mock_driver(self, *, failure=None, startup_failure=None):
        """Exercise all driver phases without a build, model or listening server."""
        original_term = signal.getsignal(signal.SIGTERM)
        try:
            with tempfile.TemporaryDirectory() as directory, ExitStack() as stack:
                root = Path(directory)
                archive = root / 'build-source.tar.gz'; archive.write_bytes(b'frozen source fixture')
                protocol = self.protocol | {'binary': str(root / 'slotstream'),
                    'model': str(root / 'model'), 'frozen_binary_sha256': 'a' * 64}
                path = root / 'protocol.json'; path.write_text(json.dumps(protocol))
                out = root / 'run'
                build = {'binary': protocol['binary'], 'identity': {'binary_sha256': 'a' * 64}}
                row = copy.deepcopy(self.rows[0])
                row['metrics']['stats'].update(promptTokens=17, decodeTokens=8)
                row['metrics'].update(effective_mtp=False, effective_prefill_chunk=256)
                row['metrics']['output_ids'] = [7] * 8
                child = Mock()
                def substitute(target, **kwargs):
                    return stack.enter_context(patch(target, **kwargs))
                substitute('sys.argv', new=['optimization_soak.py', '--protocol', str(path), '--out', str(out)])
                substitute('optimization_soak.bench.verified_build', return_value=build)
                substitute('optimization_soak.validate_prerequisites', return_value={'fixture': True})
                substitute('optimization_soak.model_identity', return_value={'fixture': True})
                substitute('optimization_soak.preflight', return_value={})
                substitute('optimization_soak.vm_snapshot', return_value={'swapins': 0, 'swapouts': 0})
                substitute('optimization_soak.bench.competing_jobs', return_value=[])
                substitute('optimization_soak.subprocess.Popen', return_value=child)
                substitute('optimization_soak.bench.wait_ready', side_effect=startup_failure)
                stop = substitute('optimization_soak.bench.stop_server')
                exchange = substitute('optimization_soak.bench.exchange',
                    side_effect=failure, return_value=({'metrics': row['metrics'], 'text': row['text']},
                                                     b'{"fixture":true}\n'))
                substitute('optimization_soak.prefix_snapshot', return_value=row['prefix'])
                substitute('builtins.print')
                code = soak.main()
                manifest = json.loads((out / 'manifest.json').read_text())
                report = json.loads((out / 'assessment.json').read_text())
                records = [json.loads(line) for line in (out / 'results.jsonl').read_text().splitlines()] \
                    if (out / 'results.jsonl').exists() else []
                stop.assert_called_once_with(child)
                self.assertEqual(signal.getitimer(signal.ITIMER_REAL), (0.0, 0.0))
                return code, manifest, report, records, exchange.call_count
        finally:
            signal.signal(signal.SIGTERM, original_term)

    def test_driver_runs_exactly_sixty_requests_and_reaps_its_only_server(self):
        code, manifest, report, rows, calls = self.run_mock_driver()
        self.assertEqual((code, len(rows), calls), (0, 60, 60))
        self.assertTrue(manifest['passed']); self.assertTrue(report['passed'])

    def test_missing_prerequisites_fail_before_output_or_server_creation(self):
        previous = signal.getsignal(signal.SIGTERM)
        try:
            with tempfile.TemporaryDirectory() as directory:
                root = Path(directory); out = root / 'run'
                protocol = self.protocol | {'binary': '/unused/slotstream', 'frozen_binary_sha256': 'a' * 64}
                path = root / 'protocol.json'; path.write_text(json.dumps(protocol))
                with patch('sys.argv', ['optimization_soak.py', '--protocol', str(path), '--out', str(out)]), \
                        patch('optimization_soak.bench.verified_build', return_value={
                            'identity': {'binary_sha256': 'a' * 64}}), \
                        patch('optimization_soak.subprocess.Popen') as launch:
                    with self.assertRaisesRegex(ValueError, 'prerequisites are mandatory'): soak.main()
                    launch.assert_not_called()
                    self.assertFalse(out.exists())
        finally:
            signal.signal(signal.SIGTERM, previous)

    def test_driver_preserves_failure_and_cancellation_and_reaps_server(self):
        for error in [ValueError('HTTP 500 fixture'), KeyboardInterrupt('cancelled'),
                      TimeoutError('fixed lifetime duration exhausted')]:
            with self.subTest(error=type(error).__name__):
                code, manifest, report, rows, calls = self.run_mock_driver(failure=error)
                self.assertEqual((code, len(rows), calls), (1, 1, 1))
                self.assertIn(type(error).__name__, manifest['error'])
                self.assertFalse(report['passed']); self.assertFalse(rows[0]['succeeded'])
        code, manifest, report, rows, calls = self.run_mock_driver(startup_failure=TimeoutError('startup'))
        self.assertEqual((code, len(rows), calls), (1, 0, 0))
        self.assertFalse(manifest['passed']); self.assertFalse(report['passed'])


if __name__ == '__main__':
    unittest.main()
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/static_gates.sh

SHA-256 `e82bf5d6b35bf63a75506fbab3e5282e09b4efe86541ebd5bdf9c5d8eb7ce0b7`; 1910 bytes.

````text
#!/bin/bash
# Fast, weights-free checks suitable for every pull request and release.
set -euo pipefail
cd "$(dirname "$0")/.."
BIN=${SLOTSTREAM_TEST_BINARY:-${BIN:-.build/release/slotstream}}
export BIN SLOTSTREAM_TEST_BINARY="$BIN"

for f in install.sh Tools/*.sh .githooks/*; do
  bash -n "$f"
done
sh -n install.sh
python3 -m py_compile Tools/*.py Tools/reference/*.py Tools/slotpack/*.py
python3 Tools/static_gates_binary_test.py
python3 Tools/installer_gates_binary_test.py
python3 Tools/verify_binary_test.py
python3 Tools/sampler_gates_test.py
python3 Tools/api_generation_test.py
python3 Tools/consumer_smoke_test.py
python3 Tools/e2e_release_test.py
python3 Tools/coverage_ratchet_test.py
python3 Tools/context_qualification_checks.py
python3 Tools/process_cleanup_checks.py
# These use tiny fixtures or mocked processes; none loads MLX, builds Swift,
# reads model weights, or takes the live model lock. Syntax checks alone do
# not exercise their benchmark validity and artifact-identity assertions.
for suite in build_identity optimization_build optimization_serial_build optimization_readiness prefill_bench expert_layout_probe \
             ngram_cache_probe indexer_score_probe vision_capacity_gate \
             optimization_prerequisites optimization_soak optimization_campaign optimization_results; do
  python3 "Tools/${suite}_test.py"
done
Tools/llms_full.sh --check

# The brain: the store validates, MEASUREMENTS.md and PLAN.md match their
# records, and every public number still has its needle on its surfaces.
Tools/brain_gates.sh

(cd bench/parity31 && shasum -a 256 -c SHA256SUMS)

if grep -En 'File\(path: .*sha256: nil\)' Sources/Slotstream/PinnedModel.swift; then
  echo "pinned manifest contains an unhashed file" >&2
  exit 1
fi

"$BIN" runtime-check
"$BIN" pull-check
python3 Tools/slotpack/checks.py
Tools/planner_gates.sh
Tools/installer_gates.sh

echo "STATIC GATES PASS"
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/Tools/static_gates_binary_test.py

SHA-256 `aa07dfd295130d52aaca72810ac7ce65bd701940c06c844a6b7dd7c82f4a9b33`; 10102 bytes.

````text
"""Execute the real static entry point against tiny, model-free fixture tools."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest

SCRIPT = Path(__file__).with_name("static_gates.sh").resolve()
OPTIMIZATION_SUITES = [
    'build_identity', 'optimization_build', 'optimization_serial_build', 'optimization_readiness', 'prefill_bench', 'expert_layout_probe',
    'ngram_cache_probe', 'indexer_score_probe', 'vision_capacity_gate',
    'optimization_prerequisites', 'optimization_soak', 'optimization_campaign', 'optimization_results',
]


class StaticBinarySelection(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix='slotstream-static-selection-')
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.trace = self.root/'trace.jsonl'
        self.suite_trace = self.root/'suite-trace.jsonl'
        for directory in ['Tools/reference', 'Tools/slotpack', '.githooks',
                          'bench/parity31', 'Sources/Slotstream', '.build/release',
                          'legacy binary', 'frozen binary']:
            (self.root/directory).mkdir(parents=True, exist_ok=True)
        self.write('Tools/static_gates.sh', SCRIPT.read_text())
        for path in ['install.sh', '.githooks/pre-commit', 'Tools/llms_full.sh',
                     'Tools/brain_gates.sh', 'Tools/installer_gates.sh']:
            self.write(path, '#!/bin/bash\nexit 0\n')
        # Record the forwarded environment at the nested planner boundary.
        # This stub does not certify the real planner's argument handling.
        self.write('Tools/planner_gates.sh', '''#!/bin/bash
set -eu
BIN=${BIN:-.build/release/slotstream}
"$BIN" doctor --json
''')
        for path in ['Tools/static_gates_binary_test.py', 'Tools/coverage_ratchet_test.py',
                     'Tools/process_cleanup_checks.py', 'Tools/context_qualification_checks.py',
                     'Tools/installer_gates_binary_test.py',
                     'Tools/verify_binary_test.py',
                     'Tools/sampler_gates_test.py',
                     'Tools/reference/fixture.py', 'Tools/slotpack/checks.py']:
            self.write(path, '# Model-free dependency fixture.\n')
        self.write('Tools/e2e_release_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_E2E') == '1' else 0)\n")
        self.write('Tools/api_generation_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_API_GENERATION') == '1' else 0)\n")
        self.write('Tools/consumer_smoke_test.py', "import os\nraise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_CONSUMER') == '1' else 0)\n")
        for suite in OPTIMIZATION_SUITES:
            self.write(f'Tools/{suite}_test.py', f'''import json, os
with open(os.environ['SLOTSTREAM_SUITE_TRACE'], 'a') as output:
    output.write(json.dumps({suite!r})+'\\n')
raise SystemExit(23 if os.environ.get('SLOTSTREAM_FAIL_SUITE') == {suite!r} else 0)
''')
        self.write('Sources/Slotstream/PinnedModel.swift', '// pinned manifest fixture\n')
        self.write('bench/parity31/fixture.txt', 'exact fixture\n')
        sha = hashlib.sha256((self.root/'bench/parity31/fixture.txt').read_bytes()).hexdigest()
        self.write('bench/parity31/SHA256SUMS', f'{sha}  fixture.txt\n')
        self.binaries = {}
        for name, path in [('release', '.build/release/slotstream'),
                           ('legacy', 'legacy binary/slotstream'),
                           ('frozen', 'frozen binary/slotstream')]:
            self.binaries[name] = self.root/path
            self.write(path, f'''#!/usr/bin/env python3
import json, os, sys
with open(os.environ['SLOTSTREAM_SELECTION_TRACE'], 'a') as output:
    output.write(json.dumps({{'selected': {name!r}, 'arguments': sys.argv[1:],
        'BIN': os.environ.get('BIN'), 'SLOTSTREAM_TEST_BINARY': os.environ.get('SLOTSTREAM_TEST_BINARY')}})+'\\n')
raise SystemExit(int(os.environ.get('SLOTSTREAM_SELECTION_EXIT', '0')))
''')

    def write(self, relative, text):
        path = self.root/relative
        path.write_text(text)
        path.chmod(0o755)

    def run_entry(self, changes):
        env = {k: v for k, v in os.environ.items()
               if k != 'BIN' and not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
        env.update(SLOTSTREAM_SELECTION_TRACE=str(self.trace))
        env.update(SLOTSTREAM_SUITE_TRACE=str(self.suite_trace))
        env.update(changes)
        p = subprocess.run(['bash', 'Tools/static_gates.sh'], cwd=self.root,
                           env=env, text=True, capture_output=True, timeout=15)
        rows = [json.loads(line) for line in self.trace.read_text().splitlines()] \
            if self.trace.exists() else []
        return p, rows

    def expect_selected(self, changes, name):
        p, rows = self.run_entry(changes)
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual([row['selected'] for row in rows], [name]*3)
        self.assertEqual([row['arguments'] for row in rows],
                         [['runtime-check'], ['pull-check'], ['doctor', '--json']])
        expected = str(self.binaries[name]) if name != 'release' else '.build/release/slotstream'
        self.assertTrue(all(row['BIN'] == expected and row['SLOTSTREAM_TEST_BINARY'] == expected
                            for row in rows), rows)

    def test_default_release_is_used_and_forwarded(self):
        self.expect_selected({}, 'release')

    def test_legacy_bin_override_is_used_and_forwarded(self):
        self.expect_selected({'BIN': str(self.binaries['legacy'])}, 'legacy')

    def test_frozen_override_with_spaces_is_used_and_forwarded(self):
        self.expect_selected({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_frozen_override_takes_precedence_over_legacy_bin(self):
        self.expect_selected({'BIN': str(self.binaries['legacy']),
                              'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen'])}, 'frozen')

    def test_missing_selected_binary_fails_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.root/'missing binary')})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_selected_binary_failure_stops_without_fallback(self):
        p, rows = self.run_entry({'SLOTSTREAM_TEST_BINARY': str(self.binaries['frozen']),
                                  'SLOTSTREAM_SELECTION_EXIT': '23'})
        self.assertEqual(p.returncode, 23)
        self.assertEqual([row['selected'] for row in rows], ['frozen'])

    def test_failed_installed_release_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_E2E': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_installed_release_fixture_is_a_failure(self):
        (self.root/'Tools/e2e_release_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0)
        self.assertEqual(rows, [])

    def test_failed_api_generation_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_API_GENERATION': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_api_generation_fixture_is_a_failure(self):
        (self.root/'Tools/api_generation_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_every_optimization_suite_runs_before_native_checks(self):
        p, rows = self.run_entry({})
        self.assertEqual(p.returncode, 0, p.stdout+p.stderr)
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()] \
            if self.suite_trace.exists() else []
        self.assertEqual(suites, OPTIMIZATION_SUITES)
        self.assertEqual(len(rows), 3)

    def test_failed_consumer_fixture_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_CONSUMER': '1'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_consumer_fixture_is_a_failure(self):
        (self.root/'Tools/consumer_smoke_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_failed_optimization_suite_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_prerequisites'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])
        suites = [json.loads(line) for line in self.suite_trace.read_text().splitlines()]
        self.assertEqual(suites, OPTIMIZATION_SUITES[:OPTIMIZATION_SUITES.index('optimization_prerequisites') + 1])

    def test_campaign_failure_stops_before_native_checks(self):
        p, rows = self.run_entry({'SLOTSTREAM_FAIL_SUITE': 'optimization_campaign'})
        self.assertEqual(p.returncode, 23, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_campaign_is_a_failure(self):
        (self.root/'Tools/optimization_campaign_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])

    def test_missing_optimization_suite_is_a_failure(self):
        (self.root/'Tools/optimization_prerequisites_test.py').unlink()
        p, rows = self.run_entry({})
        self.assertNotEqual(p.returncode, 0, p.stdout+p.stderr)
        self.assertEqual(rows, [])


if __name__ == '__main__':
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument('--script', type=Path, default=SCRIPT)
    options, remaining = parser.parse_known_args()
    SCRIPT = options.script.resolve()
    unittest.main(argv=[sys.argv[0], *remaining])
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/final/manifest.json

SHA-256 `d6f17696928ec9efd250a0ba8d323ddc00b81a6641678eeced1460ce9dd1a181`; 2320 bytes.

````text
{
  "classification": "Final implementation and template afterimages; no native model or performance claim",
  "files": {
    "Tools/fixtures/optimization/qualification/actual-default-one-token.json": "8481bffb4721fbd594eca609506308480e7979a486c327732cba6ff138daf26b",
    "Tools/fixtures/optimization/qualification/complete-repeat.json": "9b8308d23621b55ae70dfb34258571ed00a97c9ea2932127aa787d438085ba6e",
    "Tools/fixtures/optimization/qualification/distinct-tail.json": "7d80ab65e1ed821e24922c050afc4ff24b83f9e3a2b560383efd4e7868aad59e",
    "Tools/fixtures/optimization/qualification/mtp-resource.json": "5a0c57424e2097b5ec7b4199dd9ae28d40e24f6c4eef24d13098f3ce8d652613",
    "Tools/fixtures/optimization/qualification/sampled-short.json": "ec97a77e98417def8f7489b5fd58ded65790659e15ebe6f4d2328c8688d76a7a",
    "Tools/fixtures/optimization/qualification/short-one.json": "5c736b2eec31378f0b3d2beb64d20561569ce8dfd765e363afde72b0755278a9",
    "Tools/fixtures/optimization/qualification/soak.json": "0b79f271e4dbaabe77802a54a125c371ee4519848c2e01e5019bd5d8a36a065b",
    "Tools/fixtures/optimization/qualification/unique-prose.json": "6831b8f47138d175f28ac9716bacaa8c937515a970df709393004bff84a45c35",
    "Tools/fixtures/optimization/qualification/unique-with-retention.json": "0b2593dab6a12e10226dd94d60c43d40b085160b2c23680b79545d7fe41dbb2d",
    "Tools/optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "Tools/optimization_campaign_test.py": "7d35ef74a8184224b2ec8aabb29f94c4f416c27bdae2d51ee7c794404e36745d",
    "Tools/optimization_prerequisites_test.py": "215ab0cead0daafd4d95f469254870159c66b9d719997410838cea83c151d41b",
    "Tools/optimization_results.py": "d4b9b0d6e82dd5d38f043c1b681cede8cfc2c764bcf80b9031e8438b51fece9c",
    "Tools/optimization_results_test.py": "7cc829aa16726312d115dad41692010a19c5637f6206bc481fd721eae99c15e1",
    "Tools/optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "Tools/optimization_soak_test.py": "3b61d9e63a6c5fbe79b618324b283826d51ab3085582200df4e276cb1befd0be",
    "Tools/static_gates.sh": "e82bf5d6b35bf63a75506fbab3e5282e09b4efe86541ebd5bdf9c5d8eb7ce0b7",
    "Tools/static_gates_binary_test.py": "aa07dfd295130d52aaca72810ac7ce65bd701940c06c844a6b7dd7c82f4a9b33"
  }
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/prerequisites.stderr

SHA-256 `7133759eb2296f8128c544b004c266740dbc82d1f0d667203bbfccff59de0ccc`; 129 bytes.

````text
..............................
----------------------------------------------------------------------
Ran 30 tests in 2.545s

OK
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/prerequisites.stdout

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/results-final.stderr

SHA-256 `7214f39034b4171bc9cede52cb379b5cae12e5965a6ea0130d26ca46eb7289f4`; 106 bytes.

````text
........
----------------------------------------------------------------------
Ran 8 tests in 0.114s

OK
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/results-final.stdout

SHA-256 `8e295100283f13584d5e5df77dc1bebbd84421cc86c3ab446929c29d01877d0b`; 151 bytes.

````text
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/results-final2.stderr

SHA-256 `07f64c4c97051d4151797dbf46f7947a08cceebdf11a0ff79c613781e6ac6b44`; 106 bytes.

````text
........
----------------------------------------------------------------------
Ran 8 tests in 0.085s

OK
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/results-final2.stdout

SHA-256 `8e295100283f13584d5e5df77dc1bebbd84421cc86c3ab446929c29d01877d0b`; 151 bytes.

````text
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/results.stderr

SHA-256 `f8a706b81b9d5a7063df2bdbb739f0d79cf585a8cb8d6b50d373a43340619273`; 104 bytes.

````text
......
----------------------------------------------------------------------
Ran 6 tests in 0.087s

OK
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/results.stdout

SHA-256 `8e295100283f13584d5e5df77dc1bebbd84421cc86c3ab446929c29d01877d0b`; 151 bytes.

````text
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/soak.stderr

SHA-256 `9add4659de3967bbddcbb30695b24348663410d983336620aa1fd8fe1a9306a5`; 110 bytes.

````text
...........
----------------------------------------------------------------------
Ran 11 tests in 0.099s

OK
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/soak.stdout

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/static-final.stderr

SHA-256 `23f419c2a33d1bfbf06948509c4f71ccb274fd217df51daba9e5fd1848ecb411`; 117 bytes.

````text
.................
----------------------------------------------------------------------
Ran 17 tests in 12.764s

OK
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/static-final.stdout

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/static-fixed.stderr

SHA-256 `0822ed45dba63ed92422b8203ab8655a28db4a3a61e4e1a93f8fad7cc6908fd6`; 117 bytes.

````text
.................
----------------------------------------------------------------------
Ran 17 tests in 12.578s

OK
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/static-fixed.stdout

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/static.stderr

SHA-256 `b7a2551e49fb17cdb6ff0350c8975817178c47b0addffdee89c00b9e8f96c652`; 1261 bytes.

````text
.....F.........
======================================================================
FAIL: test_failed_optimization_suite_stops_before_native_checks (__main__.StaticBinarySelection)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/Users/carlos/Projects/slotstream/Tools/static_gates_binary_test.py", line 172, in test_failed_optimization_suite_stops_before_native_checks
    self.assertEqual(suites, OPTIMIZATION_SUITES[:-1])
AssertionError: Lists differ: ['bui[186 chars]acity_gate', 'optimization_prerequisites'] != ['bui[186 chars]acity_gate', 'optimization_prerequisites', 'optimization_soak']

Second list contains 1 additional elements.
First extra element 10:
'optimization_soak'

  ['build_identity',
   'optimization_build',
   'optimization_serial_build',
   'optimization_readiness',
   'prefill_bench',
   'expert_layout_probe',
   'ngram_cache_probe',
   'indexer_score_probe',
   'vision_capacity_gate',
-  'optimization_prerequisites']
?                              ^

+  'optimization_prerequisites',
?                              ^

+  'optimization_soak']

----------------------------------------------------------------------
Ran 15 tests in 11.519s

FAILED (failures=1)
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/static.stdout

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/template-origins.json

SHA-256 `3412e0b3eb10afe737eaf24f13f4394515a0b4f44bd93b1d1996ce19475314b9`; 929 bytes.

````text
{
  "distinct-tail": "/tmp/slotstream-optimization-execution/integrated-protocol-drafts-v165/distinct-tail.json",
  "complete-repeat": "/tmp/slotstream-optimization-execution/integrated-protocol-drafts-v165/complete-repeat.json",
  "mtp-resource": "/tmp/slotstream-optimization-execution/integrated-protocol-drafts-v165/mtp-resource.json",
  "unique-prose": "/tmp/slotstream-optimization-execution/integrated-protocol-drafts-v165/unique-prose.json",
  "short-one": "/tmp/slotstream-optimization-execution/integrated-protocol-drafts-v165/short-one.json",
  "unique-with-retention": "/tmp/slotstream-optimization-execution/integrated-protocol-drafts-v165/unique-with-retention.json",
  "sampled-short": "/tmp/slotstream-optimization-execution/integrated-protocol-drafts-v165/sampled-short.json",
  "actual-default-one-token": "/tmp/slotstream-optimization-execution/actual-default-guard-draft-v217/actual-default-one-token.json"
}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/test-first.stderr

SHA-256 `6d6e4df72ebe6bed825afbe6b8a0f24b3d047db9c1cf9503512ee661e4087f59`; 106 bytes.

````text
........
----------------------------------------------------------------------
Ran 8 tests in 1.023s

OK
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/test-first.stdout

SHA-256 `41741f2b8d754d753df9d73e47988813387a12af29545c482d3fc0f4c6d1593c`; 859 bytes.

````text
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
{"starting": "paired/sampled-short"}
{"starting": "paired/mtp-resource"}
{"starting": "paired/distinct-tail"}
{"starting": "paired/complete-repeat"}
{"starting": "paired/unique-with-retention"}
{"starting": "paired/actual-default-one-token"}
{"starting": "soak/off"}
{"starting": "soak/on"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "native/combined-plain"}
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/test-second.stderr

SHA-256 `23a5713c222adec9186aaae808be04b0a87f1f16b8144708acd788c6b310c695`; 112 bytes.

````text
.............
----------------------------------------------------------------------
Ran 13 tests in 1.015s

OK
````

## /tmp/slotstream-optimization-execution/campaign-workflow-v266/test-second.stdout

SHA-256 `4ca3311c459d0c3a56ef16381184a9e21e8ea77ca7bbcf074f5cbbc04cb2f94b`; 935 bytes.

````text
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
{"starting": "paired/sampled-short"}
{"starting": "paired/mtp-resource"}
{"starting": "paired/distinct-tail"}
{"starting": "paired/complete-repeat"}
{"starting": "paired/unique-with-retention"}
{"starting": "paired/actual-default-one-token"}
{"starting": "soak/off"}
{"starting": "soak/on"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
````

