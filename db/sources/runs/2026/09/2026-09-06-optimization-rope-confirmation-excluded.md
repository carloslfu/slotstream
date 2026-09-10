---
type: run
id: 01m1v60wb1yd42xyhtjrnkzn5n
created: 2026-09-06T11:00:27.105635+00:00
updated: 2026-09-06T11:00:27.365363+00:00
summary: Independent RoPE confirmation stopped on swap V145
binary: .build/optimization/terminal-query-tail-build-v144/candidate/slotstream
captured_at: 2026-09-06
command: same V144 four-arm five-round component protocol; no replacements or pooling
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Independent RoPE confirmation stopped on swap V145
tool: rope_component.py
---
V145 is the one prospectively frozen independent confirmation of V144's RoPE component screen, with the exact same V144 executable, helper and gates. It stops at rows256/round5/fused on interval swap. Of274 reported assertions,273 pass and the interval-swap assertion fails. Four whole-process swapins, zero swapouts; no known competing workspace job. The entire process is excluded, with no pooling/replacement or qualified component gain. The1024-row family is unrun in this confirmation. Exactness/mechanism checks completed so far pass, but they do not override the timing exclusion. RoPE remains off and has no serving speed claim. Further work moves to the already-frozen V140 resident-serving protocol; it has no observation at this capture.


Artifact `.build/optimization/rope-component-confirmation-v145/manifest.json` — 29982 bytes, SHA-256 `3e0197d56b18f83cc1f8aedcfe621027602814785211b5c50bd0439de8a4e281`.
````text
{
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/terminal-query-tail-build-v144/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "3d74c6dad941df731c7b8f1073623429242458767c29736a5fcb0f06de614057",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "e0fec48576729e6c6a6e3256709ba62a2f037011bde739b03968a4c8f2eb9bb2",
        "Sources/Slotstream/Governor.swift": "1051b77bc36d44645081687dcc3fadb7e0f7427e77dac1706f785fe6e6e8a9eb",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "2b2a5ab441f61bd2ca88b252c82b4db12863e05200ccb6c0743ff0cfc94bf907",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "ea1458d6ede47242340c970f4537f91518c2bddc561a31e92176b62072027c4b",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/Optimizations.swift": "cb88581740fe7ef6f9e2263090f58f66f9aee7a67886668b6f4d35dca0829562",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PartialRotation.swift": "046c98e560523425133e2bbcda0ffd666b4e984714e5742e70652bb251fb78d0",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
        "Sources/Slotstream/PrefixCache.swift": "fe569ca738f9d33b9445e3c0a29acde0a4c2987f54036ea0b9d09442471a3704",
        "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "0746b27981132931d9773f5f43c2287a61772522a5272c9900139d2e1f185442",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "8c7c41044630f1b97a135df88a5094e68ab7e8edb9a56490279549f1d1b59861",
        "Sources/Slotstream/Vision.swift": "4f9c17f55ca450e88317f6002cfab3e834711e0444b9ee9d8ee6deaff2673fbb",
        "Sources/Slotstream/VisionAttention.swift": "5bf65f84e71f9befff782516fdd3943e88155dd35aa0c9e6a03a778421c280f2",
        "Sources/Slotstream/VisionPrompt.swift": "d0aa383cefa9ea52ab7af32d41eb6741bc846830204dc33694de873f4b63b7a6",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "69a422597f7b28628a49c8b4a9d5f77ae670ff387c6b33610927bccf6352139f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "63a1ab81fe1bd5578111dfc0bdf657602ebe4c4202b7dc1ebb818c0f9ef7b226",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "8cbf3ea0a08d9b4f5e1ea76656d3cb9aad728aeae674b5e86556d163ed094a85",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "25feac2e80b922a26a74917b0ce34b42279756abafcfd58f03d307380b69a485",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "035ae48944185597042516f8a92a84dee2354334da64467e84da268ea85da60c",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "c04eef5fdb8c51f98603ab09e4c4f3be8047e2df425118d5016ca779ba2ac246",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "34e74989d1f4fd2fcc9fd8cb9b0f1fc75c0e4e1c214751f44245f2543270ab09",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "083d9e609c0b3ec93feed540e25aaafb722521de9c0491cf2e4d2af66adf3b8b",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "f2c1fcad37dba3c04fe0613f9aa1afd91f53a1837da9d88345f661ebd965a1ae",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
        "Sources/SlotstreamTestKit/T0Checks.swift": "07a7f37fa122b47f360c542a9a277f98de20a2ba8855cd0952937ff64152827f",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "141be8cedbcdabc67df5e764cec5d416e89ba4fa24a7b5ce38e4486ca786372c",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "967d92587eb2e10b61e53d61bf84f229d5be2c8a26aca4c879de435b3a9fd1d5",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "a4927ad15da17ede7552a8be618cc885b1c2b82a0ccc48f462f0ae1045f1b20d",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "4dcfb91d49c5c68676ca55b348e2703e6c27efcd9620786a5b5f10f86f83e237",
      "binary_sha256": "3593cf96170998a1fb085f9ceae473f32ed6698f677981d0a039ff672c41351d",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "qualified": false,
  "classification": "QSA angle-table and BF16 rotation component only. Fixed synthetic materialized activations, no trained model projections, attention, I/O, serving or energy claim.",
  "protocol": {
    "rows": [
      1,
      256,
      1024
    ],
    "rounds": 5,
    "passes_per_cell": 32,
    "layers_per_pass": 12,
    "arms": [
      "reference",
      "tables",
      "fused",
      "combined"
    ],
    "q_shape": "[1,24,rows,256], transposed from BF16 time-major",
    "k_shape": "[1,2,rows,256], transposed from BF16 time-major",
    "rotary_dim": 64,
    "base": 10000000,
    "first_position": 8192,
    "position_advance_per_pass": "rows",
    "warmup_calls_per_arm": 3,
    "reversed_even_round_order": true,
    "replacement_rounds": 0,
    "required_exact_bytes": true,
    "minimum_complete_clean_pairs": 5,
    "minimum_median_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "maximum_sampled_footprint_bytes": 2000000000,
    "exclude_entire_process_if_global_swap_or_workspace_contention": true,
    "primary_metric": "Wall time of all production Rope.table/rotate calls with both outputs evaluated every layer, including array construction, table lookup and rotation. Not GPU event duration.",
    "adoption": "A component benefit only earns separate fixed-total-memory serving qualification."
  },
  "harness_sources": {
    "rope_component.py": "54f8ae9050ade464dfee50fcc8dacdd3363fde2ee77d8b514b4062b1ea71f65c",
    "prefill_bench.py": "2a3e71d78d9bf0f35f0cc281fca89c37f7f6a360be0855030238f857b8f8b955",
    "serve_bench.py": "0f8a052f89f143c83c80c640465de7fa0a6ab92d7f5b3cb67195fc8068fc40a2"
  },
  "competing_jobs_before": [],
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33336901632,
    "swapins": 43727952,
    "swapouts": 77323699,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   377971.\nPages active:                                1090436.\nPages inactive:                               893879.\nPages speculative:                            197387.\nPages throttled:                                   0.\nPages wired down:                             218831.\nPages purgeable:                                1531.\n\"Translation faults\":                    14638929419.\nPages copy-on-write:                       672543542.\nPages zero filled:                       19661440630.\nPages reactivated:                        3253947523.\nPages purged:                               68844040.\nFile-backed pages:                           1655221.\nAnonymous pages:                              526481.\nPages stored in compressor:                  1638114.\nPages occupied by compressor:                 305753.\nDecompressions:                           1131658060.\nCompressions:                             1442283044.\nPageins:                                  7004553239.\nPageouts:                                   10949771.\nSwapins:                                    43727952.\nSwapouts:                                   77323699.\nPages tagged:                                 151791.\nPages tagged resident:                        116243.\nPages tagged compressed:                       35548.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6750.\nPages tag-storage free:                         1538.\nPages tag-storage non-tag pageable:            90008.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6385984.\nTagged compressions:                        10671333.\nTagged decompressions:                       9845602.\n"
  },
  "host_before": {
    "load_average_1_5_15_minutes": [
      1.43701171875,
      2.12841796875,
      2.52099609375
    ],
    "observed_at_unix_seconds": 1788692268.6376488,
    "thermal_limit": "pmset warning/status history, not continuous temperature",
    "energy_joules": null,
    "power_source": {
      "exit_code": 0,
      "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
      "stderr": ""
    },
    "power_configuration": {
      "exit_code": 0,
      "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
      "stderr": ""
    },
    "thermal_status": {
      "exit_code": 0,
      "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
      "stderr": ""
    }
  },
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/terminal-query-tail-build-v144/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "rope-performance",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "exit_code": 1,
  "native_passed": false,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33513635840,
    "swapins": 43727956,
    "swapouts": 77323699,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   378676.\nPages active:                                1097842.\nPages inactive:                               899417.\nPages speculative:                            197455.\nPages throttled:                                   0.\nPages wired down:                             204553.\nPages purgeable:                               11578.\n\"Translation faults\":                    14638942538.\nPages copy-on-write:                       672544516.\nPages zero filled:                       19661452829.\nPages reactivated:                        3253947523.\nPages purged:                               68844040.\nFile-backed pages:                           1655256.\nAnonymous pages:                              539458.\nPages stored in compressor:                  1637747.\nPages occupied by compressor:                 305581.\nDecompressions:                           1131658427.\nCompressions:                             1442283044.\nPageins:                                  7004553281.\nPageouts:                                   10949771.\nSwapins:                                    43727956.\nSwapouts:                                   77323699.\nPages tagged:                                 151824.\nPages tagged resident:                        116342.\nPages tagged compressed:                       35482.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6750.\nPages tag-storage free:                         1557.\nPages tag-storage non-tag pageable:            89989.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6373312.\nTagged compressions:                        10671333.\nTagged decompressions:                       9845668.\n"
  },
  "host_after": {
    "load_average_1_5_15_minutes": [
      1.48193359375,
      2.1259765625,
      2.517578125
    ],
    "observed_at_unix_seconds": 1788692272.186107,
    "thermal_limit": "pmset warning/status history, not continuous temperature",
    "energy_joules": null,
    "power_source": {
      "exit_code": 0,
      "stdout": "Now drawing from 'AC Power'\n -InternalBattery-0 (id=23265379)\t80%; AC attached; not charging present: true\n",
      "stderr": ""
    },
    "power_configuration": {
      "exit_code": 0,
      "stdout": "Battery Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         2\n womp                 0\n networkoversleep     0\n sleep                1\n lessbright           1\n tcpkeepalive         1\n disksleep            10\nAC Power:\n Sleep On Power Button 1\n powermode            0\n standby              1\n ttyskeepawake        1\n hibernatemode        3\n powernap             1\n hibernatefile        /var/vm/sleepimage\n displaysleep         10\n womp                 1\n networkoversleep     0\n sleep                0\n tcpkeepalive         1\n disksleep            10\n",
      "stderr": ""
    },
    "thermal_status": {
      "exit_code": 0,
      "stdout": "Note: No thermal warning level has been recorded\nNote: No performance warning level has been recorded\nNote: No CPU power status has been recorded\n",
      "stderr": ""
    }
  },
  "competing_jobs_after": [],
  "process_swap_clean": false,
  "sources_unchanged": true,
  "outcomes": [
    {
      "rows": 1,
      "arm": "tables",
      "pairs": [
        0.1938537290244533,
        0.07155001272909134,
        0.08589294707898187,
        0.05928908704619318,
        0.06533375603364044
      ],
      "qualified": false,
      "median_reduction": 0.07155001272909134,
      "positive_fraction": 1.0,
      "component_benefit_passed": false
    },
    {
      "rows": 1,
      "arm": "fused",
      "pairs": [
        0.28013646287704586,
        0.12293206077594421,
        0.1335663981220384,
        0.12698060061071847,
        0.13185648349111423
      ],
      "qualified": false,
      "median_reduction": 0.13185648349111423,
      "positive_fraction": 1.0,
      "component_benefit_passed": false
    },
    {
      "rows": 1,
      "arm": "combined",
      "pairs": [
        0.3200983288544347,
        0.18473030876268337,
        0.18820092891654006,
        0.19144241762088032,
        0.20035939931034819
      ],
      "qualified": false,
      "median_reduction": 0.19144241762088032,
      "positive_fraction": 1.0,
      "component_benefit_passed": false
    },
    {
      "rows": 256,
      "arm": "tables",
      "pairs": [
        0.17095402546040173,
        0.01972762042070897,
        0.018006786481089332,
        0.0366032696477252,
        0.007402899210477321
      ],
      "qualified": false,
      "median_reduction": 0.01972762042070897,
      "positive_fraction": 1.0,
      "component_benefit_passed": false
    },
    {
      "rows": 256,
      "arm": "fused",
      "pairs": [
        0.016889505706737196,
        -0.007294666546521444,
        -0.0058768624035954176,
        -0.007840698819328695,
        -0.010460689572372006
      ],
      "qualified": false,
      "median_reduction": -0.007294666546521444,
      "positive_fraction": 0.2,
      "component_benefit_passed": false
    },
    {
      "rows": 256,
      "arm": "combined",
      "pairs": [
        0.06136307328310975,
        0.005668939416694219,
        0.005129899053596176,
        0.013162084897740622
      ],
      "qualified": false,
      "median_reduction": 0.00941551215721742,
      "positive_fraction": 1.0,
      "component_benefit_passed": false
    },
    {
      "rows": 1024,
      "arm": "tables",
      "pairs": [],
      "qualified": false,
      "median_reduction": null,
      "positive_fraction": null,
      "component_benefit_passed": false
    },
    {
      "rows": 1024,
      "arm": "fused",
      "pairs": [],
      "qualified": false,
      "median_reduction": null,
      "positive_fraction": null,
      "component_benefit_passed": false
    },
    {
      "rows": 1024,
      "arm": "combined",
      "pairs": [],
      "qualified": false,
      "median_reduction": null,
      "positive_fraction": null,
      "component_benefit_passed": false
    }
  ]
}

