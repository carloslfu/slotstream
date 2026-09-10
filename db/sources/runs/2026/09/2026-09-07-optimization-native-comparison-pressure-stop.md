---
type: run
id: 01m1xevqh4p6xvrde89q2cnac8
created: 2026-09-07T08:13:24.388105+00:00
updated: 2026-09-07T08:13:24.659735+00:00
summary: First current-candidate native comparison stops at non-normal OS pressure
binary: V273 cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6; see exact per-run bindings
captured_at: 2026-09-07
command: Exact commands, prospective protocols and tool hashes embedded below
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: First current-candidate native comparison stops at non-normal OS pressure
tool: python3
---
# First current-candidate native comparison stops at non-normal OS pressure

V276 freezes the complete same-build three-native/eight-paired/two-soak contract, then starts only native/combined-plain. The exact V273 model enters reference cached17 and boundary255 before the normal-pressure predicate stops execution after11.806962625seconds. The old error proves a valid non-normal kernel level2or4, but did not preserve which level; no precise warning-versus-critical classification is supported. The preceding sample is8.107GBreclaimable and1.266GBownedRSS, not the missing trigger snapshot. Cleanup drains all owned groups and frees the lock. No complete native report, later native stage, paired cell or soak runs. This failed campaign is immutable and never retried or rescored. A fresh campaign must preserve it and bind its own exact tools and conditions.

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-campaign-v276/native/combined-plain/attempt.json

SHA-256 `bd9f043544623722a0c0b99cbbf19a8f922b36769bc5c2192937e0f7a27fd251`; 2152 bytes.

````text
{
  "stage": "native/combined-plain",
  "contract_sha256": "e06e91725e7654297c4339d5eb48f726b9235a27369e931567738eecf4c4c8be",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13186744320,
    "swapins": 44112907,
    "swapouts": 77530398,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     7852.\nPages active:                                 858824.\nPages inactive:                               849537.\nPages speculative:                             13918.\nPages throttled:                                   0.\nPages wired down:                             330942.\nPages purgeable:                               16752.\n\"Translation faults\":                    15468691180.\nPages copy-on-write:                       738808148.\nPages zero filled:                       21248045249.\nPages reactivated:                        3472477075.\nPages purged:                               72381630.\nFile-backed pages:                            780251.\nAnonymous pages:                              942028.\nPages stored in compressor:                  2432220.\nPages occupied by compressor:                1024192.\nDecompressions:                           1173666098.\nCompressions:                             1489614532.\nPageins:                                  7642780490.\nPageouts:                                   11091607.\nSwapins:                                    44112907.\nSwapouts:                                   77530398.\nPages tagged:                                 184391.\nPages tagged resident:                        129533.\nPages tagged compressed:                       54858.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7855.\nPages tag-storage free:                          181.\nPages tag-storage non-tag pageable:            90260.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8369216.\nTagged compressions:                        11303410.\nTagged decompressions:                      10415453.\n"
  }
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-campaign-v276/native/combined-plain/evidence/manifest.json

SHA-256 `285cbd142dbed2c306e87af23ffe7d570cef8d0131abdabaecb83e5d7552812e`; 19263 bytes.

