---
type: run
id: 01m1t06d7v07spat1k2s5evkry
created: 2026-09-05T23:59:22.363203+00:00
updated: 2026-09-05T23:59:48.173746+00:00
summary: Checked embedding row runtime integration V96 V97
binary: .build/optimization/embedding-runtime-build-v97/candidate/slotstream
captured_at: 2026-09-05
command: Tools/optimization_check.py; embedding rows, runtime, MTP and TCP variants
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Checked embedding row runtime integration V96 V97
tool: Frozen native model and row diagnostics
---
# Checked embedding row runtime integration V96/V97

The bounded packed input-embedding cache is now an optional full-runtime path under SLOTSTREAM_EMBEDDING_ROWS=1. Default remains 0. ResidentWeights preserves its complete public tensor dictionary and its original initializer/embed signatures; lookup tensors remain lazy in row mode, while explicit tensor access can materialize their exact original bytes. Main and draft generation use checked embedding calls and propagate I/O failures through the existing request recovery path. CPU-owned token IDs enter the row reader directly, avoiding an upload/cast/readback. Public MLX-array callers reject invalid integer ranges before narrowing; large lookups are split only for independent row/dequantization work. Main checked forwards reject empty/out-of-vocabulary IDs before state mutation. Checked draft consumption validates nonempty aligned chunks. GenStats exposes mode, completed unique row hits/misses and bounded cache payload per request. No planner credit or production default activation is made.

V97 passes 527 assertions: the packed-row component passes 147, the full-model plain runtime comparison passes 172, and MTP passes 208. Each full-model arm is released before the next is constructed; only strings, scalar observations and token IDs survive between arms. All represented committed state bytes and continued logits match for 17/256/273/1025-token text cases and real images wholly before/crossing a 256-token boundary. Complete greedy outputs and executed expert work match. MTP verification, main-to-draft row reuse, reusable prefix interaction, failed first/second prefill and decode reads, exact retries, invalid public inputs, a 4097-position public lookup and explicit original-table tensor access pass. Direct draft prefill also propagates a checked row fault without mutating its state, then restores alignment on retry.

The plain load snapshots are 4,704,045,212 versus 4,346,448,028 MLX active bytes, and 4,786,785,112 versus 4,455,435,288 physical bytes. With MTP they are 6,175,340,188 versus 5,817,743,004 active bytes, and 6,258,757,496 versus 5,928,718,320 physical bytes. These are correctness-diagnostic load endpoints, not sampled serving peaks, cold-I/O timings, a latency qualification or an earned cache-capacity increase. The later public-tensor test intentionally materializes the full table. The separately prospective serving protocol requires every clean pair to save at least 300 MB active and 200 MB sampled physical peak, a maximum 5% median latency regression, at least five clean pairs from seven with no replacements, exact output and an 8.1 GB fixed-pool/total-memory budget. It is unrun at this capture.

V96 first refuses before make because another task owns the model lock. A bounded waiting build then runs once after release but fails compilation because the new diagnostic attempts to construct GenStats with its internal zero-argument initializer. No candidate is frozen. The diagnostic separates request outcomes from table digests instead, and V97 builds successfully. The build driver now supports a bounded reservation wait and passes five host-only guard tests; the serving harness passes 28 host-only tests including strict prospective binary hash and per-pair memory-saving gates. Those totals are contextual host-test results; native execution is not inferred from them.

The first real loopback TCP output diagnostic is also preserved: 36 of 38 assertions pass, including bounded storage, backpressure, timed drain, byte order and descriptor restoration. Two disconnect assertions fail because closing the peer normally establishes a FIN, and a subsequent local write can still be accepted. This test did not first establish an observable reset. The working successor uses abortive close plus observed ECONNRESET before checking failed writes, and checks the failure latch rather than the trivially closed writer flag. That successor is not in V97 and is not yet tested here. The failure is not silently converted into a runtime fix or a green TCP gate. Whole-program integration, the new serving resource gate, the larger-scope feasibility study and OPT32/33 remain pending.

## .build/optimization/embedding-runtime-build-v96/manifest.json

SHA-256 `d9db8b0a0388b369d8de7140805b12896579abefbe1b16f0663e09dfcbf69848`; 2433 bytes.

````
{
  "classification": "build only; no runtime performance evidence",
  "required_reclaimable_gb": 13,
  "model_lock_held_during_build": false,
  "passed": false,
  "command": [
    "make",
    "build"
  ],
  "working_directory": "/Users/carlos/Projects/slotstream",
  "error": "RuntimeError: another model/build holds the model-process lock; make was not invoked",
  "elapsed_seconds": 4.024999999999862e-05,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 23557652480,
    "swapins": 41724047,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                    24371.\nPages active:                                 887451.\nPages inactive:                              1308949.\nPages speculative:                             25206.\nPages throttled:                                   0.\nPages wired down:                             228703.\nPages purgeable:                                3670.\n\"Translation faults\":                    14162792153.\nPages copy-on-write:                       649961364.\nPages zero filled:                       17370675538.\nPages reactivated:                        2784898430.\nPages purged:                               64762121.\nFile-backed pages:                           1409804.\nAnonymous pages:                              811802.\nPages stored in compressor:                  1715838.\nPages occupied by compressor:                 610409.\nDecompressions:                            995107924.\nCompressions:                             1291610457.\nPageins:                                  6445072009.\nPageouts:                                   10779193.\nSwapins:                                    41724047.\nSwapouts:                                   69922789.\nPages tagged:                                 175053.\nPages tagged resident:                        121872.\nPages tagged compressed:                       53181.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6828.\nPages tag-storage free:                          211.\nPages tag-storage non-tag pageable:            91257.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8800576.\nTagged compressions:                         9862602.\nTagged decompressions:                       9080222.\n"
  }
}

````

## .build/optimization/embedding-runtime-build-v96-retry1/build.txt

SHA-256 `b8321de08866d1e19170131c4abf1d4d7b5e7dbe098f84d323d1347fcc2280f5`; 5038 bytes.

````
python3 Tools/build_identity.py before .build/release
swift build -c release
[0/2] Write swift-version--1AB21518FC5DEDBE.txt
[0/1] Planning build
[1/1] Compiling plugin GenerateManual
[2/2] Compiling plugin GenerateDoccReference
[3/3] Compiling plugin CudaBuild
Building for production...
[3/12] Write swift-version--1AB21518FC5DEDBE.txt
[4/12] Write sources
[9/13] Compiling Slotstream AdaptiveSpeculation.swift
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
[10/14] Compiling SlotstreamDiagnostics CheckReport.swift
/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift:192:96: error: missing argument for parameter 'from' in call
190 |             let table = EmbeddingRows.names.map { model.resident.tensor($0) }
191 |             let tableFields = Dictionary(uniqueKeysWithValues: zip(EmbeddingRows.names, table.map(hash)))
192 |             results["public-table"] = Outcome(fields: tableFields, output: [], stats: GenStats())
    |                                                                                                `- error: missing argument for parameter 'from' in call
193 |             if let reference = expected?["public-table"] {
194 |                 c.equal("public tensor access preserves all table bytes", tableFields, reference.fields)

Slotstream.GenStats.init:2:8: note: 'init(from:)' declared here
1 | struct GenStats {
2 | public init(from decoder: any Decoder) throws}
  |        `- note: 'init(from:)' declared here
3 | 

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

## .build/optimization/embedding-runtime-build-v96-retry1/manifest.json

SHA-256 `413ea291b92b9e1674265945fc728f0fb8184345973ee84a4cffbfe82b22d11e`; 4570 bytes.

````
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
    "seconds": 737.9833413749999,
    "attempts": 369
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 29148168192,
    "swapins": 41724063,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   513209.\nPages active:                                 855391.\nPages inactive:                               657193.\nPages speculative:                            196446.\nPages throttled:                                   0.\nPages wired down:                             223235.\nPages purgeable:                                1700.\n\"Translation faults\":                    14168073308.\nPages copy-on-write:                       650524273.\nPages zero filled:                       17394135242.\nPages reactivated:                        2821527395.\nPages purged:                               64874370.\nFile-backed pages:                           1264154.\nAnonymous pages:                              444876.\nPages stored in compressor:                  1747791.\nPages occupied by compressor:                 635341.\nDecompressions:                            996663434.\nCompressions:                             1293282601.\nPageins:                                  6480660672.\nPageouts:                                   10782572.\nSwapins:                                    41724063.\nSwapouts:                                   69922789.\nPages tagged:                                 169028.\nPages tagged resident:                        115416.\nPages tagged compressed:                       53612.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6828.\nPages tag-storage free:                         4626.\nPages tag-storage non-tag pageable:            86842.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8901760.\nTagged compressions:                         9880514.\nTagged decompressions:                       9096388.\n"
  },
  "exit_code": 2,
  "error": "RuntimeError: make failed with exit code 2; no candidate frozen",
  "elapsed_seconds": 765.611615541,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 28346531840,
    "swapins": 41724063,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   401496.\nPages active:                                 919504.\nPages inactive:                               703468.\nPages speculative:                            216179.\nPages throttled:                                   0.\nPages wired down:                             223684.\nPages purgeable:                                6002.\n\"Translation faults\":                    14168612910.\nPages copy-on-write:                       650582033.\nPages zero filled:                       17394361370.\nPages reactivated:                        2821527574.\nPages purged:                               64874370.\nFile-backed pages:                           1322637.\nAnonymous pages:                              516514.\nPages stored in compressor:                  1718419.\nPages occupied by compressor:                 616043.\nDecompressions:                            996691809.\nCompressions:                             1293282601.\nPageins:                                  6480697689.\nPageouts:                                   10782572.\nSwapins:                                    41724063.\nSwapouts:                                   69922789.\nPages tagged:                                 169512.\nPages tagged resident:                        115913.\nPages tagged compressed:                       53599.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6828.\nPages tag-storage free:                         4931.\nPages tag-storage non-tag pageable:            86537.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8899328.\nTagged compressions:                         9880514.\nTagged decompressions:                       9096401.\n"
  }
}

````

## .build/optimization/embedding-runtime-build-v96-retry1/prebuild-diagnostic-accessor-correction.json

SHA-256 `811aa0cb3446c91b5138daec60ef9b16b5e4628ca8dd5bbb2da89c3cc17d7153`; 339 bytes.

````
{
  "classification": "pre-build source correction",
  "builder_pid": 76440,
  "builder_suspended_during_edit": true,
  "make_log_absent_before_edit": true,
  "file": "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift",
  "change": "Use the existing public sharedRope accessor in all three direct draft diagnostic calls."
}

````

## .build/optimization/embedding-runtime-build-v97/build.txt

SHA-256 `a1646091f660da8f9cbff870063632d13a8308cb61998d50c4908f29dcf3a785`; 3171 bytes.

````
python3 Tools/build_identity.py before .build/release
swift build -c release
[1/1] Compiling plugin GenerateManual
[2/2] Compiling plugin GenerateDoccReference
[3/3] Compiling plugin CudaBuild
Building for production...
[3/10] Write sources
[5/10] Write swift-version--1AB21518FC5DEDBE.txt
[7/11] Compiling SlotstreamDiagnostics CheckReport.swift
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
[8/13] Compiling SlotstreamTestKit Catalogue.swift
[8/13] Write Objects.LinkFileList
[10/13] Compiling slotstream_cli CheckRendering.swift
[10/13] Write Objects.LinkFileList
[11/13] Linking slotstream-checks
[12/13] Linking slotstream
Build complete! (44.72s)
cp Tools/lib/mlx-0.31.1.metallib .build/release/mlx.metallib
python3 Tools/build_identity.py after .build/release

````

## .build/optimization/embedding-runtime-build-v97/candidate/build-identity.json

SHA-256 `ad6a43c1441b1632fccf03f475ecf2fb1c94b974f2dd1292eeee2f551945c1d4`; 14337 bytes.

````
{
  "source": {
    "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
    "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
    "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
    "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
    "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
    "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
    "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
    "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
    "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
    "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
    "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
    "Sources/Slotstream/Engine.swift": "c3e5f8cb8e436ec796eed3e7d3455d2335630d190c9a368f20b2476000e9eba8",
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
    "Sources/Slotstream/Model.swift": "fa7eab985c60fa493952a3aa86f6a5d163d88038f9b027ebfa9ab8db81c6e52d",
    "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
    "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
    "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
    "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
    "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
    "Sources/Slotstream/Optimizations.swift": "1580af3cd7a6c728b6dfac524acac25742e0939deccaccaa82173aa5a19bd0ae",
    "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
    "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
    "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
    "Sources/Slotstream/PrefixCache.swift": "9bb9ad731a24e3fb84e15c92401d97f6677859553bfd15d23d541ae9be87bc01",
    "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
    "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
    "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
    "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
    "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
    "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
    "Sources/Slotstream/Server.swift": "366712c513ce926e31fdddcadf6103877714f053d3b8767b05d30c7b5215b137",
    "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
    "Sources/Slotstream/StatePrefixFork.swift": "b21e2da892dfe6024de879c42c4ffe89dc19ad1b22a1b8fcbebeba17324e2fba",
    "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
    "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
    "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
    "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
    "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
    "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
    "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
    "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
    "Sources/Slotstream/Weights.swift": "69a422597f7b28628a49c8b4a9d5f77ae670ff387c6b33610927bccf6352139f",
    "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
    "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
    "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
    "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
    "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
    "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
    "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
    "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
    "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
    "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
    "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
    "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
    "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
    "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
    "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
    "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
    "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
    "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
    "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "3af6d9dfee1c5b00690184102e288572465ab5faa7a9e901d886382887dbf57c",
    "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
    "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
    "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "67acc8c57a94801c1ac2166ced44f11690cf893f3409ee853b2dd679c0382a00",
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
    "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "1870c2069784145041061d98df97e204df719cc0e81fa01ef4e8265b32577b95",
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
    "Sources/slotstream-cli/OptimizationCommands.swift": "d94bfcceca11ba4204002e4c5992195be4e8e58522f8015aad8baa9a7891d463",
    "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
    "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
    "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
    "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
    "Sources/slotstream-cli/main.swift": "4bb7f13a6b31d4e348db3b4dff93707a52be7606302a120b94b3a4ebb933f462",
    "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
    "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
  },
  "source_archive_sha256": "d40cf213aef5f785500ae38d165b4e453dd157688e68a24181fba87599fb964c",
  "binary_sha256": "e2e97ff50329cc20e369b9582e009f2c3f0bd24938490d07c50a9ebe40c3047b",
  "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
}

