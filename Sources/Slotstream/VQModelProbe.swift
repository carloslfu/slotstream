import Foundation
import MLX
import MLXNN

/// Experimental complete text stack with streamed or fixed resident weights.
/// Routed experts use immutable staging or an optional fixed resident cache.
/// Uses the existing owned recurrent/KV/indexer checkpoint machinery. The
/// bounded path is not yet a production service or automatic memory policy.
package final class VQModelProbe {
    private let checkpoint: VQCheckpoint
    private let rope: Rope
    private let verificationArithmetic: Bool
    private let state = Qwen4ExpModel.State()
    private var recordingMulti: MLXArray?
    package var consumedTokens: Int { state.tokenCount }
    package var hasCommittedBoundary: Bool { state.committedBoundaryValid }
    package struct Output {
        package let logits: MLXArray
        package let multi: MLXArray
    }

    package func snapshot() throws -> StateCheckpoint {
        guard state.committedBoundaryValid, !state.recordingEnabled else {
            throw ModelError("VQ checkpoint requires a committed non-recording boundary")
        }
        return state.checkpoint()
    }

    package func restore(_ checkpoint: StateCheckpoint) throws {
        try state.restoreChecked(checkpoint)
        recordingMulti = nil
    }

    package func beginRecording() throws {
        guard state.committedBoundaryValid, !state.recordingEnabled else {
            throw ModelError("VQ recording requires a committed idle boundary")
        }
        state.setRecording(true)
    }

    package func rollbackRecorded(keeping n: Int, of tokens: [Int], from checkpoint: StateCheckpoint) throws {
        guard let multi = recordingMulti, multi.shape == [1, tokens.count, 10240] else {
            throw ModelError("VQ rollback requires its completed recorded multi stream")
        }
        try state.rollbackChecked(keeping: n, of: tokens, from: checkpoint, ngramWindow: 2)
        state.lastMulti = contiguous(multi[0..., (n - 1)..<n, 0...])
        eval(state.lastMulti!)
        recordingMulti = nil
    }

    package func diagnosticTensors() -> [String: MLXArray] { state.diagnosticTensors() }
    private var recordCache: VQRecordCache?
    private var residentText: VQResidentText?
    package var residentTextStats: [String: Int]? { residentText?.stats }
    package var processByteLimit: UInt64 { residentText == nil ? 4_000_000_000 : 10_000_000_000 }

    package func enableResidentText() throws {
        guard state.committedBoundaryValid, state.tokenCount == 0, residentText == nil else { throw ModelError("VQ text residency must precede the first pass") }
        residentText = try VQResidentText(checkpoint)
    }
    package var recordCacheStats: [String: Int]? { recordCache?.stats }

    package func enableResidentRecords(wide: Bool = false, parallelReads: Bool = false, reinvestDenseSavings: Bool = false) throws {
        guard state.committedBoundaryValid, state.tokenCount == 0, recordCache == nil else { throw ModelError("VQ cache must be configured before the first pass") }
        guard (!wide && !parallelReads) || residentText != nil else { throw ModelError("wide banks and parallel VQ reads require the resident-text process envelope") }
        recordCache = try VQRecordCache(checkpoint, capacityPerClass: 96, wide: wide, parallelReads: parallelReads,
                                        reinvestDenseSavings: reinvestDenseSavings)
    }
    package private(set) var maximumRecordBatches = 0
    package private(set) var maximumLiveExperts = 0
    package private(set) var segmentedPrefillLayers = 0
    package private(set) var sparseAttentionLayers = 0

    package init(_ checkpoint: VQCheckpoint, verificationArithmetic: Bool = false) {
        self.checkpoint = checkpoint
        self.verificationArithmetic = verificationArithmetic
        let cfg = checkpoint.config
        rope = Rope(dim: cfg.rotaryDim, base: cfg.ropeTheta, pinnedVQReference: true)
        state.ngramCtx = [Int64](repeating: Int64(cfg.eosTokenId), count: 2)
        for layer in 0..<48 {
            if cfg.layerTypes[layer] == "linear_attention" { state.linear[layer] = LinearCache() }
            else { state.kv[layer] = KVCache(); state.indexer[layer] = IndexerCache() }
        }
    }

    @discardableResult
    package func forward(_ tokens: [Int], observe: (Int, String, MLXArray) throws -> Void,
                         trace: ((Int, String, MLXArray) -> Void)? = nil, inspectState: Bool = true,
                         shouldContinue: () -> Bool = { true }) throws -> Output {
        guard state.committedBoundaryValid, recordingMulti == nil, (1...512).contains(tokens.count),
              state.tokenCount + tokens.count <= 2054,
              tokens.allSatisfy({ (0..<checkpoint.config.vocabSize).contains($0) }),
              !state.recordingEnabled || tokens.count <= 5 else {
            throw ModelError("VQ full-stack probe requires a committed state, valid tokens and at most 2054 tokens in passes of 512, or five recorded tokens")
        }
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        let priorProjectionMode = RowInvariantMatmul.enabled
        RowInvariantMatmul.enabled = verificationArithmetic
        defer { RowInvariantMatmul.enabled = priorProjectionMode }
        // Any partial failure requires an explicit restore of a live ancestor.
        // Reuse the production lifetime checks, never infer recovery from offsets.
        state.recordedTokenIds = state.recordingEnabled ? tokens : nil
        state.recordingBaseTokenCount = state.recordingEnabled ? state.tokenCount : nil
        state.committedBoundaryValid = false
        recordingMulti = nil
        var hidden = tiled(try residentText?.embed(tokens) ?? checkpoint.embedding(tokens), repetitions: [1, 1, 4])
        eval(hidden)
        if inspectState { try observe(-1, "embedded", hidden) }
        let history = state.ngramCtx + tokens.map(Int64.init)
        for layer in 0..<48 {
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 3_000_000_000,
                  ProcessMemory.peakResidentBytes() <= processByteLimit else {
                throw ModelError("VQ full-stack probe lost its 3 GB headroom or exceeded its configured process bound")
            }
            hidden = try autoreleasepool {
                try block(layer, hidden: hidden, history: history, trace: trace) { mask in
                    if inspectState { try observe(layer, "sparse_mask", mask) }
                }
            }
            eval(hidden)
            guard all(isFinite(hidden)).item(Bool.self) else { throw ModelError("nonfinite VQ hidden state at layer \(layer)") }
            if inspectState {
                try observe(layer, "hidden", hidden)
                if let cache = state.linear[layer] {
                    if let value = cache.convState { try observe(layer, "conv", value) }
                    if let value = cache.ssmState { try observe(layer, "state", value) }
                    if let value = cache.pleConvState { try observe(layer, "ple_conv", value) }
                } else if let cache = state.kv[layer] {
                    if let value = cache.keys { try observe(layer, "keys", value[0..., 0..., 0..<cache.offset, 0...]) }
                    if let value = cache.values { try observe(layer, "values", value[0..., 0..., 0..<cache.offset, 0...]) }
                    if let value = state.indexer[layer]?.diagnosticValues() { try observe(layer, "indexer", value) }
                }
            }
            // Fixed resident-text experiments already cap unused allocator
            // storage at 128 MB. Reuse that bounded storage between layers;
            // retain eager release for streamed weights or a larger cache.
            // No model tensor, bank pin or GPU completion rule changes here.
            if residentText == nil || MLX.Memory.cacheLimit > 128_000_000 {
                MLX.Memory.clearCache()
            }
        }
        let output = try autoreleasepool {
            let weights = try residentText?.weights(layer: nil) ?? checkpoint.dense(layer: nil)
            let mixer = GatedResidual(weights, base: "model.hyper_connection_mixer", useCombine: false, arithmetic: .vqPR1788)
            let mixed = mixer(hidden).0
            let logits = weights.linear("lm_head")(mixed).asType(.float32)
            eval(logits)
            guard logits.shape == [1, tokens.count, 248_320], all(isFinite(logits)).item(Bool.self) else {
                throw ModelError("VQ probe has incomplete or nonfinite full-vocabulary logits")
            }
            if inspectState { try observe(48, "mixed", mixed) }
            try observe(48, "logits", logits)
            return Output(logits: logits, multi: hidden)
        }
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        state.lastMulti = contiguous(hidden[0..., (tokens.count - 1)..<tokens.count, 0...])
        eval(state.lastMulti!)
        recordingMulti = state.recordingEnabled ? hidden : nil
        state.ngramCtx = Array(history.suffix(2)); state.tokenCount += tokens.count
        state.committedBoundaryValid = true
        return output
    }

    private func block(_ layer: Int, hidden: MLXArray, history: [Int64], trace: ((Int, String, MLXArray) -> Void)?,
                       sparse: (MLXArray) throws -> Void) throws -> MLXArray {
        let weights = try residentText?.weights(layer: layer) ?? checkpoint.dense(layer: layer), base = "model.layers.\(layer)."
        var h = hidden
        if layer == 1 {
            let ple = PLELayer(weights, layer: layer, arithmetic: .vqPR1788,
                embedding: { [checkpoint] in try checkpoint.pleEmbedding(history: $0, nNew: $1, weights: weights) })
            h = h + (try ple(h, history: history, nNew: h.dim(1), cache: state.linear[layer]))
        }
        let attnHC = GatedResidual(weights, base: base + "attn_hyper_connection", useCombine: true, arithmetic: .vqPR1788)
        let mlpHC = GatedResidual(weights, base: base + "mlp_hyper_connection", useCombine: true, arithmetic: .vqPR1788)
        if let trace {
            let normalized = attnHC.hcNorm(h), down = attnHC.down(normalized)
            let activated = MLXNN.silu(down / Float(4)), up = attnHC.up(activated), gates = VQArithmetic.sigmoid(up)
            trace(layer, "hcInput", h); trace(layer, "hcWeight", attnHC.hcNorm.weight)
            trace(layer, "hcNormalized", normalized); trace(layer, "hcDown", down)
            trace(layer, "hcActivated", activated); trace(layer, "hcUp", up); trace(layer, "hcGates", gates)
        }
        let (x, inject) = attnHC(h)
        trace?(layer, "attnInput", x); trace?(layer, "attnInject", inject!)
        let attended: MLXArray
        if let cache = state.linear[layer] {
            attended = GDNLayer(weights, layer: layer, arithmetic: .vqPR1788)(x, cache: cache)
        } else {
            let attention = QSAAttention(weights, layer: layer, arithmetic: .vqPR1788)
            if verificationArithmetic {
                attention.multiRowMode = .exact
                attention.multiRowMinContext = 0
            }
            var values: [String: MLXArray] = [:]
            attention.debugSink = { name, value in
                if trace != nil || name == "sparseMask" { values[name] = value }
            }
            if let trace {
                let angles = rope.table(start: state.kv[layer]!.offset, count: x.dim(1))
                trace(layer, "ropeInvFreq", rope.invFreq)
                trace(layer, "ropeCos", angles.0); trace(layer, "ropeSin", angles.1)
            }
            attended = attention(x, rope: rope, cache: state.kv[layer]!, idxCache: state.indexer[layer]!)
            if let mask = values["sparseMask"] {
                try sparse(mask); sparseAttentionLayers += 1
            }
            for (name, value) in values { trace?(layer, name, value) }
        }
        trace?(layer, "attnOutput", attended)
        h = h + (attended.expandedDimensions(axis: -2) * inject!.expandedDimensions(axis: -1)).reshaped(h.shape)
        trace?(layer, "afterAttn", h)
        let (input, mlpInject) = mlpHC(h)
        trace?(layer, "mlpInput", input)
        let logits = RouterProjection(weights.tensor(base + "mlp.gate.weight"))(input)
        let indices = RouterSelection.reference(logits, k: 10)
        let probability = softmax(takeAlong(logits, indices, axis: -1), axis: -1, precise: true)
        let routes = indices.asType(.uint32).asArray(UInt32.self)
        let streamed: VQRouteStream.Result
        if input.dim(1) > 409 {
            streamed = try VQPrefillStream.call(input.reshaped([-1, 2560]), routes: routes) { ids in
                try checkpoint.records(layer: layer, experts: ids)
            }
            segmentedPrefillLayers += 1
        } else if let recordCache {
            streamed = try recordCache.call(input.reshaped([-1, 2560]), layer: layer, routes: routes)
        } else {
            streamed = try VQRouteStream.call(input.reshaped([-1, 2560]), routes: routes) { ids in
                try checkpoint.records(layer: layer, experts: ids)
            }
        }
        maximumRecordBatches = max(maximumRecordBatches, streamed.batches)
        maximumLiveExperts = max(maximumLiveExperts, streamed.maximumExperts)
        let values = streamed.values.reshaped([1, input.dim(1), 10, 2560])
        let routed = (values * probability.expandedDimensions(axis: -1)).sum(axis: -2).asType(input.dtype)
        let shared = base + "mlp.shared_expert."
        let sharedValue = weights.linear(shared + "down_proj")(
            MLXNN.silu(weights.linear(shared + "gate_proj")(input)) * weights.linear(shared + "up_proj")(input))
        let output = routed + VQArithmetic.sigmoid(weights.linear(base + "mlp.shared_expert_gate")(input)) * sharedValue
        trace?(layer, "moeOutput", output)
        let result = h + (output.expandedDimensions(axis: -2) * mlpInject!.expandedDimensions(axis: -1)).reshaped(h.shape)
        eval(result)
        return result
    }
}
