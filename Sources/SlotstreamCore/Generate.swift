// Prefill + decode loop with sampling, stop tokens, and streaming callbacks.

import Foundation
import MLX

public struct SampleParams {
    public var temperature: Float = 0.7
    public var topP: Float = 0.8
    public var topK: Int = 20
    public var minP: Float = 0
    public var presencePenalty: Float = 1.5
    public var seed: UInt64? = nil
    public var maxTokens = 512

    public init() {}

    public static var instruct: SampleParams { SampleParams() }
    public static var thinking: SampleParams {
        var p = SampleParams()
        p.temperature = 1.0
        p.topP = 0.95
        p.presencePenalty = 0
        return p
    }
    public static var greedy: SampleParams {
        var p = SampleParams()
        p.temperature = 0
        p.presencePenalty = 0
        return p
    }
}

public struct GenStats {
    public var prefillTokens = 0
    public var prefillSeconds = 0.0
    public var decodeTokens = 0
    public var decodeSeconds = 0.0
    public var expertHitRate = 0.0
    public var ngramRowHits = 0
    public var ngramRowMisses = 0
    public var peakMemoryGB = 0.0

    public var prefillTPS: Double { prefillSeconds > 0 ? Double(prefillTokens) / prefillSeconds : 0 }
    public var decodeTPS: Double { decodeSeconds > 0 ? Double(decodeTokens) / decodeSeconds : 0 }
}

public final class Generator {
    public let model: Qwen4ExpModel
    let prefillChunk = 256
    var rngState: UInt64 = 0x9E37_79B9_7F4A_7C15

    public init(model: Qwen4ExpModel) {
        self.model = model
    }

    func sample(_ logits: MLXArray, params: SampleParams, generated: Set<Int>) -> Int {
        var l = logits.reshaped([-1]).asType(.float32)
        if params.presencePenalty != 0 && !generated.isEmpty {
            // subtract penalty on already-generated tokens
            let ids = MLXArray(generated.map { Int32($0) })
            let current = take(l, ids, axis: 0)
            l = putAlong(l, ids, values: current - params.presencePenalty, axis: 0)
        }
        if params.temperature <= 0 {
            return argMax(l).item(Int.self)
        }
        l = l / params.temperature
        if params.topK > 0 && params.topK < l.dim(0) {
            let kth = takeAlong(
                l, argPartition(-l, kth: params.topK - 1)[..<params.topK], axis: 0
            ).min()
            l = which(l .< kth, MLXArray(-Float.infinity), l)
        }
        var probs = softmax(l, axis: -1)
        if params.topP < 1 {
            let order = argSort(-probs)
            let sorted = take(probs, order, axis: 0)
            let cum = cumsum(sorted, axis: 0)
            let keepSorted = (cum - sorted) .< params.topP  // keep until cumulative prob (exclusive) reaches topP
            var keep = MLXArray.zeros([probs.dim(0)], dtype: .bool)
            keep = putAlong(keep, order, values: keepSorted, axis: 0)
            probs = which(keep, probs, MLXArray(Float(0)))
        }
        if params.minP > 0 {
            let cutoff = probs.max() * params.minP
            probs = which(probs .< cutoff, MLXArray(Float(0)), probs)
        }
        probs = probs / probs.sum()
        // gumbel-free categorical: inverse CDF with a splitmix stream
        rngState = Splitmix.mix(rngState &+ 1)
        let u = Float(Double(rngState >> 11) / Double(1 << 53))
        let cdf = cumsum(probs, axis: 0)
        let pick = (cdf .< u).sum().item(Int.self)
        return min(pick, probs.dim(0) - 1)
    }

    /// Runs prefill + decode; calls `onToken` for each generated token id.
    /// Returns (tokenIds, stats). `stop` checked between tokens (cancellation).
    public func generate(
        promptIds: [Int], params: SampleParams, eosIds: Set<Int>,
        onToken: ((Int) -> Bool)? = nil
    ) -> ([Int], GenStats) {
        if let s = params.seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
        var stats = GenStats()
        let state = model.makeState()
        MLX.GPU.resetPeakMemory()

        // ---- prefill in chunks
        var t0 = Date()
        var logits: MLXArray = MLXArray(0)
        var i = 0
        while i < promptIds.count {
            let hi = min(i + prefillChunk, promptIds.count)
            let chunk = Array(promptIds[i ..< hi])
            if hi == promptIds.count {
                logits = model.lastLogits(chunk, state: state)
                eval(logits)
            } else {
                let h = model.hiddenStates(chunk, state: state)
                eval(h)
            }
            i = hi
        }
        stats.prefillTokens = promptIds.count
        stats.prefillSeconds = -t0.timeIntervalSinceNow
        model.pool.resetStats()

        // ---- decode
        var out: [Int] = []
        var generated = Set<Int>()
        t0 = Date()
        for _ in 0 ..< params.maxTokens {
            let tok = sample(logits, params: params, generated: generated)
            if eosIds.contains(tok) { break }
            out.append(tok)
            generated.insert(tok)
            if let cb = onToken, !cb(tok) { break }
            logits = model.lastLogits([tok], state: state)
            eval(logits)
        }
        stats.decodeTokens = out.count
        stats.decodeSeconds = -t0.timeIntervalSinceNow
        stats.expertHitRate = model.pool.hitRate
        stats.ngramRowHits = model.ngram.rowHits
        stats.ngramRowMisses = model.ngram.rowMisses
        stats.peakMemoryGB = Double(MLX.GPU.peakMemory) / 1e9
        return (out, stats)
    }
}
