---
type: run
id: 01m20kxb9w4zmzawy7jw3hkh75
created: 2026-09-08T13:39:23.580802+00:00
updated: 2026-09-08T13:39:24.123440+00:00
summary: Corrected compact-cache candidate passes all original native suites
binary: V360 7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea
captured_at: 2026-09-08
command: V361 original MTP, ordinary and read-failure-serving native commands; explicit full intervals through2026-09-08T14:35:00Z
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Corrected compact-cache candidate passes all original native suites
tool: Slotstream exact native and source qualification capture
---
V361 qualifies all three original complete native suites on exact V360: ordinary286, MTP327 and recovery522 assertions, a total of1135. The new MTP run restores every exact-output comparison that failed on V349, including the two-output reference/longer-prefix case and all four final-token discrepancies. Compact BF16 row cache remains selected and its format, population and payload checks pass. Every original sampled replay/work, image, state/logit, prefix, cancellation, EOS, rollback, fault response and pool-ownership case remains.

This is native correctness, not a speed or memory-reduction comparison. Ordinary completes in332.881784333seconds, MTP331.5784705, and recovery206.337724708. No new swap-outs occur in any interval. Original900-second work and30-second cleanup allowances and the live guards are unchanged; admission additionally requires22.2GB. All source proofs remain unchanged and all runs finish within the explicit grant. Eight model-free executor tests verify the original execute body/commands/policy, complete coverage, rejection of the actual older failed MTP report, and bounded four-file source difference.

At13:37:38UTC an independent complete-batch check finds owned groups55048,62402,73066empty, no competing jobs and the model lock free. All149 shared source preimages and six release artifacts still match the V360 build restoration record. Maximum sampled owned RSS is4,981,735,424bytes ordinary,6,538,903,552MTP and3,861,184,512recovery. Minimum sampled reclaimable memory is19,481,427,968,19,701,334,016and16,878,141,440bytes respectively. These sampled resource observations supply no paired percentage saving.

