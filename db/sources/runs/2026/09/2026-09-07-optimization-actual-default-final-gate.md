---
type: run
id: 01m1wp8gpbd09f36951h6vrfqe
created: 2026-09-07T01:03:28.971907+00:00
updated: 2026-09-07T01:03:29.161763+00:00
summary: Applied eighth actual-default final qualification gate
binary: provider-free Python validator; V215 runtime unchanged
captured_at: 2026-09-07
command: python3 -m unittest discover -s Tools -p optimization_prerequisites_test.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Applied eighth actual-default final qualification gate
tool: Pure final receipt validator tests
---
# Applied eighth actual-default final qualification gate

V219 applies the exact reviewed V217 receipt validator/test patch. All original
seven paired workloads remain mandatory, and the eighth actual-default
minimal-reply guard is now required before either soak can launch. It rejects
explicit candidate optimization overrides, disabled unique-prompt retention
or a larger reply even if those altered controls appear in a newly frozen
contract. The benchmark itself remains UNRUN; the final source/native binding
and complete8workload contract must precede all final studies. Its first job
is short17/output1, and its distinct measured request is prose440/output1, with
strict5percent nonregression in both intervals and unchanged16fixed/min5clean
criteria. No original performance gate is weakened or removed.

All13pure receipt tests pass on the shared Tools source. All143 runtime source
files match frozen V215. No model, build, GPU workload, default, context limit
or memory allowance changes. discarded:true excludes any resource/timing
interpretation of this unsampled workspace review. Reconcile source-resolved
workspace preflight after optional candidates are selected; then qualify the
actual-default source build, all8paired studies, bothsoaks, fullacceptance and
resource/calibration/artifact gates. No whole-program completion is claimed.

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/actual-default-guard-integration-v219/manifest.json",
    "bytes": 1353,
    "sha256": "b3bbab09ef4ccb9a042bc14e7fa472965eb5a9dfdab3e8258e5b8e249b424ffa"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/actual-default-guard-integration-v219/pure-tests.txt",
    "bytes": 112,
    "sha256": "6e5b93496d573082bee81a299e00d69d4ce86268994dfd16ea642d5aaa28a68b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/actual-default-guard-integration-v219/runtime-source-audit.json",
    "bytes": 17692,
    "sha256": "b83c3bad4d28f6a2344e0b82d422b1f4cb8ed9668983181116f7bf4a9d135c78"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/actual-default-guard-draft-v217/draft.patch",
    "bytes": 5650,
    "sha256": "1a90a15ed4faad4f488700bf8644ee425dd9641282df0ab48b4c30bcfbde34de"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/actual-default-guard-draft-v217/actual-default-one-token.json",
    "bytes": 6166,
    "sha256": "6aab166d2b9166841b2d5d1cc89a390ff31f56173d80263114dbbbbf317019dd"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/Tools/optimization_soak.py",
    "bytes": 25572,
    "sha256": "59737c1d9b85222c05517690230d519fc3904a18c7989ae89131539b468667c8"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/Tools/optimization_prerequisites_test.py",
    "bytes": 12471,
    "sha256": "5e9c12aadce395881631a1ca5ed909997e8e95ec14c5e01ee671d1248c7ac67f"
  }
]
```

## /tmp/slotstream-optimization-execution/actual-default-guard-integration-v219/manifest.json

SHA-256 `b3bbab09ef4ccb9a042bc14e7fa472965eb5a9dfdab3e8258e5b8e249b424ffa`.

````text
{
  "applied": true,
  "source_packet": "/tmp/slotstream-optimization-execution/actual-default-guard-draft-v217",
  "files": [
    {
      "path": "Tools/optimization_soak.py",
      "before_sha256": "7cd055e063509d7f1ec636329fdf1e062ce6621afa6505d890974bfbe27d6e26",
      "after_sha256": "59737c1d9b85222c05517690230d519fc3904a18c7989ae89131539b468667c8"
    },
    {
      "path": "Tools/optimization_prerequisites_test.py",
      "before_sha256": "e62f37251c7f9e8ac08be3fb477226d0171986dba673589047bccffc8add9e5c",
      "after_sha256": "5e9c12aadce395881631a1ca5ed909997e8e95ec14c5e01ee671d1248c7ac67f"
    }
  ],
  "command": [
    "python3",
    "-m",
    "unittest",
    "discover",
    "-s",
    "Tools",
    "-p",
    "optimization_prerequisites_test.py"
  ],
  "exit_code": 0,
  "test_output_sha256": "6e5b93496d573082bee81a299e00d69d4ce86268994dfd16ea642d5aaa28a68b",
  "runtime_source_unchanged": true,
  "frozen_performance_run": false,
  "qualification_change": "8 complete paired studies required, including no-override actual-default minimal-reply guard; all7previous workloads preserved. Freeze full8 workload/control contract before first final cell.",
  "remaining": "Bind final source/native/controls; review source-resolved preflight after optional defaults; run all8 studies, bothsoaks, finalacceptance andresourcecalibration."
}

````

## /tmp/slotstream-optimization-execution/actual-default-guard-integration-v219/pure-tests.txt

SHA-256 `6e5b93496d573082bee81a299e00d69d4ce86268994dfd16ea642d5aaa28a68b`.

````text
.............
----------------------------------------------------------------------
Ran 13 tests in 0.116s

OK

````

## /tmp/slotstream-optimization-execution/actual-default-guard-integration-v219/runtime-source-audit.json

SHA-256 `b83c3bad4d28f6a2344e0b82d422b1f4cb8ed9668983181116f7bf4a9d135c78`.

````text
{
  "source_files": 143,
  "matches_V215": true,
  "source_sha256": {
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
  }
}

````

## /tmp/slotstream-optimization-execution/actual-default-guard-draft-v217/draft.patch

SHA-256 `1a90a15ed4faad4f488700bf8644ee425dd9641282df0ab48b4c30bcfbde34de`.

````text
--- a/Tools/optimization_soak.py
+++ b/Tools/optimization_soak.py
@@ -164,7 +164,7 @@
     """
     required_native = {'combined-plain', 'combined-mtp', 'read-failure-serving'}
     required_paired = {'short-one', 'unique-prose', 'sampled-short', 'mtp-resource',
-                       'distinct-tail', 'complete-repeat', 'unique-with-retention'}
+                       'distinct-tail', 'complete-repeat', 'unique-with-retention', 'actual-default-one-token'}
     prerequisites = protocol.get('prerequisites')
     if not isinstance(prerequisites, dict) or set(prerequisites) != {'native', 'paired'}:
         raise ValueError('native and paired final-candidate prerequisites are mandatory')
@@ -221,6 +221,14 @@
         declared = manifest['protocol']
         if declared != contract['paired_protocols'][name]:
             raise ValueError(f'paired workload or controls differ from the frozen contract: {name}')
+        if name == 'actual-default-one-token':
+            selected = declared.get('arms', {}).get('combined', {})
+            prefix = declared.get('prefix_cache', {})
+            if (selected.get('env') != {} or declared.get('max_tokens') != 1
+                    or declared.get('minimum_output_tokens') != 1
+                    or prefix.get('retention_only') is not True
+                    or prefix.get('expected_reused_tokens') != {'reference': 0, 'combined': 0}):
+                raise ValueError('actual-default guard requires unoverridden defaults, one output token and enabled unique-prompt retention')
         arms = manifest.get('arm_builds') or {}
         if (not arms or any(not same_identity(arm.get('identity')) for arm in arms.values())
                 or completion.get('interrupted') is not False or completion.get('stopped_early') is not False
--- a/Tools/optimization_prerequisites_test.py
+++ b/Tools/optimization_prerequisites_test.py
@@ -29,7 +29,7 @@
                 'assertions': 1, 'command': ['/unused/slotstream', 'optimization-state-check', '--variant', variant]})
             self.write(entry, 'stdout.txt', {'passed': True, 'items': [{'passed': True}]})
         for name in ['short-one', 'unique-prose', 'sampled-short', 'mtp-resource', 'distinct-tail',
-                     'complete-repeat', 'unique-with-retention']:
+                     'complete-repeat', 'unique-with-retention', 'actual-default-one-token']:
             entry = self.entry('paired', name)
             gate = {'minimum_pairs': 5, 'replacement_rounds': 0, 'all_outputs_exact': True}
             if name in ['short-one', 'distinct-tail', 'complete-repeat']:
@@ -48,6 +48,10 @@
                 'startup_acceptance': self.decision})
             self.write(entry, 'results.jsonl', [{'round': i, 'arm': arm}
                 for i in range(1, 17) for arm in ['reference', 'combined']])
+        self.modify('paired', 'actual-default-one-token', 'manifest.json',
+            lambda m: m['protocol'].update(arms={'reference': {'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}},
+                'combined': {'env': {}}}, max_tokens=1, minimum_output_tokens=1,
+                prefix_cache={'retention_only': True, 'expected_reused_tokens': {'reference': 0, 'combined': 0}}))
         self.contract_path = self.root / 'qualification-contract.json'
         self.contract = {'format': 'slotstream-qualification-v1', 'build_identity': copy.deepcopy(self.identity),
             'native': {}, 'paired_protocols': {}, 'soak_modes': {}}
@@ -61,6 +65,24 @@
             self.contract['soak_modes'][mode] = {'mtp': mode, 'env': copy.deepcopy(self.protocol['env'])}
         self.freeze_contract()
 
+    def test_actual_default_guard_rejects_forced_controls_even_when_frozen(self):
+        self.actual_default_mutation(lambda p: p['arms']['combined']['env'].update(SLOTSTREAM_OPT_FINAL_FORWARD='1'))
+
+    def test_actual_default_guard_rejects_disabled_retention_even_when_frozen(self):
+        self.actual_default_mutation(lambda p: p.pop('prefix_cache'))
+
+    def test_actual_default_guard_rejects_larger_reply_even_when_frozen(self):
+        self.actual_default_mutation(lambda p: p.update(max_tokens=16, minimum_output_tokens=16))
+
+    def actual_default_mutation(self, change):
+        name = 'actual-default-one-token'
+        self.modify('paired', name, 'manifest.json', lambda m: change(m['protocol']))
+        entry = self.protocol['prerequisites']['paired'][name]
+        self.contract['paired_protocols'][name] = json.loads((Path(entry['directory']) / 'manifest.json').read_text())['protocol']
+        self.freeze_contract()
+        with self.assertRaisesRegex(ValueError, 'actual-default guard'):
+            self.validate()
+
     def freeze_contract(self):
         self.contract_path.write_text(json.dumps(self.contract))
         self.protocol['qualification_contract'] = {'path': str(self.contract_path),
@@ -93,11 +115,11 @@
             startup = stack.enter_context(patch('optimization_soak.bench.startup_acceptance_results',
                 return_value=self.decision))
             result = validate_prerequisites(self.protocol, self.build)
-            self.assertEqual((summary.call_count, acceptance.call_count, startup.call_count), (7, 7, 7))
+            self.assertEqual((summary.call_count, acceptance.call_count, startup.call_count), (8, 8, 8))
             return result
 
     def test_complete_same_build_evidence_is_recomputed_and_accepted(self):
-        self.assertEqual(len(self.validate()), 11)
+        self.assertEqual(len(self.validate()), 12)
         self.protocol['mtp'] = 'on'
         self.assertEqual(self.validate()['qualification_contract'], self.contract)
 

````

## /tmp/slotstream-optimization-execution/actual-default-guard-draft-v217/actual-default-one-token.json

SHA-256 `6aab166d2b9166841b2d5d1cc89a390ff31f56173d80263114dbbbbf317019dd`.

````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "FINAL_BINARY_REQUIRED",
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
      "binary": "FINAL_BINARY_REQUIRED",
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
      "binary": "FINAL_BINARY_REQUIRED",
      "chunk": 256,
      "env": {}
    }
  },
  "label": "integrated-actual-default-one-token-draft-v217",
  "classification": "UNRUN DRAFT; not executable until final binary, source, selected controls and native prerequisites are bound",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
  "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
  "max_tokens": 1,
  "minimum_output_tokens": 1,
  "conditions": "UNRUN eighth final-matrix guard. Same actual-default deployment build in both arms; reference explicitly disables all54controls, combined receives no optimization or embedding override. Prefix cache enabled; first-job is cold short17/1, measured request is distinct prose440/1 with zero reuse and one combined checkpoint store. Both first-job and measured unique-request median regression <=5percent, min5clean among16fixed pairs, exact outputs, no replacements, unchanged VM/thermal/8.1GB footprint gates,180secondsinitialquiet and60secondcellcooldown. Bind final selected runtime source/build and complete native/paired workload contract BEFORE any cell. Source-resolved default memory/workspace preflight must also be reviewed if optional scope or other defaults are added. This supplements all original seven studies; none are removed.",
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
  "candidate_prerequisites_pending": [
    "Final source/binary after independent candidate decisions",
    "Final plain and MTP native combination checks",
    "Compatibility/default dispatch qualification",
    "All selected controls have scoped correctness and performance/resource evidence",
    "Actual-default deployment source must be built, not only explicitly enabled benchmark flags",
    "All8paired protocols included in qualification contract before any final study",
    "Review source-resolved default workspace reservation after optional candidate decisions"
  ]
}

````

## /Users/carlos/Projects/slotstream/Tools/optimization_soak.py

SHA-256 `59737c1d9b85222c05517690230d519fc3904a18c7989ae89131539b468667c8`.

````text
#!/usr/bin/env python3
"""Bounded repeated-request lifetime qualification; no latency improvement claims."""
import argparse
from contextlib import contextmanager
import http.client
import json
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
        if digest(path) != entry['sha256'][name]:
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

## /Users/carlos/Projects/slotstream/Tools/optimization_prerequisites_test.py

SHA-256 `5e9c12aadce395881631a1ca5ed909997e8e95ec14c5e01ee671d1248c7ac67f`.

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
                'acceptance': gate,
                'startup_acceptance': {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05,
                    'all_outputs_exact': True}},
                'arm_builds': {arm: self.build for arm in ['reference', 'combined']}})
            self.write(entry, 'completion.json', {'interrupted': False, 'stopped_early': False,
                'planned_cells': 32, 'recorded_cells': 32, 'acceptance': self.decision,
                'startup_acceptance': self.decision})
            self.write(entry, 'results.jsonl', [{'round': i, 'arm': arm}
                for i in range(1, 17) for arm in ['reference', 'combined']])
        self.modify('paired', 'actual-default-one-token', 'manifest.json',
            lambda m: m['protocol'].update(arms={'reference': {'env': {'SLOTSTREAM_OPT_FINAL_FORWARD': '0'}},
                'combined': {'env': {}}}, max_tokens=1, minimum_output_tokens=1,
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
