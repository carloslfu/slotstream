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

    func callAsFunction(_ x: MLXArray) -> MLXArray {
        guard let g = groupSize else {
            return MLXFast.rmsNorm(x, weight: weight, eps: eps)
        }
        let shape = x.shape
        var v = x.reshaped(Array(shape.dropLast()) + [-1, g])
        let vf = v.asType(.float32)
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
final class IndexerCache {
    private var buf: MLXArray?  // (B, cap, dim)
    private(set) var offset = 0
    let step = 1024

    func update(_ k: MLXArray) -> MLXArray {
        let s = k.dim(1)
        if buf == nil || offset + s > buf!.dim(1) {
            let newCap = ((offset + s + step - 1) / step) * step
            let grown = MLXArray.zeros([k.dim(0), newCap, k.dim(2)], dtype: k.dtype)
            if let old = buf, offset > 0 {
                grown[0..., 0 ..< offset, 0...] = old[0..., 0 ..< offset, 0...]
            }
            buf = grown
        }
        buf![0..., offset ..< (offset + s), 0...] = k
        offset += s
        return buf![0..., 0 ..< offset, 0...]
    }

    /// Roll back to `n` entries (see KVCache.trim).
    func trim(to n: Int) { offset = min(offset, max(0, n)) }

    func materializeStorage() {
        if let b = buf { eval(b) }
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

    func clearRecording() {
        record = false
        convStates = []
        ssmStates = []
        pleConvStates = []
    }
}

// MARK: - QSA (sparse attention)

final class QSAIndexer {
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

    /// Returns a boolean keep-mask (B,1,S,kvLen) or nil when everything fits the budget.
    func callAsFunction(_ x: MLXArray, rope: Rope, cache: IndexerCache?, offset: Int) -> MLXArray? {
        let (B, S) = (x.dim(0), x.dim(1))
        let qk = proj(x)
        let split = cfg.indexerNHeads * cfg.indexerHeadDim
        var q = qk[.ellipsis, 0 ..< split].reshaped([B, S, cfg.indexerNHeads, cfg.indexerHeadDim])
        var rawK = qk[.ellipsis, split...].reshaped([B, S, cfg.indexerHeadDim])
        if let c = cache { rawK = c.update(rawK) }
        let kvLen = rawK.dim(1)
        if kvLen <= cfg.indexerBudget { return nil }

        let ratio = cfg.indexerCompressRatio
        let nBlocks = kvLen / ratio
        var pooled = rawK[0..., 0 ..< (nBlocks * ratio), 0...]
            .reshaped([B, nBlocks, ratio, cfg.indexerHeadDim])
        pooled = kNorm(pooled.asType(.float32).mean(axis: 2).asType(rawK.dtype))

        let blockStarts = MLXArray((0 ..< nBlocks).map { Int32($0 * ratio) })
        let (cK, sK) = rope(blockStarts.expandedDimensions(axis: 0))
        pooled = ropePartial(pooled, cK, sK)

        let qPos = MLXArray((offset ..< (offset + S)).map { Int32($0) })
        let (cQ, sQ) = rope(qPos.expandedDimensions(axis: 0))
        q = qNorm(q)
        q = ropePartial(
            q, cQ.expandedDimensions(axis: 2), sQ.expandedDimensions(axis: 2))

        var scores = einsum(
            "bshd,bnd->bsnh", q.asType(.float32), pooled.asType(.float32))
        scores = maximum(scores, 0).sum(axis: -1) / sqrt(Float(cfg.indexerHeadDim))

        let blockEnd = blockStarts + Int32(ratio - 1)
        let visible = blockEnd.reshaped([1, 1, nBlocks]) .<= qPos.reshaped([1, S, 1])
        scores = which(visible, scores, MLXArray(-Float.infinity))

        let k = min(blockTopK, nBlocks)
        var top = argPartition(-scores, kth: k - 1, axis: -1)[.ellipsis, ..<k].asType(.int32)
        top = which(takeAlong(broadcast(visible, to: [B, S, nBlocks]), top, axis: -1), top, MLXArray(Int32(nBlocks)))
        var keepBlock = MLXArray.zeros([B, S, nBlocks + 1], dtype: .bool)
        keepBlock = putAlong(keepBlock, top, values: MLXArray(true), axis: -1)[.ellipsis, ..<nBlocks]

        var keep = repeated(keepBlock, count: ratio, axis: -1)
        let tail = kvLen - nBlocks * ratio
        if tail > 0 {
            keep = concatenated([keep, MLXArray.zeros([B, S, tail], dtype: .bool)], axis: -1)
        }
        let keyPos = MLXArray((0 ..< kvLen).map { Int32($0) }).reshaped([1, 1, kvLen])
        let qp = qPos.reshaped([1, S, 1])
        let ownBlockStart = ((qp + 1) / Int32(ratio)) * Int32(ratio)
        let ownTail = (keyPos .>= ownBlockStart) .&& (keyPos .<= qp)
        keep = (keep .|| ownTail) .&& (keyPos .<= qp)
        return keep.expandedDimensions(axis: 1)
    }
}

final class QSAAttention {
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

    func callAsFunction(
        _ x: MLXArray, rope: Rope, cache: KVCache, idxCache: IndexerCache
    ) -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        let offset = cache.offset
        let H = cfg.numAttentionHeads
        let D = cfg.headDim

        let sparse = indexer(x, rope: rope, cache: idxCache, offset: offset)

        let qg = qProj(x).reshaped([B, S, H, 2 * D])
        var q = qg[.ellipsis, 0 ..< D]
        let gate = qg[.ellipsis, D...].reshaped([B, S, H * D])
        debugSink?("qgRaw", qg)
        q = qNorm(q).transposed(0, 2, 1, 3)
        var k = kNorm(kProj(x).reshaped([B, S, cfg.numKVHeads, D])).transposed(0, 2, 1, 3)
        var v = vProj(x).reshaped([B, S, cfg.numKVHeads, D]).transposed(0, 2, 1, 3)
        debugSink?("qNormed", q)
        debugSink?("kNormed", k)
        debugSink?("v", v)

        let pos = MLXArray((offset ..< (offset + S)).map { Int32($0) }).expandedDimensions(axis: 0)
        var (c, s) = rope(pos)
        c = c.expandedDimensions(axis: 1)
        s = s.expandedDimensions(axis: 1)
        q = ropePartial(q, c, s)
        k = ropePartial(k, c, s)

        (k, v) = cache.updateAndFetch(k, v)

        // Mask semantics mirror the reference: fused-causal sdpa when the
        // indexer is inactive (bit-parity with mlx-lm's "causal" string mask),
        // and the boolean keep-set (already causal) when it is.
        let maskMode: MLXFast.ScaledDotProductAttentionMaskMode
        if let sp = sparse {
            maskMode = .array(sp)
        } else if S > 1 {
            maskMode = .causal
        } else {
            maskMode = .none
        }

        debugSink?("qRoped", q)
        debugSink?("kRoped", k)
        var out = MLXFast.scaledDotProductAttention(
            queries: q, keys: k, values: v, scale: scale, mask: maskMode)
        debugSink?("sdpaOut", out)
        out = out.transposed(0, 2, 1, 3).reshaped([B, S, H * D])
        return oProj(out * sigmoid(gate))
    }
}

// MARK: - Gated DeltaNet

final class GDNLayer {
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
        cfg = w.config
        let b = "model.layers.\(layer).linear_attn"
        inQKV = w.linear(b + ".in_proj_qkv")
        inZ = w.linear(b + ".in_proj_z")
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
        let mixed = inQKV(x)
        let z = inZ(x).reshaped([B, S, cfg.linearNumVHeads, cfg.linearVHeadDim])
        let bProj = inB(x)
        let aProj = inA(x)

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

        let y: MLXArray
        if let c = cache, c.record, S > 1 {
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
        return outProj(norm(y, gate: z).reshaped([B, S, valueDim]))
    }
}

// MARK: - MoE

final class MoELayer {
    let cfg: ModelConfig
    let layer: Int
    let gateWeight: MLXArray  // router, unquantized
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
        gateWeight = w.tensor(b + ".gate.weight")
        sharedGate = w.linear(b + ".shared_expert_gate")
        sharedGateProj = w.linear(b + ".shared_expert.gate_proj")
        sharedUpProj = w.linear(b + ".shared_expert.up_proj")
        sharedDownProj = w.linear(b + ".shared_expert.down_proj")
    }

    func callAsFunction(_ x: MLXArray) -> MLXArray {
        let (B, S) = (x.dim(0), x.dim(1))
        // mixed-precision matmul exactly as the reference's nn.Linear:
        // f32 activations against the bf16 router weight (no materialized cast)
        let logits = matmul(x.asType(.float32), gateWeight.transposed())
        let idx = argPartition(-logits, kth: cfg.topK - 1, axis: -1)[.ellipsis, ..<cfg.topK]
        let weights = softmax(takeAlong(logits, idx, axis: -1), axis: -1, precise: true)

        // routing decision to CPU
        let expertIds = idx.asType(.int32).asArray(Int32.self)  // B*S*topK
        pool.unpinAll()
        let experts =
            B * S >= SweepTuning.minTokens
            ? sweep(x, expertIds: expertIds) : cached(x, expertIds: expertIds)  // (B,S,topK,H)
        let routed = (experts * weights.expandedDimensions(axis: -1)).sum(axis: -2).asType(x.dtype)

        let shared = sharedDownProj(MLXNN.silu(sharedGateProj(x)) * sharedUpProj(x))
        return routed + sigmoid(sharedGate(x)) * shared
    }

    /// The pool path: pin the routed experts in the slot pool and gather over
    /// it, one matvec per (token, expert). Returns every expert's output,
    /// (B,S,topK,H).
    private func cached(_ x: MLXArray, expertIds: [Int32]) -> MLXArray {
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
        let slotOf = pool.ensure(uniq)
        let slotIds = expertIds.map { Int32(slotOf[seen[ExpertKey(layer, Int($0))]!]) }
        let slotIdx = MLXArray(slotIds, [B, S, cfg.topK])

        // SwitchGLU semantics: expand x to (B,S,1,1,H), gather over pool
        let xe = x.expandedDimensions(axes: [-2, -3])
        let g = gatherQuantizedMM(
            xe, pool.pools[0], scales: pool.pools[1], biases: pool.pools[2],
            rhsIndices: slotIdx, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
        let u = gatherQuantizedMM(
            xe, pool.pools[3], scales: pool.pools[4], biases: pool.pools[5],
            rhsIndices: slotIdx, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
        let hidden = MLXNN.silu(g) * u
        let d = gatherQuantizedMM(
            hidden, pool.pools[6], scales: pool.pools[7], biases: pool.pools[8],
            rhsIndices: slotIdx, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
        return d.squeezed(axis: -2)  // (B,S,topK,H)
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
    private func sweep(_ x: MLXArray, expertIds: [Int32]) -> MLXArray {
        let (B, S, K, H, E) = (x.dim(0), x.dim(1), cfg.topK, cfg.hiddenSize, cfg.numExperts)
        let rows = B * S * K
        let tSort = Date()
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
        var invOrder = [Int32](repeating: 0, count: rows)
        for (s, r) in order.enumerated() { invOrder[Int(r)] = Int32(s) }
        pool.sweepSortSeconds += -tSort.timeIntervalSinceNow
        let xs = x.reshaped([B * S, H])[MLXArray(order.map { $0 / Int32(K) })]
            .expandedDimensions(axis: 1)  // (rows, 1, H), sorted

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
        var inFlight: MLXArray? = nil
        for source in 0 ..< 2 {  // 0: resident (out of the pool), 1: from the checkpoint
            let ids = (0 ..< E).filter { count[$0] > 0 && resident[$0] == (source == 0) }
            var lo = 0
            while lo < ids.count {
                let hi = min(lo + groupSize, ids.count)
                let group = Array(ids[lo ..< hi])
                let w =
                    source == 0
                    ? pool.gatherResident(group.map { ExpertKey(layer, $0) })
                    : pool.readStaged(layer: layer, experts: group)
                let rowLo = start[bucket(group[0])]
                let rowHi = start[bucket(group[group.count - 1]) + 1]
                let rowsG = rowHi - rowLo
                // MLX takes the grouped kernel only for a call with at least
                // 16 rows and four per expert; pad a small group up to that,
                // so the kernel a row meets depends on the routing alone and
                // never on how many rows share its group or on what the pool
                // holds. Padding rows repeat the group's last row and are
                // dropped from the output.
                let pad = max(0, max(16, 4 * group.count) - rowsG)
                var local: [Int32] = []
                local.reserveCapacity(rowsG + pad)
                for (j, e) in group.enumerated() {
                    local.append(contentsOf: repeatElement(Int32(j), count: count[e]))
                }
                local.append(contentsOf: repeatElement(Int32(group.count - 1), count: pad))
                var xg = xs[rowLo ..< rowHi]
                if pad > 0 {
                    xg = concatenated(
                        [xg, broadcast(xs[(rowHi - 1) ..< rowHi], to: [pad, 1, H])], axis: 0)
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
                let d = pad > 0 ? dAll[0 ..< rowsG] : dAll
                if !admitSet.isEmpty {
                    let picks = group.enumerated().filter { admitSet.contains($0.element) }
                    if !picks.isEmpty {
                        pool.admit(
                            layer: layer, experts: picks.map { $0.element },
                            rows: picks.map { $0.offset }, from: w)
                    }
                }
                // The GPU works on this group while the next one is read; at
                // most two groups of staging are alive at once.
                asyncEval(d)
                if let prev = inFlight {
                    let tWait = Date()
                    eval(prev)
                    pool.sweepWaitSeconds += -tWait.timeIntervalSinceNow
                }
                inFlight = d
                outs.append(d)
                lo = hi
            }
        }
        pool.commitAdmissions()
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
    public static var minTokens: Int =
        ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP"] == "0" ? Int.max : 256
}

// MARK: - hyper-connections

final class GatedResidual {
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
        let normed = hcNorm(hyper)
        if let n = debugName { Qwen4ExpModel.debugDump(n + "_normed", normed) }
        let downOut = down(normed)
        if let n = debugName { Qwen4ExpModel.debugDump(n + "_down", downOut) }
        var w = MLXNN.silu(downOut / Float(cfg.hcCount))
        w = sigmoid(up(w))
        if let n = debugName { Qwen4ExpModel.debugDump(n + "_wup", w) }
        let shape = Array(w.shape.dropLast()) + [cfg.hcCount, cfg.hiddenSize]
        let mixed = (w.reshaped(shape) * normed.reshaped(shape)).mean(axis: -2)
        guard let injW = inject else { return (mixed, nil) }
        let injected = 2 * sigmoid(matmul(normed, injW.transposed()) / Float(cfg.hcCount))
        return (mixed, injected)
    }
}

// MARK: - PLE

final class PLELayer {
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
    func callAsFunction(_ hidden: MLXArray, history: [Int64], nNew: Int, cache: LinearCache?) -> MLXArray {
        let emb = store.embedding(history: history, nNew: nNew).asType(hidden.dtype)
        var key = normKey(keyProj(emb))
        let keyShape = Array(key.shape.dropLast()) + [cfg.hcCount, cfg.hiddenSize]
        key = key.reshaped(keyShape)
        let value = valueProj(emb)
        var query = normQuery(hidden)
        query = query.reshaped(keyShape)

        var gate = (key * query).sum(axis: -1, keepDims: true) / sqrt(Float(cfg.hiddenSize))
        gate = sqrt(maximum(abs(gate), 1e-6)) * sign(gate)
        var gated = sigmoid(gate) * value.expandedDimensions(axis: -2)
        gated = gated.reshaped(Array(gated.shape.dropLast(2)) + [cfg.hcCount * cfg.hiddenSize])
        return gated + shortConv(normConv(gated), cache: cache)
    }
}
