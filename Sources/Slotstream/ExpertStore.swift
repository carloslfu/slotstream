// Streams routed-expert records from the original checkpoint shards into the
// slot pool. One expert = 9 tensor pieces (gate/up/down × weight/scales/biases),
// each contiguous per expert inside its [512, R, C] shard tensor (verified M0).

import Foundation
import MLX

public struct PackedLayoutReport: Codable {
    public let bytes: Int
    public let seconds: Double
    public let modelIdentity: String
}

public struct ExpertKey: Hashable {
    public let layer: Int
    public let expert: Int
    public init(_ l: Int, _ e: Int) {
        layer = l
        expert = e
    }
}

public enum SlotPoolError: Error, CustomStringConvertible {
    case invalidKey(ExpertKey)
    case exhausted(requiredNewPins: Int, available: Int)
    public var description: String {
        switch self {
        case .invalidKey(let key): return "invalid expert key \(key.layer)/\(key.expert)"
        case .exhausted(let needed, let available):
            return "expert request needs \(needed) new pinned slots, but only \(available) are available"
        }
    }
}

public final class ExpertStore {
    public let index: CheckpointIndex
    private let cfg: ModelConfig
    // per (layer, piece) tensor refs; pieces ordered gw,gs,gb,uw,us,ub,dw,ds,db
    static let pieces = [
        "gate_proj.weight", "gate_proj.scales", "gate_proj.biases",
        "up_proj.weight", "up_proj.scales", "up_proj.biases",
        "down_proj.weight", "down_proj.scales", "down_proj.biases",
    ]
    private var refs: [[TensorRef]] = []  // [layer][piece]
    private var packedLayout: PackedExpertLayout?
    package var usePackedLayout = true
    package private(set) var packedRecordsRead = 0
    package var packedReadFault: ReadFault? {
        get { packedLayout?.readFault }
        set { packedLayout?.readFault = newValue }
    }
    public var hasPackedLayout: Bool { packedLayout != nil }
    /// Configure only between joined read batches. Loading verifies the entire
    /// payload before changing the active reader. Failed loads preserve it.
    @discardableResult
    public func loadPackedLayout(at directory: URL) throws -> PackedLayoutReport {
        try ModelProcessGuard.acquire()
        let identity = try packedModelIdentity()
        let candidate = try PackedExpertLayout(directory:directory,identity:identity,
            layers:cfg.numLayers,experts:cfg.numExperts,pieces:pieceRowBytes)
        guard try packedModelIdentity() == identity else { throw ModelError("checkpoint changed while loading packed experts") }
        packedLayout = candidate
        return PackedLayoutReport(bytes:candidate.verifiedBytes,seconds:candidate.verificationSeconds,modelIdentity:identity)
    }
    public func unloadPackedLayout() { packedLayout = nil }

    /// Creates a separate 67.95 GB artifact for the curated model. The source
    /// shards are read-only and never replaced. Requires enough free disk for
    /// the complete artifact plus 3 GB, and retains a process-wide model lock.
    public func buildPackedLayout(at directory: URL) throws -> PackedLayoutReport {
        try ModelProcessGuard.acquire()
        try Geometry.check(against:cfg,recordBytes:recordBytes)
        guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 4_000_000_000 else {
            throw ModelError("packed expert construction needs at least 4 GB reclaimable memory")
        }
        let identity = try packedModelIdentity()
        let bytes = recordBytes * cfg.numExperts * cfg.numLayers
        var fs = statfs()
        guard statfs(directory.deletingLastPathComponent().path,&fs) == 0,
            Double(fs.f_bavail)*Double(fs.f_bsize) >= Double(bytes)+3e9 else {
            throw ModelError("packed experts need \(bytes) bytes of free disk plus 3 GB headroom")
        }
        let start = ProcessInfo.processInfo.systemUptime
        _ = try PackedExpertLayout.build(directory:directory,identity:identity,layers:cfg.numLayers,
            experts:cfg.numExperts,pieces:pieceRowBytes,sourceUnchanged: {
                guard try self.packedModelIdentity() == identity else { throw ModelError("checkpoint changed during expert repack") }
            },reader: { layer,expert,piece,dst in
                let bytes = self.pieceRowBytes[piece]
                try self.index.preadChecked(into:dst,self.refs[layer][piece],offset:expert*bytes,count:bytes)
            })
        return PackedLayoutReport(bytes:bytes,seconds:ProcessInfo.processInfo.systemUptime-start,modelIdentity:identity)
    }
    private func packedModelIdentity() throws -> String {
        struct Source: Encodable {
            let path: String
            let stamp: PackedExpertLayout.Stamp
            let offset: Int
            let bytes: Int
            let shape: [Int]
            let dtype: String
        }
        struct Identity: Encodable { let config: String; let tensors: [[Source]] }
        var stamps: [URL:PackedExpertLayout.Stamp] = [:]
        let sources = try refs.map { row in try row.map { ref in
            if stamps[ref.file] == nil {
                let fd = try PackedExpertLayout.openRead(ref.file)
                defer { close(fd) }
                stamps[ref.file] = try PackedExpertLayout.Stamp(fd:fd)
            }
            return Source(path:ref.file.path,stamp:stamps[ref.file]!,offset:ref.byteOffset,
                bytes:ref.byteCount,shape:ref.shape,dtype:ref.dtype)
        } }
        let config = try Data(contentsOf:index.dir.appendingPathComponent("config.json"))
        let encoder = JSONEncoder(); encoder.outputFormatting = [.sortedKeys]
        return PackedExpertLayout.hex(try encoder.encode(Identity(config:PackedExpertLayout.hex(config),tensors:sources)))
    }
    private var readHandles: [[TensorReadHandle]]?
    package var readHandleCount: Int { readHandles?.reduce(0) { $0 + $1.count } ?? 0 }
    package func configureReadHandles(_ enabled: Bool) {
        guard enabled != (readHandles != nil) else { return }
        readHandles = enabled ? refs.map { $0.map { index.readHandle(for: $0) } } : nil
    }
    package var readFault: ReadFault?
    private func read(into dst: UnsafeMutableRawPointer, layer: Int, piece: Int, offset: Int, count: Int) throws {
        try readFault?.beforeRead()
        if let handle = readHandles?[layer][piece] { try handle.readChecked(into: dst, offset: offset, count: count) }
        else { try index.preadChecked(into: dst, refs[layer][piece], offset: offset, count: count) }
    }
    /// One piece of one record into a caller-owned aligned buffer. This is
    /// the speculative prefetch read seam: the same checked read, fault seam
    /// and packed-layout selection as demand reads, one piece at a time so a
    /// cancelled ticket stops between pieces. A failure here never touches
    /// the packed-layout fallback state that demand reads own.
    package func readPieceChecked(into destination: UnsafeMutableRawPointer, key: ExpertKey, piece: Int,
                                  shouldContinue: () -> Bool) throws {
        guard piece >= 0, piece < pieceRowBytes.count, key.layer >= 0, key.layer < cfg.numLayers,
              key.expert >= 0, key.expert < cfg.numExperts else { throw SlotPoolError.invalidKey(key) }
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        let bytes = pieceRowBytes[piece]
        if usePackedLayout, let packedLayout {
            try packedLayout.readPiece(key, piece: piece, into: destination)
        } else {
            try read(into: destination, layer: key.layer, piece: piece, offset: key.expert * bytes, count: bytes)
        }
    }

    /// Whole-record speculative reads exist only on the packed layout, where a
    /// record is one contiguous range. The original checkpoint keeps each piece in
    /// its own tensor, so that path stays piece-by-piece.
    package var supportsRecordReads: Bool { usePackedLayout && packedLayout != nil }

