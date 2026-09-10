---
type: run
id: 01m1w3qn41qjz0khfwx51swa89
created: 2026-09-06T19:39:42.081435+00:00
updated: 2026-09-06T19:40:25.707953+00:00
summary: Optimization MTP cancellation fix and remaining cache qualification — V178–180
binary: Shared correction and new diagnostics unbuilt; separate context build17 evidence only
captured_at: 2026-09-06
command: python3 -m unittest discover -s Tools -p ngram_cache_probe_test.py -v
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Optimization MTP cancellation fix and remaining cache qualification — V178–180
tool: Source integration, pure qualification tests, preserved native context evidence
---
V178 applies the context task's minimal three-hunk cancellation correction to the actual shared source, after verifying both the exact V176 before hash and proposed after hash. The continuation closure used by speculativeDecode no longer mutates outer GenStats while speculativeDecode holds its exclusive inout borrow. It records caller cancellation in a separate local; finish folds that result into statistics after the borrow ends. An explicit RequestController failure still takes precedence. Legacy no-controller committed-prefix cancellation retains runtimeError nil. Shared Generate changes from df4c5935aaa361db52b1239cf4c67ea7baf8ab9abb9ce504833ad77feb6e4e67 to b53ec44b0d172126aeafed9b9a72a26201fd5f0908b07dc9054347ab50856b9b; diff checking passes.

The original build16 abort is preserved. The context task's corrected separate build17 passes prefix-retention-mtp198, including existing committed-prefix cancellation and18 new typed cancellation/recovery assertions at0/1/3 delivered tokens, no invalid retention, pin release and fresh-request recovery. It also reports lifecycle138, T0, CLI102 and planner64 passing. Its adaptive-MTP run is258/259: the same old token16 counterexample, adaptive1002 versus plain3431 after fifteen identical tokens. Source-only comparison against the immutable V49–51 evidence confirms the exact old vectors. No redundant model rerun or numerical threshold change is needed. Adaptive speculation remains disabled. These are separate-context-snapshot results, with additional C07 and public transport changes, not qualification of an updated shared executable. The shared fix has not yet been built here.

V179 prepares five isolated serving drafts: compact n-gram ordinary prefill nonregression; a fixed-depth-one two-output bounded-tail speed comparison; its seeded sampled sixteen-output guard; two identical512-square images; and a single-image reuse guard. Every draft has FINAL_BINARY_REQUIRED, pending native prerequisites, native10GB total target, explicit common qualified controls, prefix retention off, sixteen fixed alternating fresh-process pairs, at least five clean pairs, no replacements,180-second initial quiet,60-second cooldown, exact IDs/wire text and independent first-job nonregression. Output-tail controls alone change between their arms; the two-output mechanism requires one draft/two verified positions versus zero drafts/one position. Source and image identity/byte counts are frozen in each draft. No draft has run or earned benefit.

The existing public optimizationMTPWork signature remains intact. Its implementation now also checks seeded sampling, detects missing retained state without force-unwrapping, and has a package-scoped integrationCandidate variant with bounded row-backed embeddings. The reviewed constructor selects the existing Boolean embedding option; no public initializer or diagnostic API changes. Limits1/2/5, depths1/3, first-entry/tail/both variants and the original output/consumption/alignment assertions remain. New native code is unbuilt.

V180 adds a fresh-process full-cache n-gram diagnostic and guarded four-arm component driver: FP32/UInt16 rows crossed with array/ring FIFO. It exercises real row hashes, SSD reads, assembly and cache ownership without any language-model layer or expert matrix operation. Common resident weights use bounded embedding rows and a ten-slot otherwise-unused pool. A32768-token input fills the400000-row cache; actual occupancy must be360000..400000.128 warm256-token assembly calls must miss no rows;4096 further tokens must cause more than40000 misses and actual batch eviction. SHA256 covers input IDs and every BF16 fill/eviction output, plus a warm output that must equal its original fill. Across arms, hashes, retained counts and logical hit/miss work must agree. No reference row values, model object or allocator state cross fresh-process arms.

The existing FIFO already removes the oldest ten percent in a batch, then shifts the remaining keys once. It does not shift400000 keys for every row miss. This materially limits the ring's theoretical opportunity, and is why full-cache measurement is independent of the earlier short-serving container trial. UInt16 can halve only the already-rounded payload: at full capacity400000*160*(4-2)=128000000 bytes. Dictionary objects, array allocation and fragmentation are included in measured physical growth and are not invented from this formula. Pooled row storage remains conditional on the measured residual overhead; no arena has been implemented or credited with a saving.

The prospective component has seven fixed alternating complete four-arm rounds, minfive clean comparisons, no replacement,300-second cell and5400-second whole-study deadlines,12GB preflight and7GB remaining headroom during native work, with a5GB component physical/RSS ceiling. Missing observations and incorrect work fail closed. VM/power changes exclude whole pairs while retaining all original fixed rounds; native failure or memory violation stops the study. Compact qualification requires at least100MB payload saving and80MB absolute filled-footprint plus80MB baseline-adjusted growth saving in every clean pair, with at most5percent median regression in fill, hit assembly and eviction. Ring qualification separately requires5percent median eviction gain,80percent positive pairs, nonregression and bounded extra memory. Native256-token ngram and cache-bookkeeping reports must have exact report digests and the same executable/source/Metal identities before launch. A component pass is not a serving or default pass.

Six pure component tests and49 serving-harness tests pass, Python syntax and diff checks pass. The serving harness now supports bounded n-gram payload/count observations and rejects changed cache work as incomparable. Source/identity, incomplete studies, excluded cells, changed output hashes, false payload-only savings, missing physical bounds and stale/skipped native prerequisites have explicit tests. No native build, model, GPU or performance run took place here; transport retains the machine through fresh native installation and installed-release acceptance, with the context task owning a separate bounded correctness interval.

Source/math closure for remaining policies: expected useful tokens in a depth-D verification are 1 plus the sum of the probabilities of accepting each successive draft prefix, truncated by the remaining output budget. No independence assumption is needed. Cost per emitted token must include draft, verification, reconciliation, head prefill, and expert reads displaced by the resident head. At a2,764,800-byte expert record, the planner's1.6GB head charge alone corresponds to about579 slots or12.1 experts per layer before extra sequence capacity. Acceptance rate alone therefore cannot select an efficient mode. The existing planner already has explicit off/on/auto modes, prices the head before its120-experts-per-layer automatic threshold and caps MTP context. Timing-driven mode adaptation is rejected by the preserved exact-output counterexample; it is not replaced with an invented unmeasured threshold. A new deterministic request policy is a conditional successor requiring its own numerical/quality and fixed-total-memory evidence, not an omitted promised speedup. Standalone output-tail qualification remains active in V179.

Image feature caching remains conditional. Reanalysis of existing V131 reference cells finds image encoding accounts for2.56–2.78percent of the clean full-request time at512 square; V132 has only one clean complete pair and its clean reference cells show4.30–4.48percent at1024 square. These are fractions of those already measured workloads, not a new speed or universal upper bound for edited-prefix requests. Fully reused prefixes already skip encoded image runs; partially reused images must still encode the whole tower. V179 tests request-local duplication directly. Persistent features across changed prompts require a demonstrated workload benefit, exact content/model/processor identity and a charged ownership budget; no cross-request feature cache is implemented or claimed. The full program, final joint source, scope/vision decisions, seven-workload paired matrix, two live soaks and complete acceptance remain open.

Artifact `/tmp/slotstream-optimization-execution/mtp-exclusivity-v178/receipt.json` — 449 bytes, SHA-256 `b040e23dc3f831dfa3ec0903dedd0a33ca03a8442abbc44ab270dea93e5fa5f1`.

````text
{
  "source": "combined-context-build-v176",
  "path": "Sources/Slotstream/Generate.swift",
  "before_sha256": "df4c5935aaa361db52b1239cf4c67ea7baf8ab9abb9ce504833ad77feb6e4e67",
  "after_sha256": "b53ec44b0d172126aeafed9b9a72a26201fd5f0908b07dc9054347ab50856b9b",
  "built": false,
  "qualified": false,
  "shared_applied": true,
  "shared_path": "/Users/carlos/Projects/slotstream/Sources/Slotstream/Generate.swift",
  "native_qualified": false
}

````

Artifact `/tmp/slotstream-context-implementation-20260906/mtp-exclusivity-fix-v1/fix.patch` — 1737 bytes, SHA-256 `55a62d95dec33fb6ac5dea59468815ed43d5dd486e7a3ffa3e989ac8432a3252`.

````text
--- a/Sources/Slotstream/Generate.swift
+++ b/Sources/Slotstream/Generate.swift
@@ -439,6 +439,9 @@
         sampler.deviceDraw = model.optimizations.deviceSamplerDraw
         if let s = params.seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
         var stats = GenStats()
+        // The speculative loop borrows stats as inout. Its continuation
+        // callback must record cancellation outside that exclusive borrow.
+        var callerCancellation: RequestFailure?
         stats.promptTokens = promptIds.count
         let embeddingHitsStart = model.resident.embeddingRowHits
         let embeddingMissesStart = model.resident.embeddingRowMisses
@@ -451,6 +454,9 @@
             if let failure = request?.failure {
                 stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
                 stats.memoryPressureCancelled = failure.code == .insufficientMemory
+            } else if let failure = callerCancellation {
+                stats.requestFailure = failure
+                stats.finishReason = "cancelled"
             } else if stats.requestFailure?.code == .clientCancelled {
                 stats.finishReason = "cancelled"
             }
@@ -549,9 +555,7 @@
             if shouldContinue?() == false {
                 let failure = request?.failure ?? RequestFailure(.clientCancelled, "inference was cancelled by its caller")
                 request?.fail(failure)
-                stats.requestFailure = failure
-                if request != nil { stats.runtimeError = failure.message }
-                stats.finishReason = "cancelled"
+                callerCancellation = failure
                 return false
             }
             return true

````

Artifact `/tmp/slotstream-context-implementation-20260906/prefix-retention-mtp-16/manifest.json` — 23306 bytes, SHA-256 `037b4e2298e06def9595c6b8b6299f14d35e7c3c44d8079634437d7f4d5acf07`.

````text
{
  "binary": "/private/tmp/slotstream-context-implementation-20260906/build-16/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "457d65426cca792bd8c1bd28e7d5bbcc812664090b535eeb0d355302679995d6",
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
      "Sources/Slotstream/Context.swift": "63208fab453c9f87a15fdbd2990291cdc3120efc3087ec5fbab455d4239ce288",
      "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
      "Sources/Slotstream/ContextMemory.swift": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/DownloadHTTP.swift": "3aacbda8bb579967550700d6b8e9fd075905b87f9d0dc76681d058c8cd630b00",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "3dfd6457fbec91fc636e1bdcd432af805c77304cd798e82c6f8b097f3738339c",
      "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "d064b24f622e9f13e931ec9f894ace89fbea3b6fd2d7deaf2d515dbb034374a5",
      "Sources/Slotstream/Governor.swift": "af44af93916c9fcbea08744c9d343915e65914edf69909dfe25c420ff0b9a129",
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
      "Sources/Slotstream/Optimizations.swift": "0739230d9ebfc0e0881a82add63660a48872c44ac3b5d709b9fe867105a4ee7a",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
      "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "83fa3acc8ebdce01f52f2574ad4e0fe6e655e48882595e6d25cdcf340a311923",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/Plan.swift": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
      "Sources/Slotstream/PrefixCache.swift": "3bd1841ec1bebb52b210d75b0fd4d4bdb0e49277ff9c529aebbc7227d94811d8",
      "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
      "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
      "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "ecd2aa75aa09b6cde14a46bb27e91bf76dd13f77f25e409178c1669adf94810b",
      "Sources/Slotstream/SlotWritePlan.swift": "9abde1de815522ff835d3c685a2e342293f3c9c7019cfc742265193ea2e286c1",
      "Sources/Slotstream/SlotpackDownload.swift": "fb6f47ce70f30713cf1679ebda619c980e9d783dd6ae4cd1cc4e0a68b14705b7",
      "Sources/Slotstream/SlotpackManifest.swift": "8664440e22653e64b85c0100345169dd93b3836d1bbd125ac2add4f621b9876d",
      "Sources/Slotstream/StatePrefixFork.swift": "c18f2caa63cb252f0c8c8a1f0cc0b0c3b5206bfdc96288feaa1aa8125bb8fe79",
      "Sources/Slotstream/StateRecovery.swift": "1b7f979dada5d79ef30171b7691516d28a41b45c273576513fa68aa6dd8f514a",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "8c7c41044630f1b97a135df88a5094e68ab7e8edb9a56490279549f1d1b59861",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "e4a88b55578952d038c2892948665d91a8ba7d1d816578fce5fc8b2ceef76ce2",
      "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
      "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "86cb6127bd84f33a036a92a0ef561925d141ae1b257aac46c8a55c10d30406a2",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "450a558155202d247a8bb73348a381ea35c7c06ed82999a3df356dcc65b2c930",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "a3cb658bbf29d1f119da68d517fba8e73db64a8ce6b698d14b5671fc25af5ccd",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "09740bc89178780c21bd778a3a8e07d55ad867691e050619a4d29c9e1d6ab8be",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PartialRotation.swift": "de75d07feedc163834fe8e716683af8b2d373c51b0588ccc2cac922f775367ef",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "e383c494263afa029a9ef107c90d6ba59f44cda5da7ca1035eae68cbda3562d2",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "71b49d3edc91c35572e0e40937860f8112c5ac56b9816ce870e189d4223d641c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixCapacity.swift": "55d6c4d984dac87ea915306a90507a26edfab5f9fdf8017315645e7c1bae4819",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "34e74989d1f4fd2fcc9fd8cb9b0f1fc75c0e4e1c214751f44245f2543270ab09",
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
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "5bf0d9a1ad4ba5759e1301a0534c0412eede0653f335b11c9341e0caebda66f8",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
      "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "ad1b7ab3783a7fdb035b7e25729e64df4a8462702c49e3d959b984d61ef730e2",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "534f2c4273d9401478c1012026d23f3376e45979108fffed5d227f32ac3f9af8",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
      "Sources/slotstream-cli/main.swift": "a7291c58fa698be74e50964e22f1a1ddbc6584bdd02e9462fac54a6672706b36",
      "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "d670292842638688eabe8bf1278fa6b30f1015d087258c996946c611d654fe9d",
    "binary_sha256": "731d3b7d663bc3634c4372de5c46f29b6b732dad135765380a8d1e59bc979e3b",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/private/tmp/slotstream-context-implementation-20260906/build-16/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "prefix-retention-mtp",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31301304320,
    "swapins": 43807124,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   353625.\nPages active:                                1036102.\nPages inactive:                               945104.\nPages speculative:                             88721.\nPages throttled:                                   0.\nPages wired down:                             221952.\nPages purgeable:                                   5.\n\"Translation faults\":                    14875527227.\nPages copy-on-write:                       693108556.\nPages zero filled:                       20265053912.\nPages reactivated:                        3317918652.\nPages purged:                               69945978.\nFile-backed pages:                           1556850.\nAnonymous pages:                              513077.\nPages stored in compressor:                  1784859.\nPages occupied by compressor:                 438045.\nDecompressions:                           1138401280.\nCompressions:                             1449516598.\nPageins:                                  7091244696.\nPageouts:                                   10976745.\nSwapins:                                    43807124.\nSwapouts:                                   77363385.\nPages tagged:                                 153764.\nPages tagged resident:                        120347.\nPages tagged compressed:                       33417.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6921.\nPages tag-storage free:                         2104.\nPages tag-storage non-tag pageable:            89271.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5851776.\nTagged compressions:                        10803391.\nTagged decompressions:                       9974431.\n"
  },
  "preflight_wait": {
    "seconds": 0.00262520799999999,
    "attempts": 1,
    "limit_seconds": 0
  },
  "exit_code": -6,
  "error": "JSONDecodeError: Expecting value: line 1 column 1 (char 0)",
  "duration_seconds": 3.84889125,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28403908608,
    "swapins": 43807175,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   208275.\nPages active:                                1037791.\nPages inactive:                               903033.\nPages speculative:                            125904.\nPages throttled:                                   0.\nPages wired down:                             303122.\nPages purgeable:                                  24.\n\"Translation faults\":                    14876001741.\nPages copy-on-write:                       693121188.\nPages zero filled:                       20266408843.\nPages reactivated:                        3318082035.\nPages purged:                               69946059.\nFile-backed pages:                           1525338.\nAnonymous pages:                              541391.\nPages stored in compressor:                  1876358.\nPages occupied by compressor:                 507298.\nDecompressions:                           1138515536.\nCompressions:                             1449727910.\nPageins:                                  7091360362.\nPageouts:                                   10976858.\nSwapins:                                    43807175.\nSwapouts:                                   77363385.\nPages tagged:                                 153150.\nPages tagged resident:                        119324.\nPages tagged compressed:                       33826.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6918.\nPages tag-storage free:                          243.\nPages tag-storage non-tag pageable:            91135.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5937088.\nTagged compressions:                        10803892.\nTagged decompressions:                       9974523.\n"
  }
}

````

Artifact `/tmp/slotstream-context-implementation-20260906/prefix-retention-mtp-16/stderr.txt` — 1673 bytes, SHA-256 `9d8fbbe9ec1463ebad6a556ebd63b29ca733fa21c949ee4f89756622925d36aa`.

