// qwen4_exp blocks, ported 1:1 from the vendored reference implementation
// (Tools/reference/qwen4_exp.py). Weights come from ResidentWeights (trunk)
// and SlotPool/NgramStore (streamed).

import Foundation
import MLX
import MLXFast
import MLXNN

// MARK: - norms

/// RMSNorm; with groupSize set, statistics are computed per group of `groupSize`
/// (hyper-connections normalize each of the hc streams separately).
struct RMSNorm {
    let weight: MLXArray
    let eps: Float
    let groupSize: Int?

    func callAsFunction(_ x: MLXArray, compiledFinish: Bool = false) -> MLXArray {
        guard let g = groupSize else {
            return MLXFast.rmsNorm(x, weight: weight, eps: eps)
        }
        let shape = x.shape
        var v = x.reshaped(Array(shape.dropLast()) + [-1, g])
        let vf = v.asType(.float32)
        if compiledFinish, CompiledArithmetic.prepare() {
            let result = CompiledArithmetic.execute(v, meanSquare: vf.square().mean(axis: -1, keepDims: true),
                weight: weight.reshaped([-1, g]), epsilon: eps)
            return result.reshaped(shape)
        }
        v = (vf * rsqrt(vf.square().mean(axis: -1, keepDims: true) + eps)).asType(x.dtype)
        return v.reshaped(shape) * weight
    }
}

/// Gated RMSNorm used by GDN output (sigmoid gate for this model).
struct RMSNormGated {
    let weight: MLXArray
    let eps: Float
    let sigmoidGate: Bool

    func callAsFunction(_ x: MLXArray, gate: MLXArray) -> MLXArray {
        let out = MLXFast.rmsNorm(x, weight: weight, eps: eps)
        let gf = gate.asType(.float32)
        let g = sigmoidGate ? sigmoid(gf) : MLXNN.silu(gf)
        return (g * out.asType(.float32)).asType(x.dtype)
    }
}

@inline(__always) func l2normQK(_ x: MLXArray, eps: Float = 1e-6) -> MLXArray {
    let xf = x.asType(.float32)
    return (xf * rsqrt(xf.square().sum(axis: -1, keepDims: true) + eps)).asType(x.dtype)
}

// MARK: - rope

public struct Rope {
    let invFreq: MLXArray  // (dim/2) f32
    let dim: Int
    private let tables = RopeTables()
    public var sharedTables: Bool {
        get { tables.enabled }
        nonmutating set { tables.configure(newValue) }
    }

    package var fusedRotation: Bool {
        get { tables.fusedRotation }
        nonmutating set { tables.fusedRotation = newValue }
    }
    package var fusedRotationsScheduled: Int { tables.fusedRotationsScheduled }
    package var tableHits: Int { tables.hits }
    package var tableBuilds: Int { tables.builds }

    package func rotate(_ x: MLXArray, _ cosine: MLXArray, _ sine: MLXArray) -> MLXArray {
        guard tables.fusedRotation, PartialRotation.supported(x, cosine, sine) else {
            return ropePartial(x, cosine, sine)
        }
        tables.fusedRotationsScheduled += 1
        return PartialRotation.apply(x, cosine, sine)
    }

    public init(dim: Int, base: Float) {
        self.dim = dim
        let exps = MLXArray(stride(from: 0, to: Int32(dim), by: 2).map { Float($0) / Float(dim) })
        self.invFreq = pow(MLXArray(base), -exps)
    }

    /// positions (B, T) -> cos/sin (B, T, dim)
    func callAsFunction(_ positions: MLXArray) -> (MLXArray, MLXArray) {
        let freqs = positions.asType(.float32).expandedDimensions(axis: -1) * invFreq
        let emb = concatenated([freqs, freqs], axis: -1)
        return (cos(emb), sin(emb))
    }

    /// All text, image placeholders and draft entries use absolute cache
    /// positions. Equal geometry within this Rope instance shares angles;
    /// values are still formed by the reference multiply/cos/sin sequence.
    package func table(start: Int, count: Int, stride: Int = 1) -> (MLXArray, MLXArray) {
        tables.get(start: start, count: count, stride: stride) {
            self(MLXArray((0 ..< count).map { Int32(start + $0 * stride) }).expandedDimensions(axis: 0))
        }
    }

}

private final class RopeTables {
    struct Key: Equatable { let start: Int; let count: Int; let stride: Int }
    private var entries: [(Key, (MLXArray, MLXArray))] = []
    private(set) var enabled = false
    var fusedRotation = false
    var fusedRotationsScheduled = 0
    private(set) var hits = 0
    private(set) var builds = 0
    func configure(_ enabled: Bool) {
        if self.enabled != enabled { entries.removeAll(); self.enabled = enabled }
    }
    func get(start: Int, count: Int, stride: Int, make: () -> (MLXArray, MLXArray)) -> (MLXArray, MLXArray) {
        guard enabled else { builds += 1; return make() }
        let key = Key(start: start, count: count, stride: stride)
        if let i = entries.firstIndex(where: { $0.0 == key }) {
            hits += 1
            let entry = entries.remove(at: i); entries.append(entry); return entry.1
        }
        builds += 1
        let value = make()
        // One query range and one completed-block range. This never grows
        // with conversation count or context iterations.
        if entries.count == 2 { entries.removeFirst() }
        entries.append((key, value))
        return value
    }
}

/// Apply rope to the first `d` dims only (partial rotary), NeoX half-rotation.
func ropePartial(_ x: MLXArray, _ cosA: MLXArray, _ sinA: MLXArray) -> MLXArray {
    let d = cosA.dim(-1)
    let c = cosA.asType(x.dtype)
    let s = sinA.asType(x.dtype)
    let xr = x[.ellipsis, 0 ..< d]
    let xp = x[.ellipsis, d...]
    let half = d / 2
    let x1 = xr[.ellipsis, 0 ..< half]
    let x2 = xr[.ellipsis, half...]
    let rot = concatenated([-x2, x1], axis: -1)
    let rotated = xr * c + rot * s
    return xp.dim(-1) > 0 ? concatenated([rotated, xp], axis: -1) : rotated
}

// MARK: - caches

final class KVCache {
    var keys: MLXArray?
    var values: MLXArray?
    var offset = 0
    let step = 1024
    var allocatedBytes: Int { (keys?.nbytes ?? 0) + (values?.nbytes ?? 0) }

    /// Distinct Swift array contexts share the existing MLX storage. Indexed
    /// updates then retain the other branch's reader and copy on write.
    func copyForPrefix(to target: KVCache) {
        target.keys = keys.map { $0.reshaped($0.shape) }
        target.values = values.map { $0.reshaped($0.shape) }
        target.offset = offset
    }

    func updateAndFetch(_ k: MLXArray, _ v: MLXArray) -> (MLXArray, MLXArray) {
        let prev = offset
        let s = k.dim(2)
        if keys == nil || prev + s > keys!.dim(2) {
            let newCap = ((prev + s + step - 1) / step) * step
            let b = k.dim(0)
            let h = k.dim(1)
            let grownK = MLXArray.zeros([b, h, newCap, k.dim(3)], dtype: k.dtype)
            let grownV = MLXArray.zeros([b, h, newCap, v.dim(3)], dtype: v.dtype)
            if let ok = keys, prev > 0 {
                grownK[0..., 0..., 0 ..< prev, 0...] = ok[0..., 0..., 0 ..< prev, 0...]
                grownV[0..., 0..., 0 ..< prev, 0...] = values![0..., 0..., 0 ..< prev, 0...]
            }
            keys = grownK
            values = grownV
        }
        keys![0..., 0..., prev ..< (prev + s), 0...] = k
        values![0..., 0..., prev ..< (prev + s), 0...] = v
        offset = prev + s
        return (keys![0..., 0..., 0 ..< offset, 0...], values![0..., 0..., 0 ..< offset, 0...])
    }

    /// Roll back to `n` entries. Bytes past `n` stay in the buffer but are
    /// dead: the next update writes over them, and fetches slice 0..<offset.
    func trim(to n: Int) { offset = min(offset, max(0, n)) }
}

