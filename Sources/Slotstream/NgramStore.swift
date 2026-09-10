// N-gram / PLE store: exact reimplementation of the reference hashing
// (splitmix64-derived multipliers, per-head primes, XOR mixing) with rows
// pread from the checkpoint shards and dequantized on CPU.
//
// Per token: 16 rows × 160 dims (bigram + trigram × 8 heads) = 2560 values.
// Authoritative multipliers/sizes/offsets come from the checkpoint's int64
// buffers; the seed-derived computation is only a checked fallback.

import Foundation
import MLX

public enum Splitmix {
    static let gamma: UInt64 = 0x9E37_79B9_7F4A_7C15
    static let m1: UInt64 = 0xBF58_476D_1CE4_E5B9
    static let m2: UInt64 = 0x94D0_49BB_1331_11EB

    public static func mix(_ v0: UInt64) -> UInt64 {
        var v = v0 &+ gamma
        v = (v ^ (v >> 30)) &* m1
        v = (v ^ (v >> 27)) &* m2
        return v ^ (v >> 31)
    }

    static func isPrime(_ v: Int) -> Bool {
        if v < 2 { return false }
        if v % 2 == 0 { return v == 2 }
        var d = 3
        while d * d <= v {
            if v % d == 0 { return false }
            d += 2
        }
        return true
    }

    static func nthPrimeAfter(_ start: Int, _ count: Int) -> Int {
        var p = start
        for _ in 0 ..< count {
            p += 1
            while !isPrime(p) { p += 1 }
        }
        return p
    }
}

/// Round a Float to bfloat16 precision (round-to-nearest-even), matching the
/// dtype the GPU dequant produces in the reference path.
@inline(__always) public func bf16Round(_ x: Float) -> Float {
    let bits = x.bitPattern
    let lsb = (bits >> 16) & 1
    let rounded = bits &+ 0x7FFF &+ lsb
    return Float(bitPattern: rounded & 0xFFFF_0000)
}

@inline(__always) func bf16ToFloat(_ u: UInt16) -> Float {
    Float(bitPattern: UInt32(u) << 16)
}

public final class NgramStore {
    deinit { pendingPrefetch?.cancelAndJoin() }
    let cfg: ModelConfig
    let index: CheckpointIndex
    let pleLayerIndex: Int  // layer index in the stack (config id − 1)
    let plePosition: Int  // position within pleLayerIds (0 here)

    // authoritative buffers
    public private(set) var multipliers: [Int64] = []
    public private(set) var headSizes: [Int64] = []
    public private(set) var headOffsets: [Int64] = []
    public let rowsPerShard: Int
    public let headDim: Int  // 160
    public let nHeads: Int  // 16
    public var rowCapacity: Int { rowsPerShard * cfg.splitNgramParts }
    let eos: Int64

    // shard tensor refs
    private var wRefs: [TensorRef] = []
    private var sRefs: [TensorRef] = []
    private var bRefs: [TensorRef] = []
    private var readHandles: [[TensorReadHandle]]?
    private let rowReader: RowReader
    private var cacheRevision: UInt64 = 0
    private var pendingPrefetch: NgramPrefetch?
    package private(set) var lookaheadRowsConsumed = 0
    package private(set) var lookaheadTicketsDiscarded = 0
    package private(set) var lookaheadWaitSeconds = 0.0
    package private(set) var prefetchSeconds = 0.0
    package func resetObservation() {
        lookaheadRowsConsumed = 0; lookaheadTicketsDiscarded = 0
        lookaheadWaitSeconds = 0; prefetchSeconds = 0
    }
    package var hasPendingPrefetch: Bool { pendingPrefetch != nil }
    private func invalidateLookahead() {
        cacheRevision += 1
        if let pendingPrefetch { discardPrefetch(pendingPrefetch) }
    }
    package var readFault: ReadFault?
    package var readHandleCount: Int { readHandles?.reduce(0) { $0 + $1.count } ?? 0 }
    package var directReadHandles = false {
        didSet {
            guard oldValue != directReadHandles else { return }
            invalidateLookahead()
            readHandles = directReadHandles ? [wRefs, sRefs, bRefs].map { $0.map { index.readHandle(for: $0) } } : nil
        }
    }
    private let wRowBytes: Int
    private let sRowBytes: Int