````text
Simultaneous accesses to 0x81d0b8010, but modification requires exclusive access.
Previous access (a modification) started at slotstream`Generator.generate(promptIds:params:eosIds:cache:vision:shouldContinue:onToken:request:onAdmitted:) + 29176 (0x10147a308).
Current access (a modification) started at:
0    libswiftCore.dylib                 0x0000000199ae7904 swift::runtime::AccessSet::insert(swift::runtime::Access*, void*, void*, swift::ExclusivityFlags) + 476
1    libswiftCore.dylib                 0x0000000199a82bd0 swift_beginAccess + 84
2    slotstream                         0x0000000101481b70 closure #1 in Generator.generate(promptIds:params:eosIds:cache:vision:shouldContinue:onToken:request:onAdmitted:) + 896
3    slotstream                         0x0000000101483180 specialized Generator.speculativeDecode(head:mtpState:state:logits:params:eosIds:shouldContinue:contextLimit:checkAllocation:onToken:out:generated:reason:consumed:stats:) + 348
4    slotstream                         0x0000000101473110 Generator.generate(promptIds:params:eosIds:cache:vision:shouldContinue:onToken:request:onAdmitted:) + 29388
5    slotstream                         0x00000001016182f0 static Diagnostics.optimizationPrefixRetention(modelDir:mtp:) + 1508
6    slotstream                         0x00000001016e6f6c OptimizationStateCheck.run() + 22152
7    slotstream                         0x00000001016f2d1c protocol witness for ParsableCommand.run() in conformance OptimizationStateCheck + 52
8    slotstream                         0x00000001016995f8 main + 96
9    dyld                               0x0000000185f62994 start + 6992
Fatal access conflict detected.

````

Artifact `/tmp/slotstream-context-implementation-20260906/prefix-retention-mtp-17/manifest.json` — 23285 bytes, SHA-256 `3cbac7a777ea14cfde0c5c8d3a746003112ef85dcf325a6da3e8b05ca64a4a9c`.

````text
{
  "binary": "/private/tmp/slotstream-context-implementation-20260906/build-17/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "457d65426cca792bd8c1bd28e7d5bbcc812664090b535eeb0d355302679995d6",
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
      "Sources/Slotstream/Context.swift": "63208fab453c9f87a15fdbd2990291cdc3120efc3087ec5fbab455d4239ce288",
      "Sources/Slotstream/ContextFeasibility.swift": "d57d9f89162d49f159c45ad3bdbd8c6aa671f2094211af5943a936bbacdf6664",
      "Sources/Slotstream/ContextMemory.swift": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/DownloadHTTP.swift": "341a7a7157c575658ee7d7bc6c77ed593bf30f79d8c262906d7672e2e40c6cbc",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "3dfd6457fbec91fc636e1bdcd432af805c77304cd798e82c6f8b097f3738339c",
      "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "5d43a1c419baa3b373aa491fb15b413a9692334f2774153082de8af0807adeaf",
      "Sources/Slotstream/Governor.swift": "af44af93916c9fcbea08744c9d343915e65914edf69909dfe25c420ff0b9a129",
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
      "Sources/Slotstream/Optimizations.swift": "0739230d9ebfc0e0881a82add63660a48872c44ac3b5d709b9fe867105a4ee7a",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PackedProjectionPair.swift": "84fa87130270092c16a538f7d50cfee55e71b52ecd8250a1bce7e0547c8b1d96",
      "Sources/Slotstream/PartialRotation.swift": "57177495e6ba630c66744b2b9e2bde23acf9349fca52b97a4ea406c5839c7f8f",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "f30c4c4bfeaf49c5e2dfcbfa728d6eab44d02a1f77d40217e84723fd03761d87",
      "Sources/Slotstream/PinnedTransportManifest.swift": "6b0de220938fc91dd4dc24cd0fc9dffa086f09f04cd83823dc3de3a13de8ac11",
      "Sources/Slotstream/Plan.swift": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
      "Sources/Slotstream/PrefixCache.swift": "3bd1841ec1bebb52b210d75b0fd4d4bdb0e49277ff9c529aebbc7227d94811d8",
      "Sources/Slotstream/PressureBoundary.swift": "ed22537fccc321589eb3d33b3538984630daae951d00e4ac829412897b181a3d",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RequestControl.swift": "fcb9d2f4cc676cc1db7f2a35442948b6248eab658f56a81a16f629b3274fb655",
      "Sources/Slotstream/ResidentExpertOverlap.swift": "4ddb3a027d92697dcc1e7373e66fc139abdc12063448d864ef635e5202f57dde",
      "Sources/Slotstream/RouterProjection.swift": "98ea668ac6f47549ec9cdee41b81109e66f11935946d2d1587ebf97ad106230d",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "ecd2aa75aa09b6cde14a46bb27e91bf76dd13f77f25e409178c1669adf94810b",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "e4a88b55578952d038c2892948665d91a8ba7d1d816578fce5fc8b2ceef76ce2",
      "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
      "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "86cb6127bd84f33a036a92a0ef561925d141ae1b257aac46c8a55c10d30406a2",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747",
      "Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift": "90b83306d1966da794daf28cc84f426a42cd853075f5e236cf1bacae10787d8f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProjection.swift": "450a558155202d247a8bb73348a381ea35c7c06ed82999a3df356dcc65b2c930",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5d0e619769c0f7d4ea8c73439ac44bc499db6184c4954b417f4cb7804aec20e8",
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "a3cb658bbf29d1f119da68d517fba8e73db64a8ce6b698d14b5671fc25af5ccd",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "09740bc89178780c21bd778a3a8e07d55ad867691e050619a4d29c9e1d6ab8be",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "34e74989d1f4fd2fcc9fd8cb9b0f1fc75c0e4e1c214751f44245f2543270ab09",
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
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "5bf0d9a1ad4ba5759e1301a0534c0412eede0653f335b11c9341e0caebda66f8",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
      "Sources/SlotstreamTestKit/T0Checks.swift": "d371b062ce0544477957dc02f525b54f3022e9c2ae128cbb5f3b3d5e66b219f3",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "ac3bdf70521f77c42fada851e132a1561c4ee06e5057302cb3f50d8f3cc597d3",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "534f2c4273d9401478c1012026d23f3376e45979108fffed5d227f32ac3f9af8",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
      "Sources/slotstream-cli/main.swift": "a7291c58fa698be74e50964e22f1a1ddbc6584bdd02e9462fac54a6672706b36",
      "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "f6b812717fa77bf32bfa998b328ec5023c7e1a1a510b257ceb82f27edef9d1fe",
    "binary_sha256": "932c662f914981f240ed7b917847e9bc8a44a31aaf77428f8343c74cef9e5034",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13.0,
  "timeout_seconds": 600,
  "command": [
    "/private/tmp/slotstream-context-implementation-20260906/build-17/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "prefix-retention-mtp",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29520232448,
    "swapins": 43807378,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                     3926.\nPages active:                                 864785.\nPages inactive:                              1641865.\nPages speculative:                              4131.\nPages throttled:                                   0.\nPages wired down:                             226251.\nPages purgeable:                                 114.\n\"Translation faults\":                    14880779664.\nPages copy-on-write:                       693626604.\nPages zero filled:                       20268739098.\nPages reactivated:                        3318491687.\nPages purged:                               69972384.\nFile-backed pages:                           1797732.\nAnonymous pages:                              713049.\nPages stored in compressor:                  1608349.\nPages occupied by compressor:                 344211.\nDecompressions:                           1138751052.\nCompressions:                             1449746312.\nPageins:                                  7097447071.\nPageouts:                                   10977022.\nSwapins:                                    43807378.\nSwapouts:                                   77363385.\nPages tagged:                                 158492.\nPages tagged resident:                        126604.\nPages tagged compressed:                       31888.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7337.\nPages tag-storage free:                          257.\nPages tag-storage non-tag pageable:            90702.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5598016.\nTagged compressions:                        10803978.\nTagged decompressions:                       9976514.\n"
  },
  "preflight_wait": {
    "seconds": 0.00334854200000001,
    "attempts": 1,
    "limit_seconds": 0
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 198,
  "duration_seconds": 95.17224941699999,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 33265827840,
    "swapins": 43807398,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   459436.\nPages active:                                 915859.\nPages inactive:                               827107.\nPages speculative:                             91721.\nPages throttled:                                   0.\nPages wired down:                             221941.\nPages purgeable:                                  18.\n\"Translation faults\":                    14881707312.\nPages copy-on-write:                       693673598.\nPages zero filled:                       20290800915.\nPages reactivated:                        3319888553.\nPages purged:                               69988147.\nFile-backed pages:                           1570931.\nAnonymous pages:                              263756.\nPages stored in compressor:                  2027095.\nPages occupied by compressor:                 568265.\nDecompressions:                           1140111681.\nCompressions:                             1451577286.\nPageins:                                  7098675906.\nPageouts:                                   10977659.\nSwapins:                                    43807398.\nSwapouts:                                   77363385.\nPages tagged:                                 152993.\nPages tagged resident:                        111717.\nPages tagged compressed:                       41276.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6842.\nPages tag-storage free:                         1482.\nPages tag-storage non-tag pageable:            89972.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7519680.\nTagged compressions:                        10817300.\nTagged decompressions:                       9979856.\n"
  }
}

````

Artifact `/tmp/slotstream-context-implementation-20260906/prefix-retention-mtp-17/stdout.txt` — 18824 bytes, SHA-256 `a0bf94c777e6099cc185469d2c102dc5ef398a214e4eb0d7afa8ff5a3fefc252`.

````text
{
  "items" : [
    {
      "name" : "seed succeeds without output",
      "passed" : true
    },
    {
      "name" : "seed is exactly committed",
      "passed" : true
    },
    {
      "name" : "seed draft is aligned",
      "passed" : true
    },
    {
      "name" : "budget 0: exact two-state fit",
      "passed" : true
    },
    {
      "name" : "budget 0: retained charge",
      "passed" : true
    },
    {
      "name" : "budget 0: store count",
      "passed" : true
    },
    {
      "name" : "budget 1110: exact two-state fit",
      "passed" : true
    },
    {
      "name" : "budget 1110: retained charge",
      "passed" : true
    },
    {
      "name" : "budget 1110: store count",
      "passed" : true
    },
    {
      "name" : "budget 2219: exact two-state fit",
      "passed" : true
    },
    {
      "name" : "budget 2219: retained charge",
      "passed" : true
    },
    {
      "name" : "budget 2219: store count",
      "passed" : true
    },
    {
      "name" : "budget 2220: exact two-state fit",
      "passed" : true
    },
    {
      "name" : "budget 2220: retained charge",
      "passed" : true
    },
    {
      "name" : "budget 2220: store count",
      "passed" : true
    },
    {
      "name" : "budget 3330: exact two-state fit",
      "passed" : true
    },
    {
      "name" : "budget 3330: retained charge",
      "passed" : true
    },
    {
      "name" : "budget 3330: store count",
      "passed" : true
    },
    {
      "name" : "budget 4440: exact two-state fit",
      "passed" : true
    },
    {
      "name" : "budget 4440: retained charge",
      "passed" : true
    },
    {
      "name" : "budget 4440: store count",
      "passed" : true
    },
    {
      "name" : "budget 8880: exact two-state fit",
      "passed" : true
    },
    {
      "name" : "budget 8880: retained charge",
      "passed" : true
    },
    {
      "name" : "budget 8880: store count",
      "passed" : true
    },
    {
      "name" : "initial retention",
      "passed" : true
    },
    {
      "name" : "same committed prefix is deduplicated",
      "passed" : true
    },
    {
      "name" : "dedup allocates no new checkpoint",
      "passed" : true
    },
    {
      "name" : "one frozen entry",
      "passed" : true
    },
    {
      "name" : "input checkpoint cannot become assistant output",
      "passed" : true
    },
    {
      "name" : "equal length cannot produce next logits",
      "passed" : true
    },
    {
      "name" : "edited earlier token misses",
      "passed" : true
    },
    {
      "name" : "branch 0: independent root",
      "passed" : true
    },
    {
      "name" : "branch 0: exact represented state",
      "passed" : true
    },
    {
      "name" : "branch 0: retained snapshot survives",
      "passed" : true
    },
    {
      "name" : "branch 0: reuse count",
      "passed" : true
    },
    {
      "name" : "branch 1: independent root",
      "passed" : true
    },
    {
      "name" : "branch 1: exact represented state",
      "passed" : true
    },
    {
      "name" : "branch 1: retained snapshot survives",
      "passed" : true
    },
    {
      "name" : "branch 1: reuse count",
      "passed" : true
    },
    {
      "name" : "branch 2: independent root",
      "passed" : true
    },
    {
      "name" : "branch 2: exact represented state",
      "passed" : true
    },
    {
      "name" : "branch 2: retained snapshot survives",
      "passed" : true
    },
    {
      "name" : "branch 2: reuse count",
      "passed" : true
    },
    {
      "name" : "three reusable hits",
      "passed" : true
    },
    {
      "name" : "ordinary return preserves reusable status",
      "passed" : true
    },
    {
      "name" : "ordinary return preserves private state",
      "passed" : true
    },
    {
      "name" : "huge token reservation refuses without eviction",
      "passed" : true
    },
    {
      "name" : "huge byte reservation refuses without eviction",
      "passed" : true
    },
    {
      "name" : "refusal preserves coherent checkpoint",
      "passed" : true
    },
    {
      "name" : "four retained states while idle",
      "passed" : true
    },
    {
      "name" : "existing checkpoint survives room for active branch",
      "passed" : true
    },
    {
      "name" : "at most three retained plus producer",
      "passed" : true
    },
    {
      "name" : "reseed before longest-match fixture",
      "passed" : true
    },
    {
      "name" : "ordinary output still available for splicing",
      "passed" : true
    },
    {
      "name" : "longer ordinary entry wins",
      "passed" : true
    },
    {
      "name" : "longer ordinary reuse",
      "passed" : true
    },
    {
      "name" : "shorter common checkpoint stays retained",
      "passed" : true
    },
    {
      "name" : "tight reservation transfers coherent ownership",
      "passed" : true
    },
    {
      "name" : "transfer avoids extra fork",
      "passed" : true
    },
    {
      "name" : "transferred checkpoint no longer retained",
      "passed" : true
    },
    {
      "name" : "transferred bytes are intact",
      "passed" : true
    },
    {
      "name" : "lifecycle 0: seed",
      "passed" : true
    },
    {
      "name" : "lifecycle 0: retention released",
      "passed" : true
    },
    {
      "name" : "lifecycle 0: active branch survives",
      "passed" : true
    },
    {
      "name" : "lifecycle 1: seed",
      "passed" : true
    },
    {
      "name" : "lifecycle 1: retention released",
      "passed" : true
    },
    {
      "name" : "lifecycle 1: active branch survives",
      "passed" : true
    },
    {
      "name" : "lifecycle 1: refuses new retention",
      "passed" : true
    },
    {
      "name" : "lifecycle 2: seed",
      "passed" : true
    },
    {
      "name" : "lifecycle 2: retention released",
      "passed" : true
    },
    {
      "name" : "lifecycle 2: active branch survives",
      "passed" : true
    },
    {
      "name" : "lifecycle 2: refuses new retention",
      "passed" : true
    },
    {
      "name" : "lifecycle 3: seed",
      "passed" : true
    },
    {
      "name" : "released budget cannot be resurrected",
      "passed" : true
    },
    {
      "name" : "lifecycle 3: retention released",
      "passed" : true
    },
    {
      "name" : "lifecycle 3: active branch survives",
      "passed" : true
    },
    {
      "name" : "lifecycle 3: refuses new retention",
      "passed" : true
    },
    {
      "name" : "validation seed",
      "passed" : true
    },
    {
      "name" : "wrong token count",
      "passed" : true
    },
    {
      "name" : "wrong token count: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "recording state",
      "passed" : true
    },
    {
      "name" : "recording state: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "misaligned draft state",
      "passed" : true
    },
    {
      "name" : "misaligned draft state: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "misaligned draft fork",
      "passed" : true
    },
    {
      "name" : "misaligned draft fork: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "partial layer0: read error",
      "passed" : true
    },
    {
      "name" : "partial layer0: fault fired",
      "passed" : true
    },
    {
      "name" : "partial layer0: old count alone is insufficient",
      "passed" : true
    },
    {
      "name" : "partial layer0: cannot publish checkpoint",
      "passed" : true
    },
    {
      "name" : "partial layer0: cannot publish checkpoint: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "partial layer0: cannot fork",
      "passed" : true
    },
    {
      "name" : "partial layer0: cannot fork: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "partial layer0: cannot continue",
      "passed" : true
    },
    {
      "name" : "partial layer0: cannot continue: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "partial layer0: ordinary cache refuses too",
      "passed" : true
    },
    {
      "name" : "partial layer0: restore recovers exact state",
      "passed" : true
    },
    {
      "name" : "partial layer0: restored prefix can fork",
      "passed" : true
    },
    {
      "name" : "partial layer0: pins released",
      "passed" : true
    },
    {
      "name" : "partial layer3: read error",
      "passed" : true
    },
    {
      "name" : "partial layer3: fault fired",
      "passed" : true
    },
    {
      "name" : "partial layer3: old count alone is insufficient",
      "passed" : true
    },
    {
      "name" : "partial layer3: cannot publish checkpoint",
      "passed" : true
    },
    {
      "name" : "partial layer3: cannot publish checkpoint: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "partial layer3: cannot fork",
      "passed" : true
    },
    {
      "name" : "partial layer3: cannot fork: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "partial layer3: cannot continue",
      "passed" : true
    },
    {
      "name" : "partial layer3: cannot continue: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "partial layer3: ordinary cache refuses too",
      "passed" : true
    },
    {
      "name" : "partial layer3: restore recovers exact state",
      "passed" : true
    },
    {
      "name" : "partial layer3: restored prefix can fork",
      "passed" : true
    },
    {
      "name" : "partial layer3: pins released",
      "passed" : true
    },
    {
      "name" : "malformed image [Slotstream.ImageSegment(start: -1, count: 1, hash: Slotstream.ImageHash(hi: 17, lo: 23), preparationIdentity: nil)]",
      "passed" : true
    },
    {
      "name" : "malformed image [Slotstream.ImageSegment(start: -1, count: 1, hash: Slotstream.ImageHash(hi: 17, lo: 23), preparationIdentity: nil)]: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "malformed image [Slotstream.ImageSegment(start: 0, count: 0, hash: Slotstream.ImageHash(hi: 17, lo: 23), preparationIdentity: nil)]",
      "passed" : true
    },
    {
      "name" : "malformed image [Slotstream.ImageSegment(start: 0, count: 0, hash: Slotstream.ImageHash(hi: 17, lo: 23), preparationIdentity: nil)]: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "malformed image [Slotstream.ImageSegment(start: 9223372036854775807, count: 1, hash: Slotstream.ImageHash(hi: 17, lo: 23), preparationIdentity: nil)]",
      "passed" : true
    },
    {
      "name" : "malformed image [Slotstream.ImageSegment(start: 9223372036854775807, count: 1, hash: Slotstream.ImageHash(hi: 17, lo: 23), preparationIdentity: nil)]: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "malformed image [Slotstream.ImageSegment(start: 2, count: 10, hash: Slotstream.ImageHash(hi: 17, lo: 23), preparationIdentity: nil), Slotstream.ImageSegment(start: 3, count: 2, hash: Slotstream.ImageHash(hi: 17, lo: 23), preparationIdentity: nil)]",
      "passed" : true
    },
    {
      "name" : "malformed image [Slotstream.ImageSegment(start: 2, count: 10, hash: Slotstream.ImageHash(hi: 17, lo: 23), preparationIdentity: nil), Slotstream.ImageSegment(start: 3, count: 2, hash: Slotstream.ImageHash(hi: 17, lo: 23), preparationIdentity: nil)]: no prior checkpoint lost",
      "passed" : true
    },
    {
      "name" : "partial image and future span retained correctly",
      "passed" : true
    },
    {
      "name" : "future image absent from checkpoint",
      "passed" : true
    },
    {
      "name" : "same partial image hits",
      "passed" : true
    },
    {
      "name" : "image versus text misses",
      "passed" : true
    },
    {
      "name" : "different pixels miss",
      "passed" : true
    },
    {
      "name" : "different preparation misses",
      "passed" : true
    },
    {
      "name" : "reference generation succeeds",
      "passed" : true
    },
    {
      "name" : "request 0: succeeds",
      "passed" : true
    },
    {
      "name" : "request 0: exact output",
      "passed" : true
    },
    {
      "name" : "request 0: exact reused prefix",
      "passed" : true
    },
    {
      "name" : "request 0: fork observation",
      "passed" : true
    },
    {
      "name" : "request 0: checkpoint error count",
      "passed" : true
    },
    {
      "name" : "request 0: snapshot remains reusable",
      "passed" : true
    },
    {
      "name" : "request 0: draft verification still runs",
      "passed" : true
    },
    {
      "name" : "request 1: succeeds",
      "passed" : true
    },
    {
      "name" : "request 1: exact output",
      "passed" : true
    },
    {
      "name" : "request 1: exact reused prefix",
      "passed" : true
    },
    {
      "name" : "request 1: fork observation",
      "passed" : true
    },
    {
      "name" : "request 1: checkpoint error count",
      "passed" : true
    },
    {
      "name" : "request 1: snapshot remains reusable",
      "passed" : true
    },
    {
      "name" : "request 1: draft verification still runs",
      "passed" : true
    },
    {
      "name" : "request 2: succeeds",
      "passed" : true
    },
    {
      "name" : "request 2: exact output",
      "passed" : true
    },
    {
      "name" : "request 2: exact reused prefix",
      "passed" : true
    },
    {
      "name" : "request 2: fork observation",
      "passed" : true
    },
    {
      "name" : "request 2: checkpoint error count",
      "passed" : true
    },
    {
      "name" : "request 2: snapshot remains reusable",
      "passed" : true
    },
    {
      "name" : "request 2: draft verification still runs",
      "passed" : true
    },
    {
      "name" : "divergent client 0: direct and branch succeed",
      "passed" : true
    },
    {
      "name" : "divergent client 0: shared prefix reused",
      "passed" : true
    },
    {
      "name" : "divergent client 0: exact output",
      "passed" : true
    },
    {
      "name" : "auxiliary request 0: succeeds",
      "passed" : true
    },
    {
      "name" : "auxiliary request 0: does not steal common prefix",
      "passed" : true
    },
    {
      "name" : "auxiliary request 0: respects state count",
      "passed" : true
    },
    {
      "name" : "divergent client 1: direct and branch succeed",
      "passed" : true
    },
    {
      "name" : "divergent client 1: shared prefix reused",
      "passed" : true
    },
    {
      "name" : "divergent client 1: exact output",
      "passed" : true
    },
    {
      "name" : "auxiliary request 1: succeeds",
      "passed" : true
    },
    {
      "name" : "auxiliary request 1: does not steal common prefix",
      "passed" : true
    },
    {
      "name" : "auxiliary request 1: respects state count",
      "passed" : true
    },
    {
      "name" : "divergent client 2: direct and branch succeed",
      "passed" : true
    },
    {
      "name" : "divergent client 2: shared prefix reused",
      "passed" : true
    },
    {
      "name" : "divergent client 2: exact output",
      "passed" : true
    },
    {
      "name" : "auxiliary request 2: succeeds",
      "passed" : true
    },
    {
      "name" : "auxiliary request 2: does not steal common prefix",
      "passed" : true
    },
    {
      "name" : "auxiliary request 2: respects state count",
      "passed" : true
    },
    {
      "name" : "boundary cancellation emits nothing",
      "passed" : true
    },
    {
      "name" : "boundary cancellation preserves checkpoint",
      "passed" : true
    },
    {
      "name" : "boundary cancellation has exact committed bytes",
      "passed" : true
    },
    {
      "name" : "second-pass fault exercised",
      "passed" : true
    },
    {
      "name" : "second-pass failure reported without output",
      "passed" : true
    },
    {
      "name" : "failure retains only the committed prefix",
      "passed" : true
    },
    {
      "name" : "failure leaves no request pins",
      "passed" : true
    },
    {
      "name" : "retry resumes committed prefix",
      "passed" : true
    },
    {
      "name" : "retry succeeds",
      "passed" : true
    },
    {
      "name" : "retry produces exact output",
      "passed" : true
    },
    {
      "name" : "absent boundary changes no batching",
      "passed" : true
    },
    {
      "name" : "absent boundary retains no checkpoint",
      "passed" : true
    },
    {
      "name" : "absent boundary exact output",
      "passed" : true
    },
    {
      "name" : "producer remains unchanged throughout",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 0: exact delivery boundary",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 0: failure code",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 0: failure is observable",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 0: invalid request state is not retained",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 0: all request pins released",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 1: exact delivery boundary",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 1: failure code",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 1: failure is observable",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 1: invalid request state is not retained",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 1: all request pins released",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 3: exact delivery boundary",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 3: failure code",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 3: failure is observable",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 3: invalid request state is not retained",
      "passed" : true
    },
    {
      "name" : "typed MTP cancel 3: all request pins released",
      "passed" : true
    },
    {
      "name" : "typed MTP cancellation recovers on a fresh request",
      "passed" : true
    },
    {
      "name" : "typed MTP recovery completes its reply",
      "passed" : true
    },
    {
      "name" : "typed MTP recovery releases its pins",
      "passed" : true
    }
  ],
  "measurements" : {
    "checkpoint_allocated_sequence_bytes" : 30670848,
    "checkpoint_charged_tokens" : 1110,
    "end_physical_bytes" : 7407030952
  },
  "name" : "optimization-prefix-retention-mtp",
  "passed" : true
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/remaining-qualification-preparation-v180/source.patch` — 7286 bytes, SHA-256 `b46e8e3a74080a8bb5f9cd5f433b004752173cf4f23816c202f3c97ddd30ef8b`.

````text
--- v176/Sources/Slotstream/Generate.swift
+++ prepared/Sources/Slotstream/Generate.swift
@@ -439,6 +439,9 @@
         sampler.deviceDraw = model.optimizations.deviceSamplerDraw
         if let s = params.seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
         var stats = GenStats()
+        // The speculative loop borrows stats as inout. Its continuation
+        // callback must record cancellation outside that exclusive borrow.
+        var callerCancellation: RequestFailure?
         stats.promptTokens = promptIds.count
         let embeddingHitsStart = model.resident.embeddingRowHits
         let embeddingMissesStart = model.resident.embeddingRowMisses
@@ -451,6 +454,9 @@
             if let failure = request?.failure {
                 stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
                 stats.memoryPressureCancelled = failure.code == .insufficientMemory
+            } else if let failure = callerCancellation {
+                stats.requestFailure = failure
+                stats.finishReason = "cancelled"
             } else if stats.requestFailure?.code == .clientCancelled {
                 stats.finishReason = "cancelled"
             }
@@ -549,9 +555,7 @@
             if shouldContinue?() == false {
                 let failure = request?.failure ?? RequestFailure(.clientCancelled, "inference was cancelled by its caller")
                 request?.fail(failure)
-                stats.requestFailure = failure
-                if request != nil { stats.runtimeError = failure.message }
-                stats.finishReason = "cancelled"
+                callerCancellation = failure
                 return false
             }
             return true
--- v176/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift
+++ prepared/Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift
@@ -241,20 +241,29 @@
     }
 
     public static func optimizationMTPWork(modelDir: URL) throws -> CheckReport {
+        try optimizationMTPWork(modelDir: modelDir, integratedBase: false)
+    }
+
+    package static func optimizationMTPWork(modelDir: URL, integratedBase: Bool) throws -> CheckReport {
         MLX.Memory.cacheLimit = 128 << 20
-        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
+        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640,
+            embeddingRowCache: integratedBase ? true : nil)
         try model.enableMTP(modelDir: modelDir)
         let generator = Generator(model: model)
-        model.optimizations = InferenceOptimizations()
+        model.optimizations = integratedBase ? .integrationCandidate : InferenceOptimizations()
         model.optimizations.compactStateWindows = true
         model.optimizations.compactMTPRow = true
-        model.optimizations.fusedGDNRecording = true
-        var c = CheckBuilder("optimization-mtp-work")
+        model.optimizations.fusedGDNRecording = !integratedBase
+        var c = CheckBuilder(integratedBase ? "optimization-mtp-work-integrated" : "optimization-mtp-work")
         let prompt = [151644, 8948, 198, 40, 1079, 25, 1237, 460, 11, 279, 1917]
         for depth in [1, 3] {
             generator.draftDepth = depth
-            for limit in [1, 2, 5] {
+            for sampled in [false, true] { for limit in [1, 2, 5] {
                 var params = SampleParams.greedy; params.maxTokens = limit; params.seed = 7
+                if sampled {
+                    params.temperature = 0.7; params.topK = 40
+                    params.topP = 0.8; params.minP = 0.05; params.presencePenalty = 1.1
+                }
                 model.optimizations.reuseFirstMTPEntry = false
                 model.optimizations.boundedDraftTail = false
                 let (reference, _) = generator.generate(promptIds: prompt, params: params, eosIds: [])
@@ -263,10 +272,12 @@
                     model.optimizations.boundedDraftTail = mode != "first"
                     let cache = PrefixCache(maxTokens: 4096)
                     let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
-                    let name = "depth \(depth), limit \(limit), \(mode)"
+                    let name = "depth \(depth), sampled \(sampled), limit \(limit), \(mode)"
                     c.equal("\(name): emitted count", ids.count, limit)
                     c.equal("\(name): stable fixture output", ids, reference)
-                    let hit = cache.take(matching: prompt + ids + [907], reserveTokens: 1024)!
+                    let retained = cache.take(matching: prompt + ids + [907], reserveTokens: 1024)
+                    c.expect("\(name): retained committed prefix", retained != nil)
+                    guard let hit = retained else { continue }
                     c.expect("\(name): aligned draft", hit.state.hasValidMTP)
                     c.expect("\(name): consumed prefix within emitted tokens",
                         hit.state.tokenCount >= prompt.count && hit.state.tokenCount <= prompt.count + ids.count)
@@ -282,7 +293,7 @@
                         c.equal("\(name): first entry reused each round", stats.reusedHeadTokens, stats.verifyPasses)
                     }
                 }
-            }
+            } }
         }
         return c.report()
     }
--- v176/Sources/slotstream-cli/OptimizationCommands.swift
+++ prepared/Sources/slotstream-cli/OptimizationCommands.swift
@@ -127,6 +127,10 @@
         else if variant == "pool-requests" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL) }
         else if variant == "packed-layout-component" { report = try Diagnostics.optimizationPackedLayout() }
         else if variant == "ngram-lookahead-rows" { report = try Diagnostics.optimizationNgramLookahead(modelDir:model.modelURL) }
+        else if ["ngram-cache-reference", "ngram-cache-compact", "ngram-cache-reference-ring", "ngram-cache-compact-ring"].contains(variant) {
+            report = try Diagnostics.optimizationNgramCache(modelDir: model.modelURL,
+                compact: variant.contains("compact"), ring: variant.hasSuffix("-ring"))
+        }
         else if variant == "ngram-lookahead-ticket" { report = try Diagnostics.optimizationNgramPrefetchTicket() }
         else if variant == "ngram-lookahead-recovery" || variant == "ngram-lookahead-recovery-mtp" {
             report = try Diagnostics.optimizationRequestReadRecovery(modelDir:model.modelURL,
@@ -178,6 +182,9 @@
         else if variant == "output-tcp" { report = try Diagnostics.optimizationOutputTCP() }
         else if variant == "scope-mtp-vision" { report = try Diagnostics.optimizationScopeMTPVision(modelDir: model.modelURL) }
         else if variant == "mtp-work" { report = try Diagnostics.optimizationMTPWork(modelDir: model.modelURL) }
+        else if variant == "mtp-work-integrated" {
+            report = try Diagnostics.optimizationMTPWork(modelDir: model.modelURL, integratedBase: true)
+        }
         else if variant == "scope-integrated-family" {
             report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens,
                 scoped: true, integratedBase: true)

````

Artifact `/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift` — 8180 bytes, SHA-256 `b40cdb32dc9864c7e34edf54d6806b16aef6adab2675c444416c13b955d2daca`.

````text
import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// One fresh-process arm of the full-cache component study. It executes
    /// the real PLE row hashing, reads, cache, and embedding assembly only;
    /// no language-model layer or expert matmul runs. Serving is a later gate.
    package static func optimizationNgramCache(modelDir: URL, compact: Bool, ring: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 10,
            embeddingRowCache: true)
        var options = InferenceOptimizations()
        options.compactNgramRows = compact; options.ngramRingOrder = ring
        model.optimizations = options
        let store = model.ngram
        var c = CheckBuilder("optimization-ngram-cache-\(compact ? "compact" : "reference")\(ring ? "-ring" : "")")
        let fillTokens = 32_768, tile = 256, evictionTokens = 4_096, warmCalls = 128
        let ids: [Int64] = (0..<(fillTokens + evictionTokens)).map {
            $0 % 997 == 996 ? Int64(model.cfg.eosTokenId) : Int64(1000 + ($0 * 7919) % 200_000)
        }
        var hashes: [String: String] = [:]
        func hash(_ values: [UInt8]) -> String { SHA256.hash(data: Data(values)).map { String(format: "%02x", $0) }.joined() }
        hashes["input_ids"] = ids.withUnsafeBytes { hash(Array($0)) }
        func embed(_ begin: Int, _ count: Int) throws -> MLXArray {
            let history = Array(ids[max(0, begin - (model.cfg.ngramSize - 1))..<begin + count])
            return try store.embeddingChecked(history: history, nNew: count)
        }
        func checkResources(_ stage: String) throws {
            guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 7_000_000_000,
                  ProcessMemory.residentBytes() > 0, ProcessMemory.residentBytes() <= 5_000_000_000 else {
                throw ModelError("ngram component headroom/footprint limit during \(stage)")
            }
        }
        try checkResources("entry")
        let vmBefore = ProcessMemory.vmActivity(), powerBefore = ProcessMemory.operatingConditions()
        let sampler = FootprintSampler()
        let physicalBefore = ProcessMemory.residentBytes()
        var fillHash = SHA256()
        var lastFillHash = ""
        let fillStart = RuntimeClock.now()
        for begin in stride(from: 0, to: fillTokens, by: tile) {
            try autoreleasepool {
                let value = try embed(begin, tile)
                // Hash every emitted BF16 value. This is parity evidence;
                // fill time explicitly includes hashing and is secondary.
                let bytes = value.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
                fillHash.update(data: Data(bytes))
                if begin + tile == fillTokens { lastFillHash = hash(bytes) }
            }
            try checkResources("fill")
        }
        let fillSeconds = RuntimeClock.seconds(since: fillStart)
        hashes["fill_embeddings"] = fillHash.finalize().map { String(format: "%02x", $0) }.joined()
        let filledRows = store.cachedRowCount, filledPayload = store.cachedPayloadBytes
        Stream.gpu.synchronize(); MLX.Memory.clearCache()
        let physicalFilled = ProcessMemory.residentBytes()
        c.expect("large cache reached eviction regime", filledRows >= 360_000 && filledRows <= 400_000)
        c.equal("payload follows actual retained rows", filledPayload, filledRows * 160 * (compact ? 2 : 4))
        for _ in 0..<2 { eval(try embed(fillTokens - tile, tile)) }
        store.resetStats()
        let lookupStart = RuntimeClock.now()
        for _ in 0..<warmCalls { eval(try embed(fillTokens - tile, tile)) }
        let lookupSeconds = RuntimeClock.seconds(since: lookupStart)
        c.equal("warm assembly reads no new rows", store.rowMisses, 0)
        c.equal("warm assembly preserves cache occupancy", store.cachedRowCount, filledRows)
        c.measure("warm_row_hits", Double(store.rowHits))
        let warmHash = hash(try embed(fillTokens - tile, tile).reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))
        c.equal("cache-hit output matches the original fill", warmHash, lastFillHash)
        hashes["warm_embedding"] = warmHash
        store.resetStats()
        var evictionHash = SHA256(), evictionSeconds = 0.0
        for begin in stride(from: fillTokens, to: fillTokens + evictionTokens, by: tile) {
            try autoreleasepool {
                let start = RuntimeClock.now()
                let value = try embed(begin, tile); eval(value)
                evictionSeconds += RuntimeClock.seconds(since: start)
                evictionHash.update(data: Data(value.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)))
            }
            try checkResources("eviction")
        }
        hashes["eviction_embeddings"] = evictionHash.finalize().map { String(format: "%02x", $0) }.joined()
        let misses = store.rowMisses
        // At least one full 40,000-row FIFO batch must have been evicted;
        // a merely large cache would not exercise either queue implementation.
        c.expect("measured phase crosses a full eviction batch", misses > 40_000 && filledRows + misses > 400_000)
        c.expect("cache remains bounded after eviction", store.cachedRowCount <= 400_000)
        c.expect("all row workers joined", !store.hasPendingPrefetch)
        Stream.gpu.synchronize(); MLX.Memory.clearCache()
        let footprint = sampler.finish(), vmAfter = ProcessMemory.vmActivity()
        let powerAfter = ProcessMemory.operatingConditions()
        c.expect("complete component VM interval is observable", vmBefore != nil && vmAfter != nil)
        // These observations exclude a performance interval without turning
        // unchanged arithmetic into a failed correctness assertion.
        if let vmBefore, let vmAfter {
            c.measure("swapins_before", Double(vmBefore.swapins)); c.measure("swapins_after", Double(vmAfter.swapins))
            c.measure("swapouts_before", Double(vmBefore.swapouts)); c.measure("swapouts_after", Double(vmAfter.swapouts))
        }
        c.measure("nominal_thermal_endpoints", powerBefore.thermalState == "nominal" && powerAfter.thermalState == "nominal" ? 1 : 0)
        c.measure("normal_power_endpoints", !powerBefore.lowPowerModeEnabled && !powerAfter.lowPowerModeEnabled ? 1 : 0)
        c.expect("sampled footprint is bounded", footprint.samples > 1 && footprint.peakBytes <= 5_000_000_000)
        c.expect("lifetime RSS is separately bounded", ProcessMemory.lifetimeRSSPeakBytes() > 0 && ProcessMemory.lifetimeRSSPeakBytes() <= 5_000_000_000)
        c.measure("compact", compact ? 1 : 0); c.measure("ring", ring ? 1 : 0)
        c.measure("fill_tokens", Double(fillTokens)); c.measure("tile_tokens", Double(tile))
        c.measure("eviction_tokens", Double(evictionTokens)); c.measure("warm_calls", Double(warmCalls))
        c.measure("filled_rows", Double(filledRows)); c.measure("filled_payload_bytes", Double(filledPayload))
        c.measure("end_rows", Double(store.cachedRowCount)); c.measure("end_payload_bytes", Double(store.cachedPayloadBytes))
        c.measure("fill_seconds_including_hash", fillSeconds)
        c.measure("warm_assembly_seconds_per_call", lookupSeconds / Double(warmCalls))
        c.measure("eviction_assembly_seconds", evictionSeconds); c.measure("eviction_row_misses", Double(misses))
        c.measure("physical_before_bytes", Double(physicalBefore)); c.measure("physical_filled_bytes", Double(physicalFilled))
        c.measure("physical_end_bytes", Double(ProcessMemory.residentBytes()))
        c.measure("sampled_peak_bytes", Double(footprint.peakBytes)); c.measure("sampled_count", Double(footprint.samples))
        c.measure("lifetime_rss_peak_bytes", Double(ProcessMemory.lifetimeRSSPeakBytes()))
        c.measure("mlx_active_bytes", Double(MLX.Memory.activeMemory))
        var report = c.report()
        for key in hashes.keys.sorted() {
            report.items.append(CheckItem(name: "sha256:\(key)", passed: true, detail: hashes[key]))
        }
        return report
    }
}