````

## .build/optimization/embedding-runtime-build-v97/candidate/build-source.tar.gz

SHA-256 `d40cf213aef5f785500ae38d165b4e453dd157688e68a24181fba87599fb964c`; 385792 bytes.

Base64 source archive:

````
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
````

## .build/optimization/embedding-runtime-build-v97/manifest.json

SHA-256 `fca4214374ca47ac06503cd2f10098dd827b30a54aa3e0fbb0c5e98e101fd4d5`; 19559 bytes.

````
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
    "seconds": 5.625000000002156e-06,
    "attempts": 1
  },
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27914502144,
    "swapins": 41724075,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   226989.\nPages active:                                1032067.\nPages inactive:                               748682.\nPages speculative:                            283137.\nPages throttled:                                   0.\nPages wired down:                             211502.\nPages purgeable:                               12964.\n\"Translation faults\":                    14170485442.\nPages copy-on-write:                       650828051.\nPages zero filled:                       17395216573.\nPages reactivated:                        2821528604.\nPages purged:                               64876183.\nFile-backed pages:                           1463813.\nAnonymous pages:                              600073.\nPages stored in compressor:                  1649685.\nPages occupied by compressor:                 580817.\nDecompressions:                            996753333.\nCompressions:                             1293282601.\nPageins:                                  6480758034.\nPageouts:                                   10782572.\nSwapins:                                    41724075.\nSwapouts:                                   69922789.\nPages tagged:                                 172263.\nPages tagged resident:                        121606.\nPages tagged compressed:                       50657.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6834.\nPages tag-storage free:                         2497.\nPages tag-storage non-tag pageable:            88965.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8303936.\nTagged compressions:                         9880514.\nTagged decompressions:                       9099313.\n"
  },
  "exit_code": 0,
  "frozen": {
    "binary": "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream",
    "identity": {
      "source": {
        "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
        "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
        "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
        "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
        "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
        "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
        "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
        "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
        "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
        "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
        "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
        "Sources/Slotstream/Engine.swift": "c3e5f8cb8e436ec796eed3e7d3455d2335630d190c9a368f20b2476000e9eba8",
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
        "Sources/Slotstream/Model.swift": "fa7eab985c60fa493952a3aa86f6a5d163d88038f9b027ebfa9ab8db81c6e52d",
        "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
        "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
        "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
        "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
        "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
        "Sources/Slotstream/Optimizations.swift": "1580af3cd7a6c728b6dfac524acac25742e0939deccaccaa82173aa5a19bd0ae",
        "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
        "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
        "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
        "Sources/Slotstream/PrefixCache.swift": "9bb9ad731a24e3fb84e15c92401d97f6677859553bfd15d23d541ae9be87bc01",
        "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
        "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
        "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
        "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
        "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
        "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
        "Sources/Slotstream/Server.swift": "366712c513ce926e31fdddcadf6103877714f053d3b8767b05d30c7b5215b137",
        "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
        "Sources/Slotstream/StatePrefixFork.swift": "b21e2da892dfe6024de879c42c4ffe89dc19ad1b22a1b8fcbebeba17324e2fba",
        "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
        "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
        "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
        "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
        "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
        "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
        "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
        "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
        "Sources/Slotstream/Weights.swift": "69a422597f7b28628a49c8b4a9d5f77ae670ff387c6b33610927bccf6352139f",
        "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
        "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
        "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
        "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
        "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
        "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
        "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
        "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
        "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
        "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
        "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
        "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
        "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
        "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
        "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
        "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
        "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
        "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
        "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "3af6d9dfee1c5b00690184102e288572465ab5faa7a9e901d886382887dbf57c",
        "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
        "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
        "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "67acc8c57a94801c1ac2166ced44f11690cf893f3409ee853b2dd679c0382a00",
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
        "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "1870c2069784145041061d98df97e204df719cc0e81fa01ef4e8265b32577b95",
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
        "Sources/slotstream-cli/OptimizationCommands.swift": "d94bfcceca11ba4204002e4c5992195be4e8e58522f8015aad8baa9a7891d463",
        "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
        "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
        "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
        "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
        "Sources/slotstream-cli/main.swift": "4bb7f13a6b31d4e348db3b4dff93707a52be7606302a120b94b3a4ebb933f462",
        "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
        "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
      },
      "source_archive_sha256": "d40cf213aef5f785500ae38d165b4e453dd157688e68a24181fba87599fb964c",
      "binary_sha256": "e2e97ff50329cc20e369b9582e009f2c3f0bd24938490d07c50a9ebe40c3047b",
      "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
    }
  },
  "checks_sha256": "82160b09f8a8dd664097c7a2345a97d6892eff64f5cfba1ed9f8d858a334858d",
  "elapsed_seconds": 45.388502458,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27826651136,
    "swapins": 41724075,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   114208.\nPages active:                                1052856.\nPages inactive:                               786268.\nPages speculative:                            326936.\nPages throttled:                                   0.\nPages wired down:                             225199.\nPages purgeable:                                6710.\n\"Translation faults\":                    14171171255.\nPages copy-on-write:                       650855037.\nPages zero filled:                       17395671540.\nPages reactivated:                        2821529210.\nPages purged:                               64876842.\nFile-backed pages:                           1577486.\nAnonymous pages:                              588574.\nPages stored in compressor:                  1641935.\nPages occupied by compressor:                 577215.\nDecompressions:                            996757273.\nCompressions:                             1293282601.\nPageins:                                  6480799700.\nPageouts:                                   10782572.\nSwapins:                                    41724075.\nSwapouts:                                   69922789.\nPages tagged:                                 173068.\nPages tagged resident:                        123279.\nPages tagged compressed:                       49789.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6841.\nPages tag-storage free:                         2775.\nPages tag-storage non-tag pageable:            88680.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8178368.\nTagged compressions:                         9880514.\nTagged decompressions:                       9100090.\n"
  }
}

````

## .build/optimization/embedding-rows-v97/manifest.json

SHA-256 `282a70dfe2d491ea69f566e6552935a76fefc400c9094ef7dc61edc0ab364fe3`; 19436 bytes.

````
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "c3e5f8cb8e436ec796eed3e7d3455d2335630d190c9a368f20b2476000e9eba8",
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
      "Sources/Slotstream/Model.swift": "fa7eab985c60fa493952a3aa86f6a5d163d88038f9b027ebfa9ab8db81c6e52d",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "Sources/Slotstream/Optimizations.swift": "1580af3cd7a6c728b6dfac524acac25742e0939deccaccaa82173aa5a19bd0ae",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
      "Sources/Slotstream/PrefixCache.swift": "9bb9ad731a24e3fb84e15c92401d97f6677859553bfd15d23d541ae9be87bc01",
      "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "366712c513ce926e31fdddcadf6103877714f053d3b8767b05d30c7b5215b137",
      "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
      "Sources/Slotstream/StatePrefixFork.swift": "b21e2da892dfe6024de879c42c4ffe89dc19ad1b22a1b8fcbebeba17324e2fba",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "69a422597f7b28628a49c8b4a9d5f77ae670ff387c6b33610927bccf6352139f",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "3af6d9dfee1c5b00690184102e288572465ab5faa7a9e901d886382887dbf57c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "67acc8c57a94801c1ac2166ced44f11690cf893f3409ee853b2dd679c0382a00",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "1870c2069784145041061d98df97e204df719cc0e81fa01ef4e8265b32577b95",
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
      "Sources/slotstream-cli/OptimizationCommands.swift": "d94bfcceca11ba4204002e4c5992195be4e8e58522f8015aad8baa9a7891d463",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
      "Sources/slotstream-cli/main.swift": "4bb7f13a6b31d4e348db3b4dff93707a52be7606302a120b94b3a4ebb933f462",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "d40cf213aef5f785500ae38d165b4e453dd157688e68a24181fba87599fb964c",
    "binary_sha256": "e2e97ff50329cc20e369b9582e009f2c3f0bd24938490d07c50a9ebe40c3047b",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13,
  "timeout_seconds": 600,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream",
    "optimization-state-check",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--variant",
    "embedding-rows",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27781693440,
    "swapins": 41724075,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   106025.\nPages active:                                1063000.\nPages inactive:                               788358.\nPages speculative:                            324675.\nPages throttled:                                   0.\nPages wired down:                             225300.\nPages purgeable:                                6597.\n\"Translation faults\":                    14171328050.\nPages copy-on-write:                       650864009.\nPages zero filled:                       17395818424.\nPages reactivated:                        2821529640.\nPages purged:                               64877802.\nFile-backed pages:                           1583038.\nAnonymous pages:                              592995.\nPages stored in compressor:                  1637341.\nPages occupied by compressor:                 575478.\nDecompressions:                            996761235.\nCompressions:                             1293282601.\nPageins:                                  6480802723.\nPageouts:                                   10782572.\nSwapins:                                    41724075.\nSwapouts:                                   69922789.\nPages tagged:                                 173256.\nPages tagged resident:                        123948.\nPages tagged compressed:                       49308.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6855.\nPages tag-storage free:                         2655.\nPages tag-storage non-tag pageable:            88786.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8095744.\nTagged compressions:                         9880514.\nTagged decompressions:                       9100533.\n"
  },
  "preflight_wait": {
    "seconds": 0.0027671249999999953,
    "attempts": 1,
    "limit_seconds": 1800
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 147,
  "duration_seconds": 0.9470080000000001,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27747827712,
    "swapins": 41724075,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   103153.\nPages active:                                1064163.\nPages inactive:                               788355.\nPages speculative:                            325194.\nPages throttled:                                   0.\nPages wired down:                             226686.\nPages purgeable:                                6597.\n\"Translation faults\":                    14171371276.\nPages copy-on-write:                       650864656.\nPages zero filled:                       17395856411.\nPages reactivated:                        2821529642.\nPages purged:                               64877802.\nFile-backed pages:                           1583843.\nAnonymous pages:                              593869.\nPages stored in compressor:                  1636948.\nPages occupied by compressor:                 575358.\nDecompressions:                            996761627.\nCompressions:                             1293282601.\nPageins:                                  6480803222.\nPageouts:                                   10782572.\nSwapins:                                    41724075.\nSwapouts:                                   69922789.\nPages tagged:                                 173240.\nPages tagged resident:                        123943.\nPages tagged compressed:                       49297.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6856.\nPages tag-storage free:                         2543.\nPages tag-storage non-tag pageable:            88897.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8093120.\nTagged compressions:                         9880514.\nTagged decompressions:                       9100544.\n"
  }
}

````

## .build/optimization/embedding-rows-v97/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````

````

## .build/optimization/embedding-rows-v97/stdout.txt

SHA-256 `5cfa60f6ca8aefc9e96869f4010dfcae9309e49facd6adefa88f6069fb36cb5d`; 11826 bytes.