    // row cache: gid -> dequantized f32 row (already bf16-rounded)
    private var cache: [Int64: [Float]] = [:]
    private var compactCache: [Int64: [UInt16]] = [:]
    /// Stores the bits of already BF16-rounded values. Changing mode drops
    /// the performance cache only; model state and row values do not change.
    public var compactRows = false {
        didSet {
            if oldValue != compactRows {
                clearRows()
            }
        }
    }
    private var cacheOrder: [Int64] = []
    private var ringOrder: FIFOKeys
    public var ringEvictionOrder = false {
        didSet { if oldValue != ringEvictionOrder { clearRows() } }
    }
    private func clearRows() {
        invalidateLookahead()
        cache.removeAll(); compactCache.removeAll(); cacheOrder.removeAll(); ringOrder.removeAll()
    }
    private let cacheCap: Int
    public var cachedRowCount: Int { compactRows ? compactCache.count : cache.count }
    /// Payload only; dictionary/array allocation overhead is measured by the
    /// process observer rather than misrepresented as part of this count.
    public var cachedPayloadBytes: Int { cachedRowCount * headDim * (compactRows ? 2 : 4) }
    public private(set) var rowHits = 0
    public private(set) var rowMisses = 0

    public init(index: CheckpointIndex, resident: ResidentWeights, cacheCapacity: Int = 400_000) {
        precondition(cacheCapacity >= 1 && cacheCapacity <= 400_000)
        self.cacheCap = cacheCapacity
        self.ringOrder = FIFOKeys(capacity: cacheCapacity)
        self.index = index
        self.cfg = index.config
        self.pleLayerIndex = cfg.pleLayerIndices[0]
        self.plePosition = 0
        self.nHeads = (cfg.ngramSize - 1) * cfg.headsPerNgram
        self.headDim = cfg.pleEmbedDim / nHeads
        self.eos = Int64(cfg.eosTokenId)

        let base = "model.layers.\(pleLayerIndex).ple.ple_embedding."
        if resident.has(base + "layer_multipliers") {
            multipliers = resident.tensor(base + "layer_multipliers").asArray(Int64.self)
            headSizes = resident.tensor(base + "ngram_heads_vocab_sizes").asArray(Int64.self)
            headOffsets = resident.tensor(base + "ngram_heads_offsets").asArray(Int64.self)
        } else {
            // fallback: recompute from config (reference default path)
            var sizes: [Int64] = []
            var offsets: [Int64] = []
            var total: Int64 = 0
            for h in 0 ..< nHeads {
                let g = plePosition * nHeads + h
                let s = Splitmix.nthPrimeAfter(cfg.ngramVocabBase - 1, g + 1)
                sizes.append(Int64(s))
                offsets.append(total)
                total += Int64(s)
            }
            headSizes = sizes
            headOffsets = offsets
            let maxLong: Int64 = .max
            let half = max(1, (maxLong / Int64(max(cfg.vocabSize, 1))) / 2)
            let baseSeed = UInt64(bitPattern: Int64(cfg.seed)) &+ UInt64(Splitmix.gamma) &* UInt64(0)
            var m: [Int64] = []
            for i in 0 ..< cfg.ngramSize {
                let mixed = Splitmix.mix(baseSeed &+ Splitmix.gamma &* UInt64(i + 1))
                m.append(2 &* Int64(bitPattern: mixed % UInt64(half)) &+ 1)
            }
            multipliers = m
        }

        let total = headSizes.reduce(Int64(0), +)
        let div = Int64(cfg.ngramDivisibleBy)
        let padded = (total + div - 1) / div * div
        self.rowsPerShard = Int((padded + Int64(cfg.splitNgramParts) - 1) / Int64(cfg.splitNgramParts))

        for s in 0 ..< cfg.splitNgramParts {
            let b = base + "ngram_embedding.shard_\(s)."
            wRefs.append(index.ref(b + "weight"))
            sRefs.append(index.ref(b + "scales"))
            bRefs.append(index.ref(b + "biases"))
        }
        wRowBytes = wRefs[0].rowBytes
        sRowBytes = sRefs[0].rowBytes
        rowReader = RowReader(index:index,rowsPerShard:rowsPerShard,headDim:headDim,qGroup:cfg.ngramQGroup,
            wRefs:wRefs,sRefs:sRefs,bRefs:bRefs,wRowBytes:wRowBytes,sRowBytes:sRowBytes)
    }

    // MARK: hashing (CPU, exact)

