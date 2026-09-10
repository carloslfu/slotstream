---
type: run
id: 01m1ssrd5ck6zcg1tfftkmcmzv
created: 2026-09-05T22:06:52.075941+00:00
updated: 2026-09-05T22:06:52.344251+00:00
summary: Optimization broader alternatives and optional batching source audit
binary: none; source hashes preserved
captured_at: 2026-09-05
command: bounded local source read and geometry arithmetic; no runtime benchmark
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Optimization broader alternatives and optional batching source audit
tool: source inspection and exact integer arithmetic
---
# First-principles broader alternatives and optional batching disposition

This is a source/math audit, not a runtime benchmark. The checked arithmetic uses the exact curated geometry validated by `ModelConfig`:48layers,E512/Top10,H2560,M640,group64/four-bit weights with two BF16 scale/bias values per group. A fully BF16 expert needs9,830,400bytes versus2,764,800packed bytes; the same640-slot weight budget holds180BF16 experts. Dequantizing hot experts must therefore beat both conversion cost and lost residency; it is not a free faster kernel. No such gain is measured here.

The lookup embedding is separate from `lm_head`: `ResidentWeights.embed` gathers rows of `model.embed_tokens`, while `Model` constructs its dense output projection from `lm_head`. Lookup storage could therefore be streamed without re-reading the dense output projection. Its packed payload is357,580,800bytes. An8192-row packed cache would hold11,796,480payload bytes, leaving a theoretical345,784,320byte difference, equivalent to125whole quantized expert records before I/O buffers, allocator overhead, and fixed-total-memory validation. This raises bounded lookup-row caching to a concrete conditional followup; it does not claim an implementation, usable planner credit or speed gain. It needs checked read/error propagation through both main and MTP paths, exact gathered/dequantized row tests, public tensor-access compatibility, and both fixed-pool memory and fixed-total-memory request evidence. Do not grant this capacity in the planner from payload arithmetic alone.

OPT31 optional continuous batching is deferred under its explicit demand prerequisite. `Engine.generate` measures queueSeconds and holds one GenerationGate around a request; metadata snapshots do not take that gate, and the accept loop refuses saturated connections rather than waiting. The tensor MoE/GDN primitives expose a batch dimension, but `Model.State` has one tokenCount/ngramCtx, cache offsets and one MTP lineage; concatenating clients into the token dimension would cross-contaminate recurrent and attention history. A valid scheduler would need independently addressable states, lengths, masks, RNG streams, cancellation and draft rollback plus joint expert pin ownership. Existing single-request timing evidence establishes no product multi-client queue bottleneck. Revisit after representative queued-client traces show material waiting attributable to serialized inference, then freeze aggregate throughput, per-client p95 latency/fairness, cancellation and memory criteria before prototyping. A uniform independent-routing calculation below is an illustrative assumption only: real correlated router traces, not this formula, must determine shared-read opportunity. Fixed GDN capacity is additive across active clients and may displace the expert cache that makes individual tokens fast.

The optional broader alternatives remain explicit, not falsely implemented: lower bits/Top-K/pruning/model replacement and reduced image resolution change model/input quality; quantized GDN/KV needs a separate long-context numerical contract; lossless compression needs representative entropy plus codec/read measurements; cross-layer prediction needs prospective useful-byte versus wasted-byte utility; another draft/tree needs acceptance-cost and memory evidence beyond the failed timing-adaptive candidate; hardware/SSD alternatives require the actual hardware; spill needs total frontier I/O/custody/accounting and failure cleanup; full language/backend rewrites need a measured bottleneck that targeted changes cannot remove; energy needs measured joules rather than elapsed-time inference; hosting/download work needs cold-install demand evidence. Existing V77–V87 records already reject the measured hashing/repack/read-ahead/slot-write variants at their frozen speed gates. Stable direct-write arenas remain a distinct lifetime-sensitive candidate, with the measured current staging allocation cost too small by itself to justify an arena rewrite. The current Metal custom-kernel backend allocates new outputs; it is not an in-place arena API.

Source-level fork audit: pinned MLX Contiguous checks both layout and backing allocation size; it copies when the backing allocation exceeds logical output bytes by more than16,384bytes. Thus the small window compaction used by prefix forks actually sheds large activation backing, although it may retain at most that allowed overhang per contiguous window. MLX donation requires unique array descriptor and data ownership. This supports the independent-context/COW contract; it does not prove performance for a new direct-write primitive.

## Exact computed arithmetic

```json
{
  "assumptions": {
    "hidden": 2560,
    "expert_intermediate": 640,
    "experts_per_layer": 512,
    "top_k": 10,
    "vocab": 248320,
    "bits": 4,
    "group": 64,
    "scale_and_bias_bytes_per_group": 4,
    "BF16_bytes": 2
  },
  "expert_elements": 4915200,
  "quantized_expert_bytes": 2764800,
  "BF16_expert_bytes": 9830400,
  "BF16_over_quantized_capacity_ratio": 3.5555555555555554,
  "BF16_experts_at_same_640_slot_weight_budget": 180,
  "separate_lookup_embedding_bytes": 357580800,
  "packed_embedding_row_cache_8192_payload_bytes": 11796480,
  "potential_embedding_payload_saving_excluding_allocator_IO_overheads": 345784320,
  "potential_quantized_expert_slots_from_embedding_payload_only": 125,
  "independent_uniform_routing_only_not_observed": [
    {
      "independent_states": 1,
      "expected_distinct_experts_one_layer": 10.0,
      "unshared_selection_count": 10,
      "fixed_GDN_bytes": 113246208
    },
    {
      "independent_states": 2,
      "expected_distinct_experts_one_layer": 19.8046875,
      "unshared_selection_count": 20,
      "fixed_GDN_bytes": 226492416
    },
    {
      "independent_states": 4,
      "expected_distinct_experts_one_layer": 38.84330928325653,
      "unshared_selection_count": 40,
      "fixed_GDN_bytes": 452984832
    },
    {
      "independent_states": 8,
      "expected_distinct_experts_one_layer": 74.7397383398046,
      "unshared_selection_count": 80,
      "fixed_GDN_bytes": 905969664
    },
    {
      "independent_states": 16,
      "expected_distinct_experts_one_layer": 138.56926479073724,
      "unshared_selection_count": 160,
      "fixed_GDN_bytes": 1811939328
    }
  ]
}
```

## Sources/Slotstream/Checkpoint.swift

SHA-256 `8e47ab4bc395ebddc766d3a0e7fed5259457b76233f9bc404da1a0cb87370101`; 26546bytes.

````
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

