---
type: run
id: 01m1szs6fsaz03fgcy02bbantr
created: 2026-09-05T23:52:09.465289+00:00
updated: 2026-09-05T23:52:26.619975+00:00
summary: Hermes adapter regressions and vision discovery counterexample
binary: 666b59f8 and 39d236e8; full source and binary identities in body
captured_at: 2026-09-05
command: Exact commands and configuration in body
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Hermes adapter regressions and vision discovery counterexample
tool: API, OpenAI, vision, gateway, native catalogue, Ollama CLI and Hermes metadata checks
---
# Hermes adapter regression evidence before the vision-discovery correction

This source preserves the acceptance output for the memory-reserved build and the subsequent tool-result ordering build. It also preserves the actual Hermes vision-discovery counterexample. No installed binary was replaced. One model process ran at a time. These are functional checks, not throughput comparisons.

Commands: existing `Tools/api_robustness.sh` with `SLOTSTREAM_TEST_BINARY` pointing at the reserved-context candidate, `MEMORY=8.1`, `EPL=13`, `MTP=off`, port 11466; `Tools/vision_serving.py` against tool-order candidate serving `--memory-gb 10 --mtp off --vision on --port 11468` with ordinary context; `Tools/openai_tools_gate.py --port 11468 --vision --output ...`; actual Ollama CLI and native two-turn gateway probe against that same server. The API harness uses its configured expert count precedence. The server enabled `SLOTSTREAM_BENCH_DETAILS=1`.

## reserved-context-candidate identity

```json
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
    "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
    "Sources/Slotstream/Engine.swift": "c3e5f8cb8e436ec796eed3e7d3455d2335630d190c9a368f20b2476000e9eba8",
    "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertStore.swift": "8c8f1a5d0663cec3f6b547d05b65d23e38654841502117e42e3e89632a7c1190",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "49a2752db501362aa7467a4352c0308bc714da2071976d6b678abe831454ba7c",
    "Sources/Slotstream/Governor.swift": "1051b77bc36d44645081687dcc3fadb7e0f7427e77dac1706f785fe6e6e8a9eb",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "8d921313527a80924504caedb58dfc437d01e1d04c77245386b227ab88ef4798",
    "Sources/Slotstream/MTP.swift": "82ad69cd4d384f6c6cd5dc56533e322a4855a739ab17d3311597cc0e6f6a74df",
    "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "92beba95294f167c919f5599410a423e16cf3ddc3a6e1cb5d83cab9cee0c0e5a",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "9f638b8d1135b98baeded4a9454238555dc9f17b593f38ba72f6c9b0d24b3f2c",
    "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
    "Sources/Slotstream/Optimizations.swift": "1580af3cd7a6c728b6dfac524acac25742e0939deccaccaa82173aa5a19bd0ae",
    "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
    "Sources/Slotstream/PrefixCache.swift": "b4ee52baa78aa9f190ee338b591318940032de9a4a4d29a0bd7f03abadb8af8d",
    "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "dbbfba06944dddeed75097adc0017b357c7e8cde80a40e215bbb3b8b3d1c1984",
    "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
    "Sources/Slotstream/StatePrefixFork.swift": "3e7cdead33d4501b6c949b62f032ac96d1854ce39fc56384f0ca4f7941b33bb1",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
    "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
    "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "c83bb36320767ed17d813af12105f24f5632b4370cf5cab627feef1e4d1f0bbd",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "67acc8c57a94801c1ac2166ced44f11690cf893f3409ee853b2dd679c0382a00",
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
    "Sources/SlotstreamTestKit/OpenAIChecks.swift": "ff04fba0085c19af1ffadb85f01eef5a98d3ab94875346e8554859617e08fd4f",
    "Sources/SlotstreamTestKit/T0Checks.swift": "bfd462ebd02ea4258037ec568e6ba16362a8cd3970e4a3f9555b78d909093fc0",
    "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
    "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
    "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
    "Sources/slotstream-cli/ContextCommands.swift": "141be8cedbcdabc67df5e764cec5d416e89ba4fa24a7b5ce38e4486ca786372c",
    "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
    "Sources/slotstream-cli/OptimizationCommands.swift": "fcc67eebd76ea49e3cbef625c1ec80b2534a8ae22f2e1b22e25e5015a549f192",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
    "Sources/slotstream-cli/main.swift": "4bb7f13a6b31d4e348db3b4dff93707a52be7606302a120b94b3a4ebb933f462",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "734e79e8a0c42b7a880b859ce0a890c67f10619442df6d55c1b9b883591ce6fa",
  "binary_sha256": "666b59f8f1d83c4b71712696e7acc93aa1485e78588bfea3e46024fec17ed7a6",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}
```