````
{
  "items" : [
    {
      "name" : "scalar first row: dtype",
      "passed" : true
    },
    {
      "name" : "scalar first row: shape",
      "passed" : true
    },
    {
      "name" : "scalar first row: every output bit",
      "passed" : true
    },
    {
      "name" : "scalar first row: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "last vocabulary row: dtype",
      "passed" : true
    },
    {
      "name" : "last vocabulary row: shape",
      "passed" : true
    },
    {
      "name" : "last vocabulary row: every output bit",
      "passed" : true
    },
    {
      "name" : "last vocabulary row: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "unique1: dtype",
      "passed" : true
    },
    {
      "name" : "unique1: shape",
      "passed" : true
    },
    {
      "name" : "unique1: every output bit",
      "passed" : true
    },
    {
      "name" : "unique1: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "reverse1: dtype",
      "passed" : true
    },
    {
      "name" : "reverse1: shape",
      "passed" : true
    },
    {
      "name" : "reverse1: every output bit",
      "passed" : true
    },
    {
      "name" : "reverse1: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "unique16: dtype",
      "passed" : true
    },
    {
      "name" : "unique16: shape",
      "passed" : true
    },
    {
      "name" : "unique16: every output bit",
      "passed" : true
    },
    {
      "name" : "unique16: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "reverse16: dtype",
      "passed" : true
    },
    {
      "name" : "reverse16: shape",
      "passed" : true
    },
    {
      "name" : "reverse16: every output bit",
      "passed" : true
    },
    {
      "name" : "reverse16: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "unique17: dtype",
      "passed" : true
    },
    {
      "name" : "unique17: shape",
      "passed" : true
    },
    {
      "name" : "unique17: every output bit",
      "passed" : true
    },
    {
      "name" : "unique17: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "reverse17: dtype",
      "passed" : true
    },
    {
      "name" : "reverse17: shape",
      "passed" : true
    },
    {
      "name" : "reverse17: every output bit",
      "passed" : true
    },
    {
      "name" : "reverse17: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "unique18: dtype",
      "passed" : true
    },
    {
      "name" : "unique18: shape",
      "passed" : true
    },
    {
      "name" : "unique18: every output bit",
      "passed" : true
    },
    {
      "name" : "unique18: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "reverse18: dtype",
      "passed" : true
    },
    {
      "name" : "reverse18: shape",
      "passed" : true
    },
    {
      "name" : "reverse18: every output bit",
      "passed" : true
    },
    {
      "name" : "reverse18: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "unique255: dtype",
      "passed" : true
    },
    {
      "name" : "unique255: shape",
      "passed" : true
    },
    {
      "name" : "unique255: every output bit",
      "passed" : true
    },
    {
      "name" : "unique255: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "reverse255: dtype",
      "passed" : true
    },
    {
      "name" : "reverse255: shape",
      "passed" : true
    },
    {
      "name" : "reverse255: every output bit",
      "passed" : true
    },
    {
      "name" : "reverse255: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "unique256: dtype",
      "passed" : true
    },
    {
      "name" : "unique256: shape",
      "passed" : true
    },
    {
      "name" : "unique256: every output bit",
      "passed" : true
    },
    {
      "name" : "unique256: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "reverse256: dtype",
      "passed" : true
    },
    {
      "name" : "reverse256: shape",
      "passed" : true
    },
    {
      "name" : "reverse256: every output bit",
      "passed" : true
    },
    {
      "name" : "reverse256: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "unique1024: dtype",
      "passed" : true
    },
    {
      "name" : "unique1024: shape",
      "passed" : true
    },
    {
      "name" : "unique1024: every output bit",
      "passed" : true
    },
    {
      "name" : "unique1024: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "reverse1024: dtype",
      "passed" : true
    },
    {
      "name" : "reverse1024: shape",
      "passed" : true
    },
    {
      "name" : "reverse1024: every output bit",
      "passed" : true
    },
    {
      "name" : "reverse1024: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "unique4096: dtype",
      "passed" : true
    },
    {
      "name" : "unique4096: shape",
      "passed" : true
    },
    {
      "name" : "unique4096: every output bit",
      "passed" : true
    },
    {
      "name" : "unique4096: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "reverse4096: dtype",
      "passed" : true
    },
    {
      "name" : "reverse4096: shape",
      "passed" : true
    },
    {
      "name" : "reverse4096: every output bit",
      "passed" : true
    },
    {
      "name" : "reverse4096: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "duplicate multidimensional IDs: dtype",
      "passed" : true
    },
    {
      "name" : "duplicate multidimensional IDs: shape",
      "passed" : true
    },
    {
      "name" : "duplicate multidimensional IDs: every output bit",
      "passed" : true
    },
    {
      "name" : "duplicate multidimensional IDs: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "empty shape",
      "passed" : true
    },
    {
      "name" : "eviction0: dtype",
      "passed" : true
    },
    {
      "name" : "eviction0: shape",
      "passed" : true
    },
    {
      "name" : "eviction0: every output bit",
      "passed" : true
    },
    {
      "name" : "eviction0: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "eviction1: dtype",
      "passed" : true
    },
    {
      "name" : "eviction1: shape",
      "passed" : true
    },
    {
      "name" : "eviction1: every output bit",
      "passed" : true
    },
    {
      "name" : "eviction1: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "eviction2: dtype",
      "passed" : true
    },
    {
      "name" : "eviction2: shape",
      "passed" : true
    },
    {
      "name" : "eviction2: every output bit",
      "passed" : true
    },
    {
      "name" : "eviction2: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "eviction3: dtype",
      "passed" : true
    },
    {
      "name" : "eviction3: shape",
      "passed" : true
    },
    {
      "name" : "eviction3: every output bit",
      "passed" : true
    },
    {
      "name" : "eviction3: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "previous output survives eviction and cache release",
      "passed" : true
    },
    {
      "name" : "invalid input rejected",
      "passed" : true
    },
    {
      "name" : "invalid input rejected",
      "passed" : true
    },
    {
      "name" : "invalid input rejected",
      "passed" : true
    },
    {
      "name" : "invalid input rejected",
      "passed" : true
    },
    {
      "name" : "invalid input rejected",
      "passed" : true
    },
    {
      "name" : "invalid input rejected",
      "passed" : true
    },
    {
      "name" : "invalid input rejected",
      "passed" : true
    },
    {
      "name" : "fault0: propagated",
      "passed" : true
    },
    {
      "name" : "fault0: actually fired",
      "passed" : true
    },
    {
      "name" : "fault0: previous cache unchanged",
      "passed" : true
    },
    {
      "name" : "fault0: no partial miss publication",
      "passed" : true
    },
    {
      "name" : "fault0: no partial hit publication",
      "passed" : true
    },
    {
      "name" : "fault0 retry: dtype",
      "passed" : true
    },
    {
      "name" : "fault0 retry: shape",
      "passed" : true
    },
    {
      "name" : "fault0 retry: every output bit",
      "passed" : true
    },
    {
      "name" : "fault0 retry: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "fault1: propagated",
      "passed" : true
    },
    {
      "name" : "fault1: actually fired",
      "passed" : true
    },
    {
      "name" : "fault1: previous cache unchanged",
      "passed" : true
    },
    {
      "name" : "fault1: no partial miss publication",
      "passed" : true
    },
    {
      "name" : "fault1: no partial hit publication",
      "passed" : true
    },
    {
      "name" : "fault1 retry: dtype",
      "passed" : true
    },
    {
      "name" : "fault1 retry: shape",
      "passed" : true
    },
    {
      "name" : "fault1 retry: every output bit",
      "passed" : true
    },
    {
      "name" : "fault1 retry: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "fault2: propagated",
      "passed" : true
    },
    {
      "name" : "fault2: actually fired",
      "passed" : true
    },
    {
      "name" : "fault2: previous cache unchanged",
      "passed" : true
    },
    {
      "name" : "fault2: no partial miss publication",
      "passed" : true
    },
    {
      "name" : "fault2: no partial hit publication",
      "passed" : true
    },
    {
      "name" : "fault2 retry: dtype",
      "passed" : true
    },
    {
      "name" : "fault2 retry: shape",
      "passed" : true
    },
    {
      "name" : "fault2 retry: every output bit",
      "passed" : true
    },
    {
      "name" : "fault2 retry: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "fault17: propagated",
      "passed" : true
    },
    {
      "name" : "fault17: actually fired",
      "passed" : true
    },
    {
      "name" : "fault17: previous cache unchanged",
      "passed" : true
    },
    {
      "name" : "fault17: no partial miss publication",
      "passed" : true
    },
    {
      "name" : "fault17: no partial hit publication",
      "passed" : true
    },
    {
      "name" : "fault17 retry: dtype",
      "passed" : true
    },
    {
      "name" : "fault17 retry: shape",
      "passed" : true
    },
    {
      "name" : "fault17 retry: every output bit",
      "passed" : true
    },
    {
      "name" : "fault17 retry: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "fault94: propagated",
      "passed" : true
    },
    {
      "name" : "fault94: actually fired",
      "passed" : true
    },
    {
      "name" : "fault94: previous cache unchanged",
      "passed" : true
    },
    {
      "name" : "fault94: no partial miss publication",
      "passed" : true
    },
    {
      "name" : "fault94: no partial hit publication",
      "passed" : true
    },
    {
      "name" : "fault94 retry: dtype",
      "passed" : true
    },
    {
      "name" : "fault94 retry: shape",
      "passed" : true
    },
    {
      "name" : "fault94 retry: every output bit",
      "passed" : true
    },
    {
      "name" : "fault94 retry: fixed row capacity",
      "passed" : true
    },
    {
      "name" : "exact resident embedding payload",
      "passed" : true
    }
  ],
  "measurements" : {
    "cached_payload_bytes" : 24480,
    "end_physical_bytes" : 563414072,
    "resident_reference_payload_bytes" : 357580800
  },
  "name" : "optimization-embedding-rows",
  "passed" : true
}

````

## .build/optimization/embedding-runtime-v97/manifest.json

SHA-256 `f0136d0d1f91056dd93c78172054dde5d0cc8aa8d5d2a45f978389bdd1cee0b2`; 19435 bytes.

````
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "c3e5f8cb8e436ec796eed3e7d3455d2335630d190c9a368f20b2476000e9eba8",
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
      "Sources/Slotstream/Model.swift": "fa7eab985c60fa493952a3aa86f6a5d163d88038f9b027ebfa9ab8db81c6e52d",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "Sources/Slotstream/Optimizations.swift": "1580af3cd7a6c728b6dfac524acac25742e0939deccaccaa82173aa5a19bd0ae",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
      "Sources/Slotstream/PrefixCache.swift": "9bb9ad731a24e3fb84e15c92401d97f6677859553bfd15d23d541ae9be87bc01",
      "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "366712c513ce926e31fdddcadf6103877714f053d3b8767b05d30c7b5215b137",
      "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
      "Sources/Slotstream/StatePrefixFork.swift": "b21e2da892dfe6024de879c42c4ffe89dc19ad1b22a1b8fcbebeba17324e2fba",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "69a422597f7b28628a49c8b4a9d5f77ae670ff387c6b33610927bccf6352139f",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "3af6d9dfee1c5b00690184102e288572465ab5faa7a9e901d886382887dbf57c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "67acc8c57a94801c1ac2166ced44f11690cf893f3409ee853b2dd679c0382a00",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "1870c2069784145041061d98df97e204df719cc0e81fa01ef4e8265b32577b95",
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
      "Sources/slotstream-cli/OptimizationCommands.swift": "d94bfcceca11ba4204002e4c5992195be4e8e58522f8015aad8baa9a7891d463",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
      "Sources/slotstream-cli/main.swift": "4bb7f13a6b31d4e348db3b4dff93707a52be7606302a120b94b3a4ebb933f462",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "d40cf213aef5f785500ae38d165b4e453dd157688e68a24181fba87599fb964c",
    "binary_sha256": "e2e97ff50329cc20e369b9582e009f2c3f0bd24938490d07c50a9ebe40c3047b",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13,
  "timeout_seconds": 1200,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream",
    "optimization-state-check",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--variant",
    "embedding-runtime",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 27747794944,
    "swapins": 41724075,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   103148.\nPages active:                                1064182.\nPages inactive:                               788388.\nPages speculative:                            325164.\nPages throttled:                                   0.\nPages wired down:                             226682.\nPages purgeable:                                6597.\n\"Translation faults\":                    14171376913.\nPages copy-on-write:                       650865103.\nPages zero filled:                       17395858555.\nPages reactivated:                        2821529642.\nPages purged:                               64877802.\nFile-backed pages:                           1583846.\nAnonymous pages:                              593888.\nPages stored in compressor:                  1636941.\nPages occupied by compressor:                 575356.\nDecompressions:                            996761634.\nCompressions:                             1293282601.\nPageins:                                  6480803242.\nPageouts:                                   10782572.\nSwapins:                                    41724075.\nSwapouts:                                   69922789.\nPages tagged:                                 173198.\nPages tagged resident:                        123901.\nPages tagged compressed:                       49297.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6856.\nPages tag-storage free:                         2547.\nPages tag-storage non-tag pageable:            88893.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8093120.\nTagged compressions:                         9880514.\nTagged decompressions:                       9100544.\n"
  },
  "preflight_wait": {
    "seconds": 0.0026361659999999953,
    "attempts": 1,
    "limit_seconds": 1800
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 172,
  "duration_seconds": 149.363649208,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30213455872,
    "swapins": 41724075,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   457467.\nPages active:                                 864654.\nPages inactive:                               744259.\nPages speculative:                            119060.\nPages throttled:                                   0.\nPages wired down:                             223461.\nPages purgeable:                                1051.\n\"Translation faults\":                    14172977756.\nPages copy-on-write:                       650930465.\nPages zero filled:                       17428685638.\nPages reactivated:                        2824758374.\nPages purged:                               64903838.\nFile-backed pages:                           1385565.\nAnonymous pages:                              342408.\nPages stored in compressor:                  1826656.\nPages occupied by compressor:                 674441.\nDecompressions:                            997064752.\nCompressions:                             1293780980.\nPageins:                                  6483196271.\nPageouts:                                   10783122.\nSwapins:                                    41724075.\nSwapouts:                                   69922789.\nPages tagged:                                 170567.\nPages tagged resident:                        116731.\nPages tagged compressed:                       53836.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6838.\nPages tag-storage free:                         2153.\nPages tag-storage non-tag pageable:            89305.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8871744.\nTagged compressions:                         9890402.\nTagged decompressions:                       9105440.\n"
  }
}

````

## .build/optimization/embedding-runtime-v97/stderr.txt