````

Artifact `/Users/carlos/Projects/slotstream/Tools/ngram_cache_probe.py` — 17701 bytes, SHA-256 `01e295b269d94350730c46a59edf7a62b562c9c45f6456c2d9947862835a57e7`.

````text
#!/usr/bin/env python3
"""Fresh-process full n-gram cache study. No full-model inference claim."""
import argparse
import json
import math
import os
from pathlib import Path
import shutil
import signal
import statistics
import subprocess
import time

from prefill_bench import digest, model_identity, preflight, vm_snapshot
from serve_bench import competing_jobs, reserved_cooldown, verified_build, wait_for_quiet_workspace


ARMS = ['reference', 'compact', 'reference-ring', 'compact-ring']
HASHES = {'input_ids', 'fill_embeddings', 'warm_embedding', 'eviction_embeddings'}


def contract():
    return {
        'classification': 'Real full-cache PLE component; no language-model layers or serving benefit claim',
        'binary': 'FINAL_BINARY_REQUIRED',
        'model': '/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit',
        'arms': ARMS, 'rounds': 7, 'minimum_clean_pairs': 5, 'replacement_cells': 0,
        'fill_tokens': 32768, 'tile_tokens': 256, 'eviction_tokens': 4096, 'warm_calls': 128,
        'initial_quiet_seconds': 180, 'between_cells_seconds': 60,
        'cell_timeout_seconds': 300, 'whole_study_timeout_seconds': 5400,
        'preflight_reclaimable_gb': 12, 'maximum_physical_bytes': 5_000_000_000,
        'minimum_payload_savings_bytes': 100_000_000,
        'minimum_physical_filled_savings_bytes': 80_000_000,
        'minimum_physical_growth_savings_bytes': 80_000_000,
        'maximum_median_time_regression': .05,
        'minimum_ring_eviction_reduction': .05, 'minimum_positive_fraction': .8,
        'maximum_ring_physical_growth_bytes': 16_000_000,
        'vm_or_power_exclusions': 'Exclude the whole pair; retain all seven fixed rounds without replacement. Native errors or memory ceiling violations stop the study.',
        'native_prerequisites': 'UNBOUND: final ngram exact state/row/EOS/eviction and cache-bookkeeping checks',
        'later_gates': 'Compact storage requires ordinary serving nonregression; a ring benefit requires same-control serving guard. No automatic activation follows this component.',
    }


def positive(value):
    return type(value) in [int, float] and math.isfinite(value) and value > 0


def validate_prerequisites(spec, build):
    entries = spec.get('native_prerequisites')
    if not isinstance(entries, dict) or set(entries) != {'ngram', 'cache-bookkeeping'}:
        raise ValueError('both exact native ngram/cache-bookkeeping prerequisites must be bound')
    receipts = {}
    for variant, entry in entries.items():
        documents = {}
        for name in ['manifest.json', 'stdout.txt']:
            path = Path(entry['directory'])/name
            if digest(path) != entry['sha256'][name]: raise ValueError('native prerequisite digest differs')
            documents[name] = json.loads(path.read_text())
        manifest, report = documents['manifest.json'], documents['stdout.txt']
        identity = manifest.get('identity', {})
        if any(not isinstance(identity.get(k), str) or len(identity[k]) != 64 or identity[k] != build['identity'].get(k)
               for k in ['binary_sha256', 'source_archive_sha256', 'metallib_sha256']):
            raise ValueError('native prerequisite belongs to another build')
        command, items = manifest.get('command', []), report.get('items')
        if (manifest.get('passed') is not True or manifest.get('exit_code') != 0
                or report.get('passed') is not True or report.get('skipped') is not None
                or not isinstance(items, list) or not items or any(i.get('passed') is not True for i in items)
                or manifest.get('assertions') != len(items)
                or 'optimization-state-check' not in command or '--variant' not in command
                or command.index('--variant') + 1 >= len(command)
                or command[command.index('--variant') + 1] != variant):
            raise ValueError('native prerequisite failed or used the wrong diagnostic')
        if report.get('name') != 'optimization-state-' + variant or report.get('measurements', {}).get('prompt_tokens') != 256:
            raise ValueError('native prerequisite lacks the fixed 256-token state comparison')
        receipts[variant] = {'assertions': len(items), 'sha256': entry['sha256']}
    return receipts


def native_observation(report, arm, spec):
    if (not isinstance(report, dict) or report.get('passed') is not True or report.get('skipped') is not None
            or report.get('name') != 'optimization-ngram-cache-' + arm
            or not report.get('items') or any(item.get('passed') is not True for item in report['items'])):
        raise ValueError('native component did not pass a complete named check')
    hashes = {}
    for item in report['items']:
        if item['name'].startswith('sha256:'):
            key, value = item['name'][7:], item.get('detail')
            if key in hashes or key not in HASHES or type(value) is not str or len(value) != 64:
                raise ValueError('missing, duplicate or invalid output digest')
            try: int(value, 16)
            except ValueError: raise ValueError('invalid output digest')
            hashes[key] = value
    if hashes.keys() != HASHES: raise ValueError('incomplete byte parity evidence')
    metrics = report.get('measurements', {})
    for key in ['fill_tokens', 'tile_tokens', 'eviction_tokens', 'warm_calls']:
        if metrics.get(key) != spec[key]: raise ValueError('native workload changed: ' + key)
    compact, ring = int('compact' in arm), int(arm.endswith('-ring'))
    if any(type(metrics.get(k)) not in [int, float] for k in ['compact', 'ring']) or metrics.get('compact') != compact or metrics.get('ring') != ring:
        raise ValueError('native arm did not select declared controls')
    for key in ['filled_rows', 'filled_payload_bytes', 'end_rows', 'end_payload_bytes',
                'warm_row_hits', 'eviction_row_misses', 'physical_before_bytes',
                'physical_filled_bytes', 'physical_end_bytes', 'sampled_peak_bytes',
                'sampled_count', 'lifetime_rss_peak_bytes', 'mlx_active_bytes']:
        value = metrics.get(key)
        if not positive(value) or int(value) != value: raise ValueError('invalid native count: ' + key)
    if not 360000 <= metrics['filled_rows'] <= 400000 or metrics['end_rows'] > 400000:
        raise ValueError('full-cache occupancy is missing or unbounded')
    for prefix in ['filled', 'end']:
        if metrics[prefix + '_payload_bytes'] != metrics[prefix + '_rows'] * 160 * (2 if compact else 4):
            raise ValueError('owned payload is inconsistent with mode and row count')
    if metrics['eviction_row_misses'] <= 40000 or metrics['sampled_count'] < 2:
        raise ValueError('missing actual eviction or footprint observation')
    evicted = metrics['filled_rows'] + metrics['eviction_row_misses'] - metrics['end_rows']
    if evicted < 40000 or evicted % 40000 != 0 or metrics['warm_row_hits'] != spec['warm_calls'] * spec['tile_tokens'] * 16:
        raise ValueError('FIFO eviction or warm-hit work accounting changed')
    for key in ['physical_before_bytes', 'physical_filled_bytes', 'physical_end_bytes',
                'sampled_peak_bytes', 'lifetime_rss_peak_bytes']:
        if metrics[key] > spec['maximum_physical_bytes']: raise ValueError('component process limit exceeded')
    if metrics['sampled_peak_bytes'] < max(metrics[k] for k in ['physical_before_bytes', 'physical_filled_bytes']):
        raise ValueError('component peak does not cover its own observations')
    for key in ['fill_seconds_including_hash', 'warm_assembly_seconds_per_call', 'eviction_assembly_seconds']:
        if not positive(metrics.get(key)): raise ValueError('invalid native duration: ' + key)
    for key in ['swapins_before', 'swapins_after', 'swapouts_before', 'swapouts_after']:
        value = metrics.get(key)
        if type(value) not in [int,float] or not math.isfinite(value) or value < 0 or int(value) != value:
            raise ValueError('missing native VM interval: ' + key)
    for key in ['nominal_thermal_endpoints', 'normal_power_endpoints']:
        if type(metrics.get(key)) not in [int,float] or metrics[key] not in [0,1]:
            raise ValueError('missing native power observation: ' + key)
    clean = (metrics['swapins_before'] == metrics['swapins_after'] and metrics['swapouts_before'] == metrics['swapouts_after']
             and metrics['nominal_thermal_endpoints'] == 1 and metrics['normal_power_endpoints'] == 1)
    return {'metrics': metrics, 'hashes': hashes, 'resources_clean': clean}


