---
type: run
id: 01m1x7hycad63hrxs1avt7erf5
created: 2026-09-07T06:05:43.690376+00:00
updated: 2026-09-07T06:05:44.048227+00:00
summary: Separate combined-default candidate builds and restores the shared checkout
binary: V255 candidate701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64; per-file exact bindings retained
captured_at: 2026-09-07
command: python3 /tmp/slotstream-optimization-execution/combined-default-build-v255/run.py
discarded: 'true'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Separate combined-default candidate builds and restores the shared checkout
tool: python3
---
# Separate combined-default candidate builds and restores the shared checkout

V255 combines the exact V208 unchanged planner family and V199 selected-default afterimages in a temporary seven-file source lease. Build and restoration pass in158.529884583seconds. Candidate binary701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64 and source archive3fa7a653fe11e14661ebc6204c68deb2f0839bf2ef432fb9c0d45f935e36f3ef remain separate. Original shared143runtime files, absent family file, six release artifacts, symlink, modes/mtimes and first-party/SwiftPM build state are restored exactly. No optional control was added to the selected family. This provisional build is preparation, not final acceptance, default adoption, capacity or speed evidence. Any later source/selection change requires its own final build and qualification.

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/build.txt

SHA-256 `63d7c659c234a652d1b4eb5930629950176b93d37d4bfd44787cb9f673445705`; 12658 bytes.

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
Build complete! (155.08s)
cp Tools/lib/mlx-0.31.1.metallib .build/release/mlx.metallib
python3 Tools/build_identity.py after .build/release
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/live-memory.json

