---
type: run
id: 01m1z733vvztq46j2hrsfvch01
created: 2026-09-08T00:36:06.650960+00:00
updated: 2026-09-08T00:36:07.054372+00:00
summary: Fixed-tail MTP prerequisites preserve adaptive rejection and isolate passing lifecycle evidence
binary: V304 af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d
captured_at: 2026-09-08
command: Current V330 image-duplicate-two interrupted serving study; V338 explicit fixed-tail lifecycle binding and five model-free validation methods; exact commands and outputs below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Fixed-tail MTP prerequisites preserve adaptive rejection and isolate passing lifecycle evidence
tool: python3
---
# The fixed-tail studies do not depend on adopting adaptive speculation

Source inspection finds that the original V179 MTP-tail study requires fixed-work parity plus corrected cancellation, EOS, pending-token/checkpoint and continuation checks. Both original serving arms explicitly set SLOTSTREAM_OPT_ADAPTIVE_MTP=0 and fixed draft depth one. V330 accidentally required the entire adaptive-mtp diagnostic to pass, including its separate target-only output-comparison assertion for the already rejected adaptive policy.

V338 corrects this dependency explicitly. It retains the current mtp-work-integrated all-284-assertion pass and binds the complete unchanged adaptive-mtp report, original command/build identity, source hash and cleanup evidence. The report remains failed. Its sole separate policy assertion remains false and adaptive_policy_adopted remains false. Only the 258 passing lifecycle observations are used for the lifecycle prerequisite. Any failed lifecycle assertion, missing or duplicate policy observation, inconsistent whole-report result, interrupted process, wrong source/build or changed evidence still refuses qualification. This does not rescore adaptive policy or allow it to become enabled.

Both unchanged original V179 serving protocols are now frozen in V338 with their exact request work, fixtures, all controls, 16 alternating pairs, original timing/startup/exact-output/resource criteria, 13 GB startup, 12 GB owned-tree bound, 3 GB live reserve, 3300-second work allowance, 30-second cleanup reserve and no replacements. Only current label/classification and explicit prerequisite binding differ. Both arms must keep adaptive speculation off. Every actual warmup and measured request must additionally report an empty adaptive decision trace, zero adaptive plain tokens and no disabled-at-output event; missing observations fail. The sampled study still requires the original draft/model/forward/verification work to match in every pair. Prerequisites and executor identities are rechecked after cleanup.

Five model-free methods pass in 0.328826167 seconds. They check the actual failed report remains failed while its lifecycle observations are separately scoped; no additional failed or missing observation can be hidden; original work/controls/acceptance are unchanged; adaptive controls and observed adaptive work cannot enter; and failed admission or an existing attempt cannot launch a process. Executor 02a995cf6702703a81050fd15f60ab8534bb5f829800ef190cd1762cad75f1d0; binding 7fb74b3d702f35b829a72295a3ead42c780ea78f3c6f59c10f8c221e2451f4c6. Protocols: two-token 8813d6f0c1485441ab391245655da01a0cf12696155c804c2c85b0c13a614d3e; sampled fd763becf14b85c8bad9026731cc190c33a842ef54890cd425aedb1036637114. Neither study has executed. No runtime, automatic default, installed binary or public serving acceptance threshold changed.

Original failed policy evidence: [[sources/runs/2026/09/2026-09-08-optimization-current-adaptive-policy-counterexample]]. Fixed-work evidence: [[sources/runs/2026/09/2026-09-08-optimization-current-vision-mtp-static-gates]].


## Evidence inventory

