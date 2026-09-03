// The MTP (multi-token-prediction) draft head: one extra full-attention
// decoder layer that predicts the token AFTER next, used for self-speculative
// decode. Weights come from `mtp.safetensors` (converted from the official
// release by Tools/mtp_convert.py — the pinned community conversion drops
// them), everything resident: its 512 experts are 1.42 GB and stay loaded,
// so drafting never touches the slot pool or the SSD.
//
// Semantics follow vLLM's Qwen4ExpMultiTokenPredictor ("scheme A"), the only
// public inference implementation of this head, cross-checked against the
// vendored reference's blocks (Tools/reference/mtp_ref.py is the Python
// mirror this port is parity-tested against):
//
//   fuse:   e = fc_embedding(rmsnorm(embed(token)))          (B,T,H)
//           h = fc_hidden(rmsnorm_fullwidth(multi))          per-branch shared
//           x = flatten(e broadcast over branches + h)       (B,T,hc*H)
//   layer:  one full_attention DecoderLayer (QSA + resident MoE + HC)
//   out:    mixer(x) -> (B,T,H) for the shared lm_head,
//           and pre-mixer x is the next draft step's `multi` input.
//
// Positions: the MTP entry for (hidden_i, embed(token_{i+1})) trains at rope
// position i+1, but this port uses 0-based cache positions like the main
// model. RoPE attention depends only on relative positions and every entry
// shifts by the same +1, so the scores are mathematically identical; only a
// uniform basis change separates the two conventions.

import Foundation
import MLX
import MLXNN

/// Loader for `mtp.safetensors`. Names inside keep their `mtp.` prefix.
public final class MTPWeights: TensorSource {
    public let config: ModelConfig
    let arrays: [String: MLXArray]

    public static func fileURL(modelDir: URL) -> URL {
        modelDir.appendingPathComponent("mtp.safetensors")
    }

    public static func present(modelDir: URL) -> Bool {
        FileManager.default.fileExists(atPath: fileURL(modelDir: modelDir).path)
    }

    public init(modelDir: URL, config: ModelConfig) throws {
        self.config = config
        let url = Self.fileURL(modelDir: modelDir)
        guard FileManager.default.fileExists(atPath: url.path) else {
            throw ModelError(
                "no mtp.safetensors in \(modelDir.path) — the MTP draft head is a separate "
                    + "1.5 GB artifact converted from the official release "
                    + "(Tools/mtp_convert.py); run with --mtp off or convert it first")
        }
        let all = try loadArrays(url: url)
        eval(Array(all.values))
        self.arrays = all
    }

    public func optionalTensor(_ name: String) -> MLXArray? { arrays[name] }

    public var totalBytes: Int { arrays.values.reduce(0) { $0 + $1.nbytes } }
}

/// SparseMoeBlock with every expert resident — same math as MoELayer, minus
/// the slot pool: routing indices feed gatherQuantizedMM directly.
final class ResidentMoE {
    let cfg: ModelConfig
    let gateWeight: MLXArray  // router, unquantized
    let sharedGate: QLinear
    let sharedGateProj: QLinear
    let sharedUpProj: QLinear
    let sharedDownProj: QLinear
    let gp: (MLXArray, MLXArray, MLXArray)  // gate_proj weight/scales/biases (E, I, H/8)
    let up: (MLXArray, MLXArray, MLXArray)
    let dp: (MLXArray, MLXArray, MLXArray)

    init(_ w: TensorSource, base b: String) {
        cfg = w.config
        gateWeight = w.tensor(b + ".gate.weight")
        sharedGate = w.linear(b + ".shared_expert_gate")
        sharedGateProj = w.linear(b + ".shared_expert.gate_proj")
        sharedUpProj = w.linear(b + ".shared_expert.up_proj")
        sharedDownProj = w.linear(b + ".shared_expert.down_proj")
        func triple(_ name: String) -> (MLXArray, MLXArray, MLXArray) {
            (w.tensor(b + ".switch_mlp.\(name).weight"),
             w.tensor(b + ".switch_mlp.\(name).scales"),
             w.tensor(b + ".switch_mlp.\(name).biases"))
        }
        gp = triple("gate_proj")
        up = triple("up_proj")
        dp = triple("down_proj")
    }

