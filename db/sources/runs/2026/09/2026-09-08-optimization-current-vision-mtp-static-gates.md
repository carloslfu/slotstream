---
type: run
id: 01m1z5z1yc1tdz482wxzksxnwk
created: 2026-09-08T00:16:25.036410+00:00
updated: 2026-09-08T00:16:25.436814+00:00
summary: Current vision components, fixed MTP work, image reuse and full static suite pass
binary: V304 af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d
captured_at: 2026-09-08
command: Original V332 vision native commands; V330 MTP/image native commands; complete static_gates.sh on V304. Exact invocations and captured outputs below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Current vision components, fixed MTP work, image reuse and full static suite pass
tool: python3
---
# Actual current-candidate checks completed

The exact V304 binary passes all three original V332 vision-only commands under the unchanged 13 GB startup / 10 GB owned / 3 GB live policy: 104 attention assertions, 47 full-tower assertions and six maximum-reference assertions. All eight required complete-tower comparisons are byte-exact, including 1536 by 1536. Native sampled peaks are 644793400, 2461222448 and 5281564256 bytes; these are correctness-observer results, not paired serving memory savings. Wall times are 0.868900417, 11.259839334 and 10.798243459 seconds. No swap counter changes occurred during these three executions. The original input sizes, numerical thresholds, commands and 900-second bounds are unchanged.

V330's original current mtp-work-integrated command passes 284 assertions in 76.355587459 seconds. It covers integrated greedy and seeded sampled work at depths one/three and limits one/two/five, including exact output, retained state and the sampled fallback's unchanged verification schedule. The image-reuse native command passes all 76 assertions in 1.2427545 seconds. Both runs have unchanged swap counters and verified cleanup. These establish correctness, not a serving speedup or activation.

The complete static acceptance suite is refreshed after the V313/V317/V319/V326/V333 harness fixes. V336 uses an exact copy of the original V307 static executor, the same V304 executable, all current test drivers and the original weights-free policy: 7 GB startup, 3 GB owned ceiling, 3 GB live floor and 600-second limit. It passes in 299.358284 seconds. Candidate and driver identities are unchanged; the model lock is free and no owned job remains. This includes the original small C/Swift transport fixtures and all mandatory Python, planner, installer, brain and projection checks. It is not a new inference-performance or resource-qualification result.

During source review, V335 prepared alternative vision-component admission profiles using the diagnostics' existing 2/5/8.1 GB caps plus 3 GB headroom. Four model-free profile tests passed. That alternative was never executed: the peer drained its own emulator and idle IDE, real memory exceeded 13 GB, and all three original V332 commands then passed unchanged. V335 is explicitly retired unrun; it must not duplicate those completed native checks. No user application was closed.

The quiet interval was explicitly allowed to begin early while retaining September 8 02:30 UTC as the hard deadline. All runs above are fully drained. Adaptive policy failure and interrupted full-model vision/scope runs are separately preserved; none is relabeled as passed. The whole optimization plan and final activation remain incomplete.


## Evidence inventory

````json
[
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference/attempt.json",
    "bytes": 22748,
    "sha256": "c854592080741f1b89cdd13e8a53f28a367acbc555b31269f10c53803c895564"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference/memory.json",
    "bytes": 17010,
    "sha256": "bd9d853d9e792188782c3fb93f6fd41255caa7d908058a5c8205f30fac694f09"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference/memory.samples.jsonl",
    "bytes": 7739,
    "sha256": "a8e61a77fc88061cc1b3186c0b1e0bfc7128b42768b1ca555c8c2b8c07731781"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference/qualification.json",
    "bytes": 2608,
    "sha256": "e63cea8cf10b1a66bfbd4ee1d43bed303352d2d3931273e47775b83bf4e53096"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference/receipt.json",
    "bytes": 2475,
    "sha256": "7124977d30243802983d5b12fee13d8d57ad8c61114f672bb1e6a13a31dd019d"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference/stdout.txt",
    "bytes": 1049,
    "sha256": "fe745e31aca98b9279ff62bf9dca77c0f5bdff29331bc5119c03f35ec9aab21b"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity/attempt.json",
    "bytes": 22744,
    "sha256": "1f59fdb9f8f71471b741ab5da1dea7a620d0d55ad957c58cf2e8832571eecc84"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity/memory.json",
    "bytes": 7749,
    "sha256": "41ea1f01a154135ba030be4dc77d7fb882cdd0785db6f98dd68704c32d067b67"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity/memory.samples.jsonl",
    "bytes": 510,
    "sha256": "c68b6633455ed4a1360189924404b5e98f3fb1402c6aeae4c9745d7680202d44"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity/qualification.json",
    "bytes": 2609,
    "sha256": "1b05fca1bcc0e6e1d5280d76d763cdd86993159d1ef6ca4bce258f6d28c4be31"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity/receipt.json",
    "bytes": 2476,
    "sha256": "ac41c79129a25b6d3c924cca0ff5d413c075f44500abf1579cbecf7233873a9a"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity/stdout.txt",
    "bytes": 16275,
    "sha256": "2c901927e46b6cedaf1f41021c7dc3eeabec810b769d84f62ea599127bbad839"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower/attempt.json",
    "bytes": 22741,
    "sha256": "c6c072174bd22437a9cfff5d6b1cdba560fe76fd7df831c8a2ea39b04c986e2f"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower/memory.json",
    "bytes": 17446,
    "sha256": "f0bcc478153abd0b364d23fac3246b12c4ef5e3b7765c101bf78593183a68154"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower/memory.samples.jsonl",
    "bytes": 8095,
    "sha256": "4f7bf51f610831254e567331971c9304f7c1d6070903a09a52e2de43bd366719"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower/qualification.json",
    "bytes": 2615,
    "sha256": "9881e16798d2d582fabe4b5b1dc4a574b0d7bd6e1a7ce1255f1007b416a989cd"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower/receipt.json",
    "bytes": 2482,
    "sha256": "def1a0f16113d865befb4a9ae9e7664ea1de9702a4ec4d6e917bd067a70b4f64"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower/stdout.txt",
    "bytes": 7003,
    "sha256": "3d9d10f6e14592429833ce860fba18f93c0636562e11b7a1a5ef4e474f501219"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse/attempt.json",
    "bytes": 22725,
    "sha256": "771b5f6417dc0771b979fb606fa981ca9cc27100391aef6471ee8832c96246e8"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse/memory.json",
    "bytes": 8160,
    "sha256": "239893b5e574b456df5b9fc788fc8788a8d7311ac899b6c727f02e8569b80051"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse/memory.samples.jsonl",
    "bytes": 837,
    "sha256": "5d5b2f6b4004ae6b50ee5bf90aa57d3b64ef83dbe6ef6ca65f64e663cfd6d1f6"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse/receipt.json",
    "bytes": 2441,
    "sha256": "b7013145b09f9639d0f08e8e72331f1dee4ae4d5f28b2fbb3cfb38fca1be8073"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse/stdout.txt",
    "bytes": 6727,
    "sha256": "e651d90a731a3f5d3ff48022247f967966c87e84cf80267d507643bff23b940a"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/mtp-work-integrated/attempt.json",
    "bytes": 22733,
    "sha256": "58487eaa44eb9850104baa60eb5e9102a64804adfd0ed08c7f6339608b24bddb"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/mtp-work-integrated/memory.json",
    "bytes": 77954,
    "sha256": "a7f376aa88de385ef6ffb4cedc5271b7132a3c5ea8f22bfbb2064f835ebab624"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/mtp-work-integrated/memory.samples.jsonl",
    "bytes": 55401,
    "sha256": "159ac29747982267adeba59bdf073f5b0ada22bd0251b77ca8ceaee044dbbb75"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/mtp-work-integrated/receipt.json",
    "bytes": 2450,
    "sha256": "332ed1a4d25eed50aac1c711e98e923c6f70cab4d8f37ecccbb5dddf58c2cb16"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/mtp-work-integrated/stderr.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/mtp-work-integrated/stdout.txt",
    "bytes": 34184,
    "sha256": "29540a4690f0fbc5547bc78ebbb8b305b40e53bfec3f416d76f22d7822df3abf"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-static-acceptance-v336/manifest.json",
    "bytes": 4327,
    "sha256": "13a402db68673b6b155878eb4eb2e4869dae5c5a32ca5f2f24704a0b11609d29"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-static-acceptance-v336/memory.json",
    "bytes": 274137,
    "sha256": "06fce6830fa177f4d4815d1913985a936fe83ea161c2e9779c42cd1adf9c4084"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-static-acceptance-v336/memory.samples.jsonl",
    "bytes": 208913,
    "sha256": "d76b5c5ca3b2096e3c303eac78b4ba162e65f7251d2aa36307f883128eee782e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-static-acceptance-v336/protocol.json",
    "bytes": 34866,
    "sha256": "0225ff5f2242a8b34eee979e25796c3f63d5d2c8a679c3310facfc317ab5438e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-static-acceptance-v336/run.py",
    "bytes": 3688,
    "sha256": "fe26b0b0cb09a2410134d2aba52654f3e482ec704b80bad08bbd66876e22eb5b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-static-acceptance-v336/stderr.txt",
    "bytes": 2997,
    "sha256": "5ea6406452aeb7913def2eca39232b48d6b0f5aa6d4d9aab8dcb1451ed05f683"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/current-static-acceptance-v336/stdout.txt",
    "bytes": 15661,
    "sha256": "86f2e28e6fa72319c25d3c75f7f386e603c9e5837774b9e4109296a0485de144"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-component-execution-v335/.run.lock",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-component-execution-v335/disposition.json",
    "bytes": 435,
    "sha256": "90540d4d2b4c3b439d53f88fb437cab66e1469a196a76d9a4b8c16179d33f11e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-component-execution-v335/preparation.json",
    "bytes": 24655,
    "sha256": "a0e280f530607d5bfa7afa66c73dc85f3741bd0559ad4084d448a0efb169e420"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-component-execution-v335/run.py",
    "bytes": 5018,
    "sha256": "03792c3bb0ddf60bd283f301069fb920b0e4494ba6cff6d8fc84cce2193acd83"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-component-execution-v335/run_test.py",
    "bytes": 2816,
    "sha256": "4f6161290ab6a8c00502a86ad8e6eeaf02f11ab3cda730c043aed628791d2740"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-component-execution-v335/validation.json",
    "bytes": 272,
    "sha256": "e310c3511c65ee0cab91bbc6a27fa664dd0a3a24d097fb4fd3c531531f321a2a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-component-execution-v335/validation.stderr.txt",
    "bytes": 102,
    "sha256": "feabb4add9e2ca3374e538560634d1ec97dc4f4ce89aab12f3d726e36ea9b2f6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/vision-component-execution-v335/validation.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  }
]
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference/attempt.json

SHA-256 `c854592080741f1b89cdd13e8a53f28a367acbc555b31269f10c53803c895564`.