/// Grown in blocks like KVCache rather than re-concatenated per token: a
/// fresh `concatenated` every step copies the whole cache each time, which is
/// quadratic in context length. Values are identical either way.
package final class IndexerCache {
    private var buf: MLXArray?  // (B, cap, dim)
    private var pooledBuf: MLXArray?
    private var pooledCount = 0
    private var pooledRatio = 1
    package private(set) var offset = 0
    package private(set) var rawBase = 0
    package let compactRaw: Bool
    private var preserveRaw = false
    let step = 1024
    package var allocatedBytes: Int { (buf?.nbytes ?? 0) + (pooledBuf?.nbytes ?? 0) }
    package var rawAllocatedBytes: Int { buf?.nbytes ?? 0 }
    package var pooledAllocatedBytes: Int { pooledBuf?.nbytes ?? 0 }
    package init(compactRaw: Bool = false) { self.compactRaw = compactRaw }

    func copyForPrefix(to target: IndexerCache) {
        precondition(target.compactRaw == compactRaw)
        target.buf = buf.map { $0.reshaped($0.shape) }
        target.pooledBuf = pooledBuf.map { $0.reshaped($0.shape) }
        target.pooledCount = pooledCount; target.pooledRatio = pooledRatio
        target.offset = offset; target.rawBase = rawBase
        target.preserveRaw = false
    }

    func forkForPrefix() -> IndexerCache {
        let result = IndexerCache(compactRaw: compactRaw)
        copyForPrefix(to: result)
        return result
    }

    package func prefixForkFields() -> [String: MLXArray] {
        var result = ["offset": MLXArray(Int64(offset)), "rawBase": MLXArray(Int64(rawBase)),
            "pooledCount": MLXArray(Int64(pooledCount)), "pooledRatio": MLXArray(Int64(pooledRatio))]
        if let pooledBuf, pooledCount > 0 { result["pooled"] = pooledBuf[0..., 0 ..< pooledCount, 0...] }
        return result
    }

    package struct Snapshot {
        fileprivate var raw: MLXArray?
        fileprivate var pooled: MLXArray?
        fileprivate var offset: Int
        fileprivate var rawBase: Int
        fileprivate var pooledCount: Int
        fileprivate var ratio: Int
    }

    package func snapshot() -> Snapshot? {
        guard compactRaw else { return nil }
        return Snapshot(raw: buf, pooled: pooledBuf, offset: offset, rawBase: rawBase,
                        pooledCount: pooledCount, ratio: pooledRatio)
    }

    package func restore(_ saved: Snapshot) {
        buf = saved.raw; pooledBuf = saved.pooled; offset = saved.offset
        rawBase = saved.rawBase; pooledCount = saved.pooledCount; pooledRatio = saved.ratio
        preserveRaw = false
        materializeStorage()
    }

    /// A recording pass can have an arbitrary public length. Keep all its
    /// raw rows until rollback chooses its committed position; no draft-depth
    /// assumption is allowed to change State.rollback's contract.
    package func preserveRecordingRows(_ on: Bool) {
        preserveRaw = on
        if !on { compactCompletedRaw() }
    }

    package func update(_ k: MLXArray) -> MLXArray {
        let s = k.dim(1)
        let live = offset - rawBase
        let allocationStep = compactRaw && rawBase > 0 ? 256 : step
        if buf == nil || live + s > buf!.dim(1) {
            let newCap = ((live + s + allocationStep - 1) / allocationStep) * allocationStep
            let grown = MLXArray.zeros([k.dim(0), newCap, k.dim(2)], dtype: k.dtype)
            if let old = buf, live > 0 {
                grown[0..., 0 ..< live, 0...] = old[0..., 0 ..< live, 0...]
            }
            buf = grown
        }
        buf![0..., live ..< (live + s), 0...] = k
        offset += s
        return buf![0..., 0 ..< (offset - rawBase), 0...]
    }

    /// Roll back to `n` entries (see KVCache.trim).
    package func trim(to n: Int) {
        precondition(!compactRaw || max(0, n) >= rawBase, "released indexer history requires its checkpoint")
        offset = min(offset, max(0, n))
        // A partial block must be rebuilt from the retained raw rows after
        // speculation overwrites its rejected suffix.
        pooledCount = min(pooledCount, offset / pooledRatio)
    }

    package func completedBlocks(
        count: Int, ratio: Int, transform: (Int, Int) -> MLXArray
    ) -> MLXArray {
        precondition(count > 0 && ratio > 0)
        if pooledRatio != ratio {
            precondition(rawBase == 0, "released indexer history cannot change compression ratio")
            pooledBuf = nil; pooledCount = 0; pooledRatio = ratio
        }
        if count > pooledCount {
            let added = transform(pooledCount, count)
            if pooledBuf == nil || pooledBuf!.dim(1) < count {
                let capacity = ((count + 255) / 256) * 256
                let grown = MLXArray.zeros([added.dim(0), capacity, added.dim(2)], dtype: added.dtype)
                if let old = pooledBuf, pooledCount > 0 {
                    grown[0..., 0 ..< pooledCount, 0...] = old[0..., 0 ..< pooledCount, 0...]
                }
                pooledBuf = grown
            }
            pooledBuf![0..., pooledCount ..< count, 0...] = added
            pooledCount = count
        }
        compactCompletedRaw()
        return pooledBuf![0..., 0 ..< count, 0...]
    }

    private func compactCompletedRaw() {
        guard compactRaw, !preserveRaw, let old = buf, pooledCount > 0 else { return }
        // Only completed keys can replace raw rows. Retain a small aligned
        // tail and amortize copies; a StateCheckpoint owns any earlier undo.
        let first = min(pooledCount * pooledRatio, max(0, offset - 32) / pooledRatio * pooledRatio)
        guard first - rawBase >= 256 else { return }
        let live = offset - first
        let capacity = max(256, ((live + 255) / 256) * 256)
        let owned = MLXArray.zeros([old.dim(0), capacity, old.dim(2)], dtype: old.dtype)
        if live > 0 { owned[0..., 0 ..< live, 0...] = old[0..., (first - rawBase) ..< (offset - rawBase), 0...] }
        // Complete both dependents before dropping their oversized parent.
        if let pooledBuf { eval(owned, pooledBuf) } else { eval(owned) }
        buf = owned; rawBase = first
    }

    package func materializeStorage() {
        if let b = buf { eval(b) }
        if let p = pooledBuf { eval(p) }
    }

    package func diagnosticValues() -> MLXArray? {
        buf.map { $0[0..., 0 ..< (offset - rawBase), 0...] }
    }
}

final class LinearCache {
    var convState: MLXArray?  // (B, K-1, convDim)
    var ssmState: MLXArray?  // (B, Hv, Dv, Dk) f32
    var pleConvState: MLXArray?  // (B, (k-1)*dilation, hcDim)
    var ngramCtx: [Int64] = []  // rolling last (ngramSize-1) token ids
    /// While a speculative verify pass runs, the state after each of its
    /// positions (index t = state after consuming t+1 of the pass's
    /// tokens), so a rejection rolls back by position instead of re-running
    /// the kept tokens. Empty outside a recording pass.
    var record = false
    var convStates: [MLXArray] = []
    var ssmStates: [MLXArray] = []
    var pleConvStates: [MLXArray] = []

    func forkForPrefix() throws -> LinearCache {
        guard !record, convStates.isEmpty, ssmStates.isEmpty, pleConvStates.isEmpty else {
            throw ModelError("cannot fork a prefix during speculative state recording")
        }
        let result = LinearCache()
        // Windows must not keep a whole prefill activation alive. Full FP32
        // recurrent arrays are already replaced on every recurrence step.
        result.convState = convState.map { contiguous($0).reshaped($0.shape) }
        result.pleConvState = pleConvState.map { contiguous($0).reshaped($0.shape) }
        result.ssmState = ssmState.map { $0.reshaped($0.shape) }
        result.ngramCtx = ngramCtx
        eval([result.convState, result.pleConvState, result.ssmState].compactMap { $0 })
        return result
    }

    func compactWindows() {
        if let window = convState { convState = contiguous(window) }
        if let window = pleConvState { pleConvState = contiguous(window) }
        // eval alone does not detach a view. contiguous copies oversized
        // backing allocations in the pinned MLX implementation.
        // Both copies are independent and already retain their inputs. Submit
        // them together so one synchronization materializes both owned windows.
        let windows = [convState, pleConvState].compactMap { $0 }
        if !windows.isEmpty { eval(windows) }
        // Recording windows intentionally share one bounded verify parent.
        // rollback compacts the selected window after releasing the others.
    }

    func clearRecording() {
        record = false
        convStates = []
        ssmStates = []
        pleConvStates = []
    }
}

// MARK: - QSA (sparse attention)

final class QSAIndexer {
    var minimumProjectionRows = 0
    var incrementalBlocks = false
    var denseBypass = false
    var specializedSelector = false
    private(set) var specializedRows = 0
    let cfg: ModelConfig
    let proj: QLinear
    let qNorm: RMSNorm
    let kNorm: RMSNorm
    let blockTopK: Int

    convenience init(_ w: TensorSource, layer: Int) {
        self.init(w, base: "model.layers.\(layer).self_attn.indexer")
    }