def assess(rows, spec, completed):
    by_key = {}
    for row in rows:
        number, arm = row.get('round'), row.get('arm')
        if type(number) is not int or not 1 <= number <= spec['rounds'] or arm not in ARMS or (number, arm) in by_key:
            raise ValueError('duplicate, extra or foreign full-cache cell')
        by_key[number, arm] = row
    complete = completed and len(rows) == len(ARMS) * spec['rounds']
    observations = [r['observation'] for r in rows if r.get('observation') is not None]
    exact_all = bool(observations) and all(o['hashes'] == observations[0]['hashes'] for o in observations)
    results = []
    for reference, candidate, kind in [('reference', 'compact', 'resource'),
            ('reference', 'reference-ring', 'queue'), ('compact', 'compact-ring', 'queue')]:
        pairs = []
        for number in range(1, spec['rounds'] + 1):
            a, b = by_key.get((number, reference)), by_key.get((number, candidate))
            if a is None or b is None or a.get('valid') is not True or b.get('valid') is not True: continue
            aa, bb = a['observation'], b['observation']; x, y = aa['metrics'], bb['metrics']
            if aa.get('resources_clean') is not True or bb.get('resources_clean') is not True:
                raise ValueError('valid component pair contradicts its native resource observations')
            if (aa['hashes'] != bb['hashes'] or any(x[k] != y[k] for k in ['filled_rows', 'end_rows', 'warm_row_hits', 'eviction_row_misses'])):
                raise ValueError('full-cache arms did not perform identical logical work')
            pairs.append({'round': number,
                'payload_saved': x['filled_payload_bytes'] - y['filled_payload_bytes'],
                'physical_filled_saved': x['physical_filled_bytes'] - y['physical_filled_bytes'],
                'physical_growth_saved': (x['physical_filled_bytes'] - x['physical_before_bytes']) - (y['physical_filled_bytes'] - y['physical_before_bytes']),
                **{k: 1 - y[k] / x[k] for k in ['fill_seconds_including_hash', 'warm_assembly_seconds_per_call', 'eviction_assembly_seconds']}})
        enough = len(pairs) >= spec['minimum_clean_pairs']
        medians = {k: statistics.median(p[k] for p in pairs) for k in ['fill_seconds_including_hash', 'warm_assembly_seconds_per_call', 'eviction_assembly_seconds']} if pairs else {}
        nonreg = enough and all(v >= -spec['maximum_median_time_regression'] for v in medians.values())
        if kind == 'resource':
            benefit = enough and all(p['payload_saved'] >= spec['minimum_payload_savings_bytes']
                and p['physical_filled_saved'] >= spec['minimum_physical_filled_savings_bytes']
                and p['physical_growth_saved'] >= spec['minimum_physical_growth_savings_bytes'] for p in pairs)
        else:
            benefit = (enough and medians['eviction_assembly_seconds'] >= spec['minimum_ring_eviction_reduction']
                and sum(p['eviction_assembly_seconds'] > 0 for p in pairs) / len(pairs) >= spec['minimum_positive_fraction']
                and all(p['physical_filled_saved'] >= -spec['maximum_ring_physical_growth_bytes'] for p in pairs))
        results.append({'reference': reference, 'candidate': candidate, 'kind': kind, 'pairs': pairs,
            'median_reductions': medians, 'nonregression_passed': nonreg, 'benefit_passed': benefit,
            'qualified_component': complete and exact_all and nonreg and benefit})
    return {'fixed_study_completed': complete, 'all_completed_outputs_exact': exact_all, 'comparisons': results,
            'inference_adopted': False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    if signal.getitimer(signal.ITIMER_REAL) != (0.0, 0.0):
        raise RuntimeError('another real-time alarm is already active')
    spec = json.loads(args.protocol.read_text())
    expected = contract()
    for key in expected.keys() - {'binary', 'native_prerequisites'}:
        if spec.get(key) != expected[key]: raise ValueError('review and freeze a successor for changed contract: ' + key)
    build = verified_build(Path(spec['binary']))
    prerequisites = validate_prerequisites(spec, build)
    root = Path(__file__).resolve().parent.parent
    if competing_jobs(): raise RuntimeError('workspace busy; component not launched')
    args.out.mkdir(parents=True, exist_ok=False)
    for source in [Path(__file__), args.protocol, root/'Tools/serve_bench.py', root/'Tools/prefill_bench.py']:
        shutil.copy2(source, args.out/source.name)
    manifest = {'protocol': spec, 'reference_build': build, 'prerequisites': prerequisites,
                'model_identity': model_identity(Path(spec['model'])),
                'tool_sha256': digest(Path(__file__)),
                'driver_hashes': {name: digest(root/'Tools'/name) for name in ['ngram_cache_probe.py', 'serve_bench.py', 'prefill_bench.py']}}
    (args.out/'manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
    rows, completed, error = [], False, None
    started = time.monotonic()
    child = None
    def deadline(_number, _frame): raise TimeoutError('fixed full-cache study deadline expired')
    previous_alarm = signal.signal(signal.SIGALRM, deadline)
    signal.alarm(spec['whole_study_timeout_seconds'])
    try:
        wait_for_quiet_workspace({'stable_seconds': spec['initial_quiet_seconds'], 'maximum_wait_seconds': 600})
        for number in range(1, spec['rounds'] + 1):
            # Reverse complete arm order every round, preserving all seven
            # declared cells per arm. No replacement for a failed interval.
            for arm in (ARMS if number % 2 else ARMS[::-1]):
                if rows: reserved_cooldown(spec['between_cells_seconds'], 180)
                if competing_jobs(): raise RuntimeError('workspace became busy before component launch')
                before = preflight(spec['preflight_reclaimable_gb'])
                cell = args.out/f'{number:02d}-{arm}';cell.mkdir()
                command = [spec['binary'], 'optimization-state-check', '--model', spec['model'], '--variant', 'ngram-cache-'+arm, '--json']
                row = {'round': number, 'arm': arm, 'command': command, 'before': before, 'valid': False}
                rows.append(row)
                with (cell/'stdout.json').open('w') as stdout, (cell/'stderr.txt').open('w') as stderr:
                    child = subprocess.Popen(command, cwd=root, env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_', 'SS_DEBUG'))}, stdout=stdout, stderr=stderr, start_new_session=True)
                    try: child.wait(timeout=spec['cell_timeout_seconds'])
                    finally:
                        if child.poll() is None:
                            os.killpg(child.pid, signal.SIGTERM)
                            try: child.wait(timeout=10)
                            except subprocess.TimeoutExpired: os.killpg(child.pid, signal.SIGKILL);child.wait()
                row['returncode'] = child.returncode;child = None
                row['after'] = vm_snapshot()
                row['report_sha256'] = digest(cell/'stdout.json')
                if row['returncode'] != 0: raise RuntimeError('native component failed; raw cell preserved')
                row['observation'] = native_observation(json.loads((cell/'stdout.json').read_text()), arm, spec)
                row['valid'] = row['observation']['resources_clean'] and all(before[k] == row['after'][k] for k in ['swapins', 'swapouts'])
                (args.out/'rows.json').write_text(json.dumps(rows,indent=2)+'\n')
                print(json.dumps({'round':number,'arm':arm,'valid':row['valid']}),flush=True)
        completed = True
    except (Exception, KeyboardInterrupt) as caught:
        error = f'{type(caught).__name__}: {caught}'
    finally:
        signal.alarm(0);signal.signal(signal.SIGALRM, previous_alarm)
        (args.out/'rows.json').write_text(json.dumps(rows,indent=2)+'\n')
        stable = all(sha == digest(root/'Tools'/name) for name,sha in manifest['driver_hashes'].items())
        try: stable = stable and verified_build(Path(spec['binary'])) == build
        except (ValueError, OSError, KeyError): stable = False
        try: assessment = assess(rows, spec, completed and stable)
        except (ValueError, KeyError, TypeError) as caught:
            assessment = {'fixed_study_completed': False, 'all_completed_outputs_exact': False,
                          'inference_adopted': False, 'error': str(caught)}
        result = {'completed': completed, 'error': error, 'seconds': time.monotonic()-started,
                  'sources_unchanged': stable, 'assessment': assessment}
        (args.out/'completion.json').write_text(json.dumps(result,indent=2)+'\n')
        print(json.dumps(result),flush=True)
    return 0 if completed and result['sources_unchanged'] and assessment['all_completed_outputs_exact'] else 1


if __name__ == '__main__': raise SystemExit(main())

````

Artifact `/Users/carlos/Projects/slotstream/Tools/ngram_cache_probe_test.py` — 7060 bytes, SHA-256 `05141ddb547bdd870fbc2e4d971caa2e1a84e121b9416b0da87ca84c739d9bb3`.

````text
"""Reject incomplete, incomparable or misbound full-cache qualification."""
import copy
import json
from pathlib import Path
import tempfile
import unittest

from ngram_cache_probe import ARMS, HASHES, assess, contract, digest, native_observation, validate_prerequisites


class NgramCacheProbeTests(unittest.TestCase):
    def setUp(self):
        self.spec = contract()

    def report(self, arm):
        compact, ring = int('compact' in arm), int(arm.endswith('-ring'))
        metrics = {k:self.spec[k] for k in ['fill_tokens','tile_tokens','eviction_tokens','warm_calls']}
        metrics.update(compact=compact,ring=ring,filled_rows=380000,end_rows=365000,
            filled_payload_bytes=380000*160*(2 if compact else 4),
            end_payload_bytes=365000*160*(2 if compact else 4),
            warm_row_hits=128*256*16,eviction_row_misses=65000,
            physical_before_bytes=3_000_000_000,
            physical_filled_bytes=3_400_000_000-compact*120_000_000,
            physical_end_bytes=3_400_000_000-compact*120_000_000,
            sampled_peak_bytes=3_500_000_000,lifetime_rss_peak_bytes=3_600_000_000,
            sampled_count=200,mlx_active_bytes=2_000_000_000,
            swapins_before=7,swapins_after=7,swapouts_before=9,swapouts_after=9,
            nominal_thermal_endpoints=1,normal_power_endpoints=1,
            fill_seconds_including_hash=10.,warm_assembly_seconds_per_call=.01,
            eviction_assembly_seconds=1.-ring*.1)
        return {'name':'optimization-ngram-cache-'+arm,'passed':True,
                'items':[{'name':'bounded native checks','passed':True}]+[
                    {'name':'sha256:'+k,'passed':True,'detail':'a'*64} for k in sorted(HASHES)],
                'measurements':metrics}

    def rows(self):
        return [{'round':n,'arm':arm,'valid':True,
                 'observation':native_observation(self.report(arm),arm,self.spec)}
                for n in range(1,8) for arm in ARMS]

    def test_complete_identical_work_can_qualify_separate_resource_and_queue_claims(self):
        result=assess(self.rows(),self.spec,True)
        self.assertTrue(result['all_completed_outputs_exact'])
        self.assertTrue(all(c['qualified_component'] for c in result['comparisons']))
        self.assertFalse(result['inference_adopted'])

    def test_incomplete_or_excluded_work_cannot_be_replaced(self):
        rows=self.rows()
        self.assertFalse(any(c['qualified_component'] for c in assess(rows[:-1],self.spec,True)['comparisons']))
        self.assertFalse(any(c['qualified_component'] for c in assess(rows,self.spec,False)['comparisons']))
        for row in rows:
            if row['round'] <= 3: row['valid']=False
        self.assertFalse(any(c['qualified_component'] for c in assess(rows,self.spec,True)['comparisons']))
        for extra in [rows[0], rows[0]|{'round':8}, rows[0]|{'arm':'foreign'}]:
            with self.assertRaises(ValueError): assess(rows+[extra],self.spec,True)

    def test_payload_halving_does_not_substitute_for_measured_physical_saving(self):
        rows=self.rows()
        for row in rows:
            if row['arm']=='compact': row['observation']['metrics']['physical_filled_bytes']=3_350_000_000
        self.assertFalse(assess(rows,self.spec,True)['comparisons'][0]['qualified_component'])
        rows=self.rows()
        rows[1]['observation']['metrics']['physical_before_bytes']-=100_000_000
        self.assertFalse(assess(rows,self.spec,True)['comparisons'][0]['qualified_component'])

    def test_changed_outputs_or_work_cannot_be_a_speedup(self):
        rows=self.rows();rows[1]['observation']['hashes']['warm_embedding']='b'*64
        with self.assertRaises(ValueError): assess(rows,self.spec,True)
        rows[1]['valid']=False
        self.assertFalse(any(c['qualified_component'] for c in assess(rows,self.spec,True)['comparisons']))
        rows=self.rows();rows[1]['observation']['metrics']['end_rows']-=1
        with self.assertRaises(ValueError): assess(rows,self.spec,True)

    def test_native_report_requires_real_eviction_payload_bounds_and_complete_hashes(self):
        report=self.report('compact')
        for key,value in [('eviction_row_misses',40000),('warm_row_hits',1),('end_rows',365001),
                          ('filled_payload_bytes',0),('physical_filled_bytes',5_000_000_001),
                          ('warm_assembly_seconds_per_call',float('nan')),('sampled_count',1),
                          ('compact',True)]:
            bad=copy.deepcopy(report);bad['measurements'][key]=value
            # A Boolean is never a valid mode observation, despite == 0/1.
            with self.assertRaises(ValueError): native_observation(bad,'compact',self.spec)
        for change in [{'passed':False},{'skipped':'not run'},{'items':report['items'][:-1]}]:
            with self.assertRaises(ValueError): native_observation(report|change,'compact',self.spec)
        for key,value in [('swapins_after',8),('swapouts_after',10),('nominal_thermal_endpoints',0),('normal_power_endpoints',0)]:
            changed=copy.deepcopy(report);changed['measurements'][key]=value
            self.assertFalse(native_observation(changed,'compact',self.spec)['resources_clean'])

    def test_native_prerequisites_are_exact_same_build_non_skipped_reports(self):
        identity={k:'a'*64 for k in ['binary_sha256','source_archive_sha256','metallib_sha256']}
        build={'identity':identity}
        with tempfile.TemporaryDirectory() as directory:
            entries={}
            for variant in ['ngram','cache-bookkeeping']:
                path=Path(directory)/variant;path.mkdir()
                manifest={'identity':identity,'passed':True,'exit_code':0,'assertions':1,
                          'command':['slotstream','optimization-state-check','--variant',variant,'--tokens','256']}
                report={'name':'optimization-state-'+variant,'passed':True,'items':[{'passed':True}],
                        'measurements':{'prompt_tokens':256}}
                (path/'manifest.json').write_text(json.dumps(manifest));(path/'stdout.txt').write_text(json.dumps(report))
                entries[variant]={'directory':str(path),'sha256':{n:digest(path/n) for n in ['manifest.json','stdout.txt']}}
            spec=self.spec|{'native_prerequisites':entries}
            self.assertEqual(set(validate_prerequisites(spec,build)),{'ngram','cache-bookkeeping'})
            with self.assertRaises(ValueError): validate_prerequisites(self.spec,build)
            with self.assertRaises(ValueError): validate_prerequisites(spec,{'identity':identity|{'binary_sha256':'b'*64}})
            path=Path(entries['ngram']['directory'])/'stdout.txt'
            value=json.loads(path.read_text());value['skipped']='not run';path.write_text(json.dumps(value))
            with self.assertRaises(ValueError): validate_prerequisites(spec,build)
            entries['ngram']['sha256']['stdout.txt']=digest(path)
            with self.assertRaises(ValueError): validate_prerequisites(spec,build)


if __name__=='__main__':unittest.main()

````

Artifact `/Users/carlos/Projects/slotstream/Tools/serve_bench.py` — 60039 bytes, SHA-256 `31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb`.

````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import base64
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import re
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def contention_guard(protocol):
    value = protocol.get('stop_on_workspace_contention', False)
    if type(value) is not bool: raise ValueError('workspace contention guard must be Boolean')
    return value


def competing_job_kind(executable, arguments):
    name = Path(executable).name
    if name == 'slotstream':
        prefix = executable if arguments.startswith(executable) else arguments.split(' ', 1)[0]
        if re.match(re.escape(prefix) + r'\s+pull(?:\s|$)', arguments): return 'checkpoint pull'
    if name in ['download-harness', 'slotstream-pull-bench']:
        return 'checkpoint download test'
    if name.lower().startswith('python') and re.search(
        r'(?:^|[ /])Tools/slotpack/(?:full_pull|publish_r2|pack|checks|download_checks|memory_checks|cli_checks|raw_checks)\.py(?:\s|$)', arguments):
        return 'checkpoint transport or packaging job'
    if name in ['swift-frontend', 'swiftc', 'swift-build']:
        return 'Swift build'
    return None


def competing_jobs(run=subprocess.run):
    """Read known long storage/build jobs. Never persist argv: it may contain
    private URLs or credentials. A snapshot is not continuous host isolation."""
    result = run(['ps', '-axo', 'pid=,comm='], capture_output=True, text=True, check=True, timeout=5)
    candidates = {}
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid, executable = int(fields[0]), fields[1]
        name = Path(executable).name
        if (pid != os.getpid() and (name.lower().startswith('python') or name in
            ['slotstream', 'download-harness', 'slotstream-pull-bench', 'swift-frontend', 'swiftc', 'swift-build'])):
            candidates[pid] = executable
    if not candidates: return []
    result = run(['ps', '-ww', '-p', ','.join(map(str, candidates)), '-o', 'pid=,args='],
                 capture_output=True, text=True, timeout=5)
    # A process can exit between snapshots. Other failures remain fail closed.
    if result.returncode not in (0, 1): raise RuntimeError('cannot inspect competing process arguments')
    jobs = []
    for line in result.stdout.splitlines():
        fields = line.strip().split(None, 1)
        if len(fields) != 2 or not fields[0].isdigit(): continue
        pid = int(fields[0]); executable = candidates.get(pid)
        if executable is None: continue
        kind = competing_job_kind(executable, fields[1])
        if kind is not None: jobs.append({'pid': pid, 'executable': executable, 'kind': kind})
    return jobs


def workspace_quiet_requirement(protocol):
    value = protocol.get('initial_workspace_quiet')
    if value is None: return None
    if (type(value) is not dict or set(value) != {'stable_seconds', 'maximum_wait_seconds'}
        or not contention_guard(protocol)
        or type(value['stable_seconds']) is not int or not 1 <= value['stable_seconds'] <= 600
        or type(value['maximum_wait_seconds']) is not int
        or not value['stable_seconds'] <= value['maximum_wait_seconds'] <= 1800):
        raise ValueError('initial quiet interval requires the contention guard and bounded integer durations')
    return value


def wait_for_quiet_workspace(requirement, *, check=competing_jobs, now=time.monotonic, sleep=time.sleep):
    """A sampled quiet precondition before the study, never a timing cell.
    A newly observed known job resets the interval; time alone grants no pass."""
    started = now(); quiet_since = None; samples = blocked = 0; notified = started - 30
    while True:
        jobs = check(); current = now(); samples += 1
        if jobs:
            quiet_since = None; blocked += 1
        elif quiet_since is None:
            quiet_since = current
        quiet = 0 if quiet_since is None else current - quiet_since
        elapsed = current - started
        if quiet >= requirement['stable_seconds']:
            return {'wait_seconds': elapsed, 'quiet_seconds': quiet, 'samples': samples,
                    'samples_with_competing_work': blocked,
                    'classification': 'sampled known-job quiet interval, not continuous host isolation'}
        if elapsed >= requirement['maximum_wait_seconds']:
            raise TimeoutError('known workspace jobs did not leave the required quiet interval; no model launched')
        if current - notified >= 30:
            print(json.dumps({'phase': 'waiting for initial quiet workspace', 'seconds': round(elapsed, 1),
                              'quiet_seconds': round(quiet, 1), 'known_jobs': len(jobs)}), flush=True)
            notified = current
        sleep(min(2, requirement['maximum_wait_seconds'] - elapsed))


def fixed_pool_budget(protocol):
    """Explicit bounded mechanism study; memory_gb remains the measured ceiling.

    The native raw-pool control retains640slots when vision loads. This does
    not assert that the target-driven planner would choose the same pool.
    """
    if 'fixed_pool_slots' not in protocol:
        return None
    if type(protocol['fixed_pool_slots']) is not int or protocol['fixed_pool_slots'] != 640:
        raise ValueError('this fixed-pool mechanism study supports exactly640slots')
    if protocol.get('comparison_basis') != 'fixed-pool':
        raise ValueError('an explicit pool requires an explicit fixed-pool comparison')
    return 640 * 2_764_800 / 1e9


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if any(k in protocol for k in ['large_pool_measurement', 'large_scope_measurement', 'large_vision_measurement']):
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
    vision_study = protocol.get('large_vision_measurement')
    if vision_study is not None:
        if ('large_pool_measurement' in protocol or 'large_scope_measurement' in protocol
            or not isinstance(vision_study, dict) or not isinstance(vision_study.get('purpose'), str)
            or not vision_study['purpose'].strip()):
            raise ValueError('choose one explicit large-vision measurement purpose')
        if (memory != 12 or fixed_pool_budget(protocol) is None
            or type(protocol.get('max_tokens')) is not int or protocol['max_tokens'] != 1
            or protocol.get('mtp') != 'off' or protocol.get('prefix_cache') is not None
            or not isinstance(protocol.get('images'), list) or len(protocol['images']) != 1):
            raise ValueError('large-vision mechanism study requires12GB,640slots,one image/one output, MTP and prefix reuse off')
        if (protocol.get('abort_on_resource_failure') is not True
            or protocol.get('require_nominal_power_state') is not True
            or type(protocol.get('maximum_sampled_footprint_bytes')) is not int
            or protocol['maximum_sampled_footprint_bytes'] != 12_000_000_000):
            raise ValueError('large-vision study requires exact12GB ceiling, nominal state and immediate resource stop')
        return memory + 6
    scope_study = protocol.get('large_scope_measurement')
    if scope_study is not None and 'large_pool_measurement' in protocol:
        raise ValueError('choose one declared large-memory study')
    study = scope_study if scope_study is not None else protocol.get('large_pool_measurement')
    if not isinstance(study, dict) or not isinstance(study.get('purpose'), str) or not study['purpose'].strip():
        raise ValueError('above 10 GB requires a separately declared large-pool measurement purpose')
    if protocol.get('abort_on_resource_failure') is not True or protocol.get('require_nominal_power_state') is not True:
        raise ValueError('large-pool measurements require immediate resource stop and nominal operating conditions')
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if type(limit) is not int or limit != round(memory * 1e9):
        raise ValueError('large-pool measurements require an exact footprint limit at the memory target')
    if protocol.get('raw', True) is not True or protocol['max_tokens'] > 64:
        raise ValueError('large-pool component isolation permits raw text and at most 64 output tokens')
    if scope_study is not None:
        if memory != 16 or protocol['max_tokens'] > 4:
            raise ValueError('larger-scope qualification requires exactly16GB and at most4outputs')
        for arm in protocol['arms'].values():
            if (arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE','0') not in ['0','1024']
                or arm['env'].get('SLOTSTREAM_OPT_WORKSPACE_TILE','256') != '256'):
                raise ValueError('larger-scope qualification retains256-row compute and at most1024read scope')
        return memory + 6
    for arm in protocol['arms'].values():
        if arm['chunk'] != 256 or arm['env'].get('SLOTSTREAM_OPT_READ_SCOPE', '0') != '0' or arm['env'].get('SLOTSTREAM_OPT_LAYER_WORKSPACE', '0') != '0':
            raise ValueError('large-pool isolation requires ordinary bounded 256-row passes')
    return memory + 6


def workload_exclusions(stats, protocol):
    required = protocol.get('require_all_expert_hits', False)
    if type(required) is not bool: raise ValueError('require_all_expert_hits must be Boolean')
    if not required: return []
    if any(type(stats.get(k)) is not int or stats[k] != 0 for k in ['prefillRecords', 'decodeRecords']):
        return ['declared all-hit workload performed expert reads or lacks exact read counts']
    return []


def prefix_study(protocol):
    study = protocol.get('prefix_cache')
    if study is None: return None
    if (type(study) is not dict or 'expected_reused_tokens' not in study
        or not set(study) <= {'expected_reused_tokens', 'complete_prompt', 'retention_only', 'partial_prefix',
                             'expected_warmup_checkpoint_stores'}
        or type(study.get('complete_prompt', False)) is not bool
        or type(study.get('retention_only', False)) is not bool
        or type(study.get('partial_prefix', False)) is not bool):
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    stores = study.get('expected_warmup_checkpoint_stores')
    if 'expected_warmup_checkpoint_stores' in study:
        if (not study.get('complete_prompt', False) or type(stores) is not dict
            or set(stores) != set(protocol['arms'])
            or any(type(n) is not int or n not in [0, 1] for n in stores.values())
            or stores.get('reference') != 0):
            raise ValueError('combined complete-prompt warmup stores require exact zero/one counts for every arm')
    if study.get('partial_prefix', False):
        if (study.get('retention_only', False) or study.get('complete_prompt', False)
            or expected.get('reference') != 0 or not any(expected.values())
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('partial-prefix study requires distinct frozen warmup and positive strict reuse')
    if study.get('retention_only', False):
        if (any(expected.values()) or study.get('complete_prompt', False)
            or 'warmup_fixture' not in protocol or 'warmup_fixture_sha256' not in protocol):
            raise ValueError('retention-only study requires zero reuse and a separately frozen warmup fixture')
    elif expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def warmup_fixture(protocol, measured_fixture):
    """A distinct input makes unique-request retention cost measurable while
    keeping prefix caching enabled. Existing studies warm the measured input."""
    fields = {'warmup_fixture', 'warmup_fixture_sha256'}
    supplied = fields.intersection(protocol)
    if not supplied: return measured_fixture
    study = protocol.get('prefix_cache') or {}
    if (supplied != fields or not (study.get('retention_only', False) or study.get('partial_prefix', False))
        or protocol['memory_gb'] > 10 or protocol.get('raw', True) is not True):
        raise ValueError('separate warmup requires a bounded raw retention or partial-prefix study')
    if any(type(protocol[k]) is not str or not protocol[k] for k in fields):
        raise ValueError('warmup path and hash must be nonempty strings')
    fixture = Path(protocol['warmup_fixture']).resolve()
    if digest(fixture) != protocol['warmup_fixture_sha256']: raise ValueError('warmup fixture identity mismatch')
    if not 1 <= fixture.stat().st_size <= 32768 or fixture.read_bytes() == measured_fixture.read_bytes():
        raise ValueError('warmup must be bounded, nonempty and distinct from the measured fixture')
    return fixture


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords', 'completePromptHits', 'completePromptStores',
               'ngramCachedRows', 'ngramCachePayloadBytes', 'ngramRowHits', 'ngramRowMisses',
               'encodedImages', 'reusedImageFeatures', 'prefixSkippedImages', 'visionQueryTile', 'visionQueryTileCalls', 'residentExpertPrelaunches', 'residentExpertJoins', 'fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
        reader_pair = {'residentExpertPrelaunches', 'residentExpertJoins'}
        if set(counters) & reader_pair and not reader_pair <= set(counters):
            raise ValueError('resident overlap requires both submission and completed-join counters')
        for bounds in counters.values():
            if type(bounds) is not dict or not bounds or not set(bounds) <= {'min', 'max'}:
                raise ValueError('work bounds require min and/or max')
            if any(type(v) is not int or v < 0 for v in bounds.values()):
                raise ValueError('work bounds must be nonnegative integers')
            if bounds.get('min', 0) > bounds.get('max', float('inf')):
                raise ValueError('work minimum exceeds maximum')
    return constraints


def validate_work_observation(constraints, arm, stats):
    if constraints is None: return
    for counter, bounds in constraints[arm].items():
        value = stats.get(counter)
        if type(value) is not int or value < bounds.get('min', 0) or value > bounds.get('max', float('inf')):
            raise ValueError(f'{arm} work counter {counter} violates its frozen bounds')
    if 'residentExpertPrelaunches' in constraints[arm] and stats['residentExpertPrelaunches'] != stats['residentExpertJoins']:
        raise ValueError(f'{arm} submitted resident work without the same number of completed joins')


def cell_cooldown(protocol):
    value = protocol.get('between_cells_seconds', 0)
    if type(value) not in (int, float) or not math.isfinite(value) or not 0 <= value <= 60:
        raise ValueError('between_cells_seconds must be finite and between zero and 60')
    return value


def reservation_wait_limit(protocol):
    value = protocol.get('model_reservation_wait_seconds',0)
    if type(value) is not int or not 0 <= value <= 1800:
        raise ValueError('model_reservation_wait_seconds must be an integer from zero to1800')
    return value


def reserved_cooldown(seconds, wait_limit, lock_path=None):
    """Keep another model from heating the machine during a declared cooldown.

    Release before ordinary preflight/child launch. The native guard remains
    authoritative if another caller wins that handoff; no guard is bypassed.
    """
    if wait_limit == 0:
        time.sleep(seconds)
        return {'reserved':False,'wait_seconds':0}
    started=time.monotonic(); notified=-30.0
    with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock','a') as lock:
        while True:
            try:
                fcntl.flock(lock,fcntl.LOCK_EX | fcntl.LOCK_NB)
                break
            except BlockingIOError:
                elapsed=time.monotonic()-started
                if elapsed >= wait_limit: raise TimeoutError('other model retained the lock beyond the declared reservation wait')
                if elapsed-notified >= 30:
                    print(json.dumps({'phase':'waiting for model reservation','seconds':round(elapsed,1)}),flush=True)
                    notified=elapsed
                time.sleep(min(2,wait_limit-elapsed))
        waited=time.monotonic()-started
        time.sleep(seconds)
        return {'reserved':True,'wait_seconds':waited}


def validate_prefix_observation(expected, name, warm, measured, *, complete_prompt=False, retention_only=False,
                                partial_prefix=False, warmup_checkpoint_stores=None):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if retention_only and (want != 0 or warm['prompt_ids'] == measured['prompt_ids']):
        raise ValueError('retention-only request must be unique and reuse zero tokens')
    if partial_prefix:
        if (warm['prompt_ids'] == measured['prompt_ids'] or stats.get('completePromptHits') != 0
            or warm['stats'].get('completePromptHits') != 0):
            raise ValueError('partial-prefix observation must have a different tail and no complete hit')
    full = complete_prompt and want > 0
    if ((len(measured['prompt_ids']) != want if full else len(measured['prompt_ids']) <= want)
        or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]):
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    stores = (warmup_checkpoint_stores[name] if warmup_checkpoint_stores is not None
              else int(want > 0 and not full))
    if warm['stats'].get('prefixCheckpointStores') != stores:
        raise ValueError('warmup did not create the declared checkpoint')
    if complete_prompt:
        if (stats.get('completePromptHits') != int(full)
            or warm['stats'].get('completePromptStores') != int(full)
            or warm['stats'].get('completePromptHits') != 0
            or (full and warm['prompt_ids'] != measured['prompt_ids'])):
            raise ValueError('complete prompt identity or retained-logit mechanism differs')
    for sample in [warm['stats'], stats]:
        if sample.get('prefixCheckpointErrors') != 0 or sample.get('prefixCheckpointRefusals') != 0:
            raise ValueError('checkpoint retention failed or exceeded its budget')


def wait_for_headroom(needed_gb, seconds):
    if type(seconds) not in (int, float) or not math.isfinite(seconds) or not 0 <= seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    start = time.monotonic()
    attempts = 0
    while True:
        attempts += 1
        try:
            snapshot = preflight(needed_gb)
            return snapshot, {'seconds': time.monotonic()-start, 'checks': attempts, 'limit_seconds': seconds}
        except InsufficientHeadroom:
            remaining = seconds - (time.monotonic()-start)
            if remaining <= 0: raise
            time.sleep(min(.25, remaining))


def image_fixtures(protocol):
    """Bounded, content-pinned inline images. Never resolve an image URL."""
    if 'images' not in protocol: return []
    images = protocol['images']
    if (type(images) is not list or not 1 <= len(images) <= 4
        or protocol.get('raw', True) is not False):
        raise ValueError('image study requires one to four images and templates')
    if protocol.get('memory_gb', 0) > 10:
        if protocol.get('large_vision_measurement') is None:
            raise ValueError('image study above 10 GB requires the bounded large-vision declaration')
        # Reuse the complete capacity contract before reading any image. A
        # declared purpose alone cannot bypass pool, output or resource guards.
        measurement_memory(protocol)
    result = []; total = 0
    for entry in images:
        if (type(entry) is not dict or set(entry) != {'path', 'sha256'}
            or type(entry['path']) is not str or not entry['path']
            or type(entry['sha256']) is not str):
            raise ValueError('image fixture requires an explicit path and SHA-256')
        path = Path(entry['path']).resolve()
        if not path.is_file() or not 1 <= path.stat().st_size <= 8 << 20:
            raise ValueError('image fixture is missing, empty or exceeds 8 MiB')
        with path.open('rb') as source: data = source.read((8 << 20) + 1)
        total += len(data)
        if not 1 <= len(data) <= 8 << 20 or total > 16 << 20 or hashlib.sha256(data).hexdigest() != entry['sha256']:
            raise ValueError('image identity differs or total exceeds 16 MiB')
        result.append((path, data))
    return result


def request_body(protocol, prompt, *, images=None):
    raw = protocol.get('raw', True)
    if type(raw) is not bool: raise ValueError('raw must be Boolean')
    body = {'prompt': prompt, 'raw': raw, 'stream': True,
            'options': {'temperature': 0, 'num_predict': protocol['max_tokens'], 'seed': protocol['seed']}}
    sampling = protocol.get('sampling', {})
    allowed = {'temperature', 'top_p', 'top_k', 'min_p', 'presence_penalty'}
    if type(sampling) is not dict or not set(sampling) <= allowed:
        raise ValueError('sampling must contain only declared sampler parameters')
    for key, value in sampling.items():
        if key == 'top_k':
            if type(value) is not int or not 0 <= value <= 248320:
                raise ValueError('top_k must be an integer in the pinned vocabulary range')
        elif type(value) not in (int, float) or not math.isfinite(value):
            raise ValueError(f'{key} must be a finite number')
        elif key == 'temperature' and not 0 <= value <= 10:
            raise ValueError('temperature must be between zero and ten')
        elif key == 'top_p' and not 0 < value <= 1:
            raise ValueError('top_p must be positive and at most one')
        elif key == 'min_p' and not 0 <= value <= 1:
            raise ValueError('min_p must be between zero and one')
        elif key == 'presence_penalty' and not -10 <= value <= 10:
            raise ValueError('presence_penalty must be between minus ten and ten')
    body['options'].update(sampling)
    if 'think' in protocol:
        if type(protocol['think']) is not bool: raise ValueError('think must be Boolean')
        if raw: raise ValueError('think is a template setting; use raw=false')
        body['think'] = protocol['think']
    if images is None: images = image_fixtures(protocol)
    if images:
        body['images'] = [base64.b64encode(data).decode('ascii') for _, data in images]
    return json.dumps(body).encode()


def resource_exclusions(stats, protocol):
    reasons = []
    limit = protocol.get('maximum_sampled_footprint_bytes')
    if limit is not None:
        if type(limit) is not int or limit <= 0: raise ValueError('footprint limit must be a positive integer')
        observation = stats.get('sampledFootprint')
        peak = observation.get('peakBytes') if isinstance(observation, dict) else None
        if type(peak) is not int or peak <= 0:
            reasons.append('declared footprint gate has no valid sampled measurement')
        elif peak > limit:
            reasons.append('sampled physical footprint exceeds declared byte limit')
    require_nominal = protocol.get('require_nominal_power_state', False)
    if type(require_nominal) is not bool: raise ValueError('require_nominal_power_state must be Boolean')
    if require_nominal:
        for key in ['generatorSystemBefore', 'generatorSystemAfter']:
            state = stats.get(key)
            if not isinstance(state, dict) or state.get('thermalState') != 'nominal' or state.get('lowPowerModeEnabled') is not False:
                reasons.append('generator OS thermal/power state unavailable or non-nominal')
                break
    if protocol.get('images'):
        preparation = stats.get('imagePreparation') or {}
        observed = preparation.get('sampledFootprint') or {}
        image_peak = observed.get('peakBytes')
        if (type(image_peak) is not int or image_peak <= 0
            or type(observed.get('samples')) is not int or observed['samples'] <= 0):
            reasons.append('image preparation footprint observation missing')
        elif limit is not None and image_peak > limit:
            reasons.append('image preparation exceeds declared byte limit')
        for key in ['seconds', 'sourceDecodeSeconds', 'towerReadySeconds']:
            value = preparation.get(key)
            if type(value) not in (int, float) or not math.isfinite(value) or value < 0:
                reasons.append('image preparation timer missing or invalid')
                break
    return reasons


def exchange(port, body, timeout, *, allow_complete_prompt=False):
    conn = http.client.HTTPConnection('127.0.0.1', port, timeout=timeout)
    wire = bytearray(); frames = []
    first_delta = first_visible = None
    started = time.monotonic()
    try:
        conn.request('POST', '/api/generate', body, {'Content-Type':'application/json'})
        response = conn.getresponse()
        headers_at = time.monotonic() - started
        if response.status != 200:
            raise ValueError(f'HTTP {response.status}: {response.read(8192)!r}')
        while True:
            line = response.readline(1 << 20)
            if not line: break
            wire += line
            if len(wire) > 8 << 20: raise ValueError('response exceeds bounded capture')
            if not line.strip(): continue
            frame = json.loads(line); frames.append(frame)
            elapsed = time.monotonic() - started
            if first_delta is None and not frame.get('done') and (frame.get('response') or frame.get('thinking')):
                first_delta = elapsed
            if first_visible is None and frame.get('response', '').strip(): first_visible = elapsed
        elapsed = time.monotonic() - started
    finally: conn.close()
    finals = [f for f in frames if f.get('done')]
    if len(finals) != 1 or frames[-1] is not finals[0]: raise ValueError('missing or malformed completion framing')
    details = {'schema_version':1, **finals[0]['slotstream_benchmark']}
    validate_metrics(details, allow_complete_prompt=allow_complete_prompt)
    return {'client_seconds':elapsed, 'headers_seconds':headers_at,
            'first_protocol_delta_seconds':first_delta, 'first_visible_text_seconds':first_visible,
            'text':''.join(f.get('response','') for f in frames), 'metrics':details}, bytes(wire)


def stop_server(child):
    if child.poll() is None:
        os.killpg(child.pid, signal.SIGTERM)
        try: child.wait(timeout=10)
        except subprocess.TimeoutExpired:
            os.killpg(child.pid, signal.SIGKILL); child.wait()


def wait_ready(child, port):
    deadline = time.monotonic() + 120
    while time.monotonic() < deadline:
        if child.poll() is not None: raise RuntimeError(f'server exited {child.returncode}')
        conn = http.client.HTTPConnection('127.0.0.1', port, timeout=1)
        try:
            conn.request('GET','/api/version')
            response = conn.getresponse(); response.read(4096)
            if response.status == 200: return
        except (OSError, http.client.HTTPException): pass
        finally: conn.close()
        time.sleep(.25)
    raise TimeoutError('server startup timeout')


def sampled_request_peak(stats):
    """Highest sampled process footprint across generation and image preparation.

    These are successive intervals of the same process, so take their maximum,
    never their sum. Missing declared-stage evidence cannot prove a saving.
    """
    observations = [stats.get('sampledFootprint')]
    if 'imagePreparation' in stats:
        preparation = stats['imagePreparation']
        if not isinstance(preparation, dict): return None
        observations.append(preparation.get('sampledFootprint'))
    peaks = [value.get('peakBytes') if isinstance(value, dict) else None for value in observations]
    return max(peaks) if all(type(value) is int and value > 0 for value in peaks) else None


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses',
               'ngramCachedRows', 'ngramRowHits', 'ngramRowMisses'}
    if (type(fields) is not list or any(type(k) is not str or k not in allowed for k in fields)
            or len(fields) != len(set(fields))):
        raise ValueError('required_equal_work must contain unique supported work counters')
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round']==number}
            a,b = arms.get(reference),arms.get(candidate)
            if not a or not b or not a['valid'] or not b['valid']:
                excluded.append(number); continue
            am,bm = a['metrics'],b['metrics']
            equal_fields = ['prompt_ids', 'effective_mtp']
            if comparison_basis == 'fixed-pool': equal_fields.append('effective_pool_slots')
            if any(am[k]!=bm[k] for k in equal_fields):
                excluded.append(number); continue
            if any(type(am['stats'].get(k)) is not int or am['stats'][k] < 0
                   or type(bm['stats'].get(k)) is not int or am['stats'][k] != bm['stats'][k]
                   for k in fields):
                excluded.append(number); continue
            aseq, bseq = am['stats'].get('allocatedSequenceBytes'), bm['stats'].get('allocatedSequenceBytes')
            aactive, bactive = am['stats'].get('mlxActiveEndBytes'), bm['stats'].get('mlxActiveEndBytes')
            apeak = sampled_request_peak(am['stats'])
            bpeak = sampled_request_peak(bm['stats'])
            sequence_ok = all(type(v) is int and v > 0 for v in [aseq, bseq])
            active_ok = all(type(v) is int and v > 0 for v in [aactive, bactive])
            peak_ok = all(type(v) is int and v > 0 for v in [apeak, bpeak])
            pairs.append({'round':number,'client_reduction_fraction':1-b['client_seconds']/a['client_seconds'],
                'generator_reduction_fraction':1-bm['stats']['requestSeconds']/am['stats']['requestSeconds'],
                'sequence_reduction_fraction': 1-bseq/aseq if sequence_ok else None,
                'active_savings_share': (aactive-bactive)/(aseq-bseq) if sequence_ok and active_ok and aseq > bseq else None,
                'active_savings_bytes': aactive-bactive if active_ok else None,
                'sampled_peak_savings_bytes': apeak-bpeak if peak_ok else None,
                'output_ids_equal':am['output_ids']==bm['output_ids'], 'wire_text_equal':a['text']==b['text']})
        result.append({'reference':reference,'candidate':candidate,'comparison_basis':comparison_basis,
            'pairs':pairs,'excluded_rounds':excluded,
            'median_client_reduction_fraction':statistics.median(p['client_reduction_fraction'] for p in pairs) if pairs else None,
            'median_generator_reduction_fraction':statistics.median(p['generator_reduction_fraction'] for p in pairs) if pairs else None})
    return result


def acceptance_results(summary, contract):
    """Apply the frozen criterion without turning missing/unequal work into a win."""
    if contract is None: return None
    count = contract['minimum_pairs']
    non_regression = 'maximum_median_client_regression' in contract
    if non_regression and 'minimum_median_client_reduction' in contract:
        raise ValueError('choose one latency acceptance criterion')
    reduction_key = 'maximum_median_client_regression' if non_regression else 'minimum_median_client_reduction'
    reduction = contract[reduction_key]
    positive = contract['minimum_positive_fraction']
    if type(count) is not int or count < 1: raise ValueError('minimum_pairs must be a positive integer')
    for name, value in [(reduction_key, reduction), ('minimum_positive_fraction', positive)]:
        if type(value) not in [int, float] or not 0 <= value <= 1: raise ValueError(name + ' must be finite and in [0,1]')
    for key in ['minimum_sequence_reduction', 'minimum_active_savings_share']:
        if key in contract and (type(contract[key]) not in [int, float] or not 0 <= contract[key] <= 1):
            raise ValueError(key + ' must be finite and in [0,1]')
    for key in ['minimum_active_savings_bytes', 'minimum_sampled_peak_savings_bytes']:
        if key in contract and (type(contract[key]) is not int or contract[key] <= 0):
            raise ValueError(key + ' must be a positive integer')
    if contract.get('all_outputs_exact') is not True: raise ValueError('this acceptance contract requires exact outputs')
    result = []
    for item in summary:
        pairs = item['pairs']
        checks = {
            'minimum_pairs': len(pairs) >= count,
            ('median_client_non_regression' if non_regression else 'median_client_reduction'):
                item['median_client_reduction_fraction'] is not None
                and item['median_client_reduction_fraction'] >= (-reduction if non_regression else reduction),
            'positive_fraction': bool(pairs) and sum(p['client_reduction_fraction'] > 0 for p in pairs) / len(pairs) >= positive,
            'exact_outputs': bool(pairs) and all(p['output_ids_equal'] and p['wire_text_equal'] for p in pairs),
        }
        for criterion, metric in [('minimum_sequence_reduction', 'sequence_reduction_fraction'),
                                  ('minimum_active_savings_share', 'active_savings_share'),
                                  ('minimum_active_savings_bytes', 'active_savings_bytes'),
                                  ('minimum_sampled_peak_savings_bytes', 'sampled_peak_savings_bytes')]:
            if criterion in contract:
                values = [p.get(metric) for p in pairs]
                checks[criterion] = bool(values) and all(type(v) in [int, float] and math.isfinite(v)
                    and v >= contract[criterion] for v in values)
        result.append({'candidate': item['candidate'], 'passed': all(checks.values()), 'checks': checks})
    return result


def startup_summaries(rows, reference):
    """Fresh-process costs are separate from warmed request acceptance.

    Amortization uses a paired first-job excess divided by a positive paired
    steady-request saving. It is an estimate for repeating this exact job,
    never a claim about a cold filesystem or a different request mix.
    """
    result = []
    for candidate in sorted({r['arm'] for r in rows} - {reference}):
        pairs = []; excluded = []
        for number in sorted({r['round'] for r in rows}):
            arms = {r['arm']:r for r in rows if r['round'] == number}
            a,b = arms.get(reference),arms.get(candidate)
            first_a,first_b = (a or {}).get('first_request'),(b or {}).get('first_request')
            if (not a or not b or not a['valid'] or not b['valid'] or not first_a or not first_b
                or not a.get('startup_and_warmup_valid') or not b.get('startup_and_warmup_valid')):
                excluded.append(number); continue
            fields = ['prompt_ids','output_ids','text','effective_pool_slots','effective_mtp']
            if any(first_a.get(k) != first_b.get(k) or first_a.get(k) is None for k in fields):
                excluded.append(number); continue
            durations = [a.get('startup_seconds'),b.get('startup_seconds'),
                         first_a.get('complete_seconds_from_launch'),first_b.get('complete_seconds_from_launch'),
                         a.get('client_seconds'),b.get('client_seconds')]
            if any(type(x) not in [float,int] or not math.isfinite(x) or x <= 0 for x in durations):
                excluded.append(number); continue
            excess = first_b['complete_seconds_from_launch']-first_a['complete_seconds_from_launch']
            saving = a['client_seconds']-b['client_seconds']
            pairs.append({'round':number,'startup_excess_seconds':b['startup_seconds']-a['startup_seconds'],
                          'first_job_excess_seconds':excess,'steady_request_saving_seconds':saving,
                          'estimated_total_jobs_to_amortize':1+math.ceil(max(0,excess)/saving) if saving > 0 else None})
        result.append({'candidate':candidate,'pairs':pairs,'excluded_rounds':excluded,
                       'median_startup_excess_seconds':statistics.median(p['startup_excess_seconds'] for p in pairs) if pairs else None,
                       'median_first_job_excess_seconds':statistics.median(p['first_job_excess_seconds'] for p in pairs) if pairs else None})
    return result


def verified_build(binary):
    binary = Path(binary).resolve()
    identity = json.loads((binary.parent / 'build-identity.json').read_text())
    for path, key in [(binary, 'binary_sha256'), (binary.parent / 'mlx.metallib', 'metallib_sha256'),
                      (binary.parent / 'build-source.tar.gz', 'source_archive_sha256')]:
        if digest(path) != identity[key]:
            raise ValueError(f'frozen identity mismatch: {path}')
    return {'binary': str(binary), 'identity': identity}


def validate_declared_binary(protocol, builds):
    expected = protocol.get('frozen_binary_sha256')
    if expected is None: return
    if type(expected) is not str or len(expected) != 64 or any(c not in '0123456789abcdef' for c in expected):
        raise ValueError('frozen_binary_sha256 must be a lowercase SHA-256 digest')
    if not builds or any(b['identity']['binary_sha256'] != expected for b in builds.values()):
        raise ValueError('an arm does not match the prospectively frozen binary SHA-256')


def validate_arms(arms):
    if type(arms) is not dict or not arms or 'reference' not in arms:
        raise ValueError('arms must include a reference')
    for name, arm in arms.items():
        if type(name) is not str or not name.replace('_', '').replace('-', '').isalnum():
            raise ValueError('unsafe arm name')
        if type(arm) is not dict or not {'chunk', 'env'} <= set(arm) or set(arm) - {'chunk', 'env', 'binary'}:
            raise ValueError('each arm requires chunk and env, with only an optional binary')
        if type(arm['chunk']) is not int or arm['chunk'] not in [256, 512, 1024, 2048, 4096]:
            raise ValueError('arm chunk must be a supported prefill size')
        if type(arm['env']) is not dict or any(type(k) is not str or not k.startswith('SLOTSTREAM_')
                or type(v) is not str for k, v in arm['env'].items()):
            raise ValueError('arm env requires explicit string SLOTSTREAM_ controls')
        if 'SLOTSTREAM_PREFILL_CHUNK' in arm['env'] and arm['env']['SLOTSTREAM_PREFILL_CHUNK'] != str(arm['chunk']):
            raise ValueError('arm chunk conflicts with its environment')
        if 'binary' in arm and (type(arm['binary']) is not str or not arm['binary']):
            raise ValueError('arm binary must be a nonempty path string')


def startup_acceptance_results(rows, reference, contract):
    """Optional first-job gate; never borrow swap-excluded warmups from steady timing."""
    if contract is None:
        return None
    keys = {'minimum_pairs', 'maximum_median_first_job_regression', 'all_outputs_exact'}
    if not isinstance(contract, dict) or set(contract) != keys:
        raise ValueError('startup acceptance requires exactly minimum_pairs, maximum_median_first_job_regression and all_outputs_exact')
    count, limit = contract['minimum_pairs'], contract['maximum_median_first_job_regression']
    if type(count) is not int or count < 1:
        raise ValueError('startup minimum_pairs must be a positive integer')
    if type(limit) not in [int, float] or not 0 <= limit <= 1:
        raise ValueError('startup regression limit must be finite and in [0,1]')
    if contract['all_outputs_exact'] is not True:
        raise ValueError('startup acceptance requires exact outputs')
    by_cell = {(r['round'], r['arm']): r for r in rows}
    results = []
    for summary in startup_summaries(rows, reference):
        changes = []
        for pair in summary['pairs']:
            a = by_cell[pair['round'], reference]['first_request']['complete_seconds_from_launch']
            b = by_cell[pair['round'], summary['candidate']]['first_request']['complete_seconds_from_launch']
            changes.append(1 - b / a)
        median = statistics.median(changes) if changes else None
        checks = {'minimum_pairs': len(changes) >= count,
                  'median_first_job_non_regression': median is not None and median >= -limit}
        results.append({'candidate': summary['candidate'], 'passed': all(checks.values()),
            'checks': checks, 'eligible_rounds': [p['round'] for p in summary['pairs']],
            'excluded_rounds': summary['excluded_rounds'], 'median_first_job_reduction_fraction': median})
    return results


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    expected_prefix = prefix_study(protocol)
    complete_prompt = (protocol.get('prefix_cache') or {}).get('complete_prompt', False)
    retention_only = (protocol.get('prefix_cache') or {}).get('retention_only', False)
    partial_prefix = (protocol.get('prefix_cache') or {}).get('partial_prefix', False)
    warmup_checkpoint_stores = (protocol.get('prefix_cache') or {}).get('expected_warmup_checkpoint_stores')
    expected_work = work_constraints(protocol)
    startup_acceptance_results([], next(iter(protocol['arms'])), protocol.get('startup_acceptance'))
    stop_on_contention = contention_guard(protocol)
    initial_quiet = workspace_quiet_requirement(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    explicit_pool_gb = fixed_pool_budget(protocol)
    required_equal_work = protocol.get('required_equal_work')
    summaries([], 'reference', comparison_basis, required_equal_work)
    acceptance_results([], protocol.get('acceptance'))
    abort_on_resource_failure = protocol.get('abort_on_resource_failure', False)
    if type(abort_on_resource_failure) is not bool: raise ValueError('abort_on_resource_failure must be Boolean')
    resource_exclusions({}, protocol)  # Validate declared types before loading.
    arms=protocol['arms']; model=Path(protocol['model']).resolve(); binary=Path(protocol['binary']).resolve()
    if protocol.get('acceptance') is not None and len(arms) < 2:
        raise ValueError('paired acceptance requires reference and candidate arms')
    required_memory = measurement_memory(protocol)
    settle_seconds = protocol.get('memory_settle_seconds', 0)
    if type(settle_seconds) not in (int, float) or not math.isfinite(settle_seconds) or not 0 <= settle_seconds <= 30:
        raise ValueError('memory_settle_seconds must be finite and between zero and 30')
    workload_exclusions({}, protocol)  # Validate the declaration before startup.
    if protocol['rounds']<1 or not 1<=protocol['max_tokens']<=512:
        parser.error('bounded memory, rounds and output required')
    if any(not name.replace('_','').replace('-','').isalnum() for name in arms): parser.error('unsafe arm name')
    identity = verified_build(binary)['identity']
    arm_builds = {name: verified_build(arm.get('binary', binary)) for name, arm in arms.items()}
    validate_declared_binary(protocol, arm_builds)
    fixture=Path(protocol['fixture']).resolve()
    if digest(fixture)!=protocol['fixture_sha256']: raise ValueError('fixture identity mismatch')
    warm_fixture = warmup_fixture(protocol, fixture)
    images = image_fixtures(protocol)
    if protocol['memory_gb'] > 10:
        fixture_limit = 32768 if protocol.get('large_scope_measurement') is not None else 2048
        if fixture.stat().st_size > fixture_limit:
            raise ValueError(f'large-memory study fixture exceeds its {fixture_limit}-byte bound')
    a.out=a.out.resolve(); a.out.mkdir(parents=True,exist_ok=False)
    shutil.copyfile(fixture,a.out/'fixture.txt'); shutil.copyfile(binary.parent/'build-source.tar.gz',a.out/'build-source.tar.gz')
    for name, build in arm_builds.items():
        shutil.copyfile(Path(build['binary']).parent / 'build-source.tar.gz', a.out / f'{name}-build-source.tar.gz')
    harness_sources = {}
    for source in [Path(__file__), Path(__file__).with_name('prefill_bench.py')]:
        harness_sources[source.name] = digest(source)
        shutil.copyfile(source, a.out/source.name)
    (a.out/'manifest.json').write_text(json.dumps({'protocol':protocol,'protocol_sha256':digest(a.protocol),
        'identity':identity,'model':model_identity(model),'harness_sha256':digest(Path(__file__)),
        'harness_sources': harness_sources, 'arm_builds': arm_builds},indent=2)+'\n')
    for i, (image_path, data) in enumerate(images):
        (a.out / f'image-{i}{image_path.suffix}').write_bytes(data)
    body=request_body(protocol, fixture.read_text(), images=images)
    warm_body = request_body(protocol, warm_fixture.read_text(), images=images)
    (a.out/'request.json').write_bytes(body)
    if warm_fixture != fixture:
        shutil.copyfile(warm_fixture, a.out/'warmup-fixture.txt')
        (a.out/'warmup-request.json').write_bytes(warm_body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
    if initial_quiet is not None:
        quiet_record = {'requirement': initial_quiet, 'passed': False}
        try:
            quiet_record.update(wait_for_quiet_workspace(initial_quiet), passed=True)
        except (Exception, KeyboardInterrupt) as error:
            quiet_record['error'] = f'{type(error).__name__}: {error}'
        (a.out/'initial-workspace-quiet.json').write_text(json.dumps(quiet_record, indent=2)+'\n')
        if not quiet_record['passed']:
            (a.out/'completion.json').write_text(json.dumps({'stopped_early': True,
                'planned_cells': protocol['rounds'] * len(arms), 'recorded_cells': 0,
                'error': quiet_record['error'], 'acceptance': []}, indent=2)+'\n')
            print(json.dumps(quiet_record), flush=True)
            return 1
    stop_requested = False
    interrupted = False
    for number in range(1,protocol['rounds']+1):
        order=list(arms) if number%2 else list(reversed(arms))
        for name in order:
            arm=arms[name]; cell=a.out/f'{number}-{name}'; cell.mkdir()
            env=clean_env|arm['env']|{'SLOTSTREAM_BENCH_DETAILS':'1','SLOTSTREAM_PREFILL_CHUNK':str(arm['chunk'])}
            extra=max(0,arm['chunk']-256)*1.30e-3
            if env.get('SLOTSTREAM_OPT_LAYER_WORKSPACE')=='1': extra+=2
            if env.get('SLOTSTREAM_OPT_ROUTER_WEIGHTS')=='1': extra+=.3
            scope=int(env.get('SLOTSTREAM_OPT_READ_SCOPE','0'))
            if scope: extra+=max(0,scope-arm['chunk'])*1.30e-3+.12
            row={'round':number,'arm':name,'valid':False,'extra_preflight_allowance_gb':extra,
                 'env':{k:v for k,v in env.items() if k.startswith('SLOTSTREAM_')}}
            child=None
            try:
                if stop_on_contention:
                    row['competing_jobs_before_cooldown'] = competing_jobs()
                    if row['competing_jobs_before_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job; stopped before cooldown or model launch')
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                if stop_on_contention:
                    row['competing_jobs_after_cooldown'] = competing_jobs()
                    if row['competing_jobs_after_cooldown']:
                        stop_requested = True
                        raise RuntimeError('competing storage/build job appeared during cooldown; model not launched')
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                memory_args = (['--pool-gb', str(explicit_pool_gb)] if explicit_pool_gb is not None
                               else ['--memory-gb', str(protocol['memory_gb'])])
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model), *memory_args,
                         '--mtp',protocol.get('mtp','off'),'--no-elastic']
                if expected_prefix is None: command.append('--no-prefix-cache')
                if protocol.get('large_scope_measurement') is not None:
                    # Bound active context independently of any evolving default
                    # while allowing the declared approximately4k-token fixture.
                    command.extend(['--max-context','8192'])
                row['command']=command
                with (cell/'server.stdout').open('wb') as out, (cell/'server.stderr').open('wb') as err:
                    launched_at=time.monotonic()
                    child=subprocess.Popen(command,cwd=ROOT,env=env,stdout=out,stderr=err,start_new_session=True)
                    wait_ready(child,port)
                    row['startup_seconds']=time.monotonic()-launched_at
                    row['after_startup_vm']=vm_snapshot()
                    warm,wire=exchange(port,warm_body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
                    if stop_on_contention:
                        row['competing_jobs_after_warmup'] = competing_jobs()
                        if row['competing_jobs_after_warmup']:
                            stop_requested = True
                            raise RuntimeError('competing storage/build job appeared during warmup; measurement not started')
                    if abort_on_resource_failure:
                        warm_exclusions = resource_exclusions(warm['metrics']['stats'], protocol)
                        if protocol['memory_gb'] > 10:
                            if any(row['before_startup'][key] != row['after_warmup_vm'][key]
                                   for key in ['swapins', 'swapouts']):
                                warm_exclusions.append('swap activity during large-pool startup/warmup')
                        if warm_exclusions:
                            stop_requested = True
                            row['exclusion'] = 'warmup resource gate: ' + '; '.join(warm_exclusions)
                            raise RuntimeError('declared resource stop before measurement')
                    row['host_before']=host_conditions()
                    row['before']=vm_snapshot()
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600),
                        allow_complete_prompt=complete_prompt and expected_prefix[name] > 0)
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    if stop_on_contention:
                        row['competing_jobs_after_measurement'] = competing_jobs()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if explicit_pool_gb is not None and m['effective_pool_slots'] != protocol['fixed_pool_slots']:
                        raise ValueError('effective pool differs from the frozen explicit capacity')
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m,
                        complete_prompt=complete_prompt, retention_only=retention_only, partial_prefix=partial_prefix,
                        warmup_checkpoint_stores=warmup_checkpoint_stores)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
                    if stop_on_contention and row.get('competing_jobs_after_measurement'):
                        exclusions.append('known competing storage/build job observed after measurement')
                        stop_requested = True
                    if exclusions and abort_on_resource_failure: stop_requested = True
                    exclusions += workload_exclusions(s, protocol)
                    if changed: exclusions.append('swap activity during measured request; pair excluded')
                    row['valid']=not exclusions
                    if exclusions: row['exclusion']='; '.join(exclusions)
            except KeyboardInterrupt:
                row['interrupted'] = True
                row['error'] = 'KeyboardInterrupt: measured result incomplete; owned server stopped'
                interrupted = stop_requested = True
            except Exception as e: row['error']=f'{type(e).__name__}: {e}'
            finally:
                if child is not None: stop_server(child)
            (cell/'result.json').write_text(json.dumps(row,indent=2)+'\n')
            rows.append(row)
            with (a.out/'results.jsonl').open('a') as log: log.write(json.dumps(row)+'\n')
            progress = {k:v for k,v in row.items() if k in ['round','arm','valid','client_seconds','error','exclusion']}
            if 'metrics' in row:
                stats = row['metrics']['stats']
                progress['decode_records'] = stats.get('decodeRecords')
                if 'decodeLocalVictims' in stats: progress['local_victims'] = stats['decodeLocalVictims']
                if protocol.get('acceptance', {}).get('minimum_sequence_reduction') is not None:
                    progress['sequence_bytes'] = stats.get('allocatedSequenceBytes')
                    progress['mlx_active_bytes'] = stats.get('mlxActiveEndBytes')
            print(json.dumps(progress),flush=True)
            if stop_requested: break
        if stop_requested: break
    summary=summaries(rows,next(iter(arms)),comparison_basis,required_equal_work)
    (a.out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n')
    (a.out/'startup-summary.json').write_text(json.dumps(startup_summaries(rows,next(iter(arms))),indent=2)+'\n')
    assessment = acceptance_results(summary, protocol.get('acceptance'))
    startup_assessment = startup_acceptance_results(rows, next(iter(arms)), protocol.get('startup_acceptance'))
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment, 'startup_acceptance': startup_assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    if startup_assessment is not None and not all(r['passed'] for r in startup_assessment): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

````

Artifact `/Users/carlos/Projects/slotstream/Tools/prefill_bench_test.py` — 62017 bytes, SHA-256 `fa263527173e3d139e868b12e19f9417478380466094b35e0726381cbe5245b7`.

````text
#!/usr/bin/env python3
import copy
import fcntl
import unittest
from prefill_bench import vm_snapshot, validate_metrics, paired_summary
from serve_bench import request_body, resource_exclusions, summaries, acceptance_results, measurement_memory, workload_exclusions
import json
from memory_gate import check_memory
from long_context_gate import check_answer
from contextlib import redirect_stdout
import io
from pathlib import Path
from tempfile import TemporaryDirectory
from unittest.mock import patch
from types import SimpleNamespace
import serve_bench


class HarnessTests(unittest.TestCase):
    def test_ngram_storage_requires_bounded_payload_and_identical_cache_work(self):
        constraints = {'reference': {'ngramCachedRows': {'min': 1, 'max': 400000},
                                    'ngramCachePayloadBytes': {'min': 640, 'max': 256000000}},
                       'candidate': {'ngramCachedRows': {'min': 1, 'max': 400000},
                                     'ngramCachePayloadBytes': {'min': 320, 'max': 128000000}}}
        self.assertEqual(serve_bench.work_constraints({'arms':{k:{} for k in constraints},
                                                      'work_constraints':constraints}), constraints)
        rows=[]
        for arm in constraints:
            stats={'requestSeconds':1,'ngramCachedRows':7000,'ngramRowHits':200,'ngramRowMisses':16,
                   'ngramCachePayloadBytes':7000*(640 if arm=='reference' else 320)}
            serve_bench.validate_work_observation(constraints,arm,stats)
            rows.append({'round':1,'arm':arm,'valid':True,'client_seconds':1,'text':'same',
                         'metrics':{'prompt_ids':[1],'output_ids':[2],'effective_pool_slots':640,
                                    'effective_mtp':False,'stats':stats}})
        fields=['ngramCachedRows','ngramRowHits','ngramRowMisses']
        self.assertEqual(len(summaries(rows,'reference',required_equal_work=fields)[0]['pairs']),1)
        for field in fields:
            changed=copy.deepcopy(rows);changed[1]['metrics']['stats'][field]+=1
            self.assertEqual(summaries(changed,'reference',required_equal_work=fields)[0]['pairs'],[])
        for value in [128000001,True,None]:
            with self.assertRaises(ValueError):
                serve_bench.validate_work_observation(constraints,'candidate',
                    rows[1]['metrics']['stats']|{'ngramCachePayloadBytes':value})

    def test_large_vision_admission_reaches_request_serialization(self):
        with TemporaryDirectory() as directory:
            image = Path(directory) / 'red.png'
            payload = b'bounded pinned image bytes'
            image.write_bytes(payload)
            p = {'memory_gb': 12, 'fixed_pool_slots': 640, 'comparison_basis': 'fixed-pool',
                 'max_tokens': 1, 'seed': 7, 'mtp': 'off', 'raw': False,
                 'images': [{'path': str(image), 'sha256': serve_bench.hashlib.sha256(payload).hexdigest()}],
                 'large_vision_measurement': {'purpose': 'independent fixed-pool mechanism comparison'},
                 'maximum_sampled_footprint_bytes': 12_000_000_000,
                 'abort_on_resource_failure': True, 'require_nominal_power_state': True}
            self.assertEqual(measurement_memory(p), 18)
            fixtures = serve_bench.image_fixtures(p)
            self.assertEqual(fixtures, [(image.resolve(), payload)])
            body = json.loads(request_body(p, 'What color?', images=fixtures))
            self.assertEqual(serve_bench.base64.b64decode(body['images'][0]), payload)
            self.assertEqual(body['options']['num_predict'], 1)
            for key, value in [('large_vision_measurement', None), ('memory_gb', 13),
                               ('fixed_pool_slots', 641), ('max_tokens', 2), ('mtp', 'on'),
                               ('raw', True), ('prefix_cache', {}),
                               ('maximum_sampled_footprint_bytes', 13_000_000_000),
                               ('abort_on_resource_failure', False), ('require_nominal_power_state', False)]:
                with self.assertRaises(ValueError): serve_bench.image_fixtures(p | {key: value})
            # Ordinary image studies retain the prior envelope without a large-study declaration.
            ordinary = {key: value for key, value in p.items() if key != 'large_vision_measurement'}
            self.assertEqual(serve_bench.image_fixtures(ordinary | {'memory_gb': 10}), fixtures)

    def test_larger_vision_study_preserves_explicit_capacity_and_resource_guards(self):
        p = {'memory_gb': 12, 'fixed_pool_slots': 640, 'comparison_basis': 'fixed-pool',
             'max_tokens': 1, 'mtp': 'off', 'images': [{'path': 'red.png'}],
             'large_vision_measurement': {'purpose': 'independent fixed-pool mechanism comparison'},
             'maximum_sampled_footprint_bytes': 12_000_000_000,
             'abort_on_resource_failure': True, 'require_nominal_power_state': True}
        self.assertEqual(measurement_memory(p), 18)
        for key, value in [('memory_gb', 10), ('memory_gb', 13), ('fixed_pool_slots', 641),
                           ('max_tokens', 2), ('max_tokens', True), ('mtp', 'on'), ('images', []),
                           ('images', [{}, {}]), ('prefix_cache', {}),
                           ('maximum_sampled_footprint_bytes', 13_000_000_000),
                           ('abort_on_resource_failure', False), ('require_nominal_power_state', False),
                           ('large_vision_measurement', {'purpose': ''}), ('large_pool_measurement', {})]:
            with self.assertRaises(ValueError): measurement_memory(p | {key: value})

    def test_explicit_pool_study_is_bounded_and_distinct_from_target_planning(self):
        self.assertIsNone(serve_bench.fixed_pool_budget({'memory_gb': 10}))
        self.assertEqual(serve_bench.fixed_pool_budget({'comparison_basis': 'fixed-pool', 'fixed_pool_slots': 640}), 1.769472)
        for slots in [None, True, 0, 639, 641, 24576, 640.0, '640']:
            with self.assertRaises(ValueError):
                serve_bench.fixed_pool_budget({'comparison_basis': 'fixed-pool', 'fixed_pool_slots': slots})
        for basis in [None, 'fixed-total-memory', 'anything']:
            with self.assertRaises(ValueError):
                serve_bench.fixed_pool_budget({'comparison_basis': basis, 'fixed_pool_slots': 640})

    def test_first_job_gate_uses_clean_exact_warmups_and_declared_limit(self):
        contract = {'minimum_pairs': 1, 'maximum_median_first_job_regression': .05, 'all_outputs_exact': True}
        first = {'prompt_ids': [7], 'output_ids': [9], 'text': 'ok',
                 'effective_pool_slots': 640, 'effective_mtp': False, 'complete_seconds_from_launch': 4.0}
        base = {'round': 1, 'valid': True, 'startup_and_warmup_valid': True,
                'startup_seconds': 1.0, 'client_seconds': 2.0, 'first_request': first}
        rows = [base | {'arm': 'reference'}, copy.deepcopy(base) | {'arm': 'candidate'}]
        rows[1]['first_request']['complete_seconds_from_launch'] = 4.1
        assess = lambda rs: serve_bench.startup_acceptance_results(rs, 'reference', contract)[0]
        self.assertTrue(assess(rows)['passed'])
        rows[1]['first_request']['complete_seconds_from_launch'] = 4.3
        self.assertFalse(assess(rows)['passed'])
        rows[1]['first_request']['complete_seconds_from_launch'] = 3.0
        for side in [0, 1]:
            bad = copy.deepcopy(rows); bad[side]['startup_and_warmup_valid'] = False
            self.assertFalse(assess(bad)['passed'])
            self.assertEqual(assess(bad)['eligible_rounds'], [])
        bad = copy.deepcopy(rows); bad[1]['first_request']['output_ids'] = [10]
        self.assertFalse(assess(bad)['passed'])
        bad = copy.deepcopy(rows); bad[1]['first_request']['complete_seconds_from_launch'] = float('nan')
        self.assertFalse(assess(bad)['passed'])

    def test_first_job_gate_rejects_invalid_or_ambiguous_contract(self):
        contract = {'minimum_pairs': 5, 'maximum_median_first_job_regression': .05, 'all_outputs_exact': True}
        self.assertIsNone(serve_bench.startup_acceptance_results([], 'reference', None))
        for field, value in [('minimum_pairs', True), ('minimum_pairs', 0),
                             ('maximum_median_first_job_regression', True),
                             ('maximum_median_first_job_regression', float('nan')),
                             ('maximum_median_first_job_regression', 1.1), ('all_outputs_exact', False)]:
            with self.assertRaises(ValueError):
                serve_bench.startup_acceptance_results([], 'reference', contract | {field: value})
        with self.assertRaises(ValueError):
            serve_bench.startup_acceptance_results([], 'reference', contract | {'unknown': 1})

    def test_whole_request_peak_includes_preparation_without_double_counting(self):
        def stats(generation, preparation=None):
            result = {'sampledFootprint': {'peakBytes': generation}}
            if preparation is not None:
                result['imagePreparation'] = {'sampledFootprint': {'peakBytes': preparation}}
            return result
        self.assertEqual(serve_bench.sampled_request_peak(stats(500)), 500)
        self.assertEqual(serve_bench.sampled_request_peak(stats(500, 900)), 900)
        self.assertEqual(serve_bench.sampled_request_peak(stats(900, 500)), 900)
        for bad in [stats(0, 900), stats(True, 900), stats(500, -1),
                    stats(500) | {'imagePreparation': {}}, stats(500) | {'imagePreparation': None}]:
            self.assertIsNone(serve_bench.sampled_request_peak(bad))
        def cell(arm, observation):
            return {'arm': arm, 'round': 1, 'valid': True, 'client_seconds': 1, 'text': 'x',
                    'metrics': {'prompt_ids': [1], 'output_ids': [2], 'effective_mtp': False,
                                'effective_pool_slots': 640, 'stats': observation | {'requestSeconds': 1}}}
        rows = [cell('reference', stats(500, 900)), cell('candidate', stats(300, 950))]
        # The generator alone saves 200, but the complete request regresses 50.
        self.assertEqual(summaries(rows, 'reference')[0]['pairs'][0]['sampled_peak_savings_bytes'], -50)

    def test_initial_quiet_interval_resets_and_times_out_before_launch(self):
        clock = [0.0]
        def sleep(seconds): clock[0] += seconds
        def jobs(): return [{'kind': 'build'}] if clock[0] < 4 or clock[0] == 8 else []
        with redirect_stdout(io.StringIO()):
            result = serve_bench.wait_for_quiet_workspace({'stable_seconds': 6, 'maximum_wait_seconds': 20},
                check=jobs, now=lambda: clock[0], sleep=sleep)
        self.assertEqual(result['wait_seconds'], 16)
        self.assertEqual(result['quiet_seconds'], 6)
        self.assertEqual(result['samples_with_competing_work'], 3)
        clock[0] = 0
        with redirect_stdout(io.StringIO()), self.assertRaises(TimeoutError):
            serve_bench.wait_for_quiet_workspace({'stable_seconds': 6, 'maximum_wait_seconds': 10},
                check=lambda: [{'kind': 'build'}], now=lambda: clock[0], sleep=sleep)
        self.assertEqual(clock[0], 10)
        p = {'stop_on_workspace_contention': True,
             'initial_workspace_quiet': {'stable_seconds': 180, 'maximum_wait_seconds': 1800}}
        self.assertEqual(serve_bench.workspace_quiet_requirement(p), p['initial_workspace_quiet'])
        self.assertIsNone(serve_bench.workspace_quiet_requirement({}))
        for change in [{'stop_on_workspace_contention': False}, {'initial_workspace_quiet': {}},
                       {'initial_workspace_quiet': {'stable_seconds': True, 'maximum_wait_seconds': 1800}},
                       {'initial_workspace_quiet': {'stable_seconds': 600, 'maximum_wait_seconds': 300}},
                       {'initial_workspace_quiet': {'stable_seconds': 180, 'maximum_wait_seconds': 1801}}]:
            with self.assertRaises(ValueError): serve_bench.workspace_quiet_requirement(p | change)

    def test_image_preparation_peak_is_part_of_resource_gate(self):
        protocol = {'images': [{}], 'maximum_sampled_footprint_bytes': 1000}
        stats = {'sampledFootprint': {'peakBytes': 900, 'samples': 2},
                 'imagePreparation': {'sampledFootprint': {'peakBytes': 950, 'samples': 2},
                     'seconds': .2, 'sourceDecodeSeconds': .1, 'towerReadySeconds': .1}}
        self.assertEqual(resource_exclusions(stats, protocol), [])
        for change in [{'imagePreparation': None},
                       {'imagePreparation': stats['imagePreparation'] | {'sampledFootprint': {'peakBytes': 1001, 'samples': 2}}},
                       {'imagePreparation': stats['imagePreparation'] | {'seconds': True}},
                       {'imagePreparation': stats['imagePreparation'] | {'towerReadySeconds': float('nan')}}]:
            self.assertTrue(resource_exclusions(stats | change, protocol))

    def test_image_study_pins_inline_bytes_order_and_bounds(self):
        with TemporaryDirectory() as directory:
            image = Path(directory)/'a.png'; image.write_bytes(b'first-image')
            other = Path(directory)/'b.png'; other.write_bytes(b'second-image')
            entries = [{'path': str(p), 'sha256': serve_bench.digest(p)} for p in [image, other, image]]
            protocol = {'images': entries, 'raw': False, 'memory_gb': 10, 'max_tokens': 1, 'seed': 7}
            body = json.loads(request_body(protocol, 'describe'))
            self.assertEqual([serve_bench.base64.b64decode(x) for x in body['images']],
                             [b'first-image', b'second-image', b'first-image'])
            self.assertEqual(body['prompt'], 'describe')
            self.assertNotIn('images', json.loads(request_body({'max_tokens': 1, 'seed': 7}, 'text')))
            for bad in [{'raw': True}, {'memory_gb': 16}, {'images': []}, {'images': entries*2},
                        {'images': [entries[0] | {'sha256': '0'*64}]},
                        {'images': [entries[0] | {'path': None}]},
                        {'images': [entries[0] | {'url': 'https://example.invalid'}]}]:
                with self.assertRaises(ValueError): request_body(protocol | bad, 'describe')
            image.write_bytes(b'changed-image')
            with self.assertRaises(ValueError): request_body(protocol, 'describe')
            image.write_bytes(b'')
            with self.assertRaises(ValueError): request_body(protocol, 'describe')
            with image.open('wb') as f: f.truncate((8 << 20) + 1)
            with self.assertRaises(ValueError): request_body(protocol, 'describe')

    def test_contention_guard_identifies_jobs_without_persisting_arguments(self):
        def run(args, **kwargs):
            if 'pid=,comm=' in args:
                return SimpleNamespace(stdout='10 /repo/slotstream\n11 /usr/bin/Python\n12 /usr/bin/ssh\n13 /repo/slotstream\n')
            return SimpleNamespace(returncode=0, stdout='10 /repo/slotstream pull --secret private-value\n'
                '11 /usr/bin/Python Tools/slotpack/full_pull.py --url secret-url\n'
                '13 /repo/slotstream serve --port 12345\n')
        jobs = serve_bench.competing_jobs(run=run)
        self.assertEqual([x['pid'] for x in jobs], [10, 11])
        self.assertNotIn('private-value', json.dumps(jobs))
        self.assertNotIn('secret-url', json.dumps(jobs))
        self.assertIsNone(serve_bench.competing_job_kind('/usr/bin/ssh', 'ssh host python Tools/slotpack/pack.py'))
        self.assertIsNone(serve_bench.competing_job_kind('/repo/slotstream', '/repo/slotstream serve --port 1'))
        self.assertEqual(serve_bench.competing_job_kind('/repo/download-harness', 'test'), 'checkpoint download test')
        self.assertEqual(serve_bench.competing_job_kind('/usr/bin/swift-frontend', 'test'), 'Swift build')
        self.assertFalse(serve_bench.contention_guard({}))
        self.assertTrue(serve_bench.contention_guard({'stop_on_workspace_contention': True}))
        for invalid in [1, 'true', None]:
            with self.assertRaises(ValueError): serve_bench.contention_guard({'stop_on_workspace_contention': invalid})

    def test_unique_retention_study_requires_distinct_frozen_warmup(self):
        with TemporaryDirectory() as directory:
            measured = Path(directory)/'measured'; measured.write_text('measured prompt')
            warm = Path(directory)/'warm'; warm.write_text('distinct warmup')
            p = {'arms': {'reference': {}, 'candidate': {}}, 'memory_gb': 8.1, 'raw': True,
                'prefix_cache': {'expected_reused_tokens': {'reference': 0, 'candidate': 0}, 'retention_only': True},
                'warmup_fixture': str(warm), 'warmup_fixture_sha256': serve_bench.digest(warm)}
            self.assertEqual(serve_bench.prefix_study(p), {'reference': 0, 'candidate': 0})
            self.assertEqual(serve_bench.warmup_fixture(p, measured), warm.resolve())
            self.assertEqual(serve_bench.warmup_fixture({}, measured), measured)
            for change in [{'warmup_fixture_sha256': '0'*64}, {'memory_gb': 16}, {'raw': False},
                           {'warmup_fixture': None}, {'prefix_cache': None}]:
                with self.assertRaises(ValueError): serve_bench.warmup_fixture(p | change, measured)
            for change in [{'complete_prompt': True}, {'retention_only': 1},
                {'expected_reused_tokens': {'reference': 0, 'candidate': 1}}]:
                with self.assertRaises(ValueError): serve_bench.prefix_study(p | {'prefix_cache': p['prefix_cache'] | change})
            del p['warmup_fixture_sha256']
            with self.assertRaises(ValueError): serve_bench.prefix_study(p)
            with self.assertRaises(ValueError): serve_bench.warmup_fixture(p, measured)
            p['warmup_fixture_sha256'] = serve_bench.digest(measured); p['warmup_fixture'] = str(measured)
            with self.assertRaises(ValueError): serve_bench.warmup_fixture(p, measured)

    def test_partial_prefix_requires_real_different_tail_and_no_full_hit(self):
        with TemporaryDirectory() as directory:
            measured = Path(directory)/'measured'; measured.write_text('common prefix plus new tail')
            warm_file = Path(directory)/'warm'; warm_file.write_text('common prefix plus old tail')
            p = {'arms': {'reference': {}, 'candidate': {}}, 'memory_gb': 8.1, 'raw': True,
                'prefix_cache': {'expected_reused_tokens': {'reference': 0, 'candidate': 2}, 'partial_prefix': True},
                'warmup_fixture': str(warm_file), 'warmup_fixture_sha256': serve_bench.digest(warm_file)}
            expected = serve_bench.prefix_study(p)
            self.assertEqual(serve_bench.warmup_fixture(p, measured), warm_file.resolve())
            base = {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 1, 'prefixCheckpointForks': 0,
                'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0, 'completePromptHits': 0}
            warm = {'prompt_ids': [1, 2, 3], 'stats': base}
            got = {'prompt_ids': [1, 2, 4], 'stats': base | {'reusedPrefixTokens': 2, 'prefixCheckpointForks': 1}}
            serve_bench.validate_prefix_observation(expected, 'candidate', warm, got, partial_prefix=True)
            for ids in [[1, 2, 3], [1, 9, 4], [1, 2]]:
                with self.assertRaises(ValueError):
                    serve_bench.validate_prefix_observation(expected, 'candidate', warm, got | {'prompt_ids': ids}, partial_prefix=True)
            for change in [{'completePromptHits': 1}, {'reusedPrefixTokens': 0}, {'prefixCheckpointForks': 0}]:
                with self.assertRaises(ValueError):
                    serve_bench.validate_prefix_observation(expected, 'candidate', warm, got | {'stats': got['stats'] | change}, partial_prefix=True)
            for change in [{'partial_prefix': 1}, {'complete_prompt': True}, {'retention_only': True},
                {'expected_reused_tokens': {'reference': 0, 'candidate': 0}}]:
                with self.assertRaises(ValueError): serve_bench.prefix_study(p | {'prefix_cache': p['prefix_cache'] | change})
            del p['warmup_fixture_sha256']
            with self.assertRaises(ValueError): serve_bench.prefix_study(p)

    def test_rope_and_terminal_work_constraints_require_actual_mechanism(self):
        for counter in ['fusedRoPERotationsScheduled', 'ropeTableHits', 'ropeTableBuilds', 'terminalQueryRowsSkipped', 'fusedGDNProjectionsScheduled', 'packedGDNProjectionLayers', 'packedGDNProjectionPayloadBytes']:
            p = {'arms': {'candidate': {}}, 'work_constraints': {'candidate': {counter: {'min': 1, 'max': 5000}}}}
            bounds = serve_bench.work_constraints(p)
            serve_bench.validate_work_observation(bounds, 'candidate', {counter: 32})
            for bad in [{}, {counter: 0}, {counter: True}, {counter: 5001}]:
                with self.assertRaises(ValueError): serve_bench.validate_work_observation(bounds, 'candidate', bad)

    def test_unique_retention_observation_must_reuse_no_tokens(self):
        expected = {'reference': 0, 'candidate': 0}
        stats = {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 0, 'prefixCheckpointForks': 0,
            'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0}
        warm = {'prompt_ids': [1, 2], 'stats': stats}
        measured = {'prompt_ids': [3, 4], 'stats': stats}
        serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured, retention_only=True)
        with self.assertRaises(ValueError):
            serve_bench.validate_prefix_observation(expected, 'candidate', warm, warm, retention_only=True)
        bad = {'prompt_ids': [3, 4], 'stats': stats | {'reusedPrefixTokens': 1}}
        with self.assertRaises(ValueError):
            serve_bench.validate_prefix_observation(expected, 'candidate', warm, bad, retention_only=True)

    def test_complete_prompt_requires_explicit_permission_exact_identity_and_zero_prefill(self):
        good = {'schema_version': 1, 'prompt_ids': [17, 23], 'output_ids': [31],
            'stats': {'prefillSeconds': 0, 'decodeSeconds': 1, 'requestSeconds': 1.1,
                'imageEncodeSeconds': 0, 'prefillRecords': 0, 'decodeRecords': 2,
                'prefillTokens': 0, 'promptTokens': 2, 'decodeTokens': 1,
                'lifetimeRSSPeakBytes': 100, 'prefillPasses': [], 'prefillComputePasses': [],
                'prefillReadBytes': 0, 'completePromptHits': 1, 'reusedPrefixTokens': 2}}
        with self.assertRaises(ValueError): validate_metrics(good)
        self.assertEqual(validate_metrics(good, allow_complete_prompt=True)['prefillTokens'], 0)
        for key, value in [('completePromptHits', 0), ('completePromptHits', True),
            ('reusedPrefixTokens', 1), ('reusedPrefixTokens', True), ('prefillRecords', 1),
            ('prefillPasses', [0]), ('prefillComputePasses', [0]), ('prefillReadBytes', 1),
            ('prefillReadBytes', False), ('promptTokens', 0), ('prefillSeconds', True)]:
            invalid = copy.deepcopy(good); invalid['stats'][key] = value
            with self.assertRaises(ValueError): validate_metrics(invalid, allow_complete_prompt=True)
        for permission in [1, None, 'true']:
            with self.assertRaises(ValueError): validate_metrics(good, allow_complete_prompt=permission)

    def test_complete_prompt_study_requires_warmup_logit_storage(self):
        p = {'arms': {'reference': {}, 'candidate': {}}, 'prefix_cache': {
            'expected_reused_tokens': {'reference': 0, 'candidate': 2}, 'complete_prompt': True}}
        expected = serve_bench.prefix_study(p)
        warm = {'prompt_ids': [17, 23], 'stats': {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 0,
            'completePromptStores': 1, 'completePromptHits': 0, 'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0}}
        measured = {'prompt_ids': [17, 23], 'stats': warm['stats'] | {
            'reusedPrefixTokens': 2, 'prefixCheckpointForks': 1, 'completePromptHits': 1}}
        serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured, complete_prompt=True)
        with self.assertRaises(ValueError): serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured)
        for key, value in [('completePromptStores', 0), ('completePromptHits', 1), ('prefixCheckpointStores', 1)]:
            bad = copy.deepcopy(warm); bad['stats'][key] = value
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', bad, measured, complete_prompt=True)
        for ids in [[17], [17, 23, 31], [17, 24]]:
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured | {'prompt_ids': ids}, complete_prompt=True)
        for value in [1, None, 'true']:
            with self.assertRaises(ValueError): serve_bench.prefix_study(p | {'prefix_cache': p['prefix_cache'] | {'complete_prompt': value}})

    def test_complete_hit_can_require_a_separately_stored_partial_checkpoint(self):
        stores = {'reference': 0, 'candidate': 1}
        p = {'arms': {'reference': {}, 'candidate': {}}, 'prefix_cache': {
            'expected_reused_tokens': {'reference': 0, 'candidate': 2}, 'complete_prompt': True,
            'expected_warmup_checkpoint_stores': stores}}
        expected = serve_bench.prefix_study(p)
        warm = {'prompt_ids': [17, 23], 'stats': {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 1,
            'completePromptStores': 1, 'completePromptHits': 0, 'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0}}
        measured = {'prompt_ids': [17, 23], 'stats': warm['stats'] | {
            'reusedPrefixTokens': 2, 'prefixCheckpointForks': 1, 'completePromptHits': 1}}
        serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured,
            complete_prompt=True, warmup_checkpoint_stores=stores)
        # Historical single-feature studies still require zero partial stores.
        with self.assertRaises(ValueError):
            serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured, complete_prompt=True)
        for key, value in [('prefixCheckpointStores', 0), ('completePromptStores', 0),
                           ('prefixCheckpointErrors', 1), ('prefixCheckpointRefusals', 1)]:
            bad = copy.deepcopy(warm); bad['stats'][key] = value
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', bad, measured,
                    complete_prompt=True, warmup_checkpoint_stores=stores)

    def test_combined_warmup_checkpoint_counts_are_explicit_and_bounded(self):
        p = {'arms': {'reference': {}, 'candidate': {}}, 'prefix_cache': {
            'expected_reused_tokens': {'reference': 0, 'candidate': 2}, 'complete_prompt': True}}
        for stores in [None, {}, {'candidate': 1}, {'reference': 1, 'candidate': 1},
                       {'reference': 0, 'candidate': True}, {'reference': 0, 'candidate': 2},
                       {'reference': 0, 'candidate': 1, 'extra': 0}]:
            with self.assertRaises(ValueError):
                serve_bench.prefix_study(p | {'prefix_cache': p['prefix_cache'] | {'expected_warmup_checkpoint_stores': stores}})
        with self.assertRaises(ValueError):
            serve_bench.prefix_study(p | {'prefix_cache': p['prefix_cache'] | {
                'complete_prompt': False, 'expected_warmup_checkpoint_stores': {'reference': 0, 'candidate': 1}}})

    def test_resident_overlap_requires_a_completed_join_for_every_submission(self):
        counters = {'residentExpertPrelaunches': {'min': 1}, 'residentExpertJoins': {'min': 1}}
        protocol = {'arms': {'candidate': {}}, 'work_constraints': {'candidate': counters}}
        bounds = serve_bench.work_constraints(protocol)
        serve_bench.validate_work_observation(bounds, 'candidate',
            {'residentExpertPrelaunches': 3, 'residentExpertJoins': 3})
        for stats in [{'residentExpertPrelaunches': 3, 'residentExpertJoins': 2},
                      {'residentExpertPrelaunches': 2, 'residentExpertJoins': 3},
                      {'residentExpertPrelaunches': 1},
                      {'residentExpertPrelaunches': True, 'residentExpertJoins': 1}]:
            with self.assertRaises(ValueError): serve_bench.validate_work_observation(bounds, 'candidate', stats)
        for key in counters:
            with self.assertRaises(ValueError):
                serve_bench.work_constraints({'arms': protocol['arms'], 'work_constraints': {'candidate': {key: {'min': 1}}}})

    def test_prospective_work_constraints_refuse_inactive_or_missing_mechanisms(self):
        bounds = {'reference': {'decodeSlotCPUBatches': {'min': 0, 'max': 0}},
                  'candidate': {'decodeSlotCPUBatches': {'min': 1}, 'decodeModelTokens': {'min': 15, 'max': 15}}}
        protocol = {'arms': {'reference': {}, 'candidate': {}}, 'work_constraints': bounds}
        self.assertEqual(serve_bench.work_constraints(protocol), bounds)
        serve_bench.validate_work_observation(bounds, 'reference', {'decodeSlotCPUBatches': 0})
        serve_bench.validate_work_observation(bounds, 'candidate', {'decodeSlotCPUBatches': 47, 'decodeModelTokens': 15})
        for invalid in [0, -1, True, None, float('nan'), 1.5]:
            with self.assertRaises(ValueError):
                serve_bench.validate_work_observation(bounds, 'candidate', {'decodeSlotCPUBatches': invalid, 'decodeModelTokens': 15})
        for invalid in [None, {}, {'min': -1}, {'min': True}, {'min': 2, 'max': 1}, {'value': 1}]:
            changed = copy.deepcopy(protocol)
            changed['work_constraints']['candidate']['decodeSlotCPUBatches'] = invalid
            with self.assertRaises(ValueError): serve_bench.work_constraints(changed)
        for invalid in [{}, {'other': {}}, {'reference': {}, 'candidate': {'unknown': {'min': 1}}}]:
            with self.assertRaises(ValueError): serve_bench.work_constraints({'arms': protocol['arms'], 'work_constraints': invalid})
        self.assertIsNone(serve_bench.work_constraints({'arms': protocol['arms']}))
        serve_bench.validate_work_observation(None, 'reference', {})

    def test_explicit_frozen_binary_digest_cannot_silently_change(self):
        wanted='a'*64
        builds={'reference':{'identity':{'binary_sha256':wanted}},'candidate':{'identity':{'binary_sha256':wanted}}}
        serve_bench.validate_declared_binary({'frozen_binary_sha256':wanted},builds)
        changed=copy.deepcopy(builds);changed['candidate']['identity']['binary_sha256']='b'*64
        with self.assertRaises(ValueError): serve_bench.validate_declared_binary({'frozen_binary_sha256':wanted},changed)
        for invalid in [True,17,'x'*64,'A'*64,wanted[:-1]]:
            with self.assertRaises(ValueError): serve_bench.validate_declared_binary({'frozen_binary_sha256':invalid},builds)
        with self.assertRaises(ValueError): serve_bench.validate_declared_binary({'frozen_binary_sha256':wanted},{})

    def test_resource_savings_require_real_measurements_in_every_valid_pair(self):
        def cell(arm, active, peak):
            return {'round':1, 'arm':arm, 'valid':True, 'client_seconds':1, 'text':'same',
                'metrics':{'prompt_ids':[17], 'output_ids':[23], 'effective_mtp':False, 'effective_pool_slots':640,
                    'stats':{'requestSeconds':1, 'mlxActiveEndBytes':active, 'sampledFootprint':{'peakBytes':peak}}}}
        ref, cand = cell('reference',1000,2000), cell('candidate',700,1800)
        contract={'minimum_pairs':1,'maximum_median_client_regression':0.05,'minimum_positive_fraction':0,
            'all_outputs_exact':True,'minimum_active_savings_bytes':300,'minimum_sampled_peak_savings_bytes':200}
        result=summaries([ref,cand],'reference')
        self.assertTrue(acceptance_results(result,contract)[0]['passed'])
        for key,value in [('mlxActiveEndBytes',701),('sampledFootprint',{'peakBytes':1801}),
                          ('mlxActiveEndBytes',None),('sampledFootprint',None),('mlxActiveEndBytes',True)]:
            bad=copy.deepcopy(cand); bad['metrics']['stats'][key]=value
            self.assertFalse(acceptance_results(summaries([ref,bad],'reference'),contract)[0]['passed'])
        for invalid in [0,-1,True,1.5,float('inf')]:
            with self.assertRaises(ValueError):
                acceptance_results([],contract | {'minimum_active_savings_bytes':invalid})

    def test_declared_cooldown_holds_and_releases_the_model_reservation(self):
        with TemporaryDirectory() as d:
            path=Path(d)/'lock'
            def asleep(seconds):
                self.assertEqual(seconds,1)
                with path.open('a') as other:
                    with self.assertRaises(BlockingIOError): fcntl.flock(other,fcntl.LOCK_EX | fcntl.LOCK_NB)
            with patch('serve_bench.time.sleep',side_effect=asleep):
                result=serve_bench.reserved_cooldown(1,1,lock_path=path)
            self.assertTrue(result['reserved'])
            with path.open('a') as other: fcntl.flock(other,fcntl.LOCK_EX | fcntl.LOCK_NB)
        for invalid in [True,-1,1801,1.5,None]:
            with self.assertRaises(ValueError): serve_bench.reservation_wait_limit({'model_reservation_wait_seconds':invalid})

    def test_large_scope_study_keeps_explicit_memory_compute_and_abort_bounds(self):
        p = {'memory_gb':16,'max_tokens':1,'raw':True,
             'large_scope_measurement':{'purpose':'bounded scope qualification'},
             'abort_on_resource_failure':True,'require_nominal_power_state':True,
             'maximum_sampled_footprint_bytes':16_000_000_000,
             'arms':{'reference':{'chunk':256,'env':{}},'candidate':{'chunk':256,
                'env':{'SLOTSTREAM_OPT_READ_SCOPE':'1024','SLOTSTREAM_OPT_WORKSPACE_TILE':'256'}}}}
        self.assertEqual(measurement_memory(p),22)
        for change in [{'memory_gb':24,'maximum_sampled_footprint_bytes':24_000_000_000},
                       {'memory_gb':10}, {'max_tokens':5}, {'abort_on_resource_failure':False},
                       {'large_pool_measurement':{'purpose':'conflicting isolation'}}]:
            with self.assertRaises(ValueError): measurement_memory(p | change)
        for key,value in [('SLOTSTREAM_OPT_READ_SCOPE','4096'),('SLOTSTREAM_OPT_WORKSPACE_TILE','512')]:
            bad=copy.deepcopy(p); bad['arms']['candidate']['env'][key]=value
            with self.assertRaises(ValueError): measurement_memory(bad)

    def test_cooldown_is_explicit_bounded_and_finite(self):
        self.assertEqual(serve_bench.cell_cooldown({}),0)
        self.assertEqual(serve_bench.cell_cooldown({'between_cells_seconds':60}),60)
        for value in [True,-1,61,float('nan'),float('inf'),'60',None]:
            with self.assertRaises(ValueError): serve_bench.cell_cooldown({'between_cells_seconds':value})

    def test_prefix_study_requires_observed_committed_fork_and_exact_workload(self):
        protocol = {'arms': {'reference': {}, 'candidate': {}},
                    'prefix_cache': {'expected_reused_tokens': {'reference': 0, 'candidate': 256}}}
        expected = serve_bench.prefix_study(protocol)
        stats = {'reusedPrefixTokens': 0, 'prefixCheckpointStores': 1,
                 'prefixCheckpointErrors': 0, 'prefixCheckpointRefusals': 0}
        warm = {'prompt_ids': list(range(273)), 'stats': stats}
        measured = {'prompt_ids': list(range(273)), 'stats': stats | {
            'reusedPrefixTokens': 256, 'prefixCheckpointForks': 1}}
        serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured)
        for key,value in [('reusedPrefixTokens', 0), ('prefixCheckpointForks', 0),
                          ('prefixCheckpointErrors', 1), ('prefixCheckpointRefusals', 1)]:
            bad = copy.deepcopy(measured); bad['stats'][key] = value
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', warm, bad)
        for ids in [list(range(256)), [999] + list(range(1,273))]:
            with self.assertRaises(ValueError):
                serve_bench.validate_prefix_observation(expected, 'candidate', warm, measured | {'prompt_ids':ids})
        for invalid in [False, {}, {'expected_reused_tokens': {'reference': 0}},
                        {'expected_reused_tokens': {'reference': 0, 'candidate': True}},
                        {'expected_reused_tokens': {'reference': 0, 'candidate': 0}}]:
            with self.assertRaises(ValueError): serve_bench.prefix_study(protocol | {'prefix_cache':invalid})

    def test_startup_amortization_preserves_first_job_and_pair_exclusions(self):
        def cell(name,start,first,request):
            return {'round':1,'arm':name,'valid':True,'startup_and_warmup_valid':True,
                    'startup_seconds':start,'client_seconds':request,
                    'first_request':{'prompt_ids':[1,2],'output_ids':[3,4],'text':'ok',
                        'effective_pool_slots':640,'effective_mtp':False,'complete_seconds_from_launch':first}}
        rows=[cell('reference',1,3,2),cell('candidate',7,10,1)]
        result=serve_bench.startup_summaries(rows,'reference')[0]
        self.assertEqual(result['median_startup_excess_seconds'],6)
        self.assertEqual(result['median_first_job_excess_seconds'],7)
        self.assertEqual(result['pairs'][0]['estimated_total_jobs_to_amortize'],8)
        rows[1]['startup_and_warmup_valid']=False
        self.assertEqual(serve_bench.startup_summaries(rows,'reference')[0]['excluded_rounds'],[1])
        rows[1]['startup_and_warmup_valid']=True
        rows[1]['first_request']['output_ids']=[9]
        self.assertEqual(serve_bench.startup_summaries(rows,'reference')[0]['pairs'],[])

    def test_startup_amortization_requires_finite_complete_measurements_and_saving(self):
        first={'prompt_ids':[1],'output_ids':[2],'text':'x','effective_pool_slots':640,'effective_mtp':False,
               'complete_seconds_from_launch':3}
        base={'round':1,'valid':True,'startup_and_warmup_valid':True,'startup_seconds':1,
              'client_seconds':2,'first_request':first}
        rows=[dict(base,arm='reference'),dict(base,arm='candidate')]
        self.assertIsNone(serve_bench.startup_summaries(rows,'reference')[0]['pairs'][0]['estimated_total_jobs_to_amortize'])
        for field,value in [('startup_seconds',float('nan')),('client_seconds',0),('client_seconds',None)]:
            bad=copy.deepcopy(rows);bad[1][field]=value
            self.assertEqual(serve_bench.startup_summaries(bad,'reference')[0]['pairs'],[])

    def test_long_context_gate_requires_completion_and_exact_observed_work(self):
        good = {'prompt_ids': [907] * 2049, 'output_ids': [17, 18],
                'stats': {'promptTokens': 2049, 'decodeTokens': 2, 'finishReason': 'stop'}}
        self.assertTrue(check_answer(good, '\nSeventeen.\n', 'SEVENTEEN', 2049, 16)['passed'])
        for text in ['<think> The user asks', 'The answer is SEVENTEEN or EIGHT.', 'EIGHTEEN', '']:
            with self.assertRaises(ValueError): check_answer(good, text, 'SEVENTEEN', 2049, 16)
        for key, value in [('finishReason', 'length'), ('runtimeError', 'read failed'),
                           ('promptTokens', 2048), ('decodeTokens', 3)]:
            bad = copy.deepcopy(good); bad['stats'][key] = value
            with self.assertRaises(ValueError): check_answer(bad, 'SEVENTEEN', 'SEVENTEEN', 2049, 16)
        bad = copy.deepcopy(good); bad['output_ids'] = []
        with self.assertRaises(ValueError): check_answer(bad, 'SEVENTEEN', 'SEVENTEEN', 2049, 16)
        bad = copy.deepcopy(good); bad['output_ids'][0] = True
        with self.assertRaises(ValueError): check_answer(bad, 'SEVENTEEN', 'SEVENTEEN', 2049, 16)

    def test_resource_acceptance_requires_real_active_savings_in_every_clean_pair(self):
        contract = {'minimum_pairs': 1, 'maximum_median_client_regression': .05,
                    'minimum_positive_fraction': 0, 'all_outputs_exact': True,
                    'minimum_sequence_reduction': .05, 'minimum_active_savings_share': .9}
        pair = {'client_reduction_fraction': 0, 'output_ids_equal': True, 'wire_text_equal': True,
                'sequence_reduction_fraction': .1, 'active_savings_share': 1}
        summary = [{'candidate': 'candidate', 'pairs': [pair], 'median_client_reduction_fraction': 0}]
        self.assertTrue(acceptance_results(summary, contract)[0]['passed'])
        for key in ['sequence_reduction_fraction', 'active_savings_share']:
            for invalid in [None, float('nan'), True, 0]:
                bad = copy.deepcopy(summary); bad[0]['pairs'][0][key] = invalid
                self.assertFalse(acceptance_results(bad, contract)[0]['passed'])
            bad = copy.deepcopy(summary); bad[0]['pairs'].append(pair | {key: None})
            self.assertFalse(acceptance_results(bad, contract)[0]['passed'])
        for invalid in [True, -1, float('nan'), 1.1]:
            with self.assertRaises(ValueError):
                acceptance_results([], contract | {'minimum_active_savings_share': invalid})

    def test_serving_arm_schema_refuses_delivery_errors_before_launch(self):
        good = {'reference': {'chunk': 256, 'env': {}},
                'candidate': {'chunk': 512, 'env': {'SLOTSTREAM_OPT_COMPACT_STATE': '1'}, 'binary': '/frozen/slotstream'}}
        serve_bench.validate_arms(good)
        for invalid in [None, [], {}, {'candidate': good['candidate']},
                {'reference': {'SLOTSTREAM_OPT_COMPACT_STATE': '1'}},
                {'reference': {'chunk': True, 'env': {}}},
                {'reference': {'chunk': 255, 'env': {}}},
                {'reference': {'chunk': 256, 'env': {'UNRELATED': '1'}}},
                {'reference': {'chunk': 256, 'env': {'SLOTSTREAM_OPT_COMPACT_STATE': True}}},
                {'reference': {'chunk': 256, 'env': {'SLOTSTREAM_PREFILL_CHUNK': '512'}}},
                {'reference': {'chunk': 256, 'env': {}, 'environ': {}}}]:
            with self.subTest(invalid=invalid), self.assertRaises(ValueError):
                serve_bench.validate_arms(invalid)

    def test_sampled_serving_freezes_typed_shared_parameters(self):
        protocol = {'max_tokens': 16, 'seed': 7}
        sampling = {'temperature': .7, 'top_p': .8, 'top_k': 20, 'min_p': 0, 'presence_penalty': 1.5}
        self.assertEqual(json.loads(request_body(protocol | {'sampling': sampling}, 'q'))['options'],
                         {'num_predict': 16, 'seed': 7} | sampling)
        for sampling in [{'seed': 8}, {'top_k': True}, {'temperature': '0.7'}, {'top_p': 0},
                         {'temperature': float('nan')}, {'min_p': 1.01}, {'top_k': -1},
                         {'presence_penalty': float('inf')}, [], None]:
            with self.assertRaises(ValueError): request_body(protocol | {'sampling': sampling}, 'q')

    def test_non_regression_is_separate_from_existing_gain_contracts(self):
        contract = {'minimum_pairs': 1, 'maximum_median_client_regression': .05,
                    'minimum_positive_fraction': 0, 'all_outputs_exact': True}
        item = {'candidate': 'candidate', 'pairs': [{'client_reduction_fraction': -.04,
                    'output_ids_equal': True, 'wire_text_equal': True}], 'median_client_reduction_fraction': -.04}
        self.assertTrue(acceptance_results([item], contract)[0]['passed'])
        item['median_client_reduction_fraction'] = -.050001
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['median_client_reduction_fraction'] = None
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        for value in [float('nan'), float('inf'), True, -.05, 1.1]:
            with self.assertRaises(ValueError):
                acceptance_results([], contract | {'maximum_median_client_regression': value})
        with self.assertRaises(ValueError):
            acceptance_results([], contract | {'minimum_median_client_reduction': .05})

    def test_cross_build_identity_checks_the_selected_executable(self):
        with TemporaryDirectory() as directory:
            root = Path(directory)
            for name in ['slotstream', 'mlx.metallib', 'build-source.tar.gz']:
                (root / name).write_bytes(name.encode())
            identity = {key: serve_bench.digest(root / name) for name, key in [
                ('slotstream', 'binary_sha256'), ('mlx.metallib', 'metallib_sha256'),
                ('build-source.tar.gz', 'source_archive_sha256')]}
            (root / 'build-identity.json').write_text(json.dumps(identity))
            self.assertEqual(serve_bench.verified_build(root / 'slotstream')['identity'], identity)
            (root / 'slotstream').write_bytes(b'changed')
            with self.assertRaises(ValueError): serve_bench.verified_build(root / 'slotstream')

    def test_memory_settling_waits_only_for_verified_headroom_and_has_a_deadline(self):
        now = [0.0]
        def sleep(seconds): now[0] += seconds
        error = serve_bench.InsufficientHeadroom('not yet reclaimed')
        with patch.object(serve_bench.time, 'monotonic', side_effect=lambda: now[0]), \
             patch.object(serve_bench.time, 'sleep', side_effect=sleep), \
             patch.object(serve_bench, 'preflight', side_effect=[error, error, {'reclaimable_bytes': 31_000_000_000}]):
            snapshot, observation = serve_bench.wait_for_headroom(30, 1)
        self.assertEqual(snapshot['reclaimable_bytes'], 31_000_000_000)
        self.assertEqual(observation['checks'], 3); self.assertEqual(observation['seconds'], .5)
        now[0] = 0
        with patch.object(serve_bench.time, 'monotonic', side_effect=lambda: now[0]), \
             patch.object(serve_bench.time, 'sleep', side_effect=sleep), \
             patch.object(serve_bench, 'preflight', side_effect=error):
            with self.assertRaises(serve_bench.InsufficientHeadroom): serve_bench.wait_for_headroom(30, .5)
        self.assertEqual(now[0], .5)
        with patch.object(serve_bench, 'preflight', side_effect=RuntimeError('another model owns the lock')) as check:
            with self.assertRaises(RuntimeError): serve_bench.wait_for_headroom(30, 30)
            self.assertEqual(check.call_count, 1)
        for value in [-1, 31, float('nan'), float('inf'), True]:
            with self.assertRaises(ValueError): serve_bench.wait_for_headroom(30, value)

    def test_large_pool_measurements_require_explicit_bounds_and_six_gb_headroom(self):
        small = {'memory_gb': 8.1}
        self.assertEqual(measurement_memory(small), 11.1)
        for value in [True, float('nan'), float('inf'), 8, 24.1]:
            with self.assertRaises(ValueError): measurement_memory({'memory_gb': value})
        large = {'memory_gb': 24, 'large_pool_measurement': {'purpose': 'isolate full-model all-hit decode'},
                 'abort_on_resource_failure': True, 'require_nominal_power_state': True,
                 'maximum_sampled_footprint_bytes': 24_000_000_000, 'max_tokens': 16,
                 'arms': {'reference': {'chunk': 256, 'env': {}}}}
        self.assertEqual(measurement_memory(large), 30)
        for key in ['large_pool_measurement', 'abort_on_resource_failure', 'require_nominal_power_state', 'maximum_sampled_footprint_bytes']:
            bad = copy.deepcopy(large); del bad[key]
            with self.assertRaises(ValueError): measurement_memory(bad)
        for change in [{'max_tokens': 65}, {'raw': False}, {'maximum_sampled_footprint_bytes': True},
                       {'large_pool_measurement': {'purpose': ''}}]:
            with self.assertRaises(ValueError): measurement_memory(large | change)
        bad = copy.deepcopy(large); bad['arms']['reference']['env']['SLOTSTREAM_OPT_LAYER_WORKSPACE'] = '1'
        with self.assertRaises(ValueError): measurement_memory(bad)

    def test_all_hit_label_requires_zero_prefill_and_decode_reads(self):
        contract = {'require_all_expert_hits': True}
        self.assertFalse(workload_exclusions({'prefillRecords': 0, 'decodeRecords': 0}, contract))
        for stats in [{}, {'prefillRecords': 1, 'decodeRecords': 0}, {'prefillRecords': 0, 'decodeRecords': 1},
                      {'prefillRecords': 0, 'decodeRecords': False}]:
            self.assertTrue(workload_exclusions(stats, contract))
        with self.assertRaises(ValueError): workload_exclusions({}, {'require_all_expert_hits': 'yes'})

    def test_memory_gate_uses_bytes_and_rejects_missing_samples_or_swap(self):
        stats = {'sampledFootprint': {'peakBytes': 10_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                 'lifetimeRSSPeakBytes': 1_000_000_000, 'physicalFootprintEndBytes': 2_000_000_000,
                 'generatorVMBefore': {'swapins': 4, 'swapouts': 5},
                 'generatorVMAfter': {'swapins': 4, 'swapouts': 5}}
        self.assertTrue(check_memory({'stats': stats}, '10')['passed'])
        bad = copy.deepcopy(stats); bad['sampledFootprint']['peakBytes'] += 1
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        bad = copy.deepcopy(stats); bad['generatorVMAfter']['swapins'] += 1
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        bad = copy.deepcopy(stats); bad['sampledFootprint']['peakBytes'] = True
        with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')
        for missing in ['sampledFootprint', 'generatorVMBefore', 'physicalFootprintEndBytes']:
            bad = copy.deepcopy(stats); del bad[missing]
            with self.assertRaises(KeyError): check_memory({'stats': bad}, '10')
        for image_kind in ['encodedImages', 'reusedImageFeatures', 'prefixSkippedImages']:
            bad = copy.deepcopy(stats); bad[image_kind] = 1
            with self.assertRaisesRegex(ValueError, 'missing its preparation'):
                check_memory({'stats': bad}, '10')
            bad[image_kind] = 0
            self.assertTrue(check_memory({'stats': bad}, '10')['passed'])
            for invalid in [True, -1, 0.5, '0']:
                bad[image_kind] = invalid
                with self.assertRaises(ValueError): check_memory({'stats': bad}, '10')

    def test_memory_gate_includes_first_image_preparation(self):
        stats = {'sampledFootprint': {'peakBytes': 7_000_000_000, 'samples': 3, 'intervalMilliseconds': 20},
                 'lifetimeRSSPeakBytes': 1_000_000_000, 'physicalFootprintEndBytes': 2_000_000_000,
                 'generatorVMBefore': {'swapins': 4, 'swapouts': 5},
                 'generatorVMAfter': {'swapins': 4, 'swapouts': 5},
                 'imagePreparation': {'sampledFootprint': {'peakBytes': 10_000_000_001, 'samples': 2, 'intervalMilliseconds': 20},
                                      'vmBefore': {'swapins': 4, 'swapouts': 5}, 'vmAfter': {'swapins': 4, 'swapouts': 5}}}
        with self.assertRaises(ValueError): check_memory({'stats': stats}, '10')
        stats['imagePreparation']['sampledFootprint']['peakBytes'] -= 1
        self.assertEqual(check_memory({'stats': stats}, 10)['maximum_observed_bytes'], 10_000_000_000)
        stats['imagePreparation']['vmAfter']['swapins'] += 1
        with self.assertRaises(ValueError): check_memory({'stats': stats}, 10)
        stats['imagePreparation']['vmAfter']['swapins'] -= 1
        stats['imagePreparation']['sampledFootprint'] = None
        with self.assertRaises(TypeError): check_memory({'stats': stats}, 10)

    def test_interrupted_serving_cell_stops_child_and_preserves_incomplete_result(self):
        # Exercise main's actual cleanup/persistence path without a model,
        # sockets, memory pressure, or an unbounded subprocess.
        with TemporaryDirectory() as directory:
            root = Path(directory); binary = root/'slotstream'; binary.write_bytes(b'fixture')
            (root/'build-source.tar.gz').write_bytes(b'fixture')
            (root/'mlx.metallib').write_bytes(b'fixture')
            (root/'build-identity.json').write_text(json.dumps({k: 'bound' for k in
                ['binary_sha256', 'metallib_sha256', 'source_archive_sha256']}))
            fixture = root/'prompt.txt'; fixture.write_text('test')
            protocol = {'arms': {'reference': {'chunk': 256, 'env': {}}},
                        'model': str(root), 'binary': str(binary), 'fixture': str(fixture),
                        'fixture_sha256': 'bound', 'memory_gb': 8.1, 'rounds': 1,
                        'max_tokens': 16, 'seed': 7}
            p = root/'protocol.json'; p.write_text(json.dumps(protocol)); out = root/'result'
            child = SimpleNamespace(pid=999_999)
            warm = {'text':'ok','metrics': {'stats': {'decodeTokens':16},'prompt_ids':[1],
                    'output_ids':[2]*16,'effective_pool_slots':640,'effective_mtp':False}}
            vm = {'swapins':0,'swapouts':0}
            with patch.object(serve_bench, 'digest', return_value='bound'), \
                 patch.object(serve_bench, 'model_identity', return_value={}), \
                 patch.object(serve_bench, 'preflight', return_value=vm), \
                 patch.object(serve_bench, 'host_conditions', return_value={}), \
                 patch.object(serve_bench, 'vm_snapshot', return_value=vm), \
                 patch.object(serve_bench.subprocess, 'Popen', return_value=child), \
                 patch.object(serve_bench, 'wait_ready'), \
                 patch.object(serve_bench, 'exchange', side_effect=[(warm, b'{}\n'), KeyboardInterrupt]), \
                 patch.object(serve_bench, 'stop_server') as stopped, \
                 patch('sys.argv', ['serve_bench', '--protocol', str(p), '--out', str(out)]), \
                 redirect_stdout(io.StringIO()):
                code = serve_bench.main()
            self.assertEqual(code, 130); stopped.assert_called_once_with(child)
            row = json.loads((out/'1-reference/result.json').read_text())
            self.assertTrue(row['interrupted']); self.assertFalse(row['valid'])
            completion = json.loads((out/'completion.json').read_text())
            self.assertTrue(completion['interrupted']); self.assertEqual(completion['recorded_cells'], 1)
            self.assertIsNone(completion['acceptance'])

    def test_declared_resource_limits_fail_closed(self):
        p = {'maximum_sampled_footprint_bytes': 10_000_000_000}
        self.assertTrue(resource_exclusions({}, p))
        self.assertTrue(resource_exclusions({'sampledFootprint': None}, p))
        self.assertTrue(resource_exclusions({'sampledFootprint': {'peakBytes': 10_000_000_001}}, p))
        self.assertFalse(resource_exclusions({'sampledFootprint': {'peakBytes': 10_000_000_000}}, p))
        self.assertFalse(resource_exclusions({}, {}))
        with self.assertRaises(ValueError): resource_exclusions({}, {'maximum_sampled_footprint_bytes': True})
        nominal = {'thermalState': 'nominal', 'lowPowerModeEnabled': False}
        s = {'generatorSystemBefore': nominal, 'generatorSystemAfter': nominal}
        p = {'require_nominal_power_state': True}
        self.assertFalse(resource_exclusions(s, p))
        self.assertTrue(resource_exclusions({}, p))
        s['generatorSystemAfter'] = nominal | {'thermalState': 'serious'}
        self.assertTrue(resource_exclusions(s, p))
        s['generatorSystemAfter'] = 'nominal'
        self.assertTrue(resource_exclusions(s, p))
        with self.assertRaises(ValueError): resource_exclusions({}, {'require_nominal_power_state': 'true'})

    def test_frozen_acceptance_rejects_insufficient_or_unequal_work(self):
        contract = {'minimum_pairs': 2, 'minimum_median_client_reduction': .05,
                    'minimum_positive_fraction': .8, 'all_outputs_exact': True}
        pair = {'client_reduction_fraction': .1, 'output_ids_equal': True, 'wire_text_equal': True}
        item = {'candidate': 'c', 'pairs': [pair.copy(), pair.copy()], 'median_client_reduction_fraction': .1}
        self.assertTrue(acceptance_results([item], contract)[0]['passed'])
        item['pairs'][-1]['output_ids_equal'] = False
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['pairs'].pop()
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        item['pairs'] = []; item['median_client_reduction_fraction'] = None
        self.assertFalse(acceptance_results([item], contract)[0]['passed'])
        for value in [float('nan'), float('inf'), True, -.1]:
            with self.assertRaises(ValueError): acceptance_results([], contract | {'minimum_positive_fraction': value})

    def test_serving_workload_uses_explicit_template_and_seed(self):
        protocol = {'max_tokens': 16, 'seed': 7}
        body = json.loads(request_body(protocol, 'λ\n"query"'))
        self.assertEqual(body['prompt'], 'λ\n"query"')
        self.assertTrue(body['raw'])
        self.assertNotIn('think', body)
        body = json.loads(request_body(protocol | {'raw': False, 'think': False}, 'query'))
        self.assertFalse(body['raw']); self.assertFalse(body['think'])
        self.assertEqual(body['options'], {'temperature': 0, 'num_predict': 16, 'seed': 7})
        for setting in [{'raw': 'false'}, {'think': False}, {'raw': False, 'think': 'false'}]:
            with self.assertRaises(ValueError): request_body(protocol | setting, 'query')

    def test_serving_summary_keeps_client_and_generator_metrics_separate(self):
        rows = [{'round': 1, 'arm': arm, 'valid': True, 'client_seconds': client, 'text': 'same',
                 'metrics': {'prompt_ids': [1], 'output_ids': [2], 'effective_pool_slots': 640,
                             'effective_mtp': False, 'stats': {'requestSeconds': generator}}}
                for arm, client, generator in [('reference', 10, 10), ('candidate', 10.6, 10.4)]]
        result = summaries(rows, 'reference')[0]
        self.assertAlmostEqual(result['median_client_reduction_fraction'], -.06)
        self.assertAlmostEqual(result['median_generator_reduction_fraction'], -.04)
        for row in rows: row['metrics']['stats']['decodeRecords'] = 10
        self.assertEqual(len(summaries(rows, 'reference', required_equal_work=['decodeRecords'])[0]['pairs']), 1)
        for value in [9, None, True, -1, float('nan')]:
            rows[-1]['metrics']['stats']['decodeRecords'] = value
            self.assertEqual(summaries(rows, 'reference', required_equal_work=['decodeRecords'])[0]['pairs'], [])
        for fields in ['decodeRecords', ['typo'], ['decodeRecords', 'decodeRecords'], [True]]:
            with self.assertRaises(ValueError): summaries([], 'reference', required_equal_work=fields)
        rows[-1]['metrics']['effective_pool_slots'] = 639
        self.assertEqual(summaries(rows, 'reference')[0]['pairs'], [])
        self.assertEqual(len(summaries(rows, 'reference', 'fixed-total-memory')[0]['pairs']), 1)
        with self.assertRaises(ValueError): summaries([], 'reference', 'unbounded')
        rows[-1]['valid'] = False
        result = summaries(rows, 'reference')[0]
        self.assertEqual(result['pairs'], []); self.assertEqual(result['excluded_rounds'], [1])

    def test_comparison_excludes_whole_pair(self):
        rows = []
        for round_number in [1, 2]:
            for arm in ["reference", "candidate"]:
                rows.append({"prompt":"p", "chunk":256, "round":round_number, "arm":arm,
                    "valid": not (round_number == 1 and arm == "candidate"),
                    "metrics":{"prompt_ids":[1,2], "output_ids":[3], "effective_pool_slots":640,
                               "stats":{"requestSeconds": 100 if round_number == 1 else (2 if arm == "reference" else 1)}}})
        result = paired_summary(rows, "reference")[0]
        self.assertEqual(result["excluded_rounds"], [1])
        self.assertEqual(result["median_request_reduction_fraction"], .5)
        self.assertEqual(len(result["pairs"]), 1)
        rows[-1]["metrics"]["prompt_ids"] = [2,3]
        self.assertIsNone(paired_summary(rows, "reference")[0]["median_request_reduction_fraction"])

    def test_reclaimable_uses_real_page_size_and_file_backed(self):
        for size in (4096, 16384):
            raw = f'''Mach Virtual Memory Statistics: (page size of {size} bytes)
Pages free: 11.
Pages inactive: 9999.
Pages speculative: 9999.
Pages purgeable: 13.
File-backed pages: 17.
Swapins: 19.
Swapouts: 23.
'''
            s = vm_snapshot(raw)
            self.assertEqual(s["reclaimable_bytes"], 41*size)
            self.assertEqual((s["swapins"], s["swapouts"]), (19, 23))

    def test_missing_memory_fields_fail_closed(self):
        with self.assertRaises(ValueError): vm_snapshot("page size of 4096 bytes\nPages free: 9.\n")

    def test_metrics_fail_closed(self):
        good = {"schema_version": 1, "stats": {"prefillSeconds": 1.0, "decodeSeconds": 0.2,
                "requestSeconds": 1.2, "imageEncodeSeconds": 0, "prefillRecords": 17,
                "decodeRecords": 3, "prefillTokens": 2, "promptTokens": 2, "decodeTokens": 1,
                "lifetimeRSSPeakBytes": 123, "prefillPasses": [2]}, "prompt_ids": [1,2], "output_ids": [3]}
        self.assertEqual(validate_metrics(good)["prefillRecords"], 17)
        for key, value in [("prefillSeconds", float("nan")), ("decodeSeconds", -1),
                           ("prefillRecords", None), ("decodeRecords", 0.5),
                           ("prefillTokens", 0), ("prefillPasses", [1]), ("decodeTokens", 2)]:
            with self.subTest(key=key):
                bad = copy.deepcopy(good); bad["stats"][key] = value
                with self.assertRaises(ValueError): validate_metrics(bad)
        bad = copy.deepcopy(good); del bad["stats"]["prefillRecords"]
        with self.assertRaises(ValueError): validate_metrics(bad)


if __name__ == "__main__": unittest.main()

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/remaining-qualification-preparation-v180/existing-image-cost-fractions.json` — 5094 bytes, SHA-256 `5434add550c609a2214048dff4719444b227711cbb6c842d7d5338fe2a25ea06`.

````text
[
  {
    "source": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-512-serving-v131/results.jsonl",
    "sha256": "f1130c505e7205f795a017e3768f00f201beab28c8176f0b97731c9fd474e0cb",
    "cells": [
      {
        "round": 1,
        "arm": "reference",
        "valid": false,
        "image_seconds": 0.116002542,
        "request_seconds": 4.775636125,
        "image_fraction": 0.024290490096751247
      },
      {
        "round": 1,
        "arm": "query",
        "valid": false,
        "image_seconds": 0.137507458,
        "request_seconds": 4.493857125,
        "image_fraction": 0.030598983050668306
      },
      {
        "round": 2,
        "arm": "query",
        "valid": true,
        "image_seconds": 0.130650875,
        "request_seconds": 4.493206042,
        "image_fraction": 0.029077427960958843
      },
      {
        "round": 2,
        "arm": "reference",
        "valid": true,
        "image_seconds": 0.113657333,
        "request_seconds": 4.266238667,
        "image_fraction": 0.026641109856126107
      },
      {
        "round": 3,
        "arm": "reference",
        "valid": true,
        "image_seconds": 0.118800917,
        "request_seconds": 4.278232417,
        "image_fraction": 0.02776869169798542
      },
      {
        "round": 3,
        "arm": "query",
        "valid": true,
        "image_seconds": 0.125523209,
        "request_seconds": 4.306712458,
        "image_fraction": 0.02914594606074349
      },
      {
        "round": 4,
        "arm": "query",
        "valid": true,
        "image_seconds": 0.123785583,
        "request_seconds": 4.3397995,
        "image_fraction": 0.02852334145851669
      },
      {
        "round": 4,
        "arm": "reference",
        "valid": true,
        "image_seconds": 0.109496875,
        "request_seconds": 4.251030416,
        "image_fraction": 0.025757725606449764
      },
      {
        "round": 5,
        "arm": "reference",
        "valid": true,
        "image_seconds": 0.113585667,
        "request_seconds": 4.384471209,
        "image_fraction": 0.02590635485685088
      },
      {
        "round": 5,
        "arm": "query",
        "valid": true,
        "image_seconds": 0.129628916,
        "request_seconds": 4.259021667,
        "image_fraction": 0.030436312875418866
      },
      {
        "round": 6,
        "arm": "query",
        "valid": true,
        "image_seconds": 0.128319875,
        "request_seconds": 4.318856917,
        "image_fraction": 0.029711536516735224
      },
      {
        "round": 6,
        "arm": "reference",
        "valid": true,
        "image_seconds": 0.109040083,
        "request_seconds": 4.261176583,
        "image_fraction": 0.02558919605327231
      },
      {
        "round": 7,
        "arm": "reference",
        "valid": true,
        "image_seconds": 0.114389416,
        "request_seconds": 4.221458041,
        "image_fraction": 0.027097134423466368
      },
      {
        "round": 7,
        "arm": "query",
        "valid": true,
        "image_seconds": 0.1298875,
        "request_seconds": 4.261989583,
        "image_fraction": 0.030475790114102674
      }
    ]
  },
  {
    "source": "/Users/carlos/Projects/slotstream/.build/optimization/vision-query-1024-serving-v132/results.jsonl",
    "sha256": "f73a8d312bc261db44ca15ea9feb27a58d28c00fc5a9ae4379d88305cd9d8ddc",
    "cells": [
      {
        "round": 1,
        "arm": "reference",
        "valid": true,
        "image_seconds": 0.66436525,
        "request_seconds": 15.44714075,
        "image_fraction": 0.043008946493868126
      },
      {
        "round": 1,
        "arm": "query",
        "valid": true,
        "image_seconds": 0.732817625,
        "request_seconds": 13.737036542,
        "image_fraction": 0.05334612183344369
      },
      {
        "round": 2,
        "arm": "query",
        "valid": false,
        "image_seconds": 0.727382917,
        "request_seconds": 14.371818875,
        "image_fraction": 0.05061175090825099
      },
      {
        "round": 2,
        "arm": "reference",
        "valid": false,
        "image_seconds": 0.684415834,
        "request_seconds": 15.373086709,
        "image_fraction": 0.044520391184635445
      },
      {
        "round": 3,
        "arm": "reference",
        "valid": true,
        "image_seconds": 0.663170875,
        "request_seconds": 14.817526792,
        "image_fraction": 0.04475584112714726
      },
      {
        "round": 3,
        "arm": "query",
        "valid": false,
        "image_seconds": 0.7306565,
        "request_seconds": 13.68758875,
        "image_fraction": 0.053380950680593765
      },
      {
        "round": 4,
        "arm": "query",
        "valid": true,
        "image_seconds": 0.732662833,
        "request_seconds": 13.827388708,
        "image_fraction": 0.05298634821599462
      },
      {
        "round": 4,
        "arm": "reference",
        "valid": false,
        "image_seconds": 0.666399333,
        "request_seconds": 15.000487834,
        "image_fraction": 0.044425177392534126
      }
    ]
  }
]

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/remaining-qualification-preparation-v180/ngram-cache-protocol-draft.json` — 1451 bytes, SHA-256 `549e00c5e77896dee35729a35523ab01d7e2d8a33263d67eae8ccab55e09b41c`.

````text
{
  "classification": "Real full-cache PLE component; no language-model layers or serving benefit claim",
  "binary": "FINAL_BINARY_REQUIRED",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "arms": [
    "reference",
    "compact",
    "reference-ring",
    "compact-ring"
  ],
  "rounds": 7,
  "minimum_clean_pairs": 5,
  "replacement_cells": 0,
  "fill_tokens": 32768,
  "tile_tokens": 256,
  "eviction_tokens": 4096,
  "warm_calls": 128,
  "initial_quiet_seconds": 180,
  "between_cells_seconds": 60,
  "cell_timeout_seconds": 300,
  "whole_study_timeout_seconds": 5400,
  "preflight_reclaimable_gb": 12,
  "maximum_physical_bytes": 5000000000,
  "minimum_payload_savings_bytes": 100000000,
  "minimum_physical_filled_savings_bytes": 80000000,
  "minimum_physical_growth_savings_bytes": 80000000,
  "maximum_median_time_regression": 0.05,
  "minimum_ring_eviction_reduction": 0.05,
  "minimum_positive_fraction": 0.8,
  "maximum_ring_physical_growth_bytes": 16000000,
  "vm_or_power_exclusions": "Exclude the whole pair; retain all seven fixed rounds without replacement. Native errors or memory ceiling violations stop the study.",
  "native_prerequisites": "UNBOUND: final ngram exact state/row/EOS/eviction and cache-bookkeeping checks",
  "later_gates": "Compact storage requires ordinary serving nonregression; a ring benefit requires same-control serving guard. No automatic activation follows this component."
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/remaining-qualification-preparation-v180/ngram_cache_probe_test.py.txt` — 807 bytes, SHA-256 `c55702a64edab82ade6f77ff92dec01ca7adc3fbe4ea36e7c03360466b1a5ae6`.

````text
test_changed_outputs_or_work_cannot_be_a_speedup (ngram_cache_probe_test.NgramCacheProbeTests) ... ok
test_complete_identical_work_can_qualify_separate_resource_and_queue_claims (ngram_cache_probe_test.NgramCacheProbeTests) ... ok
test_incomplete_or_excluded_work_cannot_be_replaced (ngram_cache_probe_test.NgramCacheProbeTests) ... ok
test_native_prerequisites_are_exact_same_build_non_skipped_reports (ngram_cache_probe_test.NgramCacheProbeTests) ... ok
test_native_report_requires_real_eviction_payload_bounds_and_complete_hashes (ngram_cache_probe_test.NgramCacheProbeTests) ... ok
test_payload_halving_does_not_substitute_for_measured_physical_saving (ngram_cache_probe_test.NgramCacheProbeTests) ... ok

----------------------------------------------------------------------
Ran 6 tests in 0.005s

OK

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/remaining-qualification-preparation-v180/prefill_bench_test.py.txt` — 5118 bytes, SHA-256 `cbc365b4deeeafbf2bc8da3884aa7cc1d12261e04c4f0522b5c19664659823c7`.

````text
test_all_hit_label_requires_zero_prefill_and_decode_reads (prefill_bench_test.HarnessTests) ... ok
test_combined_warmup_checkpoint_counts_are_explicit_and_bounded (prefill_bench_test.HarnessTests) ... ok
test_comparison_excludes_whole_pair (prefill_bench_test.HarnessTests) ... ok
test_complete_hit_can_require_a_separately_stored_partial_checkpoint (prefill_bench_test.HarnessTests) ... ok
test_complete_prompt_requires_explicit_permission_exact_identity_and_zero_prefill (prefill_bench_test.HarnessTests) ... ok
test_complete_prompt_study_requires_warmup_logit_storage (prefill_bench_test.HarnessTests) ... ok
test_contention_guard_identifies_jobs_without_persisting_arguments (prefill_bench_test.HarnessTests) ... ok
test_cooldown_is_explicit_bounded_and_finite (prefill_bench_test.HarnessTests) ... ok
test_cross_build_identity_checks_the_selected_executable (prefill_bench_test.HarnessTests) ... ok
test_declared_cooldown_holds_and_releases_the_model_reservation (prefill_bench_test.HarnessTests) ... ok
test_declared_resource_limits_fail_closed (prefill_bench_test.HarnessTests) ... ok
test_explicit_frozen_binary_digest_cannot_silently_change (prefill_bench_test.HarnessTests) ... ok
test_explicit_pool_study_is_bounded_and_distinct_from_target_planning (prefill_bench_test.HarnessTests) ... ok
test_first_job_gate_rejects_invalid_or_ambiguous_contract (prefill_bench_test.HarnessTests) ... ok
test_first_job_gate_uses_clean_exact_warmups_and_declared_limit (prefill_bench_test.HarnessTests) ... ok
test_frozen_acceptance_rejects_insufficient_or_unequal_work (prefill_bench_test.HarnessTests) ... ok
test_image_preparation_peak_is_part_of_resource_gate (prefill_bench_test.HarnessTests) ... ok
test_image_study_pins_inline_bytes_order_and_bounds (prefill_bench_test.HarnessTests) ... ok
test_initial_quiet_interval_resets_and_times_out_before_launch (prefill_bench_test.HarnessTests) ... ok
test_interrupted_serving_cell_stops_child_and_preserves_incomplete_result (prefill_bench_test.HarnessTests) ... ok
test_large_pool_measurements_require_explicit_bounds_and_six_gb_headroom (prefill_bench_test.HarnessTests) ... ok
test_large_scope_study_keeps_explicit_memory_compute_and_abort_bounds (prefill_bench_test.HarnessTests) ... ok
test_large_vision_admission_reaches_request_serialization (prefill_bench_test.HarnessTests) ... ok
test_larger_vision_study_preserves_explicit_capacity_and_resource_guards (prefill_bench_test.HarnessTests) ... ok
test_long_context_gate_requires_completion_and_exact_observed_work (prefill_bench_test.HarnessTests) ... ok
test_memory_gate_includes_first_image_preparation (prefill_bench_test.HarnessTests) ... ok
test_memory_gate_uses_bytes_and_rejects_missing_samples_or_swap (prefill_bench_test.HarnessTests) ... ok
test_memory_settling_waits_only_for_verified_headroom_and_has_a_deadline (prefill_bench_test.HarnessTests) ... ok
test_metrics_fail_closed (prefill_bench_test.HarnessTests) ... ok
test_missing_memory_fields_fail_closed (prefill_bench_test.HarnessTests) ... ok
test_ngram_storage_requires_bounded_payload_and_identical_cache_work (prefill_bench_test.HarnessTests) ... ok
test_non_regression_is_separate_from_existing_gain_contracts (prefill_bench_test.HarnessTests) ... ok
test_partial_prefix_requires_real_different_tail_and_no_full_hit (prefill_bench_test.HarnessTests) ... ok
test_prefix_study_requires_observed_committed_fork_and_exact_workload (prefill_bench_test.HarnessTests) ... ok
test_prospective_work_constraints_refuse_inactive_or_missing_mechanisms (prefill_bench_test.HarnessTests) ... ok
test_reclaimable_uses_real_page_size_and_file_backed (prefill_bench_test.HarnessTests) ... ok
test_resident_overlap_requires_a_completed_join_for_every_submission (prefill_bench_test.HarnessTests) ... ok
test_resource_acceptance_requires_real_active_savings_in_every_clean_pair (prefill_bench_test.HarnessTests) ... ok
test_resource_savings_require_real_measurements_in_every_valid_pair (prefill_bench_test.HarnessTests) ... ok
test_rope_and_terminal_work_constraints_require_actual_mechanism (prefill_bench_test.HarnessTests) ... ok
test_sampled_serving_freezes_typed_shared_parameters (prefill_bench_test.HarnessTests) ... ok
test_serving_arm_schema_refuses_delivery_errors_before_launch (prefill_bench_test.HarnessTests) ... ok
test_serving_summary_keeps_client_and_generator_metrics_separate (prefill_bench_test.HarnessTests) ... ok
test_serving_workload_uses_explicit_template_and_seed (prefill_bench_test.HarnessTests) ... ok
test_startup_amortization_preserves_first_job_and_pair_exclusions (prefill_bench_test.HarnessTests) ... ok
test_startup_amortization_requires_finite_complete_measurements_and_saving (prefill_bench_test.HarnessTests) ... ok
test_unique_retention_observation_must_reuse_no_tokens (prefill_bench_test.HarnessTests) ... ok
test_unique_retention_study_requires_distinct_frozen_warmup (prefill_bench_test.HarnessTests) ... ok
test_whole_request_peak_includes_preparation_without_double_counting (prefill_bench_test.HarnessTests) ... ok

----------------------------------------------------------------------
Ran 49 tests in 0.018s

OK

````

Artifact `/tmp/slotstream-optimization-execution/remaining-serving-drafts-v179/image-duplicate-two.json` — 9124 bytes, SHA-256 `8e1f59a175c69aa82ea5326a5ad9155d3e464bb5e83b50bfef39693d526bcf98`.

````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "FINAL_BINARY_REQUIRED",
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
      "binary": "FINAL_BINARY_REQUIRED",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    },
    "candidate": {
      "binary": "FINAL_BINARY_REQUIRED",
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
        "SLOTSTREAM_OPT_IMAGE_REUSE": "1",
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
    }
  },
  "label": "image-duplicate-two-draft-v179",
  "classification": "UNRUN DRAFT: bind final binary/source and native prerequisites before freezing",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/prompt.txt",
  "fixture_sha256": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
  "max_tokens": 1,
  "minimum_output_tokens": 1,
  "conditions": "New isolated comparison on the shared qualified base, with only the named candidate control changed. Prefix retention disabled; native10GB target, no explicit pool override, all controls explicit,16 fixed alternating fresh-process pairs, min5 clean, no replacements, 180s initial quiet/60s between cells, exact token IDs and wire text. Same-binary native prerequisites and source binding are mandatory before freezing. Record first-job acceptance separately (min5 clean/at most5percent regression); failed startup evidence cannot inherit a warmed pass. No historical measurements are pooled. Original vision attention in both arms. The same encoded512-square red image appears 2 time(s); two copies must produce2 versus1 real encodes and0 versus1 feature reuses, while one copy encodes exactly once in both arms. Preparation time and whole-request footprint remain included. No cross-request image-feature cache exists; repeated exact prompts are already covered by complete-prompt reuse.",
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
  "candidate_prerequisites_pending": [
    "Final source request-local exact-byte image identity, preparation/tower geometry and reuse lifecycle checks",
    "Known-content serving with two identical512red images and unrelated/mutated image refusals",
    "Shared final plain/MTP native and image-preparation ownership checks"
  ],
  "abort_on_resource_failure": true,
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "decodeModelTokens",
    "decodeForwardPasses",
    "draftedTokens",
    "verifyPasses",
    "prefillRecords",
    "decodeRecords"
  ],
  "think": false,
  "images": [
    {
      "path": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-512.png",
      "sha256": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed"
    },
    {
      "path": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-512.png",
      "sha256": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed"
    }
  ],
  "work_constraints": {
    "reference": {
      "encodedImages": {
        "min": 2,
        "max": 2
      },
      "reusedImageFeatures": {
        "min": 0,
        "max": 0
      },
      "prefixSkippedImages": {
        "min": 0,
        "max": 0
      },
      "visionQueryTile": {
        "min": 0,
        "max": 0
      },
      "visionQueryTileCalls": {
        "min": 0,
        "max": 0
      }
    },
    "candidate": {
      "encodedImages": {
        "min": 1,
        "max": 1
      },
      "reusedImageFeatures": {
        "min": 1,
        "max": 1
      },
      "prefixSkippedImages": {
        "min": 0,
        "max": 0
      },
      "visionQueryTile": {
        "min": 0,
        "max": 0
      },
      "visionQueryTileCalls": {
        "min": 0,
        "max": 0
      }
    }
  }
}