SHA-256 `75f0939f9c26829fc78d2892cacc5c341050ff2d11fa20e04e3377f5254c6419`; 154427 bytes.

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
    "reclaimable_bytes": 10736910336,
    "swapins": 44109437,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    67045.\nPages active:                                 994743.\nPages inactive:                               996007.\nPages speculative:                             37087.\nPages throttled:                                   0.\nPages wired down:                             296376.\nPages purgeable:                                8449.\n\"Translation faults\":                    15304213500.\nPages copy-on-write:                       726789876.\nPages zero filled:                       21071486284.\nPages reactivated:                        3465713414.\nPages purged:                               71959300.\nFile-backed pages:                            579835.\nAnonymous pages:                             1448002.\nPages stored in compressor:                  1660664.\nPages occupied by compressor:                 694224.\nDecompressions:                           1169558517.\nCompressions:                             1483668853.\nPageins:                                  7603544272.\nPageouts:                                   11053843.\nSwapins:                                    44109437.\nSwapouts:                                   77525502.\nPages tagged:                                 176320.\nPages tagged resident:                        131254.\nPages tagged compressed:                       45066.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7285.\nPages tag-storage free:                          228.\nPages tag-storage non-tag pageable:            90783.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7286080.\nTagged compressions:                        11190155.\nTagged decompressions:                      10321822.\n"
  },
  "samples": [
    {
      "elapsed_seconds": 0.001707249999999938,
      "owned_rss_bytes": 6127616,
      "owned_process_count": 1,
      "reclaimable_bytes": 10728292352,
      "swapins": 44109437,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 0.22803354200000003,
      "owned_rss_bytes": 6471680,
      "owned_process_count": 2,
      "reclaimable_bytes": 10729963520,
      "swapins": 44109437,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 0.45626575,
      "owned_rss_bytes": 40435712,
      "owned_process_count": 3,
      "reclaimable_bytes": 10895671296,
      "swapins": 44109437,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 0.6830522079999999,
      "owned_rss_bytes": 54231040,
      "owned_process_count": 3,
      "reclaimable_bytes": 10906599424,
      "swapins": 44109437,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 0.907189625,
      "owned_rss_bytes": 94896128,
      "owned_process_count": 4,
      "reclaimable_bytes": 10895769600,
      "swapins": 44109437,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 1.13949025,
      "owned_rss_bytes": 54509568,
      "owned_process_count": 3,
      "reclaimable_bytes": 10908237824,
      "swapins": 44109437,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 1.367212125,
      "owned_rss_bytes": 53837824,
      "owned_process_count": 3,
      "reclaimable_bytes": 10722918400,
      "swapins": 44109437,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 1.596286292,
      "owned_rss_bytes": 233390080,
      "owned_process_count": 8,
      "reclaimable_bytes": 10746986496,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 1.827770167,
      "owned_rss_bytes": 65077248,
      "owned_process_count": 5,
      "reclaimable_bytes": 10716184576,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 2.0569197079999997,
      "owned_rss_bytes": 65093632,
      "owned_process_count": 4,
      "reclaimable_bytes": 10724065280,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 2.2842959169999997,
      "owned_rss_bytes": 65060864,
      "owned_process_count": 4,
      "reclaimable_bytes": 10766155776,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 2.5157466250000002,
      "owned_rss_bytes": 324026368,
      "owned_process_count": 9,
      "reclaimable_bytes": 10715971584,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 2.7470328329999996,
      "owned_rss_bytes": 66486272,
      "owned_process_count": 7,
      "reclaimable_bytes": 10769661952,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 2.978068208,
      "owned_rss_bytes": 67026944,
      "owned_process_count": 6,
      "reclaimable_bytes": 10771873792,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 3.208885833,
      "owned_rss_bytes": 66994176,
      "owned_process_count": 6,
      "reclaimable_bytes": 10788732928,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 3.4469960420000003,
      "owned_rss_bytes": 66813952,
      "owned_process_count": 3,
      "reclaimable_bytes": 10781097984,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 3.677926708,
      "owned_rss_bytes": 187334656,
      "owned_process_count": 5,
      "reclaimable_bytes": 10883842048,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 3.9021592080000005,
      "owned_rss_bytes": 66830336,
      "owned_process_count": 3,
      "reclaimable_bytes": 10968006656,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 4.13256025,
      "owned_rss_bytes": 71204864,
      "owned_process_count": 3,
      "reclaimable_bytes": 10967859200,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 4.361531042,
      "owned_rss_bytes": 71254016,
      "owned_process_count": 3,
      "reclaimable_bytes": 11035475968,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 4.59377675,
      "owned_rss_bytes": 66879488,
      "owned_process_count": 3,
      "reclaimable_bytes": 11047993344,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 4.819131458,
      "owned_rss_bytes": 68501504,
      "owned_process_count": 2,
      "reclaimable_bytes": 10862444544,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 5.047513042,
      "owned_rss_bytes": 71041024,
      "owned_process_count": 2,
      "reclaimable_bytes": 10860462080,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 5.275966125,
      "owned_rss_bytes": 74907648,
      "owned_process_count": 2,
      "reclaimable_bytes": 10778427392,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 5.503109333,
      "owned_rss_bytes": 169721856,
      "owned_process_count": 4,
      "reclaimable_bytes": 10723721216,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 5.731418167,
      "owned_rss_bytes": 267026432,
      "owned_process_count": 4,
      "reclaimable_bytes": 10503634944,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 5.961876042,
      "owned_rss_bytes": 94093312,
      "owned_process_count": 3,
      "reclaimable_bytes": 10715873280,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 6.1888024580000005,
      "owned_rss_bytes": 94093312,
      "owned_process_count": 2,
      "reclaimable_bytes": 10719641600,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 6.419443333,
      "owned_rss_bytes": 94093312,
      "owned_process_count": 2,
      "reclaimable_bytes": 10718412800,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 6.643649333,
      "owned_rss_bytes": 94093312,
      "owned_process_count": 2,
      "reclaimable_bytes": 10733617152,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 6.872016167,
      "owned_rss_bytes": 242925568,
      "owned_process_count": 4,
      "reclaimable_bytes": 10723803136,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 7.101939625,
      "owned_rss_bytes": 217235456,
      "owned_process_count": 4,
      "reclaimable_bytes": 10717495296,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 7.331266417,
      "owned_rss_bytes": 134365184,
      "owned_process_count": 4,
      "reclaimable_bytes": 10710925312,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 7.560914333,
      "owned_rss_bytes": 242040832,
      "owned_process_count": 4,
      "reclaimable_bytes": 10680598528,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 7.790433666999999,
      "owned_rss_bytes": 99532800,
      "owned_process_count": 2,
      "reclaimable_bytes": 10724147200,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 8.016510582999999,
      "owned_rss_bytes": 218972160,
      "owned_process_count": 4,
      "reclaimable_bytes": 10691837952,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 8.242846875,
      "owned_rss_bytes": 204111872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10686038016,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 8.468689042,
      "owned_rss_bytes": 246235136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10660118528,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 8.697415374999999,
      "owned_rss_bytes": 182059008,
      "owned_process_count": 4,
      "reclaimable_bytes": 10692050944,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 8.925939875,
      "owned_rss_bytes": 280559616,
      "owned_process_count": 4,
      "reclaimable_bytes": 10640490496,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 9.155418916999999,
      "owned_rss_bytes": 297123840,
      "owned_process_count": 4,
      "reclaimable_bytes": 10625810432,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 9.384006042,
      "owned_rss_bytes": 209747968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10671816704,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 9.61448575,
      "owned_rss_bytes": 234389504,
      "owned_process_count": 4,
      "reclaimable_bytes": 10650451968,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 9.84451125,
      "owned_rss_bytes": 270680064,
      "owned_process_count": 4,
      "reclaimable_bytes": 10626875392,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 10.073523999999999,
      "owned_rss_bytes": 287916032,
      "owned_process_count": 4,
      "reclaimable_bytes": 10609246208,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 10.303093041999999,
      "owned_rss_bytes": 299597824,
      "owned_process_count": 4,
      "reclaimable_bytes": 10600841216,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 10.53226475,
      "owned_rss_bytes": 302563328,
      "owned_process_count": 4,
      "reclaimable_bytes": 10600742912,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 10.760835792,
      "owned_rss_bytes": 136265728,
      "owned_process_count": 3,
      "reclaimable_bytes": 10700324864,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 10.990902333,
      "owned_rss_bytes": 282771456,
      "owned_process_count": 4,
      "reclaimable_bytes": 10810621952,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 11.217596375,
      "owned_rss_bytes": 208175104,
      "owned_process_count": 4,
      "reclaimable_bytes": 10650042368,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 11.445844042,
      "owned_rss_bytes": 271187968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10609524736,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 11.67546775,
      "owned_rss_bytes": 296321024,
      "owned_process_count": 4,
      "reclaimable_bytes": 10583998464,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 11.904671375,
      "owned_rss_bytes": 336494592,
      "owned_process_count": 4,
      "reclaimable_bytes": 10618421248,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 12.134657958,
      "owned_rss_bytes": 350339072,
      "owned_process_count": 4,
      "reclaimable_bytes": 10610999296,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 12.365030791999999,
      "owned_rss_bytes": 366166016,
      "owned_process_count": 4,
      "reclaimable_bytes": 10522394624,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 12.594192625,
      "owned_rss_bytes": 385810432,
      "owned_process_count": 4,
      "reclaimable_bytes": 10500538368,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 12.823311541999999,
      "owned_rss_bytes": 397475840,
      "owned_process_count": 4,
      "reclaimable_bytes": 10490068992,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 13.052882624999999,
      "owned_rss_bytes": 411500544,
      "owned_process_count": 4,
      "reclaimable_bytes": 10476109824,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 13.281917625,
      "owned_rss_bytes": 423215104,
      "owned_process_count": 4,
      "reclaimable_bytes": 10463428608,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 13.511504666999999,
      "owned_rss_bytes": 432259072,
      "owned_process_count": 4,
      "reclaimable_bytes": 10454810624,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 13.741250166999999,
      "owned_rss_bytes": 447725568,
      "owned_process_count": 4,
      "reclaimable_bytes": 10442014720,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 13.968680124999999,
      "owned_rss_bytes": 453591040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10433970176,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 14.199356958,
      "owned_rss_bytes": 456671232,
      "owned_process_count": 4,
      "reclaimable_bytes": 10435723264,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 14.428870332999999,
      "owned_rss_bytes": 459735040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10433511424,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 14.658392667,
      "owned_rss_bytes": 464191488,
      "owned_process_count": 4,
      "reclaimable_bytes": 10427858944,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 14.884892624999999,
      "owned_rss_bytes": 469663744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10488414208,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 15.114835458,
      "owned_rss_bytes": 477577216,
      "owned_process_count": 4,
      "reclaimable_bytes": 10485170176,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 15.340566916999999,
      "owned_rss_bytes": 481198080,
      "owned_process_count": 4,
      "reclaimable_bytes": 10478665728,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 15.570858333,
      "owned_rss_bytes": 484638720,
      "owned_process_count": 4,
      "reclaimable_bytes": 10493542400,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 15.798385749999998,
      "owned_rss_bytes": 490962944,
      "owned_process_count": 4,
      "reclaimable_bytes": 10490019840,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 16.026980542,
      "owned_rss_bytes": 492945408,
      "owned_process_count": 4,
      "reclaimable_bytes": 10488201216,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 16.250926874999998,
      "owned_rss_bytes": 495353856,
      "owned_process_count": 4,
      "reclaimable_bytes": 10485907456,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 16.4816245,
      "owned_rss_bytes": 501907456,
      "owned_process_count": 4,
      "reclaimable_bytes": 10479632384,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 16.711475791999998,
      "owned_rss_bytes": 505413632,
      "owned_process_count": 4,
      "reclaimable_bytes": 10473062400,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 16.941047125,
      "owned_rss_bytes": 506134528,
      "owned_process_count": 4,
      "reclaimable_bytes": 10474110976,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 17.16854625,
      "owned_rss_bytes": 506298368,
      "owned_process_count": 4,
      "reclaimable_bytes": 10390388736,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 17.393836667,
      "owned_rss_bytes": 506970112,
      "owned_process_count": 4,
      "reclaimable_bytes": 10392059904,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 17.622508666999998,
      "owned_rss_bytes": 507658240,
      "owned_process_count": 4,
      "reclaimable_bytes": 10394238976,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 17.8485455,
      "owned_rss_bytes": 508149760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10390011904,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 18.079466375,
      "owned_rss_bytes": 509181952,
      "owned_process_count": 4,
      "reclaimable_bytes": 10394271744,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 18.308791083,
      "owned_rss_bytes": 509870080,
      "owned_process_count": 4,
      "reclaimable_bytes": 10393763840,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 18.537957625,
      "owned_rss_bytes": 510787584,
      "owned_process_count": 4,
      "reclaimable_bytes": 10391191552,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 18.764838208,
      "owned_rss_bytes": 510853120,
      "owned_process_count": 4,
      "reclaimable_bytes": 10368155648,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 18.997788542,
      "owned_rss_bytes": 511033344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10239508480,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 19.233629583,
      "owned_rss_bytes": 511148032,
      "owned_process_count": 4,
      "reclaimable_bytes": 10086662144,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 19.469351375,
      "owned_rss_bytes": 529006592,
      "owned_process_count": 4,
      "reclaimable_bytes": 10003365888,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 19.702161916999998,
      "owned_rss_bytes": 628490240,
      "owned_process_count": 4,
      "reclaimable_bytes": 10343727104,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 19.93807525,
      "owned_rss_bytes": 241729536,
      "owned_process_count": 4,
      "reclaimable_bytes": 10159783936,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 20.166044707999998,
      "owned_rss_bytes": 305135616,
      "owned_process_count": 4,
      "reclaimable_bytes": 10195124224,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 20.394056792,
      "owned_rss_bytes": 326418432,
      "owned_process_count": 4,
      "reclaimable_bytes": 10102865920,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 20.626879792,
      "owned_rss_bytes": 354664448,
      "owned_process_count": 4,
      "reclaimable_bytes": 10117775360,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 20.862278832999998,
      "owned_rss_bytes": 387465216,
      "owned_process_count": 4,
      "reclaimable_bytes": 10001399808,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 21.093869208,
      "owned_rss_bytes": 412696576,
      "owned_process_count": 4,
      "reclaimable_bytes": 9895280640,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 21.32549325,
      "owned_rss_bytes": 429719552,
      "owned_process_count": 4,
      "reclaimable_bytes": 9924493312,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 21.558641166999998,
      "owned_rss_bytes": 457392128,
      "owned_process_count": 4,
      "reclaimable_bytes": 9834168320,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 21.787931375,
      "owned_rss_bytes": 479985664,
      "owned_process_count": 4,
      "reclaimable_bytes": 9934831616,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 22.015794167,
      "owned_rss_bytes": 485294080,
      "owned_process_count": 4,
      "reclaimable_bytes": 9935831040,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 22.247927083,
      "owned_rss_bytes": 501153792,
      "owned_process_count": 4,
      "reclaimable_bytes": 9914318848,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 22.476739792,
      "owned_rss_bytes": 519569408,
      "owned_process_count": 4,
      "reclaimable_bytes": 9894100992,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 22.706700667,
      "owned_rss_bytes": 533053440,
      "owned_process_count": 4,
      "reclaimable_bytes": 9872080896,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 22.93548325,
      "owned_rss_bytes": 545357824,
      "owned_process_count": 4,
      "reclaimable_bytes": 10012344320,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 23.166007792,
      "owned_rss_bytes": 563822592,
      "owned_process_count": 4,
      "reclaimable_bytes": 9980035072,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 23.397085125,
      "owned_rss_bytes": 565886976,
      "owned_process_count": 4,
      "reclaimable_bytes": 9977593856,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 23.627138458,
      "owned_rss_bytes": 574914560,
      "owned_process_count": 4,
      "reclaimable_bytes": 9983508480,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 23.857677833,
      "owned_rss_bytes": 595050496,
      "owned_process_count": 4,
      "reclaimable_bytes": 9949315072,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 24.087953583,
      "owned_rss_bytes": 609239040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10092691456,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 24.318213083,
      "owned_rss_bytes": 617758720,
      "owned_process_count": 4,
      "reclaimable_bytes": 10083057664,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 24.543429458,
      "owned_rss_bytes": 631128064,
      "owned_process_count": 4,
      "reclaimable_bytes": 10067230720,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 24.773519874999998,
      "owned_rss_bytes": 650887168,
      "owned_process_count": 4,
      "reclaimable_bytes": 10054221824,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 25.00201275,
      "owned_rss_bytes": 656834560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10046652416,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 25.233142792,
      "owned_rss_bytes": 656850944,
      "owned_process_count": 4,
      "reclaimable_bytes": 10044997632,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 25.461765042,
      "owned_rss_bytes": 656867328,
      "owned_process_count": 4,
      "reclaimable_bytes": 10041163776,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 25.690042166999998,
      "owned_rss_bytes": 655785984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10040262656,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 25.920535167,
      "owned_rss_bytes": 656785408,
      "owned_process_count": 4,
      "reclaimable_bytes": 10038525952,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 26.15051775,
      "owned_rss_bytes": 658046976,
      "owned_process_count": 4,
      "reclaimable_bytes": 10102620160,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 26.377068542,
      "owned_rss_bytes": 658374656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10105798656,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 26.606372083,
      "owned_rss_bytes": 659259392,
      "owned_process_count": 4,
      "reclaimable_bytes": 10111680512,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 26.836823042,
      "owned_rss_bytes": 730152960,
      "owned_process_count": 4,
      "reclaimable_bytes": 10039312384,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 27.067519042,
      "owned_rss_bytes": 835911680,
      "owned_process_count": 4,
      "reclaimable_bytes": 9929932800,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 27.293796583,
      "owned_rss_bytes": 221478912,
      "owned_process_count": 4,
      "reclaimable_bytes": 10622418944,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 27.523842542,
      "owned_rss_bytes": 239943680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10608508928,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 27.751805958,
      "owned_rss_bytes": 319127552,
      "owned_process_count": 4,
      "reclaimable_bytes": 10568843264,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 27.981505291999998,
      "owned_rss_bytes": 364478464,
      "owned_process_count": 4,
      "reclaimable_bytes": 10542235648,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 28.210146207999998,
      "owned_rss_bytes": 390905856,
      "owned_process_count": 4,
      "reclaimable_bytes": 10518577152,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 28.437924583,
      "owned_rss_bytes": 411336704,
      "owned_process_count": 4,
      "reclaimable_bytes": 10496376832,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 28.667086542,
      "owned_rss_bytes": 421625856,
      "owned_process_count": 4,
      "reclaimable_bytes": 10493181952,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 28.896669875,
      "owned_rss_bytes": 426049536,
      "owned_process_count": 4,
      "reclaimable_bytes": 10485727232,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 29.123932916999998,
      "owned_rss_bytes": 428802048,
      "owned_process_count": 4,
      "reclaimable_bytes": 10486562816,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 29.353430292,
      "owned_rss_bytes": 437108736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10472259584,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 29.583035792,
      "owned_rss_bytes": 144326656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10639687680,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 29.810675874999998,
      "owned_rss_bytes": 323977216,
      "owned_process_count": 4,
      "reclaimable_bytes": 10377723904,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 30.041075333,
      "owned_rss_bytes": 367902720,
      "owned_process_count": 4,
      "reclaimable_bytes": 10341859328,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 30.268163041999998,
      "owned_rss_bytes": 392445952,
      "owned_process_count": 4,
      "reclaimable_bytes": 10325590016,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 30.498776666999998,
      "owned_rss_bytes": 412925952,
      "owned_process_count": 4,
      "reclaimable_bytes": 10303553536,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 30.725236542,
      "owned_rss_bytes": 435044352,
      "owned_process_count": 4,
      "reclaimable_bytes": 10281041920,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 30.954994792,
      "owned_rss_bytes": 454705152,
      "owned_process_count": 4,
      "reclaimable_bytes": 10428268544,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 31.184182292,
      "owned_rss_bytes": 458522624,
      "owned_process_count": 4,
      "reclaimable_bytes": 10419650560,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 31.412915125,
      "owned_rss_bytes": 467189760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10410033152,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 31.643436708,
      "owned_rss_bytes": 467222528,
      "owned_process_count": 4,
      "reclaimable_bytes": 10427777024,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 31.868780167,
      "owned_rss_bytes": 467795968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10426826752,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 32.098652542,
      "owned_rss_bytes": 471711744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10409476096,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 32.329589583,
      "owned_rss_bytes": 474185728,
      "owned_process_count": 4,
      "reclaimable_bytes": 10409410560,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 32.557421958000006,
      "owned_rss_bytes": 474447872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10403119104,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 32.787701125000005,
      "owned_rss_bytes": 474562560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10404544512,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 33.017943,
      "owned_rss_bytes": 512458752,
      "owned_process_count": 4,
      "reclaimable_bytes": 10363928576,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 33.248422375000004,
      "owned_rss_bytes": 242466816,
      "owned_process_count": 4,
      "reclaimable_bytes": 10590781440,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 33.478639667,
      "owned_rss_bytes": 290979840,
      "owned_process_count": 4,
      "reclaimable_bytes": 10566221824,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 33.706646000000006,
      "owned_rss_bytes": 308854784,
      "owned_process_count": 4,
      "reclaimable_bytes": 10547691520,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 33.936584583000005,
      "owned_rss_bytes": 339378176,
      "owned_process_count": 4,
      "reclaimable_bytes": 10515382272,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 34.166861667000006,
      "owned_rss_bytes": 382025728,
      "owned_process_count": 4,
      "reclaimable_bytes": 10467868672,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 34.397502917000004,
      "owned_rss_bytes": 432324608,
      "owned_process_count": 4,
      "reclaimable_bytes": 10436165632,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 34.626762292,
      "owned_rss_bytes": 432422912,
      "owned_process_count": 4,
      "reclaimable_bytes": 10433921024,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 34.857480667000004,
      "owned_rss_bytes": 432570368,
      "owned_process_count": 4,
      "reclaimable_bytes": 10432790528,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 35.083301208,
      "owned_rss_bytes": 434257920,
      "owned_process_count": 4,
      "reclaimable_bytes": 10435133440,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 35.308893875,
      "owned_rss_bytes": 446889984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10423287808,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 35.539121833,
      "owned_rss_bytes": 461455360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10409541632,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 35.767066583,
      "owned_rss_bytes": 468484096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10401972224,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 35.993955042,
      "owned_rss_bytes": 486309888,
      "owned_process_count": 4,
      "reclaimable_bytes": 10384785408,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 36.22045225,
      "owned_rss_bytes": 501399552,
      "owned_process_count": 4,
      "reclaimable_bytes": 10286956544,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 36.447329,
      "owned_rss_bytes": 522289152,
      "owned_process_count": 4,
      "reclaimable_bytes": 10492395520,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 36.677213375,
      "owned_rss_bytes": 536395776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10471096320,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 36.907327083000006,
      "owned_rss_bytes": 555663360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10266525696,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 37.138021875,
      "owned_rss_bytes": 556531712,
      "owned_process_count": 4,
      "reclaimable_bytes": 10265493504,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 37.365457667,
      "owned_rss_bytes": 557301760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10259611648,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 37.593604458,
      "owned_rss_bytes": 559464448,
      "owned_process_count": 4,
      "reclaimable_bytes": 10257678336,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 37.81971,
      "owned_rss_bytes": 562823168,
      "owned_process_count": 4,
      "reclaimable_bytes": 10148806656,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 38.049189125000005,
      "owned_rss_bytes": 568262656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10143006720,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 38.277859583,
      "owned_rss_bytes": 572358656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10146955264,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 38.509652375,
      "owned_rss_bytes": 572620800,
      "owned_process_count": 4,
      "reclaimable_bytes": 10147119104,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 38.738409625,
      "owned_rss_bytes": 572948480,
      "owned_process_count": 4,
      "reclaimable_bytes": 10138927104,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 38.967264583,
      "owned_rss_bytes": 573538304,
      "owned_process_count": 4,
      "reclaimable_bytes": 10135240704,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 39.197716292,
      "owned_rss_bytes": 574373888,
      "owned_process_count": 4,
      "reclaimable_bytes": 10134388736,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 39.423169125,
      "owned_rss_bytes": 574930944,
      "owned_process_count": 4,
      "reclaimable_bytes": 10130309120,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 39.651755417000004,
      "owned_rss_bytes": 654688256,
      "owned_process_count": 4,
      "reclaimable_bytes": 10039328768,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 39.88161275,
      "owned_rss_bytes": 211615744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10422403072,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 40.112382375,
      "owned_rss_bytes": 326598656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10372857856,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 40.340654,
      "owned_rss_bytes": 104628224,
      "owned_process_count": 3,
      "reclaimable_bytes": 10455711744,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 40.571858417,
      "owned_rss_bytes": 246054912,
      "owned_process_count": 4,
      "reclaimable_bytes": 10418864128,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 40.799704333,
      "owned_rss_bytes": 272793600,
      "owned_process_count": 4,
      "reclaimable_bytes": 10400907264,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 41.030132125,
      "owned_rss_bytes": 280936448,
      "owned_process_count": 4,
      "reclaimable_bytes": 10394320896,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 41.259785542,
      "owned_rss_bytes": 290439168,
      "owned_process_count": 4,
      "reclaimable_bytes": 10380984320,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 41.489985083,
      "owned_rss_bytes": 309575680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10457432064,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 41.718814917,
      "owned_rss_bytes": 333037568,
      "owned_process_count": 4,
      "reclaimable_bytes": 10447896576,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 41.943399625000005,
      "owned_rss_bytes": 351272960,
      "owned_process_count": 4,
      "reclaimable_bytes": 10601005056,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 42.169148542,
      "owned_rss_bytes": 373112832,
      "owned_process_count": 4,
      "reclaimable_bytes": 10407002112,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 42.400367292000006,
      "owned_rss_bytes": 388218880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10394648576,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 42.625240208,
      "owned_rss_bytes": 395837440,
      "owned_process_count": 4,
      "reclaimable_bytes": 10387456000,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 42.854893333,
      "owned_rss_bytes": 399818752,
      "owned_process_count": 4,
      "reclaimable_bytes": 10374823936,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 43.084548792,
      "owned_rss_bytes": 401539072,
      "owned_process_count": 4,
      "reclaimable_bytes": 10374856704,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 43.315367,
      "owned_rss_bytes": 402030592,
      "owned_process_count": 4,
      "reclaimable_bytes": 10368827392,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 43.541017042,
      "owned_rss_bytes": 402374656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10373332992,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 43.771475042000006,
      "owned_rss_bytes": 134742016,
      "owned_process_count": 3,
      "reclaimable_bytes": 10542055424,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 43.999587042,
      "owned_rss_bytes": 329891840,
      "owned_process_count": 4,
      "reclaimable_bytes": 10452598784,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 44.229520208000004,
      "owned_rss_bytes": 354582528,
      "owned_process_count": 4,
      "reclaimable_bytes": 10440032256,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 44.460500083,
      "owned_rss_bytes": 116506624,
      "owned_process_count": 3,
      "reclaimable_bytes": 10543497216,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 44.685366458000004,
      "owned_rss_bytes": 208764928,
      "owned_process_count": 4,
      "reclaimable_bytes": 10518331392,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 44.916151292,
      "owned_rss_bytes": 241696768,
      "owned_process_count": 4,
      "reclaimable_bytes": 10396942336,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 45.148427833,
      "owned_rss_bytes": 200949760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10583310336,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 45.3759795,
      "owned_rss_bytes": 309739520,
      "owned_process_count": 4,
      "reclaimable_bytes": 10529406976,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 45.607344417,
      "owned_rss_bytes": 333987840,
      "owned_process_count": 4,
      "reclaimable_bytes": 10528604160,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 45.833036833,
      "owned_rss_bytes": 349585408,
      "owned_process_count": 4,
      "reclaimable_bytes": 10514513920,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 46.062437625,
      "owned_rss_bytes": 357269504,
      "owned_process_count": 4,
      "reclaimable_bytes": 10512908288,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 46.291556583,
      "owned_rss_bytes": 362741760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10508058624,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 46.521524208,
      "owned_rss_bytes": 368623616,
      "owned_process_count": 4,
      "reclaimable_bytes": 10503159808,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 46.747677292000006,
      "owned_rss_bytes": 374833152,
      "owned_process_count": 4,
      "reclaimable_bytes": 10490871808,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 46.973415708000005,
      "owned_rss_bytes": 380993536,
      "owned_process_count": 4,
      "reclaimable_bytes": 10485727232,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 47.203128875000004,
      "owned_rss_bytes": 387055616,
      "owned_process_count": 4,
      "reclaimable_bytes": 10569908224,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 47.429337083,
      "owned_rss_bytes": 393461760,
      "owned_process_count": 4,
      "reclaimable_bytes": 10562371584,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 47.658921,
      "owned_rss_bytes": 399523840,
      "owned_process_count": 4,
      "reclaimable_bytes": 10618585088,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 47.887888292,
      "owned_rss_bytes": 406224896,
      "owned_process_count": 4,
      "reclaimable_bytes": 10610851840,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 48.118400917,
      "owned_rss_bytes": 412041216,
      "owned_process_count": 4,
      "reclaimable_bytes": 10607656960,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 48.347148000000004,
      "owned_rss_bytes": 418660352,
      "owned_process_count": 4,
      "reclaimable_bytes": 10597892096,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 48.577929833000006,
      "owned_rss_bytes": 422903808,
      "owned_process_count": 4,
      "reclaimable_bytes": 10589241344,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 48.8066905,
      "owned_rss_bytes": 425492480,
      "owned_process_count": 4,
      "reclaimable_bytes": 10597072896,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 49.0377055,
      "owned_rss_bytes": 427524096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10597957632,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 49.266635667,
      "owned_rss_bytes": 428326912,
      "owned_process_count": 4,
      "reclaimable_bytes": 10594271232,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 49.49553275,
      "owned_rss_bytes": 428457984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10590978048,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 49.724847958000005,
      "owned_rss_bytes": 428539904,
      "owned_process_count": 4,
      "reclaimable_bytes": 10590175232,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 49.954301333000004,
      "owned_rss_bytes": 430473216,
      "owned_process_count": 4,
      "reclaimable_bytes": 10591207424,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 50.183197917,
      "owned_rss_bytes": 432226304,
      "owned_process_count": 4,
      "reclaimable_bytes": 10585554944,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 50.412340125,
      "owned_rss_bytes": 438910976,
      "owned_process_count": 4,
      "reclaimable_bytes": 10575265792,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 50.643264875,
      "owned_rss_bytes": 470106112,
      "owned_process_count": 4,
      "reclaimable_bytes": 10541219840,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 50.873381667000004,
      "owned_rss_bytes": 497172480,
      "owned_process_count": 4,
      "reclaimable_bytes": 10515906560,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 51.099708250000006,
      "owned_rss_bytes": 559300608,
      "owned_process_count": 4,
      "reclaimable_bytes": 10448437248,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 51.325331750000004,
      "owned_rss_bytes": 636321792,
      "owned_process_count": 4,
      "reclaimable_bytes": 10393075712,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 51.556132708,
      "owned_rss_bytes": 636452864,
      "owned_process_count": 4,
      "reclaimable_bytes": 10389798912,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 51.781017250000005,
      "owned_rss_bytes": 636534784,
      "owned_process_count": 4,
      "reclaimable_bytes": 10294149120,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 52.006791,
      "owned_rss_bytes": 636747776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10287333376,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 52.235850708,
      "owned_rss_bytes": 636747776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10204315648,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 52.462289667,
      "owned_rss_bytes": 636747776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10204430336,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 52.690649917,
      "owned_rss_bytes": 636764160,
      "owned_process_count": 4,
      "reclaimable_bytes": 10198286336,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 52.921214708,
      "owned_rss_bytes": 636764160,
      "owned_process_count": 4,
      "reclaimable_bytes": 10197811200,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 53.151478125000004,
      "owned_rss_bytes": 639057920,
      "owned_process_count": 4,
      "reclaimable_bytes": 10195304448,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 53.382161083,
      "owned_rss_bytes": 640516096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10194321408,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 53.612569833,
      "owned_rss_bytes": 646152192,
      "owned_process_count": 4,
      "reclaimable_bytes": 10193846272,
      "swapins": 44109441,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 53.840659167000005,
      "owned_rss_bytes": 656736256,
      "owned_process_count": 4,
      "reclaimable_bytes": 10181640192,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 54.069720875,
      "owned_rss_bytes": 670236672,
      "owned_process_count": 4,
      "reclaimable_bytes": 10168811520,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 54.301678125,
      "owned_rss_bytes": 681508864,
      "owned_process_count": 4,
      "reclaimable_bytes": 9953591296,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 54.533224125000004,
      "owned_rss_bytes": 690077696,
      "owned_process_count": 4,
      "reclaimable_bytes": 9937403904,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 54.763276875,
      "owned_rss_bytes": 698974208,
      "owned_process_count": 4,
      "reclaimable_bytes": 9930096640,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 54.992542292,
      "owned_rss_bytes": 704937984,
      "owned_process_count": 4,
      "reclaimable_bytes": 9925181440,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 55.22323325,
      "owned_rss_bytes": 722223104,
      "owned_process_count": 4,
      "reclaimable_bytes": 10081419264,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 55.454027333000006,
      "owned_rss_bytes": 731496448,
      "owned_process_count": 4,
      "reclaimable_bytes": 10162208768,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 55.681228667000006,
      "owned_rss_bytes": 744620032,
      "owned_process_count": 4,
      "reclaimable_bytes": 10180706304,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 55.910540875,
      "owned_rss_bytes": 753156096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10172006400,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 56.138879208000006,
      "owned_rss_bytes": 766345216,
      "owned_process_count": 4,
      "reclaimable_bytes": 10163929088,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 56.364260958,
      "owned_rss_bytes": 775946240,
      "owned_process_count": 4,
      "reclaimable_bytes": 10077962240,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 56.596095500000004,
      "owned_rss_bytes": 786448384,
      "owned_process_count": 4,
      "reclaimable_bytes": 10068754432,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 56.826412792000006,
      "owned_rss_bytes": 792559616,
      "owned_process_count": 4,
      "reclaimable_bytes": 10055958528,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 57.0564395,
      "owned_rss_bytes": 795574272,
      "owned_process_count": 4,
      "reclaimable_bytes": 10053124096,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 57.284947208000006,
      "owned_rss_bytes": 804126720,
      "owned_process_count": 4,
      "reclaimable_bytes": 9954361344,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 57.515397458,
      "owned_rss_bytes": 818036736,
      "owned_process_count": 4,
      "reclaimable_bytes": 9841131520,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 57.750034083,
      "owned_rss_bytes": 827228160,
      "owned_process_count": 4,
      "reclaimable_bytes": 10352312320,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 57.97957075,
      "owned_rss_bytes": 842678272,
      "owned_process_count": 4,
      "reclaimable_bytes": 10342924288,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 58.208953792,
      "owned_rss_bytes": 845971456,
      "owned_process_count": 4,
      "reclaimable_bytes": 10337878016,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 58.437751667,
      "owned_rss_bytes": 854114304,
      "owned_process_count": 4,
      "reclaimable_bytes": 10336223232,
      "swapins": 44109445,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 58.667039958000004,
      "owned_rss_bytes": 865026048,
      "owned_process_count": 4,
      "reclaimable_bytes": 10326097920,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 58.897152000000006,
      "owned_rss_bytes": 872284160,
      "owned_process_count": 4,
      "reclaimable_bytes": 10324819968,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 59.127158375,
      "owned_rss_bytes": 872857600,
      "owned_process_count": 4,
      "reclaimable_bytes": 10317250560,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 59.358028833000006,
      "owned_rss_bytes": 872939520,
      "owned_process_count": 4,
      "reclaimable_bytes": 10291593216,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 59.585864667,
      "owned_rss_bytes": 881934336,
      "owned_process_count": 4,
      "reclaimable_bytes": 10274537472,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 59.81638825,
      "owned_rss_bytes": 882556928,
      "owned_process_count": 4,
      "reclaimable_bytes": 10271539200,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 60.045595292,
      "owned_rss_bytes": 885571584,
      "owned_process_count": 4,
      "reclaimable_bytes": 10264379392,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 60.275266333000005,
      "owned_rss_bytes": 886865920,
      "owned_process_count": 4,
      "reclaimable_bytes": 10271293440,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 60.499385917000005,
      "owned_rss_bytes": 888766464,
      "owned_process_count": 4,
      "reclaimable_bytes": 10270900224,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 60.728969917,
      "owned_rss_bytes": 889667584,
      "owned_process_count": 4,
      "reclaimable_bytes": 10450632704,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 60.957820667,
      "owned_rss_bytes": 891568128,
      "owned_process_count": 4,
      "reclaimable_bytes": 10583638016,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 61.190500208,
      "owned_rss_bytes": 898088960,
      "owned_process_count": 4,
      "reclaimable_bytes": 10624008192,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 61.420411417000004,
      "owned_rss_bytes": 899710976,
      "owned_process_count": 4,
      "reclaimable_bytes": 10577330176,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 61.651576667,
      "owned_rss_bytes": 901791744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10555179008,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 61.881492708,
      "owned_rss_bytes": 902987776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10636509184,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 62.111073333,
      "owned_rss_bytes": 905396224,
      "owned_process_count": 4,
      "reclaimable_bytes": 10627989504,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 62.339042625000005,
      "owned_rss_bytes": 906821632,
      "owned_process_count": 4,
      "reclaimable_bytes": 10622091264,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 62.569357083,
      "owned_rss_bytes": 908460032,
      "owned_process_count": 4,
      "reclaimable_bytes": 10667900928,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 62.798257875000004,
      "owned_rss_bytes": 910458880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10679599104,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 63.024691208,
      "owned_rss_bytes": 911097856,
      "owned_process_count": 4,
      "reclaimable_bytes": 10691837952,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 63.2553575,
      "owned_rss_bytes": 911671296,
      "owned_process_count": 4,
      "reclaimable_bytes": 10688053248,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 63.485170333,
      "owned_rss_bytes": 912064512,
      "owned_process_count": 4,
      "reclaimable_bytes": 10662985728,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 63.71466550000001,
      "owned_rss_bytes": 916766720,
      "owned_process_count": 4,
      "reclaimable_bytes": 10651992064,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 63.9460505,
      "owned_rss_bytes": 926023680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10640965632,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 64.175571,
      "owned_rss_bytes": 927531008,
      "owned_process_count": 4,
      "reclaimable_bytes": 10764075008,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 64.40263179200001,
      "owned_rss_bytes": 932020224,
      "owned_process_count": 4,
      "reclaimable_bytes": 10753032192,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 64.628753708,
      "owned_rss_bytes": 934985728,
      "owned_process_count": 4,
      "reclaimable_bytes": 10721951744,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 64.862580917,
      "owned_rss_bytes": 944406528,
      "owned_process_count": 4,
      "reclaimable_bytes": 10534453248,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 65.093274792,
      "owned_rss_bytes": 954695680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10505289728,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 65.32451075,
      "owned_rss_bytes": 962084864,
      "owned_process_count": 4,
      "reclaimable_bytes": 10511892480,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 65.5511645,
      "owned_rss_bytes": 972963840,
      "owned_process_count": 4,
      "reclaimable_bytes": 10510352384,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 65.78061245800001,
      "owned_rss_bytes": 975994880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10499538944,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 66.00708766700001,
      "owned_rss_bytes": 983302144,
      "owned_process_count": 4,
      "reclaimable_bytes": 10650992640,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 66.236802542,
      "owned_rss_bytes": 986447872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10444898304,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 66.466211042,
      "owned_rss_bytes": 987971584,
      "owned_process_count": 4,
      "reclaimable_bytes": 10444718080,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 66.694420083,
      "owned_rss_bytes": 987987968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10459267072,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 66.92191504200001,
      "owned_rss_bytes": 988020736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10439622656,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 67.150030583,
      "owned_rss_bytes": 988086272,
      "owned_process_count": 4,
      "reclaimable_bytes": 10488922112,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 67.37498625,
      "owned_rss_bytes": 988086272,
      "owned_process_count": 4,
      "reclaimable_bytes": 10481827840,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 67.6002235,
      "owned_rss_bytes": 988102656,
      "owned_process_count": 4,
      "reclaimable_bytes": 10482434048,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 67.829491917,
      "owned_rss_bytes": 988135424,
      "owned_process_count": 4,
      "reclaimable_bytes": 10486251520,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 68.0591905,
      "owned_rss_bytes": 988692480,
      "owned_process_count": 4,
      "reclaimable_bytes": 10601136128,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 68.290100792,
      "owned_rss_bytes": 990134272,
      "owned_process_count": 4,
      "reclaimable_bytes": 10615406592,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 68.520453167,
      "owned_rss_bytes": 990609408,
      "owned_process_count": 4,
      "reclaimable_bytes": 10600775680,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 68.749549792,
      "owned_rss_bytes": 990855168,
      "owned_process_count": 4,
      "reclaimable_bytes": 10604822528,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 68.980297417,
      "owned_rss_bytes": 991510528,
      "owned_process_count": 4,
      "reclaimable_bytes": 10597859328,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 69.210170792,
      "owned_rss_bytes": 991641600,
      "owned_process_count": 4,
      "reclaimable_bytes": 10618503168,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 69.438746167,
      "owned_rss_bytes": 991674368,
      "owned_process_count": 4,
      "reclaimable_bytes": 10606526464,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 69.66866458300001,
      "owned_rss_bytes": 991707136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10605363200,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 69.89866391700001,
      "owned_rss_bytes": 991887360,
      "owned_process_count": 4,
      "reclaimable_bytes": 10423615488,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 70.12401016700001,
      "owned_rss_bytes": 992477184,
      "owned_process_count": 4,
      "reclaimable_bytes": 10424827904,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 70.353205083,
      "owned_rss_bytes": 992559104,
      "owned_process_count": 4,
      "reclaimable_bytes": 10428366848,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 70.583381333,
      "owned_rss_bytes": 992591872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10425581568,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 70.813883542,
      "owned_rss_bytes": 993361920,
      "owned_process_count": 4,
      "reclaimable_bytes": 10420240384,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 71.04388375,
      "owned_rss_bytes": 994164736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10569809920,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 71.270862417,
      "owned_rss_bytes": 994230272,
      "owned_process_count": 4,
      "reclaimable_bytes": 10579787776,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 71.5007925,
      "owned_rss_bytes": 994263040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10663542784,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 71.72726075,
      "owned_rss_bytes": 994295808,
      "owned_process_count": 4,
      "reclaimable_bytes": 10682023936,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 71.962301458,
      "owned_rss_bytes": 994918400,
      "owned_process_count": 4,
      "reclaimable_bytes": 10682433536,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 72.19183575000001,
      "owned_rss_bytes": 995065856,
      "owned_process_count": 4,
      "reclaimable_bytes": 10691690496,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 72.41808950000001,
      "owned_rss_bytes": 995098624,
      "owned_process_count": 4,
      "reclaimable_bytes": 10687889408,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 72.647974625,
      "owned_rss_bytes": 995131392,
      "owned_process_count": 4,
      "reclaimable_bytes": 10683400192,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 72.877623458,
      "owned_rss_bytes": 995180544,
      "owned_process_count": 4,
      "reclaimable_bytes": 10682433536,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 73.10306383300001,
      "owned_rss_bytes": 995180544,
      "owned_process_count": 4,
      "reclaimable_bytes": 10685939712,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 73.332000667,
      "owned_rss_bytes": 995229696,
      "owned_process_count": 4,
      "reclaimable_bytes": 10683203584,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 73.559039833,
      "owned_rss_bytes": 995246080,
      "owned_process_count": 4,
      "reclaimable_bytes": 10682613760,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 73.785280625,
      "owned_rss_bytes": 995540992,
      "owned_process_count": 4,
      "reclaimable_bytes": 10685349888,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 74.015734667,
      "owned_rss_bytes": 995803136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10585030656,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 74.24426700000001,
      "owned_rss_bytes": 1079214080,
      "owned_process_count": 4,
      "reclaimable_bytes": 10496868352,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 74.474602958,
      "owned_rss_bytes": 1217724416,
      "owned_process_count": 4,
      "reclaimable_bytes": 10354049024,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 74.705009292,
      "owned_rss_bytes": 1359167488,
      "owned_process_count": 4,
      "reclaimable_bytes": 10238132224,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 74.94072833300001,
      "owned_rss_bytes": 1378304000,
      "owned_process_count": 4,
      "reclaimable_bytes": 10220961792,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 75.17319570800001,
      "owned_rss_bytes": 1379106816,
      "owned_process_count": 4,
      "reclaimable_bytes": 10220683264,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 75.399720417,
      "owned_rss_bytes": 133496832,
      "owned_process_count": 4,
      "reclaimable_bytes": 11291049984,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 75.627112083,
      "owned_rss_bytes": 251985920,
      "owned_process_count": 4,
      "reclaimable_bytes": 11254366208,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 75.857366875,
      "owned_rss_bytes": 269647872,
      "owned_process_count": 4,
      "reclaimable_bytes": 11236179968,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 76.085819833,
      "owned_rss_bytes": 307134464,
      "owned_process_count": 4,
      "reclaimable_bytes": 11197562880,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 76.31672458300001,
      "owned_rss_bytes": 326205440,
      "owned_process_count": 4,
      "reclaimable_bytes": 10998104064,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 76.547406958,
      "owned_rss_bytes": 348323840,
      "owned_process_count": 4,
      "reclaimable_bytes": 10976051200,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 76.775930875,
      "owned_rss_bytes": 365723648,
      "owned_process_count": 4,
      "reclaimable_bytes": 10961174528,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 77.006547792,
      "owned_rss_bytes": 387760128,
      "owned_process_count": 4,
      "reclaimable_bytes": 10945642496,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 77.24098366700001,
      "owned_rss_bytes": 400736256,
      "owned_process_count": 4,
      "reclaimable_bytes": 10925293568,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 77.469058667,
      "owned_rss_bytes": 417579008,
      "owned_process_count": 4,
      "reclaimable_bytes": 10900193280,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 77.699200875,
      "owned_rss_bytes": 434454528,
      "owned_process_count": 4,
      "reclaimable_bytes": 10985488384,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 77.924022333,
      "owned_rss_bytes": 441991168,
      "owned_process_count": 4,
      "reclaimable_bytes": 10979704832,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 78.15376033300001,
      "owned_rss_bytes": 443973632,
      "owned_process_count": 4,
      "reclaimable_bytes": 10879221760,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 78.381673125,
      "owned_rss_bytes": 446382080,
      "owned_process_count": 4,
      "reclaimable_bytes": 10881105920,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 78.61164391700001,
      "owned_rss_bytes": 452493312,
      "owned_process_count": 4,
      "reclaimable_bytes": 10871603200,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 78.84058191700001,
      "owned_rss_bytes": 455606272,
      "owned_process_count": 4,
      "reclaimable_bytes": 10867195904,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 79.066456333,
      "owned_rss_bytes": 457129984,
      "owned_process_count": 4,
      "reclaimable_bytes": 10938482688,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 79.295484208,
      "owned_rss_bytes": 463601664,
      "owned_process_count": 4,
      "reclaimable_bytes": 10933944320,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 79.52403662500001,
      "owned_rss_bytes": 467173376,
      "owned_process_count": 4,
      "reclaimable_bytes": 10878992384,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 79.754823792,
      "owned_rss_bytes": 467435520,
      "owned_process_count": 4,
      "reclaimable_bytes": 10872389632,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 79.985765708,
      "owned_rss_bytes": 468123648,
      "owned_process_count": 4,
      "reclaimable_bytes": 10875797504,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 80.214496917,
      "owned_rss_bytes": 468746240,
      "owned_process_count": 4,
      "reclaimable_bytes": 10879647744,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 80.44407783300001,
      "owned_rss_bytes": 468893696,
      "owned_process_count": 4,
      "reclaimable_bytes": 10880073728,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 80.67359912500001,
      "owned_rss_bytes": 469204992,
      "owned_process_count": 4,
      "reclaimable_bytes": 10891706368,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 80.899369125,
      "owned_rss_bytes": 482770944,
      "owned_process_count": 4,
      "reclaimable_bytes": 11032428544,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 81.129972208,
      "owned_rss_bytes": 600014848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10926456832,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 81.359931125,
      "owned_rss_bytes": 294404096,
      "owned_process_count": 4,
      "reclaimable_bytes": 11233640448,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 81.590406833,
      "owned_rss_bytes": 308183040,
      "owned_process_count": 4,
      "reclaimable_bytes": 11217993728,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 81.818116833,
      "owned_rss_bytes": 323747840,
      "owned_process_count": 4,
      "reclaimable_bytes": 11222319104,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 82.044440458,
      "owned_rss_bytes": 350846976,
      "owned_process_count": 4,
      "reclaimable_bytes": 11190353920,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 82.275230542,
      "owned_rss_bytes": 374718464,
      "owned_process_count": 4,
      "reclaimable_bytes": 10981031936,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 82.499796208,
      "owned_rss_bytes": 389300224,
      "owned_process_count": 4,
      "reclaimable_bytes": 10975019008,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 82.729537792,
      "owned_rss_bytes": 404570112,
      "owned_process_count": 4,
      "reclaimable_bytes": 11048255488,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 82.956765,
      "owned_rss_bytes": 408141824,
      "owned_process_count": 4,
      "reclaimable_bytes": 11041570816,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 83.185383208,
      "owned_rss_bytes": 408829952,
      "owned_process_count": 4,
      "reclaimable_bytes": 11041275904,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 83.41112504200001,
      "owned_rss_bytes": 411631616,
      "owned_process_count": 4,
      "reclaimable_bytes": 11045044224,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 83.637224083,
      "owned_rss_bytes": 412188672,
      "owned_process_count": 4,
      "reclaimable_bytes": 11044241408,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 83.865213208,
      "owned_rss_bytes": 414728192,
      "owned_process_count": 4,
      "reclaimable_bytes": 11221647360,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 84.090715625,
      "owned_rss_bytes": 420904960,
      "owned_process_count": 4,
      "reclaimable_bytes": 11222220800,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 84.320311125,
      "owned_rss_bytes": 422641664,
      "owned_process_count": 4,
      "reclaimable_bytes": 11224121344,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 84.54853345800001,
      "owned_rss_bytes": 422952960,
      "owned_process_count": 4,
      "reclaimable_bytes": 11231526912,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 84.776422458,
      "owned_rss_bytes": 423264256,
      "owned_process_count": 4,
      "reclaimable_bytes": 11156652032,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 85.004498333,
      "owned_rss_bytes": 424001536,
      "owned_process_count": 4,
      "reclaimable_bytes": 11151294464,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 85.230186833,
      "owned_rss_bytes": 469385216,
      "owned_process_count": 4,
      "reclaimable_bytes": 11106025472,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 85.459363583,
      "owned_rss_bytes": 492011520,
      "owned_process_count": 4,
      "reclaimable_bytes": 11183046656,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 85.68608204200001,
      "owned_rss_bytes": 567541760,
      "owned_process_count": 4,
      "reclaimable_bytes": 11125866496,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 85.914483375,
      "owned_rss_bytes": 568295424,
      "owned_process_count": 4,
      "reclaimable_bytes": 11191566336,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 86.142844833,
      "owned_rss_bytes": 568492032,
      "owned_process_count": 4,
      "reclaimable_bytes": 11191189504,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 86.371737958,
      "owned_rss_bytes": 568639488,
      "owned_process_count": 4,
      "reclaimable_bytes": 10826809344,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 86.59977633300001,
      "owned_rss_bytes": 571604992,
      "owned_process_count": 4,
      "reclaimable_bytes": 10832084992,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 86.82963025000001,
      "owned_rss_bytes": 572669952,
      "owned_process_count": 4,
      "reclaimable_bytes": 10829430784,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 87.058021,
      "owned_rss_bytes": 583663616,
      "owned_process_count": 4,
      "reclaimable_bytes": 10822385664,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 87.28825583300001,
      "owned_rss_bytes": 590626816,
      "owned_process_count": 4,
      "reclaimable_bytes": 10890231808,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 87.517391,
      "owned_rss_bytes": 596836352,
      "owned_process_count": 4,
      "reclaimable_bytes": 10810720256,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 87.746618958,
      "owned_rss_bytes": 607846400,
      "owned_process_count": 4,
      "reclaimable_bytes": 11041996800,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 87.975313125,
      "owned_rss_bytes": 613941248,
      "owned_process_count": 4,
      "reclaimable_bytes": 11033477120,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 88.201728625,
      "owned_rss_bytes": 618037248,
      "owned_process_count": 4,
      "reclaimable_bytes": 11036311552,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 88.426323333,
      "owned_rss_bytes": 623476736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10956144640,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 88.65612725,
      "owned_rss_bytes": 630947840,
      "owned_process_count": 4,
      "reclaimable_bytes": 11231772672,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 88.88059075,
      "owned_rss_bytes": 631095296,
      "owned_process_count": 4,
      "reclaimable_bytes": 11230576640,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 89.10820258300001,
      "owned_rss_bytes": 639975424,
      "owned_process_count": 4,
      "reclaimable_bytes": 11064147968,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 89.337432542,
      "owned_rss_bytes": 642433024,
      "owned_process_count": 4,
      "reclaimable_bytes": 11060510720,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 89.563510167,
      "owned_rss_bytes": 644972544,
      "owned_process_count": 4,
      "reclaimable_bytes": 11055104000,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 89.792229,
      "owned_rss_bytes": 645332992,
      "owned_process_count": 4,
      "reclaimable_bytes": 11051876352,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 90.021312542,
      "owned_rss_bytes": 649478144,
      "owned_process_count": 4,
      "reclaimable_bytes": 11053629440,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 90.24454212500001,
      "owned_rss_bytes": 652476416,
      "owned_process_count": 4,
      "reclaimable_bytes": 11050893312,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 90.473216917,
      "owned_rss_bytes": 657391616,
      "owned_process_count": 4,
      "reclaimable_bytes": 11124523008,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 90.701679958,
      "owned_rss_bytes": 659423232,
      "owned_process_count": 4,
      "reclaimable_bytes": 11128995840,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 90.931163,
      "owned_rss_bytes": 662110208,
      "owned_process_count": 4,
      "reclaimable_bytes": 11119312896,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 91.160580667,
      "owned_rss_bytes": 664944640,
      "owned_process_count": 4,
      "reclaimable_bytes": 11123949568,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 91.389610542,
      "owned_rss_bytes": 668925952,
      "owned_process_count": 4,
      "reclaimable_bytes": 11117772800,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 91.61644,
      "owned_rss_bytes": 670121984,
      "owned_process_count": 4,
      "reclaimable_bytes": 11119165440,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 91.845943833,
      "owned_rss_bytes": 673382400,
      "owned_process_count": 4,
      "reclaimable_bytes": 11111022592,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 92.075308083,
      "owned_rss_bytes": 675708928,
      "owned_process_count": 4,
      "reclaimable_bytes": 11112775680,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 92.30283325,
      "owned_rss_bytes": 676397056,
      "owned_process_count": 4,
      "reclaimable_bytes": 11115053056,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 92.531415458,
      "owned_rss_bytes": 678756352,
      "owned_process_count": 4,
      "reclaimable_bytes": 11111743488,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 92.760412083,
      "owned_rss_bytes": 681132032,
      "owned_process_count": 4,
      "reclaimable_bytes": 11114528768,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 92.989273208,
      "owned_rss_bytes": 681443328,
      "owned_process_count": 4,
      "reclaimable_bytes": 11110449152,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 93.219022458,
      "owned_rss_bytes": 684310528,
      "owned_process_count": 4,
      "reclaimable_bytes": 11109875712,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 93.447587833,
      "owned_rss_bytes": 686784512,
      "owned_process_count": 4,
      "reclaimable_bytes": 11111399424,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 93.676211458,
      "owned_rss_bytes": 689258496,
      "owned_process_count": 4,
      "reclaimable_bytes": 11104288768,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 93.905146292,
      "owned_rss_bytes": 689340416,
      "owned_process_count": 4,
      "reclaimable_bytes": 11107074048,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 94.130592875,
      "owned_rss_bytes": 696238080,
      "owned_process_count": 4,
      "reclaimable_bytes": 11135008768,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 94.35840887500001,
      "owned_rss_bytes": 697008128,
      "owned_process_count": 4,
      "reclaimable_bytes": 11130650624,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 94.584101167,
      "owned_rss_bytes": 705495040,
      "owned_process_count": 4,
      "reclaimable_bytes": 11118346240,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 94.81366308300001,
      "owned_rss_bytes": 707084288,
      "owned_process_count": 4,
      "reclaimable_bytes": 11112628224,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 95.04332404200001,
      "owned_rss_bytes": 711426048,
      "owned_process_count": 4,
      "reclaimable_bytes": 11054907392,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 95.276892708,
      "owned_rss_bytes": 711933952,
      "owned_process_count": 4,
      "reclaimable_bytes": 9943367680,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 95.51104550000001,
      "owned_rss_bytes": 713670656,
      "owned_process_count": 4,
      "reclaimable_bytes": 9795633152,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 95.743562583,
      "owned_rss_bytes": 714801152,
      "owned_process_count": 4,
      "reclaimable_bytes": 9782919168,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 95.973573875,
      "owned_rss_bytes": 715816960,
      "owned_process_count": 4,
      "reclaimable_bytes": 9831170048,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 96.20446295800001,
      "owned_rss_bytes": 718422016,
      "owned_process_count": 4,
      "reclaimable_bytes": 9817423872,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 96.437175542,
      "owned_rss_bytes": 719290368,
      "owned_process_count": 4,
      "reclaimable_bytes": 9822617600,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 96.669193542,
      "owned_rss_bytes": 719683584,
      "owned_process_count": 4,
      "reclaimable_bytes": 9643114496,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 96.895687833,
      "owned_rss_bytes": 721141760,
      "owned_process_count": 4,
      "reclaimable_bytes": 9690300416,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 97.12761020800001,
      "owned_rss_bytes": 721829888,
      "owned_process_count": 4,
      "reclaimable_bytes": 9653583872,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 97.358412583,
      "owned_rss_bytes": 721928192,
      "owned_process_count": 4,
      "reclaimable_bytes": 9619275776,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 97.589111583,
      "owned_rss_bytes": 722452480,
      "owned_process_count": 4,
      "reclaimable_bytes": 9778216960,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 97.81800320800001,
      "owned_rss_bytes": 722976768,
      "owned_process_count": 4,
      "reclaimable_bytes": 9794846720,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 98.04984779200001,
      "owned_rss_bytes": 725303296,
      "owned_process_count": 4,
      "reclaimable_bytes": 9780133888,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 98.282339792,
      "owned_rss_bytes": 725630976,
      "owned_process_count": 4,
      "reclaimable_bytes": 9779986432,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 98.513504375,
      "owned_rss_bytes": 725745664,
      "owned_process_count": 4,
      "reclaimable_bytes": 9771483136,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 98.741915375,
      "owned_rss_bytes": 725778432,
      "owned_process_count": 4,
      "reclaimable_bytes": 9770123264,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 98.972942167,
      "owned_rss_bytes": 730284032,
      "owned_process_count": 4,
      "reclaimable_bytes": 9761193984,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 99.199755708,
      "owned_rss_bytes": 731217920,
      "owned_process_count": 4,
      "reclaimable_bytes": 9765863424,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 99.43131587500001,
      "owned_rss_bytes": 731250688,
      "owned_process_count": 4,
      "reclaimable_bytes": 9769893888,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 99.66282833300001,
      "owned_rss_bytes": 736837632,
      "owned_process_count": 4,
      "reclaimable_bytes": 9766436864,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 99.88967525,
      "owned_rss_bytes": 739131392,
      "owned_process_count": 4,
      "reclaimable_bytes": 9758572544,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 100.11798229200001,
      "owned_rss_bytes": 740900864,
      "owned_process_count": 4,
      "reclaimable_bytes": 9750364160,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 100.347920875,
      "owned_rss_bytes": 741097472,
      "owned_process_count": 4,
      "reclaimable_bytes": 9760243712,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 100.579708208,
      "owned_rss_bytes": 741179392,
      "owned_process_count": 4,
      "reclaimable_bytes": 9758212096,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 100.80864025,
      "owned_rss_bytes": 741900288,
      "owned_process_count": 4,
      "reclaimable_bytes": 9762619392,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 101.038643542,
      "owned_rss_bytes": 741900288,
      "owned_process_count": 4,
      "reclaimable_bytes": 9754607616,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 101.27069420800001,
      "owned_rss_bytes": 741900288,
      "owned_process_count": 4,
      "reclaimable_bytes": 9756213248,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 101.50160541700001,
      "owned_rss_bytes": 744505344,
      "owned_process_count": 4,
      "reclaimable_bytes": 9756835840,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 101.73350304200001,
      "owned_rss_bytes": 744931328,
      "owned_process_count": 4,
      "reclaimable_bytes": 9759211520,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 101.965962458,
      "owned_rss_bytes": 745537536,
      "owned_process_count": 4,
      "reclaimable_bytes": 9749315584,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 102.194407458,
      "owned_rss_bytes": 745537536,
      "owned_process_count": 4,
      "reclaimable_bytes": 9755312128,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 102.426603167,
      "owned_rss_bytes": 745537536,
      "owned_process_count": 4,
      "reclaimable_bytes": 9754689536,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 102.657797542,
      "owned_rss_bytes": 745537536,
      "owned_process_count": 4,
      "reclaimable_bytes": 9757573120,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 102.886137375,
      "owned_rss_bytes": 745996288,
      "owned_process_count": 4,
      "reclaimable_bytes": 9756639232,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 103.116463042,
      "owned_rss_bytes": 747175936,
      "owned_process_count": 4,
      "reclaimable_bytes": 9754656768,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 103.347368167,
      "owned_rss_bytes": 749862912,
      "owned_process_count": 4,
      "reclaimable_bytes": 9751511040,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 103.575039292,
      "owned_rss_bytes": 757071872,
      "owned_process_count": 4,
      "reclaimable_bytes": 9742270464,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 103.807406458,
      "owned_rss_bytes": 759054336,
      "owned_process_count": 4,
      "reclaimable_bytes": 9746432000,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 104.037802458,
      "owned_rss_bytes": 759054336,
      "owned_process_count": 4,
      "reclaimable_bytes": 9743450112,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 104.269285167,
      "owned_rss_bytes": 759250944,
      "owned_process_count": 4,
      "reclaimable_bytes": 9832415232,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 104.497615042,
      "owned_rss_bytes": 759250944,
      "owned_process_count": 4,
      "reclaimable_bytes": 9831972864,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 104.72894195800001,
      "owned_rss_bytes": 760102912,
      "owned_process_count": 4,
      "reclaimable_bytes": 9840263168,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 104.960064,
      "owned_rss_bytes": 760315904,
      "owned_process_count": 4,
      "reclaimable_bytes": 9844785152,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 105.18828987500001,
      "owned_rss_bytes": 761184256,
      "owned_process_count": 4,
      "reclaimable_bytes": 9841573888,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 105.420088,
      "owned_rss_bytes": 761200640,
      "owned_process_count": 4,
      "reclaimable_bytes": 9843441664,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 105.651482042,
      "owned_rss_bytes": 761200640,
      "owned_process_count": 4,
      "reclaimable_bytes": 9844047872,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 105.883566833,
      "owned_rss_bytes": 761856000,
      "owned_process_count": 4,
      "reclaimable_bytes": 9839214592,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 106.114842542,
      "owned_rss_bytes": 762478592,
      "owned_process_count": 4,
      "reclaimable_bytes": 9841295360,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 106.345606708,
      "owned_rss_bytes": 762658816,
      "owned_process_count": 4,
      "reclaimable_bytes": 9834889216,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 106.576276667,
      "owned_rss_bytes": 763461632,
      "owned_process_count": 4,
      "reclaimable_bytes": 9833431040,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 106.80785129200001,
      "owned_rss_bytes": 765214720,
      "owned_process_count": 4,
      "reclaimable_bytes": 9837248512,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 107.035610833,
      "owned_rss_bytes": 788086784,
      "owned_process_count": 4,
      "reclaimable_bytes": 9816358912,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 107.265262542,
      "owned_rss_bytes": 791855104,
      "owned_process_count": 4,
      "reclaimable_bytes": 9808101376,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 107.494807875,
      "owned_rss_bytes": 791904256,
      "owned_process_count": 4,
      "reclaimable_bytes": 9808232448,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 107.72576525000001,
      "owned_rss_bytes": 792608768,
      "owned_process_count": 4,
      "reclaimable_bytes": 9810771968,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 107.956872917,
      "owned_rss_bytes": 794460160,
      "owned_process_count": 4,
      "reclaimable_bytes": 9808953344,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 108.188951833,
      "owned_rss_bytes": 794984448,
      "owned_process_count": 4,
      "reclaimable_bytes": 9807593472,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 108.417225542,
      "owned_rss_bytes": 795672576,
      "owned_process_count": 4,
      "reclaimable_bytes": 9806086144,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 108.645369792,
      "owned_rss_bytes": 796475392,
      "owned_process_count": 4,
      "reclaimable_bytes": 9807364096,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 108.87777075,
      "owned_rss_bytes": 796508160,
      "owned_process_count": 4,
      "reclaimable_bytes": 9577086976,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 109.10806441700001,
      "owned_rss_bytes": 794984448,
      "owned_process_count": 4,
      "reclaimable_bytes": 9579692032,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 109.33873712500001,
      "owned_rss_bytes": 794984448,
      "owned_process_count": 4,
      "reclaimable_bytes": 9498607616,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 109.58117825000001,
      "owned_rss_bytes": 796049408,
      "owned_process_count": 4,
      "reclaimable_bytes": 9359802368,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 109.81585275,
      "owned_rss_bytes": 797016064,
      "owned_process_count": 4,
      "reclaimable_bytes": 9307537408,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 110.04871787500001,
      "owned_rss_bytes": 803291136,
      "owned_process_count": 4,
      "reclaimable_bytes": 9325625344,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 110.27525875,
      "owned_rss_bytes": 803373056,
      "owned_process_count": 4,
      "reclaimable_bytes": 9342713856,
      "swapins": 44109449,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 110.508942917,
      "owned_rss_bytes": 803471360,
      "owned_process_count": 4,
      "reclaimable_bytes": 9199042560,
      "swapins": 44109469,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 110.738412375,
      "owned_rss_bytes": 803749888,
      "owned_process_count": 4,
      "reclaimable_bytes": 8940945408,
      "swapins": 44109501,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 110.99469570800001,
      "owned_rss_bytes": 803962880,
      "owned_process_count": 4,
      "reclaimable_bytes": 8839380992,
      "swapins": 44109513,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 111.23715629200001,
      "owned_rss_bytes": 803962880,
      "owned_process_count": 4,
      "reclaimable_bytes": 8664088576,
      "swapins": 44109513,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 111.49092508300001,
      "owned_rss_bytes": 804847616,
      "owned_process_count": 4,
      "reclaimable_bytes": 8756101120,
      "swapins": 44109513,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 111.785598667,
      "owned_rss_bytes": 805257216,
      "owned_process_count": 4,
      "reclaimable_bytes": 9012461568,
      "swapins": 44109525,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 112.028037458,
      "owned_rss_bytes": 810598400,
      "owned_process_count": 4,
      "reclaimable_bytes": 8830631936,
      "swapins": 44109525,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 112.27577050000001,
      "owned_rss_bytes": 810647552,
      "owned_process_count": 4,
      "reclaimable_bytes": 8793325568,
      "swapins": 44109577,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 112.5052495,
      "owned_rss_bytes": 811941888,
      "owned_process_count": 4,
      "reclaimable_bytes": 8781348864,
      "swapins": 44109589,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 112.738233542,
      "owned_rss_bytes": 813383680,
      "owned_process_count": 4,
      "reclaimable_bytes": 8816640000,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 112.971222333,
      "owned_rss_bytes": 813383680,
      "owned_process_count": 4,
      "reclaimable_bytes": 8818671616,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 113.204047917,
      "owned_rss_bytes": 814448640,
      "owned_process_count": 4,
      "reclaimable_bytes": 8896659456,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 113.437748,
      "owned_rss_bytes": 814514176,
      "owned_process_count": 4,
      "reclaimable_bytes": 9035939840,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 113.69970608300001,
      "owned_rss_bytes": 814514176,
      "owned_process_count": 4,
      "reclaimable_bytes": 9057943552,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 113.933800167,
      "owned_rss_bytes": 814923776,
      "owned_process_count": 4,
      "reclaimable_bytes": 9071869952,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 114.166032125,
      "owned_rss_bytes": 814940160,
      "owned_process_count": 4,
      "reclaimable_bytes": 9073803264,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 114.39812558300001,
      "owned_rss_bytes": 814710784,
      "owned_process_count": 4,
      "reclaimable_bytes": 9030008832,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 114.63257275000001,
      "owned_rss_bytes": 814710784,
      "owned_process_count": 4,
      "reclaimable_bytes": 9204121600,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 114.864988167,
      "owned_rss_bytes": 815349760,
      "owned_process_count": 4,
      "reclaimable_bytes": 9216360448,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 115.098810958,
      "owned_rss_bytes": 821411840,
      "owned_process_count": 4,
      "reclaimable_bytes": 9274753024,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 115.333908917,
      "owned_rss_bytes": 821592064,
      "owned_process_count": 4,
      "reclaimable_bytes": 9283567616,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 115.5665575,
      "owned_rss_bytes": 821755904,
      "owned_process_count": 4,
      "reclaimable_bytes": 9282928640,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 115.799982042,
      "owned_rss_bytes": 821772288,
      "owned_process_count": 4,
      "reclaimable_bytes": 9287188480,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 116.031771042,
      "owned_rss_bytes": 821952512,
      "owned_process_count": 4,
      "reclaimable_bytes": 9286909952,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 116.264914167,
      "owned_rss_bytes": 821952512,
      "owned_process_count": 4,
      "reclaimable_bytes": 9287237632,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 116.494190833,
      "owned_rss_bytes": 821952512,
      "owned_process_count": 4,
      "reclaimable_bytes": 9283682304,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 116.724113625,
      "owned_rss_bytes": 821952512,
      "owned_process_count": 4,
      "reclaimable_bytes": 10624368640,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 116.953334708,
      "owned_rss_bytes": 822886400,
      "owned_process_count": 4,
      "reclaimable_bytes": 10537320448,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 117.181408917,
      "owned_rss_bytes": 823115776,
      "owned_process_count": 4,
      "reclaimable_bytes": 9483993088,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 117.41348095800001,
      "owned_rss_bytes": 823312384,
      "owned_process_count": 4,
      "reclaimable_bytes": 10640359424,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 117.64275625,
      "owned_rss_bytes": 824098816,
      "owned_process_count": 4,
      "reclaimable_bytes": 10728112128,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 117.874251542,
      "owned_rss_bytes": 826392576,
      "owned_process_count": 4,
      "reclaimable_bytes": 10731110400,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 118.102583583,
      "owned_rss_bytes": 826474496,
      "owned_process_count": 4,
      "reclaimable_bytes": 10748198912,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 118.331515333,
      "owned_rss_bytes": 826490880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10764976128,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 118.559185375,
      "owned_rss_bytes": 826605568,
      "owned_process_count": 4,
      "reclaimable_bytes": 10750705664,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 118.785602,
      "owned_rss_bytes": 827473920,
      "owned_process_count": 4,
      "reclaimable_bytes": 10739384320,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 119.014142625,
      "owned_rss_bytes": 827473920,
      "owned_process_count": 4,
      "reclaimable_bytes": 10730799104,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 119.24333812500001,
      "owned_rss_bytes": 831946752,
      "owned_process_count": 4,
      "reclaimable_bytes": 10714660864,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 119.472992375,
      "owned_rss_bytes": 845168640,
      "owned_process_count": 4,
      "reclaimable_bytes": 10696130560,
      "swapins": 44109593,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 119.70247545800001,
      "owned_rss_bytes": 845758464,
      "owned_process_count": 4,
      "reclaimable_bytes": 10666885120,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 119.93086037500001,
      "owned_rss_bytes": 845758464,
      "owned_process_count": 4,
      "reclaimable_bytes": 10668687360,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 120.159333875,
      "owned_rss_bytes": 845905920,
      "owned_process_count": 4,
      "reclaimable_bytes": 10666180608,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 120.38892629200001,
      "owned_rss_bytes": 846462976,
      "owned_process_count": 4,
      "reclaimable_bytes": 10477846528,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 120.618226375,
      "owned_rss_bytes": 847265792,
      "owned_process_count": 4,
      "reclaimable_bytes": 10473603072,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 120.847729875,
      "owned_rss_bytes": 847298560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10476257280,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 121.072709,
      "owned_rss_bytes": 847298560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10476617728,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 121.30232941700001,
      "owned_rss_bytes": 847298560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10466787328,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 121.531071542,
      "owned_rss_bytes": 847298560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10637901824,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 121.756024917,
      "owned_rss_bytes": 847298560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10660036608,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 121.9829445,
      "owned_rss_bytes": 847298560,
      "owned_process_count": 4,
      "reclaimable_bytes": 10650566656,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 122.21191204200001,
      "owned_rss_bytes": 847544320,
      "owned_process_count": 4,
      "reclaimable_bytes": 10644996096,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 122.441349125,
      "owned_rss_bytes": 847675392,
      "owned_process_count": 4,
      "reclaimable_bytes": 10645241856,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 122.670230708,
      "owned_rss_bytes": 847691776,
      "owned_process_count": 4,
      "reclaimable_bytes": 10646011904,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 122.898899333,
      "owned_rss_bytes": 847904768,
      "owned_process_count": 4,
      "reclaimable_bytes": 10650943488,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 123.127206083,
      "owned_rss_bytes": 847921152,
      "owned_process_count": 4,
      "reclaimable_bytes": 10649927680,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 123.35240533300001,
      "owned_rss_bytes": 848429056,
      "owned_process_count": 4,
      "reclaimable_bytes": 10646470656,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 123.577310208,
      "owned_rss_bytes": 848429056,
      "owned_process_count": 4,
      "reclaimable_bytes": 10453417984,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 123.801743875,
      "owned_rss_bytes": 848494592,
      "owned_process_count": 4,
      "reclaimable_bytes": 10454171648,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 124.03156375,
      "owned_rss_bytes": 848691200,
      "owned_process_count": 4,
      "reclaimable_bytes": 10460954624,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 124.260305,
      "owned_rss_bytes": 848691200,
      "owned_process_count": 4,
      "reclaimable_bytes": 10459103232,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 124.486833958,
      "owned_rss_bytes": 848740352,
      "owned_process_count": 4,
      "reclaimable_bytes": 10355523584,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 124.711392167,
      "owned_rss_bytes": 848740352,
      "owned_process_count": 4,
      "reclaimable_bytes": 10545987584,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 124.93698412500001,
      "owned_rss_bytes": 848756736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10356408320,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 125.16166591700001,
      "owned_rss_bytes": 848920576,
      "owned_process_count": 4,
      "reclaimable_bytes": 10359750656,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 125.391441417,
      "owned_rss_bytes": 848953344,
      "owned_process_count": 4,
      "reclaimable_bytes": 10404233216,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 125.619605667,
      "owned_rss_bytes": 849248256,
      "owned_process_count": 4,
      "reclaimable_bytes": 10406592512,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 125.84858579200001,
      "owned_rss_bytes": 849248256,
      "owned_process_count": 4,
      "reclaimable_bytes": 10403430400,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 126.078299125,
      "owned_rss_bytes": 849281024,
      "owned_process_count": 4,
      "reclaimable_bytes": 10538795008,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 126.308168875,
      "owned_rss_bytes": 849330176,
      "owned_process_count": 4,
      "reclaimable_bytes": 10534797312,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 126.53743945800001,
      "owned_rss_bytes": 850509824,
      "owned_process_count": 4,
      "reclaimable_bytes": 10530799616,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 126.7619245,
      "owned_rss_bytes": 850624512,
      "owned_process_count": 4,
      "reclaimable_bytes": 10552360960,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 126.98710004200001,
      "owned_rss_bytes": 850624512,
      "owned_process_count": 4,
      "reclaimable_bytes": 10555473920,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 127.216645708,
      "owned_rss_bytes": 850624512,
      "owned_process_count": 4,
      "reclaimable_bytes": 10369646592,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 127.44637625,
      "owned_rss_bytes": 850624512,
      "owned_process_count": 4,
      "reclaimable_bytes": 10371350528,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 127.67062666700001,
      "owned_rss_bytes": 850919424,
      "owned_process_count": 4,
      "reclaimable_bytes": 10369138688,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 127.899794833,
      "owned_rss_bytes": 850984960,
      "owned_process_count": 4,
      "reclaimable_bytes": 10463887360,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 128.12846166699998,
      "owned_rss_bytes": 850984960,
      "owned_process_count": 4,
      "reclaimable_bytes": 10470539264,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 128.35609095799998,
      "owned_rss_bytes": 851279872,
      "owned_process_count": 4,
      "reclaimable_bytes": 10467852288,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 128.58259841699999,
      "owned_rss_bytes": 851361792,
      "owned_process_count": 4,
      "reclaimable_bytes": 10466131968,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 128.81061095799998,
      "owned_rss_bytes": 851361792,
      "owned_process_count": 4,
      "reclaimable_bytes": 10652270592,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 129.038024458,
      "owned_rss_bytes": 851410944,
      "owned_process_count": 4,
      "reclaimable_bytes": 10650468352,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 129.264831333,
      "owned_rss_bytes": 851410944,
      "owned_process_count": 4,
      "reclaimable_bytes": 10654040064,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 129.494966292,
      "owned_rss_bytes": 851410944,
      "owned_process_count": 4,
      "reclaimable_bytes": 10652336128,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 129.72042675,
      "owned_rss_bytes": 851410944,
      "owned_process_count": 4,
      "reclaimable_bytes": 10651877376,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 129.949188583,
      "owned_rss_bytes": 851410944,
      "owned_process_count": 4,
      "reclaimable_bytes": 10649485312,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 130.177778,
      "owned_rss_bytes": 851673088,
      "owned_process_count": 4,
      "reclaimable_bytes": 10654744576,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 130.406823875,
      "owned_rss_bytes": 851722240,
      "owned_process_count": 4,
      "reclaimable_bytes": 10653548544,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 130.636482833,
      "owned_rss_bytes": 851755008,
      "owned_process_count": 4,
      "reclaimable_bytes": 10654236672,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 130.867676125,
      "owned_rss_bytes": 851755008,
      "owned_process_count": 4,
      "reclaimable_bytes": 10651385856,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 131.09589449999999,
      "owned_rss_bytes": 851836928,
      "owned_process_count": 4,
      "reclaimable_bytes": 10656710656,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 131.32486749999998,
      "owned_rss_bytes": 851968000,
      "owned_process_count": 4,
      "reclaimable_bytes": 10657726464,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 131.55098408299997,
      "owned_rss_bytes": 851984384,
      "owned_process_count": 4,
      "reclaimable_bytes": 10656366592,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 131.78005875,
      "owned_rss_bytes": 852606976,
      "owned_process_count": 4,
      "reclaimable_bytes": 10655514624,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 132.00871008299998,
      "owned_rss_bytes": 852639744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10657234944,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 132.235281292,
      "owned_rss_bytes": 852787200,
      "owned_process_count": 4,
      "reclaimable_bytes": 10656776192,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 132.46545774999998,
      "owned_rss_bytes": 852819968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10655645696,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 132.69213879199998,
      "owned_rss_bytes": 852819968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10654220288,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 132.91772425,
      "owned_rss_bytes": 852819968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10653892608,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 133.144668167,
      "owned_rss_bytes": 852819968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10640949248,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 133.37062716699998,
      "owned_rss_bytes": 852852736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10566369280,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 133.60114408299998,
      "owned_rss_bytes": 852852736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10562224128,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 133.83139949999997,
      "owned_rss_bytes": 852885504,
      "owned_process_count": 4,
      "reclaimable_bytes": 10562387968,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 134.062066083,
      "owned_rss_bytes": 852901888,
      "owned_process_count": 4,
      "reclaimable_bytes": 10421501952,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 134.287496167,
      "owned_rss_bytes": 852918272,
      "owned_process_count": 4,
      "reclaimable_bytes": 9463644160,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 134.51787070799998,
      "owned_rss_bytes": 852951040,
      "owned_process_count": 4,
      "reclaimable_bytes": 9459761152,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 134.749031167,
      "owned_rss_bytes": 852951040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10648961024,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 134.97758658299998,
      "owned_rss_bytes": 852951040,
      "owned_process_count": 4,
      "reclaimable_bytes": 10650320896,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 135.20697670799998,
      "owned_rss_bytes": 852967424,
      "owned_process_count": 4,
      "reclaimable_bytes": 10645848064,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 135.43566258299998,
      "owned_rss_bytes": 853000192,
      "owned_process_count": 4,
      "reclaimable_bytes": 10648813568,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 135.664377667,
      "owned_rss_bytes": 853032960,
      "owned_process_count": 4,
      "reclaimable_bytes": 10647126016,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 135.89203949999998,
      "owned_rss_bytes": 853032960,
      "owned_process_count": 4,
      "reclaimable_bytes": 10653859840,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 136.120768,
      "owned_rss_bytes": 853065728,
      "owned_process_count": 4,
      "reclaimable_bytes": 10659872768,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 136.34971679199998,
      "owned_rss_bytes": 853114880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10655432704,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 136.578510083,
      "owned_rss_bytes": 853114880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10657513472,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 136.80771374999998,
      "owned_rss_bytes": 853114880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10653040640,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 137.03607804199999,
      "owned_rss_bytes": 853114880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10651287552,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 137.264805583,
      "owned_rss_bytes": 853114880,
      "owned_process_count": 4,
      "reclaimable_bytes": 10650009600,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 137.491288583,
      "owned_rss_bytes": 853180416,
      "owned_process_count": 4,
      "reclaimable_bytes": 10650714112,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 137.717935375,
      "owned_rss_bytes": 853639168,
      "owned_process_count": 4,
      "reclaimable_bytes": 10648616960,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 137.945991,
      "owned_rss_bytes": 907952128,
      "owned_process_count": 4,
      "reclaimable_bytes": 10593894400,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 138.175892875,
      "owned_rss_bytes": 1061765120,
      "owned_process_count": 4,
      "reclaimable_bytes": 10431053824,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 138.41136387499998,
      "owned_rss_bytes": 1098006528,
      "owned_process_count": 4,
      "reclaimable_bytes": 10437296128,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 138.637374667,
      "owned_rss_bytes": 270139392,
      "owned_process_count": 4,
      "reclaimable_bytes": 11192156160,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 138.86710441699998,
      "owned_rss_bytes": 316342272,
      "owned_process_count": 4,
      "reclaimable_bytes": 11164057600,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 139.09768583299999,
      "owned_rss_bytes": 324141056,
      "owned_process_count": 4,
      "reclaimable_bytes": 11157651456,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 139.32714704199998,
      "owned_rss_bytes": 332414976,
      "owned_process_count": 4,
      "reclaimable_bytes": 11147886592,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 139.55650212499998,
      "owned_rss_bytes": 383795200,
      "owned_process_count": 4,
      "reclaimable_bytes": 11106156544,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 139.78568712499998,
      "owned_rss_bytes": 394510336,
      "owned_process_count": 4,
      "reclaimable_bytes": 11103780864,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 140.015088542,
      "owned_rss_bytes": 407011328,
      "owned_process_count": 4,
      "reclaimable_bytes": 11092459520,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 140.241982375,
      "owned_rss_bytes": 421838848,
      "owned_process_count": 4,
      "reclaimable_bytes": 11077795840,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 140.467955833,
      "owned_rss_bytes": 432963584,
      "owned_process_count": 4,
      "reclaimable_bytes": 11061788672,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 140.696480958,
      "owned_rss_bytes": 448937984,
      "owned_process_count": 4,
      "reclaimable_bytes": 11050713088,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 140.926137083,
      "owned_rss_bytes": 460324864,
      "owned_process_count": 4,
      "reclaimable_bytes": 11038375936,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 141.15534345799998,
      "owned_rss_bytes": 468975616,
      "owned_process_count": 4,
      "reclaimable_bytes": 11034624000,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 141.384885333,
      "owned_rss_bytes": 473268224,
      "owned_process_count": 4,
      "reclaimable_bytes": 11034132480,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 141.61331654199998,
      "owned_rss_bytes": 495747072,
      "owned_process_count": 4,
      "reclaimable_bytes": 10820698112,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 141.839006625,
      "owned_rss_bytes": 499171328,
      "owned_process_count": 4,
      "reclaimable_bytes": 10816995328,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 142.068774167,
      "owned_rss_bytes": 505806848,
      "owned_process_count": 4,
      "reclaimable_bytes": 10841653248,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 142.298548042,
      "owned_rss_bytes": 509296640,
      "owned_process_count": 4,
      "reclaimable_bytes": 10837114880,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 142.52860579199998,
      "owned_rss_bytes": 514015232,
      "owned_process_count": 4,
      "reclaimable_bytes": 10831953920,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 142.757478583,
      "owned_rss_bytes": 520126464,
      "owned_process_count": 4,
      "reclaimable_bytes": 10822385664,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 142.98500016699998,
      "owned_rss_bytes": 524763136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10822156288,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 143.21524879199998,
      "owned_rss_bytes": 525615104,
      "owned_process_count": 4,
      "reclaimable_bytes": 10821353472,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 143.44509987499998,
      "owned_rss_bytes": 525811712,
      "owned_process_count": 4,
      "reclaimable_bytes": 10817224704,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 143.674443667,
      "owned_rss_bytes": 525860864,
      "owned_process_count": 4,
      "reclaimable_bytes": 10817224704,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 143.901649333,
      "owned_rss_bytes": 525893632,
      "owned_process_count": 4,
      "reclaimable_bytes": 10817732608,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 144.131418,
      "owned_rss_bytes": 526139392,
      "owned_process_count": 4,
      "reclaimable_bytes": 10815750144,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 144.357389458,
      "owned_rss_bytes": 526532608,
      "owned_process_count": 4,
      "reclaimable_bytes": 10816946176,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 144.585486875,
      "owned_rss_bytes": 547225600,
      "owned_process_count": 4,
      "reclaimable_bytes": 10790879232,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 144.816098042,
      "owned_rss_bytes": 175226880,
      "owned_process_count": 4,
      "reclaimable_bytes": 11049254912,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 145.046544708,
      "owned_rss_bytes": 312197120,
      "owned_process_count": 4,
      "reclaimable_bytes": 11004559360,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 145.275161083,
      "owned_rss_bytes": 342966272,
      "owned_process_count": 4,
      "reclaimable_bytes": 10986455040,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 145.50483237499998,
      "owned_rss_bytes": 357203968,
      "owned_process_count": 4,
      "reclaimable_bytes": 10972332032,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 145.734885583,
      "owned_rss_bytes": 368132096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10964074496,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 145.965638875,
      "owned_rss_bytes": 386826240,
      "owned_process_count": 4,
      "reclaimable_bytes": 10945986560,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 146.19408133299999,
      "owned_rss_bytes": 398655488,
      "owned_process_count": 4,
      "reclaimable_bytes": 10935812096,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 146.423598417,
      "owned_rss_bytes": 418906112,
      "owned_process_count": 4,
      "reclaimable_bytes": 10916970496,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 146.648147417,
      "owned_rss_bytes": 423641088,
      "owned_process_count": 4,
      "reclaimable_bytes": 10909237248,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 146.877252583,
      "owned_rss_bytes": 433340416,
      "owned_process_count": 4,
      "reclaimable_bytes": 10901176320,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 147.103161458,
      "owned_rss_bytes": 434421760,
      "owned_process_count": 4,
      "reclaimable_bytes": 11067244544,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 147.33213695799998,
      "owned_rss_bytes": 439238656,
      "owned_process_count": 4,
      "reclaimable_bytes": 11063148544,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 147.560410167,
      "owned_rss_bytes": 440483840,
      "owned_process_count": 4,
      "reclaimable_bytes": 11063640064,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 147.786827375,
      "owned_rss_bytes": 440696832,
      "owned_process_count": 4,
      "reclaimable_bytes": 11085201408,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 148.016071208,
      "owned_rss_bytes": 440778752,
      "owned_process_count": 4,
      "reclaimable_bytes": 11087659008,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 148.245575917,
      "owned_rss_bytes": 441303040,
      "owned_process_count": 4,
      "reclaimable_bytes": 11082645504,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 148.474338833,
      "owned_rss_bytes": 94404608,
      "owned_process_count": 3,
      "reclaimable_bytes": 11256594432,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 148.697849792,
      "owned_rss_bytes": 313835520,
      "owned_process_count": 4,
      "reclaimable_bytes": 11195727872,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 148.926902542,
      "owned_rss_bytes": 331710464,
      "owned_process_count": 4,
      "reclaimable_bytes": 11178360832,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 149.15230445799997,
      "owned_rss_bytes": 237518848,
      "owned_process_count": 5,
      "reclaimable_bytes": 11177017344,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 149.393856917,
      "owned_rss_bytes": 210567168,
      "owned_process_count": 4,
      "reclaimable_bytes": 11226628096,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 149.62348570799998,
      "owned_rss_bytes": 322174976,
      "owned_process_count": 4,
      "reclaimable_bytes": 11207786496,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 149.84765608299998,
      "owned_rss_bytes": 468992000,
      "owned_process_count": 4,
      "reclaimable_bytes": 11098996736,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 150.07736808299998,
      "owned_rss_bytes": 634388480,
      "owned_process_count": 4,
      "reclaimable_bytes": 10908614656,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 150.30729162499998,
      "owned_rss_bytes": 874217472,
      "owned_process_count": 4,
      "reclaimable_bytes": 10738368512,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 150.536323958,
      "owned_rss_bytes": 1196556288,
      "owned_process_count": 4,
      "reclaimable_bytes": 10450305024,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 150.765827125,
      "owned_rss_bytes": 1200832512,
      "owned_process_count": 4,
      "reclaimable_bytes": 10462019584,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 150.992183792,
      "owned_rss_bytes": 1225375744,
      "owned_process_count": 4,
      "reclaimable_bytes": 10442145792,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 151.215549792,
      "owned_rss_bytes": 1258242048,
      "owned_process_count": 4,
      "reclaimable_bytes": 10516086784,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 151.440964375,
      "owned_rss_bytes": 1282932736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10501160960,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 151.669672083,
      "owned_rss_bytes": 1290256384,
      "owned_process_count": 4,
      "reclaimable_bytes": 10492919808,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 151.89929283299998,
      "owned_rss_bytes": 1303068672,
      "owned_process_count": 4,
      "reclaimable_bytes": 10479222784,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 152.128357667,
      "owned_rss_bytes": 1312964608,
      "owned_process_count": 4,
      "reclaimable_bytes": 10465083392,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 152.35336841699998,
      "owned_rss_bytes": 1324531712,
      "owned_process_count": 4,
      "reclaimable_bytes": 10454646784,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 152.58176625,
      "owned_rss_bytes": 1342980096,
      "owned_process_count": 4,
      "reclaimable_bytes": 10440163328,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 152.81046129199999,
      "owned_rss_bytes": 1362116608,
      "owned_process_count": 4,
      "reclaimable_bytes": 10408361984,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 153.039885208,
      "owned_rss_bytes": 1411629056,
      "owned_process_count": 4,
      "reclaimable_bytes": 10391453696,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 153.269531708,
      "owned_rss_bytes": 489259008,
      "owned_process_count": 5,
      "reclaimable_bytes": 11124768768,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 153.50024829199998,
      "owned_rss_bytes": 402276352,
      "owned_process_count": 4,
      "reclaimable_bytes": 11245731840,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 153.730207792,
      "owned_rss_bytes": 599375872,
      "owned_process_count": 4,
      "reclaimable_bytes": 11079811072,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 153.9608715,
      "owned_rss_bytes": 887308288,
      "owned_process_count": 4,
      "reclaimable_bytes": 10823876608,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 154.18988324999998,
      "owned_rss_bytes": 1243152384,
      "owned_process_count": 4,
      "reclaimable_bytes": 10511368192,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 154.41835966699998,
      "owned_rss_bytes": 1151303680,
      "owned_process_count": 4,
      "reclaimable_bytes": 10608738304,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 154.647461583,
      "owned_rss_bytes": 1177894912,
      "owned_process_count": 4,
      "reclaimable_bytes": 10586816512,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 154.878201625,
      "owned_rss_bytes": 1247707136,
      "owned_process_count": 4,
      "reclaimable_bytes": 10523492352,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 155.108382625,
      "owned_rss_bytes": 1265598464,
      "owned_process_count": 4,
      "reclaimable_bytes": 10509287424,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 155.336780708,
      "owned_rss_bytes": 1278836736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10499719168,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 155.565274125,
      "owned_rss_bytes": 1290256384,
      "owned_process_count": 4,
      "reclaimable_bytes": 10486038528,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 155.791285833,
      "owned_rss_bytes": 1301364736,
      "owned_process_count": 4,
      "reclaimable_bytes": 10475634688,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 156.014305875,
      "owned_rss_bytes": 1319600128,
      "owned_process_count": 4,
      "reclaimable_bytes": 10462347264,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 156.24184316699998,
      "owned_rss_bytes": 1342357504,
      "owned_process_count": 4,
      "reclaimable_bytes": 10439065600,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 156.469816708,
      "owned_rss_bytes": 1339392000,
      "owned_process_count": 4,
      "reclaimable_bytes": 10409558016,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 156.69543654199998,
      "owned_rss_bytes": 16138240,
      "owned_process_count": 2,
      "reclaimable_bytes": 11401658368,
      "swapins": 44109625,
      "swapouts": 77525502
    },
    {
      "elapsed_seconds": 156.92097745799998,
      "owned_rss_bytes": 0,
      "owned_process_count": 1,
      "reclaimable_bytes": 11409932288,
      "swapins": 44109625,
      "swapouts": 77525502
    }
  ],
  "passed": true,
  "classification": "serial build only; not model qualification",
  "child_pid": 41164,
  "exit_code": 0,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11435343872,
    "swapins": 44109625,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    96090.\nPages active:                                1004734.\nPages inactive:                               969160.\nPages speculative:                             56786.\nPages throttled:                                   0.\nPages wired down:                             261256.\nPages purgeable:                                8479.\n\"Translation faults\":                    15309163214.\nPages copy-on-write:                       727258237.\nPages zero filled:                       21074307022.\nPages reactivated:                        3465949350.\nPages purged:                               71963575.\nFile-backed pages:                            593389.\nAnonymous pages:                             1437291.\nPages stored in compressor:                  1648961.\nPages occupied by compressor:                 693162.\nDecompressions:                           1169600000.\nCompressions:                             1483703454.\nPageins:                                  7603696015.\nPageouts:                                   11054295.\nSwapins:                                    44109625.\nSwapouts:                                   77525502.\nPages tagged:                                 178020.\nPages tagged resident:                        141229.\nPages tagged compressed:                       36791.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8354.\nPages tag-storage free:                         4289.\nPages tag-storage non-tag pageable:            85652.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                    5764672.\nTagged compressions:                        11190171.\nTagged decompressions:                      10330111.\n"
  },
  "remaining_owned_members": [],
  "owned_groups": [
    41164
  ],
  "remaining_owned_members_after_cleanup": [],
  "elapsed_seconds": 157.20791658299999,
  "child_exit_code": 0,
  "after_cleanup": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11439685632,
    "swapins": 44109625,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    96345.\nPages active:                                1004757.\nPages inactive:                               969157.\nPages speculative:                             56796.\nPages throttled:                                   0.\nPages wired down:                             261258.\nPages purgeable:                                8479.\n\"Translation faults\":                    15309168959.\nPages copy-on-write:                       727259039.\nPages zero filled:                       21074310101.\nPages reactivated:                        3465949350.\nPages purged:                               71963575.\nFile-backed pages:                            593399.\nAnonymous pages:                             1437311.\nPages stored in compressor:                  1648961.\nPages occupied by compressor:                 693162.\nDecompressions:                           1169600000.\nCompressions:                             1483703454.\nPageins:                                  7603696020.\nPageouts:                                   11054295.\nSwapins:                                    44109625.\nSwapouts:                                   77525502.\nPages tagged:                                 178020.\nPages tagged resident:                        141229.\nPages tagged compressed:                       36791.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8354.\nPages tag-storage free:                         4288.\nPages tag-storage non-tag pageable:            85653.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                    5764672.\nTagged compressions:                        11190171.\nTagged decompressions:                      10330111.\n"
  }
}
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/live-memory.samples.jsonl