## tool-order-candidate identity

```json
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
    "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
    "Sources/Slotstream/Engine.swift": "c3e5f8cb8e436ec796eed3e7d3455d2335630d190c9a368f20b2476000e9eba8",
    "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertStore.swift": "8c8f1a5d0663cec3f6b547d05b65d23e38654841502117e42e3e89632a7c1190",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "49a2752db501362aa7467a4352c0308bc714da2071976d6b678abe831454ba7c",
    "Sources/Slotstream/Governor.swift": "1051b77bc36d44645081687dcc3fadb7e0f7427e77dac1706f785fe6e6e8a9eb",
    "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
    "Sources/Slotstream/Layers.swift": "8d921313527a80924504caedb58dfc437d01e1d04c77245386b227ab88ef4798",
    "Sources/Slotstream/MTP.swift": "82ad69cd4d384f6c6cd5dc56533e322a4855a739ab17d3311597cc0e6f6a74df",
    "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
    "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
    "Sources/Slotstream/Model.swift": "92beba95294f167c919f5599410a423e16cf3ddc3a6e1cb5d83cab9cee0c0e5a",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
    "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
    "Sources/Slotstream/Optimizations.swift": "1580af3cd7a6c728b6dfac524acac25742e0939deccaccaa82173aa5a19bd0ae",
    "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
    "Sources/Slotstream/PrefixCache.swift": "b4ee52baa78aa9f190ee338b591318940032de9a4a4d29a0bd7f03abadb8af8d",
    "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "dbbfba06944dddeed75097adc0017b357c7e8cde80a40e215bbb3b8b3d1c1984",
    "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
    "Sources/Slotstream/StatePrefixFork.swift": "3e7cdead33d4501b6c949b62f032ac96d1854ce39fc56384f0ca4f7941b33bb1",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
    "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
    "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "bb4affe36e6733abdc0a35af9f1a2cf7766e4c20cad99b1d4ae00fc10064c802",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "c83bb36320767ed17d813af12105f24f5632b4370cf5cab627feef1e4d1f0bbd",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "67acc8c57a94801c1ac2166ced44f11690cf893f3409ee853b2dd679c0382a00",
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
    "Sources/slotstream-cli/OptimizationCommands.swift": "fcc67eebd76ea49e3cbef625c1ec80b2534a8ae22f2e1b22e25e5015a549f192",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
    "Sources/slotstream-cli/main.swift": "4bb7f13a6b31d4e348db3b4dff93707a52be7606302a120b94b3a4ebb933f462",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "ec40599185f0dcacd51186a8a071703555fccac0a1d898f175930be6f67fcc0b",
  "binary_sha256": "39d236e83ac7aa2c5b6298e415bb810e7e4c8aaba002f587b80083b5aa31e1f1",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}
```

## api-robustness.log

SHA-256 `b72c10aa9eaa9a7ba85e5d2798954e06b71929cad81d0229007f09b90a581521`.

