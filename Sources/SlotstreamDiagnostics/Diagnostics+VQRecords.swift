import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Full real expert matrices composed through routed SwiGLU. These
    /// fixtures exercise immutable staging and synchronous bank ownership.
    /// They do not run a complete model or admit candidates to Engine.load.
    public static func quantizationRecords(directory: URL, sourceDirectory: URL? = nil,
                                           inventory: URL? = nil, prefill: Bool = false,
                                           parallelPrefillReads: Bool = false) throws -> CheckReport {
        struct Projection: Decodable {
            let columns: Int, dimensions: Int, entries: Int, group_size: Int
            let packing: String
        }
        struct Fixture: Decodable {
            let path: String, sha256: String
            let bytes: Int, layer: Int
            let expert_ids: [UInt32]
            let projections: [Projection]
        }
        struct Manifest: Decodable {
            struct Artifact: Decodable { let inventory_sha256: String }
            let execution_profile: VQReferenceExecution?
            struct Flags: Decodable {
                let _FUSED_GEMM: Bool, _FUSED_GEMM_V2: Bool, _GEMMSEG_BF16IO: Bool
                let _GEMMSEG_OT2: Bool, _GEMMSEG_PH2V: Bool, _GEMMSEG_DSTORE: Bool
                let _GEMMSEG_PIPE: Bool, _GEMMSEG_XT_PAD: Bool, _SPEC_KERNELS: Bool
                let _GEMMSEG_RTILE: Int, VQ_FUSED_MAX_N: Int
                var matches: Bool {
                    _FUSED_GEMM && _FUSED_GEMM_V2 && !_GEMMSEG_BF16IO && _GEMMSEG_OT2 && _GEMMSEG_PH2V
                    && !_GEMMSEG_DSTORE && !_GEMMSEG_PIPE && !_GEMMSEG_XT_PAD && _SPEC_KERNELS
                    && _GEMMSEG_RTILE == 32 && VQ_FUSED_MAX_N == 4096
                }
            }
            let schema: Int
            let runtime_sha256: String
            let fixtures: [Fixture]
            let artifact: Artifact
            let prefill_flags: Flags?
            let layer_coverage: String?
        }
        func read(_ path: URL, limit: Int) throws -> Data {
            let file = try FileHandle(forReadingFrom: path)
            defer { try? file.close() }
            guard let bytes = try file.read(upToCount: limit + 1), !bytes.isEmpty, bytes.count <= limit else {
                throw ModelError("VQ record fixture exceeds its bounded read")
            }
            return bytes
        }
        let manifest = try JSONDecoder().decode(Manifest.self,
            from: read(directory.appendingPathComponent("records.json"), limit: 1_000_000))
        let layers: Set<Int>
        if let coverage = manifest.layer_coverage {
            guard coverage == "allocation-classes-v1" else { throw ModelError("unknown VQ record coverage profile") }
            switch manifest.artifact.inventory_sha256 {
            case "098c79fea05981b86145109a76cfcba5a22c51d4738cd3e9f00c23ae6d8531fe": layers = [0, 2]
            case "a30ded4e88270d33dfcca8e9b6c414a69cf82f0ad27d20bb3fe71b2b1c14ccac": layers = [0, 3]
            case "4f63194dec2e4c3bec31289d6503cc7c886685e16e7c4aac58116d4cf0c7f037": layers = [0, 2, 27]
            default: throw ModelError("VQ allocation-class coverage requires an inspected artifact")
            }
        } else {
            guard manifest.artifact.inventory_sha256 != "4f63194dec2e4c3bec31289d6503cc7c886685e16e7c4aac58116d4cf0c7f037" else {
                throw ModelError("VQ 2.1 fixtures require all three allocation classes")
            }
            layers = [0, 2]
        }
        guard manifest.schema == 1, manifest.fixtures.count == layers.count,
              Set(manifest.fixtures.map(\.layer)) == layers,
              manifest.runtime_sha256 == "1685ec90feb24e421c379ae4e3594f659478905d2c1393617990d84d3f514ee8" else {
            throw ModelError("VQ record fixtures need the pinned runtime and specified layer set")
        }
        guard !parallelPrefillReads || (prefill && sourceDirectory != nil && inventory != nil),
              !prefill || (manifest.prefill_flags?.matches == true &&
                (parallelPrefillReads || (sourceDirectory == nil && inventory == nil))) else {
            throw ModelError("VQ prefill fixtures require pinned segmented arithmetic; direct-source prefill needs explicit bounded parallel reads")
        }
        try VQReferenceExecution.validate(inventorySHA: manifest.artifact.inventory_sha256,
            runtimeSHA: manifest.runtime_sha256, profile: manifest.execution_profile)
        try ModelProcessGuard.acquire()
        let requiredHeadroom = prefill ? 7_000_000_000 : 5_000_000_000
        guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= requiredHeadroom else {
            throw ModelError("VQ record checks need \(requiredHeadroom / 1_000_000_000) GB actual reclaimable memory")
        }
        let oldCache = MLX.Memory.cacheLimit, oldLimit = MLX.Memory.memoryLimit
        MLX.Memory.cacheLimit = 64_000_000; MLX.Memory.memoryLimit = min(oldLimit, prefill ? 2_000_000_000 : 1_600_000_000)
        defer {
            Stream.gpu.synchronize(); MLX.Memory.clearCache()
            MLX.Memory.cacheLimit = oldCache; MLX.Memory.memoryLimit = oldLimit
        }
        var c = CheckBuilder(prefill ? "quantization-prefill" : "quantization-records")
        guard (sourceDirectory == nil) == (inventory == nil) else { throw ModelError("VQ source and inventory must be provided together") }
        let source = try sourceDirectory.map { try VQCheckpoint(directory: $0, inventory: inventory!) }
        if let source {
            guard source.inventorySHA256 == manifest.artifact.inventory_sha256 else {
                throw ModelError("VQ source and record reference identify different artifacts")
            }
            c.equal("metadata authentication reads no payload", source.verifiedFileCount, 0)
            do {
                _ = try source.records(layer: 0, experts: [0], shouldContinue: { false })
                c.expect("cancelled first payload verification refused", false)
            } catch CheckpointReadError.cancelled {
                c.expect("cancelled first payload verification refused", true)
            }
            c.equal("cancelled payload is not published", source.verifiedFileCount, 0)
        }
        return try withError {
            var testedLayouts = Set<VQRecordLayout>()
            for fixture in manifest.fixtures {
                let bound = prefill ? 320_000_000 : 64_000_000
                let ids = prefill ? (0..<63).map { UInt32($0 * 8) } + [511] : [UInt32(0), 1, 7, 511]
                let counts = prefill ? [410, 512] : [1, 2, 3]
                let prefix = prefill ? "prefill" : "record"
                guard fixture.path == "\(prefix)-\(fixture.layer).safetensors", fixture.bytes > 0,
                      fixture.bytes <= bound, fixture.expert_ids == ids, fixture.projections.count == 3 else {
                    throw ModelError("unexpected VQ complete-record fixture metadata")
                }
                let data = try read(directory.appendingPathComponent(fixture.path), limit: bound)
                let digest = SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
                guard data.count == fixture.bytes, digest == fixture.sha256 else { throw ModelError("VQ record fixture digest mismatch") }
                let layouts = try fixture.projections.map { p -> VQLayout in
                    guard let packing = VQLayout.Packing(rawValue: p.packing) else { throw ModelError("unknown VQ record packing") }
                    return try VQLayout(columns: p.columns, dimensions: p.dimensions, codebookEntries: p.entries,
                                        groupSize: p.group_size, packing: packing)
                }
                let layout = try VQRecordLayout(layouts)
                testedLayouts.insert(layout)
                let scratch = FileManager.default.temporaryDirectory.appendingPathComponent("slotstream-vq-record-" + UUID().uuidString)
                try FileManager.default.createDirectory(at: scratch, withIntermediateDirectories: false,
                    attributes: [.posixPermissions: 0o700])
                defer { try? FileManager.default.removeItem(at: scratch) }
                let path = scratch.appendingPathComponent("verified.safetensors")
                try data.write(to: path, options: .atomic)
                let arrays = try loadArrays(url: path)
                let names = ["gate_proj", "up_proj", "down_proj"]
                let expectedKeys = Set(names.flatMap { n in ["codes", "codebook", "vq_scales"].map { n + "." + $0 } }
                    + counts.flatMap { ["x\($0)", "routes\($0)", "expected\($0)"] })
                guard Set(arrays.keys) == expectedKeys else { throw ModelError("VQ record fixture tensor set mismatch") }
                let codes = names.map { arrays[$0 + ".codes"]! }
                let books = names.map { arrays[$0 + ".codebook"]! }
                let scales = names.map { arrays[$0 + ".vq_scales"]! }
                if prefill {
                    let readPlan = try source?.recordReadPlan(layer: fixture.layer)
                    let sourceBooks = try source?.recordBooks(layer: fixture.layer)
                    if parallelPrefillReads, let source, let readPlan, let sourceBooks {
                        c.equal("L\(fixture.layer) source prefill layout", try source.recordLayout(layer: fixture.layer), layout)
                        let reservation = try VQPrefillRecords.reservation(experts: 32, layout: layout,
                                                                         scratchReadBytes: readPlan.scratchReadBytes)
                        c.expect("L\(fixture.layer) complete prefill staging is bounded",
                                 reservation <= VQPrefillRecords.maximumReservationBytes && reservation > 2 * 32 * layout.recordBytes)
                        let invalidSets: [[UInt32]] = [[], [0, 0], [512], Array(0...32)]
                        for invalid in invalidSets {
                            do {
                                _ = try VQPrefillRecords.load(layer: fixture.layer, experts: invalid,
                                    layout: layout, plan: readPlan, books: sourceBooks)
                                c.expect("L\(fixture.layer) invalid prefill expert set refused", false)
                            } catch { c.expect("L\(fixture.layer) invalid prefill expert set refused", true) }
                        }
                        for cancelAfter in [0, 1] {
                            var checks = 0
                            do {
                                _ = try VQPrefillRecords.load(layer: fixture.layer, experts: [0, 511],
                                    layout: layout, plan: readPlan, books: sourceBooks, shouldContinue: {
                                        checks += 1; return checks <= cancelAfter
                                    })
                                c.expect("L\(fixture.layer) prefill cancellation \(cancelAfter) refused", false)
                            } catch CheckpointReadError.cancelled {
                                c.expect("L\(fixture.layer) prefill cancellation \(cancelAfter) refused", true)
                            }
                        }
                    }
                    for count in counts {
                        let x = arrays["x\(count)"]!, routes = arrays["routes\(count)"]!, expected = arrays["expected\(count)"]!
                        guard x.shape == [count, 2560], x.dtype == .bfloat16,
                              routes.shape == [count, 10], routes.dtype == .uint32,
                              expected.shape == [count, 10, 2560], expected.dtype == .bfloat16 else {
                            throw ModelError("VQ segmented prefill fixture shape mismatch")
                        }
                        let streamed = try VQPrefillStream.call(x, routes: routes.asArray(UInt32.self)) { ids in
                            if parallelPrefillReads, let readPlan, let sourceBooks {
                                return try VQPrefillRecords.load(layer: fixture.layer, experts: ids,
                                    layout: layout, plan: readPlan, books: sourceBooks)
                            }
                            let rows = MLXArray(try ids.map { id -> Int32 in
                                guard let position = fixture.expert_ids.firstIndex(of: id) else { throw ModelError("VQ prefill route is outside its fixture") }
                                return Int32(position)
                            })
                            return try VQRecordBatch(layer: fixture.layer, expertIDs: ids, layout: layout,
                                codes: codes.map { $0[rows] }, books: books, scales: scales.map { $0[rows] })
                        }
                        eval(streamed.values)
                        c.equal("L\(fixture.layer) T\(count) segmented shape", streamed.values.shape, expected.shape)
                        c.expect("L\(fixture.layer) T\(count) segmented finite", all(isFinite(streamed.values)).item(Bool.self))
                        let actualHash = SHA256.hash(data: streamed.values.asData(access: .copy).data).map { String(format: "%02x", $0) }.joined()
                        let expectedHash = SHA256.hash(data: expected.asData(access: .copy).data).map { String(format: "%02x", $0) }.joined()
                        c.equal("L\(fixture.layer) T\(count) exact segmented SwiGLU bits", actualHash, expectedHash)
                        c.equal("L\(fixture.layer) T\(count) complete staging batches", streamed.batches, 2)
                        c.equal("L\(fixture.layer) T\(count) maximum staged experts", streamed.maximumExperts, 32)
                    }
                    guard ProcessMemory.peakResidentBytes() <= 4_000_000_000 else { throw ModelError("VQ prefill check exceeded its 4 GB process bound") }
                    continue
                }
                let batch = try VQRecordBatch(layer: fixture.layer, expertIDs: fixture.expert_ids,
                    layout: layout, codes: codes, books: books, scales: scales)
                let direct = try source?.records(layer: fixture.layer, experts: fixture.expert_ids)
                c.equal("L\(fixture.layer) complete payload ledger", codes.reduce(0) { $0 + $1.nbytes } + scales.reduce(0) { $0 + $1.nbytes },
                        layout.recordBytes * fixture.expert_ids.count)
                c.equal("L\(fixture.layer) codebooks counted separately", books.reduce(0) { $0 + $1.nbytes }, layout.codebookBytes)
                for count in 1...3 {
                    let x = arrays["x\(count)"]!, routes = arrays["routes\(count)"]!, expected = arrays["expected\(count)"]!
                    guard x.shape == [count, 2560], x.dtype == .bfloat16,
                          routes.shape == [count, 10], routes.dtype == .uint32,
                          expected.shape == [count, 10, 2560], expected.dtype == .bfloat16 else {
                        throw ModelError("VQ record fixture input/output shape mismatch")
                    }
                    let actual = try batch.call(x, routes: routes.asArray(UInt32.self))
                    eval(actual)
                    c.expect("L\(fixture.layer) T\(count) finite composed expert output", all(isFinite(actual)).item(Bool.self))
                    let got = actual.reshaped([-1]).view(dtype: .uint16).asArray(UInt16.self)
                    let want = expected.reshaped([-1]).view(dtype: .uint16).asArray(UInt16.self)
                    c.equal("L\(fixture.layer) T\(count) routed SwiGLU differing elements", zip(got, want).filter { $0 != $1 }.count, 0)
                    let gotHash = got.withUnsafeBytes { SHA256.hash(data: Data($0)).map { String(format: "%02x", $0) }.joined() }
                    let wantHash = want.withUnsafeBytes { SHA256.hash(data: Data($0)).map { String(format: "%02x", $0) }.joined() }
                    c.equal("L\(fixture.layer) T\(count) exact routed SwiGLU bits", gotHash, wantHash)
                    for capacity in [1, 2, 3, 32] {
                        let streamed = try VQRouteStream.call(x, routes: routes.asArray(UInt32.self), batchExperts: capacity) { ids in
                            let positions = ids.map { Int32(fixture.expert_ids.firstIndex(of: $0)!) }
                            let rows = MLXArray(positions)
                            return try VQRecordBatch(layer: fixture.layer, expertIDs: ids, layout: layout,
                                codes: codes.map { $0[rows] }, books: books, scales: scales.map { $0[rows] })
                        }
                        c.equal("L\(fixture.layer) T\(count) capacity \(capacity) complete-record streaming bits",
                            streamed.values.asData(access: .copy).data, expected.asData(access: .copy).data)
                        c.equal("L\(fixture.layer) T\(count) capacity \(capacity) required batches",
                            streamed.batches, (fixture.expert_ids.count + capacity - 1) / capacity)
                        c.expect("L\(fixture.layer) T\(count) capacity \(capacity) bounded live experts", streamed.maximumExperts <= capacity)
                    }
                    if let direct {
                        let output = try direct.call(x, routes: routes.asArray(UInt32.self))
                        c.equal("L\(fixture.layer) T\(count) authenticated checkpoint exact SwiGLU bits",
                            output.reshaped([-1]).view(dtype: .uint16).asArray(UInt16.self), want)
                    }
                }
                try quantizationBankFixture(layer: fixture.layer, ids: fixture.expert_ids, layout: layout, arrays: arrays, checks: &c)
                // Mutate each caller-owned group independently after admission,
                // before constructing or evaluating an operation. MLXArray is
                // a reference type; retaining the caller's object is insufficient.
                for group in 0..<3 {
                    let inputs = [codes, books, scales].map { $0.map { $0.reshaped($0.shape) } }
                    let owned = try VQRecordBatch(layer: fixture.layer, expertIDs: fixture.expert_ids,
                        layout: layout, codes: inputs[0], books: inputs[1], scales: inputs[2])
                    for value in inputs[group] { value._updateInternal(zeros(like: value)) }
                    let actual = try owned.call(arrays["x1"]!, routes: arrays["routes1"]!.asArray(UInt32.self))
                    let got = actual.reshaped([-1]).view(dtype: .uint16).asArray(UInt16.self)
                    let want = arrays["expected1"]!.reshaped([-1]).view(dtype: .uint16).asArray(UInt16.self)
                    c.equal("L\(fixture.layer) caller \(["codes", "books", "scales"][group]) replacement preserves owned values",
                            zip(got, want).filter { $0 != $1 }.count, 0)
                }
                for operation: () throws -> Void in [
                    { _ = try VQRecordBatch(layer: fixture.layer, expertIDs: [0, 1, 7, 7], layout: layout, codes: codes, books: books, scales: scales) },
                    { _ = try VQRecordBatch(layer: fixture.layer, expertIDs: fixture.expert_ids, layout: layout, codes: Array(codes.prefix(2)), books: books, scales: scales) },
                    { _ = try batch.call(arrays["x1"]!, routes: Array(repeating: 512, count: 10)) },
                    { _ = try batch.callPairs(arrays["x3"]!, routes: [0, 1, 7], dispatchPairs: 2) },
                    { _ = try VQRouteStream.call(arrays["x1"]!, routes: arrays["routes1"]!.asArray(UInt32.self), batchExperts: 1) { _ in batch } }
                ] {
                    do { try operation(); c.expect("invalid complete record or route refused", false) }
                    catch { c.expect("invalid complete record or route refused", true) }
                }
                guard ProcessMemory.peakResidentBytes() <= 2_000_000_000 else {
                    throw ModelError("VQ record check exceeded its 2 GB component bound")
                }
            }
            if manifest.layer_coverage != nil {
                c.equal("distinct complete-record allocation classes exercised", testedLayouts.count, layers.count)
            }
            if let source {
                c.expect("demanded checkpoint payloads fully verified", source.verifiedFileCount > 0)
                c.expect("payload verification exceeds extracted fixture bytes", source.verifiedPayloadBytes > 128_000_000)
                fputs("VQ records verified files=\(source.verifiedFileCount) bytes=\(source.verifiedPayloadBytes)\n", stderr)
            }
            return c.report()
        }
    }
}
