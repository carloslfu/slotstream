// Checkpoint access: config, safetensors headers, and byte-exact tensor
// locations so experts and n-gram rows can be pread directly from the
// original shards (no repack required — M0 verified layouts are contiguous).

import Foundation
import MLX

/// A checkpoint that cannot be read as this model. Carries the fix, because
/// the usual causes are a wrong --model directory or an interrupted download.
public struct ModelError: Error, CustomStringConvertible {
    public let description: String
    public init(_ s: String) { description = s }
}

// MARK: - Config

public struct ModelConfig {
    public var hiddenSize = 2560
    public var numLayers = 48
    public var numAttentionHeads = 24
    public var numKVHeads = 2
    public var headDim = 256
    public var vocabSize = 248_320
    public var rmsNormEps: Float = 1e-6
    public var fullAttentionInterval = 4
    public var layerTypes: [String] = []
    // MoE
    public var numExperts = 512
    public var topK = 10
    public var moeIntermediate = 640
    public var sharedExpertIntermediate = 640
    // GDN
    public var linearNumKHeads = 16
    public var linearNumVHeads = 48
    public var linearKHeadDim = 128
    public var linearVHeadDim = 128
    public var convKernel = 4
    public var outputGateType = "sigmoid"
    // hyper-connections
    public var hcCount = 4
    public var hcLowrank = 320
    // QSA indexer
    public var indexerNHeads = 4
    public var indexerKVHeads = 1
    public var indexerHeadDim = 128
    public var indexerBudget = 2048
    public var indexerCompressRatio = 4
    // n-gram / PLE
    public var ngramSize = 3
    public var headsPerNgram = 8
    public var ngramVocabBase = 20_000_000
    public var ngramDivisibleBy = 128
    public var splitNgramParts = 128
    public var pleEmbedDim = 2560
    public var pleLayerIds: [Int] = [2]  // 1-based per config; layer index = id-1
    public var pleConvKernel = 4
    public var seed = 1234
    // rope
    public var ropeTheta: Float = 10_000_000
    public var partialRotaryFactor: Float = 0.25
    public var eosTokenId = 248_044
    // vision (VLM): the placeholder the template emits per image, and the ids
    // the tower's embeddings splice in under (see Model.hiddenStates).
    public var imageTokenId = 248_056
    public var visionStartId = 248_053
    public var visionEndId = 248_054
    // quantization
    public var qBits = 4
    public var qGroup = 64
    public var ngramQGroup = 32

    public var rotaryDim: Int { Int(Float(headDim) * partialRotaryFactor) }
    public var pleLayerIndices: [Int] { pleLayerIds.map { $0 - 1 } }

