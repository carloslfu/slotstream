---
type: run
id: 01m1zm959252pw5kwwzcdshdxb
created: 2026-09-08T04:26:36.194523+00:00
updated: 2026-09-08T04:26:36.472300+00:00
summary: New combined native attempt stops on OS pressure with owned physical-footprint evidence
binary: V349 7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6
captured_at: 2026-09-08
command: python3 /tmp/slotstream-optimization-execution/compact-tail-native-v350/run.py native --name combined-plain --deadline 2026-09-08T04:40:00Z
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: New combined native attempt stops on OS pressure with owned physical-footprint evidence
tool: Slotstream local qualification and exact artifact capture
---
V350 refreshes the original integrated reference/candidate, MTP and read-failure commands for exact V349. Preparation validates the new binary/source/Metal identity and preserves original native cases and memory limits; its one-case executor reuses the previously exercised execution function and explicitly binds the tested V341 failure-footprint observer. The original frozen executors and all old reports stay unchanged.

The single ordinary native attempt stops after 41.651226791 seconds when the OS pressure level becomes 2. Standard error reaches reference / long1025 after cached17 and the 255/256/257 boundaries. Standard output is empty: there is no completed assertion report, ordinary qualification fails, and no MTP or read-failure case runs. The stop is a resource exclusion, not an established numerical failure or a vision-kernel failure. The candidate arm is not reached. The V344 diagnostic-lifetime narrowing therefore does not resolve the native resource stop on this occupied host.

The failure observer completes in 0.037372375 seconds and records physical footprint 7202034152 bytes for the exact owned PID/incarnation, versus resident size 1674706944 bytes. The 176 preceding regular samples have maximum owned RSS 4860526592 bytes and minimum reclaimable memory 9148694528 bytes. Initial reclaimable memory is 15558950912 bytes; the last sample before the stop is 16449634304 bytes. These are distinct counters at different times. A large reclaimable estimate or small resident set cannot override the OS warning, and the physical-footprint snapshot is neither sampled peak nor unique whole-system memory. No new swap-ins or swap-outs appear in the regular samples.