/// Immutable descriptor plus tensor identity. Retaining the index owns the
/// descriptor's lifetime; a worker never borrows a descriptor from a cache
/// that another request can close or reuse while its read is pending.
package struct TensorReadHandle {
    private let owner: CheckpointIndex
    private let descriptor: Int32
    private let base: Int
    private let length: Int
    init(owner: CheckpointIndex, descriptor: Int32, ref: TensorRef) {
        self.owner = owner; self.descriptor = descriptor; self.base = ref.byteOffset; self.length = ref.byteCount
    }
    package func readChecked(into dst: UnsafeMutableRawPointer, offset: Int, count: Int,
        shouldContinue: () -> Bool = { true }) throws {
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
        do { return try checkedFD(for: file) }
        catch { preconditionFailure(String(describing: error)) }
    }

    package func readHandle(for ref: TensorRef) -> TensorReadHandle {
        TensorReadHandle(owner: self, descriptor: fd(for: ref.file), ref: ref)
    }

    private func checkedFD(for file: URL) throws -> Int32 {
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

````

## Sources/Slotstream/Weights.swift

SHA-256 `9c39e66cc09f225305128b1db0bed7de597bfabea33755e2ec43f972b63080cd`; 4251bytes.

````
// Resident weight loading and the quantized-linear primitive.
//
// Residents = everything except routed experts (switch_mlp) and the n-gram
// store shards; ~3.8 GB at 4-bit, loaded whole via MLX's safetensors reader.

import Foundation
import MLX

/// A linear layer read from the checkpoint: quantized (weight+scales+biases)
/// or plain bf16, decided by whether `<name>.scales` exists.
public struct QLinear {
    public let w: MLXArray
    public let scales: MLXArray?
    public let biases: MLXArray?
    public let groupSize: Int
    public let bits: Int

    public var isQuantized: Bool { scales != nil }

    public func callAsFunction(_ x: MLXArray) -> MLXArray {
        if let s = scales {
            return quantizedMM(
                x, w, scales: s, biases: biases, transpose: true,
                groupSize: groupSize, bits: bits)
        }
        return matmul(x, w.transposed())
    }
}

/// Anything that can hand out named tensors from a checkpoint: the resident
/// trunk (ResidentWeights) or the MTP block's own file (MTPWeights). Layer
/// blocks are built against this so the MTP head can reuse them verbatim.
public protocol TensorSource: AnyObject {
    var config: ModelConfig { get }
    func optionalTensor(_ name: String) -> MLXArray?
}

extension TensorSource {
    public func has(_ name: String) -> Bool { optionalTensor(name) != nil }

    public func tensor(_ name: String) -> MLXArray {
        guard let a = optionalTensor(name) else { fatalError("missing tensor \(name)") }
        return a
    }

    public func linear(_ base: String, groupSize: Int? = nil, bits: Int? = nil) -> QLinear {
        let w = tensor(base + ".weight")
        let s = optionalTensor(base + ".scales")
        let b = optionalTensor(base + ".biases")
        return QLinear(
            w: w, scales: s, biases: b,
            groupSize: groupSize ?? config.qGroup, bits: bits ?? config.qBits)
    }
}

public final class ResidentWeights: TensorSource {
    public let arrays: [String: MLXArray]
    public let config: ModelConfig

    public init(index: CheckpointIndex, includeLayerExperts: Set<Int> = []) throws {
        // Golden/debug commands can load the multi-GB resident trunk without
        // constructing Qwen4ExpModel. They need the same cross-process guard as
        // run/serve or they can silently stack underneath another model.
        try ModelProcessGuard.acquire()
        self.config = index.config
        var kept: [String: MLXArray] = [:]
        let files = Set(index.tensors.values.map { $0.file })
        for f in files.sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
            let all = try loadArrays(url: f)
            for (rawKey, arr) in all {
                var key = rawKey
                if key.hasPrefix("language_model.") { key.removeFirst("language_model.".count) }
                if key.hasPrefix("mtp.") || key.hasPrefix("vision_tower.") || key.hasPrefix("model.visual.") {
                    continue
                }
                if key.contains("ngram_embedding.shard_") { continue }
                if key.contains(".switch_mlp.") {
                    // routed experts stay on SSD unless explicitly requested (parity rig)
                    let isWanted = includeLayerExperts.contains { key.contains("model.layers.\($0).mlp.switch_mlp.") }
                    if !isWanted { continue }
                }
                kept[key] = arr
            }
        }
        // Materialize just the kept set.
        eval(Array(kept.values))
        self.arrays = kept
    }

    public func optionalTensor(_ name: String) -> MLXArray? { arrays[name] }

    /// Dequantized embedding rows for token ids: (B, S) -> (B, S, hidden).
    public func embed(_ ids: MLXArray) -> MLXArray {
        let w = tensor("model.embed_tokens.weight")
        guard let s = arrays["model.embed_tokens.scales"] else {
            return take(w, ids, axis: 0)
        }
        let b = arrays["model.embed_tokens.biases"]
        let rows = take(w, ids, axis: 0)
        let rs = take(s, ids, axis: 0)
        let rb = b.map { take($0, ids, axis: 0) }
        return dequantized(
            rows, scales: rs, biases: rb, groupSize: config.qGroup, bits: config.qBits)
    }
}

````

## Sources/Slotstream/Model.swift

SHA-256 `92beba95294f167c919f5599410a423e16cf3ddc3a6e1cb5d83cab9cee0c0e5a`; 40424bytes.

````
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
    public var optimizations: InferenceOptimizations
    public var sharedExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.sharedPrelaunches } }
    public var indexerSpecializedRows: Int { qsa.values.reduce(0) { $0 + $1.indexer.specializedRows } }
    private var routerCacheConfigured = false
    public var cachedRouterBytes: Int {
        moe.values.reduce(0) { $0 + $1.routerProjection.cachedBytes }
            + (mtpHead?.moe.routerProjection.cachedBytes ?? 0)
    }

    /// Request entry calls this before a cached MTP draft can advance. Direct
    /// model callers also prepare before touching main recurrent state.
    public var compiledNormFinishes: Int {
        (attnHC + mlpHC + [mixer]).reduce(0) { $0 + $1.compiledFinishes }
    }
    public var readHandleCount: Int { pool.readHandleCount + ngram.readHandleCount }
    public var selectedAttentionTiles: Int {
        qsa.values.reduce(0) { $0 + $1.selectedAttentionTiles } + (mtpHead?.attn.selectedAttentionTiles ?? 0)
    }
    public private(set) var terminalQueryRowsSkipped = 0
    public private(set) var terminalMoERowsSkipped = 0
    private enum HiddenDemand { case fullMulti, stateOnly, lastRow }
    private var compiledNormConfigured = false
    func prepareOptimizationKernels() {
        let selected = optimizations.selectedTextAttention && SelectedAttention.prepare()
        for layer in qsa.values { layer.selectedAttention = selected }
        mtpHead?.attn.selectedAttention = selected
        pool.directReadHandles = optimizations.directReadHandles
        ngram.directReadHandles = optimizations.directReadHandles
        let compiledNorm = optimizations.compiledNormFinish && CompiledArithmetic.prepare()
        if compiledNorm != compiledNormConfigured {
            for unit in attnHC + mlpHC + [mixer] { unit.compiledNormFinish = compiledNorm }
            compiledNormConfigured = compiledNorm
        }
        mtpHead?.attnHC.compiledNormFinish = compiledNorm
        mtpHead?.mlpHC.compiledNormFinish = compiledNorm
        mtpHead?.mixer.compiledNormFinish = compiledNorm
        ngram.ringEvictionOrder = optimizations.ngramRingOrder
        pool.denseLookup = optimizations.denseExpertLookup
        pool.sparsePinClearing = optimizations.sparsePoolPins
        pool.contiguousSlotWrites = optimizations.contiguousSlotWrites
        pool.wordSlotWrites = optimizations.wordSlotWrites
        pool.layerLocalFloorEviction = optimizations.layerLocalFloorCache
        if routerCacheConfigured != optimizations.cachedRouterWeights {
            for layer in moe.values { layer.routerProjection.configure(cached: optimizations.cachedRouterWeights) }
            routerCacheConfigured = optimizations.cachedRouterWeights
        }
        mtpHead?.moe.routerProjection.configure(cached: optimizations.cachedRouterWeights)
        if optimizations.routerTopK { RouterSelection.prepare() }
        if optimizations.indexerBlockTopK { BlockSelection.prepare() }
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
    }

    let rope: Rope
    var gdn: [Int: GDNLayer] = [:]
    var qsa: [Int: QSAAttention] = [:]
    var moe: [Int: MoELayer] = [:]
    var attnHC: [GatedResidual] = []
    var mlpHC: [GatedResidual] = []
    var ple: [Int: PLELayer] = [:]
    let mixer: GatedResidual
    let lmHead: QLinear
    /// The optional MTP draft head for self-speculative decode; loaded from
    /// mtp.safetensors on demand (`enableMTP`), everything resident.
    public private(set) var mtpHead: MTPHead? = nil
    /// Diagnostic observer; called on the serialized model thread with router-rank IDs.
    public var routerObserver: ((Int, [Int32]) -> Void)?
    package var gdnPhaseProfile: GDNPhaseProfile? {
        didSet { for layer in gdn.values { layer.phaseProfile = gdnPhaseProfile } }
    }
    public let runLayers: Int  // truncated for parity rigs; numLayers normally

    public final class State {
        var linear: [Int: LinearCache] = [:]
        var kv: [Int: KVCache] = [:]
        var indexer: [Int: IndexerCache] = [:]
        var ngramCtx: [Int64] = []
        public var tokenCount = 0
        /// Speculative-decode companions, created lazily by the MTP-aware
        /// generate path: the draft head's own attention state, and the
        /// pre-mixer multi stream at the last consumed position (the next
        /// draft step's hidden input). They ride the prefix cache with the
        /// rest of the state so conversations keep their draft context.
        public var mtp: MTPState?
        public var lastMulti: MLXArray?
        /// A draft pointer alone is insufficient: plain inference may have
        /// advanced the main prefix since the draft cache was last updated.
        public var hasValidMTP: Bool {
            guard let row = lastMulti, row.ndim == 3, row.dim(0) == 1, row.dim(1) == 1 else { return false }
            return mtp?.isAligned(withConsumedTokens: tokenCount) == true
        }
        public func invalidateMTP() { mtp = nil; lastMulti = nil }
        /// Allocated sequence buffers, including unused capacity after trim.
        /// Recurrent state, convolution windows and allocator cache are separate.
        public var allocatedSequenceBytes: Int {
            kv.values.reduce(0) { $0 + $1.allocatedBytes }
                + indexer.values.reduce(0) { $0 + $1.allocatedBytes }
                + (mtp.map { $0.kv.allocatedBytes + $0.indexer.allocatedBytes } ?? 0)
        }
        var compactStateWindows = false
        public init() {}
    }

    public init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil) throws {
        self.optimizations = try InferenceOptimizations.environment()
        try ModelProcessGuard.acquire()
        self.cfg = index.config
        let selectedLayers = runLayers ?? index.config.numLayers
        guard selectedLayers >= 1, selectedLayers <= index.config.numLayers else {
            throw ModelError(
                "layer count must be between 1 and \(index.config.numLayers), got \(selectedLayers)")
        }
        guard poolSlots >= 1, poolSlots <= Geometry.totalRecords else {
            throw ModelError(
                "expert-pool slot count must be between 1 and \(Geometry.totalRecords), got \(poolSlots)")
        }
        self.runLayers = selectedLayers
        let store = try ExpertStore(index: index)
        // Reject a wrong/custom checkpoint before allocating the 3.8 GB
        // resident trunk or the expert pool.
        try Geometry.check(against: index.config, recordBytes: store.recordBytes)
        // Explicit experimental startup path: full-file verification precedes
        // resident/pool allocation. Default construction needs no repack.
        if let path = ProcessInfo.processInfo.environment["SLOTSTREAM_EXPERT_LAYOUT"] {
            guard !path.isEmpty else { throw ModelError("SLOTSTREAM_EXPERT_LAYOUT must name a packed artifact directory") }
            let report = try store.loadPackedLayout(at:URL(fileURLWithPath:path,isDirectory:true))
            fputs("[expert-layout] verified \(report.bytes) bytes in \(report.seconds) s\n",stderr)
        }
        // parity rigs keep the truncated layers' experts resident? no — pool serves them
        self.resident = try ResidentWeights(index: index)
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
        if Self.debugDir != nil { attnHC[0].debugName = "hc0" }
        mixer = GatedResidual(resident, base: "model.hyper_connection_mixer", useCombine: false)
        lmHead = resident.linear("lm_head")
    }

    /// The model's rotary embedding (the MTP head shares it).
    public var sharedRope: Rope { rope }

    /// lm_head applied to a draft-head sample hidden — the draft's logits.
    public func draftLogits(_ sample: MLXArray) -> MLXArray { lmHead(sample) }

    /// Load the MTP draft head (1.5 GB resident). Idempotent; throws when
    /// mtp.safetensors is absent.
    public func enableMTP(modelDir: URL) throws {
        guard mtpHead == nil else { return }
        mtpHead = MTPHead(try MTPWeights(modelDir: modelDir, config: cfg))
    }

    /// Conservative capacity needed before a request grows its sequence
    /// caches. Charges allocation steps, completed-block storage and the draft
    /// head when it may be used; it performs no allocation or GPU evaluation.
    public func sequenceCapacityBytes(tokens: Int, mtp: Bool) -> Int {
        let n = max(0, tokens)
        let layers = cfg.layerTypes.prefix(runLayers).filter { $0 != "linear_attention" }.count + (mtp ? 1 : 0)
        let rowBytes = (2 * cfg.numKVHeads * cfg.headDim + cfg.indexerHeadDim) * 2
        let safePerToken = max(1, layers * (rowBytes + cfg.indexerHeadDim * 2))
        guard n <= Int.max / safePerToken - 1024 else { return Int.max }
        let capacity = ((n + 1023) / 1024) * 1024
        let pooled = optimizations.incrementalIndexer && n > cfg.indexerBudget
            ? ((n / cfg.indexerCompressRatio + 255) / 256) * 256 * cfg.indexerHeadDim * 2 : 0
        return layers * (capacity * rowBytes + pooled)
    }

    public func makeState() -> State {
        let s = State()
        s.ngramCtx = Array(repeating: Int64(cfg.eosTokenId), count: cfg.ngramSize - 1)
        for l in 0 ..< runLayers {
            if cfg.layerTypes[l] == "linear_attention" {
                s.linear[l] = LinearCache()
            } else {
                s.kv[l] = KVCache()
                s.indexer[l] = IndexerCache(compactRaw: optimizations.compactIndexerRaw)
            }
        }
        return s
    }

    /// One forward pass over `ids` (1, S). Returns final hidden (1, S, hidden).
    /// `perLayerHook` (parity rigs) receives the hyper-width h after each layer.
    /// Read once: ProcessInfo builds a fresh dictionary on every access, and
    /// this used to run 48 times per token.
    static let debugDir = ProcessInfo.processInfo.environment["SS_DEBUG_DIR"]
    static let debugLayer = Int(ProcessInfo.processInfo.environment["SS_DEBUG_LAYER"] ?? "0") ?? 0

    static func debugDump(_ name: String, _ arr: MLXArray) {
        guard let dir = debugDir else { return }
        let v = arr.asType(.float32).asArray(Float.self)
        let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
        try? d.write(to: URL(fileURLWithPath: dir).appendingPathComponent(name + ".bin"))
    }

    /// Replace the embeddings under each placeholder run with the tower's rows.
    ///
    /// The template expands one `<|image_pad|>` per image into a run of them,
    /// so what has to happen is a substitution of contiguous spans — which is
    /// what this does, entirely on the GPU. The first version copied the whole
    /// hidden to the CPU as float32, looped over `S × hidden` scalars, and
    /// uploaded it again, on every prefill pass of every vision request. It
    /// also scanned the ids for placeholders and, when the count disagreed with
    /// the rows it was given, logged a line and continued with unspliced
    /// placeholder embeddings — a silently wrong answer. A run carries its own
    /// rows, so the two cannot disagree; a wrong offset is a programming error
    /// and stops here.
    public static func spliceVision(
        _ h: MLXArray, runs: [VisionRun], length S: Int, hidden: Int
    ) -> MLXArray {
        var pieces: [MLXArray] = []
        var cursor = 0
        for run in runs.sorted(by: { $0.start < $1.start }) {
            precondition(
                run.start >= cursor && run.end <= S,
                "vision run \(run.start)..<\(run.end) outside 0..<\(S) or overlapping")
            if run.start > cursor { pieces.append(h[0..., cursor ..< run.start, 0...]) }
            pieces.append(run.rows.reshaped([1, run.count, hidden]).asType(h.dtype))
            cursor = run.end
        }
        if cursor < S { pieces.append(h[0..., cursor ..< S, 0...]) }
        return pieces.count == 1 ? pieces[0] : concatenated(pieces, axis: 1)
    }

    public func hiddenStates(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) -> MLXArray {
        checkpointCompatibility { try hiddenStatesChecked(ids, state: state, vision: vision, perLayerHook: perLayerHook) }
    }

    /// A read error may leave this caller-owned state partially advanced.
    /// Discard it or restore a prior checkpoint before any reuse. Generator
    /// performs that cleanup for its checked forward calls.
    public func hiddenStatesChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        let h = try hiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)
        return mixScope(h)
    }

    private func hiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        try runHiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)!
    }

    private func runHiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil,
        computeRanges: [Range<Int>]? = nil, shouldContinue: (() -> Bool)? = nil,
        demand: HiddenDemand = .fullMulti
    ) throws -> MLXArray? {
        let S = ids.count
        let ranges = computeRanges ?? stride(from: 0, to: S, by: 4096).map { $0 ..< min(S, $0 + 4096) }
        let layerMajor = optimizations.layerExpertWorkspace && ranges.count > 1
        // Public full-output APIs, MTP and truncated diagnostic models retain
        // all rows. The pinned final layer is QSA; no recurrent update is
        // inferred from a configuration label or omitted for another family.
        let terminalPruning = optimizations.terminalPrefillPruning && mtpHead == nil
            && runLayers == cfg.numLayers && qsa[runLayers - 1] != nil
            && perLayerHook == nil && demand != .fullMulti
        if layerMajor {
            precondition(optimizations.compactStateWindows && optimizations.boundedIndexer && optimizations.boundedPLE
                && !state.linear.values.contains(where: { $0.record }),
                "a larger layer workspace requires bounded state, indexer, PLE and a non-recording prefill")
        }
        prepareOptimizationKernels()
        pool.workspacePiecewiseWrites = optimizations.workspacePiecewiseWrites
        state.compactStateWindows = optimizations.compactStateWindows
        ngram.compactRows = optimizations.compactNgramRows
        rope.sharedTables = optimizations.sharedRoPE
        mtpHead?.attn.indexer.incrementalBlocks = optimizations.incrementalIndexer
        mtpHead?.attn.boundedIndexer = optimizations.boundedIndexer
        mtpHead?.attn.indexer.denseBypass = optimizations.denseIndexerBypass
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        let idArr = MLXArray(ids.map { Int32($0) }, [1, S])
        var h0 = resident.embed(idArr).asType(.bfloat16)
        if !vision.isEmpty { h0 = Self.spliceVision(h0, runs: vision, length: S, hidden: cfg.hiddenSize) }
        Self.debugDump("embed", h0)
        var h = tiled(h0, repetitions: [1, 1, cfg.hcCount])

        // n-gram history: rolling context + new ids
        let history = state.ngramCtx + ids.map { Int64($0) }
        state.ngramCtx = Array(history.suffix(cfg.ngramSize - 1))
        let lookahead = optimizations.ngramLookahead && S >= 16 && runLayers > ngram.pleLayerIndex
            ? try ngram.beginPrefetch(history:history,nNew:S,maxTokens:optimizations.boundedPLE || layerMajor ? 256 : 1024) : nil
        defer { if let lookahead { ngram.discardPrefetch(lookahead) } }

        for l in 0 ..< runLayers {
            if shouldContinue?() == false { return nil }
            if MemTrace.on { MemTrace.enterLayer(l, kind: gdn[l] != nil ? "gdn" : "qsa") }
            moe[l]!.specializedRouter = optimizations.routerTopK
            moe[l]!.overlapShared = optimizations.overlapSharedExpert
            qsa[l]?.indexer.denseBypass = optimizations.denseIndexerBypass
            qsa[l]?.indexer.specializedSelector = optimizations.indexerBlockTopK
            moe[l]!.workspaceComputeRanges = layerMajor ? ranges : []
            moe[l]!.workspaceTokenTile = optimizations.workspaceTokenTile
            if terminalPruning, l == runLayers - 1, demand == .stateOnly, layerMajor {
                let historyBase = history.count - S
                for range in ranges {
                    var hidden = h[0..., range, 0...]
                    if let p = ple[l] {
                        p.boundedTokens = true
                        let begin = max(0, historyBase + range.lowerBound - (cfg.ngramSize - 1))
                        hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + range.upperBound]),
                            nNew: range.count, cache: state.linear[l])
                    }
                    let x = attnHC[l](hidden).0
                    qsa[l]!.appendKeysOnly(x, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                    if shouldContinue?() == false { return nil }
                }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            if layerMajor {
                // Preserve the established 4096-token compute shapes while
                // sharing expert reads over the whole layer frontier.
                var bases: [MLXArray] = [], inputs: [MLXArray] = [], injections: [MLXArray] = []
                let historyBase = history.count - S
                for range in ranges {
                    let (lo, hi) = (range.lowerBound, range.upperBound)
                    let begin = max(0, historyBase + lo - (cfg.ngramSize - 1))
                    let prepared = try prepareScopeAttention(layer: l, hidden: h[0..., lo ..< hi, 0...],
                        history: Array(history[begin ..< historyBase + hi]), state: state)
                    eval(prepared.base, prepared.input, prepared.injection)
                    state.linear[l]?.compactWindows()
                    if shouldContinue?() == false { return nil }
                    bases.append(prepared.base); inputs.append(prepared.input); injections.append(prepared.injection)
                }
                let base = concatenated(bases, axis: 1)
                let input = concatenated(inputs, axis: 1)
                let injection = concatenated(injections, axis: 1)
                if optimizations.compactScopeFrontier {
                    // The previous frontier and the component arrays are no
                    // longer needed after their joined values materialize.
                    // Release them before loading the full expert workspace.
                    eval(base, input, injection)
                    bases.removeAll(); inputs.removeAll(); injections.removeAll()
                    h = base
                }
                MemTrace.mark("scope-frontier", nil)
                moe[l]!.routerObserver = routerObserver
                moe[l]!.useLayerWorkspace = true
                if terminalPruning, l == runLayers - 1, demand == .lastRow {
                    moe[l]!.useLayerWorkspace = false
                    moe[l]!.workspaceComputeRanges = []
                    let output = try moe[l]!(input[0..., (S - 1)..., 0...])
                    h = base[0..., (S - 1)..., 0...] + (output.expandedDimensions(axis: -2)
                        * injection[0..., (S - 1)..., 0...].expandedDimensions(axis: -1)).reshaped([1, 1, cfg.hcCount * cfg.hiddenSize])
                    terminalMoERowsSkipped += S - 1
                } else {
                    let output = try moe[l]!(input)
                    h = base + (output.expandedDimensions(axis: -2)
                        * injection.expandedDimensions(axis: -1)).reshaped(base.shape)
                }
                eval(h)
                MemTrace.mark("layer-end", h)
                perLayerHook?(l, h)
                continue
            }
            if let p = ple[l] {
                p.boundedTokens = optimizations.boundedPLE
                h = try h + p(h, history: history, nNew: S, cache: state.linear[l] ?? nil)
                MemTrace.mark("ple", h)
            }
            let dbgLayer = Self.debugLayer
            let (x1, inj1) = attnHC[l](h)
            if l == dbgLayer { Self.debugDump("x1", x1); Self.debugDump("inj1", inj1!) }
            MemTrace.mark("hc1", x1)
            if terminalPruning, l == runLayers - 1, demand == .stateOnly {
                qsa[l]!.appendKeysOnly(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                if shouldContinue?() == false { return nil }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            let attnOut: MLXArray
            if let g = gdn[l] {
                g.fusedRecording = optimizations.fusedGDNRecording
                attnOut = g(x1, cache: state.linear[l])
            } else {
                qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
                qsa[l]!.boundedIndexer = optimizations.boundedIndexer
                attnOut = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
            }
            MemTrace.mark("attn", attnOut)
            if l == dbgLayer { Self.debugDump("attn", attnOut) }
            h = h + (attnOut.expandedDimensions(axis: -2) * inj1!.expandedDimensions(axis: -1))
                .reshaped(h.shape)
            if l == dbgLayer { Self.debugDump("hAfterAttn", h) }

            let pruneLastMoE = terminalPruning && l == runLayers - 1 && demand == .lastRow
            let (fullMLPInput, fullMLPInjection) = mlpHC[l](h)
            let x2 = pruneLastMoE ? fullMLPInput[0..., (S - 1)..., 0...] : fullMLPInput
            let inj2 = pruneLastMoE ? fullMLPInjection![0..., (S - 1)..., 0...] : fullMLPInjection
            if pruneLastMoE {
                h = h[0..., (S - 1)..., 0...]
                terminalMoERowsSkipped += S - 1
            }
            if l == dbgLayer { Self.debugDump("x2", x2) }
            MemTrace.mark("hc2", x2)
            moe[l]!.routerObserver = routerObserver
            moe[l]!.useLayerWorkspace = optimizations.layerExpertWorkspace
            moe[l]!.disjointOutput = optimizations.disjointSweepOutput
            moe[l]!.boundedRows = optimizations.boundedSweepRows
            let moeOut = try moe[l]!(x2)
            if l == dbgLayer { Self.debugDump("moe", moeOut) }
            MemTrace.mark("moe", moeOut)
            h = h + (moeOut.expandedDimensions(axis: -2) * inj2!.expandedDimensions(axis: -1))
                .reshaped(h.shape)

            // synchronize the layer so pool references release before the next
            // layer's ensure() scatters (keeps slot writes in place, see PLAN §4.2)
            eval(h)
            // The layer has finished reading the convolution parent. Compact
            // only multi-token passes; a one-token decode parent is bounded
            // to the small convolution window plus one row already.
            if optimizations.compactStateWindows, S > 1 {
                state.linear[l]?.compactWindows()
            }
            MemTrace.mark("layer-end", h)
            perLayerHook?(l, h)
        }
        if shouldContinue?() == false { return nil }
        state.tokenCount += S
        return h
    }

    private func mixScope(_ h: MLXArray, computeRanges: [Range<Int>]? = nil) -> MLXArray {
        let ranges = computeRanges ?? stride(from: 0, to: h.dim(1), by: 4096).map { $0 ..< min(h.dim(1), $0 + 4096) }
        guard optimizations.layerExpertWorkspace, ranges.count > 1 else { return mixer(h).0 }
        var outputs: [MLXArray] = []
        for range in ranges {
            let mixed = mixer(h[0..., range, 0...]).0
            eval(mixed); outputs.append(mixed)
        }
        return concatenated(outputs, axis: 1)
    }

    private func prepareScopeAttention(layer l: Int, hidden: MLXArray, history: [Int64], state: State)
        throws -> (base: MLXArray, input: MLXArray, injection: MLXArray) {
        var h = hidden
        if let p = ple[l] {
            p.boundedTokens = true
            h = try h + p(h, history: history, nNew: h.dim(1), cache: state.linear[l])
        }
        let (x1, inject) = attnHC[l](h)
        let attention: MLXArray
        if let g = gdn[l] {
            g.fusedRecording = optimizations.fusedGDNRecording
            attention = g(x1, cache: state.linear[l])
        } else {
            qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
            qsa[l]!.boundedIndexer = true
            attention = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
        }
        h = h + (attention.expandedDimensions(axis: -2) * inject!.expandedDimensions(axis: -1)).reshaped(h.shape)
        let (x2, inject2) = mlpHC[l](h)
        return (h, x2, inject2!)
    }

    /// Transactional prefill: only a completed whole-model scope is reusable.
    /// The checkpoint owns old recurrent states; append-only sequence caches
    /// restore logical offsets while retaining (and charging) grown capacity.
    package func consumeReadScope(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?) -> (logits: MLXArray?, committed: Bool) {
        checkpointCompatibility {
            try consumeReadScopeChecked(ids, passes: passes, state: state, vision: vision,
                head: head, final: final, shouldContinue: shouldContinue)
        }
    }

    package func consumeReadScopeChecked(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?) throws -> (logits: MLXArray?, committed: Bool) {
        precondition(!passes.isEmpty && passes.allSatisfy { $0 > 0 } && passes.reduce(0, +) == ids.count)
        var offset = 0
        let ranges = passes.map { n -> Range<Int> in
            defer { offset += n }; return offset ..< offset + n
        }
        let checkpoint = state.checkpoint()
        var committed = false
        defer {
            if !committed { state.restore(checkpoint); state.setRecording(false) }
        }
        let demand: HiddenDemand = head != nil ? .fullMulti
            : final ? .lastRow : optimizations.demandedPrefillOutput ? .stateOnly : .fullMulti
        guard let multi = try runHiddenMulti(ids, state: state, vision: vision,
            computeRanges: ranges, shouldContinue: shouldContinue, demand: demand) else { return (nil, false) }
        if let head {
            for range in ranges {
                if shouldContinue?() == false { return (nil, false) }
                state.lastMulti = head.consume(chunk: Array(ids[range]),
                    chunkMulti: multi[0..., range, 0...], prevMulti: state.lastMulti,
                    resident: resident, rope: rope, state: state.mtp!,
                    vision: vision.compactMap { $0.clipped(to: range.lowerBound, range.upperBound) },
                    compactRetainedRow: optimizations.compactMTPRow)
            }
        }
        var logits: MLXArray?
        if final || !optimizations.demandedPrefillOutput {
            let mixed = mixScope(multi, computeRanges: multi.dim(1) == ids.count ? ranges : nil)
            if final { logits = lmHead(mixed[0..., (mixed.dim(1) - 1)..., 0...]); eval(logits!) }
            else { eval(mixed) }
        }
        if shouldContinue?() == false { return (nil, false) }
        committed = true
        return (logits, true)
    }

    /// All state-producing operations complete. The terminal QSA outputs,
    /// MoE and final mixer have no state needed by subsequent prompt passes.
    package func consumePrompt(_ ids: [Int], state: State, vision: [VisionRun] = []) {
        checkpointCompatibility { try consumePromptChecked(ids, state: state, vision: vision) }
    }

    package func consumePromptChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws {
        _ = try runHiddenMulti(ids, state: state, vision: vision, demand: .stateOnly)
    }

    /// Like `hiddenStates`, but also returns the pre-final-mixer multi stream
    /// (B,S,hc*H) — the hidden the MTP draft head consumes ("scheme A": the
    /// main model truly emits the pre-mixer stream on the first draft step).
    public func hiddenStatesWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (mixed: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try hiddenStatesWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func hiddenStatesWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (mixed: MLXArray, multi: MLXArray) {
        let multi = try hiddenMulti(ids, state: state, vision: vision)
        return (mixScope(multi), multi)
    }

    /// Logits for the last position only.
    public func lastLogits(_ ids: [Int], state: State, vision: [VisionRun] = []) -> MLXArray {
        checkpointCompatibility { try lastLogitsChecked(ids, state: state, vision: vision) }
    }

    public func lastLogitsChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws -> MLXArray {
        let multi = try runHiddenMulti(ids, state: state, vision: vision, demand: .lastRow)!
        let hidden = mixScope(multi)
        let last = hidden[0..., (hidden.dim(1) - 1)..., 0...]
        return lmHead(last)  // (1,1,vocab)
    }

    /// Logits at EVERY position plus the pre-mixer multi stream — the
    /// speculative verify pass needs both. S stays small (draft length + 1).
    public func allLogitsWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (logits: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try allLogitsWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func allLogitsWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (logits: MLXArray, multi: MLXArray) {
        let (mixed, multi) = try hiddenStatesWithMultiChecked(ids, state: state, vision: vision)
        return (lmHead(mixed), multi)
    }
}

/// A zero-copy snapshot of a State, for speculative-decode rollback. The
/// recurrent caches' arrays are REPLACED on every step (the GDN kernel emits
/// a fresh state_out; conv windows are re-sliced), never mutated in place, so
/// holding references is enough. KV/indexer buffers ARE written in place, but
/// only at rows past their offset — rolling the offset back is a full undo.
/// Compact main indexers additionally retain their bounded raw/pooled storage
/// here, so a cancelled long scope can undo released raw history exactly.
public struct StateCheckpoint {
    var conv: [Int: MLXArray]
    var ssm: [Int: MLXArray]
    var pleConv: [Int: MLXArray]
    var kvOffsets: [Int: Int]
    var indexerOffsets: [Int: Int]
    var indexerSnapshots: [Int: IndexerCache.Snapshot]
    var ngramCtx: [Int64]
    var tokenCount: Int
    var mtpOffset: Int
    var lastMulti: MLXArray?
}

extension Qwen4ExpModel.State {
    package func diagnosticIndexerBases() -> [String: Int] {
        Dictionary(uniqueKeysWithValues: indexer.map { ("index.\($0.key)", $0.value.rawBase) })
    }
    package var diagnosticDraftIndexerBase: Int? { mtp?.indexer.rawBase }
    /// Read-only logical state for exact continuation/ownership diagnostics.
    /// Indexer arrays expose the retained raw range, whose absolute base is
    /// available to package diagnostics. Released rows are represented by
    /// completed keys, not reconstructed or fabricated raw values.
    /// Returned arrays retain storage; release the snapshot before measuring
    /// liveness or memory. Unwritten KV capacity is deliberately excluded.
    public func diagnosticTensors() -> [String: MLXArray] {
        var result: [String: MLXArray] = [:]
        for (l, c) in linear {
            result["conv.\(l)"] = c.convState
            result["ssm.\(l)"] = c.ssmState
            result["ple.\(l)"] = c.pleConvState
        }
        for (l, c) in kv {
            result["key.\(l)"] = c.keys.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
            result["value.\(l)"] = c.values.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
        }
        for (l, c) in indexer { result["index.\(l)"] = c.diagnosticValues() }
        result["ngram"] = MLXArray(ngramCtx)
        result["tokens"] = MLXArray(Int64(tokenCount))
        result["lastMulti"] = lastMulti
        if let c = mtp {
            result["mtp.key"] = c.kv.keys.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.value"] = c.kv.values.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.index"] = c.indexer.diagnosticValues()
            result["mtp.offset"] = MLXArray(Int64(c.offset))
        }
        return result
    }

    public func checkpoint() -> StateCheckpoint {
        var conv: [Int: MLXArray] = [:]
        var ssm: [Int: MLXArray] = [:]
        var pleConv: [Int: MLXArray] = [:]
        for (l, c) in linear {
            if let a = c.convState { conv[l] = a }
            if let a = c.ssmState { ssm[l] = a }
            if let a = c.pleConvState { pleConv[l] = a }
        }
        return StateCheckpoint(
            conv: conv, ssm: ssm, pleConv: pleConv,
            kvOffsets: kv.mapValues { $0.offset },
            indexerOffsets: indexer.mapValues { $0.offset },
            indexerSnapshots: indexer.compactMapValues { $0.snapshot() },
            ngramCtx: ngramCtx, tokenCount: tokenCount,
            mtpOffset: mtp?.offset ?? 0, lastMulti: lastMulti)
    }

    /// Start or stop recording per-position recurrent states in the linear
    /// layers (speculative verify passes only).
    public func setRecording(_ on: Bool) {
        for cache in indexer.values { cache.preserveRecordingRows(on) }
        for (_, cache) in linear {
            if on { cache.record = true } else { cache.clearRecording() }
        }
    }

    /// After a recording pass over `ids` from checkpoint `c`, keep only its
    /// first `n` tokens: recurrent states become the recorded ones at
    /// position n-1, KV and indexer caches trim to the checkpoint offset
    /// plus n, and the n-gram context is rebuilt from the ids. No model
    /// compute. `n` must be at least 1 and at most ids.count; keeping all of
    /// them only clears the recording.
    public func rollback(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) {
        precondition(n >= 1 && n <= ids.count, "rollback: keep \(n) of \(ids.count)")
        if n < ids.count {
            for (_, cache) in linear {
                precondition(
                    cache.ssmStates.count == ids.count || cache.ssmStates.isEmpty,
                    "rollback: \(cache.ssmStates.count) recorded states for \(ids.count) tokens")
                if !cache.ssmStates.isEmpty { cache.ssmState = cache.ssmStates[n - 1] }
                if !cache.convStates.isEmpty { cache.convState = cache.convStates[n - 1] }
                if !cache.pleConvStates.isEmpty { cache.pleConvState = cache.pleConvStates[n - 1] }
            }
            for (l, cache) in kv { cache.trim(to: (c.kvOffsets[l] ?? 0) + n) }
            for (l, cache) in indexer { cache.trim(to: (c.indexerOffsets[l] ?? 0) + n) }
            let history = c.ngramCtx + ids.prefix(n).map { Int64($0) }
            ngramCtx = Array(history.suffix(ngramWindow))
            tokenCount = c.tokenCount + n
        }
        setRecording(false)
        if compactStateWindows {
            for cache in linear.values { cache.compactWindows() }
        }
    }

    /// Diagnostic for the rollback gate: the largest relative difference, over
    /// all linear layers, between this state's recurrent tensors and another's
    /// (max |a-b| / max |b|). A wrong window or a stale state reads order one;
    /// re-association reads bf16-ulp small.
    public func recurrentDelta(vs other: Qwen4ExpModel.State) -> (ssm: Double, conv: Double, ple: Double) {
        func delta(_ a: MLXArray?, _ b: MLXArray?) -> Double {
            guard let a, let b else { return (a == nil && b == nil) ? 0 : .infinity }
            guard a.shape == b.shape else { return .infinity }
            let d = abs(a.asType(.float32) - b.asType(.float32)).max().item(Float.self)
            let m = abs(b.asType(.float32)).max().item(Float.self)
            return Double(m > 0 ? d / m : d)
        }
        var s = 0.0, c = 0.0, p = 0.0
        for (l, cache) in linear {
            guard let o = other.linear[l] else { continue }
            s = max(s, delta(cache.ssmState, o.ssmState))
            c = max(c, delta(cache.convState, o.convState))
            p = max(p, delta(cache.pleConvState, o.pleConvState))
        }
        return (s, c, p)
    }

    public func restore(_ c: StateCheckpoint) {
        for (l, cache) in linear {
            cache.convState = c.conv[l]
            cache.ssmState = c.ssm[l]
            cache.pleConvState = c.pleConv[l]
        }
        for (l, cache) in kv {
            cache.trim(to: c.kvOffsets[l] ?? 0)
            if let k = cache.keys, let v = cache.values { eval(k, v) }
        }
        for (l, cache) in indexer {
            if let snapshot = c.indexerSnapshots[l] { cache.restore(snapshot) }
            else { cache.trim(to: c.indexerOffsets[l] ?? 0) }
            // Dense attention may not have evaluated raw indexer writes.
            // Detach their graph before a canceled scope releases its inputs.
            cache.materializeStorage()
        }
        ngramCtx = c.ngramCtx
        tokenCount = c.tokenCount
        mtp?.trim(to: c.mtpOffset)
        mtp?.materialize()
        lastMulti = c.lastMulti
    }
}

// PLE cache slot rides on the linear cache of its (linear-attention) layer; if
// the PLE layer were ever a QSA layer this would need its own cache. Reject it
// at init time instead of failing silently.
extension Qwen4ExpModel {
    public func validate() throws {
        try Geometry.check(against: cfg, recordBytes: pool.recordBytes)
        for l in cfg.pleLayerIndices where l < runLayers {
            guard cfg.layerTypes[l] == "linear_attention" else {
                throw ModelError(
                    "PLE layer \(l) is not linear_attention, so its recurrent cache has no home — check --model")
            }
        }
    }
}

````

## Sources/Slotstream/Engine.swift

SHA-256 `c3e5f8cb8e436ec796eed3e7d3455d2335630d190c9a368f20b2476000e9eba8`; 43791bytes.

````
// High-level engine: model + tokenizer + chat templating, shared by CLI/server.

import CoreGraphics
import Foundation
import MLX
import Tokenizers

public struct ChatMessage {
    public var role: String
    public var content: String
    /// An assistant turn's reasoning, rendered as `reasoning_content`. Clients
    /// that keep reasoning in history can replay it; fx does not send any.
    public var reasoning: String?
    /// Calls this assistant turn made.
    public var toolCalls: [ParsedToolCall]
    /// For a `tool` message: which call it answers.
    public var toolCallId: String?
    public var toolName: String?
    /// Pictures this turn carries, as inline bytes (a `data:` URL or bare
    /// base64) in the order the template should render them. Text-only paths
    /// leave it empty and behave exactly as before.
    public var images: [String] = []

    public init(role: String, content: String) {
        self.role = role
        self.content = content
        self.reasoning = nil
        self.toolCalls = []
        self.toolCallId = nil
        self.toolName = nil
    }

    public init(
        role: String, content: String, reasoning: String? = nil,
        toolCalls: [ParsedToolCall] = [], toolCallId: String? = nil, toolName: String? = nil
    ) {
        self.role = role
        self.content = content
        self.reasoning = reasoning
        self.toolCalls = toolCalls
        self.toolCallId = toolCallId
        self.toolName = toolName
    }

    /// The dictionary the chat template consumes.
    ///
    /// Tool-call arguments are bridged as an unordered dictionary because
    /// swift-jinja accepts nothing else, so the template's `arguments|items`
    /// follows Swift's hash order. That is why a generated assistant turn is
    /// spliced back as raw ids rather than re-rendered (`PrefixCache`): a
    /// re-render is semantically identical but not byte-identical, and the
    /// prefix cache matches on bytes.
    public var templateValue: [String: any Sendable] {
        var m: [String: any Sendable] = ["role": role, "content": content]
        // The template checks each content part for an `image`/`image_url`
        // key, so a turn with pictures has to arrive as parts rather than a
        // string. Images first, then the text: that is the order the template
        // numbers them in ("Picture 1: ..."), and the order
        // `Engine.imageSources` reads them back in.
        if !images.isEmpty {
            var parts: [[String: any Sendable]] = images.map {
                ["type": "image_url", "image_url": ["url": $0] as [String: any Sendable]]
            }
            if !content.isEmpty { parts.append(["type": "text", "text": content]) }
            m["content"] = parts
        }
        if let r = reasoning, !r.isEmpty { m["reasoning_content"] = r }
        if !toolCalls.isEmpty {
            m["tool_calls"] = toolCalls.map { call in
                [
                    "type": "function",
                    "function": [
                        "name": call.name,
                        "arguments": call.arguments.mapValues { $0.any },
                    ] as [String: any Sendable],
                ] as [String: any Sendable]
            }
        }
        return m
    }
}

public final class Engine {
    public let modelDir: URL
    public let model: Qwen4ExpModel
    public let generator: Generator
    public let tokenizer: any Tokenizers.Tokenizer
    public let eosIds: Set<Int>
    public let modelName: String
    /// Lazily-loaded vision tower (VLM). Loaded on the first request that
    /// carries an image and then cached; see `ensureVisionTower`.
    public private(set) var visionTower: VisionTower?
    /// Whether this process will accept images at all (`--vision`). False
    /// makes every image request a 400 that says so, rather than a surprise
    /// gigabyte.
    public var visionAllowed = true
    /// Whether the checkpoint carries a tower at all, read once at startup so
    /// the fx catalogue and `/api/show` can answer without touching it.
    public private(set) var visionAvailable = false
    /// Longest prompt accepted, at most `ContextPolicy.maxTokens` (the largest
    /// context that has been measured, see Context.swift). Unbounded prompts
    /// are not free: KV plus indexer state costs ~27 KiB per token, and a
    /// prompt is read in full before the first token, so a huge prompt is a
    /// long, memory-growing stall rather than a fast failure.
    public var maxContextTokens = ContextPolicy.defaultTokens {
        didSet {
            let capped = min(prefixCache.maxTokens, maxContextTokens)
            prefixCache.configure(maxTokens: capped)
            // Keep /api/show's memory plan aligned with the allocation control
            // that actually changed; otherwise --max-context 1024 reported the
            // startup cache ceiling even though it had already been reduced.
            if let p = currentPlan, p.prefixCacheTokens != capped || p.maxContextTokens != maxContextTokens {
                updatePlan(MemoryPlan(
                    source: p.source, slots: p.slots, targetGB: p.targetGB,
                    ramGB: p.ramGB, workingSetGB: p.workingSetGB,
                    ramPercent: p.ramPercent, availableGB: p.availableGB,
                    clamped: p.clamped, prefillChunk: p.prefillChunk,
                    prefixCacheTokens: capped, mtpEnabled: p.mtpEnabled,
                    visionEnabled: p.visionEnabled,
                    visionResidentReserved: p.visionResidentReserved,
                    maxContextTokens: maxContextTokens, notes: p.notes,
                    runtimeAllocationPolicy: p.runtimeAllocationPolicy))
            }
        }
    }

    /// Retained conversation state, so a follow-up turn re-prefills only what
    /// is new. See PrefixCache for the extend-only rule and the memory story.
    public let prefixCache: PrefixCache

    /// Release the retained conversation state. Takes the generation lock, so
    /// never call it from inside `generate`.
    public func dropPrefixCache() {
        withExclusive { prefixCache.drop() }
    }

    /// nil when `promptTokens` fits, otherwise the message to return to the client.
    ///
    /// The message names the cap for what it is. It used to tell people to
    /// raise --max-context, which cannot go past the ceiling the server was
    /// already at.
    public func contextError(promptTokens: Int) -> String? {
        guard promptTokens > maxContextTokens else { return nil }
        let wait = PrefillSchedule.describe(seconds: PrefillSchedule.estSeconds(
            tokens: promptTokens, maxChunk: generator.prefillChunk))
        let ceiling = maxContextTokens < ContextPolicy.maxTokens
            ? "this server was started with --max-context \(maxContextTokens); "
                + "the ceiling is \(ContextPolicy.maxTokens)"
            : "\(ContextPolicy.maxTokens) is the largest context slotstream has measured, "
                + "not a memory limit (context state costs ~27 KiB per token)"
        return "prompt is \(promptTokens) tokens, over this server's limit of "
            + "\(maxContextTokens) for prompt plus reply. \(ceiling). Reading a prompt "
            + "this long would take ~\(wait) before the first token here. Send less, or "
            + "split the material across turns of one conversation so each follow-up "
            + "reads only what is new."
    }
    /// The live memory plan (updated by the elastic governor on resize; nil
    /// for internal fixed-size uses). Guarded by its own lock so /api reads
    /// never block behind a running generation.
    private var _plan: MemoryPlan?
    private let planLock = NSLock()
    public var currentPlan: MemoryPlan? {
        planLock.lock()
        defer { planLock.unlock() }
        return _plan
    }
    public func updatePlan(_ p: MemoryPlan) {
        planLock.lock()
        _plan = p
        planLock.unlock()
    }

    private let lock = GenerationGate()
    package let pressureBoundary = PressureBoundary()
    // Immutable after startup, so the governor never reads mutable model
    // controls concurrently with a request changing its diagnostic options.
    package let responsiveGovernor: Bool

    /// Run `body` with the generation lock held — the governor uses this to
    /// resize the pool strictly between requests.
    public func withExclusive<T>(_ body: () throws -> T) rethrows -> T {
        lock.lock()
        defer { lock.unlock() }
        return try body()
    }

    @discardableResult
    package func tryWithExclusive(_ body: () -> Void) -> Bool {
        lock.tryWithExclusive(body)
    }

    /// Pool numbers for the metadata endpoints, published rather than read
    /// live. Reading SlotPool's mutable Swift arrays while the governor
    /// resizes is a data race, but taking the *generation* lock to avoid it
    /// made /api/tags and /api/ps block for the whole of a running request, so
    /// a client that polls either one saw a generating server as a hung one.
    private var _poolSnapshot: (slots: Int, slotsPerLayer: Double, poolBytes: Int) = (0, 0, 0)
    private let poolSnapshotLock = NSLock()

    public func poolSnapshot() -> (slots: Int, slotsPerLayer: Double, poolBytes: Int) {
        poolSnapshotLock.lock()
        defer { poolSnapshotLock.unlock() }
        return _poolSnapshot
    }

    /// Re-read the pool and publish it. **Call with the generation lock held**
    /// (inside `withExclusive`), which is where every resize already happens.
    public func publishPoolSnapshot() {
        let s = (model.pool.slots, model.pool.slotsPerLayer, model.pool.poolBytes)
        poolSnapshotLock.lock()
        _poolSnapshot = s
        poolSnapshotLock.unlock()
    }

    public convenience init(modelDir: URL, plan: MemoryPlan) async throws {
        try await self.init(modelDir: modelDir, poolSlots: plan.slots, plan: plan)
    }

    public init(modelDir: URL, poolSlots: Int, plan: MemoryPlan? = nil) async throws {
        // A plan made for a simulated machine may be printed and compared,
        // never loaded. Simulating memory the machine does not have still
        // allocates for real: on 2026-08-30 a simulated 60 GB drove a 25.4 GB
        // allocation and 39 GB of swap. The flag travels on the plan so this
        // cannot be forgotten at a call site.
        if plan?.simulated == true { throw SlotstreamError.simulatedDeviceCannotLoad }
        self.modelDir = modelDir
        self._plan = plan
        // Sized from the same budget as the pool; SLOTSTREAM_PREFIX_CACHE=0
        // (or --no-prefix-cache) pins it off for parity work.
        let env = ProcessInfo.processInfo.environment["SLOTSTREAM_PREFIX_CACHE"]
        self.prefixCache = PrefixCache(
            maxTokens: plan?.prefixCacheTokens
                ?? Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            enabled: env != "0" && (plan?.runtimeAllocationPolicy?.prefixCacheEnabled ?? true))
        if let p = plan, p.runtimeAllocationPolicy != nil { prefixCache.setBudgetLimit(p.prefixCacheTokens) }
        // MLX's allocator otherwise retains freed transients (KV caches,
        // activations) in an unbounded internal cache — measured ~5 GB of RSS
        // above the memory plan after a few dozen requests. 2 GB keeps
        // per-token reallocation churn away while making real process memory
        // track the announced plan.
        MLX.Memory.cacheLimit = 2 << 30
        self.modelName = "qwen3.8-flash-next:4bit"
        let t0 = Date()
        let index = try CheckpointIndex(dir: modelDir)
        self.model = try Qwen4ExpModel(index: index, poolSlots: poolSlots)
        self.responsiveGovernor = model.optimizations.responsiveGovernor
        try model.validate()
        // Read from the index that is already open — no tensor is touched, and
        // nothing is allocated until an image actually arrives.
        self.visionAvailable = VisionTower.present(index: index)
        self.visionAllowed = plan?.visionEnabled ?? visionAvailable
        if plan?.mtpEnabled == true {
            try model.enableMTP(modelDir: modelDir)
        }
        self.generator = Generator(model: model)
        if let p = plan, p.runtimeAllocationPolicy != nil {
            generator.setPrefillBudgetCeiling(p.prefillChunk)
            generator.prefillChunk = p.prefillChunk
        }
        if let p = plan, ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CHUNK"] == nil {
            generator.prefillChunk = p.prefillChunk
        }
        if let mb = Int(ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CACHE_MB"] ?? "") {
            generator.prefillCacheLimit = max(0, mb) << 20
        } else if let p = plan, p.expectedPeakGB <= 12 {
            generator.prefillCacheLimit = 512 << 20
        }
        self.tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        var eos: Set<Int> = [index.config.eosTokenId]
        if let e = tokenizer.eosTokenId { eos.insert(e) }
        // generation_config may list several
        if let d = try? Data(contentsOf: modelDir.appendingPathComponent("generation_config.json")),
            let o = try? JSONSerialization.jsonObject(with: d) as? [String: Any]
        {
            if let list = o["eos_token_id"] as? [Int] { list.forEach { eos.insert($0) } }
            if let one = o["eos_token_id"] as? Int { eos.insert(one) }
        }
        self.eosIds = eos
        publishPoolSnapshot()
        let banner = "engine ready in \(String(format: "%.1f", -t0.timeIntervalSinceNow))s: "
            + "expert cache ~\(String(format: "%.0f", model.pool.slotsPerLayer))/\(model.cfg.numExperts) per layer "
            + "(\(model.pool.slots) global slots = \(String(format: "%.1f", Double(model.pool.poolBytes) / 1e9)) GB), "
            + (model.mtpHead != nil ? "mtp draft head on, " : "")
            + "eos \(eos.sorted())\n"
        FileHandle.standardError.write(banner.data(using: .utf8)!)
    }

    public func encodeChat(_ messages: [ChatMessage], thinking: Bool) throws -> [Int] {
        try encodeChat(messages, tools: [], thinking: thinking, effort: nil)
    }

    /// Render a conversation that may declare tools and replay tool calls.
    ///
    /// `tools` empty renders no `<tools>` block at all, which is what the
    /// Ollama and OpenAI dialects pass, so their bytes are unchanged.
    public func encodeChat(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: Self.additionalContext(thinking: thinking, effort: effort))
    }

    /// Encode a conversation, substituting the exact ids this server generated
    /// for any assistant turn it can still prove it produced.
    ///
    /// Why this exists. The prefix cache matches on bytes, and it must: the GDN
    /// recurrent state is a fold over the tokens it consumed, with no inverse,
    /// so a state may only be extended by the very ids that built it. A client
    /// replaying history does not send those ids — it sends its own view of the
    /// turn, which the template then re-renders. Whenever that re-render
    /// differs by a single byte, the next turn rebuilds the whole prompt.
    ///
    /// With reasoning ON that is not an edge case, it is every turn: fx (and
    /// most clients) never echo reasoning back, so the re-render is missing the
    /// `<think>` block the model actually produced, and the state cannot match.
    /// Measured on this machine, a two-turn tool loop reused 303 of 325 tokens
    /// with reasoning off and 0 of 349 with it on — three and a half times the
    /// wall time for the identical second turn.
    ///
    /// The splice closes that. For each assistant turn, ask the cache whether it
    /// still holds a state whose ids begin with exactly the prompt that turn was
    /// generated from; if it does, the remainder of those ids *is* that turn,
    /// verbatim. Check that the remainder really describes the turn the client
    /// sent (same calls, same arguments, same text) and then use the held ids in
    /// place of the re-render, tokenizing only the conversation after it.
    ///
    /// Splitting the text at `<|im_end|>` is safe because it is an added token
    /// and therefore a hard tokenizer boundary: the suffix tokenizes identically
    /// whether or not the text before it is present. That is measured, not
    /// assumed — see the `chat-splice` check.
    ///
    /// Any mismatch anywhere falls back to the plain render, which is the
    /// behaviour that existed before. The splice can make a turn cheaper; it can
    /// never make one wrong.
    public func encodeChatSpliced(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        let full = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        guard prefixCache.enabled, messages.contains(where: { $0.role == "assistant" })
        else { return full }
        let fullText = tokenizer.decode(tokens: full, skipSpecialTokens: false)

        var spliced: [Int] = []  // ids exactly as the model saw or produced them
        var consumed = 0  // characters of fullText those ids already cover
        var didSplice = false

        func index(_ offset: Int) -> String.Index {
            fullText.index(fullText.startIndex, offsetBy: offset)
        }

        for k in messages.indices where messages[k].role == "assistant" {
            guard
                let headIds = try? encodeChat(
                    Array(messages[0..<k]), tools: tools, thinking: thinking, effort: effort)
            else { break }
            let headText = tokenizer.decode(tokens: headIds, skipSpecialTokens: false)
            guard fullText.hasPrefix(headText), headText.count >= consumed else { break }
            // The ids that produced turn k: what is already spliced, plus the
            // conversation between there and this turn's generation prompt.
            let bridge = String(fullText[index(consumed)..<index(headText.count)])
            let producer =
                spliced + (bridge.isEmpty ? [] : tokenizer.encode(text: bridge, addSpecialTokens: false))
            guard let entry = prefixCache.peek(extending: producer) else { break }
            let generated = Array(entry[producer.count...])
            let genText = tokenizer.decode(tokens: generated, skipSpecialTokens: false)
            guard Self.spliceDescribes(genText, messages[k], tools: tools) else { break }
            guard
                let end = fullText.range(
                    of: "<|im_end|>", range: index(headText.count)..<fullText.endIndex)
            else { break }
            spliced = entry
            consumed = fullText.distance(from: fullText.startIndex, to: end.lowerBound)
            didSplice = true
        }

        guard didSplice else { return full }
        let tail = String(fullText[index(consumed)...])
        return spliced + tokenizer.encode(text: tail, addSpecialTokens: false)
    }

    /// Does this generated text describe the assistant turn the client sent?
    ///
    /// Deliberately compares meaning rather than bytes: the client's copy has
    /// been through its own JSON round trip, so whitespace and argument order
    /// may differ, but the calls it reports must be the calls that were made.
    /// Reasoning is ignored — the client dropping it is the whole reason the
    /// splice is needed.
    public static func spliceDescribes(
        _ generated: String, _ message: ChatMessage, tools: [ToolDefinition]
    ) -> Bool {
        let (_, body) = ThinkSplitter.split(generated)
        let visible = body.isEmpty && !generated.contains("</think>") ? generated : body
        let events = ToolCallSplitter.parseAll(visible, tools: tools.map { $0.schema })
        var calls: [ParsedToolCall] = []
        var text = ""
        for e in events {
            switch e {
            case .toolCall(let c): calls.append(c)
            case .text(let t): text += t
            case .malformed: return false
            default: break
            }
        }
        guard calls.count == message.toolCalls.count else { return false }
        for (a, b) in zip(calls, message.toolCalls) {
            guard a.name == b.name, a.arguments == b.arguments else { return false }
        }
        // The text is compared after trimming only. A client that rewrites the
        // assistant's prose is describing a different turn, and re-rendering it
        // is then the correct answer.
        return text.trimmingCharacters(in: .whitespacesAndNewlines)
            == message.content.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    static func additionalContext(thinking: Bool, effort: String?) -> [String: any Sendable] {
        var ctx: [String: any Sendable] = ["enable_thinking": thinking]
        if let e = effort, thinking { ctx["reasoning_effort"] = e }
        return ctx
    }

    /// Render a template without constructing the multi-GB model. Installer
    /// and API acceptance checks run this while a server is already live; the
    /// old implementation built a second Engine merely to load the tokenizer,
    /// so the singleton guard correctly rejected the check it was meant to run.
    public static func encodeChatWithoutModel(
        modelDir: URL, messages: [ChatMessage], thinking: Bool,
        tools: [ToolDefinition] = [], effort: String? = nil
    ) async throws -> [Int] {
        let tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        return try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: additionalContext(thinking: thinking, effort: effort))
    }

    /// OpenAI path: messages already contain image_url parts, and content may
    /// be String or [[String: Any]] (vision). The nested arrays must be
    /// bridged to the tokenizer's `[String: any Sendable]` messages or the
    /// vision parts are silently dropped before the Jinja template can render
    /// them as <|image_pad|>.
    public func encodeChatOpenAI(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> [Int] {
        func toSendable(_ v: Any) -> any Sendable {
            if let arr = v as? [[String: Any]] {
                return arr.map { d -> [String: any Sendable] in
                    var out: [String: any Sendable] = [:]
                    for (k, vv) in d { out[k] = toSendable(vv) }
                    return out
                } as any Sendable
            }
            if let d = v as? [String: Any] {
                var out: [String: any Sendable] = [:]
                for (k, vv) in d { out[k] = toSendable(vv) }
                return out as any Sendable
            }
            if let a = v as? [Any] {
                return a.map { toSendable($0) } as any Sendable
            }
            return v as any Sendable
        }
        let msgs: [[String: any Sendable]] = messages.map { dict in
            var m: [String: any Sendable] = [:]
            for (k, v) in dict { m[k] = toSendable(v) }
            return m
        }
        let toolSpecs: [[String: any Sendable]]? = tools?.map { dict in
            var t: [String: any Sendable] = [:]
            for (k, v) in dict { t[k] = toSendable(v) }
            return t
        }
        return try tokenizer.applyChatTemplate(
            messages: msgs, tools: toolSpecs, additionalContext: ["enable_thinking": thinking])
    }

    // MARK: Vision

    /// Load the vision tower on first use, and only if the machine can spare
    /// it right now.
    ///
    /// **Under the generation lock, not a lock of its own.** Loading is
    /// ~0.9 GB of MLX arrays plus an `eval`; a private lock let that run on a
    /// connection thread while another request was mid-generation, which is
    /// exactly the concurrent GPU work every other allocation path in this
    /// file serializes. `withExclusive` is that serialization, and it also
    /// makes the availability reading below meaningful: nothing else can
    /// allocate between reading it and taking the memory.
    ///
    /// Replan before allocation so a target-driven process pays for the
    /// tower with expert capacity. Also require real machine headroom: an
    /// accounting allowance is not proof that physical memory is available.
    public func ensureVisionTower() throws -> VisionTower {
        guard visionAllowed else {
            throw SlotstreamError.vision(
                "this server was started with --vision off; images are not accepted")
        }
        return try withExclusive {
            if responsiveGovernor, pressureBoundary.snapshot() != nil {
                throw SlotstreamError.vision("memory pressure interrupted image preparation; retry after the cache resizes")
            }
            if let vt = visionTower { return vt }
            let idx = try CheckpointIndex(dir: modelDir)
            guard VisionTower.present(index: idx) else {
                throw SlotstreamError.vision(
                    "this checkpoint has no vision tower — it is a text-only model")
            }
            let needGB = Double(VisionTower.residentBytes(index: idx)) / 1e9
            guard needGB <= Planner.visionResidentGB else {
                throw SlotstreamError.vision("vision weights exceed the supported resident allowance")
            }
            let reservedPlan: MemoryPlan?
            do { reservedPlan = try currentPlan.map { try Planner.loadingVision($0) } }
            catch { throw SlotstreamError.vision(String(describing: error)) }
            if let avail = Planner.deviceAvailableGB(), avail.isFinite,
                avail < needGB + Planner.visionLoadMarginGB
            {
                throw SlotstreamError.vision(
                    String(
                        format: "the vision tower needs %.1f GB and only %.1f GB is reclaimable "
                            + "right now — close other apps and retry, or restart with a lower "
                            + "--memory-gb so the tower fits",
                        needGB, avail))
            }
            if let p = reservedPlan {
                // The lock excludes generation and governor mutation. Shrink
                // releases the old arena before allocating the smaller one.
                model.pool.resize(to: p.slots)
                if p.runtimeAllocationPolicy != nil {
                    generator.setPrefillBudgetCeiling(p.prefillChunk)
                    prefixCache.setBudgetLimit(p.prefixCacheTokens)
                }
                generator.prefillChunk = min(generator.prefillChunk, p.prefillChunk)
                prefixCache.configure(maxTokens: min(prefixCache.maxTokens, p.prefixCacheTokens))
                MLX.Memory.clearCache()
                updatePlan(p)
                publishPoolSnapshot()
            }
            let vt = try VisionTower(index: idx)
            self.visionTower = vt
            return vt
        }
    }

    /// Tokenize with vision expansion: each template image_pad is worth
    /// N_merged real tokens, so the template's single pad is expanded to a run
    /// of pads that the tower's embeddings will fill. Returns the expanded ids
    /// and a `VisionPrompt` when the request carries images, nil otherwise.
    ///
    /// The tower does not run here. The run lengths come from each image's
    /// dimensions, so the ids — and with them the prefix cache key — are ready
    /// before any pixels are read. `Generator.generate` asks the cache first
    /// and then encodes only the images that the reused state does not cover.
    public func encodeWithVision(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> ([Int], VisionPrompt?) {
        let baseIds = try encodeChatOpenAI(messages: messages, tools: tools, thinking: thinking)
        return try withImages(baseIds: baseIds, sources: Self.imageSources(in: messages))
    }

    /// The typed path (`ChatMessage`), for the fx gateway and the CLI. Renders
    /// through the same template as `encodeChat` and then expands the same
    /// placeholders.
    public func encodeChatWithVision(
        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
        effort: String? = nil
    ) throws -> ([Int], VisionPrompt?) {
        let baseIds = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        return try withImages(baseIds: baseIds, sources: messages.flatMap { $0.images })
    }

    /// Expand each `<|image_pad|>` the template rendered into the run of
    /// placeholders its image is worth, and describe the images for the tower
    /// and the prefix cache. Shared by every surface so they cannot drift.
    private func withImages(baseIds: [Int], sources: [String]) throws -> ([Int], VisionPrompt?) {
        if sources.isEmpty { return (baseIds, nil) }
        let started = RuntimeClock.now()
        let observer = generator.footprintSampling ? FootprintSampler() : nil
        let vmBefore = generator.footprintSampling ? ProcessMemory.vmActivity() : nil
        var observationFinished = false
        defer { if !observationFinished { _ = observer?.finish() } }
        // Decode and hash first: it needs no tower, it is cheap next to one,
        // and a malformed picture should be a 400 before the process commits
        // 0.9 GB to a tower it may not otherwise need.
        var decoded: [(cg: CGImage, hash: ImageHash)] = []
        let sourceBatch = DecodedImageBatch(deduplicate: model.optimizations.deduplicateImages)
        decoded.reserveCapacity(sources.count)
        for (i, source) in sources.enumerated() {
            do {
                let data = try VisionPreprocess.loadImageData(from: source)
                decoded.append(try sourceBatch.decode(data))
            } catch {
                throw SlotstreamError.vision("image \(i + 1): \(error)")
            }
        }
        let decodedSeconds = RuntimeClock.seconds(since: started)
        let towerStart = RuntimeClock.now()
        let vt = try ensureVisionTower()
        let towerReadySeconds = RuntimeClock.seconds(since: towerStart)
        var items: [VisionPrompt.Item] = []
        items.reserveCapacity(decoded.count)
        for (i, d) in decoded.enumerated() {
            do { items.append(VisionPrompt.Item(image: d.cg, plan: try vt.plan(for: d.cg))) }
            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
        }
        // The template renders one `<|image_pad|>` per image; the tower
        // produces `mergedTokens` rows for it. Expanding the pad into a run of
        // that length is what makes the two line up, and it moves every token
        // after the first image — ids and segment offsets alike, in one sweep,
        // so a later prompt that extends this one keys identically.
        let imageId = model.cfg.imageTokenId
        let perImage = items.map { $0.plan.mergedTokens }
        var expanded: [Int] = []
        var segments: [ImageSegment] = []
        expanded.reserveCapacity(baseIds.count + perImage.reduce(0, +) - perImage.count)
        var imgIdx = 0
        for tok in baseIds {
            if tok == imageId, imgIdx < perImage.count {
                segments.append(
                    ImageSegment(
                        start: expanded.count, count: perImage[imgIdx], hash: decoded[imgIdx].hash))
                expanded.append(contentsOf: repeatElement(imageId, count: perImage[imgIdx]))
                imgIdx += 1
            } else {
                expanded.append(tok)
            }
        }
        // Both directions are checked. Too few placeholders means the template
        // did not render an image this code found; too many means something
        // else in the prompt tokenized to the placeholder id — a user who
        // typed the literal `<|image_pad|>`, for instance. Either way the rows
        // and the runs would not correspond, so the request stops here rather
        // than putting embeddings under the wrong tokens.
        guard imgIdx == items.count else {
            throw SlotstreamError.vision(
                "the chat template rendered \(imgIdx) image placeholders for \(items.count) "
                    + "images; slotstream cannot place the rest")
        }
        let placeholders = expanded.reduce(0) { $0 + ($1 == imageId ? 1 : 0) }
        guard placeholders == perImage.reduce(0, +) else {
            throw SlotstreamError.vision(
                "the prompt carries \(placeholders) image placeholder tokens but the images "
                    + "account for \(perImage.reduce(0, +)); remove any literal <|image_pad|> "
                    + "from the text")
        }
        let prompt = VisionPrompt(tower: vt, items: items, segments: segments, hiddenSize: model.cfg.hiddenSize)
        prompt.preparationObservation = ImagePreparationObservation(
            seconds: RuntimeClock.seconds(since: started), sourceDecodeSeconds: decodedSeconds,
            towerReadySeconds: towerReadySeconds, sampledFootprint: observer?.finish(),
            vmBefore: vmBefore, vmAfter: generator.footprintSampling ? ProcessMemory.vmActivity() : nil,
            sourceDecodedImages: sourceBatch.decodedImages, sourceReusedImages: sourceBatch.reusedImages,
            sourceAdmissionBytes: sourceBatch.chargedBytes)
        observationFinished = true
        return (expanded, prompt)
    }

    /// Every image a request carries, in the order the chat template will
    /// render them: message by message, part by part, and Ollama's per-message
    /// `images` array after that message's content parts — which is where the
    /// template puts them too.
    public static func imageSources(in messages: [[String: Any]]) -> [String] {
        var out: [String] = []
        for m in messages {
            if let content = m["content"] as? [[String: Any]] {
                for part in content {
                    if let iu = part["image_url"] as? [String: Any], let u = iu["url"] as? String {
                        out.append(u)
                    } else if let u = part["image_url"] as? String {
                        out.append(u)
                    } else if let u = part["image"] as? String {
                        out.append(u)
                    }
                }
            }
            for b64 in (m["images"] as? [String] ?? []) { out.append(b64) }
        }
        return out
    }

    /// Earliest position at which any stop sequence occurs, or nil.
    private static func stopIndex(_ text: String, _ stops: [String]) -> String.Index? {
        var best: String.Index?
        for s in stops {
            if let r = text.range(of: s), best == nil || r.lowerBound < best! {
                best = r.lowerBound
            }
        }
        return best
    }

    /// Serialized generation (single-flight; callers queue on the lock).
    ///
    /// Incremental detokenization consumes bounded groups of token ids, keeping
    /// incomplete UTF-8 bytes at the group boundary. Two rules matter:
    ///
    /// - Emission and stop holdback are by Unicode scalar, never Character. A
    ///   later token can contribute a scalar that merges into the grapheme
    ///   already sent (an emoji plus U+FE0F is still one Character).
    /// - While stop sequences are active, the last `maxStopLength - 1` scalars
    ///   are withheld, so the prefix of a stop sequence that straddles a token
    ///   boundary is never emitted before the rest of it arrives. Whatever is
    ///   still held back is flushed once generation ends.
    ///
    /// The invariant the tests hold this to: concatenating every streamed delta
    /// reproduces the non-streamed text exactly.
    public func generate(
        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        let requestStart = RuntimeClock.now()
        lock.lock()
        let queueSeconds = RuntimeClock.seconds(since: requestStart)
        defer { lock.unlock() }
        var params = params.sanitized()
        // A queued request may acquire the lock before the waiting governor.
        // Refuse it before image encoding, cache checkout or GPU allocation.
        if responsiveGovernor, let ticket = pressureBoundary.snapshot() {
            var stats = GenStats()
            stats.promptTokens = promptIds.count
            stats.memoryPressureCancelled = true
            stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        let room = max(0, maxContextTokens - promptIds.count)
        if room == 0 {
            var stats = GenStats()
            stats.promptTokens = promptIds.count
            stats.finishReason = "length"
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
            stats.physicalFootprintEndBytes = ProcessMemory.residentBytes()
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return ("", [], stats)
        }
        // Context is prompt + completion, not two independent 32k allowances.
        params.maxTokens = min(params.maxTokens, room)
        let stops = params.stop
        let holdBack = stops.isEmpty
            ? 0 : max(0, (stops.map { $0.unicodeScalars.count }.max() ?? 1) - 1)
        var pendingIds: [Int] = []
        var withheld = ""
        var delivered = ""
        var lastTok = -1
        var clientGone = false
        var stopFound = false
        var firstTextSeconds: Double?
        var pressureObserved: PressureTicket?
        var pressureBoundarySeconds: Double?

        func observePressure() -> Bool {
            guard responsiveGovernor, let ticket = pressureBoundary.snapshot() else { return false }
            if pressureObserved == nil {
                pressureObserved = ticket
                pressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            return true
        }

        func emit(_ delta: String, _ tok: Int) -> Bool {
            if delta.isEmpty { return true }
            delivered += delta
            guard let cb = onToken else { return true }
            if firstTextSeconds == nil { firstTextSeconds = RuntimeClock.seconds(since: requestStart) }
            return cb(tok, delta)
        }

        /// Feed a stable decoded piece through the stop-sequence holdback.
        func feed(_ piece: String, final: Bool, tok: Int) -> Bool {
            withheld += piece
            if !stops.isEmpty, let cut = Self.stopIndex(withheld, stops) {
                _ = emit(String(withheld[..<cut]), tok)
                withheld = ""
                stopFound = true
                return false
            }
            let scalars = withheld.unicodeScalars
            let n = final ? scalars.count : max(0, scalars.count - holdBack)
            let delta = String(String.UnicodeScalarView(scalars.prefix(n)))
            withheld = String(String.UnicodeScalarView(scalars.dropFirst(n)))
            return emit(delta, tok)
        }

        /// Qwen's ByteLevel decoder is concatenative once a UTF-8 scalar is
        /// complete. Decode small bounded groups and retain four token bytes at
        /// the boundary; if the candidate still ends in U+FFFD, retain more.
        /// This makes streaming decode O(n), rather than decoding tokens 1...n
        /// after every generated token.
        func flushStablePrefix(_ tok: Int) -> Bool {
            guard !pendingIds.isEmpty else { return true }
            // Start from everything buffered and hand back one token at a time
            // while the decode still ends mid-scalar. Waiting for eight tokens
            // before the first flush and holding four back after it gave
            // clients one delta per four tokens, and no delta at all for a
            // reply shorter than eight; the byte-exactness this protects rests
            // on the replacement-character check below, not on the backlog.
            var n = pendingIds.count
            var piece = ""
            while n > 0 {
                piece = tokenizer.decode(
                    tokens: Array(pendingIds.prefix(n)), skipSpecialTokens: true)
                if !piece.hasSuffix("\u{FFFD}") { break }
                n -= 1
            }
            guard n > 0 else { return true }
            pendingIds.removeFirst(n)
            return feed(piece, final: false, tok: tok)
        }

        let needsIncrementalDecode = onToken != nil || !stops.isEmpty
        let tokenHandler: ((Int) -> Bool)? = needsIncrementalDecode ? { tok in
            lastTok = tok
            pendingIds.append(tok)
            let ok = flushStablePrefix(tok)
            if !ok, !stopFound { clientGone = true }
            // A pressure event can arrive inside a client callback. This is
            // already a supported committed-emission boundary in both decode
            // paths; do not spend another forward before observing it.
            return ok && !observePressure()
        } : (responsiveGovernor ? { _ in !observePressure() } : nil)

        var (ids, stats) = generator.generate(
            promptIds: promptIds, params: params, eosIds: eosIds, cache: prefixCache,
            vision: vision,
            shouldContinue: {
                guard !clientGone, !stopFound else { return false }
                if observePressure() { return false }
                return shouldContinue?() ?? true
            }, onToken: tokenHandler)

        var text = tokenizer.decode(tokens: ids, skipSpecialTokens: true)
        if !stops.isEmpty, let cut = Self.stopIndex(text, stops) {
            text = String(text[text.startIndex ..< cut])
        }
        // The one full decode is both the non-streamed result and an exact final
        // reconciliation for the bounded incremental decoder.
        if !clientGone, onToken != nil {
            let target = text.unicodeScalars
            let sent = delivered.unicodeScalars
            if target.count >= sent.count, target.starts(with: sent) {
                _ = emit(String(String.UnicodeScalarView(target.dropFirst(sent.count))), lastTok)
            }
        }
        stats.queueSeconds = queueSeconds
        stats.memoryPressureCancelled = pressureObserved != nil
        stats.memoryPressureBoundarySeconds = pressureBoundarySeconds
        stats.firstTextSeconds = firstTextSeconds
        stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
        return (text, ids, stats)
    }
}

````

## Sources/Slotstream/PressureBoundary.swift

SHA-256 `8b414c2ac4439c4774cc64cca59a9ad55a1928193263a16c92825200bdafc468`; 1446bytes.

````
import Foundation

/// A bounded cancellation request. Object identity prevents a delayed
/// acknowledgement from clearing a newer event (including counter wraparound).
package final class PressureTicket {
    package let requestedAt = RuntimeClock.now()
}

package final class PressureBoundary: @unchecked Sendable {
    private let lock = NSLock()
    private var pending: PressureTicket?

    package init() {}

    package func request() -> PressureTicket {
        lock.lock(); defer { lock.unlock() }
        let ticket = PressureTicket()
        pending = ticket
        return ticket
    }

    package func snapshot() -> PressureTicket? {
        lock.lock(); defer { lock.unlock() }
        return pending
    }

    package func acknowledge(_ ticket: PressureTicket) {
        lock.lock(); defer { lock.unlock() }
        if pending === ticket { pending = nil }
    }
}

/// Polling must not queue behind generation on the same dispatch queue that
/// delivers OS pressure events. Resizing still owns this gate exclusively.
package final class GenerationGate: @unchecked Sendable {
    private let mutex = NSLock()
    package init() {}
    package func lock() { mutex.lock() }
    package func unlock() { mutex.unlock() }
    @discardableResult
    package func tryWithExclusive(_ body: () -> Void) -> Bool {
        guard mutex.try() else { return false }
        defer { mutex.unlock() }
        body()
        return true
    }
}

````

## Sources/Slotstream/PrefixCache.swift

SHA-256 `5a0dc112dad5d90cb8a648ce2333d0476d8299eb7405b41caf4c647891a8d56b`; 22509bytes.

````
// Conversation prefix cache: reuse of one generation's model state by the next
// request, when the next prompt extends the one that produced it.
//
// Why this exists. `Generator.generate` used to call `model.makeState()` on
// every request, so a chat re-prefilled its entire history every turn. At the
// measured 92 tok/s that is ~9 s of dead air at turn 2 (~800 tokens), ~33 s at
// turn 5, ~65 s at turn 10 — by which point prefill is most of the wait for a
// 500-token reply, and all of it is recomputing tokens the previous turn
// already processed. Agentic and tool-loop use, many short turns over one long
// identical prefix, is both the worst case and the use that most justifies a
// local model.
//
// Extend-only, never rewind. A pure-attention runner can slice a KV cache to
// any prefix. This model cannot: `LinearCache` holds the GDN recurrent state,
// which is a fold over every token seen and has no inverse, and `ngramCtx`
// is likewise carried forward. So the state is reusable only when the new
// prompt *extends* exactly the ids that produced it; anything else — an edited
// earlier message, a different conversation, a regenerate with a shorter
// prompt — is a full rebuild. That covers the dominant chat and tool-loop
// shape and fails safe for the rest.
//
// Images. Token ids alone are not a sufficient key for a vision prompt: the
// template expands each image into a run of the *same* placeholder id, so two
// different pictures that resize to the same grid produce byte-identical ids.
// Matching on ids alone would hand a follow-up turn a state built from the
// wrong pixels. An entry therefore also carries an `ImageSegment` per image —
// where its run starts and a digest of the bytes that produced it — and a
// match requires the segments to agree as well as the ids. That is what makes
// a vision conversation cacheable at all; before it, every image request
// re-prefilled its whole prompt and re-ran the tower on every turn.
//
// Memory. A held state is ~27 KiB per token (KV + indexer) plus ~113 MB of
// fixed GDN recurrent state. Several conversations are genuinely additive.
// A miss evicts enough LRU entries before the caller allocates its state that
// retained + active states never exceed maxEntries and their token capacities
// share one budget. The governor sheds them before shrinking the pool.

import Foundation

/// A digest of one image's encoded bytes, wide enough that a collision is not
/// a practical concern. Bytes rather than the URL: the same http URL may serve
/// different pictures later, while identical bytes always decode, resize and
/// encode to the same rows for a given tower.
public struct ImageHash: Hashable, Sendable {
    public let hi: UInt64
    public let lo: UInt64
    public init(hi: UInt64, lo: UInt64) {
        self.hi = hi
        self.lo = lo
    }
}

/// One image's placeholder run inside an expanded prompt: where it starts, how
/// many tokens it occupies, and which image produced it. Offsets are in the
/// expanded id space — the same space `promptIds` is in.
public struct ImageSegment: Hashable, Sendable {
    public let start: Int
    public let count: Int
    public let hash: ImageHash
    /// Opaque in-process tower/processor identity. Legacy callers without a
    /// VisionPrompt keep nil; they cannot match a prepared image accidentally.
    package let preparationIdentity: String?
    public init(start: Int, count: Int, hash: ImageHash) {
        self.start = start
        self.count = count
        self.hash = hash
        self.preparationIdentity = nil
    }
    package init(start: Int, count: Int, hash: ImageHash, preparationIdentity: String?) {
        self.start = start
        self.count = count
        self.hash = hash
        self.preparationIdentity = preparationIdentity
    }
    /// One past the last token of the run.
    public var end: Int { start + count }
}

/// A bounded set of reusable conversation states plus the exact ids that
/// produced them. Not a general KV cache: every entry matches by exact prefix.
///
/// Entries are shared by every client, which is safe for a reason worth stating
/// rather than rediscovering: a match requires the incoming prompt to *begin
/// with the entire held id sequence*, so a client can only ever reuse state
/// whose full content it just supplied itself. There is nothing to learn from a
/// hit that the requester did not already send.
///
/// A repeated identical prompt deliberately does **not** hit: the held sequence
/// includes the previous reply and is therefore longer, so the match fails and
/// the request rebuilds. Asking the same question twice keeps giving the same
/// answer.
public final class PrefixCache {
    /// Main-model KV + raw indexer bytes per logical token. Retention is
    /// charged in these units using actual allocated sequence capacity, so
    /// stepped buffers, completed blocks and MTP cannot hide behind the count
    /// of live token IDs. Fixed recurrent state is budgeted separately.
    public static let bytesPerToken = 27_648

    /// 36 linear-attention layers × 48 value heads × 128 × 128 float32.
    public static let fixedBytesPerEntry = 36 * 48 * 128 * 128 * 4

    /// How many conversations may be held at once.
    ///
    /// **This is not one for a measured reason.** A single slot was defeated by
    /// the first real client it met: Open WebUI fires a title-generation
    /// request straight after each chat turn, with a completely different
    /// prompt, so by the time the user's next turn arrives the one slot holds
    /// the title prompt and the conversation has been evicted. Measured through
    /// its UI: 0 hits, 7 misses across a two-turn chat. Any client with
    /// auxiliary requests — title, tags, follow-up suggestions, embeddings —
    /// behaves the same way, so a one-slot cache is a cache that only works in
    /// benchmarks.
    public static let maxEntries = 4

    private struct Entry {
        var state: Qwen4ExpModel.State
        var tokens: [Int]
        var images: [ImageSegment]
        var used: Int
        var reusable = false
    }

    /// Do a held entry and an incoming prompt describe the same images?
    ///
    /// Checked in both directions over the entry's token range, which matters
    /// for the asymmetric cases: an entry whose image the prompt replaced (the
    /// first loop), and a text-only entry whose ids a vision prompt happens to
    /// extend because the placeholder id can also appear as a plain token (the
    /// second loop). Runs are compared by start and digest, not by length: an
    /// entry may end part-way through a run, and a partly consumed image is
    /// still the same image.
    public static func imagesAgree(
        entry: [ImageSegment], prompt: [ImageSegment], upTo tokens: Int
    ) -> Bool {
        for e in entry {
            guard let p = prompt.first(where: { $0.start == e.start }), p.hash == e.hash,
                  p.preparationIdentity == e.preparationIdentity
            else { return false }
        }
        for p in prompt where p.start < tokens {
            guard let e = entry.first(where: { $0.start == p.start }), e.hash == p.hash,
                  e.preparationIdentity == p.preparationIdentity
            else { return false }
        }
        return true
    }

    private let lock = NSLock()
    private var entries: [Entry] = []
    private var clock = 0

    /// Ceiling on tokens held across *all* entries, so several conversations
    /// share one budget rather than each reserving the maximum. One long chat
    /// may still use the whole allowance.
    private var _maxTokens: Int
    private var _enabled: Bool
    private var budgetLimit: Int?

    /// An allocation that has been reassigned to experts cannot be restored
    /// through a later cache toggle. Only a newly applied plan changes this.
    package func setBudgetLimit(_ tokens: Int?) {
        lock.withLock {
            budgetLimit = tokens.map { max(0, $0) }
            if let budgetLimit { _maxTokens = min(_maxTokens, budgetLimit) }
            while entries.reduce(0, { $0 + Self.charge($1) }) > _maxTokens { evictLRU() }
        }
    }

    public var maxTokens: Int {
        get { lock.withLock { _maxTokens } }
        set { configure(maxTokens: newValue) }
    }
    public var enabled: Bool {
        get { lock.withLock { _enabled } }
        set {
            lock.withLock {
                _enabled = newValue
                if !newValue { _evictions += entries.count; entries.removeAll() }
            }
        }
    }

    private var _hits = 0
    private var _misses = 0
    private var _evictions = 0
    private var _checkpointHits = 0
    private var _checkpointStores = 0
    private var _checkpointForkFailures = 0
    public var hits: Int { lock.withLock { _hits } }
    public var misses: Int { lock.withLock { _misses } }
    public var evictions: Int { lock.withLock { _evictions } }
    public var checkpointHits: Int { lock.withLock { _checkpointHits } }
    public var checkpointStores: Int { lock.withLock { _checkpointStores } }
    public var heldCheckpoints: Int { lock.withLock { entries.filter(\.reusable).count } }

    public init(maxTokens: Int, enabled: Bool = true) {
        self._maxTokens = max(0, maxTokens)
        self._enabled = enabled
    }

    public var heldTokens: Int {
        lock.lock(); defer { lock.unlock() }
        return entries.reduce(0) { $0 + $1.tokens.count }
    }

    public var heldGB: Double {
        lock.withLock {
            let bytes = entries.reduce(0) { $0 + Self.charge($1) } * Self.bytesPerToken
                + entries.count * Self.fixedBytesPerEntry
            return Double(bytes) / 1e9
        }
    }

    /// Take ownership of a state that `promptIds` extends, or nil.
    ///
    /// The *longest* matching prefix wins, so a follow-up turn resumes the
    /// deepest state available rather than an older, shorter one. A hit removes
    /// that entry (the caller now owns the state and will hand it back with the
    /// ids it consumed); a miss leaves the others alone — evicting them would
    /// reintroduce exactly the single-slot failure described above.
    public func take(
        matching promptIds: [Int], images: [ImageSegment] = [], reserveTokens: Int? = nil,
        reserveSequenceBytes: Int? = nil
    ) -> (state: Qwen4ExpModel.State, reused: Int)? {
        lock.lock()
        defer { lock.unlock() }
        guard _enabled else { entries.removeAll(); return nil }
        // Strictly greater: at least one new token must remain to produce
        // logits from, and the state cannot be rewound to yield them.
        var best: Int?
        for (i, e) in entries.enumerated()
        where promptIds.count > e.tokens.count && promptIds.starts(with: e.tokens)
            && Self.imagesAgree(entry: e.images, prompt: images, upTo: e.tokens.count) {
            if best == nil || e.tokens.count > entries[best!].tokens.count { best = i }
        }
        guard let i = best else {
            _misses += 1
            // The caller is about to allocate a new state. Make room first so
            // four retained states plus a fifth active state never coexist.
            reserveActiveTokens(max(promptIds.count, reserveTokens ?? promptIds.count, Self.tokenUnits(reserveSequenceBytes ?? 0)))
            return nil
        }
        let selected = entries[i]
        if selected.reusable {
            clock += 1
            entries[i].used = clock
            // Charge a complete future active branch in addition to retained
            // checkpoints. If it cannot remain, transfer the original entry
            // after eviction; do not create a fifth state or an unbudgeted fork.
            reserveActiveTokens(max(promptIds.count, reserveTokens ?? promptIds.count,
                Self.tokenUnits(reserveSequenceBytes ?? 0), Self.charge(selected)))
            if entries.contains(where: { $0.state === selected.state }) {
                do {
                    let branch = try selected.state.forkForPrefix()
                    _hits += 1; _checkpointHits += 1
                    return (branch, selected.tokens.count)
                } catch {
                    if let failed = entries.firstIndex(where: { $0.state === selected.state }) {
                        entries.remove(at: failed); _evictions += 1
                    }
                    _checkpointForkFailures += 1; _misses += 1
                    return nil
                }
            }
            _hits += 1
            return (selected.state, selected.tokens.count)
        }
        let e = entries.remove(at: i)
        // A reused state grows too. Reserve its complete incoming prompt and
        // permitted reply before handing it out, just as on a miss.
        reserveActiveTokens(max(promptIds.count, reserveTokens ?? promptIds.count, Self.tokenUnits(reserveSequenceBytes ?? 0), Self.charge(e)))
        _hits += 1
        return (e.state, e.tokens.count)
    }

    private static func tokenUnits(_ bytes: Int) -> Int {
        if bytes == Int.max { return Int.max }
        let bytes = max(0, bytes)
        return bytes / bytesPerToken + (bytes % bytesPerToken == 0 ? 0 : 1)
    }

    private static func charge(_ entry: Entry) -> Int {
        max(entry.tokens.count, tokenUnits(entry.state.allocatedSequenceBytes))
    }

    /// Called with the cache lock held. Saturating the allowance also avoids
    /// overflowing a diagnostic caller's arbitrarily large reserve request.
    private func reserveActiveTokens(_ reserve: Int) {
        let allowance = _maxTokens - min(_maxTokens, max(0, reserve))
        while !entries.isEmpty && (entries.count >= Self.maxEntries
            || entries.reduce(0, { $0 + Self.charge($1) }) > allowance) {
            evictLRU()
        }
    }

    /// The ids of the longest retained entry that *extends* `prefix`, without
    /// taking it.
    ///
    /// `take` asks the opposite question — is there an entry the incoming
    /// prompt extends — and consumes what it finds. This one asks whether a
    /// previous turn's own output is still held, so the caller can splice those
    /// exact ids back in place of a re-rendered assistant turn (`Engine`'s
    /// spliced encoding). It must not consume: the caller may still decide the
    /// entry does not describe the turn the client sent, and the entry is then
    /// wanted for the ordinary `take` that follows.
    public func peek(extending prefix: [Int]) -> [Int]? {
        lock.lock()
        defer { lock.unlock() }
        guard _enabled else { return nil }
        var best: [Int]?
        // Vision entries are skipped: the caller splices these ids into a
        // text-only render that carries no images, and the resulting prompt
        // would claim placeholder tokens it has no embeddings for.
        for e in entries
        where !e.reusable && e.images.isEmpty && e.tokens.count > prefix.count
            && e.tokens.starts(with: prefix) {
            if best == nil || e.tokens.count > best!.count { best = e.tokens }
        }
        return best
    }

    /// Retain `state` as the consumer of exactly `tokens`, evicting
    /// least-recently-used entries until the shared budget fits.
    public func store(
        state s: Qwen4ExpModel.State, tokens t: [Int], images: [ImageSegment] = []
    ) {
        lock.lock()
        defer { lock.unlock() }
        guard _enabled, !t.isEmpty, t.count <= _maxTokens else { return }
        clock += 1
        // Repeating the same deterministic request produces the same consumed
        // token history. Replace its state instead of filling all four entries
        // with byte-identical conversations and evicting useful chats. Same
        // ids with different pictures is a different conversation, so the
        // images have to match for this to be a replacement.
        if let i = entries.firstIndex(where: { $0.tokens == t && $0.images == images }) {
            // Cancellation at this same committed boundary may return the
            // active branch. Preserve the private reusable snapshot; adopting
            // the caller's mutable object would violate fork ownership.
            if entries[i].reusable {
                entries[i].used = clock
                return
            }
            entries[i] = Entry(state: s, tokens: t, images: images, used: clock)
        } else {
            entries.append(Entry(state: s, tokens: t, images: images, used: clock))
        }
        while entries.count > Self.maxEntries
            || entries.reduce(0, { $0 + Self.charge($1) }) > _maxTokens
        {
            guard !entries.isEmpty else { break }
            evictLRU()
        }
    }

    /// Retain an exact committed common prefix while its producer continues.
    /// The caller supplies the actual consumed IDs/images, serializes with
    /// model execution and declares the producer's complete future reservation.
    /// Cache objects and MLX contexts are forked; both branches are charged at
    /// full allocated sequence capacity plus fixed recurrent state. False means
    /// retention is disabled or does not fit, without changing model behavior.
    @discardableResult
    public func storeReusableCheckpoint(
        state s: Qwen4ExpModel.State, tokens t: [Int], images: [ImageSegment] = [],
        reserveTokens: Int, reserveSequenceBytes: Int
    ) throws -> Bool {
        guard !t.isEmpty, s.tokenCount == t.count else {
            throw ModelError("a reusable checkpoint needs its exact committed token count")
        }
        try s.validatePrefixFork()
        guard s.mtp == nil || s.hasValidMTP else {
            throw ModelError("a reusable checkpoint cannot retain misaligned draft state")
        }
        var committedImages: [ImageSegment] = []
        var previousEnd = 0
        for image in images {
            guard image.start >= previousEnd, image.count > 0,
                  !image.start.addingReportingOverflow(image.count).overflow else {
                throw ModelError("invalid image segments for reusable checkpoint")
            }
            previousEnd = image.start + image.count
            if image.start < t.count {
                committedImages.append(ImageSegment(start: image.start, count: min(image.count, t.count - image.start),
                    hash: image.hash, preparationIdentity: image.preparationIdentity))
            }
        }
        lock.lock(); defer { lock.unlock() }
        guard _enabled else { return false }
        let charge = max(t.count, Self.tokenUnits(s.allocatedSequenceBytes))
        let active = max(t.count, reserveTokens, Self.tokenUnits(reserveSequenceBytes), charge)
        let allowance = _maxTokens - min(_maxTokens, active)
        guard charge <= allowance else { return false }
        if let existing = entries.firstIndex(where: { $0.tokens == t && $0.images == committedImages && $0.reusable }) {
            clock += 1; entries[existing].used = clock
            reserveActiveTokens(active)
            if entries.contains(where: { $0.tokens == t && $0.images == committedImages && $0.reusable }) { return true }
        }
        // Replace an ordinary duplicate before allocation. A producing active
        // state is still present outside the cache and occupies the fourth slot.
        if let duplicate = entries.firstIndex(where: { $0.tokens == t && $0.images == committedImages }) {
            entries.remove(at: duplicate); _evictions += 1
        }
        while !entries.isEmpty && (entries.count >= Self.maxEntries - 1
            || entries.reduce(0, { $0 + Self.charge($1) }) > allowance - charge) { evictLRU() }
        let frozen = try s.forkForPrefix()
        clock += 1
        entries.append(Entry(state: frozen, tokens: t, images: committedImages, used: clock, reusable: true))
        _checkpointStores += 1
        return true
    }

    private func evictLRU() {
        guard let lru = entries.enumerated().min(by: { $0.element.used < $1.element.used })?.offset
        else { return }
        entries.remove(at: lru)
        _evictions += 1
    }

    /// Apply a smaller live plan immediately, evicting until it is true.
    public func configure(maxTokens: Int) {
        lock.withLock {
            _maxTokens = min(max(0, maxTokens), budgetLimit ?? Int.max)
            while entries.reduce(0, { $0 + Self.charge($1) }) > _maxTokens {
                evictLRU()
            }
        }
    }

    /// Release everything held. Used by the governor when memory tightens and
    /// by `--no-prefix-cache`.
    public func drop() {
        lock.lock()
        defer { lock.unlock() }
        _evictions += entries.count
        entries.removeAll()
    }

    public func resetStats() {
        lock.lock()
        defer { lock.unlock() }
        _hits = 0
        _misses = 0
        _evictions = 0
        _checkpointHits = 0
        _checkpointStores = 0
        _checkpointForkFailures = 0
    }

    public func json() -> [String: Any] {
        lock.lock()
        let held = entries.reduce(0) { $0 + $1.tokens.count }
        let charged = entries.reduce(0) { $0 + Self.charge($1) }
        let allocated = entries.reduce(0) { $0 + $1.state.allocatedSequenceBytes }
        let n = entries.count
        let heldImages = entries.reduce(0) { $0 + $1.images.count }
        let checkpointCount = entries.filter(\.reusable).count
        let (checkpointHits, checkpointStores, forkFailures) = (_checkpointHits, _checkpointStores, _checkpointForkFailures)
        let (h, m, e, enabled, maxTokens) =
            (_hits, _misses, _evictions, _enabled, _maxTokens)
        lock.unlock()
        return [
            "enabled": enabled,
            "conversations": n,
            "max_conversations": Self.maxEntries,
            "held_tokens": held,
            "charged_token_capacity": charged,
            "allocated_sequence_bytes": allocated,
            "held_images": heldImages,
            "reusable_checkpoints": checkpointCount,
            "checkpoint_hits": checkpointHits,
            "checkpoint_stores": checkpointStores,
            "checkpoint_fork_failures": forkFailures,
            "held_gb": (Double(
                charged * Self.bytesPerToken + n * Self.fixedBytesPerEntry) / 1e9 * 100).rounded() / 100,
            "max_tokens": maxTokens,
            "hits": h,
            "misses": m,
            "evictions": e,
        ]
    }
}

````

## .build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/gpu/primitives.cpp

SHA-256 `ba131a55078dcbea487ee30e4919e88ed08505817034fa1e1e129d6855d00df8`; 9307bytes.

````
// Copyright © 2025 Apple Inc.

#include "mlx/primitives.h"
#include "mlx/backend/common/slicing.h"
#include "mlx/backend/common/utils.h"
#include "mlx/backend/gpu/copy.h"
#include "mlx/backend/gpu/slicing.h"

#if defined(MLX_USE_CUDA)
#include <nvtx3/nvtx3.hpp>
#endif

#include <cassert>

#if defined(MLX_USE_CUDA)
#define MLX_PROFILER_RANGE(message) nvtx3::scoped_range r(message)
#else
#define MLX_PROFILER_RANGE(message)
#endif

namespace mlx::core {

void AsStrided::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("AsStrided::eval_gpu");
  eval(inputs, out);
}

void AsType::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("AsType::eval_gpu");
  CopyType ctype =
      inputs[0].flags().contiguous ? CopyType::Vector : CopyType::General;
  copy_gpu(inputs[0], out, ctype);
}

void Broadcast::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("Broadcast::eval_gpu");
  eval(inputs, out);
}

void BroadcastAxes::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("BroadcastAxes::eval_gpu");
  eval(inputs, out);
}