    public static func load(from dir: URL) throws -> ModelConfig {
        let path = dir.appendingPathComponent("config.json")
        let data = try Data(contentsOf: path)
        guard let root = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw ModelError("\(path.path) is not valid JSON — re-run `slotstream pull`")
        }
        guard let t = root["text_config"] as? [String: Any] else {
            throw ModelError(
                "\(path.path) has no `text_config` section, so it is not a "
                    + "\(PinnedModelName.display) checkpoint — check --model")
        }
        var c = ModelConfig()
        func i(_ k: String, _ d: Int) -> Int { (t[k] as? Int) ?? d }
        func f(_ k: String, _ d: Float) -> Float {
            if let v = t[k] as? Double { return Float(v) }
            return d
        }
        c.hiddenSize = i("hidden_size", c.hiddenSize)
        c.numLayers = i("num_hidden_layers", c.numLayers)
        c.numAttentionHeads = i("num_attention_heads", c.numAttentionHeads)
        c.numKVHeads = i("num_key_value_heads", c.numKVHeads)
        c.headDim = i("head_dim", c.headDim)
        c.vocabSize = i("vocab_size", c.vocabSize)
        c.rmsNormEps = f("rms_norm_eps", c.rmsNormEps)
        c.fullAttentionInterval = i("full_attention_interval", c.fullAttentionInterval)
        c.layerTypes = (t["layer_types"] as? [String]) ?? []
        c.numExperts = i("num_experts", c.numExperts)
        c.topK = i("num_experts_per_tok", c.topK)
        c.moeIntermediate = i("moe_intermediate_size", c.moeIntermediate)
        c.sharedExpertIntermediate = i("shared_expert_intermediate_size", c.sharedExpertIntermediate)
        c.linearNumKHeads = i("linear_num_key_heads", c.linearNumKHeads)
        c.linearNumVHeads = i("linear_num_value_heads", c.linearNumVHeads)
        c.linearKHeadDim = i("linear_key_head_dim", c.linearKHeadDim)
        c.linearVHeadDim = i("linear_value_head_dim", c.linearVHeadDim)
        c.convKernel = i("linear_conv_kernel_dim", c.convKernel)
        c.outputGateType = (t["output_gate_type"] as? String) ?? c.outputGateType
        c.hcCount = i("hc_count", c.hcCount)
        c.hcLowrank = i("hc_lowrank", c.hcLowrank)
        c.indexerNHeads = i("indexer_n_heads", c.indexerNHeads)
        c.indexerKVHeads = i("indexer_kv_heads", c.indexerKVHeads)
        c.indexerHeadDim = i("indexer_head_dim", c.indexerHeadDim)
        c.indexerBudget = i("indexer_budget", c.indexerBudget)
        c.indexerCompressRatio = i("indexer_compress_ratio", c.indexerCompressRatio)
        c.ngramSize = i("ngram_size", c.ngramSize)
        c.headsPerNgram = i("heads_per_ngram", c.headsPerNgram)
        c.ngramVocabBase = i("ngram_vocab_size_base", c.ngramVocabBase)
        c.ngramDivisibleBy = i("make_ngram_vocab_size_divisible_by", c.ngramDivisibleBy)
        c.splitNgramParts = i("split_ngram_parts", c.splitNgramParts)
        c.pleEmbedDim = i("ple_embed_dim", c.pleEmbedDim)
        c.pleLayerIds = (t["ple_layer_ids"] as? [Int]) ?? c.pleLayerIds
        c.pleConvKernel = i("ple_conv_kernel_size", c.pleConvKernel)
        c.seed = i("seed", c.seed)
        if let rp = t["rope_parameters"] as? [String: Any] {
            if let th = rp["rope_theta"] as? Double { c.ropeTheta = Float(th) }
            if let pf = rp["partial_rotary_factor"] as? Double { c.partialRotaryFactor = Float(pf) }
        }
        if let e = t["eos_token_id"] as? Int { c.eosTokenId = e }
        if let e = (t["eos_token_id"] as? [Int])?.first { c.eosTokenId = e }
        // Vision ids live in the root of config.json, not text_config.
        if let v = root["image_token_id"] as? Int { c.imageTokenId = v }
        if let v = root["vision_start_token_id"] as? Int { c.visionStartId = v }
        if let v = root["vision_end_token_id"] as? Int { c.visionEndId = v }
        // These two values shape a Range and a modulo below. Validate them
        // before using either; malformed custom config used to trap here before
        // the comprehensive validation at the end of the loader could run.
        guard c.numLayers > 0, c.numLayers <= 256, c.fullAttentionInterval > 0 else {
            throw ModelError(
                "unsupported or invalid text_config (layer count/attention interval) — check --model")
        }
        if c.layerTypes.isEmpty {
            c.layerTypes = (0 ..< c.numLayers).map {
                ($0 + 1) % c.fullAttentionInterval == 0 ? "full_attention" : "linear_attention"
            }
        }
        if let q = root["quantization"] as? [String: Any] {
            c.qBits = (q["bits"] as? Int) ?? c.qBits
            c.qGroup = (q["group_size"] as? Int) ?? c.qGroup
            // ngram shard override (all identical per M0)
            for (k, v) in q {
                if k.contains("ngram_embedding"), let d = v as? [String: Any],
                    let g = d["group_size"] as? Int
                {
                    c.ngramQGroup = g
                    break
                }
            }
        }
        try c.validate()
        return c
    }

    /// Reject unsupported or internally inconsistent geometry before any
    /// range construction, array indexing, or GPU allocation can trap. This
    /// runner intentionally supports one architecture; silently accepting a
    /// near-match only turns a useful `--model` error into a much later crash.
    private func validate() throws {
        func bad(_ detail: String) throws -> Never {
            throw ModelError("unsupported or invalid text_config (\(detail)) — check --model")
        }
        guard hiddenSize == 2560, numLayers == 48,
            numAttentionHeads == 24, numKVHeads == 2, headDim == 256,
            vocabSize == 248_320, fullAttentionInterval == 4,
            numExperts == 512, topK == 10, moeIntermediate == 640,
            sharedExpertIntermediate == 640,
            linearNumKHeads == 16, linearNumVHeads == 48,
            linearKHeadDim == 128, linearVHeadDim == 128, convKernel == 4,
            outputGateType == "sigmoid", hcCount == 4, hcLowrank == 320,
            indexerNHeads == 4, indexerKVHeads == 1, indexerHeadDim == 128,
            indexerBudget == 2048, indexerCompressRatio == 4,
            ngramSize == 3, headsPerNgram == 8, ngramVocabBase == 20_000_000,
            ngramDivisibleBy == 128, splitNgramParts == 128,
            pleEmbedDim == 2560, pleLayerIds == [2], pleConvKernel == 4,
            qBits == 4, qGroup == 64, ngramQGroup == 32
        else {
            try bad("checkpoint geometry does not match Qwen3.8-Flash-Next-MLX-4bit")
        }
        guard numAttentionHeads > 0, numKVHeads > 0, headDim > 0,
            vocabSize > 0, fullAttentionInterval > 0,
            topK > 0, topK <= numExperts, moeIntermediate > 0,
            sharedExpertIntermediate > 0, linearNumKHeads > 0,
            linearNumVHeads > 0, linearKHeadDim > 0, linearVHeadDim > 0,
            convKernel > 0, hcCount > 0, hcLowrank > 0,
            indexerNHeads > 0, indexerKVHeads > 0, indexerHeadDim > 0,
            indexerBudget > 0, indexerCompressRatio > 0,
            ngramSize >= 2, headsPerNgram > 0, ngramVocabBase > 0,
            ngramDivisibleBy > 0, splitNgramParts > 0, pleEmbedDim > 0,
            pleConvKernel > 0, !pleLayerIds.isEmpty,
            qGroup > 0, ngramQGroup > 0,
            rmsNormEps.isFinite, rmsNormEps > 0,
            ropeTheta.isFinite, ropeTheta > 0,
            partialRotaryFactor.isFinite, partialRotaryFactor > 0,
            partialRotaryFactor <= 1
        else { try bad("non-positive, non-finite, or unsupported dimensions") }
        guard hiddenSize % 8 == 0, hiddenSize % qGroup == 0,
            moeIntermediate % 8 == 0, moeIntermediate % qGroup == 0,
            pleEmbedDim % ((ngramSize - 1) * headsPerNgram) == 0,
            indexerBudget / indexerCompressRatio > 0
        else { try bad("dimensions are not divisible by their packing/group sizes") }
        guard pleLayerIds.allSatisfy({ $0 >= 1 && $0 <= numLayers }) else {
            try bad("ple_layer_ids is outside the layer stack")
        }
        if !layerTypes.isEmpty {
            let expected = (0 ..< numLayers).map {
                ($0 + 1) % fullAttentionInterval == 0 ? "full_attention" : "linear_attention"
            }
            guard layerTypes.count == numLayers,
                layerTypes == expected
            else { try bad("layer_types must name all 48 supported attention layers") }
            guard pleLayerIds.allSatisfy({ layerTypes[$0 - 1] == "linear_attention" }) else {
                try bad("a PLE layer is not a linear_attention layer")
            }
        }
        guard eosTokenId >= 0, eosTokenId < vocabSize else {
            try bad("eos_token_id is outside the vocabulary")
        }
    }
}

