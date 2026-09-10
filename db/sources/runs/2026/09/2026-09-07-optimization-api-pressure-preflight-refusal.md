---
type: run
id: 01m1x68ab1g9cn2rvfmrtasdkf
created: 2026-09-07T05:42:59.681059+00:00
updated: 2026-09-07T05:42:59.920512+00:00
summary: Corrected API qualification was not launched after headroom refusal
binary: V241 candidate cc66ed05d56b3fb173ba579d83acb2ade5486e35666c66d2765d7561cb6c042b unexecuted by these fixtures
captured_at: 2026-09-07
command: Prospective API74/typed4 wrapper; preparation preflight(13) refused before execution
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Corrected API qualification was not launched after headroom refusal
tool: python3
---
# Corrected API qualification was not launched after headroom refusal

V253 freezes the same V241 planner executable, corrected V251 API predicates and prospective pressure/resource guards. Preparation then refuses at8.83GB against the unchanged13GB real preflight. The wrapper and model never launch, no API or typed overflow case runs, and V249 remains failed evidence. The later read-only VM sample is an after-observation, not a reconstruction of the failed preflight. V254 subsequently strengthens concurrency validation; this unrun V253 protocol is preserved and cannot be executed against changed driver bytes. No acceptance, timing, capacity or default change is claimed.

## /tmp/slotstream-optimization-execution/api-pressure-v253/preparation-refusal.json

SHA-256 `ab48a28d8874030bffce00cfb3c11e09c5e7d122ee9f8834bdee004465164316`; 2683 bytes.

````text
{
  "captured_at": "2026-09-07T05:36:50.545810+00:00",
  "classification": "V253 preparation preflight refusal; wrapper not launched, zero model processes or API cases",
  "failed_preflight_message": "8.83 GB reclaimable; need13.00GB",
  "vm_after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 9539665920,
    "swapins": 44109429,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    47217.\nPages active:                                1028952.\nPages inactive:                              1009758.\nPages speculative:                             18122.\nPages throttled:                                   0.\nPages wired down:                             281024.\nPages purgeable:                               15844.\n\"Translation faults\":                    15300959692.\nPages copy-on-write:                       726535337.\nPages zero filled:                       21069482428.\nPages reactivated:                        3465710966.\nPages purged:                               71952746.\nFile-backed pages:                            519194.\nAnonymous pages:                             1537638.\nPages stored in compressor:                  1671556.\nPages occupied by compressor:                 700328.\nDecompressions:                           1169549853.\nCompressions:                             1483668853.\nPageins:                                  7603495488.\nPageouts:                                   11053843.\nSwapins:                                    44109429.\nSwapouts:                                   77525502.\nPages tagged:                                 176284.\nPages tagged resident:                        131125.\nPages tagged compressed:                       45159.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7286.\nPages tag-storage free:                          211.\nPages tag-storage non-tag pageable:            90799.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7299968.\nTagged compressions:                        11190155.\nTagged decompressions:                      10321729.\n"
  },
  "pressure_after": {
    "command": [
      "sysctl",
      "-n",
      "kern.memorystatus_vm_pressure_level"
    ],
    "level": 1,
    "name": "normal",
    "stdout": "1\n",
    "stderr": ""
  },
  "competing_jobs": [],
  "protocol_sha256": "a15f8aaa6a9998c445b0fd2635cf7bb0ded300a74a05686a4014b9742ea3dd7c",
  "wrapper_sha256": "9e306451b89edb6575ae530e2ac134924d18092dce2c1012c652933f3af4ff5b",
  "launched": false
}
````

## /tmp/slotstream-optimization-execution/api-pressure-v253/protocol.json

SHA-256 `a15f8aaa6a9998c445b0fd2635cf7bb0ded300a74a05686a4014b9742ea3dd7c`; 23931 bytes.

