---
type: run
id: 01m1w618cxfz4423zs8vrx2ymy
created: 2026-09-06T20:19:53.885780+00:00
updated: 2026-09-06T20:19:54.134596+00:00
summary: N-gram diagnostic compile failure and unchanged-fixture correction — V185–186
binary: No shared candidate published; build failed before native tests
captured_at: 2026-09-06
command: python3 /tmp/slotstream-optimization-execution/run_merged_native_v185.py
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: N-gram diagnostic compile failure and unchanged-fixture correction — V185–186
tool: Bounded shared -j2 build and source correction
---
V185 was the first attempted shared build of the combined V183/V184 source and the previously unbuilt n-gram/MTP diagnostics. It held the explicitly transferred correctness reservation and -j2 bound. The build stopped after33.56864seconds on one compile error: Swift could not type-check the synthetic n-gram fixture expression in reasonable time. No native/model diagnostic launched, no candidate was published, and no numerical or timing gate ran. The driver/make/compiler children exited; an actual process audit and nonblocking lock acquisition confirm the shared reservation was free. The bounded slot was returned to the transport/context owners.

V186 splits that expression into an explicitly typed Int position, a precomputed Int64 EOS and an intermediate Int modular product. The token count, formula, EOS positions, row-store protocol and all acceptance thresholds are unchanged. This is an unbuilt source correction, not a successful test or a replacement benchmark. A reviewed successor correctness queue is prepared and awaits another explicit grant. The failed build remains immutable evidence.

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/merged-context-build-v185/manifest.json` — 4624 bytes, SHA-256 `59b6c69b40b71f49baadf826b1415583925be72a0b2c320c9f1b5e2b7ef0a376`.

````text
{
  "classification": "build only; no runtime performance evidence",
  "required_reclaimable_gb": 13,
  "model_lock_held_during_build": true,
  "passed": false,
  "command": [
    "make",
    "build",
    "SLOTSTREAM_BUILD_JOBS=2"
  ],
  "working_directory": "/Users/carlos/Projects/slotstream",
  "reservation_wait_limit_seconds": 0,
  "build_jobs": 2,
  "reservation_wait": {
    "seconds": 4.208000000005541e-06,
    "attempts": 1
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31176245248,
    "swapins": 43808334,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   394520.\nPages active:                                1002633.\nPages inactive:                               836487.\nPages speculative:                            185478.\nPages throttled:                                   0.\nPages wired down:                             222683.\nPages purgeable:                                2093.\n\"Translation faults\":                    14915454280.\nPages copy-on-write:                       695828561.\nPages zero filled:                       20338811188.\nPages reactivated:                        3333689085.\nPages purged:                               70187987.\nFile-backed pages:                           1506234.\nAnonymous pages:                              518364.\nPages stored in compressor:                  1790694.\nPages occupied by compressor:                 441696.\nDecompressions:                           1146945212.\nCompressions:                             1458394947.\nPageins:                                  7174133844.\nPageouts:                                   10986594.\nSwapins:                                    43808334.\nSwapouts:                                   77363385.\nPages tagged:                                 154430.\nPages tagged resident:                        117111.\nPages tagged compressed:                       37319.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6784.\nPages tag-storage free:                         2240.\nPages tag-storage non-tag pageable:            89272.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6687936.\nTagged compressions:                        10876014.\nTagged decompressions:                      10039317.\n"
  },
  "exit_code": 2,
  "error": "RuntimeError: make failed with exit code 2; no candidate frozen",
  "elapsed_seconds": 33.537780958000006,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31232229376,
    "swapins": 43808334,
    "swapouts": 77363385,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   384006.\nPages active:                                1008935.\nPages inactive:                               843007.\nPages speculative:                            185770.\nPages throttled:                                   0.\nPages wired down:                             223171.\nPages purgeable:                                2127.\n\"Translation faults\":                    14915759570.\nPages copy-on-write:                       695853279.\nPages zero filled:                       20338965854.\nPages reactivated:                        3333689240.\nPages purged:                               70188508.\nFile-backed pages:                           1520131.\nAnonymous pages:                              517581.\nPages stored in compressor:                  1784199.\nPages occupied by compressor:                 438552.\nDecompressions:                           1146951730.\nCompressions:                             1458394947.\nPageins:                                  7174143317.\nPageouts:                                   10986594.\nSwapins:                                    43808334.\nSwapouts:                                   77363385.\nPages tagged:                                 155836.\nPages tagged resident:                        118609.\nPages tagged compressed:                       37227.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6784.\nPages tag-storage free:                         2376.\nPages tag-storage non-tag pageable:            89136.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6670144.\nTagged compressions:                        10876014.\nTagged decompressions:                      10039407.\n"
  }
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/merged-context-build-v185/build.txt` — 9370 bytes, SHA-256 `997d3313c1e63e4cb68447397dbd2b13a2dd535774d9a28742195c145f9337f0`.