SHA-256 `40a3ce86be0559ddabcc5361386482fa9ace815570d916cc5c0133d5a8f3cad8`; 115468 bytes.

````text
{"elapsed_seconds": 0.001707249999999938, "owned_rss_bytes": 6127616, "owned_process_count": 1, "reclaimable_bytes": 10728292352, "swapins": 44109437, "swapouts": 77525502}
{"elapsed_seconds": 0.22803354200000003, "owned_rss_bytes": 6471680, "owned_process_count": 2, "reclaimable_bytes": 10729963520, "swapins": 44109437, "swapouts": 77525502}
{"elapsed_seconds": 0.45626575, "owned_rss_bytes": 40435712, "owned_process_count": 3, "reclaimable_bytes": 10895671296, "swapins": 44109437, "swapouts": 77525502}
{"elapsed_seconds": 0.6830522079999999, "owned_rss_bytes": 54231040, "owned_process_count": 3, "reclaimable_bytes": 10906599424, "swapins": 44109437, "swapouts": 77525502}
{"elapsed_seconds": 0.907189625, "owned_rss_bytes": 94896128, "owned_process_count": 4, "reclaimable_bytes": 10895769600, "swapins": 44109437, "swapouts": 77525502}
{"elapsed_seconds": 1.13949025, "owned_rss_bytes": 54509568, "owned_process_count": 3, "reclaimable_bytes": 10908237824, "swapins": 44109437, "swapouts": 77525502}
{"elapsed_seconds": 1.367212125, "owned_rss_bytes": 53837824, "owned_process_count": 3, "reclaimable_bytes": 10722918400, "swapins": 44109437, "swapouts": 77525502}
{"elapsed_seconds": 1.596286292, "owned_rss_bytes": 233390080, "owned_process_count": 8, "reclaimable_bytes": 10746986496, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 1.827770167, "owned_rss_bytes": 65077248, "owned_process_count": 5, "reclaimable_bytes": 10716184576, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 2.0569197079999997, "owned_rss_bytes": 65093632, "owned_process_count": 4, "reclaimable_bytes": 10724065280, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 2.2842959169999997, "owned_rss_bytes": 65060864, "owned_process_count": 4, "reclaimable_bytes": 10766155776, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 2.5157466250000002, "owned_rss_bytes": 324026368, "owned_process_count": 9, "reclaimable_bytes": 10715971584, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 2.7470328329999996, "owned_rss_bytes": 66486272, "owned_process_count": 7, "reclaimable_bytes": 10769661952, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 2.978068208, "owned_rss_bytes": 67026944, "owned_process_count": 6, "reclaimable_bytes": 10771873792, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 3.208885833, "owned_rss_bytes": 66994176, "owned_process_count": 6, "reclaimable_bytes": 10788732928, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 3.4469960420000003, "owned_rss_bytes": 66813952, "owned_process_count": 3, "reclaimable_bytes": 10781097984, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 3.677926708, "owned_rss_bytes": 187334656, "owned_process_count": 5, "reclaimable_bytes": 10883842048, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 3.9021592080000005, "owned_rss_bytes": 66830336, "owned_process_count": 3, "reclaimable_bytes": 10968006656, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 4.13256025, "owned_rss_bytes": 71204864, "owned_process_count": 3, "reclaimable_bytes": 10967859200, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 4.361531042, "owned_rss_bytes": 71254016, "owned_process_count": 3, "reclaimable_bytes": 11035475968, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 4.59377675, "owned_rss_bytes": 66879488, "owned_process_count": 3, "reclaimable_bytes": 11047993344, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 4.819131458, "owned_rss_bytes": 68501504, "owned_process_count": 2, "reclaimable_bytes": 10862444544, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 5.047513042, "owned_rss_bytes": 71041024, "owned_process_count": 2, "reclaimable_bytes": 10860462080, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 5.275966125, "owned_rss_bytes": 74907648, "owned_process_count": 2, "reclaimable_bytes": 10778427392, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 5.503109333, "owned_rss_bytes": 169721856, "owned_process_count": 4, "reclaimable_bytes": 10723721216, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 5.731418167, "owned_rss_bytes": 267026432, "owned_process_count": 4, "reclaimable_bytes": 10503634944, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 5.961876042, "owned_rss_bytes": 94093312, "owned_process_count": 3, "reclaimable_bytes": 10715873280, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 6.1888024580000005, "owned_rss_bytes": 94093312, "owned_process_count": 2, "reclaimable_bytes": 10719641600, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 6.419443333, "owned_rss_bytes": 94093312, "owned_process_count": 2, "reclaimable_bytes": 10718412800, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 6.643649333, "owned_rss_bytes": 94093312, "owned_process_count": 2, "reclaimable_bytes": 10733617152, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 6.872016167, "owned_rss_bytes": 242925568, "owned_process_count": 4, "reclaimable_bytes": 10723803136, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 7.101939625, "owned_rss_bytes": 217235456, "owned_process_count": 4, "reclaimable_bytes": 10717495296, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 7.331266417, "owned_rss_bytes": 134365184, "owned_process_count": 4, "reclaimable_bytes": 10710925312, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 7.560914333, "owned_rss_bytes": 242040832, "owned_process_count": 4, "reclaimable_bytes": 10680598528, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 7.790433666999999, "owned_rss_bytes": 99532800, "owned_process_count": 2, "reclaimable_bytes": 10724147200, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 8.016510582999999, "owned_rss_bytes": 218972160, "owned_process_count": 4, "reclaimable_bytes": 10691837952, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 8.242846875, "owned_rss_bytes": 204111872, "owned_process_count": 4, "reclaimable_bytes": 10686038016, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 8.468689042, "owned_rss_bytes": 246235136, "owned_process_count": 4, "reclaimable_bytes": 10660118528, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 8.697415374999999, "owned_rss_bytes": 182059008, "owned_process_count": 4, "reclaimable_bytes": 10692050944, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 8.925939875, "owned_rss_bytes": 280559616, "owned_process_count": 4, "reclaimable_bytes": 10640490496, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 9.155418916999999, "owned_rss_bytes": 297123840, "owned_process_count": 4, "reclaimable_bytes": 10625810432, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 9.384006042, "owned_rss_bytes": 209747968, "owned_process_count": 4, "reclaimable_bytes": 10671816704, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 9.61448575, "owned_rss_bytes": 234389504, "owned_process_count": 4, "reclaimable_bytes": 10650451968, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 9.84451125, "owned_rss_bytes": 270680064, "owned_process_count": 4, "reclaimable_bytes": 10626875392, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 10.073523999999999, "owned_rss_bytes": 287916032, "owned_process_count": 4, "reclaimable_bytes": 10609246208, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 10.303093041999999, "owned_rss_bytes": 299597824, "owned_process_count": 4, "reclaimable_bytes": 10600841216, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 10.53226475, "owned_rss_bytes": 302563328, "owned_process_count": 4, "reclaimable_bytes": 10600742912, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 10.760835792, "owned_rss_bytes": 136265728, "owned_process_count": 3, "reclaimable_bytes": 10700324864, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 10.990902333, "owned_rss_bytes": 282771456, "owned_process_count": 4, "reclaimable_bytes": 10810621952, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 11.217596375, "owned_rss_bytes": 208175104, "owned_process_count": 4, "reclaimable_bytes": 10650042368, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 11.445844042, "owned_rss_bytes": 271187968, "owned_process_count": 4, "reclaimable_bytes": 10609524736, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 11.67546775, "owned_rss_bytes": 296321024, "owned_process_count": 4, "reclaimable_bytes": 10583998464, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 11.904671375, "owned_rss_bytes": 336494592, "owned_process_count": 4, "reclaimable_bytes": 10618421248, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 12.134657958, "owned_rss_bytes": 350339072, "owned_process_count": 4, "reclaimable_bytes": 10610999296, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 12.365030791999999, "owned_rss_bytes": 366166016, "owned_process_count": 4, "reclaimable_bytes": 10522394624, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 12.594192625, "owned_rss_bytes": 385810432, "owned_process_count": 4, "reclaimable_bytes": 10500538368, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 12.823311541999999, "owned_rss_bytes": 397475840, "owned_process_count": 4, "reclaimable_bytes": 10490068992, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 13.052882624999999, "owned_rss_bytes": 411500544, "owned_process_count": 4, "reclaimable_bytes": 10476109824, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 13.281917625, "owned_rss_bytes": 423215104, "owned_process_count": 4, "reclaimable_bytes": 10463428608, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 13.511504666999999, "owned_rss_bytes": 432259072, "owned_process_count": 4, "reclaimable_bytes": 10454810624, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 13.741250166999999, "owned_rss_bytes": 447725568, "owned_process_count": 4, "reclaimable_bytes": 10442014720, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 13.968680124999999, "owned_rss_bytes": 453591040, "owned_process_count": 4, "reclaimable_bytes": 10433970176, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 14.199356958, "owned_rss_bytes": 456671232, "owned_process_count": 4, "reclaimable_bytes": 10435723264, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 14.428870332999999, "owned_rss_bytes": 459735040, "owned_process_count": 4, "reclaimable_bytes": 10433511424, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 14.658392667, "owned_rss_bytes": 464191488, "owned_process_count": 4, "reclaimable_bytes": 10427858944, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 14.884892624999999, "owned_rss_bytes": 469663744, "owned_process_count": 4, "reclaimable_bytes": 10488414208, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 15.114835458, "owned_rss_bytes": 477577216, "owned_process_count": 4, "reclaimable_bytes": 10485170176, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 15.340566916999999, "owned_rss_bytes": 481198080, "owned_process_count": 4, "reclaimable_bytes": 10478665728, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 15.570858333, "owned_rss_bytes": 484638720, "owned_process_count": 4, "reclaimable_bytes": 10493542400, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 15.798385749999998, "owned_rss_bytes": 490962944, "owned_process_count": 4, "reclaimable_bytes": 10490019840, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 16.026980542, "owned_rss_bytes": 492945408, "owned_process_count": 4, "reclaimable_bytes": 10488201216, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 16.250926874999998, "owned_rss_bytes": 495353856, "owned_process_count": 4, "reclaimable_bytes": 10485907456, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 16.4816245, "owned_rss_bytes": 501907456, "owned_process_count": 4, "reclaimable_bytes": 10479632384, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 16.711475791999998, "owned_rss_bytes": 505413632, "owned_process_count": 4, "reclaimable_bytes": 10473062400, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 16.941047125, "owned_rss_bytes": 506134528, "owned_process_count": 4, "reclaimable_bytes": 10474110976, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 17.16854625, "owned_rss_bytes": 506298368, "owned_process_count": 4, "reclaimable_bytes": 10390388736, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 17.393836667, "owned_rss_bytes": 506970112, "owned_process_count": 4, "reclaimable_bytes": 10392059904, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 17.622508666999998, "owned_rss_bytes": 507658240, "owned_process_count": 4, "reclaimable_bytes": 10394238976, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 17.8485455, "owned_rss_bytes": 508149760, "owned_process_count": 4, "reclaimable_bytes": 10390011904, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 18.079466375, "owned_rss_bytes": 509181952, "owned_process_count": 4, "reclaimable_bytes": 10394271744, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 18.308791083, "owned_rss_bytes": 509870080, "owned_process_count": 4, "reclaimable_bytes": 10393763840, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 18.537957625, "owned_rss_bytes": 510787584, "owned_process_count": 4, "reclaimable_bytes": 10391191552, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 18.764838208, "owned_rss_bytes": 510853120, "owned_process_count": 4, "reclaimable_bytes": 10368155648, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 18.997788542, "owned_rss_bytes": 511033344, "owned_process_count": 4, "reclaimable_bytes": 10239508480, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 19.233629583, "owned_rss_bytes": 511148032, "owned_process_count": 4, "reclaimable_bytes": 10086662144, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 19.469351375, "owned_rss_bytes": 529006592, "owned_process_count": 4, "reclaimable_bytes": 10003365888, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 19.702161916999998, "owned_rss_bytes": 628490240, "owned_process_count": 4, "reclaimable_bytes": 10343727104, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 19.93807525, "owned_rss_bytes": 241729536, "owned_process_count": 4, "reclaimable_bytes": 10159783936, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 20.166044707999998, "owned_rss_bytes": 305135616, "owned_process_count": 4, "reclaimable_bytes": 10195124224, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 20.394056792, "owned_rss_bytes": 326418432, "owned_process_count": 4, "reclaimable_bytes": 10102865920, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 20.626879792, "owned_rss_bytes": 354664448, "owned_process_count": 4, "reclaimable_bytes": 10117775360, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 20.862278832999998, "owned_rss_bytes": 387465216, "owned_process_count": 4, "reclaimable_bytes": 10001399808, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 21.093869208, "owned_rss_bytes": 412696576, "owned_process_count": 4, "reclaimable_bytes": 9895280640, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 21.32549325, "owned_rss_bytes": 429719552, "owned_process_count": 4, "reclaimable_bytes": 9924493312, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 21.558641166999998, "owned_rss_bytes": 457392128, "owned_process_count": 4, "reclaimable_bytes": 9834168320, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 21.787931375, "owned_rss_bytes": 479985664, "owned_process_count": 4, "reclaimable_bytes": 9934831616, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 22.015794167, "owned_rss_bytes": 485294080, "owned_process_count": 4, "reclaimable_bytes": 9935831040, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 22.247927083, "owned_rss_bytes": 501153792, "owned_process_count": 4, "reclaimable_bytes": 9914318848, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 22.476739792, "owned_rss_bytes": 519569408, "owned_process_count": 4, "reclaimable_bytes": 9894100992, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 22.706700667, "owned_rss_bytes": 533053440, "owned_process_count": 4, "reclaimable_bytes": 9872080896, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 22.93548325, "owned_rss_bytes": 545357824, "owned_process_count": 4, "reclaimable_bytes": 10012344320, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 23.166007792, "owned_rss_bytes": 563822592, "owned_process_count": 4, "reclaimable_bytes": 9980035072, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 23.397085125, "owned_rss_bytes": 565886976, "owned_process_count": 4, "reclaimable_bytes": 9977593856, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 23.627138458, "owned_rss_bytes": 574914560, "owned_process_count": 4, "reclaimable_bytes": 9983508480, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 23.857677833, "owned_rss_bytes": 595050496, "owned_process_count": 4, "reclaimable_bytes": 9949315072, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 24.087953583, "owned_rss_bytes": 609239040, "owned_process_count": 4, "reclaimable_bytes": 10092691456, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 24.318213083, "owned_rss_bytes": 617758720, "owned_process_count": 4, "reclaimable_bytes": 10083057664, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 24.543429458, "owned_rss_bytes": 631128064, "owned_process_count": 4, "reclaimable_bytes": 10067230720, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 24.773519874999998, "owned_rss_bytes": 650887168, "owned_process_count": 4, "reclaimable_bytes": 10054221824, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 25.00201275, "owned_rss_bytes": 656834560, "owned_process_count": 4, "reclaimable_bytes": 10046652416, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 25.233142792, "owned_rss_bytes": 656850944, "owned_process_count": 4, "reclaimable_bytes": 10044997632, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 25.461765042, "owned_rss_bytes": 656867328, "owned_process_count": 4, "reclaimable_bytes": 10041163776, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 25.690042166999998, "owned_rss_bytes": 655785984, "owned_process_count": 4, "reclaimable_bytes": 10040262656, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 25.920535167, "owned_rss_bytes": 656785408, "owned_process_count": 4, "reclaimable_bytes": 10038525952, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 26.15051775, "owned_rss_bytes": 658046976, "owned_process_count": 4, "reclaimable_bytes": 10102620160, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 26.377068542, "owned_rss_bytes": 658374656, "owned_process_count": 4, "reclaimable_bytes": 10105798656, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 26.606372083, "owned_rss_bytes": 659259392, "owned_process_count": 4, "reclaimable_bytes": 10111680512, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 26.836823042, "owned_rss_bytes": 730152960, "owned_process_count": 4, "reclaimable_bytes": 10039312384, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 27.067519042, "owned_rss_bytes": 835911680, "owned_process_count": 4, "reclaimable_bytes": 9929932800, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 27.293796583, "owned_rss_bytes": 221478912, "owned_process_count": 4, "reclaimable_bytes": 10622418944, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 27.523842542, "owned_rss_bytes": 239943680, "owned_process_count": 4, "reclaimable_bytes": 10608508928, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 27.751805958, "owned_rss_bytes": 319127552, "owned_process_count": 4, "reclaimable_bytes": 10568843264, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 27.981505291999998, "owned_rss_bytes": 364478464, "owned_process_count": 4, "reclaimable_bytes": 10542235648, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 28.210146207999998, "owned_rss_bytes": 390905856, "owned_process_count": 4, "reclaimable_bytes": 10518577152, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 28.437924583, "owned_rss_bytes": 411336704, "owned_process_count": 4, "reclaimable_bytes": 10496376832, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 28.667086542, "owned_rss_bytes": 421625856, "owned_process_count": 4, "reclaimable_bytes": 10493181952, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 28.896669875, "owned_rss_bytes": 426049536, "owned_process_count": 4, "reclaimable_bytes": 10485727232, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 29.123932916999998, "owned_rss_bytes": 428802048, "owned_process_count": 4, "reclaimable_bytes": 10486562816, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 29.353430292, "owned_rss_bytes": 437108736, "owned_process_count": 4, "reclaimable_bytes": 10472259584, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 29.583035792, "owned_rss_bytes": 144326656, "owned_process_count": 4, "reclaimable_bytes": 10639687680, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 29.810675874999998, "owned_rss_bytes": 323977216, "owned_process_count": 4, "reclaimable_bytes": 10377723904, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 30.041075333, "owned_rss_bytes": 367902720, "owned_process_count": 4, "reclaimable_bytes": 10341859328, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 30.268163041999998, "owned_rss_bytes": 392445952, "owned_process_count": 4, "reclaimable_bytes": 10325590016, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 30.498776666999998, "owned_rss_bytes": 412925952, "owned_process_count": 4, "reclaimable_bytes": 10303553536, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 30.725236542, "owned_rss_bytes": 435044352, "owned_process_count": 4, "reclaimable_bytes": 10281041920, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 30.954994792, "owned_rss_bytes": 454705152, "owned_process_count": 4, "reclaimable_bytes": 10428268544, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 31.184182292, "owned_rss_bytes": 458522624, "owned_process_count": 4, "reclaimable_bytes": 10419650560, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 31.412915125, "owned_rss_bytes": 467189760, "owned_process_count": 4, "reclaimable_bytes": 10410033152, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 31.643436708, "owned_rss_bytes": 467222528, "owned_process_count": 4, "reclaimable_bytes": 10427777024, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 31.868780167, "owned_rss_bytes": 467795968, "owned_process_count": 4, "reclaimable_bytes": 10426826752, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 32.098652542, "owned_rss_bytes": 471711744, "owned_process_count": 4, "reclaimable_bytes": 10409476096, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 32.329589583, "owned_rss_bytes": 474185728, "owned_process_count": 4, "reclaimable_bytes": 10409410560, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 32.557421958000006, "owned_rss_bytes": 474447872, "owned_process_count": 4, "reclaimable_bytes": 10403119104, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 32.787701125000005, "owned_rss_bytes": 474562560, "owned_process_count": 4, "reclaimable_bytes": 10404544512, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 33.017943, "owned_rss_bytes": 512458752, "owned_process_count": 4, "reclaimable_bytes": 10363928576, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 33.248422375000004, "owned_rss_bytes": 242466816, "owned_process_count": 4, "reclaimable_bytes": 10590781440, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 33.478639667, "owned_rss_bytes": 290979840, "owned_process_count": 4, "reclaimable_bytes": 10566221824, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 33.706646000000006, "owned_rss_bytes": 308854784, "owned_process_count": 4, "reclaimable_bytes": 10547691520, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 33.936584583000005, "owned_rss_bytes": 339378176, "owned_process_count": 4, "reclaimable_bytes": 10515382272, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 34.166861667000006, "owned_rss_bytes": 382025728, "owned_process_count": 4, "reclaimable_bytes": 10467868672, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 34.397502917000004, "owned_rss_bytes": 432324608, "owned_process_count": 4, "reclaimable_bytes": 10436165632, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 34.626762292, "owned_rss_bytes": 432422912, "owned_process_count": 4, "reclaimable_bytes": 10433921024, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 34.857480667000004, "owned_rss_bytes": 432570368, "owned_process_count": 4, "reclaimable_bytes": 10432790528, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 35.083301208, "owned_rss_bytes": 434257920, "owned_process_count": 4, "reclaimable_bytes": 10435133440, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 35.308893875, "owned_rss_bytes": 446889984, "owned_process_count": 4, "reclaimable_bytes": 10423287808, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 35.539121833, "owned_rss_bytes": 461455360, "owned_process_count": 4, "reclaimable_bytes": 10409541632, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 35.767066583, "owned_rss_bytes": 468484096, "owned_process_count": 4, "reclaimable_bytes": 10401972224, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 35.993955042, "owned_rss_bytes": 486309888, "owned_process_count": 4, "reclaimable_bytes": 10384785408, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 36.22045225, "owned_rss_bytes": 501399552, "owned_process_count": 4, "reclaimable_bytes": 10286956544, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 36.447329, "owned_rss_bytes": 522289152, "owned_process_count": 4, "reclaimable_bytes": 10492395520, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 36.677213375, "owned_rss_bytes": 536395776, "owned_process_count": 4, "reclaimable_bytes": 10471096320, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 36.907327083000006, "owned_rss_bytes": 555663360, "owned_process_count": 4, "reclaimable_bytes": 10266525696, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 37.138021875, "owned_rss_bytes": 556531712, "owned_process_count": 4, "reclaimable_bytes": 10265493504, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 37.365457667, "owned_rss_bytes": 557301760, "owned_process_count": 4, "reclaimable_bytes": 10259611648, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 37.593604458, "owned_rss_bytes": 559464448, "owned_process_count": 4, "reclaimable_bytes": 10257678336, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 37.81971, "owned_rss_bytes": 562823168, "owned_process_count": 4, "reclaimable_bytes": 10148806656, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 38.049189125000005, "owned_rss_bytes": 568262656, "owned_process_count": 4, "reclaimable_bytes": 10143006720, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 38.277859583, "owned_rss_bytes": 572358656, "owned_process_count": 4, "reclaimable_bytes": 10146955264, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 38.509652375, "owned_rss_bytes": 572620800, "owned_process_count": 4, "reclaimable_bytes": 10147119104, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 38.738409625, "owned_rss_bytes": 572948480, "owned_process_count": 4, "reclaimable_bytes": 10138927104, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 38.967264583, "owned_rss_bytes": 573538304, "owned_process_count": 4, "reclaimable_bytes": 10135240704, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 39.197716292, "owned_rss_bytes": 574373888, "owned_process_count": 4, "reclaimable_bytes": 10134388736, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 39.423169125, "owned_rss_bytes": 574930944, "owned_process_count": 4, "reclaimable_bytes": 10130309120, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 39.651755417000004, "owned_rss_bytes": 654688256, "owned_process_count": 4, "reclaimable_bytes": 10039328768, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 39.88161275, "owned_rss_bytes": 211615744, "owned_process_count": 4, "reclaimable_bytes": 10422403072, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 40.112382375, "owned_rss_bytes": 326598656, "owned_process_count": 4, "reclaimable_bytes": 10372857856, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 40.340654, "owned_rss_bytes": 104628224, "owned_process_count": 3, "reclaimable_bytes": 10455711744, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 40.571858417, "owned_rss_bytes": 246054912, "owned_process_count": 4, "reclaimable_bytes": 10418864128, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 40.799704333, "owned_rss_bytes": 272793600, "owned_process_count": 4, "reclaimable_bytes": 10400907264, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 41.030132125, "owned_rss_bytes": 280936448, "owned_process_count": 4, "reclaimable_bytes": 10394320896, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 41.259785542, "owned_rss_bytes": 290439168, "owned_process_count": 4, "reclaimable_bytes": 10380984320, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 41.489985083, "owned_rss_bytes": 309575680, "owned_process_count": 4, "reclaimable_bytes": 10457432064, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 41.718814917, "owned_rss_bytes": 333037568, "owned_process_count": 4, "reclaimable_bytes": 10447896576, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 41.943399625000005, "owned_rss_bytes": 351272960, "owned_process_count": 4, "reclaimable_bytes": 10601005056, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 42.169148542, "owned_rss_bytes": 373112832, "owned_process_count": 4, "reclaimable_bytes": 10407002112, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 42.400367292000006, "owned_rss_bytes": 388218880, "owned_process_count": 4, "reclaimable_bytes": 10394648576, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 42.625240208, "owned_rss_bytes": 395837440, "owned_process_count": 4, "reclaimable_bytes": 10387456000, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 42.854893333, "owned_rss_bytes": 399818752, "owned_process_count": 4, "reclaimable_bytes": 10374823936, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 43.084548792, "owned_rss_bytes": 401539072, "owned_process_count": 4, "reclaimable_bytes": 10374856704, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 43.315367, "owned_rss_bytes": 402030592, "owned_process_count": 4, "reclaimable_bytes": 10368827392, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 43.541017042, "owned_rss_bytes": 402374656, "owned_process_count": 4, "reclaimable_bytes": 10373332992, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 43.771475042000006, "owned_rss_bytes": 134742016, "owned_process_count": 3, "reclaimable_bytes": 10542055424, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 43.999587042, "owned_rss_bytes": 329891840, "owned_process_count": 4, "reclaimable_bytes": 10452598784, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 44.229520208000004, "owned_rss_bytes": 354582528, "owned_process_count": 4, "reclaimable_bytes": 10440032256, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 44.460500083, "owned_rss_bytes": 116506624, "owned_process_count": 3, "reclaimable_bytes": 10543497216, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 44.685366458000004, "owned_rss_bytes": 208764928, "owned_process_count": 4, "reclaimable_bytes": 10518331392, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 44.916151292, "owned_rss_bytes": 241696768, "owned_process_count": 4, "reclaimable_bytes": 10396942336, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 45.148427833, "owned_rss_bytes": 200949760, "owned_process_count": 4, "reclaimable_bytes": 10583310336, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 45.3759795, "owned_rss_bytes": 309739520, "owned_process_count": 4, "reclaimable_bytes": 10529406976, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 45.607344417, "owned_rss_bytes": 333987840, "owned_process_count": 4, "reclaimable_bytes": 10528604160, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 45.833036833, "owned_rss_bytes": 349585408, "owned_process_count": 4, "reclaimable_bytes": 10514513920, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 46.062437625, "owned_rss_bytes": 357269504, "owned_process_count": 4, "reclaimable_bytes": 10512908288, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 46.291556583, "owned_rss_bytes": 362741760, "owned_process_count": 4, "reclaimable_bytes": 10508058624, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 46.521524208, "owned_rss_bytes": 368623616, "owned_process_count": 4, "reclaimable_bytes": 10503159808, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 46.747677292000006, "owned_rss_bytes": 374833152, "owned_process_count": 4, "reclaimable_bytes": 10490871808, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 46.973415708000005, "owned_rss_bytes": 380993536, "owned_process_count": 4, "reclaimable_bytes": 10485727232, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 47.203128875000004, "owned_rss_bytes": 387055616, "owned_process_count": 4, "reclaimable_bytes": 10569908224, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 47.429337083, "owned_rss_bytes": 393461760, "owned_process_count": 4, "reclaimable_bytes": 10562371584, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 47.658921, "owned_rss_bytes": 399523840, "owned_process_count": 4, "reclaimable_bytes": 10618585088, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 47.887888292, "owned_rss_bytes": 406224896, "owned_process_count": 4, "reclaimable_bytes": 10610851840, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 48.118400917, "owned_rss_bytes": 412041216, "owned_process_count": 4, "reclaimable_bytes": 10607656960, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 48.347148000000004, "owned_rss_bytes": 418660352, "owned_process_count": 4, "reclaimable_bytes": 10597892096, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 48.577929833000006, "owned_rss_bytes": 422903808, "owned_process_count": 4, "reclaimable_bytes": 10589241344, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 48.8066905, "owned_rss_bytes": 425492480, "owned_process_count": 4, "reclaimable_bytes": 10597072896, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 49.0377055, "owned_rss_bytes": 427524096, "owned_process_count": 4, "reclaimable_bytes": 10597957632, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 49.266635667, "owned_rss_bytes": 428326912, "owned_process_count": 4, "reclaimable_bytes": 10594271232, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 49.49553275, "owned_rss_bytes": 428457984, "owned_process_count": 4, "reclaimable_bytes": 10590978048, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 49.724847958000005, "owned_rss_bytes": 428539904, "owned_process_count": 4, "reclaimable_bytes": 10590175232, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 49.954301333000004, "owned_rss_bytes": 430473216, "owned_process_count": 4, "reclaimable_bytes": 10591207424, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 50.183197917, "owned_rss_bytes": 432226304, "owned_process_count": 4, "reclaimable_bytes": 10585554944, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 50.412340125, "owned_rss_bytes": 438910976, "owned_process_count": 4, "reclaimable_bytes": 10575265792, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 50.643264875, "owned_rss_bytes": 470106112, "owned_process_count": 4, "reclaimable_bytes": 10541219840, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 50.873381667000004, "owned_rss_bytes": 497172480, "owned_process_count": 4, "reclaimable_bytes": 10515906560, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 51.099708250000006, "owned_rss_bytes": 559300608, "owned_process_count": 4, "reclaimable_bytes": 10448437248, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 51.325331750000004, "owned_rss_bytes": 636321792, "owned_process_count": 4, "reclaimable_bytes": 10393075712, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 51.556132708, "owned_rss_bytes": 636452864, "owned_process_count": 4, "reclaimable_bytes": 10389798912, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 51.781017250000005, "owned_rss_bytes": 636534784, "owned_process_count": 4, "reclaimable_bytes": 10294149120, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 52.006791, "owned_rss_bytes": 636747776, "owned_process_count": 4, "reclaimable_bytes": 10287333376, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 52.235850708, "owned_rss_bytes": 636747776, "owned_process_count": 4, "reclaimable_bytes": 10204315648, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 52.462289667, "owned_rss_bytes": 636747776, "owned_process_count": 4, "reclaimable_bytes": 10204430336, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 52.690649917, "owned_rss_bytes": 636764160, "owned_process_count": 4, "reclaimable_bytes": 10198286336, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 52.921214708, "owned_rss_bytes": 636764160, "owned_process_count": 4, "reclaimable_bytes": 10197811200, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 53.151478125000004, "owned_rss_bytes": 639057920, "owned_process_count": 4, "reclaimable_bytes": 10195304448, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 53.382161083, "owned_rss_bytes": 640516096, "owned_process_count": 4, "reclaimable_bytes": 10194321408, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 53.612569833, "owned_rss_bytes": 646152192, "owned_process_count": 4, "reclaimable_bytes": 10193846272, "swapins": 44109441, "swapouts": 77525502}
{"elapsed_seconds": 53.840659167000005, "owned_rss_bytes": 656736256, "owned_process_count": 4, "reclaimable_bytes": 10181640192, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 54.069720875, "owned_rss_bytes": 670236672, "owned_process_count": 4, "reclaimable_bytes": 10168811520, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 54.301678125, "owned_rss_bytes": 681508864, "owned_process_count": 4, "reclaimable_bytes": 9953591296, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 54.533224125000004, "owned_rss_bytes": 690077696, "owned_process_count": 4, "reclaimable_bytes": 9937403904, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 54.763276875, "owned_rss_bytes": 698974208, "owned_process_count": 4, "reclaimable_bytes": 9930096640, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 54.992542292, "owned_rss_bytes": 704937984, "owned_process_count": 4, "reclaimable_bytes": 9925181440, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 55.22323325, "owned_rss_bytes": 722223104, "owned_process_count": 4, "reclaimable_bytes": 10081419264, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 55.454027333000006, "owned_rss_bytes": 731496448, "owned_process_count": 4, "reclaimable_bytes": 10162208768, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 55.681228667000006, "owned_rss_bytes": 744620032, "owned_process_count": 4, "reclaimable_bytes": 10180706304, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 55.910540875, "owned_rss_bytes": 753156096, "owned_process_count": 4, "reclaimable_bytes": 10172006400, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 56.138879208000006, "owned_rss_bytes": 766345216, "owned_process_count": 4, "reclaimable_bytes": 10163929088, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 56.364260958, "owned_rss_bytes": 775946240, "owned_process_count": 4, "reclaimable_bytes": 10077962240, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 56.596095500000004, "owned_rss_bytes": 786448384, "owned_process_count": 4, "reclaimable_bytes": 10068754432, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 56.826412792000006, "owned_rss_bytes": 792559616, "owned_process_count": 4, "reclaimable_bytes": 10055958528, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 57.0564395, "owned_rss_bytes": 795574272, "owned_process_count": 4, "reclaimable_bytes": 10053124096, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 57.284947208000006, "owned_rss_bytes": 804126720, "owned_process_count": 4, "reclaimable_bytes": 9954361344, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 57.515397458, "owned_rss_bytes": 818036736, "owned_process_count": 4, "reclaimable_bytes": 9841131520, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 57.750034083, "owned_rss_bytes": 827228160, "owned_process_count": 4, "reclaimable_bytes": 10352312320, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 57.97957075, "owned_rss_bytes": 842678272, "owned_process_count": 4, "reclaimable_bytes": 10342924288, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 58.208953792, "owned_rss_bytes": 845971456, "owned_process_count": 4, "reclaimable_bytes": 10337878016, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 58.437751667, "owned_rss_bytes": 854114304, "owned_process_count": 4, "reclaimable_bytes": 10336223232, "swapins": 44109445, "swapouts": 77525502}
{"elapsed_seconds": 58.667039958000004, "owned_rss_bytes": 865026048, "owned_process_count": 4, "reclaimable_bytes": 10326097920, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 58.897152000000006, "owned_rss_bytes": 872284160, "owned_process_count": 4, "reclaimable_bytes": 10324819968, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 59.127158375, "owned_rss_bytes": 872857600, "owned_process_count": 4, "reclaimable_bytes": 10317250560, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 59.358028833000006, "owned_rss_bytes": 872939520, "owned_process_count": 4, "reclaimable_bytes": 10291593216, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 59.585864667, "owned_rss_bytes": 881934336, "owned_process_count": 4, "reclaimable_bytes": 10274537472, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 59.81638825, "owned_rss_bytes": 882556928, "owned_process_count": 4, "reclaimable_bytes": 10271539200, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 60.045595292, "owned_rss_bytes": 885571584, "owned_process_count": 4, "reclaimable_bytes": 10264379392, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 60.275266333000005, "owned_rss_bytes": 886865920, "owned_process_count": 4, "reclaimable_bytes": 10271293440, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 60.499385917000005, "owned_rss_bytes": 888766464, "owned_process_count": 4, "reclaimable_bytes": 10270900224, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 60.728969917, "owned_rss_bytes": 889667584, "owned_process_count": 4, "reclaimable_bytes": 10450632704, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 60.957820667, "owned_rss_bytes": 891568128, "owned_process_count": 4, "reclaimable_bytes": 10583638016, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 61.190500208, "owned_rss_bytes": 898088960, "owned_process_count": 4, "reclaimable_bytes": 10624008192, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 61.420411417000004, "owned_rss_bytes": 899710976, "owned_process_count": 4, "reclaimable_bytes": 10577330176, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 61.651576667, "owned_rss_bytes": 901791744, "owned_process_count": 4, "reclaimable_bytes": 10555179008, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 61.881492708, "owned_rss_bytes": 902987776, "owned_process_count": 4, "reclaimable_bytes": 10636509184, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 62.111073333, "owned_rss_bytes": 905396224, "owned_process_count": 4, "reclaimable_bytes": 10627989504, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 62.339042625000005, "owned_rss_bytes": 906821632, "owned_process_count": 4, "reclaimable_bytes": 10622091264, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 62.569357083, "owned_rss_bytes": 908460032, "owned_process_count": 4, "reclaimable_bytes": 10667900928, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 62.798257875000004, "owned_rss_bytes": 910458880, "owned_process_count": 4, "reclaimable_bytes": 10679599104, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 63.024691208, "owned_rss_bytes": 911097856, "owned_process_count": 4, "reclaimable_bytes": 10691837952, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 63.2553575, "owned_rss_bytes": 911671296, "owned_process_count": 4, "reclaimable_bytes": 10688053248, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 63.485170333, "owned_rss_bytes": 912064512, "owned_process_count": 4, "reclaimable_bytes": 10662985728, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 63.71466550000001, "owned_rss_bytes": 916766720, "owned_process_count": 4, "reclaimable_bytes": 10651992064, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 63.9460505, "owned_rss_bytes": 926023680, "owned_process_count": 4, "reclaimable_bytes": 10640965632, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 64.175571, "owned_rss_bytes": 927531008, "owned_process_count": 4, "reclaimable_bytes": 10764075008, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 64.40263179200001, "owned_rss_bytes": 932020224, "owned_process_count": 4, "reclaimable_bytes": 10753032192, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 64.628753708, "owned_rss_bytes": 934985728, "owned_process_count": 4, "reclaimable_bytes": 10721951744, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 64.862580917, "owned_rss_bytes": 944406528, "owned_process_count": 4, "reclaimable_bytes": 10534453248, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 65.093274792, "owned_rss_bytes": 954695680, "owned_process_count": 4, "reclaimable_bytes": 10505289728, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 65.32451075, "owned_rss_bytes": 962084864, "owned_process_count": 4, "reclaimable_bytes": 10511892480, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 65.5511645, "owned_rss_bytes": 972963840, "owned_process_count": 4, "reclaimable_bytes": 10510352384, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 65.78061245800001, "owned_rss_bytes": 975994880, "owned_process_count": 4, "reclaimable_bytes": 10499538944, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 66.00708766700001, "owned_rss_bytes": 983302144, "owned_process_count": 4, "reclaimable_bytes": 10650992640, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 66.236802542, "owned_rss_bytes": 986447872, "owned_process_count": 4, "reclaimable_bytes": 10444898304, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 66.466211042, "owned_rss_bytes": 987971584, "owned_process_count": 4, "reclaimable_bytes": 10444718080, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 66.694420083, "owned_rss_bytes": 987987968, "owned_process_count": 4, "reclaimable_bytes": 10459267072, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 66.92191504200001, "owned_rss_bytes": 988020736, "owned_process_count": 4, "reclaimable_bytes": 10439622656, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 67.150030583, "owned_rss_bytes": 988086272, "owned_process_count": 4, "reclaimable_bytes": 10488922112, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 67.37498625, "owned_rss_bytes": 988086272, "owned_process_count": 4, "reclaimable_bytes": 10481827840, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 67.6002235, "owned_rss_bytes": 988102656, "owned_process_count": 4, "reclaimable_bytes": 10482434048, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 67.829491917, "owned_rss_bytes": 988135424, "owned_process_count": 4, "reclaimable_bytes": 10486251520, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 68.0591905, "owned_rss_bytes": 988692480, "owned_process_count": 4, "reclaimable_bytes": 10601136128, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 68.290100792, "owned_rss_bytes": 990134272, "owned_process_count": 4, "reclaimable_bytes": 10615406592, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 68.520453167, "owned_rss_bytes": 990609408, "owned_process_count": 4, "reclaimable_bytes": 10600775680, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 68.749549792, "owned_rss_bytes": 990855168, "owned_process_count": 4, "reclaimable_bytes": 10604822528, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 68.980297417, "owned_rss_bytes": 991510528, "owned_process_count": 4, "reclaimable_bytes": 10597859328, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 69.210170792, "owned_rss_bytes": 991641600, "owned_process_count": 4, "reclaimable_bytes": 10618503168, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 69.438746167, "owned_rss_bytes": 991674368, "owned_process_count": 4, "reclaimable_bytes": 10606526464, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 69.66866458300001, "owned_rss_bytes": 991707136, "owned_process_count": 4, "reclaimable_bytes": 10605363200, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 69.89866391700001, "owned_rss_bytes": 991887360, "owned_process_count": 4, "reclaimable_bytes": 10423615488, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 70.12401016700001, "owned_rss_bytes": 992477184, "owned_process_count": 4, "reclaimable_bytes": 10424827904, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 70.353205083, "owned_rss_bytes": 992559104, "owned_process_count": 4, "reclaimable_bytes": 10428366848, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 70.583381333, "owned_rss_bytes": 992591872, "owned_process_count": 4, "reclaimable_bytes": 10425581568, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 70.813883542, "owned_rss_bytes": 993361920, "owned_process_count": 4, "reclaimable_bytes": 10420240384, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 71.04388375, "owned_rss_bytes": 994164736, "owned_process_count": 4, "reclaimable_bytes": 10569809920, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 71.270862417, "owned_rss_bytes": 994230272, "owned_process_count": 4, "reclaimable_bytes": 10579787776, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 71.5007925, "owned_rss_bytes": 994263040, "owned_process_count": 4, "reclaimable_bytes": 10663542784, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 71.72726075, "owned_rss_bytes": 994295808, "owned_process_count": 4, "reclaimable_bytes": 10682023936, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 71.962301458, "owned_rss_bytes": 994918400, "owned_process_count": 4, "reclaimable_bytes": 10682433536, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 72.19183575000001, "owned_rss_bytes": 995065856, "owned_process_count": 4, "reclaimable_bytes": 10691690496, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 72.41808950000001, "owned_rss_bytes": 995098624, "owned_process_count": 4, "reclaimable_bytes": 10687889408, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 72.647974625, "owned_rss_bytes": 995131392, "owned_process_count": 4, "reclaimable_bytes": 10683400192, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 72.877623458, "owned_rss_bytes": 995180544, "owned_process_count": 4, "reclaimable_bytes": 10682433536, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 73.10306383300001, "owned_rss_bytes": 995180544, "owned_process_count": 4, "reclaimable_bytes": 10685939712, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 73.332000667, "owned_rss_bytes": 995229696, "owned_process_count": 4, "reclaimable_bytes": 10683203584, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 73.559039833, "owned_rss_bytes": 995246080, "owned_process_count": 4, "reclaimable_bytes": 10682613760, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 73.785280625, "owned_rss_bytes": 995540992, "owned_process_count": 4, "reclaimable_bytes": 10685349888, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 74.015734667, "owned_rss_bytes": 995803136, "owned_process_count": 4, "reclaimable_bytes": 10585030656, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 74.24426700000001, "owned_rss_bytes": 1079214080, "owned_process_count": 4, "reclaimable_bytes": 10496868352, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 74.474602958, "owned_rss_bytes": 1217724416, "owned_process_count": 4, "reclaimable_bytes": 10354049024, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 74.705009292, "owned_rss_bytes": 1359167488, "owned_process_count": 4, "reclaimable_bytes": 10238132224, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 74.94072833300001, "owned_rss_bytes": 1378304000, "owned_process_count": 4, "reclaimable_bytes": 10220961792, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 75.17319570800001, "owned_rss_bytes": 1379106816, "owned_process_count": 4, "reclaimable_bytes": 10220683264, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 75.399720417, "owned_rss_bytes": 133496832, "owned_process_count": 4, "reclaimable_bytes": 11291049984, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 75.627112083, "owned_rss_bytes": 251985920, "owned_process_count": 4, "reclaimable_bytes": 11254366208, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 75.857366875, "owned_rss_bytes": 269647872, "owned_process_count": 4, "reclaimable_bytes": 11236179968, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 76.085819833, "owned_rss_bytes": 307134464, "owned_process_count": 4, "reclaimable_bytes": 11197562880, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 76.31672458300001, "owned_rss_bytes": 326205440, "owned_process_count": 4, "reclaimable_bytes": 10998104064, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 76.547406958, "owned_rss_bytes": 348323840, "owned_process_count": 4, "reclaimable_bytes": 10976051200, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 76.775930875, "owned_rss_bytes": 365723648, "owned_process_count": 4, "reclaimable_bytes": 10961174528, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 77.006547792, "owned_rss_bytes": 387760128, "owned_process_count": 4, "reclaimable_bytes": 10945642496, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 77.24098366700001, "owned_rss_bytes": 400736256, "owned_process_count": 4, "reclaimable_bytes": 10925293568, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 77.469058667, "owned_rss_bytes": 417579008, "owned_process_count": 4, "reclaimable_bytes": 10900193280, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 77.699200875, "owned_rss_bytes": 434454528, "owned_process_count": 4, "reclaimable_bytes": 10985488384, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 77.924022333, "owned_rss_bytes": 441991168, "owned_process_count": 4, "reclaimable_bytes": 10979704832, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 78.15376033300001, "owned_rss_bytes": 443973632, "owned_process_count": 4, "reclaimable_bytes": 10879221760, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 78.381673125, "owned_rss_bytes": 446382080, "owned_process_count": 4, "reclaimable_bytes": 10881105920, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 78.61164391700001, "owned_rss_bytes": 452493312, "owned_process_count": 4, "reclaimable_bytes": 10871603200, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 78.84058191700001, "owned_rss_bytes": 455606272, "owned_process_count": 4, "reclaimable_bytes": 10867195904, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 79.066456333, "owned_rss_bytes": 457129984, "owned_process_count": 4, "reclaimable_bytes": 10938482688, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 79.295484208, "owned_rss_bytes": 463601664, "owned_process_count": 4, "reclaimable_bytes": 10933944320, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 79.52403662500001, "owned_rss_bytes": 467173376, "owned_process_count": 4, "reclaimable_bytes": 10878992384, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 79.754823792, "owned_rss_bytes": 467435520, "owned_process_count": 4, "reclaimable_bytes": 10872389632, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 79.985765708, "owned_rss_bytes": 468123648, "owned_process_count": 4, "reclaimable_bytes": 10875797504, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 80.214496917, "owned_rss_bytes": 468746240, "owned_process_count": 4, "reclaimable_bytes": 10879647744, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 80.44407783300001, "owned_rss_bytes": 468893696, "owned_process_count": 4, "reclaimable_bytes": 10880073728, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 80.67359912500001, "owned_rss_bytes": 469204992, "owned_process_count": 4, "reclaimable_bytes": 10891706368, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 80.899369125, "owned_rss_bytes": 482770944, "owned_process_count": 4, "reclaimable_bytes": 11032428544, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 81.129972208, "owned_rss_bytes": 600014848, "owned_process_count": 4, "reclaimable_bytes": 10926456832, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 81.359931125, "owned_rss_bytes": 294404096, "owned_process_count": 4, "reclaimable_bytes": 11233640448, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 81.590406833, "owned_rss_bytes": 308183040, "owned_process_count": 4, "reclaimable_bytes": 11217993728, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 81.818116833, "owned_rss_bytes": 323747840, "owned_process_count": 4, "reclaimable_bytes": 11222319104, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 82.044440458, "owned_rss_bytes": 350846976, "owned_process_count": 4, "reclaimable_bytes": 11190353920, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 82.275230542, "owned_rss_bytes": 374718464, "owned_process_count": 4, "reclaimable_bytes": 10981031936, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 82.499796208, "owned_rss_bytes": 389300224, "owned_process_count": 4, "reclaimable_bytes": 10975019008, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 82.729537792, "owned_rss_bytes": 404570112, "owned_process_count": 4, "reclaimable_bytes": 11048255488, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 82.956765, "owned_rss_bytes": 408141824, "owned_process_count": 4, "reclaimable_bytes": 11041570816, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 83.185383208, "owned_rss_bytes": 408829952, "owned_process_count": 4, "reclaimable_bytes": 11041275904, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 83.41112504200001, "owned_rss_bytes": 411631616, "owned_process_count": 4, "reclaimable_bytes": 11045044224, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 83.637224083, "owned_rss_bytes": 412188672, "owned_process_count": 4, "reclaimable_bytes": 11044241408, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 83.865213208, "owned_rss_bytes": 414728192, "owned_process_count": 4, "reclaimable_bytes": 11221647360, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 84.090715625, "owned_rss_bytes": 420904960, "owned_process_count": 4, "reclaimable_bytes": 11222220800, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 84.320311125, "owned_rss_bytes": 422641664, "owned_process_count": 4, "reclaimable_bytes": 11224121344, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 84.54853345800001, "owned_rss_bytes": 422952960, "owned_process_count": 4, "reclaimable_bytes": 11231526912, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 84.776422458, "owned_rss_bytes": 423264256, "owned_process_count": 4, "reclaimable_bytes": 11156652032, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 85.004498333, "owned_rss_bytes": 424001536, "owned_process_count": 4, "reclaimable_bytes": 11151294464, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 85.230186833, "owned_rss_bytes": 469385216, "owned_process_count": 4, "reclaimable_bytes": 11106025472, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 85.459363583, "owned_rss_bytes": 492011520, "owned_process_count": 4, "reclaimable_bytes": 11183046656, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 85.68608204200001, "owned_rss_bytes": 567541760, "owned_process_count": 4, "reclaimable_bytes": 11125866496, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 85.914483375, "owned_rss_bytes": 568295424, "owned_process_count": 4, "reclaimable_bytes": 11191566336, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 86.142844833, "owned_rss_bytes": 568492032, "owned_process_count": 4, "reclaimable_bytes": 11191189504, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 86.371737958, "owned_rss_bytes": 568639488, "owned_process_count": 4, "reclaimable_bytes": 10826809344, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 86.59977633300001, "owned_rss_bytes": 571604992, "owned_process_count": 4, "reclaimable_bytes": 10832084992, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 86.82963025000001, "owned_rss_bytes": 572669952, "owned_process_count": 4, "reclaimable_bytes": 10829430784, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 87.058021, "owned_rss_bytes": 583663616, "owned_process_count": 4, "reclaimable_bytes": 10822385664, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 87.28825583300001, "owned_rss_bytes": 590626816, "owned_process_count": 4, "reclaimable_bytes": 10890231808, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 87.517391, "owned_rss_bytes": 596836352, "owned_process_count": 4, "reclaimable_bytes": 10810720256, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 87.746618958, "owned_rss_bytes": 607846400, "owned_process_count": 4, "reclaimable_bytes": 11041996800, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 87.975313125, "owned_rss_bytes": 613941248, "owned_process_count": 4, "reclaimable_bytes": 11033477120, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 88.201728625, "owned_rss_bytes": 618037248, "owned_process_count": 4, "reclaimable_bytes": 11036311552, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 88.426323333, "owned_rss_bytes": 623476736, "owned_process_count": 4, "reclaimable_bytes": 10956144640, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 88.65612725, "owned_rss_bytes": 630947840, "owned_process_count": 4, "reclaimable_bytes": 11231772672, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 88.88059075, "owned_rss_bytes": 631095296, "owned_process_count": 4, "reclaimable_bytes": 11230576640, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 89.10820258300001, "owned_rss_bytes": 639975424, "owned_process_count": 4, "reclaimable_bytes": 11064147968, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 89.337432542, "owned_rss_bytes": 642433024, "owned_process_count": 4, "reclaimable_bytes": 11060510720, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 89.563510167, "owned_rss_bytes": 644972544, "owned_process_count": 4, "reclaimable_bytes": 11055104000, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 89.792229, "owned_rss_bytes": 645332992, "owned_process_count": 4, "reclaimable_bytes": 11051876352, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 90.021312542, "owned_rss_bytes": 649478144, "owned_process_count": 4, "reclaimable_bytes": 11053629440, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 90.24454212500001, "owned_rss_bytes": 652476416, "owned_process_count": 4, "reclaimable_bytes": 11050893312, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 90.473216917, "owned_rss_bytes": 657391616, "owned_process_count": 4, "reclaimable_bytes": 11124523008, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 90.701679958, "owned_rss_bytes": 659423232, "owned_process_count": 4, "reclaimable_bytes": 11128995840, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 90.931163, "owned_rss_bytes": 662110208, "owned_process_count": 4, "reclaimable_bytes": 11119312896, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 91.160580667, "owned_rss_bytes": 664944640, "owned_process_count": 4, "reclaimable_bytes": 11123949568, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 91.389610542, "owned_rss_bytes": 668925952, "owned_process_count": 4, "reclaimable_bytes": 11117772800, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 91.61644, "owned_rss_bytes": 670121984, "owned_process_count": 4, "reclaimable_bytes": 11119165440, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 91.845943833, "owned_rss_bytes": 673382400, "owned_process_count": 4, "reclaimable_bytes": 11111022592, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 92.075308083, "owned_rss_bytes": 675708928, "owned_process_count": 4, "reclaimable_bytes": 11112775680, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 92.30283325, "owned_rss_bytes": 676397056, "owned_process_count": 4, "reclaimable_bytes": 11115053056, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 92.531415458, "owned_rss_bytes": 678756352, "owned_process_count": 4, "reclaimable_bytes": 11111743488, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 92.760412083, "owned_rss_bytes": 681132032, "owned_process_count": 4, "reclaimable_bytes": 11114528768, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 92.989273208, "owned_rss_bytes": 681443328, "owned_process_count": 4, "reclaimable_bytes": 11110449152, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 93.219022458, "owned_rss_bytes": 684310528, "owned_process_count": 4, "reclaimable_bytes": 11109875712, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 93.447587833, "owned_rss_bytes": 686784512, "owned_process_count": 4, "reclaimable_bytes": 11111399424, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 93.676211458, "owned_rss_bytes": 689258496, "owned_process_count": 4, "reclaimable_bytes": 11104288768, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 93.905146292, "owned_rss_bytes": 689340416, "owned_process_count": 4, "reclaimable_bytes": 11107074048, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 94.130592875, "owned_rss_bytes": 696238080, "owned_process_count": 4, "reclaimable_bytes": 11135008768, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 94.35840887500001, "owned_rss_bytes": 697008128, "owned_process_count": 4, "reclaimable_bytes": 11130650624, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 94.584101167, "owned_rss_bytes": 705495040, "owned_process_count": 4, "reclaimable_bytes": 11118346240, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 94.81366308300001, "owned_rss_bytes": 707084288, "owned_process_count": 4, "reclaimable_bytes": 11112628224, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 95.04332404200001, "owned_rss_bytes": 711426048, "owned_process_count": 4, "reclaimable_bytes": 11054907392, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 95.276892708, "owned_rss_bytes": 711933952, "owned_process_count": 4, "reclaimable_bytes": 9943367680, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 95.51104550000001, "owned_rss_bytes": 713670656, "owned_process_count": 4, "reclaimable_bytes": 9795633152, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 95.743562583, "owned_rss_bytes": 714801152, "owned_process_count": 4, "reclaimable_bytes": 9782919168, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 95.973573875, "owned_rss_bytes": 715816960, "owned_process_count": 4, "reclaimable_bytes": 9831170048, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 96.20446295800001, "owned_rss_bytes": 718422016, "owned_process_count": 4, "reclaimable_bytes": 9817423872, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 96.437175542, "owned_rss_bytes": 719290368, "owned_process_count": 4, "reclaimable_bytes": 9822617600, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 96.669193542, "owned_rss_bytes": 719683584, "owned_process_count": 4, "reclaimable_bytes": 9643114496, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 96.895687833, "owned_rss_bytes": 721141760, "owned_process_count": 4, "reclaimable_bytes": 9690300416, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 97.12761020800001, "owned_rss_bytes": 721829888, "owned_process_count": 4, "reclaimable_bytes": 9653583872, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 97.358412583, "owned_rss_bytes": 721928192, "owned_process_count": 4, "reclaimable_bytes": 9619275776, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 97.589111583, "owned_rss_bytes": 722452480, "owned_process_count": 4, "reclaimable_bytes": 9778216960, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 97.81800320800001, "owned_rss_bytes": 722976768, "owned_process_count": 4, "reclaimable_bytes": 9794846720, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 98.04984779200001, "owned_rss_bytes": 725303296, "owned_process_count": 4, "reclaimable_bytes": 9780133888, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 98.282339792, "owned_rss_bytes": 725630976, "owned_process_count": 4, "reclaimable_bytes": 9779986432, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 98.513504375, "owned_rss_bytes": 725745664, "owned_process_count": 4, "reclaimable_bytes": 9771483136, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 98.741915375, "owned_rss_bytes": 725778432, "owned_process_count": 4, "reclaimable_bytes": 9770123264, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 98.972942167, "owned_rss_bytes": 730284032, "owned_process_count": 4, "reclaimable_bytes": 9761193984, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 99.199755708, "owned_rss_bytes": 731217920, "owned_process_count": 4, "reclaimable_bytes": 9765863424, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 99.43131587500001, "owned_rss_bytes": 731250688, "owned_process_count": 4, "reclaimable_bytes": 9769893888, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 99.66282833300001, "owned_rss_bytes": 736837632, "owned_process_count": 4, "reclaimable_bytes": 9766436864, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 99.88967525, "owned_rss_bytes": 739131392, "owned_process_count": 4, "reclaimable_bytes": 9758572544, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 100.11798229200001, "owned_rss_bytes": 740900864, "owned_process_count": 4, "reclaimable_bytes": 9750364160, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 100.347920875, "owned_rss_bytes": 741097472, "owned_process_count": 4, "reclaimable_bytes": 9760243712, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 100.579708208, "owned_rss_bytes": 741179392, "owned_process_count": 4, "reclaimable_bytes": 9758212096, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 100.80864025, "owned_rss_bytes": 741900288, "owned_process_count": 4, "reclaimable_bytes": 9762619392, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 101.038643542, "owned_rss_bytes": 741900288, "owned_process_count": 4, "reclaimable_bytes": 9754607616, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 101.27069420800001, "owned_rss_bytes": 741900288, "owned_process_count": 4, "reclaimable_bytes": 9756213248, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 101.50160541700001, "owned_rss_bytes": 744505344, "owned_process_count": 4, "reclaimable_bytes": 9756835840, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 101.73350304200001, "owned_rss_bytes": 744931328, "owned_process_count": 4, "reclaimable_bytes": 9759211520, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 101.965962458, "owned_rss_bytes": 745537536, "owned_process_count": 4, "reclaimable_bytes": 9749315584, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 102.194407458, "owned_rss_bytes": 745537536, "owned_process_count": 4, "reclaimable_bytes": 9755312128, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 102.426603167, "owned_rss_bytes": 745537536, "owned_process_count": 4, "reclaimable_bytes": 9754689536, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 102.657797542, "owned_rss_bytes": 745537536, "owned_process_count": 4, "reclaimable_bytes": 9757573120, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 102.886137375, "owned_rss_bytes": 745996288, "owned_process_count": 4, "reclaimable_bytes": 9756639232, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 103.116463042, "owned_rss_bytes": 747175936, "owned_process_count": 4, "reclaimable_bytes": 9754656768, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 103.347368167, "owned_rss_bytes": 749862912, "owned_process_count": 4, "reclaimable_bytes": 9751511040, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 103.575039292, "owned_rss_bytes": 757071872, "owned_process_count": 4, "reclaimable_bytes": 9742270464, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 103.807406458, "owned_rss_bytes": 759054336, "owned_process_count": 4, "reclaimable_bytes": 9746432000, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 104.037802458, "owned_rss_bytes": 759054336, "owned_process_count": 4, "reclaimable_bytes": 9743450112, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 104.269285167, "owned_rss_bytes": 759250944, "owned_process_count": 4, "reclaimable_bytes": 9832415232, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 104.497615042, "owned_rss_bytes": 759250944, "owned_process_count": 4, "reclaimable_bytes": 9831972864, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 104.72894195800001, "owned_rss_bytes": 760102912, "owned_process_count": 4, "reclaimable_bytes": 9840263168, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 104.960064, "owned_rss_bytes": 760315904, "owned_process_count": 4, "reclaimable_bytes": 9844785152, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 105.18828987500001, "owned_rss_bytes": 761184256, "owned_process_count": 4, "reclaimable_bytes": 9841573888, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 105.420088, "owned_rss_bytes": 761200640, "owned_process_count": 4, "reclaimable_bytes": 9843441664, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 105.651482042, "owned_rss_bytes": 761200640, "owned_process_count": 4, "reclaimable_bytes": 9844047872, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 105.883566833, "owned_rss_bytes": 761856000, "owned_process_count": 4, "reclaimable_bytes": 9839214592, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 106.114842542, "owned_rss_bytes": 762478592, "owned_process_count": 4, "reclaimable_bytes": 9841295360, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 106.345606708, "owned_rss_bytes": 762658816, "owned_process_count": 4, "reclaimable_bytes": 9834889216, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 106.576276667, "owned_rss_bytes": 763461632, "owned_process_count": 4, "reclaimable_bytes": 9833431040, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 106.80785129200001, "owned_rss_bytes": 765214720, "owned_process_count": 4, "reclaimable_bytes": 9837248512, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 107.035610833, "owned_rss_bytes": 788086784, "owned_process_count": 4, "reclaimable_bytes": 9816358912, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 107.265262542, "owned_rss_bytes": 791855104, "owned_process_count": 4, "reclaimable_bytes": 9808101376, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 107.494807875, "owned_rss_bytes": 791904256, "owned_process_count": 4, "reclaimable_bytes": 9808232448, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 107.72576525000001, "owned_rss_bytes": 792608768, "owned_process_count": 4, "reclaimable_bytes": 9810771968, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 107.956872917, "owned_rss_bytes": 794460160, "owned_process_count": 4, "reclaimable_bytes": 9808953344, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 108.188951833, "owned_rss_bytes": 794984448, "owned_process_count": 4, "reclaimable_bytes": 9807593472, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 108.417225542, "owned_rss_bytes": 795672576, "owned_process_count": 4, "reclaimable_bytes": 9806086144, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 108.645369792, "owned_rss_bytes": 796475392, "owned_process_count": 4, "reclaimable_bytes": 9807364096, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 108.87777075, "owned_rss_bytes": 796508160, "owned_process_count": 4, "reclaimable_bytes": 9577086976, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 109.10806441700001, "owned_rss_bytes": 794984448, "owned_process_count": 4, "reclaimable_bytes": 9579692032, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 109.33873712500001, "owned_rss_bytes": 794984448, "owned_process_count": 4, "reclaimable_bytes": 9498607616, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 109.58117825000001, "owned_rss_bytes": 796049408, "owned_process_count": 4, "reclaimable_bytes": 9359802368, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 109.81585275, "owned_rss_bytes": 797016064, "owned_process_count": 4, "reclaimable_bytes": 9307537408, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 110.04871787500001, "owned_rss_bytes": 803291136, "owned_process_count": 4, "reclaimable_bytes": 9325625344, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 110.27525875, "owned_rss_bytes": 803373056, "owned_process_count": 4, "reclaimable_bytes": 9342713856, "swapins": 44109449, "swapouts": 77525502}
{"elapsed_seconds": 110.508942917, "owned_rss_bytes": 803471360, "owned_process_count": 4, "reclaimable_bytes": 9199042560, "swapins": 44109469, "swapouts": 77525502}
{"elapsed_seconds": 110.738412375, "owned_rss_bytes": 803749888, "owned_process_count": 4, "reclaimable_bytes": 8940945408, "swapins": 44109501, "swapouts": 77525502}
{"elapsed_seconds": 110.99469570800001, "owned_rss_bytes": 803962880, "owned_process_count": 4, "reclaimable_bytes": 8839380992, "swapins": 44109513, "swapouts": 77525502}
{"elapsed_seconds": 111.23715629200001, "owned_rss_bytes": 803962880, "owned_process_count": 4, "reclaimable_bytes": 8664088576, "swapins": 44109513, "swapouts": 77525502}
{"elapsed_seconds": 111.49092508300001, "owned_rss_bytes": 804847616, "owned_process_count": 4, "reclaimable_bytes": 8756101120, "swapins": 44109513, "swapouts": 77525502}
{"elapsed_seconds": 111.785598667, "owned_rss_bytes": 805257216, "owned_process_count": 4, "reclaimable_bytes": 9012461568, "swapins": 44109525, "swapouts": 77525502}
{"elapsed_seconds": 112.028037458, "owned_rss_bytes": 810598400, "owned_process_count": 4, "reclaimable_bytes": 8830631936, "swapins": 44109525, "swapouts": 77525502}
{"elapsed_seconds": 112.27577050000001, "owned_rss_bytes": 810647552, "owned_process_count": 4, "reclaimable_bytes": 8793325568, "swapins": 44109577, "swapouts": 77525502}
{"elapsed_seconds": 112.5052495, "owned_rss_bytes": 811941888, "owned_process_count": 4, "reclaimable_bytes": 8781348864, "swapins": 44109589, "swapouts": 77525502}
{"elapsed_seconds": 112.738233542, "owned_rss_bytes": 813383680, "owned_process_count": 4, "reclaimable_bytes": 8816640000, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 112.971222333, "owned_rss_bytes": 813383680, "owned_process_count": 4, "reclaimable_bytes": 8818671616, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 113.204047917, "owned_rss_bytes": 814448640, "owned_process_count": 4, "reclaimable_bytes": 8896659456, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 113.437748, "owned_rss_bytes": 814514176, "owned_process_count": 4, "reclaimable_bytes": 9035939840, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 113.69970608300001, "owned_rss_bytes": 814514176, "owned_process_count": 4, "reclaimable_bytes": 9057943552, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 113.933800167, "owned_rss_bytes": 814923776, "owned_process_count": 4, "reclaimable_bytes": 9071869952, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 114.166032125, "owned_rss_bytes": 814940160, "owned_process_count": 4, "reclaimable_bytes": 9073803264, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 114.39812558300001, "owned_rss_bytes": 814710784, "owned_process_count": 4, "reclaimable_bytes": 9030008832, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 114.63257275000001, "owned_rss_bytes": 814710784, "owned_process_count": 4, "reclaimable_bytes": 9204121600, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 114.864988167, "owned_rss_bytes": 815349760, "owned_process_count": 4, "reclaimable_bytes": 9216360448, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 115.098810958, "owned_rss_bytes": 821411840, "owned_process_count": 4, "reclaimable_bytes": 9274753024, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 115.333908917, "owned_rss_bytes": 821592064, "owned_process_count": 4, "reclaimable_bytes": 9283567616, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 115.5665575, "owned_rss_bytes": 821755904, "owned_process_count": 4, "reclaimable_bytes": 9282928640, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 115.799982042, "owned_rss_bytes": 821772288, "owned_process_count": 4, "reclaimable_bytes": 9287188480, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 116.031771042, "owned_rss_bytes": 821952512, "owned_process_count": 4, "reclaimable_bytes": 9286909952, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 116.264914167, "owned_rss_bytes": 821952512, "owned_process_count": 4, "reclaimable_bytes": 9287237632, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 116.494190833, "owned_rss_bytes": 821952512, "owned_process_count": 4, "reclaimable_bytes": 9283682304, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 116.724113625, "owned_rss_bytes": 821952512, "owned_process_count": 4, "reclaimable_bytes": 10624368640, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 116.953334708, "owned_rss_bytes": 822886400, "owned_process_count": 4, "reclaimable_bytes": 10537320448, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 117.181408917, "owned_rss_bytes": 823115776, "owned_process_count": 4, "reclaimable_bytes": 9483993088, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 117.41348095800001, "owned_rss_bytes": 823312384, "owned_process_count": 4, "reclaimable_bytes": 10640359424, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 117.64275625, "owned_rss_bytes": 824098816, "owned_process_count": 4, "reclaimable_bytes": 10728112128, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 117.874251542, "owned_rss_bytes": 826392576, "owned_process_count": 4, "reclaimable_bytes": 10731110400, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 118.102583583, "owned_rss_bytes": 826474496, "owned_process_count": 4, "reclaimable_bytes": 10748198912, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 118.331515333, "owned_rss_bytes": 826490880, "owned_process_count": 4, "reclaimable_bytes": 10764976128, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 118.559185375, "owned_rss_bytes": 826605568, "owned_process_count": 4, "reclaimable_bytes": 10750705664, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 118.785602, "owned_rss_bytes": 827473920, "owned_process_count": 4, "reclaimable_bytes": 10739384320, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 119.014142625, "owned_rss_bytes": 827473920, "owned_process_count": 4, "reclaimable_bytes": 10730799104, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 119.24333812500001, "owned_rss_bytes": 831946752, "owned_process_count": 4, "reclaimable_bytes": 10714660864, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 119.472992375, "owned_rss_bytes": 845168640, "owned_process_count": 4, "reclaimable_bytes": 10696130560, "swapins": 44109593, "swapouts": 77525502}
{"elapsed_seconds": 119.70247545800001, "owned_rss_bytes": 845758464, "owned_process_count": 4, "reclaimable_bytes": 10666885120, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 119.93086037500001, "owned_rss_bytes": 845758464, "owned_process_count": 4, "reclaimable_bytes": 10668687360, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 120.159333875, "owned_rss_bytes": 845905920, "owned_process_count": 4, "reclaimable_bytes": 10666180608, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 120.38892629200001, "owned_rss_bytes": 846462976, "owned_process_count": 4, "reclaimable_bytes": 10477846528, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 120.618226375, "owned_rss_bytes": 847265792, "owned_process_count": 4, "reclaimable_bytes": 10473603072, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 120.847729875, "owned_rss_bytes": 847298560, "owned_process_count": 4, "reclaimable_bytes": 10476257280, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 121.072709, "owned_rss_bytes": 847298560, "owned_process_count": 4, "reclaimable_bytes": 10476617728, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 121.30232941700001, "owned_rss_bytes": 847298560, "owned_process_count": 4, "reclaimable_bytes": 10466787328, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 121.531071542, "owned_rss_bytes": 847298560, "owned_process_count": 4, "reclaimable_bytes": 10637901824, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 121.756024917, "owned_rss_bytes": 847298560, "owned_process_count": 4, "reclaimable_bytes": 10660036608, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 121.9829445, "owned_rss_bytes": 847298560, "owned_process_count": 4, "reclaimable_bytes": 10650566656, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 122.21191204200001, "owned_rss_bytes": 847544320, "owned_process_count": 4, "reclaimable_bytes": 10644996096, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 122.441349125, "owned_rss_bytes": 847675392, "owned_process_count": 4, "reclaimable_bytes": 10645241856, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 122.670230708, "owned_rss_bytes": 847691776, "owned_process_count": 4, "reclaimable_bytes": 10646011904, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 122.898899333, "owned_rss_bytes": 847904768, "owned_process_count": 4, "reclaimable_bytes": 10650943488, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 123.127206083, "owned_rss_bytes": 847921152, "owned_process_count": 4, "reclaimable_bytes": 10649927680, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 123.35240533300001, "owned_rss_bytes": 848429056, "owned_process_count": 4, "reclaimable_bytes": 10646470656, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 123.577310208, "owned_rss_bytes": 848429056, "owned_process_count": 4, "reclaimable_bytes": 10453417984, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 123.801743875, "owned_rss_bytes": 848494592, "owned_process_count": 4, "reclaimable_bytes": 10454171648, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 124.03156375, "owned_rss_bytes": 848691200, "owned_process_count": 4, "reclaimable_bytes": 10460954624, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 124.260305, "owned_rss_bytes": 848691200, "owned_process_count": 4, "reclaimable_bytes": 10459103232, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 124.486833958, "owned_rss_bytes": 848740352, "owned_process_count": 4, "reclaimable_bytes": 10355523584, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 124.711392167, "owned_rss_bytes": 848740352, "owned_process_count": 4, "reclaimable_bytes": 10545987584, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 124.93698412500001, "owned_rss_bytes": 848756736, "owned_process_count": 4, "reclaimable_bytes": 10356408320, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 125.16166591700001, "owned_rss_bytes": 848920576, "owned_process_count": 4, "reclaimable_bytes": 10359750656, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 125.391441417, "owned_rss_bytes": 848953344, "owned_process_count": 4, "reclaimable_bytes": 10404233216, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 125.619605667, "owned_rss_bytes": 849248256, "owned_process_count": 4, "reclaimable_bytes": 10406592512, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 125.84858579200001, "owned_rss_bytes": 849248256, "owned_process_count": 4, "reclaimable_bytes": 10403430400, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 126.078299125, "owned_rss_bytes": 849281024, "owned_process_count": 4, "reclaimable_bytes": 10538795008, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 126.308168875, "owned_rss_bytes": 849330176, "owned_process_count": 4, "reclaimable_bytes": 10534797312, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 126.53743945800001, "owned_rss_bytes": 850509824, "owned_process_count": 4, "reclaimable_bytes": 10530799616, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 126.7619245, "owned_rss_bytes": 850624512, "owned_process_count": 4, "reclaimable_bytes": 10552360960, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 126.98710004200001, "owned_rss_bytes": 850624512, "owned_process_count": 4, "reclaimable_bytes": 10555473920, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 127.216645708, "owned_rss_bytes": 850624512, "owned_process_count": 4, "reclaimable_bytes": 10369646592, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 127.44637625, "owned_rss_bytes": 850624512, "owned_process_count": 4, "reclaimable_bytes": 10371350528, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 127.67062666700001, "owned_rss_bytes": 850919424, "owned_process_count": 4, "reclaimable_bytes": 10369138688, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 127.899794833, "owned_rss_bytes": 850984960, "owned_process_count": 4, "reclaimable_bytes": 10463887360, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 128.12846166699998, "owned_rss_bytes": 850984960, "owned_process_count": 4, "reclaimable_bytes": 10470539264, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 128.35609095799998, "owned_rss_bytes": 851279872, "owned_process_count": 4, "reclaimable_bytes": 10467852288, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 128.58259841699999, "owned_rss_bytes": 851361792, "owned_process_count": 4, "reclaimable_bytes": 10466131968, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 128.81061095799998, "owned_rss_bytes": 851361792, "owned_process_count": 4, "reclaimable_bytes": 10652270592, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 129.038024458, "owned_rss_bytes": 851410944, "owned_process_count": 4, "reclaimable_bytes": 10650468352, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 129.264831333, "owned_rss_bytes": 851410944, "owned_process_count": 4, "reclaimable_bytes": 10654040064, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 129.494966292, "owned_rss_bytes": 851410944, "owned_process_count": 4, "reclaimable_bytes": 10652336128, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 129.72042675, "owned_rss_bytes": 851410944, "owned_process_count": 4, "reclaimable_bytes": 10651877376, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 129.949188583, "owned_rss_bytes": 851410944, "owned_process_count": 4, "reclaimable_bytes": 10649485312, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 130.177778, "owned_rss_bytes": 851673088, "owned_process_count": 4, "reclaimable_bytes": 10654744576, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 130.406823875, "owned_rss_bytes": 851722240, "owned_process_count": 4, "reclaimable_bytes": 10653548544, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 130.636482833, "owned_rss_bytes": 851755008, "owned_process_count": 4, "reclaimable_bytes": 10654236672, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 130.867676125, "owned_rss_bytes": 851755008, "owned_process_count": 4, "reclaimable_bytes": 10651385856, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 131.09589449999999, "owned_rss_bytes": 851836928, "owned_process_count": 4, "reclaimable_bytes": 10656710656, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 131.32486749999998, "owned_rss_bytes": 851968000, "owned_process_count": 4, "reclaimable_bytes": 10657726464, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 131.55098408299997, "owned_rss_bytes": 851984384, "owned_process_count": 4, "reclaimable_bytes": 10656366592, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 131.78005875, "owned_rss_bytes": 852606976, "owned_process_count": 4, "reclaimable_bytes": 10655514624, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 132.00871008299998, "owned_rss_bytes": 852639744, "owned_process_count": 4, "reclaimable_bytes": 10657234944, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 132.235281292, "owned_rss_bytes": 852787200, "owned_process_count": 4, "reclaimable_bytes": 10656776192, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 132.46545774999998, "owned_rss_bytes": 852819968, "owned_process_count": 4, "reclaimable_bytes": 10655645696, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 132.69213879199998, "owned_rss_bytes": 852819968, "owned_process_count": 4, "reclaimable_bytes": 10654220288, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 132.91772425, "owned_rss_bytes": 852819968, "owned_process_count": 4, "reclaimable_bytes": 10653892608, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 133.144668167, "owned_rss_bytes": 852819968, "owned_process_count": 4, "reclaimable_bytes": 10640949248, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 133.37062716699998, "owned_rss_bytes": 852852736, "owned_process_count": 4, "reclaimable_bytes": 10566369280, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 133.60114408299998, "owned_rss_bytes": 852852736, "owned_process_count": 4, "reclaimable_bytes": 10562224128, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 133.83139949999997, "owned_rss_bytes": 852885504, "owned_process_count": 4, "reclaimable_bytes": 10562387968, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 134.062066083, "owned_rss_bytes": 852901888, "owned_process_count": 4, "reclaimable_bytes": 10421501952, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 134.287496167, "owned_rss_bytes": 852918272, "owned_process_count": 4, "reclaimable_bytes": 9463644160, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 134.51787070799998, "owned_rss_bytes": 852951040, "owned_process_count": 4, "reclaimable_bytes": 9459761152, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 134.749031167, "owned_rss_bytes": 852951040, "owned_process_count": 4, "reclaimable_bytes": 10648961024, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 134.97758658299998, "owned_rss_bytes": 852951040, "owned_process_count": 4, "reclaimable_bytes": 10650320896, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 135.20697670799998, "owned_rss_bytes": 852967424, "owned_process_count": 4, "reclaimable_bytes": 10645848064, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 135.43566258299998, "owned_rss_bytes": 853000192, "owned_process_count": 4, "reclaimable_bytes": 10648813568, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 135.664377667, "owned_rss_bytes": 853032960, "owned_process_count": 4, "reclaimable_bytes": 10647126016, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 135.89203949999998, "owned_rss_bytes": 853032960, "owned_process_count": 4, "reclaimable_bytes": 10653859840, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 136.120768, "owned_rss_bytes": 853065728, "owned_process_count": 4, "reclaimable_bytes": 10659872768, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 136.34971679199998, "owned_rss_bytes": 853114880, "owned_process_count": 4, "reclaimable_bytes": 10655432704, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 136.578510083, "owned_rss_bytes": 853114880, "owned_process_count": 4, "reclaimable_bytes": 10657513472, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 136.80771374999998, "owned_rss_bytes": 853114880, "owned_process_count": 4, "reclaimable_bytes": 10653040640, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 137.03607804199999, "owned_rss_bytes": 853114880, "owned_process_count": 4, "reclaimable_bytes": 10651287552, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 137.264805583, "owned_rss_bytes": 853114880, "owned_process_count": 4, "reclaimable_bytes": 10650009600, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 137.491288583, "owned_rss_bytes": 853180416, "owned_process_count": 4, "reclaimable_bytes": 10650714112, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 137.717935375, "owned_rss_bytes": 853639168, "owned_process_count": 4, "reclaimable_bytes": 10648616960, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 137.945991, "owned_rss_bytes": 907952128, "owned_process_count": 4, "reclaimable_bytes": 10593894400, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 138.175892875, "owned_rss_bytes": 1061765120, "owned_process_count": 4, "reclaimable_bytes": 10431053824, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 138.41136387499998, "owned_rss_bytes": 1098006528, "owned_process_count": 4, "reclaimable_bytes": 10437296128, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 138.637374667, "owned_rss_bytes": 270139392, "owned_process_count": 4, "reclaimable_bytes": 11192156160, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 138.86710441699998, "owned_rss_bytes": 316342272, "owned_process_count": 4, "reclaimable_bytes": 11164057600, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 139.09768583299999, "owned_rss_bytes": 324141056, "owned_process_count": 4, "reclaimable_bytes": 11157651456, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 139.32714704199998, "owned_rss_bytes": 332414976, "owned_process_count": 4, "reclaimable_bytes": 11147886592, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 139.55650212499998, "owned_rss_bytes": 383795200, "owned_process_count": 4, "reclaimable_bytes": 11106156544, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 139.78568712499998, "owned_rss_bytes": 394510336, "owned_process_count": 4, "reclaimable_bytes": 11103780864, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 140.015088542, "owned_rss_bytes": 407011328, "owned_process_count": 4, "reclaimable_bytes": 11092459520, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 140.241982375, "owned_rss_bytes": 421838848, "owned_process_count": 4, "reclaimable_bytes": 11077795840, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 140.467955833, "owned_rss_bytes": 432963584, "owned_process_count": 4, "reclaimable_bytes": 11061788672, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 140.696480958, "owned_rss_bytes": 448937984, "owned_process_count": 4, "reclaimable_bytes": 11050713088, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 140.926137083, "owned_rss_bytes": 460324864, "owned_process_count": 4, "reclaimable_bytes": 11038375936, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 141.15534345799998, "owned_rss_bytes": 468975616, "owned_process_count": 4, "reclaimable_bytes": 11034624000, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 141.384885333, "owned_rss_bytes": 473268224, "owned_process_count": 4, "reclaimable_bytes": 11034132480, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 141.61331654199998, "owned_rss_bytes": 495747072, "owned_process_count": 4, "reclaimable_bytes": 10820698112, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 141.839006625, "owned_rss_bytes": 499171328, "owned_process_count": 4, "reclaimable_bytes": 10816995328, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 142.068774167, "owned_rss_bytes": 505806848, "owned_process_count": 4, "reclaimable_bytes": 10841653248, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 142.298548042, "owned_rss_bytes": 509296640, "owned_process_count": 4, "reclaimable_bytes": 10837114880, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 142.52860579199998, "owned_rss_bytes": 514015232, "owned_process_count": 4, "reclaimable_bytes": 10831953920, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 142.757478583, "owned_rss_bytes": 520126464, "owned_process_count": 4, "reclaimable_bytes": 10822385664, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 142.98500016699998, "owned_rss_bytes": 524763136, "owned_process_count": 4, "reclaimable_bytes": 10822156288, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 143.21524879199998, "owned_rss_bytes": 525615104, "owned_process_count": 4, "reclaimable_bytes": 10821353472, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 143.44509987499998, "owned_rss_bytes": 525811712, "owned_process_count": 4, "reclaimable_bytes": 10817224704, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 143.674443667, "owned_rss_bytes": 525860864, "owned_process_count": 4, "reclaimable_bytes": 10817224704, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 143.901649333, "owned_rss_bytes": 525893632, "owned_process_count": 4, "reclaimable_bytes": 10817732608, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 144.131418, "owned_rss_bytes": 526139392, "owned_process_count": 4, "reclaimable_bytes": 10815750144, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 144.357389458, "owned_rss_bytes": 526532608, "owned_process_count": 4, "reclaimable_bytes": 10816946176, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 144.585486875, "owned_rss_bytes": 547225600, "owned_process_count": 4, "reclaimable_bytes": 10790879232, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 144.816098042, "owned_rss_bytes": 175226880, "owned_process_count": 4, "reclaimable_bytes": 11049254912, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 145.046544708, "owned_rss_bytes": 312197120, "owned_process_count": 4, "reclaimable_bytes": 11004559360, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 145.275161083, "owned_rss_bytes": 342966272, "owned_process_count": 4, "reclaimable_bytes": 10986455040, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 145.50483237499998, "owned_rss_bytes": 357203968, "owned_process_count": 4, "reclaimable_bytes": 10972332032, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 145.734885583, "owned_rss_bytes": 368132096, "owned_process_count": 4, "reclaimable_bytes": 10964074496, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 145.965638875, "owned_rss_bytes": 386826240, "owned_process_count": 4, "reclaimable_bytes": 10945986560, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 146.19408133299999, "owned_rss_bytes": 398655488, "owned_process_count": 4, "reclaimable_bytes": 10935812096, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 146.423598417, "owned_rss_bytes": 418906112, "owned_process_count": 4, "reclaimable_bytes": 10916970496, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 146.648147417, "owned_rss_bytes": 423641088, "owned_process_count": 4, "reclaimable_bytes": 10909237248, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 146.877252583, "owned_rss_bytes": 433340416, "owned_process_count": 4, "reclaimable_bytes": 10901176320, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 147.103161458, "owned_rss_bytes": 434421760, "owned_process_count": 4, "reclaimable_bytes": 11067244544, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 147.33213695799998, "owned_rss_bytes": 439238656, "owned_process_count": 4, "reclaimable_bytes": 11063148544, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 147.560410167, "owned_rss_bytes": 440483840, "owned_process_count": 4, "reclaimable_bytes": 11063640064, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 147.786827375, "owned_rss_bytes": 440696832, "owned_process_count": 4, "reclaimable_bytes": 11085201408, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 148.016071208, "owned_rss_bytes": 440778752, "owned_process_count": 4, "reclaimable_bytes": 11087659008, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 148.245575917, "owned_rss_bytes": 441303040, "owned_process_count": 4, "reclaimable_bytes": 11082645504, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 148.474338833, "owned_rss_bytes": 94404608, "owned_process_count": 3, "reclaimable_bytes": 11256594432, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 148.697849792, "owned_rss_bytes": 313835520, "owned_process_count": 4, "reclaimable_bytes": 11195727872, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 148.926902542, "owned_rss_bytes": 331710464, "owned_process_count": 4, "reclaimable_bytes": 11178360832, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 149.15230445799997, "owned_rss_bytes": 237518848, "owned_process_count": 5, "reclaimable_bytes": 11177017344, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 149.393856917, "owned_rss_bytes": 210567168, "owned_process_count": 4, "reclaimable_bytes": 11226628096, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 149.62348570799998, "owned_rss_bytes": 322174976, "owned_process_count": 4, "reclaimable_bytes": 11207786496, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 149.84765608299998, "owned_rss_bytes": 468992000, "owned_process_count": 4, "reclaimable_bytes": 11098996736, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 150.07736808299998, "owned_rss_bytes": 634388480, "owned_process_count": 4, "reclaimable_bytes": 10908614656, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 150.30729162499998, "owned_rss_bytes": 874217472, "owned_process_count": 4, "reclaimable_bytes": 10738368512, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 150.536323958, "owned_rss_bytes": 1196556288, "owned_process_count": 4, "reclaimable_bytes": 10450305024, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 150.765827125, "owned_rss_bytes": 1200832512, "owned_process_count": 4, "reclaimable_bytes": 10462019584, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 150.992183792, "owned_rss_bytes": 1225375744, "owned_process_count": 4, "reclaimable_bytes": 10442145792, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 151.215549792, "owned_rss_bytes": 1258242048, "owned_process_count": 4, "reclaimable_bytes": 10516086784, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 151.440964375, "owned_rss_bytes": 1282932736, "owned_process_count": 4, "reclaimable_bytes": 10501160960, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 151.669672083, "owned_rss_bytes": 1290256384, "owned_process_count": 4, "reclaimable_bytes": 10492919808, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 151.89929283299998, "owned_rss_bytes": 1303068672, "owned_process_count": 4, "reclaimable_bytes": 10479222784, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 152.128357667, "owned_rss_bytes": 1312964608, "owned_process_count": 4, "reclaimable_bytes": 10465083392, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 152.35336841699998, "owned_rss_bytes": 1324531712, "owned_process_count": 4, "reclaimable_bytes": 10454646784, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 152.58176625, "owned_rss_bytes": 1342980096, "owned_process_count": 4, "reclaimable_bytes": 10440163328, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 152.81046129199999, "owned_rss_bytes": 1362116608, "owned_process_count": 4, "reclaimable_bytes": 10408361984, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 153.039885208, "owned_rss_bytes": 1411629056, "owned_process_count": 4, "reclaimable_bytes": 10391453696, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 153.269531708, "owned_rss_bytes": 489259008, "owned_process_count": 5, "reclaimable_bytes": 11124768768, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 153.50024829199998, "owned_rss_bytes": 402276352, "owned_process_count": 4, "reclaimable_bytes": 11245731840, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 153.730207792, "owned_rss_bytes": 599375872, "owned_process_count": 4, "reclaimable_bytes": 11079811072, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 153.9608715, "owned_rss_bytes": 887308288, "owned_process_count": 4, "reclaimable_bytes": 10823876608, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 154.18988324999998, "owned_rss_bytes": 1243152384, "owned_process_count": 4, "reclaimable_bytes": 10511368192, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 154.41835966699998, "owned_rss_bytes": 1151303680, "owned_process_count": 4, "reclaimable_bytes": 10608738304, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 154.647461583, "owned_rss_bytes": 1177894912, "owned_process_count": 4, "reclaimable_bytes": 10586816512, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 154.878201625, "owned_rss_bytes": 1247707136, "owned_process_count": 4, "reclaimable_bytes": 10523492352, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 155.108382625, "owned_rss_bytes": 1265598464, "owned_process_count": 4, "reclaimable_bytes": 10509287424, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 155.336780708, "owned_rss_bytes": 1278836736, "owned_process_count": 4, "reclaimable_bytes": 10499719168, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 155.565274125, "owned_rss_bytes": 1290256384, "owned_process_count": 4, "reclaimable_bytes": 10486038528, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 155.791285833, "owned_rss_bytes": 1301364736, "owned_process_count": 4, "reclaimable_bytes": 10475634688, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 156.014305875, "owned_rss_bytes": 1319600128, "owned_process_count": 4, "reclaimable_bytes": 10462347264, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 156.24184316699998, "owned_rss_bytes": 1342357504, "owned_process_count": 4, "reclaimable_bytes": 10439065600, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 156.469816708, "owned_rss_bytes": 1339392000, "owned_process_count": 4, "reclaimable_bytes": 10409558016, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 156.69543654199998, "owned_rss_bytes": 16138240, "owned_process_count": 2, "reclaimable_bytes": 11401658368, "swapins": 44109625, "swapouts": 77525502}
{"elapsed_seconds": 156.92097745799998, "owned_rss_bytes": 0, "owned_process_count": 1, "reclaimable_bytes": 11409932288, "swapins": 44109625, "swapouts": 77525502}
````