````

Artifact `.build/optimization/rope-component-confirmation-v145/prefill_bench.py` — 17648 bytes, SHA-256 `2a3e71d78d9bf0f35f0cc281fca89c37f7f6a360be0855030238f857b8f8b955`.
````text
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


class InsufficientHeadroom(RuntimeError):
    pass


def preflight(needed_gb):
    # Release before child launch; child reacquires atomically before allocation.
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock", "a") as lock:
        try: fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as e: raise RuntimeError("another model process holds the lock") from e
    state = vm_snapshot()
    if state["reclaimable_bytes"] < needed_gb * 1e9:
        raise InsufficientHeadroom(f"{state['reclaimable_bytes']/1e9:.2f} GB reclaimable; need {needed_gb:.2f} GB")
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


def validate_metrics(d, *, allow_complete_prompt=False):
    if type(allow_complete_prompt) is not bool: raise ValueError("complete prompt permission must be Boolean")
    if d.get("schema_version") != 1: raise ValueError("unsupported schema")
    s = d["stats"]
    for k in ("prefillSeconds", "decodeSeconds", "requestSeconds", "imageEncodeSeconds"):
        if type(s.get(k)) not in (int, float) or not math.isfinite(s[k]) or s[k] < 0:
            raise ValueError(f"invalid {k}")
    for k in ("prefillRecords", "decodeRecords", "prefillTokens", "decodeTokens", "lifetimeRSSPeakBytes"):
        if type(s.get(k)) is not int or s[k] < 0: raise ValueError(f"invalid {k}")
    if s["prefillTokens"] == 0:
        if not allow_complete_prompt: raise ValueError("no completed prefill")
        if (type(s.get('promptTokens')) is not int or s['promptTokens'] <= 0
            or type(s.get('reusedPrefixTokens')) is not int or s['reusedPrefixTokens'] != s['promptTokens']
            or type(s.get('completePromptHits')) is not int or s['completePromptHits'] != 1
            or s['prefillRecords'] != 0 or s.get('prefillPasses') != []
            or s.get('prefillComputePasses') != []
            or type(s.get('prefillReadBytes')) is not int or s['prefillReadBytes'] != 0):
            raise ValueError("zero-prefill request lacks an exact complete-prompt hit and zero work")
    elif s["prefillSeconds"] <= 0: raise ValueError("no completed prefill")
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

````