    /// Bytes in one complete record, the size a whole-record scratch buffer needs.
    package var speculativeRecordBytes: Int { pieceRowBytes.reduce(0, +) }

    /// The whole-record speculative read seam: same checked read, fault seam and
    /// stamp check as `readPieceChecked`, but one call for the whole record. A
    /// cancelled ticket now stops between records rather than between pieces,
    /// which loses nothing because a partial record is discarded either way.
    package func readRecordChecked(into destination: UnsafeMutableRawPointer, key: ExpertKey,
                                   shouldContinue: () -> Bool) throws {
        guard key.layer >= 0, key.layer < cfg.numLayers,
              key.expert >= 0, key.expert < cfg.numExperts else { throw SlotPoolError.invalidKey(key) }
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        guard usePackedLayout, let packedLayout else {
            throw ModelError("whole-record speculative reads require the packed layout")
        }
        try packedLayout.readRecord(key, into: destination)
    }

    /// Row shape and dtype of each staging piece, for single-record adoption.
    package var stagingPieceSpecs: [(shape: [Int], dtype: DType)] {
        refs[0][0 ..< 9].map { r in
            (Array(r.shape.dropFirst()), r.dtype == "U32" ? DType.uint32 : DType.bfloat16)
        }
    }

    public private(set) var pieceRowBytes: [Int] = []  // bytes per expert per piece
    public var recordBytes: Int {
        var total = 0
        for bytes in pieceRowBytes {
            let (next, overflow) = total.addingReportingOverflow(bytes)
            if overflow { return 0 }
            total = next
        }
        return total
    }

    public init(index: CheckpointIndex) throws {
        self.index = index
        self.cfg = index.config
        let h = cfg.hiddenSize
        let ff = cfg.moeIntermediate
        let g = cfg.qGroup
        let expected: [(shape: [Int], dtype: String)] = [
            ([cfg.numExperts, ff, h / 8], "U32"),
            ([cfg.numExperts, ff, h / g], "BF16"),
            ([cfg.numExperts, ff, h / g], "BF16"),
            ([cfg.numExperts, ff, h / 8], "U32"),
            ([cfg.numExperts, ff, h / g], "BF16"),
            ([cfg.numExperts, ff, h / g], "BF16"),
            ([cfg.numExperts, h, ff / 8], "U32"),
            ([cfg.numExperts, h, ff / g], "BF16"),
            ([cfg.numExperts, h, ff / g], "BF16"),
        ]
        for l in 0 ..< cfg.numLayers {
            let base = "model.layers.\(l).mlp.switch_mlp."
            let layer = Self.pieces.map { index.ref(base + $0) }
            for p in layer.indices {
                guard layer[p].shape == expected[p].shape,
                    layer[p].dtype == expected[p].dtype,
                    layer[p].rowBytes > 0
                else {
                    throw ModelError(
                        "tensor `\(base + Self.pieces[p])` has \(layer[p].dtype) "
                            + "\(layer[p].shape), expected \(expected[p].dtype) "
                            + "\(expected[p].shape) — check --model")
                }
            }
            refs.append(layer)
        }
        pieceRowBytes = refs[0].map { $0.rowBytes }
    }

    /// Read lanes for the sweep's long contiguous runs. Swept 2026-08-30 and
    /// again on the sweep: 4 lanes lose a third, 12 reads 179 tok/s, 32 reads
    /// 162 — the runs are throughput-bound, so more lanes only oversubscribe.
    public static let defaultQueueDepth: Int = {
        guard let raw = ProcessInfo.processInfo.environment["SLOTSTREAM_IO_QUEUE_DEPTH"],
            let n = Int(raw)
        else { return 12 }
        // Zero used to launch no workers and copy uninitialized staging memory;
        // a negative value could trap in concurrentPerform.
        return min(max(n, 1), 128)
    }()

    /// Read lanes for the pool path (`readBatch`), which is decode and any
    /// pass under the sweep threshold. This one is **latency**-bound, not
    /// throughput-bound: a layer's handful of misses is nine ~307 KB pieces per
    /// record, so 12 lanes leave the queue empty between waves. Measured on 48
    /// decode tokens at 30 experts/layer: 12 lanes 6.82 tok/s, 32 lanes 7.14,
    /// 64 lanes 7.16, output identical. 32 takes the gain without
    /// oversubscribing the sweep, which is why the two are separate numbers.
    public static let poolQueueDepth: Int = {
        guard let raw = ProcessInfo.processInfo.environment["SLOTSTREAM_POOL_QUEUE_DEPTH"],
            let n = Int(raw)
        else { return 32 }
        return min(max(n, 1), 128)
    }()

    /// Maximum expert records whose nine staging tensors coexist. A 256-token
    /// prefill can route all 512 experts of a layer: loading that as one unit is
    /// 1.4 GB before MLX materializes the scatter inputs, and was the unexplained
    /// multi-GB RSS step on the first nontrivial prompt. Reads stay QD-parallel
    /// inside each batch; only the peak working set is bounded here.
    public static let defaultLoadBatch: Int = {
        guard let raw = ProcessInfo.processInfo.environment["SLOTSTREAM_EXPERT_LOAD_BATCH"],
            let n = Int(raw)
        else { return 32 }
        return min(max(n, 1), Geometry.expertsPerLayer)
    }()

    public func readBatch(_ keys: [ExpertKey], queueDepth: Int = ExpertStore.poolQueueDepth)
        -> [MLXArray]
    {
        do { return try readBatchChecked(keys, queueDepth: queueDepth) }
        catch { preconditionFailure(String(describing: error)) }
    }

    /// All worker lanes join before failure cleanup. Partially filled buffers
    /// are never handed to MLX, and original checkpoint bytes stay read-only.
    public func readBatchChecked(_ keys: [ExpertKey], queueDepth: Int = ExpertStore.poolQueueDepth) throws
        -> [MLXArray]
    {
        let n = keys.count
        guard n > 0 else { throw CheckpointReadError.invalidRange }
        for key in keys where key.layer < 0 || key.layer >= cfg.numLayers || key.expert < 0 || key.expert >= cfg.numExperts {
            throw SlotPoolError.invalidKey(key)
        }
        let buffers = try allocateStaging(rows: n)
        var transferred = false
        defer { if !transferred { buffers.forEach { free($0) } } }
        if usePackedLayout, let packedLayout {
            do { try packedLayout.readBatch(keys,buffers:buffers,queueDepth:queueDepth) }
            catch {
                // No partial columns have entered MLX. Abort this request;
                // subsequent requests use the intact original checkpoint.
                self.packedLayout = nil
                throw error
            }
            packedRecordsRead += keys.count
            transferred = true
            return stagingArrays(buffers,rows:n)
        }
        let failure = JoinedReadFailure()
        // 9n reads, spread across worker lanes
        let jobs: [(piece: Int, slot: Int)] = (0 ..< n).flatMap { s in (0 ..< 9).map { (piece: $0, slot: s) } }
        let lanes = min(max(queueDepth, 1), jobs.count)
        DispatchQueue.concurrentPerform(iterations: lanes) { lane in
            var j = lane
            while j < jobs.count {
                let (p, s) = jobs[j]
                let key = keys[s]
                let pb = pieceRowBytes[p]
                do { try read(into: buffers[p] + s * pb, layer: key.layer, piece: p, offset: key.expert * pb, count: pb) }
                catch { failure.record(error) }
                j += lanes
            }
        }

        try failure.finish()
        transferred = true
        return stagingArrays(buffers, rows: n)
    }

