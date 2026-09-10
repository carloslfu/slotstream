---
type: run
id: 01m1x43kaxmwrz74hb44f1nh8s
created: 2026-09-07T05:05:27.900630+00:00
updated: 2026-09-07T05:05:28.222269+00:00
summary: Planner and context correctness with failed API pressure interval
binary: cc66ed05d56b3fb173ba579d83acb2ade5486e35666c66d2765d7561cb6c042b
captured_at: 2026-09-07
command: python3 /tmp/slotstream-optimization-execution/planner-native-v249/run.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Planner and context correctness with failed API pressure interval
tool: Exact-candidate planner, native context and actual API batch
---
# Planner and context pass; pressure-affected API acceptance fails

V249 binds the exact V247 T022346/CLI116 prerequisite on candidatecc66ed05d56b3fb173ba579d83acb2ade5486e35666c66d2765d7561cb6c042b. The actual planner suite passes64/64in10.068259958seconds, and actual context-serving passes856/856in117.83165391699998seconds. The API suite then fails with38passing/36failing assertions, dominated by503insufficient_memory responses reporting memory pressure during prompt tokenization. It had20,401,586,176B reclaimable at its preflight; during its95.210667667seconds, swapouts rise14,644pages and swapins12pages. The batch stops after223.556305334seconds and does not run the four typed-overflow probes. This is failed, resource-affected acceptance, not74/74pass, a measured planner regression, latency qualification or completion. All native source/candidate identities remain exact. Cleanup leaves no job or model-lock holder. A later kernel memory-pressure observation is1; it does not characterize the failed interval retroactively.

The actual API stdout also exposes an acceptance-predicate gap: the seeded equality line passes while both decoded content() strings are the identical memory-pressure error. That narrow validation defect remains to be corrected; the whole API battery correctly fails. The original failure and all stdout/stderr/server logs are preserved.

## /tmp/slotstream-optimization-execution/planner-native-v249/protocol.json

SHA-256 `c0934945d3a6008150a2095ed13ea6fae520947f8d5a021329152bd5fa204fb3`; 39685 bytes.

````text
{
  "classification": "Prospective affected correctness batch after exact441typed comparison; no build or performance qualification",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/cached-planner-build-v241/candidate/slotstream",
  "verified_build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/cached-planner-build-v241/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
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
        "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
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
      "source_archive_sha256": "53b359f50da8382ad6ab4ee0f0ddf55b2df576d4865d6e2abb7360202e4665d8",
      "binary_sha256": "cc66ed05d56b3fb173ba579d83acb2ade5486e35666c66d2765d7561cb6c042b",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "reference_source_sha256": {
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
    "Sources/Slotstream/ContextMemory.swift": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
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
    "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
    "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
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
    "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
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
    "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4"
  },
  "tool_sha256": {
    "Tools/context_overflow_probe.py": "3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "Tools/context_gates.py": "3c735af4c0db4946eff5ef7240859b705ac6e3931a535ec49b7db7ce30954b76",
    "Tools/sampler_gates.sh": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144",
    "Tools/api_robustness.sh": "26a21c58d8e4532ee6b1714bf5fe28f38ef8cd20d6182d0b7ff89a6fef7bc565",
    "Tools/sampler_ref.py": "faa87e6db26853b275322d18cab1994430315e19783b984ac28e1cdaf34395c3",
    "Tools/planner_gates.sh": "f869506fa2c7c4aa73ecf279a52b84103227a451a7a2e319d489eff30b150b29",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f"
  },
  "native": [
    {
      "name": "context-serving",
      "command": [
        "optimization-state-check",
        "--variant",
        "context-serving",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "Final shared source correctness; excludes latency/capacity qualification"
    }
  ],
  "driver_sha256": "f3d5251dc32825c72ce32cce161ba02b103eebef58c1cb0703d5c7829823fcd7",
  "groups": {
    "planner": 64,
    "context-serving": 856,
    "api-robustness": 74,
    "context-overflow": 4
  },
  "required_reclaimable_gb": 13,
  "batch_work_seconds": 1800,
  "batch_cleanup_seconds": 60,
  "stop_on_failure": true,
  "implicit_retries": false,
  "model_targets_gb": "unchanged8.1..10; no auto pool or availability override",
  "prior_comparator_manifest_sha256": "b76957568d8c858f9bed2b211a903ca868e4a577a4be4bd259a6b3404722b788",
  "excludes": [
    "performance",
    "P5",
    "source/default adoption",
    "final8matrix",
    "2soaks",
    "full installed and delivery acceptance"
  ],
  "metadata_prerequisite": {
    "manifest": "/Users/carlos/Projects/slotstream/.build/optimization/planner-metadata-v247/manifest.json",
    "sha256": "4b3fcb5c05802d7d755065bbf728c612888458a405d5a469ac621203f6c4567f"
  },
  "prior_v246": "Preserved preflight refusal; zero native groups launched. Already completed V247 T0/CLI are bound to this exact candidate instead of repeating them."
}
````

## /tmp/slotstream-optimization-execution/planner-native-v249/run.py

SHA-256 `f3d5251dc32825c72ce32cce161ba02b103eebef58c1cb0703d5c7829823fcd7`; 11618 bytes.

````text
"""One explicit clean-handback correctness batch; never benchmarks."""
import hashlib, json, os, signal, subprocess, sys, time
from pathlib import Path

ROOT=Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0,str(ROOT/'Tools'))
from optimization_build import build
from prefill_bench import digest, preflight, run_child, terminate_child_tree, vm_snapshot
from serve_bench import verified_build

QUEUE=Path('/tmp/slotstream-optimization-execution/planner-native-v249/protocol.json')
spec=json.loads(QUEUE.read_text())
OUT=ROOT/'.build/optimization/planner-native-v249'
started=time.monotonic()
# Thirty minutes of bounded correctness work plus one minute for cleanup.
deadline=started+1800
summary={'classification':'Planner-family candidate affected correctness; no timing/capacity claim',
         'queue_sha256':digest(QUEUE),'batch_wall_limit_seconds':1860,'rows':[], 'passed':False}

def remaining(): return deadline-time.monotonic()
def interrupted(signum, frame): raise KeyboardInterrupt(f'signal {signum}')
signal.signal(signal.SIGTERM,interrupted)
signal.signal(signal.SIGINT,interrupted)

def bounded_build_run(command, **kwargs):
    child=subprocess.Popen(command, start_new_session=True, **kwargs)
    try:
        code=child.wait(timeout=max(1,min(420,remaining()-20)))
        return subprocess.CompletedProcess(command,code)
    finally:
        if child.poll() is None: terminate_child_tree(child)

def save():
    summary['elapsed_seconds']=time.monotonic()-started
    (OUT/'manifest.json').write_text(json.dumps(summary,indent=2)+'\n')

