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
    public var recordBytes: Int { pieceRowBytes.reduce(0, +) }

    public init(index: CheckpointIndex) {
        self.index = index
        self.cfg = index.config
        for l in 0 ..< cfg.numLayers {
            let base = "model.layers.\(l).mlp.switch_mlp."
            refs.append(Self.pieces.map { index.ref(base + $0) })
        }
        pieceRowBytes = refs[0].map { $0.rowBytes }
    }

    /// Read a batch of experts (QD-parallel pread) and return the 9 stacked
    /// MLXArrays shaped [n, ...piece shape...] ready to scatter into the pool.
    public func readBatch(_ keys: [ExpertKey], queueDepth: Int = 12) -> [MLXArray] {
        let n = keys.count
        precondition(n > 0)
        // one staging buffer per piece
        var buffers: [UnsafeMutableRawPointer] = []
        for pb in pieceRowBytes {
            var p: UnsafeMutableRawPointer? = nil
            posix_memalign(&p, 16384, n * pb)
            buffers.append(p!)
        }
        defer { buffers.forEach { free($0) } }

        // 9n reads, spread across worker lanes
        let jobs: [(piece: Int, slot: Int)] = (0 ..< n).flatMap { s in (0 ..< 9).map { (piece: $0, slot: s) } }
        let lanes = min(queueDepth, jobs.count)
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

        // wrap buffers as MLXArrays
        var out: [MLXArray] = []
        for (p, r) in refs[0][0 ..< 9].enumerated() {
            let pb = pieceRowBytes[p]
            let shape = [n] + Array(r.shape.dropFirst())
            let arr: MLXArray
            switch r.dtype {
            case "U32":
                let count = n * pb / 4
                let vals = [UInt32](unsafeUninitializedCapacity: count) { dst, initialized in
                    memcpy(dst.baseAddress!, buffers[p], count * 4)
                    initialized = count
                }
                arr = MLXArray(vals, shape)
            case "BF16":
                let count = n * pb / 2
                let vals = [UInt16](unsafeUninitializedCapacity: count) { dst, initialized in
                    memcpy(dst.baseAddress!, buffers[p], count * 2)
                    initialized = count
                }
                arr = MLXArray(vals, shape).view(dtype: .bfloat16)
            default:
                fatalError("unexpected expert dtype \(r.dtype)")
            }
            out.append(arr)
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
            let batch = store.readBatch(missKeys)
            let idx = MLXArray(slotIdx)
            for p in 0 ..< 9 {
                pools[p][idx] = batch[p]
            }
            eval(pools)
            for (j, i) in missPos.enumerated() { result[i] = Int(slotIdx[j]) }
        }
        return result
    }

    public func unpinAll() {
        for i in 0 ..< slots where pinned[i] { pinned[i] = false }
    }

    public var hitRate: Double {
        let t = hits + misses
        return t == 0 ? 0 : Double(hits) / Double(t)
    }

    public func resetStats() {
        hits = 0
        misses = 0
    }
}