    /// Read one layer's experts, ascending ids, into fresh staging arrays
    /// (one per piece; row j holds experts[j]) for the prefill sweep. They
    /// never enter the slot pool. Consecutive ids are one pread per piece: a
    /// pass of a few hundred tokens routes nearly every expert of a layer, so
    /// the reads are long contiguous runs rather than the nine ~307 KB pieces
    /// per record `readBatch` issues, which is what held the old pass at
    /// 4.5 GB/s against an SSD that delivers 17 (MEASUREMENTS, "Prefill,
    /// second pass").
    public func readRuns(
        layer: Int, experts: [Int], queueDepth: Int = ExpertStore.defaultQueueDepth
    ) -> [MLXArray] {
        do { return try readRunsChecked(layer: layer, experts: experts, queueDepth: queueDepth) }
        catch { preconditionFailure(String(describing: error)) }
    }

    public func readRunsChecked(
        layer: Int, experts: [Int], queueDepth: Int = ExpertStore.defaultQueueDepth
    ) throws -> [MLXArray] {
        let n = experts.count
        guard n > 0, layer >= 0, layer < cfg.numLayers,
            experts.allSatisfy({ $0 >= 0 && $0 < cfg.numExperts })
        else { throw CheckpointReadError.invalidRange }
        let buffers = try allocateStaging(rows: n)
        var transferred = false
        defer { if !transferred { buffers.forEach { free($0) } } }
        let failure = JoinedReadFailure()
        var runs: [(row: Int, len: Int)] = []
        var j = 0
        while j < n {
            var k = j + 1
            while k < n, experts[k] == experts[k - 1] + 1 { k += 1 }
            runs.append((j, k - j))
            j = k
        }
        // One job per (run, piece), largest first so the lanes finish together.
        var jobs: [(piece: Int, row: Int, len: Int)] = []
        jobs.reserveCapacity(runs.count * 9)
        for r in runs { for p in 0 ..< 9 { jobs.append((p, r.row, r.len)) } }
        jobs.sort { $0.len * pieceRowBytes[$0.piece] > $1.len * pieceRowBytes[$1.piece] }
        let lanes = min(max(queueDepth, 1), jobs.count)
        let lock = NSLock()
        var next = 0
        DispatchQueue.concurrentPerform(iterations: lanes) { _ in
            while true {
                lock.lock()
                let j = next
                next += 1
                lock.unlock()
                if j >= jobs.count { return }
                let (p, row, len) = jobs[j]
                let pb = pieceRowBytes[p]
                do {
                    try read(into: buffers[p] + row * pb, layer: layer, piece: p,
                        offset: experts[row] * pb, count: len * pb)
                } catch { failure.record(error) }
            }
        }
        try failure.finish()
        transferred = true
        return stagingArrays(buffers, rows: n)
    }

    /// One 16 KiB-aligned staging buffer per piece, `rows` records each.
    package var transferProfile: ExpertTransferProfile?

    private func allocateStaging(rows n: Int) throws -> [UnsafeMutableRawPointer] {
        let profile = transferProfile
        let start = profile == nil ? 0 : RuntimeClock.now()
        defer { if let profile { profile.allocationSeconds += RuntimeClock.seconds(since: start) } }
        var buffers: [UnsafeMutableRawPointer] = []
        guard n > 0, pieceRowBytes.allSatisfy({ !n.multipliedReportingOverflow(by: $0).overflow }) else {
            throw CheckpointReadError.invalidRange
        }
        for pb in pieceRowBytes {
            var p: UnsafeMutableRawPointer? = nil
            let rc = posix_memalign(&p, 16384, n * pb)
            guard rc == 0, let p else {
                buffers.forEach { free($0) }
                throw ModelError(
                    "out of memory staging \(n) expert records (\(n * pb) B): "
                        + "lower --experts-per-layer or --memory-gb")
            }
            buffers.append(p)
        }
        if let profile {
            profile.batches += 1
            profile.allocatedBytes += n * pieceRowBytes.reduce(0, +)
        }
        return buffers
    }

    /// Transfer each aligned staging buffer directly to MLX. The previous
    /// path copied every 1.4 GB batch into a Swift Array and then copied it
    /// again into MLX, so raw + Swift + MLX copies coexisted at peak and
    /// were invisible to MLX's allocator counter.
    private func stagingArrays(_ buffers: [UnsafeMutableRawPointer], rows n: Int) -> [MLXArray] {
        let profile = transferProfile
        let start = profile == nil ? 0 : RuntimeClock.now()
        var out: [MLXArray] = []
        for (p, r) in refs[0][0 ..< 9].enumerated() {
            let shape = [n] + Array(r.shape.dropFirst())
            let dtype: DType
            switch r.dtype {
            case "U32": dtype = .uint32
            case "BF16": dtype = .bfloat16
            default:
                for q in p ..< buffers.count { free(buffers[q]) }
                fatalError("unexpected expert dtype \(r.dtype)")
            }
            let owned = buffers[p]
            if let profile {
                let release = ManagedBufferReleaseObservation()
                let array = MLXArray(rawPointer: owned, shape, dtype: dtype) { release.record(); free(owned) }
                profile.wrappedBuffers += 1
                if release.observed { profile.immediateReleaseBuffers += 1 }
                out.append(array)
            } else {
                out.append(MLXArray(rawPointer: owned, shape, dtype: dtype) { free(owned) })
            }
        }
        let evalStart = profile == nil ? 0 : RuntimeClock.now()
        if let profile { profile.wrappingSeconds += Double(evalStart - start) / 1e9 }
        eval(out)
        if let profile { profile.stagingEvalSeconds += RuntimeClock.seconds(since: evalStart) }
        return out
    }
}

// MARK: - Slot pool

/// A fixed pool of expert slots shared across all layers (uniform shape), with
/// CLOCK eviction. `ensure` maps (layer, expert) keys to slot indices, loading
/// misses in one batched read + scatter. Bit-exact: the pool holds the same
/// quantized bytes the checkpoint does.
public final class SlotPool {
    public private(set) var slots: Int
    private let cfg: ModelConfig
    private let store: ExpertStore

    // pools, same order as ExpertStore.pieces
    public private(set) var pools: [MLXArray] = []