````json
[
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/.run.lock",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/binding.json",
    "bytes": 24117,
    "sha256": "7fb74b3d702f35b829a72295a3ead42c780ea78f3c6f59c10f8c221e2451f4c6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/freeze.stdout.json",
    "bytes": 1212,
    "sha256": "dbe453414abd16bbe78ac719ced4c6ed472baf1023148a85780f15f49536115d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/mtp-bounded-tail-sampled.json",
    "bytes": 7959,
    "sha256": "fd763becf14b85c8bad9026731cc190c33a842ef54890cd425aedb1036637114"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/mtp-bounded-tail-two.json",
    "bytes": 8325,
    "sha256": "8813d6f0c1485441ab391245655da01a0cf12696155c804c2c85b0c13a614d3e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/run.py",
    "bytes": 12080,
    "sha256": "02a995cf6702703a81050fd15f60ab8534bb5f829800ef190cd1762cad75f1d0"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/run_test.py",
    "bytes": 3856,
    "sha256": "c8210de59e876ba2a9ba0dbbe4330e9c27697f2f591ab71558ff80eff6425256"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/validation.json",
    "bytes": 273,
    "sha256": "a2db14f402d06a0282533fbb3836c108feb6df5ed263d8a1558e50f0ea89deba"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/validation.stderr.txt",
    "bytes": 103,
    "sha256": "87773a7cbc1446c3c14647e10ee942337c98824af974b076747270d205dc925a"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/validation.stdout.txt",
    "bytes": 0,
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  }
]
````

## /tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/.run.lock

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/binding.json

SHA-256 `7fb74b3d702f35b829a72295a3ead42c780ea78f3c6f59c10f8c221e2451f4c6`.

````text
{
  "executor_sha256": "02a995cf6702703a81050fd15f60ab8534bb5f829800ef190cd1762cad75f1d0",
  "core_executor_sha256": "5793aa8bcb3af55fb99c9da698475ee54272ee791ccef30141c94ba6c405b95f",
  "core_preparation_sha256": "3479e62de5ffbe569b3bd0f9c63953a3cfec0bbaea197ba8b6237b1e43b5f974",
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
  "fixed_work": {
    "assertions": 284,
    "evidence": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/mtp-work-integrated",
      "sha256": {
        "attempt.json": "58487eaa44eb9850104baa60eb5e9102a64804adfd0ed08c7f6339608b24bddb",
        "receipt.json": "332ed1a4d25eed50aac1c711e98e923c6f70cab4d8f37ecccbb5dddf58c2cb16",
        "stdout.txt": "29540a4690f0fbc5547bc78ebbb8b305b40e53bfec3f416d76f22d7822df3abf",
        "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      }
    }
  },
  "lifecycle": {
    "lifecycle_assertions": 258,
    "lifecycle_passed": true,
    "whole_report_passed": false,
    "adaptive_policy_check": {
      "detail": "got [418, 11, 198, 27, 91, 1152, 52933, 91, 29, 27, 91, 244288, 60470, 91, 29, 1002], want [418, 11, 198, 27, 91, 1152, 52933, 91, 29, 27, 91, 244288, 60470, 91, 29, 3431]",
      "name": "adaptive greedy IDs agree with target-only decode",
      "passed": false
    },
    "adaptive_policy_adopted": false,
    "source_sha256": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
    "evidence": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/adaptive-mtp",
      "sha256": {
        "attempt.json": "af84ca9b85863cfba32651f52240952006f65e36bf75c2d1e5de5ab5268b7bc6",
        "receipt.json": "5d82a8cb600417eb81d1b6a3bce6674e03727e51cac95a94e7c6eaf8523d0e5e",
        "stdout.txt": "085a6f2e7949a2061d276cc73c14c88f1052337ea8d79f29898ea957b8fde84f",
        "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      }
    }
  },
  "protocol_sha256": {
    "mtp-bounded-tail-two": "8813d6f0c1485441ab391245655da01a0cf12696155c804c2c85b0c13a614d3e",
    "mtp-bounded-tail-sampled": "fd763becf14b85c8bad9026731cc190c33a842ef54890cd425aedb1036637114"
  }
}

````

## /tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/freeze.stdout.json