````text
{
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
    "source_archive_sha256": "fafa905e659896e708b78dfd2065f98d50d7608dee774d835f589cc820c5240a",
    "binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "passed": false
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-campaign-v276/native/combined-plain/evidence/memory.json

SHA-256 `dfff95014c31e2d416e2e4468bc51513685aec3a3901da723c1bc61dda8566d1`; 13822 bytes.

````text
{
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 10000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1800,
    "stop_on_new_swapouts": false
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13185155072,
    "swapins": 44112907,
    "swapouts": 77530398,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     7754.\nPages active:                                 858833.\nPages inactive:                               849538.\nPages speculative:                             13918.\nPages throttled:                                   0.\nPages wired down:                             330942.\nPages purgeable:                               16752.\n\"Translation faults\":                    15468691807.\nPages copy-on-write:                       738808287.\nPages zero filled:                       21248045311.\nPages reactivated:                        3472477075.\nPages purged:                               72381630.\nFile-backed pages:                            780252.\nAnonymous pages:                              942037.\nPages stored in compressor:                  2432220.\nPages occupied by compressor:                1024192.\nDecompressions:                           1173666098.\nCompressions:                             1489614532.\nPageins:                                  7642780491.\nPageouts:                                   11091607.\nSwapins:                                    44112907.\nSwapouts:                                   77530398.\nPages tagged:                                 184391.\nPages tagged resident:                        129533.\nPages tagged compressed:                       54858.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7855.\nPages tag-storage free:                          181.\nPages tag-storage non-tag pageable:            90260.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8369216.\nTagged compressions:                        11303410.\nTagged decompressions:                      10415453.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0014454580000000106,
      "owned_rss_bytes": 491520,
      "owned_process_count": 1,
      "reclaimable_bytes": 13184598016,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 0.22312275,
      "owned_rss_bytes": 1550909440,
      "owned_process_count": 1,
      "reclaimable_bytes": 11960500224,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 0.48906354099999994,
      "owned_rss_bytes": 2649604096,
      "owned_process_count": 1,
      "reclaimable_bytes": 10572103680,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 0.776313916,
      "owned_rss_bytes": 2106114048,
      "owned_process_count": 1,
      "reclaimable_bytes": 9961963520,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 1.085013916,
      "owned_rss_bytes": 1673314304,
      "owned_process_count": 1,
      "reclaimable_bytes": 9494200320,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 1.3261322500000001,
      "owned_rss_bytes": 1606615040,
      "owned_process_count": 1,
      "reclaimable_bytes": 9412411392,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 1.5615720000000002,
      "owned_rss_bytes": 1567571968,
      "owned_process_count": 1,
      "reclaimable_bytes": 9216262144,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 1.8012678750000002,
      "owned_rss_bytes": 1473576960,
      "owned_process_count": 1,
      "reclaimable_bytes": 9107898368,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 2.0453600830000003,
      "owned_rss_bytes": 1469054976,
      "owned_process_count": 1,
      "reclaimable_bytes": 9032122368,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 2.278767416,
      "owned_rss_bytes": 1469218816,
      "owned_process_count": 1,
      "reclaimable_bytes": 8936718336,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 2.512865166,
      "owned_rss_bytes": 1479262208,
      "owned_process_count": 1,
      "reclaimable_bytes": 8853438464,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 2.76147725,
      "owned_rss_bytes": 1559281664,
      "owned_process_count": 1,
      "reclaimable_bytes": 8730525696,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 2.9875763330000003,
      "owned_rss_bytes": 1611923456,
      "owned_process_count": 1,
      "reclaimable_bytes": 8418672640,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 3.2443329160000003,
      "owned_rss_bytes": 1612546048,
      "owned_process_count": 1,
      "reclaimable_bytes": 8311554048,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 3.486277458,
      "owned_rss_bytes": 1612906496,
      "owned_process_count": 1,
      "reclaimable_bytes": 8299151360,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 3.723954416,
      "owned_rss_bytes": 1466220544,
      "owned_process_count": 1,
      "reclaimable_bytes": 8319090688,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 3.96626975,
      "owned_rss_bytes": 1299136512,
      "owned_process_count": 1,
      "reclaimable_bytes": 8264024064,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 4.214660791,
      "owned_rss_bytes": 1232175104,
      "owned_process_count": 1,
      "reclaimable_bytes": 8210792448,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 4.462802458,
      "owned_rss_bytes": 1112883200,
      "owned_process_count": 1,
      "reclaimable_bytes": 8232992768,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 4.703915583,
      "owned_rss_bytes": 1039368192,
      "owned_process_count": 1,
      "reclaimable_bytes": 8156282880,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 4.934241083,
      "owned_rss_bytes": 994508800,
      "owned_process_count": 1,
      "reclaimable_bytes": 8053620736,
      "swapins": 44112907,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 5.188262666,
      "owned_rss_bytes": 947109888,
      "owned_process_count": 1,
      "reclaimable_bytes": 8036450304,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 5.418819333,
      "owned_rss_bytes": 947257344,
      "owned_process_count": 1,
      "reclaimable_bytes": 8017920000,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 5.657317582999999,
      "owned_rss_bytes": 947453952,
      "owned_process_count": 1,
      "reclaimable_bytes": 7992246272,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 5.886088291,
      "owned_rss_bytes": 947634176,
      "owned_process_count": 1,
      "reclaimable_bytes": 7884914688,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 6.130568916,
      "owned_rss_bytes": 947781632,
      "owned_process_count": 1,
      "reclaimable_bytes": 8056127488,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 6.366152916,
      "owned_rss_bytes": 947961856,
      "owned_process_count": 1,
      "reclaimable_bytes": 8041529344,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 6.599892333,
      "owned_rss_bytes": 949436416,
      "owned_process_count": 1,
      "reclaimable_bytes": 8020049920,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 6.828064625,
      "owned_rss_bytes": 1244643328,
      "owned_process_count": 1,
      "reclaimable_bytes": 7767949312,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 7.090213749999999,
      "owned_rss_bytes": 1102741504,
      "owned_process_count": 1,
      "reclaimable_bytes": 7688781824,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 7.343081540999999,
      "owned_rss_bytes": 1097416704,
      "owned_process_count": 1,
      "reclaimable_bytes": 7729709056,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 7.575886457999999,
      "owned_rss_bytes": 1101774848,
      "owned_process_count": 1,
      "reclaimable_bytes": 7753170944,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 7.814159707999999,
      "owned_rss_bytes": 1192493056,
      "owned_process_count": 1,
      "reclaimable_bytes": 7704608768,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 8.051466875000001,
      "owned_rss_bytes": 1196212224,
      "owned_process_count": 1,
      "reclaimable_bytes": 7759036416,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 8.291088,
      "owned_rss_bytes": 1196851200,
      "owned_process_count": 1,
      "reclaimable_bytes": 7706525696,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 8.546385291,
      "owned_rss_bytes": 1196916736,
      "owned_process_count": 1,
      "reclaimable_bytes": 7773159424,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 8.807182041,
      "owned_rss_bytes": 1156382720,
      "owned_process_count": 1,
      "reclaimable_bytes": 7816577024,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 9.040125250000001,
      "owned_rss_bytes": 1156694016,
      "owned_process_count": 1,
      "reclaimable_bytes": 7809646592,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 9.282769458,
      "owned_rss_bytes": 1154220032,
      "owned_process_count": 1,
      "reclaimable_bytes": 7762493440,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 9.539872125,
      "owned_rss_bytes": 1194770432,
      "owned_process_count": 1,
      "reclaimable_bytes": 7705346048,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 9.810853083000001,
      "owned_rss_bytes": 1195851776,
      "owned_process_count": 1,
      "reclaimable_bytes": 7770849280,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 10.054657708,
      "owned_rss_bytes": 1193869312,
      "owned_process_count": 1,
      "reclaimable_bytes": 7781974016,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 10.299919000000001,
      "owned_rss_bytes": 1154007040,
      "owned_process_count": 1,
      "reclaimable_bytes": 7766933504,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 10.54977775,
      "owned_rss_bytes": 1154252800,
      "owned_process_count": 1,
      "reclaimable_bytes": 7776141312,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 10.794836416,
      "owned_rss_bytes": 1144422400,
      "owned_process_count": 1,
      "reclaimable_bytes": 7909818368,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 11.040878041000001,
      "owned_rss_bytes": 1144078336,
      "owned_process_count": 1,
      "reclaimable_bytes": 7964475392,
      "swapins": 44112911,
      "swapouts": 77530398
    },
    {
      "elapsed_seconds": 11.290824541000001,
      "owned_rss_bytes": 1265680384,
      "owned_process_count": 1,
      "reclaimable_bytes": 8107311104,
      "swapins": 44112911,
      "swapouts": 77530398
    }
  ],
  "passed": false,
  "classification": "Native correctness only; VM activity is recorded, never performance/resource qualification",
  "child_pid": 43484,
  "error": "RuntimeError: OS memory pressure is not normal; model work is not eligible",
  "traceback": "Traceback (most recent call last):\n  File \"/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py\", line 128, in guarded_run\n    current = snapshot()\n  File \"/Users/carlos/Projects/slotstream/Tools/optimization_campaign.py\", line 270, in snapshot\n    require_normal(pressure_snapshot())\n  File \"/Users/carlos/Projects/slotstream/Tools/optimization_readiness.py\", line 19, in require_normal\n    raise RuntimeError('OS memory pressure is not normal; model work is not eligible')\nRuntimeError: OS memory pressure is not normal; model work is not eligible\n",
  "owned_groups": [
    43484
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 11.796234375000001,
  "child_exit_code": -15,
  "after_cleanup_error": "RuntimeError: OS memory pressure is not normal; model work is not eligible"
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-campaign-v276/native/combined-plain/evidence/memory.samples.jsonl

SHA-256 `4dc000cebd0c573c4f077b80fdfbc494ef40f8a27cad8d88c17b0dfe66e14856`; 7918 bytes.

````text
{"elapsed_seconds": 0.0014454580000000106, "owned_rss_bytes": 491520, "owned_process_count": 1, "reclaimable_bytes": 13184598016, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 0.22312275, "owned_rss_bytes": 1550909440, "owned_process_count": 1, "reclaimable_bytes": 11960500224, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 0.48906354099999994, "owned_rss_bytes": 2649604096, "owned_process_count": 1, "reclaimable_bytes": 10572103680, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 0.776313916, "owned_rss_bytes": 2106114048, "owned_process_count": 1, "reclaimable_bytes": 9961963520, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 1.085013916, "owned_rss_bytes": 1673314304, "owned_process_count": 1, "reclaimable_bytes": 9494200320, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 1.3261322500000001, "owned_rss_bytes": 1606615040, "owned_process_count": 1, "reclaimable_bytes": 9412411392, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 1.5615720000000002, "owned_rss_bytes": 1567571968, "owned_process_count": 1, "reclaimable_bytes": 9216262144, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 1.8012678750000002, "owned_rss_bytes": 1473576960, "owned_process_count": 1, "reclaimable_bytes": 9107898368, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 2.0453600830000003, "owned_rss_bytes": 1469054976, "owned_process_count": 1, "reclaimable_bytes": 9032122368, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 2.278767416, "owned_rss_bytes": 1469218816, "owned_process_count": 1, "reclaimable_bytes": 8936718336, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 2.512865166, "owned_rss_bytes": 1479262208, "owned_process_count": 1, "reclaimable_bytes": 8853438464, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 2.76147725, "owned_rss_bytes": 1559281664, "owned_process_count": 1, "reclaimable_bytes": 8730525696, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 2.9875763330000003, "owned_rss_bytes": 1611923456, "owned_process_count": 1, "reclaimable_bytes": 8418672640, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 3.2443329160000003, "owned_rss_bytes": 1612546048, "owned_process_count": 1, "reclaimable_bytes": 8311554048, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 3.486277458, "owned_rss_bytes": 1612906496, "owned_process_count": 1, "reclaimable_bytes": 8299151360, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 3.723954416, "owned_rss_bytes": 1466220544, "owned_process_count": 1, "reclaimable_bytes": 8319090688, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 3.96626975, "owned_rss_bytes": 1299136512, "owned_process_count": 1, "reclaimable_bytes": 8264024064, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 4.214660791, "owned_rss_bytes": 1232175104, "owned_process_count": 1, "reclaimable_bytes": 8210792448, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 4.462802458, "owned_rss_bytes": 1112883200, "owned_process_count": 1, "reclaimable_bytes": 8232992768, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 4.703915583, "owned_rss_bytes": 1039368192, "owned_process_count": 1, "reclaimable_bytes": 8156282880, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 4.934241083, "owned_rss_bytes": 994508800, "owned_process_count": 1, "reclaimable_bytes": 8053620736, "swapins": 44112907, "swapouts": 77530398}
{"elapsed_seconds": 5.188262666, "owned_rss_bytes": 947109888, "owned_process_count": 1, "reclaimable_bytes": 8036450304, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 5.418819333, "owned_rss_bytes": 947257344, "owned_process_count": 1, "reclaimable_bytes": 8017920000, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 5.657317582999999, "owned_rss_bytes": 947453952, "owned_process_count": 1, "reclaimable_bytes": 7992246272, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 5.886088291, "owned_rss_bytes": 947634176, "owned_process_count": 1, "reclaimable_bytes": 7884914688, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 6.130568916, "owned_rss_bytes": 947781632, "owned_process_count": 1, "reclaimable_bytes": 8056127488, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 6.366152916, "owned_rss_bytes": 947961856, "owned_process_count": 1, "reclaimable_bytes": 8041529344, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 6.599892333, "owned_rss_bytes": 949436416, "owned_process_count": 1, "reclaimable_bytes": 8020049920, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 6.828064625, "owned_rss_bytes": 1244643328, "owned_process_count": 1, "reclaimable_bytes": 7767949312, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 7.090213749999999, "owned_rss_bytes": 1102741504, "owned_process_count": 1, "reclaimable_bytes": 7688781824, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 7.343081540999999, "owned_rss_bytes": 1097416704, "owned_process_count": 1, "reclaimable_bytes": 7729709056, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 7.575886457999999, "owned_rss_bytes": 1101774848, "owned_process_count": 1, "reclaimable_bytes": 7753170944, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 7.814159707999999, "owned_rss_bytes": 1192493056, "owned_process_count": 1, "reclaimable_bytes": 7704608768, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 8.051466875000001, "owned_rss_bytes": 1196212224, "owned_process_count": 1, "reclaimable_bytes": 7759036416, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 8.291088, "owned_rss_bytes": 1196851200, "owned_process_count": 1, "reclaimable_bytes": 7706525696, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 8.546385291, "owned_rss_bytes": 1196916736, "owned_process_count": 1, "reclaimable_bytes": 7773159424, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 8.807182041, "owned_rss_bytes": 1156382720, "owned_process_count": 1, "reclaimable_bytes": 7816577024, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 9.040125250000001, "owned_rss_bytes": 1156694016, "owned_process_count": 1, "reclaimable_bytes": 7809646592, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 9.282769458, "owned_rss_bytes": 1154220032, "owned_process_count": 1, "reclaimable_bytes": 7762493440, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 9.539872125, "owned_rss_bytes": 1194770432, "owned_process_count": 1, "reclaimable_bytes": 7705346048, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 9.810853083000001, "owned_rss_bytes": 1195851776, "owned_process_count": 1, "reclaimable_bytes": 7770849280, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 10.054657708, "owned_rss_bytes": 1193869312, "owned_process_count": 1, "reclaimable_bytes": 7781974016, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 10.299919000000001, "owned_rss_bytes": 1154007040, "owned_process_count": 1, "reclaimable_bytes": 7766933504, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 10.54977775, "owned_rss_bytes": 1154252800, "owned_process_count": 1, "reclaimable_bytes": 7776141312, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 10.794836416, "owned_rss_bytes": 1144422400, "owned_process_count": 1, "reclaimable_bytes": 7909818368, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 11.040878041000001, "owned_rss_bytes": 1144078336, "owned_process_count": 1, "reclaimable_bytes": 7964475392, "swapins": 44112911, "swapouts": 77530398}
{"elapsed_seconds": 11.290824541000001, "owned_rss_bytes": 1265680384, "owned_process_count": 1, "reclaimable_bytes": 8107311104, "swapins": 44112911, "swapouts": 77530398}
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-campaign-v276/native/combined-plain/evidence/stderr.txt

SHA-256 `a26818b5d3dbb624012f3f9bc7920d62be0fd53c3c5318492437bcc7f3debb84`; 67 bytes.

````text
integrated reference / cached17
integrated reference / boundary255
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-campaign-v276/native/combined-plain/evidence/stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-campaign-v276/native/combined-plain/receipt.json

SHA-256 `87daa5c46be823dbe42e4bd63888e4088dffecedfcb9f1673d4d315ce227afbf`; 2673 bytes.

````text
{
  "cleanup_complete": true,
  "error": "RuntimeError: OS memory pressure is not normal; model work is not eligible",
  "elapsed_seconds": 11.806962625,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 15419867136,
    "swapins": 44112911,
    "swapouts": 77530398,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   463627.\nPages active:                                 557442.\nPages inactive:                               537180.\nPages speculative:                             18300.\nPages throttled:                                   0.\nPages wired down:                             325844.\nPages purgeable:                               11520.\n\"Translation faults\":                    15469789760.\nPages copy-on-write:                       738844591.\nPages zero filled:                       21248982221.\nPages reactivated:                        3472673424.\nPages purged:                               72398504.\nFile-backed pages:                            466007.\nAnonymous pages:                              646915.\nPages stored in compressor:                  2728491.\nPages occupied by compressor:                1180700.\nDecompressions:                           1174156614.\nCompressions:                             1490462842.\nPageins:                                  7642871778.\nPageouts:                                   11091920.\nSwapins:                                    44112911.\nSwapouts:                                   77530398.\nPages tagged:                                 183020.\nPages tagged resident:                        121045.\nPages tagged compressed:                       61975.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7843.\nPages tag-storage free:                         2561.\nPages tag-storage non-tag pageable:            87892.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9814912.\nTagged compressions:                        11311745.\nTagged decompressions:                      10416343.\n"
  },
  "remaining_jobs": [],
  "artifact_sha256": {
    "manifest.json": "285cbd142dbed2c306e87af23ffe7d570cef8d0131abdabaecb83e5d7552812e",
    "memory.json": "dfff95014c31e2d416e2e4468bc51513685aec3a3901da723c1bc61dda8566d1",
    "memory.samples.jsonl": "4dc000cebd0c573c4f077b80fdfbc494ef40f8a27cad8d88c17b0dfe66e14856",
    "stderr.txt": "a26818b5d3dbb624012f3f9bc7920d62be0fd53c3c5318492437bcc7f3debb84",
    "stdout.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  }
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-campaign-v276/packet.json

SHA-256 `1c9d42694fc9a737f035e5762773169e847c24933d20c1cad01272ea0af0d60e`; 22000 bytes.

````text
{
  "format": "slotstream-campaign-v1",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
      "source_archive_sha256": "fafa905e659896e708b78dfd2065f98d50d7608dee774d835f589cc820c5240a",
      "binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "created_at": "2026-09-07T07:54:14.202074+00:00",
  "scope": "Combined candidate qualification only; full release/client/resource acceptance and activation remain separate",
  "contract_sha256": "e06e91725e7654297c4339d5eb48f726b9235a27369e931567738eecf4c4c8be",
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

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-campaign-v276/qualification-contract.json

SHA-256 `e06e91725e7654297c4339d5eb48f726b9235a27369e931567738eecf4c4c8be`; 68547 bytes.

````text
{
  "format": "slotstream-qualification-v1",
  "build_identity": {
    "binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6",
    "source_archive_sha256": "fafa905e659896e708b78dfd2065f98d50d7608dee774d835f589cc820c5240a",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "native": {
    "combined-plain": {
      "command": [
        "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
        "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
        "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
      "frozen_binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6"
    },
    "unique-prose": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
      "frozen_binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6"
    },
    "sampled-short": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
      "frozen_binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6"
    },
    "mtp-resource": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
      "frozen_binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6"
    },
    "distinct-tail": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
      "frozen_binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6"
    },
    "complete-repeat": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
      "frozen_binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6"
    },
    "unique-with-retention": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
      "frozen_binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6"
    },
    "actual-default-one-token": {
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
          "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
      "frozen_binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6"
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "env": {},
      "mtp": "off",
      "frozen_binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6"
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
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
      "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "env": {},
      "mtp": "on",
      "frozen_binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6"
    }
  }
}
````

## /tmp/slotstream-optimization-execution/campaign-status-v276.json

SHA-256 `f319d7fb06c445c0633999c5fda3391ece6de7405309d67d47490393d033701c`; 1278 bytes.

````text
{
  "scope": "Combined candidate qualification only; full release/client/resource acceptance and activation remain separate",
  "stages": [
    {
      "stage": "native/combined-plain",
      "status": "incomplete_or_failed",
      "error": "stage failed or its ownership/contract differs"
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

