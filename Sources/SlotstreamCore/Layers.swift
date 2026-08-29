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

struct Rope {
    let invFreq: MLXArray  // (dim/2) f32
    let dim: Int

    init(dim: Int, base: Float) {
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
}

final class LinearCache {
    var convState: MLXArray?  // (B, K-1, convDim)
    var ssmState: MLXArray?  // (B, Hv, Dv, Dk) f32
    var pleConvState: MLXArray?  // (B, (k-1)*dilation, hcDim)
    var ngramCtx: [Int64] = []  // rolling last (ngramSize-1) token ids
}

// MARK: - QSA (sparse attention)

final class QSAIndexer {
    let cfg: ModelConfig
    let proj: QLinear
    let qNorm: RMSNorm
    let kNorm: RMSNorm
    let blockTopK: Int

    init(_ w: ResidentWeights, layer: Int) {
        cfg = w.config
        let b = "model.layers.\(layer).self_attn.indexer"
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
    let cfg: ModelConfig
    let qProj: QLinear
    let kProj: QLinear
    let vProj: QLinear
    let oProj: QLinear
    let qNorm: RMSNorm
    let kNorm: RMSNorm
    let indexer: QSAIndexer
    let scale: Float

    init(_ w: ResidentWeights, layer: Int) {
        cfg = w.config
        let b = "model.layers.\(layer).self_attn"
        qProj = w.linear(b + ".q_proj")
        kProj = w.linear(b + ".k_proj")
        vProj = w.linear(b + ".v_proj")
        oProj = w.linear(b + ".o_proj")
        qNorm = RMSNorm(weight: w.tensor(b + ".q_norm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        kNorm = RMSNorm(weight: w.tensor(b + ".k_norm.weight"), eps: cfg.rmsNormEps, groupSize: nil)
        indexer = QSAIndexer(w, layer: layer)
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
        q = qNorm(q).transposed(0, 2, 1, 3)
        var k = kNorm(kProj(x).reshaped([B, S, cfg.numKVHeads, D])).transposed(0, 2, 1, 3)
        var v = vProj(x).reshaped([B, S, cfg.numKVHeads, D]).transposed(0, 2, 1, 3)

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

        var out = MLXFast.scaledDotProductAttention(
            queries: q, keys: k, values: v, scale: scale, mask: maskMode)
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

        let (y, newState) = gatedDeltaUpdate(
            q: q, k: k, v: v, a: aProj, b: bProj,
            aLog: aLog, dtBias: dtBias,
            state: cache?.ssmState, mask: nil)
        cache?.ssmState = newState
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

        // routing decision to CPU -> slots
        let expertIds = idx.asType(.int32).asArray(Int32.self)  // B*S*topK
        pool.unpinAll()
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
        let experts = d.squeezed(axis: -2)  // (B,S,topK,H)
        let routed = (experts * weights.expandedDimensions(axis: -1)).sum(axis: -2).asType(x.dtype)

        let shared = sharedDownProj(MLXNN.silu(sharedGateProj(x)) * sharedUpProj(x))
        return routed + sigmoid(sharedGate(x)) * shared
    }
}

// MARK: - hyper-connections

final class GatedResidual {
    let cfg: ModelConfig
    let hcNorm: RMSNorm
    let down: QLinear
    let up: QLinear
    let inject: MLXArray?  // (hc, hcDim), bf16
    var debugName: String? = nil

    init(_ w: ResidentWeights, base: String, useCombine: Bool) {
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
