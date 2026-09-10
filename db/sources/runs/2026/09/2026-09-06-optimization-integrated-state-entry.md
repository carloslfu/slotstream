---
type: run
id: 01m1t8vvrqye292j1ch7z8ca17
created: 2026-09-06T02:30:53.974858+00:00
updated: 2026-09-06T02:31:19.555747+00:00
summary: Combined ordinary state-entry regression V104
binary: c6d5f2bcd1f0f3492dc9e5d74f6a75e733a69ffc7ad6e47c22440b21c16ebd9a
captured_at: 2026-09-06
command: optimization-state-check --variant integrated --json
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Combined ordinary state-entry regression V104
tool: Tools/optimization_check.py
---
# V104 combined ordinary state-entry validation

The frozen V104 binary passes167ordinary integration assertions, including16new atomic rejection assertions for negative,inconsistent,overflow-sized and uninitialized public state. Existing full-state/continued-logit,17/255/256/257/1025-token,image-boundary,sampling,prefix/interleaving,cancellation and exact-output checks remain passing. Its process waited1147.0423seconds for another task's model; total driver time1378.5396seconds. These are diagnostic durations, not speed evidence.

The native-source archive limitation is preserved in [[sources/runs/2026/09/2026-09-06-optimization-native-source-closure]]. V104 is bounded diagnostic feedback only and does not qualify the final source closure,combined performance or default activation. A successor build with the corrected archiver and isolated compute/CPU-slot components is queued. MTP and final rebuilt integration checks remain pending. No dependency source,model weight,earlier receipt or unrelated task was changed.

## manifest.json

SHA256 `a764b67a28bc4694e5df937973032a6615bfeb1bf5fda8eeb0be23737fe9d661`; 20175 bytes.

````text
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/integrated-state-build-v104/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
      "Sources/Slotstream/DownloadHTTP.swift": "c8fa9062e3d34da68f050d2621b1e77a720cf3761156ec08b2e7d990b8c140ed",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "3d74c6dad941df731c7b8f1073623429242458767c29736a5fcb0f06de614057",
      "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertStore.swift": "8c8f1a5d0663cec3f6b547d05b65d23e38654841502117e42e3e89632a7c1190",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "672dba700ea763457136842ed31b9ade193b96ca001dc4b0723ed5b1d850a44b",
      "Sources/Slotstream/Governor.swift": "1051b77bc36d44645081687dcc3fadb7e0f7427e77dac1706f785fe6e6e8a9eb",
      "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
      "Sources/Slotstream/Layers.swift": "8d921313527a80924504caedb58dfc437d01e1d04c77245386b227ab88ef4798",
      "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
      "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "de1a2269724436d94c1c7f35769cd1beb6e6d63af9cb8c87438d7a03fbffdb76",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "Sources/Slotstream/Optimizations.swift": "79607924bdf14ee3fbb14bced6a8b884f92a8b45b9089211c25d286f89eaa585",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "4bd53ef9e3bd48687e95fc3e330c563dc0281bc1d754ca74f070dec952efe585",
      "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
      "Sources/Slotstream/PrefixCache.swift": "9bb9ad731a24e3fb84e15c92401d97f6677859553bfd15d23d541ae9be87bc01",
      "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "0746b27981132931d9773f5f43c2287a61772522a5272c9900139d2e1f185442",
      "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
      "Sources/Slotstream/SlotpackDownload.swift": "2af7c8e5b78fa4c80def59fc68de050a9bd40bf0904725982d10d377ef6f4216",
      "Sources/Slotstream/SlotpackManifest.swift": "1ed9df8e2d067bcbea985e78c80de57dfb51cf0718a8b32f11082ca9d66860b4",
      "Sources/Slotstream/StatePrefixFork.swift": "b21e2da892dfe6024de879c42c4ffe89dc19ad1b22a1b8fcbebeba17324e2fba",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
      "Sources/Slotstream/WeightDownload.swift": "750f1e5a97ca48388789f6afd022f6d0c0e63eaef892e36d02398e279177f56b",
      "Sources/Slotstream/WeightStore.swift": "d6ecca1fc1912c9a60e610b2583f3e866365374ba1fa1315b1e31b152abc08da",
      "Sources/Slotstream/Weights.swift": "69a422597f7b28628a49c8b4a9d5f77ae670ff387c6b33610927bccf6352139f",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "943a3d79b8e0b4a2ac086faf57a6ef1a850fffe957172312361e9405c2ede2de",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "34e74989d1f4fd2fcc9fd8cb9b0f1fc75c0e4e1c214751f44245f2543270ab09",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "083d9e609c0b3ec93feed540e25aaafb722521de9c0491cf2e4d2af66adf3b8b",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "3c9597f3661113dc10f274f3d59bca199dfbaa0d262741e31eb079dd225568c1",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
      "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "1870c2069784145041061d98df97e204df719cc0e81fa01ef4e8265b32577b95",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
      "Sources/SlotstreamTestKit/T0Checks.swift": "bfd462ebd02ea4258037ec568e6ba16362a8cd3970e4a3f9555b78d909093fc0",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "141be8cedbcdabc67df5e764cec5d416e89ba4fa24a7b5ce38e4486ca786372c",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "fc927c737782ca584f677c3abd38fee96e58e0d6c2df47dde08de5f500988f47",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
      "Sources/slotstream-cli/main.swift": "4bb7f13a6b31d4e348db3b4dff93707a52be7606302a120b94b3a4ebb933f462",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "bb2f71109a69c74dd45ae6bb788336bc3f93d213d01a07fd789dd27b314487c5",
    "binary_sha256": "c6d5f2bcd1f0f3492dc9e5d74f6a75e733a69ffc7ad6e47c22440b21c16ebd9a",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 16.0,
  "timeout_seconds": 900,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/integrated-state-build-v104/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 37601837056,
    "swapins": 42605528,
    "swapouts": 74262899,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   535588.\nPages active:                                1116911.\nPages inactive:                               825852.\nPages speculative:                            289220.\nPages throttled:                                   0.\nPages wired down:                             227903.\nPages purgeable:                                  28.\n\"Translation faults\":                    14379308036.\nPages copy-on-write:                       660630014.\nPages zero filled:                       17938077535.\nPages reactivated:                        3110219698.\nPages purged:                               66679307.\nFile-backed pages:                           1759418.\nAnonymous pages:                              472565.\nPages stored in compressor:                  1658818.\nPages occupied by compressor:                  81311.\nDecompressions:                           1113867465.\nCompressions:                             1419100279.\nPageins:                                  6800167484.\nPageouts:                                   10893437.\nSwapins:                                    42605528.\nSwapouts:                                   74262899.\nPages tagged:                                 151712.\nPages tagged resident:                        122250.\nPages tagged compressed:                       29462.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         8789.\nPages tag-storage non-tag pageable:            82708.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5193088.\nTagged compressions:                        10430566.\nTagged decompressions:                       9628486.\n"
  },
  "preflight_wait": {
    "seconds": 1147.042311292,
    "attempts": 573,
    "limit_seconds": 1800
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 167,
  "duration_seconds": 1378.5395826249999,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 37195022336,
    "swapins": 42621399,
    "swapouts": 74262899,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   439390.\nPages active:                                1172716.\nPages inactive:                               978816.\nPages speculative:                            192146.\nPages throttled:                                   0.\nPages wired down:                             227418.\nPages purgeable:                                1815.\n\"Translation faults\":                    14381061108.\nPages copy-on-write:                       660749094.\nPages zero filled:                       17978427720.\nPages reactivated:                        3111480320.\nPages purged:                               66698181.\nFile-backed pages:                           1828999.\nAnonymous pages:                              514679.\nPages stored in compressor:                  1610889.\nPages occupied by compressor:                  67305.\nDecompressions:                           1113906376.\nCompressions:                             1419100279.\nPageins:                                  6801457417.\nPageouts:                                   10893928.\nSwapins:                                    42621399.\nSwapouts:                                   74262899.\nPages tagged:                                 151755.\nPages tagged resident:                        122508.\nPages tagged compressed:                       29247.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         7747.\nPages tag-storage non-tag pageable:            83750.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5159616.\nTagged compressions:                        10430566.\nTagged decompressions:                       9628699.\n"
  }
}

