// N-gram / PLE store: exact reimplementation of the reference hashing
// (splitmix64-derived multipliers, per-head primes, XOR mixing) with rows
// pread from the checkpoint shards and dequantized on CPU.
//
// Per token: 16 rows × 160 dims (bigram + trigram × 8 heads) = 2560 values.
// Authoritative multipliers/sizes/offsets come from the checkpoint's int64
// buffers; the seed-derived computation is only a checked fallback.

import Foundation
import MLX

enum Splitmix {
    static let mask: UInt64 = 0xFFFF_FFFF_FFFF_FFFF
    static let gamma: UInt64 = 0x9E37_79B9_7F4A_7C15
    static let m1: UInt64 = 0xBF58_476D_1CE4_E5B9
    static let m2: UInt64 = 0x94D0_49BB_1331_11EB

    static func mix(_ v0: UInt64) -> UInt64 {
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
@inline(__always) func bf16Round(_ x: Float) -> Float {
    let bits = x.bitPattern
    let lsb = (bits >> 16) & 1
    let rounded = bits &+ 0x7FFF &+ lsb
    return Float(bitPattern: rounded & 0xFFFF_0000)
}

@inline(__always) func bf16ToFloat(_ u: UInt16) -> Float {
    Float(bitPattern: UInt32(u) << 16)
}

public final class NgramStore {
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
    let eos: Int64

    // shard tensor refs
    private var wRefs: [TensorRef] = []
    private var sRefs: [TensorRef] = []
    private var bRefs: [TensorRef] = []
    private let wRowBytes: Int
    private let sRowBytes: Int

    // row cache: gid -> dequantized f32 row (already bf16-rounded)
    private var cache: [Int64: [Float]] = [:]
    private var cacheOrder: [Int64] = []
    private let cacheCap = 400_000
    public private(set) var rowHits = 0
    public private(set) var rowMisses = 0

    public init(index: CheckpointIndex, resident: ResidentWeights) {
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

    private func fetchRow(_ gid: Int64) -> [Float] {
        if let r = cache[gid] {
            rowHits += 1
            return r
        }
        rowMisses += 1
        let shard = Int(gid) / rowsPerShard
        let row = Int(gid) % rowsPerShard
        var wRaw = [UInt8](repeating: 0, count: wRowBytes)
        var sRaw = [UInt8](repeating: 0, count: sRowBytes)
        var bRaw = [UInt8](repeating: 0, count: sRowBytes)
        wRaw.withUnsafeMutableBytes { index.pread(into: $0.baseAddress!, wRefs[shard], offset: row * wRowBytes, count: wRowBytes) }
        sRaw.withUnsafeMutableBytes { index.pread(into: $0.baseAddress!, sRefs[shard], offset: row * sRowBytes, count: sRowBytes) }
        bRaw.withUnsafeMutableBytes { index.pread(into: $0.baseAddress!, bRefs[shard], offset: row * sRowBytes, count: sRowBytes) }

        let g = cfg.ngramQGroup
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
        if cache.count >= cacheCap {
            // FIFO eviction of oldest 10%
            let n = cacheCap / 10
            for k in cacheOrder.prefix(n) { cache.removeValue(forKey: k) }
            cacheOrder.removeFirst(n)
        }
        cache[gid] = out
        cacheOrder.append(gid)
        return out
    }

    /// Fetch + dequantize one row by global id (test/verification hook).
    public func debugRow(_ gid: Int64) -> [Float] {
        fetchRow(gid)
    }

    /// Embedding for the last nNew positions: returns (1, nNew, pleEmbedDim) bf16.
    public func embedding(history: [Int64], nNew: Int) -> MLXArray {
        let gids = rowIds(history: history, nNew: nNew)
        var flat = [Float]()
        flat.reserveCapacity(nNew * cfg.pleEmbedDim)
        for pos in gids {
            for gid in pos {
                flat.append(contentsOf: fetchRow(gid))
            }
        }
        return MLXArray(flat, [1, nNew, cfg.pleEmbedDim]).asType(.bfloat16)
    }
}