// MARK: - Safetensors header parsing

public struct TensorRef {
    public let file: URL
    public let dtype: String  // "U32" | "BF16" | "I64" | ...
    public let shape: [Int]
    public let byteOffset: Int  // absolute offset in file of first byte
    public let byteCount: Int

    public var itemSize: Int {
        switch dtype {
        case "U32", "F32", "I32": return 4
        case "BF16", "F16", "U16": return 2
        case "I64", "U64", "F64": return 8
        case "U8", "I8", "BOOL": return 1
        default: return 0  // unknown dtype; callers reject it before use
        }
    }
    /// Bytes per leading-axis row (shape[1:] product × itemSize).
    public var rowBytes: Int {
        var bytes = itemSize
        for dim in shape.dropFirst() {
            let (next, overflow) = bytes.multipliedReportingOverflow(by: dim)
            if overflow { return 0 }
            bytes = next
        }
        return bytes
    }
}

/// Parses every shard header once; provides absolute (file, offset) for any tensor.
public final class CheckpointIndex {
    public let dir: URL
    public let config: ModelConfig
    public private(set) var tensors: [String: TensorRef] = [:]
    private var fds: [URL: Int32] = [:]
    private let fdLock = NSLock()

    deinit {
        fdLock.withLock {
            for fd in fds.values { close(fd) }
            fds.removeAll()
        }
    }