## /Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/manifest.json

SHA-256 `31b1cde447311d12fd994a302a1558dcef08162f91a59cef06c260515af9fbcf`; 23892 bytes.

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
    "seconds": 3.749999999969056e-06,
    "attempts": 1
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10736091136,
    "swapins": 44109437,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    66995.\nPages active:                                 994747.\nPages inactive:                               996007.\nPages speculative:                             37087.\nPages throttled:                                   0.\nPages wired down:                             296376.\nPages purgeable:                                8449.\n\"Translation faults\":                    15304212945.\nPages copy-on-write:                       726789729.\nPages zero filled:                       21071486228.\nPages reactivated:                        3465713414.\nPages purged:                               71959300.\nFile-backed pages:                            579835.\nAnonymous pages:                             1448006.\nPages stored in compressor:                  1660664.\nPages occupied by compressor:                 694224.\nDecompressions:                           1169558517.\nCompressions:                             1483668853.\nPageins:                                  7603544271.\nPageouts:                                   11053843.\nSwapins:                                    44109437.\nSwapouts:                                   77525502.\nPages tagged:                                 176320.\nPages tagged resident:                        131254.\nPages tagged compressed:                       45066.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7285.\nPages tag-storage free:                          228.\nPages tag-storage non-tag pageable:            90783.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7286080.\nTagged compressions:                        11190155.\nTagged decompressions:                      10321822.\n"
  },
  "exit_code": 0,
  "frozen": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/combined-default-build-v255/candidate/slotstream",
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
        "Sources/Slotstream/Plan.swift": "fb788e98e388a2a4bed06743ada61c5f9f9173f237ef2a8f95cef82cd673d1ae",
        "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
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
      "source_archive_sha256": "3fa7a653fe11e14661ebc6204c68deb2f0839bf2ef432fb9c0d45f935e36f3ef",
      "binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "checks_sha256": "506cf76b841e5c95ed17e97a8f62eeb469fcf36345927947f5249fdb47e5e308",
  "elapsed_seconds": 157.406033291,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11438030848,
    "swapins": 44109625,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    83006.\nPages active:                                1003829.\nPages inactive:                               984924.\nPages speculative:                             55333.\nPages throttled:                                   0.\nPages wired down:                             261110.\nPages purgeable:                                8478.\n\"Translation faults\":                    15309170947.\nPages copy-on-write:                       727259360.\nPages zero filled:                       21074310614.\nPages reactivated:                        3465949350.\nPages purged:                               71963575.\nFile-backed pages:                            606638.\nAnonymous pages:                             1437448.\nPages stored in compressor:                  1648961.\nPages occupied by compressor:                 693162.\nDecompressions:                           1169600000.\nCompressions:                             1483703454.\nPageins:                                  7603696022.\nPageouts:                                   11054295.\nSwapins:                                    44109625.\nSwapouts:                                   77525502.\nPages tagged:                                 178020.\nPages tagged resident:                        141229.\nPages tagged compressed:                       36791.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8354.\nPages tag-storage free:                         4281.\nPages tag-storage non-tag pageable:            85660.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                    5764672.\nTagged compressions:                        11190171.\nTagged decompressions:                      10330111.\n"
  }
}
````