    init(_ w: TensorSource, base b: String) {
        cfg = w.config
        proj = w.linear(b + ".index_qk_proj")
        qNorm = RMSNorm(weight: w.tensor(b + ".q_layernorm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        kNorm = RMSNorm(weight: w.tensor(b + ".k_layernorm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        blockTopK = cfg.indexerBudget / cfg.indexerCompressRatio
    }

    /// Preparation appends each key once. Query tiles subsequently select
    /// from this same full block domain, so partition tie order stays defined
    /// by the original block IDs, including invisible blocks.
    func prepare(_ x: MLXArray, rope: Rope, cache: IndexerCache?, offset: Int) -> QSASelection? {
        let (B, S) = (x.dim(0), x.dim(1))
        let qk = proj(x, minimumRows: minimumProjectionRows)
        let split = cfg.indexerNHeads * cfg.indexerHeadDim
        var q = qk[.ellipsis, 0 ..< split].reshaped([B, S, cfg.indexerNHeads, cfg.indexerHeadDim])
        var rawK = qk[.ellipsis, split...].reshaped([B, S, cfg.indexerHeadDim])
        if let c = cache { rawK = c.update(rawK) }
        let kvLen = cache?.offset ?? rawK.dim(1)
        if kvLen <= cfg.indexerBudget { return nil }

        let ratio = cfg.indexerCompressRatio
        let nBlocks = kvLen / ratio
        let rawBase = cache?.rawBase ?? 0
        let blockStarts = MLXArray((0 ..< nBlocks).map { Int32($0 * ratio) })
        func transform(_ lo: Int, _ hi: Int) -> MLXArray {
            let rows = rawK[0..., (lo * ratio - rawBase) ..< (hi * ratio - rawBase), 0...]
                .reshaped([B, hi - lo, ratio, cfg.indexerHeadDim])
            let normalized = kNorm(rows.asType(.float32).mean(axis: 2).asType(rawK.dtype))
            let (cK, sK) = rope.table(start: lo * ratio, count: hi - lo, stride: ratio)
            return rope.rotate(normalized, cK, sK)
        }
        let pooled: MLXArray
        if let cache, incrementalBlocks || cache.compactRaw {
            pooled = cache.completedBlocks(count: nBlocks, ratio: ratio, transform: transform)
        } else { pooled = transform(0, nBlocks) }

        let (cQ, sQ) = rope.table(start: offset, count: S)
        q = qNorm(q)
        q = rope.rotate(
            q, cQ.expandedDimensions(axis: 2), sQ.expandedDimensions(axis: 2))

        return QSASelection(q: q, pooled: pooled, blockStarts: blockStarts,
                            offset: offset, kvLen: kvLen, ratio: ratio,
                            blockTopK: blockTopK, headDim: cfg.indexerHeadDim,
                            denseBypass: denseBypass, specializedSelector: specializedSelector,
                            onSpecialized: specializedSelector ? { [weak self] count in self?.specializedRows += count } : nil)
    }

    /// Original full-pass mask remains available as the exact reference.
    func appendKeysOnly(_ x: MLXArray, rope: Rope, cache: IndexerCache) {
        let split = cfg.indexerNHeads * cfg.indexerHeadDim
        let raw = proj(x, minimumRows: minimumProjectionRows)[.ellipsis, split...].reshaped([x.dim(0), x.dim(1), cfg.indexerHeadDim])
        let rows = cache.update(raw)
        if cache.compactRaw, cache.offset > cfg.indexerBudget {
            let ratio = cfg.indexerCompressRatio, base = cache.rawBase
            _ = cache.completedBlocks(count: cache.offset / ratio, ratio: ratio) { lo, hi in
                let block = rows[0..., (lo * ratio - base) ..< (hi * ratio - base), 0...]
                    .reshaped([x.dim(0), hi - lo, ratio, cfg.indexerHeadDim])
                let normalized = self.kNorm(block.asType(.float32).mean(axis: 2).asType(rows.dtype))
                let (c, s) = rope.table(start: lo * ratio, count: hi - lo, stride: ratio)
                return rope.rotate(normalized, c, s)
            }
        }
        cache.materializeStorage()
    }

    /// Original full-pass mask remains available as the exact reference.
    func callAsFunction(_ x: MLXArray, rope: Rope, cache: IndexerCache?, offset: Int) -> MLXArray? {
        prepare(x, rope: rope, cache: cache, offset: offset)?
            .mask(lo: 0, hi: x.dim(1), keyEnd: offset + x.dim(1))
    }
}

/// Prepared indexer inputs; scores and keep masks live only for one query
/// tile. It owns no state and cannot append or rewind cache entries.
package struct QSASelection {
    let q: MLXArray
    let pooled: MLXArray
    let blockStarts: MLXArray
    let offset: Int
    let kvLen: Int
    let ratio: Int
    let blockTopK: Int
    let headDim: Int
    let denseBypass: Bool
    let specializedSelector: Bool
    let onSpecialized: ((Int) -> Void)?

    package init(q: MLXArray, pooled: MLXArray, blockStarts: MLXArray,
                 offset: Int, kvLen: Int, ratio: Int, blockTopK: Int,
                 headDim: Int, denseBypass: Bool = false, specializedSelector: Bool = false,
                 onSpecialized: ((Int) -> Void)? = nil) {
        self.q = q; self.pooled = pooled; self.blockStarts = blockStarts
        self.offset = offset; self.kvLen = kvLen; self.ratio = ratio
        self.blockTopK = blockTopK; self.headDim = headDim
        self.denseBypass = denseBypass
        self.specializedSelector = specializedSelector
        self.onSpecialized = onSpecialized
    }

    package func mask(lo: Int, hi: Int, keyEnd: Int) -> MLXArray {
        let (B, S, nBlocks) = (q.dim(0), hi - lo, pooled.dim(1))
        let qPos = MLXArray((offset + lo ..< offset + hi).map { Int32($0) })
        // At query p there are floor((p+1)/ratio) complete visible blocks.
        // If even the last query fits the selection budget, all visible
        // blocks plus its partial own block are exactly the causal keep set.
        // Keep a boolean mask and the same full key domain/attention shapes;
        // switching to a different causal-kernel dispatch is a separate probe.
        if denseBypass, ratio > 0, (offset + hi) / ratio <= blockTopK {
            // NaN visible scores sort after invisible -infinity in the pinned
            // selector, so "all visible fit" alone is insufficient. This
            // conservative operand bound excludes NaNs/infinities and leaves
            // ample headroom against dot-product/head-sum overflow. Its scalar
            // synchronization cost belongs in this candidate's timing gate.
            let terms = Float(headDim) * Float(q.dim(2))
            let limit = sqrt(Float.greatestFiniteMagnitude / max(1, terms)) / 4
            let bounded = (abs(q[0..., lo ..< hi, 0..., 0...]).asType(.float32) .<= limit).all()
                .&& (abs(pooled).asType(.float32) .<= limit).all()
            if bounded.item(Bool.self) {
                let keys = MLXArray((0 ..< keyEnd).map(Int32.init)).reshaped([1, 1, keyEnd])
                return broadcast(keys .<= qPos.reshaped([1, S, 1]), to: [B, S, keyEnd])
                    .expandedDimensions(axis: 1)
            }
        }
        var scores = einsum(
            "bshd,bnd->bsnh", q[0..., lo ..< hi, 0..., 0...].asType(.float32), pooled.asType(.float32))
        scores = maximum(scores, 0).sum(axis: -1) / sqrt(Float(headDim))

        let blockEnd = blockStarts + Int32(ratio - 1)
        let visible = blockEnd.reshaped([1, 1, nBlocks]) .<= qPos.reshaped([1, S, 1])
        scores = which(visible, scores, MLXArray(-Float.infinity))

        let k = min(blockTopK, nBlocks)
        let keepBlock: MLXArray
        if specializedSelector {
            if BlockSelection.supported(scores, k: k), BlockSelection.prepare() { onSpecialized?(B * S) }
            keepBlock = BlockSelection.keep(scores, k: k, enabled: true) .&& visible
        } else {
            var top = argPartition(-scores, kth: k - 1, axis: -1)[.ellipsis, ..<k].asType(.int32)
            top = which(takeAlong(broadcast(visible, to: [B, S, nBlocks]), top, axis: -1), top, MLXArray(Int32(nBlocks)))
            var storage = MLXArray.zeros([B, S, nBlocks + 1], dtype: .bool)
            storage = putAlong(storage, top, values: MLXArray(true), axis: -1)
            keepBlock = storage[.ellipsis, ..<nBlocks]
        }

        var keep = repeated(keepBlock, count: ratio, axis: -1)
        let tail = kvLen - nBlocks * ratio
        if tail > 0 {
            keep = concatenated([keep, MLXArray.zeros([B, S, tail], dtype: .bool)], axis: -1)
        }
        let keyPos = MLXArray((0 ..< kvLen).map { Int32($0) }).reshaped([1, 1, kvLen])
        let qp = qPos.reshaped([1, S, 1])
        // MLX tensor `/` is true division even for Int32 inputs. Flooring
        // here is essential: otherwise ownBlockStart becomes qp+1 and every
        // partial current block is silently omitted from sparse attention.
        let ownBlockStart = floorDivide(qp + 1, Int32(ratio)) * Int32(ratio)
        let ownTail = (keyPos .>= ownBlockStart) .&& (keyPos .<= qp)
        keep = (keep .|| ownTail) .&& (keyPos .<= qp)
        return keep[0..., 0..., 0 ..< keyEnd].expandedDimensions(axis: 1)
    }

    /// Unchanged score arithmetic and original partition domain. Only the
    /// selected complete-block IDs escape; the attention consumer reconstructs
    /// causality and the own partial block from absolute query positions.
    package func compactBlocks(lo: Int, hi: Int) -> MLXArray {
        let (B, S, nBlocks) = (q.dim(0), hi - lo, pooled.dim(1))
        let positions = MLXArray((offset + lo ..< offset + hi).map(Int32.init))
        var scores = einsum("bshd,bnd->bsnh",
            q[0..., lo ..< hi, 0..., 0...].asType(.float32), pooled.asType(.float32))
        scores = maximum(scores, 0).sum(axis: -1) / sqrt(Float(headDim))
        let visible = (blockStarts + Int32(ratio - 1)).reshaped([1, 1, nBlocks])
            .<= positions.reshaped([1, S, 1])
        scores = which(visible, scores, MLXArray(-Float.infinity))
        let count = min(blockTopK, nBlocks)
        let top = argPartition(-scores, kth: count - 1, axis: -1)[.ellipsis, ..<count].asType(.int32)
        return which(takeAlong(broadcast(visible, to: [B, S, nBlocks]), top, axis: -1),
            top, MLXArray(Int32(nBlocks)))
    }
}

final class QSAAttention {
    var minimumProjectionRows = 0
    var stableSmallKeyDomain = false
    var smallReferenceStart = 0
    var smallReferenceEnd = ContextPolicy.modelLimit
    private(set) var paddedSmallKeyDomains = 0
    private(set) var paddedSmallQueryRows = 0
    var boundedIndexer = false
    var selectedAttention = false
    private(set) var selectedAttentionTiles = 0
    var debugSink: ((String, MLXArray) -> Void)? = nil
    let cfg: ModelConfig
    let qProj: QLinear
    let kProj: QLinear
    let vProj: QLinear
    let oProj: QLinear
    let qNorm: RMSNorm
    let kNorm: RMSNorm
    let indexer: QSAIndexer
    let scale: Float

    convenience init(_ w: TensorSource, layer: Int) {
        self.init(w, base: "model.layers.\(layer).self_attn")
    }

    init(_ w: TensorSource, base b: String) {
        cfg = w.config
        qProj = w.linear(b + ".q_proj")
        kProj = w.linear(b + ".k_proj")
        vProj = w.linear(b + ".v_proj")
        oProj = w.linear(b + ".o_proj")
        qNorm = RMSNorm(weight: w.tensor(b + ".q_norm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        kNorm = RMSNorm(weight: w.tensor(b + ".k_norm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        indexer = QSAIndexer(w, base: b + ".indexer")
        scale = 1.0 / sqrt(Float(cfg.headDim))
    }

    /// An intermediate terminal layer needs only keys and values for later
    /// tokens. Keep the same full-row projection/norm/RoPE shapes and finish
    /// cache writes; queries, attention outputs and MoE cannot affect state.
    func appendKeysOnly(_ x: MLXArray, rope: Rope, cache: KVCache, idxCache: IndexerCache) {
        let (B, S, D) = (x.dim(0), x.dim(1), cfg.headDim)
        let offset = cache.offset
        indexer.appendKeysOnly(x, rope: rope, cache: idxCache)
        var k = kNorm(kProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, cfg.numKVHeads, D])).transposed(0, 2, 1, 3)
        let v = vProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, cfg.numKVHeads, D]).transposed(0, 2, 1, 3)
        let (c, s) = rope.table(start: offset, count: S)
        k = rope.rotate(k, c.expandedDimensions(axis: 1), s.expandedDimensions(axis: 1))
        let retained = cache.updateAndFetch(k, v)
        eval(retained.0, retained.1)
    }