void Concatenate::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("Concatenate::eval_gpu");
  concatenate_gpu(inputs, out, axis_, stream());
}

void Contiguous::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("Contiguous::eval_gpu");
  assert(inputs.size() == 1);
  auto& in = inputs[0];
  constexpr size_t extra_bytes = 16384;
  if (in.buffer_size() <= out.nbytes() + extra_bytes &&
      (in.flags().row_contiguous ||
       (allow_col_major_ && in.flags().col_contiguous))) {
    out.copy_shared_buffer(in);
  } else {
    copy_gpu(in, out, CopyType::General);
  }
}

void Copy::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("Copy::eval_gpu");
  eval(inputs, out);
}

void CustomTransforms::eval_gpu(
    const std::vector<array>& inputs,
    std::vector<array>& outputs) {
  MLX_PROFILER_RANGE("CustomTransforms::eval_gpu");
  eval(inputs, outputs);
}

void Depends::eval_gpu(
    const std::vector<array>& inputs,
    std::vector<array>& outputs) {
  MLX_PROFILER_RANGE("Depends::eval_gpu");
  eval(inputs, outputs);
}

void DynamicSlice::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("DynamicSlice::eval_gpu");
  if (out.size() == 0) {
    out.set_data(allocator::malloc(0));
    return;
  }

  auto& in = inputs[0];
  auto& start = inputs[1];
  out.set_data(allocator::malloc(out.nbytes()));

  auto s = stream();
  auto in_offset = compute_dynamic_offset(start, in.strides(), axes_, s);
  copy_gpu_inplace(
      /* const array& src = */ in,
      /* array& dst = */ out,
      /* const Shape& data_shape = */ out.shape(),
      /* const Strides& i_strides = */ in.strides(),
      /* const Strides& o_strides = */ out.strides(),
      /* int64_t i_offset = */ 0,
      /* int64_t o_offset = */ 0,
      /* CopyType ctype = */ CopyType::GeneralGeneral,
      /* const Stream& s = */ s,
      /* std::optional<array> dynamic_i_offset = */ std::move(in_offset),
      /* std::optional<array> dynamic_o_offset = */ std::nullopt);
}