    /// Right-shift by `shift` without crossing EOS boundaries; positions with
    /// insufficient in-segment history yield EOS. Mirrors reference `_shift_right`.
    func shiftRight(_ ids: [Int64], _ shift: Int) -> [Int64] {
        if shift == 0 { return ids }
        let t = ids.count
        var out = Array(repeating: eos, count: t)
        var prevEos = -1
        for p in 0 ..< t {
            // prev = index of last EOS at position strictly before p
            // (inclusive-cummax of eos positions, shifted by one)
            let inSegment = p - (prevEos + 1)
            let src = p - shift
            if inSegment >= shift && src >= 0 {
                out[p] = ids[src]
            }
            if ids[p] == eos { prevEos = p }
        }
        return out
    }

    /// Global row ids for the last `nNew` positions of `history` (prevCtx + new ids).
    public func rowIds(history: [Int64], nNew: Int) -> [[Int64]] {
        let shifted = (0 ..< cfg.ngramSize).map { shiftRight(history, $0) }
        let t = history.count
        var out: [[Int64]] = Array(repeating: Array(repeating: 0, count: nHeads), count: nNew)
        for (oi, p) in ((t - nNew) ..< t).enumerated() {
            var col = 0
            for ngram in 2 ... cfg.ngramSize {
                let lo = (ngram - 2) * cfg.headsPerNgram
                var mixed = shifted[0][p] &* multipliers[0]
                for q in 1 ..< ngram {
                    mixed ^= shifted[q][p] &* multipliers[q]
                }
                for h in lo ..< (lo + cfg.headsPerNgram) {
                    let m = headSizes[h]
                    var r = mixed % m
                    if r < 0 { r += m }
                    out[oi][col] = r + headOffsets[h]
                    col += 1
                }
            }
        }
        return out
    }

    // MARK: row fetch + dequant

    private func fetchRow(_ gid: Int64) throws -> [Float] {
        if compactRows, let r = compactCache[gid] {
            rowHits += 1
            return r.map(bf16ToFloat)
        }
        if let r = cache[gid] {
            rowHits += 1
            return r
        }
        rowMisses += 1
        let out = try readRow(gid)
        insert(gid, out)
        return out
    }

    /// Three preads and the dequant for one row. Pure: touches no shared
    /// state, so `prefetch` can run it on many lanes at once.
    private func readRow(_ gid: Int64) throws -> [Float] {
        try rowReader.read(gid,handles:readHandles,fault:readFault)
    }

    /// Immutable geometry plus an owned index. A worker captures descriptor
    /// and fault references before dispatch, so main-thread option changes
    /// cannot race its reads or close a descriptor it is using.
    private struct RowReader {
        let index: CheckpointIndex
        let rowsPerShard: Int
        let headDim: Int
        let qGroup: Int
        let wRefs: [TensorRef]
        let sRefs: [TensorRef]
        let bRefs: [TensorRef]
        let wRowBytes: Int
        let sRowBytes: Int
        func read(_ gid: Int64,handles: [[TensorReadHandle]]?,fault: ReadFault?,shouldContinue: () -> Bool = { true }) throws -> [Float] {
            guard let value = Int(exactly: gid), value >= 0, value / rowsPerShard < wRefs.count,
                value % rowsPerShard < wRefs[value / rowsPerShard].shape[0]
            else { throw CheckpointReadError.invalidRange }
            try fault?.beforeRead()
            let shard = Int(gid) / rowsPerShard
            let row = Int(gid) % rowsPerShard
            var wRaw = [UInt8](repeating: 0, count: wRowBytes)
            var sRaw = [UInt8](repeating: 0, count: sRowBytes)
            var bRaw = [UInt8](repeating: 0, count: sRowBytes)
            if let handles {
                try wRaw.withUnsafeMutableBytes { try handles[0][shard].readChecked(into: $0.baseAddress!, offset: row * wRowBytes, count: wRowBytes,shouldContinue:shouldContinue) }
                try sRaw.withUnsafeMutableBytes { try handles[1][shard].readChecked(into: $0.baseAddress!, offset: row * sRowBytes, count: sRowBytes,shouldContinue:shouldContinue) }
                try bRaw.withUnsafeMutableBytes { try handles[2][shard].readChecked(into: $0.baseAddress!, offset: row * sRowBytes, count: sRowBytes,shouldContinue:shouldContinue) }
            } else {
                try wRaw.withUnsafeMutableBytes { try index.preadChecked(into: $0.baseAddress!, wRefs[shard], offset: row * wRowBytes, count: wRowBytes,shouldContinue:shouldContinue) }
                try sRaw.withUnsafeMutableBytes { try index.preadChecked(into: $0.baseAddress!, sRefs[shard], offset: row * sRowBytes, count: sRowBytes,shouldContinue:shouldContinue) }
                try bRaw.withUnsafeMutableBytes { try index.preadChecked(into: $0.baseAddress!, bRefs[shard], offset: row * sRowBytes, count: sRowBytes,shouldContinue:shouldContinue) }
            }

            let g = qGroup
            var out = [Float](repeating: 0, count: headDim)
            wRaw.withUnsafeBytes { wp in
                sRaw.withUnsafeBytes { sp in
                    bRaw.withUnsafeBytes { bp in
                        let words = wp.bindMemory(to: UInt32.self)
                        let scales = sp.bindMemory(to: UInt16.self)
                        let biases = bp.bindMemory(to: UInt16.self)
                        for j in 0 ..< headDim {
                            let q = Float((words[j / 8] >> UInt32(4 * (j % 8))) & 0xF)
                            let sc = bf16ToFloat(scales[j / g])
                            let bi = bf16ToFloat(biases[j / g])
                            out[j] = bf16Round(sc * q + bi)
                        }
                    }
                }
            }
            return out
        }
    }