    func callAsFunction(
        _ x: MLXArray, rope: Rope, cache: KVCache, idxCache: IndexerCache, lastQueryOnly: Bool = false
    ) -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        let offset = cache.offset
        let H = cfg.numAttentionHeads
        let D = cfg.headDim

        let selection = indexer.prepare(x, rope: rope, cache: idxCache, offset: offset)
        let pruneLastQuery = lastQueryOnly && S > InferenceOptimizations.terminalQueryTile
        let useSelected = selectedAttention && S > 8 && !pruneLastQuery
        let sparse = boundedIndexer || useSelected || pruneLastQuery ? nil : selection?.mask(lo: 0, hi: S, keyEnd: offset + S)

        let qg = qProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, H, 2 * D])
        var q = qg[.ellipsis, 0 ..< D]
        let gate = qg[.ellipsis, D...].reshaped([B, S, H * D])
        debugSink?("qgRaw", qg)
        q = qNorm(q).transposed(0, 2, 1, 3)
        var k = kNorm(kProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, cfg.numKVHeads, D])).transposed(0, 2, 1, 3)
        var v = vProj(x, minimumRows: minimumProjectionRows).reshaped([B, S, cfg.numKVHeads, D]).transposed(0, 2, 1, 3)
        debugSink?("qNormed", q)
        debugSink?("kNormed", k)
        debugSink?("v", v)

        var (c, s) = rope.table(start: offset, count: S)
        c = c.expandedDimensions(axis: 1)
        s = s.expandedDimensions(axis: 1)
        q = rope.rotate(q, c, s)
        k = rope.rotate(k, c, s)

        (k, v) = cache.updateAndFetch(k, v)

        if pruneLastQuery {
            // Preserve matrix dispatch with one 64-row terminal tile. The
            // single-query predecessor changed final router rank. This bounded
            // successor has its own unchanged numerical/state gates; shorter
            // passes retain their entire original attention/HC geometry.
            let rows = InferenceOptimizations.terminalQueryTile
            let first = S - rows
            let queries = q[0..., 0..., first..., 0...]
            let mask = selection?.mask(lo: first, hi: S, keyEnd: offset + S)
            let attended = Self.attend(q: queries, k: k, v: v, sparse: mask,
                base: offset + first, scale: scale, block: rows)
            let flattened = attended.transposed(0, 2, 1, 3).reshaped([B, rows, H * D])
            return oProj(flattened * sigmoid(gate[0..., first..., 0...]), minimumRows: minimumProjectionRows)
        }

        debugSink?("qRoped", q)
        debugSink?("kRoped", k)
        if stableSmallKeyDomain, S < 256 {
            let actual = k.dim(2)
            let extent = ContextWorkspace.keyExtent(pass: S, context: actual,
                referenceStart: smallReferenceStart, referenceEnd: smallReferenceEnd)
            let queryRows = ContextWorkspace.queryRows(pass: S, context: actual,
                referenceStart: smallReferenceStart, referenceEnd: smallReferenceEnd)
            if (extent > actual || queryRows > S), extent <= ContextPolicy.modelLimit,
               queryRows <= PrefillSchedule.measuredQueryKeyProduct / extent {
                // Masked future columns preserve the established 256-row
                // prefill's softmax reduction domain. They never enter state,
                // selection, or a logical token count; only Q x padded K is
                // charged to the next-dispatch workspace bound.
                let paddedK = extent > actual ? concatenated([k, MLXArray.zeros([B, cfg.numKVHeads, extent - actual, D], dtype: k.dtype)], axis: 2) : k
                let paddedV = extent > actual ? concatenated([v, MLXArray.zeros([B, cfg.numKVHeads, extent - actual, D], dtype: v.dtype)], axis: 2) : v
                var keep: MLXArray
                if let selected = selection?.mask(lo: 0, hi: S, keyEnd: actual) {
                    keep = concatenated([selected, MLXArray.zeros([B, 1, S, extent - actual], dtype: .bool)], axis: -1)
                } else {
                    let queries = MLXArray((offset ..< offset + S).map(Int32.init)).reshaped([1, 1, S, 1])
                    let keys = MLXArray((0 ..< extent).map(Int32.init)).reshaped([1, 1, 1, extent])
                    keep = queries .>= keys
                }
                var queries = q
                if queryRows > S {
                    queries = concatenated([q, broadcast(q[0..., 0..., (S - 1) ..< S, 0...],
                        to: [B, H, queryRows - S, D])], axis: 2)
                    keep = concatenated([keep, broadcast(keep[0..., 0..., (S - 1) ..< S, 0...],
                        to: [B, 1, queryRows - S, extent])], axis: 2)
                    paddedSmallQueryRows += queryRows - S
                }
                let attended = Self.attend(q: queries, k: paddedK, v: paddedV, sparse: keep,
                    base: offset, scale: scale, block: queryRows)[0..., 0..., 0 ..< S, 0...]
                if extent > actual { paddedSmallKeyDomains += 1 }
                let flattened = attended.transposed(0, 2, 1, 3).reshaped([B, S, H * D])
                return oProj(flattened * sigmoid(gate), minimumRows: minimumProjectionRows)
            }
        }
        var out = Self.attend(
            q: q, k: k, v: v, sparse: sparse, base: offset, scale: scale,
            block: boundedIndexer && selection != nil
                ? min(256, AttentionTuning.queryBlock(pass: S, context: k.dim(2)))
                : AttentionTuning.queryBlock(pass: S, context: k.dim(2)),
            selection: boundedIndexer || useSelected ? selection : nil,
            selectedAttention: useSelected,
            onSelected: { [weak self] in self?.selectedAttentionTiles += 1 })
        debugSink?("sdpaOut", out)
        out = out.transposed(0, 2, 1, 3).reshaped([B, S, H * D])
        return oProj(out * sigmoid(gate), minimumRows: minimumProjectionRows)
    }

    /// Attention over a pass, in blocks of queries.
    ///
    /// Mask semantics mirror the reference: fused-causal sdpa when the indexer
    /// is inactive (bit-parity with mlx-lm's "causal" string mask), and the
    /// boolean keep-set (already causal) when it is.
    ///
    /// **Why the pass is split.** MLX 0.31.1 admits the fused prefill kernel
    /// only for head dims 64, 80 and 128 (`sdpa_full_supported_head_dim` in
    /// `scaled_dot_product_attention.cpp`). These layers run at head dim 256,
    /// so every pass longer than 8 tokens takes the unfused path in
    /// `fast.cpp`, which materialises the whole `[24, pass, context]` score
    /// matrix — a transient that grows with pass x context, which is what
    /// `PrefillSchedule` shrinks the pass to stay ahead of. Splitting the
    /// queries bounds it to `[24, block, context]`.
    ///
    /// **Why it is exact.** The fallback builds its causal mask as
    /// `arange(kL - qL, qL + (kL - qL)) >= arange(0, kL)`, so queries align to
    /// the END of the keys: a block `[lo, hi)` of a pass that starts at
    /// context position `base` sees exactly keys `[0, base + hi)`, which
    /// reproduces the same mask rows. Every output row depends only on its own
    /// query and all keys, so nothing is re-associated. Measured
    /// bit-identical at blocks of 256 and up and 1.3x faster
    /// (`swift-probe/Sources/AttnProbe`); a block of 128 measured 1.6e-3 of
    /// logit spread at one shape, which is why 256 is the floor.
    ///
    /// **The per-block `eval` is load-bearing, not tidiness.** Without it MLX
    /// builds the whole graph before evaluating anything and holds every
    /// block's score matrix at once: measured 6.5 GB at a 4096-token pass over
    /// a 32k context, exactly what not blocking costs. With it, 0.76 GB.
    static func attend(
        q: MLXArray, k: MLXArray, v: MLXArray, sparse: MLXArray?, base: Int,
        scale: Float, block: Int, selection: QSASelection? = nil,
        selectedAttention: Bool = false, onSelected: (() -> Void)? = nil
    ) -> MLXArray {
        let S = q.dim(2)
        if selectedAttention, S > 8, scale == 0.0625, sparse == nil,
           selection == nil || selection!.ratio == 4,
           SelectedAttention.prepare() {
            // Initialization precedes model state mutation at request entry.
            // Query tiling also bounds compact selection scores. The kernel
            // never materializes a query-by-key attention matrix.
            var outs: [MLXArray] = []
            var lo = 0
            while lo < S {
                var hi = min(S, lo + 256)
                if S - hi <= 8 { hi = S }
                let query = q[0..., 0..., lo ..< hi, 0...]
                let ids = selection?.compactBlocks(lo: lo, hi: hi)
                guard SelectedAttention.supported(q: query, k: k, v: v, base: base + lo, blocks: ids) else {
                    // Capability/shape fallback is pure, before kernel work
                    // for this tile. No error recovery after GPU mutation.
                    return attend(q: q, k: k, v: v, sparse: sparse, base: base,
                        scale: scale, block: block, selection: selection)
                }
                let out = SelectedAttention.execute(q: query, k: k, v: v, base: base + lo, blocks: ids)
                eval(out); outs.append(out); onSelected?()
                lo = hi
            }
            return concatenated(outs, axis: 2)
        }
        func mask(_ sp: MLXArray?, queries: Int) -> MLXFast.ScaledDotProductAttentionMaskMode {
            if let sp { return .array(sp) }
            // A single query sits at the last key position, so every key it is
            // handed is already visible to it and no mask is needed.
            return queries > 1 ? .causal : .none
        }
        if block >= S {
            return MLXFast.scaledDotProductAttention(
                queries: q, keys: k, values: v, scale: scale, mask: mask(selection?.mask(lo: 0, hi: S, keyEnd: base + S) ?? sparse, queries: S))
        }
        var outs: [MLXArray] = []
        outs.reserveCapacity((S + block - 1) / block)
        var lo = 0
        while lo < S {
            var hi = Swift.min(lo + block, S)
            if selection != nil, S - hi < block { hi = S }
            // Keep the reference softmax key domain for explicit sparse
            // masks. Truncating masked future columns can change its reduction
            // tree. Merge a short final tile so it cannot switch to the <=8
            // query vector kernel: a 256 target therefore bounds tiles at 511.
            let kEnd = selection != nil ? k.dim(2) : base + hi
            let o = MLXFast.scaledDotProductAttention(
                queries: q[0..., 0..., lo ..< hi, 0...],
                keys: k[0..., 0..., 0 ..< kEnd, 0...],
                values: v[0..., 0..., 0 ..< kEnd, 0...],
                scale: scale,
                mask: mask(selection?.mask(lo: lo, hi: hi, keyEnd: kEnd)
                    ?? sparse?[0..., 0..., lo ..< hi, 0 ..< kEnd], queries: hi - lo))
            eval(o)
            outs.append(o)
            lo = hi
        }
        return concatenated(outs, axis: 2)
    }
}