    func callAsFunction(_ x: MLXArray) -> MLXArray {
        let logits = matmul(x.asType(.float32), gateWeight.transposed())
        let idx = argPartition(-logits, kth: cfg.topK - 1, axis: -1)[.ellipsis, ..<cfg.topK]
        let weights = softmax(takeAlong(logits, idx, axis: -1), axis: -1, precise: true)
        let rhs = idx.asType(.uint32)

        let xe = x.expandedDimensions(axes: [-2, -3])
        let g = gatherQuantizedMM(
            xe, gp.0, scales: gp.1, biases: gp.2,
            rhsIndices: rhs, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
        let u = gatherQuantizedMM(
            xe, up.0, scales: up.1, biases: up.2,
            rhsIndices: rhs, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
        let hidden = MLXNN.silu(g) * u
        let d = gatherQuantizedMM(
            hidden, dp.0, scales: dp.1, biases: dp.2,
            rhsIndices: rhs, transpose: true, groupSize: cfg.qGroup, bits: cfg.qBits)
        let experts = d.squeezed(axis: -2)
        let routed = (experts * weights.expandedDimensions(axis: -1)).sum(axis: -2).asType(x.dtype)

        let shared = sharedDownProj(MLXNN.silu(sharedGateProj(x)) * sharedUpProj(x))
        return routed + sigmoid(sharedGate(x)) * shared
    }
}

/// Attention + indexer state for the draft head, one entry per consumed main
/// token (entry i covers the fusion of hidden i-1 with token i's embedding).
/// Speculative decode rolls rejected entries back with `trim`.
public final class MTPState {
    let kv = KVCache()
    let indexer = IndexerCache()

    public init() {}

    public var offset: Int { kv.offset }

    public func trim(to n: Int) {
        kv.trim(to: n)
        indexer.trim(to: n)
    }

    /// Force pending lazy cache writes so the graph never spans multiple
    /// prefill chunks or speculative rounds.
    func materialize() {
        if let k = kv.keys, let v = kv.values { eval(k, v) }
        indexer.materializeStorage()
    }
}

public final class MTPHead {
    let cfg: ModelConfig
    let fcEmbedding: QLinear
    let fcHidden: QLinear
    let preFcNormEmbedding: RMSNorm
    let preFcNormHidden: RMSNorm
    let attnHC: GatedResidual
    let mlpHC: GatedResidual
    let attn: QSAAttention
    let moe: ResidentMoE
    let mixer: GatedResidual
    public let residentBytes: Int

    public init(_ w: MTPWeights) {
        cfg = w.config
        fcEmbedding = w.linear("mtp.fc_embedding")
        fcHidden = w.linear("mtp.fc_hidden")
        preFcNormEmbedding = RMSNorm(
            weight: w.tensor("mtp.pre_fc_norm_embedding.weight"), eps: cfg.rmsNormEps,
            groupSize: nil)
        // Full-width statistics over all hc*H dims (vLLM builds this one as a
        // plain GemmaRMSNorm over hidden*hc), unlike the per-branch hc_norms.
        preFcNormHidden = RMSNorm(
            weight: w.tensor("mtp.pre_fc_norm_hidden.weight"), eps: cfg.rmsNormEps,
            groupSize: nil)
        attnHC = GatedResidual(w, base: "mtp.layers.0.attn_hyper_connection", useCombine: true)
        mlpHC = GatedResidual(w, base: "mtp.layers.0.mlp_hyper_connection", useCombine: true)
        attn = QSAAttention(w, base: "mtp.layers.0.self_attn")
        moe = ResidentMoE(w, base: "mtp.layers.0.mlp")
        mixer = GatedResidual(w, base: "mtp.hyper_connection_mixer", useCombine: false)
        residentBytes = w.totalBytes
    }

    /// Stage-dump hook for parity debugging (set by mtp-parity --dump).
    public var debugSink: ((String, MLXArray) -> Void)? = nil {
        didSet { attn.debugSink = debugSink }
    }

    /// One step of the draft head over already-embedded tokens.
    /// - embedded: (1,S,H) dequantized embedding rows of the input tokens
    /// - hiddenMulti: (1,S,hc*H) pre-mixer multi stream (main model's on the
    ///   first step, this head's own `multi` output on chained steps)
    /// Returns (sample (1,S,H) for lm_head, multi (1,S,hc*H) for chaining).
    public func callAsFunction(
        embedded: MLXArray, hiddenMulti: MLXArray, rope: Rope, state: MTPState
    ) -> (sample: MLXArray, multi: MLXArray) {
        let (B, S) = (embedded.dim(0), embedded.dim(1))
        let e = fcEmbedding(preFcNormEmbedding(embedded))
        var h = preFcNormHidden(hiddenMulti)
            .reshaped([B, S, cfg.hcCount, cfg.hiddenSize])
        h = fcHidden(h)
        h = e.expandedDimensions(axis: -2) + h
        h = h.reshaped([B, S, cfg.hcCount * cfg.hiddenSize])
        debugSink?("fuse", h)

        let (x1, inj1) = attnHC(h)
        debugSink?("x1", x1)
        let attnOut = attn(x1, rope: rope, cache: state.kv, idxCache: state.indexer)
        debugSink?("attnOut", attnOut)
        h = h + (attnOut.expandedDimensions(axis: -2) * inj1!.expandedDimensions(axis: -1))
            .reshaped(h.shape)

        let (x2, inj2) = mlpHC(h)
        debugSink?("x2", x2)
        let moeOut = moe(x2)
        debugSink?("moeOut", moeOut)
        h = h + (moeOut.expandedDimensions(axis: -2) * inj2!.expandedDimensions(axis: -1))
            .reshaped(h.shape)

        let (mixed, _) = mixer(h)
        return (mixed, h)
    }

    /// Feed consumed main-model tokens through the head so its attention
    /// cache stays aligned: the entry for token chunk[i] fuses the multi
    /// stream of the PREVIOUS position with chunk[i]'s embedding. `prevMulti`
    /// is the multi of the token before chunk[0] — nil only at sequence
    /// start, where token 0 has no preceding hidden and gets no entry
    /// (invariant: cache offset == consumed tokens − 1).
    /// Returns the last position's multi, detached, for the next call.
    ///
    /// `visionEmbeds` (a vision prompt's prefill) carries the tower's rows
    /// for the chunk's placeholder runs, exactly as `Model.hiddenStates`
    /// sees them; they are spliced into the draft stream in place of the
    /// placeholder token's own embedding, so the head's cache is built on
    /// what the main model actually consumed. nil on plain text and on
    /// decode, which produces no placeholders.
    public func consume(
        chunk: [Int], chunkMulti: MLXArray, prevMulti: MLXArray?,
        resident: ResidentWeights, rope: Rope, state: MTPState,
        visionEmbeds: MLXArray? = nil
    ) -> MLXArray {
        let S = chunk.count
        let last = chunkMulti[0..., (S - 1)..., 0...]
        // Materialize the slice so returning it does not pin the whole
        // chunk's multi buffer (84 MB at a 4096-token prefill chunk).
        eval(last)
        let startIdx = prevMulti == nil ? 1 : 0
        if S - startIdx > 0 {
            let ids = MLXArray(chunk[startIdx...].map { Int32($0) }, [1, S - startIdx])
            var e = resident.embed(ids).asType(.bfloat16)
            if let vEmb = visionEmbeds {
                e = spliceVisionEmbeds(e, chunk: chunk, startIdx: startIdx, rows: vEmb)
            }
            let multis: MLXArray
            if let pm = prevMulti {
                multis = S > 1
                    ? concatenated([pm, chunkMulti[0..., 0 ..< (S - 1), 0...]], axis: 1)
                    : pm
            } else {
                multis = chunkMulti[0..., 0 ..< (S - 1), 0...]
            }
            _ = self(embedded: e, hiddenMulti: multis, rope: rope, state: state)
            state.materialize()
        }
        return last
    }

    /// Copy the tower's rows into the draft embedding stream at the chunk's
    /// placeholder positions. CPU-side, mirroring `Model.hiddenStates`: the
    /// same order, the same one-to-one count, the same refusal to splice on a
    /// mismatch. `rows` holds one row per placeholder in the WHOLE chunk and
    /// is aligned against it (the same array `hiddenStates` is handed), so a
    /// placeholder the head does not consume — chunk[0] at sequence start,
    /// which has no preceding hidden and therefore no MTP entry — still
    /// advances the row pointer, keeping the head's stream aligned with the
    /// main model's from that chunk on.
    private func spliceVisionEmbeds(_ e: MLXArray, chunk: [Int], startIdx: Int, rows: MLXArray) -> MLXArray {
        let rowCount = rows.ndim == 3 ? rows.dim(1) : rows.dim(0)
        let placeholderCount = chunk.filter { $0 == cfg.imageTokenId }.count
        guard rowCount == placeholderCount, placeholderCount > 0 else { return e }
        let vFlat = rows.ndim == 3 ? rows.reshaped([rowCount, cfg.hiddenSize]) : rows
        let H = cfg.hiddenSize
        let eF32 = e.asType(.float32)
        var eArr = eF32.asArray(Float.self)
        let vArr = vFlat.asType(.float32).asArray(Float.self)
        var vIdx = 0
        for (j, id) in chunk.enumerated() where id == cfg.imageTokenId {
            if j >= startIdx {
                let dstBase = (j - startIdx) * H
                let srcBase = vIdx * H
                for k in 0..<H { eArr[dstBase + k] = vArr[srcBase + k] }
            }
            vIdx += 1
        }
        return MLXArray(eArr, [1, chunk.count - startIdx, H]).asType(.bfloat16)
    }
}