SHA-256 `868bb77d2961e98a5e4e46494d4e1a331dfc3dd2cee65ea177de088fc1017c96`; 354 bytes.

````
embedding resident / cached17
embedding resident / sweep256
embedding resident / tail273
embedding resident / long1025
embedding resident / image-before
embedding resident / image-crossing
embedding rows / cached17
embedding rows / sweep256
embedding rows / tail273
embedding rows / long1025
embedding rows / image-before
embedding rows / image-crossing

````

## .build/optimization/embedding-runtime-v97/stdout.txt

SHA-256 `b9548f3ae45b3e7b1224de0df90ccaa362f732e66476cfb6584c27fd424fbfa5`; 16403 bytes.

````
{
  "items" : [
    {
      "name" : "row mode false: runtime selection",
      "passed" : true
    },
    {
      "name" : "false: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "false: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "false: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "false: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "false: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "false: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "false: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "false: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "false\/cached17: prefill commits",
      "passed" : true
    },
    {
      "name" : "false\/cached17: mode observed",
      "passed" : true
    },
    {
      "name" : "false\/cached17: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "false\/cached17: committed token count",
      "passed" : true
    },
    {
      "name" : "false\/cached17: generation succeeds",
      "passed" : true
    },
    {
      "name" : "false\/cached17: full greedy output length",
      "passed" : true
    },
    {
      "name" : "false\/cached17: bounded row payload",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: prefill commits",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: mode observed",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: committed token count",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: generation succeeds",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: full greedy output length",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: bounded row payload",
      "passed" : true
    },
    {
      "name" : "false\/tail273: prefill commits",
      "passed" : true
    },
    {
      "name" : "false\/tail273: mode observed",
      "passed" : true
    },
    {
      "name" : "false\/tail273: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "false\/tail273: committed token count",
      "passed" : true
    },
    {
      "name" : "false\/tail273: generation succeeds",
      "passed" : true
    },
    {
      "name" : "false\/tail273: full greedy output length",
      "passed" : true
    },
    {
      "name" : "false\/tail273: bounded row payload",
      "passed" : true
    },
    {
      "name" : "false\/long1025: prefill commits",
      "passed" : true
    },
    {
      "name" : "false\/long1025: mode observed",
      "passed" : true
    },
    {
      "name" : "false\/long1025: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "false\/long1025: committed token count",
      "passed" : true
    },
    {
      "name" : "false\/long1025: generation succeeds",
      "passed" : true
    },
    {
      "name" : "false\/long1025: full greedy output length",
      "passed" : true
    },
    {
      "name" : "false\/long1025: bounded row payload",
      "passed" : true
    },
    {
      "name" : "false\/image-before: prefill commits",
      "passed" : true
    },
    {
      "name" : "false\/image-before: mode observed",
      "passed" : true
    },
    {
      "name" : "false\/image-before: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "false\/image-before: committed token count",
      "passed" : true
    },
    {
      "name" : "false\/image-before: generation succeeds",
      "passed" : true
    },
    {
      "name" : "false\/image-before: full greedy output length",
      "passed" : true
    },
    {
      "name" : "false\/image-before: bounded row payload",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: prefill commits",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: mode observed",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: committed token count",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: generation succeeds",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: full greedy output length",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: bounded row payload",
      "passed" : true
    },
    {
      "name" : "row mode true: runtime selection",
      "passed" : true
    },
    {
      "name" : "true: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "true: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "true: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "true: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "true: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "true: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "true: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "true: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "true\/cached17: prefill commits",
      "passed" : true
    },
    {
      "name" : "true\/cached17: mode observed",
      "passed" : true
    },
    {
      "name" : "true\/cached17: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "true\/cached17: committed token count",
      "passed" : true
    },
    {
      "name" : "true\/cached17: generation succeeds",
      "passed" : true
    },
    {
      "name" : "true\/cached17: full greedy output length",
      "passed" : true
    },
    {
      "name" : "true\/cached17: bounded row payload",
      "passed" : true
    },
    {
      "name" : "cached17: all committed state fields and continued logits bit exact",
      "passed" : true
    },
    {
      "name" : "cached17: complete greedy output exact",
      "passed" : true
    },
    {
      "name" : "cached17: identical prefill boundaries",
      "passed" : true
    },
    {
      "name" : "cached17: identical expert work",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: prefill commits",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: mode observed",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: committed token count",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: generation succeeds",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: full greedy output length",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: bounded row payload",
      "passed" : true
    },
    {
      "name" : "sweep256: all committed state fields and continued logits bit exact",
      "passed" : true
    },
    {
      "name" : "sweep256: complete greedy output exact",
      "passed" : true
    },
    {
      "name" : "sweep256: identical prefill boundaries",
      "passed" : true
    },
    {
      "name" : "sweep256: identical expert work",
      "passed" : true
    },
    {
      "name" : "true\/tail273: prefill commits",
      "passed" : true
    },
    {
      "name" : "true\/tail273: mode observed",
      "passed" : true
    },
    {
      "name" : "true\/tail273: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "true\/tail273: committed token count",
      "passed" : true
    },
    {
      "name" : "true\/tail273: generation succeeds",
      "passed" : true
    },
    {
      "name" : "true\/tail273: full greedy output length",
      "passed" : true
    },
    {
      "name" : "true\/tail273: bounded row payload",
      "passed" : true
    },
    {
      "name" : "tail273: all committed state fields and continued logits bit exact",
      "passed" : true
    },
    {
      "name" : "tail273: complete greedy output exact",
      "passed" : true
    },
    {
      "name" : "tail273: identical prefill boundaries",
      "passed" : true
    },
    {
      "name" : "tail273: identical expert work",
      "passed" : true
    },
    {
      "name" : "true\/long1025: prefill commits",
      "passed" : true
    },
    {
      "name" : "true\/long1025: mode observed",
      "passed" : true
    },
    {
      "name" : "true\/long1025: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "true\/long1025: committed token count",
      "passed" : true
    },
    {
      "name" : "true\/long1025: generation succeeds",
      "passed" : true
    },
    {
      "name" : "true\/long1025: full greedy output length",
      "passed" : true
    },
    {
      "name" : "true\/long1025: bounded row payload",
      "passed" : true
    },
    {
      "name" : "long1025: all committed state fields and continued logits bit exact",
      "passed" : true
    },
    {
      "name" : "long1025: complete greedy output exact",
      "passed" : true
    },
    {
      "name" : "long1025: identical prefill boundaries",
      "passed" : true
    },
    {
      "name" : "long1025: identical expert work",
      "passed" : true
    },
    {
      "name" : "true\/image-before: prefill commits",
      "passed" : true
    },
    {
      "name" : "true\/image-before: mode observed",
      "passed" : true
    },
    {
      "name" : "true\/image-before: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "true\/image-before: committed token count",
      "passed" : true
    },
    {
      "name" : "true\/image-before: generation succeeds",
      "passed" : true
    },
    {
      "name" : "true\/image-before: full greedy output length",
      "passed" : true
    },
    {
      "name" : "true\/image-before: bounded row payload",
      "passed" : true
    },
    {
      "name" : "image-before: all committed state fields and continued logits bit exact",
      "passed" : true
    },
    {
      "name" : "image-before: complete greedy output exact",
      "passed" : true
    },
    {
      "name" : "image-before: identical prefill boundaries",
      "passed" : true
    },
    {
      "name" : "image-before: identical expert work",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: prefill commits",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: mode observed",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: committed token count",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: generation succeeds",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: full greedy output length",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: bounded row payload",
      "passed" : true
    },
    {
      "name" : "image-crossing: all committed state fields and continued logits bit exact",
      "passed" : true
    },
    {
      "name" : "image-crossing: complete greedy output exact",
      "passed" : true
    },
    {
      "name" : "image-crossing: identical prefill boundaries",
      "passed" : true
    },
    {
      "name" : "image-crossing: identical expert work",
      "passed" : true
    },
    {
      "name" : "row cache with reusable prefix: exact output",
      "passed" : true
    },
    {
      "name" : "row cache with reusable prefix: retained boundary",
      "passed" : true
    },
    {
      "name" : "row cache with reusable prefix: no checkpoint errors",
      "passed" : true
    },
    {
      "name" : "row cache with reusable prefix: no reread of retained rows",
      "passed" : true
    },
    {
      "name" : "first prefill: embedding read fault actually fired",
      "passed" : true
    },
    {
      "name" : "first prefill: explicit failed completion",
      "passed" : true
    },
    {
      "name" : "first prefill: runtime error propagated",
      "passed" : true
    },
    {
      "name" : "first prefill: committed callback output preserved",
      "passed" : true
    },
    {
      "name" : "first prefill: no invalid state cached",
      "passed" : true
    },
    {
      "name" : "first prefill: pool pins released",
      "passed" : true
    },
    {
      "name" : "first prefill: sweep admission reset",
      "passed" : true
    },
    {
      "name" : "first prefill: allocator restored",
      "passed" : true
    },
    {
      "name" : "first prefill: only committed prefill counted",
      "passed" : true
    },
    {
      "name" : "first prefill: exact committed output prefix",
      "passed" : true
    },
    {
      "name" : "first prefill: retry succeeds",
      "passed" : true
    },
    {
      "name" : "first prefill: retry exactly matches original table",
      "passed" : true
    },
    {
      "name" : "second prefill: embedding read fault actually fired",
      "passed" : true
    },
    {
      "name" : "second prefill: explicit failed completion",
      "passed" : true
    },
    {
      "name" : "second prefill: runtime error propagated",
      "passed" : true
    },
    {
      "name" : "second prefill: committed callback output preserved",
      "passed" : true
    },
    {
      "name" : "second prefill: no invalid state cached",
      "passed" : true
    },
    {
      "name" : "second prefill: pool pins released",
      "passed" : true
    },
    {
      "name" : "second prefill: sweep admission reset",
      "passed" : true
    },
    {
      "name" : "second prefill: allocator restored",
      "passed" : true
    },
    {
      "name" : "second prefill: only committed prefill counted",
      "passed" : true
    },
    {
      "name" : "second prefill: exact committed output prefix",
      "passed" : true
    },
    {
      "name" : "second prefill: retry succeeds",
      "passed" : true
    },
    {
      "name" : "second prefill: retry exactly matches original table",
      "passed" : true
    },
    {
      "name" : "decode: embedding read fault actually fired",
      "passed" : true
    },
    {
      "name" : "decode: explicit failed completion",
      "passed" : true
    },
    {
      "name" : "decode: runtime error propagated",
      "passed" : true
    },
    {
      "name" : "decode: committed callback output preserved",
      "passed" : true
    },
    {
      "name" : "decode: no invalid state cached",
      "passed" : true
    },
    {
      "name" : "decode: pool pins released",
      "passed" : true
    },
    {
      "name" : "decode: sweep admission reset",
      "passed" : true
    },
    {
      "name" : "decode: allocator restored",
      "passed" : true
    },
    {
      "name" : "decode: only committed prefill counted",
      "passed" : true
    },
    {
      "name" : "decode: exact committed output prefix",
      "passed" : true
    },
    {
      "name" : "decode: retry succeeds",
      "passed" : true
    },
    {
      "name" : "decode: retry exactly matches original table",
      "passed" : true
    },
    {
      "name" : "invalid public lookup rejected",
      "passed" : true
    },
    {
      "name" : "invalid public lookup rejected",
      "passed" : true
    },
    {
      "name" : "invalid public lookup rejected",
      "passed" : true
    },
    {
      "name" : "larger public lookup keeps exact shape",
      "passed" : true
    },
    {
      "name" : "larger public lookup preserves every row",
      "passed" : true
    },
    {
      "name" : "public tensor access preserves all table bytes",
      "passed" : true
    }
  ],
  "measurements" : {
    "resident_loaded_mlx_active_bytes" : 4704045212,
    "resident_loaded_physical_bytes" : 4786785112,
    "rows_loaded_mlx_active_bytes" : 4346448028,
    "rows_loaded_physical_bytes" : 4455435288
  },
  "name" : "optimization-embedding-runtime",
  "passed" : true
}

````

## .build/optimization/embedding-runtime-mtp-v97/manifest.json

SHA-256 `f507683d272bd4ef54e7ac24be5e6c1d207ea92f0a26032c6435c6957dc34099`; 19436 bytes.