/// How a pass is split across the sparse-attention layers.
///
/// **This is a bound, not an optimisation, and the measurements say so.**
/// Splitting the queries was built expecting it to cut peak memory; measured
/// end to end it does not, because the score matrix is not where the pass
/// peaks. Interleaved A/B on the 7,960-token acceptance prompt at a pinned
/// 20-experts-per-layer pool: peak 7.35/7.70/8.50 GB whole against
/// 7.40/7.75/8.50 blocked at passes of 512/1024/2048, and a 16,384-token
/// `context-check` read 8.58 GB whole against 8.64 GB blocked. The high-water
/// mark sits in the MoE sweep's activations, so bounding attention lowers
/// something that was never the maximum. Output was byte-identical throughout.
///
/// So the default threshold is set to make blocking a **no-op at every
/// configuration the planner produces today**: it engages only above
/// `PrefillSchedule.measuredQueryKeyProduct`, which is exactly where the
/// schedule currently shrinks the pass instead. That keeps the measured
/// envelope unchanged while capping a transient that would otherwise grow
/// without limit as the context cap rises, and it is what would let the pass
/// stay large at a long context rather than halving. Do not turn it on below
/// the threshold expecting memory back; it costs a few percent and returns
/// nothing.
///
/// The block is a function of the pass and the context alone, never of the
/// pool or of what is resident, so it cannot touch the golden-equivalence
/// invariant (§6.1).
public enum AttentionTuning {
    /// Below this a block stops being exact: 128 measured 1.6e-3 of logit
    /// spread against the whole pass, where 256 and up measured 0.0.
    public static let minQueryBlock = 256
    /// Query-by-key elements one call may score before the pass is split. The
    /// same product the prefill schedule treats as measured-safe, so blocking
    /// never engages inside the envelope the measurements cover.
    public static var queryKeyBudget: Int { PrefillSchedule.measuredQueryKeyProduct }

    /// `SLOTSTREAM_ATTN_BLOCK=0` forces the single-call pass at any size (the
    /// A/B arm); any other positive value pins the block.
    static let override: Int? = {
        guard let raw = ProcessInfo.processInfo.environment["SLOTSTREAM_ATTN_BLOCK"],
            let n = Int(raw)
        else { return nil }
        return n
    }()

    /// The query block for a pass of `pass` tokens ending at `context`, or
    /// `Int.max` for "do not split".
    public static func queryBlock(pass: Int, context: Int) -> Int {
        if let o = override { return o <= 0 ? Int.max : o }
        let ctx = Swift.max(1, context)
        if pass * ctx <= queryKeyBudget { return Int.max }
        var b = pass
        while b > minQueryBlock, b * ctx > queryKeyBudget { b /= 2 }
        return b
    }
}

// MARK: - Gated DeltaNet

final class GDNLayer {
    var minimumProjectionRows = 0
    var fuseInputProjection = false
    private(set) var fusedProjectionsScheduled = 0
    let packedInput: PackedProjectionPair?
    var fusedRecording = false
    var phaseProfile: GDNPhaseProfile?
    let layerIndex: Int
    let cfg: ModelConfig
    let inQKV: QLinear
    let inZ: QLinear
    let inB: QLinear
    let inA: QLinear
    let convWeight: MLXArray  // (convDim, K, 1)
    let dtBias: MLXArray
    let aLog: MLXArray
    let norm: RMSNormGated
    let outProj: QLinear
    let keyDim: Int
    let valueDim: Int
    let convDim: Int

    init(_ w: ResidentWeights, layer: Int) {
        layerIndex = layer
        cfg = w.config
        let b = "model.layers.\(layer).linear_attn"
        inQKV = w.linear(b + ".in_proj_qkv")
        inZ = w.linear(b + ".in_proj_z")
        packedInput = w.packedGDNProjections[layer]
        inB = w.linear(b + ".in_proj_b")
        inA = w.linear(b + ".in_proj_a")
        convWeight = w.tensor(b + ".conv1d.weight")
        dtBias = w.tensor(b + ".dt_bias")
        aLog = w.tensor(b + ".A_log")
        norm = RMSNormGated(
            weight: w.tensor(b + ".norm.weight"), eps: cfg.rmsNormEps,
            sigmoidGate: cfg.outputGateType == "sigmoid")
        outProj = w.linear(b + ".out_proj")
        keyDim = cfg.linearNumKHeads * cfg.linearKHeadDim
        valueDim = cfg.linearNumVHeads * cfg.linearVHeadDim
        convDim = 2 * keyDim + valueDim
    }

    func callAsFunction(_ x: MLXArray, cache: LinearCache?) -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        let profile = phaseProfile
        let inputStart = profile == nil ? 0 : RuntimeClock.now()
        if profile != nil {
            eval([x] + [cache?.convState, cache?.ssmState].compactMap { $0 })
        }
        let preparationStart = profile == nil ? 0 : RuntimeClock.now()
        let mixed: MLXArray, zProjection: MLXArray
        if fuseInputProjection, let packedInput, packedInput.supportsOneToken(x) {
            let projected = packedInput(x)
            mixed = projected.0; zProjection = projected.1
            fusedProjectionsScheduled += 1
        } else {
            mixed = inQKV(x, minimumRows: minimumProjectionRows)
            zProjection = inZ(x, minimumRows: minimumProjectionRows)
        }
        let z = zProjection.reshaped([B, S, cfg.linearNumVHeads, cfg.linearVHeadDim])
        let bProj = inB(x, minimumRows: minimumProjectionRows)
        let aProj = inA(x, minimumRows: minimumProjectionRows)

        let K = cfg.convKernel
        let convState =
            cache?.convState
            ?? MLXArray.zeros([B, K - 1, convDim], dtype: x.dtype)
        let convInput = concatenated([convState, mixed], axis: 1)
        if let c = cache {
            c.convState = convInput[0..., (convInput.dim(1) - (K - 1))..., 0...]
            if c.record {
                // window of K-1 rows ending after position t
                c.convStates = (0 ..< S).map { t in convInput[0..., (t + 1) ..< (t + K), 0...] }
            }
        }
        let convOut = MLXNN.silu(conv1d(convInput, convWeight, groups: convDim))

        var q = convOut[.ellipsis, 0 ..< keyDim]
            .reshaped([B, S, cfg.linearNumKHeads, cfg.linearKHeadDim])
        var k = convOut[.ellipsis, keyDim ..< (2 * keyDim)]
            .reshaped([B, S, cfg.linearNumKHeads, cfg.linearKHeadDim])
        let v = convOut[.ellipsis, (2 * keyDim)...]
            .reshaped([B, S, cfg.linearNumVHeads, cfg.linearVHeadDim])

        q = l2normQK(q) * Float(pow(Double(cfg.linearKHeadDim), -0.5))
        k = l2normQK(k)

        if profile != nil { eval(q, k, v, z, aProj, bProj, aLog, dtBias) }
        let recurrenceStart = profile == nil ? 0 : RuntimeClock.now()