void DynamicSliceUpdate::eval_gpu(
    const std::vector<array>& inputs,
    array& out) {
  MLX_PROFILER_RANGE("DynamicSliceUpdate::eval_gpu");
  if (out.size() == 0) {
    out.set_data(allocator::malloc(0));
    return;
  }

  auto& in = inputs[0];
  auto& upd = inputs[1];
  auto& start_indices = inputs[2];

  if (upd.size() == 0) {
    out.copy_shared_buffer(in);
    return;
  }

  // Copy or donate input to output
  auto s = stream();
  auto ctype = in.flags().contiguous && in.size() == in.data_size()
      ? CopyType::Vector
      : CopyType::General;
  copy_gpu(in, out, in.data_size() == 1 ? CopyType::Scalar : ctype, s);

  auto out_offset =
      compute_dynamic_offset(start_indices, out.strides(), axes_, s);
  copy_gpu_inplace(
      /* const array& src = */ upd,
      /* array& dst = */ out,
      /* const Shape& data_shape = */ upd.shape(),
      /* const Strides& i_strides = */ upd.strides(),
      /* const Strides& o_strides = */ out.strides(),
      /* int64_t i_offset = */ 0,
      /* int64_t o_offset = */ 0,
      /* CopyType ctype = */ CopyType::GeneralGeneral,
      /* const Stream& s = */ s,
      /* std::optional<array> dynamic_i_offset = */ std::nullopt,
      /* std::optional<array> dynamic_o_offset = */ std::move(out_offset));
}