## /tmp/slotstream-optimization-execution/combined-default-build-v255/after/Sources/Slotstream/ContextMemory.swift

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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/after/Sources/Slotstream/Optimizations.swift

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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/after/Sources/Slotstream/Plan.swift

SHA-256 `fb788e98e388a2a4bed06743ada61c5f9f9173f237ef2a8f95cef82cd673d1ae`; 58878 bytes.

````text
// Memory planning: turn "how much of this Mac may I use" into slot counts.
//
// One policy, used by the CLI (run/serve/doctor), printed at startup, and
// exposed over /api/show — so what the process *does* and what it *says* can
// never drift apart.

import Darwin
import Foundation
import MLX

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

    public static func deviceRAMGB() -> Double {
        Double(ProcessInfo.processInfo.physicalMemory) / 1e9
    }

    public static func deviceWorkingSetGB() -> Double {
        let ws = Double(MLX.GPU.deviceInfo().maxRecommendedWorkingSetSize) / 1e9
        return ws > 0 ? ws : deviceRAMGB() * 0.75
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

    public static func deviceAvailableGB() -> Double? {
        var count = mach_msg_type_number_t(
            MemoryLayout<vm_statistics64_data_t>.stride / MemoryLayout<integer_t>.stride)
        var stats = vm_statistics64_data_t()
        let kr = withUnsafeMutablePointer(to: &stats) { p in
            p.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                host_statistics64(mach_host_self(), HOST_VM_INFO64, $0, &count)
            }
        }
        guard kr == KERN_SUCCESS else { return nil }
        let pages = Double(stats.free_count) + Double(stats.purgeable_count)
            + Double(stats.external_page_count)
        return pages * Double(vm_page_size) / 1e9
    }

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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/after/Sources/Slotstream/PlannerCostModel.swift

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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/after/Sources/Slotstream/Weights.swift

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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/after/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift

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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/after/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift

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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/before.json