Artifact `.build/optimization/rope-component-confirmation-v145/protocol.json` — 19499 bytes, SHA-256 `9c8f4933687cbc9b86c9ab427d11028a5ff2ddfcd3ee1e1f18dbc71d750f76a7`.
````text
{
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/terminal-query-tail-build-v144/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "07301354bebebac253975abbd5981006be411fed444abab0b6bbc857e28bdd1b",
        "Sources/CSlotpack/slotpack.c": "be45d2daf3e7e95d66cb9178f40dab292b85b1998086d71c53e41f59596d57a2",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "da137aec8944dab6590cbea17afff28f094aef876688d20782b5791028d83349",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "3d74c6dad941df731c7b8f1073623429242458767c29736a5fcb0f06de614057",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "e0fec48576729e6c6a6e3256709ba62a2f037011bde739b03968a4c8f2eb9bb2",
        "Sources/Slotstream/Governor.swift": "1051b77bc36d44645081687dcc3fadb7e0f7427e77dac1706f785fe6e6e8a9eb",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "2b2a5ab441f61bd2ca88b252c82b4db12863e05200ccb6c0743ff0cfc94bf907",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "ea1458d6ede47242340c970f4537f91518c2bddc561a31e92176b62072027c4b",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/Optimizations.swift": "cb88581740fe7ef6f9e2263090f58f66f9aee7a67886668b6f4d35dca0829562",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PartialRotation.swift": "046c98e560523425133e2bbcda0ffd666b4e984714e5742e70652bb251fb78d0",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
        "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
        "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
        "Sources/Slotstream/PrefixCache.swift": "fe569ca738f9d33b9445e3c0a29acde0a4c2987f54036ea0b9d09442471a3704",
        "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
        "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "0746b27981132931d9773f5f43c2287a61772522a5272c9900139d2e1f185442",
        "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
        "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
        "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
        "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
        "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "8c7c41044630f1b97a135df88a5094e68ab7e8edb9a56490279549f1d1b59861",
        "Sources/Slotstream/Vision.swift": "4f9c17f55ca450e88317f6002cfab3e834711e0444b9ee9d8ee6deaff2673fbb",
        "Sources/Slotstream/VisionAttention.swift": "5bf65f84e71f9befff782516fdd3943e88155dd35aa0c9e6a03a778421c280f2",
        "Sources/Slotstream/VisionPrompt.swift": "d0aa383cefa9ea52ab7af32d41eb6741bc846830204dc33694de873f4b63b7a6",
        "Sources/Slotstream/WeightDownload.swift": "2758b2eea2631635cd3da5c18a87e724c57aab5c78ad816b7e18d7ff48c8c98d",
        "Sources/Slotstream/WeightStore.swift": "df36f23325493c95efdd73f9f20d8ce56bc5b7c8b1b40d5660651e143e72d7b1",
        "Sources/Slotstream/Weights.swift": "69a422597f7b28628a49c8b4a9d5f77ae670ff387c6b33610927bccf6352139f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "63a1ab81fe1bd5578111dfc0bdf657602ebe4c4202b7dc1ebb818c0f9ef7b226",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "8cbf3ea0a08d9b4f5e1ea76656d3cb9aad728aeae674b5e86556d163ed094a85",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "25feac2e80b922a26a74917b0ce34b42279756abafcfd58f03d307380b69a485",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "035ae48944185597042516f8a92a84dee2354334da64467e84da268ea85da60c",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "c04eef5fdb8c51f98603ab09e4c4f3be8047e2df425118d5016ca779ba2ac246",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "34e74989d1f4fd2fcc9fd8cb9b0f1fc75c0e4e1c214751f44245f2543270ab09",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "224e4bf5210afbddd992894860343add73d1f52b12b2d9a00abf78fdc492ada0",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "083d9e609c0b3ec93feed540e25aaafb722521de9c0491cf2e4d2af66adf3b8b",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "f2c1fcad37dba3c04fe0613f9aa1afd91f53a1837da9d88345f661ebd965a1ae",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "32c10a839423b13a4dceff67a5b2a617f90d145376a70b19bd27f2e62452e288",
        "Sources/SlotstreamDiagnostics/Diagnostics+StateRecovery.swift": "a53db99ff0f97a26e87586e35bf05daa26b9281fe7d686a1670c14984da2dd77",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "7ef27bec8489f52ccdd3ea51c125d21eb94512924b163e854b7aaf25ef39f57a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
        "Sources/SlotstreamTestKit/T0Checks.swift": "07a7f37fa122b47f360c542a9a277f98de20a2ba8855cd0952937ff64152827f",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "141be8cedbcdabc67df5e764cec5d416e89ba4fa24a7b5ce38e4486ca786372c",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "967d92587eb2e10b61e53d61bf84f229d5be2c8a26aca4c879de435b3a9fd1d5",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
        "Sources/slotstream-cli/main.swift": "a4927ad15da17ede7552a8be618cc885b1c2b82a0ccc48f462f0ae1045f1b20d",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "4dcfb91d49c5c68676ca55b348e2703e6c27efcd9620786a5b5f10f86f83e237",
      "binary_sha256": "3593cf96170998a1fb085f9ceae473f32ed6698f677981d0a039ff672c41351d",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "qualified": false,
  "classification": "QSA angle-table and BF16 rotation component only. Fixed synthetic materialized activations, no trained model projections, attention, I/O, serving or energy claim.",
  "protocol": {
    "rows": [
      1,
      256,
      1024
    ],
    "rounds": 5,
    "passes_per_cell": 32,
    "layers_per_pass": 12,
    "arms": [
      "reference",
      "tables",
      "fused",
      "combined"
    ],
    "q_shape": "[1,24,rows,256], transposed from BF16 time-major",
    "k_shape": "[1,2,rows,256], transposed from BF16 time-major",
    "rotary_dim": 64,
    "base": 10000000,
    "first_position": 8192,
    "position_advance_per_pass": "rows",
    "warmup_calls_per_arm": 3,
    "reversed_even_round_order": true,
    "replacement_rounds": 0,
    "required_exact_bytes": true,
    "minimum_complete_clean_pairs": 5,
    "minimum_median_reduction": 0.05,
    "minimum_positive_fraction": 0.8,
    "maximum_sampled_footprint_bytes": 2000000000,
    "exclude_entire_process_if_global_swap_or_workspace_contention": true,
    "primary_metric": "Wall time of all production Rope.table/rotate calls with both outputs evaluated every layer, including array construction, table lookup and rotation. Not GPU event duration.",
    "adoption": "A component benefit only earns separate fixed-total-memory serving qualification."
  },
  "harness_sources": {
    "rope_component.py": "54f8ae9050ade464dfee50fcc8dacdd3363fde2ee77d8b514b4062b1ea71f65c",
    "prefill_bench.py": "2a3e71d78d9bf0f35f0cc281fca89c37f7f6a360be0855030238f857b8f8b955",
    "serve_bench.py": "0f8a052f89f143c83c80c640465de7fa0a6ab92d7f5b3cb67195fc8068fc40a2"
  }
}

````