    /// The `model-*.safetensors` shards in `dir`, symlink-resolved first:
    /// Foundation's `contentsOfDirectory(at:)` refuses a symlink to a
    /// directory ("couldn't be opened") even though every file read through
    /// it works, which broke weights relocated behind a symlink.
    public static func shardFiles(in dir: URL) throws -> [URL] {
        let resolved = dir.resolvingSymlinksInPath()
        return try FileManager.default.contentsOfDirectory(at: resolved, includingPropertiesForKeys: nil)
            .filter { $0.lastPathComponent.hasPrefix("model") && $0.pathExtension == "safetensors" }
            .sorted { $0.lastPathComponent < $1.lastPathComponent }
    }

    public init(dir: URL) throws {
        let resolved = dir.resolvingSymlinksInPath()
        self.dir = resolved
        self.config = try ModelConfig.load(from: resolved)
        let files = try Self.shardFiles(in: resolved)
        guard !files.isEmpty else {
            throw ModelError("no .safetensors files in \(dir.path) — run `slotstream pull`")
        }
        for f in files {
            try parseHeader(f)
        }
        try requireExpectedTensors()
    }

    private func parseHeader(_ file: URL) throws {
        let h = try FileHandle(forReadingFrom: file)
        defer { try? h.close() }
        func corrupt(_ why: String) -> ModelError {
            ModelError(
                "\(file.lastPathComponent) is not a readable safetensors file (\(why)) — "
                    + "re-run `slotstream pull` to repair it")
        }
        guard let lenData = try h.read(upToCount: 8), lenData.count == 8 else {
            throw corrupt("truncated header")
        }
        guard let fileSize64 = (try? FileManager.default.attributesOfItem(atPath: file.path))?[.size]
            as? Int64, fileSize64 >= 8, fileSize64 <= Int64(Int.max)
        else { throw corrupt("file size is not representable") }
        let fileSize = Int(fileSize64)
        // Data's buffer carries no alignment guarantee; `load` requires one.
        let n = lenData.withUnsafeBytes { $0.loadUnaligned(as: UInt64.self) }
        // safetensors' reference parser caps headers at 100 MB to prevent a
        // tiny length prefix from triggering an attacker-sized allocation.
        guard n > 0, n <= 100_000_000, n <= UInt64(fileSize - 8),
            let hdrData = try h.read(upToCount: Int(n)),
            hdrData.count == Int(n)
        else { throw corrupt("header length \(n) does not fit the file") }
        guard let obj = try? JSONSerialization.jsonObject(with: hdrData) as? [String: Any] else {
            throw corrupt("header is not valid JSON")
        }
        let dataStart = 8 + Int(n)
        let dataBytes = fileSize - dataStart
        var parsed: [(name: String, dtype: String, shape: [Int], start: Int, end: Int)] = []
        for (key, v) in obj {
            if key == "__metadata__" { continue }
            guard let d = v as? [String: Any] else {
                throw corrupt("malformed entry for \(key)")
            }
            guard let offs = d["data_offsets"] as? [Int], offs.count == 2,
                let dtype = d["dtype"] as? String, let shape = d["shape"] as? [Int]
            else { throw corrupt("malformed entry for \(key)") }
            let itemSize: Int
            switch dtype {
            case "U32", "F32", "I32": itemSize = 4
            case "BF16", "F16", "U16": itemSize = 2
            case "I64", "U64", "F64": itemSize = 8
            case "U8", "I8", "BOOL": itemSize = 1
            default: throw corrupt("unsupported dtype \(dtype) for \(key)")
            }
            guard offs[0] >= 0, offs[1] >= offs[0], offs[1] <= dataBytes,
                shape.allSatisfy({ $0 >= 0 })
            else { throw corrupt("invalid shape or offsets for \(key)") }
            var elements = 1
            for dim in shape {
                let (next, overflow) = elements.multipliedReportingOverflow(by: dim)
                guard !overflow else { throw corrupt("shape overflows for \(key)") }
                elements = next
            }
            let (expected, byteOverflow) = elements.multipliedReportingOverflow(by: itemSize)
            guard !byteOverflow, offs[1] - offs[0] == expected else {
                throw corrupt("byte count does not match dtype × shape for \(key)")
            }
            var name = key
            if name.hasPrefix("language_model.") { name.removeFirst("language_model.".count) }
            guard tensors[name] == nil, !parsed.contains(where: { $0.name == name }) else {
                throw corrupt("duplicate tensor name \(name)")
            }
            parsed.append((name, dtype, shape, offs[0], offs[1]))
        }
        // The format requires the tensor ranges to cover the entire data
        // buffer without holes or overlaps.
        var cursor = 0
        for p in parsed.sorted(by: { $0.start < $1.start }) {
            guard p.start == cursor else {
                throw corrupt("tensor data has a hole or overlap before \(p.name)")
            }
            cursor = p.end
        }
        guard cursor == dataBytes else { throw corrupt("tensor data does not cover the file") }
        for p in parsed {
            tensors[p.name] = TensorRef(
                file: file, dtype: p.dtype, shape: p.shape,
                byteOffset: dataStart + p.start, byteCount: p.end - p.start)
        }
    }