```text
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
PASS  streamed deltas reassemble to the non-streamed text (10 cases)
PASS  out-of-range "top_p":0 falls back sanely (got 'OK')
PASS  out-of-range "top_p":-1 falls back sanely (got 'OK')
PASS  out-of-range "min_p":1.5 falls back sanely (got 'OK')
PASS  empty prompt is the load request: acknowledged, never answered from an uninitialized tensor
PASS  OpenAI array-form content is read, not dropped
PASS  stop sequence honored (got '1 2 3')
PASS  over-length prompt is refused with a 400, not a silent stall
PASS  /api/version (0.2.7) matches the binary
PASS  /api/tags size matches the pinned manifest
PASS  /api/show accepts the Ollama CLI request shape and advertises capabilities
PASS  /api/show accepts the deprecated name alias
PASS  /api/show refuses a non-empty system override instead of ignoring it
PASS  /api/show still rejects unknown fields
PASS  /api/chat accepts keep_alive and null options (the CLI's defaults)
PASS  /api/generate accepts the Ollama CLI one-shot shape (empty suffix/system/template)
PASS  /api/generate refuses a non-empty suffix instead of ignoring it
PASS  /api/generate with an empty prompt is the Ollama load request, acknowledged
PASS  /api/chat with no messages is the Ollama load request, acknowledged
PASS  HEAD returns no body
PASS  malformed JSON returns 400
PASS  metadata endpoints answer during a generation, and the accept loop keeps accepting
PASS  /api/show accepts an empty model with the name in the alias (ollama show)
PASS  an untagged model name resolves to the only model
PASS  a semantic Ollama knob (num_ctx) is still refused, never silently dropped
PASS  /v1 treats "max_tokens":null as unset
PASS  /v1 treats "stop":null as unset
PASS  /v1 treats "temperature":null as unset
PASS  /v1 treats "seed":null as unset
PASS  /v1 treats "stream_options":null as unset
PASS  /v1 accepts the no-op default "n":1
PASS  /v1 accepts the no-op default "frequency_penalty":0
PASS  /v1 accepts the no-op default "user":"u1"
PASS  /v1 accepts the no-op default "logprobs":false
PASS  /v1 accepts the no-op default "logit_bias":{}
PASS  /v1 accepts the no-op default "tools":[]
PASS  /v1 accepts the no-op default "response_format":{"type":"text"}
PASS  /v1 still refuses the real feature "n":2
PASS  /v1 still refuses the real feature "frequency_penalty":0.5
PASS  /v1 still refuses the real feature "logprobs":true
PASS  /v1 still refuses the real feature "tools":[{"type":"function"}]
PASS  /v1 still refuses the real feature "response_format":{"type":"json_object"}
PASS  think:true splits reasoning into message.thinking and leaves the answer clean
16 content deltas for 16 tokens
PASS  a short reply arrives as per-token deltas, not one batched chunk
PASS  unseeded requests vary, as the API documents
PASS  an explicit seed still reproduces exactly
PASS  a query string does not 404 the route
PASS  HEAD on a real path is 200
PASS  HEAD on an unknown path is 404, not a blanket 200
PASS  a chunked body is refused with 411, not read as empty
PASS  an oversized body gets 413, not a bare connection reset
PASS  a malformed Content-Length gets 400
PASS  a file:// image is refused and says URLs are not fetched
PASS  an https:// image is refused on the OpenAI route too
PASS  a non-string images array is a 400, not a silently text-only answer
PASS  an image part with no url is a 400
PASS  bytes that are not an image are a 400 with the reason
PASS  raw generate refuses images instead of dropping them
PASS  /v1/models carries created
PASS  the first SSE delta announces the role
PASS  server still up after every probe

robustness: passed 74, failed 0

```

## catalogue-final.log

SHA-256 `c803515c9920e031f20a8d85e7484a9504786f36222a489926e7fc128d7cd540`.