````text
python3 Tools/build_identity.py before .build/release
swift build -c release -j 2
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[0/1] Planning build
[1/1] Compiling plugin GenerateManual
[2/2] Compiling plugin GenerateDoccReference
[3/3] Compiling plugin CudaBuild
Building for production...
[3/11] Write sources
[6/11] Write swift-version--1AB21518FC5DEDBE.txt
[8/12] Compiling Slotstream AdaptiveSpeculation.swift
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
[9/13] Compiling SlotstreamDiagnostics CheckReport.swift
/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift:253:20: warning: instance method 'wait' is unavailable from asynchronous contexts; Await a Task handle instead; this is an error in the Swift 6 language mode
251 |         }
252 |         defer { release.signal() }
253 |         guard held.wait(timeout: .now() + 5) == .success else { throw ModelError("queue holder did not start") }
    |                    `- warning: instance method 'wait' is unavailable from asynchronous contexts; Await a Task handle instead; this is an error in the Swift 6 language mode
254 |         var queueChecks: UInt64 = 0
255 |         let queueConfig = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 1)

Dispatch.DispatchSemaphore.wait:2:13: note: 'wait(timeout:)' declared here
1 | class DispatchSemaphore {
2 | public func wait(timeout: DispatchTime) -> DispatchTimeoutResult}
  |             `- note: 'wait(timeout:)' declared here
3 | 

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift:269:21: warning: instance method 'wait' is unavailable from asynchronous contexts; Await a Task handle instead; this is an error in the Swift 6 language mode
267 |         }
268 |         release.signal()
269 |         guard ended.wait(timeout: .now() + 5) == .success else { throw ModelError("queue holder did not finish") }
    |                     `- warning: instance method 'wait' is unavailable from asynchronous contexts; Await a Task handle instead; this is an error in the Swift 6 language mode
270 |         // Checked legacy mutation cannot enlarge an already allocated engine.
271 |         engine.maxContextTokens = ContextPolicy.modelLimit

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

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift:249:13: warning: capture of 'engine' with non-Sendable type 'Engine' in a '@Sendable' closure [#SendableClosureCaptures]
247 |         let held = DispatchSemaphore(value: 0), release = DispatchSemaphore(value: 0), ended = DispatchSemaphore(value: 0)
248 |         Thread.detachNewThread {
249 |             engine.withExclusive { held.signal(); release.wait() }
    |             `- warning: capture of 'engine' with non-Sendable type 'Engine' in a '@Sendable' closure [#SendableClosureCaptures]
250 |             ended.signal()
251 |         }

/Users/carlos/Projects/slotstream/Sources/Slotstream/Engine.swift:83:20: note: class 'Engine' does not conform to the 'Sendable' protocol
  81 | }
  82 | 
  83 | public final class Engine {
     |                    `- note: class 'Engine' does not conform to the 'Sendable' protocol
  84 |     public let modelDir: URL
  85 |     public let model: Qwen4ExpModel

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift:25:28: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
 23 |         c.equal("actual FIFO representation", store.ringEvictionOrder, ring)
 24 |         let fillTokens = 32_768, tile = 256, evictionTokens = 4_096, warmCalls = 128
 25 |         let ids: [Int64] = (0..<(fillTokens + evictionTokens)).map {
    |                            `- error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
 26 |             $0 % 997 == 996 ? Int64(model.cfg.eosTokenId) : Int64(1000 + ($0 * 7919) % 200_000)
 27 |         }

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

