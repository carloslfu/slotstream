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
    public var maxPositionEmbeddings = ContextPolicy.modelLimit
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
    /// Validated module overrides. The deployed adapter still admits only its
    /// qualified affine layout; descriptors do not grant pack eligibility.
    public private(set) var quantizationOverrides: [String: AffineQuantization] = [:]
    /// Set only by an authenticated internal adapter. Public checkpoint
    /// loading retains the original geometry and artifact admission rules.
    package private(set) var admittedExpertRecordBytes = 2_764_800

    public func affineQuantization(for module: String) throws -> AffineQuantization {
        if let descriptor = quantizationOverrides[module] { return descriptor }
        return try AffineQuantization(bits: qBits,
            groupSize: module.contains("ngram_embedding") ? ngramQGroup : qGroup)
    }

    /// Internal adapters supply already validated per-module recipes. This
    /// does not change the public checkpoint parser's artifact admission.
    package func withAffineOverrides(_ overrides: [String: AffineQuantization]) -> ModelConfig {
        var copy = self
        copy.quantizationOverrides.merge(overrides) { _, replacement in replacement }
        return copy
    }

    package func withAffineExpertControl() throws -> ModelConfig {
        var copy = self
        let descriptor = try AffineQuantization(bits: 3, groupSize: 64)
        for layer in 0..<numLayers {
            for projection in ["gate_proj", "up_proj", "down_proj"] {
                copy.quantizationOverrides["model.layers.\(layer).mlp.switch_mlp.\(projection)"] = descriptor
            }
        }
        copy.admittedExpertRecordBytes = 2_150_400
        return copy
    }

    public var rotaryDim: Int { Int(Float(headDim) * partialRotaryFactor) }
    public var pleLayerIndices: [Int] { pleLayerIds.map { $0 - 1 } }

    public static func load(from dir: URL) throws -> ModelConfig {
        let path = dir.appendingPathComponent("config.json")
        let data = try Data(contentsOf: path)
        return try parse(data, label: path.path)
    }

    /// Shared geometry parser. Experimental artifact adapters may pass only
    /// their authenticated text configuration, then apply their own explicit
    /// quantization profile. The public checkpoint loader retains every pack
    /// admission check below.
    package static func parse(_ data: Data, label: String) throws -> ModelConfig {
        guard let root = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            throw ModelError("\(label) is not valid JSON — re-run `slotstream pull`")
        }
        guard let t = root["text_config"] as? [String: Any] else {
            throw ModelError(
                "\(label) has no `text_config` section, so it is not a "
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
        c.maxPositionEmbeddings = i("max_position_embeddings", c.maxPositionEmbeddings)
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
        guard root["quantization"] == nil || root["quantization"] is [String: Any] else {
            throw ModelError("quantization must be a descriptor object")
        }
        if let q = root["quantization"] as? [String: Any] {
            guard q["mode"] == nil || q["mode"] as? String == "affine" else {
                throw ModelError("the installed engine does not support this quantization mode")
            }
            func integer(_ value: Any?, fallback: Int? = nil) throws -> Int {
                guard let value else {
                    if let fallback { return fallback }
                    throw ModelError("quantization descriptor lacks an integer")
                }
                guard let number = value as? NSNumber,
                      CFGetTypeID(number) != CFBooleanGetTypeID(),
                      let result = value as? Int else {
                    throw ModelError("quantization descriptor requires integral numeric fields")
                }
                return result
            }
            c.qBits = try integer(q["bits"], fallback: c.qBits)
            c.qGroup = try integer(q["group_size"], fallback: c.qGroup)
            // Validate every override, not the first n-gram shard found in an
            // unordered dictionary. A mixed/corrupt file must not inherit an
            // unrelated module's packing and reach a GPU matrix operation.
            for (k, v) in q {
                if ["bits", "group_size", "mode"].contains(k) { continue }
                guard let d = v as? [String: Any],
                      d["mode"] == nil || d["mode"] as? String == "affine" else {
                    throw ModelError("invalid quantization descriptor for \(k)")
                }
                let bits = try integer(d["bits"]), group = try integer(d["group_size"])
                let name = k.hasPrefix("language_model.") ? String(k.dropFirst("language_model.".count)) : k
                guard c.quantizationOverrides[name] == nil else { throw ModelError("duplicate quantization descriptor for \(name)") }
                let descriptor = try AffineQuantization(bits: bits, groupSize: group)
                let expectedGroup = name.contains("ngram_embedding") ? 32 : 64
                guard bits == 4, group == expectedGroup else {
                    throw ModelError("unqualified quantization layout for \(name); the installed adapter requires affine 4-bit")
                }
                c.quantizationOverrides[name] = descriptor
            }
        }
        guard root["vq_modules"] == nil, root["vq_ple"] == nil else {
            throw ModelError("VQ candidate decoding is experimental; this pack has not qualified for Engine.load")
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
        guard hiddenSize == 2560, numLayers == 48, maxPositionEmbeddings == ContextPolicy.modelLimit,
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

/// Immutable descriptor plus tensor identity. Retaining the index owns the
/// descriptor's lifetime; a worker never borrows a descriptor from a cache
/// that another request can close or reuse while its read is pending.
package struct TensorReadHandle {
    private let owner: CheckpointIndex
    private let descriptor: Int32
    private let base: Int
    private let length: Int
    private let verifiedFile: VQTensorFile?
    private let ref: TensorRef
    init(owner: CheckpointIndex, descriptor: Int32, ref: TensorRef) {
        self.owner = owner; self.descriptor = descriptor; self.base = ref.byteOffset; self.length = ref.byteCount
        self.verifiedFile = nil; self.ref = ref
    }
    init(owner: CheckpointIndex, verifiedFile: VQTensorFile, ref: TensorRef) {
        self.owner = owner; self.descriptor = -1; self.base = ref.byteOffset; self.length = ref.byteCount
        self.verifiedFile = verifiedFile; self.ref = ref
    }
    package func readChecked(into dst: UnsafeMutableRawPointer, offset: Int, count: Int,
        shouldContinue: () -> Bool = { true }) throws {
        if let verifiedFile {
            try verifiedFile.readDirect(into: dst, ref: ref, offset: offset, count: count, shouldContinue: shouldContinue)
            return
        }
        let absolute = try ExactRead.tensorOffset(base: base, length: length, offset: offset, count: count)
        try withExtendedLifetime(owner) {
            try ExactRead.transfer(into: dst, offset: absolute, count: count, shouldContinue: shouldContinue) { pointer, remaining, position in
                let got = Foundation.pread(descriptor, pointer, remaining, off_t(position))
                return .init(count: got, error: got < 0 ? errno : 0)
            }
        }
    }
    package func read(into dst: UnsafeMutableRawPointer, offset: Int, count: Int) {
        do { try readChecked(into: dst, offset: offset, count: count) }
        catch { preconditionFailure(String(describing: error)) }
    }
}

/// Parses every shard header once; provides absolute (file, offset) for any tensor.
public final class CheckpointIndex {
    public let dir: URL
    public let config: ModelConfig
    public private(set) var tensors: [String: TensorRef] = [:]
    private var fds: [URL: Int32] = [:]
    private let authenticatedFiles: [URL: VQTensorFile]
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
        self.authenticatedFiles = [:]
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

    /// Internal immutable index assembled from complete authenticated files.
    /// Every worker retains their owners; no later path open can replace the
    /// bytes that passed admission. The public initializer is unchanged.
    package init(authenticatedDirectory: URL, config: ModelConfig,
                 files: [URL: VQTensorFile], tensors: [String: TensorRef]) throws {
        guard !files.isEmpty, tensors.values.allSatisfy({ files[$0.file] != nil }) else {
            throw ModelError("authenticated checkpoint has an unowned tensor")
        }
        self.dir = authenticatedDirectory; self.config = config
        self.authenticatedFiles = files; self.tensors = tensors
        try requireExpectedTensors()
    }

    package func verifyAuthenticatedFilesUnchanged() throws {
        for file in authenticatedFiles.values { try file.verifyUnchanged() }
    }

    package var hasAuthenticatedFiles: Bool { !authenticatedFiles.isEmpty }

    /// Resident tensors use the same verified owner as streamed rows. A
    /// path-based MLX lazy mapping would reopen a file after authentication.
    /// One inspected dense tensor and its load copy fit the research loader's
    /// existing envelope; PLE tables are never admitted through this method.
    package func authenticatedArray(_ name: String, shouldContinue: () -> Bool = { true }) throws -> MLXArray {
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        guard let ref = tensors[name], let file = authenticatedFiles[ref.file],
              (1...800_000_000).contains(ref.byteCount), !name.contains("ngram_embedding.shard_") else {
            throw ModelError("authenticated resident tensor is absent or exceeds its load-copy bound")
        }
        let dtype: DType
        switch ref.dtype {
        case "U32": dtype = .uint32
        case "BF16": dtype = .bfloat16
        case "F16": dtype = .float16
        case "F32": dtype = .float32
        case "I64": dtype = .int64
        case "I32": dtype = .int32
        default: throw ModelError("unsupported authenticated resident tensor dtype")
        }
        var bytes = Data(count: ref.byteCount)
        try bytes.withUnsafeMutableBytes { destination in
            try file.readDirect(into: destination.baseAddress!, ref: ref, offset: 0, count: ref.byteCount,
                shouldContinue: shouldContinue)
        }
        let array = MLXArray(bytes, ref.shape, dtype: dtype)
        eval(array)
        try file.verifyUnchanged()
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        return array
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
        // Empty tensors may share a start with a nonempty tensor. As in the
        // reference format, place the empty range first at an equal start.
        for p in parsed.sorted(by: { ($0.start, $0.end) < ($1.start, $1.end) }) {
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
        do { return try checkedFD(for: file) }
        catch { preconditionFailure(String(describing: error)) }
    }

    package func readHandle(for ref: TensorRef) -> TensorReadHandle {
        if let file = authenticatedFiles[ref.file] {
            return TensorReadHandle(owner: self, verifiedFile: file, ref: ref)
        }
        return TensorReadHandle(owner: self, descriptor: fd(for: ref.file), ref: ref)
    }

    private func checkedFD(for file: URL) throws -> Int32 {
        if let owner = authenticatedFiles[file] { return try owner.checkedDescriptor() }
        guard authenticatedFiles.isEmpty else { throw ModelError("unbound authenticated checkpoint file") }
        fdLock.lock()
        defer { fdLock.unlock() }
        if let f = fds[file] { return f }
        var f: Int32
        repeat { f = open(file.path, O_RDONLY) } while f < 0 && errno == EINTR
        guard f >= 0 else { throw ModelError("open \(file.path) failed: \(String(cString: strerror(errno)))") }
        _ = fcntl(f, F_NOCACHE, 1)
        _ = fcntl(f, F_RDAHEAD, 0)
        fds[file] = f
        return f
    }

    /// Compatibility wrapper. A corrupt checkpoint still fails closed; it
    /// cannot return incomplete bytes as weights. Recoverable callers use
    /// preadChecked and publish their destination only after it succeeds.
    public func pread(into dst: UnsafeMutableRawPointer, _ r: TensorRef, offset: Int, count: Int) {
        do { try preadChecked(into: dst, r, offset: offset, count: count) }
        catch { preconditionFailure(String(describing: error)) }
    }

    /// Read within one tensor. Positive short reads and EINTR are handled;
    /// EOF, syscall errors and cancellation never publish a partial record.
    public func preadChecked(into dst: UnsafeMutableRawPointer, _ r: TensorRef,
        offset: Int, count: Int, shouldContinue: () -> Bool = { true }) throws {
        if let file = authenticatedFiles[r.file] {
            try file.readDirect(into: dst, ref: r, offset: offset, count: count, shouldContinue: shouldContinue)
            return
        }
        let absolute = try ExactRead.tensorOffset(base: r.byteOffset, length: r.byteCount, offset: offset, count: count)
        if count == 0 { return }
        let f = try checkedFD(for: r.file)
        try ExactRead.transfer(into: dst, offset: absolute, count: count,
            shouldContinue: shouldContinue) { pointer, remaining, absolute in
                let got = Foundation.pread(f, pointer, remaining, off_t(absolute))
                return ExactRead.Outcome(count: got, error: got < 0 ? errno : 0)
            }
    }
}