```text
PASS  prefill-schedule (15 assertions)
PASS  context-policy (8 assertions)
PASS  optimization-exact-read (14 assertions)
PASS  optimization-packed-layout (226 assertions)
PASS  optimization-ngram-prefetch-ticket (28 assertions)
PASS  optimization-cache-bookkeeping (18163 assertions)
PASS  optimization-adaptive-policy (62 assertions)
PASS  optimization-runtime-budget (561 assertions)
PASS  optimization-layer-local-victim (226 assertions)
PASS  optimization-pressure-boundary (74 assertions)
PASS  runtime-check (53 assertions)
PASS  governor-check (26 assertions)
PASS  pull-check (14 assertions)
PASS  machine-planning (15 assertions)
PASS  http-framing (11 assertions)
PASS  http-routing (23 assertions)
PASS  optimization-bounded-output (38 assertions)
PASS  vision-check (132 assertions)
PASS  sampler-behaviour (647 assertions)
PASS  optimization-compact-indexer (84 assertions)
PASS  optimization-slot-slices (158 assertions)
PASS  optimization-slot-words (350 assertions)
PASS  vision-splice (12 assertions)
PASS  optimization-vision-attention (60 assertions)
PASS  optimization-router-selection (43 assertions)
PASS  optimization-compiled-norm (49 assertions)
PASS  optimization-router-projection (30 assertions)
PASS  optimization-indexer-block-selection (163 assertions)
PASS  optimization-indexer-visibility (262 assertions)
PASS  toolcall-check (19 assertions)
PASS  toolcall-stream-check (14 assertions)
PASS  toolcall-coercion (23 assertions)
PASS  gateway-request (37 assertions)
PASS  gateway-prompt (23 assertions)
PASS  gateway-catalog (28 assertions)
PASS  gateway-events (19 assertions)
PASS  chat-splice (10 assertions)
PASS  gateway-null-bridge (10 assertions)
PASS  gateway-anyof-types (13 assertions)
PASS  openai-conversation (26 assertions)
PASS  openai-tool-output (163 assertions)
PASS  openai-context-budget (13 assertions)

42 passed, 0 failed, 0 skipped (21945 assertions)

```

## vision-serving.log

SHA-256 `31c703fabfae9ea62736f873ed3f46d8c9f2cea54da2005ee14c1b0cf781b4ab`.

```text
PASS  ollama /api/chat answers an image request
PASS  and it recognises the dog
      -> 'Dog nose close-up' in 16.5s, 725 prompt tokens
PASS  the picture is worth its 702 placeholder tokens, plus the two sentinels
PASS  /v1/chat/completions answers an image_url part
PASS  and it sees the fruit on the tree
      -> 'Green citrus fruit'
PASS  /api/generate answers an image request
PASS  and it recognises the dog there too
PASS  the fx gateway accepts an image file part
PASS  and answers about the dog
PASS  and still refuses a file part that is not an image
PASS  two pictures in one turn are accepted
PASS  and they arrive in the order they were sent
      -> 'dog, pomelo'
PASS  a follow-up turn on the same picture succeeds
PASS  and reuses the state instead of re-running the tower
      -> first 13.7s, follow-up 1.5s
PASS  the same words with a different picture get a different answer
PASS  duplicate images preserve the visible subject
PASS  duplicate image work is counted
PASS  same-geometry seed acknowledges the image
PASS  changed image would extend the cached token IDs
PASS  same-geometry changed content misses and re-encodes
PASS  same-geometry changed image is blue
PASS  a file:// image is a 400
PASS  that says URLs are not fetched
PASS  bytes that are not an image are a 400
PASS  a truncated image is a 400, not a blank description

25 passed, 0 failed
VISION SERVING PASS

```

## openai-tools-complete.log

SHA-256 `4de8042431af5a4ae1743ec92015bde6e3dfddc9a2de47db70172716df1763b1`.