````

Artifact `/tmp/slotstream-optimization-execution/remaining-serving-drafts-v179/image-reuse-unique-guard.json` — 8934 bytes, SHA-256 `e90a7599b4ef8cd2ba9f2cbcf36ada187d39aa320901460b86b922ef0d91852c`.

````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "FINAL_BINARY_REQUIRED",
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
      "binary": "FINAL_BINARY_REQUIRED",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    },
    "candidate": {
      "binary": "FINAL_BINARY_REQUIRED",
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
        "SLOTSTREAM_OPT_IMAGE_REUSE": "1",
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
    }
  },
  "label": "image-reuse-unique-guard-draft-v179",
  "classification": "UNRUN DRAFT: bind final binary/source and native prerequisites before freezing",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/prompt.txt",
  "fixture_sha256": "ea487dbfa3274ba2ed440cc62cd740d05c8219de8b4588856d8f16413d1bbd09",
  "max_tokens": 1,
  "minimum_output_tokens": 1,
  "conditions": "New isolated comparison on the shared qualified base, with only the named candidate control changed. Prefix retention disabled; native10GB target, no explicit pool override, all controls explicit,16 fixed alternating fresh-process pairs, min5 clean, no replacements, 180s initial quiet/60s between cells, exact token IDs and wire text. Same-binary native prerequisites and source binding are mandatory before freezing. Record first-job acceptance separately (min5 clean/at most5percent regression); failed startup evidence cannot inherit a warmed pass. No historical measurements are pooled. Original vision attention in both arms. The same encoded512-square red image appears 1 time(s); two copies must produce2 versus1 real encodes and0 versus1 feature reuses, while one copy encodes exactly once in both arms. Preparation time and whole-request footprint remain included. No cross-request image-feature cache exists; repeated exact prompts are already covered by complete-prompt reuse.",
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
  "candidate_prerequisites_pending": [
    "Final source request-local exact-byte image identity, preparation/tower geometry and reuse lifecycle checks",
    "Known-content serving with two identical512red images and unrelated/mutated image refusals",
    "Shared final plain/MTP native and image-preparation ownership checks"
  ],
  "abort_on_resource_failure": true,
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "decodeModelTokens",
    "decodeForwardPasses",
    "draftedTokens",
    "verifyPasses",
    "prefillRecords",
    "decodeRecords"
  ],
  "think": false,
  "images": [
    {
      "path": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/vision/red-512.png",
      "sha256": "5eafcdbe57b88e9c12ef8ac4cc3eee45f9c3433b7f929d867e5dd4d7832a8aed"
    }
  ],
  "work_constraints": {
    "reference": {
      "encodedImages": {
        "min": 1,
        "max": 1
      },
      "reusedImageFeatures": {
        "min": 0,
        "max": 0
      },
      "prefixSkippedImages": {
        "min": 0,
        "max": 0
      },
      "visionQueryTile": {
        "min": 0,
        "max": 0
      },
      "visionQueryTileCalls": {
        "min": 0,
        "max": 0
      }
    },
    "candidate": {
      "encodedImages": {
        "min": 1,
        "max": 1
      },
      "reusedImageFeatures": {
        "min": 0,
        "max": 0
      },
      "prefixSkippedImages": {
        "min": 0,
        "max": 0
      },
      "visionQueryTile": {
        "min": 0,
        "max": 0
      },
      "visionQueryTileCalls": {
        "min": 0,
        "max": 0
      }
    }
  }
}