        let y: MLXArray
        if let c = cache, c.record, S > 1, fusedRecording {
            let recorded = gatedDeltaUpdateRecording(q: q, k: k, v: v, a: aProj, b: bProj,
                aLog: aLog, dtBias: dtBias, state: c.ssmState)
            y = recorded.output
            c.ssmStates = recorded.states
            c.ssmState = recorded.states.last
        } else if let c = cache, c.record, S > 1 {
            // Step the recurrence one token at a time so every intermediate
            // state is available for a speculative rollback. The state is
            // fp32 between steps exactly as inside the fused kernel, so the
            // outputs match the batched pass.
            var st = c.ssmState
            var ys: [MLXArray] = []
            var states: [MLXArray] = []
            for t in 0 ..< S {
                let (yt, nt) = gatedDeltaUpdate(
                    q: q[0..., t ..< (t + 1)], k: k[0..., t ..< (t + 1)], v: v[0..., t ..< (t + 1)],
                    a: aProj[0..., t ..< (t + 1)], b: bProj[0..., t ..< (t + 1)],
                    aLog: aLog, dtBias: dtBias, state: st, mask: nil)
                ys.append(yt)
                states.append(nt)
                st = nt
            }
            y = concatenated(ys, axis: 1)
            c.ssmStates = states
            c.ssmState = st
        } else {
            let (yy, newState) = gatedDeltaUpdate(
                q: q, k: k, v: v, a: aProj, b: bProj,
                aLog: aLog, dtBias: dtBias,
                state: cache?.ssmState, mask: nil)
            cache?.ssmState = newState
            y = yy
        }
        if profile != nil {
            eval([y] + [cache?.ssmState].compactMap { $0 } + (cache?.ssmStates ?? []))
        }
        let finishStart = profile == nil ? 0 : RuntimeClock.now()
        let result = outProj(norm(y, gate: z).reshaped([B, S, valueDim]), minimumRows: minimumProjectionRows)
        if let profile {
            eval([result] + [cache?.convState].compactMap { $0 } + (cache?.convStates ?? []))
            let end = RuntimeClock.now()
            profile.append(layer: layerIndex, tokens: S,
                input: Double(preparationStart - inputStart) / 1e9,
                preparation: Double(recurrenceStart - preparationStart) / 1e9,
                recurrence: Double(finishStart - recurrenceStart) / 1e9,
                finish: Double(end - finishStart) / 1e9)
        }
        return result
    }
}

// MARK: - MoE

final class MoELayer {
    var minimumProjectionRows = 0
    // Context qualification successor: preserve the established grouped QMM
    // arithmetic for bounded 64/128-token prefill. Decode is unchanged.
    var smallPrefillSweep = false
    var contextNumericsObserver: ((String, MLXArray) -> Void)?
    private(set) var smallPrefillSweeps = 0
    var specializedRouter = false
    var overlapShared = false
    private(set) var sharedPrelaunches = 0
    var overlapResident = false
    private(set) var residentPrelaunches = 0
    private(set) var residentJoins = 0
    private(set) var residentJoinSeconds = 0.0
    var routerObserver: ((Int, [Int32]) -> Void)?
    var useLayerWorkspace = false
    var workspaceTokenTile = 256
    var workspaceComputeRanges: [Range<Int>] = []
    var disjointOutput = false
    var boundedRows = false
    let cfg: ModelConfig
    let layer: Int
    let routerProjection: RouterProjection
    let sharedGate: QLinear
    let sharedGateProj: QLinear
    let sharedUpProj: QLinear
    let sharedDownProj: QLinear
    let pool: SlotPool

    init(_ w: ResidentWeights, layer: Int, pool: SlotPool) {
        cfg = w.config
        self.layer = layer
        self.pool = pool
        let b = "model.layers.\(layer).mlp"
        routerProjection = RouterProjection(w.tensor(b + ".gate.weight"))
        sharedGate = w.linear(b + ".shared_expert_gate")
        sharedGateProj = w.linear(b + ".shared_expert.gate_proj")
        sharedUpProj = w.linear(b + ".shared_expert.up_proj")
        sharedDownProj = w.linear(b + ".shared_expert.down_proj")
    }

    func callAsFunction(_ x: MLXArray) throws -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        // The reference matmul promotes the BF16 router to FP32. An optional
        // pre-materialized copy removes that repeated conversion at extra cost.
        let logits: MLXArray
        if useLayerWorkspace, !workspaceComputeRanges.isEmpty {
            var pieces: [MLXArray] = []
            for range in workspaceComputeRanges {
                let piece = routerProjection(x[0..., range, 0...])
                eval(piece); pieces.append(piece)
            }
            logits = concatenated(pieces, axis: 1)
        } else { logits = routerProjection(x) }
        contextNumericsObserver?("router", logits)
        let idx = RouterSelection.indices(logits, k: cfg.topK, enabled: specializedRouter)
        let weights = softmax(takeAlong(logits, idx, axis: -1), axis: -1, precise: true)

        // routing decision to CPU
        let expertIds = idx.asType(.int32).asArray(Int32.self)  // B*S*topK
        if RouterTrace.on {
            RouterTrace.record(layer: layer, tokens: B * S, topK: cfg.topK, ids: expertIds)
        }
        routerObserver?(layer, expertIds)
        func sharedParts(_ input: MLXArray) -> (MLXArray, MLXArray) {
            let value = sharedDownProj(MLXNN.silu(sharedGateProj(input, minimumRows: minimumProjectionRows))
                * sharedUpProj(input, minimumRows: minimumProjectionRows), minimumRows: minimumProjectionRows)
            let gate = sharedGate(input, minimumRows: minimumProjectionRows)
            contextNumericsObserver?("sharedValue", value)
            contextNumericsObserver?("sharedGate", gate)
            return (value, gate)
        }
        func shared(_ input: MLXArray) -> MLXArray {
            let (value, gate) = sharedParts(input)
            return sigmoid(gate) * value
        }
        // Router materialization above has already completed the input and
        // every prior pool reader. These resident projections do not read or
        // mutate expert slots, so their work can run while ensure/sweep reads.
        // Stop at the two matmul outputs: leave the final sigmoid/product/add
        // in the original graph to preserve its rounding/fusion boundary.
        var earlyShared: (MLXArray, MLXArray)?
        if overlapShared && !useLayerWorkspace {
            let parts = sharedParts(x)
            asyncEval(parts.0, parts.1)
            earlyShared = parts
            sharedPrelaunches += 1
        }
        pool.unpinAll()
        let routed: MLXArray
        if useLayerWorkspace, B * S >= SweepTuning.minTokens {
            routed = try workspaceRouted(x, expertIds: expertIds, weights: weights)
        } else {
            let smallSweep = smallPrefillSweep && B * S >= 64 && B * S < 256
                && SweepTuning.minTokens != Int.max
            if smallSweep { smallPrefillSweeps += 1 }
            let experts = try B * S >= SweepTuning.minTokens || smallSweep
                ? sweep(x, expertIds: expertIds) : cached(x, expertIds: expertIds)
            routed = (experts * weights.expandedDimensions(axis: -1)).sum(axis: -2).asType(x.dtype)
        }

