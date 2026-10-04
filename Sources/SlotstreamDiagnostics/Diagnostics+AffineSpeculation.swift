import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Exercises the deployed Generator with the independently configured
    /// original draft. Every retained speculative prefix is checked against
    /// token-at-a-time target/head consumption, including partial stops.
    public static func affineSpeculation(baseline: URL, control: URL, profile: URL,
        output: URL, streamedDraft: Bool = false, piecewiseAllocation: Bool = false,
        groupedExperts: Bool = false) throws -> Data {
        let artifact = try AffineExpertControl.identify(control: control)
        guard !groupedExperts || piecewiseAllocation else { throw ModelError("grouped experts require piecewise allocation") }
        let data = try AffineExpertControl.bounded(profile, maximum: 2023,
            sha256: "8e9ffd40c71d34bca08a55e7af55fda8ac7d45429f3ff7febef077d31bface7c")
        guard let object = try JSONSerialization.jsonObject(with: data) as? [String: Any],
              let prompt = object["prompt"] as? [Int], prompt.count == 44,
              !FileManager.default.fileExists(atPath: output.path),
              !ProcessInfo.processInfo.environment.keys.contains(where: {
                  $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
              }) else { throw ModelError("affine speculation requires its frozen profile, new output and no ambient overrides") }
        try ModelProcessGuard.acquire()
        guard let before = ProcessMemory.vmActivity(), before.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("affine speculation requires 13 GB actual reclaimable memory")
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
                throw ModelError("affine speculation exceeded its resource reservation")
            }
        }
        var c = CheckBuilder("affine-speculation")
        var observations: [[String: Any]] = [], accepted = 0
        var complete = false
        func save(_ failure: String? = nil) throws -> Data {
            var result: [String: Any] = ["schema": 1, "complete": complete, "qualification": false,
                "control_manifest_sha256": artifact.manifestSHA256,
                "arithmetic": "pr1788-affine3-row-invariant-verification-v1",
                "draft_sha256": VQDraftWeights.fileSHA256, "slots": 640, "streamed_draft": streamedDraft,
                "piecewise_allocation": piecewiseAllocation,
                "grouped_experts": groupedExperts,
                "observations": observations, "accepted_drafts": accepted,
                "report": try JSONSerialization.jsonObject(with: JSONEncoder().encode(c.report())),
                "seconds": ProcessInfo.processInfo.systemUptime - started,
                "peak_process_bytes": ProcessMemory.peakResidentBytes(), "saved_raw_f32_bytes": 0]
            result["failure"] = failure
            let encoded = try JSONSerialization.data(withJSONObject: result, options: [.prettyPrinted, .sortedKeys])
            try encoded.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return encoded
        }
        do {
            let index = try AffineExpertControl.open(baseline: baseline, control: control, artifact: artifact,
                shouldContinue: { (try? guardResources()) != nil })
            let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: nil,
                affineControlReferenceArithmetic: true, affinePiecewiseAllocation: piecewiseAllocation,
                affineGroupedExperts: groupedExperts)
            try model.enableAffineControlDraft(baseline: baseline, streamedExperts: streamedDraft)
            c.equal("independent draft placement", model.mtpHead?.expertStream != nil, streamedDraft)
            if streamedDraft {
                c.expect("streamed draft fits its independent resident allowance",
                    (model.mtpHead?.residentBytes ?? Int.max) <= PlannerCostModel.mtpStreamedBytes)
            }
            try model.validate()
            model.optimizations.skipUnusedFinalForward = true
            model.optimizations.boundedDraftTail = true
            let generator = Generator(model: model)
            generator.prefillChunk = 512; generator.prefillCacheLimit = 128_000_000
            defer { model.routerObserver = nil; Stream.gpu.synchronize(); model.pool.unpinAll() }
            func hashes(_ state: Qwen4ExpModel.State, targetOnly: Bool = false) -> [String: String] {
                state.diagnosticTensors().filter { !targetOnly || (!$0.key.hasPrefix("mtp.") && $0.key != "lastMulti") }
                    .mapValues { value in
                        eval(value)
                        return "\(value.dtype):\(value.shape):\(AffineExpertControl.digest(value.asData(access: .copy).data))"
                    }
            }
            func exact(_ label: String, _ a: [String: String], _ b: [String: String]) {
                c.equal(label + " fields", Set(a.keys), Set(b.keys))
                for key in a.keys.sorted() { c.equal(label + " " + key, a[key], b[key]) }
            }
            func consume(_ ids: [Int], _ state: Qwen4ExpModel.State) throws {
                guard let head = model.mtpHead, let draftState = state.mtp else {
                    throw ModelError("canonical affine consumption requires an initialized draft state")
                }
                let (mixed, multi) = try model.hiddenStatesWithMultiChecked(ids, state: state)
                state.lastMulti = try head.consumeChecked(chunk: ids, chunkMulti: multi,
                    prevMulti: state.lastMulti, resident: model.resident, rope: model.sharedRope,
                    state: draftState, compactRetainedRow: model.optimizations.compactMTPRow)
                eval(mixed, state.lastMulti!)
                Stream.gpu.synchronize(); model.pool.unpinAll()
                try guardResources()
            }
            struct Result {
                let ids: [Int], stats: GenStats, count: Int, state: [String: String]
            }
            func run(_ label: String, _ params: SampleParams, depth: Int,
                     eos: Set<Int> = [], stopAfter: Int? = nil,
                     cancelDuringVerify: Bool = false) throws -> Result {
                try guardResources()
                generator.speculationEnabled = depth > 0; generator.draftDepth = max(1, depth)
                let retained = GenerationPhaseState()
                var callbacks: [Int] = [], running = true, reached = false
                model.routerObserver = cancelDuringVerify ? { layer, _ in
                    if !callbacks.isEmpty, layer == 17 { running = false; reached = true }
                } : nil
                let (ids, stats) = generator.generate(promptIds: prompt, params: params, eosIds: eos,
                    cache: nil, vision: nil, shouldContinue: { running && (try? guardResources()) != nil },
                    onToken: { token in callbacks.append(token); return stopAfter.map { callbacks.count < $0 } ?? true },
                    request: nil, onAdmitted: nil, continuing: nil, retaining: retained)
                model.routerObserver = nil
                c.equal(label + " callbacks", callbacks, ids)
                c.equal(label + " runtime error", stats.runtimeError, nil)
                c.equal(label + " no retained expert pins", model.pool.pinnedSlotCount, 0)
                if cancelDuringVerify {
                    c.expect(label + " reaches a target verification layer", reached)
                    c.equal(label + " typed cancellation", stats.requestFailure?.code, .clientCancelled)
                    c.equal(label + " finish reason", stats.finishReason, "cancelled")
                } else { c.equal(label + " no request failure", stats.requestFailure, nil) }
                guard let held = retained.held else { throw ModelError(label + " lost its committed state") }
                c.equal(label + " exact consumed token ledger", held.tokens, Array((prompt + ids).prefix(held.state.tokenCount)))
                c.expect(label + " consumes only committed output", (prompt.count...(prompt.count + ids.count)).contains(held.state.tokenCount))
                c.equal(label + " head validity", held.state.hasValidMTP, depth > 0)
                let state = hashes(held.state, targetOnly: depth == 0)
                accepted += stats.acceptedDrafts
                observations.append(["name": label, "ids": ids, "consumed": held.state.tokenCount,
                    "stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(stats)), "state": state])
                _ = try save()
                return Result(ids: ids, stats: stats, count: held.state.tokenCount, state: state)
            }
            func checkCanonical(_ label: String, _ result: Result, targetOnly: Bool) throws {
                let state = model.makeState()
                state.mtp = MTPState()
                try consume(prompt, state)
                for token in result.ids.prefix(result.count - prompt.count) { try consume([token], state) }
                exact(label + " token-wise committed state", result.state, hashes(state, targetOnly: targetOnly))
                c.expect(label + " canonical head remains aligned", state.hasValidMTP)
            }
            try withError {
                var greedy = SampleParams.greedy; greedy.maxTokens = 16; greedy.seed = 42
                let plain = try run("greedy-plain", greedy, depth: 0)
                c.equal("full greedy length", plain.ids.count, 16)
                try checkCanonical("greedy-plain", plain, targetOnly: true)
                for depth in [1, 2, 4] {
                    let result = try run("greedy-depth-\(depth)", greedy, depth: depth)
                    c.equal("greedy depth \(depth) exact target tokens", result.ids, plain.ids)
                    c.expect("greedy depth \(depth) performs real drafting", result.stats.draftedTokens > 0)
                    try checkCanonical("greedy-depth-\(depth)", result, targetOnly: false)
                }
                var sampled = SampleParams.instruct
                sampled.maxTokens = 12; sampled.seed = 42; sampled.minP = 0.02
                let sampledPlain = try run("sampled-plain", sampled, depth: 0)
                for depth in [2, 4] {
                    let result = try run("sampled-depth-\(depth)", sampled, depth: depth)
                    c.equal("sampled depth \(depth) exact target tokens", result.ids, sampledPlain.ids)
                    try checkCanonical("sampled-depth-\(depth)", result, targetOnly: false)
                }
                for limit in [1, 2, 5, 12] {
                    let result = try run("callback-\(limit)", greedy, depth: 4, stopAfter: limit)
                    c.equal("callback \(limit) exact output", result.ids, Array(plain.ids.prefix(limit)))
                    c.equal("callback \(limit) reason", result.stats.finishReason, "stop")
                    try checkCanonical("callback-\(limit)", result, targetOnly: false)
                }
                var seen = Set<Int>()
                for (position, eos) in plain.ids.enumerated() where position < 8 && seen.insert(eos).inserted {
                    let result = try run("eos-\(position)", greedy, depth: 2, eos: [eos])
                    c.equal("EOS \(position) exact preceding output", result.ids, Array(plain.ids.prefix(position)))
                    c.equal("EOS \(position) reason", result.stats.finishReason, "stop")
                    try checkCanonical("eos-\(position)", result, targetOnly: false)
                }
                let cancelled = try run("cancel-during-verify", greedy, depth: 4, cancelDuringVerify: true)
                c.equal("cancelled output is a committed prefix", cancelled.ids, Array(plain.ids.prefix(cancelled.ids.count)))
                try checkCanonical("cancel-during-verify", cancelled, targetOnly: false)
                let recovery = try run("after-cancellation", greedy, depth: 2)
                c.equal("next request recovers exact output", recovery.ids, plain.ids)
                try checkCanonical("after-cancellation", recovery, targetOnly: false)
                c.expect("actual drafts are accepted", accepted > 0)
                if let stream = model.mtpHead?.expertStream {
                    c.expect("independent draft streams demanded original experts", stream.misses > 0)
                    c.expect("independent draft reuses resident experts", stream.hits > 0)
                    stream.readFault = ModelError("injected authenticated draft read failure")
                    let failed = generator.generate(promptIds: prompt, params: greedy, eosIds: [])
                    c.expect("independent draft read failure terminates the request", failed.1.runtimeError != nil)
                    c.expect("independent draft failure is consumed", stream.readFault == nil)
                    let recovered = try run("after-draft-read-failure", greedy, depth: 2)
                    c.equal("independent draft read recovery keeps target output", recovered.ids, plain.ids)
                    try checkCanonical("after-draft-read-failure", recovered, targetOnly: false)
                }

                // The public Generator has no RequestController here. Its
                // own admission and provisional draft tail must therefore
                // honor this model's smaller finite coefficient window.
                let edge = (0..<(model.inferenceContextLimit - 4)).map { 100 + ($0 * 17 % 1000) }
                var edgeParams = SampleParams.greedy; edgeParams.maxTokens = 4; edgeParams.seed = 42
                generator.speculationEnabled = false
                let ordinary = generator.generate(promptIds: edge, params: edgeParams, eosIds: [],
                    shouldContinue: { (try? guardResources()) != nil })
                c.equal("edge plain completes reserved output", ordinary.0.count, 4)
                c.equal("edge plain no runtime failure", ordinary.1.runtimeError, nil)
                generator.speculationEnabled = true; generator.draftDepth = 4
                model.optimizations.boundedDraftTail = false
                let held = GenerationPhaseState()
                let speculative = generator.generate(promptIds: edge, params: edgeParams, eosIds: [],
                    cache: nil, vision: nil, shouldContinue: { (try? guardResources()) != nil },
                    onToken: nil, request: nil, onAdmitted: nil, continuing: nil, retaining: held)
                c.equal("edge unbounded draft preserves target output", speculative.0, ordinary.0)
                c.equal("edge unbounded draft no runtime failure", speculative.1.runtimeError, nil)
                c.expect("edge draft has an aligned committed state", held.held?.state.hasValidMTP == true)
                c.expect("edge draft stays inside admitted window", (held.held?.state.tokenCount ?? Int.max) <= model.inferenceContextLimit)
                observations.append(["name": "context-edge", "ids": speculative.0,
                    "consumed": held.held?.state.tokenCount ?? -1, "prompt_count": edge.count,
                    "stats": try JSONSerialization.jsonObject(with: JSONEncoder().encode(speculative.1))])
                edgeParams.maxTokens = 5; model.pool.resetStats()
                let refused = generator.generate(promptIds: edge, params: edgeParams, eosIds: [])
                c.expect("over-reserved context emits nothing", refused.0.isEmpty)
                c.equal("over-reserved context is typed", refused.1.requestFailure?.code, .contextLengthExceeded)
                c.equal("over-reserved context performs no expert reads", model.pool.recordsFetched, 0)
                c.equal("context edge retains no expert pins", model.pool.pinnedSlotCount, 0)
            }
            if streamedDraft {
                // Only this disposable copy is mutated. Keep the real parent
                // unchanged while exercising the retained descriptor and
                // drain-before-publication boundary on actual expert bytes.
                let fixture = output.appendingPathComponent("private-draft-copy")
                try FileManager.default.createDirectory(at: fixture, withIntermediateDirectories: false)
                defer { try? FileManager.default.removeItem(at: fixture) }
                for name in ["config.json", "mtp.safetensors"] {
                    try FileManager.default.copyItem(at: baseline.appendingPathComponent(name), to: fixture.appendingPathComponent(name))
                }
                try guardResources()
                let weights = try VQDraftWeights.load(baseline: fixture, streamedExperts: true)
                guard let stream = weights.verifiedExpertStream else { throw ModelError("missing authenticated stream fixture") }
                func bankBits() -> [String] {
                    stream.pools.map { value in
                        eval(value)
                        return AffineExpertControl.digest(value.asData(access: .copy).data)
                    }
                }
                _ = try stream.slots(for: Array(0..<10).map(Int32.init))
                let before = bankBits(), misses = stream.misses
                stream.readJoinFault = ModelError("injected failure after joined draft reads")
                do {
                    _ = try stream.slots(for: Array(100..<110).map(Int32.init))
                    c.expect("joined-read failure refuses publication", false)
                } catch { c.expect("joined-read failure refuses publication", String(describing: error).contains("after joined")) }
                c.equal("failed joined batch publishes no cache bytes", bankBits(), before)
                c.equal("failed joined batch publishes no valid records", stream.misses, misses)
                _ = try stream.slots(for: Array(100..<110).map(Int32.init))
                c.equal("retry fills complete records exactly once", stream.misses, misses + 10)
                let verified = bankBits()
                let handle = try FileHandle(forWritingTo: fixture.appendingPathComponent("mtp.safetensors"))
                try handle.seekToEnd(); try handle.write(contentsOf: Data([0])); try handle.synchronize(); try handle.close()
                do {
                    _ = try stream.slots(for: Array(200..<210).map(Int32.init))
                    c.expect("changed owned sidecar refuses subsequent demand", false)
                } catch { c.expect("changed owned sidecar refuses subsequent demand", true) }
                c.equal("mutated sidecar never changes published cache bytes", bankBits(), verified)
                do {
                    _ = try VQDraftWeights.load(baseline: fixture, streamedExperts: true)
                    c.expect("new owner reauthenticates a damaged sidecar", false)
                } catch { c.expect("new owner reauthenticates a damaged sidecar", true) }
            }
            if piecewiseAllocation {
                if groupedExperts {
                    c.expect("bounded expert groups actually execute", model.affineGroupedPasses > 0)
                    c.equal("grouped execution creates no complete RHS workspace", model.pool.workspacePieceWriteCompletions, 0)
                } else { c.expect("sequential workspace writes actually finish", model.pool.workspacePieceWriteCompletions > 0) }
                c.expect("sequential admission writes actually finish", model.pool.admissionPieceWriteCompletions > 0)
                c.equal("actual intrinsic reservation matches the explicit profile",
                    model.intrinsicExpertWorkspaceBytes(tokens: 512, admits: true),
                    (groupedExperts ? PackMemoryProfile.affine3GroupedControl : .affine3PiecewiseControl)
                        .workspaceBytes(slots: 640))
            }
            try index.verifyAuthenticatedFilesUnchanged(); try guardResources()
            _ = try save()
            guard c.report().passed else { throw ModelError("affine speculative generation or committed-state gate failed") }
            complete = true
            return try save()
        } catch { _ = try save(String(describing: error)); throw error }
    }
}