SHA-256 `be059ca183aaee99ace59827ad074ea95b5dbcc1c8156e60d00dfa209690c69f`; 2586 bytes.

````text
{
  "captured_at": "2026-09-07T05:41:23.871103+00:00",
  "state": "Seven-file candidate-only lease prepared; no shared mutation or model work",
  "source": [
    {
      "path": "Sources/Slotstream/PlannerCostModel.swift",
      "before_sha256": null,
      "after_sha256": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0"
    },
    {
      "path": "Sources/Slotstream/Plan.swift",
      "before_sha256": "a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b",
      "after_sha256": "fb788e98e388a2a4bed06743ada61c5f9f9173f237ef2a8f95cef82cd673d1ae"
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
  "public_defaults": "Original root state restored before handback; candidate-only automatic controls pending same-build qualification"
}
````

## /tmp/slotstream-optimization-execution/combined-default-build-v255/build-state-before.json

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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/inner-build.lock

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/combined-default-build-v255/launch.json

SHA-256 `e9a7b38ea9f46348679c53a4681f7e3ab7688933d4b95481cab16d011578dc1b`; 4407 bytes.

````text
{
  "classification": "Guarded cached candidate build, no model inference",
  "launched": true,
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10748772352,
    "swapins": 44109437,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    95348.\nPages active:                                 994851.\nPages inactive:                               970052.\nPages speculative:                             34717.\nPages throttled:                                   0.\nPages wired down:                             296114.\nPages purgeable:                                9184.\n\"Translation faults\":                    15304174025.\nPages copy-on-write:                       726784892.\nPages zero filled:                       21071473170.\nPages reactivated:                        3465713414.\nPages purged:                               71959300.\nFile-backed pages:                            551521.\nAnonymous pages:                             1448099.\nPages stored in compressor:                  1660680.\nPages occupied by compressor:                 694232.\nDecompressions:                           1169558503.\nCompressions:                             1483668853.\nPageins:                                  7603518001.\nPageouts:                                   11053843.\nSwapins:                                    44109437.\nSwapouts:                                   77525502.\nPages tagged:                                 176320.\nPages tagged resident:                        131254.\nPages tagged compressed:                       45066.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7285.\nPages tag-storage free:                          252.\nPages tag-storage non-tag pageable:            90759.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7286080.\nTagged compressions:                        11190155.\nTagged decompressions:                      10321822.\n"
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
  "exit_code": 0,
  "elapsed_seconds": 158.6535785,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11506466816,
    "swapins": 44109625,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    72997.\nPages active:                                1000693.\nPages inactive:                              1019934.\nPages speculative:                             33538.\nPages throttled:                                   0.\nPages wired down:                             261121.\nPages purgeable:                                8484.\n\"Translation faults\":                    15309189884.\nPages copy-on-write:                       727263315.\nPages zero filled:                       21074315921.\nPages reactivated:                        3465949350.\nPages purged:                               71963575.\nFile-backed pages:                            620818.\nAnonymous pages:                             1433347.\nPages stored in compressor:                  1648960.\nPages occupied by compressor:                 693161.\nDecompressions:                           1169600001.\nCompressions:                             1483703454.\nPageins:                                  7603735338.\nPageouts:                                   11054295.\nSwapins:                                    44109625.\nSwapouts:                                   77525502.\nPages tagged:                                 178020.\nPages tagged resident:                        141229.\nPages tagged compressed:                       36791.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8354.\nPages tag-storage free:                         4296.\nPages tag-storage non-tag pageable:            85645.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                    5764672.\nTagged compressions:                        11190171.\nTagged decompressions:                      10330111.\n"
  }
}
````

## /tmp/slotstream-optimization-execution/combined-default-build-v255/launch.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## /tmp/slotstream-optimization-execution/combined-default-build-v255/launch.stdout.txt

SHA-256 `1be28ff6eef31edb890b5aef7ffd26cc03a279ba56b90d2146b32a96ddf6e6b8`; 589 bytes.

````text
{"classification": "temporary cached build lease; no model or performance result", "started_at": "2026-09-07T05:41:55.036210+00:00", "protocol_sha256": "805998b246030ad616464f17a3ce1257713320cfc5716ce604f4d55fe5a32c2e", "passed": true, "restored": true, "before_pressure": {"command": ["sysctl", "-n", "kern.memorystatus_vm_pressure_level"], "level": 1, "name": "normal", "stdout": "1\n", "stderr": ""}, "release_symlink_before": {"kind": "symlink", "target": "arm64-apple-macosx/release", "mode": 493}, "source_applied": true, "build_passed": true, "elapsed_seconds": 158.52988458299998}
````

## /tmp/slotstream-optimization-execution/combined-default-build-v255/lease-result.json

SHA-256 `9d19693ce3b669e6fad3bfce86452aa1bd10ee6d850b29f6d64b00155635c886`; 6758 bytes.

````text
{
  "classification": "temporary cached build lease; no model or performance result",
  "started_at": "2026-09-07T05:41:55.036210+00:00",
  "protocol_sha256": "805998b246030ad616464f17a3ce1257713320cfc5716ce604f4d55fe5a32c2e",
  "passed": true,
  "restored": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 10738204672,
    "swapins": 44109437,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    94691.\nPages active:                                 995242.\nPages inactive:                               970054.\nPages speculative:                             34996.\nPages throttled:                                   0.\nPages wired down:                             296135.\nPages purgeable:                                9184.\n\"Translation faults\":                    15304184593.\nPages copy-on-write:                       726785810.\nPages zero filled:                       21071477027.\nPages reactivated:                        3465713414.\nPages purged:                               71959300.\nFile-backed pages:                            551533.\nAnonymous pages:                             1448759.\nPages stored in compressor:                  1660680.\nPages occupied by compressor:                 694232.\nDecompressions:                           1169558503.\nCompressions:                             1483668853.\nPageins:                                  7603518030.\nPageouts:                                   11053843.\nSwapins:                                    44109437.\nSwapouts:                                   77525502.\nPages tagged:                                 176278.\nPages tagged resident:                        131212.\nPages tagged compressed:                       45066.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 7285.\nPages tag-storage free:                          219.\nPages tag-storage non-tag pageable:            90792.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    7286080.\nTagged compressions:                        11190155.\nTagged decompressions:                      10321822.\n"
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
    "reclaimable_bytes": 11438080000,
    "swapins": 44109625,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    83007.\nPages active:                                1003828.\nPages inactive:                               984934.\nPages speculative:                             55325.\nPages throttled:                                   0.\nPages wired down:                             261110.\nPages purgeable:                                8478.\n\"Translation faults\":                    15309173660.\nPages copy-on-write:                       727259820.\nPages zero filled:                       21074311694.\nPages reactivated:                        3465949350.\nPages purged:                               71963575.\nFile-backed pages:                            606640.\nAnonymous pages:                             1437447.\nPages stored in compressor:                  1648961.\nPages occupied by compressor:                 693162.\nDecompressions:                           1169600000.\nCompressions:                             1483703454.\nPageins:                                  7603696025.\nPageouts:                                   11054295.\nSwapins:                                    44109625.\nSwapouts:                                   77525502.\nPages tagged:                                 178020.\nPages tagged resident:                        141229.\nPages tagged compressed:                       36791.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8354.\nPages tag-storage free:                         4281.\nPages tag-storage non-tag pageable:            85660.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                    5764672.\nTagged compressions:                        11190171.\nTagged decompressions:                      10330111.\n"
  },
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11487428608,
    "swapins": 44109625,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    71824.\nPages active:                                1001023.\nPages inactive:                              1020771.\nPages speculative:                             33536.\nPages throttled:                                   0.\nPages wired down:                             261136.\nPages purgeable:                                8484.\n\"Translation faults\":                    15309186573.\nPages copy-on-write:                       727262827.\nPages zero filled:                       21074314726.\nPages reactivated:                        3465949350.\nPages purged:                               71963575.\nFile-backed pages:                            620829.\nAnonymous pages:                             1434501.\nPages stored in compressor:                  1648960.\nPages occupied by compressor:                 693161.\nDecompressions:                           1169600001.\nCompressions:                             1483703454.\nPageins:                                  7603735335.\nPageouts:                                   11054295.\nSwapins:                                    44109625.\nSwapouts:                                   77525502.\nPages tagged:                                 178020.\nPages tagged resident:                        141229.\nPages tagged compressed:                       36791.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8354.\nPages tag-storage free:                         4251.\nPages tag-storage non-tag pageable:            85690.\nPages tag-storage non-tag wired:                   9.\nBytes of compressed tags:                    5764672.\nTagged compressions:                        11190171.\nTagged decompressions:                      10330111.\n"
  },
  "elapsed_seconds": 158.52988458299998
}
````