Binary SHA-256:7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea. Source archive:31f5718f308621dbbac08fe2994e9deb8691de28a1e61fd551857a00c5af5be2. Original V350/V358 and isolated V343 results remain unchanged. The earlier V349 failure and source correction are [[sources/runs/2026/09/2026-09-08-optimization-compact-tail-native-counterexample]] and [[sources/runs/2026/09/2026-09-08-optimization-mtp-verification-shape-correction]]. No installed binary, public default or release is activated. Final optional dispositions, all eight paired workloads, both lifetimes, resources/clients, sustained TPS, calibration and delivery remain required.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-mtp/attempt.json",
    "bytes": 23112,
    "sha256": "864ebea2d08567a449e782e48f5d3af2d7ddf1b28f40a0041dc1842b7ff3f0b1"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-mtp/memory.json",
    "bytes": 299582,
    "sha256": "9b0c650c68ecb124821dea64a8ceaf6f8dbf9fc5095e21edc916cc4fea42c998"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-mtp/memory.samples.jsonl",
    "bytes": 228765,
    "sha256": "75790ccb54b0a62fb6c005d8c2b41869f49fcad04e302af499d8ab2fb735c8fe"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-mtp/qualification.json",
    "bytes": 2542,
    "sha256": "4f8f9d98d88283fdf0f6c5f7ac1b47506fef84028f0264ef1b7af0822539bb08"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-mtp/receipt.json",
    "bytes": 2444,
    "sha256": "1369526742bd85d2c5e3c987455433c2d7b75a145940300136e9628d08788bc1"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-mtp/stderr.txt",
    "bytes": 486,
    "sha256": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-mtp/stdout.txt",
    "bytes": 33531,
    "sha256": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-plain/attempt.json",
    "bytes": 23108,
    "sha256": "1f1ec3a3d2273c7ef21e57f348a5aae89081ec54bfbf530a2cb7d7a5d23c2628"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-plain/memory.json",
    "bytes": 283346,
    "sha256": "b493f1d34357d8566c521d2b1c5d3e4e9a2f7feeb03a8619c88ed37c961c7cd9"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-plain/memory.samples.jsonl",
    "bytes": 215823,
    "sha256": "970a1886bc45990662526edc0bea6124a2af4ab6259c81b70f8f5bd293d2b71a"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-plain/qualification.json",
    "bytes": 2544,
    "sha256": "04421cc341f5402f280a2d4ae122959e785856a357870ab2b2967d4db843f3eb"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-plain/receipt.json",
    "bytes": 2446,
    "sha256": "4501aa00573a537b931bd3c565547b0a0699870d6c94e4dad0a0faa2b0cad935"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-plain/stderr.txt",
    "bytes": 486,
    "sha256": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/combined-plain/stdout.txt",
    "bytes": 29460,
    "sha256": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/read-failure-serving/attempt.json",
    "bytes": 23118,
    "sha256": "564efd383d3a80f0ab44329ff9c5975810ce3b2d427b75e00ac7be524afe05b7"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/read-failure-serving/memory.json",
    "bytes": 197883,
    "sha256": "e916092a21147c78dbc89c9f01c9a463a878340b0a50c525eb1ac9250fbb0320"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/read-failure-serving/memory.samples.jsonl",
    "bytes": 149062,
    "sha256": "b38b1a6c8b54e0f8d1edf6a6ef3998224051fdfcaf1f65dc74ec883537cde4ba"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/read-failure-serving/qualification.json",
    "bytes": 2544,
    "sha256": "38bcea1e05f6d4bda9050a7daff986a98de5f216937fbc7f936e189ddb299518"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/read-failure-serving/receipt.json",
    "bytes": 2446,
    "sha256": "99a8e9c388fa2fe7d2fd9a6780cdf784abb7161045272226961b9f88444aa92e"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/read-failure-serving/stderr.txt",
    "bytes": 1739,
    "sha256": "e4836406b1037cc8e75db6dd0c37940f44fe387423be5d44e1d0e78a606d2094"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-native-v361/read-failure-serving/stdout.txt",
    "bytes": 69148,
    "sha256": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/combined-mtp.independent-cleanup.json",
    "bytes": 386,
    "sha256": "8a3591b84e8468e623c17b4bf0fbdf9281ef03a3c1847c5d0adf49e028125542"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/combined-mtp.launch.stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/combined-mtp.launch.stdout.txt",
    "bytes": 519,
    "sha256": "dc94821ed7850eece93c0833dac62f862b200849bbf12cf833d50655f6b6ba97"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/combined-plain.independent-cleanup.json",
    "bytes": 388,
    "sha256": "bd8fd8d00f84600734577f8bbbfce0afe41d3a247d975b90ff1163479e1432b5"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/combined-plain.launch.stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/combined-plain.launch.stdout.txt",
    "bytes": 521,
    "sha256": "14bb43081951c091a372518861a575f7e244f918fc6fcacf13d086b6363823fb"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/complete-native-batch.json",
    "bytes": 4314,
    "sha256": "927810addf027c1c384683157b3fcbf4652f20c94858f612d567da3b0166682f"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/preparation-tests.stderr.txt",
    "bytes": 662,
    "sha256": "01d3c7b40512f599b05368014fbbc80d21384deb76e066bed8a1920b728fda3d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/preparation-tests.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/preparation.json",
    "bytes": 23641,
    "sha256": "079b89f11099c5ece665ec367111c0685ee4bb5ca69a919e034db99a8262a905"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/read-failure-serving.launch.stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/read-failure-serving.launch.stdout.txt",
    "bytes": 521,
    "sha256": "73d6ee60f21d15df4885d9942c77a250e096d4e0a9dce620e6c4669c3c1ef774"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/run.py",
    "bytes": 7131,
    "sha256": "41d086c0e4d02ec8557caefe276ca68223159a0c779836d6712d5e5d95b1d919"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-native-v361/run_test.py",
    "bytes": 2939,
    "sha256": "ca2b3c2821ec7f0469bc7bcdcf1609ce5354bf519346d515394f99f57da550e7"
  }
]
```

## Artifact SHA-256 864ebea2d08567a449e782e48f5d3af2d7ddf1b28f40a0041dc1842b7ff3f0b1

Encoding: `utf-8`. Original bytes: 23112.

````````````text
{
  "started_at": "2026-09-08T13:18:15.582171+00:00",
  "deadline_utc": "2026-09-08T14:35:00Z",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated-mtp",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "c676838c165ca4a9de74fc763bc03282628db4e58ab5f90e211c276d5ffe9729",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "91a2f69fa21063719c9eed2cb91708bad92fbd0e306a61d50be662774db21767",
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
      "source_archive_sha256": "31f5718f308621dbbac08fe2994e9deb8691de28a1e61fd551857a00c5af5be2",
      "binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28791095296,
    "swapins": 44222282,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   337087.\nPages active:                                 984335.\nPages inactive:                               848741.\nPages speculative:                            142214.\nPages throttled:                                   0.\nPages wired down:                             247485.\nPages purgeable:                                6459.\n\"Translation faults\":                    17026109684.\nPages copy-on-write:                       887713297.\nPages zero filled:                       22860976811.\nPages reactivated:                        3745518587.\nPages purged:                               79806906.\nFile-backed pages:                           1413723.\nAnonymous pages:                              561567.\nPages stored in compressor:                  1188596.\nPages occupied by compressor:                 522797.\nDecompressions:                           1282500422.\nCompressions:                             1606561324.\nPageins:                                  8077480456.\nPageouts:                                   11396465.\nSwapins:                                    44222282.\nSwapouts:                                   77578301.\nPages tagged:                                 168850.\nPages tagged resident:                        127138.\nPages tagged compressed:                       41712.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6902.\nPages tag-storage free:                         2860.\nPages tag-storage non-tag pageable:            88534.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6830912.\nTagged compressions:                        12511577.\nTagged decompressions:                      11555659.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-08T13:18:15.582048+00:00",
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
  "preparation_sha256": "079b89f11099c5ece665ec367111c0685ee4bb5ca69a919e034db99a8262a905",
  "classification": "Prospective V361 native commands on exact V360 after the V349 full-model MTP counterexample. Original complete cases and exact-output checks remain; both arms retain the original fixed verification shape and candidate compact BF16 rows remain selected. Complete assertion minima are raised to 286 ordinary and 327 MTP. Conservative 22.2 GB admission screen is added; original live policy and 900-second work plus 30-second cleanup allowance remain unchanged. No retries, benchmark or activation. Explicit V341 failure observer remains bound."
}

````````````

## Artifact SHA-256 9b0c650c68ecb124821dea64a8ceaf6f8dbf9fc5095e21edc916cc4fea42c998

Encoding: `gzip+base64`. Original bytes: 299582.

````````````text
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
````````````

## Artifact SHA-256 75790ccb54b0a62fb6c005d8c2b41869f49fcad04e302af499d8ab2fb735c8fe

Encoding: `gzip+base64`. Original bytes: 228765.

````````````text
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
````````````

## Artifact SHA-256 4f8f9d98d88283fdf0f6c5f7ac1b47506fef84028f0264ef1b7af0822539bb08

Encoding: `utf-8`. Original bytes: 2542.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "864ebea2d08567a449e782e48f5d3af2d7ddf1b28f40a0041dc1842b7ff3f0b1",
  "exit_code": 0,
  "assertions": 327,
  "elapsed_seconds": 331.5784705,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29887135744,
    "swapins": 44222294,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   594076.\nPages active:                                 796309.\nPages inactive:                               709098.\nPages speculative:                             85088.\nPages throttled:                                   0.\nPages wired down:                             258273.\nPages purgeable:                                4923.\n\"Translation faults\":                    17033976610.\nPages copy-on-write:                       888554275.\nPages zero filled:                       22910781009.\nPages reactivated:                        3749813475.\nPages purged:                               80037527.\nFile-backed pages:                           1225167.\nAnonymous pages:                              365328.\nPages stored in compressor:                  1402135.\nPages occupied by compressor:                 640461.\nDecompressions:                           1283751393.\nCompressions:                             1608267798.\nPageins:                                  8080481806.\nPageouts:                                   11397647.\nSwapins:                                    44222294.\nSwapouts:                                   77578301.\nPages tagged:                                 165939.\nPages tagged resident:                        119213.\nPages tagged compressed:                       46726.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6900.\nPages tag-storage free:                         2444.\nPages tag-storage non-tag pageable:            88952.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7751808.\nTagged compressions:                        12536539.\nTagged decompressions:                      11575405.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e",
  "execution_receipt_sha256": "1369526742bd85d2c5e3c987455433c2d7b75a145940300136e9628d08788bc1"
}

````````````

## Artifact SHA-256 1369526742bd85d2c5e3c987455433c2d7b75a145940300136e9628d08788bc1

Encoding: `utf-8`. Original bytes: 2444.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "864ebea2d08567a449e782e48f5d3af2d7ddf1b28f40a0041dc1842b7ff3f0b1",
  "exit_code": 0,
  "assertions": 327,
  "elapsed_seconds": 331.5784705,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29887135744,
    "swapins": 44222294,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   594076.\nPages active:                                 796309.\nPages inactive:                               709098.\nPages speculative:                             85088.\nPages throttled:                                   0.\nPages wired down:                             258273.\nPages purgeable:                                4923.\n\"Translation faults\":                    17033976610.\nPages copy-on-write:                       888554275.\nPages zero filled:                       22910781009.\nPages reactivated:                        3749813475.\nPages purged:                               80037527.\nFile-backed pages:                           1225167.\nAnonymous pages:                              365328.\nPages stored in compressor:                  1402135.\nPages occupied by compressor:                 640461.\nDecompressions:                           1283751393.\nCompressions:                             1608267798.\nPageins:                                  8080481806.\nPageouts:                                   11397647.\nSwapins:                                    44222294.\nSwapouts:                                   77578301.\nPages tagged:                                 165939.\nPages tagged resident:                        119213.\nPages tagged compressed:                       46726.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6900.\nPages tag-storage free:                         2444.\nPages tag-storage non-tag pageable:            88952.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7751808.\nTagged compressions:                        12536539.\nTagged decompressions:                      11575405.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e"
}

````````````

## Artifact SHA-256 ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6

Encoding: `utf-8`. Original bytes: 486.

````````````text
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

````````````

## Artifact SHA-256 529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e

Encoding: `utf-8`. Original bytes: 33531.

````````````text
{
  "items" : [
    {
      "name" : "false: embedding selection",
      "passed" : true
    },
    {
      "name" : "false: original MTP verification shape selected",
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
      "name" : "false\/cached17: cancelled prefill releases request pins",
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
      "name" : "false\/cached17: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/cached17: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/cached17: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/cached17: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/cached17: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/cached17: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/cached17: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/cached17: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: cancelled prefill releases request pins",
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
      "name" : "false\/boundary255: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: cancelled prefill releases request pins",
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
      "name" : "false\/boundary256: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: cancelled prefill releases request pins",
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
      "name" : "false\/boundary257: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/long1025: cancelled prefill releases request pins",
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
      "name" : "false\/long1025: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/long1025: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/long1025: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/long1025: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/long1025: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/long1025: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/long1025: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/long1025: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/image-before: cancelled prefill releases request pins",
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
      "name" : "false\/image-before: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/image-before: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/image-before: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/image-before: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/image-before: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/image-before: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/image-before: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/image-before: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: cancelled prefill releases request pins",
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
      "name" : "false\/image-crossing: head is aligned",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: verification executes",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: embeddings remain bounded",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7: sampled requests return an idle pool",
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
      "name" : "false\/sample\/false\/7: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7046029254386353130: sampled requests return an idle pool",
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
      "name" : "false\/sample\/false\/7046029254386353130: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7: sampled requests return an idle pool",
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
      "name" : "false\/sample\/true\/7: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7046029254386353130: sampled requests return an idle pool",
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
      "name" : "false\/sample\/true\/7046029254386353130: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "false: first retained request succeeds",
      "passed" : true
    },
    {
      "name" : "false\/same: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/same: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false: complete checkpoint is exercised",
      "passed" : true
    },
    {
      "name" : "false: complete hit is observed",
      "passed" : true
    },
    {
      "name" : "false: complete hit eliminates prefill",
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
      "name" : "false\/auxiliary: cache reuse releases request pins",
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
      "name" : "false\/divergent: cache reuse releases request pins",
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
      "name" : "false\/same-after-auxiliary: cache reuse releases request pins",
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
      "name" : "false\/edited: cache reuse releases request pins",
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
      "name" : "false: partial fallback succeeds",
      "passed" : true
    },
    {
      "name" : "false: edited tail uses the shorter checkpoint",
      "passed" : true
    },
    {
      "name" : "false: partial fallback is not a complete hit",
      "passed" : true
    },
    {
      "name" : "false: combined retention respects physical-state count",
      "passed" : true
    },
    {
      "name" : "false: callback cancellation releases request pins",
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
      "name" : "false: retry returns an idle pool",
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
      "name" : "false: one-token request releases pins",
      "passed" : true
    },
    {
      "name" : "false: one-token request emits exactly one token",
      "passed" : true
    },
    {
      "name" : "false: two-token MTP request completes",
      "passed" : true
    },
    {
      "name" : "false: two-token MTP releases pins",
      "passed" : true
    },
    {
      "name" : "false: terminal draft work is explicit",
      "passed" : true
    },
    {
      "name" : "false: terminal target work is explicit",
      "passed" : true
    },
    {
      "name" : "false: terminal verification executes once",
      "passed" : true
    },
    {
      "name" : "false: terminal forward executes once",
      "passed" : true
    },
    {
      "name" : "false: bounded output preserves the longer greedy prefix",
      "passed" : true
    },
    {
      "name" : "false: immediate EOS succeeds without emitted output",
      "passed" : true
    },
    {
      "name" : "false: immediate EOS releases pins",
      "passed" : true
    },
    {
      "name" : "false: fused RoPE evaluated paths",
      "passed" : true
    },
    {
      "name" : "false: shared RoPE evaluated paths",
      "passed" : true
    },
    {
      "name" : "true: embedding selection",
      "passed" : true
    },
    {
      "name" : "true: original MTP verification shape selected",
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
      "name" : "true\/cached17: cancelled prefill releases request pins",
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
      "name" : "true\/cached17: head is aligned",
      "passed" : true
    },
    {
      "name" : "cached17: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/cached17: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/cached17: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/cached17: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/cached17: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/cached17: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/cached17: verification executes",
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
      "name" : "true\/boundary255: cancelled prefill releases request pins",
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
      "name" : "true\/boundary255: head is aligned",
      "passed" : true
    },
    {
      "name" : "boundary255: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: verification executes",
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
      "name" : "true\/boundary256: cancelled prefill releases request pins",
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
      "name" : "true\/boundary256: head is aligned",
      "passed" : true
    },
    {
      "name" : "boundary256: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: verification executes",
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
      "name" : "true\/boundary257: cancelled prefill releases request pins",
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
      "name" : "true\/boundary257: head is aligned",
      "passed" : true
    },
    {
      "name" : "boundary257: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: verification executes",
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
      "name" : "true\/long1025: cancelled prefill releases request pins",
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
      "name" : "true\/long1025: head is aligned",
      "passed" : true
    },
    {
      "name" : "long1025: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/long1025: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/long1025: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/long1025: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/long1025: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/long1025: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/long1025: verification executes",
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
      "name" : "true\/image-before: cancelled prefill releases request pins",
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
      "name" : "true\/image-before: head is aligned",
      "passed" : true
    },
    {
      "name" : "image-before: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/image-before: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/image-before: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/image-before: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/image-before: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/image-before: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/image-before: verification executes",
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
      "name" : "true\/image-crossing: cancelled prefill releases request pins",
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
      "name" : "true\/image-crossing: head is aligned",
      "passed" : true
    },
    {
      "name" : "image-crossing: all state bytes and continued logits exact",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: exact n-gram cache payload accounting",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: verification executes",
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
      "name" : "true\/sample\/false\/7: sampled requests return an idle pool",
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
      "name" : "true\/sample\/false\/7: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "sample\/false\/7: integrated sampled verification work matches reference",
      "passed" : true
    },
    {
      "name" : "true\/sample\/false\/7046029254386353130: sampled requests return an idle pool",
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
      "name" : "true\/sample\/false\/7046029254386353130: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "sample\/false\/7046029254386353130: integrated sampled verification work matches reference",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7: sampled requests return an idle pool",
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
      "name" : "true\/sample\/true\/7: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "sample\/true\/7: integrated sampled verification work matches reference",
      "passed" : true
    },
    {
      "name" : "true\/sample\/true\/7046029254386353130: sampled requests return an idle pool",
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
      "name" : "true\/sample\/true\/7046029254386353130: sampled replay keeps verification work",
      "passed" : true
    },
    {
      "name" : "sample\/true\/7046029254386353130: integrated sampled verification work matches reference",
      "passed" : true
    },
    {
      "name" : "true: first retained request succeeds",
      "passed" : true
    },
    {
      "name" : "true\/same: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/same: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true: complete checkpoint is exercised",
      "passed" : true
    },
    {
      "name" : "true: complete hit is observed",
      "passed" : true
    },
    {
      "name" : "true: complete hit eliminates prefill",
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
      "name" : "true\/auxiliary: cache reuse releases request pins",
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
      "name" : "true\/divergent: cache reuse releases request pins",
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
      "name" : "true\/same-after-auxiliary: cache reuse releases request pins",
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
      "name" : "true\/edited: cache reuse releases request pins",
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
      "name" : "true: partial fallback succeeds",
      "passed" : true
    },
    {
      "name" : "true: edited tail uses the shorter checkpoint",
      "passed" : true
    },
    {
      "name" : "true: partial fallback is not a complete hit",
      "passed" : true
    },
    {
      "name" : "true: combined retention respects physical-state count",
      "passed" : true
    },
    {
      "name" : "partial fallback output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true: callback cancellation releases request pins",
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
      "name" : "true: retry returns an idle pool",
      "passed" : true
    },
    {
      "name" : "true: retry after cancellation is exact",
      "passed" : true
    },
    {
      "name" : "true: prefix capacity stays bounded",
      "passed" : true
    },
    {
      "name" : "true: one-token request releases pins",
      "passed" : true
    },
    {
      "name" : "true: one-token request emits exactly one token",
      "passed" : true
    },
    {
      "name" : "true: two-token MTP request completes",
      "passed" : true
    },
    {
      "name" : "true: two-token MTP releases pins",
      "passed" : true
    },
    {
      "name" : "true: terminal draft work is explicit",
      "passed" : true
    },
    {
      "name" : "true: terminal target work is explicit",
      "passed" : true
    },
    {
      "name" : "true: terminal verification executes once",
      "passed" : true
    },
    {
      "name" : "true: terminal forward executes once",
      "passed" : true
    },
    {
      "name" : "true: bounded output preserves the longer greedy prefix",
      "passed" : true
    },
    {
      "name" : "two-token MTP integrated output matches reference",
      "passed" : true
    },
    {
      "name" : "true: immediate EOS succeeds without emitted output",
      "passed" : true
    },
    {
      "name" : "true: immediate EOS releases pins",
      "passed" : true
    },
    {
      "name" : "true: fused RoPE evaluated paths",
      "passed" : true
    },
    {
      "name" : "true: shared RoPE evaluated paths",
      "passed" : true
    }
  ],
  "measurements" : {
    "false.fused_rotations_scheduled" : 0,
    "true.fused_rotations_scheduled" : 5248
  },
  "name" : "optimization-integrated-mtp",
  "passed" : true
}

````````````

## Artifact SHA-256 1f1ec3a3d2273c7ef21e57f348a5aae89081ec54bfbf530a2cb7d7a5d23c2628

Encoding: `utf-8`. Original bytes: 23108.

````````````text
{
  "started_at": "2026-09-08T13:26:10.977891+00:00",
  "deadline_utc": "2026-09-08T14:35:00Z",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "c676838c165ca4a9de74fc763bc03282628db4e58ab5f90e211c276d5ffe9729",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "91a2f69fa21063719c9eed2cb91708bad92fbd0e306a61d50be662774db21767",
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
      "source_archive_sha256": "31f5718f308621dbbac08fe2994e9deb8691de28a1e61fd551857a00c5af5be2",
      "binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29101719552,
    "swapins": 44222306,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    23871.\nPages active:                                 588506.\nPages inactive:                              1608924.\nPages speculative:                             14643.\nPages throttled:                                   0.\nPages wired down:                             258369.\nPages purgeable:                               12915.\n\"Translation faults\":                    17035897185.\nPages copy-on-write:                       888672863.\nPages zero filled:                       22912029217.\nPages reactivated:                        3750190910.\nPages purged:                               80072312.\nFile-backed pages:                           1739442.\nAnonymous pages:                              472631.\nPages stored in compressor:                  1308604.\nPages occupied by compressor:                 591021.\nDecompressions:                           1283892904.\nCompressions:                             1608336912.\nPageins:                                  8086589537.\nPageouts:                                   11398008.\nSwapins:                                    44222306.\nSwapouts:                                   77578301.\nPages tagged:                                 167375.\nPages tagged resident:                        119688.\nPages tagged compressed:                       47687.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6899.\nPages tag-storage free:                          145.\nPages tag-storage non-tag pageable:            91252.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7947712.\nTagged compressions:                        12539910.\nTagged decompressions:                      11577534.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-08T13:26:10.977500+00:00",
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
  "preparation_sha256": "079b89f11099c5ece665ec367111c0685ee4bb5ca69a919e034db99a8262a905",
  "classification": "Prospective V361 native commands on exact V360 after the V349 full-model MTP counterexample. Original complete cases and exact-output checks remain; both arms retain the original fixed verification shape and candidate compact BF16 rows remain selected. Complete assertion minima are raised to 286 ordinary and 327 MTP. Conservative 22.2 GB admission screen is added; original live policy and 900-second work plus 30-second cleanup allowance remain unchanged. No retries, benchmark or activation. Explicit V341 failure observer remains bound."
}

````````````

## Artifact SHA-256 b493f1d34357d8566c521d2b1c5d3e4e9a2f7feeb03a8619c88ed37c961c7cd9

Encoding: `gzip+base64`. Original bytes: 283346.

````````````text
H4sIAAAAAAAC/7y9Xc8eR5Ildu9fIfSVDYyqMzMyIiPnbteG7xZYYNe+8RgCW2L3cJciZZKanp7F/nefUy8p6eGoKwtPVJRmZxbder/Ok5nxHef8j//lm2/+8P37H3989e6HP/zjN/8P/iP+iz/+Xx9ff/j4x+9ffXj7/uMf//OH9//t9fefPv7x49v3nz5++vD61Y9/3P7085u3P/zx/U+f3vz45t9efXrz/t0f8WN+evX9p2+/f/X9P7/+9s9v/vX1D9/++Omnb/cv/fZfxAp+4rsf3vzw6tPr3/ysP/zDyy/97c/69uMnfNG3+Dnf//cv//7bb//l1Yc3r959+vJfvHn36fVfPuDrfvj1S358/8Prt1/+4yOM7Td//v5lH//4//319Tvxb//89tXHf/723et//fTtj2//9dv+pzeffv2J/+3j+3d/wH/4f/nf/OGn92/ffP83fFL/4+Xf4+/88Onnn7778Pr7t6/e/PjqT29ff/env316/RFfUqV8+efzT/vxzbs3P/7843dv3/zL69/9ln//Ha/+df+O93999/qH7z58/PjrTy9ff+3HVz/+hJ/Fj+XDv7x6+93H19+/f/cDv7Zs7auft5/Jb75i/vpTPr3/6bv377579/qv333866uf3v/8iV/w51dvP77GV/zP/WP40+s/v//w+teP4adXf/kNbhPvn3/a74Fss5beG/6/L38Vf8+bd/x3/O+bFPvNv/j8B4yhw6XULz/41V/xX/7hP+GuffN/v8EZvHr7zX96/eP7D3/75r/g7rz5+OnN9x//8Zv/lX/ZNx/f/Nvrb97/+eUv+2b/O/63f3r3n/GvPn7z5w+vX//jNyf+ab2IbF++DRcdh7j+RnXX1n75tjfvTn1jteKz+S/f9vGn19///PbV+jtrt/7rb/v0zx/ef/r09vUPZwCWX77tr28+vP7hmx9w546/r6nLqL98208/f/jLa5706rdVHL3i2/7pD//1w6t3H9/uTx437Oe3nz7+0x9+97vrKKI+h5v98vu+f//T376Frfjrhzef/u7vdHcbeFa/fpb/9vrD+2/+/Obtwcey383ScAK/fiiwGzw5mpu/i0+GljoL7vfjh7L8/L2U0aTy5P7PN29ff/unV9//dxwBL+/Ho++tQ2bv/Cz/w7v37/724/ufP66/Cf/00ayPX6/Xp/c88TfvvqEN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
````````````

## Artifact SHA-256 970a1886bc45990662526edc0bea6124a2af4ab6259c81b70f8f5bd293d2b71a

Encoding: `gzip+base64`. Original bytes: 215823.

````````````text
H4sIAAAAAAAC/7S9245ly24c+n6+wtCzMZCZTDJJ/4why/vBgI4kaMswDozz744YPathbRRHaXKylyw/qFfXisqRyTsj/vff/eUf//5f/vqX//5f//qXf/jnf/rvf/27//KfxjXG3D6Wjtc/0+Q//6e/++f/9U/49/71r3/9r//t//u3v/Df1HFi7N9/9C//+s//8Bf88T/88//8p3/DH0/8yb/+5R/+8e//x//79//tH//y+6+tGGHm+F/+3b/+r7//l//xT/y/773WkmGv/+M//89/4//1HD0uY/7//8///hYs/s4yW7FeYL+HuiZ+js+h9j5cU11y//gGuNt0HQA+38IUD9k2Itb7MFecg796ljfAtNADoPotyj3DfWl44dsvP36m/ro3n6KMJdv3Gv66p9+jXeIrdOxRQHvOmWOJ2Mdo5zV1+j4rOdN13KYNq5wpvnnggzR8+XkJf2XVvVKYOM3SO8KnH+qx92iAyZNaO+b372iLqxzejMpphoe63m/wU5gu88TMnjt+5lYcdu0h4eoP1YaHtK6hsMaSPXeJY+d1IO+jnAN3s+Gbrwu3HP/kIH28fMrbIJfOPdbqOEqdFhZPZwnTOtcowRT8jqKrAebZbmL/9wP5G5gIAOD5Ks8cBl7gHVpgxtl29vmy8CtFO9121NAud3X/3HbKBb8Yc+zUKMFjylq1Q7WYCvduDTD3mvDCqVECTIMrklXyl46w4ezdANNg22Kl78gdd2NVnrtOOYgIpOMsHSGw54+d1+FX4PguyI2rtMaxz+/lvuZA/Ir4V1KYwptb+eDb4IQEaBtgCgJO15HBdIRHc66KhZ/wG8dkqzXAVBV9sPB8AruWaUyYO9x4masBJv8wi+KYDJ2xa0dpgCKrwRLpNSZiuDyKc8Pfn6dyMekP4MGQuzbAXHsu9fQ03dxUil9cRJRWogEmvmekj+cgoQdQr2CcLojjGtIL/ZVYzq/KwtAULYz/3iW0sBInTsMbUiSYE/dT80OFPTqlzHIi6FgSHc/IkFkOZZqRPaOzxqL1rMDkLxliowGmOFJgW5qjRICzKt/cF8JiN+04TEPCsgZs0g83VOiMRulMkSGoz4Ybakgw90A4EyuHaa+U4V2Y5xjiRGnIg881DMnESasK+M/Mr+/3/rfXzUDRG2CyOqWPp4lMVk8F5llI/JDBWgNMBLAAcbLkDTCZ3UkJpm9EB9YC8+CskJVngVLAyMeWUQpC9pyIu6UDJtJ11oZTu4SLiwSxlLUhDNwIQxrskiO5hI3PHBEy+Xm08sXXcNgjRDfegHEvgZvJL6ZNXfYrJnsbJkIb3qXVANPgepkOSQ4T8XGpKjdYllO1jtN0Zy3hITqGj7JVqmuPBcewo8GtxwVHxnQ8P00EUW6jFMstH/IyEZ/CFCaqnsdyttZXWvO2CwpWRzueeVxqdpcnVg7zhHkt5MRdmrsF5om9/OkJLRc7UkuJ8HeZ7X9efx/XYOlMc5AWWnNACGRhjxpKxgC5NtuhT4cZOveqZesDWbR39FzGtRH/GMyb9+OElwVI68F5mAE+lRVkIO3eJZx4nNrSvgTOkClmebjJSovNUvmDPTxfcRoeETuXESyaao5zFMNiGM4xXBtyIeAUh/eN4X/iHTneeku3DThtGrL/yN8RffMpZcIRa8PONzh24OSLHJFn7CaTAV0pTjoHlnk0RJ1zIbvER7ccpO1diznZBEPSNjpArhC8obxIg+Bj15I21vbVXyHWxzh1TUVUmRtPWCSppRoT/+zZ0WsDzqNIrOIBp7CIWCl4Im1DnjFHh3NfVzjL7Q8BnbAuUoriJ4LjgxNoMPJyLYTxJx9VIM473SjlbmrBelIHzs0BqUfj6TPOKb2jjbABWdfowAm/DusheVAniJBLRdk1cABwEB0TKnKxf8lC9GrHOYPF4xEdzn1fUwTf9el+wqfqrnUH2W3whnlE4BS8ETz3B7vk/mrxvR+EbAQ30VBcAE52ndajXXJkJbVyPI5yctKrAyfirmXr9yxqijbGtKiVPNl17RirmXoN+s54qIDVcSKs2xGzYxZRr4WrdPIyQ/g8ortm7Q0xoVmHl9dLGTHIys8TkZ14zXvS7kmLl9frIMQcojnKsFIJjOUQ9zl6ThM+Yy55KHVvRAG16ePJ2R8f0vCK7FqI3MYRWRz4i/zbLwTVp1aYF+mp2AEtS/ywymY32pOj3ciRS/4eP5uTEC1ny76RHoHNe0CL1+tam5nGTYfx0I6RBqCNsVV+34QM7VBOFVgpYUbQixPpqDYexCjIneTrJiT3Fo53xih1QViGUI+O9gLQiulIVju2jrN9F2cGYhsCh45w6iBMWRt/NbFY29lKl9KXxzkG4sUOi3UQpbiFpHOAS5GlSWmOybcz9G1A6YhO8K9EWnAkTpfSO0LutFkN0hac6w49cf2eXj3QGieFShG/bFrAnlPVuSb+PJ+nXWfWMnxO3iCVaCnfO/vxCFNehj88R3tq+TM7N8amfAtauBHOXu38rvqu5lEs/vfUd+LiN/KdNkUENsZl1up6Yx66lNWBczPcWWwKPH99riFFzTcFEpSW9Z647qW78cNdZURlu9hlBFhd01rQIloSP2nWR5yc96pFU0toPBoWaMbFifIzsj4OYcYp9UPXQCKle3gLTNncg0yTU+C0KV6bZR3G3UVrwYmPCr8/9ny+pIJvP07N+dthc8070HLEaebzl3LnU6Wpl3k4MrbPajjVeY0tiHHTbricsxFolHC60qV0NHSAEz9m4Dql58m1CK58Vs7TbCARb5hpBE6d98ZLGvRN/PXXhO/73fAx5ZUmfozzMCRLd44FJ3mHQiU/yv+2dez3TY4L2khhIgqW8SqDvF+Q0sFttIbTXBcLTlvTUg9nbPATSu0xGHq1szuOcyEscbO8TUKcvBWrhBMXZnXMlAAnXuTKMSKyri2YLw5pnNXzzd2PIaR5Lj8Q7R1SVG6ocuu/Y4h5yTUn/Lzmm7J1nNxRstHSKAFO2QB68lVZ5iE2S0XTMfCXxXYLTpbA4JLSLT8bHL0tbSxEcL2io6QPnD5i28PqMXDqOKWVBQ6sxGsr40Oc+xpc88sHIYjTzqwlHyz/6VwtONcZnCx5LpF+gvYYfIV2FCGAdiPDiHxwFDiP6a41dNiB0Y75VuCETT4RjzjDawQTcLzsZDa074EzlOQ3yOt++Pp4Fl5akOeR9lRzl14IcXSe/wBa2IddOlvzQT6gFrR7buOc/HxGi+SuNurMCWJyqXTYK7248HoiL0QZ3kdt2hkZ7EDw3VGEBk4/MEWS+33gjNqU5trACLPaUNJfdk02sjXfmudGsJZKZdya99WyQw2ciJGmIYx8vqVKt+ulN8XyUyw7LaeKP+bC4quwl74p3XDmpbNFsLaWdQyfAC0TXCOYn9DKdi+1dmEQRTr27da5hs57NT/L9GF4ddfWr+Y+d36+O3Dirm7VR5xMp2qt8jlhYDru6uEoLC4AB3qevv7h8zvVqilncGbL17874A+RVR0n8im8AOkYOATO4LCV/WCvFtJt7qfVqlJ65NUU/hCtX4uXVdJTJYGFWdQoKhY7gx0tU+DcyCdcsnLPQPSn1XV1NW6djZbjPDT+K0v+hLX5CedYW6sXIefJ6MAJ/3HmznaXb5I8f5nDtx+TblyYFhMVDKhjWlbmE6R8YVrs57FcgLTSO3Def+tX1J8+evjRw3WLEi2Nb6ZruyNNCRb7BpuZT91H2VvDZ63AjwzYJKzD8MeFvG6fkU0ci+zgnkTNRJEnzjuY8eTuPiLqTd8UIkw8qSgVfpj2wMM1JCjAiYwX2SfX7R++/jI25ucqzcog59stNE/CJmQcNrZWghM5zKyRe804Pi1kt3x952GtFOc0xMFhpQRlqul49YY+xDkRRC8/7JI/Waopc54YtYnevZD9dkyfAC0XDfCiHlvQRDvkFWgU5nqBuIMNFWjJrTJOVlIVshSpFXf1NvfSTg/Oc2JbFkxx5vie6C5V/BFLjWj5+Osak6Y5O851gox6UsN589x0cF4DJ4J5OZatbJHbMvDlizi3Du8Y4wFO2HyfkuI0dvujNsYJG83yXEOsD5zIGacmRLiLVX6ODpSyZxH8dzu2nIEyjHQB2VjkQshyzqoNbzmcPUsZDaStZG3lCHE2vLWYU1ht8GDSkbAp14JzI2Agkl/EZDtBiz+GAa0xO3KtcHpD/wRoOX3gaV//nnUwr63rIZohjf5swRmDzHNZWLLgOsnaWxs7UTHZo6G7K5scf/y43z96LgkpG2AlE6pIRHZHfg+YwsWxneWjvFw6xEtxE3DOnvYecJLtZ6SlUg5g4YJqbSjq5trsmNoFTieXlMKIPjx6xOgc6181x8QliNHBpCZ6IQgf/ESe4fRVbpmTJ6UnF9GLNAxkwM1xGrmIS48eNm+1jHQAp6pshHjJYzqIQ6cXH31w/KuDlx8wj5M1MOuU3Tjx4UrdnMW1t5YilNhFC6oskT89pnNzmZXYgViHkLM6iDiAFk5JRkqHfeMssgMtRIe/pyw+xrkPS4zpYyJxBMejatNxSpWLhn4ucB5EtzOrPs2D/FGPlnafYPC4AdphQ+2KrYjEsoAEOEnuGaWtV0GE56Plep4Llmdzc1JSnPD0pbHixQIJ/HNHknyuPTm/ktpQwCTtenEqYiDs2i3HaSqstbx0rB7QitWKjsKNitkxEwm07rhKmuV2N07WHSu2STj0+Vrr/hCnX0yFt9gDTvxZqS1GaRuNFgJv4GSigEhsPuB0qQUkc59bOmF04FREYLGfvnsd5+Hih3YUcf3yxbGKmb96JnVRW3RF5DBWx9qwxDW4uu4pTErwnWK2hPxlrw5uKMBcQfKRrAkOnKqxT62+zEVz72BiAE6Ey3ulbCFkSB50f6XSGK69aMtzj+sc0rjm1xM47yGxUglvc762IbTbVIL0+WSWgPPmXKxx1q3ZwgkGnHTFcz+c5i3hWOsq3H3J3YFys6287SWsmaUfuGMetbHCX0yaHWSamxKQFmM+vPkP7ignylt6NZsikKTwkPPw9c+0Iv+jwTivhkmNPS9uXk7LK06f3FKq5Lx4ez7GKaHCXWVvv58zYqp4xxoJcMKCUkPl6Tyrth6px13AGx04/QTHPfL7aQymvRiKkAqwoRC+1zXHrcuz17N1MuampXW8QeKF2bHMDLRC0i/9QpufbaxZk24YuObntAibrUvJBSn6KHp0oxWv8vlvdW26Cb6mTslBalF3D6EJcteOYaIt11AnuWRaJgHOM0dNdeAw6Ono2gEn1a6Xf2kU589qWVHActgmqYu3oFXYVPO8qAOcXxvKBRLYOWaHLChwkg3N1smNv9Ed1oIT2/jbHYkTcFJKmM2E/MmTMaw29IS/NuFXGs5zX/e05/rRnIbBkpWye65hI5pqqOMD7da1d/yE1obMah2fHeHo2M8EWqp9zbRzS5jcMCg1Rw4Lmx09McDkepez8/HToZI1oBRVxUS22NFn3spoeofnIKPIS8/is7dQKwOkcN1OcitlY89Ze/1MFkYLkwlwGrkwI0/zgXMVOS2oRBHaEkrrdQttRg5yF3n+Kf/NoYQGkFwbnPc63nMcDbRMTmrvyKxnvgBo2aHZ8z+AlgsPpQeFzByXp2EuH2jV7N4e1B/QutTYFhHuz9+jiB+jPZQs07zKx6XsqE3l8kX53h039rAtjvgxD/oMV/rUsqibKcaloTMKnEsHr35uTid+h9q4q+IstYVbGzhJsWh5Ud8mZ91n9bPr7FhzAMyD+GjKfpwnJFqJXdIN5sff1hOenItJlJ28k2dT95qlaI/F+B7WkO3XVAlLZUk4WCbLanxG50baoXILnBwYjMgzE8qnbC8Z0TOoG9BShvbLqGck+WwRyU9q7AvAguBLVodr8rvM5w9lU2QBVlNBFHyGQKzQ0HraVGtkATc1oiY3f0IlMJFzRHrGS4ATHpyBTvrex1GvzeLvgVQHN99bcOJ+Ih199XQyK4o0fd4qKgW0lMb72tv+GG0wLhpZs4Sy60U1Be4XUoO2QyR+XPxRM2VUvlNmTueWYPIldcgpKBt6C6FoBlNpQk9UFu4l7iC2Y9YZMA/yIs0JV87+veT37mkKledXx3weYIYjLkpf/J4Iz3RXAhFK+1iPjptO3E1SZuaijVO/iMXfvpuhZNxv8EeAuXEzbefCKXHYfK+8dDj4Xx6+A+aRAQecqxApfFWJZYvlRtmnY8BASfqJfyMnI+dIcc0ZScQ5PUokui48RQQZKQ819RpHKUbm7hqMxOiBuTdTjxRmcK7Oa6fJaeOWAWzANIZ0O6UmJW9nlIQQN7wb9USj5TRjss+VWHedA1lzzVcOBIJrdPTrVK57w2hk/TrdpGOvOSGyc34V+j+GKSTcT1UQCdNmSZkVkcd0BAMdvlIuG1TFyewR4OObR+008aHCO0iIAZOsZEnmprF+U3W+7YHwq+vs0JnQTdIsSkEkCbuqctjTSzaTeUELbxpgIqG2bZq+H0Q3tSWLDQ8c63gPTL2XFIc/dZGol1KUQwPYGMM6CooAy+KBp4z4gBmzJofAohonBzseu163TKOnHD+bBFWjlrTh24/TweoGmCL6S1Dy4dNvWBe4lFIUP5G3hnVsKgKswnezmf0EFhaWhCQlEzVs7pCO8SGA5bY7a0dJIDIoKXpqgQhvj3eoi6hdAyGib3vtqqYXgIREpwSWnFzWkm3axSlxzbry9wa9lgRbcKT6u3L6Mcp7Lkifm/IwNDa9RJe7OesEN6wtYE9wHTWlyjMuuexSxW7dFLstLupcXN8gvdPTRBY8bZWS5OZK5XaQd4BdfhxxhI7HC2AzhtQMAFVMdof4LcCSus9GxkGo925CqeRAYiBracsqeTIXWTczXnf8Ci6lwUHhrNe2DlU5wOQQyl0DffzyOtWLGb3dOs0d1Sa/1q1LnWrhGJeHtGRO5/aNGLrjgvq1hdLcWRJKkQeJEvM0a3c2e2J9v+hCNdW8PLgWpEat2NFbCaclKvHLYUJJLPjUPwbYJTZqRh95HjPxhiONa7KmPtIT1Vm0TAjxWe/tqDLGJWScHGlp+dybSLVw1BHsnhY/H5xmRxR3HkeaARbvtjTMDrBnRrRkJXH5OBTMtR9uaRwpjWRQRf1eC/w8grZxDTHYZX+cb9pHyKlQSkthpe1rkOtjsJxEWPunk0XsKrU+A5w0Ar+ORXCA3ZRRHw89sJAojQ7dFQnVjvl7wCQb+Jr6WD7Zx34HQ++bq8ktn9lypnD4c+f18Q9gktXYWurjNq81F/dU009v8Io1d8rlV28hpwFMSm5T7lf/wKu/f3JDkg+Yht+YHbnso1MCeK1aQOr3gNPugBkUA0k31qkZO1e1DIVw9nSw5NnitBgpJ7O7ye3/F83h+11aLht37IQCpngweng0SxL0ArUyFN4QXHTHdohRqc8Z54+niRzhYGJtlYVT5jdB2O4AG2OdEfq8dUkWJCntM2xBnvs1v/khWPbw7NZDORkpPnuvldFGTmgE6d+tAyY3LpYlhT1HkF1rh3JwKqRjx9LYwMN7Og/DLqY1EXakjWMObbFPcvlW6lpnpN0R/rUn/X52R/Y6ayiT2r4QhJ91MuJeSizarIX3i92x0+I79yXk4vlicJ3fY8V/TobVPBMlGl8D8B9jJReBrWxGwwfsJ/VmSr0xrmd0DDQCpg/8CykLmeH72SkNjVHgjwIPDUQqphcXvVYqEG+bIu8lKj9E36GyOoZZAZM5+/7aAZzJbAHborX6KEzT6WEAAFadiERHPgKxWDqq+EyhCLprBws2YB6u91pWbTbjbp1Y6TSN+/Qt+bFe3P7jwKo+fXnSFpVMkwgVhFoEZM0ubhgMSaeDke5obfhFZJPzoUPrEjBZ9Z4ZRJlS4vzA5cR/s6WxbKTEPL5SbhK81TmjNLUuI8iiYA1jRIAZSqXM9KmzhS0l5px7anPvlrjzXBPfO5+zZq3kDvIrHx0/es2Wut2h4jpFPTJfxJ2YGl8SBXGCUzMtp2lIjMNfExrfvyMdlF4r0Q3iqSNhNZ8tWOGJ3Ml7/YSVvPXjlHw8gUoHXa/5NakYstKlhYFIJLxSwJF5kMK3dOmNjJhwGDOjEleSNNeUYmApuKDdsZ4GmGTNsMgmyDiPXJOOkBmUYOmgoABKXs91smoYNUHhjypTrULLO5c29GqMbJgRK+1/fQRzcFtsd3jNuPBnyNGeLROewlc9422sdHYtiwtGRsxFGuaniJ5Yi5oMiGHCeqSBgZWU5CPdl//kSDk9p7pXyy2NUCqQZAPDn8CkP9odi56HO3QwS5pOsgPmV9vy3f3ewItHoNzAJA2YFO6zkTWR2GpeL4rtt0+TO4Sv0e2PYVr8O2XCvzlKHGZJt5BfXCkjNzowxgoSVibxZ5AusaYWgTSbs02z44vPa2r8GhNNYAbislqWyYlOiibsDpiC1CAfxghxRCClWSG4joGz7FhSOqTB3CwBJSDjqJTYGmkyDz5Uw7Q1QLrKGTOr0gFmmNWoZHFZVo+e3lnXLSSXaj3HHlUNZeHiEzKAhpgTMAVh8UqH7T6CuZRxYkOiAZiKN56PByBXHqSRLcFE4ocTbYjmAJPrl3nUwbx7vQak34YJhOEdKeaRC5eH+iQpyKLECt758NWyzQuQbDuPyFGuWcyA4ScjWspJQLnJxWFZakmY8SJTft+yx7bo2JIFTApmIrDIQEpxzRxARG10DFMDZKz7t87PcqvVVnkHoippYWE9VM/jXqPnN1NPrY/Jm7m2dUxUASblr+8qfAbzplMqVRCJJzoW0gDTWD/auQNaZPyyWtUDtzo6WpiA6SQfmylGs9IyyuJkmryG7j/EqBfnsW/Sizw/J1ZfXivDT7JzdNS6DlXzOKXz8Nad5ZtSRnkzdXtDlx0wkasgn8zuJnkxtMQRF/jmMEnacpasuSCwSM9y+3YvkcLGgZ3bpwcmPiiyizyG4+5p8RUdWVwJafjk7AguEgJ5DjNeH+5tmIqoQzvGVAATOAglqRzF1nsnx0s2CUnl7OgQAKYdH3M9wJzrlDJfnOaJaCFaBcxAfL12epRbS6vbrG4h6/WOIty5JhzhebiY9S8OW3usRQ8VMDl2rOelTDNTrMdrxIUclrTVsSQDrCSOOKrdL51KRiE6Op7QuZxk2jOjNeJZriitF7M7QP6LjnzNr2Fs3eSZkM6vROF9mBydawmS/LoHjlIVv+BmaY3ATJBTwyS1xJt+3QuuI4/edXEUrVaXcZjOjv4/YB4O6WsevVMwyWoV92XS01kFzDuOifkAE5llscqFu+na8dHjmuE2LY+QdFN6s9QHFA72tdQM49qiPnY2gBgUZrGSkNvNlmQtAuKAyarmeSjG2dzFSZ8pfnqI6AHTY8MK5wbJplbnpgbVdTo2IXxw1IM159QL2S0QWUvYyDLX0cIATGqcP0Xvxmn2Yl7JxHk3tKcBU7kiKrndNMp8iNWSjMG/bh0wueylqTQvYP5eqn6/mGBclW4I43xet+pJXtBGDlLjfRQW+qj80oJy2b4PLD1M3+fUIo+BcEA61jQAcweDQn84TWaepXCT4+AtI9uAye1W0bzo8QHMueZNCdcBk9zQOTU6YVIWspJbusNGtGxj+brIoRZ5f00Ol+BqMDm6q9aQAgMmHLay0JN8dMGFqI1CkxrnVw+xAyZiGCoMZC9dyOVcWshaLCCNFhpNwPQYxkgum0qARSmKiAZHXF4sGB/ClAtB4cR3z2HGPepXgom3Fx0FOcAUloNzXyk3n2ytinTIctZRngFMPVSlSwtySDpnlPqqi/tNPSJygHkCefpK8188oaJwrCCIm7iZHS99X6S7pOZT+oKKsrGyKJLU0iAAyqUIr/PGKmAW1ZeFjDw+O0ZmAHM7TLu9NsNnNiq1mLjVnhEnXTpGKID1ZjzPMAa+XE2KLcgD0cIuD4yhOK2z06ceul4Dom/DFNIzdgzHuV4Tn2Q+GM6oinMAJvnXrGG2BzA35WbToTMTP6XZ/CEw7S0UEE7xvaNiqdEMpB81jbC4WY1GD0pOA7qlhRkcyBqn5Cl9ym00G54PxfdguvOCNvz5jNLu6kLwNyccZQtM+UXam3/0w5ZJbTZbVV/CDh/DJJHp8geYPlZNCvrmjmMBtwOms93vD8bIRWuycMjut3gHlaefu+Ix59Pd1FnMMAb3YTsoqABzmXIjcuQw6Y9HzQNx3KWhoA2YG55SNL+aoaMUxTFdIzd0w2ACUB7KSUZe2hxkCvZaKx2/4Ysb6GOY7PTtdJyYE52luqaTym53SB64X/NsnFVecx9z19YGABNH2aKvBph4H/usPR8HusZiYLJrR4qIoGOTyamtd5Y+3U445uK87pDNKXXvgOm3HnvexhjzLlzUHlH0aAR5XMMRIuzuL34z9LNtPDowCumC18OGA29YKT5CqMn9yh6YMBrcMUsnkAb132tDfNxkmh1zsIB5Drmk8kGpQebLUo5OVTVycXz+fmJcY5C14+E0GeWYF+e5pGX7N34tLE7JxydwJjUOaWToCAdEG7oDwYXFzS7YL3a51MAbfHMtgLf1u4/4MVYjh/h+MPCI9YrDsMrtt9nz5WNwYDX97EVSOaHOp1nHtGHMawpZhPM5jzrMqWtHzyOal1hM23knsHwxZS6+9Y5FIcCkwlvKcE6Ua9Y4KPDN7Uh4y2E6B+32g+E08VqTGr8g/qejGBfrgguCp8kwwi9rcenX11fi/DHG5S7nyQfBnBRXHLhAvju20QFTWdiMtFm5763YWs1wx+FQ/+iAeWDT3c8DTMoxlHIhKqlH9Jwmq6QxHhZVYatOLbMctEXWQNQVwhE+FsfzzBJR3imVYM8mz2fHTDFgbpJjnIf4aFM9thJzHNazW6QJARMxx5H9kK1trRHvwmJODv/1fHROlpL6O3lCCJhv/YIKzD199MDk4iIsW06PMZVsI6VGCxtNt9p3B0wJkhzmSnpqbiXlCiaBW1uUKwATJ7Woyu3tMI1Gd3cMRAImnAze5BPM8+LwfxemwBqdPRoK2qHXCPy0SDV/fK1ZYkWh6I+d2TGVEJQlDNspAedmmWrsUkeVeNoOU9npTkktETcc5rEVe8Sxur2/H9Ce402YJJDRB/Xzc2ddpY9Owvqk7v4mTENIzEZD1q7cnKJaxYcuHND+flb3bZgkGvC0XbkZlkhpYubmd5SEMOFtmHAxjIkzMQXAjGKzxWhxx7QWmPjTOVJJxyA9YW3aHfmFLv/eVb6J8lxj3vJGGX0YgsVT02hfG5/pjO9VU96GuZCvROwc5jTfpXmZTRoD/V7e6W2Y+5CsMos2leTKUos22fk2957TPAPphT6c5nKp7Q5suUVjOl7QuUJIu5mSbiJF4Jp1zVeS72d0mE2/KNms+wdq2Fum49Sw8gnOjufOfiAb6ikNH0WuGHNWYjnnxKF0fHlHZDxJQp8YT5zmQS5b+vIq0xHDfxvMvQ3TDTZO/AFmzJIUNq+nr0SP4k2YgchYPVKMnLktFd25eb8Stuq3MQprUnr+AMoJ97W/n3d/G+WtrDazeXfCPEUWS+4P2LIemOdml31wQ8YFzIobWk6ZtdDP7+Ucg7PPHjkR8GBnq0abwDo5BVRHC85lvEArv5yjyEDBgsmIDttOmDtEJe2vfYYzJrsEPTgpGespYyBxrhoBMCnv15LdhDOUtOy5edeps6TmwhkK8pdaB87J8Wf2kx9wOi5vxVtOxDZrfN9lex8nnVouPgKca57aihgrzT46omPiNNy+XKKROGEDS7HcokRVwiz1Pk6nYIakDNVD+YpKPKYyEcmd1XKei5U52ZYHnTCCNbVTZFOM5qLFfq7rVgSK/LPjB9TKH8JmdSLL/D5MJWlT7o00vkiH3z/NsWx+rzT0PsxDZqWV9goGhU5H7XbiLkV8P6P/Lk65Br75WOlXJ7NgqavOxHWxMNEDc21qYeRVeATPNQnRRZqhaKmAECeiLuGI7sNAEpeO16wNJOE+UX1m9xzqGTAgQ1OUVML0kp3Hax9i3oKSdZCR5kbsThQ5BNcO5IazBea+pgHKSN074vEZJXYCZO0K4/k9w/L7OIWD4CnBB0M6KbIIyp7ckWy5nOQ13WwyW3qeMYs0ghxuWS/j+zlOJ3tp1hvkUFLtCcHLnYgWZ0RiU77G/G4qmY2slmkiFkxotd/HSQb5fGOMegKrGMpTGIjErd6CU+EwJR2CB07ZNZ6pu1u5fK2e736om5kuCn6Ck/ums8nE38ym6+ZGevKaTPFmtRxy/JWzfAqW/KbwN/thvKKMc06NER1lT+LcfNUp1wez91Uj6psurPpu7TlPc3VLVWPvKgOCu0o95BzES6ZN3x23E58ojUMUdrA0ugCYVPu0Fv9+Ln5yGQ/HuVaNUXCyekaeJGvBKU6NujQtBk4bJU25SVJpWz0+6SAOcdz4FOSp8R4i6oRLeulgfw7SlUXa3CJFrVKH7I1djtFyNR1hCJdVHyzSHi/FwrdxHuNSeEuy6Rd1ODRvt39gkSxYmfem84SnYc7xYDmrJgnmaMJjttxORxhCwtRHqfWPwLLy712HGiQAHA/uvYxTz540TB044/pVV3uI7aoxPYkFOQ3e0uUKhCE4UfsDMA9n1KSnyRWXBa7RkzuqRnX3rbeEJPp9nBxS8zSq2zCBKlrDGVyoaInq5rjIa+kzGf9ikWxqaSdizBkqLZcTKOWXpECCcgeXpysoJ1eqEv7y91HaEp0pSiXXSzF5Fz3S4jWBErdyjXNSmIjEpdY2uqe/tnfAnBdVBHeabgAn96ZrxylsuXdMJhIn5dCzAeSjCE9qWzALKd98WbLPQTKytHRGDRDPrrUPKOprw77nBX8fJzJB9ayGjA++ppYmlSajL39xv30Kc110FHNnAzY3+2tNDZ5z9QxaW45zXUvH8p2+IUcY/9quexvngG1veuvr2kzdpqff/WyPEpvKlNj3NFQPzoOc9YyHQX6EzyVSDThLIzHU6rmf+KU9PD1NJOylLa25IkhsfDpup1xcVtmehZz4bjSsFe6Cgd8dnkM7eoXAuRG/51vswCkhy0s4qVnuLekbcCIqxolmk/zcLSoJGcO/nfA5WgJOuYLcqblNohZkLW8blMGbCaPXuzg3VYhcc9ce23dNv3oE27mvev7nOBGuUew7c+1B01lKiIZzxdd7bOe+lGLgnl/P2LWWEXwYJ52s6bOz9+SWru0ErFJNpWL4JAtKy/TX1Auh75K07QqcJqtEkjbHLdq3Woy8IjweNyfWQ02JYE1LcsGcW5+jZ5Ry3iqI8DhPhxqnxMA9+eAp4N6D85x1TqTxJ5PlWm40WQVpKndPu6jgLaopTkMMWeJ/AU64957+K3Dy26xUQQc4ZexZKiRPpfUdHT0O4NyHml65rTcdo8QNQUmv4dbjk4xFOtknmwJj/W57aU9i3iWBtaMHJ94yE8pszTnOhJsufXdcGPx/LUOKk71CY2c8vZ+HTEijlsfZjp65EOC8Kaz94TwXZ4FLTglRodrpmGMATiObvcyH8xwIqbyEk4GdttjPc5E82tIZMOL82r5638kbyZRb7qdfcPG/ejFPTv4TsHrr2I8WsCLBhvVPYKsvitzcS3uyJb/1s/bjDSjjXIe2tKMbB5w+ApkGft7zoVafP5wzqWpbDjUuqpaOfDX/FlGcVnL3gROQ3YQTbxS5XVoWi3MvB5fCUXb394genHhJkzxKqdnXXeO3mHj7unsmwoDzyIqdUo8SJ5npSo/JJNbLZXyOk3Gx//iY9CufeD82wS+a6BC+CXaNa977Zw8f32SWxJUmVc+WuvfgpGzjTl/SWdUCs6oPOx1bHgDJNHh62jVG9jmiRMdBnBpyVs9hOtJgfJrUgjrTkFHDSX73lsbCmtccZ0oqCAScdIOlwoPYlqbEDjjvDbHc0HNDp5Yni8r4Wg/5HKaqTcSl6cY2fMqqzdzIPOtLWeZznAdGY1n+jHy5lXZRfq0X62x57usa5CBZeS28jpNl8K+5zM9xLtwiBGBpvuQyQ2qBCC6UrNExSr3uPqKSOWSlZklZ3ivhNMY4HfW7xT7i9CfKGFa0i99ddLI+3XM/Qzk+7kefOGOcjqX08cc+03uKjYvtRIpTaYoyVqmEx/GO3UMgQpQIQ/Tfz1r8DU7EZVpr0w2mLS2zTMBpfCkjJ1+i1pLX2nQT6VcLtw1xIpNDpJyunw1nDHlKOMW7RjHWpqw4nXi6D42EdNZmlWGZN8crRwtOAZS9Tw5Tds3Djw1flqhmvg+TeqZ+5AEn4qVaB0TY9e2JmDbrIpZrhwAnZZhLY6CcvHKEDh3nqdcQtlNyyqDY65xSCs/IYPWs6wPnskkhzvS5B8yS1Dp0zGNfBPqf44Rt5JxhauaRcdZ0y4jThkRHJRw4D8cCPac/CCoz1UphCMHn7ono9brrNjOndMYT0xJXFFfv2CtvMZ92kcPmYSlh4EhKPJV3k/umyGmBue9Y9gf6gzpYpB8we7F6ztS2meY0e1TltZi1xsJkq6cltLNfRZE11x/AOfHbnxY+s3VYFIFPyreiB8nhKr6TXmKcNpyCAEzoiR8vKclrpRjf7f3SX/0cLOdCZw7SajJ7OFEOGvfUag+iEa5bwtw/n6jXBOwQa5+QaOl+LL+ohmcr0iQ53K1UAMf1D6QMPYVlR0hyTJ5C0YAlrBTAOWQusqTlOfmlt6LZQOCMf7LVzsE1sFE71BVIwWcP2IPfeg5KpT2CPVYiE6JJWScR2XwfbHCpVXOqlmGIBksDwkhiROZpcVDBVo2TezB1UO6vdsvbH5+UjdYyTgCcv3QM8yhqUttjF18+DKA2nafRWCKl3U+XlKXYUXr+nPJrmhkEWEYnZIR4fP5TlhencKnx5C22SsbFGGTbgeV8AgtbVZrOGsfJJ9bC5ACwlFSm4UxxKi5c6QbEguc/LcxXwMnt3vOLlS4/1LW/9CTeD1UClq5lDhtgj/thIfTxbeF4rLa2NnB7Zs/ip0yEKgtQcsNK7v5SiRzBQ9y1l9WCEz9nUUrhh0N1r1XKybq8vIV4BGC5uyY5i/UHOGFabMdouamTUyWSDzmzV7ijNNw+2LsNaalAA2dwfHLm1IzItWaJ1xYJtKvZ7Fi3koUoxQ5pix5tP5eSSoxtACtkbevokAHsRoJCv5eGfi41tT5KH8bqGdECTjxMe6qfDVeZpV07fKiVKbG+j9OD6zf6Q5Jyvrhu3o6nF9kyW8bcRbgidi+rxSNYXTXx2Hsye0hL8A+w1IDQ9POzuF/y+rw3x1sI5gDSBoyQ/BD31d8U1cVv6ZAWsE4CbssNfx0neZj3akmnZF9IP3XtnKGznvY5JQyn7B6crPXE+Sno/73+8f56KLNf7ZiAA1gVAdD8UOtpH0zgGaFNH/8uTKwfbNQHYA1RWoyOrpnoxSEjlzzkm9N2iWtunEH26JbuM3AuidCZlicmOcVr++Cw0jGaUO6z6et+ZfzRDtaR9S5rKfgBLD8QgOZJ9IwzvdaUOOfmO27BGSu2PNTQJmcurWZMqWbgHaV+sVvuiyxRjwXUD8BqwFS3jBMDLOmdRB8qKAjbSvy3w++gt4WqFTiR3a4jfwLnoRBhiy4ZcTon5yN+MPo6auQvg8wHYtZSPDnX4ASX52yTU79Ctvc9KSP0lg4fcMp0k/HjoVbBBllEXpnC52DxmFhAHffzP/2FSc6B6eoYLwZYEuvynT6Xpg0/2moZ/z5xWiZ7xK8xfinmPVZR5+HsS6nmcxBTqVkP2LVC5EewDt9aGpGkCvSxlultgN3GbCL3rH7XKCowFwJUxME9MI1pykMpZTJ5K5mATXnKpraEI1IRgRf4IQIg4UXJBKiazhfv0adg45qU8pYfin4zkFGXwn8FVNeeim9cQjaynXusNaaVuFfGLdDqLZIXwGmIK3JqoE9w3sI40pOoxOUbic9I57s+KKBTv++0wNzjolDUfKj3cOumNuWzOTTzYt38HCcS6MDP+qF1BiNVG/Kih5LVwmMEsHhIA0H1jmewx7xmpeD7EZA13QD4usnqTI4zZNUMFBL1cU7TDQh8naE/hKr1Ti+55ifXBBrATup0mHz/9qdNai5UThS5L/xaz0o2QJKXk0Ic3799JIWuVLsvXNHNgeGvgcvPgRr+FVF/iqUlWGfbY5aUqVfcVm60oI2BH6WvNCVDKwf5YQ3thhVs4vHf65q/hN6fghThKjl1Piuqccqs7bUs/zlaTnron0C5uITeUvoBSsWPShW1N1JUagKVuL3xQzl32THYD5y3zvlzJrU5/rJrNnXdIU60ZNRbrgFjFOmaDIEe2zUdRlZTRVqGZwF0ccVZUkoOAo0zSlJiCPcX5T9GC1Cllmmkq8WfAN1cDOhZNATQg+RT1uPgFNHCpEaJ5V1I2tsT+gNtkDKZzclntHhUXtO0NVr/2WKs9sWEyZ7dFdAeJPJec66C/KKnWg20N0HF+MlkHfapSxT1yqn32VKuAFrjrrm8OpWpOTgU3itJsm5k7fh+0XO2CIACqetTcWXrbdVL0/SAeTNptDgvveYQBO3PaDfLDkXaKxJ33Et0LWjZXiPlySNa5uFW0j9FShF3sd1b0Oo5cA3PFox7z5QEXkUpquhhPgRa56TXfuJc96IU6rSbybwHqF3caV+pzg9uGyyblBrCpByhrltLAcMubp4OyzJDAJ3s7tWEqOIX3/BoAarT7Tb2OVC4S6+pa+BT9Az+AiilXSxdpyHQuKcWSpJZurmkuVuARuzQ+VhmudEiYC6t0Sp7zT3bP/tci53JeBz//wgtFYqkR1YaaDf5zZ+LmEC7xrKimKfA4c3dMW0BtAfhP9kF5w9omXONoqTnjJalf6Alq795mst8BBQxIbk1Oy6BX/Mg/7eUT1jZhpg1JwCgMDI9+bZfm1NwfwIlko0vXpjPUSJCW/nAKoGuUVNcodAOPHKPT3XyHtvMyxcAini2tKswj4U0iVrsuEYo+0sZ0ZwZtR9rSlC+FKGYNQEV2XavTaZAufVd8qnssX393c+BUomMqpbZp9/INbymXnSoXKvesZ4OoD5VEfKmqkAfAbXfrFUfAtVxkUF3nZRckrw/Xzwt70tm3txb0QN00SXlXNcESl01r9nRkFcj6XOg+Db4ef0ouULbFO8pm5WH7Mn6MAJGtPSDpVuKYI8K5h2FQJ33WNWQp+dUBwrfq6+/+zlQlmtlrPw1wddLibuRC8+sU/Uc6KbjidQ1fQIUmeQ99+8tQBHd7HyFjkDv2aAS0HUEjq3l2XOBksO9qeoOLb5EiTnlVld26wG6rpvbXfPayeYkXY1GGrEXFzQ6mtUAuvchz+ljpe8TtBSdgt3oWFEAWnh7VlD+xLGewaGd1fT9gyXOmVsoBBc1dShzjpW0hHoqVLXBaT69pzrQg//yaVlMA1CJffB7/+BJA+F11AqSRqqjlvI50JIzSU3yeC9G8GBL5TNkssuavr8jys1Ftz7CyZWP0cLhqfvigLTsB5zza8LsbZzk1V4tZPdKJcihcz/YJxiYXaPLODcpf4/H35cNfJux8tAkyJRXYsc8G4HJ3rsH6B03ntfDzwJ+qp+cYjGCmpc7WgJ+vbhGE5EX+AE0PGq1XcSKMVuIaABUWHv1VJVBqYHto1bW3axCt1DQKXt7LImles8ASiGIUmhKlTQnLVgLUBdWy1JhQOWA8at8/DZQJfNqdPR21O5OtPgPZX2gZSuh1NsNJNDW8/7tQuh43HMXZSTfLo18T+4jwVa1mH67yC8kDzUekvwWFe2Qni34/Y65CaXioiqypOeW2ZFb/qDk+TlQZC3sLnouXHtO9u7Htg7HF1/LkO+/ranc9upBu3WZr5/OlrubNW8F92KuPdW+g7R/cmTkuWX2q6lWswRz6JAeu3WuiEWFr9S3nnu7aNR6e0j9V8sevTqlWqgdlrosqmVrcW5ik3Zcm4DqlBk77Ujgr4eUy9KiHCscLUA5nyy5WqB6jC01bnzyWpODuuOOBkdmmPen8T+iDaTFJW9Ffe6mjW/l/tyYks58kwSGkz2lt2T47t6iygWchjBk7jSq4mKZvrj53p9Bc2oVNQGlDKTm+mHwCkL1opKLEg56tqyl27jwv/YDKwUX18vqcY5oHNFjE1rk0jtnJriBetRKPggso4nkB0ANnvmnueRP0CILIvmK9aBFdC9PdYrYZdkz1uCbkhWbFxezdOa96CDDTm1YynAB8BQ6elLGXo+Sgvmn7w9rVpMYsvVLOG20oEVIvac8EpETbSDsLkV+sDGBo2h5W+vmpFLNfBULlLtWqmBb/hbsaoG58HE5h/wY/AMtwvdSvWKfY/SvowXtzcG41h84VdZ+SCK3WnD63ZSxB6BiJ2rCsZyXWi1LtMY9KrWnmVlOZxXFR6hiZNIyOwGgqpvaxTlMd6+pBVMaSlf0wKRMhs7zw3MyPKfSzhc5Lvf2FvUu22QmwHvJc6lA5D5KXMkUZoUdbmn5AajswVmkJ0q6G+0Xv8D7ovbC4EJ7jvUmX86n+wBU5y5tes2FM5091FTGPgX1Xh8iKoRTNSpSssLue+WvAShbFDKW/7Aswxn1VUurWKzfsyXzB1pZXBUaz+U/EujUNpR5CWZYSw8AaNU8nvq+IZyhOjVrxW7d6uiqAKjfFGnPG6ofoVVf3iPsZHZRjlXmD2sTn6DdrFq07HwCLQwsKUQ1B6qksNklB0sqevGeY1WSDu+HgOUDoPQxp2VDHUCdDYCV73eRVXtFybcienA4rBaglHWb8PJ55RcYQ2oZ1Rwas0fXDUAF6RRTn+f3T2aAEtcvOYSVy4E9aI1L1CNfmgDQuUrkyaSyXk3baADqVKDbr4ZKGgmsWzKrpNZtQTnIjm1E8+tOK85P+eoHaAcHQXqcgF8SzC4ezCqecnFtDjd1f8lZfQ4UbgpRhf3kW+dZJerXSR5mxOctyaBfwVh//2QJuFta5FRVxi4t61MWXKDkjnNWDDgTrrdGpkiVm/1FHfw5UCWTZqSR4C0SP0rkP8ghlSJqLeUVEv+Nw4mdPGQV7ldVnhV+MrLIlvd/xnULwcsfgCkIqmO1pACAyV1J/bEICHuza5sUgHVEW1iqDyW+4u5G/wGcmwWrFrrPMy+SiLvv5ynAT9Di4ftuIYADWmQ/3BnNawF1oCTTwd8ePUAP5Vh+dlXlxIo2bp3ZYVOBNvxm9v3JVXEYtLZYseweH+94WutaBivwYK/KMJmtfImufg5TNY6Nn8pBSGitpkE/ljIh6qgJA62rUpUwP9VjL82eSiLAycjvHtay93Byr4LCHz/118poR0y/h0lHC1pF7hTnhxk73AGZRZ5qbmUlw0Dvo6Xalz21hBf/qQnT4XEB6e64BPsilfgc+ehqkAKh1LsYpKXhSEAPUJNB5pmfEkHjQHiJrBahMOesvAUtPj5HQp6nFuvZID4Ip1e+r7S+i1YpWQFT/0gG+0mSPfRQUvJ7EpX30RrLzPOh0vYBUATGXzNlfwtUxrtA+Yn8sRpw4kXj/z5Q22efbytt7wK1a81fQz/xZyptQHvWV03xc7T7noZIv//i2WhNpPIYBQb2tybrfaCUkyI/R4pTZeya5DdMtiUr4O/iPNcwWFZ/LK8ICzDIQGtqmk7d2++3lt9HeyuV7R/RanEqGIcxcA++Fyp9H606IiDLpoIJFP85KV1WLmvY+Z6f8H2grucm/ZnPx2pSGw1G2qrjlpdsQOvXZIaRKmzd33+sEhf4sDuI+L4i9D5QhmpUvzsp0CM1eoWhOnAG35N9vQ8UF2mcdDXoI6B77zP8eznVd4FyfH0ddvD9DwAVTSUA3wcqe9xqfTtvtNxo9ymqKg2f5KoZLWhNh3F7YT2//zJaobR9IgP5Jlof15Djsc9TE+tG66PUGx7C8cc2tAhW/JZD+RNAF9L471eD3wfqDqBpt/0OAkZth2Wwgv2lIvkpULLrKG5plrZ+BJR8ml9EMp8DpRKM+OMmw412jdIc61iGDP6c2YOW9RPqlkk/UIRjm3MMDbbVOcZ8zphZt/2zE5XDoYMmoOQ/QliVx1Nf033vf3iTkQyFvA8zZMJtPp1nOfBDchl3I7EBqFxL970T8RChci289PBlkfB0eAtQ9Xn2V06deihmgDXFKqZB1G/oQUs+Kj2P1DVAeyhaUDtbjnHpaUHLoqVYPsd6A/3qkbwLdHBOR6TFnu7rZi56Xl7+CO1EhBJHxVrQhgbu4siNADLZWZPWHAhwsg3Wd4GyXolEJfKk6i7iWaloffeENTqyPwDFp91cDEz8KTLY9UXn9TZQMvPJbPn0di0G1CdjUJZJPeO9a45fWKhsSaoAVMnKK8+6ZR+hRVp9y0G1oGW7/jcx0ANarjGMWgpIldmWZ3WuqXhV/iNam8dqurUDt8DG7EG7KfqXloFvoFosr3Ioij++B+hxRfKbAh1j37xQpe8Pz7ISxeJ3gfp1M1PsRyEgPLubXrWmB+lUWF4d3RVnZW3cReUntNQGwB+W+qwGG0tpDW9Biz+2NbOElQbnkDerVAcmiYXvlgA7LkSU69jjuA3cuZLkpJQOaFBXsqcOEDACyn7P0yXA0cCkiZSqVod6SP49/dL7aB1xICP++YRWpxS1TAfnI3S1VARjXAiyWAVL7BaBUpCxtC2GxBXhm3V4AgBVPIAtWU44DzzkbbMqJ0p3pd6RZQMovTyZMTUDelMalKxVIHunPmBDlBUTWTYXLx7XWilDSS2n0v7dmGMj7/UetGzYueyn9jW1aKeKa+1ZIcga0ZG8Am1sctmml4D0mevFo/Y2UHIhJQqR7wJljW0oudsfwkGOeu5lR4trLXDfOnvQ2t28eVxrgfs1JRdH5RJ4IEVCeNRxCeTiHjagaIpzwa+VGgIhpN+VjvY1cMqeNyd+CvSI14QWmbkIBwNWC1A7xoHmpHYxyXo5agxxeP4TaZG2PP+NLz8pMPkYA0yqRBWV7IkWQfHoQUveYQ4bxiPamLNYHA628WbLZFCQMBhe/nmvYU4WOhHZr9KVNZgB74gGgTZgAY+lYQuBSnFZ7OaNeJFNfwpUrwULH8+t4RutSo02CFmWr9lScwVaBNhrPcuCfnIJKAq5kSJpD1r6wPm85A60QqWfWqQNj2Vzd+TcYdetPWJZPRNAKUdUow7kbK+8GEc/B7rZE/esQgygzoHvWtiyD51eRwILoBwSPpr61+O31yqt4CHE3NpzoOcapHZfuX89DrfmpXWhe/dSvAnozevnDwc696ix8HNMD5/KenDaypbEPgMZlF7vsaXnCgp32fnBliKzqknaw/IP/CdahgLDL+rjIEiP+YxW1iiyBrE4OlqKQXET2+LSy8lvqnhRuZp8MVzr2C1A4ZsR5tsPLsqZs9Z2hfGq9mlpuUVck0jP4xYm0S7xmnIEKdlHInHxPtqtOu/YKge6ltaKAXMjX+0CCvO+Hv1UGafz5shqeFW4fhQLophd7qeOhRf32fAY91wNxopAyW7n9gR03vxHJas68aCkoQxEoM4hQ33sChLtOqs0xj6ns8iwTgfa+WsDfz9EqEfOqK01T8UtfdFNfg6Uk19z5yi5hVKypgvfa4qNFpQOA0Lv7n8AKGkoZ0f9Z411zSUIJR57l/OWO5ur5PsRDd3dgNGCdm+ObT6kJ6R9rEmasQDINdYeoOTwQN6vDydqY+9awjfJ3dVi9+W6mc1HthCCjx5cyvZaofKeCG1I+AhU4PFzkAY/WNsII5etmVoLSGNkKj+U/Q75c2s6lpx6oqhDD1pkyJRWsee3H1uLOqbrdsXeYvg32cJ9r5/C6TraybGXF9Pk52gRpnBqPw/8ggKxJY4IrscjwGk61uPcTtw/OIBQe4kpvc1oQWaP6DlWvYZR2OIh+qsD3dNdl7T4VWU5ZSLu1T9woAL/v62h7EOchp+k8ZP/D0NGXZI2kKCwYc9l1Su4m/IlbxZ/Ai2b87vFt9qFrEfnfrgDx1ZN3WxRfXV2zIYSpypZDPYPmUod7T29Yx0j90SLz3/uges/5GPnPWjQsceM6OKiEs34YuQ+fwAtaYOXjB60Sh+rTzc2tDQGgDQDNqsptz64Awiwz0/dnw/e1yIVZ0/k4hdJ0yMfWvjgVAUppPhsuat+UbxsPmVXYbOoFI97dasHeQtQmBPYAMmrf2WgI5i5a0ffDz/rEtJO5kEgcpYvu/h2csXUZXhLUS0uDvqJpDAFtmnVRsDIZCSz47vPccF+wIKkk5XTudxRG/85+5DCoiMPnPMSfNg1f8isPkHLCf3dYvWB1pGojVTTkEDXTXlYuaaI/qRlGBxGGc/Jf01P5kDxnyztWOjmutn3/mm/DTQsWFbz5xil3KMean6QCH1r999FK6yqmZ78WR1jS3zXuFb8VrizFqCOFH2d9UOjUuEUa7vB7NXjUX3bqf49wPgfRLuvRaENexWD0mRlu4+abTXK45zwHrQGGCwtPVxZjkaNURuvoyVcCfPSu2D1OoNk+xnpio6Avyo1K4ZNlgS/p7Z9F6ddQlFPfbQDytmgUWsBGu3h+F6N+X2wXLeaO3MD+KMw1dq7Ioudfs9j9y7OAy/AGd8sTCVOn8Udm3XuHcbRghNOdS1/whlekuEZ6nxJ31fW38XJ9bV5S6VanqLq1MG5iNKuHQIrBoKrBeweQbn19JIig5Xa3pock6wB9D5OJ5PKykL/T3AuxFTnRX/4Kc64YPpjpqy7n+DEZzp2tvfghDVXrhH8ge+OFMzn6jjPNS6g5CTdzN8RrGhppU6RhMlYowen35rFM7+fcLE1HsCNB59xK7yLE5kUlRYenNLh9Ewt4kfyHNpyP4HTNwmLcmPP8LrWoYTPnWxLNNiltSiyceuipTjl1ESM4DzxBBMGgPdx2oAbX2YZTk5V1ShVlErOiXLNuzjlXks5kjE/fYaTMo27xS7JJU66s8eq+SdgyXO07fvh/vfBusKAnPyS4tfYqxTebw9Eo6fFOCHDW7BND0bUuX9QY1Q869arGS04WYAJeRRXYOH3i8LxbbBcuMmqEW+DJeXfeeYn+ASsCqk/vy/tvwtWL+R3SJv/2Mnqve82OwJ9gKWQZjzZqohXqe59onI1NqI6rqtdXHKmmvIPN6AMFoGi7Z4bwI2ZWw8xMwExqpzaiEw2nGBH3gSYjl877ex9AlOUEcr35DTvwjwXDtLC87QJZ+Jao6cc1BazlvD5sGS+TqoCRJxfN6xA+3dG0ih9F6fDPlEsIU1Hfo09lr77OhzsndqD83AQfj8uHyp1MqNWgFrBKafRUX1ccTGYR6yU5SQ3XU2tAIX4GW+pCyfVf3w+kv0CrMorCXobrDlXnFoC/oDbPzp3Noj6Cc51D3hKR3gi42L2rvuRNINgYQJqhI9cbHxVCD4FOy98ozFW6vE/welcX/t+Cvl9nBzaRLibedG1RhRpHbjUzDi6ByfnLk1Ts0+VKS9pFY97ulWjw5zKuia7jydNTGQGua9qbnRtyuDuFpx7z3XSziNCdQ7OlBK9ufH/zDqqO8B59t1XztwoU6sXNdfbOJEzx5COCF/kQiRqpJXJYFKJpNTH56QVlQ9XC8z7uPRRM4PVJGrolbhoZSMb8RbbJBf5iOfOho3I87OjJvQ1JEgRMjsOlfPxMHbjcSaOh6qjsr6PL7UpQ9ISmggZR9jEeE7y70n3yuvnvCmJq7TF5e8rSLJhqReVPVxNavS+Z/i2lmel19o2NXWin8BEpi16Zg9MNZOzHoe4ARZOVkt16EGiuOUdQxwA6wZH+sNFlb2qJO9jU9xhddQixDhsrPyfDKZURUiQkLJw3OKlKESG15TWIgCzKuoxqHdsLfM7QhmyebdG9+On31+s5++DJe2gdIzvyLlYMcYrzSJTQYQ9K+SYsKWHagm2RwtOWTMQkqffXm1UtGhvmBJDOir7QvkxDuT/9O0Ra1VW4gEWJh95+ej59hwC0lQvkYJuFMAt4uRmSEskRfGxOXDt02/PHfPCRhy/PTsGLS18wKRM5tmP5C2UZDq7RocAzwb31PPu/TISWefPKbxGMkmmzaFNeYlfQRHi8Rzws5C8VsmLUnvAe8pmEtdEsOPPa7GsRZ3i8JbgF509Y5sAS5YyXa8h09MPdiE+Oa7WAtY5mKmPu6akfJ/FSTPh1EqPGdjjmkN8pRQOn+AcvF0hHeE0cPLymzxkJ7HmKib99juw/Rynq//i6M6KE1SmrE2ejJvNvCOI3vNaNM/ncc8c8RAb1KWPf0gRLS39HYA16oz/oEB9b82UW6UwANoRp+x1IZhGWv7Y5LnFTk9tdeso3N2rFPMpWLkGYp9I9d3Zp6sSzVrw9nRUpAFzy3RNeXuQCo+v6uLbm6VkF1rDe3AiCpnxrOiyEXHMU2rwMa6cGcXcu2D3XUZltHISnNxCWiVOlFDEqqul4AOcN71p2jMDTvuadXqfDWffJTRvwWmxkZs9m1Sl0uEYpW3ds9vsv16Dnc2RUUwAJzs1NeaGtWxrjzXVSwTvRR9Hjzaiw2W1FejBPXtpGeMFWKRLVAd9SgAI9mhJz22SUD1idSQAABuHqjCPyT88jcoqhSskmqGAYUv4Z5eMe2/xKabm3Keu0p4xomnEl7PHqdpF7U0k1yPFSRNeou9C1D+mtWTVwBlkwvXnaVnyGW+rre1PGGZpWeHY5y77kxfqKbkeM0ZNwAE5FZKL5U1gEf2e2I+uAJ4gbmGmClhV+yKo/hwseXY8n0Mem/RoJfJG2xzubtnc2yysjWPxqJnK67pra3HTpvPHrx6wyACF+8RJz38cToKUbJVyyKtnhgI4DW+KlGApzn0bnQrT1MGDPS2bZsAJt+cPQ+iDk3VFpilyTa6eSxrI/kgw/PDduSBTYm1a7ridLeuQwIlQdf+g4WQcqbLSOg8ZChBd9lzSuDiDmjMi8I9WTSd1kkXlq8D1Oc4gYcF4pJiiLJp7jb2dDLPyih0/BKvjwt+ysZ8LwJsStKVJ5IkLtr6kQD8Hu/E+NS//ITtcq0Y0u8n0nVBLvY+TVj++DjXxUdwRtxq9OCwxUqHVkVgr5ybxRE/aUUMSJz52zZeOoIBVD87lZFjNaNA/winjTGkp/AMnBTV2vrUNnNw/37VAinW/jkkf/cWEI5FuQyOAZqm98uh/cTxoR9Kn6xrBqu/DeXIaoGScTnCVpwunxMCDfpGKRGZJg0+tBpYDvi0T6AB7hpg9CyAB7K1GWzGn5OvX0+L4Va6xKP6Um/3F36bk+IM7A9oymwCcYuQWy14UnJdFUauLnHlztOSlwOlU6sB5PtxURIVuViumH5g/Cs93gN2Xwk/OfLwbgYmUJilo9vEWX2w0n+N0OPyzn+lvbjKXWhnFkIFRnbTDRynyE4W7S1cQSJIbpVq6IfIdPSw9gLlZlp35RheF9lYtzRd2UFrSKOAkP2NoStzwCU7kXhEt06hqMKSy50g3DlewDlwyUOzL4vZ3bEYC52JHxhlH4J+d7XUcfU2VFWo8Jt5joMgoTE+ZzswLeVBKlFdcu9szxujBSeYj3MMcp59ZWjqbhyME0rIno1SRE5bhnz++x5csxNtg8a12T5tfOeLpjKOyGHrJshKzDGByJFOWt8BE7KQIktJYny1gqcXQnD9vSpxZhPbDidnx8O2Z+PKPS2AXU4WWaoRzamIx4M/DUrFakY+yDnfZtAUnBWJFVjbctZePGaUwX5fd2V7PeZqcg8eUn2d8aRa/jZMtoZ62DnCylUHytPQ8qVRb8qLKoZBo6ZVpXJy7Cc/PE5GVRu1+Dtjn1TIxAZz4azcvZJqGrvVS/nvb0es5TZMdwGkImiXnQcAb2zV5u3nnhUc7GrrAyeVFX/l3R2oWtfcOj3vsVbT8EKcNJCFcVs6/O7dapZaFKHOllg1O4GTL+RYiodeRfrADL7FnngNgj5GaKvf0AFrbNcOvh1ykZ/LI5jXszIi047hJuFDLlHWEZHqx7+MUmwhH0xR0C8J/rRlRVqtHS/UROBHdIX5PtyHXGFG7nHhFfE4NIBc+Om4RL+fDS5IzRWpKwc6ZukR88X2wCJuoAbwewSKNjFFSigxSSrwIpj8Hy8E3ZnApSfTALa7cgDVwUXW1rBcDJx3PWZkP5crmnqWPv7hrgW/V0cQxudbxwamHk83E/5ZMeRfnvGuEPWZULkUarOm69k2rdUqLG9MD0eFuoTmzm1hgntyMTupmlUbMWRnl+FqLud/XcHYR0ymoRUKUEhsjh0xnUwkfOCm5xq3K82CckJmf2tbOTZUlPYkIwFJkbFjq60lErqvSuV2DRA3WdahxrwLmu6VDd23AmNJVh0M7HY9JL7wlQ+KGACKtkgS8NntilY8/SElqo6NKArBc2rDnm0pikKIq1GJ84q8a2+dgLe7kPXFP4aR2L5WeKLbAlY+Ojihwhpp88WN/h5MLDVr7+FzTny2dW7PrJrOaOU7dvGklnBzyfDWpPse5qUqXDhaFm1KGq1J6inuivGW2BDjPRiinWWofCIC5H1Vx97E2fsmWOU071xiqMbP5R+I8L+mZt8OSeYyq2KsF53LySKTfnbLWxRLuiYFXdJpwIsUMJKLZd49AMKpSsp+IEWK0zJIZqUIni4qZqh4312KPoqvnVlXPh6cOiMDQZRQic8yx5JRkoBa58fFIO1rLAAqjFEfO7XYS9wm0C/beSxMwDgeKvLHFf/plFBUmM0semdwn68XtN3I6b2lh3zZOk7MXlOrBczBSxWqdphBu1LRkTyRhlbk8FdXcc7NTWMJJvsnXyvznOLdQDGP9AZyIuzctXM95HmoVSyoCOJaNoqYm/tKtBzJ6gMLXIz7K/BOBruW1fBQ4aa07Hv7hGPk+I53UmaRXgPUeXktHxogWQa3DEfJDORhJT/TM+Xq37yd5wmn6jlDvsJBPib7szRMnBRkqX37gV9w9hIFnItQ7Qdk3eTT5B2HBWaXPTxKF6S2fn4QXEu5ZKeIjoJM7mT36BQCqvKOWjT1OjsROi1pKgg9G3SJrAYq8iTtE/Tjhl1yRRnRMF5x1kfTfspFH3768xsC66ETdW2RWAJOtQEtd0zYTcjWUCuRzsMDVUSsDTiahO591/gQnYrzRM6AFnK6C8DkByZJe7aNP6uclYuTvgpRrTg2GeJrbUIJl06hUeiYX1dgtD57qSvNQxD27oQ6/VWs1Mcq7l0VbcBpRkMs6z5w2dWCt6O2dwzNj9IAN7jYyxM9vgCMknV6rP8vmYkoLt+HZF9W8V8rDEyv43yuFJmcEjJR0VB+Bk8MOI9VVC6Fj0hpObrj0NG+B81Cfb+c44QaLtYgz29YvgTOYLEc2sBNI/lZNjHopp+asRU/vKJIRjTB9CknJEkaKeCuB5eTGaonz9SYInitbb0Peg/9WqQQJgPgYMjpKe8B5NsUlNEOJ/1ZpmZWnyWpJx4TJsTsbIe3qeOg27XtkteT2SWba1McDWAR6WzMKawoZIb4qPSc79+h5i3myS5ExrMi2RmJzSbDCYwycQQ1u1R6ch6mI5yitNuXM2ir3MFpQnovUXzMlMCbO2DUnD5fM6bcOYgDgpIarr/yjy9LS2h1gyjk9bLuAqVQ43ClIckKUkpDN2ZmegOlcsG8T5kieHBKFJb3EX8xa3q2i1gHWmSiTZXGvJxO6bpGpWrrsp2ncFWBX3MrjqfekrnNpOfzGKWodlXHg5BqYz7Rxy52B2qo1yw+i0VIZP9SmQ2bHFvPTTRUShpSmNTi24LFbTFRcY7mTS1eebio7J1qLTMg2FHP1gCVpn4g8ZXgEy6S15KTc5NDDtYBVWTfN8g8ne89G18IoF23ZdwBY3FmEnmkTf8uao1aQ4FjSF0//hzh94LoaV2yfvcD2qLGYILvf207LxAHAIhVf5pIGpxRqL9GtLiY85ELYLTh1nJN+eR1RW7dfv8JSbTpMZO+4pBnINYqNHFIfcKnRW0DCAyG3TwM+5eyFlbIRIXlJi6iKTxJWiaXr1sApX8pdb1f0WISbLWEUcCLKX55/8ztrKsV6h7OEHYVngDwTDi595KqzSlUUxKjLe86SejeycpgRL1Hmt6dfkIxRgqnjBS1cTXzy3BGpjbVq2+AeFF9vodIGTrgJD8s/+wc4kcOYtExlAudZy3c+9QacXL4qMStwaWC2CBMAJ4et50zrolzzcVm1KVeXm/K+Aadc96Lpfg7ukfFwVaHWqR9jNT0mIfcL4KZVJ+CEsypttiBYPOu0VJ2A81DlQrKJAuBcoiUhupvrfSVbwb/B/4dxhpFnOG0yKHeQi2t3zD3m90XRd3Hua8F/I1/LvrshpivyEDsVzGx82wB/Hycn122nxp4T40U6FR/BpYZv27Xv4zwsK/2QdZCk/ZS0sSciMfLHf1vOeResXtSzHCO9pPjbxakCilCR4de8BSfydOEG79OhIuY9RY4avFOZ4/tZ5/fBAiaVcme61IKgv0ZLhx/Myb49WnA69XI8X8IYbJOWSGqQx96roR047ZrkS00xxnAvWie4M2355nYJ+eLOwzef68XJ/7b3RCRq/n0o+j5ORBvGmdmV4lTbNWpHWlD/viD2Pk5HuODpmBtwcm501Kgdye74PanruzjPNX7pDj1u2znS47Fq23a2whM1t/fBihwEeGno5IMNrVroJD7vOKEFJw50iz3gFJVRWwpeHHP8XnXufZy+Nk7Mn+gVCNb/HVPhW4cqknTq3wXr17ib2/kq2wcfH0FeJJ2b93HSEQ8yyz+4eoBFFFwiIcUDmNH0/P0i2zaC49yF7uJkFtvfzlbraMF5fNhN8Jji/OLxeB9n3OtwHZc0rjFJIPWTOSUVYa1KhtTx+Pd8Su+DXaSXtgefr2ajSJMct07JaMG5yfEXDx/f9qmxzwIlsp3dkozEddbG33qITZD/Vcs68+zwpktKOjpOMvbDxHcwnR0FiBjXpBQkNWYfDSnHh0szT0OC2sCrB+yWe8j5McFz6jcUS2WkDUKeMFrA2hnChZ70op4pu5Tdw+AjC5WmGxCDM0qSB9FI70qlMlh90Tl7Pv68JqcxNEcZtcFR+Hn++qMjdQoyk63jqWYzuSo0SjuM3F8295ZUFDg1qIeZB3ok4q7t2AcF2xJ+5PdxOlUGRB5wfs1Yve/mcWcSQvx3ca5rKIXu/whOoTJVzytal8Aix0PKPKd7jc4VNglZ6PcbQu/jVPI77tR9TjIP1Oi7OT8oLfV7wDwIMRFmPuBEglYynkgbKe/ZglN+TblYP0qkDEupq9uCkiPSR+fDaequcfge8pMke0Hv4yTLzYq8JsqGc9SIu+EgOErhLThvvcWVUSkAp5CgsITzUEzGms4zWBub4zmumxQyKNE++Dmcm9KGhC72RXoKjt2cFCfsdbH/zaRgN+HkOAvpGdKPT33BUnEU50m5Q9stOBHMLpE88azjjH2m7pbEM8hDR9KHh0fP8cxTc0lrh+yOhk3oxf25sR8eve4otpQHopiEuPt9nBsR0b1iluI0LQ2zz4P3edR2D078sMW6ZXo/1emsKzg3Re736MGJ3FU1MpAmtU0wgCThaksxPAxJHGduHjy82YtI6P1HBLcb30sxvY9TTFUeSraTUtY1qrS959QeI2+XDRh5X09EVAB7bzGUXtLmPNZpyTntcqSc6yFWvntYNfWYIIVCi0Oi1A2+vT4yy38CVm9dnmi5qIfMFHpGXm+YMV452fs48ex7uopBrjw7dk5atmUZZtWUd/HfzgaE38d5yJMWjzpHBKtepMHfQkb4lo/vF/JYyusmKPHkj5dSeTMNqvLsFpTLB6tzJ8e5h9Z8kyF7WKfpNJUZxkPAvBCw1CZycD+PxW4pMTrpRmGV03EsZ0vYi3xu5xcjcgvOuxQ/8lITBUlrCuZ4nGeYtJSa4roVfsbDeS6yypSUbiIQ2Ld0lIATvvjMSEG61ZROENUbY6cekIZkhonss/0sp0r34uiLpPZzsKTXfbJM9VQeLsRlzwbniSgEKR1lXvYfKDkgnbOwjnks4tzDYEEfUuRyKn/WCE/0Gd7HaTcXZN5D/qA0QkLchMXvfZwsp1NKO0+Rp9UUTM8ke6NIx3nOawpwyg9N5Pqj5zSGsOvZAlYQh3IBoL8YbmQZ1o5RLOI0HNh8uqQImkrs0pM1RoFHGy04nYv+ltebBk5bSq0a0bNZaO44z3VN0h76a89G/gBYvoJ1VgtYBPa4TU+eyaW2byFkcxNvwgl7H2EPl7RsocSplWAtl3RdiEpgmR/Os1wUFdvrnLU7LqlcvH/DH4r25aLovCXZXa0FpyDexB3Kv3u53jhsme2eiEQuJZnT0zu694ErOOeAl4iO/ixxIgj3oU84z2uC7u3znNwFGy1GdF9jcwtf9+PcLVyLRIV6ajAnHNIxO0KwuKJ72RmPFr9ceBox883098HqsplTYDNbJvOFVQ6VefY+LbHevo79khJIqyTk1Cmd5+Hu6OkJn/QaeFEwI/MxESWXSElBBneKhTxpMVN6LZiSmQ+L4n7WOOeGk3tkdMwyE+Y+hvN6XlX2BbglHYnBGWOda4wWsGdO6n3k5SekeL5LOCftX8d2JXFyLP4eRnuyUnLTJY0KWHhpvP7R4afsomKpxw/9JopglcZ0YAIQUE5tMal27X1givL0GcZ2l8Z0yNXvEbPFpNplwUwuN/0Ck1oizBvGxRMz7cGJ+Pnk7QYRO6XFWgr4UcG6JSU5F+xo3LR+Gc5Nfp7KaaoLk5kW+3SuzRXtlU/g4qPrlBJONnBmTxR1OMdO13Rzt6ZGX7iCWBmCGKQO0NFzRc8VFF06qSMV+5KreRvmIAvT1I476tc9If0w6ChctbHSca7NgY3Zg1M41HzWc2FP4EelUn3mlNKwlhYzwSLVG7Fyh7/JYaClB0UG21eF/XOcpDAdmufOH+CEY6JmRsfDj2tyBTzyWsQe8hpLfxunkZ6lJyOJC35HSQl5UpzkBveSwec8/Jg9OI1Mo/LMgu1ckS4xDVLGFFa/pyARl8OIPKwJCDJrrzlRm6QT6ejkzEGNDqGKxmM94gOwJLHU2dF5AFihU7YfZkt4k2vFE9V7S7OhN0qwuPs7Hibg6lafpW3+9R6cZDuxh71VpOj71MKosWSf05E7z3kNJsUPUxskNC1VIqkmYKIt4R5w4vEL6Soe01FOhNaKURuPf0bHth3B6haqKcgfuKRjhZyOBQfiPCfYcE1daf2SUtsRL9U7cK5rwJz6Q1jKRLVUh+KylrzEUD+HuXRTeiVP7Ms4JdpazcC58bNEtT9uPhw/7FgFJcoDkKT1e3ZLOBvftex+UvFn9NxQrgrl+4vkpjxe0rBGkD/JbtgxujHlWnv90ljPD1XvpmSpOzqcjD/WUtUD2E0pMst8E3GuURrdGOQ2cet590JiXM0Ft4kT7qCUOXG1Ze8eMypX4HGOZx8KsLGnFrtk7rZ7nv9mvWysRKDlQ5Qq1lIlB0o8Jy5NrAwnieRK7FnjrmlKSwMfOPGKADRrj1HDI9xqhTJathYqDeIMKm/u/cShA7D4XUpkBYjIDTZlt4R5esE/vdaQHoyp3kyitRKk7BizJdDXS87aunMjZQgyitV83B3WjbwFpw2cV/qebH5Fv+/3RoIEci33VJHeybrlGTKclLYvffUjDLtHS7psF36On3Qg5ubiPbUC+RFl36UlvbNbQGpmpO2EyT5Oqc8YEWf2JHa3utlEvpSh3EU5juEzZMVYPR/9bD1n5IfJ8lHNdyo+uHZsBBMmUkR4udUPM5AsTuk5zXOR/lLkwXCWcXJZU17yzZ/j3Df//WvFoR8sckLkoD3xyLmAA8/lVXTeKVhytJUa4fvIeIkjfQ6Wa0t3cvdnwNpgK71l9HX6xTlxlTxpMitq8QzjZunp2BAlTladPbJiCXFurRVLWLAkEVnPeXKPE5n7zM+zKBvE5cI9Wng1iJO58vYHT39zDpciJzyl+aL7/xRnXIPd0HhsNxHsl9DK27YfFooDEd4Cdh1uyq0fwJZjqNCY87Q0mgFWBwvgP+ROtr74uN8/WTvq0QT2UJdpPXjVdefOpZoJZ5Jb1kiAMwB0eLYgDgO1rRqZHn6slmBqjeseUrPHCegd5E2ozUDGNHiNljkTgMUvTR2+pO+AKFpm1A412BobHVwwxMn0fqbaR8RpXhIMJYGBNc3DLHJlwqCmVajNWYO5vHaeZ/TItcjiQp6H+6O07b67eLUho1ikCZSWS8qFvDluWtcUp1mtfe+3pGWL41+kzPy/h0X/FmO8dkHeD/edQuuzByOnmvd6nHpnEclnLeJz4eq9dIT7a12U/RH96ZaSPKE2os9Zmp7NF4BdnDAaWSGK/c2vIvLbYR9Sni+i+s9x4srzPo30Nf1WTS+8Jpio3XSeh4tsqXwDcVLptvTqEdNGC/0X4qZrDPtF3p8HewQLB7ZqwcmOGS253mLX8dyeJP/4URNEgYGWvWZLbrLYcJwUksj8qOuh4FSpi+uIFGw3ffyzblrK7NG7k7Cs1hW3e7u5Y1pv3QSa6ufZkjr+heIlRWBOnoiO1vja11qhMyVSBE4831pOyknP6S2sBsDJjtOYWUZC2rWjtRKfKLJd7Qn2NgU5kT6P9DyPiZW4koeyItGzOQic5JGz/cgSwdqf6iilzVtg93dLQWIpLik+vqZuFJeUigiVxySLrdGWybLFlbwJF5LtOH3ymOY6+BCrxeIrZTs0F5AkTvcoZaLj2O7hcSfOOPckVG6cyLhW6t7iw5MOoWNkZxlZiBE9ZdVn4IS9rpBW3XQOIrNltw04t555Zuo+vaQmBZD0nz17rYsLeAhv/DlrwvVkz7FyQycsk7awaBJsyGYimj2kWLdkYQUmybCsQ+FU1rkm3IbI46YowAqFIipg17llZVqs6Llo683ykCTuZl4JJ4vWu2WqEDht24wnnDSjpYGdwfb9i9H0c5x0O8jtnh8Us6Yo1UzYGm/qPSw28vDyd+7qgyaxNKU5yb0wtcXkO6Vl3NYjSz7HmKJGaDK4s32PvLeARYRL9b3spga8YZEjZNzKsb56DtWX3rItKU7Or5baI2NMPPuW+ccV17g3Rk88th0G6aBrH5+Js7QMFwLsuimp1xOlAcAe8lqMgvO3oxY9fVKAVS6MnzSSihFTKtKcwHkrm0f03IDDbfCUzYC0gz4reqccp58bGeT35tTexcnN9TEfXj4+XS3oM+Q5tvX7oO89nDIumruZiqMQp62KKicd9JrkVB0tODdXBCJtOeGbeyUsnQhI90oN/tswySPK8lJ2nHNS96z03H0yKh09OOEh/TdXZXZHubhRIdyZ905GOmr2Jlj28YxiQGlfdCI/r2gd8i1RZyHJ7t/GydBk+8PHXwiBT8mG4iNtGXu04FSkG+Oh1ThllLiL+OZh8bKmw9s4byKwdBiCOPEvlHySKo1awvb8Jk6q3pGuJ1u9J075P7M0J6+sNwZNNeK40oFkdwJrN1NQfYzbneZGpuSV9eags4BMqORO0OlXhqbG+O4KBzkWVB+QlUiNQXdm41hcgtOxAA0JhGoPSwMA
````````````

## Artifact SHA-256 04421cc341f5402f280a2d4ae122959e785856a357870ab2b2967d4db843f3eb

Encoding: `utf-8`. Original bytes: 2544.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "1f1ec3a3d2273c7ef21e57f348a5aae89081ec54bfbf530a2cb7d7a5d23c2628",
  "exit_code": 0,
  "assertions": 286,
  "elapsed_seconds": 332.881784333,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27283718144,
    "swapins": 44222356,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   480421.\nPages active:                                 819900.\nPages inactive:                               701393.\nPages speculative:                            117294.\nPages throttled:                                   0.\nPages wired down:                             281949.\nPages purgeable:                                6609.\n\"Translation faults\":                    17047537879.\nPages copy-on-write:                       889802098.\nPages zero filled:                       22960554531.\nPages reactivated:                        3754776271.\nPages purged:                               80296562.\nFile-backed pages:                           1178236.\nAnonymous pages:                              460351.\nPages stored in compressor:                  1476573.\nPages occupied by compressor:                 682263.\nDecompressions:                           1286926435.\nCompressions:                             1611877961.\nPageins:                                  8090027894.\nPageouts:                                   11400550.\nSwapins:                                    44222356.\nSwapouts:                                   77578301.\nPages tagged:                                 169965.\nPages tagged resident:                        115985.\nPages tagged compressed:                       53980.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7064.\nPages tag-storage free:                         2599.\nPages tag-storage non-tag pageable:            88633.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8981184.\nTagged compressions:                        12581873.\nTagged decompressions:                      11612151.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41",
  "execution_receipt_sha256": "4501aa00573a537b931bd3c565547b0a0699870d6c94e4dad0a0faa2b0cad935"
}

````````````

## Artifact SHA-256 4501aa00573a537b931bd3c565547b0a0699870d6c94e4dad0a0faa2b0cad935

Encoding: `utf-8`. Original bytes: 2446.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "1f1ec3a3d2273c7ef21e57f348a5aae89081ec54bfbf530a2cb7d7a5d23c2628",
  "exit_code": 0,
  "assertions": 286,
  "elapsed_seconds": 332.881784333,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27283718144,
    "swapins": 44222356,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   480421.\nPages active:                                 819900.\nPages inactive:                               701393.\nPages speculative:                            117294.\nPages throttled:                                   0.\nPages wired down:                             281949.\nPages purgeable:                                6609.\n\"Translation faults\":                    17047537879.\nPages copy-on-write:                       889802098.\nPages zero filled:                       22960554531.\nPages reactivated:                        3754776271.\nPages purged:                               80296562.\nFile-backed pages:                           1178236.\nAnonymous pages:                              460351.\nPages stored in compressor:                  1476573.\nPages occupied by compressor:                 682263.\nDecompressions:                           1286926435.\nCompressions:                             1611877961.\nPageins:                                  8090027894.\nPageouts:                                   11400550.\nSwapins:                                    44222356.\nSwapouts:                                   77578301.\nPages tagged:                                 169965.\nPages tagged resident:                        115985.\nPages tagged compressed:                       53980.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7064.\nPages tag-storage free:                         2599.\nPages tag-storage non-tag pageable:            88633.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8981184.\nTagged compressions:                        12581873.\nTagged decompressions:                      11612151.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41"
}

````````````

## Artifact SHA-256 afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41

Encoding: `utf-8`. Original bytes: 29460.

````````````text
{
  "items" : [
    {
      "name" : "false: embedding selection",
      "passed" : true
    },
    {
      "name" : "false: original MTP verification shape selected",
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
      "name" : "false\/cached17: cancelled prefill releases request pins",
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
      "name" : "false\/cached17: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/cached17: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/cached17: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/cached17: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/cached17: exact n-gram cache payload accounting",
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
      "name" : "false\/boundary255: cancelled prefill releases request pins",
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
      "name" : "false\/boundary255: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/boundary255: exact n-gram cache payload accounting",
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
      "name" : "false\/boundary256: cancelled prefill releases request pins",
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
      "name" : "false\/boundary256: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/boundary256: exact n-gram cache payload accounting",
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
      "name" : "false\/boundary257: cancelled prefill releases request pins",
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
      "name" : "false\/boundary257: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/boundary257: exact n-gram cache payload accounting",
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
      "name" : "false\/long1025: cancelled prefill releases request pins",
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
      "name" : "false\/long1025: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/long1025: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/long1025: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/long1025: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/long1025: exact n-gram cache payload accounting",
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
      "name" : "false\/image-before: cancelled prefill releases request pins",
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
      "name" : "false\/image-before: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/image-before: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/image-before: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/image-before: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/image-before: exact n-gram cache payload accounting",
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
      "name" : "false\/image-crossing: cancelled prefill releases request pins",
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
      "name" : "false\/image-crossing: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: exact n-gram cache payload accounting",
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
      "name" : "false\/sample\/false\/7: sampled requests return an idle pool",
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
      "name" : "false\/sample\/false\/7046029254386353130: sampled requests return an idle pool",
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
      "name" : "false\/sample\/true\/7: sampled requests return an idle pool",
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
      "name" : "false\/sample\/true\/7046029254386353130: sampled requests return an idle pool",
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
      "name" : "false\/same: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "false\/same: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false: complete checkpoint is exercised",
      "passed" : true
    },
    {
      "name" : "false: complete hit is observed",
      "passed" : true
    },
    {
      "name" : "false: complete hit eliminates prefill",
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
      "name" : "false\/auxiliary: cache reuse releases request pins",
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
      "name" : "false\/divergent: cache reuse releases request pins",
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
      "name" : "false\/same-after-auxiliary: cache reuse releases request pins",
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
      "name" : "false\/edited: cache reuse releases request pins",
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
      "name" : "false: partial fallback succeeds",
      "passed" : true
    },
    {
      "name" : "false: edited tail uses the shorter checkpoint",
      "passed" : true
    },
    {
      "name" : "false: partial fallback is not a complete hit",
      "passed" : true
    },
    {
      "name" : "false: combined retention respects physical-state count",
      "passed" : true
    },
    {
      "name" : "false: callback cancellation releases request pins",
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
      "name" : "false: retry returns an idle pool",
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
      "name" : "false: one-token request releases pins",
      "passed" : true
    },
    {
      "name" : "false: one-token request emits exactly one token",
      "passed" : true
    },
    {
      "name" : "false: immediate EOS succeeds without emitted output",
      "passed" : true
    },
    {
      "name" : "false: immediate EOS releases pins",
      "passed" : true
    },
    {
      "name" : "false: fused RoPE evaluated paths",
      "passed" : true
    },
    {
      "name" : "false: shared RoPE evaluated paths",
      "passed" : true
    },
    {
      "name" : "true: embedding selection",
      "passed" : true
    },
    {
      "name" : "true: original MTP verification shape selected",
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
      "name" : "true\/cached17: cancelled prefill releases request pins",
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
      "name" : "true\/cached17: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/cached17: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/cached17: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/cached17: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/cached17: exact n-gram cache payload accounting",
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
      "name" : "true\/boundary255: cancelled prefill releases request pins",
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
      "name" : "true\/boundary255: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/boundary255: exact n-gram cache payload accounting",
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
      "name" : "true\/boundary256: cancelled prefill releases request pins",
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
      "name" : "true\/boundary256: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/boundary256: exact n-gram cache payload accounting",
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
      "name" : "true\/boundary257: cancelled prefill releases request pins",
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
      "name" : "true\/boundary257: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/boundary257: exact n-gram cache payload accounting",
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
      "name" : "true\/long1025: cancelled prefill releases request pins",
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
      "name" : "true\/long1025: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/long1025: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/long1025: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/long1025: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/long1025: exact n-gram cache payload accounting",
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
      "name" : "true\/image-before: cancelled prefill releases request pins",
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
      "name" : "true\/image-before: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/image-before: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/image-before: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/image-before: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/image-before: exact n-gram cache payload accounting",
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
      "name" : "true\/image-crossing: cancelled prefill releases request pins",
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
      "name" : "true\/image-crossing: completed request releases pins",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: full completion succeeds",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: selected n-gram cache format",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: n-gram cache contains real rows",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: exact n-gram cache payload accounting",
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
      "name" : "true\/sample\/false\/7: sampled requests return an idle pool",
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
      "name" : "true\/sample\/false\/7046029254386353130: sampled requests return an idle pool",
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
      "name" : "true\/sample\/true\/7: sampled requests return an idle pool",
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
      "name" : "true\/sample\/true\/7046029254386353130: sampled requests return an idle pool",
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
      "name" : "true\/same: cache reuse releases request pins",
      "passed" : true
    },
    {
      "name" : "true\/same: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true: complete checkpoint is exercised",
      "passed" : true
    },
    {
      "name" : "true: complete hit is observed",
      "passed" : true
    },
    {
      "name" : "true: complete hit eliminates prefill",
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
      "name" : "true\/auxiliary: cache reuse releases request pins",
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
      "name" : "true\/divergent: cache reuse releases request pins",
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
      "name" : "true\/same-after-auxiliary: cache reuse releases request pins",
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
      "name" : "true\/edited: cache reuse releases request pins",
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
      "name" : "true: partial fallback succeeds",
      "passed" : true
    },
    {
      "name" : "true: edited tail uses the shorter checkpoint",
      "passed" : true
    },
    {
      "name" : "true: partial fallback is not a complete hit",
      "passed" : true
    },
    {
      "name" : "true: combined retention respects physical-state count",
      "passed" : true
    },
    {
      "name" : "partial fallback output matches independent reference",
      "passed" : true
    },
    {
      "name" : "true: callback cancellation releases request pins",
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
      "name" : "true: retry returns an idle pool",
      "passed" : true
    },
    {
      "name" : "true: retry after cancellation is exact",
      "passed" : true
    },
    {
      "name" : "true: prefix capacity stays bounded",
      "passed" : true
    },
    {
      "name" : "true: one-token request releases pins",
      "passed" : true
    },
    {
      "name" : "true: one-token request emits exactly one token",
      "passed" : true
    },
    {
      "name" : "true: immediate EOS succeeds without emitted output",
      "passed" : true
    },
    {
      "name" : "true: immediate EOS releases pins",
      "passed" : true
    },
    {
      "name" : "true: fused RoPE evaluated paths",
      "passed" : true
    },
    {
      "name" : "true: shared RoPE evaluated paths",
      "passed" : true
    }
  ],
  "measurements" : {
    "false.fused_rotations_scheduled" : 0,
    "true.fused_rotations_scheduled" : 5400
  },
  "name" : "optimization-integrated",
  "passed" : true
}

````````````

## Artifact SHA-256 564efd383d3a80f0ab44329ff9c5975810ce3b2d427b75e00ac7be524afe05b7

Encoding: `utf-8`. Original bytes: 23118.

````````````text
{
  "started_at": "2026-09-08T13:32:53.373062+00:00",
  "deadline_utc": "2026-09-08T14:35:00Z",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "read-failure-serving",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "c676838c165ca4a9de74fc763bc03282628db4e58ab5f90e211c276d5ffe9729",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "91a2f69fa21063719c9eed2cb91708bad92fbd0e306a61d50be662774db21767",
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
      "source_archive_sha256": "31f5718f308621dbbac08fe2994e9deb8691de28a1e61fd551857a00c5af5be2",
      "binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 23477338112,
    "swapins": 44222391,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   198371.\nPages active:                                 991381.\nPages inactive:                               864608.\nPages speculative:                            127008.\nPages throttled:                                   0.\nPages wired down:                             286306.\nPages purgeable:                                8740.\n\"Translation faults\":                    17049517787.\nPages copy-on-write:                       889923456.\nPages zero filled:                       22961893150.\nPages reactivated:                        3754777121.\nPages purged:                               80298230.\nFile-backed pages:                           1225832.\nAnonymous pages:                              757165.\nPages stored in compressor:                  1339131.\nPages occupied by compressor:                 617468.\nDecompressions:                           1287011257.\nCompressions:                             1611877961.\nPageins:                                  8090048530.\nPageouts:                                   11400550.\nSwapins:                                    44222391.\nSwapouts:                                   77578301.\nPages tagged:                                 222473.\nPages tagged resident:                        190976.\nPages tagged compressed:                       31497.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                10814.\nPages tag-storage free:                          360.\nPages tag-storage non-tag pageable:            87122.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4826624.\nTagged compressions:                        12581873.\nTagged decompressions:                      11629285.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-08T13:32:53.372926+00:00",
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
  "preparation_sha256": "079b89f11099c5ece665ec367111c0685ee4bb5ca69a919e034db99a8262a905",
  "classification": "Prospective V361 native commands on exact V360 after the V349 full-model MTP counterexample. Original complete cases and exact-output checks remain; both arms retain the original fixed verification shape and candidate compact BF16 rows remain selected. Complete assertion minima are raised to 286 ordinary and 327 MTP. Conservative 22.2 GB admission screen is added; original live policy and 900-second work plus 30-second cleanup allowance remain unchanged. No retries, benchmark or activation. Explicit V341 failure observer remains bound."
}

````````````

## Artifact SHA-256 e916092a21147c78dbc89c9f01c9a463a878340b0a50c525eb1ac9250fbb0320

Encoding: `gzip+base64`. Original bytes: 197883.

````````````text
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
````````````

## Artifact SHA-256 b38b1a6c8b54e0f8d1edf6a6ef3998224051fdfcaf1f65dc74ec883537cde4ba

Encoding: `gzip+base64`. Original bytes: 149062.

````````````text
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
````````````

## Artifact SHA-256 38bcea1e05f6d4bda9050a7daff986a98de5f216937fbc7f936e189ddb299518

Encoding: `utf-8`. Original bytes: 2544.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "564efd383d3a80f0ab44329ff9c5975810ce3b2d427b75e00ac7be524afe05b7",
  "exit_code": 0,
  "assertions": 522,
  "elapsed_seconds": 206.337724708,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 25317048320,
    "swapins": 44222391,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   421495.\nPages active:                                 918387.\nPages inactive:                               837926.\nPages speculative:                             78857.\nPages throttled:                                   0.\nPages wired down:                             271349.\nPages purgeable:                               16551.\n\"Translation faults\":                    17056667464.\nPages copy-on-write:                       890697692.\nPages zero filled:                       22965517762.\nPages reactivated:                        3754868634.\nPages purged:                               80325880.\nFile-backed pages:                           1107184.\nAnonymous pages:                              727986.\nPages stored in compressor:                  1228011.\nPages occupied by compressor:                 556276.\nDecompressions:                           1287099911.\nCompressions:                             1611894772.\nPageins:                                  8090112655.\nPageouts:                                   11400649.\nSwapins:                                    44222391.\nSwapouts:                                   77578301.\nPages tagged:                                 222625.\nPages tagged resident:                        194066.\nPages tagged compressed:                       28559.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                10813.\nPages tag-storage free:                         1410.\nPages tag-storage non-tag pageable:            86073.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4311296.\nTagged compressions:                        12581984.\nTagged decompressions:                      11632210.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
  "execution_receipt_sha256": "99a8e9c388fa2fe7d2fd9a6780cdf784abb7161045272226961b9f88444aa92e"
}

````````````

## Artifact SHA-256 99a8e9c388fa2fe7d2fd9a6780cdf784abb7161045272226961b9f88444aa92e

Encoding: `utf-8`. Original bytes: 2446.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "564efd383d3a80f0ab44329ff9c5975810ce3b2d427b75e00ac7be524afe05b7",
  "exit_code": 0,
  "assertions": 522,
  "elapsed_seconds": 206.337724708,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 25317048320,
    "swapins": 44222391,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   421495.\nPages active:                                 918387.\nPages inactive:                               837926.\nPages speculative:                             78857.\nPages throttled:                                   0.\nPages wired down:                             271349.\nPages purgeable:                               16551.\n\"Translation faults\":                    17056667464.\nPages copy-on-write:                       890697692.\nPages zero filled:                       22965517762.\nPages reactivated:                        3754868634.\nPages purged:                               80325880.\nFile-backed pages:                           1107184.\nAnonymous pages:                              727986.\nPages stored in compressor:                  1228011.\nPages occupied by compressor:                 556276.\nDecompressions:                           1287099911.\nCompressions:                             1611894772.\nPageins:                                  8090112655.\nPageouts:                                   11400649.\nSwapins:                                    44222391.\nSwapouts:                                   77578301.\nPages tagged:                                 222625.\nPages tagged resident:                        194066.\nPages tagged compressed:                       28559.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                10813.\nPages tag-storage free:                         1410.\nPages tag-storage non-tag pageable:            86073.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4311296.\nTagged compressions:                        12581984.\nTagged decompressions:                      11632210.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127"
}

````````````

## Artifact SHA-256 e4836406b1037cc8e75db6dd0c37940f44fe387423be5d44e1d0e78a606d2094

Encoding: `utf-8`. Original bytes: 1739.

````````````text
engine ready in 0.8s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
read failure generate JSON, queued=false, checkpointed=false
read failure generate NDJSON, queued=false, checkpointed=false
read failure chat JSON, queued=false, checkpointed=false
read failure chat NDJSON, queued=false, checkpointed=false
read failure OpenAI JSON, queued=false, checkpointed=false
read failure OpenAI SSE, queued=false, checkpointed=false
read failure Gateway SSE, queued=false, checkpointed=false
read failure generate JSON, queued=true, checkpointed=false
read failure generate NDJSON, queued=true, checkpointed=false
read failure chat JSON, queued=true, checkpointed=false
read failure chat NDJSON, queued=true, checkpointed=false
read failure OpenAI JSON, queued=true, checkpointed=false
read failure OpenAI SSE, queued=true, checkpointed=false
read failure Gateway SSE, queued=true, checkpointed=false
read failure generate JSON, queued=false, checkpointed=true
read failure generate NDJSON, queued=false, checkpointed=true
read failure chat JSON, queued=false, checkpointed=true
read failure chat NDJSON, queued=false, checkpointed=true
read failure OpenAI JSON, queued=false, checkpointed=true
read failure OpenAI SSE, queued=false, checkpointed=true
read failure Gateway SSE, queued=false, checkpointed=true
read failure generate JSON, queued=true, checkpointed=true
read failure generate NDJSON, queued=true, checkpointed=true
read failure chat JSON, queued=true, checkpointed=true
read failure chat NDJSON, queued=true, checkpointed=true
read failure OpenAI JSON, queued=true, checkpointed=true
read failure OpenAI SSE, queued=true, checkpointed=true
read failure Gateway SSE, queued=true, checkpointed=true

````````````

## Artifact SHA-256 05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127

Encoding: `gzip+base64`. Original bytes: 69148.

````````````text
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
````````````

## Artifact SHA-256 8a3591b84e8468e623c17b4bf0fbdf9281ef03a3c1847c5d0adf49e028125542

Encoding: `utf-8`. Original bytes: 386.

````````````text
{
  "at": "2026-09-08T13:24:50.141226+00:00",
  "stage": "combined-mtp",
  "owned_groups": [
    55048
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
  }
}

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 dc94821ed7850eece93c0833dac62f862b200849bbf12cf833d50655f6b6ba97

Encoding: `utf-8`. Original bytes: 519.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "864ebea2d08567a449e782e48f5d3af2d7ddf1b28f40a0041dc1842b7ff3f0b1",
  "exit_code": 0,
  "assertions": 327,
  "elapsed_seconds": 331.5784705,
  "proofs_unchanged": true,
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e",
  "execution_receipt_sha256": "1369526742bd85d2c5e3c987455433c2d7b75a145940300136e9628d08788bc1"
}

````````````

## Artifact SHA-256 bd8fd8d00f84600734577f8bbbfce0afe41d3a247d975b90ff1163479e1432b5

Encoding: `utf-8`. Original bytes: 388.

````````````text
{
  "at": "2026-09-08T13:32:53.092716+00:00",
  "stage": "combined-plain",
  "owned_groups": [
    62402
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
  }
}

````````````

## Artifact SHA-256 14bb43081951c091a372518861a575f7e244f918fc6fcacf13d086b6363823fb

Encoding: `utf-8`. Original bytes: 521.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "1f1ec3a3d2273c7ef21e57f348a5aae89081ec54bfbf530a2cb7d7a5d23c2628",
  "exit_code": 0,
  "assertions": 286,
  "elapsed_seconds": 332.881784333,
  "proofs_unchanged": true,
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41",
  "execution_receipt_sha256": "4501aa00573a537b931bd3c565547b0a0699870d6c94e4dad0a0faa2b0cad935"
}

````````````

## Artifact SHA-256 927810addf027c1c384683157b3fcbf4652f20c94858f612d567da3b0166682f

Encoding: `utf-8`. Original bytes: 4314.

````````````text
{
  "at": "2026-09-08T13:37:38.392057+00:00",
  "all_three_native_qualified": true,
  "total_assertions": 1135,
  "results": [
    {
      "name": "combined-plain",
      "assertions": 286,
      "elapsed_seconds": 332.881784333,
      "maximum_owned_rss_bytes": 4981735424,
      "minimum_reclaimable_bytes": 19481427968,
      "swapouts_delta": 0,
      "qualified": true,
      "stdout_sha256": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41",
      "qualification_sha256": "04421cc341f5402f280a2d4ae122959e785856a357870ab2b2967d4db843f3eb",
      "proofs_unchanged": true,
      "within_reservation": true,
      "cleanup_complete": true
    },
    {
      "name": "combined-mtp",
      "assertions": 327,
      "elapsed_seconds": 331.5784705,
      "maximum_owned_rss_bytes": 6538903552,
      "minimum_reclaimable_bytes": 19701334016,
      "swapouts_delta": 0,
      "qualified": true,
      "stdout_sha256": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e",
      "qualification_sha256": "4f8f9d98d88283fdf0f6c5f7ac1b47506fef84028f0264ef1b7af0822539bb08",
      "proofs_unchanged": true,
      "within_reservation": true,
      "cleanup_complete": true
    },
    {
      "name": "read-failure-serving",
      "assertions": 522,
      "elapsed_seconds": 206.337724708,
      "maximum_owned_rss_bytes": 3861184512,
      "minimum_reclaimable_bytes": 16878141440,
      "swapouts_delta": 0,
      "qualified": true,
      "stdout_sha256": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
      "qualification_sha256": "38bcea1e05f6d4bda9050a7daff986a98de5f216937fbc7f936e189ddb299518",
      "proofs_unchanged": true,
      "within_reservation": true,
      "cleanup_complete": true
    }
  ],
  "owned_groups": [
    55048,
    62402,
    73066
  ],
  "remaining_owned_members": [],
  "model_lock_free": true,
  "competing_jobs": [],
  "source_restored": true,
  "release_restored": true,
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
  "before_scope": {
    "page_bytes": 16384,
    "reclaimable_bytes": 25614630912,
    "swapins": 44222391,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   408007.\nPages active:                                 930124.\nPages inactive:                               860084.\nPages speculative:                             83632.\nPages throttled:                                   0.\nPages wired down:                             249567.\nPages purgeable:                               12862.\n\"Translation faults\":                    17058568281.\nPages copy-on-write:                       890843920.\nPages zero filled:                       22966586739.\nPages reactivated:                        3754869096.\nPages purged:                               80327674.\nFile-backed pages:                           1142524.\nAnonymous pages:                              731316.\nPages stored in compressor:                  1218537.\nPages occupied by compressor:                 553620.\nDecompressions:                           1287108530.\nCompressions:                             1611894772.\nPageins:                                  8090147400.\nPageouts:                                   11400649.\nSwapins:                                    44222391.\nSwapouts:                                   77578301.\nPages tagged:                                 222955.\nPages tagged resident:                        195456.\nPages tagged compressed:                       27499.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                10813.\nPages tag-storage free:                          605.\nPages tag-storage non-tag pageable:            86878.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    4102400.\nTagged compressions:                        12581984.\nTagged decompressions:                      11633249.\n"
  },
  "transition": "Original corrected-build native interval drained; enter separately granted V364 scope-native interval through16:45UTC."
}

````````````

## Artifact SHA-256 01d3c7b40512f599b05368014fbbc80d21384deb76e066bed8a1920b728fda3d

Encoding: `utf-8`. Original bytes: 662.

````````````text
test_actual_candidate_diff_is_bounded (__main__.NativeBinding) ... ok
test_actual_failed_original_mtp_rejected (__main__.NativeBinding) ... ok
test_complete_original_commands (__main__.NativeBinding) ... ok
test_exact_execution_body (__main__.NativeBinding) ... ok
test_old_shape_selection_cannot_qualify (__main__.NativeBinding) ... ok
test_original_live_policy_and_allowance (__main__.NativeBinding) ... ok
test_original_recovery_report_remains_complete (__main__.NativeBinding) ... ok
test_shortened_case_coverage_cannot_qualify (__main__.NativeBinding) ... ok

----------------------------------------------------------------------
Ran 8 tests in 0.152s

OK

````````````

## Artifact SHA-256 079b89f11099c5ece665ec367111c0685ee4bb5ca69a919e034db99a8262a905

Encoding: `utf-8`. Original bytes: 23641.

````````````text
{
  "prepared_at": "2026-09-08T13:18:15.346509+00:00",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "c676838c165ca4a9de74fc763bc03282628db4e58ab5f90e211c276d5ffe9729",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "91a2f69fa21063719c9eed2cb91708bad92fbd0e306a61d50be662774db21767",
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
      "source_archive_sha256": "31f5718f308621dbbac08fe2994e9deb8691de28a1e61fd551857a00c5af5be2",
      "binary_sha256": "7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "dependencies": {
    "/tmp/slotstream-optimization-execution/optional-current-serving-v330/run.py": "5793aa8bcb3af55fb99c9da698475ee54272ee791ccef30141c94ba6c405b95f",
    "/tmp/slotstream-optimization-execution/pressure-footprint-v341/guard_with_footprint.py": "72836a3c6bc03366b6f546c21d1f32636f01373d29a49e2ae2246e5090a0f215",
    "/tmp/slotstream-optimization-execution/pressure-footprint-v341/pressure_footprint.py": "2ff6061c46f588979da498ea67e93b8e6f887a845b6daab2e115da72a367f73e",
    "/tmp/slotstream-optimization-execution/compact-cache-fixed-mtp-build-v360/lease-result.json": "1f4e13960851ae33db7f7e7b23804be346aad10dfef6304162b4c4e5714a71af",
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
  "executor_sha256": "41d086c0e4d02ec8557caefe276ca68223159a0c779836d6712d5e5d95b1d919",
  "native_specs": {
    "combined-plain": [
      "integrated",
      "optimization-integrated",
      286
    ],
    "combined-mtp": [
      "integrated-mtp",
      "optimization-integrated-mtp",
      327
    ],
    "read-failure-serving": [
      "read-failure-serving",
      "optimization-read-failure-serving",
      522
    ]
  },
  "commands": {
    "combined-plain": [
      "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "integrated",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ],
    "combined-mtp": [
      "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "integrated-mtp",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ],
    "read-failure-serving": [
      "/Users/carlos/Projects/slotstream/.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream",
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
  "classification": "Prospective V361 native commands on exact V360 after the V349 full-model MTP counterexample. Original complete cases and exact-output checks remain; both arms retain the original fixed verification shape and candidate compact BF16 rows remain selected. Complete assertion minima are raised to 286 ordinary and 327 MTP. Conservative 22.2 GB admission screen is added; original live policy and 900-second work plus 30-second cleanup allowance remain unchanged. No retries, benchmark or activation. Explicit V341 failure observer remains bound."
}

````````````

## Artifact SHA-256 73d6ee60f21d15df4885d9942c77a250e096d4e0a9dce620e6c4669c3c1ef774

Encoding: `utf-8`. Original bytes: 521.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "564efd383d3a80f0ab44329ff9c5975810ce3b2d427b75e00ac7be524afe05b7",
  "exit_code": 0,
  "assertions": 522,
  "elapsed_seconds": 206.337724708,
  "proofs_unchanged": true,
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
  "execution_receipt_sha256": "99a8e9c388fa2fe7d2fd9a6780cdf784abb7161045272226961b9f88444aa92e"
}

````````````

## Artifact SHA-256 41d086c0e4d02ec8557caefe276ca68223159a0c779836d6712d5e5d95b1d919

Encoding: `utf-8`. Original bytes: 7131.

````````````text
from pathlib import Path
import argparse,datetime,fcntl,importlib.util,inspect,json,os,signal,sys,threading,time
ROOT=Path('/Users/carlos/Projects/slotstream');BASE=Path('/tmp/slotstream-optimization-execution');HERE=Path(__file__).resolve().parent
OUT=ROOT/'.build/optimization/compact-cache-fixed-mtp-native-v361'
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
NATIVE={'combined-plain':('integrated','optimization-integrated',286),'combined-mtp':('integrated-mtp','optimization-integrated-mtp',327),'read-failure-serving':('read-failure-serving','optimization-read-failure-serving',522)}
BINARY=ROOT/'.build/optimization/compact-cache-fixed-mtp-build-v360/candidate/slotstream'
MODEL='/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit'
SECONDS=900

def prepare():
 require(not (HERE/'preparation.json').exists() and not OUT.exists(),'already prepared/attempted')
 build=verified_build(BINARY)
 require(build['identity']['binary_sha256']=='7a132a2fc2270d8f3695e7d740abbebd22ac0d79b80562c7c47aa73a143e24ea','wrong combined build')
 lease=c.read(BASE/'compact-cache-fixed-mtp-build-v360/lease-result.json');require(lease['passed'] and lease['restored'],'build did not pass/restore')
 dependencies=[CORE,BASE/'pressure-footprint-v341/guard_with_footprint.py',BASE/'pressure-footprint-v341/pressure_footprint.py',BASE/'compact-cache-fixed-mtp-build-v360/lease-result.json']+[ROOT/'Tools'/x for x in c.DRIVERS+('thermal_readiness.py',)]
 value={'prepared_at':now(),'build':build,'dependencies':{str(p):digest(p) for p in dependencies},'executor_sha256':digest(Path(__file__)),'native_specs':NATIVE,'commands':{k:[str(BINARY),'optimization-state-check','--variant',v[0],'--model',MODEL,'--json'] for k,v in NATIVE.items()},'environment':{},'seconds':SECONDS,'policy':dict(c.NATIVE_POLICY,maximum_build_seconds=SECONDS),'classification':'Prospective V361 native commands on exact V360 after the V349 full-model MTP counterexample. Original complete cases and exact-output checks remain; both arms retain the original fixed verification shape and candidate compact BF16 rows remain selected. Complete assertion minima are raised to 286 ordinary and 327 MTP. Conservative 22.2 GB admission screen is added; original live policy and 900-second work plus 30-second cleanup allowance remain unchanged. No retries, benchmark or activation. Explicit V341 failure observer remains bound.'}
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
  required={f'{arm}: original MTP verification shape selected' for arm in ['false','true']}
  required|={f'{arm}/{case}: {label}' for arm in ['false','true'] for case in ['cached17','boundary255','boundary256','boundary257','long1025','image-before','image-crossing'] for label in ['selected n-gram cache format','n-gram cache contains real rows','exact n-gram cache payload accounting']}
  if name=='combined-mtp':
   required|={f'{arm}: {label}' for arm in ['false','true'] for label in ['terminal draft work is explicit','terminal target work is explicit','terminal verification executes once','terminal forward executes once','bounded output preserves the longer greedy prefix']}
   required.add('two-token MTP integrated output matches reference')
  require(required<=names,'new composition assertions missing')
 return {'passed':True,'completed':True,'qualified':True,'assertions':len(items)}

def run(name,deadline):
 allowance(deadline,SECONDS+30);value=load();target=OUT/name
 require(not target.exists(),'attempted native cannot retry')
 limit,before,thermal=readiness(deadline,SECONDS+30,22.2)
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

## Artifact SHA-256 ca2b3c2821ec7f0469bc7bcdcf1609ce5354bf519346d515394f99f57da550e7

Encoding: `utf-8`. Original bytes: 2939.

````````````text
import copy,importlib.util,inspect,json,unittest
from pathlib import Path
P=Path(__file__).parent;B=P.parent;R=Path('/Users/carlos/Projects/slotstream')
def module(path,name):
 spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m);return m
m=module(P/'run.py','native_v361_test');old=module(B/'compact-tail-native-v350/run.py','native_v350_test')
class NativeBinding(unittest.TestCase):
 def test_exact_execution_body(self):self.assertEqual(m.EXECUTE_SOURCE,old.EXECUTE_SOURCE)
 def test_original_live_policy_and_allowance(self):
  value=m.load();self.assertEqual(value['seconds'],900);self.assertEqual(value['policy'],dict(m.c.NATIVE_POLICY,maximum_build_seconds=900));self.assertEqual(value['environment'],{})
 def test_complete_original_commands(self):
  current=m.load();previous=json.loads((B/'compact-tail-native-v350/preparation.json').read_bytes())
  self.assertEqual(set(current['commands']),set(previous['commands']))
  for name in current['commands']:self.assertEqual(current['commands'][name][1:],previous['commands'][name][1:])
 def test_actual_failed_original_mtp_rejected(self):
  report=json.loads((R/'.build/optimization/compact-tail-native-v350/combined-mtp/stdout.txt').read_bytes())
  with self.assertRaises(ValueError):m.assess('combined-mtp',report)
 def test_old_shape_selection_cannot_qualify(self):
  report=json.loads((R/'.build/optimization/compact-tail-native-v358/combined-plain/stdout.txt').read_bytes())
  with self.assertRaises(ValueError):m.assess('combined-plain',report)
 def test_shortened_case_coverage_cannot_qualify(self):
  report=json.loads((R/'.build/optimization/compact-tail-native-v358/combined-plain/stdout.txt').read_bytes())
  for item in report['items']:item['name']=item['name'].replace('bounded greedy tail selection','original MTP verification shape selected')
  self.assertEqual(m.assess('combined-plain',report)['assertions'],286)
  report['items'].pop()
  with self.assertRaises(ValueError):m.assess('combined-plain',report)
 def test_original_recovery_report_remains_complete(self):
  report=json.loads((R/'.build/optimization/compact-tail-native-v350/read-failure-serving/stdout.txt').read_bytes());self.assertEqual(m.assess('read-failure-serving',report)['assertions'],522)
 def test_actual_candidate_diff_is_bounded(self):
  before=json.loads((B/'compact-tail-combined-build-v349/protocol.json').read_bytes())['candidate_source'];after=json.loads((B/'compact-cache-fixed-mtp-build-v360/protocol.json').read_bytes())['candidate_source']
  self.assertEqual(set(before),set(after));self.assertEqual(len(after),150)
  self.assertEqual({k for k in after if after[k]!=before[k]},{'Sources/Slotstream/Generate.swift','Sources/Slotstream/Optimizations.swift','Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift','Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift'})
if __name__=='__main__':unittest.main()

````````````