SHA-256 `dbe453414abd16bbe78ac719ced4c6ed472baf1023148a85780f15f49536115d`.

````text
{
  "frozen": [
    "mtp-bounded-tail-two",
    "mtp-bounded-tail-sampled"
  ],
  "model_execution": false,
  "lifecycle": {
    "lifecycle_assertions": 258,
    "lifecycle_passed": true,
    "whole_report_passed": false,
    "adaptive_policy_check": {
      "detail": "got [418, 11, 198, 27, 91, 1152, 52933, 91, 29, 27, 91, 244288, 60470, 91, 29, 1002], want [418, 11, 198, 27, 91, 1152, 52933, 91, 29, 27, 91, 244288, 60470, 91, 29, 3431]",
      "name": "adaptive greedy IDs agree with target-only decode",
      "passed": false
    },
    "adaptive_policy_adopted": false,
    "source_sha256": "752ef228b166ec58fb70df53e2c9ee6fb85aac1ffc4ad18e8096590bfd324d57",
    "evidence": {
      "directory": "/Users/carlos/Projects/slotstream/.build/optimization/optional-current-serving-v330/native/adaptive-mtp",
      "sha256": {
        "attempt.json": "af84ca9b85863cfba32651f52240952006f65e36bf75c2d1e5de5ab5268b7bc6",
        "receipt.json": "5d82a8cb600417eb81d1b6a3bce6674e03727e51cac95a94e7c6eaf8523d0e5e",
        "stdout.txt": "085a6f2e7949a2061d276cc73c14c88f1052337ea8d79f29898ea957b8fde84f",
        "stderr.txt": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
      }
    }
  }
}

````

## /tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/mtp-bounded-tail-sampled.json

SHA-256 `fd763becf14b85c8bad9026731cc190c33a842ef54890cd425aedb1036637114`.

````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
  "memory_gb": 10,
  "mtp": "on",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 10000000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "1",
        "SLOTSTREAM_DRAFT_DEPTH": "1"
      }
    },
    "candidate": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "1",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "1",
        "SLOTSTREAM_DRAFT_DEPTH": "1"
      }
    }
  },
  "label": "mtp-bounded-tail-sampled-v338",
  "classification": "Unchanged original V179 fixed-tail study. Current fixed-work and explicitly scoped lifecycle evidence; adaptive policy remains rejected and disabled. No activation.",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
  "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "conditions": "New isolated comparison on the shared qualified base, with only the named candidate control changed. Prefix retention disabled; native10GB target, no explicit pool override, all controls explicit,16 fixed alternating fresh-process pairs, min5 clean, no replacements, 180s initial quiet/60s between cells, exact token IDs and wire text. Same-binary native prerequisites and source binding are mandatory before freezing. Record first-job acceptance separately (min5 clean/at most5percent regression); failed startup evidence cannot inherit a warmed pass. No historical measurements are pooled. Fixed depth1; adaptive policy, first-entry reuse and fused GDN recording stay off. The two-output candidate must execute zero drafts and one target position instead of one draft and two positions. This removes output-budget work only; context safety independently bounds provisional work in both arms. Exact output and state checks remain mandatory despite the smaller terminal batch.",
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
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
  "abort_on_resource_failure": true,
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "prefillRecords"
  ],
  "sampling": {
    "temperature": 0.7,
    "top_k": 40,
    "top_p": 0.8,
    "min_p": 0.05,
    "presence_penalty": 1.1
  }
}

````

## /tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/mtp-bounded-tail-two.json

SHA-256 `8813d6f0c1485441ab391245655da01a0cf12696155c804c2c85b0c13a614d3e`.