````

## stderr.txt

SHA256 `ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6`; 486 bytes.

````text
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

````

## stdout.txt

SHA256 `845032b60e692383ebeee57553e71dc4383c25c43694c683f0f17206dda3a346`; 16950 bytes.

````text
{
  "items" : [
    {
      "name" : "false: embedding selection",
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
      "name" : "false\/cached17: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/cached17: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/cached17: full completion succeeds",
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
      "name" : "false\/boundary255: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: full completion succeeds",
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
      "name" : "false\/boundary256: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: full completion succeeds",
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
      "name" : "false\/boundary257: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: full completion succeeds",
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
      "name" : "false\/long1025: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/long1025: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/long1025: full completion succeeds",
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
      "name" : "false\/image-before: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/image-before: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/image-before: full completion succeeds",
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
      "name" : "false\/image-crossing: cancellation commits complete prefill",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: exact committed offset",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: full completion succeeds",
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
      "name" : "false\/sample\/false\/7: sampled output completes",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7: seeded replay exact",
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
      "name" : "false\/sample\/true\/7: sampled output completes",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7: seeded replay exact",
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
      "name" : "false\/same: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false: deliberate checkpoint is exercised",
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
      "name" : "false\/auxiliary: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false\/auxiliary: no invalid checkpoint published",
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
      "name" : "false\/same-after-auxiliary: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false\/same-after-auxiliary: no invalid checkpoint published",
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
      "name" : "false: retry after cancellation is exact",
      "passed" : true
    },
    {
      "name" : "false: prefix capacity stays bounded",
      "passed" : true
    },
    {
      "name" : "true: embedding selection",
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
      "name" : "true\/cached17: full completion succeeds",
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
      "name" : "true\/boundary255: full completion succeeds",
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
      "name" : "true\/boundary256: full completion succeeds",
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
      "name" : "true\/boundary257: full completion succeeds",
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
      "name" : "true\/long1025: full completion succeeds",
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
      "name" : "true\/image-before: full completion succeeds",
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
      "name" : "true\/image-crossing: full completion succeeds",
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
      "name" : "true\/same: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true: deliberate checkpoint is exercised",
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
      "name" : "true: retry after cancellation is exact",
      "passed" : true
    },
    {
      "name" : "true: prefix capacity stays bounded",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-integrated",
  "passed" : true
}

````