    private func insert(_ gid: Int64, _ row: [Float]) {
        invalidateLookahead()
        if (compactRows ? compactCache.count : cache.count) >= cacheCap {
            // FIFO eviction of oldest 10%
            let n = max(1, cacheCap / 10)
            for j in 0..<n {
                let k = ringEvictionOrder ? ringOrder.popFirst()! : cacheOrder[j]
                if compactRows { compactCache.removeValue(forKey: k) }
                else { cache.removeValue(forKey: k) }
            }
            if !ringEvictionOrder { cacheOrder.removeFirst(n) }
        }
        if compactRows { compactCache[gid] = row.map { UInt16(truncatingIfNeeded: $0.bitPattern >> 16) } }
        else { cache[gid] = row }
        if ringEvictionOrder { ringOrder.append(gid) }
        else { cacheOrder.append(gid) }
    }

    /// Read every row of a pass that the cache lacks, in parallel, before the
    /// embedding is assembled. Each row is three ~100-byte preads at an SSD
    /// latency of ~55 µs, and a token needs sixteen rows: fetched one at a
    /// time on the calling thread, ordinary prose cost about 3 ms per token
    /// (35 s of a 10k-token prompt, in both the pool path and the sweep),
    /// while repeated text hid it behind the row cache. The rows of the whole
    /// pass are known from the ids alone (PLAN §3.3), so nothing is
    /// speculative here; the cache is filled in first-appearance order, so it
    /// holds exactly what the serial path would have held.
    static let prefetchLanes = 32
    /// At most 1024 tokens / 16384 rows (~10.5 MB FP32 payload), further
    /// bounded by row-cache capacity. No cache or statistics are published by
    /// the worker. The regular prefetch retains first-appearance insertion.
    package func beginPrefetch(history: [Int64], nNew: Int, maxTokens: Int = 1024) throws -> NgramPrefetch? {
        guard nNew >= 0, nNew <= history.count, maxTokens >= 1, maxTokens <= 1024 else {
            throw CheckpointReadError.invalidRange
        }
        if let pendingPrefetch { discardPrefetch(pendingPrefetch) }
        let room = max(0,cacheCap-cachedRowCount)
        let count = min(nNew,maxTokens,room/nHeads)
        guard count > 0 else { return nil }
        let past = min(history.count-nNew,cfg.ngramSize-1)
        let begin = history.count-nNew-past
        let ids = Array(history[begin..<history.count-nNew+count])
        let gids = rowIds(history:ids,nNew:count).flatMap { $0 }
        var seen = Set<Int64>()
        let missing = gids.filter { (compactRows ? compactCache[$0] == nil : cache[$0] == nil) && seen.insert($0).inserted }
        guard !missing.isEmpty else { return nil }
        let reader = rowReader, handles = readHandles, fault = readFault
        let ticket = NgramPrefetch(prefix:gids,missing:missing,cacheRevision:cacheRevision,
            reader:{ try reader.read($0,handles:handles,fault:fault,shouldContinue:$1) })
        pendingPrefetch = ticket
        return ticket
    }
    package func discardPrefetch(_ ticket: NgramPrefetch) {
        if pendingPrefetch === ticket { pendingPrefetch = nil; lookaheadTicketsDiscarded += 1 }
        ticket.cancelAndJoin()
    }
    private func takePrefetched(_ gids: [Int64]) throws -> [Int64:[Float]] {
        guard let ticket = pendingPrefetch else { return [:] }
        pendingPrefetch = nil
        defer { ticket.cancelAndJoin() }
        guard ticket.cacheRevision == cacheRevision, gids.starts(with:ticket.prefix) else {
            lookaheadTicketsDiscarded += 1
            return [:]
        }
        let start = RuntimeClock.now()
        defer { lookaheadWaitSeconds += RuntimeClock.seconds(since:start) }
        let rows: [[Float]]
        do { rows = try ticket.joinedRows() }
        catch { lookaheadTicketsDiscarded += 1; throw error }
        lookaheadRowsConsumed += rows.count
        return Dictionary(uniqueKeysWithValues:zip(ticket.missing,rows))
    }
    private func prefetch(_ gids: [Int64]) throws {
        let start = RuntimeClock.now()
        defer { prefetchSeconds += RuntimeClock.seconds(since:start) }
        var missing: [Int64] = []
        var seen = Set<Int64>()
        for g in gids where (compactRows ? compactCache[g] == nil : cache[g] == nil)
            && seen.insert(g).inserted { missing.append(g) }
        rowHits += gids.count - missing.count  // the rest were already resident, or repeats of a missing one
        rowMisses += missing.count
        let prepared = try takePrefetched(gids)
        guard missing.count > 1 else {
            if let g = missing.first { insert(g, try prepared[g] ?? readRow(g)) }
            return
        }
        var rows = [[Float]](repeating: [], count: missing.count)
        let lanes = min(Self.prefetchLanes, missing.count)
        let failure = JoinedReadFailure()
        rows.withUnsafeMutableBufferPointer { buf in
            DispatchQueue.concurrentPerform(iterations: lanes) { lane in
                var j = lane
                while j < missing.count {
                    do { buf[j] = try prepared[missing[j]] ?? self.readRow(missing[j]) }
                    catch { failure.record(error) }
                    j += lanes
                }
            }
        }
        try failure.finish()
        for (j, g) in missing.enumerated() { insert(g, rows[j]) }
    }