void ExpandDims::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("ExpandDims::eval_gpu");
  eval(inputs, out);
}

void Full::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("Full::eval_gpu");
  auto in = inputs[0];
  CopyType ctype;
  if (in.data_size() == 1) {
    ctype = CopyType::Scalar;
  } else if (in.flags().contiguous) {
    ctype = CopyType::Vector;
  } else {
    ctype = CopyType::General;
  }
  copy_gpu(in, out, ctype);
}

void Flatten::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("Flatten::eval_gpu");
  reshape_gpu(inputs[0], out, stream());
}

void NumberOfElements::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("NumberOfElements::eval_gpu");
  eval(inputs, out);
}

void Pad::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("Pad::eval_gpu");
  // Inputs must be base input array and scalar val array
  assert(inputs.size() == 2);
  auto& in = inputs[0];
  auto& val = inputs[1];

  // Padding value must be a scalar
  assert(val.size() == 1);

  // Padding value, input and output must be of the same type
  assert(val.dtype() == in.dtype() && in.dtype() == out.dtype());

  pad_gpu(in, val, out, axes_, low_pad_size_, stream());
}

void Reshape::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("Reshape::eval_gpu");
  reshape_gpu(inputs[0], out, stream());
}

void Split::eval_gpu(
    const std::vector<array>& inputs,
    std::vector<array>& outputs) {
  MLX_PROFILER_RANGE("Split::eval_gpu");
  eval(inputs, outputs);
}

