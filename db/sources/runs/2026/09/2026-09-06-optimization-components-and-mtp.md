---
type: run
id: 01m1t9x7f23pwmczfyj1k9rs96
created: 2026-09-06T02:49:07.297647+00:00
updated: 2026-09-06T02:49:40.610455+00:00
summary: Native components, dense projection counterexample and combined MTP V107
binary: 3c4a4ce4a30d18dbce54a53982a9ad2114ed7380eaf95d6093b1582f43895179
captured_at: 2026-09-06
command: slot-cpu-component; compute-islands; integrated-mtp
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Native components, dense projection counterexample and combined MTP V107
tool: Tools/optimization_build.py and Tools/optimization_check.py
---
# V107 native source closure, component checks and combined MTP

V105 fails to compile because several diagnostic expressions exceed Swift type-checker limits. V106 fixes those expressions but uses withUnsafeBytes on MLXArrayData rather than its data member. V107 fixes that diagnostic accessor and builds successfully. All attempts are preserved below. The V107 source archive includes the newly added CSlotpack implementation and header; the earlier V104 omission is not retroactively repaired.

The CPU slot-write component passes 174 assertions. Exact BF16/UInt32 bytes, bounded destination geometry, retained Swift/view readers, a distinct GPU stream reader, and a GPU consumer after CPU updates pass. Its exclusive-storage observation reports reuse=1. This is a component ownership result, not an inference speed measurement or a replacement for full pool/resize/failure/generation checks. The GPU reader test establishes a distinct stream and correct values; it does not instrument the precise hardware overlap interval. V107 contains the isolated helper only, with no model CPU-write dispatch.

The compute-island component passes 69 of 71 assertions. Both failures are the dense GDN B/A projection group at 256 rows, for contiguous and noncontiguous inputs. Concatenating those matrices therefore fails the declared exact-byte contract and is not eligible for unconditional adoption. The two quantized groups (shared gate/up and GDN QKV/Z), their pointwise/combined GLU comparisons, and every finite BF16 gate across seven multipliers pass all 55 corresponding assertions. The dense group remains an executable counterexample. A separately named successor excludes that entire dense group, rather than adding a row-specific exception. No compute timing experiment has run.

All 181 combined MTP assertions pass on V107. Complete retained state/representation and continued logits, prompt lengths 17/255/256/257/1025, real images before/crossing the 256 boundary, greedy and two sampled modes/two seeds, prefix reuse/interleaving/edits, callback cancellation and retry remain exact. These are correctness results only. Ordinary integration must still be run on the final rebuilt candidate; V104's 167 ordinary assertions remain diagnostic evidence under their disclosed archive limitation.

V108 is in preparation/build at this record. It introduces an explicit default-off CPU slot-write flag, rejects conflicting word/slice flags, and adds prefill/decode CPU batch counters plus pool/storage/full-state/recovery variants. It does not remove the existing synchronization or change slot reservation, read atomicity or mapping publication. The benchmark harness now supports optional prospective per-arm integer work bounds and passes 29 tests; older protocols without the field retain their semantics. No CPU pool/runtime or paired performance result is claimed yet. Combined defaults and planner credit remain pending.

V107 binary SHA256 `3c4a4ce4a30d18dbce54a53982a9ad2114ed7380eaf95d6093b1582f43895179`.

## .build/optimization/compute-slot-components-build-v105/build.txt

SHA256 `0a214fbc8cb8394cd2cae900e7b118706fea09370dbcc2eb3b981c9be4e9c419`; 8151 bytes.