````
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "c3e5f8cb8e436ec796eed3e7d3455d2335630d190c9a368f20b2476000e9eba8",
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
      "Sources/Slotstream/Model.swift": "fa7eab985c60fa493952a3aa86f6a5d163d88038f9b027ebfa9ab8db81c6e52d",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "Sources/Slotstream/Optimizations.swift": "1580af3cd7a6c728b6dfac524acac25742e0939deccaccaa82173aa5a19bd0ae",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
      "Sources/Slotstream/PrefixCache.swift": "9bb9ad731a24e3fb84e15c92401d97f6677859553bfd15d23d541ae9be87bc01",
      "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "366712c513ce926e31fdddcadf6103877714f053d3b8767b05d30c7b5215b137",
      "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
      "Sources/Slotstream/StatePrefixFork.swift": "b21e2da892dfe6024de879c42c4ffe89dc19ad1b22a1b8fcbebeba17324e2fba",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "69a422597f7b28628a49c8b4a9d5f77ae670ff387c6b33610927bccf6352139f",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "3af6d9dfee1c5b00690184102e288572465ab5faa7a9e901d886382887dbf57c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "67acc8c57a94801c1ac2166ced44f11690cf893f3409ee853b2dd679c0382a00",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "1870c2069784145041061d98df97e204df719cc0e81fa01ef4e8265b32577b95",
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
      "Sources/slotstream-cli/OptimizationCommands.swift": "d94bfcceca11ba4204002e4c5992195be4e8e58522f8015aad8baa9a7891d463",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
      "Sources/slotstream-cli/main.swift": "4bb7f13a6b31d4e348db3b4dff93707a52be7606302a120b94b3a4ebb933f462",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "d40cf213aef5f785500ae38d165b4e453dd157688e68a24181fba87599fb964c",
    "binary_sha256": "e2e97ff50329cc20e369b9582e009f2c3f0bd24938490d07c50a9ebe40c3047b",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13,
  "timeout_seconds": 1200,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream",
    "optimization-state-check",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--variant",
    "embedding-runtime-mtp",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": true,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 30212341760,
    "swapins": 41724075,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   457368.\nPages active:                                 865319.\nPages inactive:                               744390.\nPages speculative:                            119012.\nPages throttled:                                   0.\nPages wired down:                             223461.\nPages purgeable:                                1051.\n\"Translation faults\":                    14172981087.\nPages copy-on-write:                       650930858.\nPages zero filled:                       17428686657.\nPages reactivated:                        2824758374.\nPages purged:                               64903838.\nFile-backed pages:                           1385596.\nAnonymous pages:                              343125.\nPages stored in compressor:                  1825963.\nPages occupied by compressor:                 674101.\nDecompressions:                            997065189.\nCompressions:                             1293780980.\nPageins:                                  6483196297.\nPageouts:                                   10783122.\nSwapins:                                    41724075.\nSwapouts:                                   69922789.\nPages tagged:                                 170567.\nPages tagged resident:                        116731.\nPages tagged compressed:                       53836.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6838.\nPages tag-storage free:                         1853.\nPages tag-storage non-tag pageable:            89605.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8871744.\nTagged compressions:                         9890402.\nTagged decompressions:                       9105440.\n"
  },
  "preflight_wait": {
    "seconds": 0.0027709590000000034,
    "attempts": 1,
    "limit_seconds": 1800
  },
  "exit_code": 0,
  "result_key": "passed",
  "assertions": 208,
  "duration_seconds": 154.818993,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31110594560,
    "swapins": 41724079,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   543906.\nPages active:                                 801349.\nPages inactive:                               631753.\nPages speculative:                            169026.\nPages throttled:                                   0.\nPages wired down:                             224509.\nPages purgeable:                                  10.\n\"Translation faults\":                    14174987562.\nPages copy-on-write:                       651041369.\nPages zero filled:                       17462272678.\nPages reactivated:                        2827455966.\nPages purged:                               64936829.\nFile-backed pages:                           1354924.\nAnonymous pages:                              247204.\nPages stored in compressor:                  1898987.\nPages occupied by compressor:                 712104.\nDecompressions:                            997386678.\nCompressions:                             1294193673.\nPageins:                                  6485274074.\nPageouts:                                   10783828.\nSwapins:                                    41724079.\nSwapouts:                                   69922789.\nPages tagged:                                 168742.\nPages tagged resident:                        111424.\nPages tagged compressed:                       57318.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6835.\nPages tag-storage free:                         2884.\nPages tag-storage non-tag pageable:            88577.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9659840.\nTagged compressions:                         9900357.\nTagged decompressions:                       9110832.\n"
  }
}

````

## .build/optimization/embedding-runtime-mtp-v97/stderr.txt

SHA-256 `868bb77d2961e98a5e4e46494d4e1a331dfc3dd2cee65ea177de088fc1017c96`; 354 bytes.

````
embedding resident / cached17
embedding resident / sweep256
embedding resident / tail273
embedding resident / long1025
embedding resident / image-before
embedding resident / image-crossing
embedding rows / cached17
embedding rows / sweep256
embedding rows / tail273
embedding rows / long1025
embedding rows / image-before
embedding rows / image-crossing

````

## .build/optimization/embedding-runtime-mtp-v97/stdout.txt

SHA-256 `74a4f886453983aae7bea0124796b577b7c56c128b43e26c3a2cac7db391e863`; 19731 bytes.

````
{
  "items" : [
    {
      "name" : "row mode false: runtime selection",
      "passed" : true
    },
    {
      "name" : "false: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "false: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "false: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "false: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "false: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "false: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "false: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "false: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "false\/cached17: prefill commits",
      "passed" : true
    },
    {
      "name" : "false\/cached17: mode observed",
      "passed" : true
    },
    {
      "name" : "false\/cached17: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "false\/cached17: committed token count",
      "passed" : true
    },
    {
      "name" : "false\/cached17: draft aligned",
      "passed" : true
    },
    {
      "name" : "false\/cached17: generation succeeds",
      "passed" : true
    },
    {
      "name" : "false\/cached17: full greedy output length",
      "passed" : true
    },
    {
      "name" : "false\/cached17: verify path exercised",
      "passed" : true
    },
    {
      "name" : "false\/cached17: bounded row payload",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: prefill commits",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: mode observed",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: committed token count",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: draft aligned",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: generation succeeds",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: full greedy output length",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: verify path exercised",
      "passed" : true
    },
    {
      "name" : "false\/sweep256: bounded row payload",
      "passed" : true
    },
    {
      "name" : "false\/tail273: prefill commits",
      "passed" : true
    },
    {
      "name" : "false\/tail273: mode observed",
      "passed" : true
    },
    {
      "name" : "false\/tail273: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "false\/tail273: committed token count",
      "passed" : true
    },
    {
      "name" : "false\/tail273: draft aligned",
      "passed" : true
    },
    {
      "name" : "false\/tail273: generation succeeds",
      "passed" : true
    },
    {
      "name" : "false\/tail273: full greedy output length",
      "passed" : true
    },
    {
      "name" : "false\/tail273: verify path exercised",
      "passed" : true
    },
    {
      "name" : "false\/tail273: bounded row payload",
      "passed" : true
    },
    {
      "name" : "false\/long1025: prefill commits",
      "passed" : true
    },
    {
      "name" : "false\/long1025: mode observed",
      "passed" : true
    },
    {
      "name" : "false\/long1025: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "false\/long1025: committed token count",
      "passed" : true
    },
    {
      "name" : "false\/long1025: draft aligned",
      "passed" : true
    },
    {
      "name" : "false\/long1025: generation succeeds",
      "passed" : true
    },
    {
      "name" : "false\/long1025: full greedy output length",
      "passed" : true
    },
    {
      "name" : "false\/long1025: verify path exercised",
      "passed" : true
    },
    {
      "name" : "false\/long1025: bounded row payload",
      "passed" : true
    },
    {
      "name" : "false\/image-before: prefill commits",
      "passed" : true
    },
    {
      "name" : "false\/image-before: mode observed",
      "passed" : true
    },
    {
      "name" : "false\/image-before: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "false\/image-before: committed token count",
      "passed" : true
    },
    {
      "name" : "false\/image-before: draft aligned",
      "passed" : true
    },
    {
      "name" : "false\/image-before: generation succeeds",
      "passed" : true
    },
    {
      "name" : "false\/image-before: full greedy output length",
      "passed" : true
    },
    {
      "name" : "false\/image-before: verify path exercised",
      "passed" : true
    },
    {
      "name" : "false\/image-before: bounded row payload",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: prefill commits",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: mode observed",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: committed token count",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: draft aligned",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: generation succeeds",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: full greedy output length",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: verify path exercised",
      "passed" : true
    },
    {
      "name" : "false\/image-crossing: bounded row payload",
      "passed" : true
    },
    {
      "name" : "row mode true: runtime selection",
      "passed" : true
    },
    {
      "name" : "true: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "true: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "true: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "true: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "true: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "true: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "true: invalid model input rejected",
      "passed" : true
    },
    {
      "name" : "true: invalid input leaves exact state reusable",
      "passed" : true
    },
    {
      "name" : "true\/cached17: prefill commits",
      "passed" : true
    },
    {
      "name" : "true\/cached17: mode observed",
      "passed" : true
    },
    {
      "name" : "true\/cached17: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "cached17: draft reuses main embedding rows",
      "passed" : true
    },
    {
      "name" : "true\/cached17: committed token count",
      "passed" : true
    },
    {
      "name" : "true\/cached17: draft aligned",
      "passed" : true
    },
    {
      "name" : "true\/cached17: generation succeeds",
      "passed" : true
    },
    {
      "name" : "true\/cached17: full greedy output length",
      "passed" : true
    },
    {
      "name" : "true\/cached17: verify path exercised",
      "passed" : true
    },
    {
      "name" : "true\/cached17: bounded row payload",
      "passed" : true
    },
    {
      "name" : "cached17: all committed state fields and continued logits bit exact",
      "passed" : true
    },
    {
      "name" : "cached17: complete greedy output exact",
      "passed" : true
    },
    {
      "name" : "cached17: identical prefill boundaries",
      "passed" : true
    },
    {
      "name" : "cached17: identical expert work",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: prefill commits",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: mode observed",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "sweep256: draft reuses main embedding rows",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: committed token count",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: draft aligned",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: generation succeeds",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: full greedy output length",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: verify path exercised",
      "passed" : true
    },
    {
      "name" : "true\/sweep256: bounded row payload",
      "passed" : true
    },
    {
      "name" : "sweep256: all committed state fields and continued logits bit exact",
      "passed" : true
    },
    {
      "name" : "sweep256: complete greedy output exact",
      "passed" : true
    },
    {
      "name" : "sweep256: identical prefill boundaries",
      "passed" : true
    },
    {
      "name" : "sweep256: identical expert work",
      "passed" : true
    },
    {
      "name" : "true\/tail273: prefill commits",
      "passed" : true
    },
    {
      "name" : "true\/tail273: mode observed",
      "passed" : true
    },
    {
      "name" : "true\/tail273: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "tail273: draft reuses main embedding rows",
      "passed" : true
    },
    {
      "name" : "true\/tail273: committed token count",
      "passed" : true
    },
    {
      "name" : "true\/tail273: draft aligned",
      "passed" : true
    },
    {
      "name" : "true\/tail273: generation succeeds",
      "passed" : true
    },
    {
      "name" : "true\/tail273: full greedy output length",
      "passed" : true
    },
    {
      "name" : "true\/tail273: verify path exercised",
      "passed" : true
    },
    {
      "name" : "true\/tail273: bounded row payload",
      "passed" : true
    },
    {
      "name" : "tail273: all committed state fields and continued logits bit exact",
      "passed" : true
    },
    {
      "name" : "tail273: complete greedy output exact",
      "passed" : true
    },
    {
      "name" : "tail273: identical prefill boundaries",
      "passed" : true
    },
    {
      "name" : "tail273: identical expert work",
      "passed" : true
    },
    {
      "name" : "true\/long1025: prefill commits",
      "passed" : true
    },
    {
      "name" : "true\/long1025: mode observed",
      "passed" : true
    },
    {
      "name" : "true\/long1025: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "long1025: draft reuses main embedding rows",
      "passed" : true
    },
    {
      "name" : "true\/long1025: committed token count",
      "passed" : true
    },
    {
      "name" : "true\/long1025: draft aligned",
      "passed" : true
    },
    {
      "name" : "true\/long1025: generation succeeds",
      "passed" : true
    },
    {
      "name" : "true\/long1025: full greedy output length",
      "passed" : true
    },
    {
      "name" : "true\/long1025: verify path exercised",
      "passed" : true
    },
    {
      "name" : "true\/long1025: bounded row payload",
      "passed" : true
    },
    {
      "name" : "long1025: all committed state fields and continued logits bit exact",
      "passed" : true
    },
    {
      "name" : "long1025: complete greedy output exact",
      "passed" : true
    },
    {
      "name" : "long1025: identical prefill boundaries",
      "passed" : true
    },
    {
      "name" : "long1025: identical expert work",
      "passed" : true
    },
    {
      "name" : "true\/image-before: prefill commits",
      "passed" : true
    },
    {
      "name" : "true\/image-before: mode observed",
      "passed" : true
    },
    {
      "name" : "true\/image-before: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "image-before: draft reuses main embedding rows",
      "passed" : true
    },
    {
      "name" : "true\/image-before: committed token count",
      "passed" : true
    },
    {
      "name" : "true\/image-before: draft aligned",
      "passed" : true
    },
    {
      "name" : "true\/image-before: generation succeeds",
      "passed" : true
    },
    {
      "name" : "true\/image-before: full greedy output length",
      "passed" : true
    },
    {
      "name" : "true\/image-before: verify path exercised",
      "passed" : true
    },
    {
      "name" : "true\/image-before: bounded row payload",
      "passed" : true
    },
    {
      "name" : "image-before: all committed state fields and continued logits bit exact",
      "passed" : true
    },
    {
      "name" : "image-before: complete greedy output exact",
      "passed" : true
    },
    {
      "name" : "image-before: identical prefill boundaries",
      "passed" : true
    },
    {
      "name" : "image-before: identical expert work",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: prefill commits",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: mode observed",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: unique cold prompt row count",
      "passed" : true
    },
    {
      "name" : "image-crossing: draft reuses main embedding rows",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: committed token count",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: draft aligned",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: generation succeeds",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: full greedy output length",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: verify path exercised",
      "passed" : true
    },
    {
      "name" : "true\/image-crossing: bounded row payload",
      "passed" : true
    },
    {
      "name" : "image-crossing: all committed state fields and continued logits bit exact",
      "passed" : true
    },
    {
      "name" : "image-crossing: complete greedy output exact",
      "passed" : true
    },
    {
      "name" : "image-crossing: identical prefill boundaries",
      "passed" : true
    },
    {
      "name" : "image-crossing: identical expert work",
      "passed" : true
    },
    {
      "name" : "row cache with reusable prefix: exact output",
      "passed" : true
    },
    {
      "name" : "row cache with reusable prefix: retained boundary",
      "passed" : true
    },
    {
      "name" : "row cache with reusable prefix: no checkpoint errors",
      "passed" : true
    },
    {
      "name" : "row cache with reusable prefix: no reread of retained rows",
      "passed" : true
    },
    {
      "name" : "first prefill: embedding read fault actually fired",
      "passed" : true
    },
    {
      "name" : "first prefill: explicit failed completion",
      "passed" : true
    },
    {
      "name" : "first prefill: runtime error propagated",
      "passed" : true
    },
    {
      "name" : "first prefill: committed callback output preserved",
      "passed" : true
    },
    {
      "name" : "first prefill: no invalid state cached",
      "passed" : true
    },
    {
      "name" : "first prefill: pool pins released",
      "passed" : true
    },
    {
      "name" : "first prefill: sweep admission reset",
      "passed" : true
    },
    {
      "name" : "first prefill: allocator restored",
      "passed" : true
    },
    {
      "name" : "first prefill: only committed prefill counted",
      "passed" : true
    },
    {
      "name" : "first prefill: exact committed output prefix",
      "passed" : true
    },
    {
      "name" : "first prefill: retry succeeds",
      "passed" : true
    },
    {
      "name" : "first prefill: retry exactly matches original table",
      "passed" : true
    },
    {
      "name" : "second prefill: embedding read fault actually fired",
      "passed" : true
    },
    {
      "name" : "second prefill: explicit failed completion",
      "passed" : true
    },
    {
      "name" : "second prefill: runtime error propagated",
      "passed" : true
    },
    {
      "name" : "second prefill: committed callback output preserved",
      "passed" : true
    },
    {
      "name" : "second prefill: no invalid state cached",
      "passed" : true
    },
    {
      "name" : "second prefill: pool pins released",
      "passed" : true
    },
    {
      "name" : "second prefill: sweep admission reset",
      "passed" : true
    },
    {
      "name" : "second prefill: allocator restored",
      "passed" : true
    },
    {
      "name" : "second prefill: only committed prefill counted",
      "passed" : true
    },
    {
      "name" : "second prefill: exact committed output prefix",
      "passed" : true
    },
    {
      "name" : "second prefill: retry succeeds",
      "passed" : true
    },
    {
      "name" : "second prefill: retry exactly matches original table",
      "passed" : true
    },
    {
      "name" : "decode: embedding read fault actually fired",
      "passed" : true
    },
    {
      "name" : "decode: explicit failed completion",
      "passed" : true
    },
    {
      "name" : "decode: runtime error propagated",
      "passed" : true
    },
    {
      "name" : "decode: committed callback output preserved",
      "passed" : true
    },
    {
      "name" : "decode: no invalid state cached",
      "passed" : true
    },
    {
      "name" : "decode: pool pins released",
      "passed" : true
    },
    {
      "name" : "decode: sweep admission reset",
      "passed" : true
    },
    {
      "name" : "decode: allocator restored",
      "passed" : true
    },
    {
      "name" : "decode: only committed prefill counted",
      "passed" : true
    },
    {
      "name" : "decode: exact committed output prefix",
      "passed" : true
    },
    {
      "name" : "decode: retry succeeds",
      "passed" : true
    },
    {
      "name" : "decode: retry exactly matches original table",
      "passed" : true
    },
    {
      "name" : "invalid public lookup rejected",
      "passed" : true
    },
    {
      "name" : "invalid public lookup rejected",
      "passed" : true
    },
    {
      "name" : "invalid public lookup rejected",
      "passed" : true
    },
    {
      "name" : "larger public lookup keeps exact shape",
      "passed" : true
    },
    {
      "name" : "larger public lookup preserves every row",
      "passed" : true
    },
    {
      "name" : "direct draft prefill: error propagated",
      "passed" : true
    },
    {
      "name" : "direct draft prefill: read fault fired",
      "passed" : true
    },
    {
      "name" : "direct draft prefill: failed embedding never mutates state",
      "passed" : true
    },
    {
      "name" : "direct draft prefill: incomplete composition is not aligned",
      "passed" : true
    },
    {
      "name" : "direct draft prefill: exact retry restores alignment",
      "passed" : true
    },
    {
      "name" : "empty checked draft chunk rejected",
      "passed" : true
    },
    {
      "name" : "public tensor access preserves all table bytes",
      "passed" : true
    }
  ],
  "measurements" : {
    "resident_loaded_mlx_active_bytes" : 6175340188,
    "resident_loaded_physical_bytes" : 6258757496,
    "rows_loaded_mlx_active_bytes" : 5817743004,
    "rows_loaded_physical_bytes" : 5928718320
  },
  "name" : "optimization-embedding-runtime-mtp",
  "passed" : true
}

