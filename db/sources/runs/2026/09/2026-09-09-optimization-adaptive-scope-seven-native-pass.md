---
type: run
id: 01m22tv0n8c42hwf86jcy22ez6
created: 2026-09-09T10:18:56.039842+00:00
updated: 2026-09-09T10:18:56.533738+00:00
summary: All seven smaller-group native cases pass with complete prior coverage
binary: /Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream
captured_at: 2026-09-09
command: V496 original seven native cases and V507 terminal source, guard and receipt audit
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: All seven smaller-group native cases pass with complete prior coverage
tool: Slotstream exact native and source qualification capture
---
All seven original native cases pass on exact V492, totaling 5,556 assertions. Every V436 assertion name and multiplicity is retained, including all 5,300 prior assertions. The lifecycle adds 256 assertions and exercises both actual intermediate process- and device-limited four-pass choices, with exact output, routes, compute schedule, state and continuation. Ordinary integration passes 286, MTP 327 and checked read-failure recovery 522. Every original workload, resource guard and complete work/cleanup interval is retained; all exact-source, guard, receipt and cleanup proofs pass with no remaining model. An initial terminal auditor import used the /private/tmp spelling instead of the literal /tmp dependency identity. File bytes were equal; preserving the original import spelling corrects this model-free adapter mismatch. Both auditor sources remain preserved. No native case was rerun and this is not serving or default qualification.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-mtp/attempt.json",
    "bytes": 22975,
    "sha256": "30a1c8732fad84310890d1286e5c19260b713e444fa3f9c8a06a10e0782284df"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-mtp/memory.json",
    "bytes": 250792,
    "sha256": "a1bd1f0a01fbcaaee2262abb8326e86bd026a39fcb2823541b377a94c6a350eb"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-mtp/memory.samples.jsonl",
    "bytes": 190643,
    "sha256": "03e52441bee95d2329674dc50d8e59a4951c73f5643bfa318ae595057bfeb9fd"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-mtp/qualification.json",
    "bytes": 2609,
    "sha256": "451095f4a77cdbe8e4f9e3f91eaee2a80a69cb7df153e2f3efb0dabed78d1f8e"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-mtp/receipt.json",
    "bytes": 2511,
    "sha256": "08ddbdbfc4462f6a9dd9b08255d967f885e106cbc4fffd38fecd6a2d1d475a67"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-mtp/stderr.txt",
    "bytes": 486,
    "sha256": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-mtp/stdout.txt",
    "bytes": 33531,
    "sha256": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-plain/attempt.json",
    "bytes": 22971,
    "sha256": "6f6fd59315d0a6f650c533608193e7a1d802fdb1cff1abfa278659174e117839"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-plain/memory.json",
    "bytes": 214224,
    "sha256": "9b9df980f6c3e06ddf732dd2f423a11194caef810fc09fae13201e5c69e5a667"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-plain/memory.samples.jsonl",
    "bytes": 161886,
    "sha256": "10d3e56084eb96f77c7298155eaec540fcdb3dbe3d75ff382d05e714f9f4f936"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-plain/qualification.json",
    "bytes": 2614,
    "sha256": "063ceda130f9dd9aed8263a5740546aabe74fef51adfb964c58efe3f10076b80"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-plain/receipt.json",
    "bytes": 2516,
    "sha256": "26bbb1d7dd3f6778b289d212e6cdec99b1ca21f36f27caaf03ca77d10a016161"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-plain/stderr.txt",
    "bytes": 486,
    "sha256": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/combined-plain/stdout.txt",
    "bytes": 29460,
    "sha256": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/read-failure-serving/attempt.json",
    "bytes": 22981,
    "sha256": "2ea8bac96530b7cd331614359c0bc8916b486a3e04cc5f7b868d231075c28c03"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/read-failure-serving/memory.json",
    "bytes": 151153,
    "sha256": "95da6b2126b57b996519c4b852bd4253346cf4456d9eec6aa844feeac2c8aa59"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/read-failure-serving/memory.samples.jsonl",
    "bytes": 112576,
    "sha256": "9db2d06847cb2192e4073d2056727f85bcfce137ebd2e4794df5fb3bbaef698a"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/read-failure-serving/qualification.json",
    "bytes": 2608,
    "sha256": "4068134722204b62d1bddb3dff35c950590b1d4ebffdad33f2e19ed783d5081b"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/read-failure-serving/receipt.json",
    "bytes": 2510,
    "sha256": "24b0f8bffdb9ac2d51304ac669da2c4f04abb121a26c1185564b8066ad52e36d"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/read-failure-serving/stderr.txt",
    "bytes": 1739,
    "sha256": "fcddd13aa70264a634d0711887cefea6ab173ea25561bb65ec6e095ee069c246"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/read-failure-serving/stdout.txt",
    "bytes": 69148,
    "sha256": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-2051/attempt.json",
    "bytes": 23114,
    "sha256": "400607f61860a262f5104ee777fe6fead21345fc86022e4281b278c3dd7e1705"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-2051/memory.json",
    "bytes": 47414,
    "sha256": "9be92e79cb83151babcc41a4c4019d44e242f4539ab3b024c6650c8b9a6e5cd3"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-2051/memory.samples.jsonl",
    "bytes": 31219,
    "sha256": "a27f20afe2c2a34f6001a4a9adaf03a464cbb39e525f2c79677b230a1bd111b0"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-2051/qualification.json",
    "bytes": 2697,
    "sha256": "7411f29f0ffd8f21b9424d9577e47fadb988698526b249a2fa66c6b678cdabee"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-2051/receipt.json",
    "bytes": 2599,
    "sha256": "9540e825f4aa4c2775e525e2059560fdf03108b89d9085fb8c83b7b5fe34638a"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-2051/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-2051/stdout.txt",
    "bytes": 163399,
    "sha256": "7c02a1ac8903d1473cdd697e34ad3be4b7530c5a073f79d33dee29b9606b7cba"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-4096/attempt.json",
    "bytes": 23114,
    "sha256": "8ff37c1869f6b52ffcd9452f9d474a4ec873afb90bc7dae43cd888eadb0b1f3e"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-4096/memory.json",
    "bytes": 83255,
    "sha256": "092d5d1d7611ece64d15b8c11b8fbc477e775de6a8a0dc146b5fa810eafa5f71"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-4096/memory.samples.jsonl",
    "bytes": 59252,
    "sha256": "92d1265d054c782efcfd6889836fa0b100f039b24e8474500862814150505e18"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-4096/qualification.json",
    "bytes": 2691,
    "sha256": "b81a0edbd9e0d35320e0031c899bdd5e61cbd2b3b29e6ed62510d97737eddbe9"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-4096/receipt.json",
    "bytes": 2593,
    "sha256": "2be332206451fe4eae7fe42bcaa8d990a616a4df3d8d19d46e39535b1ffc9777"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-4096/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-family-4096/stdout.txt",
    "bytes": 163508,
    "sha256": "74f4557310de989b4646be90bf741687dfc35cc1744678124bf9389069ce8281"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-lifecycle/attempt.json",
    "bytes": 23077,
    "sha256": "26cbde13c6cfe7df960d14c29e7620f3c0500817affcf6ea97390dc84aa22176"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-lifecycle/memory.json",
    "bytes": 354560,
    "sha256": "96a42aaa22bba220e82f092cef3b201515c7ea3cd2cbf4b0da805801f92d24f4"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-lifecycle/memory.samples.jsonl",
    "bytes": 271549,
    "sha256": "72b80f43a3d2a1443a516727f060013ff02ec85fef1f7028180c6402b68fafca"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-lifecycle/qualification.json",
    "bytes": 2771,
    "sha256": "e9d659cc52a25b312807e1acfb7f9fbd684bbf94bd6a3bcfc0a7d68380f90fd0"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-lifecycle/receipt.json",
    "bytes": 2673,
    "sha256": "742d945c59756263609a1a1677af1f489169494db304f1ae23c4ec9743f37224"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-lifecycle/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-lifecycle/stdout.txt",
    "bytes": 191838,
    "sha256": "764d8e8e5cfec3021d70e2fc91720ba17bf1f7cb9b72c40391cf9a94b183bef9"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-mtp-vision/attempt.json",
    "bytes": 23090,
    "sha256": "2c93f4cba674426bd17206049bc6e2faddbb7d3c65842340379b70e88a1e2325"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-mtp-vision/memory.json",
    "bytes": 171866,
    "sha256": "951e3367ca056c66999ea047e04638c78d3bdc80a09869cc829db4bfdb6e62ff"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-mtp-vision/memory.samples.jsonl",
    "bytes": 128569,
    "sha256": "ebe7e87de6d4f0b2a194425ae9f0355b196776dabcd6739d18baa03dbbbe2b15"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-mtp-vision/qualification.json",
    "bytes": 2778,
    "sha256": "a736a419b84d2509506805cf4672abf1a612033b5a30b814e92ec89d083fcd79"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-mtp-vision/receipt.json",
    "bytes": 2680,
    "sha256": "c797e3a910ea893450b674caa9b143a1c0ef3dc6cae1510fadfd60414e4f9a38"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-mtp-vision/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-native-v496/scope-mtp-vision/stdout.txt",
    "bytes": 80443,
    "sha256": "f8cc4841050a940ed9dcc269d4d1014908030cd7cecd78801582ea892d3d457a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-native-terminal-v507/audit.json",
    "bytes": 28421,
    "sha256": "704446bd9e3eb5b3625d995145a41faf26d4a64175b87092761047a181b1c306"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-native-terminal-v507/audit.py",
    "bytes": 2987,
    "sha256": "1fe49fb8967248f9c6be9f62c5caa56014c587f1bfd712aaaced6967e04cb871"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/adaptive-native-terminal-v507/initial-audit.py",
    "bytes": 2952,
    "sha256": "64e064461e629c5b7e9c65002355df7e13aae8d0f005b2a5110f3b64cd496cd3"
  }
]
```

## Artifact SHA-256 30a1c8732fad84310890d1286e5c19260b713e444fa3f9c8a06a10e0782284df

Encoding: `utf-8`. Original bytes: 22975.

````````````text
{
  "started_at": "2026-09-09T10:10:13.382715+00:00",
  "deadline_utc": "2026-09-09T10:35:43.217365+00:00",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated-mtp",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
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
        "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
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
        "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
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
      "source_archive_sha256": "6369274313f2baa58e96a0e81b09878173b24e69149ffc4c939812a4c9b7a763",
      "binary_sha256": "d3701afdb0540850f376ca9a696a2a0ffa31a67121362e341f87ebc9e27fd7dc",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41917267968,
    "swapins": 44356344,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   470471.\nPages active:                                1106806.\nPages inactive:                              1018227.\nPages speculative:                             86943.\nPages throttled:                                   0.\nPages wired down:                             218511.\nPages purgeable:                                 305.\n\"Translation faults\":                    18435431411.\nPages copy-on-write:                      1043030304.\nPages zero filled:                       28406468132.\nPages reactivated:                        5413930679.\nPages purged:                               97305044.\nFile-backed pages:                           2087651.\nAnonymous pages:                              124325.\nPages stored in compressor:                   663738.\nPages occupied by compressor:                 177019.\nDecompressions:                           1475808746.\nCompressions:                             1816789038.\nPageins:                                  9650505163.\nPageouts:                                   11644417.\nSwapins:                                    44356344.\nSwapouts:                                   77895019.\nPages tagged:                                 158535.\nPages tagged resident:                        108799.\nPages tagged compressed:                       49736.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         7440.\nPages tag-storage non-tag pageable:            83990.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8617024.\nTagged compressions:                        14872978.\nTagged decompressions:                      13806085.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T10:10:13.381496+00:00",
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
  "preparation_sha256": "20fb2090d27c6effaa0ff0da407456fceffc1aedea731afc5caef7dc7d0edc9f",
  "classification": "Exact V492 smaller-scope refinement. Reuses unchanged V439 scope and V444 integration executor/guard/assessment functions with original work and safety envelopes. All seven V436 assertion-name multiplicities must remain; lifecycle additionally requires actual process- and shared-device-limited intermediate scope choices and exact continuation. Native correctness only; no serving or default activation claim."
}

````````````

## Artifact SHA-256 a1bd1f0a01fbcaaee2262abb8326e86bd026a39fcb2823541b377a94c6a350eb

Encoding: `gzip+base64`. Original bytes: 250792.

````````````text
H4sIAAAAAAAC/+29XZNcR3Il+K5fAePTjJl4Oz7cPTx6njQzO29ak620epmW0aqBIlkjAIWpKnSLGtN/33NuASCSTWbcrQi/ZtpZkOw2AHUz82RE+Fe4n/O//urVq29e3797d/P+zTe/f/Xf8Vv8we/+78fbh8ffvb55eHv/+Lu/e7j/H7evnx5/9/j2/unx6eH25t3vtj9+vHv75nf3H57u3t39683T3f373928ucFv/3T77ePr+w+33+4/8e2fpBe80Ps3d29unm6/eolv/vr5vb5+iW8fn/BD377+8fb1P3/++2+//dPNw93N+6fPf3D3/un2hwf83Jtv3z19+PnH3t2/uX37+beXCLavPvn+Y4+/+59/vn1f/dvv3948/vjt+9t/efr23dt/+Vb+ePf08yv+j8f799/gN//EP/nmw/3bu9c/4Uv6X89/j8/68PTxw3cPt6/f3ty9u/nj29vv/vjT0+0jfiTX9PnXp1d7d/f+7t3Hd9+9xRf0q4/85RM3/7I/cf/n97dvvnt4fPz51dMvf/bx5t0HvBa/moc/3bz97vH29f37N/zZtJVfvN6+Ll/9RP/5VZ7uP3x3//6797d//u7xzzcf7j8+8Qe+v3n7eIuf+Lf9a/jj7ff3D7c/fw0fbn74CrdVl0+v9msgJffcrLhk+/yeeJ+79/vfSVWrIl/9xacP0Jp3Tbl/fuGbP+MPv/nbm9c/vvrHO6zBzdtXf3v77v7hp1d/j/1z9/h09/rx96/+Az/Zq8e7f719df/98yd7tX+O//iH93+Hv3p89f3D7e3vX41/SUvS8/b5sZvX3OXDB3NO5uXnx+7eH3owp+yltC+PPX64ff3x7c34Sbcu9ctjTz8+3D89vb19cwRg+vLYn+8ebt+8eoM9d/25kl3zz+/24ePDD7dc6fG71aR47A/f/MPDzfvHt/uxxw77+Pbp8Q/f/OrT2bExpJacf/4uYWB++hb24s8Pd0+/9Z45SU01ifYvj/3r7cP9q+/v3l75WrA3k4l57uXLY7AbXDmanN/Ep5Jrr8lav/xSht9/b/hGkgge+293b2E2b17/M5aAm/fx2rMleTPlEvzN+/v3P727//g4fohfS5Fa/eft9XTPFb97j+/03YeH28fH+4dfewWz2qp9eez+9euPH+7w4B9/uvpgbg0HF4/919vPP4YFv/oZszR1gBN+yP9y8CFuk2ywE+kLtrvRE89fvym+fs0mnx6jzTlyZjIeEck8qH//bMOOPPXFyn167Oi7fTaBP5/vmx9+OHK4s7pW+cVj2NGPd29u3z/9/retkLf+y3f7stK//caC7axfP/YtNxh+c/2TdsdB/bXHXv14//bN3fsf+Ge/8kWZW/3Vx66b9ial/+pjOEnf4vf7QfoLcwbLkPLVx3br+ftf2yt47D/T99AV/fwt/gaq3ZhjNxu38j9cfvVXD0IWb6W3rx57c+TY5erJkvN0f/PFzz+HFI9fgsJnd4+/uH178wGf/SLGwBdjBf9Zf/7V/K8///hfhi+i3rT84gc+PNy/xqf87vX9R4R6iCS+/P1vxRHSRLz+/Dq/FUn8eiyx/9W//fUYWimpiMJqfoLWryCr8Dm5OUKcKXQV36PhK8rFo9GJWoJlT9fWqxRLpSGckTlUmqrAQBdJsajylmpHMGRFr62V9gZUs6AEx7RzxcNBFYO7T+0aJkkIJuzrL/hlmLSbeW1fbeMgTHAXMBmllyugELnXrC2XWVCSaimew0FhDQAJ9vvamUIwheOdplcqI31rJdoM5q1bwTrg1zVQVd0RyvokKMHhxZ6QYOtXtpK6JUl+FRQNVuvVZkEpXqlLtPErG76+BkPbPjmsq5a941ghL57dhch88B2Jhy+YwQbK1dXCYsF1ukwjUvhfLH00Iu85JWnYYfsvu4oNP5XaNDZJWSsABtuMuuXCYsb14EI6zIp5nz9eiC3Moo9X3eDxcYzz1dhCqyl8aLZp665w+LDv0aC0ieV6HZErTNi0ae/aS8nRkUXdHMGm6fXIAlumMXOZN3/Ist0t2FjIlkpSteuRRc1dmM1Ng9IqGf+Eg0Jm5TABVw9USa5VVWdjwNKQVuFcWTQo+MLuHZnuVVCtVQaCsytVkIFYi7bnsrVsHRtwEC4JLJZPx4A1W8b308JXCrZcmpTrGXDCeuZeZs9UQWyGQMmC4yTdcquK9OJqsoikYY9rZ0FlhUFq4eGEbrW7SB5E67XQ/k1vv4z1dnhfiQZlNZdSTkDEWEyLSPje2+OEVkd7r+LQtWl7johkrx3HgrINu67kalc9L6NCOt7JA1WBp3nq0cU/22BjS+ON7DVQmoW3Iz4LSio+Wrg9t00RTrR0ffshNC+mZjINKrcElxgOqnlpWq8nHTlxqfp07lsbckOuV7BBbxtDbxkUyoCqIhpoMovKqrUcb/8a4lnEE8gR8/C6ANiQtzZXm8Xmoli26Fi9IazNMLfXw1qiwqJamjUZprXLz60icaisw8HimQEqy7Aas7Uy7ENvBSFgikbVi+CtvtzJXcWGNDjZtDuGf5RWeoquA/qWhfm2Shmgghv9+tO82HLYCZmwb9VzyXl0uuBxFNBn7SGiNGSfqVs0KsuM0w7uQxqP6eQRuc8vLyKCsLm0luvg/gqokDjrbJ7PkkxHEB+9DzuCXcRQZWQPG9KJ3qejjdrY3xVe4+yMdhPShas3WDnD35T0dVvBC3egmuN4RfuujnC3NHZLXY8M2YXlVqYjw4KDlTW6ftG3hidKkXw9MmyFPTLTUbw1fHL4v+BzlRMCXmm9X78QISwAS7OXB1is1JC9VQuHVaRk56E5YuErc85pW2h8L03Jw8GJIZS1oYmv7sjYZ4ND7fh8Hl7KBSyDKzEZnjBW92TabrDoKciI4mEh6yq9DQNDqeJp2shbNldN4f1MGfEu9/r17osdFpfU5jeheM/hmzBvFdbQR1UNoOotT8cZ2lhusBMWC+9iML3Do6X7bcBsUGipVrfolAuwkPcjKKyjSEOQJ6dpiyHduuO/aOdVtoSIptcy8snIlppMlzQEfqLAvadwWMUVwdowlxRr8611+NAF9r1Ex/CApbnrEfuOfTpfVoPdSUj+PX61YOOq5GHGtZe2pzdhMWxC7z1+tToMYSnqhwJD8b3panYrIh3P8TdCuW6ZKb2O7eGSrQhXkf2ECKpuUjy7Dw2H/uI256WFmtRNwzs9AcuwDr3Z4K6hIV+iV56FZb0mtxa/Wg7LkdIwo3S2OU3Dah0v0zQ8o5Qt5+zsQB+cLdWcS59OlKVZ1hZdVwMsZh15MJdAWCal2qyZR8xsOFs5frVo4FsaOmWcCiQV0/cn3XBAvcfD8v06tY0yf2XzbpovQmk2jQ94deM1MTvT6ghWgSuYvjtxO6MtF7CKp45/86FrBpz2ZNPXXcr7mu4ngMOSNbc89F7cjNOxhlrh/Vp4PVQR9npyH3ov2JeifXq1Ej94t/jVYkdS9ST50FZcAk7gCzs2Y3TEYRsciuarC8bZzJzns0p86K4XY4dRmATmMOmwYuPI3vv0xasjge3WT1gqWDiOIYzCDcv4UNOWvrFW3LzErxZ+vvL+uuwMKHUETtOCxoZmqV40YcaAa1suqWYOSB8Dx4Go6buUVJ+nzcPBVekkdsBhOwSu9wVXDxnZ90VKFwUOhhz+bBgF297QO3+/LMU8hzuztjnsXtHh1YMVu/CtL716wN4AqmhYvu2nTNm/yV/DNcPCThc7hClttvCEzLeiCRnJ8M7SkLa1Ml/TNmOrmYTDEue0TPJ6aM1qTdLn16znnuLrbr61BFMlXo+Bk8uJi5fWt7vli4bhKHCdebuaHTttyh6IWVNS8EV2qeHFqr7hSDe826d4ZAgOx26+HIxIy0hLFg4O51pgj4dezXSe9mSnB8HXU+JhcU6j2CgwZiVuvqcDEZ1bfOzYNzYIdPehq3aO/E/D4vxOjZ+QT1tCZIHQ6pOrHoHrqfb59qKkjrQoeloF4IozlBtGjb0guJqfLMqJ/fTR4RVgaaF1GrYlGpZrPqM2Er8hcYqH1ZQEW+MT1lKr04FVK60h9PD4E8aClWp5zjmHJwzObr64wzItU8HoE5a3khvSilyOZdRLTL4ZrFVJ0RNUACeI8l3H54xx/nyjbFHOFUcXCgDLGlD1YWfYGlikf+yeots8AIvkZz0dMB9+wX708gEP7OXoykcpW64FH3lcZ/SEN52udKualjNg4RgnBDij2wnzUua7tUUll/imS8BSGF6tY5PRacDmb2uRzGl8lFg2dvFlFrsPZGFOKoY2fcPuOWcOoEf7sLpxcIVXtvVYCFytpflmD0RwtUZXGAGueOv5cFmHzI7T9Xwc2YzwPvoOBuA0V3UZtlOtgWWNuc8ZG7JV5M+9HyyfMkRZcU0hJeUTNmTf5z2H3ZjAXsr8PLC0DhcSHgjLVjhuPr4OXDMqBi8t9YIHKAqWsNMJh+yQbYRJ0/kOWq0ZkWc4QwfAcfiIz6Qj56w9Z/fzcWNvFy2rUeDcvXdOzx4DZ22+4VRKRVRToxvwi24IDWxEa0ZYSD3mB54tPdNOx8PCN9ilD1GRWVTnG0ASaQmjL1+ASsnlPyCCJazaVeb7qzynZPGmUbfWtYofNY3sVF9xg5tg+cMPmG2pGOdORunZ3hjV5+dNKSSiJ8AqiiwGJtEPGUVeJ02XhY3vVsPvAQFOeOc8bldfsxU9sQzXT1gzhEzqdnTN2Ec/Heo3HLL9UiAcHMKcrjaOhpfYRkNAQAKQaFhty5p6dT12a9uEzBDzxRA4xROuzNqGvZ9KGnppKV7mO6wQwmHrWzwq7d1aPngR2IQX1/NFVC/V43112/A+kunOjoGz1Pt8uYBUrRZNolB8S9QFks9djcPDRhs5bUkQqFavFg+ueO688vMTwcGHwPOHXzA5Jw+K1XJ0W67w20gvRHMt8SsHAyg5HU1A9ZJ86aU9V1aQHkk8OA7f4uVGdX7a1Hl2ReGXY+HzB6VviI6zZh/DqhSXme5t7G0XCQmHhVPG9xq1bC5arVI6eUviYRmjrPFo4BpYsPlU1YlusAUsb6V4OliWW7RmZE3SHJ3N1LRRtxT2frBmu0PQeeqIwsGb8CEfwML+oJTooQbbReBY3OcgmIeDw0vlvbXggJveh8GnFVeeL9HiGZ0BrnVj3/wgnVm1Zu6cKo8OrWqmmgeAjSi4EFyazQ8IcrU45pPCYRWhDOtwtZ612NJ83GEa35IEWOJKTdRBGQSwKEU07ckcp9nd41erUWejHCtdAZxd8NK/lKIlG9lMJBxcF04Yfy4Y6CngYIWRmUdXQ2rZspF0wT7x6g7BIe1c4aytkL86HJwkki6P6Fq8ZnKSTK9ZLVlO2JBls0/rMFotcgvNm/zq1k4Ircrm6rAhnxUH7Yw1YwGkXghoxoCr266E3YduehEs42SPhW/FulHPRMZbEd4V9nrecNB9domHpZa0DW8rAKutmA7MJMAO77cCLGxBtSFpC2CRCnI2qKoqzzeLwbBkS8jJehlvQkMQPN0kgaDKWo+3h7IV06Q+4pMALDa1TZ+tmqQ2j2YABSzpeKNhMQewuAenN2FX3ad6wmE1WG7mEMPV0jJPrgs3UbSF16gqhe1K055OWi1VBNjxmrK6MXfIdmC1kMb7fKEUkVjq4ZaQ4nadxMuD+i/rjgtaaSn/u0+BhsNCugDPP+iCoxBmX0BDC9ePXRjelglYTr6D9FnTZBDwkslkQcNHr0ge4r2Xbcl6zuPcq2m6YH14aR9LwlZsJ8AqCOK1DUOopiW1BeSLvcP6RrMPAJYWXgoMrsOASuu8As0+FNTDW4OBimem1WGosQaWkSnC4kWpjYO2hghg0P/mpMqcVpuFS+7eyOQXDKttlIXxXE6C5aloDR+LBixOS1gbtXADlltN8/d7vCsNJwAFLGuNStjDUMNSsWlaOIG5yFVS/CYktZgO1dMWeWMhEX0KnxmuvlF11q5HGD0V0g3M36W0fEJLKTBV+BGKEfdj4ZMt6FKkJrFdKPREgcOx8ZI/s3+ObEdLCxr5dlrKE3oDnBQz2UsdhhvIqee73HCWvcePM9aOkFc7AgD2ahzYkIvAJd40h69ZR+DLeZNPh228IeuCFj5ODxNfPDjNbCod1nvZ6bqgea/U5L2fsGa8t9znawewpF0QCr6QKg2uU6yE++iO+De7lnH8uwZWq9RLib6tlLSVZKnqOTlYKUlEwhs5gEqk+HgoblFUX2AMq4WLMAIWx0hdxxZjSVSPcGqnEIlfrZ5JQdgPWvklsT3CAPJsRhd9hfp3fSed0jNi+9q8pHgpBsCqXkjjOc7E6oLRqpNuHgCLnNt2oBywBlbf5e+iGwEAy4XKbfWTzOlwK+qCiTGO3nEGKdgzSyHJomY9IxOrLVWmfiUcU6FG/PgGbBGsklLT8MYvoQYe8ktvR7PnJSbRNNX40oBQCc9qrpTdOe2QVSvWqp2wcrzpYJPQiRYEZj9p0ejOG6EeHpt8yik2BB/cL2dXo1AJ54S7fapVDQ+bL5g5LVTIlvDkGeCMqh31s2bSOaUqZC69hjcKAJyTOsfGwdUiWN0ojBMNS7ZEgfBx/8OaIhVONAfJowdYAAv7Au8zvmtZU57CZyf5fTwsdtLtlfUj5oMMPnm6A11VqO96wpo1gzfT4SUt4uY8ry9UlUKX4f0PgIWFKkg486HmDldKfU3fklGCp4XfTohupVDHe1j9cNoyWzAVvCs/WDgsuF32Mw9hIbWvdV6moMJUhYuCAJa5Wsrj1XJPC6TkyaLuOTxU1A1nK+uwmuN9b/GftvWpJk47B6OyLSOaUjmYuvR0yQLw4mHF5PH6yQDHDDD1UU2ncyC0TFfuzau2ZB4Py3ahxhGbQCfR5wLPbCxx5xIPi9e0VGE8EtiTlHzB3KyWnqnnHX3O2pYUUYf7oTocwOmCWWdmYz2+5wjgKqkBh3ogyzo+2Cadovv5AEuR0tb8uWY1XLNdM3h6zTL/CffSDXEwomA7Zvg7vNGFGNBLNQsY7pQWD653yoOOQhDAgolcQO6/q/eEF/N9l7Gt2g9aSDraeYp/a63Ht8IBHOmTfLhgqiUtyKQ5FBNeO3WEwkJ+tGsr1a22umRQTK00k/iF6hwgHAiCWIV/tnmFib32ZvFX0X1DbK8lX29eUc7WLJApgBcsKbfwmIpKeLaLel9HhYVaoBHNAXDeScSvFYkYkKGP1sraiqtaoaaPR1OrABXFMnjVcB2VIuOd14YmC1RJLXrUQ9OWcFyKX++eUg7Gl3mFSSXzpYZ3CwBV6ZLKYNRDSWiaJc3zpPczioj6LICnfj1ftmemremoySgiWM9Yq8Z2/pYPcI5owxdQ67QlbEi8JIW3dwBbN2eD+FVfrNS5gnmfZ0l3O6FpRfNGEfXWry5UEsnzMtBGFqYm0VeygCRUbPPrF3tA1azPGwy8T005PPEHKpIBlAHrHlHh/M0T/2bKoGh0C45S8Y6lk+vq8Urq3DKvHqxOMZHw7myl4J303j634NgAW2YRf3piu6ceT8mhu+qdUpFrsA8dX8G0cUcCiugpPnSi6F1j4HSgZrjqjImLndB4A2y+50CfO3+v7kYjne18wEHJqlIsum6olW2J5uX6vZ7S+SxI+6W1Vl16PCq4FLGrByyzPXv+xkE6SYXjD1jdsAitUcRyuAmFWX9ZMTDbc835BGzN2JtxpLVeKH6T56chRGjrw2+KgK2791Su992IPcdA86g6Nkm46qIKq7tZ9chuVPIZXLQovLQKQGbhGp5ZysZX0/K5I/GqK8tIChdwFiE372Q+jcdmjbxPJY1vUhAQkY91upcDQTAs7dfNE1HY9op7KyNQTRaUpDhTAjsbfdCUkbCrjApt3Th6Mr1U5IE+IWvRDakEdsTVlSKFvqyQfYY97OH8xcC0N0yPMNVe5jWfpZMLJJ+wTp4aHO6gZCMFG3BeORKxPDlOw7NL2xLHokaQWplnmdaszwJy4ZAK8i+9fnkHUAZI89f+tougpnhQwhM16MRWkvCVeT4ptpW1+AZRoGKfxrAcL/gkK8LcStnSGl7VsI22utXB/hPJCzS4HTY9hbedaNsy50QOWL/U5nmJ8UbAlKJ7F4CqdhLtpyOh+yLLzhlBS+HDRMBm5KDVI9QwxKY2r49gFe9VwxnbgI1M0bAcvZzguAwxu2l414n6RjZJDtLIod24xCnDzGPBwlN/JwN4LwPyZXrlpPPKAYhospTwfjWgovB8G6jcL0NVsovEWw7fGjUB8nVM2TUvqIIaUoCcowf0tG+kT4NrGkQa2c3nSbJ5twZU4dF730pNJOm9jolDwNO9d8/ixuEzh8Akar3K4BZvFSp4Ym3hXZJAZZ496fUWjZ5Y91whlqVdNVzTEqh6grfP19vUeiodcf78HVf6RG8Ti8rSlvlmcj3WRUTFsuh8Bol/3CS6TQ2oYJXgf697YKoHWl9wH4lEQJpqPCpyK8Er9nGU28l3ajJvM7g3cnh2DGxe2NEgB2ZDe28JPnu+QM1u2h6/bnlLWDYE8FfvWomqt/ksWSUhqA6PcoGqsHs/X6/SAFUpviB2R0ypEj4uD1RaqN59HRIH5aePlmYYXT8DEnIsZFnH9MzIlOzJ5vtPSK4UzqUHcJ28BaM5Q0TdZi4+310Ic1HDiQ+tbCUhpas2cGCN1wrzSgEIdXvT6KsSoJK9//46yS1QyU74Ml0uTNJTeNMJUJk1L4NOf6Iq+nXy98K1gsWVHq6oB1QczU06NO8ieYH8Qc5+ObMSg6purMEXuV5MIyr2qc2XCN2VshfhqPBapOEdrlWT+e4ghRE8QcMMqPDdOSWkRmvV0zzjplYlT2qOXyvPkkbzC5Q4SW0BmX7naLxE92CYbInXcdVGOxDec37aSQrMerxCpVFuThJl70eoal/AJ8dbiR4+a2JUm9NUugzSEZwpkQWKhxWuMZxHA6haRchkdVDIgOeUOu2FKxZ9ny8NR0WtPsoR7yrS+QSTwYjSLm5rY6Dplr14bcMQV1uZZ/6TnBCktehGO6CSjPyR3TMHFsyqz1PnC8I00tlaODSDOdgZNMbQXHlb5PPSIpSQPgEa5f96PQjNfb7zU9i65xJ90Wq2JVZv66j45KTOmC8X7u2l4azKQFULewtOgKSsNbJ5LxwSAuuqo5K1W8nz6puajNSc4RGUba1nbPX6bA8HB8v0gr70pZUn42qFH6y2pZJd+yjkJffkijsGHKrawtOTthWhtMdgEzqc1/wdP07WCRyGwCQNTqQe2oSdYjbzRsOtZj1jE+LrqyYj694TdV+mc2RKpcePgQJVR8hnVYao4G7ma0/KuDneEzu1NmAvrrdlkCK12YJGLvL1dDsBFb/A0UJVcrxN938aXiaeu9AoNMcpQsntgL1AIDI/42S70nx4u67tMnOFcuIH8sne7WLS5cXUjCnHyw9Z3xJfK4/ITxM1zdo8jxAbFyW+laFv5KXhhcgIFkni5gP4Lj15uNC3UV7OccpGoKo2X1DbLdJafBWU4nIcnrtegyIsWTK15TCJOZxjErA6CXfySO4lJU1aF1AXIAnwGh1ltPR8x6ojGTbSGvk8tbUxHY2fHAQsgauVNNIxWAXLWm81n7BaBidiiOOHJZodmzXxeeIdNhaEc8UBGy1uywfKTzs2rz4/TFM5LRHe2NXyBodsjWRcR7BhR6YyP31HQTuL9s3ABn9puY9DDpcVjElZvGZv8bC0FWqLD92Y9wUEPILc4LLlKAoWr2zMxm6sI1qYzlbkmZMhOpJqZUtsaagjAnlq8cAHzXODWK7Fw1erbEXhxdKB1VoB66RaFGAJZ8Wr5JF3Zllnnu6/7hXKFL8JcWAKwtrhJiQF1nSWwhp4zeWETdipXpf6eLVcdb5jLZGKWaI7AFrd2GjQZBRnUB9lOs6gObXc4jHV/Z5rHM33vIBfjRSkOx9sOCyOgcjB0DCnXOelT4SMXzmcTAjY2B3X8khILuXcqyzohUKqgv0RbQspJMfxBLIWHVgyfKL5YWQqTZDLXMKxVWrIWzuUheXaFvA/CWUi43ttgE3JiSsHaqPEVkhvNX33gBBa4iWUgI1ijPsIyiFswnGvBaPkJwg3NsrKWU4c9jqETXtawHYNE1nDZQ6bboXNB/3ouiFQWUAGJayLhdsS3XCyEQ0fXLcldrJy+JBtjeHYjIq1fnDd8J3PX4+xcQ+fM7ocDGw95QPq32SVN1mQmRWK3ofDso3kPEA2qpuyNzKlFYyNXeLjYtuqVvhrTlcc2ImczZmvCeOAsd0ghWNDEF5Gncw7LK0LxjlOcmi24W0odzLcidrS/DyHFRLixF9MtC0xRRM5ZhN15/H/99GxAmzFsGDp068BtkLVr3mW3iLNeoqeBAM24fWEH0tBi1GReNo6Yj8iwrZ4bC13s+LtSAxS2hIaDveaTqiItK1LwQ4ZFq9KY5fG/O1E/kU7Vgws3+CiGTQe245s05jvKaUiYLzwN7BVJLpy8JIT5z/LfJom1CYO5wsANopw9NJG1R449DzfyEJ6tjO6CHxzw87nKTtk+ctF1vhibCY9vkDXN7YdqQ9rqoVS0POl4lzE41mXAKtmL6Q1OWT0664XN88bTU206BYkYFNS0QyED5fFIORpq/ETzoDVGkVZ0zGjzwHb6dhxNyEnlPj7xvKm5pEyMRv83OalAkmLXcJH7T1tpQhRDcMPJIs+P+CXkC7k8Oo+YAEU4o920EWvwKapsOXH45cMWSDc04GduCLyQOiNkFFPgNX3G5mR0nIqO4HsfGcVYrj4vMzzlisi/IO14UJFqHlCX2x92ESPx1YR5Pd0YO55x8ZrpgUzO2LxNPTApp0UBgfXzVaQdIoq+0k8HpuT3ycPK3LF4RmmXTRewZTu/rdh+QpYZYNhMK8HtyM30ryQJa/zryuBLcKGLUZKhEEPY+k1LVASTGQhvzqWtAgV5xhKOhgwdjFdcLmUsl+fVl+EreVc8G6jtKwmkQUdfwkurZ6xZJ3qXDacdKmpNVtgEnFG7WrdYwksNltJqe1ggcApDj1/AVPTpZhuFDYS35Q07D1dYxKNcoynwDLssV8b2/4LWEg5FjRKJLd+dYRiESxXqlTasbqH97agZx2BcM0pfMnYdMWR6wO8K7sFYfvOdGMSx0SxdvHYam65Hqx442d1fihaqBtc5ARsKlKsjo1+XSFIIrCKSM4sHlazRoKXQ/dKlX3TC0RWkQ9eTEtGYWPHfZdjd52M+Gy6j503MFpquInUrRRPrdRj66Yw2wu4xOBEq4Svm24wWKW1Ybst/KzMX72LZDaRhYeNupkXNkkP85dcV2hPN05xpvjFIrmFtYNlxiW3nNLMWtUanb8YNQdyL8capAs+1fyYqrauFWfbw7FVkqPqweJO84uC00sTNKSdF/XYKGz4FoWU+acUdw4Qby2C5Qkn2kYRyKKSFfvZc3ywz26r0jnBc6xkdTlY+mJWTPa8Wjy2gtXCFzm8p1gCS8juXa5evyyCJZxNyuOGnSVFAkHa3lo+AVbLptcFcgkKOdk820zdY6lqHg6qi1Aj6ljD35IFI2tft/jj5VturSYdBoprXHMl8V/p4YU43ySntjNInOKVldRi8WG9b1a7aT8YTa1xzeQ8kPjqAJurrJR2sK12TRWfssK9h5vFvlHiy5ocqgtz2rlN035WyZUKSxaOjUKHXYfEGGQtaPNdSE1zk/irMjZXISLVYbl7TbGqdvHcr4rNLILVuAvLuAYnK6Q92WLhqUYfsJ42TsSxvH6sBodAcf5SiS9zvWdsETZYRU86bPNj4+ECjXSsmXt41aPvzVW8ij5W6TbkvfNjFA5bldoJS2aODzxOWhZVg3feBfP4JWMJNOlBN7akGiyIYnot0eFHz1sWRcQ4tIu6b9dJVIXSFPmq/sciVLUxTT9WWmQ9cF5hrLDBpJ+BzbDBuoxdWdE2P77PO1LPV8VNFsGCoc8+bqtC8Cpl+p49N9ZWPBxW2ZK11tLYJFbKWc+axILgpfXaSzismpwy6MP+nFrqvFQwFZX69cGrRbB0l85J49VaEf2ycFdrO2G1Gg2vHqvkPKs0TR+wJJ1jQ9HY6pay0fYei6fUdX74OzvijpLCTX3dlQosj5OxJdeZ5AZQj4+n6kaSxz4em6imeV7tCckB056UwmGx25+UdkNYXhdoqVVewoW3YgIWNnurPuwUqwBfpgPfTFAsQQTDki3j+8tyjDRCEn34dCzFk+zhLR7AJskTLf7AbkhpF12vL4RlnNXsJ8AyTntrOdQAR1n3+aHG4rV7rjl+O3qzngd8haJseJ7OwlgLI8NpMCbdcuq8Sj/UaSRqPj+9kznqnS3cNetGKtWR5hhhkaR7PnHOufeUToClRumjIS+LtMu50Rf6sFQRj+Uk4bCcrEeDhBmvmOZpMzW5lVLDcxVj98POuV1HsHpZwB6c4QMvJH2jYBVjq+DwYGHb9AVEoBQ113hbaJuwr2hc3tBf0Lq/9AJCmzaP7pcCrIZsKLUDsOQiYXpxH6mVGt5qD1jdeIdzrNVeK9ImnQ98vVh811RvG4DBQR6rjarQzc1nllnqCduxbVIoP3YQm+U239tcmuesLvHrZhTPzsP7MEW82qbrN0gs9yFXC4fljpCjj2HBNfu0YSTtEE91tL33LWOl9CDNkVGurMzXtA35bPwp8410DZaGrQ9K3ZzpkL5UXt2Hd6sAFj6vKyf9jhiPNacsd+k1fKAF2Jzd6DKM69VrmtfrzjhivcZfGvWNicjeJHBoyeRiGPalS+aWLmZiorAVTv4fbJ5SJB19um9lZ4728Ka3Tmk8PDKeg1a8rvn8XYT1qp7it2MjtXo7JgSl2I/z186ptZI1fIQA2Lqz1Xxo85cEVdj2vV4nel6BCp+X03D9kHr3OnCVk1pyBjgYvIZjNoyttOp0Z1jBUW1IyqNrpcTVUsNXeOzOD968T99LFGx++PscXSgguM6ocTyCpELGljS7aNQl0xQdNOaUt2xsoxr2pnNVp8WhcahLqd1bicdFyucDt5lLUmkeMpad0wnrZVKl+zhkXIQLzsWrnrBeToaNgw2YyhmHPG0ZjVRH4b1hOZUtV84IHIxAZB+2mV45nOqqLvHgKhJKbcfu/1TYzTsbOiZxuhA7ARybbnCSxmZkyaI5td8leTwuZ5MCy1ZnLRqPGzl74gOsuqWedpnZkU9j+8Q0Gwveqnk6wUbWbb+by8O2YO2XFPYvzM+UShqaT8ClCIjbEBYS/ItB+hcuFyJP6RZvO+ou+6oH+beMXTrza5ZZTLH4+Eq2RI21NoyHeWMzTTyOQ1pyiu93Ji7yXtaxNKAhrZpmoi34ap6HPuNxkaijj/vFkCzKvIxGIsmutnwCrsaZroOzVr3uc0nT4BT5dLcTNiPyCpj7obitGTzrvCODh856QsioG/kx89FrmCbNZN7sI66ycM40ghPJIjpetDW4lHPKNb4CQmU5LepHF80kzdeuSmJlz07YkZ2cikPlK2yhrmU+zu9ktA7vzczJtszmTKoajRdN8GVnm4/zKzd26hYPrnrmPf+g+r0IFz4dyRD9hEUzxB/jGAS4RGTWghTLrVQAKPG4kEYKIpAjlQL2drf5AjEbano7oZDaNkT8mo8xRrAR/ILp4WXgFM46U500HlytHEEZpWiS8Z9Pm0fkQeeY/bZp0y71EFcVu7PbdIoGX515SRBvRtrmyCp7G5rHjF0r076aOs8mNT56dKSeTpbgQeopuaQ6redVPHtPmtzjceE7zBR5GcQgSNBImjG9D7XmekIM4ptmV0s+NB5edJooE+m01oFq+ypcsB27fxm46cxuiXm70RkwmpywXhT+NjvUvsNbQdYJp43HThEbX0PtFIeyOjaKCD36dPtwcfY2xuuEEJdYzi6jpgIplRfvs+vlHMpQ8xNwsblWhqMvQlaw6b4drJVR5LOdsA97hdO1Olwv6fPC2HBi+zRA+N1LTlsmcUkd3bsL0o5Spuun3ijrmcIjReBiALwzfh0wippT0Wl+BWRMcIlZTgDHFet5ZBK1LlD9Zt2L1IsnoGLJr6fxEVOZV/wuXZGNe44ekc45I9NMzdIh3kXet9bpaX2EODWT2MniwTEyLXW4FVuXae/cmbFIfBsBUKl2zzKOOthgJgu6xzpi6fCaMHDtXd5DvZpVuIRcOjnedFB2zTMLR36GF+slc2+E324CV3GzqqPBQOAqF6x7L/TO0sulTlEYLi2mCBQPeedF4EiIEU/sT3DNEAPqyHTAlPX57BmfDTsk/G4z1y0h/tXehrB4Azqfh7Xc6gknjORA9E1DQ0/+MZu/kuiV3RUpHpY4trofGuHk9LbMjyv95Yx8GLjGEFDH3rnlND+qlBor3OYn7MVuSfCSx6wiouU636iz06e1ePshG/uKSjkYBfc2z/GPF+H3mcJvygBOyLk/JK0S0hP2aevY2a1wQjstcGHfs3lmdNJqpirD9GakTG/5+vsJwwVLbJIO4IL9mG8foMRVCx92zFkpmNR9HAdz/nL+Cskra8DxDUjAtat8yyEmCaGFqToNjhNPPb5RB+AU8cdeGBtUqRo53qdb/UrPvbYzcHl1RLnH7iUqxWHnu6vwtr2FE43lbFvyzFTpSLOw7ARo077aST9a4i8nAA7fIFZtRLe76qSp8qo+fkfatqvb+yF19kXgYPYRY5mcAK51cimMfRo+Tpu/oagdadMJUTH1yUjSOfZplTNmafpms+w89SkeF2x+dh+RPwtL/Zqmr6PVnaIuEo+L3G0cZTtk9qupT9fyjYPFUtMJ4JqUXBGA+6Fa/ooqKo40pVDio8e24Ui3bCfdBRpJz7TFX8D4hk/byEV2yFfLpXTaS1vismU/wTw6Gwlq7sc6hklpN019SrsFL1Pj8zTfrFP0bXgluAiX0VmfcOvuG5lUPB8MRESaz9e/EWOZS3wg0jfS4iEKHy4a6bqm+6ycPLXxWqLExdQ6HewYRjw7L3mIlyBh2yngKA4o4xtPHI+LgecX4mKD4Rk3uX1DtN9LH0ZZkkqeJkKFBdmZUMMrIiVtORnTwVHRADGf9ul92LrKHszE46JwRrNh/xiJUGW6QuxWyLtgJ+BSM+a5o/PFm6ZpBRvyuzf4l3C7AVyejMX6Q+EHfs1r51H+KrNNPhxc3niH1PuImEBES8/zpQK3XzR7huFiQygHjP3Qotm8FBvdNFLQFm9B8sYDbQcsiPi8GFuBM2xntHkDV1Np2IujXhCBqZ7vQOWbicbXC4Cru7dch+MGcEDz8jxwz8mx9cNzl1K2wgrqwQ7UNeCal5LkBAtSkHVaPTgRLmx1n+9ptLZzuodX5gCO6g3ZRvvRcPh1fnaO6s71jCVDJlFzPsS8gHC4IZ+eroLgH7kg4g8CV7fstSUd3liswaVqe59cisclGUGBDaPGnOr8VA88B8x+fBkVsAyuJflB87EkhVG4GJcTQuK6cfK85eF9Lkxomi+jatJestZwhyY7K15rNgysYKjne+XUOo5ZuIQZcVV2UOax7UAAO91OVowjoydcnAGXUVSjjEsErck063XhmEiPl7YhLsfR8XqIp4taX/Oac0Vrt31XR4PTLZEfug8t/q7fNs8lkTS1pvEWXzegkpwPiaci7+ht/srTEs5aETsBnCLj8oOhlSqSnunGb0TfPYv0E3ZkcytpnE8vGaJjFxRCkBIfMlL5S7EfR2mnZhzH6ZbNRsGlckJoReUvprh1jAsx7Lw3Y495b3ICLlpyH/ckcd5I572ZV2OrVYrH1fBqOM4HB1WXgFPeKcaPPhYqgLGaPewoYMPNAh4aCgIjcAxftLYV5Fu9DK84F+GCL+w1vgMEuNjHLmkklQ1cZDSZLw/kekpFh6pfJABtY1x1XsoXqabhC4ofmQYuZ39EPSVWVMmUQ46POByJJqdSxqZ+CS5xzh3EEyEBF0lW0y7MjV9+RrZZ4V28xXOfApxlcl+Mw8QlpoNfYz6BJw64sArNxmFioXb3vEVE5pdafDGnI88k+93Y0tdLitmXVrldPXt80aMjz+yKAzaMOPCO893d7CaXE1hqgYuMBCkPb8mUZcX5ekfTZhbPSABcSB/IYZ3tgE1cY/A9CxuGw+sCNW1JkGT5gbBjBa7mntzir9iBq/B99ICDRjC1gqmwn2E8gEtr5SDjcBKrePHplgjA6ile45y4mlElj2TQRw7ZEk+GNNVTfFRV85aYrbexxV+DS5Ctt3jlKODC4aGm+tDiL/HQsPewiPFqL8DFaS9ytbQjm7HWPD85p12r5fhRg8omnSptP2b8dUYMoggLeoq/eAG4ju+RpPz1DFwcmhaNF1eq7NRBUoagQA7tSJP58TnGBUyDUjw4fNrayWBxKOmUMs0EUioCOo+X0Ca4lvvOJFnPcNjCUktPcsKidXXrB4r4SzajFvbEabx5rFtByi4HigSVMgHzLQR6hqovccF6dNFTbjUzAuJ4IXeCMi+WWPc7Yhap2Tzdt44kF4lgfDMLwOGN4KfGKYx2yXneRzdlU1A4LtmyZkn1mLnnpMW86ouwsUol3iwKSV0pdzU0i+2SdvCFuHrelcVOWDTD5+06REUm1mljLzVbiWeMAypXnLDq9VDW6Zc6wy/NYhjs1HhPptSspHrf0JO59zTf5Nd2jap8Ai5eX6U6nFNCHKTzc4AMXnCi402HbmopkXHyUIyP7LRPh8FaYDsurn/DwCG1bdrSIU+N76G2aY9GMclSenjjR2WfTtFEvuZD4MoF7fFLSVv2gkF4+buyW8cR7B6zkVQ2lumrs4ZwxsoJ9QK27OA7LMmPgdOyQHUjGSnLywnbEqkyOVV0iMv6/GCxsaOrnVDBso38WZxcOmRLsLxlnnehVs4IxdsS9u3sHPOjqH8VLlaKT7iQacg/aUSGU+5Wutt0NNKokXJCYy1w2c4iNIyyrLKzeH42sOV2glAscHXOEFF58cghq93mJWBghzhKE94cVx0paNfSjoVaxrLrvNkXupkTHLaTBMTkGdoBcA0ewuePG2IfLSesnPG65fPtxRBc1/lh/sYL0H5COcs3N3ZGD2vFi3AhyS4W34ta+5YzuUBGNRHTnOfH+G2P5eLV2gCLL6YDhd9ClZ8yW5+TrFVgPE6wH31T5IQ5X7+txkdRhHvT+TU8TNrFpk/YhYg+KqKr8a2uirhjQ85macKGQ8sa7q4lbcBFgu+rRREV16Yms2eMA0LGGr/F46oZhrEc6AtRLZpp1CZ3JIdDhSOkJR4cvkdelNRj4PDes1fWsjMjWnxHD8A1BMbs+zgATpOSXWMaHPa3e/yVteQt5ZSqX2/DUrPqdf5uhuoX/VIoOAxXobh7/tRn0K+C00wGp9liD3Zk7uISLjkNcOJsXG6DRdO8gvVPJCHl8/jGW+BqmdvxetMLcVm+oHl+Ga7a2XgbXzIArg6Djg98wDwSXK86bfurOr6jGj7HJGXL7mRgvRo8Epe3Oi1hLKUoTnbOJ+ASEvwM6iGw+KVqm1ZhkuJs1YjXTwEuqhf7gONbVTolt2cvdoUNL3KGmy6b94IzfT1uVLIv9GmFcPiWxGGm8JRTKplAmvXrqfSOK9cq08vVSr30GWG4OM6Bp8b1jx0cea1mbQfld9M5i4aTnGofODKesRWOrOxyjPHTgsBFOhCmXe0UXLytO4FHX4RMIGWXNbiGiySOrZTZiZ/qPZFmOz7pFCSdCILzgdo3wLFGXvI8OMvY+vUEcEg6PRk1dsbgWqJ+0qzsNFvL8kWZOQwckk7S/1/10vZM6yXTWj5emSzEM+OJbqlk+LLrqcsyXM2z9ws+xDBchbQ0er2LeMcFv1en9yHVHOSEfajsK/A0hFWTZp3WywKkxLzlhOVqOFott9HxoiR7n9Z199SRJcRfdgIXa3DW23jsfd2isdWa5E/R4GwrHJa1A5vRpfi0TSShWYonxQMuQWrsNtiMMGMkj5vNNGvLCD8uFAnDcAFVK4OJEeJyBA2zZSqEUwg6T1BIBK7uJC85cP+yDJwhyCknDIlL2wrbqMp1UOyvnw8V2QNCCpgUD0p6TUmu52M7LrjnNG0RtapYi6+9NZywmqR19VNwcd6hWPjcKnB1z53zAPnACVsErubaejxBkviGCFiz1ZFZ7FZsWnWa2jit53gddKE6VmqCxN+OLNoScKwq+wmq00J1LLiXIShZkGQ2hGUIqeKjRWdrXC39FFA7oUqOLwtQEitl0wOd0Owaaj4/Po0Vy1R0ij9juy4W3ur6da1lqnL06eI9YlLEVCd0wwGXCfaYXAXFziudvkFCXM9EPV4CV6iHZZV6oge8GMBJydPBPW92uqXwUrCmLef9tmBcWtzBpT7dYbUr01aLl9UDuKoKZ3Yows+J18izDezVC9uU43uGAU4RfiQ/MOSz8MxV7Rczh2HgnPqc+Sg4dbXplUv5eawiGhw1snorh6o7VIHBBs7Tro0t0Seo0QFc4czNEFSR6ZkzBCOO/DW+OUJJwAO77oOS1bLF2rdzPLGQknsH4UX3MS5J02N0wEWpvnhhd6VAVsFhvj60tAwXsrLUW3zLsBbknJ38Vr2ccb6MLQQnsP4B167AZqcYjcLe9XjFYoAyx2vZAWKrHZyaz9cXjWzn8eIUAIe8RDkWfShuXGM+MuBd1CuDwNUt0ybWwa0tcbVaFtxutkouHInHVZ2UbuVYPIyXt+krztaTwTT2ExYN4WIfCX8BFwnUp6X1WETFR8/tBFyuuxjzyEfnknV6WgnrhVw39fC7W2WzTvcuB3DJBdX4y3BpEcTA8VNYymYdyykPUZm06cKpmpherHoYKhXktlUGVxQ4Xbn26cto+jE7gb8WuBoC0p6OFXcADSnUNLiOVZMTTKJuKVkyv97nR1PvHKCavmlXhNwq8YumG0n62VV1yI9xTnH6XgkBIw9AfOlDN2mp9v5p4mUUNgrj5umVo5huib/BBbiWMh6SY3Ud6TDaaUHzWNF4gjyA63ip3m143JTzx9NVfdbicjy1ptoG20A1nX6oXqWkFpiOicn7qPFiFQAnqZLFdZhSLykPN/XOkd8TcLFgxa9xBIsDz/OdcfTWKifAcicTXxkv1wpcyO8QM8Y3j2nbcsYJq4daJZbdw5C8pcVfVbStssyY8ig1W3NLQVVV6hOdgIvUxrBT1y+nEebTj003tiiZEeND/bYhzOnkBRvsQla2FkSNFKDzHn6Pq74hFBYfqB4AV+OU+IIZg/rcihSPqyLdlDr0YC0h5ZwPO7Df/aIpIQyXSndrBwb2CY60DPMjPVn39swUD448C+QoaqeB481L9hPqjH1LVfbhbjsEjo46zdcZtZ1AyA5wJLorfdT3B1xiNh+BYDeqx7MzAtcu6FBHPnoRLKxWyym+HNc3bPuUDlj9bDXNx1SI36zF8+db2qh9Ww4sV7sgd35hnbEbZ/bbCbAohTGiZSSuuvOOTeNyDuuH33ACl8DgVx0WuxMZeKYvbqWbanyxG7DI+0um4VHlFGd9mpARn1pOYYgDrq69s7t5tF77Tpw+XgiBkfyEV04tb5k5n5VDrUc5e5nmYqzGJlaLH9cHOKmlZDvWV7XmAsb4CU9oGQY4Y5uJDGv5iy5gFDGOxzegAldPjk05NIy1sk43C4u20eML3Va2zGzd7FAInHcq3tk1Q0j6LHoQD46Jkhy4ul1iQBynuvacTsDFKmZTGcWKa3C1gqxOTjCMZUPSXtswVlzTQWBUBm/xraZWN4qcih90ZmvaI+Ay2glDPQC3j2T3sb1HDpCmrzetPc8clHhcioBJxpdka9o+eM9eJb6dBbhYW+G4jp0WfCBlzThn8dmLbNSHqPVTtaqfElkZ+Vzj9XsAjiq3YsP6KemO83Rd2Ng25vFiUsBFJhiS341w0c6k+VQ6Y9VLOWEzcmi9I5Q7MhnoHVZkuqwjrFVJPAUvwHVSq447vNfEw2yMSCfUu40tO92THOsXzlXMFjB/dPi1+AYJgCMnqA2ZP1a1nnb4tBTP/AFcrahYGRbjeM8luqAzn589vDMfuGA9mtkBXCv6/Zr2XxzWIFy2lZ0Eemw8JJey4GoCqE5gUQMuppqk1B3FjFLc0nxNh02MJ0QetsFkFCvHGqvWgKPoLP61ExatUz2jjzuGRaQvuKFI9YymD2uUi0UwXMaHzPI0oXBlF1xu8eNKwEX6QElybDOSg3XB9YvkdsJUKsBZpm6SHws/liQw5HegAsAJO5IjnP1A2WpJzCia2xktjOY7nWvuB83jkhiE1hGJRXiXlbFrpzdYiFEbwSLzWJjjxROPGbt2Ws8+vhFUJN3TNVRFsON+QtbJhh3TZOMbQS/4dzq26hXRcHyXlfUtZUeYe9a9ElIXlRKfk/UNaUuvZ+SZ5JBHPB1/e9s36Zl7/pQJRyPdcosn2AGsVnBm8oHZsiW42B2cTrja7GwicKl5vF4rXJe5YndYOPNdS1vm5GY71qu+KIdOXVVbeE4GcLBOslNVnJJDl8QdGW7ngcvIFluHfXBrcFnLOZ2gdwtcjtN8gOpjTRwF/8/3Cw/qW97gnJraEFexnuYJx6w5Mr9yBq7KcEOHtTf2MvQ8b+xzbhLPdQpcVuBTfBgf8qKkzFOzqFvKEn4hAVxuis87vK+F52k23cOiO5NjfENmK1smw5KNQMkC+QLLcMwlXlEOoGihUh5vQkMIPl++qRnxYfzoDnApG6uHFOSZfQzzhNaI2hocWDphE1IBgpTWZYRLF8hNUP+RA8PhRr7uDHcyZotYhEtJ9xUvTgZchTTww4C+kmxkGpYVRGInlOoBS4tQFfpQQF/d+nyBwxKSghRPggFwrSmCm2F1FG/Z5x2zkmS5n+CYZYOdl1ZHoEgPMe2V2SGT4ykUAKpgrbQMCQkRJ5R5Byb7lFq8bDRwIZZtqnWMy31BVRR+sMGreDyuVhjLDy3iGlyiJLOJ15wHLpJzDzVqeA1W27xogSI7xY6Ot/S6lcQhpOFyNfie+TiqJus5/noPsHCSReUY0fOqNWt6SoVDySPJRudDnaVrwAmZFnMNbwcGOGwQg78ckg3UfMF181ID0rVqPIF1sw3usrU6nhLuKc2LXGH7451KvMG3rXZhhjSK7ClWYm3BtWVKLZ5SDLiwwXrSY4dsDTipqXeJn8cHOOe47GgAml1q8xfoLLhdkMkFgSJjjrZkx0jgFoHLqVL20uLB0b8US8Mx6H0DzZrFSn303sOJ1IGLRKZdDphF0/kkU/KnHpx4XGSlQtg9HMdnpWK6ia+6eE/xMwSNnDkppXpgHy7B1QtMYrx+LXCV7kIR6OuwqOb49XF/qXemcGg87z1gIbKH1dADbKakQd9psqb3YiPdbfzNrG9tF5of3hw5e2cWkPojkG4lvkDlG6efkdWOGkoX4RJFeB/PI9b6hhwSae2w8ObchfO6oYl1oxNqAx3JZpdyTDeUM4E6TxFPoqjePLzNDeAMx1nH1PeOjHSeHd7w7ZzRAAxcyDN3tq18aNG6pwXXSB2xd3yjrCckm7yGGxWresoi86PC2P35hOIiYO0TyXasI30NOBXHpuzhUnkAZ5wikGHlFHFeavP090pSzHheKuByqZ7KJ93GPgInbZ5CEgFP4g17+I7MGyXJUxk2UfVkdZ5C0pIYkorwAgFw1QLb6MesY6fjmw6KCY4k+CkenO58+3VsHql3Ml1i9EIhHzth0Rp1X9vY7CM4n+f9JImTSHyXs5cNKVdGvDM8ZAiZ03T+YjBAeoI4KnBRf6SVYWi1CFfCXm7xhTjg0syumzbGxSuaaaOYOWodXzUFrkb+2XzgfOGHpmuLKglBZwuvLQJXdyeR2DDyWLJe2qzS1Iefr7qL47E8UE/BZcja8Y4lHpdoFztnseBReoovcAOUeUe4MSwsLjpcMBsISsPzZ+DqcF6pDMcH4N18nvVYvSFbjW9Hd9lya8majJ0y9mqZ7yztVU7o6AMuGEKvZXgh0UvO8/TAMBps/k4nrBfS5sIuoJFTpk7qgvFS6nnHF9+Ay73uGUg5BZcgALhooAvCpVsuiaWVQ3zwvUidZwmGZ85F4tvSAa5q4sT4qGmgI9udp0xAfEiGnPAbCeBSNrX5AePR7GtxnBe3b7NZJN6J6eaZOkWfyEtHNZzSyzy1MxLZVM8Ip2xLakK+1dGi1dQXUDurc5ArvMINXFiFquOr9TW4ENCzuSmfsF5a9gbT8XoVtfnBKsTRuZzgyWxr+3Tw8NqPkdA8ObCSMa/UM/Yhb5XbAQ9dm8yT6IqZ7PF9NK62FRhEt2NKoavAwRuWE2odDTkmwLWx8dCW50fV2QRULJ5tFrgQ3POCeZi2wNV9rYT24v50NrDE1xLbzpp+QLWwcyZzfk7C4Z6rxNdw/Hnq+VADC8G5zA8VMLBKJzR6ABzpKNtYjre7WZ3nn/KaKHt6wqJphwUu4wuWnlXnL1hgFa3mesJ6keU9jUefsVHzguZSp7DaCRFVRwSMJAkx1QEytJJSrgs6McnklZqeAK44Yp02umUp5PPVea1J53Y84ZD1TbOJl2MzmuTEajovpJncTlBOBjjEwsmHY0lI63uu8zyz1EeKn7YCLKyUcHqynGEYW+48YuEhfqdIlzQ50LvSWauTeS0aTydMnwKXWEIQd2ykgGlOWXD93JKXeH0/gGuJi3HAS5vMD7cYjmq7mO0Pw9Vr7ZLyOV4akVmXEk8o0/OWPbU0JjbCTm3zIyCm2B4lvrgIXFJab31Uf1sUeGC9qNrgJ+AyU0kH6m9LzpdWZj/xzaXAxZ771I+1O/cGt7eAtYlpUny+2SnTVan2fEhjuDf68vlrF5bW4+9sAQ7hqeuBxrd9YG+6wtipKN/jTxpluprWPAo/WDUlx9M0DYsgH48fmOiU6WoVAW4b4qqUTJ7fh0lyfHdpr1tydxlSzAKXlwVUdpykKfFM8MBVKaV5jJ+61NJkvuFDjG0s8ddJAKfSWzuisqMsaVWdZ2YVZ6PTKSuH+MPSQABE4RjweWTa4uNYpzOY4LtsqTS4lusti8SVis+TYTrJ8U6Yzgeu0ij+O0BFQo7e5ssDFSHMNarZX1SxXo4KYVXKA0nXHRe27PTlBAwHDli7UqpahqsxwLXrDdw7LpJ8zlOlF2SAfmUXLsPVKVtYh6erqV7cIL+0tAjfclUobhEuanPVkmsaB8E7OLvQxnkhOF5LXRzWMHCCoDSl4ZJxpH6+OICstV8LqZahMlYzbLgTDUn9dGTfSmNcZifA6qR80evXmsTVaqnz9e1CM3+tNX0RLtty8zoI7JfBMk4g6TU2j2WwhASDUkawvCabz8OQNeerVM7LYCHma1QrHO3CvQAzX3nb2a3qCbg60kZL16/GkKd1cnPW+dNl7EyPtxptQwQl++jHVVwlW1kwldk4KMjyZDyuyjn0QYfYjqstGPAj5Z+eEUe1zWraexVHuFpaMNPScmOlw09YLzdSQ/g4ZSY4hHbzPcFIYpsV6eHGwzdsemoQ6gAWGWjmGdOlFLIrpnhYteAo2/WhsR2XrOC7YFvgOctFNswy8GE7Ll1BdSF553A5Yb1aQ9I86DVaZuvHNe1luPAuWo/4MF0wpI5Aqly2UgTh6sgtS2U7TjtiE1tdMBSHD/9MlRQPjq1oOyXVdVzslujTth5+RdLVbuBluFrOnEcek2Fy0aQvoKXy7OWSfiEMHH6+XSXD3M1iWsBJZThiqfboYwYHtiGcKDpQIF/mnj3DaV5Vn1mGS3JFUFrPcc+tVvgxOwOXGTuq8zicWuGeGzxLbrWdsA/pVHI9oLO7g2sLKJua6S/IJ4PA5Q2mTut4yfoCwiYr1mASz0CF1Wr77esp2XND6JGtWzwuK6W1wdzYMlzm7BMv0dUO4kKcWKiNNnJhFLqcb5bdu5ubhe/DggRTSDl/vdrhWC3L8wz3yCLkUjgvDBcshpZ+PWFxJvFlvi2MF839guk6DJYawux0oC0MwBC19gXZsz9jS/HgAIoKp3odlqSa+gLtRUHud0I0RVmuVJoPTCJwwXLqvAvTnDxf01JfhqsgC3MfmA7iktptRXEKlrWfsF6ahNHUgYJip3DSCq1CUviriceDa2we0TY4Y9qzzs984FtMJWeXeFgdCYQOmjp2XL0taEcHqtRFwk2icPyZ/c062Ib4RAvk4ZAZtKwnnDHZxHazcBWXplLpEGyesCknmKB4myib9YQkYtBclIR0t22e5mJIRLUMV0eKngai6vs+7LqgaYrtE83icSmTS6/+iXNldMgovLqg5mZIMVu8UVTkmIhwio2MorHRbbrsRgXBksNvMonLitb6uVDaB+DKJW32S9vCct4nM+PBubLjYmzx4RlkQe0N1lVzCT9ptiXnzMcggV6GK+89F0XicdVsJGIbr5f2Mp1Ae2EnhJyBS1VgOwYFKuLqeT66p/FIqukEXOwJ6/JcKh1afGRk8ykZnDTcoscbj7bxfoDe7JA7W7JyJBBjv1GKB1cEH9jLsZWjGvR8AkPO9SpngBOaxzZMYAzHMucFNR0E+yeY/bY1yo37ATMixfN8tyLs8FU652W4uu6CNENcxtGaNN+FKdlTfH3AN3Ia+6hLjEXTlHW+qMNJHxjZEo9LinIUrB8yHo1zVfNaVvin+hng2M3qrfVyDq5eEMjFHzLfnN05uR6qxFkzRH3T5VPO7kqOL4H0DWZ8l1s8tiO9zqvGkf2bkqQngKM4ruZxvYAl/3naC8owmacUjwsLlo/ev5CIw+Ybq3qyfEb02De4aUTGw4sKcgrP3yspb6cshRflctqSdA4OHDppCNbzAnEkCt+6nwGukGuxHeDu28H1ukDkhONCLb7SA3Bkhc1VRkUDaorO6xUYZ2v5Kx5XY+uudR2u1y4oMzvh3ZFex8/wEBdONMLiodlvvOyctoz4fJ6Th5eJc954uHgTU0a41Od1GFhsbCd0SQCXwE61dsydtdJ0XoyhGTxMja+kZlIDmZJcqR8oE7fS87xyQatJRGv0FDvB+R4UppGvdrk8+S+dNFCWsMLLc7kgKib/heiRHYlQXds8CX5n7/oJ5rHsigycwB6YEXyYXOb7oD83e8bjYoEn2TD/9JaSzBd5xPYrnRSPC36zImSqo0PGFub5MjHcfT1jvequ9edteGfhzUtd0AWCreHxRZ7MjqTcsh7AxaRz+i6GxGQWf5ELXOLsmjwyGQJwznb66QsZ9hac0JEEcC279oFm0o5L2nypoLHFTuOb8oGLggyI8w/dxTiiD5mPrUppvfb4HfksTKY+DIi9w1jPayYVRI34JlM8rtrxic1H/XHereh8XxJlHaTHb0ZhywRTs1EiDTOT5/uSYPH3oKrE46LpSOP+OBKPLZgsq1h2j68zZmW3REm1j9er1xUD0hR0kXhjr1vNsPZlHAF3vPQ8SRWp23OP34e6qSQEVaO6R+dweJ+fDklCKtMTtmEzKyTXPXIB039Bt/fSqbmS3U4o6tjGUl9JB2ziCtvRKsej4zuSgKvscWk/lEJ3CmzOp2TU8my9nLBosFTa6vDevWcpK+YBpYicsmgkWip+7H56FbiWOK1X4sF1ctyMmwo6hWyn801N8GfS46PFtu38Gz6sD3T2HsyTjxdm4ydE921jmqQ2CoLXwII3Q7DTw2cdActYnZWhky6w1To//d2tST0DFjdgpqM+YjoYg8zfvOg+2RNfqvItwd6TxO8QuJpswfVLddGW4q83fSudXH7j7KWqLlAeFl5txzcSAJdiO7YDkZWUvEDs1cVbjZ/kBK4mVPsZXm92IYHRfN0UoZmekL341g0BhYz9s8DbLRh2FEqihg/t575ROdPa0I8B+bzWa2sc6opvrgIsYbObtFN2obMx+Qyr0TfThDhxiAqGZX5YidPEfkKW2Tf3IkOij1Vnq4lTVST8bJW05URWkbEttHyRGL50qr33XOLbMoGLGp4ythnYrDbfSaVai8RTHwGWGvlTj7WJ9Z19b7q6nUrNEk67SHCtpw5HOTxjrVIDaFrUW71fFVlbhCtvCDXgVYZHrHXP08VSJHzPQiDxsArzImnj5ZIFehlK7YAe78CAi7WpWj4lYn10xihLPK+E6q3UcFpkgqOQYT3EMUZwXucFyxuV0d3Cq28A16nFcMBJLzGMzagTG1/xKGXLbIE7ENi3bGVF4pzYAJricVUqGbY0xrXEgpAjNad0wnpZdpZln710P8Xs81PGE5ATnAsyCRlXS52z/fPjBYk60fHRR2WJCu5lbDywWjrdrUjpMysl/pDVDZ8Ywfu4iuPk452O8IUtdF8L+ITh0ppUBgKNxIVN6HWBVjmS9fheCOBqysN1AFfpZZ7dFFaqntA1W8jtJMXqcDS6d4Qc8xSFilcp8XR3RTYyb+/iViNclvt8dylVCzTFB1OyiZTUdFQZqClZWiDlnXkvFj8sAVy8eYYNP3JFWxMM5wKSwgKf6RpvFGUj8WLJo9m/SglDW9BIBWQWXwIuumUE7WlIp1NTxW5cUNrGi6SWTsBVOfAmI2NPxdo0LxyniSKoJ9QGdEPcVsYZy6J9qPu0q5yByxHZd7YDHzEeVFaclwdBKnGC7Ekptg/Yej4iN8GVS22B/iQssSIxS/HgSpPKLsIhriIL9CfZLu7xU9HApYnNrKN0bJEFadoEYVW8J7OtSapyZL3UVohP1g6TJSfsw04mANUzUFGnZldZiUbVtpJgPGQUBC/yz9Lgxk5oeQMu2Vtyhu65wmpM55hIEjKZKVM8LLNUvdkwtmfRbDoXIzFhP2EiDrjcLSMZO+aeBanvApWrRDaz+L3oZJrh7enwjCGczPNsA8q7Mc0n4Np3vo1AWXdfcOeHTx4/gQRQeC08MF6sXzBQvzR7biYnaAoBV9srhQcbnDt5aKbHWkyRPp9wOdY3uN2ShjwlNaWc52nV1dgRWOID+74VTT33PsYFT7dAHy9xZiE+6uibuFKitI+yTJjEnhbQqu/StSfsQ3bkVGmnVN4ad/MZxanOUdrqpR+rvKVm85IuJs4SXvidX01bplCYtSM0JYvAqSerKT7JBDjBu1D8+lBlIF2K6Lx4Zid1i9dOAjiW+/QYew78tZQy3XvE9naXeO4LgHOktmk4CY2Es9Wy4PYvKw55PK5MwSt2pusp9cXOynMOj4UBi+pk+ZQit4rxv/CiKUAp4u48CvDZ3jVN2FcF683iSTyoxqvnPsygl+QtxchX2cMvJGrZYOgRU12VW2u9dZmng8BW763EX6kDVKmUeBrE9TudjM3PdVdNZ8jKExeOr+U+ANVXqNayr7RLvEYNQLE+6nXQFEZcK1RrEbFZuXidMFxIHuTzBNz1MIPcFCt0NUm6TJmw8J1Yt7xfLg7u+4irlTadiVUjT3B8bQq4qJfZfVDGAa5c8vywKZKjdAYlN3CxRzyNdDWZO+V5rsjCRc/xaieAxevZ6kc4EwCuVNPpG0zmRGfQh1Xh9ax7GS0Zb2anA/mSkPGd0CsLVAh498RyZDkY28n8VjQlM2WKx4Uf593R0HKQcWa6LSw5G1c9PuaQDSEbBRGGpkNM5wfGsig7pMsJ+7Br7tYG9+jApSbzPfbZUtNWwqmaqm7ZC1LXT2WpPgDXROZlUOHHfiFZHAYOIaDU0SQ3cVma7wHGMUuu8T32wGVUNU5laBQbgoXp+9laYD96PO0PcJGKFB9aR67ZU5/vlWX0qxbfi15ty/ArJIAYGQ9vOn/BUqk4UuPpqYGL/YIUUhg4MeqyzuuFFsQBlk/BpQgDpAzsBkcpk84LLcAzW83xF32VqnjOCsYYV8nzlD+l5tw0Xt+1UhDP86jYBliW+zzBSs4IES2eeAqw8F+Rkdw1cVGsyadjKbxZiqeHBC5YQgSAR7pkuRdrW5A6N6tJc3wxsW2IflMe2XriUpmnaNoJqHI8ixFw7fWpIS6csXrBuPHSEo42veDnCsLlG1n2+EWOJ54JTnWesr+W1toJDW8AV00k6aCyvQoXB87aGYGHb4ql8pFsLXGxMjAd2HMw+EI7OwyXk132eu4MVGU3nvNhR0P6HF+Z6lvixF4/oldLcCXNS2nCbXJYIbzjDeAKXFmv4yNGTWefLwy00iV+pAq4dDeMycuRRUuNArqzi4Z4sbRTFq0B2+6Bz8CV4cySlvhGnE5lLkSnR1qoCM77vK5OoQBija8OSKI8l/cRoQyNPtLE6VGWopmjtOHVAeASxN6pjTfjElxwZbmfEFkBFz4xh2n1jICxiBZY/HoCLJyaVrWehSsnxGbhxVLJW97lgkbFgVWxYlGKO4U7MuCqHGbpaZi4VLJ+Tsf2cM6pxPeCAZdSS74ctPW8fPf5Lo8G0xHfEwZwCKoQ5fZhVCWX7bsvtImkwb6gdgnCVbZUEXNrOkDQR3Be+oIbaBj8El+vAriixhCujxwZFafmLUiGEU4nnLSyiVfzPDT4NCHTLYqARToIPQHWru006v1dhYv6tMjJ+gm4KDHgsI4jg99ymZfdpZh2bvFX0FK3rJzkyuVQpcpLm2/NyZz4OUEDGuAQT9V+NN3sVEqfbh5g8TTFj2YCHCIQLNzwpDX2HE0XdrLarg0j8bjYO1CbHdqRbWf2nV40HO1LCuUgcLIlZP9dhjXGVtigM29GMhvT7ARccC9CaffRZizW6/xtWe+UtQxv7gMuzZqsH7pV4hyWz4+e4jvEp9R4Xy3UJNDch7WPxo7MNt/1zJLVCTUC2UgD2aSNQsY1h2xXcz2BulSUrG9CmqhzcBVHzhkv3A1ceDlpesxNt1LSfC9c6Uq9gDPAIWrKOqIuJa5q8wTjlfWhMyoFujndWDsynklwrCnMW5BU7ISSt9iWS9KcjkjJr/JpRXtvF+4jDByzJu06NiOubb7Bqqj0JPUEXNokkW9qzKG+ClzuiMFP0FUDOBjjdIxDHeDMsJ2mLyuser4QPQgC17YEZ9ProG8duFrO8/xv+GoQHqQzcBVyqJMJ+MiiAdk8WRoyNKsnaO4AHElKkaWNqqnN8Znq/A0T3kxPuIppGweHPI2jrI4frvMNE4UqsX7CeiERLFlG9QJ6szKvxZtz1+wt/gbXt+zK8sTAeHAG0OcLxJnzqPmEfeib5MQOl+t968TV07yiK6uNtZ+QdfpmlbpgA1DOy7XpSqNzUCPpCYvlFMvoMlqsmlJd0C3MHX+CVJf0LfX9aOkI1oqxxrQ3xMVLgwIWDEZmf8lwuVzndfBoLvbJtHhcKslGDCWAlbPPC+HlRLLP+JErwGrmvY0mvYlrxbwmyfHOUBUGLgSFOMn5SA9j45Yt83FUtnRGr5+mjWSpOhraXIUrScspS3gVDrhESXY/jDfofdJ0z2lOSIwkXisDuAx70ct4vcqi4eGEz1hO2Ic9w/amUavOqn3ome2S4bZe85alYccfiA9XxL0IMcn6Fm838ladFMBHOEuwaLpiGDUhRSVN+wmLZkgfmg4XrdqKoU0YxV5b/D0ZcFFnxw54aOt5nhUzkXDC46nstGyksUs+6l9snKmbJlcsyL+snHBfC1yFAVW6fitRO3KnfiHU9DJcjn2oJ7RzA5eW0ssR40FwyDemG/FLQ8iZLipBYeAoMNWvr1hS3YmKZles1l9IBIaB6q310SU0ca1QTebeqJrj2Y60crCASkVXLceOa4GYa+E3aCc0wgGXVEQ45UDDGMGtUE0uLSucWHxPFcBxqKYNyjjEtUJxvTR1J+eyxONyh4tKdXwRsVsQLdMBfmm75G38Za3KhpxWsRp1ZBmtSp2NPWAZcbA1nhYTuCrbcwZtLMssCHZI6ydoXQMXG0lbPjAcvVuQBfLCMI/kD831hM3YOkLTemAsdQdHIgKbNo8dAVY81Z3qhp8uRUcebYVYbSHfVz+BwASoKMCAYPBAzOhZEyuead6jVWyW+GqVbtgZHDS4WtUhrsxizDSuUks5QaoLuKgpn0bG0ffvebqCX1wBSuMvkoCrk8hBBxEI9yGLndPrRVmwnuIjK9vYaaoDlqB9H5b5i7+yk/KcYe9tQ+bPyZq0/5IBOASxdbYvB+BEzqCEAzjdLyhGJyz1mqdBOQyr537CTvRSKK+WRies6vwlGSwiFVMkPgxupGqFu7zej0Nce4PYfO7Cns7UT8AFK4V9eL20SFx6OUX6QlwIyVItZ+BCKJF2Sz+0HIwUL6sxL120Qp2CcDUhgONtbaJa/AFwtkK8pTTRBhcdH3uwk4pdEdc7xIhrhc4acAlO9QknjZ1UqXYZVawsq093lxZukFxKfNbimyS2O1+/2CSuFSq8pVnjuH58aM9GKtup/NqRM7ZCipdWn6zPesJeZIST87AsbCs0hHDGmpvEE0do33hB3PU6/eKOa4GIEDnoftHBFIaLLdV64JBV5L7TxUXL2SlHlOJx6a6EY8P1Ul5+Tq+XsSoQzx6sbKlC5kdWZBqPOgKnFy3lLwVHCxSvoAFw3XsiEfOR0Iq1Y50vwglviuNpxixtVGVyyUM3vdPjTVtGZHeqX7eshuESpcrYNVSUzJM+LSzUOUlGBc8584H//Sf+1Dcfbh6BBn//9PDxdv8TvOnj4933d69vnu7u3+Nvvvk//uXm9dOrf8Snf/X47ubt29uHbx9f33+4ffVw+/3d+9t3t++ftlf/1+3Hx9vHVx/fv/7x5v0Pt2/w87W/ev65m/f8rciru/dPtz887C/86vZfbl9/fLp/+N0PH28e3vyOn+Pxka/16nu8CH/k8dWf755+fHX/cPfD3fubt6/+fP/wz/trPd58f/v006vb93+6fYvXf9xe/c3bt68eb/90+55va6/4Yg98iW/f37y7ffXu49unuw9v717fPd3hM777+PiEz/7u5u79f3r19u7729c/vX6LT/nmzR2fAcKf8Nf/8+PdA34Y0D/ivT8t07fP7//jzcPtm2/f3P7p7vXtt2/v3t09ATDBPby7fXN383T7CfjrH+/xE4/7Q7f7t4hN83T3/uP+FWyv/k/8/5/wY/cPWOyn93iDV/fv3/70n169vwechz/dvf8B8F+9uf3+BhD4We7+9Pzt7Vtj++Z5xX68e4uNdMdlZPP5vg0/b8H7+6fv7t7ga717+gl//7yPv/nFD3OrPN08PH1388fHp7t3t9xpJInK+2W69PRXnw7CN7f/cveEvfqGP7JvwW9uvgfsr1755oeft2u2L5dxv7qdJfMS8avBqN/czL+2lT+/8M2fuUv/9ub1j6/+8e5hX66/vX13//DTq79/wrcFRK8ff//qP/CTvXq8+9fbV/ffP3+yV/vn+I9/eP93+KvHV98/3N7+/tX4Fw9y0+3zY/uqjB/MSWHX7Mtj2NKHHmSTmJYvjz1+wLF5ezN8MudKCdnPjz39+HD/9PT29s0RgOnLY3/GGXjz6g320vXnSsnV5MtjHz4+/HDLlT7ybnzsD9/8w8PN+8e3z5t73+2Pf/jmV5/mYERvpCn5+WPisP30LU77nx9wEn//W98/LANvLn5+7F9vH+5ffX/39srXUuBgq2O3pZ8fe7j9dBCvfJtKeXFWfuzySxl+/51xb6/cXv/t7u3tt3+8ef3PWAJu3sdrz+bekHRwn/zN+/v3P727//g4fojPFeyUnzfzIyzybsvwnb77AAP4eP/wa69AojFkOp8fu3/9+uOHOzz4x5+uPpgRZjgf+6+3n3+Mhv4qMGnWxYo1PPZfDj7EbZJJmab7Y/yQd6Mnnr9+00zpk1o/PUabc2QX52wi3bncf/9sw4489cXKfXrs6Lt9NoE/n++bH344crixaC2XXzyGHf24+4jf/za6pF++ki+PfV7C335jccQqXz/2LTcYfnP9k5IEQ37tsVc/3r99Q6+IP/uVL4oXr7/62FXTni/s8teP4SR9i9/vB+kvzBlVcuTqY7v1/P2vfZt47D/T99AV/fwt/gYqvlchVz9N0D9cfvVXD8I+MYlo8efH3hw5drl6Qg7Cr+SbL47/OV7CV//dc2Dx7vbdH28f6I7/+z99FW/88HD/8cP+p3/1bD6xT78Em7/xGt/tIcR3iMFu3n/88PMr/nqo3ap069nal+TvUwD0G6HJV6/70hAllZq+XFj+ewlRvNeXhCgtvyxEsfSiEEX0/7shSnOVF4Qo7Ot9QYhSTNq/gxCl+ItClK828/+bEKW8LERp5SUhSs3nhij+/4co//uEKFrLS0IU7/6/Q4jyV//2V/8PKpngNqjTAwA=
````````````

## Artifact SHA-256 03e52441bee95d2329674dc50d8e59a4951c73f5643bfa318ae595057bfeb9fd

Encoding: `gzip+base64`. Original bytes: 190643.

````````````text
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
````````````

## Artifact SHA-256 451095f4a77cdbe8e4f9e3f91eaee2a80a69cb7df153e2f3efb0dabed78d1f8e

Encoding: `utf-8`. Original bytes: 2609.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "30a1c8732fad84310890d1286e5c19260b713e444fa3f9c8a06a10e0782284df",
  "exit_code": 0,
  "assertions": 327,
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 260.822863625,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41914056704,
    "swapins": 44356352,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   574828.\nPages active:                                1055977.\nPages inactive:                               941182.\nPages speculative:                            113242.\nPages throttled:                                   0.\nPages wired down:                             211357.\nPages purgeable:                                4356.\n\"Translation faults\":                    18439709461.\nPages copy-on-write:                      1043633680.\nPages zero filled:                       28453852949.\nPages reactivated:                        5414799546.\nPages purged:                               97330935.\nFile-backed pages:                           1979047.\nAnonymous pages:                              131354.\nPages stored in compressor:                   664083.\nPages occupied by compressor:                 178755.\nDecompressions:                           1476946370.\nCompressions:                             1818042567.\nPageins:                                  9651083307.\nPageouts:                                   11644986.\nSwapins:                                    44356352.\nSwapouts:                                   77895019.\nPages tagged:                                 158712.\nPages tagged resident:                        110533.\nPages tagged compressed:                       48179.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                        10273.\nPages tag-storage non-tag pageable:            81157.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8251520.\nTagged compressions:                        14875017.\nTagged decompressions:                      13809016.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e",
  "execution_receipt_sha256": "08ddbdbfc4462f6a9dd9b08255d967f885e106cbc4fffd38fecd6a2d1d475a67"
}

````````````

## Artifact SHA-256 08ddbdbfc4462f6a9dd9b08255d967f885e106cbc4fffd38fecd6a2d1d475a67

Encoding: `utf-8`. Original bytes: 2511.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "30a1c8732fad84310890d1286e5c19260b713e444fa3f9c8a06a10e0782284df",
  "exit_code": 0,
  "assertions": 327,
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 260.822863625,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41914056704,
    "swapins": 44356352,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   574828.\nPages active:                                1055977.\nPages inactive:                               941182.\nPages speculative:                            113242.\nPages throttled:                                   0.\nPages wired down:                             211357.\nPages purgeable:                                4356.\n\"Translation faults\":                    18439709461.\nPages copy-on-write:                      1043633680.\nPages zero filled:                       28453852949.\nPages reactivated:                        5414799546.\nPages purged:                               97330935.\nFile-backed pages:                           1979047.\nAnonymous pages:                              131354.\nPages stored in compressor:                   664083.\nPages occupied by compressor:                 178755.\nDecompressions:                           1476946370.\nCompressions:                             1818042567.\nPageins:                                  9651083307.\nPageouts:                                   11644986.\nSwapins:                                    44356352.\nSwapouts:                                   77895019.\nPages tagged:                                 158712.\nPages tagged resident:                        110533.\nPages tagged compressed:                       48179.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                        10273.\nPages tag-storage non-tag pageable:            81157.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8251520.\nTagged compressions:                        14875017.\nTagged decompressions:                      13809016.\n"
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

## Artifact SHA-256 6f6fd59315d0a6f650c533608193e7a1d802fdb1cff1abfa278659174e117839

Encoding: `utf-8`. Original bytes: 22971.

````````````text
{
  "started_at": "2026-09-09T10:06:34.530718+00:00",
  "deadline_utc": "2026-09-09T10:32:04.388575+00:00",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
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
        "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
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
        "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
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
      "source_archive_sha256": "6369274313f2baa58e96a0e81b09878173b24e69149ffc4c939812a4c9b7a763",
      "binary_sha256": "d3701afdb0540850f376ca9a696a2a0ffa31a67121362e341f87ebc9e27fd7dc",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41356197888,
    "swapins": 44356344,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   424839.\nPages active:                                1136071.\nPages inactive:                               980203.\nPages speculative:                            154002.\nPages throttled:                                   0.\nPages wired down:                             224053.\nPages purgeable:                                2586.\n\"Translation faults\":                    18431360492.\nPages copy-on-write:                      1042453514.\nPages zero filled:                       28362035284.\nPages reactivated:                        5412747838.\nPages purged:                               97285667.\nFile-backed pages:                           2096757.\nAnonymous pages:                              173519.\nPages stored in compressor:                   621067.\nPages occupied by compressor:                 162710.\nDecompressions:                           1473730924.\nCompressions:                             1814448561.\nPageins:                                  9649580775.\nPageouts:                                   11643979.\nSwapins:                                    44356344.\nSwapouts:                                   77895019.\nPages tagged:                                 160090.\nPages tagged resident:                        119315.\nPages tagged compressed:                       40775.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         3851.\nPages tag-storage non-tag pageable:            87579.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    6874432.\nTagged compressions:                        14859784.\nTagged decompressions:                      13802414.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T10:06:34.530598+00:00",
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
  "preparation_sha256": "20fb2090d27c6effaa0ff0da407456fceffc1aedea731afc5caef7dc7d0edc9f",
  "classification": "Exact V492 smaller-scope refinement. Reuses unchanged V439 scope and V444 integration executor/guard/assessment functions with original work and safety envelopes. All seven V436 assertion-name multiplicities must remain; lifecycle additionally requires actual process- and shared-device-limited intermediate scope choices and exact continuation. Native correctness only; no serving or default activation claim."
}

````````````

## Artifact SHA-256 9b9df980f6c3e06ddf732dd2f423a11194caef810fc09fae13201e5c69e5a667

Encoding: `gzip+base64`. Original bytes: 214224.

````````````text
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
````````````

## Artifact SHA-256 10d3e56084eb96f77c7298155eaec540fcdb3dbe3d75ff382d05e714f9f4f936

Encoding: `gzip+base64`. Original bytes: 161886.

````````````text
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
````````````

## Artifact SHA-256 063ceda130f9dd9aed8263a5740546aabe74fef51adfb964c58efe3f10076b80

Encoding: `utf-8`. Original bytes: 2614.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "6f6fd59315d0a6f650c533608193e7a1d802fdb1cff1abfa278659174e117839",
  "exit_code": 0,
  "assertions": 286,
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 218.59326604199998,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41916858368,
    "swapins": 44356344,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   470711.\nPages active:                                1106087.\nPages inactive:                              1018452.\nPages speculative:                             86282.\nPages throttled:                                   0.\nPages wired down:                             218514.\nPages purgeable:                                 305.\n\"Translation faults\":                    18435422289.\nPages copy-on-write:                      1043029079.\nPages zero filled:                       28406464695.\nPages reactivated:                        5413930679.\nPages purged:                               97305044.\nFile-backed pages:                           2087386.\nAnonymous pages:                              123435.\nPages stored in compressor:                   664858.\nPages occupied by compressor:                 177498.\nDecompressions:                           1475807858.\nCompressions:                             1816789038.\nPageins:                                  9650505103.\nPageouts:                                   11644417.\nSwapins:                                    44356344.\nSwapouts:                                   77895019.\nPages tagged:                                 158542.\nPages tagged resident:                        108799.\nPages tagged compressed:                       49743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         8008.\nPages tag-storage non-tag pageable:            83422.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8619648.\nTagged compressions:                        14872978.\nTagged decompressions:                      13806078.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41",
  "execution_receipt_sha256": "26bbb1d7dd3f6778b289d212e6cdec99b1ca21f36f27caaf03ca77d10a016161"
}

````````````

## Artifact SHA-256 26bbb1d7dd3f6778b289d212e6cdec99b1ca21f36f27caaf03ca77d10a016161

Encoding: `utf-8`. Original bytes: 2516.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "6f6fd59315d0a6f650c533608193e7a1d802fdb1cff1abfa278659174e117839",
  "exit_code": 0,
  "assertions": 286,
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 218.59326604199998,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41916858368,
    "swapins": 44356344,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   470711.\nPages active:                                1106087.\nPages inactive:                              1018452.\nPages speculative:                             86282.\nPages throttled:                                   0.\nPages wired down:                             218514.\nPages purgeable:                                 305.\n\"Translation faults\":                    18435422289.\nPages copy-on-write:                      1043029079.\nPages zero filled:                       28406464695.\nPages reactivated:                        5413930679.\nPages purged:                               97305044.\nFile-backed pages:                           2087386.\nAnonymous pages:                              123435.\nPages stored in compressor:                   664858.\nPages occupied by compressor:                 177498.\nDecompressions:                           1475807858.\nCompressions:                             1816789038.\nPageins:                                  9650505103.\nPageouts:                                   11644417.\nSwapins:                                    44356344.\nSwapouts:                                   77895019.\nPages tagged:                                 158542.\nPages tagged resident:                        108799.\nPages tagged compressed:                       49743.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         8008.\nPages tag-storage non-tag pageable:            83422.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8619648.\nTagged compressions:                        14872978.\nTagged decompressions:                      13806078.\n"
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

## Artifact SHA-256 2ea8bac96530b7cd331614359c0bc8916b486a3e04cc5f7b868d231075c28c03

Encoding: `utf-8`. Original bytes: 22981.

````````````text
{
  "started_at": "2026-09-09T10:14:34.460323+00:00",
  "deadline_utc": "2026-09-09T10:40:04.296815+00:00",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "read-failure-serving",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
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
        "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
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
        "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
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
      "source_archive_sha256": "6369274313f2baa58e96a0e81b09878173b24e69149ffc4c939812a4c9b7a763",
      "binary_sha256": "d3701afdb0540850f376ca9a696a2a0ffa31a67121362e341f87ebc9e27fd7dc",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41925459968,
    "swapins": 44356352,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   575832.\nPages active:                                1055281.\nPages inactive:                               940899.\nPages speculative:                            113528.\nPages throttled:                                   0.\nPages wired down:                             211355.\nPages purgeable:                                3758.\n\"Translation faults\":                    18439719197.\nPages copy-on-write:                      1043634959.\nPages zero filled:                       28453857296.\nPages reactivated:                        5414799546.\nPages purged:                               97330935.\nFile-backed pages:                           1979337.\nAnonymous pages:                              130371.\nPages stored in compressor:                   663641.\nPages occupied by compressor:                 178595.\nDecompressions:                           1476946692.\nCompressions:                             1818042567.\nPageins:                                  9651083390.\nPageouts:                                   11644986.\nSwapins:                                    44356352.\nSwapouts:                                   77895019.\nPages tagged:                                 158684.\nPages tagged resident:                        110509.\nPages tagged compressed:                       48175.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                        10109.\nPages tag-storage non-tag pageable:            81321.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8250880.\nTagged compressions:                        14875017.\nTagged decompressions:                      13809020.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T10:14:34.459873+00:00",
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
  "preparation_sha256": "20fb2090d27c6effaa0ff0da407456fceffc1aedea731afc5caef7dc7d0edc9f",
  "classification": "Exact V492 smaller-scope refinement. Reuses unchanged V439 scope and V444 integration executor/guard/assessment functions with original work and safety envelopes. All seven V436 assertion-name multiplicities must remain; lifecycle additionally requires actual process- and shared-device-limited intermediate scope choices and exact continuation. Native correctness only; no serving or default activation claim."
}

````````````

## Artifact SHA-256 95da6b2126b57b996519c4b852bd4253346cf4456d9eec6aa844feeac2c8aa59

Encoding: `gzip+base64`. Original bytes: 151153.

````````````text
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
````````````

## Artifact SHA-256 9db2d06847cb2192e4073d2056727f85bcfce137ebd2e4794df5fb3bbaef698a

Encoding: `gzip+base64`. Original bytes: 112576.

````````````text
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
````````````

## Artifact SHA-256 4068134722204b62d1bddb3dff35c950590b1d4ebffdad33f2e19ed783d5081b

Encoding: `utf-8`. Original bytes: 2608.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "2ea8bac96530b7cd331614359c0bc8916b486a3e04cc5f7b868d231075c28c03",
  "exit_code": 0,
  "assertions": 522,
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 150.23055375,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41722675200,
    "swapins": 44356356,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   551262.\nPages active:                                1071735.\nPages inactive:                               949389.\nPages speculative:                            119646.\nPages throttled:                                   0.\nPages wired down:                             211241.\nPages purgeable:                                9539.\n\"Translation faults\":                    18441776232.\nPages copy-on-write:                      1043997165.\nPages zero filled:                       28454943880.\nPages reactivated:                        5414799768.\nPages purged:                               97331675.\nFile-backed pages:                           1985749.\nAnonymous pages:                              155021.\nPages stored in compressor:                   647182.\nPages occupied by compressor:                 172614.\nDecompressions:                           1476962846.\nCompressions:                             1818042567.\nPageins:                                  9651090104.\nPageouts:                                   11644986.\nSwapins:                                    44356356.\nSwapouts:                                   77895019.\nPages tagged:                                 158871.\nPages tagged resident:                        112039.\nPages tagged compressed:                       46832.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         9449.\nPages tag-storage non-tag pageable:            81981.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8002624.\nTagged compressions:                        14875017.\nTagged decompressions:                      13810357.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
  "execution_receipt_sha256": "24b0f8bffdb9ac2d51304ac669da2c4f04abb121a26c1185564b8066ad52e36d"
}

````````````

## Artifact SHA-256 24b0f8bffdb9ac2d51304ac669da2c4f04abb121a26c1185564b8066ad52e36d

Encoding: `utf-8`. Original bytes: 2510.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "2ea8bac96530b7cd331614359c0bc8916b486a3e04cc5f7b868d231075c28c03",
  "exit_code": 0,
  "assertions": 522,
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 150.23055375,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41722675200,
    "swapins": 44356356,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   551262.\nPages active:                                1071735.\nPages inactive:                               949389.\nPages speculative:                            119646.\nPages throttled:                                   0.\nPages wired down:                             211241.\nPages purgeable:                                9539.\n\"Translation faults\":                    18441776232.\nPages copy-on-write:                      1043997165.\nPages zero filled:                       28454943880.\nPages reactivated:                        5414799768.\nPages purged:                               97331675.\nFile-backed pages:                           1985749.\nAnonymous pages:                              155021.\nPages stored in compressor:                   647182.\nPages occupied by compressor:                 172614.\nDecompressions:                           1476962846.\nCompressions:                             1818042567.\nPageins:                                  9651090104.\nPageouts:                                   11644986.\nSwapins:                                    44356356.\nSwapouts:                                   77895019.\nPages tagged:                                 158871.\nPages tagged resident:                        112039.\nPages tagged compressed:                       46832.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         9449.\nPages tag-storage non-tag pageable:            81981.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8002624.\nTagged compressions:                        14875017.\nTagged decompressions:                      13810357.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127"
}

````````````

## Artifact SHA-256 fcddd13aa70264a634d0711887cefea6ab173ea25561bb65ec6e095ee069c246

Encoding: `utf-8`. Original bytes: 1739.

````````````text
engine ready in 0.6s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
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

## Artifact SHA-256 400607f61860a262f5104ee777fe6fead21345fc86022e4281b278c3dd7e1705

Encoding: `utf-8`. Original bytes: 23114.

````````````text
{
  "started_at": "2026-09-09T09:59:39.159161+00:00",
  "deadline_utc": "2026-09-09T10:40:08.988151+00:00",
  "command": [
    "/usr/bin/env",
    "SLOTSTREAM_OPT_WORKSPACE_TILE=1024",
    "SLOTSTREAM_OPT_SCOPE_FRONTIER=1",
    "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "scope-integrated-family",
    "--tokens",
    "2051",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
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
        "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
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
        "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
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
      "source_archive_sha256": "6369274313f2baa58e96a0e81b09878173b24e69149ffc4c939812a4c9b7a763",
      "binary_sha256": "d3701afdb0540850f376ca9a696a2a0ffa31a67121362e341f87ebc9e27fd7dc",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41959243776,
    "swapins": 44356321,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   564830.\nPages active:                                1054292.\nPages inactive:                               946167.\nPages speculative:                            106479.\nPages throttled:                                   0.\nPages wired down:                             218408.\nPages purgeable:                                 166.\n\"Translation faults\":                    18428958054.\nPages copy-on-write:                      1042061870.\nPages zero filled:                       28299926199.\nPages reactivated:                        5412576538.\nPages purged:                               97280840.\nFile-backed pages:                           1995993.\nAnonymous pages:                              110945.\nPages stored in compressor:                   674951.\nPages occupied by compressor:                 180729.\nDecompressions:                           1473679823.\nCompressions:                             1814448561.\nPageins:                                  9649492691.\nPageouts:                                   11643931.\nSwapins:                                    44356321.\nSwapouts:                                   77895019.\nPages tagged:                                 158341.\nPages tagged resident:                        108411.\nPages tagged compressed:                       49930.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                        14317.\nPages tag-storage non-tag pageable:            77113.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8705344.\nTagged compressions:                        14859784.\nTagged decompressions:                      13793493.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T09:59:39.158701+00:00",
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
  "preparation_sha256": "20fb2090d27c6effaa0ff0da407456fceffc1aedea731afc5caef7dc7d0edc9f",
  "classification": "Exact V492 smaller-scope refinement. Reuses unchanged V439 scope and V444 integration executor/guard/assessment functions with original work and safety envelopes. All seven V436 assertion-name multiplicities must remain; lifecycle additionally requires actual process- and shared-device-limited intermediate scope choices and exact continuation. Native correctness only; no serving or default activation claim."
}

````````````

## Artifact SHA-256 9be92e79cb83151babcc41a4c4019d44e242f4539ab3b024c6650c8b9a6e5cd3

Encoding: `utf-8`. Original bytes: 47414.

````````````text
{
  "command": [
    "/usr/bin/env",
    "SLOTSTREAM_OPT_WORKSPACE_TILE=1024",
    "SLOTSTREAM_OPT_SCOPE_FRONTIER=1",
    "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "scope-integrated-family",
    "--tokens",
    "2051",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "policy": {
    "startup_reclaimable_bytes": 20112000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 17112000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1800,
    "stop_on_new_swapouts": false
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41959555072,
    "swapins": 44356321,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   564847.\nPages active:                                1054308.\nPages inactive:                               946169.\nPages speculative:                            106479.\nPages throttled:                                   0.\nPages wired down:                             218409.\nPages purgeable:                                 166.\n\"Translation faults\":                    18428958761.\nPages copy-on-write:                      1042062026.\nPages zero filled:                       28299926264.\nPages reactivated:                        5412576538.\nPages purged:                               97280840.\nFile-backed pages:                           1995995.\nAnonymous pages:                              110961.\nPages stored in compressor:                   674948.\nPages occupied by compressor:                 180729.\nDecompressions:                           1473679826.\nCompressions:                             1814448561.\nPageins:                                  9649492692.\nPageouts:                                   11643931.\nSwapins:                                    44356321.\nSwapouts:                                   77895019.\nPages tagged:                                 158339.\nPages tagged resident:                        108411.\nPages tagged compressed:                       49928.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                        14314.\nPages tag-storage non-tag pageable:            77116.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8705024.\nTagged compressions:                        14859784.\nTagged decompressions:                      13793495.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.002056042000000008,
      "owned_rss_bytes": 131072,
      "owned_process_count": 1,
      "reclaimable_bytes": 41959145472,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 0.22050637499999998,
      "owned_rss_bytes": 2627076096,
      "owned_process_count": 1,
      "reclaimable_bytes": 37528616960,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 0.442128958,
      "owned_rss_bytes": 2929180672,
      "owned_process_count": 1,
      "reclaimable_bytes": 36990517248,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 0.676495292,
      "owned_rss_bytes": 2963111936,
      "owned_process_count": 1,
      "reclaimable_bytes": 37023219712,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 0.9095397079999998,
      "owned_rss_bytes": 3003809792,
      "owned_process_count": 1,
      "reclaimable_bytes": 37049548800,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 1.135297583,
      "owned_rss_bytes": 3012755456,
      "owned_process_count": 1,
      "reclaimable_bytes": 36959174656,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 1.3598959579999998,
      "owned_rss_bytes": 3013984256,
      "owned_process_count": 1,
      "reclaimable_bytes": 36926439424,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 1.59502175,
      "owned_rss_bytes": 3014082560,
      "owned_process_count": 1,
      "reclaimable_bytes": 36907581440,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 1.827327417,
      "owned_rss_bytes": 3014246400,
      "owned_process_count": 1,
      "reclaimable_bytes": 36861820928,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 2.0591308329999998,
      "owned_rss_bytes": 3014475776,
      "owned_process_count": 1,
      "reclaimable_bytes": 36857724928,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 2.285526208,
      "owned_rss_bytes": 3014606848,
      "owned_process_count": 1,
      "reclaimable_bytes": 36841717760,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 2.513390542,
      "owned_rss_bytes": 3014705152,
      "owned_process_count": 1,
      "reclaimable_bytes": 36819337216,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 2.7422572499999998,
      "owned_rss_bytes": 3017097216,
      "owned_process_count": 1,
      "reclaimable_bytes": 36838424576,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 2.9765161669999998,
      "owned_rss_bytes": 3017277440,
      "owned_process_count": 1,
      "reclaimable_bytes": 36835803136,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 3.210077833,
      "owned_rss_bytes": 3017457664,
      "owned_process_count": 1,
      "reclaimable_bytes": 36800675840,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 3.435637667,
      "owned_rss_bytes": 3017670656,
      "owned_process_count": 1,
      "reclaimable_bytes": 36823105536,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 3.664814458,
      "owned_rss_bytes": 3017867264,
      "owned_process_count": 1,
      "reclaimable_bytes": 36771856384,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 3.8933202079999996,
      "owned_rss_bytes": 3018063872,
      "owned_process_count": 1,
      "reclaimable_bytes": 36835868672,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 4.123784875,
      "owned_rss_bytes": 3018326016,
      "owned_process_count": 1,
      "reclaimable_bytes": 36763910144,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 4.347291,
      "owned_rss_bytes": 3018489856,
      "owned_process_count": 1,
      "reclaimable_bytes": 36749279232,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 4.5753319999999995,
      "owned_rss_bytes": 3018702848,
      "owned_process_count": 1,
      "reclaimable_bytes": 36815241216,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 4.801517542,
      "owned_rss_bytes": 3021242368,
      "owned_process_count": 1,
      "reclaimable_bytes": 36816338944,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 5.0344999999999995,
      "owned_rss_bytes": 3020996608,
      "owned_process_count": 1,
      "reclaimable_bytes": 36814454784,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 5.267446375,
      "owned_rss_bytes": 3021062144,
      "owned_process_count": 1,
      "reclaimable_bytes": 36728029184,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 5.493891208,
      "owned_rss_bytes": 3021078528,
      "owned_process_count": 1,
      "reclaimable_bytes": 36806656000,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 5.71989025,
      "owned_rss_bytes": 3021111296,
      "owned_process_count": 1,
      "reclaimable_bytes": 36792188928,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 5.94641875,
      "owned_rss_bytes": 3021160448,
      "owned_process_count": 1,
      "reclaimable_bytes": 36803444736,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 6.172032542,
      "owned_rss_bytes": 3021209600,
      "owned_process_count": 1,
      "reclaimable_bytes": 36721344512,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 6.3982107919999995,
      "owned_rss_bytes": 3021209600,
      "owned_process_count": 1,
      "reclaimable_bytes": 36763795456,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 6.630771,
      "owned_rss_bytes": 3021242368,
      "owned_process_count": 1,
      "reclaimable_bytes": 36784865280,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 6.856606917,
      "owned_rss_bytes": 3021881344,
      "owned_process_count": 1,
      "reclaimable_bytes": 36812652544,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 7.077125792,
      "owned_rss_bytes": 3023503360,
      "owned_process_count": 1,
      "reclaimable_bytes": 36789567488,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 7.3119095419999995,
      "owned_rss_bytes": 3023552512,
      "owned_process_count": 1,
      "reclaimable_bytes": 36703764480,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 7.533367208,
      "owned_rss_bytes": 3023585280,
      "owned_process_count": 1,
      "reclaimable_bytes": 36720508928,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 7.75491125,
      "owned_rss_bytes": 3023618048,
      "owned_process_count": 1,
      "reclaimable_bytes": 36781850624,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 7.986722208000001,
      "owned_rss_bytes": 3023699968,
      "owned_process_count": 1,
      "reclaimable_bytes": 36784422912,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 8.22263775,
      "owned_rss_bytes": 3023732736,
      "owned_process_count": 1,
      "reclaimable_bytes": 36797579264,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 8.452414042000001,
      "owned_rss_bytes": 3023781888,
      "owned_process_count": 1,
      "reclaimable_bytes": 36798824448,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 8.689474667,
      "owned_rss_bytes": 3023831040,
      "owned_process_count": 1,
      "reclaimable_bytes": 36784340992,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 8.924934667,
      "owned_rss_bytes": 3024863232,
      "owned_process_count": 1,
      "reclaimable_bytes": 36750065664,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 9.144673958,
      "owned_rss_bytes": 3026173952,
      "owned_process_count": 1,
      "reclaimable_bytes": 36852711424,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 9.375120167,
      "owned_rss_bytes": 3026206720,
      "owned_process_count": 1,
      "reclaimable_bytes": 36872273920,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 9.612903500000002,
      "owned_rss_bytes": 3026223104,
      "owned_process_count": 1,
      "reclaimable_bytes": 36764860416,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 9.83470625,
      "owned_rss_bytes": 3030286336,
      "owned_process_count": 1,
      "reclaimable_bytes": 36681908224,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 10.060016375,
      "owned_rss_bytes": 3030335488,
      "owned_process_count": 1,
      "reclaimable_bytes": 36660854784,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 10.291530667,
      "owned_rss_bytes": 3030482944,
      "owned_process_count": 1,
      "reclaimable_bytes": 36748394496,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 10.525749042000001,
      "owned_rss_bytes": 3030515712,
      "owned_process_count": 1,
      "reclaimable_bytes": 36767531008,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 10.758701208000002,
      "owned_rss_bytes": 3030532096,
      "owned_process_count": 1,
      "reclaimable_bytes": 36720951296,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 10.984195000000001,
      "owned_rss_bytes": 3030564864,
      "owned_process_count": 1,
      "reclaimable_bytes": 36748967936,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 11.211915292,
      "owned_rss_bytes": 3032809472,
      "owned_process_count": 1,
      "reclaimable_bytes": 36738940928,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 11.445298542000002,
      "owned_rss_bytes": 3032875008,
      "owned_process_count": 1,
      "reclaimable_bytes": 36730109952,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 11.672828167,
      "owned_rss_bytes": 3032891392,
      "owned_process_count": 1,
      "reclaimable_bytes": 36652892160,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 11.896969458000001,
      "owned_rss_bytes": 3032956928,
      "owned_process_count": 1,
      "reclaimable_bytes": 36712005632,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 12.124623375,
      "owned_rss_bytes": 3032973312,
      "owned_process_count": 1,
      "reclaimable_bytes": 36718788608,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 12.354829875,
      "owned_rss_bytes": 3032989696,
      "owned_process_count": 1,
      "reclaimable_bytes": 36748509184,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 12.583481292,
      "owned_rss_bytes": 3033006080,
      "owned_process_count": 1,
      "reclaimable_bytes": 36720689152,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 12.809749708,
      "owned_rss_bytes": 3033038848,
      "owned_process_count": 1,
      "reclaimable_bytes": 36702912512,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 13.039471292,
      "owned_rss_bytes": 3033169920,
      "owned_process_count": 1,
      "reclaimable_bytes": 36761960448,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 13.268531292,
      "owned_rss_bytes": 3035332608,
      "owned_process_count": 1,
      "reclaimable_bytes": 36714020864,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 13.494165542000001,
      "owned_rss_bytes": 3035381760,
      "owned_process_count": 1,
      "reclaimable_bytes": 36677599232,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 13.726503667000001,
      "owned_rss_bytes": 3035398144,
      "owned_process_count": 1,
      "reclaimable_bytes": 36709040128,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 13.950953625,
      "owned_rss_bytes": 3035414528,
      "owned_process_count": 1,
      "reclaimable_bytes": 36630708224,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 14.176804792,
      "owned_rss_bytes": 3035447296,
      "owned_process_count": 1,
      "reclaimable_bytes": 36693213184,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 14.403255875000001,
      "owned_rss_bytes": 3035463680,
      "owned_process_count": 1,
      "reclaimable_bytes": 36625891328,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 14.626604708,
      "owned_rss_bytes": 3035480064,
      "owned_process_count": 1,
      "reclaimable_bytes": 36704305152,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 14.855798292000001,
      "owned_rss_bytes": 3035512832,
      "owned_process_count": 1,
      "reclaimable_bytes": 36609622016,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 15.081859583,
      "owned_rss_bytes": 3035545600,
      "owned_process_count": 1,
      "reclaimable_bytes": 36690182144,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 15.309491708000001,
      "owned_rss_bytes": 3036168192,
      "owned_process_count": 1,
      "reclaimable_bytes": 36695425024,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 15.530128542000002,
      "owned_rss_bytes": 3037790208,
      "owned_process_count": 1,
      "reclaimable_bytes": 36619288576,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 15.755243125000002,
      "owned_rss_bytes": 3037822976,
      "owned_process_count": 1,
      "reclaimable_bytes": 36766367744,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 15.981570042,
      "owned_rss_bytes": 3037872128,
      "owned_process_count": 1,
      "reclaimable_bytes": 36785766400,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 16.210532333,
      "owned_rss_bytes": 3037888512,
      "owned_process_count": 1,
      "reclaimable_bytes": 36613521408,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 16.437301292,
      "owned_rss_bytes": 3037904896,
      "owned_process_count": 1,
      "reclaimable_bytes": 36622286848,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 16.65994125,
      "owned_rss_bytes": 3037937664,
      "owned_process_count": 1,
      "reclaimable_bytes": 36611014656,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 16.891443582999997,
      "owned_rss_bytes": 3037954048,
      "owned_process_count": 1,
      "reclaimable_bytes": 36702928896,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 17.124922583,
      "owned_rss_bytes": 3037986816,
      "owned_process_count": 1,
      "reclaimable_bytes": 36676108288,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 17.354705707999997,
      "owned_rss_bytes": 3041951744,
      "owned_process_count": 1,
      "reclaimable_bytes": 36709892096,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 17.575416833,
      "owned_rss_bytes": 3042131968,
      "owned_process_count": 1,
      "reclaimable_bytes": 36768530432,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 17.796462082999998,
      "owned_rss_bytes": 3042328576,
      "owned_process_count": 1,
      "reclaimable_bytes": 36710301696,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 18.026783041999998,
      "owned_rss_bytes": 3042525184,
      "owned_process_count": 1,
      "reclaimable_bytes": 36695769088,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 18.259976041999998,
      "owned_rss_bytes": 3042557952,
      "owned_process_count": 1,
      "reclaimable_bytes": 36563632128,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 18.485387582999998,
      "owned_rss_bytes": 3042590720,
      "owned_process_count": 1,
      "reclaimable_bytes": 36561108992,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 18.707646125,
      "owned_rss_bytes": 3042623488,
      "owned_process_count": 1,
      "reclaimable_bytes": 36642160640,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 18.932172082999998,
      "owned_rss_bytes": 3042639872,
      "owned_process_count": 1,
      "reclaimable_bytes": 36627513344,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 19.159843374999998,
      "owned_rss_bytes": 3042525184,
      "owned_process_count": 1,
      "reclaimable_bytes": 36569497600,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 19.387735417,
      "owned_rss_bytes": 3042574336,
      "owned_process_count": 1,
      "reclaimable_bytes": 36525572096,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 19.613720667,
      "owned_rss_bytes": 3042574336,
      "owned_process_count": 1,
      "reclaimable_bytes": 36400250880,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 19.841534083,
      "owned_rss_bytes": 3042590720,
      "owned_process_count": 1,
      "reclaimable_bytes": 36484939776,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 20.067900082999998,
      "owned_rss_bytes": 3043409920,
      "owned_process_count": 1,
      "reclaimable_bytes": 36555587584,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 20.297286916999997,
      "owned_rss_bytes": 3042672640,
      "owned_process_count": 1,
      "reclaimable_bytes": 36536287232,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 20.533040375,
      "owned_rss_bytes": 3042705408,
      "owned_process_count": 1,
      "reclaimable_bytes": 36622680064,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 20.768920375,
      "owned_rss_bytes": 3042820096,
      "owned_process_count": 1,
      "reclaimable_bytes": 36457988096,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 20.993758749999998,
      "owned_rss_bytes": 3042770944,
      "owned_process_count": 1,
      "reclaimable_bytes": 36423843840,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 21.225398416999997,
      "owned_rss_bytes": 3042754560,
      "owned_process_count": 1,
      "reclaimable_bytes": 36397056000,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 21.453484,
      "owned_rss_bytes": 3042852864,
      "owned_process_count": 1,
      "reclaimable_bytes": 36392714240,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 21.678405292,
      "owned_rss_bytes": 3042836480,
      "owned_process_count": 1,
      "reclaimable_bytes": 36383555584,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 21.912681582999998,
      "owned_rss_bytes": 3046588416,
      "owned_process_count": 1,
      "reclaimable_bytes": 36369039360,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 22.156059125,
      "owned_rss_bytes": 3046572032,
      "owned_process_count": 1,
      "reclaimable_bytes": 36278501376,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 22.393290708,
      "owned_rss_bytes": 3047735296,
      "owned_process_count": 1,
      "reclaimable_bytes": 36273422336,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 22.626521375,
      "owned_rss_bytes": 3047047168,
      "owned_process_count": 1,
      "reclaimable_bytes": 36264886272,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 22.860971,
      "owned_rss_bytes": 3047112704,
      "owned_process_count": 1,
      "reclaimable_bytes": 36154736640,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 23.086087958,
      "owned_rss_bytes": 3047129088,
      "owned_process_count": 1,
      "reclaimable_bytes": 36136976384,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 23.322565708,
      "owned_rss_bytes": 3047145472,
      "owned_process_count": 1,
      "reclaimable_bytes": 36336648192,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 23.556567417,
      "owned_rss_bytes": 3047161856,
      "owned_process_count": 1,
      "reclaimable_bytes": 36344594432,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 23.794340207999998,
      "owned_rss_bytes": 3047178240,
      "owned_process_count": 1,
      "reclaimable_bytes": 36324753408,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 24.028458708,
      "owned_rss_bytes": 3047194624,
      "owned_process_count": 1,
      "reclaimable_bytes": 36438212608,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 24.259876,
      "owned_rss_bytes": 3047211008,
      "owned_process_count": 1,
      "reclaimable_bytes": 36431380480,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 24.491430958,
      "owned_rss_bytes": 3047227392,
      "owned_process_count": 1,
      "reclaimable_bytes": 36456333312,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 24.718238917,
      "owned_rss_bytes": 3047260160,
      "owned_process_count": 1,
      "reclaimable_bytes": 36483596288,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 24.945171583,
      "owned_rss_bytes": 3047292928,
      "owned_process_count": 1,
      "reclaimable_bytes": 36428201984,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 25.176685499999998,
      "owned_rss_bytes": 3047342080,
      "owned_process_count": 1,
      "reclaimable_bytes": 36450680832,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 25.412909541999998,
      "owned_rss_bytes": 3047374848,
      "owned_process_count": 1,
      "reclaimable_bytes": 36332863488,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 25.643205041999998,
      "owned_rss_bytes": 3047391232,
      "owned_process_count": 1,
      "reclaimable_bytes": 36411703296,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 25.874649041999998,
      "owned_rss_bytes": 3047456768,
      "owned_process_count": 1,
      "reclaimable_bytes": 36406362112,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 26.102504749999998,
      "owned_rss_bytes": 3047473152,
      "owned_process_count": 1,
      "reclaimable_bytes": 36337467392,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 26.337725666999997,
      "owned_rss_bytes": 3047489536,
      "owned_process_count": 1,
      "reclaimable_bytes": 36448665600,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 26.565541458,
      "owned_rss_bytes": 3047505920,
      "owned_process_count": 1,
      "reclaimable_bytes": 36307058688,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 26.787475583,
      "owned_rss_bytes": 3047522304,
      "owned_process_count": 1,
      "reclaimable_bytes": 36403691520,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 27.025654292,
      "owned_rss_bytes": 3047538688,
      "owned_process_count": 1,
      "reclaimable_bytes": 36399710208,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 27.261991625,
      "owned_rss_bytes": 3047735296,
      "owned_process_count": 1,
      "reclaimable_bytes": 36529061888,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 27.492047832999997,
      "owned_rss_bytes": 3047751680,
      "owned_process_count": 1,
      "reclaimable_bytes": 35198812160,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 27.722974958,
      "owned_rss_bytes": 3047833600,
      "owned_process_count": 1,
      "reclaimable_bytes": 35848699904,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 27.949085667,
      "owned_rss_bytes": 3047768064,
      "owned_process_count": 1,
      "reclaimable_bytes": 35184214016,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 28.178340499999997,
      "owned_rss_bytes": 3047768064,
      "owned_process_count": 1,
      "reclaimable_bytes": 35177168896,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 28.409863542,
      "owned_rss_bytes": 3047784448,
      "owned_process_count": 1,
      "reclaimable_bytes": 34752921600,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 28.63219025,
      "owned_rss_bytes": 3047784448,
      "owned_process_count": 1,
      "reclaimable_bytes": 34749202432,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 28.859869791999998,
      "owned_rss_bytes": 3047817216,
      "owned_process_count": 1,
      "reclaimable_bytes": 34826125312,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 29.092565875,
      "owned_rss_bytes": 3047817216,
      "owned_process_count": 1,
      "reclaimable_bytes": 34803400704,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 29.323307,
      "owned_rss_bytes": 3047981056,
      "owned_process_count": 1,
      "reclaimable_bytes": 34860957696,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 29.552860666999997,
      "owned_rss_bytes": 3047833600,
      "owned_process_count": 1,
      "reclaimable_bytes": 36160667648,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 29.776539417,
      "owned_rss_bytes": 3047833600,
      "owned_process_count": 1,
      "reclaimable_bytes": 36531896320,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 30.005074542,
      "owned_rss_bytes": 3047849984,
      "owned_process_count": 1,
      "reclaimable_bytes": 35112747008,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 30.237429083,
      "owned_rss_bytes": 3047948288,
      "owned_process_count": 1,
      "reclaimable_bytes": 34761981952,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 30.459872667,
      "owned_rss_bytes": 3047849984,
      "owned_process_count": 1,
      "reclaimable_bytes": 35635757056,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 30.690695124999998,
      "owned_rss_bytes": 3047866368,
      "owned_process_count": 1,
      "reclaimable_bytes": 36383047680,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 30.909874166999998,
      "owned_rss_bytes": 3047948288,
      "owned_process_count": 1,
      "reclaimable_bytes": 35768926208,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 31.13158875,
      "owned_rss_bytes": 3047866368,
      "owned_process_count": 1,
      "reclaimable_bytes": 35082207232,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 31.359913917,
      "owned_rss_bytes": 3048030208,
      "owned_process_count": 1,
      "reclaimable_bytes": 34698805248,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 31.586067874999998,
      "owned_rss_bytes": 3047882752,
      "owned_process_count": 1,
      "reclaimable_bytes": 35887710208,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 31.813062833,
      "owned_rss_bytes": 3047866368,
      "owned_process_count": 1,
      "reclaimable_bytes": 36483383296,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 32.034995083,
      "owned_rss_bytes": 3047800832,
      "owned_process_count": 1,
      "reclaimable_bytes": 35467821056,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 32.263472583,
      "owned_rss_bytes": 3047800832,
      "owned_process_count": 1,
      "reclaimable_bytes": 35024896000,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 32.48515575,
      "owned_rss_bytes": 3047817216,
      "owned_process_count": 1,
      "reclaimable_bytes": 35037052928,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 32.710529875,
      "owned_rss_bytes": 3047915520,
      "owned_process_count": 1,
      "reclaimable_bytes": 34562080768,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 32.939550583,
      "owned_rss_bytes": 3047817216,
      "owned_process_count": 1,
      "reclaimable_bytes": 36104585216,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 33.161681333,
      "owned_rss_bytes": 3047833600,
      "owned_process_count": 1,
      "reclaimable_bytes": 34849964032,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 33.382892125,
      "owned_rss_bytes": 3047833600,
      "owned_process_count": 1,
      "reclaimable_bytes": 34531295232,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 33.61025925,
      "owned_rss_bytes": 3047833600,
      "owned_process_count": 1,
      "reclaimable_bytes": 35279634432,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 33.842870542,
      "owned_rss_bytes": 3047849984,
      "owned_process_count": 1,
      "reclaimable_bytes": 36398137344,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 34.071336916999996,
      "owned_rss_bytes": 3047849984,
      "owned_process_count": 1,
      "reclaimable_bytes": 34967584768,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 34.295286917,
      "owned_rss_bytes": 3047948288,
      "owned_process_count": 1,
      "reclaimable_bytes": 34703982592,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 34.52403875,
      "owned_rss_bytes": 3047849984,
      "owned_process_count": 1,
      "reclaimable_bytes": 36235296768,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 34.746718666999996,
      "owned_rss_bytes": 3047866368,
      "owned_process_count": 1,
      "reclaimable_bytes": 34896838656,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 34.975992958,
      "owned_rss_bytes": 3047882752,
      "owned_process_count": 1,
      "reclaimable_bytes": 34940796928,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 35.209918208,
      "owned_rss_bytes": 3047981056,
      "owned_process_count": 1,
      "reclaimable_bytes": 34560622592,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 35.433485875,
      "owned_rss_bytes": 3047997440,
      "owned_process_count": 1,
      "reclaimable_bytes": 34936274944,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 35.663387207999996,
      "owned_rss_bytes": 3047899136,
      "owned_process_count": 1,
      "reclaimable_bytes": 36121804800,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 35.892330582999996,
      "owned_rss_bytes": 3047915520,
      "owned_process_count": 1,
      "reclaimable_bytes": 35116679168,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 36.121212792,
      "owned_rss_bytes": 3047931904,
      "owned_process_count": 1,
      "reclaimable_bytes": 34900049920,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 36.344490083,
      "owned_rss_bytes": 3047948288,
      "owned_process_count": 1,
      "reclaimable_bytes": 34538520576,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 36.5746755,
      "owned_rss_bytes": 3047997440,
      "owned_process_count": 1,
      "reclaimable_bytes": 35763847168,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 36.803823875,
      "owned_rss_bytes": 3048325120,
      "owned_process_count": 1,
      "reclaimable_bytes": 36315480064,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 37.028354667,
      "owned_rss_bytes": 3050651648,
      "owned_process_count": 1,
      "reclaimable_bytes": 36331470848,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 37.254832375,
      "owned_rss_bytes": 3051290624,
      "owned_process_count": 1,
      "reclaimable_bytes": 36327997440,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 37.476554291999996,
      "owned_rss_bytes": 3051405312,
      "owned_process_count": 1,
      "reclaimable_bytes": 36325687296,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 37.705929292,
      "owned_rss_bytes": 3051487232,
      "owned_process_count": 1,
      "reclaimable_bytes": 36322230272,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 37.933480833,
      "owned_rss_bytes": 3051552768,
      "owned_process_count": 1,
      "reclaimable_bytes": 36322525184,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 38.161972625,
      "owned_rss_bytes": 3051831296,
      "owned_process_count": 1,
      "reclaimable_bytes": 36178329600,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 38.383397708,
      "owned_rss_bytes": 3051929600,
      "owned_process_count": 1,
      "reclaimable_bytes": 36156489728,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 38.609251917,
      "owned_rss_bytes": 3051945984,
      "owned_process_count": 1,
      "reclaimable_bytes": 35895885824,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 38.835547167,
      "owned_rss_bytes": 3052027904,
      "owned_process_count": 1,
      "reclaimable_bytes": 35886792704,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 39.061632958,
      "owned_rss_bytes": 3052093440,
      "owned_process_count": 1,
      "reclaimable_bytes": 35966730240,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 39.291689749999996,
      "owned_rss_bytes": 3052142592,
      "owned_process_count": 1,
      "reclaimable_bytes": 35966107648,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 39.517697667,
      "owned_rss_bytes": 3052208128,
      "owned_process_count": 1,
      "reclaimable_bytes": 35863724032,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 39.744490125,
      "owned_rss_bytes": 3052257280,
      "owned_process_count": 1,
      "reclaimable_bytes": 35973758976,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 39.975051917,
      "owned_rss_bytes": 3052273664,
      "owned_process_count": 1,
      "reclaimable_bytes": 36072259584,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 40.198122083,
      "owned_rss_bytes": 3052306432,
      "owned_process_count": 1,
      "reclaimable_bytes": 35822026752,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 40.429026375,
      "owned_rss_bytes": 3052339200,
      "owned_process_count": 1,
      "reclaimable_bytes": 36034641920,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 40.654949167,
      "owned_rss_bytes": 3052371968,
      "owned_process_count": 1,
      "reclaimable_bytes": 36141252608,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 40.878832958,
      "owned_rss_bytes": 3052388352,
      "owned_process_count": 1,
      "reclaimable_bytes": 36019027968,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 41.100227124999996,
      "owned_rss_bytes": 3052404736,
      "owned_process_count": 1,
      "reclaimable_bytes": 35907239936,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 41.326030667,
      "owned_rss_bytes": 3052421120,
      "owned_process_count": 1,
      "reclaimable_bytes": 36002725888,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 41.549329416999996,
      "owned_rss_bytes": 3052470272,
      "owned_process_count": 1,
      "reclaimable_bytes": 35965108224,
      "swapins": 44356321,
      "swapouts": 77895019
    },
    {
      "elapsed_seconds": 41.779621417,
      "owned_rss_bytes": 3052503040,
      "owned_process_count": 1,
      "reclaimable_bytes": 35963879424,
      "swapins": 44356321,
      "swapouts": 77895019
    }
  ],
  "passed": true,
  "classification": "Exact V492 smaller-scope refinement. Reuses unchanged V439 scope and V444 integration executor/guard/assessment functions with original work and safety envelopes. All seven V436 assertion-name multiplicities must remain; lifecycle additionally requires actual process- and shared-device-limited intermediate scope choices and exact continuation. Native correctness only; no serving or default activation claim.",
  "child_pid": 22288,
  "owned_root_identity": {
    "pid": 22288,
    "start_abstime": 36022906853510
  },
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41873768448,
    "swapins": 44356321,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   503256.\nPages active:                                1069439.\nPages inactive:                               945432.\nPages speculative:                            159970.\nPages throttled:                                   0.\nPages wired down:                             221486.\nPages purgeable:                                2441.\n\"Translation faults\":                    18429644502.\nPages copy-on-write:                      1042156387.\nPages zero filled:                       28322373275.\nPages reactivated:                        5412576620.\nPages purged:                               97281245.\nFile-backed pages:                           2050075.\nAnonymous pages:                              124766.\nPages stored in compressor:                   661516.\nPages occupied by compressor:                 176804.\nDecompressions:                           1473691574.\nCompressions:                             1814448561.\nPageins:                                  9649534115.\nPageouts:                                   11643931.\nSwapins:                                    44356321.\nSwapouts:                                   77895019.\nPages tagged:                                 158389.\nPages tagged resident:                        110028.\nPages tagged compressed:                       48361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         9186.\nPages tag-storage non-tag pageable:            82244.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8382336.\nTagged compressions:                        14859784.\nTagged decompressions:                      13795061.\n"
  },
  "remaining_owned_members": [],
  "owned_groups": [
    22288
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 42.04795225,
  "child_exit_code": 0,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41874685952,
    "swapins": 44356321,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   503310.\nPages active:                                1069443.\nPages inactive:                               945432.\nPages speculative:                            159972.\nPages throttled:                                   0.\nPages wired down:                             221486.\nPages purgeable:                                2441.\n\"Translation faults\":                    18429649488.\nPages copy-on-write:                      1042157188.\nPages zero filled:                       28322375740.\nPages reactivated:                        5412576620.\nPages purged:                               97281245.\nFile-backed pages:                           2050077.\nAnonymous pages:                              124770.\nPages stored in compressor:                   661515.\nPages occupied by compressor:                 176804.\nDecompressions:                           1473691575.\nCompressions:                             1814448561.\nPageins:                                  9649534120.\nPageouts:                                   11643931.\nSwapins:                                    44356321.\nSwapouts:                                   77895019.\nPages tagged:                                 158389.\nPages tagged resident:                        110028.\nPages tagged compressed:                       48361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         9196.\nPages tag-storage non-tag pageable:            82234.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8382336.\nTagged compressions:                        14859784.\nTagged decompressions:                      13795061.\n"
  }
}

````````````

## Artifact SHA-256 a27f20afe2c2a34f6001a4a9adaf03a464cbb39e525f2c79677b230a1bd111b0

Encoding: `utf-8`. Original bytes: 31219.

````````````text
{"elapsed_seconds": 0.002056042000000008, "owned_rss_bytes": 131072, "owned_process_count": 1, "reclaimable_bytes": 41959145472, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 0.22050637499999998, "owned_rss_bytes": 2627076096, "owned_process_count": 1, "reclaimable_bytes": 37528616960, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 0.442128958, "owned_rss_bytes": 2929180672, "owned_process_count": 1, "reclaimable_bytes": 36990517248, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 0.676495292, "owned_rss_bytes": 2963111936, "owned_process_count": 1, "reclaimable_bytes": 37023219712, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 0.9095397079999998, "owned_rss_bytes": 3003809792, "owned_process_count": 1, "reclaimable_bytes": 37049548800, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 1.135297583, "owned_rss_bytes": 3012755456, "owned_process_count": 1, "reclaimable_bytes": 36959174656, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 1.3598959579999998, "owned_rss_bytes": 3013984256, "owned_process_count": 1, "reclaimable_bytes": 36926439424, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 1.59502175, "owned_rss_bytes": 3014082560, "owned_process_count": 1, "reclaimable_bytes": 36907581440, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 1.827327417, "owned_rss_bytes": 3014246400, "owned_process_count": 1, "reclaimable_bytes": 36861820928, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 2.0591308329999998, "owned_rss_bytes": 3014475776, "owned_process_count": 1, "reclaimable_bytes": 36857724928, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 2.285526208, "owned_rss_bytes": 3014606848, "owned_process_count": 1, "reclaimable_bytes": 36841717760, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 2.513390542, "owned_rss_bytes": 3014705152, "owned_process_count": 1, "reclaimable_bytes": 36819337216, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 2.7422572499999998, "owned_rss_bytes": 3017097216, "owned_process_count": 1, "reclaimable_bytes": 36838424576, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 2.9765161669999998, "owned_rss_bytes": 3017277440, "owned_process_count": 1, "reclaimable_bytes": 36835803136, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 3.210077833, "owned_rss_bytes": 3017457664, "owned_process_count": 1, "reclaimable_bytes": 36800675840, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 3.435637667, "owned_rss_bytes": 3017670656, "owned_process_count": 1, "reclaimable_bytes": 36823105536, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 3.664814458, "owned_rss_bytes": 3017867264, "owned_process_count": 1, "reclaimable_bytes": 36771856384, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 3.8933202079999996, "owned_rss_bytes": 3018063872, "owned_process_count": 1, "reclaimable_bytes": 36835868672, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 4.123784875, "owned_rss_bytes": 3018326016, "owned_process_count": 1, "reclaimable_bytes": 36763910144, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 4.347291, "owned_rss_bytes": 3018489856, "owned_process_count": 1, "reclaimable_bytes": 36749279232, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 4.5753319999999995, "owned_rss_bytes": 3018702848, "owned_process_count": 1, "reclaimable_bytes": 36815241216, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 4.801517542, "owned_rss_bytes": 3021242368, "owned_process_count": 1, "reclaimable_bytes": 36816338944, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 5.0344999999999995, "owned_rss_bytes": 3020996608, "owned_process_count": 1, "reclaimable_bytes": 36814454784, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 5.267446375, "owned_rss_bytes": 3021062144, "owned_process_count": 1, "reclaimable_bytes": 36728029184, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 5.493891208, "owned_rss_bytes": 3021078528, "owned_process_count": 1, "reclaimable_bytes": 36806656000, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 5.71989025, "owned_rss_bytes": 3021111296, "owned_process_count": 1, "reclaimable_bytes": 36792188928, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 5.94641875, "owned_rss_bytes": 3021160448, "owned_process_count": 1, "reclaimable_bytes": 36803444736, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 6.172032542, "owned_rss_bytes": 3021209600, "owned_process_count": 1, "reclaimable_bytes": 36721344512, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 6.3982107919999995, "owned_rss_bytes": 3021209600, "owned_process_count": 1, "reclaimable_bytes": 36763795456, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 6.630771, "owned_rss_bytes": 3021242368, "owned_process_count": 1, "reclaimable_bytes": 36784865280, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 6.856606917, "owned_rss_bytes": 3021881344, "owned_process_count": 1, "reclaimable_bytes": 36812652544, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 7.077125792, "owned_rss_bytes": 3023503360, "owned_process_count": 1, "reclaimable_bytes": 36789567488, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 7.3119095419999995, "owned_rss_bytes": 3023552512, "owned_process_count": 1, "reclaimable_bytes": 36703764480, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 7.533367208, "owned_rss_bytes": 3023585280, "owned_process_count": 1, "reclaimable_bytes": 36720508928, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 7.75491125, "owned_rss_bytes": 3023618048, "owned_process_count": 1, "reclaimable_bytes": 36781850624, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 7.986722208000001, "owned_rss_bytes": 3023699968, "owned_process_count": 1, "reclaimable_bytes": 36784422912, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 8.22263775, "owned_rss_bytes": 3023732736, "owned_process_count": 1, "reclaimable_bytes": 36797579264, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 8.452414042000001, "owned_rss_bytes": 3023781888, "owned_process_count": 1, "reclaimable_bytes": 36798824448, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 8.689474667, "owned_rss_bytes": 3023831040, "owned_process_count": 1, "reclaimable_bytes": 36784340992, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 8.924934667, "owned_rss_bytes": 3024863232, "owned_process_count": 1, "reclaimable_bytes": 36750065664, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 9.144673958, "owned_rss_bytes": 3026173952, "owned_process_count": 1, "reclaimable_bytes": 36852711424, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 9.375120167, "owned_rss_bytes": 3026206720, "owned_process_count": 1, "reclaimable_bytes": 36872273920, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 9.612903500000002, "owned_rss_bytes": 3026223104, "owned_process_count": 1, "reclaimable_bytes": 36764860416, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 9.83470625, "owned_rss_bytes": 3030286336, "owned_process_count": 1, "reclaimable_bytes": 36681908224, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 10.060016375, "owned_rss_bytes": 3030335488, "owned_process_count": 1, "reclaimable_bytes": 36660854784, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 10.291530667, "owned_rss_bytes": 3030482944, "owned_process_count": 1, "reclaimable_bytes": 36748394496, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 10.525749042000001, "owned_rss_bytes": 3030515712, "owned_process_count": 1, "reclaimable_bytes": 36767531008, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 10.758701208000002, "owned_rss_bytes": 3030532096, "owned_process_count": 1, "reclaimable_bytes": 36720951296, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 10.984195000000001, "owned_rss_bytes": 3030564864, "owned_process_count": 1, "reclaimable_bytes": 36748967936, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 11.211915292, "owned_rss_bytes": 3032809472, "owned_process_count": 1, "reclaimable_bytes": 36738940928, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 11.445298542000002, "owned_rss_bytes": 3032875008, "owned_process_count": 1, "reclaimable_bytes": 36730109952, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 11.672828167, "owned_rss_bytes": 3032891392, "owned_process_count": 1, "reclaimable_bytes": 36652892160, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 11.896969458000001, "owned_rss_bytes": 3032956928, "owned_process_count": 1, "reclaimable_bytes": 36712005632, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 12.124623375, "owned_rss_bytes": 3032973312, "owned_process_count": 1, "reclaimable_bytes": 36718788608, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 12.354829875, "owned_rss_bytes": 3032989696, "owned_process_count": 1, "reclaimable_bytes": 36748509184, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 12.583481292, "owned_rss_bytes": 3033006080, "owned_process_count": 1, "reclaimable_bytes": 36720689152, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 12.809749708, "owned_rss_bytes": 3033038848, "owned_process_count": 1, "reclaimable_bytes": 36702912512, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 13.039471292, "owned_rss_bytes": 3033169920, "owned_process_count": 1, "reclaimable_bytes": 36761960448, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 13.268531292, "owned_rss_bytes": 3035332608, "owned_process_count": 1, "reclaimable_bytes": 36714020864, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 13.494165542000001, "owned_rss_bytes": 3035381760, "owned_process_count": 1, "reclaimable_bytes": 36677599232, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 13.726503667000001, "owned_rss_bytes": 3035398144, "owned_process_count": 1, "reclaimable_bytes": 36709040128, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 13.950953625, "owned_rss_bytes": 3035414528, "owned_process_count": 1, "reclaimable_bytes": 36630708224, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 14.176804792, "owned_rss_bytes": 3035447296, "owned_process_count": 1, "reclaimable_bytes": 36693213184, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 14.403255875000001, "owned_rss_bytes": 3035463680, "owned_process_count": 1, "reclaimable_bytes": 36625891328, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 14.626604708, "owned_rss_bytes": 3035480064, "owned_process_count": 1, "reclaimable_bytes": 36704305152, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 14.855798292000001, "owned_rss_bytes": 3035512832, "owned_process_count": 1, "reclaimable_bytes": 36609622016, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 15.081859583, "owned_rss_bytes": 3035545600, "owned_process_count": 1, "reclaimable_bytes": 36690182144, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 15.309491708000001, "owned_rss_bytes": 3036168192, "owned_process_count": 1, "reclaimable_bytes": 36695425024, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 15.530128542000002, "owned_rss_bytes": 3037790208, "owned_process_count": 1, "reclaimable_bytes": 36619288576, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 15.755243125000002, "owned_rss_bytes": 3037822976, "owned_process_count": 1, "reclaimable_bytes": 36766367744, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 15.981570042, "owned_rss_bytes": 3037872128, "owned_process_count": 1, "reclaimable_bytes": 36785766400, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 16.210532333, "owned_rss_bytes": 3037888512, "owned_process_count": 1, "reclaimable_bytes": 36613521408, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 16.437301292, "owned_rss_bytes": 3037904896, "owned_process_count": 1, "reclaimable_bytes": 36622286848, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 16.65994125, "owned_rss_bytes": 3037937664, "owned_process_count": 1, "reclaimable_bytes": 36611014656, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 16.891443582999997, "owned_rss_bytes": 3037954048, "owned_process_count": 1, "reclaimable_bytes": 36702928896, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 17.124922583, "owned_rss_bytes": 3037986816, "owned_process_count": 1, "reclaimable_bytes": 36676108288, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 17.354705707999997, "owned_rss_bytes": 3041951744, "owned_process_count": 1, "reclaimable_bytes": 36709892096, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 17.575416833, "owned_rss_bytes": 3042131968, "owned_process_count": 1, "reclaimable_bytes": 36768530432, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 17.796462082999998, "owned_rss_bytes": 3042328576, "owned_process_count": 1, "reclaimable_bytes": 36710301696, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 18.026783041999998, "owned_rss_bytes": 3042525184, "owned_process_count": 1, "reclaimable_bytes": 36695769088, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 18.259976041999998, "owned_rss_bytes": 3042557952, "owned_process_count": 1, "reclaimable_bytes": 36563632128, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 18.485387582999998, "owned_rss_bytes": 3042590720, "owned_process_count": 1, "reclaimable_bytes": 36561108992, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 18.707646125, "owned_rss_bytes": 3042623488, "owned_process_count": 1, "reclaimable_bytes": 36642160640, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 18.932172082999998, "owned_rss_bytes": 3042639872, "owned_process_count": 1, "reclaimable_bytes": 36627513344, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 19.159843374999998, "owned_rss_bytes": 3042525184, "owned_process_count": 1, "reclaimable_bytes": 36569497600, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 19.387735417, "owned_rss_bytes": 3042574336, "owned_process_count": 1, "reclaimable_bytes": 36525572096, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 19.613720667, "owned_rss_bytes": 3042574336, "owned_process_count": 1, "reclaimable_bytes": 36400250880, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 19.841534083, "owned_rss_bytes": 3042590720, "owned_process_count": 1, "reclaimable_bytes": 36484939776, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 20.067900082999998, "owned_rss_bytes": 3043409920, "owned_process_count": 1, "reclaimable_bytes": 36555587584, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 20.297286916999997, "owned_rss_bytes": 3042672640, "owned_process_count": 1, "reclaimable_bytes": 36536287232, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 20.533040375, "owned_rss_bytes": 3042705408, "owned_process_count": 1, "reclaimable_bytes": 36622680064, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 20.768920375, "owned_rss_bytes": 3042820096, "owned_process_count": 1, "reclaimable_bytes": 36457988096, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 20.993758749999998, "owned_rss_bytes": 3042770944, "owned_process_count": 1, "reclaimable_bytes": 36423843840, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 21.225398416999997, "owned_rss_bytes": 3042754560, "owned_process_count": 1, "reclaimable_bytes": 36397056000, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 21.453484, "owned_rss_bytes": 3042852864, "owned_process_count": 1, "reclaimable_bytes": 36392714240, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 21.678405292, "owned_rss_bytes": 3042836480, "owned_process_count": 1, "reclaimable_bytes": 36383555584, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 21.912681582999998, "owned_rss_bytes": 3046588416, "owned_process_count": 1, "reclaimable_bytes": 36369039360, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 22.156059125, "owned_rss_bytes": 3046572032, "owned_process_count": 1, "reclaimable_bytes": 36278501376, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 22.393290708, "owned_rss_bytes": 3047735296, "owned_process_count": 1, "reclaimable_bytes": 36273422336, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 22.626521375, "owned_rss_bytes": 3047047168, "owned_process_count": 1, "reclaimable_bytes": 36264886272, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 22.860971, "owned_rss_bytes": 3047112704, "owned_process_count": 1, "reclaimable_bytes": 36154736640, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 23.086087958, "owned_rss_bytes": 3047129088, "owned_process_count": 1, "reclaimable_bytes": 36136976384, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 23.322565708, "owned_rss_bytes": 3047145472, "owned_process_count": 1, "reclaimable_bytes": 36336648192, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 23.556567417, "owned_rss_bytes": 3047161856, "owned_process_count": 1, "reclaimable_bytes": 36344594432, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 23.794340207999998, "owned_rss_bytes": 3047178240, "owned_process_count": 1, "reclaimable_bytes": 36324753408, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 24.028458708, "owned_rss_bytes": 3047194624, "owned_process_count": 1, "reclaimable_bytes": 36438212608, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 24.259876, "owned_rss_bytes": 3047211008, "owned_process_count": 1, "reclaimable_bytes": 36431380480, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 24.491430958, "owned_rss_bytes": 3047227392, "owned_process_count": 1, "reclaimable_bytes": 36456333312, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 24.718238917, "owned_rss_bytes": 3047260160, "owned_process_count": 1, "reclaimable_bytes": 36483596288, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 24.945171583, "owned_rss_bytes": 3047292928, "owned_process_count": 1, "reclaimable_bytes": 36428201984, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 25.176685499999998, "owned_rss_bytes": 3047342080, "owned_process_count": 1, "reclaimable_bytes": 36450680832, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 25.412909541999998, "owned_rss_bytes": 3047374848, "owned_process_count": 1, "reclaimable_bytes": 36332863488, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 25.643205041999998, "owned_rss_bytes": 3047391232, "owned_process_count": 1, "reclaimable_bytes": 36411703296, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 25.874649041999998, "owned_rss_bytes": 3047456768, "owned_process_count": 1, "reclaimable_bytes": 36406362112, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 26.102504749999998, "owned_rss_bytes": 3047473152, "owned_process_count": 1, "reclaimable_bytes": 36337467392, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 26.337725666999997, "owned_rss_bytes": 3047489536, "owned_process_count": 1, "reclaimable_bytes": 36448665600, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 26.565541458, "owned_rss_bytes": 3047505920, "owned_process_count": 1, "reclaimable_bytes": 36307058688, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 26.787475583, "owned_rss_bytes": 3047522304, "owned_process_count": 1, "reclaimable_bytes": 36403691520, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 27.025654292, "owned_rss_bytes": 3047538688, "owned_process_count": 1, "reclaimable_bytes": 36399710208, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 27.261991625, "owned_rss_bytes": 3047735296, "owned_process_count": 1, "reclaimable_bytes": 36529061888, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 27.492047832999997, "owned_rss_bytes": 3047751680, "owned_process_count": 1, "reclaimable_bytes": 35198812160, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 27.722974958, "owned_rss_bytes": 3047833600, "owned_process_count": 1, "reclaimable_bytes": 35848699904, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 27.949085667, "owned_rss_bytes": 3047768064, "owned_process_count": 1, "reclaimable_bytes": 35184214016, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 28.178340499999997, "owned_rss_bytes": 3047768064, "owned_process_count": 1, "reclaimable_bytes": 35177168896, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 28.409863542, "owned_rss_bytes": 3047784448, "owned_process_count": 1, "reclaimable_bytes": 34752921600, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 28.63219025, "owned_rss_bytes": 3047784448, "owned_process_count": 1, "reclaimable_bytes": 34749202432, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 28.859869791999998, "owned_rss_bytes": 3047817216, "owned_process_count": 1, "reclaimable_bytes": 34826125312, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 29.092565875, "owned_rss_bytes": 3047817216, "owned_process_count": 1, "reclaimable_bytes": 34803400704, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 29.323307, "owned_rss_bytes": 3047981056, "owned_process_count": 1, "reclaimable_bytes": 34860957696, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 29.552860666999997, "owned_rss_bytes": 3047833600, "owned_process_count": 1, "reclaimable_bytes": 36160667648, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 29.776539417, "owned_rss_bytes": 3047833600, "owned_process_count": 1, "reclaimable_bytes": 36531896320, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 30.005074542, "owned_rss_bytes": 3047849984, "owned_process_count": 1, "reclaimable_bytes": 35112747008, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 30.237429083, "owned_rss_bytes": 3047948288, "owned_process_count": 1, "reclaimable_bytes": 34761981952, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 30.459872667, "owned_rss_bytes": 3047849984, "owned_process_count": 1, "reclaimable_bytes": 35635757056, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 30.690695124999998, "owned_rss_bytes": 3047866368, "owned_process_count": 1, "reclaimable_bytes": 36383047680, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 30.909874166999998, "owned_rss_bytes": 3047948288, "owned_process_count": 1, "reclaimable_bytes": 35768926208, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 31.13158875, "owned_rss_bytes": 3047866368, "owned_process_count": 1, "reclaimable_bytes": 35082207232, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 31.359913917, "owned_rss_bytes": 3048030208, "owned_process_count": 1, "reclaimable_bytes": 34698805248, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 31.586067874999998, "owned_rss_bytes": 3047882752, "owned_process_count": 1, "reclaimable_bytes": 35887710208, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 31.813062833, "owned_rss_bytes": 3047866368, "owned_process_count": 1, "reclaimable_bytes": 36483383296, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 32.034995083, "owned_rss_bytes": 3047800832, "owned_process_count": 1, "reclaimable_bytes": 35467821056, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 32.263472583, "owned_rss_bytes": 3047800832, "owned_process_count": 1, "reclaimable_bytes": 35024896000, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 32.48515575, "owned_rss_bytes": 3047817216, "owned_process_count": 1, "reclaimable_bytes": 35037052928, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 32.710529875, "owned_rss_bytes": 3047915520, "owned_process_count": 1, "reclaimable_bytes": 34562080768, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 32.939550583, "owned_rss_bytes": 3047817216, "owned_process_count": 1, "reclaimable_bytes": 36104585216, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 33.161681333, "owned_rss_bytes": 3047833600, "owned_process_count": 1, "reclaimable_bytes": 34849964032, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 33.382892125, "owned_rss_bytes": 3047833600, "owned_process_count": 1, "reclaimable_bytes": 34531295232, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 33.61025925, "owned_rss_bytes": 3047833600, "owned_process_count": 1, "reclaimable_bytes": 35279634432, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 33.842870542, "owned_rss_bytes": 3047849984, "owned_process_count": 1, "reclaimable_bytes": 36398137344, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 34.071336916999996, "owned_rss_bytes": 3047849984, "owned_process_count": 1, "reclaimable_bytes": 34967584768, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 34.295286917, "owned_rss_bytes": 3047948288, "owned_process_count": 1, "reclaimable_bytes": 34703982592, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 34.52403875, "owned_rss_bytes": 3047849984, "owned_process_count": 1, "reclaimable_bytes": 36235296768, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 34.746718666999996, "owned_rss_bytes": 3047866368, "owned_process_count": 1, "reclaimable_bytes": 34896838656, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 34.975992958, "owned_rss_bytes": 3047882752, "owned_process_count": 1, "reclaimable_bytes": 34940796928, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 35.209918208, "owned_rss_bytes": 3047981056, "owned_process_count": 1, "reclaimable_bytes": 34560622592, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 35.433485875, "owned_rss_bytes": 3047997440, "owned_process_count": 1, "reclaimable_bytes": 34936274944, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 35.663387207999996, "owned_rss_bytes": 3047899136, "owned_process_count": 1, "reclaimable_bytes": 36121804800, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 35.892330582999996, "owned_rss_bytes": 3047915520, "owned_process_count": 1, "reclaimable_bytes": 35116679168, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 36.121212792, "owned_rss_bytes": 3047931904, "owned_process_count": 1, "reclaimable_bytes": 34900049920, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 36.344490083, "owned_rss_bytes": 3047948288, "owned_process_count": 1, "reclaimable_bytes": 34538520576, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 36.5746755, "owned_rss_bytes": 3047997440, "owned_process_count": 1, "reclaimable_bytes": 35763847168, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 36.803823875, "owned_rss_bytes": 3048325120, "owned_process_count": 1, "reclaimable_bytes": 36315480064, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 37.028354667, "owned_rss_bytes": 3050651648, "owned_process_count": 1, "reclaimable_bytes": 36331470848, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 37.254832375, "owned_rss_bytes": 3051290624, "owned_process_count": 1, "reclaimable_bytes": 36327997440, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 37.476554291999996, "owned_rss_bytes": 3051405312, "owned_process_count": 1, "reclaimable_bytes": 36325687296, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 37.705929292, "owned_rss_bytes": 3051487232, "owned_process_count": 1, "reclaimable_bytes": 36322230272, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 37.933480833, "owned_rss_bytes": 3051552768, "owned_process_count": 1, "reclaimable_bytes": 36322525184, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 38.161972625, "owned_rss_bytes": 3051831296, "owned_process_count": 1, "reclaimable_bytes": 36178329600, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 38.383397708, "owned_rss_bytes": 3051929600, "owned_process_count": 1, "reclaimable_bytes": 36156489728, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 38.609251917, "owned_rss_bytes": 3051945984, "owned_process_count": 1, "reclaimable_bytes": 35895885824, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 38.835547167, "owned_rss_bytes": 3052027904, "owned_process_count": 1, "reclaimable_bytes": 35886792704, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 39.061632958, "owned_rss_bytes": 3052093440, "owned_process_count": 1, "reclaimable_bytes": 35966730240, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 39.291689749999996, "owned_rss_bytes": 3052142592, "owned_process_count": 1, "reclaimable_bytes": 35966107648, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 39.517697667, "owned_rss_bytes": 3052208128, "owned_process_count": 1, "reclaimable_bytes": 35863724032, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 39.744490125, "owned_rss_bytes": 3052257280, "owned_process_count": 1, "reclaimable_bytes": 35973758976, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 39.975051917, "owned_rss_bytes": 3052273664, "owned_process_count": 1, "reclaimable_bytes": 36072259584, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 40.198122083, "owned_rss_bytes": 3052306432, "owned_process_count": 1, "reclaimable_bytes": 35822026752, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 40.429026375, "owned_rss_bytes": 3052339200, "owned_process_count": 1, "reclaimable_bytes": 36034641920, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 40.654949167, "owned_rss_bytes": 3052371968, "owned_process_count": 1, "reclaimable_bytes": 36141252608, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 40.878832958, "owned_rss_bytes": 3052388352, "owned_process_count": 1, "reclaimable_bytes": 36019027968, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 41.100227124999996, "owned_rss_bytes": 3052404736, "owned_process_count": 1, "reclaimable_bytes": 35907239936, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 41.326030667, "owned_rss_bytes": 3052421120, "owned_process_count": 1, "reclaimable_bytes": 36002725888, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 41.549329416999996, "owned_rss_bytes": 3052470272, "owned_process_count": 1, "reclaimable_bytes": 35965108224, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 41.779621417, "owned_rss_bytes": 3052503040, "owned_process_count": 1, "reclaimable_bytes": 35963879424, "swapins": 44356321, "swapouts": 77895019}

````````````

## Artifact SHA-256 7411f29f0ffd8f21b9424d9577e47fadb988698526b249a2fa66c6b678cdabee

Encoding: `utf-8`. Original bytes: 2697.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "400607f61860a262f5104ee777fe6fead21345fc86022e4281b278c3dd7e1705",
  "exit_code": 0,
  "assertions": 817,
  "original_assertion_coverage_preserved": true,
  "automatic_native_metrics": {},
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 42.123847125000005,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41874145280,
    "swapins": 44356321,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   503277.\nPages active:                                1069477.\nPages inactive:                               945482.\nPages speculative:                            159922.\nPages throttled:                                   0.\nPages wired down:                             221486.\nPages purgeable:                                2441.\n\"Translation faults\":                    18429651011.\nPages copy-on-write:                      1042157516.\nPages zero filled:                       28322375919.\nPages reactivated:                        5412576620.\nPages purged:                               97281245.\nFile-backed pages:                           2050077.\nAnonymous pages:                              124804.\nPages stored in compressor:                   661515.\nPages occupied by compressor:                 176804.\nDecompressions:                           1473691575.\nCompressions:                             1814448561.\nPageins:                                  9649534122.\nPageouts:                                   11643931.\nSwapins:                                    44356321.\nSwapouts:                                   77895019.\nPages tagged:                                 158389.\nPages tagged resident:                        110028.\nPages tagged compressed:                       48361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         9180.\nPages tag-storage non-tag pageable:            82250.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8382336.\nTagged compressions:                        14859784.\nTagged decompressions:                      13795061.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "7c02a1ac8903d1473cdd697e34ad3be4b7530c5a073f79d33dee29b9606b7cba",
  "execution_receipt_sha256": "9540e825f4aa4c2775e525e2059560fdf03108b89d9085fb8c83b7b5fe34638a"
}

````````````

## Artifact SHA-256 9540e825f4aa4c2775e525e2059560fdf03108b89d9085fb8c83b7b5fe34638a

Encoding: `utf-8`. Original bytes: 2599.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "400607f61860a262f5104ee777fe6fead21345fc86022e4281b278c3dd7e1705",
  "exit_code": 0,
  "assertions": 817,
  "original_assertion_coverage_preserved": true,
  "automatic_native_metrics": {},
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 42.123847125000005,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41874145280,
    "swapins": 44356321,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   503277.\nPages active:                                1069477.\nPages inactive:                               945482.\nPages speculative:                            159922.\nPages throttled:                                   0.\nPages wired down:                             221486.\nPages purgeable:                                2441.\n\"Translation faults\":                    18429651011.\nPages copy-on-write:                      1042157516.\nPages zero filled:                       28322375919.\nPages reactivated:                        5412576620.\nPages purged:                               97281245.\nFile-backed pages:                           2050077.\nAnonymous pages:                              124804.\nPages stored in compressor:                   661515.\nPages occupied by compressor:                 176804.\nDecompressions:                           1473691575.\nCompressions:                             1814448561.\nPageins:                                  9649534122.\nPageouts:                                   11643931.\nSwapins:                                    44356321.\nSwapouts:                                   77895019.\nPages tagged:                                 158389.\nPages tagged resident:                        110028.\nPages tagged compressed:                       48361.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         9180.\nPages tag-storage non-tag pageable:            82250.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8382336.\nTagged compressions:                        14859784.\nTagged decompressions:                      13795061.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "7c02a1ac8903d1473cdd697e34ad3be4b7530c5a073f79d33dee29b9606b7cba"
}

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 7c02a1ac8903d1473cdd697e34ad3be4b7530c5a073f79d33dee29b9606b7cba

Encoding: `gzip+base64`. Original bytes: 163399.

````````````text
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
````````````

## Artifact SHA-256 8ff37c1869f6b52ffcd9452f9d474a4ec873afb90bc7dae43cd888eadb0b1f3e

Encoding: `utf-8`. Original bytes: 23114.

````````````text
{
  "started_at": "2026-09-09T10:00:21.513320+00:00",
  "deadline_utc": "2026-09-09T10:40:51.375814+00:00",
  "command": [
    "/usr/bin/env",
    "SLOTSTREAM_OPT_WORKSPACE_TILE=1024",
    "SLOTSTREAM_OPT_SCOPE_FRONTIER=1",
    "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "scope-integrated-family",
    "--tokens",
    "4096",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
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
        "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
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
        "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
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
      "source_archive_sha256": "6369274313f2baa58e96a0e81b09878173b24e69149ffc4c939812a4c9b7a763",
      "binary_sha256": "d3701afdb0540850f376ca9a696a2a0ffa31a67121362e341f87ebc9e27fd7dc",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41877405696,
    "swapins": 44356321,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   503474.\nPages active:                                1072102.\nPages inactive:                               945432.\nPages speculative:                            159737.\nPages throttled:                                   0.\nPages wired down:                             218975.\nPages purgeable:                                2441.\n\"Translation faults\":                    18429660428.\nPages copy-on-write:                      1042158777.\nPages zero filled:                       28322380249.\nPages reactivated:                        5412576620.\nPages purged:                               97281245.\nFile-backed pages:                           2050079.\nAnonymous pages:                              127192.\nPages stored in compressor:                   661506.\nPages occupied by compressor:                 176800.\nDecompressions:                           1473691591.\nCompressions:                             1814448561.\nPageins:                                  9649534147.\nPageouts:                                   11643931.\nSwapins:                                    44356321.\nSwapouts:                                   77895019.\nPages tagged:                                 158364.\nPages tagged resident:                        110004.\nPages tagged compressed:                       48360.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         9277.\nPages tag-storage non-tag pageable:            82153.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8382272.\nTagged compressions:                        14859784.\nTagged decompressions:                      13795062.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T10:00:21.513201+00:00",
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
  "preparation_sha256": "20fb2090d27c6effaa0ff0da407456fceffc1aedea731afc5caef7dc7d0edc9f",
  "classification": "Exact V492 smaller-scope refinement. Reuses unchanged V439 scope and V444 integration executor/guard/assessment functions with original work and safety envelopes. All seven V436 assertion-name multiplicities must remain; lifecycle additionally requires actual process- and shared-device-limited intermediate scope choices and exact continuation. Native correctness only; no serving or default activation claim."
}

````````````

## Artifact SHA-256 092d5d1d7611ece64d15b8c11b8fbc477e775de6a8a0dc146b5fa810eafa5f71

Encoding: `gzip+base64`. Original bytes: 83255.

````````````text
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
````````````

## Artifact SHA-256 92d1265d054c782efcfd6889836fa0b100f039b24e8474500862814150505e18

Encoding: `utf-8`. Original bytes: 59252.

````````````text
{"elapsed_seconds": 0.0012856249999999847, "owned_rss_bytes": 245760, "owned_process_count": 1, "reclaimable_bytes": 41870163968, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 0.22407016700000001, "owned_rss_bytes": 2725675008, "owned_process_count": 1, "reclaimable_bytes": 37009981440, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 0.455942792, "owned_rss_bytes": 2955919360, "owned_process_count": 1, "reclaimable_bytes": 36926390272, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 0.677914333, "owned_rss_bytes": 2963587072, "owned_process_count": 1, "reclaimable_bytes": 36928978944, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 0.903603958, "owned_rss_bytes": 3004104704, "owned_process_count": 1, "reclaimable_bytes": 36803215360, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 1.131162083, "owned_rss_bytes": 3013165056, "owned_process_count": 1, "reclaimable_bytes": 36777246720, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 1.3558418749999999, "owned_rss_bytes": 3013492736, "owned_process_count": 1, "reclaimable_bytes": 36857430016, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 1.587453875, "owned_rss_bytes": 3013640192, "owned_process_count": 1, "reclaimable_bytes": 36825202688, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 1.816151417, "owned_rss_bytes": 3013787648, "owned_process_count": 1, "reclaimable_bytes": 36767318016, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 2.042725917, "owned_rss_bytes": 3014115328, "owned_process_count": 1, "reclaimable_bytes": 36711219200, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 2.268798625, "owned_rss_bytes": 3014246400, "owned_process_count": 1, "reclaimable_bytes": 36770234368, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 2.502520417, "owned_rss_bytes": 3015311360, "owned_process_count": 1, "reclaimable_bytes": 36759584768, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 2.737367083, "owned_rss_bytes": 3016769536, "owned_process_count": 1, "reclaimable_bytes": 36766367744, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 2.970947167, "owned_rss_bytes": 3016949760, "owned_process_count": 1, "reclaimable_bytes": 36774985728, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 3.2064241669999998, "owned_rss_bytes": 3017113600, "owned_process_count": 1, "reclaimable_bytes": 36734042112, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 3.432276083, "owned_rss_bytes": 3017375744, "owned_process_count": 1, "reclaimable_bytes": 36674109440, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 3.6615709169999997, "owned_rss_bytes": 3017555968, "owned_process_count": 1, "reclaimable_bytes": 36748115968, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 3.891391583, "owned_rss_bytes": 3017736192, "owned_process_count": 1, "reclaimable_bytes": 36707713024, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 4.1224507919999995, "owned_rss_bytes": 3017949184, "owned_process_count": 1, "reclaimable_bytes": 36744970240, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 4.359606208, "owned_rss_bytes": 3018129408, "owned_process_count": 1, "reclaimable_bytes": 36729913344, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 4.58665725, "owned_rss_bytes": 3019227136, "owned_process_count": 1, "reclaimable_bytes": 36710875136, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 4.8136723329999995, "owned_rss_bytes": 3020488704, "owned_process_count": 1, "reclaimable_bytes": 36752539648, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 5.039712833, "owned_rss_bytes": 3020537856, "owned_process_count": 1, "reclaimable_bytes": 36746969088, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 5.275887167, "owned_rss_bytes": 3020603392, "owned_process_count": 1, "reclaimable_bytes": 36678107136, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 5.503882833, "owned_rss_bytes": 3020668928, "owned_process_count": 1, "reclaimable_bytes": 36666310656, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 5.734309167, "owned_rss_bytes": 3020685312, "owned_process_count": 1, "reclaimable_bytes": 36684398592, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 5.965104667, "owned_rss_bytes": 3020718080, "owned_process_count": 1, "reclaimable_bytes": 36729274368, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 6.20204325, "owned_rss_bytes": 3020750848, "owned_process_count": 1, "reclaimable_bytes": 36698243072, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 6.435673833, "owned_rss_bytes": 3020816384, "owned_process_count": 1, "reclaimable_bytes": 36812767232, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 6.662883042, "owned_rss_bytes": 3021438976, "owned_process_count": 1, "reclaimable_bytes": 36821008384, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 6.890057625, "owned_rss_bytes": 3023060992, "owned_process_count": 1, "reclaimable_bytes": 36814897152, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 7.1218889999999995, "owned_rss_bytes": 3023175680, "owned_process_count": 1, "reclaimable_bytes": 36762206208, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 7.354140167, "owned_rss_bytes": 3023192064, "owned_process_count": 1, "reclaimable_bytes": 36710203392, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 7.588828542, "owned_rss_bytes": 3023224832, "owned_process_count": 1, "reclaimable_bytes": 36710744064, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 7.82055425, "owned_rss_bytes": 3023257600, "owned_process_count": 1, "reclaimable_bytes": 36714594304, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 8.048339708, "owned_rss_bytes": 3023306752, "owned_process_count": 1, "reclaimable_bytes": 36723261440, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 8.277856208000001, "owned_rss_bytes": 3023323136, "owned_process_count": 1, "reclaimable_bytes": 36624891904, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 8.499565375000001, "owned_rss_bytes": 3023355904, "owned_process_count": 1, "reclaimable_bytes": 36624334848, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 8.7251635, "owned_rss_bytes": 3024404480, "owned_process_count": 1, "reclaimable_bytes": 36700307456, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 8.954741542, "owned_rss_bytes": 3025993728, "owned_process_count": 1, "reclaimable_bytes": 36680450048, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 9.180864333, "owned_rss_bytes": 3025731584, "owned_process_count": 1, "reclaimable_bytes": 36684644352, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 9.418656375000001, "owned_rss_bytes": 3028156416, "owned_process_count": 1, "reclaimable_bytes": 36681318400, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 9.643753708, "owned_rss_bytes": 3029123072, "owned_process_count": 1, "reclaimable_bytes": 36590338048, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 9.874305667000002, "owned_rss_bytes": 3030073344, "owned_process_count": 1, "reclaimable_bytes": 36679057408, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 10.111752667000001, "owned_rss_bytes": 3030089728, "owned_process_count": 1, "reclaimable_bytes": 36635705344, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 10.3397515, "owned_rss_bytes": 3030122496, "owned_process_count": 1, "reclaimable_bytes": 36583456768, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 10.5611735, "owned_rss_bytes": 3030155264, "owned_process_count": 1, "reclaimable_bytes": 36655939584, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 10.785764833, "owned_rss_bytes": 3030220800, "owned_process_count": 1, "reclaimable_bytes": 36651057152, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 11.01479475, "owned_rss_bytes": 3032776704, "owned_process_count": 1, "reclaimable_bytes": 36722114560, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 11.250381667000001, "owned_rss_bytes": 3032498176, "owned_process_count": 1, "reclaimable_bytes": 36649795584, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 11.474994792, "owned_rss_bytes": 3032514560, "owned_process_count": 1, "reclaimable_bytes": 36580376576, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 11.707134333, "owned_rss_bytes": 3032547328, "owned_process_count": 1, "reclaimable_bytes": 36640587776, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 11.939161, "owned_rss_bytes": 3032596480, "owned_process_count": 1, "reclaimable_bytes": 36633608192, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 12.167700208000001, "owned_rss_bytes": 3032596480, "owned_process_count": 1, "reclaimable_bytes": 36557488128, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 12.398202917, "owned_rss_bytes": 3032645632, "owned_process_count": 1, "reclaimable_bytes": 36621680640, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 12.622537458, "owned_rss_bytes": 3032694784, "owned_process_count": 1, "reclaimable_bytes": 36558405632, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 12.852835500000001, "owned_rss_bytes": 3032727552, "owned_process_count": 1, "reclaimable_bytes": 36607082496, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 13.082221708, "owned_rss_bytes": 3033350144, "owned_process_count": 1, "reclaimable_bytes": 36646420480, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 13.301520625, "owned_rss_bytes": 3038314496, "owned_process_count": 1, "reclaimable_bytes": 36705894400, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 13.534335333000001, "owned_rss_bytes": 3039133696, "owned_process_count": 1, "reclaimable_bytes": 36568727552, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 13.769438792, "owned_rss_bytes": 3039150080, "owned_process_count": 1, "reclaimable_bytes": 36623253504, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 14.003332583, "owned_rss_bytes": 3039150080, "owned_process_count": 1, "reclaimable_bytes": 36589338624, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 14.233322833, "owned_rss_bytes": 3039166464, "owned_process_count": 1, "reclaimable_bytes": 36624318464, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 14.465401625, "owned_rss_bytes": 3039232000, "owned_process_count": 1, "reclaimable_bytes": 36622057472, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 14.698061583000001, "owned_rss_bytes": 3039248384, "owned_process_count": 1, "reclaimable_bytes": 36530569216, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 14.921373792, "owned_rss_bytes": 3039281152, "owned_process_count": 1, "reclaimable_bytes": 36591140864, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 15.152359083, "owned_rss_bytes": 3039674368, "owned_process_count": 1, "reclaimable_bytes": 36539400192, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 15.374726208, "owned_rss_bytes": 3041492992, "owned_process_count": 1, "reclaimable_bytes": 36531159040, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 15.611424167000001, "owned_rss_bytes": 3041509376, "owned_process_count": 1, "reclaimable_bytes": 36569006080, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 15.84203525, "owned_rss_bytes": 3041542144, "owned_process_count": 1, "reclaimable_bytes": 36519198720, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 16.074384125, "owned_rss_bytes": 3041607680, "owned_process_count": 1, "reclaimable_bytes": 36517838848, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 16.303046667, "owned_rss_bytes": 3041624064, "owned_process_count": 1, "reclaimable_bytes": 36603674624, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 16.532707333, "owned_rss_bytes": 3041640448, "owned_process_count": 1, "reclaimable_bytes": 36558323712, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 16.757618792000002, "owned_rss_bytes": 3041656832, "owned_process_count": 1, "reclaimable_bytes": 36607098880, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 16.984749417, "owned_rss_bytes": 3041673216, "owned_process_count": 1, "reclaimable_bytes": 36575838208, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 17.219749375, "owned_rss_bytes": 3041705984, "owned_process_count": 1, "reclaimable_bytes": 36606853120, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 17.444551125, "owned_rss_bytes": 3042328576, "owned_process_count": 1, "reclaimable_bytes": 36598448128, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 17.673957917, "owned_rss_bytes": 3046211584, "owned_process_count": 1, "reclaimable_bytes": 36667457536, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 17.906416833, "owned_rss_bytes": 3046326272, "owned_process_count": 1, "reclaimable_bytes": 36643045376, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 18.139216792, "owned_rss_bytes": 3046359040, "owned_process_count": 1, "reclaimable_bytes": 36634148864, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 18.373811708, "owned_rss_bytes": 3046375424, "owned_process_count": 1, "reclaimable_bytes": 36683120640, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 18.609108208000002, "owned_rss_bytes": 3046391808, "owned_process_count": 1, "reclaimable_bytes": 36610736128, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 18.840974708, "owned_rss_bytes": 3046408192, "owned_process_count": 1, "reclaimable_bytes": 36555276288, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 19.074229375, "owned_rss_bytes": 3046408192, "owned_process_count": 1, "reclaimable_bytes": 36636459008, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 19.306135208, "owned_rss_bytes": 3046424576, "owned_process_count": 1, "reclaimable_bytes": 36566417408, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 19.52782225, "owned_rss_bytes": 3047407616, "owned_process_count": 1, "reclaimable_bytes": 36647157760, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 19.751138417, "owned_rss_bytes": 3048751104, "owned_process_count": 1, "reclaimable_bytes": 36573380608, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 19.976628333, "owned_rss_bytes": 3048783872, "owned_process_count": 1, "reclaimable_bytes": 36570890240, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 20.199635417, "owned_rss_bytes": 3048800256, "owned_process_count": 1, "reclaimable_bytes": 36590764032, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 20.432409, "owned_rss_bytes": 3048833024, "owned_process_count": 1, "reclaimable_bytes": 36649779200, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 20.660370375, "owned_rss_bytes": 3048833024, "owned_process_count": 1, "reclaimable_bytes": 36656316416, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 20.905110458, "owned_rss_bytes": 3048849408, "owned_process_count": 1, "reclaimable_bytes": 36567744512, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 21.137825208000002, "owned_rss_bytes": 3048898560, "owned_process_count": 1, "reclaimable_bytes": 36643504128, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 21.366977792, "owned_rss_bytes": 3048914944, "owned_process_count": 1, "reclaimable_bytes": 36600512512, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 21.59133775, "owned_rss_bytes": 3053043712, "owned_process_count": 1, "reclaimable_bytes": 36544282624, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 21.822509, "owned_rss_bytes": 3055239168, "owned_process_count": 1, "reclaimable_bytes": 36644159488, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 22.057984625, "owned_rss_bytes": 3055386624, "owned_process_count": 1, "reclaimable_bytes": 36556111872, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 22.283570917000002, "owned_rss_bytes": 3055403008, "owned_process_count": 1, "reclaimable_bytes": 36639326208, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 22.513310833000002, "owned_rss_bytes": 3055419392, "owned_process_count": 1, "reclaimable_bytes": 36646699008, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 22.751235417, "owned_rss_bytes": 3055452160, "owned_process_count": 1, "reclaimable_bytes": 36637573120, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 22.981634375000002, "owned_rss_bytes": 3055517696, "owned_process_count": 1, "reclaimable_bytes": 36636327936, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 23.21412775, "owned_rss_bytes": 3055534080, "owned_process_count": 1, "reclaimable_bytes": 36598038528, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 23.441510125, "owned_rss_bytes": 3055566848, "owned_process_count": 1, "reclaimable_bytes": 36598136832, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 23.674699792000002, "owned_rss_bytes": 3055583232, "owned_process_count": 1, "reclaimable_bytes": 36620304384, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 23.904226208, "owned_rss_bytes": 3056222208, "owned_process_count": 1, "reclaimable_bytes": 36628021248, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 24.126298333, "owned_rss_bytes": 3057844224, "owned_process_count": 1, "reclaimable_bytes": 36643930112, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 24.364579042000003, "owned_rss_bytes": 3057876992, "owned_process_count": 1, "reclaimable_bytes": 36627906560, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 24.602617000000002, "owned_rss_bytes": 3057909760, "owned_process_count": 1, "reclaimable_bytes": 36624924672, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 24.828249125, "owned_rss_bytes": 3057909760, "owned_process_count": 1, "reclaimable_bytes": 36567351296, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 25.060492875, "owned_rss_bytes": 3057942528, "owned_process_count": 1, "reclaimable_bytes": 36653957120, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 25.290955708000002, "owned_rss_bytes": 3057942528, "owned_process_count": 1, "reclaimable_bytes": 36632887296, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 25.521941, "owned_rss_bytes": 3057958912, "owned_process_count": 1, "reclaimable_bytes": 36592943104, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 25.744763458, "owned_rss_bytes": 3057991680, "owned_process_count": 1, "reclaimable_bytes": 36559257600, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 25.974712417, "owned_rss_bytes": 3057991680, "owned_process_count": 1, "reclaimable_bytes": 36646912000, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 26.204260292, "owned_rss_bytes": 3060482048, "owned_process_count": 1, "reclaimable_bytes": 36700471296, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 26.43535, "owned_rss_bytes": 3060219904, "owned_process_count": 1, "reclaimable_bytes": 36710662144, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 26.669908083, "owned_rss_bytes": 3060236288, "owned_process_count": 1, "reclaimable_bytes": 36730863616, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 26.905017125, "owned_rss_bytes": 3060252672, "owned_process_count": 1, "reclaimable_bytes": 36654153728, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 27.138320125, "owned_rss_bytes": 3060269056, "owned_process_count": 1, "reclaimable_bytes": 36576411648, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 27.371966, "owned_rss_bytes": 3060285440, "owned_process_count": 1, "reclaimable_bytes": 36604887040, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 27.6069725, "owned_rss_bytes": 3062775808, "owned_process_count": 1, "reclaimable_bytes": 36613029888, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 27.836929458, "owned_rss_bytes": 3062792192, "owned_process_count": 1, "reclaimable_bytes": 36621500416, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 28.066372458, "owned_rss_bytes": 3062808576, "owned_process_count": 1, "reclaimable_bytes": 36588699648, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 28.299597000000002, "owned_rss_bytes": 3063414784, "owned_process_count": 1, "reclaimable_bytes": 36598480896, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 28.520780292, "owned_rss_bytes": 3065085952, "owned_process_count": 1, "reclaimable_bytes": 36594253824, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 28.746253208000002, "owned_rss_bytes": 3065102336, "owned_process_count": 1, "reclaimable_bytes": 36599463936, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 28.980766208000002, "owned_rss_bytes": 3065135104, "owned_process_count": 1, "reclaimable_bytes": 36593303552, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 29.207620208, "owned_rss_bytes": 3065135104, "owned_process_count": 1, "reclaimable_bytes": 36588208128, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 29.430484, "owned_rss_bytes": 3065151488, "owned_process_count": 1, "reclaimable_bytes": 36610424832, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 29.668712625, "owned_rss_bytes": 3065167872, "owned_process_count": 1, "reclaimable_bytes": 36571840512, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 29.902862083000002, "owned_rss_bytes": 3065184256, "owned_process_count": 1, "reclaimable_bytes": 36611276800, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 30.128369833, "owned_rss_bytes": 3065200640, "owned_process_count": 1, "reclaimable_bytes": 36605591552, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 30.363874917, "owned_rss_bytes": 3065217024, "owned_process_count": 1, "reclaimable_bytes": 36589699072, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 30.59361075, "owned_rss_bytes": 3067379712, "owned_process_count": 1, "reclaimable_bytes": 36584407040, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 30.826086167, "owned_rss_bytes": 3067445248, "owned_process_count": 1, "reclaimable_bytes": 36605247488, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 31.0668075, "owned_rss_bytes": 3067478016, "owned_process_count": 1, "reclaimable_bytes": 36676124672, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 31.302751208, "owned_rss_bytes": 3067510784, "owned_process_count": 1, "reclaimable_bytes": 36582785024, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 31.547431375000002, "owned_rss_bytes": 3067510784, "owned_process_count": 1, "reclaimable_bytes": 36575330304, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 31.780728125, "owned_rss_bytes": 3067559936, "owned_process_count": 1, "reclaimable_bytes": 36570857472, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 32.009184708, "owned_rss_bytes": 3067559936, "owned_process_count": 1, "reclaimable_bytes": 36516429824, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 32.243410749999995, "owned_rss_bytes": 3067592704, "owned_process_count": 1, "reclaimable_bytes": 36594647040, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 32.471620292, "owned_rss_bytes": 3067592704, "owned_process_count": 1, "reclaimable_bytes": 36583424000, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 32.706658708, "owned_rss_bytes": 3068542976, "owned_process_count": 1, "reclaimable_bytes": 36586455040, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 32.935175916999995, "owned_rss_bytes": 3069902848, "owned_process_count": 1, "reclaimable_bytes": 36593254400, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 33.168140916999995, "owned_rss_bytes": 3069935616, "owned_process_count": 1, "reclaimable_bytes": 36583260160, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 33.407099708, "owned_rss_bytes": 3069952000, "owned_process_count": 1, "reclaimable_bytes": 36596039680, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 33.63925425, "owned_rss_bytes": 3069984768, "owned_process_count": 1, "reclaimable_bytes": 36604624896, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 33.874147707999995, "owned_rss_bytes": 3070001152, "owned_process_count": 1, "reclaimable_bytes": 36608065536, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 34.105633458, "owned_rss_bytes": 3070001152, "owned_process_count": 1, "reclaimable_bytes": 36599267328, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 34.343424041999995, "owned_rss_bytes": 3090071552, "owned_process_count": 1, "reclaimable_bytes": 36558798848, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 34.572380042, "owned_rss_bytes": 3090104320, "owned_process_count": 1, "reclaimable_bytes": 36524703744, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 34.810262916999996, "owned_rss_bytes": 3090120704, "owned_process_count": 1, "reclaimable_bytes": 36578508800, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 35.037271999999994, "owned_rss_bytes": 3090219008, "owned_process_count": 1, "reclaimable_bytes": 36440424448, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 35.272216875, "owned_rss_bytes": 3090432000, "owned_process_count": 1, "reclaimable_bytes": 36515987456, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 35.5075065, "owned_rss_bytes": 3090432000, "owned_process_count": 1, "reclaimable_bytes": 36485726208, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 35.752770667, "owned_rss_bytes": 3090432000, "owned_process_count": 1, "reclaimable_bytes": 36358635520, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 35.987608458, "owned_rss_bytes": 3090464768, "owned_process_count": 1, "reclaimable_bytes": 36360519680, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 36.224293042, "owned_rss_bytes": 3090481152, "owned_process_count": 1, "reclaimable_bytes": 36336484352, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 36.464081916999994, "owned_rss_bytes": 3090513920, "owned_process_count": 1, "reclaimable_bytes": 36455202816, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 36.694656124999995, "owned_rss_bytes": 3090530304, "owned_process_count": 1, "reclaimable_bytes": 36318691328, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 36.932220791999995, "owned_rss_bytes": 3090563072, "owned_process_count": 1, "reclaimable_bytes": 36436852736, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 37.168445874999996, "owned_rss_bytes": 3090513920, "owned_process_count": 1, "reclaimable_bytes": 36389683200, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 37.40595825, "owned_rss_bytes": 3090546688, "owned_process_count": 1, "reclaimable_bytes": 36217782272, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 37.633348207999994, "owned_rss_bytes": 3090530304, "owned_process_count": 1, "reclaimable_bytes": 36452433920, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 37.873476417, "owned_rss_bytes": 3091906560, "owned_process_count": 1, "reclaimable_bytes": 36432969728, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 38.101297124999995, "owned_rss_bytes": 3090612224, "owned_process_count": 1, "reclaimable_bytes": 36472569856, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 38.337700207999994, "owned_rss_bytes": 3090628608, "owned_process_count": 1, "reclaimable_bytes": 36397481984, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 38.577105833, "owned_rss_bytes": 3090677760, "owned_process_count": 1, "reclaimable_bytes": 36237099008, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 38.813236292, "owned_rss_bytes": 3090661376, "owned_process_count": 1, "reclaimable_bytes": 36157030400, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 39.039019208, "owned_rss_bytes": 3090759680, "owned_process_count": 1, "reclaimable_bytes": 36136861696, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 39.266865708, "owned_rss_bytes": 3090726912, "owned_process_count": 1, "reclaimable_bytes": 36251942912, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 39.497530583, "owned_rss_bytes": 3090710528, "owned_process_count": 1, "reclaimable_bytes": 36105224192, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 39.725788916999996, "owned_rss_bytes": 3090710528, "owned_process_count": 1, "reclaimable_bytes": 36222205952, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 39.955959541999995, "owned_rss_bytes": 3090726912, "owned_process_count": 1, "reclaimable_bytes": 36215521280, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 40.183928208, "owned_rss_bytes": 3090743296, "owned_process_count": 1, "reclaimable_bytes": 36233953280, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 40.416534833, "owned_rss_bytes": 3090759680, "owned_process_count": 1, "reclaimable_bytes": 36100915200, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 40.641779582999995, "owned_rss_bytes": 3091546112, "owned_process_count": 1, "reclaimable_bytes": 36224237568, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 40.873082583, "owned_rss_bytes": 3090808832, "owned_process_count": 1, "reclaimable_bytes": 36237787136, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 41.109413333, "owned_rss_bytes": 3090825216, "owned_process_count": 1, "reclaimable_bytes": 36229300224, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 41.354630582999995, "owned_rss_bytes": 3090841600, "owned_process_count": 1, "reclaimable_bytes": 36194910208, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 41.589561583, "owned_rss_bytes": 3090939904, "owned_process_count": 1, "reclaimable_bytes": 36197269504, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 41.823402417, "owned_rss_bytes": 3090989056, "owned_process_count": 1, "reclaimable_bytes": 36150476800, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 42.055936624999994, "owned_rss_bytes": 3091021824, "owned_process_count": 1, "reclaimable_bytes": 36306485248, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 42.289297458, "owned_rss_bytes": 3091054592, "owned_process_count": 1, "reclaimable_bytes": 36315955200, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 42.522599541999995, "owned_rss_bytes": 3091087360, "owned_process_count": 1, "reclaimable_bytes": 36292591616, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 42.756613208, "owned_rss_bytes": 3091103744, "owned_process_count": 1, "reclaimable_bytes": 36115546112, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 42.990082083, "owned_rss_bytes": 3091136512, "owned_process_count": 1, "reclaimable_bytes": 36250943488, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 43.222605625, "owned_rss_bytes": 3091152896, "owned_process_count": 1, "reclaimable_bytes": 36288118784, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 43.469931792, "owned_rss_bytes": 3091922944, "owned_process_count": 1, "reclaimable_bytes": 36278108160, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 43.70545, "owned_rss_bytes": 3091251200, "owned_process_count": 1, "reclaimable_bytes": 36291395584, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 43.936263292, "owned_rss_bytes": 3091283968, "owned_process_count": 1, "reclaimable_bytes": 36161060864, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 44.179353582999994, "owned_rss_bytes": 3091316736, "owned_process_count": 1, "reclaimable_bytes": 36274667520, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 44.410697666999994, "owned_rss_bytes": 3091316736, "owned_process_count": 1, "reclaimable_bytes": 36270161920, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 44.64606275, "owned_rss_bytes": 3091234816, "owned_process_count": 1, "reclaimable_bytes": 36258840576, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 44.887622207999996, "owned_rss_bytes": 3091300352, "owned_process_count": 1, "reclaimable_bytes": 36281909248, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 45.131868374999996, "owned_rss_bytes": 3091316736, "owned_process_count": 1, "reclaimable_bytes": 36083171328, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 45.360524542, "owned_rss_bytes": 3091382272, "owned_process_count": 1, "reclaimable_bytes": 36140515328, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 45.588501957999995, "owned_rss_bytes": 3091382272, "owned_process_count": 1, "reclaimable_bytes": 36074323968, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 45.825963083, "owned_rss_bytes": 3091333120, "owned_process_count": 1, "reclaimable_bytes": 36257955840, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 46.057340208, "owned_rss_bytes": 3091333120, "owned_process_count": 1, "reclaimable_bytes": 36214358016, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 46.287581583, "owned_rss_bytes": 3091349504, "owned_process_count": 1, "reclaimable_bytes": 36315316224, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 46.520221917, "owned_rss_bytes": 3091382272, "owned_process_count": 1, "reclaimable_bytes": 36204314624, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 46.756209332999994, "owned_rss_bytes": 3091431424, "owned_process_count": 1, "reclaimable_bytes": 36228071424, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 46.989296958, "owned_rss_bytes": 3091464192, "owned_process_count": 1, "reclaimable_bytes": 36273340416, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 47.224297416999995, "owned_rss_bytes": 3091464192, "owned_process_count": 1, "reclaimable_bytes": 36186062848, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 47.462031417, "owned_rss_bytes": 3091480576, "owned_process_count": 1, "reclaimable_bytes": 36254007296, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 47.701504, "owned_rss_bytes": 3091529728, "owned_process_count": 1, "reclaimable_bytes": 36257284096, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 47.939336, "owned_rss_bytes": 3095429120, "owned_process_count": 1, "reclaimable_bytes": 36183900160, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 48.177791666999994, "owned_rss_bytes": 3095478272, "owned_process_count": 1, "reclaimable_bytes": 36227760128, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 48.405516667, "owned_rss_bytes": 3095494656, "owned_process_count": 1, "reclaimable_bytes": 36182343680, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 48.646368124999995, "owned_rss_bytes": 3095773184, "owned_process_count": 1, "reclaimable_bytes": 36303028224, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 48.891199166999996, "owned_rss_bytes": 3095773184, "owned_process_count": 1, "reclaimable_bytes": 36306501632, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 49.130157125, "owned_rss_bytes": 3095789568, "owned_process_count": 1, "reclaimable_bytes": 36313415680, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 49.368207458, "owned_rss_bytes": 3097067520, "owned_process_count": 1, "reclaimable_bytes": 36266606592, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 49.599023083, "owned_rss_bytes": 3095773184, "owned_process_count": 1, "reclaimable_bytes": 36152901632, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 49.834100958, "owned_rss_bytes": 3095805952, "owned_process_count": 1, "reclaimable_bytes": 36279435264, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 50.074303042, "owned_rss_bytes": 3095805952, "owned_process_count": 1, "reclaimable_bytes": 36266901504, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 50.307623207999995, "owned_rss_bytes": 3095822336, "owned_process_count": 1, "reclaimable_bytes": 36242178048, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 50.540960166999994, "owned_rss_bytes": 3095838720, "owned_process_count": 1, "reclaimable_bytes": 36325179392, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 50.776076167, "owned_rss_bytes": 3095855104, "owned_process_count": 1, "reclaimable_bytes": 36411064320, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 51.011836917, "owned_rss_bytes": 3095871488, "owned_process_count": 1, "reclaimable_bytes": 36262887424, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 51.238603125, "owned_rss_bytes": 3095904256, "owned_process_count": 1, "reclaimable_bytes": 36330717184, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 51.477168625, "owned_rss_bytes": 3095969792, "owned_process_count": 1, "reclaimable_bytes": 36324491264, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 51.713893332999994, "owned_rss_bytes": 3095937024, "owned_process_count": 1, "reclaimable_bytes": 36340252672, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 51.949826875, "owned_rss_bytes": 3095969792, "owned_process_count": 1, "reclaimable_bytes": 36250648576, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 52.183774832999994, "owned_rss_bytes": 3097264128, "owned_process_count": 1, "reclaimable_bytes": 36266246144, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 52.41509, "owned_rss_bytes": 3095969792, "owned_process_count": 1, "reclaimable_bytes": 36281319424, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 52.655902708, "owned_rss_bytes": 3095986176, "owned_process_count": 1, "reclaimable_bytes": 36287217664, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 52.891753832999996, "owned_rss_bytes": 3096035328, "owned_process_count": 1, "reclaimable_bytes": 36200841216, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 53.130894624999996, "owned_rss_bytes": 3096035328, "owned_process_count": 1, "reclaimable_bytes": 36325212160, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 53.372277917, "owned_rss_bytes": 3096035328, "owned_process_count": 1, "reclaimable_bytes": 36336566272, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 53.603584624999996, "owned_rss_bytes": 3096051712, "owned_process_count": 1, "reclaimable_bytes": 36155899904, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 53.836025, "owned_rss_bytes": 3096100864, "owned_process_count": 1, "reclaimable_bytes": 36342579200, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 54.071511125, "owned_rss_bytes": 3096084480, "owned_process_count": 1, "reclaimable_bytes": 36176510976, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 54.302635042, "owned_rss_bytes": 3096215552, "owned_process_count": 1, "reclaimable_bytes": 36158078976, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 54.534175749999996, "owned_rss_bytes": 3096133632, "owned_process_count": 1, "reclaimable_bytes": 36317478912, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 54.775728707999995, "owned_rss_bytes": 3096133632, "owned_process_count": 1, "reclaimable_bytes": 36182458368, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 55.008732249999994, "owned_rss_bytes": 3096133632, "owned_process_count": 1, "reclaimable_bytes": 36242456576, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 55.248844542, "owned_rss_bytes": 3096166400, "owned_process_count": 1, "reclaimable_bytes": 36291018752, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 55.482459, "owned_rss_bytes": 3096199168, "owned_process_count": 1, "reclaimable_bytes": 36271865856, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 55.723496208, "owned_rss_bytes": 3096215552, "owned_process_count": 1, "reclaimable_bytes": 36287152128, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 55.963082625, "owned_rss_bytes": 3096231936, "owned_process_count": 1, "reclaimable_bytes": 36297474048, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 56.205141624999996, "owned_rss_bytes": 3096248320, "owned_process_count": 1, "reclaimable_bytes": 36303732736, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 56.450386042, "owned_rss_bytes": 3096297472, "owned_process_count": 1, "reclaimable_bytes": 36276748288, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 56.69142375, "owned_rss_bytes": 3096281088, "owned_process_count": 1, "reclaimable_bytes": 36193730560, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 56.925415791999995, "owned_rss_bytes": 3096297472, "owned_process_count": 1, "reclaimable_bytes": 36219699200, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 57.156553667, "owned_rss_bytes": 3096330240, "owned_process_count": 1, "reclaimable_bytes": 36233330688, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 57.400990082999996, "owned_rss_bytes": 3096313856, "owned_process_count": 1, "reclaimable_bytes": 36351131648, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 57.641399916999994, "owned_rss_bytes": 3096363008, "owned_process_count": 1, "reclaimable_bytes": 36416061440, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 57.873287041999994, "owned_rss_bytes": 3096346624, "owned_process_count": 1, "reclaimable_bytes": 36373577728, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 58.122060125, "owned_rss_bytes": 3096412160, "owned_process_count": 1, "reclaimable_bytes": 36264263680, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 58.355977249999995, "owned_rss_bytes": 3096756224, "owned_process_count": 1, "reclaimable_bytes": 34579611648, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 58.593483082999995, "owned_rss_bytes": 3097985024, "owned_process_count": 1, "reclaimable_bytes": 36305207296, "swapins": 44356321, "swapouts": 77895019}
{"elapsed_seconds": 58.827642, "owned_rss_bytes": 3096674304, "owned_process_count": 1, "reclaimable_bytes": 34817835008, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 59.071300957999995, "owned_rss_bytes": 3096690688, "owned_process_count": 1, "reclaimable_bytes": 36184948736, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 59.306143625, "owned_rss_bytes": 3096788992, "owned_process_count": 1, "reclaimable_bytes": 34510897152, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 59.543786667, "owned_rss_bytes": 3096870912, "owned_process_count": 1, "reclaimable_bytes": 35472850944, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 59.772646042, "owned_rss_bytes": 3096707072, "owned_process_count": 1, "reclaimable_bytes": 36242980864, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 60.006839125, "owned_rss_bytes": 3096723456, "owned_process_count": 1, "reclaimable_bytes": 34905505792, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 60.250519125, "owned_rss_bytes": 3096723456, "owned_process_count": 1, "reclaimable_bytes": 36207591424, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 60.484924832999994, "owned_rss_bytes": 3096821760, "owned_process_count": 1, "reclaimable_bytes": 34544091136, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 60.720904999999995, "owned_rss_bytes": 3096739840, "owned_process_count": 1, "reclaimable_bytes": 34890956800, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 60.955990875, "owned_rss_bytes": 3096739840, "owned_process_count": 1, "reclaimable_bytes": 36191518720, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 61.190089832999995, "owned_rss_bytes": 3096887296, "owned_process_count": 1, "reclaimable_bytes": 34469888000, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 61.423026666999995, "owned_rss_bytes": 3096739840, "owned_process_count": 1, "reclaimable_bytes": 36113317888, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 61.657299208, "owned_rss_bytes": 3096887296, "owned_process_count": 1, "reclaimable_bytes": 34500427776, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 61.881729916999994, "owned_rss_bytes": 3096739840, "owned_process_count": 1, "reclaimable_bytes": 34889613312, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 62.112100542, "owned_rss_bytes": 3096739840, "owned_process_count": 1, "reclaimable_bytes": 36192305152, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 62.346484917, "owned_rss_bytes": 3096854528, "owned_process_count": 1, "reclaimable_bytes": 34551382016, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 62.574823667, "owned_rss_bytes": 3096920064, "owned_process_count": 1, "reclaimable_bytes": 35651764224, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 62.807298042, "owned_rss_bytes": 3096739840, "owned_process_count": 1, "reclaimable_bytes": 36183031808, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 63.039993249999995, "owned_rss_bytes": 3096838144, "owned_process_count": 1, "reclaimable_bytes": 34677735424, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 63.273645167, "owned_rss_bytes": 3096739840, "owned_process_count": 1, "reclaimable_bytes": 35234627584, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 63.505862207999996, "owned_rss_bytes": 3096739840, "owned_process_count": 1, "reclaimable_bytes": 36138942464, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 63.73251575, "owned_rss_bytes": 3096903680, "owned_process_count": 1, "reclaimable_bytes": 34474409984, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 63.958144417, "owned_rss_bytes": 3096756224, "owned_process_count": 1, "reclaimable_bytes": 34853060608, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 64.195217375, "owned_rss_bytes": 3096756224, "owned_process_count": 1, "reclaimable_bytes": 36092198912, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 64.42719025, "owned_rss_bytes": 3096920064, "owned_process_count": 1, "reclaimable_bytes": 34466004992, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 64.657641292, "owned_rss_bytes": 3096772608, "owned_process_count": 1, "reclaimable_bytes": 34847129600, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 64.88888962499999, "owned_rss_bytes": 3096772608, "owned_process_count": 1, "reclaimable_bytes": 36130095104, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 65.120392375, "owned_rss_bytes": 3096870912, "owned_process_count": 1, "reclaimable_bytes": 34486370304, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 65.35341370799999, "owned_rss_bytes": 3096772608, "owned_process_count": 1, "reclaimable_bytes": 34836168704, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 65.5872895, "owned_rss_bytes": 3096772608, "owned_process_count": 1, "reclaimable_bytes": 36078977024, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 65.817193, "owned_rss_bytes": 3096788992, "owned_process_count": 1, "reclaimable_bytes": 35973988352, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 66.042204333, "owned_rss_bytes": 3096788992, "owned_process_count": 1, "reclaimable_bytes": 34903670784, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 66.278745542, "owned_rss_bytes": 3096788992, "owned_process_count": 1, "reclaimable_bytes": 36118921216, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 66.506002375, "owned_rss_bytes": 3096887296, "owned_process_count": 1, "reclaimable_bytes": 34452078592, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 66.731066375, "owned_rss_bytes": 3096805376, "owned_process_count": 1, "reclaimable_bytes": 34826174464, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 66.97103741699999, "owned_rss_bytes": 3096772608, "owned_process_count": 1, "reclaimable_bytes": 36192108544, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 67.20390608299999, "owned_rss_bytes": 3096870912, "owned_process_count": 1, "reclaimable_bytes": 34619195392, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 67.437967625, "owned_rss_bytes": 3096936448, "owned_process_count": 1, "reclaimable_bytes": 35469393920, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 67.67130816699999, "owned_rss_bytes": 3096788992, "owned_process_count": 1, "reclaimable_bytes": 36169564160, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 67.904305083, "owned_rss_bytes": 3096936448, "owned_process_count": 1, "reclaimable_bytes": 34517811200, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 68.13874787499999, "owned_rss_bytes": 3096788992, "owned_process_count": 1, "reclaimable_bytes": 34795110400, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 68.372674542, "owned_rss_bytes": 3096788992, "owned_process_count": 1, "reclaimable_bytes": 36068835328, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 68.605326583, "owned_rss_bytes": 3096887296, "owned_process_count": 1, "reclaimable_bytes": 35327787008, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 68.838638125, "owned_rss_bytes": 3096805376, "owned_process_count": 1, "reclaimable_bytes": 34792718336, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 69.066595958, "owned_rss_bytes": 3096805376, "owned_process_count": 1, "reclaimable_bytes": 36113154048, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 69.291399542, "owned_rss_bytes": 3096805376, "owned_process_count": 1, "reclaimable_bytes": 36101570560, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 69.524724792, "owned_rss_bytes": 3096952832, "owned_process_count": 1, "reclaimable_bytes": 34409857024, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 69.75601275, "owned_rss_bytes": 3096805376, "owned_process_count": 1, "reclaimable_bytes": 36195205120, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 69.988441833, "owned_rss_bytes": 3096821760, "owned_process_count": 1, "reclaimable_bytes": 36151820288, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 70.22080029199999, "owned_rss_bytes": 3096920064, "owned_process_count": 1, "reclaimable_bytes": 34451783680, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 70.46014575, "owned_rss_bytes": 3096821760, "owned_process_count": 1, "reclaimable_bytes": 34842820608, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 70.68937325, "owned_rss_bytes": 3096838144, "owned_process_count": 1, "reclaimable_bytes": 36136484864, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 70.916531208, "owned_rss_bytes": 3096838144, "owned_process_count": 1, "reclaimable_bytes": 35540205568, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 71.141417208, "owned_rss_bytes": 3096838144, "owned_process_count": 1, "reclaimable_bytes": 34571173888, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 71.380989542, "owned_rss_bytes": 3096854528, "owned_process_count": 1, "reclaimable_bytes": 36169924608, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 71.606819, "owned_rss_bytes": 3096854528, "owned_process_count": 1, "reclaimable_bytes": 36095082496, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 71.83933683299999, "owned_rss_bytes": 3097001984, "owned_process_count": 1, "reclaimable_bytes": 34400387072, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 72.074343667, "owned_rss_bytes": 3096854528, "owned_process_count": 1, "reclaimable_bytes": 35652370432, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 72.306346625, "owned_rss_bytes": 3096854528, "owned_process_count": 1, "reclaimable_bytes": 36080844800, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 72.531843208, "owned_rss_bytes": 3096969216, "owned_process_count": 1, "reclaimable_bytes": 34386739200, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 72.75808875, "owned_rss_bytes": 3096870912, "owned_process_count": 1, "reclaimable_bytes": 36035788800, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 72.991887875, "owned_rss_bytes": 3096870912, "owned_process_count": 1, "reclaimable_bytes": 35906306048, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 73.225299292, "owned_rss_bytes": 3096870912, "owned_process_count": 1, "reclaimable_bytes": 34705473536, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 73.466943875, "owned_rss_bytes": 3096870912, "owned_process_count": 1, "reclaimable_bytes": 35912040448, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 73.703548958, "owned_rss_bytes": 3096887296, "owned_process_count": 1, "reclaimable_bytes": 35501195264, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 73.940998708, "owned_rss_bytes": 3096887296, "owned_process_count": 1, "reclaimable_bytes": 34679717888, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 74.174291875, "owned_rss_bytes": 3096887296, "owned_process_count": 1, "reclaimable_bytes": 35938992128, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 74.40553204199999, "owned_rss_bytes": 3097034752, "owned_process_count": 1, "reclaimable_bytes": 34294431744, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 74.640962833, "owned_rss_bytes": 3096903680, "owned_process_count": 1, "reclaimable_bytes": 34706440192, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 74.872675542, "owned_rss_bytes": 3096903680, "owned_process_count": 1, "reclaimable_bytes": 35992453120, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 75.10699295799999, "owned_rss_bytes": 3097051136, "owned_process_count": 1, "reclaimable_bytes": 34373468160, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 75.340962167, "owned_rss_bytes": 3097559040, "owned_process_count": 1, "reclaimable_bytes": 36099391488, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 75.56902025, "owned_rss_bytes": 3099115520, "owned_process_count": 1, "reclaimable_bytes": 36125589504, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 75.808149292, "owned_rss_bytes": 3099181056, "owned_process_count": 1, "reclaimable_bytes": 36052025344, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 76.039355083, "owned_rss_bytes": 3099213824, "owned_process_count": 1, "reclaimable_bytes": 36019535872, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 76.272644125, "owned_rss_bytes": 3099721728, "owned_process_count": 1, "reclaimable_bytes": 36024401920, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 76.501677833, "owned_rss_bytes": 3099820032, "owned_process_count": 1, "reclaimable_bytes": 36022927360, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 76.737435208, "owned_rss_bytes": 3099869184, "owned_process_count": 1, "reclaimable_bytes": 36021305344, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 76.96633375, "owned_rss_bytes": 3101114368, "owned_process_count": 1, "reclaimable_bytes": 35832102912, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 77.202401542, "owned_rss_bytes": 3101196288, "owned_process_count": 1, "reclaimable_bytes": 35840655360, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 77.43935325, "owned_rss_bytes": 3101245440, "owned_process_count": 1, "reclaimable_bytes": 35693019136, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 77.667736167, "owned_rss_bytes": 3101343744, "owned_process_count": 1, "reclaimable_bytes": 35718397952, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 77.89970275, "owned_rss_bytes": 3101409280, "owned_process_count": 1, "reclaimable_bytes": 35759570944, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 78.130832875, "owned_rss_bytes": 3101523968, "owned_process_count": 1, "reclaimable_bytes": 35697541120, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 78.358125125, "owned_rss_bytes": 3101605888, "owned_process_count": 1, "reclaimable_bytes": 35727736832, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 78.590907375, "owned_rss_bytes": 3101671424, "owned_process_count": 1, "reclaimable_bytes": 35818586112, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 78.81547391699999, "owned_rss_bytes": 3101704192, "owned_process_count": 1, "reclaimable_bytes": 35600039936, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 79.040964958, "owned_rss_bytes": 3101720576, "owned_process_count": 1, "reclaimable_bytes": 35802546176, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 79.26596925, "owned_rss_bytes": 3101753344, "owned_process_count": 1, "reclaimable_bytes": 35669245952, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 79.4893435, "owned_rss_bytes": 3101802496, "owned_process_count": 1, "reclaimable_bytes": 35773366272, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 79.713811083, "owned_rss_bytes": 3101786112, "owned_process_count": 1, "reclaimable_bytes": 35795746816, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 79.939350625, "owned_rss_bytes": 3101818880, "owned_process_count": 1, "reclaimable_bytes": 35558457344, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 80.171887, "owned_rss_bytes": 3101835264, "owned_process_count": 1, "reclaimable_bytes": 35658612736, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 80.403778875, "owned_rss_bytes": 3101851648, "owned_process_count": 1, "reclaimable_bytes": 35762585600, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 80.629616208, "owned_rss_bytes": 3101868032, "owned_process_count": 1, "reclaimable_bytes": 35603169280, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 80.857626, "owned_rss_bytes": 3101917184, "owned_process_count": 1, "reclaimable_bytes": 35708321792, "swapins": 44356333, "swapouts": 77895019}
{"elapsed_seconds": 81.08046937499999, "owned_rss_bytes": 0, "owned_process_count": 1, "reclaimable_bytes": 40628797440, "swapins": 44356333, "swapouts": 77895019}

````````````

## Artifact SHA-256 b81a0edbd9e0d35320e0031c899bdd5e61cbd2b3b29e6ed62510d97737eddbe9

Encoding: `utf-8`. Original bytes: 2691.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "8ff37c1869f6b52ffcd9452f9d474a4ec873afb90bc7dae43cd888eadb0b1f3e",
  "exit_code": 0,
  "assertions": 817,
  "original_assertion_coverage_preserved": true,
  "automatic_native_metrics": {},
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 81.449519584,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41821814784,
    "swapins": 44356333,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   463974.\nPages active:                                1110424.\nPages inactive:                               966631.\nPages speculative:                            143073.\nPages throttled:                                   0.\nPages wired down:                             220520.\nPages purgeable:                                1231.\n\"Translation faults\":                    18430771155.\nPages copy-on-write:                      1042340287.\nPages zero filled:                       28361751861.\nPages reactivated:                        5412747478.\nPages purged:                               97283692.\nFile-backed pages:                           2087396.\nAnonymous pages:                              132732.\nPages stored in compressor:                   653261.\nPages occupied by compressor:                 173861.\nDecompressions:                           1473699762.\nCompressions:                             1814448561.\nPageins:                                  9649575155.\nPageouts:                                   11643979.\nSwapins:                                    44356333.\nSwapouts:                                   77895019.\nPages tagged:                                 158588.\nPages tagged resident:                        110821.\nPages tagged compressed:                       47767.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         6932.\nPages tag-storage non-tag pageable:            84498.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8260160.\nTagged compressions:                        14859784.\nTagged decompressions:                      13795652.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "74f4557310de989b4646be90bf741687dfc35cc1744678124bf9389069ce8281",
  "execution_receipt_sha256": "2be332206451fe4eae7fe42bcaa8d990a616a4df3d8d19d46e39535b1ffc9777"
}

````````````

## Artifact SHA-256 2be332206451fe4eae7fe42bcaa8d990a616a4df3d8d19d46e39535b1ffc9777

Encoding: `utf-8`. Original bytes: 2593.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "8ff37c1869f6b52ffcd9452f9d474a4ec873afb90bc7dae43cd888eadb0b1f3e",
  "exit_code": 0,
  "assertions": 817,
  "original_assertion_coverage_preserved": true,
  "automatic_native_metrics": {},
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 81.449519584,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41821814784,
    "swapins": 44356333,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   463974.\nPages active:                                1110424.\nPages inactive:                               966631.\nPages speculative:                            143073.\nPages throttled:                                   0.\nPages wired down:                             220520.\nPages purgeable:                                1231.\n\"Translation faults\":                    18430771155.\nPages copy-on-write:                      1042340287.\nPages zero filled:                       28361751861.\nPages reactivated:                        5412747478.\nPages purged:                               97283692.\nFile-backed pages:                           2087396.\nAnonymous pages:                              132732.\nPages stored in compressor:                   653261.\nPages occupied by compressor:                 173861.\nDecompressions:                           1473699762.\nCompressions:                             1814448561.\nPageins:                                  9649575155.\nPageouts:                                   11643979.\nSwapins:                                    44356333.\nSwapouts:                                   77895019.\nPages tagged:                                 158588.\nPages tagged resident:                        110821.\nPages tagged compressed:                       47767.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         6932.\nPages tag-storage non-tag pageable:            84498.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8260160.\nTagged compressions:                        14859784.\nTagged decompressions:                      13795652.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "74f4557310de989b4646be90bf741687dfc35cc1744678124bf9389069ce8281"
}

````````````

## Artifact SHA-256 74f4557310de989b4646be90bf741687dfc35cc1744678124bf9389069ce8281

Encoding: `gzip+base64`. Original bytes: 163508.

````````````text
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
````````````

## Artifact SHA-256 26cbde13c6cfe7df960d14c29e7620f3c0500817affcf6ea97390dc84aa22176

Encoding: `utf-8`. Original bytes: 23077.

````````````text
{
  "started_at": "2026-09-09T09:49:40.105372+00:00",
  "deadline_utc": "2026-09-09T10:45:00Z",
  "command": [
    "/usr/bin/env",
    "SLOTSTREAM_OPT_WORKSPACE_TILE=1024",
    "SLOTSTREAM_OPT_SCOPE_FRONTIER=1",
    "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "scope-integrated-lifecycle",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
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
        "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
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
        "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
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
      "source_archive_sha256": "6369274313f2baa58e96a0e81b09878173b24e69149ffc4c939812a4c9b7a763",
      "binary_sha256": "d3701afdb0540850f376ca9a696a2a0ffa31a67121362e341f87ebc9e27fd7dc",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 40866791424,
    "swapins": 44356313,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     6183.\nPages active:                                 709516.\nPages inactive:                              1984291.\nPages speculative:                              1580.\nPages throttled:                                   0.\nPages wired down:                             221840.\nPages purgeable:                                2842.\n\"Translation faults\":                    18420578586.\nPages copy-on-write:                      1040836276.\nPages zero filled:                       27879918597.\nPages reactivated:                        5409346773.\nPages purged:                               97252375.\nFile-backed pages:                           2485286.\nAnonymous pages:                              210101.\nPages stored in compressor:                   592708.\nPages occupied by compressor:                 159670.\nDecompressions:                           1467834734.\nCompressions:                             1808026346.\nPageins:                                  9646927321.\nPageouts:                                   11642470.\nSwapins:                                    44356313.\nSwapouts:                                   77895019.\nPages tagged:                                 161201.\nPages tagged resident:                        120182.\nPages tagged compressed:                       41019.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6895.\nPages tag-storage free:                         2322.\nPages tag-storage non-tag pageable:            89076.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    6926464.\nTagged compressions:                        14833710.\nTagged decompressions:                      13777871.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T09:49:40.105060+00:00",
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
  "preparation_sha256": "20fb2090d27c6effaa0ff0da407456fceffc1aedea731afc5caef7dc7d0edc9f",
  "classification": "Exact V492 smaller-scope refinement. Reuses unchanged V439 scope and V444 integration executor/guard/assessment functions with original work and safety envelopes. All seven V436 assertion-name multiplicities must remain; lifecycle additionally requires actual process- and shared-device-limited intermediate scope choices and exact continuation. Native correctness only; no serving or default activation claim."
}

````````````

## Artifact SHA-256 96a42aaa22bba220e82f092cef3b201515c7ea3cd2cbf4b0da805801f92d24f4

Encoding: `gzip+base64`. Original bytes: 354560.

````````````text
H4sIAAAAAAAC/9S9bc8lx3El+H1/BaFPs4BZzJeIjEgD88Hr9QCDHY8FSzv7Yb0gWs2W1DPNbm5307I8mP++59TTTfLSVGXNExUFLC0YkPjce+tUZkbG6zn//X/54otfvXz37bcv3n7zq7/+4v/Gf8X/8NX3H95/9bvXb7969faff/VXT//bb/7TP/z2N7/9x7/7m7//+h9+/duv/69/+Mf/4ze//pu//buvf/sf/9Pf/ftamvyFv/zN3/7Dr//u6//wj//wn3/7H//uH/99/fxnX/2fH169//DVyxfv37z78NWv37/7r69efvzw1Yc37z5++Pj+1Ytvv9p+9/3rN9989e67j6+/ff2vLz6+fvf2qxffvMB//edXX354+e67V1/uf/HlP8ts+KK337z+5sXHVz/5is+/9dOv+PLDR/zRly//+Orlf/v877/88p9fvH/94u3Hz//D07e/fvvx1R/e46+/+fLN69+/evnnl29e/fiRb9998+rNL6PZfoJi/7MPX/2/f3r1tvuXv3/z4sMfv3z76l8+fvntm3/5Un73+uOP3/hfP7x7+yv8l/+H/8uvvnv35vXLP2NV/vunZ/r44v3H77/7+v2rl29evP72xe/evPr6d3/++OoD/qSVWlvZ//n0bd++fvv62++//foNXtYvfqSXz/98/sSLf9k/8e5Pb1998/X7Dx9++NNqP//2Dy++/Q7fxRf0/p9fvPn6w6uX795+w78tW/vZ9+1r9JO/qP7j13x8993X795+/fbVn77+8KcX3737/iP/4vcv3nx4hb/4H/t7+N2r3797/+rH9/Ddiz/8iKKO7vLp234JpRQfY7Ymc3z+TfzO67f7v5Ouo9f+k3/x6QHMfGqp8/MXv/gT/sdf/f2Ll3/84r+8xiK8ePPF37/69t37P3/xG2ym1x8+vn754a+/+Hd8si8+vP7XV1+8+/3Tk32xP8f/+k9vf41/9eGL379/9eqvvzjzz6ju2+ePvXjJLb/+oJWpvf3wsddvT32wTpc2+w8f+/Ddq5ffv3lx5pPq9YePffzj+3cfP7559c0ZgOWHj/3p9ftX33zxDTbd8edaq3jMHz723ffv//CKK738tfb0sX/61W/fv3j74c1uA7DDvn/z8cM//eoXP80fKmqz/QQd7MGfv4Tx+NP71x//0m/Wgt3Wh/QfP/avr96/++L3r98cvJZmbnNWHzp++BgMB1eOlucv4lMps8sw648vZfn+pzVt3RQf+w+v38CGvnj537AE3Lwfjj7bxLX5xMf+5u27t3/+9t33H9Yf4ucqjJP9uL0+vuOKv36Ld/rtd+9fffjw7v0vfYPOZuXHM/Du5cvvv3uND/7uz4cfrDqHcXv9768+/xkW/PAZK96id7Eu+NjfnvwQt0nx0gbW4NNDvl594un1D4FBst4+b2banDNnptYhTXZsv3myYadMyWcr9+ljZ3/tswn88Xy/+MMfzhzuOnBX1J99DDv6w+tvXr39+Bc/zw95+/nHPi/hX/5hqT97yC+5wfBfjp90ei/ySx/74o/v3nzz+u0f+L/9wosaeCu/+LFj095+XO7Hj+EkfYn/vh+kf2POfBYbhx/bredf/9Jewcf+N949vIp+fIt/ARWBzYaNyVfy28dXf3gQqnjvVsuPH/vmzLGr3bC/jA/5qx/u+Sef4sMPbujTdY9/8erNi+/w7A9ORim1qyhW/+kfnOG/+vz3/9aBgY2F6frZH3z3/t1LPObXL999D8cPrsQP//4vORJN4EYM+eHv/pIr8cvOxP6v/sdfrbG1Oq0UgSV7+sePkGHVpmLxYujgqhRcQ96KZ6MTWFvR3tsndHa4bioN76GPGDoxVdxBRUc2OjibY5ZZD3ejF7h3Ol2iqCrcvYL/ZKNy9z5djzHB9dGfvuHnYppTysjeh3XjhYP/k7pABcPhM4rKi/Zqo7dsVF0rVgprcYgKwLFaXqKoho1ZNXv/1U2NDrksThUMoeMPo6jGqFPvWCu4/T5F1G9BxYDG6kg+V22jG+e9Nr0HFR68S0lHRccbfo5/ypq0BThsoTk8erwqLvfavGSDEzM4qHWMJ3DHtkNxjdJ5joHDTdFaE60tGxweF2sxFvsRqEyGR5fM2uzNh6QvGVyi7rhvy5n9qHAUxk+v1OdezbX3WbIPW9/qaB3OqK2WrOJ1zxY1IRPXmOByzkbV5+zel/uw+uwW9TcGn44RXTaogUfu/GeBivf3CPsb8DWmiqdvQEdEBW9juVath+PKrq3SzpeSbDNkgy874KCPsUKlMmv4WOlouFSyvSjZcBXB2VjZCofZ0vCx0gE3oKUHybLhckT8vwpOgAqWK7xUOFIy+9T0pTKFW6Sr4PgaVIiDKvz4PtNRIdxS6ys3XhF0wb8o4USG6yySbdh1wyb/XP/6y+ukcBzD5g+7fMyffk8SIukMeRd2YhqMSfhEecH10dNDSN2GSsO32S2oELHVaZLt3OrGbJMNm3WFyrxI1KtVXuO1luQTNbZatLTaysJOTKYPW9ROwC1BVPDTt5OEqu+7fZVwQmQJXz3sAGoVOBU3rJXiXE1bo1KCDzvrXhAy2khfK3Nv+MgK0/440ZWaiKgePK4UTLbhbwf858+5C1mAQwwbrybgLhcZQ9PBNTjiqnXhsY8yH12C56ESM+sPtZYkVAi5sQyLO2vUAn8pbt1r7Y4Av2WDGtPhCM6FFwhUj0HRcwPh6t3TvUDb2JcCP/DzP2MFTkcJ53R16N4ykrxkvlUE3SqfK5HLhWO0Hz5jyitMsmN93/pAsDXWZ8zdxhUe1Ohu6Qum0xWORFktVW1Vw0YeMTHc3TZHNircya2XVbIJqLrNuF/YpZfp2Sm0uRXuCgR3dupwVZzDEvY5+hRsDknHhgUbiFBWC9bYWRmucOEtzjtAKaw3bcanrpMVtj5aiy8Yq7o92+OYm3VczMua5EWopDeE25YdpMxtYr28ydLlYIo+nPqEDwWrUbPTNLVscDlGb2t72EuNlxRMrY+a3tQFWFLPodISTr7jwUYZWlo+qoFDrMv6zzWwxK3So89OVAOWm7CCv1wtlm3GBWZQapFsT6PWDW61Mtk/T9l4mWwSCsfKpfQbumnq1ltzm2yLPwMOPzzDHsfo8HzHFEkHpzhmVvrS56BZ1Hj1eFazVvM3JD7huMPmuTWDsfHw9dzVK27obKejtg3RZZ99lcbm7dNauSDRUTU/XAGsxo5vgfNxyrO/BJzXWad4dicUwMkQFxiGUxuyqTwc/mf6i63htFl2oRLghs/G7hK9B5ZMGSM70gQs7A1lt4acW7PRe7RoKb3ixvaZ7g33rQqCzVbPgjOW+sIJuOkAMPLBwTHwffFWsOaIl1kE0cINZRbAYr2VlfqFU4x19XilBWHQLC09QQBYzjYb+2FyYwVOtIXT92JNcLGlX9ay0f+GFZZ5Dpx5qdEN2XGHltrSV062xnCmn3SNrwGHL1LlRGw6OPx1K21tRHinhYsTfQz1ke+JyGb7MWsnN6TpjNc18ewTYV92Ih/gpszGqeexgsXIMbxmyvlqTXewdKu2d134OQsJe/rTd/3sWK1LTZ9sAzgpvYy5TPXgKsLLDm9FBDSP3d1ZsPBNrA+fC0HxZ9bDLee9iU7Jd41181G6l89VmHvAddz8Iz39XcdW2LDAPowzgWjH1g0nDxSOKA3SyAfX4fCqy5kRYNy0zM+Ho2wc7T1xnA+OOUjrSwdZsZXmBRuytF7M82HhtmKP/apdR/u0eOWiw0/DTZOe47etlOnWlnmsi2Bx7ELT5wYAq2F3YR+ufBBWpvWChIF5rVbzYcngJPZqdOAqWI39/J4+rc3+KsRLZW0yroGF6wIBheSfrVmbwTidaZOYDRc0G6yiMfXgHJCnZ4p9QzjRcDvrEhb8YG3hVAFZA+6Ahb1hVtqxPbwKVnfWELTnw1KfbNg9rnkSlj0kZJ5rOLTBwU+Po33zOhFEfk6g+i3gyiQ9TboLzC4r3Mtj0RFHWG4ajqPhbTd7sK5ZsAAKH1gY+wmvrlxQxEU0Vtjdkr9ayiHYtriar4LV9hKupycG2F2l7nJitVpp4Qn7jp1cZn7SlO1Vg8fr7NXcL2iWqNP3GDObzoJNVjDAY+H8XmUP4QfAl6rZyRzAkjIQOtj6ar7CHlaFmerpXVaANfY0h/d+h8dBs6FDsrs/AAvuBrxDlXrH2Wrqo+e3ZbbKvFTXH3oIFoaj4z6t4RxHU5zlh/mELHAIVlhxXPn08O7Uwj0EzUVIj1DSYWETVqzbPLVmTE/UC2JnnNfRsrPAjV1W+JW6tIqs18anhBHxCTzukr9mWKdavJ7J/yIOnaW3cA9BN28jf5yssctKO9ZtEYyps4RU4qjYzZXudrC9apBLcN2BdEWTzpxwSjV/J+6NVQpoi8RvBXaxeHSJpWLGKH8PToTOKgu3A/FntxpnO+sOC5w/2936VrVgG44zGQFTeF02L8jiwI8eJTur3dhS1UzKYigEf4P7uYZjTLw9LH/+FdY3vLtSxqHZGEOYv4pzCvbSSahb0kHhZBXvC1pLFRHHz4ZZfuCUDklvWWyyFXg1tS+ILrQ1EiqG5+O0GFlns4uWjU1Uc3ezT7gbygROreFx4Q7b+kgHlwUOT0xX6tjfEFJ6jRHuWRHnb9UbtqLtrRYLJkGBxRwzPlmgpAd1STccsk3STLdFENan4sqJk57BxcSyp493N93qlF59QXfRJ27lC8KvyaxUflsAYCGExSE+PlocQsRRj/du74m29Dpz26mnOB9/bOU7Nk7xFm4H04KQMp9xpZF7qsE+nUoENHKqmsQHhsn31DV9J46NuVwEIccOfasA73FaQdxeiPXSC7KAxQyzrOZaqnetLTytqaoD0U7PHkIFLDgbnZS7J/hJcPPgEovnfr1Np79Z0sEhiLVyTFAC64LAqcXzGzinU6qnJ+ptK3uz2XH0tR8vOKzxZBSceax7en7DtjZK7baA5fS0tIUpLrkJEXHfAEsmC7+fE4hHQiSV07C9xLcifpIslDeAM6Y5jnjB68CLvoK/TkorHMzNxzTFmEU7vL8Qn8ED0nBCCi4H2ffryIblWzVG5ytYFd6UxpkhKbsAg5hdQAcsKTBRh3SDu/JaGzUcowgeredTkwIUrcDK14APrjvZbzy5McujdFUWLB/qdUF4WYUmo5nHA2UEsJ7vQs0NXjxT04vVwnqJxbOh2O+j5neNAtZOdeHH3RvUAZpe4mMBZJNB/HoDLFUpO/H+ISyDD95GOHHIifEbppwBCydYrZ9pJKqNGhE4YuEeDjL7lZYdL/eycXNYEz0Hbie1j3Mbs807PSEFcLhvEekdWw/4xiZxWw+HdxTt6cx8QEWfry5uMDbdNIm367lJt5He+gVUhr8GqMNmolrZ9+UWNvXUZxwlvZ4HWLPXUuYi9EIIo/OCuQf6mP4QEeTAqhuemMWv401Y94qwh28wRpTmXvNhsVd/xeXJohf1NssFsaRUS6dDA6xRvfaFcMcc7NeK1ylhTkmrnh2fAJWrsKJ3uFgss1wh1akICETSWad62yrfX/1cpjxaMa/tEq53BJOc50y38W3rHffsMfGqVadMVJhimwPDqiN9GzaKW/reZ3KAqlNTrsTrKBypJcFPSUflDIZWQqQktKvhAgo53vHglh2h9M787ty5ZI9ROSsfcXXVwi2Ybt4707u9rtg4Cnvr4wlQH96qpk+MApWwtdwXLQ3k459ygZvLjVFvWCusQMOdf4jJrI0ZzqkZLr4bGHyAiUdK+sJWSIFzGh+L8kZirnwNQdkqFW5XHLIUOrui1bV3SsalxyOy8SaSumCB6UzBx6lEOFtOb1rSUSFCdTiwx6gUlquGGd0VocgtgqOyeZ+UUj1GVagJZNG1gqdUSASQHmPpVoaPcWwBgamYR7NoavC4iqbzYQETmY7GYQESu5Pc9CUsu8xWt3SuaUDSDj9odaQqZRTCGUFtvOlFbth8ZNynrIUfo9pvmahbO3AuTdM74oFq0qjbKZUfYGNbql+gzsnIOnvFxrZzp9bPnGwrbDbCAxpYMR81vx4ObJwFaYucJ1HBNY067lwxRAn54cjYBkIEWYQjdQrCiBlfKy02y7hhH87Cia7jficYwx5XVK04zI8SzjmYbGPcPfoxoQHpnOJyvgOh8Jz5kmcA1Yd4leOFMusebuCCFzhkPIwJZGHS2byv5ANYQGnxQpbQ4jwUxLJQeVPYgc/ULsfZi8bxlyirrSqnkG4oPfpGMaZFkNW6SbhUPGDRYWrTmTYBqbnVsRLKRjCss0RLPlgouu4lPcz3TSt5BXy1VhyvDfcei9LuiOSjwuYrCFQXqPiew5p0tOsTt2N6bcQp1Y5z5atGcfg6Et+BfH8lvZW6z60VlhAWSWnsUOnhUiqJOxn/pEdacyPVdpHF5JarxDuOVVg6f8jCZYGCG2M4wMcmkElra9F7eFT9eR9sFirc9lYXXAV1tr0nMjx9oTuNffJtJYWzMlLKKtEJV1HD5QNeIayLZCc6gYqNB76iZKzDOPkeTgmSGMzSZ9GAapTRii+OFRUp5ohKUuiYuPdqyS5gAZWzbUAXO7CNbhaPGanQ13q6sZC6FWq1rzTN4dh3Tr4HUXHiy/PVHYGqTeVs3SEqSmFJeHAV56mWnekgHZSyh9iOcxa8zWqJp9op4FF6yV8pCs7KovNsDGUcGx4VpBpxT+8hAaiJ6N4O82V1Dm3h7izy6VR/UAnIgdTg1ZJtYNEMjjuzDAnHVVbVbGjNR0WNlbZg8qvYnj7CEjxsfqiPPIdZqGD3fPbVUExFPB4eR1Bn9wjnXdNRwa2lPPUxKrgU5uEdOFgGI+94tqno8GvJYHZ8rgZw+4zXhG0ylMnObwJU74wEj4/VwFLVcCenUkFub+1IB8X6s1hf2Aom1Hq0LWa0Xm2WdI0koMKesO7HnlKdZdiIb0CycDJdkX2qhI2BzAP2dZURZ2t6lXhxmD1e6YkYQOO0jSwkvuH7NnbHtKhvWxDvPEh+ZaHC5YhwcNWfOpXEWdGLeLCJZEp6eC+bsa6+kCZA+FXjpM4qY+9xKPlLhTc32zy27BIXxjBOU+y7LxmRbnVngV9MYHnhWF1471UO9lq6CdSn2Rc/1iIYo5Yp4X4fMiVxHL6kg4JJ54T68UAPZeC1h0vcpTOzZOmBvW6I4kxXs3JO9ZbwsDfztdgW6e2OsuvBTXjiJyZfqpJALXy4rFSZo92BrSPM1UXfWaVs8wwXuQdR7W156aiUtGe+aorxruG07SCR7Q1DSgBlOtiLfWIbNt5rCPZLPM5iqvOGBZskOu4L6SP4BBdwUT2lFEr+4bKtVbw/q8cFLCZvWzjQojqgwSamx8S2yX66VlMVk6XPcAkfW6LcMNUDVAi+x1zOisDHGGGxZ7rttYyanha0DaG3LBxClg40rmANY7EL6aU7hL53B5Ylp+w+eObhpaIAtqYLxcuu/laWYgpi5IWM56UnwnxPp6CSXfxNZSWifhEqdbWerxAsu/Yb+/UW58qYawpXUJs4VY7So8e5FVYqxmIGoY3a46z8uKeMc3eaj6rtGgoLcTRq3mq8Nwv7GHdVutIxUNEr6yuKd/IQalhkYOzqYSWdOUHmTqtdfdFHp8yvxZNnaq2W/I4zoeAbSXgWlr3i8pwadgP7NKkzvYtEd6U3ryvn9qKJJeco9UjPCQIVmwX6giqsVbjALcxvqcb6ykzfgUqdN6frukJFSrZ4YtBYZx6Sv1bkW5Lxmf/sOCBus1uJ9tMNNbKgpA+LaN2oOCyrEdunseG4587JipLuYQAVPAfcjoserUGa3rCHMebsuCHTVZp013ijUunxWnG02OMpmWYdv5Te+qMUdyuNQpR+jKrUh0H6Z97Fg6oJ6R2d2rZSulk9U09t7CcsEk4Q4la3GyZGlNJutVCjdIVqxHmnEOYzAirZUwhKaTe8QV/k0MhYNuIBZOt2w4SZ7sJu5BY+xoQjEQ+0OodQZ3qdDpjgv2Kf1+VKqZdwszQC/aKazrainckmKtceB8UI8/E4cee9Ml+XPrAEVH2Ys23ujBnEVuU9Gl0xthdbfmDSOZPaTY4hOb42emvhEm4UZchuvwAkp9+00q3HtVba0HBcjEiVU73ZdzF7mxxX0cJg8LK+oGV6SPcb+iCVcm7kF134uIyREECGPfdGQaF0HWPdddwqP+QLVNV6vAWN1bmSXh5RyrgN6n4dG3ejalO8sU6nVs2vfitV3LTVFXsHvrXVFh9cH/AwNJ1vRXWre4l4kUW7CNXoTmc6PYehm3BPrCBpjzvsam3CXU8367oxnVBWXJb4Vis97N0qswX5XJZA5VZJbr4wFbPWuGOxR8M1X6lIx1YZ4ZaVqcDjSCvhQLhXtjSlJ88G00xzrMpz16DSziKf5yfPxkYClLnowQUqkSsikdF4iYz8HYi3Z7hAziRkLsImcJt8WMvHNvHA+KWVzbgIFe7hma7erra1Rr3n1eEiS3N4fn0XlczXRNS9qQmna71UV6BSiufeUM2yjXygY8FET1TmYb4f+Cizwsuo+WsFI0hmiOVaYbXC0fCYlIXJr/iwqwk3cV2v1RWoVKnJnX9psavJ1Rfz60ClNS7Zro4fau43rJXCUoidIgi7CBvzZ+Ld87E5O7FWCU+z1ns44T7oEHIaIBvV3NjdQ2KzY6I63sRh7keado4BZHPhKnubgEpW8xauYhcwKbj1G8RugUq7UxPm2GZUBGQlPss+zPaXU9JRmVLO7JjKSK8YJMbek1nzL+JJ/5ZUWscRie7tnWEDOCYnEdIJVUeBfwtnaNUJzlLhDA87sifgZyymWahEi0nRFSp4jPHq3BAST7Xs6hxQDWfNbGEqlHOK8UZcn7Drlp6VAapZ8e5kkWy/CNWo4o9EOzmoKhxcuIK2XCsvOsKtddNGH5Ke7QQqOrhtpXFzEapBs5Mv2wtUHOX2VaOW7jQ54RGLOTtejo18VN52leEzdPTXYMOK4c560MrNwdbg4DbygBe/YcWcRe+Rfxc3FlNnX6hiE1WPU+UoVgn3X3qbO1Bpod78yr5TRTDcZEwCFoap2Q4uUBlZ8UyWqHSGdYkQpcG9uGWtJpM/vkTF9xyuZsHr7AxIkkOs0Td4MbgcV837iis7TgGEiKZJ/jA7UAniYfGVNAwOOSzKiA9auJllV0iAinwCNHHHreDMfsWrWXTdH0fAslDhcakIfOw3Nfgh1uJDnBNORj5PzpCt1kKR2eP7is5V6/GKvrAgmN4KDlRkQZu2uIUR8GlcHxUBlt6hOAdUOphmWnV2OlyQuL5Dlz5nSWesAyrD7xQ88oCFL8dTt50yNXHmTtbNLH3OYuhWSH6xMoRjF6EPM7w19gCpZrfiAlWjufBV175N7KAwtxYcT/Vh2fVUoBIvpqvEjJVRReMT0jhdMovmr5WxC3JZT8VLvoKRHr81ak93BnWjyKeQeWBpMnYF9Qv4O2EJNZ9XZoytKvknVz0z1yyYYR9avuANUHXn8De89+WCIUavFp9rhync9XxGOrRR4J6zCr6GNsgSeAFF82j1QVU7CxouLuzERYZmb4iP8+YI+3JbukjMsK2Mibt/xTADAx2fEiRfhI30yQSA6vTQx5ldSN59C0f+8HoF5j59ngnQcN2OshTLGnSOwzGywHA8NkxloTL+DCm112aDdEhxh75QgcTzC3e+4XAhfCVj1AoaLD3VasPu1GBbQf4x840sYb4QmKK+AP4oPIYrs1NiKj0H4JuY9TpP3M514qEe7Nmzx1Z7LyU9EeAb/b/KmfDlXizOGYALaIK8lzE8H9psY1cRWMhKV1LshRvVJparpQv5jgn/V0Tqvj1WF5k013ibBhV2ZknvbQU0Dg/WzmrWCWikEQ/vRVhh6+nDdoDGiffKDpQT7oeJxpUSWyHLfP4xm3CCmUhcCdW1XtoFDE+VNFHp6itWNvi/Xqav+OAoBRgOWBCF1Z6/DYGK1aimTz7VYhua+4xvQ070c6w6H5p2ZgZWIkCuc7Q4uQn/M2p21wZQGe4vK8ddG0TVL8h2dDyeNc9OCQDVJBOSrIQ9LnKlqlrNj8Osbg1BY9/vrhNeYruAhwYvBw+fnk8ENHgR+DVdX1+4c6jeGR5nEBjWGzrzAG2MCS9pUTcv1JOPC2jL0P1OaemonAWchRJLKzCGvYWvr2q93GE32lbZ+rIqQZRJWvELeoc4rnsHqs7moapru8F0gMdn4YeTYy5fxBjQ1MbTPlxDU+whC0eXMipLb5a/ag4HGzvtVODsTKgGXSkhV0Lt6bRP1jd46q2dCjEBrRe5wAHuzlpoSYfW6AwgDDsRhyFam/E6S0MgJsWyq86AJvjAWDVWjl7geoUvMngvVBAZ+XuRMlXFl42V7CiNdwgUstumZ4CBihOfcqoaQWGnC2TDOZfSPT2haLLB/uqwVW+b8Fningd7zJum2w3ZpBDVmZT9GBzsjA8GTN2PWf6CDfr17Uxqap+si3f61mIkACj5q+aD1OKL1NRFqAq7SEr6qLLphqWCu7hsL8JLtqjQGHx7CrCnd0AAVa/eSl1k6+H94PbSuKGfzCTWfFTss3BZjV4jeGKKPVxMh9Uo+Zeybka5Xhi5E+1FHScjzm5A8TTp6Xp3gEYNMaEKwwpah41vMz4BVgHOPL2P1AZZXhBBHp8woDL8ariTGQG4Sb6cLlAJXGymBY7c3g5LWK3GBZ2lz/Egv5GFCm4NFWUPvairUJEO1vF0+agmm+nb8c1FVOSuCfdLIdIhc2W2l2EbgvLe54kSOqAxgo/HKfgiDsZ4OrQ+OM1+IhNAaHbBFBgOmIySTg8FaPvgcl2esEtQFdjDKemS6UDllfRkJ+IUQpsadhDZ7kP1u/Sb2bciDX7ocfKXB6NeoeNSaqOfWdJRUTAYb291fV2BivLk3du8Ya3E3frxQpGONRwmi+MK9NrTPXk2SnHy29f9iBdB030HWrrGOKBNmPluJ9x5QBPyU8fn3GrtFGJPhja3Shvfjts4rkJVmpD5IN3Kz10/3fVEoxShsQ3Mo5ZjCEez01M2cxt1TiplHy/YFHtoKnkmKmoE5vdIAZXzee1MsQjRZ30QbnqmXQSq1kq2EJkXTgvM6sfjU7jhHuYxnukbku5N08uWwNSmMy4fK9mdekF/Smv4HfPsOMXZIdW96Ip5o+Fvarz9kIT/NV1k19khNZ2NvifS14WTHXFKB3gc1JnMhlY34GEl9kQ/LKAJdmx0L7K5cubLNAAa9segXPHxCSv2yJ3xTFvIdN70GxaME1FWV1wBXvUCEeHRB2LTdK4AoBosLPuKUb7zj0Z4rerP7U8WqlnZiXWmyeEaaFp3PbN0UixvG2yB4plPNBTtcaWV8KrBKEpPn/4FtE51nHLGJNLjuGB0SopOq+mhCqCNwt24UkOZBR5D2J931cHbJX8vwkFq5FY+s2AIweL+FG5nmy1dMt77hvVq3dpt0MQnDEh+TwCgNR9UBFhoQ11iPHCLDTa5j3xU2Bs4X4vrmezVEs8gNnaaSXpsCVQmBRHWGeoA/GV/qDQ+dxv2Vs2y8xyANuEnWV/0EpngUS6YkRVSpOebRNnwK2b1zMilie+V6Gg2m9zlt0DDl1XAWjRxYAeVeBNHZ2fgmNnTD0BFSWSt5/wplr79gpFLllXSszey+dypdk7sRaUYpYTJK2mDWZXNdvB1q3VOdvr2E9CEM9Dh6LnRN+3pnoduXaY0PdU+ylR7XCmA2RzNVxAFNNKB+KLKR2YNH2FSc3jBpd4wGgZUVOlrddYTFG4FSxYflG2tUwYue3rFx7ZrcJyZemvGXnizeBWzF+uSTWgJaCSB1bbU6MV2ndEk1eB83Wwzu5UZqMTh6qySVFZt1AumHxAjeavpd/TYyNjTxpnJ5ougDSwXvyZ/wVjsgvtxzHeGCyHOFYuAhX3u6Zhsq84O5nPLNeAqh2+wKZxRzL/BbKP2xyxnChIX9f12qszkc48A2oD/xpH+BSq4XXFuDo5fPpaus1CRBaSsSEgpzCEjvA2r9KKWf3k5dWBnlRWqPkadGs+51ar5zNlA1Zl68FWA2fcBpDAhGLvNSjq/FFApeyynrNJtlFG3cMMeltvyx0iBioygQ0+RkIoXj6d+O1fL8hsE5lbY8VjlXAqHbfdhp1fJrJZfYZnbrgK40olxxhfhTKJWbI9HAp0sVJy3ZLy39jec4UyLqzvCyHOTlHRoY2LB/MxoIqDNC0g7SULwOOKYBW1im3Fq9Q5UsFWDP5eMapatCqt4Z5gtsQ9nXBBMJjxEvwUapUFY7Os3QVNWMm/o/wU0JtD7Svnb2z7KFTYejiDMVPNR7fQN7UwcBpe+SJw6qzBhMtPt4qxbgbdUeym3QRNrrdaZXcgENERY2PkL0vqrFsy671WodFRaHWHE0tp7e1BfeyaqOmqVdAUjoDIZMm1pN65AJWzEHT29lxSocIKZbzp1h10ErRhHm7JNYtsaMw9zvQ37iMsmIFyZlp9wAyrplMBdkAY47MUcYcEfXJTc8DeggssGG780hLNrfB7HpO96P/moHA4bfNoT1aKLoMGv0WHp/Euzb5VpeiunghXEuyNcSgcosqtlB86A1oU/td6Ll6Bi/JVP5wNU1ECZ/eSCAVi4TbaLkFvK86F5KU1WDZcXoULIPNk2le1vyFZa2yWZF/mbycGwMH+2VYSx+XZDtqa4Kf2Uv0GXP55LtKmsoKefMNkQNrgtaDmIqlo4jchu5lryG7WBykpnL0M5M/FWxgOV3HOhjXmH0yHb7N6WmqRA5RcwFUnpvLyyM6RTt7o3MpwbUbwE2j5JZS39hOkmLOKInduLc9Zw5WgIoEm5AdqgLklfZeuvQSVt4Ijl32G6+U7avfCkrgHVdQ4rLT2uHBsOjco517dXqniGNXIZhs30chigdUR8vZyp9F0DDU4ii8AteyoH0JSB2Hov4gxe0MiBO2xIeo8KUBkQeT9nEa+BxjHMlt6CPo1Ds7ZizroKVaPAW02fLAWqRl2YeaaB1PlM8fab5sqWl3R3yjaEe6oyTzke10Cbk9IC6T6VbQOfODch5myK9xnXx3H4iqXkr9qsjDPPuYu7VEr5/0l1xbfad22+M0XMzn7meHJgwPWWdFUjQMNmpNZbvw+azsmHlHRoowwSQdriosZ1XuJDwa2o3pDN8c1JOnkydLkImlNYJpuOdM6tKMfqz6V08MstPAYnjcz3d0Brs4zSVzW/a1BRA4j6p56OShFtwSs4tRdx7tXjTuOsrD7nQyPFAxbjTBvENdBcEC0himnp0KZRDOecyb8Emlq33U3NhYZYc6u+i6Kssh9iOsP5xUndoSHZXW+EJdWZ11G/AZbDeOzrlQ9rsKKpUlerNVuPJxfdRqvdblgtH0r9gHO24wpsIiQoSLcdtdStUM15rnfiFbAokdpGuwNW3+WNVi0eXcsvsJj+T0ebAFXytbcJSznANU91vF2CbVQyGuX3GxEb832UDe83YaOGDWee89etbaVSZGN5jWErxYn5erNOipwbYDUSTFtbecHXwGLw86BlmAZL8F1STp4yqRrPMnph26zfgA3WQ2ZZJk8vgkUqvPTkKWHNquZn1LdJCTsfSPWeyXIxZt/9qmxsfauI2Ec54X6I4HYYYRrWMZoMGekz3cTWDXfnPEFtBGyzabxzke2EAh/1BmyjkHflzJ7ctdPDIotDJ7XtRG/Yk84OiYXuFr3YamHO0oErxvg16T6IbIijq53xr4htzvCs5iCFGPz8/JhTNvwInKtjHwSw1Eu465lc4vSs8i802ZRbTBG4n1gynP5Zw9gM3mq/wfLLZmQcshNVd47Rzzhr5JDpbMsYN6wbfgkBWj21bvAyPTrmAmyNnBQlHZtuLGPNMRfWscPHrPGjNgXumtWWD0vg7pPX7YR17BSxDl9o4ntjd37qSrdhwjZgWcBil2o4qFahuFO6BBJhzbKLyx7WzC7biTiplk+IWcvYKnUdZAFKdwmJMHcpjD27TvNB4cvq6CfKZfjd8UgV8MwFa4wsWrkBm7ob512OnY8+i4eJWQe1Q9od2dOxIbqdnNQ8Xi3qfVzAogtjuCeRsmHZtmt/LzA1MhJEMTWjNO8Nl5eR8Jjl2DOnS54Gs6LY4ATITC/bEpuS6X4etzAS1ogrSIyG80VGwBuWzOj2nZG6Iza4duGLeadAhdtS8rFR6E7nykUUmTbDbcJNvJX84b9aHJ4vW/iOMbFHOhw4c9gKQV9+rsM3BOhUGlj4UORuEg3vwFIYXuanpxwebxMvp3IdMmoLD3iPyjfUbij/OdxeTmEe83pyyeYI0yfgdOGL2HqUDWtulTn13lc78ZLVYrtiLTfUJOZGeVHsjlN2fjSPp6ca39G8Ic0xN529WV3aedYi497UvvLpIrSE5XsVpc3FasGWxRNuTWGq4D9nX1+1bEWxu0zPpOzhto7wfO3geBwef9yAjYRMQ5fGA/5GeLZ2NPJRWSs3wNLSpbZVJeIaWB27+QY5ScIyMnnMdib1SwmJGW3qGxWHFecs3a8HtomfKWrnsFEmIXyXwfWoD42PSdjqVidF285ZEEfsG4/HOky+p4tkEBu2mVU70R5MbLPWeDxG6j/Nv6eBjRROtawSVNhJceZI+pxyg7wOYbkPbXJuyaaOMP0xLb88VtmSsLWNOiNlnKqv75IC8eCsNb1hnp3YulBo5pjbGWFHaXFO+EGS+0cC9jRYak21nCrWarlAJQNWH7dHTWfjJradvcRWnr4We3D3npsmGHPkc93jhG2lV4o7L9xGNmRaPICpzcdDcigNFi5NXC4re78PxMz4JkSwVGZ6xwBgiTsO2HFH5nWwOv2OfCe/b4ig5/RTzQLOFEE8LmNra02n0SE2vMLl0IQoyerDTbTsQO6uI9+hko0Ta+RYXC+ZssFDw45wdZaEPT84k42NyKckT4ENLn5YEYlNi36DIhKxYYOw+1kWsGDw4+U/hK1jyg3Oomw+vCwrtVfBMq83aCLVqlsh8/ephkVgIyF32DCWIq2n85kSG5FpP1Ox5RB6iffPVmd9PV04g9hg7qS0E/p+l2Ez3adRb1g3fMLsDDEcsFEV7YIkajdpJX9Pjg2w1Oqi0s7F1XjDIq5OvqH0EidgwdsZcqoCQyrj1kscm+qcN2QbxyYIAGubZxwRTqsMj9c55+Tz37BuYzaVBeczYY24ZAGWbMI05k99AxZQdfjfC1Ae575nTXrnhksHZVtVSoSeyXrDca7jgionpbTGDQtmW/e98Ljah9fAqmX6HRlG23Zvx46ZdglLHuQunp04VQSu+clF27yPMXWRqQKsMeI16ToQTvgNuQ/fCvdXWdSkAWt6vCZdB0KkB4rUNFi9UEDrlKs4YV/iVRfYxH31Sz42JZOqrtwpXAdzxl0OtmfZ7DfsRJgMl4VoAWHZiI/swLWBB2D5waZvE359LatM1ewMtEe8HI2Hs3y7MbeGOIziWX0BC65W3ImqnRJT+b0sc9upfnyV8ZgdkUq8ta+WcccYI2BRPL7K4mQhHtSwo8EhLpJI3rBWk/NibZG2B6zHKsJzMzhK7rL0q6tRB0/k6VZeX13y2KH83CWT1rXPG7CRtb37YsnGU3NSPOk2yXibnphqFMGD2bAzFVpW6yw+hFQmKfvyW8WAzRv5bg9Nx+DMWDxLWlzqHntlg6pbwb6Y9UydBdhgPeJlv6paSWabj60ZnIAzBJLAtlf5w/ajUSs7nXWc2JSGcTWOT1q/C5K/pU9pI12tgLCsDXbltMUp8/EwQvTcnegmD2wFabAmkxt14foO8jvHB8cqtWmGpQcqrW119k6t+n7igE2qDoVvMsaxLT+nDWzsVmz9TE57sATZ4x20CNIfPYI0bKQpkXKGNmeoj4f3/dw9SX56uQObw+P2dkLIW3BGWlwIiuUjL5Y/WNv6VuaoJy9re1K2C+/JLvqgwpyGjeXaaYtG/KtgsZ8bV/4NS6a6G8fjMNr2qyh+yqpjK+aTUwGW0RNcpbYNXnO/oHJUzLEH5YZNOKcbqRbXB8yoNBEfLeCMt7T8/HaTrfVCPpQTRt94FV2QAFGEDHd4+rKJdjKXHQ9sckDFL0iAUNtN8zlNAWtw5mpFBGQUZbtAk7fTtrZ6w07EFTbriiyHTRn9gpROq/DgWnpbX9Ntl+S1RQEJzsIsXuP5bZJs5I/tABZJDxGVnYiijfrHLX47k2Jx5BfVgY2Uh+dGyYCt9TD3/WhYtkcPJg2bNxzmuQilAavPecU1BnOfn8BvY2NFHd7AceKUcg0jzDjOxMccd+zEwfFabb5ogbAuVUc8TaW7sqbdsFpadh3hxQ12ESzbfbd8P3FssOKt2pnKBLD1VuIpOFZppY8bsM1RsGqrA4bHcYsPFLBBd1g+LKMUCK/MfiJXhXh3XMA7AHCz3JDPsU3I2LE6ZWOyFSScv28VHn1J1yIjrAFcvmoLI5H2jBuP1t32XGY+LGyuCQPytBPbYVkTZ6NckH1zshDW/GvMN/hu9HCfDGM7niITkvWVMKcCbrOeP5IEbJ1q2xSxPYbF+bGwf98rLIdIfjTmmxpHMlbUpcxj1bBN7HA3tWp+84BvNqlzuchQYQvCRY7zlQxXMg2kH7C5cZKLZH2LwVNOrIebL+GW7dLyN8Bq1GsetuhgKfsOCm9CMmre0AEMWGLqlEHVBazJaY041azNlt8BDFiwGDIoTXA8c4rTFyco6bsS9Rw3wOKw/1z0hrUnes8wKB8tX4a39rLVMbSufEPc2uUKbnss1uB0az4spmOGLRguKsW1JOwbKuK3rvn8P4BFfjqbC+ExYztzC7uFPMC78nI+LBe4vH5s3inw5tMvgGWsPKSP8/W6lZ2P5HgTUlUI3lWclhrvhgSYkg+rMUyux6tVbRTz+PDlHnY9kOukwVLKjS06mvE4s/V4QpR+LktfN2xCrELtC9cJ/x52WcO1LzhOHPBP7y3qbSuU2/jM3nwUSXYZzTReZlZOht3A6glsuJPg7a7omSpZvsK9pDtX6Q2874AlRvnnBUVkg6t/gRyLNseP3WA32sYJT1u1cNQmLGmGV6sz/Zrf6wBYE/apH3FtTzxIjTfbYBcz7E9vs+x9w6XUdR5naLrDOxjzAlMo8GpK/n3cyRdDx/owlQFYOOM1bC46BQDn9BtgDQSIK5ZtRn9XmItuc7Dp64ZN6NpKW7UwM3zxeGaXg0rww9KD4y5bcQSSXlewgOqCNKE1EpXnr5ZsnZxx40wynv1DrnFsbPN9mKNIw0aHl+wv9QQ23DxxtSNmvh+1atKwGVkpjpOguLRnDXdsdEY6dxhE2TjEJ0sKSJv+IHnzTFiNw6QtP0rWrZFldNySA227fJPkHy7dRGELfJUDLfOxp+65RS7B7T/yfQ3dBhW9VqGJIgy0+Eh953Rsz59L7BSym0LmwuPZ80qDeYHFqFVvELLrY6tkTinHJ6sqouM4yy85Y/2GLTi2J8neFf1BxbPEy8etdnPR9FaoTg07xOIrlS1sUX+YJXnuamEDjvx2IcDC1hLOaC9Ibkx7XDysNyuI8NLLx902DmfrikFb6RDG5zb6IKfMDXbQNuqhqSxhXUJy000RnNwQc1HBDtbJjhkC1O2C/l3/uRRIGqZPo05nuDlxt83mF9hCtXpDmcu2iVh850xZt0DhRpZ4v3wjyWnL75fvvlUns/qnCcQFtqE9zsrctJcm+VPnwCZ7Un5RTCa18YNO23O71iZLgvlHzTdmk22VuAasYXFHqjNufWAtTYPl+ITaqqkGoe2Mlxm6kZswfwKgz62ScWkuV2vWB+mXZyfYulh+qzxgdaV68ZIea06LJzUaQh1E3P0GWKzM+VxMReGemzDz4SAFBlVH/gAsYMEQuM1FQIn37BrvaOhUjZmavlpStn3iRU5UXSmTMOQC1gOmUEY+nRSwUXOwrFond/WHMAkHr0BEBvn+huwKdgz4FgessYgSH0OhHkHJv7wAy6TNpTm8aBOSJWgfNsiHNU3IXn2cNsRqzXhvDR0WMc8fX5Mn3TpcuIu1wtUVn8mjYeKsXD4oKhWwtWSxVpP93+G18smNnN59Alhjz0Sd4mjrhW7xCO9D61V6uQGbk+KgLOijen3UyH4mKpljwgtIP12UqmNhaDXf1euMTxpib+heNLwBVu9kev2kg3PsbJA/KEzVA1fMEKZIemZeKFXXxdunQ3acBdA648qJXDdcY/kpX2Dzpx86TCKStIWXatSR6gVuts18/5BSddYA78h24OJBuBxuAoD1dRLep6fahEp11Ow67olqUq3G8/PKBmX4mXbDYuEQm5TDHEDb5X89mhdVbHaxGwj15Emori14bC6CJbONXY225MNCbI9tcVz6AixOL0UzvdiDpeJyzl8tatThNlnQ82A1G7N90U0o7BdDECf5sHCsZp+r1bJCpc3oJuzTlGm6kg9rkBNEVqs1dh8h6s23ybih1Bs2oQ84vIsZlMbWmodGi2fGXq3MKflEsEJlOvxa12NQVh/e8TO3oGlTuWGtdCNPdV3ZQbbxznCDl5KJmJ2hJR+Wsvw4jsMTBP9qVxBfVY4m5ct0AhY+svOvH67WrP0CbXCKcKm1/KE1GVsp7F0/1qvgLGjTcO8/m6Cqez6NgVCDzr2V4368i2DpZFUIHtgNqyWD2cDjOgNhzRpW7hH6TmPckLSm8lxvq64hnq1dITp6tgq5y8sdqzVbY7B6w8kif7PJDZl4owyH6h2nyo0jEfnrZBtsdu1S1uTeV2FzEmaVG5wM2+jp7SN/R2M1bL1VjXbwSm8dgaTmZ3Zt86ZW7YQsbOd1HKdq5JTizzjOkrD5RuHxIofJjN5m2R8nXMEbdb+88lE1e2pErcewmsfZa/HgCEj9Bv/JNyXD9oIviZoqbuGAS8bAL93A6A1YLNHMfmbemuybPR6gzFmc4/8tHxt7CJUcKOtZch3aw4pLbLrvfkP/tcytOhakn2g3JLYiZYZDFVycvd6wbnND4IDofHGVCeKmFubXEPaVI0RN7/QCLM4BmB735VHValwwCVCGki8s/4aeGw0eT9qhPwVzNoeHV2tnPb+BhVLLVuFPwfk4DiwRTissaPQa84bvuEHfEbD6Tpt5HFgipqSgeZzRWxTYRjq5JmCpwvYe52xqFUAPp+RxozA0yO8aAip8opUFLRTFCx9lMp7p95bqY+Yza2jdSiOzwaI22aY0vaBvqDvbGtIbbACrUZ+sLAwhWY+rzXAlGbuQgos3wILNdVvIEjfHTRwnT8aTV1yR+WxXgLUz3/VjTD8T/HiuMz9GLflzocC0cyLXT7oGbYFtPFjm53ZQklPe0me9tG0VP1bluDG0F47Sx7W9sFp2h4YvYO3p69HWSwZsFCkKWw6rht1Y0x1eYIMby+GQY4oyLmoPD1MKC+W7kGI+rH0WUBcENhfBcrpqkj9MqX0rVhDfqy+H83bNpRk2jEpRJpKrlHxscCZMF0KcnRK1Hm4Qlb1A3Tx9JAqwtDVOHfaev1rCxjW9YWIDsEw7Asb1AbsClg6DL5Wf7gWsaSTBW6+WjRYlvoJriNOlPd8cCtVgtda2buclttnCTgdcMji+D1w4adgEzo0fzjdwkLdekNlo2sbwfMlNgBpsJByr44XA08N9GxR/rbtSez4suGyzzONGr46l8od58GdaDTqHlt9tqEppjbILIOfDUk6v6bzhRtaN5MhVFvS1F63WHCT3zecPASxVIU/XMRUli2OzRO0gxfIGZ+U9H5bhH+nlhG/YFKGMhitgkzICnl8B070xqpC5qebDUuuTuq/5Vxcbo6SW+YlH5HjJRmOtMepJ1a7lUX4kDRuFT70vCkTwNJq2eJ/odFLUjRtgDR9Tii8aAgZWNayvocpKrOSPsQHWrMaB+GNQuLzj/dezlb0umn4tG1VfacUX6aiK9bRwgx7VQ6Xl068DVieTgp9KR1X4Py1eTUHo8JiyS8M2cOW2Bd1LI+PdA+fCMw29FDJP5YeVtjn5lP3YajS2QcwwdSMC7j3DnB9W+lY4x94XRSK843oBlVJpVh+71NNgkZHKfFFWnsQeZjnUWZozcrgBlrIHe6H0whQcaQ7D8b96aTdMsAGWiS45bI0drGHpECzWGL1bfgLAt334qpzI9DLRMuNKSrBO8OhnvlCezo0strJwDcVl70CLwmIFjbmNG2Dh25qvyK8AS7WGjbwxCVBvSG7MbSDG6+U4JQpY5g8Fq2fCYittrfnh8twcm10XdBQO51viRwsXl8D4pPtPo2y1Ud9oIYhCcYziYTqKgbdDPkHJh9VJSrkwF/jO8MShIrgza+0OTOr8rRP5GnHFwYjn5BENOVvMb8BGCSVdNObtAtIXDInSE2stv3dj1I2a6HMhXFsRI/cLegBwjxS9QfUasDpMYS227lPew8Bh4fkN1Y6Nn585BDbSXjT/1G5zTLRRYNBqeN1U3OSGbgBg8ydVjwUlRZnM3ISZNjpih4cW9SRYbSv4hOhCaHMgvojzN1IFojdp+cajUc5GOTCybvwaTsmyEU7bYN/7DYM3wKYd3s2C8gUW+gK5KCwYCw/5/DxAZYPS4YthAMCa0sKFIg5+6UPBKQ0Wrf1YNYteAwvn2Ft5kC9KgtW3VjlP3BarNQusc3imrbEJqdb8Tdi3vY24HHOIEpbGJQ7h3SBevsPI923XH+8nxL0a+cx8xq2hkOwgfywF2HziI3XRDYCo8KGK/8x4hUo984aNKBvbh+BKLGGxNTfcn1d5Tc58J0o20rF4WcJioBIeNSdnCSV0Rj4stX2O5kRpuRpimjCjLY1qL72WG3Yi3KPptmqOIgddC/NSDoQPj45mEiylro1N74vSsmK94pNEsPGj3dCfB1htt/SLDnO4xnzJJUzeOGu9gZISsGQ6oti2WqxiF/BFtWomOm9ARZpNq8s92NiPE429Sq0/qzWlwULEgDty1bWB2KLGiQHcu7dp6fXXMbbK1MZYdrJdAkthCnG+0mfLAasz8ljQYF0Fq+Mc0xhKPqzRShl9MeAAk0EWvzA3b586p9+xWi5mZJgfJ/oOm2qNVmH7tF5my59yGLYVoyLQGQaHZsyshx3fOcXwS/n5KNtYJaqyMvWXEIr0Sb7tkj9lDljc+m1pEydlCuJhig0lVdXIh4UjhhvzHAcMXnYP80eRM+GOWSJgm7OwBeYcNokrOiBUYcEov0Vq+NYYNS96iXqnQFdYvww7Glv/BooKwBKtT9y2CyazUT2+WpU1jBuqRb6ROX9fjGNYJDxr4WtsTNV+Q4HPt1lGq8fpeaAy6R7PY1M3cXi+PzW32jvlHE/0wVIr5SHt8txKM3ZisXIDtm7lKSu1po5qA6FztKxCse/uHLLMxwbHtJP5SI9haevhZljBJV/2BEQ+LOegr/YVLEo+zAv8KRiP/GY9K1vRitO8Xi158FqfG4xxMLuke7+A1agVUk8oLe33z7iAxKw2DkzdgU1rayspWMLqpYbZYKjWNGp+xg2wjOa+HBMTXwSLnYF7FULyYU0SLq/SvnRZPazA0Tkm5Tdks61u5NOfqwlmwGJ/ZXisjWNSI59ACrDIT2Z94fiyoUS6xs+WOvwAu2G1BqlTF51tgNUfBdafaQkLC5b5eV/AcoqmL8jZAIvxRXwIsbvRnU+/k9tWCy5/W1zIHEAMU5nXPtgTdwMm2MC6JCISEheHiRywUHCqb0hHAdaA+1RXOxCXzbigRw8BZTeX9D5zwHLEv94Wq1Uar61ojx47bskNlN7jYJ0HCw7NYk7vszpXtE7Evo12w6XVt94bQvIFkUMZZnJBO7a37jfwzgMWjCCiuxWbCCdlw6NfpBNjHi89ZQhYlOmz1tYty6xpWgu3LMMc4oBpPqWIyVaw72tf8SsPhOxx7g3vTzwON8Bqo1XOwhzvRHMcxLAPTzlinTPffZJNZqldTpT22u4Uj3BzL48qXTbJx2aw9V6XokSkYgy7USw11XuWbAr+/6L3sPQBK+3xblGyyeaT6JluFb+kqxj5GljMaKjcIH4AWGxjHwsSPd6nU+JHq3QbdkfKULdBKd650rU1CsbFx6RIWW/Nb4DFSeJ6aAUZVoiFk9bk4X8clUjCNLZCbsq5aqUkKVJca94Y+tf86XnA6iQ8XKlTVG1sro+uluz3SD5ZL2Ax6q8rjUoZGuceEq2ItVs+LwVQMWTttpBJnYg2q4YZHMy0+MhvpTTbSkV83BdHq+hgojA83FDY7p3fiAJYu/aJrzyM0Xsd8S5la7CoNwRdtskYEyZ3gYpiImGDMXC0vNQ79uCYHb+0ImTnWy7hJHzh5FC/oRJk24Qp4FFeoGJTXrgkaQKfsuTn1JzT5bPJUr2Mzk54saR2SsDmGwzfOhyZOhelBfzcGBKG5Z1aIlVvWK1Ba7DKgHacPdV4IchafXw9abCck7y+ggWfJ+4QirmzyyV9ONTmVgbOsZ9pMcQ+VA9PiCJk01v4bIGN+t0y5gkJPZ6xFh8TFTJ3WP6EA7ApHMSltwGPBB6vx7t51Xe2/nxYts/0HLu8NNItTnOImKsVivDdsFqkc5m66GRgw1qYzKbDiSe9bDoBlpetFRxjWZQZqDv6MPTzzCxNU0esk74HAYtNCrbzTCxbDIVl7Wi3fJ/U7Llh1AbYBi7dsmpPFp3icZoN+jdyQ0gJWG7d2kK9jAdeRnwShcwXtearEXvd4ASIz2OrMfq8gLK8dU6H5o+9AhRVoX3Rc41V0gum5eecCF7zO8mBitz5sHKLgzX2tGwJm3jZVZZvWCxzWMG5uo/ZJBXvE2o2zWFS01erbaVY1XKmQ55t+zajLhRjLyonptfvgK112xvkFks2HvUyn0tHMegdptdOAIs3CSzCQlcZh6vU+Egvuxokn2UDsAat7jwTfwmJMuNaPXVOUvTIDTuR44aMmA8JUitCixmmYldEKNz0+aa+b1SZGfU4HaVsta4lXJxk99u8gQUbsPrEAy/GXgmL9jBMHgIPs9/A0gtYgy3/drwJ8ZVeZlivl8SvVXq+cBlgubJHfLFY7J6MU5Vxrzfr+dZQWHU1TucvYKkMiRPYkCKi5s+dAFav5H09EVECGw5XjZ+v1rRrPl00sClc2m4ra8g2uhJeMhww9RsyNoBFdgPRE2rEWnrpD8w6zz1ldXC0RvKxTaKSEzOUxGblgv7rXjnNkp/g0A3WHlfYcU4KsMi/qCNOoe/q+TOUgCWKeOWYi42oSPUdNvelFuYPSz4qeLRWfQnrin4owIKfOVu5AdYT1dYpc89x5jHDG7E6qwH5kfPYaneEYccJAcIiLXvYbOwxWP48FGB1G2WXBzizZNIkrhHAbGW/IZ89Nly8XebKsad6dpjsELDga9u4Yyd658RmX+7EK2Bpb7PXkt766rZhXxjljxeodurAKCpSKkm+bC9QNa/kgVpcy3ieWePeRoHj5j190AawSLptC/lNLbiWJcw7RNFD2Itxxx4k8elhog2+SCnUHw9b+F4fyxdpmKYVuhGLHQjnJ67LzojZWrthB/rWsAyyoHwlrH6BLjuMe7mjDwCwBM+7gqQXSL9gparXkV9K8W0MVojamYhyrwfPuEqqF9aySz42d8VqyNJmkAZmhGEN2xUGs2FNTr16W8g4XgaL8y5wmyUfFoftpC9tRt2VMsKrhfc3b0hrzE0Vt2M/7qckLPKjRs8WfTSmh1o+LPNd0uUYlLU4rYZyMFRnvgLxLFupBnfmE8vQwhji28NceZSQHT5auvcEbGxvlLJyCi9aMoX7hFvshiUTa30nhjqGRTnfsNpcZ7Kw5h8vwDI+8lzlr4ey6TDeH4rLovX0hAZgzc5zo7fA0mI7NXO2ozHrVkfDf07laQZv1LihR+Bf2g12o25Siq50egjL4kQviCXhYHp+4AVYozns0+L+0gvk2LVPGKgHrcs0UGyLgvFdHa/xyKD+XFjO+lK6ZzipMDfmCasxEHmFc2qkLK5F8r0NKswNMVtln+A79h638RSAmPnDvIAF4y2Iu46OVrVa55ALOLyMjLLpRSGgcla6jhOgtWE1L9iCbOQRz+84nH0rfffiZcldw3TEPtsZJoeG+3TDaBSwkZTGfMFdg/WipEm093XO1qbcAouqVKrHpa4K7DbjbA17Zu1hfDENFosLcyFJCdxVwkxelABwdlGkm3iKsKlMSlKupXrHeGw9e2br6yCJUv6sF7B1weFaFE/a2HXGLDyex9DrhhY2wFJvuiJCbYbfs7gP1Vi/m/kNUYDl5amBuB7D6qVquaCtHMDyc6GTImydk41r3Txga3XGpw4REvRyQ70L2BobZ7Stlgyu8QjPv7qz/SqftBGwYDZI7786YJytn/FJAB+t5VPyApaRn2YeFxuugsXAofTWb9iEJK8rdUHN0xB8WZw/ZML06rT0IYBJKbZSW1+M5rVidYTprrvjpmzc8/mwOoeiZEElD1gyNU61IQKTkd/eNSnFxunrY0zkc2zhm0u09t7TBw6BCZckJw5WO9D7w1DnM/2MMtxuEDOYlGBD2DCORcqaNKY1okawM6vW863Frr0221IKcCLkis//Y6n2huuSD4tyRk1OyeVRdXGGe6BgB/cRpBuw2SBz02Ly9RpY3ereQnHHTpzwMCpZ0e7SlatNqNGRH3nt2mvkvlpo9F6yZHBqKnuG8pPy1F4rHARcCTdesVp9uIjV/HnDSe012Kh2Ayima4xVeckHRe5kqW56l7Qhng/bOX9Uec6t7pQnqwVjEi4uhILo5I4rjMJr1XTJVtZ6HSMKC/Zi7OOYN8BCFNRWoT9hCZPOYfraVigb2/JhOS38Uq+x9V+Sqvifrk+SjWmmE6K0UrbCBiVdMAFeA6u71VoR5I18WM0aLdMCFnOzcTuI8M6spafVCAvXMQz3IkbuzUmALHG66wpPNDutRliGcIgtV8eWUGQ8pMOem+DFOc6noySsOWDebUlw6H3GBXkL421PLwzBCG7wMRgKnRAMBTYsa1w0hCoenj61RmzSKPV6JkbBz5qGy5Rkm5KdMy8f22AuRY/HuwBLccnFa3lGAvF+x3Z0Z01jEaNcA6uP2faSe8mG1bZad47/hb+hip+Ni4YgGOr5o5OEhTt3H8wfi7M1q4VNPfkopdxwg7VNBxWNF8SN16xW97rLG8gNq4Wdrvi+5dkaJSxFwT4UsQf1kSRYfSutNTx2PiiY9mJjprddE1QT7IsFe61ai8tQcGytDUkXJycoXo99MYzHtZpdwo0aHGa4oSuUsAae16V4P+NmlBkm1mBbaGfrbMnHNuEYeltb+DbC7VAk2Gq4lPOPl2xVZVT3lfd0zQF7clby3QwhZT7t+yJQ1iFtxCuUk1XKesdqwcWQXk5MQ3HJygXUvOoDP5deRyE2Z+PrXBGVW3vkaX0ukXKluEr+TtStDErX1TNLdgk2KaXeQYBNbJ20Tyv50L535oWHlBE3DP7YyIeljZRNJ0Qbie2xyvhMw8hLuorcsB0R3OPOXNTNL4LlUyYzdjfAmoiV5zIJgMh9hgc3Op0cciilwxpbq7jDxqdm5eO7bMLGhInzcDnjnHXXkY9NKHIspwRFZkHYHF43jopyAKHlYxsDRq+t7rJZewtP3HRz6jS1O5bMJ3NfK1RFH4a1nq2oPHp+4yHi2K22hmfOx0Rh70o5rBsw4Uph5+stG5BkFNh+4wZYcEcZOi+ERIrojCsCCqlRveXfXrZ5Nc5TLvJREyFNuPFQKMRuMvLNhe9F2HVt+RJYMBXUO6/N82E12ttlCnsCuIf7NrAH4Wn0VvJhCSUw6qq2fAksFucRpdxQHvLNEFvOcsqZnz9jUH/uTqwkP89Pz/s2aeVXIljXwOL8cOl3lL7mVh0/pLYoME94WCOeauO89+j5Sd+5CfUOa7sDltQ+fG/Ty4c12OJoZ1qWL8KGxzP41vWGneisVerygFGpKEyaVznnZ/l2o5YNIRcusfUBuwAWfEwr7YYDBlgcY6iLgUpsn+k93JjS9xzRQ048DZbCylMKq+fDEtGdwyY9MQpY5rwkV/JDCC0uaNFTpXs98zdh3Uh3Ottx4MU2ZbNwKxtraDdQ5hEVFoH82n21WN013Ds04RmyFDDyYeEVUmf2RMEScUyJM2Bx0FRvoAMktsGqnhzuQ9zZFzDmd5wrhK/5riFATTay6SIFdRWsUVsv+X29tW1VRu1tgcnGbPGm3tFk5Ef/wNS5Ac/wAHS2rsaZ8mE3ivQ571gvsj9bXzQQXQNLnKkNK9kDRIQFO+izLjIbSjHfC7RsBQ5vy6+i1L7hgXXOBabxQO/0zFS8uONOTk9CAVPzQcqL5VJdAcuxi/1BpiMNltadq+wGUNO9DOt3rJWRbGDB10hYe6Yv3O3FEZv8dkPAmjaNtJc1HxauLJ+cvE/3m2RDbOK7s3fi3rpoySjAlz8WBWzSXSZ34glsRrHeaNYQW8R69fQiCrCNYSRZW50yqzrDTb24lEd9YFdNg+UTP1bP6csNkXDLlyI2rZwKTMemG/kiWrEFkS3CymFhAmxsDZk3DAMAVh/Tq9UznOUyuWnDpGXaqzywhKVho8q36VpG5ArRlzooWFbthp3o3evJJaMSiF1wymAVq+R79WNjv2gvS3GKilct4Z1IbeVa8uPLAQ94TltKwOLUx4ltcMBGtXZDtnds2rAfFzEYYVkPswJS97Xo7PnZqAEfmAuhNwg4NEqJjPyZAIDC/huuuk5x0O2YM84aRWYFOMLpZb1qWytKR/iUCpEzBRi2iOLUZdGWj036VGt6ShzAH8lbnonNGL3IHes2dk7xJTP7NbBgOh7J0NJgOVvj+0oBduzibeFWc4QsKvmz9NW32kpnU+UKlo9w+6FSksVJHJUPq8MbNVksFpms41LfMBuj3INKDSaxr8IVIwFjlKESi4UIUz29WRmwnJTzfaXUa0/C9GGL0albmt7PVudWGpzssXKkDG5/mHgTm5Aum+UnE+fWtIrqSl3JKpvswmerdr1BdZOwhJ+RpfJGhQELu71N2lDN78MGrAGvb1dzuME5bDILZzlvWK3ZmlifCxlHa48W7LmWUDhwnp7RbmVD/NttLm6tnw1bPNcO7ouVzWpLUN28iJ4YyiY2XKZxRx6w4BSmO7vAtk/sjxswseXQHqqeaZicikdjeR03Vg0knoUqjy07SbDqht1utphIISyv4RFYrFYtuADTE4eA1ZxyEedSAPAQ4nOwjZHrDXlsYFMOEi915i6CNdqwGygPAMsQUO350BNLRlnkeHp+7kSf9QZs00al/dUT2FwfjPRzMxswriNdpaK1tu2U6a6nLjKyZ3pYT88Ym+eXVYANsbLtVMuHsNw5T9XCNJyiQ9MpvwkLbrauMvQcXL4gsMRazRtIOAHKHc6v1rFaqxbX7VH8Hktg+aajb7XCmVrIb16zAeFMTenplNgExYl2qX3hTLlbGfFypTKvnJ+JAix8V6No2nFY6TgTYXklrbtWxbhjtWz6YNZrsVqGGEzjfCKc+i75fpSQl20Wcm6sL65rsOH+0zHzi8vABl+UnPKLLJt7ebhwngmLypA3MJkBFsU+m61c34tgKVzDlt/mAFhsftqn9W+4unCblFpuuLqEGuYOK3UmCHPvFq8x40aB41uPasx2CTalLBYc+lXRAV/bNMosqiROeOSvT4NFCkmpqyzHNb5hgcfLRpGWD2twqnKZ7yXlQZwbADZ+V50d+bAcu2LFOw9Yfd89YbvBrtFDqcprYI2tIHitc2XlSWIh4YJe6cY+2FLyYfVC/rJVw9ccFmcXZefymHMekZhfBQuBq8liDhawvJX4nBQ7e24x8GMzJcH98mzN/YKLwur0AIbfAGtOzuAtCnqfmDLCZ6uKFQYq2bBsa3XKamoZsMRGC1P1cFbUuQvzYQlJxduJoQcu2ZAZzvcW+jTD83eibeRi87HIrVV4WRLuf5VZbdU6dBUs5+R3X6ShroJF3d6i+ebQt1rZpf+JTqQusPWH5oTnYuu93OH0si2qVNW5solNxgw3sZWyZxOOmhyugqW2EzqtbCKc3hZuYmNdj5I6N8DywtLNerXs4UJ99mo1PSaNugbW3OgcTlveYFiq8JAvL2YE5oe5w6tgtUFqsoUbdRWsuW/BfF9+bvBEBWZutVp4mDA5BcudcDkO611XwTLyOKwSUZVDRC0a/sPAY73GYRfbVbCm9AEz1xer1fl34XtL8DXtkMrhEli9bNVgmyos4Yk7GS5keFiPm16wF9OtPLCRlY2HZ7ETpVkNy0dNh3czD5t6r4LFTUgtCj3h0POnw3Sp06rwHvN8bD50d7PrHbAGIz7p6UtWtzJ9sJKycOhFZ3iAWcgcOR7GGNNgkSu1NO/3RMysRR02fl0FS7UOmMQTNYfKsrlfgA2XWMmPmIHNvNXaV7mbut8+0QOGdzNtlHxT3zayHo6ycugRodno8RuMWlKH3GxXwWp9GO6VE+XlWgc1pcLX2HCXkV94ADZhcrmubudqj5X859pE0YU88VWwOKVG9pC+dqiq1xnWDBSSSLjPdgO2yUMmnzyPO7BhM5ZZZ3rY0vuGcLYhHFvcZVct2aSeWnpeCrA49KB1FTtX7yOuKDXVyP3dblitweKCLUrngKVN4xlS8VFbSa9aAhY7GBAara4xH35BHQyONusC6XZDtn1cqCwG2/AwomH2DQ4hqj7MrKfBokbWL01O/gxWxyUXFk3pjUxZ+Y0OgKUdZ8tPMEkBW/WH8a3nZnHGZNv+DdgQiVRbdTtcBKuVgUj2liWbHOUci24HwEKgESZcNtJRS8s/YLrBPFFpabVanfTFUaq2Zk+e5g2wRBwvcZX4vcQciuFmt4eUZBqsAStflm0B11j5wdD7WCjgKlg+KYOwCFNa21X+oqiw11u/IYk4NmrBLbgpcLBIDB4WW4LBZR+x5IOiC9pWTeYXrRVeXrHR9Ya1UmukW1z5Gc08XDLX2hnAWr0BllP6T/MxdbJdStH0enk3VmDbEL3hvoJnwdA437DbBkS9yFwadoS1Nc7Mrvd4F7bhFsauWBrBS2A1GHU9Hva6ChaJNEQ1PyaRaewRreWGczVpbvtyC15xYXXVzrR+/lr5Vgf34KpWfk0EqROvxw+1zK+CxQmAoevAWCRONq9tkhw332/3bbTWGfz0W2BRef5QHfAqWM6B12WZ/BpYzvjgmPHlGlhzK5zvXiedSFQcFj1UhYPbbiibzK0XVuJPjMrLZFKlhM0hR6Jdut+wZErGdD8xTXkVNmWd91hg+SpsNtr4RN5wCza4Npwu83xPam5zqq4gyYjLwAwcVeqzZF9hUqiKNWE8Do3iRbDoh3r1/BZswBLtJCw9nB+6bLXI0ldKv2G1ho9WFvKA121C6zZ7er0VsGZFeLLQmt93z9Rw5d+V5JaWHk9K3SocebIcHKHC7c08TXix+vDHrsU0VN32muSx0LfX3sITNn1QMGzkX8lANdhDueAcZi6sPRAFPbNJGZ7hLL3cAMtJAeTHJ4uwOIUTL5gMs5LfZyhtKyRUXFBtUjkQnkh4rgGnmKPp6WVxwGr4xL9J2D6YC2P314zuwNHVfVp+czIw6R77iy6rrByZ9hnW6xmCFavT07t4gQ3nhjfyWjeabMqk2ShhbDip7QbHsG14g93GsUEErCozzLMxOvm8RPK3Y98QKuiQhb/r7AoNM6QO6is3kfTOE8BC3GrWD73CwlJYtCA5SCf3qLKShmmMySqNr2DZ0GjeerTKUkU+tQFgUZ5SVphGfBZqNKMWkOffx7JVLAL2xSKKLDutQQmfqi4UzrkBVod73vS4IClsFtUav5JxJ98ES60X+nx1naJplDiPeobw4CtrS/mnSzZD9Ev63eMD1pxtWGFbOCY7/vIjZN2wXtLqcQ1PZq/lQVnnmbBwmKXdEEsqK66l9BUo0muErQZ2BaXSbwC1pynaKqXW4V9Y2HNqCMSnSH5wopx3pbzRagu21sPjGYAlT9nxfFiIuHZlo2ODwXZbDzuE8HI72+rTYY2t+qi1LNaq68O04zPNRek++g3x1tgoEFnmCdrrq7DVadLhb0g+tsGJ6tXhIl9q2IWvnI2TmV73Byi30oYtgkjAwk0ad3dHw3Vyg7trWy1sifd+ojbZceR7ODypLPzbTK+7AhtA9b4goSCsMceMm3lF0K92AyxFKF4WTCiABUc+TCg/doqOfoO7axxzxdZYXspkJBxhXwOny0dL79oV32C5bcylOdTHev0zYTE1KTcEXr61bqyKFL8DlowiMu5YLRlMj6/C5L6Pm8ddKKr85lOGABbupAFfY+XHw021cIRcfBSrNxQZnMJXVPfu/Y5N2CeF3vJ9w7nBt666KAlxteAYhsMT3PuI+vPbaQCrU6zrxCakPnbcZDRW4tsNq6VTqYZ6prurG9VFw64GdrTJuGPJdjmldtyQB1hee3g+CC6vtYWywSWwtGwFVr56OdPYhYCwzbjTWyYFMNM7XoGtkwO4rPpqYA+HxuOUqtYl340CLDwsnMS63IlXrFZRCuaNO2CZkip3GaI4G8CidqMYHu6GoXjA4uzY9GXe0IaMeGJD4F9XTW+71koV9nnCjTIv4YYh9k3eMiwEWCLVdzGPGy6vSl7IccPZqiy6kpN3BeuSy6tOqTry59UAaxZc/9buQMVGD9jc/GurbRWg2uwrV/6a29hmr23IDbDopI/lybrkMi6tuXnL95/apj7LiniHsKaOeI28sHI70xNrgOXVKO6ycp2mSHgWdGf765rf6q99wymGNVhmrvdqTtgOjiJ6Q2wCWM1Y/F+mQS+BVVyHaE+vMwCWFrxBOzVQ0yf+E05s1Mq6UL7CC7BxvGu9ZFJqCRPywm5QCzU/IQ9YHFIguekKVhthLl4cMLIw51PHqWwVn6gcGF7vRCnSw4S8g5a+3VBsADapnBFf3MvYPjPMWctKOalj8k2ibKM7RZ8W2WtBIDgvyLAJY8mDRtdWL4IF/0l7kTXhNbBxXi/c3EDiCS1HGoAXYVPWXzl09dQHcIxtUNg7XPpiGyAJtTwfG1VRR115v1JNWjgLgN9DxGMHpa/LYCk135dzhogHzVu8olem9CMW1MtgkXWyrCbXAAumLJ7cUKukfijZsMZWmhcz9Tbxjx1ja2XMcIajSzeKbNyADc5HhStgcgYbZ93DbaINEYsdMTVehk18TKoBGrEtLrTWp4nE101Ha3dgsyowwKusL8djRtjekxdRDvU2LoMF40A2vqejtjAjbR9oC/v4btj9mn5P21b5InV1lV2zYrUzeZfvWdnWndXzpcN4Caxme/X3DlijDeoP7mZxsRHJ+z3jtmMXtp9+AzbXrmRh1xOH7Jp1ExI4HMk5XoTNt+KjecX1cgZb9xJubyO9ktWjZsTLsHVYYdj95VHTB3mT59Zlq/WhdgMs1dZLX8ISV70g5ITvcYcz7JtRdX2ZuBet3qzFh9tY1shfrbkVON4UgFlkqihHEw+irZofjoxeBqtxmNyWi8VCe3xkz7rIEefGZajE2Zj16RZbnC8dD+omz+3AkV7nDedrwgM28VURk8K+Hu8PgNfG4fYbUE3SrZVVP6KM+mCbn8flsBecRWq21RgUnCujLtseZJQHnqfnWo0xuZ1LPiyyOCKAeIowNX/JKHZUSsm/lgcF5yZMwrnoeReCvaJC1g4lbS7D5hRV0N7bGWyc74inTDklY+ne/aDqXC1rViwZ2I3xhoG6s6aWkg+LbaTdP23HRaJqUO4sbEaaL6YuL8OmcIHZ0rTaiYgO5xUWZIwjTuLLYJHABrj0jAUxOETRWExn04rbs6dja3CD6eLayg22XsP1FsCqTQ4b7C+DxWGIbsu04hWrNagaIYfCUZfBwkI1H3oqK2CPO+iZS+ZVZ8lPmQ5Kz5E6fZmAu+YaY+HK6x2wZu/e62KtpmFh45N8eIU3lDNH3yo59XVV91P8YFj9ELAm7hXLN/R967AZva6C51mrhDUdHWfLDjvQL0OFYLaVumw1Ym9hOIGD+3iYzzsWy7V0TgOUE7fyFdjIcivtcBT9ImyyMYToyyzOFaiocYtdL3YDqs6Bd/+Ur79hxZQ8Ba3U/AhaNmXvRl8N5WiZD+o0z9QkYgNMOWJruwwW7yUvT3m35ZKJhNn1qJnKezk/WtGt4BUiOloFmFfAQoDZh48b4mbKzhl+qJ2xi5QhK2EhFSGdWPf0rCKwicIZWDm+k6LdYfVv+GP1hsozQA2YRFnXja6ANUqZuDVv8BF1m5Wxgy4omLTYw2zy81arzyGt3WARx1alcCDtTEH9EreedMeMw/Iv6EEScHJZLD3FK2B5I+lIfvUIsOBvVLbirAw9mZjCqRtERlbmHTvRmxlbqv0Gl4NntPoNsGwrpFWW1Wop6SDD2hUIzRkz5zuItmGzs8vez6Tqr9iJsrPaH45VXYZN4SSyweaEY/9E9RYOWoqySbHcsB2ZEOjzU4nlBs9D2cUKJzg/M2AbhTdONpZqoRccVlMlKZzll9WHbxxeZMr+Bu9ejBR+nNfJhyUVvzbWsC7ZiR3XjM38U+Yb3bdxssX5olNGDvd2x050eFXVV51Gl3Rf4nwNskDkx5lzQyRBgZ8zPTkXxZldu95Ri5gbvqlROu5U2uMKb3ji9zoZa/OxKZVcpa17PfT/a+/reuTKkSvf51cU+mn9oGuSQTLI9pPt3X2zYawNv+wYjRoppS64VKWtKnVPG9j/vufcqlIr2+rLi4wbBLy2gOlBt/Jm5kmS8cWIc7iRil1qpTUEoDIhle7sVeyICgfSnYfAwq7uWHz/az8NS0A+jQg8bOvHwq1yjN6cSgc4GP/wA7AS2TtLHxcXj1qy2pWaBjOwkS68xpHaKu8Ugr1dAOe5agjNH5bGVqW/jFkNjEfjqlqzGKavcZNC8TBs7LdBpjw6Zb3a+7d5U8BMyH1GU+PCG2HtY+NxwE5E8BGyiL8bA6yMeGnQNnvU+WosB29S5B6GqvKjBjzNh8FqdVVobP6wWmHhvg3E6jmuL1ZaiJyYsWh0LyxqWkLLoYvssoYda2buGpBQVsHn4I9NoqylmrDDOSNPNJM2sZEziE6Ip9JSsmA1dGQSj4CF1GcdO/V3YGnRSl7Zmobb8bkIk5o58BActOJfIAA2uMqU+kAbskkjK7rZOSemq/4jjCpLSkGoADQcW4ddLOcKbRfGUzn+Rk7IDVumNvlA3egoWNQtYBoe/GHVRoufBqiQ18gBEyCpcWx1AqoeOM+13bpNHQWEQWalXDZxaq/u8zqaFzgx6qJug8JXMbcp4mCFzG794A+K7SScH88j18x9mKpZhzqLUiRqQt6cVz5F/C9uwwqMFcy5ZdXeahH3S03AYvk3vfZRbdp5vsaucVRW7njxb+vTsgRS4dSBGjVM8wESx6UjkE4TJiMAC6a3pyEqNhbYw/paYef9ByOACg65jGhYD1osOuVy3sbpBkuzahiCStVsNAosRoybrM2Hgep4Rgaql9yC2ITmK8xKf3w2OO0Eq5I6XBlujN0XTkQ7o9u48HgVCSyPBn9s5NhufbARD0GF4Drik5J/FFUXbHcSsO/wXgglmRaaJ7orkr0JrIPA1lZ1+h1N6cCWEORZtY6y4KdcfYs3Nl0QjSrVmcqOdYuIqcz9HbWtamz+CYsuqwp7eyHIGViRnqqZKh2hB7nzsvs1JrCVBnMVt4cJCEvZCWGtT3GyNUqdsGQtpYaMZLO4LQmutau9IziQ1d5/wk/bEhBQ5TKocwB/THZFMYSb1CD034SN8a+EgWaEUHD7ALqVGDuHg/zD+rYUsk7oi73ftInMnko0kx4jUSV18owlUypHhB0kmMh5uyTzXUsNIeeINwv+2Dpbq1PeMYSvHYHsAazpXZjd+cdXfYkkM86D4bEWamj2SaS0smxPWLK+ZNj7Fnf0dxBb0WwXrUYEA5vlf9T6UsnnnAdKEoiGWrFPQMMGr02zE5YM0XD50qW+eYWEFIahpbkPE78QT6y3n26B0bDEUUcwYPUW7FItSM7g793ZFAGLg8kANQ7y8ToSctlvJVrABqllAjYEwrVp28FvBGznLVAXBiKJA3LV/agBG6PhNtLkAizJyTz2h+AqpuCfc7bIaDj3tGde4qDtmGIOOoGqD9hSjxnLNkCVJNjVxmE/eC3q7sqACsGp9MGVy1Gw8PtVncBpB1haNJIebABLjknL8BMGf9oLwOIkKMzH9lgtVquKXZZ73RjVf+qvpSUlfOM+3IQCZ2Anzw2xIt9sE2DlUhBS1ZHJOGYTKlM//zARsGqn5P2ANQyw1ukya4RYBJmY+IdS5GqKiEXHZ+vcMF9qCZE3N/+yQJMlKpyWtlGkkVZRITvbIEcz/YNDeU4vw/BsHQGr8GDl5j+tDli1SMXnjdKUI9xx6bWWqP7dYIDVeo4S6q405RBzGNjb3JO/OWSXUcrIG+MubAfYxBUb3Jj/uuUFCQpZlIbbsVcxd3fAU+qUeCMvNeReat0xso4l62ec2ZcyAJHbcEJFIC9NWs0ztmEkE16aEHGUJSjZcF8mMrexFdgZc8qMsK3EUPy1PoBNgpQR21srqUax6z1Tabf4a8MBVckkhdjR5kFsejaVd7FmJvKw6j4GB2wMpsi7LROWDJBSLBNKUnXBq4MOI6qSerZXSBG9SAn+Uh+trnOmJQ2YqBr2a4n2GzEmlrH7mw3KwvUYZbBW8MrRTpdL0rAYZcJaKdwJaT33WI1a8gFa8T1JLyVNOF69ZgT2o1BqVWEwCwhzygM/ov/x0oWFZUb3o9Vag1Z7/y++evEv3eiSc8rsKt2ucZQWm/2uOSBi0yQzYPFuPMge/YFWegjJHvjiQNMGBX9snSRlYXSPjqy3mOVokTeEqEX9cxVSGeH7ysu8x/aSIc3I/Qh1Fk3Rf3igrXxG0tPQeKxETcE+TpWT+Pc4A1YtVKva061yzJIV3j4gSKwTsJHCmdRyMzYim6UnCC62vsREWeABmyI2IpJQ+y2zKm+Z3VuLAEsUgW/fae6PsIvaalqbHf2xVWZGMvTQR8CCSeSEjr90GmBR6a3Hl8n77VMGy5mqHVuBbY3B3S72sASYqLBtD7tKNqcscBhwK+K/DYFJgsK1jCR0SENvl3kOcCkygWsbsAo5WIf0siFpbtE+76FSu/8sC2Ape+vzSBkIjke6/UYW4UaI/hfNPS5wJ3i3EWtugDOwa+pGtmVpDBNgJcShKYxIxAM+U+0pc+F4QnYvtAFWgcnFZ5UZRysX9jvUCYulhX2PuyiOKbuQwgEknogyxb3I0dOCTLiPVwyuwMzAxznMgnXvE1ClUiijtyOzBDa+u33Qg/PA/owWwEbmHQm7iJsPwUZ6K9LluvcIAJuSAaHtUoc/BhvSHsaJM05aX8m9y9BBU5LQfgmh1OL0jztkQTwRyU0W55yyXiZ0WQIWVd5CHuk8x84bM/tNGLb9BJVWwFLp8JyjcIpSrsncZRk5+VL9xUsAax1H6Xu6HlgyUDOtAPvp8/klqBO2zAOWyBY6gBUpCdYOmFfMmvx3YsYBy4GD53GwWqySmfs5kFlq9VeuBiwcMOU8tfjDIk9oSxMUFQCrt0ytnoHdQNTKoXQrrAxPMYGWtFNTLD2Pa2zDwquKvd8hFw0TiLQAi3rvpGXaIZWWOMxV7fLpCA9jcb9IBzZlVS/uuUgHNqrhmo1Hjqyf+xuPsnTKY8cJ67XKlcwwiHWBR5EctmP5VHDqg11Qt3bS5CZ/UDknTlAPVDGTpGQudNRAQowJ0heAVTmEUsewSMhvFvvsnMLxpzMGrL42wuQZQsEIrhtvHfwjKF1iwz/lxcqr/07M2mXtUZmALUtU1kd3lNyOOWUcS9Tq36nS2akSSxtY+d9Qbl54xJAQzeimByZWPWGi+g71yITsUs3EuAiyhdKH7sa+LZF3v2FUCjgkSGR3tuoElRLAktbJ4D0K6Y+AhYCN1Wx/1iLAqiIrz2qdsFrK0fwJozj9WWwrx+EmPMQ1SyPV3QRb2JfIkl4b3TFjsUIz62zxXOkELSrAYgf4DEy8YM5sU52wVJzd28XOfNh6IdRQmkN/bI3xaNkeEGCMUOySaDUUdlcWb88lISwssGnZLkbJqxEzq9hJLCXoBFgSRLcR1WBvH8qN40vRff8RUVnFH7etOwuz+Uxw4+K5G6Qo7jQ3hMWelJy3rTtgZY3mxAvnN8DmZP/9F5fAAe3tRlG8TOMZ++SFdOcirZYpqDhNFPs2KKldDug5jFzx7n+w4pK7rrn/kKrtIGyZ1Gm8jGn+2JAArTqNe7BpqvbCfFU2A2icsBnJlNpD35bFgW3JZ6LLF0+BpVhzdl+ytDyXNMJzWUO3sZHL0xzKU3pqvXXwx5ZzZWY/ljpea4whm/VXFf5Q/IeLiK02posD0QRCUvOEG/kyW4KLmQCLtF9hcLXM1eqSzBKK2BaR/QDusIQFm7yOW27BitS4iHb27KSrBnTwh8XG3TLiY8YeZaunuXRIpxk0TFitKjjE8aWfTQdLlmq255UIf5HJ9uSPrbEFpu0QG5TEiz27JnVnf1QUf2yZpRtWm7ZPWUrCGWSzJrWU1GP33455WWVeZY8b41xVs9+qcEK2n7G/uWErWhEyDsTQEsdLDuj2jaFWf8ZRwiJ9XpQyvgiTBM9QzZw3bBkp0V9bQEJZ8EECP/Xc2TaSX+lazOEHvuNK3zYBW0I0MGKKlURdgAMGjEJkdhcmwILnFCTS47tLoduTKvYgH6dNgn/EWBZWE9miLduwEgVTzIYRLpqXA8kfVuco6UCeWtgS29MBgyuUCxH/lKyuKqyaBi4aH0cSi2DWUgza/GfCCCsXyuEOZGTgx84vRi5uRqzr9JQ/rMpry7CjiZnYqtr7RzuHbP3HjIitr5IJZXTAjoCV2Usm/qIrEhSZZk0wvM/B4ragTMo1m91YIdFOnZGX6SIs3qdBcYCp25lo4KVtDwHfXFLwh4Udj6ijjozHEauVSfKbyoQDpkuD9QhxsAXhCeyKigojjy/e3UE1pJgwG7LddU5YB5CokM66sGiU/GEhmRWW0Qerxc1jd8vUJavuBL+ERa6WPAznG3ZgM4e8qus8rk7YhPiYVoeCuS2yzGMeR6y88NPivgn7QiH3UkflmybBPtGRqzBunpBT9iX1UmPY0YjICYkUzK4rs5Ue7+VvDvtSqLgmI53BBuNitvLk5eQO6RN2Iu9xetxVvmmpiN3UI8hcpxK8g6gYFpKc0pDvqCZGFqfs2xH2I5x1ibhhS9iOgy6IFEM/oMBRyUIT3DUFCAqeBTH2yNrHGINZMbdoo2SMfycYYCk5/QZaONyCKavViXELRhJGTIDFkV/R8WrlpHbV9xZiFv9yVIxLCtR92kSVOqKNYFYTKLWGOEEYjKhyQXzzMrjXt7E1WpYDNiJMfUgzVkwLMqJX9dVNbIiPGf+bM+aIsD75FzmAra+CAttxfSqJtWwrMWJG3l2y/1w9PmBZ6ZEHFEyAFUrM5py5r5TWEyKOtDyL+24XR1OrOBh2mZWGxDsFd+IKwoI1YDQxHmlmDh+6vV8FBjiX6N/PHCnPxCv77e7ztTRRzKEUJePxU/r3J0bKM61UqQNYvbeQzZfoXVvi5Evwh5WxKUbsnEfBgrsMPbizcxJWLUXa6wTf5gHrYdVHsbdd4jeaYeqFzL4NIWDeg030gIQFplEyyQe8sWXy+3JocNyvAmwp1Wh20RVBTmzFvTIAbIIIR+v2rRFHkpL9/rJGyS3X7J9j5gVBIjfI837cDoRrzwfoXbI7oPhzuhNbIx3YYE4RkXJk4mG3IFJKc2dGkEiZJp6ybalBwErSDlDuEMVndf/8mQpNCTnkDvUpCfhadi5S7Pw4pa8U2Aob+V4pBDbpEWrBm2fzWMvadykTIkbqNFV2sW4zWtSickAjX+6CAMT/YizWJch6Q7kJSrGkdtW6HKio4a5aR1CJfJZ1z9yscmismrWohUQMqfsHH3WV2JYRNx1O+zkL+4WwuOW7//QRYGkpPby2besAG0k2zDr2rbAc7N7BB2ys5pQ8kHgDLNhNs75WaisVnv8pU1ZzyFu5bRGVLcnRTH+OX0Z1Rlamz9Wc8lJXHJwyng6zMgnyMSS3EzIXXZS3BLkMQPVU7PuwrLwP/nUqXcgiEEsbHa9OYOZ9qD2XM4fhBKtRCy3KIBPLyizDXNoGLHiwNCGsbwuVyqUNyGJWQma7bnNS6oZOuO1rS0V4iMd2UIQrPrQHNS8ZQtGa84yd2Hnp0dK43kFsbJi0WkQc5xDFv4kv9iUiEEjtpVtgtG4lNrNyWEpaek3+nqwv0pvG/lJf1AG2VRLZLDeQQ6pSJ2Crmd94G5PgPc2OLMLix9D9Czl9YV2lpQEzE2D1nuwsRr0FGCH3ppUUlhg1SNhDjXsMNtJ3hnMaWjdsUpLWPFyyfK66fOGS4ZNq8g/tAYvhbyojJ13y+bThpWNimtmP1vxhNXbJbMscA9R529OlXaVZWyjuViPFJWigVnnKYw9GzqOc7XN9JfUW3b0zsJFvJPYdxVJgQ5hnbnIGtqQ5+fevAFvB2ZFh2oLo/ogBuFWFzF1kgLBUYy4juQvAyvYLJFgpzir6J5mJok3wzl0H56vUA+bf4CQpkuO/B9eGnMRxtBEsPUKYeo7kCmEhiuKdaRscrRrPhOgvnnJW2N82AdYqpNzaYLUq5/IP0KTGFizuzJ2ExZ4w+K++Iz58piC2Y4PlCNHfOcsS2U3SRqVfavgeoCQTcuSmrv6w1nnqPGCtx/sGOwUaYKlo8G+vT2zI6VSbHsJK6QhhdAon+N+tJPbiIEHRbcFBJRG/nfOBBRKaIPfFYhcOL7kGF7JHwVJWbYL7NBVg4c0CW6J2hPPwBe0AkRwY3ZBzm4CtNARrfaD9Q2OYzVTGMBut1ux/h55IhhOHnG6ERZZcM5GnILP0l5GRVJaQhX2X23YDKwrvnQ9QQavsba7+sJJK3s5OkLizDGAOeBuSruB/+wBM1PCkidpGVTlib6c7I+OkuyAkUSET5zz/9rlijEHKN+ti1cYww70dALC65hJ1G5Mmey8A1ePYluLvjOuSAlk5Br0AgNVathcMkQFIDv4Fw7rg3QqHmsaaOPihi30+Edlkh3kPfcKS1Yo4TfeIGq8EdjkcUL8GMnXvYga21jW2lrbL8iuVs3lIsYbUeg7+F3pJEfL2KgPl8HWewN5wg3yUN/D+tkMXdpnlumNUILcSJHZ7yQaWCrtjxoqR8QHRxCDegPu2DwHXoPhyaYLt0KWlEkMYxBslUOfTXtXAe0yYukxtCVVi620Iq9tJA1jgjVXcFd4Jax3PS3uE3ZBNktPQbOipcVVjn7BkZJVocZufg7CitGI3G40r5m8S2wLDm9so8yox12pXhshC3hH/27y+ID4i38YUVKVyrDk0f1S8Q+GMxQhWlWDNUkrPcSUhCP6w2FqY8+AOpZXEwWczEVjHj4jzlfxhadAcdbRYiVqp5lHtRqvjLhRGVF0EIdQoUy6png1/XtrawKzBXVRbJCwsu6b6UgvVATbVau+KIpfaBP5bYMspkTdKRucLuYW9cyjGkpt/0RCwaiUP6NBsCHx2tRPF8kI5zoDVkHiFuENFhthSPYDnodU1lnc/ZXGBTVjl1nUPNsq/mDU8W2Fy0CZgk9pzl1EhoKxWzWo8WimM29xjDsCqCCUQ4fQ9KbNoDebajeIbzmgHADaOM/cwuFs+CFaTWnTClLakJWjF/pBR9KsHEINTi4eUsf47MS0Ss+Q0KvwyErcTZyFPkaj+U9qAtTY3yLAUkHM0yz+QOrvqGaOzGywl6X4ZmsNjYEVegPk3OIgsJBzTMN6E5UyK+OKzhVh7QtAhCzBlDS8snaOdqFnMXLgt1MjBgAnYKO3WZF9Alc/5eC5dtyjlrHjshk3Z/yqjHLMENU+BEVVIOZUJqLBMSMTyKMc8BlaHoc/F/5DlJTFv1jgKN0oS81wbYMGrZH/OfcBCuicMogaw2hGiFi3RWWb3u3PAUtKnBB05sKLJzHWz+uWkZcZq9dpxikfRBgnzuz35Ug0TJhykPDcFtPFiHQKrKyIOfzoHwMq5UqxrdOdQQzGTc1KlA2bQ/04PsEh0XuK+nLKmqPaqL2LDnP2vYYGtIw7N8sLpMIg2EPabp0ZhOxDe5OofSVUWSVvbu24lm8myeJvNsNT9eg/YMmUF6vioIfiPBxhGyTMsSF1gPdZG/bJnyQ7B1hNi31gnbEde1iN7HkW/HNsyF4AVyQqLUu4eWpcI20HhpT1LpmKfsizMwsNZGu6GbRUlKcOaPUKhZq/9Zqx89O+zBCw6mLAD1hEKg0j5wgzNH2HvTephxCbVetBm7m0rjKlimgCrLVgp5Mw7qOqBrVG0z4wttIJkwr2dA9gSPGbZd3t0DLaKcBgZtH/trS0FoNrQ3vee1Txrie1YCht/gz8sZZ4+BROCqTyjJsD+m8rGrB0+bOVkjvZaKZuzpLhTjwIbOwTLsDCA09ftkmFaRXubYDnYhVPJW7bnbpZrmuxlUroXHLPkjw3mCVHVoDe2B2RSdrVLjTGcV8jdYPUS44BjD6Dgw+3lROG4andPxHJYYlvZFnbsw6OwRU56+89o57UThyxZO4oDwJbLAWJokuDD/Iv2wFYLZy7jLpMfarTP1ldsxxqz+6RsZk9OJ3VxHtgPxFN2EeDaYofZd/fSme04TZkn9R3b8RhsuZIMzL3GCGwCr8kOmbQHm1bzcDNrywgZ/YXRgK1SeC/sYUns5NOOZmy10IP6z1MBW6N+wojUhxwWPZmbFUkUHkTc7/5yWiLC3D6QGCAsmGp7SkYnU/z1qABLyNwmuoNQpfPy2Dy9XVa6ouAv5AFsq+Jx38PX2Tnzks0FqxIkVPGnfgC2Rt3SgY7YYbA0xXaWvjrBEsoe59ReBk0HRj9pbuZiXFm5nfwb74FNyBaT8r7t2KNZXLwUiTmJf8cisFHmE8sxso6SzsbYLoNFyR38lO4TIIClKhR0Hp2yg2CJIAR3TztzXkIs4VmhfbwTET1LsVqQVbtJ/bs+gC0hjmOj7gBVOUAtJzdkumdkXG6oKFHZ+oAA8qBKXEYunSbctWe26FRs+DBKy4RvbA2qcg25a56xWp2UHK8E7wMvlhHgmytxJDGMEy43Mxt1ehqdLs4rmctw0hsslH/zUWaXTq9dhmb+EFgwGhUxzgxYtcXAq6uB0cgCg2m2hchoS/Kf4wasTtnXlEZ7kK7UbAqpUBb95xdzXaJ0TunE0R7UaCfsRMwrM2ScAQseCX5/sFYt2im0VhvYsr9mGEBVUrT3ob3ABozdbi+iygShY8CiQtGXzrcRtnTGA3AptqBtgkB11oXWic1Gg0ijSO3VbjV6pqJc84fFzKOlF72EQaSBfFDMzYoUwpYudcKSFYrWD4Ttj4IFixjqBFEjwOITyC017zlltau5Zs+9WDX7XyG1JSDsDa2MIo4aUjbP31MXlEWp4A8rUSZk19Rz58VYM9e1uR0l+HcNAFvuomE0QgtYUpK5rg3rwaKDToClWLD4egk9wlZbsBdJ2ZOWJxQD2tJr1RCHoWJtOR9QH00pnL2PE6y+UJyh1CEsDWcRw8VujPxC/pX6vmQY/ZqHB4wSVPYaYnnWi5sAq2pUXkwOvDNeFc2tpVinqhNaSwELPpc1olGhjd7bXhXNRci15h10lLDEHEiCsCtOhMmM5mob5+FnqG0Dm7TAKHgH8epRmSY7cnpsE9atBiqW7kvJmsRmL09RBy/5W5BCha3eQh9gqgfQUFMkUifwNRcKbJEhZwNTY8tbauZQKnDoo/lXO4BJIgcjtsuIkZT2IYjV1OfWEftqc798AC42iNcB/RRwpUBhLeMezD2VGpo/RxNwaUdsWHYM+cXYKo2m1dgjvimkNnYPEktagrDd50XBTrfBIQ+r5sp2bkKpef/uUoBDmt6lvagblW1wPZ7T21wILkWYI382RYAjX2zfLtsjYXvW8rWeNqUWwFkU4wZLSRVTt/lk2LyOwNzcI5CVIjbdv5QDXJRu0G3+cMISHA8re0KuDDol+weLsiSEwP/O3v0WVEYsad6DSJAkdX9lWYDCMUZGu32NvuLK3VwqxSppjNW/aA9cSB25v8aRPcHpyrRgBSdsjfEfhgO4XkpPup1prriwZuYTpolC6dV/M+Yl9lrZLziyHC3VaL1BypzajRNYqIAL7xYDzlgZOmeCK63bTxqZG8X/HgngKjWBZE/MSHAkkTKbR4RxOoHHGeB4W0li+2E7zgqun83CXhoQJ9Hiz6FQyhLJyZ406J5tqfmM/+tCcCWRIM29ig9w+BCsRxvflQFcqtlOokOD0lceZX9wlHVECD+m7FvBdTsbC/M0aX1CwbEsHPPOZeQEMi94zbk1fpsYJrTdl7qEBlvSRlExSR/tPhvRTD+/23aDtbI6S9plRLCDwgHmH5FW1+CfydSl5IzAZ/teiXuRjC1mn11h+uMENgXgUoUHLbLLOGb4djOdf64kvNIJRX0l/0CidsAgOi4kF6vmQCtyi0iZgCtJVPIqDNarCAcazdlMaC2WNmO9cqmadXjIkKaqud0ZljFyas2/+K1LJZ1nGoAqFP01g0q9xZT8nbMu/bnZdHyrRHCVuhpms5jII1n8r8zagsg0riyjA1yaivnCPZeceB/on8U0St8VVr7LCFeP5uvbXAMSIZlwDdOWQsqSnIeWowU1X91mfFg7bz5zw0WG0djHFrHlYM/JKChBoUL39epLgO2gsQo7smn4HgnWdnWkdWzKmGDu+5JIkCkyyltKT8levIIJZr+Ov1HsSwmir4Rpw0XD+tqLV5nkHtlf0RrgVKj8NFyypvbCDnb+KlQZ/FF1xPddhn6s5l7MejTP7cjRP1KsgQNkvb/2P28uGknJk1lLWOAytU1gTauk0KFm9TZNVcoSjrCK/Gly8c+gK9lzQot5+6oi9cR4wRwpCoJTkni5r1ZcWFdbRepHOxFfCMZMrAPDxJURmrqH+MAmq5DODv4+fim1t6xLiRrOG5vcsBU66cFgCBxQ1GaWAuGvE8joMmE7srSIn3Hc2sJuotDM41dcs5QmzClVtu0Ulbgd5LMruyeztrWsQhXqzw9R2bCDpajbrXHrFGk3i1sLjpfCWrlHwYCFkEJIfTG8dyd5dc9mBUOBa4F1bTOWjGofbPobXgYehG2dQ+YUV/DHxpYC2P0JoFqmaLe/JHmVhVEpuyDiNiyKRIk5vI8c3fSn/gSsHHltm4awkpqje3Z15zahXgpYlTNesl23ByxYaLPyk6Qcc80TrIYsiDcKGc7HFrGtzE3WpCW3pk2rvyhIzUuMPceiYzJCYEOsaOZrJd/LqugQ/LFRpQbxQB3BStrtcQcZWKq/4DpgIbwhZ/+Y95PYznVzLsXGy2H/YVtga6HzrI2boNnKUNRMIim8MJDor91VC2unCD+2GzUBC6Fes1dN8RZINf0TsrIkjW0kvUNYpXVz0ZR9dVN2YlkKHDTj7uYPS8j8gm/uzmQKWIq9EXR7cpOwelRrFXhtOeIgYPKH1RnZh7TLJrbQzFzIWLKSqGjhjq0uML5tdKf53NllpkGWpKXSdgR/WLw4TXEQLPZAKSFzXZFVe4Rv7t1UgFWpElq2R0IIC9GWORELRfBG/hd/gLUuRElj1Z2DsK0dcCSNdN+JukSpEWFiGsCSbp+5ErwPG8nbBFhCwaptur6DrGFuUdrKnuSPquLnC3F7cBMrFalrZF0sjZkdS3ECrIYsrEiZAGpVVev+tHa1LQHPpNG5Ir2DfTiuBZlzu9IWYXdi35cyUyzSbDN6TolC8hNWjKXfPqByJqxezIJWCNuYMfurmwCWKrVGdnAe8wJSYsvmCzGEUWRucA8P+xKSsN9cd9wcVZZt7aUOadS08s8tO1wY5UjzZjCF8FgpK5DMsJie+5MdAZbCBNcwaDRa72/tO7HKby/W3GD1RBXaraUip19O5uqGUtBH/UeGNSyRHf11O9xILLTEA5o6egG05B5FARb2OmtsY4a09FJHCuYLzFp1QokD2LBiuQ1KHInB6pkkzqVZSlXV6l72BaxW8EEl71gyNru1at2OisBt1Se2YcM//4Wv+u7T9SNA4e+fHj6f1v+CD318vHl/8/b66eb+Dn/z3f/48/Xbp6t/zj1dPX68vr09Pbx5fHv/6XT1cHp/c3f6eLp7Wq7+1+nz4+nx6vPd2x+v7z6c3uH10q+eX3d9x3/N+erm7un04WF946vTn09vPz/dP/zlh8/XD+/+kt/j8ZHvdfUeb8KXPF79fPP049X9w82Hm7vr26uf7x/+dX2vx+v3p6dfrk53P51u8f6Py9Vf395ePZ5+Ot3xY+sV3+yBb/Hm7vrj6erj59unm0+3N29vnm7wHT9+fnzCd/94fXP3V1e3N+9Pb395e4tv+e7dDZ8Bwl/w1//n880DXgzon/HZL8v05vnzf7x+OL178+70083b05vbm483TwBMcA8fT+9urp9OL8Df/niPVzyuD53WXxF75+nm7vP6EyxXf4///wkvu3/AYj/d4QOu7u9uf/mrq7t7wHn46ebuA+BfvTu9vwYEfpebn55/vXVrLN89r9iPN7fYSDdcxohffd0ar1vw/v7ph5t3+Flvnn7B3z9v5+9+82Julafrh6cfrv/0+HTz8fTcZBZaSQ1hl9b2h5fz8N3pzzdP2Kvv+JLnz7l+D9hfvfP1h1+3a6xf6Ie+uZ1zouoyuRLq69f4nc38ra38+sbXP3OX/t312x+v/vnmYV2uvzt9vH/45eofn/BrAdHbx++v/hu/2dXjzb+dru7fP3+zq/V7/MUf7/4Bf/V49f7hdPr+avynFDgfWV4fW1dl/GAMWUNJXx7Dlt71YC8lpF8fe/yEY3N7PX6yZxX98tjTjw/3T0+3p3d7AIYvj/2MM/Du6h320vZzKTaqx78+9unzw4cTV3rHp8WGx/743T89XN893j5v7nW3P/7xu++//fpM8ldsj1+XAIftlzc47T8/4CR+/7u/f8RWC+vnPT/2b6eH+6v3N7cbPwsOAAe/Wov5y2MPp5eDuPFrlhwjaVU1nP8ow9+fNXNEzh2P/c+b29ObP12//VcsATfv49aznObBccVjf313f/fLx/vPj+OH+Eep7vTr9oJFXm0ZftOPn2AAH+8fvvUOGjrO5pfH7t++/fzpBg/+6ZfNB1OQ0vmT/PfT68to6Le+Y8wa6TuVm/lvdz7EbRIThRbK63Lf3D3u2I2skbIPRF+XmzZnz5mBSaCGMT/tH59t2J6nvli5l8f2ftqrCfz1fF9/+LDncLNGF+tvHsOOflx9xPe/b7y0l/jbx16X8Pc/uATeA3312BtuMPzLwHY1Cflbj139eH/7jl4R/+0bP1RtX9nlrx/bNO3rgNY3H8NJeoN/Xw/SvzNnioXrm4+t1vP7b+0VPPY39D10Rb/+ir+DCn+atlYyf5J/Ov/pNw8CIu6Sknz12Ls9xy6KttLXX/K7L47/OV7CT//Dc2Dx8fTxT6cHuuP//S9fxRsfHu4/f1r/6x+evwEijC/B5u+8xw9rCPEDYrDru8+ffn3Hb0XcFFiF9U/9q7mZlwDod0KTr9730hCFpdAvDRv/UUKU0PolIUrUMjNEKf3/3xAFvkQvCVHaV7Zvd4hSydvxHyBEKeGSECWHekmIkuSyEEXaJSFK63VqiNL/K0T5zxOiVC2XhChayn+GEOUP//cP/w+w5s17AGkFAA==
````````````

## Artifact SHA-256 72b80f43a3d2a1443a516727f060013ff02ec85fef1f7028180c6402b68fafca

Encoding: `gzip+base64`. Original bytes: 271549.

````````````text
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
````````````

## Artifact SHA-256 e9d659cc52a25b312807e1acfb7f9fbd684bbf94bd6a3bcfc0a7d68380f90fd0

Encoding: `utf-8`. Original bytes: 2771.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "26cbde13c6cfe7df960d14c29e7620f3c0500817affcf6ea97390dc84aa22176",
  "exit_code": 0,
  "assertions": 1914,
  "original_assertion_coverage_preserved": true,
  "automatic_native_metrics": {
    "automatic_planner_geometries": 3,
    "automatic_memory_fallbacks": 2
  },
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 371.235655959,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 42153099264,
    "swapins": 44356321,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   550073.\nPages active:                                1047406.\nPages inactive:                               955197.\nPages speculative:                             94748.\nPages throttled:                                   0.\nPages wired down:                             219938.\nPages purgeable:                                  18.\n\"Translation faults\":                    18426031421.\nPages copy-on-write:                      1041649140.\nPages zero filled:                       28153661592.\nPages reactivated:                        5411297670.\nPages purged:                               97267989.\nFile-backed pages:                           2022730.\nAnonymous pages:                               74621.\nPages stored in compressor:                   707421.\nPages occupied by compressor:                 203386.\nDecompressions:                           1471989716.\nCompressions:                             1812708358.\nPageins:                                  9648418124.\nPageouts:                                   11643258.\nSwapins:                                    44356321.\nSwapouts:                                   77895019.\nPages tagged:                                 158312.\nPages tagged resident:                        107947.\nPages tagged compressed:                       50365.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                        14888.\nPages tag-storage non-tag pageable:            76542.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8788544.\nTagged compressions:                        14852234.\nTagged decompressions:                      13785963.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "764d8e8e5cfec3021d70e2fc91720ba17bf1f7cb9b72c40391cf9a94b183bef9",
  "execution_receipt_sha256": "742d945c59756263609a1a1677af1f489169494db304f1ae23c4ec9743f37224"
}

````````````

## Artifact SHA-256 742d945c59756263609a1a1677af1f489169494db304f1ae23c4ec9743f37224

Encoding: `utf-8`. Original bytes: 2673.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "26cbde13c6cfe7df960d14c29e7620f3c0500817affcf6ea97390dc84aa22176",
  "exit_code": 0,
  "assertions": 1914,
  "original_assertion_coverage_preserved": true,
  "automatic_native_metrics": {
    "automatic_planner_geometries": 3,
    "automatic_memory_fallbacks": 2
  },
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 371.235655959,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 42153099264,
    "swapins": 44356321,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   550073.\nPages active:                                1047406.\nPages inactive:                               955197.\nPages speculative:                             94748.\nPages throttled:                                   0.\nPages wired down:                             219938.\nPages purgeable:                                  18.\n\"Translation faults\":                    18426031421.\nPages copy-on-write:                      1041649140.\nPages zero filled:                       28153661592.\nPages reactivated:                        5411297670.\nPages purged:                               97267989.\nFile-backed pages:                           2022730.\nAnonymous pages:                               74621.\nPages stored in compressor:                   707421.\nPages occupied by compressor:                 203386.\nDecompressions:                           1471989716.\nCompressions:                             1812708358.\nPageins:                                  9648418124.\nPageouts:                                   11643258.\nSwapins:                                    44356321.\nSwapouts:                                   77895019.\nPages tagged:                                 158312.\nPages tagged resident:                        107947.\nPages tagged compressed:                       50365.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                        14888.\nPages tag-storage non-tag pageable:            76542.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8788544.\nTagged compressions:                        14852234.\nTagged decompressions:                      13785963.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "764d8e8e5cfec3021d70e2fc91720ba17bf1f7cb9b72c40391cf9a94b183bef9"
}

````````````

## Artifact SHA-256 764d8e8e5cfec3021d70e2fc91720ba17bf1f7cb9b72c40391cf9a94b183bef9

Encoding: `gzip+base64`. Original bytes: 191838.

````````````text
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
````````````

## Artifact SHA-256 2c93f4cba674426bd17206049bc6e2faddbb7d3c65842340379b70e88a1e2325

Encoding: `utf-8`. Original bytes: 23090.

````````````text
{
  "started_at": "2026-09-09T09:56:44.283171+00:00",
  "deadline_utc": "2026-09-09T10:37:14.112717+00:00",
  "command": [
    "/usr/bin/env",
    "SLOTSTREAM_OPT_WORKSPACE_TILE=1024",
    "SLOTSTREAM_OPT_SCOPE_FRONTIER=1",
    "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "scope-integrated-mtp-vision",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
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
        "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
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
        "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
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
      "source_archive_sha256": "6369274313f2baa58e96a0e81b09878173b24e69149ffc4c939812a4c9b7a763",
      "binary_sha256": "d3701afdb0540850f376ca9a696a2a0ffa31a67121362e341f87ebc9e27fd7dc",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41941057536,
    "swapins": 44356321,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   534050.\nPages active:                                1066128.\nPages inactive:                               963341.\nPages speculative:                            101354.\nPages throttled:                                   0.\nPages wired down:                             221738.\nPages purgeable:                                1786.\n\"Translation faults\":                    18426149194.\nPages copy-on-write:                      1041663325.\nPages zero filled:                       28153724494.\nPages reactivated:                        5411297710.\nPages purged:                               97268404.\nFile-backed pages:                           2024043.\nAnonymous pages:                              106780.\nPages stored in compressor:                   679234.\nPages occupied by compressor:                 191434.\nDecompressions:                           1472017125.\nCompressions:                             1812708358.\nPageins:                                  9648418492.\nPageouts:                                   11643258.\nSwapins:                                    44356321.\nSwapouts:                                   77895019.\nPages tagged:                                 158157.\nPages tagged resident:                        108304.\nPages tagged compressed:                       49853.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                         7408.\nPages tag-storage non-tag pageable:            84022.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8686272.\nTagged compressions:                        14852234.\nTagged decompressions:                      13786473.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-09T09:56:44.283025+00:00",
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
  "preparation_sha256": "20fb2090d27c6effaa0ff0da407456fceffc1aedea731afc5caef7dc7d0edc9f",
  "classification": "Exact V492 smaller-scope refinement. Reuses unchanged V439 scope and V444 integration executor/guard/assessment functions with original work and safety envelopes. All seven V436 assertion-name multiplicities must remain; lifecycle additionally requires actual process- and shared-device-limited intermediate scope choices and exact continuation. Native correctness only; no serving or default activation claim."
}

````````````

## Artifact SHA-256 951e3367ca056c66999ea047e04638c78d3bdc80a09869cc829db4bfdb6e62ff

Encoding: `gzip+base64`. Original bytes: 171866.

````````````text
H4sIAAAAAAAC/+19XZMcx3Xlu37FBJ7sCKOYeTPz3kw6/CDLcoRjV5ZC4nofLAdiOGiCbQ1m4JkBKcrh/77n1MwAaAqsLHfWrVivF5LsINHV3acz8+b9POfff3Zx8eLq9u3by5vXL768+Gf8I/7FF+/v7774+njzxeHmuxd/9fjvfvc/f/3V77767S9//qtXv/7NV6/+969/+z9+95uf/+KXr776h//5y7+JQfJPvPJ3v/j1b3756u9/++t//Ooffvnbv4nPL/vif90f7u6/uLq8u769/+I3d7f/erh6uP/i/vr24f7h7nD59ovp6/fH69df3L57OL49/uny4Xh788Xl60v843eHl/dXt+8OL+dXvPwuN8Eb3bw+vr58OHzyFs+f9elbvLx/wIteXn17uPrD89+/fPnd5d3x8ubh+V88vvvx5uHw5g6vfv3y7cO7l98d7/H8x2fe3r4+XH8ezvQJjPll91/82/eHm1RffnN9ef/ty5vDHx9evr3+48v89fHh4zv+6z3eH//wL/w3L97dXh+vfsCy/PvTl3q4vHt4/+7V3eHq+vL49vLr68Orr394ONzjJRJilDD/eXq3t8eb49v3b19d49f67CMpPP95fuLyj/MTt9/fHF6/uru///DSaD9+9/vLt+/wXvyF7r67vH51f7i6vXnN14ZJfvR+8yJ98opYP77Nw+27V7c3r24O37+6//7y3e37B77im8vr+wNe8R/z7/D14Zvbu8PH3+Hd5ZuPKKKmmp/e7XMoc2wZrwnN9Pkz8TnHm/nvciqaJH7yF09fwKy2EmJ7fuPL7/EvX/zq8urbi386YhEury9+dXh7e/fDxe+wm473D8er+y8v/oLf7OL++KfDxe03j9/sYv4ef/n7m9/gr+4vvrk7HL686P8pKYeapufHLq+457sPxqAaU/nw2PFm3YNNU8ofP+3+3eHq/fVl98kY8GEfH3v49u724eH68HoNwPDhse+Pd4fXF6+x6ZafE4mW2ofH3r2/e3PgSvd/FauKx37/4qu7y5v769kIYIe9v364//2Lzz4daxaNudWmHz4PBuGHl7Ae398dH37qM2PAVtOUq3x47E+Hu9uLb47XCz+L1FiSSS7l42MwHFw5mp6fxFcyDmUzi+H0R+n+/s1Eaw4Zj/398RpG9PLqD1gCbt77pWcFRj5kbq+f39ze/PD29v19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
````````````

## Artifact SHA-256 ebe7e87de6d4f0b2a194425ae9f0355b196776dabcd6739d18baa03dbbbe2b15

Encoding: `gzip+base64`. Original bytes: 128569.

````````````text
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
````````````

## Artifact SHA-256 a736a419b84d2509506805cf4672abf1a612033b5a30b814e92ec89d083fcd79

Encoding: `utf-8`. Original bytes: 2778.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "2c93f4cba674426bd17206049bc6e2faddbb7d3c65842340379b70e88a1e2325",
  "exit_code": 0,
  "assertions": 873,
  "original_assertion_coverage_preserved": true,
  "automatic_native_metrics": {
    "automatic_mtp_planner_geometries": 3,
    "automatic_mtp_prompt_tokens": 4096
  },
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 174.662728958,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41959292928,
    "swapins": 44356321,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   565101.\nPages active:                                1054283.\nPages inactive:                               944935.\nPages speculative:                            106216.\nPages throttled:                                   0.\nPages wired down:                             218410.\nPages purgeable:                                 166.\n\"Translation faults\":                    18428947297.\nPages copy-on-write:                      1042060594.\nPages zero filled:                       28299921750.\nPages reactivated:                        5412576538.\nPages purged:                               97280840.\nFile-backed pages:                           1995725.\nAnonymous pages:                              109709.\nPages stored in compressor:                   676418.\nPages occupied by compressor:                 181388.\nDecompressions:                           1473678685.\nCompressions:                             1814448561.\nPageins:                                  9649492627.\nPageouts:                                   11643931.\nSwapins:                                    44356321.\nSwapouts:                                   77895019.\nPages tagged:                                 158308.\nPages tagged resident:                        108375.\nPages tagged compressed:                       49933.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                        15087.\nPages tag-storage non-tag pageable:            76343.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8705792.\nTagged compressions:                        14859784.\nTagged decompressions:                      13793490.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "f8cc4841050a940ed9dcc269d4d1014908030cd7cecd78801582ea892d3d457a",
  "execution_receipt_sha256": "c797e3a910ea893450b674caa9b143a1c0ef3dc6cae1510fadfd60414e4f9a38"
}

````````````

## Artifact SHA-256 c797e3a910ea893450b674caa9b143a1c0ef3dc6cae1510fadfd60414e4f9a38

Encoding: `utf-8`. Original bytes: 2680.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "2c93f4cba674426bd17206049bc6e2faddbb7d3c65842340379b70e88a1e2325",
  "exit_code": 0,
  "assertions": 873,
  "original_assertion_coverage_preserved": true,
  "automatic_native_metrics": {
    "automatic_mtp_planner_geometries": 3,
    "automatic_mtp_prompt_tokens": 4096
  },
  "all_v436_assertion_names_and_multiplicities_preserved": true,
  "elapsed_seconds": 174.662728958,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 41959292928,
    "swapins": 44356321,
    "swapouts": 77895019,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   565101.\nPages active:                                1054283.\nPages inactive:                               944935.\nPages speculative:                            106216.\nPages throttled:                                   0.\nPages wired down:                             218410.\nPages purgeable:                                 166.\n\"Translation faults\":                    18428947297.\nPages copy-on-write:                      1042060594.\nPages zero filled:                       28299921750.\nPages reactivated:                        5412576538.\nPages purged:                               97280840.\nFile-backed pages:                           1995725.\nAnonymous pages:                              109709.\nPages stored in compressor:                   676418.\nPages occupied by compressor:                 181388.\nDecompressions:                           1473678685.\nCompressions:                             1814448561.\nPageins:                                  9649492627.\nPageouts:                                   11643931.\nSwapins:                                    44356321.\nSwapouts:                                   77895019.\nPages tagged:                                 158308.\nPages tagged resident:                        108375.\nPages tagged compressed:                       49933.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6863.\nPages tag-storage free:                        15087.\nPages tag-storage non-tag pageable:            76343.\nPages tag-storage non-tag wired:                  11.\nBytes of compressed tags:                    8705792.\nTagged compressions:                        14859784.\nTagged decompressions:                      13793490.\n"
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
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
````````````

## Artifact SHA-256 704446bd9e3eb5b3625d995145a41faf26d4a64175b87092761047a181b1c306

Encoding: `utf-8`. Original bytes: 28421.

````````````text
{
  "passed": true,
  "candidate": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/adaptive-scope-build-v492/candidate/slotstream",
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
        "Sources/Slotstream/Context.swift": "af310ab4ca9eb15b81b02e364164e07d0b56090997b6965538aa1583ac864a0f",
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
        "Sources/Slotstream/Generate.swift": "ea743f98a23cfada2157290dcc591e85a977db7d537dd57ee6cb76925d6dd9ec",
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
        "Sources/Slotstream/RequestControl.swift": "1e393e5ccc31528e2215c9a7ba72ece6b411d2772e1bd2225191b5ed46d87ecc",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "fec6dda4397daa0b5293e3d9cc617cadc17e409a5627ed8a15b9b2bea205deca",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "35d99deb614da4ffdfef075eabdc5a1c8b3518bf9accf265796e09f2c7c281ee",
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
      "source_archive_sha256": "6369274313f2baa58e96a0e81b09878173b24e69149ffc4c939812a4c9b7a763",
      "binary_sha256": "d3701afdb0540850f376ca9a696a2a0ffa31a67121362e341f87ebc9e27fd7dc",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "cases": {
    "scope-family-2051": {
      "assertions": 817,
      "started_at": "2026-09-09T09:59:39.159161+00:00",
      "elapsed_seconds": 42.123847125000005,
      "startup_reclaimable_bytes": 41959243776,
      "all_previous_assertion_names_and_multiplicities_preserved": true,
      "original_policy": {
        "startup_reclaimable_bytes": 20112000000,
        "minimum_live_reclaimable_bytes": 3000000000,
        "maximum_owned_rss_bytes": 17112000000,
        "sample_interval_seconds": 0.2,
        "maximum_build_seconds": 1800,
        "stop_on_new_swapouts": false
      },
      "sha256": {
        "attempt.json": "400607f61860a262f5104ee777fe6fead21345fc86022e4281b278c3dd7e1705",
        "receipt.json": "9540e825f4aa4c2775e525e2059560fdf03108b89d9085fb8c83b7b5fe34638a",
        "qualification.json": "7411f29f0ffd8f21b9424d9577e47fadb988698526b249a2fa66c6b678cdabee",
        "memory.json": "9be92e79cb83151babcc41a4c4019d44e242f4539ab3b024c6650c8b9a6e5cd3",
        "memory.samples.jsonl": "a27f20afe2c2a34f6001a4a9adaf03a464cbb39e525f2c79677b230a1bd111b0",
        "stdout.txt": "7c02a1ac8903d1473cdd697e34ad3be4b7530c5a073f79d33dee29b9606b7cba",
        "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      }
    },
    "scope-family-4096": {
      "assertions": 817,
      "started_at": "2026-09-09T10:00:21.513320+00:00",
      "elapsed_seconds": 81.449519584,
      "startup_reclaimable_bytes": 41877405696,
      "all_previous_assertion_names_and_multiplicities_preserved": true,
      "original_policy": {
        "startup_reclaimable_bytes": 20112000000,
        "minimum_live_reclaimable_bytes": 3000000000,
        "maximum_owned_rss_bytes": 17112000000,
        "sample_interval_seconds": 0.2,
        "maximum_build_seconds": 1800,
        "stop_on_new_swapouts": false
      },
      "sha256": {
        "attempt.json": "8ff37c1869f6b52ffcd9452f9d474a4ec873afb90bc7dae43cd888eadb0b1f3e",
        "receipt.json": "2be332206451fe4eae7fe42bcaa8d990a616a4df3d8d19d46e39535b1ffc9777",
        "qualification.json": "b81a0edbd9e0d35320e0031c899bdd5e61cbd2b3b29e6ed62510d97737eddbe9",
        "memory.json": "092d5d1d7611ece64d15b8c11b8fbc477e775de6a8a0dc146b5fa810eafa5f71",
        "memory.samples.jsonl": "92d1265d054c782efcfd6889836fa0b100f039b24e8474500862814150505e18",
        "stdout.txt": "74f4557310de989b4646be90bf741687dfc35cc1744678124bf9389069ce8281",
        "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      }
    },
    "scope-lifecycle": {
      "assertions": 1914,
      "started_at": "2026-09-09T09:49:40.105372+00:00",
      "elapsed_seconds": 371.235655959,
      "startup_reclaimable_bytes": 40866791424,
      "all_previous_assertion_names_and_multiplicities_preserved": true,
      "original_policy": {
        "startup_reclaimable_bytes": 20112000000,
        "minimum_live_reclaimable_bytes": 3000000000,
        "maximum_owned_rss_bytes": 17112000000,
        "sample_interval_seconds": 0.2,
        "maximum_build_seconds": 1800,
        "stop_on_new_swapouts": false
      },
      "sha256": {
        "attempt.json": "26cbde13c6cfe7df960d14c29e7620f3c0500817affcf6ea97390dc84aa22176",
        "receipt.json": "742d945c59756263609a1a1677af1f489169494db304f1ae23c4ec9743f37224",
        "qualification.json": "e9d659cc52a25b312807e1acfb7f9fbd684bbf94bd6a3bcfc0a7d68380f90fd0",
        "memory.json": "96a42aaa22bba220e82f092cef3b201515c7ea3cd2cbf4b0da805801f92d24f4",
        "memory.samples.jsonl": "72b80f43a3d2a1443a516727f060013ff02ec85fef1f7028180c6402b68fafca",
        "stdout.txt": "764d8e8e5cfec3021d70e2fc91720ba17bf1f7cb9b72c40391cf9a94b183bef9",
        "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      }
    },
    "scope-mtp-vision": {
      "assertions": 873,
      "started_at": "2026-09-09T09:56:44.283171+00:00",
      "elapsed_seconds": 174.662728958,
      "startup_reclaimable_bytes": 41941057536,
      "all_previous_assertion_names_and_multiplicities_preserved": true,
      "original_policy": {
        "startup_reclaimable_bytes": 20112000000,
        "minimum_live_reclaimable_bytes": 3000000000,
        "maximum_owned_rss_bytes": 17112000000,
        "sample_interval_seconds": 0.2,
        "maximum_build_seconds": 1800,
        "stop_on_new_swapouts": false
      },
      "sha256": {
        "attempt.json": "2c93f4cba674426bd17206049bc6e2faddbb7d3c65842340379b70e88a1e2325",
        "receipt.json": "c797e3a910ea893450b674caa9b143a1c0ef3dc6cae1510fadfd60414e4f9a38",
        "qualification.json": "a736a419b84d2509506805cf4672abf1a612033b5a30b814e92ec89d083fcd79",
        "memory.json": "951e3367ca056c66999ea047e04638c78d3bdc80a09869cc829db4bfdb6e62ff",
        "memory.samples.jsonl": "ebe7e87de6d4f0b2a194425ae9f0355b196776dabcd6739d18baa03dbbbe2b15",
        "stdout.txt": "f8cc4841050a940ed9dcc269d4d1014908030cd7cecd78801582ea892d3d457a",
        "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      }
    },
    "combined-plain": {
      "assertions": 286,
      "started_at": "2026-09-09T10:06:34.530718+00:00",
      "elapsed_seconds": 218.59326604199998,
      "startup_reclaimable_bytes": 41356197888,
      "all_previous_assertion_names_and_multiplicities_preserved": true,
      "original_policy": {
        "startup_reclaimable_bytes": 13000000000,
        "minimum_live_reclaimable_bytes": 3000000000,
        "maximum_owned_rss_bytes": 10000000000,
        "sample_interval_seconds": 0.2,
        "maximum_build_seconds": 900,
        "stop_on_new_swapouts": false
      },
      "sha256": {
        "attempt.json": "6f6fd59315d0a6f650c533608193e7a1d802fdb1cff1abfa278659174e117839",
        "receipt.json": "26bbb1d7dd3f6778b289d212e6cdec99b1ca21f36f27caaf03ca77d10a016161",
        "qualification.json": "063ceda130f9dd9aed8263a5740546aabe74fef51adfb964c58efe3f10076b80",
        "memory.json": "9b9df980f6c3e06ddf732dd2f423a11194caef810fc09fae13201e5c69e5a667",
        "memory.samples.jsonl": "10d3e56084eb96f77c7298155eaec540fcdb3dbe3d75ff382d05e714f9f4f936",
        "stdout.txt": "afe2e41b91f6f70aac589c539d2b1f80aab639fde4afbf4b12c4e445f7604d41",
        "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
      }
    },
    "combined-mtp": {
      "assertions": 327,
      "started_at": "2026-09-09T10:10:13.382715+00:00",
      "elapsed_seconds": 260.822863625,
      "startup_reclaimable_bytes": 41917267968,
      "all_previous_assertion_names_and_multiplicities_preserved": true,
      "original_policy": {
        "startup_reclaimable_bytes": 13000000000,
        "minimum_live_reclaimable_bytes": 3000000000,
        "maximum_owned_rss_bytes": 10000000000,
        "sample_interval_seconds": 0.2,
        "maximum_build_seconds": 900,
        "stop_on_new_swapouts": false
      },
      "sha256": {
        "attempt.json": "30a1c8732fad84310890d1286e5c19260b713e444fa3f9c8a06a10e0782284df",
        "receipt.json": "08ddbdbfc4462f6a9dd9b08255d967f885e106cbc4fffd38fecd6a2d1d475a67",
        "qualification.json": "451095f4a77cdbe8e4f9e3f91eaee2a80a69cb7df153e2f3efb0dabed78d1f8e",
        "memory.json": "a1bd1f0a01fbcaaee2262abb8326e86bd026a39fcb2823541b377a94c6a350eb",
        "memory.samples.jsonl": "03e52441bee95d2329674dc50d8e59a4951c73f5643bfa318ae595057bfeb9fd",
        "stdout.txt": "529a8a7d1ce7194f35aeaa65fc35480c8a26954c21da20fe0a1f6281715c205e",
        "stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
      }
    },
    "read-failure-serving": {
      "assertions": 522,
      "started_at": "2026-09-09T10:14:34.460323+00:00",
      "elapsed_seconds": 150.23055375,
      "startup_reclaimable_bytes": 41925459968,
      "all_previous_assertion_names_and_multiplicities_preserved": true,
      "original_policy": {
        "startup_reclaimable_bytes": 13000000000,
        "minimum_live_reclaimable_bytes": 3000000000,
        "maximum_owned_rss_bytes": 10000000000,
        "sample_interval_seconds": 0.2,
        "maximum_build_seconds": 900,
        "stop_on_new_swapouts": false
      },
      "sha256": {
        "attempt.json": "2ea8bac96530b7cd331614359c0bc8916b486a3e04cc5f7b868d231075c28c03",
        "receipt.json": "24b0f8bffdb9ac2d51304ac669da2c4f04abb121a26c1185564b8066ad52e36d",
        "qualification.json": "4068134722204b62d1bddb3dff35c950590b1d4ebffdad33f2e19ed783d5081b",
        "memory.json": "95da6b2126b57b996519c4b852bd4253346cf4456d9eec6aa844feeac2c8aa59",
        "memory.samples.jsonl": "9db2d06847cb2192e4073d2056727f85bcfce137ebd2e4794df5fb3bbaef698a",
        "stdout.txt": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
        "stderr.txt": "fcddd13aa70264a634d0711887cefea6ab173ea25561bb65ec6e095ee069c246"
      }
    }
  },
  "total_assertions": 5556,
  "previous_assertions": 5300,
  "new_intermediate_process_and_device_choices": 2,
  "no_remaining_jobs": true,
  "performance_or_default_qualification": false
}

````````````

## Artifact SHA-256 1fe49fb8967248f9c6be9f62c5caa56014c587f1bfd712aaaced6967e04cb871

Encoding: `utf-8`. Original bytes: 2987.

````````````text
"""Verify the seven terminal native proofs without running inference."""
from pathlib import Path
import importlib.util
import json

HERE = Path(__file__).resolve().parent
BASE = Path('/tmp/slotstream-optimization-execution')
spec = importlib.util.spec_from_file_location('current_native', BASE / 'adaptive-scope-native-v496/run.py')
n = importlib.util.module_from_spec(spec)
spec.loader.exec_module(n)
prepared = n.load()
cases = {}
for name in n.NATIVE:
    path = n.OUT / name
    a, r, q, memory, report = [n.c.read(path / f) for f in
                             ['attempt.json', 'receipt.json', 'qualification.json', 'memory.json', 'stdout.txt']]
    assessment = n.assess(name, report)
    assert a['build'] == prepared['build']
    assert a['command'] == prepared['commands'][name]
    assert a['policy'] == prepared['policies'][name]
    assert a['environment'] == prepared['environment'] == {}
    assert a['preparation_sha256'] == n.digest(n.HERE / 'preparation.json')
    for value in [r, q]:
        assert all(value.get(k) is True for k in ['passed', 'completed', 'qualified', 'proofs_unchanged',
                                                 'cleanup_complete', 'within_reservation'])
        assert value['remaining_jobs'] == [] and value['exit_code'] == 0
        assert value.get('error') is None and value.get('cleanup_error') is None
        assert value['assertions'] == assessment['assertions']
        assert value['attempt_sha256'] == n.digest(path / 'attempt.json')
        assert value['stdout_sha256'] == n.digest(path / 'stdout.txt')
    assert q['execution_receipt_sha256'] == n.digest(path / 'receipt.json')
    assert memory['passed'] is True and memory['child_exit_code'] == 0
    assert memory['policy'] == prepared['policies'][name]
    assert memory['remaining_owned_members_after_cleanup'] == []
    cases[name] = {'assertions': assessment['assertions'], 'started_at': a['started_at'],
                   'elapsed_seconds': q['elapsed_seconds'],
                   'startup_reclaimable_bytes': a['before']['reclaimable_bytes'],
                   'all_previous_assertion_names_and_multiplicities_preserved': True,
                   'original_policy': memory['policy'],
                   'sha256': {f: n.digest(path / f) for f in ['attempt.json', 'receipt.json',
                                 'qualification.json', 'memory.json', 'memory.samples.jsonl', 'stdout.txt', 'stderr.txt']}}
assert not n.scope.competing_jobs(), 'current suite must be fully drained before terminal capture'
result = {'passed': True, 'candidate': prepared['build'], 'cases': cases,
          'total_assertions': sum(x['assertions'] for x in cases.values()),
          'previous_assertions': 5300, 'new_intermediate_process_and_device_choices': 2,
          'no_remaining_jobs': True, 'performance_or_default_qualification': False}
n.c.write_new(HERE / 'audit.json', result)
print(json.dumps({k:v for k,v in result.items() if k not in ['candidate','cases']}, indent=2))

````````````

## Artifact SHA-256 64e064461e629c5b7e9c65002355df7e13aae8d0f005b2a5110f3b64cd496cd3

Encoding: `utf-8`. Original bytes: 2952.

````````````text
"""Verify the seven terminal native proofs without running inference."""
from pathlib import Path
import importlib.util
import json

HERE = Path(__file__).resolve().parent
BASE = HERE.parent
spec = importlib.util.spec_from_file_location('current_native', BASE / 'adaptive-scope-native-v496/run.py')
n = importlib.util.module_from_spec(spec)
spec.loader.exec_module(n)
prepared = n.load()
cases = {}
for name in n.NATIVE:
    path = n.OUT / name
    a, r, q, memory, report = [n.c.read(path / f) for f in
                             ['attempt.json', 'receipt.json', 'qualification.json', 'memory.json', 'stdout.txt']]
    assessment = n.assess(name, report)
    assert a['build'] == prepared['build']
    assert a['command'] == prepared['commands'][name]
    assert a['policy'] == prepared['policies'][name]
    assert a['environment'] == prepared['environment'] == {}
    assert a['preparation_sha256'] == n.digest(n.HERE / 'preparation.json')
    for value in [r, q]:
        assert all(value.get(k) is True for k in ['passed', 'completed', 'qualified', 'proofs_unchanged',
                                                 'cleanup_complete', 'within_reservation'])
        assert value['remaining_jobs'] == [] and value['exit_code'] == 0
        assert value.get('error') is None and value.get('cleanup_error') is None
        assert value['assertions'] == assessment['assertions']
        assert value['attempt_sha256'] == n.digest(path / 'attempt.json')
        assert value['stdout_sha256'] == n.digest(path / 'stdout.txt')
    assert q['execution_receipt_sha256'] == n.digest(path / 'receipt.json')
    assert memory['passed'] is True and memory['child_exit_code'] == 0
    assert memory['policy'] == prepared['policies'][name]
    assert memory['remaining_owned_members_after_cleanup'] == []
    cases[name] = {'assertions': assessment['assertions'], 'started_at': a['started_at'],
                   'elapsed_seconds': q['elapsed_seconds'],
                   'startup_reclaimable_bytes': a['before']['reclaimable_bytes'],
                   'all_previous_assertion_names_and_multiplicities_preserved': True,
                   'original_policy': memory['policy'],
                   'sha256': {f: n.digest(path / f) for f in ['attempt.json', 'receipt.json',
                                 'qualification.json', 'memory.json', 'memory.samples.jsonl', 'stdout.txt', 'stderr.txt']}}
assert not n.scope.competing_jobs(), 'current suite must be fully drained before terminal capture'
result = {'passed': True, 'candidate': prepared['build'], 'cases': cases,
          'total_assertions': sum(x['assertions'] for x in cases.values()),
          'previous_assertions': 5300, 'new_intermediate_process_and_device_choices': 2,
          'no_remaining_jobs': True, 'performance_or_default_qualification': False}
n.c.write_new(HERE / 'audit.json', result)
print(json.dumps({k:v for k,v in result.items() if k not in ['candidate','cases']}, indent=2))

````````````
