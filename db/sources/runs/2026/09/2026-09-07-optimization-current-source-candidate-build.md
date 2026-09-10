---
type: run
id: 01m1xevpmj155nd1t26vx7eszt
created: 2026-09-07T08:13:23.473919+00:00
updated: 2026-09-07T08:13:23.895481+00:00
summary: Current combined source builds with exact shared-state restoration
binary: V273 cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6; see exact per-run bindings
captured_at: 2026-09-07
command: Exact commands, prospective protocols and tool hashes embedded below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Current combined source builds with exact shared-state restoration
tool: python3
---
# Current combined source builds with exact shared-state restoration

V273 successfully builds the same150-input current-source candidate after a fresh natural readiness observation. V271 remains a failed and restored earlier attempt. The candidate binary is cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6; source archive fafa905e659896e708b78dfd2065f98d50d7608dee774d835f589cc820c5240a; Metal198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597. The250.176908666second complete lease passes the unchanged serial resource guard and exact shared source/release/build-state restoration. Minimum sampled reclaimable is7684784128bytes and maximum sampled owned RSS1411203072bytes. The source combines the unchanged planner family, selected automatic defaults and current device-observer extraction, plus the current context-test Makefile target. Shared defaults remain off. Compilation establishes an executable candidate, not integrated model, performance, physical capacity or default adoption.

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/build.txt

SHA-256 `436d1117c1849c02ecd497814fbffb0281f73687916e6d0512d51d02b11a5cf3`; 12658 bytes.

````text
python3 Tools/build_identity.py before .build/release
swift build -c release -j 1
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[0/1] Planning build
[1/1] Compiling plugin GenerateManual
[2/2] Compiling plugin GenerateDoccReference
[3/3] Compiling plugin CudaBuild
Building for production...
[3/10] Write swift-version--1AB21518FC5DEDBE.txt
[4/10] Write sources
[7/11] Compiling RealModule AlgebraicField.swift
[8/12] Compiling InternalCollectionsUtilities Debugging.swift
[9/13] Compiling EventSource AsyncEventsSequence.swift
[10/14] Compiling OrderedCollections _HashTable+Bucket.swift
[11/15] Compiling Crypto AES-GCM.swift
[12/16] Compiling Jinja AST.swift
[13/17] Compiling HuggingFace AccessRequest.swift
[14/18] Compiling ComplexModule Complex+AdditiveArithmetic.swift
[15/19] Compiling Hub BinaryDistinct.swift
[16/20] Compiling Numerics Numerics.swift
[17/21] Compiling Tokenizers BPETokenizer.swift
[18/22] Compiling MLX ArrayAt.swift
[19/23] Compiling Generation Decoders.swift
[20/24] Compiling MLXNN Activations.swift
[21/25] Compiling Models LanguageModel.swift
[22/26] Compiling MLXFast MLXFast.swift
[23/27] Compiling ArgumentParserToolInfo ToolInfo.swift
[24/28] Compiling Slotstream AdaptiveSpeculation.swift
/Users/carlos/Projects/slotstream/Sources/Slotstream/EmbeddingRows.swift:107:36: warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
105 |             data.withUnsafeMutableBytes { output in
106 |                 for (i, id) in ids.enumerated() {
107 |                     available[id]!.withUnsafeBytes { row in
    |                                    `- warning: result of call to 'withUnsafeBytes' is unused [#no-usage]
108 |                         memcpy(output.baseAddress! + i * stride, row.baseAddress! + offsets[p], stride)
109 |                     }

/Users/carlos/Projects/slotstream/Sources/Slotstream/RouterTrace.swift:36:13: warning: variable 'header' was never mutated; consider changing to 'let' constant
34 |         lock.lock()
35 |         defer { lock.unlock() }
36 |         var header = [Int32(layer), Int32(tokens), Int32(topK)]
   |             `- warning: variable 'header' was never mutated; consider changing to 'let' constant
37 |         header.withUnsafeBytes { buffer.append(contentsOf: $0) }
38 |         var small = [Int16](repeating: 0, count: ids.count)
[25/29] Compiling ArgumentParser BashCompletionsGenerator.swift
[26/30] Compiling SlotstreamDiagnostics CheckReport.swift
/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift:270:20: warning: instance method 'wait' is unavailable from asynchronous contexts; Await a Task handle instead; this is an error in the Swift 6 language mode
268 |         }
269 |         defer { release.signal() }
270 |         guard held.wait(timeout: .now() + 5) == .success else { throw ModelError("queue holder did not start") }
    |                    `- warning: instance method 'wait' is unavailable from asynchronous contexts; Await a Task handle instead; this is an error in the Swift 6 language mode
271 |         var queueChecks: UInt64 = 0
272 |         let queueConfig = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 1)

Dispatch.DispatchSemaphore.wait:2:13: note: 'wait(timeout:)' declared here
1 | class DispatchSemaphore {
2 | public func wait(timeout: DispatchTime) -> DispatchTimeoutResult}
  |             `- note: 'wait(timeout:)' declared here
3 | 

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift:286:21: warning: instance method 'wait' is unavailable from asynchronous contexts; Await a Task handle instead; this is an error in the Swift 6 language mode
284 |         }
285 |         release.signal()
286 |         guard ended.wait(timeout: .now() + 5) == .success else { throw ModelError("queue holder did not finish") }
    |                     `- warning: instance method 'wait' is unavailable from asynchronous contexts; Await a Task handle instead; this is an error in the Swift 6 language mode
287 |         // Checked legacy mutation cannot enlarge an already allocated engine.
288 |         engine.maxContextTokens = ContextPolicy.modelLimit

Dispatch.DispatchSemaphore.wait:2:13: note: 'wait(timeout:)' declared here
1 | class DispatchSemaphore {
2 | public func wait(timeout: DispatchTime) -> DispatchTimeoutResult}
  |             `- note: 'wait(timeout:)' declared here
3 | 

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift:35:38: warning: capture of 'server' with non-Sendable type 'Server' in a '@Sendable' closure [#SendableClosureCaptures]
 33 |             }
 34 |             let finished = DispatchSemaphore(value: 0)
 35 |             Thread.detachNewThread { server.handle(peer); finished.signal() }
    |                                      `- warning: capture of 'server' with non-Sendable type 'Server' in a '@Sendable' closure [#SendableClosureCaptures]
 36 |             defer { shutdown(client,SHUT_RDWR); close(client) }
 37 |             let method = object == nil ? "GET" : "POST"

/Users/carlos/Projects/slotstream/Sources/Slotstream/Server.swift:14:20: note: class 'Server' does not conform to the 'Sendable' protocol
  12 | }
  13 | 
  14 | public final class Server {
     |                    `- note: class 'Server' does not conform to the 'Sendable' protocol
  15 |     /// Explicit opt-in for local benchmark processes. Ordinary wire responses
  16 |     /// retain their existing schema and do not run the footprint sampler.

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift:4:1: warning: add '@preconcurrency' to suppress 'Sendable'-related warnings from module 'Slotstream'
  2 | import Foundation
  3 | import MLX
  4 | import Slotstream
    | `- warning: add '@preconcurrency' to suppress 'Sendable'-related warnings from module 'Slotstream'
  5 | 
  6 | extension Diagnostics {

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift:266:13: warning: capture of 'engine' with non-Sendable type 'Engine' in a '@Sendable' closure [#SendableClosureCaptures]
264 |         let held = DispatchSemaphore(value: 0), release = DispatchSemaphore(value: 0), ended = DispatchSemaphore(value: 0)
265 |         Thread.detachNewThread {
266 |             engine.withExclusive { held.signal(); release.wait() }
    |             `- warning: capture of 'engine' with non-Sendable type 'Engine' in a '@Sendable' closure [#SendableClosureCaptures]
267 |             ended.signal()
268 |         }

/Users/carlos/Projects/slotstream/Sources/Slotstream/Engine.swift:83:20: note: class 'Engine' does not conform to the 'Sendable' protocol
  81 | }
  82 | 
  83 | public final class Engine {
     |                    `- note: class 'Engine' does not conform to the 'Sendable' protocol
  84 |     public let modelDir: URL
  85 |     public let model: Qwen4ExpModel

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift:30:38: warning: capture of 'server' with non-Sendable type 'Server' in a '@Sendable' closure [#SendableClosureCaptures]
 28 |             }
 29 |             let finished = DispatchSemaphore(value: 0)
 30 |             Thread.detachNewThread { server.handle(peer); finished.signal() }
    |                                      `- warning: capture of 'server' with non-Sendable type 'Server' in a '@Sendable' closure [#SendableClosureCaptures]
 31 |             defer { shutdown(client,SHUT_RDWR); close(client) }
 32 |             let method = object == nil ? "GET" : "POST"

/Users/carlos/Projects/slotstream/Sources/Slotstream/Server.swift:14:20: note: class 'Server' does not conform to the 'Sendable' protocol
  12 | }
  13 | 
  14 | public final class Server {
     |                    `- note: class 'Server' does not conform to the 'Sendable' protocol
  15 |     /// Explicit opt-in for local benchmark processes. Ordinary wire responses
  16 |     /// retain their existing schema and do not run the footprint sampler.

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift:4:1: warning: add '@preconcurrency' to suppress 'Sendable'-related warnings from module 'Slotstream'
  2 | import Foundation
  3 | import MLX
  4 | import Slotstream
    | `- warning: add '@preconcurrency' to suppress 'Sendable'-related warnings from module 'Slotstream'
  5 | 
  6 | extension Diagnostics {

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift:8:18: warning: weak variable 'observedOwner' was never mutated; consider changing to 'let' constant [#WeakMutability]
 6 |         var c = CheckBuilder("optimization-read-handle-lifetime")
 7 |         var owner: CheckpointIndex? = try CheckpointIndex(dir: modelDir)
 8 |         weak var observedOwner = owner
   |                  `- warning: weak variable 'observedOwner' was never mutated; consider changing to 'let' constant [#WeakMutability]
 9 |         let ref = owner!.ref("model.layers.0.mlp.switch_mlp.gate_proj.weight")
10 |         var handle: TensorReadHandle? = owner!.readHandle(for: ref)

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift:110:21: warning: will never be executed
107 |             logits.append(last); traces.append(routes)
108 |         }
109 |         if terminalPrefill {
    |            `- note: condition always evaluates to false
110 |             c.equal("all undemanded terminal queries skipped", model.terminalQueryRowsSkipped,
    |                     `- warning: will never be executed
111 |                 terminalQuery ? tokens - min(64, (tokens - 1) % 256 + 1) : tokens - ((tokens - 1) % 256 + 1))
112 |             c.equal("all unused terminal MoE rows skipped", model.terminalMoERowsSkipped, tokens - 1)

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift:117:22: warning: will never be executed
114 |                 Array((traces[0][model.runLayers - 1] ?? []).suffix(model.cfg.topK)))
115 |         }
116 |         if selectedAttention {
    |            `- note: condition always evaluates to false
117 |             c.expect("selected attention actually executed", model.selectedAttentionTiles > 0)
    |                      `- warning: will never be executed
118 |             c.measure("selected_attention_tiles", Double(model.selectedAttentionTiles))
119 |         }

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift:184:29: warning: will never be executed
182 |         c.measure("routing.control", controlRoutes); c.measure("routing.candidate", candidateRoutes)
183 |         c.expect("route keep sets inside existing rechunk band", candidateRoutes <= max(3 * controlRoutes, 0.01))
184 |         if scoped { c.equal("exact ordered router traces", traces[2], traces[0]) }
    |            |                `- warning: will never be executed
    |            `- note: condition always evaluates to false
185 |         if terminalPrefill {
186 |             c.equal("all state-producing layers retain ordered routes", traces[2].filter { $0.key != model.runLayers - 1 },

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextSmallPass.swift:186:21: warning: will never be executed
183 |         c.expect("route keep sets inside existing rechunk band", candidateRoutes <= max(3 * controlRoutes, 0.01))
184 |         if scoped { c.equal("exact ordered router traces", traces[2], traces[0]) }
185 |         if terminalPrefill {
    |            `- note: condition always evaluates to false
186 |             c.equal("all state-producing layers retain ordered routes", traces[2].filter { $0.key != model.runLayers - 1 },
    |                     `- warning: will never be executed
187 |                 traces[0].filter { $0.key != model.runLayers - 1 })
188 |         }

[#SendableClosureCaptures]: <https://docs.swift.org/compiler/documentation/diagnostics/sendable-closure-captures>
[#WeakMutability]: <https://docs.swift.org/compiler/documentation/diagnostics/weak-mutability>
[27/31] Compiling slotstream_cli CheckRendering.swift
[28/32] Compiling SlotstreamTestKit Catalogue.swift
[28/32] Write Objects.LinkFileList
[30/33] Compiling slotstream_checks main.swift
[30/33] Linking slotstream
[31/33] Write Objects.LinkFileList
[32/33] Linking slotstream-checks
Build complete! (247.16s)
cp Tools/lib/mlx-0.31.1.metallib .build/release/mlx.metallib
python3 Tools/build_identity.py after .build/release
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/build-identity.json

SHA-256 `837712feb4d54548b368e2aa7671867df2b018cc671f62d3e82c783d4ca1a17c`; 18603 bytes.

````text
{
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
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
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
  "source_archive_sha256": "fafa905e659896e708b78dfd2065f98d50d7608dee774d835f589cc820c5240a",
  "binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/live-memory.json

SHA-256 `aac8aa6c537dd93515b29ef04cad9b4f402e518dafe9c9d671708bbb80a1c9eb`; 224556 bytes.

````text
{
  "command": [
    "make",
    "build",
    "SLOTSTREAM_BUILD_JOBS=1"
  ],
  "policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1200,
    "compiler_jobs": 1,
    "stop_on_new_swapouts": true
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 14485307392,
    "swapins": 44112839,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   223771.\nPages active:                                 686296.\nPages inactive:                               793136.\nPages speculative:                            238653.\nPages throttled:                                   0.\nPages wired down:                             248838.\nPages purgeable:                               31573.\n\"Translation faults\":                    15444441865.\nPages copy-on-write:                       737126704.\nPages zero filled:                       21236308106.\nPages reactivated:                        3471598452.\nPages purged:                               72277377.\nFile-backed pages:                            628769.\nAnonymous pages:                             1089316.\nPages stored in compressor:                  2092403.\nPages occupied by compressor:                 893955.\nDecompressions:                           1172530072.\nCompressions:                             1487781276.\nPageins:                                  7622561022.\nPageouts:                                   11084510.\nSwapins:                                    44112839.\nSwapouts:                                   77525566.\nPages tagged:                                 183669.\nPages tagged resident:                        135101.\nPages tagged compressed:                       48568.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8477.\nPages tag-storage free:                         1020.\nPages tag-storage non-tag pageable:            88799.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7214464.\nTagged compressions:                        11282230.\nTagged decompressions:                      10401628.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.0026958750000000142,
      "owned_rss_bytes": 6602752,
      "owned_process_count": 1,
      "reclaimable_bytes": 14472642560,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.24492187499999996,
      "owned_rss_bytes": 24330240,
      "owned_process_count": 3,
      "reclaimable_bytes": 14468300800,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.4926507499999999,
      "owned_rss_bytes": 50479104,
      "owned_process_count": 3,
      "reclaimable_bytes": 14155612160,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.745086417,
      "owned_rss_bytes": 68599808,
      "owned_process_count": 2,
      "reclaimable_bytes": 14180401152,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 0.9909833749999999,
      "owned_rss_bytes": 71024640,
      "owned_process_count": 2,
      "reclaimable_bytes": 14162198528,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.234293167,
      "owned_rss_bytes": 71335936,
      "owned_process_count": 2,
      "reclaimable_bytes": 14228013056,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.4819012079999998,
      "owned_rss_bytes": 73613312,
      "owned_process_count": 2,
      "reclaimable_bytes": 14245298176,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.731285875,
      "owned_rss_bytes": 95076352,
      "owned_process_count": 3,
      "reclaimable_bytes": 14180139008,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 1.9782051669999998,
      "owned_rss_bytes": 95109120,
      "owned_process_count": 2,
      "reclaimable_bytes": 14144667648,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.2299746249999997,
      "owned_rss_bytes": 95109120,
      "owned_process_count": 2,
      "reclaimable_bytes": 14142816256,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.4714864170000004,
      "owned_rss_bytes": 95125504,
      "owned_process_count": 2,
      "reclaimable_bytes": 14412890112,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.7163608750000003,
      "owned_rss_bytes": 107282432,
      "owned_process_count": 2,
      "reclaimable_bytes": 14393737216,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 2.965854042,
      "owned_rss_bytes": 172457984,
      "owned_process_count": 4,
      "reclaimable_bytes": 14359461888,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.2163239169999995,
      "owned_rss_bytes": 239534080,
      "owned_process_count": 4,
      "reclaimable_bytes": 14029881344,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.4670984579999997,
      "owned_rss_bytes": 215859200,
      "owned_process_count": 4,
      "reclaimable_bytes": 14040219648,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.7136657499999997,
      "owned_rss_bytes": 248283136,
      "owned_process_count": 4,
      "reclaimable_bytes": 14020083712,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 3.957054542,
      "owned_rss_bytes": 262881280,
      "owned_process_count": 4,
      "reclaimable_bytes": 13997703168,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.195202458,
      "owned_rss_bytes": 192561152,
      "owned_process_count": 4,
      "reclaimable_bytes": 14163886080,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.435795917,
      "owned_rss_bytes": 279199744,
      "owned_process_count": 4,
      "reclaimable_bytes": 14025457664,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.685129333,
      "owned_rss_bytes": 301268992,
      "owned_process_count": 4,
      "reclaimable_bytes": 13977337856,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 4.932147208,
      "owned_rss_bytes": 307609600,
      "owned_process_count": 4,
      "reclaimable_bytes": 13963247616,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.179190375,
      "owned_rss_bytes": 205799424,
      "owned_process_count": 4,
      "reclaimable_bytes": 14022787072,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.427366666999999,
      "owned_rss_bytes": 230031360,
      "owned_process_count": 4,
      "reclaimable_bytes": 13996408832,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.679417375,
      "owned_rss_bytes": 247889920,
      "owned_process_count": 4,
      "reclaimable_bytes": 13978910720,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 5.9298839999999995,
      "owned_rss_bytes": 277037056,
      "owned_process_count": 4,
      "reclaimable_bytes": 13965787136,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.177268499999999,
      "owned_rss_bytes": 289964032,
      "owned_process_count": 4,
      "reclaimable_bytes": 13952090112,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.423788957999999,
      "owned_rss_bytes": 298631168,
      "owned_process_count": 4,
      "reclaimable_bytes": 13944782848,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.663211542,
      "owned_rss_bytes": 304349184,
      "owned_process_count": 4,
      "reclaimable_bytes": 13941489664,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 6.9157965,
      "owned_rss_bytes": 312246272,
      "owned_process_count": 4,
      "reclaimable_bytes": 13941030912,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 7.175176667,
      "owned_rss_bytes": 312803328,
      "owned_process_count": 4,
      "reclaimable_bytes": 13941833728,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 7.422834707999999,
      "owned_rss_bytes": 364429312,
      "owned_process_count": 4,
      "reclaimable_bytes": 13882458112,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 7.6712032080000006,
      "owned_rss_bytes": 223526912,
      "owned_process_count": 4,
      "reclaimable_bytes": 14008205312,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 7.911819582999999,
      "owned_rss_bytes": 293666816,
      "owned_process_count": 4,
      "reclaimable_bytes": 13971341312,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 8.165528208000001,
      "owned_rss_bytes": 172638208,
      "owned_process_count": 4,
      "reclaimable_bytes": 14023393280,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 8.414121042000001,
      "owned_rss_bytes": 268500992,
      "owned_process_count": 4,
      "reclaimable_bytes": 13970194432,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 8.667575583000001,
      "owned_rss_bytes": 283967488,
      "owned_process_count": 4,
      "reclaimable_bytes": 13967605760,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 8.911143708,
      "owned_rss_bytes": 295763968,
      "owned_process_count": 4,
      "reclaimable_bytes": 13954400256,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 9.159007,
      "owned_rss_bytes": 334053376,
      "owned_process_count": 4,
      "reclaimable_bytes": 13921910784,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 9.412336875000001,
      "owned_rss_bytes": 350388224,
      "owned_process_count": 4,
      "reclaimable_bytes": 13914357760,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 9.651718583000001,
      "owned_rss_bytes": 356696064,
      "owned_process_count": 4,
      "reclaimable_bytes": 13909983232,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 9.9030415,
      "owned_rss_bytes": 368476160,
      "owned_process_count": 4,
      "reclaimable_bytes": 13893550080,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 10.149961083,
      "owned_rss_bytes": 379011072,
      "owned_process_count": 4,
      "reclaimable_bytes": 13882441728,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 10.391038958000001,
      "owned_rss_bytes": 394248192,
      "owned_process_count": 4,
      "reclaimable_bytes": 13875265536,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 10.6401485,
      "owned_rss_bytes": 401080320,
      "owned_process_count": 4,
      "reclaimable_bytes": 13860700160,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 10.889348917000001,
      "owned_rss_bytes": 407699456,
      "owned_process_count": 4,
      "reclaimable_bytes": 13860470784,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 11.137680792000001,
      "owned_rss_bytes": 417677312,
      "owned_process_count": 4,
      "reclaimable_bytes": 13846773760,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 11.390613417,
      "owned_rss_bytes": 426164224,
      "owned_process_count": 4,
      "reclaimable_bytes": 13841629184,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 11.630432375,
      "owned_rss_bytes": 432324608,
      "owned_process_count": 4,
      "reclaimable_bytes": 13817004032,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 11.874983875,
      "owned_rss_bytes": 441040896,
      "owned_process_count": 4,
      "reclaimable_bytes": 13806911488,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 12.117189625,
      "owned_rss_bytes": 444989440,
      "owned_process_count": 4,
      "reclaimable_bytes": 13809336320,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 12.368401500000001,
      "owned_rss_bytes": 454328320,
      "owned_process_count": 4,
      "reclaimable_bytes": 13805076480,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 12.607508917,
      "owned_rss_bytes": 459997184,
      "owned_process_count": 4,
      "reclaimable_bytes": 13797146624,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 12.848955875000001,
      "owned_rss_bytes": 466993152,
      "owned_process_count": 4,
      "reclaimable_bytes": 13795196928,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.093352125000001,
      "owned_rss_bytes": 468123648,
      "owned_process_count": 4,
      "reclaimable_bytes": 13785956352,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.344890542,
      "owned_rss_bytes": 470269952,
      "owned_process_count": 4,
      "reclaimable_bytes": 13776388096,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.591394333,
      "owned_rss_bytes": 471810048,
      "owned_process_count": 4,
      "reclaimable_bytes": 13785088000,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 13.851599292000001,
      "owned_rss_bytes": 474923008,
      "owned_process_count": 4,
      "reclaimable_bytes": 13782106112,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 14.106398667,
      "owned_rss_bytes": 476692480,
      "owned_process_count": 4,
      "reclaimable_bytes": 13834928128,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 14.344296792,
      "owned_rss_bytes": 481378304,
      "owned_process_count": 4,
      "reclaimable_bytes": 13839515648,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 14.589333125000001,
      "owned_rss_bytes": 484376576,
      "owned_process_count": 4,
      "reclaimable_bytes": 13839106048,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 14.840477708,
      "owned_rss_bytes": 489111552,
      "owned_process_count": 4,
      "reclaimable_bytes": 13946470400,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 15.089179167000001,
      "owned_rss_bytes": 492322816,
      "owned_process_count": 4,
      "reclaimable_bytes": 13891452928,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 15.341600167000001,
      "owned_rss_bytes": 494403584,
      "owned_process_count": 4,
      "reclaimable_bytes": 13832421376,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 15.592098333000001,
      "owned_rss_bytes": 502005760,
      "owned_process_count": 4,
      "reclaimable_bytes": 13813350400,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 15.839367874999999,
      "owned_rss_bytes": 502923264,
      "owned_process_count": 4,
      "reclaimable_bytes": 13955022848,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 16.0932145,
      "owned_rss_bytes": 505020416,
      "owned_process_count": 4,
      "reclaimable_bytes": 14083457024,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 16.346054167,
      "owned_rss_bytes": 505102336,
      "owned_process_count": 4,
      "reclaimable_bytes": 14070136832,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 16.591557833,
      "owned_rss_bytes": 505708544,
      "owned_process_count": 4,
      "reclaimable_bytes": 13776257024,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 16.829438458,
      "owned_rss_bytes": 513163264,
      "owned_process_count": 4,
      "reclaimable_bytes": 13766033408,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 17.073040582999997,
      "owned_rss_bytes": 513900544,
      "owned_process_count": 4,
      "reclaimable_bytes": 13764853760,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 17.324248917,
      "owned_rss_bytes": 515637248,
      "owned_process_count": 4,
      "reclaimable_bytes": 13751713792,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 17.576636042,
      "owned_rss_bytes": 517439488,
      "owned_process_count": 4,
      "reclaimable_bytes": 13742817280,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 17.833022916999997,
      "owned_rss_bytes": 517455872,
      "owned_process_count": 4,
      "reclaimable_bytes": 13743210496,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 18.08298,
      "owned_rss_bytes": 517750784,
      "owned_process_count": 4,
      "reclaimable_bytes": 13738770432,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 18.328714291999997,
      "owned_rss_bytes": 518406144,
      "owned_process_count": 4,
      "reclaimable_bytes": 13745635328,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 18.572678707999998,
      "owned_rss_bytes": 518619136,
      "owned_process_count": 4,
      "reclaimable_bytes": 13745930240,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 18.824798124999997,
      "owned_rss_bytes": 519110656,
      "owned_process_count": 4,
      "reclaimable_bytes": 13743538176,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 19.070196875,
      "owned_rss_bytes": 519241728,
      "owned_process_count": 4,
      "reclaimable_bytes": 13741441024,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 19.320296499999998,
      "owned_rss_bytes": 519536640,
      "owned_process_count": 4,
      "reclaimable_bytes": 13739278336,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 19.563667332999998,
      "owned_rss_bytes": 521240576,
      "owned_process_count": 4,
      "reclaimable_bytes": 13617725440,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 19.822415083,
      "owned_rss_bytes": 521322496,
      "owned_process_count": 4,
      "reclaimable_bytes": 13619118080,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 20.073853292,
      "owned_rss_bytes": 521355264,
      "owned_process_count": 4,
      "reclaimable_bytes": 13607387136,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 20.320805667,
      "owned_rss_bytes": 521666560,
      "owned_process_count": 4,
      "reclaimable_bytes": 13605060608,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 20.570363792,
      "owned_rss_bytes": 521781248,
      "owned_process_count": 4,
      "reclaimable_bytes": 13598261248,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 20.825129625,
      "owned_rss_bytes": 522076160,
      "owned_process_count": 4,
      "reclaimable_bytes": 13421838336,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 21.072412832999998,
      "owned_rss_bytes": 522223616,
      "owned_process_count": 4,
      "reclaimable_bytes": 13428293632,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 21.315349917,
      "owned_rss_bytes": 522289152,
      "owned_process_count": 4,
      "reclaimable_bytes": 13205405696,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 21.559753708,
      "owned_rss_bytes": 522387456,
      "owned_process_count": 4,
      "reclaimable_bytes": 13195247616,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 21.812604542,
      "owned_rss_bytes": 528777216,
      "owned_process_count": 4,
      "reclaimable_bytes": 13180862464,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 22.061464958,
      "owned_rss_bytes": 626884608,
      "owned_process_count": 4,
      "reclaimable_bytes": 13075382272,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 22.306372125,
      "owned_rss_bytes": 173260800,
      "owned_process_count": 4,
      "reclaimable_bytes": 13453737984,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 22.551185458,
      "owned_rss_bytes": 289800192,
      "owned_process_count": 4,
      "reclaimable_bytes": 13665828864,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 22.816613999999998,
      "owned_rss_bytes": 321011712,
      "owned_process_count": 4,
      "reclaimable_bytes": 13659242496,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 23.064723125,
      "owned_rss_bytes": 331776000,
      "owned_process_count": 4,
      "reclaimable_bytes": 13852377088,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 23.308546458,
      "owned_rss_bytes": 352387072,
      "owned_process_count": 4,
      "reclaimable_bytes": 13853425664,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 23.550129374999997,
      "owned_rss_bytes": 382566400,
      "owned_process_count": 4,
      "reclaimable_bytes": 13868728320,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 23.790378375,
      "owned_rss_bytes": 403996672,
      "owned_process_count": 4,
      "reclaimable_bytes": 13900005376,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 24.033029499999998,
      "owned_rss_bytes": 422854656,
      "owned_process_count": 4,
      "reclaimable_bytes": 13911474176,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 24.270663541999998,
      "owned_rss_bytes": 436469760,
      "owned_process_count": 4,
      "reclaimable_bytes": 13685506048,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 24.519367499999998,
      "owned_rss_bytes": 447053824,
      "owned_process_count": 4,
      "reclaimable_bytes": 13651492864,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 24.76930625,
      "owned_rss_bytes": 466059264,
      "owned_process_count": 4,
      "reclaimable_bytes": 13591232512,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 25.016366333,
      "owned_rss_bytes": 488456192,
      "owned_process_count": 4,
      "reclaimable_bytes": 13568229376,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 25.265063458,
      "owned_rss_bytes": 491356160,
      "owned_process_count": 4,
      "reclaimable_bytes": 13560610816,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 25.516365667,
      "owned_rss_bytes": 499138560,
      "owned_process_count": 4,
      "reclaimable_bytes": 13672349696,
      "swapins": 44112839,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 25.767188041999997,
      "owned_rss_bytes": 512016384,
      "owned_process_count": 4,
      "reclaimable_bytes": 13659799552,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 26.019604875,
      "owned_rss_bytes": 524566528,
      "owned_process_count": 4,
      "reclaimable_bytes": 13649592320,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 26.259571375,
      "owned_rss_bytes": 535789568,
      "owned_process_count": 4,
      "reclaimable_bytes": 13636354048,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 26.504659874999998,
      "owned_rss_bytes": 543916032,
      "owned_process_count": 4,
      "reclaimable_bytes": 13630046208,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 26.745972166999998,
      "owned_rss_bytes": 551305216,
      "owned_process_count": 4,
      "reclaimable_bytes": 13630144512,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 26.988604167,
      "owned_rss_bytes": 562348032,
      "owned_process_count": 4,
      "reclaimable_bytes": 13617659904,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 27.24243925,
      "owned_rss_bytes": 574341120,
      "owned_process_count": 4,
      "reclaimable_bytes": 13609959424,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 27.480344,
      "owned_rss_bytes": 578764800,
      "owned_process_count": 4,
      "reclaimable_bytes": 13422084096,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 27.722643708,
      "owned_rss_bytes": 583843840,
      "owned_process_count": 4,
      "reclaimable_bytes": 13409894400,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 27.966524208,
      "owned_rss_bytes": 589037568,
      "owned_process_count": 4,
      "reclaimable_bytes": 13286522880,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 28.217120041999998,
      "owned_rss_bytes": 599916544,
      "owned_process_count": 4,
      "reclaimable_bytes": 13198458880,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 28.467100875,
      "owned_rss_bytes": 609517568,
      "owned_process_count": 4,
      "reclaimable_bytes": 13195853824,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 28.716091457999998,
      "owned_rss_bytes": 617005056,
      "owned_process_count": 4,
      "reclaimable_bytes": 13368557568,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 28.957713291999998,
      "owned_rss_bytes": 623869952,
      "owned_process_count": 4,
      "reclaimable_bytes": 13363658752,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 29.196008083,
      "owned_rss_bytes": 627523584,
      "owned_process_count": 4,
      "reclaimable_bytes": 13542277120,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 29.441734417,
      "owned_rss_bytes": 634208256,
      "owned_process_count": 4,
      "reclaimable_bytes": 13534232576,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 29.689097832999998,
      "owned_rss_bytes": 647053312,
      "owned_process_count": 4,
      "reclaimable_bytes": 13537198080,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 29.932299625,
      "owned_rss_bytes": 655376384,
      "owned_process_count": 4,
      "reclaimable_bytes": 13523828736,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 30.177728374999997,
      "owned_rss_bytes": 661684224,
      "owned_process_count": 4,
      "reclaimable_bytes": 13525729280,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 30.419917041999998,
      "owned_rss_bytes": 662487040,
      "owned_process_count": 4,
      "reclaimable_bytes": 13518864384,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 30.672029249999998,
      "owned_rss_bytes": 662503424,
      "owned_process_count": 4,
      "reclaimable_bytes": 13523304448,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 30.918643292,
      "owned_rss_bytes": 662503424,
      "owned_process_count": 4,
      "reclaimable_bytes": 13581041664,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 31.166945207999998,
      "owned_rss_bytes": 662536192,
      "owned_process_count": 4,
      "reclaimable_bytes": 13586497536,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 31.411161625000002,
      "owned_rss_bytes": 663027712,
      "owned_process_count": 4,
      "reclaimable_bytes": 13609631744,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 31.654734666999996,
      "owned_rss_bytes": 661946368,
      "owned_process_count": 4,
      "reclaimable_bytes": 13571162112,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 31.898812541999998,
      "owned_rss_bytes": 662437888,
      "owned_process_count": 4,
      "reclaimable_bytes": 13548748800,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 32.147303417,
      "owned_rss_bytes": 663568384,
      "owned_process_count": 4,
      "reclaimable_bytes": 13537591296,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 32.387559625,
      "owned_rss_bytes": 663928832,
      "owned_process_count": 4,
      "reclaimable_bytes": 13541605376,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 32.626226958000004,
      "owned_rss_bytes": 664223744,
      "owned_process_count": 4,
      "reclaimable_bytes": 13549355008,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 32.868940417000005,
      "owned_rss_bytes": 664862720,
      "owned_process_count": 4,
      "reclaimable_bytes": 13547634688,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 33.111017208,
      "owned_rss_bytes": 670679040,
      "owned_process_count": 4,
      "reclaimable_bytes": 13528301568,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 33.353616792000004,
      "owned_rss_bytes": 741310464,
      "owned_process_count": 4,
      "reclaimable_bytes": 13467860992,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 33.591846083,
      "owned_rss_bytes": 821952512,
      "owned_process_count": 4,
      "reclaimable_bytes": 13382959104,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 33.836053542,
      "owned_rss_bytes": 144818176,
      "owned_process_count": 3,
      "reclaimable_bytes": 13934837760,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 34.076445125,
      "owned_rss_bytes": 235094016,
      "owned_process_count": 4,
      "reclaimable_bytes": 13898792960,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 34.316358042000005,
      "owned_rss_bytes": 233996288,
      "owned_process_count": 4,
      "reclaimable_bytes": 13771243520,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 34.558368167000005,
      "owned_rss_bytes": 310788096,
      "owned_process_count": 4,
      "reclaimable_bytes": 13744455680,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 34.797754250000004,
      "owned_rss_bytes": 349011968,
      "owned_process_count": 4,
      "reclaimable_bytes": 13719945216,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 35.036432292,
      "owned_rss_bytes": 374767616,
      "owned_process_count": 4,
      "reclaimable_bytes": 13705789440,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 35.278851625,
      "owned_rss_bytes": 390299648,
      "owned_process_count": 4,
      "reclaimable_bytes": 13688455168,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 35.526871292,
      "owned_rss_bytes": 406306816,
      "owned_process_count": 4,
      "reclaimable_bytes": 13782777856,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 35.768597208,
      "owned_rss_bytes": 419151872,
      "owned_process_count": 4,
      "reclaimable_bytes": 13791559680,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 36.009923458,
      "owned_rss_bytes": 429342720,
      "owned_process_count": 4,
      "reclaimable_bytes": 13782417408,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 36.250765833,
      "owned_rss_bytes": 433242112,
      "owned_process_count": 4,
      "reclaimable_bytes": 13779779584,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 36.499566125,
      "owned_rss_bytes": 436338688,
      "owned_process_count": 4,
      "reclaimable_bytes": 13769392128,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 36.749629250000005,
      "owned_rss_bytes": 439959552,
      "owned_process_count": 4,
      "reclaimable_bytes": 13768261632,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 36.991460375,
      "owned_rss_bytes": 440401920,
      "owned_process_count": 4,
      "reclaimable_bytes": 13768540160,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 37.2368145,
      "owned_rss_bytes": 440696832,
      "owned_process_count": 4,
      "reclaimable_bytes": 13762707456,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 37.477797792000004,
      "owned_rss_bytes": 112820224,
      "owned_process_count": 3,
      "reclaimable_bytes": 13947568128,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 37.720918542,
      "owned_rss_bytes": 207634432,
      "owned_process_count": 4,
      "reclaimable_bytes": 13909491712,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 37.967103333000004,
      "owned_rss_bytes": 328679424,
      "owned_process_count": 4,
      "reclaimable_bytes": 13844365312,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 38.215389542000004,
      "owned_rss_bytes": 357482496,
      "owned_process_count": 4,
      "reclaimable_bytes": 13871775744,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 38.459961417,
      "owned_rss_bytes": 382484480,
      "owned_process_count": 4,
      "reclaimable_bytes": 13907623936,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 38.697953417,
      "owned_rss_bytes": 396623872,
      "owned_process_count": 4,
      "reclaimable_bytes": 13846446080,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 38.943693083,
      "owned_rss_bytes": 411287552,
      "owned_process_count": 4,
      "reclaimable_bytes": 13825114112,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 39.180183542,
      "owned_rss_bytes": 422969344,
      "owned_process_count": 4,
      "reclaimable_bytes": 13790167040,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 39.428187542,
      "owned_rss_bytes": 436387840,
      "owned_process_count": 4,
      "reclaimable_bytes": 13765378048,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 39.665376125,
      "owned_rss_bytes": 451756032,
      "owned_process_count": 4,
      "reclaimable_bytes": 13749616640,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 39.903842167,
      "owned_rss_bytes": 464142336,
      "owned_process_count": 4,
      "reclaimable_bytes": 13744406528,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 40.151139208000004,
      "owned_rss_bytes": 467484672,
      "owned_process_count": 4,
      "reclaimable_bytes": 13740851200,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 40.394136292,
      "owned_rss_bytes": 468385792,
      "owned_process_count": 4,
      "reclaimable_bytes": 13731577856,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 40.64037975,
      "owned_rss_bytes": 479657984,
      "owned_process_count": 4,
      "reclaimable_bytes": 13729906688,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 40.890296500000005,
      "owned_rss_bytes": 479657984,
      "owned_process_count": 4,
      "reclaimable_bytes": 13726089216,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 41.1360315,
      "owned_rss_bytes": 479723520,
      "owned_process_count": 4,
      "reclaimable_bytes": 13723779072,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 41.382106042000004,
      "owned_rss_bytes": 479838208,
      "owned_process_count": 4,
      "reclaimable_bytes": 13733642240,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 41.620523125000005,
      "owned_rss_bytes": 482033664,
      "owned_process_count": 4,
      "reclaimable_bytes": 13723729920,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 41.875515958,
      "owned_rss_bytes": 484048896,
      "owned_process_count": 4,
      "reclaimable_bytes": 13725974528,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 42.12191725,
      "owned_rss_bytes": 486637568,
      "owned_process_count": 4,
      "reclaimable_bytes": 13721239552,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 42.370448542000005,
      "owned_rss_bytes": 487112704,
      "owned_process_count": 4,
      "reclaimable_bytes": 13715243008,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 42.616086292000006,
      "owned_rss_bytes": 487358464,
      "owned_process_count": 4,
      "reclaimable_bytes": 13716996096,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 42.863886125,
      "owned_rss_bytes": 487555072,
      "owned_process_count": 4,
      "reclaimable_bytes": 13703004160,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 43.10446875,
      "owned_rss_bytes": 487604224,
      "owned_process_count": 4,
      "reclaimable_bytes": 13698531328,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 43.350695708,
      "owned_rss_bytes": 520683520,
      "owned_process_count": 4,
      "reclaimable_bytes": 13660700672,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 43.588470917,
      "owned_rss_bytes": 191283200,
      "owned_process_count": 4,
      "reclaimable_bytes": 13921746944,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 43.83149625,
      "owned_rss_bytes": 278691840,
      "owned_process_count": 4,
      "reclaimable_bytes": 13863976960,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 44.08161925,
      "owned_rss_bytes": 294862848,
      "owned_process_count": 4,
      "reclaimable_bytes": 13871546368,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 44.318164292000006,
      "owned_rss_bytes": 308592640,
      "owned_process_count": 4,
      "reclaimable_bytes": 13852229632,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 44.556124583,
      "owned_rss_bytes": 317636608,
      "owned_process_count": 4,
      "reclaimable_bytes": 13850542080,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 44.806236417,
      "owned_rss_bytes": 341606400,
      "owned_process_count": 4,
      "reclaimable_bytes": 13824475136,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 45.053441750000005,
      "owned_rss_bytes": 367575040,
      "owned_process_count": 4,
      "reclaimable_bytes": 13820182528,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 45.300138000000004,
      "owned_rss_bytes": 434159616,
      "owned_process_count": 4,
      "reclaimable_bytes": 13758644224,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 45.544183667000006,
      "owned_rss_bytes": 435585024,
      "owned_process_count": 4,
      "reclaimable_bytes": 13764902912,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 45.791276417000006,
      "owned_rss_bytes": 435814400,
      "owned_process_count": 4,
      "reclaimable_bytes": 13774127104,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 46.035972792,
      "owned_rss_bytes": 435945472,
      "owned_process_count": 4,
      "reclaimable_bytes": 13782073344,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 46.274009667,
      "owned_rss_bytes": 436043776,
      "owned_process_count": 4,
      "reclaimable_bytes": 13801865216,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 46.522465708000006,
      "owned_rss_bytes": 436240384,
      "owned_process_count": 4,
      "reclaimable_bytes": 13807304704,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 46.763373417000004,
      "owned_rss_bytes": 440041472,
      "owned_process_count": 4,
      "reclaimable_bytes": 13789052928,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.000293125,
      "owned_rss_bytes": 448233472,
      "owned_process_count": 4,
      "reclaimable_bytes": 13778894848,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.239455167,
      "owned_rss_bytes": 459210752,
      "owned_process_count": 4,
      "reclaimable_bytes": 13774553088,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.481370708,
      "owned_rss_bytes": 466026496,
      "owned_process_count": 4,
      "reclaimable_bytes": 13767786496,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.727680875000004,
      "owned_rss_bytes": 470056960,
      "owned_process_count": 4,
      "reclaimable_bytes": 13765197824,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 47.96866825,
      "owned_rss_bytes": 479936512,
      "owned_process_count": 4,
      "reclaimable_bytes": 13752532992,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 48.209411667000005,
      "owned_rss_bytes": 492486656,
      "owned_process_count": 4,
      "reclaimable_bytes": 13744406528,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 48.452697792,
      "owned_rss_bytes": 502087680,
      "owned_process_count": 4,
      "reclaimable_bytes": 13731594240,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 48.696959125,
      "owned_rss_bytes": 514768896,
      "owned_process_count": 4,
      "reclaimable_bytes": 13707345920,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 48.936549167,
      "owned_rss_bytes": 528367616,
      "owned_process_count": 4,
      "reclaimable_bytes": 13697794048,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 49.176664125,
      "owned_rss_bytes": 539508736,
      "owned_process_count": 4,
      "reclaimable_bytes": 13690142720,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 49.426060583,
      "owned_rss_bytes": 540540928,
      "owned_process_count": 4,
      "reclaimable_bytes": 13691650048,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 49.669709000000005,
      "owned_rss_bytes": 559988736,
      "owned_process_count": 4,
      "reclaimable_bytes": 13664370688,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 49.913662208000005,
      "owned_rss_bytes": 560726016,
      "owned_process_count": 4,
      "reclaimable_bytes": 13658816512,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 50.160834083000005,
      "owned_rss_bytes": 561004544,
      "owned_process_count": 4,
      "reclaimable_bytes": 13654032384,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 50.397977083,
      "owned_rss_bytes": 562741248,
      "owned_process_count": 4,
      "reclaimable_bytes": 13653704704,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 50.63864525,
      "owned_rss_bytes": 564576256,
      "owned_process_count": 4,
      "reclaimable_bytes": 13649887232,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 50.880212542,
      "owned_rss_bytes": 566755328,
      "owned_process_count": 4,
      "reclaimable_bytes": 13652656128,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 51.123010208000004,
      "owned_rss_bytes": 569868288,
      "owned_process_count": 4,
      "reclaimable_bytes": 13639041024,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 51.368646167,
      "owned_rss_bytes": 573374464,
      "owned_process_count": 4,
      "reclaimable_bytes": 13633978368,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 51.612832167,
      "owned_rss_bytes": 577699840,
      "owned_process_count": 4,
      "reclaimable_bytes": 13632602112,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 51.865584042,
      "owned_rss_bytes": 579338240,
      "owned_process_count": 4,
      "reclaimable_bytes": 13620117504,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 52.103589792,
      "owned_rss_bytes": 579436544,
      "owned_process_count": 4,
      "reclaimable_bytes": 13617168384,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 52.348312083,
      "owned_rss_bytes": 579764224,
      "owned_process_count": 4,
      "reclaimable_bytes": 13776388096,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 52.586518042,
      "owned_rss_bytes": 579829760,
      "owned_process_count": 4,
      "reclaimable_bytes": 13837090816,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 52.829047583000005,
      "owned_rss_bytes": 580173824,
      "owned_process_count": 4,
      "reclaimable_bytes": 13880328192,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 53.074665042,
      "owned_rss_bytes": 580927488,
      "owned_process_count": 4,
      "reclaimable_bytes": 13793951744,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 53.319645125,
      "owned_rss_bytes": 581402624,
      "owned_process_count": 4,
      "reclaimable_bytes": 13786021888,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 53.569295958000005,
      "owned_rss_bytes": 581435392,
      "owned_process_count": 4,
      "reclaimable_bytes": 13764083712,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 53.816195833,
      "owned_rss_bytes": 590135296,
      "owned_process_count": 4,
      "reclaimable_bytes": 13736230912,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 54.065182875000005,
      "owned_rss_bytes": 671334400,
      "owned_process_count": 4,
      "reclaimable_bytes": 13657374720,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 54.306850125000004,
      "owned_rss_bytes": 139362304,
      "owned_process_count": 3,
      "reclaimable_bytes": 14095450112,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 54.553895208,
      "owned_rss_bytes": 299712512,
      "owned_process_count": 4,
      "reclaimable_bytes": 14022279168,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 54.794018667,
      "owned_rss_bytes": 331300864,
      "owned_process_count": 4,
      "reclaimable_bytes": 14006206464,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 55.036033042,
      "owned_rss_bytes": 340361216,
      "owned_process_count": 4,
      "reclaimable_bytes": 14007599104,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 55.288788583000006,
      "owned_rss_bytes": 214908928,
      "owned_process_count": 4,
      "reclaimable_bytes": 14060453888,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 55.538316917,
      "owned_rss_bytes": 249659392,
      "owned_process_count": 4,
      "reclaimable_bytes": 14049230848,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 55.780751833000004,
      "owned_rss_bytes": 271400960,
      "owned_process_count": 4,
      "reclaimable_bytes": 14041628672,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 56.027399,
      "owned_rss_bytes": 277774336,
      "owned_process_count": 4,
      "reclaimable_bytes": 14046199808,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 56.265906417000004,
      "owned_rss_bytes": 282738688,
      "owned_process_count": 4,
      "reclaimable_bytes": 14036058112,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 56.509894667000005,
      "owned_rss_bytes": 288555008,
      "owned_process_count": 4,
      "reclaimable_bytes": 14032191488,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 56.754105042,
      "owned_rss_bytes": 293027840,
      "owned_process_count": 4,
      "reclaimable_bytes": 14028570624,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 56.993962083,
      "owned_rss_bytes": 294305792,
      "owned_process_count": 4,
      "reclaimable_bytes": 14028275712,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 57.231853042000004,
      "owned_rss_bytes": 330989568,
      "owned_process_count": 4,
      "reclaimable_bytes": 13993836544,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 57.475848792,
      "owned_rss_bytes": 338247680,
      "owned_process_count": 4,
      "reclaimable_bytes": 13993377792,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 57.723423208,
      "owned_rss_bytes": 349241344,
      "owned_process_count": 4,
      "reclaimable_bytes": 13796409344,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 57.967106042000005,
      "owned_rss_bytes": 361578496,
      "owned_process_count": 4,
      "reclaimable_bytes": 13767966720,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 58.211483083000005,
      "owned_rss_bytes": 375980032,
      "owned_process_count": 4,
      "reclaimable_bytes": 13757202432,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 58.458732792,
      "owned_rss_bytes": 389038080,
      "owned_process_count": 4,
      "reclaimable_bytes": 13736574976,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 58.697007500000005,
      "owned_rss_bytes": 394444800,
      "owned_process_count": 4,
      "reclaimable_bytes": 13723271168,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 58.937586375,
      "owned_rss_bytes": 401457152,
      "owned_process_count": 4,
      "reclaimable_bytes": 13890027520,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 59.1830505,
      "owned_rss_bytes": 401932288,
      "owned_process_count": 4,
      "reclaimable_bytes": 13883949056,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 59.428688458,
      "owned_rss_bytes": 404668416,
      "owned_process_count": 4,
      "reclaimable_bytes": 13879869440,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 59.674397458,
      "owned_rss_bytes": 406421504,
      "owned_process_count": 4,
      "reclaimable_bytes": 13896105984,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 59.921438042000005,
      "owned_rss_bytes": 406683648,
      "owned_process_count": 4,
      "reclaimable_bytes": 13895761920,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 60.167933083,
      "owned_rss_bytes": 406896640,
      "owned_process_count": 4,
      "reclaimable_bytes": 13893353472,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 60.421848333,
      "owned_rss_bytes": 407126016,
      "owned_process_count": 4,
      "reclaimable_bytes": 13892452352,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 60.659128625,
      "owned_rss_bytes": 421855232,
      "owned_process_count": 4,
      "reclaimable_bytes": 13874888704,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 60.901538458000005,
      "owned_rss_bytes": 140017664,
      "owned_process_count": 4,
      "reclaimable_bytes": 14064910336,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 61.145420458000004,
      "owned_rss_bytes": 313606144,
      "owned_process_count": 4,
      "reclaimable_bytes": 13996097536,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 61.388045875,
      "owned_rss_bytes": 347521024,
      "owned_process_count": 4,
      "reclaimable_bytes": 13792083968,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 61.628276083,
      "owned_rss_bytes": 358055936,
      "owned_process_count": 4,
      "reclaimable_bytes": 13763608576,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 61.866889333,
      "owned_rss_bytes": 359333888,
      "owned_process_count": 4,
      "reclaimable_bytes": 13742817280,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 62.112289042,
      "owned_rss_bytes": 245006336,
      "owned_process_count": 4,
      "reclaimable_bytes": 13852737536,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 62.358170208000004,
      "owned_rss_bytes": 217612288,
      "owned_process_count": 4,
      "reclaimable_bytes": 13815267328,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 62.605216500000004,
      "owned_rss_bytes": 238305280,
      "owned_process_count": 4,
      "reclaimable_bytes": 13962461184,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 62.842129375,
      "owned_rss_bytes": 250707968,
      "owned_process_count": 4,
      "reclaimable_bytes": 13945749504,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 63.085967875,
      "owned_rss_bytes": 226377728,
      "owned_process_count": 4,
      "reclaimable_bytes": 13953875968,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 63.332194583,
      "owned_rss_bytes": 318144512,
      "owned_process_count": 4,
      "reclaimable_bytes": 13894107136,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 63.570344875,
      "owned_rss_bytes": 331726848,
      "owned_process_count": 4,
      "reclaimable_bytes": 13873938432,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 63.811361792,
      "owned_rss_bytes": 347750400,
      "owned_process_count": 4,
      "reclaimable_bytes": 13863731200,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 64.054197333,
      "owned_rss_bytes": 358039552,
      "owned_process_count": 4,
      "reclaimable_bytes": 13847363584,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 64.293353583,
      "owned_rss_bytes": 362872832,
      "owned_process_count": 4,
      "reclaimable_bytes": 13843496960,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 64.5398425,
      "owned_rss_bytes": 366198784,
      "owned_process_count": 4,
      "reclaimable_bytes": 13836451840,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 64.776863875,
      "owned_rss_bytes": 369770496,
      "owned_process_count": 4,
      "reclaimable_bytes": 13825261568,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 65.022706333,
      "owned_rss_bytes": 372948992,
      "owned_process_count": 4,
      "reclaimable_bytes": 13821394944,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 65.2693605,
      "owned_rss_bytes": 376586240,
      "owned_process_count": 4,
      "reclaimable_bytes": 13826457600,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 65.51461325,
      "owned_rss_bytes": 380698624,
      "owned_process_count": 4,
      "reclaimable_bytes": 13822296064,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 65.755260875,
      "owned_rss_bytes": 383942656,
      "owned_process_count": 4,
      "reclaimable_bytes": 13823229952,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.000657833,
      "owned_rss_bytes": 388022272,
      "owned_process_count": 4,
      "reclaimable_bytes": 13817020416,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.242184458,
      "owned_rss_bytes": 392052736,
      "owned_process_count": 4,
      "reclaimable_bytes": 13810565120,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.486183375,
      "owned_rss_bytes": 395083776,
      "owned_process_count": 4,
      "reclaimable_bytes": 13806878720,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.73594200000001,
      "owned_rss_bytes": 399097856,
      "owned_process_count": 4,
      "reclaimable_bytes": 13807714304,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 66.973363417,
      "owned_rss_bytes": 402931712,
      "owned_process_count": 4,
      "reclaimable_bytes": 13799735296,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 67.216879542,
      "owned_rss_bytes": 406241280,
      "owned_process_count": 4,
      "reclaimable_bytes": 13862518784,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 67.45664108300001,
      "owned_rss_bytes": 409747456,
      "owned_process_count": 4,
      "reclaimable_bytes": 13854310400,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 67.705708375,
      "owned_rss_bytes": 413794304,
      "owned_process_count": 4,
      "reclaimable_bytes": 13807370240,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 67.952697667,
      "owned_rss_bytes": 417579008,
      "owned_process_count": 4,
      "reclaimable_bytes": 13765279744,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 68.196927208,
      "owned_rss_bytes": 420511744,
      "owned_process_count": 4,
      "reclaimable_bytes": 13763461120,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 68.440867083,
      "owned_rss_bytes": 424525824,
      "owned_process_count": 4,
      "reclaimable_bytes": 13747896320,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 68.68432625,
      "owned_rss_bytes": 428572672,
      "owned_process_count": 4,
      "reclaimable_bytes": 13753073664,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 68.92540220800001,
      "owned_rss_bytes": 430784512,
      "owned_process_count": 4,
      "reclaimable_bytes": 13750091776,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 69.168221208,
      "owned_rss_bytes": 435503104,
      "owned_process_count": 4,
      "reclaimable_bytes": 13750009856,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 69.41626745800001,
      "owned_rss_bytes": 437747712,
      "owned_process_count": 4,
      "reclaimable_bytes": 13753466880,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 69.65940570800001,
      "owned_rss_bytes": 438255616,
      "owned_process_count": 4,
      "reclaimable_bytes": 13754646528,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 69.900295083,
      "owned_rss_bytes": 439517184,
      "owned_process_count": 4,
      "reclaimable_bytes": 13754597376,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 70.1420605,
      "owned_rss_bytes": 439615488,
      "owned_process_count": 4,
      "reclaimable_bytes": 13742407680,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 70.388508125,
      "owned_rss_bytes": 441434112,
      "owned_process_count": 4,
      "reclaimable_bytes": 13727465472,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 70.6299695,
      "owned_rss_bytes": 444006400,
      "owned_process_count": 4,
      "reclaimable_bytes": 13649510400,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 70.873745458,
      "owned_rss_bytes": 444006400,
      "owned_process_count": 4,
      "reclaimable_bytes": 13457014784,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 71.134007083,
      "owned_rss_bytes": 444383232,
      "owned_process_count": 4,
      "reclaimable_bytes": 12979322880,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 71.39681525,
      "owned_rss_bytes": 445988864,
      "owned_process_count": 4,
      "reclaimable_bytes": 12751110144,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 71.65809970800001,
      "owned_rss_bytes": 446709760,
      "owned_process_count": 4,
      "reclaimable_bytes": 12848463872,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 71.91045175000001,
      "owned_rss_bytes": 447938560,
      "owned_process_count": 4,
      "reclaimable_bytes": 12793102336,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 72.149167167,
      "owned_rss_bytes": 448528384,
      "owned_process_count": 4,
      "reclaimable_bytes": 12793888768,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 72.39701466700001,
      "owned_rss_bytes": 462290944,
      "owned_process_count": 4,
      "reclaimable_bytes": 12786057216,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 72.63577975,
      "owned_rss_bytes": 480329728,
      "owned_process_count": 4,
      "reclaimable_bytes": 12753829888,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 72.883026667,
      "owned_rss_bytes": 503332864,
      "owned_process_count": 4,
      "reclaimable_bytes": 12789415936,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 73.12159750000001,
      "owned_rss_bytes": 520536064,
      "owned_process_count": 4,
      "reclaimable_bytes": 12840796160,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 73.364441083,
      "owned_rss_bytes": 548978688,
      "owned_process_count": 4,
      "reclaimable_bytes": 12722225152,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 73.60529375,
      "owned_rss_bytes": 649347072,
      "owned_process_count": 4,
      "reclaimable_bytes": 12625657856,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 73.845620375,
      "owned_rss_bytes": 650985472,
      "owned_process_count": 4,
      "reclaimable_bytes": 12603260928,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 74.084451667,
      "owned_rss_bytes": 651067392,
      "owned_process_count": 4,
      "reclaimable_bytes": 12598296576,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 74.331375958,
      "owned_rss_bytes": 651067392,
      "owned_process_count": 4,
      "reclaimable_bytes": 12595101696,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 74.574407667,
      "owned_rss_bytes": 651083776,
      "owned_process_count": 4,
      "reclaimable_bytes": 12588826624,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 74.815850917,
      "owned_rss_bytes": 651231232,
      "owned_process_count": 4,
      "reclaimable_bytes": 12607717376,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 75.060743792,
      "owned_rss_bytes": 651247616,
      "owned_process_count": 4,
      "reclaimable_bytes": 12611616768,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 75.303128208,
      "owned_rss_bytes": 651247616,
      "owned_process_count": 4,
      "reclaimable_bytes": 12604751872,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 75.551653708,
      "owned_rss_bytes": 651264000,
      "owned_process_count": 4,
      "reclaimable_bytes": 12607094784,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 75.789866417,
      "owned_rss_bytes": 651264000,
      "owned_process_count": 4,
      "reclaimable_bytes": 12590956544,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 76.041834833,
      "owned_rss_bytes": 651280384,
      "owned_process_count": 4,
      "reclaimable_bytes": 12496617472,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 76.288639833,
      "owned_rss_bytes": 651280384,
      "owned_process_count": 4,
      "reclaimable_bytes": 12548096000,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 76.534808375,
      "owned_rss_bytes": 651296768,
      "owned_process_count": 4,
      "reclaimable_bytes": 12591611904,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 76.775020958,
      "owned_rss_bytes": 655245312,
      "owned_process_count": 4,
      "reclaimable_bytes": 12587253760,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 77.020395583,
      "owned_rss_bytes": 655998976,
      "owned_process_count": 4,
      "reclaimable_bytes": 12590170112,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 77.270130917,
      "owned_rss_bytes": 658407424,
      "owned_process_count": 4,
      "reclaimable_bytes": 12585091072,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 77.508677542,
      "owned_rss_bytes": 662355968,
      "owned_process_count": 4,
      "reclaimable_bytes": 12633194496,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 77.75332025,
      "owned_rss_bytes": 672530432,
      "owned_process_count": 4,
      "reclaimable_bytes": 12696797184,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 78.000444167,
      "owned_rss_bytes": 681000960,
      "owned_process_count": 4,
      "reclaimable_bytes": 12607012864,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 78.246222667,
      "owned_rss_bytes": 688504832,
      "owned_process_count": 4,
      "reclaimable_bytes": 12578799616,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 78.489514958,
      "owned_rss_bytes": 696074240,
      "owned_process_count": 4,
      "reclaimable_bytes": 12541034496,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 78.735822458,
      "owned_rss_bytes": 700186624,
      "owned_process_count": 4,
      "reclaimable_bytes": 12523126784,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 78.97380700000001,
      "owned_rss_bytes": 704544768,
      "owned_process_count": 4,
      "reclaimable_bytes": 12524175360,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 79.218923,
      "owned_rss_bytes": 710361088,
      "owned_process_count": 4,
      "reclaimable_bytes": 12512018432,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 79.458050625,
      "owned_rss_bytes": 712949760,
      "owned_process_count": 4,
      "reclaimable_bytes": 12519309312,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 79.704837625,
      "owned_rss_bytes": 727384064,
      "owned_process_count": 4,
      "reclaimable_bytes": 12368691200,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 79.943671292,
      "owned_rss_bytes": 734117888,
      "owned_process_count": 4,
      "reclaimable_bytes": 12368740352,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 80.197379083,
      "owned_rss_bytes": 741900288,
      "owned_process_count": 4,
      "reclaimable_bytes": 12299124736,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 80.445318125,
      "owned_rss_bytes": 749649920,
      "owned_process_count": 4,
      "reclaimable_bytes": 12289900544,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 80.692858833,
      "owned_rss_bytes": 758333440,
      "owned_process_count": 4,
      "reclaimable_bytes": 12106465280,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 80.93546075,
      "owned_rss_bytes": 764329984,
      "owned_process_count": 4,
      "reclaimable_bytes": 12114083840,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 81.178294917,
      "owned_rss_bytes": 770883584,
      "owned_process_count": 4,
      "reclaimable_bytes": 12102451200,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 81.425361292,
      "owned_rss_bytes": 779943936,
      "owned_process_count": 4,
      "reclaimable_bytes": 12101926912,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 81.668471958,
      "owned_rss_bytes": 786087936,
      "owned_process_count": 4,
      "reclaimable_bytes": 12087623680,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 81.914001458,
      "owned_rss_bytes": 795033600,
      "owned_process_count": 4,
      "reclaimable_bytes": 12239470592,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 82.160876417,
      "owned_rss_bytes": 800309248,
      "owned_process_count": 4,
      "reclaimable_bytes": 12162760704,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 82.405626875,
      "owned_rss_bytes": 802897920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11871109120,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 82.660355583,
      "owned_rss_bytes": 805584896,
      "owned_process_count": 4,
      "reclaimable_bytes": 11968184320,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 82.904098625,
      "owned_rss_bytes": 806502400,
      "owned_process_count": 4,
      "reclaimable_bytes": 12004229120,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 83.152714542,
      "owned_rss_bytes": 813137920,
      "owned_process_count": 4,
      "reclaimable_bytes": 12006932480,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 83.396324625,
      "owned_rss_bytes": 820740096,
      "owned_process_count": 4,
      "reclaimable_bytes": 11986518016,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 83.645425083,
      "owned_rss_bytes": 826949632,
      "owned_process_count": 4,
      "reclaimable_bytes": 12170510336,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 83.883723083,
      "owned_rss_bytes": 832749568,
      "owned_process_count": 4,
      "reclaimable_bytes": 12166184960,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 84.132111792,
      "owned_rss_bytes": 844660736,
      "owned_process_count": 4,
      "reclaimable_bytes": 12150898688,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 84.379791667,
      "owned_rss_bytes": 851492864,
      "owned_process_count": 4,
      "reclaimable_bytes": 12143362048,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 84.629589542,
      "owned_rss_bytes": 854261760,
      "owned_process_count": 4,
      "reclaimable_bytes": 12141166592,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 84.872700583,
      "owned_rss_bytes": 855785472,
      "owned_process_count": 4,
      "reclaimable_bytes": 12139577344,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 85.119230625,
      "owned_rss_bytes": 861487104,
      "owned_process_count": 4,
      "reclaimable_bytes": 12133302272,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 85.355700583,
      "owned_rss_bytes": 868679680,
      "owned_process_count": 4,
      "reclaimable_bytes": 12128321536,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 85.599699042,
      "owned_rss_bytes": 876085248,
      "owned_process_count": 4,
      "reclaimable_bytes": 12123324416,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 85.839711667,
      "owned_rss_bytes": 879689728,
      "owned_process_count": 4,
      "reclaimable_bytes": 12117426176,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 86.077581917,
      "owned_rss_bytes": 880640000,
      "owned_process_count": 4,
      "reclaimable_bytes": 12119605248,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 86.326614792,
      "owned_rss_bytes": 880787456,
      "owned_process_count": 4,
      "reclaimable_bytes": 12113625088,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 86.570571208,
      "owned_rss_bytes": 880852992,
      "owned_process_count": 4,
      "reclaimable_bytes": 12115066880,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 86.81635654200001,
      "owned_rss_bytes": 889962496,
      "owned_process_count": 4,
      "reclaimable_bytes": 12101386240,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 87.062706375,
      "owned_rss_bytes": 890781696,
      "owned_process_count": 4,
      "reclaimable_bytes": 12103434240,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 87.305819042,
      "owned_rss_bytes": 891092992,
      "owned_process_count": 4,
      "reclaimable_bytes": 12106006528,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 87.55646300000001,
      "owned_rss_bytes": 891224064,
      "owned_process_count": 4,
      "reclaimable_bytes": 12102107136,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 87.803502167,
      "owned_rss_bytes": 894091264,
      "owned_process_count": 4,
      "reclaimable_bytes": 11920048128,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 88.050689917,
      "owned_rss_bytes": 894910464,
      "owned_process_count": 4,
      "reclaimable_bytes": 11917033472,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 88.29691175,
      "owned_rss_bytes": 895303680,
      "owned_process_count": 4,
      "reclaimable_bytes": 11914674176,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 88.542391792,
      "owned_rss_bytes": 895533056,
      "owned_process_count": 4,
      "reclaimable_bytes": 11920769024,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 88.780495542,
      "owned_rss_bytes": 895942656,
      "owned_process_count": 4,
      "reclaimable_bytes": 11912970240,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 89.025350042,
      "owned_rss_bytes": 898269184,
      "owned_process_count": 4,
      "reclaimable_bytes": 12082593792,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 89.2663065,
      "owned_rss_bytes": 898301952,
      "owned_process_count": 4,
      "reclaimable_bytes": 12080529408,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 89.514413583,
      "owned_rss_bytes": 898908160,
      "owned_process_count": 4,
      "reclaimable_bytes": 12082823168,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 89.75501475,
      "owned_rss_bytes": 905216000,
      "owned_process_count": 4,
      "reclaimable_bytes": 12095782912,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 90.002688667,
      "owned_rss_bytes": 905969664,
      "owned_process_count": 4,
      "reclaimable_bytes": 12158861312,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 90.23906825,
      "owned_rss_bytes": 907296768,
      "owned_process_count": 4,
      "reclaimable_bytes": 12232392704,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 90.477331792,
      "owned_rss_bytes": 908263424,
      "owned_process_count": 4,
      "reclaimable_bytes": 12128206848,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 90.72309475,
      "owned_rss_bytes": 909377536,
      "owned_process_count": 4,
      "reclaimable_bytes": 12108922880,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 90.966887292,
      "owned_rss_bytes": 910000128,
      "owned_process_count": 4,
      "reclaimable_bytes": 12112265216,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 91.205878083,
      "owned_rss_bytes": 911654912,
      "owned_process_count": 4,
      "reclaimable_bytes": 12111380480,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 91.442347833,
      "owned_rss_bytes": 912277504,
      "owned_process_count": 4,
      "reclaimable_bytes": 12110479360,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 91.681231917,
      "owned_rss_bytes": 913489920,
      "owned_process_count": 4,
      "reclaimable_bytes": 12111003648,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 91.926507417,
      "owned_rss_bytes": 914374656,
      "owned_process_count": 4,
      "reclaimable_bytes": 12111888384,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 92.16720425,
      "owned_rss_bytes": 915865600,
      "owned_process_count": 4,
      "reclaimable_bytes": 12107104256,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 92.40268804200001,
      "owned_rss_bytes": 916848640,
      "owned_process_count": 4,
      "reclaimable_bytes": 12106448896,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 92.649689333,
      "owned_rss_bytes": 917159936,
      "owned_process_count": 4,
      "reclaimable_bytes": 12104515584,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 92.894023125,
      "owned_rss_bytes": 917815296,
      "owned_process_count": 4,
      "reclaimable_bytes": 12113395712,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 93.138255542,
      "owned_rss_bytes": 918454272,
      "owned_process_count": 4,
      "reclaimable_bytes": 12109758464,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 93.383025292,
      "owned_rss_bytes": 918962176,
      "owned_process_count": 4,
      "reclaimable_bytes": 12110331904,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 93.630707125,
      "owned_rss_bytes": 922845184,
      "owned_process_count": 4,
      "reclaimable_bytes": 12104204288,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 93.865875917,
      "owned_rss_bytes": 925908992,
      "owned_process_count": 4,
      "reclaimable_bytes": 12098535424,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 94.11429625,
      "owned_rss_bytes": 933216256,
      "owned_process_count": 4,
      "reclaimable_bytes": 12092112896,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 94.349647042,
      "owned_rss_bytes": 933756928,
      "owned_process_count": 4,
      "reclaimable_bytes": 12090212352,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 94.590335125,
      "owned_rss_bytes": 939474944,
      "owned_process_count": 4,
      "reclaimable_bytes": 12085903360,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 94.83517304200001,
      "owned_rss_bytes": 940032000,
      "owned_process_count": 4,
      "reclaimable_bytes": 12080283648,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 95.082470958,
      "owned_rss_bytes": 942981120,
      "owned_process_count": 4,
      "reclaimable_bytes": 12077678592,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 95.319360333,
      "owned_rss_bytes": 947093504,
      "owned_process_count": 4,
      "reclaimable_bytes": 12078006272,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 95.569891333,
      "owned_rss_bytes": 953925632,
      "owned_process_count": 4,
      "reclaimable_bytes": 11994939392,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 95.81142579200001,
      "owned_rss_bytes": 962871296,
      "owned_process_count": 4,
      "reclaimable_bytes": 11985666048,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 96.053902625,
      "owned_rss_bytes": 971390976,
      "owned_process_count": 4,
      "reclaimable_bytes": 11978113024,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 96.290283458,
      "owned_rss_bytes": 974979072,
      "owned_process_count": 4,
      "reclaimable_bytes": 11978604544,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 96.53447345800001,
      "owned_rss_bytes": 985808896,
      "owned_process_count": 4,
      "reclaimable_bytes": 11967774720,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 96.775613417,
      "owned_rss_bytes": 987054080,
      "owned_process_count": 4,
      "reclaimable_bytes": 11964481536,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 97.020635375,
      "owned_rss_bytes": 990068736,
      "owned_process_count": 4,
      "reclaimable_bytes": 11964530688,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 97.25940625,
      "owned_rss_bytes": 995786752,
      "owned_process_count": 4,
      "reclaimable_bytes": 11955453952,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 97.500699958,
      "owned_rss_bytes": 997343232,
      "owned_process_count": 4,
      "reclaimable_bytes": 11953373184,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 97.740493,
      "owned_rss_bytes": 998653952,
      "owned_process_count": 4,
      "reclaimable_bytes": 11952472064,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 97.980384875,
      "owned_rss_bytes": 998653952,
      "owned_process_count": 4,
      "reclaimable_bytes": 11972345856,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 98.224188333,
      "owned_rss_bytes": 998670336,
      "owned_process_count": 4,
      "reclaimable_bytes": 11963449344,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 98.473140333,
      "owned_rss_bytes": 998686720,
      "owned_process_count": 4,
      "reclaimable_bytes": 11965775872,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 98.718269083,
      "owned_rss_bytes": 998735872,
      "owned_process_count": 4,
      "reclaimable_bytes": 11961778176,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 98.958878958,
      "owned_rss_bytes": 998768640,
      "owned_process_count": 4,
      "reclaimable_bytes": 11963105280,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 99.19610679200001,
      "owned_rss_bytes": 998801408,
      "owned_process_count": 4,
      "reclaimable_bytes": 11964743680,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 99.445205625,
      "owned_rss_bytes": 998817792,
      "owned_process_count": 4,
      "reclaimable_bytes": 11959795712,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 99.69252179200001,
      "owned_rss_bytes": 998817792,
      "owned_process_count": 4,
      "reclaimable_bytes": 11964416000,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 99.931015167,
      "owned_rss_bytes": 998834176,
      "owned_process_count": 4,
      "reclaimable_bytes": 11969953792,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 100.176341292,
      "owned_rss_bytes": 999161856,
      "owned_process_count": 4,
      "reclaimable_bytes": 11961335808,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 100.41520345800001,
      "owned_rss_bytes": 1000570880,
      "owned_process_count": 4,
      "reclaimable_bytes": 11960369152,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 100.651209208,
      "owned_rss_bytes": 1001062400,
      "owned_process_count": 4,
      "reclaimable_bytes": 11962302464,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 100.888153,
      "owned_rss_bytes": 1001324544,
      "owned_process_count": 4,
      "reclaimable_bytes": 11964727296,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 101.132305292,
      "owned_rss_bytes": 1001963520,
      "owned_process_count": 4,
      "reclaimable_bytes": 11961794560,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 101.374506292,
      "owned_rss_bytes": 1002078208,
      "owned_process_count": 4,
      "reclaimable_bytes": 11783061504,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 101.610507917,
      "owned_rss_bytes": 1002930176,
      "owned_process_count": 4,
      "reclaimable_bytes": 11784126464,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 101.852967542,
      "owned_rss_bytes": 1003536384,
      "owned_process_count": 4,
      "reclaimable_bytes": 11765268480,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 102.098179333,
      "owned_rss_bytes": 1003569152,
      "owned_process_count": 4,
      "reclaimable_bytes": 11831623680,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 102.333170333,
      "owned_rss_bytes": 1003601920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11841257472,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 102.581100417,
      "owned_rss_bytes": 1003634688,
      "owned_process_count": 4,
      "reclaimable_bytes": 11872567296,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 102.829987667,
      "owned_rss_bytes": 1003683840,
      "owned_process_count": 4,
      "reclaimable_bytes": 11829198848,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 103.080014,
      "owned_rss_bytes": 1003732992,
      "owned_process_count": 4,
      "reclaimable_bytes": 11744198656,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 103.32467775,
      "owned_rss_bytes": 1003814912,
      "owned_process_count": 4,
      "reclaimable_bytes": 11654774784,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 103.566223542,
      "owned_rss_bytes": 1004240896,
      "owned_process_count": 4,
      "reclaimable_bytes": 11547705344,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 103.81631191700001,
      "owned_rss_bytes": 1004290048,
      "owned_process_count": 4,
      "reclaimable_bytes": 11645190144,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 104.067515,
      "owned_rss_bytes": 1004634112,
      "owned_process_count": 4,
      "reclaimable_bytes": 11777310720,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 104.316834292,
      "owned_rss_bytes": 1004634112,
      "owned_process_count": 4,
      "reclaimable_bytes": 11720015872,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 104.567158,
      "owned_rss_bytes": 1004683264,
      "owned_process_count": 4,
      "reclaimable_bytes": 11880415232,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 104.818617042,
      "owned_rss_bytes": 1004699648,
      "owned_process_count": 4,
      "reclaimable_bytes": 11826216960,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 105.062120875,
      "owned_rss_bytes": 1005928448,
      "owned_process_count": 4,
      "reclaimable_bytes": 11824660480,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 105.309741167,
      "owned_rss_bytes": 1006174208,
      "owned_process_count": 4,
      "reclaimable_bytes": 11781292032,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 105.55651575,
      "owned_rss_bytes": 1006305280,
      "owned_process_count": 4,
      "reclaimable_bytes": 11788795904,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 105.797609958,
      "owned_rss_bytes": 1006305280,
      "owned_process_count": 4,
      "reclaimable_bytes": 11758682112,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 106.050218792,
      "owned_rss_bytes": 1006338048,
      "owned_process_count": 4,
      "reclaimable_bytes": 11755438080,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 106.289414458,
      "owned_rss_bytes": 1006387200,
      "owned_process_count": 4,
      "reclaimable_bytes": 11742412800,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 106.535239625,
      "owned_rss_bytes": 1006485504,
      "owned_process_count": 4,
      "reclaimable_bytes": 11709366272,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 106.774001875,
      "owned_rss_bytes": 1006534656,
      "owned_process_count": 4,
      "reclaimable_bytes": 11640782848,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 107.019788125,
      "owned_rss_bytes": 1006567424,
      "owned_process_count": 4,
      "reclaimable_bytes": 11630493696,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 107.2646405,
      "owned_rss_bytes": 1006747648,
      "owned_process_count": 4,
      "reclaimable_bytes": 11629035520,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 107.504823833,
      "owned_rss_bytes": 1006845952,
      "owned_process_count": 4,
      "reclaimable_bytes": 11579031552,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 107.75662029200001,
      "owned_rss_bytes": 1006895104,
      "owned_process_count": 4,
      "reclaimable_bytes": 11599380480,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 108.00080575,
      "owned_rss_bytes": 1006927872,
      "owned_process_count": 4,
      "reclaimable_bytes": 11546394624,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 108.248992583,
      "owned_rss_bytes": 1006944256,
      "owned_process_count": 4,
      "reclaimable_bytes": 11321704448,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 108.5022215,
      "owned_rss_bytes": 1006944256,
      "owned_process_count": 4,
      "reclaimable_bytes": 11053432832,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 108.745724167,
      "owned_rss_bytes": 1006977024,
      "owned_process_count": 4,
      "reclaimable_bytes": 11044995072,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 108.992978875,
      "owned_rss_bytes": 1006977024,
      "owned_process_count": 4,
      "reclaimable_bytes": 11034165248,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 109.240739708,
      "owned_rss_bytes": 1006993408,
      "owned_process_count": 4,
      "reclaimable_bytes": 10994647040,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 109.488815792,
      "owned_rss_bytes": 1007009792,
      "owned_process_count": 4,
      "reclaimable_bytes": 10973429760,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 109.741475083,
      "owned_rss_bytes": 1007042560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10965549056,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 109.990849917,
      "owned_rss_bytes": 1008533504,
      "owned_process_count": 4,
      "reclaimable_bytes": 10943397888,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 110.242544958,
      "owned_rss_bytes": 1008812032,
      "owned_process_count": 4,
      "reclaimable_bytes": 10973331456,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 110.49319283300001,
      "owned_rss_bytes": 1009090560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10968317952,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 110.73899383300001,
      "owned_rss_bytes": 1053065216,
      "owned_process_count": 4,
      "reclaimable_bytes": 10923606016,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 110.988654542,
      "owned_rss_bytes": 1130151936,
      "owned_process_count": 4,
      "reclaimable_bytes": 10818011136,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 111.23575541700001,
      "owned_rss_bytes": 1229733888,
      "owned_process_count": 4,
      "reclaimable_bytes": 10709106688,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 111.483916667,
      "owned_rss_bytes": 1318961152,
      "owned_process_count": 4,
      "reclaimable_bytes": 10669621248,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 111.732361625,
      "owned_rss_bytes": 1398702080,
      "owned_process_count": 4,
      "reclaimable_bytes": 10595319808,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 111.987350292,
      "owned_rss_bytes": 1408712704,
      "owned_process_count": 4,
      "reclaimable_bytes": 10592370688,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 112.248254875,
      "owned_rss_bytes": 1408827392,
      "owned_process_count": 4,
      "reclaimable_bytes": 10550427648,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 112.504470208,
      "owned_rss_bytes": 1410678784,
      "owned_process_count": 4,
      "reclaimable_bytes": 10548379648,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 112.747288375,
      "owned_rss_bytes": 1411203072,
      "owned_process_count": 4,
      "reclaimable_bytes": 10704273408,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 113.002698208,
      "owned_rss_bytes": 1376813056,
      "owned_process_count": 4,
      "reclaimable_bytes": 10721116160,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 113.244808375,
      "owned_rss_bytes": 200065024,
      "owned_process_count": 4,
      "reclaimable_bytes": 11793317888,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 113.499688917,
      "owned_rss_bytes": 256229376,
      "owned_process_count": 4,
      "reclaimable_bytes": 11775901696,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 113.75216900000001,
      "owned_rss_bytes": 270811136,
      "owned_process_count": 4,
      "reclaimable_bytes": 11738841088,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 114.004150167,
      "owned_rss_bytes": 281214976,
      "owned_process_count": 4,
      "reclaimable_bytes": 11757928448,
      "swapins": 44112843,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 114.248238375,
      "owned_rss_bytes": 314900480,
      "owned_process_count": 4,
      "reclaimable_bytes": 11716214784,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 114.491382292,
      "owned_rss_bytes": 330448896,
      "owned_process_count": 4,
      "reclaimable_bytes": 12490866688,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 114.739103583,
      "owned_rss_bytes": 338165760,
      "owned_process_count": 4,
      "reclaimable_bytes": 12576980992,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 114.977824458,
      "owned_rss_bytes": 350420992,
      "owned_process_count": 4,
      "reclaimable_bytes": 12565479424,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 115.221530792,
      "owned_rss_bytes": 364347392,
      "owned_process_count": 4,
      "reclaimable_bytes": 12553043968,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 115.46954637500001,
      "owned_rss_bytes": 374210560,
      "owned_process_count": 4,
      "reclaimable_bytes": 12466782208,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 115.73048475,
      "owned_rss_bytes": 387170304,
      "owned_process_count": 4,
      "reclaimable_bytes": 12439502848,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 115.973568042,
      "owned_rss_bytes": 403619840,
      "owned_process_count": 4,
      "reclaimable_bytes": 12422103040,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 116.216075,
      "owned_rss_bytes": 408600576,
      "owned_process_count": 4,
      "reclaimable_bytes": 12413960192,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 116.466170667,
      "owned_rss_bytes": 418299904,
      "owned_process_count": 4,
      "reclaimable_bytes": 12405997568,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 116.712668625,
      "owned_rss_bytes": 428294144,
      "owned_process_count": 4,
      "reclaimable_bytes": 12396707840,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 116.954990792,
      "owned_rss_bytes": 438550528,
      "owned_process_count": 4,
      "reclaimable_bytes": 12378177536,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 117.201783667,
      "owned_rss_bytes": 444121088,
      "owned_process_count": 4,
      "reclaimable_bytes": 12372475904,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 117.452330583,
      "owned_rss_bytes": 449445888,
      "owned_process_count": 4,
      "reclaimable_bytes": 12358352896,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 117.702735792,
      "owned_rss_bytes": 451493888,
      "owned_process_count": 4,
      "reclaimable_bytes": 12347146240,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 117.952696708,
      "owned_rss_bytes": 452280320,
      "owned_process_count": 4,
      "reclaimable_bytes": 12158386176,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 118.201003042,
      "owned_rss_bytes": 453443584,
      "owned_process_count": 4,
      "reclaimable_bytes": 12157009920,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 118.443825917,
      "owned_rss_bytes": 456048640,
      "owned_process_count": 4,
      "reclaimable_bytes": 12155748352,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 118.691911167,
      "owned_rss_bytes": 460324864,
      "owned_process_count": 4,
      "reclaimable_bytes": 12149506048,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 118.942548083,
      "owned_rss_bytes": 462012416,
      "owned_process_count": 4,
      "reclaimable_bytes": 12145737728,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 119.189616375,
      "owned_rss_bytes": 462077952,
      "owned_process_count": 4,
      "reclaimable_bytes": 12311330816,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 119.428451458,
      "owned_rss_bytes": 464568320,
      "owned_process_count": 4,
      "reclaimable_bytes": 12300271616,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 119.67244587500001,
      "owned_rss_bytes": 467648512,
      "owned_process_count": 4,
      "reclaimable_bytes": 12313214976,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 119.921603833,
      "owned_rss_bytes": 472498176,
      "owned_process_count": 4,
      "reclaimable_bytes": 12315410432,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 120.166362292,
      "owned_rss_bytes": 474120192,
      "owned_process_count": 4,
      "reclaimable_bytes": 12449693696,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 120.40635387500001,
      "owned_rss_bytes": 474218496,
      "owned_process_count": 4,
      "reclaimable_bytes": 12335628288,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 120.651766208,
      "owned_rss_bytes": 474841088,
      "owned_process_count": 4,
      "reclaimable_bytes": 12297699328,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 120.89969525000001,
      "owned_rss_bytes": 475152384,
      "owned_process_count": 4,
      "reclaimable_bytes": 12288409600,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 121.142642583,
      "owned_rss_bytes": 475267072,
      "owned_process_count": 4,
      "reclaimable_bytes": 12277153792,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 121.389993667,
      "owned_rss_bytes": 475742208,
      "owned_process_count": 4,
      "reclaimable_bytes": 12289032192,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 121.643541458,
      "owned_rss_bytes": 475742208,
      "owned_process_count": 4,
      "reclaimable_bytes": 12286836736,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 121.89586654200001,
      "owned_rss_bytes": 475987968,
      "owned_process_count": 4,
      "reclaimable_bytes": 12290129920,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 122.14667975,
      "owned_rss_bytes": 476168192,
      "owned_process_count": 4,
      "reclaimable_bytes": 12284362752,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 122.390371875,
      "owned_rss_bytes": 476446720,
      "owned_process_count": 4,
      "reclaimable_bytes": 12282658816,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 122.639618583,
      "owned_rss_bytes": 511377408,
      "owned_process_count": 4,
      "reclaimable_bytes": 12232065024,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 122.894644583,
      "owned_rss_bytes": 611188736,
      "owned_process_count": 4,
      "reclaimable_bytes": 12154404864,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 123.1444765,
      "owned_rss_bytes": 231030784,
      "owned_process_count": 4,
      "reclaimable_bytes": 12482527232,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 123.391425833,
      "owned_rss_bytes": 308903936,
      "owned_process_count": 4,
      "reclaimable_bytes": 12459622400,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 123.643011708,
      "owned_rss_bytes": 314408960,
      "owned_process_count": 4,
      "reclaimable_bytes": 12457820160,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 123.89409291700001,
      "owned_rss_bytes": 322093056,
      "owned_process_count": 4,
      "reclaimable_bytes": 12448858112,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 124.133722375,
      "owned_rss_bytes": 331694080,
      "owned_process_count": 4,
      "reclaimable_bytes": 12437831680,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 124.37966287500001,
      "owned_rss_bytes": 347734016,
      "owned_process_count": 4,
      "reclaimable_bytes": 12420726784,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 124.620981958,
      "owned_rss_bytes": 366034944,
      "owned_process_count": 4,
      "reclaimable_bytes": 12396019712,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 124.868796292,
      "owned_rss_bytes": 377618432,
      "owned_process_count": 4,
      "reclaimable_bytes": 12382224384,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 125.112130583,
      "owned_rss_bytes": 392871936,
      "owned_process_count": 4,
      "reclaimable_bytes": 12358139904,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 125.36672433300001,
      "owned_rss_bytes": 395247616,
      "owned_process_count": 4,
      "reclaimable_bytes": 12360286208,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 125.61636825000001,
      "owned_rss_bytes": 402276352,
      "owned_process_count": 4,
      "reclaimable_bytes": 12367052800,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 125.88330904200001,
      "owned_rss_bytes": 412745728,
      "owned_process_count": 4,
      "reclaimable_bytes": 12358434816,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 126.128705333,
      "owned_rss_bytes": 416890880,
      "owned_process_count": 4,
      "reclaimable_bytes": 12353060864,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 126.377432375,
      "owned_rss_bytes": 418496512,
      "owned_process_count": 4,
      "reclaimable_bytes": 12353028096,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 126.625844625,
      "owned_rss_bytes": 418791424,
      "owned_process_count": 4,
      "reclaimable_bytes": 12347621376,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 126.86846654200001,
      "owned_rss_bytes": 418889728,
      "owned_process_count": 4,
      "reclaimable_bytes": 12428296192,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 127.11031733300001,
      "owned_rss_bytes": 422150144,
      "owned_process_count": 4,
      "reclaimable_bytes": 12397051904,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 127.35368704199999,
      "owned_rss_bytes": 422330368,
      "owned_process_count": 4,
      "reclaimable_bytes": 12368396288,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 127.60275741699999,
      "owned_rss_bytes": 422821888,
      "owned_process_count": 4,
      "reclaimable_bytes": 12338462720,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 127.849889708,
      "owned_rss_bytes": 424034304,
      "owned_process_count": 4,
      "reclaimable_bytes": 12336660480,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 128.09380775,
      "owned_rss_bytes": 425492480,
      "owned_process_count": 4,
      "reclaimable_bytes": 12340822016,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 128.349367167,
      "owned_rss_bytes": 428539904,
      "owned_process_count": 4,
      "reclaimable_bytes": 12331614208,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 128.598054875,
      "owned_rss_bytes": 428621824,
      "owned_process_count": 4,
      "reclaimable_bytes": 12335628288,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 128.848814667,
      "owned_rss_bytes": 430325760,
      "owned_process_count": 4,
      "reclaimable_bytes": 12332367872,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 129.100389708,
      "owned_rss_bytes": 430604288,
      "owned_process_count": 4,
      "reclaimable_bytes": 12335235072,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 129.35101170800002,
      "owned_rss_bytes": 430669824,
      "owned_process_count": 4,
      "reclaimable_bytes": 12338413568,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 129.60901525,
      "owned_rss_bytes": 430899200,
      "owned_process_count": 4,
      "reclaimable_bytes": 12335759360,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 129.86442125,
      "owned_rss_bytes": 431013888,
      "owned_process_count": 4,
      "reclaimable_bytes": 12339118080,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 130.114663667,
      "owned_rss_bytes": 431554560,
      "owned_process_count": 4,
      "reclaimable_bytes": 12340740096,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 130.36637725,
      "owned_rss_bytes": 459407360,
      "owned_process_count": 4,
      "reclaimable_bytes": 12305219584,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 130.613044083,
      "owned_rss_bytes": 486326272,
      "owned_process_count": 4,
      "reclaimable_bytes": 12283428864,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 130.864944167,
      "owned_rss_bytes": 500400128,
      "owned_process_count": 4,
      "reclaimable_bytes": 12275613696,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 131.10529962500001,
      "owned_rss_bytes": 561299456,
      "owned_process_count": 4,
      "reclaimable_bytes": 12214960128,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 131.353250333,
      "owned_rss_bytes": 576290816,
      "owned_process_count": 4,
      "reclaimable_bytes": 12208668672,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 131.602793083,
      "owned_rss_bytes": 577028096,
      "owned_process_count": 4,
      "reclaimable_bytes": 12204949504,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 131.84944050000001,
      "owned_rss_bytes": 577257472,
      "owned_process_count": 4,
      "reclaimable_bytes": 12204605440,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 132.09852825000002,
      "owned_rss_bytes": 577290240,
      "owned_process_count": 4,
      "reclaimable_bytes": 12204965888,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 132.349225625,
      "owned_rss_bytes": 577470464,
      "owned_process_count": 4,
      "reclaimable_bytes": 12189450240,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 132.599692708,
      "owned_rss_bytes": 579207168,
      "owned_process_count": 4,
      "reclaimable_bytes": 12202344448,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 132.847333583,
      "owned_rss_bytes": 581533696,
      "owned_process_count": 4,
      "reclaimable_bytes": 12203671552,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 133.093061167,
      "owned_rss_bytes": 582156288,
      "owned_process_count": 4,
      "reclaimable_bytes": 12201820160,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 133.33183533300001,
      "owned_rss_bytes": 584482816,
      "owned_process_count": 4,
      "reclaimable_bytes": 12199067648,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 133.573649083,
      "owned_rss_bytes": 591937536,
      "owned_process_count": 4,
      "reclaimable_bytes": 12195594240,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 133.819045458,
      "owned_rss_bytes": 597098496,
      "owned_process_count": 4,
      "reclaimable_bytes": 12180619264,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 134.066285833,
      "owned_rss_bytes": 604274688,
      "owned_process_count": 4,
      "reclaimable_bytes": 12171624448,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 134.30675837500002,
      "owned_rss_bytes": 604700672,
      "owned_process_count": 4,
      "reclaimable_bytes": 12177276928,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 134.556623875,
      "owned_rss_bytes": 610516992,
      "owned_process_count": 4,
      "reclaimable_bytes": 12172722176,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 134.802091125,
      "owned_rss_bytes": 616693760,
      "owned_process_count": 4,
      "reclaimable_bytes": 12163563520,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 135.051882333,
      "owned_rss_bytes": 624771072,
      "owned_process_count": 4,
      "reclaimable_bytes": 12156633088,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 135.300969208,
      "owned_rss_bytes": 624918528,
      "owned_process_count": 4,
      "reclaimable_bytes": 12151521280,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 135.552270833,
      "owned_rss_bytes": 629080064,
      "owned_process_count": 4,
      "reclaimable_bytes": 12233883648,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 135.791673583,
      "owned_rss_bytes": 634617856,
      "owned_process_count": 4,
      "reclaimable_bytes": 12221104128,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 136.0374955,
      "owned_rss_bytes": 635043840,
      "owned_process_count": 4,
      "reclaimable_bytes": 12160761856,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 136.287176583,
      "owned_rss_bytes": 639074304,
      "owned_process_count": 4,
      "reclaimable_bytes": 12112003072,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 136.536396292,
      "owned_rss_bytes": 642007040,
      "owned_process_count": 4,
      "reclaimable_bytes": 12111265792,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 136.787961583,
      "owned_rss_bytes": 642138112,
      "owned_process_count": 4,
      "reclaimable_bytes": 12090720256,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 137.0362605,
      "owned_rss_bytes": 646414336,
      "owned_process_count": 4,
      "reclaimable_bytes": 12083740672,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 137.287519083,
      "owned_rss_bytes": 648970240,
      "owned_process_count": 4,
      "reclaimable_bytes": 12083937280,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 137.533599167,
      "owned_rss_bytes": 650543104,
      "owned_process_count": 4,
      "reclaimable_bytes": 12081577984,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 137.783059667,
      "owned_rss_bytes": 652935168,
      "owned_process_count": 4,
      "reclaimable_bytes": 12080316416,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 138.033020708,
      "owned_rss_bytes": 655278080,
      "owned_process_count": 4,
      "reclaimable_bytes": 12079202304,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 138.283863833,
      "owned_rss_bytes": 655343616,
      "owned_process_count": 4,
      "reclaimable_bytes": 12074483712,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 138.528425417,
      "owned_rss_bytes": 655638528,
      "owned_process_count": 4,
      "reclaimable_bytes": 12077203456,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 138.779945375,
      "owned_rss_bytes": 657473536,
      "owned_process_count": 4,
      "reclaimable_bytes": 12079841280,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 139.023171083,
      "owned_rss_bytes": 659128320,
      "owned_process_count": 4,
      "reclaimable_bytes": 12073238528,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 139.26635587500002,
      "owned_rss_bytes": 659521536,
      "owned_process_count": 4,
      "reclaimable_bytes": 12071796736,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 139.52026075,
      "owned_rss_bytes": 663011328,
      "owned_process_count": 4,
      "reclaimable_bytes": 12072452096,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 139.766486167,
      "owned_rss_bytes": 666648576,
      "owned_process_count": 4,
      "reclaimable_bytes": 11951800320,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 140.0069265,
      "owned_rss_bytes": 666796032,
      "owned_process_count": 4,
      "reclaimable_bytes": 11943772160,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 140.252721708,
      "owned_rss_bytes": 668516352,
      "owned_process_count": 4,
      "reclaimable_bytes": 11951308800,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 140.503925958,
      "owned_rss_bytes": 669564928,
      "owned_process_count": 4,
      "reclaimable_bytes": 11995774976,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 140.750195708,
      "owned_rss_bytes": 671514624,
      "owned_process_count": 4,
      "reclaimable_bytes": 11809062912,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 140.996138292,
      "owned_rss_bytes": 674152448,
      "owned_process_count": 4,
      "reclaimable_bytes": 11804147712,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 141.238939125,
      "owned_rss_bytes": 674512896,
      "owned_process_count": 4,
      "reclaimable_bytes": 11803394048,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 141.485903667,
      "owned_rss_bytes": 678526976,
      "owned_process_count": 4,
      "reclaimable_bytes": 11794776064,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 141.731408542,
      "owned_rss_bytes": 679182336,
      "owned_process_count": 4,
      "reclaimable_bytes": 11799658496,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 141.977178792,
      "owned_rss_bytes": 680181760,
      "owned_process_count": 4,
      "reclaimable_bytes": 11974295552,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 142.222838375,
      "owned_rss_bytes": 681656320,
      "owned_process_count": 4,
      "reclaimable_bytes": 11974819840,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 142.471596958,
      "owned_rss_bytes": 685375488,
      "owned_process_count": 4,
      "reclaimable_bytes": 11972018176,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 142.713148833,
      "owned_rss_bytes": 685424640,
      "owned_process_count": 4,
      "reclaimable_bytes": 12057673728,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 142.95830741700001,
      "owned_rss_bytes": 686030848,
      "owned_process_count": 4,
      "reclaimable_bytes": 11993661440,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 143.205106,
      "owned_rss_bytes": 686571520,
      "owned_process_count": 4,
      "reclaimable_bytes": 11719589888,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 143.45543666700001,
      "owned_rss_bytes": 688439296,
      "owned_process_count": 4,
      "reclaimable_bytes": 11729453056,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 143.700073833,
      "owned_rss_bytes": 689717248,
      "owned_process_count": 4,
      "reclaimable_bytes": 11727732736,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 143.945594833,
      "owned_rss_bytes": 690667520,
      "owned_process_count": 4,
      "reclaimable_bytes": 11728404480,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 144.187019375,
      "owned_rss_bytes": 690716672,
      "owned_process_count": 4,
      "reclaimable_bytes": 11809226752,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 144.4259445,
      "owned_rss_bytes": 691683328,
      "owned_process_count": 4,
      "reclaimable_bytes": 11949408256,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 144.66940375000001,
      "owned_rss_bytes": 692699136,
      "owned_process_count": 4,
      "reclaimable_bytes": 11910053888,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 144.916386083,
      "owned_rss_bytes": 695042048,
      "owned_process_count": 4,
      "reclaimable_bytes": 11898617856,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 145.165573292,
      "owned_rss_bytes": 696352768,
      "owned_process_count": 4,
      "reclaimable_bytes": 11892211712,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 145.41101,
      "owned_rss_bytes": 696729600,
      "owned_process_count": 4,
      "reclaimable_bytes": 11892162560,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 145.659850167,
      "owned_rss_bytes": 699105280,
      "owned_process_count": 4,
      "reclaimable_bytes": 11889655808,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 145.911859542,
      "owned_rss_bytes": 699105280,
      "owned_process_count": 4,
      "reclaimable_bytes": 11881791488,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 146.160127042,
      "owned_rss_bytes": 701153280,
      "owned_process_count": 4,
      "reclaimable_bytes": 11872141312,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 146.410624042,
      "owned_rss_bytes": 706035712,
      "owned_process_count": 4,
      "reclaimable_bytes": 11848007680,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 146.656771375,
      "owned_rss_bytes": 706166784,
      "owned_process_count": 4,
      "reclaimable_bytes": 11847811072,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 146.90529925,
      "owned_rss_bytes": 706904064,
      "owned_process_count": 4,
      "reclaimable_bytes": 11836850176,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 147.153827375,
      "owned_rss_bytes": 715816960,
      "owned_process_count": 4,
      "reclaimable_bytes": 11824070656,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 147.399702583,
      "owned_rss_bytes": 716668928,
      "owned_process_count": 4,
      "reclaimable_bytes": 11813126144,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 147.65039375,
      "owned_rss_bytes": 717078528,
      "owned_process_count": 4,
      "reclaimable_bytes": 11803181056,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 147.899712958,
      "owned_rss_bytes": 721747968,
      "owned_process_count": 4,
      "reclaimable_bytes": 11613192192,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 148.14831445800002,
      "owned_rss_bytes": 722288640,
      "owned_process_count": 4,
      "reclaimable_bytes": 11412127744,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 148.403887375,
      "owned_rss_bytes": 722337792,
      "owned_process_count": 4,
      "reclaimable_bytes": 11408031744,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 148.644972417,
      "owned_rss_bytes": 722354176,
      "owned_process_count": 4,
      "reclaimable_bytes": 11416289280,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 148.894646833,
      "owned_rss_bytes": 724500480,
      "owned_process_count": 4,
      "reclaimable_bytes": 11573526528,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 149.145921375,
      "owned_rss_bytes": 725942272,
      "owned_process_count": 4,
      "reclaimable_bytes": 11757076480,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 149.39776137500002,
      "owned_rss_bytes": 726433792,
      "owned_process_count": 4,
      "reclaimable_bytes": 11735318528,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 149.6448005,
      "owned_rss_bytes": 727187456,
      "owned_process_count": 4,
      "reclaimable_bytes": 11739348992,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 149.90009,
      "owned_rss_bytes": 728514560,
      "owned_process_count": 4,
      "reclaimable_bytes": 11770544128,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 150.152050417,
      "owned_rss_bytes": 730824704,
      "owned_process_count": 4,
      "reclaimable_bytes": 11770216448,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 150.396374333,
      "owned_rss_bytes": 730824704,
      "owned_process_count": 4,
      "reclaimable_bytes": 11767398400,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 150.6446245,
      "owned_rss_bytes": 731217920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11762401280,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 150.891114375,
      "owned_rss_bytes": 732954624,
      "owned_process_count": 4,
      "reclaimable_bytes": 11764531200,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 151.144006375,
      "owned_rss_bytes": 733298688,
      "owned_process_count": 4,
      "reclaimable_bytes": 11765743616,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 151.390300792,
      "owned_rss_bytes": 733773824,
      "owned_process_count": 4,
      "reclaimable_bytes": 11769085952,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 151.633706417,
      "owned_rss_bytes": 734167040,
      "owned_process_count": 4,
      "reclaimable_bytes": 11769987072,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 151.881858292,
      "owned_rss_bytes": 734248960,
      "owned_process_count": 4,
      "reclaimable_bytes": 11765039104,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 152.131854292,
      "owned_rss_bytes": 734494720,
      "owned_process_count": 4,
      "reclaimable_bytes": 11767447552,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 152.373630583,
      "owned_rss_bytes": 734724096,
      "owned_process_count": 4,
      "reclaimable_bytes": 11770380288,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 152.625678833,
      "owned_rss_bytes": 734937088,
      "owned_process_count": 4,
      "reclaimable_bytes": 11586289664,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 152.87734325,
      "owned_rss_bytes": 739213312,
      "owned_process_count": 4,
      "reclaimable_bytes": 11578916864,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 153.124059417,
      "owned_rss_bytes": 739803136,
      "owned_process_count": 4,
      "reclaimable_bytes": 11580293120,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 153.369182458,
      "owned_rss_bytes": 740065280,
      "owned_process_count": 4,
      "reclaimable_bytes": 11657969664,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 153.608202875,
      "owned_rss_bytes": 740179968,
      "owned_process_count": 4,
      "reclaimable_bytes": 11615682560,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 153.855497292,
      "owned_rss_bytes": 740245504,
      "owned_process_count": 4,
      "reclaimable_bytes": 11773509632,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 154.097089542,
      "owned_rss_bytes": 740278272,
      "owned_process_count": 4,
      "reclaimable_bytes": 11738939392,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 154.346517625,
      "owned_rss_bytes": 740294656,
      "owned_process_count": 4,
      "reclaimable_bytes": 11733401600,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 154.592191875,
      "owned_rss_bytes": 741949440,
      "owned_process_count": 4,
      "reclaimable_bytes": 11732090880,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 154.83280625,
      "owned_rss_bytes": 746258432,
      "owned_process_count": 4,
      "reclaimable_bytes": 11730862080,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 155.083037875,
      "owned_rss_bytes": 746373120,
      "owned_process_count": 4,
      "reclaimable_bytes": 11790925824,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 155.33602675,
      "owned_rss_bytes": 746389504,
      "owned_process_count": 4,
      "reclaimable_bytes": 11802492928,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 155.58498979200002,
      "owned_rss_bytes": 746553344,
      "owned_process_count": 4,
      "reclaimable_bytes": 11803754496,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 155.831824375,
      "owned_rss_bytes": 755187712,
      "owned_process_count": 4,
      "reclaimable_bytes": 11858821120,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 156.0829355,
      "owned_rss_bytes": 756498432,
      "owned_process_count": 4,
      "reclaimable_bytes": 11865735168,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 156.326948417,
      "owned_rss_bytes": 757497856,
      "owned_process_count": 4,
      "reclaimable_bytes": 11868897280,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 156.56935925,
      "owned_rss_bytes": 758792192,
      "owned_process_count": 4,
      "reclaimable_bytes": 11882528768,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 156.81527575,
      "owned_rss_bytes": 759119872,
      "owned_process_count": 4,
      "reclaimable_bytes": 11884363776,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 157.05514995800002,
      "owned_rss_bytes": 759119872,
      "owned_process_count": 4,
      "reclaimable_bytes": 11878563840,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 157.302881667,
      "owned_rss_bytes": 759185408,
      "owned_process_count": 4,
      "reclaimable_bytes": 11890786304,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 157.543406833,
      "owned_rss_bytes": 760086528,
      "owned_process_count": 4,
      "reclaimable_bytes": 11889754112,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 157.793309667,
      "owned_rss_bytes": 760086528,
      "owned_process_count": 4,
      "reclaimable_bytes": 11888132096,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 158.0483175,
      "owned_rss_bytes": 760086528,
      "owned_process_count": 4,
      "reclaimable_bytes": 11888361472,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 158.300479083,
      "owned_rss_bytes": 760086528,
      "owned_process_count": 4,
      "reclaimable_bytes": 11892867072,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 158.548808583,
      "owned_rss_bytes": 760086528,
      "owned_process_count": 4,
      "reclaimable_bytes": 11891703808,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 158.799882625,
      "owned_rss_bytes": 760315904,
      "owned_process_count": 4,
      "reclaimable_bytes": 11889213440,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 159.038946083,
      "owned_rss_bytes": 763084800,
      "owned_process_count": 4,
      "reclaimable_bytes": 11892228096,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 159.284281042,
      "owned_rss_bytes": 763084800,
      "owned_process_count": 4,
      "reclaimable_bytes": 11896307712,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 159.52211025,
      "owned_rss_bytes": 763559936,
      "owned_process_count": 4,
      "reclaimable_bytes": 11888443392,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 159.77132650000001,
      "owned_rss_bytes": 763625472,
      "owned_process_count": 4,
      "reclaimable_bytes": 11890753536,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 160.018609667,
      "owned_rss_bytes": 763625472,
      "owned_process_count": 4,
      "reclaimable_bytes": 11894620160,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 160.269553083,
      "owned_rss_bytes": 763625472,
      "owned_process_count": 4,
      "reclaimable_bytes": 11894620160,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 160.515480208,
      "owned_rss_bytes": 763625472,
      "owned_process_count": 4,
      "reclaimable_bytes": 11890180096,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 160.754623583,
      "owned_rss_bytes": 763625472,
      "owned_process_count": 4,
      "reclaimable_bytes": 11891556352,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 160.995183042,
      "owned_rss_bytes": 763625472,
      "owned_process_count": 4,
      "reclaimable_bytes": 11891654656,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 161.238877667,
      "owned_rss_bytes": 763985920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11908055040,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 161.486611417,
      "owned_rss_bytes": 763985920,
      "owned_process_count": 4,
      "reclaimable_bytes": 12019597312,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 161.722485375,
      "owned_rss_bytes": 764084224,
      "owned_process_count": 4,
      "reclaimable_bytes": 12025593856,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 161.966368708,
      "owned_rss_bytes": 766148608,
      "owned_process_count": 4,
      "reclaimable_bytes": 12015910912,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 162.2139075,
      "owned_rss_bytes": 767033344,
      "owned_process_count": 4,
      "reclaimable_bytes": 12018089984,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 162.457757167,
      "owned_rss_bytes": 773652480,
      "owned_process_count": 4,
      "reclaimable_bytes": 12128780288,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 162.70269175,
      "owned_rss_bytes": 775340032,
      "owned_process_count": 4,
      "reclaimable_bytes": 12045910016,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 162.940368167,
      "owned_rss_bytes": 775487488,
      "owned_process_count": 4,
      "reclaimable_bytes": 12007374848,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 163.185309083,
      "owned_rss_bytes": 775487488,
      "owned_process_count": 4,
      "reclaimable_bytes": 12015566848,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 163.425045375,
      "owned_rss_bytes": 775487488,
      "owned_process_count": 4,
      "reclaimable_bytes": 12018237440,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 163.674055042,
      "owned_rss_bytes": 775569408,
      "owned_process_count": 4,
      "reclaimable_bytes": 12011896832,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 163.915138917,
      "owned_rss_bytes": 775569408,
      "owned_process_count": 4,
      "reclaimable_bytes": 12010864640,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 164.155838917,
      "owned_rss_bytes": 775569408,
      "owned_process_count": 4,
      "reclaimable_bytes": 12010373120,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 164.399345,
      "owned_rss_bytes": 776241152,
      "owned_process_count": 4,
      "reclaimable_bytes": 12010029056,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 164.639837917,
      "owned_rss_bytes": 776241152,
      "owned_process_count": 4,
      "reclaimable_bytes": 12012077056,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 164.881046167,
      "owned_rss_bytes": 776421376,
      "owned_process_count": 4,
      "reclaimable_bytes": 12008112128,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 165.1321375,
      "owned_rss_bytes": 777240576,
      "owned_process_count": 4,
      "reclaimable_bytes": 12006440960,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 165.375205208,
      "owned_rss_bytes": 777519104,
      "owned_process_count": 4,
      "reclaimable_bytes": 12008570880,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 165.618060042,
      "owned_rss_bytes": 777519104,
      "owned_process_count": 4,
      "reclaimable_bytes": 12006932480,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 165.85806862500002,
      "owned_rss_bytes": 777519104,
      "owned_process_count": 4,
      "reclaimable_bytes": 12012404736,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 166.102800583,
      "owned_rss_bytes": 777519104,
      "owned_process_count": 4,
      "reclaimable_bytes": 12012568576,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 166.344582292,
      "owned_rss_bytes": 777699328,
      "owned_process_count": 4,
      "reclaimable_bytes": 12018876416,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 166.5831685,
      "owned_rss_bytes": 778207232,
      "owned_process_count": 4,
      "reclaimable_bytes": 12015878144,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 166.82754125,
      "owned_rss_bytes": 778797056,
      "owned_process_count": 4,
      "reclaimable_bytes": 12043649024,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 167.081561583,
      "owned_rss_bytes": 779010048,
      "owned_process_count": 4,
      "reclaimable_bytes": 12043485184,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 167.323900458,
      "owned_rss_bytes": 779075584,
      "owned_process_count": 4,
      "reclaimable_bytes": 12045172736,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 167.5654575,
      "owned_rss_bytes": 779698176,
      "owned_process_count": 4,
      "reclaimable_bytes": 12051054592,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 167.813322167,
      "owned_rss_bytes": 780222464,
      "owned_process_count": 4,
      "reclaimable_bytes": 12049842176,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 168.052156958,
      "owned_rss_bytes": 781172736,
      "owned_process_count": 4,
      "reclaimable_bytes": 12046925824,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 168.298236792,
      "owned_rss_bytes": 801030144,
      "owned_process_count": 4,
      "reclaimable_bytes": 12108611584,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 168.539947042,
      "owned_rss_bytes": 802947072,
      "owned_process_count": 4,
      "reclaimable_bytes": 12071796736,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 168.786014,
      "owned_rss_bytes": 806256640,
      "owned_process_count": 4,
      "reclaimable_bytes": 12028198912,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 169.033031875,
      "owned_rss_bytes": 806256640,
      "owned_process_count": 4,
      "reclaimable_bytes": 12004147200,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 169.282463875,
      "owned_rss_bytes": 806584320,
      "owned_process_count": 4,
      "reclaimable_bytes": 12000854016,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 169.530997208,
      "owned_rss_bytes": 806846464,
      "owned_process_count": 4,
      "reclaimable_bytes": 11996987392,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 169.770894667,
      "owned_rss_bytes": 806846464,
      "owned_process_count": 4,
      "reclaimable_bytes": 11990941696,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 170.016028458,
      "owned_rss_bytes": 809418752,
      "owned_process_count": 4,
      "reclaimable_bytes": 11992678400,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 170.265116583,
      "owned_rss_bytes": 809697280,
      "owned_process_count": 4,
      "reclaimable_bytes": 11990433792,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 170.509701833,
      "owned_rss_bytes": 810385408,
      "owned_process_count": 4,
      "reclaimable_bytes": 11992858624,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 170.755195083,
      "owned_rss_bytes": 810385408,
      "owned_process_count": 4,
      "reclaimable_bytes": 12006309888,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 170.993566917,
      "owned_rss_bytes": 811384832,
      "owned_process_count": 4,
      "reclaimable_bytes": 12004065280,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 171.240042917,
      "owned_rss_bytes": 811384832,
      "owned_process_count": 4,
      "reclaimable_bytes": 12002852864,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 171.483370125,
      "owned_rss_bytes": 811384832,
      "owned_process_count": 4,
      "reclaimable_bytes": 12010176512,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 171.723648042,
      "owned_rss_bytes": 812318720,
      "owned_process_count": 4,
      "reclaimable_bytes": 12014764032,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 171.969363125,
      "owned_rss_bytes": 812318720,
      "owned_process_count": 4,
      "reclaimable_bytes": 12012666880,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 172.224494375,
      "owned_rss_bytes": 812335104,
      "owned_process_count": 4,
      "reclaimable_bytes": 12010848256,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 172.467864708,
      "owned_rss_bytes": 812351488,
      "owned_process_count": 4,
      "reclaimable_bytes": 12023398400,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 172.709950042,
      "owned_rss_bytes": 813268992,
      "owned_process_count": 4,
      "reclaimable_bytes": 12024791040,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 172.956288917,
      "owned_rss_bytes": 813809664,
      "owned_process_count": 4,
      "reclaimable_bytes": 12025249792,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 173.206383625,
      "owned_rss_bytes": 819740672,
      "owned_process_count": 4,
      "reclaimable_bytes": 12018630656,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 173.459942458,
      "owned_rss_bytes": 820002816,
      "owned_process_count": 4,
      "reclaimable_bytes": 12177932288,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 173.70600795800001,
      "owned_rss_bytes": 820002816,
      "owned_process_count": 4,
      "reclaimable_bytes": 12179734528,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 173.953812042,
      "owned_rss_bytes": 820002816,
      "owned_process_count": 4,
      "reclaimable_bytes": 12181585920,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 174.189641875,
      "owned_rss_bytes": 820559872,
      "owned_process_count": 4,
      "reclaimable_bytes": 12181372928,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 174.4283455,
      "owned_rss_bytes": 821035008,
      "owned_process_count": 4,
      "reclaimable_bytes": 12259622912,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 174.663411917,
      "owned_rss_bytes": 821035008,
      "owned_process_count": 4,
      "reclaimable_bytes": 12361072640,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 174.901151833,
      "owned_rss_bytes": 821035008,
      "owned_process_count": 4,
      "reclaimable_bytes": 12224888832,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 175.144497792,
      "owned_rss_bytes": 821657600,
      "owned_process_count": 4,
      "reclaimable_bytes": 12205735936,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 175.393111333,
      "owned_rss_bytes": 821657600,
      "owned_process_count": 4,
      "reclaimable_bytes": 12170018816,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 175.638171167,
      "owned_rss_bytes": 823443456,
      "owned_process_count": 4,
      "reclaimable_bytes": 12167397376,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 175.883025542,
      "owned_rss_bytes": 826933248,
      "owned_process_count": 4,
      "reclaimable_bytes": 12170608640,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 176.129384667,
      "owned_rss_bytes": 828243968,
      "owned_process_count": 4,
      "reclaimable_bytes": 12164956160,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 176.369450417,
      "owned_rss_bytes": 828850176,
      "owned_process_count": 4,
      "reclaimable_bytes": 12164595712,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 176.61128675,
      "owned_rss_bytes": 828932096,
      "owned_process_count": 4,
      "reclaimable_bytes": 12168019968,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 176.855922708,
      "owned_rss_bytes": 828932096,
      "owned_process_count": 4,
      "reclaimable_bytes": 12160532480,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 177.10002391700002,
      "owned_rss_bytes": 828932096,
      "owned_process_count": 4,
      "reclaimable_bytes": 12155437056,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 177.345609208,
      "owned_rss_bytes": 829800448,
      "owned_process_count": 4,
      "reclaimable_bytes": 12158189568,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 177.58736554200001,
      "owned_rss_bytes": 829915136,
      "owned_process_count": 4,
      "reclaimable_bytes": 12155371520,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 177.826610833,
      "owned_rss_bytes": 830128128,
      "owned_process_count": 4,
      "reclaimable_bytes": 12158746624,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 178.063673417,
      "owned_rss_bytes": 830128128,
      "owned_process_count": 4,
      "reclaimable_bytes": 12150964224,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 178.303458083,
      "owned_rss_bytes": 830128128,
      "owned_process_count": 4,
      "reclaimable_bytes": 11965136896,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 178.547938125,
      "owned_rss_bytes": 830504960,
      "owned_process_count": 4,
      "reclaimable_bytes": 11968593920,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 178.795194,
      "owned_rss_bytes": 830504960,
      "owned_process_count": 4,
      "reclaimable_bytes": 11967709184,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 179.041335833,
      "owned_rss_bytes": 830898176,
      "owned_process_count": 4,
      "reclaimable_bytes": 11962531840,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 179.288099708,
      "owned_rss_bytes": 830898176,
      "owned_process_count": 4,
      "reclaimable_bytes": 12119621632,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 179.530028167,
      "owned_rss_bytes": 830898176,
      "owned_process_count": 4,
      "reclaimable_bytes": 12112068608,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 179.776630167,
      "owned_rss_bytes": 830898176,
      "owned_process_count": 4,
      "reclaimable_bytes": 12131385344,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 180.019134583,
      "owned_rss_bytes": 831668224,
      "owned_process_count": 4,
      "reclaimable_bytes": 12130811904,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 180.26348454200001,
      "owned_rss_bytes": 837484544,
      "owned_process_count": 4,
      "reclaimable_bytes": 12124192768,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 180.512920708,
      "owned_rss_bytes": 837484544,
      "owned_process_count": 4,
      "reclaimable_bytes": 12126126080,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 180.755551333,
      "owned_rss_bytes": 837795840,
      "owned_process_count": 4,
      "reclaimable_bytes": 12133400576,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 180.99351525,
      "owned_rss_bytes": 837795840,
      "owned_process_count": 4,
      "reclaimable_bytes": 12215091200,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 181.232099167,
      "owned_rss_bytes": 837828608,
      "owned_process_count": 4,
      "reclaimable_bytes": 12165677056,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 181.477618458,
      "owned_rss_bytes": 837828608,
      "owned_process_count": 4,
      "reclaimable_bytes": 12110364672,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 181.716358125,
      "owned_rss_bytes": 838008832,
      "owned_process_count": 4,
      "reclaimable_bytes": 12108152832,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 181.960204667,
      "owned_rss_bytes": 838008832,
      "owned_process_count": 4,
      "reclaimable_bytes": 12109201408,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 182.196778667,
      "owned_rss_bytes": 838008832,
      "owned_process_count": 4,
      "reclaimable_bytes": 12107169792,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 182.431707292,
      "owned_rss_bytes": 838008832,
      "owned_process_count": 4,
      "reclaimable_bytes": 12108546048,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 182.679798583,
      "owned_rss_bytes": 838008832,
      "owned_process_count": 4,
      "reclaimable_bytes": 12099731456,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 182.918466542,
      "owned_rss_bytes": 838025216,
      "owned_process_count": 4,
      "reclaimable_bytes": 12103385088,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 183.155249583,
      "owned_rss_bytes": 838860800,
      "owned_process_count": 4,
      "reclaimable_bytes": 12105400320,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 183.395079583,
      "owned_rss_bytes": 839139328,
      "owned_process_count": 4,
      "reclaimable_bytes": 12101976064,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 183.640799667,
      "owned_rss_bytes": 839139328,
      "owned_process_count": 4,
      "reclaimable_bytes": 12074401792,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 183.88142150000002,
      "owned_rss_bytes": 839335936,
      "owned_process_count": 4,
      "reclaimable_bytes": 12084772864,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 184.118681833,
      "owned_rss_bytes": 839368704,
      "owned_process_count": 4,
      "reclaimable_bytes": 12093341696,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 184.360519917,
      "owned_rss_bytes": 839958528,
      "owned_process_count": 4,
      "reclaimable_bytes": 12093079552,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 184.603663042,
      "owned_rss_bytes": 841957376,
      "owned_process_count": 4,
      "reclaimable_bytes": 12094128128,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 184.843263708,
      "owned_rss_bytes": 842022912,
      "owned_process_count": 4,
      "reclaimable_bytes": 12090048512,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 185.089611542,
      "owned_rss_bytes": 842366976,
      "owned_process_count": 4,
      "reclaimable_bytes": 12088246272,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 185.347774458,
      "owned_rss_bytes": 842448896,
      "owned_process_count": 4,
      "reclaimable_bytes": 12096389120,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 185.590096833,
      "owned_rss_bytes": 842612736,
      "owned_process_count": 4,
      "reclaimable_bytes": 12098404352,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 185.83321575,
      "owned_rss_bytes": 842727424,
      "owned_process_count": 4,
      "reclaimable_bytes": 12048875520,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 186.083337542,
      "owned_rss_bytes": 843644928,
      "owned_process_count": 4,
      "reclaimable_bytes": 12001263616,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 186.33490833300002,
      "owned_rss_bytes": 843644928,
      "owned_process_count": 4,
      "reclaimable_bytes": 11998396416,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 186.575395917,
      "owned_rss_bytes": 843644928,
      "owned_process_count": 4,
      "reclaimable_bytes": 12019236864,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 186.833032417,
      "owned_rss_bytes": 843644928,
      "owned_process_count": 4,
      "reclaimable_bytes": 12015665152,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 187.079142458,
      "owned_rss_bytes": 854638592,
      "owned_process_count": 4,
      "reclaimable_bytes": 12001001472,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 187.324837208,
      "owned_rss_bytes": 860356608,
      "owned_process_count": 4,
      "reclaimable_bytes": 12000051200,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 187.567138083,
      "owned_rss_bytes": 860946432,
      "owned_process_count": 4,
      "reclaimable_bytes": 11995660288,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 187.803948917,
      "owned_rss_bytes": 860946432,
      "owned_process_count": 4,
      "reclaimable_bytes": 12001656832,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 188.042953625,
      "owned_rss_bytes": 860946432,
      "owned_process_count": 4,
      "reclaimable_bytes": 11998216192,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 188.278633375,
      "owned_rss_bytes": 861028352,
      "owned_process_count": 4,
      "reclaimable_bytes": 12000149504,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 188.526850708,
      "owned_rss_bytes": 861421568,
      "owned_process_count": 4,
      "reclaimable_bytes": 11997691904,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 188.771441125,
      "owned_rss_bytes": 861421568,
      "owned_process_count": 4,
      "reclaimable_bytes": 12000722944,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 189.019333125,
      "owned_rss_bytes": 862273536,
      "owned_process_count": 4,
      "reclaimable_bytes": 12004687872,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 189.26730125,
      "owned_rss_bytes": 862289920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11955650560,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 189.514092417,
      "owned_rss_bytes": 862289920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11934138368,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 189.752687375,
      "owned_rss_bytes": 862289920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11928141824,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 189.998995667,
      "owned_rss_bytes": 862289920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11916247040,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 190.248893667,
      "owned_rss_bytes": 862289920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11925274624,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 190.49651500000002,
      "owned_rss_bytes": 862289920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11917508608,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 190.743709,
      "owned_rss_bytes": 862289920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11999363072,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 190.988673625,
      "owned_rss_bytes": 862322688,
      "owned_process_count": 4,
      "reclaimable_bytes": 11991597056,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 191.235198958,
      "owned_rss_bytes": 862322688,
      "owned_process_count": 4,
      "reclaimable_bytes": 11988484096,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 191.481371,
      "owned_rss_bytes": 862322688,
      "owned_process_count": 4,
      "reclaimable_bytes": 11940167680,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 191.72840787500002,
      "owned_rss_bytes": 862568448,
      "owned_process_count": 4,
      "reclaimable_bytes": 11932286976,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 191.97572775,
      "owned_rss_bytes": 862765056,
      "owned_process_count": 4,
      "reclaimable_bytes": 11922407424,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 192.228299792,
      "owned_rss_bytes": 862896128,
      "owned_process_count": 4,
      "reclaimable_bytes": 11912609792,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 192.475091875,
      "owned_rss_bytes": 862978048,
      "owned_process_count": 4,
      "reclaimable_bytes": 11908153344,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 192.721723125,
      "owned_rss_bytes": 862994432,
      "owned_process_count": 4,
      "reclaimable_bytes": 11907891200,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 192.968663958,
      "owned_rss_bytes": 863584256,
      "owned_process_count": 4,
      "reclaimable_bytes": 11901124608,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 193.21881529200002,
      "owned_rss_bytes": 863584256,
      "owned_process_count": 4,
      "reclaimable_bytes": 11899387904,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 193.465662583,
      "owned_rss_bytes": 863600640,
      "owned_process_count": 4,
      "reclaimable_bytes": 11894554624,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 193.712526625,
      "owned_rss_bytes": 864157696,
      "owned_process_count": 4,
      "reclaimable_bytes": 11891720192,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 193.960121375,
      "owned_rss_bytes": 864321536,
      "owned_process_count": 4,
      "reclaimable_bytes": 11887624192,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 194.199587083,
      "owned_rss_bytes": 864321536,
      "owned_process_count": 4,
      "reclaimable_bytes": 11546411008,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 194.447792958,
      "owned_rss_bytes": 864321536,
      "owned_process_count": 4,
      "reclaimable_bytes": 11336564736,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 194.697035667,
      "owned_rss_bytes": 864501760,
      "owned_process_count": 4,
      "reclaimable_bytes": 11016273920,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 194.947557542,
      "owned_rss_bytes": 864501760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10781868032,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 195.200158292,
      "owned_rss_bytes": 864501760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10657087488,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 195.446311833,
      "owned_rss_bytes": 864501760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10588602368,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 195.688116,
      "owned_rss_bytes": 864501760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10486333440,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 195.931503167,
      "owned_rss_bytes": 864501760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10417946624,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 196.169729458,
      "owned_rss_bytes": 864501760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10365468672,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 196.412873833,
      "owned_rss_bytes": 864501760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10304749568,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 196.659223583,
      "owned_rss_bytes": 864518144,
      "owned_process_count": 4,
      "reclaimable_bytes": 10244653056,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 196.906269458,
      "owned_rss_bytes": 864518144,
      "owned_process_count": 4,
      "reclaimable_bytes": 10185408512,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 197.143907875,
      "owned_rss_bytes": 864550912,
      "owned_process_count": 4,
      "reclaimable_bytes": 10126229504,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 197.382160417,
      "owned_rss_bytes": 864731136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10037248000,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 197.630298167,
      "owned_rss_bytes": 864763904,
      "owned_process_count": 4,
      "reclaimable_bytes": 9984851968,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 197.871494208,
      "owned_rss_bytes": 864780288,
      "owned_process_count": 4,
      "reclaimable_bytes": 9941336064,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 198.124096708,
      "owned_rss_bytes": 864780288,
      "owned_process_count": 4,
      "reclaimable_bytes": 9889611776,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 198.373659583,
      "owned_rss_bytes": 864780288,
      "owned_process_count": 4,
      "reclaimable_bytes": 9840476160,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 198.62803925,
      "owned_rss_bytes": 864780288,
      "owned_process_count": 4,
      "reclaimable_bytes": 9786212352,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 198.877860792,
      "owned_rss_bytes": 864780288,
      "owned_process_count": 4,
      "reclaimable_bytes": 9735110656,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 199.118405083,
      "owned_rss_bytes": 865730560,
      "owned_process_count": 4,
      "reclaimable_bytes": 9677520896,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 199.357743042,
      "owned_rss_bytes": 866025472,
      "owned_process_count": 4,
      "reclaimable_bytes": 9669672960,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 199.601263083,
      "owned_rss_bytes": 866025472,
      "owned_process_count": 4,
      "reclaimable_bytes": 9473507328,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 199.847085833,
      "owned_rss_bytes": 866025472,
      "owned_process_count": 4,
      "reclaimable_bytes": 9398370304,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 200.088014625,
      "owned_rss_bytes": 866025472,
      "owned_process_count": 4,
      "reclaimable_bytes": 9375186944,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 200.332736292,
      "owned_rss_bytes": 866025472,
      "owned_process_count": 4,
      "reclaimable_bytes": 9371631616,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 200.582731708,
      "owned_rss_bytes": 866025472,
      "owned_process_count": 4,
      "reclaimable_bytes": 9371123712,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 200.825368667,
      "owned_rss_bytes": 866025472,
      "owned_process_count": 4,
      "reclaimable_bytes": 9146138624,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 201.076022333,
      "owned_rss_bytes": 866648064,
      "owned_process_count": 4,
      "reclaimable_bytes": 9063514112,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 201.32093137500001,
      "owned_rss_bytes": 866648064,
      "owned_process_count": 4,
      "reclaimable_bytes": 8969240576,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 201.566406,
      "owned_rss_bytes": 866648064,
      "owned_process_count": 4,
      "reclaimable_bytes": 8868364288,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 201.811178458,
      "owned_rss_bytes": 866648064,
      "owned_process_count": 4,
      "reclaimable_bytes": 8770846720,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 202.05868075,
      "owned_rss_bytes": 866648064,
      "owned_process_count": 4,
      "reclaimable_bytes": 8670642176,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 202.306130458,
      "owned_rss_bytes": 866992128,
      "owned_process_count": 4,
      "reclaimable_bytes": 8595406848,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 202.544633792,
      "owned_rss_bytes": 866992128,
      "owned_process_count": 4,
      "reclaimable_bytes": 8517730304,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 202.783045792,
      "owned_rss_bytes": 866992128,
      "owned_process_count": 4,
      "reclaimable_bytes": 8703557632,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 203.027145083,
      "owned_rss_bytes": 866992128,
      "owned_process_count": 4,
      "reclaimable_bytes": 8847081472,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 203.277842333,
      "owned_rss_bytes": 866992128,
      "owned_process_count": 4,
      "reclaimable_bytes": 8847966208,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 203.520672792,
      "owned_rss_bytes": 866992128,
      "owned_process_count": 4,
      "reclaimable_bytes": 8783560704,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 203.766827083,
      "owned_rss_bytes": 866992128,
      "owned_process_count": 4,
      "reclaimable_bytes": 8492859392,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 204.023218667,
      "owned_rss_bytes": 866992128,
      "owned_process_count": 4,
      "reclaimable_bytes": 8478081024,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 204.273776875,
      "owned_rss_bytes": 867008512,
      "owned_process_count": 4,
      "reclaimable_bytes": 8445624320,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 204.523106292,
      "owned_rss_bytes": 867008512,
      "owned_process_count": 4,
      "reclaimable_bytes": 8427225088,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 204.771507625,
      "owned_rss_bytes": 867008512,
      "owned_process_count": 4,
      "reclaimable_bytes": 8412659712,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 205.020153292,
      "owned_rss_bytes": 867008512,
      "owned_process_count": 4,
      "reclaimable_bytes": 8575156224,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 205.262116542,
      "owned_rss_bytes": 867172352,
      "owned_process_count": 4,
      "reclaimable_bytes": 8563261440,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 205.504866292,
      "owned_rss_bytes": 867221504,
      "owned_process_count": 4,
      "reclaimable_bytes": 8544272384,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 205.751608458,
      "owned_rss_bytes": 867254272,
      "owned_process_count": 4,
      "reclaimable_bytes": 8496496640,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 205.991795458,
      "owned_rss_bytes": 867270656,
      "owned_process_count": 4,
      "reclaimable_bytes": 8450670592,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 206.238002917,
      "owned_rss_bytes": 867287040,
      "owned_process_count": 4,
      "reclaimable_bytes": 8419540992,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 206.486794792,
      "owned_rss_bytes": 867418112,
      "owned_process_count": 4,
      "reclaimable_bytes": 8369766400,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 206.734670083,
      "owned_rss_bytes": 867418112,
      "owned_process_count": 4,
      "reclaimable_bytes": 8317485056,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 206.974253417,
      "owned_rss_bytes": 867549184,
      "owned_process_count": 4,
      "reclaimable_bytes": 8247787520,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 207.216361833,
      "owned_rss_bytes": 867549184,
      "owned_process_count": 4,
      "reclaimable_bytes": 8167211008,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 207.46040825,
      "owned_rss_bytes": 867565568,
      "owned_process_count": 4,
      "reclaimable_bytes": 8110424064,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 207.712405417,
      "owned_rss_bytes": 868122624,
      "owned_process_count": 4,
      "reclaimable_bytes": 8076771328,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 207.961713292,
      "owned_rss_bytes": 868122624,
      "owned_process_count": 4,
      "reclaimable_bytes": 8041725952,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 208.20548475,
      "owned_rss_bytes": 868122624,
      "owned_process_count": 4,
      "reclaimable_bytes": 7842594816,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 208.442840708,
      "owned_rss_bytes": 868204544,
      "owned_process_count": 4,
      "reclaimable_bytes": 7788396544,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 208.687475625,
      "owned_rss_bytes": 868335616,
      "owned_process_count": 4,
      "reclaimable_bytes": 7765671936,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 208.933456042,
      "owned_rss_bytes": 868335616,
      "owned_process_count": 4,
      "reclaimable_bytes": 7732019200,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 209.177194417,
      "owned_rss_bytes": 868335616,
      "owned_process_count": 4,
      "reclaimable_bytes": 7795408896,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 209.42717875,
      "owned_rss_bytes": 868352000,
      "owned_process_count": 4,
      "reclaimable_bytes": 7943667712,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 209.676513375,
      "owned_rss_bytes": 868352000,
      "owned_process_count": 4,
      "reclaimable_bytes": 7855095808,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 209.916348583,
      "owned_rss_bytes": 868352000,
      "owned_process_count": 4,
      "reclaimable_bytes": 7877902336,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 210.171296667,
      "owned_rss_bytes": 868352000,
      "owned_process_count": 4,
      "reclaimable_bytes": 7866286080,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 210.410896958,
      "owned_rss_bytes": 868368384,
      "owned_process_count": 4,
      "reclaimable_bytes": 7780515840,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 210.658916,
      "owned_rss_bytes": 868368384,
      "owned_process_count": 4,
      "reclaimable_bytes": 7748796416,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 210.904393667,
      "owned_rss_bytes": 868368384,
      "owned_process_count": 4,
      "reclaimable_bytes": 7730298880,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 211.151608,
      "owned_rss_bytes": 868384768,
      "owned_process_count": 4,
      "reclaimable_bytes": 7684784128,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 211.404619708,
      "owned_rss_bytes": 868384768,
      "owned_process_count": 4,
      "reclaimable_bytes": 9955672064,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 211.651067625,
      "owned_rss_bytes": 868401152,
      "owned_process_count": 4,
      "reclaimable_bytes": 9961816064,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 211.894737708,
      "owned_rss_bytes": 868401152,
      "owned_process_count": 4,
      "reclaimable_bytes": 9963913216,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 212.138562208,
      "owned_rss_bytes": 868401152,
      "owned_process_count": 4,
      "reclaimable_bytes": 9962635264,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 212.379913042,
      "owned_rss_bytes": 868450304,
      "owned_process_count": 4,
      "reclaimable_bytes": 11631640576,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 212.622317542,
      "owned_rss_bytes": 868450304,
      "owned_process_count": 4,
      "reclaimable_bytes": 11619827712,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 212.862914542,
      "owned_rss_bytes": 868450304,
      "owned_process_count": 4,
      "reclaimable_bytes": 11611914240,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 213.10995045800001,
      "owned_rss_bytes": 868450304,
      "owned_process_count": 4,
      "reclaimable_bytes": 11604738048,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 213.360790833,
      "owned_rss_bytes": 868450304,
      "owned_process_count": 4,
      "reclaimable_bytes": 11598069760,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 213.609549208,
      "owned_rss_bytes": 868450304,
      "owned_process_count": 4,
      "reclaimable_bytes": 11592155136,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 213.857312875,
      "owned_rss_bytes": 868466688,
      "owned_process_count": 4,
      "reclaimable_bytes": 11581194240,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 214.105181792,
      "owned_rss_bytes": 868466688,
      "owned_process_count": 4,
      "reclaimable_bytes": 11576819712,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 214.354874583,
      "owned_rss_bytes": 868499456,
      "owned_process_count": 4,
      "reclaimable_bytes": 11558273024,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 214.60264625,
      "owned_rss_bytes": 868499456,
      "owned_process_count": 4,
      "reclaimable_bytes": 11557044224,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 214.850483375,
      "owned_rss_bytes": 868532224,
      "owned_process_count": 4,
      "reclaimable_bytes": 11694800896,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 215.098400083,
      "owned_rss_bytes": 868532224,
      "owned_process_count": 4,
      "reclaimable_bytes": 11580817408,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 215.345293958,
      "owned_rss_bytes": 868581376,
      "owned_process_count": 4,
      "reclaimable_bytes": 11526553600,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 215.594783375,
      "owned_rss_bytes": 868581376,
      "owned_process_count": 4,
      "reclaimable_bytes": 11519246336,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 215.843036292,
      "owned_rss_bytes": 868581376,
      "owned_process_count": 4,
      "reclaimable_bytes": 11507236864,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 216.090754208,
      "owned_rss_bytes": 868581376,
      "owned_process_count": 4,
      "reclaimable_bytes": 11501928448,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 216.339003125,
      "owned_rss_bytes": 868581376,
      "owned_process_count": 4,
      "reclaimable_bytes": 11486855168,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 216.5872845,
      "owned_rss_bytes": 868581376,
      "owned_process_count": 4,
      "reclaimable_bytes": 11490344960,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 216.836180875,
      "owned_rss_bytes": 868581376,
      "owned_process_count": 4,
      "reclaimable_bytes": 11483987968,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 217.086030583,
      "owned_rss_bytes": 868581376,
      "owned_process_count": 4,
      "reclaimable_bytes": 11480039424,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 217.33415075,
      "owned_rss_bytes": 868581376,
      "owned_process_count": 4,
      "reclaimable_bytes": 11471060992,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 217.585627958,
      "owned_rss_bytes": 868958208,
      "owned_process_count": 4,
      "reclaimable_bytes": 11465097216,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 217.826341542,
      "owned_rss_bytes": 869203968,
      "owned_process_count": 4,
      "reclaimable_bytes": 11461705728,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 218.074884125,
      "owned_rss_bytes": 902053888,
      "owned_process_count": 4,
      "reclaimable_bytes": 11424153600,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 218.317039542,
      "owned_rss_bytes": 982269952,
      "owned_process_count": 4,
      "reclaimable_bytes": 11248353280,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 218.56833516700001,
      "owned_rss_bytes": 1066958848,
      "owned_process_count": 4,
      "reclaimable_bytes": 11048747008,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 218.843590458,
      "owned_rss_bytes": 1100005376,
      "owned_process_count": 4,
      "reclaimable_bytes": 10645520384,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 219.092124792,
      "owned_rss_bytes": 107151360,
      "owned_process_count": 3,
      "reclaimable_bytes": 12247023616,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 219.342309125,
      "owned_rss_bytes": 270974976,
      "owned_process_count": 4,
      "reclaimable_bytes": 12242173952,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 219.591845333,
      "owned_rss_bytes": 326156288,
      "owned_process_count": 4,
      "reclaimable_bytes": 12200771584,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 219.84052675,
      "owned_rss_bytes": 332496896,
      "owned_process_count": 4,
      "reclaimable_bytes": 12197462016,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 220.087201167,
      "owned_rss_bytes": 337379328,
      "owned_process_count": 4,
      "reclaimable_bytes": 12189466624,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 220.333059375,
      "owned_rss_bytes": 346767360,
      "owned_process_count": 4,
      "reclaimable_bytes": 12184076288,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 220.569974542,
      "owned_rss_bytes": 357924864,
      "owned_process_count": 4,
      "reclaimable_bytes": 12164988928,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 220.814314125,
      "owned_rss_bytes": 406896640,
      "owned_process_count": 4,
      "reclaimable_bytes": 12133974016,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 221.055556875,
      "owned_rss_bytes": 408453120,
      "owned_process_count": 4,
      "reclaimable_bytes": 12136038400,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 221.300342792,
      "owned_rss_bytes": 413351936,
      "owned_process_count": 4,
      "reclaimable_bytes": 12132007936,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 221.540504875,
      "owned_rss_bytes": 428736512,
      "owned_process_count": 4,
      "reclaimable_bytes": 12111282176,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 221.783032292,
      "owned_rss_bytes": 436174848,
      "owned_process_count": 4,
      "reclaimable_bytes": 12110266368,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 222.02697750000002,
      "owned_rss_bytes": 446332928,
      "owned_process_count": 4,
      "reclaimable_bytes": 12096012288,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 222.268809417,
      "owned_rss_bytes": 456097792,
      "owned_process_count": 4,
      "reclaimable_bytes": 12091408384,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 222.511732125,
      "owned_rss_bytes": 464060416,
      "owned_process_count": 4,
      "reclaimable_bytes": 12225150976,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 222.753426875,
      "owned_rss_bytes": 473923584,
      "owned_process_count": 4,
      "reclaimable_bytes": 12110217216,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 222.9912815,
      "owned_rss_bytes": 481263616,
      "owned_process_count": 4,
      "reclaimable_bytes": 12069765120,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 223.230500208,
      "owned_rss_bytes": 485310464,
      "owned_process_count": 4,
      "reclaimable_bytes": 12057591808,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 223.473762542,
      "owned_rss_bytes": 487587840,
      "owned_process_count": 4,
      "reclaimable_bytes": 12053807104,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 223.716353167,
      "owned_rss_bytes": 513441792,
      "owned_process_count": 4,
      "reclaimable_bytes": 12026724352,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 223.953209917,
      "owned_rss_bytes": 514080768,
      "owned_process_count": 4,
      "reclaimable_bytes": 12017516544,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 224.200115375,
      "owned_rss_bytes": 516980736,
      "owned_process_count": 4,
      "reclaimable_bytes": 12014485504,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 224.448290708,
      "owned_rss_bytes": 518389760,
      "owned_process_count": 4,
      "reclaimable_bytes": 12011110400,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 224.695342458,
      "owned_rss_bytes": 522731520,
      "owned_process_count": 4,
      "reclaimable_bytes": 11991367680,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 224.943024125,
      "owned_rss_bytes": 524206080,
      "owned_process_count": 4,
      "reclaimable_bytes": 11975524352,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 225.190082625,
      "owned_rss_bytes": 527777792,
      "owned_process_count": 4,
      "reclaimable_bytes": 11973443584,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 225.440157625,
      "owned_rss_bytes": 529448960,
      "owned_process_count": 4,
      "reclaimable_bytes": 11971592192,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 225.686643,
      "owned_rss_bytes": 535216128,
      "owned_process_count": 4,
      "reclaimable_bytes": 11948867584,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 225.931400333,
      "owned_rss_bytes": 535707648,
      "owned_process_count": 4,
      "reclaimable_bytes": 11955060736,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 226.179606833,
      "owned_rss_bytes": 540213248,
      "owned_process_count": 4,
      "reclaimable_bytes": 11945885696,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 226.427135583,
      "owned_rss_bytes": 540622848,
      "owned_process_count": 4,
      "reclaimable_bytes": 11940446208,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 226.669364708,
      "owned_rss_bytes": 540688384,
      "owned_process_count": 4,
      "reclaimable_bytes": 11931582464,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 226.908369583,
      "owned_rss_bytes": 540737536,
      "owned_process_count": 4,
      "reclaimable_bytes": 11926749184,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 227.156353458,
      "owned_rss_bytes": 541065216,
      "owned_process_count": 4,
      "reclaimable_bytes": 11916853248,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 227.402431208,
      "owned_rss_bytes": 541261824,
      "owned_process_count": 4,
      "reclaimable_bytes": 11910971392,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 227.643922417,
      "owned_rss_bytes": 541360128,
      "owned_process_count": 4,
      "reclaimable_bytes": 11900551168,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 227.88933170800001,
      "owned_rss_bytes": 541376512,
      "owned_process_count": 4,
      "reclaimable_bytes": 11894718464,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 228.138731167,
      "owned_rss_bytes": 541769728,
      "owned_process_count": 4,
      "reclaimable_bytes": 11889197056,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 228.384634417,
      "owned_rss_bytes": 542113792,
      "owned_process_count": 4,
      "reclaimable_bytes": 11879022592,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 228.623864583,
      "owned_rss_bytes": 542195712,
      "owned_process_count": 4,
      "reclaimable_bytes": 11869192192,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 228.870011708,
      "owned_rss_bytes": 594116608,
      "owned_process_count": 4,
      "reclaimable_bytes": 11806261248,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 229.118636083,
      "owned_rss_bytes": 143966208,
      "owned_process_count": 4,
      "reclaimable_bytes": 12117213184,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 229.365613,
      "owned_rss_bytes": 299630592,
      "owned_process_count": 4,
      "reclaimable_bytes": 12055330816,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 229.613794292,
      "owned_rss_bytes": 335724544,
      "owned_process_count": 4,
      "reclaimable_bytes": 12036685824,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 229.85265950000002,
      "owned_rss_bytes": 352501760,
      "owned_process_count": 4,
      "reclaimable_bytes": 12025151488,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 230.098882083,
      "owned_rss_bytes": 362872832,
      "owned_process_count": 4,
      "reclaimable_bytes": 12014780416,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 230.33919170800002,
      "owned_rss_bytes": 368623616,
      "owned_process_count": 4,
      "reclaimable_bytes": 12001148928,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 230.58466125,
      "owned_rss_bytes": 376569856,
      "owned_process_count": 4,
      "reclaimable_bytes": 11986550784,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 230.830381333,
      "owned_rss_bytes": 382844928,
      "owned_process_count": 4,
      "reclaimable_bytes": 11984486400,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 231.07477416700002,
      "owned_rss_bytes": 398245888,
      "owned_process_count": 4,
      "reclaimable_bytes": 11965546496,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 231.316977375,
      "owned_rss_bytes": 411369472,
      "owned_process_count": 4,
      "reclaimable_bytes": 12040962048,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 231.557319125,
      "owned_rss_bytes": 429785088,
      "owned_process_count": 4,
      "reclaimable_bytes": 11969298432,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 231.804796583,
      "owned_rss_bytes": 431276032,
      "owned_process_count": 4,
      "reclaimable_bytes": 11927076864,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 232.045923708,
      "owned_rss_bytes": 433733632,
      "owned_process_count": 4,
      "reclaimable_bytes": 11908907008,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 232.29670325,
      "owned_rss_bytes": 440532992,
      "owned_process_count": 4,
      "reclaimable_bytes": 11900583936,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 232.546115583,
      "owned_rss_bytes": 445759488,
      "owned_process_count": 4,
      "reclaimable_bytes": 11890851840,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 232.792762125,
      "owned_rss_bytes": 445775872,
      "owned_process_count": 4,
      "reclaimable_bytes": 11881332736,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 233.036595958,
      "owned_rss_bytes": 446939136,
      "owned_process_count": 4,
      "reclaimable_bytes": 11873075200,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 233.28635929200001,
      "owned_rss_bytes": 451575808,
      "owned_process_count": 4,
      "reclaimable_bytes": 11874746368,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 233.53533612500001,
      "owned_rss_bytes": 452198400,
      "owned_process_count": 4,
      "reclaimable_bytes": 11872534528,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 233.779287792,
      "owned_rss_bytes": 452476928,
      "owned_process_count": 4,
      "reclaimable_bytes": 11870371840,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 234.017187625,
      "owned_rss_bytes": 452673536,
      "owned_process_count": 4,
      "reclaimable_bytes": 11862065152,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 234.25557054200002,
      "owned_rss_bytes": 452706304,
      "owned_process_count": 4,
      "reclaimable_bytes": 12013895680,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 234.500567542,
      "owned_rss_bytes": 452722688,
      "owned_process_count": 4,
      "reclaimable_bytes": 12019941376,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 234.743704625,
      "owned_rss_bytes": 453148672,
      "owned_process_count": 4,
      "reclaimable_bytes": 12015304704,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 234.985712042,
      "owned_rss_bytes": 453476352,
      "owned_process_count": 4,
      "reclaimable_bytes": 12007538688,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 235.230496625,
      "owned_rss_bytes": 114982912,
      "owned_process_count": 3,
      "reclaimable_bytes": 12190056448,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 235.474875417,
      "owned_rss_bytes": 293552128,
      "owned_process_count": 4,
      "reclaimable_bytes": 12113641472,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 235.722072583,
      "owned_rss_bytes": 335052800,
      "owned_process_count": 4,
      "reclaimable_bytes": 12086165504,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 235.970232708,
      "owned_rss_bytes": 341917696,
      "owned_process_count": 4,
      "reclaimable_bytes": 12081348608,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 236.218721625,
      "owned_rss_bytes": 103874560,
      "owned_process_count": 3,
      "reclaimable_bytes": 12171673600,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 236.45612475000001,
      "owned_rss_bytes": 462782464,
      "owned_process_count": 5,
      "reclaimable_bytes": 11918082048,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 236.697471208,
      "owned_rss_bytes": 151961600,
      "owned_process_count": 4,
      "reclaimable_bytes": 12133285888,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 236.944169833,
      "owned_rss_bytes": 296632320,
      "owned_process_count": 4,
      "reclaimable_bytes": 12075597824,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 237.192819792,
      "owned_rss_bytes": 419577856,
      "owned_process_count": 4,
      "reclaimable_bytes": 11995152384,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 237.43235462500002,
      "owned_rss_bytes": 496664576,
      "owned_process_count": 4,
      "reclaimable_bytes": 11928764416,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 237.678004875,
      "owned_rss_bytes": 643219456,
      "owned_process_count": 4,
      "reclaimable_bytes": 11774509056,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 237.923690667,
      "owned_rss_bytes": 806256640,
      "owned_process_count": 4,
      "reclaimable_bytes": 11607064576,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 238.168190917,
      "owned_rss_bytes": 989233152,
      "owned_process_count": 4,
      "reclaimable_bytes": 11396366336,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 238.413034583,
      "owned_rss_bytes": 1260224512,
      "owned_process_count": 4,
      "reclaimable_bytes": 10984636416,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 238.651171125,
      "owned_rss_bytes": 1197473792,
      "owned_process_count": 4,
      "reclaimable_bytes": 11058331648,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 238.893828917,
      "owned_rss_bytes": 1216987136,
      "owned_process_count": 4,
      "reclaimable_bytes": 11030790144,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 239.139189958,
      "owned_rss_bytes": 1231536128,
      "owned_process_count": 4,
      "reclaimable_bytes": 11061936128,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 239.38302825,
      "owned_rss_bytes": 1231716352,
      "owned_process_count": 4,
      "reclaimable_bytes": 11061084160,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 239.629697625,
      "owned_rss_bytes": 1269202944,
      "owned_process_count": 4,
      "reclaimable_bytes": 11181113344,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 239.880410958,
      "owned_rss_bytes": 1280999424,
      "owned_process_count": 4,
      "reclaimable_bytes": 11188142080,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 240.129063417,
      "owned_rss_bytes": 1288994816,
      "owned_process_count": 4,
      "reclaimable_bytes": 11215929344,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 240.376705917,
      "owned_rss_bytes": 1292664832,
      "owned_process_count": 4,
      "reclaimable_bytes": 11235491840,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 240.627623542,
      "owned_rss_bytes": 1300512768,
      "owned_process_count": 4,
      "reclaimable_bytes": 11228971008,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 240.873417542,
      "owned_rss_bytes": 1309130752,
      "owned_process_count": 4,
      "reclaimable_bytes": 11219877888,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 241.116286583,
      "owned_rss_bytes": 1317208064,
      "owned_process_count": 4,
      "reclaimable_bytes": 11196039168,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 241.366685917,
      "owned_rss_bytes": 1325367296,
      "owned_process_count": 4,
      "reclaimable_bytes": 11191402496,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 241.609161125,
      "owned_rss_bytes": 1335967744,
      "owned_process_count": 4,
      "reclaimable_bytes": 11368759296,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 241.858222375,
      "owned_rss_bytes": 1350139904,
      "owned_process_count": 4,
      "reclaimable_bytes": 11360681984,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 242.099849,
      "owned_rss_bytes": 1367834624,
      "owned_process_count": 4,
      "reclaimable_bytes": 11338678272,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 242.343548083,
      "owned_rss_bytes": 1374191616,
      "owned_process_count": 4,
      "reclaimable_bytes": 11311513600,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 242.592300625,
      "owned_rss_bytes": 343982080,
      "owned_process_count": 5,
      "reclaimable_bytes": 12352192512,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 242.837925833,
      "owned_rss_bytes": 178208768,
      "owned_process_count": 4,
      "reclaimable_bytes": 12430655488,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 243.078875625,
      "owned_rss_bytes": 434192384,
      "owned_process_count": 4,
      "reclaimable_bytes": 12334235648,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 243.326159542,
      "owned_rss_bytes": 584450048,
      "owned_process_count": 4,
      "reclaimable_bytes": 12200902656,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 243.574740917,
      "owned_rss_bytes": 779173888,
      "owned_process_count": 4,
      "reclaimable_bytes": 12024201216,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 243.815897042,
      "owned_rss_bytes": 1024606208,
      "owned_process_count": 4,
      "reclaimable_bytes": 11802460160,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 244.05478325,
      "owned_rss_bytes": 1185857536,
      "owned_process_count": 4,
      "reclaimable_bytes": 11630903296,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 244.29761870800002,
      "owned_rss_bytes": 1140146176,
      "owned_process_count": 4,
      "reclaimable_bytes": 11729092608,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 244.540433917,
      "owned_rss_bytes": 1178501120,
      "owned_process_count": 4,
      "reclaimable_bytes": 11697029120,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 244.778159417,
      "owned_rss_bytes": 1182646272,
      "owned_process_count": 4,
      "reclaimable_bytes": 11690246144,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 245.0284835,
      "owned_rss_bytes": 1234550784,
      "owned_process_count": 4,
      "reclaimable_bytes": 11637161984,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 245.270412833,
      "owned_rss_bytes": 1263222784,
      "owned_process_count": 4,
      "reclaimable_bytes": 11612717056,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 245.506295792,
      "owned_rss_bytes": 1277837312,
      "owned_process_count": 4,
      "reclaimable_bytes": 11604164608,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 245.74574816700002,
      "owned_rss_bytes": 1280311296,
      "owned_process_count": 4,
      "reclaimable_bytes": 11601297408,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 245.983330208,
      "owned_rss_bytes": 1288994816,
      "owned_process_count": 4,
      "reclaimable_bytes": 11592318976,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 246.22743400000002,
      "owned_rss_bytes": 1295663104,
      "owned_process_count": 4,
      "reclaimable_bytes": 11586453504,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 246.472876208,
      "owned_rss_bytes": 1301217280,
      "owned_process_count": 4,
      "reclaimable_bytes": 11574181888,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 246.714135292,
      "owned_rss_bytes": 1310621696,
      "owned_process_count": 4,
      "reclaimable_bytes": 11573854208,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 246.961394667,
      "owned_rss_bytes": 1324875776,
      "owned_process_count": 4,
      "reclaimable_bytes": 11556945920,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 247.200110792,
      "owned_rss_bytes": 1339473920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11545280512,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 247.442818458,
      "owned_rss_bytes": 1348780032,
      "owned_process_count": 4,
      "reclaimable_bytes": 11525668864,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 247.68174925,
      "owned_rss_bytes": 140689408,
      "owned_process_count": 4,
      "reclaimable_bytes": 12538331136,
      "swapins": 44112847,
      "swapouts": 77525566
    },
    {
      "elapsed_seconds": 247.927226833,
      "owned_rss_bytes": 16809984,
      "owned_process_count": 2,
      "reclaimable_bytes": 12535988224,
      "swapins": 44112847,
      "swapouts": 77525566
    }
  ],
  "passed": true,
  "classification": "serial build only; not model qualification",
  "child_pid": 30701,
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12547293184,
    "swapins": 44112847,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   168844.\nPages active:                                 907501.\nPages inactive:                               840879.\nPages speculative:                             98895.\nPages throttled:                                   0.\nPages wired down:                             282363.\nPages purgeable:                               15816.\n\"Translation faults\":                    15452253707.\nPages copy-on-write:                       737790136.\nPages zero filled:                       21240422026.\nPages reactivated:                        3471601089.\nPages purged:                               72284437.\nFile-backed pages:                            581166.\nAnonymous pages:                             1266109.\nPages stored in compressor:                  1909531.\nPages occupied by compressor:                 785968.\nDecompressions:                           1172711292.\nCompressions:                             1487781276.\nPageins:                                  7622751548.\nPageouts:                                   11084606.\nSwapins:                                    44112847.\nSwapouts:                                   77525566.\nPages tagged:                                 186624.\nPages tagged resident:                        139158.\nPages tagged compressed:                       47466.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8477.\nPages tag-storage free:                         1442.\nPages tag-storage non-tag pageable:            87794.\nPages tag-storage non-tag wired:                 591.\nBytes of compressed tags:                    6977152.\nTagged compressions:                        11282230.\nTagged decompressions:                      10402730.\n"
  },
  "remaining_owned_members": [],
  "owned_groups": [
    30701
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 248.250432542,
  "child_exit_code": 0,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12545540096,
    "swapins": 44112847,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   168723.\nPages active:                                 907551.\nPages inactive:                               840879.\nPages speculative:                             98909.\nPages throttled:                                   0.\nPages wired down:                             282363.\nPages purgeable:                               15816.\n\"Translation faults\":                    15452260189.\nPages copy-on-write:                       737791015.\nPages zero filled:                       21240425270.\nPages reactivated:                        3471601089.\nPages purged:                               72284437.\nFile-backed pages:                            581180.\nAnonymous pages:                             1266159.\nPages stored in compressor:                  1909531.\nPages occupied by compressor:                 785968.\nDecompressions:                           1172711292.\nCompressions:                             1487781276.\nPageins:                                  7622751555.\nPageouts:                                   11084606.\nSwapins:                                    44112847.\nSwapouts:                                   77525566.\nPages tagged:                                 186624.\nPages tagged resident:                        139158.\nPages tagged compressed:                       47466.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8477.\nPages tag-storage free:                         1438.\nPages tag-storage non-tag pageable:            87798.\nPages tag-storage non-tag wired:                 591.\nBytes of compressed tags:                    6977152.\nTagged compressions:                        11282230.\nTagged decompressions:                      10402730.\n"
  }
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/live-memory.samples.jsonl

SHA-256 `e4d4e982c20568acebe9197084751fbd5a3098d175d6c8118e68592f066d5872`; 170280 bytes.

````text
{"elapsed_seconds": 0.0026958750000000142, "owned_rss_bytes": 6602752, "owned_process_count": 1, "reclaimable_bytes": 14472642560, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 0.24492187499999996, "owned_rss_bytes": 24330240, "owned_process_count": 3, "reclaimable_bytes": 14468300800, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 0.4926507499999999, "owned_rss_bytes": 50479104, "owned_process_count": 3, "reclaimable_bytes": 14155612160, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 0.745086417, "owned_rss_bytes": 68599808, "owned_process_count": 2, "reclaimable_bytes": 14180401152, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 0.9909833749999999, "owned_rss_bytes": 71024640, "owned_process_count": 2, "reclaimable_bytes": 14162198528, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 1.234293167, "owned_rss_bytes": 71335936, "owned_process_count": 2, "reclaimable_bytes": 14228013056, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 1.4819012079999998, "owned_rss_bytes": 73613312, "owned_process_count": 2, "reclaimable_bytes": 14245298176, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 1.731285875, "owned_rss_bytes": 95076352, "owned_process_count": 3, "reclaimable_bytes": 14180139008, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 1.9782051669999998, "owned_rss_bytes": 95109120, "owned_process_count": 2, "reclaimable_bytes": 14144667648, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 2.2299746249999997, "owned_rss_bytes": 95109120, "owned_process_count": 2, "reclaimable_bytes": 14142816256, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 2.4714864170000004, "owned_rss_bytes": 95125504, "owned_process_count": 2, "reclaimable_bytes": 14412890112, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 2.7163608750000003, "owned_rss_bytes": 107282432, "owned_process_count": 2, "reclaimable_bytes": 14393737216, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 2.965854042, "owned_rss_bytes": 172457984, "owned_process_count": 4, "reclaimable_bytes": 14359461888, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 3.2163239169999995, "owned_rss_bytes": 239534080, "owned_process_count": 4, "reclaimable_bytes": 14029881344, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 3.4670984579999997, "owned_rss_bytes": 215859200, "owned_process_count": 4, "reclaimable_bytes": 14040219648, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 3.7136657499999997, "owned_rss_bytes": 248283136, "owned_process_count": 4, "reclaimable_bytes": 14020083712, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 3.957054542, "owned_rss_bytes": 262881280, "owned_process_count": 4, "reclaimable_bytes": 13997703168, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 4.195202458, "owned_rss_bytes": 192561152, "owned_process_count": 4, "reclaimable_bytes": 14163886080, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 4.435795917, "owned_rss_bytes": 279199744, "owned_process_count": 4, "reclaimable_bytes": 14025457664, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 4.685129333, "owned_rss_bytes": 301268992, "owned_process_count": 4, "reclaimable_bytes": 13977337856, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 4.932147208, "owned_rss_bytes": 307609600, "owned_process_count": 4, "reclaimable_bytes": 13963247616, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 5.179190375, "owned_rss_bytes": 205799424, "owned_process_count": 4, "reclaimable_bytes": 14022787072, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 5.427366666999999, "owned_rss_bytes": 230031360, "owned_process_count": 4, "reclaimable_bytes": 13996408832, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 5.679417375, "owned_rss_bytes": 247889920, "owned_process_count": 4, "reclaimable_bytes": 13978910720, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 5.9298839999999995, "owned_rss_bytes": 277037056, "owned_process_count": 4, "reclaimable_bytes": 13965787136, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 6.177268499999999, "owned_rss_bytes": 289964032, "owned_process_count": 4, "reclaimable_bytes": 13952090112, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 6.423788957999999, "owned_rss_bytes": 298631168, "owned_process_count": 4, "reclaimable_bytes": 13944782848, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 6.663211542, "owned_rss_bytes": 304349184, "owned_process_count": 4, "reclaimable_bytes": 13941489664, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 6.9157965, "owned_rss_bytes": 312246272, "owned_process_count": 4, "reclaimable_bytes": 13941030912, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 7.175176667, "owned_rss_bytes": 312803328, "owned_process_count": 4, "reclaimable_bytes": 13941833728, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 7.422834707999999, "owned_rss_bytes": 364429312, "owned_process_count": 4, "reclaimable_bytes": 13882458112, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 7.6712032080000006, "owned_rss_bytes": 223526912, "owned_process_count": 4, "reclaimable_bytes": 14008205312, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 7.911819582999999, "owned_rss_bytes": 293666816, "owned_process_count": 4, "reclaimable_bytes": 13971341312, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 8.165528208000001, "owned_rss_bytes": 172638208, "owned_process_count": 4, "reclaimable_bytes": 14023393280, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 8.414121042000001, "owned_rss_bytes": 268500992, "owned_process_count": 4, "reclaimable_bytes": 13970194432, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 8.667575583000001, "owned_rss_bytes": 283967488, "owned_process_count": 4, "reclaimable_bytes": 13967605760, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 8.911143708, "owned_rss_bytes": 295763968, "owned_process_count": 4, "reclaimable_bytes": 13954400256, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 9.159007, "owned_rss_bytes": 334053376, "owned_process_count": 4, "reclaimable_bytes": 13921910784, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 9.412336875000001, "owned_rss_bytes": 350388224, "owned_process_count": 4, "reclaimable_bytes": 13914357760, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 9.651718583000001, "owned_rss_bytes": 356696064, "owned_process_count": 4, "reclaimable_bytes": 13909983232, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 9.9030415, "owned_rss_bytes": 368476160, "owned_process_count": 4, "reclaimable_bytes": 13893550080, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 10.149961083, "owned_rss_bytes": 379011072, "owned_process_count": 4, "reclaimable_bytes": 13882441728, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 10.391038958000001, "owned_rss_bytes": 394248192, "owned_process_count": 4, "reclaimable_bytes": 13875265536, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 10.6401485, "owned_rss_bytes": 401080320, "owned_process_count": 4, "reclaimable_bytes": 13860700160, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 10.889348917000001, "owned_rss_bytes": 407699456, "owned_process_count": 4, "reclaimable_bytes": 13860470784, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 11.137680792000001, "owned_rss_bytes": 417677312, "owned_process_count": 4, "reclaimable_bytes": 13846773760, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 11.390613417, "owned_rss_bytes": 426164224, "owned_process_count": 4, "reclaimable_bytes": 13841629184, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 11.630432375, "owned_rss_bytes": 432324608, "owned_process_count": 4, "reclaimable_bytes": 13817004032, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 11.874983875, "owned_rss_bytes": 441040896, "owned_process_count": 4, "reclaimable_bytes": 13806911488, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 12.117189625, "owned_rss_bytes": 444989440, "owned_process_count": 4, "reclaimable_bytes": 13809336320, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 12.368401500000001, "owned_rss_bytes": 454328320, "owned_process_count": 4, "reclaimable_bytes": 13805076480, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 12.607508917, "owned_rss_bytes": 459997184, "owned_process_count": 4, "reclaimable_bytes": 13797146624, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 12.848955875000001, "owned_rss_bytes": 466993152, "owned_process_count": 4, "reclaimable_bytes": 13795196928, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 13.093352125000001, "owned_rss_bytes": 468123648, "owned_process_count": 4, "reclaimable_bytes": 13785956352, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 13.344890542, "owned_rss_bytes": 470269952, "owned_process_count": 4, "reclaimable_bytes": 13776388096, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 13.591394333, "owned_rss_bytes": 471810048, "owned_process_count": 4, "reclaimable_bytes": 13785088000, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 13.851599292000001, "owned_rss_bytes": 474923008, "owned_process_count": 4, "reclaimable_bytes": 13782106112, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 14.106398667, "owned_rss_bytes": 476692480, "owned_process_count": 4, "reclaimable_bytes": 13834928128, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 14.344296792, "owned_rss_bytes": 481378304, "owned_process_count": 4, "reclaimable_bytes": 13839515648, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 14.589333125000001, "owned_rss_bytes": 484376576, "owned_process_count": 4, "reclaimable_bytes": 13839106048, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 14.840477708, "owned_rss_bytes": 489111552, "owned_process_count": 4, "reclaimable_bytes": 13946470400, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 15.089179167000001, "owned_rss_bytes": 492322816, "owned_process_count": 4, "reclaimable_bytes": 13891452928, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 15.341600167000001, "owned_rss_bytes": 494403584, "owned_process_count": 4, "reclaimable_bytes": 13832421376, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 15.592098333000001, "owned_rss_bytes": 502005760, "owned_process_count": 4, "reclaimable_bytes": 13813350400, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 15.839367874999999, "owned_rss_bytes": 502923264, "owned_process_count": 4, "reclaimable_bytes": 13955022848, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 16.0932145, "owned_rss_bytes": 505020416, "owned_process_count": 4, "reclaimable_bytes": 14083457024, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 16.346054167, "owned_rss_bytes": 505102336, "owned_process_count": 4, "reclaimable_bytes": 14070136832, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 16.591557833, "owned_rss_bytes": 505708544, "owned_process_count": 4, "reclaimable_bytes": 13776257024, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 16.829438458, "owned_rss_bytes": 513163264, "owned_process_count": 4, "reclaimable_bytes": 13766033408, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 17.073040582999997, "owned_rss_bytes": 513900544, "owned_process_count": 4, "reclaimable_bytes": 13764853760, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 17.324248917, "owned_rss_bytes": 515637248, "owned_process_count": 4, "reclaimable_bytes": 13751713792, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 17.576636042, "owned_rss_bytes": 517439488, "owned_process_count": 4, "reclaimable_bytes": 13742817280, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 17.833022916999997, "owned_rss_bytes": 517455872, "owned_process_count": 4, "reclaimable_bytes": 13743210496, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 18.08298, "owned_rss_bytes": 517750784, "owned_process_count": 4, "reclaimable_bytes": 13738770432, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 18.328714291999997, "owned_rss_bytes": 518406144, "owned_process_count": 4, "reclaimable_bytes": 13745635328, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 18.572678707999998, "owned_rss_bytes": 518619136, "owned_process_count": 4, "reclaimable_bytes": 13745930240, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 18.824798124999997, "owned_rss_bytes": 519110656, "owned_process_count": 4, "reclaimable_bytes": 13743538176, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 19.070196875, "owned_rss_bytes": 519241728, "owned_process_count": 4, "reclaimable_bytes": 13741441024, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 19.320296499999998, "owned_rss_bytes": 519536640, "owned_process_count": 4, "reclaimable_bytes": 13739278336, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 19.563667332999998, "owned_rss_bytes": 521240576, "owned_process_count": 4, "reclaimable_bytes": 13617725440, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 19.822415083, "owned_rss_bytes": 521322496, "owned_process_count": 4, "reclaimable_bytes": 13619118080, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 20.073853292, "owned_rss_bytes": 521355264, "owned_process_count": 4, "reclaimable_bytes": 13607387136, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 20.320805667, "owned_rss_bytes": 521666560, "owned_process_count": 4, "reclaimable_bytes": 13605060608, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 20.570363792, "owned_rss_bytes": 521781248, "owned_process_count": 4, "reclaimable_bytes": 13598261248, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 20.825129625, "owned_rss_bytes": 522076160, "owned_process_count": 4, "reclaimable_bytes": 13421838336, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 21.072412832999998, "owned_rss_bytes": 522223616, "owned_process_count": 4, "reclaimable_bytes": 13428293632, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 21.315349917, "owned_rss_bytes": 522289152, "owned_process_count": 4, "reclaimable_bytes": 13205405696, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 21.559753708, "owned_rss_bytes": 522387456, "owned_process_count": 4, "reclaimable_bytes": 13195247616, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 21.812604542, "owned_rss_bytes": 528777216, "owned_process_count": 4, "reclaimable_bytes": 13180862464, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 22.061464958, "owned_rss_bytes": 626884608, "owned_process_count": 4, "reclaimable_bytes": 13075382272, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 22.306372125, "owned_rss_bytes": 173260800, "owned_process_count": 4, "reclaimable_bytes": 13453737984, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 22.551185458, "owned_rss_bytes": 289800192, "owned_process_count": 4, "reclaimable_bytes": 13665828864, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 22.816613999999998, "owned_rss_bytes": 321011712, "owned_process_count": 4, "reclaimable_bytes": 13659242496, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 23.064723125, "owned_rss_bytes": 331776000, "owned_process_count": 4, "reclaimable_bytes": 13852377088, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 23.308546458, "owned_rss_bytes": 352387072, "owned_process_count": 4, "reclaimable_bytes": 13853425664, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 23.550129374999997, "owned_rss_bytes": 382566400, "owned_process_count": 4, "reclaimable_bytes": 13868728320, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 23.790378375, "owned_rss_bytes": 403996672, "owned_process_count": 4, "reclaimable_bytes": 13900005376, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 24.033029499999998, "owned_rss_bytes": 422854656, "owned_process_count": 4, "reclaimable_bytes": 13911474176, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 24.270663541999998, "owned_rss_bytes": 436469760, "owned_process_count": 4, "reclaimable_bytes": 13685506048, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 24.519367499999998, "owned_rss_bytes": 447053824, "owned_process_count": 4, "reclaimable_bytes": 13651492864, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 24.76930625, "owned_rss_bytes": 466059264, "owned_process_count": 4, "reclaimable_bytes": 13591232512, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 25.016366333, "owned_rss_bytes": 488456192, "owned_process_count": 4, "reclaimable_bytes": 13568229376, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 25.265063458, "owned_rss_bytes": 491356160, "owned_process_count": 4, "reclaimable_bytes": 13560610816, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 25.516365667, "owned_rss_bytes": 499138560, "owned_process_count": 4, "reclaimable_bytes": 13672349696, "swapins": 44112839, "swapouts": 77525566}
{"elapsed_seconds": 25.767188041999997, "owned_rss_bytes": 512016384, "owned_process_count": 4, "reclaimable_bytes": 13659799552, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 26.019604875, "owned_rss_bytes": 524566528, "owned_process_count": 4, "reclaimable_bytes": 13649592320, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 26.259571375, "owned_rss_bytes": 535789568, "owned_process_count": 4, "reclaimable_bytes": 13636354048, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 26.504659874999998, "owned_rss_bytes": 543916032, "owned_process_count": 4, "reclaimable_bytes": 13630046208, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 26.745972166999998, "owned_rss_bytes": 551305216, "owned_process_count": 4, "reclaimable_bytes": 13630144512, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 26.988604167, "owned_rss_bytes": 562348032, "owned_process_count": 4, "reclaimable_bytes": 13617659904, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 27.24243925, "owned_rss_bytes": 574341120, "owned_process_count": 4, "reclaimable_bytes": 13609959424, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 27.480344, "owned_rss_bytes": 578764800, "owned_process_count": 4, "reclaimable_bytes": 13422084096, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 27.722643708, "owned_rss_bytes": 583843840, "owned_process_count": 4, "reclaimable_bytes": 13409894400, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 27.966524208, "owned_rss_bytes": 589037568, "owned_process_count": 4, "reclaimable_bytes": 13286522880, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 28.217120041999998, "owned_rss_bytes": 599916544, "owned_process_count": 4, "reclaimable_bytes": 13198458880, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 28.467100875, "owned_rss_bytes": 609517568, "owned_process_count": 4, "reclaimable_bytes": 13195853824, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 28.716091457999998, "owned_rss_bytes": 617005056, "owned_process_count": 4, "reclaimable_bytes": 13368557568, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 28.957713291999998, "owned_rss_bytes": 623869952, "owned_process_count": 4, "reclaimable_bytes": 13363658752, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 29.196008083, "owned_rss_bytes": 627523584, "owned_process_count": 4, "reclaimable_bytes": 13542277120, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 29.441734417, "owned_rss_bytes": 634208256, "owned_process_count": 4, "reclaimable_bytes": 13534232576, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 29.689097832999998, "owned_rss_bytes": 647053312, "owned_process_count": 4, "reclaimable_bytes": 13537198080, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 29.932299625, "owned_rss_bytes": 655376384, "owned_process_count": 4, "reclaimable_bytes": 13523828736, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 30.177728374999997, "owned_rss_bytes": 661684224, "owned_process_count": 4, "reclaimable_bytes": 13525729280, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 30.419917041999998, "owned_rss_bytes": 662487040, "owned_process_count": 4, "reclaimable_bytes": 13518864384, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 30.672029249999998, "owned_rss_bytes": 662503424, "owned_process_count": 4, "reclaimable_bytes": 13523304448, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 30.918643292, "owned_rss_bytes": 662503424, "owned_process_count": 4, "reclaimable_bytes": 13581041664, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 31.166945207999998, "owned_rss_bytes": 662536192, "owned_process_count": 4, "reclaimable_bytes": 13586497536, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 31.411161625000002, "owned_rss_bytes": 663027712, "owned_process_count": 4, "reclaimable_bytes": 13609631744, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 31.654734666999996, "owned_rss_bytes": 661946368, "owned_process_count": 4, "reclaimable_bytes": 13571162112, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 31.898812541999998, "owned_rss_bytes": 662437888, "owned_process_count": 4, "reclaimable_bytes": 13548748800, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 32.147303417, "owned_rss_bytes": 663568384, "owned_process_count": 4, "reclaimable_bytes": 13537591296, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 32.387559625, "owned_rss_bytes": 663928832, "owned_process_count": 4, "reclaimable_bytes": 13541605376, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 32.626226958000004, "owned_rss_bytes": 664223744, "owned_process_count": 4, "reclaimable_bytes": 13549355008, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 32.868940417000005, "owned_rss_bytes": 664862720, "owned_process_count": 4, "reclaimable_bytes": 13547634688, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 33.111017208, "owned_rss_bytes": 670679040, "owned_process_count": 4, "reclaimable_bytes": 13528301568, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 33.353616792000004, "owned_rss_bytes": 741310464, "owned_process_count": 4, "reclaimable_bytes": 13467860992, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 33.591846083, "owned_rss_bytes": 821952512, "owned_process_count": 4, "reclaimable_bytes": 13382959104, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 33.836053542, "owned_rss_bytes": 144818176, "owned_process_count": 3, "reclaimable_bytes": 13934837760, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 34.076445125, "owned_rss_bytes": 235094016, "owned_process_count": 4, "reclaimable_bytes": 13898792960, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 34.316358042000005, "owned_rss_bytes": 233996288, "owned_process_count": 4, "reclaimable_bytes": 13771243520, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 34.558368167000005, "owned_rss_bytes": 310788096, "owned_process_count": 4, "reclaimable_bytes": 13744455680, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 34.797754250000004, "owned_rss_bytes": 349011968, "owned_process_count": 4, "reclaimable_bytes": 13719945216, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 35.036432292, "owned_rss_bytes": 374767616, "owned_process_count": 4, "reclaimable_bytes": 13705789440, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 35.278851625, "owned_rss_bytes": 390299648, "owned_process_count": 4, "reclaimable_bytes": 13688455168, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 35.526871292, "owned_rss_bytes": 406306816, "owned_process_count": 4, "reclaimable_bytes": 13782777856, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 35.768597208, "owned_rss_bytes": 419151872, "owned_process_count": 4, "reclaimable_bytes": 13791559680, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 36.009923458, "owned_rss_bytes": 429342720, "owned_process_count": 4, "reclaimable_bytes": 13782417408, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 36.250765833, "owned_rss_bytes": 433242112, "owned_process_count": 4, "reclaimable_bytes": 13779779584, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 36.499566125, "owned_rss_bytes": 436338688, "owned_process_count": 4, "reclaimable_bytes": 13769392128, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 36.749629250000005, "owned_rss_bytes": 439959552, "owned_process_count": 4, "reclaimable_bytes": 13768261632, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 36.991460375, "owned_rss_bytes": 440401920, "owned_process_count": 4, "reclaimable_bytes": 13768540160, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 37.2368145, "owned_rss_bytes": 440696832, "owned_process_count": 4, "reclaimable_bytes": 13762707456, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 37.477797792000004, "owned_rss_bytes": 112820224, "owned_process_count": 3, "reclaimable_bytes": 13947568128, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 37.720918542, "owned_rss_bytes": 207634432, "owned_process_count": 4, "reclaimable_bytes": 13909491712, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 37.967103333000004, "owned_rss_bytes": 328679424, "owned_process_count": 4, "reclaimable_bytes": 13844365312, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 38.215389542000004, "owned_rss_bytes": 357482496, "owned_process_count": 4, "reclaimable_bytes": 13871775744, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 38.459961417, "owned_rss_bytes": 382484480, "owned_process_count": 4, "reclaimable_bytes": 13907623936, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 38.697953417, "owned_rss_bytes": 396623872, "owned_process_count": 4, "reclaimable_bytes": 13846446080, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 38.943693083, "owned_rss_bytes": 411287552, "owned_process_count": 4, "reclaimable_bytes": 13825114112, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 39.180183542, "owned_rss_bytes": 422969344, "owned_process_count": 4, "reclaimable_bytes": 13790167040, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 39.428187542, "owned_rss_bytes": 436387840, "owned_process_count": 4, "reclaimable_bytes": 13765378048, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 39.665376125, "owned_rss_bytes": 451756032, "owned_process_count": 4, "reclaimable_bytes": 13749616640, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 39.903842167, "owned_rss_bytes": 464142336, "owned_process_count": 4, "reclaimable_bytes": 13744406528, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 40.151139208000004, "owned_rss_bytes": 467484672, "owned_process_count": 4, "reclaimable_bytes": 13740851200, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 40.394136292, "owned_rss_bytes": 468385792, "owned_process_count": 4, "reclaimable_bytes": 13731577856, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 40.64037975, "owned_rss_bytes": 479657984, "owned_process_count": 4, "reclaimable_bytes": 13729906688, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 40.890296500000005, "owned_rss_bytes": 479657984, "owned_process_count": 4, "reclaimable_bytes": 13726089216, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 41.1360315, "owned_rss_bytes": 479723520, "owned_process_count": 4, "reclaimable_bytes": 13723779072, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 41.382106042000004, "owned_rss_bytes": 479838208, "owned_process_count": 4, "reclaimable_bytes": 13733642240, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 41.620523125000005, "owned_rss_bytes": 482033664, "owned_process_count": 4, "reclaimable_bytes": 13723729920, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 41.875515958, "owned_rss_bytes": 484048896, "owned_process_count": 4, "reclaimable_bytes": 13725974528, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 42.12191725, "owned_rss_bytes": 486637568, "owned_process_count": 4, "reclaimable_bytes": 13721239552, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 42.370448542000005, "owned_rss_bytes": 487112704, "owned_process_count": 4, "reclaimable_bytes": 13715243008, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 42.616086292000006, "owned_rss_bytes": 487358464, "owned_process_count": 4, "reclaimable_bytes": 13716996096, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 42.863886125, "owned_rss_bytes": 487555072, "owned_process_count": 4, "reclaimable_bytes": 13703004160, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 43.10446875, "owned_rss_bytes": 487604224, "owned_process_count": 4, "reclaimable_bytes": 13698531328, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 43.350695708, "owned_rss_bytes": 520683520, "owned_process_count": 4, "reclaimable_bytes": 13660700672, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 43.588470917, "owned_rss_bytes": 191283200, "owned_process_count": 4, "reclaimable_bytes": 13921746944, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 43.83149625, "owned_rss_bytes": 278691840, "owned_process_count": 4, "reclaimable_bytes": 13863976960, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 44.08161925, "owned_rss_bytes": 294862848, "owned_process_count": 4, "reclaimable_bytes": 13871546368, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 44.318164292000006, "owned_rss_bytes": 308592640, "owned_process_count": 4, "reclaimable_bytes": 13852229632, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 44.556124583, "owned_rss_bytes": 317636608, "owned_process_count": 4, "reclaimable_bytes": 13850542080, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 44.806236417, "owned_rss_bytes": 341606400, "owned_process_count": 4, "reclaimable_bytes": 13824475136, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 45.053441750000005, "owned_rss_bytes": 367575040, "owned_process_count": 4, "reclaimable_bytes": 13820182528, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 45.300138000000004, "owned_rss_bytes": 434159616, "owned_process_count": 4, "reclaimable_bytes": 13758644224, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 45.544183667000006, "owned_rss_bytes": 435585024, "owned_process_count": 4, "reclaimable_bytes": 13764902912, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 45.791276417000006, "owned_rss_bytes": 435814400, "owned_process_count": 4, "reclaimable_bytes": 13774127104, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 46.035972792, "owned_rss_bytes": 435945472, "owned_process_count": 4, "reclaimable_bytes": 13782073344, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 46.274009667, "owned_rss_bytes": 436043776, "owned_process_count": 4, "reclaimable_bytes": 13801865216, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 46.522465708000006, "owned_rss_bytes": 436240384, "owned_process_count": 4, "reclaimable_bytes": 13807304704, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 46.763373417000004, "owned_rss_bytes": 440041472, "owned_process_count": 4, "reclaimable_bytes": 13789052928, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 47.000293125, "owned_rss_bytes": 448233472, "owned_process_count": 4, "reclaimable_bytes": 13778894848, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 47.239455167, "owned_rss_bytes": 459210752, "owned_process_count": 4, "reclaimable_bytes": 13774553088, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 47.481370708, "owned_rss_bytes": 466026496, "owned_process_count": 4, "reclaimable_bytes": 13767786496, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 47.727680875000004, "owned_rss_bytes": 470056960, "owned_process_count": 4, "reclaimable_bytes": 13765197824, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 47.96866825, "owned_rss_bytes": 479936512, "owned_process_count": 4, "reclaimable_bytes": 13752532992, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 48.209411667000005, "owned_rss_bytes": 492486656, "owned_process_count": 4, "reclaimable_bytes": 13744406528, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 48.452697792, "owned_rss_bytes": 502087680, "owned_process_count": 4, "reclaimable_bytes": 13731594240, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 48.696959125, "owned_rss_bytes": 514768896, "owned_process_count": 4, "reclaimable_bytes": 13707345920, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 48.936549167, "owned_rss_bytes": 528367616, "owned_process_count": 4, "reclaimable_bytes": 13697794048, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 49.176664125, "owned_rss_bytes": 539508736, "owned_process_count": 4, "reclaimable_bytes": 13690142720, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 49.426060583, "owned_rss_bytes": 540540928, "owned_process_count": 4, "reclaimable_bytes": 13691650048, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 49.669709000000005, "owned_rss_bytes": 559988736, "owned_process_count": 4, "reclaimable_bytes": 13664370688, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 49.913662208000005, "owned_rss_bytes": 560726016, "owned_process_count": 4, "reclaimable_bytes": 13658816512, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 50.160834083000005, "owned_rss_bytes": 561004544, "owned_process_count": 4, "reclaimable_bytes": 13654032384, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 50.397977083, "owned_rss_bytes": 562741248, "owned_process_count": 4, "reclaimable_bytes": 13653704704, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 50.63864525, "owned_rss_bytes": 564576256, "owned_process_count": 4, "reclaimable_bytes": 13649887232, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 50.880212542, "owned_rss_bytes": 566755328, "owned_process_count": 4, "reclaimable_bytes": 13652656128, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 51.123010208000004, "owned_rss_bytes": 569868288, "owned_process_count": 4, "reclaimable_bytes": 13639041024, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 51.368646167, "owned_rss_bytes": 573374464, "owned_process_count": 4, "reclaimable_bytes": 13633978368, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 51.612832167, "owned_rss_bytes": 577699840, "owned_process_count": 4, "reclaimable_bytes": 13632602112, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 51.865584042, "owned_rss_bytes": 579338240, "owned_process_count": 4, "reclaimable_bytes": 13620117504, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 52.103589792, "owned_rss_bytes": 579436544, "owned_process_count": 4, "reclaimable_bytes": 13617168384, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 52.348312083, "owned_rss_bytes": 579764224, "owned_process_count": 4, "reclaimable_bytes": 13776388096, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 52.586518042, "owned_rss_bytes": 579829760, "owned_process_count": 4, "reclaimable_bytes": 13837090816, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 52.829047583000005, "owned_rss_bytes": 580173824, "owned_process_count": 4, "reclaimable_bytes": 13880328192, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 53.074665042, "owned_rss_bytes": 580927488, "owned_process_count": 4, "reclaimable_bytes": 13793951744, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 53.319645125, "owned_rss_bytes": 581402624, "owned_process_count": 4, "reclaimable_bytes": 13786021888, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 53.569295958000005, "owned_rss_bytes": 581435392, "owned_process_count": 4, "reclaimable_bytes": 13764083712, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 53.816195833, "owned_rss_bytes": 590135296, "owned_process_count": 4, "reclaimable_bytes": 13736230912, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 54.065182875000005, "owned_rss_bytes": 671334400, "owned_process_count": 4, "reclaimable_bytes": 13657374720, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 54.306850125000004, "owned_rss_bytes": 139362304, "owned_process_count": 3, "reclaimable_bytes": 14095450112, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 54.553895208, "owned_rss_bytes": 299712512, "owned_process_count": 4, "reclaimable_bytes": 14022279168, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 54.794018667, "owned_rss_bytes": 331300864, "owned_process_count": 4, "reclaimable_bytes": 14006206464, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 55.036033042, "owned_rss_bytes": 340361216, "owned_process_count": 4, "reclaimable_bytes": 14007599104, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 55.288788583000006, "owned_rss_bytes": 214908928, "owned_process_count": 4, "reclaimable_bytes": 14060453888, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 55.538316917, "owned_rss_bytes": 249659392, "owned_process_count": 4, "reclaimable_bytes": 14049230848, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 55.780751833000004, "owned_rss_bytes": 271400960, "owned_process_count": 4, "reclaimable_bytes": 14041628672, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 56.027399, "owned_rss_bytes": 277774336, "owned_process_count": 4, "reclaimable_bytes": 14046199808, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 56.265906417000004, "owned_rss_bytes": 282738688, "owned_process_count": 4, "reclaimable_bytes": 14036058112, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 56.509894667000005, "owned_rss_bytes": 288555008, "owned_process_count": 4, "reclaimable_bytes": 14032191488, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 56.754105042, "owned_rss_bytes": 293027840, "owned_process_count": 4, "reclaimable_bytes": 14028570624, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 56.993962083, "owned_rss_bytes": 294305792, "owned_process_count": 4, "reclaimable_bytes": 14028275712, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 57.231853042000004, "owned_rss_bytes": 330989568, "owned_process_count": 4, "reclaimable_bytes": 13993836544, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 57.475848792, "owned_rss_bytes": 338247680, "owned_process_count": 4, "reclaimable_bytes": 13993377792, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 57.723423208, "owned_rss_bytes": 349241344, "owned_process_count": 4, "reclaimable_bytes": 13796409344, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 57.967106042000005, "owned_rss_bytes": 361578496, "owned_process_count": 4, "reclaimable_bytes": 13767966720, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 58.211483083000005, "owned_rss_bytes": 375980032, "owned_process_count": 4, "reclaimable_bytes": 13757202432, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 58.458732792, "owned_rss_bytes": 389038080, "owned_process_count": 4, "reclaimable_bytes": 13736574976, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 58.697007500000005, "owned_rss_bytes": 394444800, "owned_process_count": 4, "reclaimable_bytes": 13723271168, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 58.937586375, "owned_rss_bytes": 401457152, "owned_process_count": 4, "reclaimable_bytes": 13890027520, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 59.1830505, "owned_rss_bytes": 401932288, "owned_process_count": 4, "reclaimable_bytes": 13883949056, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 59.428688458, "owned_rss_bytes": 404668416, "owned_process_count": 4, "reclaimable_bytes": 13879869440, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 59.674397458, "owned_rss_bytes": 406421504, "owned_process_count": 4, "reclaimable_bytes": 13896105984, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 59.921438042000005, "owned_rss_bytes": 406683648, "owned_process_count": 4, "reclaimable_bytes": 13895761920, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 60.167933083, "owned_rss_bytes": 406896640, "owned_process_count": 4, "reclaimable_bytes": 13893353472, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 60.421848333, "owned_rss_bytes": 407126016, "owned_process_count": 4, "reclaimable_bytes": 13892452352, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 60.659128625, "owned_rss_bytes": 421855232, "owned_process_count": 4, "reclaimable_bytes": 13874888704, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 60.901538458000005, "owned_rss_bytes": 140017664, "owned_process_count": 4, "reclaimable_bytes": 14064910336, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 61.145420458000004, "owned_rss_bytes": 313606144, "owned_process_count": 4, "reclaimable_bytes": 13996097536, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 61.388045875, "owned_rss_bytes": 347521024, "owned_process_count": 4, "reclaimable_bytes": 13792083968, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 61.628276083, "owned_rss_bytes": 358055936, "owned_process_count": 4, "reclaimable_bytes": 13763608576, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 61.866889333, "owned_rss_bytes": 359333888, "owned_process_count": 4, "reclaimable_bytes": 13742817280, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 62.112289042, "owned_rss_bytes": 245006336, "owned_process_count": 4, "reclaimable_bytes": 13852737536, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 62.358170208000004, "owned_rss_bytes": 217612288, "owned_process_count": 4, "reclaimable_bytes": 13815267328, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 62.605216500000004, "owned_rss_bytes": 238305280, "owned_process_count": 4, "reclaimable_bytes": 13962461184, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 62.842129375, "owned_rss_bytes": 250707968, "owned_process_count": 4, "reclaimable_bytes": 13945749504, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 63.085967875, "owned_rss_bytes": 226377728, "owned_process_count": 4, "reclaimable_bytes": 13953875968, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 63.332194583, "owned_rss_bytes": 318144512, "owned_process_count": 4, "reclaimable_bytes": 13894107136, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 63.570344875, "owned_rss_bytes": 331726848, "owned_process_count": 4, "reclaimable_bytes": 13873938432, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 63.811361792, "owned_rss_bytes": 347750400, "owned_process_count": 4, "reclaimable_bytes": 13863731200, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 64.054197333, "owned_rss_bytes": 358039552, "owned_process_count": 4, "reclaimable_bytes": 13847363584, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 64.293353583, "owned_rss_bytes": 362872832, "owned_process_count": 4, "reclaimable_bytes": 13843496960, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 64.5398425, "owned_rss_bytes": 366198784, "owned_process_count": 4, "reclaimable_bytes": 13836451840, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 64.776863875, "owned_rss_bytes": 369770496, "owned_process_count": 4, "reclaimable_bytes": 13825261568, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 65.022706333, "owned_rss_bytes": 372948992, "owned_process_count": 4, "reclaimable_bytes": 13821394944, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 65.2693605, "owned_rss_bytes": 376586240, "owned_process_count": 4, "reclaimable_bytes": 13826457600, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 65.51461325, "owned_rss_bytes": 380698624, "owned_process_count": 4, "reclaimable_bytes": 13822296064, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 65.755260875, "owned_rss_bytes": 383942656, "owned_process_count": 4, "reclaimable_bytes": 13823229952, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 66.000657833, "owned_rss_bytes": 388022272, "owned_process_count": 4, "reclaimable_bytes": 13817020416, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 66.242184458, "owned_rss_bytes": 392052736, "owned_process_count": 4, "reclaimable_bytes": 13810565120, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 66.486183375, "owned_rss_bytes": 395083776, "owned_process_count": 4, "reclaimable_bytes": 13806878720, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 66.73594200000001, "owned_rss_bytes": 399097856, "owned_process_count": 4, "reclaimable_bytes": 13807714304, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 66.973363417, "owned_rss_bytes": 402931712, "owned_process_count": 4, "reclaimable_bytes": 13799735296, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 67.216879542, "owned_rss_bytes": 406241280, "owned_process_count": 4, "reclaimable_bytes": 13862518784, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 67.45664108300001, "owned_rss_bytes": 409747456, "owned_process_count": 4, "reclaimable_bytes": 13854310400, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 67.705708375, "owned_rss_bytes": 413794304, "owned_process_count": 4, "reclaimable_bytes": 13807370240, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 67.952697667, "owned_rss_bytes": 417579008, "owned_process_count": 4, "reclaimable_bytes": 13765279744, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 68.196927208, "owned_rss_bytes": 420511744, "owned_process_count": 4, "reclaimable_bytes": 13763461120, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 68.440867083, "owned_rss_bytes": 424525824, "owned_process_count": 4, "reclaimable_bytes": 13747896320, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 68.68432625, "owned_rss_bytes": 428572672, "owned_process_count": 4, "reclaimable_bytes": 13753073664, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 68.92540220800001, "owned_rss_bytes": 430784512, "owned_process_count": 4, "reclaimable_bytes": 13750091776, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 69.168221208, "owned_rss_bytes": 435503104, "owned_process_count": 4, "reclaimable_bytes": 13750009856, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 69.41626745800001, "owned_rss_bytes": 437747712, "owned_process_count": 4, "reclaimable_bytes": 13753466880, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 69.65940570800001, "owned_rss_bytes": 438255616, "owned_process_count": 4, "reclaimable_bytes": 13754646528, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 69.900295083, "owned_rss_bytes": 439517184, "owned_process_count": 4, "reclaimable_bytes": 13754597376, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 70.1420605, "owned_rss_bytes": 439615488, "owned_process_count": 4, "reclaimable_bytes": 13742407680, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 70.388508125, "owned_rss_bytes": 441434112, "owned_process_count": 4, "reclaimable_bytes": 13727465472, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 70.6299695, "owned_rss_bytes": 444006400, "owned_process_count": 4, "reclaimable_bytes": 13649510400, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 70.873745458, "owned_rss_bytes": 444006400, "owned_process_count": 4, "reclaimable_bytes": 13457014784, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 71.134007083, "owned_rss_bytes": 444383232, "owned_process_count": 4, "reclaimable_bytes": 12979322880, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 71.39681525, "owned_rss_bytes": 445988864, "owned_process_count": 4, "reclaimable_bytes": 12751110144, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 71.65809970800001, "owned_rss_bytes": 446709760, "owned_process_count": 4, "reclaimable_bytes": 12848463872, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 71.91045175000001, "owned_rss_bytes": 447938560, "owned_process_count": 4, "reclaimable_bytes": 12793102336, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 72.149167167, "owned_rss_bytes": 448528384, "owned_process_count": 4, "reclaimable_bytes": 12793888768, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 72.39701466700001, "owned_rss_bytes": 462290944, "owned_process_count": 4, "reclaimable_bytes": 12786057216, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 72.63577975, "owned_rss_bytes": 480329728, "owned_process_count": 4, "reclaimable_bytes": 12753829888, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 72.883026667, "owned_rss_bytes": 503332864, "owned_process_count": 4, "reclaimable_bytes": 12789415936, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 73.12159750000001, "owned_rss_bytes": 520536064, "owned_process_count": 4, "reclaimable_bytes": 12840796160, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 73.364441083, "owned_rss_bytes": 548978688, "owned_process_count": 4, "reclaimable_bytes": 12722225152, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 73.60529375, "owned_rss_bytes": 649347072, "owned_process_count": 4, "reclaimable_bytes": 12625657856, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 73.845620375, "owned_rss_bytes": 650985472, "owned_process_count": 4, "reclaimable_bytes": 12603260928, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 74.084451667, "owned_rss_bytes": 651067392, "owned_process_count": 4, "reclaimable_bytes": 12598296576, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 74.331375958, "owned_rss_bytes": 651067392, "owned_process_count": 4, "reclaimable_bytes": 12595101696, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 74.574407667, "owned_rss_bytes": 651083776, "owned_process_count": 4, "reclaimable_bytes": 12588826624, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 74.815850917, "owned_rss_bytes": 651231232, "owned_process_count": 4, "reclaimable_bytes": 12607717376, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 75.060743792, "owned_rss_bytes": 651247616, "owned_process_count": 4, "reclaimable_bytes": 12611616768, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 75.303128208, "owned_rss_bytes": 651247616, "owned_process_count": 4, "reclaimable_bytes": 12604751872, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 75.551653708, "owned_rss_bytes": 651264000, "owned_process_count": 4, "reclaimable_bytes": 12607094784, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 75.789866417, "owned_rss_bytes": 651264000, "owned_process_count": 4, "reclaimable_bytes": 12590956544, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 76.041834833, "owned_rss_bytes": 651280384, "owned_process_count": 4, "reclaimable_bytes": 12496617472, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 76.288639833, "owned_rss_bytes": 651280384, "owned_process_count": 4, "reclaimable_bytes": 12548096000, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 76.534808375, "owned_rss_bytes": 651296768, "owned_process_count": 4, "reclaimable_bytes": 12591611904, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 76.775020958, "owned_rss_bytes": 655245312, "owned_process_count": 4, "reclaimable_bytes": 12587253760, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 77.020395583, "owned_rss_bytes": 655998976, "owned_process_count": 4, "reclaimable_bytes": 12590170112, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 77.270130917, "owned_rss_bytes": 658407424, "owned_process_count": 4, "reclaimable_bytes": 12585091072, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 77.508677542, "owned_rss_bytes": 662355968, "owned_process_count": 4, "reclaimable_bytes": 12633194496, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 77.75332025, "owned_rss_bytes": 672530432, "owned_process_count": 4, "reclaimable_bytes": 12696797184, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 78.000444167, "owned_rss_bytes": 681000960, "owned_process_count": 4, "reclaimable_bytes": 12607012864, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 78.246222667, "owned_rss_bytes": 688504832, "owned_process_count": 4, "reclaimable_bytes": 12578799616, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 78.489514958, "owned_rss_bytes": 696074240, "owned_process_count": 4, "reclaimable_bytes": 12541034496, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 78.735822458, "owned_rss_bytes": 700186624, "owned_process_count": 4, "reclaimable_bytes": 12523126784, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 78.97380700000001, "owned_rss_bytes": 704544768, "owned_process_count": 4, "reclaimable_bytes": 12524175360, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 79.218923, "owned_rss_bytes": 710361088, "owned_process_count": 4, "reclaimable_bytes": 12512018432, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 79.458050625, "owned_rss_bytes": 712949760, "owned_process_count": 4, "reclaimable_bytes": 12519309312, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 79.704837625, "owned_rss_bytes": 727384064, "owned_process_count": 4, "reclaimable_bytes": 12368691200, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 79.943671292, "owned_rss_bytes": 734117888, "owned_process_count": 4, "reclaimable_bytes": 12368740352, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 80.197379083, "owned_rss_bytes": 741900288, "owned_process_count": 4, "reclaimable_bytes": 12299124736, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 80.445318125, "owned_rss_bytes": 749649920, "owned_process_count": 4, "reclaimable_bytes": 12289900544, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 80.692858833, "owned_rss_bytes": 758333440, "owned_process_count": 4, "reclaimable_bytes": 12106465280, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 80.93546075, "owned_rss_bytes": 764329984, "owned_process_count": 4, "reclaimable_bytes": 12114083840, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 81.178294917, "owned_rss_bytes": 770883584, "owned_process_count": 4, "reclaimable_bytes": 12102451200, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 81.425361292, "owned_rss_bytes": 779943936, "owned_process_count": 4, "reclaimable_bytes": 12101926912, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 81.668471958, "owned_rss_bytes": 786087936, "owned_process_count": 4, "reclaimable_bytes": 12087623680, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 81.914001458, "owned_rss_bytes": 795033600, "owned_process_count": 4, "reclaimable_bytes": 12239470592, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 82.160876417, "owned_rss_bytes": 800309248, "owned_process_count": 4, "reclaimable_bytes": 12162760704, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 82.405626875, "owned_rss_bytes": 802897920, "owned_process_count": 4, "reclaimable_bytes": 11871109120, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 82.660355583, "owned_rss_bytes": 805584896, "owned_process_count": 4, "reclaimable_bytes": 11968184320, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 82.904098625, "owned_rss_bytes": 806502400, "owned_process_count": 4, "reclaimable_bytes": 12004229120, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 83.152714542, "owned_rss_bytes": 813137920, "owned_process_count": 4, "reclaimable_bytes": 12006932480, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 83.396324625, "owned_rss_bytes": 820740096, "owned_process_count": 4, "reclaimable_bytes": 11986518016, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 83.645425083, "owned_rss_bytes": 826949632, "owned_process_count": 4, "reclaimable_bytes": 12170510336, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 83.883723083, "owned_rss_bytes": 832749568, "owned_process_count": 4, "reclaimable_bytes": 12166184960, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 84.132111792, "owned_rss_bytes": 844660736, "owned_process_count": 4, "reclaimable_bytes": 12150898688, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 84.379791667, "owned_rss_bytes": 851492864, "owned_process_count": 4, "reclaimable_bytes": 12143362048, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 84.629589542, "owned_rss_bytes": 854261760, "owned_process_count": 4, "reclaimable_bytes": 12141166592, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 84.872700583, "owned_rss_bytes": 855785472, "owned_process_count": 4, "reclaimable_bytes": 12139577344, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 85.119230625, "owned_rss_bytes": 861487104, "owned_process_count": 4, "reclaimable_bytes": 12133302272, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 85.355700583, "owned_rss_bytes": 868679680, "owned_process_count": 4, "reclaimable_bytes": 12128321536, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 85.599699042, "owned_rss_bytes": 876085248, "owned_process_count": 4, "reclaimable_bytes": 12123324416, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 85.839711667, "owned_rss_bytes": 879689728, "owned_process_count": 4, "reclaimable_bytes": 12117426176, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 86.077581917, "owned_rss_bytes": 880640000, "owned_process_count": 4, "reclaimable_bytes": 12119605248, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 86.326614792, "owned_rss_bytes": 880787456, "owned_process_count": 4, "reclaimable_bytes": 12113625088, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 86.570571208, "owned_rss_bytes": 880852992, "owned_process_count": 4, "reclaimable_bytes": 12115066880, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 86.81635654200001, "owned_rss_bytes": 889962496, "owned_process_count": 4, "reclaimable_bytes": 12101386240, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 87.062706375, "owned_rss_bytes": 890781696, "owned_process_count": 4, "reclaimable_bytes": 12103434240, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 87.305819042, "owned_rss_bytes": 891092992, "owned_process_count": 4, "reclaimable_bytes": 12106006528, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 87.55646300000001, "owned_rss_bytes": 891224064, "owned_process_count": 4, "reclaimable_bytes": 12102107136, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 87.803502167, "owned_rss_bytes": 894091264, "owned_process_count": 4, "reclaimable_bytes": 11920048128, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 88.050689917, "owned_rss_bytes": 894910464, "owned_process_count": 4, "reclaimable_bytes": 11917033472, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 88.29691175, "owned_rss_bytes": 895303680, "owned_process_count": 4, "reclaimable_bytes": 11914674176, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 88.542391792, "owned_rss_bytes": 895533056, "owned_process_count": 4, "reclaimable_bytes": 11920769024, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 88.780495542, "owned_rss_bytes": 895942656, "owned_process_count": 4, "reclaimable_bytes": 11912970240, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 89.025350042, "owned_rss_bytes": 898269184, "owned_process_count": 4, "reclaimable_bytes": 12082593792, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 89.2663065, "owned_rss_bytes": 898301952, "owned_process_count": 4, "reclaimable_bytes": 12080529408, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 89.514413583, "owned_rss_bytes": 898908160, "owned_process_count": 4, "reclaimable_bytes": 12082823168, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 89.75501475, "owned_rss_bytes": 905216000, "owned_process_count": 4, "reclaimable_bytes": 12095782912, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 90.002688667, "owned_rss_bytes": 905969664, "owned_process_count": 4, "reclaimable_bytes": 12158861312, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 90.23906825, "owned_rss_bytes": 907296768, "owned_process_count": 4, "reclaimable_bytes": 12232392704, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 90.477331792, "owned_rss_bytes": 908263424, "owned_process_count": 4, "reclaimable_bytes": 12128206848, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 90.72309475, "owned_rss_bytes": 909377536, "owned_process_count": 4, "reclaimable_bytes": 12108922880, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 90.966887292, "owned_rss_bytes": 910000128, "owned_process_count": 4, "reclaimable_bytes": 12112265216, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 91.205878083, "owned_rss_bytes": 911654912, "owned_process_count": 4, "reclaimable_bytes": 12111380480, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 91.442347833, "owned_rss_bytes": 912277504, "owned_process_count": 4, "reclaimable_bytes": 12110479360, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 91.681231917, "owned_rss_bytes": 913489920, "owned_process_count": 4, "reclaimable_bytes": 12111003648, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 91.926507417, "owned_rss_bytes": 914374656, "owned_process_count": 4, "reclaimable_bytes": 12111888384, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 92.16720425, "owned_rss_bytes": 915865600, "owned_process_count": 4, "reclaimable_bytes": 12107104256, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 92.40268804200001, "owned_rss_bytes": 916848640, "owned_process_count": 4, "reclaimable_bytes": 12106448896, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 92.649689333, "owned_rss_bytes": 917159936, "owned_process_count": 4, "reclaimable_bytes": 12104515584, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 92.894023125, "owned_rss_bytes": 917815296, "owned_process_count": 4, "reclaimable_bytes": 12113395712, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 93.138255542, "owned_rss_bytes": 918454272, "owned_process_count": 4, "reclaimable_bytes": 12109758464, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 93.383025292, "owned_rss_bytes": 918962176, "owned_process_count": 4, "reclaimable_bytes": 12110331904, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 93.630707125, "owned_rss_bytes": 922845184, "owned_process_count": 4, "reclaimable_bytes": 12104204288, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 93.865875917, "owned_rss_bytes": 925908992, "owned_process_count": 4, "reclaimable_bytes": 12098535424, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 94.11429625, "owned_rss_bytes": 933216256, "owned_process_count": 4, "reclaimable_bytes": 12092112896, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 94.349647042, "owned_rss_bytes": 933756928, "owned_process_count": 4, "reclaimable_bytes": 12090212352, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 94.590335125, "owned_rss_bytes": 939474944, "owned_process_count": 4, "reclaimable_bytes": 12085903360, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 94.83517304200001, "owned_rss_bytes": 940032000, "owned_process_count": 4, "reclaimable_bytes": 12080283648, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 95.082470958, "owned_rss_bytes": 942981120, "owned_process_count": 4, "reclaimable_bytes": 12077678592, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 95.319360333, "owned_rss_bytes": 947093504, "owned_process_count": 4, "reclaimable_bytes": 12078006272, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 95.569891333, "owned_rss_bytes": 953925632, "owned_process_count": 4, "reclaimable_bytes": 11994939392, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 95.81142579200001, "owned_rss_bytes": 962871296, "owned_process_count": 4, "reclaimable_bytes": 11985666048, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 96.053902625, "owned_rss_bytes": 971390976, "owned_process_count": 4, "reclaimable_bytes": 11978113024, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 96.290283458, "owned_rss_bytes": 974979072, "owned_process_count": 4, "reclaimable_bytes": 11978604544, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 96.53447345800001, "owned_rss_bytes": 985808896, "owned_process_count": 4, "reclaimable_bytes": 11967774720, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 96.775613417, "owned_rss_bytes": 987054080, "owned_process_count": 4, "reclaimable_bytes": 11964481536, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 97.020635375, "owned_rss_bytes": 990068736, "owned_process_count": 4, "reclaimable_bytes": 11964530688, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 97.25940625, "owned_rss_bytes": 995786752, "owned_process_count": 4, "reclaimable_bytes": 11955453952, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 97.500699958, "owned_rss_bytes": 997343232, "owned_process_count": 4, "reclaimable_bytes": 11953373184, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 97.740493, "owned_rss_bytes": 998653952, "owned_process_count": 4, "reclaimable_bytes": 11952472064, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 97.980384875, "owned_rss_bytes": 998653952, "owned_process_count": 4, "reclaimable_bytes": 11972345856, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 98.224188333, "owned_rss_bytes": 998670336, "owned_process_count": 4, "reclaimable_bytes": 11963449344, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 98.473140333, "owned_rss_bytes": 998686720, "owned_process_count": 4, "reclaimable_bytes": 11965775872, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 98.718269083, "owned_rss_bytes": 998735872, "owned_process_count": 4, "reclaimable_bytes": 11961778176, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 98.958878958, "owned_rss_bytes": 998768640, "owned_process_count": 4, "reclaimable_bytes": 11963105280, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 99.19610679200001, "owned_rss_bytes": 998801408, "owned_process_count": 4, "reclaimable_bytes": 11964743680, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 99.445205625, "owned_rss_bytes": 998817792, "owned_process_count": 4, "reclaimable_bytes": 11959795712, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 99.69252179200001, "owned_rss_bytes": 998817792, "owned_process_count": 4, "reclaimable_bytes": 11964416000, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 99.931015167, "owned_rss_bytes": 998834176, "owned_process_count": 4, "reclaimable_bytes": 11969953792, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 100.176341292, "owned_rss_bytes": 999161856, "owned_process_count": 4, "reclaimable_bytes": 11961335808, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 100.41520345800001, "owned_rss_bytes": 1000570880, "owned_process_count": 4, "reclaimable_bytes": 11960369152, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 100.651209208, "owned_rss_bytes": 1001062400, "owned_process_count": 4, "reclaimable_bytes": 11962302464, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 100.888153, "owned_rss_bytes": 1001324544, "owned_process_count": 4, "reclaimable_bytes": 11964727296, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 101.132305292, "owned_rss_bytes": 1001963520, "owned_process_count": 4, "reclaimable_bytes": 11961794560, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 101.374506292, "owned_rss_bytes": 1002078208, "owned_process_count": 4, "reclaimable_bytes": 11783061504, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 101.610507917, "owned_rss_bytes": 1002930176, "owned_process_count": 4, "reclaimable_bytes": 11784126464, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 101.852967542, "owned_rss_bytes": 1003536384, "owned_process_count": 4, "reclaimable_bytes": 11765268480, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 102.098179333, "owned_rss_bytes": 1003569152, "owned_process_count": 4, "reclaimable_bytes": 11831623680, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 102.333170333, "owned_rss_bytes": 1003601920, "owned_process_count": 4, "reclaimable_bytes": 11841257472, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 102.581100417, "owned_rss_bytes": 1003634688, "owned_process_count": 4, "reclaimable_bytes": 11872567296, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 102.829987667, "owned_rss_bytes": 1003683840, "owned_process_count": 4, "reclaimable_bytes": 11829198848, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 103.080014, "owned_rss_bytes": 1003732992, "owned_process_count": 4, "reclaimable_bytes": 11744198656, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 103.32467775, "owned_rss_bytes": 1003814912, "owned_process_count": 4, "reclaimable_bytes": 11654774784, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 103.566223542, "owned_rss_bytes": 1004240896, "owned_process_count": 4, "reclaimable_bytes": 11547705344, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 103.81631191700001, "owned_rss_bytes": 1004290048, "owned_process_count": 4, "reclaimable_bytes": 11645190144, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 104.067515, "owned_rss_bytes": 1004634112, "owned_process_count": 4, "reclaimable_bytes": 11777310720, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 104.316834292, "owned_rss_bytes": 1004634112, "owned_process_count": 4, "reclaimable_bytes": 11720015872, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 104.567158, "owned_rss_bytes": 1004683264, "owned_process_count": 4, "reclaimable_bytes": 11880415232, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 104.818617042, "owned_rss_bytes": 1004699648, "owned_process_count": 4, "reclaimable_bytes": 11826216960, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 105.062120875, "owned_rss_bytes": 1005928448, "owned_process_count": 4, "reclaimable_bytes": 11824660480, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 105.309741167, "owned_rss_bytes": 1006174208, "owned_process_count": 4, "reclaimable_bytes": 11781292032, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 105.55651575, "owned_rss_bytes": 1006305280, "owned_process_count": 4, "reclaimable_bytes": 11788795904, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 105.797609958, "owned_rss_bytes": 1006305280, "owned_process_count": 4, "reclaimable_bytes": 11758682112, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 106.050218792, "owned_rss_bytes": 1006338048, "owned_process_count": 4, "reclaimable_bytes": 11755438080, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 106.289414458, "owned_rss_bytes": 1006387200, "owned_process_count": 4, "reclaimable_bytes": 11742412800, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 106.535239625, "owned_rss_bytes": 1006485504, "owned_process_count": 4, "reclaimable_bytes": 11709366272, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 106.774001875, "owned_rss_bytes": 1006534656, "owned_process_count": 4, "reclaimable_bytes": 11640782848, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 107.019788125, "owned_rss_bytes": 1006567424, "owned_process_count": 4, "reclaimable_bytes": 11630493696, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 107.2646405, "owned_rss_bytes": 1006747648, "owned_process_count": 4, "reclaimable_bytes": 11629035520, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 107.504823833, "owned_rss_bytes": 1006845952, "owned_process_count": 4, "reclaimable_bytes": 11579031552, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 107.75662029200001, "owned_rss_bytes": 1006895104, "owned_process_count": 4, "reclaimable_bytes": 11599380480, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 108.00080575, "owned_rss_bytes": 1006927872, "owned_process_count": 4, "reclaimable_bytes": 11546394624, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 108.248992583, "owned_rss_bytes": 1006944256, "owned_process_count": 4, "reclaimable_bytes": 11321704448, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 108.5022215, "owned_rss_bytes": 1006944256, "owned_process_count": 4, "reclaimable_bytes": 11053432832, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 108.745724167, "owned_rss_bytes": 1006977024, "owned_process_count": 4, "reclaimable_bytes": 11044995072, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 108.992978875, "owned_rss_bytes": 1006977024, "owned_process_count": 4, "reclaimable_bytes": 11034165248, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 109.240739708, "owned_rss_bytes": 1006993408, "owned_process_count": 4, "reclaimable_bytes": 10994647040, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 109.488815792, "owned_rss_bytes": 1007009792, "owned_process_count": 4, "reclaimable_bytes": 10973429760, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 109.741475083, "owned_rss_bytes": 1007042560, "owned_process_count": 4, "reclaimable_bytes": 10965549056, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 109.990849917, "owned_rss_bytes": 1008533504, "owned_process_count": 4, "reclaimable_bytes": 10943397888, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 110.242544958, "owned_rss_bytes": 1008812032, "owned_process_count": 4, "reclaimable_bytes": 10973331456, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 110.49319283300001, "owned_rss_bytes": 1009090560, "owned_process_count": 4, "reclaimable_bytes": 10968317952, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 110.73899383300001, "owned_rss_bytes": 1053065216, "owned_process_count": 4, "reclaimable_bytes": 10923606016, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 110.988654542, "owned_rss_bytes": 1130151936, "owned_process_count": 4, "reclaimable_bytes": 10818011136, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 111.23575541700001, "owned_rss_bytes": 1229733888, "owned_process_count": 4, "reclaimable_bytes": 10709106688, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 111.483916667, "owned_rss_bytes": 1318961152, "owned_process_count": 4, "reclaimable_bytes": 10669621248, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 111.732361625, "owned_rss_bytes": 1398702080, "owned_process_count": 4, "reclaimable_bytes": 10595319808, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 111.987350292, "owned_rss_bytes": 1408712704, "owned_process_count": 4, "reclaimable_bytes": 10592370688, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 112.248254875, "owned_rss_bytes": 1408827392, "owned_process_count": 4, "reclaimable_bytes": 10550427648, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 112.504470208, "owned_rss_bytes": 1410678784, "owned_process_count": 4, "reclaimable_bytes": 10548379648, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 112.747288375, "owned_rss_bytes": 1411203072, "owned_process_count": 4, "reclaimable_bytes": 10704273408, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 113.002698208, "owned_rss_bytes": 1376813056, "owned_process_count": 4, "reclaimable_bytes": 10721116160, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 113.244808375, "owned_rss_bytes": 200065024, "owned_process_count": 4, "reclaimable_bytes": 11793317888, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 113.499688917, "owned_rss_bytes": 256229376, "owned_process_count": 4, "reclaimable_bytes": 11775901696, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 113.75216900000001, "owned_rss_bytes": 270811136, "owned_process_count": 4, "reclaimable_bytes": 11738841088, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 114.004150167, "owned_rss_bytes": 281214976, "owned_process_count": 4, "reclaimable_bytes": 11757928448, "swapins": 44112843, "swapouts": 77525566}
{"elapsed_seconds": 114.248238375, "owned_rss_bytes": 314900480, "owned_process_count": 4, "reclaimable_bytes": 11716214784, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 114.491382292, "owned_rss_bytes": 330448896, "owned_process_count": 4, "reclaimable_bytes": 12490866688, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 114.739103583, "owned_rss_bytes": 338165760, "owned_process_count": 4, "reclaimable_bytes": 12576980992, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 114.977824458, "owned_rss_bytes": 350420992, "owned_process_count": 4, "reclaimable_bytes": 12565479424, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 115.221530792, "owned_rss_bytes": 364347392, "owned_process_count": 4, "reclaimable_bytes": 12553043968, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 115.46954637500001, "owned_rss_bytes": 374210560, "owned_process_count": 4, "reclaimable_bytes": 12466782208, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 115.73048475, "owned_rss_bytes": 387170304, "owned_process_count": 4, "reclaimable_bytes": 12439502848, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 115.973568042, "owned_rss_bytes": 403619840, "owned_process_count": 4, "reclaimable_bytes": 12422103040, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 116.216075, "owned_rss_bytes": 408600576, "owned_process_count": 4, "reclaimable_bytes": 12413960192, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 116.466170667, "owned_rss_bytes": 418299904, "owned_process_count": 4, "reclaimable_bytes": 12405997568, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 116.712668625, "owned_rss_bytes": 428294144, "owned_process_count": 4, "reclaimable_bytes": 12396707840, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 116.954990792, "owned_rss_bytes": 438550528, "owned_process_count": 4, "reclaimable_bytes": 12378177536, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 117.201783667, "owned_rss_bytes": 444121088, "owned_process_count": 4, "reclaimable_bytes": 12372475904, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 117.452330583, "owned_rss_bytes": 449445888, "owned_process_count": 4, "reclaimable_bytes": 12358352896, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 117.702735792, "owned_rss_bytes": 451493888, "owned_process_count": 4, "reclaimable_bytes": 12347146240, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 117.952696708, "owned_rss_bytes": 452280320, "owned_process_count": 4, "reclaimable_bytes": 12158386176, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 118.201003042, "owned_rss_bytes": 453443584, "owned_process_count": 4, "reclaimable_bytes": 12157009920, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 118.443825917, "owned_rss_bytes": 456048640, "owned_process_count": 4, "reclaimable_bytes": 12155748352, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 118.691911167, "owned_rss_bytes": 460324864, "owned_process_count": 4, "reclaimable_bytes": 12149506048, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 118.942548083, "owned_rss_bytes": 462012416, "owned_process_count": 4, "reclaimable_bytes": 12145737728, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 119.189616375, "owned_rss_bytes": 462077952, "owned_process_count": 4, "reclaimable_bytes": 12311330816, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 119.428451458, "owned_rss_bytes": 464568320, "owned_process_count": 4, "reclaimable_bytes": 12300271616, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 119.67244587500001, "owned_rss_bytes": 467648512, "owned_process_count": 4, "reclaimable_bytes": 12313214976, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 119.921603833, "owned_rss_bytes": 472498176, "owned_process_count": 4, "reclaimable_bytes": 12315410432, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 120.166362292, "owned_rss_bytes": 474120192, "owned_process_count": 4, "reclaimable_bytes": 12449693696, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 120.40635387500001, "owned_rss_bytes": 474218496, "owned_process_count": 4, "reclaimable_bytes": 12335628288, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 120.651766208, "owned_rss_bytes": 474841088, "owned_process_count": 4, "reclaimable_bytes": 12297699328, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 120.89969525000001, "owned_rss_bytes": 475152384, "owned_process_count": 4, "reclaimable_bytes": 12288409600, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 121.142642583, "owned_rss_bytes": 475267072, "owned_process_count": 4, "reclaimable_bytes": 12277153792, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 121.389993667, "owned_rss_bytes": 475742208, "owned_process_count": 4, "reclaimable_bytes": 12289032192, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 121.643541458, "owned_rss_bytes": 475742208, "owned_process_count": 4, "reclaimable_bytes": 12286836736, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 121.89586654200001, "owned_rss_bytes": 475987968, "owned_process_count": 4, "reclaimable_bytes": 12290129920, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 122.14667975, "owned_rss_bytes": 476168192, "owned_process_count": 4, "reclaimable_bytes": 12284362752, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 122.390371875, "owned_rss_bytes": 476446720, "owned_process_count": 4, "reclaimable_bytes": 12282658816, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 122.639618583, "owned_rss_bytes": 511377408, "owned_process_count": 4, "reclaimable_bytes": 12232065024, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 122.894644583, "owned_rss_bytes": 611188736, "owned_process_count": 4, "reclaimable_bytes": 12154404864, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 123.1444765, "owned_rss_bytes": 231030784, "owned_process_count": 4, "reclaimable_bytes": 12482527232, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 123.391425833, "owned_rss_bytes": 308903936, "owned_process_count": 4, "reclaimable_bytes": 12459622400, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 123.643011708, "owned_rss_bytes": 314408960, "owned_process_count": 4, "reclaimable_bytes": 12457820160, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 123.89409291700001, "owned_rss_bytes": 322093056, "owned_process_count": 4, "reclaimable_bytes": 12448858112, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 124.133722375, "owned_rss_bytes": 331694080, "owned_process_count": 4, "reclaimable_bytes": 12437831680, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 124.37966287500001, "owned_rss_bytes": 347734016, "owned_process_count": 4, "reclaimable_bytes": 12420726784, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 124.620981958, "owned_rss_bytes": 366034944, "owned_process_count": 4, "reclaimable_bytes": 12396019712, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 124.868796292, "owned_rss_bytes": 377618432, "owned_process_count": 4, "reclaimable_bytes": 12382224384, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 125.112130583, "owned_rss_bytes": 392871936, "owned_process_count": 4, "reclaimable_bytes": 12358139904, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 125.36672433300001, "owned_rss_bytes": 395247616, "owned_process_count": 4, "reclaimable_bytes": 12360286208, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 125.61636825000001, "owned_rss_bytes": 402276352, "owned_process_count": 4, "reclaimable_bytes": 12367052800, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 125.88330904200001, "owned_rss_bytes": 412745728, "owned_process_count": 4, "reclaimable_bytes": 12358434816, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 126.128705333, "owned_rss_bytes": 416890880, "owned_process_count": 4, "reclaimable_bytes": 12353060864, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 126.377432375, "owned_rss_bytes": 418496512, "owned_process_count": 4, "reclaimable_bytes": 12353028096, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 126.625844625, "owned_rss_bytes": 418791424, "owned_process_count": 4, "reclaimable_bytes": 12347621376, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 126.86846654200001, "owned_rss_bytes": 418889728, "owned_process_count": 4, "reclaimable_bytes": 12428296192, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 127.11031733300001, "owned_rss_bytes": 422150144, "owned_process_count": 4, "reclaimable_bytes": 12397051904, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 127.35368704199999, "owned_rss_bytes": 422330368, "owned_process_count": 4, "reclaimable_bytes": 12368396288, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 127.60275741699999, "owned_rss_bytes": 422821888, "owned_process_count": 4, "reclaimable_bytes": 12338462720, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 127.849889708, "owned_rss_bytes": 424034304, "owned_process_count": 4, "reclaimable_bytes": 12336660480, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 128.09380775, "owned_rss_bytes": 425492480, "owned_process_count": 4, "reclaimable_bytes": 12340822016, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 128.349367167, "owned_rss_bytes": 428539904, "owned_process_count": 4, "reclaimable_bytes": 12331614208, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 128.598054875, "owned_rss_bytes": 428621824, "owned_process_count": 4, "reclaimable_bytes": 12335628288, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 128.848814667, "owned_rss_bytes": 430325760, "owned_process_count": 4, "reclaimable_bytes": 12332367872, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 129.100389708, "owned_rss_bytes": 430604288, "owned_process_count": 4, "reclaimable_bytes": 12335235072, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 129.35101170800002, "owned_rss_bytes": 430669824, "owned_process_count": 4, "reclaimable_bytes": 12338413568, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 129.60901525, "owned_rss_bytes": 430899200, "owned_process_count": 4, "reclaimable_bytes": 12335759360, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 129.86442125, "owned_rss_bytes": 431013888, "owned_process_count": 4, "reclaimable_bytes": 12339118080, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 130.114663667, "owned_rss_bytes": 431554560, "owned_process_count": 4, "reclaimable_bytes": 12340740096, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 130.36637725, "owned_rss_bytes": 459407360, "owned_process_count": 4, "reclaimable_bytes": 12305219584, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 130.613044083, "owned_rss_bytes": 486326272, "owned_process_count": 4, "reclaimable_bytes": 12283428864, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 130.864944167, "owned_rss_bytes": 500400128, "owned_process_count": 4, "reclaimable_bytes": 12275613696, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 131.10529962500001, "owned_rss_bytes": 561299456, "owned_process_count": 4, "reclaimable_bytes": 12214960128, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 131.353250333, "owned_rss_bytes": 576290816, "owned_process_count": 4, "reclaimable_bytes": 12208668672, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 131.602793083, "owned_rss_bytes": 577028096, "owned_process_count": 4, "reclaimable_bytes": 12204949504, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 131.84944050000001, "owned_rss_bytes": 577257472, "owned_process_count": 4, "reclaimable_bytes": 12204605440, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 132.09852825000002, "owned_rss_bytes": 577290240, "owned_process_count": 4, "reclaimable_bytes": 12204965888, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 132.349225625, "owned_rss_bytes": 577470464, "owned_process_count": 4, "reclaimable_bytes": 12189450240, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 132.599692708, "owned_rss_bytes": 579207168, "owned_process_count": 4, "reclaimable_bytes": 12202344448, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 132.847333583, "owned_rss_bytes": 581533696, "owned_process_count": 4, "reclaimable_bytes": 12203671552, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 133.093061167, "owned_rss_bytes": 582156288, "owned_process_count": 4, "reclaimable_bytes": 12201820160, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 133.33183533300001, "owned_rss_bytes": 584482816, "owned_process_count": 4, "reclaimable_bytes": 12199067648, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 133.573649083, "owned_rss_bytes": 591937536, "owned_process_count": 4, "reclaimable_bytes": 12195594240, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 133.819045458, "owned_rss_bytes": 597098496, "owned_process_count": 4, "reclaimable_bytes": 12180619264, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 134.066285833, "owned_rss_bytes": 604274688, "owned_process_count": 4, "reclaimable_bytes": 12171624448, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 134.30675837500002, "owned_rss_bytes": 604700672, "owned_process_count": 4, "reclaimable_bytes": 12177276928, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 134.556623875, "owned_rss_bytes": 610516992, "owned_process_count": 4, "reclaimable_bytes": 12172722176, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 134.802091125, "owned_rss_bytes": 616693760, "owned_process_count": 4, "reclaimable_bytes": 12163563520, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 135.051882333, "owned_rss_bytes": 624771072, "owned_process_count": 4, "reclaimable_bytes": 12156633088, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 135.300969208, "owned_rss_bytes": 624918528, "owned_process_count": 4, "reclaimable_bytes": 12151521280, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 135.552270833, "owned_rss_bytes": 629080064, "owned_process_count": 4, "reclaimable_bytes": 12233883648, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 135.791673583, "owned_rss_bytes": 634617856, "owned_process_count": 4, "reclaimable_bytes": 12221104128, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 136.0374955, "owned_rss_bytes": 635043840, "owned_process_count": 4, "reclaimable_bytes": 12160761856, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 136.287176583, "owned_rss_bytes": 639074304, "owned_process_count": 4, "reclaimable_bytes": 12112003072, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 136.536396292, "owned_rss_bytes": 642007040, "owned_process_count": 4, "reclaimable_bytes": 12111265792, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 136.787961583, "owned_rss_bytes": 642138112, "owned_process_count": 4, "reclaimable_bytes": 12090720256, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 137.0362605, "owned_rss_bytes": 646414336, "owned_process_count": 4, "reclaimable_bytes": 12083740672, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 137.287519083, "owned_rss_bytes": 648970240, "owned_process_count": 4, "reclaimable_bytes": 12083937280, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 137.533599167, "owned_rss_bytes": 650543104, "owned_process_count": 4, "reclaimable_bytes": 12081577984, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 137.783059667, "owned_rss_bytes": 652935168, "owned_process_count": 4, "reclaimable_bytes": 12080316416, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 138.033020708, "owned_rss_bytes": 655278080, "owned_process_count": 4, "reclaimable_bytes": 12079202304, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 138.283863833, "owned_rss_bytes": 655343616, "owned_process_count": 4, "reclaimable_bytes": 12074483712, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 138.528425417, "owned_rss_bytes": 655638528, "owned_process_count": 4, "reclaimable_bytes": 12077203456, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 138.779945375, "owned_rss_bytes": 657473536, "owned_process_count": 4, "reclaimable_bytes": 12079841280, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 139.023171083, "owned_rss_bytes": 659128320, "owned_process_count": 4, "reclaimable_bytes": 12073238528, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 139.26635587500002, "owned_rss_bytes": 659521536, "owned_process_count": 4, "reclaimable_bytes": 12071796736, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 139.52026075, "owned_rss_bytes": 663011328, "owned_process_count": 4, "reclaimable_bytes": 12072452096, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 139.766486167, "owned_rss_bytes": 666648576, "owned_process_count": 4, "reclaimable_bytes": 11951800320, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 140.0069265, "owned_rss_bytes": 666796032, "owned_process_count": 4, "reclaimable_bytes": 11943772160, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 140.252721708, "owned_rss_bytes": 668516352, "owned_process_count": 4, "reclaimable_bytes": 11951308800, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 140.503925958, "owned_rss_bytes": 669564928, "owned_process_count": 4, "reclaimable_bytes": 11995774976, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 140.750195708, "owned_rss_bytes": 671514624, "owned_process_count": 4, "reclaimable_bytes": 11809062912, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 140.996138292, "owned_rss_bytes": 674152448, "owned_process_count": 4, "reclaimable_bytes": 11804147712, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 141.238939125, "owned_rss_bytes": 674512896, "owned_process_count": 4, "reclaimable_bytes": 11803394048, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 141.485903667, "owned_rss_bytes": 678526976, "owned_process_count": 4, "reclaimable_bytes": 11794776064, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 141.731408542, "owned_rss_bytes": 679182336, "owned_process_count": 4, "reclaimable_bytes": 11799658496, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 141.977178792, "owned_rss_bytes": 680181760, "owned_process_count": 4, "reclaimable_bytes": 11974295552, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 142.222838375, "owned_rss_bytes": 681656320, "owned_process_count": 4, "reclaimable_bytes": 11974819840, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 142.471596958, "owned_rss_bytes": 685375488, "owned_process_count": 4, "reclaimable_bytes": 11972018176, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 142.713148833, "owned_rss_bytes": 685424640, "owned_process_count": 4, "reclaimable_bytes": 12057673728, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 142.95830741700001, "owned_rss_bytes": 686030848, "owned_process_count": 4, "reclaimable_bytes": 11993661440, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 143.205106, "owned_rss_bytes": 686571520, "owned_process_count": 4, "reclaimable_bytes": 11719589888, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 143.45543666700001, "owned_rss_bytes": 688439296, "owned_process_count": 4, "reclaimable_bytes": 11729453056, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 143.700073833, "owned_rss_bytes": 689717248, "owned_process_count": 4, "reclaimable_bytes": 11727732736, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 143.945594833, "owned_rss_bytes": 690667520, "owned_process_count": 4, "reclaimable_bytes": 11728404480, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 144.187019375, "owned_rss_bytes": 690716672, "owned_process_count": 4, "reclaimable_bytes": 11809226752, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 144.4259445, "owned_rss_bytes": 691683328, "owned_process_count": 4, "reclaimable_bytes": 11949408256, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 144.66940375000001, "owned_rss_bytes": 692699136, "owned_process_count": 4, "reclaimable_bytes": 11910053888, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 144.916386083, "owned_rss_bytes": 695042048, "owned_process_count": 4, "reclaimable_bytes": 11898617856, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 145.165573292, "owned_rss_bytes": 696352768, "owned_process_count": 4, "reclaimable_bytes": 11892211712, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 145.41101, "owned_rss_bytes": 696729600, "owned_process_count": 4, "reclaimable_bytes": 11892162560, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 145.659850167, "owned_rss_bytes": 699105280, "owned_process_count": 4, "reclaimable_bytes": 11889655808, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 145.911859542, "owned_rss_bytes": 699105280, "owned_process_count": 4, "reclaimable_bytes": 11881791488, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 146.160127042, "owned_rss_bytes": 701153280, "owned_process_count": 4, "reclaimable_bytes": 11872141312, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 146.410624042, "owned_rss_bytes": 706035712, "owned_process_count": 4, "reclaimable_bytes": 11848007680, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 146.656771375, "owned_rss_bytes": 706166784, "owned_process_count": 4, "reclaimable_bytes": 11847811072, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 146.90529925, "owned_rss_bytes": 706904064, "owned_process_count": 4, "reclaimable_bytes": 11836850176, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 147.153827375, "owned_rss_bytes": 715816960, "owned_process_count": 4, "reclaimable_bytes": 11824070656, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 147.399702583, "owned_rss_bytes": 716668928, "owned_process_count": 4, "reclaimable_bytes": 11813126144, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 147.65039375, "owned_rss_bytes": 717078528, "owned_process_count": 4, "reclaimable_bytes": 11803181056, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 147.899712958, "owned_rss_bytes": 721747968, "owned_process_count": 4, "reclaimable_bytes": 11613192192, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 148.14831445800002, "owned_rss_bytes": 722288640, "owned_process_count": 4, "reclaimable_bytes": 11412127744, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 148.403887375, "owned_rss_bytes": 722337792, "owned_process_count": 4, "reclaimable_bytes": 11408031744, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 148.644972417, "owned_rss_bytes": 722354176, "owned_process_count": 4, "reclaimable_bytes": 11416289280, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 148.894646833, "owned_rss_bytes": 724500480, "owned_process_count": 4, "reclaimable_bytes": 11573526528, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 149.145921375, "owned_rss_bytes": 725942272, "owned_process_count": 4, "reclaimable_bytes": 11757076480, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 149.39776137500002, "owned_rss_bytes": 726433792, "owned_process_count": 4, "reclaimable_bytes": 11735318528, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 149.6448005, "owned_rss_bytes": 727187456, "owned_process_count": 4, "reclaimable_bytes": 11739348992, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 149.90009, "owned_rss_bytes": 728514560, "owned_process_count": 4, "reclaimable_bytes": 11770544128, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 150.152050417, "owned_rss_bytes": 730824704, "owned_process_count": 4, "reclaimable_bytes": 11770216448, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 150.396374333, "owned_rss_bytes": 730824704, "owned_process_count": 4, "reclaimable_bytes": 11767398400, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 150.6446245, "owned_rss_bytes": 731217920, "owned_process_count": 4, "reclaimable_bytes": 11762401280, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 150.891114375, "owned_rss_bytes": 732954624, "owned_process_count": 4, "reclaimable_bytes": 11764531200, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 151.144006375, "owned_rss_bytes": 733298688, "owned_process_count": 4, "reclaimable_bytes": 11765743616, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 151.390300792, "owned_rss_bytes": 733773824, "owned_process_count": 4, "reclaimable_bytes": 11769085952, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 151.633706417, "owned_rss_bytes": 734167040, "owned_process_count": 4, "reclaimable_bytes": 11769987072, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 151.881858292, "owned_rss_bytes": 734248960, "owned_process_count": 4, "reclaimable_bytes": 11765039104, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 152.131854292, "owned_rss_bytes": 734494720, "owned_process_count": 4, "reclaimable_bytes": 11767447552, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 152.373630583, "owned_rss_bytes": 734724096, "owned_process_count": 4, "reclaimable_bytes": 11770380288, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 152.625678833, "owned_rss_bytes": 734937088, "owned_process_count": 4, "reclaimable_bytes": 11586289664, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 152.87734325, "owned_rss_bytes": 739213312, "owned_process_count": 4, "reclaimable_bytes": 11578916864, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 153.124059417, "owned_rss_bytes": 739803136, "owned_process_count": 4, "reclaimable_bytes": 11580293120, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 153.369182458, "owned_rss_bytes": 740065280, "owned_process_count": 4, "reclaimable_bytes": 11657969664, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 153.608202875, "owned_rss_bytes": 740179968, "owned_process_count": 4, "reclaimable_bytes": 11615682560, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 153.855497292, "owned_rss_bytes": 740245504, "owned_process_count": 4, "reclaimable_bytes": 11773509632, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 154.097089542, "owned_rss_bytes": 740278272, "owned_process_count": 4, "reclaimable_bytes": 11738939392, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 154.346517625, "owned_rss_bytes": 740294656, "owned_process_count": 4, "reclaimable_bytes": 11733401600, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 154.592191875, "owned_rss_bytes": 741949440, "owned_process_count": 4, "reclaimable_bytes": 11732090880, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 154.83280625, "owned_rss_bytes": 746258432, "owned_process_count": 4, "reclaimable_bytes": 11730862080, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 155.083037875, "owned_rss_bytes": 746373120, "owned_process_count": 4, "reclaimable_bytes": 11790925824, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 155.33602675, "owned_rss_bytes": 746389504, "owned_process_count": 4, "reclaimable_bytes": 11802492928, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 155.58498979200002, "owned_rss_bytes": 746553344, "owned_process_count": 4, "reclaimable_bytes": 11803754496, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 155.831824375, "owned_rss_bytes": 755187712, "owned_process_count": 4, "reclaimable_bytes": 11858821120, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 156.0829355, "owned_rss_bytes": 756498432, "owned_process_count": 4, "reclaimable_bytes": 11865735168, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 156.326948417, "owned_rss_bytes": 757497856, "owned_process_count": 4, "reclaimable_bytes": 11868897280, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 156.56935925, "owned_rss_bytes": 758792192, "owned_process_count": 4, "reclaimable_bytes": 11882528768, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 156.81527575, "owned_rss_bytes": 759119872, "owned_process_count": 4, "reclaimable_bytes": 11884363776, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 157.05514995800002, "owned_rss_bytes": 759119872, "owned_process_count": 4, "reclaimable_bytes": 11878563840, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 157.302881667, "owned_rss_bytes": 759185408, "owned_process_count": 4, "reclaimable_bytes": 11890786304, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 157.543406833, "owned_rss_bytes": 760086528, "owned_process_count": 4, "reclaimable_bytes": 11889754112, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 157.793309667, "owned_rss_bytes": 760086528, "owned_process_count": 4, "reclaimable_bytes": 11888132096, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 158.0483175, "owned_rss_bytes": 760086528, "owned_process_count": 4, "reclaimable_bytes": 11888361472, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 158.300479083, "owned_rss_bytes": 760086528, "owned_process_count": 4, "reclaimable_bytes": 11892867072, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 158.548808583, "owned_rss_bytes": 760086528, "owned_process_count": 4, "reclaimable_bytes": 11891703808, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 158.799882625, "owned_rss_bytes": 760315904, "owned_process_count": 4, "reclaimable_bytes": 11889213440, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 159.038946083, "owned_rss_bytes": 763084800, "owned_process_count": 4, "reclaimable_bytes": 11892228096, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 159.284281042, "owned_rss_bytes": 763084800, "owned_process_count": 4, "reclaimable_bytes": 11896307712, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 159.52211025, "owned_rss_bytes": 763559936, "owned_process_count": 4, "reclaimable_bytes": 11888443392, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 159.77132650000001, "owned_rss_bytes": 763625472, "owned_process_count": 4, "reclaimable_bytes": 11890753536, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 160.018609667, "owned_rss_bytes": 763625472, "owned_process_count": 4, "reclaimable_bytes": 11894620160, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 160.269553083, "owned_rss_bytes": 763625472, "owned_process_count": 4, "reclaimable_bytes": 11894620160, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 160.515480208, "owned_rss_bytes": 763625472, "owned_process_count": 4, "reclaimable_bytes": 11890180096, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 160.754623583, "owned_rss_bytes": 763625472, "owned_process_count": 4, "reclaimable_bytes": 11891556352, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 160.995183042, "owned_rss_bytes": 763625472, "owned_process_count": 4, "reclaimable_bytes": 11891654656, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 161.238877667, "owned_rss_bytes": 763985920, "owned_process_count": 4, "reclaimable_bytes": 11908055040, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 161.486611417, "owned_rss_bytes": 763985920, "owned_process_count": 4, "reclaimable_bytes": 12019597312, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 161.722485375, "owned_rss_bytes": 764084224, "owned_process_count": 4, "reclaimable_bytes": 12025593856, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 161.966368708, "owned_rss_bytes": 766148608, "owned_process_count": 4, "reclaimable_bytes": 12015910912, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 162.2139075, "owned_rss_bytes": 767033344, "owned_process_count": 4, "reclaimable_bytes": 12018089984, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 162.457757167, "owned_rss_bytes": 773652480, "owned_process_count": 4, "reclaimable_bytes": 12128780288, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 162.70269175, "owned_rss_bytes": 775340032, "owned_process_count": 4, "reclaimable_bytes": 12045910016, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 162.940368167, "owned_rss_bytes": 775487488, "owned_process_count": 4, "reclaimable_bytes": 12007374848, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 163.185309083, "owned_rss_bytes": 775487488, "owned_process_count": 4, "reclaimable_bytes": 12015566848, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 163.425045375, "owned_rss_bytes": 775487488, "owned_process_count": 4, "reclaimable_bytes": 12018237440, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 163.674055042, "owned_rss_bytes": 775569408, "owned_process_count": 4, "reclaimable_bytes": 12011896832, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 163.915138917, "owned_rss_bytes": 775569408, "owned_process_count": 4, "reclaimable_bytes": 12010864640, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 164.155838917, "owned_rss_bytes": 775569408, "owned_process_count": 4, "reclaimable_bytes": 12010373120, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 164.399345, "owned_rss_bytes": 776241152, "owned_process_count": 4, "reclaimable_bytes": 12010029056, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 164.639837917, "owned_rss_bytes": 776241152, "owned_process_count": 4, "reclaimable_bytes": 12012077056, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 164.881046167, "owned_rss_bytes": 776421376, "owned_process_count": 4, "reclaimable_bytes": 12008112128, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 165.1321375, "owned_rss_bytes": 777240576, "owned_process_count": 4, "reclaimable_bytes": 12006440960, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 165.375205208, "owned_rss_bytes": 777519104, "owned_process_count": 4, "reclaimable_bytes": 12008570880, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 165.618060042, "owned_rss_bytes": 777519104, "owned_process_count": 4, "reclaimable_bytes": 12006932480, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 165.85806862500002, "owned_rss_bytes": 777519104, "owned_process_count": 4, "reclaimable_bytes": 12012404736, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 166.102800583, "owned_rss_bytes": 777519104, "owned_process_count": 4, "reclaimable_bytes": 12012568576, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 166.344582292, "owned_rss_bytes": 777699328, "owned_process_count": 4, "reclaimable_bytes": 12018876416, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 166.5831685, "owned_rss_bytes": 778207232, "owned_process_count": 4, "reclaimable_bytes": 12015878144, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 166.82754125, "owned_rss_bytes": 778797056, "owned_process_count": 4, "reclaimable_bytes": 12043649024, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 167.081561583, "owned_rss_bytes": 779010048, "owned_process_count": 4, "reclaimable_bytes": 12043485184, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 167.323900458, "owned_rss_bytes": 779075584, "owned_process_count": 4, "reclaimable_bytes": 12045172736, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 167.5654575, "owned_rss_bytes": 779698176, "owned_process_count": 4, "reclaimable_bytes": 12051054592, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 167.813322167, "owned_rss_bytes": 780222464, "owned_process_count": 4, "reclaimable_bytes": 12049842176, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 168.052156958, "owned_rss_bytes": 781172736, "owned_process_count": 4, "reclaimable_bytes": 12046925824, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 168.298236792, "owned_rss_bytes": 801030144, "owned_process_count": 4, "reclaimable_bytes": 12108611584, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 168.539947042, "owned_rss_bytes": 802947072, "owned_process_count": 4, "reclaimable_bytes": 12071796736, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 168.786014, "owned_rss_bytes": 806256640, "owned_process_count": 4, "reclaimable_bytes": 12028198912, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 169.033031875, "owned_rss_bytes": 806256640, "owned_process_count": 4, "reclaimable_bytes": 12004147200, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 169.282463875, "owned_rss_bytes": 806584320, "owned_process_count": 4, "reclaimable_bytes": 12000854016, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 169.530997208, "owned_rss_bytes": 806846464, "owned_process_count": 4, "reclaimable_bytes": 11996987392, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 169.770894667, "owned_rss_bytes": 806846464, "owned_process_count": 4, "reclaimable_bytes": 11990941696, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 170.016028458, "owned_rss_bytes": 809418752, "owned_process_count": 4, "reclaimable_bytes": 11992678400, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 170.265116583, "owned_rss_bytes": 809697280, "owned_process_count": 4, "reclaimable_bytes": 11990433792, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 170.509701833, "owned_rss_bytes": 810385408, "owned_process_count": 4, "reclaimable_bytes": 11992858624, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 170.755195083, "owned_rss_bytes": 810385408, "owned_process_count": 4, "reclaimable_bytes": 12006309888, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 170.993566917, "owned_rss_bytes": 811384832, "owned_process_count": 4, "reclaimable_bytes": 12004065280, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 171.240042917, "owned_rss_bytes": 811384832, "owned_process_count": 4, "reclaimable_bytes": 12002852864, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 171.483370125, "owned_rss_bytes": 811384832, "owned_process_count": 4, "reclaimable_bytes": 12010176512, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 171.723648042, "owned_rss_bytes": 812318720, "owned_process_count": 4, "reclaimable_bytes": 12014764032, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 171.969363125, "owned_rss_bytes": 812318720, "owned_process_count": 4, "reclaimable_bytes": 12012666880, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 172.224494375, "owned_rss_bytes": 812335104, "owned_process_count": 4, "reclaimable_bytes": 12010848256, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 172.467864708, "owned_rss_bytes": 812351488, "owned_process_count": 4, "reclaimable_bytes": 12023398400, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 172.709950042, "owned_rss_bytes": 813268992, "owned_process_count": 4, "reclaimable_bytes": 12024791040, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 172.956288917, "owned_rss_bytes": 813809664, "owned_process_count": 4, "reclaimable_bytes": 12025249792, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 173.206383625, "owned_rss_bytes": 819740672, "owned_process_count": 4, "reclaimable_bytes": 12018630656, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 173.459942458, "owned_rss_bytes": 820002816, "owned_process_count": 4, "reclaimable_bytes": 12177932288, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 173.70600795800001, "owned_rss_bytes": 820002816, "owned_process_count": 4, "reclaimable_bytes": 12179734528, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 173.953812042, "owned_rss_bytes": 820002816, "owned_process_count": 4, "reclaimable_bytes": 12181585920, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 174.189641875, "owned_rss_bytes": 820559872, "owned_process_count": 4, "reclaimable_bytes": 12181372928, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 174.4283455, "owned_rss_bytes": 821035008, "owned_process_count": 4, "reclaimable_bytes": 12259622912, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 174.663411917, "owned_rss_bytes": 821035008, "owned_process_count": 4, "reclaimable_bytes": 12361072640, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 174.901151833, "owned_rss_bytes": 821035008, "owned_process_count": 4, "reclaimable_bytes": 12224888832, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 175.144497792, "owned_rss_bytes": 821657600, "owned_process_count": 4, "reclaimable_bytes": 12205735936, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 175.393111333, "owned_rss_bytes": 821657600, "owned_process_count": 4, "reclaimable_bytes": 12170018816, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 175.638171167, "owned_rss_bytes": 823443456, "owned_process_count": 4, "reclaimable_bytes": 12167397376, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 175.883025542, "owned_rss_bytes": 826933248, "owned_process_count": 4, "reclaimable_bytes": 12170608640, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 176.129384667, "owned_rss_bytes": 828243968, "owned_process_count": 4, "reclaimable_bytes": 12164956160, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 176.369450417, "owned_rss_bytes": 828850176, "owned_process_count": 4, "reclaimable_bytes": 12164595712, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 176.61128675, "owned_rss_bytes": 828932096, "owned_process_count": 4, "reclaimable_bytes": 12168019968, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 176.855922708, "owned_rss_bytes": 828932096, "owned_process_count": 4, "reclaimable_bytes": 12160532480, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 177.10002391700002, "owned_rss_bytes": 828932096, "owned_process_count": 4, "reclaimable_bytes": 12155437056, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 177.345609208, "owned_rss_bytes": 829800448, "owned_process_count": 4, "reclaimable_bytes": 12158189568, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 177.58736554200001, "owned_rss_bytes": 829915136, "owned_process_count": 4, "reclaimable_bytes": 12155371520, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 177.826610833, "owned_rss_bytes": 830128128, "owned_process_count": 4, "reclaimable_bytes": 12158746624, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 178.063673417, "owned_rss_bytes": 830128128, "owned_process_count": 4, "reclaimable_bytes": 12150964224, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 178.303458083, "owned_rss_bytes": 830128128, "owned_process_count": 4, "reclaimable_bytes": 11965136896, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 178.547938125, "owned_rss_bytes": 830504960, "owned_process_count": 4, "reclaimable_bytes": 11968593920, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 178.795194, "owned_rss_bytes": 830504960, "owned_process_count": 4, "reclaimable_bytes": 11967709184, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 179.041335833, "owned_rss_bytes": 830898176, "owned_process_count": 4, "reclaimable_bytes": 11962531840, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 179.288099708, "owned_rss_bytes": 830898176, "owned_process_count": 4, "reclaimable_bytes": 12119621632, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 179.530028167, "owned_rss_bytes": 830898176, "owned_process_count": 4, "reclaimable_bytes": 12112068608, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 179.776630167, "owned_rss_bytes": 830898176, "owned_process_count": 4, "reclaimable_bytes": 12131385344, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 180.019134583, "owned_rss_bytes": 831668224, "owned_process_count": 4, "reclaimable_bytes": 12130811904, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 180.26348454200001, "owned_rss_bytes": 837484544, "owned_process_count": 4, "reclaimable_bytes": 12124192768, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 180.512920708, "owned_rss_bytes": 837484544, "owned_process_count": 4, "reclaimable_bytes": 12126126080, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 180.755551333, "owned_rss_bytes": 837795840, "owned_process_count": 4, "reclaimable_bytes": 12133400576, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 180.99351525, "owned_rss_bytes": 837795840, "owned_process_count": 4, "reclaimable_bytes": 12215091200, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 181.232099167, "owned_rss_bytes": 837828608, "owned_process_count": 4, "reclaimable_bytes": 12165677056, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 181.477618458, "owned_rss_bytes": 837828608, "owned_process_count": 4, "reclaimable_bytes": 12110364672, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 181.716358125, "owned_rss_bytes": 838008832, "owned_process_count": 4, "reclaimable_bytes": 12108152832, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 181.960204667, "owned_rss_bytes": 838008832, "owned_process_count": 4, "reclaimable_bytes": 12109201408, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 182.196778667, "owned_rss_bytes": 838008832, "owned_process_count": 4, "reclaimable_bytes": 12107169792, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 182.431707292, "owned_rss_bytes": 838008832, "owned_process_count": 4, "reclaimable_bytes": 12108546048, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 182.679798583, "owned_rss_bytes": 838008832, "owned_process_count": 4, "reclaimable_bytes": 12099731456, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 182.918466542, "owned_rss_bytes": 838025216, "owned_process_count": 4, "reclaimable_bytes": 12103385088, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 183.155249583, "owned_rss_bytes": 838860800, "owned_process_count": 4, "reclaimable_bytes": 12105400320, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 183.395079583, "owned_rss_bytes": 839139328, "owned_process_count": 4, "reclaimable_bytes": 12101976064, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 183.640799667, "owned_rss_bytes": 839139328, "owned_process_count": 4, "reclaimable_bytes": 12074401792, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 183.88142150000002, "owned_rss_bytes": 839335936, "owned_process_count": 4, "reclaimable_bytes": 12084772864, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 184.118681833, "owned_rss_bytes": 839368704, "owned_process_count": 4, "reclaimable_bytes": 12093341696, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 184.360519917, "owned_rss_bytes": 839958528, "owned_process_count": 4, "reclaimable_bytes": 12093079552, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 184.603663042, "owned_rss_bytes": 841957376, "owned_process_count": 4, "reclaimable_bytes": 12094128128, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 184.843263708, "owned_rss_bytes": 842022912, "owned_process_count": 4, "reclaimable_bytes": 12090048512, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 185.089611542, "owned_rss_bytes": 842366976, "owned_process_count": 4, "reclaimable_bytes": 12088246272, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 185.347774458, "owned_rss_bytes": 842448896, "owned_process_count": 4, "reclaimable_bytes": 12096389120, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 185.590096833, "owned_rss_bytes": 842612736, "owned_process_count": 4, "reclaimable_bytes": 12098404352, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 185.83321575, "owned_rss_bytes": 842727424, "owned_process_count": 4, "reclaimable_bytes": 12048875520, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 186.083337542, "owned_rss_bytes": 843644928, "owned_process_count": 4, "reclaimable_bytes": 12001263616, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 186.33490833300002, "owned_rss_bytes": 843644928, "owned_process_count": 4, "reclaimable_bytes": 11998396416, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 186.575395917, "owned_rss_bytes": 843644928, "owned_process_count": 4, "reclaimable_bytes": 12019236864, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 186.833032417, "owned_rss_bytes": 843644928, "owned_process_count": 4, "reclaimable_bytes": 12015665152, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 187.079142458, "owned_rss_bytes": 854638592, "owned_process_count": 4, "reclaimable_bytes": 12001001472, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 187.324837208, "owned_rss_bytes": 860356608, "owned_process_count": 4, "reclaimable_bytes": 12000051200, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 187.567138083, "owned_rss_bytes": 860946432, "owned_process_count": 4, "reclaimable_bytes": 11995660288, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 187.803948917, "owned_rss_bytes": 860946432, "owned_process_count": 4, "reclaimable_bytes": 12001656832, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 188.042953625, "owned_rss_bytes": 860946432, "owned_process_count": 4, "reclaimable_bytes": 11998216192, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 188.278633375, "owned_rss_bytes": 861028352, "owned_process_count": 4, "reclaimable_bytes": 12000149504, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 188.526850708, "owned_rss_bytes": 861421568, "owned_process_count": 4, "reclaimable_bytes": 11997691904, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 188.771441125, "owned_rss_bytes": 861421568, "owned_process_count": 4, "reclaimable_bytes": 12000722944, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 189.019333125, "owned_rss_bytes": 862273536, "owned_process_count": 4, "reclaimable_bytes": 12004687872, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 189.26730125, "owned_rss_bytes": 862289920, "owned_process_count": 4, "reclaimable_bytes": 11955650560, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 189.514092417, "owned_rss_bytes": 862289920, "owned_process_count": 4, "reclaimable_bytes": 11934138368, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 189.752687375, "owned_rss_bytes": 862289920, "owned_process_count": 4, "reclaimable_bytes": 11928141824, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 189.998995667, "owned_rss_bytes": 862289920, "owned_process_count": 4, "reclaimable_bytes": 11916247040, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 190.248893667, "owned_rss_bytes": 862289920, "owned_process_count": 4, "reclaimable_bytes": 11925274624, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 190.49651500000002, "owned_rss_bytes": 862289920, "owned_process_count": 4, "reclaimable_bytes": 11917508608, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 190.743709, "owned_rss_bytes": 862289920, "owned_process_count": 4, "reclaimable_bytes": 11999363072, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 190.988673625, "owned_rss_bytes": 862322688, "owned_process_count": 4, "reclaimable_bytes": 11991597056, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 191.235198958, "owned_rss_bytes": 862322688, "owned_process_count": 4, "reclaimable_bytes": 11988484096, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 191.481371, "owned_rss_bytes": 862322688, "owned_process_count": 4, "reclaimable_bytes": 11940167680, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 191.72840787500002, "owned_rss_bytes": 862568448, "owned_process_count": 4, "reclaimable_bytes": 11932286976, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 191.97572775, "owned_rss_bytes": 862765056, "owned_process_count": 4, "reclaimable_bytes": 11922407424, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 192.228299792, "owned_rss_bytes": 862896128, "owned_process_count": 4, "reclaimable_bytes": 11912609792, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 192.475091875, "owned_rss_bytes": 862978048, "owned_process_count": 4, "reclaimable_bytes": 11908153344, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 192.721723125, "owned_rss_bytes": 862994432, "owned_process_count": 4, "reclaimable_bytes": 11907891200, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 192.968663958, "owned_rss_bytes": 863584256, "owned_process_count": 4, "reclaimable_bytes": 11901124608, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 193.21881529200002, "owned_rss_bytes": 863584256, "owned_process_count": 4, "reclaimable_bytes": 11899387904, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 193.465662583, "owned_rss_bytes": 863600640, "owned_process_count": 4, "reclaimable_bytes": 11894554624, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 193.712526625, "owned_rss_bytes": 864157696, "owned_process_count": 4, "reclaimable_bytes": 11891720192, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 193.960121375, "owned_rss_bytes": 864321536, "owned_process_count": 4, "reclaimable_bytes": 11887624192, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 194.199587083, "owned_rss_bytes": 864321536, "owned_process_count": 4, "reclaimable_bytes": 11546411008, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 194.447792958, "owned_rss_bytes": 864321536, "owned_process_count": 4, "reclaimable_bytes": 11336564736, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 194.697035667, "owned_rss_bytes": 864501760, "owned_process_count": 4, "reclaimable_bytes": 11016273920, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 194.947557542, "owned_rss_bytes": 864501760, "owned_process_count": 4, "reclaimable_bytes": 10781868032, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 195.200158292, "owned_rss_bytes": 864501760, "owned_process_count": 4, "reclaimable_bytes": 10657087488, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 195.446311833, "owned_rss_bytes": 864501760, "owned_process_count": 4, "reclaimable_bytes": 10588602368, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 195.688116, "owned_rss_bytes": 864501760, "owned_process_count": 4, "reclaimable_bytes": 10486333440, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 195.931503167, "owned_rss_bytes": 864501760, "owned_process_count": 4, "reclaimable_bytes": 10417946624, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 196.169729458, "owned_rss_bytes": 864501760, "owned_process_count": 4, "reclaimable_bytes": 10365468672, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 196.412873833, "owned_rss_bytes": 864501760, "owned_process_count": 4, "reclaimable_bytes": 10304749568, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 196.659223583, "owned_rss_bytes": 864518144, "owned_process_count": 4, "reclaimable_bytes": 10244653056, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 196.906269458, "owned_rss_bytes": 864518144, "owned_process_count": 4, "reclaimable_bytes": 10185408512, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 197.143907875, "owned_rss_bytes": 864550912, "owned_process_count": 4, "reclaimable_bytes": 10126229504, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 197.382160417, "owned_rss_bytes": 864731136, "owned_process_count": 4, "reclaimable_bytes": 10037248000, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 197.630298167, "owned_rss_bytes": 864763904, "owned_process_count": 4, "reclaimable_bytes": 9984851968, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 197.871494208, "owned_rss_bytes": 864780288, "owned_process_count": 4, "reclaimable_bytes": 9941336064, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 198.124096708, "owned_rss_bytes": 864780288, "owned_process_count": 4, "reclaimable_bytes": 9889611776, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 198.373659583, "owned_rss_bytes": 864780288, "owned_process_count": 4, "reclaimable_bytes": 9840476160, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 198.62803925, "owned_rss_bytes": 864780288, "owned_process_count": 4, "reclaimable_bytes": 9786212352, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 198.877860792, "owned_rss_bytes": 864780288, "owned_process_count": 4, "reclaimable_bytes": 9735110656, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 199.118405083, "owned_rss_bytes": 865730560, "owned_process_count": 4, "reclaimable_bytes": 9677520896, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 199.357743042, "owned_rss_bytes": 866025472, "owned_process_count": 4, "reclaimable_bytes": 9669672960, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 199.601263083, "owned_rss_bytes": 866025472, "owned_process_count": 4, "reclaimable_bytes": 9473507328, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 199.847085833, "owned_rss_bytes": 866025472, "owned_process_count": 4, "reclaimable_bytes": 9398370304, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 200.088014625, "owned_rss_bytes": 866025472, "owned_process_count": 4, "reclaimable_bytes": 9375186944, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 200.332736292, "owned_rss_bytes": 866025472, "owned_process_count": 4, "reclaimable_bytes": 9371631616, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 200.582731708, "owned_rss_bytes": 866025472, "owned_process_count": 4, "reclaimable_bytes": 9371123712, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 200.825368667, "owned_rss_bytes": 866025472, "owned_process_count": 4, "reclaimable_bytes": 9146138624, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 201.076022333, "owned_rss_bytes": 866648064, "owned_process_count": 4, "reclaimable_bytes": 9063514112, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 201.32093137500001, "owned_rss_bytes": 866648064, "owned_process_count": 4, "reclaimable_bytes": 8969240576, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 201.566406, "owned_rss_bytes": 866648064, "owned_process_count": 4, "reclaimable_bytes": 8868364288, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 201.811178458, "owned_rss_bytes": 866648064, "owned_process_count": 4, "reclaimable_bytes": 8770846720, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 202.05868075, "owned_rss_bytes": 866648064, "owned_process_count": 4, "reclaimable_bytes": 8670642176, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 202.306130458, "owned_rss_bytes": 866992128, "owned_process_count": 4, "reclaimable_bytes": 8595406848, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 202.544633792, "owned_rss_bytes": 866992128, "owned_process_count": 4, "reclaimable_bytes": 8517730304, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 202.783045792, "owned_rss_bytes": 866992128, "owned_process_count": 4, "reclaimable_bytes": 8703557632, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 203.027145083, "owned_rss_bytes": 866992128, "owned_process_count": 4, "reclaimable_bytes": 8847081472, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 203.277842333, "owned_rss_bytes": 866992128, "owned_process_count": 4, "reclaimable_bytes": 8847966208, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 203.520672792, "owned_rss_bytes": 866992128, "owned_process_count": 4, "reclaimable_bytes": 8783560704, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 203.766827083, "owned_rss_bytes": 866992128, "owned_process_count": 4, "reclaimable_bytes": 8492859392, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 204.023218667, "owned_rss_bytes": 866992128, "owned_process_count": 4, "reclaimable_bytes": 8478081024, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 204.273776875, "owned_rss_bytes": 867008512, "owned_process_count": 4, "reclaimable_bytes": 8445624320, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 204.523106292, "owned_rss_bytes": 867008512, "owned_process_count": 4, "reclaimable_bytes": 8427225088, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 204.771507625, "owned_rss_bytes": 867008512, "owned_process_count": 4, "reclaimable_bytes": 8412659712, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 205.020153292, "owned_rss_bytes": 867008512, "owned_process_count": 4, "reclaimable_bytes": 8575156224, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 205.262116542, "owned_rss_bytes": 867172352, "owned_process_count": 4, "reclaimable_bytes": 8563261440, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 205.504866292, "owned_rss_bytes": 867221504, "owned_process_count": 4, "reclaimable_bytes": 8544272384, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 205.751608458, "owned_rss_bytes": 867254272, "owned_process_count": 4, "reclaimable_bytes": 8496496640, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 205.991795458, "owned_rss_bytes": 867270656, "owned_process_count": 4, "reclaimable_bytes": 8450670592, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 206.238002917, "owned_rss_bytes": 867287040, "owned_process_count": 4, "reclaimable_bytes": 8419540992, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 206.486794792, "owned_rss_bytes": 867418112, "owned_process_count": 4, "reclaimable_bytes": 8369766400, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 206.734670083, "owned_rss_bytes": 867418112, "owned_process_count": 4, "reclaimable_bytes": 8317485056, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 206.974253417, "owned_rss_bytes": 867549184, "owned_process_count": 4, "reclaimable_bytes": 8247787520, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 207.216361833, "owned_rss_bytes": 867549184, "owned_process_count": 4, "reclaimable_bytes": 8167211008, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 207.46040825, "owned_rss_bytes": 867565568, "owned_process_count": 4, "reclaimable_bytes": 8110424064, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 207.712405417, "owned_rss_bytes": 868122624, "owned_process_count": 4, "reclaimable_bytes": 8076771328, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 207.961713292, "owned_rss_bytes": 868122624, "owned_process_count": 4, "reclaimable_bytes": 8041725952, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 208.20548475, "owned_rss_bytes": 868122624, "owned_process_count": 4, "reclaimable_bytes": 7842594816, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 208.442840708, "owned_rss_bytes": 868204544, "owned_process_count": 4, "reclaimable_bytes": 7788396544, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 208.687475625, "owned_rss_bytes": 868335616, "owned_process_count": 4, "reclaimable_bytes": 7765671936, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 208.933456042, "owned_rss_bytes": 868335616, "owned_process_count": 4, "reclaimable_bytes": 7732019200, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 209.177194417, "owned_rss_bytes": 868335616, "owned_process_count": 4, "reclaimable_bytes": 7795408896, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 209.42717875, "owned_rss_bytes": 868352000, "owned_process_count": 4, "reclaimable_bytes": 7943667712, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 209.676513375, "owned_rss_bytes": 868352000, "owned_process_count": 4, "reclaimable_bytes": 7855095808, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 209.916348583, "owned_rss_bytes": 868352000, "owned_process_count": 4, "reclaimable_bytes": 7877902336, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 210.171296667, "owned_rss_bytes": 868352000, "owned_process_count": 4, "reclaimable_bytes": 7866286080, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 210.410896958, "owned_rss_bytes": 868368384, "owned_process_count": 4, "reclaimable_bytes": 7780515840, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 210.658916, "owned_rss_bytes": 868368384, "owned_process_count": 4, "reclaimable_bytes": 7748796416, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 210.904393667, "owned_rss_bytes": 868368384, "owned_process_count": 4, "reclaimable_bytes": 7730298880, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 211.151608, "owned_rss_bytes": 868384768, "owned_process_count": 4, "reclaimable_bytes": 7684784128, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 211.404619708, "owned_rss_bytes": 868384768, "owned_process_count": 4, "reclaimable_bytes": 9955672064, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 211.651067625, "owned_rss_bytes": 868401152, "owned_process_count": 4, "reclaimable_bytes": 9961816064, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 211.894737708, "owned_rss_bytes": 868401152, "owned_process_count": 4, "reclaimable_bytes": 9963913216, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 212.138562208, "owned_rss_bytes": 868401152, "owned_process_count": 4, "reclaimable_bytes": 9962635264, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 212.379913042, "owned_rss_bytes": 868450304, "owned_process_count": 4, "reclaimable_bytes": 11631640576, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 212.622317542, "owned_rss_bytes": 868450304, "owned_process_count": 4, "reclaimable_bytes": 11619827712, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 212.862914542, "owned_rss_bytes": 868450304, "owned_process_count": 4, "reclaimable_bytes": 11611914240, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 213.10995045800001, "owned_rss_bytes": 868450304, "owned_process_count": 4, "reclaimable_bytes": 11604738048, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 213.360790833, "owned_rss_bytes": 868450304, "owned_process_count": 4, "reclaimable_bytes": 11598069760, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 213.609549208, "owned_rss_bytes": 868450304, "owned_process_count": 4, "reclaimable_bytes": 11592155136, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 213.857312875, "owned_rss_bytes": 868466688, "owned_process_count": 4, "reclaimable_bytes": 11581194240, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 214.105181792, "owned_rss_bytes": 868466688, "owned_process_count": 4, "reclaimable_bytes": 11576819712, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 214.354874583, "owned_rss_bytes": 868499456, "owned_process_count": 4, "reclaimable_bytes": 11558273024, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 214.60264625, "owned_rss_bytes": 868499456, "owned_process_count": 4, "reclaimable_bytes": 11557044224, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 214.850483375, "owned_rss_bytes": 868532224, "owned_process_count": 4, "reclaimable_bytes": 11694800896, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 215.098400083, "owned_rss_bytes": 868532224, "owned_process_count": 4, "reclaimable_bytes": 11580817408, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 215.345293958, "owned_rss_bytes": 868581376, "owned_process_count": 4, "reclaimable_bytes": 11526553600, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 215.594783375, "owned_rss_bytes": 868581376, "owned_process_count": 4, "reclaimable_bytes": 11519246336, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 215.843036292, "owned_rss_bytes": 868581376, "owned_process_count": 4, "reclaimable_bytes": 11507236864, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 216.090754208, "owned_rss_bytes": 868581376, "owned_process_count": 4, "reclaimable_bytes": 11501928448, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 216.339003125, "owned_rss_bytes": 868581376, "owned_process_count": 4, "reclaimable_bytes": 11486855168, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 216.5872845, "owned_rss_bytes": 868581376, "owned_process_count": 4, "reclaimable_bytes": 11490344960, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 216.836180875, "owned_rss_bytes": 868581376, "owned_process_count": 4, "reclaimable_bytes": 11483987968, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 217.086030583, "owned_rss_bytes": 868581376, "owned_process_count": 4, "reclaimable_bytes": 11480039424, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 217.33415075, "owned_rss_bytes": 868581376, "owned_process_count": 4, "reclaimable_bytes": 11471060992, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 217.585627958, "owned_rss_bytes": 868958208, "owned_process_count": 4, "reclaimable_bytes": 11465097216, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 217.826341542, "owned_rss_bytes": 869203968, "owned_process_count": 4, "reclaimable_bytes": 11461705728, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 218.074884125, "owned_rss_bytes": 902053888, "owned_process_count": 4, "reclaimable_bytes": 11424153600, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 218.317039542, "owned_rss_bytes": 982269952, "owned_process_count": 4, "reclaimable_bytes": 11248353280, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 218.56833516700001, "owned_rss_bytes": 1066958848, "owned_process_count": 4, "reclaimable_bytes": 11048747008, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 218.843590458, "owned_rss_bytes": 1100005376, "owned_process_count": 4, "reclaimable_bytes": 10645520384, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 219.092124792, "owned_rss_bytes": 107151360, "owned_process_count": 3, "reclaimable_bytes": 12247023616, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 219.342309125, "owned_rss_bytes": 270974976, "owned_process_count": 4, "reclaimable_bytes": 12242173952, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 219.591845333, "owned_rss_bytes": 326156288, "owned_process_count": 4, "reclaimable_bytes": 12200771584, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 219.84052675, "owned_rss_bytes": 332496896, "owned_process_count": 4, "reclaimable_bytes": 12197462016, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 220.087201167, "owned_rss_bytes": 337379328, "owned_process_count": 4, "reclaimable_bytes": 12189466624, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 220.333059375, "owned_rss_bytes": 346767360, "owned_process_count": 4, "reclaimable_bytes": 12184076288, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 220.569974542, "owned_rss_bytes": 357924864, "owned_process_count": 4, "reclaimable_bytes": 12164988928, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 220.814314125, "owned_rss_bytes": 406896640, "owned_process_count": 4, "reclaimable_bytes": 12133974016, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 221.055556875, "owned_rss_bytes": 408453120, "owned_process_count": 4, "reclaimable_bytes": 12136038400, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 221.300342792, "owned_rss_bytes": 413351936, "owned_process_count": 4, "reclaimable_bytes": 12132007936, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 221.540504875, "owned_rss_bytes": 428736512, "owned_process_count": 4, "reclaimable_bytes": 12111282176, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 221.783032292, "owned_rss_bytes": 436174848, "owned_process_count": 4, "reclaimable_bytes": 12110266368, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 222.02697750000002, "owned_rss_bytes": 446332928, "owned_process_count": 4, "reclaimable_bytes": 12096012288, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 222.268809417, "owned_rss_bytes": 456097792, "owned_process_count": 4, "reclaimable_bytes": 12091408384, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 222.511732125, "owned_rss_bytes": 464060416, "owned_process_count": 4, "reclaimable_bytes": 12225150976, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 222.753426875, "owned_rss_bytes": 473923584, "owned_process_count": 4, "reclaimable_bytes": 12110217216, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 222.9912815, "owned_rss_bytes": 481263616, "owned_process_count": 4, "reclaimable_bytes": 12069765120, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 223.230500208, "owned_rss_bytes": 485310464, "owned_process_count": 4, "reclaimable_bytes": 12057591808, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 223.473762542, "owned_rss_bytes": 487587840, "owned_process_count": 4, "reclaimable_bytes": 12053807104, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 223.716353167, "owned_rss_bytes": 513441792, "owned_process_count": 4, "reclaimable_bytes": 12026724352, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 223.953209917, "owned_rss_bytes": 514080768, "owned_process_count": 4, "reclaimable_bytes": 12017516544, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 224.200115375, "owned_rss_bytes": 516980736, "owned_process_count": 4, "reclaimable_bytes": 12014485504, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 224.448290708, "owned_rss_bytes": 518389760, "owned_process_count": 4, "reclaimable_bytes": 12011110400, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 224.695342458, "owned_rss_bytes": 522731520, "owned_process_count": 4, "reclaimable_bytes": 11991367680, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 224.943024125, "owned_rss_bytes": 524206080, "owned_process_count": 4, "reclaimable_bytes": 11975524352, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 225.190082625, "owned_rss_bytes": 527777792, "owned_process_count": 4, "reclaimable_bytes": 11973443584, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 225.440157625, "owned_rss_bytes": 529448960, "owned_process_count": 4, "reclaimable_bytes": 11971592192, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 225.686643, "owned_rss_bytes": 535216128, "owned_process_count": 4, "reclaimable_bytes": 11948867584, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 225.931400333, "owned_rss_bytes": 535707648, "owned_process_count": 4, "reclaimable_bytes": 11955060736, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 226.179606833, "owned_rss_bytes": 540213248, "owned_process_count": 4, "reclaimable_bytes": 11945885696, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 226.427135583, "owned_rss_bytes": 540622848, "owned_process_count": 4, "reclaimable_bytes": 11940446208, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 226.669364708, "owned_rss_bytes": 540688384, "owned_process_count": 4, "reclaimable_bytes": 11931582464, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 226.908369583, "owned_rss_bytes": 540737536, "owned_process_count": 4, "reclaimable_bytes": 11926749184, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 227.156353458, "owned_rss_bytes": 541065216, "owned_process_count": 4, "reclaimable_bytes": 11916853248, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 227.402431208, "owned_rss_bytes": 541261824, "owned_process_count": 4, "reclaimable_bytes": 11910971392, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 227.643922417, "owned_rss_bytes": 541360128, "owned_process_count": 4, "reclaimable_bytes": 11900551168, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 227.88933170800001, "owned_rss_bytes": 541376512, "owned_process_count": 4, "reclaimable_bytes": 11894718464, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 228.138731167, "owned_rss_bytes": 541769728, "owned_process_count": 4, "reclaimable_bytes": 11889197056, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 228.384634417, "owned_rss_bytes": 542113792, "owned_process_count": 4, "reclaimable_bytes": 11879022592, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 228.623864583, "owned_rss_bytes": 542195712, "owned_process_count": 4, "reclaimable_bytes": 11869192192, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 228.870011708, "owned_rss_bytes": 594116608, "owned_process_count": 4, "reclaimable_bytes": 11806261248, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 229.118636083, "owned_rss_bytes": 143966208, "owned_process_count": 4, "reclaimable_bytes": 12117213184, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 229.365613, "owned_rss_bytes": 299630592, "owned_process_count": 4, "reclaimable_bytes": 12055330816, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 229.613794292, "owned_rss_bytes": 335724544, "owned_process_count": 4, "reclaimable_bytes": 12036685824, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 229.85265950000002, "owned_rss_bytes": 352501760, "owned_process_count": 4, "reclaimable_bytes": 12025151488, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 230.098882083, "owned_rss_bytes": 362872832, "owned_process_count": 4, "reclaimable_bytes": 12014780416, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 230.33919170800002, "owned_rss_bytes": 368623616, "owned_process_count": 4, "reclaimable_bytes": 12001148928, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 230.58466125, "owned_rss_bytes": 376569856, "owned_process_count": 4, "reclaimable_bytes": 11986550784, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 230.830381333, "owned_rss_bytes": 382844928, "owned_process_count": 4, "reclaimable_bytes": 11984486400, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 231.07477416700002, "owned_rss_bytes": 398245888, "owned_process_count": 4, "reclaimable_bytes": 11965546496, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 231.316977375, "owned_rss_bytes": 411369472, "owned_process_count": 4, "reclaimable_bytes": 12040962048, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 231.557319125, "owned_rss_bytes": 429785088, "owned_process_count": 4, "reclaimable_bytes": 11969298432, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 231.804796583, "owned_rss_bytes": 431276032, "owned_process_count": 4, "reclaimable_bytes": 11927076864, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 232.045923708, "owned_rss_bytes": 433733632, "owned_process_count": 4, "reclaimable_bytes": 11908907008, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 232.29670325, "owned_rss_bytes": 440532992, "owned_process_count": 4, "reclaimable_bytes": 11900583936, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 232.546115583, "owned_rss_bytes": 445759488, "owned_process_count": 4, "reclaimable_bytes": 11890851840, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 232.792762125, "owned_rss_bytes": 445775872, "owned_process_count": 4, "reclaimable_bytes": 11881332736, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 233.036595958, "owned_rss_bytes": 446939136, "owned_process_count": 4, "reclaimable_bytes": 11873075200, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 233.28635929200001, "owned_rss_bytes": 451575808, "owned_process_count": 4, "reclaimable_bytes": 11874746368, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 233.53533612500001, "owned_rss_bytes": 452198400, "owned_process_count": 4, "reclaimable_bytes": 11872534528, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 233.779287792, "owned_rss_bytes": 452476928, "owned_process_count": 4, "reclaimable_bytes": 11870371840, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 234.017187625, "owned_rss_bytes": 452673536, "owned_process_count": 4, "reclaimable_bytes": 11862065152, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 234.25557054200002, "owned_rss_bytes": 452706304, "owned_process_count": 4, "reclaimable_bytes": 12013895680, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 234.500567542, "owned_rss_bytes": 452722688, "owned_process_count": 4, "reclaimable_bytes": 12019941376, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 234.743704625, "owned_rss_bytes": 453148672, "owned_process_count": 4, "reclaimable_bytes": 12015304704, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 234.985712042, "owned_rss_bytes": 453476352, "owned_process_count": 4, "reclaimable_bytes": 12007538688, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 235.230496625, "owned_rss_bytes": 114982912, "owned_process_count": 3, "reclaimable_bytes": 12190056448, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 235.474875417, "owned_rss_bytes": 293552128, "owned_process_count": 4, "reclaimable_bytes": 12113641472, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 235.722072583, "owned_rss_bytes": 335052800, "owned_process_count": 4, "reclaimable_bytes": 12086165504, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 235.970232708, "owned_rss_bytes": 341917696, "owned_process_count": 4, "reclaimable_bytes": 12081348608, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 236.218721625, "owned_rss_bytes": 103874560, "owned_process_count": 3, "reclaimable_bytes": 12171673600, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 236.45612475000001, "owned_rss_bytes": 462782464, "owned_process_count": 5, "reclaimable_bytes": 11918082048, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 236.697471208, "owned_rss_bytes": 151961600, "owned_process_count": 4, "reclaimable_bytes": 12133285888, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 236.944169833, "owned_rss_bytes": 296632320, "owned_process_count": 4, "reclaimable_bytes": 12075597824, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 237.192819792, "owned_rss_bytes": 419577856, "owned_process_count": 4, "reclaimable_bytes": 11995152384, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 237.43235462500002, "owned_rss_bytes": 496664576, "owned_process_count": 4, "reclaimable_bytes": 11928764416, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 237.678004875, "owned_rss_bytes": 643219456, "owned_process_count": 4, "reclaimable_bytes": 11774509056, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 237.923690667, "owned_rss_bytes": 806256640, "owned_process_count": 4, "reclaimable_bytes": 11607064576, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 238.168190917, "owned_rss_bytes": 989233152, "owned_process_count": 4, "reclaimable_bytes": 11396366336, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 238.413034583, "owned_rss_bytes": 1260224512, "owned_process_count": 4, "reclaimable_bytes": 10984636416, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 238.651171125, "owned_rss_bytes": 1197473792, "owned_process_count": 4, "reclaimable_bytes": 11058331648, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 238.893828917, "owned_rss_bytes": 1216987136, "owned_process_count": 4, "reclaimable_bytes": 11030790144, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 239.139189958, "owned_rss_bytes": 1231536128, "owned_process_count": 4, "reclaimable_bytes": 11061936128, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 239.38302825, "owned_rss_bytes": 1231716352, "owned_process_count": 4, "reclaimable_bytes": 11061084160, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 239.629697625, "owned_rss_bytes": 1269202944, "owned_process_count": 4, "reclaimable_bytes": 11181113344, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 239.880410958, "owned_rss_bytes": 1280999424, "owned_process_count": 4, "reclaimable_bytes": 11188142080, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 240.129063417, "owned_rss_bytes": 1288994816, "owned_process_count": 4, "reclaimable_bytes": 11215929344, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 240.376705917, "owned_rss_bytes": 1292664832, "owned_process_count": 4, "reclaimable_bytes": 11235491840, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 240.627623542, "owned_rss_bytes": 1300512768, "owned_process_count": 4, "reclaimable_bytes": 11228971008, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 240.873417542, "owned_rss_bytes": 1309130752, "owned_process_count": 4, "reclaimable_bytes": 11219877888, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 241.116286583, "owned_rss_bytes": 1317208064, "owned_process_count": 4, "reclaimable_bytes": 11196039168, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 241.366685917, "owned_rss_bytes": 1325367296, "owned_process_count": 4, "reclaimable_bytes": 11191402496, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 241.609161125, "owned_rss_bytes": 1335967744, "owned_process_count": 4, "reclaimable_bytes": 11368759296, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 241.858222375, "owned_rss_bytes": 1350139904, "owned_process_count": 4, "reclaimable_bytes": 11360681984, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 242.099849, "owned_rss_bytes": 1367834624, "owned_process_count": 4, "reclaimable_bytes": 11338678272, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 242.343548083, "owned_rss_bytes": 1374191616, "owned_process_count": 4, "reclaimable_bytes": 11311513600, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 242.592300625, "owned_rss_bytes": 343982080, "owned_process_count": 5, "reclaimable_bytes": 12352192512, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 242.837925833, "owned_rss_bytes": 178208768, "owned_process_count": 4, "reclaimable_bytes": 12430655488, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 243.078875625, "owned_rss_bytes": 434192384, "owned_process_count": 4, "reclaimable_bytes": 12334235648, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 243.326159542, "owned_rss_bytes": 584450048, "owned_process_count": 4, "reclaimable_bytes": 12200902656, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 243.574740917, "owned_rss_bytes": 779173888, "owned_process_count": 4, "reclaimable_bytes": 12024201216, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 243.815897042, "owned_rss_bytes": 1024606208, "owned_process_count": 4, "reclaimable_bytes": 11802460160, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 244.05478325, "owned_rss_bytes": 1185857536, "owned_process_count": 4, "reclaimable_bytes": 11630903296, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 244.29761870800002, "owned_rss_bytes": 1140146176, "owned_process_count": 4, "reclaimable_bytes": 11729092608, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 244.540433917, "owned_rss_bytes": 1178501120, "owned_process_count": 4, "reclaimable_bytes": 11697029120, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 244.778159417, "owned_rss_bytes": 1182646272, "owned_process_count": 4, "reclaimable_bytes": 11690246144, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 245.0284835, "owned_rss_bytes": 1234550784, "owned_process_count": 4, "reclaimable_bytes": 11637161984, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 245.270412833, "owned_rss_bytes": 1263222784, "owned_process_count": 4, "reclaimable_bytes": 11612717056, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 245.506295792, "owned_rss_bytes": 1277837312, "owned_process_count": 4, "reclaimable_bytes": 11604164608, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 245.74574816700002, "owned_rss_bytes": 1280311296, "owned_process_count": 4, "reclaimable_bytes": 11601297408, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 245.983330208, "owned_rss_bytes": 1288994816, "owned_process_count": 4, "reclaimable_bytes": 11592318976, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 246.22743400000002, "owned_rss_bytes": 1295663104, "owned_process_count": 4, "reclaimable_bytes": 11586453504, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 246.472876208, "owned_rss_bytes": 1301217280, "owned_process_count": 4, "reclaimable_bytes": 11574181888, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 246.714135292, "owned_rss_bytes": 1310621696, "owned_process_count": 4, "reclaimable_bytes": 11573854208, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 246.961394667, "owned_rss_bytes": 1324875776, "owned_process_count": 4, "reclaimable_bytes": 11556945920, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 247.200110792, "owned_rss_bytes": 1339473920, "owned_process_count": 4, "reclaimable_bytes": 11545280512, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 247.442818458, "owned_rss_bytes": 1348780032, "owned_process_count": 4, "reclaimable_bytes": 11525668864, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 247.68174925, "owned_rss_bytes": 140689408, "owned_process_count": 4, "reclaimable_bytes": 12538331136, "swapins": 44112847, "swapouts": 77525566}
{"elapsed_seconds": 247.927226833, "owned_rss_bytes": 16809984, "owned_process_count": 2, "reclaimable_bytes": 12535988224, "swapins": 44112847, "swapouts": 77525566}
````

## /Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/manifest.json

SHA-256 `82c70968204664fdc1b20bad71799f672b2abf18c51fceed2b6dab142d2b1e18`; 24006 bytes.

````text
{
  "classification": "build only; no runtime performance evidence",
  "required_reclaimable_gb": 9.5,
  "model_lock_held_during_build": true,
  "passed": true,
  "command": [
    "make",
    "build",
    "SLOTSTREAM_BUILD_JOBS=1"
  ],
  "working_directory": "/Users/carlos/Projects/slotstream",
  "reservation_wait_limit_seconds": 0,
  "build_jobs": 1,
  "reservation_wait": {
    "seconds": 5.1670000000836325e-06,
    "attempts": 1
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 14487437312,
    "swapins": 44112839,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   223974.\nPages active:                                 686295.\nPages inactive:                               793130.\nPages speculative:                            238650.\nPages throttled:                                   0.\nPages wired down:                             248838.\nPages purgeable:                               31509.\n\"Translation faults\":                    15444441302.\nPages copy-on-write:                       737126552.\nPages zero filled:                       21236308049.\nPages reactivated:                        3471598452.\nPages purged:                               72277377.\nFile-backed pages:                            628760.\nAnonymous pages:                             1089315.\nPages stored in compressor:                  2092403.\nPages occupied by compressor:                 893955.\nDecompressions:                           1172530072.\nCompressions:                             1487781276.\nPageins:                                  7622561021.\nPageouts:                                   11084510.\nSwapins:                                    44112839.\nSwapouts:                                   77525566.\nPages tagged:                                 183669.\nPages tagged resident:                        135101.\nPages tagged compressed:                       48568.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8477.\nPages tag-storage free:                         1020.\nPages tag-storage non-tag pageable:            88799.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7214464.\nTagged compressions:                        11282230.\nTagged decompressions:                      10401628.\n"
  },
  "exit_code": 0,
  "frozen": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/current-source-build-v273/candidate/slotstream",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
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
      "source_archive_sha256": "fafa905e659896e708b78dfd2065f98d50d7608dee774d835f589cc820c5240a",
      "binary_sha256": "cee643f9adf2eaa50c0b7bd9de8beab799914bbc149981c9d09518982e7b5ad6",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "checks_sha256": "d8d8ab47486edb5dfc759730d94f066d8190854b60b65f0aaccd7194c43b4620",
  "elapsed_seconds": 248.520937,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12542197760,
    "swapins": 44112847,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   155280.\nPages active:                                 906582.\nPages inactive:                               856675.\nPages speculative:                             97446.\nPages throttled:                                   0.\nPages wired down:                             282362.\nPages purgeable:                               15816.\n\"Translation faults\":                    15452263755.\nPages copy-on-write:                       737791333.\nPages zero filled:                       21240426500.\nPages reactivated:                        3471601089.\nPages purged:                               72284437.\nFile-backed pages:                            594419.\nAnonymous pages:                             1266284.\nPages stored in compressor:                  1909525.\nPages occupied by compressor:                 785967.\nDecompressions:                           1172711298.\nCompressions:                             1487781276.\nPageins:                                  7622751557.\nPageouts:                                   11084606.\nSwapins:                                    44112847.\nSwapouts:                                   77525566.\nPages tagged:                                 186624.\nPages tagged resident:                        139158.\nPages tagged compressed:                       47466.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8477.\nPages tag-storage free:                         1436.\nPages tag-storage non-tag pageable:            87800.\nPages tag-storage non-tag wired:                 591.\nBytes of compressed tags:                    6977152.\nTagged compressions:                        11282230.\nTagged decompressions:                      10402730.\n"
  }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/after/Sources/Slotstream/ContextMemory.swift

SHA-256 `c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865`; 13907 bytes.

````text
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
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/after/Sources/Slotstream/Optimizations.swift

SHA-256 `450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95`; 14171 bytes.

````text
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
    /// Greedy-only optional shortening; sampled requests retain their original
    /// verification shapes. Independent context bounds always apply.
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
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/after/Sources/Slotstream/Plan.swift

SHA-256 `7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d`; 57831 bytes.

````text
// Memory planning: turn "how much of this Mac may I use" into slot counts.
//
// One policy, used by the CLI (run/serve/doctor), printed at startup, and
// exposed over /api/show — so what the process *does* and what it *says* can
// never drift apart.

import Foundation

/// Model geometry the cache math speaks in. The planner needs these before the
/// checkpoint is opened, so they are constants — `check(against:recordBytes:)`
/// rejects a checkpoint that does not match once the engine has it.
public enum Geometry {
    public static let layers = 48
    public static let expertsPerLayer = 512
    public static let recordBytes = 2_764_800.0
    public static let totalRecords = layers * expertsPerLayer
    /// Prefill can pin up to one full layer of experts (256-token chunk × top-10
    /// covers ~all 512) plus an in-flight miss batch; below this the eviction
    /// scan has no victim. 640 global ≈ 13/layer equivalent.
    public static let floorSlots = 640

    public static func gb(_ globalSlots: Int) -> Double { Double(globalSlots) * recordBytes / 1e9 }
    public static func perLayer(_ globalSlots: Int) -> Double { Double(globalSlots) / Double(layers) }
    /// Convert a raw GB budget without ever converting an attacker-sized
    /// Double directly to Int (which traps in Swift when it is out of range).
    public static func slotsForPoolGB(_ poolGB: Double) -> Int {
        guard poolGB.isFinite else { return poolGB > 0 ? totalRecords : floorSlots }
        if poolGB >= gb(totalRecords) { return totalRecords }
        if poolGB <= gb(floorSlots) { return floorSlots }
        return Int(poolGB * 1e9 / recordBytes)
    }
    /// GB of pool per expert-per-layer (N experts/layer costs N × this).
    public static var gbPerExpertPerLayer: Double { Double(layers) * recordBytes / 1e9 }

    /// The planner sizes memory from the constants above while the engine
    /// allocates from config.json. If they ever disagree, every memory number
    /// the user is shown is wrong, so fail loudly instead of drifting.
    public static func check(against cfg: ModelConfig, recordBytes actual: Int) throws {
        guard cfg.numLayers == layers, cfg.numExperts == expertsPerLayer,
            Double(actual) == recordBytes
        else {
            throw ModelError(
                "model geometry does not match the supported checkpoint: config has "
                    + "\(cfg.numLayers) layers x \(cfg.numExperts) experts x \(actual) "
                    + "B/record, expected \(layers) x \(expertsPerLayer) x "
                    + "\(Int(recordBytes)) B — check --model")
        }
    }
}

public struct PlanError: Error, CustomStringConvertible {
    public let description: String
    public init(_ s: String) { description = s }
}

/// Explicit process controls whose unused reservations can become expert
/// capacity. Kept with the plan so vision loading and the governor cannot
/// silently restore an allocation after its budget has been spent.
public struct RuntimeAllocationPolicy: Equatable, Sendable {
    public let prefillChunkOverride: Int?
    public let prefixCacheEnabled: Bool

    public init(prefillChunkOverride: Int? = nil, prefixCacheEnabled: Bool = true) throws {
        if let chunk = prefillChunkOverride, !(256 ... 4096).contains(chunk) {
            throw PlanError("runtime allocation planning requires a prefill chunk between 256 and 4096")
        }
        self.prefillChunkOverride = prefillChunkOverride
        self.prefixCacheEnabled = prefixCacheEnabled
    }
}

/// The resolved memory decision: which knob decided it, what it costs, and
/// what to expect. Everything user-facing about memory comes from here.
public struct MemoryPlan {
    public enum Source: String {
        case expertsPerLayer = "--experts-per-layer"
        case poolGB = "--pool-gb"
        case memoryGB = "--memory-gb"
        case auto = "auto"
    }

    public let source: Source
    public let slots: Int
    /// Total-process target in GB when the plan came from --memory-gb or auto.
    public let targetGB: Double?
    public let ramGB: Double
    public let workingSetGB: Double
    /// The RAM share auto was allowed (--max-ram-percent, default 70). Carried
    /// so the elastic governor grows back to the user's policy, not the default.
    public let ramPercent: Double
    /// Memory reclaimable at planning time (nil = could not be read).
    public let availableGB: Double?
    /// True when auto sized itself down because of what other apps hold now.
    public let clamped: Bool
    /// Tokens per prefill pass, chosen with the pool from the same budget.
    public let prefillChunk: Int
    /// Conversation state the prefix cache may retain, in tokens. Sized and
    /// charged from the same budget as the pool.
    public let prefixCacheTokens: Int
    /// Whether the MTP draft head loads (self-speculative decode). Charged as
    /// a fixed resident block; the pool is sized from what remains.
    public let mtpEnabled: Bool
    /// Whether an image request may load the tower in this process.
    public let visionEnabled: Bool
    /// A loaded tower is charged inside the total-process target. Merely
    /// accepting images does not take expert capacity from text requests.
    public let visionResidentReserved: Bool
    /// True when this plan was made for a simulated device (`doctor --sim-*`).
    /// Such a plan may be printed and compared, never loaded: a simulated
    /// availability figure still produces a real allocation.
    public var simulated = false
    /// Longest prompt plus reply a request may hold (`--max-context`). State
    /// for the first `ContextPolicy.tokensInFixedFootprint` tokens is inside
    /// the fixed footprint; anything above is charged separately.
    public let maxContextTokens: Int
    public let notes: [String]
    public let runtimeAllocationPolicy: RuntimeAllocationPolicy?
    public let maxPrefillWaitMinutes: Double
    public let contextQualification: Bool

    public init(
        source: Source, slots: Int, targetGB: Double?,
        ramGB: Double, workingSetGB: Double, ramPercent: Double,
        availableGB: Double?, clamped: Bool,
        prefillChunk: Int, prefixCacheTokens: Int, mtpEnabled: Bool = false,
        visionEnabled: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        notes: [String], simulated: Bool = false,
        runtimeAllocationPolicy: RuntimeAllocationPolicy? = nil,
        maxPrefillWaitMinutes: Double = 30, contextQualification: Bool = false
    ) {
        self.source = source
        self.slots = slots
        self.targetGB = targetGB
        self.ramGB = ramGB
        self.workingSetGB = workingSetGB
        self.ramPercent = ramPercent
        self.availableGB = availableGB
        self.clamped = clamped
        self.prefillChunk = prefillChunk
        self.prefixCacheTokens = prefixCacheTokens
        self.mtpEnabled = mtpEnabled
        self.visionEnabled = visionEnabled
        self.visionResidentReserved = visionResidentReserved
        self.maxContextTokens = maxContextTokens
        self.notes = notes
        self.simulated = simulated
        self.runtimeAllocationPolicy = runtimeAllocationPolicy
        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
        self.contextQualification = contextQualification
    }

    public var expertsPerLayerCached: Double { Geometry.perLayer(slots) }
    public var poolGB: Double { Geometry.gb(slots) }
    public var memoryLedger: ContextMemoryLedger {
        ContextMemoryLedger(slots: slots, context: maxContextTokens, chunk: prefillChunk,
            retentionTokens: prefixCacheTokens, mtp: mtpEnabled, visionResident: visionResidentReserved)
    }
    public var expectedPeakGB: Double { Double(memoryLedger.expectedPeakBytes) / 1e9 }

    public func withRequestPolicy(_ configuration: ContextConfiguration) throws -> MemoryPlan {
        guard configuration.maxContextTokens == maxContextTokens else {
            throw PlanError("request policy must use the context window priced by the memory plan")
        }
        return MemoryPlan(source: source, slots: slots, targetGB: targetGB, ramGB: ramGB,
            workingSetGB: workingSetGB, ramPercent: ramPercent, availableGB: availableGB, clamped: clamped,
            prefillChunk: prefillChunk, prefixCacheTokens: prefixCacheTokens, mtpEnabled: mtpEnabled,
            visionEnabled: visionEnabled, visionResidentReserved: visionResidentReserved,
            maxContextTokens: maxContextTokens, notes: notes, simulated: simulated,
            runtimeAllocationPolicy: runtimeAllocationPolicy,
            maxPrefillWaitMinutes: configuration.maxPrefillWaitMinutes,
            contextQualification: configuration.qualification)
    }
    /// Seconds a prompt filling the whole context takes before its first
    /// token, priced through the prefill schedule this plan runs.
    public var estPrefillSecondsAtMaxContext: Double {
        PrefillSchedule.estSeconds(tokens: maxContextTokens, maxChunk: prefillChunk)
    }
    public var estWarmTokS: Double { Planner.estWarmTokS(expertsPerLayer: expertsPerLayerCached) }
    public var fullyResident: Bool { slots >= Geometry.totalRecords }

    /// The startup announce: device, decision, expectation, override hint.
    public func banner() -> String {
        var l: [String] = []
        l.append("slotstream memory plan (\(source.rawValue))")
        if let a = availableGB, a.isFinite {
            l.append(String(
                format: "  device: %.0f GB RAM (%.1f GB reclaimable now), %.1f GB Metal working set",
                ramGB, a, workingSetGB))
        } else {
            l.append(String(
                format: "  device: %.0f GB RAM, %.1f GB Metal working set", ramGB, workingSetGB))
        }
        if let t = targetGB {
            let hint = source == .auto
                ? "   (override: --memory-gb N | --max-ram-percent P)"
                : ""
            l.append(String(format: "  target: %.1f GB total for this process%@", t, hint))
        }
        if fullyResident {
            l.append(String(
                format: "  cache:  all %d experts per layer resident (%.1f GB pool)",
                Geometry.expertsPerLayer, poolGB))
        } else {
            l.append(String(
                format: "  cache:  ~%.0f of %d experts per layer  (%d global slots = %.1f GB pool)",
                expertsPerLayerCached, Geometry.expertsPerLayer, slots, poolGB))
        }
        l.append(String(
            format: "  expect: ~%.1f GB peak, ~%.0f tok/s warm decode (est. from M5 Pro anchors)",
            expectedPeakGB, estWarmTokS))
        // The decode curve is a function of experts per layer alone. It carries
        // no term for read bandwidth, and it was anchored on a 17.3 GB/s SSD
        // (MEASUREMENTS, M0.5). The first machine measured that was not the dev
        // Mac reads at 1.5 GB/s, where the misses of a single token cost more
        // time than the whole estimated step (MEASUREMENTS, C1). Until the
        // planner can measure this disk and price those reads, the estimate
        // says out loud what it assumes rather than quietly assuming it.
        l.append(
            "  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). "
            + "A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 "
            + "estimate, so on base storage expect well under the number above — see docs/HARDWARE.md")
        l.append(String(
            format: "  prefill: %d tokens per pass (~%.0f tok/s here; costs ~%.1f GB of the target)",
            prefillChunk, Planner.estPrefillTokS(chunk: prefillChunk),
            Planner.prefillCostGB(prefillChunk)))
        if mtpEnabled {
            l.append(String(
                format: "  mtp:    draft head on — speculative decode (%.1f GB resident, charged above)",
                Planner.mtpResidentGB))
        }
        if visionEnabled {
            l.append(visionResidentReserved
                ? String(format: "  vision: tower memory reserved (%.1f GB resident, charged above)", Planner.visionResidentGB)
                : String(format: "  vision: images accepted — first image reserves +%.1f GB inside the target; refused if it cannot fit", Planner.visionResidentGB))
        }
        let extra = Planner.extraContextMemoryGB(maxContextTokens: maxContextTokens)
        l.append(String(
            format: "  context: up to %d tokens per request (prompt + reply%@); a full-length prompt "
                + "takes ~%@ before its first token here, follow-up turns read only what is new",
            maxContextTokens,
            extra > 0 ? String(format: ", +%.1f GB state and transient reserve charged above", extra) : "",
            PrefillSchedule.describe(seconds: estPrefillSecondsAtMaxContext)))
        if prefixCacheTokens > 0 {
            l.append(String(
                format: "  reuse:  up to %d tokens across %d conversations (~%.1f GB), so a "
                    + "follow-up turn re-prefills only what is new",
                prefixCacheTokens, PrefixCache.maxEntries,
                Planner.prefixCacheCostGB(tokens: prefixCacheTokens)))
        }
        for n in notes { l.append("  note:   \(n)") }
        return l.joined(separator: "\n")
    }

    /// Machine-readable form for /api/show.
    public func json() -> [String: Any] {
        func tenth(_ value: Double) -> Double {
            let scaled = value * 10
            return scaled.isFinite ? scaled.rounded() / 10 : value
        }
        var d: [String: Any] = [
            "source": source.rawValue,
            "experts_per_layer_cached": Int(expertsPerLayerCached.rounded()),
            "pool_slots": slots,
            "pool_gb": tenth(poolGB),
            "expected_peak_gb": tenth(expectedPeakGB),
            "device_ram_gb": tenth(ramGB),
            "device_working_set_gb": tenth(workingSetGB),
            "max_ram_percent": ramPercent,
            "availability_clamped": clamped,
            "fully_resident": fullyResident,
            "prefill_chunk": prefillChunk,
            "prefix_cache_max_tokens": prefixCacheTokens,
            "mtp": mtpEnabled,
            "vision": visionEnabled,
            "vision_resident_reserved": visionResidentReserved,
            "vision_charged_gb": visionResidentReserved ? Planner.visionResidentGB : 0,
            "vision_resident_gb": visionEnabled ? Planner.visionResidentGB : 0,
            "max_context_tokens": maxContextTokens,
            "est_prefill_s_at_max_context": estPrefillSecondsAtMaxContext.isFinite
                ? estPrefillSecondsAtMaxContext as Any : NSNull(),
            "model_context_limit": ContextPolicy.modelLimit,
            "implementation_context_limit": ContextPolicy.implementationLimit,
            "mtp_context_limit": ContextPolicy.mtpLimit,
            "vision_context_limit": ContextPolicy.visionLimit,
            "max_prefill_wait_minutes": maxPrefillWaitMinutes,
            "prefill_wait_scope": "accepted_request_to_first_model_token",
            "context_qualification": contextQualification,
            "memory_ledger": memoryLedger.json,
            // Unrounded on purpose: the banner rounds these to whole tok/s,
            // and a caller comparing two plans across a rounding boundary sees
            // a step that is not there. Anything asserting on the plan should
            // read these, not the printed line.
            "est_warm_tok_s": estWarmTokS,
            "est_prefill_tok_s": Planner.estPrefillTokS(chunk: prefillChunk),
        ]
        if let a = availableGB, a.isFinite { d["device_available_gb"] = tenth(a) }
        if let t = targetGB { d["target_gb"] = tenth(t) }
        if let policy = runtimeAllocationPolicy {
            d["runtime_prefix_cache_enabled"] = policy.prefixCacheEnabled
            if let chunk = policy.prefillChunkOverride { d["runtime_prefill_override"] = chunk }
        }
        if !notes.isEmpty { d["notes"] = notes }
        return d
    }
}

public enum Planner {
    /// Reassign only reservations already present in a resolved plan. This
    /// preserves its existing margin, active context and resident charges;
    /// it does not infer extra headroom from a short current request.
    public static func applyingRuntimePolicy(
        _ p: MemoryPlan, policy: RuntimeAllocationPolicy
    ) throws -> MemoryPlan {
        if let previous = p.runtimeAllocationPolicy {
            guard previous == policy else { throw PlanError("runtime allocation policy requires a fresh base plan") }
            return p // Never credit the same reservation twice.
        }
        let chunk = policy.prefillChunkOverride ?? p.prefillChunk
        let prefixTokens = policy.prefixCacheEnabled ? p.prefixCacheTokens : 0
        let freed = prefillCostGB(p.prefillChunk) - prefillCostGB(chunk)
            + prefixCacheCostGB(tokens: p.prefixCacheTokens) - prefixCacheCostGB(tokens: prefixTokens)
        var slots = p.slots
        if p.targetGB != nil, freed != 0 {
            let remaining = p.poolGB + freed
            guard remaining.isFinite, remaining + 1e-9 >= Geometry.gb(Geometry.floorSlots) else {
                throw PlanError("runtime prefill reservation cannot fit above the minimum expert pool; lower the chunk or raise the memory target")
            }
            slots = Geometry.slotsForPoolGB(remaining)
        }
        return MemoryPlan(source: p.source, slots: slots, targetGB: p.targetGB,
            ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
            availableGB: p.availableGB, clamped: p.clamped, prefillChunk: chunk,
            prefixCacheTokens: prefixTokens, mtpEnabled: p.mtpEnabled,
            visionEnabled: p.visionEnabled, visionResidentReserved: p.visionResidentReserved,
            maxContextTokens: p.maxContextTokens,
            notes: p.notes + (chunk != p.prefillChunk || prefixTokens != p.prefixCacheTokens
                ? ["prefill and prefix retention reservations match the explicit runtime controls"] : []),
            simulated: p.simulated, runtimeAllocationPolicy: policy,
            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification)
    }

    /// Non-pool footprint: resident weights, the 256 MB n-gram payload plus
    /// collection overhead, Swift and MLX runtime allocations, one fixed GDN
    /// recurrent state, and a full 32k active context. Expert staging is now
    /// transferred directly into MLX in batches of at most 32 records,
    /// avoiding separate raw + Swift copies and the former multi-GB cold-fill
    /// transient.
    public static let fixedFootprintGB = Double(PlannerCostModel.fixedBytes) / 1e9
    /// Extra slack when deriving a pool from a total-memory target, so the
    /// promise ("stays under G") survives transients.
    public static let planningMarginGB = Double(PlannerCostModel.planningMarginBytes) / 1e9

    /// What a prefill pass costs in transient activations.
    ///
    /// **Recalibrated 2026-08-30, and the old figure was costing real speed.**
    /// The previous model charged `(chunk - 256) x 1.8 MB` because it folded
    /// two different things into one term: the pass activations, which scale
    /// with the *chunk*, and the KV plus indexer state, which scales with the
    /// *context*. Conflating them made a big pass look twice as expensive as it
    /// is, so the planner kept choosing 1024 where 2048 is strictly better.
    ///
    /// Measured directly (`--memory-gb 16`, pool pinned at 77/layer, so peak
    /// minus the 14.1 GB base is the pass): chunk 1024 -> 1.30 GB, 2048 -> 2.19,
    /// 4096 -> 4.30. That is ~1.0 to 1.3 MB per chunk token, linear from zero
    /// rather than from 256. Context state is a separate ~27.6 KB per token and
    /// is genuinely small: going from a 4,016 to an 8,016-token prompt moved
    /// peak by 0.1 GB. 1.30 MB/token is charged here so the estimate errs high
    /// at every measured point.
    public static func prefillCostGB(_ chunk: Int) -> Double {
        Double(chunk) * (Double(PlannerCostModel.prefillBytesPerToken) / 1e9)
    }

    /// KV plus indexer state for a context of `tokens`, which the pool math
    /// does not model. Separate from the pass cost above because it scales with
    /// the conversation, not with the batch: a 32k prompt carries ~0.9 GB.
    public static func contextStateGB(_ tokens: Int) -> Double {
        Double(tokens) * Double(PrefixCache.bytesPerToken) / 1e9
    }

    /// Context state above what the fixed footprint already covers. Zero at
    /// the default window; an explicitly larger --max-context reduces the
    /// expert pool before allocation instead of consuming the safety margin.
    public static func extraContextStateGB(maxContextTokens: Int) -> Double {
        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens)) / 1e9
    }

    /// The larger window also needs transient headroom. A completed 65,520
    /// token check at chunk 512 peaked at 10.056 GB against the state-only
    /// plan's 9.260 GB (20 ms physical-footprint sampling, not just RSS).
    /// Reserve a full additional window's growth above the fixed footprint
    /// throughout the supported long-context range. This conservative envelope
    /// covers that measured gap without claiming its exact buffer attribution
    /// or interpolating unmeasured peaks. Ordinary windows retain their budget.
    /// See the Hermes measurement and its preserved failed run.
    public static func extraContextMemoryGB(maxContextTokens: Int, mtp: Bool = false) -> Double {
        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens, mtp: mtp)
            + ContextMemoryLedger.transientReserveBytes(context: maxContextTokens, mtp: mtp)) / 1e9
    }

    /// Sizes the prefill pass from the same budget as the pool.
    ///
    /// Prefill is expert-stream-bound: a pass touches nearly every expert of
    /// every layer, so the whole expert set is re-read roughly once per pass
    /// and halving the number of passes halves the bytes moved. Measured on a
    /// 7,960-token prompt: 40 tok/s at 256, 50 at 512, 67 at 1024, 92 to 105 at
    /// 2048 — with byte-identical output at every size.
    ///
    /// The cap is a quarter of the pool budget, raised from a fifth once the
    /// cost above was measured honestly. The deciding experiment held total
    /// memory fixed and traded pool for pass size on a 4,021-token prompt:
    ///
    /// | chunk | pool | prefill | decode | peak |
    /// |---|---|---|---|---|
    /// | 1024 | 77/layer | 65.2 s | 7.3 s | 15.4 GB |
    /// | 2048 | 67/layer | **47.9 s** | **6.6 s** | **14.9 GB** |
    /// | 4096 | 47/layer | 42.9 s | 9.0 s | 14.4 GB |
    ///
    /// 2048 dominates 1024 on every axis, so a fifth was simply too tight; 4096
    /// buys a little more prefill and gives back more decode, so it should only
    /// be reached on a machine whose pool is already past the decode plateau —
    /// which is exactly what a proportional cap does, since there pool memory
    /// is worth nothing and pass memory is worth a lot.
    /// A request this plan is tuned for: prompt tokens, then generated tokens.
    /// Only ever used to choose the prefill pass size — never correctness.
    static let tuningPromptTokens = PlannerCostModel.tuningPromptTokens
    static let tuningReplyTokens = PlannerCostModel.tuningReplyTokens

    /// The prefill pass to run at a given pool budget: the one that finishes a
    /// representative request soonest.
    ///
    /// Pass size is a real trade, not a free choice. A bigger pass prefills
    /// faster but costs pool, and every GB it takes is expert cache the decode
    /// loop no longer has. The old rule — "biggest pass fitting in a quarter of
    /// the budget" — ignored the decode side, so crossing the quarter line
    /// doubled the pass from 2.7 to 5.3 GB and made `--memory-gb 26` plan a
    /// *smaller* cache than 25 (116 against 128 per layer) and a slower decode.
    /// Giving more memory made it slower.
    ///
    /// Scoring `prompt/prefill + reply/decode` prices both sides in the one
    /// unit that matters, seconds, and picks the trade the machine can afford:
    /// past the decode plateau a big pass is nearly free and wins, and below it
    /// the pass only grows when the prefill it buys beats the decode it costs.
    /// Swept a GB at a time from 7 to 90 GB, the estimate never gets worse as
    /// the target grows.
    public static func prefillChunkFor(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Int {
        // 8192 is not a candidate: nothing has measured it, and the prefill
        // schedule would cut it to 4096 on the first pass anyway
        // (PrefillSchedule.measuredQueryKeyProduct), so offering it only
        // charged 10.6 GB for a pass that never ran.
        let candidates = [256] + [512, 1024, 2048, 4096].filter {
            prefillCostGB($0) <= 0.25 * poolBudgetGB
        }
        func seconds(_ c: Int) -> Double {
            let pool = poolBudgetGB - prefillCostGB(c) - prefixCacheGB(poolBudgetGB: poolBudgetGB, contextCap: contextCap)
            let slots = Geometry.slotsForPoolGB(max(0, pool))
            let decode = estWarmTokS(expertsPerLayer: Geometry.perLayer(slots))
            return tuningPromptTokens / estPrefillTokS(chunk: c) + tuningReplyTokens / decode
        }
        // Ties (identical seconds) go to the larger pass: same request time,
        // more headroom on a prompt longer than the one we tuned for.
        return candidates.min { a, b in
            let (sa, sb) = (seconds(a), seconds(b))
            return sa != sb ? sa < sb : a > b
        } ?? 256
    }

    /// How many tokens of conversation state the prefix cache may retain.
    ///
    /// The held state is ~27 KiB per token, and this is a ceiling on the total
    /// across every conversation held, not per conversation.
    ///
    /// It **is** charged against the budget. The first design held one
    /// conversation and evicted on any miss, so exactly one state was ever live
    /// and peak was unchanged; that design was then measured against a real
    /// client and never hit at all — Open WebUI interleaves a title-generation
    /// request between turns and evicted the chat every time. Holding several
    /// conversations is what makes the cache work, and several held states are
    /// genuinely additive memory, so the budget pays for them. A tenth of the
    /// pool budget is the ceiling, capped by the context limit above which
    /// reuse is impossible anyway (a match needs `prompt.count > held.count`,
    /// and a prompt that long is already refused).
    public static func prefixCacheTokensFor(poolBudgetGB: Double, contextCap: Int = 32_768) -> Int {
        let gb = 0.10 * max(0, poolBudgetGB)
        let full = Double(contextCap) * Double(PrefixCache.bytesPerToken) / 1e9
        if gb >= full { return max(0, contextCap) }
        let toks = Int(gb * 1e9 / Double(PrefixCache.bytesPerToken))
        return max(0, min(toks, contextCap))
    }

    /// What that retention ceiling costs, which the plan reserves.
    public static func prefixCacheGB(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Double {
        prefixCacheCostGB(tokens: prefixCacheTokensFor(poolBudgetGB: poolBudgetGB, contextCap: contextCap))
    }

    /// PrefixCache evicts before a miss allocation, so no more than four
    /// states coexist: the active state already in fixedFootprintGB plus three
    /// retained states. Their fixed GDN memory is additive to KV/indexer bytes.
    public static func prefixCacheCostGB(tokens: Int) -> Double {
        guard tokens > 0 else { return 0 }
        let tokenGB = Double(tokens) * Double(PrefixCache.bytesPerToken) / 1e9
        let fixedGB = Double(PrefixCache.maxEntries - 1)
            * Double(PrefixCache.fixedBytesPerEntry) / 1e9
        return tokenGB + fixedGB
    }

    /// Prefill throughput estimate for the banner, from the anchors above.
    /// Prefill throughput estimate, from measurement plus one measured ratio.
    ///
    /// 2048 is the solid anchor: **112.9 tok/s** on an 8,016-token prompt at a
    /// 16 GB target, mean of three interleaved runs. 4096 could not be measured
    /// at *its* natural home (a 36 GB target needs ~33 GB free, which has not
    /// been available), so it is derived from a ratio measured at a matched
    /// pool of 60 experts/layer, where 4096 beat 2048 in all three paired
    /// rounds — 108.8/96.6, 92.2/76.3, 103.9/91.4, a mean 101.6 against 88.1,
    /// or 1.15x. Applied to the anchor that implies ~130; 125 is quoted so the
    /// estimate stays under the evidence rather than over it, and 8192 is not
    /// credited with any further gain because nothing has measured one.
    ///
    /// Caveat this does not model: prefill also depends on pool size, because
    /// a bigger cache means fewer expert misses per pass. The same chunk gives
    /// 88 tok/s at 60 experts/layer and 113 at 67, so treat these as typical
    /// for a machine that would *choose* that chunk, not as a pure function.
    public static func estPrefillTokS(chunk: Int) -> Double {
        // The sweep's ladder on the 8k acceptance prompt at a matched pool of
        // 60 experts per layer (MEASUREMENTS.md, "N2 — the prefill sweep"):
        // 88 / 128 / 169 / 211 / 222 tok/s from 256 to 4096, rounded down.
        // The floor's 256-token pass read 88 at 13 per layer too: below 1024
        // the pass is read-bound and the pool barely matters. Ordinary prose
        // reads about 40% slower than this prompt at every size; these are the
        // acceptance prompt's numbers, as the previous ladder's were.
        switch chunk {
        case ..<512: return PlannerCostModel.prefill256TokensPerSecond
        case ..<1024: return PlannerCostModel.prefill512TokensPerSecond
        case ..<2048: return PlannerCostModel.prefill1024TokensPerSecond
        case ..<4096: return PlannerCostModel.prefill2048TokensPerSecond
        default: return PlannerCostModel.prefill4096TokensPerSecond
        }
    }
    /// Smallest honest total-memory target: floor pool + footprint + margin.
    public static var minMemoryGB: Double {
        ((Geometry.gb(Geometry.floorSlots) + fixedFootprintGB + planningMarginGB) * 10)
            .rounded(.up) / 10
    }

    /// Memory reclaimable RIGHT NOW without compressing or swapping any other
    /// process's memory: free pages (the raw counter includes speculative) +
    /// purgeable + file-backed cache. Deliberately NOT `kern.memorystatus_level`
    /// (the `memory_pressure` "free percentage"): that counts other apps'
    /// compressible/swappable memory as available, and sizing a GPU pool
    /// against it is exactly how you cause the swap storm. nil if the mach
    /// call fails (then no clamp is applied).
    /// Test seam: when set, stands in for the live availability reading so the
    /// governor can be driven without putting the machine under real memory
    /// pressure. Never set in normal operation.
    ///
    /// **It does not make the resulting allocation imaginary.** The governor
    /// acts on this number, so setting it *above* what the machine has makes it
    /// allocate a pool the machine cannot hold: simulating 60 GB free on a Mac
    /// with 7 GB took a real 25 GB pool and drove tens of GB of swap. Anything
    /// using this seam must bound the value by `deviceAvailableGB()`.
    public nonisolated(unsafe) static var availabilityOverride: Double?

    /// Headroom kept between our expected peak and what is reclaimable, so
    /// claiming it doesn't leave the machine at zero.
    public static func availabilitySlackGB(ramGB: Double) -> Double {
        max(1.5, 0.05 * ramGB)
    }

    /// The share of RAM auto may target before other limits apply. Overridable
    /// per run with --max-ram-percent; it binds on small machines, where the
    /// cache is starved and every GB still buys speed.
    public static let defaultRAMPercent = 70.0

    /// Auto will not target more than this, however large the machine.
    ///
    /// This is the knee of the whole plan, not a politeness limit: 33 GB is the
    /// smallest target at which **both** numbers reach the best the
    /// measurements support — the expert cache clears the decode plateau
    /// (11.2 tok/s at 120 experts/layer, 11.6 at 150, flat after) *and* the
    /// budget still affords the 4096-token prefill pass (125 tok/s against 113
    /// at 2048). Swept a GB at a time, nothing between 34 and 84 GB improves
    /// either number.
    ///
    /// So the old 70%-of-RAM policy was right for a 48 GB Mac by luck — it
    /// landed near this knee — and wrong everywhere above: a 128 GB Mac
    /// targeted 89.6 GB to run at exactly the same estimated speed.
    ///
    /// Not a hard limit: --memory-gb N goes past it deliberately, which is how
    /// a large machine explores full residency (all 512/layer needs about
    /// 84 GB and has never been measured). The one unreproduced hint of a
    /// further decode step, 20 tok/s at 181/layer, is why that door stays open.
    public static let usefulCeilingGB = 33.0

    /// Auto policy: never target more than the cache can use, leave a share of
    /// RAM to the OS and the user's other apps, and stay 2 GB under the Metal
    /// recommended working set — whichever binds first.
    public static func autoTargetGB(
        ramGB: Double, workingSetGB: Double, ramPercent: Double = defaultRAMPercent,
        ceilingGB: Double = usefulCeilingGB
    ) -> Double {
        min(ceilingGB, (ramPercent / 100) * ramGB, workingSetGB - 2.0)
    }

    /// Warm decode estimate, re-anchored 2026-08-30 on measured points.
    ///
    /// The old curve interpolated between 30/layer = 5.6 and 181/layer = 20.0
    /// and **over-promised by 25 to 45% across the middle of its own range**,
    /// which is the part most machines actually land in. Re-measured on 0.1.6
    /// with the pool properly warmed (throughput plateaus by the second
    /// generation, so three samples is enough — verified over 14 consecutive
    /// runs):
    ///
    /// | experts/layer | measured | old estimate |
    /// |---|---|---|
    /// | 30 | 6.0 | 5.6 |
    /// | 60 | 8.2 | 9.2 |
    /// | 120 | 11.2 | 14.8 |
    /// | 150 | 11.6 | 17.3 |
    ///
    /// It is also nearly flat from 120 to 150, so the plateau starts far below
    /// the 181 the old curve assumed. The 20.0 figure at 181/layer could not be
    /// re-verified: that config peaks at 27.4 GB and the machine had 26.6 GB
    /// reclaimable, and forcing it once already drove 13 GB of swap. One run
    /// under that pressure produced a 15 to 18 band, consistent with a
    /// threshold once the working set fits, but it is not a clean measurement.
    ///
    /// So this now interpolates the verified points and **holds flat above
    /// them** rather than extrapolating to an unconfirmed number. It
    /// under-promises above 150/layer on purpose: a plan that quotes a speed
    /// the machine does not reach is worse than one that quotes less.
    /// Where the measured decode curve stops improving: 11.2 tok/s at 120
    /// experts/layer, 11.6 at 150, flat after. Both the estimate and the
    /// prefill-pass sizing key off this one number.
    public static let decodePlateauPerLayer = PlannerCostModel.decodePlateauPerLayer

    public static func estWarmTokS(expertsPerLayer e: Double) -> Double {
        let (e0, r0) = (PlannerCostModel.decodeLowExpertsPerLayer, PlannerCostModel.decodeLowTokensPerSecond)
        let (e1, r1) = (decodePlateauPerLayer, PlannerCostModel.decodePlateauTokensPerSecond)
        if e >= e1 { return r1 }
        if e <= e0 { return r0 * (max(e, 1) / e0) }
        let t = log(e / e0) / log(e1 / e0)
        return r0 * pow(r1 / r0, t)
    }

    /// Resident cost of the MTP draft head (mtp.safetensors is 1.47 GB;
    /// activations and cache growth ride the existing margins).
    public static let mtpResidentGB = Double(PlannerCostModel.mtpResidentBytes) / 1e9

    /// The vision tower's resident cost, paid only by a process that is handed
    /// an image: 333 bf16 tensors, 0.898 GB, measured from the pinned
    /// checkpoint's own header (`VisionTower.residentBytes`), rounded up.
    ///
    /// Engine reserves this inside a target-driven plan before loading the
    /// tower. A raw pool-size request keeps that explicit pool size and reports
    /// the additional resident bytes in its expected peak.
    public static let visionResidentGB = Double(PlannerCostModel.visionResidentBytes) / 1e9

    /// Headroom demanded on top of the tower's own bytes before loading it.
    /// The load briefly holds arrays twice while MLX materializes them.
    /// Attention transients depend on the actual dispatch: the established
    /// 72-wide fallback can form an N² matrix and are not bounded by this term.
    public static let visionLoadMarginGB = Double(PlannerCostModel.visionLoadMarginBytes) / 1e9
    /// Auto enables the draft head only when the cache still affords this
    /// many experts per layer AFTER paying for it (M9 design note: below
    /// ~120/layer the displaced experts are worth more than the multiplier;
    /// past the ~150/layer plateau they are worth nothing).
    public static let mtpAutoFloorPerLayer = 120.0

    /// Pool budget before the prefill pass takes its share.
    public static func poolBudgetGB(_ targetGB: Double) -> Double {
        targetGB - fixedFootprintGB - planningMarginGB
    }

    public static func slotsForTarget(_ targetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Int {
        let budget = poolBudgetGB(targetGB)
        let pool = budget - prefillCostGB(prefillChunkFor(poolBudgetGB: budget, contextCap: contextCap))
            - prefixCacheGB(poolBudgetGB: budget, contextCap: contextCap)
        return Geometry.slotsForPoolGB(pool)
    }

    /// Resolve the knobs. Precedence: --experts-per-layer > --pool-gb >
    /// --memory-gb > auto. Losing knobs are noted, never silently dropped.
    ///
    /// Auto (and only auto) also clamps to what is reclaimable right now, so a
    /// busy machine degrades gracefully instead of swap-storming — explicit
    /// knobs mean the user chose, so they only get an informational note. On a
    /// quiet machine the clamp never binds and auto stays deterministic.
    public enum MTPMode: String, Sendable, Codable {
        case on, off, auto
    }

    /// Whether this process will answer requests that carry images. `auto` is
    /// "yes when the checkpoint has a tower", which the shipped one does.
    public enum VisionMode: String, Sendable, Codable {
        case on, off, auto
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false
    ) throws -> MemoryPlan {
        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
            simulated: simulated, qualification: false, runtimePolicy: nil)
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, runtimePolicy: RuntimeAllocationPolicy?
    ) throws -> MemoryPlan {
        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
            simulated: simulated, qualification: false, runtimePolicy: runtimePolicy)
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, qualification: Bool, runtimePolicy: RuntimeAllocationPolicy? = nil
    ) throws -> MemoryPlan {
        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) { throw PlanError(why) }
        // The fixed footprint pays for the default context; larger windows
        // reduce the pool budget by their additional active state and measured
        // transient envelope, before sizing either the pool or prefill pass.
        let contextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens)
            + (visionResidentReserved ? visionResidentGB : 0)
        let mtpContextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens, mtp: true)
            - extraContextMemoryGB(maxContextTokens: maxContextTokens)
        let mtpTotalCharge = mtpResidentGB + mtpContextCharge
        let ram = ramGB ?? deviceRAMGB()
        let ws = workingSetGB ?? deviceWorkingSetGB()
        let avail = availableGB ?? deviceAvailableGB()
        let pct = ramPercent ?? defaultRAMPercent
        guard ram.isFinite, ram > 0 else {
            throw PlanError("RAM must be a finite number > 0")
        }
        guard ws.isFinite, ws > 0 else {
            throw PlanError("Metal working-set size must be a finite number > 0")
        }
        // +infinity is meaningful here: it is how doctor --sim-ram says
        // "availability is not a constraint on this simulated machine". Only
        // NaN and negatives are garbage.
        if let a = avail, a.isNaN || a < 0 {
            throw PlanError("available memory must be a number >= 0")
        }
        guard pct.isFinite, pct > 0, pct <= 100 else {
            throw PlanError(String(
                format: "--max-ram-percent %.0f is out of range — give a share between 1 and 100",
                pct))
        }
        var notes: [String] = []
        var clamped = false
        if ramPercent != nil, expertsPerLayer != nil || poolGB != nil || memoryGB != nil {
            notes.append("--max-ram-percent ignored (it only bounds auto; an explicit memory knob is already the target)")
        }
        if vision == .on, !visionAvailable {
            throw PlanError(
                "--vision on, but this checkpoint has no vision_tower tensors — it is a "
                    + "text-only model; use --vision auto/off")
        }
        let visionOn = vision != .off && visionAvailable
        guard !visionResidentReserved || visionOn else {
            throw PlanError("a loaded vision tower requires an available, enabled vision model")
        }
        if mtp == .on, !mtpAvailable {
            throw PlanError(
                "--mtp on, but mtp.safetensors is not next to the model — the draft head "
                    + "is a separate 1.5 GB artifact converted from the official release "
                    + "(Tools/mtp_convert.py); convert it first or use --mtp auto/off")
        }

        /// The draft-head decision for a pool of `slots` when the head costs
        /// pool budget (target-driven sources already shrank the pool).
        if mtp == .on, maxContextTokens > ContextPolicy.mtpLimit, !qualification {
            throw PlanError("MTP is qualified only through \(ContextPolicy.mtpLimit) tokens; use --mtp off at this window")
        }
        if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit {
            notes.append("MTP stays off because this context exceeds its qualified window")
        }
        func resolveMTP(slotsAfterCharge: Int) -> Bool {
            if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit { return false }
            switch mtp {
            case .off: return false
            case .on: return true
            case .auto:
                return mtpAvailable
                    && Geometry.perLayer(slotsAfterCharge) >= mtpAutoFloorPerLayer
            }
        }

        func finish(
            _ source: MemoryPlan.Source, _ slots: Int, target: Double?, mtpOn: Bool
        ) throws -> MemoryPlan {
            // An explicit pool knob states the cache size, not the whole budget,
            // so size the prefill pass from the pool the user asked for.
            let mtpCharge = mtpOn ? mtpResidentGB + mtpContextCharge : 0
            let budgetForCaches = target.map { poolBudgetGB($0) - mtpCharge - contextCharge }
                ?? Geometry.gb(slots)
            let chunk = prefillChunkFor(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens)
            let capped = min(slots, Geometry.totalRecords)
            let floored = max(capped, Geometry.floorSlots)
            if floored > capped {
                notes.append(String(
                    format: "raised to the floor of %d slots (~%.0f/layer): below it a prefill chunk can pin every slot",
                    Geometry.floorSlots, Geometry.perLayer(Geometry.floorSlots)))
            }
            let peak = Geometry.gb(floored) + fixedFootprintGB + prefillCostGB(chunk)
                + prefixCacheGB(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens) + mtpCharge + contextCharge
            if peak > ws, source != .memoryGB {  // memoryGB branch words its own note
                notes.append(String(
                    format: "expected peak %.1f GB exceeds the %.1f GB Metal working set — expect paging; close other apps or lower the knob",
                    peak, ws))
            }
            // Explicit raw knobs: warn (don't resize) when the machine is busy.
            if source == .expertsPerLayer || source == .poolGB, let a = avail, peak > a {
                notes.append(String(
                    format: "only %.1f GB is reclaimable right now — expect paging until other apps release memory (auto would size to the machine)",
                    a))
            }
            let base = MemoryPlan(
                source: source, slots: floored, targetGB: target,
                ramGB: ram, workingSetGB: ws, ramPercent: pct,
                availableGB: avail, clamped: clamped,
                prefillChunk: chunk,
                prefixCacheTokens: prefixCacheTokensFor(
                    poolBudgetGB: budgetForCaches, contextCap: maxContextTokens),
                mtpEnabled: mtpOn,
                visionEnabled: visionOn,
                visionResidentReserved: visionResidentReserved,
                maxContextTokens: maxContextTokens,
                notes: notes,
                simulated: simulated, contextQualification: qualification)
            let resolved = try runtimePolicy.map { try applyingRuntimePolicy(base, policy: $0) } ?? base
            let bytes = resolved.memoryLedger.expectedPeakBytes
            if maxContextTokens > ContextPolicy.defaultTokens || visionResidentReserved {
                if let target, Double(bytes) > target * 1e9 {
                    throw PlanError("insufficient_memory: context, resident components, minimum pool and prefill workspace exceed the total-memory target")
                }
                let physical = min(ws, (avail ?? ws) - availabilitySlackGB(ramGB: ram))
                if Double(bytes) > physical * 1e9 {
                    throw PlanError("insufficient_memory: requested context and expert pool exceed reclaimable memory with safety headroom or the Metal working set")
                }
            }
            return resolved
        }

        if let n = expertsPerLayer {
            guard n >= 1 else { throw PlanError("--experts-per-layer must be ≥ 1") }
            if poolGB != nil { notes.append("--pool-gb ignored (--experts-per-layer takes precedence)") }
            if memoryGB != nil { notes.append("--memory-gb ignored (--experts-per-layer takes precedence)") }
            let slots = min(n, Geometry.expertsPerLayer) * Geometry.layers
            return try finish(.expertsPerLayer, slots, target: nil, mtpOn: resolveMTP(slotsAfterCharge: slots))
        }
        if let g = poolGB {
            guard g.isFinite, g > 0 else {
                throw PlanError("--pool-gb must be a finite number > 0")
            }
            if memoryGB != nil { notes.append("--memory-gb ignored (--pool-gb takes precedence)") }
            // Preserve a below-floor request so `finish` can explain that it
            // raised it; cap before Double->Int so huge finite input is safe.
            let requested = g >= Geometry.gb(Geometry.totalRecords)
                ? Geometry.totalRecords : Int(g * 1e9 / Geometry.recordBytes)
            return try finish(.poolGB, requested, target: nil, mtpOn: resolveMTP(slotsAfterCharge: requested))
        }
        if let m = memoryGB {
            guard m.isFinite else { throw PlanError("--memory-gb must be finite") }
            guard m >= minMemoryGB else {
                throw PlanError(String(
                    format: "--memory-gb %.1f is below the minimum %.1f GB (floor cache of ~%.0f experts/layer = %.1f GB pool, plus the %.1f GB fixed footprint of resident weights + n-gram cache, plus %.1f GB margin)",
                    m, minMemoryGB, Geometry.perLayer(Geometry.floorSlots),
                    Geometry.gb(Geometry.floorSlots), fixedFootprintGB,
                    planningMarginGB))
            }
            if m > ws {
                notes.append(String(
                    format: "target %.1f GB exceeds the %.1f GB Metal working set; the OS may page — auto would pick %.1f GB here",
                    m, ws, max(minMemoryGB, autoTargetGB(ramGB: ram, workingSetGB: ws, ramPercent: pct))))
            }
            if let a = avail, m > a {
                notes.append(String(
                    format: "only %.1f GB is reclaimable right now — expect paging until other apps release memory",
                    a))
            }
            var mtpOn = resolveMTP(
                slotsAfterCharge: slotsForTarget(max(m - mtpTotalCharge - contextCharge, minMemoryGB), contextCap: maxContextTokens))
            if mtpOn, m - mtpTotalCharge - contextCharge < minMemoryGB {
                if mtp == .on {
                    throw PlanError(String(
                        format: "--memory-gb %.1f cannot fit the %.1f GB draft head above the %.1f GB minimum — raise the target or drop --mtp on",
                        m, mtpTotalCharge, minMemoryGB))
                }
                mtpOn = false
            }
            let slots = slotsForTarget(m - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens)
            return try finish(.memoryGB, slots, target: m, mtpOn: mtpOn)
        }

        // auto: the default. The draft head is worth its 1.6 GB only when the
        // cache still reaches ~120+ experts/layer after paying for it, and
        // past the decode knee that RAM buys nothing else — so when the head
        // is on, the ceiling rises by exactly its cost.
        let mtpWanted = mtp != .off && mtpAvailable
            && (mtp == .on || maxContextTokens <= ContextPolicy.mtpLimit)
        func autoRaw(ceilingGB: Double) -> (Double, Bool) {
            let c = autoTargetGB(ramGB: ram, workingSetGB: ws, ramPercent: pct, ceilingGB: ceilingGB)
            var raw = c
            var didClamp = false
            if let a = avail, a - availabilitySlackGB(ramGB: ram) < raw {
                raw = a - availabilitySlackGB(ramGB: ram)
                didClamp = true
            }
            return (raw, didClamp)
        }
        var mtpOn = false
        if mtpWanted {
            let (rawM, _) = autoRaw(ceilingGB: usefulCeilingGB + mtpTotalCharge)
            let targetM = max(minMemoryGB, rawM)
            let charged = targetM - mtpTotalCharge - contextCharge
            mtpOn = charged >= minMemoryGB
                && (mtp == .on
                    || Geometry.perLayer(slotsForTarget(charged, contextCap: maxContextTokens)) >= mtpAutoFloorPerLayer)
        }
        if mtp == .on, !mtpOn {
            throw PlanError("insufficient_memory: auto cannot keep the requested MTP head loaded at this context; close other apps or use --mtp off")
        }
        // `ceiling` is what this machine's auto would pick unclamped (the
        // notes below compare against it); the knee itself rises by the
        // head's cost when the head is on.
        let kneeGB = usefulCeilingGB + (mtpOn ? mtpTotalCharge : 0)
        let ceiling = autoTargetGB(
            ramGB: ram, workingSetGB: ws, ramPercent: pct, ceilingGB: kneeGB)
        let raw: Double
        (raw, clamped) = autoRaw(ceilingGB: kneeGB)
        let target = max(minMemoryGB, raw)
        if mtpOn, target - mtpTotalCharge - contextCharge < minMemoryGB { mtpOn = false }
        // Exactly one note tells the story of why the target is what it is.
        if raw < minMemoryGB, ceiling < minMemoryGB {
            notes.append(String(
                format: "this machine (%.0f GB RAM) is below the comfortable minimum — running at the %.1f GB floor; expect slow decode and close other apps",
                ram, minMemoryGB))
        } else if raw < minMemoryGB {
            notes.append(String(
                format: "only %.1f GB of %.0f GB RAM is reclaimable right now — running at the %.1f GB floor anyway; expect heavy paging until other apps release memory",
                avail ?? 0, ram, minMemoryGB))
        } else if clamped {
            notes.append(String(
                format: "only %.1f GB of %.0f GB RAM is reclaimable right now (other apps hold the rest) — sized down from the usual %.1f GB; close apps and restart for full speed, or force a size with --memory-gb",
                avail ?? 0, ram, ceiling))
        } else if ceiling >= kneeGB,
            min((pct / 100) * ram, ws - 2.0) > 1.25 * kneeGB
        {
            // This machine could hold more and auto declined. Say so, or it
            // reads as slotstream failing to use the hardware.
            notes.append(String(
                format: "this machine could hold more, but decode stops improving around here (measured 11.2 tok/s at 120 experts/layer, 11.6 at 150) — auto caps at %.1f GB rather than spend RAM for nothing; --memory-gb N to go further",
                usefulCeilingGB))
        }
        let slots = slotsForTarget(target - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens)
        return try finish(.auto, slots, target: target, mtpOn: mtpOn)
    }

    /// Resolve the first image against the existing policy, before allocating
    /// its tower. The source and target remain the user's original decision.
    public static func loadingVision(_ p: MemoryPlan) throws -> MemoryPlan {
        guard p.visionEnabled else { throw PlanError("vision is disabled") }
        if p.visionResidentReserved { return p }
        var sized: MemoryPlan
        if let target = p.targetGB {
            sized = try plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: p.ramGB, workingSetGB: p.workingSetGB, availableGB: p.availableGB,
                mtp: p.mtpEnabled ? .on : .off, mtpAvailable: p.mtpEnabled,
                vision: .on, visionAvailable: true, visionResidentReserved: true,
                maxContextTokens: p.maxContextTokens, simulated: p.simulated, qualification: p.contextQualification,
                runtimePolicy: p.runtimeAllocationPolicy)
        } else { sized = p }
        // Loading a tower never justifies restoring capacity already donated
        // by the governor. Its original target can outlive a pressure shrink.
        return MemoryPlan(source: p.source, slots: min(p.slots, sized.slots), targetGB: p.targetGB,
            ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
            availableGB: p.availableGB, clamped: p.clamped, prefillChunk: min(p.prefillChunk, sized.prefillChunk),
            prefixCacheTokens: min(p.prefixCacheTokens, sized.prefixCacheTokens), mtpEnabled: p.mtpEnabled,
            visionEnabled: true, visionResidentReserved: true,
            maxContextTokens: p.maxContextTokens,
            notes: p.notes + ["vision tower resident memory reserved before loading"], simulated: p.simulated,
            runtimeAllocationPolicy: p.runtimeAllocationPolicy,
            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification)
    }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/after/Sources/Slotstream/PlannerCostModel.swift

SHA-256 `a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0`; 1361 bytes.

````text
// One versioned empirical envelope for planning, reporting and dispatch guards.
// These are the existing conservative allowances and throughput anchors. This
// consolidation grants no new memory credit and claims no new speedup. Update
// the family only with a complete measured envelope and policy comparison.
package enum PlannerCostModel {
    package static let identity = "m5-pro-reference-envelope-v1"
    package static let fixedBytes = 5_300_000_000
    package static let planningMarginBytes = 1_000_000_000
    package static let prefillBytesPerToken = 1_300_000
    package static let mtpResidentBytes = 1_600_000_000
    package static let visionResidentBytes = 900_000_000
    package static let visionLoadMarginBytes = 1_000_000_000
    package static let tuningPromptTokens = 2000.0
    package static let tuningReplyTokens = 400.0
    package static let decodeLowExpertsPerLayer = 30.0
    package static let decodeLowTokensPerSecond = 6.0
    package static let decodePlateauPerLayer = 150.0
    package static let decodePlateauTokensPerSecond = 11.6
    package static let prefill256TokensPerSecond = 85.0
    package static let prefill512TokensPerSecond = 125.0
    package static let prefill1024TokensPerSecond = 165.0
    package static let prefill2048TokensPerSecond = 205.0
    package static let prefill4096TokensPerSecond = 220.0
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/after/Sources/Slotstream/Weights.swift

SHA-256 `4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f`; 11340 bytes.

````text
// Resident weight loading and the quantized-linear primitive.
//
// Residents = everything except routed experts (switch_mlp) and the n-gram
// store shards; ~3.8 GB at 4-bit, loaded whole via MLX's safetensors reader.

import Foundation
import MLX

/// A linear layer read from the checkpoint: quantized (weight+scales+biases)
/// or plain bf16, decided by whether `<name>.scales` exists.
public struct QLinear {
    public let w: MLXArray
    public let scales: MLXArray?
    public let biases: MLXArray?
    public let groupSize: Int
    public let bits: Int

    package init(w: MLXArray, scales: MLXArray?, biases: MLXArray?, groupSize: Int, bits: Int) {
        self.w = w; self.scales = scales; self.biases = biases
        self.groupSize = groupSize; self.bits = bits
    }

    public var isQuantized: Bool { scales != nil }

    public func callAsFunction(_ x: MLXArray) -> MLXArray {
        if let s = scales {
            return quantizedMM(
                x, w, scales: s, biases: biases, transpose: true,
                groupSize: groupSize, bits: bits)
        }
        return matmul(x, w.transposed())
    }

    /// Keep the established row dispatch for a token-wise projection. Dummy
    /// rows are cropped before any sequence operation or cache update. This
    /// does not pad attention queries, recurrent steps, or logical token IDs.
    package func callAsFunction(_ x: MLXArray, minimumRows: Int) -> MLXArray {
        Self.withReferenceRows(x, minimumRows: minimumRows) { self($0) }
    }

    package static func withReferenceRows(_ x: MLXArray, minimumRows: Int,
                                          _ project: (MLXArray) -> MLXArray) -> MLXArray {
        let rows = x.size / x.dim(-1)
        guard rows > 0, rows < minimumRows, minimumRows <= 256 else { return project(x) }
        let flat = x.reshaped([rows, x.dim(-1)])
        let padded = concatenated([flat, broadcast(flat[(rows - 1)...],
            to: [minimumRows - rows, x.dim(-1)])], axis: 0)
        let output = project(padded)
        return output[0 ..< rows].reshaped(Array(x.shape.dropLast()) + [output.dim(-1)])
    }
}

/// Anything that can hand out named tensors from a checkpoint: the resident
/// trunk (ResidentWeights) or the MTP block's own file (MTPWeights). Layer
/// blocks are built against this so the MTP head can reuse them verbatim.
public protocol TensorSource: AnyObject {
    var config: ModelConfig { get }
    func optionalTensor(_ name: String) -> MLXArray?
}

extension TensorSource {
    public func has(_ name: String) -> Bool { optionalTensor(name) != nil }

    public func tensor(_ name: String) -> MLXArray {
        guard let a = optionalTensor(name) else { fatalError("missing tensor \(name)") }
        return a
    }

    public func linear(_ base: String, groupSize: Int? = nil, bits: Int? = nil) -> QLinear {
        let w = tensor(base + ".weight")
        let s = optionalTensor(base + ".scales")
        let b = optionalTensor(base + ".biases")
        return QLinear(
            w: w, scales: s, biases: b,
            groupSize: groupSize ?? config.qGroup, bits: bits ?? config.qBits)
    }
}

public final class ResidentWeights: TensorSource {
    public let arrays: [String: MLXArray]
    public let config: ModelConfig
    package let packedGDNProjections: [Int: PackedProjectionPair]
    public var packedGDNProjectionLayers: Int { packedGDNProjections.count }
    /// Shared backing already included in named resident tensors; not extra bytes.
    public var packedGDNProjectionPayloadBytes: Int {
        packedGDNProjections.values.reduce(0) { $0 + $1.payloadBytes }
    }
    private let embeddingRows: EmbeddingRows?
    public var usesEmbeddingRows: Bool { embeddingRows != nil }
    package var embeddingReadFault: ReadFault? {
        get { embeddingRows?.readFault }
        set { embeddingRows?.readFault = newValue }
    }
    package var embeddingRowHits: Int { embeddingRows?.uniqueRowHits ?? 0 }
    package var embeddingRowMisses: Int { embeddingRows?.uniqueRowMisses ?? 0 }
    package var embeddingCachedRows: Int { embeddingRows?.cachedRows ?? 0 }
    package var embeddingCachedPayloadBytes: Int { embeddingRows?.cachedPayloadBytes ?? 0 }
    package func clearEmbeddingRows() { embeddingRows?.clear() }

    public convenience init(index: CheckpointIndex, includeLayerExperts: Set<Int> = []) throws {
        try self.init(index: index, includeLayerExperts: includeLayerExperts, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, includeLayerExperts: Set<Int> = [], embeddingRowCache: Bool?,
                 packGDNProjections: Bool = false) throws {
        // Golden/debug commands can load the multi-GB resident trunk without
        // constructing Qwen4ExpModel. They need the same cross-process guard as
        // run/serve or they can silently stack underneath another model.
        try ModelProcessGuard.acquire()
        self.config = index.config
        let setting = ProcessInfo.processInfo.environment["SLOTSTREAM_EMBEDDING_ROWS"] ?? "1"
        guard setting == "0" || setting == "1" else { throw ModelError("SLOTSTREAM_EMBEDDING_ROWS must be 0 or 1") }
        let useRows = embeddingRowCache ?? (setting == "1")
        self.embeddingRows = useRows ? try EmbeddingRows(index: index) : nil
        var kept: [String: MLXArray] = [:]
        let files = Set(index.tensors.values.map { $0.file })
        for f in files.sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
            let all = try loadArrays(url: f)
            for (rawKey, arr) in all {
                var key = rawKey
                if key.hasPrefix("language_model.") { key.removeFirst("language_model.".count) }
                if key.hasPrefix("mtp.") || key.hasPrefix("vision_tower.") || key.hasPrefix("model.visual.") {
                    continue
                }
                if key.contains("ngram_embedding.shard_") { continue }
                if key.contains(".switch_mlp.") {
                    // routed experts stay on SSD unless explicitly requested (parity rig)
                    let isWanted = includeLayerExperts.contains { key.contains("model.layers.\($0).mlp.switch_mlp.") }
                    if !isWanted { continue }
                }
                kept[key] = arr
            }
        }
        var packed: [Int: PackedProjectionPair] = [:]
        if packGDNProjections {
            func projection(_ base: String) -> QLinear? {
                guard let weight = kept[base + ".weight"] else { return nil }
                return QLinear(w: weight, scales: kept[base + ".scales"], biases: kept[base + ".biases"],
                    groupSize: index.config.qGroup, bits: index.config.qBits)
            }
            for layer in config.layerTypes.indices where config.layerTypes[layer] == "linear_attention" {
                let base = "model.layers.\(layer).linear_attn"
                let a = base + ".in_proj_qkv", b = base + ".in_proj_z"
                guard let first = projection(a), let second = projection(b),
                      let pair = PackedProjectionPair(first, second) else { continue }
                for (name, view) in [(a, pair.first), (b, pair.second)] {
                    kept[name + ".weight"] = view.w
                    kept[name + ".scales"] = view.scales
                    kept[name + ".biases"] = view.biases
                }
                packed[layer] = pair
            }
        }
        self.packedGDNProjections = packed
        // Keep the public tensor dictionary complete. In the experimental row
        // path only lookup tensors stay lazy; explicit external tensor access
        // can still materialize their exact original values. No planner credit
        // is granted for this optional retention change.
        eval(kept.filter { !useRows || !EmbeddingRows.names.contains($0.key) }.map(\.value))
        self.arrays = kept
    }

    public func optionalTensor(_ name: String) -> MLXArray? { arrays[name] }

    /// Dequantized embedding rows for token ids: (B, S) -> (B, S, hidden).
    public func embed(_ ids: MLXArray) -> MLXArray {
        do { return try embedChecked(ids) }
        catch { preconditionFailure("embedding lookup failed: \(error)") }
    }

    /// Error-propagating companion for checked main/draft execution. Larger
    /// callers are split only for independent row lookup/dequantization; no
    /// model arithmetic or chronological prefill boundary is changed.
    public func embedChecked(_ ids: MLXArray) throws -> MLXArray {
        if let embeddingRows {
            guard [.uint8, .uint16, .uint32, .uint64, .int8, .int16, .int32, .int64].contains(ids.dtype) else {
                throw ModelError("embedding row IDs must be integers")
            }
            // Validate before narrowing: a large Int64 must not wrap onto a
            // different, apparently valid token ID.
            let values = ids.asType(.int64).asArray(Int64.self).map(Int.init)
            guard values.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
                throw ModelError("embedding row ID outside vocabulary")
            }
            return try gatherEmbeddingRows(values, shape: ids.shape, rows: embeddingRows)
        }
        let w = tensor("model.embed_tokens.weight")
        guard let s = arrays["model.embed_tokens.scales"] else {
            return take(w, ids, axis: 0)
        }
        let b = arrays["model.embed_tokens.biases"]
        let rows = take(w, ids, axis: 0)
        let rs = take(s, ids, axis: 0)
        let rb = b.map { take($0, ids, axis: 0) }
        return dequantized(
            rows, scales: rs, biases: rb, groupSize: config.qGroup, bits: config.qBits)
    }

    /// Main and draft callers already own CPU token IDs. Avoid uploading them
    /// merely to synchronize a cast/readback in the row-cache path.
    package func embedChecked(_ ids: [Int], shape: [Int]) throws -> MLXArray {
        guard ids.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
            throw ModelError("embedding row ID outside vocabulary")
        }
        if let embeddingRows { return try gatherEmbeddingRows(ids, shape: shape, rows: embeddingRows) }
        return try embedChecked(MLXArray(ids.map(Int32.init), shape))
    }

    private func gatherEmbeddingRows(_ values: [Int], shape: [Int], rows: EmbeddingRows) throws -> MLXArray {
        var count = 1
        for dim in shape {
            let next = count.multipliedReportingOverflow(by: dim)
            guard dim >= 0, dim <= Int(Int32.max), !next.overflow else {
                throw ModelError("invalid embedding lookup shape")
            }
            count = next.partialValue
        }
        guard count == values.count else { throw ModelError("embedding lookup shape does not match IDs") }
        if values.isEmpty { return MLXArray.zeros(shape + [config.hiddenSize], dtype: .bfloat16) }
        if values.count <= 4096 { return try rows.gather(values, shape: shape) }
        var parts: [MLXArray] = []
        for lo in stride(from: 0, to: values.count, by: 4096) {
            let end = min(values.count, lo + 4096)
            parts.append(try rows.gather(Array(values[lo ..< end]), shape: [end - lo]))
        }
        return concatenated(parts, axis: 0).reshaped(shape + [config.hiddenSize])
    }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/after/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift

SHA-256 `75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d`; 17254 bytes.

````text
import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationCompletePrompt(modelDir: URL, mtp: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let index = try CheckpointIndex(dir: modelDir)
        let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: true)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
        generator.speculationEnabled = mtp; generator.draftDepth = 1
        var options = InferenceOptimizations.integrationCandidate
        options.prefixCheckpointTokens = 0
        var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
        var c = CheckBuilder("optimization-complete-prompt\(mtp ? "-mtp" : "")")
        c.expect("automatic complete prompt checkpoint is enabled", try InferenceOptimizations.environment([:]).completePromptCheckpoint)
        c.expect("complete prompt checkpoint can be explicitly disabled",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPLETE_PROMPT": "0"]).completePromptCheckpoint)
        c.expect("explicit complete prompt option", try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPLETE_PROMPT": "1"]).completePromptCheckpoint)
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        func stateAfter(_ cache: PrefixCache, _ ids: [Int], _ output: [Int], _ vision: VisionPrompt?) throws -> [String: String] {
            guard let hit = cache.take(matching: ids + output + [907], images: vision?.segments ?? []) else {
                throw ModelError("complete-prompt diagnostic lost consumed state")
            }
            var values = hit.state.prefixForkDiagnosticTensors().mapValues(hash)
            hit.state.invalidateMTP()
            values["continuedLogits"] = hash(try model.lastLogitsChecked([907], state: hit.state))
            return values
        }
        let tower = try VisionTower(index: index)
        let bytes = ["iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
                     "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA360e5gAAAABJRU5ErkJggg=="].map { Data(base64Encoded: $0)! }
        let images = try bytes.map { try VisionPreprocess.decodeCGImage($0) }
        let plans = try images.map { try tower.plan(for: $0) }
        func vision(_ start: Int?, color: Int = 0) -> VisionPrompt? {
            guard let start else { return nil }
            return VisionPrompt(tower: tower, items: [.init(image: images[color], plan: plans[color])],
                segments: [.init(start: start, count: plans[color].mergedTokens, hash: ImageHash(hashing: bytes[color]))],
                hiddenSize: model.cfg.hiddenSize)
        }
        let cases: [(Int, Int?)] = [(17, nil), (255, nil), (256, nil), (257, nil), (1025, nil),
            (273, 1), (273 + plans[0].mergedTokens, 256 - plans[0].mergedTokens / 2)]
        for (count, imageStart) in cases {
            let label = "\(count)/image=\(String(describing: imageStart))"
            FileHandle.standardError.write(Data("complete prompt \(label)\n".utf8))
            var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
            if let imageStart {
                ids.replaceSubrange(imageStart..<imageStart+plans[0].mergedTokens,
                    with: repeatElement(model.cfg.imageTokenId, count: plans[0].mergedTokens))
            }
            let referenceCache = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            let referenceVision = vision(imageStart)
            let reference = generator.generate(promptIds: ids, params: params, eosIds: [], cache: referenceCache, vision: referenceVision)
            c.expect("\(label): reference completes", reference.1.runtimeError == nil && reference.0.count == params.maxTokens)
            let expected = try stateAfter(referenceCache, ids, reference.0, referenceVision)
            referenceCache.drop()
            options.completePromptCheckpoint = true; model.optimizations = options
            let cache = PrefixCache(maxTokens: 8192)
            for attempt in 0..<3 {
                let vp = vision(imageStart)
                let result = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vp)
                c.expect("\(label)/\(attempt): completes", result.1.runtimeError == nil)
                c.equal("\(label)/\(attempt): exact output IDs", result.0, reference.0)
                c.equal("\(label)/\(attempt): complete hits", result.1.completePromptHits, attempt == 0 ? 0 : 1)
                c.equal("\(label)/\(attempt): prefill tokens", result.1.prefillTokens, attempt == 0 ? count : 0)
                c.equal("\(label)/\(attempt): reused tokens", result.1.reusedPrefixTokens, attempt == 0 ? 0 : count)
                c.equal("\(label)/\(attempt): retained prompts", cache.heldCheckpoints, 1)
                c.equal("\(label)/\(attempt): checkpoint errors", result.1.prefixCheckpointErrors, 0)
                if attempt > 0 {
                    c.equal("\(label)/\(attempt): no prefill records", result.1.prefillRecords, 0)
                    c.equal("\(label)/\(attempt): no prefill passes", result.1.prefillPasses, [])
                    c.equal("\(label)/\(attempt): tower skipped", result.1.encodedImages, 0)
                }
                c.equal("\(label)/\(attempt): all state and continued logits exact", try stateAfter(cache, ids, result.0, vp), expected)
            }
            c.expect("\(label): public API remains strictly extend-only", cache.take(matching: ids, images: vision(imageStart)?.segments ?? []) == nil)
            if imageStart != nil {
                let changed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vision(imageStart, color: 1))
                c.equal("\(label): changed pixels refuse reuse", changed.1.completePromptHits, 0)
                c.equal("\(label): changed pixels rebuild prompt", changed.1.prefillTokens, count)
            }
            if count == 17 {
                for filtered in [false, true] {
                    var sample = params; sample.temperature = 0.7
                    sample.topK = filtered ? 40 : 0; sample.topP = filtered ? 0.8 : 1
                    sample.minP = filtered ? 0.05 : 0; sample.presencePenalty = filtered ? 1.1 : 0
                    for seed: UInt64 in [7, 7_046_029_254_386_353_130] {
                        sample.seed = seed
                        let cold = generator.generate(promptIds: ids, params: sample, eosIds: [])
                        let hot = generator.generate(promptIds: ids, params: sample, eosIds: [], cache: cache)
                        c.equal("sample \(filtered)/\(seed): exact output", hot.0, cold.0)
                        c.equal("sample \(filtered)/\(seed): complete hit", hot.1.completePromptHits, 1)
                    }
                }
                // Public maxTokens <= 0 means "up to the response ceiling";
                // test zero emissions through cancellation, never by asking
                // this bounded diagnostic to generate 32,768 tokens.
                for limit in [1] {
                    var limited = params; limited.maxTokens = limit
                    let result = generator.generate(promptIds: ids, params: limited, eosIds: [], cache: cache)
                    c.equal("limit \(limit): exact output count", result.0.count, limit)
                    c.equal("limit \(limit): complete hit", result.1.completePromptHits, 1)
                }
                let noOutput = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    shouldContinue: { false })
                c.expect("cancel before first output is empty", noOutput.0.isEmpty && noOutput.1.finishReason == "cancelled" && noOutput.1.requestFailure?.code == .clientCancelled)
                c.equal("zero-emission cancellation reuses complete prompt", noOutput.1.completePromptHits, 1)
                let eos = generator.generate(promptIds: ids, params: params, eosIds: [reference.0[0]], cache: cache)
                c.expect("EOS stops without output", eos.0.isEmpty && eos.1.finishReason == "stop")
                var delivered: [Int] = []
                let stopped = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    onToken: { delivered.append($0); return delivered.count < 2 })
                c.equal("callback cancellation preserves exact prefix", stopped.0, Array(reference.0.prefix(2)))
                let retry = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("cancelled request preserves root", retry.0, reference.0)
                c.equal("retry avoids prefill", retry.1.prefillTokens, 0)
                let key = PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp)
                for wrongKey in [PromptCheckpointKey(model: UUID(), optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: 128, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: !mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: mtp, contextArithmetic: 0)] {
                    c.expect("wrong model, schedule, draft or arithmetic identity refuses complete hit",
                        cache.takeForGeneration(matching: ids, completePromptKey: wrongKey) == nil)
                }
                if let root = cache.takeForGeneration(matching: ids, completePromptKey: key), let raw = root.logits {
                    let rawHash = hash(raw)
                    let unit = PrefixCache.bytesPerToken
                    let stateCharge = max(ids.count, (root.state.allocatedSequenceBytes + unit - 1) / unit)
                    let logitCharge = (raw.nbytes + PrefixCache.logitStorageSlackBytes + unit - 1) / unit
                    let charge = stateCharge + logitCharge
                    for budget in [0, charge, 2 * charge - 1, 2 * charge] {
                        let bounded = PrefixCache(maxTokens: budget)
                        let stored = try bounded.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: ids.count + params.maxTokens, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: raw, vocabularySize: model.cfg.vocabSize, key: key)
                        c.equal("logits charged at budget \(budget)", stored, budget >= 2 * charge)
                        c.equal("exact charged capacity at budget \(budget)", bounded.json()["charged_token_capacity"] as? Int,
                            stored ? charge : 0)
                    }
                    let owned = PrefixCache(maxTokens: 8192)
                    c.expect("ownership checkpoint stored", try owned.storeCompletePrompt(state: root.state, tokens: ids,
                        reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                        logits: raw, vocabularySize: model.cfg.vocabSize, key: key))
                    raw[0] = MLXArray(Float(333))
                    if let first = owned.takeForGeneration(matching: ids, completePromptKey: key), let firstRow = first.logits {
                        c.equal("producer logit context cannot mutate retained row", hash(firstRow), rawHash)
                        firstRow[0] = MLXArray(Float(-333))
                    } else { c.expect("owned checkpoint remains readable", false) }
                    if let second = owned.takeForGeneration(matching: ids, completePromptKey: key), let secondRow = second.logits {
                        c.equal("returned logit context cannot mutate retained row", hash(secondRow), rawHash)
                    } else { c.expect("owned checkpoint remains repeatable", false) }
                    do {
                        _ = try owned.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: MLXArray.zeros([2], dtype: .bfloat16), vocabularySize: model.cfg.vocabSize, key: key)
                        c.expect("malformed logits rejected", false)
                    } catch { c.expect("malformed logits rejected", true) }
                    c.equal("invalid logits preserve existing checkpoint", owned.heldCheckpoints, 1)
                    owned.configure(maxTokens: 0)
                    c.equal("pressure releases state and logits", owned.heldTokens, 0)
                    c.equal("pressure preserves borrowed active state", root.state.tokenCount, count)
                } else { c.expect("complete root exposes logits for ownership checks", false) }
                Stream.gpu.synchronize()
                model.pool.unpinAll()
                try model.pool.diagnosticDiscardResidency()
                let fault = ReadFault(afterJobs: 0); model.pool.readFault = fault
                let failed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                model.pool.readFault = nil
                c.expect("decode read fault fires after complete reuse", fault.hasFired && failed.1.runtimeError != nil)
                c.equal("failed decode reused the prompt", failed.1.completePromptHits, 1)
                let recovered = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("decode failure preserves exact reusable root", recovered.0, reference.0)
                c.equal("read-failure retry avoids prefill", recovered.1.prefillTokens, 0)
                var edited = ids; edited[0] += 1
                let edit = generator.generate(promptIds: edited, params: params, eosIds: [], cache: cache)
                c.equal("edited token misses", edit.1.reusedPrefixTokens, 0)
                let auxiliary = generator.generate(promptIds: [17, 23, 31], params: params, eosIds: [], cache: cache)
                c.expect("auxiliary completes", auxiliary.1.runtimeError == nil)
                let interleaved = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("interleaved output remains exact", interleaved.0, reference.0)
                c.expect("charged capacity stays bounded", (cache.json()["charged_token_capacity"] as? Int ?? Int.max) <= cache.maxTokens)
            }
            cache.drop()
        }
        if mtp {
            let ids = (0..<17).map { 1000 + $0 * 79 }
            let transition = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            generator.speculationEnabled = false
            let plain = generator.generate(promptIds: ids, params: params, eosIds: [], cache: transition)
            c.expect("draft transition seed succeeds", plain.1.runtimeError == nil)
            guard let consumed = transition.peek(extending: ids) else { throw ModelError("draft transition lost exact consumed IDs") }
            let extended = consumed + [907]
            options.completePromptCheckpoint = true; model.optimizations = options
            generator.speculationEnabled = true
            let fallback = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("plain cached state finishes current request plain", fallback.1.verifyPasses, 0)
            c.equal("plain-to-draft transition really reused state", fallback.1.reusedPrefixTokens, consumed.count)
            let rebuilt = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("complete prompt with missing head is not an MTP hit", rebuilt.1.completePromptHits, 0)
            c.equal("missing draft head is rebuilt from the full prompt", rebuilt.1.prefillTokens, extended.count)
            c.expect("rebuilt draft participates", rebuilt.1.verifyPasses > 0)
            let hot = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("rebuilt draft checkpoint can be reused completely", hot.1.completePromptHits, 1)
            c.equal("reused draft output is exact", hot.0, rebuilt.0)
        }
        c.measure("end_physical_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/after/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift

SHA-256 `3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6`; 18311 bytes.

````text
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
        c.equal("absent overrides retain the selected default family",
            try InferenceOptimizations.resolving(environment: [:], defaults: candidate), candidate)
        let candidateFlags: [(String, WritableKeyPath<InferenceOptimizations, Bool>)] = [
            ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
            ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
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
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/before.json

SHA-256 `207290012929ed5e5e6292d51a5b1e4316ed86d1dba8d4306a3aa065368ce1ea`; 20676 bytes.

````text
{
  "captured_at": "2026-09-07T07:48:39.401291+00:00",
  "source": [
    {
      "path": "Sources/Slotstream/PlannerCostModel.swift",
      "before_sha256": null,
      "after_sha256": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0"
    },
    {
      "path": "Sources/Slotstream/Plan.swift",
      "before_sha256": "d1021e321894868c4844f2cbe4978c3ca6c6cfa958c9aa64591e9d0ec08e8ff7",
      "after_sha256": "7e4a911ccd73339f9676f2cd839e5bb403fb3b7540f3acb543df9cde2f09a64d"
    },
    {
      "path": "Sources/Slotstream/ContextMemory.swift",
      "before_sha256": "1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683",
      "after_sha256": "c59d3ea2700eef685182b374934aa10e997f8c045990bd7439d6dd3314f46865"
    },
    {
      "path": "Sources/Slotstream/Optimizations.swift",
      "before_sha256": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
      "after_sha256": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95"
    },
    {
      "path": "Sources/Slotstream/Weights.swift",
      "before_sha256": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "after_sha256": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
      "before_sha256": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
      "after_sha256": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift",
      "before_sha256": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
      "after_sha256": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d"
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
    "Sources/slotstream-cli/main.swift": "a490e0b9d9c902e3996b64e427ce1e1b88b254fc6fe14f9ef7fcd74753f479f4",
    "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "state": "Temporary seven-file current-source candidate build lease; restored before handback."
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/build-state-before.json

SHA-256 `2a1df2d35045c485e065d78e59b88658cb43ad3d60be0de7744d75da16b60381`; 70144 bytes.

````text
{
  ".build/arm64-apple-macosx/release/CSlotpack.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "module.modulemap": {
        "kind": "file",
        "sha256": "025be8cbd763ce7f64ae20e48e10d9f3a4f612f56c7e36fc1131a56e978e465b",
        "mode": 420,
        "mtime_ns": 1788660105977933837
      },
      "slotpack.c.d": {
        "kind": "file",
        "sha256": "8789304d1e604b63b1e9c91b124cd478d6d457b8a9383bfd5b255e66ad1a2404",
        "mode": 420,
        "mtime_ns": 1788665377829139704
      },
      "slotpack.c.o": {
        "kind": "file",
        "sha256": "7d2fdfc9f5277b2c83b6cbaf019f029515187585448a8550af78cd7bbef158a8",
        "mode": 420,
        "mtime_ns": 1788665377828913951
      }
    }
  },
  ".build/arm64-apple-macosx/release/SlotstreamCore.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "Checkpoint.swift.o": {
        "kind": "file",
        "sha256": "e27cfbdc55efaa7b7be2656a56b2e89ff8b5eb5dc6c3d61000a7ccd209d917a7",
        "mode": 420,
        "mtime_ns": 1788370072797895492
      },
      "Context.swift.o": {
        "kind": "file",
        "sha256": "383637a0eee6018951ee4911071b2cee6d1a8e2cd67a2a192e272c006f112fdd",
        "mode": 420,
        "mtime_ns": 1788307715914972985
      },
      "Engine.swift.o": {
        "kind": "file",
        "sha256": "556e9a997489d564a9b6ada5e60737e59d71292b18761ce86b46dd342c3ab166",
        "mode": 420,
        "mtime_ns": 1788370072673440026
      },
      "ExpertStore.swift.o": {
        "kind": "file",
        "sha256": "cccb4863f0cc77526e8008e611d972c3120f76e96fffaf77ce0ea407cacbcea3",
        "mode": 420,
        "mtime_ns": 1788307716217988852
      },
      "GatedDelta.swift.o": {
        "kind": "file",
        "sha256": "7324a4c75adf0731858d2b223dcf1aec33b5daddb172db21398b0a7a77286720",
        "mode": 420,
        "mtime_ns": 1788286234116871389
      },
      "Generate.swift.o": {
        "kind": "file",
        "sha256": "06c98a3fd764f4daee7d1682acbc97a8c391af26dccf040d32938b2c38a380e2",
        "mode": 420,
        "mtime_ns": 1788370072596625992
      },
      "Governor.swift.o": {
        "kind": "file",
        "sha256": "d8f320eaf0583091e8f21df2b8ced04ddca88eb36387d6dc7004e435ec6cf994",
        "mode": 420,
        "mtime_ns": 1788313020535174870
      },
      "Layers.swift.o": {
        "kind": "file",
        "sha256": "41dede68172368830cd5242c61edac7c59d6419803d954fb7de79b62abe469ef",
        "mode": 420,
        "mtime_ns": 1788370072610562407
      },
      "MTP.swift.o": {
        "kind": "file",
        "sha256": "ae30536f7f434a6043257738f2d7f3fc48e5f769f509258fa9ae5625029c5c2d",
        "mode": 420,
        "mtime_ns": 1788370072499294592
      },
      "Model.swift.o": {
        "kind": "file",
        "sha256": "d974f8ce9efcf41305377880349ef7a59630ffff93193ea37e89d6a6f6b08327",
        "mode": 420,
        "mtime_ns": 1788370072618960723
      },
      "NgramStore.swift.o": {
        "kind": "file",
        "sha256": "f1aa15f9ce9cc43acf9868d4afd23556a0bd2cf816619abed08aea126d077668",
        "mode": 420,
        "mtime_ns": 1788317880634695763
      },
      "Plan.swift.o": {
        "kind": "file",
        "sha256": "46447e9e9a9a42143b3484cab740bd6a687eae318e2a3d027bab248ead01a62f",
        "mode": 420,
        "mtime_ns": 1788307716042855993
      },
      "PrefixCache.swift.o": {
        "kind": "file",
        "sha256": "cdefa520e7466e4f77379ab35d75c8dfa79c08658df3ee63ea67d7146220c447",
        "mode": 420,
        "mtime_ns": 1788287736311050523
      },
      "ProcessMemory.swift.o": {
        "kind": "file",
        "sha256": "e0423e569be2b24e8f9b9c41ca7d4f9537f1ae1e2ac8922273e9a774186e826e",
        "mode": 420,
        "mtime_ns": 1788286234088469509
      },
      "Server.swift.o": {
        "kind": "file",
        "sha256": "f84541f55f055b292dccf187f66dfbc06bf45cca9f37975a9a28b0e073d985b6",
        "mode": 420,
        "mtime_ns": 1788370072931691208
      },
      "SlotstreamCore.d": {
        "kind": "file",
        "sha256": "eeec411fdf330879f43f0594f71559db1ddbf63a80080257d25e684527b89043",
        "mode": 420,
        "mtime_ns": 1788372635196353139
      },
      "SlotstreamCore.dia": {
        "kind": "file",
        "sha256": "2c72d5afff8cce441f2f8299a18215b0bf79605aa7eb05839e38f7949b46c0e2",
        "mode": 420,
        "mtime_ns": 1788372635196862896
      },
      "Version.swift.o": {
        "kind": "file",
        "sha256": "a365fb6c02f3b3546c13f69807d7b84b6a71d3fc7e2cc4a0a7484bc00173a5b5",
        "mode": 420,
        "mtime_ns": 1788370072437790330
      },
      "Weights.swift.o": {
        "kind": "file",
        "sha256": "747bc65ad84e95253c8e10e7d3cd6376a4b030d2c8b91c7b71b91eb98be6708f",
        "mode": 420,
        "mtime_ns": 1788307433170735849
      },
      "include": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "SlotstreamCore-Swift.h": {
            "kind": "file",
            "sha256": "41e6099a04966324ec73f2705b07f79046f8424b26dd000a8851ffebec1a0df8",
            "mode": 420,
            "mtime_ns": 1788286234510727892
          },
          "module.modulemap": {
            "kind": "file",
            "sha256": "3014bcbe016d0afc47687eeab90ba27b8fc544f4e2de179aec76409fbd34c94a",
            "mode": 420,
            "mtime_ns": 1787923541537827172
          }
        }
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "2880872f310fd0b2321a29e400bb7bb9cde0a8d8c5644fc342cb3d94fe127ee7",
        "mode": 420,
        "mtime_ns": 1788372623128995225
      },
      "sources": {
        "kind": "file",
        "sha256": "588d3ecdce022f91e7cd70b782929bb9dca9183d349ebf8c93cf265d9275fba9",
        "mode": 420,
        "mtime_ns": 1788307705906691296
      }
    }
  },
  ".build/arm64-apple-macosx/release/SlotstreamDiagnostics.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "CheckReport.swift.o": {
        "kind": "file",
        "sha256": "69d358481dd4511fcd106da316efc542b274ea5fee63203ebe1a0eea497d4c2b",
        "mode": 420,
        "mtime_ns": 1788726838866745722
      },
      "Diagnostics+AdaptiveSpeculation.swift.o": {
        "kind": "file",
        "sha256": "80c152d8d65d0f21eb45f862e5827fc297b5ee52eea9640fee1486cb3f85e554",
        "mode": 420,
        "mtime_ns": 1788740009735764024
      },
      "Diagnostics+AllHitReplay.swift.o": {
        "kind": "file",
        "sha256": "f0fbc60c3b7ef098f480fd734c102c10e53e97602fdb106648b3788a7a00b008",
        "mode": 420,
        "mtime_ns": 1788735243370593768
      },
      "Diagnostics+BlockSelection.swift.o": {
        "kind": "file",
        "sha256": "2bd5d1d87c2bdd4cc811049de2a03da3f007a8f2ef0d73f00d67675ace10bbe7",
        "mode": 420,
        "mtime_ns": 1788735243368870675
      },
      "Diagnostics+CacheBookkeeping.swift.o": {
        "kind": "file",
        "sha256": "4f3505ae0e85175791f069ebc36f1c58e17b732fc342fa87669a9457479bbff6",
        "mode": 420,
        "mtime_ns": 1788735243302773137
      },
      "Diagnostics+CompactIndexer.swift.o": {
        "kind": "file",
        "sha256": "a7071600526d67a94cd0057ef1b87d2f08f5ebc0924c816b10e4d80569607d14",
        "mode": 420,
        "mtime_ns": 1788735243284423992
      },
      "Diagnostics+CompiledNorm.swift.o": {
        "kind": "file",
        "sha256": "f777307f2569b1d360ee63ab90360da2968785d8d44def09948850613857652e",
        "mode": 420,
        "mtime_ns": 1788740009378838598
      },
      "Diagnostics+CompletePrompt.swift.o": {
        "kind": "file",
        "sha256": "c0d1251a6b763b1dab352bfb9d36b3e34c1ac7094236c5059f3dbecacb87b87d",
        "mode": 420,
        "mtime_ns": 1788735243498360237
      },
      "Diagnostics+ComputeIslands.swift.o": {
        "kind": "file",
        "sha256": "caafb07ea083075d188f1b985daf1e581ecc0092a22c1f957a3f20c609e61b9d",
        "mode": 420,
        "mtime_ns": 1788735243394371610
      },
      "Diagnostics+Context.swift.o": {
        "kind": "file",
        "sha256": "478ddde11b5c333dca57ec7d387a088dbd1641652153c5d850b0974cc2a598cf",
        "mode": 420,
        "mtime_ns": 1788735243476766949
      },
      "Diagnostics+ContextServing.swift.o": {
        "kind": "file",
        "sha256": "e1ca118d0f3907bb98d36636c2f849765bcaac1c193a12df72138565ea20a17f",
        "mode": 420,
        "mtime_ns": 1788740009602390984
      },
      "Diagnostics+ContextSmallPass.swift.o": {
        "kind": "file",
        "sha256": "36423311904f7b3f951603cefd68beb3c07112b485733c767357ebcae6de71f4",
        "mode": 420,
        "mtime_ns": 1788735243427940674
      },
      "Diagnostics+Device.swift.o": {
        "kind": "file",
        "sha256": "55b323f1da2206066f4a523ed16bee4de2246a4554ad7c2495cd518b257ca5c0",
        "mode": 420,
        "mtime_ns": 1788373869273296898
      },
      "Diagnostics+EmbeddingRows.swift.o": {
        "kind": "file",
        "sha256": "d621f5f19786dc193b169163b91b9d88cad1ce5000d39ac75780a8cfc76a3b13",
        "mode": 420,
        "mtime_ns": 1788735243343741284
      },
      "Diagnostics+EmbeddingRuntime.swift.o": {
        "kind": "file",
        "sha256": "a40a8f225b1fb534e75349571c79af9bae7941d3eb88c70a2d9f61824e20756c",
        "mode": 420,
        "mtime_ns": 1788735243461256612
      },
      "Diagnostics+ExactRead.swift.o": {
        "kind": "file",
        "sha256": "5788dd077c52384fc37d716c2c3aa59324f41ea3dbc98a78aa0aafae7cf7512c",
        "mode": 420,
        "mtime_ns": 1788735243288682183
      },
      "Diagnostics+GDNProfile.swift.o": {
        "kind": "file",
        "sha256": "3a2687fbd3baaa135f4593e626ae00a0dd99aec69b59d058c4871d737d9da6d0",
        "mode": 420,
        "mtime_ns": 1788735243391718554
      },
      "Diagnostics+GDNProjection.swift.o": {
        "kind": "file",
        "sha256": "835c386780855282158ac0c994506a40c2d4e390d58d890cf67f6a8936b666ac",
        "mode": 420,
        "mtime_ns": 1788735243305614236
      },
      "Diagnostics+Governor.swift.o": {
        "kind": "file",
        "sha256": "c2d10bc9713c48cde667895efaaa529c3c26f89fe02939ecd136255c27102308",
        "mode": 420,
        "mtime_ns": 1788726838713089445
      },
      "Diagnostics+HTTP.swift.o": {
        "kind": "file",
        "sha256": "497aec854dd8746eea0f7532a02f4f649e44536948260ae5ad36ee2bca4ce636",
        "mode": 420,
        "mtime_ns": 1788735243291463532
      },
      "Diagnostics+ImageFailure.swift.o": {
        "kind": "file",
        "sha256": "6b3dcc78bfc36dfab31c955f5a0ea027f815c7bb58ea135def9661a5c8664323",
        "mode": 420,
        "mtime_ns": 1788726838747127928
      },
      "Diagnostics+ImageReuse.swift.o": {
        "kind": "file",
        "sha256": "35ff7086c945fb2bba2651f51a3344a7ccac2918636009902c3c216dec99ee7d",
        "mode": 420,
        "mtime_ns": 1788735243325124637
      },
      "Diagnostics+Integrated.swift.o": {
        "kind": "file",
        "sha256": "d019bce41cc9ab0ce52fda4a61603c734608eff5877f904152a0f0cadb59afa8",
        "mode": 420,
        "mtime_ns": 1788735243438518442
      },
      "Diagnostics+LayerLocalVictim.swift.o": {
        "kind": "file",
        "sha256": "1c3846ff6517ff0c4e37e80d76ae1bf71e7645dea2b2f0c393aa0a4542e296e3",
        "mode": 420,
        "mtime_ns": 1788735243352712126
      },
      "Diagnostics+MTPIndexer.swift.o": {
        "kind": "file",
        "sha256": "4af377f7c48673f820b0d5308e156e5c9b9c8e7852cdecf5a9671d2583e88438",
        "mode": 420,
        "mtime_ns": 1788735243391684220
      },
      "Diagnostics+Machine.swift.o": {
        "kind": "file",
        "sha256": "955f6d0b18322c9af002b42b10d11091dd7abaf4c5db261f26660b1c01de98a1",
        "mode": 420,
        "mtime_ns": 1788726838767157574
      },
      "Diagnostics+NgramCache.swift.o": {
        "kind": "file",
        "sha256": "9e507274d3f731cfd68d8823c54632cc70afe0f48121e32243596cfa422807fb",
        "mode": 420,
        "mtime_ns": 1788726838886534576
      },
      "Diagnostics+NgramLookahead.swift.o": {
        "kind": "file",
        "sha256": "42de91cf5d59883579b7347a7f49c16efc3a0606df21f06d3fdb12c01ebbee1a",
        "mode": 420,
        "mtime_ns": 1788735243414119471
      },
      "Diagnostics+Optimization.swift.o": {
        "kind": "file",
        "sha256": "6cd1d0ddd3be2b611887849e1ed4e733707a9612ab1b8473761f33c21dd81e5d",
        "mode": 420,
        "mtime_ns": 1788735243771922151
      },
      "Diagnostics+Output.swift.o": {
        "kind": "file",
        "sha256": "1377c76f0bca80f75a8b830cab93440bfa7cb466db4a78c8749ce6a4ac138ca5",
        "mode": 420,
        "mtime_ns": 1788735243372168860
      },
      "Diagnostics+OutputServing.swift.o": {
        "kind": "file",
        "sha256": "56a27e239716e521d01be2c2dc470d5f67afae25e52a711d015e66e3a41c9a74",
        "mode": 420,
        "mtime_ns": 1788735243563428436
      },
      "Diagnostics+PackedLayout.swift.o": {
        "kind": "file",
        "sha256": "1600cfad72f0ca594fb0dfe088324c3e64f6a10cf5dd119c2b18133329fbf949",
        "mode": 420,
        "mtime_ns": 1788735243599282471
      },
      "Diagnostics+PartialRotation.swift.o": {
        "kind": "file",
        "sha256": "0d0850112b41a853d45db706fc3f16307954f1adf287b287a2f5e02259b840ae",
        "mode": 420,
        "mtime_ns": 1788735243408459856
      },
      "Diagnostics+PoolRequests.swift.o": {
        "kind": "file",
        "sha256": "6b71132ded1a4187744e5ac5fdd9073492b8394c34333b6ddcf5a482e103cec7",
        "mode": 420,
        "mtime_ns": 1788735243436059303
      },
      "Diagnostics+PrefillQualification.swift.o": {
        "kind": "file",
        "sha256": "e20dcb0c4523b0e9e792b4aa01eccebc1e66dc24558dc552e0bd11cf8c9743ba",
        "mode": 420,
        "mtime_ns": 1788735243558794410
      },
      "Diagnostics+PrefixCapacity.swift.o": {
        "kind": "file",
        "sha256": "3ef91d2a84e9f14222a1c7548846900d17814bb6a6b28a4858ab35ab1e3d484d",
        "mode": 420,
        "mtime_ns": 1788735243440411203
      },
      "Diagnostics+PrefixFork.swift.o": {
        "kind": "file",
        "sha256": "a20caf4d4e1394648de870ffada1872523af52220dbd89b0595018fec46174ae",
        "mode": 420,
        "mtime_ns": 1788735243474161601
      },
      "Diagnostics+PrefixRetention.swift.o": {
        "kind": "file",
        "sha256": "9109e87de3aacb7f2eed07643f574232b2e811aa7585f3d56ce447d9aade4fff",
        "mode": 420,
        "mtime_ns": 1788735243605605007
      },
      "Diagnostics+PrefixVision.swift.o": {
        "kind": "file",
        "sha256": "96a10eddf4d10096c0da2fe581b1f89c9c0cb469d46a9870dfe99a1dbcf98784",
        "mode": 420,
        "mtime_ns": 1788735243604580084
      },
      "Diagnostics+PressureBoundary.swift.o": {
        "kind": "file",
        "sha256": "3f2d5c76b6dc371966b6eb37d0dd574290a0be4af8784e8db6a11299890e3a84",
        "mode": 420,
        "mtime_ns": 1788726839025486473
      },
      "Diagnostics+Pull.swift.o": {
        "kind": "file",
        "sha256": "79cc2af63237959c539bd6871bee76c399a069ae4bb6738e7068745625648abe",
        "mode": 420,
        "mtime_ns": 1788726838904398008
      },
      "Diagnostics+ReadFailureServing.swift.o": {
        "kind": "file",
        "sha256": "83fe1e0310439b8a9fad7a6808441dc34f52b80f00d6e47b9a7d1dae46c9156d",
        "mode": 420,
        "mtime_ns": 1788735243636304680
      },
      "Diagnostics+ReadHandles.swift.o": {
        "kind": "file",
        "sha256": "43c81f26179a1063adb71620adc6511df1a06aaee282940514e6f8287c09eb1d",
        "mode": 420,
        "mtime_ns": 1788735243437658479
      },
      "Diagnostics+ReadRecovery.swift.o": {
        "kind": "file",
        "sha256": "2ccb6e379c873beeb5fb6cf94efb73f7ddae140f40298ad6299bbd8f5d795ed3",
        "mode": 420,
        "mtime_ns": 1788735243605582798
      },
      "Diagnostics+ResidentOverlap.swift.o": {
        "kind": "file",
        "sha256": "669e367e9aadf715c4cc965855ef8498362bbe116710cd07c6d1a429b902d23a",
        "mode": 420,
        "mtime_ns": 1788735243533091682
      },
      "Diagnostics+RopePerformance.swift.o": {
        "kind": "file",
        "sha256": "41665a623ac48d057b25c9b3dc6fd282a0981bc51241b03bfb2b5bd8d5a6e0fb",
        "mode": 420,
        "mtime_ns": 1788735243492096410
      },
      "Diagnostics+RouterProjection.swift.o": {
        "kind": "file",
        "sha256": "47743a9fce68985614ad077a7d5c8c5c9bf06f0494b4d26c79c49ed807a8fa3b",
        "mode": 420,
        "mtime_ns": 1788735243461742198
      },
      "Diagnostics+Runtime.swift.o": {
        "kind": "file",
        "sha256": "c35e2a7b871736916e8934649194f48f042baf1aa066be213b82cc0733f321ac",
        "mode": 420,
        "mtime_ns": 1788735243581634372
      },
      "Diagnostics+RuntimeBudget.swift.o": {
        "kind": "file",
        "sha256": "7f1dd592636a0d6ad0ece691a7f3a25ad64ff61640d892fbafbf98923bfe755e",
        "mode": 420,
        "mtime_ns": 1788735243552808043
      },
      "Diagnostics+SamplerPerformance.swift.o": {
        "kind": "file",
        "sha256": "b7577b2cc52a89818209eb4f9096b55d3c8bc46c35ce1e7b915e69d9251d91e0",
        "mode": 420,
        "mtime_ns": 1788735243518662726
      },
      "Diagnostics+SelectedAttention.swift.o": {
        "kind": "file",
        "sha256": "9414389b871150de24322de1314fa743c348c264679ec95e00d5ff920e9bbc59",
        "mode": 420,
        "mtime_ns": 1788735243637615645
      },
      "Diagnostics+Selection.swift.o": {
        "kind": "file",
        "sha256": "e97221274411ddf63c75fa1906a16d98b10e5fe2749752a7a920f2bc04c96713",
        "mode": 420,
        "mtime_ns": 1788735243680335594
      },
      "Diagnostics+SlotSlices.swift.o": {
        "kind": "file",
        "sha256": "227522e3d92779cf56bfe10af4dd46692a5290b501395a79b854272599a460cc",
        "mode": 420,
        "mtime_ns": 1788735243683546195
      },
      "Diagnostics+StateRecovery.swift.o": {
        "kind": "file",
        "sha256": "9281c1e191bb9f4739d5178c3075340057bdf27f0c781a5eebd0d0dd64df6a38",
        "mode": 420,
        "mtime_ns": 1788735243623060813
      },
      "Diagnostics+TerminalPrefill.swift.o": {
        "kind": "file",
        "sha256": "e099f1a6c1b69c9bc0fb07b8b2d628702b3ca93ed04537781087a344179681a8",
        "mode": 420,
        "mtime_ns": 1788726839047233667
      },
      "Diagnostics+Vision.swift.o": {
        "kind": "file",
        "sha256": "36f349dcdc451820319d29eb488daac5971ed9bf0c37534973265e515478db71",
        "mode": 420,
        "mtime_ns": 1788735243724393591
      },
      "Diagnostics+VisionAttention.swift.o": {
        "kind": "file",
        "sha256": "f25fd90b0d9f1fa8285ca0c87881d393efd4460eae7f242d0613245cdee564ef",
        "mode": 420,
        "mtime_ns": 1788735243590569714
      },
      "Diagnostics+VisionCapacity.swift.o": {
        "kind": "file",
        "sha256": "ebfa4c0c62e39ca753f8e15407e70461e921c7f8d38906e477b27d6ae158dd98",
        "mode": 420,
        "mtime_ns": 1788735243664419338
      },
      "Diagnostics.swift.o": {
        "kind": "file",
        "sha256": "ec79e37f0cbd0e88a7df64d0860361eaf5639d39ef0b47e786e840da284532b9",
        "mode": 420,
        "mtime_ns": 1788735243602348447
      },
      "Goldens.swift.o": {
        "kind": "file",
        "sha256": "b107f57449a9cb450d3f24be6b461cc9c4c7f3f0a980e15a1326dce2de021884",
        "mode": 420,
        "mtime_ns": 1788735243637010475
      },
      "SlotstreamDiagnostics.d": {
        "kind": "file",
        "sha256": "0453f309d3695cb79c851de92a63dfc745719c90d7988e495261596c35d2872f",
        "mode": 420,
        "mtime_ns": 1788740009784582383
      },
      "SlotstreamDiagnostics.dia": {
        "kind": "file",
        "sha256": "54c93d8b1f21c8c33282c0c5b70ac3dea2dc27adcabb9a7cf5f06f5e0a5aed75",
        "mode": 420,
        "mtime_ns": 1788740009785108269
      },
      "include": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "SlotstreamDiagnostics-Swift.h": {
            "kind": "file",
            "sha256": "324b76f19658d04f581b59fa9f91e7513af6eca7761610d336621b0f86839d13",
            "mode": 420,
            "mtime_ns": 1788726839252385564
          },
          "module.modulemap": {
            "kind": "file",
            "sha256": "cdf5a9828edc46848bd6fbe12a6b34e16f3b6cfd3e96bf3731f57df5fb6d296e",
            "mode": 420,
            "mtime_ns": 1788373501895064888
          }
        }
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "b4f4d1372b28800bac70480b001c0dde3da22fc02f36cf6759cc7ce090eb744f",
        "mode": 420,
        "mtime_ns": 1788725658109782721
      },
      "sources": {
        "kind": "file",
        "sha256": "54efeb230af6139dbaaf7eaf65d7d8903d4319d57c2b75072341e97232e6719f",
        "mode": 420,
        "mtime_ns": 1788725658644355968
      }
    }
  },
  ".build/arm64-apple-macosx/release/SlotstreamTestKit.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "Catalogue.swift.o": {
        "kind": "file",
        "sha256": "a60f46ee448949a344c3acd419cdc6c97db17f096e9b9d964e88d4ba434356d1",
        "mode": 420,
        "mtime_ns": 1788644233695577771
      },
      "GatewayChecks.swift.o": {
        "kind": "file",
        "sha256": "49196d869d0080b1c58d3fcae6a12828853789ee5ed557f8581601daf3e09f7f",
        "mode": 420,
        "mtime_ns": 1788644234306425733
      },
      "OpenAIChecks.swift.o": {
        "kind": "file",
        "sha256": "59d3101afc61570eb911a2794f9ccd4a72e63b3c2091edf7f39c54f33444a5eb",
        "mode": 420,
        "mtime_ns": 1788720406899564692
      },
      "SlotstreamTestKit.d": {
        "kind": "file",
        "sha256": "7b907cacae8d0c67a4c588dafc3e853be020ea3c0a85de288b53c2f793ccf38f",
        "mode": 420,
        "mtime_ns": 1788734480991275354
      },
      "SlotstreamTestKit.dia": {
        "kind": "file",
        "sha256": "2c72d5afff8cce441f2f8299a18215b0bf79605aa7eb05839e38f7949b46c0e2",
        "mode": 420,
        "mtime_ns": 1788734480991467522
      },
      "T0Checks.swift.o": {
        "kind": "file",
        "sha256": "8839d6ff67fc806371109412435d4617c730ceff28ba66503e60aed5c9343897",
        "mode": 420,
        "mtime_ns": 1788720406782103692
      },
      "ToolCallChecks.swift.o": {
        "kind": "file",
        "sha256": "1a233422bfd9c733559939e218df73ed6793f2f93f5058df5fc30be908fd4e9b",
        "mode": 420,
        "mtime_ns": 1788644233782225314
      },
      "include": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "SlotstreamTestKit-Swift.h": {
            "kind": "file",
            "sha256": "a7b43939e8f8cadf3eacfa8b27862be2f7e50a667cc1b915839cf9c1b49c5302",
            "mode": 420,
            "mtime_ns": 1788373595205707849
          },
          "module.modulemap": {
            "kind": "file",
            "sha256": "2f47a526663ed32c6784e16486d093b3cf0698a2b9284ad83a9e9da61a8102d2",
            "mode": 420,
            "mtime_ns": 1788373501894658050
          }
        }
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "36735d586608e3171890952b3c4d9765705a5c3cb813e128b3406cc4a0a60150",
        "mode": 420,
        "mtime_ns": 1788725658106549718
      },
      "sources": {
        "kind": "file",
        "sha256": "8754fecbdeb3d7fd84de7005e275b079570d5b8ca75b56e9c9a55931556f7b41",
        "mode": 420,
        "mtime_ns": 1788644090161522034
      }
    }
  },
  ".build/arm64-apple-macosx/release/SlotstreamTests.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "output-file-map.json": {
        "kind": "file",
        "sha256": "e3c75809dde96e892ca3d0b90732c6c28a4e51d468727c63e16745e359c8bf39",
        "mode": 420,
        "mtime_ns": 1787923628493173314
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream-checks.dSYM": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "Contents": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "Info.plist": {
            "kind": "file",
            "sha256": "4bb6f09f5fa4e317cafde7cb4a486fbb1f93f80812919cae5ec70b2291ef0758",
            "mode": 420,
            "mtime_ns": 1788740524713089026
          },
          "Resources": {
            "kind": "directory",
            "mode": 493,
            "entries": {
              "DWARF": {
                "kind": "directory",
                "mode": 493,
                "entries": {
                  "slotstream-checks": {
                    "kind": "file",
                    "sha256": "da0f41111c74d796648a33e450477a6592e8110c47b7981eee6874b1aea901a7",
                    "mode": 420,
                    "mtime_ns": 1788740527971905627
                  }
                }
              },
              "Relocations": {
                "kind": "directory",
                "mode": 493,
                "entries": {
                  "aarch64": {
                    "kind": "directory",
                    "mode": 493,
                    "entries": {
                      "slotstream-checks.yml": {
                        "kind": "file",
                        "sha256": "a2b5ff8a1750bc903486772be6842d213bd619b1d824c2cb2b6428d7c228be14",
                        "mode": 420,
                        "mtime_ns": 1788740527910091069
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream-checks.product": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "Objects.LinkFileList": {
        "kind": "file",
        "sha256": "4ecf1a827fd786e3e8434f3a5c032dd3ebb984a5c2574575819f15c819533633",
        "mode": 420,
        "mtime_ns": 1788726842691680926
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "AdaptiveSpeculation.swift.o": {
        "kind": "file",
        "sha256": "f11dd2260de134fca6f5b1cc8eeae447516087f8645362621932566d093f73e7",
        "mode": 420,
        "mtime_ns": 1788734426726647219
      },
      "BlockSelection.swift.o": {
        "kind": "file",
        "sha256": "7a555f70ad3f23c3816c0184c01f5e475292b70f4d915f318c216c49b56bf667",
        "mode": 420,
        "mtime_ns": 1788686548231029964
      },
      "BoundedOutput.swift.o": {
        "kind": "file",
        "sha256": "17734115f85fe4109af99f5f89a72f0c8fc0df33dd6baa68a7069e390d5a3ed6",
        "mode": 420,
        "mtime_ns": 1788725685034534771
      },
      "CPUSlotWrite.swift.o": {
        "kind": "file",
        "sha256": "ed1923d3fce63f3c906673a7e1d919a3b47f092590b80763e6f6e10a7b1ac183",
        "mode": 420,
        "mtime_ns": 1788686548221885785
      },
      "CacheBookkeeping.swift.o": {
        "kind": "file",
        "sha256": "a2fd94a0cf7f3164a2598f85235a446ce0f838283464532575500d7649eb1f78",
        "mode": 420,
        "mtime_ns": 1788725685450856493
      },
      "Checkpoint.swift.o": {
        "kind": "file",
        "sha256": "7e8b248b0a3c9311d99b27f57de82ebe761874dceb1dde19e104e975ef51886c",
        "mode": 420,
        "mtime_ns": 1788720351800710007
      },
      "CompiledArithmetic.swift.o": {
        "kind": "file",
        "sha256": "19a1188ab68253781bfb437e31f15056b3d03faa53cfb3a5ba85b1d60a6e8467",
        "mode": 420,
        "mtime_ns": 1788686548223087276
      },
      "Context.swift.o": {
        "kind": "file",
        "sha256": "fcc9838c65b0976ff7332e331fda51fccb0e7cc903087c455222399fe7d09f5d",
        "mode": 420,
        "mtime_ns": 1788730809724147319
      },
      "ContextCommands.swift.o": {
        "kind": "file",
        "sha256": "55518b545f4c526683a0df28e0fa9fd523d0b4491a8ddb3c145b58833db20d5a",
        "mode": 420,
        "mtime_ns": 1788370078324854488
      },
      "ContextFeasibility.swift.o": {
        "kind": "file",
        "sha256": "80b1841f8e6e3f26960cea8cdfd6e5dc8b37ab42bb1ce7189431bb08741e0d3a",
        "mode": 420,
        "mtime_ns": 1788720351481038970
      },
      "ContextMemory.swift.o": {
        "kind": "file",
        "sha256": "637cf59d0ff399767623794cd9f2488363136590846a754b85ce92841569ff7a",
        "mode": 420,
        "mtime_ns": 1788730809731229184
      },
      "Device.swift.o": {
        "kind": "file",
        "sha256": "7dcbb5fdf4d15707515ad02dfa4e516bf9d0b74310656295ed0efa2174d2177e",
        "mode": 420,
        "mtime_ns": 1788373865935802545
      },
      "DownloadConcurrency.swift.o": {
        "kind": "file",
        "sha256": "c1ebb9379c86240598096b17ad47c6b7dd11e2241b2a47a6628b9cd3d6f9ba7f",
        "mode": 420,
        "mtime_ns": 1788686548213317936
      },
      "DownloadHTTP.swift.o": {
        "kind": "file",
        "sha256": "0cf18c3c608638f7d4d30b4553e9440363f3ddb5b48ad67180601f734ce0a405",
        "mode": 420,
        "mtime_ns": 1788734426567032776
      },
      "EmbeddingRows.swift.o": {
        "kind": "file",
        "sha256": "3bdec2faf1016ec1c4f86fa36b901415a2591325a225e1e54f7a0206801aaa22",
        "mode": 420,
        "mtime_ns": 1788720351660407371
      },
      "Engine.swift.o": {
        "kind": "file",
        "sha256": "cae12663d0524bcb26e4daa0365d96aad39958a384e750d9c0396afb7c60a549",
        "mode": 420,
        "mtime_ns": 1788734427175536235
      },
      "Errors.swift.o": {
        "kind": "file",
        "sha256": "69e0ea4b62ce74618bd6e8c4230dfab881dc726acbb5807f9ae53878fd007f90",
        "mode": 420,
        "mtime_ns": 1788686548231031339
      },
      "ExactRead.swift.o": {
        "kind": "file",
        "sha256": "82ac56602a7ff73414e9d8042aad539a31fbc72cd59c8067250e35e822d3ad8b",
        "mode": 420,
        "mtime_ns": 1788686548234222189
      },
      "ExpertStore.swift.o": {
        "kind": "file",
        "sha256": "ad0f00abd92ca25eee60202af1e6e4d67b79ba008fb763a55e2fbc93007641f5",
        "mode": 420,
        "mtime_ns": 1788725685486402241
      },
      "ExpertTransferProfile.swift.o": {
        "kind": "file",
        "sha256": "b8f4b9113bf89409f0dbb7868419d690687801397091f8a63f3ff6f766ac1736",
        "mode": 420,
        "mtime_ns": 1788686548224111268
      },
      "GDNPhaseProfile.swift.o": {
        "kind": "file",
        "sha256": "dbf7e978a798f153d5834a099231acb8eef30c1ee8403cf76916b207408056ea",
        "mode": 420,
        "mtime_ns": 1788686548215468169
      },
      "GatedDelta.swift.o": {
        "kind": "file",
        "sha256": "18d2f55211d1383e66e796ad8fd5bb828edccf76568180495e6c1d022432542b",
        "mode": 420,
        "mtime_ns": 1788686548594970999
      },
      "GatewayDialect.swift.o": {
        "kind": "file",
        "sha256": "561dfb9f16ec70337e6657db83ca1a57b5a785f6f3093195e9fb053ca0376394",
        "mode": 420,
        "mtime_ns": 1788720351628642445
      },
      "Generate.swift.o": {
        "kind": "file",
        "sha256": "863ff1c225723f6da12d5a3913be65e519e681a9355cfd8afe909a63bd6587a6",
        "mode": 420,
        "mtime_ns": 1788734427119714613
      },
      "Governor.swift.o": {
        "kind": "file",
        "sha256": "9be2bbefb0c83953624da9d9922d37b0c6dd42498ecf4f7798b502ca2315d8e5",
        "mode": 420,
        "mtime_ns": 1788734426595740298
      },
      "LayerLocalVictim.swift.o": {
        "kind": "file",
        "sha256": "19f578954c446d36fc49d85ec3148f5e7285bf101f97f1e53348f83eab81354f",
        "mode": 420,
        "mtime_ns": 1788686548228105195
      },
      "Layers.swift.o": {
        "kind": "file",
        "sha256": "09ca0cf95b434c574a9d2a28c6992d2a267462fb2f727c68cb304f817cbe76a1",
        "mode": 420,
        "mtime_ns": 1788740524138610119
      },
      "MTP.swift.o": {
        "kind": "file",
        "sha256": "2eeaedd1518487190bcdaed2f73e778e8b89058910414b334aa475d578c32312",
        "mode": 420,
        "mtime_ns": 1788725685034868267
      },
      "MTPCommands.swift.o": {
        "kind": "file",
        "sha256": "0b6504ae9ea60eb1c07672abb1221e94946153c35a5de21f0db1e2d61f4d2b15",
        "mode": 420,
        "mtime_ns": 1788317887353018262
      },
      "Machine.swift.o": {
        "kind": "file",
        "sha256": "8b588d42edabdbf2eefc916d8faf0272b61b7bdd81f6ae879487a6cc196ed0cd",
        "mode": 420,
        "mtime_ns": 1788720351489242554
      },
      "MemTrace.swift.o": {
        "kind": "file",
        "sha256": "32ef06cdf6ecddbc1231380b7dcad8e09b3ad1f6567aa5ddef098025c36e217c",
        "mode": 420,
        "mtime_ns": 1788686548303126651
      },
      "Model.swift.o": {
        "kind": "file",
        "sha256": "87290fcc65068a952184aae828d18810077c70612f99bade3159caeaca0095cc",
        "mode": 420,
        "mtime_ns": 1788730810176128573
      },
      "NgramPrefetch.swift.o": {
        "kind": "file",
        "sha256": "01605f98d501841eadf18a420bb869b2d2c5d7d9e189a0090116389973bdbd16",
        "mode": 420,
        "mtime_ns": 1788686548264836700
      },
      "NgramStore.swift.o": {
        "kind": "file",
        "sha256": "a756bf84f78cc7a272b382c75c2c94eea4a7c763757c69eff23886e92c28a2c8",
        "mode": 420,
        "mtime_ns": 1788725685164590364
      },
      "Observation.swift.o": {
        "kind": "file",
        "sha256": "84fb5b9c86553bb2454bb3801a7ad8291b9f18baa7f2f428170087e0cf6f11a2",
        "mode": 420,
        "mtime_ns": 1788725685030189863
      },
      "OpenAIDialect.swift.o": {
        "kind": "file",
        "sha256": "64f6f1c4a06e21ab12e55a3c2e52c0d83f63efdce6920b90dfceef513c1a701d",
        "mode": 420,
        "mtime_ns": 1788720351688655939
      },
      "OpenAIOutput.swift.o": {
        "kind": "file",
        "sha256": "ffcd5ed19f958f7d5d07f17fdd4ccbf25bb8941cf76fca6ce234a463c2565828",
        "mode": 420,
        "mtime_ns": 1788720351548218553
      },
      "OptimizationPlatform.swift.o": {
        "kind": "file",
        "sha256": "cba5326e15f658dd5946bbe4e41ee0cc4a80584ec3a58221e7c60e03ab12d42a",
        "mode": 420,
        "mtime_ns": 1788713368995479833
      },
      "Optimizations.swift.o": {
        "kind": "file",
        "sha256": "4a16b50eebe080c9edc22144a9f1b1e2e7ac410ba3d97f85a0d3c80baabdd714",
        "mode": 420,
        "mtime_ns": 1788728206036911252
      },
      "PackedExpertLayout.swift.o": {
        "kind": "file",
        "sha256": "b056203eac01c26dd85448e9cbfac4a5a37d1621fd0b9a7a74cd0ab6a7ecb27e",
        "mode": 420,
        "mtime_ns": 1788686548553679655
      },
      "PackedProjectionPair.swift.o": {
        "kind": "file",
        "sha256": "488bf16c573416819d6ae4b428e87c3d40a77df5668f972931ad0831f30c2b77",
        "mode": 420,
        "mtime_ns": 1788700303262795123
      },
      "PartialRotation.swift.o": {
        "kind": "file",
        "sha256": "a96aae7bf4de593c2c6ba2be5436e83ee08890e3b237035a3a91923688f55296",
        "mode": 420,
        "mtime_ns": 1788693838329023273
      },
      "PinnedModel.swift.o": {
        "kind": "file",
        "sha256": "ced3e9a9afb2074110bdaf2674dc652a10ae254315deaa20331d2d072013236b",
        "mode": 420,
        "mtime_ns": 1788686548383016278
      },
      "PinnedTransport.swift.o": {
        "kind": "file",
        "sha256": "21bdef2b283c3e8cbbfb681e91c460b1b73e31a8790934b890023047a5ba7449",
        "mode": 420,
        "mtime_ns": 1788734426508929353
      },
      "PinnedTransportManifest.swift.o": {
        "kind": "file",
        "sha256": "0e531ec35cb11405802e2d46777e93f2d8d4e47ecf1a87965650cda02d4fae9a",
        "mode": 420,
        "mtime_ns": 1788686548361726069
      },
      "Plan.swift.o": {
        "kind": "file",
        "sha256": "50a1ecf6304f6ec5fbfa0b883ab3b23ac8be928469d95972af5998d22e08db04",
        "mode": 420,
        "mtime_ns": 1788730809881275280
      },
      "PrefixCache.swift.o": {
        "kind": "file",
        "sha256": "b6d68a29344be2d13a59e26040d2a178faa5c4a47384cf3c93fc9f252194b31e",
        "mode": 420,
        "mtime_ns": 1788725685330948322
      },
      "PressureBoundary.swift.o": {
        "kind": "file",
        "sha256": "ede578a874995f3c0f7b013f17fc50e7ab8500b7556597658597c4602717cf23",
        "mode": 420,
        "mtime_ns": 1788720351521384145
      },
      "ProcessMemory.swift.o": {
        "kind": "file",
        "sha256": "5d6e6294846dacc469cc3a8548d1fa757a4a6c0e1f6eb0ce7e2bc680c16446c2",
        "mode": 420,
        "mtime_ns": 1788725685025081340
      },
      "Pull.swift.o": {
        "kind": "file",
        "sha256": "1cffb323d4b30c3308bb7f40686abd1d92f4fab5ae256f3725da2ca01e0bf323",
        "mode": 420,
        "mtime_ns": 1788370077470648153
      },
      "RequestControl.swift.o": {
        "kind": "file",
        "sha256": "25a4405e9fd047262182a399b80138675804b886a5cdcfd331c5f690bfd27657",
        "mode": 420,
        "mtime_ns": 1788720351716257843
      },
      "ResidentExpertOverlap.swift.o": {
        "kind": "file",
        "sha256": "78f2eb9ec63b02c737acf4291ace3a164acb8bab1ecdc0ad2e558f9ff2c871d1",
        "mode": 420,
        "mtime_ns": 1788725684975351592
      },
      "RouterProjection.swift.o": {
        "kind": "file",
        "sha256": "395a38db6912d66123c321954ca3b7c0465669fb232b36bd83a925c36e0364c2",
        "mode": 420,
        "mtime_ns": 1788725684986321880
      },
      "RouterSelection.swift.o": {
        "kind": "file",
        "sha256": "d0d878478ce13a74e182b3be73ed3b86e440f88dfe46d4acfcbb88f14e600008",
        "mode": 420,
        "mtime_ns": 1788686548433101596
      },
      "RouterTrace.swift.o": {
        "kind": "file",
        "sha256": "7bd2d336117c981cee61cec050a582f1d1cc451b4161d23d67302917922a1700",
        "mode": 420,
        "mtime_ns": 1788686548455734586
      },
      "SelectedAttention.swift.o": {
        "kind": "file",
        "sha256": "e70e986218c9667109e2374deeea8252c64ec0f7794bafe00d987855c02dd042",
        "mode": 420,
        "mtime_ns": 1788686548488713995
      },
      "Server.swift.o": {
        "kind": "file",
        "sha256": "56f2684c191466a3ece9ee96b5ff8057246ed9bdae46242ed5fa74c684127961",
        "mode": 420,
        "mtime_ns": 1788740524271471410
      },
      "SlotWritePlan.swift.o": {
        "kind": "file",
        "sha256": "41cc58e44e23794b53849b74902366a7ae7ccedb9de834d6b52d25981f330ea6",
        "mode": 420,
        "mtime_ns": 1788686548479179278
      },
      "SlotpackDownload.swift.o": {
        "kind": "file",
        "sha256": "e4071862f8a8276cb275704eb946a5d6eb2ce65c4161cbdd8823ba1950aa5746",
        "mode": 420,
        "mtime_ns": 1788734426734950303
      },
      "SlotpackManifest.swift.o": {
        "kind": "file",
        "sha256": "bf3ce97c162df9092188b194cb91a42a39f96b247611aad0d7344da37b726ae3",
        "mode": 420,
        "mtime_ns": 1788686548638700200
      },
      "Slotstream.d": {
        "kind": "file",
        "sha256": "d942162ab7ee7bf433b37696f5b39404610dcdffe7ed3ee8cb43d852e38ec378",
        "mode": 420,
        "mtime_ns": 1788740524330742961
      },
      "StatePrefixFork.swift.o": {
        "kind": "file",
        "sha256": "1db2a807937b26cb0cef0b24bd11cf15a36510a294571d8e89b2233d23a958e4",
        "mode": 420,
        "mtime_ns": 1788725685072930985
      },
      "StateRecovery.swift.o": {
        "kind": "file",
        "sha256": "3c27b1daee151718deb9e33908d2a0cfb99b710ee14153ed3026e6acbd7872f3",
        "mode": 420,
        "mtime_ns": 1788720351661656240
      },
      "ToolCallSplitter.swift.o": {
        "kind": "file",
        "sha256": "545ac423993771030807795b5e16ff5abef20ea42141213a9183454bb7fff695",
        "mode": 420,
        "mtime_ns": 1788720351984698677
      },
      "Version.swift.o": {
        "kind": "file",
        "sha256": "34ba70006570de4dceeb07a48c3fbae406d4bffcf3232db396e422e767252224",
        "mode": 420,
        "mtime_ns": 1788734426495380533
      },
      "Vision.swift.o": {
        "kind": "file",
        "sha256": "157157b7803e9218241d375fb8b6c3bff08c31fc03117f5fb9da03975501c492",
        "mode": 420,
        "mtime_ns": 1788720352070328877
      },
      "VisionAttention.swift.o": {
        "kind": "file",
        "sha256": "b13c16b22d6229527fa614e37d6121b348814c7623eee9aa56991d5af63417c3",
        "mode": 420,
        "mtime_ns": 1788720351714750559
      },
      "VisionPrompt.swift.o": {
        "kind": "file",
        "sha256": "932e2e4e8e257fea4a4d3ac56842e2a99ac96bcd97b92b1efea9b48753e0aab6",
        "mode": 420,
        "mtime_ns": 1788725685106100344
      },
      "WeightDownload.swift.o": {
        "kind": "file",
        "sha256": "dfeedd553ae5d51385b7b0a95a6a675a66a22cf4de06e50cda0bef2873bd11cc",
        "mode": 420,
        "mtime_ns": 1788720351949673184
      },
      "WeightStore.swift.o": {
        "kind": "file",
        "sha256": "56fc04d6a7145027ae353cc7d215081dd291a6f181db38c0be4dd1f44b338168",
        "mode": 420,
        "mtime_ns": 1788734426697957572
      },
      "Weights.swift.o": {
        "kind": "file",
        "sha256": "60b6cfd468e07655bb64f0dbd231e1d0a42debfd8c516ae6461e470c887a564d",
        "mode": 420,
        "mtime_ns": 1788725685319182752
      },
      "WordSlotWrite.swift.o": {
        "kind": "file",
        "sha256": "4792419e14d94e4efa012d754befd2137b75498f0ba603d04b4a91ff07ed3fc3",
        "mode": 420,
        "mtime_ns": 1788686548604766423
      },
      "include": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "Slotstream-Swift.h": {
            "kind": "file",
            "sha256": "ba29eec1d516d24771bcf239ec40cc7bafa2dcbf4701ab313a0e5056067f64d8",
            "mode": 420,
            "mtime_ns": 1788686549261368590
          },
          "module.modulemap": {
            "kind": "file",
            "sha256": "f90534381190fa925a954e41b66ccb96420419dc4f24b98fe9a669207b7790ee",
            "mode": 420,
            "mtime_ns": 1788373501895843647
          }
        }
      },
      "main.swift.o": {
        "kind": "file",
        "sha256": "23bff8df548faf6bbdacb65880642fd8d80fe1d91df8affa6dfb162519a73464",
        "mode": 420,
        "mtime_ns": 1788370077966196727
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "f71debf245f64c4b2ad3ce3b29f9011d0533cdb361f1df4b488f6f7d4d472d2d",
        "mode": 420,
        "mtime_ns": 1788725658112134194
      },
      "slotstream.dia": {
        "kind": "file",
        "sha256": "2813971c253938e57c47004d71883225263765eaee19f51c8d1918655a5b1a18",
        "mode": 420,
        "mtime_ns": 1788740524331183803
      },
      "sources": {
        "kind": "file",
        "sha256": "d314fc2876cf2ddd5b2f7fa036d70085f26ee255f03e6ad1b70e3e61c2126927",
        "mode": 420,
        "mtime_ns": 1788720324334893541
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream.dSYM": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "Contents": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "Info.plist": {
            "kind": "file",
            "sha256": "ec97d96b319dbc1aa6f66fe997754e19d73784975e3b01ad222543851955a099",
            "mode": 420,
            "mtime_ns": 1788740524713564077
          },
          "Resources": {
            "kind": "directory",
            "mode": 493,
            "entries": {
              "DWARF": {
                "kind": "directory",
                "mode": 493,
                "entries": {
                  "slotstream": {
                    "kind": "file",
                    "sha256": "286edb18b1205850484e2234ac8f9fbd9655ed128028a633bffa116d8212409e",
                    "mode": 420,
                    "mtime_ns": 1788740527989191957
                  }
                }
              },
              "Relocations": {
                "kind": "directory",
                "mode": 493,
                "entries": {
                  "aarch64": {
                    "kind": "directory",
                    "mode": 493,
                    "entries": {
                      "slotstream.yml": {
                        "kind": "file",
                        "sha256": "d0f54c57462926c6b6fea145c4638eadb2c160d6be8d3cfa356cfc925c7e6882",
                        "mode": 420,
                        "mtime_ns": 1788740527924927353
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream.product": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "Objects.LinkFileList": {
        "kind": "file",
        "sha256": "4532f43b1fade6922864e6b6c96a9a082991a8cfcbcddcaeac039493fb3d212c",
        "mode": 420,
        "mtime_ns": 1788726845447326296
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstreamPackageTests.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "include": {
        "kind": "directory",
        "mode": 493,
        "entries": {
          "module.modulemap": {
            "kind": "file",
            "sha256": "bf967253bb0027da28a49a61d85f79808cef9095f5c4f5b255ab49f1cc563c35",
            "mode": 420,
            "mtime_ns": 1787923541546260595
          }
        }
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "e8ed384e7fc9e9123c39265c94bea45044b1b75afba6b04eddf6cf3e606bad95",
        "mode": 420,
        "mtime_ns": 1787923628859552948
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream_checks.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "main.swift.o": {
        "kind": "file",
        "sha256": "ebfb25a616c77def5aa6ff7ef7c35213a6af37d374c005382e5e5fc091eb7055",
        "mode": 420,
        "mtime_ns": 1788644236181023263
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "39e768e690734b63e90deea039a6eb43bbab23e7772a4e7bc66c73f13a309857",
        "mode": 420,
        "mtime_ns": 1788725658107030129
      },
      "slotstream_checks.d": {
        "kind": "file",
        "sha256": "fb46a7f170fd574ffeece443b93148296c14db03887751e2c73a960810338c9c",
        "mode": 420,
        "mtime_ns": 1788713420598738542
      },
      "slotstream_checks.dia": {
        "kind": "file",
        "sha256": "2c72d5afff8cce441f2f8299a18215b0bf79605aa7eb05839e38f7949b46c0e2",
        "mode": 420,
        "mtime_ns": 1788713420600064130
      },
      "sources": {
        "kind": "file",
        "sha256": "9ad827771ec1f6e2f652915b9ae1af3fdce0a5ead2df4e14f31affc92b6e7b46",
        "mode": 420,
        "mtime_ns": 1788373503378395729
      }
    }
  },
  ".build/arm64-apple-macosx/release/slotstream_cli.build": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "CheckRendering.swift.o": {
        "kind": "file",
        "sha256": "4bdb1de83e7d417c84cf27164ef4c5ff299f27e2494332509389728f5bdc2d04",
        "mode": 420,
        "mtime_ns": 1788740016298211345
      },
      "ContextCommands.swift.o": {
        "kind": "file",
        "sha256": "b8619079a8ed774679a69ebb78ff3ae1658635ced10b7bc6adfb71562a0754de",
        "mode": 420,
        "mtime_ns": 1788677283003731793
      },
      "MTPCommands.swift.o": {
        "kind": "file",
        "sha256": "642a37c4d34f929f92b780dda76969d183c3f952d8e43ace5324395032afc779",
        "mode": 420,
        "mtime_ns": 1788730868573550317
      },
      "OptimizationCommands.swift.o": {
        "kind": "file",
        "sha256": "78c7b7ff9fdaad25028ff2b0b2c5f4fb81804de0d10915c7a86b15908c9e4f33",
        "mode": 420,
        "mtime_ns": 1788730868959543272
      },
      "PackedExpertCommands.swift.o": {
        "kind": "file",
        "sha256": "f20b0cf618f7ea872d56190ad2b1492f1db983999ff64b2fc52d1a263a5668af",
        "mode": 420,
        "mtime_ns": 1788734483349116334
      },
      "Pull.swift.o": {
        "kind": "file",
        "sha256": "67f545af99652d8b5524fdbd77fce7c4ecf31db1759ce8521552e0d64d133182",
        "mode": 420,
        "mtime_ns": 1788730868365102665
      },
      "SweepCommands.swift.o": {
        "kind": "file",
        "sha256": "8e9f1892b36203820aae91c1da28d275df196ef708c902385f0950051f51fb76",
        "mode": 420,
        "mtime_ns": 1788676248256296734
      },
      "VisionCommands.swift.o": {
        "kind": "file",
        "sha256": "208477187fa79c81729941e235793dc969960e99652a8dbc3468c78111098577",
        "mode": 420,
        "mtime_ns": 1788730868382408702
      },
      "main.swift.o": {
        "kind": "file",
        "sha256": "21809b35ecddfab0680353ebe9269871bd4bc00b63d1515cd9b1e6f3b4ab6dc9",
        "mode": 420,
        "mtime_ns": 1788726844504588485
      },
      "output-file-map.json": {
        "kind": "file",
        "sha256": "0054ad79807bfdb74b187ed2414671991e9756863ccd18440bb17229326a37a6",
        "mode": 420,
        "mtime_ns": 1788725658107735787
      },
      "slotstream_cli.d": {
        "kind": "file",
        "sha256": "b3f0a1a2e55348505a58c9e0943c332f37ec1ec24c1ea26b7b7ddc7bb828837a",
        "mode": 420,
        "mtime_ns": 1788740016310254359
      },
      "slotstream_cli.dia": {
        "kind": "file",
        "sha256": "2c72d5afff8cce441f2f8299a18215b0bf79605aa7eb05839e38f7949b46c0e2",
        "mode": 420,
        "mtime_ns": 1788740016310663409
      },
      "sources": {
        "kind": "file",
        "sha256": "7196a0d2dbb32d0ff7b1034a6be1e0efece366f76cc4b063f41ae409c06de1be",
        "mode": 420,
        "mtime_ns": 1788635821856496807
      }
    }
  },
  ".build/arm64-apple-macosx/release/Modules": {
    "kind": "directory",
    "mode": 493,
    "entries": {
      "ArgumentParser.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713339008921925
      },
      "ArgumentParser.swiftdoc": {
        "kind": "file",
        "sha256": "144e88fcbe152cf9ee51975fe0187bb8da8a7074fdb1880a0f233d72ff1e10b4",
        "mode": 420,
        "mtime_ns": 1787923587397310425
      },
      "ArgumentParser.swiftmodule": {
        "kind": "file",
        "sha256": "02261148cd3b40bcbc43876964aaafcc99d3980d521db00ba07f40b85d0ccdef",
        "mode": 420,
        "mtime_ns": 1787923587392399880
      },
      "ArgumentParser.swiftsourceinfo": {
        "kind": "file",
        "sha256": "5ab310e0f7f8d566bfe48ea62bae101b4f9931c33ff0f7f7393ba3a2852ff18b",
        "mode": 420,
        "mtime_ns": 1787923587398706801
      },
      "ArgumentParserToolInfo.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713334697194013
      },
      "ArgumentParserToolInfo.swiftdoc": {
        "kind": "file",
        "sha256": "f1c44c0b14d76bdd1c5df9d3ad80dc7895510fd99153c176af5e856192145e3a",
        "mode": 420,
        "mtime_ns": 1787923583657589785
      },
      "ArgumentParserToolInfo.swiftmodule": {
        "kind": "file",
        "sha256": "827382ef4c741ed9db4fb888606d5ac67e0ad8619a05e714a8a9e1ed1345c13f",
        "mode": 420,
        "mtime_ns": 1787923583656904242
      },
      "ArgumentParserToolInfo.swiftsourceinfo": {
        "kind": "file",
        "sha256": "1d14301fc5b61f4f4d165bc5a7c42b12565a4599e828dcdc78328f4fbae7666c",
        "mode": 420,
        "mtime_ns": 1787923583658055201
      },
      "ComplexModule.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713325632786861
      },
      "ComplexModule.swiftdoc": {
        "kind": "file",
        "sha256": "f480fce8aaafc7b219761b8429804afc4d4b6832127441d1222a918d9aa8b9d3",
        "mode": 420,
        "mtime_ns": 1787923569184723233
      },
      "ComplexModule.swiftmodule": {
        "kind": "file",
        "sha256": "f4f78bc6fa741850deaf7da3f213909ae6ba0ad63404a8271344497db0af2a61",
        "mode": 420,
        "mtime_ns": 1787923569183927816
      },
      "ComplexModule.swiftsourceinfo": {
        "kind": "file",
        "sha256": "98370d4b521007678486e1dae1803d6042bc09372a758c49470923a75594548c",
        "mode": 420,
        "mtime_ns": 1787923569185486067
      },
      "Crypto.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713325340706990
      },
      "Crypto.swiftdoc": {
        "kind": "file",
        "sha256": "367d7878463e6a4178db567641645f0916fb49c8b45aed6ad85510846d7352fa",
        "mode": 420,
        "mtime_ns": 1787923570316503324
      },
      "Crypto.swiftmodule": {
        "kind": "file",
        "sha256": "212a54db64116816692a6257173fcadec41cfd4d450aa6962b548c512fe01d1f",
        "mode": 420,
        "mtime_ns": 1787923570316065657
      },
      "Crypto.swiftsourceinfo": {
        "kind": "file",
        "sha256": "f6589036f4889a0550e5caecc3f53be4ca35c533e797f269d19e3d7b62974879",
        "mode": 420,
        "mtime_ns": 1787923570317163782
      },
      "EventSource.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713325280824510
      },
      "EventSource.swiftdoc": {
        "kind": "file",
        "sha256": "6070f1b7fbff1c0f3ce725e761dc28e0fc93d68527ba52eb2c8a080750fb7926",
        "mode": 420,
        "mtime_ns": 1787923570328728124
      },
      "EventSource.swiftmodule": {
        "kind": "file",
        "sha256": "1fa7c89ed0de92921425fc357694d862f3a4f47b774e4cee1b6a7f13e4039d9e",
        "mode": 420,
        "mtime_ns": 1787923570328036624
      },
      "EventSource.swiftsourceinfo": {
        "kind": "file",
        "sha256": "920782b62b255c36f280b700bfbf24fe1950bd8edc47b1a06691008a86c22f6f",
        "mode": 420,
        "mtime_ns": 1787923570329360791
      },
      "Generation.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713342442310382
      },
      "Generation.swiftdoc": {
        "kind": "file",
        "sha256": "66348d63a2438d33505ffa747ad78bd283393650b8cf05594c97602e3e5ab547",
        "mode": 420,
        "mtime_ns": 1787923604179493440
      },
      "Generation.swiftmodule": {
        "kind": "file",
        "sha256": "465ea8c11db594719fd02c5fa273d676fd9676a4216b75b01efac3a3f19e1ca8",
        "mode": 420,
        "mtime_ns": 1787923604178895190
      },
      "Generation.swiftsourceinfo": {
        "kind": "file",
        "sha256": "7e01f97138fe0e75bb0395b0dfde6d366be33175160066e2f07a1e464a945108",
        "mode": 420,
        "mtime_ns": 1787923604179802274
      },
      "Hub.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713336017676203
      },
      "Hub.swiftdoc": {
        "kind": "file",
        "sha256": "c45a1a293fc2d7cfcc7c16f50710412f3d114a9a563db3d37c4d55fc86d83995",
        "mode": 420,
        "mtime_ns": 1787923598103879151
      },
      "Hub.swiftmodule": {
        "kind": "file",
        "sha256": "0a21f39fbe04771a40cca4f0f399f714ceb0e2f41cba5316f68912e4ecfd7b76",
        "mode": 420,
        "mtime_ns": 1787923598102750400
      },
      "Hub.swiftsourceinfo": {
        "kind": "file",
        "sha256": "bc86213a8bd9c38e8735e12dba14dabc0d73939608ca5dea93f7d0e0202fc10d",
        "mode": 420,
        "mtime_ns": 1787923598104887985
      },
      "HuggingFace.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713328793554949
      },
      "HuggingFace.swiftdoc": {
        "kind": "file",
        "sha256": "71e76d3e453778d5fbd85e94006b0e0a386aa3a3e82ae052c4ebaa9757611bbc",
        "mode": 420,
        "mtime_ns": 1787923588751897715
      },
      "HuggingFace.swiftmodule": {
        "kind": "file",
        "sha256": "168f3a13d55eba8c5c3577f7a37d2641f979d78bca9f6784c41e5a2db8643619",
        "mode": 420,
        "mtime_ns": 1787923588745953960
      },
      "HuggingFace.swiftsourceinfo": {
        "kind": "file",
        "sha256": "f5aa9cb2ef4e926b2d0cb8c18a260ff899b71728a032243983b47994f92a3c7a",
        "mode": 420,
        "mtime_ns": 1787923588754516300
      },
      "InternalCollectionsUtilities.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713325012904981
      },
      "InternalCollectionsUtilities.swiftdoc": {
        "kind": "file",
        "sha256": "ac6d0b8b0cd045463b33358c83dc873e175491a0745f885a71cdedf5e097c3a4",
        "mode": 420,
        "mtime_ns": 1787923568991775888
      },
      "InternalCollectionsUtilities.swiftmodule": {
        "kind": "file",
        "sha256": "08e3aadcd93f732522f6dcc13ad4a51b9bef201e425f7f1e3ec68d695edef27a",
        "mode": 420,
        "mtime_ns": 1787923568990866221
      },
      "InternalCollectionsUtilities.swiftsourceinfo": {
        "kind": "file",
        "sha256": "eb26cba2a7e8c2eec6dd6b50cc58aa536569ea3def87b05883c23fa72a67c5f2",
        "mode": 420,
        "mtime_ns": 1787923568992922098
      },
      "Jinja.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713329354428809
      },
      "Jinja.swiftdoc": {
        "kind": "file",
        "sha256": "6de6058f9c10d5ceef42524723c2eda4c23b4b6e26718c744bcdc2d8b0292d93",
        "mode": 420,
        "mtime_ns": 1787923577385218189
      },
      "Jinja.swiftmodule": {
        "kind": "file",
        "sha256": "b658dccdd233707df341622b308d7acccad8b706a462c4251c9b25267bfe9e3f",
        "mode": 420,
        "mtime_ns": 1787923577382817479
      },
      "Jinja.swiftsourceinfo": {
        "kind": "file",
        "sha256": "af497f479f53fe53883e7f76d963880bb508beb78b2dd5b1af972ffca585b2ab",
        "mode": 420,
        "mtime_ns": 1787923577386328232
      },
      "MLX.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713335615640660
      },
      "MLX.swiftdoc": {
        "kind": "file",
        "sha256": "de81c5cfb9266c73ccf6ab7cb9a6233f7c3b7fe81cb4ee117ceacb7545b79a36",
        "mode": 420,
        "mtime_ns": 1787923610958200101
      },
      "MLX.swiftmodule": {
        "kind": "file",
        "sha256": "07ffbc362911aa40f89a820dd526cdf3c1c27764f6fcfab035b71aeb08d31984",
        "mode": 420,
        "mtime_ns": 1787923610949157470
      },
      "MLX.swiftsourceinfo": {
        "kind": "file",
        "sha256": "dab97a1cd828d911bee85fc310cd3f025badc483d6c533e3a912a5bd71b66d2e",
        "mode": 420,
        "mtime_ns": 1787923610961136603
      },
      "MLXFast.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713342062726260
      },
      "MLXFast.swiftdoc": {
        "kind": "file",
        "sha256": "820743b3e78da1868c65736ee4fbb4ca3b18cf27db191e4060088f04f2f58054",
        "mode": 420,
        "mtime_ns": 1787923614180083126
      },
      "MLXFast.swiftmodule": {
        "kind": "file",
        "sha256": "70aca148a5080155b805da0af82b6b3df8682f01e45c46c2fef0fc7a1b7dc3e3",
        "mode": 420,
        "mtime_ns": 1787923614179772834
      },
      "MLXFast.swiftsourceinfo": {
        "kind": "file",
        "sha256": "1553f88d1297a79338d1f2859b1fd1bf09d2946a1bc0e37b09384538a573ba73",
        "mode": 420,
        "mtime_ns": 1787923614180242126
      },
      "MLXNN.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713343679962793
      },
      "MLXNN.swiftdoc": {
        "kind": "file",
        "sha256": "ed381c8cb0e710ae1f385885d1199dbbf0bb0e17ffa856cf43ca641a12ed74c0",
        "mode": 420,
        "mtime_ns": 1787923616070611252
      },
      "MLXNN.swiftmodule": {
        "kind": "file",
        "sha256": "50e28e685d2f4ab6e3835ba56b5e7683c30abdebcbf89e4fe97e0ce8817a29ae",
        "mode": 420,
        "mtime_ns": 1787923616068140125
      },
      "MLXNN.swiftsourceinfo": {
        "kind": "file",
        "sha256": "eab804361a14917b6474163987bb08079c01dca7a2fcd5015877c9b4c1ff3b4d",
        "mode": 420,
        "mtime_ns": 1787923616071724711
      },
      "Models.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713342996912717
      },
      "Models.swiftdoc": {
        "kind": "file",
        "sha256": "136658efa999d6afa8cfbfb921b52afb5c2d8ba45d4c8f6c3c336b227d8a96ad",
        "mode": 420,
        "mtime_ns": 1787923604773442734
      },
      "Models.swiftmodule": {
        "kind": "file",
        "sha256": "9e2adbd67d0bff3b2858aa55e8883a8762b3e37d287f4a74e0b0a3719dfb6fc5",
        "mode": 420,
        "mtime_ns": 1787923604772890484
      },
      "Models.swiftsourceinfo": {
        "kind": "file",
        "sha256": "16b804cc58591bebe064beabdba275d64f9003575a4857e67b84684ae7a75f47",
        "mode": 420,
        "mtime_ns": 1787923604773768276
      },
      "Numerics.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713326828195074
      },
      "Numerics.swiftdoc": {
        "kind": "file",
        "sha256": "1e39648dfc42ae139964892c970861c2b4e6b218e5141a19ed22a662a6f10eee",
        "mode": 420,
        "mtime_ns": 1787923569559305789
      },
      "Numerics.swiftmodule": {
        "kind": "file",
        "sha256": "b855c0df442fd2baf4f82dd412ca1a844f8536c3069ebf72d8d2628c38c5d2b1",
        "mode": 420,
        "mtime_ns": 1787923569559048372
      },
      "Numerics.swiftsourceinfo": {
        "kind": "file",
        "sha256": "c53e414f7e5e90273e17bcecb07e2af2c03c5a438326c38b5f925d2cdeb443cc",
        "mode": 420,
        "mtime_ns": 1787923569559462081
      },
      "OrderedCollections.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713326195290145
      },
      "OrderedCollections.swiftdoc": {
        "kind": "file",
        "sha256": "1e82ea5e833705731708e6e35a8ad730d02252ff02d5dd16360c1e3428e97eba",
        "mode": 420,
        "mtime_ns": 1787923570572118379
      },
      "OrderedCollections.swiftmodule": {
        "kind": "file",
        "sha256": "a3de45fe0b3215f0c9e48aa29b1727a59bb16192bcfdfa19f580c4f9c1fda325",
        "mode": 420,
        "mtime_ns": 1787923570562004455
      },
      "OrderedCollections.swiftsourceinfo": {
        "kind": "file",
        "sha256": "2e254f97e6c3a8e737666a0ecd5680750e50a95a8c3f125cca5932c40934a79c",
        "mode": 420,
        "mtime_ns": 1787923570576765424
      },
      "RealModule.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713324857261967
      },
      "RealModule.swiftdoc": {
        "kind": "file",
        "sha256": "ea7c9c9cf13a841663ba32e95fa34310acd027a39bdf6fd04233f9720b18ceba",
        "mode": 420,
        "mtime_ns": 1787923568702432434
      },
      "RealModule.swiftmodule": {
        "kind": "file",
        "sha256": "7674a92e29d5d93f24a30891fe17ea92eb2ef3eb20008c7aef67bcf563f1b8f7",
        "mode": 420,
        "mtime_ns": 1787923568701264475
      },
      "RealModule.swiftsourceinfo": {
        "kind": "file",
        "sha256": "fb2d36b0826727338b258611572be49ee2cbba82c8000afac04b3d65ee0a833b",
        "mode": 420,
        "mtime_ns": 1787923568703065684
      },
      "Slotstream.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788740510596594816
      },
      "Slotstream.swiftdoc": {
        "kind": "file",
        "sha256": "888d68947cb8937df092ba3a74c9eeeb63bbe73af2d016899089ee9b32723a5c",
        "mode": 420,
        "mtime_ns": 1788730796105691718
      },
      "Slotstream.swiftmodule": {
        "kind": "file",
        "sha256": "00b28ed7c600dc566e0c5568b7c0aa756a517165cc11bd1e3e305cf16c7efd77",
        "mode": 420,
        "mtime_ns": 1788734413550907955
      },
      "Slotstream.swiftsourceinfo": {
        "kind": "file",
        "sha256": "582eaf19892781b1d2bc76596f668759a7b16428d2f844d2662a6d595e3b94aa",
        "mode": 420,
        "mtime_ns": 1788740510596187058
      },
      "SlotstreamDiagnostics.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788739971709572948
      },
      "SlotstreamDiagnostics.swiftdoc": {
        "kind": "file",
        "sha256": "d3f882164d8777320efeae786a53f15e67bc30390b576b92cffed96d2916df47",
        "mode": 420,
        "mtime_ns": 1788726801717069892
      },
      "SlotstreamDiagnostics.swiftmodule": {
        "kind": "file",
        "sha256": "8f1fcce70467654c2202b13f8e8e5c1e1c2de5cc0527638ecca2bf8082cf9750",
        "mode": 420,
        "mtime_ns": 1788734439809122178
      },
      "SlotstreamDiagnostics.swiftsourceinfo": {
        "kind": "file",
        "sha256": "58b2907be5358f8df1252d77d1fb2a62be3b8e613f93a2d71ca518deb13220b1",
        "mode": 420,
        "mtime_ns": 1788739971709055937
      },
      "SlotstreamTestKit.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788734478461651375
      },
      "SlotstreamTestKit.swiftdoc": {
        "kind": "file",
        "sha256": "441e88a14982f7d5d0ebdd9bfeb1128e6630838638fcfb4fbeeb7cd57d796baf",
        "mode": 420,
        "mtime_ns": 1788373595030270438
      },
      "SlotstreamTestKit.swiftmodule": {
        "kind": "file",
        "sha256": "26de8b2361186fba3cab77a801067e3053983aa3282967420553993237e71ea0",
        "mode": 420,
        "mtime_ns": 1788646384422758356
      },
      "SlotstreamTestKit.swiftsourceinfo": {
        "kind": "file",
        "sha256": "0b5df08e736e89ad83ff91e48ae8f2eef692c06611cfbfb349cf5c2f302a8a6e",
        "mode": 420,
        "mtime_ns": 1788720404269123256
      },
      "Tokenizers.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713339781118886
      },
      "Tokenizers.swiftdoc": {
        "kind": "file",
        "sha256": "e05101aca491e0a17c9e5f75676fdc016be329ff0e729722f9fb2ff9e3960480",
        "mode": 420,
        "mtime_ns": 1787923600981824391
      },
      "Tokenizers.swiftmodule": {
        "kind": "file",
        "sha256": "1f0ef6a89afc139edb1252fa4c190d9b203ba40138ae4164de0b12150aa5a860",
        "mode": 420,
        "mtime_ns": 1787923600976215929
      },
      "Tokenizers.swiftsourceinfo": {
        "kind": "file",
        "sha256": "0aa225cf5513a6a3c4aa9191b424f2e6b6845c51513ca3013845abedee506fc4",
        "mode": 420,
        "mtime_ns": 1787923600982287391
      },
      "slotstream_checks.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788713420380654207
      },
      "slotstream_checks.swiftdoc": {
        "kind": "file",
        "sha256": "1cd8fb2fbc74042bfbeed001920ca40bc5f3e7d795752992d07cd9ffed3c2950",
        "mode": 420,
        "mtime_ns": 1788373595835784445
      },
      "slotstream_checks.swiftmodule": {
        "kind": "file",
        "sha256": "127356100aebad0f634eb55a5b4ab2ffa98f0f413e080dd6036f585fd22049a5",
        "mode": 420,
        "mtime_ns": 1788660174472898701
      },
      "slotstream_checks.swiftsourceinfo": {
        "kind": "file",
        "sha256": "10662c8758172e0edc3df0bb94aef8b2167300ca79d55a10e6dc7f12a14e3180",
        "mode": 420,
        "mtime_ns": 1788373595836004072
      },
      "slotstream_cli.abi.json": {
        "kind": "file",
        "sha256": "4277ac6b49f8511196028a5ac20f5b1b1dfa754c24615d34068089f0b1739728",
        "mode": 420,
        "mtime_ns": 1788740012314223594
      },
      "slotstream_cli.swiftdoc": {
        "kind": "file",
        "sha256": "7cd5b40de4c62c457729a49682dcc6e935823da2ab519749da778a306e71c516",
        "mode": 420,
        "mtime_ns": 1788373954482997691
      },
      "slotstream_cli.swiftmodule": {
        "kind": "file",
        "sha256": "0cfcaf2038828da10fb3a3a13ab2c4ff1a47b066144b80cf49ecac663a14474e",
        "mode": 420,
        "mtime_ns": 1788740012312719645
      },
      "slotstream_cli.swiftsourceinfo": {
        "kind": "file",
        "sha256": "06bf6d6a64f8fec0d5150422a5bcd41686e469de00db21a2668d206bd42c5d0c",
        "mode": 420,
        "mtime_ns": 1788740012313768376
      }
    }
  },
  ".build/build.db": {
    "kind": "file",
    "sha256": "f99847c599855d12efb0b70eab29eb3fbd25654176a1bb4013e55e6563aaea06",
    "mode": 420,
    "mtime_ns": 1788740528003798403
  },
  ".build/build.db-wal": {
    "kind": "absent"
  },
  ".build/build.db-shm": {
    "kind": "absent"
  },
  ".build/release.yaml": {
    "kind": "file",
    "sha256": "978961ab92a5208302ffaa4d851972372d6605b35fdcc585790409ac71aae80e",
    "mode": 420,
    "mtime_ns": 1788725658534979131
  },
  ".build/workspace-state.json": {
    "kind": "file",
    "sha256": "acded02f82a40ef97a87bd142a9ad99e836d0d1300f30b7ab95d0b94c6dbe773",
    "mode": 420,
    "mtime_ns": 1787923537885021510
  },
  ".build/arm64-apple-macosx/release/description.json": {
    "kind": "file",
    "sha256": "e5fbae6828a63e6555094ada433600dc3fc8df3ab6c338a946e7cecd2542342e",
    "mode": 420,
    "mtime_ns": 1788725658548377181
  }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/lease-result.json

SHA-256 `750b380662f2cb25a30429bcd29eb2523c7f453c2db4c7183b7537e73d3dd47e`; 6753 bytes.

````text
{
  "classification": "temporary cached build lease; no model or performance result",
  "started_at": "2026-09-07T07:48:39.571645+00:00",
  "protocol_sha256": "1d2e398e6f2615168360e0408de0c517423747d432f46eb1e22c30ddb018dd42",
  "passed": true,
  "restored": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 14242938880,
    "swapins": 44112839,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   254377.\nPages active:                                 657779.\nPages inactive:                               766428.\nPages speculative:                            236304.\nPages throttled:                                   0.\nPages wired down:                             275999.\nPages purgeable:                               15226.\n\"Translation faults\":                    15444411047.\nPages copy-on-write:                       737122845.\nPages zero filled:                       21236297929.\nPages reactivated:                        3471598452.\nPages purged:                               72277377.\nFile-backed pages:                            599717.\nAnonymous pages:                             1060794.\nPages stored in compressor:                  2092518.\nPages occupied by compressor:                 893981.\nDecompressions:                           1172529957.\nCompressions:                             1487781276.\nPageins:                                  7622534756.\nPageouts:                                   11084510.\nSwapins:                                    44112839.\nSwapouts:                                   77525566.\nPages tagged:                                 183483.\nPages tagged resident:                        134915.\nPages tagged compressed:                       48568.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8477.\nPages tag-storage free:                         1020.\nPages tag-storage non-tag pageable:            88216.\nPages tag-storage non-tag wired:                 591.\nBytes of compressed tags:                    7214464.\nTagged compressions:                        11282230.\nTagged decompressions:                      10401628.\n"
  },
  "before_pressure": {
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
  "release_symlink_before": {
    "kind": "symlink",
    "target": "arm64-apple-macosx/release",
    "mode": 493
  },
  "source_applied": true,
  "build_passed": true,
  "before_restoration": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12541345792,
    "swapins": 44112847,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   155226.\nPages active:                                 906514.\nPages inactive:                               856689.\nPages speculative:                             97434.\nPages throttled:                                   0.\nPages wired down:                             282434.\nPages purgeable:                               15816.\n\"Translation faults\":                    15452266630.\nPages copy-on-write:                       737791817.\nPages zero filled:                       21240427605.\nPages reactivated:                        3471601089.\nPages purged:                               72284437.\nFile-backed pages:                            594421.\nAnonymous pages:                             1266216.\nPages stored in compressor:                  1909525.\nPages occupied by compressor:                 785967.\nDecompressions:                           1172711298.\nCompressions:                             1487781276.\nPageins:                                  7622751560.\nPageouts:                                   11084606.\nSwapins:                                    44112847.\nSwapouts:                                   77525566.\nPages tagged:                                 186624.\nPages tagged resident:                        139158.\nPages tagged compressed:                       47466.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8477.\nPages tag-storage free:                         1430.\nPages tag-storage non-tag pageable:            87806.\nPages tag-storage non-tag wired:                 591.\nBytes of compressed tags:                    6977152.\nTagged compressions:                        11282230.\nTagged decompressions:                      10402730.\n"
  },
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 12541460480,
    "swapins": 44112847,
    "swapouts": 77525566,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   143570.\nPages active:                                 902409.\nPages inactive:                               894285.\nPages speculative:                             75713.\nPages throttled:                                   0.\nPages wired down:                             282423.\nPages purgeable:                               13768.\n\"Translation faults\":                    15452284851.\nPages copy-on-write:                       737794774.\nPages zero filled:                       21240433132.\nPages reactivated:                        3471601089.\nPages purged:                               72284437.\nFile-backed pages:                            608132.\nAnonymous pages:                             1264275.\nPages stored in compressor:                  1909415.\nPages occupied by compressor:                 785917.\nDecompressions:                           1172711408.\nCompressions:                             1487781276.\nPageins:                                  7622790870.\nPageouts:                                   11084606.\nSwapins:                                    44112847.\nSwapouts:                                   77525566.\nPages tagged:                                 186606.\nPages tagged resident:                        139140.\nPages tagged compressed:                       47466.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8477.\nPages tag-storage free:                         1367.\nPages tag-storage non-tag pageable:            87869.\nPages tag-storage non-tag wired:                 591.\nBytes of compressed tags:                    6977152.\nTagged compressions:                        11282230.\nTagged decompressions:                      10402730.\n"
  },
  "elapsed_seconds": 250.176908666
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/protocol.json

SHA-256 `1d2e398e6f2615168360e0408de0c517423747d432f46eb1e22c30ddb018dd42`; 21629 bytes.

````text
{
  "classification": "Exact current runtime device-observer extraction plus unchanged V255 combined defaults and planner family. Temporary shared cached build lease; no deployment activation.",
  "frozen_at": "2026-09-07T05:41:23.922977+00:00",
  "drivers": {
    "build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "optimization_serial_build.py": "f33cba39a2a427b76353c57075128a9278a7cb3f22d3f086d7be8c25179bf6cf",
    "optimization_readiness.py": "ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc",
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
    "Sources/Slotstream/Optimizations.swift": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "d12a1d66c39d62cc773ba81ce1bf8ba88b82b096ad2f060398a39acfcf65b63c",
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
  "wrapper_sha256": "22827406c4f057aafde091183e7a624068c0a2ed61c3014f0442fd6fa3fce665",
  "maximum_whole_interval_seconds": 1220,
  "changes": "Exact V208 unchanged planner3 + exact V199 selected default4. No optional control additions, context cap change, recalibration, memory credit, or new kernels.",
  "review": "Model-free candidate preparation may run before unrelated optional studies; this does not settle their disposition or waive same-final-build API/native/resource/final8/soak/install acceptance. V253 was never launched; the later actual API gate must use the corrected V254 predicate.",
  "source_lease": "Restore all seven original source contents/presence/mode/mtime, six release artifacts, release symlink, first-party build outputs and SwiftPM mutable database/metadata. Keep real model lock throughout.",
  "defaults": "CLI/Engine environment selects the independently-qualified portable family plus current-hardware RoPE; explicit InferenceOptimizations() and complete all-off environment remain reference. Embedding rows separately on in candidate, off in restored source.",
  "consumer_prerequisite": {
    "path": "/tmp/slotstream-optimization-execution/current-source-consumer-v268/manifest.json",
    "sha256": "f0fbfe393a1e2ca27a67bbf52a19fcef8ad7e9e6bc0bdb0ba4975235030bba9b",
    "passed": true,
    "difference": "Current Makefile adds context-test target; all Swift/native/package inputs match."
  },
  "planner_proxy_prerequisite": {
    "path": "/tmp/slotstream-optimization-execution/planner-device-rebase-proxy-v270/proxy-manifest.json",
    "sha256": "3d80af4d4fe4a9ebbe550b450b8db7fe491563671ca9f3c238a2313f38cf1951",
    "passed": true
  },
  "root_before_sha256": "207290012929ed5e5e6292d51a5b1e4316ed86d1dba8d4306a3aa065368ce1ea",
  "previous_attempt": {
    "path": "/tmp/slotstream-optimization-execution/current-source-build-v271/lease-result.json",
    "sha256": "5feeb218319d23091034da6e6c5d44d28417a34ff7c5acb2ddb5cf3465198448",
    "disposition": "Preserved original live-floor build stop; fresh source-equivalent build after independently observed14.477GB reclaimable. No runtime/performance cell repeated."
  }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/run.py

SHA-256 `22827406c4f057aafde091183e7a624068c0a2ed61c3014f0442fd6fa3fce665`; 9794 bytes.

````text
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
        quarantine=path.with_name(path.name+".v273-unexpected")
        if quarantine.exists() or quarantine.is_symlink(): raise RuntimeError("release-alias quarantine already exists")
        path.rename(quarantine)
    path.symlink_to(expected['target'])
    if tree_state(path)!=expected: raise RuntimeError("release alias was not restored exactly")

def observed_memory():
    state=vm_snapshot();require_normal(pressure_snapshot());return state

def main():
    output=ROOT/".build/optimization/current-source-build-v273"
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
                pending=path.with_suffix(path.suffix+".v273-pending");shutil.copy2(after,pending);pending.replace(path)
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
                            pending=path.with_suffix(path.suffix+".v273-restore");shutil.copy2(PACKET/"source-before"/entry["path"],pending);pending.replace(path)
                    restore(state_paths,PACKET/"build-state-before",state_before)
                    restore_link(ROOT/".build/release",link_state)
                    for name,sha in original["release"].items():
                        path=ROOT/".build/release"/name;pending=path.with_name(path.name+".v273-restore")
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
            receipt.write_text(json.dumps(record,indent=2)+"\n")
    print(json.dumps({k:v for k,v in record.items() if k not in ["before","after","before_restoration"]}),flush=True)
    return 0 if record["passed"] and record["restored"] else 1

if __name__=="__main__": raise SystemExit(main())
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/source-before/Sources/Slotstream/ContextMemory.swift

SHA-256 `1219676f986d33a842fdafa4ea75bf54ed120692903d2a79ff2930550d717683`; 13753 bytes.

````text
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
        fixedBytes = 5_300_000_000
        poolBytes = ContextBytes.product(slots, 2_764_800)
        activeCapacityBytes = ContextGeometry.sequenceBytes(tokens: context, mtp: mtp)
        additionalActiveBytes = ContextGeometry.additionalActiveBytes(tokens: context, mtp: mtp)
        retainedCapacityBytes = ContextBytes.product(retentionTokens, PrefixCache.bytesPerToken)
        retainedRecurrentBytes = retentionTokens > 0
            ? (PrefixCache.maxEntries - 1) * PrefixCache.fixedBytesPerEntry : 0
        prefillBytes = ContextBytes.product(chunk, 1_300_000)
        longContextReserveBytes = Self.transientReserveBytes(context: context, mtp: mtp)
        mtpResidentBytes = mtp ? 1_600_000_000 : 0
        visionResidentBytes = visionResident ? 900_000_000 : 0
        planningMarginBytes = 1_000_000_000
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
        return ContextBytes.sum(max(ContextBytes.product(max(pass, minimumProjectionRows), 1_300_000),
            ContextBytes.product(queries, extent, ContextBytes.sum(ContextBytes.product(attentionHeads, 8), 16))), ContextBytes.product(max(0, scope - pass), 32_768))
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
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/source-before/Sources/Slotstream/Optimizations.swift

SHA-256 `3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55`; 14169 bytes.

````text
import Foundation

/// Independent controls retained while each candidate is qualified. Defaults
/// stay on the reference implementation until its acceptance gates pass.
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
    /// Greedy-only optional shortening; sampled requests retain their original
    /// verification shapes. Independent context bounds always apply.
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

    /// The next joint qualification candidate. Explicit selection only; this
    /// does not change public initializer or environment defaults. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
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

    /// Candidate for eventual automatic selection after combined acceptance.
    /// Public/environment defaults remain unchanged until that gate passes.
    /// Explicit experimental controls and diagnostics can still qualify a new
    /// platform; the kernel's initialization and shape fallbacks also apply.
    package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
        var result = integrationCandidate
        result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
        return result
    }

    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
        try resolving(environment: env, defaults: Self())
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
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/source-before/Sources/Slotstream/Plan.swift

SHA-256 `d1021e321894868c4844f2cbe4978c3ca6c6cfa958c9aa64591e9d0ec08e8ff7`; 57154 bytes.

````text
// Memory planning: turn "how much of this Mac may I use" into slot counts.
//
// One policy, used by the CLI (run/serve/doctor), printed at startup, and
// exposed over /api/show — so what the process *does* and what it *says* can
// never drift apart.

import Foundation

/// Model geometry the cache math speaks in. The planner needs these before the
/// checkpoint is opened, so they are constants — `check(against:recordBytes:)`
/// rejects a checkpoint that does not match once the engine has it.
public enum Geometry {
    public static let layers = 48
    public static let expertsPerLayer = 512
    public static let recordBytes = 2_764_800.0
    public static let totalRecords = layers * expertsPerLayer
    /// Prefill can pin up to one full layer of experts (256-token chunk × top-10
    /// covers ~all 512) plus an in-flight miss batch; below this the eviction
    /// scan has no victim. 640 global ≈ 13/layer equivalent.
    public static let floorSlots = 640

    public static func gb(_ globalSlots: Int) -> Double { Double(globalSlots) * recordBytes / 1e9 }
    public static func perLayer(_ globalSlots: Int) -> Double { Double(globalSlots) / Double(layers) }
    /// Convert a raw GB budget without ever converting an attacker-sized
    /// Double directly to Int (which traps in Swift when it is out of range).
    public static func slotsForPoolGB(_ poolGB: Double) -> Int {
        guard poolGB.isFinite else { return poolGB > 0 ? totalRecords : floorSlots }
        if poolGB >= gb(totalRecords) { return totalRecords }
        if poolGB <= gb(floorSlots) { return floorSlots }
        return Int(poolGB * 1e9 / recordBytes)
    }
    /// GB of pool per expert-per-layer (N experts/layer costs N × this).
    public static var gbPerExpertPerLayer: Double { Double(layers) * recordBytes / 1e9 }

    /// The planner sizes memory from the constants above while the engine
    /// allocates from config.json. If they ever disagree, every memory number
    /// the user is shown is wrong, so fail loudly instead of drifting.
    public static func check(against cfg: ModelConfig, recordBytes actual: Int) throws {
        guard cfg.numLayers == layers, cfg.numExperts == expertsPerLayer,
            Double(actual) == recordBytes
        else {
            throw ModelError(
                "model geometry does not match the supported checkpoint: config has "
                    + "\(cfg.numLayers) layers x \(cfg.numExperts) experts x \(actual) "
                    + "B/record, expected \(layers) x \(expertsPerLayer) x "
                    + "\(Int(recordBytes)) B — check --model")
        }
    }
}

public struct PlanError: Error, CustomStringConvertible {
    public let description: String
    public init(_ s: String) { description = s }
}

/// Explicit process controls whose unused reservations can become expert
/// capacity. Kept with the plan so vision loading and the governor cannot
/// silently restore an allocation after its budget has been spent.
public struct RuntimeAllocationPolicy: Equatable, Sendable {
    public let prefillChunkOverride: Int?
    public let prefixCacheEnabled: Bool

    public init(prefillChunkOverride: Int? = nil, prefixCacheEnabled: Bool = true) throws {
        if let chunk = prefillChunkOverride, !(256 ... 4096).contains(chunk) {
            throw PlanError("runtime allocation planning requires a prefill chunk between 256 and 4096")
        }
        self.prefillChunkOverride = prefillChunkOverride
        self.prefixCacheEnabled = prefixCacheEnabled
    }
}

/// The resolved memory decision: which knob decided it, what it costs, and
/// what to expect. Everything user-facing about memory comes from here.
public struct MemoryPlan {
    public enum Source: String {
        case expertsPerLayer = "--experts-per-layer"
        case poolGB = "--pool-gb"
        case memoryGB = "--memory-gb"
        case auto = "auto"
    }

    public let source: Source
    public let slots: Int
    /// Total-process target in GB when the plan came from --memory-gb or auto.
    public let targetGB: Double?
    public let ramGB: Double
    public let workingSetGB: Double
    /// The RAM share auto was allowed (--max-ram-percent, default 70). Carried
    /// so the elastic governor grows back to the user's policy, not the default.
    public let ramPercent: Double
    /// Memory reclaimable at planning time (nil = could not be read).
    public let availableGB: Double?
    /// True when auto sized itself down because of what other apps hold now.
    public let clamped: Bool
    /// Tokens per prefill pass, chosen with the pool from the same budget.
    public let prefillChunk: Int
    /// Conversation state the prefix cache may retain, in tokens. Sized and
    /// charged from the same budget as the pool.
    public let prefixCacheTokens: Int
    /// Whether the MTP draft head loads (self-speculative decode). Charged as
    /// a fixed resident block; the pool is sized from what remains.
    public let mtpEnabled: Bool
    /// Whether an image request may load the tower in this process.
    public let visionEnabled: Bool
    /// A loaded tower is charged inside the total-process target. Merely
    /// accepting images does not take expert capacity from text requests.
    public let visionResidentReserved: Bool
    /// True when this plan was made for a simulated device (`doctor --sim-*`).
    /// Such a plan may be printed and compared, never loaded: a simulated
    /// availability figure still produces a real allocation.
    public var simulated = false
    /// Longest prompt plus reply a request may hold (`--max-context`). State
    /// for the first `ContextPolicy.tokensInFixedFootprint` tokens is inside
    /// the fixed footprint; anything above is charged separately.
    public let maxContextTokens: Int
    public let notes: [String]
    public let runtimeAllocationPolicy: RuntimeAllocationPolicy?
    public let maxPrefillWaitMinutes: Double
    public let contextQualification: Bool

    public init(
        source: Source, slots: Int, targetGB: Double?,
        ramGB: Double, workingSetGB: Double, ramPercent: Double,
        availableGB: Double?, clamped: Bool,
        prefillChunk: Int, prefixCacheTokens: Int, mtpEnabled: Bool = false,
        visionEnabled: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        notes: [String], simulated: Bool = false,
        runtimeAllocationPolicy: RuntimeAllocationPolicy? = nil,
        maxPrefillWaitMinutes: Double = 30, contextQualification: Bool = false
    ) {
        self.source = source
        self.slots = slots
        self.targetGB = targetGB
        self.ramGB = ramGB
        self.workingSetGB = workingSetGB
        self.ramPercent = ramPercent
        self.availableGB = availableGB
        self.clamped = clamped
        self.prefillChunk = prefillChunk
        self.prefixCacheTokens = prefixCacheTokens
        self.mtpEnabled = mtpEnabled
        self.visionEnabled = visionEnabled
        self.visionResidentReserved = visionResidentReserved
        self.maxContextTokens = maxContextTokens
        self.notes = notes
        self.simulated = simulated
        self.runtimeAllocationPolicy = runtimeAllocationPolicy
        self.maxPrefillWaitMinutes = maxPrefillWaitMinutes
        self.contextQualification = contextQualification
    }

    public var expertsPerLayerCached: Double { Geometry.perLayer(slots) }
    public var poolGB: Double { Geometry.gb(slots) }
    public var memoryLedger: ContextMemoryLedger {
        ContextMemoryLedger(slots: slots, context: maxContextTokens, chunk: prefillChunk,
            retentionTokens: prefixCacheTokens, mtp: mtpEnabled, visionResident: visionResidentReserved)
    }
    public var expectedPeakGB: Double { Double(memoryLedger.expectedPeakBytes) / 1e9 }

    public func withRequestPolicy(_ configuration: ContextConfiguration) throws -> MemoryPlan {
        guard configuration.maxContextTokens == maxContextTokens else {
            throw PlanError("request policy must use the context window priced by the memory plan")
        }
        return MemoryPlan(source: source, slots: slots, targetGB: targetGB, ramGB: ramGB,
            workingSetGB: workingSetGB, ramPercent: ramPercent, availableGB: availableGB, clamped: clamped,
            prefillChunk: prefillChunk, prefixCacheTokens: prefixCacheTokens, mtpEnabled: mtpEnabled,
            visionEnabled: visionEnabled, visionResidentReserved: visionResidentReserved,
            maxContextTokens: maxContextTokens, notes: notes, simulated: simulated,
            runtimeAllocationPolicy: runtimeAllocationPolicy,
            maxPrefillWaitMinutes: configuration.maxPrefillWaitMinutes,
            contextQualification: configuration.qualification)
    }
    /// Seconds a prompt filling the whole context takes before its first
    /// token, priced through the prefill schedule this plan runs.
    public var estPrefillSecondsAtMaxContext: Double {
        PrefillSchedule.estSeconds(tokens: maxContextTokens, maxChunk: prefillChunk)
    }
    public var estWarmTokS: Double { Planner.estWarmTokS(expertsPerLayer: expertsPerLayerCached) }
    public var fullyResident: Bool { slots >= Geometry.totalRecords }

    /// The startup announce: device, decision, expectation, override hint.
    public func banner() -> String {
        var l: [String] = []
        l.append("slotstream memory plan (\(source.rawValue))")
        if let a = availableGB, a.isFinite {
            l.append(String(
                format: "  device: %.0f GB RAM (%.1f GB reclaimable now), %.1f GB Metal working set",
                ramGB, a, workingSetGB))
        } else {
            l.append(String(
                format: "  device: %.0f GB RAM, %.1f GB Metal working set", ramGB, workingSetGB))
        }
        if let t = targetGB {
            let hint = source == .auto
                ? "   (override: --memory-gb N | --max-ram-percent P)"
                : ""
            l.append(String(format: "  target: %.1f GB total for this process%@", t, hint))
        }
        if fullyResident {
            l.append(String(
                format: "  cache:  all %d experts per layer resident (%.1f GB pool)",
                Geometry.expertsPerLayer, poolGB))
        } else {
            l.append(String(
                format: "  cache:  ~%.0f of %d experts per layer  (%d global slots = %.1f GB pool)",
                expertsPerLayerCached, Geometry.expertsPerLayer, slots, poolGB))
        }
        l.append(String(
            format: "  expect: ~%.1f GB peak, ~%.0f tok/s warm decode (est. from M5 Pro anchors)",
            expectedPeakGB, estWarmTokS))
        // The decode curve is a function of experts per layer alone. It carries
        // no term for read bandwidth, and it was anchored on a 17.3 GB/s SSD
        // (MEASUREMENTS, M0.5). The first machine measured that was not the dev
        // Mac reads at 1.5 GB/s, where the misses of a single token cost more
        // time than the whole estimated step (MEASUREMENTS, C1). Until the
        // planner can measure this disk and price those reads, the estimate
        // says out loud what it assumes rather than quietly assuming it.
        l.append(
            "  disk:   that estimate assumes an SSD like the one it was measured on (17.3 GB/s). "
            + "A base-storage Mac mini M2 reads 1.5 GB/s and decoded at 1.41 tok/s against a ~4 "
            + "estimate, so on base storage expect well under the number above — see docs/HARDWARE.md")
        l.append(String(
            format: "  prefill: %d tokens per pass (~%.0f tok/s here; costs ~%.1f GB of the target)",
            prefillChunk, Planner.estPrefillTokS(chunk: prefillChunk),
            Planner.prefillCostGB(prefillChunk)))
        if mtpEnabled {
            l.append(String(
                format: "  mtp:    draft head on — speculative decode (%.1f GB resident, charged above)",
                Planner.mtpResidentGB))
        }
        if visionEnabled {
            l.append(visionResidentReserved
                ? String(format: "  vision: tower memory reserved (%.1f GB resident, charged above)", Planner.visionResidentGB)
                : String(format: "  vision: images accepted — first image reserves +%.1f GB inside the target; refused if it cannot fit", Planner.visionResidentGB))
        }
        let extra = Planner.extraContextMemoryGB(maxContextTokens: maxContextTokens)
        l.append(String(
            format: "  context: up to %d tokens per request (prompt + reply%@); a full-length prompt "
                + "takes ~%@ before its first token here, follow-up turns read only what is new",
            maxContextTokens,
            extra > 0 ? String(format: ", +%.1f GB state and transient reserve charged above", extra) : "",
            PrefillSchedule.describe(seconds: estPrefillSecondsAtMaxContext)))
        if prefixCacheTokens > 0 {
            l.append(String(
                format: "  reuse:  up to %d tokens across %d conversations (~%.1f GB), so a "
                    + "follow-up turn re-prefills only what is new",
                prefixCacheTokens, PrefixCache.maxEntries,
                Planner.prefixCacheCostGB(tokens: prefixCacheTokens)))
        }
        for n in notes { l.append("  note:   \(n)") }
        return l.joined(separator: "\n")
    }

    /// Machine-readable form for /api/show.
    public func json() -> [String: Any] {
        func tenth(_ value: Double) -> Double {
            let scaled = value * 10
            return scaled.isFinite ? scaled.rounded() / 10 : value
        }
        var d: [String: Any] = [
            "source": source.rawValue,
            "experts_per_layer_cached": Int(expertsPerLayerCached.rounded()),
            "pool_slots": slots,
            "pool_gb": tenth(poolGB),
            "expected_peak_gb": tenth(expectedPeakGB),
            "device_ram_gb": tenth(ramGB),
            "device_working_set_gb": tenth(workingSetGB),
            "max_ram_percent": ramPercent,
            "availability_clamped": clamped,
            "fully_resident": fullyResident,
            "prefill_chunk": prefillChunk,
            "prefix_cache_max_tokens": prefixCacheTokens,
            "mtp": mtpEnabled,
            "vision": visionEnabled,
            "vision_resident_reserved": visionResidentReserved,
            "vision_charged_gb": visionResidentReserved ? Planner.visionResidentGB : 0,
            "vision_resident_gb": visionEnabled ? Planner.visionResidentGB : 0,
            "max_context_tokens": maxContextTokens,
            "est_prefill_s_at_max_context": estPrefillSecondsAtMaxContext.isFinite
                ? estPrefillSecondsAtMaxContext as Any : NSNull(),
            "model_context_limit": ContextPolicy.modelLimit,
            "implementation_context_limit": ContextPolicy.implementationLimit,
            "mtp_context_limit": ContextPolicy.mtpLimit,
            "vision_context_limit": ContextPolicy.visionLimit,
            "max_prefill_wait_minutes": maxPrefillWaitMinutes,
            "prefill_wait_scope": "accepted_request_to_first_model_token",
            "context_qualification": contextQualification,
            "memory_ledger": memoryLedger.json,
            // Unrounded on purpose: the banner rounds these to whole tok/s,
            // and a caller comparing two plans across a rounding boundary sees
            // a step that is not there. Anything asserting on the plan should
            // read these, not the printed line.
            "est_warm_tok_s": estWarmTokS,
            "est_prefill_tok_s": Planner.estPrefillTokS(chunk: prefillChunk),
        ]
        if let a = availableGB, a.isFinite { d["device_available_gb"] = tenth(a) }
        if let t = targetGB { d["target_gb"] = tenth(t) }
        if let policy = runtimeAllocationPolicy {
            d["runtime_prefix_cache_enabled"] = policy.prefixCacheEnabled
            if let chunk = policy.prefillChunkOverride { d["runtime_prefill_override"] = chunk }
        }
        if !notes.isEmpty { d["notes"] = notes }
        return d
    }
}

public enum Planner {
    /// Reassign only reservations already present in a resolved plan. This
    /// preserves its existing margin, active context and resident charges;
    /// it does not infer extra headroom from a short current request.
    public static func applyingRuntimePolicy(
        _ p: MemoryPlan, policy: RuntimeAllocationPolicy
    ) throws -> MemoryPlan {
        if let previous = p.runtimeAllocationPolicy {
            guard previous == policy else { throw PlanError("runtime allocation policy requires a fresh base plan") }
            return p // Never credit the same reservation twice.
        }
        let chunk = policy.prefillChunkOverride ?? p.prefillChunk
        let prefixTokens = policy.prefixCacheEnabled ? p.prefixCacheTokens : 0
        let freed = prefillCostGB(p.prefillChunk) - prefillCostGB(chunk)
            + prefixCacheCostGB(tokens: p.prefixCacheTokens) - prefixCacheCostGB(tokens: prefixTokens)
        var slots = p.slots
        if p.targetGB != nil, freed != 0 {
            let remaining = p.poolGB + freed
            guard remaining.isFinite, remaining + 1e-9 >= Geometry.gb(Geometry.floorSlots) else {
                throw PlanError("runtime prefill reservation cannot fit above the minimum expert pool; lower the chunk or raise the memory target")
            }
            slots = Geometry.slotsForPoolGB(remaining)
        }
        return MemoryPlan(source: p.source, slots: slots, targetGB: p.targetGB,
            ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
            availableGB: p.availableGB, clamped: p.clamped, prefillChunk: chunk,
            prefixCacheTokens: prefixTokens, mtpEnabled: p.mtpEnabled,
            visionEnabled: p.visionEnabled, visionResidentReserved: p.visionResidentReserved,
            maxContextTokens: p.maxContextTokens,
            notes: p.notes + (chunk != p.prefillChunk || prefixTokens != p.prefixCacheTokens
                ? ["prefill and prefix retention reservations match the explicit runtime controls"] : []),
            simulated: p.simulated, runtimeAllocationPolicy: policy,
            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification)
    }

    /// Non-pool footprint: resident weights, the 256 MB n-gram payload plus
    /// collection overhead, Swift and MLX runtime allocations, one fixed GDN
    /// recurrent state, and a full 32k active context. Expert staging is now
    /// transferred directly into MLX in batches of at most 32 records,
    /// avoiding separate raw + Swift copies and the former multi-GB cold-fill
    /// transient.
    public static let fixedFootprintGB = 5.3
    /// Extra slack when deriving a pool from a total-memory target, so the
    /// promise ("stays under G") survives transients.
    public static let planningMarginGB = 1.0

    /// What a prefill pass costs in transient activations.
    ///
    /// **Recalibrated 2026-08-30, and the old figure was costing real speed.**
    /// The previous model charged `(chunk - 256) x 1.8 MB` because it folded
    /// two different things into one term: the pass activations, which scale
    /// with the *chunk*, and the KV plus indexer state, which scales with the
    /// *context*. Conflating them made a big pass look twice as expensive as it
    /// is, so the planner kept choosing 1024 where 2048 is strictly better.
    ///
    /// Measured directly (`--memory-gb 16`, pool pinned at 77/layer, so peak
    /// minus the 14.1 GB base is the pass): chunk 1024 -> 1.30 GB, 2048 -> 2.19,
    /// 4096 -> 4.30. That is ~1.0 to 1.3 MB per chunk token, linear from zero
    /// rather than from 256. Context state is a separate ~27.6 KB per token and
    /// is genuinely small: going from a 4,016 to an 8,016-token prompt moved
    /// peak by 0.1 GB. 1.30 MB/token is charged here so the estimate errs high
    /// at every measured point.
    public static func prefillCostGB(_ chunk: Int) -> Double {
        Double(chunk) * 1.30e-3
    }

    /// KV plus indexer state for a context of `tokens`, which the pool math
    /// does not model. Separate from the pass cost above because it scales with
    /// the conversation, not with the batch: a 32k prompt carries ~0.9 GB.
    public static func contextStateGB(_ tokens: Int) -> Double {
        Double(tokens) * Double(PrefixCache.bytesPerToken) / 1e9
    }

    /// Context state above what the fixed footprint already covers. Zero at
    /// the default window; an explicitly larger --max-context reduces the
    /// expert pool before allocation instead of consuming the safety margin.
    public static func extraContextStateGB(maxContextTokens: Int) -> Double {
        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens)) / 1e9
    }

    /// The larger window also needs transient headroom. A completed 65,520
    /// token check at chunk 512 peaked at 10.056 GB against the state-only
    /// plan's 9.260 GB (20 ms physical-footprint sampling, not just RSS).
    /// Reserve a full additional window's growth above the fixed footprint
    /// throughout the supported long-context range. This conservative envelope
    /// covers that measured gap without claiming its exact buffer attribution
    /// or interpolating unmeasured peaks. Ordinary windows retain their budget.
    /// See the Hermes measurement and its preserved failed run.
    public static func extraContextMemoryGB(maxContextTokens: Int, mtp: Bool = false) -> Double {
        Double(ContextGeometry.additionalActiveBytes(tokens: maxContextTokens, mtp: mtp)
            + ContextMemoryLedger.transientReserveBytes(context: maxContextTokens, mtp: mtp)) / 1e9
    }

    /// Sizes the prefill pass from the same budget as the pool.
    ///
    /// Prefill is expert-stream-bound: a pass touches nearly every expert of
    /// every layer, so the whole expert set is re-read roughly once per pass
    /// and halving the number of passes halves the bytes moved. Measured on a
    /// 7,960-token prompt: 40 tok/s at 256, 50 at 512, 67 at 1024, 92 to 105 at
    /// 2048 — with byte-identical output at every size.
    ///
    /// The cap is a quarter of the pool budget, raised from a fifth once the
    /// cost above was measured honestly. The deciding experiment held total
    /// memory fixed and traded pool for pass size on a 4,021-token prompt:
    ///
    /// | chunk | pool | prefill | decode | peak |
    /// |---|---|---|---|---|
    /// | 1024 | 77/layer | 65.2 s | 7.3 s | 15.4 GB |
    /// | 2048 | 67/layer | **47.9 s** | **6.6 s** | **14.9 GB** |
    /// | 4096 | 47/layer | 42.9 s | 9.0 s | 14.4 GB |
    ///
    /// 2048 dominates 1024 on every axis, so a fifth was simply too tight; 4096
    /// buys a little more prefill and gives back more decode, so it should only
    /// be reached on a machine whose pool is already past the decode plateau —
    /// which is exactly what a proportional cap does, since there pool memory
    /// is worth nothing and pass memory is worth a lot.
    /// A request this plan is tuned for: prompt tokens, then generated tokens.
    /// Only ever used to choose the prefill pass size — never correctness.
    static let tuningPromptTokens = 2000.0
    static let tuningReplyTokens = 400.0

    /// The prefill pass to run at a given pool budget: the one that finishes a
    /// representative request soonest.
    ///
    /// Pass size is a real trade, not a free choice. A bigger pass prefills
    /// faster but costs pool, and every GB it takes is expert cache the decode
    /// loop no longer has. The old rule — "biggest pass fitting in a quarter of
    /// the budget" — ignored the decode side, so crossing the quarter line
    /// doubled the pass from 2.7 to 5.3 GB and made `--memory-gb 26` plan a
    /// *smaller* cache than 25 (116 against 128 per layer) and a slower decode.
    /// Giving more memory made it slower.
    ///
    /// Scoring `prompt/prefill + reply/decode` prices both sides in the one
    /// unit that matters, seconds, and picks the trade the machine can afford:
    /// past the decode plateau a big pass is nearly free and wins, and below it
    /// the pass only grows when the prefill it buys beats the decode it costs.
    /// Swept a GB at a time from 7 to 90 GB, the estimate never gets worse as
    /// the target grows.
    public static func prefillChunkFor(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Int {
        // 8192 is not a candidate: nothing has measured it, and the prefill
        // schedule would cut it to 4096 on the first pass anyway
        // (PrefillSchedule.measuredQueryKeyProduct), so offering it only
        // charged 10.6 GB for a pass that never ran.
        let candidates = [256] + [512, 1024, 2048, 4096].filter {
            prefillCostGB($0) <= 0.25 * poolBudgetGB
        }
        func seconds(_ c: Int) -> Double {
            let pool = poolBudgetGB - prefillCostGB(c) - prefixCacheGB(poolBudgetGB: poolBudgetGB, contextCap: contextCap)
            let slots = Geometry.slotsForPoolGB(max(0, pool))
            let decode = estWarmTokS(expertsPerLayer: Geometry.perLayer(slots))
            return tuningPromptTokens / estPrefillTokS(chunk: c) + tuningReplyTokens / decode
        }
        // Ties (identical seconds) go to the larger pass: same request time,
        // more headroom on a prompt longer than the one we tuned for.
        return candidates.min { a, b in
            let (sa, sb) = (seconds(a), seconds(b))
            return sa != sb ? sa < sb : a > b
        } ?? 256
    }

    /// How many tokens of conversation state the prefix cache may retain.
    ///
    /// The held state is ~27 KiB per token, and this is a ceiling on the total
    /// across every conversation held, not per conversation.
    ///
    /// It **is** charged against the budget. The first design held one
    /// conversation and evicted on any miss, so exactly one state was ever live
    /// and peak was unchanged; that design was then measured against a real
    /// client and never hit at all — Open WebUI interleaves a title-generation
    /// request between turns and evicted the chat every time. Holding several
    /// conversations is what makes the cache work, and several held states are
    /// genuinely additive memory, so the budget pays for them. A tenth of the
    /// pool budget is the ceiling, capped by the context limit above which
    /// reuse is impossible anyway (a match needs `prompt.count > held.count`,
    /// and a prompt that long is already refused).
    public static func prefixCacheTokensFor(poolBudgetGB: Double, contextCap: Int = 32_768) -> Int {
        let gb = 0.10 * max(0, poolBudgetGB)
        let full = Double(contextCap) * Double(PrefixCache.bytesPerToken) / 1e9
        if gb >= full { return max(0, contextCap) }
        let toks = Int(gb * 1e9 / Double(PrefixCache.bytesPerToken))
        return max(0, min(toks, contextCap))
    }

    /// What that retention ceiling costs, which the plan reserves.
    public static func prefixCacheGB(poolBudgetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Double {
        prefixCacheCostGB(tokens: prefixCacheTokensFor(poolBudgetGB: poolBudgetGB, contextCap: contextCap))
    }

    /// PrefixCache evicts before a miss allocation, so no more than four
    /// states coexist: the active state already in fixedFootprintGB plus three
    /// retained states. Their fixed GDN memory is additive to KV/indexer bytes.
    public static func prefixCacheCostGB(tokens: Int) -> Double {
        guard tokens > 0 else { return 0 }
        let tokenGB = Double(tokens) * Double(PrefixCache.bytesPerToken) / 1e9
        let fixedGB = Double(PrefixCache.maxEntries - 1)
            * Double(PrefixCache.fixedBytesPerEntry) / 1e9
        return tokenGB + fixedGB
    }

    /// Prefill throughput estimate for the banner, from the anchors above.
    /// Prefill throughput estimate, from measurement plus one measured ratio.
    ///
    /// 2048 is the solid anchor: **112.9 tok/s** on an 8,016-token prompt at a
    /// 16 GB target, mean of three interleaved runs. 4096 could not be measured
    /// at *its* natural home (a 36 GB target needs ~33 GB free, which has not
    /// been available), so it is derived from a ratio measured at a matched
    /// pool of 60 experts/layer, where 4096 beat 2048 in all three paired
    /// rounds — 108.8/96.6, 92.2/76.3, 103.9/91.4, a mean 101.6 against 88.1,
    /// or 1.15x. Applied to the anchor that implies ~130; 125 is quoted so the
    /// estimate stays under the evidence rather than over it, and 8192 is not
    /// credited with any further gain because nothing has measured one.
    ///
    /// Caveat this does not model: prefill also depends on pool size, because
    /// a bigger cache means fewer expert misses per pass. The same chunk gives
    /// 88 tok/s at 60 experts/layer and 113 at 67, so treat these as typical
    /// for a machine that would *choose* that chunk, not as a pure function.
    public static func estPrefillTokS(chunk: Int) -> Double {
        // The sweep's ladder on the 8k acceptance prompt at a matched pool of
        // 60 experts per layer (MEASUREMENTS.md, "N2 — the prefill sweep"):
        // 88 / 128 / 169 / 211 / 222 tok/s from 256 to 4096, rounded down.
        // The floor's 256-token pass read 88 at 13 per layer too: below 1024
        // the pass is read-bound and the pool barely matters. Ordinary prose
        // reads about 40% slower than this prompt at every size; these are the
        // acceptance prompt's numbers, as the previous ladder's were.
        switch chunk {
        case ..<512: return 85
        case ..<1024: return 125
        case ..<2048: return 165
        case ..<4096: return 205
        default: return 220
        }
    }
    /// Smallest honest total-memory target: floor pool + footprint + margin.
    public static var minMemoryGB: Double {
        ((Geometry.gb(Geometry.floorSlots) + fixedFootprintGB + planningMarginGB) * 10)
            .rounded(.up) / 10
    }

    /// Memory reclaimable RIGHT NOW without compressing or swapping any other
    /// process's memory: free pages (the raw counter includes speculative) +
    /// purgeable + file-backed cache. Deliberately NOT `kern.memorystatus_level`
    /// (the `memory_pressure` "free percentage"): that counts other apps'
    /// compressible/swappable memory as available, and sizing a GPU pool
    /// against it is exactly how you cause the swap storm. nil if the mach
    /// call fails (then no clamp is applied).
    /// Test seam: when set, stands in for the live availability reading so the
    /// governor can be driven without putting the machine under real memory
    /// pressure. Never set in normal operation.
    ///
    /// **It does not make the resulting allocation imaginary.** The governor
    /// acts on this number, so setting it *above* what the machine has makes it
    /// allocate a pool the machine cannot hold: simulating 60 GB free on a Mac
    /// with 7 GB took a real 25 GB pool and drove tens of GB of swap. Anything
    /// using this seam must bound the value by `deviceAvailableGB()`.
    public nonisolated(unsafe) static var availabilityOverride: Double?

    /// Headroom kept between our expected peak and what is reclaimable, so
    /// claiming it doesn't leave the machine at zero.
    public static func availabilitySlackGB(ramGB: Double) -> Double {
        max(1.5, 0.05 * ramGB)
    }

    /// The share of RAM auto may target before other limits apply. Overridable
    /// per run with --max-ram-percent; it binds on small machines, where the
    /// cache is starved and every GB still buys speed.
    public static let defaultRAMPercent = 70.0

    /// Auto will not target more than this, however large the machine.
    ///
    /// This is the knee of the whole plan, not a politeness limit: 33 GB is the
    /// smallest target at which **both** numbers reach the best the
    /// measurements support — the expert cache clears the decode plateau
    /// (11.2 tok/s at 120 experts/layer, 11.6 at 150, flat after) *and* the
    /// budget still affords the 4096-token prefill pass (125 tok/s against 113
    /// at 2048). Swept a GB at a time, nothing between 34 and 84 GB improves
    /// either number.
    ///
    /// So the old 70%-of-RAM policy was right for a 48 GB Mac by luck — it
    /// landed near this knee — and wrong everywhere above: a 128 GB Mac
    /// targeted 89.6 GB to run at exactly the same estimated speed.
    ///
    /// Not a hard limit: --memory-gb N goes past it deliberately, which is how
    /// a large machine explores full residency (all 512/layer needs about
    /// 84 GB and has never been measured). The one unreproduced hint of a
    /// further decode step, 20 tok/s at 181/layer, is why that door stays open.
    public static let usefulCeilingGB = 33.0

    /// Auto policy: never target more than the cache can use, leave a share of
    /// RAM to the OS and the user's other apps, and stay 2 GB under the Metal
    /// recommended working set — whichever binds first.
    public static func autoTargetGB(
        ramGB: Double, workingSetGB: Double, ramPercent: Double = defaultRAMPercent,
        ceilingGB: Double = usefulCeilingGB
    ) -> Double {
        min(ceilingGB, (ramPercent / 100) * ramGB, workingSetGB - 2.0)
    }

    /// Warm decode estimate, re-anchored 2026-08-30 on measured points.
    ///
    /// The old curve interpolated between 30/layer = 5.6 and 181/layer = 20.0
    /// and **over-promised by 25 to 45% across the middle of its own range**,
    /// which is the part most machines actually land in. Re-measured on 0.1.6
    /// with the pool properly warmed (throughput plateaus by the second
    /// generation, so three samples is enough — verified over 14 consecutive
    /// runs):
    ///
    /// | experts/layer | measured | old estimate |
    /// |---|---|---|
    /// | 30 | 6.0 | 5.6 |
    /// | 60 | 8.2 | 9.2 |
    /// | 120 | 11.2 | 14.8 |
    /// | 150 | 11.6 | 17.3 |
    ///
    /// It is also nearly flat from 120 to 150, so the plateau starts far below
    /// the 181 the old curve assumed. The 20.0 figure at 181/layer could not be
    /// re-verified: that config peaks at 27.4 GB and the machine had 26.6 GB
    /// reclaimable, and forcing it once already drove 13 GB of swap. One run
    /// under that pressure produced a 15 to 18 band, consistent with a
    /// threshold once the working set fits, but it is not a clean measurement.
    ///
    /// So this now interpolates the verified points and **holds flat above
    /// them** rather than extrapolating to an unconfirmed number. It
    /// under-promises above 150/layer on purpose: a plan that quotes a speed
    /// the machine does not reach is worse than one that quotes less.
    /// Where the measured decode curve stops improving: 11.2 tok/s at 120
    /// experts/layer, 11.6 at 150, flat after. Both the estimate and the
    /// prefill-pass sizing key off this one number.
    public static let decodePlateauPerLayer = 150.0

    public static func estWarmTokS(expertsPerLayer e: Double) -> Double {
        let (e0, r0) = (30.0, 6.0)
        let (e1, r1) = (decodePlateauPerLayer, 11.6)
        if e >= e1 { return r1 }
        if e <= e0 { return r0 * (max(e, 1) / e0) }
        let t = log(e / e0) / log(e1 / e0)
        return r0 * pow(r1 / r0, t)
    }

    /// Resident cost of the MTP draft head (mtp.safetensors is 1.47 GB;
    /// activations and cache growth ride the existing margins).
    public static let mtpResidentGB = 1.6

    /// The vision tower's resident cost, paid only by a process that is handed
    /// an image: 333 bf16 tensors, 0.898 GB, measured from the pinned
    /// checkpoint's own header (`VisionTower.residentBytes`), rounded up.
    ///
    /// Engine reserves this inside a target-driven plan before loading the
    /// tower. A raw pool-size request keeps that explicit pool size and reports
    /// the additional resident bytes in its expected peak.
    public static let visionResidentGB = 0.9

    /// Headroom demanded on top of the tower's own bytes before loading it.
    /// The load briefly holds arrays twice while MLX materializes them.
    /// Attention transients depend on the actual dispatch: the established
    /// 72-wide fallback can form an N² matrix and are not bounded by this term.
    public static let visionLoadMarginGB = 1.0
    /// Auto enables the draft head only when the cache still affords this
    /// many experts per layer AFTER paying for it (M9 design note: below
    /// ~120/layer the displaced experts are worth more than the multiplier;
    /// past the ~150/layer plateau they are worth nothing).
    public static let mtpAutoFloorPerLayer = 120.0

    /// Pool budget before the prefill pass takes its share.
    public static func poolBudgetGB(_ targetGB: Double) -> Double {
        targetGB - fixedFootprintGB - planningMarginGB
    }

    public static func slotsForTarget(_ targetGB: Double, contextCap: Int = ContextPolicy.defaultTokens) -> Int {
        let budget = poolBudgetGB(targetGB)
        let pool = budget - prefillCostGB(prefillChunkFor(poolBudgetGB: budget, contextCap: contextCap))
            - prefixCacheGB(poolBudgetGB: budget, contextCap: contextCap)
        return Geometry.slotsForPoolGB(pool)
    }

    /// Resolve the knobs. Precedence: --experts-per-layer > --pool-gb >
    /// --memory-gb > auto. Losing knobs are noted, never silently dropped.
    ///
    /// Auto (and only auto) also clamps to what is reclaimable right now, so a
    /// busy machine degrades gracefully instead of swap-storming — explicit
    /// knobs mean the user chose, so they only get an informational note. On a
    /// quiet machine the clamp never binds and auto stays deterministic.
    public enum MTPMode: String, Sendable, Codable {
        case on, off, auto
    }

    /// Whether this process will answer requests that carry images. `auto` is
    /// "yes when the checkpoint has a tower", which the shipped one does.
    public enum VisionMode: String, Sendable, Codable {
        case on, off, auto
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false
    ) throws -> MemoryPlan {
        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
            simulated: simulated, qualification: false, runtimePolicy: nil)
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, runtimePolicy: RuntimeAllocationPolicy?
    ) throws -> MemoryPlan {
        try plan(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            ramGB: ramGB, workingSetGB: workingSetGB, availableGB: availableGB, ramPercent: ramPercent,
            mtp: mtp, mtpAvailable: mtpAvailable, vision: vision, visionAvailable: visionAvailable,
            visionResidentReserved: visionResidentReserved, maxContextTokens: maxContextTokens,
            simulated: simulated, qualification: false, runtimePolicy: runtimePolicy)
    }

    public static func plan(
        expertsPerLayer: Int?, poolGB: Double?, memoryGB: Double?,
        ramGB: Double? = nil, workingSetGB: Double? = nil,
        availableGB: Double? = nil, ramPercent: Double? = nil,
        mtp: MTPMode = .off, mtpAvailable: Bool = false,
        vision: VisionMode = .auto, visionAvailable: Bool = false,
        visionResidentReserved: Bool = false,
        maxContextTokens: Int = ContextPolicy.defaultTokens,
        simulated: Bool = false, qualification: Bool, runtimePolicy: RuntimeAllocationPolicy? = nil
    ) throws -> MemoryPlan {
        if let why = ContextPolicy.validationError(maxContextTokens, qualification: qualification) { throw PlanError(why) }
        // The fixed footprint pays for the default context; larger windows
        // reduce the pool budget by their additional active state and measured
        // transient envelope, before sizing either the pool or prefill pass.
        let contextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens)
            + (visionResidentReserved ? visionResidentGB : 0)
        let mtpContextCharge = extraContextMemoryGB(maxContextTokens: maxContextTokens, mtp: true)
            - extraContextMemoryGB(maxContextTokens: maxContextTokens)
        let mtpTotalCharge = mtpResidentGB + mtpContextCharge
        let ram = ramGB ?? deviceRAMGB()
        let ws = workingSetGB ?? deviceWorkingSetGB()
        let avail = availableGB ?? deviceAvailableGB()
        let pct = ramPercent ?? defaultRAMPercent
        guard ram.isFinite, ram > 0 else {
            throw PlanError("RAM must be a finite number > 0")
        }
        guard ws.isFinite, ws > 0 else {
            throw PlanError("Metal working-set size must be a finite number > 0")
        }
        // +infinity is meaningful here: it is how doctor --sim-ram says
        // "availability is not a constraint on this simulated machine". Only
        // NaN and negatives are garbage.
        if let a = avail, a.isNaN || a < 0 {
            throw PlanError("available memory must be a number >= 0")
        }
        guard pct.isFinite, pct > 0, pct <= 100 else {
            throw PlanError(String(
                format: "--max-ram-percent %.0f is out of range — give a share between 1 and 100",
                pct))
        }
        var notes: [String] = []
        var clamped = false
        if ramPercent != nil, expertsPerLayer != nil || poolGB != nil || memoryGB != nil {
            notes.append("--max-ram-percent ignored (it only bounds auto; an explicit memory knob is already the target)")
        }
        if vision == .on, !visionAvailable {
            throw PlanError(
                "--vision on, but this checkpoint has no vision_tower tensors — it is a "
                    + "text-only model; use --vision auto/off")
        }
        let visionOn = vision != .off && visionAvailable
        guard !visionResidentReserved || visionOn else {
            throw PlanError("a loaded vision tower requires an available, enabled vision model")
        }
        if mtp == .on, !mtpAvailable {
            throw PlanError(
                "--mtp on, but mtp.safetensors is not next to the model — the draft head "
                    + "is a separate 1.5 GB artifact converted from the official release "
                    + "(Tools/mtp_convert.py); convert it first or use --mtp auto/off")
        }

        /// The draft-head decision for a pool of `slots` when the head costs
        /// pool budget (target-driven sources already shrank the pool).
        if mtp == .on, maxContextTokens > ContextPolicy.mtpLimit, !qualification {
            throw PlanError("MTP is qualified only through \(ContextPolicy.mtpLimit) tokens; use --mtp off at this window")
        }
        if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit {
            notes.append("MTP stays off because this context exceeds its qualified window")
        }
        func resolveMTP(slotsAfterCharge: Int) -> Bool {
            if mtp == .auto, maxContextTokens > ContextPolicy.mtpLimit { return false }
            switch mtp {
            case .off: return false
            case .on: return true
            case .auto:
                return mtpAvailable
                    && Geometry.perLayer(slotsAfterCharge) >= mtpAutoFloorPerLayer
            }
        }

        func finish(
            _ source: MemoryPlan.Source, _ slots: Int, target: Double?, mtpOn: Bool
        ) throws -> MemoryPlan {
            // An explicit pool knob states the cache size, not the whole budget,
            // so size the prefill pass from the pool the user asked for.
            let mtpCharge = mtpOn ? mtpResidentGB + mtpContextCharge : 0
            let budgetForCaches = target.map { poolBudgetGB($0) - mtpCharge - contextCharge }
                ?? Geometry.gb(slots)
            let chunk = prefillChunkFor(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens)
            let capped = min(slots, Geometry.totalRecords)
            let floored = max(capped, Geometry.floorSlots)
            if floored > capped {
                notes.append(String(
                    format: "raised to the floor of %d slots (~%.0f/layer): below it a prefill chunk can pin every slot",
                    Geometry.floorSlots, Geometry.perLayer(Geometry.floorSlots)))
            }
            let peak = Geometry.gb(floored) + fixedFootprintGB + prefillCostGB(chunk)
                + prefixCacheGB(poolBudgetGB: budgetForCaches, contextCap: maxContextTokens) + mtpCharge + contextCharge
            if peak > ws, source != .memoryGB {  // memoryGB branch words its own note
                notes.append(String(
                    format: "expected peak %.1f GB exceeds the %.1f GB Metal working set — expect paging; close other apps or lower the knob",
                    peak, ws))
            }
            // Explicit raw knobs: warn (don't resize) when the machine is busy.
            if source == .expertsPerLayer || source == .poolGB, let a = avail, peak > a {
                notes.append(String(
                    format: "only %.1f GB is reclaimable right now — expect paging until other apps release memory (auto would size to the machine)",
                    a))
            }
            let base = MemoryPlan(
                source: source, slots: floored, targetGB: target,
                ramGB: ram, workingSetGB: ws, ramPercent: pct,
                availableGB: avail, clamped: clamped,
                prefillChunk: chunk,
                prefixCacheTokens: prefixCacheTokensFor(
                    poolBudgetGB: budgetForCaches, contextCap: maxContextTokens),
                mtpEnabled: mtpOn,
                visionEnabled: visionOn,
                visionResidentReserved: visionResidentReserved,
                maxContextTokens: maxContextTokens,
                notes: notes,
                simulated: simulated, contextQualification: qualification)
            let resolved = try runtimePolicy.map { try applyingRuntimePolicy(base, policy: $0) } ?? base
            let bytes = resolved.memoryLedger.expectedPeakBytes
            if maxContextTokens > ContextPolicy.defaultTokens || visionResidentReserved {
                if let target, Double(bytes) > target * 1e9 {
                    throw PlanError("insufficient_memory: context, resident components, minimum pool and prefill workspace exceed the total-memory target")
                }
                let physical = min(ws, (avail ?? ws) - availabilitySlackGB(ramGB: ram))
                if Double(bytes) > physical * 1e9 {
                    throw PlanError("insufficient_memory: requested context and expert pool exceed reclaimable memory with safety headroom or the Metal working set")
                }
            }
            return resolved
        }

        if let n = expertsPerLayer {
            guard n >= 1 else { throw PlanError("--experts-per-layer must be ≥ 1") }
            if poolGB != nil { notes.append("--pool-gb ignored (--experts-per-layer takes precedence)") }
            if memoryGB != nil { notes.append("--memory-gb ignored (--experts-per-layer takes precedence)") }
            let slots = min(n, Geometry.expertsPerLayer) * Geometry.layers
            return try finish(.expertsPerLayer, slots, target: nil, mtpOn: resolveMTP(slotsAfterCharge: slots))
        }
        if let g = poolGB {
            guard g.isFinite, g > 0 else {
                throw PlanError("--pool-gb must be a finite number > 0")
            }
            if memoryGB != nil { notes.append("--memory-gb ignored (--pool-gb takes precedence)") }
            // Preserve a below-floor request so `finish` can explain that it
            // raised it; cap before Double->Int so huge finite input is safe.
            let requested = g >= Geometry.gb(Geometry.totalRecords)
                ? Geometry.totalRecords : Int(g * 1e9 / Geometry.recordBytes)
            return try finish(.poolGB, requested, target: nil, mtpOn: resolveMTP(slotsAfterCharge: requested))
        }
        if let m = memoryGB {
            guard m.isFinite else { throw PlanError("--memory-gb must be finite") }
            guard m >= minMemoryGB else {
                throw PlanError(String(
                    format: "--memory-gb %.1f is below the minimum %.1f GB (floor cache of ~%.0f experts/layer = %.1f GB pool, plus the %.1f GB fixed footprint of resident weights + n-gram cache, plus %.1f GB margin)",
                    m, minMemoryGB, Geometry.perLayer(Geometry.floorSlots),
                    Geometry.gb(Geometry.floorSlots), fixedFootprintGB,
                    planningMarginGB))
            }
            if m > ws {
                notes.append(String(
                    format: "target %.1f GB exceeds the %.1f GB Metal working set; the OS may page — auto would pick %.1f GB here",
                    m, ws, max(minMemoryGB, autoTargetGB(ramGB: ram, workingSetGB: ws, ramPercent: pct))))
            }
            if let a = avail, m > a {
                notes.append(String(
                    format: "only %.1f GB is reclaimable right now — expect paging until other apps release memory",
                    a))
            }
            var mtpOn = resolveMTP(
                slotsAfterCharge: slotsForTarget(max(m - mtpTotalCharge - contextCharge, minMemoryGB), contextCap: maxContextTokens))
            if mtpOn, m - mtpTotalCharge - contextCharge < minMemoryGB {
                if mtp == .on {
                    throw PlanError(String(
                        format: "--memory-gb %.1f cannot fit the %.1f GB draft head above the %.1f GB minimum — raise the target or drop --mtp on",
                        m, mtpTotalCharge, minMemoryGB))
                }
                mtpOn = false
            }
            let slots = slotsForTarget(m - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens)
            return try finish(.memoryGB, slots, target: m, mtpOn: mtpOn)
        }

        // auto: the default. The draft head is worth its 1.6 GB only when the
        // cache still reaches ~120+ experts/layer after paying for it, and
        // past the decode knee that RAM buys nothing else — so when the head
        // is on, the ceiling rises by exactly its cost.
        let mtpWanted = mtp != .off && mtpAvailable
            && (mtp == .on || maxContextTokens <= ContextPolicy.mtpLimit)
        func autoRaw(ceilingGB: Double) -> (Double, Bool) {
            let c = autoTargetGB(ramGB: ram, workingSetGB: ws, ramPercent: pct, ceilingGB: ceilingGB)
            var raw = c
            var didClamp = false
            if let a = avail, a - availabilitySlackGB(ramGB: ram) < raw {
                raw = a - availabilitySlackGB(ramGB: ram)
                didClamp = true
            }
            return (raw, didClamp)
        }
        var mtpOn = false
        if mtpWanted {
            let (rawM, _) = autoRaw(ceilingGB: usefulCeilingGB + mtpTotalCharge)
            let targetM = max(minMemoryGB, rawM)
            let charged = targetM - mtpTotalCharge - contextCharge
            mtpOn = charged >= minMemoryGB
                && (mtp == .on
                    || Geometry.perLayer(slotsForTarget(charged, contextCap: maxContextTokens)) >= mtpAutoFloorPerLayer)
        }
        if mtp == .on, !mtpOn {
            throw PlanError("insufficient_memory: auto cannot keep the requested MTP head loaded at this context; close other apps or use --mtp off")
        }
        // `ceiling` is what this machine's auto would pick unclamped (the
        // notes below compare against it); the knee itself rises by the
        // head's cost when the head is on.
        let kneeGB = usefulCeilingGB + (mtpOn ? mtpTotalCharge : 0)
        let ceiling = autoTargetGB(
            ramGB: ram, workingSetGB: ws, ramPercent: pct, ceilingGB: kneeGB)
        let raw: Double
        (raw, clamped) = autoRaw(ceilingGB: kneeGB)
        let target = max(minMemoryGB, raw)
        if mtpOn, target - mtpTotalCharge - contextCharge < minMemoryGB { mtpOn = false }
        // Exactly one note tells the story of why the target is what it is.
        if raw < minMemoryGB, ceiling < minMemoryGB {
            notes.append(String(
                format: "this machine (%.0f GB RAM) is below the comfortable minimum — running at the %.1f GB floor; expect slow decode and close other apps",
                ram, minMemoryGB))
        } else if raw < minMemoryGB {
            notes.append(String(
                format: "only %.1f GB of %.0f GB RAM is reclaimable right now — running at the %.1f GB floor anyway; expect heavy paging until other apps release memory",
                avail ?? 0, ram, minMemoryGB))
        } else if clamped {
            notes.append(String(
                format: "only %.1f GB of %.0f GB RAM is reclaimable right now (other apps hold the rest) — sized down from the usual %.1f GB; close apps and restart for full speed, or force a size with --memory-gb",
                avail ?? 0, ram, ceiling))
        } else if ceiling >= kneeGB,
            min((pct / 100) * ram, ws - 2.0) > 1.25 * kneeGB
        {
            // This machine could hold more and auto declined. Say so, or it
            // reads as slotstream failing to use the hardware.
            notes.append(String(
                format: "this machine could hold more, but decode stops improving around here (measured 11.2 tok/s at 120 experts/layer, 11.6 at 150) — auto caps at %.1f GB rather than spend RAM for nothing; --memory-gb N to go further",
                usefulCeilingGB))
        }
        let slots = slotsForTarget(target - (mtpOn ? mtpTotalCharge : 0) - contextCharge, contextCap: maxContextTokens)
        return try finish(.auto, slots, target: target, mtpOn: mtpOn)
    }

    /// Resolve the first image against the existing policy, before allocating
    /// its tower. The source and target remain the user's original decision.
    public static func loadingVision(_ p: MemoryPlan) throws -> MemoryPlan {
        guard p.visionEnabled else { throw PlanError("vision is disabled") }
        if p.visionResidentReserved { return p }
        var sized: MemoryPlan
        if let target = p.targetGB {
            sized = try plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: p.ramGB, workingSetGB: p.workingSetGB, availableGB: p.availableGB,
                mtp: p.mtpEnabled ? .on : .off, mtpAvailable: p.mtpEnabled,
                vision: .on, visionAvailable: true, visionResidentReserved: true,
                maxContextTokens: p.maxContextTokens, simulated: p.simulated, qualification: p.contextQualification,
                runtimePolicy: p.runtimeAllocationPolicy)
        } else { sized = p }
        // Loading a tower never justifies restoring capacity already donated
        // by the governor. Its original target can outlive a pressure shrink.
        return MemoryPlan(source: p.source, slots: min(p.slots, sized.slots), targetGB: p.targetGB,
            ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
            availableGB: p.availableGB, clamped: p.clamped, prefillChunk: min(p.prefillChunk, sized.prefillChunk),
            prefixCacheTokens: min(p.prefixCacheTokens, sized.prefixCacheTokens), mtpEnabled: p.mtpEnabled,
            visionEnabled: true, visionResidentReserved: true,
            maxContextTokens: p.maxContextTokens,
            notes: p.notes + ["vision tower resident memory reserved before loading"], simulated: p.simulated,
            runtimeAllocationPolicy: p.runtimeAllocationPolicy,
            maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification)
    }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/source-before/Sources/Slotstream/Weights.swift

SHA-256 `27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b`; 11340 bytes.

````text
// Resident weight loading and the quantized-linear primitive.
//
// Residents = everything except routed experts (switch_mlp) and the n-gram
// store shards; ~3.8 GB at 4-bit, loaded whole via MLX's safetensors reader.

import Foundation
import MLX

/// A linear layer read from the checkpoint: quantized (weight+scales+biases)
/// or plain bf16, decided by whether `<name>.scales` exists.
public struct QLinear {
    public let w: MLXArray
    public let scales: MLXArray?
    public let biases: MLXArray?
    public let groupSize: Int
    public let bits: Int

    package init(w: MLXArray, scales: MLXArray?, biases: MLXArray?, groupSize: Int, bits: Int) {
        self.w = w; self.scales = scales; self.biases = biases
        self.groupSize = groupSize; self.bits = bits
    }

    public var isQuantized: Bool { scales != nil }

    public func callAsFunction(_ x: MLXArray) -> MLXArray {
        if let s = scales {
            return quantizedMM(
                x, w, scales: s, biases: biases, transpose: true,
                groupSize: groupSize, bits: bits)
        }
        return matmul(x, w.transposed())
    }

    /// Keep the established row dispatch for a token-wise projection. Dummy
    /// rows are cropped before any sequence operation or cache update. This
    /// does not pad attention queries, recurrent steps, or logical token IDs.
    package func callAsFunction(_ x: MLXArray, minimumRows: Int) -> MLXArray {
        Self.withReferenceRows(x, minimumRows: minimumRows) { self($0) }
    }

    package static func withReferenceRows(_ x: MLXArray, minimumRows: Int,
                                          _ project: (MLXArray) -> MLXArray) -> MLXArray {
        let rows = x.size / x.dim(-1)
        guard rows > 0, rows < minimumRows, minimumRows <= 256 else { return project(x) }
        let flat = x.reshaped([rows, x.dim(-1)])
        let padded = concatenated([flat, broadcast(flat[(rows - 1)...],
            to: [minimumRows - rows, x.dim(-1)])], axis: 0)
        let output = project(padded)
        return output[0 ..< rows].reshaped(Array(x.shape.dropLast()) + [output.dim(-1)])
    }
}

/// Anything that can hand out named tensors from a checkpoint: the resident
/// trunk (ResidentWeights) or the MTP block's own file (MTPWeights). Layer
/// blocks are built against this so the MTP head can reuse them verbatim.
public protocol TensorSource: AnyObject {
    var config: ModelConfig { get }
    func optionalTensor(_ name: String) -> MLXArray?
}

extension TensorSource {
    public func has(_ name: String) -> Bool { optionalTensor(name) != nil }

    public func tensor(_ name: String) -> MLXArray {
        guard let a = optionalTensor(name) else { fatalError("missing tensor \(name)") }
        return a
    }

    public func linear(_ base: String, groupSize: Int? = nil, bits: Int? = nil) -> QLinear {
        let w = tensor(base + ".weight")
        let s = optionalTensor(base + ".scales")
        let b = optionalTensor(base + ".biases")
        return QLinear(
            w: w, scales: s, biases: b,
            groupSize: groupSize ?? config.qGroup, bits: bits ?? config.qBits)
    }
}

public final class ResidentWeights: TensorSource {
    public let arrays: [String: MLXArray]
    public let config: ModelConfig
    package let packedGDNProjections: [Int: PackedProjectionPair]
    public var packedGDNProjectionLayers: Int { packedGDNProjections.count }
    /// Shared backing already included in named resident tensors; not extra bytes.
    public var packedGDNProjectionPayloadBytes: Int {
        packedGDNProjections.values.reduce(0) { $0 + $1.payloadBytes }
    }
    private let embeddingRows: EmbeddingRows?
    public var usesEmbeddingRows: Bool { embeddingRows != nil }
    package var embeddingReadFault: ReadFault? {
        get { embeddingRows?.readFault }
        set { embeddingRows?.readFault = newValue }
    }
    package var embeddingRowHits: Int { embeddingRows?.uniqueRowHits ?? 0 }
    package var embeddingRowMisses: Int { embeddingRows?.uniqueRowMisses ?? 0 }
    package var embeddingCachedRows: Int { embeddingRows?.cachedRows ?? 0 }
    package var embeddingCachedPayloadBytes: Int { embeddingRows?.cachedPayloadBytes ?? 0 }
    package func clearEmbeddingRows() { embeddingRows?.clear() }

    public convenience init(index: CheckpointIndex, includeLayerExperts: Set<Int> = []) throws {
        try self.init(index: index, includeLayerExperts: includeLayerExperts, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, includeLayerExperts: Set<Int> = [], embeddingRowCache: Bool?,
                 packGDNProjections: Bool = false) throws {
        // Golden/debug commands can load the multi-GB resident trunk without
        // constructing Qwen4ExpModel. They need the same cross-process guard as
        // run/serve or they can silently stack underneath another model.
        try ModelProcessGuard.acquire()
        self.config = index.config
        let setting = ProcessInfo.processInfo.environment["SLOTSTREAM_EMBEDDING_ROWS"] ?? "0"
        guard setting == "0" || setting == "1" else { throw ModelError("SLOTSTREAM_EMBEDDING_ROWS must be 0 or 1") }
        let useRows = embeddingRowCache ?? (setting == "1")
        self.embeddingRows = useRows ? try EmbeddingRows(index: index) : nil
        var kept: [String: MLXArray] = [:]
        let files = Set(index.tensors.values.map { $0.file })
        for f in files.sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
            let all = try loadArrays(url: f)
            for (rawKey, arr) in all {
                var key = rawKey
                if key.hasPrefix("language_model.") { key.removeFirst("language_model.".count) }
                if key.hasPrefix("mtp.") || key.hasPrefix("vision_tower.") || key.hasPrefix("model.visual.") {
                    continue
                }
                if key.contains("ngram_embedding.shard_") { continue }
                if key.contains(".switch_mlp.") {
                    // routed experts stay on SSD unless explicitly requested (parity rig)
                    let isWanted = includeLayerExperts.contains { key.contains("model.layers.\($0).mlp.switch_mlp.") }
                    if !isWanted { continue }
                }
                kept[key] = arr
            }
        }
        var packed: [Int: PackedProjectionPair] = [:]
        if packGDNProjections {
            func projection(_ base: String) -> QLinear? {
                guard let weight = kept[base + ".weight"] else { return nil }
                return QLinear(w: weight, scales: kept[base + ".scales"], biases: kept[base + ".biases"],
                    groupSize: index.config.qGroup, bits: index.config.qBits)
            }
            for layer in config.layerTypes.indices where config.layerTypes[layer] == "linear_attention" {
                let base = "model.layers.\(layer).linear_attn"
                let a = base + ".in_proj_qkv", b = base + ".in_proj_z"
                guard let first = projection(a), let second = projection(b),
                      let pair = PackedProjectionPair(first, second) else { continue }
                for (name, view) in [(a, pair.first), (b, pair.second)] {
                    kept[name + ".weight"] = view.w
                    kept[name + ".scales"] = view.scales
                    kept[name + ".biases"] = view.biases
                }
                packed[layer] = pair
            }
        }
        self.packedGDNProjections = packed
        // Keep the public tensor dictionary complete. In the experimental row
        // path only lookup tensors stay lazy; explicit external tensor access
        // can still materialize their exact original values. No planner credit
        // is granted for this optional retention change.
        eval(kept.filter { !useRows || !EmbeddingRows.names.contains($0.key) }.map(\.value))
        self.arrays = kept
    }

    public func optionalTensor(_ name: String) -> MLXArray? { arrays[name] }

    /// Dequantized embedding rows for token ids: (B, S) -> (B, S, hidden).
    public func embed(_ ids: MLXArray) -> MLXArray {
        do { return try embedChecked(ids) }
        catch { preconditionFailure("embedding lookup failed: \(error)") }
    }

    /// Error-propagating companion for checked main/draft execution. Larger
    /// callers are split only for independent row lookup/dequantization; no
    /// model arithmetic or chronological prefill boundary is changed.
    public func embedChecked(_ ids: MLXArray) throws -> MLXArray {
        if let embeddingRows {
            guard [.uint8, .uint16, .uint32, .uint64, .int8, .int16, .int32, .int64].contains(ids.dtype) else {
                throw ModelError("embedding row IDs must be integers")
            }
            // Validate before narrowing: a large Int64 must not wrap onto a
            // different, apparently valid token ID.
            let values = ids.asType(.int64).asArray(Int64.self).map(Int.init)
            guard values.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
                throw ModelError("embedding row ID outside vocabulary")
            }
            return try gatherEmbeddingRows(values, shape: ids.shape, rows: embeddingRows)
        }
        let w = tensor("model.embed_tokens.weight")
        guard let s = arrays["model.embed_tokens.scales"] else {
            return take(w, ids, axis: 0)
        }
        let b = arrays["model.embed_tokens.biases"]
        let rows = take(w, ids, axis: 0)
        let rs = take(s, ids, axis: 0)
        let rb = b.map { take($0, ids, axis: 0) }
        return dequantized(
            rows, scales: rs, biases: rb, groupSize: config.qGroup, bits: config.qBits)
    }

    /// Main and draft callers already own CPU token IDs. Avoid uploading them
    /// merely to synchronize a cast/readback in the row-cache path.
    package func embedChecked(_ ids: [Int], shape: [Int]) throws -> MLXArray {
        guard ids.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
            throw ModelError("embedding row ID outside vocabulary")
        }
        if let embeddingRows { return try gatherEmbeddingRows(ids, shape: shape, rows: embeddingRows) }
        return try embedChecked(MLXArray(ids.map(Int32.init), shape))
    }

    private func gatherEmbeddingRows(_ values: [Int], shape: [Int], rows: EmbeddingRows) throws -> MLXArray {
        var count = 1
        for dim in shape {
            let next = count.multipliedReportingOverflow(by: dim)
            guard dim >= 0, dim <= Int(Int32.max), !next.overflow else {
                throw ModelError("invalid embedding lookup shape")
            }
            count = next.partialValue
        }
        guard count == values.count else { throw ModelError("embedding lookup shape does not match IDs") }
        if values.isEmpty { return MLXArray.zeros(shape + [config.hiddenSize], dtype: .bfloat16) }
        if values.count <= 4096 { return try rows.gather(values, shape: shape) }
        var parts: [MLXArray] = []
        for lo in stride(from: 0, to: values.count, by: 4096) {
            let end = min(values.count, lo + 4096)
            parts.append(try rows.gather(Array(values[lo ..< end]), shape: [end - lo]))
        }
        return concatenated(parts, axis: 0).reshaped(shape + [config.hiddenSize])
    }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/source-before/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift

SHA-256 `0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da`; 17050 bytes.

````text
import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationCompletePrompt(modelDir: URL, mtp: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let index = try CheckpointIndex(dir: modelDir)
        let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: true)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
        generator.speculationEnabled = mtp; generator.draftDepth = 1
        var options = InferenceOptimizations.integrationCandidate
        options.prefixCheckpointTokens = 0
        var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
        var c = CheckBuilder("optimization-complete-prompt\(mtp ? "-mtp" : "")")
        c.expect("complete prompt remains default off", try !InferenceOptimizations.environment([:]).completePromptCheckpoint)
        c.expect("explicit complete prompt option", try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPLETE_PROMPT": "1"]).completePromptCheckpoint)
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        func stateAfter(_ cache: PrefixCache, _ ids: [Int], _ output: [Int], _ vision: VisionPrompt?) throws -> [String: String] {
            guard let hit = cache.take(matching: ids + output + [907], images: vision?.segments ?? []) else {
                throw ModelError("complete-prompt diagnostic lost consumed state")
            }
            var values = hit.state.prefixForkDiagnosticTensors().mapValues(hash)
            hit.state.invalidateMTP()
            values["continuedLogits"] = hash(try model.lastLogitsChecked([907], state: hit.state))
            return values
        }
        let tower = try VisionTower(index: index)
        let bytes = ["iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
                     "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA360e5gAAAABJRU5ErkJggg=="].map { Data(base64Encoded: $0)! }
        let images = try bytes.map { try VisionPreprocess.decodeCGImage($0) }
        let plans = try images.map { try tower.plan(for: $0) }
        func vision(_ start: Int?, color: Int = 0) -> VisionPrompt? {
            guard let start else { return nil }
            return VisionPrompt(tower: tower, items: [.init(image: images[color], plan: plans[color])],
                segments: [.init(start: start, count: plans[color].mergedTokens, hash: ImageHash(hashing: bytes[color]))],
                hiddenSize: model.cfg.hiddenSize)
        }
        let cases: [(Int, Int?)] = [(17, nil), (255, nil), (256, nil), (257, nil), (1025, nil),
            (273, 1), (273 + plans[0].mergedTokens, 256 - plans[0].mergedTokens / 2)]
        for (count, imageStart) in cases {
            let label = "\(count)/image=\(String(describing: imageStart))"
            FileHandle.standardError.write(Data("complete prompt \(label)\n".utf8))
            var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
            if let imageStart {
                ids.replaceSubrange(imageStart..<imageStart+plans[0].mergedTokens,
                    with: repeatElement(model.cfg.imageTokenId, count: plans[0].mergedTokens))
            }
            let referenceCache = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            let referenceVision = vision(imageStart)
            let reference = generator.generate(promptIds: ids, params: params, eosIds: [], cache: referenceCache, vision: referenceVision)
            c.expect("\(label): reference completes", reference.1.runtimeError == nil && reference.0.count == params.maxTokens)
            let expected = try stateAfter(referenceCache, ids, reference.0, referenceVision)
            referenceCache.drop()
            options.completePromptCheckpoint = true; model.optimizations = options
            let cache = PrefixCache(maxTokens: 8192)
            for attempt in 0..<3 {
                let vp = vision(imageStart)
                let result = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vp)
                c.expect("\(label)/\(attempt): completes", result.1.runtimeError == nil)
                c.equal("\(label)/\(attempt): exact output IDs", result.0, reference.0)
                c.equal("\(label)/\(attempt): complete hits", result.1.completePromptHits, attempt == 0 ? 0 : 1)
                c.equal("\(label)/\(attempt): prefill tokens", result.1.prefillTokens, attempt == 0 ? count : 0)
                c.equal("\(label)/\(attempt): reused tokens", result.1.reusedPrefixTokens, attempt == 0 ? 0 : count)
                c.equal("\(label)/\(attempt): retained prompts", cache.heldCheckpoints, 1)
                c.equal("\(label)/\(attempt): checkpoint errors", result.1.prefixCheckpointErrors, 0)
                if attempt > 0 {
                    c.equal("\(label)/\(attempt): no prefill records", result.1.prefillRecords, 0)
                    c.equal("\(label)/\(attempt): no prefill passes", result.1.prefillPasses, [])
                    c.equal("\(label)/\(attempt): tower skipped", result.1.encodedImages, 0)
                }
                c.equal("\(label)/\(attempt): all state and continued logits exact", try stateAfter(cache, ids, result.0, vp), expected)
            }
            c.expect("\(label): public API remains strictly extend-only", cache.take(matching: ids, images: vision(imageStart)?.segments ?? []) == nil)
            if imageStart != nil {
                let changed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vision(imageStart, color: 1))
                c.equal("\(label): changed pixels refuse reuse", changed.1.completePromptHits, 0)
                c.equal("\(label): changed pixels rebuild prompt", changed.1.prefillTokens, count)
            }
            if count == 17 {
                for filtered in [false, true] {
                    var sample = params; sample.temperature = 0.7
                    sample.topK = filtered ? 40 : 0; sample.topP = filtered ? 0.8 : 1
                    sample.minP = filtered ? 0.05 : 0; sample.presencePenalty = filtered ? 1.1 : 0
                    for seed: UInt64 in [7, 7_046_029_254_386_353_130] {
                        sample.seed = seed
                        let cold = generator.generate(promptIds: ids, params: sample, eosIds: [])
                        let hot = generator.generate(promptIds: ids, params: sample, eosIds: [], cache: cache)
                        c.equal("sample \(filtered)/\(seed): exact output", hot.0, cold.0)
                        c.equal("sample \(filtered)/\(seed): complete hit", hot.1.completePromptHits, 1)
                    }
                }
                // Public maxTokens <= 0 means "up to the response ceiling";
                // test zero emissions through cancellation, never by asking
                // this bounded diagnostic to generate 32,768 tokens.
                for limit in [1] {
                    var limited = params; limited.maxTokens = limit
                    let result = generator.generate(promptIds: ids, params: limited, eosIds: [], cache: cache)
                    c.equal("limit \(limit): exact output count", result.0.count, limit)
                    c.equal("limit \(limit): complete hit", result.1.completePromptHits, 1)
                }
                let noOutput = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    shouldContinue: { false })
                c.expect("cancel before first output is empty", noOutput.0.isEmpty && noOutput.1.finishReason == "cancelled" && noOutput.1.requestFailure?.code == .clientCancelled)
                c.equal("zero-emission cancellation reuses complete prompt", noOutput.1.completePromptHits, 1)
                let eos = generator.generate(promptIds: ids, params: params, eosIds: [reference.0[0]], cache: cache)
                c.expect("EOS stops without output", eos.0.isEmpty && eos.1.finishReason == "stop")
                var delivered: [Int] = []
                let stopped = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    onToken: { delivered.append($0); return delivered.count < 2 })
                c.equal("callback cancellation preserves exact prefix", stopped.0, Array(reference.0.prefix(2)))
                let retry = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("cancelled request preserves root", retry.0, reference.0)
                c.equal("retry avoids prefill", retry.1.prefillTokens, 0)
                let key = PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp)
                for wrongKey in [PromptCheckpointKey(model: UUID(), optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: 128, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: !mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: mtp, contextArithmetic: 0)] {
                    c.expect("wrong model, schedule, draft or arithmetic identity refuses complete hit",
                        cache.takeForGeneration(matching: ids, completePromptKey: wrongKey) == nil)
                }
                if let root = cache.takeForGeneration(matching: ids, completePromptKey: key), let raw = root.logits {
                    let rawHash = hash(raw)
                    let unit = PrefixCache.bytesPerToken
                    let stateCharge = max(ids.count, (root.state.allocatedSequenceBytes + unit - 1) / unit)
                    let logitCharge = (raw.nbytes + PrefixCache.logitStorageSlackBytes + unit - 1) / unit
                    let charge = stateCharge + logitCharge
                    for budget in [0, charge, 2 * charge - 1, 2 * charge] {
                        let bounded = PrefixCache(maxTokens: budget)
                        let stored = try bounded.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: ids.count + params.maxTokens, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: raw, vocabularySize: model.cfg.vocabSize, key: key)
                        c.equal("logits charged at budget \(budget)", stored, budget >= 2 * charge)
                        c.equal("exact charged capacity at budget \(budget)", bounded.json()["charged_token_capacity"] as? Int,
                            stored ? charge : 0)
                    }
                    let owned = PrefixCache(maxTokens: 8192)
                    c.expect("ownership checkpoint stored", try owned.storeCompletePrompt(state: root.state, tokens: ids,
                        reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                        logits: raw, vocabularySize: model.cfg.vocabSize, key: key))
                    raw[0] = MLXArray(Float(333))
                    if let first = owned.takeForGeneration(matching: ids, completePromptKey: key), let firstRow = first.logits {
                        c.equal("producer logit context cannot mutate retained row", hash(firstRow), rawHash)
                        firstRow[0] = MLXArray(Float(-333))
                    } else { c.expect("owned checkpoint remains readable", false) }
                    if let second = owned.takeForGeneration(matching: ids, completePromptKey: key), let secondRow = second.logits {
                        c.equal("returned logit context cannot mutate retained row", hash(secondRow), rawHash)
                    } else { c.expect("owned checkpoint remains repeatable", false) }
                    do {
                        _ = try owned.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: MLXArray.zeros([2], dtype: .bfloat16), vocabularySize: model.cfg.vocabSize, key: key)
                        c.expect("malformed logits rejected", false)
                    } catch { c.expect("malformed logits rejected", true) }
                    c.equal("invalid logits preserve existing checkpoint", owned.heldCheckpoints, 1)
                    owned.configure(maxTokens: 0)
                    c.equal("pressure releases state and logits", owned.heldTokens, 0)
                    c.equal("pressure preserves borrowed active state", root.state.tokenCount, count)
                } else { c.expect("complete root exposes logits for ownership checks", false) }
                Stream.gpu.synchronize()
                model.pool.unpinAll()
                try model.pool.diagnosticDiscardResidency()
                let fault = ReadFault(afterJobs: 0); model.pool.readFault = fault
                let failed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                model.pool.readFault = nil
                c.expect("decode read fault fires after complete reuse", fault.hasFired && failed.1.runtimeError != nil)
                c.equal("failed decode reused the prompt", failed.1.completePromptHits, 1)
                let recovered = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("decode failure preserves exact reusable root", recovered.0, reference.0)
                c.equal("read-failure retry avoids prefill", recovered.1.prefillTokens, 0)
                var edited = ids; edited[0] += 1
                let edit = generator.generate(promptIds: edited, params: params, eosIds: [], cache: cache)
                c.equal("edited token misses", edit.1.reusedPrefixTokens, 0)
                let auxiliary = generator.generate(promptIds: [17, 23, 31], params: params, eosIds: [], cache: cache)
                c.expect("auxiliary completes", auxiliary.1.runtimeError == nil)
                let interleaved = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("interleaved output remains exact", interleaved.0, reference.0)
                c.expect("charged capacity stays bounded", (cache.json()["charged_token_capacity"] as? Int ?? Int.max) <= cache.maxTokens)
            }
            cache.drop()
        }
        if mtp {
            let ids = (0..<17).map { 1000 + $0 * 79 }
            let transition = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            generator.speculationEnabled = false
            let plain = generator.generate(promptIds: ids, params: params, eosIds: [], cache: transition)
            c.expect("draft transition seed succeeds", plain.1.runtimeError == nil)
            guard let consumed = transition.peek(extending: ids) else { throw ModelError("draft transition lost exact consumed IDs") }
            let extended = consumed + [907]
            options.completePromptCheckpoint = true; model.optimizations = options
            generator.speculationEnabled = true
            let fallback = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("plain cached state finishes current request plain", fallback.1.verifyPasses, 0)
            c.equal("plain-to-draft transition really reused state", fallback.1.reusedPrefixTokens, consumed.count)
            let rebuilt = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("complete prompt with missing head is not an MTP hit", rebuilt.1.completePromptHits, 0)
            c.equal("missing draft head is rebuilt from the full prompt", rebuilt.1.prefillTokens, extended.count)
            c.expect("rebuilt draft participates", rebuilt.1.verifyPasses > 0)
            let hot = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("rebuilt draft checkpoint can be reused completely", hot.1.completePromptHits, 1)
            c.equal("reused draft output is exact", hot.0, rebuilt.0)
        }
        c.measure("end_physical_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}
````

## /tmp/slotstream-optimization-execution/current-source-build-v273/source-before/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift

SHA-256 `06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29`; 18240 bytes.

````text
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
        c.equal("reference optimization defaults", try InferenceOptimizations.environment([:]), InferenceOptimizations())
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
        c.equal("absent overrides retain the selected default family",
            try InferenceOptimizations.resolving(environment: [:], defaults: candidate), candidate)
        let candidateFlags: [(String, WritableKeyPath<InferenceOptimizations, Bool>)] = [
            ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
            ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
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
        c.equal("public environment function value keeps its signature and reference default",
            try environmentFunction([:]), InferenceOptimizations())
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
````