[#SendableClosureCaptures]: <https://docs.swift.org/compiler/documentation/diagnostics/sendable-closure-captures>
[#WeakMutability]: <https://docs.swift.org/compiler/documentation/diagnostics/weak-mutability>
make: *** [build] Error 1

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/merged-native-v185/manifest.json` — 5070 bytes, SHA-256 `ff8674810d00df6c84f67d39c377815c24c8f440849e50527f2638390f116e79`.

````text
{
  "classification": "bounded correctness during authorized download overlap; no timing/capacity claim",
  "queue_sha256": "8a594dce30dc6228e1195cf9ce661bd5d6b405f62b46eb7aedee96a6b159452b",
  "batch_wall_limit_seconds": 1500,
  "rows": [],
  "passed": false,
  "build": {
    "classification": "build only; no runtime performance evidence",
    "required_reclaimable_gb": 13,
    "model_lock_held_during_build": true,
    "passed": false,
    "command": [
      "make",
      "build",
      "SLOTSTREAM_BUILD_JOBS=2"
    ],
    "working_directory": "/Users/carlos/Projects/slotstream",
    "reservation_wait_limit_seconds": 0,
    "build_jobs": 2,
    "reservation_wait": {
      "seconds": 4.208000000005541e-06,
      "attempts": 1
    },
    "before": {
      "page_bytes": 16384,
      "reclaimable_bytes": 31176245248,
      "swapins": 43808334,
      "swapouts": 77363385,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   394520.\nPages active:                                1002633.\nPages inactive:                               836487.\nPages speculative:                            185478.\nPages throttled:                                   0.\nPages wired down:                             222683.\nPages purgeable:                                2093.\n\"Translation faults\":                    14915454280.\nPages copy-on-write:                       695828561.\nPages zero filled:                       20338811188.\nPages reactivated:                        3333689085.\nPages purged:                               70187987.\nFile-backed pages:                           1506234.\nAnonymous pages:                              518364.\nPages stored in compressor:                  1790694.\nPages occupied by compressor:                 441696.\nDecompressions:                           1146945212.\nCompressions:                             1458394947.\nPageins:                                  7174133844.\nPageouts:                                   10986594.\nSwapins:                                    43808334.\nSwapouts:                                   77363385.\nPages tagged:                                 154430.\nPages tagged resident:                        117111.\nPages tagged compressed:                       37319.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6784.\nPages tag-storage free:                         2240.\nPages tag-storage non-tag pageable:            89272.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6687936.\nTagged compressions:                        10876014.\nTagged decompressions:                      10039317.\n"
    },
    "exit_code": 2,
    "error": "RuntimeError: make failed with exit code 2; no candidate frozen",
    "elapsed_seconds": 33.537780958000006,
    "after": {
      "page_bytes": 16384,
      "reclaimable_bytes": 31232229376,
      "swapins": 43808334,
      "swapouts": 77363385,
      "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   384006.\nPages active:                                1008935.\nPages inactive:                               843007.\nPages speculative:                            185770.\nPages throttled:                                   0.\nPages wired down:                             223171.\nPages purgeable:                                2127.\n\"Translation faults\":                    14915759570.\nPages copy-on-write:                       695853279.\nPages zero filled:                       20338965854.\nPages reactivated:                        3333689240.\nPages purged:                               70188508.\nFile-backed pages:                           1520131.\nAnonymous pages:                              517581.\nPages stored in compressor:                  1784199.\nPages occupied by compressor:                 438552.\nDecompressions:                           1146951730.\nCompressions:                             1458394947.\nPageins:                                  7174143317.\nPageouts:                                   10986594.\nSwapins:                                    43808334.\nSwapouts:                                   77363385.\nPages tagged:                                 155836.\nPages tagged resident:                        118609.\nPages tagged compressed:                       37227.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6784.\nPages tag-storage free:                         2376.\nPages tag-storage non-tag pageable:            89136.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6670144.\nTagged compressions:                        10876014.\nTagged decompressions:                      10039407.\n"
    }
  },
  "error": "RuntimeError: shared build failed; no native test launched",
  "elapsed_seconds": 33.56864
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/merged-native-v185/return-audit.json` — 95 bytes, SHA-256 `846c04e1d6a6e3b671c99606ce73b46f24aada31f9f2665bddcbc58891200f9a`.

````text
{
  "model_lock": "free",
  "compiler_and_check_processes": [],
  "native_cells_launched": 0
}

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/ngram-compile-fix-v186/fix.patch` — 1063 bytes, SHA-256 `0d2d3a8802b39513b993cc4f5430293e2051ce3c696976bf676fff72d844b739`.

````text
--- a/Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift
@@ -22,8 +22,12 @@
         c.equal("actual row representation", store.compactRows, compact)
         c.equal("actual FIFO representation", store.ringEvictionOrder, ring)
         let fillTokens = 32_768, tile = 256, evictionTokens = 4_096, warmCalls = 128
-        let ids: [Int64] = (0..<(fillTokens + evictionTokens)).map {
-            $0 % 997 == 996 ? Int64(model.cfg.eosTokenId) : Int64(1000 + ($0 * 7919) % 200_000)
+        let tokenCount = fillTokens + evictionTokens
+        let eos = Int64(model.cfg.eosTokenId)
+        let ids: [Int64] = (0..<tokenCount).map { (position: Int) -> Int64 in
+            if position % 997 == 996 { return eos }
+            let mixed = (position * 7919) % 200_000
+            return Int64(1000 + mixed)
         }
         var hashes: [String: String] = [:]
         func hash(_ values: [UInt8]) -> String { SHA256.hash(data: Data(values)).map { String(format: "%02x", $0) }.joined() }

````

Artifact `/Users/carlos/Projects/slotstream/.build/optimization/ngram-compile-fix-v186/source.json` — 271 bytes, SHA-256 `2d2689a5f4c6fa3423a9c2b265112e2be3f57141b2c2099c858608079bd763b5`.

````text
{
  "path": "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift",
  "before_sha256": "04ba0fdae78172e42692455f85e3f21606bef533f4918e1642723f1059c82b50",
  "after_sha256": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
  "native_run": false
}

````

Artifact `/tmp/slotstream-optimization-execution/merged-native-queue-v185.json` — 24922 bytes, SHA-256 `8a594dce30dc6228e1195cf9ce661bd5d6b405f62b46eb7aedee96a6b159452b`.

````text
{
  "state": "UNRUN_REQUIRES_EXPLICIT_CORRECTNESS_GRANT",
  "build": {
    "output": ".build/optimization/merged-context-build-v185",
    "jobs": 2,
    "required_reclaimable_gb": 13
  },
  "reference_source_sha256": {
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
    "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
    "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "42310629aef5869a882d4957076e988682aea230bce7f9ffbdae1dfa2d984133",
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
    "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
    "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "0c5f8e429c3b519d3b7ce2636961137bea7d82d7328a11180609450517a6c27e",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "a3cb658bbf29d1f119da68d517fba8e73db64a8ce6b698d14b5671fc25af5ccd",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "04ba0fdae78172e42692455f85e3f21606bef533f4918e1642723f1059c82b50",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "a13dbbc695b58db42dbf8f8437def183b732e848c59f103912c662225ffcfb3f",
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
    "Sources/slotstream-cli/OptimizationCommands.swift": "bb3a76becb56a4e6bd46fe118122b8479e55a61701ce4d37aa7c39a88d456022",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
    "Sources/slotstream-cli/main.swift": "19c67da92554623e267ff0f2a065d95f8ca2e3b152cf858ce39b75acf0b8f046"
  },
  "native": [
    {
      "name": "ngram",
      "command": [
        "optimization-state-check",
        "--variant",
        "ngram",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "cache-bookkeeping",
      "command": [
        "optimization-state-check",
        "--variant",
        "cache-bookkeeping",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "mtp-work-integrated",
      "command": [
        "optimization-state-check",
        "--variant",
        "mtp-work-integrated",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "integrated",
      "command": [
        "optimization-state-check",
        "--variant",
        "integrated",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "integrated-mtp",
      "command": [
        "optimization-state-check",
        "--variant",
        "integrated-mtp",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "complete-prompt",
      "command": [
        "optimization-state-check",
        "--variant",
        "complete-prompt",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "complete-prompt-mtp",
      "command": [
        "optimization-state-check",
        "--variant",
        "complete-prompt-mtp",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "prefix-retention",
      "command": [
        "optimization-state-check",
        "--variant",
        "prefix-retention",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "prefix-retention-mtp",
      "command": [
        "optimization-state-check",
        "--variant",
        "prefix-retention-mtp",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "read-failure-serving",
      "command": [
        "optimization-state-check",
        "--variant",
        "read-failure-serving",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "context-serving",
      "command": [
        "optimization-state-check",
        "--variant",
        "context-serving",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "image-reuse",
      "command": [
        "optimization-state-check",
        "--variant",
        "image-reuse",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "governor-boundary",
      "command": [
        "optimization-state-check",
        "--variant",
        "governor-boundary",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 600,
      "environment": {
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1"
      },
      "purpose": "typed refusal and bounded injected recovery; no physical pressure stress"
    },
    {
      "name": "governor-boundary-mtp",
      "command": [
        "optimization-state-check",
        "--variant",
        "governor-boundary-mtp",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 600,
      "environment": {
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1"
      },
      "purpose": "typed refusal and bounded injected recovery; no physical pressure stress"
    }
  ],
  "stop_on_failure": true,
  "implicit_retries": 0,
  "performance_authorization": false,
  "excludes": [
    "full-cache component",
    "scope family",
    "full-model hashing",
    "capacity ladder",
    "benchmarks",
    "soaks"
  ],
  "binary": "UNBUILT"
}

````

Artifact `/tmp/slotstream-optimization-execution/merged-native-queue-v186.json` — 25014 bytes, SHA-256 `9441f5a80cb232115fe204f3262af325a35ba733c9545cd95abc245edae5ac8c`.

````text
{
  "state": "UNRUN_REQUIRES_EXPLICIT_CORRECTNESS_GRANT",
  "build": {
    "output": ".build/optimization/merged-context-build-v186",
    "jobs": 2,
    "required_reclaimable_gb": 13
  },
  "reference_source_sha256": {
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
    "Sources/Slotstream/Engine.swift": "9f9809e05ea0cb260dda9cd772c2017c08e1e0d94a927304feb8620ecaac7316",
    "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
    "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
    "Sources/Slotstream/ExpertStore.swift": "e73272bce5c32851ff531bfb31f4b9c549c8a7607844155feff4c91a002a2f04",
    "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
    "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
    "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
    "Sources/Slotstream/Generate.swift": "42310629aef5869a882d4957076e988682aea230bce7f9ffbdae1dfa2d984133",
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
    "Sources/Slotstream/PrefixCache.swift": "f8b0a921d06bacfed30626d8b0d4609660cb4e8fcf50d284fe5f1ac38da64919",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
    "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "ac7f3b5ed140a566348e9be06274cf757144d2db099fe5af097c4a3807dc6801",
    "Sources/SlotstreamDiagnostics/Diagnostics+Context.swift": "0c5f8e429c3b519d3b7ce2636961137bea7d82d7328a11180609450517a6c27e",
    "Sources/SlotstreamDiagnostics/Diagnostics+ContextServing.swift": "874e749a4d3663df07a12bbbca237b49ccce2d667c14c4d0285cca3dcc666747",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "a3cb658bbf29d1f119da68d517fba8e73db64a8ce6b698d14b5671fc25af5ccd",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramCache.swift": "9bee4eb6c6cf09df5673e177d4b7f006681794bf680366b4549e4fa3d38b7368",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "a13dbbc695b58db42dbf8f8437def183b732e848c59f103912c662225ffcfb3f",
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
    "Sources/slotstream-cli/OptimizationCommands.swift": "bb3a76becb56a4e6bd46fe118122b8479e55a61701ce4d37aa7c39a88d456022",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/Pull.swift": "4fa56def1edb0ae575bd898e3b53b669f0a16b04d734ef86e0f6c4a6ad185d14",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "df80e089ea9cdbc6fc51ec7dc895b0dbf0eec5d4db80eb73b0ca9720a3ce8cc0",
    "Sources/slotstream-cli/main.swift": "19c67da92554623e267ff0f2a065d95f8ca2e3b152cf858ce39b75acf0b8f046"
  },
  "native": [
    {
      "name": "ngram",
      "command": [
        "optimization-state-check",
        "--variant",
        "ngram",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "cache-bookkeeping",
      "command": [
        "optimization-state-check",
        "--variant",
        "cache-bookkeeping",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "mtp-work-integrated",
      "command": [
        "optimization-state-check",
        "--variant",
        "mtp-work-integrated",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "integrated",
      "command": [
        "optimization-state-check",
        "--variant",
        "integrated",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "integrated-mtp",
      "command": [
        "optimization-state-check",
        "--variant",
        "integrated-mtp",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "complete-prompt",
      "command": [
        "optimization-state-check",
        "--variant",
        "complete-prompt",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "complete-prompt-mtp",
      "command": [
        "optimization-state-check",
        "--variant",
        "complete-prompt-mtp",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "prefix-retention",
      "command": [
        "optimization-state-check",
        "--variant",
        "prefix-retention",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "prefix-retention-mtp",
      "command": [
        "optimization-state-check",
        "--variant",
        "prefix-retention-mtp",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "read-failure-serving",
      "command": [
        "optimization-state-check",
        "--variant",
        "read-failure-serving",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "context-serving",
      "command": [
        "optimization-state-check",
        "--variant",
        "context-serving",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "image-reuse",
      "command": [
        "optimization-state-check",
        "--variant",
        "image-reuse",
        "--tokens",
        "256",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 900,
      "environment": {},
      "purpose": "correctness only; timing/memory observations excluded during download"
    },
    {
      "name": "governor-boundary",
      "command": [
        "optimization-state-check",
        "--variant",
        "governor-boundary",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 600,
      "environment": {
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1"
      },
      "purpose": "typed refusal and bounded injected recovery; no physical pressure stress"
    },
    {
      "name": "governor-boundary-mtp",
      "command": [
        "optimization-state-check",
        "--variant",
        "governor-boundary-mtp",
        "--model",
        "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
        "--json"
      ],
      "required_reclaimable_gb": 13,
      "timeout_seconds": 600,
      "environment": {
        "SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR": "1"
      },
      "purpose": "typed refusal and bounded injected recovery; no physical pressure stress"
    }
  ],
  "stop_on_failure": true,
  "implicit_retries": 0,
  "performance_authorization": false,
  "excludes": [
    "full-cache component",
    "scope family",
    "full-model hashing",
    "capacity ladder",
    "benchmarks",
    "soaks"
  ],
  "binary": "UNBUILT",
  "predecessor_build": "V185 stopped on type-check complexity; no native process launched"
}

````

Artifact `/tmp/slotstream-optimization-execution/run_merged_native_v186.py` — 5533 bytes, SHA-256 `028d0ac7900a90e90a17815f0a281bac3274fc4c42e7c235948ec22305305e8b`.

````text
"""One explicitly granted <=25-minute correctness batch; never benchmarks."""
import hashlib, json, os, signal, subprocess, sys, time
from pathlib import Path

ROOT=Path('/Users/carlos/Projects/slotstream')
sys.path.insert(0,str(ROOT/'Tools'))
from optimization_build import build
from prefill_bench import digest, preflight, run_child, vm_snapshot
from serve_bench import verified_build

QUEUE=Path('/tmp/slotstream-optimization-execution/merged-native-queue-v186.json')
spec=json.loads(QUEUE.read_text())
OUT=ROOT/'.build/optimization/merged-native-v186'
started=time.monotonic()
# Twenty-four minutes of work leaves a minute for owned-child cleanup/return.
deadline=started+1440
summary={'classification':'bounded correctness during authorized download overlap; no timing/capacity claim',
         'queue_sha256':digest(QUEUE),'batch_wall_limit_seconds':1500,'rows':[], 'passed':False}

def remaining(): return deadline-time.monotonic()
def interrupted(signum, frame): raise KeyboardInterrupt(f'signal {signum}')
signal.signal(signal.SIGTERM,interrupted)
signal.signal(signal.SIGINT,interrupted)

def bounded_build_run(command, **kwargs):
    child=subprocess.Popen(command, start_new_session=True, **kwargs)
    try:
        code=child.wait(timeout=max(1,min(420,remaining()-20)))
        return subprocess.CompletedProcess(command,code)
    finally:
        if child.poll() is None:
            os.killpg(child.pid,signal.SIGTERM)
            try: child.wait(timeout=10)
            except subprocess.TimeoutExpired:
                os.killpg(child.pid,signal.SIGKILL);child.wait()

def save():
    summary['elapsed_seconds']=time.monotonic()-started
    (OUT/'manifest.json').write_text(json.dumps(summary,indent=2)+'\n')

def native(binary, name, command, extra_env, ceiling=900, catalogue=False):
    if remaining()<min(ceiling + 20, 300): return False
    verified_build(binary)
    out=OUT/name;out.mkdir()
    env={k:v for k,v in os.environ.items() if not k.startswith('SLOTSTREAM_')}
    env.update(extra_env)
    row={'name':name,'binary':str(binary),'identity':verified_build(binary)['identity'],
         'command':[str(binary.parent/'slotstream-checks' if catalogue else binary),*command],
         'environment':extra_env,'passed':False,'required_reclaimable_gb':13,
         'classification':summary['classification']}
    summary['rows'].append(row)
    begin=time.monotonic()
    try:
        row['before']=preflight(13)
        row['timeout_seconds']=int(min(ceiling,remaining()-20))
        print(json.dumps({'phase':'starting','name':name,'timeout_seconds':row['timeout_seconds']}),flush=True)
        row['exit_code']=run_child(row['command'],env,out,row['timeout_seconds'])
        report=json.loads((out/'stdout.txt').read_text())
        if catalogue:
            checks=report.get('checks',[])
            row['checks_sha256']=digest(binary.parent/'slotstream-checks')
            row['groups']=len(checks)
            row['assertions']=sum(len(c.get('items',[])) for c in checks)
            row['passed']=(row['exit_code']==0 and len(checks)>0 and report.get('failed')==0
                and report.get('skipped')==0 and report.get('passed')==len(checks)
                and all(c.get('passed') is True for c in checks))
        else:
            row['assertions']=len(report.get('items',[]))
            row['passed']=(row['exit_code']==0 and report.get('passed') is True
                and not report.get('skipped') and row['assertions']>0
                and all(c.get('passed') is True for c in report['items']))
    except BaseException as error:
        row['error']=f'{type(error).__name__}: {error}'
        if isinstance(error,KeyboardInterrupt): raise
    finally:
        row['after']=vm_snapshot();row['duration_seconds']=time.monotonic()-begin
        for file in ['stdout.txt','stderr.txt']:
            if (out/file).exists():row[file+'_sha256']=digest(out/file)
        (out/'manifest.json').write_text(json.dumps(row,indent=2)+'\n')
        save()
        print(json.dumps({k:row[k] for k in ['name','passed','assertions','duration_seconds','error'] if k in row}),flush=True)
    if not row['passed']: raise RuntimeError(f'{name} failed; stopping the batch')
    return True

OUT.mkdir(exist_ok=False)
try:
    actual={str(p.relative_to(ROOT)):hashlib.sha256(p.read_bytes()).hexdigest()
        for p in sorted((ROOT/'Sources').rglob('*')) if p.is_file()}
    if actual!=spec['reference_source_sha256']:raise ValueError('source changed since the reviewed queue')
    receipt=build(ROOT,ROOT/spec['build']['output'],jobs=2,required_gb=13,run=bounded_build_run)
    summary['build']=receipt
    if not receipt['passed']:raise RuntimeError('shared build failed; no native test launched')
    binary=ROOT/spec['build']['output']/'candidate/slotstream'
    if not native(binary,'t0',['--tier','t0','--json'],{},ceiling=60,catalogue=True):
        raise TimeoutError('batch deadline reached before T0')
    for row in spec['native']:
        if not native(binary,row['name'],row['command'],row['environment'],row['timeout_seconds']):
            summary['stopped_at_batch_boundary']=True
            break
    summary['passed']=all(r['passed'] for r in summary['rows'])
    summary['complete_queue']=len(summary['rows'])==len(spec['native'])+1
except BaseException as error:
    summary['error']=f'{type(error).__name__}: {error}'
finally:
    save()
print(json.dumps({k:v for k,v in summary.items() if k not in ('rows','build')}),flush=True)
raise SystemExit(0 if summary['passed'] else 1)

````
