import Foundation
import MLX

/// Bounded candidate generation for qualification. Uses the production sampler
/// and owned target checkpoints; it is not a public Engine or pack admission.
package enum VQGenerationProbe {
    package struct Result {
        package let tokens: [Int]
        package let consumedTokens: Int
        package let reason: String
        package let drafted: Int
        package let accepted: Int
        package let rngState: UInt64
    }

    package static func generate(model: VQModelProbe, prompt: [Int], params: SampleParams,
        draftDepth: Int, eosIDs: Set<Int>, shouldContinue: () -> Bool = { true },
        onToken: ((Int) -> Bool)? = nil, outputLimit: Int = 128) throws -> Result {
        let params = params.sanitized()
        guard model.consumedTokens == 0, !prompt.isEmpty, (0...4).contains(draftDepth),
              [128, 512, 1024, 2048].contains(outputLimit),
              params.maxTokens <= outputLimit, prompt.count + params.maxTokens <= model.contextLimit,
              draftDepth == 0 || model.hasDraft else {
            throw ModelError("candidate generation requires an empty bounded state and an explicitly loaded draft")
        }
        var sampler = Sampler(seed: params.seed), generated = Set<Int>(), tokens: [Int] = []
        var drafted = 0, accepted = 0, reason = "length"
        var logits: MLXArray?
        for lo in stride(from: 0, to: prompt.count, by: 512) {
            let checkpoint = try model.snapshot()
            do {
                logits = try autoreleasepool { () throws -> MLXArray? in
                    let end = min(lo + 512, prompt.count), chunk = Array(prompt[lo..<end])
                    if end < prompt.count {
                        try model.prefillWithoutReadout(chunk, shouldContinue: shouldContinue)
                        return nil
                    }
                    let output = try model.forward(chunk,
                        observe: { _, _, _ in }, inspectState: false, shouldContinue: shouldContinue)
                    let last = contiguous(output.logits[0..., (output.logits.dim(1) - 1)..., 0...])
                    eval(last)
                    return last
                }
            } catch { try model.restore(checkpoint); throw error }
        }
        func result() -> Result {
            Result(tokens: tokens, consumedTokens: model.consumedTokens, reason: reason,
                   drafted: drafted, accepted: accepted, rngState: sampler.rngState)
        }
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        let first = sampler.next(logits!, params: params, generated: generated)
        if eosIDs.contains(first) { reason = "stop"; return result() }
        tokens.append(first); generated.insert(first)
        if onToken?(first) == false { reason = "stop"; return result() }
        var pending = first
        while tokens.count < params.maxTokens {
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            let checkpoint = try model.snapshot()
            do {
                // Bound the verification tail so the final output remains
                // unconsumed, just as in ordinary one-token generation.
                let depth = min(draftDepth, params.maxTokens - tokens.count - 1)
                let proposals = depth > 0
                    ? try model.proposeDraft(pending: pending, count: depth, shouldContinue: shouldContinue) : []
                drafted += proposals.count
                let verify = [pending] + proposals
                try model.beginRecording()
                let output = try model.forward(verify, observe: { _, _, _ in },
                    inspectState: false, shouldContinue: shouldContinue)
                var good = 0, next: Int?
                for i in 0...proposals.count {
                    guard shouldContinue() else { throw CheckpointReadError.cancelled }
                    let token = sampler.next(output.logits[0..., i..<(i + 1), 0...],
                                             params: params, generated: generated)
                    if eosIDs.contains(token) { reason = "stop"; break }
                    tokens.append(token); generated.insert(token)
                    if onToken?(token) == false { reason = "stop"; break }
                    if i < proposals.count, token == proposals[i] { good += 1 }
                    else { next = token; break }
                }
                try model.rollbackRecorded(keeping: good + 1, of: verify, from: checkpoint)
                accepted += good
                if reason == "stop" || tokens.count == params.maxTokens { break }
                guard let next else { throw ModelError("candidate verification lost its pending target token") }
                pending = next
            } catch {
                // No target token is recomputed to recover a rejected pass.
                // Errors surface to the caller; no application turn is replayed.
                try model.restore(checkpoint)
                throw error
            }
        }
        return result()
    }
}
