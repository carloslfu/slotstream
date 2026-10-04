import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Functional coverage of an explicit context, not a context-quality or
    /// throughput result. The original head and all recurrent families remain
    /// live while recorded target passes are reconciled at the full window.
    public static func affineContext(baseline: URL, control: URL, table: URL,
        limit: Int, output: URL, streamedDraft: Bool = false) throws -> Data {
        guard [4096, 8192, 32768].contains(limit),
              !FileManager.default.fileExists(atPath: output.path),
              !ProcessInfo.processInfo.environment.keys.contains(where: {
                  $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
              }) else { throw ModelError("affine context requires an explicit staged window, new output and no ambient overrides") }
        try ModelProcessGuard.acquire()
        guard let before = ProcessMemory.vmActivity(), before.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("affine context requires 13 GB actual reclaimable memory")
        }
        try FileManager.default.createDirectory(at: output, withIntermediateDirectories: false)
        let oldCache = MLX.Memory.cacheLimit, oldLimit = MLX.Memory.memoryLimit
        MLX.Memory.cacheLimit = 128_000_000; MLX.Memory.memoryLimit = min(oldLimit, 9_000_000_000)
        defer { Stream.gpu.synchronize(); MLX.Memory.clearCache(); MLX.Memory.cacheLimit = oldCache; MLX.Memory.memoryLimit = oldLimit }
        let started = ProcessInfo.processInfo.systemUptime
        func guardResources() throws {
            guard ProcessMemory.peakResidentBytes() <= 10_000_000_000,
                  let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 3_000_000_000,
                  ProcessInfo.processInfo.systemUptime - started < 1800 else {
                throw ModelError("affine context exceeded its resource reservation")
            }
        }
        var c = CheckBuilder("affine-context-\(limit)")
        var observations: [[String: Any]] = [], complete = false
        func save(_ failure: String? = nil) throws -> Data {
            var result: [String: Any] = ["schema": 1, "complete": complete, "qualification": false,
                "control_manifest_sha256": AffineExpertControl.manifestSHA256,
                "arithmetic": "pr1788-affine3-row-invariant-verification-v1",
                "draft_sha256": VQDraftWeights.fileSHA256, "rotary_sha256": VQRotaryCoefficients.sha256,
                "context_limit": limit, "prefill_chunk": 512, "slots": 640, "streamed_draft": streamedDraft,
                "observations": observations,
                "report": try JSONSerialization.jsonObject(with: JSONEncoder().encode(c.report())),
                "seconds": ProcessInfo.processInfo.systemUptime - started,
                "peak_process_bytes": ProcessMemory.peakResidentBytes(), "saved_raw_f32_bytes": 0]
            result["failure"] = failure
            let bytes = try JSONSerialization.data(withJSONObject: result, options: [.prettyPrinted, .sortedKeys])
            try bytes.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return bytes
        }
        do {
            let index = try AffineExpertControl.open(baseline: baseline, control: control,
                shouldContinue: { (try? guardResources()) != nil })
            let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: nil,
                affineControlReferenceArithmetic: true,
                affineControlCoefficients: VQRotaryCoefficients(url: table), affineControlContextLimit: limit)
            try model.enableAffineControlDraft(baseline: baseline, streamedExperts: streamedDraft)
            c.equal("independent draft placement", model.mtpHead?.expertStream != nil, streamedDraft)
            try model.validate()
            guard let head = model.mtpHead else { throw ModelError("affine context requires its independent draft") }
            let state = model.makeState(); state.mtp = MTPState()
            defer { Stream.gpu.synchronize(); model.pool.unpinAll() }
            func hashes(_ values: [String: MLXArray]) -> [String: String] {
                values.mapValues { value in
                    eval(value)
                    return "\(value.dtype):\(value.shape):\(AffineExpertControl.digest(value.asData(access: .copy).data))"
                }
            }
            func exact(_ label: String, _ a: [String: String], _ b: [String: String]) {
                c.equal(label + " fields", Set(a.keys), Set(b.keys))
                for key in a.keys.sorted() { c.equal(label + " " + key, a[key], b[key]) }
            }
            func consume(_ ids: [Int]) throws -> MLXArray {
                guard let draft = state.mtp else { throw ModelError("affine context lost draft state") }
                let (mixed, multi) = try model.hiddenStatesWithMultiChecked(ids, state: state)
                state.lastMulti = try head.consumeChecked(chunk: ids, chunkMulti: multi, prevMulti: state.lastMulti,
                    resident: model.resident, rope: model.sharedRope, state: draft,
                    compactRetainedRow: model.optimizations.compactMTPRow)
                let logits = model.draftLogits(mixed[0..., (mixed.dim(1) - 1)..., 0...])
                eval(logits, state.lastMulti!)
                Stream.gpu.synchronize(); model.pool.unpinAll()
                try guardResources()
                return logits
            }
            try withError {
                let prompt = (0..<(limit - 8)).map { 100 + ($0 * 17 % 1000) }
                var pending = 0
                for start in stride(from: 0, to: prompt.count, by: 512) {
                    let tokens = Array(prompt[start..<min(start + 512, prompt.count)])
                    let logits = try consume(tokens)
                    pending = argMax(logits.reshaped([-1])).item(Int.self)
                    c.equal("prefill boundary \(start)", state.tokenCount, start + tokens.count)
                    c.expect("draft aligned after prefill \(start)", state.hasValidMTP)
                    observations.append(["consumed": state.tokenCount, "peak_process_bytes": ProcessMemory.peakResidentBytes()])
                    _ = try save()
                }
                let base = state.checkpoint(), baseBits = hashes(state.diagnosticTensors()), previous = state.lastMulti
                let tokens = [pending, 107, 108, 109, 110]
                var canonical: [[String: String]] = [], logits: [[String: String]] = []
                for token in tokens {
                    let row = try consume([token])
                    canonical.append(hashes(state.diagnosticTensors()))
                    logits.append(hashes(["logits": row]))
                }
                try state.restoreChecked(base)
                exact("restored long-context base", baseBits, hashes(state.diagnosticTensors()))
                for kept in 1...tokens.count {
                    try state.restoreChecked(base)
                    state.setRecording(true)
                    let (allLogits, multi) = try model.allLogitsWithMultiChecked(tokens, state: state)
                    eval(allLogits, multi)
                    let row = allLogits[0..., (kept - 1)..<kept, 0...]
                    exact("recorded prefix \(kept) readout", logits[kept - 1], hashes(["logits": row]))
                    try state.rollbackChecked(keeping: kept, of: tokens, from: base, ngramWindow: model.cfg.ngramSize - 1)
                    guard let draft = state.mtp else { throw ModelError("rollback lost affine draft state") }
                    state.lastMulti = try head.consumeChecked(chunk: Array(tokens.prefix(kept)),
                        chunkMulti: multi[0..., 0..<kept, 0...], prevMulti: previous,
                        resident: model.resident, rope: model.sharedRope, state: draft,
                        compactRetainedRow: model.optimizations.compactMTPRow)
                    eval(state.lastMulti!)
                    Stream.gpu.synchronize(); model.pool.unpinAll()
                    exact("recorded prefix \(kept) complete state", canonical[kept - 1], hashes(state.diagnosticTensors()))
                    c.expect("recorded prefix \(kept) aligned head", state.hasValidMTP)
                    if kept < tokens.count {
                        let next = try consume([tokens[kept]])
                        exact("recorded prefix \(kept) continued readout", logits[kept], hashes(["logits": next]))
                        exact("recorded prefix \(kept) continued state", canonical[kept], hashes(state.diagnosticTensors()))
                    }
                    try guardResources(); _ = try save()
                }
                for token in [111, 112, 113] { _ = try consume([token]) }
                c.equal("complete context consumed", state.tokenCount, limit)
                let full = hashes(state.diagnosticTensors())
                do { _ = try model.hiddenStatesChecked([114], state: state); c.expect("extra token refused", false) }
                catch { c.expect("extra token refused", true) }
                exact("refusal preserves complete committed state", full, hashes(state.diagnosticTensors()))
                c.expect("final draft remains aligned", state.hasValidMTP)
                c.equal("no expert pins retained", model.pool.pinnedSlotCount, 0)
            }
            try index.verifyAuthenticatedFilesUnchanged(); try guardResources()
            _ = try save()
            guard c.report().passed else { throw ModelError("affine long-context or rollback gate failed") }
            complete = true
            return try save()
        } catch { _ = try save(String(describing: error)); throw error }
    }
}