    private var map: ExpertSlotIndex
    private var keyOf: [ExpertKey?]
    private var refBit: [Bool]
    private var pinned: SlotPins
    package var pinnedSlotCount: Int { pinned.count }
    package var contiguousSlotWrites = false
    package var wordSlotWrites = false
    package var cpuSlotWrites = false
    public private(set) var slotCPUBatches = 0
    public private(set) var slotWordBatches = 0
    public private(set) var slotWordBuffers = 0
    public private(set) var slotSliceBatches = 0
    public private(set) var slotSliceRuns = 0
    public private(set) var slotScatterBatches = 0
    package var layerLocalFloorEviction = false
    public private(set) var floorLocalVictims = 0
    package var denseLookup = false {
        didSet { map.configure(dense: denseLookup) }
    }
    package var sparsePinClearing = false {
        didSet { pinned.configure(sparse: sparsePinClearing) }
    }
    package var denseLookupBytes: Int { map.denseBytes }
    package var readHandleCount: Int { store.readHandleCount }
    package var transferProfile: ExpertTransferProfile? {
        get { store.transferProfile }
        set { store.transferProfile = newValue }
    }
    /// Fixed all-miss diagnostic replay. Called only after the previous full
    /// forward has finished; leaves tensor storage and capacity untouched.
    package func diagnosticDiscardResidency() throws {
        guard pinned.count == 0 else { throw ModelError("cannot discard pinned diagnostic residency") }
        drainReturnedSlots()
        guard inFlightCount == 0 else { throw ModelError("cannot discard residency with speculative slots in flight") }
        eval(pools)
        for key in keyOf.compactMap({ $0 }) { map.removeValue(forKey: key) }
        keyOf = Array(repeating: nil, count: slots)
        refBit = Array(repeating: false, count: slots)
        hand = 0
    }
    package var readFault: ReadFault? {
        get { store.readFault }
        set { store.readFault = newValue }
    }
    package var packedReadFault: ReadFault? {
        get { store.packedReadFault }
        set { store.packedReadFault = newValue }
    }
    package var usePackedLayout: Bool {
        get { store.usePackedLayout }
        set { store.usePackedLayout = newValue }
    }
    package var packedRecordsRead: Int { store.packedRecordsRead }
    package var hasPackedLayout: Bool { store.hasPackedLayout }
    @discardableResult
    package func loadPackedLayout(at directory: URL) throws -> PackedLayoutReport { try store.loadPackedLayout(at:directory) }
    package var directReadHandles = false {
        didSet { if oldValue != directReadHandles { store.configureReadHandles(directReadHandles) } }
    }
    private var hand = 0
    /// Expert Lookahead session (owned by the model): demand events, residency
    /// snapshots and raw-staging adoption. Nil costs nothing on the hot path.
    package weak var lookahead: ExpertLookaheadSession?
    /// Slot adoption (speculative reads straight into pool memory): slots
    /// reserved for an in-flight speculative record. A reserved slot has no
    /// key, is skipped by every victim scan and counts against capacity until
    /// the worker leaves it (returned through `returnedSlots` from any thread
    /// and drained on the model thread) or the record is published.
    private var inFlight: [Bool] = []
    private var inFlightCount = 0
    /// Slots given back unused (no key): the next reservation takes one of
    /// these before evicting anything, so wasted forecasts recycle their own
    /// slots instead of draining the pool of live keys.
    private var freeSlots: [Int] = []
    private let returnedLock = NSLock()
    private var returnedSlots: [Int] = []
    /// Bumped on every pool write or replacement; the cached piece base
    /// pointers are recomputed when it changes, and a reservation whose bases
    /// differ from the current ones at adoption is refused.
    private var poolWriteEpoch: UInt64 = 0
    private var basesCache: (epoch: UInt64, bases: [UnsafeMutableRawPointer])?
    public private(set) var speculativeSlotReservations = 0
    public private(set) var speculativeSlotAdoptions = 0
    public private(set) var speculativeSlotStale = 0
    package var expertStore: ExpertStore { store }
    /// Records whose bytes came from an adopted speculative ticket instead of
    /// a demand read. They are still misses for the hit rate.
    public private(set) var recordsAdopted = 0
    public private(set) var adoptSeconds = 0.0
    public private(set) var hits = 0
    public private(set) var misses = 0

    public var poolBytes: Int { pools.reduce(0) { $0 + $1.nbytes } }
    /// Bytes per expert record, measured from the checkpoint headers.
    public var recordBytes: Int { store.recordBytes }
    /// The cache size in the per-layer unit of intuition (the pool itself is
    /// global and shared -- hot layers borrow from cold ones).
    public var slotsPerLayer: Double { Double(slots) / Double(cfg.numLayers) }

    /// Piecewise workspace writes evaluate before advancing to another
    /// buffer, so only the largest piece needs replacement storage.
    package var largestWorkspacePieceBytes: Int {
        Self.poolShapes(cfg.numExperts, cfg).map {
            ContextBytes.product($0.shape.reduce(1) { ContextBytes.product($0, $1) }, $0.dtype.size)
        }.max() ?? Int.max
    }

    /// Per-piece shapes for a pool of `n` slots (order = ExpertStore.pieces).
    private static func poolShapes(_ n: Int, _ cfg: ModelConfig) -> [(shape: [Int], dtype: DType)] {
        let h = cfg.hiddenSize
        let ff = cfg.moeIntermediate
        let g = cfg.qGroup
        return [
            ([n, ff, h / 8], .uint32), ([n, ff, h / g], .bfloat16), ([n, ff, h / g], .bfloat16),
            ([n, ff, h / 8], .uint32), ([n, ff, h / g], .bfloat16), ([n, ff, h / g], .bfloat16),
            ([n, h, ff / 8], .uint32), ([n, h, ff / g], .bfloat16), ([n, h, ff / g], .bfloat16),
        ]
    }

    public init(slots: Int, store: ExpertStore) {
        self.slots = slots
        self.store = store
        self.cfg = store.index.config
        self.map = ExpertSlotIndex(layers: store.index.config.numLayers, experts: store.index.config.numExperts)
        self.keyOf = Array(repeating: nil, count: slots)
        self.refBit = Array(repeating: false, count: slots)
        self.pinned = SlotPins(count: slots)
        self.inFlight = Array(repeating: false, count: slots)
        pools = Self.poolShapes(slots, cfg).map { MLXArray.zeros($0.shape, dtype: $0.dtype) }
        eval(pools)
    }

    /// Resize the pool. Must only be called between requests (the caller holds
    /// the engine's generation lock); stale pins are cleared, not honored.
    ///
    /// Extra live bytes needed by a warm growth, including the replacement
    /// piece, its zero-filled tail and previously grown pieces. The caller
    /// must admit this transient separately from the final pool size.
    package func growthTransientBytes(to newSlots: Int) -> Int {
        guard newSlots > slots else { return 0 }
        let old = Self.poolShapes(slots, cfg)
        let next = Self.poolShapes(newSlots, cfg)
        var added = 0, peak = 0
        for (before, after) in zip(old, next) {
            let oldBytes = before.shape.reduce(before.dtype.size, *)
            let newBytes = after.shape.reduce(after.dtype.size, *)
            let tail = newBytes - oldBytes
            peak = max(peak, added + newBytes + tail)
            added += tail
        }
        return peak
    }

    /// Grow keeps slot indices and appends zeroed capacity one piece at a
    /// time. Gathering every occupied row first needlessly materialized a
    /// second large tensor. Shrink FREES the old tensors before allocating the small
    /// ones (transient = max(old, new), never the sum) and restarts cold:
    /// shrink happens under memory pressure, where holding two pools to
    /// preserve cache warmth would spike memory at exactly the wrong moment.
    /// The cache refills from SSD in a few seconds of subsequent requests.
    /// Byte-exactness is unaffected either way (golden-equivalence invariant:
    /// pool size and content never change the math).
    public func resize(to newSlots: Int) {
        let n = max(newSlots, 1)
        if n == slots { return }
        unpinAll()
        // The scheduler was invalidated (workers joined) before any resize;
        // whatever came back is drained and the reservation state restarts.
        drainReturnedSlots()
        inFlight = Array(repeating: false, count: n)
        inFlightCount = 0
        freeSlots.removeAll()
        poolWriteEpoch &+= 1
        basesCache = nil
        if n > slots {
            // Keep holes and mappings in place. Only the new tail is zeroed;
            // no full-pool gather or indexed-update temporary is necessary.
            eval(pools)
            for (p, spec) in Self.poolShapes(n - slots, cfg).enumerated() {
                let np = concatenated([pools[p], MLXArray.zeros(spec.shape, dtype: spec.dtype)], axis: 0)
                eval(np)
                pools[p] = np  // old piece freed here, bounding the transient
                MLX.Memory.clearCache()
            }
            keyOf += Array(repeating: nil, count: n - slots)
            refBit += Array(repeating: false, count: n - slots)
            pinned = SlotPins(count: n, sparse: sparsePinClearing)
            pinned.configure(depth: pinGenerations)
            hand = slots
        } else {
            // shrink: free first, allocate after, start cold
            pools = []
            map.removeAll(keepingCapacity: true)
            keyOf = Array(repeating: nil, count: n)
            refBit = Array(repeating: false, count: n)
            pinned = SlotPins(count: n, sparse: sparsePinClearing)
            pinned.configure(depth: pinGenerations)
            hand = 0
            pools = Self.poolShapes(n, cfg).map { MLXArray.zeros($0.shape, dtype: $0.dtype) }
            eval(pools)
        }
        slots = n
    }