````

## .build/optimization/output-tcp-v97/manifest.json

SHA-256 `da3512424887445ad003a32582d7d86a23653d0cd817901071f61240e546e3ce`; 19431 bytes.

````
{
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream",
  "identity": {
    "source": {
      "Makefile": "9a594e9293f729364cc3c6cfd8574bbe383eb7a88d37037067a15a071fde7c0c",
      "Package.resolved": "6fc23da3ddc636949e84042cb70da34bc93c4355feef14857880caa6c3c7fceb",
      "Package.swift": "dc43b13037f7309d0bdb6687c027d265ed3b32f9b25a4c43d2d60ce8480f46f0",
      "Sources/Slotstream/AdaptiveSpeculation.swift": "da8062ff16c1d72ccd28852ba18e43cd434a8165483d045759cd29a499f5fff6",
      "Sources/Slotstream/BlockSelection.swift": "16e5fb4a4ea82728e3caaf3d6f4cdbf7d91614b757b0624913ae14c052d6f27d",
      "Sources/Slotstream/BoundedOutput.swift": "70c21c3583edecdd856af06c2fae567bccaf0ea2005ddb932a7dd99642e7780f",
      "Sources/Slotstream/CacheBookkeeping.swift": "08e4699592062a413e986e0e572aca7504dfa6cf589f5a153f5b22b44a117dc4",
      "Sources/Slotstream/Checkpoint.swift": "8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101",
      "Sources/Slotstream/CompiledArithmetic.swift": "98611b31035459d237d901be7fff175072c30b32b992c7534d770b1bc6d117f2",
      "Sources/Slotstream/Context.swift": "54ba790a7b6a1037d42df912e86b6502f1fd922b33c68166761f1b2ad2d81127",
      "Sources/Slotstream/EmbeddingRows.swift": "10c722abb55b03bd6ae0f8188ec156f97e2a7603a516bd91919e060d8fc5a645",
      "Sources/Slotstream/Engine.swift": "c3e5f8cb8e436ec796eed3e7d3455d2335630d190c9a368f20b2476000e9eba8",
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
      "Sources/Slotstream/Model.swift": "fa7eab985c60fa493952a3aa86f6a5d163d88038f9b027ebfa9ab8db81c6e52d",
      "Sources/Slotstream/NgramPrefetch.swift": "7342c07a6b475ea8d8568b08e041b0ffb0d35456892e79aaac6197db08b2e03c",
      "Sources/Slotstream/NgramStore.swift": "4795f1930c3660ca2f0c57e9ae8ced9ce162d251426b948d5159fdb46df60965",
      "Sources/Slotstream/Observation.swift": "fcb7557541a5a0ce885737449d6b2b88009a8521a7c743cded5d120867529e10",
      "Sources/Slotstream/OpenAIDialect.swift": "714263f4382c83835c4e617ffcb72e231c270a0f0d8be497881cdfc663d52f58",
      "Sources/Slotstream/OpenAIOutput.swift": "d13c9a29f3dbcf9fb9933e5a378f3ba8160d7eb4f96d3c7a61f3faed5a563b76",
      "Sources/Slotstream/Optimizations.swift": "1580af3cd7a6c728b6dfac524acac25742e0939deccaccaa82173aa5a19bd0ae",
      "Sources/Slotstream/PackedExpertLayout.swift": "85f7c3a0dcbc8822f460d93600110e56e5978a60b646d2799872074582fd8778",
      "Sources/Slotstream/PinnedModel.swift": "0c7c16539bcb54924ff7306b03b470e2915b5bb41c4ecff9e60dc7912e7afdd2",
      "Sources/Slotstream/Plan.swift": "e3558df91f1caa5b9cd9ed2d15137c3cb35c7f25d4d87c914f653ac20737b449",
      "Sources/Slotstream/PrefixCache.swift": "9bb9ad731a24e3fb84e15c92401d97f6677859553bfd15d23d541ae9be87bc01",
      "Sources/Slotstream/PressureBoundary.swift": "8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468",
      "Sources/Slotstream/ProcessMemory.swift": "bf0547e6884195915076c8a37056865a7a77eef61c1f3d4ba07c7ab849371d4e",
      "Sources/Slotstream/RouterProjection.swift": "726cb2391a95731304989e58d2f44dcab0076e3a5fb442710b8bd57aa4fdde8f",
      "Sources/Slotstream/RouterSelection.swift": "35b122748ab05c00122bfb5b4c78416ee28b55abaa4d4e1379fd163aaf47b4a6",
      "Sources/Slotstream/RouterTrace.swift": "b34c1974f60015c913649a285023e57b15d92f37c2f7aa282b821eb2043652c1",
      "Sources/Slotstream/SelectedAttention.swift": "70e61a089444f74cc74494d7f05005b0ff4dfe67043782befbbef80d96b911db",
      "Sources/Slotstream/Server.swift": "366712c513ce926e31fdddcadf6103877714f053d3b8767b05d30c7b5215b137",
      "Sources/Slotstream/SlotWritePlan.swift": "a9d3f598f340dd5ae3ce0a233374f5e28f053afe3c64819955d3d5268e631c69",
      "Sources/Slotstream/StatePrefixFork.swift": "b21e2da892dfe6024de879c42c4ffe89dc19ad1b22a1b8fcbebeba17324e2fba",
      "Sources/Slotstream/ToolCallSplitter.swift": "2c2e1d722188d633508c871d73f011fa4053b666d10b7585b304c151c53925a8",
      "Sources/Slotstream/Vendored/GatedDelta.swift": "ac0a81ccd99ebb59a52ad0728221f34c59d2402d255b4e6a9cbb583b7d42dd6f",
      "Sources/Slotstream/Version.swift": "baf6f1d9b251c7876e1379e7bf207e77b7837ca366254bdc03c7d35318debe10",
      "Sources/Slotstream/Vision.swift": "ffe37bc6bab7c34b9ccdf39a1dc573feaa52429eec2944bb7c879069efec8fe1",
      "Sources/Slotstream/VisionAttention.swift": "9d4a32ac105339ae6403f400a5459e47791953e687388234535bab429384cd1f",
      "Sources/Slotstream/VisionPrompt.swift": "4f999e6f6109ef563116505429fa38842fc165f9f6921c62d5b29919b1a17a2a",
      "Sources/Slotstream/WeightDownload.swift": "eaef2e57dc19e0d8e5b5ffefc6f46b67cf94302a932ccb7447e2f4ebb90d0a13",
      "Sources/Slotstream/WeightStore.swift": "75612e68e81ff9561155c0131d518960ab136e04f871fd7258dfd9d0f03ed723",
      "Sources/Slotstream/Weights.swift": "69a422597f7b28628a49c8b4a9d5f77ae670ff387c6b33610927bccf6352139f",
      "Sources/Slotstream/WordSlotWrite.swift": "1c19def2346669acc1afa811a7244233c6f593de91c02bfc4ff145465b95187e",
      "Sources/SlotstreamDiagnostics/CheckReport.swift": "9bbe2106b5b55331cc3fbc093edd803eff6f9f00ebd5f30ce587754fe0bc7e47",
      "Sources/SlotstreamDiagnostics/Diagnostics+AdaptiveSpeculation.swift": "35fd21eb0b356a47f2cc8e61e1afb6cccb657ebadf11120cf38088fc7155fad9",
      "Sources/SlotstreamDiagnostics/Diagnostics+AllHitReplay.swift": "187a98c70c2e66008622db3727f0bf58126928862bc102782574fa0ba5f57513",
      "Sources/SlotstreamDiagnostics/Diagnostics+BlockSelection.swift": "08d3f1fc29b6353443b795198295bacb85f57d0a2bdbac67450cf66d505f852c",
      "Sources/SlotstreamDiagnostics/Diagnostics+CacheBookkeeping.swift": "9753dadab24d3f37030e4d52f0df57816d8c4803fcfde457a9c5320dfaa829b8",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompactIndexer.swift": "3dd65c8fac32f2804cce942845946debe74ca83b9cf6485a441ed15331711a5b",
      "Sources/SlotstreamDiagnostics/Diagnostics+CompiledNorm.swift": "9f1beb774172bc33a27020261532e06723f0794adba9ab5dbca7807d01a0748f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRows.swift": "a0f0532a43c1329b3a69f8a3bd8607df9f27793c0994ad23203936896b44e81f",
      "Sources/SlotstreamDiagnostics/Diagnostics+EmbeddingRuntime.swift": "c5c37fafb45b2ac2434a36cd7c8b8804fac0e271e9e3f0fb10ef97481db77e24",
      "Sources/SlotstreamDiagnostics/Diagnostics+ExactRead.swift": "77a357f55c3f5aced5ba0d74012e35f73e678e0840024f24a5ab86909d335c59",
      "Sources/SlotstreamDiagnostics/Diagnostics+GDNProfile.swift": "6d982a575d6c6282941a9f9f3ac063b75d31996fcde387a63ca3ce44fea93242",
      "Sources/SlotstreamDiagnostics/Diagnostics+Governor.swift": "8ec85ff3609cd5657eae1a8434189e9474460aad0c850f6b88240457c8f0f1fc",
      "Sources/SlotstreamDiagnostics/Diagnostics+HTTP.swift": "9526e51122c9e463ea9a3201da6e4628f3794f329bd4ca05f1496daf3c66c1e5",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageFailure.swift": "766742295107f924177f7f724a7be61f8ccb29b3e044a7de345523598c31cead",
      "Sources/SlotstreamDiagnostics/Diagnostics+ImageReuse.swift": "5c10b0526d372d50abe8b5b174cc60d430374145626fbb0cb7e280e4cbd1a954",
      "Sources/SlotstreamDiagnostics/Diagnostics+LayerLocalVictim.swift": "d512d93741a6675412cc9e6c739b940132ca3f20ebecd709884b00b1ebbc49b7",
      "Sources/SlotstreamDiagnostics/Diagnostics+MTPIndexer.swift": "7784a18a1eddafa25ecaee9eeacfbcddf8bcabac8d53919f80367a4f4e5be476",
      "Sources/SlotstreamDiagnostics/Diagnostics+Machine.swift": "20f6edb816fc3a794143042e59847adbfc1fe06514fc990e8a3d81eb87abe50c",
      "Sources/SlotstreamDiagnostics/Diagnostics+NgramLookahead.swift": "3b0bc7ea21a57d2ce65e58773879f5f86ba7f0f37c47d8f1d08d51e61c486370",
      "Sources/SlotstreamDiagnostics/Diagnostics+Optimization.swift": "b34641c832105349a8e86eef6940bebc396b2b0cc5be77c3dcadc919b0f8a502",
      "Sources/SlotstreamDiagnostics/Diagnostics+Output.swift": "3af6d9dfee1c5b00690184102e288572465ab5faa7a9e901d886382887dbf57c",
      "Sources/SlotstreamDiagnostics/Diagnostics+PackedLayout.swift": "e30e986b5c564ea5dd76c720195f8dc6408469bca6e8c5cc369f53c762f6d7b4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PoolRequests.swift": "93693f1cce0bab9c55b4c3273da3c7143461ad47807e9bb552dd68866b1a3f4d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefillQualification.swift": "3e1304cc936cc80d2dbd102a710916ada430e7b1f814ae858731f5b4b856720d",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixFork.swift": "e7a7094b3930cef8e380d711f20e8f82e2821c070579549692a6120e9ba3afc4",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixRetention.swift": "b316984ad68c3bc2aaf45a88fd7a0d55ba703a08f206623e5420b4e2a7d70237",
      "Sources/SlotstreamDiagnostics/Diagnostics+PrefixVision.swift": "5e4737dbe5344492fc2f9c6881f8d56e997668f674c91b28b9349c9420465f72",
      "Sources/SlotstreamDiagnostics/Diagnostics+PressureBoundary.swift": "67acc8c57a94801c1ac2166ced44f11690cf893f3409ee853b2dd679c0382a00",
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
      "Sources/SlotstreamDiagnostics/Diagnostics+SlotSlices.swift": "1870c2069784145041061d98df97e204df719cc0e81fa01ef4e8265b32577b95",
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
      "Sources/slotstream-cli/OptimizationCommands.swift": "d94bfcceca11ba4204002e4c5992195be4e8e58522f8015aad8baa9a7891d463",
      "Sources/slotstream-cli/PackedExpertCommands.swift": "ea7f4485d60a985a0a1f759f077d28dc42f36512dc1dd07a7644a22e31346b12",
      "Sources/slotstream-cli/Pull.swift": "4531a18806150c1c3d36fb44bba8ebee4be26eeb255966ef6dd5bb61a0bc77ab",
      "Sources/slotstream-cli/SweepCommands.swift": "37455d724a63b1689208dce9d55cd3d249bcab6d45bdf40d5c5e4f6992aa0d20",
      "Sources/slotstream-cli/VisionCommands.swift": "29612d2718989c2eb5c23bfe425819b643f866d21f55cb09551b2dda1a77c2d9",
      "Sources/slotstream-cli/main.swift": "4bb7f13a6b31d4e348db3b4dff93707a52be7606302a120b94b3a4ebb933f462",
      "Tools/build_identity.py": "862a686bd08306998e75a62d0689cbc4f92adc80dbe9357f84cd9a6f00db6874",
      "Tools/fetch_metallib.sh": "c47f5531c4195bfe1f827ba1049b76cb81687401b9e25e2a3cc4c9d7feb64860"
    },
    "source_archive_sha256": "d40cf213aef5f785500ae38d165b4e453dd157688e68a24181fba87599fb964c",
    "binary_sha256": "e2e97ff50329cc20e369b9582e009f2c3f0bd24938490d07c50a9ebe40c3047b",
    "metallib_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597"
  },
  "required_reclaimable_gb": 13,
  "timeout_seconds": 60,
  "command": [
    "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream",
    "optimization-state-check",
    "--model",
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
    "--variant",
    "output-tcp",
    "--json"
  ],
  "environment": {},
  "classification": "correctness only; not timing evidence",
  "passed": false,
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31109906432,
    "swapins": 41724079,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   543659.\nPages active:                                 803353.\nPages inactive:                               632042.\nPages speculative:                            169200.\nPages throttled:                                   0.\nPages wired down:                             222854.\nPages purgeable:                                  10.\n\"Translation faults\":                    14174992205.\nPages copy-on-write:                       651041812.\nPages zero filled:                       17462274789.\nPages reactivated:                        2827455966.\nPages purged:                               64936829.\nFile-backed pages:                           1355129.\nAnonymous pages:                              249466.\nPages stored in compressor:                  1898309.\nPages occupied by compressor:                 711754.\nDecompressions:                            997387108.\nCompressions:                             1294193673.\nPageins:                                  6485274154.\nPageouts:                                   10783828.\nSwapins:                                    41724079.\nSwapouts:                                   69922789.\nPages tagged:                                 168748.\nPages tagged resident:                        111430.\nPages tagged compressed:                       57318.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6835.\nPages tag-storage free:                         2716.\nPages tag-storage non-tag pageable:            88745.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9659840.\nTagged compressions:                         9900357.\nTagged decompressions:                       9110832.\n"
  },
  "preflight_wait": {
    "seconds": 0.002762500000000001,
    "attempts": 1,
    "limit_seconds": 1800
  },
  "exit_code": 1,
  "result_key": "passed",
  "assertions": 38,
  "duration_seconds": 0.20763541700000002,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 31112609792,
    "swapins": 41724079,
    "swapouts": 69922789,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   543797.\nPages active:                                 802843.\nPages inactive:                               632668.\nPages speculative:                            169248.\nPages throttled:                                   0.\nPages wired down:                             222855.\nPages purgeable:                                  10.\n\"Translation faults\":                    14174994669.\nPages copy-on-write:                       651042158.\nPages zero filled:                       17462275031.\nPages reactivated:                        2827455966.\nPages purged:                               64936829.\nFile-backed pages:                           1355156.\nAnonymous pages:                              249603.\nPages stored in compressor:                  1898179.\nPages occupied by compressor:                 711672.\nDecompressions:                            997387238.\nCompressions:                             1294193673.\nPageins:                                  6485274207.\nPageouts:                                   10783828.\nSwapins:                                    41724079.\nSwapouts:                                   69922789.\nPages tagged:                                 168745.\nPages tagged resident:                        111429.\nPages tagged compressed:                       57316.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6835.\nPages tag-storage free:                         2708.\nPages tag-storage non-tag pageable:            88753.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    9659712.\nTagged compressions:                         9900357.\nTagged decompressions:                       9110834.\n"
  }
}