    /// Names every build path assumes exist. Checking them once, up front,
    /// turns "pointed --model at the wrong directory" from a fatalError deep in
    /// layer construction into one sentence naming the problem.
    private func requireExpectedTensors() throws {
        var required = ["model.embed_tokens.weight", "lm_head.weight"]
        func linear(_ base: String) { required.append(base + ".weight") }
        func hyper(_ base: String, inject: Bool) {
            required.append(base + ".hc_norm.weight")
            linear(base + ".input_mix_weight_down")
            linear(base + ".input_mix_weight_up")
            if inject { required.append(base + ".block_inject_weight.weight") }
        }
        hyper("model.hyper_connection_mixer", inject: false)
        for l in 0 ..< config.numLayers {
            let layer = "model.layers.\(l)"
            let mlp = layer + ".mlp"
            required.append(mlp + ".gate.weight")
            linear(mlp + ".shared_expert_gate")
            linear(mlp + ".shared_expert.gate_proj")
            linear(mlp + ".shared_expert.up_proj")
            linear(mlp + ".shared_expert.down_proj")
            for piece in ExpertStore.pieces {
                required.append(mlp + ".switch_mlp." + piece)
            }
            hyper(layer + ".attn_hyper_connection", inject: true)
            hyper(layer + ".mlp_hyper_connection", inject: true)

            if config.layerTypes[l] == "linear_attention" {
                let b = layer + ".linear_attn"
                for name in ["in_proj_qkv", "in_proj_z", "in_proj_b", "in_proj_a", "out_proj"] {
                    linear(b + "." + name)
                }
                for name in ["conv1d.weight", "dt_bias", "A_log", "norm.weight"] {
                    required.append(b + "." + name)
                }
            } else {
                let b = layer + ".self_attn"
                for name in ["q_proj", "k_proj", "v_proj", "o_proj"] {
                    linear(b + "." + name)
                }
                required.append(b + ".q_norm.weight")
                required.append(b + ".k_norm.weight")
                linear(b + ".indexer.index_qk_proj")
                required.append(b + ".indexer.q_layernorm.weight")
                required.append(b + ".indexer.k_layernorm.weight")
            }

            if config.pleLayerIndices.contains(l) {
                let b = layer + ".ple"
                linear(b + ".key_proj")
                linear(b + ".value_proj")
                for name in ["norm_key.weight", "norm_query.weight", "norm_conv.weight", "conv1d.weight"] {
                    required.append(b + "." + name)
                }
                let emb = b + ".ple_embedding."
                let metadata = ["layer_multipliers", "ngram_heads_vocab_sizes", "ngram_heads_offsets"]
                let present = metadata.filter { tensors[emb + $0] != nil }
                if !present.isEmpty, present.count != metadata.count {
                    throw ModelError(
                        "\(dir.path) has an incomplete PLE metadata set — re-run `slotstream pull`")
                }
                for s in 0 ..< config.splitNgramParts {
                    for piece in ["weight", "scales", "biases"] {
                        required.append(emb + "ngram_embedding.shard_\(s)." + piece)
                    }
                }
            }
        }
        // Packed U32 weights without scales would be treated as ordinary
        // matrices, while orphaned biases would be silently ignored.
        for (name, ref) in tensors where name.hasSuffix(".weight") && ref.dtype == "U32" {
            let base = String(name.dropLast(".weight".count))
            if tensors[base + ".scales"] == nil {
                throw ModelError("\(dir.path) has packed tensor `\(name)` without scales — re-run `slotstream pull`")
            }
        }
        for name in tensors.keys where name.hasSuffix(".biases") {
            let base = String(name.dropLast(".biases".count))
            if tensors[base + ".weight"] == nil || tensors[base + ".scales"] == nil {
                throw ModelError("\(dir.path) has orphaned quantization tensor `\(name)` — re-run `slotstream pull`")
            }
        }
        if let missing = required.first(where: { tensors[$0] == nil }) {
            throw ModelError(
                "\(dir.path) does not look like a \(PinnedModelName.display) checkpoint "
                    + "(no tensor `\(missing)`; found \(tensors.count) tensors) — check --model")
        }
    }

    public func ref(_ name: String) -> TensorRef {
        guard let r = tensors[name] else { fatalError("missing tensor \(name)") }
        return r
    }

    public func fd(for file: URL) -> Int32 {
        fdLock.lock()
        defer { fdLock.unlock() }
        if let f = fds[file] { return f }
        let f = open(file.path, O_RDONLY)
        precondition(f >= 0, "open \(file.path) failed")
        _ = fcntl(f, F_NOCACHE, 1)
        _ = fcntl(f, F_RDAHEAD, 0)
        fds[file] = f
        return f
    }

    /// pread `count` bytes at absolute `offset` of `ref`'s file into `dst`.
    public func pread(into dst: UnsafeMutableRawPointer, _ r: TensorRef, offset: Int, count: Int) {
        var done = 0
        let f = fd(for: r.file)
        while done < count {
            let got = Foundation.pread(f, dst + done, count - done, off_t(r.byteOffset + offset + done))
            precondition(got > 0, "pread failed at \(r.byteOffset + offset + done): \(String(cString: strerror(errno)))")
            done += got
        }
    }
}