    private func victim(preferLayer: Int? = nil) -> Int {
        if layerLocalFloorEviction, slots == Geometry.floorSlots, let layer = preferLayer,
           let selected = LayerLocalVictim.choose(count: slots, hand: hand, layer: layer,
               keyAt: { keyOf[$0] }, isPinned: { pinned[$0] || inFlight[$0] }) {
            if keyOf[selected] != nil { floorLocalVictims += 1 }
            hand = (selected + 1) % slots
            return selected
        }
        var scanned = 0
        while true {
            let s = hand
            hand = (hand + 1) % slots
            if pinned[s] || inFlight[s] {
                scanned += 1
                precondition(
                    scanned < 3 * slots,
                    "slot pool exhausted: all \(slots) slots pinned. The pool must "
                        + "hold at least one prefill chunk's expert set per layer "
                        + "(~512 + margin); raise --experts-per-layer.")
                continue
            }
            if refBit[s] { refBit[s] = false; scanned += 1; continue }
            return s
        }
    }

    /// Ensure all keys resident; returns slot index per key (same order).
    /// Pins the returned slots until `unpinAll()`.
    public func ensure(_ keys: [ExpertKey]) -> [Int] {
        do { return try ensureChecked(keys) }
        catch { preconditionFailure("\(error)") }
    }

    /// Validate and reserve the complete request before changing cache state.
    /// Duplicate keys share a slot and one physical read. Publish a missing
    /// record only after all nine pieces are read and their dependent scatter
    /// is installed. On a later failure, prior completed records remain valid
    /// and the exact pre-request pins are restored.
    public func ensureChecked(_ keys: [ExpertKey]) throws -> [Int] {
        try ensureCore(keys, reservedHits: nil, finishReaders: nil)
    }

    /// Resident GPU work may be submitted after the whole request is pinned.
    /// Complete those readers after synchronous I/O and before the first write,
    /// including the error path. No direct CPU writes or new worker lifetimes.
    package func ensureOverlapping(_ keys: [ExpertKey], reservedHits: @escaping ([Int]) -> Void,
                                   finishReaders: @escaping () -> Void) throws -> [Int] {
        try ensureCore(keys, reservedHits: reservedHits, finishReaders: finishReaders)
    }