The process is terminated and group 55473 drains. The guard's after-cleanup pressure warning remains recorded even though a later independent 04:25:17 UTC check observes normal pressure, an empty group, a free model lock and no competing jobs. The unused native interval is explicitly returned. No retry, additional model execution, automatic-default activation, installation or user-app closure occurs. The full combined qualification and sustained-TPS evidence remain open.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/attempt.json",
    "bytes": 22936,
    "sha256": "a00ed901e481a4ddb19792e4494948b2990beed7352b5aa656065fb88c6f00a3"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/memory.failure-footprint.json",
    "bytes": 918,
    "sha256": "0413fafe83159f11a1f80a7628c77f449a64294623514552ef486ecebf265823"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/memory.json",
    "bytes": 43879,
    "sha256": "9c149033cd0ef36de483e11d1b0bc97d0027d901daa7d825badf09026bdebbd6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/memory.samples.jsonl",
    "bytes": 29712,
    "sha256": "bfd11e1d4908de85844d2241ffd0c3f8aa79972dbcbab4048af982d9c86ce72d"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/qualification.json",
    "bytes": 2615,
    "sha256": "5f0cf8ea4589a78608ce1b4d4cc822c018964845332cfe79435520b8dda91f9a"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/receipt.json",
    "bytes": 2517,
    "sha256": "c3c79b68cce427cdc55b18b95350ced9b2816c996894a8a86fcf681d46d70441"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/stderr.txt",
    "bytes": 169,
    "sha256": "8454673eede2d8fa3a8883a280b5972f13b8b19361645bd92426cd5eef3bccc0"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v350/preparation.json",
    "bytes": 23463,
    "sha256": "bb50e7a3113f9fd131ef7ced9386ffed096dad58214a5b6282e089da563e2c32"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v350/run.py",
    "bytes": 6933,
    "sha256": "00a4f02b95b2701aae0b3bcd76c7b23d87aed7ed346123ee5f4c5f2427f4ea4b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/handback-20260908-v350.json",
    "bytes": 3759,
    "sha256": "3258de2175a1f21dc52c078a4d674dd057cea8c7bab6f236a1394f7567b0e11f"
  }
]
```

## Artifact SHA-256 a00ed901e481a4ddb19792e4494948b2990beed7352b5aa656065fb88c6f00a3

Encoding: `utf-8`. Original bytes: 22936.

````````````text
{
  "started_at": "2026-09-08T04:22:48.544482+00:00",
  "deadline_utc": "2026-09-08T04:40:00Z",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "b31945de9dbedd9f0dd4beb39be7d31a6673f18c21619ab1847e5d81ad82c12e",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "512dd096a194f8c56f1d9be16931714035150ca54cbb02cbbb9d0aec5871657d",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "6c34e92eac7476ea5f7a1126ea6bf0eb5eb9b5b9fca8659cc28c2f760476dadf",
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
      "source_archive_sha256": "ff2a4c967bd785261e792d88c63a2d2f71d875e28429c136c258be7e4d58193e",
      "binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 15560458240,
    "swapins": 44130047,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    92525.\nPages active:                                1005876.\nPages inactive:                               951686.\nPages speculative:                             72043.\nPages throttled:                                   0.\nPages wired down:                             226876.\nPages purgeable:                               19124.\n\"Translation faults\":                    16889584800.\nPages copy-on-write:                       875479286.\nPages zero filled:                       22664015300.\nPages reactivated:                        3736554280.\nPages purged:                               79173481.\nFile-backed pages:                            838086.\nAnonymous pages:                             1191519.\nPages stored in compressor:                  1622385.\nPages occupied by compressor:                 736126.\nDecompressions:                           1278877611.\nCompressions:                             1602412867.\nPageins:                                  8057003179.\nPageouts:                                   11392302.\nSwapins:                                    44130047.\nSwapouts:                                   77538158.\nPages tagged:                                 179661.\nPages tagged resident:                        139670.\nPages tagged compressed:                       39991.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6992.\nPages tag-storage free:                          416.\nPages tag-storage non-tag pageable:            90888.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6392640.\nTagged compressions:                        12437748.\nTagged decompressions:                      11486774.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-08T04:22:48.544364+00:00",
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
    "maximum_build_seconds": 900,
    "stop_on_new_swapouts": false
  },
  "preparation_sha256": "bb50e7a3113f9fd131ef7ced9386ffed096dad58214a5b6282e089da563e2c32",
  "classification": "Same complete native commands on new V349 compact-cache/bounded-tail composition with all added assertions. Native correctness only; full serving/resource/long-TPS qualification remains. Fixed 900-second work allowance and 30-second cleanup reserve; no retries or activation. Additive V341 failure observer is explicitly bound; original guard policy is otherwise unchanged."
}

````````````

## Artifact SHA-256 0413fafe83159f11a1f80a7628c77f449a64294623514552ef486ecebf265823

Encoding: `utf-8`. Original bytes: 918.

````````````text
{
  "original_error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
  "observation": {
    "at_utc": "2026-09-08T04:23:29.898043+00:00",
    "complete": true,
    "root_identity": {
      "pid": 55473,
      "start_abstime": 33464268130394
    },
    "processes": [
      {
        "pid": 55473,
        "start_abstime": 33464268130394,
        "exit_abstime": 0,
        "physical_footprint_bytes": 7202034152,
        "resident_size_bytes": 1674706944
      }
    ],
    "classification": "Failure-time diagnostic only; not a sampled peak or admission/cleanup proof",
    "sum_process_footprints_bytes": 7202034152,
    "sum_process_resident_sizes_bytes": 1674706944,
    "sum_scope": "Sum of OS charges to these processes; not unique system memory or free/reclaimable memory.",
    "elapsed_seconds": 0.0373723750000039
  },
  "original_failure_preserved": true
}

````````````

## Artifact SHA-256 9c149033cd0ef36de483e11d1b0bc97d0027d901daa7d825badf09026bdebbd6

Encoding: `utf-8`. Original bytes: 43879.

````````````text
{
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
    "maximum_build_seconds": 900,
    "stop_on_new_swapouts": false
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 15558950912,
    "swapins": 44130047,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    92431.\nPages active:                                1005889.\nPages inactive:                               951688.\nPages speculative:                             72043.\nPages throttled:                                   0.\nPages wired down:                             226877.\nPages purgeable:                               19124.\n\"Translation faults\":                    16889585468.\nPages copy-on-write:                       875479433.\nPages zero filled:                       22664015359.\nPages reactivated:                        3736554280.\nPages purged:                               79173481.\nFile-backed pages:                            838088.\nAnonymous pages:                             1191532.\nPages stored in compressor:                  1622385.\nPages occupied by compressor:                 736126.\nDecompressions:                           1278877611.\nCompressions:                             1602412867.\nPageins:                                  8057003180.\nPageouts:                                   11392302.\nSwapins:                                    44130047.\nSwapouts:                                   77538158.\nPages tagged:                                 179661.\nPages tagged resident:                        139670.\nPages tagged compressed:                       39991.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6992.\nPages tag-storage free:                          414.\nPages tag-storage non-tag pageable:            90890.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6392640.\nTagged compressions:                        12437748.\nTagged decompressions:                      11486774.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0017632500000000217,
      "owned_rss_bytes": 32768,
      "owned_process_count": 1,
      "reclaimable_bytes": 15559868416,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 0.22521625,
      "owned_rss_bytes": 32768,
      "owned_process_count": 1,
      "reclaimable_bytes": 15558328320,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 0.47415366700000006,
      "owned_rss_bytes": 32768,
      "owned_process_count": 1,
      "reclaimable_bytes": 15347712000,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 0.709091542,
      "owned_rss_bytes": 807600128,
      "owned_process_count": 1,
      "reclaimable_bytes": 14225752064,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 0.949518625,
      "owned_rss_bytes": 3890708480,
      "owned_process_count": 1,
      "reclaimable_bytes": 9628434432,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 1.1842115830000002,
      "owned_rss_bytes": 4198989824,
      "owned_process_count": 1,
      "reclaimable_bytes": 9383886848,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 1.421932125,
      "owned_rss_bytes": 4237688832,
      "owned_process_count": 1,
      "reclaimable_bytes": 9387851776,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 1.6527820000000002,
      "owned_rss_bytes": 4278255616,
      "owned_process_count": 1,
      "reclaimable_bytes": 9375662080,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 1.888935917,
      "owned_rss_bytes": 4278550528,
      "owned_process_count": 1,
      "reclaimable_bytes": 9350316032,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 2.125801125,
      "owned_rss_bytes": 4288561152,
      "owned_process_count": 1,
      "reclaimable_bytes": 9332342784,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 2.3521847080000002,
      "owned_rss_bytes": 4417437696,
      "owned_process_count": 1,
      "reclaimable_bytes": 9313878016,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 2.584098542,
      "owned_rss_bytes": 4392697856,
      "owned_process_count": 1,
      "reclaimable_bytes": 9375285248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 2.817232042,
      "owned_rss_bytes": 4394057728,
      "owned_process_count": 1,
      "reclaimable_bytes": 9365553152,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 3.04362325,
      "owned_rss_bytes": 4394106880,
      "owned_process_count": 1,
      "reclaimable_bytes": 9354166272,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 3.268999167,
      "owned_rss_bytes": 4394156032,
      "owned_process_count": 1,
      "reclaimable_bytes": 9348743168,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 3.497856833,
      "owned_rss_bytes": 4394270720,
      "owned_process_count": 1,
      "reclaimable_bytes": 9333538816,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 3.7268049580000002,
      "owned_rss_bytes": 4394385408,
      "owned_process_count": 1,
      "reclaimable_bytes": 9320333312,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 3.9539520830000003,
      "owned_rss_bytes": 4394614784,
      "owned_process_count": 1,
      "reclaimable_bytes": 9310502912,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 4.177516832999999,
      "owned_rss_bytes": 4394926080,
      "owned_process_count": 1,
      "reclaimable_bytes": 9315336192,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 4.404545375,
      "owned_rss_bytes": 4395089920,
      "owned_process_count": 1,
      "reclaimable_bytes": 9472933888,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 4.633456417,
      "owned_rss_bytes": 4395302912,
      "owned_process_count": 1,
      "reclaimable_bytes": 9493708800,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 4.866548333,
      "owned_rss_bytes": 4395532288,
      "owned_process_count": 1,
      "reclaimable_bytes": 9494167552,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 5.090338,
      "owned_rss_bytes": 4395761664,
      "owned_process_count": 1,
      "reclaimable_bytes": 9490694144,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 5.315073792,
      "owned_rss_bytes": 4817977344,
      "owned_process_count": 1,
      "reclaimable_bytes": 9281060864,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 5.5490144169999995,
      "owned_rss_bytes": 4800757760,
      "owned_process_count": 1,
      "reclaimable_bytes": 9284943872,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 5.790845999999999,
      "owned_rss_bytes": 4771971072,
      "owned_process_count": 1,
      "reclaimable_bytes": 9275293696,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 6.030637583,
      "owned_rss_bytes": 4860526592,
      "owned_process_count": 1,
      "reclaimable_bytes": 9306931200,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 6.283548499999999,
      "owned_rss_bytes": 3965206528,
      "owned_process_count": 1,
      "reclaimable_bytes": 9204023296,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 6.5151052499999995,
      "owned_rss_bytes": 3967107072,
      "owned_process_count": 1,
      "reclaimable_bytes": 9392881664,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 6.7536165,
      "owned_rss_bytes": 3968188416,
      "owned_process_count": 1,
      "reclaimable_bytes": 9315909632,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 6.988062875,
      "owned_rss_bytes": 3969105920,
      "owned_process_count": 1,
      "reclaimable_bytes": 9157181440,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 7.217376832999999,
      "owned_rss_bytes": 3969122304,
      "owned_process_count": 1,
      "reclaimable_bytes": 9219883008,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 7.446943167,
      "owned_rss_bytes": 3969712128,
      "owned_process_count": 1,
      "reclaimable_bytes": 9371107328,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 7.683158625,
      "owned_rss_bytes": 3970023424,
      "owned_process_count": 1,
      "reclaimable_bytes": 9319448576,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 7.917475124999999,
      "owned_rss_bytes": 3970629632,
      "owned_process_count": 1,
      "reclaimable_bytes": 9344565248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 8.150000833,
      "owned_rss_bytes": 3970662400,
      "owned_process_count": 1,
      "reclaimable_bytes": 9311092736,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 8.380771208,
      "owned_rss_bytes": 3970695168,
      "owned_process_count": 1,
      "reclaimable_bytes": 9310044160,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 8.608103625,
      "owned_rss_bytes": 3970777088,
      "owned_process_count": 1,
      "reclaimable_bytes": 9300066304,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 8.841454125,
      "owned_rss_bytes": 3970940928,
      "owned_process_count": 1,
      "reclaimable_bytes": 9345351680,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 9.077714457999999,
      "owned_rss_bytes": 3970580480,
      "owned_process_count": 1,
      "reclaimable_bytes": 9354280960,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 9.304993167,
      "owned_rss_bytes": 4064149504,
      "owned_process_count": 1,
      "reclaimable_bytes": 9492168704,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 9.535495375,
      "owned_rss_bytes": 3957211136,
      "owned_process_count": 1,
      "reclaimable_bytes": 9635250176,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 9.766041458,
      "owned_rss_bytes": 3956768768,
      "owned_process_count": 1,
      "reclaimable_bytes": 9626484736,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 10.006724208,
      "owned_rss_bytes": 3955441664,
      "owned_process_count": 1,
      "reclaimable_bytes": 9575989248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 10.243814667,
      "owned_rss_bytes": 3955474432,
      "owned_process_count": 1,
      "reclaimable_bytes": 9575940096,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 10.475144083,
      "owned_rss_bytes": 3955507200,
      "owned_process_count": 1,
      "reclaimable_bytes": 9617113088,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 10.707776041999999,
      "owned_rss_bytes": 3955605504,
      "owned_process_count": 1,
      "reclaimable_bytes": 9594273792,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 10.937071625,
      "owned_rss_bytes": 3955736576,
      "owned_process_count": 1,
      "reclaimable_bytes": 9579364352,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 11.170729625,
      "owned_rss_bytes": 3955834880,
      "owned_process_count": 1,
      "reclaimable_bytes": 9659891712,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 11.399209958,
      "owned_rss_bytes": 3955867648,
      "owned_process_count": 1,
      "reclaimable_bytes": 9680945152,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 11.624455667,
      "owned_rss_bytes": 3956326400,
      "owned_process_count": 1,
      "reclaimable_bytes": 9490186240,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 11.8561705,
      "owned_rss_bytes": 3956359168,
      "owned_process_count": 1,
      "reclaimable_bytes": 9347727360,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 12.093097375,
      "owned_rss_bytes": 3956719616,
      "owned_process_count": 1,
      "reclaimable_bytes": 9199353856,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 12.318419458,
      "owned_rss_bytes": 3956490240,
      "owned_process_count": 1,
      "reclaimable_bytes": 9162850304,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 12.544169542,
      "owned_rss_bytes": 3956506624,
      "owned_process_count": 1,
      "reclaimable_bytes": 9208823808,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 12.777773374999999,
      "owned_rss_bytes": 3956523008,
      "owned_process_count": 1,
      "reclaimable_bytes": 9148694528,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 13.01029075,
      "owned_rss_bytes": 3956768768,
      "owned_process_count": 1,
      "reclaimable_bytes": 9309765632,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 13.238287249999999,
      "owned_rss_bytes": 3956867072,
      "owned_process_count": 1,
      "reclaimable_bytes": 9481781248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 13.462416832999999,
      "owned_rss_bytes": 3956785152,
      "owned_process_count": 1,
      "reclaimable_bytes": 9574760448,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 13.690698874999999,
      "owned_rss_bytes": 3956834304,
      "owned_process_count": 1,
      "reclaimable_bytes": 9418293248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 13.916096792,
      "owned_rss_bytes": 3956916224,
      "owned_process_count": 1,
      "reclaimable_bytes": 9419702272,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 14.139957875,
      "owned_rss_bytes": 3956998144,
      "owned_process_count": 1,
      "reclaimable_bytes": 9412345856,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 14.3702645,
      "owned_rss_bytes": 3957063680,
      "owned_process_count": 1,
      "reclaimable_bytes": 9416966144,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 14.597622083,
      "owned_rss_bytes": 3957506048,
      "owned_process_count": 1,
      "reclaimable_bytes": 9648570368,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 14.825215542,
      "owned_rss_bytes": 3957473280,
      "owned_process_count": 1,
      "reclaimable_bytes": 10071883776,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 15.064414916999999,
      "owned_rss_bytes": 3957686272,
      "owned_process_count": 1,
      "reclaimable_bytes": 10619191296,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 15.341489958,
      "owned_rss_bytes": 3951869952,
      "owned_process_count": 1,
      "reclaimable_bytes": 11216863232,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 15.615676666999999,
      "owned_rss_bytes": 3944005632,
      "owned_process_count": 1,
      "reclaimable_bytes": 11516936192,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 15.848763083,
      "owned_rss_bytes": 3588997120,
      "owned_process_count": 1,
      "reclaimable_bytes": 11575410688,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 16.091552167,
      "owned_rss_bytes": 3301769216,
      "owned_process_count": 1,
      "reclaimable_bytes": 11780587520,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 16.324478667,
      "owned_rss_bytes": 3309699072,
      "owned_process_count": 1,
      "reclaimable_bytes": 11901960192,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 16.562218667,
      "owned_rss_bytes": 3305160704,
      "owned_process_count": 1,
      "reclaimable_bytes": 12351913984,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 16.819646291999998,
      "owned_rss_bytes": 3307585536,
      "owned_process_count": 1,
      "reclaimable_bytes": 12678905856,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 17.057402958,
      "owned_rss_bytes": 3307601920,
      "owned_process_count": 1,
      "reclaimable_bytes": 12871319552,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 17.293095292,
      "owned_rss_bytes": 2758557696,
      "owned_process_count": 1,
      "reclaimable_bytes": 13006684160,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 17.576867208,
      "owned_rss_bytes": 1889812480,
      "owned_process_count": 1,
      "reclaimable_bytes": 13187022848,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 17.816383208,
      "owned_rss_bytes": 1784512512,
      "owned_process_count": 1,
      "reclaimable_bytes": 13556989952,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 18.066067083,
      "owned_rss_bytes": 1774419968,
      "owned_process_count": 1,
      "reclaimable_bytes": 13754269696,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 18.305508708,
      "owned_rss_bytes": 1726283776,
      "owned_process_count": 1,
      "reclaimable_bytes": 13960560640,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 18.552139458,
      "owned_rss_bytes": 1844756480,
      "owned_process_count": 1,
      "reclaimable_bytes": 13842759680,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 18.784563792,
      "owned_rss_bytes": 1727676416,
      "owned_process_count": 1,
      "reclaimable_bytes": 14150696960,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 19.037294583,
      "owned_rss_bytes": 1727561728,
      "owned_process_count": 1,
      "reclaimable_bytes": 14116798464,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 19.278188583,
      "owned_rss_bytes": 1727922176,
      "owned_process_count": 1,
      "reclaimable_bytes": 14084014080,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 19.5086195,
      "owned_rss_bytes": 1727971328,
      "owned_process_count": 1,
      "reclaimable_bytes": 14286716928,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 19.749315375,
      "owned_rss_bytes": 1728004096,
      "owned_process_count": 1,
      "reclaimable_bytes": 14291681280,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 19.987325417,
      "owned_rss_bytes": 1728053248,
      "owned_process_count": 1,
      "reclaimable_bytes": 14334967808,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 20.225714625,
      "owned_rss_bytes": 1728069632,
      "owned_process_count": 1,
      "reclaimable_bytes": 14241464320,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 20.4579715,
      "owned_rss_bytes": 1728086016,
      "owned_process_count": 1,
      "reclaimable_bytes": 14256275456,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 20.689556708,
      "owned_rss_bytes": 1728282624,
      "owned_process_count": 1,
      "reclaimable_bytes": 14308786176,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 20.926684833,
      "owned_rss_bytes": 1728331776,
      "owned_process_count": 1,
      "reclaimable_bytes": 14326087680,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 21.155274249999998,
      "owned_rss_bytes": 1728331776,
      "owned_process_count": 1,
      "reclaimable_bytes": 14304788480,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 21.389817042,
      "owned_rss_bytes": 1728151552,
      "owned_process_count": 1,
      "reclaimable_bytes": 14334836736,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 21.619770167,
      "owned_rss_bytes": 1728167936,
      "owned_process_count": 1,
      "reclaimable_bytes": 14375239680,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 21.852461083,
      "owned_rss_bytes": 1728331776,
      "owned_process_count": 1,
      "reclaimable_bytes": 14481571840,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 22.081923833,
      "owned_rss_bytes": 1728364544,
      "owned_process_count": 1,
      "reclaimable_bytes": 14532034560,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 22.309765667,
      "owned_rss_bytes": 1728446464,
      "owned_process_count": 1,
      "reclaimable_bytes": 14537457664,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 22.534009708,
      "owned_rss_bytes": 1728512000,
      "owned_process_count": 1,
      "reclaimable_bytes": 14526152704,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 22.765804417,
      "owned_rss_bytes": 1728577536,
      "owned_process_count": 1,
      "reclaimable_bytes": 14513586176,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 22.990826166999998,
      "owned_rss_bytes": 1728659456,
      "owned_process_count": 1,
      "reclaimable_bytes": 14474067968,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 23.220561542,
      "owned_rss_bytes": 1728610304,
      "owned_process_count": 1,
      "reclaimable_bytes": 14631436288,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 23.460967791999998,
      "owned_rss_bytes": 1728626688,
      "owned_process_count": 1,
      "reclaimable_bytes": 14462746624,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 23.693979,
      "owned_rss_bytes": 1728692224,
      "owned_process_count": 1,
      "reclaimable_bytes": 14558904320,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 23.932701667,
      "owned_rss_bytes": 1728692224,
      "owned_process_count": 1,
      "reclaimable_bytes": 14447935488,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 24.161734875,
      "owned_rss_bytes": 1728692224,
      "owned_process_count": 1,
      "reclaimable_bytes": 14446641152,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 24.387574833,
      "owned_rss_bytes": 1728724992,
      "owned_process_count": 1,
      "reclaimable_bytes": 14490828800,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 24.613119167,
      "owned_rss_bytes": 1728331776,
      "owned_process_count": 1,
      "reclaimable_bytes": 14572896256,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 24.851624375,
      "owned_rss_bytes": 1728364544,
      "owned_process_count": 1,
      "reclaimable_bytes": 14605123584,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 25.085917166999998,
      "owned_rss_bytes": 1728364544,
      "owned_process_count": 1,
      "reclaimable_bytes": 14426636288,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 25.322435291999998,
      "owned_rss_bytes": 1728380928,
      "owned_process_count": 1,
      "reclaimable_bytes": 14447312896,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 25.56267475,
      "owned_rss_bytes": 1728544768,
      "owned_process_count": 1,
      "reclaimable_bytes": 14487601152,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 25.797541458,
      "owned_rss_bytes": 1728593920,
      "owned_process_count": 1,
      "reclaimable_bytes": 14654062592,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 26.030096916999998,
      "owned_rss_bytes": 1763934208,
      "owned_process_count": 1,
      "reclaimable_bytes": 14765506560,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 26.280229207999998,
      "owned_rss_bytes": 1731739648,
      "owned_process_count": 1,
      "reclaimable_bytes": 14906703872,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 26.516940125,
      "owned_rss_bytes": 1731739648,
      "owned_process_count": 1,
      "reclaimable_bytes": 14856880128,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 26.759150625,
      "owned_rss_bytes": 1731756032,
      "owned_process_count": 1,
      "reclaimable_bytes": 14565474304,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 26.992997875,
      "owned_rss_bytes": 1731772416,
      "owned_process_count": 1,
      "reclaimable_bytes": 14624997376,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 27.220925125,
      "owned_rss_bytes": 1731772416,
      "owned_process_count": 1,
      "reclaimable_bytes": 14601814016,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 27.455974208,
      "owned_rss_bytes": 1731805184,
      "owned_process_count": 1,
      "reclaimable_bytes": 14497316864,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 27.683167542,
      "owned_rss_bytes": 1731805184,
      "owned_process_count": 1,
      "reclaimable_bytes": 14429732864,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 27.918029292,
      "owned_rss_bytes": 1731821568,
      "owned_process_count": 1,
      "reclaimable_bytes": 14451605504,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 28.151779583,
      "owned_rss_bytes": 1731821568,
      "owned_process_count": 1,
      "reclaimable_bytes": 14491762688,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 28.387982208,
      "owned_rss_bytes": 1731837952,
      "owned_process_count": 1,
      "reclaimable_bytes": 14492614656,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 28.626808708,
      "owned_rss_bytes": 1731854336,
      "owned_process_count": 1,
      "reclaimable_bytes": 14482522112,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 28.858762792,
      "owned_rss_bytes": 1731903488,
      "owned_process_count": 1,
      "reclaimable_bytes": 14677295104,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 29.08364775,
      "owned_rss_bytes": 1731952640,
      "owned_process_count": 1,
      "reclaimable_bytes": 14695104512,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 29.308171958,
      "owned_rss_bytes": 1732050944,
      "owned_process_count": 1,
      "reclaimable_bytes": 14697201664,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 29.538082333,
      "owned_rss_bytes": 1732132864,
      "owned_process_count": 1,
      "reclaimable_bytes": 14691123200,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 29.765639625,
      "owned_rss_bytes": 1732214784,
      "owned_process_count": 1,
      "reclaimable_bytes": 14688665600,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 29.998739,
      "owned_rss_bytes": 1732280320,
      "owned_process_count": 1,
      "reclaimable_bytes": 14685421568,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 30.224724,
      "owned_rss_bytes": 1732362240,
      "owned_process_count": 1,
      "reclaimable_bytes": 14598684672,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 30.456353375,
      "owned_rss_bytes": 1729232896,
      "owned_process_count": 1,
      "reclaimable_bytes": 14698496000,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 30.699302499999998,
      "owned_rss_bytes": 1729232896,
      "owned_process_count": 1,
      "reclaimable_bytes": 14720843776,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 30.924826624999998,
      "owned_rss_bytes": 1729249280,
      "owned_process_count": 1,
      "reclaimable_bytes": 14733934592,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 31.158795292,
      "owned_rss_bytes": 1729265664,
      "owned_process_count": 1,
      "reclaimable_bytes": 14777974784,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 31.391136541999998,
      "owned_rss_bytes": 1729265664,
      "owned_process_count": 1,
      "reclaimable_bytes": 14692040704,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 31.621249042,
      "owned_rss_bytes": 1729282048,
      "owned_process_count": 1,
      "reclaimable_bytes": 14659354624,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 31.844604583,
      "owned_rss_bytes": 1729314816,
      "owned_process_count": 1,
      "reclaimable_bytes": 14526595072,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 32.074413167,
      "owned_rss_bytes": 1729331200,
      "owned_process_count": 1,
      "reclaimable_bytes": 14452523008,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 32.302123458000004,
      "owned_rss_bytes": 1729331200,
      "owned_process_count": 1,
      "reclaimable_bytes": 14530199552,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 32.545319625000005,
      "owned_rss_bytes": 1729363968,
      "owned_process_count": 1,
      "reclaimable_bytes": 14533427200,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 32.779297292,
      "owned_rss_bytes": 1729380352,
      "owned_process_count": 1,
      "reclaimable_bytes": 14482817024,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 33.008338625,
      "owned_rss_bytes": 1731248128,
      "owned_process_count": 1,
      "reclaimable_bytes": 14638317568,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 33.239368958,
      "owned_rss_bytes": 1732673536,
      "owned_process_count": 1,
      "reclaimable_bytes": 14828093440,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 33.480710875,
      "owned_rss_bytes": 1732689920,
      "owned_process_count": 1,
      "reclaimable_bytes": 14893875200,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 33.724438208,
      "owned_rss_bytes": 1732673536,
      "owned_process_count": 1,
      "reclaimable_bytes": 15054602240,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 33.956249417,
      "owned_rss_bytes": 1732706304,
      "owned_process_count": 1,
      "reclaimable_bytes": 15096233984,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 34.188781125000006,
      "owned_rss_bytes": 1732460544,
      "owned_process_count": 1,
      "reclaimable_bytes": 15274835968,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 34.428944,
      "owned_rss_bytes": 1732460544,
      "owned_process_count": 1,
      "reclaimable_bytes": 15337619456,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 34.668825792,
      "owned_rss_bytes": 1733246976,
      "owned_process_count": 1,
      "reclaimable_bytes": 15546417152,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 34.901458625000004,
      "owned_rss_bytes": 1733263360,
      "owned_process_count": 1,
      "reclaimable_bytes": 15604875264,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 35.127963583,
      "owned_rss_bytes": 1733263360,
      "owned_process_count": 1,
      "reclaimable_bytes": 15751659520,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 35.370535375,
      "owned_rss_bytes": 1733263360,
      "owned_process_count": 1,
      "reclaimable_bytes": 15771566080,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 35.598624333000004,
      "owned_rss_bytes": 1733279744,
      "owned_process_count": 1,
      "reclaimable_bytes": 15835529216,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 35.828676958,
      "owned_rss_bytes": 1733279744,
      "owned_process_count": 1,
      "reclaimable_bytes": 15833661440,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 36.063132167000006,
      "owned_rss_bytes": 1739096064,
      "owned_process_count": 1,
      "reclaimable_bytes": 15882027008,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 36.320555333,
      "owned_rss_bytes": 1736491008,
      "owned_process_count": 1,
      "reclaimable_bytes": 15883567104,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 36.563145167,
      "owned_rss_bytes": 1736507392,
      "owned_process_count": 1,
      "reclaimable_bytes": 15985967104,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 36.799724542,
      "owned_rss_bytes": 1736507392,
      "owned_process_count": 1,
      "reclaimable_bytes": 15848554496,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 37.036597708,
      "owned_rss_bytes": 1736523776,
      "owned_process_count": 1,
      "reclaimable_bytes": 16029237248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 37.277312667000004,
      "owned_rss_bytes": 1736540160,
      "owned_process_count": 1,
      "reclaimable_bytes": 16080158720,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 37.50928883300001,
      "owned_rss_bytes": 1736540160,
      "owned_process_count": 1,
      "reclaimable_bytes": 16298524672,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 37.750746833,
      "owned_rss_bytes": 1736441856,
      "owned_process_count": 1,
      "reclaimable_bytes": 16371646464,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 37.980673125,
      "owned_rss_bytes": 1736359936,
      "owned_process_count": 1,
      "reclaimable_bytes": 16396632064,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 38.217843208000005,
      "owned_rss_bytes": 1736458240,
      "owned_process_count": 1,
      "reclaimable_bytes": 16463626240,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 38.452709417,
      "owned_rss_bytes": 1736441856,
      "owned_process_count": 1,
      "reclaimable_bytes": 16291545088,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 38.68969812500001,
      "owned_rss_bytes": 1736458240,
      "owned_process_count": 1,
      "reclaimable_bytes": 16399810560,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 38.927714667000004,
      "owned_rss_bytes": 1735327744,
      "owned_process_count": 1,
      "reclaimable_bytes": 16363749376,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 39.164069542,
      "owned_rss_bytes": 1738719232,
      "owned_process_count": 1,
      "reclaimable_bytes": 16425123840,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 39.406386583,
      "owned_rss_bytes": 1738735616,
      "owned_process_count": 1,
      "reclaimable_bytes": 16392830976,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 39.646876917,
      "owned_rss_bytes": 1738752000,
      "owned_process_count": 1,
      "reclaimable_bytes": 16564879360,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 39.891085583000006,
      "owned_rss_bytes": 1738752000,
      "owned_process_count": 1,
      "reclaimable_bytes": 16563814400,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 40.130575667,
      "owned_rss_bytes": 1738768384,
      "owned_process_count": 1,
      "reclaimable_bytes": 16393781248,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 40.366934500000006,
      "owned_rss_bytes": 1738784768,
      "owned_process_count": 1,
      "reclaimable_bytes": 16302735360,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 40.605837833,
      "owned_rss_bytes": 1723727872,
      "owned_process_count": 1,
      "reclaimable_bytes": 16452894720,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 40.840569792000004,
      "owned_rss_bytes": 1723351040,
      "owned_process_count": 1,
      "reclaimable_bytes": 16470507520,
      "swapins": 44130047,
      "swapouts": 77538158
    },
    {
      "elapsed_seconds": 41.079963458,
      "owned_rss_bytes": 1680834560,
      "owned_process_count": 1,
      "reclaimable_bytes": 16449634304,
      "swapins": 44130047,
      "swapouts": 77538158
    }
  ],
  "passed": false,
  "classification": "Same complete native commands on new V349 compact-cache/bounded-tail composition with all added assertions. Native correctness only; full serving/resource/long-TPS qualification remains. Fixed 900-second work allowance and 30-second cleanup reserve; no retries or activation. Additive V341 failure observer is explicitly bound; original guard policy is otherwise unchanged.",
  "child_pid": 55473,
  "owned_root_identity": {
    "pid": 55473,
    "start_abstime": 33464268130394
  },
  "error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
  "traceback": "Traceback (most recent call last):\n  File \"/tmp/slotstream-optimization-execution/pressure-footprint-v341/guard_with_footprint.py\", line 140, in guarded_run\n    current = snapshot()\n  File \"/tmp/slotstream-optimization-execution/optional-current-serving-v330/run.py::execute\", line 30, in snapshot\n    value={'prepared_at':now(),'build':build,'dependencies':{str(p):digest(p) for p in dependencies},'executor_sha256':digest(Path(__file__)),'native_specs':NATIVE,'commands':{k:[str(BINARY),'optimization-state-check','--variant',v[0],'--model',MODEL,'--json'] for k,v in NATIVE.items()},'environment':{},'seconds':SECONDS,'policy':dict(c.NATIVE_POLICY,maximum_build_seconds=SECONDS),'classification':'Same complete native commands on new V349 compact-cache/bounded-tail composition with all added assertions. Native correctness only; full serving/resource/long-TPS qualification remains. Fixed 900-second work allowance and 30-second cleanup reserve; no retries or activation. Additive V341 failure observer is explicitly bound; original guard policy is otherwise unchanged.'}\n  File \"/Users/carlos/Projects/slotstream/Tools/optimization_readiness.py\", line 20, in require_normal\n    raise RuntimeError(f'OS memory pressure is not normal (observed level={level!r}); '\nRuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible\n",
  "failure_footprint": {
    "original_error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
    "observation": {
      "at_utc": "2026-09-08T04:23:29.898043+00:00",
      "complete": true,
      "root_identity": {
        "pid": 55473,
        "start_abstime": 33464268130394
      },
      "processes": [
        {
          "pid": 55473,
          "start_abstime": 33464268130394,
          "exit_abstime": 0,
          "physical_footprint_bytes": 7202034152,
          "resident_size_bytes": 1674706944
        }
      ],
      "classification": "Failure-time diagnostic only; not a sampled peak or admission/cleanup proof",
      "sum_process_footprints_bytes": 7202034152,
      "sum_process_resident_sizes_bytes": 1674706944,
      "sum_scope": "Sum of OS charges to these processes; not unique system memory or free/reclaimable memory.",
      "elapsed_seconds": 0.0373723750000039
    },
    "original_failure_preserved": true
  },
  "owned_groups": [
    55473
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 41.640300542000006,
  "child_exit_code": -15,
  "after_cleanup_error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible"
}

````````````

## Artifact SHA-256 bfd11e1d4908de85844d2241ffd0c3f8aa79972dbcbab4048af982d9c86ce72d

Encoding: `utf-8`. Original bytes: 29712.

````````````text
{"elapsed_seconds": 0.0017632500000000217, "owned_rss_bytes": 32768, "owned_process_count": 1, "reclaimable_bytes": 15559868416, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 0.22521625, "owned_rss_bytes": 32768, "owned_process_count": 1, "reclaimable_bytes": 15558328320, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 0.47415366700000006, "owned_rss_bytes": 32768, "owned_process_count": 1, "reclaimable_bytes": 15347712000, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 0.709091542, "owned_rss_bytes": 807600128, "owned_process_count": 1, "reclaimable_bytes": 14225752064, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 0.949518625, "owned_rss_bytes": 3890708480, "owned_process_count": 1, "reclaimable_bytes": 9628434432, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 1.1842115830000002, "owned_rss_bytes": 4198989824, "owned_process_count": 1, "reclaimable_bytes": 9383886848, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 1.421932125, "owned_rss_bytes": 4237688832, "owned_process_count": 1, "reclaimable_bytes": 9387851776, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 1.6527820000000002, "owned_rss_bytes": 4278255616, "owned_process_count": 1, "reclaimable_bytes": 9375662080, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 1.888935917, "owned_rss_bytes": 4278550528, "owned_process_count": 1, "reclaimable_bytes": 9350316032, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 2.125801125, "owned_rss_bytes": 4288561152, "owned_process_count": 1, "reclaimable_bytes": 9332342784, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 2.3521847080000002, "owned_rss_bytes": 4417437696, "owned_process_count": 1, "reclaimable_bytes": 9313878016, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 2.584098542, "owned_rss_bytes": 4392697856, "owned_process_count": 1, "reclaimable_bytes": 9375285248, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 2.817232042, "owned_rss_bytes": 4394057728, "owned_process_count": 1, "reclaimable_bytes": 9365553152, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 3.04362325, "owned_rss_bytes": 4394106880, "owned_process_count": 1, "reclaimable_bytes": 9354166272, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 3.268999167, "owned_rss_bytes": 4394156032, "owned_process_count": 1, "reclaimable_bytes": 9348743168, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 3.497856833, "owned_rss_bytes": 4394270720, "owned_process_count": 1, "reclaimable_bytes": 9333538816, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 3.7268049580000002, "owned_rss_bytes": 4394385408, "owned_process_count": 1, "reclaimable_bytes": 9320333312, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 3.9539520830000003, "owned_rss_bytes": 4394614784, "owned_process_count": 1, "reclaimable_bytes": 9310502912, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 4.177516832999999, "owned_rss_bytes": 4394926080, "owned_process_count": 1, "reclaimable_bytes": 9315336192, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 4.404545375, "owned_rss_bytes": 4395089920, "owned_process_count": 1, "reclaimable_bytes": 9472933888, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 4.633456417, "owned_rss_bytes": 4395302912, "owned_process_count": 1, "reclaimable_bytes": 9493708800, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 4.866548333, "owned_rss_bytes": 4395532288, "owned_process_count": 1, "reclaimable_bytes": 9494167552, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 5.090338, "owned_rss_bytes": 4395761664, "owned_process_count": 1, "reclaimable_bytes": 9490694144, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 5.315073792, "owned_rss_bytes": 4817977344, "owned_process_count": 1, "reclaimable_bytes": 9281060864, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 5.5490144169999995, "owned_rss_bytes": 4800757760, "owned_process_count": 1, "reclaimable_bytes": 9284943872, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 5.790845999999999, "owned_rss_bytes": 4771971072, "owned_process_count": 1, "reclaimable_bytes": 9275293696, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 6.030637583, "owned_rss_bytes": 4860526592, "owned_process_count": 1, "reclaimable_bytes": 9306931200, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 6.283548499999999, "owned_rss_bytes": 3965206528, "owned_process_count": 1, "reclaimable_bytes": 9204023296, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 6.5151052499999995, "owned_rss_bytes": 3967107072, "owned_process_count": 1, "reclaimable_bytes": 9392881664, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 6.7536165, "owned_rss_bytes": 3968188416, "owned_process_count": 1, "reclaimable_bytes": 9315909632, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 6.988062875, "owned_rss_bytes": 3969105920, "owned_process_count": 1, "reclaimable_bytes": 9157181440, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 7.217376832999999, "owned_rss_bytes": 3969122304, "owned_process_count": 1, "reclaimable_bytes": 9219883008, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 7.446943167, "owned_rss_bytes": 3969712128, "owned_process_count": 1, "reclaimable_bytes": 9371107328, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 7.683158625, "owned_rss_bytes": 3970023424, "owned_process_count": 1, "reclaimable_bytes": 9319448576, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 7.917475124999999, "owned_rss_bytes": 3970629632, "owned_process_count": 1, "reclaimable_bytes": 9344565248, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 8.150000833, "owned_rss_bytes": 3970662400, "owned_process_count": 1, "reclaimable_bytes": 9311092736, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 8.380771208, "owned_rss_bytes": 3970695168, "owned_process_count": 1, "reclaimable_bytes": 9310044160, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 8.608103625, "owned_rss_bytes": 3970777088, "owned_process_count": 1, "reclaimable_bytes": 9300066304, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 8.841454125, "owned_rss_bytes": 3970940928, "owned_process_count": 1, "reclaimable_bytes": 9345351680, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 9.077714457999999, "owned_rss_bytes": 3970580480, "owned_process_count": 1, "reclaimable_bytes": 9354280960, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 9.304993167, "owned_rss_bytes": 4064149504, "owned_process_count": 1, "reclaimable_bytes": 9492168704, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 9.535495375, "owned_rss_bytes": 3957211136, "owned_process_count": 1, "reclaimable_bytes": 9635250176, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 9.766041458, "owned_rss_bytes": 3956768768, "owned_process_count": 1, "reclaimable_bytes": 9626484736, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 10.006724208, "owned_rss_bytes": 3955441664, "owned_process_count": 1, "reclaimable_bytes": 9575989248, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 10.243814667, "owned_rss_bytes": 3955474432, "owned_process_count": 1, "reclaimable_bytes": 9575940096, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 10.475144083, "owned_rss_bytes": 3955507200, "owned_process_count": 1, "reclaimable_bytes": 9617113088, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 10.707776041999999, "owned_rss_bytes": 3955605504, "owned_process_count": 1, "reclaimable_bytes": 9594273792, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 10.937071625, "owned_rss_bytes": 3955736576, "owned_process_count": 1, "reclaimable_bytes": 9579364352, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 11.170729625, "owned_rss_bytes": 3955834880, "owned_process_count": 1, "reclaimable_bytes": 9659891712, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 11.399209958, "owned_rss_bytes": 3955867648, "owned_process_count": 1, "reclaimable_bytes": 9680945152, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 11.624455667, "owned_rss_bytes": 3956326400, "owned_process_count": 1, "reclaimable_bytes": 9490186240, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 11.8561705, "owned_rss_bytes": 3956359168, "owned_process_count": 1, "reclaimable_bytes": 9347727360, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 12.093097375, "owned_rss_bytes": 3956719616, "owned_process_count": 1, "reclaimable_bytes": 9199353856, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 12.318419458, "owned_rss_bytes": 3956490240, "owned_process_count": 1, "reclaimable_bytes": 9162850304, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 12.544169542, "owned_rss_bytes": 3956506624, "owned_process_count": 1, "reclaimable_bytes": 9208823808, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 12.777773374999999, "owned_rss_bytes": 3956523008, "owned_process_count": 1, "reclaimable_bytes": 9148694528, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 13.01029075, "owned_rss_bytes": 3956768768, "owned_process_count": 1, "reclaimable_bytes": 9309765632, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 13.238287249999999, "owned_rss_bytes": 3956867072, "owned_process_count": 1, "reclaimable_bytes": 9481781248, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 13.462416832999999, "owned_rss_bytes": 3956785152, "owned_process_count": 1, "reclaimable_bytes": 9574760448, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 13.690698874999999, "owned_rss_bytes": 3956834304, "owned_process_count": 1, "reclaimable_bytes": 9418293248, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 13.916096792, "owned_rss_bytes": 3956916224, "owned_process_count": 1, "reclaimable_bytes": 9419702272, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 14.139957875, "owned_rss_bytes": 3956998144, "owned_process_count": 1, "reclaimable_bytes": 9412345856, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 14.3702645, "owned_rss_bytes": 3957063680, "owned_process_count": 1, "reclaimable_bytes": 9416966144, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 14.597622083, "owned_rss_bytes": 3957506048, "owned_process_count": 1, "reclaimable_bytes": 9648570368, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 14.825215542, "owned_rss_bytes": 3957473280, "owned_process_count": 1, "reclaimable_bytes": 10071883776, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 15.064414916999999, "owned_rss_bytes": 3957686272, "owned_process_count": 1, "reclaimable_bytes": 10619191296, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 15.341489958, "owned_rss_bytes": 3951869952, "owned_process_count": 1, "reclaimable_bytes": 11216863232, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 15.615676666999999, "owned_rss_bytes": 3944005632, "owned_process_count": 1, "reclaimable_bytes": 11516936192, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 15.848763083, "owned_rss_bytes": 3588997120, "owned_process_count": 1, "reclaimable_bytes": 11575410688, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 16.091552167, "owned_rss_bytes": 3301769216, "owned_process_count": 1, "reclaimable_bytes": 11780587520, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 16.324478667, "owned_rss_bytes": 3309699072, "owned_process_count": 1, "reclaimable_bytes": 11901960192, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 16.562218667, "owned_rss_bytes": 3305160704, "owned_process_count": 1, "reclaimable_bytes": 12351913984, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 16.819646291999998, "owned_rss_bytes": 3307585536, "owned_process_count": 1, "reclaimable_bytes": 12678905856, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 17.057402958, "owned_rss_bytes": 3307601920, "owned_process_count": 1, "reclaimable_bytes": 12871319552, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 17.293095292, "owned_rss_bytes": 2758557696, "owned_process_count": 1, "reclaimable_bytes": 13006684160, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 17.576867208, "owned_rss_bytes": 1889812480, "owned_process_count": 1, "reclaimable_bytes": 13187022848, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 17.816383208, "owned_rss_bytes": 1784512512, "owned_process_count": 1, "reclaimable_bytes": 13556989952, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 18.066067083, "owned_rss_bytes": 1774419968, "owned_process_count": 1, "reclaimable_bytes": 13754269696, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 18.305508708, "owned_rss_bytes": 1726283776, "owned_process_count": 1, "reclaimable_bytes": 13960560640, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 18.552139458, "owned_rss_bytes": 1844756480, "owned_process_count": 1, "reclaimable_bytes": 13842759680, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 18.784563792, "owned_rss_bytes": 1727676416, "owned_process_count": 1, "reclaimable_bytes": 14150696960, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 19.037294583, "owned_rss_bytes": 1727561728, "owned_process_count": 1, "reclaimable_bytes": 14116798464, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 19.278188583, "owned_rss_bytes": 1727922176, "owned_process_count": 1, "reclaimable_bytes": 14084014080, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 19.5086195, "owned_rss_bytes": 1727971328, "owned_process_count": 1, "reclaimable_bytes": 14286716928, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 19.749315375, "owned_rss_bytes": 1728004096, "owned_process_count": 1, "reclaimable_bytes": 14291681280, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 19.987325417, "owned_rss_bytes": 1728053248, "owned_process_count": 1, "reclaimable_bytes": 14334967808, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 20.225714625, "owned_rss_bytes": 1728069632, "owned_process_count": 1, "reclaimable_bytes": 14241464320, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 20.4579715, "owned_rss_bytes": 1728086016, "owned_process_count": 1, "reclaimable_bytes": 14256275456, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 20.689556708, "owned_rss_bytes": 1728282624, "owned_process_count": 1, "reclaimable_bytes": 14308786176, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 20.926684833, "owned_rss_bytes": 1728331776, "owned_process_count": 1, "reclaimable_bytes": 14326087680, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 21.155274249999998, "owned_rss_bytes": 1728331776, "owned_process_count": 1, "reclaimable_bytes": 14304788480, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 21.389817042, "owned_rss_bytes": 1728151552, "owned_process_count": 1, "reclaimable_bytes": 14334836736, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 21.619770167, "owned_rss_bytes": 1728167936, "owned_process_count": 1, "reclaimable_bytes": 14375239680, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 21.852461083, "owned_rss_bytes": 1728331776, "owned_process_count": 1, "reclaimable_bytes": 14481571840, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 22.081923833, "owned_rss_bytes": 1728364544, "owned_process_count": 1, "reclaimable_bytes": 14532034560, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 22.309765667, "owned_rss_bytes": 1728446464, "owned_process_count": 1, "reclaimable_bytes": 14537457664, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 22.534009708, "owned_rss_bytes": 1728512000, "owned_process_count": 1, "reclaimable_bytes": 14526152704, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 22.765804417, "owned_rss_bytes": 1728577536, "owned_process_count": 1, "reclaimable_bytes": 14513586176, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 22.990826166999998, "owned_rss_bytes": 1728659456, "owned_process_count": 1, "reclaimable_bytes": 14474067968, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 23.220561542, "owned_rss_bytes": 1728610304, "owned_process_count": 1, "reclaimable_bytes": 14631436288, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 23.460967791999998, "owned_rss_bytes": 1728626688, "owned_process_count": 1, "reclaimable_bytes": 14462746624, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 23.693979, "owned_rss_bytes": 1728692224, "owned_process_count": 1, "reclaimable_bytes": 14558904320, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 23.932701667, "owned_rss_bytes": 1728692224, "owned_process_count": 1, "reclaimable_bytes": 14447935488, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 24.161734875, "owned_rss_bytes": 1728692224, "owned_process_count": 1, "reclaimable_bytes": 14446641152, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 24.387574833, "owned_rss_bytes": 1728724992, "owned_process_count": 1, "reclaimable_bytes": 14490828800, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 24.613119167, "owned_rss_bytes": 1728331776, "owned_process_count": 1, "reclaimable_bytes": 14572896256, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 24.851624375, "owned_rss_bytes": 1728364544, "owned_process_count": 1, "reclaimable_bytes": 14605123584, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 25.085917166999998, "owned_rss_bytes": 1728364544, "owned_process_count": 1, "reclaimable_bytes": 14426636288, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 25.322435291999998, "owned_rss_bytes": 1728380928, "owned_process_count": 1, "reclaimable_bytes": 14447312896, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 25.56267475, "owned_rss_bytes": 1728544768, "owned_process_count": 1, "reclaimable_bytes": 14487601152, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 25.797541458, "owned_rss_bytes": 1728593920, "owned_process_count": 1, "reclaimable_bytes": 14654062592, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 26.030096916999998, "owned_rss_bytes": 1763934208, "owned_process_count": 1, "reclaimable_bytes": 14765506560, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 26.280229207999998, "owned_rss_bytes": 1731739648, "owned_process_count": 1, "reclaimable_bytes": 14906703872, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 26.516940125, "owned_rss_bytes": 1731739648, "owned_process_count": 1, "reclaimable_bytes": 14856880128, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 26.759150625, "owned_rss_bytes": 1731756032, "owned_process_count": 1, "reclaimable_bytes": 14565474304, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 26.992997875, "owned_rss_bytes": 1731772416, "owned_process_count": 1, "reclaimable_bytes": 14624997376, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 27.220925125, "owned_rss_bytes": 1731772416, "owned_process_count": 1, "reclaimable_bytes": 14601814016, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 27.455974208, "owned_rss_bytes": 1731805184, "owned_process_count": 1, "reclaimable_bytes": 14497316864, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 27.683167542, "owned_rss_bytes": 1731805184, "owned_process_count": 1, "reclaimable_bytes": 14429732864, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 27.918029292, "owned_rss_bytes": 1731821568, "owned_process_count": 1, "reclaimable_bytes": 14451605504, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 28.151779583, "owned_rss_bytes": 1731821568, "owned_process_count": 1, "reclaimable_bytes": 14491762688, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 28.387982208, "owned_rss_bytes": 1731837952, "owned_process_count": 1, "reclaimable_bytes": 14492614656, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 28.626808708, "owned_rss_bytes": 1731854336, "owned_process_count": 1, "reclaimable_bytes": 14482522112, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 28.858762792, "owned_rss_bytes": 1731903488, "owned_process_count": 1, "reclaimable_bytes": 14677295104, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 29.08364775, "owned_rss_bytes": 1731952640, "owned_process_count": 1, "reclaimable_bytes": 14695104512, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 29.308171958, "owned_rss_bytes": 1732050944, "owned_process_count": 1, "reclaimable_bytes": 14697201664, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 29.538082333, "owned_rss_bytes": 1732132864, "owned_process_count": 1, "reclaimable_bytes": 14691123200, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 29.765639625, "owned_rss_bytes": 1732214784, "owned_process_count": 1, "reclaimable_bytes": 14688665600, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 29.998739, "owned_rss_bytes": 1732280320, "owned_process_count": 1, "reclaimable_bytes": 14685421568, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 30.224724, "owned_rss_bytes": 1732362240, "owned_process_count": 1, "reclaimable_bytes": 14598684672, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 30.456353375, "owned_rss_bytes": 1729232896, "owned_process_count": 1, "reclaimable_bytes": 14698496000, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 30.699302499999998, "owned_rss_bytes": 1729232896, "owned_process_count": 1, "reclaimable_bytes": 14720843776, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 30.924826624999998, "owned_rss_bytes": 1729249280, "owned_process_count": 1, "reclaimable_bytes": 14733934592, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 31.158795292, "owned_rss_bytes": 1729265664, "owned_process_count": 1, "reclaimable_bytes": 14777974784, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 31.391136541999998, "owned_rss_bytes": 1729265664, "owned_process_count": 1, "reclaimable_bytes": 14692040704, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 31.621249042, "owned_rss_bytes": 1729282048, "owned_process_count": 1, "reclaimable_bytes": 14659354624, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 31.844604583, "owned_rss_bytes": 1729314816, "owned_process_count": 1, "reclaimable_bytes": 14526595072, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 32.074413167, "owned_rss_bytes": 1729331200, "owned_process_count": 1, "reclaimable_bytes": 14452523008, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 32.302123458000004, "owned_rss_bytes": 1729331200, "owned_process_count": 1, "reclaimable_bytes": 14530199552, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 32.545319625000005, "owned_rss_bytes": 1729363968, "owned_process_count": 1, "reclaimable_bytes": 14533427200, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 32.779297292, "owned_rss_bytes": 1729380352, "owned_process_count": 1, "reclaimable_bytes": 14482817024, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 33.008338625, "owned_rss_bytes": 1731248128, "owned_process_count": 1, "reclaimable_bytes": 14638317568, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 33.239368958, "owned_rss_bytes": 1732673536, "owned_process_count": 1, "reclaimable_bytes": 14828093440, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 33.480710875, "owned_rss_bytes": 1732689920, "owned_process_count": 1, "reclaimable_bytes": 14893875200, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 33.724438208, "owned_rss_bytes": 1732673536, "owned_process_count": 1, "reclaimable_bytes": 15054602240, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 33.956249417, "owned_rss_bytes": 1732706304, "owned_process_count": 1, "reclaimable_bytes": 15096233984, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 34.188781125000006, "owned_rss_bytes": 1732460544, "owned_process_count": 1, "reclaimable_bytes": 15274835968, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 34.428944, "owned_rss_bytes": 1732460544, "owned_process_count": 1, "reclaimable_bytes": 15337619456, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 34.668825792, "owned_rss_bytes": 1733246976, "owned_process_count": 1, "reclaimable_bytes": 15546417152, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 34.901458625000004, "owned_rss_bytes": 1733263360, "owned_process_count": 1, "reclaimable_bytes": 15604875264, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 35.127963583, "owned_rss_bytes": 1733263360, "owned_process_count": 1, "reclaimable_bytes": 15751659520, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 35.370535375, "owned_rss_bytes": 1733263360, "owned_process_count": 1, "reclaimable_bytes": 15771566080, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 35.598624333000004, "owned_rss_bytes": 1733279744, "owned_process_count": 1, "reclaimable_bytes": 15835529216, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 35.828676958, "owned_rss_bytes": 1733279744, "owned_process_count": 1, "reclaimable_bytes": 15833661440, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 36.063132167000006, "owned_rss_bytes": 1739096064, "owned_process_count": 1, "reclaimable_bytes": 15882027008, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 36.320555333, "owned_rss_bytes": 1736491008, "owned_process_count": 1, "reclaimable_bytes": 15883567104, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 36.563145167, "owned_rss_bytes": 1736507392, "owned_process_count": 1, "reclaimable_bytes": 15985967104, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 36.799724542, "owned_rss_bytes": 1736507392, "owned_process_count": 1, "reclaimable_bytes": 15848554496, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 37.036597708, "owned_rss_bytes": 1736523776, "owned_process_count": 1, "reclaimable_bytes": 16029237248, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 37.277312667000004, "owned_rss_bytes": 1736540160, "owned_process_count": 1, "reclaimable_bytes": 16080158720, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 37.50928883300001, "owned_rss_bytes": 1736540160, "owned_process_count": 1, "reclaimable_bytes": 16298524672, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 37.750746833, "owned_rss_bytes": 1736441856, "owned_process_count": 1, "reclaimable_bytes": 16371646464, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 37.980673125, "owned_rss_bytes": 1736359936, "owned_process_count": 1, "reclaimable_bytes": 16396632064, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 38.217843208000005, "owned_rss_bytes": 1736458240, "owned_process_count": 1, "reclaimable_bytes": 16463626240, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 38.452709417, "owned_rss_bytes": 1736441856, "owned_process_count": 1, "reclaimable_bytes": 16291545088, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 38.68969812500001, "owned_rss_bytes": 1736458240, "owned_process_count": 1, "reclaimable_bytes": 16399810560, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 38.927714667000004, "owned_rss_bytes": 1735327744, "owned_process_count": 1, "reclaimable_bytes": 16363749376, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 39.164069542, "owned_rss_bytes": 1738719232, "owned_process_count": 1, "reclaimable_bytes": 16425123840, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 39.406386583, "owned_rss_bytes": 1738735616, "owned_process_count": 1, "reclaimable_bytes": 16392830976, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 39.646876917, "owned_rss_bytes": 1738752000, "owned_process_count": 1, "reclaimable_bytes": 16564879360, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 39.891085583000006, "owned_rss_bytes": 1738752000, "owned_process_count": 1, "reclaimable_bytes": 16563814400, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 40.130575667, "owned_rss_bytes": 1738768384, "owned_process_count": 1, "reclaimable_bytes": 16393781248, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 40.366934500000006, "owned_rss_bytes": 1738784768, "owned_process_count": 1, "reclaimable_bytes": 16302735360, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 40.605837833, "owned_rss_bytes": 1723727872, "owned_process_count": 1, "reclaimable_bytes": 16452894720, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 40.840569792000004, "owned_rss_bytes": 1723351040, "owned_process_count": 1, "reclaimable_bytes": 16470507520, "swapins": 44130047, "swapouts": 77538158}
{"elapsed_seconds": 41.079963458, "owned_rss_bytes": 1680834560, "owned_process_count": 1, "reclaimable_bytes": 16449634304, "swapins": 44130047, "swapouts": 77538158}

````````````

## Artifact SHA-256 5f0cf8ea4589a78608ce1b4d4cc822c018964845332cfe79435520b8dda91f9a

Encoding: `utf-8`. Original bytes: 2615.

````````````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "a00ed901e481a4ddb19792e4494948b2990beed7352b5aa656065fb88c6f00a3",
  "error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
  "elapsed_seconds": 41.651226791,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 23812521984,
    "swapins": 44130047,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   449981.\nPages active:                                 599045.\nPages inactive:                               554508.\nPages speculative:                             42779.\nPages throttled:                                   0.\nPages wired down:                             242457.\nPages purgeable:                                   2.\n\"Translation faults\":                    16890676510.\nPages copy-on-write:                       875582053.\nPages zero filled:                       22672152855.\nPages reactivated:                        3737593825.\nPages purged:                               79194920.\nFile-backed pages:                           1003418.\nAnonymous pages:                              192914.\nPages stored in compressor:                  2517017.\nPages occupied by compressor:                1194879.\nDecompressions:                           1279087654.\nCompressions:                             1603642361.\nPageins:                                  8057588314.\nPageouts:                                   11392416.\nSwapins:                                    44130047.\nSwapouts:                                   77538158.\nPages tagged:                                 176563.\nPages tagged resident:                        119353.\nPages tagged compressed:                       57210.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6972.\nPages tag-storage free:                         2104.\nPages tag-storage non-tag pageable:            89220.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9819840.\nTagged compressions:                        12457304.\nTagged decompressions:                      11489104.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
  "execution_receipt_sha256": "c3c79b68cce427cdc55b18b95350ced9b2816c996894a8a86fcf681d46d70441"
}

````````````

## Artifact SHA-256 c3c79b68cce427cdc55b18b95350ced9b2816c996894a8a86fcf681d46d70441

Encoding: `utf-8`. Original bytes: 2517.

````````````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "a00ed901e481a4ddb19792e4494948b2990beed7352b5aa656065fb88c6f00a3",
  "error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
  "elapsed_seconds": 41.651226791,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 23812521984,
    "swapins": 44130047,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   449981.\nPages active:                                 599045.\nPages inactive:                               554508.\nPages speculative:                             42779.\nPages throttled:                                   0.\nPages wired down:                             242457.\nPages purgeable:                                   2.\n\"Translation faults\":                    16890676510.\nPages copy-on-write:                       875582053.\nPages zero filled:                       22672152855.\nPages reactivated:                        3737593825.\nPages purged:                               79194920.\nFile-backed pages:                           1003418.\nAnonymous pages:                              192914.\nPages stored in compressor:                  2517017.\nPages occupied by compressor:                1194879.\nDecompressions:                           1279087654.\nCompressions:                             1603642361.\nPageins:                                  8057588314.\nPageouts:                                   11392416.\nSwapins:                                    44130047.\nSwapouts:                                   77538158.\nPages tagged:                                 176563.\nPages tagged resident:                        119353.\nPages tagged compressed:                       57210.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6972.\nPages tag-storage free:                         2104.\nPages tag-storage non-tag pageable:            89220.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9819840.\nTagged compressions:                        12457304.\nTagged decompressions:                      11489104.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
}

````````````

## Artifact SHA-256 8454673eede2d8fa3a8883a280b5972f13b8b19361645bd92426cd5eef3bccc0

Encoding: `utf-8`. Original bytes: 169.

````````````text
integrated reference / cached17
integrated reference / boundary255
integrated reference / boundary256
integrated reference / boundary257
integrated reference / long1025

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 bb50e7a3113f9fd131ef7ced9386ffed096dad58214a5b6282e089da563e2c32

Encoding: `utf-8`. Original bytes: 23463.

````````````text
{
  "prepared_at": "2026-09-08T04:22:33.783653+00:00",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "b31945de9dbedd9f0dd4beb39be7d31a6673f18c21619ab1847e5d81ad82c12e",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "512dd096a194f8c56f1d9be16931714035150ca54cbb02cbbb9d0aec5871657d",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "6c34e92eac7476ea5f7a1126ea6bf0eb5eb9b5b9fca8659cc28c2f760476dadf",
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
      "source_archive_sha256": "ff2a4c967bd785261e792d88c63a2d2f71d875e28429c136c258be7e4d58193e",
      "binary_sha256": "7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "dependencies": {
    "/tmp/slotstream-optimization-execution/optional-current-serving-v330/run.py": "5793aa8bcb3af55fb99c9da698475ee54272ee791ccef30141c94ba6c405b95f",
    "/tmp/slotstream-optimization-execution/pressure-footprint-v341/guard_with_footprint.py": "72836a3c6bc03366b6f546c21d1f32636f01373d29a49e2ae2246e5090a0f215",
    "/tmp/slotstream-optimization-execution/pressure-footprint-v341/pressure_footprint.py": "2ff6061c46f588979da498ea67e93b8e6f887a845b6daab2e115da72a367f73e",
    "/tmp/slotstream-optimization-execution/compact-tail-combined-build-v349/lease-result.json": "23428b49ead57a3131ecf534a139f633e60d8825367395d765b4f6308d3121c2",
    "/Users/carlos/Projects/slotstream/Tools/optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "/Users/carlos/Projects/slotstream/Tools/optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "/Users/carlos/Projects/slotstream/Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "/Users/carlos/Projects/slotstream/Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "/Users/carlos/Projects/slotstream/Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "/Users/carlos/Projects/slotstream/Tools/optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "/Users/carlos/Projects/slotstream/Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "/Users/carlos/Projects/slotstream/Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "/Users/carlos/Projects/slotstream/Tools/thermal_readiness.py": "461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048"
  },
  "executor_sha256": "00a4f02b95b2701aae0b3bcd76c7b23d87aed7ed346123ee5f4c5f2427f4ea4b",
  "native_specs": {
    "combined-plain": [
      "integrated",
      "optimization-integrated",
      242
    ],
    "combined-mtp": [
      "integrated-mtp",
      "optimization-integrated-mtp",
      256
    ],
    "read-failure-serving": [
      "read-failure-serving",
      "optimization-read-failure-serving",
      522
    ]
  },
  "commands": {
    "combined-plain": [
      "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "integrated",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ],
    "combined-mtp": [
      "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "integrated-mtp",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ],
    "read-failure-serving": [
      "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "read-failure-serving",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ]
  },
  "environment": {},
  "seconds": 900,
  "policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 10000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 900,
    "stop_on_new_swapouts": false
  },
  "classification": "Same complete native commands on new V349 compact-cache/bounded-tail composition with all added assertions. Native correctness only; full serving/resource/long-TPS qualification remains. Fixed 900-second work allowance and 30-second cleanup reserve; no retries or activation. Additive V341 failure observer is explicitly bound; original guard policy is otherwise unchanged."
}

````````````

## Artifact SHA-256 00a4f02b95b2701aae0b3bcd76c7b23d87aed7ed346123ee5f4c5f2427f4ea4b

Encoding: `utf-8`. Original bytes: 6933.

````````````text
from pathlib import Path
import argparse,datetime,fcntl,importlib.util,inspect,json,os,signal,sys,threading,time
ROOT=Path('/Users/carlos/Projects/slotstream');BASE=Path('/tmp/slotstream-optimization-execution');HERE=Path(__file__).resolve().parent
OUT=ROOT/'.build/optimization/compact-tail-native-v350'
sys.path.insert(0,str(ROOT/'Tools'));sys.path.insert(0,str(BASE/'pressure-footprint-v341'))
import optimization_campaign as c
import thermal_readiness
from optimization_readiness import pressure_snapshot,require_normal
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import competing_jobs,verified_build
from guard_with_footprint import guarded_run
CORE=BASE/'optional-current-serving-v330/run.py'
spec=importlib.util.spec_from_file_location('original_execution',CORE);original=importlib.util.module_from_spec(spec);spec.loader.exec_module(original)
require,now,allowance,readiness=original.require,original.now,original.allowance,original.readiness
# Reuse the exact previously exercised execute function. Its global load and
# guarded_run bind this frozen source family and the additive V341 observer.
EXECUTE_SOURCE=inspect.getsource(original.execute)
exec(compile(EXECUTE_SOURCE,str(CORE)+'::execute','exec'),globals())
NATIVE={'combined-plain':('integrated','optimization-integrated',242),'combined-mtp':('integrated-mtp','optimization-integrated-mtp',256),'read-failure-serving':('read-failure-serving','optimization-read-failure-serving',522)}
BINARY=ROOT/'.build/optimization/compact-tail-combined-build-v349/candidate/slotstream'
MODEL='/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit'
SECONDS=900

def prepare():
 require(not (HERE/'preparation.json').exists() and not OUT.exists(),'already prepared/attempted')
 build=verified_build(BINARY)
 require(build['identity']['binary_sha256']=='7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6','wrong combined build')
 lease=c.read(BASE/'compact-tail-combined-build-v349/lease-result.json');require(lease['passed'] and lease['restored'],'build did not pass/restore')
 dependencies=[CORE,BASE/'pressure-footprint-v341/guard_with_footprint.py',BASE/'pressure-footprint-v341/pressure_footprint.py',BASE/'compact-tail-combined-build-v349/lease-result.json']+[ROOT/'Tools'/x for x in c.DRIVERS+('thermal_readiness.py',)]
 value={'prepared_at':now(),'build':build,'dependencies':{str(p):digest(p) for p in dependencies},'executor_sha256':digest(Path(__file__)),'native_specs':NATIVE,'commands':{k:[str(BINARY),'optimization-state-check','--variant',v[0],'--model',MODEL,'--json'] for k,v in NATIVE.items()},'environment':{},'seconds':SECONDS,'policy':dict(c.NATIVE_POLICY,maximum_build_seconds=SECONDS),'classification':'Same complete native commands on new V349 compact-cache/bounded-tail composition with all added assertions. Native correctness only; full serving/resource/long-TPS qualification remains. Fixed 900-second work allowance and 30-second cleanup reserve; no retries or activation. Additive V341 failure observer is explicitly bound; original guard policy is otherwise unchanged.'}
 c.write_new(HERE/'preparation.json',value)
 return {'prepared':True,'model_launched':False,'cases':list(NATIVE),'protocol_sha256':digest(HERE/'preparation.json')}

def load():
 value=c.read(HERE/'preparation.json')
 require(value['executor_sha256']==digest(Path(__file__)),'executor changed')
 require(all(digest(Path(p))==h for p,h in value['dependencies'].items()),'dependency changed')
 require(verified_build(BINARY)==value['build'],'binary/source/metal identity changed')
 require(value['native_specs']=={k:list(v) for k,v in NATIVE.items()} and value['seconds']==SECONDS and value['policy']==dict(c.NATIVE_POLICY,maximum_build_seconds=SECONDS),'native specification/policy changed')
 require(value['environment']=={} and value['commands']=={k:[str(BINARY),'optimization-state-check','--variant',v[0],'--model',MODEL,'--json'] for k,v in NATIVE.items()},'command/controls changed')
 return value

def assess(name,report):
 items=report.get('items',[])
 require(report.get('name')==NATIVE[name][1] and report.get('passed') is True and report.get('skipped') is None and len(items)>=NATIVE[name][2] and all(x.get('passed') is True for x in items),'full native assertions absent or failing')
 if name.startswith('combined'):
  names={x['name'] for x in items}
  required={f'{arm}: bounded greedy tail selection' for arm in ['false','true']}
  required|={f'{arm}/{case}: {label}' for arm in ['false','true'] for case in ['cached17','boundary255','boundary256','boundary257','long1025','image-before','image-crossing'] for label in ['selected n-gram cache format','n-gram cache contains real rows','exact n-gram cache payload accounting']}
  if name=='combined-mtp':
   required|={f'{arm}: {label}' for arm in ['false','true'] for label in ['terminal draft work is explicit','terminal target work is explicit','terminal verification executes once','terminal forward executes once','bounded output preserves the longer greedy prefix']}
   required.add('two-token MTP integrated output matches reference')
  require(required<=names,'new composition assertions missing')
 return {'passed':True,'completed':True,'qualified':True,'assertions':len(items)}

def run(name,deadline):
 allowance(deadline,SECONDS+30);value=load();target=OUT/name
 require(not target.exists(),'attempted native cannot retry')
 limit,before,thermal=readiness(deadline,SECONDS+30,13)
 attempt={'started_at':now(),'deadline_utc':deadline,'command':value['commands'][name],'environment':{},'build':value['build'],'before':before,'thermal_prelaunch':thermal,'policy':value['policy'],'preparation_sha256':digest(HERE/'preparation.json'),'classification':value['classification']}
 def assessment(code):
  load();require(code==0,'native process failed');return assess(name,c.read(target/'stdout.txt'))
 result=execute(attempt['command'],target,SECONDS,value['policy'],assessment,limit,attempt)
 result['execution_receipt_sha256']=digest(target/'receipt.json');c.write_new(target/'qualification.json',result)
 return result

def main():
 parser=argparse.ArgumentParser();parser.add_argument('action',choices=['prepare','check','native']);parser.add_argument('--name',choices=list(NATIVE));parser.add_argument('--deadline');args=parser.parse_args()
 with (HERE/'.run.lock').open('a') as lock:
  fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
  if args.action=='prepare':result=prepare()
  elif args.action=='check':load();result={'passed':True,'unrun':[n for n in NATIVE if not (OUT/n).exists()]}
  else:require(args.name is not None and args.deadline is not None,'one named case and explicit deadline required');result=run(args.name,args.deadline)
 print(json.dumps({k:v for k,v in result.items() if k not in ['before','after']},indent=2),flush=True)
 return 0 if args.action!='native' or result.get('qualified') else 1
if __name__=='__main__':raise SystemExit(main())

````````````

## Artifact SHA-256 3258de2175a1f21dc52c078a4d674dd057cea8c7bab6f236a1394f7567b0e11f

Encoding: `utf-8`. Original bytes: 3759.

````````````text
{
  "captured_at": "2026-09-08T04:25:17.525419+00:00",
  "case": "V350 combined-plain",
  "qualified": false,
  "reason": "OS memory pressure warning before a completed native assertion report",
  "owned_groups": [
    55473
  ],
  "remaining_owned_members": [],
  "model_lock_free": true,
  "competing_jobs": [],
  "pressure": {
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
  "vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 21954920448,
    "swapins": 44130051,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   304935.\nPages active:                                 723533.\nPages inactive:                               647027.\nPages speculative:                             76268.\nPages throttled:                                   0.\nPages wired down:                             241882.\nPages purgeable:                                1827.\n\"Translation faults\":                    16891512650.\nPages copy-on-write:                       875664089.\nPages zero filled:                       22672418861.\nPages reactivated:                        3737594658.\nPages purged:                               79195963.\nFile-backed pages:                           1033260.\nAnonymous pages:                              413568.\nPages stored in compressor:                  2298775.\nPages occupied by compressor:                1090400.\nDecompressions:                           1279289658.\nCompressions:                             1603642361.\nPageins:                                  8057612942.\nPageouts:                                   11392416.\nSwapins:                                    44130051.\nSwapouts:                                   77538158.\nPages tagged:                                 175183.\nPages tagged resident:                        122010.\nPages tagged compressed:                       53173.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6972.\nPages tag-storage free:                         1363.\nPages tag-storage non-tag pageable:            89961.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9049536.\nTagged compressions:                        12457304.\nTagged decompressions:                      11491913.\n"
  },
  "original_after_cleanup_pressure_error_preserved": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
  "failure_time_footprint": {
    "original_error": "RuntimeError: OS memory pressure is not normal (observed level=2); model work is not eligible",
    "observation": {
      "at_utc": "2026-09-08T04:23:29.898043+00:00",
      "complete": true,
      "root_identity": {
        "pid": 55473,
        "start_abstime": 33464268130394
      },
      "processes": [
        {
          "pid": 55473,
          "start_abstime": 33464268130394,
          "exit_abstime": 0,
          "physical_footprint_bytes": 7202034152,
          "resident_size_bytes": 1674706944
        }
      ],
      "classification": "Failure-time diagnostic only; not a sampled peak or admission/cleanup proof",
      "sum_process_footprints_bytes": 7202034152,
      "sum_process_resident_sizes_bytes": 1674706944,
      "sum_scope": "Sum of OS charges to these processes; not unique system memory or free/reclaimable memory.",
      "elapsed_seconds": 0.0373723750000039
    },
    "original_failure_preserved": true
  },
  "grant_deadline": "2026-09-08T04:40:00Z",
  "no_additional_run_authorized": true
}

````````````
