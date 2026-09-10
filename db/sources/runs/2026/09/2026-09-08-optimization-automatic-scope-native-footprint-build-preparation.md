---
type: run
id: 01m21w32jr3a9dd82bm2pvd272
created: 2026-09-09T01:21:34.296054+00:00
updated: 2026-09-09T01:21:34.584042+00:00
summary: Corrected automatic scope source and exact guarded build preparation; unsigned Mach footprint fails closed on overflow
binary: uncompiled source preparation
captured_at: 2026-09-08
command: Source review, exact patch apply/reverse and preparation; no inference in this artifact
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Corrected automatic scope source and exact guarded build preparation; unsigned Mach footprint fails closed on overflow
tool: Slotstream exact native and source qualification capture
---
V430 preserves all V422 scheduling, local execution options, MTP dispatch restoration, V416 native refusal and V419 atomic fallback work. Source review found ProcessMemory.residentBytes returns UInt64 while the new helper expects Int. It now uses explicit saturating conversion, refuses the saturated footprint even without a process ceiling, and adds two native-type/overflow pure assertions. All ten changed sources apply/reverse exactly against V402. V431 freezes the complete 150-input candidate and 15-file lease with original resource/restore controls. Its build result is separate and is not claimed here. Automatic integration/deployment defaults remain disabled.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-build-v431/before.json",
    "bytes": 22820,
    "sha256": "a1e181e4fbc46acdbc95e312c9bb11991a464eb5453f32f93d0492c8a896c319"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-build-v431/preparation.json",
    "bytes": 3480,
    "sha256": "af429d08cb2c03f1c04bd4b2c96391e64134f42b3b1858a1b28b4e7f8ba6d54e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-build-v431/protocol.json",
    "bytes": 22623,
    "sha256": "9e936cc4ac6936b11d4da6f552d718c094468c8e0916b39e758c613d0e4d902e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-build-v431/run.py",
    "bytes": 10173,
    "sha256": "8a13450b2d33fed399a43e104a8993467f2ae983c7b8226df2d506c910397641"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/after/Sources/Slotstream/Context.swift",
    "bytes": 15234,
    "sha256": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/after/Sources/Slotstream/ContextMemory.swift",
    "bytes": 17399,
    "sha256": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/after/Sources/Slotstream/Engine.swift",
    "bytes": 58593,
    "sha256": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/after/Sources/Slotstream/Generate.swift",
    "bytes": 78464,
    "sha256": "09f19ca477799aa70abbaf1aff6d6d956e4b9e5f126bd08d24a171b9c4e7d1a7"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/after/Sources/Slotstream/Model.swift",
    "bytes": 56247,
    "sha256": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/after/Sources/Slotstream/Optimizations.swift",
    "bytes": 15366,
    "sha256": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/after/Sources/Slotstream/RequestControl.swift",
    "bytes": 15167,
    "sha256": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/after/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
    "bytes": 49287,
    "sha256": "3073de4167c10667101cf3e46e332632b38303d94b50896d3e4c05dd3eafafd3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/after/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift",
    "bytes": 80213,
    "sha256": "c5057f3f6e5b9fa557fb33066b9255ec7e9da00b4060d971539fce10d18fedf8"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/after/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
    "bytes": 20891,
    "sha256": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/before/Sources/Slotstream/Context.swift",
    "bytes": 14145,
    "sha256": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/before/Sources/Slotstream/ContextMemory.swift",
    "bytes": 16671,
    "sha256": "cd380f1cdde2622fe966f6aad22d3b54bf2e2b1da197cf0083c33cc8370fd224"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/before/Sources/Slotstream/Engine.swift",
    "bytes": 58066,
    "sha256": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/before/Sources/Slotstream/Generate.swift",
    "bytes": 75288,
    "sha256": "673d9e4ef2d8d4299b5c227674efff8d714001869587773e77e1884233a2ede2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/before/Sources/Slotstream/Model.swift",
    "bytes": 54782,
    "sha256": "eae1859a42fd26f102a624e66560f770e9860114a8eb7478b6920fcfc97055e6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/before/Sources/Slotstream/Optimizations.swift",
    "bytes": 14292,
    "sha256": "c676838c165ca4a9de74fc763bc03282628db4e58ab5f90e211c276d5ffe9729"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/before/Sources/Slotstream/RequestControl.swift",
    "bytes": 12590,
    "sha256": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/before/Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
    "bytes": 33864,
    "sha256": "76ab59f9bf34d34cd66fe00f8f383dc33813696120b143d571ea3c8e93f483db"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/before/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift",
    "bytes": 61362,
    "sha256": "77e902b2efccbb59c9ee6695f115beb8f9e0c39e23f2a8e49d488404e1e25542"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/before/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
    "bytes": 18500,
    "sha256": "91a2f69fa21063719c9eed2cb91708bad92fbd0e306a61d50be662774db21767"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/integration.patch",
    "bytes": 68594,
    "sha256": "0e26572461cf2f968e9c1c69f81bd813d9a596e9c7429aff9fefa62e7ebaa6c4"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/preparation.json",
    "bytes": 5477,
    "sha256": "329fd1f9e1881c44350f490a2eb4ec075df74c101d6e8dfe9947f8f74babe3cc"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/prepare-automatic-scope-build-v432.py",
    "bytes": 5264,
    "sha256": "42779adc739af6f01d29c124734b4cecb198d6215fd50537ff0744e930bf35f3"
  }
]
```

## Artifact SHA-256 a1e181e4fbc46acdbc95e312c9bb11991a464eb5453f32f93d0492c8a896c319

Encoding: `utf-8`. Original bytes: 22820.

````````````text
{
  "captured_at": "2026-09-09T01:19:48.619913+00:00",
  "source": [
    {
      "path": "Sources/Slotstream/Context.swift",
      "before_sha256": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
      "after_sha256": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e"
    },
    {
      "path": "Sources/Slotstream/ContextMemory.swift",
      "before_sha256": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
      "after_sha256": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544"
    },
    {
      "path": "Sources/Slotstream/Engine.swift",
      "before_sha256": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
      "after_sha256": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d"
    },
    {
      "path": "Sources/Slotstream/Generate.swift",
      "before_sha256": "9bd9619a98aa62685be2de5148942455456b5d30fcf18e5a384148a4ae313da2",
      "after_sha256": "09f19ca477799aa70abbaf1aff6d6d956e4b9e5f126bd08d24a171b9c4e7d1a7"
    },
    {
      "path": "Sources/Slotstream/Model.swift",
      "before_sha256": "a4cea913e0f438a69e72672d42046bf904717700d8753c1449e5e48b419033a6",
      "after_sha256": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4"
    },
    {
      "path": "Sources/Slotstream/Optimizations.swift",
      "before_sha256": "9ec7c669fbe7c88a88ec55aedbdc7afb87b696182333324265fdf95f60a5a5f1",
      "after_sha256": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce"
    },
    {
      "path": "Sources/Slotstream/Plan.swift",
      "before_sha256": "d1021e321894868c4844f2cbe4978c3ca6c6cfa958c9aa64591e9d0ec08e8ff7",
      "after_sha256": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d"
    },
    {
      "path": "Sources/Slotstream/PlannerCostModel.swift",
      "before_sha256": null,
      "after_sha256": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0"
    },
    {
      "path": "Sources/Slotstream/RequestControl.swift",
      "before_sha256": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
      "after_sha256": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d"
    },
    {
      "path": "Sources/Slotstream/Weights.swift",
      "before_sha256": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "after_sha256": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift",
      "before_sha256": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
      "after_sha256": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
      "before_sha256": "7363b347ae2df47ff005cb414722434d8d67783ea85a228d68f3b829153f5f8e",
      "after_sha256": "3073de4167c10667101cf3e46e332632b38303d94b50896d3e4c05dd3eafafd3"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift",
      "before_sha256": "f4b9c59e6abc340e8f15b2d523296ab74fcd269cc39c67f514cb18f41a1f6a96",
      "after_sha256": "c5057f3f6e5b9fa557fb33066b9255ec7e9da00b4060d971539fce10d18fedf8"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift",
      "before_sha256": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
      "after_sha256": "f40d8e711121f12cbcd95f8880d483ac36995faeab06af714d201fa1671348f1"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
      "before_sha256": "a57d3ec3d19007bdb48a109214bcc3eb1e6b4e401cb3baaa1296952e39d4bfc6",
      "after_sha256": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2"
    }
  ],
  "release": {
    "slotstream": "9002c67e0094ebb14b22efed27168e513b37639a43b2a28bb8fb5a28e1c74cf9",
    "slotstream-checks": "bb7741f353d2696ba95340b160c0983b445c559eef861c285089f825844969f9",
    "mlx.metallib": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
    "build-identity.json": "03cca03bade110303c79d9dd61572347cb3a0eedcd16e10f64a2343d782de627",
    "build-source.tar.gz": "dbdef8e89d59e853fabca4661eff67851fd097c8680beed9fab5fb465a0b819d",
    "build-source-before.json": "db119907fac797783dfb2907a31fee51f47cc536963165153cb49efbdd958568"
  },
  "root_source": {
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
    "Sources/Slotstream/Generate.swift": "9bd9619a98aa62685be2de5148942455456b5d30fcf18e5a384148a4ae313da2",
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
    "Sources/Slotstream/Optimizations.swift": "9ec7c669fbe7c88a88ec55aedbdc7afb87b696182333324265fdf95f60a5a5f1",
    "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
    "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
    "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
    "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
    "Sources/Slotstream/Plan.swift": "d1021e321894868c4844f2cbe4978c3ca6c6cfa958c9aa64591e9d0ec08e8ff7",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "a57d3ec3d19007bdb48a109214bcc3eb1e6b4e401cb3baaa1296952e39d4bfc6",
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
  "state": "Preserve all shared source, artifacts and first-party SwiftPM state. Complete V402 plus exact V430 explicit-only automatic scope integration and V416/V419 tests, only inside the guarded lease."
}

````````````

## Artifact SHA-256 af429d08cb2c03f1c04bd4b2c96391e64134f42b3b1858a1b28b4e7f8ba6d54e

Encoding: `utf-8`. Original bytes: 3480.

````````````text
{
  "passed": true,
  "compiler_launched": false,
  "source_inputs": 150,
  "source_lease_files": 15,
  "changed_since_v402_candidate": {
    "Sources/Slotstream/Context.swift": {
      "before": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
      "after": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e"
    },
    "Sources/Slotstream/ContextMemory.swift": {
      "before": "cd380f1cdde2622fe966f6aad22d3b54bf2e2b1da197cf0083c33cc8370fd224",
      "after": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544"
    },
    "Sources/Slotstream/Engine.swift": {
      "before": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
      "after": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d"
    },
    "Sources/Slotstream/Generate.swift": {
      "before": "673d9e4ef2d8d4299b5c227674efff8d714001869587773e77e1884233a2ede2",
      "after": "09f19ca477799aa70abbaf1aff6d6d956e4b9e5f126bd08d24a171b9c4e7d1a7"
    },
    "Sources/Slotstream/Model.swift": {
      "before": "eae1859a42fd26f102a624e66560f770e9860114a8eb7478b6920fcfc97055e6",
      "after": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4"
    },
    "Sources/Slotstream/Optimizations.swift": {
      "before": "c676838c165ca4a9de74fc763bc03282628db4e58ab5f90e211c276d5ffe9729",
      "after": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce"
    },
    "Sources/Slotstream/RequestControl.swift": {
      "before": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
      "after": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d"
    },
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": {
      "before": "76ab59f9bf34d34cd66fe00f8f383dc33813696120b143d571ea3c8e93f483db",
      "after": "3073de4167c10667101cf3e46e332632b38303d94b50896d3e4c05dd3eafafd3"
    },
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": {
      "before": "77e902b2efccbb59c9ee6695f115beb8f9e0c39e23f2a8e49d488404e1e25542",
      "after": "c5057f3f6e5b9fa557fb33066b9255ec7e9da00b4060d971539fce10d18fedf8"
    },
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": {
      "before": "91a2f69fa21063719c9eed2cb91708bad92fbd0e306a61d50be662774db21767",
      "after": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2"
    }
  },
  "reverse_patch_reconstructs_original_candidate": true,
  "all_held_default_planner_cache_accounting_changes_preserved": true,
  "automatic_defaults_enabled": false,
  "shared_release_unchanged": true,
  "driver_hashes_unchanged": true,
  "original_executor_body_preserved_except_version_paths": true,
  "protocol_sha256": "9e936cc4ac6936b11d4da6f552d718c094468c8e0916b39e758c613d0e4d902e",
  "executor_sha256": "8a13450b2d33fed399a43e104a8993467f2ae983c7b8226df2d506c910397641",
  "new_native_requirements": {
    "scope-lifecycle": {
      "automatic_planner_geometries": 3,
      "automatic_memory_fallbacks": 2,
      "additional_checks": "exact states/routes/output/teacher continuation, prefix reuse, short path, cancellation, checked read fault/retry and public controls stable within router callbacks"
    },
    "scope-mtp-vision": {
      "automatic_mtp_planner_geometries": 3,
      "automatic_mtp_prompt_tokens": 4096,
      "additional_checks": "aligned final scope followed by actual fixed-depth speculative decode; exact outputs/states, private head dispatch restored"
    }
  }
}

````````````

## Artifact SHA-256 9e936cc4ac6936b11d4da6f552d718c094468c8e0916b39e758c613d0e4d902e

Encoding: `utf-8`. Original bytes: 22623.

````````````text
{
  "classification": "Exact V402 plus V430 local execution options, automatic scheduling, per-request live plan ceiling and atomic allocation fallback, with expanded real native/pure tests. Automatic integration/deployment defaults remain off. All source and resource/performance gates remain mandatory.",
  "frozen_at": "2026-09-09T01:19:48.619913+00:00",
  "drivers": {
    "build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
  },
  "candidate_source": {
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
    "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "c5057f3f6e5b9fa557fb33066b9255ec7e9da00b4060d971539fce10d18fedf8",
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
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0"
  },
  "policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1200,
    "compiler_jobs": 1,
    "stop_on_new_swapouts": true
  },
  "maximum_whole_interval_seconds": 1220,
  "required_complete_reservation_seconds": 1250,
  "wrapper_sha256": "8a13450b2d33fed399a43e104a8993467f2ae983c7b8226df2d506c910397641",
  "source_lease": "Restore all 15 shared source preimages, six release artifacts, release alias and first-party SwiftPM mutable state exactly. Keep the original model lock throughout.",
  "prior_build": {
    "path": "/tmp/slotstream-optimization-execution/scope-allocation-build-v402/protocol.json",
    "sha256": "5e131ff8fe53010ca20fbd6356a2ffd356fb8169ec392434acd02d16b6f10c7f"
  },
  "correction": {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v430/preparation.json",
    "sha256": "329fd1f9e1881c44350f490a2eb4ec075df74c101d6e8dfe9947f8f74babe3cc"
  },
  "changes_from_v402": {
    "Sources/Slotstream/Context.swift": {
      "before": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
      "after": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e"
    },
    "Sources/Slotstream/ContextMemory.swift": {
      "before": "cd380f1cdde2622fe966f6aad22d3b54bf2e2b1da197cf0083c33cc8370fd224",
      "after": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544"
    },
    "Sources/Slotstream/Engine.swift": {
      "before": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
      "after": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d"
    },
    "Sources/Slotstream/Generate.swift": {
      "before": "673d9e4ef2d8d4299b5c227674efff8d714001869587773e77e1884233a2ede2",
      "after": "09f19ca477799aa70abbaf1aff6d6d956e4b9e5f126bd08d24a171b9c4e7d1a7"
    },
    "Sources/Slotstream/Model.swift": {
      "before": "eae1859a42fd26f102a624e66560f770e9860114a8eb7478b6920fcfc97055e6",
      "after": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4"
    },
    "Sources/Slotstream/Optimizations.swift": {
      "before": "c676838c165ca4a9de74fc763bc03282628db4e58ab5f90e211c276d5ffe9729",
      "after": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce"
    },
    "Sources/Slotstream/RequestControl.swift": {
      "before": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
      "after": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d"
    },
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": {
      "before": "76ab59f9bf34d34cd66fe00f8f383dc33813696120b143d571ea3c8e93f483db",
      "after": "3073de4167c10667101cf3e46e332632b38303d94b50896d3e4c05dd3eafafd3"
    },
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": {
      "before": "77e902b2efccbb59c9ee6695f115beb8f9e0c39e23f2a8e49d488404e1e25542",
      "after": "c5057f3f6e5b9fa557fb33066b9255ec7e9da00b4060d971539fce10d18fedf8"
    },
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": {
      "before": "91a2f69fa21063719c9eed2cb91708bad92fbd0e306a61d50be662774db21767",
      "after": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2"
    }
  }
}

````````````

## Artifact SHA-256 8a13450b2d33fed399a43e104a8993467f2ae983c7b8226df2d506c910397641

Encoding: `utf-8`. Original bytes: 10173.

````````````text
from pathlib import Path
import datetime,fcntl,json,os,shutil,signal,stat,subprocess,sys,time,traceback
ROOT=Path("/Users/carlos/Projects/slotstream")
PACKET=Path(__file__).parent
sys.path.insert(0,str(ROOT/"Tools"))
from build_identity import source_files
from optimization_build import build
from optimization_serial_build import POLICY,guarded_run,check_whole_interval
from prefill_bench import digest,vm_snapshot
from serve_bench import competing_jobs
from optimization_readiness import pressure_snapshot,require_normal

def tree_state(path):
    if path.is_symlink(): return {"kind":"symlink","target":os.readlink(path),"mode":stat.S_IMODE(path.lstat().st_mode)}
    if not path.exists(): return {"kind":"absent"}
    if path.is_file(): return {"kind":"file","sha256":digest(path),"mode":stat.S_IMODE(path.stat().st_mode),"mtime_ns":path.stat().st_mtime_ns}
    return {"kind":"directory","mode":stat.S_IMODE(path.stat().st_mode),"entries":{str(p.relative_to(path)):tree_state(p) for p in sorted(path.iterdir())}}

def clone(path,destination):
    destination.parent.mkdir(parents=True,exist_ok=True)
    subprocess.run(["/bin/cp","-cRp",str(path),str(destination)],check=True,capture_output=True,text=True)

def snapshot(paths,backup):
    result={}
    for path in paths:
        relative=path.relative_to(ROOT)
        result[str(relative)]=tree_state(path)
        if path.exists() or path.is_symlink(): clone(path,backup/relative)
    return result

def restore(paths,backup,expected):
    for path in paths:
        if path.is_symlink() or path.is_file(): path.unlink()
        elif path.is_dir(): shutil.rmtree(path)
        original=backup/path.relative_to(ROOT)
        if original.exists() or original.is_symlink(): clone(original,path)
    actual={str(path.relative_to(ROOT)):tree_state(path) for path in paths}
    if actual!=expected: raise RuntimeError("leased build state was not restored exactly")

def restore_link(path,expected):
    if tree_state(path)==expected: return
    if path.is_symlink() or path.is_file(): path.unlink()
    elif path.exists():
        # Preserve any unexpected SwiftPM alias directory for diagnosis.
        quarantine=path.with_name(path.name+".v431-unexpected")
        if quarantine.exists() or quarantine.is_symlink(): raise RuntimeError("release-alias quarantine already exists")
        path.rename(quarantine)
    path.symlink_to(expected['target'])
    if tree_state(path)!=expected: raise RuntimeError("release alias was not restored exactly")

def observed_memory():
    state=vm_snapshot();require_normal(pressure_snapshot());return state

def main():
    deadline=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp()
    assert deadline-time.time()>=1250, 'complete lease must fit the explicitly granted interval'
    output=ROOT/".build/optimization/automatic-scope-build-v431"
    receipt=PACKET/"lease-result.json"
    assert not output.exists() and not receipt.exists()
    protocol=json.loads((PACKET/"protocol.json").read_text())
    original=json.loads((PACKET/"before.json").read_text())
    files=original["source"]
    frozen={"source":original["root_source"]}
    for name,sha in protocol["drivers"].items(): assert digest(ROOT/"Tools"/name)==sha
    def interrupted(number,_frame): raise KeyboardInterrupt(f"lease interrupted by signal {number}")
    signal.signal(signal.SIGTERM,interrupted);signal.signal(signal.SIGINT,interrupted)
    record={"classification":"temporary cached build lease; no model or performance result", "started_at":datetime.datetime.now(datetime.timezone.utc).isoformat(),"protocol_sha256":digest(PACKET/"protocol.json"),"passed":False,"restored":False}
    started=time.monotonic();leased=False;result=None;state_paths=[];state_before=None;applied=[]
    release=ROOT/".build/arm64-apple-macosx/release"
    with open(f"/tmp/slotstream-model-{os.getuid()}.lock","a") as lock:
        fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
        record["before"]=vm_snapshot()
        record["before_pressure"]=pressure_snapshot();require_normal(record["before_pressure"])
        if record["before"]["reclaimable_bytes"]<POLICY["startup_reclaimable_bytes"]: raise RuntimeError("cached lease headroom unavailable; no mutation")
        assert not competing_jobs()
        assert (ROOT/".build/release").is_symlink()
        link_state=tree_state(ROOT/".build/release")
        link=link_state['target'];record["release_symlink_before"]=link_state
        assert {str(p.relative_to(ROOT)):digest(p) for p in source_files(ROOT)}==frozen["source"]
        for entry in files:
            path=ROOT/entry["path"];assert (digest(path) if path.exists() else None)==entry["before_sha256"]
        assert all(digest(ROOT/".build/release"/n)==h for n,h in original["release"].items())
        source_before={entry['path']:tree_state(ROOT/entry['path']) for entry in files}
        release_before={name:tree_state(ROOT/'.build/release'/name) for name in original['release']}
        state_paths=sorted([p for p in release.iterdir() if p.is_dir() and ("slotstream" in p.name.lower() or "cslotpack" in p.name.lower())])
        state_paths += [release/"Modules",ROOT/".build/build.db",ROOT/".build/build.db-wal",ROOT/".build/build.db-shm",ROOT/".build/release.yaml",ROOT/".build/workspace-state.json",release/"description.json"]
        state_before=snapshot(state_paths,PACKET/"build-state-before")
        (PACKET/"build-state-before.json").write_text(json.dumps(state_before,indent=2)+"\n")
        try:
            leased=True
            for entry in files:
                path=ROOT/entry["path"];after=PACKET/"after"/entry["path"]
                assert digest(after)==entry["after_sha256"]
                pending=path.with_suffix(path.suffix+".v431-pending");shutil.copy2(after,pending);pending.replace(path)
                applied.append(entry)
            actual={str(p.relative_to(ROOT)):digest(p) for p in source_files(ROOT)}
            assert actual==protocol["candidate_source"]
            record["source_applied"]=True
            result=build(ROOT,output,required_gb=9.5,jobs=1,lock_path=PACKET/"inner-build.lock",
                run=lambda command,**kwargs:guarded_run(command,**kwargs,record_path=output/"live-memory.json",snapshot=observed_memory))
            record["build_passed"]=result["passed"]
            live=json.loads((output/"live-memory.json").read_text()) if (output/"live-memory.json").exists() else {}
            check_whole_interval(result,record["before"],vm_snapshot(),time.monotonic()-started,live)
            record["passed"]=True
        except BaseException as error:
            record["error"]=f"{type(error).__name__}: {error}"
            record["traceback"]=traceback.format_exc()
        finally:
            try: record["before_restoration"]=vm_snapshot()
            except BaseException as error: record['before_restoration_error']=f'{type(error).__name__}: {error}';record['passed']=False
            try:
                if leased:
                    for entry in applied:
                        path=ROOT/entry["path"];assert path.exists() and digest(path)==entry["after_sha256"],"source changed outside the lease"
                    for entry in applied:
                        path=ROOT/entry["path"]
                        if entry["before_sha256"] is None: path.unlink()
                        else:
                            pending=path.with_suffix(path.suffix+".v431-restore");shutil.copy2(PACKET/"source-before"/entry["path"],pending);pending.replace(path)
                    restore(state_paths,PACKET/"build-state-before",state_before)
                    restore_link(ROOT/".build/release",link_state)
                    for name,sha in original["release"].items():
                        path=ROOT/".build/release"/name;pending=path.with_name(path.name+".v431-restore")
                        shutil.copy2(PACKET/"release-before"/name,pending);pending.replace(path);assert digest(path)==sha
                assert {entry['path']:tree_state(ROOT/entry['path']) for entry in files}==source_before
                assert {name:tree_state(ROOT/'.build/release'/name) for name in original['release']}==release_before
                assert tree_state(ROOT/".build/release")==link_state
                assert {str(p.relative_to(ROOT)):digest(p) for p in source_files(ROOT)}==frozen["source"]
                assert not (ROOT/"Sources/Slotstream/PlannerCostModel.swift").exists()
                record["restored"]=True
            except BaseException as error:
                record["restoration_error"]=f"{type(error).__name__}: {error}";record["passed"]=False
            try: record["after"]=vm_snapshot()
            except BaseException as error: record['after_error']=f'{type(error).__name__}: {error}';record['passed']=False
            record["elapsed_seconds"]=time.monotonic()-started
            if record["elapsed_seconds"]>1220: record["passed"]=False;record["interval_error"]="lease/build/restoration exceeded1220seconds"
            try:
                if competing_jobs(): record["passed"]=False;record["process_error"]="compiler/model jobs remain at handback"
            except BaseException as error:
                record["passed"]=False;record['process_error']=f'{type(error).__name__}: {error}'
            if 'after' not in record or record["after"]["swapouts"]!=record["before"]["swapouts"] or record["after"]["reclaimable_bytes"]<6e9:
                record["passed"]=False;record["resource_error"]="complete lease resource interval failed"
            if not record["passed"] and (output/"candidate").exists(): (output/"candidate").rename(output/"unqualified-candidate")
            record['deadline_utc']=sys.argv[1]
            record['within_reservation']=time.time()<=deadline
            record['passed']=record['passed'] and record['within_reservation']
            receipt.write_text(json.dumps(record,indent=2)+"\n")
    print(json.dumps({k:v for k,v in record.items() if k not in ["before","after","before_restoration"]}),flush=True)
    return 0 if record["passed"] and record["restored"] else 1

if __name__=="__main__": raise SystemExit(main())

````````````

## Artifact SHA-256 58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e

Encoding: `utf-8`. Original bytes: 15234.

````````````text
// Context length: the cap, why it is what it is, and the prefill schedule that
// keeps a long prompt's transient memory inside what has been measured.

import Foundation

public enum ContextPolicy {
    /// Pinned checkpoint configuration. This is independent of qualification.
    public static let modelLimit = 262_144
    /// Longest prompt plus reply any one request may hold, in tokens.
    ///
    /// The Hermes qualification read 65,520 prompt tokens plus a reply; the
    /// remainder is reserved reply room. This is a measured serving envelope,
    /// not the model's 262,144-token configured limit or an answer-quality claim.
    /// The larger requested window is priced before allocating the expert pool.
    /// See MEASUREMENTS.md, Hermes integration, for the initial budget failure
    /// and the planned-context qualification. Keep ordinary defaults unchanged.
    public static let maxTokens = 65_536
    public static let implementationLimit = maxTokens
    public static let mtpLimit = 65_536
    public static let visionLimit = 65_536
    public static let defaultTokens = 32_768
    /// Context the fixed footprint (Planner.fixedFootprintGB) already pays for.
    public static let tokensInFixedFootprint = 32_768

    package static func maximumDraftDepth(requested: Int, at consumed: Int, limit: Int) -> Int {
        guard requested >= 0, consumed >= 0, consumed <= limit,
              limit > 0, limit <= modelLimit else { return 0 }
        return min(requested, max(0, limit - consumed - 1))
    }

    /// nil when `tokens` is an acceptable --max-context, otherwise the reason.
    public static func validationError(_ tokens: Int) -> String? {
        validationError(tokens, qualification: false)
    }

    public static func validationError(_ tokens: Int, qualification: Bool) -> String? {
        let limit = qualification ? modelLimit : implementationLimit
        if (1 ... limit).contains(tokens) { return nil }
        return "--max-context must be between 1 and \(limit) (prompt plus reply). "
            + "The pinned model limit is \(modelLimit); the released implementation limit is "
            + "\(implementationLimit). A model limit does not guarantee memory fit or answer quality."
    }
}

/// How a prompt is split into prefill passes.
///
/// A pass is faster the bigger it is (the expert stream is re-read roughly once
/// per pass), but the sparse-attention layers score every query token of the
/// pass against every key already in the context, so the pass's transient
/// memory grows with chunk × context, not with the chunk alone. Every number
/// the planner charges for a pass was measured with that product at most
/// `measuredQueryKeyProduct`. Past that point the schedule halves the pass
/// instead of letting the transient grow into space nothing has measured.
public enum PrefillSchedule {
    /// The largest query-by-key product any prefill measurement covered: a
    /// 4096-token pass finishing an 8,016-token prompt (MEASUREMENTS.md,
    /// "Prefill, second pass"). Do not raise it without a new measurement.
    public static let measuredQueryKeyProduct = 4096 * 8016
    /// Late-context passes use the existing small-pass pool path. Their cost
    /// stays unknown until a matching measurement has been registered.
    public static let minChunk = 64

    /// The pass to run when the state already holds `position` tokens and the
    /// plan allows `maxChunk`: halve from `maxChunk` until the product with
    /// the context the pass attends over is inside the measured bound, never
    /// below `minChunk`.
    public static func chunk(at position: Int, maxChunk: Int) -> Int {
        guard position >= 0, position < ContextPolicy.modelLimit else { return 0 }
        // Preserve the original 256-row dispatch while it fits. An odd
        // override such as 4095 must not halve through 511 to 255 inside the
        // existing serving window and silently select small-pass arithmetic.
        let floor = fits(256, at: position) ? 256 : minChunk
        var c = min(4096, max(floor, maxChunk))
        while c > floor, !fits(c, at: position) {
            c = max(floor, c / 2)
        }
        while c > 1, !fits(c, at: position) { c /= 2 }
        return fits(c, at: position) ? c : 0
    }

    /// Division avoids overflowing arbitrary diagnostic inputs. The accepted
    /// context ceiling is unchanged; within it even the minimum pass fits.
    public static func fits(_ count: Int, at position: Int) -> Bool {
        count > 0 && position >= 0 && position <= measuredQueryKeyProduct / count - count
    }

    /// Check the actual remaining rows before shrinking a hypothetical full
    /// pass. A 3,864-row tail after 4,096 fits the existing measured envelope.
    public static func next(remaining: Int, at position: Int, maxChunk: Int, tailAware: Bool) -> Int {
        guard remaining > 0 else { return 0 }
        guard position >= 0, position < ContextPolicy.modelLimit,
              remaining <= ContextPolicy.modelLimit - position else { return 0 }
        let candidate = min(remaining, min(4096, max(1, maxChunk)))
        if tailAware, fits(candidate, at: position) { return candidate }
        return min(remaining, chunk(at: position, maxChunk: maxChunk))
    }

    /// Group existing chronological compute passes without enlarging any
    /// query-by-key product. A scope shares reads; it is not a compute pass.
    public static func scopePasses(remaining: Int, at position: Int, maxChunk: Int,
                                   maxScope: Int, tailAware: Bool) -> [Int] {
        guard remaining > 0, position >= 0, position < ContextPolicy.modelLimit,
              remaining <= ContextPolicy.modelLimit - position else { return [] }
        var result: [Int] = [], count = 0
        let bound = max(minChunk, min(8192, maxScope))
        while count < remaining {
            let (pos, overflow) = max(0, position).addingReportingOverflow(count)
            guard !overflow else { break }
            let n = next(remaining: remaining - count, at: pos, maxChunk: maxChunk, tailAware: tailAware)
            // A short final pass uses the reference cached kernel family;
            // keep it separate until swept short tails have their own gate.
            if n == 0 || (count > 0 && (n < SweepTuning.minTokens || n > bound - count)) { break }
            result.append(n); count += n
            if count >= bound { break }
        }
        return result
    }

    /// Candidate automatic policy: amortize a full-layer workspace over at
    /// least four identical, full matrix passes. Short/odd tails and a common
    /// prefix checkpoint keep their original dispatch. The actual scheduled
    /// pass may be smaller than the planner ceiling at a long context.
    package static func automaticScopePasses(remaining: Int, at position: Int,
                                            maxChunk: Int, checkpoint: Int?) -> [Int]? {
        guard (256 ... 4096).contains(maxChunk) else { return nil }
        let scheduled = chunk(at: position, maxChunk: maxChunk)
        guard [256, 512, 1024].contains(scheduled), scheduled >= SweepTuning.minTokens else { return nil }
        var proposed = scopePasses(remaining: remaining, at: position,
            maxChunk: maxChunk, maxScope: 4096, tailAware: false)
        if let checkpoint { proposed = preservingCheckpoint(proposed, from: position, checkpoint: checkpoint) }
        proposed = Array(proposed.prefix(while: { $0 == scheduled }))
        return proposed.count >= 4 ? proposed : nil
    }

    /// End a read-sharing group at a requested checkpoint only when one of
    /// its existing compute passes already ends there. This preserves every
    /// arithmetic shape; an interior token never manufactures a new pass.
    package static func preservingCheckpoint(_ passes: [Int], from position: Int,
                                             checkpoint: Int) -> [Int] {
        guard position >= 0, checkpoint > position,
              checkpoint <= ContextPolicy.modelLimit else { return passes }
        var end = position
        for (index, count) in passes.enumerated() {
            guard count > 0, count <= ContextPolicy.modelLimit - end else { return passes }
            end += count
            if end == checkpoint { return Array(passes.prefix(index + 1)) }
            if end > checkpoint { return passes }
        }
        return passes
    }

    /// The passes that reading `tokens` new tokens from `position` runs.
    public static func passes(tokens: Int, from position: Int = 0, maxChunk: Int, tailAware: Bool = false) -> [Int] {
        computePasses(tokens: tokens, from: position, maxChunk: maxChunk, tailAware: tailAware).map(\.tokens)
    }

    public struct ComputePass: Sendable {
        public let tokens: Int
        public let queryRows: Int
        public let keyExtent: Int
    }

    /// Include the canonical late-context dispatch shape and masked columns,
    /// using the same bounded geometry as Generator. A nominal odd pass can
    /// shrink again for numerical alignment; diagnostics must report that.
    public static func computePasses(tokens: Int, from position: Int = 0,
                                     maxChunk: Int, tailAware: Bool = false) -> [ComputePass] {
        guard position >= 0, tokens >= 0, position <= ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - position else { return [] }
        var out: [ComputePass] = []
        var pos = position
        var left = tokens
        let end = position + tokens
        var referenceStart: Int?
        while left > 0 {
            var c = next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: tailAware)
            let small = chunk(at: pos, maxChunk: 256) < 256
            if small {
                if referenceStart == nil { referenceStart = pos }
                c = ContextWorkspace.boundedSmallPass(requested: c, at: pos,
                    referenceStart: referenceStart!, referenceEnd: end)
            }
            guard c > 0 else { return [] }
            let extent = small ? ContextWorkspace.keyExtent(pass: c, context: pos + c,
                referenceStart: referenceStart!, referenceEnd: end) : pos + c
            let queries = small ? ContextWorkspace.queryRows(pass: c, context: pos + c,
                referenceStart: referenceStart!, referenceEnd: end) : c
            guard extent > 0, queries <= measuredQueryKeyProduct / extent else { return [] }
            out.append(ComputePass(tokens: c, queryRows: queries, keyExtent: extent))
            pos += c
            left -= c
        }
        return out
    }

    /// Seconds to read `tokens` new prompt tokens at this plan: the schedule's
    /// passes priced at the measured per-pass throughput anchors
    /// (Planner.estPrefillTokS). The last, partial pass is priced at the rate
    /// of the pass size it was cut from — slightly pessimistic, on purpose.
    public static func estSeconds(tokens: Int, from position: Int = 0, maxChunk: Int, tailAware: Bool = false) -> Double {
        estimateSeconds(tokens: tokens, from: position, maxChunk: maxChunk, tailAware: tailAware) ?? .infinity
    }

    /// nil means there is no qualified throughput anchor for this schedule.
    public static func estimateSeconds(tokens: Int, from position: Int = 0, maxChunk: Int,
                                       tailAware: Bool = false) -> Double? {
        guard position >= 0, tokens >= 0, position <= ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - position else { return nil }
        var secs = 0.0
        var pos = max(0, position)
        var left = max(0, tokens)
        while left > 0 {
            let full = tailAware
                ? next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: true)
                : chunk(at: pos, maxChunk: maxChunk)
            let c = min(full, left)
            guard c > 0, full >= 256 else { return nil }
            secs += Double(c) / Planner.estPrefillTokS(chunk: full)
            pos += c
            left -= c
        }
        return secs
    }

    /// "18 s" / "1.2 min" / "1.5 h": the same rounding everywhere it is shown.
    public static func describe(seconds: Double) -> String {
        guard seconds.isFinite else { return "unknown (schedule not yet calibrated)" }
        if seconds < 60 { return String(format: "%.0f s", seconds.rounded()) }
        if seconds < 3600 { return String(format: "%.1f min", seconds / 60) }
        return String(format: "%.1f h", seconds / 3600)
    }
}

/// Progress lines for a long prefill, shared by `run` (stderr) and `serve`
/// (its log). A prompt under `quietBelowTokens` prints nothing: the wait is
/// seconds and the lines would be noise.
public final class PrefillProgressReporter {
    public let quietBelowTokens: Int
    public var maxChunk: Int
    private let sink: (String) -> Void
    private var announced = 0  // total the running announcement was made for
    private var announcedBase = -1
    private var nextMark = 0.25
    private var lastLine: UInt64 = 0
    public var tailAware = false

    public init(quietBelowTokens: Int, maxChunk: Int, sink: @escaping (String) -> Void) {
        self.quietBelowTokens = quietBelowTokens
        self.maxChunk = maxChunk
        self.sink = sink
    }

    /// Generator.onPrefillProgress: called after every pass with the tokens
    /// read so far this request, the tokens it will read, and elapsed seconds.
    public func report(done: Int, total: Int, elapsed: Double) {
        report(done: done, total: total, elapsed: elapsed, base: 0)
    }

    public func report(done: Int, total: Int, elapsed: Double, base: Int) {
        guard total >= quietBelowTokens, total > 0 else { return }
        if announced != total || announcedBase != base {
            announced = total
            announcedBase = base
            nextMark = 0.25
            let eta = PrefillSchedule.estSeconds(tokens: total, from: base, maxChunk: maxChunk, tailAware: tailAware)
            sink("prefill: reading \(total) prompt tokens, ~\(PrefillSchedule.describe(seconds: eta)) "
                + "to the first token at this plan (follow-up turns read only what is new)")
        }
        if done <= 0 { return }
        let frac = Double(done) / Double(total)
        if done >= total {
            let rate = elapsed > 0 ? Double(total) / elapsed : 0
            sink(String(format: "prefill: done, %d tokens in %@ (%.0f tok/s)",
                        total, PrefillSchedule.describe(seconds: elapsed), rate))
            announced = 0
            return
        }
        // One line per quarter, never more often than every 5 s.
        guard frac >= nextMark, lastLine == 0 || RuntimeClock.seconds(since: lastLine) >= 5 else { return }
        while nextMark <= frac { nextMark += 0.25 }
        lastLine = RuntimeClock.now()
        let rate = elapsed > 0 ? Double(done) / elapsed : 0
        let left = rate > 0 ? Double(total - done) / rate : 0
        sink(String(format: "prefill: %d/%d tokens (%.0f%%), ~%@ left",
                    done, total, frac * 100, PrefillSchedule.describe(seconds: left)))
    }
}

````````````

## Artifact SHA-256 bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544

Encoding: `utf-8`. Original bytes: 17399.

````````````text
import Foundation

// Saturation is a refusal sentinel, never permission to wrap a byte budget.
package enum ContextBytes {
    package static func product(_ values: Int...) -> Int {
        var result = 1
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.multipliedReportingOverflow(by: value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
    package static func sum(_ values: Int...) -> Int {
        var result = 0
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.addingReportingOverflow(value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
}

/// Pure geometry shared by the planner and the actual stepped sequence caches.
/// A capacity is bytes of backing storage, not the number of live token IDs.
public enum ContextGeometry {
    public static let allocationStep = 1024
    public static let attentionLayers = 12
    public static let rowBytes = 2304

    /// Physical bytes needed when one buffer grows. The old allocation can
    /// still have GPU or checkpoint readers, so growth charges the complete
    /// replacement. Capacity in another buffer never grants a credit here.
    public static func nextBufferAllocationBytes(tokens: Int, rowBytes: Int,
                                                 allocatedBytes: Int, step: Int = allocationStep) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit, rowBytes > 0,
              allocatedBytes >= 0, step > 0, step <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + step - 1) / step) * step
        let required = ContextBytes.product(capacity, rowBytes)
        return required > allocatedBytes ? required : 0
    }

    public static func capacityBytes(tokens: Int, layers: Int = attentionLayers,
                                     rowBytes: Int = rowBytes, pooledRowBytes: Int = 256,
                                     compressionRatio: Int = 4, indexerBudget: Int = 2048,
                                     incrementalIndexer: Bool = false) -> Int {
        guard tokens >= 0, layers >= 0, rowBytes > 0, pooledRowBytes >= 0,
              compressionRatio > 0, indexerBudget >= 0, tokens <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + allocationStep - 1) / allocationStep) * allocationStep
        let pooled = incrementalIndexer && tokens > indexerBudget
            ? ((tokens / compressionRatio + 255) / 256) * 256 : 0
        let (rows, a) = capacity.multipliedReportingOverflow(by: rowBytes)
        let (blocks, b) = pooled.multipliedReportingOverflow(by: pooledRowBytes)
        let (one, c) = rows.addingReportingOverflow(blocks)
        let (total, d) = one.multipliedReportingOverflow(by: layers)
        return a || b || c || d ? Int.max : total
    }

    public static func sequenceBytes(tokens: Int, mtp: Bool = false) -> Int {
        capacityBytes(tokens: tokens, layers: attentionLayers + (mtp ? 1 : 0))
    }

    public static func additionalActiveBytes(tokens: Int, mtp: Bool = false) -> Int {
        max(0, sequenceBytes(tokens: tokens, mtp: mtp)
            - sequenceBytes(tokens: ContextPolicy.tokensInFixedFootprint, mtp: mtp))
    }
}

/// Exact integer accounting of an otherwise empirical process envelope. The
/// fixed and workspace allowances are measured budgets, not allocator telemetry.
public struct ContextMemoryLedger: Sendable {
    public let fixedBytes: Int
    public let poolBytes: Int
    public let activeCapacityBytes: Int
    public let additionalActiveBytes: Int
    public let retainedCapacityBytes: Int
    public let retainedRecurrentBytes: Int
    public let prefillBytes: Int
    public let longContextReserveBytes: Int
    public let mtpResidentBytes: Int
    public let visionResidentBytes: Int
    public let planningMarginBytes: Int

    public init(slots: Int, context: Int, chunk: Int, retentionTokens: Int,
                mtp: Bool, visionResident: Bool) {
        fixedBytes = PlannerCostModel.fixedBytes
        poolBytes = ContextBytes.product(slots, Int(Geometry.recordBytes))
        activeCapacityBytes = ContextGeometry.sequenceBytes(tokens: context, mtp: mtp)
        additionalActiveBytes = ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp)
        retainedCapacityBytes = ContextBytes.product(retentionTokens, PrefixCache.bytesPerToken)
        retainedRecurrentBytes = retentionTokens > 0
            ? (PrefixCache.maxEntries - 1) * PrefixCache.fixedBytesPerEntry : 0
        prefillBytes = ContextBytes.product(chunk, PlannerCostModel.prefillBytesPerToken)
        longContextReserveBytes = Self.transientReserveBytes(context: context, mtp: mtp)
        mtpResidentBytes = mtp ? PlannerCostModel.mtpResidentBytes : 0
        visionResidentBytes = visionResident ? PlannerCostModel.visionResidentBytes : 0
        planningMarginBytes = PlannerCostModel.planningMarginBytes
    }

    /// The Hermes envelope is anchored permanently at 65K. Above it, reserve
    /// an additional complete growth allocation for candidate qualification;
    /// this conservative copy budget is not a measured interpolation.
    public static func transientReserveBytes(context: Int, mtp: Bool = false) -> Int {
        guard context > ContextPolicy.tokensInFixedFootprint else { return 0 }
        let hermes = 32_768 * PrefixCache.bytesPerToken
        return max(hermes, ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp))
    }

    public var expectedPeakBytes: Int {
        ContextBytes.sum(fixedBytes, poolBytes, additionalActiveBytes, retainedCapacityBytes,
            retainedRecurrentBytes, prefillBytes, longContextReserveBytes,
            mtpResidentBytes, visionResidentBytes)
    }
    public var json: [String: Any] {
        ["version": 1, "fixed_bytes": fixedBytes, "pool_bytes": poolBytes,
         "active_capacity_bytes": activeCapacityBytes, "additional_active_bytes": additionalActiveBytes,
         "retained_capacity_bytes": retainedCapacityBytes, "retained_recurrent_bytes": retainedRecurrentBytes,
         "prefill_bytes": prefillBytes, "long_context_reserve_bytes": longContextReserveBytes,
         "mtp_resident_bytes": mtpResidentBytes, "vision_resident_bytes": visionResidentBytes,
         "planning_margin_bytes": planningMarginBytes, "expected_peak_bytes": expectedPeakBytes]
    }
}

/// Bounds for the next dispatch. These are conservative geometry allowances,
/// not throughput anchors or new measured process-peak claims.
public enum ContextWorkspace {
    /// A short pass stays inside one canonical projection/attention domain.
    /// Include masked key columns when choosing its actual query count.
    public static func boundedSmallPass(requested: Int, at position: Int,
                                         referenceStart: Int, referenceEnd: Int) -> Int {
        guard requested > 0, requested < 256, referenceStart >= 0,
              position >= referenceStart, referenceEnd > position,
              referenceEnd <= ContextPolicy.modelLimit else { return 0 }
        let blockRemaining = 256 - ((position - referenceStart) % 256)
        // Only the qualified 64/128-row family is selected for full late
        // passes. Odd user batch overrides cannot introduce a new kernel
        // shape such as 68 or 137; logical terminal rows are still exact.
        let preferred = requested >= 128 ? 128 : requested >= 64 ? 64 : requested
        var count = min(preferred, blockRemaining, referenceEnd - position)
        while count > 0 {
            let extent = keyExtent(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            let queries = queryRows(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            if queries <= PrefillSchedule.measuredQueryKeyProduct / extent { return count }
            count /= 2
        }
        return 0
    }

    public static func keyExtent(pass: Int, context: Int, referenceStart: Int = 0,
                                 referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass < 256 else { return context }
        let rows = context - referenceStart
        return min(referenceEnd, referenceStart + ((rows + 255) / 256) * 256)
    }

    /// A tiny tail inside a matrix-prefill reference domain must not switch
    /// to the vector attention kernel. Dummy query rows are cropped before
    /// any state update, but they still count toward the physical Q x K bound.
    public static func queryRows(pass: Int, context: Int, referenceStart: Int = 0,
                                  referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass <= 8 else { return pass }
        let block = referenceStart + ((context - pass - referenceStart) / 256) * 256
        return min(256, referenceEnd - block) > 8 ? 64 : pass
    }

    public static func prefillBytes(pass: Int, context: Int, scope: Int = 0, attentionHeads: Int = 24,
                                    referenceStart: Int = 0, referenceEnd: Int = ContextPolicy.modelLimit,
                                    minimumProjectionRows: Int = 0, padSmallQueries: Bool = false) -> Int {
        guard pass > 0, pass <= 4096, attentionHeads > 0, scope >= 0, context >= pass, context <= ContextPolicy.modelLimit,
              (0 ... 256).contains(minimumProjectionRows),
              pass <= PrefillSchedule.measuredQueryKeyProduct / context else { return Int.max }
        let extent = keyExtent(pass: pass, context: context, referenceStart: referenceStart, referenceEnd: referenceEnd)
        let queries = padSmallQueries ? queryRows(pass: pass, context: context,
            referenceStart: referenceStart, referenceEnd: referenceEnd) : pass
        guard queries <= PrefillSchedule.measuredQueryKeyProduct / extent else { return Int.max }
        // Indexer score/mask/top-k and selected attention coexist with layer
        // activations. Preserve the original linear allowance; bound the
        // query-by-context part even when late passes fall below 256.
        return ContextBytes.sum(max(ContextBytes.product(max(pass, minimumProjectionRows), PlannerCostModel.prefillBytesPerToken),
            ContextBytes.product(queries, extent, ContextBytes.sum(ContextBytes.product(attentionHeads, 8), 16))), ContextBytes.product(max(0, scope - pass), 32_768))
    }

    /// The optional workspace must fit both actual reclaimable memory and
    /// the caller's process envelope. Never subtract a buffer merely because
    /// it could later be evicted; the observation must already exclude it.
    package static func fitsAutomaticScope(footprintBytes: Int, allocationBytes: Int,
                                          limitBytes: Int?) -> Bool {
        guard footprintBytes > 0, footprintBytes < Int.max,
              allocationBytes >= 0, allocationBytes < Int.max else { return false }
        guard let limitBytes else { return true }
        let total = ContextBytes.sum(footprintBytes, allocationBytes)
        return limitBytes > 0 && total < Int.max && total <= limitBytes
    }

    /// Additional buffers owned by the expert workspace, beyond ordinary
    /// compute-pass and retained-frontier allowances. Count replacement
    /// storage even if MLX can donate the old allocation on this dispatch.
    /// This is a conservative allocation reservation, not a process peak.
    package static func expertWorkspaceBytes(tokens: Int, tile: Int, experts: Int,
        topK: Int, hidden: Int, intermediate: Int, recordBytes: Int, loadBatch: Int,
        admissionPoolBytes: Int = 0, admissionRecords: Int = 0) -> Int {
        guard tokens > 0, tokens <= ContextPolicy.modelLimit,
              [256, 512, 1024, 2048, 4096].contains(tile),
              experts > 0, topK > 0, topK <= experts, hidden > 0, intermediate > 0,
              recordBytes > 0, loadBatch > 0, loadBatch <= experts,
              admissionPoolBytes >= 0, admissionRecords >= 0, admissionRecords <= experts,
              admissionRecords == 0 || admissionPoolBytes > 0 else { return Int.max }
        let weights = ContextBytes.product(experts, recordBytes)
        // Nine aligned managed buffers; reserve a second staging copy so
        // admission never depends on a particular no-copy upload decision.
        let staging = ContextBytes.sum(ContextBytes.product(loadBatch, recordBytes, 2), 9 * 16_384)
        let assembly = ContextBytes.sum(weights, staging)
        // Sweep admission can replace the decode pool while full workspace
        // weights and gathered hot records remain live.
        let admission = ContextBytes.sum(admissionPoolBytes,
            ContextBytes.product(admissionRecords, recordBytes))
        // workspaceRouted merges a residual tail only below 256 rows. Its
        // grouped matmul pads to at least four rows per expert (and 16).
        let liveTokens = min(tokens, tile + 255)
        let rows = max(ContextBytes.product(liveTokens, topK), ContextBytes.product(experts, 4), 16)
        // Original/padded gather, down, canonical and weighted outputs: five H-wide arrays.
        // Gate, up, SiLU and product: four FF-wide arrays. Charge FP32 for
        // every intermediate, plus CPU/GPU index copies. Reduced tiles and
        // their final concatenation coexist until the layer returns.
        let routed = ContextBytes.sum(ContextBytes.product(rows,
            ContextBytes.sum(ContextBytes.product(hidden, 5), ContextBytes.product(intermediate, 4)), 4),
            ContextBytes.product(rows, 64))
        let retained = ContextBytes.sum(ContextBytes.product(tokens, hidden, 8),
            ContextBytes.product(tokens, topK, 16), ContextBytes.product(tokens, experts, 8),
            ContextBytes.product(experts, 32))
        return ContextBytes.sum(weights, max(assembly, admission, routed), retained)
    }

    public static func visionBytes(patches: Int, hidden: Int = 1152, heads: Int = 16,
                                   queryTile: Int = 0, padding: Int = 0) -> Int {
        guard patches > 0, patches <= 9216, hidden > 0, heads > 0,
              [0, 256].contains(queryTile), [0, 80, 128].contains(padding),
              queryTile == 0 || padding == 0 else { return Int.max }
        // The pinned width-72 fallback materializes BF16 QK and softmax.
        // Each tile is evaluated before the next, so the candidate really
        // bounds Q by 256. Padding uses a different kernel; retain the full
        // original-score allowance until its resource gate is qualified.
        let queries = queryTile == 256 ? min(patches, 256) : patches
        return ContextBytes.sum(ContextBytes.product(queries, patches, heads, 4),
            ContextBytes.product(patches, hidden, 32))
    }
}

/// Count existing request values without formatting or serializing them first.
/// Depth and overflow fail closed before Jinja/JSON can copy the structure.
package enum ContextInputMemory {
    package static func bytes(_ value: Any, depth: Int = 0) -> Int {
        guard depth < 64 else { return Int.max }
        if let text = value as? String { return ContextBytes.sum(text.utf8.count, 16) }
        if let value = value as? JSONValue {
            switch value {
            case .string(let text): return ContextBytes.sum(text.utf8.count, 16)
            case .array(let values): return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
            case .object(let values): return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
            default: return 32
            }
        }
        if let values = value as? [String: Any] {
            return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
        }
        if let values = value as? [Any] {
            return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
        }
        return 32
    }
    package static func bytes(messages: [ChatMessage], tools: [ToolDefinition]) -> Int {
        let messagesBytes = messages.reduce(0) { sum, m in
            let calls = m.toolCalls.reduce(0) { ContextBytes.sum($0, $1.name.utf8.count, bytes(JSONValue.object($1.arguments))) }
            return ContextBytes.sum(sum, m.role.utf8.count, m.content.utf8.count, m.reasoning?.utf8.count ?? 0,
                m.toolCallId?.utf8.count ?? 0, m.toolName?.utf8.count ?? 0, calls, bytes(m.images), 256)
        }
        return tools.reduce(messagesBytes) { ContextBytes.sum($0, $1.name.utf8.count, $1.description.utf8.count, bytes($1.parameters), 256) }
    }
}

````````````

## Artifact SHA-256 b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d

Encoding: `utf-8`. Original bytes: 58593.

````````````text
// High-level engine: model + tokenizer + chat templating, shared by CLI/server.

import CoreGraphics
import Foundation
import MLX
import Tokenizers

public struct ChatMessage {
    public var role: String
    public var content: String
    /// An assistant turn's reasoning, rendered as `reasoning_content`. Clients
    /// that keep reasoning in history can replay it; fx does not send any.
    public var reasoning: String?
    /// Calls this assistant turn made.
    public var toolCalls: [ParsedToolCall]
    /// For a `tool` message: which call it answers.
    public var toolCallId: String?
    public var toolName: String?
    /// Pictures this turn carries, as inline bytes (a `data:` URL or bare
    /// base64) in the order the template should render them. Text-only paths
    /// leave it empty and behave exactly as before.
    public var images: [String] = []

    public init(role: String, content: String) {
        self.role = role
        self.content = content
        self.reasoning = nil
        self.toolCalls = []
        self.toolCallId = nil
        self.toolName = nil
    }

    public init(
        role: String, content: String, reasoning: String? = nil,
        toolCalls: [ParsedToolCall] = [], toolCallId: String? = nil, toolName: String? = nil
    ) {
        self.role = role
        self.content = content
        self.reasoning = reasoning
        self.toolCalls = toolCalls
        self.toolCallId = toolCallId
        self.toolName = toolName
    }

    /// The dictionary the chat template consumes.
    ///
    /// Tool-call arguments are bridged as an unordered dictionary because
    /// swift-jinja accepts nothing else, so the template's `arguments|items`
    /// follows Swift's hash order. That is why a generated assistant turn is
    /// spliced back as raw ids rather than re-rendered (`PrefixCache`): a
    /// re-render is semantically identical but not byte-identical, and the
    /// prefix cache matches on bytes.
    public var templateValue: [String: any Sendable] {
        var m: [String: any Sendable] = ["role": role, "content": content]
        // The template checks each content part for an `image`/`image_url`
        // key, so a turn with pictures has to arrive as parts rather than a
        // string. Images first, then the text: that is the order the template
        // numbers them in ("Picture 1: ..."), and the order
        // `Engine.imageSources` reads them back in.
        if !images.isEmpty {
            var parts: [[String: any Sendable]] = images.map {
                ["type": "image_url", "image_url": ["url": $0] as [String: any Sendable]]
            }
            if !content.isEmpty { parts.append(["type": "text", "text": content]) }
            m["content"] = parts
        }
        if let r = reasoning, !r.isEmpty { m["reasoning_content"] = r }
        if !toolCalls.isEmpty {
            m["tool_calls"] = toolCalls.map { call in
                [
                    "type": "function",
                    "function": [
                        "name": call.name,
                        "arguments": call.arguments.mapValues { $0.any },
                    ] as [String: any Sendable],
                ] as [String: any Sendable]
            }
        }
        return m
    }
}

public final class Engine {
    public let modelDir: URL
    public let model: Qwen4ExpModel
    public let generator: Generator
    public let tokenizer: any Tokenizers.Tokenizer
    public let eosIds: Set<Int>
    public let modelName: String
    /// Lazily-loaded vision tower (VLM). Loaded on the first request that
    /// carries an image and then cached; see `ensureVisionTower`.
    public private(set) var visionTower: VisionTower?
    /// Whether this process will accept images at all (`--vision`). False
    /// makes every image request a 400 that says so, rather than a surprise
    /// gigabyte.
    public var visionAllowed = true
    /// Whether the checkpoint carries a tower at all, read once at startup so
    /// the fx catalogue and `/api/show` can answer without touching it.
    public private(set) var visionAvailable = false
    /// Longest prompt accepted, at most `ContextPolicy.maxTokens` (the largest
    /// context that has been measured, see Context.swift). Unbounded prompts
    /// are not free: KV plus indexer state costs ~27 KiB per token, and a
    /// prompt is read in full before the first token, so a huge prompt is a
    /// long, memory-growing stall rather than a fast failure.
    private let contextLock = NSRecursiveLock()
    private var configuredContextTokens = ContextPolicy.defaultTokens
    private let allocatedContextTokens: Int
    private var contextAssignmentFailure: RequestFailure?
    public var maxContextTokens: Int {
        get { contextLock.withLock { configuredContextTokens } }
        set {
            contextLock.lock(); defer { contextLock.unlock() }
            if let why = ContextPolicy.validationError(newValue, qualification: currentPlan?.contextQualification ?? false) {
                contextAssignmentFailure = RequestFailure(.invalidConfiguration, why); return
            }
            guard newValue <= allocatedContextTokens else {
                contextAssignmentFailure = RequestFailure(.invalidConfiguration,
                    "context assignment exceeds this engine's allocated plan; construct a new Engine with a validated plan")
                return
            }
            contextAssignmentFailure = nil
            configuredContextTokens = newValue
            let capped = min(prefixCache.maxTokens, newValue)
            prefixCache.configure(maxTokens: capped)
            if let p = currentPlan {
                updatePlan(MemoryPlan(source: p.source, slots: p.slots, targetGB: p.targetGB,
                    ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
                    availableGB: p.availableGB, clamped: p.clamped, prefillChunk: p.prefillChunk,
                    prefixCacheTokens: capped, mtpEnabled: p.mtpEnabled, visionEnabled: p.visionEnabled,
                    visionResidentReserved: p.visionResidentReserved, maxContextTokens: newValue,
                    notes: p.notes, runtimeAllocationPolicy: p.runtimeAllocationPolicy,
                    maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification))
            }
        }
    }

    /// Call when a complete request is accepted, before tokenization or images.
    public func beginRequest(connected: @escaping () -> Bool = { true }) throws -> RequestController {
        if let override = requestControllerOverride {
            let control = try override(); try control.attachReservations(requestReservations); return control
        }
        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
        if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
        let configuration = try ContextConfiguration(maxContextTokens: maxContextTokens,
            maxPrefillWaitMinutes: currentPlan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            qualification: currentPlan?.contextQualification ?? false)
        let control = RequestController(configuration: configuration,
            slackBytes: Int(Planner.availabilitySlackGB(ramGB: currentPlan?.ramGB ?? Planner.deviceRAMGB()) * 1e9),
            connected: connected, pressure: { [weak self] in
                guard let self else { return true }
                return self.pressureBoundary.snapshot() != nil || self.osPressureLock.withLock { self.osPressure }
            })
        try control.attachReservations(requestReservations)
        return control
    }
    private let requestReservations = RequestMemoryReservations()

    // Package-only dependency seam for deterministic HTTP diagnostics. No wire
    // field or environment variable can install it.
    package var requestControllerOverride: (() throws -> RequestController)?

    public var contextPolicyJSON: [String: Any] {
        let plan = currentPlan
        return ["configured_window": maxContextTokens, "model_limit": ContextPolicy.modelLimit,
            "implementation_limit": ContextPolicy.implementationLimit,
            "mtp_limit": ContextPolicy.mtpLimit, "vision_limit": ContextPolicy.visionLimit,
            "max_prefill_wait_minutes": plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            "wait_scope": "accepted_request_to_first_model_token",
            "qualification": plan?.contextQualification ?? false,
            "allocation_available": planLock.withLock { allocationUnavailable == nil },
            "estimate_scope": "measured M5 Pro anchors; unknown for unqualified pass sizes"]
    }

    deinit { pressureMonitor?.cancel() }

    private var allocationUnavailable: RequestFailure?
    package func setAllocationUnavailable(_ failure: RequestFailure?) {
        planLock.withLock { allocationUnavailable = failure }
    }

    private let osPressureLock = NSLock()
    private var osPressure = false
    private var pressureMonitor: DispatchSourceMemoryPressure?

    /// Retained conversation state, so a follow-up turn re-prefills only what
    /// is new. See PrefixCache for the extend-only rule and the memory story.
    public let prefixCache: PrefixCache

    /// Release the retained conversation state. Takes the generation lock, so
    /// never call it from inside `generate`.
    public func dropPrefixCache() {
        withExclusive { prefixCache.drop() }
    }

    /// nil when `promptTokens` fits, otherwise the message to return to the client.
    ///
    /// The message names the cap for what it is. It used to tell people to
    /// raise --max-context, which cannot go past the ceiling the server was
    /// already at.
    public func contextError(promptTokens: Int) -> String? {
        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { return contextAssignmentFailure.message }
        guard promptTokens < 0 || promptTokens > maxContextTokens else { return nil }
        return "context_length_exceeded: prompt is \(promptTokens) tokens, over the configured \(maxContextTokens)-token prompt-plus-reply window. Send less or restart with a larger supported --max-context; the model limit is \(ContextPolicy.modelLimit)."
    }
    /// The live memory plan (updated by the elastic governor on resize; nil
    /// for internal fixed-size uses). Guarded by its own lock so /api reads
    /// never block behind a running generation.
    private var _plan: MemoryPlan?
    private let planLock = NSLock()
    public var currentPlan: MemoryPlan? {
        planLock.lock()
        defer { planLock.unlock() }
        return _plan
    }
    public func updatePlan(_ p: MemoryPlan) {
        planLock.lock()
        _plan = p
        planLock.unlock()
    }

    private let lock = GenerationGate()
    package let pressureBoundary = PressureBoundary()
    // Immutable after startup, so the governor never reads mutable model
    // controls concurrently with a request changing its diagnostic options.
    package let responsiveGovernor: Bool

    /// Run `body` with the generation lock held — the governor uses this to
    /// resize the pool strictly between requests.
    public func withExclusive<T>(_ body: () throws -> T) rethrows -> T {
        lock.lock()
        defer { lock.unlock() }
        return try body()
    }

    @discardableResult
    package func tryWithExclusive(_ body: () -> Void) -> Bool {
        lock.tryWithExclusive(body)
    }

    /// Pool numbers for the metadata endpoints, published rather than read
    /// live. Reading SlotPool's mutable Swift arrays while the governor
    /// resizes is a data race, but taking the *generation* lock to avoid it
    /// made /api/tags and /api/ps block for the whole of a running request, so
    /// a client that polls either one saw a generating server as a hung one.
    private var _poolSnapshot: (slots: Int, slotsPerLayer: Double, poolBytes: Int) = (0, 0, 0)
    private let poolSnapshotLock = NSLock()

    public func poolSnapshot() -> (slots: Int, slotsPerLayer: Double, poolBytes: Int) {
        poolSnapshotLock.lock()
        defer { poolSnapshotLock.unlock() }
        return _poolSnapshot
    }

    /// Re-read the pool and publish it. **Call with the generation lock held**
    /// (inside `withExclusive`), which is where every resize already happens.
    public func publishPoolSnapshot() {
        let s = (model.pool.slots, model.pool.slotsPerLayer, model.pool.poolBytes)
        poolSnapshotLock.lock()
        _poolSnapshot = s
        poolSnapshotLock.unlock()
    }

    public convenience init(modelDir: URL, plan: MemoryPlan) async throws {
        try await self.init(modelDir: modelDir, poolSlots: plan.slots, plan: plan)
    }

    public init(modelDir: URL, poolSlots: Int, plan: MemoryPlan? = nil) async throws {
        // A plan made for a simulated machine may be printed and compared,
        // never loaded. Simulating memory the machine does not have still
        // allocates for real: on 2026-08-30 a simulated 60 GB drove a 25.4 GB
        // allocation and 39 GB of swap. The flag travels on the plan so this
        // cannot be forgotten at a call site.
        if plan?.simulated == true { throw SlotstreamError.simulatedDeviceCannotLoad }
        let context = try ContextConfiguration(maxContextTokens: plan?.maxContextTokens ?? ContextPolicy.defaultTokens,
            maxPrefillWaitMinutes: plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            qualification: plan?.contextQualification ?? false)
        guard poolSlots >= Geometry.floorSlots, poolSlots <= Geometry.totalRecords,
              plan == nil || plan?.slots == poolSlots else {
            throw SlotstreamError.invalidPlan("engine pool must match a supported memory plan")
        }
        let initialLedger = plan?.memoryLedger ?? ContextMemoryLedger(slots: poolSlots,
            context: context.maxContextTokens, chunk: 256,
            retentionTokens: Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            mtp: false, visionResident: false)
        let initial = RequestController(configuration: context,
            slackBytes: Int(Planner.availabilitySlackGB(ramGB: plan?.ramGB ?? Planner.deviceRAMGB()) * 1e9))
        try initial.check(nextAllocationBytes: initialLedger.expectedPeakBytes, phase: "model allocation")
        self.allocatedContextTokens = context.maxContextTokens
        self.configuredContextTokens = context.maxContextTokens
        self.modelDir = modelDir
        self._plan = plan
        // Sized from the same budget as the pool; SLOTSTREAM_PREFIX_CACHE=0
        // (or --no-prefix-cache) pins it off for parity work.
        let env = ProcessInfo.processInfo.environment["SLOTSTREAM_PREFIX_CACHE"]
        self.prefixCache = PrefixCache(
            maxTokens: plan?.prefixCacheTokens
                ?? Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            enabled: env != "0" && (plan?.runtimeAllocationPolicy?.prefixCacheEnabled ?? true))
        if let p = plan, p.runtimeAllocationPolicy != nil { prefixCache.setBudgetLimit(p.prefixCacheTokens) }
        // MLX's allocator otherwise retains freed transients (KV caches,
        // activations) in an unbounded internal cache — measured ~5 GB of RSS
        // above the memory plan after a few dozen requests. 2 GB keeps
        // per-token reallocation churn away while making real process memory
        // track the announced plan.
        MLX.Memory.cacheLimit = 2 << 30
        self.modelName = "qwen3.8-flash-next:4bit"
        let t0 = Date()
        let index = try CheckpointIndex(dir: modelDir)
        self.model = try Qwen4ExpModel(index: index, poolSlots: poolSlots)
        self.responsiveGovernor = model.optimizations.responsiveGovernor
        try model.validate()
        // Read from the index that is already open — no tensor is touched, and
        // nothing is allocated until an image actually arrives.
        self.visionAvailable = VisionTower.present(index: index)
        self.visionAllowed = plan?.visionEnabled ?? visionAvailable
        if plan?.mtpEnabled == true {
            try model.enableMTP(modelDir: modelDir)
        }
        self.generator = Generator(model: model)
        if let p = plan, p.runtimeAllocationPolicy != nil {
            generator.setPrefillBudgetCeiling(p.prefillChunk)
            generator.prefillChunk = p.prefillChunk
        }
        if let p = plan, ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CHUNK"] == nil {
            generator.prefillChunk = p.prefillChunk
        }
        if let mb = Int(ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CACHE_MB"] ?? "") {
            generator.prefillCacheLimit = max(0, mb) << 20
        } else if let p = plan, p.expectedPeakGB <= 12 {
            generator.prefillCacheLimit = 512 << 20
        }
        self.tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        var eos: Set<Int> = [index.config.eosTokenId]
        if let e = tokenizer.eosTokenId { eos.insert(e) }
        // generation_config may list several
        if let d = try? Data(contentsOf: modelDir.appendingPathComponent("generation_config.json")),
            let o = try? JSONSerialization.jsonObject(with: d) as? [String: Any]
        {
            if let list = o["eos_token_id"] as? [Int] { list.forEach { eos.insert($0) } }
            if let one = o["eos_token_id"] as? Int { eos.insert(one) }
        }
        self.eosIds = eos
        publishPoolSnapshot()
        let monitor = DispatchSource.makeMemoryPressureSource(eventMask: [.normal, .warning, .critical],
            queue: DispatchQueue(label: "slotstream.request-pressure"))
        monitor.setEventHandler { [weak self, weak monitor] in
            guard let self, let monitor else { return }
            self.osPressureLock.withLock { self.osPressure = !monitor.data.contains(.normal) }
        }
        monitor.resume(); pressureMonitor = monitor
        let banner = "engine ready in \(String(format: "%.1f", -t0.timeIntervalSinceNow))s: "
            + "expert cache ~\(String(format: "%.0f", model.pool.slotsPerLayer))/\(model.cfg.numExperts) per layer "
            + "(\(model.pool.slots) global slots = \(String(format: "%.1f", Double(model.pool.poolBytes) / 1e9)) GB), "
            + (model.mtpHead != nil ? "mtp draft head on, " : "")
            + "eos \(eos.sorted())\n"
        FileHandle.standardError.write(banner.data(using: .utf8)!)
    }

    public func encodeChat(_ messages: [ChatMessage], thinking: Bool) throws -> [Int] {
        try encodeChat(messages, tools: [], thinking: thinking, effort: nil)
    }

    /// Render a conversation that may declare tools and replay tool calls.
    ///
    /// `tools` empty renders no `<tools>` block at all, which is what the
    /// Ollama and OpenAI dialects pass, so their bytes are unchanged.
    public func encodeChat(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: Self.additionalContext(thinking: thinking, effort: effort))
    }

    /// Encode a conversation, substituting the exact ids this server generated
    /// for any assistant turn it can still prove it produced.
    ///
    /// Why this exists. The prefix cache matches on bytes, and it must: the GDN
    /// recurrent state is a fold over the tokens it consumed, with no inverse,
    /// so a state may only be extended by the very ids that built it. A client
    /// replaying history does not send those ids — it sends its own view of the
    /// turn, which the template then re-renders. Whenever that re-render
    /// differs by a single byte, the next turn rebuilds the whole prompt.
    ///
    /// With reasoning ON that is not an edge case, it is every turn: fx (and
    /// most clients) never echo reasoning back, so the re-render is missing the
    /// `<think>` block the model actually produced, and the state cannot match.
    /// Measured on this machine, a two-turn tool loop reused 303 of 325 tokens
    /// with reasoning off and 0 of 349 with it on — three and a half times the
    /// wall time for the identical second turn.
    ///
    /// The splice closes that. For each assistant turn, ask the cache whether it
    /// still holds a state whose ids begin with exactly the prompt that turn was
    /// generated from; if it does, the remainder of those ids *is* that turn,
    /// verbatim. Check that the remainder really describes the turn the client
    /// sent (same calls, same arguments, same text) and then use the held ids in
    /// place of the re-render, tokenizing only the conversation after it.
    ///
    /// Splitting the text at `<|im_end|>` is safe because it is an added token
    /// and therefore a hard tokenizer boundary: the suffix tokenizes identically
    /// whether or not the text before it is present. That is measured, not
    /// assumed — see the `chat-splice` check.
    ///
    /// Any mismatch anywhere falls back to the plain render, which is the
    /// behaviour that existed before. The splice can make a turn cheaper; it can
    /// never make one wrong.
    public func encodeChatSpliced(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        let full = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        guard prefixCache.enabled, messages.contains(where: { $0.role == "assistant" })
        else { return full }
        let fullText = tokenizer.decode(tokens: full, skipSpecialTokens: false)

        var spliced: [Int] = []  // ids exactly as the model saw or produced them
        var consumed = 0  // characters of fullText those ids already cover
        var didSplice = false

        func index(_ offset: Int) -> String.Index {
            fullText.index(fullText.startIndex, offsetBy: offset)
        }

        for k in messages.indices where messages[k].role == "assistant" {
            guard
                let headIds = try? encodeChat(
                    Array(messages[0..<k]), tools: tools, thinking: thinking, effort: effort)
            else { break }
            let headText = tokenizer.decode(tokens: headIds, skipSpecialTokens: false)
            guard fullText.hasPrefix(headText), headText.count >= consumed else { break }
            // The ids that produced turn k: what is already spliced, plus the
            // conversation between there and this turn's generation prompt.
            let bridge = String(fullText[index(consumed)..<index(headText.count)])
            let producer =
                spliced + (bridge.isEmpty ? [] : tokenizer.encode(text: bridge, addSpecialTokens: false))
            guard let entry = prefixCache.peek(extending: producer) else { break }
            let generated = Array(entry[producer.count...])
            let genText = tokenizer.decode(tokens: generated, skipSpecialTokens: false)
            guard Self.spliceDescribes(genText, messages[k], tools: tools) else { break }
            guard
                let end = fullText.range(
                    of: "<|im_end|>", range: index(headText.count)..<fullText.endIndex)
            else { break }
            spliced = entry
            consumed = fullText.distance(from: fullText.startIndex, to: end.lowerBound)
            didSplice = true
        }

        guard didSplice else { return full }
        let tail = String(fullText[index(consumed)...])
        return spliced + tokenizer.encode(text: tail, addSpecialTokens: false)
    }

    /// Does this generated text describe the assistant turn the client sent?
    ///
    /// Deliberately compares meaning rather than bytes: the client's copy has
    /// been through its own JSON round trip, so whitespace and argument order
    /// may differ, but the calls it reports must be the calls that were made.
    /// Reasoning is ignored — the client dropping it is the whole reason the
    /// splice is needed.
    public static func spliceDescribes(
        _ generated: String, _ message: ChatMessage, tools: [ToolDefinition]
    ) -> Bool {
        let (_, body) = ThinkSplitter.split(generated)
        let visible = body.isEmpty && !generated.contains("</think>") ? generated : body
        let events = ToolCallSplitter.parseAll(visible, tools: tools.map { $0.schema })
        var calls: [ParsedToolCall] = []
        var text = ""
        for e in events {
            switch e {
            case .toolCall(let c): calls.append(c)
            case .text(let t): text += t
            case .malformed: return false
            default: break
            }
        }
        guard calls.count == message.toolCalls.count else { return false }
        for (a, b) in zip(calls, message.toolCalls) {
            guard a.name == b.name, a.arguments == b.arguments else { return false }
        }
        // The text is compared after trimming only. A client that rewrites the
        // assistant's prose is describing a different turn, and re-rendering it
        // is then the correct answer.
        return text.trimmingCharacters(in: .whitespacesAndNewlines)
            == message.content.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    static func additionalContext(thinking: Bool, effort: String?) -> [String: any Sendable] {
        var ctx: [String: any Sendable] = ["enable_thinking": thinking]
        if let e = effort, thinking { ctx["reasoning_effort"] = e }
        return ctx
    }

    /// Render a template without constructing the multi-GB model. Installer
    /// and API acceptance checks run this while a server is already live; the
    /// old implementation built a second Engine merely to load the tokenizer,
    /// so the singleton guard correctly rejected the check it was meant to run.
    public static func encodeChatWithoutModel(
        modelDir: URL, messages: [ChatMessage], thinking: Bool,
        tools: [ToolDefinition] = [], effort: String? = nil
    ) async throws -> [Int] {
        let tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        return try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: additionalContext(thinking: thinking, effort: effort))
    }

    /// OpenAI path: messages already contain image_url parts, and content may
    /// be String or [[String: Any]] (vision). The nested arrays must be
    /// bridged to the tokenizer's `[String: any Sendable]` messages or the
    /// vision parts are silently dropped before the Jinja template can render
    /// them as <|image_pad|>.
    public func encodeChatOpenAI(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> [Int] {
        func toSendable(_ v: Any) -> any Sendable {
            if let arr = v as? [[String: Any]] {
                return arr.map { d -> [String: any Sendable] in
                    var out: [String: any Sendable] = [:]
                    for (k, vv) in d { out[k] = toSendable(vv) }
                    return out
                } as any Sendable
            }
            if let d = v as? [String: Any] {
                var out: [String: any Sendable] = [:]
                for (k, vv) in d { out[k] = toSendable(vv) }
                return out as any Sendable
            }
            if let a = v as? [Any] {
                return a.map { toSendable($0) } as any Sendable
            }
            return v as any Sendable
        }
        let msgs: [[String: any Sendable]] = messages.map { dict in
            var m: [String: any Sendable] = [:]
            for (k, v) in dict { m[k] = toSendable(v) }
            return m
        }
        let toolSpecs: [[String: any Sendable]]? = tools?.map { dict in
            var t: [String: any Sendable] = [:]
            for (k, v) in dict { t[k] = toSendable(v) }
            return t
        }
        return try tokenizer.applyChatTemplate(
            messages: msgs, tools: toolSpecs, additionalContext: ["enable_thinking": thinking])
    }

    // MARK: Vision

    /// Load the vision tower on first use, and only if the machine can spare
    /// it right now.
    ///
    /// **Under the generation lock, not a lock of its own.** Loading is
    /// ~0.9 GB of MLX arrays plus an `eval`; a private lock let that run on a
    /// connection thread while another request was mid-generation, which is
    /// exactly the concurrent GPU work every other allocation path in this
    /// file serializes. `withExclusive` is that serialization, and it also
    /// makes the availability reading below meaningful: nothing else can
    /// allocate between reading it and taking the memory.
    ///
    /// Replan before allocation so a target-driven process pays for the
    /// tower with expert capacity. Also require real machine headroom: an
    /// accounting allowance is not proof that physical memory is available.
    public func ensureVisionTower() throws -> VisionTower { try ensureVisionTower(request: nil) }

    public func ensureVisionTower(request: RequestController?, workspaceBytes: Int = 0) throws -> VisionTower {
        guard workspaceBytes >= 0 else {
            throw RequestFailure(.invalidConfiguration, "vision workspace bytes must be nonnegative")
        }
        guard visionAllowed else {
            throw SlotstreamError.vision(
                "this server was started with --vision off; images are not accepted")
        }
        if let request { try lock.lock(request: request) } else { lock.lock() }
        defer { lock.unlock() }
        return try { () throws -> VisionTower in
            try request?.check(nextAllocationBytes: visionTower == nil ? 1_900_000_000 : 0, phase: "vision tower allocation")
            if pressureBoundary.snapshot() != nil {
                let failure = RequestFailure(.insufficientMemory, "memory pressure interrupted image preparation; retry after the cache resizes")
                throw request?.fail(failure) ?? failure
            }
            let reservedPlan: MemoryPlan?
            do { reservedPlan = try currentPlan.map { try Planner.loadingVision($0) } }
            catch {
                let failure = RequestFailure(.insufficientMemory, "vision allocation cannot fit the current plan: \(error)")
                throw request?.fail(failure) ?? failure
            }
            if let charged = reservedPlan {
                let ledger = charged.memoryLedger
                let peak = ContextBytes.sum(ledger.expectedPeakBytes - ledger.prefillBytes,
                    max(ledger.prefillBytes, workspaceBytes))
                if let target = charged.targetGB, Double(peak) > target * 1e9 {
                    var failure = RequestFailure(.insufficientMemory,
                        "image attention workspace exceeds this process memory target; resize the image or raise --memory-gb")
                    failure.requiredBytes = peak
                    failure.availableBytes = target < Double(Int.max) / 1e9 ? Int(target * 1e9) : Int.max
                    throw request?.fail(failure) ?? failure
                }
            }
            try request?.check(nextAllocationBytes: workspaceBytes, phase: "vision workspace admission")
            if let vt = visionTower { return vt }
            let idx = try CheckpointIndex(dir: modelDir)
            guard VisionTower.present(index: idx) else {
                throw SlotstreamError.vision(
                    "this checkpoint has no vision tower — it is a text-only model")
            }
            let needGB = Double(VisionTower.residentBytes(index: idx)) / 1e9
            guard needGB <= Planner.visionResidentGB else {
                throw SlotstreamError.vision("vision weights exceed the supported resident allowance")
            }
            if let avail = Planner.deviceAvailableGB(), avail.isFinite,
                avail < needGB + Planner.visionLoadMarginGB
            {
                let failure = RequestFailure(.insufficientMemory, String(
                        format: "the vision tower needs %.1f GB and only %.1f GB is reclaimable "
                            + "right now — close other apps and retry, or restart with a lower "
                            + "--memory-gb so the tower fits",
                        needGB, avail))
                throw request?.fail(failure) ?? failure
            }
            if let p = reservedPlan {
                // The lock excludes generation and governor mutation. Shrink
                // releases the old arena before allocating the smaller one.
                model.pool.resize(to: p.slots)
                if p.runtimeAllocationPolicy != nil {
                    generator.setPrefillBudgetCeiling(p.prefillChunk)
                    prefixCache.setBudgetLimit(p.prefixCacheTokens)
                }
                generator.prefillChunk = min(generator.prefillChunk, p.prefillChunk)
                prefixCache.configure(maxTokens: min(prefixCache.maxTokens, p.prefixCacheTokens))
                MLX.Memory.clearCache()
                updatePlan(p)
                publishPoolSnapshot()
            }
            let vt = try VisionTower(index: idx)
            self.visionTower = vt
            return vt
        }()
    }

    /// Tokenize with vision expansion: each template image_pad is worth
    /// N_merged real tokens, so the template's single pad is expanded to a run
    /// of pads that the tower's embeddings will fill. Returns the expanded ids
    /// and a `VisionPrompt` when the request carries images, nil otherwise.
    ///
    /// The tower does not run here. The run lengths come from each image's
    /// dimensions, so the ids — and with them the prefix cache key — are ready
    /// before any pixels are read. `Generator.generate` asks the cache first
    /// and then encodes only the images that the reused state does not cover.
    public func encodeWithVision(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> ([Int], VisionPrompt?) {
        try encodeWithVision(messages: messages, tools: tools, thinking: thinking, request: nil)
    }

    public func encodeWithVision(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false,
        request: RequestController?
    ) throws -> ([Int], VisionPrompt?) {
        let request: RequestController? = try request ?? beginRequest()
        try request?.attachReservations(requestReservations)
        try request?.checkInputBytes(ContextBytes.sum(ContextInputMemory.bytes(messages), ContextInputMemory.bytes(tools ?? [])))
        let baseIds = try encodeChatOpenAI(messages: messages, tools: tools, thinking: thinking)
        return try withImages(baseIds: baseIds, sources: Self.imageSources(in: messages), request: request)
    }

    /// The typed path (`ChatMessage`), for the fx gateway and the CLI. Renders
    /// through the same template as `encodeChat` and then expands the same
    /// placeholders.
    public func encodeChatWithVision(
        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
        effort: String? = nil
    ) throws -> ([Int], VisionPrompt?) {
        try encodeChatWithVision(messages, tools: tools, thinking: thinking, effort: effort, request: nil)
    }

    public func encodeChatWithVision(
        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
        effort: String? = nil, request: RequestController?
    ) throws -> ([Int], VisionPrompt?) {
        let request: RequestController? = try request ?? beginRequest()
        try request?.attachReservations(requestReservations)
        try request?.checkInputBytes(ContextInputMemory.bytes(messages: messages, tools: tools))
        let baseIds = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        return try withImages(baseIds: baseIds, sources: messages.flatMap { $0.images }, request: request)
    }

    /// Expand each `<|image_pad|>` the template rendered into the run of
    /// placeholders its image is worth, and describe the images for the tower
    /// and the prefix cache. Shared by every surface so they cannot drift.
    private func withImages(baseIds: [Int], sources: [String], request: RequestController? = nil) throws -> ([Int], VisionPrompt?) {
        defer { request?.releaseDispatchReservation() }
        try request?.check(phase: "prompt preparation")
        if sources.isEmpty { return (baseIds, nil) }
        let started = RuntimeClock.now()
        let observer = generator.footprintSampling ? FootprintSampler() : nil
        let vmBefore = generator.footprintSampling ? ProcessMemory.vmActivity() : nil
        var observationFinished = false
        defer { if !observationFinished { _ = observer?.finish() } }
        // Decode and hash first: it needs no tower, it is cheap next to one,
        // and a malformed picture should be a 400 before the process commits
        // 0.9 GB to a tower it may not otherwise need.
        var decoded: [(cg: CGImage, hash: ImageHash)] = []
        let sourceBatch = DecodedImageBatch(deduplicate: model.optimizations.deduplicateImages)
        decoded.reserveCapacity(sources.count)
        for (i, source) in sources.enumerated() {
            try request?.check(nextAllocationBytes: min(source.utf8.count, VisionPreprocess.maxImageBytes * 2), phase: "image source decoding")
            do {
                let data = try VisionPreprocess.loadImageData(from: source)
                decoded.append(try sourceBatch.decode(data, request: request))
            } catch let failure as RequestFailure { throw failure }
            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
        }
        let decodedSeconds = RuntimeClock.seconds(since: started)
        let (visionConfig, pixelBounds) = try VisionTower.configuration(directory: modelDir)
        var items: [VisionPrompt.Item] = []
        items.reserveCapacity(decoded.count)
        var expandedCount = baseIds.count
        for (i, d) in decoded.enumerated() {
            try request?.check(phase: "image geometry")
            do {
                let plan = try VisionTower.plan(height: d.cg.height, width: d.cg.width,
                    cfg: visionConfig, bounds: pixelBounds)
                let (next, overflow) = expandedCount.addingReportingOverflow(plan.mergedTokens - 1)
                guard !overflow, next <= min(maxContextTokens, ContextPolicy.visionLimit) else {
                    throw RequestFailure(.contextLengthExceeded,
                        "image-expanded input exceeds the configured or qualified vision context; reduce the history or image count")
                }
                expandedCount = next
                items.append(VisionPrompt.Item(image: d.cg, plan: plan))
            } catch let failure as RequestFailure { throw failure }
            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
        }
        let towerStart = RuntimeClock.now()
        let workspace = items.map { ContextWorkspace.visionBytes(patches: $0.plan.patches,
            hidden: visionConfig.hiddenSize, heads: visionConfig.numHeads,
            queryTile: model.optimizations.visionQueryTile, padding: model.optimizations.visionAttentionPadding) }.max() ?? 0
        let vt = try ensureVisionTower(request: request, workspaceBytes: ContextBytes.sum(workspace, sourceBatch.chargedBytes))
        let towerReadySeconds = RuntimeClock.seconds(since: towerStart)
        // The template renders one `<|image_pad|>` per image; the tower
        // produces `mergedTokens` rows for it. Expanding the pad into a run of
        // that length is what makes the two line up, and it moves every token
        // after the first image — ids and segment offsets alike, in one sweep,
        // so a later prompt that extends this one keys identically.
        let imageId = model.cfg.imageTokenId
        let perImage = items.map { $0.plan.mergedTokens }
        var expanded: [Int] = []
        var segments: [ImageSegment] = []
        expanded.reserveCapacity(baseIds.count + perImage.reduce(0, +) - perImage.count)
        var imgIdx = 0
        for tok in baseIds {
            if tok == imageId, imgIdx < perImage.count {
                segments.append(
                    ImageSegment(
                        start: expanded.count, count: perImage[imgIdx], hash: decoded[imgIdx].hash))
                expanded.append(contentsOf: repeatElement(imageId, count: perImage[imgIdx]))
                imgIdx += 1
            } else {
                expanded.append(tok)
            }
        }
        // Both directions are checked. Too few placeholders means the template
        // did not render an image this code found; too many means something
        // else in the prompt tokenized to the placeholder id — a user who
        // typed the literal `<|image_pad|>`, for instance. Either way the rows
        // and the runs would not correspond, so the request stops here rather
        // than putting embeddings under the wrong tokens.
        guard imgIdx == items.count else {
            throw SlotstreamError.vision(
                "the chat template rendered \(imgIdx) image placeholders for \(items.count) "
                    + "images; slotstream cannot place the rest")
        }
        let placeholders = expanded.reduce(0) { $0 + ($1 == imageId ? 1 : 0) }
        guard placeholders == perImage.reduce(0, +) else {
            throw SlotstreamError.vision(
                "the prompt carries \(placeholders) image placeholder tokens but the images "
                    + "account for \(perImage.reduce(0, +)); remove any literal <|image_pad|> "
                    + "from the text")
        }
        guard expanded.count <= min(maxContextTokens, ContextPolicy.visionLimit) else {
            throw RequestFailure(.contextLengthExceeded, "image-expanded input exceeds the configured or qualified vision context limit")
        }
        let prompt = VisionPrompt(tower: vt, items: items, segments: segments, hiddenSize: model.cfg.hiddenSize)
        prompt.preparationRequest = request
        prompt.preparationObservation = ImagePreparationObservation(
            seconds: RuntimeClock.seconds(since: started), sourceDecodeSeconds: decodedSeconds,
            towerReadySeconds: towerReadySeconds, sampledFootprint: observer?.finish(),
            vmBefore: vmBefore, vmAfter: generator.footprintSampling ? ProcessMemory.vmActivity() : nil,
            sourceDecodedImages: sourceBatch.decodedImages, sourceReusedImages: sourceBatch.reusedImages,
            sourceAdmissionBytes: sourceBatch.chargedBytes)
        observationFinished = true
        return (expanded, prompt)
    }

    /// Every image a request carries, in the order the chat template will
    /// render them: message by message, part by part, and Ollama's per-message
    /// `images` array after that message's content parts — which is where the
    /// template puts them too.
    public static func imageSources(in messages: [[String: Any]]) -> [String] {
        var out: [String] = []
        for m in messages {
            if let content = m["content"] as? [[String: Any]] {
                for part in content {
                    if let iu = part["image_url"] as? [String: Any], let u = iu["url"] as? String {
                        out.append(u)
                    } else if let u = part["image_url"] as? String {
                        out.append(u)
                    } else if let u = part["image"] as? String {
                        out.append(u)
                    }
                }
            }
            for b64 in (m["images"] as? [String] ?? []) { out.append(b64) }
        }
        return out
    }

    /// Earliest position at which any stop sequence occurs, or nil.
    private static func stopIndex(_ text: String, _ stops: [String]) -> String.Index? {
        var best: String.Index?
        for s in stops {
            if let r = text.range(of: s), best == nil || r.lowerBound < best! {
                best = r.lowerBound
            }
        }
        return best
    }

    /// Serialized generation (single-flight; callers queue on the lock).
    ///
    /// Incremental detokenization consumes bounded groups of token ids, keeping
    /// incomplete UTF-8 bytes at the group boundary. Two rules matter:
    ///
    /// - Emission and stop holdback are by Unicode scalar, never Character. A
    ///   later token can contribute a scalar that merges into the grapheme
    ///   already sent (an emoji plus U+FE0F is still one Character).
    /// - While stop sequences are active, the last `maxStopLength - 1` scalars
    ///   are withheld, so the prefix of a stop sequence that straddles a token
    ///   boundary is never emitted before the rest of it arrives. Whatever is
    ///   still held back is flushed once generation ends.
    ///
    /// The invariant the tests hold this to: concatenating every streamed delta
    /// reproduces the non-streamed text exactly.
    public func generate(
        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        generate(promptIds: promptIds, params: params, vision: vision,
            shouldContinue: shouldContinue, onToken: onToken, request: nil)
    }

    public func generate(
        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil,
        request: RequestController?, onAdmitted: (() -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        let requestStart = RuntimeClock.now()
        let control: RequestController
        do {
            if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
            if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
            control = try request ?? beginRequest()
            try control.attachReservations(requestReservations)
            guard control.configuration.maxContextTokens <= allocatedContextTokens else {
                throw RequestFailure(.invalidConfiguration, "request policy exceeds the allocated engine window")
            }
            if let why = contextError(promptTokens: promptIds.count) {
                throw RequestFailure(.contextLengthExceeded, why)
            }
            guard promptIds.count <= control.configuration.maxContextTokens else {
                throw RequestFailure(.contextLengthExceeded, "prompt exceeds this request's configured context window")
            }
            try lock.lock(request: control)
        } catch {
            var stats = GenStats(); stats.promptTokens = promptIds.count
            let failure = error as? RequestFailure ?? RequestFailure(.inferenceError, String(describing: error))
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.memoryPressureCancelled = failure.code == .insufficientMemory
            if failure.code == .insufficientMemory, let ticket = pressureBoundary.snapshot() {
                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            stats.requestSeconds = request?.elapsedSeconds ?? RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        let queueSeconds = RuntimeClock.seconds(since: requestStart)
        let preparationSeconds = max(0, control.elapsedSeconds - queueSeconds)
        defer { control.releaseDispatchReservation(); lock.unlock() }
        var params = params.sanitized()
        // A queued request may acquire the lock before the waiting governor.
        // Refuse it before image encoding, cache checkout or GPU allocation.
        if let ticket = pressureBoundary.snapshot() {
            var stats = GenStats()
            stats.promptTokens = promptIds.count
            stats.memoryPressureCancelled = true
            let failure = control.fail(RequestFailure(.insufficientMemory,
                "memory pressure interrupted inference; retry after the cache resizes"))
            stats.requestFailure = failure; stats.runtimeError = failure.message
            stats.finishReason = "error"
            stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        let modeLimit = vision == nil ? ContextPolicy.modelLimit : ContextPolicy.visionLimit
        let effectiveWindow = min(maxContextTokens, control.configuration.maxContextTokens, modeLimit)
        guard promptIds.count <= effectiveWindow else {
            let failure = control.fail(RequestFailure(.contextLengthExceeded,
                "prompt exceeds the configured or qualified vision context window"))
            var stats = GenStats(); stats.promptTokens = promptIds.count
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.queueSeconds = queueSeconds; stats.preparationSeconds = preparationSeconds
            return ("", [], stats)
        }
        let room = max(0, effectiveWindow - promptIds.count)
        if room == 0 {
            if onAdmitted?() == false { control.cancel() }
            var stats = GenStats()
            if let failure = control.failure {
                stats.requestFailure = failure; stats.runtimeError = failure.message
            }
            stats.promptTokens = promptIds.count
            stats.finishReason = control.failure == nil ? "length" : "error"
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        // Context is prompt + completion, not two independent 32k allowances.
        params.maxTokens = min(params.maxTokens, room)
        let stops = params.stop
        let holdBack = stops.isEmpty
            ? 0 : max(0, (stops.map { $0.unicodeScalars.count }.max() ?? 1) - 1)
        var pendingIds: [Int] = []
        var withheld = ""
        var delivered = ""
        var lastTok = -1
        var clientGone = false
        var stopFound = false
        var firstTextSeconds: Double?
        var pressureObserved: PressureTicket?
        var pressureBoundarySeconds: Double?

        func observePressure() -> Bool {
            guard let ticket = pressureBoundary.snapshot() else { return false }
            control.fail(RequestFailure(.insufficientMemory,
                "memory pressure interrupted inference; retry after the cache resizes"))
            if pressureObserved == nil {
                pressureObserved = ticket
                pressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            return true
        }

        func emit(_ delta: String, _ tok: Int) -> Bool {
            if delta.isEmpty { return true }
            delivered += delta
            guard let cb = onToken else { return true }
            if firstTextSeconds == nil { firstTextSeconds = RuntimeClock.seconds(since: requestStart) }
            return cb(tok, delta)
        }

        /// Feed a stable decoded piece through the stop-sequence holdback.
        func feed(_ piece: String, final: Bool, tok: Int) -> Bool {
            withheld += piece
            if !stops.isEmpty, let cut = Self.stopIndex(withheld, stops) {
                _ = emit(String(withheld[..<cut]), tok)
                withheld = ""
                stopFound = true
                return false
            }
            let scalars = withheld.unicodeScalars
            let n = final ? scalars.count : max(0, scalars.count - holdBack)
            let delta = String(String.UnicodeScalarView(scalars.prefix(n)))
            withheld = String(String.UnicodeScalarView(scalars.dropFirst(n)))
            return emit(delta, tok)
        }

        /// Qwen's ByteLevel decoder is concatenative once a UTF-8 scalar is
        /// complete. Decode small bounded groups and retain four token bytes at
        /// the boundary; if the candidate still ends in U+FFFD, retain more.
        /// This makes streaming decode O(n), rather than decoding tokens 1...n
        /// after every generated token.
        func flushStablePrefix(_ tok: Int) -> Bool {
            guard !pendingIds.isEmpty else { return true }
            // Start from everything buffered and hand back one token at a time
            // while the decode still ends mid-scalar. Waiting for eight tokens
            // before the first flush and holding four back after it gave
            // clients one delta per four tokens, and no delta at all for a
            // reply shorter than eight; the byte-exactness this protects rests
            // on the replacement-character check below, not on the backlog.
            var n = pendingIds.count
            var piece = ""
            while n > 0 {
                piece = tokenizer.decode(
                    tokens: Array(pendingIds.prefix(n)), skipSpecialTokens: true)
                if !piece.hasSuffix("\u{FFFD}") { break }
                n -= 1
            }
            guard n > 0 else { return true }
            pendingIds.removeFirst(n)
            return feed(piece, final: false, tok: tok)
        }

        let needsIncrementalDecode = onToken != nil || !stops.isEmpty
        let tokenHandler: ((Int) -> Bool)? = needsIncrementalDecode ? { tok in
            control.sampledFirstToken()
            lastTok = tok
            pendingIds.append(tok)
            let ok = flushStablePrefix(tok)
            if !ok, !stopFound { clientGone = true }
            // A pressure event can arrive inside a client callback. This is
            // already a supported committed-emission boundary in both decode
            // paths; do not spend another forward before observing it.
            return ok && !observePressure()
        } : { _ in control.sampledFirstToken(); return !observePressure() }

        // Snapshot after any vision reservation/governor resize, while this
        // request owns the generation gate. Keep explicit process targets and
        // the device working set separate from reclaimable-memory admission.
        generator.readScopeFootprintLimitBytes = currentPlan.flatMap { plan in
            let limit = min(plan.targetGB ?? plan.expectedPeakGB, plan.workingSetGB)
            return limit.isFinite && limit > 0 && limit < Double(Int.max) / 1e9
                ? Int(limit * 1e9) : 0
        }
        var (ids, stats) = generator.generate(
            promptIds: promptIds, params: params, eosIds: eosIds, cache: prefixCache,
            vision: vision,
            shouldContinue: {
                guard !clientGone, !stopFound else { return false }
                if observePressure() { return false }
                return shouldContinue?() ?? true
            }, onToken: tokenHandler, request: control, onAdmitted: onAdmitted)

        var text = tokenizer.decode(tokens: ids, skipSpecialTokens: true)
        if !stops.isEmpty, let cut = Self.stopIndex(text, stops) {
            text = String(text[text.startIndex ..< cut])
        }
        // The one full decode is both the non-streamed result and an exact final
        // reconciliation for the bounded incremental decoder.
        if !clientGone, control.failure == nil, stats.runtimeError == nil, onToken != nil {
            let target = text.unicodeScalars
            let sent = delivered.unicodeScalars
            if target.count >= sent.count, target.starts(with: sent) {
                _ = emit(String(String.UnicodeScalarView(target.dropFirst(sent.count))), lastTok)
            }
        }
        stats.queueSeconds = queueSeconds
        stats.preparationSeconds = preparationSeconds
        stats.memoryPressureCancelled = pressureObserved != nil
        if pressureObserved != nil {
            stats.runtimeError = stats.runtimeError
                ?? "memory pressure interrupted inference; retry after the cache resizes"
            stats.finishReason = "error"
        }
        stats.memoryPressureBoundarySeconds = pressureBoundarySeconds
        stats.firstTextSeconds = firstTextSeconds
        if let failure = control.failure {
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.memoryPressureCancelled = failure.code == .insufficientMemory
            // A request guard can see the ticket before the legacy continuation
            // callback runs. Preserve the same observed boundary in that path.
            if failure.code == .insufficientMemory, stats.memoryPressureBoundarySeconds == nil,
               let ticket = pressureBoundary.snapshot() {
                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            prefixCache.drop()
            Stream.gpu.synchronize()
            MLX.Memory.clearCache()
        }
        stats.requestSeconds = control.elapsedSeconds
        return (text, ids, stats)
    }
}

````````````

## Artifact SHA-256 09f19ca477799aa70abbaf1aff6d6d956e4b9e5f126bd08d24a171b9c4e7d1a7

Encoding: `gzip+base64`. Original bytes: 78464.

````````````text
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
````````````

## Artifact SHA-256 1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4

Encoding: `utf-8`. Original bytes: 56247.

````````````text
// Qwen4Exp model assembly: 48 layers of (GDN | QSA) + MoE with
// hyper-connection residuals, PLE injection at the configured layer, and the
// final mixer + lm_head. Streams experts (SlotPool) and n-gram rows (NgramStore).

import Foundation
import MLX

public final class Qwen4ExpModel {
    /// All recurrent state and complete-prompt logits belong to this loaded model, even
    /// when another model has the same vocabulary and cache geometry.
    package let promptCheckpointIdentity = UUID()
    public let cfg: ModelConfig
    public let resident: ResidentWeights
    public let pool: SlotPool
    public let ngram: NgramStore
    public var optimizations: InferenceOptimizations
    /// Only the bounded long-context prefill path selects this arithmetic.
    /// Kept outside the independent optimization candidate bundle.
    package var smallPrefillSweep = false
    package var smallPrefillReferenceStart = 0
    package var smallPrefillReferenceEnd = ContextPolicy.modelLimit
    package var alignSmallReferenceDispatch = false
    package var stableSmallPrefillRouting = false
    package var stableSmallPrefillAttention = false
    package var stableSmallPrefillProjections = false
    public var paddedSmallKeyDomains: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallKeyDomains } }
    public var paddedSmallQueryRows: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallQueryRows } }
    public var smallPrefillSweeps: Int { moe.values.reduce(0) { $0 + $1.smallPrefillSweeps } }
    public var residentExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.residentPrelaunches } }
    public var residentExpertJoins: Int { moe.values.reduce(0) { $0 + $1.residentJoins } }
    public var residentExpertJoinSeconds: Double { moe.values.reduce(0) { $0 + $1.residentJoinSeconds } }
    public var sharedExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.sharedPrelaunches } }
    public var indexerSpecializedRows: Int { qsa.values.reduce(0) { $0 + $1.indexer.specializedRows } }
    private var routerCacheConfigured = false
    public var cachedRouterBytes: Int {
        moe.values.reduce(0) { $0 + $1.routerProjection.cachedBytes }
            + (mtpHead?.moe.routerProjection.cachedBytes ?? 0)
    }

    /// Request entry calls this before a cached MTP draft can advance. Direct
    /// model callers also prepare before touching main recurrent state.
    public var compiledNormFinishes: Int {
        (attnHC + mlpHC + [mixer]).reduce(0) { $0 + $1.compiledFinishes }
    }
    public var readHandleCount: Int { pool.readHandleCount + ngram.readHandleCount }
    public var selectedAttentionTiles: Int {
        qsa.values.reduce(0) { $0 + $1.selectedAttentionTiles } + (mtpHead?.attn.selectedAttentionTiles ?? 0)
    }
    public private(set) var terminalQueryRowsSkipped = 0
    public private(set) var terminalMoERowsSkipped = 0
    private enum HiddenDemand { case fullMulti, stateOnly, lastRow }
    private var compiledNormConfigured = false
    /// Lazy dispatch counters; GPU completion is established by evaluated outputs,
    /// never inferred from these scheduled-operation counts alone.
    public var fusedRoPERotationsScheduled: Int { rope.fusedRotationsScheduled }
    public var ropeTableHits: Int { rope.tableHits }
    public var ropeTableBuilds: Int { rope.tableBuilds }
    public var fusedGDNProjectionsScheduled: Int { gdn.values.reduce(0) { $0 + $1.fusedProjectionsScheduled } }
    func prepareOptimizationKernels(using executionOptions: InferenceOptimizations? = nil) {
        let optimizations = executionOptions ?? self.optimizations
        for layer in gdn.values { layer.fuseInputProjection = optimizations.fusedGDNProjection }
        rope.sharedTables = optimizations.sharedRoPE
        rope.fusedRotation = optimizations.fusedRoPE && PartialRotation.prepare()
        let selected = optimizations.selectedTextAttention && SelectedAttention.prepare()
        for layer in qsa.values { layer.selectedAttention = selected }
        mtpHead?.attn.selectedAttention = selected
        pool.directReadHandles = optimizations.directReadHandles
        ngram.directReadHandles = optimizations.directReadHandles
        let compiledNorm = optimizations.compiledNormFinish && CompiledArithmetic.prepare()
        if compiledNorm != compiledNormConfigured {
            for unit in attnHC + mlpHC + [mixer] { unit.compiledNormFinish = compiledNorm }
            compiledNormConfigured = compiledNorm
        }
        mtpHead?.attnHC.compiledNormFinish = compiledNorm
        mtpHead?.mlpHC.compiledNormFinish = compiledNorm
        mtpHead?.mixer.compiledNormFinish = compiledNorm
        ngram.ringEvictionOrder = optimizations.ngramRingOrder
        pool.denseLookup = optimizations.denseExpertLookup
        pool.sparsePinClearing = optimizations.sparsePoolPins
        pool.contiguousSlotWrites = optimizations.contiguousSlotWrites
        pool.wordSlotWrites = optimizations.wordSlotWrites
        pool.cpuSlotWrites = optimizations.cpuSlotWrites
        pool.layerLocalFloorEviction = optimizations.layerLocalFloorCache
        if routerCacheConfigured != optimizations.cachedRouterWeights {
            for layer in moe.values { layer.routerProjection.configure(cached: optimizations.cachedRouterWeights) }
            routerCacheConfigured = optimizations.cachedRouterWeights
        }
        mtpHead?.moe.routerProjection.configure(cached: optimizations.cachedRouterWeights)
        if optimizations.routerTopK { RouterSelection.prepare() }
        if optimizations.indexerBlockTopK { BlockSelection.prepare() }
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
    }

    let rope: Rope
    var gdn: [Int: GDNLayer] = [:]
    var qsa: [Int: QSAAttention] = [:]
    var moe: [Int: MoELayer] = [:]
    var attnHC: [GatedResidual] = []
    var mlpHC: [GatedResidual] = []
    var ple: [Int: PLELayer] = [:]
    let mixer: GatedResidual
    let lmHead: QLinear
    /// The optional MTP draft head for self-speculative decode; loaded from
    /// mtp.safetensors on demand (`enableMTP`), everything resident.
    public private(set) var mtpHead: MTPHead? = nil
    /// Diagnostic observer; called on the serialized model thread with router-rank IDs.
    public var routerObserver: ((Int, [Int32]) -> Void)?
    package var contextNumericsObserver: ((Int, String, MLXArray) -> Void)?
    package var gdnPhaseProfile: GDNPhaseProfile? {
        didSet { for layer in gdn.values { layer.phaseProfile = gdnPhaseProfile } }
    }
    public let runLayers: Int  // truncated for parity rigs; numLayers normally

    public final class State {
        var modelIdentity: UUID?
        package var ownerModelIdentity: UUID? { modelIdentity }
        let checkpointIdentity = UUID()
        var checkpointLifetimes: [WeakStateCheckpointLifetime] = []
        var recordingEnabled = false
        var recordedTokenIds: [Int]?
        var recordingBaseTokenCount: Int?
        var linear: [Int: LinearCache] = [:]
        var kv: [Int: KVCache] = [:]
        var indexer: [Int: IndexerCache] = [:]
        var ngramCtx: [Int64] = []
        public var tokenCount = 0
        // A failed low-level forward can change early layers while tokenCount
        // still names the preceding boundary. Count alone cannot certify reuse.
        var committedBoundaryValid = true
        /// Speculative-decode companions, created lazily by the MTP-aware
        /// generate path: the draft head's own attention state, and the
        /// pre-mixer multi stream at the last consumed position (the next
        /// draft step's hidden input). They ride the prefix cache with the
        /// rest of the state so conversations keep their draft context.
        public var mtp: MTPState?
        public var lastMulti: MLXArray?
        /// A draft pointer alone is insufficient: plain inference may have
        /// advanced the main prefix since the draft cache was last updated.
        public var hasValidMTP: Bool {
            guard let row = lastMulti, row.ndim == 3, row.dim(0) == 1, row.dim(1) == 1 else { return false }
            return mtp?.isAligned(withConsumedTokens: tokenCount) == true
        }
        public func invalidateMTP() { mtp = nil; lastMulti = nil }
        /// Allocated sequence buffers, including unused capacity after trim.
        /// Recurrent state, convolution windows and allocator cache are separate.
        public var allocatedSequenceBytes: Int {
            kv.values.reduce(0) { $0 + $1.allocatedBytes }
                + indexer.values.reduce(0) { $0 + $1.allocatedBytes }
                + (mtp.map { $0.kv.allocatedBytes + $0.indexer.allocatedBytes } ?? 0)
        }
        var compactStateWindows = false
        public init() {}
    }

    public convenience init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil) throws {
        try self.init(index: index, poolSlots: poolSlots, runLayers: runLayers, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil, embeddingRowCache: Bool?,
                 packGDNProjections: Bool? = nil) throws {
        self.optimizations = try InferenceOptimizations.environment()
        try ModelProcessGuard.acquire()
        self.cfg = index.config
        let selectedLayers = runLayers ?? index.config.numLayers
        guard selectedLayers >= 1, selectedLayers <= index.config.numLayers else {
            throw ModelError(
                "layer count must be between 1 and \(index.config.numLayers), got \(selectedLayers)")
        }
        guard poolSlots >= 1, poolSlots <= Geometry.totalRecords else {
            throw ModelError(
                "expert-pool slot count must be between 1 and \(Geometry.totalRecords), got \(poolSlots)")
        }
        self.runLayers = selectedLayers
        let store = try ExpertStore(index: index)
        // Reject a wrong/custom checkpoint before allocating the 3.8 GB
        // resident trunk or the expert pool.
        try Geometry.check(against: index.config, recordBytes: store.recordBytes)
        // Explicit experimental startup path: full-file verification precedes
        // resident/pool allocation. Default construction needs no repack.
        if let path = ProcessInfo.processInfo.environment["SLOTSTREAM_EXPERT_LAYOUT"] {
            guard !path.isEmpty else { throw ModelError("SLOTSTREAM_EXPERT_LAYOUT must name a packed artifact directory") }
            let report = try store.loadPackedLayout(at:URL(fileURLWithPath:path,isDirectory:true))
            fputs("[expert-layout] verified \(report.bytes) bytes in \(report.seconds) s\n",stderr)
        }
        // parity rigs keep the truncated layers' experts resident? no — pool serves them
        self.resident = try ResidentWeights(index: index, embeddingRowCache: embeddingRowCache,
            packGDNProjections: packGDNProjections ?? optimizations.fusedGDNProjection)
        self.pool = SlotPool(slots: poolSlots, store: store)
        self.ngram = NgramStore(index: index, resident: resident)
        self.rope = Rope(dim: cfg.rotaryDim, base: cfg.ropeTheta)

        for l in 0 ..< self.runLayers {
            let base = "model.layers.\(l)"
            if cfg.layerTypes[l] == "linear_attention" {
                gdn[l] = GDNLayer(resident, layer: l)
            } else {
                qsa[l] = QSAAttention(resident, layer: l)
            }
            moe[l] = MoELayer(resident, layer: l, pool: pool)
            attnHC.append(GatedResidual(resident, base: base + ".attn_hyper_connection", useCombine: true))
            mlpHC.append(GatedResidual(resident, base: base + ".mlp_hyper_connection", useCombine: true))
            if cfg.pleLayerIndices.contains(l) {
                ple[l] = PLELayer(resident, layer: l, store: ngram)
            }
        }
        if Self.debugDir != nil { attnHC[0].debugName = "hc0" }
        mixer = GatedResidual(resident, base: "model.hyper_connection_mixer", useCombine: false)
        lmHead = resident.linear("lm_head")
    }

    /// The model's rotary embedding (the MTP head shares it).
    public var sharedRope: Rope { rope }

    /// lm_head applied to a draft-head sample hidden — the draft's logits.
    public func draftLogits(_ sample: MLXArray) -> MLXArray { lmHead(sample) }

    /// Load the MTP draft head (1.5 GB resident). Idempotent; throws when
    /// mtp.safetensors is absent.
    public func enableMTP(modelDir: URL) throws {
        guard mtpHead == nil else { return }
        mtpHead = MTPHead(try MTPWeights(modelDir: modelDir, config: cfg))
    }

    /// Conservative capacity needed before a request grows its sequence
    /// caches. Charges allocation steps, completed-block storage and the draft
    /// head when it may be used; it performs no allocation or GPU evaluation.
    public func sequenceCapacityBytes(tokens: Int, mtp: Bool) -> Int {
        let layers = cfg.layerTypes.prefix(runLayers).filter { $0 != "linear_attention" }.count + (mtp ? 1 : 0)
        let rowBytes = (2 * cfg.numKVHeads * cfg.headDim + cfg.indexerHeadDim) * 2
        return ContextGeometry.capacityBytes(tokens: tokens, layers: layers, rowBytes: rowBytes,
            pooledRowBytes: cfg.indexerHeadDim * 2, compressionRatio: cfg.indexerCompressRatio,
            indexerBudget: cfg.indexerBudget, incrementalIndexer: optimizations.incrementalIndexer)
    }

    /// Bound the next physical sequence allocations, keeping main, draft,
    /// raw-indexer and pooled-indexer capacity separate. Rollback retains spare
    /// rows, but they can only be reused by the buffer that actually owns them.
    package func sequenceAllocationBytes(tokens: Int, draftTokens: Int?, state: State,
                                         sharedBacking: Bool = false) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit,
              draftTokens.map({ $0 >= 0 && $0 <= ContextPolicy.modelLimit }) ?? true else { return Int.max }
        let kvRowBytes = ContextBytes.product(cfg.numKVHeads, cfg.headDim, 2)
        let indexRowBytes = ContextBytes.product(cfg.indexerHeadDim, 2)
        func bytes(_ end: Int, kv: KVCache?, index: IndexerCache?, compact: Bool) -> Int {
            func replacement(_ count: Int, _ rowBytes: Int, _ owned: Int, step: Int = 1024) -> Int {
                ContextGeometry.nextBufferAllocationBytes(tokens: count, rowBytes: rowBytes,
                    allocatedBytes: sharedBacking ? 0 : owned, step: step)
            }
            let rawBase = index?.rawBase ?? 0
            guard end >= rawBase else { return Int.max }
            var result = ContextBytes.sum(
                replacement(end, kvRowBytes, kv?.keys?.nbytes ?? 0),
                replacement(end, kvRowBytes, kv?.values?.nbytes ?? 0),
                replacement(end - rawBase, indexRowBytes, index?.rawAllocatedBytes ?? 0,
                    step: compact && rawBase > 0 ? 256 : 1024))
            if end > cfg.indexerBudget, optimizations.incrementalIndexer || compact {
                let blocks = end / cfg.indexerCompressRatio
                result = ContextBytes.sum(result, replacement(blocks, indexRowBytes,
                    index?.pooledAllocatedBytes ?? 0, step: 256))
                if compact {
                    let first = min(blocks * cfg.indexerCompressRatio,
                        max(0, end - 32) / cfg.indexerCompressRatio * cfg.indexerCompressRatio)
                    if first - rawBase >= 256 {
                        // Compaction also creates a fresh small tail before
                        // releasing its parent; it is not a pre-allocation credit.
                        result = ContextBytes.sum(result, replacement(end - first, indexRowBytes, 0, step: 256))
                    }
                }
            }
            return result
        }
        var total = 0
        for layer in 0 ..< runLayers where cfg.layerTypes[layer] != "linear_attention" {
            let index = state.indexer[layer]
            total = ContextBytes.sum(total, bytes(tokens, kv: state.kv[layer], index: index,
                compact: index?.compactRaw ?? optimizations.compactIndexerRaw))
        }
        if let draftTokens {
            total = ContextBytes.sum(total, bytes(draftTokens, kv: state.mtp?.kv,
                index: state.mtp?.indexer, compact: state.mtp?.indexer.compactRaw ?? false))
        }
        return total
    }

    public func makeState() -> State {
        let s = State()
        s.modelIdentity = promptCheckpointIdentity
        s.ngramCtx = Array(repeating: Int64(cfg.eosTokenId), count: cfg.ngramSize - 1)
        for l in 0 ..< runLayers {
            if cfg.layerTypes[l] == "linear_attention" {
                s.linear[l] = LinearCache()
            } else {
                s.kv[l] = KVCache()
                s.indexer[l] = IndexerCache(compactRaw: optimizations.compactIndexerRaw)
            }
        }
        return s
    }

    /// One forward pass over `ids` (1, S). Returns final hidden (1, S, hidden).
    /// `perLayerHook` (parity rigs) receives the hyper-width h after each layer.
    /// Read once: ProcessInfo builds a fresh dictionary on every access, and
    /// this used to run 48 times per token.
    static let debugDir = ProcessInfo.processInfo.environment["SS_DEBUG_DIR"]
    static let debugLayer = Int(ProcessInfo.processInfo.environment["SS_DEBUG_LAYER"] ?? "0") ?? 0

    static func debugDump(_ name: String, _ arr: MLXArray) {
        guard let dir = debugDir else { return }
        let v = arr.asType(.float32).asArray(Float.self)
        let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
        try? d.write(to: URL(fileURLWithPath: dir).appendingPathComponent(name + ".bin"))
    }

    /// Replace the embeddings under each placeholder run with the tower's rows.
    ///
    /// The template expands one `<|image_pad|>` per image into a run of them,
    /// so what has to happen is a substitution of contiguous spans — which is
    /// what this does, entirely on the GPU. The first version copied the whole
    /// hidden to the CPU as float32, looped over `S × hidden` scalars, and
    /// uploaded it again, on every prefill pass of every vision request. It
    /// also scanned the ids for placeholders and, when the count disagreed with
    /// the rows it was given, logged a line and continued with unspliced
    /// placeholder embeddings — a silently wrong answer. A run carries its own
    /// rows, so the two cannot disagree; a wrong offset is a programming error
    /// and stops here.
    public static func spliceVision(
        _ h: MLXArray, runs: [VisionRun], length S: Int, hidden: Int
    ) -> MLXArray {
        var pieces: [MLXArray] = []
        var cursor = 0
        for run in runs.sorted(by: { $0.start < $1.start }) {
            precondition(
                run.start >= cursor && run.end <= S,
                "vision run \(run.start)..<\(run.end) outside 0..<\(S) or overlapping")
            if run.start > cursor { pieces.append(h[0..., cursor ..< run.start, 0...]) }
            pieces.append(run.rows.reshaped([1, run.count, hidden]).asType(h.dtype))
            cursor = run.end
        }
        if cursor < S { pieces.append(h[0..., cursor ..< S, 0...]) }
        return pieces.count == 1 ? pieces[0] : concatenated(pieces, axis: 1)
    }

    public func hiddenStates(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) -> MLXArray {
        checkpointCompatibility { try hiddenStatesChecked(ids, state: state, vision: vision, perLayerHook: perLayerHook) }
    }

    /// A read error may leave this caller-owned state partially advanced.
    /// Discard it or restore a prior checkpoint before any reuse. Generator
    /// performs that cleanup for its checked forward calls.
    public func hiddenStatesChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        let h = try hiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)
        return mixScope(h)
    }

    private func hiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        try runHiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)!
    }

    private func validateForward(_ ids: [Int], state: State) throws {
        guard !ids.isEmpty, ids.allSatisfy({ $0 >= 0 && $0 < cfg.vocabSize }) else {
            throw ModelError("model forward requires a nonempty sequence of valid token IDs")
        }
        guard state.committedBoundaryValid else {
            throw ModelError("model state has an incomplete forward; restore a committed checkpoint or create a new state")
        }
        // State() and tokenCount are public API. Reject an uninitialized,
        // incompatible or offset-corrupted state before changing any cache;
        // otherwise QSA's required cache access can trap after early layers
        // have already advanced. MTP alignment is intentionally checked by
        // its own lifecycle: target verification may have a provisional head.
        guard state.modelIdentity == promptCheckpointIdentity,
              state.tokenCount >= 0, ids.count <= Int(Int32.max),
              state.tokenCount <= Int(Int32.max) - ids.count,
              state.linear.count == gdn.count,
              state.kv.count == qsa.count, state.indexer.count == qsa.count,
              gdn.keys.allSatisfy({ state.linear[$0] != nil }),
              qsa.keys.allSatisfy({ state.kv[$0]?.offset == state.tokenCount
                  && state.indexer[$0]?.offset == state.tokenCount }) else {
            throw ModelError("model state is uninitialized, incompatible or offset-inconsistent; use makeState() or restore a committed checkpoint")
        }
    }

    private func runHiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil,
        computeRanges: [Range<Int>]? = nil, shouldContinue: (() -> Bool)? = nil,
        demand: HiddenDemand = .fullMulti, executionOptions: InferenceOptimizations? = nil
    ) throws -> MLXArray? {
        let optimizations = executionOptions ?? self.optimizations
        try validateForward(ids, state: state)
        state.recordedTokenIds = state.recordingEnabled ? ids : nil
        state.recordingBaseTokenCount = state.recordingEnabled ? state.tokenCount : nil
        state.committedBoundaryValid = false
        let S = ids.count
        let referenceRows: Int
        if alignSmallReferenceDispatch, smallPrefillSweep, state.tokenCount >= smallPrefillReferenceStart,
           state.tokenCount < smallPrefillReferenceEnd {
            let blockStart = smallPrefillReferenceStart + ((state.tokenCount - smallPrefillReferenceStart) / 256) * 256
            referenceRows = min(256, smallPrefillReferenceEnd - blockStart)
        } else { referenceRows = 256 }
        let projectionRows = stableSmallPrefillProjections && smallPrefillSweep && S < referenceRows ? referenceRows : 0
        let ranges = computeRanges ?? stride(from: 0, to: S, by: 4096).map { $0 ..< min(S, $0 + 4096) }
        let layerMajor = optimizations.layerExpertWorkspace && ranges.count > 1
        // Public full-output APIs, MTP and truncated diagnostic models retain
        // all rows. The pinned final layer is QSA; no recurrent update is
        // inferred from a configuration label or omitted for another family.
        let terminalPruning = optimizations.terminalPrefillPruning && mtpHead == nil
            && runLayers == cfg.numLayers && qsa[runLayers - 1] != nil
            && perLayerHook == nil && demand != .fullMulti
        let terminalLastQuery = terminalPruning && optimizations.terminalLastQuery && demand == .lastRow
        if layerMajor {
            precondition(optimizations.compactStateWindows && optimizations.boundedIndexer && optimizations.boundedPLE
                && !state.linear.values.contains(where: { $0.record }),
                "a larger layer workspace requires bounded state, indexer, PLE and a non-recording prefill")
        }
        // A workspace holds a full layer of expert weights while reducing
        // routed tiles. Freed MLX buffers must not coexist with that live
        // allocation: its cache limit admits one last whole buffer and can
        // overshoot the requested byte limit. Clear only disposable buffers;
        // expert residency, tensor shapes and evaluation order stay intact.
        let savedWorkspaceCacheLimit = optimizations.layerExpertWorkspace && S >= SweepTuning.minTokens
            ? MLX.Memory.cacheLimit : nil
        if savedWorkspaceCacheLimit != nil {
            MLX.Memory.cacheLimit = 0
            MLX.Memory.clearCache()
        }
        defer {
            if let savedWorkspaceCacheLimit { MLX.Memory.cacheLimit = savedWorkspaceCacheLimit }
        }
        prepareOptimizationKernels(using: optimizations)
        pool.workspacePiecewiseWrites = optimizations.workspacePiecewiseWrites
        state.compactStateWindows = optimizations.compactStateWindows
        ngram.compactRows = optimizations.compactNgramRows
        mtpHead?.attn.indexer.incrementalBlocks = optimizations.incrementalIndexer
        mtpHead?.attn.boundedIndexer = optimizations.boundedIndexer
        mtpHead?.attn.indexer.denseBypass = optimizations.denseIndexerBypass
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        var h0 = try resident.embedChecked(ids, shape: [1, S]).asType(.bfloat16)
        if !vision.isEmpty { h0 = Self.spliceVision(h0, runs: vision, length: S, hidden: cfg.hiddenSize) }
        Self.debugDump("embed", h0)
        var h = tiled(h0, repetitions: [1, 1, cfg.hcCount])

        // n-gram history: rolling context + new ids
        let history = state.ngramCtx + ids.map { Int64($0) }
        state.ngramCtx = Array(history.suffix(cfg.ngramSize - 1))
        let lookahead = optimizations.ngramLookahead && S >= 16 && runLayers > ngram.pleLayerIndex
            ? try ngram.beginPrefetch(history:history,nNew:S,maxTokens:optimizations.boundedPLE || layerMajor ? 256 : 1024) : nil
        defer { if let lookahead { ngram.discardPrefetch(lookahead) } }

        for l in 0 ..< runLayers {
            if shouldContinue?() == false { return nil }
            if MemTrace.on { MemTrace.enterLayer(l, kind: gdn[l] != nil ? "gdn" : "qsa") }
            moe[l]!.specializedRouter = optimizations.routerTopK
            moe[l]!.overlapShared = optimizations.overlapSharedExpert
            moe[l]!.overlapResident = optimizations.overlapResidentExperts
            qsa[l]?.indexer.denseBypass = optimizations.denseIndexerBypass
            qsa[l]?.indexer.specializedSelector = optimizations.indexerBlockTopK
            moe[l]!.workspaceComputeRanges = layerMajor ? ranges : []
            moe[l]!.workspaceTokenTile = optimizations.workspaceTokenTile
            attnHC[l].minimumProjectionRows = projectionRows
            mlpHC[l].minimumProjectionRows = projectionRows
            gdn[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.indexer.minimumProjectionRows = projectionRows
            ple[l]?.minimumProjectionRows = projectionRows
            moe[l]!.minimumProjectionRows = projectionRows
            if terminalPruning, l == runLayers - 1, demand == .stateOnly, layerMajor {
                let historyBase = history.count - S
                for range in ranges {
                    var hidden = h[0..., range, 0...]
                    if let p = ple[l] {
                        p.boundedTokens = true
                        let begin = max(0, historyBase + range.lowerBound - (cfg.ngramSize - 1))
                        hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + range.upperBound]),
                            nNew: range.count, cache: state.linear[l])
                    }
                    let x = attnHC[l](hidden).0
                    qsa[l]!.appendKeysOnly(x, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                    if shouldContinue?() == false { return nil }
                }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            if layerMajor {
                // Preserve the established 4096-token compute shapes while
                // sharing expert reads over the whole layer frontier.
                var bases: [MLXArray] = [], inputs: [MLXArray] = [], injections: [MLXArray] = []
                let historyBase = history.count - S
                for range in ranges {
                    let (lo, hi) = (range.lowerBound, range.upperBound)
                    let begin = max(0, historyBase + lo - (cfg.ngramSize - 1))
                    let lastQuery = terminalLastQuery && l == runLayers - 1
                    if lastQuery && hi < S {
                        // Earlier tiles contribute only persistent keys. Keep
                        // each original PLE/HC/projection compute shape.
                        var hidden = h[0..., lo ..< hi, 0...]
                        if let p = ple[l] {
                            p.boundedTokens = true
                            hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + hi]),
                                nNew: hi - lo, cache: state.linear[l])
                        }
                        qsa[l]!.appendKeysOnly(attnHC[l](hidden).0, rope: rope,
                            cache: state.kv[l]!, idxCache: state.indexer[l]!)
                        if shouldContinue?() == false { return nil }
                        continue
                    }
                    let prepared = try prepareScopeAttention(layer: l, hidden: h[0..., lo ..< hi, 0...],
                        history: Array(history[begin ..< historyBase + hi]), state: state,
                        lastQueryOnly: lastQuery, executionOptions: optimizations)
                    eval(prepared.base, prepared.input, prepared.injection)
                    state.linear[l]?.compactWindows()
                    if shouldContinue?() == false { return nil }
                    bases.append(prepared.base); inputs.append(prepared.input); injections.append(prepared.injection)
                }
                let base = concatenated(bases, axis: 1)
                let input = concatenated(inputs, axis: 1)
                let injection = concatenated(injections, axis: 1)
                if optimizations.compactScopeFrontier {
                    // The previous frontier and the component arrays are no
                    // longer needed after their joined values materialize.
                    // Release them before loading the full expert workspace.
                    eval(base, input, injection)
                    bases.removeAll(); inputs.removeAll(); injections.removeAll()
                    h = base
                }
                MemTrace.mark("scope-frontier", nil)
                moe[l]!.routerObserver = routerObserver
                moe[l]!.useLayerWorkspace = true
                if terminalPruning, l == runLayers - 1, demand == .lastRow {
                    moe[l]!.useLayerWorkspace = false
                    moe[l]!.workspaceComputeRanges = []
                    let row = input.dim(1) - 1
                    let output = try moe[l]!(input[0..., row..., 0...])
                    h = base[0..., row..., 0...] + (output.expandedDimensions(axis: -2)
                        * injection[0..., row..., 0...].expandedDimensions(axis: -1)).reshaped([1, 1, cfg.hcCount * cfg.hiddenSize])
                    terminalMoERowsSkipped += S - 1
                    if terminalLastQuery { terminalQueryRowsSkipped += S - input.dim(1) }
                } else {
                    let output = try moe[l]!(input)
                    h = base + (output.expandedDimensions(axis: -2)
                        * injection.expandedDimensions(axis: -1)).reshaped(base.shape)
                }
                eval(h)
                MemTrace.mark("layer-end", h)
                perLayerHook?(l, h)
                continue
            }
            if let p = ple[l] {
                p.boundedTokens = optimizations.boundedPLE
                h = try h + p(h, history: history, nNew: S, cache: state.linear[l] ?? nil)
                MemTrace.mark("ple", h)
            }
            let dbgLayer = Self.debugLayer
            let (x1, inj1) = attnHC[l](h)
            if l == dbgLayer { Self.debugDump("x1", x1); Self.debugDump("inj1", inj1!) }
            contextNumericsObserver?(l, "x1", x1)
            contextNumericsObserver?(l, "inj1", inj1!)
            MemTrace.mark("hc1", x1)
            if terminalPruning, l == runLayers - 1, demand == .stateOnly {
                qsa[l]!.appendKeysOnly(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                if shouldContinue?() == false { return nil }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            let attnOut: MLXArray
            if let g = gdn[l] {
                g.fusedRecording = optimizations.fusedGDNRecording
                attnOut = g(x1, cache: state.linear[l])
            } else {
                qsa[l]!.stableSmallKeyDomain = stableSmallPrefillAttention && smallPrefillSweep
                qsa[l]!.smallReferenceStart = smallPrefillReferenceStart
                qsa[l]!.smallReferenceEnd = smallPrefillReferenceEnd
                qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
                qsa[l]!.boundedIndexer = optimizations.boundedIndexer
                attnOut = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!,
                    lastQueryOnly: terminalLastQuery && l == runLayers - 1)
            }
            contextNumericsObserver?(l, "attn", attnOut)
            MemTrace.mark("attn", attnOut)
            if l == dbgLayer { Self.debugDump("attn", attnOut) }
            let lastQuery = terminalLastQuery && l == runLayers - 1
            let attentionInjection: MLXArray
            if lastQuery {
                let first = S - attnOut.dim(1)
                h = h[0..., first..., 0...]
                attentionInjection = inj1![0..., first..., 0...]
                terminalQueryRowsSkipped += first
            } else { attentionInjection = inj1! }
            h = h + (attnOut.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1))
                .reshaped(h.shape)
            contextNumericsObserver?(l, "hAfterAttn", h)
            if l == dbgLayer { Self.debugDump("hAfterAttn", h) }

            let pruneLastMoE = terminalPruning && l == runLayers - 1 && demand == .lastRow
            let (fullMLPInput, fullMLPInjection) = mlpHC[l](h)
            let mlpRow = h.dim(1) - 1
            let x2 = pruneLastMoE ? fullMLPInput[0..., mlpRow..., 0...] : fullMLPInput
            let inj2 = pruneLastMoE ? fullMLPInjection![0..., mlpRow..., 0...] : fullMLPInjection
            if pruneLastMoE {
                h = h[0..., mlpRow..., 0...]
                terminalMoERowsSkipped += S - 1
            }
            if l == dbgLayer { Self.debugDump("x2", x2) }
            contextNumericsObserver?(l, "x2", x2)
            contextNumericsObserver?(l, "inj2", inj2!)
            MemTrace.mark("hc2", x2)
            moe[l]!.routerObserver = routerObserver
            moe[l]!.useLayerWorkspace = optimizations.layerExpertWorkspace
            moe[l]!.disjointOutput = optimizations.disjointSweepOutput
            moe[l]!.boundedRows = optimizations.boundedSweepRows
            // A canonical terminal pass shorter than 256 uses the pool path.
            // Its smaller subpasses must preserve that expert arithmetic too.
            moe[l]!.smallPrefillSweep = smallPrefillSweep && referenceRows == 256
            moe[l]!.routerProjection.minimumRows = stableSmallPrefillRouting && smallPrefillSweep && S < referenceRows ? referenceRows : 0
            if let observe = contextNumericsObserver {
                moe[l]!.contextNumericsObserver = { name, value in observe(l, name, value) }
            } else { moe[l]!.contextNumericsObserver = nil }
            let moeOut = try moe[l]!(x2)
            contextNumericsObserver?(l, "moe", moeOut)
            if l == dbgLayer { Self.debugDump("moe", moeOut) }
            MemTrace.mark("moe", moeOut)
            h = h + (moeOut.expandedDimensions(axis: -2) * inj2!.expandedDimensions(axis: -1))
                .reshaped(h.shape)

            // synchronize the layer so pool references release before the next
            // layer's ensure() scatters (keeps slot writes in place, see PLAN §4.2)
            eval(h)
            // The layer has finished reading the convolution parent. Compact
            // only multi-token passes; a one-token decode parent is bounded
            // to the small convolution window plus one row already.
            if optimizations.compactStateWindows, S > 1 {
                state.linear[l]?.compactWindows()
            }
            MemTrace.mark("layer-end", h)
            perLayerHook?(l, h)
        }
        if shouldContinue?() == false { return nil }
        state.tokenCount += S
        state.committedBoundaryValid = true
        return h
    }

    private func mixScope(_ h: MLXArray, computeRanges: [Range<Int>]? = nil,
                          executionOptions: InferenceOptimizations? = nil) -> MLXArray {
        let optimizations = executionOptions ?? self.optimizations
        let ranges = computeRanges ?? stride(from: 0, to: h.dim(1), by: 4096).map { $0 ..< min(h.dim(1), $0 + 4096) }
        guard optimizations.layerExpertWorkspace, ranges.count > 1 else { return mixer(h).0 }
        var outputs: [MLXArray] = []
        for range in ranges {
            let mixed = mixer(h[0..., range, 0...]).0
            eval(mixed); outputs.append(mixed)
        }
        return concatenated(outputs, axis: 1)
    }

    private func prepareScopeAttention(layer l: Int, hidden: MLXArray, history: [Int64], state: State,
                                       lastQueryOnly: Bool = false, executionOptions: InferenceOptimizations? = nil)
        throws -> (base: MLXArray, input: MLXArray, injection: MLXArray) {
        let optimizations = executionOptions ?? self.optimizations
        var h = hidden
        if let p = ple[l] {
            p.boundedTokens = true
            h = try h + p(h, history: history, nNew: h.dim(1), cache: state.linear[l])
        }
        let (x1, inject) = attnHC[l](h)
        let attention: MLXArray
        if let g = gdn[l] {
            g.fusedRecording = optimizations.fusedGDNRecording
            attention = g(x1, cache: state.linear[l])
        } else {
            qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
            qsa[l]!.boundedIndexer = true
            attention = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!, lastQueryOnly: lastQueryOnly)
        }
        let attentionInjection: MLXArray
        if lastQueryOnly {
            let first = h.dim(1) - attention.dim(1)
            h = h[0..., first..., 0...]
            attentionInjection = inject![0..., first..., 0...]
        } else { attentionInjection = inject! }
        h = h + (attention.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1)).reshaped(h.shape)
        let (x2, inject2) = mlpHC[l](h)
        return (h, x2, inject2!)
    }

    /// Transactional prefill: only a completed whole-model scope is reusable.
    /// The checkpoint owns old recurrent states; append-only sequence caches
    /// restore logical offsets while retaining (and charging) grown capacity.
    package func consumeReadScope(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?) -> (logits: MLXArray?, committed: Bool) {
        checkpointCompatibility {
            try consumeReadScopeChecked(ids, passes: passes, state: state, vision: vision,
                head: head, final: final, shouldContinue: shouldContinue)
        }
    }

    package func consumeReadScopeChecked(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?, executionOptions: InferenceOptimizations? = nil)
        throws -> (logits: MLXArray?, committed: Bool) {
        // Automatic grouping supplies a request-local execution value. The
        // public configuration stays immutable while other requests prepare.
        let optimizations = executionOptions ?? self.optimizations
        // The next speculative draft can call its head directly, without a
        // main-model forward to refresh private module flags. Restore the
        // only MTP dispatch flag changed by automatic workspace selection.
        let configuredBoundedIndexer = self.optimizations.boundedIndexer
        defer {
            if executionOptions != nil, optimizations.boundedIndexer != configuredBoundedIndexer {
                mtpHead?.attn.boundedIndexer = configuredBoundedIndexer
            }
        }
        precondition(!passes.isEmpty && passes.allSatisfy { $0 > 0 } && passes.reduce(0, +) == ids.count)
        try validateForward(ids, state: state)
        var offset = 0
        let ranges = passes.map { n -> Range<Int> in
            defer { offset += n }; return offset ..< offset + n
        }
        let checkpoint = state.checkpoint()
        var committed = false
        defer {
            if !committed { state.restore(checkpoint); state.setRecording(false) }
        }
        let demand: HiddenDemand = head != nil ? .fullMulti
            : final ? .lastRow : optimizations.demandedPrefillOutput ? .stateOnly : .fullMulti
        guard let multi = try runHiddenMulti(ids, state: state, vision: vision,
            computeRanges: ranges, shouldContinue: shouldContinue, demand: demand, executionOptions: optimizations) else { return (nil, false) }
        if let head {
            for range in ranges {
                if shouldContinue?() == false { return (nil, false) }
                state.lastMulti = try head.consumeChecked(chunk: Array(ids[range]),
                    chunkMulti: multi[0..., range, 0...], prevMulti: state.lastMulti,
                    resident: resident, rope: rope, state: state.mtp!,
                    vision: vision.compactMap { $0.clipped(to: range.lowerBound, range.upperBound) },
                    compactRetainedRow: optimizations.compactMTPRow)
            }
        }
        var logits: MLXArray?
        if final || !optimizations.demandedPrefillOutput {
            let mixed = mixScope(multi, computeRanges: multi.dim(1) == ids.count ? ranges : nil, executionOptions: optimizations)
            if final { logits = lmHead(mixed[0..., (mixed.dim(1) - 1)..., 0...]); eval(logits!) }
            else { eval(mixed) }
        }
        if shouldContinue?() == false { return (nil, false) }
        committed = true
        return (logits, true)
    }

    /// All state-producing operations complete. The terminal QSA outputs,
    /// MoE and final mixer have no state needed by subsequent prompt passes.
    package func consumePrompt(_ ids: [Int], state: State, vision: [VisionRun] = []) {
        checkpointCompatibility { try consumePromptChecked(ids, state: state, vision: vision) }
    }

    package func consumePromptChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws {
        _ = try runHiddenMulti(ids, state: state, vision: vision, demand: .stateOnly)
    }

    /// Like `hiddenStates`, but also returns the pre-final-mixer multi stream
    /// (B,S,hc*H) — the hidden the MTP draft head consumes ("scheme A": the
    /// main model truly emits the pre-mixer stream on the first draft step).
    public func hiddenStatesWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (mixed: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try hiddenStatesWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func hiddenStatesWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (mixed: MLXArray, multi: MLXArray) {
        let multi = try hiddenMulti(ids, state: state, vision: vision)
        return (mixScope(multi), multi)
    }

    /// Logits for the last position only.
    public func lastLogits(_ ids: [Int], state: State, vision: [VisionRun] = []) -> MLXArray {
        checkpointCompatibility { try lastLogitsChecked(ids, state: state, vision: vision) }
    }

    public func lastLogitsChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws -> MLXArray {
        let multi = try runHiddenMulti(ids, state: state, vision: vision, demand: .lastRow)!
        let hidden = mixScope(multi)
        let last = hidden[0..., (hidden.dim(1) - 1)..., 0...]
        return lmHead(last)  // (1,1,vocab)
    }

    /// Logits at EVERY position plus the pre-mixer multi stream — the
    /// speculative verify pass needs both. S stays small (draft length + 1).
    public func allLogitsWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (logits: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try allLogitsWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func allLogitsWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (logits: MLXArray, multi: MLXArray) {
        let (mixed, multi) = try hiddenStatesWithMultiChecked(ids, state: state, vision: vision)
        return (lmHead(mixed), multi)
    }
}

/// A zero-copy snapshot of a State, for speculative-decode rollback. The
/// recurrent caches' arrays are REPLACED on every step (the GDN kernel emits
/// a fresh state_out; conv windows are re-sliced), never mutated in place, so
/// holding references is enough. KV/indexer buffers ARE written in place, but
/// only at rows past their offset — rolling the offset back is a full undo.
/// Compact main indexers additionally retain their bounded raw/pooled storage
/// here, so a cancelled long scope can undo released raw history exactly.
public struct StateCheckpoint {
    var lifetime: StateCheckpointLifetime
    var conv: [Int: MLXArray]
    var ssm: [Int: MLXArray]
    var pleConv: [Int: MLXArray]
    var kvOffsets: [Int: Int]
    var indexerOffsets: [Int: Int]
    var indexerSnapshots: [Int: IndexerCache.Snapshot]
    var ngramCtx: [Int64]
    var tokenCount: Int
    var committedBoundaryValid: Bool
    var mtpBoundaryValid: Bool
    var mtpOffset: Int
    var lastMulti: MLXArray?
}

extension Qwen4ExpModel.State {
    package func diagnosticIndexerBases() -> [String: Int] {
        Dictionary(uniqueKeysWithValues: indexer.map { ("index.\($0.key)", $0.value.rawBase) })
    }
    package var diagnosticDraftIndexerBase: Int? { mtp?.indexer.rawBase }
    /// Read-only logical state for exact continuation/ownership diagnostics.
    /// Indexer arrays expose the retained raw range, whose absolute base is
    /// available to package diagnostics. Released rows are represented by
    /// completed keys, not reconstructed or fabricated raw values.
    /// Returned arrays retain storage; release the snapshot before measuring
    /// liveness or memory. Unwritten KV capacity is deliberately excluded.
    public func diagnosticTensors() -> [String: MLXArray] {
        var result: [String: MLXArray] = [:]
        for (l, c) in linear {
            result["conv.\(l)"] = c.convState
            result["ssm.\(l)"] = c.ssmState
            result["ple.\(l)"] = c.pleConvState
        }
        for (l, c) in kv {
            result["key.\(l)"] = c.keys.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
            result["value.\(l)"] = c.values.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
        }
        for (l, c) in indexer { result["index.\(l)"] = c.diagnosticValues() }
        result["ngram"] = MLXArray(ngramCtx)
        result["tokens"] = MLXArray(Int64(tokenCount))
        result["lastMulti"] = lastMulti
        if let c = mtp {
            result["mtp.key"] = c.kv.keys.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.value"] = c.kv.values.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.index"] = c.indexer.diagnosticValues()
            result["mtp.offset"] = MLXArray(Int64(c.offset))
        }
        return result
    }

    public func checkpoint() -> StateCheckpoint {
        var conv: [Int: MLXArray] = [:]
        var ssm: [Int: MLXArray] = [:]
        var pleConv: [Int: MLXArray] = [:]
        for (l, c) in linear {
            if let a = c.convState { conv[l] = a }
            if let a = c.ssmState { ssm[l] = a }
            if let a = c.pleConvState { pleConv[l] = a }
        }
        checkpointLifetimes.removeAll { $0.value == nil }
        let lifetime = StateCheckpointLifetime(owner: checkpointIdentity, tokens: tokenCount,
            mtpOffset: mtp?.offset ?? 0)
        checkpointLifetimes.append(WeakStateCheckpointLifetime(lifetime))
        return StateCheckpoint(
            lifetime: lifetime, conv: conv, ssm: ssm, pleConv: pleConv,
            kvOffsets: kv.mapValues { $0.offset },
            indexerOffsets: indexer.mapValues { $0.offset },
            indexerSnapshots: indexer.compactMapValues { $0.snapshot() },
            ngramCtx: ngramCtx, tokenCount: tokenCount,
            committedBoundaryValid: committedBoundaryValid,
            mtpBoundaryValid: mtp == nil || hasValidMTP
                || (tokenCount == 0 && mtp?.offset == 0 && lastMulti == nil),
            mtpOffset: mtp?.offset ?? 0, lastMulti: lastMulti)
    }

    /// Start or stop recording per-position recurrent states in the linear
    /// layers (speculative verify passes only).
    public func setRecording(_ on: Bool) {
        recordingEnabled = on
        recordedTokenIds = nil
        recordingBaseTokenCount = nil
        for cache in indexer.values { cache.preserveRecordingRows(on) }
        for (_, cache) in linear {
            if on { cache.record = true } else { cache.clearRecording() }
        }
    }

    /// After a recording pass over `ids` from checkpoint `c`, keep only its
    /// first `n` tokens: recurrent states become the recorded ones at
    /// position n-1, KV and indexer caches trim to the checkpoint offset
    /// plus n, and the n-gram context is rebuilt from the ids. No model
    /// compute. `n` must be at least 1 and at most ids.count; keeping all of
    /// them only clears the recording.
    public func rollback(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) {
        do { try rollbackChecked(keeping: n, of: ids, from: c, ngramWindow: ngramWindow) }
        catch { preconditionFailure("\(error)") }
    }

    /// Recover only the recorded pass on this state; reject invalid input before mutation.
    public func rollbackChecked(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) throws {
        try validateRollback(keeping: n, ids: ids, checkpoint: c, ngramWindow: ngramWindow)
        if n < ids.count {
            for (_, cache) in linear {
                if !cache.ssmStates.isEmpty { cache.ssmState = cache.ssmStates[n - 1] }
                if !cache.convStates.isEmpty { cache.convState = cache.convStates[n - 1] }
                if !cache.pleConvStates.isEmpty { cache.pleConvState = cache.pleConvStates[n - 1] }
            }
            for (l, cache) in kv { cache.trim(to: (c.kvOffsets[l] ?? 0) + n) }
            for (l, cache) in indexer { cache.trim(to: (c.indexerOffsets[l] ?? 0) + n) }
            let history = c.ngramCtx + ids.prefix(n).map { Int64($0) }
            ngramCtx = Array(history.suffix(ngramWindow))
            tokenCount = c.tokenCount + n
        }
        invalidateCheckpoints(after: tokenCount, mtpOffset: nil)
        setRecording(false)
        if compactStateWindows {
            for cache in linear.values { cache.compactWindows() }
        }
    }

    /// Diagnostic for the rollback gate: the largest relative difference, over
    /// all linear layers, between this state's recurrent tensors and another's
    /// (max |a-b| / max |b|). A wrong window or a stale state reads order one;
    /// re-association reads bf16-ulp small.
    public func recurrentDelta(vs other: Qwen4ExpModel.State) -> (ssm: Double, conv: Double, ple: Double) {
        func delta(_ a: MLXArray?, _ b: MLXArray?) -> Double {
            guard let a, let b else { return (a == nil && b == nil) ? 0 : .infinity }
            guard a.shape == b.shape else { return .infinity }
            let d = abs(a.asType(.float32) - b.asType(.float32)).max().item(Float.self)
            let m = abs(b.asType(.float32)).max().item(Float.self)
            return Double(m > 0 ? d / m : d)
        }
        var s = 0.0, c = 0.0, p = 0.0
        for (l, cache) in linear {
            guard let o = other.linear[l] else { continue }
            s = max(s, delta(cache.ssmState, o.ssmState))
            c = max(c, delta(cache.convState, o.convState))
            p = max(p, delta(cache.pleConvState, o.pleConvState))
        }
        return (s, c, p)
    }

    public func restore(_ c: StateCheckpoint) {
        do { try restoreChecked(c) }
        catch { preconditionFailure("\(error)") }
    }

    /// Restore a live ancestor checkpoint from this exact state. KV storage is
    /// append-only, so snapshots from discarded future branches cannot be reused.
    public func restoreChecked(_ c: StateCheckpoint) throws {
        try validateCheckpoint(c)
        for (l, cache) in linear {
            cache.convState = c.conv[l]
            cache.ssmState = c.ssm[l]
            cache.pleConvState = c.pleConv[l]
        }
        for (l, cache) in kv {
            cache.trim(to: c.kvOffsets[l] ?? 0)
            if let k = cache.keys, let v = cache.values { eval(k, v) }
        }
        for (l, cache) in indexer {
            if let snapshot = c.indexerSnapshots[l] { cache.restore(snapshot) }
            else { cache.trim(to: c.indexerOffsets[l] ?? 0) }
            // Dense attention may not have evaluated raw indexer writes.
            // Detach their graph before a canceled scope releases its inputs.
            cache.materializeStorage()
        }
        ngramCtx = c.ngramCtx
        tokenCount = c.tokenCount
        committedBoundaryValid = c.committedBoundaryValid
        mtp?.trim(to: c.mtpOffset)
        mtp?.materialize()
        lastMulti = c.lastMulti
        invalidateCheckpoints(after: tokenCount, mtpOffset: c.mtpOffset)
        setRecording(false)
    }
}

// PLE cache slot rides on the linear cache of its (linear-attention) layer; if
// the PLE layer were ever a QSA layer this would need its own cache. Reject it
// at init time instead of failing silently.
extension Qwen4ExpModel {
    public func validate() throws {
        try Geometry.check(against: cfg, recordBytes: pool.recordBytes)
        for l in cfg.pleLayerIndices where l < runLayers {
            guard cfg.layerTypes[l] == "linear_attention" else {
                throw ModelError(
                    "PLE layer \(l) is not linear_attention, so its recurrent cache has no home — check --model")
            }
        }
    }
}

````````````

## Artifact SHA-256 898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce

Encoding: `utf-8`. Original bytes: 15366.

````````````text
import Foundation

/// Explicit controls for independently evaluated execution paths. The public
/// initializer is the reference; environment resolution selects the deployment
/// family and applies explicit overrides. Experimental paths remain disabled.
public struct InferenceOptimizations: Codable, Equatable {
    public var compactStateWindows = false
    public var compactMTPRow = false
    public var skipUnusedFinalForward = false
    public var tailAwarePrefill = false
    public var demandedPrefillOutput = false
    public var terminalPrefillPruning = false
    /// Independent final-QSA output reduction; a 64-row tail retains matrix
    /// dispatch for attention/output/HC, and shorter passes keep every row.
    /// Requires terminal prefill demand.
    package static let terminalQueryTile = 64
    public var terminalLastQuery = false
    public var compactNgramRows = false
    public var incrementalIndexer = false
    public var compactIndexerRaw = false
    public var valueOnlySamplerThreshold = false
    public var deviceSamplerDraw = false
    public var disjointSweepOutput = false
    public var boundedSweepRows = false
    public var boundedIndexer = false
    public var sharedRoPE = false
    public var fusedRoPE = false
    /// Requires the optional shared-backing layout at model construction.
    public var fusedGDNProjection = false
    public var fusedGDNRecording = false
    public var boundedPLE = false
    public var ngramLookahead = false
    public var layerExpertWorkspace = false
    public var workspaceTokenTile = 256
    public var compactScopeFrontier = false
    public var workspacePiecewiseWrites = false
    /// Experimental bounded layer-major scope; zero keeps chronological passes.
    public var readScopeTokens = 0
    /// Optional for backward-compatible decoding of saved control sets.
    /// Automatic grouping preserves the ordinary chronological fallback and
    /// requires a request memory controller. Explicit read scopes take priority.
    public var automaticReadScope: Bool? = nil
    public var reuseFirstMTPEntry = false
    /// Experimental shortening changes verification shapes and can change
    /// greedy output. Excluded from the combined candidate; sampled requests
    /// retain their original shapes. Independent context bounds always apply.
    public var boundedDraftTail = false
    public var adaptiveSpeculation = false
    public var resolvedRuntimeBudget = false
    public var layerLocalFloorCache = false
    public var boundedOutputQueue = false
    public var responsiveGovernor = false
    public var routerTopK = false
    public var denseIndexerBypass = false
    public var indexerBlockTopK = false
    public var overlapSharedExpert = false
    public var overlapResidentExperts = false
    public var deduplicateImages = false
    public var visionAttentionPadding = 0
    /// Independent, bounded original-attention path. Qualification pending.
    public var visionQueryTile = 0
    public var cachedRouterWeights = false
    public var directReadHandles = false
    public var compiledNormFinish = false
    public var selectedTextAttention = false
    public var ngramRingOrder = false
    public var denseExpertLookup = false
    public var sparsePoolPins = false
    public var contiguousSlotWrites = false
    public var wordSlotWrites = false
    public var cpuSlotWrites = false
    /// Exact already-scheduled commit boundary; zero disables common-prefix retention.
    public var prefixCheckpointTokens = 0
    /// Retain the complete committed prompt and its raw last logits. This is
    /// independently qualified before joining integrationCandidate.
    public var completePromptCheckpoint = false

    public var readScopeEnabled: Bool {
        readScopeTokens > 0 && layerExpertWorkspace && compactStateWindows
            && compactMTPRow && boundedIndexer && boundedPLE
    }

    public init() {}

    /// Joint execution family used by deployment selection and its diagnostics.
    /// The public initializer remains the explicit reference. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
        result.compactNgramRows = true
        result.skipUnusedFinalForward = true
        result.valueOnlySamplerThreshold = true
        result.deviceSamplerDraw = true
        result.boundedOutputQueue = true
        result.responsiveGovernor = true
        result.prefixCheckpointTokens = 256
        result.completePromptCheckpoint = true
        result.sharedRoPE = true
        result.fusedRoPE = true
        return result
    }

    /// Select the automatically deployed family with the measured kernel
    /// qualification boundary. Explicit controls can qualify another platform;
    /// kernel initialization and shape fallbacks also apply.
    package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
        var result = integrationCandidate
        result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
        return result
    }

    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
        try resolving(environment: env, defaults: deploymentCandidate())
    }

    /// Apply explicit overrides to a selected default family. Keeping this
    /// separate lets deployment qualify the actual resolution path while the
    /// public default and the explicit reference initializer remain unchanged.
    package static func resolving(environment env: [String: String], defaults: Self) throws -> Self {
        var result = defaults
        var recognized = Set<String>()
        func flag(_ name: String, fallback: Bool) throws -> Bool {
            recognized.insert(name)
            guard let value = env[name] else { return fallback }
            guard value == "0" || value == "1" else {
                throw ModelError("\(name) must be 0 or 1")
            }
            return value == "1"
        }
        result.compactStateWindows = try flag("SLOTSTREAM_OPT_COMPACT_STATE", fallback: result.compactStateWindows)
        result.completePromptCheckpoint = try flag("SLOTSTREAM_OPT_COMPLETE_PROMPT", fallback: result.completePromptCheckpoint)
        result.compactMTPRow = try flag("SLOTSTREAM_OPT_COMPACT_MTP", fallback: result.compactMTPRow)
        result.skipUnusedFinalForward = try flag("SLOTSTREAM_OPT_FINAL_FORWARD", fallback: result.skipUnusedFinalForward)
        result.tailAwarePrefill = try flag("SLOTSTREAM_OPT_TAIL_SCHEDULE", fallback: result.tailAwarePrefill)
        result.demandedPrefillOutput = try flag("SLOTSTREAM_OPT_OUTPUT_DEMAND", fallback: result.demandedPrefillOutput)
        result.terminalPrefillPruning = try flag("SLOTSTREAM_OPT_TERMINAL_PREFILL", fallback: result.terminalPrefillPruning)
        result.terminalLastQuery = try flag("SLOTSTREAM_OPT_TERMINAL_QUERY", fallback: result.terminalLastQuery)
        guard !result.terminalLastQuery || result.terminalPrefillPruning else {
            throw ModelError("TERMINAL_QUERY requires TERMINAL_PREFILL")
        }
        result.compactNgramRows = try flag("SLOTSTREAM_OPT_NGRAM_ROWS", fallback: result.compactNgramRows)
        result.incrementalIndexer = try flag("SLOTSTREAM_OPT_INDEXER_BLOCKS", fallback: result.incrementalIndexer)
        result.compactIndexerRaw = try flag("SLOTSTREAM_OPT_INDEXER_RAW", fallback: result.compactIndexerRaw)
        guard !result.compactIndexerRaw || result.incrementalIndexer else {
            throw ModelError("INDEXER_RAW requires INDEXER_BLOCKS")
        }
        result.valueOnlySamplerThreshold = try flag("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", fallback: result.valueOnlySamplerThreshold)
        result.deviceSamplerDraw = try flag("SLOTSTREAM_OPT_SAMPLER_DRAW", fallback: result.deviceSamplerDraw)
        result.disjointSweepOutput = try flag("SLOTSTREAM_OPT_SWEEP_PLACEMENT", fallback: result.disjointSweepOutput)
        result.boundedSweepRows = try flag("SLOTSTREAM_OPT_SWEEP_TILES", fallback: result.boundedSweepRows)
        result.boundedIndexer = try flag("SLOTSTREAM_OPT_INDEXER_TILES", fallback: result.boundedIndexer)
        result.sharedRoPE = try flag("SLOTSTREAM_OPT_SHARED_ROPE", fallback: result.sharedRoPE)
        result.fusedRoPE = try flag("SLOTSTREAM_OPT_FUSED_ROPE", fallback: result.fusedRoPE)
        result.fusedGDNProjection = try flag("SLOTSTREAM_OPT_GDN_PROJECTION", fallback: result.fusedGDNProjection)
        result.fusedGDNRecording = try flag("SLOTSTREAM_OPT_GDN_RECORD", fallback: result.fusedGDNRecording)
        result.boundedPLE = try flag("SLOTSTREAM_OPT_PLE_TILES", fallback: result.boundedPLE)
        result.ngramLookahead = try flag("SLOTSTREAM_OPT_NGRAM_LOOKAHEAD", fallback: result.ngramLookahead)
        result.layerExpertWorkspace = try flag("SLOTSTREAM_OPT_LAYER_WORKSPACE", fallback: result.layerExpertWorkspace)
        result.reuseFirstMTPEntry = try flag("SLOTSTREAM_OPT_MTP_FIRST_ENTRY", fallback: result.reuseFirstMTPEntry)
        result.boundedDraftTail = try flag("SLOTSTREAM_OPT_MTP_TAIL", fallback: result.boundedDraftTail)
        result.adaptiveSpeculation = try flag("SLOTSTREAM_OPT_ADAPTIVE_MTP", fallback: result.adaptiveSpeculation)
        result.resolvedRuntimeBudget = try flag("SLOTSTREAM_OPT_RUNTIME_BUDGET", fallback: result.resolvedRuntimeBudget)
        result.layerLocalFloorCache = try flag("SLOTSTREAM_OPT_FLOOR_CACHE", fallback: result.layerLocalFloorCache)
        result.boundedOutputQueue = try flag("SLOTSTREAM_OPT_OUTPUT_QUEUE", fallback: result.boundedOutputQueue)
        result.responsiveGovernor = try flag("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", fallback: result.responsiveGovernor)
        result.routerTopK = try flag("SLOTSTREAM_OPT_ROUTER_TOPK", fallback: result.routerTopK)
        result.denseIndexerBypass = try flag("SLOTSTREAM_OPT_INDEXER_DENSE", fallback: result.denseIndexerBypass)
        result.indexerBlockTopK = try flag("SLOTSTREAM_OPT_INDEXER_TOPK", fallback: result.indexerBlockTopK)
        result.overlapSharedExpert = try flag("SLOTSTREAM_OPT_SHARED_OVERLAP", fallback: result.overlapSharedExpert)
        result.overlapResidentExperts = try flag("SLOTSTREAM_OPT_RESIDENT_OVERLAP", fallback: result.overlapResidentExperts)
        result.deduplicateImages = try flag("SLOTSTREAM_OPT_IMAGE_REUSE", fallback: result.deduplicateImages)
        result.directReadHandles = try flag("SLOTSTREAM_OPT_READ_HANDLES", fallback: result.directReadHandles)
        result.compiledNormFinish = try flag("SLOTSTREAM_OPT_COMPILED_NORM", fallback: result.compiledNormFinish)
        result.selectedTextAttention = try flag("SLOTSTREAM_OPT_SELECTED_ATTENTION", fallback: result.selectedTextAttention)
        result.ngramRingOrder = try flag("SLOTSTREAM_OPT_NGRAM_RING", fallback: result.ngramRingOrder)
        result.denseExpertLookup = try flag("SLOTSTREAM_OPT_EXPERT_MAP", fallback: result.denseExpertLookup)
        result.sparsePoolPins = try flag("SLOTSTREAM_OPT_POOL_PINS", fallback: result.sparsePoolPins)
        result.contiguousSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_SLICES", fallback: result.contiguousSlotWrites)
        result.wordSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_WORDS", fallback: result.wordSlotWrites)
        result.cpuSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_CPU", fallback: result.cpuSlotWrites)
        guard !result.cpuSlotWrites || (!result.wordSlotWrites && !result.contiguousSlotWrites) else {
            throw ModelError("SLOT_CPU cannot be combined with SLOT_WORDS or SLOT_SLICES")
        }
        let checkpointKey = "SLOTSTREAM_OPT_PREFIX_CHECKPOINT"
        recognized.insert(checkpointKey)
        if let value = env[checkpointKey] {
            guard let n = Int(value), [0, 256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(checkpointKey) must be 0, 256, 512, 1024, 2048 or 4096")
            }
            result.prefixCheckpointTokens = n
        }
        result.cachedRouterWeights = try flag("SLOTSTREAM_OPT_ROUTER_WEIGHTS", fallback: result.cachedRouterWeights)
        let visionPaddingKey = "SLOTSTREAM_OPT_VISION_PADDING"
        recognized.insert(visionPaddingKey)
        if let value = env[visionPaddingKey] {
            guard let n = Int(value), [0, 80, 128].contains(n) else {
                throw ModelError("\(visionPaddingKey) must be 0, 80 or 128")
            }
            result.visionAttentionPadding = n
        }
        let visionTileKey = "SLOTSTREAM_OPT_VISION_QUERY_TILE"
        recognized.insert(visionTileKey)
        if let value = env[visionTileKey] {
            guard let n = Int(value), [0, 256].contains(n) else {
                throw ModelError("\(visionTileKey) must be 0 or 256")
            }
            result.visionQueryTile = n
        }
        guard result.visionQueryTile == 0 || result.visionAttentionPadding == 0 else {
            throw ModelError("VISION_QUERY_TILE and VISION_PADDING are independent candidates")
        }
        result.compactScopeFrontier = try flag("SLOTSTREAM_OPT_SCOPE_FRONTIER", fallback: result.compactScopeFrontier)
        result.workspacePiecewiseWrites = try flag("SLOTSTREAM_OPT_WORKSPACE_PIECES", fallback: result.workspacePiecewiseWrites)
        let tileKey = "SLOTSTREAM_OPT_WORKSPACE_TILE"
        recognized.insert(tileKey)
        if let value = env[tileKey] {
            guard let n = Int(value), [256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(tileKey) must be 256, 512, 1024, 2048 or 4096")
            }
            result.workspaceTokenTile = n
        }
        let scopeKey = "SLOTSTREAM_OPT_READ_SCOPE"
        recognized.insert(scopeKey)
        if let value = env[scopeKey] {
            guard let n = Int(value), [0, 1024, 4096, 8192].contains(n) else {
                throw ModelError("\(scopeKey) must be 0, 1024, 4096 or 8192")
            }
            result.readScopeTokens = n
        }
        guard result.readScopeTokens == 0 || result.readScopeEnabled else {
            throw ModelError("read scopes require LAYER_WORKSPACE, COMPACT_STATE, COMPACT_MTP, INDEXER_TILES and PLE_TILES")
        }
        // Manual scope controls suppress an inherited automatic policy. An
        // explicit AUTO_READ_SCOPE=1 requests policy selection over that base;
        // explicit nonzero read scopes still retain their original semantics.
        let manualScopeKeys = ["SLOTSTREAM_OPT_LAYER_WORKSPACE", "SLOTSTREAM_OPT_READ_SCOPE",
            "SLOTSTREAM_OPT_INDEXER_TILES", "SLOTSTREAM_OPT_PLE_TILES",
            "SLOTSTREAM_OPT_WORKSPACE_TILE", "SLOTSTREAM_OPT_SCOPE_FRONTIER",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES"]
        let inheritedAutomatic = result.automaticReadScope == true
            && !manualScopeKeys.contains(where: { env[$0] != nil })
        result.automaticReadScope = try flag("SLOTSTREAM_OPT_AUTO_READ_SCOPE",
            fallback: inheritedAutomatic) ? true : nil
        let unknown = env.keys.filter { $0.hasPrefix("SLOTSTREAM_OPT_") && !recognized.contains($0) }.sorted()
        guard unknown.isEmpty else { throw ModelError("unknown optimization controls: \(unknown.joined(separator: ", "))") }
        return result
    }
}

````````````

## Artifact SHA-256 69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d

Encoding: `utf-8`. Original bytes: 15167.

````````````text
import Foundation

public struct ContextConfiguration: Sendable, Equatable {
    public static let defaultWaitMinutes = 30.0
    public let maxContextTokens: Int
    public let maxPrefillWaitMinutes: Double
    /// Explicit diagnostic qualification, never inferred from a mutable cap.
    public let qualification: Bool

    public init(maxContextTokens: Int = ContextPolicy.defaultTokens,
                maxPrefillWaitMinutes: Double = defaultWaitMinutes,
                qualification: Bool = false) throws {
        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) {
            throw RequestFailure(.contextLengthExceeded, why)
        }
        guard maxPrefillWaitMinutes.isFinite, maxPrefillWaitMinutes >= 0,
              maxPrefillWaitMinutes <= Double(UInt64.max) / 60 / 1e9 else {
            throw RequestFailure(.invalidConfiguration,
                "--max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy")
        }
        self.maxContextTokens = maxContextTokens
        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
        self.qualification = qualification
    }
}

public struct RequestFailure: Error, CustomStringConvertible, Codable, Sendable, Equatable {
    public enum Code: String, Codable, Sendable {
        case contextLengthExceeded = "context_length_exceeded"
        case invalidConfiguration = "invalid_configuration"
        case prefillWaitExceeded = "prefill_wait_exceeded"
        case insufficientMemory = "insufficient_memory"
        case prefillDeadlineExceeded = "prefill_deadline_exceeded"
        case clientCancelled = "client_cancelled"
        case inferenceError = "inference_error"
    }
    public let code: Code
    public let message: String
    public var elapsedSeconds: Double?
    public var limitSeconds: Double?
    public var estimatedSeconds: Double?
    public var requiredBytes: Int?
    public var availableBytes: Int?
    public init(_ code: Code, _ message: String) { self.code = code; self.message = message }
    public var description: String { message }
    public var httpStatus: String {
        switch code {
        case .contextLengthExceeded, .invalidConfiguration, .prefillWaitExceeded: return "400 Bad Request"
        case .insufficientMemory, .prefillDeadlineExceeded: return "503 Service Unavailable"
        case .clientCancelled: return "499 Client Closed Request"
        case .inferenceError: return "500 Internal Server Error"
        }
    }
    public var json: [String: Any] {
        var result: [String: Any] = ["code": code.rawValue, "type": code.rawValue, "message": message]
        if let elapsedSeconds { result["elapsed_seconds"] = elapsedSeconds }
        if let limitSeconds { result["limit_seconds"] = limitSeconds }
        if let estimatedSeconds { result["estimated_seconds"] = estimatedSeconds }
        if let requiredBytes { result["required_bytes"] = requiredBytes }
        if let availableBytes { result["available_bytes"] = availableBytes }
        return result
    }
}

/// Atomic admission for allocations that concurrent accepted requests have
/// reserved but may not have materialized yet. Retained preparation stays
/// charged until its controller is released, including time in the queue.
package final class RequestMemoryReservations: @unchecked Sendable {
    private let lock = NSLock()
    private var entries: [UUID: [String: Int]] = [:]
    package init() {}
    package var reservedBytes: Int { lock.withLock { entries.values.reduce(0) { ContextBytes.sum($0, $1.values.reduce(0) { ContextBytes.sum($0, $1) }) } } }
    package func release(_ id: UUID) { lock.withLock { _ = entries.removeValue(forKey: id) } }
    package func releaseDispatch(_ id: UUID) { lock.withLock { entries[id]?["dispatch"] = nil } }

    package func check(_ id: UUID, kind: String?, bytes: Int, slack: Int,
                       available: () -> Double?, phase: String) throws {
        _ = try select(id, kind: kind, allocations: [bytes], slack: slack,
            available: available, phase: phase)
    }

    /// Selection and ownership are one transaction. A rejected preferred
    /// workspace must neither poison the request nor reserve its bytes.
    package func chooseDispatch(_ id: UUID, preferredBytes: Int, fallbackBytes: Int,
                                slack: Int, available: () -> Double?, phase: String) throws -> Bool {
        try select(id, kind: "dispatch", allocations: [preferredBytes, fallbackBytes],
            slack: slack, available: available, phase: phase) == 0
    }

    private func select(_ id: UUID, kind: String?, allocations: [Int], slack: Int,
                        available: () -> Double?, phase: String) throws -> Int {
        try lock.withLock {
            let previous = entries[id] ?? [:]
            let others = entries.reduce(0) { sum, entry in
                entry.key == id ? sum : ContextBytes.sum(sum, entry.value.values.reduce(0) { ContextBytes.sum($0, $1) })
            }
            guard let gb = available(), gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 else {
                throw RequestFailure(.insufficientMemory, "reclaimable memory is unreadable during \(phase)")
            }
            let observed = Int(gb * 1e9)
            var required = Int.max
            for (index, bytes) in allocations.enumerated() {
                var own = previous
                if let kind { own[kind] = kind == "dispatch" ? bytes : max(own[kind] ?? 0, bytes) }
                let proposed = kind == nil ? 0 : own.values.reduce(0) { ContextBytes.sum($0, $1) }
                required = ContextBytes.sum(others, proposed, slack)
                if required < Int.max, observed >= required {
                    if kind != nil { entries[id] = own }
                    return index
                }
            }
            var failure = RequestFailure(.insufficientMemory,
                "insufficient memory for \(phase), queued requests and safety headroom; retry after other requests finish")
            failure.requiredBytes = required; failure.availableBytes = observed
            throw failure
        }
    }

}

/// One accepted request owns one monotonic clock, including all queue and
/// preparation work. Neither transport activity nor prefix reuse restarts it.
/// Injectable observations exercise refusal without stressing the machine.
public final class RequestController: @unchecked Sendable {
    public let configuration: ContextConfiguration
    public let slackBytes: Int
    private let clock: () -> UInt64
    private let available: () -> Double?
    private let connected: () -> Bool
    private let pressure: () -> Bool
    private let started: UInt64
    private let lock = NSLock()
    private var failureValue: RequestFailure?
    private var firstToken = false
    private var estimateValue: Double?
    private let reservationID = UUID()
    private var reservations: RequestMemoryReservations?
    public var estimatedPrefillSeconds: Double? { lock.withLock { estimateValue } }

    public init(configuration: ContextConfiguration, slackBytes: Int,
                clock: @escaping () -> UInt64 = { DispatchTime.now().uptimeNanoseconds },
                availableGB: @escaping () -> Double? = { Planner.deviceAvailableGB() },
                connected: @escaping () -> Bool = { true }, pressure: @escaping () -> Bool = { false }) {
        self.configuration = configuration
        self.slackBytes = max(0, slackBytes)
        self.clock = clock; self.available = availableGB; self.connected = connected; self.pressure = pressure
        started = clock()
    }
    deinit { reservations?.release(reservationID) }
    package func attachReservations(_ pool: RequestMemoryReservations) throws {
        try lock.withLock {
            if let reservations, reservations !== pool {
                throw RequestFailure(.invalidConfiguration, "a request cannot move between engine memory budgets")
            }
            reservations = pool
        }
    }
    package func releaseDispatchReservation() {
        lock.withLock { reservations?.releaseDispatch(reservationID) }
    }
    public var elapsedSeconds: Double {
        let now = clock()
        return Double(now >= started ? now - started : 0) / 1e9
    }
    public var failure: RequestFailure? { lock.withLock { failureValue } }
    public var mayRetainState: Bool { failure == nil }
    @discardableResult public func fail(_ error: RequestFailure) -> RequestFailure {
        lock.withLock {
            if failureValue == nil { failureValue = error }
            return failureValue!
        }
    }
    public func cancel() { fail(RequestFailure(.clientCancelled, "the client cancelled this request")) }
    public func sampledFirstToken() { lock.withLock { firstToken = true } }

    /// Check before an allocation, not after it. Only actually reusable bytes
    /// can be subtracted by callers; future reservations never authorize growth.
    public func check(nextAllocationBytes: Int = 0, phase: String = "inference") throws {
        if let failure { throw failure }
        guard nextAllocationBytes >= 0 else {
            throw fail(RequestFailure(.invalidConfiguration, "allocation byte count must be nonnegative"))
        }
        if !connected() { throw fail(RequestFailure(.clientCancelled, "the client disconnected during \(phase)")) }
        let elapsed = elapsedSeconds
        let seconds = configuration.maxPrefillWaitMinutes * 60
        if seconds > 0, !lock.withLock({ firstToken }), elapsed >= seconds {
            var error = RequestFailure(.prefillDeadlineExceeded,
                "request-to-first-token deadline exceeded during \(phase); send less context or raise --max-prefill-wait")
            error.elapsedSeconds = elapsed; error.limitSeconds = seconds
            throw fail(error)
        }
        if pressure() {
            throw fail(RequestFailure(.insufficientMemory, "memory pressure interrupted \(phase); retry after memory becomes available"))
        }
        if let pool = lock.withLock({ reservations }) {
            do {
                try pool.check(reservationID, kind: nextAllocationBytes > 0 ? "dispatch" : nil,
                    bytes: nextAllocationBytes, slack: slackBytes, available: available, phase: phase)
            } catch let error as RequestFailure { throw fail(error) }
            return
        }
        let (required, overflow) = max(0, nextAllocationBytes).addingReportingOverflow(slackBytes)
        guard !overflow else { throw fail(RequestFailure(.insufficientMemory, "allocation size exceeds the supported memory range")) }
        let reading = available()
        if let gb = reading, gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 {
            let bytes = Int(gb * 1e9)
            if bytes < required {
                var error = RequestFailure(.insufficientMemory,
                    "insufficient reclaimable memory for \(phase) and safety headroom; close other apps or lower the memory/context target")
                error.requiredBytes = required; error.availableBytes = bytes
                throw fail(error)
            }
        } else if configuration.maxContextTokens > ContextPolicy.defaultTokens && nextAllocationBytes > 0 {
            throw fail(RequestFailure(.insufficientMemory,
                "reclaimable memory is unreadable; refusing additional long-context allocation during \(phase)"))
        }
    }

    /// Price both execution paths before dispatch. Prefer the read-sharing
    /// workspace when it fits, otherwise keep the ordinary chronological
    /// path. Only failure of the fallback becomes a sticky request failure.
    /// Unknown standalone observations retain the existing fallback policy;
    /// they never authorize the larger optional workspace.
    package func chooseAllocation(preferredBytes: Int, fallbackBytes: Int,
                                  phase: String) throws -> Bool {
        if let failure { throw failure }
        guard fallbackBytes >= 0, preferredBytes >= fallbackBytes else {
            throw fail(RequestFailure(.invalidConfiguration,
                "preferred and fallback allocations must be nonnegative and ordered"))
        }
        // Preserve cancellation, deadlines, pressure and queued ownership.
        try check(phase: phase)
        if let pool = lock.withLock({ reservations }) {
            do {
                return try pool.chooseDispatch(reservationID, preferredBytes: preferredBytes,
                    fallbackBytes: fallbackBytes, slack: slackBytes, available: available, phase: phase)
            } catch let error as RequestFailure { throw fail(error) }
        }
        let preferredRequired = ContextBytes.sum(preferredBytes, slackBytes)
        if preferredRequired < Int.max, let gb = available(), gb.isFinite, gb >= 0,
           gb < Double(Int.max) / 1e9, Int(gb * 1e9) >= preferredRequired {
            return true
        }
        try check(nextAllocationBytes: fallbackBytes, phase: phase)
        return false
    }

    /// Conservative temporary-copy allowance for templating/tokenization.
    /// Counting input must not itself serialize an arbitrarily large value.
    public func checkInputBytes(_ bytes: Int) throws {
        guard bytes >= 0 else { throw fail(RequestFailure(.invalidConfiguration, "invalid input byte count")) }
        try reservePreparation(kind: "input", bytes: ContextBytes.product(bytes, 16), phase: "prompt tokenization")
    }

    package func reservePreparedImageBytes(_ bytes: Int) throws {
        try reservePreparation(kind: "pixels", bytes: bytes, phase: "retained image preparation")
    }
    private func reservePreparation(kind: String, bytes: Int, phase: String) throws {
        guard bytes >= 0 else { throw fail(RequestFailure(.invalidConfiguration, "invalid preparation byte count")) }
        try check(phase: phase)
        if let pool = lock.withLock({ reservations }) {
            do { try pool.check(reservationID, kind: kind, bytes: bytes, slack: slackBytes, available: available, phase: phase) }
            catch let error as RequestFailure { throw fail(error) }
        } else { try check(nextAllocationBytes: bytes, phase: phase) }
    }

    public func admit(missingTokens: Int, from position: Int, maxChunk: Int,
                      tailAware: Bool = false) throws {
        try check(phase: "admission")
        let estimate = PrefillSchedule.estimateSeconds(tokens: missingTokens, from: position,
            maxChunk: maxChunk, tailAware: tailAware)
        lock.withLock { estimateValue = estimate }
        let limit = configuration.maxPrefillWaitMinutes * 60
        if limit > 0, let estimate, elapsedSeconds + estimate > limit {
            var error = RequestFailure(.prefillWaitExceeded,
                "estimated missing-context prefill exceeds the remaining wait budget; send less, reuse a valid prefix, or raise --max-prefill-wait")
            error.elapsedSeconds = elapsedSeconds; error.limitSeconds = limit; error.estimatedSeconds = estimate
            throw fail(error)
        }
    }
}

````````````

## Artifact SHA-256 3073de4167c10667101cf3e46e332632b38303d94b50896d3e4c05dd3eafafd3

Encoding: `utf-8`. Original bytes: 49287.

````````````text
import Foundation
import Slotstream

extension Diagnostics {
    public static func configurableContext() throws -> CheckReport {
        var c = CheckBuilder("configurable-context")
        let cacheModel = UUID(), cacheOptions = InferenceOptimizations()
        let currentKey = PromptCheckpointKey(model: cacheModel, optimizations: cacheOptions,
            prefillChunk: 256, mtp: false)
        c.equal("prompt cache defaults to the current arithmetic epoch", currentKey.contextArithmetic, 1)
        c.expect("old arithmetic cannot match a current prompt checkpoint", currentKey != PromptCheckpointKey(
            model: cacheModel, optimizations: cacheOptions, prefillChunk: 256, mtp: false, contextArithmetic: 0))
        let caps = [1, 1024, 4096, 8192, 32768, 32769, 65535, 65536, 65537,
                    128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
        for cap in caps {
            let bytes = ContextGeometry.sequenceBytes(tokens: cap)
            // Independent allocator geometry, not a restatement of a helper call.
            let rows = ((cap + 1023) / 1024) * 1024
            c.equal("main allocated capacity \(cap)", bytes, rows * 12 * (2 * 2 * 256 + 128) * 2)
            c.equal("MTP allocated capacity \(cap)", ContextGeometry.sequenceBytes(tokens: cap, mtp: true),
                    rows * 13 * (2 * 2 * 256 + 128) * 2)
        }
        c.equal("overflowing capacity is refused", ContextGeometry.sequenceBytes(tokens: Int.max), Int.max)
        c.equal("negative capacity is refused", ContextGeometry.sequenceBytes(tokens: -1), Int.max)
        // These represent separately owned buffers, including different spare
        // main/draft capacities after rollback. A large unrelated buffer cannot
        // pay for a replacement, and old storage is not yet reclaimable.
        let keyRow = 2 * 256 * 2
        let mainGrowth = ContextGeometry.nextBufferAllocationBytes(tokens: 1025,
            rowBytes: keyRow, allocatedBytes: 1024 * keyRow)
        let draftSpare = ContextGeometry.nextBufferAllocationBytes(tokens: 1024,
            rowBytes: keyRow, allocatedBytes: 4096 * keyRow)
        c.equal("main growth charges complete replacement", mainGrowth, 2048 * keyRow)
        c.equal("draft can reuse its own spare rows", draftSpare, 0)
        c.equal("draft spare does not offset main growth", mainGrowth + draftSpare, 2048 * keyRow)
        c.equal("matching buffer reuses existing capacity", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1024, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 0)
        c.equal("absent pooled indexer needs its own allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1025, rowBytes: 256, allocatedBytes: 0, step: 256), 1280 * 256)
        c.equal("compact raw growth preserves its 256-row step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 304, rowBytes: 256, allocatedBytes: 256 * 256, step: 256), 512 * 256)
        c.equal("compact tail copy is a new allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 32, rowBytes: 256, allocatedBytes: 0, step: 256), 256 * 256)
        c.equal("provisional batch crosses the next allocation step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1023 + 1 + 16, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 2048 * keyRow)
        c.equal("checkpoint copy cannot spend shared backing", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1000, rowBytes: keyRow, allocatedBytes: 0), 1024 * keyRow)
        c.equal("invalid allocation geometry refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: Int.max, rowBytes: keyRow, allocatedBytes: 0), Int.max)
        c.equal("negative owned byte count refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1, rowBytes: keyRow, allocatedBytes: -1), Int.max)
        for room in 0 ... 18 {
            let depth = ContextPolicy.maximumDraftDepth(requested: 16, at: 65536 - room, limit: 65536)
            c.equal("provisional context bounds draft depth/\(room)", depth, min(16, max(0, room - 1)))
            if room > 0 { c.expect("pending plus drafts remain inside context/\(room)", 1 + depth <= room) }
        }
        c.equal("Hermes transient anchor remains fixed", ContextMemoryLedger.transientReserveBytes(context: 65536), 905_969_664)
        c.equal("default has no extra reserve", ContextMemoryLedger.transientReserveBytes(context: 32768), 0)
        // Concurrent requests see one unchanged injected reading. Atomic
        // reservations, not real large allocations, decide how many fit.
        let reservations = RequestMemoryReservations()
        let resultLock = NSLock()
        var accepted: [RequestController] = []
        var refusals = 0
        let reservationPolicy = try ContextConfiguration(maxPrefillWaitMinutes: 0)
        DispatchQueue.concurrentPerform(iterations: 8) { _ in
            let control = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000,
                availableGB: { 0.010 })
            do {
                try control.attachReservations(reservations)
                try control.reservePreparedImageBytes(4_000_000)
                resultLock.withLock { accepted.append(control) }
            } catch { resultLock.withLock { refusals += 1 } }
        }
        c.equal("concurrent preparations cannot spend the same headroom", accepted.count, 2)
        c.equal("excess concurrent preparations refuse before allocation", refusals, 6)
        c.equal("queued decoded pixels remain reserved", reservations.reservedBytes, 8_000_000)
        if let active = accepted.first {
            do { try active.check(nextAllocationBytes: 3_000_000, phase: "test active generation") } catch {}
            c.equal("generation cannot spend queued preparation ownership", active.failure?.code, .insufficientMemory)
            c.equal("failed dispatch preserves retained-pixel reservations", reservations.reservedBytes, 8_000_000)
        }
        var retainedPreparation: RequestController? = accepted.popLast()
        accepted.removeAll()
        c.equal("prepared-image owner keeps its lease after request queue release", reservations.reservedBytes, 4_000_000)
        withExtendedLifetime(retainedPreparation) {}
        retainedPreparation = nil
        c.equal("last preparation owner releases its exact reservation", reservations.reservedBytes, 0)
        do {
            let fresh = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000, availableGB: { 0.010 })
            try fresh.attachReservations(reservations)
            try fresh.checkInputBytes(100_000)
            try fresh.checkInputBytes(1)
            c.equal("shorter later input check cannot release retained copies", reservations.reservedBytes, 1_600_000)
            try fresh.check(nextAllocationBytes: 4_000_000, phase: "test dispatch")
            c.equal("prepared and pending dispatch bytes are separately reserved", reservations.reservedBytes, 5_600_000)
            fresh.releaseDispatchReservation()
            c.equal("completed dispatch releases only transient ownership", reservations.reservedBytes, 1_600_000)
        }
        c.equal("request completion returns all reservations", reservations.reservedBytes, 0)
        // Optional workspace selection must not turn a feasible ordinary
        // request into a sticky refusal, or spend another request's lease.
        for shared in [false, true] {
            let label = "allocation choice/shared=\(shared)"
            let pool = RequestMemoryReservations()
            var room = 0.010
            var control: RequestController? = RequestController(configuration: reservationPolicy,
                slackBytes: 1_000_000, availableGB: { room })
            if shared { try control!.attachReservations(pool) }
            let preferred = try control!.chooseAllocation(preferredBytes: 8_000_000,
                fallbackBytes: 2_000_000, phase: label)
            c.expect("\(label): selects the fitting preferred path", preferred)
            c.equal("\(label): charges only selected dispatch", pool.reservedBytes, shared ? 8_000_000 : 0)
            room = 0.006
            let fallback = try control!.chooseAllocation(preferredBytes: 8_000_000,
                fallbackBytes: 2_000_000, phase: label)
            c.expect("\(label): keeps a feasible ordinary path", !fallback)
            c.equal("\(label): preferred refusal is not sticky", control!.failure, nil)
            c.equal("\(label): replaces rather than adds dispatch ownership", pool.reservedBytes, shared ? 2_000_000 : 0)
            room = 0.010
            let recovered = try control!.chooseAllocation(preferredBytes: 8_000_000,
                fallbackBytes: 2_000_000, phase: label)
            c.expect("\(label): later headroom can select the preferred path", recovered)
            room = 0.002
            do {
                _ = try control!.chooseAllocation(preferredBytes: 8_000_000,
                    fallbackBytes: 2_000_000, phase: label)
                c.expect("\(label): both infeasible paths must refuse", false)
            } catch let error as RequestFailure {
                c.equal("\(label): typed fallback refusal", error.code, .insufficientMemory)
                c.equal("\(label): reports minimum required bytes with slack", error.requiredBytes, 3_000_000)
            }
            c.equal("\(label): failed choice preserves prior ownership", pool.reservedBytes, shared ? 8_000_000 : 0)
            control = nil
            c.equal("\(label): completion releases every lease", pool.reservedBytes, 0)
        }
        do {
            let pool = RequestMemoryReservations()
            var queued: RequestController? = RequestController(configuration: reservationPolicy,
                slackBytes: 1_000_000, availableGB: { 0.013 })
            var active: RequestController? = RequestController(configuration: reservationPolicy,
                slackBytes: 1_000_000, availableGB: { 0.013 })
            try queued!.attachReservations(pool); try active!.attachReservations(pool)
            try queued!.reservePreparedImageBytes(4_000_000)
            try active!.reservePreparedImageBytes(2_000_000)
            let selected = try active!.chooseAllocation(preferredBytes: 8_000_000,
                fallbackBytes: 4_000_000, phase: "queued preparation choice")
            c.expect("optional workspace cannot spend queued or own preparation", !selected)
            c.equal("selected dispatch preserves both preparation owners", pool.reservedBytes, 10_000_000)
            active!.releaseDispatchReservation()
            c.equal("choice release preserves all retained preparation", pool.reservedBytes, 6_000_000)
            active = nil
            c.equal("active completion preserves the queued owner", pool.reservedBytes, 4_000_000)
            queued = nil
            c.equal("all choice and preparation owners release", pool.reservedBytes, 0)
        }
        do {
            let pool = RequestMemoryReservations(), lock = NSLock()
            var controls: [RequestController] = [], choices: [Bool] = [], errors = 0
            DispatchQueue.concurrentPerform(iterations: 2) { _ in
                let control = RequestController(configuration: reservationPolicy,
                    slackBytes: 1_000_000, availableGB: { 0.013 })
                do {
                    try control.attachReservations(pool)
                    let choice = try control.chooseAllocation(preferredBytes: 8_000_000,
                        fallbackBytes: 4_000_000, phase: "concurrent workspace choice")
                    lock.withLock { controls.append(control); choices.append(choice) }
                } catch { lock.withLock { errors += 1 } }
            }
            c.equal("concurrent optional choices both complete", errors, 0)
            c.equal("exactly one preferred workspace owns the available room", choices.filter { $0 }.count, 1)
            c.equal("the other concurrent request atomically selects its fallback", choices.filter { !$0 }.count, 1)
            c.equal("concurrent selection cannot double-spend room", pool.reservedBytes, 12_000_000)
            controls.removeAll()
            c.equal("concurrent choices leave no reservation leak", pool.reservedBytes, 0)
        }
        for shared in [false, true] {
            let pool = RequestMemoryReservations()
            let control = RequestController(configuration: reservationPolicy,
                slackBytes: 1_000_000, availableGB: { 0.010 })
            if shared { try control.attachReservations(pool) }
            let overflow = try control.chooseAllocation(preferredBytes: Int.max,
                fallbackBytes: 2_000_000, phase: "overflowing optional workspace")
            c.expect("overflowing optional size selects finite fallback/\(shared)", !overflow)
            c.equal("optional overflow does not poison request/\(shared)", control.failure, nil)
            for (preferred, fallback) in [(-1, 0), (1, -1), (1, 2)] {
                let invalid = RequestController(configuration: reservationPolicy,
                    slackBytes: 0, availableGB: { 1 })
                if shared { try invalid.attachReservations(pool) }
                do {
                    _ = try invalid.chooseAllocation(preferredBytes: preferred, fallbackBytes: fallback,
                        phase: "invalid choice geometry")
                    c.expect("invalid allocation choice refuses/\(shared)/\(preferred)/\(fallback)", false)
                } catch let error as RequestFailure {
                    c.equal("invalid allocation choice is typed/\(shared)/\(preferred)/\(fallback)", error.code, .invalidConfiguration)
                }
            }
            do {
                _ = try control.chooseAllocation(preferredBytes: Int.max, fallbackBytes: Int.max,
                    phase: "both choices overflow")
                c.expect("overflowing fallback refuses/\(shared)", false)
            } catch let error as RequestFailure {
                c.equal("overflowing fallback is typed/\(shared)", error.code, .insufficientMemory)
            }
        }
        let unreadableChoices: [Double?] = [nil, .nan, .infinity, -1]
        for reading in unreadableChoices {
            let standalone = RequestController(configuration: reservationPolicy,
                slackBytes: 0, availableGB: { reading })
            let choice = try standalone.chooseAllocation(preferredBytes: 8, fallbackBytes: 4,
                phase: "unreadable optional allocation")
            c.expect("unreadable memory never authorizes an optional workspace/\(String(describing: reading))", !choice)
            let shared = RequestController(configuration: reservationPolicy,
                slackBytes: 0, availableGB: { reading })
            try shared.attachReservations(RequestMemoryReservations())
            do {
                _ = try shared.chooseAllocation(preferredBytes: 8, fallbackBytes: 4,
                    phase: "unreadable shared allocation")
                c.expect("unreadable shared budget refuses", false)
            } catch let error as RequestFailure {
                c.equal("unreadable shared budget remains fail closed", error.code, .insufficientMemory)
            }
        }
        do {
            let long = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536,
                maxPrefillWaitMinutes: 0), slackBytes: 0, availableGB: { nil })
            do {
                _ = try long.chooseAllocation(preferredBytes: 8, fallbackBytes: 4, phase: "unknown long context")
                c.expect("unknown long-context fallback must refuse", false)
            } catch let error as RequestFailure {
                c.equal("long-context fallback preserves stricter admission", error.code, .insufficientMemory)
            }
            var tick: UInt64 = 0
            let expired = RequestController(configuration: try ContextConfiguration(maxPrefillWaitMinutes: 1),
                slackBytes: 0, clock: { tick }, availableGB: { 1 })
            tick = 60_000_000_000
            let disconnected = RequestController(configuration: reservationPolicy, slackBytes: 0,
                availableGB: { 1 }, connected: { false })
            let pressured = RequestController(configuration: reservationPolicy, slackBytes: 0,
                availableGB: { 1 }, pressure: { true })
            for (control, code) in [(expired, RequestFailure.Code.prefillDeadlineExceeded),
                                     (disconnected, .clientCancelled), (pressured, .insufficientMemory)] {
                do {
                    _ = try control.chooseAllocation(preferredBytes: 8, fallbackBytes: 4, phase: "terminal guard choice")
                    c.expect("allocation selection cannot bypass \(code)", false)
                } catch let error as RequestFailure {
                    c.equal("selection preserves terminal guard/\(code)", error.code, code)
                }
            }
        }
        // Grouping may change read reuse, never the numerical compute
        // schedule. Check real planner ceilings, partial tails, cached offsets,
        // context-boundary reductions and the exact model limit.
        for ceiling in [256, 512, 1024, 2048, 4096] {
            for position in [0, 1, 255, 256, 257, 8192, 32768, 65536, 127744, 128000, 261120] {
                for requested in [1, 255, 256, 257, 767, 768, 1023, 1024, 1025, 2048, 2051, 4096, 8192] {
                    let remaining = min(requested, ContextPolicy.modelLimit - position)
                    let checkpoints: [Int?] = [nil, 256, position + 256]
                    for checkpoint in checkpoints {
                        if let grouped = PrefillSchedule.automaticScopePasses(remaining: remaining, at: position,
                            maxChunk: ceiling, checkpoint: checkpoint) {
                            var at = position, left = remaining
                            var identical = true
                            for pass in grouped {
                                let ordinary = PrefillSchedule.next(remaining: left, at: at,
                                    maxChunk: ceiling, tailAware: false)
                                identical = identical && pass == ordinary
                                at += pass; left -= pass
                            }
                            c.expect("automatic group preserves every ordinary shape/\(ceiling)/\(position)/\(remaining)/\(String(describing: checkpoint))",
                                identical && grouped.count >= 4 && grouped.reduce(0, +) <= 4096
                                    && grouped.allSatisfy { [256, 512, 1024].contains($0) && PrefillSchedule.fits($0, at: at - $0) })
                            if let checkpoint, checkpoint > position, checkpoint <= at {
                                let ordinaryEnds = PrefillSchedule.computePasses(tokens: at - position,
                                    from: position, maxChunk: ceiling).map { $0.keyExtent }
                                // Only scheduled boundaries are retainable; an
                                // arbitrary interior checkpoint is not a new shape.
                                c.expect("automatic scope retains a scheduled checkpoint/\(ceiling)/\(position)/\(remaining)/\(checkpoint)",
                                    !ordinaryEnds.contains(checkpoint) || checkpoint == at)
                            }
                        }
                    }
                }
            }
        }
        for count in [1, 255, 256, 257, 767, 768, 1023] {
            c.equal("short prompt keeps chronological dispatch/\(count)",
                PrefillSchedule.automaticScopePasses(remaining: count, at: 0, maxChunk: 256, checkpoint: nil), nil)
        }
        c.equal("1024-row automatic threshold keeps four original passes",
            PrefillSchedule.automaticScopePasses(remaining: 1024, at: 0, maxChunk: 256, checkpoint: nil), [256, 256, 256, 256])
        c.equal("cold common-prefix checkpoint precedes read grouping",
            PrefillSchedule.automaticScopePasses(remaining: 4096, at: 0, maxChunk: 256, checkpoint: 256), nil)
        c.equal("cached prefix permits remaining whole passes",
            PrefillSchedule.automaticScopePasses(remaining: 1280, at: 256, maxChunk: 256, checkpoint: 256), Array(repeating: 256, count: 5))
        c.equal("512-row planner preserves its own arithmetic",
            PrefillSchedule.automaticScopePasses(remaining: 4096, at: 0, maxChunk: 512, checkpoint: nil), Array(repeating: 512, count: 8))
        c.equal("1024-row planner preserves its own arithmetic",
            PrefillSchedule.automaticScopePasses(remaining: 4096, at: 0, maxChunk: 1024, checkpoint: nil), Array(repeating: 1024, count: 4))
        for ceiling in [2048, 4096] {
            c.equal("no speculative benefit from too few large passes/\(ceiling)",
                PrefillSchedule.automaticScopePasses(remaining: 8192, at: 0, maxChunk: ceiling, checkpoint: nil), nil)
        }
        for args in [(-1, 0, 256), (Int.max, 0, 256), (1024, -1, 256), (1024, ContextPolicy.modelLimit, 256),
                     (1024, 0, 0), (1024, 0, 4097)] {
            c.equal("invalid automatic geometry refuses/\(args)", PrefillSchedule.automaticScopePasses(
                remaining: args.0, at: args.1, maxChunk: args.2, checkpoint: nil), nil)
        }
        c.expect("optional scope fits the exact process boundary", ContextWorkspace.fitsAutomaticScope(
            footprintBytes: 7_000_000_000, allocationBytes: 3_000_000_000, limitBytes: 10_000_000_000))
        c.expect("one excess byte keeps the ordinary path", !ContextWorkspace.fitsAutomaticScope(
            footprintBytes: 7_000_000_001, allocationBytes: 3_000_000_000, limitBytes: 10_000_000_000))
        c.expect("ordinary unsigned Mach footprint converts without truncation", ContextWorkspace.fitsAutomaticScope(
            footprintBytes: Int(clamping: UInt64(7_000_000_000)), allocationBytes: 3_000_000_000,
            limitBytes: 10_000_000_000))
        c.expect("unrepresentable Mach footprint cannot authorize an optional workspace", !ContextWorkspace.fitsAutomaticScope(
            footprintBytes: Int(clamping: UInt64.max), allocationBytes: 1, limitBytes: nil))
        for args in [(0, 1, 10), (-1, 1, 10), (1, -1, 10), (1, Int.max, Int.max), (Int.max - 1, 2, Int.max), (1, 1, 0)] {
            c.expect("invalid optional process budget refuses/\(args)", !ContextWorkspace.fitsAutomaticScope(
                footprintBytes: args.0, allocationBytes: args.1, limitBytes: args.2))
        }
        for cap in caps {
            for target in [8.1, 10, 16, 24, 33] {
                for mtp in [Planner.MTPMode.off, .on, .auto] {
                    do {
                        let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44,
                            mtp: mtp, mtpAvailable: true, vision: .off, maxContextTokens: cap,
                            simulated: true, qualification: true)
                        c.expect("fit \(cap)/\(target)/\(mtp)", p.memoryLedger.expectedPeakBytes <= Int(target * 1e9))
                        c.equal("preserve window \(cap)/\(target)/\(mtp)", p.maxContextTokens, cap)
                        if mtp == .on { c.expect("forced MTP stays on \(cap)/\(target)", p.mtpEnabled) }
                    } catch {
                        c.expect("bounded refusal \(cap)/\(target)/\(mtp)", !String(describing: error).isEmpty)
                    }
                }
            }
        }
        let baseline = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off, simulated: true)
        let small = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off,
            maxContextTokens: 1024, simulated: true)
        c.expect("short cap refunds retention instead of reserving 32K", small.prefixCacheTokens <= 1024 && small.slots > baseline.slots)
        let machine = Machine.simulated(ramGB: 51.5, workingSetGB: 40.2, availableGB: 44)
        for target in [8.1, 10, 16, 24, 33] {
            let request = PlanRequest(memoryGB: target, mtp: .off, vision: .off, maxContextTokens: ContextPolicy.modelLimit)
            let result = Planner.contextFeasibility(request, on: machine, qualification: true)
            c.expect("solver maximum accepted at \(target)", result.maximumPlan != nil)
            if result.maximumFeasibleWindow < ContextPolicy.modelLimit {
                let next = result.maximumFeasibleWindow + 1
                let p = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: next, simulated: true, qualification: true)
                c.expect("next solver token refused at \(target)", p == nil)
            }
        }
        for chunk in [64, 128, 256, 512, 1024, 2048, 4096] {
            for start in [0, 1, 32768, 65535, 128255, 128256, 128257, 131071, 262079, 262143] {
                let count = ContextPolicy.modelLimit - start
                var position = start
                let passes = PrefillSchedule.passes(tokens: count, from: start, maxChunk: chunk)
                var bounded = !passes.isEmpty
                for n in passes {
                    // Ordinary scheduling has always clamped small batch
                    // overrides up to 256. The 64-row floor applies only
                    // after the 256-row query/key product no longer fits.
                    let floor = 256 * (position + 256) <= 4096 * 8016 ? 256 : 64
                    bounded = bounded && n > 0 && n <= max(floor, chunk)
                        && n * (position + n) <= 4096 * 8016
                    position += n
                }
                c.expect("bounded schedule \(chunk) from \(start)", bounded && position == ContextPolicy.modelLimit)
            }
        }
        c.expect("overflowing schedule is refused", PrefillSchedule.passes(tokens: Int.max, from: Int.max, maxChunk: 4096).isEmpty)
        c.expect("uncalibrated late schedule is unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
        c.expect("Hermes schedule retains an estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)
        let oddLate = PrefillSchedule.computePasses(tokens: 512, from: 200000, maxChunk: 4095)
        c.equal("diagnostic odd late schedule matches the canonical runtime shape", oddLate.map(\.tokens), Array(repeating: 64, count: 8))
        c.equal("diagnostic includes masked canonical columns", oddLate.map(\.keyExtent),
            Array(repeating: 200256, count: 4) + Array(repeating: 200512, count: 4))
        c.expect("diagnostic includes physical query rows", oddLate.allSatisfy { $0.queryRows == 64 })
        let paddedTail = PrefillSchedule.computePasses(tokens: 449, from: 200000, maxChunk: 4095)
        c.equal("diagnostic tail reports its padded query geometry", paddedTail.last?.queryRows, 64)
        c.equal("diagnostic tail preserves its one logical token", paddedTail.last?.tokens, 1)

        var tick: UInt64 = 0
        var available = 10.0
        var connected = true
        var pressure = false
        func controller(wait: Double = 1, cap: Int = 65536) throws -> RequestController {
            try RequestController(configuration: ContextConfiguration(maxContextTokens: cap, maxPrefillWaitMinutes: wait),
                slackBytes: 1_500_000_000, clock: { tick }, availableGB: { available },
                connected: { connected }, pressure: { pressure })
        }
        for invalid in [Double.nan, .infinity, -.infinity, -1, Double.greatestFiniteMagnitude] {
            c.expect("invalid duration \(invalid) refused", (try? ContextConfiguration(maxPrefillWaitMinutes: invalid)) == nil)
        }
        let estimated = try controller()
        do { try estimated.admit(missingTokens: 32768, from: 0, maxChunk: 256) } catch {}
        c.equal("cold estimate refuses before prefill", estimated.failure?.code, .prefillWaitExceeded)
        let reused = try controller()
        try reused.admit(missingTokens: 32, from: 64000, maxChunk: 4096)
        c.expect("fast continuation admits from its real position", reused.failure == nil)
        tick = 61_000_000_000
        do { try reused.check(phase: "image preparation") } catch {}
        c.equal("elapsed preparation still trips deadline", reused.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let queue = try controller()
        tick = 61_000_000_000
        do { try queue.check(phase: "queue") } catch {}
        c.equal("queue uses same clock", queue.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let decoding = try controller()
        decoding.sampledFirstToken(); tick = 61_000_000_000
        try decoding.check(phase: "decode")
        c.expect("decode does not inherit the prefill deadline", decoding.failure == nil)
        let timeless = try controller(wait: 0)
        tick += 100_000_000_000; try timeless.check()
        available = 1
        do { try timeless.check(nextAllocationBytes: 1) } catch {}
        c.equal("zero time policy retains memory guard", timeless.failure?.code, .insufficientMemory)
        available = 3
        let growth = try controller(wait: 0)
        do { try growth.check(nextAllocationBytes: 2_000_000_000) } catch {}
        c.equal("next allocation is charged before it starts", growth.failure?.code, .insufficientMemory)
        available = 10; pressure = true
        let pressed = try controller(wait: 0)
        do { try pressed.check() } catch {}
        c.equal("pressure is independent of time", pressed.failure?.code, .insufficientMemory)
        pressure = false; connected = false
        let cancelled = try controller()
        do { try cancelled.check() } catch {}
        c.equal("disconnect is typed cancellation", cancelled.failure?.code, .clientCancelled)
        c.expect("failed request cannot retain state", !cancelled.mayRetainState)
        let unknown = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536),
            slackBytes: 1_500_000_000, availableGB: { nil })
        do { try unknown.check(nextAllocationBytes: 1) } catch {}
        c.equal("unknown memory refuses long-state growth", unknown.failure?.code, .insufficientMemory)
        var governor = GovernorPolicy.Inputs(currentSlots: 2000, availableGB: 4, ramGB: 51.5,
            workingSetGB: 40.2, maxContextTokens: 65536)
        let empty = GovernorPolicy.desiredPlan(governor)
        governor.ownedAdditionalBytes = 1_000_000_000
        let owned = GovernorPolicy.desiredPlan(governor)
        c.expect("owned memory changes replan credit", (owned?.targetGB ?? 0) > (empty?.targetGB ?? 0))
        c.equal("request cap survives ownership credit", owned?.maxContextTokens, 65536)
        governor.availableGB = 0; governor.currentSlots = Geometry.floorSlots
        governor.maxContextTokens = ContextPolicy.modelLimit; governor.contextQualification = true
        governor.ownedAdditionalBytes = 0
        c.expect("infeasible governor plan is explicit", GovernorPolicy.desiredPlan(governor) == nil)
        for cap in [1, 1024, ContextPolicy.defaultTokens, ContextPolicy.mtpLimit] {
            for mtp in [false, true] {
                let exhausted = GovernorPolicy.Inputs(currentSlots: Geometry.floorSlots,
                    availableGB: 0, ramGB: 51.5, workingSetGB: 40.2,
                    mtpEnabled: mtp, maxContextTokens: cap)
                c.expect("ordinary startup advisory cannot authorize live work/\(cap)/\(mtp)",
                    GovernorPolicy.desiredPlan(exhausted) == nil)
                c.equal("infeasible floor does not invent a smaller arena/\(cap)/\(mtp)",
                    GovernorPolicy.decide(exhausted), .hold)
                var recovered = exhausted
                recovered.availableGB = 10
                if let plan = GovernorPolicy.desiredPlan(recovered) {
                    let physical = min(recovered.workingSetGB, recovered.availableGB
                        + Geometry.gb(recovered.currentSlots) + Planner.fixedFootprintGB
                        + (mtp ? Planner.mtpResidentGB : 0)
                        - Planner.availabilitySlackGB(ramGB: recovered.ramGB))
                    c.expect("recovery fits its credited physical budget/\(cap)/\(mtp)",
                        Double(plan.memoryLedger.expectedPeakBytes) <= physical * 1e9)
                    c.equal("feasible recovery preserves required head/\(cap)/\(mtp)", plan.mtpEnabled, mtp)
                } else {
                    c.expect("ordinary context has a feasible pure recovery/\(cap)/\(mtp)", false)
                }
            }
        }
        c.equal("overflowing public ledger saturates to refusal", ContextMemoryLedger(slots: Int.max,
            context: Int.max, chunk: Int.max, retentionTokens: Int.max, mtp: true, visionResident: true).expectedPeakBytes, Int.max)
        func expertWorkspace(_ tokens: Int = 4096, tile: Int = 1024,
                             batch: Int = 32, pool: Int = 0, admissions: Int = 0,
                             record: Int = 2_764_800) -> Int {
            ContextWorkspace.expertWorkspaceBytes(tokens: tokens, tile: tile, experts: 512,
                topK: 10, hidden: 2560, intermediate: 640, recordBytes: record,
                loadBatch: batch, admissionPoolBytes: pool, admissionRecords: admissions)
        }
        c.expect("scope admission prices old and replacement expert storage",
            expertWorkspace() >= 2 * 512 * 2_764_800 + 32 * 2_764_800)
        c.expect("scope staging override cannot hide a whole-layer upload",
            expertWorkspace(batch: 512) > expertWorkspace(batch: 32))
        c.expect("scope admission prices decode-pool replacement",
            expertWorkspace(pool: 1217 * 2_764_800, admissions: 25) > expertWorkspace())
        c.expect("large routed tile increases allocation reservation",
            expertWorkspace(tile: 4096) > expertWorkspace(tile: 1024))
        c.expect("merged routed tail cannot reduce allocation reservation",
            expertWorkspace(1279, tile: 1024) >= expertWorkspace(1024, tile: 1024))
        c.expect("retained scope outputs are charged beyond one compute tile",
            expertWorkspace(8192) > expertWorkspace(4096))
        c.equal("scope record overflow refuses before dispatch", expertWorkspace(record: Int.max), Int.max)
        c.equal("invalid scope tile refuses before dispatch", expertWorkspace(tile: 0), Int.max)
        c.equal("invalid scope staging refuses before dispatch", expertWorkspace(batch: 513), Int.max)
        c.equal("negative scope pool refuses before dispatch", expertWorkspace(pool: -1), Int.max)
        c.equal("scope admission requires an actual pool allocation", expertWorkspace(admissions: 1), Int.max)
        c.equal("invalid scope extent refuses before dispatch", expertWorkspace(0), Int.max)
        c.expect("grouped matmul expert padding is charged for a small route set",
            ContextWorkspace.expertWorkspaceBytes(tokens: 1, tile: 256, experts: 512,
                topK: 1, hidden: 2560, intermediate: 640, recordBytes: 1, loadBatch: 1)
                >= 2048 * (5 * 2560 + 4 * 640) * 4)
        c.equal("scope route geometry rejects more routes than experts",
            ContextWorkspace.expertWorkspaceBytes(tokens: 4096, tile: 1024, experts: 512,
                topK: 513, hidden: 2560, intermediate: 640, recordBytes: 2_764_800,
                loadBatch: 32), Int.max)
        let originalVision = ContextWorkspace.visionBytes(patches: 9216)
        let tiledVision = ContextWorkspace.visionBytes(patches: 9216, queryTile: 256)
        c.expect("vision charge uses actual query bound", originalVision > tiledVision * 4)
        c.equal("unsupported vision mode is refused", ContextWorkspace.visionBytes(patches: 9216, queryTile: 512), Int.max)
        c.expect("late 64 pass retains context-dependent workspace", ContextWorkspace.prefillBytes(pass: 64, context: 262144) > 64 * 1_300_000)
        for override in [1, 64, 128, 256, 257, 511, 513, 1023, 2047, 4095, 4096] {
            for position in [0, 32768, 65535, 65536] {
                c.expect("ordinary window preserves original floor/\(override)/\(position)",
                    PrefillSchedule.chunk(at: position, maxChunk: override) >= 256)
            }
        }
        c.equal("projection shape padding is charged before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 256), 256 * 1_300_000)
        c.equal("invalid projection shape refuses before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 257), Int.max)
        c.equal("unbounded 128 final pass is refused", ContextWorkspace.prefillBytes(pass: 128, context: 262144), Int.max)
        c.equal("small attention domain stops at actual prompt end", ContextWorkspace.keyExtent(pass: 64,
            context: 448, referenceEnd: 470), 470)
        c.equal("small attention domain follows exact prefix origin", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 17, referenceEnd: 515), 273)
        c.equal("invalid reference domain fails closed", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 18, referenceEnd: 515), Int.max)
        c.equal("one-row tail preserves matrix query dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 449, referenceEnd: 449), 64)
        c.equal("canonical one-row terminal keeps vector dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 513, referenceEnd: 513), 1)
        c.equal("one-row tail prices its real key domain", ContextWorkspace.keyExtent(pass: 1,
            context: 449, referenceEnd: 449), 449)
        c.expect("padded tail workspace includes physical queries", ContextWorkspace.prefillBytes(pass: 1,
            context: 262143, referenceEnd: 262144, minimumProjectionRows: 256, padSmallQueries: true)
            >= 64 * 262144 * (24 * 8 + 16))
        for override in [64, 68, 127, 128, 136, 137, 255] {
            c.equal("late odd override selects a qualified full-pass shape/\(override)",
                ContextWorkspace.boundedSmallPass(requested: override, at: 200000,
                    referenceStart: 200000, referenceEnd: 262144), override >= 128 ? 128 : 64)
        }
        for origin in [0, 1, 17, 130001, 131073] {
            var position = max(origin, 256273), total = 0
            while position < ContextPolicy.modelLimit {
                let n = ContextWorkspace.boundedSmallPass(requested: 128, at: position,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                guard n > 0 else { c.expect("small-pass schedule advances/\(origin)", false); break }
                let extent = ContextWorkspace.keyExtent(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                let queries = ContextWorkspace.queryRows(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                c.expect("actual padded product stays bounded/\(origin)/\(position)",
                    queries * extent <= PrefillSchedule.measuredQueryKeyProduct)
                c.expect("small pass never crosses its reference domain/\(origin)/\(position)",
                    n <= 256 - ((position - origin) % 256))
                position += n; total += n
            }
            c.equal("small-pass schedule closes/\(origin)", total, ContextPolicy.modelLimit - max(origin, 256273))
        }
        let busy = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
            on: Machine.simulated(ramGB: 16, workingSetGB: 12, availableGB: 5))
        c.equal("busy machine never calls an unphysical window feasible", busy.maximumFeasibleWindow, 0)
        for prefix in [false, true] {
            let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
            let result = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
                on: machine, runtimePolicy: policy, qualification: true)
            c.expect("solver freezes actual retention policy \(prefix)", result.maximumPlan?.runtimeAllocationPolicy == policy)
            if let maximum = result.maximumPlan, maximum.maxContextTokens < ContextPolicy.modelLimit {
                let next = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: maximum.maxContextTokens + 1,
                    simulated: true, qualification: true, runtimePolicy: policy)
                c.expect("same-policy next token fails \(prefix)", next == nil)
            }
        }
        c.expect("negative scope start is refused", PrefillSchedule.scopePasses(remaining: 10,
            at: -1, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        c.expect("overflowing scope is refused", PrefillSchedule.scopePasses(remaining: Int.max,
            at: 262140, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        let inputGuard = RequestController(configuration: try ContextConfiguration(), slackBytes: 0, availableGB: { 10 })
        do { try inputGuard.check(nextAllocationBytes: -1) } catch {}
        c.equal("negative public allocation cannot bypass guard", inputGuard.failure?.code, .invalidConfiguration)
        c.equal("negative public workspace scope refuses safely", ContextWorkspace.prefillBytes(pass: 64, context: 1024, scope: Int.min), Int.max)
        var nested = JSONValue.string("payload")
        for _ in 0 ..< 64 { nested = .array([nested]) }
        c.equal("deep input is bounded before template recursion", ContextInputMemory.bytes(nested), Int.max)
        let tool = ToolDefinition(name: "read", description: "description", parameters: .object(["long": .string(String(repeating: "x", count: 5000))]))
        c.expect("tool schema charged before tokenization", ContextInputMemory.bytes(messages: [], tools: [tool]) >= 5000)
        // Freeze a whole-machine reading, then account for what an existing
        // instance actually owns. A feasible restart and settled governor
        // must agree. The preserved legacy startup floor can also return an
        // advisory that exceeds the physical budget; that is a refusal case,
        // never evidence that the live governor should admit work.
        var governorCaps = Set<Int>()
        var advisoryRefusals = Set<String>()
        for cap in [8192, 32768, 65536, 131072, 262144] {
            for prefix in [false, true] {
                let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
                for mode in [0, 1, 2] where mode == 0 || cap <= 65536 {
                    for whole in [10.0, 12.0, 18.0, 44.0] {
                        let label = "governor \(cap)/prefix=\(prefix)/mode=\(mode)/available=\(whole)"
                        let initial = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: whole,
                            mtp: mode == 1 ? .on : .off, mtpAvailable: mode == 1,
                            vision: mode == 2 ? .on : .off, visionAvailable: mode == 2,
                            visionResidentReserved: mode == 2, maxContextTokens: cap,
                            qualification: true, runtimePolicy: policy)
                        guard let initial else { continue }
                        let additional = ContextGeometry.additionalActiveBytes(tokens: cap, mtp: mode == 1)
                        let held = prefix ? min(initial.prefixCacheTokens, 8192) * PrefixCache.bytesPerToken : 0
                        let owned = additional + held + (held > 0 ? PrefixCache.fixedBytesPerEntry : 0)
                        let physical = whole - initial.poolGB - Planner.fixedFootprintGB
                            - (mode == 1 ? Planner.mtpResidentGB : 0)
                            - (mode == 2 ? Planner.visionResidentGB : 0) - Double(owned) / 1e9
                        guard physical >= 0 else { continue }
                        governorCaps.insert(cap)
                        var input = GovernorPolicy.Inputs(currentSlots: initial.slots, availableGB: physical,
                            ramGB: 51.5, workingSetGB: 40.2, mtpEnabled: mode == 1,
                            visionEnabled: mode == 2, visionResidentReserved: mode == 2,
                            maxContextTokens: cap, runtimeAllocationPolicy: policy,
                            ownedAdditionalBytes: owned, contextQualification: true)
                        let settled = GovernorPolicy.desiredPlan(input)
                        let physicalBudget = min(input.workingSetGB,
                            whole - Planner.availabilitySlackGB(ramGB: input.ramGB))
                        let peak = Double(initial.memoryLedger.expectedPeakBytes)
                        let feasible = peak <= physicalBudget * 1e9
                            && (initial.targetGB.map { peak <= $0 * 1e9 } ?? true)
                        if !feasible {
                            advisoryRefusals.insert("\(cap)/\(prefix)/\(mode)/\(whole)")
                            c.expect("\(label): legacy startup advisory is refused live", settled == nil)
                            let target: Int
                            switch GovernorPolicy.decide(input) {
                            case .hold: target = input.currentSlots
                            case .resize(let slots, _): target = slots
                            }
                            c.equal("\(label): infeasible advisory settles at arena floor", target, Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - target)
                            input.currentSlots = target
                            c.expect("\(label): returning owned pool bytes cannot invent feasibility",
                                GovernorPolicy.desiredPlan(input) == nil)
                            c.equal("\(label): infeasible floor cannot shrink further", GovernorPolicy.decide(input), .hold)
                            continue
                        }
                        c.expect("\(label): same allocation after ownership credit", settled.map { abs($0.slots - initial.slots) <= 1 } ?? false)
                        c.equal("\(label): settled policy holds", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): chunk policy persists", settled?.prefillChunk, 256)
                        c.equal("\(label): mode persists", settled?.mtpEnabled, mode == 1)
                        if !prefix { c.equal("\(label): no retention resurrection", settled?.prefixCacheTokens, 0) }
                        input.pressure = .critical
                        let decision = GovernorPolicy.decide(input)
                        if case .resize(let slots, _) = decision {
                            c.expect("\(label): pressure gives memory back", slots < input.currentSlots && slots >= Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - slots)
                            input.currentSlots = slots
                        }
                        input.pressure = nil; input.secondsSincePressure = 1
                        c.equal("\(label): recovery respects cooldown", GovernorPolicy.decide(input), .hold)
                        input.secondsSincePressure = 61; input.secondsSinceResize = 61
                        if case .resize(let slots, _) = GovernorPolicy.decide(input) {
                            input.availableGB -= Geometry.gb(slots - input.currentSlots)
                            input.currentSlots = slots
                        }
                        c.equal("\(label): one recovery step settles", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): context survives recovery", GovernorPolicy.desiredPlan(input)?.maxContextTokens, cap)
                    }
                }
            }
        }
        c.equal("governor matrix executes every intended cap", governorCaps, Set([8192, 32768, 65536, 131072, 262144]))
        c.equal("governor matrix preserves all four original unphysical advisories", advisoryRefusals,
            Set(["8192/false/0/10.0", "8192/true/0/10.0", "32768/false/0/10.0", "32768/true/0/10.0"]))
        return c.report()
    }
}

````````````

## Artifact SHA-256 c5057f3f6e5b9fa557fb33066b9255ec7e9da00b4060d971539fce10d18fedf8

Encoding: `gzip+base64`. Original bytes: 80213.

````````````text
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
````````````

## Artifact SHA-256 b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2

Encoding: `utf-8`. Original bytes: 20891.

````````````text
// Process and cache safety invariants that are otherwise only observable
// during a 100+ GB model run. Weights-free on purpose: these are the rules a
// long run depends on, checked in milliseconds on every push.

import Foundation
import Slotstream

extension Diagnostics {
    public static func runtime() throws -> CheckReport {
        var c = CheckBuilder("runtime-check")

        if let before = ProcessMemory.vmActivity(), let after = ProcessMemory.vmActivity() {
            c.expect("request VM counters are monotonic", after.swapins >= before.swapins && after.swapouts >= before.swapouts)
            c.expect("request VM reclaimable bytes are available", before.reclaimableBytes > 0)
        } else { c.expect("request VM counters are available", false) }
        c.expect("process physical footprint is readable", ProcessMemory.residentBytes() > 0)
        c.expect("process RSS high-water is readable", ProcessMemory.peakResidentBytes() > 0)
        c.expect("lifetime RSS is separately readable", ProcessMemory.lifetimeRSSPeakBytes() > 0)
        let start = RuntimeClock.now()
        c.expect("monotonic duration is nonnegative", RuntimeClock.seconds(since: start) >= 0)
        let sampler = FootprintSampler()
        let observed = sampler.finish()
        c.expect("footprint sampler includes endpoints", observed.samples >= 2 && observed.peakBytes > 0)
        c.equal("automatic platform-qualified optimization defaults",
            try InferenceOptimizations.environment([:]), InferenceOptimizations.deploymentCandidate())
        let qualified = OptimizationPlatform(machineModel: "Mac17,9", chip: "Apple M5 Pro",
            osBuild: "25G83", nativeARM64: true)
        c.equal("qualified platform keeps the complete joint candidate",
            InferenceOptimizations.deploymentCandidate(on: qualified), .integrationCandidate)
        var fallback = InferenceOptimizations.integrationCandidate
        fallback.fusedRoPE = false
        let unknownPlatforms: [OptimizationPlatform] = [
            .init(machineModel: nil, chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: nil, osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: nil, nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: false),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "23A344", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "24A335", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G84", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "26A1", nativeARM64: true),
            .init(machineModel: "Mac14,6", chip: "Apple M2 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,10", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro extra", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "", chip: "", osBuild: "", nativeARM64: true),
        ]
        for (i, platform) in unknownPlatforms.enumerated() {
            c.equal("unqualified platform \(i) keeps portable work and original rotation",
                InferenceOptimizations.deploymentCandidate(on: platform), fallback)
        }
        c.equal("platform selection is deterministic", OptimizationPlatform.current, OptimizationPlatform.current)
        c.expect("explicit kernel qualification remains available",
            try InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "1"]).fusedRoPE)
        c.expect("explicit kernel fallback remains available",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "0"]).fusedRoPE)
        let legacyOptions = try JSONEncoder().encode(InferenceOptimizations())
        let legacyObject = try JSONSerialization.jsonObject(with: legacyOptions) as! [String: Any]
        c.expect("reference control encoding omits unset automatic policy", legacyObject["automaticReadScope"] == nil)
        c.equal("old control JSON remains decodable", try JSONDecoder().decode(InferenceOptimizations.self,
            from: legacyOptions), InferenceOptimizations())
        var automatic = InferenceOptimizations.integrationCandidate
        automatic.automaticReadScope = true
        c.equal("automatic policy survives saved control round trip", try JSONDecoder().decode(InferenceOptimizations.self,
            from: JSONEncoder().encode(automatic)), automatic)
        c.equal("absent overrides preserve an inherited automatic policy",
            try InferenceOptimizations.resolving(environment: [:], defaults: automatic), automatic)
        var noAutomatic = automatic; noAutomatic.automaticReadScope = nil
        c.equal("explicit automatic zero restores the chronological policy",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_AUTO_READ_SCOPE": "0"], defaults: automatic), noAutomatic)
        c.equal("explicit automatic one enables only that policy",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_AUTO_READ_SCOPE": "1"], defaults: noAutomatic), automatic)
        for (name, value) in [("SLOTSTREAM_OPT_READ_SCOPE", "0"), ("SLOTSTREAM_OPT_LAYER_WORKSPACE", "0"),
                              ("SLOTSTREAM_OPT_INDEXER_TILES", "0"), ("SLOTSTREAM_OPT_PLE_TILES", "0"),
                              ("SLOTSTREAM_OPT_WORKSPACE_TILE", "256"), ("SLOTSTREAM_OPT_SCOPE_FRONTIER", "0"),
                              ("SLOTSTREAM_OPT_WORKSPACE_PIECES", "0")] {
            c.equal("manual scope control suppresses inherited automatic policy/\(name)",
                try InferenceOptimizations.resolving(environment: [name: value], defaults: automatic), noAutomatic)
        }
        for value in ["true", "-1", "2", ""] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_AUTO_READ_SCOPE": value])
                c.expect("malformed automatic policy must refuse/\(value)", false)
            } catch { c.expect("malformed automatic policy refuses/\(value)", true) }
        }
        let candidate = InferenceOptimizations.integrationCandidate
        c.expect("combined candidate preserves the original MTP verification shape",
            !candidate.boundedDraftTail)
        c.equal("absent overrides retain the selected default family",
            try InferenceOptimizations.resolving(environment: [:], defaults: candidate), candidate)
        let candidateFlags: [(String, WritableKeyPath<InferenceOptimizations, Bool>)] = [
            ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
            ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
            ("SLOTSTREAM_OPT_NGRAM_ROWS", \.compactNgramRows),
            ("SLOTSTREAM_OPT_FINAL_FORWARD", \.skipUnusedFinalForward),
            ("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", \.valueOnlySamplerThreshold),
            ("SLOTSTREAM_OPT_SAMPLER_DRAW", \.deviceSamplerDraw),
            ("SLOTSTREAM_OPT_OUTPUT_QUEUE", \.boundedOutputQueue),
            ("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", \.responsiveGovernor),
            ("SLOTSTREAM_OPT_COMPLETE_PROMPT", \.completePromptCheckpoint),
            ("SLOTSTREAM_OPT_SHARED_ROPE", \.sharedRoPE),
            ("SLOTSTREAM_OPT_FUSED_ROPE", \.fusedRoPE),
        ]
        for (name, field) in candidateFlags {
            var disabled = candidate
            disabled[keyPath: field] = false
            c.equal("explicit zero disables only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "0"], defaults: candidate), disabled)
            c.equal("explicit one restores only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "1"], defaults: disabled), candidate)
        }
        var referenceOverrides = Dictionary(uniqueKeysWithValues: candidateFlags.map { ($0.0, "0") })
        referenceOverrides["SLOTSTREAM_OPT_PREFIX_CHECKPOINT"] = "0"
        c.equal("explicit zeros restore the complete reference inference family",
            try InferenceOptimizations.resolving(environment: referenceOverrides, defaults: candidate),
            InferenceOptimizations())
        var noCheckpoint = candidate
        noCheckpoint.prefixCheckpointTokens = 0
        c.equal("explicit numeric zero disables inherited prefix retention",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0"],
                defaults: candidate), noCheckpoint)
        c.equal("non-optimization environment leaves the family intact",
            try InferenceOptimizations.resolving(environment: ["PATH": "/unused"], defaults: candidate), candidate)
        for env in [["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"], ["SLOTSTREAM_OPT_TYPO": "0"]] {
            do {
                _ = try InferenceOptimizations.resolving(environment: env, defaults: candidate)
                c.expect("selected defaults still reject invalid override \(env)", false)
            } catch { c.expect("selected defaults still reject invalid override \(env)", true) }
        }
        var scopedDefaults = candidate
        scopedDefaults.readScopeTokens = 4096
        scopedDefaults.layerExpertWorkspace = true
        scopedDefaults.boundedIndexer = true
        scopedDefaults.boundedPLE = true
        c.equal("valid inherited read scope retains its prerequisites",
            try InferenceOptimizations.resolving(environment: [:], defaults: scopedDefaults), scopedDefaults)
        for name in ["SLOTSTREAM_OPT_COMPACT_STATE", "SLOTSTREAM_OPT_COMPACT_MTP",
                     "SLOTSTREAM_OPT_LAYER_WORKSPACE", "SLOTSTREAM_OPT_INDEXER_TILES", "SLOTSTREAM_OPT_PLE_TILES"] {
            do {
                _ = try InferenceOptimizations.resolving(environment: [name: "0"], defaults: scopedDefaults)
                c.expect("inherited scope rejects disabled prerequisite \(name)", false)
            } catch { c.expect("inherited scope rejects disabled prerequisite \(name)", true) }
        }
        scopedDefaults.readScopeTokens = 0
        c.equal("scope can be disabled while retaining its other independent work",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_READ_SCOPE": "0"],
                defaults: {
                    var value = scopedDefaults; value.readScopeTokens = 4096; return value
                }()), scopedDefaults)
        let environmentFunction: ([String: String]) throws -> InferenceOptimizations = InferenceOptimizations.environment
        c.equal("public environment function value keeps its signature and automatic default",
            try environmentFunction([:]), InferenceOptimizations.deploymentCandidate())
        c.expect("typed override enables compaction", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_COMPACT_STATE": "1"]).compactStateWindows)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPACT_STATE": "yes"])
            c.expect("malformed override refused", false)
        } catch { c.expect("malformed override refused", true) }

        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_TYPO": "1"])
            c.expect("unknown optimization refused", false)
        } catch { c.expect("unknown optimization refused", true) }

        for value in ["-1", "1", "16384", "bad"] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": value])
                c.expect("invalid read scope \(value) refused", false)
            } catch { c.expect("invalid read scope \(value) refused", true) }
        }
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": "8192"])
            c.expect("unbounded read scope refused", false)
        } catch { c.expect("unbounded read scope refused", true) }

        c.equal("explicit workspace tile is recorded", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"]).workspaceTokenTile, 2048)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_WORKSPACE_TILE": "8192"])
            c.expect("unbounded workspace tile refused", false)
        } catch { c.expect("unbounded workspace tile refused", true) }

        c.equal("terminal output needs no speculative draft", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 1, bounded: true), 0)
        c.equal("draft count fits remaining output", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 3, bounded: true), 2)
        c.equal("public depth cannot exceed recording cap", Generator.effectiveDraftDepth(requested: Int.max, remainingOutputs: Int.max, bounded: false), 16)
        c.equal("negative remaining output cannot underflow", Generator.effectiveDraftDepth(requested: Int.min, remainingOutputs: Int.min, bounded: true), 0)

        // The prefix cache holds four conversations, not one: Open WebUI's
        // interleaved title request defeated a single slot.
        // Logical cache fixtures are never forwarded through the model, but
        // still declare exactly the number of represented token IDs.
        func fixture(_ count: Int) -> Qwen4ExpModel.State {
            let state = Qwen4ExpModel.State(); state.tokenCount = count; return state
        }
        let cache = PrefixCache(maxTokens: 100)
        for token in 1 ... PrefixCache.maxEntries {
            cache.store(state: fixture(1), tokens: [token])
        }
        c.equal(
            "prefix cache reaches its four-entry bound",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        cache.store(state: fixture(1), tokens: [PrefixCache.maxEntries])
        c.equal(
            "an identical history replaces instead of duplicating an entry",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        _ = cache.take(matching: [999], reserveTokens: 1)
        c.equal(
            "a miss evicts before allocating a fifth state",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries - 1)
        cache.configure(maxTokens: 2)
        c.expect("a smaller live token ceiling evicts immediately", cache.heldTokens <= 2)
        c.expect("held GB includes fixed recurrent state", cache.heldGB > 0.1)
        let growth = PrefixCache(maxTokens: 20)
        growth.store(state: fixture(4), tokens: [1, 2, 3, 4])
        growth.store(state: fixture(4), tokens: [7, 8, 9, 10])
        growth.store(state: fixture(4), tokens: [11, 12, 13, 14])
        c.expect("growing hit still reuses its state", growth.take(matching: [1, 2, 3, 4, 5], reserveTokens: 17) != nil)
        c.equal("growing hit reserves future state before allocation", growth.heldTokens, 0)
        growth.store(state: fixture(1), tokens: [4])
        c.expect("huge reservation safely misses", growth.take(matching: [9], reserveTokens: Int.max) == nil)
        c.equal("huge reservation releases held state", growth.heldTokens, 0)

        let capacity = PrefixCache(maxTokens: 4096)
        for token in 1 ... 4 { capacity.store(state: fixture(1), tokens: [token]) }
        c.expect("capacity reservation still hits", capacity.take(matching: [1, 2], reserveTokens: 2,
            reserveSequenceBytes: 4096 * PrefixCache.bytesPerToken) != nil)
        c.equal("capacity growth reserves bytes before reuse", capacity.heldTokens, 0)
        capacity.store(state: fixture(1), tokens: [7])
        _ = capacity.take(matching: [9], reserveSequenceBytes: Int.max)
        c.equal("saturated byte reservation evicts safely", capacity.heldTokens, 0)

        // Image keying. Every image expands to a run of the same placeholder
        // id, so ids alone cannot tell two pictures apart; the digest can, and
        // a match has to agree in both directions.
        let a = ImageHash(hashing: Data("picture A".utf8))
        let b = ImageHash(hashing: Data("picture B".utf8))
        c.expect("identical bytes hash alike", a == ImageHash(hashing: Data("picture A".utf8)))
        c.expect("different bytes do not", a != b)
        let held = [ImageSegment(start: 4, count: 8, hash: a)]
        c.expect(
            "the same image at the same offset matches",
            PrefixCache.imagesAgree(entry: held, prompt: held, upTo: 12))
        c.expect(
            "a swapped image does not",
            !PrefixCache.imagesAgree(
                entry: held, prompt: [ImageSegment(start: 4, count: 8, hash: b)], upTo: 12))
        c.expect(
            "an entry ending inside a run still matches that run",
            PrefixCache.imagesAgree(
                entry: [ImageSegment(start: 4, count: 3, hash: a)], prompt: held, upTo: 7))
        c.expect(
            "a text-only entry rejects a prompt with an image inside its range",
            !PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 12))
        c.expect(
            "an image beyond the entry's range is irrelevant to the match",
            PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 4))

        let vcache = PrefixCache(maxTokens: 100)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "a vision conversation is held, not discarded",
            vcache.take(matching: [1, 2, 3, 4], images: held, reserveTokens: 4) != nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the same ids with a different picture miss",
            vcache.take(
                matching: [1, 2, 3, 4], images: [ImageSegment(start: 4, count: 8, hash: b)],
                reserveTokens: 4) == nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the text-only splice never sees a vision entry",
            vcache.peek(extending: [1, 2]) == nil)

        // A client can re-render an assistant turn differently from the exact
        // ids the server generated (fx omits reasoning when it sends history
        // back). `peek` finds the longest retained extension for the splice,
        // but does not consume it before the ordinary cache match.
        let spliceCache = PrefixCache(maxTokens: 100)
        spliceCache.store(state: fixture(3), tokens: [7, 8, 9])
        spliceCache.store(state: fixture(4), tokens: [7, 8, 9, 10])
        c.equal(
            "prefix splice chooses the longest retained extension",
            spliceCache.peek(extending: [7, 8]), [7, 8, 9, 10])
        c.expect(
            "prefix splice is strict, not an identical-history match",
            spliceCache.peek(extending: [7, 8, 9, 10]) == nil)
        c.equal(
            "prefix splice lookup does not consume the retained state",
            spliceCache.take(matching: [7, 8, 9, 10, 11])?.reused, 4)
        spliceCache.enabled = false
        c.expect(
            "a disabled prefix cache offers no splice",
            spliceCache.peek(extending: [7]) == nil)

        // Weights behind a symlink: Foundation refuses to list the link itself,
        // so the index must resolve it first (it did not, before 0.2.1).
        let tmp = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-runtime-check-\(getpid())")
        let real = tmp.appendingPathComponent("real")
        let link = tmp.appendingPathComponent("link")
        try FileManager.default.createDirectory(at: real, withIntermediateDirectories: true)
        FileManager.default.createFile(
            atPath: real.appendingPathComponent("model-00001-of-00001.safetensors").path,
            contents: Data())
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: real)
        defer { try? FileManager.default.removeItem(at: tmp) }
        c.equal(
            "shard listing works through a symlinked model dir",
            (try? CheckpointIndex.shardFiles(in: link))?.count, 1)

        // The memory promise: a plan never expects to peak past its target.
        for target in [Planner.minMemoryGB, 10, 16, 30] where target >= Planner.minMemoryGB {
            let p = try Planner.plan(
                expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: 64, workingSetGB: 64, availableGB: 64)
            c.expect(
                "\(target) GB plan stays inside its target",
                p.expectedPeakGB <= target + 0.01,
                "expected peak \(p.expectedPeakGB) GB")
            c.measure("peak_gb_at_\(Int(target))", p.expectedPeakGB)
        }
        return c.report()
    }
}

````````````

## Artifact SHA-256 fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0

Encoding: `utf-8`. Original bytes: 14145.

````````````text
// Context length: the cap, why it is what it is, and the prefill schedule that
// keeps a long prompt's transient memory inside what has been measured.

import Foundation

public enum ContextPolicy {
    /// Pinned checkpoint configuration. This is independent of qualification.
    public static let modelLimit = 262_144
    /// Longest prompt plus reply any one request may hold, in tokens.
    ///
    /// The Hermes qualification read 65,520 prompt tokens plus a reply; the
    /// remainder is reserved reply room. This is a measured serving envelope,
    /// not the model's 262,144-token configured limit or an answer-quality claim.
    /// The larger requested window is priced before allocating the expert pool.
    /// See MEASUREMENTS.md, Hermes integration, for the initial budget failure
    /// and the planned-context qualification. Keep ordinary defaults unchanged.
    public static let maxTokens = 65_536
    public static let implementationLimit = maxTokens
    public static let mtpLimit = 65_536
    public static let visionLimit = 65_536
    public static let defaultTokens = 32_768
    /// Context the fixed footprint (Planner.fixedFootprintGB) already pays for.
    public static let tokensInFixedFootprint = 32_768

    package static func maximumDraftDepth(requested: Int, at consumed: Int, limit: Int) -> Int {
        guard requested >= 0, consumed >= 0, consumed <= limit,
              limit > 0, limit <= modelLimit else { return 0 }
        return min(requested, max(0, limit - consumed - 1))
    }

    /// nil when `tokens` is an acceptable --max-context, otherwise the reason.
    public static func validationError(_ tokens: Int) -> String? {
        validationError(tokens, qualification: false)
    }

    public static func validationError(_ tokens: Int, qualification: Bool) -> String? {
        let limit = qualification ? modelLimit : implementationLimit
        if (1 ... limit).contains(tokens) { return nil }
        return "--max-context must be between 1 and \(limit) (prompt plus reply). "
            + "The pinned model limit is \(modelLimit); the released implementation limit is "
            + "\(implementationLimit). A model limit does not guarantee memory fit or answer quality."
    }
}

/// How a prompt is split into prefill passes.
///
/// A pass is faster the bigger it is (the expert stream is re-read roughly once
/// per pass), but the sparse-attention layers score every query token of the
/// pass against every key already in the context, so the pass's transient
/// memory grows with chunk × context, not with the chunk alone. Every number
/// the planner charges for a pass was measured with that product at most
/// `measuredQueryKeyProduct`. Past that point the schedule halves the pass
/// instead of letting the transient grow into space nothing has measured.
public enum PrefillSchedule {
    /// The largest query-by-key product any prefill measurement covered: a
    /// 4096-token pass finishing an 8,016-token prompt (MEASUREMENTS.md,
    /// "Prefill, second pass"). Do not raise it without a new measurement.
    public static let measuredQueryKeyProduct = 4096 * 8016
    /// Late-context passes use the existing small-pass pool path. Their cost
    /// stays unknown until a matching measurement has been registered.
    public static let minChunk = 64

    /// The pass to run when the state already holds `position` tokens and the
    /// plan allows `maxChunk`: halve from `maxChunk` until the product with
    /// the context the pass attends over is inside the measured bound, never
    /// below `minChunk`.
    public static func chunk(at position: Int, maxChunk: Int) -> Int {
        guard position >= 0, position < ContextPolicy.modelLimit else { return 0 }
        // Preserve the original 256-row dispatch while it fits. An odd
        // override such as 4095 must not halve through 511 to 255 inside the
        // existing serving window and silently select small-pass arithmetic.
        let floor = fits(256, at: position) ? 256 : minChunk
        var c = min(4096, max(floor, maxChunk))
        while c > floor, !fits(c, at: position) {
            c = max(floor, c / 2)
        }
        while c > 1, !fits(c, at: position) { c /= 2 }
        return fits(c, at: position) ? c : 0
    }

    /// Division avoids overflowing arbitrary diagnostic inputs. The accepted
    /// context ceiling is unchanged; within it even the minimum pass fits.
    public static func fits(_ count: Int, at position: Int) -> Bool {
        count > 0 && position >= 0 && position <= measuredQueryKeyProduct / count - count
    }

    /// Check the actual remaining rows before shrinking a hypothetical full
    /// pass. A 3,864-row tail after 4,096 fits the existing measured envelope.
    public static func next(remaining: Int, at position: Int, maxChunk: Int, tailAware: Bool) -> Int {
        guard remaining > 0 else { return 0 }
        guard position >= 0, position < ContextPolicy.modelLimit,
              remaining <= ContextPolicy.modelLimit - position else { return 0 }
        let candidate = min(remaining, min(4096, max(1, maxChunk)))
        if tailAware, fits(candidate, at: position) { return candidate }
        return min(remaining, chunk(at: position, maxChunk: maxChunk))
    }

    /// Group existing chronological compute passes without enlarging any
    /// query-by-key product. A scope shares reads; it is not a compute pass.
    public static func scopePasses(remaining: Int, at position: Int, maxChunk: Int,
                                   maxScope: Int, tailAware: Bool) -> [Int] {
        guard remaining > 0, position >= 0, position < ContextPolicy.modelLimit,
              remaining <= ContextPolicy.modelLimit - position else { return [] }
        var result: [Int] = [], count = 0
        let bound = max(minChunk, min(8192, maxScope))
        while count < remaining {
            let (pos, overflow) = max(0, position).addingReportingOverflow(count)
            guard !overflow else { break }
            let n = next(remaining: remaining - count, at: pos, maxChunk: maxChunk, tailAware: tailAware)
            // A short final pass uses the reference cached kernel family;
            // keep it separate until swept short tails have their own gate.
            if n == 0 || (count > 0 && (n < SweepTuning.minTokens || n > bound - count)) { break }
            result.append(n); count += n
            if count >= bound { break }
        }
        return result
    }

    /// End a read-sharing group at a requested checkpoint only when one of
    /// its existing compute passes already ends there. This preserves every
    /// arithmetic shape; an interior token never manufactures a new pass.
    package static func preservingCheckpoint(_ passes: [Int], from position: Int,
                                             checkpoint: Int) -> [Int] {
        guard position >= 0, checkpoint > position,
              checkpoint <= ContextPolicy.modelLimit else { return passes }
        var end = position
        for (index, count) in passes.enumerated() {
            guard count > 0, count <= ContextPolicy.modelLimit - end else { return passes }
            end += count
            if end == checkpoint { return Array(passes.prefix(index + 1)) }
            if end > checkpoint { return passes }
        }
        return passes
    }

    /// The passes that reading `tokens` new tokens from `position` runs.
    public static func passes(tokens: Int, from position: Int = 0, maxChunk: Int, tailAware: Bool = false) -> [Int] {
        computePasses(tokens: tokens, from: position, maxChunk: maxChunk, tailAware: tailAware).map(\.tokens)
    }

    public struct ComputePass: Sendable {
        public let tokens: Int
        public let queryRows: Int
        public let keyExtent: Int
    }

    /// Include the canonical late-context dispatch shape and masked columns,
    /// using the same bounded geometry as Generator. A nominal odd pass can
    /// shrink again for numerical alignment; diagnostics must report that.
    public static func computePasses(tokens: Int, from position: Int = 0,
                                     maxChunk: Int, tailAware: Bool = false) -> [ComputePass] {
        guard position >= 0, tokens >= 0, position <= ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - position else { return [] }
        var out: [ComputePass] = []
        var pos = position
        var left = tokens
        let end = position + tokens
        var referenceStart: Int?
        while left > 0 {
            var c = next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: tailAware)
            let small = chunk(at: pos, maxChunk: 256) < 256
            if small {
                if referenceStart == nil { referenceStart = pos }
                c = ContextWorkspace.boundedSmallPass(requested: c, at: pos,
                    referenceStart: referenceStart!, referenceEnd: end)
            }
            guard c > 0 else { return [] }
            let extent = small ? ContextWorkspace.keyExtent(pass: c, context: pos + c,
                referenceStart: referenceStart!, referenceEnd: end) : pos + c
            let queries = small ? ContextWorkspace.queryRows(pass: c, context: pos + c,
                referenceStart: referenceStart!, referenceEnd: end) : c
            guard extent > 0, queries <= measuredQueryKeyProduct / extent else { return [] }
            out.append(ComputePass(tokens: c, queryRows: queries, keyExtent: extent))
            pos += c
            left -= c
        }
        return out
    }

    /// Seconds to read `tokens` new prompt tokens at this plan: the schedule's
    /// passes priced at the measured per-pass throughput anchors
    /// (Planner.estPrefillTokS). The last, partial pass is priced at the rate
    /// of the pass size it was cut from — slightly pessimistic, on purpose.
    public static func estSeconds(tokens: Int, from position: Int = 0, maxChunk: Int, tailAware: Bool = false) -> Double {
        estimateSeconds(tokens: tokens, from: position, maxChunk: maxChunk, tailAware: tailAware) ?? .infinity
    }

    /// nil means there is no qualified throughput anchor for this schedule.
    public static func estimateSeconds(tokens: Int, from position: Int = 0, maxChunk: Int,
                                       tailAware: Bool = false) -> Double? {
        guard position >= 0, tokens >= 0, position <= ContextPolicy.modelLimit,
              tokens <= ContextPolicy.modelLimit - position else { return nil }
        var secs = 0.0
        var pos = max(0, position)
        var left = max(0, tokens)
        while left > 0 {
            let full = tailAware
                ? next(remaining: left, at: pos, maxChunk: maxChunk, tailAware: true)
                : chunk(at: pos, maxChunk: maxChunk)
            let c = min(full, left)
            guard c > 0, full >= 256 else { return nil }
            secs += Double(c) / Planner.estPrefillTokS(chunk: full)
            pos += c
            left -= c
        }
        return secs
    }

    /// "18 s" / "1.2 min" / "1.5 h": the same rounding everywhere it is shown.
    public static func describe(seconds: Double) -> String {
        guard seconds.isFinite else { return "unknown (schedule not yet calibrated)" }
        if seconds < 60 { return String(format: "%.0f s", seconds.rounded()) }
        if seconds < 3600 { return String(format: "%.1f min", seconds / 60) }
        return String(format: "%.1f h", seconds / 3600)
    }
}

/// Progress lines for a long prefill, shared by `run` (stderr) and `serve`
/// (its log). A prompt under `quietBelowTokens` prints nothing: the wait is
/// seconds and the lines would be noise.
public final class PrefillProgressReporter {
    public let quietBelowTokens: Int
    public var maxChunk: Int
    private let sink: (String) -> Void
    private var announced = 0  // total the running announcement was made for
    private var announcedBase = -1
    private var nextMark = 0.25
    private var lastLine: UInt64 = 0
    public var tailAware = false

    public init(quietBelowTokens: Int, maxChunk: Int, sink: @escaping (String) -> Void) {
        self.quietBelowTokens = quietBelowTokens
        self.maxChunk = maxChunk
        self.sink = sink
    }

    /// Generator.onPrefillProgress: called after every pass with the tokens
    /// read so far this request, the tokens it will read, and elapsed seconds.
    public func report(done: Int, total: Int, elapsed: Double) {
        report(done: done, total: total, elapsed: elapsed, base: 0)
    }

    public func report(done: Int, total: Int, elapsed: Double, base: Int) {
        guard total >= quietBelowTokens, total > 0 else { return }
        if announced != total || announcedBase != base {
            announced = total
            announcedBase = base
            nextMark = 0.25
            let eta = PrefillSchedule.estSeconds(tokens: total, from: base, maxChunk: maxChunk, tailAware: tailAware)
            sink("prefill: reading \(total) prompt tokens, ~\(PrefillSchedule.describe(seconds: eta)) "
                + "to the first token at this plan (follow-up turns read only what is new)")
        }
        if done <= 0 { return }
        let frac = Double(done) / Double(total)
        if done >= total {
            let rate = elapsed > 0 ? Double(total) / elapsed : 0
            sink(String(format: "prefill: done, %d tokens in %@ (%.0f tok/s)",
                        total, PrefillSchedule.describe(seconds: elapsed), rate))
            announced = 0
            return
        }
        // One line per quarter, never more often than every 5 s.
        guard frac >= nextMark, lastLine == 0 || RuntimeClock.seconds(since: lastLine) >= 5 else { return }
        while nextMark <= frac { nextMark += 0.25 }
        lastLine = RuntimeClock.now()
        let rate = elapsed > 0 ? Double(done) / elapsed : 0
        let left = rate > 0 ? Double(total - done) / rate : 0
        sink(String(format: "prefill: %d/%d tokens (%.0f%%), ~%@ left",
                    done, total, frac * 100, PrefillSchedule.describe(seconds: left)))
    }
}

````````````

## Artifact SHA-256 cd380f1cdde2622fe966f6aad22d3b54bf2e2b1da197cf0083c33cc8370fd224

Encoding: `utf-8`. Original bytes: 16671.

````````````text
import Foundation

// Saturation is a refusal sentinel, never permission to wrap a byte budget.
package enum ContextBytes {
    package static func product(_ values: Int...) -> Int {
        var result = 1
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.multipliedReportingOverflow(by: value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
    package static func sum(_ values: Int...) -> Int {
        var result = 0
        for value in values {
            guard value >= 0 else { return Int.max }
            let (next, overflow) = result.addingReportingOverflow(value)
            guard !overflow else { return Int.max }
            result = next
        }
        return result
    }
}

/// Pure geometry shared by the planner and the actual stepped sequence caches.
/// A capacity is bytes of backing storage, not the number of live token IDs.
public enum ContextGeometry {
    public static let allocationStep = 1024
    public static let attentionLayers = 12
    public static let rowBytes = 2304

    /// Physical bytes needed when one buffer grows. The old allocation can
    /// still have GPU or checkpoint readers, so growth charges the complete
    /// replacement. Capacity in another buffer never grants a credit here.
    public static func nextBufferAllocationBytes(tokens: Int, rowBytes: Int,
                                                 allocatedBytes: Int, step: Int = allocationStep) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit, rowBytes > 0,
              allocatedBytes >= 0, step > 0, step <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + step - 1) / step) * step
        let required = ContextBytes.product(capacity, rowBytes)
        return required > allocatedBytes ? required : 0
    }

    public static func capacityBytes(tokens: Int, layers: Int = attentionLayers,
                                     rowBytes: Int = rowBytes, pooledRowBytes: Int = 256,
                                     compressionRatio: Int = 4, indexerBudget: Int = 2048,
                                     incrementalIndexer: Bool = false) -> Int {
        guard tokens >= 0, layers >= 0, rowBytes > 0, pooledRowBytes >= 0,
              compressionRatio > 0, indexerBudget >= 0, tokens <= ContextPolicy.modelLimit else { return Int.max }
        let capacity = ((tokens + allocationStep - 1) / allocationStep) * allocationStep
        let pooled = incrementalIndexer && tokens > indexerBudget
            ? ((tokens / compressionRatio + 255) / 256) * 256 : 0
        let (rows, a) = capacity.multipliedReportingOverflow(by: rowBytes)
        let (blocks, b) = pooled.multipliedReportingOverflow(by: pooledRowBytes)
        let (one, c) = rows.addingReportingOverflow(blocks)
        let (total, d) = one.multipliedReportingOverflow(by: layers)
        return a || b || c || d ? Int.max : total
    }

    public static func sequenceBytes(tokens: Int, mtp: Bool = false) -> Int {
        capacityBytes(tokens: tokens, layers: attentionLayers + (mtp ? 1 : 0))
    }

    public static func additionalActiveBytes(tokens: Int, mtp: Bool = false) -> Int {
        max(0, sequenceBytes(tokens: tokens, mtp: mtp)
            - sequenceBytes(tokens: ContextPolicy.tokensInFixedFootprint, mtp: mtp))
    }
}

/// Exact integer accounting of an otherwise empirical process envelope. The
/// fixed and workspace allowances are measured budgets, not allocator telemetry.
public struct ContextMemoryLedger: Sendable {
    public let fixedBytes: Int
    public let poolBytes: Int
    public let activeCapacityBytes: Int
    public let additionalActiveBytes: Int
    public let retainedCapacityBytes: Int
    public let retainedRecurrentBytes: Int
    public let prefillBytes: Int
    public let longContextReserveBytes: Int
    public let mtpResidentBytes: Int
    public let visionResidentBytes: Int
    public let planningMarginBytes: Int

    public init(slots: Int, context: Int, chunk: Int, retentionTokens: Int,
                mtp: Bool, visionResident: Bool) {
        fixedBytes = PlannerCostModel.fixedBytes
        poolBytes = ContextBytes.product(slots, Int(Geometry.recordBytes))
        activeCapacityBytes = ContextGeometry.sequenceBytes(tokens: context, mtp: mtp)
        additionalActiveBytes = ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp)
        retainedCapacityBytes = ContextBytes.product(retentionTokens, PrefixCache.bytesPerToken)
        retainedRecurrentBytes = retentionTokens > 0
            ? (PrefixCache.maxEntries - 1) * PrefixCache.fixedBytesPerEntry : 0
        prefillBytes = ContextBytes.product(chunk, PlannerCostModel.prefillBytesPerToken)
        longContextReserveBytes = Self.transientReserveBytes(context: context, mtp: mtp)
        mtpResidentBytes = mtp ? PlannerCostModel.mtpResidentBytes : 0
        visionResidentBytes = visionResident ? PlannerCostModel.visionResidentBytes : 0
        planningMarginBytes = PlannerCostModel.planningMarginBytes
    }

    /// The Hermes envelope is anchored permanently at 65K. Above it, reserve
    /// an additional complete growth allocation for candidate qualification;
    /// this conservative copy budget is not a measured interpolation.
    public static func transientReserveBytes(context: Int, mtp: Bool = false) -> Int {
        guard context > ContextPolicy.tokensInFixedFootprint else { return 0 }
        let hermes = 32_768 * PrefixCache.bytesPerToken
        return max(hermes, ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp))
    }

    public var expectedPeakBytes: Int {
        ContextBytes.sum(fixedBytes, poolBytes, additionalActiveBytes, retainedCapacityBytes,
            retainedRecurrentBytes, prefillBytes, longContextReserveBytes,
            mtpResidentBytes, visionResidentBytes)
    }
    public var json: [String: Any] {
        ["version": 1, "fixed_bytes": fixedBytes, "pool_bytes": poolBytes,
         "active_capacity_bytes": activeCapacityBytes, "additional_active_bytes": additionalActiveBytes,
         "retained_capacity_bytes": retainedCapacityBytes, "retained_recurrent_bytes": retainedRecurrentBytes,
         "prefill_bytes": prefillBytes, "long_context_reserve_bytes": longContextReserveBytes,
         "mtp_resident_bytes": mtpResidentBytes, "vision_resident_bytes": visionResidentBytes,
         "planning_margin_bytes": planningMarginBytes, "expected_peak_bytes": expectedPeakBytes]
    }
}

/// Bounds for the next dispatch. These are conservative geometry allowances,
/// not throughput anchors or new measured process-peak claims.
public enum ContextWorkspace {
    /// A short pass stays inside one canonical projection/attention domain.
    /// Include masked key columns when choosing its actual query count.
    public static func boundedSmallPass(requested: Int, at position: Int,
                                         referenceStart: Int, referenceEnd: Int) -> Int {
        guard requested > 0, requested < 256, referenceStart >= 0,
              position >= referenceStart, referenceEnd > position,
              referenceEnd <= ContextPolicy.modelLimit else { return 0 }
        let blockRemaining = 256 - ((position - referenceStart) % 256)
        // Only the qualified 64/128-row family is selected for full late
        // passes. Odd user batch overrides cannot introduce a new kernel
        // shape such as 68 or 137; logical terminal rows are still exact.
        let preferred = requested >= 128 ? 128 : requested >= 64 ? 64 : requested
        var count = min(preferred, blockRemaining, referenceEnd - position)
        while count > 0 {
            let extent = keyExtent(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            let queries = queryRows(pass: count, context: position + count,
                referenceStart: referenceStart, referenceEnd: referenceEnd)
            if queries <= PrefillSchedule.measuredQueryKeyProduct / extent { return count }
            count /= 2
        }
        return 0
    }

    public static func keyExtent(pass: Int, context: Int, referenceStart: Int = 0,
                                 referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass < 256 else { return context }
        let rows = context - referenceStart
        return min(referenceEnd, referenceStart + ((rows + 255) / 256) * 256)
    }

    /// A tiny tail inside a matrix-prefill reference domain must not switch
    /// to the vector attention kernel. Dummy query rows are cropped before
    /// any state update, but they still count toward the physical Q x K bound.
    public static func queryRows(pass: Int, context: Int, referenceStart: Int = 0,
                                  referenceEnd: Int = ContextPolicy.modelLimit) -> Int {
        guard pass > 0, context >= pass, context <= ContextPolicy.modelLimit,
              referenceStart >= 0, referenceStart <= context - pass,
              referenceEnd >= context, referenceEnd <= ContextPolicy.modelLimit else { return Int.max }
        guard pass <= 8 else { return pass }
        let block = referenceStart + ((context - pass - referenceStart) / 256) * 256
        return min(256, referenceEnd - block) > 8 ? 64 : pass
    }

    public static func prefillBytes(pass: Int, context: Int, scope: Int = 0, attentionHeads: Int = 24,
                                    referenceStart: Int = 0, referenceEnd: Int = ContextPolicy.modelLimit,
                                    minimumProjectionRows: Int = 0, padSmallQueries: Bool = false) -> Int {
        guard pass > 0, pass <= 4096, attentionHeads > 0, scope >= 0, context >= pass, context <= ContextPolicy.modelLimit,
              (0 ... 256).contains(minimumProjectionRows),
              pass <= PrefillSchedule.measuredQueryKeyProduct / context else { return Int.max }
        let extent = keyExtent(pass: pass, context: context, referenceStart: referenceStart, referenceEnd: referenceEnd)
        let queries = padSmallQueries ? queryRows(pass: pass, context: context,
            referenceStart: referenceStart, referenceEnd: referenceEnd) : pass
        guard queries <= PrefillSchedule.measuredQueryKeyProduct / extent else { return Int.max }
        // Indexer score/mask/top-k and selected attention coexist with layer
        // activations. Preserve the original linear allowance; bound the
        // query-by-context part even when late passes fall below 256.
        return ContextBytes.sum(max(ContextBytes.product(max(pass, minimumProjectionRows), PlannerCostModel.prefillBytesPerToken),
            ContextBytes.product(queries, extent, ContextBytes.sum(ContextBytes.product(attentionHeads, 8), 16))), ContextBytes.product(max(0, scope - pass), 32_768))
    }

    /// Additional buffers owned by the expert workspace, beyond ordinary
    /// compute-pass and retained-frontier allowances. Count replacement
    /// storage even if MLX can donate the old allocation on this dispatch.
    /// This is a conservative allocation reservation, not a process peak.
    package static func expertWorkspaceBytes(tokens: Int, tile: Int, experts: Int,
        topK: Int, hidden: Int, intermediate: Int, recordBytes: Int, loadBatch: Int,
        admissionPoolBytes: Int = 0, admissionRecords: Int = 0) -> Int {
        guard tokens > 0, tokens <= ContextPolicy.modelLimit,
              [256, 512, 1024, 2048, 4096].contains(tile),
              experts > 0, topK > 0, topK <= experts, hidden > 0, intermediate > 0,
              recordBytes > 0, loadBatch > 0, loadBatch <= experts,
              admissionPoolBytes >= 0, admissionRecords >= 0, admissionRecords <= experts,
              admissionRecords == 0 || admissionPoolBytes > 0 else { return Int.max }
        let weights = ContextBytes.product(experts, recordBytes)
        // Nine aligned managed buffers; reserve a second staging copy so
        // admission never depends on a particular no-copy upload decision.
        let staging = ContextBytes.sum(ContextBytes.product(loadBatch, recordBytes, 2), 9 * 16_384)
        let assembly = ContextBytes.sum(weights, staging)
        // Sweep admission can replace the decode pool while full workspace
        // weights and gathered hot records remain live.
        let admission = ContextBytes.sum(admissionPoolBytes,
            ContextBytes.product(admissionRecords, recordBytes))
        // workspaceRouted merges a residual tail only below 256 rows. Its
        // grouped matmul pads to at least four rows per expert (and 16).
        let liveTokens = min(tokens, tile + 255)
        let rows = max(ContextBytes.product(liveTokens, topK), ContextBytes.product(experts, 4), 16)
        // Original/padded gather, down, canonical and weighted outputs: five H-wide arrays.
        // Gate, up, SiLU and product: four FF-wide arrays. Charge FP32 for
        // every intermediate, plus CPU/GPU index copies. Reduced tiles and
        // their final concatenation coexist until the layer returns.
        let routed = ContextBytes.sum(ContextBytes.product(rows,
            ContextBytes.sum(ContextBytes.product(hidden, 5), ContextBytes.product(intermediate, 4)), 4),
            ContextBytes.product(rows, 64))
        let retained = ContextBytes.sum(ContextBytes.product(tokens, hidden, 8),
            ContextBytes.product(tokens, topK, 16), ContextBytes.product(tokens, experts, 8),
            ContextBytes.product(experts, 32))
        return ContextBytes.sum(weights, max(assembly, admission, routed), retained)
    }

    public static func visionBytes(patches: Int, hidden: Int = 1152, heads: Int = 16,
                                   queryTile: Int = 0, padding: Int = 0) -> Int {
        guard patches > 0, patches <= 9216, hidden > 0, heads > 0,
              [0, 256].contains(queryTile), [0, 80, 128].contains(padding),
              queryTile == 0 || padding == 0 else { return Int.max }
        // The pinned width-72 fallback materializes BF16 QK and softmax.
        // Each tile is evaluated before the next, so the candidate really
        // bounds Q by 256. Padding uses a different kernel; retain the full
        // original-score allowance until its resource gate is qualified.
        let queries = queryTile == 256 ? min(patches, 256) : patches
        return ContextBytes.sum(ContextBytes.product(queries, patches, heads, 4),
            ContextBytes.product(patches, hidden, 32))
    }
}

/// Count existing request values without formatting or serializing them first.
/// Depth and overflow fail closed before Jinja/JSON can copy the structure.
package enum ContextInputMemory {
    package static func bytes(_ value: Any, depth: Int = 0) -> Int {
        guard depth < 64 else { return Int.max }
        if let text = value as? String { return ContextBytes.sum(text.utf8.count, 16) }
        if let value = value as? JSONValue {
            switch value {
            case .string(let text): return ContextBytes.sum(text.utf8.count, 16)
            case .array(let values): return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
            case .object(let values): return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
            default: return 32
            }
        }
        if let values = value as? [String: Any] {
            return values.reduce(16) { ContextBytes.sum($0, $1.key.utf8.count, bytes($1.value, depth: depth + 1)) }
        }
        if let values = value as? [Any] {
            return values.reduce(16) { ContextBytes.sum($0, bytes($1, depth: depth + 1)) }
        }
        return 32
    }
    package static func bytes(messages: [ChatMessage], tools: [ToolDefinition]) -> Int {
        let messagesBytes = messages.reduce(0) { sum, m in
            let calls = m.toolCalls.reduce(0) { ContextBytes.sum($0, $1.name.utf8.count, bytes(JSONValue.object($1.arguments))) }
            return ContextBytes.sum(sum, m.role.utf8.count, m.content.utf8.count, m.reasoning?.utf8.count ?? 0,
                m.toolCallId?.utf8.count ?? 0, m.toolName?.utf8.count ?? 0, calls, bytes(m.images), 256)
        }
        return tools.reduce(messagesBytes) { ContextBytes.sum($0, $1.name.utf8.count, $1.description.utf8.count, bytes($1.parameters), 256) }
    }
}

````````````

## Artifact SHA-256 9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316

Encoding: `utf-8`. Original bytes: 58066.

````````````text
// High-level engine: model + tokenizer + chat templating, shared by CLI/server.

import CoreGraphics
import Foundation
import MLX
import Tokenizers

public struct ChatMessage {
    public var role: String
    public var content: String
    /// An assistant turn's reasoning, rendered as `reasoning_content`. Clients
    /// that keep reasoning in history can replay it; fx does not send any.
    public var reasoning: String?
    /// Calls this assistant turn made.
    public var toolCalls: [ParsedToolCall]
    /// For a `tool` message: which call it answers.
    public var toolCallId: String?
    public var toolName: String?
    /// Pictures this turn carries, as inline bytes (a `data:` URL or bare
    /// base64) in the order the template should render them. Text-only paths
    /// leave it empty and behave exactly as before.
    public var images: [String] = []

    public init(role: String, content: String) {
        self.role = role
        self.content = content
        self.reasoning = nil
        self.toolCalls = []
        self.toolCallId = nil
        self.toolName = nil
    }

    public init(
        role: String, content: String, reasoning: String? = nil,
        toolCalls: [ParsedToolCall] = [], toolCallId: String? = nil, toolName: String? = nil
    ) {
        self.role = role
        self.content = content
        self.reasoning = reasoning
        self.toolCalls = toolCalls
        self.toolCallId = toolCallId
        self.toolName = toolName
    }

    /// The dictionary the chat template consumes.
    ///
    /// Tool-call arguments are bridged as an unordered dictionary because
    /// swift-jinja accepts nothing else, so the template's `arguments|items`
    /// follows Swift's hash order. That is why a generated assistant turn is
    /// spliced back as raw ids rather than re-rendered (`PrefixCache`): a
    /// re-render is semantically identical but not byte-identical, and the
    /// prefix cache matches on bytes.
    public var templateValue: [String: any Sendable] {
        var m: [String: any Sendable] = ["role": role, "content": content]
        // The template checks each content part for an `image`/`image_url`
        // key, so a turn with pictures has to arrive as parts rather than a
        // string. Images first, then the text: that is the order the template
        // numbers them in ("Picture 1: ..."), and the order
        // `Engine.imageSources` reads them back in.
        if !images.isEmpty {
            var parts: [[String: any Sendable]] = images.map {
                ["type": "image_url", "image_url": ["url": $0] as [String: any Sendable]]
            }
            if !content.isEmpty { parts.append(["type": "text", "text": content]) }
            m["content"] = parts
        }
        if let r = reasoning, !r.isEmpty { m["reasoning_content"] = r }
        if !toolCalls.isEmpty {
            m["tool_calls"] = toolCalls.map { call in
                [
                    "type": "function",
                    "function": [
                        "name": call.name,
                        "arguments": call.arguments.mapValues { $0.any },
                    ] as [String: any Sendable],
                ] as [String: any Sendable]
            }
        }
        return m
    }
}

public final class Engine {
    public let modelDir: URL
    public let model: Qwen4ExpModel
    public let generator: Generator
    public let tokenizer: any Tokenizers.Tokenizer
    public let eosIds: Set<Int>
    public let modelName: String
    /// Lazily-loaded vision tower (VLM). Loaded on the first request that
    /// carries an image and then cached; see `ensureVisionTower`.
    public private(set) var visionTower: VisionTower?
    /// Whether this process will accept images at all (`--vision`). False
    /// makes every image request a 400 that says so, rather than a surprise
    /// gigabyte.
    public var visionAllowed = true
    /// Whether the checkpoint carries a tower at all, read once at startup so
    /// the fx catalogue and `/api/show` can answer without touching it.
    public private(set) var visionAvailable = false
    /// Longest prompt accepted, at most `ContextPolicy.maxTokens` (the largest
    /// context that has been measured, see Context.swift). Unbounded prompts
    /// are not free: KV plus indexer state costs ~27 KiB per token, and a
    /// prompt is read in full before the first token, so a huge prompt is a
    /// long, memory-growing stall rather than a fast failure.
    private let contextLock = NSRecursiveLock()
    private var configuredContextTokens = ContextPolicy.defaultTokens
    private let allocatedContextTokens: Int
    private var contextAssignmentFailure: RequestFailure?
    public var maxContextTokens: Int {
        get { contextLock.withLock { configuredContextTokens } }
        set {
            contextLock.lock(); defer { contextLock.unlock() }
            if let why = ContextPolicy.validationError(newValue, qualification: currentPlan?.contextQualification ?? false) {
                contextAssignmentFailure = RequestFailure(.invalidConfiguration, why); return
            }
            guard newValue <= allocatedContextTokens else {
                contextAssignmentFailure = RequestFailure(.invalidConfiguration,
                    "context assignment exceeds this engine's allocated plan; construct a new Engine with a validated plan")
                return
            }
            contextAssignmentFailure = nil
            configuredContextTokens = newValue
            let capped = min(prefixCache.maxTokens, newValue)
            prefixCache.configure(maxTokens: capped)
            if let p = currentPlan {
                updatePlan(MemoryPlan(source: p.source, slots: p.slots, targetGB: p.targetGB,
                    ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
                    availableGB: p.availableGB, clamped: p.clamped, prefillChunk: p.prefillChunk,
                    prefixCacheTokens: capped, mtpEnabled: p.mtpEnabled, visionEnabled: p.visionEnabled,
                    visionResidentReserved: p.visionResidentReserved, maxContextTokens: newValue,
                    notes: p.notes, runtimeAllocationPolicy: p.runtimeAllocationPolicy,
                    maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification))
            }
        }
    }

    /// Call when a complete request is accepted, before tokenization or images.
    public func beginRequest(connected: @escaping () -> Bool = { true }) throws -> RequestController {
        if let override = requestControllerOverride {
            let control = try override(); try control.attachReservations(requestReservations); return control
        }
        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
        if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
        let configuration = try ContextConfiguration(maxContextTokens: maxContextTokens,
            maxPrefillWaitMinutes: currentPlan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            qualification: currentPlan?.contextQualification ?? false)
        let control = RequestController(configuration: configuration,
            slackBytes: Int(Planner.availabilitySlackGB(ramGB: currentPlan?.ramGB ?? Planner.deviceRAMGB()) * 1e9),
            connected: connected, pressure: { [weak self] in
                guard let self else { return true }
                return self.pressureBoundary.snapshot() != nil || self.osPressureLock.withLock { self.osPressure }
            })
        try control.attachReservations(requestReservations)
        return control
    }
    private let requestReservations = RequestMemoryReservations()

    // Package-only dependency seam for deterministic HTTP diagnostics. No wire
    // field or environment variable can install it.
    package var requestControllerOverride: (() throws -> RequestController)?

    public var contextPolicyJSON: [String: Any] {
        let plan = currentPlan
        return ["configured_window": maxContextTokens, "model_limit": ContextPolicy.modelLimit,
            "implementation_limit": ContextPolicy.implementationLimit,
            "mtp_limit": ContextPolicy.mtpLimit, "vision_limit": ContextPolicy.visionLimit,
            "max_prefill_wait_minutes": plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            "wait_scope": "accepted_request_to_first_model_token",
            "qualification": plan?.contextQualification ?? false,
            "allocation_available": planLock.withLock { allocationUnavailable == nil },
            "estimate_scope": "measured M5 Pro anchors; unknown for unqualified pass sizes"]
    }

    deinit { pressureMonitor?.cancel() }

    private var allocationUnavailable: RequestFailure?
    package func setAllocationUnavailable(_ failure: RequestFailure?) {
        planLock.withLock { allocationUnavailable = failure }
    }

    private let osPressureLock = NSLock()
    private var osPressure = false
    private var pressureMonitor: DispatchSourceMemoryPressure?

    /// Retained conversation state, so a follow-up turn re-prefills only what
    /// is new. See PrefixCache for the extend-only rule and the memory story.
    public let prefixCache: PrefixCache

    /// Release the retained conversation state. Takes the generation lock, so
    /// never call it from inside `generate`.
    public func dropPrefixCache() {
        withExclusive { prefixCache.drop() }
    }

    /// nil when `promptTokens` fits, otherwise the message to return to the client.
    ///
    /// The message names the cap for what it is. It used to tell people to
    /// raise --max-context, which cannot go past the ceiling the server was
    /// already at.
    public func contextError(promptTokens: Int) -> String? {
        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { return contextAssignmentFailure.message }
        guard promptTokens < 0 || promptTokens > maxContextTokens else { return nil }
        return "context_length_exceeded: prompt is \(promptTokens) tokens, over the configured \(maxContextTokens)-token prompt-plus-reply window. Send less or restart with a larger supported --max-context; the model limit is \(ContextPolicy.modelLimit)."
    }
    /// The live memory plan (updated by the elastic governor on resize; nil
    /// for internal fixed-size uses). Guarded by its own lock so /api reads
    /// never block behind a running generation.
    private var _plan: MemoryPlan?
    private let planLock = NSLock()
    public var currentPlan: MemoryPlan? {
        planLock.lock()
        defer { planLock.unlock() }
        return _plan
    }
    public func updatePlan(_ p: MemoryPlan) {
        planLock.lock()
        _plan = p
        planLock.unlock()
    }

    private let lock = GenerationGate()
    package let pressureBoundary = PressureBoundary()
    // Immutable after startup, so the governor never reads mutable model
    // controls concurrently with a request changing its diagnostic options.
    package let responsiveGovernor: Bool

    /// Run `body` with the generation lock held — the governor uses this to
    /// resize the pool strictly between requests.
    public func withExclusive<T>(_ body: () throws -> T) rethrows -> T {
        lock.lock()
        defer { lock.unlock() }
        return try body()
    }

    @discardableResult
    package func tryWithExclusive(_ body: () -> Void) -> Bool {
        lock.tryWithExclusive(body)
    }

    /// Pool numbers for the metadata endpoints, published rather than read
    /// live. Reading SlotPool's mutable Swift arrays while the governor
    /// resizes is a data race, but taking the *generation* lock to avoid it
    /// made /api/tags and /api/ps block for the whole of a running request, so
    /// a client that polls either one saw a generating server as a hung one.
    private var _poolSnapshot: (slots: Int, slotsPerLayer: Double, poolBytes: Int) = (0, 0, 0)
    private let poolSnapshotLock = NSLock()

    public func poolSnapshot() -> (slots: Int, slotsPerLayer: Double, poolBytes: Int) {
        poolSnapshotLock.lock()
        defer { poolSnapshotLock.unlock() }
        return _poolSnapshot
    }

    /// Re-read the pool and publish it. **Call with the generation lock held**
    /// (inside `withExclusive`), which is where every resize already happens.
    public func publishPoolSnapshot() {
        let s = (model.pool.slots, model.pool.slotsPerLayer, model.pool.poolBytes)
        poolSnapshotLock.lock()
        _poolSnapshot = s
        poolSnapshotLock.unlock()
    }

    public convenience init(modelDir: URL, plan: MemoryPlan) async throws {
        try await self.init(modelDir: modelDir, poolSlots: plan.slots, plan: plan)
    }

    public init(modelDir: URL, poolSlots: Int, plan: MemoryPlan? = nil) async throws {
        // A plan made for a simulated machine may be printed and compared,
        // never loaded. Simulating memory the machine does not have still
        // allocates for real: on 2026-08-30 a simulated 60 GB drove a 25.4 GB
        // allocation and 39 GB of swap. The flag travels on the plan so this
        // cannot be forgotten at a call site.
        if plan?.simulated == true { throw SlotstreamError.simulatedDeviceCannotLoad }
        let context = try ContextConfiguration(maxContextTokens: plan?.maxContextTokens ?? ContextPolicy.defaultTokens,
            maxPrefillWaitMinutes: plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            qualification: plan?.contextQualification ?? false)
        guard poolSlots >= Geometry.floorSlots, poolSlots <= Geometry.totalRecords,
              plan == nil || plan?.slots == poolSlots else {
            throw SlotstreamError.invalidPlan("engine pool must match a supported memory plan")
        }
        let initialLedger = plan?.memoryLedger ?? ContextMemoryLedger(slots: poolSlots,
            context: context.maxContextTokens, chunk: 256,
            retentionTokens: Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            mtp: false, visionResident: false)
        let initial = RequestController(configuration: context,
            slackBytes: Int(Planner.availabilitySlackGB(ramGB: plan?.ramGB ?? Planner.deviceRAMGB()) * 1e9))
        try initial.check(nextAllocationBytes: initialLedger.expectedPeakBytes, phase: "model allocation")
        self.allocatedContextTokens = context.maxContextTokens
        self.configuredContextTokens = context.maxContextTokens
        self.modelDir = modelDir
        self._plan = plan
        // Sized from the same budget as the pool; SLOTSTREAM_PREFIX_CACHE=0
        // (or --no-prefix-cache) pins it off for parity work.
        let env = ProcessInfo.processInfo.environment["SLOTSTREAM_PREFIX_CACHE"]
        self.prefixCache = PrefixCache(
            maxTokens: plan?.prefixCacheTokens
                ?? Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            enabled: env != "0" && (plan?.runtimeAllocationPolicy?.prefixCacheEnabled ?? true))
        if let p = plan, p.runtimeAllocationPolicy != nil { prefixCache.setBudgetLimit(p.prefixCacheTokens) }
        // MLX's allocator otherwise retains freed transients (KV caches,
        // activations) in an unbounded internal cache — measured ~5 GB of RSS
        // above the memory plan after a few dozen requests. 2 GB keeps
        // per-token reallocation churn away while making real process memory
        // track the announced plan.
        MLX.Memory.cacheLimit = 2 << 30
        self.modelName = "qwen3.8-flash-next:4bit"
        let t0 = Date()
        let index = try CheckpointIndex(dir: modelDir)
        self.model = try Qwen4ExpModel(index: index, poolSlots: poolSlots)
        self.responsiveGovernor = model.optimizations.responsiveGovernor
        try model.validate()
        // Read from the index that is already open — no tensor is touched, and
        // nothing is allocated until an image actually arrives.
        self.visionAvailable = VisionTower.present(index: index)
        self.visionAllowed = plan?.visionEnabled ?? visionAvailable
        if plan?.mtpEnabled == true {
            try model.enableMTP(modelDir: modelDir)
        }
        self.generator = Generator(model: model)
        if let p = plan, p.runtimeAllocationPolicy != nil {
            generator.setPrefillBudgetCeiling(p.prefillChunk)
            generator.prefillChunk = p.prefillChunk
        }
        if let p = plan, ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CHUNK"] == nil {
            generator.prefillChunk = p.prefillChunk
        }
        if let mb = Int(ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CACHE_MB"] ?? "") {
            generator.prefillCacheLimit = max(0, mb) << 20
        } else if let p = plan, p.expectedPeakGB <= 12 {
            generator.prefillCacheLimit = 512 << 20
        }
        self.tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        var eos: Set<Int> = [index.config.eosTokenId]
        if let e = tokenizer.eosTokenId { eos.insert(e) }
        // generation_config may list several
        if let d = try? Data(contentsOf: modelDir.appendingPathComponent("generation_config.json")),
            let o = try? JSONSerialization.jsonObject(with: d) as? [String: Any]
        {
            if let list = o["eos_token_id"] as? [Int] { list.forEach { eos.insert($0) } }
            if let one = o["eos_token_id"] as? Int { eos.insert(one) }
        }
        self.eosIds = eos
        publishPoolSnapshot()
        let monitor = DispatchSource.makeMemoryPressureSource(eventMask: [.normal, .warning, .critical],
            queue: DispatchQueue(label: "slotstream.request-pressure"))
        monitor.setEventHandler { [weak self, weak monitor] in
            guard let self, let monitor else { return }
            self.osPressureLock.withLock { self.osPressure = !monitor.data.contains(.normal) }
        }
        monitor.resume(); pressureMonitor = monitor
        let banner = "engine ready in \(String(format: "%.1f", -t0.timeIntervalSinceNow))s: "
            + "expert cache ~\(String(format: "%.0f", model.pool.slotsPerLayer))/\(model.cfg.numExperts) per layer "
            + "(\(model.pool.slots) global slots = \(String(format: "%.1f", Double(model.pool.poolBytes) / 1e9)) GB), "
            + (model.mtpHead != nil ? "mtp draft head on, " : "")
            + "eos \(eos.sorted())\n"
        FileHandle.standardError.write(banner.data(using: .utf8)!)
    }

    public func encodeChat(_ messages: [ChatMessage], thinking: Bool) throws -> [Int] {
        try encodeChat(messages, tools: [], thinking: thinking, effort: nil)
    }

    /// Render a conversation that may declare tools and replay tool calls.
    ///
    /// `tools` empty renders no `<tools>` block at all, which is what the
    /// Ollama and OpenAI dialects pass, so their bytes are unchanged.
    public func encodeChat(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: Self.additionalContext(thinking: thinking, effort: effort))
    }

    /// Encode a conversation, substituting the exact ids this server generated
    /// for any assistant turn it can still prove it produced.
    ///
    /// Why this exists. The prefix cache matches on bytes, and it must: the GDN
    /// recurrent state is a fold over the tokens it consumed, with no inverse,
    /// so a state may only be extended by the very ids that built it. A client
    /// replaying history does not send those ids — it sends its own view of the
    /// turn, which the template then re-renders. Whenever that re-render
    /// differs by a single byte, the next turn rebuilds the whole prompt.
    ///
    /// With reasoning ON that is not an edge case, it is every turn: fx (and
    /// most clients) never echo reasoning back, so the re-render is missing the
    /// `<think>` block the model actually produced, and the state cannot match.
    /// Measured on this machine, a two-turn tool loop reused 303 of 325 tokens
    /// with reasoning off and 0 of 349 with it on — three and a half times the
    /// wall time for the identical second turn.
    ///
    /// The splice closes that. For each assistant turn, ask the cache whether it
    /// still holds a state whose ids begin with exactly the prompt that turn was
    /// generated from; if it does, the remainder of those ids *is* that turn,
    /// verbatim. Check that the remainder really describes the turn the client
    /// sent (same calls, same arguments, same text) and then use the held ids in
    /// place of the re-render, tokenizing only the conversation after it.
    ///
    /// Splitting the text at `<|im_end|>` is safe because it is an added token
    /// and therefore a hard tokenizer boundary: the suffix tokenizes identically
    /// whether or not the text before it is present. That is measured, not
    /// assumed — see the `chat-splice` check.
    ///
    /// Any mismatch anywhere falls back to the plain render, which is the
    /// behaviour that existed before. The splice can make a turn cheaper; it can
    /// never make one wrong.
    public func encodeChatSpliced(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        let full = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        guard prefixCache.enabled, messages.contains(where: { $0.role == "assistant" })
        else { return full }
        let fullText = tokenizer.decode(tokens: full, skipSpecialTokens: false)

        var spliced: [Int] = []  // ids exactly as the model saw or produced them
        var consumed = 0  // characters of fullText those ids already cover
        var didSplice = false

        func index(_ offset: Int) -> String.Index {
            fullText.index(fullText.startIndex, offsetBy: offset)
        }

        for k in messages.indices where messages[k].role == "assistant" {
            guard
                let headIds = try? encodeChat(
                    Array(messages[0..<k]), tools: tools, thinking: thinking, effort: effort)
            else { break }
            let headText = tokenizer.decode(tokens: headIds, skipSpecialTokens: false)
            guard fullText.hasPrefix(headText), headText.count >= consumed else { break }
            // The ids that produced turn k: what is already spliced, plus the
            // conversation between there and this turn's generation prompt.
            let bridge = String(fullText[index(consumed)..<index(headText.count)])
            let producer =
                spliced + (bridge.isEmpty ? [] : tokenizer.encode(text: bridge, addSpecialTokens: false))
            guard let entry = prefixCache.peek(extending: producer) else { break }
            let generated = Array(entry[producer.count...])
            let genText = tokenizer.decode(tokens: generated, skipSpecialTokens: false)
            guard Self.spliceDescribes(genText, messages[k], tools: tools) else { break }
            guard
                let end = fullText.range(
                    of: "<|im_end|>", range: index(headText.count)..<fullText.endIndex)
            else { break }
            spliced = entry
            consumed = fullText.distance(from: fullText.startIndex, to: end.lowerBound)
            didSplice = true
        }

        guard didSplice else { return full }
        let tail = String(fullText[index(consumed)...])
        return spliced + tokenizer.encode(text: tail, addSpecialTokens: false)
    }

    /// Does this generated text describe the assistant turn the client sent?
    ///
    /// Deliberately compares meaning rather than bytes: the client's copy has
    /// been through its own JSON round trip, so whitespace and argument order
    /// may differ, but the calls it reports must be the calls that were made.
    /// Reasoning is ignored — the client dropping it is the whole reason the
    /// splice is needed.
    public static func spliceDescribes(
        _ generated: String, _ message: ChatMessage, tools: [ToolDefinition]
    ) -> Bool {
        let (_, body) = ThinkSplitter.split(generated)
        let visible = body.isEmpty && !generated.contains("</think>") ? generated : body
        let events = ToolCallSplitter.parseAll(visible, tools: tools.map { $0.schema })
        var calls: [ParsedToolCall] = []
        var text = ""
        for e in events {
            switch e {
            case .toolCall(let c): calls.append(c)
            case .text(let t): text += t
            case .malformed: return false
            default: break
            }
        }
        guard calls.count == message.toolCalls.count else { return false }
        for (a, b) in zip(calls, message.toolCalls) {
            guard a.name == b.name, a.arguments == b.arguments else { return false }
        }
        // The text is compared after trimming only. A client that rewrites the
        // assistant's prose is describing a different turn, and re-rendering it
        // is then the correct answer.
        return text.trimmingCharacters(in: .whitespacesAndNewlines)
            == message.content.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    static func additionalContext(thinking: Bool, effort: String?) -> [String: any Sendable] {
        var ctx: [String: any Sendable] = ["enable_thinking": thinking]
        if let e = effort, thinking { ctx["reasoning_effort"] = e }
        return ctx
    }

    /// Render a template without constructing the multi-GB model. Installer
    /// and API acceptance checks run this while a server is already live; the
    /// old implementation built a second Engine merely to load the tokenizer,
    /// so the singleton guard correctly rejected the check it was meant to run.
    public static func encodeChatWithoutModel(
        modelDir: URL, messages: [ChatMessage], thinking: Bool,
        tools: [ToolDefinition] = [], effort: String? = nil
    ) async throws -> [Int] {
        let tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        return try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: additionalContext(thinking: thinking, effort: effort))
    }

    /// OpenAI path: messages already contain image_url parts, and content may
    /// be String or [[String: Any]] (vision). The nested arrays must be
    /// bridged to the tokenizer's `[String: any Sendable]` messages or the
    /// vision parts are silently dropped before the Jinja template can render
    /// them as <|image_pad|>.
    public func encodeChatOpenAI(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> [Int] {
        func toSendable(_ v: Any) -> any Sendable {
            if let arr = v as? [[String: Any]] {
                return arr.map { d -> [String: any Sendable] in
                    var out: [String: any Sendable] = [:]
                    for (k, vv) in d { out[k] = toSendable(vv) }
                    return out
                } as any Sendable
            }
            if let d = v as? [String: Any] {
                var out: [String: any Sendable] = [:]
                for (k, vv) in d { out[k] = toSendable(vv) }
                return out as any Sendable
            }
            if let a = v as? [Any] {
                return a.map { toSendable($0) } as any Sendable
            }
            return v as any Sendable
        }
        let msgs: [[String: any Sendable]] = messages.map { dict in
            var m: [String: any Sendable] = [:]
            for (k, v) in dict { m[k] = toSendable(v) }
            return m
        }
        let toolSpecs: [[String: any Sendable]]? = tools?.map { dict in
            var t: [String: any Sendable] = [:]
            for (k, v) in dict { t[k] = toSendable(v) }
            return t
        }
        return try tokenizer.applyChatTemplate(
            messages: msgs, tools: toolSpecs, additionalContext: ["enable_thinking": thinking])
    }

    // MARK: Vision

    /// Load the vision tower on first use, and only if the machine can spare
    /// it right now.
    ///
    /// **Under the generation lock, not a lock of its own.** Loading is
    /// ~0.9 GB of MLX arrays plus an `eval`; a private lock let that run on a
    /// connection thread while another request was mid-generation, which is
    /// exactly the concurrent GPU work every other allocation path in this
    /// file serializes. `withExclusive` is that serialization, and it also
    /// makes the availability reading below meaningful: nothing else can
    /// allocate between reading it and taking the memory.
    ///
    /// Replan before allocation so a target-driven process pays for the
    /// tower with expert capacity. Also require real machine headroom: an
    /// accounting allowance is not proof that physical memory is available.
    public func ensureVisionTower() throws -> VisionTower { try ensureVisionTower(request: nil) }

    public func ensureVisionTower(request: RequestController?, workspaceBytes: Int = 0) throws -> VisionTower {
        guard workspaceBytes >= 0 else {
            throw RequestFailure(.invalidConfiguration, "vision workspace bytes must be nonnegative")
        }
        guard visionAllowed else {
            throw SlotstreamError.vision(
                "this server was started with --vision off; images are not accepted")
        }
        if let request { try lock.lock(request: request) } else { lock.lock() }
        defer { lock.unlock() }
        return try { () throws -> VisionTower in
            try request?.check(nextAllocationBytes: visionTower == nil ? 1_900_000_000 : 0, phase: "vision tower allocation")
            if pressureBoundary.snapshot() != nil {
                let failure = RequestFailure(.insufficientMemory, "memory pressure interrupted image preparation; retry after the cache resizes")
                throw request?.fail(failure) ?? failure
            }
            let reservedPlan: MemoryPlan?
            do { reservedPlan = try currentPlan.map { try Planner.loadingVision($0) } }
            catch {
                let failure = RequestFailure(.insufficientMemory, "vision allocation cannot fit the current plan: \(error)")
                throw request?.fail(failure) ?? failure
            }
            if let charged = reservedPlan {
                let ledger = charged.memoryLedger
                let peak = ContextBytes.sum(ledger.expectedPeakBytes - ledger.prefillBytes,
                    max(ledger.prefillBytes, workspaceBytes))
                if let target = charged.targetGB, Double(peak) > target * 1e9 {
                    var failure = RequestFailure(.insufficientMemory,
                        "image attention workspace exceeds this process memory target; resize the image or raise --memory-gb")
                    failure.requiredBytes = peak
                    failure.availableBytes = target < Double(Int.max) / 1e9 ? Int(target * 1e9) : Int.max
                    throw request?.fail(failure) ?? failure
                }
            }
            try request?.check(nextAllocationBytes: workspaceBytes, phase: "vision workspace admission")
            if let vt = visionTower { return vt }
            let idx = try CheckpointIndex(dir: modelDir)
            guard VisionTower.present(index: idx) else {
                throw SlotstreamError.vision(
                    "this checkpoint has no vision tower — it is a text-only model")
            }
            let needGB = Double(VisionTower.residentBytes(index: idx)) / 1e9
            guard needGB <= Planner.visionResidentGB else {
                throw SlotstreamError.vision("vision weights exceed the supported resident allowance")
            }
            if let avail = Planner.deviceAvailableGB(), avail.isFinite,
                avail < needGB + Planner.visionLoadMarginGB
            {
                let failure = RequestFailure(.insufficientMemory, String(
                        format: "the vision tower needs %.1f GB and only %.1f GB is reclaimable "
                            + "right now — close other apps and retry, or restart with a lower "
                            + "--memory-gb so the tower fits",
                        needGB, avail))
                throw request?.fail(failure) ?? failure
            }
            if let p = reservedPlan {
                // The lock excludes generation and governor mutation. Shrink
                // releases the old arena before allocating the smaller one.
                model.pool.resize(to: p.slots)
                if p.runtimeAllocationPolicy != nil {
                    generator.setPrefillBudgetCeiling(p.prefillChunk)
                    prefixCache.setBudgetLimit(p.prefixCacheTokens)
                }
                generator.prefillChunk = min(generator.prefillChunk, p.prefillChunk)
                prefixCache.configure(maxTokens: min(prefixCache.maxTokens, p.prefixCacheTokens))
                MLX.Memory.clearCache()
                updatePlan(p)
                publishPoolSnapshot()
            }
            let vt = try VisionTower(index: idx)
            self.visionTower = vt
            return vt
        }()
    }

    /// Tokenize with vision expansion: each template image_pad is worth
    /// N_merged real tokens, so the template's single pad is expanded to a run
    /// of pads that the tower's embeddings will fill. Returns the expanded ids
    /// and a `VisionPrompt` when the request carries images, nil otherwise.
    ///
    /// The tower does not run here. The run lengths come from each image's
    /// dimensions, so the ids — and with them the prefix cache key — are ready
    /// before any pixels are read. `Generator.generate` asks the cache first
    /// and then encodes only the images that the reused state does not cover.
    public func encodeWithVision(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> ([Int], VisionPrompt?) {
        try encodeWithVision(messages: messages, tools: tools, thinking: thinking, request: nil)
    }

    public func encodeWithVision(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false,
        request: RequestController?
    ) throws -> ([Int], VisionPrompt?) {
        let request: RequestController? = try request ?? beginRequest()
        try request?.attachReservations(requestReservations)
        try request?.checkInputBytes(ContextBytes.sum(ContextInputMemory.bytes(messages), ContextInputMemory.bytes(tools ?? [])))
        let baseIds = try encodeChatOpenAI(messages: messages, tools: tools, thinking: thinking)
        return try withImages(baseIds: baseIds, sources: Self.imageSources(in: messages), request: request)
    }

    /// The typed path (`ChatMessage`), for the fx gateway and the CLI. Renders
    /// through the same template as `encodeChat` and then expands the same
    /// placeholders.
    public func encodeChatWithVision(
        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
        effort: String? = nil
    ) throws -> ([Int], VisionPrompt?) {
        try encodeChatWithVision(messages, tools: tools, thinking: thinking, effort: effort, request: nil)
    }

    public func encodeChatWithVision(
        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
        effort: String? = nil, request: RequestController?
    ) throws -> ([Int], VisionPrompt?) {
        let request: RequestController? = try request ?? beginRequest()
        try request?.attachReservations(requestReservations)
        try request?.checkInputBytes(ContextInputMemory.bytes(messages: messages, tools: tools))
        let baseIds = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        return try withImages(baseIds: baseIds, sources: messages.flatMap { $0.images }, request: request)
    }

    /// Expand each `<|image_pad|>` the template rendered into the run of
    /// placeholders its image is worth, and describe the images for the tower
    /// and the prefix cache. Shared by every surface so they cannot drift.
    private func withImages(baseIds: [Int], sources: [String], request: RequestController? = nil) throws -> ([Int], VisionPrompt?) {
        defer { request?.releaseDispatchReservation() }
        try request?.check(phase: "prompt preparation")
        if sources.isEmpty { return (baseIds, nil) }
        let started = RuntimeClock.now()
        let observer = generator.footprintSampling ? FootprintSampler() : nil
        let vmBefore = generator.footprintSampling ? ProcessMemory.vmActivity() : nil
        var observationFinished = false
        defer { if !observationFinished { _ = observer?.finish() } }
        // Decode and hash first: it needs no tower, it is cheap next to one,
        // and a malformed picture should be a 400 before the process commits
        // 0.9 GB to a tower it may not otherwise need.
        var decoded: [(cg: CGImage, hash: ImageHash)] = []
        let sourceBatch = DecodedImageBatch(deduplicate: model.optimizations.deduplicateImages)
        decoded.reserveCapacity(sources.count)
        for (i, source) in sources.enumerated() {
            try request?.check(nextAllocationBytes: min(source.utf8.count, VisionPreprocess.maxImageBytes * 2), phase: "image source decoding")
            do {
                let data = try VisionPreprocess.loadImageData(from: source)
                decoded.append(try sourceBatch.decode(data, request: request))
            } catch let failure as RequestFailure { throw failure }
            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
        }
        let decodedSeconds = RuntimeClock.seconds(since: started)
        let (visionConfig, pixelBounds) = try VisionTower.configuration(directory: modelDir)
        var items: [VisionPrompt.Item] = []
        items.reserveCapacity(decoded.count)
        var expandedCount = baseIds.count
        for (i, d) in decoded.enumerated() {
            try request?.check(phase: "image geometry")
            do {
                let plan = try VisionTower.plan(height: d.cg.height, width: d.cg.width,
                    cfg: visionConfig, bounds: pixelBounds)
                let (next, overflow) = expandedCount.addingReportingOverflow(plan.mergedTokens - 1)
                guard !overflow, next <= min(maxContextTokens, ContextPolicy.visionLimit) else {
                    throw RequestFailure(.contextLengthExceeded,
                        "image-expanded input exceeds the configured or qualified vision context; reduce the history or image count")
                }
                expandedCount = next
                items.append(VisionPrompt.Item(image: d.cg, plan: plan))
            } catch let failure as RequestFailure { throw failure }
            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
        }
        let towerStart = RuntimeClock.now()
        let workspace = items.map { ContextWorkspace.visionBytes(patches: $0.plan.patches,
            hidden: visionConfig.hiddenSize, heads: visionConfig.numHeads,
            queryTile: model.optimizations.visionQueryTile, padding: model.optimizations.visionAttentionPadding) }.max() ?? 0
        let vt = try ensureVisionTower(request: request, workspaceBytes: ContextBytes.sum(workspace, sourceBatch.chargedBytes))
        let towerReadySeconds = RuntimeClock.seconds(since: towerStart)
        // The template renders one `<|image_pad|>` per image; the tower
        // produces `mergedTokens` rows for it. Expanding the pad into a run of
        // that length is what makes the two line up, and it moves every token
        // after the first image — ids and segment offsets alike, in one sweep,
        // so a later prompt that extends this one keys identically.
        let imageId = model.cfg.imageTokenId
        let perImage = items.map { $0.plan.mergedTokens }
        var expanded: [Int] = []
        var segments: [ImageSegment] = []
        expanded.reserveCapacity(baseIds.count + perImage.reduce(0, +) - perImage.count)
        var imgIdx = 0
        for tok in baseIds {
            if tok == imageId, imgIdx < perImage.count {
                segments.append(
                    ImageSegment(
                        start: expanded.count, count: perImage[imgIdx], hash: decoded[imgIdx].hash))
                expanded.append(contentsOf: repeatElement(imageId, count: perImage[imgIdx]))
                imgIdx += 1
            } else {
                expanded.append(tok)
            }
        }
        // Both directions are checked. Too few placeholders means the template
        // did not render an image this code found; too many means something
        // else in the prompt tokenized to the placeholder id — a user who
        // typed the literal `<|image_pad|>`, for instance. Either way the rows
        // and the runs would not correspond, so the request stops here rather
        // than putting embeddings under the wrong tokens.
        guard imgIdx == items.count else {
            throw SlotstreamError.vision(
                "the chat template rendered \(imgIdx) image placeholders for \(items.count) "
                    + "images; slotstream cannot place the rest")
        }
        let placeholders = expanded.reduce(0) { $0 + ($1 == imageId ? 1 : 0) }
        guard placeholders == perImage.reduce(0, +) else {
            throw SlotstreamError.vision(
                "the prompt carries \(placeholders) image placeholder tokens but the images "
                    + "account for \(perImage.reduce(0, +)); remove any literal <|image_pad|> "
                    + "from the text")
        }
        guard expanded.count <= min(maxContextTokens, ContextPolicy.visionLimit) else {
            throw RequestFailure(.contextLengthExceeded, "image-expanded input exceeds the configured or qualified vision context limit")
        }
        let prompt = VisionPrompt(tower: vt, items: items, segments: segments, hiddenSize: model.cfg.hiddenSize)
        prompt.preparationRequest = request
        prompt.preparationObservation = ImagePreparationObservation(
            seconds: RuntimeClock.seconds(since: started), sourceDecodeSeconds: decodedSeconds,
            towerReadySeconds: towerReadySeconds, sampledFootprint: observer?.finish(),
            vmBefore: vmBefore, vmAfter: generator.footprintSampling ? ProcessMemory.vmActivity() : nil,
            sourceDecodedImages: sourceBatch.decodedImages, sourceReusedImages: sourceBatch.reusedImages,
            sourceAdmissionBytes: sourceBatch.chargedBytes)
        observationFinished = true
        return (expanded, prompt)
    }

    /// Every image a request carries, in the order the chat template will
    /// render them: message by message, part by part, and Ollama's per-message
    /// `images` array after that message's content parts — which is where the
    /// template puts them too.
    public static func imageSources(in messages: [[String: Any]]) -> [String] {
        var out: [String] = []
        for m in messages {
            if let content = m["content"] as? [[String: Any]] {
                for part in content {
                    if let iu = part["image_url"] as? [String: Any], let u = iu["url"] as? String {
                        out.append(u)
                    } else if let u = part["image_url"] as? String {
                        out.append(u)
                    } else if let u = part["image"] as? String {
                        out.append(u)
                    }
                }
            }
            for b64 in (m["images"] as? [String] ?? []) { out.append(b64) }
        }
        return out
    }

    /// Earliest position at which any stop sequence occurs, or nil.
    private static func stopIndex(_ text: String, _ stops: [String]) -> String.Index? {
        var best: String.Index?
        for s in stops {
            if let r = text.range(of: s), best == nil || r.lowerBound < best! {
                best = r.lowerBound
            }
        }
        return best
    }

    /// Serialized generation (single-flight; callers queue on the lock).
    ///
    /// Incremental detokenization consumes bounded groups of token ids, keeping
    /// incomplete UTF-8 bytes at the group boundary. Two rules matter:
    ///
    /// - Emission and stop holdback are by Unicode scalar, never Character. A
    ///   later token can contribute a scalar that merges into the grapheme
    ///   already sent (an emoji plus U+FE0F is still one Character).
    /// - While stop sequences are active, the last `maxStopLength - 1` scalars
    ///   are withheld, so the prefix of a stop sequence that straddles a token
    ///   boundary is never emitted before the rest of it arrives. Whatever is
    ///   still held back is flushed once generation ends.
    ///
    /// The invariant the tests hold this to: concatenating every streamed delta
    /// reproduces the non-streamed text exactly.
    public func generate(
        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        generate(promptIds: promptIds, params: params, vision: vision,
            shouldContinue: shouldContinue, onToken: onToken, request: nil)
    }

    public func generate(
        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil,
        request: RequestController?, onAdmitted: (() -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        let requestStart = RuntimeClock.now()
        let control: RequestController
        do {
            if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
            if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
            control = try request ?? beginRequest()
            try control.attachReservations(requestReservations)
            guard control.configuration.maxContextTokens <= allocatedContextTokens else {
                throw RequestFailure(.invalidConfiguration, "request policy exceeds the allocated engine window")
            }
            if let why = contextError(promptTokens: promptIds.count) {
                throw RequestFailure(.contextLengthExceeded, why)
            }
            guard promptIds.count <= control.configuration.maxContextTokens else {
                throw RequestFailure(.contextLengthExceeded, "prompt exceeds this request's configured context window")
            }
            try lock.lock(request: control)
        } catch {
            var stats = GenStats(); stats.promptTokens = promptIds.count
            let failure = error as? RequestFailure ?? RequestFailure(.inferenceError, String(describing: error))
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.memoryPressureCancelled = failure.code == .insufficientMemory
            if failure.code == .insufficientMemory, let ticket = pressureBoundary.snapshot() {
                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            stats.requestSeconds = request?.elapsedSeconds ?? RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        let queueSeconds = RuntimeClock.seconds(since: requestStart)
        let preparationSeconds = max(0, control.elapsedSeconds - queueSeconds)
        defer { control.releaseDispatchReservation(); lock.unlock() }
        var params = params.sanitized()
        // A queued request may acquire the lock before the waiting governor.
        // Refuse it before image encoding, cache checkout or GPU allocation.
        if let ticket = pressureBoundary.snapshot() {
            var stats = GenStats()
            stats.promptTokens = promptIds.count
            stats.memoryPressureCancelled = true
            let failure = control.fail(RequestFailure(.insufficientMemory,
                "memory pressure interrupted inference; retry after the cache resizes"))
            stats.requestFailure = failure; stats.runtimeError = failure.message
            stats.finishReason = "error"
            stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        let modeLimit = vision == nil ? ContextPolicy.modelLimit : ContextPolicy.visionLimit
        let effectiveWindow = min(maxContextTokens, control.configuration.maxContextTokens, modeLimit)
        guard promptIds.count <= effectiveWindow else {
            let failure = control.fail(RequestFailure(.contextLengthExceeded,
                "prompt exceeds the configured or qualified vision context window"))
            var stats = GenStats(); stats.promptTokens = promptIds.count
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.queueSeconds = queueSeconds; stats.preparationSeconds = preparationSeconds
            return ("", [], stats)
        }
        let room = max(0, effectiveWindow - promptIds.count)
        if room == 0 {
            if onAdmitted?() == false { control.cancel() }
            var stats = GenStats()
            if let failure = control.failure {
                stats.requestFailure = failure; stats.runtimeError = failure.message
            }
            stats.promptTokens = promptIds.count
            stats.finishReason = control.failure == nil ? "length" : "error"
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        // Context is prompt + completion, not two independent 32k allowances.
        params.maxTokens = min(params.maxTokens, room)
        let stops = params.stop
        let holdBack = stops.isEmpty
            ? 0 : max(0, (stops.map { $0.unicodeScalars.count }.max() ?? 1) - 1)
        var pendingIds: [Int] = []
        var withheld = ""
        var delivered = ""
        var lastTok = -1
        var clientGone = false
        var stopFound = false
        var firstTextSeconds: Double?
        var pressureObserved: PressureTicket?
        var pressureBoundarySeconds: Double?

        func observePressure() -> Bool {
            guard let ticket = pressureBoundary.snapshot() else { return false }
            control.fail(RequestFailure(.insufficientMemory,
                "memory pressure interrupted inference; retry after the cache resizes"))
            if pressureObserved == nil {
                pressureObserved = ticket
                pressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            return true
        }

        func emit(_ delta: String, _ tok: Int) -> Bool {
            if delta.isEmpty { return true }
            delivered += delta
            guard let cb = onToken else { return true }
            if firstTextSeconds == nil { firstTextSeconds = RuntimeClock.seconds(since: requestStart) }
            return cb(tok, delta)
        }

        /// Feed a stable decoded piece through the stop-sequence holdback.
        func feed(_ piece: String, final: Bool, tok: Int) -> Bool {
            withheld += piece
            if !stops.isEmpty, let cut = Self.stopIndex(withheld, stops) {
                _ = emit(String(withheld[..<cut]), tok)
                withheld = ""
                stopFound = true
                return false
            }
            let scalars = withheld.unicodeScalars
            let n = final ? scalars.count : max(0, scalars.count - holdBack)
            let delta = String(String.UnicodeScalarView(scalars.prefix(n)))
            withheld = String(String.UnicodeScalarView(scalars.dropFirst(n)))
            return emit(delta, tok)
        }

        /// Qwen's ByteLevel decoder is concatenative once a UTF-8 scalar is
        /// complete. Decode small bounded groups and retain four token bytes at
        /// the boundary; if the candidate still ends in U+FFFD, retain more.
        /// This makes streaming decode O(n), rather than decoding tokens 1...n
        /// after every generated token.
        func flushStablePrefix(_ tok: Int) -> Bool {
            guard !pendingIds.isEmpty else { return true }
            // Start from everything buffered and hand back one token at a time
            // while the decode still ends mid-scalar. Waiting for eight tokens
            // before the first flush and holding four back after it gave
            // clients one delta per four tokens, and no delta at all for a
            // reply shorter than eight; the byte-exactness this protects rests
            // on the replacement-character check below, not on the backlog.
            var n = pendingIds.count
            var piece = ""
            while n > 0 {
                piece = tokenizer.decode(
                    tokens: Array(pendingIds.prefix(n)), skipSpecialTokens: true)
                if !piece.hasSuffix("\u{FFFD}") { break }
                n -= 1
            }
            guard n > 0 else { return true }
            pendingIds.removeFirst(n)
            return feed(piece, final: false, tok: tok)
        }

        let needsIncrementalDecode = onToken != nil || !stops.isEmpty
        let tokenHandler: ((Int) -> Bool)? = needsIncrementalDecode ? { tok in
            control.sampledFirstToken()
            lastTok = tok
            pendingIds.append(tok)
            let ok = flushStablePrefix(tok)
            if !ok, !stopFound { clientGone = true }
            // A pressure event can arrive inside a client callback. This is
            // already a supported committed-emission boundary in both decode
            // paths; do not spend another forward before observing it.
            return ok && !observePressure()
        } : { _ in control.sampledFirstToken(); return !observePressure() }

        var (ids, stats) = generator.generate(
            promptIds: promptIds, params: params, eosIds: eosIds, cache: prefixCache,
            vision: vision,
            shouldContinue: {
                guard !clientGone, !stopFound else { return false }
                if observePressure() { return false }
                return shouldContinue?() ?? true
            }, onToken: tokenHandler, request: control, onAdmitted: onAdmitted)

        var text = tokenizer.decode(tokens: ids, skipSpecialTokens: true)
        if !stops.isEmpty, let cut = Self.stopIndex(text, stops) {
            text = String(text[text.startIndex ..< cut])
        }
        // The one full decode is both the non-streamed result and an exact final
        // reconciliation for the bounded incremental decoder.
        if !clientGone, control.failure == nil, stats.runtimeError == nil, onToken != nil {
            let target = text.unicodeScalars
            let sent = delivered.unicodeScalars
            if target.count >= sent.count, target.starts(with: sent) {
                _ = emit(String(String.UnicodeScalarView(target.dropFirst(sent.count))), lastTok)
            }
        }
        stats.queueSeconds = queueSeconds
        stats.preparationSeconds = preparationSeconds
        stats.memoryPressureCancelled = pressureObserved != nil
        if pressureObserved != nil {
            stats.runtimeError = stats.runtimeError
                ?? "memory pressure interrupted inference; retry after the cache resizes"
            stats.finishReason = "error"
        }
        stats.memoryPressureBoundarySeconds = pressureBoundarySeconds
        stats.firstTextSeconds = firstTextSeconds
        if let failure = control.failure {
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.memoryPressureCancelled = failure.code == .insufficientMemory
            // A request guard can see the ticket before the legacy continuation
            // callback runs. Preserve the same observed boundary in that path.
            if failure.code == .insufficientMemory, stats.memoryPressureBoundarySeconds == nil,
               let ticket = pressureBoundary.snapshot() {
                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            prefixCache.drop()
            Stream.gpu.synchronize()
            MLX.Memory.clearCache()
        }
        stats.requestSeconds = control.elapsedSeconds
        return (text, ids, stats)
    }
}

````````````

## Artifact SHA-256 673d9e4ef2d8d4299b5c227674efff8d714001869587773e77e1884233a2ede2

Encoding: `gzip+base64`. Original bytes: 75288.

````````````text
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
````````````

## Artifact SHA-256 eae1859a42fd26f102a624e66560f770e9860114a8eb7478b6920fcfc97055e6

Encoding: `utf-8`. Original bytes: 54782.

````````````text
// Qwen4Exp model assembly: 48 layers of (GDN | QSA) + MoE with
// hyper-connection residuals, PLE injection at the configured layer, and the
// final mixer + lm_head. Streams experts (SlotPool) and n-gram rows (NgramStore).

import Foundation
import MLX

public final class Qwen4ExpModel {
    /// All recurrent state and complete-prompt logits belong to this loaded model, even
    /// when another model has the same vocabulary and cache geometry.
    package let promptCheckpointIdentity = UUID()
    public let cfg: ModelConfig
    public let resident: ResidentWeights
    public let pool: SlotPool
    public let ngram: NgramStore
    public var optimizations: InferenceOptimizations
    /// Only the bounded long-context prefill path selects this arithmetic.
    /// Kept outside the independent optimization candidate bundle.
    package var smallPrefillSweep = false
    package var smallPrefillReferenceStart = 0
    package var smallPrefillReferenceEnd = ContextPolicy.modelLimit
    package var alignSmallReferenceDispatch = false
    package var stableSmallPrefillRouting = false
    package var stableSmallPrefillAttention = false
    package var stableSmallPrefillProjections = false
    public var paddedSmallKeyDomains: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallKeyDomains } }
    public var paddedSmallQueryRows: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallQueryRows } }
    public var smallPrefillSweeps: Int { moe.values.reduce(0) { $0 + $1.smallPrefillSweeps } }
    public var residentExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.residentPrelaunches } }
    public var residentExpertJoins: Int { moe.values.reduce(0) { $0 + $1.residentJoins } }
    public var residentExpertJoinSeconds: Double { moe.values.reduce(0) { $0 + $1.residentJoinSeconds } }
    public var sharedExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.sharedPrelaunches } }
    public var indexerSpecializedRows: Int { qsa.values.reduce(0) { $0 + $1.indexer.specializedRows } }
    private var routerCacheConfigured = false
    public var cachedRouterBytes: Int {
        moe.values.reduce(0) { $0 + $1.routerProjection.cachedBytes }
            + (mtpHead?.moe.routerProjection.cachedBytes ?? 0)
    }

    /// Request entry calls this before a cached MTP draft can advance. Direct
    /// model callers also prepare before touching main recurrent state.
    public var compiledNormFinishes: Int {
        (attnHC + mlpHC + [mixer]).reduce(0) { $0 + $1.compiledFinishes }
    }
    public var readHandleCount: Int { pool.readHandleCount + ngram.readHandleCount }
    public var selectedAttentionTiles: Int {
        qsa.values.reduce(0) { $0 + $1.selectedAttentionTiles } + (mtpHead?.attn.selectedAttentionTiles ?? 0)
    }
    public private(set) var terminalQueryRowsSkipped = 0
    public private(set) var terminalMoERowsSkipped = 0
    private enum HiddenDemand { case fullMulti, stateOnly, lastRow }
    private var compiledNormConfigured = false
    /// Lazy dispatch counters; GPU completion is established by evaluated outputs,
    /// never inferred from these scheduled-operation counts alone.
    public var fusedRoPERotationsScheduled: Int { rope.fusedRotationsScheduled }
    public var ropeTableHits: Int { rope.tableHits }
    public var ropeTableBuilds: Int { rope.tableBuilds }
    public var fusedGDNProjectionsScheduled: Int { gdn.values.reduce(0) { $0 + $1.fusedProjectionsScheduled } }
    func prepareOptimizationKernels() {
        for layer in gdn.values { layer.fuseInputProjection = optimizations.fusedGDNProjection }
        rope.sharedTables = optimizations.sharedRoPE
        rope.fusedRotation = optimizations.fusedRoPE && PartialRotation.prepare()
        let selected = optimizations.selectedTextAttention && SelectedAttention.prepare()
        for layer in qsa.values { layer.selectedAttention = selected }
        mtpHead?.attn.selectedAttention = selected
        pool.directReadHandles = optimizations.directReadHandles
        ngram.directReadHandles = optimizations.directReadHandles
        let compiledNorm = optimizations.compiledNormFinish && CompiledArithmetic.prepare()
        if compiledNorm != compiledNormConfigured {
            for unit in attnHC + mlpHC + [mixer] { unit.compiledNormFinish = compiledNorm }
            compiledNormConfigured = compiledNorm
        }
        mtpHead?.attnHC.compiledNormFinish = compiledNorm
        mtpHead?.mlpHC.compiledNormFinish = compiledNorm
        mtpHead?.mixer.compiledNormFinish = compiledNorm
        ngram.ringEvictionOrder = optimizations.ngramRingOrder
        pool.denseLookup = optimizations.denseExpertLookup
        pool.sparsePinClearing = optimizations.sparsePoolPins
        pool.contiguousSlotWrites = optimizations.contiguousSlotWrites
        pool.wordSlotWrites = optimizations.wordSlotWrites
        pool.cpuSlotWrites = optimizations.cpuSlotWrites
        pool.layerLocalFloorEviction = optimizations.layerLocalFloorCache
        if routerCacheConfigured != optimizations.cachedRouterWeights {
            for layer in moe.values { layer.routerProjection.configure(cached: optimizations.cachedRouterWeights) }
            routerCacheConfigured = optimizations.cachedRouterWeights
        }
        mtpHead?.moe.routerProjection.configure(cached: optimizations.cachedRouterWeights)
        if optimizations.routerTopK { RouterSelection.prepare() }
        if optimizations.indexerBlockTopK { BlockSelection.prepare() }
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
    }

    let rope: Rope
    var gdn: [Int: GDNLayer] = [:]
    var qsa: [Int: QSAAttention] = [:]
    var moe: [Int: MoELayer] = [:]
    var attnHC: [GatedResidual] = []
    var mlpHC: [GatedResidual] = []
    var ple: [Int: PLELayer] = [:]
    let mixer: GatedResidual
    let lmHead: QLinear
    /// The optional MTP draft head for self-speculative decode; loaded from
    /// mtp.safetensors on demand (`enableMTP`), everything resident.
    public private(set) var mtpHead: MTPHead? = nil
    /// Diagnostic observer; called on the serialized model thread with router-rank IDs.
    public var routerObserver: ((Int, [Int32]) -> Void)?
    package var contextNumericsObserver: ((Int, String, MLXArray) -> Void)?
    package var gdnPhaseProfile: GDNPhaseProfile? {
        didSet { for layer in gdn.values { layer.phaseProfile = gdnPhaseProfile } }
    }
    public let runLayers: Int  // truncated for parity rigs; numLayers normally

    public final class State {
        var modelIdentity: UUID?
        package var ownerModelIdentity: UUID? { modelIdentity }
        let checkpointIdentity = UUID()
        var checkpointLifetimes: [WeakStateCheckpointLifetime] = []
        var recordingEnabled = false
        var recordedTokenIds: [Int]?
        var recordingBaseTokenCount: Int?
        var linear: [Int: LinearCache] = [:]
        var kv: [Int: KVCache] = [:]
        var indexer: [Int: IndexerCache] = [:]
        var ngramCtx: [Int64] = []
        public var tokenCount = 0
        // A failed low-level forward can change early layers while tokenCount
        // still names the preceding boundary. Count alone cannot certify reuse.
        var committedBoundaryValid = true
        /// Speculative-decode companions, created lazily by the MTP-aware
        /// generate path: the draft head's own attention state, and the
        /// pre-mixer multi stream at the last consumed position (the next
        /// draft step's hidden input). They ride the prefix cache with the
        /// rest of the state so conversations keep their draft context.
        public var mtp: MTPState?
        public var lastMulti: MLXArray?
        /// A draft pointer alone is insufficient: plain inference may have
        /// advanced the main prefix since the draft cache was last updated.
        public var hasValidMTP: Bool {
            guard let row = lastMulti, row.ndim == 3, row.dim(0) == 1, row.dim(1) == 1 else { return false }
            return mtp?.isAligned(withConsumedTokens: tokenCount) == true
        }
        public func invalidateMTP() { mtp = nil; lastMulti = nil }
        /// Allocated sequence buffers, including unused capacity after trim.
        /// Recurrent state, convolution windows and allocator cache are separate.
        public var allocatedSequenceBytes: Int {
            kv.values.reduce(0) { $0 + $1.allocatedBytes }
                + indexer.values.reduce(0) { $0 + $1.allocatedBytes }
                + (mtp.map { $0.kv.allocatedBytes + $0.indexer.allocatedBytes } ?? 0)
        }
        var compactStateWindows = false
        public init() {}
    }

    public convenience init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil) throws {
        try self.init(index: index, poolSlots: poolSlots, runLayers: runLayers, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil, embeddingRowCache: Bool?,
                 packGDNProjections: Bool? = nil) throws {
        self.optimizations = try InferenceOptimizations.environment()
        try ModelProcessGuard.acquire()
        self.cfg = index.config
        let selectedLayers = runLayers ?? index.config.numLayers
        guard selectedLayers >= 1, selectedLayers <= index.config.numLayers else {
            throw ModelError(
                "layer count must be between 1 and \(index.config.numLayers), got \(selectedLayers)")
        }
        guard poolSlots >= 1, poolSlots <= Geometry.totalRecords else {
            throw ModelError(
                "expert-pool slot count must be between 1 and \(Geometry.totalRecords), got \(poolSlots)")
        }
        self.runLayers = selectedLayers
        let store = try ExpertStore(index: index)
        // Reject a wrong/custom checkpoint before allocating the 3.8 GB
        // resident trunk or the expert pool.
        try Geometry.check(against: index.config, recordBytes: store.recordBytes)
        // Explicit experimental startup path: full-file verification precedes
        // resident/pool allocation. Default construction needs no repack.
        if let path = ProcessInfo.processInfo.environment["SLOTSTREAM_EXPERT_LAYOUT"] {
            guard !path.isEmpty else { throw ModelError("SLOTSTREAM_EXPERT_LAYOUT must name a packed artifact directory") }
            let report = try store.loadPackedLayout(at:URL(fileURLWithPath:path,isDirectory:true))
            fputs("[expert-layout] verified \(report.bytes) bytes in \(report.seconds) s\n",stderr)
        }
        // parity rigs keep the truncated layers' experts resident? no — pool serves them
        self.resident = try ResidentWeights(index: index, embeddingRowCache: embeddingRowCache,
            packGDNProjections: packGDNProjections ?? optimizations.fusedGDNProjection)
        self.pool = SlotPool(slots: poolSlots, store: store)
        self.ngram = NgramStore(index: index, resident: resident)
        self.rope = Rope(dim: cfg.rotaryDim, base: cfg.ropeTheta)

        for l in 0 ..< self.runLayers {
            let base = "model.layers.\(l)"
            if cfg.layerTypes[l] == "linear_attention" {
                gdn[l] = GDNLayer(resident, layer: l)
            } else {
                qsa[l] = QSAAttention(resident, layer: l)
            }
            moe[l] = MoELayer(resident, layer: l, pool: pool)
            attnHC.append(GatedResidual(resident, base: base + ".attn_hyper_connection", useCombine: true))
            mlpHC.append(GatedResidual(resident, base: base + ".mlp_hyper_connection", useCombine: true))
            if cfg.pleLayerIndices.contains(l) {
                ple[l] = PLELayer(resident, layer: l, store: ngram)
            }
        }
        if Self.debugDir != nil { attnHC[0].debugName = "hc0" }
        mixer = GatedResidual(resident, base: "model.hyper_connection_mixer", useCombine: false)
        lmHead = resident.linear("lm_head")
    }

    /// The model's rotary embedding (the MTP head shares it).
    public var sharedRope: Rope { rope }

    /// lm_head applied to a draft-head sample hidden — the draft's logits.
    public func draftLogits(_ sample: MLXArray) -> MLXArray { lmHead(sample) }

    /// Load the MTP draft head (1.5 GB resident). Idempotent; throws when
    /// mtp.safetensors is absent.
    public func enableMTP(modelDir: URL) throws {
        guard mtpHead == nil else { return }
        mtpHead = MTPHead(try MTPWeights(modelDir: modelDir, config: cfg))
    }

    /// Conservative capacity needed before a request grows its sequence
    /// caches. Charges allocation steps, completed-block storage and the draft
    /// head when it may be used; it performs no allocation or GPU evaluation.
    public func sequenceCapacityBytes(tokens: Int, mtp: Bool) -> Int {
        let layers = cfg.layerTypes.prefix(runLayers).filter { $0 != "linear_attention" }.count + (mtp ? 1 : 0)
        let rowBytes = (2 * cfg.numKVHeads * cfg.headDim + cfg.indexerHeadDim) * 2
        return ContextGeometry.capacityBytes(tokens: tokens, layers: layers, rowBytes: rowBytes,
            pooledRowBytes: cfg.indexerHeadDim * 2, compressionRatio: cfg.indexerCompressRatio,
            indexerBudget: cfg.indexerBudget, incrementalIndexer: optimizations.incrementalIndexer)
    }

    /// Bound the next physical sequence allocations, keeping main, draft,
    /// raw-indexer and pooled-indexer capacity separate. Rollback retains spare
    /// rows, but they can only be reused by the buffer that actually owns them.
    package func sequenceAllocationBytes(tokens: Int, draftTokens: Int?, state: State,
                                         sharedBacking: Bool = false) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit,
              draftTokens.map({ $0 >= 0 && $0 <= ContextPolicy.modelLimit }) ?? true else { return Int.max }
        let kvRowBytes = ContextBytes.product(cfg.numKVHeads, cfg.headDim, 2)
        let indexRowBytes = ContextBytes.product(cfg.indexerHeadDim, 2)
        func bytes(_ end: Int, kv: KVCache?, index: IndexerCache?, compact: Bool) -> Int {
            func replacement(_ count: Int, _ rowBytes: Int, _ owned: Int, step: Int = 1024) -> Int {
                ContextGeometry.nextBufferAllocationBytes(tokens: count, rowBytes: rowBytes,
                    allocatedBytes: sharedBacking ? 0 : owned, step: step)
            }
            let rawBase = index?.rawBase ?? 0
            guard end >= rawBase else { return Int.max }
            var result = ContextBytes.sum(
                replacement(end, kvRowBytes, kv?.keys?.nbytes ?? 0),
                replacement(end, kvRowBytes, kv?.values?.nbytes ?? 0),
                replacement(end - rawBase, indexRowBytes, index?.rawAllocatedBytes ?? 0,
                    step: compact && rawBase > 0 ? 256 : 1024))
            if end > cfg.indexerBudget, optimizations.incrementalIndexer || compact {
                let blocks = end / cfg.indexerCompressRatio
                result = ContextBytes.sum(result, replacement(blocks, indexRowBytes,
                    index?.pooledAllocatedBytes ?? 0, step: 256))
                if compact {
                    let first = min(blocks * cfg.indexerCompressRatio,
                        max(0, end - 32) / cfg.indexerCompressRatio * cfg.indexerCompressRatio)
                    if first - rawBase >= 256 {
                        // Compaction also creates a fresh small tail before
                        // releasing its parent; it is not a pre-allocation credit.
                        result = ContextBytes.sum(result, replacement(end - first, indexRowBytes, 0, step: 256))
                    }
                }
            }
            return result
        }
        var total = 0
        for layer in 0 ..< runLayers where cfg.layerTypes[layer] != "linear_attention" {
            let index = state.indexer[layer]
            total = ContextBytes.sum(total, bytes(tokens, kv: state.kv[layer], index: index,
                compact: index?.compactRaw ?? optimizations.compactIndexerRaw))
        }
        if let draftTokens {
            total = ContextBytes.sum(total, bytes(draftTokens, kv: state.mtp?.kv,
                index: state.mtp?.indexer, compact: state.mtp?.indexer.compactRaw ?? false))
        }
        return total
    }

    public func makeState() -> State {
        let s = State()
        s.modelIdentity = promptCheckpointIdentity
        s.ngramCtx = Array(repeating: Int64(cfg.eosTokenId), count: cfg.ngramSize - 1)
        for l in 0 ..< runLayers {
            if cfg.layerTypes[l] == "linear_attention" {
                s.linear[l] = LinearCache()
            } else {
                s.kv[l] = KVCache()
                s.indexer[l] = IndexerCache(compactRaw: optimizations.compactIndexerRaw)
            }
        }
        return s
    }

    /// One forward pass over `ids` (1, S). Returns final hidden (1, S, hidden).
    /// `perLayerHook` (parity rigs) receives the hyper-width h after each layer.
    /// Read once: ProcessInfo builds a fresh dictionary on every access, and
    /// this used to run 48 times per token.
    static let debugDir = ProcessInfo.processInfo.environment["SS_DEBUG_DIR"]
    static let debugLayer = Int(ProcessInfo.processInfo.environment["SS_DEBUG_LAYER"] ?? "0") ?? 0

    static func debugDump(_ name: String, _ arr: MLXArray) {
        guard let dir = debugDir else { return }
        let v = arr.asType(.float32).asArray(Float.self)
        let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
        try? d.write(to: URL(fileURLWithPath: dir).appendingPathComponent(name + ".bin"))
    }

    /// Replace the embeddings under each placeholder run with the tower's rows.
    ///
    /// The template expands one `<|image_pad|>` per image into a run of them,
    /// so what has to happen is a substitution of contiguous spans — which is
    /// what this does, entirely on the GPU. The first version copied the whole
    /// hidden to the CPU as float32, looped over `S × hidden` scalars, and
    /// uploaded it again, on every prefill pass of every vision request. It
    /// also scanned the ids for placeholders and, when the count disagreed with
    /// the rows it was given, logged a line and continued with unspliced
    /// placeholder embeddings — a silently wrong answer. A run carries its own
    /// rows, so the two cannot disagree; a wrong offset is a programming error
    /// and stops here.
    public static func spliceVision(
        _ h: MLXArray, runs: [VisionRun], length S: Int, hidden: Int
    ) -> MLXArray {
        var pieces: [MLXArray] = []
        var cursor = 0
        for run in runs.sorted(by: { $0.start < $1.start }) {
            precondition(
                run.start >= cursor && run.end <= S,
                "vision run \(run.start)..<\(run.end) outside 0..<\(S) or overlapping")
            if run.start > cursor { pieces.append(h[0..., cursor ..< run.start, 0...]) }
            pieces.append(run.rows.reshaped([1, run.count, hidden]).asType(h.dtype))
            cursor = run.end
        }
        if cursor < S { pieces.append(h[0..., cursor ..< S, 0...]) }
        return pieces.count == 1 ? pieces[0] : concatenated(pieces, axis: 1)
    }

    public func hiddenStates(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) -> MLXArray {
        checkpointCompatibility { try hiddenStatesChecked(ids, state: state, vision: vision, perLayerHook: perLayerHook) }
    }

    /// A read error may leave this caller-owned state partially advanced.
    /// Discard it or restore a prior checkpoint before any reuse. Generator
    /// performs that cleanup for its checked forward calls.
    public func hiddenStatesChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        let h = try hiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)
        return mixScope(h)
    }

    private func hiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        try runHiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)!
    }

    private func validateForward(_ ids: [Int], state: State) throws {
        guard !ids.isEmpty, ids.allSatisfy({ $0 >= 0 && $0 < cfg.vocabSize }) else {
            throw ModelError("model forward requires a nonempty sequence of valid token IDs")
        }
        guard state.committedBoundaryValid else {
            throw ModelError("model state has an incomplete forward; restore a committed checkpoint or create a new state")
        }
        // State() and tokenCount are public API. Reject an uninitialized,
        // incompatible or offset-corrupted state before changing any cache;
        // otherwise QSA's required cache access can trap after early layers
        // have already advanced. MTP alignment is intentionally checked by
        // its own lifecycle: target verification may have a provisional head.
        guard state.modelIdentity == promptCheckpointIdentity,
              state.tokenCount >= 0, ids.count <= Int(Int32.max),
              state.tokenCount <= Int(Int32.max) - ids.count,
              state.linear.count == gdn.count,
              state.kv.count == qsa.count, state.indexer.count == qsa.count,
              gdn.keys.allSatisfy({ state.linear[$0] != nil }),
              qsa.keys.allSatisfy({ state.kv[$0]?.offset == state.tokenCount
                  && state.indexer[$0]?.offset == state.tokenCount }) else {
            throw ModelError("model state is uninitialized, incompatible or offset-inconsistent; use makeState() or restore a committed checkpoint")
        }
    }

    private func runHiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil,
        computeRanges: [Range<Int>]? = nil, shouldContinue: (() -> Bool)? = nil,
        demand: HiddenDemand = .fullMulti
    ) throws -> MLXArray? {
        try validateForward(ids, state: state)
        state.recordedTokenIds = state.recordingEnabled ? ids : nil
        state.recordingBaseTokenCount = state.recordingEnabled ? state.tokenCount : nil
        state.committedBoundaryValid = false
        let S = ids.count
        let referenceRows: Int
        if alignSmallReferenceDispatch, smallPrefillSweep, state.tokenCount >= smallPrefillReferenceStart,
           state.tokenCount < smallPrefillReferenceEnd {
            let blockStart = smallPrefillReferenceStart + ((state.tokenCount - smallPrefillReferenceStart) / 256) * 256
            referenceRows = min(256, smallPrefillReferenceEnd - blockStart)
        } else { referenceRows = 256 }
        let projectionRows = stableSmallPrefillProjections && smallPrefillSweep && S < referenceRows ? referenceRows : 0
        let ranges = computeRanges ?? stride(from: 0, to: S, by: 4096).map { $0 ..< min(S, $0 + 4096) }
        let layerMajor = optimizations.layerExpertWorkspace && ranges.count > 1
        // Public full-output APIs, MTP and truncated diagnostic models retain
        // all rows. The pinned final layer is QSA; no recurrent update is
        // inferred from a configuration label or omitted for another family.
        let terminalPruning = optimizations.terminalPrefillPruning && mtpHead == nil
            && runLayers == cfg.numLayers && qsa[runLayers - 1] != nil
            && perLayerHook == nil && demand != .fullMulti
        let terminalLastQuery = terminalPruning && optimizations.terminalLastQuery && demand == .lastRow
        if layerMajor {
            precondition(optimizations.compactStateWindows && optimizations.boundedIndexer && optimizations.boundedPLE
                && !state.linear.values.contains(where: { $0.record }),
                "a larger layer workspace requires bounded state, indexer, PLE and a non-recording prefill")
        }
        // A workspace holds a full layer of expert weights while reducing
        // routed tiles. Freed MLX buffers must not coexist with that live
        // allocation: its cache limit admits one last whole buffer and can
        // overshoot the requested byte limit. Clear only disposable buffers;
        // expert residency, tensor shapes and evaluation order stay intact.
        let savedWorkspaceCacheLimit = optimizations.layerExpertWorkspace && S >= SweepTuning.minTokens
            ? MLX.Memory.cacheLimit : nil
        if savedWorkspaceCacheLimit != nil {
            MLX.Memory.cacheLimit = 0
            MLX.Memory.clearCache()
        }
        defer {
            if let savedWorkspaceCacheLimit { MLX.Memory.cacheLimit = savedWorkspaceCacheLimit }
        }
        prepareOptimizationKernels()
        pool.workspacePiecewiseWrites = optimizations.workspacePiecewiseWrites
        state.compactStateWindows = optimizations.compactStateWindows
        ngram.compactRows = optimizations.compactNgramRows
        mtpHead?.attn.indexer.incrementalBlocks = optimizations.incrementalIndexer
        mtpHead?.attn.boundedIndexer = optimizations.boundedIndexer
        mtpHead?.attn.indexer.denseBypass = optimizations.denseIndexerBypass
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        var h0 = try resident.embedChecked(ids, shape: [1, S]).asType(.bfloat16)
        if !vision.isEmpty { h0 = Self.spliceVision(h0, runs: vision, length: S, hidden: cfg.hiddenSize) }
        Self.debugDump("embed", h0)
        var h = tiled(h0, repetitions: [1, 1, cfg.hcCount])

        // n-gram history: rolling context + new ids
        let history = state.ngramCtx + ids.map { Int64($0) }
        state.ngramCtx = Array(history.suffix(cfg.ngramSize - 1))
        let lookahead = optimizations.ngramLookahead && S >= 16 && runLayers > ngram.pleLayerIndex
            ? try ngram.beginPrefetch(history:history,nNew:S,maxTokens:optimizations.boundedPLE || layerMajor ? 256 : 1024) : nil
        defer { if let lookahead { ngram.discardPrefetch(lookahead) } }

        for l in 0 ..< runLayers {
            if shouldContinue?() == false { return nil }
            if MemTrace.on { MemTrace.enterLayer(l, kind: gdn[l] != nil ? "gdn" : "qsa") }
            moe[l]!.specializedRouter = optimizations.routerTopK
            moe[l]!.overlapShared = optimizations.overlapSharedExpert
            moe[l]!.overlapResident = optimizations.overlapResidentExperts
            qsa[l]?.indexer.denseBypass = optimizations.denseIndexerBypass
            qsa[l]?.indexer.specializedSelector = optimizations.indexerBlockTopK
            moe[l]!.workspaceComputeRanges = layerMajor ? ranges : []
            moe[l]!.workspaceTokenTile = optimizations.workspaceTokenTile
            attnHC[l].minimumProjectionRows = projectionRows
            mlpHC[l].minimumProjectionRows = projectionRows
            gdn[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.indexer.minimumProjectionRows = projectionRows
            ple[l]?.minimumProjectionRows = projectionRows
            moe[l]!.minimumProjectionRows = projectionRows
            if terminalPruning, l == runLayers - 1, demand == .stateOnly, layerMajor {
                let historyBase = history.count - S
                for range in ranges {
                    var hidden = h[0..., range, 0...]
                    if let p = ple[l] {
                        p.boundedTokens = true
                        let begin = max(0, historyBase + range.lowerBound - (cfg.ngramSize - 1))
                        hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + range.upperBound]),
                            nNew: range.count, cache: state.linear[l])
                    }
                    let x = attnHC[l](hidden).0
                    qsa[l]!.appendKeysOnly(x, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                    if shouldContinue?() == false { return nil }
                }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            if layerMajor {
                // Preserve the established 4096-token compute shapes while
                // sharing expert reads over the whole layer frontier.
                var bases: [MLXArray] = [], inputs: [MLXArray] = [], injections: [MLXArray] = []
                let historyBase = history.count - S
                for range in ranges {
                    let (lo, hi) = (range.lowerBound, range.upperBound)
                    let begin = max(0, historyBase + lo - (cfg.ngramSize - 1))
                    let lastQuery = terminalLastQuery && l == runLayers - 1
                    if lastQuery && hi < S {
                        // Earlier tiles contribute only persistent keys. Keep
                        // each original PLE/HC/projection compute shape.
                        var hidden = h[0..., lo ..< hi, 0...]
                        if let p = ple[l] {
                            p.boundedTokens = true
                            hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + hi]),
                                nNew: hi - lo, cache: state.linear[l])
                        }
                        qsa[l]!.appendKeysOnly(attnHC[l](hidden).0, rope: rope,
                            cache: state.kv[l]!, idxCache: state.indexer[l]!)
                        if shouldContinue?() == false { return nil }
                        continue
                    }
                    let prepared = try prepareScopeAttention(layer: l, hidden: h[0..., lo ..< hi, 0...],
                        history: Array(history[begin ..< historyBase + hi]), state: state, lastQueryOnly: lastQuery)
                    eval(prepared.base, prepared.input, prepared.injection)
                    state.linear[l]?.compactWindows()
                    if shouldContinue?() == false { return nil }
                    bases.append(prepared.base); inputs.append(prepared.input); injections.append(prepared.injection)
                }
                let base = concatenated(bases, axis: 1)
                let input = concatenated(inputs, axis: 1)
                let injection = concatenated(injections, axis: 1)
                if optimizations.compactScopeFrontier {
                    // The previous frontier and the component arrays are no
                    // longer needed after their joined values materialize.
                    // Release them before loading the full expert workspace.
                    eval(base, input, injection)
                    bases.removeAll(); inputs.removeAll(); injections.removeAll()
                    h = base
                }
                MemTrace.mark("scope-frontier", nil)
                moe[l]!.routerObserver = routerObserver
                moe[l]!.useLayerWorkspace = true
                if terminalPruning, l == runLayers - 1, demand == .lastRow {
                    moe[l]!.useLayerWorkspace = false
                    moe[l]!.workspaceComputeRanges = []
                    let row = input.dim(1) - 1
                    let output = try moe[l]!(input[0..., row..., 0...])
                    h = base[0..., row..., 0...] + (output.expandedDimensions(axis: -2)
                        * injection[0..., row..., 0...].expandedDimensions(axis: -1)).reshaped([1, 1, cfg.hcCount * cfg.hiddenSize])
                    terminalMoERowsSkipped += S - 1
                    if terminalLastQuery { terminalQueryRowsSkipped += S - input.dim(1) }
                } else {
                    let output = try moe[l]!(input)
                    h = base + (output.expandedDimensions(axis: -2)
                        * injection.expandedDimensions(axis: -1)).reshaped(base.shape)
                }
                eval(h)
                MemTrace.mark("layer-end", h)
                perLayerHook?(l, h)
                continue
            }
            if let p = ple[l] {
                p.boundedTokens = optimizations.boundedPLE
                h = try h + p(h, history: history, nNew: S, cache: state.linear[l] ?? nil)
                MemTrace.mark("ple", h)
            }
            let dbgLayer = Self.debugLayer
            let (x1, inj1) = attnHC[l](h)
            if l == dbgLayer { Self.debugDump("x1", x1); Self.debugDump("inj1", inj1!) }
            contextNumericsObserver?(l, "x1", x1)
            contextNumericsObserver?(l, "inj1", inj1!)
            MemTrace.mark("hc1", x1)
            if terminalPruning, l == runLayers - 1, demand == .stateOnly {
                qsa[l]!.appendKeysOnly(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                if shouldContinue?() == false { return nil }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            let attnOut: MLXArray
            if let g = gdn[l] {
                g.fusedRecording = optimizations.fusedGDNRecording
                attnOut = g(x1, cache: state.linear[l])
            } else {
                qsa[l]!.stableSmallKeyDomain = stableSmallPrefillAttention && smallPrefillSweep
                qsa[l]!.smallReferenceStart = smallPrefillReferenceStart
                qsa[l]!.smallReferenceEnd = smallPrefillReferenceEnd
                qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
                qsa[l]!.boundedIndexer = optimizations.boundedIndexer
                attnOut = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!,
                    lastQueryOnly: terminalLastQuery && l == runLayers - 1)
            }
            contextNumericsObserver?(l, "attn", attnOut)
            MemTrace.mark("attn", attnOut)
            if l == dbgLayer { Self.debugDump("attn", attnOut) }
            let lastQuery = terminalLastQuery && l == runLayers - 1
            let attentionInjection: MLXArray
            if lastQuery {
                let first = S - attnOut.dim(1)
                h = h[0..., first..., 0...]
                attentionInjection = inj1![0..., first..., 0...]
                terminalQueryRowsSkipped += first
            } else { attentionInjection = inj1! }
            h = h + (attnOut.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1))
                .reshaped(h.shape)
            contextNumericsObserver?(l, "hAfterAttn", h)
            if l == dbgLayer { Self.debugDump("hAfterAttn", h) }

            let pruneLastMoE = terminalPruning && l == runLayers - 1 && demand == .lastRow
            let (fullMLPInput, fullMLPInjection) = mlpHC[l](h)
            let mlpRow = h.dim(1) - 1
            let x2 = pruneLastMoE ? fullMLPInput[0..., mlpRow..., 0...] : fullMLPInput
            let inj2 = pruneLastMoE ? fullMLPInjection![0..., mlpRow..., 0...] : fullMLPInjection
            if pruneLastMoE {
                h = h[0..., mlpRow..., 0...]
                terminalMoERowsSkipped += S - 1
            }
            if l == dbgLayer { Self.debugDump("x2", x2) }
            contextNumericsObserver?(l, "x2", x2)
            contextNumericsObserver?(l, "inj2", inj2!)
            MemTrace.mark("hc2", x2)
            moe[l]!.routerObserver = routerObserver
            moe[l]!.useLayerWorkspace = optimizations.layerExpertWorkspace
            moe[l]!.disjointOutput = optimizations.disjointSweepOutput
            moe[l]!.boundedRows = optimizations.boundedSweepRows
            // A canonical terminal pass shorter than 256 uses the pool path.
            // Its smaller subpasses must preserve that expert arithmetic too.
            moe[l]!.smallPrefillSweep = smallPrefillSweep && referenceRows == 256
            moe[l]!.routerProjection.minimumRows = stableSmallPrefillRouting && smallPrefillSweep && S < referenceRows ? referenceRows : 0
            if let observe = contextNumericsObserver {
                moe[l]!.contextNumericsObserver = { name, value in observe(l, name, value) }
            } else { moe[l]!.contextNumericsObserver = nil }
            let moeOut = try moe[l]!(x2)
            contextNumericsObserver?(l, "moe", moeOut)
            if l == dbgLayer { Self.debugDump("moe", moeOut) }
            MemTrace.mark("moe", moeOut)
            h = h + (moeOut.expandedDimensions(axis: -2) * inj2!.expandedDimensions(axis: -1))
                .reshaped(h.shape)

            // synchronize the layer so pool references release before the next
            // layer's ensure() scatters (keeps slot writes in place, see PLAN §4.2)
            eval(h)
            // The layer has finished reading the convolution parent. Compact
            // only multi-token passes; a one-token decode parent is bounded
            // to the small convolution window plus one row already.
            if optimizations.compactStateWindows, S > 1 {
                state.linear[l]?.compactWindows()
            }
            MemTrace.mark("layer-end", h)
            perLayerHook?(l, h)
        }
        if shouldContinue?() == false { return nil }
        state.tokenCount += S
        state.committedBoundaryValid = true
        return h
    }

    private func mixScope(_ h: MLXArray, computeRanges: [Range<Int>]? = nil) -> MLXArray {
        let ranges = computeRanges ?? stride(from: 0, to: h.dim(1), by: 4096).map { $0 ..< min(h.dim(1), $0 + 4096) }
        guard optimizations.layerExpertWorkspace, ranges.count > 1 else { return mixer(h).0 }
        var outputs: [MLXArray] = []
        for range in ranges {
            let mixed = mixer(h[0..., range, 0...]).0
            eval(mixed); outputs.append(mixed)
        }
        return concatenated(outputs, axis: 1)
    }

    private func prepareScopeAttention(layer l: Int, hidden: MLXArray, history: [Int64], state: State, lastQueryOnly: Bool = false)
        throws -> (base: MLXArray, input: MLXArray, injection: MLXArray) {
        var h = hidden
        if let p = ple[l] {
            p.boundedTokens = true
            h = try h + p(h, history: history, nNew: h.dim(1), cache: state.linear[l])
        }
        let (x1, inject) = attnHC[l](h)
        let attention: MLXArray
        if let g = gdn[l] {
            g.fusedRecording = optimizations.fusedGDNRecording
            attention = g(x1, cache: state.linear[l])
        } else {
            qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
            qsa[l]!.boundedIndexer = true
            attention = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!, lastQueryOnly: lastQueryOnly)
        }
        let attentionInjection: MLXArray
        if lastQueryOnly {
            let first = h.dim(1) - attention.dim(1)
            h = h[0..., first..., 0...]
            attentionInjection = inject![0..., first..., 0...]
        } else { attentionInjection = inject! }
        h = h + (attention.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1)).reshaped(h.shape)
        let (x2, inject2) = mlpHC[l](h)
        return (h, x2, inject2!)
    }

    /// Transactional prefill: only a completed whole-model scope is reusable.
    /// The checkpoint owns old recurrent states; append-only sequence caches
    /// restore logical offsets while retaining (and charging) grown capacity.
    package func consumeReadScope(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?) -> (logits: MLXArray?, committed: Bool) {
        checkpointCompatibility {
            try consumeReadScopeChecked(ids, passes: passes, state: state, vision: vision,
                head: head, final: final, shouldContinue: shouldContinue)
        }
    }

    package func consumeReadScopeChecked(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?) throws -> (logits: MLXArray?, committed: Bool) {
        precondition(!passes.isEmpty && passes.allSatisfy { $0 > 0 } && passes.reduce(0, +) == ids.count)
        try validateForward(ids, state: state)
        var offset = 0
        let ranges = passes.map { n -> Range<Int> in
            defer { offset += n }; return offset ..< offset + n
        }
        let checkpoint = state.checkpoint()
        var committed = false
        defer {
            if !committed { state.restore(checkpoint); state.setRecording(false) }
        }
        let demand: HiddenDemand = head != nil ? .fullMulti
            : final ? .lastRow : optimizations.demandedPrefillOutput ? .stateOnly : .fullMulti
        guard let multi = try runHiddenMulti(ids, state: state, vision: vision,
            computeRanges: ranges, shouldContinue: shouldContinue, demand: demand) else { return (nil, false) }
        if let head {
            for range in ranges {
                if shouldContinue?() == false { return (nil, false) }
                state.lastMulti = try head.consumeChecked(chunk: Array(ids[range]),
                    chunkMulti: multi[0..., range, 0...], prevMulti: state.lastMulti,
                    resident: resident, rope: rope, state: state.mtp!,
                    vision: vision.compactMap { $0.clipped(to: range.lowerBound, range.upperBound) },
                    compactRetainedRow: optimizations.compactMTPRow)
            }
        }
        var logits: MLXArray?
        if final || !optimizations.demandedPrefillOutput {
            let mixed = mixScope(multi, computeRanges: multi.dim(1) == ids.count ? ranges : nil)
            if final { logits = lmHead(mixed[0..., (mixed.dim(1) - 1)..., 0...]); eval(logits!) }
            else { eval(mixed) }
        }
        if shouldContinue?() == false { return (nil, false) }
        committed = true
        return (logits, true)
    }

    /// All state-producing operations complete. The terminal QSA outputs,
    /// MoE and final mixer have no state needed by subsequent prompt passes.
    package func consumePrompt(_ ids: [Int], state: State, vision: [VisionRun] = []) {
        checkpointCompatibility { try consumePromptChecked(ids, state: state, vision: vision) }
    }

    package func consumePromptChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws {
        _ = try runHiddenMulti(ids, state: state, vision: vision, demand: .stateOnly)
    }

    /// Like `hiddenStates`, but also returns the pre-final-mixer multi stream
    /// (B,S,hc*H) — the hidden the MTP draft head consumes ("scheme A": the
    /// main model truly emits the pre-mixer stream on the first draft step).
    public func hiddenStatesWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (mixed: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try hiddenStatesWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func hiddenStatesWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (mixed: MLXArray, multi: MLXArray) {
        let multi = try hiddenMulti(ids, state: state, vision: vision)
        return (mixScope(multi), multi)
    }

    /// Logits for the last position only.
    public func lastLogits(_ ids: [Int], state: State, vision: [VisionRun] = []) -> MLXArray {
        checkpointCompatibility { try lastLogitsChecked(ids, state: state, vision: vision) }
    }

    public func lastLogitsChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws -> MLXArray {
        let multi = try runHiddenMulti(ids, state: state, vision: vision, demand: .lastRow)!
        let hidden = mixScope(multi)
        let last = hidden[0..., (hidden.dim(1) - 1)..., 0...]
        return lmHead(last)  // (1,1,vocab)
    }

    /// Logits at EVERY position plus the pre-mixer multi stream — the
    /// speculative verify pass needs both. S stays small (draft length + 1).
    public func allLogitsWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (logits: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try allLogitsWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func allLogitsWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (logits: MLXArray, multi: MLXArray) {
        let (mixed, multi) = try hiddenStatesWithMultiChecked(ids, state: state, vision: vision)
        return (lmHead(mixed), multi)
    }
}

/// A zero-copy snapshot of a State, for speculative-decode rollback. The
/// recurrent caches' arrays are REPLACED on every step (the GDN kernel emits
/// a fresh state_out; conv windows are re-sliced), never mutated in place, so
/// holding references is enough. KV/indexer buffers ARE written in place, but
/// only at rows past their offset — rolling the offset back is a full undo.
/// Compact main indexers additionally retain their bounded raw/pooled storage
/// here, so a cancelled long scope can undo released raw history exactly.
public struct StateCheckpoint {
    var lifetime: StateCheckpointLifetime
    var conv: [Int: MLXArray]
    var ssm: [Int: MLXArray]
    var pleConv: [Int: MLXArray]
    var kvOffsets: [Int: Int]
    var indexerOffsets: [Int: Int]
    var indexerSnapshots: [Int: IndexerCache.Snapshot]
    var ngramCtx: [Int64]
    var tokenCount: Int
    var committedBoundaryValid: Bool
    var mtpBoundaryValid: Bool
    var mtpOffset: Int
    var lastMulti: MLXArray?
}

extension Qwen4ExpModel.State {
    package func diagnosticIndexerBases() -> [String: Int] {
        Dictionary(uniqueKeysWithValues: indexer.map { ("index.\($0.key)", $0.value.rawBase) })
    }
    package var diagnosticDraftIndexerBase: Int? { mtp?.indexer.rawBase }
    /// Read-only logical state for exact continuation/ownership diagnostics.
    /// Indexer arrays expose the retained raw range, whose absolute base is
    /// available to package diagnostics. Released rows are represented by
    /// completed keys, not reconstructed or fabricated raw values.
    /// Returned arrays retain storage; release the snapshot before measuring
    /// liveness or memory. Unwritten KV capacity is deliberately excluded.
    public func diagnosticTensors() -> [String: MLXArray] {
        var result: [String: MLXArray] = [:]
        for (l, c) in linear {
            result["conv.\(l)"] = c.convState
            result["ssm.\(l)"] = c.ssmState
            result["ple.\(l)"] = c.pleConvState
        }
        for (l, c) in kv {
            result["key.\(l)"] = c.keys.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
            result["value.\(l)"] = c.values.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
        }
        for (l, c) in indexer { result["index.\(l)"] = c.diagnosticValues() }
        result["ngram"] = MLXArray(ngramCtx)
        result["tokens"] = MLXArray(Int64(tokenCount))
        result["lastMulti"] = lastMulti
        if let c = mtp {
            result["mtp.key"] = c.kv.keys.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.value"] = c.kv.values.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.index"] = c.indexer.diagnosticValues()
            result["mtp.offset"] = MLXArray(Int64(c.offset))
        }
        return result
    }

    public func checkpoint() -> StateCheckpoint {
        var conv: [Int: MLXArray] = [:]
        var ssm: [Int: MLXArray] = [:]
        var pleConv: [Int: MLXArray] = [:]
        for (l, c) in linear {
            if let a = c.convState { conv[l] = a }
            if let a = c.ssmState { ssm[l] = a }
            if let a = c.pleConvState { pleConv[l] = a }
        }
        checkpointLifetimes.removeAll { $0.value == nil }
        let lifetime = StateCheckpointLifetime(owner: checkpointIdentity, tokens: tokenCount,
            mtpOffset: mtp?.offset ?? 0)
        checkpointLifetimes.append(WeakStateCheckpointLifetime(lifetime))
        return StateCheckpoint(
            lifetime: lifetime, conv: conv, ssm: ssm, pleConv: pleConv,
            kvOffsets: kv.mapValues { $0.offset },
            indexerOffsets: indexer.mapValues { $0.offset },
            indexerSnapshots: indexer.compactMapValues { $0.snapshot() },
            ngramCtx: ngramCtx, tokenCount: tokenCount,
            committedBoundaryValid: committedBoundaryValid,
            mtpBoundaryValid: mtp == nil || hasValidMTP
                || (tokenCount == 0 && mtp?.offset == 0 && lastMulti == nil),
            mtpOffset: mtp?.offset ?? 0, lastMulti: lastMulti)
    }

    /// Start or stop recording per-position recurrent states in the linear
    /// layers (speculative verify passes only).
    public func setRecording(_ on: Bool) {
        recordingEnabled = on
        recordedTokenIds = nil
        recordingBaseTokenCount = nil
        for cache in indexer.values { cache.preserveRecordingRows(on) }
        for (_, cache) in linear {
            if on { cache.record = true } else { cache.clearRecording() }
        }
    }

    /// After a recording pass over `ids` from checkpoint `c`, keep only its
    /// first `n` tokens: recurrent states become the recorded ones at
    /// position n-1, KV and indexer caches trim to the checkpoint offset
    /// plus n, and the n-gram context is rebuilt from the ids. No model
    /// compute. `n` must be at least 1 and at most ids.count; keeping all of
    /// them only clears the recording.
    public func rollback(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) {
        do { try rollbackChecked(keeping: n, of: ids, from: c, ngramWindow: ngramWindow) }
        catch { preconditionFailure("\(error)") }
    }

    /// Recover only the recorded pass on this state; reject invalid input before mutation.
    public func rollbackChecked(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) throws {
        try validateRollback(keeping: n, ids: ids, checkpoint: c, ngramWindow: ngramWindow)
        if n < ids.count {
            for (_, cache) in linear {
                if !cache.ssmStates.isEmpty { cache.ssmState = cache.ssmStates[n - 1] }
                if !cache.convStates.isEmpty { cache.convState = cache.convStates[n - 1] }
                if !cache.pleConvStates.isEmpty { cache.pleConvState = cache.pleConvStates[n - 1] }
            }
            for (l, cache) in kv { cache.trim(to: (c.kvOffsets[l] ?? 0) + n) }
            for (l, cache) in indexer { cache.trim(to: (c.indexerOffsets[l] ?? 0) + n) }
            let history = c.ngramCtx + ids.prefix(n).map { Int64($0) }
            ngramCtx = Array(history.suffix(ngramWindow))
            tokenCount = c.tokenCount + n
        }
        invalidateCheckpoints(after: tokenCount, mtpOffset: nil)
        setRecording(false)
        if compactStateWindows {
            for cache in linear.values { cache.compactWindows() }
        }
    }

    /// Diagnostic for the rollback gate: the largest relative difference, over
    /// all linear layers, between this state's recurrent tensors and another's
    /// (max |a-b| / max |b|). A wrong window or a stale state reads order one;
    /// re-association reads bf16-ulp small.
    public func recurrentDelta(vs other: Qwen4ExpModel.State) -> (ssm: Double, conv: Double, ple: Double) {
        func delta(_ a: MLXArray?, _ b: MLXArray?) -> Double {
            guard let a, let b else { return (a == nil && b == nil) ? 0 : .infinity }
            guard a.shape == b.shape else { return .infinity }
            let d = abs(a.asType(.float32) - b.asType(.float32)).max().item(Float.self)
            let m = abs(b.asType(.float32)).max().item(Float.self)
            return Double(m > 0 ? d / m : d)
        }
        var s = 0.0, c = 0.0, p = 0.0
        for (l, cache) in linear {
            guard let o = other.linear[l] else { continue }
            s = max(s, delta(cache.ssmState, o.ssmState))
            c = max(c, delta(cache.convState, o.convState))
            p = max(p, delta(cache.pleConvState, o.pleConvState))
        }
        return (s, c, p)
    }

    public func restore(_ c: StateCheckpoint) {
        do { try restoreChecked(c) }
        catch { preconditionFailure("\(error)") }
    }

    /// Restore a live ancestor checkpoint from this exact state. KV storage is
    /// append-only, so snapshots from discarded future branches cannot be reused.
    public func restoreChecked(_ c: StateCheckpoint) throws {
        try validateCheckpoint(c)
        for (l, cache) in linear {
            cache.convState = c.conv[l]
            cache.ssmState = c.ssm[l]
            cache.pleConvState = c.pleConv[l]
        }
        for (l, cache) in kv {
            cache.trim(to: c.kvOffsets[l] ?? 0)
            if let k = cache.keys, let v = cache.values { eval(k, v) }
        }
        for (l, cache) in indexer {
            if let snapshot = c.indexerSnapshots[l] { cache.restore(snapshot) }
            else { cache.trim(to: c.indexerOffsets[l] ?? 0) }
            // Dense attention may not have evaluated raw indexer writes.
            // Detach their graph before a canceled scope releases its inputs.
            cache.materializeStorage()
        }
        ngramCtx = c.ngramCtx
        tokenCount = c.tokenCount
        committedBoundaryValid = c.committedBoundaryValid
        mtp?.trim(to: c.mtpOffset)
        mtp?.materialize()
        lastMulti = c.lastMulti
        invalidateCheckpoints(after: tokenCount, mtpOffset: c.mtpOffset)
        setRecording(false)
    }
}

// PLE cache slot rides on the linear cache of its (linear-attention) layer; if
// the PLE layer were ever a QSA layer this would need its own cache. Reject it
// at init time instead of failing silently.
extension Qwen4ExpModel {
    public func validate() throws {
        try Geometry.check(against: cfg, recordBytes: pool.recordBytes)
        for l in cfg.pleLayerIndices where l < runLayers {
            guard cfg.layerTypes[l] == "linear_attention" else {
                throw ModelError(
                    "PLE layer \(l) is not linear_attention, so its recurrent cache has no home — check --model")
            }
        }
    }
}

````````````

## Artifact SHA-256 c676838c165ca4a9de74fc763bc03282628db4e58ab5f90e211c276d5ffe9729

Encoding: `utf-8`. Original bytes: 14292.

````````````text
import Foundation

/// Explicit controls for independently evaluated execution paths. The public
/// initializer is the reference; environment resolution selects the deployment
/// family and applies explicit overrides. Experimental paths remain disabled.
public struct InferenceOptimizations: Codable, Equatable {
    public var compactStateWindows = false
    public var compactMTPRow = false
    public var skipUnusedFinalForward = false
    public var tailAwarePrefill = false
    public var demandedPrefillOutput = false
    public var terminalPrefillPruning = false
    /// Independent final-QSA output reduction; a 64-row tail retains matrix
    /// dispatch for attention/output/HC, and shorter passes keep every row.
    /// Requires terminal prefill demand.
    package static let terminalQueryTile = 64
    public var terminalLastQuery = false
    public var compactNgramRows = false
    public var incrementalIndexer = false
    public var compactIndexerRaw = false
    public var valueOnlySamplerThreshold = false
    public var deviceSamplerDraw = false
    public var disjointSweepOutput = false
    public var boundedSweepRows = false
    public var boundedIndexer = false
    public var sharedRoPE = false
    public var fusedRoPE = false
    /// Requires the optional shared-backing layout at model construction.
    public var fusedGDNProjection = false
    public var fusedGDNRecording = false
    public var boundedPLE = false
    public var ngramLookahead = false
    public var layerExpertWorkspace = false
    public var workspaceTokenTile = 256
    public var compactScopeFrontier = false
    public var workspacePiecewiseWrites = false
    /// Experimental bounded layer-major scope; zero keeps chronological passes.
    public var readScopeTokens = 0
    public var reuseFirstMTPEntry = false
    /// Experimental shortening changes verification shapes and can change
    /// greedy output. Excluded from the combined candidate; sampled requests
    /// retain their original shapes. Independent context bounds always apply.
    public var boundedDraftTail = false
    public var adaptiveSpeculation = false
    public var resolvedRuntimeBudget = false
    public var layerLocalFloorCache = false
    public var boundedOutputQueue = false
    public var responsiveGovernor = false
    public var routerTopK = false
    public var denseIndexerBypass = false
    public var indexerBlockTopK = false
    public var overlapSharedExpert = false
    public var overlapResidentExperts = false
    public var deduplicateImages = false
    public var visionAttentionPadding = 0
    /// Independent, bounded original-attention path. Qualification pending.
    public var visionQueryTile = 0
    public var cachedRouterWeights = false
    public var directReadHandles = false
    public var compiledNormFinish = false
    public var selectedTextAttention = false
    public var ngramRingOrder = false
    public var denseExpertLookup = false
    public var sparsePoolPins = false
    public var contiguousSlotWrites = false
    public var wordSlotWrites = false
    public var cpuSlotWrites = false
    /// Exact already-scheduled commit boundary; zero disables common-prefix retention.
    public var prefixCheckpointTokens = 0
    /// Retain the complete committed prompt and its raw last logits. This is
    /// independently qualified before joining integrationCandidate.
    public var completePromptCheckpoint = false

    public var readScopeEnabled: Bool {
        readScopeTokens > 0 && layerExpertWorkspace && compactStateWindows
            && compactMTPRow && boundedIndexer && boundedPLE
    }

    public init() {}

    /// Joint execution family used by deployment selection and its diagnostics.
    /// The public initializer remains the explicit reference. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
        result.compactNgramRows = true
        result.skipUnusedFinalForward = true
        result.valueOnlySamplerThreshold = true
        result.deviceSamplerDraw = true
        result.boundedOutputQueue = true
        result.responsiveGovernor = true
        result.prefixCheckpointTokens = 256
        result.completePromptCheckpoint = true
        result.sharedRoPE = true
        result.fusedRoPE = true
        return result
    }

    /// Select the automatically deployed family with the measured kernel
    /// qualification boundary. Explicit controls can qualify another platform;
    /// kernel initialization and shape fallbacks also apply.
    package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
        var result = integrationCandidate
        result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
        return result
    }

    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
        try resolving(environment: env, defaults: deploymentCandidate())
    }

    /// Apply explicit overrides to a selected default family. Keeping this
    /// separate lets deployment qualify the actual resolution path while the
    /// public default and the explicit reference initializer remain unchanged.
    package static func resolving(environment env: [String: String], defaults: Self) throws -> Self {
        var result = defaults
        var recognized = Set<String>()
        func flag(_ name: String, fallback: Bool) throws -> Bool {
            recognized.insert(name)
            guard let value = env[name] else { return fallback }
            guard value == "0" || value == "1" else {
                throw ModelError("\(name) must be 0 or 1")
            }
            return value == "1"
        }
        result.compactStateWindows = try flag("SLOTSTREAM_OPT_COMPACT_STATE", fallback: result.compactStateWindows)
        result.completePromptCheckpoint = try flag("SLOTSTREAM_OPT_COMPLETE_PROMPT", fallback: result.completePromptCheckpoint)
        result.compactMTPRow = try flag("SLOTSTREAM_OPT_COMPACT_MTP", fallback: result.compactMTPRow)
        result.skipUnusedFinalForward = try flag("SLOTSTREAM_OPT_FINAL_FORWARD", fallback: result.skipUnusedFinalForward)
        result.tailAwarePrefill = try flag("SLOTSTREAM_OPT_TAIL_SCHEDULE", fallback: result.tailAwarePrefill)
        result.demandedPrefillOutput = try flag("SLOTSTREAM_OPT_OUTPUT_DEMAND", fallback: result.demandedPrefillOutput)
        result.terminalPrefillPruning = try flag("SLOTSTREAM_OPT_TERMINAL_PREFILL", fallback: result.terminalPrefillPruning)
        result.terminalLastQuery = try flag("SLOTSTREAM_OPT_TERMINAL_QUERY", fallback: result.terminalLastQuery)
        guard !result.terminalLastQuery || result.terminalPrefillPruning else {
            throw ModelError("TERMINAL_QUERY requires TERMINAL_PREFILL")
        }
        result.compactNgramRows = try flag("SLOTSTREAM_OPT_NGRAM_ROWS", fallback: result.compactNgramRows)
        result.incrementalIndexer = try flag("SLOTSTREAM_OPT_INDEXER_BLOCKS", fallback: result.incrementalIndexer)
        result.compactIndexerRaw = try flag("SLOTSTREAM_OPT_INDEXER_RAW", fallback: result.compactIndexerRaw)
        guard !result.compactIndexerRaw || result.incrementalIndexer else {
            throw ModelError("INDEXER_RAW requires INDEXER_BLOCKS")
        }
        result.valueOnlySamplerThreshold = try flag("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", fallback: result.valueOnlySamplerThreshold)
        result.deviceSamplerDraw = try flag("SLOTSTREAM_OPT_SAMPLER_DRAW", fallback: result.deviceSamplerDraw)
        result.disjointSweepOutput = try flag("SLOTSTREAM_OPT_SWEEP_PLACEMENT", fallback: result.disjointSweepOutput)
        result.boundedSweepRows = try flag("SLOTSTREAM_OPT_SWEEP_TILES", fallback: result.boundedSweepRows)
        result.boundedIndexer = try flag("SLOTSTREAM_OPT_INDEXER_TILES", fallback: result.boundedIndexer)
        result.sharedRoPE = try flag("SLOTSTREAM_OPT_SHARED_ROPE", fallback: result.sharedRoPE)
        result.fusedRoPE = try flag("SLOTSTREAM_OPT_FUSED_ROPE", fallback: result.fusedRoPE)
        result.fusedGDNProjection = try flag("SLOTSTREAM_OPT_GDN_PROJECTION", fallback: result.fusedGDNProjection)
        result.fusedGDNRecording = try flag("SLOTSTREAM_OPT_GDN_RECORD", fallback: result.fusedGDNRecording)
        result.boundedPLE = try flag("SLOTSTREAM_OPT_PLE_TILES", fallback: result.boundedPLE)
        result.ngramLookahead = try flag("SLOTSTREAM_OPT_NGRAM_LOOKAHEAD", fallback: result.ngramLookahead)
        result.layerExpertWorkspace = try flag("SLOTSTREAM_OPT_LAYER_WORKSPACE", fallback: result.layerExpertWorkspace)
        result.reuseFirstMTPEntry = try flag("SLOTSTREAM_OPT_MTP_FIRST_ENTRY", fallback: result.reuseFirstMTPEntry)
        result.boundedDraftTail = try flag("SLOTSTREAM_OPT_MTP_TAIL", fallback: result.boundedDraftTail)
        result.adaptiveSpeculation = try flag("SLOTSTREAM_OPT_ADAPTIVE_MTP", fallback: result.adaptiveSpeculation)
        result.resolvedRuntimeBudget = try flag("SLOTSTREAM_OPT_RUNTIME_BUDGET", fallback: result.resolvedRuntimeBudget)
        result.layerLocalFloorCache = try flag("SLOTSTREAM_OPT_FLOOR_CACHE", fallback: result.layerLocalFloorCache)
        result.boundedOutputQueue = try flag("SLOTSTREAM_OPT_OUTPUT_QUEUE", fallback: result.boundedOutputQueue)
        result.responsiveGovernor = try flag("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", fallback: result.responsiveGovernor)
        result.routerTopK = try flag("SLOTSTREAM_OPT_ROUTER_TOPK", fallback: result.routerTopK)
        result.denseIndexerBypass = try flag("SLOTSTREAM_OPT_INDEXER_DENSE", fallback: result.denseIndexerBypass)
        result.indexerBlockTopK = try flag("SLOTSTREAM_OPT_INDEXER_TOPK", fallback: result.indexerBlockTopK)
        result.overlapSharedExpert = try flag("SLOTSTREAM_OPT_SHARED_OVERLAP", fallback: result.overlapSharedExpert)
        result.overlapResidentExperts = try flag("SLOTSTREAM_OPT_RESIDENT_OVERLAP", fallback: result.overlapResidentExperts)
        result.deduplicateImages = try flag("SLOTSTREAM_OPT_IMAGE_REUSE", fallback: result.deduplicateImages)
        result.directReadHandles = try flag("SLOTSTREAM_OPT_READ_HANDLES", fallback: result.directReadHandles)
        result.compiledNormFinish = try flag("SLOTSTREAM_OPT_COMPILED_NORM", fallback: result.compiledNormFinish)
        result.selectedTextAttention = try flag("SLOTSTREAM_OPT_SELECTED_ATTENTION", fallback: result.selectedTextAttention)
        result.ngramRingOrder = try flag("SLOTSTREAM_OPT_NGRAM_RING", fallback: result.ngramRingOrder)
        result.denseExpertLookup = try flag("SLOTSTREAM_OPT_EXPERT_MAP", fallback: result.denseExpertLookup)
        result.sparsePoolPins = try flag("SLOTSTREAM_OPT_POOL_PINS", fallback: result.sparsePoolPins)
        result.contiguousSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_SLICES", fallback: result.contiguousSlotWrites)
        result.wordSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_WORDS", fallback: result.wordSlotWrites)
        result.cpuSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_CPU", fallback: result.cpuSlotWrites)
        guard !result.cpuSlotWrites || (!result.wordSlotWrites && !result.contiguousSlotWrites) else {
            throw ModelError("SLOT_CPU cannot be combined with SLOT_WORDS or SLOT_SLICES")
        }
        let checkpointKey = "SLOTSTREAM_OPT_PREFIX_CHECKPOINT"
        recognized.insert(checkpointKey)
        if let value = env[checkpointKey] {
            guard let n = Int(value), [0, 256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(checkpointKey) must be 0, 256, 512, 1024, 2048 or 4096")
            }
            result.prefixCheckpointTokens = n
        }
        result.cachedRouterWeights = try flag("SLOTSTREAM_OPT_ROUTER_WEIGHTS", fallback: result.cachedRouterWeights)
        let visionPaddingKey = "SLOTSTREAM_OPT_VISION_PADDING"
        recognized.insert(visionPaddingKey)
        if let value = env[visionPaddingKey] {
            guard let n = Int(value), [0, 80, 128].contains(n) else {
                throw ModelError("\(visionPaddingKey) must be 0, 80 or 128")
            }
            result.visionAttentionPadding = n
        }
        let visionTileKey = "SLOTSTREAM_OPT_VISION_QUERY_TILE"
        recognized.insert(visionTileKey)
        if let value = env[visionTileKey] {
            guard let n = Int(value), [0, 256].contains(n) else {
                throw ModelError("\(visionTileKey) must be 0 or 256")
            }
            result.visionQueryTile = n
        }
        guard result.visionQueryTile == 0 || result.visionAttentionPadding == 0 else {
            throw ModelError("VISION_QUERY_TILE and VISION_PADDING are independent candidates")
        }
        result.compactScopeFrontier = try flag("SLOTSTREAM_OPT_SCOPE_FRONTIER", fallback: result.compactScopeFrontier)
        result.workspacePiecewiseWrites = try flag("SLOTSTREAM_OPT_WORKSPACE_PIECES", fallback: result.workspacePiecewiseWrites)
        let tileKey = "SLOTSTREAM_OPT_WORKSPACE_TILE"
        recognized.insert(tileKey)
        if let value = env[tileKey] {
            guard let n = Int(value), [256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(tileKey) must be 256, 512, 1024, 2048 or 4096")
            }
            result.workspaceTokenTile = n
        }
        let scopeKey = "SLOTSTREAM_OPT_READ_SCOPE"
        recognized.insert(scopeKey)
        if let value = env[scopeKey] {
            guard let n = Int(value), [0, 1024, 4096, 8192].contains(n) else {
                throw ModelError("\(scopeKey) must be 0, 1024, 4096 or 8192")
            }
            result.readScopeTokens = n
        }
        guard result.readScopeTokens == 0 || result.readScopeEnabled else {
            throw ModelError("read scopes require LAYER_WORKSPACE, COMPACT_STATE, COMPACT_MTP, INDEXER_TILES and PLE_TILES")
        }
        let unknown = env.keys.filter { $0.hasPrefix("SLOTSTREAM_OPT_") && !recognized.contains($0) }.sorted()
        guard unknown.isEmpty else { throw ModelError("unknown optimization controls: \(unknown.joined(separator: ", "))") }
        return result
    }
}

````````````

## Artifact SHA-256 fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655

Encoding: `utf-8`. Original bytes: 12590.

````````````text
import Foundation

public struct ContextConfiguration: Sendable, Equatable {
    public static let defaultWaitMinutes = 30.0
    public let maxContextTokens: Int
    public let maxPrefillWaitMinutes: Double
    /// Explicit diagnostic qualification, never inferred from a mutable cap.
    public let qualification: Bool

    public init(maxContextTokens: Int = ContextPolicy.defaultTokens,
                maxPrefillWaitMinutes: Double = defaultWaitMinutes,
                qualification: Bool = false) throws {
        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) {
            throw RequestFailure(.contextLengthExceeded, why)
        }
        guard maxPrefillWaitMinutes.isFinite, maxPrefillWaitMinutes >= 0,
              maxPrefillWaitMinutes <= Double(UInt64.max) / 60 / 1e9 else {
            throw RequestFailure(.invalidConfiguration,
                "--max-prefill-wait must be finite, nonnegative minutes within the monotonic timer range; 0 disables only the time policy")
        }
        self.maxContextTokens = maxContextTokens
        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
        self.qualification = qualification
    }
}

public struct RequestFailure: Error, CustomStringConvertible, Codable, Sendable, Equatable {
    public enum Code: String, Codable, Sendable {
        case contextLengthExceeded = "context_length_exceeded"
        case invalidConfiguration = "invalid_configuration"
        case prefillWaitExceeded = "prefill_wait_exceeded"
        case insufficientMemory = "insufficient_memory"
        case prefillDeadlineExceeded = "prefill_deadline_exceeded"
        case clientCancelled = "client_cancelled"
        case inferenceError = "inference_error"
    }
    public let code: Code
    public let message: String
    public var elapsedSeconds: Double?
    public var limitSeconds: Double?
    public var estimatedSeconds: Double?
    public var requiredBytes: Int?
    public var availableBytes: Int?
    public init(_ code: Code, _ message: String) { self.code = code; self.message = message }
    public var description: String { message }
    public var httpStatus: String {
        switch code {
        case .contextLengthExceeded, .invalidConfiguration, .prefillWaitExceeded: return "400 Bad Request"
        case .insufficientMemory, .prefillDeadlineExceeded: return "503 Service Unavailable"
        case .clientCancelled: return "499 Client Closed Request"
        case .inferenceError: return "500 Internal Server Error"
        }
    }
    public var json: [String: Any] {
        var result: [String: Any] = ["code": code.rawValue, "type": code.rawValue, "message": message]
        if let elapsedSeconds { result["elapsed_seconds"] = elapsedSeconds }
        if let limitSeconds { result["limit_seconds"] = limitSeconds }
        if let estimatedSeconds { result["estimated_seconds"] = estimatedSeconds }
        if let requiredBytes { result["required_bytes"] = requiredBytes }
        if let availableBytes { result["available_bytes"] = availableBytes }
        return result
    }
}

/// Atomic admission for allocations that concurrent accepted requests have
/// reserved but may not have materialized yet. Retained preparation stays
/// charged until its controller is released, including time in the queue.
package final class RequestMemoryReservations: @unchecked Sendable {
    private let lock = NSLock()
    private var entries: [UUID: [String: Int]] = [:]
    package init() {}
    package var reservedBytes: Int { lock.withLock { entries.values.reduce(0) { ContextBytes.sum($0, $1.values.reduce(0) { ContextBytes.sum($0, $1) }) } } }
    package func release(_ id: UUID) { lock.withLock { _ = entries.removeValue(forKey: id) } }
    package func releaseDispatch(_ id: UUID) { lock.withLock { entries[id]?["dispatch"] = nil } }

    package func check(_ id: UUID, kind: String?, bytes: Int, slack: Int,
                       available: () -> Double?, phase: String) throws {
        try lock.withLock {
            var own = entries[id] ?? [:]
            if let kind { own[kind] = kind == "dispatch" ? bytes : max(own[kind] ?? 0, bytes) }
            let others = entries.reduce(0) { sum, entry in
                entry.key == id ? sum : ContextBytes.sum(sum, entry.value.values.reduce(0) { ContextBytes.sum($0, $1) })
            }
            let proposed = kind == nil ? 0 : own.values.reduce(0) { ContextBytes.sum($0, $1) }
            let required = ContextBytes.sum(others, proposed, slack)
            guard let gb = available(), gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 else {
                throw RequestFailure(.insufficientMemory, "reclaimable memory is unreadable during \(phase)")
            }
            let observed = Int(gb * 1e9)
            guard required < Int.max, observed >= required else {
                var failure = RequestFailure(.insufficientMemory,
                    "insufficient memory for \(phase), queued requests and safety headroom; retry after other requests finish")
                failure.requiredBytes = required; failure.availableBytes = observed
                throw failure
            }
            if kind != nil { entries[id] = own }
        }
    }
}

/// One accepted request owns one monotonic clock, including all queue and
/// preparation work. Neither transport activity nor prefix reuse restarts it.
/// Injectable observations exercise refusal without stressing the machine.
public final class RequestController: @unchecked Sendable {
    public let configuration: ContextConfiguration
    public let slackBytes: Int
    private let clock: () -> UInt64
    private let available: () -> Double?
    private let connected: () -> Bool
    private let pressure: () -> Bool
    private let started: UInt64
    private let lock = NSLock()
    private var failureValue: RequestFailure?
    private var firstToken = false
    private var estimateValue: Double?
    private let reservationID = UUID()
    private var reservations: RequestMemoryReservations?
    public var estimatedPrefillSeconds: Double? { lock.withLock { estimateValue } }

    public init(configuration: ContextConfiguration, slackBytes: Int,
                clock: @escaping () -> UInt64 = { DispatchTime.now().uptimeNanoseconds },
                availableGB: @escaping () -> Double? = { Planner.deviceAvailableGB() },
                connected: @escaping () -> Bool = { true }, pressure: @escaping () -> Bool = { false }) {
        self.configuration = configuration
        self.slackBytes = max(0, slackBytes)
        self.clock = clock; self.available = availableGB; self.connected = connected; self.pressure = pressure
        started = clock()
    }
    deinit { reservations?.release(reservationID) }
    package func attachReservations(_ pool: RequestMemoryReservations) throws {
        try lock.withLock {
            if let reservations, reservations !== pool {
                throw RequestFailure(.invalidConfiguration, "a request cannot move between engine memory budgets")
            }
            reservations = pool
        }
    }
    package func releaseDispatchReservation() {
        lock.withLock { reservations?.releaseDispatch(reservationID) }
    }
    public var elapsedSeconds: Double {
        let now = clock()
        return Double(now >= started ? now - started : 0) / 1e9
    }
    public var failure: RequestFailure? { lock.withLock { failureValue } }
    public var mayRetainState: Bool { failure == nil }
    @discardableResult public func fail(_ error: RequestFailure) -> RequestFailure {
        lock.withLock {
            if failureValue == nil { failureValue = error }
            return failureValue!
        }
    }
    public func cancel() { fail(RequestFailure(.clientCancelled, "the client cancelled this request")) }
    public func sampledFirstToken() { lock.withLock { firstToken = true } }

    /// Check before an allocation, not after it. Only actually reusable bytes
    /// can be subtracted by callers; future reservations never authorize growth.
    public func check(nextAllocationBytes: Int = 0, phase: String = "inference") throws {
        if let failure { throw failure }
        guard nextAllocationBytes >= 0 else {
            throw fail(RequestFailure(.invalidConfiguration, "allocation byte count must be nonnegative"))
        }
        if !connected() { throw fail(RequestFailure(.clientCancelled, "the client disconnected during \(phase)")) }
        let elapsed = elapsedSeconds
        let seconds = configuration.maxPrefillWaitMinutes * 60
        if seconds > 0, !lock.withLock({ firstToken }), elapsed >= seconds {
            var error = RequestFailure(.prefillDeadlineExceeded,
                "request-to-first-token deadline exceeded during \(phase); send less context or raise --max-prefill-wait")
            error.elapsedSeconds = elapsed; error.limitSeconds = seconds
            throw fail(error)
        }
        if pressure() {
            throw fail(RequestFailure(.insufficientMemory, "memory pressure interrupted \(phase); retry after memory becomes available"))
        }
        if let pool = lock.withLock({ reservations }) {
            do {
                try pool.check(reservationID, kind: nextAllocationBytes > 0 ? "dispatch" : nil,
                    bytes: nextAllocationBytes, slack: slackBytes, available: available, phase: phase)
            } catch let error as RequestFailure { throw fail(error) }
            return
        }
        let (required, overflow) = max(0, nextAllocationBytes).addingReportingOverflow(slackBytes)
        guard !overflow else { throw fail(RequestFailure(.insufficientMemory, "allocation size exceeds the supported memory range")) }
        let reading = available()
        if let gb = reading, gb.isFinite, gb >= 0, gb < Double(Int.max) / 1e9 {
            let bytes = Int(gb * 1e9)
            if bytes < required {
                var error = RequestFailure(.insufficientMemory,
                    "insufficient reclaimable memory for \(phase) and safety headroom; close other apps or lower the memory/context target")
                error.requiredBytes = required; error.availableBytes = bytes
                throw fail(error)
            }
        } else if configuration.maxContextTokens > ContextPolicy.defaultTokens && nextAllocationBytes > 0 {
            throw fail(RequestFailure(.insufficientMemory,
                "reclaimable memory is unreadable; refusing additional long-context allocation during \(phase)"))
        }
    }

    /// Conservative temporary-copy allowance for templating/tokenization.
    /// Counting input must not itself serialize an arbitrarily large value.
    public func checkInputBytes(_ bytes: Int) throws {
        guard bytes >= 0 else { throw fail(RequestFailure(.invalidConfiguration, "invalid input byte count")) }
        try reservePreparation(kind: "input", bytes: ContextBytes.product(bytes, 16), phase: "prompt tokenization")
    }

    package func reservePreparedImageBytes(_ bytes: Int) throws {
        try reservePreparation(kind: "pixels", bytes: bytes, phase: "retained image preparation")
    }
    private func reservePreparation(kind: String, bytes: Int, phase: String) throws {
        guard bytes >= 0 else { throw fail(RequestFailure(.invalidConfiguration, "invalid preparation byte count")) }
        try check(phase: phase)
        if let pool = lock.withLock({ reservations }) {
            do { try pool.check(reservationID, kind: kind, bytes: bytes, slack: slackBytes, available: available, phase: phase) }
            catch let error as RequestFailure { throw fail(error) }
        } else { try check(nextAllocationBytes: bytes, phase: phase) }
    }

    public func admit(missingTokens: Int, from position: Int, maxChunk: Int,
                      tailAware: Bool = false) throws {
        try check(phase: "admission")
        let estimate = PrefillSchedule.estimateSeconds(tokens: missingTokens, from: position,
            maxChunk: maxChunk, tailAware: tailAware)
        lock.withLock { estimateValue = estimate }
        let limit = configuration.maxPrefillWaitMinutes * 60
        if limit > 0, let estimate, elapsedSeconds + estimate > limit {
            var error = RequestFailure(.prefillWaitExceeded,
                "estimated missing-context prefill exceeds the remaining wait budget; send less, reuse a valid prefix, or raise --max-prefill-wait")
            error.elapsedSeconds = elapsedSeconds; error.limitSeconds = limit; error.estimatedSeconds = estimate
            throw fail(error)
        }
    }
}

````````````

## Artifact SHA-256 76ab59f9bf34d34cd66fe00f8f383dc33813696120b143d571ea3c8e93f483db

Encoding: `utf-8`. Original bytes: 33864.

````````````text
import Foundation
import Slotstream

extension Diagnostics {
    public static func configurableContext() throws -> CheckReport {
        var c = CheckBuilder("configurable-context")
        let cacheModel = UUID(), cacheOptions = InferenceOptimizations()
        let currentKey = PromptCheckpointKey(model: cacheModel, optimizations: cacheOptions,
            prefillChunk: 256, mtp: false)
        c.equal("prompt cache defaults to the current arithmetic epoch", currentKey.contextArithmetic, 1)
        c.expect("old arithmetic cannot match a current prompt checkpoint", currentKey != PromptCheckpointKey(
            model: cacheModel, optimizations: cacheOptions, prefillChunk: 256, mtp: false, contextArithmetic: 0))
        let caps = [1, 1024, 4096, 8192, 32768, 32769, 65535, 65536, 65537,
                    128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
        for cap in caps {
            let bytes = ContextGeometry.sequenceBytes(tokens: cap)
            // Independent allocator geometry, not a restatement of a helper call.
            let rows = ((cap + 1023) / 1024) * 1024
            c.equal("main allocated capacity \(cap)", bytes, rows * 12 * (2 * 2 * 256 + 128) * 2)
            c.equal("MTP allocated capacity \(cap)", ContextGeometry.sequenceBytes(tokens: cap, mtp: true),
                    rows * 13 * (2 * 2 * 256 + 128) * 2)
        }
        c.equal("overflowing capacity is refused", ContextGeometry.sequenceBytes(tokens: Int.max), Int.max)
        c.equal("negative capacity is refused", ContextGeometry.sequenceBytes(tokens: -1), Int.max)
        // These represent separately owned buffers, including different spare
        // main/draft capacities after rollback. A large unrelated buffer cannot
        // pay for a replacement, and old storage is not yet reclaimable.
        let keyRow = 2 * 256 * 2
        let mainGrowth = ContextGeometry.nextBufferAllocationBytes(tokens: 1025,
            rowBytes: keyRow, allocatedBytes: 1024 * keyRow)
        let draftSpare = ContextGeometry.nextBufferAllocationBytes(tokens: 1024,
            rowBytes: keyRow, allocatedBytes: 4096 * keyRow)
        c.equal("main growth charges complete replacement", mainGrowth, 2048 * keyRow)
        c.equal("draft can reuse its own spare rows", draftSpare, 0)
        c.equal("draft spare does not offset main growth", mainGrowth + draftSpare, 2048 * keyRow)
        c.equal("matching buffer reuses existing capacity", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1024, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 0)
        c.equal("absent pooled indexer needs its own allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1025, rowBytes: 256, allocatedBytes: 0, step: 256), 1280 * 256)
        c.equal("compact raw growth preserves its 256-row step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 304, rowBytes: 256, allocatedBytes: 256 * 256, step: 256), 512 * 256)
        c.equal("compact tail copy is a new allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 32, rowBytes: 256, allocatedBytes: 0, step: 256), 256 * 256)
        c.equal("provisional batch crosses the next allocation step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1023 + 1 + 16, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 2048 * keyRow)
        c.equal("checkpoint copy cannot spend shared backing", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1000, rowBytes: keyRow, allocatedBytes: 0), 1024 * keyRow)
        c.equal("invalid allocation geometry refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: Int.max, rowBytes: keyRow, allocatedBytes: 0), Int.max)
        c.equal("negative owned byte count refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1, rowBytes: keyRow, allocatedBytes: -1), Int.max)
        for room in 0 ... 18 {
            let depth = ContextPolicy.maximumDraftDepth(requested: 16, at: 65536 - room, limit: 65536)
            c.equal("provisional context bounds draft depth/\(room)", depth, min(16, max(0, room - 1)))
            if room > 0 { c.expect("pending plus drafts remain inside context/\(room)", 1 + depth <= room) }
        }
        c.equal("Hermes transient anchor remains fixed", ContextMemoryLedger.transientReserveBytes(context: 65536), 905_969_664)
        c.equal("default has no extra reserve", ContextMemoryLedger.transientReserveBytes(context: 32768), 0)
        // Concurrent requests see one unchanged injected reading. Atomic
        // reservations, not real large allocations, decide how many fit.
        let reservations = RequestMemoryReservations()
        let resultLock = NSLock()
        var accepted: [RequestController] = []
        var refusals = 0
        let reservationPolicy = try ContextConfiguration(maxPrefillWaitMinutes: 0)
        DispatchQueue.concurrentPerform(iterations: 8) { _ in
            let control = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000,
                availableGB: { 0.010 })
            do {
                try control.attachReservations(reservations)
                try control.reservePreparedImageBytes(4_000_000)
                resultLock.withLock { accepted.append(control) }
            } catch { resultLock.withLock { refusals += 1 } }
        }
        c.equal("concurrent preparations cannot spend the same headroom", accepted.count, 2)
        c.equal("excess concurrent preparations refuse before allocation", refusals, 6)
        c.equal("queued decoded pixels remain reserved", reservations.reservedBytes, 8_000_000)
        if let active = accepted.first {
            do { try active.check(nextAllocationBytes: 3_000_000, phase: "test active generation") } catch {}
            c.equal("generation cannot spend queued preparation ownership", active.failure?.code, .insufficientMemory)
            c.equal("failed dispatch preserves retained-pixel reservations", reservations.reservedBytes, 8_000_000)
        }
        var retainedPreparation: RequestController? = accepted.popLast()
        accepted.removeAll()
        c.equal("prepared-image owner keeps its lease after request queue release", reservations.reservedBytes, 4_000_000)
        withExtendedLifetime(retainedPreparation) {}
        retainedPreparation = nil
        c.equal("last preparation owner releases its exact reservation", reservations.reservedBytes, 0)
        do {
            let fresh = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000, availableGB: { 0.010 })
            try fresh.attachReservations(reservations)
            try fresh.checkInputBytes(100_000)
            try fresh.checkInputBytes(1)
            c.equal("shorter later input check cannot release retained copies", reservations.reservedBytes, 1_600_000)
            try fresh.check(nextAllocationBytes: 4_000_000, phase: "test dispatch")
            c.equal("prepared and pending dispatch bytes are separately reserved", reservations.reservedBytes, 5_600_000)
            fresh.releaseDispatchReservation()
            c.equal("completed dispatch releases only transient ownership", reservations.reservedBytes, 1_600_000)
        }
        c.equal("request completion returns all reservations", reservations.reservedBytes, 0)
        for cap in caps {
            for target in [8.1, 10, 16, 24, 33] {
                for mtp in [Planner.MTPMode.off, .on, .auto] {
                    do {
                        let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44,
                            mtp: mtp, mtpAvailable: true, vision: .off, maxContextTokens: cap,
                            simulated: true, qualification: true)
                        c.expect("fit \(cap)/\(target)/\(mtp)", p.memoryLedger.expectedPeakBytes <= Int(target * 1e9))
                        c.equal("preserve window \(cap)/\(target)/\(mtp)", p.maxContextTokens, cap)
                        if mtp == .on { c.expect("forced MTP stays on \(cap)/\(target)", p.mtpEnabled) }
                    } catch {
                        c.expect("bounded refusal \(cap)/\(target)/\(mtp)", !String(describing: error).isEmpty)
                    }
                }
            }
        }
        let baseline = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off, simulated: true)
        let small = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off,
            maxContextTokens: 1024, simulated: true)
        c.expect("short cap refunds retention instead of reserving 32K", small.prefixCacheTokens <= 1024 && small.slots > baseline.slots)
        let machine = Machine.simulated(ramGB: 51.5, workingSetGB: 40.2, availableGB: 44)
        for target in [8.1, 10, 16, 24, 33] {
            let request = PlanRequest(memoryGB: target, mtp: .off, vision: .off, maxContextTokens: ContextPolicy.modelLimit)
            let result = Planner.contextFeasibility(request, on: machine, qualification: true)
            c.expect("solver maximum accepted at \(target)", result.maximumPlan != nil)
            if result.maximumFeasibleWindow < ContextPolicy.modelLimit {
                let next = result.maximumFeasibleWindow + 1
                let p = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: next, simulated: true, qualification: true)
                c.expect("next solver token refused at \(target)", p == nil)
            }
        }
        for chunk in [64, 128, 256, 512, 1024, 2048, 4096] {
            for start in [0, 1, 32768, 65535, 128255, 128256, 128257, 131071, 262079, 262143] {
                let count = ContextPolicy.modelLimit - start
                var position = start
                let passes = PrefillSchedule.passes(tokens: count, from: start, maxChunk: chunk)
                var bounded = !passes.isEmpty
                for n in passes {
                    // Ordinary scheduling has always clamped small batch
                    // overrides up to 256. The 64-row floor applies only
                    // after the 256-row query/key product no longer fits.
                    let floor = 256 * (position + 256) <= 4096 * 8016 ? 256 : 64
                    bounded = bounded && n > 0 && n <= max(floor, chunk)
                        && n * (position + n) <= 4096 * 8016
                    position += n
                }
                c.expect("bounded schedule \(chunk) from \(start)", bounded && position == ContextPolicy.modelLimit)
            }
        }
        c.expect("overflowing schedule is refused", PrefillSchedule.passes(tokens: Int.max, from: Int.max, maxChunk: 4096).isEmpty)
        c.expect("uncalibrated late schedule is unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
        c.expect("Hermes schedule retains an estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)
        let oddLate = PrefillSchedule.computePasses(tokens: 512, from: 200000, maxChunk: 4095)
        c.equal("diagnostic odd late schedule matches the canonical runtime shape", oddLate.map(\.tokens), Array(repeating: 64, count: 8))
        c.equal("diagnostic includes masked canonical columns", oddLate.map(\.keyExtent),
            Array(repeating: 200256, count: 4) + Array(repeating: 200512, count: 4))
        c.expect("diagnostic includes physical query rows", oddLate.allSatisfy { $0.queryRows == 64 })
        let paddedTail = PrefillSchedule.computePasses(tokens: 449, from: 200000, maxChunk: 4095)
        c.equal("diagnostic tail reports its padded query geometry", paddedTail.last?.queryRows, 64)
        c.equal("diagnostic tail preserves its one logical token", paddedTail.last?.tokens, 1)

        var tick: UInt64 = 0
        var available = 10.0
        var connected = true
        var pressure = false
        func controller(wait: Double = 1, cap: Int = 65536) throws -> RequestController {
            try RequestController(configuration: ContextConfiguration(maxContextTokens: cap, maxPrefillWaitMinutes: wait),
                slackBytes: 1_500_000_000, clock: { tick }, availableGB: { available },
                connected: { connected }, pressure: { pressure })
        }
        for invalid in [Double.nan, .infinity, -.infinity, -1, Double.greatestFiniteMagnitude] {
            c.expect("invalid duration \(invalid) refused", (try? ContextConfiguration(maxPrefillWaitMinutes: invalid)) == nil)
        }
        let estimated = try controller()
        do { try estimated.admit(missingTokens: 32768, from: 0, maxChunk: 256) } catch {}
        c.equal("cold estimate refuses before prefill", estimated.failure?.code, .prefillWaitExceeded)
        let reused = try controller()
        try reused.admit(missingTokens: 32, from: 64000, maxChunk: 4096)
        c.expect("fast continuation admits from its real position", reused.failure == nil)
        tick = 61_000_000_000
        do { try reused.check(phase: "image preparation") } catch {}
        c.equal("elapsed preparation still trips deadline", reused.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let queue = try controller()
        tick = 61_000_000_000
        do { try queue.check(phase: "queue") } catch {}
        c.equal("queue uses same clock", queue.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let decoding = try controller()
        decoding.sampledFirstToken(); tick = 61_000_000_000
        try decoding.check(phase: "decode")
        c.expect("decode does not inherit the prefill deadline", decoding.failure == nil)
        let timeless = try controller(wait: 0)
        tick += 100_000_000_000; try timeless.check()
        available = 1
        do { try timeless.check(nextAllocationBytes: 1) } catch {}
        c.equal("zero time policy retains memory guard", timeless.failure?.code, .insufficientMemory)
        available = 3
        let growth = try controller(wait: 0)
        do { try growth.check(nextAllocationBytes: 2_000_000_000) } catch {}
        c.equal("next allocation is charged before it starts", growth.failure?.code, .insufficientMemory)
        available = 10; pressure = true
        let pressed = try controller(wait: 0)
        do { try pressed.check() } catch {}
        c.equal("pressure is independent of time", pressed.failure?.code, .insufficientMemory)
        pressure = false; connected = false
        let cancelled = try controller()
        do { try cancelled.check() } catch {}
        c.equal("disconnect is typed cancellation", cancelled.failure?.code, .clientCancelled)
        c.expect("failed request cannot retain state", !cancelled.mayRetainState)
        let unknown = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536),
            slackBytes: 1_500_000_000, availableGB: { nil })
        do { try unknown.check(nextAllocationBytes: 1) } catch {}
        c.equal("unknown memory refuses long-state growth", unknown.failure?.code, .insufficientMemory)
        var governor = GovernorPolicy.Inputs(currentSlots: 2000, availableGB: 4, ramGB: 51.5,
            workingSetGB: 40.2, maxContextTokens: 65536)
        let empty = GovernorPolicy.desiredPlan(governor)
        governor.ownedAdditionalBytes = 1_000_000_000
        let owned = GovernorPolicy.desiredPlan(governor)
        c.expect("owned memory changes replan credit", (owned?.targetGB ?? 0) > (empty?.targetGB ?? 0))
        c.equal("request cap survives ownership credit", owned?.maxContextTokens, 65536)
        governor.availableGB = 0; governor.currentSlots = Geometry.floorSlots
        governor.maxContextTokens = ContextPolicy.modelLimit; governor.contextQualification = true
        governor.ownedAdditionalBytes = 0
        c.expect("infeasible governor plan is explicit", GovernorPolicy.desiredPlan(governor) == nil)
        for cap in [1, 1024, ContextPolicy.defaultTokens, ContextPolicy.mtpLimit] {
            for mtp in [false, true] {
                let exhausted = GovernorPolicy.Inputs(currentSlots: Geometry.floorSlots,
                    availableGB: 0, ramGB: 51.5, workingSetGB: 40.2,
                    mtpEnabled: mtp, maxContextTokens: cap)
                c.expect("ordinary startup advisory cannot authorize live work/\(cap)/\(mtp)",
                    GovernorPolicy.desiredPlan(exhausted) == nil)
                c.equal("infeasible floor does not invent a smaller arena/\(cap)/\(mtp)",
                    GovernorPolicy.decide(exhausted), .hold)
                var recovered = exhausted
                recovered.availableGB = 10
                if let plan = GovernorPolicy.desiredPlan(recovered) {
                    let physical = min(recovered.workingSetGB, recovered.availableGB
                        + Geometry.gb(recovered.currentSlots) + Planner.fixedFootprintGB
                        + (mtp ? Planner.mtpResidentGB : 0)
                        - Planner.availabilitySlackGB(ramGB: recovered.ramGB))
                    c.expect("recovery fits its credited physical budget/\(cap)/\(mtp)",
                        Double(plan.memoryLedger.expectedPeakBytes) <= physical * 1e9)
                    c.equal("feasible recovery preserves required head/\(cap)/\(mtp)", plan.mtpEnabled, mtp)
                } else {
                    c.expect("ordinary context has a feasible pure recovery/\(cap)/\(mtp)", false)
                }
            }
        }
        c.equal("overflowing public ledger saturates to refusal", ContextMemoryLedger(slots: Int.max,
            context: Int.max, chunk: Int.max, retentionTokens: Int.max, mtp: true, visionResident: true).expectedPeakBytes, Int.max)
        func expertWorkspace(_ tokens: Int = 4096, tile: Int = 1024,
                             batch: Int = 32, pool: Int = 0, admissions: Int = 0,
                             record: Int = 2_764_800) -> Int {
            ContextWorkspace.expertWorkspaceBytes(tokens: tokens, tile: tile, experts: 512,
                topK: 10, hidden: 2560, intermediate: 640, recordBytes: record,
                loadBatch: batch, admissionPoolBytes: pool, admissionRecords: admissions)
        }
        c.expect("scope admission prices old and replacement expert storage",
            expertWorkspace() >= 2 * 512 * 2_764_800 + 32 * 2_764_800)
        c.expect("scope staging override cannot hide a whole-layer upload",
            expertWorkspace(batch: 512) > expertWorkspace(batch: 32))
        c.expect("scope admission prices decode-pool replacement",
            expertWorkspace(pool: 1217 * 2_764_800, admissions: 25) > expertWorkspace())
        c.expect("large routed tile increases allocation reservation",
            expertWorkspace(tile: 4096) > expertWorkspace(tile: 1024))
        c.expect("merged routed tail cannot reduce allocation reservation",
            expertWorkspace(1279, tile: 1024) >= expertWorkspace(1024, tile: 1024))
        c.expect("retained scope outputs are charged beyond one compute tile",
            expertWorkspace(8192) > expertWorkspace(4096))
        c.equal("scope record overflow refuses before dispatch", expertWorkspace(record: Int.max), Int.max)
        c.equal("invalid scope tile refuses before dispatch", expertWorkspace(tile: 0), Int.max)
        c.equal("invalid scope staging refuses before dispatch", expertWorkspace(batch: 513), Int.max)
        c.equal("negative scope pool refuses before dispatch", expertWorkspace(pool: -1), Int.max)
        c.equal("scope admission requires an actual pool allocation", expertWorkspace(admissions: 1), Int.max)
        c.equal("invalid scope extent refuses before dispatch", expertWorkspace(0), Int.max)
        c.expect("grouped matmul expert padding is charged for a small route set",
            ContextWorkspace.expertWorkspaceBytes(tokens: 1, tile: 256, experts: 512,
                topK: 1, hidden: 2560, intermediate: 640, recordBytes: 1, loadBatch: 1)
                >= 2048 * (5 * 2560 + 4 * 640) * 4)
        c.equal("scope route geometry rejects more routes than experts",
            ContextWorkspace.expertWorkspaceBytes(tokens: 4096, tile: 1024, experts: 512,
                topK: 513, hidden: 2560, intermediate: 640, recordBytes: 2_764_800,
                loadBatch: 32), Int.max)
        let originalVision = ContextWorkspace.visionBytes(patches: 9216)
        let tiledVision = ContextWorkspace.visionBytes(patches: 9216, queryTile: 256)
        c.expect("vision charge uses actual query bound", originalVision > tiledVision * 4)
        c.equal("unsupported vision mode is refused", ContextWorkspace.visionBytes(patches: 9216, queryTile: 512), Int.max)
        c.expect("late 64 pass retains context-dependent workspace", ContextWorkspace.prefillBytes(pass: 64, context: 262144) > 64 * 1_300_000)
        for override in [1, 64, 128, 256, 257, 511, 513, 1023, 2047, 4095, 4096] {
            for position in [0, 32768, 65535, 65536] {
                c.expect("ordinary window preserves original floor/\(override)/\(position)",
                    PrefillSchedule.chunk(at: position, maxChunk: override) >= 256)
            }
        }
        c.equal("projection shape padding is charged before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 256), 256 * 1_300_000)
        c.equal("invalid projection shape refuses before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 257), Int.max)
        c.equal("unbounded 128 final pass is refused", ContextWorkspace.prefillBytes(pass: 128, context: 262144), Int.max)
        c.equal("small attention domain stops at actual prompt end", ContextWorkspace.keyExtent(pass: 64,
            context: 448, referenceEnd: 470), 470)
        c.equal("small attention domain follows exact prefix origin", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 17, referenceEnd: 515), 273)
        c.equal("invalid reference domain fails closed", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 18, referenceEnd: 515), Int.max)
        c.equal("one-row tail preserves matrix query dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 449, referenceEnd: 449), 64)
        c.equal("canonical one-row terminal keeps vector dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 513, referenceEnd: 513), 1)
        c.equal("one-row tail prices its real key domain", ContextWorkspace.keyExtent(pass: 1,
            context: 449, referenceEnd: 449), 449)
        c.expect("padded tail workspace includes physical queries", ContextWorkspace.prefillBytes(pass: 1,
            context: 262143, referenceEnd: 262144, minimumProjectionRows: 256, padSmallQueries: true)
            >= 64 * 262144 * (24 * 8 + 16))
        for override in [64, 68, 127, 128, 136, 137, 255] {
            c.equal("late odd override selects a qualified full-pass shape/\(override)",
                ContextWorkspace.boundedSmallPass(requested: override, at: 200000,
                    referenceStart: 200000, referenceEnd: 262144), override >= 128 ? 128 : 64)
        }
        for origin in [0, 1, 17, 130001, 131073] {
            var position = max(origin, 256273), total = 0
            while position < ContextPolicy.modelLimit {
                let n = ContextWorkspace.boundedSmallPass(requested: 128, at: position,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                guard n > 0 else { c.expect("small-pass schedule advances/\(origin)", false); break }
                let extent = ContextWorkspace.keyExtent(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                let queries = ContextWorkspace.queryRows(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                c.expect("actual padded product stays bounded/\(origin)/\(position)",
                    queries * extent <= PrefillSchedule.measuredQueryKeyProduct)
                c.expect("small pass never crosses its reference domain/\(origin)/\(position)",
                    n <= 256 - ((position - origin) % 256))
                position += n; total += n
            }
            c.equal("small-pass schedule closes/\(origin)", total, ContextPolicy.modelLimit - max(origin, 256273))
        }
        let busy = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
            on: Machine.simulated(ramGB: 16, workingSetGB: 12, availableGB: 5))
        c.equal("busy machine never calls an unphysical window feasible", busy.maximumFeasibleWindow, 0)
        for prefix in [false, true] {
            let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
            let result = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
                on: machine, runtimePolicy: policy, qualification: true)
            c.expect("solver freezes actual retention policy \(prefix)", result.maximumPlan?.runtimeAllocationPolicy == policy)
            if let maximum = result.maximumPlan, maximum.maxContextTokens < ContextPolicy.modelLimit {
                let next = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: maximum.maxContextTokens + 1,
                    simulated: true, qualification: true, runtimePolicy: policy)
                c.expect("same-policy next token fails \(prefix)", next == nil)
            }
        }
        c.expect("negative scope start is refused", PrefillSchedule.scopePasses(remaining: 10,
            at: -1, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        c.expect("overflowing scope is refused", PrefillSchedule.scopePasses(remaining: Int.max,
            at: 262140, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        let inputGuard = RequestController(configuration: try ContextConfiguration(), slackBytes: 0, availableGB: { 10 })
        do { try inputGuard.check(nextAllocationBytes: -1) } catch {}
        c.equal("negative public allocation cannot bypass guard", inputGuard.failure?.code, .invalidConfiguration)
        c.equal("negative public workspace scope refuses safely", ContextWorkspace.prefillBytes(pass: 64, context: 1024, scope: Int.min), Int.max)
        var nested = JSONValue.string("payload")
        for _ in 0 ..< 64 { nested = .array([nested]) }
        c.equal("deep input is bounded before template recursion", ContextInputMemory.bytes(nested), Int.max)
        let tool = ToolDefinition(name: "read", description: "description", parameters: .object(["long": .string(String(repeating: "x", count: 5000))]))
        c.expect("tool schema charged before tokenization", ContextInputMemory.bytes(messages: [], tools: [tool]) >= 5000)
        // Freeze a whole-machine reading, then account for what an existing
        // instance actually owns. A feasible restart and settled governor
        // must agree. The preserved legacy startup floor can also return an
        // advisory that exceeds the physical budget; that is a refusal case,
        // never evidence that the live governor should admit work.
        var governorCaps = Set<Int>()
        var advisoryRefusals = Set<String>()
        for cap in [8192, 32768, 65536, 131072, 262144] {
            for prefix in [false, true] {
                let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
                for mode in [0, 1, 2] where mode == 0 || cap <= 65536 {
                    for whole in [10.0, 12.0, 18.0, 44.0] {
                        let label = "governor \(cap)/prefix=\(prefix)/mode=\(mode)/available=\(whole)"
                        let initial = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: whole,
                            mtp: mode == 1 ? .on : .off, mtpAvailable: mode == 1,
                            vision: mode == 2 ? .on : .off, visionAvailable: mode == 2,
                            visionResidentReserved: mode == 2, maxContextTokens: cap,
                            qualification: true, runtimePolicy: policy)
                        guard let initial else { continue }
                        let additional = ContextGeometry.additionalActiveBytes(tokens: cap, mtp: mode == 1)
                        let held = prefix ? min(initial.prefixCacheTokens, 8192) * PrefixCache.bytesPerToken : 0
                        let owned = additional + held + (held > 0 ? PrefixCache.fixedBytesPerEntry : 0)
                        let physical = whole - initial.poolGB - Planner.fixedFootprintGB
                            - (mode == 1 ? Planner.mtpResidentGB : 0)
                            - (mode == 2 ? Planner.visionResidentGB : 0) - Double(owned) / 1e9
                        guard physical >= 0 else { continue }
                        governorCaps.insert(cap)
                        var input = GovernorPolicy.Inputs(currentSlots: initial.slots, availableGB: physical,
                            ramGB: 51.5, workingSetGB: 40.2, mtpEnabled: mode == 1,
                            visionEnabled: mode == 2, visionResidentReserved: mode == 2,
                            maxContextTokens: cap, runtimeAllocationPolicy: policy,
                            ownedAdditionalBytes: owned, contextQualification: true)
                        let settled = GovernorPolicy.desiredPlan(input)
                        let physicalBudget = min(input.workingSetGB,
                            whole - Planner.availabilitySlackGB(ramGB: input.ramGB))
                        let peak = Double(initial.memoryLedger.expectedPeakBytes)
                        let feasible = peak <= physicalBudget * 1e9
                            && (initial.targetGB.map { peak <= $0 * 1e9 } ?? true)
                        if !feasible {
                            advisoryRefusals.insert("\(cap)/\(prefix)/\(mode)/\(whole)")
                            c.expect("\(label): legacy startup advisory is refused live", settled == nil)
                            let target: Int
                            switch GovernorPolicy.decide(input) {
                            case .hold: target = input.currentSlots
                            case .resize(let slots, _): target = slots
                            }
                            c.equal("\(label): infeasible advisory settles at arena floor", target, Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - target)
                            input.currentSlots = target
                            c.expect("\(label): returning owned pool bytes cannot invent feasibility",
                                GovernorPolicy.desiredPlan(input) == nil)
                            c.equal("\(label): infeasible floor cannot shrink further", GovernorPolicy.decide(input), .hold)
                            continue
                        }
                        c.expect("\(label): same allocation after ownership credit", settled.map { abs($0.slots - initial.slots) <= 1 } ?? false)
                        c.equal("\(label): settled policy holds", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): chunk policy persists", settled?.prefillChunk, 256)
                        c.equal("\(label): mode persists", settled?.mtpEnabled, mode == 1)
                        if !prefix { c.equal("\(label): no retention resurrection", settled?.prefixCacheTokens, 0) }
                        input.pressure = .critical
                        let decision = GovernorPolicy.decide(input)
                        if case .resize(let slots, _) = decision {
                            c.expect("\(label): pressure gives memory back", slots < input.currentSlots && slots >= Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - slots)
                            input.currentSlots = slots
                        }
                        input.pressure = nil; input.secondsSincePressure = 1
                        c.equal("\(label): recovery respects cooldown", GovernorPolicy.decide(input), .hold)
                        input.secondsSincePressure = 61; input.secondsSinceResize = 61
                        if case .resize(let slots, _) = GovernorPolicy.decide(input) {
                            input.availableGB -= Geometry.gb(slots - input.currentSlots)
                            input.currentSlots = slots
                        }
                        c.equal("\(label): one recovery step settles", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): context survives recovery", GovernorPolicy.desiredPlan(input)?.maxContextTokens, cap)
                    }
                }
            }
        }
        c.equal("governor matrix executes every intended cap", governorCaps, Set([8192, 32768, 65536, 131072, 262144]))
        c.equal("governor matrix preserves all four original unphysical advisories", advisoryRefusals,
            Set(["8192/false/0/10.0", "8192/true/0/10.0", "32768/false/0/10.0", "32768/true/0/10.0"]))
        return c.report()
    }
}

````````````

## Artifact SHA-256 77e902b2efccbb59c9ee6695f115beb8f9e0c39e23f2a8e49d488404e1e25542

Encoding: `utf-8`. Original bytes: 61362.

````````````text
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Numerical/read-count probe only. Several states coexist for comparison;
    /// its resource and duration observations are not fresh-process A/B claims.
    public static func optimizationReadScope(modelDir: URL, tokens: Int) throws -> CheckReport {
        guard [4096, 8192].contains(tokens) else { throw ModelError("scope probe tokens must be 4096 or 8192") }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        var c = CheckBuilder("optimization-layer-read-scope")
        c.measure("workspace_token_tile", Double(model.optimizations.workspaceTokenTile))
        func build(chunk: Int, workspace: Bool) -> (Qwen4ExpModel.State, MLXArray, [Int: [Int32]], Int) {
            var options = InferenceOptimizations()
            options.compactStateWindows = true
            options.boundedIndexer = true
            options.boundedPLE = true
            options.layerExpertWorkspace = workspace
            options.workspaceTokenTile = model.optimizations.workspaceTokenTile
            options.compactScopeFrontier = model.optimizations.compactScopeFrontier
            model.optimizations = options
            model.pool.resetStats()
            model.pool.admitOnSweep = false
            var routes: [Int: [Int32]] = [:]
            model.routerObserver = { layer, ids in routes[layer, default: []].append(contentsOf: ids) }
            let state = model.makeState()
            var last = MLXArray(Float(0))
            for lo in stride(from: 0, to: tokens, by: chunk) {
                last = model.lastLogits(Array(ids[lo ..< min(tokens, lo + chunk)]), state: state)
                eval(last)
            }
            model.routerObserver = nil
            return (state, last, routes, model.pool.recordsFetched)
        }
        let (reference, referenceLogits, referenceRoutes, referenceReads) = build(chunk: 4096, workspace: false)
        let (control, controlLogits, controlRoutes, controlReads) = build(chunk: 1024, workspace: false)
        let (candidate, candidateLogits, candidateRoutes, candidateReads) = build(chunk: tokens, workspace: true)
        func relative(_ a: MLXArray, _ b: MLXArray, spread: Bool = false) -> Double {
            guard a.shape == b.shape, a.dtype == b.dtype else { return .infinity }
            let af = a.asType(.float32), bf = b.asType(.float32)
            let delta = abs(af - bf).max().item(Float.self)
            let denominator = spread ? (bf.max() - bf.min()).item(Float.self) : abs(bf).max().item(Float.self)
            return Double(delta / max(denominator, 1e-6))
        }
        let controlDelta = relative(controlLogits, referenceLogits, spread: true)
        let candidateDelta = relative(candidateLogits, referenceLogits, spread: true)
        c.measure("control_logit_spread_fraction", controlDelta)
        c.measure("candidate_logit_spread_fraction", candidateDelta)
        c.expect("logits inside preregistered rechunk band", candidateDelta <= max(3 * controlDelta, 0.01))
        c.equal("greedy final token", argMax(candidateLogits.reshaped([-1])).item(Int.self), argMax(referenceLogits.reshaped([-1])).item(Int.self))
        let rt = reference.diagnosticTensors(), ct = control.diagnosticTensors(), nt = candidate.diagnosticTensors()
        c.equal("candidate state fields", Set(nt.keys), Set(rt.keys))
        for key in rt.keys.sorted() {
            if let controlValue = ct[key], let candidateValue = nt[key] {
                if key == "tokens" || key == "ngram" {
                    c.expect("exact \(key)", (rt[key]! .== candidateValue).all().item(Bool.self))
                } else {
                    let baseline = relative(controlValue, rt[key]!)
                    let changed = relative(candidateValue, rt[key]!)
                    c.measure("control.\(key)", baseline)
                    c.measure("candidate.\(key)", changed)
                    c.expect("state band \(key)", changed <= max(3 * baseline, 0.01))
                }
            }
        }
        func routeDisagreement(_ routes: [Int: [Int32]]) -> Double {
            var different = 0, total = 0
            var stamps = [Int](repeating: 0, count: model.cfg.numExperts)
            var stamp = 0
            for layer in referenceRoutes.keys.sorted() {
                let ref = referenceRoutes[layer]!, got = routes[layer] ?? []
                guard ref.count == got.count else { return .infinity }
                for lo in stride(from: 0, to: ref.count, by: model.cfg.topK) {
                    stamp += 1
                    for i in lo ..< lo + model.cfg.topK { stamps[Int(ref[i])] = stamp }
                    for i in lo ..< lo + model.cfg.topK {
                        if stamps[Int(got[i])] != stamp { different += 1 }
                        total += 1
                    }
                }
            }
            return Double(different) / Double(max(1, total))
        }
        let ctrlRoutes = routeDisagreement(controlRoutes), newRoutes = routeDisagreement(candidateRoutes)
        c.measure("control_route_set_disagreement", ctrlRoutes)
        c.measure("candidate_route_set_disagreement", newRoutes)
        c.expect("routing inside preregistered rechunk band", newRoutes <= max(3 * ctrlRoutes, 0.01))
        c.measure("reference_read_records", Double(referenceReads))
        c.measure("control_read_records", Double(controlReads))
        c.measure("candidate_read_records", Double(candidateReads))
        c.expect("one record at most per layer/expert in a scope", candidateReads <= model.runLayers * model.cfg.numExperts)
        if tokens > 4096 { c.expect("larger scope reads fewer records", candidateReads < referenceReads) }
        c.measure("probe_process_footprint_end_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }

    public static func optimizationScopeLifecycle(modelDir: URL, integratedBase: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        let generator = Generator(model: model)
        generator.prefillChunk = 256
        generator.prefillCacheLimit = 128 << 20
        var options = integratedBase ? InferenceOptimizations.integrationCandidate : InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.boundedIndexer = true; options.boundedPLE = true
        options.layerExpertWorkspace = true; options.skipUnusedFinalForward = true
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        model.optimizations = options
        var c = CheckBuilder("optimization-scope-lifecycle")
        c.measure("integrated_base", integratedBase ? 1 : 0)
        if integratedBase { c.expect("combined scope lifecycle uses bounded embedding rows", model.resident.usesEmbeddingRows) }
        let prompt = (0 ..< 1280).map { 1000 + (($0 * 7919) % 200_000) }
        var params = SampleParams.greedy; params.maxTokens = 1; params.seed = 7
        func equalState(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(name): fields", Set(at.keys), Set(bt.keys))
            for key in at.keys.sorted() {
                if let v = bt[key] {
                    c.expect("\(name): \(key)", at[key]!.shape == v.shape && (at[key]! .== v).all().item(Bool.self))
                }
            }
        }
        func seed() -> PrefixCache {
            let cache = PrefixCache(maxTokens: 8192)
            let state = model.makeState()
            eval(model.lastLogits(Array(prompt.prefix(256)), state: state))
            cache.store(state: state, tokens: Array(prompt.prefix(256)))
            return cache
        }
        let referenceCache = seed(), candidateCache = seed()
        let seedState = referenceCache.take(matching: prompt, reserveTokens: 2048)!.state
        let untouched = seed()
        params.maxTokens = 1
        let (referenceIds, referenceStats) = generator.generate(promptIds: prompt, params: params,
            eosIds: [], cache: untouched)
        let referenceState = untouched.take(matching: prompt + referenceIds + [907], reserveTokens: 2048)!.state
        model.optimizations.readScopeTokens = 1024
        for cutLayer in [0, 1, 3, 47] {
            var layer = -1
            model.routerObserver = { current, _ in layer = current }
            let savedLimit = MLX.Memory.cacheLimit
            let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: candidateCache,
                shouldContinue: { layer < cutLayer })
            model.routerObserver = nil
            c.expect("layer \(cutLayer): cancel emits no token", ids.isEmpty)
            c.equal("layer \(cutLayer): abort counted", stats.abortedReadScopes, 1)
            c.equal("layer \(cutLayer): no partial commit", stats.prefillTokens, 0)
            c.expect("layer \(cutLayer): no completed passes", stats.prefillPasses.isEmpty)
            c.equal("layer \(cutLayer): cache limit restored", MLX.Memory.cacheLimit, savedLimit)
            c.expect("layer \(cutLayer): admission restored", !model.pool.admitOnSweep)
            let hit = candidateCache.take(matching: prompt, reserveTokens: 2048)!
            c.equal("layer \(cutLayer): exact committed prefix", hit.reused, 256)
            equalState(seedState, hit.state, "layer \(cutLayer): restored state")
            candidateCache.store(state: hit.state, tokens: Array(prompt.prefix(256)))
        }
        let (candidateIds, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: candidateCache)
        c.equal("retry exact output", candidateIds, referenceIds)
        c.equal("reference compute schedule", referenceStats.prefillComputePasses, [256, 256, 256, 256])
        c.equal("candidate preserves compute schedule", stats.prefillComputePasses, referenceStats.prefillComputePasses)
        c.equal("candidate commits one read scope", stats.prefillPasses, [1024])
        let candidateState = candidateCache.take(matching: prompt + candidateIds + [907], reserveTokens: 2048)!.state
        equalState(referenceState, candidateState, "retry exact continuation")
        c.expect("capacity remains charged after abort and growth", candidateState.allocatedSequenceBytes > 0)
        if integratedBase {
            c.expect("combined scope lifecycle executes fused rotation", model.fusedRoPERotationsScheduled > 0)
            c.equal("combined scope lifecycle returns an idle pool", model.pool.pinnedSlotCount, 0)
            // A cold read scope must not erase the independently qualified
            // common-prefix checkpoint merely by grouping past its boundary.
            let coldCache = PrefixCache(maxTokens: 8192)
            let cold = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: coldCache)
            c.equal("cold combined scope preserves exact output", cold.0, referenceIds)
            c.equal("cold combined scope stores the requested checkpoint", cold.1.prefixCheckpointStores, 1)
            c.equal("checkpoint splits only the read group", cold.1.prefillPasses, [256, 1024])
            c.equal("checkpoint preserves every compute pass", cold.1.prefillComputePasses, Array(repeating: 256, count: 5))
            if let complete = coldCache.take(matching: prompt + cold.0 + [907], reserveTokens: 2048) {
                equalState(referenceState, complete.state, "cold combined scope exact continuation")
            } else { c.expect("cold combined scope retains complete state", false) }
            let divergent = Array(prompt.prefix(256)) + [999]
            if let common = coldCache.take(matching: divergent, reserveTokens: 2048) {
                c.equal("divergent followup reuses the common checkpoint", common.reused, 256)
                equalState(seedState, common.state, "cold scope checkpoint matches chronological seed")
            } else { c.expect("cold scope retains the divergent followup checkpoint", false) }
            c.equal("cold scope and checkpoint forks release pool pins", model.pool.pinnedSlotCount, 0)
            for disabled in [PrefixCache(maxTokens: 8192, enabled: false), PrefixCache(maxTokens: 0)] {
                let result = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: disabled)
                c.equal("inactive cache preserves the original read groups", result.1.prefillPasses, [1024, 256])
                c.equal("inactive cache creates no checkpoint", result.1.prefixCheckpointStores, 0)
                c.equal("inactive cache retains exact scoped output", result.0, referenceIds)
            }
        }
        return c.report()
    }

    /// Synthetic already-encoded image rows isolate span/offset/state
    /// handling. The separate real-image serving gate covers tower execution.
    public static func optimizationScopeMTPVision(modelDir: URL, integratedBase: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        try model.enableMTP(modelDir: modelDir)
        let head = model.mtpHead!
        var options = integratedBase ? InferenceOptimizations.integrationCandidate : InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.boundedIndexer = true; options.boundedPLE = true; options.layerExpertWorkspace = true
        options.workspaceTokenTile = model.optimizations.workspaceTokenTile
        options.compactScopeFrontier = model.optimizations.compactScopeFrontier
        model.optimizations = options
        let ids = (0 ..< 1024).map { 1000 + (($0 * 7919) % 200_000) }
        let rows = MLXArray((0 ..< 640 * model.cfg.hiddenSize).map { Float($0 % 29 - 14) / 32 },
            [640, model.cfg.hiddenSize]).asType(.bfloat16)
        eval(rows)
        let run = VisionRun(start: 128, rows: rows)
        var c = CheckBuilder("optimization-scope-mtp-vision")
        c.measure("integrated_base", integratedBase ? 1 : 0)
        if integratedBase { c.expect("combined MTP/vision scope uses bounded embedding rows", model.resident.usesEmbeddingRows) }
        func equal(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let av = a.diagnosticTensors(), bv = b.diagnosticTensors()
            c.equal("\(name): fields", Set(av.keys), Set(bv.keys))
            for key in av.keys.sorted() {
                if let v = bv[key] { c.expect("\(name): \(key)", av[key]!.shape == v.shape && (av[key]! .== v).all().item(Bool.self)) }
            }
        }
        func consume(_ state: Qwen4ExpModel.State, _ range: Range<Int>) -> MLXArray {
            let chunk = Array(ids[range]), vision = [run.clipped(to: range.lowerBound, range.upperBound)].compactMap { $0 }
            let (mixed, multi) = model.hiddenStatesWithMulti(chunk, state: state, vision: vision)
            state.lastMulti = head.consume(chunk: chunk, chunkMulti: multi, prevMulti: state.lastMulti,
                resident: model.resident, rope: model.sharedRope, state: state.mtp!, vision: vision, compactRetainedRow: true)
            eval(mixed); return mixed
        }
        func seed() -> Qwen4ExpModel.State {
            let state = model.makeState(); state.mtp = MTPState()
            _ = consume(state, 0 ..< 256); return state
        }
        let seedState = seed(), reference = seed(), candidate = seed()
        for lo in stride(from: 256, to: 1024, by: 256) { _ = consume(reference, lo ..< lo + 256) }
        let remaining = Array(ids[256...]), vision = [run.clipped(to: 256, 1024)!]
        var layer = -1, checksAfterLast = 0
        model.routerObserver = { current, _ in layer = current }
        let callerCacheLimit = MLX.Memory.cacheLimit
        let cancelled = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: {
                if layer == model.runLayers - 1 { checksAfterLast += 1; return checksAfterLast < 3 }
                return true
            })
        model.routerObserver = nil
        c.expect("cancel during second draft-head tile", !cancelled.committed && checksAfterLast == 3)
        c.expect("cancel returns no logits", cancelled.logits == nil)
        c.equal("direct scope cancellation restores buffer-cache limit", MLX.Memory.cacheLimit, callerCacheLimit)
        c.expect("cancel restores valid draft prefix", candidate.hasValidMTP)
        equal(seedState, candidate, "image/MTP rollback")
        let result = model.consumeReadScope(remaining, passes: [256, 256, 256], state: candidate,
            vision: vision, head: head, final: true, shouldContinue: nil)
        c.expect("retry commits scope", result.committed && result.logits != nil)
        c.equal("direct scope success restores buffer-cache limit", MLX.Memory.cacheLimit, callerCacheLimit)
        c.expect("retry draft aligned", candidate.hasValidMTP)
        equal(reference, candidate, "image/MTP continuation")
        // A checked expert-read error exits the model directly, without the
        // generator's outer cache-limit restoration masking a leaked setting.
        let failedState = seed()
        let fault = ReadFault(afterJobs: 17)
        model.pool.readFault = fault
        do {
            defer { model.pool.readFault = nil }
            do {
                _ = try model.consumeReadScopeChecked(remaining, passes: [256, 256, 256], state: failedState,
                    vision: vision, head: head, final: true, shouldContinue: nil)
                c.expect("direct scope read error returned", false)
            } catch is CheckpointReadError {
                c.expect("direct scope read error returned", true)
            }
        }
        c.expect("direct scope read fault fired", fault.hasFired)
        c.equal("direct scope error restores buffer-cache limit", MLX.Memory.cacheLimit, callerCacheLimit)
        equal(seedState, failedState, "direct scope read-error rollback")
        let recovered = try model.consumeReadScopeChecked(remaining, passes: [256, 256, 256], state: failedState,
            vision: vision, head: head, final: true, shouldContinue: nil)
        c.expect("direct scope read-error retry commits", recovered.committed && recovered.logits != nil)
        c.equal("direct scope read-error retry restores buffer-cache limit", MLX.Memory.cacheLimit, callerCacheLimit)
        equal(reference, failedState, "direct scope read-error retry exact")
        let r = model.lastLogits([907], state: reference), n = model.lastLogits([907], state: candidate)
        c.expect("next target logits exact", (r .== n).all().item(Bool.self))
        if integratedBase {
            c.expect("combined MTP/vision scope executes fused rotation", model.fusedRoPERotationsScheduled > 0)
        }
        return c.report()
    }

    public static func optimizationMTPWork(modelDir: URL) throws -> CheckReport {
        try optimizationMTPWork(modelDir: modelDir, integratedBase: false)
    }

    package static func optimizationMTPWork(modelDir: URL, integratedBase: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: integratedBase ? true : nil)
        try model.enableMTP(modelDir: modelDir)
        let generator = Generator(model: model)
        model.optimizations = integratedBase ? .integrationCandidate : InferenceOptimizations()
        model.optimizations.compactStateWindows = true
        model.optimizations.compactMTPRow = true
        model.optimizations.fusedGDNRecording = !integratedBase
        var c = CheckBuilder(integratedBase ? "optimization-mtp-work-integrated" : "optimization-mtp-work")
        let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
        for depth in [1, 3] {
            generator.draftDepth = depth
            for sampled in [false, true] { for limit in [1, 2, 5] {
                var params = SampleParams.greedy; params.maxTokens = limit; params.seed = 7
                if sampled {
                    params.temperature = 0.7; params.topK = 40
                    params.topP = 0.8; params.minP = 0.05; params.presencePenalty = 1.1
                }
                model.optimizations.reuseFirstMTPEntry = false
                model.optimizations.boundedDraftTail = false
                let (reference, referenceStats) = generator.generate(promptIds: prompt, params: params, eosIds: [])
                for mode in ["first", "tail", "both"] {
                    model.optimizations.reuseFirstMTPEntry = mode != "tail"
                    model.optimizations.boundedDraftTail = mode != "first"
                    let cache = PrefixCache(maxTokens: 4096)
                    let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
                    let name = "depth \(depth), sampled \(sampled), limit \(limit), \(mode)"
                    c.equal("\(name): emitted count", ids.count, limit)
                    c.equal("\(name): stable fixture output", ids, reference)
                    if sampled && mode != "first" {
                        c.equal("\(name): sampled fallback preserves draft work", stats.draftedTokens, referenceStats.draftedTokens)
                        c.equal("\(name): sampled fallback preserves target shape", stats.decodeModelTokens, referenceStats.decodeModelTokens)
                        c.equal("\(name): sampled fallback preserves verification count", stats.verifyPasses, referenceStats.verifyPasses)
                    }
                    let retained = cache.take(matching: prompt + ids + [907], reserveTokens: 1024)
                    c.expect("\(name): retained committed prefix", retained != nil)
                    guard let hit = retained else { continue }
                    c.expect("\(name): aligned draft", hit.state.hasValidMTP)
                    c.expect("\(name): consumed prefix within emitted tokens",
                        hit.state.tokenCount >= prompt.count && hit.state.tokenCount <= prompt.count + ids.count)
                    c.equal("\(name): reconciliation covers committed positions",
                        stats.reconciledHeadTokens + stats.reusedHeadTokens, hit.state.tokenCount - prompt.count)
                    if limit == 1 { c.equal("\(name): no terminal verification", stats.verifyPasses, 0) }
                    if limit == 2 && mode != "first" && !sampled {
                        c.equal("\(name): terminal output needs zero drafts", stats.draftedTokens, 0)
                        c.equal("\(name): one target position suffices", stats.decodeModelTokens, 1)
                        c.equal("\(name): final emission stays pending", hit.state.tokenCount, prompt.count + 1)
                    }
                    if limit > 1 && mode == "first" {
                        c.equal("\(name): first entry reused each round", stats.reusedHeadTokens, stats.verifyPasses)
                    }
                }
            } }
        }
        return c.report()
    }

    public static func optimizationGDNKernel() -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-gdn-recording-kernel")
        func values(_ shape: [Int], scale: Float) -> MLXArray {
            let count = shape.reduce(1, *)
            return MLXArray((0 ..< count).map { Float(($0 * 7919) % 127 - 63) * scale }, shape)
        }
        for T in [1, 2, 3, 5, 17, 18] {
            for dims in [(2, 4, 32, 8), (2, 4, 128, 128), (1, 2, 33, 8)] {
                let (Hk, Hv, Dk, Dv) = dims
                let B = 2
                let q = values([B, T, Hk, Dk], scale: 0.001).asType(.bfloat16)
                let k = values([B, T, Hk, Dk], scale: 0.001).asType(.bfloat16)
                let v = values([B, T, Hv, Dv], scale: 0.01).asType(.bfloat16)
                let a = values([B, T, Hv], scale: 0.1).asType(.bfloat16)
                let b = -a
                // exp(aLog) overflows for the first head, giving exact zero
                // decay; all other heads retain finite nontrivial memory.
                let aLog = MLXArray((0 ..< Hv).map { $0 == 0 ? Float(100) : Float(-2) })
                let bias = MLXArray.zeros([Hv], dtype: .bfloat16)
                let initial = values([B, Hv, Dv, Dk], scale: 0.01)
                for pattern in 0 ..< 3 {
                    let mask: MLXArray? = pattern == 0 ? nil : MLXArray((0 ..< B * T).map { pattern == 1 && $0 % 2 == 0 }, [B, T])
                    let result = gatedDeltaUpdateRecording(q: q, k: k, v: v, a: a, b: b,
                        aLog: aLog, dtBias: bias, state: initial, mask: mask)
                    eval([result.output] + result.states)
                    var reference = initial
                    var outputs: [MLXArray] = []
                    for t in 0 ..< T {
                        let (y, state) = gatedDeltaUpdate(
                            q: q[0..., t ..< (t + 1)], k: k[0..., t ..< (t + 1)], v: v[0..., t ..< (t + 1)],
                            a: a[0..., t ..< (t + 1)], b: b[0..., t ..< (t + 1)], aLog: aLog, dtBias: bias,
                            state: reference, mask: mask?[0..., t ..< (t + 1)])
                        reference = state; outputs.append(y)
                        c.expect("T\(T) Dk\(Dk) mask\(pattern) state\(t)", (state .== result.states[t]).all().item(Bool.self))
                    }
                    c.expect("T\(T) Dk\(Dk) mask\(pattern) outputs", (concatenated(outputs, axis: 1) .== result.output).all().item(Bool.self))
                    c.equal("T\(T) Dk\(Dk) mask\(pattern) owns every state", result.states.count, T)
                }
            }
        }
        return c.report()
    }

    public static func optimizationLifecycle(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let generator = Generator(model: model)
        model.optimizations.compactStateWindows = true
        model.optimizations.compactMTPRow = true
        model.optimizations.skipUnusedFinalForward = true
        generator.prefillChunk = 256
        generator.prefillCacheLimit = 128 << 20
        var c = CheckBuilder("optimization-lifecycle")
        func equalState(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ name: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(name): fields", Set(at.keys), Set(bt.keys))
            for key in at.keys.sorted() {
                if let v = bt[key] {
                    c.expect("\(name): \(key)", at[key]!.shape == v.shape && (at[key]! .== v).all().item(Bool.self))
                }
            }
        }
        let prompt = (0 ..< 270).map { 1000 + $0 * 7 }
        var params = SampleParams.greedy; params.maxTokens = 2; params.seed = 7
        let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
        let (rids, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
        var completed = 0
        var observedBase = -1
        generator.onPrefillProgressAbsolute = { done, _, _, base in completed = done; observedBase = base }
        let beforeLimit = MLX.Memory.cacheLimit
        let (cancelled, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc,
                                                    shouldContinue: { completed < 256 })
        c.expect("cancel emits no token", cancelled.isEmpty)
        c.equal("cancel stores whole pass only", stats.prefillTokens, 256)
        c.equal("cancel restores allocator limit", MLX.Memory.cacheLimit, beforeLimit)
        c.expect("cancel clears admission", !model.pool.admitOnSweep)
        c.equal("cancel prefix retained", cc.heldTokens, 256)
        c.equal("initial absolute base", observedBase, 0)
        let (cids, resumed) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
        c.equal("resume exact IDs", cids, rids)
        c.equal("resume uses committed pass", resumed.reusedPrefixTokens, 256)
        c.equal("resume absolute base", observedBase, 256)
        let next = prompt + cids + [907]
        let rs = rc.take(matching: next, reserveTokens: 512)!.state
        let cs = cc.take(matching: next, reserveTokens: 512)!.state
        equalState(rs, cs, "cancel/retry matches uninterrupted")
        c.expect("actual sequence buffers charge their capacity", cs.allocatedSequenceBytes > cs.tokenCount * PrefixCache.bytesPerToken)
        c.expect("capacity reservation covers buffers", model.sequenceCapacityBytes(tokens: cs.tokenCount, mtp: false) >= cs.allocatedSequenceBytes)
        let logicalOnly = PrefixCache(maxTokens: cs.tokenCount)
        logicalOnly.store(state: cs, tokens: Array(next.prefix(cs.tokenCount)))
        c.equal("token-only allowance cannot hide unused buffer capacity", logicalOnly.heldTokens, 0)
        generator.onPrefillProgressAbsolute = nil
        try model.enableMTP(modelDir: modelDir)
        for firstLimit in [1, 3] {
            let cache = PrefixCache(maxTokens: 4096)
            var ids = [1000, 1079, 25, 1237, 460, 11, 279, 1917]
            generator.speculationEnabled = true
            params.maxTokens = firstLimit
            let (first, _) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            ids += first + [908]
            let hit = cache.take(matching: ids, reserveTokens: 100)!
            c.expect("on \(firstLimit): aligned draft", hit.state.hasValidMTP)
            cache.store(state: hit.state, tokens: Array(ids.prefix(hit.state.tokenCount)))
            generator.speculationEnabled = false
            params.maxTokens = 3
            let (plain, ps) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            c.expect("off \(firstLimit): reused main prefix", ps.reusedPrefixTokens > 0)
            c.equal("off \(firstLimit): no verification", ps.verifyPasses, 0)
            ids += plain + [909]
            let off = cache.take(matching: ids, reserveTokens: 100)!
            c.expect("off \(firstLimit): draft invalidated", off.state.mtp == nil && off.state.lastMulti == nil)
            cache.store(state: off.state, tokens: Array(ids.prefix(off.state.tokenCount)))
            generator.speculationEnabled = true
            let (_, resumed) = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
            c.expect("on again \(firstLimit): reuses main state", resumed.reusedPrefixTokens > 0)
            c.equal("on again \(firstLimit): stale draft never used", resumed.verifyPasses, 0)
            let (_, fresh) = generator.generate(promptIds: [2000, 21, 907, 34], params: params, eosIds: [])
            c.expect("fresh \(firstLimit): speculation available", fresh.verifyPasses > 0)
        }
        return c.report()
    }

    public static func optimizationMTP(modelDir: URL, router: Bool = false) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: router, cachedWeights: false)
    }

    public static func optimizationMTPRouterWeights(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: true)
    }

    public static func optimizationMTPCacheBookkeeping(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, bookkeeping: true)
    }

    public static func optimizationMTPCompiledNorm(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, compiledNorm: true)
    }

    public static func optimizationMTPReadHandles(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, readHandles: true)
    }

    public static func optimizationMTPTerminalPrefill(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, terminalPrefill: true)
    }

    public static func optimizationMTPTerminalQuery(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false,
            terminalPrefill: true, terminalQuery: true)
    }

    public static func optimizationMTPFloorCache(modelDir: URL) throws -> CheckReport {
        try optimizationMTPImplementation(modelDir: modelDir, router: false, cachedWeights: false, floorCache: true)
    }

    private static func optimizationMTPImplementation(modelDir: URL, router: Bool, cachedWeights: Bool, bookkeeping: Bool = false, compiledNorm: Bool = false, readHandles: Bool = false, terminalPrefill: Bool = false, floorCache: Bool = false, terminalQuery: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        try model.enableMTP(modelDir: modelDir)
        let generator = Generator(model: model)
        var c = CheckBuilder(floorCache ? "optimization-mtp-floor-cache" : terminalPrefill ? "optimization-mtp-terminal-prefill" : readHandles ? "optimization-mtp-read-handles" : compiledNorm ? "optimization-mtp-compiled-norm" : bookkeeping ? "optimization-mtp-cache-bookkeeping" : cachedWeights ? "optimization-mtp-router-weights" : (router ? "optimization-mtp-router" : "optimization-mtp-row"))
        var candidateRouting = false
        var referenceRoutes: [[Int32]] = [], candidateRoutes: [[Int32]] = []
        if router || cachedWeights || bookkeeping || compiledNorm || readHandles || terminalPrefill || floorCache {
            model.mtpHead!.routerObserver = { ids in
                if candidateRouting { candidateRoutes.append(ids) }
                else { referenceRoutes.append(ids) }
            }
        }
        let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
        for limit in [1, 2, 5] {
            var params = SampleParams.greedy; params.maxTokens = limit
            params.seed = 7
            let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
            candidateRouting = false
            model.optimizations = InferenceOptimizations()
            let (ri, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
            candidateRouting = true
            model.optimizations.compactMTPRow = !router && !cachedWeights && !bookkeeping && !compiledNorm && !readHandles && !terminalPrefill && !floorCache
            model.optimizations.routerTopK = router
            model.optimizations.cachedRouterWeights = cachedWeights
            model.optimizations.compiledNormFinish = compiledNorm
            model.optimizations.directReadHandles = readHandles
            model.optimizations.terminalPrefillPruning = terminalPrefill
            model.optimizations.terminalLastQuery = terminalQuery
            model.optimizations.ngramRingOrder = bookkeeping
            model.optimizations.denseExpertLookup = bookkeeping
            model.optimizations.sparsePoolPins = bookkeeping
            model.optimizations.layerLocalFloorCache = floorCache
            let (ci, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
            if readHandles { c.equal("MTP handles cover expert and n-gram tensors", model.readHandleCount, 816) }
            if cachedWeights {
                c.equal("MTP limit \(limit): all main/head copies charged", model.cachedRouterBytes,
                    (model.runLayers + 1) * model.cfg.numExperts * model.cfg.hiddenSize * 4)
            }
            c.equal("MTP limit \(limit): exact emitted tokens", ci, ri)
            let r = rc.take(matching: prompt + ri + [907], reserveTokens: 100)!.state
            let g = cc.take(matching: prompt + ci + [907], reserveTokens: 100)!.state
            let rt = r.diagnosticTensors(), gt = g.diagnosticTensors()
            c.equal("MTP limit \(limit): fields", Set(rt.keys), Set(gt.keys))
            for k in rt.keys.sorted() {
                if let v = gt[k] { c.expect("MTP limit \(limit): \(k)", rt[k]!.shape == v.shape && (rt[k]! .== v).all().item(Bool.self)) }
            }
            c.equal("MTP limit \(limit): aligned reference", r.mtp!.offset, r.tokenCount - 1)
            c.equal("MTP limit \(limit): aligned candidate", g.mtp!.offset, g.tokenCount - 1)
            let e = model.resident.embed(MLXArray([Int32(907)], [1, 1])).asType(.bfloat16)
            candidateRouting = false
            model.mtpHead!.usesSpecializedRouter = false
            model.mtpHead!.usesCompiledNorm = false
            let (rs, rm) = model.mtpHead!(embedded: e, hiddenMulti: r.lastMulti!, rope: model.sharedRope, state: r.mtp!)
            candidateRouting = true
            model.mtpHead!.usesSpecializedRouter = router
            model.mtpHead!.usesCompiledNorm = compiledNorm
            let (gs, gm) = model.mtpHead!(embedded: e, hiddenMulti: g.lastMulti!, rope: model.sharedRope, state: g.mtp!)
            c.expect("MTP limit \(limit): future draft sample", (rs .== gs).all().item(Bool.self))
            c.expect("MTP limit \(limit): future draft multi", (rm .== gm).all().item(Bool.self))
        }
        if terminalPrefill {
            let queryStart = model.terminalQueryRowsSkipped, moeStart = model.terminalMoERowsSkipped
            model.optimizations.terminalPrefillPruning = false
            let reference = model.lastLogits(prompt, state: model.makeState())
            model.optimizations.terminalPrefillPruning = true
            let candidate = model.lastLogits(prompt, state: model.makeState())
            c.expect("loaded MTP disables even direct last-row pruning", (reference .== candidate).all().item(Bool.self))
            c.equal("loaded MTP preserves all query rows", model.terminalQueryRowsSkipped, queryStart)
            c.equal("loaded MTP preserves all MoE rows", model.terminalMoERowsSkipped, moeStart)
        }
        if compiledNorm { c.expect("draft norm fusion actually ran", model.mtpHead!.compiledNormFinishes > 0) }
        if router || cachedWeights || bookkeeping || compiledNorm || readHandles || terminalPrefill || floorCache { c.equal("ordered draft router traces", candidateRoutes, referenceRoutes) }
        return c.report()
    }

    public static func optimizationGeneration(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        let generator = Generator(model: model)
        generator.speculationEnabled = false
        var c = CheckBuilder("optimization-generation")
        let prompt = [1000, 1013, 2087, 1102]
        func compare(_ a: Qwen4ExpModel.State, _ b: Qwen4ExpModel.State, _ label: String) {
            let at = a.diagnosticTensors(), bt = b.diagnosticTensors()
            c.equal("\(label): fields", Set(at.keys), Set(bt.keys))
            for k in at.keys.sorted() {
                if let v = bt[k] {
                    c.expect("\(label): \(k)", at[k]!.shape == v.shape && (at[k]! .== v).all().item(Bool.self))
                }
            }
        }
        for limit in [1, 2, 4] {
            var params = SampleParams.greedy; params.maxTokens = limit
            let rc = PrefixCache(maxTokens: 4096), cc = PrefixCache(maxTokens: 4096)
            model.optimizations.skipUnusedFinalForward = false
            let (ri, rs) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: rc)
            model.optimizations.skipUnusedFinalForward = true
            let (ci, cs) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cc)
            c.equal("limit \(limit): emitted IDs", ci, ri)
            c.equal("limit \(limit): finish", cs.finishReason, rs.finishReason)
            c.equal("limit \(limit): output count", ci.count, limit)
            let next = prompt + ci + [901]
            let r = rc.take(matching: next, reserveTokens: next.count)!
            let g = cc.take(matching: next, reserveTokens: next.count)!
            c.equal("limit \(limit): reference consumed", r.state.tokenCount, prompt.count + limit)
            c.equal("limit \(limit): final token pending", g.state.tokenCount, prompt.count + limit - 1)
            let last = model.lastLogits([ci.last!], state: g.state); eval(last)
            compare(r.state, g.state, "limit \(limit): pending consumed once")
            let rl = model.lastLogits([901], state: r.state); eval(rl)
            let gl = model.lastLogits([901], state: g.state); eval(gl)
            c.expect("limit \(limit): next logits", (rl .== gl).all().item(Bool.self))
            compare(r.state, g.state, "limit \(limit): continuation")
        }
        for optimized in [false, true] {
            model.optimizations.skipUnusedFinalForward = optimized
            var params = SampleParams.greedy; params.maxTokens = 4
            let cache = PrefixCache(maxTokens: 4096)
            let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache,
                                                  onToken: { _ in false })
            c.equal("callback stop \(optimized): one emission", ids.count, 1)
            c.equal("callback stop \(optimized): reason", stats.finishReason, "stop")
            let state = cache.take(matching: prompt + ids, reserveTokens: 10)!.state
            c.equal("callback stop \(optimized): token remains pending", state.tokenCount, prompt.count)
            let (cancelled, _) = generator.generate(promptIds: prompt, params: params, eosIds: [], shouldContinue: { false })
            c.expect("cancel before prefill \(optimized)", cancelled.isEmpty)
            let (empty, _) = generator.generate(promptIds: [], params: params, eosIds: [])
            c.expect("empty prompt \(optimized)", empty.isEmpty)
            let logits = model.lastLogits(prompt, state: model.makeState()); eval(logits)
            let eos = argMax(logits.reshaped([-1])).item(Int.self)
            let (stopped, es) = generator.generate(promptIds: prompt, params: params, eosIds: [eos])
            c.expect("EOS \(optimized)", stopped.isEmpty && es.finishReason == "stop")
        }
        return c.report()
    }

    /// Same model arithmetic, all logical state, and continuation, tested with
    /// both cache ownership modes. Uses one model and a bounded 640-slot pool.
    public static func optimizationState(modelDir: URL, tokens: Int, variant: String = "compact-state") throws -> CheckReport {
        guard tokens >= 1, tokens <= 2112 else { throw ModelError("state check tokens must be 1...2112") }
        var candidateOptions = InferenceOptimizations()
        switch variant {
        case "packed-layout": break
        case "ngram-lookahead": candidateOptions.ngramLookahead = true
        case "slot-slices": candidateOptions.contiguousSlotWrites = true
        case "slot-words": candidateOptions.wordSlotWrites = true
        case "slot-cpu": candidateOptions.cpuSlotWrites = true
        case "floor-cache": candidateOptions.layerLocalFloorCache = true
        case "read-handles": candidateOptions.directReadHandles = true
        case "compiled-norm": candidateOptions.compiledNormFinish = true
        case "compact-state": candidateOptions.compactStateWindows = true
        case "ngram": candidateOptions.compactNgramRows = true
        case "cache-bookkeeping":
            candidateOptions.ngramRingOrder = true
            candidateOptions.denseExpertLookup = true
            candidateOptions.sparsePoolPins = true
        case "indexer": candidateOptions.incrementalIndexer = true
        case "indexer-raw":
            candidateOptions.incrementalIndexer = true
            candidateOptions.compactIndexerRaw = true
        case "indexer-tiles": candidateOptions.boundedIndexer = true
        case "indexer-dense": candidateOptions.denseIndexerBypass = true
        case "indexer-dense-tiles":
            candidateOptions.denseIndexerBypass = true
            candidateOptions.boundedIndexer = true
        case "indexer-topk":
            candidateOptions.indexerBlockTopK = true
            candidateOptions.boundedIndexer = true
        case "rope": candidateOptions.sharedRoPE = true
        case "rope-fused": candidateOptions.fusedRoPE = true
        case "rope-both":
            candidateOptions.sharedRoPE = true
            candidateOptions.fusedRoPE = true
        case "router": candidateOptions.routerTopK = true
        case "router-weights": candidateOptions.cachedRouterWeights = true
        case "shared-overlap": candidateOptions.overlapSharedExpert = true
        case "resident-overlap": candidateOptions.overlapResidentExperts = true
        case "gdn-record": candidateOptions.fusedGDNRecording = true
        case "gdn-projection": candidateOptions.fusedGDNProjection = true
        case "ple": candidateOptions.boundedPLE = true
        case "workspace":
            candidateOptions.layerExpertWorkspace = true
            candidateOptions.workspaceTokenTile = try InferenceOptimizations.environment().workspaceTokenTile
        case "sweep-placement": candidateOptions.disjointSweepOutput = true
        case "sweep-tiles": candidateOptions.boundedSweepRows = true
        case "sweep-both":
            candidateOptions.disjointSweepOutput = true
            candidateOptions.boundedSweepRows = true
        default: throw ModelError("unknown state-check variant: \(variant)")
        }
        MLX.Memory.cacheLimit = 512 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
            embeddingRowCache: nil, packGDNProjections: variant == "gdn-projection")
        var c = CheckBuilder("optimization-state-\(variant)")
        if variant == "packed-layout", !model.pool.hasPackedLayout {
            throw ModelError("packed-layout state check requires SLOTSTREAM_EXPERT_LAYOUT")
        }
        let ids = (0 ..< tokens).map { 1000 + (($0 * 7919) % 200_000) }
        var candidateRouting = false
        var referenceRoutes: [Int: [Int32]] = [:], candidateRoutes: [Int: [Int32]] = [:]
        var latestReferenceRoutes: [Int: [Int32]] = [:]
        if variant == "resident-overlap" || variant == "router" || variant == "router-weights" || variant == "cache-bookkeeping" || variant == "compiled-norm" || variant == "read-handles" || variant == "floor-cache" || variant == "indexer-raw" || variant == "packed-layout" || variant == "ngram-lookahead" || variant == "slot-slices" || variant == "slot-words" || variant == "slot-cpu" || variant == "gdn-projection" {
            model.routerObserver = { layer, ids in
                if candidateRouting { candidateRoutes[layer, default: []].append(contentsOf: ids) }
                else {
                    referenceRoutes[layer, default: []].append(contentsOf: ids)
                    latestReferenceRoutes[layer] = ids
                }
            }
        }
        func controls(_ candidate: Bool) {
            candidateRouting = candidate
            // A reference immediately followed by the same one-token candidate
            // otherwise warms all requested experts and never exercises overlap.
            // Deliberately retain half of each observed route at the same pool
            // capacity. Only correctness runs do this; serving remains natural.
            if variant == "resident-overlap", candidate,
               latestReferenceRoutes.count == model.runLayers,
               latestReferenceRoutes.values.allSatisfy({ $0.count == model.cfg.topK }) {
                model.pool.unpinAll(); model.pool.resize(to: 1)
                let absent = (0..<model.cfg.numExperts).first {
                    !latestReferenceRoutes[0]!.contains(Int32($0))
                }!
                _ = model.pool.ensure([ExpertKey(0, absent)])
                model.pool.unpinAll(); model.pool.resize(to: 640)
                let warm = latestReferenceRoutes.keys.sorted().flatMap { layer in
                    latestReferenceRoutes[layer]!.prefix(model.cfg.topK / 2).map { ExpertKey(layer, Int($0)) }
                }
                _ = model.pool.ensure(warm); model.pool.unpinAll()
            }
            if !candidate { latestReferenceRoutes.removeAll(keepingCapacity: true) }
            if variant == "packed-layout" { model.pool.usePackedLayout = candidate }
            if variant == "ngram-lookahead" {
                model.ngram.compactRows = true; model.ngram.compactRows = false
            }
            model.optimizations = candidate ? candidateOptions : InferenceOptimizations()
        }
        func run(_ compact: Bool) -> (Qwen4ExpModel.State, MLXArray) {
            controls(compact)
            let state = model.makeState()
            let logits = model.lastLogits(ids, state: state)
            eval(logits)
            return (state, logits)
        }
        let (reference, refLogits) = run(false)
        let (candidate, gotLogits) = run(true)
        func equal(_ name: String, _ a: MLXArray, _ b: MLXArray) {
            c.expect(name, a.shape == b.shape && a.dtype == b.dtype && (a .== b).all().item(Bool.self))
        }
        func compare(_ label: String) {
            let a = reference.diagnosticTensors(), b = candidate.diagnosticTensors()
            let bases = candidate.diagnosticIndexerBases()
            c.equal("\(label): state fields", Set(a.keys), Set(b.keys))
            for k in a.keys.sorted() {
                if let v = b[k] {
                    let original = a[k]!
                    let base = bases[k] ?? 0
                    let expected = base > 0 ? original[0..., base ..< original.dim(1), 0...] : original
                    equal("\(label): \(k)", expected, v)
                }
            }
        }
        equal("prefill logits", refLogits, gotLogits)
        compare("prefill")
        if variant == "indexer-raw", tokens > model.cfg.indexerBudget {
            c.expect("completed main indexers release raw prefixes", candidate.diagnosticIndexerBases().values.allSatisfy { $0 > 0 })
            c.measure("reference_sequence_bytes", Double(reference.allocatedSequenceBytes))
            c.measure("candidate_sequence_bytes", Double(candidate.allocatedSequenceBytes))
        }
        // Rollback from every possible kept length of a verify pass, followed
        // by a different continuation. Captures GDN/PLE, KV/indexer and history.
        for keep in 1 ... 3 {
            let rc = reference.checkpoint(), cc = candidate.checkpoint()
            let verify = [1137, 732, 2091]
            controls(false)
            reference.setRecording(true)
            let r = model.allLogitsWithMulti(verify, state: reference); eval(r.logits, r.multi)
            reference.rollback(keeping: keep, of: verify, from: rc, ngramWindow: model.cfg.ngramSize - 1)
            controls(true)
            candidate.setRecording(true)
            let g = model.allLogitsWithMulti(verify, state: candidate); eval(g.logits, g.multi)
            candidate.rollback(keeping: keep, of: verify, from: cc, ngramWindow: model.cfg.ngramSize - 1)
            equal("verify \(keep) logits", r.logits, g.logits)
            compare("rollback \(keep)")
            controls(false)
            let rn = model.lastLogits([907], state: reference); eval(rn)
            controls(true)
            let gn = model.lastLogits([907], state: candidate); eval(gn)
            equal("continued logits after keep \(keep)", rn, gn)
            compare("continuation \(keep)")
            reference.restore(rc); candidate.restore(cc)
            compare("restored \(keep)")
        }
        if variant == "indexer-raw" {
            let rc = reference.checkpoint(), cc = candidate.checkpoint()
            let extensionIds = Array(repeating: 907, count: 513)
            controls(false)
            let r = model.lastLogits(extensionIds, state: reference); eval(r)
            controls(true)
            let g = model.lastLogits(extensionIds, state: candidate); eval(g)
            equal("long transaction logits", r, g)
            compare("long transaction")
            if tokens > model.cfg.indexerBudget {
                c.expect("long append releases rows beyond checkpoint offset", candidate.diagnosticIndexerBases().values.allSatisfy { $0 > tokens })
            }
            reference.restore(rc); candidate.restore(cc)
            compare("long transaction restored")
            controls(false); let rNext = model.lastLogits([1137, 908], state: reference); eval(rNext)
            controls(true); let gNext = model.lastLogits([1137, 908], state: candidate); eval(gNext)
            equal("continuation after restoring released history", rNext, gNext)
            compare("restored long continuation")
        }
        if variant == "router" || variant == "router-weights" || variant == "cache-bookkeeping" || variant == "compiled-norm" || variant == "read-handles" || variant == "floor-cache" || variant == "indexer-raw" || variant == "packed-layout" || variant == "ngram-lookahead" || variant == "slot-slices" || variant == "slot-words" || variant == "slot-cpu" || variant == "gdn-projection" {
            c.equal("ordered router traces across prefill, verify and continuation", candidateRoutes, referenceRoutes)
        }
        if variant == "packed-layout" {
            c.expect("candidate performed verified-layout reads",model.pool.packedRecordsRead > 0)
            c.expect("layout stayed valid through all transactions",model.pool.hasPackedLayout)
            c.measure("packed_records_read",Double(model.pool.packedRecordsRead))
        }
        if variant == "ngram-lookahead" {
            c.expect("candidate consumed asynchronous rows",model.ngram.lookaheadRowsConsumed > 0)
            c.expect("all lookahead workers joined",!model.ngram.hasPendingPrefetch)
            c.measure("lookahead_rows_consumed",Double(model.ngram.lookaheadRowsConsumed))
        }
        if variant == "slot-slices" {
            c.expect("candidate used contiguous slot writes", model.pool.slotSliceBatches > 0)
            c.measure("slot_slice_batches", Double(model.pool.slotSliceBatches))
            c.measure("slot_slice_runs", Double(model.pool.slotSliceRuns))
            c.measure("slot_scatter_batches", Double(model.pool.slotScatterBatches))
        }
        if variant == "slot-cpu" {
            c.expect("candidate used CPU slot writes", model.pool.slotCPUBatches > 0)
            c.measure("slot_cpu_batches", Double(model.pool.slotCPUBatches))
        }
        if variant == "slot-words" {
            c.expect("candidate used word slot writes", model.pool.slotWordBatches > 0)
            c.equal("six packed BF16 pieces per used batch", model.pool.slotWordBuffers, model.pool.slotWordBatches * 6)
            c.measure("slot_word_batches", Double(model.pool.slotWordBatches))
            c.measure("slot_word_buffers", Double(model.pool.slotWordBuffers))
        }
        if variant == "router-weights" {
            c.equal("promoted routers charged in full", model.cachedRouterBytes,
                model.runLayers * model.cfg.numExperts * model.cfg.hiddenSize * 4)
            c.measure("additional_cached_router_bytes", Double(model.cachedRouterBytes))
            controls(false)
            let released = model.lastLogits([908], state: reference); eval(released)
            c.equal("disabling router cache releases promoted tensors", model.cachedRouterBytes, 0)
        }
        if variant == "cache-bookkeeping" {
            c.equal("direct map actually allocated", model.pool.denseLookupBytes, model.cfg.numLayers * model.cfg.numExperts * 4)
            controls(false)
            eval(model.lastLogits([908], state: reference))
            c.equal("direct map released after disabling", model.pool.denseLookupBytes, 0)
        }
        if variant == "compiled-norm" {
            c.expect("compiled pointwise normalization actually executed", model.compiledNormFinishes > 0)
            c.measure("compiled_norm_calls", Double(model.compiledNormFinishes))
        }
        if variant == "read-handles" {
            c.equal("all stream tensors have owned descriptors", model.readHandleCount,
                model.cfg.numLayers * 9 + model.cfg.splitNgramParts * 3)
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabling releases direct read handles", model.readHandleCount, 0)
        }
        if variant == "resident-overlap" {
            c.expect("resident expert operations actually prelaunched", model.residentExpertPrelaunches > 0)
            c.measure("resident_expert_prelaunches", Double(model.residentExpertPrelaunches))
            c.measure("resident_expert_join_seconds", model.residentExpertJoinSeconds)
        }
        if variant == "shared-overlap" {
            c.expect("resident shared projections actually prelaunched", model.sharedExpertPrelaunches > 0)
            c.measure("shared_projection_prelaunches", Double(model.sharedExpertPrelaunches))
        }
        if variant == "gdn-projection" {
            c.equal("every recurrent layer has a shared projection backing", model.resident.packedGDNProjectionLayers,
                model.cfg.layerTypes.filter { $0 == "linear_attention" }.count)
            c.expect("single-token fusion actually scheduled", model.fusedGDNProjectionsScheduled > 0)
            let before = model.fusedGDNProjectionsScheduled
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabled fusion preserves separate projection dispatch", model.fusedGDNProjectionsScheduled, before)
            c.measure("shared_projection_payload_bytes", Double(model.resident.packedGDNProjectionPayloadBytes))
        }
        if variant == "rope-fused" || variant == "rope-both" {
            c.expect("fused rotations scheduled on evaluated paths", model.fusedRoPERotationsScheduled > 0)
            c.measure("fused_rotations_scheduled", Double(model.fusedRoPERotationsScheduled))
            let before = model.fusedRoPERotationsScheduled
            controls(false); eval(model.lastLogits([908], state: reference))
            c.equal("disabling fusion returns to original dispatch", model.fusedRoPERotationsScheduled, before)
        }
        if variant == "rope" || variant == "rope-both" {
            c.expect("angle tables actually reused", model.ropeTableHits > 0)
            c.measure("rope_table_hits", Double(model.ropeTableHits))
            c.measure("rope_table_builds", Double(model.ropeTableBuilds))
        }
        if variant == "indexer-topk" {
            c.expect("specialized block rows actually scheduled", model.indexerSpecializedRows > 0)
            c.measure("specialized_block_rows", Double(model.indexerSpecializedRows))
        }
        c.measure("prompt_tokens", Double(tokens))
        if variant == "ngram" || variant == "cache-bookkeeping" {
            // Force FIFO eviction, a prefetch larger than capacity, row hits,
            // mode changes, and EOS history boundaries without huge fixtures.
            let index = try CheckpointIndex(dir: modelDir)
            for capacity in [1, 7, 31] {
                let a = NgramStore(index: index, resident: model.resident, cacheCapacity: capacity)
                let b = NgramStore(index: index, resident: model.resident, cacheCapacity: capacity)
                b.compactRows = true
                b.ringEvictionOrder = variant == "cache-bookkeeping"
                for history in [[Int64(model.cfg.eosTokenId), 37, 52, 81], [37, Int64(model.cfg.eosTokenId), 81, 52], [37, 52, 81, 37]] {
                    let av = a.embedding(history: history, nNew: 2)
                    let bv = b.embedding(history: history, nNew: 2)
                    equal("ngram capacity \(capacity), history \(history)", av, bv)
                    c.equal("ngram cache size \(capacity)", a.cachedRowCount, b.cachedRowCount)
                    c.equal("ngram payload halves \(capacity)", a.cachedPayloadBytes, 2 * b.cachedPayloadBytes)
                }
                c.equal("ngram repeated row \(capacity)", a.debugRow(12345), b.debugRow(12345))
                c.equal("ngram row reuse \(capacity)", a.debugRow(12345), b.debugRow(12345))
            }
        }
        c.measure("physical_footprint_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}

````````````

## Artifact SHA-256 91a2f69fa21063719c9eed2cb91708bad92fbd0e306a61d50be662774db21767

Encoding: `utf-8`. Original bytes: 18500.

````````````text
// Process and cache safety invariants that are otherwise only observable
// during a 100+ GB model run. Weights-free on purpose: these are the rules a
// long run depends on, checked in milliseconds on every push.

import Foundation
import Slotstream

extension Diagnostics {
    public static func runtime() throws -> CheckReport {
        var c = CheckBuilder("runtime-check")

        if let before = ProcessMemory.vmActivity(), let after = ProcessMemory.vmActivity() {
            c.expect("request VM counters are monotonic", after.swapins >= before.swapins && after.swapouts >= before.swapouts)
            c.expect("request VM reclaimable bytes are available", before.reclaimableBytes > 0)
        } else { c.expect("request VM counters are available", false) }
        c.expect("process physical footprint is readable", ProcessMemory.residentBytes() > 0)
        c.expect("process RSS high-water is readable", ProcessMemory.peakResidentBytes() > 0)
        c.expect("lifetime RSS is separately readable", ProcessMemory.lifetimeRSSPeakBytes() > 0)
        let start = RuntimeClock.now()
        c.expect("monotonic duration is nonnegative", RuntimeClock.seconds(since: start) >= 0)
        let sampler = FootprintSampler()
        let observed = sampler.finish()
        c.expect("footprint sampler includes endpoints", observed.samples >= 2 && observed.peakBytes > 0)
        c.equal("automatic platform-qualified optimization defaults",
            try InferenceOptimizations.environment([:]), InferenceOptimizations.deploymentCandidate())
        let qualified = OptimizationPlatform(machineModel: "Mac17,9", chip: "Apple M5 Pro",
            osBuild: "25G83", nativeARM64: true)
        c.equal("qualified platform keeps the complete joint candidate",
            InferenceOptimizations.deploymentCandidate(on: qualified), .integrationCandidate)
        var fallback = InferenceOptimizations.integrationCandidate
        fallback.fusedRoPE = false
        let unknownPlatforms: [OptimizationPlatform] = [
            .init(machineModel: nil, chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: nil, osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: nil, nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: false),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "23A344", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "24A335", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G84", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "26A1", nativeARM64: true),
            .init(machineModel: "Mac14,6", chip: "Apple M2 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,10", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro extra", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "", chip: "", osBuild: "", nativeARM64: true),
        ]
        for (i, platform) in unknownPlatforms.enumerated() {
            c.equal("unqualified platform \(i) keeps portable work and original rotation",
                InferenceOptimizations.deploymentCandidate(on: platform), fallback)
        }
        c.equal("platform selection is deterministic", OptimizationPlatform.current, OptimizationPlatform.current)
        c.expect("explicit kernel qualification remains available",
            try InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "1"]).fusedRoPE)
        c.expect("explicit kernel fallback remains available",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "0"]).fusedRoPE)
        let candidate = InferenceOptimizations.integrationCandidate
        c.expect("combined candidate preserves the original MTP verification shape",
            !candidate.boundedDraftTail)
        c.equal("absent overrides retain the selected default family",
            try InferenceOptimizations.resolving(environment: [:], defaults: candidate), candidate)
        let candidateFlags: [(String, WritableKeyPath<InferenceOptimizations, Bool>)] = [
            ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
            ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
            ("SLOTSTREAM_OPT_NGRAM_ROWS", \.compactNgramRows),
            ("SLOTSTREAM_OPT_FINAL_FORWARD", \.skipUnusedFinalForward),
            ("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", \.valueOnlySamplerThreshold),
            ("SLOTSTREAM_OPT_SAMPLER_DRAW", \.deviceSamplerDraw),
            ("SLOTSTREAM_OPT_OUTPUT_QUEUE", \.boundedOutputQueue),
            ("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", \.responsiveGovernor),
            ("SLOTSTREAM_OPT_COMPLETE_PROMPT", \.completePromptCheckpoint),
            ("SLOTSTREAM_OPT_SHARED_ROPE", \.sharedRoPE),
            ("SLOTSTREAM_OPT_FUSED_ROPE", \.fusedRoPE),
        ]
        for (name, field) in candidateFlags {
            var disabled = candidate
            disabled[keyPath: field] = false
            c.equal("explicit zero disables only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "0"], defaults: candidate), disabled)
            c.equal("explicit one restores only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "1"], defaults: disabled), candidate)
        }
        var referenceOverrides = Dictionary(uniqueKeysWithValues: candidateFlags.map { ($0.0, "0") })
        referenceOverrides["SLOTSTREAM_OPT_PREFIX_CHECKPOINT"] = "0"
        c.equal("explicit zeros restore the complete reference inference family",
            try InferenceOptimizations.resolving(environment: referenceOverrides, defaults: candidate),
            InferenceOptimizations())
        var noCheckpoint = candidate
        noCheckpoint.prefixCheckpointTokens = 0
        c.equal("explicit numeric zero disables inherited prefix retention",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0"],
                defaults: candidate), noCheckpoint)
        c.equal("non-optimization environment leaves the family intact",
            try InferenceOptimizations.resolving(environment: ["PATH": "/unused"], defaults: candidate), candidate)
        for env in [["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"], ["SLOTSTREAM_OPT_TYPO": "0"]] {
            do {
                _ = try InferenceOptimizations.resolving(environment: env, defaults: candidate)
                c.expect("selected defaults still reject invalid override \(env)", false)
            } catch { c.expect("selected defaults still reject invalid override \(env)", true) }
        }
        var scopedDefaults = candidate
        scopedDefaults.readScopeTokens = 4096
        scopedDefaults.layerExpertWorkspace = true
        scopedDefaults.boundedIndexer = true
        scopedDefaults.boundedPLE = true
        c.equal("valid inherited read scope retains its prerequisites",
            try InferenceOptimizations.resolving(environment: [:], defaults: scopedDefaults), scopedDefaults)
        for name in ["SLOTSTREAM_OPT_COMPACT_STATE", "SLOTSTREAM_OPT_COMPACT_MTP",
                     "SLOTSTREAM_OPT_LAYER_WORKSPACE", "SLOTSTREAM_OPT_INDEXER_TILES", "SLOTSTREAM_OPT_PLE_TILES"] {
            do {
                _ = try InferenceOptimizations.resolving(environment: [name: "0"], defaults: scopedDefaults)
                c.expect("inherited scope rejects disabled prerequisite \(name)", false)
            } catch { c.expect("inherited scope rejects disabled prerequisite \(name)", true) }
        }
        scopedDefaults.readScopeTokens = 0
        c.equal("scope can be disabled while retaining its other independent work",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_READ_SCOPE": "0"],
                defaults: {
                    var value = scopedDefaults; value.readScopeTokens = 4096; return value
                }()), scopedDefaults)
        let environmentFunction: ([String: String]) throws -> InferenceOptimizations = InferenceOptimizations.environment
        c.equal("public environment function value keeps its signature and automatic default",
            try environmentFunction([:]), InferenceOptimizations.deploymentCandidate())
        c.expect("typed override enables compaction", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_COMPACT_STATE": "1"]).compactStateWindows)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPACT_STATE": "yes"])
            c.expect("malformed override refused", false)
        } catch { c.expect("malformed override refused", true) }

        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_TYPO": "1"])
            c.expect("unknown optimization refused", false)
        } catch { c.expect("unknown optimization refused", true) }

        for value in ["-1", "1", "16384", "bad"] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": value])
                c.expect("invalid read scope \(value) refused", false)
            } catch { c.expect("invalid read scope \(value) refused", true) }
        }
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": "8192"])
            c.expect("unbounded read scope refused", false)
        } catch { c.expect("unbounded read scope refused", true) }

        c.equal("explicit workspace tile is recorded", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"]).workspaceTokenTile, 2048)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_WORKSPACE_TILE": "8192"])
            c.expect("unbounded workspace tile refused", false)
        } catch { c.expect("unbounded workspace tile refused", true) }

        c.equal("terminal output needs no speculative draft", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 1, bounded: true), 0)
        c.equal("draft count fits remaining output", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 3, bounded: true), 2)
        c.equal("public depth cannot exceed recording cap", Generator.effectiveDraftDepth(requested: Int.max, remainingOutputs: Int.max, bounded: false), 16)
        c.equal("negative remaining output cannot underflow", Generator.effectiveDraftDepth(requested: Int.min, remainingOutputs: Int.min, bounded: true), 0)

        // The prefix cache holds four conversations, not one: Open WebUI's
        // interleaved title request defeated a single slot.
        // Logical cache fixtures are never forwarded through the model, but
        // still declare exactly the number of represented token IDs.
        func fixture(_ count: Int) -> Qwen4ExpModel.State {
            let state = Qwen4ExpModel.State(); state.tokenCount = count; return state
        }
        let cache = PrefixCache(maxTokens: 100)
        for token in 1 ... PrefixCache.maxEntries {
            cache.store(state: fixture(1), tokens: [token])
        }
        c.equal(
            "prefix cache reaches its four-entry bound",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        cache.store(state: fixture(1), tokens: [PrefixCache.maxEntries])
        c.equal(
            "an identical history replaces instead of duplicating an entry",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        _ = cache.take(matching: [999], reserveTokens: 1)
        c.equal(
            "a miss evicts before allocating a fifth state",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries - 1)
        cache.configure(maxTokens: 2)
        c.expect("a smaller live token ceiling evicts immediately", cache.heldTokens <= 2)
        c.expect("held GB includes fixed recurrent state", cache.heldGB > 0.1)
        let growth = PrefixCache(maxTokens: 20)
        growth.store(state: fixture(4), tokens: [1, 2, 3, 4])
        growth.store(state: fixture(4), tokens: [7, 8, 9, 10])
        growth.store(state: fixture(4), tokens: [11, 12, 13, 14])
        c.expect("growing hit still reuses its state", growth.take(matching: [1, 2, 3, 4, 5], reserveTokens: 17) != nil)
        c.equal("growing hit reserves future state before allocation", growth.heldTokens, 0)
        growth.store(state: fixture(1), tokens: [4])
        c.expect("huge reservation safely misses", growth.take(matching: [9], reserveTokens: Int.max) == nil)
        c.equal("huge reservation releases held state", growth.heldTokens, 0)

        let capacity = PrefixCache(maxTokens: 4096)
        for token in 1 ... 4 { capacity.store(state: fixture(1), tokens: [token]) }
        c.expect("capacity reservation still hits", capacity.take(matching: [1, 2], reserveTokens: 2,
            reserveSequenceBytes: 4096 * PrefixCache.bytesPerToken) != nil)
        c.equal("capacity growth reserves bytes before reuse", capacity.heldTokens, 0)
        capacity.store(state: fixture(1), tokens: [7])
        _ = capacity.take(matching: [9], reserveSequenceBytes: Int.max)
        c.equal("saturated byte reservation evicts safely", capacity.heldTokens, 0)

        // Image keying. Every image expands to a run of the same placeholder
        // id, so ids alone cannot tell two pictures apart; the digest can, and
        // a match has to agree in both directions.
        let a = ImageHash(hashing: Data("picture A".utf8))
        let b = ImageHash(hashing: Data("picture B".utf8))
        c.expect("identical bytes hash alike", a == ImageHash(hashing: Data("picture A".utf8)))
        c.expect("different bytes do not", a != b)
        let held = [ImageSegment(start: 4, count: 8, hash: a)]
        c.expect(
            "the same image at the same offset matches",
            PrefixCache.imagesAgree(entry: held, prompt: held, upTo: 12))
        c.expect(
            "a swapped image does not",
            !PrefixCache.imagesAgree(
                entry: held, prompt: [ImageSegment(start: 4, count: 8, hash: b)], upTo: 12))
        c.expect(
            "an entry ending inside a run still matches that run",
            PrefixCache.imagesAgree(
                entry: [ImageSegment(start: 4, count: 3, hash: a)], prompt: held, upTo: 7))
        c.expect(
            "a text-only entry rejects a prompt with an image inside its range",
            !PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 12))
        c.expect(
            "an image beyond the entry's range is irrelevant to the match",
            PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 4))

        let vcache = PrefixCache(maxTokens: 100)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "a vision conversation is held, not discarded",
            vcache.take(matching: [1, 2, 3, 4], images: held, reserveTokens: 4) != nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the same ids with a different picture miss",
            vcache.take(
                matching: [1, 2, 3, 4], images: [ImageSegment(start: 4, count: 8, hash: b)],
                reserveTokens: 4) == nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the text-only splice never sees a vision entry",
            vcache.peek(extending: [1, 2]) == nil)

        // A client can re-render an assistant turn differently from the exact
        // ids the server generated (fx omits reasoning when it sends history
        // back). `peek` finds the longest retained extension for the splice,
        // but does not consume it before the ordinary cache match.
        let spliceCache = PrefixCache(maxTokens: 100)
        spliceCache.store(state: fixture(3), tokens: [7, 8, 9])
        spliceCache.store(state: fixture(4), tokens: [7, 8, 9, 10])
        c.equal(
            "prefix splice chooses the longest retained extension",
            spliceCache.peek(extending: [7, 8]), [7, 8, 9, 10])
        c.expect(
            "prefix splice is strict, not an identical-history match",
            spliceCache.peek(extending: [7, 8, 9, 10]) == nil)
        c.equal(
            "prefix splice lookup does not consume the retained state",
            spliceCache.take(matching: [7, 8, 9, 10, 11])?.reused, 4)
        spliceCache.enabled = false
        c.expect(
            "a disabled prefix cache offers no splice",
            spliceCache.peek(extending: [7]) == nil)

        // Weights behind a symlink: Foundation refuses to list the link itself,
        // so the index must resolve it first (it did not, before 0.2.1).
        let tmp = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-runtime-check-\(getpid())")
        let real = tmp.appendingPathComponent("real")
        let link = tmp.appendingPathComponent("link")
        try FileManager.default.createDirectory(at: real, withIntermediateDirectories: true)
        FileManager.default.createFile(
            atPath: real.appendingPathComponent("model-00001-of-00001.safetensors").path,
            contents: Data())
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: real)
        defer { try? FileManager.default.removeItem(at: tmp) }
        c.equal(
            "shard listing works through a symlinked model dir",
            (try? CheckpointIndex.shardFiles(in: link))?.count, 1)

        // The memory promise: a plan never expects to peak past its target.
        for target in [Planner.minMemoryGB, 10, 16, 30] where target >= Planner.minMemoryGB {
            let p = try Planner.plan(
                expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: 64, workingSetGB: 64, availableGB: 64)
            c.expect(
                "\(target) GB plan stays inside its target",
                p.expectedPeakGB <= target + 0.01,
                "expected peak \(p.expectedPeakGB) GB")
            c.measure("peak_gb_at_\(Int(target))", p.expectedPeakGB)
        }
        return c.report()
    }
}

````````````

## Artifact SHA-256 0e26572461cf2f968e9c1c69f81bd813d9a596e9c7429aff9fefa62e7ebaa6c4

Encoding: `gzip+base64`. Original bytes: 68594.

````````````text
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
````````````

## Artifact SHA-256 329fd1f9e1881c44350f490a2eb4ec075df74c101d6e8dfe9947f8f74babe3cc

Encoding: `utf-8`. Original bytes: 5477.

````````````text
{
  "classification": "Source-only corrected V422 automatic-scope draft on exact V402. Mach physical footprint returns UInt64, so convert with clamping and reject saturated footprints before any nil process-cap allowance. No compiler/native launch; automatic defaults remain disabled. V413 live driver/source unchanged.",
  "source_base": "V402",
  "files": [
    {
      "path": "Sources/Slotstream/Context.swift",
      "before_sha256": "fbbfd320072cde6ad01b12dd93f5303258a36bec59a6e3e150c9b70701978ca0",
      "after_sha256": "58760b11bde1b5c684b457e116e49dd74920929f1a55bf6bf71319b013344f9e"
    },
    {
      "path": "Sources/Slotstream/ContextMemory.swift",
      "before_sha256": "cd380f1cdde2622fe966f6aad22d3b54bf2e2b1da197cf0083c33cc8370fd224",
      "after_sha256": "bfb8fd1e68f0d5d1a504bbd639835ebef390e65ba7410f1c185cac288086d544"
    },
    {
      "path": "Sources/Slotstream/Engine.swift",
      "before_sha256": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
      "after_sha256": "b477ef6e8060ab2dc9e3f61c82ed8944b5dc89f2a2490870c2c5d7cfe4cfff2d"
    },
    {
      "path": "Sources/Slotstream/Generate.swift",
      "before_sha256": "673d9e4ef2d8d4299b5c227674efff8d714001869587773e77e1884233a2ede2",
      "after_sha256": "09f19ca477799aa70abbaf1aff6d6d956e4b9e5f126bd08d24a171b9c4e7d1a7"
    },
    {
      "path": "Sources/Slotstream/Model.swift",
      "before_sha256": "eae1859a42fd26f102a624e66560f770e9860114a8eb7478b6920fcfc97055e6",
      "after_sha256": "1b0515fcfb5d85cbda1ba997517bd4e23668033bf76ed97580c3f32e9b097db4"
    },
    {
      "path": "Sources/Slotstream/Optimizations.swift",
      "before_sha256": "c676838c165ca4a9de74fc763bc03282628db4e58ab5f90e211c276d5ffe9729",
      "after_sha256": "898129b2443590de5a398a8be1a0ee2f9867b947f61da8664c31445f028c68ce"
    },
    {
      "path": "Sources/Slotstream/RequestControl.swift",
      "before_sha256": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
      "after_sha256": "69026aa98b5f75af9dda77f130547ee2b1c3312bebafacc2c301ff25f237c52d"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift",
      "before_sha256": "76ab59f9bf34d34cd66fe00f8f383dc33813696120b143d571ea3c8e93f483db",
      "after_sha256": "3073de4167c10667101cf3e46e332632b38303d94b50896d3e4c05dd3eafafd3"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift",
      "before_sha256": "77e902b2efccbb59c9ee6695f115beb8f9e0c39e23f2a8e49d488404e1e25542",
      "after_sha256": "c5057f3f6e5b9fa557fb33066b9255ec7e9da00b4060d971539fce10d18fedf8"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
      "before_sha256": "91a2f69fa21063719c9eed2cb91708bad92fbd0e306a61d50be662774db21767",
      "after_sha256": "b84030864644d223b17e2ade318929b9359b2f4a23f7b9cf74aa3e98eee5f4a2"
    }
  ],
  "patch_sha256": "0e26572461cf2f968e9c1c69f81bd813d9a596e9c7429aff9fefa62e7ebaa6c4",
  "apply_and_reverse_exact": true,
  "joined_v416_native_refusal": true,
  "joined_v419_atomic_fallback": true,
  "compiled": false,
  "tests_executed": false,
  "automatic_defaults_enabled": false,
  "policy": {
    "maximum_scope_tokens": 4096,
    "minimum_equal_full_compute_passes": 4,
    "eligible_actual_compute_sizes": [
      256,
      512,
      1024
    ],
    "workspace_token_tile": 1024,
    "preserves_partial_tails_and_scheduled_checkpoints": true,
    "requires_request_memory_controller": true,
    "live_memory_choice": "atomic preferred/fallback under existing request reservations",
    "process_ceiling": "current Engine plan target (or existing expected peak), bounded by device working set; observed footprint plus conservative additional allocation must fit",
    "public_controls": "never mutated by automatic execution; local option values flow through model scope/forward/attention/mixer; MTP indexer dispatch restored before direct drafting"
  },
  "new_native_requirements": {
    "scope-lifecycle": {
      "automatic_planner_geometries": 3,
      "automatic_memory_fallbacks": 2,
      "additional_checks": "exact states/routes/output/teacher continuation, prefix reuse, short path, cancellation, checked read fault/retry and public controls stable within router callbacks"
    },
    "scope-mtp-vision": {
      "automatic_mtp_planner_geometries": 3,
      "automatic_mtp_prompt_tokens": 4096,
      "additional_checks": "aligned final scope followed by actual fixed-depth speculative decode; exact outputs/states, private head dispatch restored"
    }
  },
  "remaining": "Compile and run all original native families with expanded lifecycle/MTP cases, pure and CLI checks. Qualify actual automatic serving for all eligible planner geometries, threshold/short/prefix and process targets. Full vision component decision, final eight paired workloads, lifetimes, resources/clients, sustained TPS, empirical planner calibration, delivery and activation still remain.",
  "prior_preparation": {
    "path": "/tmp/slotstream-optimization-execution/automatic-scope-integration-v422/preparation.json",
    "sha256": "dd1f90d81238b26e989cbb2301b7df05e1c92753156f1a00bd5b8323fd6f8401"
  },
  "source_review_correction": "UInt64 Mach footprint must be converted explicitly; saturation fails closed. Two additional pure assertions cover a normal native unsigned reading and UInt64.max.",
  "new_additional_pure_assertions": 2,
  "prepared_at": "2026-09-09T01:19:13.085089+00:00"
}

````````````

## Artifact SHA-256 42779adc739af6f01d29c124734b4cecb198d6215fd50537ff0744e930bf35f3

Encoding: `utf-8`. Original bytes: 5264.

````````````text
from pathlib import Path
import datetime,json,shutil,subprocess,sys
R=Path('/Users/carlos/Projects/slotstream');B=Path('/tmp/slotstream-optimization-execution')
OLD=B/'scope-allocation-build-v402';FIX=B/'automatic-scope-integration-v430';P=B/'automatic-scope-build-v431'
sys.path.insert(0,str(R/'Tools'))
from build_identity import source_files
from prefill_bench import digest
from serve_bench import competing_jobs
assert not competing_jobs(), 'prepare build snapshots only after active native/model/build jobs drain'
old=json.loads((OLD/'before.json').read_text());proto=json.loads((OLD/'protocol.json').read_text());fix=json.loads((FIX/'preparation.json').read_text())
current={str(p.relative_to(R)):digest(p) for p in source_files(R)}
assert current==old['root_source'], 'shared code changed; rebase deliberately instead of overwriting it'
assert all(digest(R/'.build/release'/n)==h for n,h in old['release'].items())
assert all(digest(R/'Tools'/n)==h for n,h in proto['drivers'].items())
assert digest(FIX/'integration.patch')==fix['patch_sha256']
assert all(proto['candidate_source'][e['path']]==e['before_sha256'] and digest(FIX/'after'/e['path'])==e['after_sha256'] for e in fix['files'])
assert fix['apply_and_reverse_exact'] and not fix['automatic_defaults_enabled']
P.mkdir(exist_ok=False)
inputs={e['path']:OLD/'after'/e['path'] for e in old['source']}
for e in fix['files']:inputs[e['path']]=FIX/'after'/e['path']
expected=dict(proto['candidate_source']);files=[]
for rel,source in sorted(inputs.items()):
 dest=P/'after'/rel;dest.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(source,dest)
 actual=R/rel;pre=digest(actual) if actual.exists() else None
 if pre is not None:
  backup=P/'source-before'/rel;backup.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(actual,backup)
 files.append({'path':rel,'before_sha256':pre,'after_sha256':digest(dest)});expected[rel]=digest(dest)
assert len(expected)==150
actual=dict(current);actual.update({e['path']:e['after_sha256'] for e in files});assert actual==expected
# Prove the ten-file delta reverses to complete V402, including changes that
# overlap its held defaults/cache correction/accounting consolidation.
reverse=P/'reverse-check';shutil.copytree(P/'after',reverse)
subprocess.run(['git','apply','--reverse',str(FIX/'integration.patch')],cwd=reverse,check=True,capture_output=True,text=True)
assert all(digest(reverse/e['path'])==proto['candidate_source'][e['path']] for e in fix['files'])
shutil.rmtree(reverse)
(P/'release-before').mkdir()
for name in old['release']:shutil.copy2(R/'.build/release'/name,P/'release-before'/name)
before={'captured_at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'source':files,'release':old['release'],'root_source':current,'state':'Preserve all shared source, artifacts and first-party SwiftPM state. Complete V402 plus exact V430 explicit-only automatic scope integration and V416/V419 tests, only inside the guarded lease.'}
(P/'before.json').write_text(json.dumps(before,indent=2)+'\n')
oldrun=(OLD/'run.py').read_text();newrun=oldrun.replace('scope-allocation-build-v402','automatic-scope-build-v431').replace('.v402-','.v431-')
assert newrun.replace('automatic-scope-build-v431','scope-allocation-build-v402').replace('.v431-','.v402-')==oldrun
(P/'run.py').write_text(newrun)
protocol={'classification':'Exact V402 plus V430 local execution options, automatic scheduling, per-request live plan ceiling and atomic allocation fallback, with expanded real native/pure tests. Automatic integration/deployment defaults remain off. All source and resource/performance gates remain mandatory.',
'frozen_at':before['captured_at'],'drivers':proto['drivers'],'candidate_source':expected,'policy':proto['policy'],'maximum_whole_interval_seconds':proto['maximum_whole_interval_seconds'],'required_complete_reservation_seconds':proto['required_complete_reservation_seconds'],'wrapper_sha256':digest(P/'run.py'),
'source_lease':f'Restore all {len(files)} shared source preimages, six release artifacts, release alias and first-party SwiftPM mutable state exactly. Keep the original model lock throughout.',
'prior_build':{'path':str(OLD/'protocol.json'),'sha256':digest(OLD/'protocol.json')},'correction':{'path':str(FIX/'preparation.json'),'sha256':digest(FIX/'preparation.json')},
'changes_from_v402':{k:{'before':proto['candidate_source'][k],'after':v} for k,v in expected.items() if v!=proto['candidate_source'][k]}}
assert set(protocol['changes_from_v402'])=={e['path'] for e in fix['files']}
(P/'protocol.json').write_text(json.dumps(protocol,indent=2)+'\n')
proof={'passed':True,'compiler_launched':False,'source_inputs':150,'source_lease_files':len(files),'changed_since_v402_candidate':protocol['changes_from_v402'],'reverse_patch_reconstructs_original_candidate':True,'all_held_default_planner_cache_accounting_changes_preserved':True,'automatic_defaults_enabled':False,'shared_release_unchanged':True,'driver_hashes_unchanged':True,'original_executor_body_preserved_except_version_paths':True,'protocol_sha256':digest(P/'protocol.json'),'executor_sha256':digest(P/'run.py'),'new_native_requirements':fix['new_native_requirements']}
(P/'preparation.json').write_text(json.dumps(proof,indent=2)+'\n');print(json.dumps(proof,indent=2))

````````````