````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
  "memory_gb": 10,
  "mtp": "on",
  "raw": true,
  "seed": 7,
  "rounds": 16,
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 10000000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "1",
        "SLOTSTREAM_DRAFT_DEPTH": "1"
      }
    },
    "candidate": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/joined-state-eval-build-v304/candidate/slotstream",
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
        "SLOTSTREAM_OPT_INDEXER_TILES": "0",
        "SLOTSTREAM_OPT_SHARED_ROPE": "1",
        "SLOTSTREAM_OPT_FUSED_ROPE": "1",
        "SLOTSTREAM_OPT_GDN_PROJECTION": "0",
        "SLOTSTREAM_OPT_GDN_RECORD": "0",
        "SLOTSTREAM_OPT_PLE_TILES": "0",
        "SLOTSTREAM_OPT_NGRAM_LOOKAHEAD": "0",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "0",
        "SLOTSTREAM_OPT_MTP_FIRST_ENTRY": "0",
        "SLOTSTREAM_OPT_MTP_TAIL": "1",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "1",
        "SLOTSTREAM_DRAFT_DEPTH": "1"
      }
    }
  },
  "label": "mtp-bounded-tail-two-v338",
  "classification": "Unchanged original V179 fixed-tail study. Current fixed-work and explicitly scoped lifecycle evidence; adaptive policy remains rejected and disabled. No activation.",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/short.txt",
  "fixture_sha256": "e8e144318a8c13a209ec2967bc282ff6e4c3aa2363bbc49a6c43b801ed2b24b9",
  "max_tokens": 2,
  "minimum_output_tokens": 2,
  "conditions": "New isolated comparison on the shared qualified base, with only the named candidate control changed. Prefix retention disabled; native10GB target, no explicit pool override, all controls explicit,16 fixed alternating fresh-process pairs, min5 clean, no replacements, 180s initial quiet/60s between cells, exact token IDs and wire text. Same-binary native prerequisites and source binding are mandatory before freezing. Record first-job acceptance separately (min5 clean/at most5percent regression); failed startup evidence cannot inherit a warmed pass. No historical measurements are pooled. Fixed depth1; adaptive policy, first-entry reuse and fused GDN recording stay off. The two-output candidate must execute zero drafts and one target position instead of one draft and two positions. This removes output-budget work only; context safety independently bounds provisional work in both arms. Exact output and state checks remain mandatory despite the smaller terminal batch.",
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
  "abort_on_resource_failure": true,
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "prefillRecords"
  ],
  "work_constraints": {
    "reference": {
      "draftedTokens": {
        "min": 1,
        "max": 1
      },
      "verifyPasses": {
        "min": 1,
        "max": 1
      },
      "decodeModelTokens": {
        "min": 2,
        "max": 2
      }
    },
    "candidate": {
      "draftedTokens": {
        "min": 0,
        "max": 0
      },
      "verifyPasses": {
        "min": 1,
        "max": 1
      },
      "decodeModelTokens": {
        "min": 1,
        "max": 1
      }
    }
  }
}

````

## /tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/run.py

SHA-256 `02a995cf6702703a81050fd15f60ab8534bb5f829800ef190cd1762cad75f1d0`.

````text
"""Original fixed-tail serving studies with explicitly scoped lifecycle evidence.

The adaptive policy's failed quality assertion remains failed and that policy
is forbidden in both study arms. No native report or serving criterion changes.
"""
import argparse
import fcntl
import importlib.util
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
CORE = HERE.parent / 'optional-current-serving-v330/run.py'
spec = importlib.util.spec_from_file_location('original_optional', CORE)
core = importlib.util.module_from_spec(spec)
spec.loader.exec_module(core)
c, require, digest = core.c, core.require, core.digest
OUT = core.ROOT / '.build/optimization/fixed-mtp-serving-v338'
STUDIES = ('mtp-bounded-tail-two', 'mtp-bounded-tail-sampled')
POLICY_CHECK = 'adaptive greedy IDs agree with target-only decode'
SOURCE = core.ROOT / 'Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift'


