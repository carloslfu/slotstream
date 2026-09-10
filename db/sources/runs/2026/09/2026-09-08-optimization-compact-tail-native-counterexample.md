---
type: run
id: 01m20jkad0hz7f3d0v3ekbmch4
created: 2026-09-08T13:16:26.400297+00:00
updated: 2026-09-08T13:16:26.820265+00:00
summary: Full native qualification rejects the bounded MTP tail while ordinary and recovery pass
binary: V349 7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6
captured_at: 2026-09-08
command: Fresh V358 ordinary native; originally unrun V350 MTP and recovery, each under explicit serial native intervals with the unchanged 900-second work and 30-second cleanup reserve.
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Full native qualification rejects the bounded MTP tail while ordinary and recovery pass
tool: Slotstream exact native and source qualification capture
---
After the user resumed and resources changed, the V358 ordinary-native identity passed all 286 assertions in 236.689097375 seconds on exact V349. The prior interrupted V350 ordinary identity remains unchanged. The additional 22.2 GB admission screen did not change any original live guard, case, source, assertion or workload. Readiness refusals before an attempt did not allocate a model.

The originally unrun V350 MTP command then completed a full 327-assertion report in 295.870369875 seconds, with six failures. Four eight-output requests differ only at the last token: cached17, boundary256, long1025 and image-before. The candidate two-output request returns [33, 461], whereas its longer greedy prefix and independent reference both start [33, 428]. The command exits 1 and remains unqualified. This is an actual native assertion failure, not a guard interruption or reporter exception. All original output and failed qualification bytes are retained. Both caches' format/payload checks, committed-state hashes, sampled output/work replay and other lifecycle assertions pass; they do not override the failed exact-output contract.

The originally unrun recovery command separately passes all 522 assertions in 172.009107208 seconds. It covers every original generate/chat/OpenAI/Gateway response shape, queued output and prompt-checkpoint combinations. Passing recovery does not qualify the failed MTP composition.

All three runs retain unchanged build/source proofs, finish within their granted intervals and complete cleanup. Independent process-group checks and the next launch's exclusive model lock prevent overlap. No new swap-outs occur in these intervals; they are correctness tests, not paired speed or memory-reduction measurements. Sampled maximum owned RSS is 4,985,405,440 bytes for ordinary, 6,122,455,040 for MTP and 3,833,315,328 for recovery. Minimum sampled reclaimable memory is 15,201,140,736, 20,761,542,656 and 20,829,061,120 bytes respectively. Chrome and all user apps remain open. No installed binary or default is activated.

