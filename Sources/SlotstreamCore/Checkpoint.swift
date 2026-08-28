// Checkpoint access: config, safetensors headers, and byte-exact tensor
// locations so experts and n-gram rows can be pread directly from the
// original shards (no repack required — M0 verified layouts are contiguous).

import Foundation
import MLX

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
    // quantization
    public var qBits = 4
    public var qGroup = 64
    public var ngramQGroup = 32

    public var rotaryDim: Int { Int(Float(headDim) * partialRotaryFactor) }
    public var pleLayerIndices: [Int] { pleLayerIds.map { $0 - 1 } }

    public static func load(from dir: URL) throws -> ModelConfig {
        let data = try Data(contentsOf: dir.appendingPathComponent("config.json"))
        let root = try JSONSerialization.jsonObject(with: data) as! [String: Any]
        let t = root["text_config"] as! [String: Any]
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
        return c
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
        case "U8", "I8": return 1
        default: fatalError("dtype \(dtype)")
        }
    }
    /// Bytes per leading-axis row (shape[1:] product × itemSize).
    public var rowBytes: Int {
        shape.dropFirst().reduce(itemSize, *)
    }
}

/// Parses every shard header once; provides absolute (file, offset) for any tensor.
public final class CheckpointIndex {
    public let dir: URL
    public let config: ModelConfig
    public private(set) var tensors: [String: TensorRef] = [:]
    private var fds: [URL: Int32] = [:]
    private let fdLock = NSLock()

    public init(dir: URL) throws {
        self.dir = dir
        self.config = try ModelConfig.load(from: dir)
        let files = try FileManager.default.contentsOfDirectory(at: dir, includingPropertiesForKeys: nil)
            .filter { $0.lastPathComponent.hasPrefix("model") && $0.pathExtension == "safetensors" }
            .sorted { $0.lastPathComponent < $1.lastPathComponent }
        precondition(!files.isEmpty, "no safetensors in \(dir.path)")
        for f in files {
            try parseHeader(f)
        }
    }

    private func parseHeader(_ file: URL) throws {
        let h = try FileHandle(forReadingFrom: file)
        defer { try? h.close() }
        let lenData = try h.read(upToCount: 8)!
        let n = lenData.withUnsafeBytes { $0.load(as: UInt64.self) }
        let hdrData = try h.read(upToCount: Int(n))!
        let obj = try JSONSerialization.jsonObject(with: hdrData) as! [String: Any]
        let dataStart = 8 + Int(n)
        for (key, v) in obj {
            guard key != "__metadata__", let d = v as? [String: Any] else { continue }
            let offs = d["data_offsets"] as! [Int]
            var name = key
            if name.hasPrefix("language_model.") { name.removeFirst("language_model.".count) }
            tensors[name] = TensorRef(
                file: file,
                dtype: d["dtype"] as! String,
                shape: (d["shape"] as! [Int]),
                byteOffset: dataStart + offs[0],
                byteCount: offs[1] - offs[0]
            )
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