def lifecycle_observations(report):
    require(report.get('name') == 'optimization-adaptive-mtp' and report.get('skipped') is None,
            'wrong or skipped lifecycle report')
    items = report.get('items')
    require(isinstance(items, list) and len(items) >= 257
            and all(isinstance(x, dict) and isinstance(x.get('name'), str)
                    and type(x.get('passed')) is bool for x in items), 'incomplete lifecycle observations')
    names = [x['name'] for x in items]
    require(len(set(names)) == len(names) and names.count(POLICY_CHECK) == 1,
            'missing policy result or duplicate observations')
    policy = next(x for x in items if x['name'] == POLICY_CHECK)
    lifecycle = [x for x in items if x['name'] != POLICY_CHECK]
    require(all(x['passed'] for x in lifecycle), 'a required lifecycle assertion failed')
    require(report.get('passed') is policy['passed'], 'whole-report result does not match its observations')
    # The source and raw report are bound separately; this semantic split is
    # explicit. Never overwrite the original report or call it an overall pass.
    return {'lifecycle_assertions': len(lifecycle), 'lifecycle_passed': True,
            'whole_report_passed': report['passed'], 'adaptive_policy_check': policy,
            'adaptive_policy_adopted': False}


def lifecycle_proof():
    value = core.load()
    require(digest(SOURCE) == value['build']['identity']['source'][str(SOURCE.relative_to(core.ROOT))],
            'reviewed diagnostic source differs from the executing build')
    target = core.OUT / 'native/adaptive-mtp'
    report, receipt, attempt = [c.read(target / name) for name in ('stdout.txt', 'receipt.json', 'attempt.json')]
    observed = lifecycle_observations(report)
    require(receipt.get('exit_code') == (0 if report['passed'] else 1)
            and receipt.get('cleanup_complete') is True and receipt.get('within_reservation') is True
            and receipt.get('proofs_unchanged') is True and not receipt.get('cleanup_error'),
            'lifecycle process was interrupted or did not drain')
    require(attempt['command'] == value['native_commands']['adaptive-mtp']
            and attempt['build'] == value['build'] and attempt['environment'] == {}
            and receipt['attempt_sha256'] == digest(target / 'attempt.json')
            and receipt['stdout_sha256'] == digest(target / 'stdout.txt'), 'lifecycle identity or raw evidence differs')
    expected_error = None if report['passed'] else 'ValueError: native correctness failed or required assertions missing'
    require(receipt.get('error') == expected_error, 'unexpected lifecycle execution failure')
    return {**observed, 'source_sha256': digest(SOURCE),
            'evidence': c.evidence(target, ['attempt.json', 'receipt.json', 'stdout.txt', 'stderr.txt'])}


def require_fixed_arms(protocol):
    require(set(protocol['arms']) == {'reference', 'candidate'}
            and protocol['mtp'] == 'on'
            and all(arm['env'].get('SLOTSTREAM_OPT_ADAPTIVE_MTP') == '0'
                    and arm['env'].get('SLOTSTREAM_DRAFT_DEPTH') == '1'
                    for arm in protocol['arms'].values()), 'rejected adaptive policy may not enter fixed-tail studies')


def materialize(name, value):
    require(name in STUDIES, 'unknown fixed-tail study')
    protocol = core.materialize(name, value)
    protocol['label'] = name + '-v338'
    protocol['classification'] = 'Unchanged original V179 fixed-tail study. Current fixed-work and explicitly scoped lifecycle evidence; adaptive policy remains rejected and disabled. No activation.'
    require_fixed_arms(protocol)
    return protocol


def binding():
    value = core.load()
    return {'executor_sha256': digest(Path(__file__)), 'core_executor_sha256': digest(CORE),
            'core_preparation_sha256': digest(core.HERE / 'preparation.json'),
            'build': value['build'], 'shared_proof': value['shared_proof'],
            'fixed_work': core.native_proof('mtp-work-integrated'), 'lifecycle': lifecycle_proof()}