## /tmp/slotstream-optimization-execution/combined-default-build-v255/protocol.json

SHA-256 `805998b246030ad616464f17a3ce1257713320cfc5716ce604f4d55fe5a32c2e`; 20424 bytes.

````text
{
  "classification": "Provisional combined-default build only. Not final qualification, deployment, or completion. Existing optional studies remain unqualified/off.",
  "frozen_at": "2026-09-07T05:41:23.922977+00:00",
  "drivers": {
    "build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
    "optimization_build.py": "dee7d43c4fd70aac9145cfe33ea9d3d446e803fbca5dbf54e07d577d27deca6f",
    "optimization_serial_build.py": "f83e937f823c42e89da796b8616a60da61649f67f6e12166608440ee016560d8",
    "optimization_readiness.py": "ad3874ec1ed1c87d621e76f01a1a08d60dd4fe593406499d22885639d2eeaefc",
    "prefill_bench.py": "3e87578199e39ab74da394770f97fa834ad799a4af8a492adb7b4e41fe5c7036",
    "serve_bench.py": "31959becd6ab6389c3b71b567d26ec7036a25fa66d1ff00a17ed1ea0b8202acb"
  },
  "candidate_source": {
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
    "Sources/Slotstream/Plan.swift": "fb788e98e388a2a4bed06743ada61c5f9f9173f237ef2a8f95cef82cd673d1ae",
    "Sources/Slotstream/PlannerCostModel.swift": "a95e2781a7448418ec78480be356bac9eb80bb36cc64c63f6cb3e378043d29c0",
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
  "policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 1200,
    "compiler_jobs": 1,
    "stop_on_new_swapouts": true
  },
  "wrapper_sha256": "251c719249e4c0e98000d6d964e394097f1a0a5266b8eefe56caba3f18cb2d5d",
  "maximum_whole_interval_seconds": 1220,
  "changes": "Exact V208 unchanged planner3 + exact V199 selected default4. No optional control additions, context cap change, recalibration, memory credit, or new kernels.",
  "review": "Model-free candidate preparation may run before unrelated optional studies; this does not settle their disposition or waive same-final-build API/native/resource/final8/soak/install acceptance. V253 was never launched; the later actual API gate must use the corrected V254 predicate.",
  "source_lease": "Restore all seven original source contents/presence/mode/mtime, six release artifacts, release symlink, first-party build outputs and SwiftPM mutable database/metadata. Keep real model lock throughout.",
  "defaults": "CLI/Engine environment selects the independently-qualified portable family plus current-hardware RoPE; explicit InferenceOptimizations() and complete all-off environment remain reference. Embedding rows separately on in candidate, off in restored source."
}
````