````text
{
  "classification": "Corrected API and typed overflow qualification; preserved V249 failed evidence; no speed, capacity, default activation, or full acceptance claim",
  "frozen_at": "2026-09-07T05:34:09.255684+00:00",
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
  "drivers": {
    "api_robustness.sh": "21e0872d4db5f3cf3c51180a760f51ad215be716ff8dfc8643e8c2998776585a",
    "api_generation.py": "cdb5b81e785b5e96e4f81e4fa5e2fe48a3b32f20b149952a9ee7f9a5c68b2eaf",
    "api_generation_test.py": "9930e010d8554ea6a328059da745af1b884a0079290d27a9de8edbc2dfe6040d",
    "optimization_readiness.py": "ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc",
    "optimization_readiness_test.py": "6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016",
    "optimization_serial_build.py": "f83e937f823c42e89da796b8616a60da61649f67f6e12166608440ee016560d8",
    "optimization_serial_build_test.py": "e3064090075309261ef9d6e7e223c10cd03d00e4125aa92bda0bba73f2821189",
    "context_overflow_probe.py": "3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86"
  },
  "wrapper_sha256": "9e306451b89edb6575ae530e2ac134924d18092dce2c1012c652933f3af4ff5b",
  "prerequisites": [
    {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/planner-metadata-v247/manifest.json",
      "sha256": "4b3fcb5c05802d7d755065bbf728c612888458a405d5a469ac621203f6c4567f",
      "purpose": "T0 22346 and CLI 116 only"
    },
    {
      "path": "/Users/carlos/Projects/slotstream/.build/optimization/planner-native-v249/manifest.json",
      "sha256": "11647655905dde8aa52c755757db55c765856667f8081d4c57ca4b6690433400",
      "purpose": "Planner 64 and context-serving 856 pass; API failed38/36 and remains failed"
    },
    {
      "path": "/tmp/slotstream-optimization-execution/planner-family-parity-v243/comparison-launch.json",
      "sha256": "3798350fd697136809917adbb352efde626b17e63be27d92596dda3e5d763e52",
      "purpose": "441 typed planner comparison; zero differences"
    },
    {
      "path": "/tmp/slotstream-optimization-execution/api-completion-v251/after-result.json",
      "sha256": "0b57228e23d0c576d2437e95402a51dff4a2f9bd8398eaf6d799d6e7d940a81d",
      "purpose": "API correction 7 fixture groups"
    },
    {
      "path": "/tmp/slotstream-optimization-execution/pressure-readiness-v252/tests.json",
      "sha256": "a3ec84facc5f8d7536803792287a1dcdc5667865eca56f27d545d3ce798b225a",
      "purpose": "12 guard, 4 readiness and 13 static fixture tests"
    }
  ],
  "policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 10000000000,
    "sample_interval_seconds": 0.2,
    "stop_on_new_swapouts": true
  },
  "maximum_interval_seconds": 1120,
  "steps": [
    {
      "name": "api-robustness",
      "command": [
        "bash",
        "Tools/api_robustness.sh",
        "11642",
        "13"
      ],
      "environment": {
        "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/cached-planner-build-v241/candidate/slotstream",
        "SLOTSTREAM_TEST_MEMORY_GB": "10",
        "SLOTSTREAM_TEST_MTP": "off",
        "SLOTSTREAM_TEST_LOG": "/Users/carlos/Projects/slotstream/.build/optimization/api-pressure-v253/api-robustness/server.log"
      },
      "timeout_seconds": 900,
      "required_assertions": 74
    },
    {
      "name": "context-overflow",
      "command": [
        "python3",
        "Tools/context_overflow_probe.py",
        "--binary",
        "/Users/carlos/Projects/slotstream/.build/optimization/cached-planner-build-v241/candidate/slotstream",
        "--out",
        "/Users/carlos/Projects/slotstream/.build/optimization/api-pressure-v253/context-overflow/probe",
        "--expect-typed"
      ],
      "environment": {},
      "timeout_seconds": 180,
      "required_assertions": 4
    }
  ],
  "resource_profile_note": "API preserves V249 fixed experts-per-layer13 / 640 slots, with memory-gb10 ignored by explicit pool precedence; typed overflow uses memory-gb10. Neither profile is enlarged. No user application changes, synthetic pressure, availability override, retries or replacement performance cells."
}
````

## /tmp/slotstream-optimization-execution/api-pressure-v253/run.py

SHA-256 `9e306451b89edb6575ae530e2ac134924d18092dce2c1012c652933f3af4ff5b`; 6409 bytes.

````text
from pathlib import Path
import datetime,json,os,re,shutil,signal,subprocess,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from optimization_readiness import pressure_snapshot,require_normal
from optimization_serial_build import guarded_run
P=Path(__file__).parent
OUT=ROOT/'.build/optimization/api-pressure-v253'
S=json.loads((P/'protocol.json').read_text())
B=Path(S['binary']);started=time.monotonic()
r={'classification':'Actual API/typed error correctness with prospective OS-pressure and memory guards; no performance or complete acceptance claim','protocol_sha256':digest(P/'protocol.json'),'rows':[],'passed':False}
OUT.mkdir(exist_ok=False)
def interrupted(number, _frame):
    raise KeyboardInterrupt(f'API qualification interrupted by signal {number}')