def freeze():
    require(not OUT.exists(), 'fixed-tail execution already attempted')
    require(not (HERE / 'binding.json').exists(), 'already frozen')
    value, proof = core.load(), binding()
    for name in STUDIES:
        require(not (core.HERE / name).exists() and not (core.OUT / 'serving' / name).exists(),
                'original MTP study already frozen or attempted')
        c.write_new(HERE / (name + '.json'), materialize(name, value))
    proof['protocol_sha256'] = {name: digest(HERE / (name + '.json')) for name in STUDIES}
    c.write_new(HERE / 'binding.json', proof)
    return {'frozen': list(STUDIES), 'model_execution': False, 'lifecycle': proof['lifecycle']}


def load(name):
    require(name in STUDIES, 'unknown fixed-tail study')
    value, saved = core.load(), c.read(HERE / 'binding.json')
    expected = binding()
    expected['protocol_sha256'] = {name: digest(HERE / (name + '.json')) for name in STUDIES}
    require(saved == expected, 'fixed-tail prerequisite or executor identity changed')
    protocol = c.read(HERE / (name + '.json'))
    require(protocol == materialize(name, value), 'original workload, controls or serving criteria changed')
    return value, protocol


def require_no_adaptive_work(stats):
    require(stats.get('adaptiveDraftDepths') == [] and type(stats.get('adaptivePlainTokens')) is int
            and stats['adaptivePlainTokens'] == 0
            and stats.get('adaptiveDisabledAtOutput') is None,
            'adaptive policy work was observed or required observations are missing')


def assess(name):
    value, protocol = load(name)
    output = OUT / name
    manifest, completion = c.read(output / 'manifest.json'), c.read(output / 'completion.json')
    require(manifest['protocol'] == protocol
            and manifest['arm_builds'] == {a: value['build'] for a in protocol['arms']}, 'executed identity or protocol differs')
    require(completion.get('interrupted') is False and completion.get('stopped_early') is False
            and 'error' not in completion and completion.get('planned_cells') == completion.get('recorded_cells') == 32,
            'fixed study incomplete')
    rows = [json.loads(line) for line in (output / 'results.jsonl').read_text().splitlines()]
    require(len(rows) == 32 and {(r['round'], r['arm']) for r in rows}
            == {(n, a) for n in range(1, 17) for a in protocol['arms']}, 'missing, extra or repeated cells')
    warmups = {(r['round'], r['arm']): c.read(output / f"{r['round']}-{r['arm']}/warmup.json") for r in rows}
    c.soak.validate_paired_execution(name, protocol, rows, warmups)
    for row in rows:
        stats = row['metrics']['stats']
        c.bench.validate_work_observation(protocol.get('work_constraints', {}), row['arm'], stats)
        require_no_adaptive_work(stats)
        require_no_adaptive_work(warmups[(row['round'], row['arm'])]['metrics']['stats'])
    if name == 'mtp-bounded-tail-sampled':
        grouped = {n: {r['arm']: r for r in rows if r['round'] == n} for n in range(1, 17)}
        for arms in grouped.values():
            a, b = (arms[k]['metrics']['stats'] for k in ('reference', 'candidate'))
            require(all(a[k] == b[k] for k in ('draftedTokens', 'verifyPasses', 'decodeModelTokens', 'decodeForwardPasses')),
                    'sampled fallback changed provisional work or verification shape')
    summary = c.bench.summaries(rows, 'reference', protocol['comparison_basis'], protocol['required_equal_work'])
    accepted = c.bench.acceptance_results(summary, protocol['acceptance'])
    startup = c.bench.startup_acceptance_results(rows, 'reference', protocol['startup_acceptance'])
    require(accepted == completion['acceptance'] and startup == completion['startup_acceptance'], 'acceptance differs from raw recomputation')
    passed = bool(accepted and startup and all(x['passed'] is True for x in accepted + startup))
    return {'completed': True, 'passed': passed, 'qualified': passed, 'cells': 32,
            'acceptance': accepted, 'startup_acceptance': startup, 'summary': summary,
            'adaptive_policy_adopted': False, 'activation_performed': False}