Artifact `.build/optimization/rope-component-confirmation-v145/rope_component.py` — 5349 bytes, SHA-256 `54f8ae9050ade464dfee50fcc8dacdd3363fde2ee77d8b514b4062b1ea71f65c`.
````text
#!/usr/bin/env python3
"""Frozen exact RoPE component screen; no serving or all-model speed claim."""
import argparse
import json
import os
from pathlib import Path
import shutil
import statistics
from prefill_bench import digest, host_conditions, preflight, run_child, vm_snapshot
from serve_bench import competing_jobs, verified_build


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--binary', type=Path, required=True)
    p.add_argument('--model', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    a = p.parse_args()
    if any(k.startswith('SLOTSTREAM_') for k in os.environ):
        raise ValueError('RoPE screen forbids environment overrides')
    identity = verified_build(a.binary)
    a.out.mkdir(parents=True, exist_ok=False)
    record = {'build': identity, 'qualified': False,
        'classification': 'QSA angle-table and BF16 rotation component only. Fixed synthetic materialized activations, no trained model projections, attention, I/O, serving or energy claim.',
        'protocol': {'rows': [1, 256, 1024], 'rounds': 5, 'passes_per_cell': 32,
            'layers_per_pass': 12, 'arms': ['reference', 'tables', 'fused', 'combined'],
            'q_shape': '[1,24,rows,256], transposed from BF16 time-major',
            'k_shape': '[1,2,rows,256], transposed from BF16 time-major',
            'rotary_dim': 64, 'base': 10000000, 'first_position': 8192,
            'position_advance_per_pass': 'rows', 'warmup_calls_per_arm': 3,
            'reversed_even_round_order': True, 'replacement_rounds': 0,
            'required_exact_bytes': True, 'minimum_complete_clean_pairs': 5,
            'minimum_median_reduction': .05, 'minimum_positive_fraction': .8,
            'maximum_sampled_footprint_bytes': 2000000000,
            'exclude_entire_process_if_global_swap_or_workspace_contention': True,
            'primary_metric': 'Wall time of all production Rope.table/rotate calls with both outputs evaluated every layer, including array construction, table lookup and rotation. Not GPU event duration.',
            'adoption': 'A component benefit only earns separate fixed-total-memory serving qualification.'},
        'harness_sources': {}}
    for name in ['rope_component.py', 'prefill_bench.py', 'serve_bench.py']:
        file = Path(__file__).with_name(name)
        record['harness_sources'][name] = digest(file)
        shutil.copyfile(file, a.out/name)
    (a.out/'protocol.json').write_text(json.dumps(record, indent=2)+'\n')
    try:
        record['competing_jobs_before'] = competing_jobs()
        if record['competing_jobs_before']:
            raise RuntimeError('competing storage/build job; no diagnostic launched')
        record['before'] = preflight(7)
        record['host_before'] = host_conditions()
        command = [identity['binary'], 'optimization-state-check', '--variant', 'rope-performance',
            '--model', str(a.model.resolve()), '--json']
        record['command'] = command
        record['exit_code'] = run_child(command, os.environ.copy(), a.out, 600)
        report = json.loads((a.out/'stdout.txt').read_text())
        record['native_passed'] = report.get('passed') is True and record['exit_code'] == 0
        record['after'] = vm_snapshot()
        record['host_after'] = host_conditions()
        record['competing_jobs_after'] = competing_jobs()
        record['process_swap_clean'] = all(record['before'][k] == record['after'][k] for k in ['swapins', 'swapouts'])
        record['sources_unchanged'] = all(digest(Path(__file__).with_name(n)) == h for n,h in record['harness_sources'].items())
        eligible = record['native_passed'] and record['process_swap_clean'] and record['sources_unchanged'] and not record['competing_jobs_after']
        m = report.get('measurements', {})
        record['outcomes'] = []
        for rows in record['protocol']['rows']:
            for arm in record['protocol']['arms'][1:]:
                pairs = []
                for round in range(1,6):
                    prefix = f'rows_{rows}.round_{round}'
                    reference, candidate = m.get(prefix+'.reference.seconds'), m.get(prefix+f'.{arm}.seconds')
                    if reference is not None and candidate is not None and reference > 0:
                        pairs.append(1-candidate/reference)
                valid = eligible and len(pairs) == 5
                median = statistics.median(pairs) if pairs else None
                positive = sum(x>0 for x in pairs)/len(pairs) if pairs else None
                record['outcomes'].append({'rows': rows, 'arm': arm, 'pairs': pairs,
                    'qualified': valid, 'median_reduction': median, 'positive_fraction': positive,
                    'component_benefit_passed': valid and median >= .05 and positive >= .8})
        record['qualified'] = bool(record['outcomes']) and all(x['qualified'] for x in record['outcomes'])
    except Exception as error:
        record['error'] = f'{type(error).__name__}: {error}'
    (a.out/'manifest.json').write_text(json.dumps(record,indent=2)+'\n')
    print(json.dumps({k:v for k,v in record.items() if k in ['qualified','native_passed','process_swap_clean','error','outcomes']}),flush=True)
    return 0 if record['qualified'] else 1


if __name__ == '__main__': raise SystemExit(main())

````

Artifact `.build/optimization/rope-component-confirmation-v145/serve_bench.py` — 53764 bytes, SHA-256 `0f8a052f89f143c83c80c640465de7fa0a6ab92d7f5b3cb67195fc8068fc40a2`.
````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import base64
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def contention_guard(protocol):
    value = protocol.get('stop_on_workspace_contention', False)
    if type(value) is not bool: raise ValueError('workspace contention guard must be Boolean')
    return value


def competing_job_kind(executable, arguments):
    name = Path(executable).name
    if name == 'slotstream':
        prefix = executable if arguments.startswith(executable) else arguments.split(' ', 1)[0]
        if re.match(re.escape(prefix) + r'\s+pull(?:\s|$)', arguments): return 'checkpoint pull'
    if name in ['download-harness', 'slotstream-pull-bench']:
        return 'checkpoint download test'
    if name.lower().startswith('python') and re.search(
        r'(?:^|[ /])Tools/slotpack/(?:full_pull|publish_r2|pack|checks|download_checks|memory_checks|cli_checks|raw_checks)\.py(?:\s|$)', arguments):
        return 'checkpoint transport or packaging job'
    if name in ['swift-frontend', 'swiftc', 'swift-build']:
        return 'Swift build'
    return None


def competing_jobs(run=subprocess.run):
    """Read known long storage/build jobs. Never persist argv: it may contain
    private URLs or credentials. A snapshot is not continuous host isolation."""
    result = run(['ps', '-axo', 'pid=,comm='], capture_output=True, text=True, check=True, timeout=5)
    candidates = {}
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid, executable = int(fields[0]), fields[1]
        name = Path(executable).name
        if (pid != os.getpid() and (name.lower().startswith('python') or name in
            ['slotstream', 'download-harness', 'slotstream-pull-bench', 'swift-frontend', 'swiftc', 'swift-build'])):
            candidates[pid] = executable
    if not candidates: return []
    result = run(['ps', '-ww', '-p', ','.join(map(str, candidates)), '-o', 'pid=,args='],
                 capture_output=True, text=True, timeout=5)
    # A process can exit between snapshots. Other failures remain fail closed.
    if result.returncode not in (0, 1): raise RuntimeError('cannot inspect competing process arguments')
    jobs = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid = int(fields[0]); executable = candidates.get(pid)
        if executable is None: continue
        kind = competing_job_kind(executable, fields[1])
        if kind is not None: jobs.append({'pid': pid, 'executable': executable, 'kind': kind})
    return jobs


def workspace_quiet_requirement(protocol):
    value = protocol.get('initial_workspace_quiet')
    if value is None: return None
    if (type(value) is not dict or set(value) != {'stable_seconds', 'maximum_wait_seconds'}
        or not contention_guard(protocol)
        or type(value['stable_seconds']) is not int or not 1 <= value['stable_seconds'] <= 600
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 1800):
        raise ValueError('initial quiet interval requires the contention guard and bounded integer durations')
    return value


def wait_for_quiet_workspace(requirement, *, check=competing_jobs, now=time.monotonic, sleep=time.sleep):
    """A sampled quiet precondition before the study, never a timing cell.
    A newly observed known job resets the interval; time alone grants no pass."""
    started = now(); quiet_since = None; samples = blocked = 0; notified = started - 30
    while True:
        jobs = check(); current = now(); samples += 1
        if jobs:
            quiet_since = None; blocked += 1
        elif quiet_since is None:
            quiet_since = current
        quiet = 0 if quiet_since is None else current - quiet_since
        elapsed = current - started
        if quiet >= requirement['stable_seconds']:
            return {'wait_seconds': elapsed, 'quiet_seconds': quiet, 'samples': samples,
                    'samples_with_competing_work': blocked,
                    'classification': 'sampled known-job quiet interval, not continuous host isolation'}
        if elapsed >= requirement['maximum_wait_seconds']:
            raise TimeoutError('known workspace jobs did not leave the required quiet interval; no model launched')
        if current - notified >= 30:
            print(json.dumps({'phase': 'waiting for initial quiet workspace', 'seconds': round(elapsed, 1),
                              'quiet_seconds': round(quiet, 1), 'known_jobs': len(jobs)}), flush=True)
            notified = current
        sleep(min(2, requirement['maximum_wait_seconds'] - elapsed))


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if 'large_pool_measurement' in protocol or 'large_scope_measurement' in protocol:
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
    scope_study = protocol.get('large_scope_measurement')
    if scope_study is not None and 'large_pool_measurement' in protocol:
        raise ValueError('choose one declared large-memory study')
    study = scope_study if scope_study is not None else protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
    if scope_study is not None:
        if memory != 16 or protocol['max_tokens'] > 4:
            raise ValueError('larger-scope qualification requires exactly16GB and at most4outputs')
        for arm in protocol['arms'].values():
            if (arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE','0') not in ['0','1024']
                or arm['env'].get('SLOTSTREAM_OPT_WORKSPACE_TILE','256') != '256'):
                raise ValueError('larger-scope qualification retains256-row compute and at most1024read scope')
        return memory + 6
    for arm in protocol['arms'].values():
        if arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE', '0') != '0' or arm['env'].get('SLOTSTREAM_OPT_LAYER_WORKSPACE', '0') != '0':
            raise ValueError('large-pool isolation requires ordinary bounded 256-row passes')
    return memory + 6


def workload_exclusions(stats, protocol):
    required = protocol.get('require_all_expert_hits', False)
    if type(required) is not bool: raise ValueError('require_all_expert_hits must be Boolean')
    if not required: return []
    if any(type(stats.get(k)) is not int or stats[k] != 0 for k in ['prefillRecords', 'decodeRecords']):
        return ['declared all-hit workload performed expert reads or lacks exact read counts']
    return []


def prefix_study(protocol):
    study = protocol.get('prefix_cache')
    if study is None: return None
    if (type(study) is not dict or 'expected_reused_tokens' not in study
        or not set(study) <= {'expected_reused_tokens', 'complete_prompt', 'retention_only', 'partial_prefix'}
        or type(study.get('complete_prompt', False)) is not bool
        or type(study.get('retention_only', False)) is not bool
        or type(study.get('partial_prefix', False)) is not bool):
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    if study.get('partial_prefix', False):
        if (study.get('retention_only', False) or study.get('complete_prompt', False)
            or expected.get('reference') != 0 or not any(expected.values())
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('partial-prefix study requires distinct frozen warmup and positive strict reuse')
    if study.get('retention_only', False):
        if (any(expected.values()) or study.get('complete_prompt', False)
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('retention-only study requires zero reuse and a separately frozen warmup fixture')
    elif expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def warmup_fixture(protocol, measured_fixture):
    """A distinct input makes unique-request retention cost measurable while
    keeping prefix caching enabled. Existing studies warm the measured input."""
    fields = {'warmup_fixture', 'warmup_fixture_sha256'}
    supplied = fields.intersection(protocol)
    if not supplied: return measured_fixture
    study = protocol.get('prefix_cache') or {}
    if (supplied != fields or not (study.get('retention_only', False) or study.get('partial_prefix', False))
        or protocol['memory_gb'] > 10 or protocol.get('raw', True) is not True):
        raise ValueError('separate warmup requires a bounded raw retention or partial-prefix study')
    if any(type(protocol[k]) is not str or not protocol[k] for k in fields):
        raise ValueError('warmup path and hash must be nonempty strings')
    fixture = Path(protocol['warmup_fixture']).resolve()
    if digest(fixture) != protocol['warmup_fixture_sha256']: raise ValueError('warmup fixture identity mismatch')
    if not 1 <= fixture.stat().st_size <= 32768 or fixture.read_bytes() == measured_fixture.read_bytes():
        raise ValueError('warmup must be bounded, nonempty and distinct from the measured fixture')
    return fixture


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords', 'completePromptHits', 'completePromptStores',
               'encodedImages', 'reusedImageFeatures', 'prefixSkippedImages', 'visionQueryTile', 'visionQueryTileCalls', 'residentExpertPrelaunches', 'residentExpertJoins', 'fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
        reader_pair = {'residentExpertPrelaunches', 'residentExpertJoins'}
        if set(counters) & reader_pair and not reader_pair <= set(counters):
            raise ValueError('resident overlap requires both submission and completed-join counters')
        for bounds in counters.values():
            if type(bounds) is not dict or not bounds or not set(bounds) <= {'min', 'max'}:
                raise ValueError('work bounds require min and/or max')
            if any(type(v) is not int or v < 0 for v in bounds.values()):
                raise ValueError('work bounds must be nonnegative integers')
            if bounds.get('min', 0) > bounds.get('max', float('inf')):
                raise ValueError('work minimum exceeds maximum')
    return constraints


def validate_work_observation(constraints, arm, stats):
    if constraints is None: return
    for counter, bounds in constraints[arm].items():
        value = stats.get(counter)
        if type(value) is not int or value < bounds.get('min', 0) or value > bounds.get('max', float('inf')):
            raise ValueError(f'{arm} work counter {counter} violates its frozen bounds')
    if 'residentExpertPrelaunches' in constraints[arm] and stats['residentExpertPrelaunches'] != stats['residentExpertJoins']:
        raise ValueError(f'{arm} submitted resident work without the same number of completed joins')


def cell_cooldown(protocol):
    value = protocol.get('between_cells_seconds', 0)
    if type(value) not in (int, float) or not math.isfinite(value) or not 0 <= value <= 60:
        raise ValueError('between_cells_seconds must be finite and between zero and 60')
    return value


def reservation_wait_limit(protocol):
    value = protocol.get('model_reservation_wait_seconds',0)
    if type(value) is not int or not 0 <= value <= 1800:
        raise ValueError('model_reservation_wait_seconds must be an integer from zero to1800')
    return value


def reserved_cooldown(seconds, wait_limit, lock_path=None):
    """Keep another model from heating the machine during a declared cooldown.

    Release before ordinary preflight/child launch. The native guard remains
    authoritative if another caller wins that handoff; no guard is bypassed.
    """
    if wait_limit == 0:
        time.sleep(seconds)
        return {'reserved':False,'wait_seconds':0}
    started=time.monotonic(); notified=-30.0
    with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        while True:
            try:
                fcntl.flock(lock,fcntl.LOCK_EX | fcntl.LOCK_NB)
                break
            except BlockingIOError:
                elapsed=time.monotonic()-started
                if elapsed >= wait_limit: raise TimeoutError('other model retained the lock beyond the declared reservation wait')
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for model reservation','seconds':round(elapsed,1)}),flush=True)
                    notified=elapsed
                time.sleep(min(2,wait_limit-elapsed))
        waited=time.monotonic()-started
        time.sleep(seconds)
        return {'reserved':True,'wait_seconds':waited}


def validate_prefix_observation(expected, name, warm, measured, *, complete_prompt=False, retention_only=False, partial_prefix=False):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if retention_only and (want != 0 or warm['prompt_ids'] == measured['prompt_ids']):
        raise ValueError('retention-only request must be unique and reuse zero tokens')
    if partial_prefix:
        if (warm['prompt_ids'] == measured['prompt_ids'] or stats.get('completePromptHits') != 0
            or warm['stats'].get('completePromptHits') != 0):
            raise ValueError('partial-prefix observation must have a different tail and no complete hit')
    full = complete_prompt and want > 0
    if ((len(measured['prompt_ids']) != want if full else len(measured['prompt_ids']) <= want)
        or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]):
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    if warm['stats'].get('prefixCheckpointStores') != int(want > 0 and not full):
        raise ValueError('warmup did not create the declared checkpoint')
    if complete_prompt:
        if (stats.get('completePromptHits') != int(full)
            or warm['stats'].get('completePromptStores') != int(full)
            or warm['stats'].get('completePromptHits') != 0
            or (full and warm['prompt_ids'] != measured['prompt_ids'])):
            raise ValueError('complete prompt identity or retained-logit mechanism differs')
    for sample in [warm['stats'], stats]:
        if sample.get('prefixCheckpointErrors') != 0 or sample.get('prefixCheckpointRefusals') != 0:
            raise ValueError('checkpoint retention failed or exceeded its budget')


def wait_for_headroom(needed_gb, seconds):
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or not 0 <= seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    start = time.monotonic()
    attempts = 0
    while True:
        attempts += 1
        try:
            snapshot = preflight(needed_gb)
            return snapshot, {'seconds': time.monotonic()-start, 'checks': attempts, 'limit_seconds': seconds}
        except InsufficientHeadroom:
            remaining = seconds - (time.monotonic()-start)
            if remaining <= 0: raise
            time.sleep(min(.25, remaining))


def image_fixtures(protocol):
    """Bounded, content-pinned inline images. Never resolve an image URL."""
    if 'images' not in protocol: return []
    images = protocol['images']
    if (type(images) is not list or not 1 <= len(images) <= 4
        or protocol.get('raw', True) is not False or protocol.get('memory_gb', 0) > 10):
        raise ValueError('image study requires one to four images, templates and at most 10 GB')
    result = []; total = 0
    for entry in images:
        if (type(entry) is not dict or set(entry) != {'path', 'sha256'}
            or type(entry['path']) is not str or not entry['path']
            or type(entry['sha256']) is not str):
            raise ValueError('image fixture requires an explicit path and SHA-256')
        path = Path(entry['path']).resolve()
        if not path.is_file() or not 1 <= path.stat().st_size <= 8 << 20:
            raise ValueError('image fixture is missing, empty or exceeds 8 MiB')
        with path.open('rb') as source: data = source.read((8 << 20) + 1)
        total += len(data)
        if not 1 <= len(data) <= 8 << 20 or total > 16 << 20 or hashlib.sha256(data).hexdigest() != entry['sha256']:
            raise ValueError('image identity differs or total exceeds 16 MiB')
        result.append((path, data))
    return result


def request_body(protocol, prompt, *, images=None):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    sampling = protocol.get('sampling', {})
    allowed = {'temperature', 'top_p', 'top_k', 'min_p', 'presence_penalty'}
    if type(sampling) is not dict or not set(sampling) <= allowed:
        raise ValueError('sampling must contain only declared sampler parameters')
    for key, value in sampling.items():
        if key == 'top_k':
            if type(value) is not int or not 0 <= value <= 248320:
                raise ValueError('top_k must be an integer in the pinned vocabulary range')
        elif type(value) not in (int, float) or not math.isfinite(value):
            raise ValueError(f'{key} must be a finite number')
        elif key == 'temperature' and not 0 <= value <= 10:
            raise ValueError('temperature must be between zero and ten')
        elif key == 'top_p' and not 0 < value <= 1:
            raise ValueError('top_p must be positive and at most one')
        elif key == 'min_p' and not 0 <= value <= 1:
            raise ValueError('min_p must be between zero and one')
        elif key == 'presence_penalty' and not -10 <= value <= 10:
            raise ValueError('presence_penalty must be between minus ten and ten')
    body['options'].update(sampling)
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
    if images is None: images = image_fixtures(protocol)
    if images:
        body['images'] = [base64.b64encode(data).decode('ascii') for _, data in images]
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
    if protocol.get('images'):
        preparation = stats.get('imagePreparation') or {}
        observed = preparation.get('sampledFootprint') or {}
        image_peak = observed.get('peakBytes')
        if (type(image_peak) is not int or image_peak <= 0
            or type(observed.get('samples')) is not int or observed['samples'] <= 0):
            reasons.append('image preparation footprint observation missing')
        elif limit is not None and image_peak > limit:
            reasons.append('image preparation exceeds declared byte limit')
        for key in ['seconds', 'sourceDecodeSeconds', 'towerReadySeconds']:
            value = preparation.get(key)
            if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
                reasons.append('image preparation timer missing or invalid')
                break
    return reasons


def exchange(port, body, timeout, *, allow_complete_prompt=False):
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
    validate_metrics(details, allow_complete_prompt=allow_complete_prompt)
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


def sampled_request_peak(stats):
    """Highest sampled process footprint across generation and image preparation.

    These are successive intervals of the same process, so take their maximum,
    never their sum. Missing declared-stage evidence cannot prove a saving.
    """
    observations = [stats.get('sampledFootprint')]
    if 'imagePreparation' in stats:
        preparation = stats['imagePreparation']
        if not isinstance(preparation, dict): return None
        observations.append(preparation.get('sampledFootprint'))
    peaks = [value.get('peakBytes') if isinstance(value, dict) else None for value in observations]
    return max(peaks) if all(type(value) is int and value > 0 for value in peaks) else None


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses'}
    if (type(fields) is not list or any(type(k) is not str or k not in allowed for k in fields)
            or len(fields) != len(set(fields))):
        raise ValueError('required_equal_work must contain unique supported work counters')
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
            if any(type(am['stats'].get(k)) is not int or am['stats'][k] < 0
                   or type(bm['stats'].get(k)) is not int or am['stats'][k] != bm['stats'][k]
                   for k in fields):
                excluded.append(number); continue
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            apeak = sampled_request_peak(am['stats'])
            bpeak = sampled_request_peak(bm['stats'])
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            peak_ok = all(type(v) is int and v > 0 for v in [apeak, bpeak])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
                'active_savings_bytes': aactive-bactive if active_ok else None,
                'sampled_peak_savings_bytes': apeak-bpeak if peak_ok else None,
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
    non_regression = 'maximum_median_client_regression' in contract
    if non_regression and 'minimum_median_client_reduction' in contract:
        raise ValueError('choose one latency acceptance criterion')
    reduction_key = 'maximum_median_client_regression' if non_regression else 'minimum_median_client_reduction'
    reduction = contract[reduction_key]
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [(reduction_key, reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    for key in ['minimum_sequence_reduction', 'minimum_active_savings_share']:
        if key in contract and (type(contract[key]) not in [int, float] or not 0 <= contract[key] <= 1):
            raise ValueError(key + ' must be finite and in [0,1]')
    for key in ['minimum_active_savings_bytes', 'minimum_sampled_peak_savings_bytes']:
        if key in contract and (type(contract[key]) is not int or contract[key] <= 0):
            raise ValueError(key + ' must be a positive integer')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            ('median_client_non_regression' if non_regression else 'median_client_reduction'):
                item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= (-reduction if non_regression else reduction),
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        for criterion, metric in [('minimum_sequence_reduction', 'sequence_reduction_fraction'),
                                  ('minimum_active_savings_share', 'active_savings_share'),
                                  ('minimum_active_savings_bytes', 'active_savings_bytes'),
                                  ('minimum_sampled_peak_savings_bytes', 'sampled_peak_savings_bytes')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def startup_summaries(rows, reference):
    """Fresh-process costs are separate from warmed request acceptance.

    Amortization uses a paired first-job excess divided by a positive paired
    steady-request saving. It is an estimate for repeating this exact job,
    never a claim about a cold filesystem or a different request mix.
    """
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round'] == number}
            a,b = arms.get(reference),arms.get(candidate)
            first_a,first_b = (a or {}).get('first_request'),(b or {}).get('first_request')
            if (not a or not b or not a['valid'] or not b['valid'] or not first_a or not first_b
                or not a.get('startup_and_warmup_valid') or not b.get('startup_and_warmup_valid')):
                excluded.append(number); continue
            fields = ['prompt_ids','output_ids','text','effective_pool_slots','effective_mtp']
            if any(first_a.get(k) != first_b.get(k) or first_a.get(k) is None for k in fields):
                excluded.append(number); continue
            durations = [a.get('startup_seconds'),b.get('startup_seconds'),
                         first_a.get('complete_seconds_from_launch'),first_b.get('complete_seconds_from_launch'),
                         a.get('client_seconds'),b.get('client_seconds')]
            if any(type(x) not in [float,int] or not math.isfinite(x) or x <= 0 for x in durations):
                excluded.append(number); continue
            excess = first_b['complete_seconds_from_launch']-first_a['complete_seconds_from_launch']
            saving = a['client_seconds']-b['client_seconds']
            pairs.append({'round':number,'startup_excess_seconds':b['startup_seconds']-a['startup_seconds'],
                          'first_job_excess_seconds':excess,'steady_request_saving_seconds':saving,
                          'estimated_total_jobs_to_amortize':1+math.ceil(max(0,excess)/saving) if saving > 0 else None})
        result.append({'candidate':candidate,'pairs':pairs,'excluded_rounds':excluded,
                       'median_startup_excess_seconds':statistics.median(p['startup_excess_seconds'] for p in pairs) if pairs else None,
                       'median_first_job_excess_seconds':statistics.median(p['first_job_excess_seconds'] for p in pairs) if pairs else None})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


def validate_declared_binary(protocol, builds):
    expected = protocol.get('frozen_binary_sha256')
    if expected is None: return
    if type(expected) is not str or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise ValueError('frozen_binary_sha256 must be a lowercase SHA-256 digest')
    if not builds or any(b['identity']['binary_sha256'] != expected for b in builds.values()):
        raise ValueError('an arm does not match the prospectively frozen binary SHA-256')


def validate_arms(arms):
    if type(arms) is not dict or not arms or 'reference' not in arms:
        raise ValueError('arms must include a reference')
    for name, arm in arms.items():
        if type(name) is not str or not name.replace('_', '').replace('-', '').isalnum():
            raise ValueError('unsafe arm name')
        if type(arm) is not dict or not {'chunk', 'env'} <= set(arm) or set(arm) - {'chunk', 'env', 'binary'}:
            raise ValueError('each arm requires chunk and env, with only an optional binary')
        if type(arm['chunk']) is not int or arm['chunk'] not in [256, 512, 1024, 2048, 4096]:
            raise ValueError('arm chunk must be a supported prefill size')
        if type(arm['env']) is not dict or any(type(k) is not str or not k.startswith('SLOTSTREAM_')
                or type(v) is not str for k, v in arm['env'].items()):
            raise ValueError('arm env requires explicit string SLOTSTREAM_ controls')
        if 'SLOTSTREAM_PREFILL_CHUNK' in arm['env'] and arm['env']['SLOTSTREAM_PREFILL_CHUNK'] != str(arm['chunk']):
            raise ValueError('arm chunk conflicts with its environment')
        if 'binary' in arm and (type(arm['binary']) is not str or not arm['binary']):
            raise ValueError('arm binary must be a nonempty path string')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    expected_prefix = prefix_study(protocol)
    complete_prompt = (protocol.get('prefix_cache') or {}).get('complete_prompt', False)
    retention_only = (protocol.get('prefix_cache') or {}).get('retention_only', False)
    partial_prefix = (protocol.get('prefix_cache') or {}).get('partial_prefix', False)
    expected_work = work_constraints(protocol)
    stop_on_contention = contention_guard(protocol)
    initial_quiet = workspace_quiet_requirement(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    required_equal_work = protocol.get('required_equal_work')
    summaries([], 'reference', comparison_basis, required_equal_work)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    settle_seconds = protocol.get('memory_settle_seconds', 0)
    if type(settle_seconds) not in (int, float) or not math.isfinite(settle_seconds) or not 0 <= settle_seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity = verified_build(binary)['identity']
    arm_builds = {name: verified_build(arm.get('binary', binary)) for name, arm in arms.items()}
    validate_declared_binary(protocol, arm_builds)
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    warm_fixture = warmup_fixture(protocol, fixture)
    images = image_fixtures(protocol)
    if protocol['memory_gb'] > 10:
        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources, 'arm_builds': arm_builds},indent=2)+'\n')
    for i, (image_path, data) in enumerate(images):
        (a.out / f'image-{i}{image_path.suffix}').write_bytes(data)
    body=request_body(protocol, fixture.read_text(), images=images)
    warm_body = request_body(protocol, warm_fixture.read_text(), images=images)
    (a.out/'request.json').write_bytes(body)
    if warm_fixture != fixture:
        shutil.copyfile(warm_fixture, a.out/'warmup-fixture.txt')
        (a.out/'warmup-request.json').write_bytes(warm_body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    if initial_quiet is not None:
        quiet_record = {'requirement': initial_quiet, 'passed': False}
        try:
            quiet_record.update(wait_for_quiet_workspace(initial_quiet), passed=True)
        except (Exception, KeyboardInterrupt) as error:
            quiet_record['error'] = f'{type(error).__name__}: {error}'
        (a.out/'initial-workspace-quiet.json').write_text(json.dumps(quiet_record, indent=2)+'\n')
        if not quiet_record['passed']:
            (a.out/'completion.json').write_text(json.dumps({'stopped_early': True,
                'planned_cells': protocol['rounds'] * len(arms), 'recorded_cells': 0,
                'error': quiet_record['error'], 'acceptance': []}, indent=2)+'\n')
            print(json.dumps(quiet_record), flush=True)
            return 1
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
                if stop_on_contention:
                    row['competing_jobs_before_cooldown'] = competing_jobs()
                    if row['competing_jobs_before_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job; stopped before cooldown or model launch')
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                if stop_on_contention:
                    row['competing_jobs_after_cooldown'] = competing_jobs()
                    if row['competing_jobs_after_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job appeared during cooldown; model not launched')
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model),'--memory-gb',str(protocol['memory_gb']),
                         '--mtp',protocol.get('mtp','off'),'--no-elastic']
                if expected_prefix is None: command.append('--no-prefix-cache')
                if protocol.get('large_scope_measurement') is not None:
                    # Bound active context independently of any evolving default
                    # while allowing the declared approximately4k-token fixture.
                    command.extend(['--max-context','8192'])
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    launched_at=time.monotonic()
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    row['startup_seconds']=time.monotonic()-launched_at
                    row['after_startup_vm']=vm_snapshot()
                    warm,wire=exchange(port,warm_body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if stop_on_contention:
                        row['competing_jobs_after_warmup'] = competing_jobs()
                        if row['competing_jobs_after_warmup']:
                            stop_requested = True
                            raise RuntimeError('competing storage/build job appeared during warmup; measurement not started')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600),
                        allow_complete_prompt=complete_prompt and expected_prefix[name] > 0)
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    if stop_on_contention:
                        row['competing_jobs_after_measurement'] = competing_jobs()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m,
                        complete_prompt=complete_prompt, retention_only=retention_only, partial_prefix=partial_prefix)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
                    if stop_on_contention and row.get('competing_jobs_after_measurement'):
                        exclusions.append('known competing storage/build job observed after measurement')
                        stop_requested = True
                    if exclusions and abort_on_resource_failure: stop_requested = True
                    exclusions += workload_exclusions(s, protocol)
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
            progress = {k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}
            if 'metrics' in row:
                stats = row['metrics']['stats']
                progress['decode_records'] = stats.get('decodeRecords')
                if 'decodeLocalVictims' in stats: progress['local_victims'] = stats['decodeLocalVictims']
                if protocol.get('acceptance', {}).get('minimum_sequence_reduction') is not None:
                    progress['sequence_bytes'] = stats.get('allocatedSequenceBytes')
                    progress['mlx_active_bytes'] = stats.get('mlxActiveEndBytes')
            print(json.dumps(progress),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis,required_equal_work)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (a.out/'startup-summary.json').write_text(json.dumps(startup_summaries(rows,next(iter(arms))),indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

````

Artifact `.build/optimization/rope-component-confirmation-v145/stderr.txt` — 0 bytes, SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.
````text

````

Artifact `.build/optimization/rope-component-confirmation-v145/stdout.txt` — 34126 bytes, SHA-256 `0149e935e656b32d9536477d8c3c78ffa20147daab809721f5014230aced8554`.
````text
{
  "items" : [
    {
      "name" : "exact fused kernel initialized",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.reference: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.reference: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.reference: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.reference: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.reference: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.reference: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.reference: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.tables: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.tables: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.tables: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.tables: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.tables: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.tables: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.tables: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.fused: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.fused: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.fused: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.fused: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.fused: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.fused: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.fused: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.combined: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.combined: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.combined: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.combined: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.combined: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.combined: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_1.combined: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.combined: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.combined: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.combined: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.combined: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.combined: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.combined: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.combined: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.fused: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.fused: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.fused: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.fused: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.fused: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.fused: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.fused: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.tables: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.tables: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.tables: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.tables: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.tables: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.tables: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.tables: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.reference: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.reference: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.reference: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.reference: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.reference: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.reference: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_2.reference: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.reference: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.reference: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.reference: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.reference: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.reference: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.reference: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.reference: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.tables: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.tables: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.tables: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.tables: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.tables: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.tables: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.tables: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.fused: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.fused: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.fused: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.fused: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.fused: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.fused: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.fused: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.combined: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.combined: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.combined: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.combined: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.combined: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.combined: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_3.combined: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.combined: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.combined: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.combined: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.combined: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.combined: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.combined: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.combined: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.fused: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.fused: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.fused: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.fused: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.fused: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.fused: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.fused: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.tables: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.tables: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.tables: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.tables: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.tables: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.tables: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.tables: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.reference: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.reference: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.reference: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.reference: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.reference: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.reference: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_4.reference: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.reference: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.reference: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.reference: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.reference: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.reference: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.reference: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.reference: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.tables: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.tables: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.tables: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.tables: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.tables: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.tables: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.tables: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.fused: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.fused: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.fused: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.fused: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.fused: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.fused: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.fused: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.combined: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.combined: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.combined: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.combined: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.combined: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.combined: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_1.round_5.combined: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.reference: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.reference: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.reference: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.reference: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.reference: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.reference: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.reference: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.tables: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.tables: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.tables: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.tables: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.tables: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.tables: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.tables: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.fused: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.fused: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.fused: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.fused: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.fused: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.fused: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.fused: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.combined: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.combined: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.combined: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.combined: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.combined: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.combined: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_1.combined: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.combined: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.combined: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.combined: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.combined: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.combined: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.combined: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.combined: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.fused: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.fused: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.fused: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.fused: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.fused: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.fused: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.fused: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.tables: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.tables: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.tables: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.tables: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.tables: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.tables: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.tables: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.reference: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.reference: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.reference: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.reference: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.reference: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.reference: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_2.reference: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.reference: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.reference: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.reference: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.reference: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.reference: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.reference: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.reference: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.tables: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.tables: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.tables: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.tables: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.tables: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.tables: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.tables: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.fused: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.fused: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.fused: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.fused: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.fused: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.fused: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.fused: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.combined: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.combined: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.combined: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.combined: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.combined: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.combined: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_3.combined: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.combined: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.combined: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.combined: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.combined: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.combined: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.combined: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.combined: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.fused: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.fused: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.fused: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.fused: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.fused: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.fused: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.fused: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.tables: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.tables: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.tables: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.tables: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.tables: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.tables: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.tables: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.reference: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.reference: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.reference: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.reference: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.reference: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.reference: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_4.reference: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.reference: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.reference: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.reference: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.reference: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.reference: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.reference: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.reference: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.tables: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.tables: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.tables: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.tables: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.tables: zero interval swap",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.tables: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.tables: sampled footprint below two GB",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.fused: exact query and key bytes",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.fused: actual table builds",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.fused: actual table hits",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.fused: actual rotation scheduling",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.fused: zero interval swap",
      "passed" : false
    },
    {
      "name" : "rows_256.round_5.fused: nominal operating state",
      "passed" : true
    },
    {
      "name" : "rows_256.round_5.fused: sampled footprint below two GB",
      "passed" : true
    }
  ],
  "measurements" : {
    "layers_per_pass" : 12,
    "passes_per_cell" : 32,
    "rows_1.round_1.combined.sampled_peak_bytes" : 74498792,
    "rows_1.round_1.combined.samples" : 33,
    "rows_1.round_1.combined.seconds" : 0.063198333,
    "rows_1.round_1.fused.sampled_peak_bytes" : 74498792,
    "rows_1.round_1.fused.samples" : 35,
    "rows_1.round_1.fused.seconds" : 0.066912875,
    "rows_1.round_1.reference.sampled_peak_bytes" : 74269416,
    "rows_1.round_1.reference.samples" : 48,
    "rows_1.round_1.reference.seconds" : 0.092952166,
    "rows_1.round_1.tables.sampled_peak_bytes" : 74285800,
    "rows_1.round_1.tables.samples" : 39,
    "rows_1.round_1.tables.seconds" : 0.074933042,
    "rows_1.round_2.combined.sampled_peak_bytes" : 74531560,
    "rows_1.round_2.combined.samples" : 32,
    "rows_1.round_2.combined.seconds" : 0.062119916,
    "rows_1.round_2.fused.sampled_peak_bytes" : 74531560,
    "rows_1.round_2.fused.samples" : 35,
    "rows_1.round_2.fused.seconds" : 0.066828667,
    "rows_1.round_2.reference.sampled_peak_bytes" : 74531560,
    "rows_1.round_2.reference.samples" : 39,
    "rows_1.round_2.reference.seconds" : 0.076195542,
    "rows_1.round_2.tables.sampled_peak_bytes" : 74531560,
    "rows_1.round_2.tables.samples" : 37,
    "rows_1.round_2.tables.seconds" : 0.07074375,
    "rows_1.round_3.combined.sampled_peak_bytes" : 74547944,
    "rows_1.round_3.combined.samples" : 32,
    "rows_1.round_3.combined.seconds" : 0.062415916,
    "rows_1.round_3.fused.sampled_peak_bytes" : 74547944,
    "rows_1.round_3.fused.samples" : 34,
    "rows_1.round_3.fused.seconds" : 0.066616542,
    "rows_1.round_3.reference.sampled_peak_bytes" : 74547944,
    "rows_1.round_3.reference.samples" : 40,
    "rows_1.round_3.reference.seconds" : 0.076885917,
    "rows_1.round_3.tables.sampled_peak_bytes" : 74547944,
    "rows_1.round_3.tables.samples" : 36,
    "rows_1.round_3.tables.seconds" : 0.070281959,
    "rows_1.round_4.combined.sampled_peak_bytes" : 74547944,
    "rows_1.round_4.combined.samples" : 32,
    "rows_1.round_4.combined.seconds" : 0.061795125,
    "rows_1.round_4.fused.sampled_peak_bytes" : 74547944,
    "rows_1.round_4.fused.samples" : 35,
    "rows_1.round_4.fused.seconds" : 0.066721708,
    "rows_1.round_4.reference.sampled_peak_bytes" : 74580712,
    "rows_1.round_4.reference.samples" : 39,
    "rows_1.round_4.reference.seconds" : 0.076426375,
    "rows_1.round_4.tables.sampled_peak_bytes" : 74580712,
    "rows_1.round_4.tables.samples" : 37,
    "rows_1.round_4.tables.seconds" : 0.071895125,
    "rows_1.round_5.combined.sampled_peak_bytes" : 74580712,
    "rows_1.round_5.combined.samples" : 32,
    "rows_1.round_5.combined.seconds" : 0.061481667,
    "rows_1.round_5.fused.sampled_peak_bytes" : 74580712,
    "rows_1.round_5.fused.samples" : 35,
    "rows_1.round_5.fused.seconds" : 0.066748625,
    "rows_1.round_5.reference.sampled_peak_bytes" : 74580712,
    "rows_1.round_5.reference.samples" : 40,
    "rows_1.round_5.reference.seconds" : 0.076886625,
    "rows_1.round_5.tables.sampled_peak_bytes" : 74580712,
    "rows_1.round_5.tables.samples" : 37,
    "rows_1.round_5.tables.seconds" : 0.071863333,
    "rows_256.round_1.combined.sampled_peak_bytes" : 131777280,
    "rows_256.round_1.combined.samples" : 49,
    "rows_256.round_1.combined.seconds" : 0.0952975,
    "rows_256.round_1.fused.sampled_peak_bytes" : 131760896,
    "rows_256.round_1.fused.samples" : 51,
    "rows_256.round_1.fused.seconds" : 0.099812792,
    "rows_256.round_1.reference.sampled_peak_bytes" : 125158144,
    "rows_256.round_1.reference.samples" : 52,
    "rows_256.round_1.reference.seconds" : 0.101527542,
    "rows_256.round_1.tables.sampled_peak_bytes" : 131711744,
    "rows_256.round_1.tables.samples" : 43,
    "rows_256.round_1.tables.seconds" : 0.084171,
    "rows_256.round_2.combined.sampled_peak_bytes" : 131793664,
    "rows_256.round_2.combined.samples" : 51,
    "rows_256.round_2.combined.seconds" : 0.099312792,
    "rows_256.round_2.fused.sampled_peak_bytes" : 131777280,
    "rows_256.round_2.fused.samples" : 51,
    "rows_256.round_2.fused.seconds" : 0.100607584,
    "rows_256.round_2.reference.sampled_peak_bytes" : 131859200,
    "rows_256.round_2.reference.samples" : 51,
    "rows_256.round_2.reference.seconds" : 0.099879,
    "rows_256.round_2.tables.sampled_peak_bytes" : 131859200,
    "rows_256.round_2.tables.samples" : 50,
    "rows_256.round_2.tables.seconds" : 0.097908625,
    "rows_256.round_3.combined.sampled_peak_bytes" : 131859200,
    "rows_256.round_3.combined.samples" : 51,
    "rows_256.round_3.combined.seconds" : 0.099392,
    "rows_256.round_3.fused.sampled_peak_bytes" : 131859200,
    "rows_256.round_3.fused.samples" : 51,
    "rows_256.round_3.fused.seconds" : 0.100491625,
    "rows_256.round_3.reference.sampled_peak_bytes" : 131859200,
    "rows_256.round_3.reference.samples" : 51,
    "rows_256.round_3.reference.seconds" : 0.0999045,
    "rows_256.round_3.tables.sampled_peak_bytes" : 131859200,
    "rows_256.round_3.tables.samples" : 50,
    "rows_256.round_3.tables.seconds" : 0.098105541,
    "rows_256.round_4.combined.sampled_peak_bytes" : 131859200,
    "rows_256.round_4.combined.samples" : 51,
    "rows_256.round_4.combined.seconds" : 0.098596333,
    "rows_256.round_4.fused.sampled_peak_bytes" : 131859200,
    "rows_256.round_4.fused.samples" : 52,
    "rows_256.round_4.fused.seconds" : 0.10069475,
    "rows_256.round_4.reference.sampled_peak_bytes" : 131891968,
    "rows_256.round_4.reference.samples" : 51,
    "rows_256.round_4.reference.seconds" : 0.099911375,
    "rows_256.round_4.tables.sampled_peak_bytes" : 131891968,
    "rows_256.round_4.tables.samples" : 49,
    "rows_256.round_4.tables.seconds" : 0.096254292,
    "rows_256.round_5.fused.sampled_peak_bytes" : 131891968,
    "rows_256.round_5.fused.samples" : 52,
    "rows_256.round_5.fused.seconds" : 0.100995167,
    "rows_256.round_5.reference.sampled_peak_bytes" : 131891968,
    "rows_256.round_5.reference.samples" : 51,
    "rows_256.round_5.reference.seconds" : 0.099949625,
    "rows_256.round_5.tables.sampled_peak_bytes" : 131891968,
    "rows_256.round_5.tables.samples" : 51,
    "rows_256.round_5.tables.seconds" : 0.099209708
  },
  "name" : "optimization-rope-performance",
  "passed" : false
}

````