````text
python3 Tools/build_identity.py before .build/release
swift build -c release
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[0/1] Planning build
[1/1] Compiling plugin GenerateManual
[2/2] Compiling plugin GenerateDoccReference
[3/3] Compiling plugin CudaBuild
Building for production...
[3/11] Write swift-version--1AB21518FC5DEDBE.txt
[4/11] Write sources
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
/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift:88:30: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
 86 |             c.measure("\(label).quantized", island.original[0].isQuantized ? 1 : 0)
 87 |             for rows in [1, 2, 8, 16, 32, 256, 257, 1024] {
 88 |                 let values = (0..<rows * index.config.hiddenSize).map { Float(($0 * 31 + 7) % 257 - 128) / 131 }
    |                              `- error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
 89 |                 let storage = MLXArray(values, [1, index.config.hiddenSize, rows]).asType(.bfloat16)
 90 |                 eval(storage)

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift:100:19: error: failed to produce diagnostic for expression; please submit a bug report (https://swift.org/contributing/#reporting-bugs)
 98 |                 eval(reference + combined)
 99 |                 let key = "\(label).rows_\(rows)"
100 |                 c.expect("\(key): exact projection slices", zip(reference, combined).allSatisfy { exact($0.0, $0.1) })
    |                   `- error: failed to produce diagnostic for expression; please submit a bug report (https://swift.org/contributing/#reporting-bugs)
101 |                 let stridedReference = island.call(strided, fused: false)
102 |                 let stridedCombined = island.call(strided, fused: true)

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift:103:19: error: failed to produce diagnostic for expression; please submit a bug report (https://swift.org/contributing/#reporting-bugs)
101 |                 let stridedReference = island.call(strided, fused: false)
102 |                 let stridedCombined = island.call(strided, fused: true)
103 |                 c.expect("\(key): noncontiguous input exact", zip(stridedReference, stridedCombined).allSatisfy { exact($0.0, $0.1) })
    |                   `- error: failed to produce diagnostic for expression; please submit a bug report (https://swift.org/contributing/#reporting-bugs)
104 |                 if label == "shared-gate-up" {
105 |                     c.expect("\(key): combined GLU exact", exact(compiledGLU(combined[0], combined[1]),

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

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift:108:13: error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
106 |             c.expect("retained view keeps old bytes", (view .== original[0..<32]).all().item(Bool.self))
107 |             c.equal("other GPU stream reader completes before overwrite", pendingReader.item(UInt32.self), UInt32(4096 * 4097 / 2))
108 |             c.equal("GPU consumer sees CPU update", consumer.item(UInt32.self), UInt32(4096 * 4095 / 2 - (1 + 7 + 11) * 64 * 64 - 3 * 63 * 64 / 2))
    |             `- error: the compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
109 |             for slots: [Int32] in [[], [-1], [64], [3, 3], Array(0..<33)] {
110 |                 do {

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift:120:19: warning: 'asData(noCopy:disambiguate:)' is deprecated: use asData(acccess: .copy) [#DeprecatedDeclaration]
118 |             eval(exclusive)
119 |             func address(_ a: MLXArray) -> UInt {
120 |                 a.asData(noCopy: true).withUnsafeBytes { UInt(bitPattern: $0.baseAddress!) }
    |                   `- warning: 'asData(noCopy:disambiguate:)' is deprecated: use asData(acccess: .copy) [#DeprecatedDeclaration]
121 |             }
122 |             let before = address(exclusive)

[#DeprecatedDeclaration]: <https://docs.swift.org/compiler/documentation/diagnostics/deprecated-declaration>
[#SendableClosureCaptures]: <https://docs.swift.org/compiler/documentation/diagnostics/sendable-closure-captures>
[#WeakMutability]: <https://docs.swift.org/compiler/documentation/diagnostics/weak-mutability>
make: *** [build] Error 1

````

## .build/optimization/compute-slot-components-build-v105/manifest.json

SHA256 `cde9d24c81d8fc3d3d41dc52b67f49cd90d24e19e3d5249256d32449d03f00af`; 4565 bytes.

````text
{
  "classification": "build only; no runtime performance evidence",
  "required_reclaimable_gb": 13,
  "model_lock_held_during_build": true,
  "passed": false,
  "command": [
    "make",
    "build"
  ],
  "working_directory": "/Users/carlos/Projects/slotstream",
  "reservation_wait_limit_seconds": 1800,
  "reservation_wait": {
    "seconds": 136.383529625,
    "attempts": 69
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 37209882624,
    "swapins": 42641210,
    "swapouts": 74262899,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   430931.\nPages active:                                 908082.\nPages inactive:                              1407240.\nPages speculative:                              7096.\nPages throttled:                                   0.\nPages wired down:                             227684.\nPages purgeable:                                1503.\n\"Translation faults\":                    14382608915.\nPages copy-on-write:                       660899030.\nPages zero filled:                       17979363990.\nPages reactivated:                        3112495261.\nPages purged:                               66707379.\nFile-backed pages:                           1838677.\nAnonymous pages:                              483741.\nPages stored in compressor:                  1643994.\nPages occupied by compressor:                 101565.\nDecompressions:                           1114026371.\nCompressions:                             1419257052.\nPageins:                                  6807257730.\nPageouts:                                   10894754.\nSwapins:                                    42641210.\nSwapouts:                                   74262899.\nPages tagged:                                 153239.\nPages tagged resident:                        118541.\nPages tagged compressed:                       34698.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         2804.\nPages tag-storage non-tag pageable:            88693.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6270528.\nTagged compressions:                        10436978.\nTagged decompressions:                       9629659.\n"
  },
  "exit_code": 2,
  "error": "RuntimeError: make failed with exit code 2; no candidate frozen",
  "elapsed_seconds": 169.177776125,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 37108236288,
    "swapins": 42641818,
    "swapouts": 74262899,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   397098.\nPages active:                                 904099.\nPages inactive:                              1422184.\nPages speculative:                             13530.\nPages throttled:                                   0.\nPages wired down:                             247781.\nPages purgeable:                                 429.\n\"Translation faults\":                    14382901746.\nPages copy-on-write:                       660921150.\nPages zero filled:                       17979534936.\nPages reactivated:                        3112495431.\nPages purged:                               66707387.\nFile-backed pages:                           1867380.\nAnonymous pages:                              472433.\nPages stored in compressor:                  1636915.\nPages occupied by compressor:                  98200.\nDecompressions:                           1114032035.\nCompressions:                             1419257052.\nPageins:                                  6807283265.\nPageouts:                                   10894754.\nSwapins:                                    42641818.\nSwapouts:                                   74262899.\nPages tagged:                                 150573.\nPages tagged resident:                        116265.\nPages tagged compressed:                       34308.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         2636.\nPages tag-storage non-tag pageable:            88861.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6192640.\nTagged compressions:                        10436978.\nTagged decompressions:                       9630049.\n"
  }
}

````

## .build/optimization/compute-slot-components-build-v106/build.txt

SHA256 `0975e1ecd79ff21716563d05b55093362f3497d72a2c5263e2ab58e12f1939a1`; 3414 bytes.

````text
python3 Tools/build_identity.py before .build/release
swift build -c release
[1/1] Compiling plugin GenerateManual
[2/2] Compiling plugin GenerateDoccReference
[3/3] Compiling plugin CudaBuild
Building for production...
[3/9] Write sources
[4/9] Write swift-version--1AB21518FC5DEDBE.txt
[6/10] Compiling SlotstreamDiagnostics CheckReport.swift
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

/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift:122:55: error: value of type 'MLXArray.MLXArrayData' has no member 'withUnsafeBytes'
120 |             eval(exclusive)
121 |             func address(_ a: MLXArray) -> UInt {
122 |                 a.asData(access: .noCopyIfContiguous).withUnsafeBytes { UInt(bitPattern: $0.baseAddress!) }
    |                                                       `- error: value of type 'MLXArray.MLXArrayData' has no member 'withUnsafeBytes'
123 |             }
124 |             let before = address(exclusive)

[#SendableClosureCaptures]: <https://docs.swift.org/compiler/documentation/diagnostics/sendable-closure-captures>
[#WeakMutability]: <https://docs.swift.org/compiler/documentation/diagnostics/weak-mutability>
make: *** [build] Error 1

````

## .build/optimization/compute-slot-components-build-v106/manifest.json

SHA256 `1e8c426e024596929f912d15a0311328a5c2889dc538bfd8a50f286ad061ec38`; 4571 bytes.

````text
{
  "classification": "build only; no runtime performance evidence",
  "required_reclaimable_gb": 13,
  "model_lock_held_during_build": true,
  "passed": false,
  "command": [
    "make",
    "build"
  ],
  "working_directory": "/Users/carlos/Projects/slotstream",
  "reservation_wait_limit_seconds": 1800,
  "reservation_wait": {
    "seconds": 3.2499999999963114e-06,
    "attempts": 1
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 37189582848,
    "swapins": 42644023,
    "swapouts": 74262899,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   357033.\nPages active:                                 932187.\nPages inactive:                              1447038.\nPages speculative:                             21702.\nPages throttled:                                   0.\nPages wired down:                             233306.\nPages purgeable:                               10801.\n\"Translation faults\":                    14383152854.\nPages copy-on-write:                       660948149.\nPages zero filled:                       17979663948.\nPages reactivated:                        3112495788.\nPages purged:                               66707899.\nFile-backed pages:                           1902038.\nAnonymous pages:                              498889.\nPages stored in compressor:                  1617089.\nPages occupied by compressor:                  93309.\nDecompressions:                           1114050962.\nCompressions:                             1419257052.\nPageins:                                  6807313501.\nPageouts:                                   10894754.\nSwapins:                                    42644023.\nSwapouts:                                   74262899.\nPages tagged:                                 150731.\nPages tagged resident:                        118260.\nPages tagged compressed:                       32471.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         1052.\nPages tag-storage non-tag pageable:            90445.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5772800.\nTagged compressions:                        10436978.\nTagged decompressions:                       9631883.\n"
  },
  "exit_code": 2,
  "error": "RuntimeError: make failed with exit code 2; no candidate frozen",
  "elapsed_seconds": 2.832896166,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 37242978304,
    "swapins": 42644054,
    "swapouts": 74262899,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   354879.\nPages active:                                 934015.\nPages inactive:                              1452020.\nPages speculative:                             21333.\nPages throttled:                                   0.\nPages wired down:                             229145.\nPages purgeable:                               11945.\n\"Translation faults\":                    14383232255.\nPages copy-on-write:                       660951620.\nPages zero filled:                       17979697796.\nPages reactivated:                        3112495788.\nPages purged:                               66707899.\nFile-backed pages:                           1906307.\nAnonymous pages:                              501061.\nPages stored in compressor:                  1616830.\nPages occupied by compressor:                  93161.\nDecompressions:                           1114051221.\nCompressions:                             1419257052.\nPageins:                                  6807318747.\nPageouts:                                   10894754.\nSwapins:                                    42644054.\nSwapouts:                                   74262899.\nPages tagged:                                 150873.\nPages tagged resident:                        118402.\nPages tagged compressed:                       32471.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         1127.\nPages tag-storage non-tag pageable:            90370.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5772800.\nTagged compressions:                        10436978.\nTagged decompressions:                       9631883.\n"
  }
}

````

## .build/optimization/compute-slot-components-build-v107/build.txt

SHA256 `1c19a5cb7bd8b432f2a1ebcf32d9d2cba77c30e57f574fcb4b38d9a312aef6af`; 4369 bytes.

````text
python3 Tools/build_identity.py before .build/release
swift build -c release
[1/1] Compiling plugin GenerateManual
[2/2] Compiling plugin GenerateDoccReference
[3/3] Compiling plugin CudaBuild
Building for production...
[3/10] Write sources
[4/10] Write swift-version--1AB21518FC5DEDBE.txt
[5/10] Compiling CSlotpack slotpack.c
[7/11] Compiling Slotstream AdaptiveSpeculation.swift
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
[8/12] Compiling SlotstreamDiagnostics CheckReport.swift
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
[9/14] Compiling SlotstreamTestKit Catalogue.swift
[9/14] Write Objects.LinkFileList
[11/14] Compiling slotstream_cli CheckRendering.swift
[11/14] Write Objects.LinkFileList
[12/14] Linking slotstream-checks
[13/14] Linking slotstream
Build complete! (70.24s)
cp Tools/lib/mlx-0.31.1.metallib .build/release/mlx.metallib
python3 Tools/build_identity.py after .build/release

````

## .build/optimization/compute-slot-components-build-v107/manifest.json

SHA256 `f0fc7ce9ca5cabc04dd613e148a4ec57b32bf60ace01a55cd1f3a740381c6cde`; 20931 bytes.

````text
{
  "classification": "build only; no runtime performance evidence",
  "required_reclaimable_gb": 13,
  "model_lock_held_during_build": true,
  "passed": true,
  "command": [
    "make",
    "build"
  ],
  "working_directory": "/Users/carlos/Projects/slotstream",
  "reservation_wait_limit_seconds": 1800,
  "reservation_wait": {
    "seconds": 3.083000000000946e-06,
    "attempts": 1
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 37143740416,
    "swapins": 42652170,
    "swapouts": 74262899,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   313963.\nPages active:                                 938002.\nPages inactive:                              1489906.\nPages speculative:                             25160.\nPages throttled:                                   0.\nPages wired down:                             227375.\nPages purgeable:                                1895.\n\"Translation faults\":                    14384020328.\nPages copy-on-write:                       661097671.\nPages zero filled:                       17979957487.\nPages reactivated:                        3112496270.\nPages purged:                               66709088.\nFile-backed pages:                           1951216.\nAnonymous pages:                              501852.\nPages stored in compressor:                  1590695.\nPages occupied by compressor:                  89941.\nDecompressions:                           1114071312.\nCompressions:                             1419257052.\nPageins:                                  6807363271.\nPageouts:                                   10894754.\nSwapins:                                    42652170.\nSwapouts:                                   74262899.\nPages tagged:                                 150991.\nPages tagged resident:                        119159.\nPages tagged compressed:                       31832.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         1450.\nPages tag-storage non-tag pageable:            90047.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5670848.\nTagged compressions:                        10436978.\nTagged decompressions:                       9632520.\n"
  },
  "exit_code": 0,
  "frozen": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compute-slot-components-build-v107/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
        "Sources/CSlotpack/include/slotpack.h": "c0377f2f6fdbae3a08eee0fa171f3e78ab298daabc0c0bd9455eebc84b27bf7f",
        "Sources/CSlotpack/slotpack.c": "3b85f78ae18d9add59b5369d282c69d0a402e40563d69bde2b7f30d7d52540f9",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CPUSlotWrite.swift": "786d9c407b38aa5e8a4ec2c44d39c331171468d6af0d647abf8055f7bf452eda",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
        "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
        "Sources/Slotstream/DownloadHTTP.swift": "2cd8d7ed45b9909608bf2553005c6d99e5a914ba9576de8f45889c1fbb2c11bd",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "3d74c6dad941df731c7b8f1073623429242458767c29736a5fcb0f06de614057",
        "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
        "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
        "Sources/Slotstream/ExpertStore.swift": "8c8f1a5d0663cec3f6b547d05b65d23e38654841502117e42e3e89632a7c1190",
        "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
        "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
        "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
        "Sources/Slotstream/Generate.swift": "672dba700ea763457136842ed31b9ade193b96ca001dc4b0723ed5b1d850a44b",
        "Sources/Slotstream/Governor.swift": "1051b77bc36d44645081687dcc3fadb7e0f7427e77dac1706f785fe6e6e8a9eb",
        "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
        "Sources/Slotstream/Layers.swift": "8d921313527a80924504caedb58dfc437d01e1d04c77245386b227ab88ef4798",
        "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
        "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
        "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
        "Sources/Slotstream/Model.swift": "de1a2269724436d94c1c7f35769cd1beb6e6d63af9cb8c87438d7a03fbffdb76",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/Optimizations.swift": "79607924bdf14ee3fbb14bced6a8b884f92a8b45b9089211c25d286f89eaa585",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/PinnedTransport.swift": "4bd53ef9e3bd48687e95fc3e330c563dc0281bc1d754ca74f070dec952efe585",
        "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
        "Sources/Slotstream/PrefixCache.swift": "9bb9ad731a24e3fb84e15c92401d97f6677859553bfd15d23d541ae9be87bc01",
        "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "0746b27981132931d9773f5f43c2287a61772522a5272c9900139d2e1f185442",
        "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
        "Sources/Slotstream/SlotpackDownload.swift": "17b6000910dc694d7f3dc650e74b836ef5eeee54441138f8cf9d868189f9282d",
        "Sources/Slotstream/SlotpackManifest.swift": "1ed9df8e2d067bcbea985e78c80de57dfb51cf0718a8b32f11082ca9d66860b4",
        "Sources/Slotstream/StatePrefixFork.swift": "b21e2da892dfe6024de879c42c4ffe89dc19ad1b22a1b8fcbebeba17324e2fba",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
        "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
        "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
        "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
        "Sources/Slotstream/WeightDownload.swift": "c01c3ffcf272063d9a650c9e76597da267c552a1f06989e2738db253b20fbe16",
        "Sources/Slotstream/WeightStore.swift": "248d5923ba2b41d663868859557d14dd0187179acc8430faba94054a0835a1f0",
        "Sources/Slotstream/Weights.swift": "69a422597f7b28628a49c8b4a9d5f77ae670ff387c6b33610927bccf6352139f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "9c95af798defad82647bc5a4f3ee25ef11f70e824a2ed6ff21bd63552c829d16",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
        "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "943a3d79b8e0b4a2ac086faf57a6ef1a850fffe957172312361e9405c2ede2de",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "34e74989d1f4fd2fcc9fd8cb9b0f1fc75c0e4e1c214751f44245f2543270ab09",
        "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "083d9e609c0b3ec93feed540e25aaafb722521de9c0491cf2e4d2af66adf3b8b",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "3c9597f3661113dc10f274f3d59bca199dfbaa0d262741e31eb079dd225568c1",
        "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
        "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
        "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
        "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
        "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
        "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "4c231bad7cceecf5f1ba866d5373a59f58e9107d6e6244dbf7742c31e72b59cb",
        "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
        "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
        "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
        "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
        "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
        "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
        "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
        "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
        "Sources/SlotstreamTestKit/T0Checks.swift": "bfd462ebd02ea4258037ec568e6ba16362a8cd3970e4a3f9555b78d909093fc0",
        "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
        "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
        "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
        "Sources/slotstream-cli/ContextCommands.swift": "141be8cedbcdabc67df5e764cec5d416e89ba4fa24a7b5ce38e4486ca786372c",
        "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
        "Sources/slotstream-cli/OptimizationCommands.swift": "12aaa4753b91183020d840f1a81fd7431132c3f3434149a1ae50e09f8da856a3",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "96e65c3d51797e9a6aa2afd123b6a015ba4b5b71bbb1efe9be4be13a1c8a9127",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
        "Sources/slotstream-cli/main.swift": "34523f9b77217c875b810b75997b8239e9cb86c823f1e6edb86147adf8855a0b",
        "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "0eaa4df99c20824a8279d1e0f58ee260002b276c07a2f11885f2574d4daa0be2",
      "binary_sha256": "3c4a4ce4a30d18dbce54a53982a9ad2114ed7380eaf95d6093b1582f43895179",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "checks_sha256": "0d97976a6775afbaccb22ff26b47af3436177cb86aad6e06d1f04998d1f5da2d",
  "elapsed_seconds": 70.911831792,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 36952064000,
    "swapins": 42653116,
    "swapouts": 74262899,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   201205.\nPages active:                                 978928.\nPages inactive:                              1544984.\nPages speculative:                             51017.\nPages throttled:                                   0.\nPages wired down:                             227075.\nPages purgeable:                                1877.\n\"Translation faults\":                    14384869369.\nPages copy-on-write:                       661162381.\nPages zero filled:                       17980438526.\nPages reactivated:                        3112496732.\nPages purged:                               66709615.\nFile-backed pages:                           2052293.\nAnonymous pages:                              522636.\nPages stored in compressor:                  1570305.\nPages occupied by compressor:                  80317.\nDecompressions:                           1114091670.\nCompressions:                             1419257052.\nPageins:                                  6807423255.\nPageouts:                                   10894754.\nSwapins:                                    42653116.\nSwapouts:                                   74262899.\nPages tagged:                                 151085.\nPages tagged resident:                        119386.\nPages tagged compressed:                       31699.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         1842.\nPages tag-storage non-tag pageable:            89655.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5647424.\nTagged compressions:                        10436978.\nTagged decompressions:                       9632651.\n"
  }
}

````

## .build/optimization/slot-cpu-component-v107/stdout.txt

SHA256 `300068b6daff586d294336474e354f80b765f309390f1f5775fca6dced1b4ad3`; 19585 bytes.

````text
{
  "items" : [
    {
      "name" : "plan []",
      "passed" : true
    },
    {
      "name" : "plan [0]",
      "passed" : true
    },
    {
      "name" : "source coverage [0]",
      "passed" : true
    },
    {
      "name" : "destination order [0]",
      "passed" : true
    },
    {
      "name" : "plan [63]",
      "passed" : true
    },
    {
      "name" : "source coverage [63]",
      "passed" : true
    },
    {
      "name" : "destination order [63]",
      "passed" : true
    },
    {
      "name" : "plan [2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "source coverage [2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "destination order [2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "plan [62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "source coverage [62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "destination order [62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "plan [9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "source coverage [9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "destination order [9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "plan [0, 2]",
      "passed" : true
    },
    {
      "name" : "source coverage [0, 2]",
      "passed" : true
    },
    {
      "name" : "destination order [0, 2]",
      "passed" : true
    },
    {
      "name" : "plan [0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "plan [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "source coverage [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "destination order [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "plan [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]",
      "passed" : true
    },
    {
      "name" : "plan [3, 3]",
      "passed" : true
    },
    {
      "name" : "plan [-1]",
      "passed" : true
    },
    {
      "name" : "plan [64]",
      "passed" : true
    },
    {
      "name" : "plan [2147483647]",
      "passed" : true
    },
    {
      "name" : "plan [-2147483648]",
      "passed" : true
    },
    {
      "name" : "invalid capacity",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1 slots=[0]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1 slots=[0]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1 slots=[63]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1 slots=[63]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=3 slots=[0]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=3 slots=[0]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=3 slots=[63]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=3 slots=[63]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=3 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=3 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=3 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=3 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=3 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=3 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=3 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=3 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=3 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=3 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=3 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=3 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=128 slots=[0]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=128 slots=[0]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=128 slots=[63]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=128 slots=[63]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=128 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=128 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=128 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=128 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=128 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=128 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=128 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=128 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=128 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=128 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=128 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=128 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1024 slots=[0]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1024 slots=[0]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1024 slots=[63]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1024 slots=[63]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1024 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1024 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1024 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1024 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1024 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1024 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1024 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1024 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1024 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1024 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes uint32 width=1024 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged uint32 width=1024 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1 slots=[0]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1 slots=[0]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1 slots=[63]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1 slots=[63]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=3 slots=[0]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=3 slots=[0]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=3 slots=[63]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=3 slots=[63]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=3 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=3 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=3 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=3 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=3 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=3 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=3 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=3 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=3 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=3 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=3 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=3 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=128 slots=[0]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=128 slots=[0]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=128 slots=[63]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=128 slots=[63]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=128 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=128 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=128 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=128 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=128 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=128 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=128 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=128 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=128 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=128 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=128 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=128 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1024 slots=[0]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1024 slots=[0]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1024 slots=[63]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1024 slots=[63]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1024 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1024 slots=[2, 3, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1024 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1024 slots=[62, 63, 0, 1]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1024 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1024 slots=[9, 10, 2, 3]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1024 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1024 slots=[0, 2]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1024 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1024 slots=[0, 2, 4]",
      "passed" : true
    },
    {
      "name" : "exact bytes bfloat16 width=1024 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "retained reader unchanged bfloat16 width=1024 slots=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31]",
      "passed" : true
    },
    {
      "name" : "reader uses a distinct GPU stream",
      "passed" : true
    },
    {
      "name" : "same Swift object alias retains old bytes",
      "passed" : true
    },
    {
      "name" : "retained view keeps old bytes",
      "passed" : true
    },
    {
      "name" : "other GPU stream reader completes before overwrite",
      "passed" : true
    },
    {
      "name" : "GPU consumer sees CPU update",
      "passed" : true
    },
    {
      "name" : "invalid CPU rows rejected []",
      "passed" : true
    },
    {
      "name" : "rejection leaves destination unchanged []",
      "passed" : true
    },
    {
      "name" : "invalid CPU rows rejected [-1]",
      "passed" : true
    },
    {
      "name" : "rejection leaves destination unchanged [-1]",
      "passed" : true
    },
    {
      "name" : "invalid CPU rows rejected [64]",
      "passed" : true
    },
    {
      "name" : "rejection leaves destination unchanged [64]",
      "passed" : true
    },
    {
      "name" : "invalid CPU rows rejected [3, 3]",
      "passed" : true
    },
    {
      "name" : "rejection leaves destination unchanged [3, 3]",
      "passed" : true
    },
    {
      "name" : "invalid CPU rows rejected [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]",
      "passed" : true
    },
    {
      "name" : "rejection leaves destination unchanged [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]",
      "passed" : true
    },
    {
      "name" : "exclusive CPU update preserves full contents",
      "passed" : true
    }
  ],
  "measurements" : {
    "exclusive_storage_reused" : 1
  },
  "name" : "optimization-slot-cpu",
  "passed" : true
}

````

## .build/optimization/slot-cpu-component-v107/stderr.txt

SHA256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## .build/optimization/slot-cpu-component-v107/manifest.json

SHA256 `d985ac92ed130130ae270d5b0e9bd59485fe6ed7c29e4b84937eb79e80cf84d7`; 20715 bytes.

````text
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compute-slot-components-build-v107/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
      "Sources/CSlotpack/include/slotpack.h": "c0377f2f6fdbae3a08eee0fa171f3e78ab298daabc0c0bd9455eebc84b27bf7f",
      "Sources/CSlotpack/slotpack.c": "3b85f78ae18d9add59b5369d282c69d0a402e40563d69bde2b7f30d7d52540f9",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CPUSlotWrite.swift": "786d9c407b38aa5e8a4ec2c44d39c331171468d6af0d647abf8055f7bf452eda",
      "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/DownloadHTTP.swift": "2cd8d7ed45b9909608bf2553005c6d99e5a914ba9576de8f45889c1fbb2c11bd",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "3d74c6dad941df731c7b8f1073623429242458767c29736a5fcb0f06de614057",
      "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertStore.swift": "8c8f1a5d0663cec3f6b547d05b65d23e38654841502117e42e3e89632a7c1190",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "672dba700ea763457136842ed31b9ade193b96ca001dc4b0723ed5b1d850a44b",
      "Sources/Slotstream/Governor.swift": "1051b77bc36d44645081687dcc3fadb7e0f7427e77dac1706f785fe6e6e8a9eb",
      "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
      "Sources/Slotstream/Layers.swift": "8d921313527a80924504caedb58dfc437d01e1d04c77245386b227ab88ef4798",
      "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
      "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "de1a2269724436d94c1c7f35769cd1beb6e6d63af9cb8c87438d7a03fbffdb76",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "Sources/Slotstream/Optimizations.swift": "79607924bdf14ee3fbb14bced6a8b884f92a8b45b9089211c25d286f89eaa585",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "4bd53ef9e3bd48687e95fc3e330c563dc0281bc1d754ca74f070dec952efe585",
      "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
      "Sources/Slotstream/PrefixCache.swift": "9bb9ad731a24e3fb84e15c92401d97f6677859553bfd15d23d541ae9be87bc01",
      "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "0746b27981132931d9773f5f43c2287a61772522a5272c9900139d2e1f185442",
      "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
      "Sources/Slotstream/SlotpackDownload.swift": "17b6000910dc694d7f3dc650e74b836ef5eeee54441138f8cf9d868189f9282d",
      "Sources/Slotstream/SlotpackManifest.swift": "1ed9df8e2d067bcbea985e78c80de57dfb51cf0718a8b32f11082ca9d66860b4",
      "Sources/Slotstream/StatePrefixFork.swift": "b21e2da892dfe6024de879c42c4ffe89dc19ad1b22a1b8fcbebeba17324e2fba",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
      "Sources/Slotstream/WeightDownload.swift": "c01c3ffcf272063d9a650c9e76597da267c552a1f06989e2738db253b20fbe16",
      "Sources/Slotstream/WeightStore.swift": "248d5923ba2b41d663868859557d14dd0187179acc8430faba94054a0835a1f0",
      "Sources/Slotstream/Weights.swift": "69a422597f7b28628a49c8b4a9d5f77ae670ff387c6b33610927bccf6352139f",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "9c95af798defad82647bc5a4f3ee25ef11f70e824a2ed6ff21bd63552c829d16",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "943a3d79b8e0b4a2ac086faf57a6ef1a850fffe957172312361e9405c2ede2de",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "34e74989d1f4fd2fcc9fd8cb9b0f1fc75c0e4e1c214751f44245f2543270ab09",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "083d9e609c0b3ec93feed540e25aaafb722521de9c0491cf2e4d2af66adf3b8b",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "3c9597f3661113dc10f274f3d59bca199dfbaa0d262741e31eb079dd225568c1",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
      "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "4c231bad7cceecf5f1ba866d5373a59f58e9107d6e6244dbf7742c31e72b59cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
      "Sources/SlotstreamTestKit/T0Checks.swift": "bfd462ebd02ea4258037ec568e6ba16362a8cd3970e4a3f9555b78d909093fc0",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "141be8cedbcdabc67df5e764cec5d416e89ba4fa24a7b5ce38e4486ca786372c",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "12aaa4753b91183020d840f1a81fd7431132c3f3434149a1ae50e09f8da856a3",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "96e65c3d51797e9a6aa2afd123b6a015ba4b5b71bbb1efe9be4be13a1c8a9127",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
      "Sources/slotstream-cli/main.swift": "34523f9b77217c875b810b75997b8239e9cb86c823f1e6edb86147adf8855a0b",
      "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "0eaa4df99c20824a8279d1e0f58ee260002b276c07a2f11885f2574d4daa0be2",
    "binary_sha256": "3c4a4ce4a30d18dbce54a53982a9ad2114ed7380eaf95d6093b1582f43895179",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 7.0,
  "timeout_seconds": 180,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/compute-slot-components-build-v107/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "slot-cpu-component",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 36537696256,
    "swapins": 42654122,
    "swapouts": 74262899,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   142746.\nPages active:                                1017060.\nPages inactive:                              1573861.\nPages speculative:                             53071.\nPages throttled:                                   0.\nPages wired down:                             227208.\nPages purgeable:                                1909.\n\"Translation faults\":                    14385335902.\nPages copy-on-write:                       661217470.\nPages zero filled:                       17980678051.\nPages reactivated:                        3112497215.\nPages purged:                               66710655.\nFile-backed pages:                           2085429.\nAnonymous pages:                              558563.\nPages stored in compressor:                  1542370.\nPages occupied by compressor:                  69754.\nDecompressions:                           1114119492.\nCompressions:                             1419257052.\nPageins:                                  6807456431.\nPageouts:                                   10894754.\nSwapins:                                    42654122.\nSwapouts:                                   74262899.\nPages tagged:                                 151300.\nPages tagged resident:                        119985.\nPages tagged compressed:                       31315.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         1653.\nPages tag-storage non-tag pageable:            89844.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5559872.\nTagged compressions:                        10436978.\nTagged decompressions:                       9633035.\n"
  },
  "preflight_wait": {
    "seconds": 0.003058584000000003,
    "attempts": 1,
    "limit_seconds": 1800
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 174,
  "duration_seconds": 1.0597893330000001,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 36532420608,
    "swapins": 42654126,
    "swapouts": 74262899,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   140131.\nPages active:                                1018600.\nPages inactive:                              1574115.\nPages speculative:                             54032.\nPages throttled:                                   0.\nPages wired down:                             227287.\nPages purgeable:                                1909.\n\"Translation faults\":                    14385370221.\nPages copy-on-write:                       661223592.\nPages zero filled:                       17980688467.\nPages reactivated:                        3112497215.\nPages purged:                               66710655.\nFile-backed pages:                           2087722.\nAnonymous pages:                              559025.\nPages stored in compressor:                  1542323.\nPages occupied by compressor:                  69747.\nDecompressions:                           1114119539.\nCompressions:                             1419257052.\nPageins:                                  6807458277.\nPageouts:                                   10894754.\nSwapins:                                    42654126.\nSwapouts:                                   74262899.\nPages tagged:                                 151250.\nPages tagged resident:                        119936.\nPages tagged compressed:                       31314.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         1649.\nPages tag-storage non-tag pageable:            89848.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5559744.\nTagged compressions:                        10436978.\nTagged decompressions:                       9633036.\n"
  }
}

````

## .build/optimization/compute-islands-v107/stdout.txt

SHA256 `deb4bb292884bd70cb585014e08c5ff1ba373726232562cef423a6276e895bb4`; 7521 bytes.

````text
{
  "items" : [
    {
      "name" : "all finite BF16 gates, multiplier -128.0: exact bytes",
      "passed" : true
    },
    {
      "name" : "all finite BF16 gates, multiplier -2.0: exact bytes",
      "passed" : true
    },
    {
      "name" : "all finite BF16 gates, multiplier -0.0: exact bytes",
      "passed" : true
    },
    {
      "name" : "all finite BF16 gates, multiplier 0.0: exact bytes",
      "passed" : true
    },
    {
      "name" : "all finite BF16 gates, multiplier 0.5: exact bytes",
      "passed" : true
    },
    {
      "name" : "all finite BF16 gates, multiplier 1.0: exact bytes",
      "passed" : true
    },
    {
      "name" : "all finite BF16 gates, multiplier 128.0: exact bytes",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_1: exact projection slices",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_1: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_1: combined GLU exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_1: pointwise GLU alone exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_2: exact projection slices",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_2: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_2: combined GLU exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_2: pointwise GLU alone exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_8: exact projection slices",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_8: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_8: combined GLU exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_8: pointwise GLU alone exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_16: exact projection slices",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_16: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_16: combined GLU exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_16: pointwise GLU alone exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_32: exact projection slices",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_32: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_32: combined GLU exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_32: pointwise GLU alone exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_256: exact projection slices",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_256: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_256: combined GLU exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_256: pointwise GLU alone exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_257: exact projection slices",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_257: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_257: combined GLU exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_257: pointwise GLU alone exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_1024: exact projection slices",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_1024: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_1024: combined GLU exact",
      "passed" : true
    },
    {
      "name" : "shared-gate-up.rows_1024: pointwise GLU alone exact",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_1: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_1: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_2: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_2: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_8: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_8: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_16: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_16: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_32: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_32: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_256: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_256: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_257: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_257: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_1024: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-qkv-z.rows_1024: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_1: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_1: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_2: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_2: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_8: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_8: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_16: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_16: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_32: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_32: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_256: exact projection slices",
      "passed" : false
    },
    {
      "name" : "gdn-b-a.rows_256: noncontiguous input exact",
      "passed" : false
    },
    {
      "name" : "gdn-b-a.rows_257: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_257: noncontiguous input exact",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_1024: exact projection slices",
      "passed" : true
    },
    {
      "name" : "gdn-b-a.rows_1024: noncontiguous input exact",
      "passed" : true
    }
  ],
  "measurements" : {
    "gdn-b-a.duplicated_weight_bytes" : 491520,
    "gdn-b-a.output_columns" : 96,
    "gdn-b-a.quantized" : 0,
    "gdn-qkv-z.duplicated_weight_bytes" : 23592960,
    "gdn-qkv-z.output_columns" : 16384,
    "gdn-qkv-z.quantized" : 1,
    "shared-gate-up.duplicated_weight_bytes" : 1843200,
    "shared-gate-up.output_columns" : 1280,
    "shared-gate-up.quantized" : 1
  },
  "name" : "optimization-compute-islands",
  "passed" : false
}

````

## .build/optimization/compute-islands-v107/stderr.txt

SHA256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````text

````

## .build/optimization/compute-islands-v107/manifest.json

SHA256 `6cf7ad0d969c81dba76a49c678f8f86d9bdd700570483f8bd1d7094a1b00f876`; 20788 bytes.

````text
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compute-slot-components-build-v107/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
      "Sources/CSlotpack/include/slotpack.h": "c0377f2f6fdbae3a08eee0fa171f3e78ab298daabc0c0bd9455eebc84b27bf7f",
      "Sources/CSlotpack/slotpack.c": "3b85f78ae18d9add59b5369d282c69d0a402e40563d69bde2b7f30d7d52540f9",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CPUSlotWrite.swift": "786d9c407b38aa5e8a4ec2c44d39c331171468d6af0d647abf8055f7bf452eda",
      "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/DownloadHTTP.swift": "2cd8d7ed45b9909608bf2553005c6d99e5a914ba9576de8f45889c1fbb2c11bd",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "3d74c6dad941df731c7b8f1073623429242458767c29736a5fcb0f06de614057",
      "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertStore.swift": "8c8f1a5d0663cec3f6b547d05b65d23e38654841502117e42e3e89632a7c1190",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "672dba700ea763457136842ed31b9ade193b96ca001dc4b0723ed5b1d850a44b",
      "Sources/Slotstream/Governor.swift": "1051b77bc36d44645081687dcc3fadb7e0f7427e77dac1706f785fe6e6e8a9eb",
      "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
      "Sources/Slotstream/Layers.swift": "8d921313527a80924504caedb58dfc437d01e1d04c77245386b227ab88ef4798",
      "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
      "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "de1a2269724436d94c1c7f35769cd1beb6e6d63af9cb8c87438d7a03fbffdb76",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "Sources/Slotstream/Optimizations.swift": "79607924bdf14ee3fbb14bced6a8b884f92a8b45b9089211c25d286f89eaa585",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "4bd53ef9e3bd48687e95fc3e330c563dc0281bc1d754ca74f070dec952efe585",
      "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
      "Sources/Slotstream/PrefixCache.swift": "9bb9ad731a24e3fb84e15c92401d97f6677859553bfd15d23d541ae9be87bc01",
      "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "0746b27981132931d9773f5f43c2287a61772522a5272c9900139d2e1f185442",
      "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
      "Sources/Slotstream/SlotpackDownload.swift": "17b6000910dc694d7f3dc650e74b836ef5eeee54441138f8cf9d868189f9282d",
      "Sources/Slotstream/SlotpackManifest.swift": "1ed9df8e2d067bcbea985e78c80de57dfb51cf0718a8b32f11082ca9d66860b4",
      "Sources/Slotstream/StatePrefixFork.swift": "b21e2da892dfe6024de879c42c4ffe89dc19ad1b22a1b8fcbebeba17324e2fba",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
      "Sources/Slotstream/WeightDownload.swift": "c01c3ffcf272063d9a650c9e76597da267c552a1f06989e2738db253b20fbe16",
      "Sources/Slotstream/WeightStore.swift": "248d5923ba2b41d663868859557d14dd0187179acc8430faba94054a0835a1f0",
      "Sources/Slotstream/Weights.swift": "69a422597f7b28628a49c8b4a9d5f77ae670ff387c6b33610927bccf6352139f",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "9c95af798defad82647bc5a4f3ee25ef11f70e824a2ed6ff21bd63552c829d16",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "943a3d79b8e0b4a2ac086faf57a6ef1a850fffe957172312361e9405c2ede2de",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "34e74989d1f4fd2fcc9fd8cb9b0f1fc75c0e4e1c214751f44245f2543270ab09",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "083d9e609c0b3ec93feed540e25aaafb722521de9c0491cf2e4d2af66adf3b8b",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "3c9597f3661113dc10f274f3d59bca199dfbaa0d262741e31eb079dd225568c1",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
      "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "4c231bad7cceecf5f1ba866d5373a59f58e9107d6e6244dbf7742c31e72b59cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
      "Sources/SlotstreamTestKit/T0Checks.swift": "bfd462ebd02ea4258037ec568e6ba16362a8cd3970e4a3f9555b78d909093fc0",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "141be8cedbcdabc67df5e764cec5d416e89ba4fa24a7b5ce38e4486ca786372c",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "12aaa4753b91183020d840f1a81fd7431132c3f3434149a1ae50e09f8da856a3",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "96e65c3d51797e9a6aa2afd123b6a015ba4b5b71bbb1efe9be4be13a1c8a9127",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
      "Sources/slotstream-cli/main.swift": "34523f9b77217c875b810b75997b8239e9cb86c823f1e6edb86147adf8855a0b",
      "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "0eaa4df99c20824a8279d1e0f58ee260002b276c07a2f11885f2574d4daa0be2",
    "binary_sha256": "3c4a4ce4a30d18dbce54a53982a9ad2114ed7380eaf95d6093b1582f43895179",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 11.0,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/compute-slot-components-build-v107/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "compute-islands",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 36541906944,
    "swapins": 42654794,
    "swapouts": 74262899,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   127798.\nPages active:                                1023592.\nPages inactive:                              1585866.\nPages speculative:                             54281.\nPages throttled:                                   0.\nPages wired down:                             227107.\nPages purgeable:                                1925.\n\"Translation faults\":                    14385505153.\nPages copy-on-write:                       661243034.\nPages zero filled:                       17980733174.\nPages reactivated:                        3112497398.\nPages purged:                               66710669.\nFile-backed pages:                           2100618.\nAnonymous pages:                              563121.\nPages stored in compressor:                  1531641.\nPages occupied by compressor:                  65206.\nDecompressions:                           1114130153.\nCompressions:                             1419257052.\nPageins:                                  6807471191.\nPageouts:                                   10894754.\nSwapins:                                    42654794.\nSwapouts:                                   74262899.\nPages tagged:                                 151111.\nPages tagged resident:                        119900.\nPages tagged compressed:                       31211.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         1704.\nPages tag-storage non-tag pageable:            89793.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5542080.\nTagged compressions:                        10436978.\nTagged decompressions:                       9633138.\n"
  },
  "preflight_wait": {
    "seconds": 0.002778957999999998,
    "attempts": 1,
    "limit_seconds": 1800
  },
  "exit_code": 1,
  "result_key": "passed",
  "assertions": 71,
  "duration_seconds": 0.911765209,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 36628332544,
    "swapins": 42654794,
    "swapouts": 74262899,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   187691.\nPages active:                                1027371.\nPages inactive:                              1568388.\nPages speculative:                             13265.\nPages throttled:                                   0.\nPages wired down:                             227035.\nPages purgeable:                                1911.\n\"Translation faults\":                    14385679332.\nPages copy-on-write:                       661243682.\nPages zero filled:                       17980921185.\nPages reactivated:                        3112501701.\nPages purged:                               66710687.\nFile-backed pages:                           2046014.\nAnonymous pages:                              563010.\nPages stored in compressor:                  1531631.\nPages occupied by compressor:                  59452.\nDecompressions:                           1114130163.\nCompressions:                             1419257052.\nPageins:                                  6807471507.\nPageouts:                                   10894780.\nSwapins:                                    42654794.\nSwapouts:                                   74262899.\nPages tagged:                                 151142.\nPages tagged resident:                        119931.\nPages tagged compressed:                       31211.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         2221.\nPages tag-storage non-tag pageable:            89276.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5542080.\nTagged compressions:                        10436978.\nTagged decompressions:                       9633138.\n"
  }
}

````

## .build/optimization/integrated-mtp-v107/stdout.txt

SHA256 `bee62159d563188f889c2511e1e926aff825782c361b70c5c56019564e32dfed`; 18063 bytes.

````text
{
  "items" : [
    {
      "name" : "false: embedding selection",
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
      "name" : "false\/cached17: full completion succeeds",
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
      "name" : "false\/boundary255: full completion succeeds",
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
      "name" : "false\/boundary256: full completion succeeds",
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
      "name" : "false\/boundary257: full completion succeeds",
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
      "name" : "false\/long1025: full completion succeeds",
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
      "name" : "false\/image-before: full completion succeeds",
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
      "name" : "false\/image-crossing: full completion succeeds",
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
      "name" : "false\/sample\/false\/7: sampled output completes",
      "passed" : true
    },
    {
      "name" : "false\/sample\/false\/7: seeded replay exact",
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
      "name" : "false\/sample\/true\/7: sampled output completes",
      "passed" : true
    },
    {
      "name" : "false\/sample\/true\/7: seeded replay exact",
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
      "name" : "false\/same: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false: deliberate checkpoint is exercised",
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
      "name" : "false\/auxiliary: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false\/auxiliary: no invalid checkpoint published",
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
      "name" : "false\/same-after-auxiliary: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "false\/same-after-auxiliary: no invalid checkpoint published",
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
      "name" : "false: retry after cancellation is exact",
      "passed" : true
    },
    {
      "name" : "false: prefix capacity stays bounded",
      "passed" : true
    },
    {
      "name" : "true: embedding selection",
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
      "name" : "true\/cached17: full completion succeeds",
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
      "name" : "true\/boundary255: full completion succeeds",
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
      "name" : "true\/boundary256: full completion succeeds",
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
      "name" : "true\/boundary257: full completion succeeds",
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
      "name" : "true\/long1025: full completion succeeds",
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
      "name" : "true\/image-before: full completion succeeds",
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
      "name" : "true\/image-crossing: full completion succeeds",
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
      "name" : "true\/same: reusable-cache request succeeds",
      "passed" : true
    },
    {
      "name" : "true: deliberate checkpoint is exercised",
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
      "name" : "true: retry after cancellation is exact",
      "passed" : true
    },
    {
      "name" : "true: prefix capacity stays bounded",
      "passed" : true
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-integrated-mtp",
  "passed" : true
}

````

## .build/optimization/integrated-mtp-v107/stderr.txt

SHA256 `ce2c7f4456b046563d723c574838fb812a7bd4208cb40374b4e6cd30237d4ff6`; 486 bytes.

````text
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

````

## .build/optimization/integrated-mtp-v107/manifest.json

SHA256 `f680d48d68082d356c1728419906bad52d17f5bf5a6518708bd378579537f045`; 20790 bytes.

````text
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/compute-slot-components-build-v107/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "8e2faec45c5aa764014d61b5cc04dee63640660322ad3e943084d5cb6dee4f87",
      "Sources/CSlotpack/include/slotpack.h": "c0377f2f6fdbae3a08eee0fa171f3e78ab298daabc0c0bd9455eebc84b27bf7f",
      "Sources/CSlotpack/slotpack.c": "3b85f78ae18d9add59b5369d282c69d0a402e40563d69bde2b7f30d7d52540f9",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CPUSlotWrite.swift": "786d9c407b38aa5e8a4ec2c44d39c331171468d6af0d647abf8055f7bf452eda",
      "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
      "Sources/Slotstream/DownloadConcurrency.swift": "cf872e6e99b9e1df121a9feba4c0c8420719fe62a5f5a50e58b26bf11cb8126e",
      "Sources/Slotstream/DownloadHTTP.swift": "2cd8d7ed45b9909608bf2553005c6d99e5a914ba9576de8f45889c1fbb2c11bd",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "3d74c6dad941df731c7b8f1073623429242458767c29736a5fcb0f06de614057",
      "Sources/Slotstream/Errors.swift": "0f65317656d38709f071fb58cb4c11f11f68f0949be02a781c675f37f76f5b57",
      "Sources/Slotstream/ExactRead.swift": "bd90fbeb1d400cb7dda746d434a5c4f1fbb4d767506013e4398de9ba1253a47e",
      "Sources/Slotstream/ExpertStore.swift": "8c8f1a5d0663cec3f6b547d05b65d23e38654841502117e42e3e89632a7c1190",
      "Sources/Slotstream/ExpertTransferProfile.swift": "17fe476f01b03d3a151506d324d9ad0d83d8dcf152489c9e88805ddea2b302ad",
      "Sources/Slotstream/GDNPhaseProfile.swift": "f74d843773b549530cebe9e5df79a02b0104068e05c39ff6adfcbae3effaef66",
      "Sources/Slotstream/GatewayDialect.swift": "93561b74b171c78d107dca5985a1c0601f7ca0ce4388f0a3aa03e9bd0c6bd0c8",
      "Sources/Slotstream/Generate.swift": "672dba700ea763457136842ed31b9ade193b96ca001dc4b0723ed5b1d850a44b",
      "Sources/Slotstream/Governor.swift": "1051b77bc36d44645081687dcc3fadb7e0f7427e77dac1706f785fe6e6e8a9eb",
      "Sources/Slotstream/LayerLocalVictim.swift": "9615385e6c2ac18573f4d2089a75a70d356d803c0c4a603b4db3397fafa6275c",
      "Sources/Slotstream/Layers.swift": "8d921313527a80924504caedb58dfc437d01e1d04c77245386b227ab88ef4798",
      "Sources/Slotstream/MTP.swift": "edd961941b4a96b00fb7e417187ee9a291d92a73348e17dab2d3fcd150131189",
      "Sources/Slotstream/Machine.swift": "ffed1d45e029e21e42e1eb956d1b3f2647aae2bca689f532b5dc2dba897c89ee",
      "Sources/Slotstream/MemTrace.swift": "756d8032ad7558c84eb571c69e3d4773ff105eb0ab78790662aa637e4d0e19d6",
      "Sources/Slotstream/Model.swift": "de1a2269724436d94c1c7f35769cd1beb6e6d63af9cb8c87438d7a03fbffdb76",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "Sources/Slotstream/Optimizations.swift": "79607924bdf14ee3fbb14bced6a8b884f92a8b45b9089211c25d286f89eaa585",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/PinnedTransport.swift": "4bd53ef9e3bd48687e95fc3e330c563dc0281bc1d754ca74f070dec952efe585",
      "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
      "Sources/Slotstream/PrefixCache.swift": "9bb9ad731a24e3fb84e15c92401d97f6677859553bfd15d23d541ae9be87bc01",
      "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "0746b27981132931d9773f5f43c2287a61772522a5272c9900139d2e1f185442",
      "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
      "Sources/Slotstream/SlotpackDownload.swift": "17b6000910dc694d7f3dc650e74b836ef5eeee54441138f8cf9d868189f9282d",
      "Sources/Slotstream/SlotpackManifest.swift": "1ed9df8e2d067bcbea985e78c80de57dfb51cf0718a8b32f11082ca9d66860b4",
      "Sources/Slotstream/StatePrefixFork.swift": "b21e2da892dfe6024de879c42c4ffe89dc19ad1b22a1b8fcbebeba17324e2fba",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
      "Sources/Slotstream/WeightDownload.swift": "c01c3ffcf272063d9a650c9e76597da267c552a1f06989e2738db253b20fbe16",
      "Sources/Slotstream/WeightStore.swift": "248d5923ba2b41d663868859557d14dd0187179acc8430faba94054a0835a1f0",
      "Sources/Slotstream/Weights.swift": "69a422597f7b28628a49c8b4a9d5f77ae670ff387c6b33610927bccf6352139f",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+ComputeIslands.swift": "9c95af798defad82647bc5a4f3ee25ef11f70e824a2ed6ff21bd63552c829d16",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "943a3d79b8e0b4a2ac086faf57a6ef1a850fffe957172312361e9405c2ede2de",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "e39951dc83e8410abdc840d0a739e1e1b2fbbdf1e2d06b3cb2d28c39ee9329cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+OutputServing.swift": "50bb807143f1e5134f52a6f3d48b8da297f4186dd91895e016d191ca13ccf66a",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "34e74989d1f4fd2fcc9fd8cb9b0f1fc75c0e4e1c214751f44245f2543270ab09",
      "Sources/SlotstreamDiagnostics/Diagnostics+Pull.swift": "8dc0b5b742a379ef4706b66dc1fb745c1e88c4fad3b0621330431959604654c9",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadFailureServing.swift": "083d9e609c0b3ec93feed540e25aaafb722521de9c0491cf2e4d2af66adf3b8b",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadHandles.swift": "9e98b6e0fd6c30f36d1d3ec8d556216f351a2f09ee5d15dbb4f5580858fad4b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+ReadRecovery.swift": "3c9597f3661113dc10f274f3d59bca199dfbaa0d262741e31eb079dd225568c1",
      "Sources/SlotstreamDiagnostics/Diagnostics+RouterProjection.swift": "3981e415003e6258d41690216a7ab668652a0ce436bf644d99d88dbc2799db9e",
      "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "3a3ba8a870fa05a59466d974dd7235d4342b475f9ab4a3ddd56b7958342a0668",
      "Sources/SlotstreamDiagnostics/Diagnostics+RuntimeBudget.swift": "b5ce492456b9e27b19765a0bd4f23cbd81ccff034be5af3142737cdae7944d6e",
      "Sources/SlotstreamDiagnostics/Diagnostics+SamplerPerformance.swift": "4e6dd7e85d7ac0f2b2af291343ab4cdc52fa94fe6edb588c1d517008a0c35cb3",
      "Sources/SlotstreamDiagnostics/Diagnostics+SelectedAttention.swift": "8dd385da9b79c3625d1cc9ccc6c8821978f88437fcded918f049328b7a969e7a",
      "Sources/SlotstreamDiagnostics/Diagnostics+Selection.swift": "b737794c5a57cd224f36a93b960fa9834cabb51ef810945bab64fd71e59c91d0",
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "4c231bad7cceecf5f1ba866d5373a59f58e9107d6e6244dbf7742c31e72b59cb",
      "Sources/SlotstreamDiagnostics/Diagnostics+TerminalPrefill.swift": "2587e2ab8ce6e16765ca2f4e530691090000e9b419748c002488bb68f4753ec2",
      "Sources/SlotstreamDiagnostics/Diagnostics+Vision.swift": "6f7dbb0382d6b1ab1b8d84e8a783bc3fbacd2c0eaf6a74a82d39a124f36b33ea",
      "Sources/SlotstreamDiagnostics/Diagnostics+VisionAttention.swift": "66ddb233e4e1754d9b499e3bde590c073d32e47512ca7db79269aa9d25d40718",
      "Sources/SlotstreamDiagnostics/Diagnostics.swift": "f00ad4728ce530169d29dfb223a827175e9e1ee21b440142d08f8f44baadecd2",
      "Sources/SlotstreamDiagnostics/Goldens.swift": "aeb98c73b02c2e4f27baefee935fa4e7e67254da686e79ed96ffbdc26ca3c958",
      "Sources/SlotstreamTestKit/Catalogue.swift": "bdfef7fffc2bbd801fc1880f9d9134783134a0e36e2424c3eb419b2767fe62a7",
      "Sources/SlotstreamTestKit/GatewayChecks.swift": "da4b4a89d9b11d26a64cd244aae2887acfbca16a6d3aceefa8f40f90c8e39634",
      "Sources/SlotstreamTestKit/OpenAIChecks.swift": "744c5f3b32f22c9ab300cfc6ea766f7c557774a2372464272bda6041384c31cc",
      "Sources/SlotstreamTestKit/T0Checks.swift": "bfd462ebd02ea4258037ec568e6ba16362a8cd3970e4a3f9555b78d909093fc0",
      "Sources/SlotstreamTestKit/ToolCallChecks.swift": "f1b263239f4e82707c77a5887367fb5302e96d369f2f278e0e45a87d3006dad8",
      "Sources/slotstream-checks/main.swift": "02ebabaf058afa95622ccd29fb65d80b7eac41c9e6232f0167ef288c2126e0d9",
      "Sources/slotstream-cli/CheckRendering.swift": "0905dcbae17a5b3d66e13a760c4054fb29d930331d32942a528510ecfe9769a1",
      "Sources/slotstream-cli/ContextCommands.swift": "141be8cedbcdabc67df5e764cec5d416e89ba4fa24a7b5ce38e4486ca786372c",
      "Sources/slotstream-cli/MTPCommands.swift": "bf5bd34913e71526532dfd3c4462de0bb755af2dd8ee460d6db0cf3b449648a1",
      "Sources/slotstream-cli/OptimizationCommands.swift": "12aaa4753b91183020d840f1a81fd7431132c3f3434149a1ae50e09f8da856a3",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "96e65c3d51797e9a6aa2afd123b6a015ba4b5b71bbb1efe9be4be13a1c8a9127",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
      "Sources/slotstream-cli/main.swift": "34523f9b77217c875b810b75997b8239e9cb86c823f1e6edb86147adf8855a0b",
      "Tools/build_identity.py": "d70a97380b1244727674861ae64ab166d034c941878e6e2c18f3ffd77bbf2e86",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "0eaa4df99c20824a8279d1e0f58ee260002b276c07a2f11885f2574d4daa0be2",
    "binary_sha256": "3c4a4ce4a30d18dbce54a53982a9ad2114ed7380eaf95d6093b1582f43895179",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 16.0,
  "timeout_seconds": 900,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/compute-slot-components-build-v107/candidate/slotstream",
    "optimization-state-check",
    "--variant",
    "integrated-mtp",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 36348854272,
    "swapins": 42656167,
    "swapouts": 74262899,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   154952.\nPages active:                                1048177.\nPages inactive:                              1577863.\nPages speculative:                             16689.\nPages throttled:                                   0.\nPages wired down:                             227127.\nPages purgeable:                                4936.\n\"Translation faults\":                    14385873689.\nPages copy-on-write:                       661270249.\nPages zero filled:                       17981004258.\nPages reactivated:                        3112501713.\nPages purged:                               66710845.\nFile-backed pages:                           2058670.\nAnonymous pages:                              584059.\nPages stored in compressor:                  1527768.\nPages occupied by compressor:                  60262.\nDecompressions:                           1114134026.\nCompressions:                             1419257052.\nPageins:                                  6807482488.\nPageouts:                                   10894780.\nSwapins:                                    42656167.\nSwapouts:                                   74262899.\nPages tagged:                                 151077.\nPages tagged resident:                        120514.\nPages tagged compressed:                       30563.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                          628.\nPages tag-storage non-tag pageable:            90869.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    5414528.\nTagged compressions:                        10436978.\nTagged decompressions:                       9633786.\n"
  },
  "preflight_wait": {
    "seconds": 0.0028168749999999965,
    "attempts": 1,
    "limit_seconds": 1800
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 181,
  "duration_seconds": 269.019660208,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 38328238080,
    "swapins": 42680862,
    "swapouts": 74277638,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   529955.\nPages active:                                1050133.\nPages inactive:                               908793.\nPages speculative:                            140206.\nPages throttled:                                   0.\nPages wired down:                             228229.\nPages purgeable:                                3310.\n\"Translation faults\":                    14390067442.\nPages copy-on-write:                       661368630.\nPages zero filled:                       18025539281.\nPages reactivated:                        3115253221.\nPages purged:                               66801831.\nFile-backed pages:                           1806105.\nAnonymous pages:                              293027.\nPages stored in compressor:                  1796949.\nPages occupied by compressor:                 221977.\nDecompressions:                           1117466655.\nCompressions:                             1423188983.\nPageins:                                  6809865421.\nPageouts:                                   10899923.\nSwapins:                                    42680862.\nSwapouts:                                   74277638.\nPages tagged:                                 151351.\nPages tagged resident:                        116020.\nPages tagged compressed:                       35331.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6799.\nPages tag-storage free:                         6017.\nPages tag-storage non-tag pageable:            85480.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    6430720.\nTagged compressions:                        10455932.\nTagged decompressions:                       9646762.\n"
  }
}

````

## .build/optimization/serving-harness-tests-v108.txt

SHA256 `5507d26b3a3a26fb8df77c90fdb555edc4ce3cb3dc1f4ee98bbaf4e5c9c56b48`; 3016 bytes.

````text
test_all_hit_label_requires_zero_prefill_and_decode_reads (prefill_bench_test.HarnessTests) ... ok
test_comparison_excludes_whole_pair (prefill_bench_test.HarnessTests) ... ok
test_cooldown_is_explicit_bounded_and_finite (prefill_bench_test.HarnessTests) ... ok
test_cross_build_identity_checks_the_selected_executable (prefill_bench_test.HarnessTests) ... ok
test_declared_cooldown_holds_and_releases_the_model_reservation (prefill_bench_test.HarnessTests) ... ok
test_declared_resource_limits_fail_closed (prefill_bench_test.HarnessTests) ... ok
test_explicit_frozen_binary_digest_cannot_silently_change (prefill_bench_test.HarnessTests) ... ok
test_frozen_acceptance_rejects_insufficient_or_unequal_work (prefill_bench_test.HarnessTests) ... ok
test_interrupted_serving_cell_stops_child_and_preserves_incomplete_result (prefill_bench_test.HarnessTests) ... ok
test_large_pool_measurements_require_explicit_bounds_and_six_gb_headroom (prefill_bench_test.HarnessTests) ... ok
test_large_scope_study_keeps_explicit_memory_compute_and_abort_bounds (prefill_bench_test.HarnessTests) ... ok
test_long_context_gate_requires_completion_and_exact_observed_work (prefill_bench_test.HarnessTests) ... ok
test_memory_gate_includes_first_image_preparation (prefill_bench_test.HarnessTests) ... ok
test_memory_gate_uses_bytes_and_rejects_missing_samples_or_swap (prefill_bench_test.HarnessTests) ... ok
test_memory_settling_waits_only_for_verified_headroom_and_has_a_deadline (prefill_bench_test.HarnessTests) ... ok
test_metrics_fail_closed (prefill_bench_test.HarnessTests) ... ok
test_missing_memory_fields_fail_closed (prefill_bench_test.HarnessTests) ... ok
test_non_regression_is_separate_from_existing_gain_contracts (prefill_bench_test.HarnessTests) ... ok
test_prefix_study_requires_observed_committed_fork_and_exact_workload (prefill_bench_test.HarnessTests) ... ok
test_prospective_work_constraints_refuse_inactive_or_missing_mechanisms (prefill_bench_test.HarnessTests) ... ok
test_reclaimable_uses_real_page_size_and_file_backed (prefill_bench_test.HarnessTests) ... ok
test_resource_acceptance_requires_real_active_savings_in_every_clean_pair (prefill_bench_test.HarnessTests) ... ok
test_resource_savings_require_real_measurements_in_every_valid_pair (prefill_bench_test.HarnessTests) ... ok
test_sampled_serving_freezes_typed_shared_parameters (prefill_bench_test.HarnessTests) ... ok
test_serving_arm_schema_refuses_delivery_errors_before_launch (prefill_bench_test.HarnessTests) ... ok
test_serving_summary_keeps_client_and_generator_metrics_separate (prefill_bench_test.HarnessTests) ... ok
test_serving_workload_uses_explicit_template_and_seed (prefill_bench_test.HarnessTests) ... ok
test_startup_amortization_preserves_first_job_and_pair_exclusions (prefill_bench_test.HarnessTests) ... ok
test_startup_amortization_requires_finite_complete_measurements_and_saving (prefill_bench_test.HarnessTests) ... ok

----------------------------------------------------------------------
Ran 29 tests in 0.013s

OK

````

## Tools/serve_bench.py

SHA256 `340d277d86ef9c13219b26adaa7eaa65fdfd4e8456852452953dfacecd4f20d0`; 38577 bytes.

````text
#!/usr/bin/env python3
"""Bounded paired requests after warming a real local serving process.

Startup/warmup are preserved separately. Every measured client interval and
server generator interval must have unchanged global swap counters.
"""
import argparse
import fcntl
import hashlib
import http.client
import json
import math
import os
from pathlib import Path
import shutil
import signal
import socket
import statistics
import subprocess
import time
from prefill_bench import ROOT, digest, host_conditions, model_identity, preflight, validate_metrics, vm_snapshot, InsufficientHeadroom


def measurement_memory(protocol):
    """Routine gates stay small. A separately declared large-pool experiment
    gets stricter headroom and immediate resource-stop requirements."""
    memory = protocol['memory_gb']
    if type(memory) not in (int, float) or not math.isfinite(memory) or not 8.1 <= memory <= 24:
        raise ValueError('memory target must be finite and between 8.1 and 24 GB')
    if memory <= 10:
        if 'large_pool_measurement' in protocol or 'large_scope_measurement' in protocol:
            raise ValueError('large-memory declaration requires a target above 10 GB')
        return memory + 3
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
    if type(study) is not dict or set(study) != {'expected_reused_tokens'}:
        raise ValueError('prefix_cache requires an explicit expected_reused_tokens map')
    expected = study['expected_reused_tokens']
    if type(expected) is not dict or set(expected) != set(protocol['arms']):
        raise ValueError('prefix reuse expectations must cover exactly every arm')
    if any(type(n) is not int or not 0 <= n <= 4096 for n in expected.values()):
        raise ValueError('prefix reuse expectations must be integer counts from zero to 4096')
    if expected['reference'] != 0 or not any(expected.values()):
        raise ValueError('prefix study requires zero reference reuse and a positive candidate')
    return expected


def work_constraints(protocol):
    constraints = protocol.get('work_constraints')
    if constraints is None: return None
    allowed = {'prefillSlotCPUBatches', 'decodeSlotCPUBatches', 'decodeModelTokens',
               'decodeForwardPasses', 'prefillTokens', 'decodeTokens', 'verifyPasses',
               'draftedTokens', 'prefillRecords', 'decodeRecords'}
    if type(constraints) is not dict or set(constraints) != set(protocol['arms']):
        raise ValueError('work constraints must cover exactly every arm')
    for counters in constraints.values():
        if type(counters) is not dict or not counters or not set(counters) <= allowed:
            raise ValueError('unknown or empty work constraint counters')
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


def validate_prefix_observation(expected, name, warm, measured):
    want = expected[name] if expected is not None else 0
    stats = measured['stats']
    if stats.get('reusedPrefixTokens') != want:
        raise ValueError('observed prefix reuse differs from the frozen workload')
    if expected is None: return
    if warm['stats'].get('reusedPrefixTokens') != 0:
        raise ValueError('fresh-server warmup unexpectedly reused state')
    if len(measured['prompt_ids']) <= want or warm['prompt_ids'][:want] != measured['prompt_ids'][:want]:
        raise ValueError('warmup did not create the measured strict prefix')
    if stats.get('prefixCheckpointForks') != int(want > 0):
        raise ValueError('measured request did not use the declared checkpoint fork')
    if warm['stats'].get('prefixCheckpointStores') != int(want > 0):
        raise ValueError('warmup did not create the declared checkpoint')
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


def request_body(protocol, prompt):
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
    return reasons


def exchange(port, body, timeout):
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
    validate_metrics(details)
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


def summaries(rows, reference, comparison_basis='fixed-pool', required_equal_work=None):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
    fields = [] if required_equal_work is None else required_equal_work
    allowed = {'prefillRecords', 'decodeRecords', 'prefillTokens', 'decodeTokens',
               'decodeForwardPasses', 'decodeModelTokens', 'draftedTokens', 'verifyPasses'}
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
            apeak = (am['stats'].get('sampledFootprint') or {}).get('peakBytes')
            bpeak = (bm['stats'].get('sampledFootprint') or {}).get('peakBytes')
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


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--protocol',type=Path,required=True)
    parser.add_argument('--out',type=Path,required=True)
    a=parser.parse_args(); protocol=json.loads(a.protocol.read_text())
    validate_arms(protocol.get('arms'))
    expected_prefix = prefix_study(protocol)
    expected_work = work_constraints(protocol)
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
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
    body=request_body(protocol, fixture.read_text())
    (a.out/'request.json').write_bytes(body)
    rows=[]; clean_env={k:v for k,v in os.environ.items() if not k.startswith(('SLOTSTREAM_','SS_DEBUG'))}
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
                row['cooldown_seconds'] = cooldown
                if cooldown:
                    print(json.dumps({'round':number,'arm':name,'phase':'before-cell cooldown','seconds':cooldown}),flush=True)
                row['cooldown_reservation'] = reserved_cooldown(cooldown,reservation_wait)
                try:
                    row['before_startup'], row['headroom_settle'] = wait_for_headroom(required_memory+extra, settle_seconds)
                except Exception:
                    if abort_on_resource_failure: stop_requested = True
                    raise
                with socket.socket() as reservation:
                    reservation.bind(('127.0.0.1',0)); port=reservation.getsockname()[1]
                command=[arm_builds[name]['binary'],'serve','--port',str(port),'--model',str(model),'--memory-gb',str(protocol['memory_gb']),
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
                    warm,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    row['first_request']={k:warm['metrics'][k] for k in ['prompt_ids','output_ids','effective_pool_slots','effective_mtp']}
                    row['first_request'].update(text=warm['text'],complete_seconds_from_launch=time.monotonic()-launched_at)
                    row['after_warmup_vm']=vm_snapshot()
                    row['startup_and_warmup_valid']=not resource_exclusions(warm['metrics']['stats'],protocol) and (
                        warm['metrics']['stats']['decodeTokens'] >= protocol.get('minimum_output_tokens',0)) and all(
                        row['before_startup'][key]==row['after_warmup_vm'][key] for key in ['swapins','swapouts'])
                    (cell/'warmup.ndjson').write_bytes(wire)
                    (cell/'warmup.json').write_text(json.dumps(warm,indent=2)+'\n')
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
                    measured,wire=exchange(port,body,protocol.get('timeout_seconds',600))
                    row['after']=vm_snapshot()
                    row['host_after']=host_conditions()
                    (cell/'response.ndjson').write_bytes(wire)
                    row.update(measured)
                    m=row['metrics']; s=m['stats']
                    if m['effective_prefill_chunk']!=arm['chunk'] or m['effective_mtp']!=(protocol.get('mtp','off')=='on'):
                        raise ValueError('effective configuration differs')
                    validate_prefix_observation(expected_prefix, name, warm['metrics'], m)
                    validate_work_observation(expected_work, name, s)
                    if s['decodeTokens'] < protocol.get('minimum_output_tokens', 0):
                        raise ValueError('output shorter than declared workload')
                    before,after=s.get('generatorVMBefore'),s.get('generatorVMAfter')
                    if before is None or after is None: raise ValueError('request VM interval missing')
                    changed=any(row['before'][k]!=row['after'][k] or before[k]!=after[k] for k in ['swapins','swapouts'])
                    exclusions = resource_exclusions(s, protocol)
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
    (a.out/'completion.json').write_text(json.dumps({'interrupted': interrupted,
        'stopped_early': stop_requested, 'planned_cells': protocol['rounds'] * len(arms),
        'recorded_cells': len(rows), 'acceptance': assessment}, indent=2)+'\n')
    if interrupted: return 130
    if stop_requested or (assessment is not None and not all(r['passed'] for r in assessment)): return 1
    return 0 if all(r['valid'] for r in rows) else 1


if __name__=='__main__': raise SystemExit(main())

````

## Tools/prefill_bench_test.py

SHA256 `7c02c4d4a2104411a9f181c65f06b99ab4f564c3295774c7c936dec520d60d37`; 33881 bytes.

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

## Complete V107 source archive

SHA256 `0eaa4df99c20824a8279d1e0f58ee260002b276c07a2f11885f2574d4daa0be2`; 415451 bytes.

````base64
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
````