def run(name, deadline):
    core.allowance(deadline, core.SERVING_ALLOWANCE)
    value, protocol = load(name)
    target, output = HERE / name / 'execution', OUT / name
    require(not target.exists() and not output.exists(), 'attempted serving study cannot retry')
    needed = c.bench.measurement_memory(protocol)
    limit, before, thermal = core.readiness(deadline, core.SERVING_ALLOWANCE, needed)
    policy = dict(c.NATIVE_POLICY, startup_reclaimable_bytes=int(needed * 1e9),
                  maximum_owned_rss_bytes=12_000_000_000, maximum_build_seconds=core.MAXIMUM_SERVING_SECONDS)
    command = [sys.executable, str(core.ROOT / 'Tools/serve_bench.py'), '--protocol', str(HERE / (name + '.json')), '--out', str(output)]
    attempt = {'started_at': core.now(), 'command': command, 'environment': {}, 'build': value['build'],
               'before': before, 'thermal_prelaunch': thermal, 'deadline_utc': deadline, 'policy': policy,
               'binding_sha256': digest(HERE / 'binding.json'),
               'classification': 'Original 32-cell fixed-tail study; adaptive policy stays rejected/off. Same V179 workload, output/work equality, request/startup thresholds, 13GB startup/12GB owned/3GB live guards, 3300-second bound and no replacements.'}
    def assessment(code):
        require(code in (0, 1), 'serving process failed')
        return assess(name)
    result = core.execute(command, target, core.MAXIMUM_SERVING_SECONDS, policy, assessment, limit, attempt, output / 'results.jsonl')
    try:
        load(name)
        result['fixed_tail_proofs_unchanged'] = True
    except BaseException as error:
        result['fixed_tail_proof_error'] = str(error)
        result.update(passed=False, completed=False, qualified=False)
    result['execution_receipt_sha256'] = digest(target / 'receipt.json')
    if output.exists():
        c.write_new(target / 'artifact-sha256.json', c.artifact_hashes(output))
    c.write_new(target / 'qualification.json', result)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command', choices=['freeze', 'status', 'serving'])
    parser.add_argument('--name', choices=list(STUDIES))
    parser.add_argument('--deadline')
    args = parser.parse_args()
    with (HERE / '.run.lock').open('a') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        if args.command == 'freeze':
            result = freeze()
        elif args.command == 'status':
            result = {name: (load(name) and ('attempted' if (OUT / name).exists() else 'unrun')) for name in STUDIES}
        else:
            require(args.deadline is not None, 'explicit peer-granted deadline required')
            result = run(args.name, args.deadline)
    print(json.dumps(result, indent=2), flush=True)
    return 0 if args.command != 'serving' or result.get('completed') else 1


if __name__ == '__main__':
    raise SystemExit(main())

````

## /tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/run_test.py

SHA-256 `c8210de59e876ba2a9ba0dbbe4330e9c27697f2f591ab71558ff80eff6425256`.

````text
import copy
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

HERE = Path(__file__).resolve().parent
spec = importlib.util.spec_from_file_location('fixed_tail', HERE / 'run.py')
run = importlib.util.module_from_spec(spec)
spec.loader.exec_module(run)