````

## .build/optimization/output-tcp-v97/stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`; 0 bytes.

````

````

## .build/optimization/output-tcp-v97/stdout.txt

SHA-256 `6053f27e39a17823c2c473094bd16e78c30950ee2383d6aedfbc9c5a3957b3bb`; 3271 bytes.

````
{
  "items" : [
    {
      "name" : "output queue is opt-in",
      "passed" : true
    },
    {
      "name" : "typed output queue control",
      "passed" : true
    },
    {
      "name" : "empty queue finishes",
      "passed" : true
    },
    {
      "name" : "finished queue rejects new bytes",
      "passed" : true
    },
    {
      "name" : "empty queue writes nothing",
      "passed" : true
    },
    {
      "name" : "finish is idempotent",
      "passed" : true
    },
    {
      "name" : "enqueue fragment 0",
      "passed" : true
    },
    {
      "name" : "enqueue fragment 1",
      "passed" : true
    },
    {
      "name" : "enqueue fragment 2",
      "passed" : true
    },
    {
      "name" : "enqueue fragment 3",
      "passed" : true
    },
    {
      "name" : "ordered frames drain",
      "passed" : true
    },
    {
      "name" : "descriptor flags restored after joining",
      "passed" : true
    },
    {
      "name" : "byte-exact FIFO across scalar and framing splits",
      "passed" : true
    },
    {
      "name" : "written frame count",
      "passed" : true
    },
    {
      "name" : "queued bytes",
      "passed" : true
    },
    {
      "name" : "written bytes",
      "passed" : true
    },
    {
      "name" : "first socket write observed",
      "passed" : true
    },
    {
      "name" : "owned storage bounded",
      "passed" : true
    },
    {
      "name" : "oversized frame rejected atomically",
      "passed" : true
    },
    {
      "name" : "oversized frame cancels producer",
      "passed" : true
    },
    {
      "name" : "oversized frame drain fails",
      "passed" : true
    },
    {
      "name" : "oversized frame never queued",
      "passed" : true
    },
    {
      "name" : "oversized frame never written",
      "passed" : true
    },
    {
      "name" : "one in-flight frame accepted",
      "passed" : true
    },
    {
      "name" : "in-flight frame counts toward saturation",
      "passed" : true
    },
    {
      "name" : "saturation never blocks inference callback",
      "passed" : true
    },
    {
      "name" : "saturated writer joins with failure",
      "passed" : true
    },
    {
      "name" : "saturation cleanup is bounded",
      "passed" : true
    },
    {
      "name" : "saturated owned storage bounded",
      "passed" : true
    },
    {
      "name" : "stalled-peer frame accepted",
      "passed" : true
    },
    {
      "name" : "non-reading peer times out",
      "passed" : true
    },
    {
      "name" : "stalled peer cannot extend drain deadline",
      "passed" : true
    },
    {
      "name" : "socket stalls observed",
      "passed" : true
    },
    {
      "name" : "queued and written bytes stay distinct",
      "passed" : true
    },
    {
      "name" : "partial frame is not a written frame",
      "passed" : true
    },
    {
      "name" : "disconnected peer fails without SIGPIPE",
      "passed" : false
    },
    {
      "name" : "disconnect latched for cancellation",
      "passed" : true
    },
    {
      "detail" : "got 1, want 0",
      "name" : "disconnected frame not delivered",
      "passed" : false
    }
  ],
  "measurements" : {

  },
  "name" : "optimization-bounded-output-tcp",
  "passed" : false
}

````

## .build/optimization/embedding-resource-protocol-v97.json

SHA-256 `e3f2ed3173b0e48f43a656b4d17c7205cc4eb848ccf0a0215fb9ddb356d71e3e`; 3178 bytes.

