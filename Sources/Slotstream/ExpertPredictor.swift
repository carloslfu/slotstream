// Expert Lookahead predictor packs: a whole-pass ranking network (G64/G128/
// G256) or a static frequency table, loaded from an explicit local path and
// validated against the model geometry before any allocation.
//
// The network is `12,800 -> width -> 24,576` with SiLU and biases, plus one
// hidden bias per forecast position. Each input block (the 10,240-wide
// context and the 2,560-wide embedding) is RMS-normalized with epsilon 1e-6
// and no learned weight. The output is read as 48 independent 512-expert
// score vectors; the three positions are joined by taking the maximum score
// per (layer, expert). Scores rank candidates; they never touch routing.

import CryptoKit
import Foundation
import MLX
import MLXFast

package struct ExpertPredictorPackDescription: Codable {
    package var schema: String
    package var kind: String
    package var width: Int?
    package var input: Int
    package var output: Int
    package var positions: Int?
    package var layers: Int
    package var experts: Int
    package var context: Int
    package var embedding: Int
    package var normEps: Float
    package var dtype: String
    package var tensors: String
    package var tensorsSha256: String
    package var checkpointIdentity: String?
    package var training: [String: String]?
}

package final class ExpertPredictor {
    package enum Kind: String { case mlp, table }
    package let kind: Kind
    package let identity: String
    package let description: ExpertPredictorPackDescription
    package let device: ExpertPrefetchConfiguration.Device
    private let w1: MLXArray?
    private let b1: MLXArray?
    private let w2: MLXArray?
    private let b2: MLXArray?
    private let positionBias: MLXArray?
    private let table: MLXArray?
    private let layers: Int
    private let experts: Int
    private let contextWidth: Int
    private let embeddingWidth: Int
    private let eps: Float
    private let ones: (MLXArray, MLXArray)
    package private(set) var forecasts = 0
    package private(set) var forecastSeconds = 0.0
    package var residentBytes: Int {
        [w1, b1, w2, b2, positionBias, table].compactMap { $0?.nbytes }.reduce(0, +)
    }

    package static func packURL(_ path: String) -> URL {
        var url = URL(fileURLWithPath: path)
        var isDirectory: ObjCBool = false
        if FileManager.default.fileExists(atPath: url.path, isDirectory: &isDirectory), isDirectory.boolValue {
            url = url.appendingPathComponent("pack.json")
        }
        return url
    }

    /// Validate geometry, identity and finiteness before the caller allocates
    /// the model. A missing, malformed or incompatible pack throws here.
    package init(packPath: String, cfg: ModelConfig, device: ExpertPrefetchConfiguration.Device = .gpu) throws {
        let url = Self.packURL(packPath)
        guard FileManager.default.fileExists(atPath: url.path) else {
            throw ModelError("expert prediction pack not found at \(url.path)")
        }
        let data = try Data(contentsOf: url)
        let description: ExpertPredictorPackDescription
        do { description = try JSONDecoder().decode(ExpertPredictorPackDescription.self, from: data) }
        catch { throw ModelError("expert prediction pack \(url.path) is malformed: \(error)") }
        guard description.schema == "expert-lookahead-pack-v1" else {
            throw ModelError("unsupported expert prediction pack schema \(description.schema)")
        }
        guard let kind = Kind(rawValue: description.kind) else { throw ModelError("unknown pack kind \(description.kind)") }
        guard description.layers == cfg.numLayers, description.experts == cfg.numExperts,
              description.context == cfg.hcCount * cfg.hiddenSize, description.embedding == cfg.hiddenSize,
              description.input == description.context + description.embedding,
              description.output == cfg.numLayers * cfg.numExperts else {
            throw ModelError("expert prediction pack geometry does not match the model configuration")
        }
        let tensorsURL = url.deletingLastPathComponent().appendingPathComponent(description.tensors)
        guard FileManager.default.fileExists(atPath: tensorsURL.path) else {
            throw ModelError("expert prediction pack tensors missing: \(tensorsURL.path)")
        }
        let tensorData = try Data(contentsOf: tensorsURL)
        let digest = SHA256.hash(data: tensorData).map { String(format: "%02x", $0) }.joined()
        guard digest == description.tensorsSha256 else {
            throw ModelError("expert prediction pack tensors do not match their declared SHA-256")
        }
        let arrays = try loadArrays(data: tensorData)
        func need(_ name: String, _ shape: [Int]) throws -> MLXArray {
            guard let a = arrays[name] else { throw ModelError("expert prediction pack is missing tensor \(name)") }
            guard a.shape == shape else { throw ModelError("expert prediction pack tensor \(name) has shape \(a.shape), expected \(shape)") }
            let value = a.asType(.float32)
            eval(value)
            guard isFinite(value).all().item(Bool.self) else { throw ModelError("expert prediction pack tensor \(name) is not finite") }
            return a.dtype == .float16 ? a : value
        }
        self.kind = kind; self.identity = digest; self.description = description; self.device = device
        self.layers = cfg.numLayers; self.experts = cfg.numExperts
        self.contextWidth = description.context; self.embeddingWidth = description.embedding
        self.eps = description.normEps
        switch kind {
        case .mlp:
            guard let width = description.width, width > 0 else { throw ModelError("expert prediction pack declares no width") }
            let positions = description.positions ?? 3
            w1 = try need("w1", [width, description.input])
            b1 = try need("b1", [width])
            w2 = try need("w2", [description.output, width])
            b2 = try need("b2", [description.output])
            positionBias = try need("position_bias", [positions, width])
            table = nil
        case .table:
            table = try need("scores", [description.layers, description.experts])
            w1 = nil; b1 = nil; w2 = nil; b2 = nil; positionBias = nil
        }
        ones = (MLXArray.ones([contextWidth], dtype: .float32), MLXArray.ones([embeddingWidth], dtype: .float32))
        eval(ones.0, ones.1)
    }

    /// Per-layer ranked candidate expert IDs above `threshold`, at most `top`.
    package func rankedCandidates(_ features: [ExpertLookaheadStartFeature], top: Int, threshold: Float) -> [[Int32]] {
        let started = RuntimeClock.now()
        defer { forecasts += 1; forecastSeconds += RuntimeClock.seconds(since: started) }
        let flat = unionScores(features)
        var result: [[Int32]] = []
        result.reserveCapacity(layers)
        for layer in 0 ..< layers {
            let base = layer * experts
            var indexed: [(Float, Int32)] = []
            indexed.reserveCapacity(experts)
            for e in 0 ..< experts {
                let s = flat[base + e]
                if s >= threshold { indexed.append((s, Int32(e))) }
            }
            if indexed.count > top {
                indexed.sort { $0.0 != $1.0 ? $0.0 > $1.0 : $0.1 < $1.1 }
                indexed.removeLast(indexed.count - top)
            } else {
                indexed.sort { $0.0 != $1.0 ? $0.0 > $1.0 : $0.1 < $1.1 }
            }
            result.append(indexed.map(\.1))
        }
        return result
    }

    /// Maximum score over the supplied positions, flattened as layer * experts.
    package func unionScores(_ features: [ExpertLookaheadStartFeature]) -> [Float] {
        let scores = self.scores(features)
        return scores.asArray(Float.self)
    }

    /// Scores for every position: [positions, layers * experts] float32.
    package func scores(_ features: [ExpertLookaheadStartFeature]) -> MLXArray {
        let stream: StreamOrDevice = device == .cpu ? .cpu : .gpu
        if let table {
            let flat = table.reshaped([1, layers * experts]).asType(.float32)
            return flat
        }
        guard let w1, let b1, let w2, let b2, let positionBias, !features.isEmpty else {
            return MLXArray.zeros([1, layers * experts], dtype: .float32)
        }
        var rows: [MLXArray] = []
        var biases: [MLXArray] = []
        let positions = positionBias.dim(0)
        for feature in features {
            let context = feature.context.reshaped([contextWidth]).asType(.float32, stream: stream)
            let embedding = feature.embedding.reshaped([embeddingWidth]).asType(.float32, stream: stream)
            let normalizedContext = MLXFast.rmsNorm(context, weight: ones.0, eps: eps, stream: stream)
            let normalizedEmbedding = MLXFast.rmsNorm(embedding, weight: ones.1, eps: eps, stream: stream)
            rows.append(concatenated([normalizedContext, normalizedEmbedding], axis: 0, stream: stream))
            biases.append(positionBias[min(max(0, feature.kind), positions - 1)].asType(.float32, stream: stream))
        }
        let x = stacked(rows, axis: 0, stream: stream)
        let hidden = MLXNNSilu(matmul(x, w1.asType(.float32, stream: stream).transposed(stream: stream), stream: stream)
            + b1.asType(.float32, stream: stream) + stacked(biases, axis: 0, stream: stream), stream: stream)
        let out = matmul(hidden, w2.asType(.float32, stream: stream).transposed(stream: stream), stream: stream)
            + b2.asType(.float32, stream: stream)
        let union = out.max(axis: 0, keepDims: true, stream: stream)
        eval(union)
        return union
    }
}

/// SiLU without importing MLXNN into this file's public surface.
@inline(__always) private func MLXNNSilu(_ x: MLXArray, stream: StreamOrDevice) -> MLXArray {
    x * sigmoid(x, stream: stream)
}