class FixedTailTests(unittest.TestCase):
    def report(self):
        return run.c.read(run.core.OUT / 'native/adaptive-mtp/stdout.txt')

    def test_actual_report_keeps_overall_failure_and_exposes_only_lifecycle_scope(self):
        proof = run.lifecycle_proof()
        self.assertEqual(proof['lifecycle_assertions'], 258)
        self.assertTrue(proof['lifecycle_passed'])
        self.assertFalse(proof['whole_report_passed'])
        self.assertFalse(proof['adaptive_policy_check']['passed'])
        self.assertFalse(proof['adaptive_policy_adopted'])
        self.assertFalse(self.report()['passed'])

    def test_no_lifecycle_failure_missing_policy_or_duplicate_can_be_hidden(self):
        mutations = [lambda r: r['items'][0].update(passed=False),
                     lambda r: r.update(passed=True),
                     lambda r: r['items'].append(copy.deepcopy(r['items'][0])),
                     lambda r: r.update(items=[x for x in r['items'] if x['name'] != run.POLICY_CHECK]),
                     lambda r: r.update(skipped='not executed'),
                     lambda r: r.update(items=[])]
        for mutate in mutations:
            report = self.report(); mutate(report)
            with self.assertRaises(ValueError):
                run.lifecycle_observations(report)

    def test_original_work_controls_and_acceptance_are_unchanged(self):
        value = run.core.load()
        for name in run.STUDIES:
            original = run.core.materialize(name, value)
            current = run.materialize(name, value)
            for key in ('label', 'classification'):
                del original[key]; del current[key]
            self.assertEqual(current, original)
            for arm in current['arms'].values():
                bad = copy.deepcopy(current)
                bad['arms']['candidate']['env']['SLOTSTREAM_OPT_ADAPTIVE_MTP'] = '1'
                with self.assertRaises(ValueError):
                    run.require_fixed_arms(bad)

    def test_observed_adaptive_work_or_missing_metrics_cannot_pass(self):
        good = {'adaptiveDraftDepths': [], 'adaptivePlainTokens': 0}
        run.require_no_adaptive_work(good)
        for key, value in [('adaptiveDraftDepths', [0]), ('adaptiveDraftDepths', None),
                           ('adaptivePlainTokens', 1), ('adaptivePlainTokens', False),
                           ('adaptivePlainTokens', None), ('adaptiveDisabledAtOutput', 3)]:
            with self.assertRaises(ValueError):
                run.require_no_adaptive_work(dict(good, **{key: value}))

    def test_failed_admission_or_existing_attempt_cannot_launch(self):
        with tempfile.TemporaryDirectory() as folder, patch.object(run, 'OUT', Path(folder) / 'output'), \
             patch.object(run, 'load', return_value=({}, {'memory_gb': 10})), \
             patch.object(run.core, 'allowance'), \
             patch.object(run.core, 'readiness', side_effect=ValueError('headroom')), \
             patch.object(run.core, 'execute') as execute:
            with self.assertRaisesRegex(ValueError, 'headroom'):
                run.run('mtp-bounded-tail-two', '2030-01-01T00:00:00Z')
            execute.assert_not_called()
            self.assertFalse(run.OUT.exists())
            (run.OUT / 'mtp-bounded-tail-two').mkdir(parents=True)
            with self.assertRaisesRegex(ValueError, 'cannot retry'):
                run.run('mtp-bounded-tail-two', '2030-01-01T00:00:00Z')
            execute.assert_not_called()


if __name__ == '__main__':
    unittest.main()

````

## /tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/validation.json

SHA-256 `a2db14f402d06a0282533fbb3836c108feb6df5ed263d8a1558e50f0ea89deba`.

````text
{
  "passed": true,
  "methods": 5,
  "elapsed_seconds": 0.328826167,
  "executor_sha256": "02a995cf6702703a81050fd15f60ab8534bb5f829800ef190cd1762cad75f1d0",
  "tests_sha256": "c8210de59e876ba2a9ba0dbbe4330e9c27697f2f591ab71558ff80eff6425256",
  "model_execution": false
}
````

## /tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/validation.stderr.txt

SHA-256 `87773a7cbc1446c3c14647e10ee942337c98824af974b076747270d205dc925a`.

````text
.....
----------------------------------------------------------------------
Ran 5 tests in 0.253s

OK

````

## /tmp/slotstream-optimization-execution/fixed-mtp-serving-v338/validation.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