The direct source hypothesis is that boundedDraftTail changes final target verification from two positions to one, changing numerical dispatch; greedy selection does not guarantee immunity. The prospective V359 correction removes this experiment from the combined candidate, keeps compact BF16 cache rows, and preserves the exact-output assertions. Its new build and complete native rerun remain separate required evidence. The prior V343 two-output fixture's gains stay attached only to that isolated successful study; they cannot justify deploying the failed broader composition.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-mtp/attempt.json",
    "bytes": 22940,
    "sha256": "ba8ac326891ca46979d3adede7180605f97a102b52f839f89364299165435f66"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-mtp/memory.json",
    "bytes": 278697,
    "sha256": "c3a6ee40aa0e4dc734e7e3df7c21853663ac8903437343081ed03c0dac25a109"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-mtp/memory.samples.jsonl",
    "bytes": 212467,
    "sha256": "1799c00f46e102f0ee31070b6d95f1a5e4f4e44d17d648e449c903246bf4bbd1"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-mtp/qualification.json",
    "bytes": 2579,
    "sha256": "e921d999d9a52cbb93c245ddb7981668018cf496d4f49744f2e01441eb85afd8"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-mtp/receipt.json",
    "bytes": 2481,
    "sha256": "98be38f61ac3006d6de7bf7eae300ef78b002e8600594901ca276d9d6b10234b"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-mtp/stderr.txt",
    "bytes": 486,
    "sha256": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-mtp/stdout.txt",
    "bytes": 34091,
    "sha256": "5cba162a2508534c86a128523dee1a41a89d1b9b0bdb8e321a5dcc1e2d0acb7c"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/read-failure-serving/attempt.json",
    "bytes": 22946,
    "sha256": "f05873160c341266dd799972856f172f0235db7117e0710943fb78bb4a1bf801"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/read-failure-serving/memory.json",
    "bytes": 169685,
    "sha256": "8d2822c3c24435070cf11bd3acfefa6a62cfd84c77e2db26a2a4a7c0f68ae6ea"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/read-failure-serving/memory.samples.jsonl",
    "bytes": 127049,
    "sha256": "aab50f203536da43099b2d196789785ea1faa1747b136b4b1033f42959b7ebbd"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/read-failure-serving/qualification.json",
    "bytes": 2544,
    "sha256": "63ce8b33a9c5ae7f6d2e38d9aa9fd7400be5ae7e7e013d1384736774a62e2b36"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/read-failure-serving/receipt.json",
    "bytes": 2446,
    "sha256": "73757ed551b0b18b5a9680cf7831dd82296e066054f854eb4f0b7406aef8b351"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/read-failure-serving/stderr.txt",
    "bytes": 1739,
    "sha256": "d2808dd2d90c5b07cb5d5ead3d1c63d4926802d0b0560e7d735779d02fa20f27"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/read-failure-serving/stdout.txt",
    "bytes": 69148,
    "sha256": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v358/combined-plain/attempt.json",
    "bytes": 23198,
    "sha256": "9552ad9cd0f2c1ab3fb500388476eb211942e92e8d6b2cee90400eaf11aec357"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v358/combined-plain/memory.json",
    "bytes": 231402,
    "sha256": "423312d8e9596ca7c1a6d826ee8902727498873209b104a78278a7d47e8ca8cc"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v358/combined-plain/memory.samples.jsonl",
    "bytes": 175260,
    "sha256": "5566024d790ed2c85622742188ca528410e1b3afa72c99a81641cecdf601e840"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v358/combined-plain/qualification.json",
    "bytes": 2549,
    "sha256": "3edc17259300c8dadddff41efe1063320784bd2ddde59bba59ba8c369341eb97"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v358/combined-plain/receipt.json",
    "bytes": 2451,
    "sha256": "1ff14dd59b1a6075ee6db2eed4eb08ef6d346506c01b9c6d90f11398c48c8572"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v358/combined-plain/stderr.txt",
    "bytes": 486,
    "sha256": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v358/combined-plain/stdout.txt",
    "bytes": 29438,
    "sha256": "9e8cdf0be9fd30fc0689791ff3e77362789b5c83c9c6171c06548d51eb634b0b"
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
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/admission-after-first-refusal.json",
    "bytes": 2627,
    "sha256": "bc2c95df3aad9353b0da5778d57f75dfe9d7c31094149eb7b7bed5f059cdd751"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/admission-combined-mtp.json",
    "bytes": 2872,
    "sha256": "4d584ba64b3a3061332555ca252a00c45b566af6b2e4252698b0a21e4f962eea"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/admission-read-failure-serving.json",
    "bytes": 2888,
    "sha256": "0d9f8049cdb53c81ef3fb820b6c3908fc4195fda8ab2cb49afabbfd98c6c9a09"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/derived-results.json",
    "bytes": 3189,
    "sha256": "df88c169965f90e27a118c8dcf32ee3fdbe641d28e04db0299dcba226e137850"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/independent-mtp-cleanup.json",
    "bytes": 342,
    "sha256": "9c9576781cc203d47f7b53db8d0a4699c2af0e42f9360dace1b3a6e0a1c5d972"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/independent-ordinary-cleanup.json",
    "bytes": 2493,
    "sha256": "bdffa5c1f9ebb71f01306a70ac69f5b7fa1e32c4a7de9d988654af00d7c5873e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/independent-recovery-cleanup.json",
    "bytes": 2623,
    "sha256": "82b29479a03cb8944ceba91c08ccfbe808356ff6d2aa724f007b52e4b2f18d99"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/launch-2.stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/launch-2.stdout.txt",
    "bytes": 526,
    "sha256": "d3736e3b089275ef3ab7b9e271a01de79214ae110c3894be5a3974653aa6c829"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/preparation-validation.json",
    "bytes": 629,
    "sha256": "a86c28cb04f576d8db9fc009ec48c0ef869793776e97c08556ed966a3249f466"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/preparation.json",
    "bytes": 24180,
    "sha256": "419a181b22d72a055f4e6ccad8e9a5b47af6cc4e527c58f29eda91e3f404e859"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/remaining-combined-mtp.stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/remaining-combined-mtp.stdout.txt",
    "bytes": 556,
    "sha256": "3da11a1c92168a47a9a1165c6238f3e6557ecbc90bb9b90a99ed555f1aef562b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/remaining-read-failure-serving.stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/remaining-read-failure-serving.stdout.txt",
    "bytes": 521,
    "sha256": "ef7416a03d7c124a52a339f59f69cd23596f276ba28d6af68fa495d8e28c856b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/run-remaining.py",
    "bytes": 1859,
    "sha256": "98646f27ff0550ce6ff33635a620f286aa569c4a5af22173ad3585e7bb004e9c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-tail-native-v358/run.py",
    "bytes": 8081,
    "sha256": "79a455c5ca07f5d87a30eefadcaafda88298b452a0a07ae507686d70f4da77b5"
  }
]
```

## Artifact SHA-256 ba8ac326891ca46979d3adede7180605f97a102b52f839f89364299165435f66

Encoding: `utf-8`. Original bytes: 22940.

````````````text
{
  "started_at": "2026-09-08T12:57:33.409746+00:00",
  "deadline_utc": "2026-09-08T13:15:00Z",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated-mtp",
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
    "reclaimable_bytes": 28839936000,
    "swapins": 44222115,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   344623.\nPages active:                                 935382.\nPages inactive:                               743115.\nPages speculative:                            195347.\nPages throttled:                                   0.\nPages wired down:                             256683.\nPages purgeable:                                5140.\n\"Translation faults\":                    17010921366.\nPages copy-on-write:                       886009815.\nPages zero filled:                       22805935864.\nPages reactivated:                        3741674415.\nPages purged:                               79671010.\nFile-backed pages:                           1410487.\nAnonymous pages:                              463357.\nPages stored in compressor:                  1323249.\nPages occupied by compressor:                 608301.\nDecompressions:                           1280881427.\nCompressions:                             1604899461.\nPageins:                                  8074535967.\nPageouts:                                   11395711.\nSwapins:                                    44222115.\nSwapouts:                                   77578301.\nPages tagged:                                 169941.\nPages tagged resident:                        122701.\nPages tagged compressed:                       47240.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6924.\nPages tag-storage free:                         2122.\nPages tag-storage non-tag pageable:            89250.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7659968.\nTagged compressions:                        12491699.\nTagged decompressions:                      11530944.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-08T12:57:33.409627+00:00",
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

## Artifact SHA-256 c3a6ee40aa0e4dc734e7e3df7c21853663ac8903437343081ed03c0dac25a109

Encoding: `gzip+base64`. Original bytes: 278697.

````````````text
H4sIAAAAAAAC/9S9W892x5Eddp9fIegqAayt7q5jz10OyJ0BA3ZyEwcCRX0zQ5siFZKa8djIf89a+yMlPZTm6e23d20gnAMg8T2tp7urVp1W/bf/4Re/+OWX3/7+919887tf/t0v/i/8R/wXv/4/vv/03fe//vKL777+9vtf/7vvvv1Pn7784ftff//1tz98/8N3n774/a+P3/7xq69/9+tv//DDV7//6r9+8cNX337za/yYP3zx5Q+/+uGLr77+Ff7Db7/65tPvfnV+4a/+SXTi533zu69+98UPn/7iJ/3y33z+lX/5k371/Q/4ol99+Y+fvvzPP/37X/3qn7747qsvvvnhp//iq29++PQP3+Hrfver3//whz9/2e+//d2nr3/6j69Ajr8AcH7Z97/+f/750zeSv/r7r7/4/h9/9c2n//LDr37/9X/5lf72qx/+/BP/0/fffvNL/If/m//NL//w7ddfffkv+Kz+2+d/j7/1ux/++IfffPfpy6+/+Or3X/z260+/+e2//PDpe3xJl/bTPz/+tN9/9c1Xv//j73/z9Vf/9Olvfstff8cX/+X8jm//GZ/mb777/vs///T286/9/ovf/wE/ix/Nd//0xde/+f7Tl99+8zt+bTvGz37eeS5/8RXzzz/lh2//8Jtvv/nNN5/++Tff//MXf/j2jz/wC/7+i6+//4Sv+H/Pj+G3n/7+2+8+/flj+MMX//AXuF1Sf/xpfwvkyNRmOkbLn34nfs9X3/DfKf7r0bv9xb/48Q+IsEhp/acf/MU/47/85b/94st//MX/+RXO4Iuvf/FvP/3+2+/+5Rf/Hvfnq+9/+OrL7//uF/8j/7JffP/Vf/30i2///vNf9ovz7/if/uM3/w7/6vtf/P13nz793S/W/4iqWx4/fRuuOg5x/Y1TTKb86du++ubaN4ZK7/NP3/b9Hz59+cevv1h+Z58man/6th/+8btvf/jh60+/uwKw/enb/vmr7z797he/w517/33D3PPPv+0Pf/zuHz7xpJe/zbryt/3HX/6H77745vuvz2ePG/bHr3/4/j/+8m9+d4/W28SVkT9/KF9++4d/+RXsxT9/99UP/+rvzPTW5vQ/o/uvn7779hd//9XXbz6WMbIZTm6OP6OD3eDJ0eT8q/gktHuo9p99KMvPP6ZHB0J82//+1deffvXbL778zzgCXt7v331v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
````````````

## Artifact SHA-256 1799c00f46e102f0ee31070b6d95f1a5e4f4e44d17d648e449c903246bf4bbd1

Encoding: `gzip+base64`. Original bytes: 212467.

````````````text
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
````````````

## Artifact SHA-256 e921d999d9a52cbb93c245ddb7981668018cf496d4f49744f2e01441eb85afd8

Encoding: `utf-8`. Original bytes: 2579.

````````````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "ba8ac326891ca46979d3adede7180605f97a102b52f839f89364299165435f66",
  "exit_code": 1,
  "error": "ValueError: native process failed",
  "elapsed_seconds": 295.87036987500005,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31351144448,
    "swapins": 44222115,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   574516.\nPages active:                                 796514.\nPages inactive:                               631121.\nPages speculative:                            172097.\nPages throttled:                                   0.\nPages wired down:                             246813.\nPages purgeable:                                 202.\n\"Translation faults\":                    17016381422.\nPages copy-on-write:                       886614176.\nPages zero filled:                       22854470790.\nPages reactivated:                        3745437752.\nPages purged:                               79780472.\nFile-backed pages:                           1338804.\nAnonymous pages:                              260928.\nPages stored in compressor:                  1465038.\nPages occupied by compressor:                 663065.\nDecompressions:                           1282237264.\nCompressions:                             1606561324.\nPageins:                                  8077261924.\nPageouts:                                   11396446.\nSwapins:                                    44222115.\nSwapouts:                                   77578301.\nPages tagged:                                 166047.\nPages tagged resident:                        111953.\nPages tagged compressed:                       54094.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6902.\nPages tag-storage free:                         1660.\nPages tag-storage non-tag pageable:            89734.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9182912.\nTagged compressions:                        12511577.\nTagged decompressions:                      11543669.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "5cba162a2508534c86a128523dee1a41a89d1b9b0bdb8e321a5dcc1e2d0acb7c",
  "execution_receipt_sha256": "98be38f61ac3006d6de7bf7eae300ef78b002e8600594901ca276d9d6b10234b"
}

````````````

## Artifact SHA-256 98be38f61ac3006d6de7bf7eae300ef78b002e8600594901ca276d9d6b10234b

Encoding: `utf-8`. Original bytes: 2481.

````````````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "ba8ac326891ca46979d3adede7180605f97a102b52f839f89364299165435f66",
  "exit_code": 1,
  "error": "ValueError: native process failed",
  "elapsed_seconds": 295.87036987500005,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31351144448,
    "swapins": 44222115,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   574516.\nPages active:                                 796514.\nPages inactive:                               631121.\nPages speculative:                            172097.\nPages throttled:                                   0.\nPages wired down:                             246813.\nPages purgeable:                                 202.\n\"Translation faults\":                    17016381422.\nPages copy-on-write:                       886614176.\nPages zero filled:                       22854470790.\nPages reactivated:                        3745437752.\nPages purged:                               79780472.\nFile-backed pages:                           1338804.\nAnonymous pages:                              260928.\nPages stored in compressor:                  1465038.\nPages occupied by compressor:                 663065.\nDecompressions:                           1282237264.\nCompressions:                             1606561324.\nPageins:                                  8077261924.\nPageouts:                                   11396446.\nSwapins:                                    44222115.\nSwapouts:                                   77578301.\nPages tagged:                                 166047.\nPages tagged resident:                        111953.\nPages tagged compressed:                       54094.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6902.\nPages tag-storage free:                         1660.\nPages tag-storage non-tag pageable:            89734.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9182912.\nTagged compressions:                        12511577.\nTagged decompressions:                      11543669.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "5cba162a2508534c86a128523dee1a41a89d1b9b0bdb8e321a5dcc1e2d0acb7c"
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

## Artifact SHA-256 5cba162a2508534c86a128523dee1a41a89d1b9b0bdb8e321a5dcc1e2d0acb7c

Encoding: `utf-8`. Original bytes: 34091.

````````````text
{
  "items" : [
    {
      "name" : "false: embedding selection",
      "passed" : true
    },
    {
      "name" : "false: bounded greedy tail selection",
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
      "name" : "true: bounded greedy tail selection",
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
      "detail" : "got [33, 428, 329, 271, 487, 1006, 271, 487], want [33, 428, 329, 271, 487, 1006, 271, 13]",
      "name" : "cached17: exact complete greedy IDs",
      "passed" : false
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
      "detail" : "got [5513, 271, 510, 271, 248045, 271, 248044, 4876], want [5513, 271, 510, 271, 248045, 271, 248044, 871]",
      "name" : "boundary256: exact complete greedy IDs",
      "passed" : false
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
      "detail" : "got [2541, 261, 656, 258, 6, 198, 220, 248046], want [2541, 261, 656, 258, 6, 198, 220, 220]",
      "name" : "long1025: exact complete greedy IDs",
      "passed" : false
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
      "detail" : "got [5513, 12, 248044, 320, 2793, 25, 2212, 14905], want [5513, 12, 248044, 320, 2793, 25, 2212, 21227]",
      "name" : "image-before: exact complete greedy IDs",
      "passed" : false
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
      "detail" : "got [33, 461], want [33, 428]",
      "name" : "true: bounded output preserves the longer greedy prefix",
      "passed" : false
    },
    {
      "detail" : "got [33, 461], want [33, 428]",
      "name" : "two-token MTP integrated output matches reference",
      "passed" : false
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
    "true.fused_rotations_scheduled" : 5222
  },
  "name" : "optimization-integrated-mtp",
  "passed" : false
}

````````````

## Artifact SHA-256 f05873160c341266dd799972856f172f0235db7117e0710943fb78bb4a1bf801

Encoding: `utf-8`. Original bytes: 22946.

````````````text
{
  "started_at": "2026-09-08T13:08:51.066286+00:00",
  "deadline_utc": "2026-09-08T13:35:00Z",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-combined-build-v349/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "read-failure-serving",
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
    "reclaimable_bytes": 29926834176,
    "swapins": 44222262,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   469098.\nPages active:                                 897571.\nPages inactive:                               681258.\nPages speculative:                            219408.\nPages throttled:                                   0.\nPages wired down:                             245994.\nPages purgeable:                               11022.\n\"Translation faults\":                    17018080766.\nPages copy-on-write:                       886765103.\nPages zero filled:                       22855832057.\nPages reactivated:                        3745440107.\nPages purged:                               79782916.\nFile-backed pages:                           1346469.\nAnonymous pages:                              451768.\nPages stored in compressor:                  1277090.\nPages occupied by compressor:                 568711.\nDecompressions:                           1282415962.\nCompressions:                             1606561324.\nPageins:                                  8077265949.\nPageouts:                                   11396446.\nSwapins:                                    44222262.\nSwapouts:                                   77578301.\nPages tagged:                                 167157.\nPages tagged resident:                        122483.\nPages tagged compressed:                       44674.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6902.\nPages tag-storage free:                         3388.\nPages tag-storage non-tag pageable:            88006.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7223232.\nTagged compressions:                        12511577.\nTagged decompressions:                      11553027.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-08T13:08:51.066166+00:00",
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

## Artifact SHA-256 8d2822c3c24435070cf11bd3acfefa6a62cfd84c77e2db26a2a4a7c0f68ae6ea

Encoding: `gzip+base64`. Original bytes: 169685.

````````````text
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
````````````

## Artifact SHA-256 aab50f203536da43099b2d196789785ea1faa1747b136b4b1033f42959b7ebbd

Encoding: `gzip+base64`. Original bytes: 127049.

````````````text
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
````````````

## Artifact SHA-256 63ce8b33a9c5ae7f6d2e38d9aa9fd7400be5ae7e7e013d1384736774a62e2b36

Encoding: `utf-8`. Original bytes: 2544.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "f05873160c341266dd799972856f172f0235db7117e0710943fb78bb4a1bf801",
  "exit_code": 0,
  "assertions": 522,
  "elapsed_seconds": 172.009107208,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27060338688,
    "swapins": 44222282,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   369996.\nPages active:                                 972945.\nPages inactive:                               886178.\nPages speculative:                             85080.\nPages throttled:                                   0.\nPages wired down:                             240753.\nPages purgeable:                               15706.\n\"Translation faults\":                    17021788752.\nPages copy-on-write:                       887187869.\nPages zero filled:                       22858252590.\nPages reactivated:                        3745515755.\nPages purged:                               79801699.\nFile-backed pages:                           1265930.\nAnonymous pages:                              678273.\nPages stored in compressor:                  1199685.\nPages occupied by compressor:                 528478.\nDecompressions:                           1282489732.\nCompressions:                             1606561324.\nPageins:                                  8077324479.\nPageouts:                                   11396465.\nSwapins:                                    44222282.\nSwapouts:                                   77578301.\nPages tagged:                                 167408.\nPages tagged resident:                        125143.\nPages tagged compressed:                       42265.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6902.\nPages tag-storage free:                         2217.\nPages tag-storage non-tag pageable:            89177.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6902144.\nTagged compressions:                        12511577.\nTagged decompressions:                      11555171.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
  "execution_receipt_sha256": "73757ed551b0b18b5a9680cf7831dd82296e066054f854eb4f0b7406aef8b351"
}

````````````

## Artifact SHA-256 73757ed551b0b18b5a9680cf7831dd82296e066054f854eb4f0b7406aef8b351

Encoding: `utf-8`. Original bytes: 2446.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "f05873160c341266dd799972856f172f0235db7117e0710943fb78bb4a1bf801",
  "exit_code": 0,
  "assertions": 522,
  "elapsed_seconds": 172.009107208,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27060338688,
    "swapins": 44222282,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   369996.\nPages active:                                 972945.\nPages inactive:                               886178.\nPages speculative:                             85080.\nPages throttled:                                   0.\nPages wired down:                             240753.\nPages purgeable:                               15706.\n\"Translation faults\":                    17021788752.\nPages copy-on-write:                       887187869.\nPages zero filled:                       22858252590.\nPages reactivated:                        3745515755.\nPages purged:                               79801699.\nFile-backed pages:                           1265930.\nAnonymous pages:                              678273.\nPages stored in compressor:                  1199685.\nPages occupied by compressor:                 528478.\nDecompressions:                           1282489732.\nCompressions:                             1606561324.\nPageins:                                  8077324479.\nPageouts:                                   11396465.\nSwapins:                                    44222282.\nSwapouts:                                   77578301.\nPages tagged:                                 167408.\nPages tagged resident:                        125143.\nPages tagged compressed:                       42265.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6902.\nPages tag-storage free:                         2217.\nPages tag-storage non-tag pageable:            89177.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6902144.\nTagged compressions:                        12511577.\nTagged decompressions:                      11555171.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127"
}

````````````

## Artifact SHA-256 d2808dd2d90c5b07cb5d5ead3d1c63d4926802d0b0560e7d735779d02fa20f27

Encoding: `utf-8`. Original bytes: 1739.

````````````text
engine ready in 0.7s: expert cache ~13/512 per layer (640 global slots = 1.8 GB), eos [248044, 248046]
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

## Artifact SHA-256 9552ad9cd0f2c1ab3fb500388476eb211942e92e8d6b2cee90400eaf11aec357

Encoding: `utf-8`. Original bytes: 23198.

````````````text
{
  "started_at": "2026-09-08T12:51:22.787268+00:00",
  "deadline_utc": "2026-09-08T13:15:00Z",
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
    "reclaimable_bytes": 22341500928,
    "swapins": 44222111,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   814710.\nPages active:                                 810568.\nPages inactive:                               778572.\nPages speculative:                             38342.\nPages throttled:                                   0.\nPages wired down:                             266237.\nPages purgeable:                               23421.\n\"Translation faults\":                    17005240387.\nPages copy-on-write:                       885376478.\nPages zero filled:                       22759939670.\nPages reactivated:                        3738226924.\nPages purged:                               79535996.\nFile-backed pages:                            525486.\nAnonymous pages:                             1101996.\nPages stored in compressor:                   867845.\nPages occupied by compressor:                 365124.\nDecompressions:                           1280406763.\nCompressions:                             1603861853.\nPageins:                                  8071704165.\nPageouts:                                   11395130.\nSwapins:                                    44222111.\nSwapouts:                                   77578301.\nPages tagged:                                 191866.\nPages tagged resident:                        160672.\nPages tagged compressed:                       31194.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6976.\nPages tag-storage free:                        12039.\nPages tag-storage non-tag pageable:            79281.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5001728.\nTagged compressions:                        12460433.\nTagged decompressions:                      11516061.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-08T12:51:22.787154+00:00",
    "conditions": {
      "thermalState": "nominal",
      "lowPowerModeEnabled": false
    },
    "ready": true,
    "scope": "One pre-launch policy observation; all original request and qualification gates remain required."
  },
  "additional_native_readiness_bytes": 22200000000,
  "policy": {
    "startup_reclaimable_bytes": 13000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 10000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 900,
    "stop_on_new_swapouts": false
  },
  "preparation_sha256": "419a181b22d72a055f4e6ccad8e9a5b47af6cc4e527c58f29eda91e3f404e859",
  "classification": "Prospective V358 ordinary-native attempt after the user resumed and available memory rose from 15.5 GB to above the additional 22.2 GB readiness screen. V350 ordinary interruption stays immutable. The exact V349 binary, complete ordinary cases, all original and new assertions, original 900-second work plus 30-second cleanup allowance, and original live policy remain unchanged. Only admission is more conservative. Existing V350 MTP and recovery identities remain separate and unrun. Fresh explicit peer grant required before launch; no benchmark, build, activation or app closure."
}

````````````

## Artifact SHA-256 423312d8e9596ca7c1a6d826ee8902727498873209b104a78278a7d47e8ca8cc

Encoding: `gzip+base64`. Original bytes: 231402.

````````````text
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
````````````

## Artifact SHA-256 5566024d790ed2c85622742188ca528410e1b3afa72c99a81641cecdf601e840

Encoding: `gzip+base64`. Original bytes: 175260.

````````````text
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
````````````

## Artifact SHA-256 3edc17259300c8dadddff41efe1063320784bd2ddde59bba59ba8c369341eb97

Encoding: `utf-8`. Original bytes: 2549.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "9552ad9cd0f2c1ab3fb500388476eb211942e92e8d6b2cee90400eaf11aec357",
  "exit_code": 0,
  "assertions": 286,
  "elapsed_seconds": 236.68909737500002,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30933106688,
    "swapins": 44222111,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   477666.\nPages active:                                 858525.\nPages inactive:                               680725.\nPages speculative:                            176881.\nPages throttled:                                   0.\nPages wired down:                             242589.\nPages purgeable:                                8427.\n\"Translation faults\":                    17010075007.\nPages copy-on-write:                       885964266.\nPages zero filled:                       22805267062.\nPages reactivated:                        3741673311.\nPages purged:                               79669599.\nFile-backed pages:                           1401914.\nAnonymous pages:                              314217.\nPages stored in compressor:                  1406981.\nPages occupied by compressor:                 645691.\nDecompressions:                           1280804156.\nCompressions:                             1604899461.\nPageins:                                  8074531496.\nPageouts:                                   11395711.\nSwapins:                                    44222111.\nSwapouts:                                   77578301.\nPages tagged:                                 169974.\nPages tagged resident:                        120659.\nPages tagged compressed:                       49315.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6924.\nPages tag-storage free:                         3493.\nPages tag-storage non-tag pageable:            87879.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8079232.\nTagged compressions:                        12491699.\nTagged decompressions:                      11528901.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "9e8cdf0be9fd30fc0689791ff3e77362789b5c83c9c6171c06548d51eb634b0b",
  "execution_receipt_sha256": "1ff14dd59b1a6075ee6db2eed4eb08ef6d346506c01b9c6d90f11398c48c8572"
}

````````````

## Artifact SHA-256 1ff14dd59b1a6075ee6db2eed4eb08ef6d346506c01b9c6d90f11398c48c8572

Encoding: `utf-8`. Original bytes: 2451.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "9552ad9cd0f2c1ab3fb500388476eb211942e92e8d6b2cee90400eaf11aec357",
  "exit_code": 0,
  "assertions": 286,
  "elapsed_seconds": 236.68909737500002,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30933106688,
    "swapins": 44222111,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   477666.\nPages active:                                 858525.\nPages inactive:                               680725.\nPages speculative:                            176881.\nPages throttled:                                   0.\nPages wired down:                             242589.\nPages purgeable:                                8427.\n\"Translation faults\":                    17010075007.\nPages copy-on-write:                       885964266.\nPages zero filled:                       22805267062.\nPages reactivated:                        3741673311.\nPages purged:                               79669599.\nFile-backed pages:                           1401914.\nAnonymous pages:                              314217.\nPages stored in compressor:                  1406981.\nPages occupied by compressor:                 645691.\nDecompressions:                           1280804156.\nCompressions:                             1604899461.\nPageins:                                  8074531496.\nPageouts:                                   11395711.\nSwapins:                                    44222111.\nSwapouts:                                   77578301.\nPages tagged:                                 169974.\nPages tagged resident:                        120659.\nPages tagged compressed:                       49315.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6924.\nPages tag-storage free:                         3493.\nPages tag-storage non-tag pageable:            87879.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8079232.\nTagged compressions:                        12491699.\nTagged decompressions:                      11528901.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "9e8cdf0be9fd30fc0689791ff3e77362789b5c83c9c6171c06548d51eb634b0b"
}

````````````

## Artifact SHA-256 9e8cdf0be9fd30fc0689791ff3e77362789b5c83c9c6171c06548d51eb634b0b

Encoding: `utf-8`. Original bytes: 29438.

````````````text
{
  "items" : [
    {
      "name" : "false: embedding selection",
      "passed" : true
    },
    {
      "name" : "false: bounded greedy tail selection",
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
      "name" : "true: bounded greedy tail selection",
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

## Artifact SHA-256 bc2c95df3aad9353b0da5778d57f75dfe9d7c31094149eb7b7bed5f059cdd751

Encoding: `utf-8`. Original bytes: 2627.

````````````text
{
  "at": "2026-09-08T12:50:17.676010+00:00",
  "vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 22165700608,
    "swapins": 44222111,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   798485.\nPages active:                                 815077.\nPages inactive:                               775431.\nPages speculative:                             38294.\nPages throttled:                                   0.\nPages wired down:                             281056.\nPages purgeable:                               28823.\n\"Translation faults\":                    17004706229.\nPages copy-on-write:                       885285463.\nPages zero filled:                       22759622813.\nPages reactivated:                        3738226499.\nPages purged:                               79535228.\nFile-backed pages:                            525579.\nAnonymous pages:                             1103223.\nPages stored in compressor:                   868218.\nPages occupied by compressor:                 365421.\nDecompressions:                           1280406387.\nCompressions:                             1603861853.\nPageins:                                  8071703360.\nPageouts:                                   11395130.\nSwapins:                                    44222111.\nSwapouts:                                   77578301.\nPages tagged:                                 191952.\nPages tagged resident:                        160758.\nPages tagged compressed:                       31194.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6976.\nPages tag-storage free:                        11914.\nPages tag-storage non-tag pageable:            79404.\nPages tag-storage non-tag wired:                  10.\nBytes of compressed tags:                    5001728.\nTagged compressions:                        12460433.\nTagged decompressions:                      11516061.\n"
  },
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
  "competing_jobs": [],
  "grant_deadline_utc": "2026-09-08T13:15:00Z",
  "original_V350_ordinary_still_failed": true,
  "V358_attempt_claimed": false,
  "additional_readiness_met": false,
  "prior_admission_result": "First V358 launch command refused before attempt creation: InsufficientHeadroom, 20.07 GB reclaimable versus 22.20 GB required. No model launched."
}

````````````

## Artifact SHA-256 4d584ba64b3a3061332555ca252a00c45b566af6b2e4252698b0a21e4f962eea

Encoding: `utf-8`. Original bytes: 2872.

````````````text
{
  "at": "2026-09-08T12:57:33.273414+00:00",
  "original_unrun_identity": "V350/combined-mtp",
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/tmp/slotstream-optimization-execution/compact-tail-native-v350/run.py",
    "native",
    "--name",
    "combined-mtp",
    "--deadline",
    "2026-09-08T13:15:00Z"
  ],
  "additional_readiness_bytes": 22200000000,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28856745984,
    "swapins": 44222115,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   345710.\nPages active:                                 934246.\nPages inactive:                               743115.\nPages speculative:                            195299.\nPages throttled:                                   0.\nPages wired down:                             256668.\nPages purgeable:                                5140.\n\"Translation faults\":                    17010914324.\nPages copy-on-write:                       886008908.\nPages zero filled:                       22805932180.\nPages reactivated:                        3741674415.\nPages purged:                               79671010.\nFile-backed pages:                           1410426.\nAnonymous pages:                              462234.\nPages stored in compressor:                  1323250.\nPages occupied by compressor:                 608301.\nDecompressions:                           1280881426.\nCompressions:                             1604899461.\nPageins:                                  8074535943.\nPageouts:                                   11395711.\nSwapins:                                    44222115.\nSwapouts:                                   77578301.\nPages tagged:                                 169917.\nPages tagged resident:                        122677.\nPages tagged compressed:                       47240.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6924.\nPages tag-storage free:                         2123.\nPages tag-storage non-tag pageable:            89249.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7659968.\nTagged compressions:                        12491699.\nTagged decompressions:                      11530944.\n"
  },
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
  "deadline_utc": "2026-09-08T13:15:00Z",
  "classification": "Additional conservative admission immediately before the unchanged original, unrun V350 native command. All original source, cases, assertions, model controls, work allowance and live guards remain."
}
````````````

## Artifact SHA-256 0d9f8049cdb53c81ef3fb820b6c3908fc4195fda8ab2cb49afabbfd98c6c9a09

Encoding: `utf-8`. Original bytes: 2888.

````````````text
{
  "at": "2026-09-08T13:08:50.931104+00:00",
  "original_unrun_identity": "V350/read-failure-serving",
  "command": [
    "/Library/Developer/CommandLineTools/usr/bin/python3",
    "/tmp/slotstream-optimization-execution/compact-tail-native-v350/run.py",
    "native",
    "--name",
    "read-failure-serving",
    "--deadline",
    "2026-09-08T13:35:00Z"
  ],
  "additional_readiness_bytes": 22200000000,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29945544704,
    "swapins": 44222262,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   470299.\nPages active:                                 896025.\nPages inactive:                               681270.\nPages speculative:                            219362.\nPages throttled:                                   0.\nPages wired down:                             246361.\nPages purgeable:                               11022.\n\"Translation faults\":                    17018074857.\nPages copy-on-write:                       886764242.\nPages zero filled:                       22855829468.\nPages reactivated:                        3745440107.\nPages purged:                               79782916.\nFile-backed pages:                           1346410.\nAnonymous pages:                              450247.\nPages stored in compressor:                  1277119.\nPages occupied by compressor:                 568714.\nDecompressions:                           1282415933.\nCompressions:                             1606561324.\nPageins:                                  8077265927.\nPageouts:                                   11396446.\nSwapins:                                    44222262.\nSwapouts:                                   77578301.\nPages tagged:                                 167157.\nPages tagged resident:                        122483.\nPages tagged compressed:                       44674.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6902.\nPages tag-storage free:                         3388.\nPages tag-storage non-tag pageable:            88006.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7223232.\nTagged compressions:                        12511577.\nTagged decompressions:                      11553027.\n"
  },
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
  "deadline_utc": "2026-09-08T13:35:00Z",
  "classification": "Additional conservative admission immediately before the unchanged original, unrun V350 native command. All original source, cases, assertions, model controls, work allowance and live guards remain."
}
````````````

## Artifact SHA-256 df88c169965f90e27a118c8dcf32ee3fdbe641d28e04db0299dcba226e137850

Encoding: `utf-8`. Original bytes: 3189.

````````````text
{
  "classification": "Native correctness, not serving performance",
  "results": [
    {
      "version": "v358",
      "name": "combined-plain",
      "qualified": true,
      "assertions": 286,
      "failures": [],
      "elapsed_seconds": 236.68909737500002,
      "sampled_max_owned_rss_bytes": 4985405440,
      "minimum_sampled_reclaimable_bytes": 15201140736,
      "swapouts_delta": 0,
      "stdout_sha256": "9e8cdf0be9fd30fc0689791ff3e77362789b5c83c9c6171c06548d51eb634b0b",
      "qualification_sha256": "3edc17259300c8dadddff41efe1063320784bd2ddde59bba59ba8c369341eb97",
      "within_reservation": true,
      "cleanup_complete": true,
      "source_proofs_unchanged": true
    },
    {
      "version": "v350",
      "name": "combined-mtp",
      "qualified": false,
      "assertions": 327,
      "failures": [
        {
          "detail": "got [33, 428, 329, 271, 487, 1006, 271, 487], want [33, 428, 329, 271, 487, 1006, 271, 13]",
          "name": "cached17: exact complete greedy IDs",
          "passed": false
        },
        {
          "detail": "got [5513, 271, 510, 271, 248045, 271, 248044, 4876], want [5513, 271, 510, 271, 248045, 271, 248044, 871]",
          "name": "boundary256: exact complete greedy IDs",
          "passed": false
        },
        {
          "detail": "got [2541, 261, 656, 258, 6, 198, 220, 248046], want [2541, 261, 656, 258, 6, 198, 220, 220]",
          "name": "long1025: exact complete greedy IDs",
          "passed": false
        },
        {
          "detail": "got [5513, 12, 248044, 320, 2793, 25, 2212, 14905], want [5513, 12, 248044, 320, 2793, 25, 2212, 21227]",
          "name": "image-before: exact complete greedy IDs",
          "passed": false
        },
        {
          "detail": "got [33, 461], want [33, 428]",
          "name": "true: bounded output preserves the longer greedy prefix",
          "passed": false
        },
        {
          "detail": "got [33, 461], want [33, 428]",
          "name": "two-token MTP integrated output matches reference",
          "passed": false
        }
      ],
      "elapsed_seconds": 295.87036987500005,
      "sampled_max_owned_rss_bytes": 6122455040,
      "minimum_sampled_reclaimable_bytes": 20761542656,
      "swapouts_delta": 0,
      "stdout_sha256": "5cba162a2508534c86a128523dee1a41a89d1b9b0bdb8e321a5dcc1e2d0acb7c",
      "qualification_sha256": "e921d999d9a52cbb93c245ddb7981668018cf496d4f49744f2e01441eb85afd8",
      "within_reservation": true,
      "cleanup_complete": true,
      "source_proofs_unchanged": true
    },
    {
      "version": "v350",
      "name": "read-failure-serving",
      "qualified": true,
      "assertions": 522,
      "failures": [],
      "elapsed_seconds": 172.009107208,
      "sampled_max_owned_rss_bytes": 3833315328,
      "minimum_sampled_reclaimable_bytes": 20829061120,
      "swapouts_delta": 0,
      "stdout_sha256": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
      "qualification_sha256": "63ce8b33a9c5ae7f6d2e38d9aa9fd7400be5ae7e7e013d1384736774a62e2b36",
      "within_reservation": true,
      "cleanup_complete": true,
      "source_proofs_unchanged": true
    }
  ]
}

````````````

## Artifact SHA-256 9c9576781cc203d47f7b53db8d0a4699c2af0e42f9360dace1b3a6e0a1c5d972

Encoding: `utf-8`. Original bytes: 342.

````````````text
{
  "at": "2026-09-08T13:08:39.834952+00:00",
  "owned_groups": [
    37394,
    42061
  ],
  "remaining_owned_members": [],
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

## Artifact SHA-256 bdffa5c1f9ebb71f01306a70ac69f5b7fa1e32c4a7de9d988654af00d7c5873e

Encoding: `utf-8`. Original bytes: 2493.

````````````text
{
  "at": "2026-09-08T12:56:18.790060+00:00",
  "ordinary_passed": true,
  "assertions": 286,
  "elapsed_seconds": 236.68909737500002,
  "remaining_jobs": [],
  "model_lock_free": true,
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
    "reclaimable_bytes": 30578081792,
    "swapins": 44222111,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   447864.\nPages active:                                 886633.\nPages inactive:                               692224.\nPages speculative:                            192462.\nPages throttled:                                   0.\nPages wired down:                             240317.\nPages purgeable:                               12833.\n\"Translation faults\":                    17010295615.\nPages copy-on-write:                       885979502.\nPages zero filled:                       22805464018.\nPages reactivated:                        3741673692.\nPages purged:                               79670751.\nFile-backed pages:                           1405641.\nAnonymous pages:                              365678.\nPages stored in compressor:                  1365290.\nPages occupied by compressor:                 624418.\nDecompressions:                           1280841447.\nCompressions:                             1604899461.\nPageins:                                  8074534092.\nPageouts:                                   11395711.\nSwapins:                                    44222111.\nSwapouts:                                   77578301.\nPages tagged:                                 169676.\nPages tagged resident:                        120796.\nPages tagged compressed:                       48880.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6924.\nPages tag-storage free:                         1643.\nPages tag-storage non-tag pageable:            89729.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8007360.\nTagged compressions:                        12491699.\nTagged decompressions:                      11529329.\n"
  },
  "additional_native_screen_met": true,
  "still_holds_grant_until": "2026-09-08T13:15:00Z"
}

````````````

## Artifact SHA-256 82b29479a03cb8944ceba91c08ccfbe808356ff6d2aa724f007b52e4b2f18d99

Encoding: `utf-8`. Original bytes: 2623.

````````````text
{
  "at": "2026-09-08T13:14:49.022332+00:00",
  "owned_groups": [
    47886
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
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29239132160,
    "swapins": 44222282,
    "swapouts": 77578301,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   477478.\nPages active:                                 926455.\nPages inactive:                               782480.\nPages speculative:                            143048.\nPages throttled:                                   0.\nPages wired down:                             228481.\nPages purgeable:                               12484.\n\"Translation faults\":                    17022698430.\nPages copy-on-write:                       887281808.\nPages zero filled:                       22859023724.\nPages reactivated:                        3745517472.\nPages purged:                               79804393.\nFile-backed pages:                           1294653.\nAnonymous pages:                              557330.\nPages stored in compressor:                  1192247.\nPages occupied by compressor:                 524791.\nDecompressions:                           1282496847.\nCompressions:                             1606561324.\nPageins:                                  8077339374.\nPageouts:                                   11396465.\nSwapins:                                    44222282.\nSwapouts:                                   77578301.\nPages tagged:                                 167938.\nPages tagged resident:                        126085.\nPages tagged compressed:                       41853.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6902.\nPages tag-storage free:                         2680.\nPages tag-storage non-tag pageable:            88714.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6843008.\nTagged compressions:                        12511577.\nTagged decompressions:                      11555547.\n"
  },
  "recovery_assertions": 522,
  "recovery_elapsed_seconds": 172.009107208,
  "full_current_grant_until": "2026-09-08T14:35:00Z",
  "next_step": "V360 one serial cached build, explicit peer grant received; original 1250-second reservation"
}

````````````

## Artifact SHA-256 e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855

Encoding: `utf-8`. Original bytes: 0.

````````````text

````````````

## Artifact SHA-256 d3736e3b089275ef3ab7b9e271a01de79214ae110c3894be5a3974653aa6c829

Encoding: `utf-8`. Original bytes: 526.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "9552ad9cd0f2c1ab3fb500388476eb211942e92e8d6b2cee90400eaf11aec357",
  "exit_code": 0,
  "assertions": 286,
  "elapsed_seconds": 236.68909737500002,
  "proofs_unchanged": true,
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "9e8cdf0be9fd30fc0689791ff3e77362789b5c83c9c6171c06548d51eb634b0b",
  "execution_receipt_sha256": "1ff14dd59b1a6075ee6db2eed4eb08ef6d346506c01b9c6d90f11398c48c8572"
}

````````````

## Artifact SHA-256 a86c28cb04f576d8db9fc009ec48c0ef869793776e97c08556ed966a3249f466

Encoding: `utf-8`. Original bytes: 629.

````````````text
{
  "at": "2026-09-08T12:47:38.061473+00:00",
  "checks": {
    "exact_original_ordinary_command": true,
    "same_build_environment_and_live_policy": true,
    "exact_original_assertion_function": true,
    "exact_original_execution_function": true,
    "only_new_ordinary_identity": true,
    "stronger_admission_only": true,
    "refusal_does_not_claim_attempt": true,
    "old_interruption_preserved": true,
    "old_mtp_and_recovery_still_unrun": true
  },
  "all_passed": true,
  "model_launched": false,
  "classification": "Prospective executor identity and model-free admission-refusal checks; not native acceptance."
}

````````````

## Artifact SHA-256 419a181b22d72a055f4e6ccad8e9a5b47af6cc4e527c58f29eda91e3f404e859

Encoding: `utf-8`. Original bytes: 24180.

````````````text
{
  "prepared_at": "2026-09-08T12:46:54.330401+00:00",
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
    "/tmp/slotstream-optimization-execution/compact-tail-native-v350/run.py": "00a4f02b95b2701aae0b3bcd76c7b23d87aed7ed346123ee5f4c5f2427f4ea4b",
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/attempt.json": "a00ed901e481a4ddb19792e4494948b2990beed7352b5aa656065fb88c6f00a3",
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/receipt.json": "c3c79b68cce427cdc55b18b95350ced9b2816c996894a8a86fcf681d46d70441",
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/qualification.json": "5f0cf8ea4589a78608ce1b4d4cc822c018964845332cfe79435520b8dda91f9a",
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/memory.json": "9c149033cd0ef36de483e11d1b0bc97d0027d901daa7d825badf09026bdebbd6",
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/stdout.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-plain/stderr.txt": "8454673eede2d8fa3a8883a280b5972f13b8b19361645bd92426cd5eef3bccc0",
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
  "executor_sha256": "79a455c5ca07f5d87a30eefadcaafda88298b452a0a07ae507686d70f4da77b5",
  "additional_native_readiness_bytes": 22200000000,
  "prior_interrupted_identity": "V350/combined-plain",
  "fresh_identity": "V358/combined-plain",
  "native_specs": {
    "combined-plain": [
      "integrated",
      "optimization-integrated",
      242
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
  "classification": "Prospective V358 ordinary-native attempt after the user resumed and available memory rose from 15.5 GB to above the additional 22.2 GB readiness screen. V350 ordinary interruption stays immutable. The exact V349 binary, complete ordinary cases, all original and new assertions, original 900-second work plus 30-second cleanup allowance, and original live policy remain unchanged. Only admission is more conservative. Existing V350 MTP and recovery identities remain separate and unrun. Fresh explicit peer grant required before launch; no benchmark, build, activation or app closure."
}

````````````

## Artifact SHA-256 3da11a1c92168a47a9a1165c6238f3e6557ecbc90bb9b90a99ed555f1aef562b

Encoding: `utf-8`. Original bytes: 556.

````````````text
{
  "passed": false,
  "completed": false,
  "qualified": false,
  "attempt_sha256": "ba8ac326891ca46979d3adede7180605f97a102b52f839f89364299165435f66",
  "exit_code": 1,
  "error": "ValueError: native process failed",
  "elapsed_seconds": 295.87036987500005,
  "proofs_unchanged": true,
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "5cba162a2508534c86a128523dee1a41a89d1b9b0bdb8e321a5dcc1e2d0acb7c",
  "execution_receipt_sha256": "98be38f61ac3006d6de7bf7eae300ef78b002e8600594901ca276d9d6b10234b"
}

````````````

## Artifact SHA-256 ef7416a03d7c124a52a339f59f69cd23596f276ba28d6af68fa495d8e28c856b

Encoding: `utf-8`. Original bytes: 521.

````````````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "f05873160c341266dd799972856f172f0235db7117e0710943fb78bb4a1bf801",
  "exit_code": 0,
  "assertions": 522,
  "elapsed_seconds": 172.009107208,
  "proofs_unchanged": true,
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
  "execution_receipt_sha256": "73757ed551b0b18b5a9680cf7831dd82296e066054f854eb4f0b7406aef8b351"
}

````````````

## Artifact SHA-256 98646f27ff0550ce6ff33635a620f286aa569c4a5af22173ad3585e7bb004e9c

Encoding: `utf-8`. Original bytes: 1859.

````````````text
from pathlib import Path
import datetime,hashlib,json,subprocess,sys
R=Path('/Users/carlos/Projects/slotstream');B=Path('/tmp/slotstream-optimization-execution');P=B/'compact-tail-native-v358';OLD=B/'compact-tail-native-v350/run.py'
sys.path.insert(0,str(R/'Tools'))
from prefill_bench import preflight
from optimization_readiness import pressure_snapshot,require_normal
from serve_bench import competing_jobs
name,deadline=sys.argv[1:]
assert name in ('combined-mtp','read-failure-serving')
assert hashlib.sha256(OLD.read_bytes()).hexdigest()=='00a4f02b95b2701aae0b3bcd76c7b23d87aed7ed346123ee5f4c5f2427f4ea4b'
assert not (R/'.build/optimization/compact-tail-native-v350'/name).exists()
limit=datetime.datetime.fromisoformat(deadline.replace('Z','+00:00'));assert limit.tzinfo
assert (limit-datetime.datetime.now(datetime.timezone.utc)).total_seconds()>=930
assert not competing_jobs();pressure=pressure_snapshot();require_normal(pressure);before=preflight(22.2)
command=[sys.executable,str(OLD),'native','--name',name,'--deadline',deadline]
record={'at':datetime.datetime.now(datetime.timezone.utc).isoformat(),'original_unrun_identity':'V350/'+name,'command':command,'additional_readiness_bytes':22200000000,'before':before,'pressure':pressure,'deadline_utc':deadline,'classification':'Additional conservative admission immediately before the unchanged original, unrun V350 native command. All original source, cases, assertions, model controls, work allowance and live guards remain.'}
with (P/('admission-'+name+'.json')).open('x') as f:json.dump(record,f,indent=2)
with (P/('remaining-'+name+'.stdout.txt')).open('x') as out,(P/('remaining-'+name+'.stderr.txt')).open('x') as err:
 result=subprocess.run(command,cwd=R,stdout=out,stderr=err)
print(json.dumps({'native':name,'exit_code':result.returncode}),flush=True)
raise SystemExit(result.returncode)

````````````

## Artifact SHA-256 79a455c5ca07f5d87a30eefadcaafda88298b452a0a07ae507686d70f4da77b5

Encoding: `utf-8`. Original bytes: 8081.

````````````text
from pathlib import Path
import argparse,datetime,fcntl,importlib.util,inspect,json,os,signal,sys,threading,time
ROOT=Path('/Users/carlos/Projects/slotstream');BASE=Path('/tmp/slotstream-optimization-execution');HERE=Path(__file__).resolve().parent
OUT=ROOT/'.build/optimization/compact-tail-native-v358'
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
NATIVE={'combined-plain':('integrated','optimization-integrated',242)}
BINARY=ROOT/'.build/optimization/compact-tail-combined-build-v349/candidate/slotstream'
MODEL='/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit'
SECONDS=900
MINIMUM_NATIVE_RECLAIMABLE_BYTES=22_200_000_000
PRIOR=ROOT/'.build/optimization/compact-tail-native-v350/combined-plain'
PRIOR_EXECUTOR=BASE/'compact-tail-native-v350/run.py'
PRIOR_ARTIFACTS=[PRIOR/f for f in ('attempt.json','receipt.json','qualification.json','memory.json','stdout.txt','stderr.txt')]

def prepare():
 require(not (HERE/'preparation.json').exists() and not OUT.exists(),'already prepared/attempted')
 build=verified_build(BINARY)
 require(build['identity']['binary_sha256']=='7fb2cc0c6cccf93e8a589d02ce5aa839eea38140a1cb8f44cefeb10ec3f472f6','wrong combined build')
 lease=c.read(BASE/'compact-tail-combined-build-v349/lease-result.json');require(lease['passed'] and lease['restored'],'build did not pass/restore')
 prior_receipt=c.read(PRIOR/'receipt.json');require(prior_receipt.get('qualified') is False and 'OS memory pressure is not normal' in prior_receipt.get('error',''),'preserve the original interrupted native failure')
 dependencies=[PRIOR_EXECUTOR]+PRIOR_ARTIFACTS+[CORE,BASE/'pressure-footprint-v341/guard_with_footprint.py',BASE/'pressure-footprint-v341/pressure_footprint.py',BASE/'compact-tail-combined-build-v349/lease-result.json']+[ROOT/'Tools'/x for x in c.DRIVERS+('thermal_readiness.py',)]
 value={'prepared_at':now(),'build':build,'dependencies':{str(p):digest(p) for p in dependencies},'executor_sha256':digest(Path(__file__)),'additional_native_readiness_bytes':MINIMUM_NATIVE_RECLAIMABLE_BYTES,'prior_interrupted_identity':'V350/combined-plain','fresh_identity':'V358/combined-plain','native_specs':NATIVE,'commands':{k:[str(BINARY),'optimization-state-check','--variant',v[0],'--model',MODEL,'--json'] for k,v in NATIVE.items()},'environment':{},'seconds':SECONDS,'policy':dict(c.NATIVE_POLICY,maximum_build_seconds=SECONDS),'classification':'Prospective V358 ordinary-native attempt after the user resumed and available memory rose from 15.5 GB to above the additional 22.2 GB readiness screen. V350 ordinary interruption stays immutable. The exact V349 binary, complete ordinary cases, all original and new assertions, original 900-second work plus 30-second cleanup allowance, and original live policy remain unchanged. Only admission is more conservative. Existing V350 MTP and recovery identities remain separate and unrun. Fresh explicit peer grant required before launch; no benchmark, build, activation or app closure.'}
 c.write_new(HERE/'preparation.json',value)
 return {'prepared':True,'model_launched':False,'cases':list(NATIVE),'protocol_sha256':digest(HERE/'preparation.json')}

def load():
 value=c.read(HERE/'preparation.json')
 require(value.get('additional_native_readiness_bytes')==MINIMUM_NATIVE_RECLAIMABLE_BYTES and value.get('prior_interrupted_identity')=='V350/combined-plain' and value.get('fresh_identity')=='V358/combined-plain','prospective identity or added readiness screen changed')
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
 limit,before,thermal=readiness(deadline,SECONDS+30,MINIMUM_NATIVE_RECLAIMABLE_BYTES/1_000_000_000)
 attempt={'started_at':now(),'deadline_utc':deadline,'command':value['commands'][name],'environment':{},'build':value['build'],'before':before,'thermal_prelaunch':thermal,'additional_native_readiness_bytes':MINIMUM_NATIVE_RECLAIMABLE_BYTES,'policy':value['policy'],'preparation_sha256':digest(HERE/'preparation.json'),'classification':value['classification']}
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