````text
{
  "started_at": "2026-09-07T23:54:00.701085+00:00",
  "deadline_utc": "2026-09-08T00:11:00Z",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "vision-query-maximum-reference",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
      "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13759102976,
    "swapins": 44129700,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   151166.\nPages active:                                 954532.\nPages inactive:                              1046735.\nPages speculative:                            114014.\nPages throttled:                                   0.\nPages wired down:                             237024.\nPages purgeable:                               19909.\n\"Translation faults\":                    16707873935.\nPages copy-on-write:                       853244592.\nPages zero filled:                       22511948569.\nPages reactivated:                        3727863623.\nPages purged:                               78859151.\nFile-backed pages:                            668714.\nAnonymous pages:                             1446567.\nPages stored in compressor:                  1390614.\nPages occupied by compressor:                 581824.\nDecompressions:                           1274637194.\nCompressions:                             1597453396.\nPageins:                                  8049729527.\nPageouts:                                   11386434.\nSwapins:                                    44129700.\nSwapouts:                                   77538158.\nPages tagged:                                 176968.\nPages tagged resident:                        138195.\nPages tagged compressed:                       38773.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7819.\nPages tag-storage free:                          346.\nPages tag-storage non-tag pageable:            90131.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6141376.\nTagged compressions:                        12379920.\nTagged decompressions:                      11436556.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-07T23:54:00.700957+00:00",
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
  "preparation_sha256": "32e7aa3ff113f92a63624aac95bd1fa6f0ae5997eeeaf63fb8aad73fb9599fc4",
  "classification": "Current native correctness only under original900second allowance.13GB startup/10GB owned/3GB live headroom. No serving performance, capacity, default or installation claim."
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference/qualification.json

SHA-256 `e63cea8cf10b1a66bfbd4ee1d43bed303352d2d3931273e47775b83bf4e53096`.

````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "c854592080741f1b89cdd13e8a53f28a367acbc555b31269f10c53803c895564",
  "exit_code": 0,
  "assertions": 6,
  "exact_tower_comparisons": 1,
  "elapsed_seconds": 10.798243459,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13794623488,
    "swapins": 44129700,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   330223.\nPages active:                                 951662.\nPages inactive:                               983511.\nPages speculative:                               419.\nPages throttled:                                   0.\nPages wired down:                             237244.\nPages purgeable:                               23795.\n\"Translation faults\":                    16708098042.\nPages copy-on-write:                       853269561.\nPages zero filled:                       22519368552.\nPages reactivated:                        3727863629.\nPages purged:                               78859206.\nFile-backed pages:                            487939.\nAnonymous pages:                             1447653.\nPages stored in compressor:                  1390578.\nPages occupied by compressor:                 581818.\nDecompressions:                           1274637230.\nCompressions:                             1597453396.\nPageins:                                  8049729835.\nPageouts:                                   11386524.\nSwapins:                                    44129700.\nSwapouts:                                   77538158.\nPages tagged:                                 177084.\nPages tagged resident:                        138312.\nPages tagged compressed:                       38772.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7819.\nPages tag-storage free:                          485.\nPages tag-storage non-tag pageable:            89992.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6140864.\nTagged compressions:                        12379920.\nTagged decompressions:                      11436557.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "fe745e31aca98b9279ff62bf9dca77c0f5bdff29331bc5119c03f35ec9aab21b",
  "vision_proofs_unchanged": true,
  "execution_receipt_sha256": "7124977d30243802983d5b12fee13d8d57ad8c61114f672bb1e6a13a31dd019d"
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference/receipt.json

SHA-256 `7124977d30243802983d5b12fee13d8d57ad8c61114f672bb1e6a13a31dd019d`.

````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "c854592080741f1b89cdd13e8a53f28a367acbc555b31269f10c53803c895564",
  "exit_code": 0,
  "assertions": 6,
  "exact_tower_comparisons": 1,
  "elapsed_seconds": 10.798243459,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13794623488,
    "swapins": 44129700,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   330223.\nPages active:                                 951662.\nPages inactive:                               983511.\nPages speculative:                               419.\nPages throttled:                                   0.\nPages wired down:                             237244.\nPages purgeable:                               23795.\n\"Translation faults\":                    16708098042.\nPages copy-on-write:                       853269561.\nPages zero filled:                       22519368552.\nPages reactivated:                        3727863629.\nPages purged:                               78859206.\nFile-backed pages:                            487939.\nAnonymous pages:                             1447653.\nPages stored in compressor:                  1390578.\nPages occupied by compressor:                 581818.\nDecompressions:                           1274637230.\nCompressions:                             1597453396.\nPageins:                                  8049729835.\nPageouts:                                   11386524.\nSwapins:                                    44129700.\nSwapouts:                                   77538158.\nPages tagged:                                 177084.\nPages tagged resident:                        138312.\nPages tagged compressed:                       38772.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7819.\nPages tag-storage free:                          485.\nPages tag-storage non-tag pageable:            89992.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6140864.\nTagged compressions:                        12379920.\nTagged decompressions:                      11436557.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "fe745e31aca98b9279ff62bf9dca77c0f5bdff29331bc5119c03f35ec9aab21b"
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-maximum-reference/stdout.txt

SHA-256 `fe745e31aca98b9279ff62bf9dca77c0f5bdff29331bc5119c03f35ec9aab21b`.

````text
{
  "items" : [
    {
      "name" : "1536x1536: exact patch geometry",
      "passed" : true
    },
    {
      "name" : "1536x1536: executed query tile count",
      "passed" : true
    },
    {
      "name" : "1536x1536: complete finite trained-tower output",
      "passed" : true
    },
    {
      "name" : "1536x1536: exact repeated tower output",
      "passed" : true
    },
    {
      "name" : "1536x1536: trained-tower same-dtype agreement",
      "passed" : true
    },
    {
      "name" : "1536x1536: bounded tower and reference footprint",
      "passed" : true
    }
  ],
  "measurements" : {
    "1536x1536.candidate_mlx_peak_bytes" : 1419930104,
    "1536x1536.candidate_sampled_footprint_bytes" : 1738032688,
    "1536x1536.mlx_peak_bytes" : 4277037562,
    "1536x1536.reference_cosine" : 1,
    "1536x1536.reference_exact_bytes" : 1,
    "1536x1536.sampled_footprint_bytes" : 5281564256,
    "1536x1536.worst_token_cosine" : 1
  },
  "name" : "optimization-vision-tower-capacity-query256-maximum-reference",
  "passed" : true
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity/attempt.json

SHA-256 `1f59fdb9f8f71471b741ab5da1dea7a620d0d55ad957c58cf2e8832571eecc84`.

````text
{
  "started_at": "2026-09-07T23:53:24.540528+00:00",
  "deadline_utc": "2026-09-08T00:11:00Z",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "vision-query-tile-capacity",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
      "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13933248512,
    "swapins": 44129700,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   217256.\nPages active:                                 944603.\nPages inactive:                               992522.\nPages speculative:                            111899.\nPages throttled:                                   0.\nPages wired down:                             236889.\nPages purgeable:                               19898.\n\"Translation faults\":                    16707415988.\nPages copy-on-write:                       853194440.\nPages zero filled:                       22506734794.\nPages reactivated:                        3727863414.\nPages purged:                               78858895.\nFile-backed pages:                            613264.\nAnonymous pages:                             1435760.\nPages stored in compressor:                  1390781.\nPages occupied by compressor:                 581916.\nDecompressions:                           1274637071.\nCompressions:                             1597453396.\nPageins:                                  8049675751.\nPageouts:                                   11386434.\nSwapins:                                    44129700.\nSwapouts:                                   77538158.\nPages tagged:                                 177087.\nPages tagged resident:                        138314.\nPages tagged compressed:                       38773.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7819.\nPages tag-storage free:                          349.\nPages tag-storage non-tag pageable:            90128.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6141376.\nTagged compressions:                        12379920.\nTagged decompressions:                      11436556.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-07T23:53:24.540398+00:00",
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
  "preparation_sha256": "32e7aa3ff113f92a63624aac95bd1fa6f0ae5997eeeaf63fb8aad73fb9599fc4",
  "classification": "Current native correctness only under original900second allowance.13GB startup/10GB owned/3GB live headroom. No serving performance, capacity, default or installation claim."
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity/qualification.json

SHA-256 `1b05fca1bcc0e6e1d5280d76d763cdd86993159d1ef6ca4bce258f6d28c4be31`.

````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "1f59fdb9f8f71471b741ab5da1dea7a620d0d55ad957c58cf2e8832571eecc84",
  "exit_code": 0,
  "assertions": 104,
  "exact_tower_comparisons": 0,
  "elapsed_seconds": 0.868900417,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13929119744,
    "swapins": 44129700,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   216717.\nPages active:                                 943267.\nPages inactive:                               992519.\nPages speculative:                            112040.\nPages throttled:                                   0.\nPages wired down:                             238785.\nPages purgeable:                               19898.\n\"Translation faults\":                    16707481329.\nPages copy-on-write:                       853197709.\nPages zero filled:                       22506825016.\nPages reactivated:                        3727863414.\nPages purged:                               78858895.\nFile-backed pages:                            613551.\nAnonymous pages:                             1434275.\nPages stored in compressor:                  1390781.\nPages occupied by compressor:                 581916.\nDecompressions:                           1274637071.\nCompressions:                             1597453396.\nPageins:                                  8049676062.\nPageouts:                                   11386434.\nSwapins:                                    44129700.\nSwapouts:                                   77538158.\nPages tagged:                                 176940.\nPages tagged resident:                        138167.\nPages tagged compressed:                       38773.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7819.\nPages tag-storage free:                          352.\nPages tag-storage non-tag pageable:            90125.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6141376.\nTagged compressions:                        12379920.\nTagged decompressions:                      11436556.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "2c901927e46b6cedaf1f41021c7dc3eeabec810b769d84f62ea599127bbad839",
  "vision_proofs_unchanged": true,
  "execution_receipt_sha256": "ac41c79129a25b6d3c924cca0ff5d413c075f44500abf1579cbecf7233873a9a"
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity/receipt.json

SHA-256 `ac41c79129a25b6d3c924cca0ff5d413c075f44500abf1579cbecf7233873a9a`.

````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "1f59fdb9f8f71471b741ab5da1dea7a620d0d55ad957c58cf2e8832571eecc84",
  "exit_code": 0,
  "assertions": 104,
  "exact_tower_comparisons": 0,
  "elapsed_seconds": 0.868900417,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13929119744,
    "swapins": 44129700,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   216717.\nPages active:                                 943267.\nPages inactive:                               992519.\nPages speculative:                            112040.\nPages throttled:                                   0.\nPages wired down:                             238785.\nPages purgeable:                               19898.\n\"Translation faults\":                    16707481329.\nPages copy-on-write:                       853197709.\nPages zero filled:                       22506825016.\nPages reactivated:                        3727863414.\nPages purged:                               78858895.\nFile-backed pages:                            613551.\nAnonymous pages:                             1434275.\nPages stored in compressor:                  1390781.\nPages occupied by compressor:                 581916.\nDecompressions:                           1274637071.\nCompressions:                             1597453396.\nPageins:                                  8049676062.\nPageouts:                                   11386434.\nSwapins:                                    44129700.\nSwapouts:                                   77538158.\nPages tagged:                                 176940.\nPages tagged resident:                        138167.\nPages tagged compressed:                       38773.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7819.\nPages tag-storage free:                          352.\nPages tag-storage non-tag pageable:            90125.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6141376.\nTagged compressions:                        12379920.\nTagged decompressions:                      11436556.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "2c901927e46b6cedaf1f41021c7dc3eeabec810b769d84f62ea599127bbad839"
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-capacity/stdout.txt

SHA-256 `2c901927e46b6cedaf1f41021c7dc3eeabec810b769d84f62ea599127bbad839`.

````text
{
  "items" : [
    {
      "name" : "N1.smooth: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N1.smooth: complete finite output",
      "passed" : true
    },
    {
      "name" : "N1.smooth: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N1.smooth: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N1.sharp: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N1.sharp: complete finite output",
      "passed" : true
    },
    {
      "name" : "N1.sharp: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N1.sharp: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N8.smooth: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N8.smooth: complete finite output",
      "passed" : true
    },
    {
      "name" : "N8.smooth: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N8.smooth: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N8.sharp: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N8.sharp: complete finite output",
      "passed" : true
    },
    {
      "name" : "N8.sharp: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N8.sharp: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N9.smooth: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N9.smooth: complete finite output",
      "passed" : true
    },
    {
      "name" : "N9.smooth: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N9.smooth: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N9.sharp: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N9.sharp: complete finite output",
      "passed" : true
    },
    {
      "name" : "N9.sharp: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N9.sharp: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N255.smooth: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N255.smooth: complete finite output",
      "passed" : true
    },
    {
      "name" : "N255.smooth: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N255.smooth: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N255.sharp: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N255.sharp: complete finite output",
      "passed" : true
    },
    {
      "name" : "N255.sharp: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N255.sharp: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N256.smooth: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N256.smooth: complete finite output",
      "passed" : true
    },
    {
      "name" : "N256.smooth: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N256.smooth: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N256.sharp: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N256.sharp: complete finite output",
      "passed" : true
    },
    {
      "name" : "N256.sharp: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N256.sharp: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N257.smooth: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N257.smooth: complete finite output",
      "passed" : true
    },
    {
      "name" : "N257.smooth: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N257.smooth: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N257.sharp: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N257.sharp: complete finite output",
      "passed" : true
    },
    {
      "name" : "N257.sharp: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N257.sharp: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N511.smooth: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N511.smooth: complete finite output",
      "passed" : true
    },
    {
      "name" : "N511.smooth: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N511.smooth: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N511.sharp: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N511.sharp: complete finite output",
      "passed" : true
    },
    {
      "name" : "N511.sharp: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N511.sharp: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N512.smooth: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N512.smooth: complete finite output",
      "passed" : true
    },
    {
      "name" : "N512.smooth: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N512.smooth: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N512.sharp: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N512.sharp: complete finite output",
      "passed" : true
    },
    {
      "name" : "N512.sharp: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N512.sharp: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N513.smooth: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N513.smooth: complete finite output",
      "passed" : true
    },
    {
      "name" : "N513.smooth: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N513.smooth: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N513.sharp: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N513.sharp: complete finite output",
      "passed" : true
    },
    {
      "name" : "N513.sharp: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N513.sharp: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N1024.smooth: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N1024.smooth: complete finite output",
      "passed" : true
    },
    {
      "name" : "N1024.smooth: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N1024.smooth: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N1024.sharp: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N1024.sharp: complete finite output",
      "passed" : true
    },
    {
      "name" : "N1024.sharp: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N1024.sharp: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N2048.smooth: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N2048.smooth: complete finite output",
      "passed" : true
    },
    {
      "name" : "N2048.smooth: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N2048.smooth: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N2048.sharp: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N2048.sharp: complete finite output",
      "passed" : true
    },
    {
      "name" : "N2048.sharp: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N2048.sharp: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N4096.smooth: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N4096.smooth: complete finite output",
      "passed" : true
    },
    {
      "name" : "N4096.smooth: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N4096.smooth: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N4096.sharp: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N4096.sharp: complete finite output",
      "passed" : true
    },
    {
      "name" : "N4096.sharp: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N4096.sharp: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N9216.smooth: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N9216.smooth: complete finite output",
      "passed" : true
    },
    {
      "name" : "N9216.smooth: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N9216.smooth: bounded component and oracle footprint",
      "passed" : true
    },
    {
      "name" : "N9216.sharp: executed query tile count",
      "passed" : true
    },
    {
      "name" : "N9216.sharp: complete finite output",
      "passed" : true
    },
    {
      "name" : "N9216.sharp: independent Float64 sampled-row oracle",
      "passed" : true
    },
    {
      "name" : "N9216.sharp: bounded component and oracle footprint",
      "passed" : true
    }
  ],
  "measurements" : {
    "N1.sharp.mlx_peak_bytes" : 25348,
    "N1.sharp.sampled_candidate_max_error" : 0,
    "N1.sharp.sampled_footprint_bytes" : 83018472,
    "N1.sharp.sampled_reference_max_error" : 0,
    "N1.smooth.mlx_peak_bytes" : 23040,
    "N1.smooth.sampled_candidate_max_error" : 0,
    "N1.smooth.sampled_footprint_bytes" : 82903784,
    "N1.smooth.sampled_reference_max_error" : 0,
    "N1024.sharp.mlx_peak_bytes" : 21233678,
    "N1024.sharp.sampled_candidate_max_error" : 0.2724444890637967,
    "N1024.sharp.sampled_footprint_bytes" : 181650248,
    "N1024.sharp.sampled_reference_max_error" : 0.2724444890637967,
    "N1024.smooth.mlx_peak_bytes" : 21233678,
    "N1024.smooth.sampled_candidate_max_error" : 0.0005115643571536521,
    "N1024.smooth.sampled_footprint_bytes" : 181650248,
    "N1024.smooth.sampled_reference_max_error" : 0.0005115643571536521,
    "N2048.sharp.mlx_peak_bytes" : 42467328,
    "N2048.sharp.sampled_candidate_max_error" : 0.2757739633937417,
    "N2048.sharp.sampled_footprint_bytes" : 260146040,
    "N2048.sharp.sampled_reference_max_error" : 0.2757739633937417,
    "N2048.smooth.mlx_peak_bytes" : 42467342,
    "N2048.smooth.sampled_candidate_max_error" : 0.00048457240481022436,
    "N2048.smooth.sampled_footprint_bytes" : 260146040,
    "N2048.smooth.sampled_reference_max_error" : 0.00048457240481022436,
    "N255.sharp.mlx_peak_bytes" : 5308430,
    "N255.sharp.sampled_candidate_max_error" : 0.24473544778060363,
    "N255.sharp.sampled_footprint_bytes" : 97043200,
    "N255.sharp.sampled_reference_max_error" : 0.24473544778060363,
    "N255.smooth.mlx_peak_bytes" : 5315342,
    "N255.smooth.sampled_candidate_max_error" : 0.0005220393363901114,
    "N255.smooth.sampled_footprint_bytes" : 97043200,
    "N255.smooth.sampled_reference_max_error" : 0.0005220393363901114,
    "N256.sharp.mlx_peak_bytes" : 5308430,
    "N256.sharp.sampled_candidate_max_error" : 0.2757675257592048,
    "N256.sharp.sampled_footprint_bytes" : 97272576,
    "N256.sharp.sampled_reference_max_error" : 0.2757675257592048,
    "N256.smooth.mlx_peak_bytes" : 5308430,
    "N256.smooth.sampled_candidate_max_error" : 0.0004793540875481471,
    "N256.smooth.sampled_footprint_bytes" : 97272576,
    "N256.smooth.sampled_reference_max_error" : 0.0004793540875481471,
    "N257.sharp.mlx_peak_bytes" : 5406734,
    "N257.sharp.sampled_candidate_max_error" : 0.27576752575920505,
    "N257.sharp.sampled_footprint_bytes" : 106464000,
    "N257.sharp.sampled_reference_max_error" : 0.27576752575920505,
    "N257.smooth.mlx_peak_bytes" : 5406734,
    "N257.smooth.sampled_candidate_max_error" : 0.0005215848020877125,
    "N257.smooth.sampled_footprint_bytes" : 106464000,
    "N257.smooth.sampled_reference_max_error" : 0.0005215848020877125,
    "N4096.sharp.mlx_peak_bytes" : 84934670,
    "N4096.sharp.sampled_candidate_max_error" : 0.28831851789127505,
    "N4096.sharp.sampled_footprint_bytes" : 366035928,
    "N4096.sharp.sampled_reference_max_error" : 0.28831851789127505,
    "N4096.smooth.mlx_peak_bytes" : 84934668,
    "N4096.smooth.sampled_candidate_max_error" : 0.0004842793460573449,
    "N4096.smooth.sampled_footprint_bytes" : 366035928,
    "N4096.smooth.sampled_reference_max_error" : 0.0004842793460573449,
    "N511.sharp.mlx_peak_bytes" : 10616846,
    "N511.sharp.sampled_candidate_max_error" : 0.2757756148389572,
    "N511.sharp.sampled_footprint_bytes" : 124896024,
    "N511.sharp.sampled_reference_max_error" : 0.2757756148389572,
    "N511.smooth.mlx_peak_bytes" : 10616832,
    "N511.smooth.sampled_candidate_max_error" : 0.00048733808595142255,
    "N511.smooth.sampled_footprint_bytes" : 124879640,
    "N511.smooth.sampled_reference_max_error" : 0.00048733808595142255,
    "N512.sharp.mlx_peak_bytes" : 10616844,
    "N512.sharp.sampled_candidate_max_error" : 0.27576752575921737,
    "N512.sharp.sampled_footprint_bytes" : 132072216,
    "N512.sharp.sampled_reference_max_error" : 0.27576752575921737,
    "N512.smooth.mlx_peak_bytes" : 10616846,
    "N512.smooth.sampled_candidate_max_error" : 0.0004918296705092792,
    "N512.smooth.sampled_footprint_bytes" : 132072216,
    "N512.smooth.sampled_reference_max_error" : 0.0004918296705092792,
    "N513.sharp.mlx_peak_bytes" : 10715150,
    "N513.sharp.sampled_candidate_max_error" : 0.2857440446965581,
    "N513.sharp.sampled_footprint_bytes" : 144687896,
    "N513.sharp.sampled_reference_max_error" : 0.2857440446965581,
    "N513.smooth.mlx_peak_bytes" : 10715136,
    "N513.smooth.sampled_candidate_max_error" : 0.0005137167518327532,
    "N513.smooth.sampled_footprint_bytes" : 144687896,
    "N513.smooth.sampled_reference_max_error" : 0.0005137167518327532,
    "N8.sharp.mlx_peak_bytes" : 259584,
    "N8.sharp.sampled_candidate_max_error" : 0.37247132082458534,
    "N8.sharp.sampled_footprint_bytes" : 83854080,
    "N8.sharp.sampled_reference_max_error" : 0.37247132082458534,
    "N8.smooth.mlx_peak_bytes" : 259584,
    "N8.smooth.sampled_candidate_max_error" : 0.0033500709728116473,
    "N8.smooth.sampled_footprint_bytes" : 83854080,
    "N8.smooth.sampled_reference_max_error" : 0.0033500709728116473,
    "N9.sharp.mlx_peak_bytes" : 259584,
    "N9.sharp.sampled_candidate_max_error" : 0.12075542157983987,
    "N9.sharp.sampled_footprint_bytes" : 83854080,
    "N9.sharp.sampled_reference_max_error" : 0.12075542157983987,
    "N9.smooth.mlx_peak_bytes" : 259584,
    "N9.smooth.sampled_candidate_max_error" : 0.0028378944983400434,
    "N9.smooth.sampled_footprint_bytes" : 83854080,
    "N9.smooth.sampled_reference_max_error" : 0.0028378944983400434,
    "N9216.sharp.mlx_peak_bytes" : 191102976,
    "N9216.sharp.sampled_candidate_max_error" : 0.2450203548250518,
    "N9216.sharp.sampled_footprint_bytes" : 644793400,
    "N9216.sharp.sampled_reference_max_error" : 0.2450203548250518,
    "N9216.smooth.mlx_peak_bytes" : 191102976,
    "N9216.smooth.sampled_candidate_max_error" : 0.0004676726474114963,
    "N9216.smooth.sampled_footprint_bytes" : 581059592,
    "N9216.smooth.sampled_reference_max_error" : 0.0004676726474114963
  },
  "name" : "optimization-vision-capacity-query256",
  "passed" : true
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower/attempt.json

SHA-256 `c6c072174bd22437a9cfff5d6b1cdba560fe76fd7df831c8a2ea39b04c986e2f`.

````text
{
  "started_at": "2026-09-07T23:53:36.699457+00:00",
  "deadline_utc": "2026-09-08T00:11:00Z",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "vision-query-tile-tower",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
      "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13931577344,
    "swapins": 44129700,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   216831.\nPages active:                                 945133.\nPages inactive:                               992534.\nPages speculative:                            112068.\nPages throttled:                                   0.\nPages wired down:                             236919.\nPages purgeable:                               19900.\n\"Translation faults\":                    16707518112.\nPages copy-on-write:                       853204500.\nPages zero filled:                       22506844340.\nPages reactivated:                        3727863416.\nPages purged:                               78858895.\nFile-backed pages:                            613585.\nAnonymous pages:                             1436150.\nPages stored in compressor:                  1390726.\nPages occupied by compressor:                 581871.\nDecompressions:                           1274637082.\nCompressions:                             1597453396.\nPageins:                                  8049676138.\nPageouts:                                   11386434.\nSwapins:                                    44129700.\nSwapouts:                                   77538158.\nPages tagged:                                 177047.\nPages tagged resident:                        138274.\nPages tagged compressed:                       38773.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7819.\nPages tag-storage free:                          329.\nPages tag-storage non-tag pageable:            90148.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6141376.\nTagged compressions:                        12379920.\nTagged decompressions:                      11436556.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-07T23:53:36.699331+00:00",
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
  "preparation_sha256": "32e7aa3ff113f92a63624aac95bd1fa6f0ae5997eeeaf63fb8aad73fb9599fc4",
  "classification": "Current native correctness only under original900second allowance.13GB startup/10GB owned/3GB live headroom. No serving performance, capacity, default or installation claim."
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower/qualification.json

SHA-256 `9881e16798d2d582fabe4b5b1dc4a574b0d7bd6e1a7ce1255f1007b416a989cd`.

````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "c6c072174bd22437a9cfff5d6b1cdba560fe76fd7df831c8a2ea39b04c986e2f",
  "exit_code": 0,
  "assertions": 47,
  "exact_tower_comparisons": 7,
  "elapsed_seconds": 11.259839333999999,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13922631680,
    "swapins": 44129700,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   161265.\nPages active:                                 945541.\nPages inactive:                              1045638.\nPages speculative:                            113934.\nPages throttled:                                   0.\nPages wired down:                             236973.\nPages purgeable:                               19901.\n\"Translation faults\":                    16707790079.\nPages copy-on-write:                       853236787.\nPages zero filled:                       22511889554.\nPages reactivated:                        3727863623.\nPages purged:                               78858895.\nFile-backed pages:                            668604.\nAnonymous pages:                             1436509.\nPages stored in compressor:                  1390655.\nPages occupied by compressor:                 581839.\nDecompressions:                           1274637153.\nCompressions:                             1597453396.\nPageins:                                  8049729428.\nPageouts:                                   11386434.\nSwapins:                                    44129700.\nSwapouts:                                   77538158.\nPages tagged:                                 177088.\nPages tagged resident:                        138315.\nPages tagged compressed:                       38773.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7819.\nPages tag-storage free:                          384.\nPages tag-storage non-tag pageable:            90093.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6141376.\nTagged compressions:                        12379920.\nTagged decompressions:                      11436556.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "3d9d10f6e14592429833ce860fba18f93c0636562e11b7a1a5ef4e474f501219",
  "vision_proofs_unchanged": true,
  "execution_receipt_sha256": "def1a0f16113d865befb4a9ae9e7664ea1de9702a4ec4d6e917bd067a70b4f64"
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower/receipt.json

SHA-256 `def1a0f16113d865befb4a9ae9e7664ea1de9702a4ec4d6e917bd067a70b4f64`.

````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "c6c072174bd22437a9cfff5d6b1cdba560fe76fd7df831c8a2ea39b04c986e2f",
  "exit_code": 0,
  "assertions": 47,
  "exact_tower_comparisons": 7,
  "elapsed_seconds": 11.259839333999999,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13922631680,
    "swapins": 44129700,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   161265.\nPages active:                                 945541.\nPages inactive:                              1045638.\nPages speculative:                            113934.\nPages throttled:                                   0.\nPages wired down:                             236973.\nPages purgeable:                               19901.\n\"Translation faults\":                    16707790079.\nPages copy-on-write:                       853236787.\nPages zero filled:                       22511889554.\nPages reactivated:                        3727863623.\nPages purged:                               78858895.\nFile-backed pages:                            668604.\nAnonymous pages:                             1436509.\nPages stored in compressor:                  1390655.\nPages occupied by compressor:                 581839.\nDecompressions:                           1274637153.\nCompressions:                             1597453396.\nPageins:                                  8049729428.\nPageouts:                                   11386434.\nSwapins:                                    44129700.\nSwapouts:                                   77538158.\nPages tagged:                                 177088.\nPages tagged resident:                        138315.\nPages tagged compressed:                       38773.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7819.\nPages tag-storage free:                          384.\nPages tag-storage non-tag pageable:            90093.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6141376.\nTagged compressions:                        12379920.\nTagged decompressions:                      11436556.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "3d9d10f6e14592429833ce860fba18f93c0636562e11b7a1a5ef4e474f501219"
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332/vision-query-tile-tower/stdout.txt

SHA-256 `3d9d10f6e14592429833ce860fba18f93c0636562e11b7a1a5ef4e474f501219`.

````text
{
  "items" : [
    {
      "name" : "256x256: exact patch geometry",
      "passed" : true
    },
    {
      "name" : "256x256: executed query tile count",
      "passed" : true
    },
    {
      "name" : "256x256: complete finite trained-tower output",
      "passed" : true
    },
    {
      "name" : "256x256: exact repeated tower output",
      "passed" : true
    },
    {
      "name" : "256x256: trained-tower same-dtype agreement",
      "passed" : true
    },
    {
      "name" : "256x256: bounded tower and reference footprint",
      "passed" : true
    },
    {
      "name" : "2080x32: exact patch geometry",
      "passed" : true
    },
    {
      "name" : "2080x32: executed query tile count",
      "passed" : true
    },
    {
      "name" : "2080x32: complete finite trained-tower output",
      "passed" : true
    },
    {
      "name" : "2080x32: exact repeated tower output",
      "passed" : true
    },
    {
      "name" : "2080x32: trained-tower same-dtype agreement",
      "passed" : true
    },
    {
      "name" : "2080x32: bounded tower and reference footprint",
      "passed" : true
    },
    {
      "name" : "4128x32: exact patch geometry",
      "passed" : true
    },
    {
      "name" : "4128x32: executed query tile count",
      "passed" : true
    },
    {
      "name" : "4128x32: complete finite trained-tower output",
      "passed" : true
    },
    {
      "name" : "4128x32: exact repeated tower output",
      "passed" : true
    },
    {
      "name" : "4128x32: trained-tower same-dtype agreement",
      "passed" : true
    },
    {
      "name" : "4128x32: bounded tower and reference footprint",
      "passed" : true
    },
    {
      "name" : "4128x64: exact patch geometry",
      "passed" : true
    },
    {
      "name" : "4128x64: executed query tile count",
      "passed" : true
    },
    {
      "name" : "4128x64: complete finite trained-tower output",
      "passed" : true
    },
    {
      "name" : "4128x64: exact repeated tower output",
      "passed" : true
    },
    {
      "name" : "4128x64: trained-tower same-dtype agreement",
      "passed" : true
    },
    {
      "name" : "4128x64: bounded tower and reference footprint",
      "passed" : true
    },
    {
      "name" : "512x512: exact patch geometry",
      "passed" : true
    },
    {
      "name" : "512x512: executed query tile count",
      "passed" : true
    },
    {
      "name" : "512x512: complete finite trained-tower output",
      "passed" : true
    },
    {
      "name" : "512x512: exact repeated tower output",
      "passed" : true
    },
    {
      "name" : "512x512: trained-tower same-dtype agreement",
      "passed" : true
    },
    {
      "name" : "512x512: bounded tower and reference footprint",
      "passed" : true
    },
    {
      "name" : "832x864: exact patch geometry",
      "passed" : true
    },
    {
      "name" : "832x864: executed query tile count",
      "passed" : true
    },
    {
      "name" : "832x864: complete finite trained-tower output",
      "passed" : true
    },
    {
      "name" : "832x864: exact repeated tower output",
      "passed" : true
    },
    {
      "name" : "832x864: trained-tower same-dtype agreement",
      "passed" : true
    },
    {
      "name" : "832x864: bounded tower and reference footprint",
      "passed" : true
    },
    {
      "name" : "1024x1024: exact patch geometry",
      "passed" : true
    },
    {
      "name" : "1024x1024: executed query tile count",
      "passed" : true
    },
    {
      "name" : "1024x1024: complete finite trained-tower output",
      "passed" : true
    },
    {
      "name" : "1024x1024: exact repeated tower output",
      "passed" : true
    },
    {
      "name" : "1024x1024: trained-tower same-dtype agreement",
      "passed" : true
    },
    {
      "name" : "1024x1024: bounded tower and reference footprint",
      "passed" : true
    },
    {
      "name" : "1536x1536: exact patch geometry",
      "passed" : true
    },
    {
      "name" : "1536x1536: executed query tile count",
      "passed" : true
    },
    {
      "name" : "1536x1536: complete finite trained-tower output",
      "passed" : true
    },
    {
      "name" : "1536x1536: exact repeated tower output",
      "passed" : true
    },
    {
      "name" : "1536x1536: bounded tower and reference footprint",
      "passed" : true
    }
  ],
  "measurements" : {
    "1024x1024.candidate_mlx_peak_bytes" : 1130260984,
    "1024x1024.candidate_sampled_footprint_bytes" : 1397032496,
    "1024x1024.mlx_peak_bytes" : 1791289850,
    "1024x1024.reference_cosine" : 1,
    "1024x1024.reference_exact_bytes" : 1,
    "1024x1024.sampled_footprint_bytes" : 2461222448,
    "1024x1024.worst_token_cosine" : 1,
    "1536x1536.candidate_mlx_peak_bytes" : 1419930104,
    "1536x1536.candidate_sampled_footprint_bytes" : 1840907944,
    "1536x1536.mlx_peak_bytes" : 1419930104,
    "1536x1536.sampled_footprint_bytes" : 1840842408,
    "2080x32.candidate_mlx_peak_bytes" : 918179320,
    "2080x32.candidate_sampled_footprint_bytes" : 1053836752,
    "2080x32.mlx_peak_bytes" : 930798202,
    "2080x32.reference_cosine" : 1,
    "2080x32.reference_exact_bytes" : 1,
    "2080x32.sampled_footprint_bytes" : 1063699944,
    "2080x32.worst_token_cosine" : 1,
    "256x256.candidate_mlx_peak_bytes" : 929681914,
    "256x256.candidate_sampled_footprint_bytes" : 1025377696,
    "256x256.mlx_peak_bytes" : 930009594,
    "256x256.reference_cosine" : 1,
    "256x256.reference_exact_bytes" : 1,
    "256x256.sampled_footprint_bytes" : 1026688440,
    "256x256.worst_token_cosine" : 1,
    "4128x32.candidate_mlx_peak_bytes" : 927862264,
    "4128x32.candidate_sampled_footprint_bytes" : 1111901696,
    "4128x32.mlx_peak_bytes" : 952187578,
    "4128x32.reference_cosine" : 1,
    "4128x32.reference_exact_bytes" : 1,
    "4128x32.sampled_footprint_bytes" : 1130857984,
    "4128x32.worst_token_cosine" : 1,
    "4128x64.candidate_mlx_peak_bytes" : 959384356,
    "4128x64.candidate_sampled_footprint_bytes" : 1181926936,
    "4128x64.mlx_peak_bytes" : 1022708538,
    "4128x64.reference_cosine" : 1,
    "4128x64.reference_exact_bytes" : 1,
    "4128x64.sampled_footprint_bytes" : 1197786648,
    "4128x64.worst_token_cosine" : 1,
    "512x512.candidate_mlx_peak_bytes" : 956508664,
    "512x512.candidate_sampled_footprint_bytes" : 1165149720,
    "512x512.mlx_peak_bytes" : 1021135674,
    "512x512.reference_cosine" : 1,
    "512x512.reference_exact_bytes" : 1,
    "512x512.sampled_footprint_bytes" : 1193412120,
    "512x512.worst_token_cosine" : 1,
    "832x864.candidate_mlx_peak_bytes" : 1057483256,
    "832x864.candidate_sampled_footprint_bytes" : 1310459488,
    "832x864.mlx_peak_bytes" : 1394991290,
    "832x864.reference_cosine" : 1,
    "832x864.reference_exact_bytes" : 1,
    "832x864.sampled_footprint_bytes" : 1756677656,
    "832x864.worst_token_cosine" : 1
  },
  "name" : "optimization-vision-tower-capacity-query256",
  "passed" : true
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse/attempt.json

SHA-256 `771b5f6417dc0771b979fb606fa981ca9cc27100391aef6471ee8832c96246e8`.

````text
{
  "started_at": "2026-09-08T00:08:26.781556+00:00",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "image-reuse",
    "--tokens",
    "256",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
      "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "deadline_utc": "2026-09-08T02:30:00Z",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 16084451328,
    "swapins": 44129728,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   431444.\nPages active:                                 834108.\nPages inactive:                               836982.\nPages speculative:                              2895.\nPages throttled:                                   0.\nPages wired down:                             235125.\nPages purgeable:                                2306.\n\"Translation faults\":                    16726638620.\nPages copy-on-write:                       855483111.\nPages zero filled:                       22530402521.\nPages reactivated:                        3728219646.\nPages purged:                               78903709.\nFile-backed pages:                            547967.\nAnonymous pages:                             1126018.\nPages stored in compressor:                  1638029.\nPages occupied by compressor:                 744265.\nDecompressions:                           1274680872.\nCompressions:                             1597792076.\nPageins:                                  8050540886.\nPageouts:                                   11387840.\nSwapins:                                    44129728.\nSwapouts:                                   77538158.\nPages tagged:                                 174439.\nPages tagged resident:                        131864.\nPages tagged compressed:                       42575.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7581.\nPages tag-storage free:                          395.\nPages tag-storage non-tag pageable:            90320.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6713088.\nTagged compressions:                        12385735.\nTagged decompressions:                      11438543.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-08T00:08:26.781423+00:00",
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
  "preparation_sha256": "3479e62de5ffbe569b3bd0f9c63953a3cfec0bbaea197ba8b6237b1e43b5f974",
  "classification": "Original native correctness workload on current V304. No performance, memory-capacity, adaptive-policy adoption or automatic activation claim."
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse/receipt.json

SHA-256 `b7013145b09f9639d0f08e8e72331f1dee4ae4d5f28b2fbb3cfb38fca1be8073`.

````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "771b5f6417dc0771b979fb606fa981ca9cc27100391aef6471ee8832c96246e8",
  "exit_code": 0,
  "assertions": 76,
  "elapsed_seconds": 1.2427545,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 16246751232,
    "swapins": 44129728,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   386386.\nPages active:                                 833889.\nPages inactive:                               880434.\nPages speculative:                              4798.\nPages throttled:                                   0.\nPages wired down:                             235069.\nPages purgeable:                                2306.\n\"Translation faults\":                    16726722551.\nPages copy-on-write:                       855487211.\nPages zero filled:                       22530483779.\nPages reactivated:                        3728219650.\nPages purged:                               78903709.\nFile-backed pages:                            602931.\nAnonymous pages:                             1116190.\nPages stored in compressor:                  1638025.\nPages occupied by compressor:                 744261.\nDecompressions:                           1274680876.\nCompressions:                             1597792076.\nPageins:                                  8050593940.\nPageouts:                                   11387840.\nSwapins:                                    44129728.\nSwapouts:                                   77538158.\nPages tagged:                                 174392.\nPages tagged resident:                        131817.\nPages tagged compressed:                       42575.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7581.\nPages tag-storage free:                          429.\nPages tag-storage non-tag pageable:            90286.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6713088.\nTagged compressions:                        12385735.\nTagged decompressions:                      11438543.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "e651d90a731a3f5d3ff48022247f967966c87e84cf80267d507643bff23b940a"
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/image-reuse/stdout.txt

SHA-256 `e651d90a731a3f5d3ff48022247f967966c87e84cf80267d507643bff23b940a`.

````text
{
  "items" : [
    {
      "name" : "fixture encoded-byte identities differ",
      "passed" : true
    },
    {
      "name" : "unchanged preparation permits prefix reuse",
      "passed" : true
    },
    {
      "name" : "changed attention arithmetic invalidates prefix",
      "passed" : true
    },
    {
      "name" : "query tiling has an independent prefix identity",
      "passed" : true
    },
    {
      "name" : "identical query tiling retains prefix identity",
      "passed" : true
    },
    {
      "name" : "query tiling remains off by default",
      "passed" : true
    },
    {
      "name" : "query tile parser selects only the bounded candidate",
      "passed" : true
    },
    {
      "name" : "unsupported vision combination rejected: [\"SLOTSTREAM_OPT_VISION_QUERY_TILE\": \"-1\"]",
      "passed" : true
    },
    {
      "name" : "unsupported vision combination rejected: [\"SLOTSTREAM_OPT_VISION_QUERY_TILE\": \"512\"]",
      "passed" : true
    },
    {
      "name" : "unsupported vision combination rejected: [\"SLOTSTREAM_OPT_VISION_QUERY_TILE\": \"true\"]",
      "passed" : true
    },
    {
      "name" : "unsupported vision combination rejected: [\"SLOTSTREAM_OPT_VISION_PADDING\": \"128\", \"SLOTSTREAM_OPT_VISION_QUERY_TILE\": \"256\"]",
      "passed" : true
    },
    {
      "name" : "partial image retains processor identity",
      "passed" : true
    },
    {
      "name" : "partial image rejects changed attention arithmetic",
      "passed" : true
    },
    {
      "name" : "consumed 0: real tower encodes",
      "passed" : true
    },
    {
      "name" : "consumed 0: duplicate reuse",
      "passed" : true
    },
    {
      "name" : "consumed 0: prefix skip",
      "passed" : true
    },
    {
      "name" : "consumed 0: run count",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 0: start",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 0: shape",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 0: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 0: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 1: start",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 1: shape",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 1: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 1: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 2: start",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 2: shape",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 2: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 0 run 2: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 33: real tower encodes",
      "passed" : true
    },
    {
      "name" : "consumed 33: duplicate reuse",
      "passed" : true
    },
    {
      "name" : "consumed 33: prefix skip",
      "passed" : true
    },
    {
      "name" : "consumed 33: run count",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 0: start",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 0: shape",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 0: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 0: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 1: start",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 1: shape",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 1: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 1: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 2: start",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 2: shape",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 2: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 33 run 2: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 65: real tower encodes",
      "passed" : true
    },
    {
      "name" : "consumed 65: duplicate reuse",
      "passed" : true
    },
    {
      "name" : "consumed 65: prefix skip",
      "passed" : true
    },
    {
      "name" : "consumed 65: run count",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 0: start",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 0: shape",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 0: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 0: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 1: start",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 1: shape",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 1: dtype",
      "passed" : true
    },
    {
      "name" : "consumed 65 run 1: exact features",
      "passed" : true
    },
    {
      "name" : "consumed 195: real tower encodes",
      "passed" : true
    },
    {
      "name" : "consumed 195: duplicate reuse",
      "passed" : true
    },
    {
      "name" : "consumed 195: prefix skip",
      "passed" : true
    },
    {
      "name" : "consumed 195: run count",
      "passed" : true
    },
    {
      "name" : "processor fixture changes geometry",
      "passed" : true
    },
    {
      "name" : "changed processor: both encoded",
      "passed" : true
    },
    {
      "name" : "changed processor: no stale reuse",
      "passed" : true
    },
    {
      "name" : "changed processor: run count",
      "passed" : true
    },
    {
      "name" : "changed processor run 0: start",
      "passed" : true
    },
    {
      "name" : "changed processor run 0: shape",
      "passed" : true
    },
    {
      "name" : "changed processor run 0: dtype",
      "passed" : true
    },
    {
      "name" : "changed processor run 0: exact features",
      "passed" : true
    },
    {
      "name" : "changed processor run 1: start",
      "passed" : true
    },
    {
      "name" : "changed processor run 1: shape",
      "passed" : true
    },
    {
      "name" : "changed processor run 1: dtype",
      "passed" : true
    },
    {
      "name" : "changed processor run 1: exact features",
      "passed" : true
    },
    {
      "name" : "request-local cache is released",
      "passed" : true
    },
    {
      "name" : "same request still deduplicates",
      "passed" : true
    },
    {
      "name" : "changed image changes features",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-image-reuse",
  "passed" : true
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/mtp-work-integrated/attempt.json

SHA-256 `58487eaa44eb9850104baa60eb5e9102a64804adfd0ed08c7f6339608b24bddb`.

````text
{
  "started_at": "2026-09-08T00:03:28.742789+00:00",
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "mtp-work-integrated",
    "--tokens",
    "256",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
      "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "deadline_utc": "2026-09-08T02:30:00Z",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13394788352,
    "swapins": 44129728,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   422883.\nPages active:                                 908185.\nPages inactive:                               929193.\nPages speculative:                             24352.\nPages throttled:                                   0.\nPages wired down:                             236459.\nPages purgeable:                               23366.\n\"Translation faults\":                    16722919817.\nPages copy-on-write:                       855045967.\nPages zero filled:                       22525809626.\nPages reactivated:                        3728087455.\nPages purged:                               78867433.\nFile-backed pages:                            371304.\nAnonymous pages:                             1490426.\nPages stored in compressor:                  1368480.\nPages occupied by compressor:                 564043.\nDecompressions:                           1274652191.\nCompressions:                             1597489502.\nPageins:                                  8050247819.\nPageouts:                                   11386882.\nSwapins:                                    44129728.\nSwapouts:                                   77538158.\nPages tagged:                                 175516.\nPages tagged resident:                        133585.\nPages tagged compressed:                       41931.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7634.\nPages tag-storage free:                          451.\nPages tag-storage non-tag pageable:            90211.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6646848.\nTagged compressions:                        12383501.\nTagged decompressions:                      11436967.\n"
  },
  "thermal_prelaunch": {
    "provider": "Foundation NSProcessInfo",
    "observed_at_utc": "2026-09-08T00:03:28.742660+00:00",
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
  "preparation_sha256": "3479e62de5ffbe569b3bd0f9c63953a3cfec0bbaea197ba8b6237b1e43b5f974",
  "classification": "Original native correctness workload on current V304. No performance, memory-capacity, adaptive-policy adoption or automatic activation claim."
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/mtp-work-integrated/receipt.json

SHA-256 `332ed1a4d25eed50aac1c711e98e923c6f70cab4d8f37ecccbb5dddf58c2cb16`.

````text
{
  "passed": true,
  "completed": true,
  "qualified": true,
  "attempt_sha256": "58487eaa44eb9850104baa60eb5e9102a64804adfd0ed08c7f6339608b24bddb",
  "exit_code": 0,
  "assertions": 284,
  "elapsed_seconds": 76.35558745899999,
  "proofs_unchanged": true,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 16214294528,
    "swapins": 44129728,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   440429.\nPages active:                                 883600.\nPages inactive:                               872699.\nPages speculative:                              9379.\nPages throttled:                                   0.\nPages wired down:                             235823.\nPages purgeable:                                 410.\n\"Translation faults\":                    16724245447.\nPages copy-on-write:                       855198733.\nPages zero filled:                       22528007717.\nPages reactivated:                        3728195327.\nPages purged:                               78894439.\nFile-backed pages:                            548803.\nAnonymous pages:                             1216875.\nPages stored in compressor:                  1490870.\nPages occupied by compressor:                 642765.\nDecompressions:                           1274660007.\nCompressions:                             1597623333.\nPageins:                                  8050479553.\nPageouts:                                   11387418.\nSwapins:                                    44129728.\nSwapouts:                                   77538158.\nPages tagged:                                 173182.\nPages tagged resident:                        129977.\nPages tagged compressed:                       43205.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7595.\nPages tag-storage free:                          790.\nPages tag-storage non-tag pageable:            89911.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6849600.\nTagged compressions:                        12384891.\nTagged decompressions:                      11437080.\n"
  },
  "remaining_jobs": [],
  "cleanup_complete": true,
  "within_reservation": true,
  "stdout_sha256": "29540a4690f0fbc5547bc78ebbb8b305b40e53bfec3f416d76f22d7822df3abf"
}

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/mtp-work-integrated/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/mtp-work-integrated/stdout.txt

SHA-256 `29540a4690f0fbc5547bc78ebbb8b305b40e53bfec3f416d76f22d7822df3abf`.

````text
{
  "items" : [
    {
      "name" : "depth 1, sampled false, limit 1, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, first: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, first: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, tail: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, tail: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, both: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 1, both: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, first: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, first: first entry reused each round",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, tail: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, tail: terminal output needs zero drafts",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, tail: one target position suffices",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, tail: final emission stays pending",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, both: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, both: terminal output needs zero drafts",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, both: one target position suffices",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 2, both: final emission stays pending",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, first: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, first: first entry reused each round",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, tail: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, both: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled false, limit 5, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, first: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, first: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, tail: sampled fallback preserves draft work",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, tail: sampled fallback preserves target shape",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, tail: sampled fallback preserves verification count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, tail: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, tail: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, both: sampled fallback preserves draft work",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, both: sampled fallback preserves target shape",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, both: sampled fallback preserves verification count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, both: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 1, both: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, first: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, first: first entry reused each round",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, tail: sampled fallback preserves draft work",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, tail: sampled fallback preserves target shape",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, tail: sampled fallback preserves verification count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, tail: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, both: sampled fallback preserves draft work",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, both: sampled fallback preserves target shape",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, both: sampled fallback preserves verification count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, both: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 2, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, first: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, first: first entry reused each round",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, tail: sampled fallback preserves draft work",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, tail: sampled fallback preserves target shape",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, tail: sampled fallback preserves verification count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, tail: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, both: sampled fallback preserves draft work",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, both: sampled fallback preserves target shape",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, both: sampled fallback preserves verification count",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, both: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 1, sampled true, limit 5, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, first: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, first: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, tail: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, tail: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, both: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 1, both: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, first: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, first: first entry reused each round",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, tail: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, tail: terminal output needs zero drafts",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, tail: one target position suffices",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, tail: final emission stays pending",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, both: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, both: terminal output needs zero drafts",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, both: one target position suffices",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 2, both: final emission stays pending",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, first: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, first: first entry reused each round",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, tail: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, both: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled false, limit 5, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, first: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, first: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, tail: sampled fallback preserves draft work",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, tail: sampled fallback preserves target shape",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, tail: sampled fallback preserves verification count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, tail: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, tail: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, both: sampled fallback preserves draft work",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, both: sampled fallback preserves target shape",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, both: sampled fallback preserves verification count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, both: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 1, both: no terminal verification",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, first: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, first: first entry reused each round",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, tail: sampled fallback preserves draft work",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, tail: sampled fallback preserves target shape",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, tail: sampled fallback preserves verification count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, tail: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, both: sampled fallback preserves draft work",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, both: sampled fallback preserves target shape",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, both: sampled fallback preserves verification count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, both: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 2, both: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, first: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, first: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, first: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, first: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, first: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, first: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, first: first entry reused each round",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, tail: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, tail: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, tail: sampled fallback preserves draft work",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, tail: sampled fallback preserves target shape",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, tail: sampled fallback preserves verification count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, tail: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, tail: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, tail: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, tail: reconciliation covers committed positions",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, both: emitted count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, both: stable fixture output",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, both: sampled fallback preserves draft work",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, both: sampled fallback preserves target shape",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, both: sampled fallback preserves verification count",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, both: retained committed prefix",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, both: aligned draft",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, both: consumed prefix within emitted tokens",
      "passed" : true
    },
    {
      "name" : "depth 3, sampled true, limit 5, both: reconciliation covers committed positions",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-mtp-work-integrated",
  "passed" : true
}

````

## /tmp/slotstream-optimization-execution/current-static-acceptance-v336/manifest.json

SHA-256 `13a402db68673b6b155878eb4eb2e4869dae5c5a32ca5f2f24704a0b11609d29`.

````text
{
  "passed": true,
  "protocol_sha256": "0225ff5f2242a8b34eee979e25796c3f63d5d2c8a679c3310facfc317ab5438e",
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12433506304,
    "swapins": 44129700,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   247318.\nPages active:                                1013221.\nPages inactive:                              1009466.\nPages speculative:                              4158.\nPages throttled:                                   0.\nPages wired down:                             237579.\nPages purgeable:                               19988.\n\"Translation faults\":                    16709183035.\nPages copy-on-write:                       853363256.\nPages zero filled:                       22520049643.\nPages reactivated:                        3727865342.\nPages purged:                               78860660.\nFile-backed pages:                            491575.\nAnonymous pages:                             1535270.\nPages stored in compressor:                  1374487.\nPages occupied by compressor:                 573783.\nDecompressions:                           1274644964.\nCompressions:                             1597453396.\nPageins:                                  8049731210.\nPageouts:                                   11386524.\nSwapins:                                    44129700.\nSwapouts:                                   77538158.\nPages tagged:                                 177024.\nPages tagged resident:                        138309.\nPages tagged compressed:                       38715.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7819.\nPages tag-storage free:                          327.\nPages tag-storage non-tag pageable:            90150.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6128448.\nTagged compressions:                        12379920.\nTagged decompressions:                      11436614.\n"
  },
  "exit_code": 0,
  "elapsed_seconds": 299.35828399999997,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 13374373888,
    "swapins": 44129728,
    "swapouts": 77538158,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   416943.\nPages active:                                 925045.\nPages inactive:                               924487.\nPages speculative:                             17942.\nPages throttled:                                   0.\nPages wired down:                             236597.\nPages purgeable:                               36810.\n\"Translation faults\":                    16722823130.\nPages copy-on-write:                       855032309.\nPages zero filled:                       22525749754.\nPages reactivated:                        3728087079.\nPages purged:                               78866906.\nFile-backed pages:                            362554.\nAnonymous pages:                             1504920.\nPages stored in compressor:                  1368999.\nPages occupied by compressor:                 564067.\nDecompressions:                           1274652128.\nCompressions:                             1597489502.\nPageins:                                  8050247061.\nPageouts:                                   11386882.\nSwapins:                                    44129728.\nSwapouts:                                   77538158.\nPages tagged:                                 175643.\nPages tagged resident:                        133712.\nPages tagged compressed:                       41931.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7634.\nPages tag-storage free:                          513.\nPages tag-storage non-tag pageable:            90149.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6646848.\nTagged compressions:                        12383501.\nTagged decompressions:                      11436967.\n"
  },
  "candidate_unchanged": true,
  "drivers_unchanged": true,
  "remaining_jobs": [],
  "model_lock_free": true
}

````

## /tmp/slotstream-optimization-execution/current-static-acceptance-v336/protocol.json

SHA-256 `0225ff5f2242a8b34eee979e25796c3f63d5d2c8a679c3310facfc317ab5438e`.

````text
{
  "classification": "Complete weights-free static gate on exact V304. Includes the original small C/Swift transport-fixture compiles; no Slotstream rebuild, model, serving benchmark or resource qualification.",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
      "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "wrapper_sha256": "fe26b0b0cb09a2410134d2aba52654f3e482ec704b80bad08bbd66876e22eb5b",
  "command": [
    "bash",
    "/Users/carlos/Projects/slotstream/Tools/static_gates.sh"
  ],
  "environment": {
    "SLOTSTREAM_TEST_BINARY": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream"
  },
  "deadline_unix": 1788834600.0,
  "policy": {
    "startup_reclaimable_bytes": 7000000000,
    "minimum_live_reclaimable_bytes": 3000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "maximum_build_seconds": 600,
    "sample_interval_seconds": 0.2,
    "stop_on_new_swapouts": false
  },
  "drivers": {
    "Tools/all_hit_replay.py": "24401912f3fd8b2e70105c5095c993c131b6ffbe27add38f9268c9e1dc0ed9a1",
    "Tools/api_generation.py": "cdb5b81e785b5e96e4f81e4fa5e2fe48a3b32f20b149952a9ee7f9a5c68b2eaf",
    "Tools/api_generation_test.py": "d2bd5494d9a73ec76806f6aad9344e76554fa8777721f4dd525f9478fe4f535b",
    "Tools/api_robustness.sh": "a7397ac2f5df3a7eb8f7e1578daef51124c1c7fdabd0526c13518b8048984a96",
    "Tools/api_test.sh": "77bd216be56f3a309cff380c649af47edaff2d1d17e9dd9ad4f10fd489664c11",
    "Tools/brain_gates.sh": "7f32151567f0e64f8ed9619e5551bc7716aaf24be6b19fc0c62496b1dd44df2b",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/build_identity_test.py": "04facecff6ee3b65c261678131e5c3b4e64e5aff630b7df00c7414439e2776ec",
    "Tools/cache_policy_confirmation.py": "a2d0108f30b64b4838064ba0d450e49a28c8aca43ad0a41dcd1c30760e475748",
    "Tools/cache_policy_probe.py": "93ce0ec7cb98cd16cca46509089864d6267c3e080a2172615beadd3f69632a81",
    "Tools/cachesim.py": "0f6c304c69f88d49b1e3e699a0230d4c90de937baffc02aec52bf38429004f38",
    "Tools/claims_gate.py": "12a76b03bdf78ca0d71ea00a757684d19a137582b432875d10a670f583dcbced",
    "Tools/compute_islands.py": "9c25400b28ad425bba9e752138a967882d573432e6093d4b898da6dca266b985",
    "Tools/consumer_smoke.sh": "5e039b3f03844f26df5ccd223edf5bee4320cd670b60dcd1b62a2953c18a7c70",
    "Tools/consumer_smoke_test.py": "0fd6aea920c671d3bece420013a9ebc526ed9dd48d55bcdb8f83f6e7badc6bf1",
    "Tools/context_acceptance.py": "6791b61a99763d5b0ecfc510aef669fac982fb7cd5ff6dfc78fe61b5ea7864ba",
    "Tools/context_acceptance_test.py": "9a57bf61a50f2a3187ecc887110c77b3a7d161eea9dc7b7a8abe368fbee21aeb",
    "Tools/context_contracts_test.py": "635c6dcfabd89a0868ceacf00fe305d165fa8720ebf71b8fd147c70838ccbc1c",
    "Tools/context_gates.py": "712a328c906011b2cd07dff0b5225e5b45089b6c6effd4b1a151c90db3d587e4",
    "Tools/context_overflow_probe.py": "3bf2633e583898d2c60ed8630409ccf314d352352ecf342bcb72d0705fde52c8",
    "Tools/context_proxy.py": "825f99c7a16677398bc8c04f3ace63dc98f18fa98c17b9265ac1b79a35b11203",
    "Tools/context_qualification.py": "094b567ccc21613444cfd0edf098967bb758af42652be8ba70762ae313cbbf34",
    "Tools/context_qualification_checks.py": "4f26ef66a0444d5d7f13b37464bcc25f21ceb9c0e3c71f0bc038f128667583d9",
    "Tools/context_resource_gates.py": "b1fb297f645d231250915ce7467856c36221c31885fd9426364637597d57b003",
    "Tools/context_window_matrix.py": "b24e904c0d64b61e08ad33779505445c51f2a00de8e556f14167042390495104",
    "Tools/context_window_matrix_test.py": "37f59dd7674175cf53e87f2bb2663a27c732eed5f9382508b578e96fa9cdef52",
    "Tools/coverage-floor.json": "6eca5d16f69f3bb1a4cd88d1036fa074d1232ed8d8d630cda80c91c309c0b828",
    "Tools/coverage.sh": "bc52a65b95dadbd15391f9a636287611f1117e8decf56e14e189da2d7abd90b6",
    "Tools/coverage_ratchet.py": "9bf8c570b83d6a89acd1b005d1ed051bb8125c5281424c0b294d3b46cd753a06",
    "Tools/coverage_ratchet_test.py": "ed632f76757cc7dfb346de92d1c8b00fcbd6596b4363d093beebbfc67af43a93",
    "Tools/dbmd_install.sh": "8b892df4f2232db0fac42b8bf1585371e652d13c9cd9094c8190e3f957e58e1e",
    "Tools/debug0_ref.py": "930d258ed12c6d60e7db4506a25677e4fe60e8da07cddb244c7740ebb66ca6f1",
    "Tools/e2e_release.sh": "b4762272eca921614d46ec6a4d4bcc28e939bcd22639f7e9bbf5fca0ceaedca7",
    "Tools/e2e_release_test.py": "acc7930f33ce45c93ef89f7568e8c380e4a6cfc453a64fcc93a2c84287b84152",
    "Tools/expert_layout_probe.py": "a76bcba5750c58d8aad0188569c3c53e9721476009034c802a7f21f9d35d3ec2",
    "Tools/expert_layout_probe_test.py": "e6e9363cc3afc9081cb9f00ff7adc6fc77fc1c1a12b9580b32f0cd27c1b32f9d",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860",
    "Tools/fixtures/context-acceptance-v1.json": "7bca4c4ad9a8ea9d0b7496e83e769c92eac901d8d11fc4ce059b07b83c256e55",
    "Tools/fixtures/context-default-v1.json": "c6e55a5b0ab8a4f143b99c8ec0691d528cf3b3f9b5a21d14ab493c886b053558",
    "Tools/fixtures/optimization/qualification/actual-default-one-token.json": "8481bffb4721fbd594eca609506308480e7979a486c327732cba6ff138daf26b",
    "Tools/fixtures/optimization/qualification/complete-repeat.json": "9b8308d23621b55ae70dfb34258571ed00a97c9ea2932127aa787d438085ba6e",
    "Tools/fixtures/optimization/qualification/distinct-tail.json": "7d80ab65e1ed821e24922c050afc4ff24b83f9e3a2b560383efd4e7868aad59e",
    "Tools/fixtures/optimization/qualification/mtp-resource.json": "5a0c57424e2097b5ec7b4199dd9ae28d40e24f6c4eef24d13098f3ce8d652613",
    "Tools/fixtures/optimization/qualification/sampled-short.json": "ec97a77e98417def8f7489b5fd58ded65790659e15ebe6f4d2328c8688d76a7a",
    "Tools/fixtures/optimization/qualification/short-one.json": "5c736b2eec31378f0b3d2beb64d20561569ce8dfd765e363afde72b0755278a9",
    "Tools/fixtures/optimization/qualification/soak.json": "0b79f271e4dbaabe77802a54a125c371ee4519848c2e01e5019bd5d8a36a065b",
    "Tools/fixtures/optimization/qualification/unique-prose.json": "6831b8f47138d175f28ac9716bacaa8c937515a970df709393004bff84a45c35",
    "Tools/fixtures/optimization/qualification/unique-with-retention.json": "0b2593dab6a12e10226dd94d60c43d40b085160b2c23680b79545d7fe41dbb2d",
    "Tools/fx_gates.sh": "035f425d0becb017f9c8e2fd71bdabb52e61f17d69c10ef5194688bb8f20a20e",
    "Tools/fx_scenarios.py": "f8418efaac463b0969f9518f909aafcfb30c9732606b4bcfc811b45a49a66d3e",
    "Tools/gateway_client_gate.mjs": "7a5b605d18d6044fa4d038d169ace4b6541222a3d98977f2b773e204c34864dd",
    "Tools/gdn_profile.py": "f4483f1c78ffc9f70439688f3336abd41768458a87117950fc1b4f3e2879923e",
    "Tools/hermes_integration_gate.py": "517c4b7fbdc5a24bedb7924cb57051ec65b58d44d0c0df40e7119ab44e54b0f6",
    "Tools/indexer_score_probe.py": "b51796a075f6391b301cbe78eda3e82ac9378e16823e9ca48f0f1f97b166e8b0",
    "Tools/indexer_score_probe_test.py": "1cf32f1db801a0813c634888e0a942f6c3dc9abe92fbc538ce7772eb7891df1d",
    "Tools/installer_gates.sh": "ffcb88381decda386da186d82365b635a32fc2e01b8973fbddd6e39464154936",
    "Tools/installer_gates_binary_test.py": "a0017f16f6676bc0098e4cf01508d658611cbd0ffa6baf0ad490d7b90a2839d1",
    "Tools/llms_full.sh": "3f2c9694f274697a2eb63288e1ea7b0e774e82ffad1a9a9483f4ef2c9e7cbcef",
    "Tools/long_context_gate.py": "b7422f009eaf24b079c87cc3ed847840ea941e4a141d5357fc240ad5945a54ee",
    "Tools/memory_gate.py": "9d09d3aade7b1e1f9180f3779a651480f2d7b6ab194065820831c136c3c6cc9c",
    "Tools/monotonic_plan.py": "3ab76df40092ccab549a92ae2ef5ae457f7ad3ab8adc8512ee749ef1c05355bd",
    "Tools/mtp_convert.py": "22f58712346b67a35cdc0d7a4da45a665335ae9382e104156aff16e91b7b053d",
    "Tools/ngram_cache_probe.py": "01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7",
    "Tools/ngram_cache_probe_test.py": "05141ddb547bdd870fbc2e4d971caa2e1a84e121b9416b0da87ca84c739d9bb3",
    "Tools/ngram_lookahead_bench.py": "9492467ff3a03154da642f51848a9cbaedc02509f76ae78d3533868bbfd1d02f",
    "Tools/openai_tools_gate.py": "28f571e0f774f9717d6469a926083b17b3ec6b607cea1d72ec84d76912832357",
    "Tools/optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "Tools/optimization_build_test.py": "cfa7367792c17d4d8617ac2e16161043471714297355bfa0b0de508defea3c95",
    "Tools/optimization_campaign.py": "ae49f185713b26f0999b77126df0c480dda017f09f9b315a020b1693bf52d1c4",
    "Tools/optimization_campaign_test.py": "7d35ef74a8184224b2ec8aabb29f94c4f416c27bdae2d51ee7c794404e36745d",
    "Tools/optimization_check.py": "61d050207c1074131de4f5917bcfcc50373f9d105688ba0185c19febaa6f1462",
    "Tools/optimization_component.py": "cbdab6f194dbb8acdee13d5efc484aae4dd7aa3d8431d9033d77f1bd9785904a",
    "Tools/optimization_prerequisites_test.py": "215ab0cead0daafd4d95f469254870159c66b9d719997410838cea83c151d41b",
    "Tools/optimization_readiness.py": "56a654ab367b7eca3ee6ab0270641fb2af70ce2bd4a242b8036da506229f283c",
    "Tools/optimization_readiness_test.py": "6c963a9aec3be52975da24328a965b3778259a6372c691b3e6c9f32b92e63016",
    "Tools/optimization_results.py": "e2c5e813835792b1d0cfd28fb836528f556fb3d0219ea801570f2d00b7b9e8f3",
    "Tools/optimization_results_test.py": "05201a9fd044498ab578b6d63666eda6e675d77bb8e4f894603dc9401d384e14",
    "Tools/optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "Tools/optimization_serial_build_test.py": "b6b21d18f2a96522f034b246aa4be3b43f19f11cc178ea401992c54c519bc54a",
    "Tools/optimization_soak.py": "61ea2ddff2c8bb72ea6bdb226c96cdfe69ae086ab9bf8384f06f2a80f3907f0e",
    "Tools/optimization_soak_test.py": "3b61d9e63a6c5fbe79b618324b283826d51ab3085582200df4e276cb1befd0be",
    "Tools/packed_layout_build.py": "2f780a584bd0d5b461cfbf3cfc32b992ebc3480afb6bf78cb167af9ca8fba8ab",
    "Tools/parity_ref.py": "cb938f6215f1433bbc6eef2b8cc04a8a9cf9d5953f487347649637fa911abab6",
    "Tools/planner_gates.sh": "f869506fa2c7c4aa73ecf279a52b84103227a451a7a2e319d489eff30b150b29",
    "Tools/prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "Tools/prefill_bench.sh": "68a6695ab67766626394637dcdaaee1db53fc06077a4ed7310e8a006bfa5de66",
    "Tools/prefill_bench_test.py": "fa263527173e3d139e868b12e19f9417478380466094b35e0726381cbe5245b7",
    "Tools/process_cleanup_checks.py": "2de6d823a4850662fda621cbe2df43aa869731e40530e7f286c9a2f289e6a982",
    "Tools/projections.py": "90a02090829c0dae88d69846f8a0f55bd2b039e3f12c549aa58b175f4e842355",
    "Tools/pull_bench_linux.sh": "2062f832627a33edc8103559c74e647b6aeb1145e0043d3ab310c2205de304eb",
    "Tools/quality_probe.sh": "cfa2ae2995acd9dd0d416ff2d9e71ec538ab0b259ebbb30324c4ad28c6fca3ba",
    "Tools/reference/config.json": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
    "Tools/reference/generation_config.json": "e70c136c1b78ddc1fb0905bac8e733a4dc448d4f852a5dd75143fffc70be550e",
    "Tools/reference/make_mtp_fixture.py": "7d54481d25ffdacb7ef52b3ef345a817d4c0783e6340224edebe587a9d8f0d52",
    "Tools/reference/model.safetensors.index.json": "072cc2c60b8af6cce82a387f62e39ca88754c3a6fccae0816dd21bb89d27470d",
    "Tools/reference/mtp_ref.py": "f28827ac0409fe58b9c255f16add5ecb00b17a2310a3521d75a677f2d4a84f24",
    "Tools/reference/qwen4_exp.py": "6fae4ec0decbf77ca4a4571de683bc5580ec75e84325ecb432dfcd2fc81df75e",
    "Tools/reference/tensor_shapes.json": "302d9926b8d1770c1a11f1fdd9d199b136865117f427dcb29e512c7d6dd4c780",
    "Tools/rope_component.py": "f8e56f6d33c98cc50a64efe67b5c184bb0a4ebdff26ca4aa3e34f5434fb202ca",
    "Tools/run_model.py": "00ea3727aed92fcc17df1e16f4284f8840145558cf776e08429eb1884eb7b8c0",
    "Tools/sampler_gates.sh": "7e781d7593224973597906e7031c7ab143ab4dff540dd4bf86542e52cb7ed144",
    "Tools/sampler_gates_test.py": "89f1a34df9dbb37e904c1b32e15e72cd9fc5c01a955097abaeb2ef6c2d435fc7",
    "Tools/sampler_ref.py": "faa87e6db26853b275322d18cab1994430315e19783b984ac28e1cdaf34395c3",
    "Tools/selected_attention_probe.py": "e4e5a4a4980f4f20dddca7c8a7633c3d4b66dfc2034a4a83f1b791e3f5497328",
    "Tools/serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb",
    "Tools/slotbench.py": "d27b4d18f75f423443f1b4a8dd4da50965fa1885d531029f0c7f0baecdf24262",
    "Tools/slotbench2.py": "0d38017db9e74141df23664083a0c520458e3a531d5d865ad19ab6e23bdd2711",
    "Tools/slotbench3.py": "7518329fcb4217760689f5c8bc5cbd268c5220ca0a38f2289af9c7d84c8e2e05",
    "Tools/slotpack/checks.py": "59a598a3d77b9fa38117e4437fd11aa52982fcb833000a62c25b2e990d4165b3",
    "Tools/slotpack/cli_checks.py": "a67f5d06d09a713051fea673562a95367e76f8cfb4ac8fe3b1592781c39470d7",
    "Tools/slotpack/coverage.py": "c53cb1fd611ab6fc690db0fc1db1b816e4d0e5379420874545b8760bfd9fe644",
    "Tools/slotpack/download_checks.py": "7958ef42e29b4885319186a4bccd6e5dd3e2b20cbea9cbbf971554bf353657ef",
    "Tools/slotpack/embed.py": "9c0d98858b54353584ab92abd45b85ed3894e0004e38f1e2945d8ab6d6ee8c94",
    "Tools/slotpack/fetch_build_inputs.py": "a6f5b52aad619d6aef58e527ca42d7743e1e45c568dd2287c7f80800c18c31c1",
    "Tools/slotpack/full_pull.py": "b925415dae87b6f240d875e67fe5a9684534e6d96dd953424082fe80c54ecb96",
    "Tools/slotpack/memory_checks.py": "e0494906ac1a8673ee41ec0f60e5971626afc958e4caa49dc29090187e1447f0",
    "Tools/slotpack/pack.py": "1bdaef49bb324f37bb64c7c453f9ec724c9f96c3d1f579ff6f3e9417e1d510cd",
    "Tools/slotpack/public_probe.py": "33dc5a003b4f59356e208f4330370c905a51fb515ddccf27a9dae471cd76d10a",
    "Tools/slotpack/publish_hf.py": "e9a7a07198bd3eddc1dadd94d8dd8729b8528282992c049eb00dcbcf93cf190e",
    "Tools/slotpack/publish_hf_checks.py": "76a3f41abe9b16239a9d32e6fb4b50f4f8e323076d04803a31f02f4162aa587c",
    "Tools/slotpack/publish_r2.py": "cdd39ae06637800dc02e84c948c5b2c50c2c9abec71673f299dfb8d1112b9684",
    "Tools/slotpack/raw_checks.py": "772f4132088582fa9642f3dd86f800be3c8f005e9145c827b6692ee4f6386d94",
    "Tools/star_history.py": "58801509a122439429f675295041e35aae89504a638ff31eb76fe97979d7152f",
    "Tools/static_gates.sh": "a9b1afc3fa887f28e46e5adfff213a7ef8b021529b36005517a16f8879c36876",
    "Tools/static_gates_binary_test.py": "a5abc42cdfd95f0c569009da7f52f28cb9fab9561eda4387edc6970e5f25abdf",
    "Tools/thermal_readiness.py": "461dc8513bf8a23c7af5d999edf3c2ed1cbdb3d80d7869124603fa5babade048",
    "Tools/thermal_readiness_test.py": "5eb2d5d27258b2b1250d2588ec332472d18b65171122340ecd8cccb4f90b9467",
    "Tools/trace_convert.py": "8ea22dda841860f0f829203c4ece5f68c515c13a39f2c6122bc309a2150f0079",
    "Tools/trace_routers.py": "32ff38f4f0f02d9679dcd16fc57f64694836416baf666075151e9f208be23da6",
    "Tools/verify.sh": "4eb4c0990bb7a92141f9510800457985a9ed0c40b4db601d36acfd30cd9d65e4",
    "Tools/verify_binary_test.py": "b9caffe691a91a3ef8eb44aa543bc5d5c95354199f8537b5b73eeab91acbbdbd",
    "Tools/verify_corrections.py": "2cf6f0818a3ab39aac948ba78b5f5e3ac5dfc1b8037bb7f48caa7c16fa198a0b",
    "Tools/vision_attention_probe.py": "1575d36927dba5f4ff52d1549a96d93e7c6c190c2c5e8d94644628c672fbe346",
    "Tools/vision_capacity_gate.py": "851a598f05d34cbaf597e56a593de3bf2a9f492a069d77d93ba6f5a7e0a42040",
    "Tools/vision_capacity_gate_test.py": "4cb266cbc6859ba053529f0ddb792199dc2a4e35af798a4d9cd636a123122412",
    "Tools/vision_qualification.py": "ce719b37ec53672639389ca75a481cbe9a80adc6585557fa5312ca35188c13a2",
    "Tools/vision_qualification_test.py": "7f23e984ece5cfc2e8b51a829b97335366d9b02a0fd95fbf95568d6c05cdf8b0",
    "Tools/vision_ref.py": "fa62575c947392f990841e6ac90656737eb67edb000ab369d7b7a0f66a05ef29",
    "Tools/vision_serving.py": "6afd42ebefd87619d3ccb6dc96172366483ea94f7e86ecc0215a7bdf3c6b76fb"
  }
}

````

## /tmp/slotstream-optimization-execution/current-static-acceptance-v336/run.py

SHA-256 `fe26b0b0cb09a2410134d2aba52654f3e482ec704b80bad08bbd66876e22eb5b`.

````text
from pathlib import Path
import datetime,json,os,re,signal,sys,time
ROOT=Path('/Users/carlos/Projects/slotstream');P=Path(__file__).parent;sys.path.insert(0,str(ROOT/'Tools'))
from prefill_bench import digest,preflight,vm_snapshot
from serve_bench import verified_build,competing_jobs
from optimization_serial_build import guarded_run
from optimization_readiness import pressure_snapshot,require_normal
B=ROOT/'.build/optimization/joined-state-eval-build-v304/candidate/slotstream'
DEADLINE=datetime.datetime.fromisoformat(sys.argv[1].replace('Z','+00:00')).timestamp() if len(sys.argv)>1 else time.time()+620
remaining=int(DEADLINE-time.time()-20)
if remaining<60:raise RuntimeError('insufficient remaining reserved static interval')
S={'classification':'Complete weights-free static gate on exact V304. Includes the original small C/Swift transport-fixture compiles; no Slotstream rebuild, model, serving benchmark or resource qualification.',
 'build':verified_build(B),'wrapper_sha256':digest(Path(__file__)),
 'command':['bash',str(ROOT/'Tools/static_gates.sh')],
 'environment':{'SLOTSTREAM_TEST_BINARY':str(B)},'deadline_unix':DEADLINE,
 'policy':{'startup_reclaimable_bytes':7_000_000_000,'minimum_live_reclaimable_bytes':3_000_000_000,'maximum_owned_rss_bytes':3_000_000_000,'maximum_build_seconds':min(600,remaining),'sample_interval_seconds':.2,'stop_on_new_swapouts':False},
 'drivers':{str(f.relative_to(ROOT)):digest(f) for f in sorted((ROOT/'Tools').rglob('*')) if f.is_file() and f.suffix in ['.py','.sh','.mjs','.json'] and '__pycache__' not in f.parts}}
(P/'protocol.json').write_text(json.dumps(S,indent=2)+'\n');r={'passed':False,'protocol_sha256':digest(P/'protocol.json')};started=time.monotonic()
def interrupted(number,_frame):raise KeyboardInterrupt(f'static check interrupted by signal{number}')
signal.signal(signal.SIGINT,interrupted);signal.signal(signal.SIGTERM,interrupted)
def snapshot():
 v=vm_snapshot();require_normal(pressure_snapshot());return v
saved={k:v for k,v in os.environ.items() if k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
try:
 r['before']=preflight(7);snapshot();assert not competing_jobs()
 for k in saved:os.environ.pop(k,None)
 os.environ.update(S['environment'])
 with (P/'stdout.txt').open('w') as out,(P/'stderr.txt').open('w') as err:
  result=guarded_run(S['command'],cwd=ROOT,stdout=out,stderr=err,record_path=P/'memory.json',snapshot=snapshot,policy=S['policy'],classification=S['classification'])
 report=(P/'stdout.txt').read_text();r['exit_code']=result.returncode
 r['passed']=result.returncode==0 and report.rstrip().endswith('STATIC GATES PASS')
except BaseException as e:r['error']=f'{type(e).__name__}: {e}'
finally:
 for k in list(os.environ):
  if k.startswith(('SLOTSTREAM_','SS_DEBUG')):os.environ.pop(k,None)
 os.environ.update(saved);r['elapsed_seconds']=time.monotonic()-started
 (P/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
 for n,f in {'after':vm_snapshot,'candidate_unchanged':lambda:verified_build(B)==S['build'],
  'drivers_unchanged':lambda:all(digest(ROOT/n)==h for n,h in S['drivers'].items()),'remaining_jobs':competing_jobs,'model_lock_free':lambda:bool(preflight(0))}.items():
  try:r[n]=f()
  except BaseException as e:r.setdefault('cleanup_errors',{})[n]=f'{type(e).__name__}: {e}'
 r['passed']=bool(r['passed'] and not r.get('cleanup_errors') and r.get('candidate_unchanged') and r.get('drivers_unchanged') and not r.get('remaining_jobs') and r.get('model_lock_free') and time.time()<=DEADLINE)
 (P/'manifest.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({k:v for k,v in r.items() if k not in ['before','after']}),flush=True)
raise SystemExit(0 if r['passed'] else 1)

````

## /tmp/slotstream-optimization-execution/current-static-acceptance-v336/stderr.txt

SHA-256 `5ea6406452aeb7913def2eca39232b48d6b0f5aa6d4d9aab8dcb1451ed05f683`.

````text
.....................
----------------------------------------------------------------------
Ran 21 tests in 14.974s

OK
..........
----------------------------------------------------------------------
Ran 10 tests in 9.206s

OK
................
----------------------------------------------------------------------
Ran 16 tests in 8.129s

OK
........
----------------------------------------------------------------------
Ran 8 tests in 9.153s

OK
.........
----------------------------------------------------------------------
Ran 9 tests in 8.295s

OK
....
----------------------------------------------------------------------
Ran 4 tests in 1.053s

OK
............................
----------------------------------------------------------------------
Ran 28 tests in 38.088s

OK
.........
----------------------------------------------------------------------
Ran 9 tests in 0.026s

OK
...
----------------------------------------------------------------------
Ran 3 tests in 3.106s

OK
....
----------------------------------------------------------------------
Ran 4 tests in 0.035s

OK
......
----------------------------------------------------------------------
Ran 6 tests in 0.005s

OK
..............
----------------------------------------------------------------------
Ran 14 tests in 1.361s

OK
....
----------------------------------------------------------------------
Ran 4 tests in 0.000s

OK
........
----------------------------------------------------------------------
Ran 8 tests in 0.001s

OK
.................................................
----------------------------------------------------------------------
Ran 49 tests in 0.017s

OK
......
----------------------------------------------------------------------
Ran 6 tests in 0.022s

OK
......
----------------------------------------------------------------------
Ran 6 tests in 0.004s

OK
.....
----------------------------------------------------------------------
Ran 5 tests in 0.000s

OK
.....
----------------------------------------------------------------------
Ran 5 tests in 0.002s

OK
.....
----------------------------------------------------------------------
Ran 5 tests in 0.009s

OK
..............................
----------------------------------------------------------------------
Ran 30 tests in 2.259s

OK
...........
----------------------------------------------------------------------
Ran 11 tests in 0.076s

OK
.............
----------------------------------------------------------------------
Ran 13 tests in 1.003s

OK
...........
----------------------------------------------------------------------
Ran 11 tests in 0.079s

OK
.......
----------------------------------------------------------------------
Ran 7 tests in 0.009s

OK

######################################################################## 100.0%

######################################################################## 100.0%

######################################################################## 100.0%

````

## /tmp/slotstream-optimization-execution/current-static-acceptance-v336/stdout.txt

SHA-256 `86f2e28e6fa72319c25d3c75f7f386e603c9e5837774b9e4109296a0485de144`.

````text
coverage ratchet checks pass
{"phase": "starting", "prompt_tokens": 16, "reclaimable_gb": 20.0}
{"prompt_tokens": 16, "passed": false, "error": "ValueError: capacity rung was incomplete, aborted or over its plan"}
{"phase": "waiting for build reservation", "seconds": 0.0}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
{"starting": "paired/unique-prose"}
{"starting": "paired/sampled-short"}
{"starting": "paired/mtp-resource"}
{"starting": "paired/distinct-tail"}
{"starting": "paired/complete-repeat"}
{"starting": "paired/unique-with-retention"}
{"starting": "paired/actual-default-one-token"}
{"starting": "soak/off"}
{"starting": "soak/on"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-plain"}
{"starting": "native/combined-mtp"}
{"starting": "native/read-failure-serving"}
{"starting": "paired/short-one"}
llms-full.txt is current
warning LOG_UNKNOWN_KIND log.md:124 — log entry kind `change` is not recognized
    hint: use one of: ingest, create, update, delete, rename, link, validate, index-rebuild, contradiction
1 issue(s): 0 error(s), 1 warning(s), 0 info
MEASUREMENTS.md is current
PLAN.md is current
claims gate: 95 needle checks, 0 failures
BRAIN GATES PASS
dequant_row.txt: OK
layer_0.bin: OK
layer_1.bin: OK
layer_2.bin: OK
layer_3.bin: OK
ngram_ids.txt: OK
tokens.txt: OK
PASS  request VM counters are monotonic
PASS  request VM reclaimable bytes are available
PASS  process physical footprint is readable
PASS  process RSS high-water is readable
PASS  lifetime RSS is separately readable
PASS  monotonic duration is nonnegative
PASS  footprint sampler includes endpoints
PASS  automatic platform-qualified optimization defaults
PASS  qualified platform keeps the complete joint candidate
PASS  unqualified platform 0 keeps portable work and original rotation
PASS  unqualified platform 1 keeps portable work and original rotation
PASS  unqualified platform 2 keeps portable work and original rotation
PASS  unqualified platform 3 keeps portable work and original rotation
PASS  unqualified platform 4 keeps portable work and original rotation
PASS  unqualified platform 5 keeps portable work and original rotation
PASS  unqualified platform 6 keeps portable work and original rotation
PASS  unqualified platform 7 keeps portable work and original rotation
PASS  unqualified platform 8 keeps portable work and original rotation
PASS  unqualified platform 9 keeps portable work and original rotation
PASS  unqualified platform 10 keeps portable work and original rotation
PASS  unqualified platform 11 keeps portable work and original rotation
PASS  unqualified platform 12 keeps portable work and original rotation
PASS  platform selection is deterministic
PASS  explicit kernel qualification remains available
PASS  explicit kernel fallback remains available
PASS  absent overrides retain the selected default family
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPACT_STATE
PASS  explicit one restores only SLOTSTREAM_OPT_COMPACT_STATE
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPACT_MTP
PASS  explicit one restores only SLOTSTREAM_OPT_COMPACT_MTP
PASS  explicit zero disables only SLOTSTREAM_OPT_FINAL_FORWARD
PASS  explicit one restores only SLOTSTREAM_OPT_FINAL_FORWARD
PASS  explicit zero disables only SLOTSTREAM_OPT_SAMPLER_THRESHOLD
PASS  explicit one restores only SLOTSTREAM_OPT_SAMPLER_THRESHOLD
PASS  explicit zero disables only SLOTSTREAM_OPT_SAMPLER_DRAW
PASS  explicit one restores only SLOTSTREAM_OPT_SAMPLER_DRAW
PASS  explicit zero disables only SLOTSTREAM_OPT_OUTPUT_QUEUE
PASS  explicit one restores only SLOTSTREAM_OPT_OUTPUT_QUEUE
PASS  explicit zero disables only SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR
PASS  explicit one restores only SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR
PASS  explicit zero disables only SLOTSTREAM_OPT_COMPLETE_PROMPT
PASS  explicit one restores only SLOTSTREAM_OPT_COMPLETE_PROMPT
PASS  explicit zero disables only SLOTSTREAM_OPT_SHARED_ROPE
PASS  explicit one restores only SLOTSTREAM_OPT_SHARED_ROPE
PASS  explicit zero disables only SLOTSTREAM_OPT_FUSED_ROPE
PASS  explicit one restores only SLOTSTREAM_OPT_FUSED_ROPE
PASS  explicit zeros restore the complete reference inference family
PASS  explicit numeric zero disables inherited prefix retention
PASS  non-optimization environment leaves the family intact
PASS  selected defaults still reject invalid override ["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"]
PASS  selected defaults still reject invalid override ["SLOTSTREAM_OPT_TYPO": "0"]
PASS  valid inherited read scope retains its prerequisites
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_COMPACT_STATE
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_COMPACT_MTP
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_LAYER_WORKSPACE
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_INDEXER_TILES
PASS  inherited scope rejects disabled prerequisite SLOTSTREAM_OPT_PLE_TILES
PASS  scope can be disabled while retaining its other independent work
PASS  public environment function value keeps its signature and automatic default
PASS  typed override enables compaction
PASS  malformed override refused
PASS  unknown optimization refused
PASS  invalid read scope -1 refused
PASS  invalid read scope 1 refused
PASS  invalid read scope 16384 refused
PASS  invalid read scope bad refused
PASS  unbounded read scope refused
PASS  explicit workspace tile is recorded
PASS  unbounded workspace tile refused
PASS  terminal output needs no speculative draft
PASS  draft count fits remaining output
PASS  public depth cannot exceed recording cap
PASS  negative remaining output cannot underflow
PASS  prefix cache reaches its four-entry bound
PASS  an identical history replaces instead of duplicating an entry
PASS  a miss evicts before allocating a fifth state
PASS  a smaller live token ceiling evicts immediately
PASS  held GB includes fixed recurrent state
PASS  growing hit still reuses its state
PASS  growing hit reserves future state before allocation
PASS  huge reservation safely misses
PASS  huge reservation releases held state
PASS  capacity reservation still hits
PASS  capacity growth reserves bytes before reuse
PASS  saturated byte reservation evicts safely
PASS  identical bytes hash alike
PASS  different bytes do not
PASS  the same image at the same offset matches
PASS  a swapped image does not
PASS  an entry ending inside a run still matches that run
PASS  a text-only entry rejects a prompt with an image inside its range
PASS  an image beyond the entry's range is irrelevant to the match
PASS  a vision conversation is held, not discarded
PASS  the same ids with a different picture miss
PASS  the text-only splice never sees a vision entry
PASS  prefix splice chooses the longest retained extension
PASS  prefix splice is strict, not an identical-history match
PASS  prefix splice lookup does not consume the retained state
PASS  a disabled prefix cache offers no splice
PASS  shard listing works through a symlinked model dir
PASS  8.1 GB plan stays inside its target
PASS  10.0 GB plan stays inside its target
PASS  16.0 GB plan stays inside its target
PASS  30.0 GB plan stays inside its target
RUNTIME CHECK PASS
PASS  matching file is accepted
PASS  same-size corruption is rejected
PASS  exact Content-Range is accepted
PASS  wrong range start is rejected
PASS  wrong range total is rejected
PASS  unknown range total is rejected
PASS  every pinned file has a digest
PASS  the draft head is pinned as the one optional file
PASS  an absent optional file is not a repair; an absent required one is
PASS  an empty directory reads as missing
PASS  missing needs the required model
PASS  status carries free disk
PASS  bytesToFetch agrees with required files
PASS  a missing copy is not ready
PULL CHECK PASS
{"bf16_predictions":16711680,"centers":1000000,"roundtrips":60,"malformed_inputs":39583,"pass":true}
MANIFEST CHECKS PASS
{"name": "normal", "pass_": true, "seconds": 0.315, "returncode": 0}
{"name": "cache-miss-reporting", "pass_": true, "seconds": 0.032, "returncode": 0}
{"name": "redirect", "pass_": true, "seconds": 0.031, "returncode": 0}
{"name": "bad-object-fallback", "pass_": true, "seconds": 0.03, "returncode": 0}
{"name": "missing-object-raw-fallback", "pass_": true, "seconds": 0.032, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.015, "returncode": 1}
{"name": "raw-ignored-range-fails", "pass_": true, "seconds": 0.013, "returncode": 1}
{"name": "optional-absent", "pass_": true, "seconds": 0.026, "returncode": 0}
{"name": "optional-corrupt-and-unavailable", "pass_": true, "seconds": 0.026, "returncode": 0}
{"name": "bad-object-fails", "pass_": true, "seconds": 0.013, "returncode": 1}
{"name": "retry-after", "pass_": true, "seconds": 0.029, "returncode": 0}
{"name": "hugging-face-rate-limit", "pass_": true, "seconds": 5.518, "returncode": 0}
{"name": "cancel-during-hugging-face-rate-limit", "pass_": true, "seconds": 0.529, "returncode": 1}
{"name": "transient-retry", "pass_": true, "seconds": 5.369, "returncode": 0}
{"name": "wrong-length-fallback", "pass_": true, "seconds": 11.392, "returncode": 0}
{"name": "short-body-fallback", "pass_": true, "seconds": 36.332, "returncode": 0}
{"name": "content-encoding-fallback", "pass_": true, "seconds": 36.22, "returncode": 0}
{"name": "cancel-preserves-progress", "pass_": true, "seconds": 1.472, "returncode": 1}
{"name": "damaged-resumed-chunk-rejected", "pass_": true, "seconds": 0.027, "returncode": 1}
{"name": "damaged-resumed-chunk-repair", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "resume", "pass_": true, "seconds": 0.026, "returncode": 0}
{"name": "already-installed", "pass_": true, "seconds": 0.014, "returncode": 0}
{"name": "valid-symlinks-reused", "pass_": true, "seconds": 0.013, "returncode": 0}
{"name": "corruption-seed", "pass_": true, "seconds": 0.024, "returncode": 0}
{"name": "same-size-final-repair", "pass_": true, "seconds": 0.017, "returncode": 0}
{"name": "invalid-resume-map", "pass_": true, "seconds": 0.028, "returncode": 0}
{"name": "forged-complete-map-without-parts", "pass_": true, "seconds": 0.029, "returncode": 0}
{"name": "oversized-map-is-discarded", "pass_": true, "seconds": 0.029, "returncode": 0}
{"name": "part-symlink-rejected", "pass_": true, "seconds": 0.006, "returncode": 1}
{"name": "part-hardlink-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
{"name": "part-fifo-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
{"name": "concurrent-writer-rejected", "pass_": true, "seconds": 0.005, "returncode": 1}
ALL HTTP CHECKS PASS
{"name": "raw-multichunk", "pass_": true, "seconds": 0.754, "returncode": 0}
{"name": "raw-installed-no-http", "pass_": true, "seconds": 0.268, "returncode": 0}
{"name": "raw-source-fallback-missing", "pass_": true, "seconds": 0.33, "returncode": 0}
{"name": "raw-source-fallback-wrong-range", "pass_": true, "seconds": 0.335, "returncode": 0}
{"name": "raw-source-fallback-encoding", "pass_": true, "seconds": 40.815, "returncode": 0}
{"name": "raw-source-fallback-ignore-range", "pass_": true, "seconds": 0.327, "returncode": 0}
{"name": "raw-wrong-range-fails", "pass_": true, "seconds": 0.023, "returncode": 1}
{"name": "raw-corrupt-final-rejected", "pass_": true, "seconds": 0.169, "returncode": 1}
{"name": "raw-optional-inflight-writers", "pass_": true, "seconds": 0.209, "returncode": 0}
{"name": "raw-cancel", "pass_": true, "seconds": 3.311, "returncode": 1}
{"name": "raw-resume", "pass_": true, "seconds": 0.34, "returncode": 0}
{"name": "raw-same-size-repair", "pass_": true, "seconds": 0.454, "returncode": 0}
ALL RAW HTTP CHECKS PASS
SUSTAINED MEMORY PASS 306774016 bytes peak RSS
SLOTPACK GATES PASS
PASS  48GB pristine: 33.0 GB target and starts quiet
PASS  48GB busy: clamped to 15.4 GB, sized-down note
PASS  16GB pristine: 9.8 GB target, no notes
PASS  16GB busy: refuses an unphysical minimum allocation
PASS  8GB Mac: refuses an unphysical minimum allocation
PASS  128GB auto stops at the knee, not at 70% of RAM
PASS  128GB explains the memory it left on the table
PASS  128GB: --memory-gb still reaches full residency
PASS  --sim-ram alone plans instead of erroring
PASS  --max-ram-percent lowers the auto target
PASS  --max-ram-percent cannot exceed the knee
PASS  --max-ram-percent 0 refused
PASS  --max-ram-percent 150 refused
PASS  --max-ram-percent noted when outranked
PASS  more memory never plans slower (7-90 GB sweep)
PASS  explicit total target cannot authorize unavailable memory
PASS  --experts-per-layer 0 refused
PASS  --pool-gb 0 refused
PASS  --memory-gb below minimum refused
PASS  --memory-gb inf is a clean error
PASS  --pool-gb inf is a clean error
PASS  --pool-gb 1e300 saturates safely instead of trapping
PASS  --memory-gb 1e300 refuses physical overcommit without trapping
PASS  huge finite memory plan remains valid JSON
PASS  --sim-ram inf is a clean error
PASS  --sim-working-set inf is a clean error
PASS  --sim-available inf is a clean error
PASS  tiny pool raised to the floor, consistently
PASS  knob precedence noted, never silent
PASS  --model with no safetensors: clean error
PASS  --model with no safetensors: names the fix
PASS  MTP auto on a big quiet machine: knee + head = 34.6
PASS  MTP auto stays off on a 16GB machine
PASS  MTP auto on at --memory-gb 30 (137/layer after the charge)
PASS  MTP auto off at --memory-gb 20 (below the 120/layer floor)
PASS  --mtp on forces the head onto a small machine
PASS  --mtp off suppresses it everywhere
PASS  --mtp on without mtp.safetensors is a clean error
PASS  --mtp on cannot squeeze under the minimum target
PASS  --mtp gibberish refused
PASS  MTP charge visible in json peak
PASS  --model with unparseable config: clean error
PASS  invalid config arithmetic is rejected before it traps
PASS  --model with a corrupt safetensors header
PASS  safetensors dtype/shape byte mismatch rejected
PASS  safetensors header over 100MB rejected before allocation
PASS  --model with a different model's tensors
PASS  serve --max-context 0 refused before load
PASS  plan announces the context cap and the wait
PASS  doctor --json carries max_context_tokens + wait
PASS  serve --max-context above the ceiling names the ceiling, not a knob
PASS  doctor --max-context above the ceiling is the same clean error
PASS  a lower --max-context caps the reuse ceiling too
PASS  prefill-schedule: full model window obeys the product without exemptions
PASS  prefill-schedule agrees with the doctor wait for the same pass
PASS  prefill-schedule: a prefix hit reads only what is new
PASS  prefill-schedule --chunk 0 refused
PASS  context-check --tokens 4 refused before load
PASS  parity rejects an invalid layer count before model load
PASS  parity rejects malformed token ids without trapping
PASS  n-gram golden rejects malformed token ids without trapping
PASS  dequant golden rejects a negative row before model load
PASS  sampler golden rejects an empty vocabulary without trapping
PASS  sampler golden rejects a negative draw count without trapping
planner: passed 64, failed 0
INSTALLER GATES PASS
STATIC GATES PASS

````

## /tmp/slotstream-optimization-execution/vision-component-execution-v335/.run.lock

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/vision-component-execution-v335/disposition.json

SHA-256 `90540d4d2b4c3b439d53f88fb437cab66e1469a196a76d9a4b8c16179d33f11e`.

````text
{
  "status": "retired without execution",
  "at": "2026-09-07T23:55:46.874629+00:00",
  "reason": "The explicit peer handback raised real headroom above13GB. All three original V332 commands passed unchanged; the alternative component admission is unnecessary and must not duplicate them. No V335 model output exists.",
  "original_evidence": "/Users/carlos/Projects/slotstream/.build/optimization/current-vision-prerequisites-v332"
}
````

## /tmp/slotstream-optimization-execution/vision-component-execution-v335/preparation.json

SHA-256 `a0e280f530607d5bfa7afa66c73dc85f3741bd0559ad4084d448a0efb169e420`.

````text
{
  "format": "slotstream-vision-component-admission-v1",
  "executor_sha256": "03792c3bb0ddf60bd283f301069fb920b0e4494ba6cff6d8fc84cce2193acd83",
  "prior_executor_sha256": "1e8584753fbfa462d344d0582958889bdd6de8f4fe23de2d149a0a49eb53e363",
  "prior_preparation_sha256": "32e7aa3ff113f92a63624aac95bd1fa6f0ae5997eeeaf63fb8aad73fb9599fc4",
  "diagnostic_source_sha256": "0610214d34b5f763aa65c17013082914f176ca176483a77a422c5a87d592b591",
  "build": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
        "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "1532f45714ceb98a5adcfa31abd31f065493164f49d2ee3aac868d5d4080b04c",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "5d51636a62b376e74dfefab207fdd42da61436210973f714819c7cc11488a04d",
        "Sources/SlotstreamDiagnostics/Diagnostics+ResidentOverlap.swift": "c1e7b847cffa51939b0ae20027b289efcae5585a94ae5c1c751a66f110a25522",
        "Sources/SlotstreamDiagnostics/Diagnostics+RopePerformance.swift": "19d040f21391a1ea87831b73a8adf055a78aeafe9d902bd11ce22fd6a492d892",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6",
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
      "source_archive_sha256": "c823ca060a2ad4dae68616c74a7c20b109b912a2533577f94c1900f206477935",
      "binary_sha256": "af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "shared_proof": {
    "native": {
      "combined-plain": {
        "assertions": 242
      },
      "combined-mtp": {
        "assertions": 256
      },
      "read-failure-serving": {
        "assertions": 522
      }
    },
    "contract_sha256": "dd1bada1296a7e69a034e7c674a92779b7d0f362dcd3dcfdb2cd2308baf8dbd0",
    "artifacts": {
      "combined-plain": {
        "attempt.json": "7b1e711fa6ac8ec6fbc645ca94fe31732fced532878346ac734900fde76aa347",
        "evidence/manifest.json": "453557bf65cc56bc5856c6429ae254334c66755be32aa68a118ba6cd896e24d8",
        "evidence/memory.json": "2ce21c1ee8727c738601e2f0102ee2776339aca07423dfd4c9f9e116dba69400",
        "evidence/memory.samples.jsonl": "72176921e73519090bc7199de8053c4e2d3784e0ee041affd4a9763b46b3f3bb",
        "evidence/stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6",
        "evidence/stdout.txt": "8a0a9c741b2f596ad116e676c5117dd2b371055f8adc6364be409baca291e799",
        "receipt.json": "28a8f56d18448e48349b940149f52003bdc1ded4825c7c0863e81bb15ea02b00"
      },
      "combined-mtp": {
        "attempt.json": "2f71f158d1926a34f7aadb080daecc0505202b310986343f096241b8a31d9a80",
        "evidence/manifest.json": "b65d67d4111131a43a8d8009c2401ea120524030bcd46607d78690a19e5e2f68",
        "evidence/memory.json": "f5cdbd70ab3d9005489a3002fef1a2717a2c9013878eeb52d1a68cbcd4e3c237",
        "evidence/memory.samples.jsonl": "f2743063298d4394cbf22cacd07f562fbfee7760d712be76d3aa8e813a15e257",
        "evidence/stderr.txt": "ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6",
        "evidence/stdout.txt": "0e553341f8c0644b29f8018bfdc4c53d29dd91858f1f1745c2af5973da6f09b6",
        "receipt.json": "459d6dfd9b3bce20fd9c0f71ad1e14605f276a1667a2b1a1ef916d605571ae4c"
      },
      "read-failure-serving": {
        "attempt.json": "c6c91c72707e6a1b1d883b4036f29ebd01af37c681becf59f366bbdf480c1c1b",
        "evidence/manifest.json": "348eac2b9399dca5d7d321a8056d0da67b3df1d0aa802f786722eba7603575ad",
        "evidence/memory.json": "9221cbdf26d3e69b9276043fb8384066749eb7c5fbf6ac3652e9f722f95ad296",
        "evidence/memory.samples.jsonl": "3fe98e3969483d4863f049448d1f02c7f378367b14fdbb1229b55554e899cee8",
        "evidence/stderr.txt": "e4836406b1037cc8e75db6dd0c37940f44fe387423be5d44e1d0e78a606d2094",
        "evidence/stdout.txt": "05bd49a5e31271623694c33a46777651869f2ca23c515cafd822ebfb279f4127",
        "receipt.json": "13cf575020da6f2547ea668de284f6fc8aef908987b160e6dfa984d6eef386d1"
      }
    }
  },
  "commands": {
    "vision-query-tile-capacity": [
      "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "vision-query-tile-capacity",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ],
    "vision-query-tile-tower": [
      "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "vision-query-tile-tower",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ],
    "vision-query-maximum-reference": [
      "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
      "optimization-state-check",
      "--variant",
      "vision-query-maximum-reference",
      "--model",
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
      "--json"
    ]
  },
  "policies": {
    "vision-query-tile-capacity": {
      "startup_reclaimable_bytes": 5000000000,
      "minimum_live_reclaimable_bytes": 3000000000,
      "maximum_owned_rss_bytes": 2000000000,
      "sample_interval_seconds": 0.2,
      "maximum_build_seconds": 900,
      "stop_on_new_swapouts": true
    },
    "vision-query-tile-tower": {
      "startup_reclaimable_bytes": 8000000000,
      "minimum_live_reclaimable_bytes": 3000000000,
      "maximum_owned_rss_bytes": 5000000000,
      "sample_interval_seconds": 0.2,
      "maximum_build_seconds": 900,
      "stop_on_new_swapouts": true
    },
    "vision-query-maximum-reference": {
      "startup_reclaimable_bytes": 11100000000,
      "minimum_live_reclaimable_bytes": 3000000000,
      "maximum_owned_rss_bytes": 8100000000,
      "sample_interval_seconds": 0.2,
      "maximum_build_seconds": 900,
      "stop_on_new_swapouts": true
    }
  },
  "classification": "Vision-only correctness. Native 2/5/8.1GB footprint assertions unchanged; matching outer RSS caps plus 3GB startup/live headroom and immediate swapout stop. No language model or expert pool. Not a serving capacity or speed qualification. Original V332 full-model and V334 serving profiles remain unchanged."
}

````

## /tmp/slotstream-optimization-execution/vision-component-execution-v335/run.py

SHA-256 `03792c3bb0ddf60bd283f301069fb920b0e4494ba6cff6d8fc84cce2193acd83`.

````text
"""Current vision-only correctness with each diagnostic's actual memory cap.

The original commands, geometry, assertions and 900-second allowance remain.
Full-model integration and serving retain their separately frozen admissions.
"""
import argparse
import fcntl
import importlib.util
import json
from pathlib import Path

HERE = Path(__file__).resolve().parent
PRIOR = HERE.parent / 'current-vision-prerequisites-v332/run.py'
spec = importlib.util.spec_from_file_location('current_vision_native', PRIOR)
native = importlib.util.module_from_spec(spec)
spec.loader.exec_module(native)
core, c, require, digest = native.core, native.c, native.require, native.digest
OUT = native.ROOT / '.build/optimization/vision-component-execution-v335'
CAPS = {'vision-query-tile-capacity': 2_000_000_000,
        'vision-query-tile-tower': 5_000_000_000,
        'vision-query-maximum-reference': 8_100_000_000}
DIAGNOSTIC = native.ROOT / 'Sources/SlotstreamDiagnostics/Diagnostics+VisionCapacity.swift'


def policy(name):
    require(name in CAPS, 'only the three vision-only components use this profile')
    return dict(c.NATIVE_POLICY, maximum_build_seconds=native.SECONDS,
                startup_reclaimable_bytes=CAPS[name] + 3_000_000_000,
                maximum_owned_rss_bytes=CAPS[name], stop_on_new_swapouts=True)


def contract():
    value = native.load()
    return {'format': 'slotstream-vision-component-admission-v1',
            'executor_sha256': digest(Path(__file__)),
            'prior_executor_sha256': digest(PRIOR),
            'prior_preparation_sha256': digest(native.HERE / 'preparation.json'),
            'diagnostic_source_sha256': digest(DIAGNOSTIC),
            'build': value['build'], 'shared_proof': value['shared_proof'],
            'commands': {name: value['native_commands'][name] for name in CAPS},
            'policies': {name: policy(name) for name in CAPS},
            'classification': 'Vision-only correctness. Native 2/5/8.1GB footprint assertions unchanged; matching outer RSS caps plus 3GB startup/live headroom and immediate swapout stop. No language model or expert pool. Not a serving capacity or speed qualification. Original V332 full-model and V334 serving profiles remain unchanged.'}


def prepare():
    require(not OUT.exists(), 'component already attempted')
    c.write_new(HERE / 'preparation.json', contract())
    return {'prepared': True, 'model_execution': False, 'components': list(CAPS)}


def load():
    saved = c.read(HERE / 'preparation.json')
    require(saved == contract(), 'component source, build, prerequisite or resource contract changed')
    return saved


def run(name, deadline):
    selected = policy(name)
    core.allowance(deadline, native.SECONDS + 30)
    value = load()
    target = OUT / name
    require(not target.exists(), 'attempted component cannot retry')
    limit, before, thermal = core.readiness(deadline, native.SECONDS + 30,
                                           selected['startup_reclaimable_bytes'] / 1e9)
    attempt = {'started_at': core.now(), 'deadline_utc': deadline,
               'command': value['commands'][name], 'environment': {},
               'build': value['build'], 'policy': selected, 'before': before,
               'thermal_prelaunch': thermal,
               'preparation_sha256': digest(HERE / 'preparation.json'),
               'classification': value['classification']}
    def assess(code):
        load()
        require(code == 0, 'vision-only native process failed')
        return native.assess(name, c.read(target / 'stdout.txt'))
    result = core.execute(attempt['command'], target, native.SECONDS, selected,
                          assess, limit, attempt)
    try:
        load()
        result['component_proofs_unchanged'] = True
    except BaseException as error:
        result['component_proof_error'] = str(error)
        result.update(passed=False, completed=False, qualified=False)
    result['execution_receipt_sha256'] = digest(target / 'receipt.json')
    c.write_new(target / 'qualification.json', result)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command', choices=['prepare', 'status', 'native'])
    parser.add_argument('--name', choices=list(CAPS))
    parser.add_argument('--deadline')
    args = parser.parse_args()
    with (HERE / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        if args.command == 'prepare':
            result = prepare()
        elif args.command == 'status':
            load()
            result = {name: 'attempted' if (OUT / name).exists() else 'unrun' for name in CAPS}
        else:
            require(args.deadline is not None, 'explicit peer-granted deadline required')
            result = run(args.name, args.deadline)
    print(json.dumps(result, indent=2), flush=True)
    return 0 if args.command != 'native' or result.get('completed') else 1


if __name__ == '__main__':
    raise SystemExit(main())

````

## /tmp/slotstream-optimization-execution/vision-component-execution-v335/run_test.py

SHA-256 `4f6161290ab6a8c00502a86ad8e6eeaf02f11ab3cda730c043aed628791d2740`.

````text
import copy
import importlib.util
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('vision_components', HERE / 'run.py')
run = importlib.util.module_from_spec(spec)
spec.loader.exec_module(run)


class ComponentProfileTests(unittest.TestCase):
    def test_profiles_preserve_native_caps_and_three_gb_headroom(self):
        for name, cap in [('vision-query-tile-capacity', 2_000_000_000),
                          ('vision-query-tile-tower', 5_000_000_000),
                          ('vision-query-maximum-reference', 8_100_000_000)]:
            p = run.policy(name)
            self.assertEqual(p['maximum_owned_rss_bytes'], cap)
            self.assertEqual(p['startup_reclaimable_bytes'], cap + 3_000_000_000)
            self.assertEqual(p['minimum_live_reclaimable_bytes'], 3_000_000_000)
            self.assertEqual(p['maximum_build_seconds'], 900)
            self.assertTrue(p['stop_on_new_swapouts'])
        with self.assertRaises(ValueError):
            run.policy('integrated-vision-query')

    def test_changed_contract_is_rejected(self):
        expected = {'build': 'current', 'policies': {'cap': 2}}
        changed = copy.deepcopy(expected)
        changed['policies']['cap'] = 3
        with patch.object(run.c, 'read', return_value=expected), patch.object(run, 'contract', return_value=changed):
            with self.assertRaisesRegex(ValueError, 'contract changed'):
                run.load()

    def test_failed_admission_claims_no_attempt_and_launches_nothing(self):
        with tempfile.TemporaryDirectory() as folder, patch.object(run, 'OUT', Path(folder) / 'output'), \
             patch.object(run, 'load', return_value={}), patch.object(run.core, 'allowance'), \
             patch.object(run.core, 'readiness', side_effect=ValueError('headroom')), \
             patch.object(run.core, 'execute') as execute:
            with self.assertRaisesRegex(ValueError, 'headroom'):
                run.run('vision-query-tile-tower', '2030-01-01T00:00:00Z')
            execute.assert_not_called()
            self.assertFalse(run.OUT.exists())

    def test_original_tower_byte_equality_remains_mandatory(self):
        name = 'vision-query-maximum-reference'
        report = {'name': run.native.NATIVE[name][0], 'passed': True,
                  'items': [{'passed': True}] * 6,
                  'measurements': {'1536x1536.reference_exact_bytes': 0}}
        with self.assertRaisesRegex(ValueError, 'byte equality'):
            run.native.assess(name, report)
        report['measurements']['1536x1536.reference_exact_bytes'] = 1
        self.assertEqual(run.native.assess(name, report)['assertions'], 6)


if __name__ == '__main__':
    unittest.main()

````

## /tmp/slotstream-optimization-execution/vision-component-execution-v335/validation.json

SHA-256 `e310c3511c65ee0cab91bbc6a27fa664dd0a3a24d097fb4fd3c531531f321a2a`.

````text
{
  "passed": true,
  "methods": 4,
  "elapsed_seconds": 0.078179083,
  "executor_sha256": "03792c3bb0ddf60bd283f301069fb920b0e4494ba6cff6d8fc84cce2193acd83",
  "test_sha256": "4f6161290ab6a8c00502a86ad8e6eeaf02f11ab3cda730c043aed628791d2740",
  "model_execution": false
}
````

## /tmp/slotstream-optimization-execution/vision-component-execution-v335/validation.stderr.txt

SHA-256 `feabb4add9e2ca3374e538560634d1ec97dc4f4ce89aab12f3d726e36ea9b2f6`.

````text
....
----------------------------------------------------------------------
Ran 4 tests in 0.001s

OK

````

## /tmp/slotstream-optimization-execution/vision-component-execution-v335/validation.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