    private func ensureCore(_ keys: [ExpertKey], reservedHits: (([Int]) -> Void)?,
                            finishReaders: (() -> Void)?) throws -> [Int] {
        for key in keys where key.layer < 0 || key.layer >= cfg.numLayers || key.expert < 0 || key.expert >= cfg.numExperts {
            throw SlotPoolError.invalidKey(key)
        }
        var result = Array(repeating: -1, count: keys.count)
        var missKeys: [ExpertKey] = []
        var missPos: [(position: Int, uniqueMiss: Int)] = []
        var uniqueMiss: [ExpertKey: Int] = [:]
        var hitSlots = Set<Int>()
        var requestHits = 0
        for (i, k) in keys.enumerated() {
            if let s = map[k] {
                result[i] = s
                hitSlots.insert(s)
                requestHits += 1
            } else {
                let j: Int
                if let held = uniqueMiss[k] { j = held }
                else {
                    j = missKeys.count
                    uniqueMiss[k] = j
                    missKeys.append(k)
                }
                missPos.append((i, j))
            }
        }
        drainReturnedSlots()
        lookahead?.prefetch?.noteLayerDemand(misses: missKeys.count)
        let needed = hitSlots.reduce(0) { $0 + (pinned[$1] ? 0 : 1) } + missKeys.count
        guard needed <= slots - pinned.count - inFlightCount else {
            throw SlotPoolError.exhausted(requiredNewPins: needed, available: slots - pinned.count - inFlightCount)
        }
        let newHitPins = hitSlots.filter { !pinned[$0] }
        var reservedPins: [Int] = []
        var completed = false
        defer {
            if !completed {
                for slot in newHitPins { pinned.unpin(slot) }
                for slot in reservedPins { pinned.unpin(slot) }
            }
        }
        for slot in hitSlots { refBit[slot] = true; pinned.pin(slot) }
        hits += requestHits
        misses += missPos.count
        let session = lookahead
        let observed = session?.observer != nil
        var event: ExpertLookaheadDemandEvent? = nil
        if observed, let session {
            let first = keys.first?.layer ?? -1
            var unique: [Int32] = []
            var seenKeys = Set<ExpertKey>()
            var hitList: [Int32] = []
            for k in keys where seenKeys.insert(k).inserted {
                unique.append(Int32(k.expert))
                if map[k] != nil { hitList.append(Int32(k.expert)) }
            }
            event = ExpertLookaheadDemandEvent(pass: session.currentPass, layer: first,
                mixedLayers: keys.contains { $0.layer != first }, uniqueExperts: unique, hitExperts: hitList,
                missExperts: missKeys.map { Int32($0.expert) }, victimSlots: [], adoptedExperts: [],
                promotedExperts: [], startNanos: RuntimeClock.now(), readNanos: 0, adoptNanos: 0, endNanos: 0)
        }
        if !missKeys.isEmpty {
            let tMiss = RuntimeClock.now()
            // Slot adoption: complete speculative records are already in the
            // pool memory of their reserved slots; publishing one is a map
            // insert. Records still being read keep their slot and are joined
            // after the demand batch. Everything else gets a victim now.
            var slotIdx: [Int32] = []
            var slotClaim: ExpertPrefetchScheduler.ClaimResult? = nil
            var slotScheduler: ExpertPrefetchScheduler? = nil
            var slotDemandOrder: [Int] = []
            var slotBases: [UnsafeMutableRawPointer]? = nil
            if let session, let active = session.prefetch, session.inMainPass, active.usesSlotAdoption, active.liveTickets > 0 {
                slotScheduler = active
                let claimed = active.claimSplit(missKeys)
                slotClaim = claimed
                let tAdopt = RuntimeClock.now()
                // The pool memory is materialized here (the previous layer's
                // sync evaluated it); the join path below reuses these bases
                // rather than forcing this layer's lazy scatter to run early.
                let bases = currentPoolBases()
                slotBases = bases
                for (j, k) in missKeys.enumerated() {
                    if let ticket = claimed.ready[k] {
                        if let bases, publishSpeculativeSlot(ticket, key: k, bases: bases, scheduler: active) {
                            slotIdx.append(Int32(map[k]!))
                            reservedPins.append(map[k]!)
                            continue
                        }
                        active.noteSlotStale()
                        speculativeSlotStale += 1
                        ticket.discard()
                    } else if claimed.reading[k] != nil {
                        // Deferred: its own slot if it completes, a victim otherwise.
                        slotIdx.append(-1)
                        continue
                    }
                    let s = victim(preferLayer: k.layer)
                    pinned.pin(s)
                    reservedPins.append(s)
                    slotIdx.append(Int32(s))
                    slotDemandOrder.append(j)
                }
                adoptSeconds += RuntimeClock.seconds(since: tAdopt)
                event?.adoptNanos = RuntimeClock.now()
            } else {
                // choose victims first (so scatter is one batched op)
                for k in missKeys {
                    let s = victim(preferLayer: k.layer)
                    pinned.pin(s)
                    reservedPins.append(s)
                    slotIdx.append(Int32(s))
                }
            }
            event?.victimSlots = slotIdx
            reservedHits?(result)
            var readersPending = reservedHits != nil
            func finishResidentReaders() {
                if readersPending { readersPending = false; finishReaders?() }
            }
            defer { finishResidentReaders() }
            // Speculative raw tickets: a complete matching ticket's nine
            // buffers become that record's own staging arrays and are
            // scattered into the slot the victim scan chose above, in the
            // logical demand order. Everything else takes the demand path.
            var demandOrder: [Int] = []
            var scheduler: ExpertPrefetchScheduler? = nil
            var pendingReads: [ExpertKey: ExpertPrefetchTicket] = [:]
            let specs = store.stagingPieceSpecs
            /// Adopt complete tickets into the slots the victim scan chose, in
            /// the logical demand order; returns the miss indices that could
            /// not be adopted and must be read on the demand path.
            func adoptTickets(_ ready: [ExpertKey: ExpertPrefetchTicket]) -> [Int] {
                var fallback: [Int] = []
                var adoptedSlots: [Int32] = []
                var stagedPieces: [[MLXArray]] = Array(repeating: [], count: 9)
                for (j, k) in missKeys.enumerated() where ready[k] != nil {
                    guard let ticket = ready[k], let staged = ticket.makeStagingArrays(shapes: specs) else {
                        fallback.append(j); continue
                    }
                    let s = Int(slotIdx[j])
                    for p in 0 ..< 9 { stagedPieces[p].append(staged[p]) }
                    if let old = keyOf[s] { map.removeValue(forKey: old) }
                    keyOf[s] = k
                    map[k] = s
                    refBit[s] = true
                    adoptedSlots.append(Int32(s))
                    event?.adoptedExperts.append(Int32(k.expert))
                }
                if !adoptedSlots.isEmpty {
                    // One scatter per piece for the whole adopted batch, like the
                    // demand path: the concatenation reads each ticket's own
                    // buffers (their finalizers fire once it has), so the pool
                    // write is a single indexed assignment instead of one per record.
                    let idx = MLXArray(adoptedSlots)
                    for p in 0 ..< 9 {
                        pools[p][idx] = stagedPieces[p].count == 1 ? stagedPieces[p][0] : concatenated(stagedPieces[p], axis: 0)
                    }
                    poolWriteEpoch &+= 1
                    switch Self.scatterMode {
                    case .sync: eval(pools)
                    case .async: asyncEval(pools)
                    case .none: break
                    }
                    recordsAdopted += adoptedSlots.count
                    slotScatterBatches += 1
                }
                return fallback
            }
            if let slotScheduler, let slotClaim {
                scheduler = slotScheduler
                pendingReads = slotClaim.reading
                demandOrder = slotDemandOrder
            } else if let session, let active = session.prefetch, session.inMainPass, active.liveTickets > 0 {
                scheduler = active
                let claimed = active.claimSplit(missKeys)
                pendingReads = claimed.reading
                var readyFallback = Set<Int>()
                if !claimed.ready.isEmpty {
                    let tAdopt = RuntimeClock.now()
                    finishResidentReaders()
                    readyFallback = Set(adoptTickets(claimed.ready))
                    adoptSeconds += RuntimeClock.seconds(since: tAdopt)
                    event?.adoptNanos = RuntimeClock.now()
                }
                for (j, k) in missKeys.enumerated() {
                    if claimed.ready[k] != nil {
                        if readyFallback.contains(j) { demandOrder.append(j) }
                        continue
                    }
                    if pendingReads[k] != nil { continue }
                    demandOrder.append(j)
                }
            } else {
                demandOrder = Array(missKeys.indices)
            }
            let laneBudget = scheduler?.lanes ?? session?.prefetch?.lanes
            // Bound staging independently of how many unique experts this
            // token batch routed. Evaluating each scatter before reading the
            // next slice lets the prior raw buffers be released immediately.
            func readDemand(_ order: [Int]) throws {
                var lo = 0
                while lo < order.count {
                    let hi = min(lo + ExpertStore.defaultLoadBatch, order.count)
                    let batchIndices = Array(order[lo ..< hi])
                    let tIO = RuntimeClock.now()
                    let batch: [MLXArray]
                    laneBudget?.beginDemand()
                    do { batch = try store.readBatchChecked(batchIndices.map { missKeys[$0] }) }
                    catch {
                        laneBudget?.endDemand()
                        ioSeconds += RuntimeClock.seconds(since: tIO)
                        throw error
                    }
                    laneBudget?.endDemand()
                    ioSeconds += RuntimeClock.seconds(since: tIO)
                    finishResidentReaders()
                    if let profile = transferProfile {
                        let start = RuntimeClock.now()
                        eval(pools)
                        profile.scatterPriorWaitSeconds += RuntimeClock.seconds(since: start)
                    }
                    let tScatter = RuntimeClock.now()
                    let destinations = batchIndices.map { slotIdx[$0] }
                    if cpuSlotWrites {
                        for p in 0..<9 { pools[p] = try CPUSlotWrite.apply(to: pools[p], from: batch[p], slots: destinations) }
                        slotCPUBatches += 1
                    } else if wordSlotWrites {
                        let idx = MLXArray(destinations)
                        var eligible = 0
                        for p in 0 ..< 9 {
                            if WordSlotWrite.eligible(pools[p], batch[p]) { eligible += 1 }
                            pools[p] = WordSlotWrite.apply(to: pools[p], from: batch[p], at: idx)
                        }
                        if eligible > 0 { slotWordBatches += 1; slotWordBuffers += eligible }
                        slotScatterBatches += 1
                    } else if contiguousSlotWrites, let runs = SlotWriteRun.plan(destinations, capacity: slots) {
                        for p in 0 ..< 9 { SlotWriteRun.apply(runs, to: pools[p], from: batch[p]) }
                        slotSliceBatches += 1
                        slotSliceRuns += runs.count
                    } else {
                        let idx = MLXArray(destinations)
                        for p in 0 ..< 9 { pools[p][idx] = batch[p] }
                        slotScatterBatches += 1
                    }
                    poolWriteEpoch &+= 1
                    // Complete read buffers are owned by the scatter graph. Each
                    // reader follows that dependency; this is not an asynchronous
                    // CPU write into reusable device storage.
                    for j in batchIndices {
                        let s = Int(slotIdx[j])
                        if let old = keyOf[s] { map.removeValue(forKey: old) }
                        keyOf[s] = missKeys[j]
                        map[missKeys[j]] = s
                        refBit[s] = true
                    }
                    // Decode issues one of these per layer per token, and the
                    // decode split measured the scatter at 20% of decode time
                    // (30.6 ms/token at 30 experts/layer) against a microbenchmark
                    // that writes slots at 49-75 GB/s — the gap is 48 full syncs
                    // per token, not the copy. The gather that follows in the same
                    // layer depends on these arrays, so MLX orders it correctly
                    // without a sync here; the only thing the sync buys is
                    // releasing the staging buffers a layer earlier, which is at
                    // most one layer's misses (~27 MB).
                    switch Self.scatterMode {
                    case .sync: eval(pools)
                    case .async: asyncEval(pools)
                    case .none: break
                    }
                    scatterSeconds += RuntimeClock.seconds(since: tScatter)
                    if let profile = transferProfile {
                        let start = RuntimeClock.now()
                        eval(pools)
                        profile.scatterExecutionSeconds += RuntimeClock.seconds(since: start)
                    }
                    recordsFetched += hi - lo
                    lo = hi
                }
            }
            try readDemand(demandOrder)
            // Tickets that were still reading when demanded: their remaining
            // pieces ran while the demand batch was read. Join them now, adopt
            // the complete ones and read anything else at demand priority.
            if let scheduler, slotScheduler != nil, !pendingReads.isEmpty {
                let finished = scheduler.finishReading(pendingReads)
                let tAdopt = RuntimeClock.now()
                let bases = slotBases
                var rest: [Int] = []
                for (j, k) in missKeys.enumerated() where pendingReads[k] != nil {
                    if let ticket = finished[k] {
                        if let bases, publishSpeculativeSlot(ticket, key: k, bases: bases, scheduler: scheduler) {
                            slotIdx[j] = Int32(map[k]!)
                            reservedPins.append(map[k]!)
                            continue
                        }
                        scheduler.noteSlotStale()
                        speculativeSlotStale += 1
                        ticket.discard()
                    }
                    let s = victim(preferLayer: k.layer)
                    pinned.pin(s)
                    reservedPins.append(s)
                    slotIdx[j] = Int32(s)
                    rest.append(j)
                }
                adoptSeconds += RuntimeClock.seconds(since: tAdopt)
                event?.adoptNanos = RuntimeClock.now()
                if !rest.isEmpty { try readDemand(rest) }
            } else if let scheduler, !pendingReads.isEmpty {
                let finished = scheduler.finishReading(pendingReads)
                let tAdopt = RuntimeClock.now()
                finishResidentReaders()
                let fallback = Set(adoptTickets(finished))
                adoptSeconds += RuntimeClock.seconds(since: tAdopt)
                event?.adoptNanos = RuntimeClock.now()
                var rest: [Int] = []
                for (j, k) in missKeys.enumerated() where pendingReads[k] != nil {
                    if finished[k] == nil || fallback.contains(j) { rest.append(j) }
                }
                if !rest.isEmpty { try readDemand(rest) }
            }
            event?.readNanos = RuntimeClock.now()
            fillSeconds += RuntimeClock.seconds(since: tMiss)
            for (i, j) in missPos { result[i] = Int(slotIdx[j]) }
        }
        if var event, let session {
            event.endNanos = RuntimeClock.now()
            session.demand(event)
        }
        completed = true
        return result
    }