void Slice::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("Slice::eval_gpu");
  assert(inputs.size() == 1);
  if (out.size() == 0) {
    out.set_data(allocator::malloc(0));
    return;
  }

  auto& in = inputs[0];
  slice_gpu(in, out, start_indices_, strides_, stream());
}

void SliceUpdate::eval_gpu(const std::vector<array>& inputs, array& out) {
  assert(inputs.size() == 2);
  if (out.size() == 0) {
    out.set_data(allocator::malloc(0));
    return;
  }

  auto& in = inputs[0];
  auto& upd = inputs[1];

  if (upd.size() == 0) {
    out.copy_shared_buffer(in);
    return;
  }

  auto ctype = in.flags().contiguous && in.size() == in.data_size()
      ? CopyType::Vector
      : CopyType::General;
  copy_gpu(in, out, in.data_size() == 1 ? CopyType::Scalar : ctype, stream());
  auto [data_offset, out_strides] =
      prepare_slice(out, start_indices_, strides_);

  // Do copy
  copy_gpu_inplace(
      /* const array& src = */ upd,
      /* array& dst = */ out,
      /* const Shape& data_shape = */ upd.shape(),
      /* const Strides& i_strides = */ upd.strides(),
      /* const Strides& o_strides = */ out_strides,
      /* int64_t i_offset = */ 0,
      /* int64_t o_offset = */ data_offset,
      /* CopyType ctype = */ CopyType::GeneralGeneral,
      /* const Stream& s = */ stream());
}

