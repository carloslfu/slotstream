import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationStateRecovery(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        var c = CheckBuilder("optimization-state-recovery-lineage")
        let prefix = (0..<17).map { 1000 + $0 * 197 }
        func snapshot(_ state: Qwen4ExpModel.State) -> [String: String] {
            state.prefixForkDiagnosticTensors().mapValues { array in
                let bytes = Data(array.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))
                return "\(array.dtype):\(array.shape):\(SHA256.hash(data: bytes))"
            }
        }
        weak var priorModel: Qwen4ExpModel?
        func makeForeignState() throws -> Qwen4ExpModel.State {
            let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640, runLayers: 4)
            priorModel = model
            let state = model.makeState()
            eval(try model.lastLogitsChecked(prefix, state: state))
            return state
        }
        let foreign = try makeForeignState()
        c.expect("prior loaded model released before successor allocation", priorModel == nil)
        guard priorModel == nil else { return c.report() }
        MLX.Memory.clearCache()
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640, runLayers: 4)
        model.optimizations = .integrationCandidate
        func rejects(_ name: String, state: Qwen4ExpModel.State, _ operation: () throws -> Void) {
            let before = snapshot(state)
            do { try operation(); c.expect(name + ": rejected", false) }
            catch is ModelError { c.expect(name + ": rejected", true) }
            catch { c.expect(name + ": typed model error", false, "\(error)") }
            c.equal(name + ": no cache mutation", snapshot(state), before)
        }
        rejects("same-geometry foreign model state", state: foreign) {
            eval(try model.lastLogitsChecked([907], state: foreign))
        }
        let cache = PrefixCache(maxTokens: 4096)
        cache.store(state: foreign, tokens: prefix)
        let generator = Generator(model: model)
        generator.prefillChunk = 256
        var params = SampleParams.greedy; params.maxTokens = 1
        let cold = generator.generate(promptIds: prefix + [907], params: params, eosIds: [])
        let cached = generator.generate(promptIds: prefix + [907], params: params, eosIds: [], cache: cache)
        c.expect("foreign prefix safely rebuilt", cached.1.runtimeError == nil)
        c.equal("foreign prefix produces cold output", cached.0, cold.0)
        c.equal("foreign prefix is a miss", cached.1.reusedPrefixTokens, 0)
        c.equal("foreign state remains owned by original model", foreign.tokenCount, prefix.count)

        let state = model.makeState()
        let empty = state.checkpoint()
        eval(try model.lastLogitsChecked(prefix, state: state))
        let malformed = PrefixCache(maxTokens: 8192)
        for ids in [Array(prefix.dropLast()), prefix + [907]] {
            malformed.store(state: state, tokens: ids)
            c.equal("mismatched consumed ID count \(ids.count) is not retained", malformed.heldTokens, 0)
        }
        do {
            _ = try malformed.storeCompletePrompt(state: state, tokens: prefix,
                reserveTokens: 256, reserveSequenceBytes: state.allocatedSequenceBytes,
                logits: MLXArray([Float(1)]), vocabularySize: 1,
                key: PromptCheckpointKey(model: foreign.ownerModelIdentity!, optimizations: model.optimizations,
                    prefillChunk: 256, mtp: false))
            c.expect("forged complete-prompt model key is refused", false)
        } catch is ModelError { c.expect("forged complete-prompt model key is refused", true) }
        c.equal("malformed full-key store retains nothing", malformed.heldTokens, 0)
        // Equal IDs and geometry do not make states from separate loaded
        // models duplicates. These lookups never run a foreign state.
        for foreignCheckpoint in [false, true] {
            for ownCheckpoint in [false, true] {
                let owners = PrefixCache(maxTokens: 8192)
                if foreignCheckpoint {
                    try owners.storeReusableCheckpoint(state: foreign, tokens: prefix,
                        reserveTokens: 256, reserveSequenceBytes: foreign.allocatedSequenceBytes)
                } else { owners.store(state: foreign, tokens: prefix) }
                if ownCheckpoint {
                    c.expect("owner stores \(foreignCheckpoint)/\(ownCheckpoint): retained", try owners.storeReusableCheckpoint(
                        state: state, tokens: prefix, reserveTokens: 256, reserveSequenceBytes: state.allocatedSequenceBytes))
                } else { owners.store(state: state, tokens: prefix) }
                c.equal("owner stores \(foreignCheckpoint)/\(ownCheckpoint): two owners retained",
                    owners.json()["conversations"] as? Int, 2)
                let current = owners.takeForGeneration(matching: prefix + [907], completePromptKey: nil,
                    modelIdentity: state.ownerModelIdentity)
                c.equal("owner stores \(foreignCheckpoint)/\(ownCheckpoint): current owner available",
                    current?.state.ownerModelIdentity, state.ownerModelIdentity)
                let previous = owners.takeForGeneration(matching: prefix + [907], completePromptKey: nil,
                    modelIdentity: foreign.ownerModelIdentity)
                c.equal("owner stores \(foreignCheckpoint)/\(ownCheckpoint): previous owner independent",
                    previous?.state.ownerModelIdentity, foreign.ownerModelIdentity)
            }
        }
        let atPrefix = snapshot(state), ancestor = state.checkpoint()
        let sibling = try state.forkForPrefix()
        c.equal("prefix fork preserves loaded model owner", sibling.ownerModelIdentity, state.ownerModelIdentity)
        rejects("sibling checkpoint", state: sibling) { try sibling.restoreChecked(ancestor) }
        sibling.mtp = MTPState()
        let invalidDraft = sibling.checkpoint()
        rejects("misaligned draft checkpoint", state: sibling) { try sibling.restoreChecked(invalidDraft) }
        sibling.mtp = nil
        let tail = [19, 23, 907, 41, 59]
        eval(try model.lastLogitsChecked(tail, state: state))
        let later = state.checkpoint()
        try state.restoreChecked(ancestor)
        c.equal("valid ancestor restores every tensor", snapshot(state), atPrefix)
        rejects("future checkpoint before re-extension", state: state) { try state.restoreChecked(later) }
        eval(try model.lastLogitsChecked([8, 8, 8, 8, 8, 8, 8], state: state))
        rejects("discarded branch after re-extension", state: state) { try state.restoreChecked(later) }
        try state.restoreChecked(ancestor)
        c.equal("ancestor remains valid across branches", snapshot(state), atPrefix)

        state.setRecording(true)
        eval(try model.lastLogitsChecked(tail, state: state))
        let recordedEnd = state.checkpoint()
        for n in [0, tail.count + 1] {
            rejects("invalid kept length \(n)", state: state) {
                try state.rollbackChecked(keeping: n, of: tail, from: ancestor, ngramWindow: 2)
            }
        }
        rejects("wrong recorded token IDs", state: state) {
            try state.rollbackChecked(keeping: 2, of: [1, 2, 3, 4, 5], from: ancestor, ngramWindow: 2)
        }
        rejects("wrong recording ancestor", state: state) {
            try state.rollbackChecked(keeping: 2, of: tail, from: empty, ngramWindow: 2)
        }
        rejects("negative n-gram window", state: state) {
            try state.rollbackChecked(keeping: 2, of: tail, from: ancestor, ngramWindow: -1)
        }
        rejects("wrong n-gram window", state: state) {
            try state.rollbackChecked(keeping: 2, of: tail, from: ancestor, ngramWindow: 0)
        }
        rejects("foreign rollback owner", state: state) {
            try state.rollbackChecked(keeping: 2, of: tail, from: sibling.checkpoint(), ngramWindow: 2)
        }
        try state.rollbackChecked(keeping: 2, of: tail, from: ancestor, ngramWindow: 2)
        c.equal("valid recorded prefix retained", state.tokenCount, prefix.count + 2)
        _ = try state.forkForPrefix()
        c.expect("rollback clears recording and leaves forkable state", true)
        eval(try model.lastLogitsChecked(Array(repeating: 907, count: 8), state: state))
        rejects("recorded future invalid after overwrite", state: state) { try state.restoreChecked(recordedEnd) }
        try state.restoreChecked(ancestor)
        c.equal("rollback preserves original ancestor", snapshot(state), atPrefix)
        eval(try model.lastLogitsChecked(tail, state: state))
        rejects("non-recorded pass cannot be rolled back", state: state) {
            try state.rollbackChecked(keeping: 2, of: tail, from: ancestor, ngramWindow: 2)
        }
        try state.restoreChecked(empty)
        c.equal("oldest live ancestor restores zero boundary", state.tokenCount, 0)
        eval(try model.lastLogitsChecked(prefix, state: state))
        c.equal("replay after oldest ancestor is exact", snapshot(state), atPrefix)
        for _ in 0..<2048 { _ = state.checkpoint() }
        c.expect("discarded snapshots do not accumulate live tickets", state.liveCheckpointTicketCount <= 8)
        let invalid = Qwen4ExpModel.State()
        rejects("uninitialized read-scope state", state: invalid) {
            _ = try model.consumeReadScopeChecked([907], passes: [1], state: invalid,
                vision: [], head: nil, final: true, shouldContinue: nil)
        }
        c.expect("bounded physical footprint", ProcessMemory.residentBytes() < 8_100_000_000)
        return c.report()
    }
}