    public func unpinAll() {
        pinned.unpinAll()
    }

    /// How many layer generations a pin survives. One is the original
    /// behaviour, where the next layer's MoE retires the previous layer's pins
    /// before choosing victims, and the engine must therefore drain the GPU at
    /// every layer boundary. Raising it keeps an unevaluated gather's slots out
    /// of every victim scan, which is what lets the barrier be deferred.
    package var pinGenerations: Int = 1 {
        didSet { pinned.configure(depth: pinGenerations) }
    }

    /// Model thread: retire the oldest live pin generation and open a new one.
    /// At depth one this is exactly `unpinAll()`.
    public func advancePinGeneration() {
        pinned.retireGeneration()
    }

    // MARK: slot adoption (speculative reads straight into pool memory)

    /// Install this pool as the scheduler's reservation seam.
    package func attachSpeculativeSlots(to scheduler: ExpertPrefetchScheduler) {
        scheduler.slotProvider = { [unowned self] key in self.reserveSpeculativeSlot(for: key) }
    }

    /// The nine piece base pointers of the current pool memory (shared
    /// storage on Apple silicon), recomputed only after a pool write. Nil when
    /// a piece is not contiguous, which never happens for a zeros-allocated pool.
    private func currentPoolBases() -> [UnsafeMutableRawPointer]? {
        if let cached = basesCache, cached.epoch == poolWriteEpoch { return cached.bases }
        guard pools.count == 9 else { return nil }
        var out: [UnsafeMutableRawPointer] = []
        for piece in pools {
            let wrapped = piece.asData(access: .noCopyIfContiguous)
            guard wrapped.data.count == piece.nbytes else { return nil }
            let base: UnsafeRawPointer? = wrapped.data.withUnsafeBytes { $0.baseAddress }
            guard let base else { return nil }
            out.append(UnsafeMutableRawPointer(mutating: base))
        }
        basesCache = (poolWriteEpoch, out)
        return out
    }

    /// Reserve a victim slot for one speculative record (model thread). The
    /// slot's previous key is evicted now, so a demand for it misses and
    /// reads elsewhere; the slot leaves every victim scan until the worker
    /// has left it or the record is published. Refused when the pool is close
    /// to exhaustion or its memory cannot be addressed.
    package func reserveSpeculativeSlot(for key: ExpertKey) -> SpeculativeSlotReservation? {
        drainReturnedSlots()
        guard slots - pinned.count - inFlightCount > 256, let bases = currentPoolBases() else { return nil }
        var chosen: Int? = nil
        while let candidate = freeSlots.popLast() {
            if keyOf[candidate] == nil, !pinned[candidate], !inFlight[candidate] { chosen = candidate; break }
        }
        let s = chosen ?? victim(preferLayer: key.layer)
        if let old = keyOf[s] {
            map.removeValue(forKey: old)
            keyOf[s] = nil
            lookahead?.prefetch?.noteEvictedKey()
        }
        refBit[s] = false
        inFlight[s] = true
        inFlightCount += 1
        speculativeSlotReservations += 1
        let rowBytes = store.pieceRowBytes
        let destinations = (0 ..< 9).map { bases[$0] + s * rowBytes[$0] }
        return SpeculativeSlotReservation(slot: s, destinations: destinations, pieceBytes: rowBytes, bases: bases,
            onLeave: { [weak self] slot in self?.returnSpeculativeSlot(slot) })
    }

    /// From any thread: the worker has left the slot without a published record.
    private func returnSpeculativeSlot(_ slot: Int) {
        returnedLock.lock(); returnedSlots.append(slot); returnedLock.unlock()
    }

    /// Model thread: give returned slots back to the victim scan.
    private func drainReturnedSlots() {
        returnedLock.lock()
        let drained = returnedSlots
        returnedSlots.removeAll(keepingCapacity: true)
        returnedLock.unlock()
        guard !drained.isEmpty else { return }
        let scheduler = lookahead?.prefetch
        for slot in drained where slot >= 0 && slot < inFlight.count && inFlight[slot] {
            inFlight[slot] = false
            inFlightCount -= 1
            if keyOf[slot] == nil { freeSlots.append(slot) }
            scheduler?.slotReturned()
            scheduler?.noteSlotRelease()
        }
    }

    /// Publish a complete speculative record: the bytes are already in the
    /// slot; refuse if the pool memory moved since the reservation.
    private func publishSpeculativeSlot(_ ticket: ExpertPrefetchTicket, key: ExpertKey,
                                        bases: [UnsafeMutableRawPointer], scheduler: ExpertPrefetchScheduler) -> Bool {
        guard let reservation = ticket.adoptSlot() else { return false }
        let s = reservation.slot
        guard reservation.bases == bases, s >= 0, s < slots, inFlight[s], keyOf[s] == nil else {
            // Stale memory or state: the slot goes back unused and the key is a demand read.
            reservation.workerLeft()
            return false
        }
        inFlight[s] = false
        inFlightCount -= 1
        keyOf[s] = key
        map[key] = s
        refBit[s] = true
        pinned.pin(s)
        recordsAdopted += 1
        speculativeSlotAdoptions += 1
        scheduler.slotPublished()
        scheduler.noteSlotAdopted()
        return true
    }

    // MARK: sweep (prefill passes of SweepTuning.minTokens tokens or more)

    /// Set by the generator around the last pass of a prompt: that sweep
    /// admits each layer's most-used experts into the pool, so the decode
    /// that follows starts on the prompt's hot set instead of cold. Off for
    /// every other pass, so a long prompt never evicts what decode was using
    /// (scan resistance, PLAN §3.3).
    /// How `ensure` finishes its pool writes. `sync` blocks the CPU until the
    /// scatter has run (what shipped through 0.2.3), `async` queues it and
    /// carries on, `none` leaves it to whatever evaluates the pool next.
    /// `SLOTSTREAM_SCATTER_MODE` selects for an A/B.
    enum ScatterMode: String { case sync, async, none }
    static let scatterMode: ScatterMode = {
        let raw = ProcessInfo.processInfo.environment["SLOTSTREAM_SCATTER_MODE"] ?? "none"
        return ScatterMode(rawValue: raw) ?? .async
    }()