void Squeeze::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("Squeeze::eval_gpu");
  eval(inputs, out);
}

void StopGradient::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("StopGradient::eval_gpu");
  eval(inputs, out);
}

void Transpose::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("Transpose::eval_gpu");
  eval(inputs, out);
}

void Unflatten::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("Unflatten::eval_gpu");
  reshape_gpu(inputs[0], out, stream());
}

void View::eval_gpu(const std::vector<array>& inputs, array& out) {
  MLX_PROFILER_RANGE("View::eval_gpu");
  auto& in = inputs[0];
  auto ibytes = size_of(in.dtype());
  auto obytes = size_of(out.dtype());
  // Conditions for buffer copying (disjunction):
  // - type size is the same
  // - type size is smaller and the last axis is contiguous
  // - the entire array is row contiguous
  if (ibytes == obytes || (obytes < ibytes && in.strides().back() == 1) ||
      in.flags().row_contiguous) {
    auto strides = in.strides();
    for (int i = 0; i < static_cast<int>(strides.size()) - 1; ++i) {
      strides[i] *= ibytes;
      strides[i] /= obytes;
    }
    out.copy_shared_buffer(
        in, strides, in.flags(), in.data_size() * ibytes / obytes);
  } else {
    auto tmp = array(in.shape(), in.dtype(), nullptr, {});
    tmp.set_data(allocator::malloc(tmp.nbytes()));
    copy_gpu_inplace(in, tmp, CopyType::General, stream());

    auto flags = out.flags();
    flags.contiguous = true;
    flags.row_contiguous = true;
    auto max_dim = std::max_element(out.shape().begin(), out.shape().end());
    flags.col_contiguous = out.size() <= 1 || out.size() == *max_dim;
    out.copy_shared_buffer(tmp, out.strides(), flags, out.size());
  }
}

} // namespace mlx::core

````

## .build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/array.h

SHA-256 `2afde69d4e1a00d6526b2127620e28f04b1a52e61873b9a708ac836ff8a1a57c`; 17613bytes.

````
// Copyright © 2023 Apple Inc.
#pragma once

#include <algorithm>
#include <cstdint>
#include <functional>
#include <memory>
#include <vector>

#include "mlx/allocator.h"
#include "mlx/api.h"
#include "mlx/dtype.h"
#include "mlx/event.h"
#include "mlx/small_vector.h"

namespace mlx::core {

// Forward declaration
class Primitive;

using Deleter = std::function<void(allocator::Buffer)>;
using ShapeElem = int32_t;
using Shape = SmallVector<ShapeElem>;
using Strides = SmallVector<int64_t>;

class MLX_API array {
  /* An array is really a node in a graph. It contains a shared ArrayDesc
   * object */

 public:
  /** Construct a scalar array with zero dimensions. */
  template <typename T>
  explicit array(T val, Dtype dtype = TypeToDtype<T>());

  /* Special case since std::complex can't be implicitly converted to other
   * types. */
  explicit array(const std::complex<float>& val, Dtype dtype = complex64);

  template <typename It>
  explicit array(
      It data,
      Shape shape,
      Dtype dtype =
          TypeToDtype<typename std::iterator_traits<It>::value_type>());

  template <typename T>
  explicit array(std::initializer_list<T> data, Dtype dtype = TypeToDtype<T>());

  /* Special case so empty lists default to float32. */
  explicit array(std::initializer_list<float> data);

  /* Special case so array({}, type) is an empty array. */
  explicit array(std::initializer_list<int> data, Dtype dtype);

  template <typename T>
  explicit array(
      std::initializer_list<T> data,
      Shape shape,
      Dtype dtype = TypeToDtype<T>());

  /* Build an array from a raw pointer. The constructor will attempt to use the
   * input data without a copy. The deleter will be called when the array no
   * longer needs the underlying memory - after the array is destroyed in the
   * no-copy case and after the copy otherwise. */
  explicit array(
      void* data,
      Shape shape,
      Dtype dtype,
      const std::function<void(void*)>& deleter);

  /* Build an array from a buffer */
  explicit array(
      allocator::Buffer data,
      Shape shape,
      Dtype dtype,
      Deleter deleter = allocator::free);

  /** Assignment to rvalue does not compile. */
  array& operator=(const array& other) && = delete;
  array& operator=(array&& other) && = delete;

  /** Default copy and move constructors otherwise. */
  array& operator=(array&& other) & = default;
  array(const array& other) = default;
  array(array&& other) = default;

  array& operator=(const array& other) & {
    if (this->id() != other.id()) {
      this->array_desc_ = other.array_desc_;
    }
    return *this;
  }

  /** The size of the array's datatype in bytes. */
  size_t itemsize() const {
    return size_of(dtype());
  }

  /** The number of elements in the array. */
  size_t size() const {
    return array_desc_->size;
  }

  /** The number of bytes in the array. */
  size_t nbytes() const {
    return size() * itemsize();
  }

  /** The number of dimensions of the array. */
  size_t ndim() const {
    return array_desc_->shape.size();
  }

  /** The shape of the array as a vector of integers. */
  const Shape& shape() const {
    return array_desc_->shape;
  }

  /**
   *  Get the size of the corresponding dimension.
   *
   *  This function supports negative indexing and provides
   *  bounds checking. */
  auto shape(int dim) const {
    return shape().at(dim < 0 ? dim + static_cast<int>(ndim()) : dim);
  }

  /** The strides of the array. */
  const Strides& strides() const {
    return array_desc_->strides;
  }

  /**
   *  Get the stride of the corresponding dimension.
   *
   *  This function supports negative indexing and provides
   *  bounds checking. */
  auto strides(int dim) const {
    return strides().at(dim < 0 ? dim + static_cast<int>(ndim()) : dim);
  }

  /** Get the arrays data type. */
  Dtype dtype() const {
    return array_desc_->dtype;
  }

  /** Evaluate the array. */
  void eval();

  /** Get the value from a scalar array. */
  template <typename T>
  T item();

  template <typename T>
  T item() const;

  struct MLX_API ArrayIterator {
    using iterator_category = std::random_access_iterator_tag;
    using difference_type = size_t;
    using value_type = const array;
    using reference = value_type;

    explicit ArrayIterator(const array& arr, int idx = 0);

    reference operator*() const;

    ArrayIterator& operator+(difference_type diff) {
      idx += diff;
      return *this;
    }

    ArrayIterator& operator++() {
      idx++;
      return *this;
    }

    friend bool operator==(const ArrayIterator& a, const ArrayIterator& b) {
      return a.arr.id() == b.arr.id() && a.idx == b.idx;
    }
    friend bool operator!=(const ArrayIterator& a, const ArrayIterator& b) {
      return !(a == b);
    }

   private:
    const array& arr;
    int idx;
  };

  ArrayIterator begin() const {
    return ArrayIterator(*this);
  }
  ArrayIterator end() const {
    return ArrayIterator(*this, shape(0));
  }

  /**
   * The following methods should be used with caution.
   * They are intended for use by the backend implementation and the
   * API may change.
   */

  array(
      Shape shape,
      Dtype dtype,
      std::shared_ptr<Primitive> primitive,
      std::vector<array> inputs);

  static std::vector<array> make_arrays(
      std::vector<Shape> shapes,
      const std::vector<Dtype>& dtypes,
      const std::shared_ptr<Primitive>& primitive,
      const std::vector<array>& inputs);

  /**
   * Get a new array that refers to the same data as the input but with a
   * non-owning pointer to it. Note the array is detached from the graph and has
   * no inputs, siblings or primitive.
   */
  static array unsafe_weak_copy(const array& other);

  /** A unique identifier for an array. */
  std::uintptr_t id() const {
    return reinterpret_cast<std::uintptr_t>(array_desc_.get());
  }

  /** A unique identifier for an arrays primitive. */
  std::uintptr_t primitive_id() const {
    return reinterpret_cast<std::uintptr_t>(array_desc_->primitive.get());
  }

  struct Data {
    allocator::Buffer buffer;
    Deleter d;
    Data(allocator::Buffer buffer, Deleter d = allocator::free)
        : buffer(buffer), d(d) {}
    // Not copyable
    Data(const Data& d) = delete;
    Data& operator=(const Data& d) = delete;
    Data(Data&& o) : buffer(o.buffer), d(o.d) {
      o.buffer = allocator::Buffer(nullptr);
      o.d = [](allocator::Buffer) {};
    }
    ~Data() {
      d(buffer);
    }
  };

  struct Flags {
    // True iff there are no gaps in the underlying data. Each item
    // in the underlying data buffer belongs to at least one index.
    //
    // True iff:
    // prod(shape[i] for i in range(ndim) if strides[i] > 0) == data_size()
    bool contiguous : 1;

    // True iff:
    // strides[-1] == 1 and
    // all(strides[i] == (shape[i+1]*strides[i+1]) or shape[i] == 1 for i in
    // range(ndim - 1))
    bool row_contiguous : 1;

    // True iff:
    // strides[0] == 1 and
    // all(strides[i] == (shape[i-1]*strides[i-1]) or shape[i] == 1 for i in
    // range(1, ndim))
    bool col_contiguous : 1;
  };

  /** The array's primitive. */
  Primitive& primitive() const {
    return *(array_desc_->primitive);
  }

  /** A shared pointer to the array's primitive. */
  std::shared_ptr<Primitive>& primitive_ptr() const {
    return array_desc_->primitive;
  }

  /** Check if the array has an attached primitive or is a leaf node. */
  bool has_primitive() const {
    return array_desc_->primitive != nullptr;
  }

  /** The array's inputs. */
  const std::vector<array>& inputs() const {
    return array_desc_->inputs;
  }

  std::vector<array>& inputs() {
    return array_desc_->inputs;
  }

  /** True indicates the arrays buffer is safe to reuse */
  bool is_donatable() const {
    return array_desc_.use_count() == 1 && (array_desc_->data.use_count() == 1);
  }

  /** The array's siblings. */
  const std::vector<array>& siblings() const {
    return array_desc_->siblings;
  }

  /** The array's siblings. */
  std::vector<array>& siblings() {
    return array_desc_->siblings;
  }

  /** The array's position in the sibling list. */
  int sibling_position() const {
    return array_desc_->position;
  }

  void set_siblings(std::vector<array> siblings, uint16_t position) {
    array_desc_->siblings = std::move(siblings);
    array_desc_->position = position;
  }

  /** The outputs of the array's primitive (i.e. this array and
   * its siblings) in the order the primitive expects. */
  std::vector<array> outputs() const {
    auto idx = array_desc_->position;
    std::vector<array> outputs;
    outputs.reserve(siblings().size() + 1);
    outputs.insert(outputs.end(), siblings().begin(), siblings().begin() + idx);
    outputs.push_back(*this);
    outputs.insert(outputs.end(), siblings().begin() + idx, siblings().end());
    return outputs;
  }

  /** Detach the array from the graph. */
  void detach();

  /** Get the Flags bit-field. */
  const Flags& flags() const {
    return array_desc_->flags;
  }

  /** The size (in elements) of the underlying buffer the array points to.
   *
   * This can be different than the actual size of the array if the array has
   * been broadcast or irregularly strided.  If ``first`` is the offset into
   * the data buffer of the first element of the array (i.e. the offset
   * corresponding to ``arr[0, 0, ...]``) and last is the offset into the
   * data buffer of the last element of the array (i.e. the offset
   * corresponding to ``arr[-1, -1, ...]``) then ``data_size = last - first``.
   * Note, ``data_size`` is in units of ``item_size`` (not bytes).
   **/
  size_t data_size() const {
    return array_desc_->data_size;
  }

  allocator::Buffer& buffer() {
    return array_desc_->data->buffer;
  }
  const allocator::Buffer& buffer() const {
    return array_desc_->data->buffer;
  }

  size_t buffer_size() const {
    return allocator::allocator().size(buffer());
  }

  // Return the shared pointer to the array::Data struct
  const std::shared_ptr<Data>& data_shared_ptr() const {
    return array_desc_->data;
  }

  // Return a raw pointer to the arrays data. This function may do a copy if
  // the underlying buffer is not accessible on the CPU. When accessing the
  // data for GPU kernels, be sure to use the correct method / function for the
  // given backend to access the GPU pointer.
  template <typename T>
  T* data() {
    return reinterpret_cast<T*>(
        (static_cast<char*>(buffer().raw_ptr()) + array_desc_->offset));
  }

  template <typename T>
  const T* data() const {
    return const_cast<array&>(*this).data<T>();
  }

  int64_t offset() const {
    return array_desc_->offset;
  }

  enum Status {
    // The output of a computation which has not been scheduled.
    // For example, the status of `x` in `auto x = a + b`.
    unscheduled,

    // The array's `eval_*` function has been run, but the computation is not
    // necessarily complete. The array will have memory allocated and if it is
    // not a tracer then it will be detached from the graph.
    evaluated,

    // If the array is the output of a computation then the computation
    // is complete. Constant arrays are always available (e.g. `array({1, 2,
    // 3})`)
    available
  };

  // Check if the array is safe to read.
  bool is_available() const;

  // Wait on the array to be available. After this `is_available` returns
  // `true`.
  void wait();

  Status status() const {
    return array_desc_->status;
  }

  void set_status(Status s) const {
    array_desc_->status = s;
  }

  // Get the array's shared event
  Event& event() const {
    return array_desc_->event;
  }

  // Attach an event to a not yet evaluated array
  void attach_event(Event e) const {
    array_desc_->event = std::move(e);
  }

  void detach_event() const {
    array_desc_->event = Event{};
  }

  // Mark the array as a tracer array (true) or not.
  void set_tracer(bool is_tracer) {
    array_desc_->is_tracer = is_tracer;
  }
  // Check if the array is a tracer array
  bool is_tracer() const;

  void set_data(allocator::Buffer buffer, Deleter d = allocator::free);

  void set_data(
      allocator::Buffer buffer,
      size_t data_size,
      Strides strides,
      Flags flags,
      Deleter d = allocator::free);

  void copy_shared_buffer(
      const array& other,
      const Strides& strides,
      Flags flags,
      size_t data_size,
      int64_t offset = 0);

  void copy_shared_buffer(const array& other);

  void overwrite_descriptor(const array& other) {
    array_desc_ = other.array_desc_;
  }

  ~array();

 private:
  // Initialize the arrays data
  template <typename It>
  void init(const It src);

  struct MLX_API ArrayDesc {
    Shape shape;
    Strides strides;
    size_t size;
    Dtype dtype;
    std::shared_ptr<Primitive> primitive;

    Status status;

    // An event on the array used for synchronization
    Event event;

    // Indicates an array is being used in a graph transform
    // and should not be detached from the graph
    bool is_tracer{false};

    // This is a shared pointer so that *different* arrays
    // can share the underlying data buffer.
    std::shared_ptr<Data> data;

    // Offset from beginning of data pointer
    int64_t offset{0};

    // The size in elements of the data buffer the array accesses
    size_t data_size{0};

    // Contains useful meta data about the array
    Flags flags{true, true, true};

    std::vector<array> inputs;
    // An array to keep track of the siblings from a multi-output
    // primitive.
    std::vector<array> siblings;
    // The arrays position in the output list
    uint32_t position{0};