def cli_checks(binary):
    if remaining() < 260: raise TimeoutError('not enough batch time for bounded CLI refusal checks')
    out=OUT/'context-cli';out.mkdir()
    env={k:v for k,v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
    command=['python3',str(ROOT/'Tools/context_gates.py'),'--binary',str(binary),'--report',str(out/'report.json')]
    row={'name':'context-cli','command':command,'passed':False,'classification':'metadata and pre-allocation refusals only'}
    summary['rows'].append(row)
    begin=time.monotonic()
    try:
        print(json.dumps({'phase':'starting','name':'context-cli'}),flush=True)
        row['exit_code']=run_child(command,env,out,240)
        report=json.loads((out/'report.json').read_text())
        row['assertions']=len(report['assertions'])
        row['passed']=row['exit_code']==0 and report['passed'] is True and row['assertions']>0 and all(x['passed'] is True for x in report['assertions'])
    finally:
        row['duration_seconds']=time.monotonic()-begin
        (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n');save()
        print(json.dumps(row),flush=True)
    if not row['passed']: raise RuntimeError('context CLI refusal/reporting checks failed')

def shell_checks(binary, name, script):
    if remaining() < 260: raise TimeoutError('not enough batch time for shell correctness checks')
    out=OUT/name;out.mkdir()
    env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    env.update(BIN=str(binary),SLOTSTREAM_TEST_BINARY=str(binary),PYTHON=str(ROOT/'.venv31/bin/python'))
    row={'name':name,'command':['bash',str(ROOT/script)],'passed':False,'classification':'provider-free sampler/planner/governor policy correctness','identity':verified_build(binary)['identity']}
    summary['rows'].append(row);begin=time.monotonic()
    try:
        print(json.dumps({'phase':'starting','name':name}),flush=True)
        row['exit_code']=run_child(row['command'],env,out,240)
        output=(out/'stdout.txt').read_text()
        import re
        matches=re.findall(r'^(?:planner|sampler \+ governor): passed (\d+), failed (\d+)$',output,re.M)
        row['assertions']=int(matches[0][0]) if len(matches)==1 else 0
        row['passed']=row['exit_code']==0 and len(matches)==1 and row['assertions']>0 and matches[0][1]=='0' and not re.search(r'^FAIL',output,re.M)
    finally:
        row['duration_seconds']=time.monotonic()-begin
        for file in ['stdout.txt','stderr.txt']:
            if (out/file).exists():row[file+'_sha256']=digest(out/file)
        (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n');save()
        print(json.dumps({k:row[k] for k in ['name','passed','assertions','duration_seconds']}),flush=True)
    if not row['passed']:raise RuntimeError(f'{name} failed; stopping the batch')

def native(binary, name, command, extra_env, ceiling=900, catalogue=False, required_gb=13):
    if remaining()<min(ceiling + 20, 300): return False
    verified_build(binary)
    out=OUT/name;out.mkdir()
    env={k:v for k,v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
    env.update(extra_env)
    row={'name':name,'binary':str(binary),'identity':verified_build(binary)['identity'],
         'command':[str(binary.parent/'slotstream-checks' if catalogue else binary),*command],
         'environment':extra_env,'passed':False,'required_reclaimable_gb':required_gb,
         'classification':summary['classification']}
    summary['rows'].append(row)
    begin=time.monotonic()
    try:
        row['before']=preflight(required_gb)
        row['timeout_seconds']=int(min(ceiling,remaining()-20))
        print(json.dumps({'phase':'starting','name':name,'timeout_seconds':row['timeout_seconds']}),flush=True)
        row['exit_code']=run_child(row['command'],env,out,row['timeout_seconds'])
        report=json.loads((out/'stdout.txt').read_text())
        if catalogue:
            checks=report.get('checks',[])
            row['checks_sha256']=digest(binary.parent/'slotstream-checks')
            row['groups']=len(checks)
            row['assertions']=sum(len(c.get('items',[])) for c in checks)
            row['passed']=(row['exit_code']==0 and len(checks)>0 and report.get('failed')==0
                and report.get('skipped')==0 and report.get('passed')==len(checks)
                and all(c.get('passed') is True for c in checks))
        else:
            row['assertions']=len(report.get('items',[]))
            row['passed']=(row['exit_code']==0 and report.get('passed') is True
                and not report.get('skipped') and row['assertions']>0
                and all(c.get('passed') is True for c in report['items']))
    except BaseException as error:
        row['error']=f'{type(error).__name__}: {error}'
        if isinstance(error,KeyboardInterrupt): raise
    finally:
        row['after']=vm_snapshot();row['duration_seconds']=time.monotonic()-begin
        for file in ['stdout.txt','stderr.txt']:
            if (out/file).exists():row[file+'_sha256']=digest(out/file)
        (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n')
        save()
        print(json.dumps({k:row[k] for k in ['name','passed','assertions','duration_seconds','error'] if k in row}),flush=True)
    if not row['passed']: raise RuntimeError(f'{name} failed; stopping the batch')
    return True

def http_step(binary, name, command, timeout, extra, validate):
    if remaining() < timeout + 20: raise TimeoutError('batch deadline before '+name)
    out=OUT/name;out.mkdir()
    env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}
    env.update(extra)
    row={'name':name,'command':command,'environment':extra,'identity':verified_build(binary)['identity'],'passed':False,'timeout_seconds':timeout}
    summary['rows'].append(row);begin=time.monotonic()
    try:
        row['before']=preflight(13)
        print(json.dumps({'phase':'starting','name':name}),flush=True)
        row['exit_code']=run_child(command,env,out,timeout)
        row['assertions']=validate(out)
        row['passed']=row['exit_code']==0 and row['assertions']>0
    finally:
        row['after']=vm_snapshot();row['duration_seconds']=time.monotonic()-begin
        for name in ['stdout.txt','stderr.txt']:
            if (out/name).exists():row[name+'_sha256']=digest(out/name)
        (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n');save()
        print(json.dumps(row),flush=True)
    if not row['passed']:raise RuntimeError('failed '+row['name'])

def api_checks(binary):
    def validate(out):
        import re
        output=(out/'stdout.txt').read_text()
        assert re.findall(r'^robustness: passed (\d+), failed (\d+)$',output,re.M)==[('74','0')], 'API expected 74 passing assertions'
        assert not re.search(r'^(FAIL|SKIP)\b',output,re.M),'API failure/skip'
        return 74
    http_step(binary,'api-robustness',['bash',str(ROOT/'Tools/api_robustness.sh'),'11642','13'],900,
        {'SLOTSTREAM_TEST_BINARY':str(binary),'SLOTSTREAM_TEST_MEMORY_GB':'10','SLOTSTREAM_TEST_MTP':'off','SLOTSTREAM_TEST_LOG':str(OUT/'api-server.log')},validate)

def overflow_checks(binary):
    def validate(out):
        report=json.loads((out/'probe/manifest.json').read_text())
        assert report['passed'] is True and report['expected_typed'] is True
        assert len(report['cases'])==4 and all(row['status']==400 and row['typed'] for row in report['cases'])
        return 4
    http_step(binary,'context-overflow',['python3',str(ROOT/'Tools/context_overflow_probe.py'),'--binary',str(binary),'--out',str(OUT/'context-overflow/probe'),'--expect-typed'],180,{},validate)

OUT.mkdir(exist_ok=False)
try:
    actual={str(p.relative_to(ROOT)):digest(p) for p in sorted((ROOT/'Sources').rglob('*')) if p.is_file()}
    if actual!=spec['reference_source_sha256']:raise ValueError('shared source changed since candidate queue freeze')
    if {name:digest(ROOT/name) for name in spec['tool_sha256']}!=spec['tool_sha256']:raise ValueError('driver changed since queue freeze')
    binary=Path(spec['binary'])
    if verified_build(binary)!=spec['verified_build']:raise ValueError('candidate identity changed')
    entry=spec['metadata_prerequisite'];path=Path(entry['manifest'])
    if digest(path)!=entry['sha256']:raise ValueError('metadata prerequisite changed')
    metadata=json.loads(path.read_text())
    if metadata['passed'] is not True or metadata['candidate']!=spec['verified_build'] or [(r['name'],r['assertions'],r['passed']) for r in metadata['rows']]!=[('t0',22346,True),('context-cli',116,True)]:raise ValueError('metadata prerequisite incomplete or from another candidate')
    summary['metadata_prerequisite']=entry
    summary['before']=preflight(13)
    shell_checks(binary,'planner','Tools/planner_gates.sh')
    if summary['rows'][-1]['assertions']!=64:raise RuntimeError('unexpected planner coverage')
    for row in spec['native']:
        if not native(binary,row['name'],row['command'],row['environment'],row['timeout_seconds'],required_gb=row['required_reclaimable_gb']):raise TimeoutError('native deadline')
        if summary['rows'][-1]['assertions']!=856:raise RuntimeError('unexpected context coverage')
    api_checks(binary)
    overflow_checks(binary)
    summary['complete_queue']=len(summary['rows'])==4
    summary['passed']=summary['complete_queue'] and all(r['passed'] for r in summary['rows'])
except BaseException as error:
    summary['error']=f'{type(error).__name__}: {error}'
finally:
    summary['shared_runtime_unchanged']=all(digest(ROOT/n)==h for n,h in spec['reference_source_sha256'].items())
    summary['candidate_unchanged']=verified_build(Path(spec['binary']))==spec['verified_build']
    summary['passed']=summary['passed'] and summary['shared_runtime_unchanged'] and summary['candidate_unchanged'] and time.monotonic()-started<=1860
    save()
print(json.dumps({k:v for k,v in summary.items() if k not in ('rows','build','before')}),flush=True)
raise SystemExit(0 if summary['passed'] else 1)
````

## /tmp/slotstream-optimization-execution/planner-native-v249/launch-readiness.json

SHA-256 `b91846c6e77cb3e7342b01e8b34b6cbfb9cb4411f65732c5d087ec816fbbe5d7`; 2047 bytes.

````text
{
  "eligible": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 14894596096,
    "swapins": 44107593,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3762.\nPages active:                                 953696.\nPages inactive:                               936831.\nPages speculative:                             14552.\nPages throttled:                                   0.\nPages wired down:                             270060.\nPages purgeable:                                5011.\n\"Translation faults\":                    15265212532.\nPages copy-on-write:                       724487122.\nPages zero filled:                       21044848875.\nPages reactivated:                        3463405023.\nPages purged:                               71683988.\nFile-backed pages:                            900321.\nAnonymous pages:                             1004758.\nPages stored in compressor:                  2049997.\nPages occupied by compressor:                 906844.\nDecompressions:                           1166960576.\nCompressions:                             1481081146.\nPageins:                                  7595367798.\nPageouts:                                   11042953.\nSwapins:                                    44107593.\nSwapouts:                                   77510858.\nPages tagged:                                 177075.\nPages tagged resident:                        123384.\nPages tagged compressed:                       53691.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8790.\nPages tag-storage free:                          126.\nPages tag-storage non-tag pageable:            89380.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8775360.\nTagged compressions:                        11152724.\nTagged decompressions:                      10285356.\n"
  }
}
````

## /tmp/slotstream-optimization-execution/planner-native-v249/return-audit.json

SHA-256 `829ee600c4b41c09025a46e2956d8d81e0b0318da1a891bc8a580d7bb0d71744`; 2214 bytes.

````text
{
  "captured_at": "2026-09-07T05:04:35.711906+00:00",
  "vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 14643331072,
    "swapins": 44108056,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     8817.\nPages active:                                 956126.\nPages inactive:                               943883.\nPages speculative:                             10943.\nPages throttled:                                   0.\nPages wired down:                             276593.\nPages purgeable:                               12520.\n\"Translation faults\":                    15271678752.\nPages copy-on-write:                       724788227.\nPages zero filled:                       21051706559.\nPages reactivated:                        3464361016.\nPages purged:                               71892051.\nFile-backed pages:                            872421.\nAnonymous pages:                             1038531.\nPages stored in compressor:                  2009439.\nPages occupied by compressor:                 889035.\nDecompressions:                           1168261631.\nCompressions:                             1482452644.\nPageins:                                  7602980934.\nPageouts:                                   11047160.\nSwapins:                                    44108056.\nSwapouts:                                   77525502.\nPages tagged:                                 173064.\nPages tagged resident:                        135524.\nPages tagged compressed:                       37540.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7341.\nPages tag-storage free:                          221.\nPages tag-storage non-tag pageable:            90734.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5999424.\nTagged compressions:                        11165267.\nTagged decompressions:                      10305194.\n"
  },
  "competing_jobs": [],
  "lock_free": true,
  "kernel_memory_pressure": {
    "exit_code": 0,
    "stdout": "1\n",
    "stderr": ""
  }
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/api-robustness/manifest.json

SHA-256 `32f52b25bcb868904c106e325077fe6ec734c4dc8540ed2b06dcdea5bfc2383c`; 23641 bytes.

````text
{
  "name": "api-robustness",
  "command": [
    "bash",
    "/Users/carlos/Projects/slotstream/Tools/api_robustness.sh",
    "11642",
    "13"
  ],
  "environment": {
    "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/cached-planner-build-v241/candidate/slotstream",
    "SLOTSTREAM_TEST_MEMORY_GB": "10",
    "SLOTSTREAM_TEST_MTP": "off",
    "SLOTSTREAM_TEST_LOG": "/Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/api-server.log"
  },
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
      "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
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
      "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
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
    "source_archive_sha256": "53b359f50da8382ad6ab4ee0f0ddf55b2df576d4865d6e2abb7360202e4665d8",
    "binary_sha256": "cc66ed05d56b3fb173ba579d83acb2ade5486e35666c66d2765d7561cb6c042b",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "passed": false,
  "timeout_seconds": 900,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 20401586176,
    "swapins": 44107597,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   364228.\nPages active:                                 607963.\nPages inactive:                               521158.\nPages speculative:                             84751.\nPages throttled:                                   0.\nPages wired down:                             269675.\nPages purgeable:                                3788.\n\"Translation faults\":                    15267415429.\nPages copy-on-write:                       724607128.\nPages zero filled:                       21048768704.\nPages reactivated:                        3464124682.\nPages purged:                               71762936.\nFile-backed pages:                            877198.\nAnonymous pages:                              336674.\nPages stored in compressor:                  2665302.\nPages occupied by compressor:                1236996.\nDecompressions:                           1167576952.\nCompressions:                             1482372230.\nPageins:                                  7596071587.\nPageouts:                                   11045464.\nSwapins:                                    44107597.\nSwapouts:                                   77510858.\nPages tagged:                                 163272.\nPages tagged resident:                        110467.\nPages tagged compressed:                       52805.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7240.\nPages tag-storage free:                         1126.\nPages tag-storage non-tag pageable:            89930.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8986688.\nTagged compressions:                        11164055.\nTagged decompressions:                      10289620.\n"
  },
  "exit_code": 1,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 19399098368,
    "swapins": 44107609,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   396605.\nPages active:                                 592262.\nPages inactive:                               654880.\nPages speculative:                             16975.\nPages throttled:                                   0.\nPages wired down:                             287186.\nPages purgeable:                                1925.\n\"Translation faults\":                    15269100721.\nPages copy-on-write:                       724683307.\nPages zero filled:                       21050158069.\nPages reactivated:                        3464359234.\nPages purged:                               71890328.\nFile-backed pages:                            785497.\nAnonymous pages:                              478620.\nPages stored in compressor:                  2491672.\nPages occupied by compressor:                1136686.\nDecompressions:                           1167787465.\nCompressions:                             1482452644.\nPageins:                                  7602486650.\nPageouts:                                   11046497.\nSwapins:                                    44107609.\nSwapouts:                                   77525502.\nPages tagged:                                 171776.\nPages tagged resident:                        123303.\nPages tagged compressed:                       48473.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7346.\nPages tag-storage free:                         1194.\nPages tag-storage non-tag pageable:            89756.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8054272.\nTagged compressions:                        11165267.\nTagged decompressions:                      10294362.\n"
  },
  "duration_seconds": 95.210667667,
  "stdout.txt_sha256": "345745b65359435cdbb6aee9c94d868092b2aa904df5748a75554713f3d53c3f",
  "stderr.txt_sha256": "4786cbf44e30fa4e6ccc908a6fda73de3cd3c8b9a2721921f2a72411a862ba91"
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/api-robustness/stderr.txt

SHA-256 `4786cbf44e30fa4e6ccc908a6fda73de3cd3c8b9a2721921f2a72411a862ba91`; 576 bytes.

````text
Traceback (most recent call last):
  File "<stdin>", line 27, in <module>
  File "<stdin>", line 10, in call
  File "<stdin>", line 10, in <genexpr>
KeyError: 'message'
Traceback (most recent call last):
  File "<string>", line 1, in <module>
KeyError: 'choices'
Traceback (most recent call last):
  File "<string>", line 1, in <module>
AssertionError
Traceback (most recent call last):
  File "<string>", line 3, in <module>
KeyError: 'message'
Traceback (most recent call last):
  File "<stdin>", line 9, in <module>
  File "<stdin>", line 9, in <listcomp>
KeyError: 'done'
````

## /Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/api-robustness/stdout.txt

SHA-256 `345745b65359435cdbb6aee9c94d868092b2aa904df5748a75554713f3d53c3f`; 6508 bytes.

````text
PASS  non-loopback browser origin is refused
PASS  loopback browser origin is allowed exactly
PASS  wrong model is rejected instead of silently relabeled
PASS  unsupported Ollama tools are rejected explicitly
PASS  unsupported OpenAI response_format is rejected explicitly
PASS  numeric stream is not mistaken for a JSON boolean
PASS  wrongly typed sampling options are rejected
PASS  numbers that overflow the sampler are rejected
PASS  unsupported message semantics are not silently dropped
PASS  OpenAI max_tokens 0 cannot become an unbounded generation
PASS  seed -1 (Ollama's random default) does not kill the server
PASS  num_predict -1 (until EOS) generates instead of trapping
PASS  client disconnecting mid-stream does not kill the server (SIGPIPE)
FAIL  streaming does not reassemble to the non-streamed text
PASS  out-of-range "top_p":0 falls back sanely (got 'memory pressure interrupted prompt tokenization; retry after memory becomes available')
PASS  out-of-range "top_p":-1 falls back sanely (got 'memory pressure interrupted prompt tokenization; retry after memory becomes available')
PASS  out-of-range "min_p":1.5 falls back sanely (got 'memory pressure interrupted prompt tokenization; retry after memory becomes available')
FAIL  empty prompt was answered or refused instead of acknowledged  ({"code":"insufficient_memory","details":{"message":"memory pressure interrupted prompt tokenization; retry after memory becomes available","code":"insufficient_memory","type":"insufficient_memory"},"error":"memory pressure interrupted prompt tokenization; retry after memory becomes available"})
FAIL  array-form content dropped  (got '')
PASS  stop sequence honored (got 'memory pressure interrupted prompt tokenization; retry after memory becomes available')
FAIL  over-length prompt lacks the typed HTTP 400 refusal  ({"status": 503, "body": {"code": "insufficient_memory", "details": {"message": "memory pressure interrupted prompt tokenization; retry after memory becomes available", "code": "ins)
PASS  /api/version (0.2.11) matches the binary
PASS  /api/tags size matches the pinned manifest
PASS  /api/show accepts the Ollama CLI request shape and advertises capabilities
PASS  /api/show accepts the deprecated name alias
PASS  /api/show refuses a non-empty system override instead of ignoring it
PASS  /api/show still rejects unknown fields
PASS  /api/chat accepts keep_alive and null options (the CLI's defaults)
PASS  /api/generate accepts the Ollama CLI one-shot shape (empty suffix/system/template)
FAIL  /api/generate silently accepted a suffix  ({"details":{"message":"memory pressure interrupted prompt tokenization; retry after memory)
FAIL  /api/generate rejects the empty-prompt load request  ({"error":"memory pressure interrupted prompt tokenization; retry after memory becomes avai)
FAIL  /api/chat rejects the empty-messages load request  ({"details":{"message":"memory pressure interrupted prompt tokenization; retry after memory)
PASS  HEAD returns no body
FAIL  malformed JSON returned 503
PASS  metadata endpoints answer during a generation, and the accept loop keeps accepting
PASS  /api/show accepts an empty model with the name in the alias (ollama show)
PASS  an untagged model name resolves to the only model
FAIL  num_ctx was silently accepted  ({"details":{"message":"memory pressure interrupted prompt tokenization; retry after memory)
FAIL  /v1 rejected "max_tokens":null  (503)
FAIL  /v1 rejected "stop":null  (503)
FAIL  /v1 rejected "temperature":null  (503)
FAIL  /v1 rejected "seed":null  (503)
FAIL  /v1 rejected "stream_options":null  (503)
FAIL  /v1 rejected the no-op default "n":1  (503)
FAIL  /v1 rejected the no-op default "frequency_penalty":0  (503)
FAIL  /v1 rejected the no-op default "user":"u1"  (503)
FAIL  /v1 rejected the no-op default "logprobs":false  (503)
FAIL  /v1 rejected the no-op default "logit_bias":{}  (503)
FAIL  /v1 rejected the no-op default "tools":[]  (503)
FAIL  /v1 rejected the no-op default "response_format":{"type":"text"}  (503)
FAIL  /v1 accepted "n":2  (503)
FAIL  /v1 accepted "frequency_penalty":0.5  (503)
FAIL  /v1 accepted "logprobs":true  (503)
FAIL  /v1 accepted "tools":[{"type":"function"}]  (503)
FAIL  /v1 accepted "response_format":{"type":"json_object"}  (503)
FAIL  think:true leaked reasoning into content  ({"error":"memory pressure interrupted prompt tokenization; retry after memory becomes available","code":"insufficient_me)
FAIL  streaming is still batched into multi-token bursts
FAIL  unseeded requests replay one fixed stream  (memory pressure interrupted prompt tokenization; retry after)
PASS  an explicit seed still reproduces exactly
PASS  a query string does not 404 the route
PASS  HEAD on a real path is 200
PASS  HEAD on an unknown path is 404, not a blanket 200
PASS  a chunked body is refused with 411, not read as empty
PASS  an oversized body gets 413, not a bare connection reset
PASS  a malformed Content-Length gets 400
FAIL  file:// image not refused  ({"error":"memory pressure interrupted prompt tokenization; retry after memory becomes available","code":"insufficient_memory","details":{"type":"insufficient_memory","message":"memory pressure interru)
FAIL  https:// image not refused on /v1  ({"error":{"message":"memory pressure interrupted prompt tokenization; retry after memory becomes available","code":"insufficient_memory","type":"insufficient_memory"}})
FAIL  images array type not validated  ({"details":{"message":"memory pressure interrupted prompt tokenization; retry after memory becomes available","code":"insufficient_memory","type":"insufficient_memory"},"error":"memory pressure interr)
FAIL  image part without url not validated  ({"error":"memory pressure interrupted prompt tokenization; retry after memory becomes available","code":"insufficient_memory","details":{"type":"insufficient_memory","message":"memory pressure interru)
FAIL  undecodable image not refused  ({"details":{"message":"memory pressure interrupted prompt tokenization; retry after memory becomes available","code":"insufficient_memory","type":"insufficient_memory"},"error":"memory pressure interr)
FAIL  raw + images not refused  ({"error":"memory pressure interrupted prompt tokenization; retry after memory becomes available","code":"insufficient_memory","details":{"type":"insufficient_memory","message":"memory pressure interru)
PASS  /v1/models carries created
FAIL  first SSE delta has no role
PASS  server still up after every probe

robustness: passed 38, failed 36
````

## /Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/api-server.log

SHA-256 `88307000cadb5800c6a3a45946107d8e511ca5f0439a580092b7d19ca43b3b4a`; 1487 bytes.

````text
slotstream memory plan (--experts-per-layer)
  device: 52 GB RAM (21.3 GB reclaimable now), 40.2 GB Metal working set
  cache:  ~13 of 512 experts per layer  (640 global slots = 1.8 GB pool)
  expect: ~7.9 GB peak, ~3 tok/s warm decode (est. from M5 Pro anchors)
  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 estimate, so on base storage expect well under the number above — see docs/HARDWARE.md
  prefill: 256 tokens per pass (~85 tok/s here; costs ~0.3 GB of the target)
  vision: images accepted — first image reserves +0.9 GB inside the target; refused if it cannot fit
  context: up to 32768 tokens per request (prompt + reply); a full-length prompt takes ~6.4 min before its first token here, follow-up turns read only what is new
  reuse:  up to 6240 tokens across 4 conversations (~0.5 GB), so a follow-up turn re-prefills only what is new
  note:   --memory-gb ignored (--experts-per-layer takes precedence)
  note:   raised to the floor of 640 slots (~13/layer): below it a prefill chunk can pin every slot
engine ready in 0.9s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
slotstream listening on http://127.0.0.1:11642
try it:
  curl localhost:11642/api/chat -d '{"model": "qwen3.8-flash-next:4bit", "messages": [{"role": "user", "content": "hello"}]}'
or point any Ollama or OpenAI client at http://localhost:11642
````

## /Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/context-serving/manifest.json

SHA-256 `8127029ea8267382c2aeb7a3f9fca86be96d6526289eb3218ed0cd29fc14f723`; 23787 bytes.

````text
{
  "name": "context-serving",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/cached-planner-build-v241/candidate/slotstream",
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
      "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
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
      "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
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
    "source_archive_sha256": "53b359f50da8382ad6ab4ee0f0ddf55b2df576d4865d6e2abb7360202e4665d8",
    "binary_sha256": "cc66ed05d56b3fb173ba579d83acb2ade5486e35666c66d2765d7561cb6c042b",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/cached-planner-build-v241/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "context-serving",
    "--tokens",
    "256",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "passed": true,
  "required_reclaimable_gb": 13,
  "classification": "Planner-family candidate affected correctness; no timing/capacity claim",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 14922432512,
    "swapins": 44107593,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     8300.\nPages active:                                 963576.\nPages inactive:                               948806.\nPages speculative:                             14923.\nPages throttled:                                   0.\nPages wired down:                             250592.\nPages purgeable:                               19841.\n\"Translation faults\":                    15265817362.\nPages copy-on-write:                       724539896.\nPages zero filled:                       21045106233.\nPages reactivated:                        3463405229.\nPages purged:                               71684157.\nFile-backed pages:                            882652.\nAnonymous pages:                             1044653.\nPages stored in compressor:                  2031577.\nPages occupied by compressor:                 899500.\nDecompressions:                           1166978690.\nCompressions:                             1481081146.\nPageins:                                  7595385024.\nPageouts:                                   11043280.\nSwapins:                                    44107593.\nSwapouts:                                   77510858.\nPages tagged:                                 176184.\nPages tagged resident:                        122947.\nPages tagged compressed:                       53237.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8544.\nPages tag-storage free:                          156.\nPages tag-storage non-tag pageable:            89596.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8700224.\nTagged compressions:                        11152724.\nTagged decompressions:                      10285782.\n"
  },
  "timeout_seconds": 900,
  "exit_code": 0,
  "assertions": 856,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 19847512064,
    "swapins": 44107597,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   330673.\nPages active:                                 614820.\nPages inactive:                               521189.\nPages speculative:                             84699.\nPages throttled:                                   0.\nPages wired down:                             296251.\nPages purgeable:                                3643.\n\"Translation faults\":                    15267414506.\nPages copy-on-write:                       724606975.\nPages zero filled:                       21048768474.\nPages reactivated:                        3464124682.\nPages purged:                               71762936.\nFile-backed pages:                            877080.\nAnonymous pages:                              343624.\nPages stored in compressor:                  2665365.\nPages occupied by compressor:                1237021.\nDecompressions:                           1167576886.\nCompressions:                             1482372230.\nPageins:                                  7596071520.\nPageouts:                                   11045464.\nSwapins:                                    44107597.\nSwapouts:                                   77510858.\nPages tagged:                                 163272.\nPages tagged resident:                        110467.\nPages tagged compressed:                       52805.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7240.\nPages tag-storage free:                         1298.\nPages tag-storage non-tag pageable:            89758.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8986688.\nTagged compressions:                        11164055.\nTagged decompressions:                      10289620.\n"
  },
  "duration_seconds": 117.83165391699998,
  "stdout.txt_sha256": "36df1dc2a37687eb6b61707c19b49209c9b7af6bf3419ad2998b786012d42944",
  "stderr.txt_sha256": "24ed9794e545cd990fb114c1713522dd494bfddb50f48883261ad6f882c239d2"
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/context-serving/stderr.txt

SHA-256 `24ed9794e545cd990fb114c1713522dd494bfddb50f48883261ad6f882c239d2`; 103 bytes.

````text
engine ready in 1.1s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
````

## /Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/context-serving/stdout.txt

SHA-256 `36df1dc2a37687eb6b61707c19b49209c9b7af6bf3419ad2998b786012d42944`; 98784 bytes.

````text
{
  "items" : [
    {
      "name" : "generate JSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-before\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-before\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-after\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-after\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-before\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-after\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=false: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-decode\/false: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-before\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-before\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-after\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/deadline-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "deadline-after\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-before\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-before\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/pressure-after\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "pressure-after\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate JSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "generate NDJSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat JSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "chat NDJSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: correct header status",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: typed terminal",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: model only runs after admission",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: no success DONE",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: no successful finish",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: pins released",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: failed state absent",
      "passed" : true
    },
    {
      "name" : "Gateway SSE\/memory-decode\/queued=true: allocator limit restored",
      "passed" : true
    },
    {
      "name" : "memory-decode\/true: healthy request after faults",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/false: clock actually advanced",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/false: healthy HTTP completion",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/false: released pins",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/true: clock actually advanced",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/true: healthy HTTP completion",
      "passed" : true
    },
    {
      "name" : "decode after deadline\/true: released pins",
      "passed" : true
    },
    {
      "name" : "warm admission: seed succeeds",
      "passed" : true
    },
    {
      "name" : "warm admission: seed retained exact consumed history",
      "passed" : true
    },
    {
      "name" : "warm admission: only missing token is admitted",
      "passed" : true
    },
    {
      "name" : "warm admission: retained estimate is inside budget",
      "passed" : true
    },
    {
      "name" : "cold admission: identical total prompt refused",
      "passed" : true
    },
    {
      "name" : "cold admission: no prompt computation",
      "passed" : true
    },
    {
      "name" : "cold admission: truthful submitted token count",
      "passed" : true
    },
    {
      "name" : "cold admission: failed state absent",
      "passed" : true
    },
    {
      "name" : "client cap: typed pre-header refusal",
      "passed" : true
    },
    {
      "name" : "client cap: server remains unchanged",
      "passed" : true
    },
    {
      "name" : "client cap: later client succeeds",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=-1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=0: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=0: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "generate JSON\/room=1: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=-1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=0: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=0: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "chat JSON\/room=1: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=-1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=0: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=1: final tokenized cap governs status",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON\/room=1: output budget is clamped",
      "passed" : true
    },
    {
      "name" : "generate JSON: over-context refusal precedes streaming headers",
      "passed" : true
    },
    {
      "name" : "generate JSON: over-context refusal has structured code",
      "passed" : true
    },
    {
      "name" : "generate JSON: refused context has no success payload",
      "passed" : true
    },
    {
      "name" : "generate NDJSON: over-context refusal precedes streaming headers",
      "passed" : true
    },
    {
      "name" : "generate NDJSON: over-context refusal has structured code",
      "passed" : true
    },
    {
      "name" : "generate NDJSON: refused context has no success payload",
      "passed" : true
    },
    {
      "name" : "chat JSON: over-context refusal precedes streaming headers",
      "passed" : true
    },
    {
      "name" : "chat JSON: over-context refusal has structured code",
      "passed" : true
    },
    {
      "name" : "chat JSON: refused context has no success payload",
      "passed" : true
    },
    {
      "name" : "chat NDJSON: over-context refusal precedes streaming headers",
      "passed" : true
    },
    {
      "name" : "chat NDJSON: over-context refusal has structured code",
      "passed" : true
    },
    {
      "name" : "chat NDJSON: refused context has no success payload",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON: over-context refusal precedes streaming headers",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON: over-context refusal has structured code",
      "passed" : true
    },
    {
      "name" : "OpenAI JSON: refused context has no success payload",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE: over-context refusal precedes streaming headers",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE: over-context refusal has structured code",
      "passed" : true
    },
    {
      "name" : "OpenAI SSE: refused context has no success payload",
      "passed" : true
    },
    {
      "name" : "Gateway SSE: over-context refusal precedes streaming headers",
      "passed" : true
    },
    {
      "name" : "Gateway SSE: over-context refusal has structured code",
      "passed" : true
    },
    {
      "name" : "Gateway SSE: refused context has no success payload",
      "passed" : true
    },
    {
      "name" : "queued request expires before headers",
      "passed" : true
    },
    {
      "name" : "\/v1\/models: metadata stays responsive during occupied generation gate",
      "passed" : true
    },
    {
      "name" : "\/coding-agent\/v1\/models: metadata stays responsive during occupied generation gate",
      "passed" : true
    },
    {
      "name" : "invalid legacy mutation preserves advertised cap",
      "passed" : true
    },
    {
      "name" : "invalid legacy mutation fails without allocation",
      "passed" : true
    },
    {
      "name" : "valid legacy assignment recovers",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "context-serving",
  "passed" : true
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/manifest.json

SHA-256 `11647655905dde8aa52c755757db55c765856667f8081d4c57ca4b6690433400`; 71614 bytes.

````text
{
  "classification": "Planner-family candidate affected correctness; no timing/capacity claim",
  "queue_sha256": "c0934945d3a6008150a2095ed13ea6fae520947f8d5a021329152bd5fa204fb3",
  "batch_wall_limit_seconds": 1860,
  "rows": [
    {
      "name": "planner",
      "command": [
        "bash",
        "/Users/carlos/Projects/slotstream/Tools/planner_gates.sh"
      ],
      "passed": true,
      "classification": "provider-free sampler/planner/governor policy correctness",
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
          "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
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
          "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
          "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
          "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
          "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
          "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
          "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
          "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
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
          "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
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
        "source_archive_sha256": "53b359f50da8382ad6ab4ee0f0ddf55b2df576d4865d6e2abb7360202e4665d8",
        "binary_sha256": "cc66ed05d56b3fb173ba579d83acb2ade5486e35666c66d2765d7561cb6c042b",
        "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
      },
      "exit_code": 0,
      "assertions": 64,
      "duration_seconds": 10.068259958,
      "stdout.txt_sha256": "4fcf35c9315de57daffdca7ba713b20614ae6a5bebaf9378910a33779a32b2c1",
      "stderr.txt_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
    },
    {
      "name": "context-serving",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/cached-planner-build-v241/candidate/slotstream",
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
          "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
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
          "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
          "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
          "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
          "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
          "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
          "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
          "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
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
          "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
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
        "source_archive_sha256": "53b359f50da8382ad6ab4ee0f0ddf55b2df576d4865d6e2abb7360202e4665d8",
        "binary_sha256": "cc66ed05d56b3fb173ba579d83acb2ade5486e35666c66d2765d7561cb6c042b",
        "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
      },
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/cached-planner-build-v241/candidate/slotstream",
        "optimization-state-check",
        "--variant",
        "context-serving",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "environment": {},
      "passed": true,
      "required_reclaimable_gb": 13,
      "classification": "Planner-family candidate affected correctness; no timing/capacity claim",
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 14922432512,
        "swapins": 44107593,
        "swapouts": 77510858,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     8300.\nPages active:                                 963576.\nPages inactive:                               948806.\nPages speculative:                             14923.\nPages throttled:                                   0.\nPages wired down:                             250592.\nPages purgeable:                               19841.\n\"Translation faults\":                    15265817362.\nPages copy-on-write:                       724539896.\nPages zero filled:                       21045106233.\nPages reactivated:                        3463405229.\nPages purged:                               71684157.\nFile-backed pages:                            882652.\nAnonymous pages:                             1044653.\nPages stored in compressor:                  2031577.\nPages occupied by compressor:                 899500.\nDecompressions:                           1166978690.\nCompressions:                             1481081146.\nPageins:                                  7595385024.\nPageouts:                                   11043280.\nSwapins:                                    44107593.\nSwapouts:                                   77510858.\nPages tagged:                                 176184.\nPages tagged resident:                        122947.\nPages tagged compressed:                       53237.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8544.\nPages tag-storage free:                          156.\nPages tag-storage non-tag pageable:            89596.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8700224.\nTagged compressions:                        11152724.\nTagged decompressions:                      10285782.\n"
      },
      "timeout_seconds": 900,
      "exit_code": 0,
      "assertions": 856,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 19847512064,
        "swapins": 44107597,
        "swapouts": 77510858,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   330673.\nPages active:                                 614820.\nPages inactive:                               521189.\nPages speculative:                             84699.\nPages throttled:                                   0.\nPages wired down:                             296251.\nPages purgeable:                                3643.\n\"Translation faults\":                    15267414506.\nPages copy-on-write:                       724606975.\nPages zero filled:                       21048768474.\nPages reactivated:                        3464124682.\nPages purged:                               71762936.\nFile-backed pages:                            877080.\nAnonymous pages:                              343624.\nPages stored in compressor:                  2665365.\nPages occupied by compressor:                1237021.\nDecompressions:                           1167576886.\nCompressions:                             1482372230.\nPageins:                                  7596071520.\nPageouts:                                   11045464.\nSwapins:                                    44107597.\nSwapouts:                                   77510858.\nPages tagged:                                 163272.\nPages tagged resident:                        110467.\nPages tagged compressed:                       52805.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7240.\nPages tag-storage free:                         1298.\nPages tag-storage non-tag pageable:            89758.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8986688.\nTagged compressions:                        11164055.\nTagged decompressions:                      10289620.\n"
      },
      "duration_seconds": 117.83165391699998,
      "stdout.txt_sha256": "36df1dc2a37687eb6b61707c19b49209c9b7af6bf3419ad2998b786012d42944",
      "stderr.txt_sha256": "24ed9794e545cd990fb114c1713522dd494bfddb50f48883261ad6f882c239d2"
    },
    {
      "name": "api-robustness",
      "command": [
        "bash",
        "/Users/carlos/Projects/slotstream/Tools/api_robustness.sh",
        "11642",
        "13"
      ],
      "environment": {
        "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/cached-planner-build-v241/candidate/slotstream",
        "SLOTSTREAM_TEST_MEMORY_GB": "10",
        "SLOTSTREAM_TEST_MTP": "off",
        "SLOTSTREAM_TEST_LOG": "/Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/api-server.log"
      },
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
          "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
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
          "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
          "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
          "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
          "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
          "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
          "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
          "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
          "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
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
          "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
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
        "source_archive_sha256": "53b359f50da8382ad6ab4ee0f0ddf55b2df576d4865d6e2abb7360202e4665d8",
        "binary_sha256": "cc66ed05d56b3fb173ba579d83acb2ade5486e35666c66d2765d7561cb6c042b",
        "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
      },
      "passed": false,
      "timeout_seconds": 900,
      "before": {
        "page_bytes": 16384,
        "reclaimable_bytes": 20401586176,
        "swapins": 44107597,
        "swapouts": 77510858,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   364228.\nPages active:                                 607963.\nPages inactive:                               521158.\nPages speculative:                             84751.\nPages throttled:                                   0.\nPages wired down:                             269675.\nPages purgeable:                                3788.\n\"Translation faults\":                    15267415429.\nPages copy-on-write:                       724607128.\nPages zero filled:                       21048768704.\nPages reactivated:                        3464124682.\nPages purged:                               71762936.\nFile-backed pages:                            877198.\nAnonymous pages:                              336674.\nPages stored in compressor:                  2665302.\nPages occupied by compressor:                1236996.\nDecompressions:                           1167576952.\nCompressions:                             1482372230.\nPageins:                                  7596071587.\nPageouts:                                   11045464.\nSwapins:                                    44107597.\nSwapouts:                                   77510858.\nPages tagged:                                 163272.\nPages tagged resident:                        110467.\nPages tagged compressed:                       52805.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7240.\nPages tag-storage free:                         1126.\nPages tag-storage non-tag pageable:            89930.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8986688.\nTagged compressions:                        11164055.\nTagged decompressions:                      10289620.\n"
      },
      "exit_code": 1,
      "after": {
        "page_bytes": 16384,
        "reclaimable_bytes": 19399098368,
        "swapins": 44107609,
        "swapouts": 77525502,
        "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   396605.\nPages active:                                 592262.\nPages inactive:                               654880.\nPages speculative:                             16975.\nPages throttled:                                   0.\nPages wired down:                             287186.\nPages purgeable:                                1925.\n\"Translation faults\":                    15269100721.\nPages copy-on-write:                       724683307.\nPages zero filled:                       21050158069.\nPages reactivated:                        3464359234.\nPages purged:                               71890328.\nFile-backed pages:                            785497.\nAnonymous pages:                              478620.\nPages stored in compressor:                  2491672.\nPages occupied by compressor:                1136686.\nDecompressions:                           1167787465.\nCompressions:                             1482452644.\nPageins:                                  7602486650.\nPageouts:                                   11046497.\nSwapins:                                    44107609.\nSwapouts:                                   77525502.\nPages tagged:                                 171776.\nPages tagged resident:                        123303.\nPages tagged compressed:                       48473.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7346.\nPages tag-storage free:                         1194.\nPages tag-storage non-tag pageable:            89756.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8054272.\nTagged compressions:                        11165267.\nTagged decompressions:                      10294362.\n"
      },
      "duration_seconds": 95.210667667,
      "stdout.txt_sha256": "345745b65359435cdbb6aee9c94d868092b2aa904df5748a75554713f3d53c3f",
      "stderr.txt_sha256": "4786cbf44e30fa4e6ccc908a6fda73de3cd3c8b9a2721921f2a72411a862ba91"
    }
  ],
  "passed": false,
  "metadata_prerequisite": {
    "manifest": "/Users/carlos/Projects/slotstream/.build/optimization/planner-metadata-v247/manifest.json",
    "sha256": "4b3fcb5c05802d7d755065bbf728c612888458a405d5a469ac621203f6c4567f"
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 14683963392,
    "swapins": 44107593,
    "swapouts": 77510858,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3952.\nPages active:                                 951225.\nPages inactive:                               943210.\nPages speculative:                             13371.\nPages throttled:                                   0.\nPages wired down:                             271892.\nPages purgeable:                                5264.\n\"Translation faults\":                    15265375105.\nPages copy-on-write:                       724499519.\nPages zero filled:                       21044971365.\nPages reactivated:                        3463405034.\nPages purged:                               71684147.\nFile-backed pages:                            887022.\nAnonymous pages:                             1020784.\nPages stored in compressor:                  2037928.\nPages occupied by compressor:                 902055.\nDecompressions:                           1166972358.\nCompressions:                             1481081146.\nPageins:                                  7595379901.\nPageouts:                                   11043278.\nSwapins:                                    44107593.\nSwapouts:                                   77510858.\nPages tagged:                                 176621.\nPages tagged resident:                        123345.\nPages tagged compressed:                       53276.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8651.\nPages tag-storage free:                          166.\nPages tag-storage non-tag pageable:            89479.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8702400.\nTagged compressions:                        11152724.\nTagged decompressions:                      10285758.\n"
  },
  "elapsed_seconds": 223.556305334,
  "error": "AssertionError: API expected 74 passing assertions",
  "shared_runtime_unchanged": true,
  "candidate_unchanged": true
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/planner/manifest.json

SHA-256 `b0510e668d5f194038d337714a623f2b4a0d5df3bd0edf3edf1fcea208e6a822`; 19288 bytes.

````text
{
  "name": "planner",
  "command": [
    "bash",
    "/Users/carlos/Projects/slotstream/Tools/planner_gates.sh"
  ],
  "passed": true,
  "classification": "provider-free sampler/planner/governor policy correctness",
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
      "Sources/Slotstream/Optimizations.swift": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
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
      "Sources/Slotstream/Weights.swift": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
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
    "source_archive_sha256": "53b359f50da8382ad6ab4ee0f0ddf55b2df576d4865d6e2abb7360202e4665d8",
    "binary_sha256": "cc66ed05d56b3fb173ba579d83acb2ade5486e35666c66d2765d7561cb6c042b",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "exit_code": 0,
  "assertions": 64,
  "duration_seconds": 10.068259958,
  "stdout.txt_sha256": "4fcf35c9315de57daffdca7ba713b20614ae6a5bebaf9378910a33779a32b2c1",
  "stderr.txt_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/planner/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/planner/stdout.txt

SHA-256 `4fcf35c9315de57daffdca7ba713b20614ae6a5bebaf9378910a33779a32b2c1`; 3353 bytes.

````text
PASS  48GB pristine: 33.0 GB target and starts quiet
PASS  48GB busy: clamped to 15.4 GB, sized-down note
PASS  16GB pristine: 9.8 GB target, no notes
PASS  16GB busy: refuses an unphysical minimum allocation
PASS  8GB Mac: refuses an unphysical minimum allocation
PASS  128GB auto stops at the knee, not at 70% of RAM
PASS  128GB explains the memory it left on the table
PASS  128GB: --memory-gb still reaches full residency
PASS  --sim-ram alone plans instead of erroring
PASS  --max-ram-percent lowers the auto target
PASS  --max-ram-percent cannot exceed the knee
PASS  --max-ram-percent 0 refused
PASS  --max-ram-percent 150 refused
PASS  --max-ram-percent noted when outranked
PASS  more memory never plans slower (7-90 GB sweep)
PASS  explicit total target cannot authorize unavailable memory
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
PASS  --pool-gb 1e300 saturates safely instead of trapping
PASS  --memory-gb 1e300 refuses physical overcommit without trapping
PASS  huge finite memory plan remains valid JSON
PASS  --sim-ram inf is a clean error
PASS  --sim-working-set inf is a clean error
PASS  --sim-available inf is a clean error
PASS  tiny pool raised to the floor, consistently
PASS  knob precedence noted, never silent
PASS  --model with no safetensors: clean error
PASS  --model with no safetensors: names the fix
PASS  MTP auto on a big quiet machine: knee + head = 34.6
PASS  MTP auto stays off on a 16GB machine
PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
PASS  --mtp on forces the head onto a small machine
PASS  --mtp off suppresses it everywhere
PASS  --mtp on without mtp.safetensors is a clean error
PASS  --mtp on cannot squeeze under the minimum target
PASS  --mtp gibberish refused
PASS  MTP charge visible in json peak
PASS  --model with unparseable config: clean error
PASS  invalid config arithmetic is rejected before it traps
PASS  --model with a corrupt safetensors header
PASS  safetensors dtype/shape byte mismatch rejected
PASS  safetensors header over 100MB rejected before allocation
PASS  --model with a different model's tensors
PASS  serve --max-context 0 refused before load
PASS  plan announces the context cap and the wait
PASS  doctor --json carries max_context_tokens + wait
PASS  serve --max-context above the ceiling names the ceiling, not a knob
PASS  doctor --max-context above the ceiling is the same clean error
PASS  a lower --max-context caps the reuse ceiling too
PASS  prefill-schedule: full model window obeys the product without exemptions
PASS  prefill-schedule agrees with the doctor wait for the same pass
PASS  prefill-schedule: a prefix hit reads only what is new
PASS  prefill-schedule --chunk 0 refused
PASS  context-check --tokens 4 refused before load
PASS  parity rejects an invalid layer count before model load
PASS  parity rejects malformed token ids without trapping
PASS  n-gram golden rejects malformed token ids without trapping
PASS  dequant golden rejects a negative row before model load
PASS  sampler golden rejects an empty vocabulary without trapping
PASS  sampler golden rejects a negative draw count without trapping
planner: passed 64, failed 0
````