signal.signal(signal.SIGINT, interrupted)
signal.signal(signal.SIGTERM, interrupted)
assert digest(Path(__file__))==S['wrapper_sha256']
for name in S['drivers']:
    assert digest(ROOT/'Tools'/name)==S['drivers'][name]
    (OUT/'drivers').mkdir(exist_ok=True);shutil.copy2(ROOT/'Tools'/name,OUT/'drivers'/name)
assert verified_build(B)==S['verified_build']
for prerequisite in S['prerequisites']:
    assert digest(prerequisite['path'])==prerequisite['sha256']
phase='startup'
with (OUT/'os-memory.samples.jsonl').open('x') as observations:
    def snapshot():
        state=vm_snapshot();pressure=pressure_snapshot()
        observations.write(json.dumps({'phase':phase,'seconds':time.monotonic()-started,'vm':state,'os_pressure':pressure})+'\n');observations.flush()
        require_normal(pressure)
        return state
    try:
        if competing_jobs():raise RuntimeError('competing model, storage or build job')
        r['before']=preflight(13);snapshot()
        for step in S['steps']:
            phase=step['name'];out=OUT/phase;out.mkdir()
            row={'name':phase,'command':step['command'],'environment':step['environment'],'passed':False};r['rows'].append(row)
            row['before']=preflight(13);snapshot()
            env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))};env.update(step['environment'])
            policy={**S['policy'],'maximum_build_seconds':step['timeout_seconds']}
            # guarded_run intentionally inherits its caller environment through
            # a small env executable, keeping all descendants in the owned group.
            command=['/usr/bin/env',*[k+'='+v for k,v in env.items() if k.startswith('SLOTSTREAM_')],*step['command']]
            saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
            for k in saved:os.environ.pop(k,None)
            try:
                print(json.dumps({'phase':'starting','name':phase}),flush=True)
                with (out/'stdout.txt').open('w') as stdout,(out/'stderr.txt').open('w') as stderr:
                    result=guarded_run(command,cwd=ROOT,stdout=stdout,stderr=stderr,record_path=out/'live-memory.json',snapshot=snapshot,policy=policy,classification='API correctness process; no compiler, performance qualification or activation')
                row['exit_code']=result.returncode
            except BaseException as e:
                row['error']=f'{type(e).__name__}: {e}'
                raise
            finally:
                os.environ.update(saved)
                (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n')
            live=json.loads((out/'live-memory.json').read_text())
            if result.returncode!=0 or live.get('passed') is not True:raise RuntimeError(phase+' did not finish successfully under its resource guard')
            if phase=='api-robustness':
                output=(out/'stdout.txt').read_text()
                if re.findall(r'^robustness: passed (\d+), failed (\d+)$',output,re.M)!=[('74','0')] or re.search(r'^(FAIL|SKIP)\b',output,re.M):raise RuntimeError('actual API requires all74passing checks')
                row['assertions']=74
            else:
                report=json.loads((out/'probe/manifest.json').read_text())
                if report.get('passed') is not True or report.get('expected_typed') is not True or len(report['cases'])!=4 or not all(c['status']==400 and c['typed'] for c in report['cases']):raise RuntimeError('four typed overflow responses did not pass')
                row['assertions']=4
            row['passed']=True;row['after']=snapshot()
            row['stdout_sha256']=digest(out/'stdout.txt');row['stderr_sha256']=digest(out/'stderr.txt')
            (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n');print(json.dumps({'name':phase,'passed':True,'assertions':row['assertions']}),flush=True)
        r['passed']=len(r['rows'])==2 and all(row['passed'] for row in r['rows'])
    except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
    finally:
        r['elapsed_seconds']=time.monotonic()-started
        # Persist the primary failure before independent handback checks.
        r['cleanup_checks_complete']=False
        (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
        checks={
            'after':vm_snapshot,
            'after_pressure':pressure_snapshot,
            'drivers_unchanged':lambda:all(digest(ROOT/'Tools'/n)==h for n,h in S['drivers'].items()),
            'candidate_unchanged':lambda:verified_build(B)==S['verified_build'],
            'remaining_jobs':competing_jobs,
            'model_lock_free':lambda:bool(preflight(0)),
        }
        for name,check in checks.items():
            try:r[name]=check()
            except BaseException as e:
                r.setdefault('handback_errors',{})[name]=f'{type(e).__name__}: {e}'
        r['cleanup_checks_complete']=not r.get('handback_errors')
        r['passed']=bool(r['passed'] and r['cleanup_checks_complete'] and r.get('drivers_unchanged')
            and r.get('candidate_unchanged') and not r.get('remaining_jobs') and r.get('model_lock_free')
            and r['elapsed_seconds']<=S['maximum_interval_seconds'] and r.get('after_pressure',{}).get('level')==1)
        (OUT/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['rows','before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)
````