```text
PASS runtime context discovery agrees
PASS nonstream returns executable OpenAI function
PASS nonstream preserves function and typed arguments
PASS nonstream includes call identity and usage
PASS nonstream completes tool-result round trip
PASS stream returns executable OpenAI function
PASS stream preserves function and typed arguments
PASS stream includes call identity and usage
PASS stream completes tool-result round trip
PASS parallel false returns one complete call
PASS parallel stream has distinct complete calls
PASS parallel results match by call ID
PASS tool choice none remains text-only
PASS multiple initial instructions survive rendering
PASS reasoning separated from answer
PASS orphan-result rejected before inference
PASS missing-result rejected before inference
PASS context-inflation rejected before inference
PASS reasoning-conflict rejected before inference
PASS unknown-function rejected before inference
PASS unsupported structured output has actionable rejection
PASS truncated required tool is an inference error
PASS streamed inference error cannot masquerade as success
PASS request context limit is enforced before inference
PASS OpenAI image and tool templates compose
PASS image tool-result history remains usable
{"passed": 26, "context": 32768, "model": "qwen3.8-flash-next:4bit"}

```

## ollama-cli.json

SHA-256 `85d3d9322796ae89a2f49a79076a1480363a079040ce84b24795359f67e4b6cd`.

```text
{
  "version_stdout": "ollama version is 0.2.7\nWarning: client version is 0.32.15\n",
  "version_stderr": "",
  "exit": 0,
  "stdout": "OK\n\n",
  "stderr": "\u001b[?2026h\u001b[?25l\u001b[1G\u2819 \u001b[K\u001b[?25h\u001b[?2026l\u001b[?2026h\u001b[?25l\u001b[1G\u2839 \u001b[K\u001b[?25h\u001b[?2026l\u001b[?2026h\u001b[?25l\u001b[1G\u2838 \u001b[K\u001b[?25h\u001b[?2026l\u001b[?2026h\u001b[?25l\u001b[1G\u2838 \u001b[K\u001b[?25h\u001b[?2026l\u001b[?2026h\u001b[?25l\u001b[1G\u283c \u001b[K\u001b[?25h\u001b[?2026l\u001b[?2026h\u001b[?25l\u001b[1G\u2826 \u001b[K\u001b[?25h\u001b[?2026l\u001b[?2026h\u001b[?25l\u001b[1G\u2827 \u001b[K\u001b[?25h\u001b[?2026l\u001b[?2026h\u001b[?25l\u001b[1G\u2807 \u001b[K\u001b[?25h\u001b[?2026l\u001b[?2026h\u001b[?25l\u001b[1G\u280f \u001b[K\u001b[?25h\u001b[?2026l\u001b[?2026h\u001b[?25l\u001b[1G\u280f \u001b[K\u001b[?25h\u001b[?2026l\u001b[?2026h\u001b[?25l\u001b[1G\u2819 \u001b[K\u001b[?25h\u001b[?2026l\u001b[?2026h\u001b[?25l\u001b[1G\u2839 \u001b[K\u001b[?25h\u001b[?2026l\u001b[?2026h\u001b[?25l\u001b[1G\u2838 \u001b[K\u001b[?25h\u001b[?2026l\u001b[?25l\u001b[?2026h\u001b[?25l\u001b[1G\u001b[K\u001b[?25h\u001b[?2026l\u001b[2K\u001b[1G\u001b[?25h\u001b[?25l\u001b[?25h\u001b[?25l\u001b[?25h"
}
```

## gateway-final/gateway.log

SHA-256 `8a65603e11ad58e3a61d2a27475a52200b439b9279cbd566804a69fc64361c2b`.

```text
gateway-tool-turn1 200 10.882
[{"input": "{\"path\":\"diagnostic.txt\"}", "toolCallId": "call_44124ba1", "toolName": "read_file", "type": "tool-call"}, {"finishReason": {"raw": "tool_calls", "unified": "tool-calls"}, "type": "finish", "usage": {"inputTokens": {"cacheRead": 0, "cacheWrite": 0, "noCache": 283, "total": 283}, "outputTokens": {"reasoning": 0, "text": 26, "total": 26}}}]
gateway-tool-turn2 200 5.994
[{"finishReason": {"raw": "stop", "unified": "stop"}, "type": "finish", "usage": {"inputTokens": {"cacheRead": 309, "cacheWrite": 0, "noCache": 27, "total": 336}, "outputTokens": {"reasoning": 0, "text": 26, "total": 26}}}]
ANSWER The file `diagnostic.txt` contains exactly this text:

```
HERMES_SLOTSTREAM_PROBE_42
```

```