````
{
  "label": "packed-input-embedding-serving-resource-v97",
  "classification": "Prospective packed input-embedding memory-benefit and latency-nonregression qualification; runtime gates must pass before execution",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/prose.txt",
  "fixture_sha256": "3e24e245accdfb9c3b4482a3079eec4787b0746adfc6a65714eb6e6213de630b",
  "memory_gb": 8.1,
  "mtp": "off",
  "raw": true,
  "max_tokens": 16,
  "minimum_output_tokens": 16,
  "seed": 7,
  "rounds": 7,
  "arms": {
    "reference": {
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_EMBEDDING_ROWS": "0"
      },
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream"
    },
    "rows": {
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_EMBEDDING_ROWS": "1"
      },
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream"
    }
  },
  "comparison_basis": "fixed-pool",
  "maximum_sampled_footprint_bytes": 8100000000,
  "require_nominal_power_state": true,
  "between_cells_seconds": 60,
  "model_reservation_wait_seconds": 1800,
  "acceptance": {
    "minimum_pairs": 5,
    "maximum_median_client_regression": 0.05,
    "minimum_positive_fraction": 0,
    "minimum_active_savings_bytes": 300000000,
    "minimum_sampled_peak_savings_bytes": 200000000,
    "all_outputs_exact": true,
    "replacement_rounds": 0
  },
  "conditions": "Same fixed pool and total memory plan; no credit for theoretical table savings, no prefix reuse, exact output IDs/wire text and equal prompt/decode work. Each fresh server gets one full warmup and one measured 440-token raw prose request with16greedy outputs. Input embedding lookup alone is streamed into at most8192packed cached rows; output head remains resident. Public tensor access remains available but is not invoked in this ordinary serving workload. Every clean pair must save at least300MB of MLX active memory and200MB of sampled physical peak; median client regression may not exceed5percent. This is a resource criterion, not a positive speed claim. Whole measured swap intervals exclude whole pairs, nominal OS power/thermal state required, no replacements or changed gates. Report fresh-process startup/first-job separately; filesystem cache is not asserted cold. Symmetric reserved60second cooldown; no workspace commands during performance cells. Requires prior component, full-state, greedy/MTP/image/prefix and checked-read recovery qualification. Exact binary identity is bound before first measurement.",
  "frozen_binary_sha256": "e2e97ff50329cc20e369b9582e009f2c3f0bd24938490d07c50a9ebe40c3047b"
}

````

## .build/optimization/larger-prefill-scope-feasibility-protocol-v97.json

SHA-256 `b07f3b4b93cca38440215c1f4f8b00d1c535a0b90df63b6d44396e0a7f4e01a4`; 3414 bytes.

````
{
  "label": "larger-plan-prefill-scope-feasibility-v97",
  "classification": "Prospective two-cell16GB feasibility/resource study; no speed qualification or extrapolation from the failed10GB regime",
  "binary": "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream",
  "model": "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit",
  "fixture": "/Users/carlos/Projects/slotstream/Tools/fixtures/optimization/code.txt",
  "fixture_sha256": "bc0fc77db83ec16a8100b57d5d06d68ddd7aecf3ceedc8a410699418086124c8",
  "memory_gb": 16,
  "mtp": "off",
  "raw": true,
  "max_tokens": 1,
  "seed": 7,
  "rounds": 1,
  "minimum_output_tokens": 1,
  "arms": {
    "reference": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_PLE_TILES": "1"
      }
    },
    "scope": {
      "binary": "/Users/carlos/Projects/slotstream/.build/optimization/embedding-runtime-build-v97/candidate/slotstream",
      "chunk": 256,
      "env": {
        "SLOTSTREAM_OPT_COMPACT_STATE": "1",
        "SLOTSTREAM_OPT_COMPACT_MTP": "1",
        "SLOTSTREAM_OPT_FINAL_FORWARD": "1",
        "SLOTSTREAM_OPT_INDEXER_TILES": "1",
        "SLOTSTREAM_OPT_PLE_TILES": "1",
        "SLOTSTREAM_OPT_LAYER_WORKSPACE": "1",
        "SLOTSTREAM_OPT_READ_SCOPE": "1024",
        "SLOTSTREAM_OPT_WORKSPACE_TILE": "256",
        "SLOTSTREAM_OPT_SCOPE_FRONTIER": "1"
      }
    }
  },
  "large_scope_measurement": {
    "purpose": "Test whether the implemented1024token read scope fits a deliberately16GB total plan at fixed256row compute, after failing the10GB budget; not routine large-memory stress or a speed claim"
  },
  "abort_on_resource_failure": true,
  "require_nominal_power_state": true,
  "maximum_sampled_footprint_bytes": 16000000000,
  "between_cells_seconds": 60,
  "comparison_basis": "fixed-pool",
  "conditions": "Exactly16GB plan and8192context cap for both arms, with one raw immutable code prompt and one emitted token. Same compact windows/MTP row/final-forward/bounded indexer/PLE; candidate uses1024read scope,256workspace tile,compact frontier, and retains short final pass in its original cached kernel family. One process; no memory-pressure injection or device-availability override. Base headroom22GB plus candidate workspace/scope allowance3.1184GB. Fresh server, one warmup and one measured request per arm; symmetric60s cooldown, no workspace commands during cells. Abort after any resource/OS-power failure; preserve all results. Correctness/work-count/footprint feasibility only. A successful pilot earns a separately frozen interleaved qualification; never quote this single pair as a speedup. Native V97 preserves the V95-qualified committed-state guard, and embedding row mode is off in both arms. The harness holds the actual model reservation during each symmetric60second cooldown, after waiting at most1800seconds for another task to finish. Original V92 feasibility protocol remains unrun and preserved.",
  "frozen_binary_sha256": "e2e97ff50329cc20e369b9582e009f2c3f0bd24938490d07c50a9ebe40c3047b",
  "model_reservation_wait_seconds": 1800
}

````

## Tools/optimization_build.py

SHA-256 `20de4ceb65a7ada8ef92b77d9c8c53aaf8f52cb58e71b4eaf6726db7d3303642`; 4438 bytes.

````
#!/usr/bin/env python3
"""Build/freeze an optimization candidate while holding the model-process lock.

This task-specific driver refuses before invoking make on contention or low
headroom. It holds the lock through compilation and snapshot publication, so
a model cannot start in the interval after preflight. Ordinary make is unchanged.
"""
import argparse
import fcntl
import json
import os
from pathlib import Path
import shutil
import subprocess
import time

from prefill_bench import ROOT, digest, vm_snapshot, InsufficientHeadroom
from serve_bench import verified_build


def build(root, output, *, required_gb=13, snapshot=vm_snapshot, run=subprocess.run,
          lock_path=None, wait_seconds=0):
    root, output = Path(root).resolve(), Path(output).resolve()
    if type(required_gb) not in (int, float) or not 7 <= required_gb <= 20:
        raise ValueError('build headroom must be between 7 and 20 GB')
    if type(wait_seconds) is not int or not 0 <= wait_seconds <= 1800:
        raise ValueError('build reservation wait must be an integer from zero to1800seconds')
    output.mkdir(parents=True, exist_ok=False)
    record = {'classification': 'build only; no runtime performance evidence',
              'required_reclaimable_gb': required_gb, 'model_lock_held_during_build': False,
              'passed': False, 'command': ['make', 'build'], 'working_directory': str(root),
              'reservation_wait_limit_seconds': wait_seconds}
    started = time.monotonic()
    try:
        with open(lock_path or f'/tmp/slotstream-model-{os.getuid()}.lock', 'a') as lock:
            waiting = time.monotonic(); attempts = 0; notified = -30.0
            while True:
                attempts += 1
                try:
                    fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
                    break
                except BlockingIOError as e:
                    elapsed = time.monotonic()-waiting
                    if elapsed >= wait_seconds:
                        raise RuntimeError('another model/build holds the model-process lock; make was not invoked') from e
                    if elapsed-notified >= 30:
                        print(json.dumps({'phase':'waiting for build reservation','seconds':round(elapsed,1)}),flush=True)
                        notified = elapsed
                    time.sleep(min(2,wait_seconds-elapsed))
            record['reservation_wait'] = {'seconds':time.monotonic()-waiting,'attempts':attempts}
            record['model_lock_held_during_build'] = True
            record['before'] = snapshot()
            if record['before']['reclaimable_bytes'] < required_gb * 1e9:
                raise InsufficientHeadroom('insufficient reclaimable memory; make was not invoked')
            with (output/'build.txt').open('wb') as log:
                result = run(record['command'], cwd=root, stdout=log, stderr=subprocess.STDOUT)
            record['exit_code'] = result.returncode
            if result.returncode != 0: raise RuntimeError(f'make failed with exit code {result.returncode}; no candidate frozen')
            release = root/'.build/release'
            verified_build(release/'slotstream')
            candidate = output/'candidate'
            candidate.mkdir()
            for name in ['slotstream','slotstream-checks','mlx.metallib','build-identity.json','build-source.tar.gz']:
                shutil.copy2(release/name, candidate/name)
            record['frozen'] = verified_build(candidate/'slotstream')
            record['checks_sha256'] = digest(candidate/'slotstream-checks')
            record['passed'] = True
    except Exception as error:
        record['error'] = f'{type(error).__name__}: {error}'
    finally:
        record['elapsed_seconds'] = time.monotonic()-started
        record['after'] = snapshot()
        (output/'manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    return record


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--wait-for-model-seconds', type=int, default=0)
    args = parser.parse_args()
    record = build(ROOT, args.out, wait_seconds=args.wait_for_model_seconds)
    print(json.dumps({k:record[k] for k in ['passed','error','elapsed_seconds','checks_sha256'] if k in record}), flush=True)
    return 0 if record['passed'] else 1


if __name__ == '__main__': raise SystemExit(main())

````

## Tools/optimization_build_test.py

SHA-256 `a798f7848b419963fbd57a255bc3a8c1bc2729e303e39c65a03a2b040e58ad02`; 3663 bytes.

````
import fcntl
import json
from pathlib import Path
from tempfile import TemporaryDirectory
from types import SimpleNamespace
import unittest
from unittest.mock import Mock, patch

from optimization_build import build


class BuildTests(unittest.TestCase):
    def test_waiting_never_builds_until_reservation_is_owned(self):
        with TemporaryDirectory() as d:
            path=Path(d)/'lock'
            with path.open('a') as holder:
                fcntl.flock(holder,fcntl.LOCK_EX | fcntl.LOCK_NB)
                run=Mock(return_value=SimpleNamespace(returncode=2))
                def release(seconds):
                    run.assert_not_called()
                    fcntl.flock(holder,fcntl.LOCK_UN)
                with patch('optimization_build.time.sleep',side_effect=release):
                    result=build(d,Path(d)/'out',snapshot=lambda:{'reclaimable_bytes':20_000_000_000},
                        run=run,lock_path=path,wait_seconds=1)
                run.assert_called_once()
                self.assertEqual(result['reservation_wait']['attempts'],2)
                self.assertTrue(result['model_lock_held_during_build'])
                self.assertFalse(result['passed'])
        for value in [True,-1,1801,1.5,None]:
            with self.assertRaises(ValueError): build('/unused','/unused',wait_seconds=value)

    def test_locked_model_prevents_make(self):
        with TemporaryDirectory() as d:
            path = Path(d)/'lock'
            with path.open('w') as lock:
                fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
                run = Mock()
                result = build(d, Path(d)/'out', snapshot=lambda: {'reclaimable_bytes': 20_000_000_000}, run=run, lock_path=path)
                self.assertFalse(result['passed']); run.assert_not_called()
                self.assertIn('make was not invoked', result['error'])

    def test_headroom_refuses_before_make(self):
        with TemporaryDirectory() as d:
            run = Mock()
            result = build(d, Path(d)/'out', snapshot=lambda: {'reclaimable_bytes': 12_999_999_999}, run=run, lock_path=Path(d)/'lock')
            self.assertFalse(result['passed']); run.assert_not_called()
            self.assertTrue(result['model_lock_held_during_build'])

    def test_lock_stays_held_through_make_and_failure_never_freezes(self):
        with TemporaryDirectory() as d:
            path = Path(d)/'lock'
            def run(*args, **kwargs):
                with path.open('a') as second:
                    with self.assertRaises(BlockingIOError): fcntl.flock(second, fcntl.LOCK_EX | fcntl.LOCK_NB)
                return SimpleNamespace(returncode=2)
            result = build(d, Path(d)/'out', snapshot=lambda: {'reclaimable_bytes': 13_000_000_000}, run=run, lock_path=path)
            self.assertFalse(result['passed']); self.assertEqual(result['exit_code'], 2)
            self.assertFalse((Path(d)/'out/candidate').exists())
            with path.open('a') as released: fcntl.flock(released, fcntl.LOCK_EX | fcntl.LOCK_NB)
            self.assertEqual(json.loads((Path(d)/'out/manifest.json').read_text()), result)

    def test_invalid_identity_never_freezes(self):
        with TemporaryDirectory() as d, patch('optimization_build.verified_build', side_effect=ValueError('identity mismatch')):
            result = build(d, Path(d)/'out', snapshot=lambda: {'reclaimable_bytes': 13_000_000_000},
                           run=lambda *a, **kw: SimpleNamespace(returncode=0), lock_path=Path(d)/'lock')
            self.assertFalse(result['passed']); self.assertFalse((Path(d)/'out/candidate').exists())


if __name__ == '__main__': unittest.main()

````

## Tools/serve_bench.py

SHA-256 `9a5bae32bee06042f514ee97870548c4a374060cf3f992bdf8c5499dea53b7b0`; 35971 bytes.

````
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


def summaries(rows, reference, comparison_basis='fixed-pool'):
    if comparison_basis not in ['fixed-pool', 'fixed-total-memory']:
        raise ValueError('comparison_basis must be fixed-pool or fixed-total-memory')
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
    cooldown = cell_cooldown(protocol)
    reservation_wait = reservation_wait_limit(protocol)
    comparison_basis = protocol.get('comparison_basis', 'fixed-pool')
    summaries([], 'reference', comparison_basis)
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
    summary=summaries(rows,next(iter(arms)),comparison_basis)
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

SHA-256 `4829a5e49833e066f1f52f323134dca73f730040463d110c26e03b14968b1ae1`; 31646 bytes.

````
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