        contextNumericsObserver?("routed", routed)
        if useLayerWorkspace, !workspaceComputeRanges.isEmpty {
            var outputs: [MLXArray] = []
            for range in workspaceComputeRanges {
                let value = shared(x[0..., range, 0...])
                eval(value); outputs.append(value)
            }
            return routed + concatenated(outputs, axis: 1)
        }
        if let (value, gate) = earlyShared { return routed + sigmoid(gate) * value }
        return routed + shared(x)
    }

    /// Workspace C: keep one layer's expert weights, reduce one token tile
    /// at a time in canonical router-rank order, and retain only N x H output.
    /// It trades E x recordBytes for removing N x K x H live output/product.
    private func workspaceRouted(_ x: MLXArray, expertIds: [Int32], weights: MLXArray) throws -> MLXArray {
        let (B, S, K, H, E) = (x.dim(0), x.dim(1), cfg.topK, cfg.hiddenSize, cfg.numExperts)
        let countStart = RuntimeClock.now()
        var count = [Int](repeating: 0, count: E)
        for e in expertIds { count[Int(e)] += 1 }
        let active = (0 ..< E).filter { count[$0] > 0 }
        pool.sweepSortSeconds += RuntimeClock.seconds(since: countStart)
        let w = try pool.layerWorkspaceChecked(layer: layer, experts: active)
        MemTrace.mark("workspace-loaded", nil)
        if pool.admitOnSweep, SlotPool.sweepAdmitEnabled {
            let quota = max(1, pool.slots / cfg.numLayers)
            // Share reads across the scope while preserving the existing
            // final chronological pass's admission policy and decode warmth.
            var admissionCount = count
            if let tail = workspaceComputeRanges.last {
                admissionCount = [Int](repeating: 0, count: E)
                for e in expertIds[(tail.lowerBound * K) ..< (tail.upperBound * K)] { admissionCount[Int(e)] += 1 }
            }
            let hot = active.filter { admissionCount[$0] > 0 }.sorted {
                admissionCount[$0] != admissionCount[$1] ? admissionCount[$0] > admissionCount[$1] : $0 < $1
            }
            let picked = Array(hot.prefix(quota)).sorted { a, b in
                let ar = pool.isResident(ExpertKey(layer, a)), br = pool.isResident(ExpertKey(layer, b))
                return ar != br ? ar : a < b
            }
            pool.admit(layer: layer, experts: picked, rows: picked, from: w)
            pool.commitAdmissions()
        }
        MemTrace.mark("workspace-admitted", nil)
        let flat = x.reshaped([B * S, H])
        let routeWeights = weights.reshaped([B * S, K])
        var outs: [MLXArray] = []
        var lo = 0
        while lo < B * S {
            var hi = min(B * S, lo + min(4096, max(256, workspaceTokenTile)))
            // Merge only a small dispatch tail, not an entire nearly-full
            // tile. The live output bound is tile + 255 tokens.
            if B * S - hi < 256 { hi = B * S }
            let n = hi - lo, rows = n * K
            let sortStart = RuntimeClock.now()
            let ids = Array(expertIds[(lo * K) ..< (hi * K)])
            var starts = [Int](repeating: 0, count: E + 1)
            for e in ids { starts[Int(e) + 1] += 1 }
            for e in 0 ..< E { starts[e + 1] += starts[e] }
            var fill = starts
            var order = [Int32](repeating: 0, count: rows)
            for (r, e) in ids.enumerated() {
                order[fill[Int(e)]] = Int32(r); fill[Int(e)] += 1
            }
            var inverse = [Int32](repeating: 0, count: rows)
            for (sorted, original) in order.enumerated() { inverse[Int(original)] = Int32(sorted) }
            var ridx = order.map { ids[Int($0)] }
            pool.sweepSortSeconds += RuntimeClock.seconds(since: sortStart)
            var gathered = flat[MLXArray(order.map { Int32(lo) + $0 / Int32(K) })].expandedDimensions(axis: 1)
            let pad = max(0, max(16, 4 * E) - rows)
            if pad > 0 {
                ridx.append(contentsOf: repeatElement(ridx.last!, count: pad))
                gathered = concatenated([gathered,
                    broadcast(gathered[(rows - 1) ..< rows], to: [pad, 1, H])], axis: 0)
            }
            let indices = MLXArray(ridx)
            let g = gatherQuantizedMM(gathered, w[0], scales: w[1], biases: w[2], rhsIndices: indices,
                transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
            let u = gatherQuantizedMM(gathered, w[3], scales: w[4], biases: w[5], rhsIndices: indices,
                transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
            let d = gatherQuantizedMM(MLXNN.silu(g) * u, w[6], scales: w[7], biases: w[8], rhsIndices: indices,
                transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
            let canonical = d[0 ..< rows].squeezed(axis: 1)[MLXArray(inverse)].reshaped([n, K, H])
            let reduced = (canonical * routeWeights[lo ..< hi].expandedDimensions(axis: -1))
                .sum(axis: -2).asType(x.dtype)
            let waitStart = RuntimeClock.now()
            eval(reduced)
            MemTrace.mark("workspace-reduced", nil)
            pool.sweepWaitSeconds += RuntimeClock.seconds(since: waitStart)
            outs.append(reduced)
            lo = hi
        }
        return concatenated(outs, axis: 0).reshaped([B, S, H])
    }

    /// The pool path: pin the routed experts in the slot pool and gather over
    /// it, one matvec per (token, expert). Returns every expert's output,
    /// (B,S,topK,H).
    private func cached(_ x: MLXArray, expertIds: [Int32]) throws -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        var uniq: [ExpertKey] = []
        var seen: [ExpertKey: Int] = [:]
        for e in expertIds {
            let key = ExpertKey(layer, Int(e))
            if seen[key] == nil {
                seen[key] = uniq.count
                uniq.append(key)
            }
        }
        func project(_ slotIds: [Int32]) -> MLXArray {
            let count = slotIds.count / (B * S)
            let slotIdx = MLXArray(slotIds, [B, S, count])
            let xe = x.expandedDimensions(axes: [-2, -3])
            let g = gatherQuantizedMM(
                xe, pool.pools[0], scales: pool.pools[1], biases: pool.pools[2],
                rhsIndices: slotIdx, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
            let u = gatherQuantizedMM(
                xe, pool.pools[3], scales: pool.pools[4], biases: pool.pools[5],
                rhsIndices: slotIdx, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
            let hidden = MLXNN.silu(g) * u
            return gatherQuantizedMM(
                hidden, pool.pools[6], scales: pool.pools[7], biases: pool.pools[8],
                rhsIndices: slotIdx, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
                .squeezed(axis: -2)
        }
        var readyRanks: [Int] = []
        var ready: MLXArray?
        let slotOf: [Int]
        // Only split the batch of independent one-row QMV operations. Larger
        // token batches retain the original kernel/grouping and sweep rules.
        if overlapResident && B == 1 && S == 1 {
            slotOf = try pool.ensureOverlapping(uniq, reservedHits: { existing in
                readyRanks = expertIds.indices.filter { existing[seen[ExpertKey(self.layer, Int(expertIds[$0]))]!] >= 0 }
                guard !readyRanks.isEmpty else { return }
                let slots = readyRanks.map { Int32(existing[seen[ExpertKey(self.layer, Int(expertIds[$0]))]!]) }
                ready = project(slots)
                asyncEval(ready!)
                self.residentPrelaunches += 1
            }, finishReaders: {
                if let ready {
                    let start = RuntimeClock.now()
                    eval(ready)
                    self.residentJoins += 1
                    self.residentJoinSeconds += RuntimeClock.seconds(since: start)
                }
            })
        } else { slotOf = try pool.ensureChecked(uniq) }
        let slotIds = expertIds.map { Int32(slotOf[seen[ExpertKey(layer, Int($0))]!]) }
        guard let ready else { return project(slotIds) }
        let readySet = Set(readyRanks)
        let missingRanks = expertIds.indices.filter { !readySet.contains($0) }
        let missing = project(missingRanks.map { slotIds[$0] })
        let order = readyRanks + missingRanks
        var inverse = Array(repeating: Int32(0), count: expertIds.count)
        for (position, rank) in order.enumerated() { inverse[rank] = Int32(position) }
        // The outer router weighting/reduction still sees original rank order.
        return take(concatenated([ready, missing], axis: 2), MLXArray(inverse), axis: 2)
    }

    /// The sweep (PLAN §3.3): rows sorted by expert; the layer's experts in
    /// groups of `ExpertStore.defaultLoadBatch`, resident ones copied out of
    /// the pool and the rest read from the checkpoint in contiguous runs; one
    /// grouped GEMM per projection and group over that group's rows. Sorting
    /// the rows is what reaches MLX's `gather_qmm_rhs` kernel, which reads an
    /// expert's weights once per tile of tokens instead of once per token —
    /// where the old pass spent most of its compute. Resident groups go first
    /// so that admission (final pass only) can never evict a resident expert
    /// this layer has not copied yet.
    private func sweep(_ x: MLXArray, expertIds: [Int32]) throws -> MLXArray {
        let (B, S, K, H, E) = (x.dim(0), x.dim(1), cfg.topK, cfg.hiddenSize, cfg.numExperts)
        let rows = B * S * K
        let tSort = RuntimeClock.now()
        var count = [Int](repeating: 0, count: E)
        for e in expertIds { count[Int(e)] += 1 }
        let resident = (0 ..< E).map { count[$0] > 0 && pool.isResident(ExpertKey(layer, $0)) }
        // Counting sort of the rows by (resident first, then expert id):
        // stable, linear, and a function of the routing alone.
        func bucket(_ e: Int) -> Int { (resident[e] ? 0 : E) + e }
        var start = [Int](repeating: 0, count: 2 * E + 1)
        for e in 0 ..< E where count[e] > 0 { start[bucket(e) + 1] = count[e] }
        for b in 0 ..< 2 * E { start[b + 1] += start[b] }
        var fill = start
        var order = [Int32](repeating: 0, count: rows)
        for (r, e) in expertIds.enumerated() {
            let b = bucket(Int(e))
            order[fill[b]] = Int32(r)
            fill[b] += 1
        }
        var invOrder = disjointOutput ? [] : [Int32](repeating: 0, count: rows)
        if !disjointOutput {
            for (s, r) in order.enumerated() { invOrder[Int(r)] = Int32(s) }
        }
        pool.sweepSortSeconds += RuntimeClock.seconds(since: tSort)
        // The token each sorted row belongs to. Gathering the rows for the
        // whole pass up front materialised one replicated copy of it —
        // rows x hidden, so K=10 times the hidden state, 105 MB at a
        // 2048-token pass and 210 at 4096 — and held it for the whole layer
        // while each group used a 32-expert slice. The gather happens per
        // group instead; the kernel is handed exactly the same rows in the
        // same order, so the arithmetic is untouched.
        let flat = x.reshaped([B * S, H])
        let tokenOf = order.map { $0 / Int32(K) }
        // SLOTSTREAM_SWEEP_ROWS=all restores the up-front gather for an A/B.
        let xsAll: MLXArray? = SweepTuning.gatherAllRows
            ? flat[MLXArray(tokenOf)].expandedDimensions(axis: 1) : nil

        // The final pass of a prompt admits each layer's hottest experts, its
        // fair share of the pool, so decode starts warm.
        var admitSet = Set<Int>()
        if pool.admitOnSweep, SlotPool.sweepAdmitEnabled {
            let quota = max(1, pool.slots / cfg.numLayers)
            let hot = (0 ..< E).filter { count[$0] > 0 }
                .sorted { count[$0] != count[$1] ? count[$0] > count[$1] : $0 < $1 }
            admitSet = Set(hot.prefix(quota))
        }

        let groupSize = ExpertStore.defaultLoadBatch
        var outs: [MLXArray] = []
        var orderedOutput: MLXArray? = disjointOutput
            ? MLXArray.zeros([rows, H], dtype: x.dtype) : nil
        var inFlight: MLXArray? = nil
        for source in 0 ..< 2 {  // 0: resident (out of the pool), 1: from the checkpoint
            let ids = (0 ..< E).filter { count[$0] > 0 && resident[$0] == (source == 0) }
            var lo = 0
            while lo < ids.count {
                let hi = min(lo + groupSize, ids.count)
                let group = Array(ids[lo ..< hi])
                let w = try
                    source == 0
                    ? pool.gatherResident(group.map { ExpertKey(layer, $0) })
                    : pool.readStagedChecked(layer: layer, experts: group)
                let rowLo = start[bucket(group[0])]
                let rowHi = start[bucket(group[group.count - 1]) + 1]
                // Admission remains once per loaded group. All of its rows
                // reuse these exact weight arrays, including across row tiles.
                if !admitSet.isEmpty {
                    let picks = group.enumerated().filter { admitSet.contains($0.element) }
                    if !picks.isEmpty {
                        pool.admit(
                            layer: layer, experts: picks.map { $0.element },
                            rows: picks.map { $0.offset }, from: w)
                    }
                }
                var localOf = [Int32](repeating: -1, count: E)
                for (j, e) in group.enumerated() { localOf[e] = Int32(j) }
                let tileSize = boundedRows ? 256 : rowHi - rowLo
                var row = rowLo
                while row < rowHi {
                    let end = min(row + tileSize, rowHi)
                    let n = end - row
                    // Preserve the grouped kernel dispatch even for a short
                    // tile. Padding repeats its last real row and expert.
                    let pad = max(0, max(16, 4 * group.count) - n)
                    var local = order[row ..< end].map { localOf[Int(expertIds[Int($0)])] }
                    local.append(contentsOf: repeatElement(local.last!, count: pad))
                    var xg = xsAll.map { $0[row ..< end] }
                        ?? flat[MLXArray(Array(tokenOf[row ..< end]))].expandedDimensions(axis: 1)
                    if pad > 0 {
                        xg = concatenated(
                            [xg, broadcast(xg[(n - 1) ..< n], to: [pad, 1, H])], axis: 0)
                    }
                    let ridx = MLXArray(local)
                    let g = gatherQuantizedMM(
                        xg, w[0], scales: w[1], biases: w[2], rhsIndices: ridx, transpose: true,
                        groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
                    let u = gatherQuantizedMM(
                        xg, w[3], scales: w[4], biases: w[5], rhsIndices: ridx, transpose: true,
                        groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
                    let dAll = gatherQuantizedMM(
                        MLXNN.silu(g) * u, w[6], scales: w[7], biases: w[8], rhsIndices: ridx,
                        transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits, sortedIndices: true)
                    let d = pad > 0 ? dAll[0 ..< n] : dAll
                    let completed: MLXArray
                    if let output = orderedOutput {
                        // Router rank is the destination, with each row written
                        // exactly once. No floating-point accumulation here;
                        // the existing K-axis reduction below is unchanged.
                        completed = putAlong(output,
                            MLXArray(Array(order[row ..< end])).expandedDimensions(axis: 1),
                            values: d.squeezed(axis: 1), axis: 0)
                        orderedOutput = completed
                    } else {
                        outs.append(d)
                        completed = d
                    }
                    asyncEval(completed)
                    if let prev = inFlight {
                        let tWait = RuntimeClock.now()
                        eval(prev)
                        pool.sweepWaitSeconds += RuntimeClock.seconds(since: tWait)
                    }
                    inFlight = completed
                    row = end
                }
                lo = hi
            }
        }
        pool.commitAdmissions()
        if let output = orderedOutput { return output.reshaped([B, S, K, H]) }
        let all = concatenated(outs, axis: 0).squeezed(axis: 1)  // (rows, H), sorted
        return all[MLXArray(invOrder)].reshaped([B, S, K, H])
    }
}

/// The prefill sweep's one knob, public so `sweep-check` can flip it in
/// process and measurements can A/B it (`SLOTSTREAM_SWEEP=0`).
public enum SweepTuning {
    /// Inputs of this many tokens or more, which only a prefill pass is, take
    /// the sweep: each layer's routed experts stream through staging groups
    /// and MLX's grouped GEMM and never touch the slot pool. Shorter inputs
    /// (decode, speculative verify passes, short follow-up turns) gather over
    /// the pool as before. The choice is a function of the token count alone,
    /// never of the pool, so pool size and contents still cannot change the
    /// math (the golden-equivalence invariant). `Int.max` forces the pool path
    /// at every size.
    /// Whether the sweep gathers every sorted row up front (what shipped
    /// through 0.2.3) instead of per staging group. `SLOTSTREAM_SWEEP_ROWS=all`
    /// restores it for an A/B; the rows the kernel sees are identical either
    /// way, only how long the replicated copy is held changes.
    public static let gatherAllRows: Bool =
        ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP_ROWS"] == "all"

    public static var minTokens: Int =
        ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP"] == "0" ? Int.max : 256
}

// MARK: - hyper-connections

final class GatedResidual {
    var minimumProjectionRows = 0
    var compiledNormFinish = false
    private(set) var compiledFinishes = 0
    let cfg: ModelConfig
    let hcNorm: RMSNorm
    let down: QLinear
    let up: QLinear
    let inject: MLXArray?  // (hc, hcDim), bf16
    var debugName: String? = nil

    init(_ w: TensorSource, base: String, useCombine: Bool) {
        cfg = w.config
        hcNorm = RMSNorm(
            weight: w.tensor(base + ".hc_norm.weight"), eps: cfg.rmsNormEps,
            groupSize: cfg.hiddenSize)
        down = w.linear(base + ".input_mix_weight_down")
        up = w.linear(base + ".input_mix_weight_up")
        inject = useCombine ? w.tensor(base + ".block_inject_weight.weight") : nil
    }

    /// hyper (B,S,hc*H) -> (mixed (B,S,H), hyper, inject (B,S,hc)) or just mixed.
    func callAsFunction(_ hyper: MLXArray) -> (MLXArray, MLXArray?) {
        let useCompiled = compiledNormFinish && CompiledArithmetic.prepare()
        if useCompiled { compiledFinishes += 1 }
        let normed = hcNorm(hyper, compiledFinish: useCompiled)
        if let n = debugName { Qwen4ExpModel.debugDump(n + "_normed", normed) }
        let downOut = down(normed, minimumRows: minimumProjectionRows)
        if let n = debugName { Qwen4ExpModel.debugDump(n + "_down", downOut) }
        var w = MLXNN.silu(downOut / Float(cfg.hcCount))
        w = sigmoid(up(w, minimumRows: minimumProjectionRows))
        if let n = debugName { Qwen4ExpModel.debugDump(n + "_wup", w) }
        let shape = Array(w.shape.dropLast()) + [cfg.hcCount, cfg.hiddenSize]
        let mixed = (w.reshaped(shape) * normed.reshaped(shape)).mean(axis: -2)
        guard let injW = inject else { return (mixed, nil) }
        let projected = QLinear.withReferenceRows(normed, minimumRows: minimumProjectionRows) { matmul($0, injW.transposed()) }
        let injected = 2 * sigmoid(projected / Float(cfg.hcCount))
        return (mixed, injected)
    }
}

// MARK: - PLE

final class PLELayer {
    var minimumProjectionRows = 0
    var boundedTokens = false
    let cfg: ModelConfig
    let store: NgramStore
    let keyProj: QLinear
    let valueProj: QLinear
    let normKey: RMSNorm
    let normQuery: RMSNorm
    let normConv: RMSNorm
    let convWeight: MLXArray
    let dilation: Int
    let stateLen: Int

    init(_ w: ResidentWeights, layer: Int, store: NgramStore) {
        cfg = w.config
        self.store = store
        let b = "model.layers.\(layer).ple"
        keyProj = w.linear(b + ".key_proj")
        valueProj = w.linear(b + ".value_proj")
        let hcDim = cfg.hcCount * cfg.hiddenSize
        _ = hcDim
        normKey = RMSNorm(weight: w.tensor(b + ".norm_key.weight"), eps: cfg.rmsNormEps, groupSize: cfg.hiddenSize)
        normQuery = RMSNorm(weight: w.tensor(b + ".norm_query.weight"), eps: cfg.rmsNormEps, groupSize: cfg.hiddenSize)
        normConv = RMSNorm(weight: w.tensor(b + ".norm_conv.weight"), eps: cfg.rmsNormEps, groupSize: cfg.hiddenSize)
        convWeight = w.tensor(b + ".conv1d.weight")
        dilation = cfg.ngramSize
        stateLen = (cfg.pleConvKernel - 1) * dilation
    }

    private func shortConv(_ x: MLXArray, cache: LinearCache?) -> MLXArray {
        let S = x.dim(1)
        let state =
            cache?.pleConvState
            ?? MLXArray.zeros([x.dim(0), stateLen, x.dim(-1)], dtype: x.dtype)
        let full = concatenated([state, x], axis: 1)
        if let c = cache {
            c.pleConvState = full[0..., (full.dim(1) - stateLen)..., 0...]
            if c.record {
                c.pleConvStates = (0 ..< S).map { t in full[0..., (t + 1) ..< (t + 1 + stateLen), 0...] }
            }
        }
        let window = full[0..., (full.dim(1) - (stateLen + S))..., 0...]
        return MLXNN.silu(conv1d(window, convWeight, dilation: dilation, groups: convWeight.dim(0)))
    }

    /// hidden (B,S,hc*H); ids/prevCtx handled CPU-side via NgramStore.
    func callAsFunction(_ hidden: MLXArray, history: [Int64], nNew: Int, cache: LinearCache?) throws -> MLXArray {
        if boundedTokens, nNew > 256, let cache, !cache.record {
            var outputs: [MLXArray] = []
            let base = history.count - nNew
            for lo in stride(from: 0, to: nNew, by: 256) {
                let hi = min(nNew, lo + 256)
                let contextStart = max(0, base + lo - (cfg.ngramSize - 1))
                let ids = Array(history[contextStart ..< base + hi])
                let result = try transform(hidden[0..., lo ..< hi, 0...], history: ids, nNew: hi - lo, cache: cache)
                // Materialize before the next tile replaces the convolution
                // window. Projection, gating and conv workspaces stay bounded.
                eval(result)
                outputs.append(result)
            }
            return concatenated(outputs, axis: 1)
        }
        return try transform(hidden, history: history, nNew: nNew, cache: cache)
    }

    private func transform(_ hidden: MLXArray, history: [Int64], nNew: Int, cache: LinearCache?) throws -> MLXArray {
        let emb = try store.embeddingChecked(history: history, nNew: nNew).asType(hidden.dtype)
        var key = normKey(keyProj(emb, minimumRows: minimumProjectionRows))
        let keyShape = Array(key.shape.dropLast()) + [cfg.hcCount, cfg.hiddenSize]
        key = key.reshaped(keyShape)
        let value = valueProj(emb, minimumRows: minimumProjectionRows)
        var query = normQuery(hidden)
        query = query.reshaped(keyShape)

        var gate = (key * query).sum(axis: -1, keepDims: true) / sqrt(Float(cfg.hiddenSize))
        gate = sqrt(maximum(abs(gate), 1e-6)) * sign(gate)
        var gated = sigmoid(gate) * value.expandedDimensions(axis: -2)
        gated = gated.reshaped(Array(gated.shape.dropLast(2)) + [cfg.hcCount * cfg.hiddenSize])
        return gated + shortConv(normConv(gated), cache: cache)
    }
}