    explicit ArrayDesc(Shape shape, Dtype dtype);

    explicit ArrayDesc(
        Shape shape,
        Dtype dtype,
        std::shared_ptr<Primitive> primitive,
        std::vector<array> inputs);

    ~ArrayDesc();

   private:
    // Initialize size, strides, and other metadata
    void init();
  };

  // The ArrayDesc contains the details of the materialized array including the
  // shape, strides, the data type. It also includes
  // the primitive which knows how to compute the array's data from its inputs
  // and the list of array's inputs for the primitive.
  std::shared_ptr<ArrayDesc> array_desc_;
};

template <typename T>
array::array(T val, Dtype dtype /* = TypeToDtype<T>() */)
    : array_desc_(std::make_shared<ArrayDesc>(Shape{}, dtype)) {
  init(&val);
}

template <typename It>
array::array(
  It data,
  Shape shape,
  Dtype dtype /* = TypeToDtype<typename std::iterator_traits<It>::value_type>() */) :
    array_desc_(std::make_shared<ArrayDesc>(std::move(shape), dtype)) {
  init(data);
}

template <typename T>
array::array(
    std::initializer_list<T> data,
    Dtype dtype /* = TypeToDtype<T>() */)
    : array_desc_(
          std::make_shared<ArrayDesc>(
              Shape{static_cast<ShapeElem>(data.size())},
              dtype)) {
  init(data.begin());
}

template <typename T>
array::array(
    std::initializer_list<T> data,
    Shape shape,
    Dtype dtype /* = TypeToDtype<T>() */)
    : array_desc_(std::make_shared<ArrayDesc>(std::move(shape), dtype)) {
  if (data.size() != size()) {
    throw std::invalid_argument(
        "Data size and provided shape mismatch in array construction.");
  }
  init(data.begin());
}

template <typename T>
T array::item() {
  if (size() != 1) {
    throw std::invalid_argument("item can only be called on arrays of size 1.");
  }
  eval();
  return *data<T>();
}

template <typename T>
T array::item() const {
  if (size() != 1) {
    throw std::invalid_argument("item can only be called on arrays of size 1.");
  }
  if (status() == Status::unscheduled) {
    throw std::invalid_argument(
        "item() const can only be called on evaled arrays");
  }
  const_cast<array*>(this)->eval();
  return *data<T>();
}

template <typename It>
void array::init(It src) {
  set_data(allocator::malloc(size() * size_of(dtype())));
  switch (dtype()) {
    case bool_:
      std::copy(src, src + size(), data<bool>());
      break;
    case uint8:
      std::copy(src, src + size(), data<uint8_t>());
      break;
    case uint16:
      std::copy(src, src + size(), data<uint16_t>());
      break;
    case uint32:
      std::copy(src, src + size(), data<uint32_t>());
      break;
    case uint64:
      std::copy(src, src + size(), data<uint64_t>());
      break;
    case int8:
      std::copy(src, src + size(), data<int8_t>());
      break;
    case int16:
      std::copy(src, src + size(), data<int16_t>());
      break;
    case int32:
      std::copy(src, src + size(), data<int32_t>());
      break;
    case int64:
      std::copy(src, src + size(), data<int64_t>());
      break;
    case float16:
      std::copy(src, src + size(), data<float16_t>());
      break;
    case float32:
      std::copy(src, src + size(), data<float>());
      break;
    case float64:
      std::copy(src, src + size(), data<double>());
      break;
    case bfloat16:
      std::copy(src, src + size(), data<bfloat16_t>());
      break;
    case complex64:
      std::copy(src, src + size(), data<complex64_t>());
      break;
  }
}

/* Utilities for determining whether a template parameter is array. */
template <typename T>
inline constexpr bool is_array_v =
    std::is_same_v<std::remove_cv_t<std::remove_reference_t<T>>, array>;

template <typename... T>
inline constexpr bool is_arrays_v = (is_array_v<T> && ...);

template <typename... T>
using enable_for_arrays_t = typename std::enable_if_t<is_arrays_v<T...>>;

} // namespace mlx::core

````

## .build/checkouts/mlx-swift/Source/Cmlx/mlx/mlx/backend/metal/custom_kernel.cpp

SHA-256 `135931356e9ff0268d2db65f74c8ccd92ca0a4a99ead73fa6fe4918bb5b92f75`; 13718bytes.

````
// Copyright © 2024 Apple Inc.

#include <iostream>
#include <regex>

#include "mlx/backend/common/compiled.h"
#include "mlx/backend/gpu/copy.h"
#include "mlx/backend/metal/jit/includes.h"
#include "mlx/backend/metal/utils.h"
#include "mlx/fast.h"
#include "mlx/fast_primitives.h"
#include "mlx/utils.h"

namespace mlx::core::fast {

struct CustomKernelCache {
  std::unordered_map<std::string, std::string> libraries;
};

static CustomKernelCache& cache() {
  static CustomKernelCache cache_;
  return cache_;
};

std::string write_signature(
    std::string func_name,
    const std::string& header,
    const std::string& source,
    const std::vector<std::string>& input_names,
    const std::vector<array>& inputs,
    const std::vector<std::string>& output_names,
    const std::vector<Dtype>& output_dtypes,
    const std::vector<std::pair<std::string, TemplateArg>>& template_args,
    const std::vector<std::string>& attributes,
    const std::vector<std::tuple<bool, bool, bool>>& shape_infos,
    bool atomic_outputs) {
  std::string kernel_source;
  kernel_source.reserve(header.size() + source.size() + 16384);
  kernel_source += header;
  // Auto-generate a function signature based on `template_args`
  // and the dtype/shape of the arrays passed as `inputs`.
  if (!template_args.empty()) {
    kernel_source += "template <";
    int i = 0;
    for (const auto& [name, arg] : template_args) {
      std::string param_type;
      if (std::holds_alternative<int>(arg)) {
        param_type = "int";
      } else if (std::holds_alternative<bool>(arg)) {
        param_type = "bool";
      } else if (std::holds_alternative<Dtype>(arg)) {
        param_type = "typename";
      }
      if (i > 0) {
        kernel_source += ", ";
      }
      kernel_source += param_type;
      kernel_source += " ";
      kernel_source += name;
      i++;
    }
    kernel_source += ">\n";
  }
  kernel_source += "[[kernel]] void ";
  kernel_source += func_name;
  kernel_source += "(\n";

  int index = 0;
  constexpr int max_constant_array_size = 8;
  // Add inputs
  for (int i = 0; i < inputs.size(); ++i) {
    const auto& name = input_names[i];
    const auto& arr = inputs[i];
    auto dtype = get_type_string(arr.dtype());
    std::string location =
        arr.size() < max_constant_array_size ? "constant" : "device";
    std::string ref = arr.ndim() == 0 ? "&" : "*";
    kernel_source += "  const ";
    kernel_source += location;
    kernel_source += " ";
    kernel_source += dtype;
    kernel_source += ref;
    kernel_source += " ";
    kernel_source += name;
    kernel_source += " [[buffer(";
    kernel_source += std::to_string(index);
    kernel_source += ")]],\n";
    index++;
    // Add input shape, strides and ndim if present in the source
    if (arr.ndim() > 0) {
      if (std::get<0>(shape_infos[i])) {
        kernel_source +=
            ("  const constant int* " + name + "_shape [[buffer(" +
             std::to_string(index) + ")]],\n");
        index++;
      }
      if (std::get<1>(shape_infos[i])) {
        kernel_source +=
            ("  const constant int64_t* " + name + "_strides [[buffer(" +
             std::to_string(index) + ")]],\n");
        index++;
      }
      if (std::get<2>(shape_infos[i])) {
        kernel_source +=
            ("  const constant int& " + name + "_ndim [[buffer(" +
             std::to_string(index) + ")]],\n");
        index++;
      }
    }
  }
  // Add outputs
  for (int i = 0; i < output_names.size(); ++i) {
    const auto& name = output_names[i];
    const auto& dtype = output_dtypes[i];
    kernel_source += "  device ";
    auto type_string = get_type_string(dtype);
    if (atomic_outputs) {
      kernel_source += "atomic<";
    }
    kernel_source += type_string;
    if (atomic_outputs) {
      kernel_source += ">";
    }
    kernel_source += "* ";
    kernel_source += name;
    kernel_source += " [[buffer(";
    kernel_source += std::to_string(index);
    kernel_source += ")]]";
    if (index < inputs.size() + output_names.size() - 1 ||
        attributes.size() > 0) {
      kernel_source += ",\n";
    } else {
      kernel_source += ") {\n";
    }
    index++;
  }

  index = 0;
  for (const auto& attr : attributes) {
    kernel_source += attr;
    if (index < attributes.size() - 1) {
      kernel_source += ",\n";
    } else {
      kernel_source += ") {\n";
    }
    index++;
  }
  kernel_source += source;
  kernel_source += "\n}\n";
  return kernel_source;
}

std::string write_template(
    const std::vector<std::pair<std::string, TemplateArg>>& template_args) {
  std::ostringstream template_def;
  template_def << "<";
  int i = 0;
  for (const auto& [name, arg] : template_args) {
    if (i > 0) {
      template_def << ", ";
    }
    if (std::holds_alternative<int>(arg)) {
      template_def << std::get<int>(arg);
    } else if (std::holds_alternative<bool>(arg)) {
      template_def << std::get<bool>(arg);
    } else if (std::holds_alternative<Dtype>(arg)) {
      template_def << get_type_string(std::get<Dtype>(arg));
    }
    i++;
  }
  template_def << ">";
  return template_def.str();
}

CustomKernelFunction metal_kernel(
    const std::string& name,
    const std::vector<std::string>& input_names,
    const std::vector<std::string>& output_names,
    const std::string& source,
    const std::string& header /* = "" */,
    bool ensure_row_contiguous /* = true */,
    bool atomic_outputs /* = false */) {
  if (output_names.empty()) {
    throw std::invalid_argument(
        "[metal_kernel] Must specify at least one output.");
  }
  std::vector<std::tuple<bool, bool, bool>> shape_infos;
  for (auto& n : input_names) {
    std::tuple<bool, bool, bool> shape_info;
    std::get<0>(shape_info) = source.find(n + "_shape") != std::string::npos;
    std::get<1>(shape_info) = source.find(n + "_strides") != std::string::npos;
    std::get<2>(shape_info) = source.find(n + "_ndim") != std::string::npos;
    shape_infos.push_back(shape_info);
  }
  const std::vector<std::pair<std::string, std::string>> metal_attributes = {
      {"dispatch_quadgroups_per_threadgroup", "uint"},
      {"dispatch_simdgroups_per_threadgroup", "uint"},
      {"dispatch_threads_per_threadgroup", "uint3"},
      {"grid_origin", "uint3"},
      {"grid_size", "uint3"},
      {"quadgroup_index_in_threadgroup", "uint"},
      {"quadgroups_per_threadgroup", "uint"},
      {"simdgroup_index_in_threadgroup", "uint"},
      {"simdgroups_per_threadgroup", "uint"},
      {"thread_execution_width", "uint"},
      {"thread_index_in_quadgroup", "uint"},
      {"thread_index_in_simdgroup", "uint"},
      {"thread_index_in_threadgroup", "uint"},
      {"thread_position_in_grid", "uint3"},
      {"thread_position_in_threadgroup", "uint3"},
      {"threadgroup_position_in_grid", "uint3"},
      {"threadgroups_per_grid", "uint3"},
      {"threads_per_grid", "uint3"},
      {"threads_per_simdgroup", "uint"},
      {"threads_per_threadgroup", "uint3"},
  };

  std::vector<std::string> attributes;
  for (const auto& [attr, dtype] : metal_attributes) {
    if (source.find(attr) != std::string::npos) {
      attributes.push_back("  " + dtype + " " + attr + " [[" + attr + "]]");
    }
  }

  return [=,
          shape_infos = std::move(shape_infos),
          attributes = std::move(attributes)](
             const std::vector<array>& inputs,
             const std::vector<Shape>& output_shapes,
             const std::vector<Dtype>& output_dtypes,
             std::tuple<int, int, int> grid,
             std::tuple<int, int, int> threadgroup,
             const std::vector<std::pair<std::string, TemplateArg>>&
                 template_args = {},
             std::optional<float> init_value = std::nullopt,
             bool verbose = false,
             StreamOrDevice s_ = {}) {
    if (inputs.size() != input_names.size()) {
      std::ostringstream msg;
      msg << "[metal_kernel] Expected `inputs` to have size "
          << input_names.size() << " but got size " << inputs.size() << "."
          << std::endl;
      throw std::invalid_argument(msg.str());
    }
    if (output_shapes.size() != output_names.size()) {
      std::ostringstream msg;
      msg << "[metal_kernel] Expected `output_shapes` to have size "
          << output_names.size() << " but got size " << output_shapes.size()
          << "." << std::endl;
      throw std::invalid_argument(msg.str());
    }
    if (output_dtypes.size() != output_names.size()) {
      std::ostringstream msg;
      msg << "[metal_kernel] Expected `output_dtypes` to have size "
          << output_names.size() << " but got size " << output_dtypes.size()
          << "." << std::endl;
      throw std::invalid_argument(msg.str());
    }

    auto s = to_stream(s_);
    if (s.device != Device::gpu) {
      throw std::invalid_argument("[metal_kernel] Only supports the GPU.");
    }

    std::string kernel_name = "custom_kernel_" + name;
    std::string template_def = "";
    if (!template_args.empty()) {
      std::regex disallowed_chars("\\<|\\>|(, )");
      template_def = write_template(template_args);
      auto template_hash =
          std::regex_replace(template_def, disallowed_chars, "_");
      template_hash.pop_back();
      kernel_name += "_";
      kernel_name += template_hash;
    }

    std::string kernel_source = write_signature(
        kernel_name,
        header,
        source,
        input_names,
        inputs,
        output_names,
        output_dtypes,
        template_args,
        attributes,
        shape_infos,
        atomic_outputs);

    if (!template_args.empty()) {
      template_def = kernel_name + template_def;
      kernel_source += "\ntemplate [[host_name(\"";
      kernel_source += kernel_name;
      kernel_source += "\")]] [[kernel]] decltype(";
      kernel_source += template_def;
      kernel_source += ") ";
      kernel_source += template_def;
      kernel_source += ";\n";
    }

    if (verbose) {
      std::cout << "Generated source code for `" << name << "`:" << std::endl
                << "```" << std::endl
                << kernel_source << std::endl
                << "```" << std::endl;
    }

    return array::make_arrays(
        std::move(output_shapes),
        std::move(output_dtypes),
        std::make_shared<CustomKernel>(
            s,
            std::move(kernel_name),
            std::move(kernel_source),
            grid,
            threadgroup,
            shape_infos,
            ensure_row_contiguous,
            init_value,
            std::vector<ScalarArg>{},
            false,
            0),
        std::move(inputs));
  };
}

void CustomKernel::eval_gpu(
    const std::vector<array>& inputs,
    std::vector<array>& outputs) {
  // silence some warnings
  (void)is_precompiled_;
  (void)shared_memory_;

  auto& s = stream();

  std::vector<array> copies;

  for (auto& out : outputs) {
    if (init_value_) {
      copies.emplace_back(init_value_.value(), out.dtype());
      fill_gpu(copies.back(), out, s);
    } else {
      out.set_data(allocator::malloc(out.nbytes()));
    }
  }

  auto check_input = [&copies, &s, this](const array& x) -> const array {
    bool no_copy = x.flags().row_contiguous;
    if (!ensure_row_contiguous_ || no_copy) {
      return x;
    } else {
      copies.push_back(array(x.shape(), x.dtype(), nullptr, {}));
      copy_gpu(x, copies.back(), CopyType::General, s);
      return copies.back();
    }
  };
  std::vector<array> checked_inputs;
  for (const array& in : inputs) {
    checked_inputs.push_back(check_input(in));
  }

  auto& d = metal::device(s.device);

  {
    // Clear kernels from the device library cache if needed
    auto& kernel_cache = cache();
    if (auto it = kernel_cache.libraries.find(name_);
        it != kernel_cache.libraries.end()) {
      if (it->second != source_) {
        auto& d = metal::device(s.device);
        d.clear_library(name_);
        it->second = source_;
      }
    } else {
      kernel_cache.libraries.emplace(name_, source_);
    }
  }

  auto lib = d.get_library(name_, [this] { return metal::utils() + source_; });
  auto kernel = d.get_kernel(name_, lib);
  auto& compute_encoder = d.get_command_encoder(s.index);
  compute_encoder.set_compute_pipeline_state(kernel);
  int index = 0;
  for (int i = 0; i < checked_inputs.size(); i++) {
    const array& in = checked_inputs[i];
    auto& shape_info = shape_infos_[i];
    compute_encoder.set_input_array(in, index);
    index++;
    if (in.ndim() > 0) {
      int ndim = in.ndim();
      if (std::get<0>(shape_info)) {
        compute_encoder.set_vector_bytes(in.shape(), ndim, index);
        index++;
      }
      if (std::get<1>(shape_info)) {
        compute_encoder.set_vector_bytes(in.strides(), ndim, index);
        index++;
      }
      if (std::get<2>(shape_info)) {
        compute_encoder.set_bytes(ndim, index);
        index++;
      }
    }
  }
  for (auto& out : outputs) {
    compute_encoder.set_output_array(out, index);
    index++;
  }

  const auto [tx, ty, tz] = threadgroup_;
  auto tg_size = tx * ty * tz;
  auto max_tg_size = kernel->maxTotalThreadsPerThreadgroup();
  if (tg_size > max_tg_size) {
    std::ostringstream msg;
    msg << "Thread group size (" << tg_size << ") is greater than "
        << " the maximum allowed threads per threadgroup (" << max_tg_size
        << ").";
    throw std::invalid_argument(msg.str());
  }

  const auto [gx, gy, gz] = grid_;
  MTL::Size group_dims =
      MTL::Size(std::min(tx, gx), std::min(ty, gy), std::min(tz, gz));
  MTL::Size grid_dims = MTL::Size(gx, gy, gz);
  compute_encoder.dispatch_threads(grid_dims, group_dims);

  d.add_temporaries(std::move(copies), s.index);
}

} // namespace mlx::core::fast

````

