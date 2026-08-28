// Qwen4Exp model assembly: 48 layers of (GDN | QSA) + MoE with
// hyper-connection residuals, PLE injection at the configured layer, and the
// final mixer + lm_head. Streams experts (SlotPool) and n-gram rows (NgramStore).

import Foundation
import MLX

public final class Qwen4ExpModel {
    public let cfg: ModelConfig
    public let resident: ResidentWeights
    public let pool: SlotPool
    public let ngram: NgramStore

    let rope: Rope
    var gdn: [Int: GDNLayer] = [:]
    var qsa: [Int: QSAAttention] = [:]
    var moe: [Int: MoELayer] = [:]
    var attnHC: [GatedResidual] = []
    var mlpHC: [GatedResidual] = []
    var ple: [Int: PLELayer] = [:]
    let mixer: GatedResidual
    let lmHead: QLinear
    public let runLayers: Int  // truncated for parity rigs; numLayers normally

    public final class State {
        var linear: [Int: LinearCache] = [:]
        var kv: [Int: KVCache] = [:]
        var indexer: [Int: IndexerCache] = [:]
        var ngramCtx: [Int64] = []
        public var tokenCount = 0
        public init() {}
    }

    public init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil) throws {
        self.cfg = index.config
        self.runLayers = runLayers ?? index.config.numLayers
        // parity rigs keep the truncated layers' experts resident? no — pool serves them
        self.resident = try ResidentWeights(index: index)
        let store = ExpertStore(index: index)
        self.pool = SlotPool(slots: poolSlots, store: store)
        self.ngram = NgramStore(index: index, resident: resident)
        self.rope = Rope(dim: cfg.rotaryDim, base: cfg.ropeTheta)

        for l in 0 ..< self.runLayers {
            let base = "model.layers.\(l)"
            if cfg.layerTypes[l] == "linear_attention" {
                gdn[l] = GDNLayer(resident, layer: l)
            } else {
                qsa[l] = QSAAttention(resident, layer: l)
            }
            moe[l] = MoELayer(resident, layer: l, pool: pool)
            attnHC.append(GatedResidual(resident, base: base + ".attn_hyper_connection", useCombine: true))
            mlpHC.append(GatedResidual(resident, base: base + ".mlp_hyper_connection", useCombine: true))
            if cfg.pleLayerIndices.contains(l) {
                ple[l] = PLELayer(resident, layer: l, store: ngram)
            }
        }
        if ProcessInfo.processInfo.environment["SS_DEBUG_DIR"] != nil { attnHC[0].debugName = "hc0" }
        mixer = GatedResidual(resident, base: "model.hyper_connection_mixer", useCombine: false)
        lmHead = resident.linear("lm_head")
    }

    public func makeState() -> State {
        let s = State()
        s.ngramCtx = Array(repeating: Int64(cfg.eosTokenId), count: cfg.ngramSize - 1)
        for l in 0 ..< runLayers {
            if cfg.layerTypes[l] == "linear_attention" {
                s.linear[l] = LinearCache()
            } else {
                s.kv[l] = KVCache()
                s.indexer[l] = IndexerCache()
            }
        }
        return s
    }

    /// One forward pass over `ids` (1, S). Returns final hidden (1, S, hidden).
    /// `perLayerHook` (parity rigs) receives the hyper-width h after each layer.
    static func debugDump(_ name: String, _ arr: MLXArray) {
        guard let dir = ProcessInfo.processInfo.environment["SS_DEBUG_DIR"] else { return }
        let v = arr.asType(.float32).asArray(Float.self)
        let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
        try? d.write(to: URL(fileURLWithPath: dir).appendingPathComponent(name + ".bin"))
    }

    public func hiddenStates(
        _ ids: [Int], state: State, perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) -> MLXArray {
        let S = ids.count
        let idArr = MLXArray(ids.map { Int32($0) }, [1, S])
        var h = resident.embed(idArr).asType(.bfloat16)
        Self.debugDump("embed", h)
        h = tiled(h, repetitions: [1, 1, cfg.hcCount])

        // n-gram history: rolling context + new ids
        let history = state.ngramCtx + ids.map { Int64($0) }
        state.ngramCtx = Array(history.suffix(cfg.ngramSize - 1))

        for l in 0 ..< runLayers {
            if let p = ple[l] {
                h = h + p(h, history: history, nNew: S, cache: state.linear[l] ?? nil)
            }
            let dbgLayer = Int(ProcessInfo.processInfo.environment["SS_DEBUG_LAYER"] ?? "0") ?? 0
            let (x1, inj1) = attnHC[l](h)
            if l == dbgLayer { Self.debugDump("x1", x1); Self.debugDump("inj1", inj1!) }
            let attnOut: MLXArray
            if let g = gdn[l] {
                attnOut = g(x1, cache: state.linear[l])
            } else {
                attnOut = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
            }
            if l == dbgLayer { Self.debugDump("attn", attnOut) }
            h = h + (attnOut.expandedDimensions(axis: -2) * inj1!.expandedDimensions(axis: -1))
                .reshaped(h.shape)
            if l == dbgLayer { Self.debugDump("hAfterAttn", h) }

            let (x2, inj2) = mlpHC[l](h)
            if l == dbgLayer { Self.debugDump("x2", x2) }
            let moeOut = moe[l]!(x2)
            if l == dbgLayer { Self.debugDump("moe", moeOut) }
            h = h + (moeOut.expandedDimensions(axis: -2) * inj2!.expandedDimensions(axis: -1))
                .reshaped(h.shape)

            // synchronize the layer so pool references release before the next
            // layer's ensure() scatters (keeps slot writes in place, see PLAN §4.2)
            eval(h)
            perLayerHook?(l, h)
        }
        state.tokenCount += S
        let (mixed, _) = mixer(h)
        return mixed
    }

    /// Logits for the last position only.
    public func lastLogits(_ ids: [Int], state: State) -> MLXArray {
        let hidden = hiddenStates(ids, state: state)
        let last = hidden[0..., (hidden.dim(1) - 1)..., 0...]
        return lmHead(last)  // (1,1,vocab)
    }
}

// PLE cache slot rides on the linear cache of its (linear-attention) layer; if
// the PLE layer were ever a QSA layer this would need its own cache. Assert at
// init time instead of failing silently.
extension Qwen4ExpModel {
    public func validate() {
        for l in cfg.pleLayerIndices where l < runLayers {
            precondition(
                cfg.layerTypes[l] == "linear_attention",
                "PLE layer \(l) is not linear_attention; PLE conv cache needs a home")
        }
    }
}
