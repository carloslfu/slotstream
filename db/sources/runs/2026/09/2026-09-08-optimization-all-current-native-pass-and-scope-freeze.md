---
type: run
id: 01m227fhn1bw2j0gcgqw4tnsb1
created: 2026-09-09T04:40:37.281092+00:00
updated: 2026-09-09T04:40:37.749897+00:00
summary: All seven current native cases pass and original full scope cohort freezes
binary: /Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream
captured_at: 2026-09-08
command: V459 scope-lifecycle and scope-mtp-vision under original guards; V467 prepare and freeze only
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: All seven current native cases pass and original full scope cohort freezes
tool: Slotstream exact native and source qualification capture
---
Both fresh expanded native cases pass on the exact V436 candidate: lifecycle 1658 assertions in 395.23099354199996 seconds, MTP/vision 873 in 201.232272542 seconds. The reports include all three actual automatic planner geometries, two memory fallbacks and 4096 MTP prompt tokens. Original assertion coverage, source/binary/driver identity, reservations and cleanup pass. With two V439 geometry cases and three V444 integrations, all seven current-source native cases now pass, totaling 5300 assertions. Earlier pressure stops remain preserved. Test durations are correctness execution time, not speedups. V467 now binds these seven actual proofs and freezes the complete original 32 measured plus 32 first explicit-scope cohort at protocol 9597d8ba4fc007bc4ee0c700746ce34a7f9de8789d6873be84aab012e57964b0. Workloads, acceptance, 10 GB cap, original resource rules and full 15000-second work plus 60-second cleanup allowance remain. Automatic selection is disabled for this mechanism study and separately unqualified. V467 has not yet launched a model.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-lifecycle/attempt.json",
    "bytes": 23450,
    "sha256": "979f27dfafdec05e46ad2dbba94aab45714ac6033c9c525a620347f752e8deb4"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-lifecycle/memory.json",
    "bytes": 348400,
    "sha256": "5b9492b0dc4250bf4626124ce7969aa2d7e74e8b5e1605a3527e970d0d4577fa"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-lifecycle/memory.samples.jsonl",
    "bytes": 266665,
    "sha256": "57d28766558d4dbc4230e368c4b1b67685ebab1fb4cdf5d54271a066cb2d9f34"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-lifecycle/qualification.json",
    "bytes": 2711,
    "sha256": "788824b69831430e94081142ea44a610c337f00e35e4d73eb181d6b6c847948c"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-lifecycle/receipt.json",
    "bytes": 2613,
    "sha256": "0d450c7a1968a22942e85c34bd44917668dbbf26d1d5fc23cb7e8cae7e1b1427"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-lifecycle/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-lifecycle/stdout.txt",
    "bytes": 164299,
    "sha256": "c4498b67714b8e990afe67d22ab94583b2b80307fe4c7b006c32d692c37b3703"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-mtp-vision/attempt.json",
    "bytes": 23451,
    "sha256": "a5abeddb9eabcd77aa375541c9144a49f24a5a4ef700e66d3f020294de94b3e5"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-mtp-vision/memory.json",
    "bytes": 193634,
    "sha256": "49bcaa04ae0873a6c15e4d7ba9af5253f6ec04e61d08f94056f42809a1514d10"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-mtp-vision/memory.samples.jsonl",
    "bytes": 145500,
    "sha256": "2b26b4925dcba7b957405e28d034cc5d684080f6f9cdaad361b4f4694856985e"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-mtp-vision/qualification.json",
    "bytes": 2713,
    "sha256": "3eb6eb61ed5d719546618f9e6ded3fc851d544f03f67d2af90f9d50bd647fdfb"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-mtp-vision/receipt.json",
    "bytes": 2615,
    "sha256": "04a9a857eb62657de609008db9e88619da282bb4d919f27e1f866c246d32a2b2"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-mtp-vision/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-mtp-vision/stdout.txt",
    "bytes": 80443,
    "sha256": "f8cc4841050a940ed9dcc269d4d1014908030cd7cecd78801582ea892d3d457a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/binding.json",
    "bytes": 5282,
    "sha256": "da9d67e8a31793b5820b0f16e6ad1af6f14dba0048b568bb83a739cdcbf2c2b0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/checks.py",
    "bytes": 5575,
    "sha256": "1bfc228892aada52c8d0c352896b19575bb253f6ecf8942a5dd4a92cfe937938"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/checks.stderr",
    "bytes": 111,
    "sha256": "abb737aa8c97ba113accf5affa7612efb794a6d9e6607374f35139f8f66fba08"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/initial/checks.py",
    "bytes": 5575,
    "sha256": "1bfc228892aada52c8d0c352896b19575bb253f6ecf8942a5dd4a92cfe937938"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/initial/checks.stderr",
    "bytes": 1443,
    "sha256": "2c1fe80253e59497370f79f73b5a03cee345f44222bf9a848fabe9048fdc9972"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/initial/checks.stdout",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/initial/run.py",
    "bytes": 15146,
    "sha256": "3e7eaee978e7250da4d7020cb01ffc81c22c7b4a9f24491e99ac382c09b913c8"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/preparation-order.json",
    "bytes": 436,
    "sha256": "c0e87a31ad86b066cd76d75aa9a7f3b02e8065ea54e89c72e506d557227411c8"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/preparation.json",
    "bytes": 67835,
    "sha256": "f35f3b583c95363de208684c3a75bb54271d06f5d918e999067268c28f8b5c5d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/protocol.json",
    "bytes": 10302,
    "sha256": "9597d8ba4fc007bc4ee0c700746ce34a7f9de8789d6873be84aab012e57964b0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/run.py",
    "bytes": 15164,
    "sha256": "062081c5e30c9eda4b0de1d57d93c1907b70edeb4aae8b4c8e806346eb26cc09"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/native-cooling-v469/result.json",
    "bytes": 250,
    "sha256": "35ab11dc7106ec90aacf22fb2a76f5475b83e36214df7f161ea0100e0c8c35db"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/native-cooling-v469/run.py",
    "bytes": 901,
    "sha256": "9ace1ecfbefa9ea843d4613d604b164f9da191fae657bfc469692df3cac4f90f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/native-cooling-v469/samples.jsonl",
    "bytes": 8712,
    "sha256": "c4e2cde7663faf8faed45a89523d67701a7dd491c6e69b330c4a110d59c1ac4d"
  }
]
```

## Artifact SHA-256 979f27dfafdec05e46ad2dbba94aab45714ac6033c9c525a620347f752e8deb4

Encoding: `utf-8`. Original bytes: 23450.

````````````text
{
  "started_at": "2026-09-09T04:11:40.988149+00:00",
  "deadline_utc": "2026-09-09T05:00:00Z",
  "command": [
    "/usr/bin/env",
    "SLOTSTREAM_OPT_WORKSPACE_TILE=1024",
    "SLOTSTREAM_OPT_SCOPE_FRONTIER=1",
    "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "scope-integrated-lifecycle",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "09f19ca477799aa70abbaf1aff6d6d956e4b9e5f126bd08d24a171b9c4e7d1a7",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
        "Sources/Slotstream/MTP.swift": "10b63deee430c1e1d5792221f128bea0a6158161911676679665a168116cf743",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce",
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
        "Sources/Slotstream/RequestControl.swift": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "3073de4167c10667101cf3e46e332632b38303d94b50896d3e4c05dd3eafafd3",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "236415bb0c4650ee8ea5c2c906157cd3e736ebeb718a68f59ca6da4e03ce64cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2",
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
      "source_archive_sha256": "1f8ee35ea3c3a8551b8b9cede882e27798cf06667ae93fe1138a5441fc91d3c1",
      "binary_sha256": "d626d992404099949e57114c3520dc3bf6ca4aef9d6b5860e0b99f4113256b1f",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30797348864,
    "swapins": 44352466,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   330788.\nPages active:                                1054538.\nPages inactive:                               824583.\nPages speculative:                            240162.\nPages throttled:                                   0.\nPages wired down:                             264901.\nPages purgeable:                               13353.\n\"Translation faults\":                    18095703000.\nPages copy-on-write:                       992417409.\nPages zero filled:                       25920278521.\nPages reactivated:                        4946192598.\nPages purged:                               94274166.\nFile-backed pages:                           1535580.\nAnonymous pages:                              583703.\nPages stored in compressor:                   899751.\nPages occupied by compressor:                 367950.\nDecompressions:                           1461195222.\nCompressions:                             1800736275.\nPageins:                                  9235005548.\nPageouts:                                   11599685.\nSwapins:                                    44352466.\nSwapouts:                                   77895019.\nPages tagged:                                 167805.\nPages tagged resident:                        133300.\nPages tagged compressed:                       34505.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7099.\nPages tag-storage free:                         2703.\nPages tag-storage non-tag pageable:            88494.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5810496.\nTagged compressions:                        14672257.\nTagged decompressions:                      13629734.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T04:11:40.988035+00:00",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "ready": true,
    "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
  },
  "policy": {
    "startup_reclaimable_bytes": 20112000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17112000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1800,
    "stop_on_new_swapouts": false
  },
  "preparation_sha256": "838729106816afdaa83240e4731a362ab71b04a86e1a0e84dcddc0ba483f81d6",
  "classification": "Resource-qualified successor for only the V439 pressure-stopped lifecycle and MTP/vision cases. Prior reports stay unchanged; the two already-passing geometry cases retain their V439 identity. Exact V436 build from V435 automatic scheduling/local options and V416/V419 memory guards. Retains all four original V404 cases, source-bound original assertion coverage, workspace1024/frontier1, 1800 seconds plus30 cleanup, original20.112GB startup/17.112GB owned/3GB live envelope and original guard policy. Expanded actual-Generator lifecycle and MTP cases must report all three planner geometries, both memory fallbacks, aligned4096 MTP prefill, and pass every assertion. Native correctness only; serving process-cap/benefit and complete final gates are separate. No default adoption."
}

````````````

## Artifact SHA-256 5b9492b0dc4250bf4626124ce7969aa2d7e74e8b5e1605a3527e970d0d4577fa

Encoding: `gzip+base64`. Original bytes: 348400.

````````````text
H4sIAAAAAAAC/9S9a89mx3Ul9j2/gtCnBBge1WXXvhiYD47jAQaZGRuWknyIA6JFtuyeIdkMu2lZHsx/z1qnu0k+MvXU8Vu1D5CXgiR2v89lnaratfZt7f/+P3322a++fPvNN6++/epXf/HZ/41/xR/8+od33//6d2++/fXrb//pV//uw5/95j/9zW9/89u/++u//M9f/M3f/vaL/+tv/u5//83f/uVf/fUXv/2P/+mv/30tTf7Mb/7mr/7mb//6i//wd3/zX377H//67/59/fRrv/4/3r3+/t2vv3z1/ddv3/36b79/+19ff/n+3a/fff32/bv3379+9c2vj9/98Obrr3799rv3b7558y+v3r95++2vX/3w/u03+L9ffv7uy7ffvf78/JXP/0m64p2+/erNV6/ev/7Ze3z6sJ+/x+fv3uOXPv/yH19/+d8+/f3nn//Tq+/fvPr2/ac/+PDub759//ofvsdvf/X5129+//rLP3759eufXvLN269ef/3LcI6fwTh/7d2v/98/vP62++e///rVu3/8/NvX//z+82++/ufP5Xdv3v/0jv/13dtvf4V/+X/4J7/67u3Xb778I5blv3/8Tu9fff/+h++++P71l1+/evPNq999/fqL3/3x/et3+JVWam3l/Pn4bt+8+fbNNz9888XXb/7p9S++pJdPP59e8eqfz1e8/cO3r7/64vt373781Wp/+u7vXn3zHd6LD+j7f3r19RfvXn/59tuv+LvlaH/yfuca/ew3qv/0Nu/ffvfF22+/+Pb1H75494dX37394T1/4/evvn73Gr/xP87n8LvXv3/7/eufnsN3r/7hJxRVu8vHd/tllBbmHqPrp8/E57z5ln8n0kcT/flffPwCZnhFqfHpjV/9AX/4q//86st//Oz/fINFePX1Z//59Tdvv//jZ7/BZnrzDhvy3V989j/zm3327s2/vP7s7e8/fLPPzu/xv/z9t3+Lv3r32e+/f/36Lz6b//RevMbx6WWvvnyPVZy+sJYhY7QfX/bm22sv9CbDx48ve/fd6y9/+PrV9JVNStWfPu39P37/9v37r19/dQVg+fFlf3jz/euvPvsKm+7565pKlP7jy7774ft/eM2Vnn1a7X3wZX//q99+/+rbd1+fNgA77Iev37/7+1/94quxQWNY6er24+fBHvzxcxiPP3z/5v2f/cyIJtXG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
````````````

## Artifact SHA-256 57d28766558d4dbc4230e368c4b1b67685ebab1fb4cdf5d54271a066cb2d9f34

Encoding: `gzip+base64`. Original bytes: 266665.

````````````text
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
````````````

## Artifact SHA-256 788824b69831430e94081142ea44a610c337f00e35e4d73eb181d6b6c847948c

Encoding: `utf-8`. Original bytes: 2711.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "979f27dfafdec05e46ad2dbba94aab45714ac6033c9c525a620347f752e8deb4",
  "exit_code": 0,
  "assertions": 1658,
  "original_assertion_coverage_preserved": true,
  "automatic_native_metrics": {
    "automatic_planner_geometries": 3,
    "automatic_memory_fallbacks": 2
  },
  "elapsed_seconds": 395.23099354199996,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31939461120,
    "swapins": 44352506,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   558040.\nPages active:                                 893285.\nPages inactive:                               675636.\nPages speculative:                            215909.\nPages throttled:                                   0.\nPages wired down:                             278328.\nPages purgeable:                                9241.\n\"Translation faults\":                    18104065861.\nPages copy-on-write:                       993360323.\nPages zero filled:                       26146015045.\nPages reactivated:                        4952179308.\nPages purged:                               94509392.\nFile-backed pages:                           1382149.\nAnonymous pages:                              402681.\nPages stored in compressor:                  1077968.\nPages occupied by compressor:                 462228.\nDecompressions:                           1461488339.\nCompressions:                             1801336337.\nPageins:                                  9239081786.\nPageouts:                                   11601154.\nSwapins:                                    44352506.\nSwapouts:                                   77895019.\nPages tagged:                                 158429.\nPages tagged resident:                        118421.\nPages tagged compressed:                       40008.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6970.\nPages tag-storage free:                         2293.\nPages tag-storage non-tag pageable:            89033.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6764480.\nTagged compressions:                        14688781.\nTagged decompressions:                      13639873.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "c4498b67714b8e990afe67d22ab94583b2b80307fe4c7b006c32d692c37b3703",
  "execution_receipt_sha256": "0d450c7a1968a22942e85c34bd44917668dbbf26d1d5fc23cb7e8cae7e1b1427"
}

````````````

## Artifact SHA-256 0d450c7a1968a22942e85c34bd44917668dbbf26d1d5fc23cb7e8cae7e1b1427

Encoding: `utf-8`. Original bytes: 2613.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "979f27dfafdec05e46ad2dbba94aab45714ac6033c9c525a620347f752e8deb4",
  "exit_code": 0,
  "assertions": 1658,
  "original_assertion_coverage_preserved": true,
  "automatic_native_metrics": {
    "automatic_planner_geometries": 3,
    "automatic_memory_fallbacks": 2
  },
  "elapsed_seconds": 395.23099354199996,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31939461120,
    "swapins": 44352506,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   558040.\nPages active:                                 893285.\nPages inactive:                               675636.\nPages speculative:                            215909.\nPages throttled:                                   0.\nPages wired down:                             278328.\nPages purgeable:                                9241.\n\"Translation faults\":                    18104065861.\nPages copy-on-write:                       993360323.\nPages zero filled:                       26146015045.\nPages reactivated:                        4952179308.\nPages purged:                               94509392.\nFile-backed pages:                           1382149.\nAnonymous pages:                              402681.\nPages stored in compressor:                  1077968.\nPages occupied by compressor:                 462228.\nDecompressions:                           1461488339.\nCompressions:                             1801336337.\nPageins:                                  9239081786.\nPageouts:                                   11601154.\nSwapins:                                    44352506.\nSwapouts:                                   77895019.\nPages tagged:                                 158429.\nPages tagged resident:                        118421.\nPages tagged compressed:                       40008.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6970.\nPages tag-storage free:                         2293.\nPages tag-storage non-tag pageable:            89033.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6764480.\nTagged compressions:                        14688781.\nTagged decompressions:                      13639873.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "c4498b67714b8e990afe67d22ab94583b2b80307fe4c7b006c32d692c37b3703"
}

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 c4498b67714b8e990afe67d22ab94583b2b80307fe4c7b006c32d692c37b3703

Encoding: `gzip+base64`. Original bytes: 164299.

````````````text
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
````````````

## Artifact SHA-256 a5abeddb9eabcd77aa375541c9144a49f24a5a4ef700e66d3f020294de94b3e5

Encoding: `utf-8`. Original bytes: 23451.

````````````text
{
  "started_at": "2026-09-09T04:20:22.708752+00:00",
  "deadline_utc": "2026-09-09T05:15:00Z",
  "command": [
    "/usr/bin/env",
    "SLOTSTREAM_OPT_WORKSPACE_TILE=1024",
    "SLOTSTREAM_OPT_SCOPE_FRONTIER=1",
    "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "scope-integrated-mtp-vision",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e",
        "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
        "Sources/Slotstream/ContextMemory.swift": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "09f19ca477799aa70abbaf1aff6d6d956e4b9e5f126bd08d24a171b9c4e7d1a7",
        "Sources/Slotstream/Governor.swift": "5d41e9767f919ccaf6245dd194801cd8b5189362d741fbf01e9d95aaeffddd48",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "7d4c74e589ed681094bd9570e1d550f5c9fe4ecd9e171bb6360d2e0dab4b46a9",
        "Sources/Slotstream/MTP.swift": "10b63deee430c1e1d5792221f128bea0a6158161911676679665a168116cf743",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf",
        "Sources/Slotstream/Optimizations.swift": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce",
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
        "Sources/Slotstream/RequestControl.swift": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "3073de4167c10667101cf3e46e332632b38303d94b50896d3e4c05dd3eafafd3",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "236415bb0c4650ee8ea5c2c906157cd3e736ebeb718a68f59ca6da4e03ce64cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2",
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
      "source_archive_sha256": "1f8ee35ea3c3a8551b8b9cede882e27798cf06667ae93fe1138a5441fc91d3c1",
      "binary_sha256": "d626d992404099949e57114c3520dc3bf6ca4aef9d6b5860e0b99f4113256b1f",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31613190144,
    "swapins": 44352538,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   516353.\nPages active:                                 942223.\nPages inactive:                               718557.\nPages speculative:                            221697.\nPages throttled:                                   0.\nPages wired down:                             259937.\nPages purgeable:                               21669.\n\"Translation faults\":                    18105030902.\nPages copy-on-write:                       993418912.\nPages zero filled:                       26146870822.\nPages reactivated:                        4952180754.\nPages purged:                               94510879.\nFile-backed pages:                           1391494.\nAnonymous pages:                              490983.\nPages stored in compressor:                  1010801.\nPages occupied by compressor:                 423627.\nDecompressions:                           1461538504.\nCompressions:                             1801336337.\nPageins:                                  9239087539.\nPageouts:                                   11601154.\nSwapins:                                    44352538.\nSwapouts:                                   77895019.\nPages tagged:                                 160491.\nPages tagged resident:                        122449.\nPages tagged compressed:                       38042.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6970.\nPages tag-storage free:                         2947.\nPages tag-storage non-tag pageable:            88379.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6436736.\nTagged compressions:                        14688781.\nTagged decompressions:                      13641784.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T04:20:22.708628+00:00",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "ready": true,
    "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
  },
  "policy": {
    "startup_reclaimable_bytes": 20112000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17112000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1800,
    "stop_on_new_swapouts": false
  },
  "preparation_sha256": "838729106816afdaa83240e4731a362ab71b04a86e1a0e84dcddc0ba483f81d6",
  "classification": "Resource-qualified successor for only the V439 pressure-stopped lifecycle and MTP/vision cases. Prior reports stay unchanged; the two already-passing geometry cases retain their V439 identity. Exact V436 build from V435 automatic scheduling/local options and V416/V419 memory guards. Retains all four original V404 cases, source-bound original assertion coverage, workspace1024/frontier1, 1800 seconds plus30 cleanup, original20.112GB startup/17.112GB owned/3GB live envelope and original guard policy. Expanded actual-Generator lifecycle and MTP cases must report all three planner geometries, both memory fallbacks, aligned4096 MTP prefill, and pass every assertion. Native correctness only; serving process-cap/benefit and complete final gates are separate. No default adoption."
}

````````````

## Artifact SHA-256 49bcaa04ae0873a6c15e4d7ba9af5253f6ec04e61d08f94056f42809a1514d10

Encoding: `gzip+base64`. Original bytes: 193634.

````````````text
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
````````````

## Artifact SHA-256 2b26b4925dcba7b957405e28d034cc5d684080f6f9cdaad361b4f4694856985e

Encoding: `gzip+base64`. Original bytes: 145500.

````````````text
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
````````````

## Artifact SHA-256 3eb6eb61ed5d719546618f9e6ded3fc851d544f03f67d2af90f9d50bd647fdfb

Encoding: `utf-8`. Original bytes: 2713.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "a5abeddb9eabcd77aa375541c9144a49f24a5a4ef700e66d3f020294de94b3e5",
  "exit_code": 0,
  "assertions": 873,
  "original_assertion_coverage_preserved": true,
  "automatic_native_metrics": {
    "automatic_mtp_planner_geometries": 3,
    "automatic_mtp_prompt_tokens": 4096
  },
  "elapsed_seconds": 201.232272542,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 34143272960,
    "swapins": 44352578,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   576719.\nPages active:                                 874521.\nPages inactive:                               635347.\nPages speculative:                            238015.\nPages throttled:                                   0.\nPages wired down:                             252914.\nPages purgeable:                                2350.\n\"Translation faults\":                    18109468784.\nPages copy-on-write:                       993893393.\nPages zero filled:                       26294467244.\nPages reactivated:                        4956800364.\nPages purged:                               94718638.\nFile-backed pages:                           1504871.\nAnonymous pages:                              243012.\nPages stored in compressor:                  1189911.\nPages occupied by compressor:                 505617.\nDecompressions:                           1461981973.\nCompressions:                             1802044736.\nPageins:                                  9242444075.\nPageouts:                                   11602156.\nSwapins:                                    44352578.\nSwapouts:                                   77895019.\nPages tagged:                                 157893.\nPages tagged resident:                        111819.\nPages tagged compressed:                       46074.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6962.\nPages tag-storage free:                         2761.\nPages tag-storage non-tag pageable:            88573.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7985728.\nTagged compressions:                        14704819.\nTagged decompressions:                      13649529.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "f8cc4841050a940ed9dcc269d4d1014908030cd7cecd78801582ea892d3d457a",
  "execution_receipt_sha256": "04a9a857eb62657de609008db9e88619da282bb4d919f27e1f866c246d32a2b2"
}

````````````

## Artifact SHA-256 04a9a857eb62657de609008db9e88619da282bb4d919f27e1f866c246d32a2b2

Encoding: `utf-8`. Original bytes: 2615.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "a5abeddb9eabcd77aa375541c9144a49f24a5a4ef700e66d3f020294de94b3e5",
  "exit_code": 0,
  "assertions": 873,
  "original_assertion_coverage_preserved": true,
  "automatic_native_metrics": {
    "automatic_mtp_planner_geometries": 3,
    "automatic_mtp_prompt_tokens": 4096
  },
  "elapsed_seconds": 201.232272542,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 34143272960,
    "swapins": 44352578,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   576719.\nPages active:                                 874521.\nPages inactive:                               635347.\nPages speculative:                            238015.\nPages throttled:                                   0.\nPages wired down:                             252914.\nPages purgeable:                                2350.\n\"Translation faults\":                    18109468784.\nPages copy-on-write:                       993893393.\nPages zero filled:                       26294467244.\nPages reactivated:                        4956800364.\nPages purged:                               94718638.\nFile-backed pages:                           1504871.\nAnonymous pages:                              243012.\nPages stored in compressor:                  1189911.\nPages occupied by compressor:                 505617.\nDecompressions:                           1461981973.\nCompressions:                             1802044736.\nPageins:                                  9242444075.\nPageouts:                                   11602156.\nSwapins:                                    44352578.\nSwapouts:                                   77895019.\nPages tagged:                                 157893.\nPages tagged resident:                        111819.\nPages tagged compressed:                       46074.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6962.\nPages tag-storage free:                         2761.\nPages tag-storage non-tag pageable:            88573.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7985728.\nTagged compressions:                        14704819.\nTagged decompressions:                      13649529.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "f8cc4841050a940ed9dcc269d4d1014908030cd7cecd78801582ea892d3d457a"
}

````````````

## Artifact SHA-256 f8cc4841050a940ed9dcc269d4d1014908030cd7cecd78801582ea892d3d457a

Encoding: `gzip+base64`. Original bytes: 80443.

````````````text
H4sIAAAAAAAC/8WczZLayBKF934Khddu29RJAZp3cMQsZje+4VBDQSsMiJBEX/tOzLtfIXA33dBG0crP3vgH019mZZ1MhYtT/PMmSd4WTVzXb5M/kr/bvyXJP92v7eubfB33L7+dlevbYhPnyae//vz84b6oi3KT1LNyG5NdHevkttxt5u0/x/VtnM+LzTKpyv/Wb9/9AG3zuo7zPaqpdrF79d93L8XKN7O4Sua7as+p46zczJN5lS+am7uYz5OmWMVB5Co2u2pTJ5syWZXLonllnvOiirPmWIUDepU3+8JUsW7Kal+W3WIRq5tZPruLyapYF83AxI/c+3xVHGuSbKu4KL69jlus82X8/KHd1Ha/VqvbfPb1j2RRxNW8dgS2G3j//qM3cOQO9E8xuBPlTjR34tidOHEnTr2J7lsd3OUY3Fsm+K/aXY4hdSe6Czz4yzHzJspdj3JXj9zHo9z1KHf1yH08yl2P7mU0dzma+3g0d4Gbfx3dx6O5C9w9RfcM3fvFc3wX7X/Nvr0fjfyRqT/Sf+FB/siJO9I/SflvuPw3XP4bbv61NP8N9yR+jd99+7sDpt7AzBno2tkd0HtTvBOU9ybLe5PlvcnmXUPz3mRP3iqvm0+7VVM4MtfN9n03c5yZ7dqdieViUcfGGXqfr3bRkblZVvnakbddRdfDzLpeu5627nne+Y3cEwzeQHkDzRs49gZOvIFTZ6D3JgdvGQbvRgnuS/aWoev5agf01nVwl2HmDJS3DuUtG3mPQ3nrUN6ykfc4lLcOvUto3jI073Fo3ro29xp6j0Pz1rV3gt75eXeJ57Buyq9x4+mN6P5z4nt2c0Sm/sjMHel6gnNETtyR/knKf8Plv+Hy33Dzr6X5b/griVVsqu/JrFyvi6Y+GMMcrGX1bjaLde3vKjuke3CR5atiuWl/cGglZ+WmKTa7zgfnZiV7CnWyk12AjhAok2pAqEKohlDHCHWCUKcEFZFAQOQakNYKTAUQuTock1yiIk0QGLlmBFWIXoUoS8h4FaJXIcoSMl6F6BUpqyFyNWS8GtIExtQVGa+GNAGSKpIp0lfejwE3e9tFbMpgmSIEMdgJgmWSFSMEMUIQIwRjamuMELypTna4C9CUgGYA1H0SONnjzqFEoiI2X8Tmi9h8I2pqxOZ7M/3sc0+5fha6c66Hje6c6mSlOwf72Omecn0sdU+ZPra6p0wfa905k8hzhCQaCKgIqBHQMQGdENApACU2PxAyDURDBWT5hEzdz5qdbHkXoIhMMwAqQqciJCVinIrQqQhJiRinInRKlNQImRoxTo3QviE1JcapEdonEiXyJLrJe+g7Wf2eQt3sfhexKYPNEKz7CZWb/e8SlklWjBDECEGMEIyprTFCmDg4+qr919jFqiqr43fRvdZ4d05d5LtVkyza1z2QP3J0Nh6epX1zDOTyHXTX6UMchD3pI5YOJx9YvFi8sfgxi5+w+CmKZ4UTWNkHtmkDXBxW9q89U+qLZ7sqwLLPULxY3YsVpthxL1b3YoUpdtyL1T1bemNlb+y4N7arDK49O+6N7So2eTZ3tmOxB9UwF2Zvfgrz4foEwfwJy4fTFywfwfIRLB+D62+wfDD8EMdnT3qK0jOSzk2dIa7QfnQ0daGSESoZoZIxtO6GSgaDD3SXXg8w0GbaL8Cr/ab98EOMp/0iDHCgXg8wwIp6HT7Ak3odPsCc2g+OZj5iUw8oXSjdUPoYpU9Q+pSko5IJqNwD2qqBrQwqd+5jjCEe2Z50Vu4ZSReqd6GKFDrehepdqCKFjnehekfLbqjcDR3vhjaTsXVHx7uhzYSmjmaO9in2WBpi8L1OH+b07c1PYX7G8rmTyWFu4L58OH3B8hEsH8HyMbj+BsvHG3/6/aME+tc5gbtw8Vs+ayAz8GkAxA98FmCEB+CXEPAIwiMYHmGMR5jgEaZ0BFxKAW+HgLd04KuEt4P7kdt5BLzhAt8OGR1BeD8IV6vwx4PwfhCuVuGPB+H9gG+D4e1g+OPB8IYzfh/wx4PhDYcvAV8B3s/k4w3yHl8IkfIh+EIF8SEmeAh+EeIFJV5Q4gVl/F4YLygyAuJPPguQ0gEyOAA6mRCv8vMA9AJEi0i0iESLyOg9MFpEJJ/yMJ/GoGzMz2P4O5mfR0DMzM+DEH7m0xiEpfmUT7iaT/mEsfk5n85/hC8g0AFEBzA6wJgOMKEDTOEAtIgC3QaBbuSAl4huA/TzGMQFfRYAb4MMDiC6D0TLVPTjQHQfiJap6MeB6D6gt8DoNjD6cWB0nxm+B/TjwOg+oxdA5093MfkwQ0zUpwEgH/WFECkfIsNDoCeokKf6PAS/CPGCEi8o8YIyfi+MF9QrI2zityZp8moZm2RVLoumPmBfR5uV69tiE+fJp7/+/PzhvqiLcvPji5a/xdmuiXWy2LW4pCqb7kunXxcn3zXluv352T5QUsdVW6V9qAf39v57ratyVX/+ENLx5w+LfFVHj1B3+2+gPo2yKJa7ql1Pdxgcq2Re1Nu8md15B35cY72bzWKc11yEqv1TXrfr25blKtkWGzTW5R3bE3/HhnnFfXG//AO8uF1uNcyPQyFZVu1Kvj/51vgulkeUdqblbe5JvmoXUcVF0f7ezpNtOzSS+i7fxtotVLuUXRvm++NQWlblbtuq4hjYcVHz3azlHyK28baxarpJXrsX7rZs7rqKreK+ZO18dSzZYf87aMccdmflGnvIdZVe7BHJRhMPJFwk3Ej4mIRPSPgUhJNiCaTMA9mgAS0LKfPXfrDRD072UEBlnoFwkToXKUWR41ykzkVKUeQ4F6lzsuRGytzIcW5kDxlac3KcG9lDZOJk3mR3Qg+hYVc/etJTlI5WJgilT0g6mrpQyQiVjFDJGFp3QyUDwYdc3+jFTkF2xrGp6TLkqkYfNpi2QJkIlIlAmRhYbwNlAqEHXsG4hh94+6IP/tUXL/rAh9y56MMfcN3iGn7ATYtr6AGXLK6hB9yv6IMGsx6RaQeQLZBtIHsMsicge8qxQZkEUN4BbMtA1gSUN/UBwpBLEb3YpLwzji1Q3wI1KHB8C9S3QA0KHN8C9Q2W20B5Gzi+DWwdI+sNjm8DWwdMG8wa7EnokTPkrsI19rBrCj3pKUrPSDp1UjjsSkI/Opq6UMkIlYxQyRhad0MlM8F94Oko/B7nvm/gS05wKsIlKzgX6/KO/QbnvmvcF/fr1zj3fWv4c+d+6nMC2Me57xSqh3PfbVE/ce47F+6ycz8FzmdbJubc79iQc/+RPSLZaOKBhIuEGwkfk/AJCZ+CcFIsgZR5IBs0oGUhZQ4cvJ/AyR4KqMwzEC5S5yKlKHKci9S5SCmKHOcidU6W3EiZGznOjewhQ2tOjnMje4hMnMyb7E7oIYQ590/pKUpHKxOE0ickHU1dqGSESkaoZAytu6GSgeCQc/+RnYLsjGNT0wVy7j+wwbQFykSgTATKxMB6GygTCM059zs859x/wBPO/Qc45Nx/4DPO/Q7POPc7NOPc79CMc/8BDWY9ItMOIFsg20D2GGRPQPaUY4MyCaC8A9iWgawJKG/qAwTIuf/IJuWdcWyB+haoQYHjW6C+BWpQ4PgWqG+w3AbK28DxbWDrGFlvcHwb2Dpg2mDWYE9CjxzIud+xMef+KT1F6RlJp04KMef+CR1NXahkhEpGqGQMrbuhkuGd+6OPwX6Pdd858iUvOBbikhscDPbCrv0G+75v4Jf37NcY+J3L+HMH/z7Yr7Lwe8Xq4eH3W9ZPTPzetbvs4veK8mSa76GYj/8Ah4z8J/ARCmdTDyhdKN1Q+hilT1D6lKSjkgmo3APaqoGtDCp34FT+lI42U2DlnpF0oXoXqkih412o3oUqUuh4F6p3tOyGyt3Q8W5oMxlbd3S8G9pMaOpo5mifUo8lzOz/BJ+yeLY4QSx+guLZ5MUKR6xwxArH2NobKxyKDhn/T+ApCc9AODZpIPP/I5xMXKRYRIpFpFiMrLmRYqHY3CWAA5+7BfDIJ64BPNKhewCPAZiLAAc+cxPgwGauAhzYzF2ARzaZ9whNPJBwkXAj4WMSPiHhUxBOiiWQMg9kgwa0LKTMsc8goKsBJ3BU5hkIF6lzkVIUOc5F6lykFEWOc5E6J0tupMyNHOdG9pChNSfHuZE9RCZO5k12J/UQgu4LHODYhYEn+JTFZygeO2HELg2c4tnkxQpHrHDECsfY2hsrnCv09tf/7N/wdh3zelfFddw09f4th4CPUb6sm+2X7SrfbGL1ZRnLdWyqInZv1buL763K9bb5chx77dvsYzY+vrPYNHFZtbnOv9zmdbee0ZvjWh9XWG6bYl38rzNO39SzchtvWvDNfVG3L3TLer6kf9/8H2UibMQ7OgEA
````````````

## Artifact SHA-256 da9d67e8a31793b5820b0f16e6ad1af6f14dba0048b568bb83a739cdcbf2c2b0

Encoding: `utf-8`. Original bytes: 5282.

````````````text
{
  "prepared_at": "2026-09-09T04:27:53.908360+00:00",
  "preparation_sha256": "f35f3b583c95363de208684c3a75bb54271d06f5d918e999067268c28f8b5c5d",
  "protocol_sha256": "9597d8ba4fc007bc4ee0c700746ce34a7f9de8789d6873be84aab012e57964b0",
  "native_proof": {
    "scope-family-2051": {
      "assertions": 817,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-family-2051",
        "sha256": {
          "attempt.json": "bb19f3a2668e4347bdcfcfba4aa904f9ccead9736d3ca6f01b6611a0931c2b69",
          "receipt.json": "eb2aeed463fc72f79ed0dc70c21ec4dac584e2189bda3a6a3a477afd0a5b8708",
          "qualification.json": "52c5d73f34c28df22b71f93d2d870fb53323cd19d494c734804dc037a6e16861",
          "stdout.txt": "7c02a1ac8903d1473cdd697e34ad3be4b7530c5a073f79d33dee29b9606b7cba",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "scope-family-4096": {
      "assertions": 817,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-native-v439/scope-family-4096",
        "sha256": {
          "attempt.json": "aacffdadacf079d805c05d7b7be6d9d0013ec9c1c35020acd87869c98c865310",
          "receipt.json": "4145454aff48ef6c4cb4cdf3b6a70eb8fe8e5b00becad6b93c2e8a745679fd7f",
          "qualification.json": "a8d60cd71985819667fd90399f2713bf891669fb4bbbead2c135598fb9b8033a",
          "stdout.txt": "74f4557310de989b4646be90bf741687dfc35cc1744678124bf9389069ce8281",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "scope-lifecycle": {
      "assertions": 1658,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-lifecycle",
        "sha256": {
          "attempt.json": "979f27dfafdec05e46ad2dbba94aab45714ac6033c9c525a620347f752e8deb4",
          "receipt.json": "0d450c7a1968a22942e85c34bd44917668dbbf26d1d5fc23cb7e8cae7e1b1427",
          "qualification.json": "788824b69831430e94081142ea44a610c337f00e35e4d73eb181d6b6c847948c",
          "stdout.txt": "c4498b67714b8e990afe67d22ab94583b2b80307fe4c7b006c32d692c37b3703",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "scope-mtp-vision": {
      "assertions": 873,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-resumed-native-v459/scope-mtp-vision",
        "sha256": {
          "attempt.json": "a5abeddb9eabcd77aa375541c9144a49f24a5a4ef700e66d3f020294de94b3e5",
          "receipt.json": "04a9a857eb62657de609008db9e88619da282bb4d919f27e1f866c246d32a2b2",
          "qualification.json": "3eb6eb61ed5d719546618f9e6ded3fc851d544f03f67d2af90f9d50bd647fdfb",
          "stdout.txt": "f8cc4841050a940ed9dcc269d4d1014908030cd7cecd78801582ea892d3d457a",
          "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        }
      }
    },
    "combined-plain": {
      "assertions": 286,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-plain",
        "sha256": {
          "attempt.json": "c530d0c0d169df0ddfcf9869c2d69d7dbb2cf7a43b9596d0edddd601c02af6cf",
          "receipt.json": "0ecd081160a21b14a869ecee5d096dfb586a9953a10ba66da2c5e8a7d7756946",
          "qualification.json": "87c4100cf32c6d43f3f3357f07b9cb7966bef321986749b9becd4ed722c6f0dd",
          "stdout.txt": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    },
    "combined-mtp": {
      "assertions": 327,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/combined-mtp",
        "sha256": {
          "attempt.json": "b9e995e1ad9a637f23e9a1964f9d6096f36552ba37e58ee73ca70c7d8a5c59da",
          "receipt.json": "aabc46da26824d3a6fa72fac341786e7376452b6cc5131ffa35b3118735ba997",
          "qualification.json": "1fd5e855b9f68a3878f529ad0d8330dd07ad74fd3ec1458efc18ae57d77b6f0f",
          "stdout.txt": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e",
          "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
        }
      }
    },
    "read-failure-serving": {
      "assertions": 522,
      "evidence": {
        "directory": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-integration-native-v444/read-failure-serving",
        "sha256": {
          "attempt.json": "8c47f9cd31c8d29aa7504fccb25078e2614e7ebd602cc980420e8ee64a07365d",
          "receipt.json": "b1630c6fe8159819907b8ef066684c369266d47cb482dda370655f033c4c28a0",
          "qualification.json": "9af4d7d76806edd6bb4e5d12f70a619ec490966717db52f33d73b94bf566aa78",
          "stdout.txt": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
          "stderr.txt": "d2808dd2d90c5b07cb5d5ead3d1c63d4926802d0b0560e7d735779d02fa20f27"
        }
      }
    }
  }
}

````````````

## Artifact SHA-256 1bfc228892aada52c8d0c352896b19575bb253f6ecf8942a5dd4a92cfe937938

Encoding: `utf-8`. Original bytes: 5575.

````````````text
from pathlib import Path
import copy,datetime,importlib.util,inspect,json,tempfile,unittest
from unittest import mock
P=Path(__file__).resolve().parent
spec=importlib.util.spec_from_file_location('v467_under_test',P/'run.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
class Checks(unittest.TestCase):
    def test_original_contract_and_assessor(self):
        old=m.c.read(m.previous.HERE/'protocol.json');new=m.materialize(m.native.load())
        restored=copy.deepcopy(new);restored.pop('before_cell_thermal_settle')
        for key in ('binary','label','classification'):restored[key]=old[key]
        for arm in restored['arms']:restored['arms'][arm]['binary']=old['arms'][arm]['binary']
        self.assertEqual(restored,old)
        self.assertEqual(inspect.getsource(m.execution.assess_serving),inspect.getsource(m.previous.original.assess_serving))
        self.assertEqual(m.WORK_SECONDS,5400+32*300)
    def test_original_driver_and_failure_evidence(self):
        self.assertTrue(m.dependencies());self.assertTrue(m.preserved())
    def test_missing_native_stops_before_preparation(self):
        with tempfile.TemporaryDirectory() as tmp, mock.patch.object(m,'HERE',Path(tmp)), mock.patch.object(m,'OUT',Path(tmp)/'raw'), mock.patch.object(m,'prerequisites',side_effect=ValueError('missing original native proof')):
            with self.assertRaisesRegex(ValueError,'missing original native proof'):m.prepare()
            self.assertFalse((Path(tmp)/'preparation.json').exists())
    def tampered(self,path,change,call):
        real=m.c.read
        def read(p):
            value=real(p)
            if Path(p)==path:change(value)
            return value
        with mock.patch.object(m.c,'read',side_effect=read):
            with self.assertRaises(ValueError):call()
    def test_native_failed_receipt_cannot_qualify(self):
        p=m.native.OUT/'scope-family-2051/qualification.json'
        self.tampered(p,lambda d:d.update(passed=False),m.prerequisites)
    def test_native_policy_drift_cannot_qualify(self):
        p=m.native.OUT/'scope-family-2051/attempt.json'
        self.tampered(p,lambda d:d['policy'].update(maximum_owned_rss_bytes=18_000_000_000),m.prerequisites)
    def test_native_output_drift_cannot_qualify(self):
        p=m.native.OUT/'scope-family-2051/stdout.txt'
        self.tampered(p,lambda d:d['items'][0].update(passed=False),m.prerequisites)
    def test_capacity_failure_cannot_be_replaced_with_success(self):
        p=m.previous.HERE/'execution/qualification.json'
        self.tampered(p,lambda d:d.update(qualified=True),m.preserved)
    def test_prior_results_drift_cannot_qualify(self):
        p=m.BASE/'scope-capacity-audit-v390/audit.json'
        self.tampered(p,lambda d:d.update(results_sha256='0'*64),m.preserved)
    def test_full_interval_precedes_any_launch(self):
        deadline=(datetime.datetime.now(datetime.timezone.utc)+datetime.timedelta(seconds=m.WORK_SECONDS)).isoformat()
        with mock.patch.object(m.execution,'load_serving',side_effect=AssertionError('readiness advanced without cleanup allowance')):
            with self.assertRaises(ValueError):m.run(deadline)
    def test_actual_execution_dispatch_keeps_original_resource_limits(self):
        with tempfile.TemporaryDirectory() as tmp:
            here=Path(tmp);out=here/'raw';(here/'protocol.json').write_text('{}');(here/'preparation.json').write_text('{}')
            value=m.native.load();protocol=m.materialize(value);deadline=(datetime.datetime.now(datetime.timezone.utc)+datetime.timedelta(seconds=m.WORK_SECONDS+120)).isoformat();captured={}
            def readiness(date,seconds,startup):
                self.assertEqual(seconds,15060);self.assertEqual(startup,20.112)
                return 10**12,{}, {'ready':True}
            def execute(command,target,seconds,policy,assessment,limit,attempt,progress):
                captured.update(command=command,seconds=seconds,policy=policy)
                self.assertEqual(seconds,15000);self.assertEqual(policy['maximum_owned_rss_bytes'],12_000_000_000)
                self.assertEqual(policy['startup_reclaimable_bytes'],20_112_000_000)
                self.assertEqual(policy['minimum_live_reclaimable_bytes'],3_000_000_000)
                self.assertTrue(policy['stop_on_new_swapouts']);self.assertEqual(command[1],str(m.DRIVER))
                return {'qualified':True}
            with mock.patch.object(m,'HERE',here),mock.patch.object(m,'OUT',out),mock.patch.object(m.execution,'load_serving',return_value=(value,protocol)),mock.patch.object(m.core,'readiness',side_effect=readiness),mock.patch.object(m.core,'execute',side_effect=execute),mock.patch.object(m.execution,'finalize',side_effect=lambda p,r:r):
                self.assertTrue(m.run(deadline)['qualified'])
            self.assertTrue(captured);self.assertFalse(out.exists())
    def test_exact_seven_case_ownership_is_preserved(self):
        names=[name for owner,cases in m.OWNER_CASES for name in cases]
        self.assertEqual(len(names),7)
        self.assertEqual(set(names),set(m.native.NATIVE)|set(m.integration.NATIVE))
        self.assertEqual([owner.HERE.name for owner,cases in m.OWNER_CASES],['automatic-scope-native-v439','automatic-scope-resumed-native-v459','automatic-scope-integration-native-v444'])
    def test_preserved_headroom_stop_cannot_be_relabelled(self):
        p=m.BASE/'corrected-scope-serving-v409/execution/qualification.json'
        self.tampered(p,lambda d:d.update(qualified=True),m.preserved)
if __name__=='__main__':unittest.main()

````````````

## Artifact SHA-256 abb737aa8c97ba113accf5affa7612efb794a6d9e6607374f35139f8f66fba08

Encoding: `utf-8`. Original bytes: 111.

````````````text
............
----------------------------------------------------------------------
Ran 12 tests in 0.532s

OK

````````````

## Artifact SHA-256 2c1fe80253e59497370f79f73b5a03cee345f44222bf9a848fabe9048fdc9972

Encoding: `utf-8`. Original bytes: 1443.

````````````text
....E.......
======================================================================
ERROR: test_missing_native_stops_before_preparation (__main__.Checks)
----------------------------------------------------------------------
Traceback (most recent call last):
  File "/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/checks.py", line 19, in test_missing_native_stops_before_preparation
    with self.assertRaisesRegex(ValueError,'missing original native proof'):m.prepare()
  File "/private/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/run.py", line 148, in prepare
    record = {'prepared_at': core.now(), 'dependencies': dependencies(), 'preserved': prior,
  File "/private/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/run.py", line 63, in dependencies
    return {str(p.resolve()): digest(p) for p in files}
  File "/private/tmp/slotstream-optimization-execution/automatic-scope-explicit-serving-v467/run.py", line 63, in <dictcomp>
    return {str(p.resolve()): digest(p) for p in files}
  File "/Users/carlos/Projects/slotstream/Tools/prefill_bench.py", line 29, in digest
    with open(path, "rb") as f:
FileNotFoundError: [Errno 2] No such file or directory: '/var/folders/d4/t1c8ltbx5s3_11cs9y6gjh8m0000gp/T/tmp9vulfhaw/checks.py'

----------------------------------------------------------------------
Ran 12 tests in 0.681s

FAILED (errors=1)

````````````

## Artifact SHA-256 3e7eaee978e7250da4d7020cb01ffc81c22c7b4a9f24491e99ac382c09b913c8

Encoding: `utf-8`. Original bytes: 15146.

````````````text
"""Prospective full scope cohort with bounded prelaunch thermal settling.

Preparation requires the preserved V377 capacity failure plus all seven exact
V436 native passes after the earlier buffer-cache/allocation correction and current automatic-scope changes; two prior current-source geometry passes are combined with the fresh expanded cases and original integrations. All original workload/acceptance rules remain. The new
whole-run allowance separately includes every added prelaunch wait.
"""
import argparse
import copy
import fcntl
import importlib.util
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
BASE = HERE.parent
PREVIOUS = BASE / 'scope-serving-resource-resume-v377/run.py'
THERMAL = BASE / 'thermal-settle-preparation-v388'
DRIVER = THERMAL / 'driver/serve_bench.py'
SETTLE = {'stable_seconds': 60, 'maximum_wait_seconds': 300, 'poll_seconds': 2}
ORIGINAL_SECONDS = 5400
ADDED_WAIT_SECONDS = 32 * SETTLE['maximum_wait_seconds']
WORK_SECONDS = ORIGINAL_SECONDS + ADDED_WAIT_SECONDS
CLEANUP_SECONDS = 60


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


previous = module('scope_v377_preserved', PREVIOUS)
execution = module('scope_v467_original_assessment', previous.ORIGINAL)
native = module('v467_scope_families', BASE / 'automatic-scope-native-v439/run.py')
resumed = module('v467_scope_resumed', BASE / 'automatic-scope-resumed-native-v459/run.py')
integration = module('v467_integrations', BASE / 'automatic-scope-integration-native-v444/run.py')
OWNER_CASES=((native,('scope-family-2051','scope-family-4096')),(resumed,('scope-lifecycle','scope-mtp-vision')),(integration,tuple(integration.NATIVE)))
c, core = execution.c, execution.core
digest, require = execution.digest, execution.require
OUT = execution.ROOT / '.build/optimization/automatic-scope-explicit-serving-v467'


def dependencies():
    files = [Path(__file__), HERE/'checks.py', HERE/'checks.stderr', BASE/'resource-resume-v458/resource-change.json', BASE/'corrected-scope-serving-v409/run.py', BASE/'corrected-scope-serving-v409/protocol.json', BASE/'corrected-scope-serving-v409/execution/qualification.json', BASE/'automatic-scope-native-v439/run.py', BASE/'automatic-scope-native-v439/preparation.json', BASE/'automatic-scope-resumed-native-v459/run.py', BASE/'automatic-scope-resumed-native-v459/preparation.json', BASE/'automatic-scope-integration-native-v444/run.py', BASE/'automatic-scope-integration-native-v444/preparation.json', BASE/'automatic-scope-build-v436/protocol.json', BASE/'automatic-scope-build-v436/lease-result.json', PREVIOUS, previous.HERE / 'preparation.json',
             previous.HERE / 'protocol.json', previous.HERE / 'binding.json',
             THERMAL / 'thermal_settle.py', THERMAL / 'build_driver.py',
             THERMAL / 'driver-transformation.json', THERMAL / 'checks.py',
             THERMAL / 'checks.stderr', DRIVER, THERMAL / 'driver/thermal_settle.py',
             THERMAL / 'driver/prefill_bench.py', execution.ROOT / 'Tools/thermal_readiness.py',
             execution.ROOT / 'Tools/optimization_readiness.py']
    transform = c.read(THERMAL / 'driver-transformation.json')
    require(transform['original_sha256'] == digest(execution.ROOT / 'Tools/serve_bench.py')
            and transform['driver_sha256'] == digest(DRIVER), 'isolated thermal driver changed')
    for name, expected in transform['source_files'].items():
        require(digest(Path(name)) == expected, 'thermal driver dependency changed')
    for name, source in [('thermal_settle.py', THERMAL / 'thermal_settle.py'),
                         ('prefill_bench.py', execution.ROOT / 'Tools/prefill_bench.py')]:
        require((THERMAL / 'driver' / name).read_bytes() == source.read_bytes(), 'packaged helper differs from source')
    checks = (THERMAL / 'checks.stderr').read_text()
    require('Ran 13 tests' in checks and checks.endswith('OK\n'), 'thermal preparation checks must pass')
    return {str(p.resolve()): digest(p) for p in files}


def prerequisites():
    result = {}
    for owner, names in OWNER_CASES:
        value = owner.load()
        for name in names:
            target = owner.OUT / name
            require(all((target/file).is_file() for file in ('stdout.txt','qualification.json','attempt.json','receipt.json')),'complete current native proof absent: '+name)
            report, receipt, attempt = (c.read(target / file) for file in ('stdout.txt', 'qualification.json', 'attempt.json'))
            require(receipt.get('passed') is True and receipt.get('qualified') is True
                    and receipt.get('cleanup_complete') is True and receipt.get('remaining_jobs') == []
                    and receipt.get('within_reservation') is True and receipt.get('proofs_unchanged') is True,
                    'all seven exact-source native cases must pass and drain')
            require(receipt['stdout_sha256'] == digest(target / 'stdout.txt')
                    and receipt['attempt_sha256'] == digest(target / 'attempt.json')
                    and receipt['execution_receipt_sha256'] == digest(target / 'receipt.json')
                    and attempt['command'] == value['commands'][name] and attempt['environment'] == {}
                    and attempt['policy'] == owner.policy(name) and attempt['build'] == native.load()['build'],
                    'native workload, policy or evidence identity changed')
            assessment = owner.assess(name, report)
            require(receipt['assertions'] == assessment['assertions'], 'native assertion count changed')
            result[name] = {'assertions': assessment['assertions'],
                'evidence': c.evidence(target, ['attempt.json', 'receipt.json', 'qualification.json', 'stdout.txt', 'stderr.txt'])}
    require(len(result) == 7, 'full native family absent')
    return result


def preserved_earlier():
    folder = previous.HERE / 'execution'
    receipt = c.read(folder / 'qualification.json')
    audit_path = BASE / 'scope-capacity-audit-v390/audit.json'
    audit = c.read(audit_path)
    require(receipt.get('qualified') is False and receipt.get('cleanup_complete') is True
            and receipt.get('remaining_jobs') == [] and 'absolute first/measured footprint ceiling' in receipt.get('error', ''),
            'preserved original capacity failure differs')
    require(audit['all64_exact_prompt_output_text_and_equal_work'] is True
            and audit['validated_first_requests'] == audit['validated_measured_requests'] == 32
            and audit['absolute_cap_bytes'] == 10_000_000_000
            and audit['protocol_sha256'] == digest(previous.HERE / 'protocol.json')
            and audit['results_sha256'] == digest(previous.OUT / 'serving/results.jsonl'),
            'original complete capacity diagnosis differs')
    return {'raw': c.artifact_hashes(previous.OUT / 'serving'), 'execution': c.artifact_hashes(folder),
            'audit_sha256': digest(audit_path),
            'meaning': 'V377 original full32-cell capacity failure preserved; V402 adds a real allocator/cache and allocation-pricing correction. No old rows enter this new cohort.'}


def preserved():
    result=preserved_earlier()
    prior=BASE/'corrected-scope-serving-v409'
    target=prior/'execution'
    raw=execution.ROOT/'.build/optimization/corrected-scope-serving-v409/serving'
    receipt=c.read(target/'qualification.json')
    rows=[json.loads(line) for line in (raw/'results.jsonl').read_text().splitlines()]
    require(receipt.get('qualified') is False and receipt.get('cleanup_complete') is True and receipt.get('remaining_jobs')==[] and receipt.get('within_reservation') is True,'V409 stop or cleanup differs')
    require(len(rows)==22 and rows[-1].get('round')==11 and rows[-1].get('arm')=='scope' and 'original startup memory requirement no longer fits' in rows[-1].get('error','') and rows[-1].get('server_pid') is None and 'metrics' not in rows[-1],'V409 headroom stop changed')
    proof=c.read(BASE/'resource-resume-v458/resource-change.json')
    require(proof['previous_reclaimable_bytes']<20_112_000_000 and proof['current_reclaimable_bytes']>=22_200_000_000 and all(digest(Path(p))==sha for p,sha in proof['resources'].items()),'verified material resource change absent')
    result['latest_headroom_stop']={'raw':c.artifact_hashes(raw),'execution':c.artifact_hashes(target),'protocol_sha256':digest(prior/'protocol.json'),'no_rows_reused':True}
    result['resource_change']=proof
    return result


def materialize(value):
    old = previous.materialize(value)
    result = copy.deepcopy(old)
    result['label'] = 'automatic-scope-explicit-serving-v467'
    result['classification'] = ('Exact V436 after the preserved V377 capacity failure and V409 headroom stop, requiring all seven current-source native cases from V439/V459/V444. The newly available memory does not enlarge any workload or cap. Automatic selection is separately unqualified and remains disabled in this original explicit-scope mechanism study. New full 32-cell scope cohort. Each cell retains its original 60-second cooldown '
        'then waits at most 300 additional seconds for 60 seconds of sampled nominal conditions. '
        'Original V170/V377 workload, memory target, 32 first requests, acceptance and exclusions remain. '
        'All old rows stay excluded from new evidence; no replacement or default activation.')
    result['before_cell_thermal_settle'] = dict(SETTLE)
    restored = copy.deepcopy(result)
    restored.pop('before_cell_thermal_settle')
    for key in ('label', 'classification'): restored[key] = old[key]
    require(restored == old, 'original workload, controls or acceptance changed')
    return result


def prepare():
    require(not (HERE / 'preparation.json').exists() and not OUT.exists(), 'already prepared or attempted')
    prior = preserved()
    value = native.load()
    materialize(value)
    record = {'prepared_at': core.now(), 'dependencies': dependencies(), 'preserved': prior,
              'build': value['build'], 'native_proof': prerequisites(),
              'original_work_seconds': ORIGINAL_SECONDS, 'additional_wait_seconds': ADDED_WAIT_SECONDS,
              'whole_work_seconds': WORK_SECONDS, 'cleanup_seconds': CLEANUP_SECONDS,
              'settle_policy': SETTLE, 'model_launched': False}
    c.write_new(HERE / 'preparation.json', record)
    return {'prepared': True, 'model_launched': False, 'fixed_cells': 32,
            'whole_work_seconds': WORK_SECONDS, 'additional_wait_seconds': ADDED_WAIT_SECONDS}


def load():
    record, value = c.read(HERE / 'preparation.json'), native.load()
    require(record['dependencies'] == dependencies() and record['preserved'] == preserved()
            and record['build'] == value['build']
            and record['native_proof'] == prerequisites()
            and record['original_work_seconds'] == ORIGINAL_SECONDS == previous.original.SERVING_SECONDS
            and record['additional_wait_seconds'] == ADDED_WAIT_SECONDS
            and record['whole_work_seconds'] == WORK_SECONDS
            and record['cleanup_seconds'] == CLEANUP_SECONDS and record['settle_policy'] == SETTLE,
            'new source, prerequisite, original evidence or time/settling contract changed')
    return value


core.load = load
execution.HERE, execution.OUT = HERE, OUT
execution.load = load
execution.materialize = materialize
execution.prerequisites = prerequisites


def assess():
    result = execution.assess_serving()
    raw = OUT / 'serving'
    manifest = c.read(raw / 'manifest.json')
    require(manifest['harness_sources']['serve_bench.py'] == digest(DRIVER)
            and manifest['harness_sources']['prefill_bench.py'] == digest(THERMAL / 'driver/prefill_bench.py'),
            'executed isolated driver or helper differs')
    for line in (raw / 'results.jsonl').read_text().splitlines():
        row = json.loads(line); observed = row.get('thermal_settle', {})
        require(observed.get('enabled') is True and observed.get('reserved') is True
                and observed.get('before_launch_only') is True
                and observed.get('request_acceptance_unchanged') is True
                and 0 <= observed.get('seconds', -1) <= SETTLE['maximum_wait_seconds']
                and observed.get('sampled_nominal_seconds', 0) >= SETTLE['stable_seconds']
                and observed.get('samples', 0) >= 31, 'completed cell lacks the declared thermal precondition')
    return result


def run(deadline):
    core.allowance(deadline, WORK_SECONDS + CLEANUP_SECONDS)
    value, protocol = execution.load_serving()
    target, output = HERE / 'execution', OUT / 'serving'
    require(not target.exists() and not output.exists(), 'attempted cohort cannot retry')
    limit, before, thermal = core.readiness(deadline, WORK_SECONDS + CLEANUP_SECONDS, execution.STARTUP_GB)
    policy = dict(c.NATIVE_POLICY, startup_reclaimable_bytes=int(execution.STARTUP_GB * 1e9),
                  maximum_owned_rss_bytes=12_000_000_000, maximum_build_seconds=WORK_SECONDS,
                  stop_on_new_swapouts=True)
    command = [sys.executable, str(DRIVER), '--protocol', str(HERE / 'protocol.json'), '--out', str(output)]
    attempt = {'started_at': core.now(), 'deadline_utc': deadline, 'command': command, 'environment': {},
               'build': value['build'], 'before': before, 'thermal_prelaunch': thermal, 'policy': policy,
               'protocol_sha256': digest(HERE / 'protocol.json'), 'driver_sha256': digest(DRIVER),
               'preparation_sha256': digest(HERE / 'preparation.json'),
               'classification': protocol['classification']}
    def assessment(code):
        require(code in (0, 1), 'scope serving process failed')
        return assess()
    result = execution.finalize(target, core.execute(command, target, WORK_SECONDS, policy, assessment,
                                                    limit, attempt, output / 'results.jsonl'))
    if output.exists(): c.write_new(target / 'artifact-sha256.json', c.artifact_hashes(output))
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=('prepare', 'freeze', 'status', 'run'))
    parser.add_argument('--deadline')
    args = parser.parse_args()
    with (HERE / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        if args.action == 'prepare': result = prepare()
        elif args.action == 'freeze': result = execution.freeze_serving()
        elif args.action == 'status':
            load(); result = {'frozen': (HERE / 'protocol.json').exists(), 'attempted': (HERE / 'execution').exists()}
        else:
            require(args.deadline is not None, 'full user-authorized interval required')
            result = run(args.deadline)
    print(json.dumps(result, indent=2), flush=True)
    return 1 if args.action == 'run' and result.get('qualified') is not True else 0


if __name__ == '__main__':
    raise SystemExit(main())

````````````

## Artifact SHA-256 c0e87a31ad86b066cd76d75aa9a7f3b02e8065ea54e89c72e506d557227411c8

Encoding: `utf-8`. Original bytes: 436.

````````````text
{
  "initial_result": "Twelve checks, one setup error: the temporary missing-native fixture had no newly bound checks.py dependency.",
  "correction": "Validate the native proof before constructing the preparation record or hashing the ancillary checks. Missing native evidence now fails before any preparation write. The complete native and dependency checks remain mandatory.",
  "model_launched": false,
  "protocol_frozen": false
}

````````````

## Artifact SHA-256 f35f3b583c95363de208684c3a75bb54271d06f5d918e999067268c28f8b5c5d

Encoding: `gzip+base64`. Original bytes: 67835.

````````````text
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
````````````

## Artifact SHA-256 9597d8ba4fc007bc4ee0c700746ce34a7f9de8789d6873be84aab012e57964b0

Encoding: `utf-8`. Original bytes: 10302.

````````````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
  "memory_gb": 10,
  "mtp": "off",
  "raw": false,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 10000000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
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
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
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
    },
    "scope": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/automatic-scope-build-v436/candidate/slotstream",
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
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "1",
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
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "1",
        "SLOTSTREAM_OPT_WORKSPACE_PIECES": "0",
        "SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0",
        "SLOTSTREAM_OPT_VISION_PADDING": "0",
        "SLOTSTREAM_OPT_VISION_QUERY_TILE": "0",
        "SLOTSTREAM_OPT_READ_SCOPE": "4096",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "1024",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "automatic-scope-explicit-serving-v467",
  "classification": "Exact V436 after the preserved V377 capacity failure and V409 headroom stop, requiring all seven current-source native cases from V439/V459/V444. The newly available memory does not enlarge any workload or cap. Automatic selection is separately unqualified and remains disabled in this original explicit-scope mechanism study. New full 32-cell scope cohort. Each cell retains its original 60-second cooldown then waits at most 300 additional seconds for 60 seconds of sampled nominal conditions. Original V170/V377 workload, memory target, 32 first requests, acceptance and exclusions remain. All old rows stay excluded from new evidence; no replacement or default activation.",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/code.txt",
  "fixture_sha256": "bc0fc77db83ec16a8100b57d5d06d68ddd7aecf3ceedc8a410699418086124c8",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "conditions": "New combined-base long-prefill qualification, not a repeat or pooling of consumed V22/V98 evidence. Same10GB native target, original256-token chronological compute,16output tokens, MTP/prefix off,54explicit controls in each arm. Common compact-state/MTP-row/final-forward/sampler/queue/governor/embedding-row/shared/fused-RoPE plus bounded indexer/PLE; only candidate enables4096read scope,1024workspace tile and compact frontier. Both arms retain native target-driven pool sizing; no simulated availability, fixed-pool override or estimator credit. Read-work bounds require reference>=150000 and candidate<=50000 actualprefillrecords at identical3730prompt tokens; decode record differences are allowed and reported because scope tail admission may change residency. Six equal logical/model-work counters and exact IDs/wire output are required. Sixteen fixed alternating fresh-server pairs,180second initial quiet,60second reserved cooldown, min5clean/5percent median client gain/80percent positive; separate min5exactclean firstjobs/atmost5percent regression. Whole-request sampled physical peak<=10GB, nominal power and unchanged VM, immediate resource stop/no replacements. Baseline V22 observed candidate peaks<=9.613GB but no clean paired result; row-backed embeddings now remove a separately qualified resident payload, without arithmetically claiming a peak saving or prior speedup. Native combined-base4096/2051family, scope cancellation/retry and MTP/image parity must pass on the final bound source before launch. Full automatic/planner adoption remains a separate decision.",
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
  "think": false,
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "decodeModelTokens",
    "decodeForwardPasses",
    "draftedTokens",
    "verifyPasses"
  ],
  "work_constraints": {
    "reference": {
      "prefillTokens": {
        "min": 3730,
        "max": 3730
      },
      "decodeTokens": {
        "min": 16,
        "max": 16
      },
      "decodeModelTokens": {
        "min": 15,
        "max": 15
      },
      "decodeForwardPasses": {
        "min": 15,
        "max": 15
      },
      "draftedTokens": {
        "min": 0,
        "max": 0
      },
      "verifyPasses": {
        "min": 0,
        "max": 0
      },
      "prefillRecords": {
        "min": 150000
      }
    },
    "scope": {
      "prefillTokens": {
        "min": 3730,
        "max": 3730
      },
      "decodeTokens": {
        "min": 16,
        "max": 16
      },
      "decodeModelTokens": {
        "min": 15,
        "max": 15
      },
      "decodeForwardPasses": {
        "min": 15,
        "max": 15
      },
      "draftedTokens": {
        "min": 0,
        "max": 0
      },
      "verifyPasses": {
        "min": 0,
        "max": 0
      },
      "prefillRecords": {
        "max": 50000
      }
    }
  },
  "primary_metric": "Paired full-client request latency with demonstrated prefill read reduction and exact output at one unchanged10GB target; first-job and peak constraints remain independent.",
  "before_cell_thermal_settle": {
    "stable_seconds": 60,
    "maximum_wait_seconds": 300,
    "poll_seconds": 2
  }
}

````````````

## Artifact SHA-256 062081c5e30c9eda4b0de1d57d93c1907b70edeb4aae8b4c8e806346eb26cc09

Encoding: `utf-8`. Original bytes: 15164.

````````````text
"""Prospective full scope cohort with bounded prelaunch thermal settling.

Preparation requires the preserved V377 capacity failure plus all seven exact
V436 native passes after the earlier buffer-cache/allocation correction and current automatic-scope changes; two prior current-source geometry passes are combined with the fresh expanded cases and original integrations. All original workload/acceptance rules remain. The new
whole-run allowance separately includes every added prelaunch wait.
"""
import argparse
import copy
import fcntl
import importlib.util
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
BASE = HERE.parent
PREVIOUS = BASE / 'scope-serving-resource-resume-v377/run.py'
THERMAL = BASE / 'thermal-settle-preparation-v388'
DRIVER = THERMAL / 'driver/serve_bench.py'
SETTLE = {'stable_seconds': 60, 'maximum_wait_seconds': 300, 'poll_seconds': 2}
ORIGINAL_SECONDS = 5400
ADDED_WAIT_SECONDS = 32 * SETTLE['maximum_wait_seconds']
WORK_SECONDS = ORIGINAL_SECONDS + ADDED_WAIT_SECONDS
CLEANUP_SECONDS = 60


def module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    value = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(value)
    return value


previous = module('scope_v377_preserved', PREVIOUS)
execution = module('scope_v467_original_assessment', previous.ORIGINAL)
native = module('v467_scope_families', BASE / 'automatic-scope-native-v439/run.py')
resumed = module('v467_scope_resumed', BASE / 'automatic-scope-resumed-native-v459/run.py')
integration = module('v467_integrations', BASE / 'automatic-scope-integration-native-v444/run.py')
OWNER_CASES=((native,('scope-family-2051','scope-family-4096')),(resumed,('scope-lifecycle','scope-mtp-vision')),(integration,tuple(integration.NATIVE)))
c, core = execution.c, execution.core
digest, require = execution.digest, execution.require
OUT = execution.ROOT / '.build/optimization/automatic-scope-explicit-serving-v467'


def dependencies():
    files = [Path(__file__), HERE/'checks.py', HERE/'checks.stderr', BASE/'resource-resume-v458/resource-change.json', BASE/'corrected-scope-serving-v409/run.py', BASE/'corrected-scope-serving-v409/protocol.json', BASE/'corrected-scope-serving-v409/execution/qualification.json', BASE/'automatic-scope-native-v439/run.py', BASE/'automatic-scope-native-v439/preparation.json', BASE/'automatic-scope-resumed-native-v459/run.py', BASE/'automatic-scope-resumed-native-v459/preparation.json', BASE/'automatic-scope-integration-native-v444/run.py', BASE/'automatic-scope-integration-native-v444/preparation.json', BASE/'automatic-scope-build-v436/protocol.json', BASE/'automatic-scope-build-v436/lease-result.json', PREVIOUS, previous.HERE / 'preparation.json',
             previous.HERE / 'protocol.json', previous.HERE / 'binding.json',
             THERMAL / 'thermal_settle.py', THERMAL / 'build_driver.py',
             THERMAL / 'driver-transformation.json', THERMAL / 'checks.py',
             THERMAL / 'checks.stderr', DRIVER, THERMAL / 'driver/thermal_settle.py',
             THERMAL / 'driver/prefill_bench.py', execution.ROOT / 'Tools/thermal_readiness.py',
             execution.ROOT / 'Tools/optimization_readiness.py']
    transform = c.read(THERMAL / 'driver-transformation.json')
    require(transform['original_sha256'] == digest(execution.ROOT / 'Tools/serve_bench.py')
            and transform['driver_sha256'] == digest(DRIVER), 'isolated thermal driver changed')
    for name, expected in transform['source_files'].items():
        require(digest(Path(name)) == expected, 'thermal driver dependency changed')
    for name, source in [('thermal_settle.py', THERMAL / 'thermal_settle.py'),
                         ('prefill_bench.py', execution.ROOT / 'Tools/prefill_bench.py')]:
        require((THERMAL / 'driver' / name).read_bytes() == source.read_bytes(), 'packaged helper differs from source')
    checks = (THERMAL / 'checks.stderr').read_text()
    require('Ran 13 tests' in checks and checks.endswith('OK\n'), 'thermal preparation checks must pass')
    return {str(p.resolve()): digest(p) for p in files}


def prerequisites():
    result = {}
    for owner, names in OWNER_CASES:
        value = owner.load()
        for name in names:
            target = owner.OUT / name
            require(all((target/file).is_file() for file in ('stdout.txt','qualification.json','attempt.json','receipt.json')),'complete current native proof absent: '+name)
            report, receipt, attempt = (c.read(target / file) for file in ('stdout.txt', 'qualification.json', 'attempt.json'))
            require(receipt.get('passed') is True and receipt.get('qualified') is True
                    and receipt.get('cleanup_complete') is True and receipt.get('remaining_jobs') == []
                    and receipt.get('within_reservation') is True and receipt.get('proofs_unchanged') is True,
                    'all seven exact-source native cases must pass and drain')
            require(receipt['stdout_sha256'] == digest(target / 'stdout.txt')
                    and receipt['attempt_sha256'] == digest(target / 'attempt.json')
                    and receipt['execution_receipt_sha256'] == digest(target / 'receipt.json')
                    and attempt['command'] == value['commands'][name] and attempt['environment'] == {}
                    and attempt['policy'] == owner.policy(name) and attempt['build'] == native.load()['build'],
                    'native workload, policy or evidence identity changed')
            assessment = owner.assess(name, report)
            require(receipt['assertions'] == assessment['assertions'], 'native assertion count changed')
            result[name] = {'assertions': assessment['assertions'],
                'evidence': c.evidence(target, ['attempt.json', 'receipt.json', 'qualification.json', 'stdout.txt', 'stderr.txt'])}
    require(len(result) == 7, 'full native family absent')
    return result


def preserved_earlier():
    folder = previous.HERE / 'execution'
    receipt = c.read(folder / 'qualification.json')
    audit_path = BASE / 'scope-capacity-audit-v390/audit.json'
    audit = c.read(audit_path)
    require(receipt.get('qualified') is False and receipt.get('cleanup_complete') is True
            and receipt.get('remaining_jobs') == [] and 'absolute first/measured footprint ceiling' in receipt.get('error', ''),
            'preserved original capacity failure differs')
    require(audit['all64_exact_prompt_output_text_and_equal_work'] is True
            and audit['validated_first_requests'] == audit['validated_measured_requests'] == 32
            and audit['absolute_cap_bytes'] == 10_000_000_000
            and audit['protocol_sha256'] == digest(previous.HERE / 'protocol.json')
            and audit['results_sha256'] == digest(previous.OUT / 'serving/results.jsonl'),
            'original complete capacity diagnosis differs')
    return {'raw': c.artifact_hashes(previous.OUT / 'serving'), 'execution': c.artifact_hashes(folder),
            'audit_sha256': digest(audit_path),
            'meaning': 'V377 original full32-cell capacity failure preserved; V402 adds a real allocator/cache and allocation-pricing correction. No old rows enter this new cohort.'}


def preserved():
    result=preserved_earlier()
    prior=BASE/'corrected-scope-serving-v409'
    target=prior/'execution'
    raw=execution.ROOT/'.build/optimization/corrected-scope-serving-v409/serving'
    receipt=c.read(target/'qualification.json')
    rows=[json.loads(line) for line in (raw/'results.jsonl').read_text().splitlines()]
    require(receipt.get('qualified') is False and receipt.get('cleanup_complete') is True and receipt.get('remaining_jobs')==[] and receipt.get('within_reservation') is True,'V409 stop or cleanup differs')
    require(len(rows)==22 and rows[-1].get('round')==11 and rows[-1].get('arm')=='scope' and 'original startup memory requirement no longer fits' in rows[-1].get('error','') and rows[-1].get('server_pid') is None and 'metrics' not in rows[-1],'V409 headroom stop changed')
    proof=c.read(BASE/'resource-resume-v458/resource-change.json')
    require(proof['previous_reclaimable_bytes']<20_112_000_000 and proof['current_reclaimable_bytes']>=22_200_000_000 and all(digest(Path(p))==sha for p,sha in proof['resources'].items()),'verified material resource change absent')
    result['latest_headroom_stop']={'raw':c.artifact_hashes(raw),'execution':c.artifact_hashes(target),'protocol_sha256':digest(prior/'protocol.json'),'no_rows_reused':True}
    result['resource_change']=proof
    return result


def materialize(value):
    old = previous.materialize(value)
    result = copy.deepcopy(old)
    result['label'] = 'automatic-scope-explicit-serving-v467'
    result['classification'] = ('Exact V436 after the preserved V377 capacity failure and V409 headroom stop, requiring all seven current-source native cases from V439/V459/V444. The newly available memory does not enlarge any workload or cap. Automatic selection is separately unqualified and remains disabled in this original explicit-scope mechanism study. New full 32-cell scope cohort. Each cell retains its original 60-second cooldown '
        'then waits at most 300 additional seconds for 60 seconds of sampled nominal conditions. '
        'Original V170/V377 workload, memory target, 32 first requests, acceptance and exclusions remain. '
        'All old rows stay excluded from new evidence; no replacement or default activation.')
    result['before_cell_thermal_settle'] = dict(SETTLE)
    restored = copy.deepcopy(result)
    restored.pop('before_cell_thermal_settle')
    for key in ('label', 'classification'): restored[key] = old[key]
    require(restored == old, 'original workload, controls or acceptance changed')
    return result


def prepare():
    require(not (HERE / 'preparation.json').exists() and not OUT.exists(), 'already prepared or attempted')
    prior = preserved()
    value = native.load()
    materialize(value)
    proof = prerequisites()
    record = {'prepared_at': core.now(), 'dependencies': dependencies(), 'preserved': prior,
              'build': value['build'], 'native_proof': proof,
              'original_work_seconds': ORIGINAL_SECONDS, 'additional_wait_seconds': ADDED_WAIT_SECONDS,
              'whole_work_seconds': WORK_SECONDS, 'cleanup_seconds': CLEANUP_SECONDS,
              'settle_policy': SETTLE, 'model_launched': False}
    c.write_new(HERE / 'preparation.json', record)
    return {'prepared': True, 'model_launched': False, 'fixed_cells': 32,
            'whole_work_seconds': WORK_SECONDS, 'additional_wait_seconds': ADDED_WAIT_SECONDS}


def load():
    record, value = c.read(HERE / 'preparation.json'), native.load()
    require(record['dependencies'] == dependencies() and record['preserved'] == preserved()
            and record['build'] == value['build']
            and record['native_proof'] == prerequisites()
            and record['original_work_seconds'] == ORIGINAL_SECONDS == previous.original.SERVING_SECONDS
            and record['additional_wait_seconds'] == ADDED_WAIT_SECONDS
            and record['whole_work_seconds'] == WORK_SECONDS
            and record['cleanup_seconds'] == CLEANUP_SECONDS and record['settle_policy'] == SETTLE,
            'new source, prerequisite, original evidence or time/settling contract changed')
    return value


core.load = load
execution.HERE, execution.OUT = HERE, OUT
execution.load = load
execution.materialize = materialize
execution.prerequisites = prerequisites


def assess():
    result = execution.assess_serving()
    raw = OUT / 'serving'
    manifest = c.read(raw / 'manifest.json')
    require(manifest['harness_sources']['serve_bench.py'] == digest(DRIVER)
            and manifest['harness_sources']['prefill_bench.py'] == digest(THERMAL / 'driver/prefill_bench.py'),
            'executed isolated driver or helper differs')
    for line in (raw / 'results.jsonl').read_text().splitlines():
        row = json.loads(line); observed = row.get('thermal_settle', {})
        require(observed.get('enabled') is True and observed.get('reserved') is True
                and observed.get('before_launch_only') is True
                and observed.get('request_acceptance_unchanged') is True
                and 0 <= observed.get('seconds', -1) <= SETTLE['maximum_wait_seconds']
                and observed.get('sampled_nominal_seconds', 0) >= SETTLE['stable_seconds']
                and observed.get('samples', 0) >= 31, 'completed cell lacks the declared thermal precondition')
    return result


def run(deadline):
    core.allowance(deadline, WORK_SECONDS + CLEANUP_SECONDS)
    value, protocol = execution.load_serving()
    target, output = HERE / 'execution', OUT / 'serving'
    require(not target.exists() and not output.exists(), 'attempted cohort cannot retry')
    limit, before, thermal = core.readiness(deadline, WORK_SECONDS + CLEANUP_SECONDS, execution.STARTUP_GB)
    policy = dict(c.NATIVE_POLICY, startup_reclaimable_bytes=int(execution.STARTUP_GB * 1e9),
                  maximum_owned_rss_bytes=12_000_000_000, maximum_build_seconds=WORK_SECONDS,
                  stop_on_new_swapouts=True)
    command = [sys.executable, str(DRIVER), '--protocol', str(HERE / 'protocol.json'), '--out', str(output)]
    attempt = {'started_at': core.now(), 'deadline_utc': deadline, 'command': command, 'environment': {},
               'build': value['build'], 'before': before, 'thermal_prelaunch': thermal, 'policy': policy,
               'protocol_sha256': digest(HERE / 'protocol.json'), 'driver_sha256': digest(DRIVER),
               'preparation_sha256': digest(HERE / 'preparation.json'),
               'classification': protocol['classification']}
    def assessment(code):
        require(code in (0, 1), 'scope serving process failed')
        return assess()
    result = execution.finalize(target, core.execute(command, target, WORK_SECONDS, policy, assessment,
                                                    limit, attempt, output / 'results.jsonl'))
    if output.exists(): c.write_new(target / 'artifact-sha256.json', c.artifact_hashes(output))
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('action', choices=('prepare', 'freeze', 'status', 'run'))
    parser.add_argument('--deadline')
    args = parser.parse_args()
    with (HERE / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        if args.action == 'prepare': result = prepare()
        elif args.action == 'freeze': result = execution.freeze_serving()
        elif args.action == 'status':
            load(); result = {'frozen': (HERE / 'protocol.json').exists(), 'attempted': (HERE / 'execution').exists()}
        else:
            require(args.deadline is not None, 'full user-authorized interval required')
            result = run(args.deadline)
    print(json.dumps(result, indent=2), flush=True)
    return 1 if args.action == 'run' and result.get('qualified') is not True else 0


if __name__ == '__main__':
    raise SystemExit(main())

````````````

## Artifact SHA-256 35ab11dc7106ec90aacf22fb2a76f5475b83e36214df7f161ea0100e0c8c35db

Encoding: `utf-8`. Original bytes: 250.

````````````text
{
  "enabled": true,
  "reserved": true,
  "seconds": 79.441979458,
  "sampled_nominal_seconds": 30.540646666000008,
  "samples": 40,
  "before_launch_only": true,
  "request_acceptance_unchanged": true,
  "passed": true,
  "model_launched": false
}

````````````

## Artifact SHA-256 9ace1ecfbefa9ea843d4613d604b164f9da191fae657bfc469692df3cac4f90f

Encoding: `utf-8`. Original bytes: 901.

````````````text
from pathlib import Path
import json,sys,time
HERE=Path(__file__).resolve().parent
sys.path.insert(0,'/Users/carlos/Projects/slotstream/Tools')
sys.path.insert(0,'/tmp/slotstream-optimization-execution/thermal-settle-preparation-v388')
import thermal_settle
started=time.monotonic()
with (HERE/'samples.jsonl').open('x') as output:
 def record(value):
  output.write(json.dumps(value)+'\n');output.flush()
 try:
  result=thermal_settle.wait({'stable_seconds':30,'maximum_wait_seconds':300,'poll_seconds':2},22.2,record=record)
  result.update(passed=True,model_launched=False)
 except Exception as error:
  result={'passed':False,'model_launched':False,'error':type(error).__name__+': '+str(error),'elapsed_seconds':time.monotonic()-started}
(HERE/'result.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2),flush=True)
raise SystemExit(0 if result['passed'] else 1)

````````````

## Artifact SHA-256 c4e2cde7663faf8faed45a89523d67701a7dd491c6e69b330c4a110d59c1ac4d

Encoding: `utf-8`. Original bytes: 8712.

````````````text
{"seconds": 0.03330025, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30788763648, "swapins": 44352426, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 2.071127333, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30775099392, "swapins": 44352426, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 4.108521625, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31117344768, "swapins": 44352426, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 6.144192125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31140331520, "swapins": 44352426, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 8.18246125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30938759168, "swapins": 44352426, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 10.221693333, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30683348992, "swapins": 44352426, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 12.260065291999998, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30776442880, "swapins": 44352430, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 14.294511042, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30565646336, "swapins": 44352430, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 16.330305208, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30537695232, "swapins": 44352430, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 18.368407333, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30699094016, "swapins": 44352442, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 20.406407417, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30979784704, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 22.444872957999998, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30989844480, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 24.477930208, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31003066368, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 26.51306325, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30803230720, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 28.547297083, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30840258560, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 30.581846207999998, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 31030394880, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 32.613367249999996, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30723309568, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 34.650777083, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30715314176, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 36.686315125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30678876160, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 38.718182125, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30565367808, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 40.7532865, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30594957312, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 42.787719042, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30543560704, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 44.825091207999996, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30554275840, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 46.86969275, "conditions": {"thermalState": "fair", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30582620160, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 48.901332792, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30456102912, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 50.934931125, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30498979840, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 52.970478583, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30350770176, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 55.004927957999996, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30746361856, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 57.041885375, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30893703168, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 59.077030208, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30480728064, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 61.116039125, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30654300160, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 63.151029833, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30723833856, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 65.189013208, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30851301376, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 67.232457625, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30556995584, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 69.266911542, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30456348672, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 71.300625542, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30431379456, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 73.33667925, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30544379904, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 75.372946417, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30642094080, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 77.407466375, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30697914368, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}
{"seconds": 79.441979458, "conditions": {"thermalState": "nominal", "lowPowerModeEnabled": false}, "reclaimable_bytes": 30620975104, "swapins": 44352466, "swapouts": 77895019, "pressure_level": 1, "competing_jobs": []}

````````````