    public var admitOnSweep = false
    /// Complete one destination piece at a time while assembling a layer
    /// bank, bounding simultaneous old/new scatter results independently of
    /// MLX buffer donation. Does not change any bytes or reader lifetimes.
    public var workspacePiecewiseWrites = false
    public private(set) var workspacePieceWriteCompletions = 0
    /// Sweep admission can be switched off for an A/B (`SLOTSTREAM_SWEEP_ADMIT=0`).
    static let sweepAdmitEnabled: Bool =
        ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP_ADMIT"] != "0"

    public func isResident(_ key: ExpertKey) -> Bool { map[key] != nil }

    /// Complete CLOCK state for the replay reference: every slot's key (as
    /// layer * experts + expert, or -1), reference bits and the hand.
    package func lookaheadResidencySnapshot() -> ExpertLookaheadResidency {
        let width = cfg.numExperts
        return ExpertLookaheadResidency(
            slotKeys: keyOf.map { $0.map { Int32($0.layer * width + $0.expert) } ?? -1 },
            referenceBits: refBit, hand: hand)
    }

    /// Copies of resident experts' nine pieces, in key order, materialized.
    /// CLOCK bits are left alone: a sweep says nothing about decode locality.
    public func gatherResident(_ keys: [ExpertKey]) -> [MLXArray] {
        let t = RuntimeClock.now()
        let idx = MLXArray(keys.map { Int32(map[$0]!) })
        let out = pools.map { $0[idx] }
        eval(out)
        scatterSeconds += RuntimeClock.seconds(since: t)
        hits += keys.count
        return out
    }

    /// Experts not in the pool, read straight from the checkpoint into
    /// staging (`ExpertStore.readRuns`); the pool is not written.
    public func readStaged(layer: Int, experts: [Int]) -> [MLXArray] {
        do { return try readStagedChecked(layer: layer, experts: experts) }
        catch { preconditionFailure(String(describing: error)) }
    }

    public func readStagedChecked(layer: Int, experts: [Int]) throws -> [MLXArray] {
        let t = RuntimeClock.now()
        defer { ioSeconds += RuntimeClock.seconds(since: t) }
        let out = try store.readRunsChecked(layer: layer, experts: experts)
        misses += experts.count
        recordsFetched += experts.count
        return out
    }

    /// One-layer workspace for a larger read scope. Allocation is explicit:
    /// E full records, plus at most one bounded staging group during assembly.
    /// Original expert IDs address the workspace, so residency never changes
    /// the grouped GEMM's geometry or the order of model contributions.
    func layerWorkspace(layer: Int, experts: [Int]) -> [MLXArray] {
        checkpointCompatibility { try layerWorkspaceChecked(layer: layer, experts: experts) }
    }

    func layerWorkspaceChecked(layer: Int, experts: [Int]) throws -> [MLXArray] {
        let output = Self.poolShapes(cfg.numExperts, cfg).map { MLXArray.zeros($0.shape, dtype: $0.dtype) }
        eval(output)
        let resident = experts.filter { isResident(ExpertKey(layer, $0)) }
        let missing = experts.filter { !isResident(ExpertKey(layer, $0)) }
        for (source, ids) in [resident, missing].enumerated() {
            for lo in stride(from: 0, to: ids.count, by: ExpertStore.defaultLoadBatch) {
                let group = Array(ids[lo ..< min(lo + ExpertStore.defaultLoadBatch, ids.count)])
                let staged = try source == 0
                    ? gatherResident(group.map { ExpertKey(layer, $0) })
                    : readStagedChecked(layer: layer, experts: group)
                let start = RuntimeClock.now()
                let destinations = MLXArray(group.map(Int32.init))
                for piece in output.indices {
                    output[piece][destinations] = staged[piece]
                    if workspacePiecewiseWrites {
                        eval(output[piece])
                        workspacePieceWriteCompletions += 1
                    }
                }
                // All writes finish before this staging group is released.
                // No asynchronous reader can outlive or overwrite this scope.
                if !workspacePiecewiseWrites { eval(output) }
                scatterSeconds += RuntimeClock.seconds(since: start)
            }
        }
        return output
    }

    /// Admit staged experts (experts[i] is row rows[i] of `staged`) into the
    /// pool, evicting by CLOCK; a resident one is marked referenced instead.
    /// The copy out of `staged` is issued now, so the staging arrays can go;
    /// the pool writes stay lazy until `commitAdmissions`.
    public func admit(layer: Int, experts: [Int], rows: [Int], from staged: [MLXArray]) {
        var victims: [Int32] = []
        var src: [Int32] = []
        for (e, row) in zip(experts, rows) {
            let key = ExpertKey(layer, e)
            if let s = map[key] {
                refBit[s] = true
                continue
            }
            let s = victim()
            if let old = keyOf[s] { map.removeValue(forKey: old) }
            keyOf[s] = key
            map[key] = s
            refBit[s] = true
            victims.append(Int32(s))
            src.append(Int32(row))
        }
        if let session = lookahead, session.observer != nil, !victims.isEmpty {
            session.admissions(layer: layer, experts: zip(experts, rows).compactMap { e, _ in
                map[ExpertKey(layer, e)].map { _ in Int32(e) } })
        }
        guard !victims.isEmpty else { return }
        let from = MLXArray(src)
        let picked = staged.map { $0[from] }
        asyncEval(picked)
        let dst = MLXArray(victims)
        for p in 0 ..< 9 { pools[p][dst] = picked[p] }
        poolWriteEpoch &+= 1
        pendingAdmissions += victims.count
    }
    private var pendingAdmissions = 0
    /// Materialize the pool writes queued by `admit` (once per layer).
    public func commitAdmissions() {
        guard pendingAdmissions > 0 else { return }
        let t = RuntimeClock.now()
        eval(pools)
        scatterSeconds += RuntimeClock.seconds(since: t)
        pendingAdmissions = 0
    }

    /// Where prefill time actually goes. Split out because "prefill is slow"
    /// is not actionable: reading the records, scattering them into the pool,
    /// and the compute over them are three different problems with three
    /// different fixes — and measuring the split is what showed the chunk size
    /// was the lever and read-ahead was not.
    public private(set) var ioSeconds = 0.0
    public private(set) var scatterSeconds = 0.0
    public private(set) var fillSeconds = 0.0
    public private(set) var recordsFetched = 0

    /// Sweep diagnostics (`SLOTSTREAM_SWEEP_TRACE=1`): time spent waiting for
    /// the GPU to finish a staging group, and sorting rows on the CPU.
    public var sweepWaitSeconds = 0.0
    public var sweepSortSeconds = 0.0

    public var hitRate: Double {
        let t = hits + misses
        return t == 0 ? 0 : Double(hits) / Double(t)
    }

    public func resetStats() {
        slotSliceBatches = 0
        slotSliceRuns = 0
        slotScatterBatches = 0
        slotWordBatches = 0
        slotWordBuffers = 0
        slotCPUBatches = 0
        floorLocalVictims = 0
        hits = 0
        misses = 0
        ioSeconds = 0
        scatterSeconds = 0
        fillSeconds = 0
        recordsFetched = 0
        recordsAdopted = 0
        adoptSeconds = 0
        sweepWaitSeconds = 0
        sweepSortSeconds = 0
    }
}