## /tmp/slotstream-optimization-execution/combined-default-build-v255/return-audit.json

SHA-256 `65d5a5540169a717aa7586a870a5c222f403b946bd8b8df30daeb6476b1b89c4`; 2689 bytes.

````text
{
  "source143_exact": true,
  "new_family_file_absent": true,
  "release6_exact": true,
  "release_symlink": "arm64-apple-macosx/release",
  "model_lock_free": true,
  "jobs": [],
  "vm": {
    "page_bytes": 16384,
    "reclaimable_bytes": 11332763648,
    "swapins": 44109777,
    "swapouts": 77525502,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    41727.\nPages active:                                1040716.\nPages inactive:                              1006612.\nPages speculative:                             37339.\nPages throttled:                                   0.\nPages wired down:                             267698.\nPages purgeable:                               24468.\n\"Translation faults\":                    15309561077.\nPages copy-on-write:                       727288090.\nPages zero filled:                       21074644261.\nPages reactivated:                        3465949744.\nPages purged:                               71966122.\nFile-backed pages:                            625502.\nAnonymous pages:                             1459165.\nPages stored in compressor:                  1635436.\nPages occupied by compressor:                 689325.\nDecompressions:                           1169608183.\nCompressions:                             1483703454.\nPageins:                                  7603737861.\nPageouts:                                   11054295.\nSwapins:                                    44109777.\nSwapouts:                                   77525502.\nPages tagged:                                 177995.\nPages tagged resident:                        141813.\nPages tagged compressed:                       36182.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 8352.\nPages tag-storage free:                         1997.\nPages tag-storage non-tag pageable:            87947.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5645184.\nTagged compressions:                        11190171.\nTagged decompressions:                      10330666.\n"
  },
  "candidate_identity": {
    "source_archive_sha256": "3fa7a653fe11e14661ebc6204c68deb2f0839bf2ef432fb9c0d45f935e36f3ef",
    "binary_sha256": "701bbdb6cdf213530c5456aa3bff8ca5c4f4013f5d9d833dcb68d66a88e51d64",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "checks_sha256": "506cf76b841e5c95ed17e97a8f62eeb469fcf36345927947f5249fdb47e5e308",
  "lease_result_sha256": "9d19693ce3b669e6fad3bfce86452aa1bd10ee6d850b29f6d64b00155635c886"
}
````

## /tmp/slotstream-optimization-execution/combined-default-build-v255/run.py

SHA-256 `251c719249e4c0e98000d6d964e394097f1a0a5266b8eefe56caba3f18cb2d5d`; 9877 bytes.

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
        quarantine=path.with_name(path.name+".v255-unexpected")
        if quarantine.exists() or quarantine.is_symlink(): raise RuntimeError("release-alias quarantine already exists")
        path.rename(quarantine)
    path.symlink_to(expected['target'])
    if tree_state(path)!=expected: raise RuntimeError("release alias was not restored exactly")

def observed_memory():
    state=vm_snapshot();require_normal(pressure_snapshot());return state

def main():
    output=ROOT/".build/optimization/combined-default-build-v255"
    receipt=PACKET/"lease-result.json"
    assert not output.exists() and not receipt.exists()
    protocol=json.loads((PACKET/"protocol.json").read_text())
    original=json.loads((PACKET/"before.json").read_text())
    files=original["source"]
    frozen=json.loads((ROOT/".build/optimization/typed-context-build-v215/candidate/build-identity.json").read_text())
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
        assert all(digest(ROOT/n)==h for n,h in frozen["source"].items() if n.startswith("Sources/"))
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
                pending=path.with_suffix(path.suffix+".v255-pending");shutil.copy2(after,pending);pending.replace(path)
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
                            pending=path.with_suffix(path.suffix+".v255-restore");shutil.copy2(PACKET/"source-before"/entry["path"],pending);pending.replace(path)
                    restore(state_paths,PACKET/"build-state-before",state_before)
                    restore_link(ROOT/".build/release",link_state)
                    for name,sha in original["release"].items():
                        path=ROOT/".build/release"/name;pending=path.with_name(path.name+".v255-restore")
                        shutil.copy2(PACKET/"release-before"/name,pending);pending.replace(path);assert digest(path)==sha
                assert {entry['path']:tree_state(ROOT/entry['path']) for entry in files}==source_before
                assert {name:tree_state(ROOT/'.build/release'/name) for name in original['release']}==release_before
                assert tree_state(ROOT/".build/release")==link_state
                assert all(digest(ROOT/n)==h for n,h in frozen["source"].items() if n.startswith("Sources/"))
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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/source-before/Sources/Slotstream/ContextMemory.swift

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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/source-before/Sources/Slotstream/Optimizations.swift

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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/source-before/Sources/Slotstream/Plan.swift

SHA-256 `a25367b73877f2148d362be6fa5c396937bdac2bbea4a306963022ac3264af3b`; 58201 bytes.

````text
// Memory planning: turn "how much of this Mac may I use" into slot counts.
//
// One policy, used by the CLI (run/serve/doctor), printed at startup, and
// exposed over /api/show — so what the process *does* and what it *says* can
// never drift apart.

import Darwin
import Foundation
import MLX

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

    public static func deviceRAMGB() -> Double {
        Double(ProcessInfo.processInfo.physicalMemory) / 1e9
    }

    public static func deviceWorkingSetGB() -> Double {
        let ws = Double(MLX.GPU.deviceInfo().maxRecommendedWorkingSetSize) / 1e9
        return ws > 0 ? ws : deviceRAMGB() * 0.75
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

    public static func deviceAvailableGB() -> Double? {
        var count = mach_msg_type_number_t(
            MemoryLayout<vm_statistics64_data_t>.stride / MemoryLayout<integer_t>.stride)
        var stats = vm_statistics64_data_t()
        let kr = withUnsafeMutablePointer(to: &stats) { p in
            p.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                host_statistics64(mach_host_self(), HOST_VM_INFO64, $0, &count)
            }
        }
        guard kr == KERN_SUCCESS else { return nil }
        let pages = Double(stats.free_count) + Double(stats.purgeable_count)
            + Double(stats.external_page_count)
        return pages * Double(vm_page_size) / 1e9
    }

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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/source-before/Sources/Slotstream/Weights.swift

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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/source-before/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift

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

## /tmp/slotstream-optimization-execution/combined-default-build-v255/source-before/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift

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

