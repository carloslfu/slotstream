// Streams routed-expert records from the original checkpoint shards into the
// slot pool. One expert = 9 tensor pieces (gate/up/down × weight/scales/biases),
// each contiguous per expert inside its [512, R, C] shard tensor (verified M0).

import Foundation
import MLX

public struct ExpertKey: Hashable {
    public let layer: Int
    public let expert: Int
    public init(_ l: Int, _ e: Int) {
        layer = l
        expert = e
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
        let n = keys.count
        precondition(n > 0)
        let buffers = allocateStaging(rows: n)
        // 9n reads, spread across worker lanes
        let jobs: [(piece: Int, slot: Int)] = (0 ..< n).flatMap { s in (0 ..< 9).map { (piece: $0, slot: s) } }
        let lanes = min(max(queueDepth, 1), jobs.count)
        DispatchQueue.concurrentPerform(iterations: lanes) { lane in
            var j = lane
            while j < jobs.count {
                let (p, s) = jobs[j]
                let key = keys[s]
                let r = refs[key.layer][p]
                let pb = pieceRowBytes[p]
                index.pread(
                    into: buffers[p] + s * pb, r, offset: key.expert * pb, count: pb)
                j += lanes
            }
        }

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
        let n = experts.count
        precondition(n > 0)
        let buffers = allocateStaging(rows: n)
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
                index.pread(
                    into: buffers[p] + row * pb, refs[layer][p], offset: experts[row] * pb,
                    count: len * pb)
            }
        }
        return stagingArrays(buffers, rows: n)
    }

    /// One 16 KiB-aligned staging buffer per piece, `rows` records each.
    private func allocateStaging(rows n: Int) -> [UnsafeMutableRawPointer] {
        var buffers: [UnsafeMutableRawPointer] = []
        for pb in pieceRowBytes {
            var p: UnsafeMutableRawPointer? = nil
            let rc = posix_memalign(&p, 16384, n * pb)
            guard rc == 0, let p else {
                buffers.forEach { free($0) }
                // Nothing above can recover a partial expert batch, but the
                // message should say what ran out rather than trapping on nil.
                fatalError(
                    "out of memory staging \(n) expert records (\(n * pb) B): "
                        + "lower --experts-per-layer or --memory-gb")
            }
            buffers.append(p)
        }
        return buffers
    }

    /// Transfer each aligned staging buffer directly to MLX. The previous
    /// path copied every 1.4 GB batch into a Swift Array and then copied it
    /// again into MLX, so raw + Swift + MLX copies coexisted at peak and
    /// were invisible to MLX's allocator counter.
    private func stagingArrays(_ buffers: [UnsafeMutableRawPointer], rows n: Int) -> [MLXArray] {
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
            out.append(MLXArray(rawPointer: owned, shape, dtype: dtype) { free(owned) })
        }
        eval(out)
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

    private var map: [ExpertKey: Int] = [:]
    private var keyOf: [ExpertKey?]
    private var refBit: [Bool]
    private var pinned: [Bool]
    private var hand = 0
    public private(set) var hits = 0
    public private(set) var misses = 0

    public var poolBytes: Int { pools.reduce(0) { $0 + $1.nbytes } }
    /// Bytes per expert record, measured from the checkpoint headers.
    public var recordBytes: Int { store.recordBytes }
    /// The cache size in the per-layer unit of intuition (the pool itself is
    /// global and shared -- hot layers borrow from cold ones).
    public var slotsPerLayer: Double { Double(slots) / Double(cfg.numLayers) }

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
        self.keyOf = Array(repeating: nil, count: slots)
        self.refBit = Array(repeating: false, count: slots)
        self.pinned = Array(repeating: false, count: slots)
        pools = Self.poolShapes(slots, cfg).map { MLXArray.zeros($0.shape, dtype: $0.dtype) }
        eval(pools)
    }

    /// Resize the pool. Must only be called between requests (the caller holds
    /// the engine's generation lock); stale pins are cleared, not honored.
    ///
    /// Grow keeps the cached contents: each piece is gathered into its larger
    /// replacement one at a time, so the transient overhead stays bounded by
    /// one piece — and growth only happens when availability covers the new
    /// pool anyway. Shrink FREES the old tensors before allocating the small
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
        if n > slots {
            // grow, preserving contents in the slot-index prefix
            let occupied = (0 ..< slots).filter { keyOf[$0] != nil }
            let idx = MLXArray(occupied.map(Int32.init))
            var newKeyOf: [ExpertKey?] = Array(repeating: nil, count: n)
            var newRef = Array(repeating: false, count: n)
            map.removeAll(keepingCapacity: true)
            for (i, s) in occupied.enumerated() {
                newKeyOf[i] = keyOf[s]
                newRef[i] = refBit[s]
                map[keyOf[s]!] = i
            }
            for (p, spec) in Self.poolShapes(n, cfg).enumerated() {
                let np = MLXArray.zeros(spec.shape, dtype: spec.dtype)
                if !occupied.isEmpty { np[0 ..< occupied.count] = pools[p][idx] }
                eval(np)
                pools[p] = np  // old piece freed here, bounding the transient
            }
            keyOf = newKeyOf
            refBit = newRef
            pinned = Array(repeating: false, count: n)
            hand = occupied.count % n
        } else {
            // shrink: free first, allocate after, start cold
            pools = []
            map.removeAll(keepingCapacity: true)
            keyOf = Array(repeating: nil, count: n)
            refBit = Array(repeating: false, count: n)
            pinned = Array(repeating: false, count: n)
            hand = 0
            pools = Self.poolShapes(n, cfg).map { MLXArray.zeros($0.shape, dtype: $0.dtype) }
            eval(pools)
        }
        slots = n
    }

    private func victim() -> Int {
        var scanned = 0
        while true {
            let s = hand
            hand = (hand + 1) % slots
            if pinned[s] {
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
        var result = Array(repeating: -1, count: keys.count)
        var missKeys: [ExpertKey] = []
        var missPos: [Int] = []
        for (i, k) in keys.enumerated() {
            if let s = map[k] {
                result[i] = s
                refBit[s] = true
                pinned[s] = true
                hits += 1
            } else {
                missKeys.append(k)
                missPos.append(i)
                misses += 1
            }
        }
        if !missKeys.isEmpty {
            let tMiss = Date()
            // choose victims first (so scatter is one batched op)
            var slotIdx: [Int32] = []
            for k in missKeys {
                let s = victim()
                if let old = keyOf[s] { map.removeValue(forKey: old) }
                keyOf[s] = k
                map[k] = s
                refBit[s] = true
                pinned[s] = true
                slotIdx.append(Int32(s))
            }
            // Bound staging independently of how many unique experts this
            // token batch routed. Evaluating each scatter before reading the
            // next slice lets the prior raw buffers be released immediately.
            var lo = 0
            while lo < missKeys.count {
                let hi = min(lo + ExpertStore.defaultLoadBatch, missKeys.count)
                let tIO = Date()
                let batch = store.readBatch(Array(missKeys[lo ..< hi]))
                ioSeconds += -tIO.timeIntervalSinceNow
                let tScatter = Date()
                let idx = MLXArray(Array(slotIdx[lo ..< hi]))
                for p in 0 ..< 9 {
                    pools[p][idx] = batch[p]
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
                scatterSeconds += -tScatter.timeIntervalSinceNow
                lo = hi
            }
            recordsFetched += missKeys.count
            fillSeconds += -tMiss.timeIntervalSinceNow
            for (j, i) in missPos.enumerated() { result[i] = Int(slotIdx[j]) }
        }
        return result
    }

    public func unpinAll() {
        for i in 0 ..< slots where pinned[i] { pinned[i] = false }
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
    /// Sweep admission can be switched off for an A/B (`SLOTSTREAM_SWEEP_ADMIT=0`).
    static let sweepAdmitEnabled: Bool =
        ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP_ADMIT"] != "0"

    public func isResident(_ key: ExpertKey) -> Bool { map[key] != nil }

    /// Copies of resident experts' nine pieces, in key order, materialized.
    /// CLOCK bits are left alone: a sweep says nothing about decode locality.
    public func gatherResident(_ keys: [ExpertKey]) -> [MLXArray] {
        let t = Date()
        let idx = MLXArray(keys.map { Int32(map[$0]!) })
        let out = pools.map { $0[idx] }
        eval(out)
        scatterSeconds += -t.timeIntervalSinceNow
        hits += keys.count
        return out
    }

    /// Experts not in the pool, read straight from the checkpoint into
    /// staging (`ExpertStore.readRuns`); the pool is not written.
    public func readStaged(layer: Int, experts: [Int]) -> [MLXArray] {
        let t = Date()
        let out = store.readRuns(layer: layer, experts: experts)
        ioSeconds += -t.timeIntervalSinceNow
        misses += experts.count
        recordsFetched += experts.count
        return out
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
        guard !victims.isEmpty else { return }
        let from = MLXArray(src)
        let picked = staged.map { $0[from] }
        asyncEval(picked)
        let dst = MLXArray(victims)
        for p in 0 ..< 9 { pools[p][dst] = picked[p] }
        pendingAdmissions += victims.count
    }
    private var pendingAdmissions = 0
    /// Materialize the pool writes queued by `admit` (once per layer).
    public func commitAdmissions() {
        guard pendingAdmissions > 0 else { return }
        let t = Date()
        eval(pools)
        scatterSeconds += -t.timeIntervalSinceNow
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
        hits = 0
        misses = 0
        ioSeconds = 0
        scatterSeconds = 0
        fillSeconds = 0
        recordsFetched = 0
        sweepWaitSeconds = 0
        sweepSortSeconds = 0
    }
}