````

Artifact `/tmp/slotstream-optimization-execution/remaining-serving-drafts-v179/mtp-bounded-tail-sampled.json` — 7921 bytes, SHA-256 `94c0cf303cba1c6289a835556696e91bbdd6f0c27f636ce3bcf73c95adef9a1d`.

````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "FINAL_BINARY_REQUIRED",
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
      "binary": "FINAL_BINARY_REQUIRED",
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
      "binary": "FINAL_BINARY_REQUIRED",
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
  "label": "mtp-bounded-tail-sampled-draft-v179",
  "classification": "UNRUN DRAFT: bind final binary/source and native prerequisites before freezing",
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
  "candidate_prerequisites_pending": [
    "Final same-binary mtp-work-integrated greedy and seeded sampling at depths1/3 and limits1/2/5",
    "Corrected cancellation, EOS, pending-token/checkpoint and continued-state MTP gates",
    "Shared final plain/MTP combined native passes"
  ],
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

Artifact `/tmp/slotstream-optimization-execution/remaining-serving-drafts-v179/mtp-bounded-tail-two.json` — 8287 bytes, SHA-256 `393d285dd685c5bb2b84beff66ef94d508783e9d0c515e5b9387d711919ebad9`.

````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "FINAL_BINARY_REQUIRED",
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
      "binary": "FINAL_BINARY_REQUIRED",
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
      "binary": "FINAL_BINARY_REQUIRED",
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
  "label": "mtp-bounded-tail-two-draft-v179",
  "classification": "UNRUN DRAFT: bind final binary/source and native prerequisites before freezing",
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
  "candidate_prerequisites_pending": [
    "Final same-binary mtp-work-integrated greedy and seeded sampling at depths1/3 and limits1/2/5",
    "Corrected cancellation, EOS, pending-token/checkpoint and continued-state MTP gates",
    "Shared final plain/MTP combined native passes"
  ],
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