## hermes-vision-discovery-before.json

SHA-256 `8f26ad200ad39be7727653150ed7b47c20d367a1a621157460730e5b8477e53e`.

```text
{
  "hermes_detects_vision": false
}
```

## Exact selected OpenAI wire records

```json
[
  {
    "case": "show",
    "path": "/api/show",
    "request": {
      "model": "qwen3.8-flash-next:4bit"
    },
    "status": 200,
    "response": "{\"details\":{\"format\":\"safetensors\",\"family\":\"qwen4_exp\",\"quantization_level\":\"4bit\",\"expert_cache_per_layer\":13,\"memory_plan\":{\"est_warm_tok_s\":2.666666666666667,\"est_prefill_s_at_max_context\":385.50588235294038,\"expected_peak_gb\":8.9000000000000004,\"fully_resident\":false,\"prefix_cache_max_tokens\":10127,\"availability_clamped\":false,\"device_available_gb\":29.300000000000001,\"mtp\":false,\"pool_gb\":1.8,\"vision_resident_reserved\":true,\"target_gb\":10,\"max_context_tokens\":32768,\"est_prefill_tok_s\":85,\"max_ram_percent\":70,\"device_ram_gb\":51.5,\"vision_resident_gb\":0.90000000000000002,\"notes\":[\"vision tower resident memory reserved before loading\"],\"prefill_chunk\":256,\"vision\":true,\"vision_charged_gb\":0.90000000000000002,\"source\":\"--memory-gb\",\"experts_per_layer_cached\":13,\"pool_slots\":640,\"device_working_set_gb\":40.200000000000003},\"experts_per_layer\":512,\"prefix_cache\":{\"enabled\":true,\"hits\":1,\"charged_token_capacity\":6144,\"evictions\":6,\"max_tokens\":10127,\"held_images\":5,\"held_tokens\":3515,\"checkpoint_hits\":0,\"reusable_checkpoints\":0,\"held_gb\":0.62,\"allocated_sequence_bytes\":169869312,\"misses\":12,\"max_conversations\":4,\"checkpoint_fork_failures\":0,\"checkpoint_stores\":0,\"conversations\":4},\"parameter_size\":\"176B-A6B\"},\"parameters\":\"num_ctx 32768\",\"modelfile\":\"# slotstream: SSD-streamed qwen4_exp\",\"template\":\"{{ .Prompt }}\",\"capabilities\":[\"completion\"],\"model_info\":{\"general.parameter_count\":176000000000,\"general.architecture\":\"qwen4_exp\",\"qwen4_exp.context_length\":32768}}"
  },
  {
    "case": "parallel-calls",
    "path": "/v1/chat/completions",
    "request": {
      "model": "qwen3.8-flash-next:4bit",
      "messages": [
        {
          "role": "user",
          "content": "Call read_file twice now: once for alpha.txt and once for beta.txt. Use start_line 1 in each call. Emit both calls before waiting for results."
        }
      ],
      "tools": [
        {
          "type": "function",
          "function": {
            "name": "read_file",
            "description": "Read a named diagnostic file.",
            "strict": false,
            "parameters": {
              "type": "object",
              "properties": {
                "path": {
                  "type": "string"
                },
                "start_line": {
                  "type": "integer",
                  "default": null
                }
              },
              "required": [
                "path"
              ]
            }
          }
        }
      ],
      "max_tokens": 256,
      "temperature": 0,
      "seed": 42,
      "reasoning_effort": "none",
      "think": false,
      "options": {
        "num_ctx": 32768
      },
      "parallel_tool_calls": true,
      "tool_choice": "required",
      "stream": true
    },
    "status": 200,
    "response": "data: {\"model\":\"qwen3.8-flash-next:4bit\",\"created\":1788651251,\"object\":\"chat.completion.chunk\",\"choices\":[{\"finish_reason\":null,\"index\":0,\"delta\":{\"content\":\"I\",\"role\":\"assistant\"}}],\"id\":\"chatcmpl-B9382BD5-5DB5-4243-BD3B-77D3A7B166A2\"}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"created\":1788651251,\"object\":\"chat.completion.chunk\",\"choices\":[{\"index\":0,\"delta\":{\"content\":\"'ll\"},\"finish_reason\":null}],\"id\":\"chatcmpl-B9382BD5-5DB5-4243-BD3B-77D3A7B166A2\"}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"created\":1788651251,\"object\":\"chat.completion.chunk\",\"choices\":[{\"index\":0,\"delta\":{\"content\":\" make\"},\"finish_reason\":null}],\"id\":\"chatcmpl-B9382BD5-5DB5-4243-BD3B-77D3A7B166A2\"}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"created\":1788651251,\"object\":\"chat.completion.chunk\",\"choices\":[{\"index\":0,\"delta\":{\"content\":\" both\"},\"finish_reason\":null}],\"id\":\"chatcmpl-B9382BD5-5DB5-4243-BD3B-77D3A7B166A2\"}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"created\":1788651251,\"object\":\"chat.completion.chunk\",\"choices\":[{\"index\":0,\"delta\":{\"content\":\" calls\"},\"finish_reason\":null}],\"id\":\"chatcmpl-B9382BD5-5DB5-4243-BD3B-77D3A7B166A2\"}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"created\":1788651251,\"object\":\"chat.completion.chunk\",\"choices\":[{\"index\":0,\"delta\":{\"content\":\" now\"},\"finish_reason\":null}],\"id\":\"chatcmpl-B9382BD5-5DB5-4243-BD3B-77D3A7B166A2\"}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"created\":1788651251,\"object\":\"chat.completion.chunk\",\"choices\":[{\"index\":0,\"delta\":{\"content\":\".\"},\"finish_reason\":null}],\"id\":\"chatcmpl-B9382BD5-5DB5-4243-BD3B-77D3A7B166A2\"}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"created\":1788651251,\"object\":\"chat.completion.chunk\",\"choices\":[{\"index\":0,\"delta\":{\"content\":\"\\n\\n\"},\"finish_reason\":null}],\"id\":\"chatcmpl-B9382BD5-5DB5-4243-BD3B-77D3A7B166A2\"}\n\n: keepalive\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"id\":\"chatcmpl-B9382BD5-5DB5-4243-BD3B-77D3A7B166A2\",\"created\":1788651251,\"choices\":[{\"finish_reason\":null,\"index\":0,\"delta\":{\"tool_calls\":[{\"id\":\"call_F195685E40D644FFB50128A7041323EB\",\"index\":0,\"function\":{\"name\":\"read_file\",\"arguments\":\"{\\\"path\\\":\\\"alpha.txt\\\",\\\"start_line\\\":1}\"},\"type\":\"function\"}]}}],\"object\":\"chat.completion.chunk\"}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"created\":1788651251,\"object\":\"chat.completion.chunk\",\"choices\":[{\"finish_reason\":null,\"index\":0,\"delta\":{\"content\":\"\\n\"}}],\"id\":\"chatcmpl-B9382BD5-5DB5-4243-BD3B-77D3A7B166A2\"}\n\n: keepalive\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"id\":\"chatcmpl-B9382BD5-5DB5-4243-BD3B-77D3A7B166A2\",\"created\":1788651251,\"choices\":[{\"index\":0,\"delta\":{\"tool_calls\":[{\"type\":\"function\",\"index\":1,\"function\":{\"name\":\"read_file\",\"arguments\":\"{\\\"path\\\":\\\"beta.txt\\\",\\\"start_line\\\":1}\"},\"id\":\"call_B880B3705A02482F98E9DD531294ACB8\"}]},\"finish_reason\":null}],\"object\":\"chat.completion.chunk\"}\n\ndata: {\"model\":\"qwen3.8-flash-next:4bit\",\"id\":\"chatcmpl-B9382BD5-5DB5-4243-BD3B-77D3A7B166A2\",\"created\":1788651251,\"choices\":[{\"index\":0,\"delta\":{},\"finish_reason\":\"tool_calls\"}],\"object\":\"chat.completion.chunk\"}\n\ndata: [DONE]\n\n"
  },
  {
    "case": "parallel-results",
    "path": "/v1/chat/completions",
    "request": {
      "model": "qwen3.8-flash-next:4bit",
      "messages": [
        {
          "role": "user",
          "content": "Call read_file twice now: once for alpha.txt and once for beta.txt. Use start_line 1 in each call. Emit both calls before waiting for results."
        },
        {
          "role": "assistant",
          "content": "I'll make both calls now.\n\n\n",
          "tool_calls": [
            {
              "id": "call_F195685E40D644FFB50128A7041323EB",
              "type": "function",
              "function": {
                "name": "read_file",
                "arguments": "{\"path\":\"alpha.txt\",\"start_line\":1}"
              }
            },
            {
              "id": "call_B880B3705A02482F98E9DD531294ACB8",
              "type": "function",
              "function": {
                "name": "read_file",
                "arguments": "{\"path\":\"beta.txt\",\"start_line\":1}"
              }
            }
          ]
        },
        {
          "role": "tool",
          "tool_call_id": "call_B880B3705A02482F98E9DD531294ACB8",
          "content": "SECOND_FIXTURE_29"
        },
        {
          "role": "tool",
          "tool_call_id": "call_F195685E40D644FFB50128A7041323EB",
          "content": "FIRST_FIXTURE_17"
        },
        {
          "role": "user",
          "content": "Report each filename and its exact contents without a tool. Use exactly two lines in this format: alpha.txt=CONTENTS then beta.txt=CONTENTS."
        }
      ],
      "tools": [
        {
          "type": "function",
          "function": {
            "name": "read_file",
            "description": "Read a named diagnostic file.",
            "strict": false,
            "parameters": {
              "type": "object",
              "properties": {
                "path": {
                  "type": "string"
                },
                "start_line": {
                  "type": "integer",
                  "default": null
                }
              },
              "required": [
                "path"
              ]
            }
          }
        }
      ],
      "max_tokens": 64,
      "temperature": 0,
      "seed": 42,
      "reasoning_effort": "none",
      "think": false,
      "options": {
        "num_ctx": 32768
      }
    },
    "status": 200,
    "response": "{\"model\":\"qwen3.8-flash-next:4bit\",\"created\":1788651272,\"object\":\"chat.completion\",\"choices\":[{\"index\":0,\"message\":{\"content\":\"alpha.txt=FIRST_FIXTURE_17\\nbeta.txt=SECOND_FIXTURE_29\",\"role\":\"assistant\"},\"finish_reason\":\"stop\"}],\"usage\":{\"total_tokens\":471,\"prompt_tokens\":452,\"completion_tokens\":19,\"prompt_tokens_details\":{\"cached_tokens\":0}},\"id\":\"chatcmpl-82A5DCB8-FBB3-4E3F-84CC-56361140C52F\"}"
  }
]
```

The actual unmodified Hermes release metadata function returned false for vision against this image-enabled server. The image suite and OpenAI image-tool tests had succeeded, so the failure is discovery metadata, not missing image inference. The next build changes only Server.swift to include the vision capability when the engine allows it and the checkpoint supplies it.