    /// Row-cache counters are per generation, like the expert pool's.
    public func resetStats() {
        rowHits = 0
        rowMisses = 0
    }

    /// Fetch + dequantize one row by global id (test/verification hook).
    public func debugRow(_ gid: Int64) -> [Float] {
        checkpointCompatibility { try debugRowChecked(gid) }
    }

    public func debugRowChecked(_ gid: Int64) throws -> [Float] {
        try fetchRow(gid)
    }

    /// Embedding for the last nNew positions: returns (1, nNew, pleEmbedDim) bf16.
    public func embedding(history: [Int64], nNew: Int) -> MLXArray {
        checkpointCompatibility { try embeddingChecked(history: history, nNew: nNew) }
    }

    public func embeddingChecked(history: [Int64], nNew: Int) throws -> MLXArray {
        guard nNew >= 0, nNew <= history.count else { throw CheckpointReadError.invalidRange }
        let gids = rowIds(history: history, nNew: nNew)
        try prefetch(gids.flatMap { $0 })
        if compactRows {
            var flat: [UInt16] = []
            flat.reserveCapacity(nNew * cfg.pleEmbedDim)
            for pos in gids {
                for gid in pos {
                    if let row = compactCache[gid] { flat.append(contentsOf: row) }
                    else { flat.append(contentsOf: try fetchRow(gid).map { UInt16(truncatingIfNeeded: $0.bitPattern >> 16) }) }
                }
            }
            return MLXArray(flat, [1, nNew, cfg.pleEmbedDim]).view(dtype: .bfloat16)
        }
        var flat = [Float]()
        flat.reserveCapacity(nNew * cfg.pleEmbedDim)
        for pos in gids {
            for gid in pos {
                // Every row is resident after the prefetch; counted there.
                flat.append(contentsOf: try cache[gid] ?? fetchRow(gid))
            }
        }
        return MLXArray(flat, [1, nNew, cfg.pleEmbedDim]).asType(.bfloat16)
    }
}