Artifact `/tmp/slotstream-optimization-execution/remaining-serving-drafts-v179/ngram-compact-serving.json` — 8277 bytes, SHA-256 `05ee43f9cdaf9e8ec2a184aff90a2710bab6a30e39086da81eb2ae731eb14ccb`.

````text
{
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "binary": "FINAL_BINARY_REQUIRED",
  "memory_gb": 10,
  "mtp": "off",
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
      "binary": "FINAL_BINARY_REQUIRED",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    },
    "candidate": {
      "binary": "FINAL_BINARY_REQUIRED",
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
        "SLOTSTREAM_OPT_NGRAM_ROWS": "1",
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
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      }
    }
  },
  "label": "ngram-compact-serving-draft-v179",
  "classification": "UNRUN DRAFT: bind final binary/source and native prerequisites before freezing",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
  "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "conditions": "New isolated comparison on the shared qualified base, with only the named candidate control changed. Prefix retention disabled; native10GB target, no explicit pool override, all controls explicit,16 fixed alternating fresh-process pairs, min5 clean, no replacements, 180s initial quiet/60s between cells, exact token IDs and wire text. Same-binary native prerequisites and source binding are mandatory before freezing. Record first-job acceptance separately (min5 clean/at most5percent regression); failed startup evidence cannot inherit a warmed pass. No historical measurements are pooled. This short ordinary prefill is a serving nonregression guard; it cannot qualify full-cache physical saving. Prospective full-cache component evidence supplies the resource benefit. Compact payload counts exclude object overhead; no arithmetic physical-memory claim is permitted.",
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
  "candidate_prerequisites_pending": [
    "Final same-source ngram state/row/eviction/EOS/recovery checks",
    "Full-cache owned memory and warm lookup/eviction component qualification, including object overhead",
    "Candidate payload exactly half at identical cached row counts; cache capacity unchanged",
    "Combined MTP/context correction and native checks"
  ],
  "abort_on_resource_failure": true,
  "required_equal_work": [
    "prefillTokens",
    "decodeTokens",
    "decodeModelTokens",
    "decodeForwardPasses",
    "draftedTokens",
    "verifyPasses",
    "prefillRecords",
    "decodeRecords",
    "ngramCachedRows",
    "ngramRowHits",
    "ngramRowMisses"
  ],
  "work_constraints": {
    "reference": {
      "ngramCachedRows": {
        "min": 1,
        "max": 400000
      },
      "ngramCachePayloadBytes": {
        "min": 640,
        "max": 256000000
      }
    },
    "candidate": {
      "ngramCachedRows": {
        "min": 1,
        "max": 400000
      },
      "ngramCachePayloadBytes": {
        "min": 320,
        "max": 128000000
      }
    }
  }
}

````

