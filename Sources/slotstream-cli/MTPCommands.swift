// MTP (speculative decode) commands: parity against the Python reference,
// the accept-rate probe that decides whether speculation pays, and the
// standing correctness gate.

import ArgumentParser
import Foundation
import MLX
import Slotstream

// MARK: mtp-parity

/// Compare the Swift MTP head against the MLX Python reference on the stored
/// fixture (Tools/reference/make_mtp_fixture.py): a 5-token prefill step and
/// a cached 1-token decode step, same quantized weights on both sides. The
/// tolerance is the layer-parity bar — the two frameworks pick different
/// kernels, so deep sums drift ulps, never structure.
struct MTPParity: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mtp-parity",
        abstract: "Compare the MTP draft head against the Python reference fixture")
    @OptionGroup var model: ModelOptions
    @Option(help: "Fixture from Tools/reference/make_mtp_fixture.py")
    var fixture: String = "Tools/reference/fixtures/mtp_parity.safetensors"
    @Option(help: "Write per-stage dumps here (debug)") var dump: String?

    func run() throws {
        try model.rejectAdaptiveLimitForFixedDiagnostic()
        let cfg = try ModelConfig.load(from: model.modelURL)
        let head = MTPHead(try MTPWeights(modelDir: model.modelURL, config: cfg))
        if let dir = dump {
            try FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
            var step = 0
            head.debugSink = { name, arr in
                let v = arr.asType(.float32).asArray(Float.self)
                let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
                try? d.write(to: URL(fileURLWithPath: dir).appendingPathComponent("s\(step)_\(name).bin"))
                if name == "moeOut" { step += 1 }
            }
        }
        let fx = try loadArrays(url: URL(fileURLWithPath: fixture))
        func need(_ k: String) throws -> MLXArray {
            guard let a = fx[k] else { throw ValidationError("fixture is missing \(k)") }
            return a
        }
        let rope = Rope(dim: cfg.rotaryDim, base: cfg.ropeTheta)
        let state = MTPState()
        let (out1, multi1) = head(
            embedded: try need("embedded"), hiddenMulti: try need("hidden"),
            rope: rope, state: state)
        let (out2, multi2) = head(
            embedded: try need("embedded2"), hiddenMulti: try need("hidden2"),
            rope: rope, state: state)
        eval(out1, multi1, out2, multi2)
        let entries = (try need("embedded")).dim(1) + 1
        guard state.offset == entries else {
            throw ValidationError("cache offset \(state.offset), expected \(entries)")
        }

        var failures = 0
        for (name, got, refKey) in [
            ("prefill sample", out1, "out1"), ("prefill multi", multi1, "multi1"),
            ("decode sample", out2, "out2"), ("decode multi", multi2, "multi2"),
        ] {
            let ref = try need(refKey).asType(.float32)
            let g = got.asType(.float32)
            let maxAbs = abs(ref - g).max().item(Float.self)
            let scale = abs(ref).max().item(Float.self)
            let rel = maxAbs / max(scale, 1e-6)
            let ok = rel < 2e-2
            print(String(format: "%@: max abs %.5f  rel %.5f  %@", name, maxAbs, rel, ok ? "OK" : "FAIL"))
            if !ok { failures += 1 }
        }
        print(failures == 0 ? "MTP PARITY PASS" : "MTP PARITY FAIL")
        if failures > 0 { throw ExitCode(2) }
    }
}

// MARK: shared probe machinery

/// Built-in probe prompts: short, diverse (prose, code, list, reasoning) so
/// accept rates aren't measured on one register of text.
let mtpProbePrompts = [
    "Why is the sky blue? Explain in about five sentences.",
    "Write a Python function that parses a duration string like '2h30m' into seconds, with a couple of test cases.",
    "List the planets of the solar system with one interesting fact each.",
    "A train leaves at 9:12 and arrives at 11:47. How long is the trip? Think it through step by step.",
]

struct GreedyTrace {
    var tokens: [Int] = []  // generated tokens, in order
    var draftsAt: [[Int]] = []  // draft chain proposed at each position
}

// MARK: mtp-accept

/// The go/kill probe from the M9 design note: run plain greedy decode and, at
/// every position, chain the draft head (then roll its cache back), so the
/// drafts can be scored against the tokens the model actually went on to
/// produce. No speculation runs — this measures the accept curve that decides
/// whether it can pay, and at which depth.
struct MTPAccept: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mtp-accept",
        abstract: "Measure the MTP draft accept rate against real greedy continuations")
    @OptionGroup var model: ModelOptions
    @Option(help: "Tokens to generate per prompt") var maxTokens: Int = 96
    @Option(help: "Draft chain depth to probe") var depth: Int = 4

    func run() throws {
        guard depth >= 1, depth <= 8 else { throw ValidationError("--depth must be 1...8") }
        let plan = try model.announcedPlan(requireMTP: true)
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                var traces: [GreedyTrace] = []
                for (i, prompt) in mtpProbePrompts.enumerated() {
                    let ids = try engine.encodeChat(
                        [ChatMessage(role: "user", content: prompt)], thinking: false)
                    let t = probeGreedy(
                        model: engine.model, promptIds: ids, eosIds: engine.eosIds,
                        maxTokens: maxTokens, depth: depth)
                    traces.append(t)
                    FileHandle.standardError.write(
                        "prompt \(i + 1)/\(mtpProbePrompts.count): \(t.tokens.count) tokens\n"
                            .data(using: .utf8)!)
                }
                report(traces: traces, depth: depth)
                result = .success(())
            } catch { result = .failure(error) }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }

    /// Greedy decode that keeps the MTP cache on the true path and records a
    /// draft chain at every position without perturbing generation.
    func probeGreedy(
        model: Qwen4ExpModel, promptIds: [Int], eosIds: Set<Int>, maxTokens: Int, depth: Int
    ) -> GreedyTrace {
        guard let head = model.mtpHead else { fatalError("MTP head not enabled") }
        let state = model.makeState()
        let mtp = MTPState()
        state.mtp = mtp
        let rope = model.sharedRope

        // prefill (chunked), feeding the draft head alongside
        var trace = GreedyTrace()
        var logits = MLXArray(0)
        var i = 0
        let chunkSize = PrefillTuning.chunk
        while i < promptIds.count {
            let hi = min(i + chunkSize, promptIds.count)
            let chunk = Array(promptIds[i ..< hi])
            let (mixed, multi) = model.hiddenStatesWithMulti(chunk, state: state)
            state.lastMulti = head.consume(
                chunk: chunk, chunkMulti: multi, prevMulti: state.lastMulti,
                resident: model.resident, rope: rope, state: mtp)
            if hi == promptIds.count {
                logits = model.draftLogits(mixed[0..., (mixed.dim(1) - 1)..., 0...])
            }
            eval(mixed)
            i = hi
        }

        var pending = argMax(logits.reshaped([-1]).asType(.float32)).item(Int.self)
        for _ in 0 ..< maxTokens {
            if eosIds.contains(pending) { break }
            trace.tokens.append(pending)

            // draft chain from (lastMulti, pending) — provisional entries, rolled back
            let offset0 = mtp.offset
            var drafts: [Int] = []
            var dMulti = state.lastMulti!
            var dTok = pending
            for _ in 0 ..< depth {
                let e = model.resident.embed(MLXArray([Int32(dTok)], [1, 1])).asType(.bfloat16)
                let (s, m) = head(embedded: e, hiddenMulti: dMulti, rope: rope, state: mtp)
                dTok = argMax(model.draftLogits(s).reshaped([-1]).asType(.float32)).item(Int.self)
                drafts.append(dTok)
                dMulti = m
            }
            mtp.trim(to: offset0)
            trace.draftsAt.append(drafts)

            // consume pending for real (true-path MTP entry), next token
            let (vLogits, vMulti) = model.allLogitsWithMulti([pending], state: state)
            state.lastMulti = head.consume(
                chunk: [pending], chunkMulti: vMulti, prevMulti: state.lastMulti,
                resident: model.resident, rope: rope, state: mtp)
            precondition(mtp.offset == state.tokenCount - 1, "mtp cache misaligned")
            pending = argMax(vLogits.reshaped([-1]).asType(.float32)).item(Int.self)
        }
        return trace
    }

    func report(traces: [GreedyTrace], depth: Int) {
        // Position t's chain is scored against tokens[t+1 ... t+depth]; only
        // positions with a full comparison window count at each d.
        var okAt = [Int](repeating: 0, count: depth + 1)  // chains whose first d drafts ALL match
        var windows = [Int](repeating: 0, count: depth + 1)
        for t in traces {
            for (pos, drafts) in t.draftsAt.enumerated() {
                for d in 1 ... depth {
                    guard pos + d < t.tokens.count else { continue }
                    windows[d] += 1
                    var all = true
                    for j in 0 ..< d where drafts[j] != t.tokens[pos + 1 + j] { all = false; break }
                    if all { okAt[d] += 1 }
                }
            }
        }
        print("\ndraft accept curve (chain-prefix match over \(windows[1]) positions):")
        var expected = [Double](repeating: 0, count: depth + 1)
        for d in 1 ... depth {
            let p = windows[d] > 0 ? Double(okAt[d]) / Double(windows[d]) : 0
            expected[d] = (d == 1 ? 0 : expected[d - 1]) + p
            print(String(format: "  depth %d: %5.1f%%  (%d/%d)", d, 100 * p, okAt[d], windows[d]))
        }
        for d in 1 ... depth {
            // Per round: E[accepted]+1 tokens for 1 verify pass + P(any
            // rejection) rebuild pass. Draft-head cost ~ (d+kept)/48 of a
            // main pass, charged on top.
            let e = expected[d]
            let pAllOk = windows[d] > 0 ? Double(okAt[d]) / Double(windows[d]) : 0
            let mainPasses = 1.0 + (1.0 - pAllOk)
            let mtpOverhead = Double(d + 1) / 48.0 * 2.0  // draft + re-extend, generous
            let speedup = (e + 1.0) / (mainPasses + mtpOverhead)
            print(String(
                format: "  depth %d: E[tokens/round] %.2f -> est. decode speedup x%.2f",
                d, e + 1.0, speedup))
        }
    }
}

// MARK: mtp-fixture-inputs

/// (Hidden) Capture REAL fixture inputs for the parity test: embedding rows
/// and pre-mixer multi streams from an actual prefill of the pinned model.
/// Random hidden inputs turned out to be adversarial for parity — the MTP
/// layer's attention logits are an order sharper than main layers (its norms
/// run ~3x hotter), and off-manifold inputs put many positions at near-ties
/// where benign cross-framework bf16 noise flips the argmax key. On-manifold
/// inputs measure the implementation, not the near-tie lottery.
struct MTPFixtureInputs: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mtp-fixture-inputs",
        abstract: "Capture real (embedded, multi) fixture inputs from the pinned model",
        shouldDisplay: false)
    @OptionGroup var model: ModelOptions
    @Option var out: String = "Tools/reference/fixtures/mtp_parity_inputs.safetensors"

    func run() throws {
        try model.rejectAdaptiveLimitForFixedDiagnostic()
        // Same ids the fixture always used; a real chat-ish opening.
        let ids = [151644, 8948, 198, 40, 1079]
        let step2 = 25
        let index = try CheckpointIndex(dir: model.modelURL)
        let m = try Qwen4ExpModel(index: index, poolSlots: 2048)
        try m.validate()
        let state = m.makeState()
        let (_, multi1) = m.hiddenStatesWithMulti(ids, state: state)
        let (_, multi2) = m.hiddenStatesWithMulti([step2], state: state)
        // Real-usage alignment: the entry for token i fuses the previous
        // position's multi with token i's embedding.
        let emb1 = m.resident.embed(MLXArray(ids[1...].map { Int32($0) }, [1, ids.count - 1]))
            .asType(.bfloat16)
        let emb2 = m.resident.embed(MLXArray([Int32(step2)], [1, 1])).asType(.bfloat16)
        let hid1 = multi1[0..., 0 ..< (ids.count - 1), 0...]
        let hid2 = multi1[0..., (ids.count - 1)..., 0...]
        eval(emb1, emb2, hid1, hid2, multi2)
        try save(
            arrays: [
                "ids": MLXArray(ids.map { Int32($0) }),
                "step2_id": MLXArray([Int32(step2)]),
                "embedded": emb1, "hidden": hid1,
                "embedded2": emb2, "hidden2": hid2,
            ],
            url: URL(fileURLWithPath: out))
        print("wrote \(out)")
    }
}

// MARK: mtp-bench

/// (Hidden) In-process A/B decode benchmark: one engine, one warm expert
/// pool, alternating speculative/plain greedy generations of the same
/// prompt. The fairest possible comparison — everything shared except the
/// decode loop.
struct MTPBench: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mtp-bench",
        abstract: "A/B decode throughput: speculative vs plain on one warm engine",
        shouldDisplay: false)
    @OptionGroup var model: ModelOptions
    @Option var maxTokens: Int = 192
    @Option(help: "A/B pairs to run") var pairs: Int = 3
    @Option var prompt: String = "Explain how a transistor works, in about 300 words."
    @Option(help: "Read the prompt from this file instead of --prompt (long-context runs)") var promptFile: String?
    @Option(help: "Prompt plus reply context window: auto or tokens") var maxContext: ContextWindowArgument = .automatic
    @Flag(help: "Sample with the server's defaults (temperature 0.7, top-p 0.8, top-k 20, presence 1.5) instead of greedy; a fixed seed keeps both paths on one token stream")
    var sample = false
    @Option(help: "Seed for --sample") var seed: UInt64 = 1
    @Option(help: "Comma-separated arms per round instead of the plain/speculative pair: plain, spec (the configured verify pass; SLOTSTREAM_OPT_VERIFY_SPLIT=0 makes it the dense pass), split (split verify attention at its measured threshold), exact (the exact mode at every context: row-invariant projections and one attention call per row), plain-exact (plain decode under the exact controls). Order rotates per round; outputs are compared token by token.")
    var arms: String = ""

    enum Arm: String, CaseIterable {
        case plain, spec, split, exact
        case plainExact = "plain-exact"
        var speculative: Bool { self == .spec || self == .split || self == .exact }
    }

    func run() throws {
        let plan: MemoryPlan
        if let tokens = maxContext.tokens {
            plan = try model.announcedPlan(maxContext: tokens, requireMTP: true)
        } else {
            plan = try model.announcedPlan(requireMTP: true)
        }
        let promptText = try promptFile.map { try String(contentsOfFile: $0, encoding: .utf8) } ?? prompt
        var armList: [Arm] = []
        for name in arms.split(separator: ",") {
            guard let arm = Arm(rawValue: name.trimmingCharacters(in: .whitespaces)) else {
                throw ModelError("unknown arm '\(name)': use plain, spec, split, exact or plain-exact")
            }
            if !armList.contains(arm) { armList.append(arm) }
        }
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                var params = sample ? SampleParams() : SampleParams.greedy
                if sample { params.seed = seed }
                params.maxTokens = maxTokens
                let ids = try engine.encodeChat(
                    [ChatMessage(role: "user", content: promptText)], thinking: false)

                if !armList.isEmpty {
                    try compareArms(armList, engine: engine, ids: ids, params: params, plan: plan)
                    result = .success(())
                    sem.signal()
                    return
                }

                func once(spec: Bool) -> GenStats {
                    engine.generator.speculationEnabled = spec
                    let (_, stats) = engine.generator.generate(
                        promptIds: ids, params: params, eosIds: engine.eosIds)
                    return stats
                }
                // Warm the pool along BOTH decode paths before timing.
                _ = once(spec: true)
                _ = once(spec: false)
                var specTPS: [Double] = []
                var plainTPS: [Double] = []
                for i in 0 ..< max(1, pairs) {
                    let a = once(spec: false)
                    let b = once(spec: true)
                    plainTPS.append(a.decodeTPS)
                    specTPS.append(b.decodeTPS)
                    print(String(
                        format: "pair %d: plain %6.2f tok/s | spec %6.2f tok/s  (accept %4.1f%%, %d verify passes, %d tokens)",
                        i + 1, a.decodeTPS, b.decodeTPS, b.draftAcceptRate * 100,
                        b.verifyPasses, b.decodeTokens))
                }
                let p = plainTPS.sorted()[plainTPS.count / 2]
                let s = specTPS.sorted()[specTPS.count / 2]
                print(String(
                    format: "median: plain %.2f tok/s, speculative %.2f tok/s -> x%.2f at ~%.0f experts/layer, depth %d, %@",
                    p, s, s / p, plan.expertsPerLayerCached, engine.generator.draftDepth,
                    sample ? "sampled (seed \(seed))" : "greedy"))
                result = .success(())
            } catch { result = .failure(error) }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }

    /// Every arm once per round on the same warm engine, order rotating per
    /// round, after one untimed warm-up of each arm. The configured
    /// optimizations are the base; the split and exact arms change only the
    /// verify-pass controls. Outputs are compared against the first plain run
    /// (and the exact arm against plain-exact when both ran).
    func compareArms(_ armList: [Arm], engine: Engine, ids: [Int], params: SampleParams, plan: MemoryPlan) throws {
        let m = engine.model
        let base = m.optimizations
        var splitEngaged = Set<Arm>()
        func configure(_ arm: Arm) {
            var o = base
            switch arm {
            case .plain, .spec:
                break
            case .split:
                o.verifySplitAttention = true
                o.verifySplitMinContext = nil
            case .exact, .plainExact:
                o.verifySplitAttention = true
                o.verifySplitMinContext = 0
                o.rowInvariantProjection = true
            }
            m.optimizations = o
            engine.generator.speculationEnabled = arm.speculative
        }
        func once(_ arm: Arm) -> ([Int], GenStats) {
            configure(arm)
            let splitsBefore = m.multiRowSplits
            let (out, stats) = engine.generator.generate(promptIds: ids, params: params, eosIds: engine.eosIds)
            if arm.speculative, m.multiRowSplits > splitsBefore { splitEngaged.insert(arm) }
            return (out, stats)
        }
        print("prompt: \(ids.count) tokens; context window \(plan.maxContextTokens); ~\(Int(plan.expertsPerLayerCached)) experts/layer; arms: \(armList.map(\.rawValue).joined(separator: ","))")
        for arm in armList { _ = once(arm) }  // warm-up, untimed
        var tps: [Arm: [Double]] = [:]
        var outputs: [Arm: [[Int]]] = [:]
        for round in 0 ..< max(1, pairs) {
            let shift = round % armList.count
            let order = Array(armList[shift...]) + Array(armList[..<shift])
            var line = "round \(round + 1):"
            for arm in order {
                let (out, stats) = once(arm)
                tps[arm, default: []].append(stats.decodeTPS)
                outputs[arm, default: []].append(out)
                line += String(format: " %@ %.2f tok/s", arm.rawValue, stats.decodeTPS)
                if arm.speculative {
                    line += String(format: " (accept %.1f%%, %d passes)", stats.draftAcceptRate * 100, stats.verifyPasses)
                }
                line += ";"
            }
            print(line)
        }
        m.optimizations = base
        engine.generator.speculationEnabled = true
        func median(_ a: [Double]) -> Double { let s = a.sorted(); return s.isEmpty ? 0 : s[s.count / 2] }
        func firstDifference(_ a: [Int], _ b: [Int]) -> String {
            if a == b { return "identical (\(a.count) tokens)" }
            let n = zip(a, b).prefix { $0 == $1 }.count
            return "differs from token \(n) of \(min(a.count, b.count))"
        }
        print("medians (tok/s) over \(max(1, pairs)) rounds, greedy=\(params.temperature <= 0):")
        let reference = tps[.spec].map(median)
        for arm in armList {
            var line = "  " + arm.rawValue.padding(toLength: 12, withPad: " ", startingAt: 0)
                + String(format: "%7.2f", median(tps[arm] ?? []))
            if let r = reference, arm != .spec, r > 0 { line += String(format: "   x%.3f against spec", median(tps[arm] ?? []) / r) }
            print(line)
        }
        let consistent = armList.allSatisfy { arm in Set(outputs[arm] ?? []).count <= 1 }
        print("  every arm repeats its own output across rounds: \(consistent)")
        if let plain = outputs[.plain]?.first {
            for arm in armList where arm != .plain {
                if let o = outputs[arm]?.first { print("  \(arm.rawValue) against plain: \(firstDifference(o, plain))") }
            }
        }
        if let pe = outputs[.plainExact]?.first, let ex = outputs[.exact]?.first {
            print("  exact against plain-exact: \(firstDifference(ex, pe))")
        }
        print("  split verify attention engaged in: \(armList.filter { splitEngaged.contains($0) }.map(\.rawValue).joined(separator: ",").ifEmpty("none"))")
    }
}


private extension String {
    func ifEmpty(_ fallback: String) -> String { isEmpty ? fallback : self }
}

// MARK: mtp-check

/// Standing gate for speculative decode:
///   1. determinism — two speculative greedy runs are byte-identical;
///   2. cross-request state integrity — a follow-up turn through the prefix
///      cache extends a state built by speculative decode, and its logits stay
///      inside the band re-chunking a plain prefill moves them (prefix-check);
///   3. sanity — drafts are actually being accepted (a broken head or a
///      misaligned cache shows up as ~0%);
///   4. plain-vs-speculative divergence is REPORTED, not gated to zero:
///      verify batches tokens, and re-batching moves logits within the same
///      floating-point envelope as prefill re-chunking (MEASUREMENTS, prefix
///      cache) — near-tie argmax flips are expected occasionally.
struct MTPCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mtp-check",
        abstract: "Gate speculative decode: determinism, state integrity, accept sanity")
    @OptionGroup var model: ModelOptions
    @Option(help: "Tokens per generation") var maxTokens: Int = 48
    @Option(help: "Image for the vision+mtp leg (default: Tools/assets/vision_test/secret1.jpg)")
    var image: String?


    func run() throws {
        let plan = try model.announcedPlan(requireMTP: true)
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        Task {
            do {
                let observation = FootprintSampler()
                let vmBefore = ProcessMemory.vmActivity()
                let memoryTarget = plan.targetGB ?? plan.expectedPeakGB
                var memoryValidated = false
                var finalObservation: (sample: FootprintSampler.Result, vm: ProcessMemory.VMActivity?, physical: UInt64, rss: UInt64)?
                defer {
                    let observed = finalObservation ?? (sample: observation.finish(), vm: ProcessMemory.vmActivity(),
                        physical: ProcessMemory.residentBytes(), rss: ProcessMemory.lifetimeRSSPeakBytes())
                    let report: [String: Any] = [
                        "memory_validated": memoryValidated, "target_gb": memoryTarget,
                        "sampled_peak_bytes": observed.sample.peakBytes, "samples": observed.sample.samples,
                        "physical_footprint_end_bytes": observed.physical, "lifetime_rss_peak_bytes": observed.rss,
                        "lifetime_physical_footprint_peak_bytes": ProcessMemory.lifetimePhysicalFootprintPeakBytes(),
                        "swapins_before": vmBefore.map { $0.swapins as Any } ?? NSNull(),
                        "swapins_after": observed.vm.map { $0.swapins as Any } ?? NSNull(),
                        "swapouts_before": vmBefore.map { $0.swapouts as Any } ?? NSNull(),
                        "swapouts_after": observed.vm.map { $0.swapouts as Any } ?? NSNull(),
                        "swap_clean": vmBefore != nil && observed.vm != nil
                            && vmBefore?.swapins == observed.vm?.swapins && vmBefore?.swapouts == observed.vm?.swapouts,
                    ]
                    if let data = try? JSONSerialization.data(withJSONObject: report, options: [.sortedKeys]) {
                        print("MTP CHECK MEMORY " + String(decoding: data, as: UTF8.self))
                    }
                }
                func memoryGuard() throws {
                    // Global paging belongs to macOS and all running apps. It
                    // is evidence for timing interpretation, not an abort.
                    guard let current = ProcessMemory.vmActivity(),
                          Double(current.reclaimableBytes) >= 3e9 else {
                        throw ModelError("MTP check has less than 3 GB real headroom or unavailable headroom observations")
                    }
                    let physical = ProcessMemory.residentBytes(), rss = ProcessMemory.lifetimeRSSPeakBytes()
                    guard physical > 0, rss > 0, ProcessMemory.peakResidentGB <= memoryTarget else {
                        throw ModelError("MTP check memory observations are unavailable or exceed the planned target")
                    }
                }
                try memoryGuard()
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                engine.generator.footprintSampling = true
                try memoryGuard()
                var failures: [String] = []
                func check(_ name: String, _ ok: Bool) {
                    print(ok ? "PASS  \(name)" : "FAIL  \(name)")
                    if !ok { failures.append(name) }
                }
                var params = SampleParams.greedy
                params.maxTokens = maxTokens

                func checkedGeneration(_ ids: [Int], vision: VisionPrompt? = nil) throws -> ([Int], GenStats) {
                    try memoryGuard()
                    var interrupted: Error?
                    let generated = engine.generate(promptIds: ids, params: params, vision: vision, shouldContinue: {
                        do { try memoryGuard(); return true }
                        catch { interrupted = error; return false }
                    })
                    if let interrupted { throw interrupted }
                    guard generated.stats.runtimeError == nil, generated.stats.requestFailure == nil else {
                        throw ModelError("MTP check generation failed its Engine request guard")
                    }
                    try memoryGuard()
                    return (generated.ids, generated.stats)
                }

                func gen(_ prompt: String, spec: Bool) throws -> ([Int], GenStats) {
                    engine.generator.speculationEnabled = spec
                    defer { engine.generator.speculationEnabled = true }
                    let ids = try engine.encodeChat(
                        [ChatMessage(role: "user", content: prompt)], thinking: false)
                    engine.dropPrefixCache()
                    return try checkedGeneration(ids)
                }

                var acceptTotal = 0
                var draftTotal = 0
                for (i, prompt) in mtpProbePrompts.prefix(3).enumerated() {
                    let (a, sa) = try gen(prompt, spec: true)
                    let (b, _) = try gen(prompt, spec: true)
                    check("determinism p\(i + 1) (\(a.count) tokens)", a == b)
                    check("speculation ran p\(i + 1)", sa.verifyPasses > 0)
                    acceptTotal += sa.acceptedDrafts
                    draftTotal += sa.draftedTokens
                    let (c, _) = try gen(prompt, spec: false)
                    let shared = zip(a, c).prefix { $0 == $1 }.count
                    print(
                        "  info  p\(i + 1): plain vs spec shared prefix \(shared)/\(min(a.count, c.count))"
                            + (a == c ? " (identical)" : ""))
                }

                // Vision + MTP: a combined text-and-image prompt must speculate
                // too. The head's prefill consumption splices the tower's rows
                // at the placeholder runs (MTPHead.consume), so its cache is
                // built on the embeddings the main model saw; without that the
                // drafts would be self-consistent but blind to the image and
                // the accept rate would collapse. Runs the same three legs as
                // the text prompts above (spec, spec, plain) so determinism,
                // "speculation actually ran" and the shared-prefix report all
                // apply. Skips when the repo asset image is not in reach.
                let visionMode = try model.visionMode()
                let visionAsset: URL?
                if visionMode == .off { visionAsset = nil }
                else if visionMode == .on || image != nil {
                    visionAsset = URL(fileURLWithPath: try VisionAssets.resolve(image))
                } else {
                    visionAsset = (try? VisionAssets.resolve(image)).map { URL(fileURLWithPath: $0) }
                }
                if let img = visionAsset {
                    do {
                        let base64 = try Data(contentsOf: img).base64EncodedString()
                        let mime = img.pathExtension == "png" ? "image/png" : "image/jpeg"
                        let part: [String: Any] = [
                            "type": "image_url",
                            "image_url": ["url": "data:\(mime);base64,\(base64)"],
                        ]
                        let (ids, vision) = try engine.encodeWithVision(
                            messages: [
                                [
                                    "role": "user",
                                    "content": [
                                        part,
                                        ["type": "text", "text": "Describe this image briefly."],
                                    ],
                                ]
                            ],
                            tools: nil, thinking: false)
                        guard let vision else {
                            throw ModelError("vision prompt carried no image segments")
                        }
                        print(
                            "  info  vision+mtp prompt: \(ids.count) tokens, "
                                + "\(vision.segments.count) image(s), placeholder id "
                                + "\(engine.model.cfg.imageTokenId)")
                        func genVision(_ ids: [Int], _ vision: VisionPrompt?, spec: Bool)
                            throws -> ([Int], GenStats)
                        {
                            engine.generator.speculationEnabled = spec
                            defer { engine.generator.speculationEnabled = true }
                            engine.dropPrefixCache()
                            return try checkedGeneration(ids, vision: vision)
                        }
                        let (a, sa) = try genVision(ids, vision, spec: true)
                        let (b, _) = try genVision(ids, vision, spec: true)
                        check("vision speculation deterministic (\(a.count) tokens)", a == b)
                        check("vision speculation ran", sa.verifyPasses > 0)
                        acceptTotal += sa.acceptedDrafts
                        draftTotal += sa.draftedTokens
                        let (c, _) = try genVision(ids, vision, spec: false)
                        let shared = zip(a, c).prefix { $0 == $1 }.count
                        print(
                            "  info  vision plain vs spec shared prefix \(shared)/\(min(a.count, c.count))"
                                + (a == c ? " (identical)" : ""))
                    } catch {
                        check("vision+mtp leg completes", false)
                        failures.append("vision+mtp leg: \(error)")
                    }
                } else {
                    print(
                        "SKIP vision+mtp leg (vision disabled or no Tools/assets/vision_test image in reach; "
                            + "pass --image to force one)")
                }
                let rate = draftTotal > 0 ? Double(acceptTotal) / Double(draftTotal) : 0
                print(String(format: "  info  overall accept rate %.1f%%", rate * 100))
                check("accept rate is not degenerate (>5%)", rate > 0.05)

                // The verify pass records per-position recurrent states by
                // stepping the GDN recurrence one token at a time; the batched
                // kernel is the reference for the pass itself, and the plain
                // path stepping the same tokens is the reference for what a
                // rollback leaves behind. Same two tokens from one prefix:
                //   (1) recording pass vs batched pass: exact (the state is fp32
                //       between steps exactly as inside the fused kernel);
                //   (2) rollback to token 1 vs the plain path having stepped
                //       token 1 alone: the recurrent tensors agree to within
                //       re-association (the kept token's projections came out
                //       of a two-row batch; a wrong window reads order one), and
                //       one more step from each lands inside the prefill-rechunk
                //       band, the same bound prefix-check uses.
                do {
                    let probe = try engine.encodeChat(
                        [ChatMessage(role: "user", content: mtpProbePrompts[0])], thinking: false)
                    let prefix = Array(probe.dropLast(2))
                    let tail = Array(probe.suffix(2))
                    func vec(_ a: MLXArray) -> [Float] { a.reshaped([-1]).asType(.float32).asArray(Float.self) }
                    // plain path: prefix, then token 1 alone
                    let stPlain = engine.model.makeState()
                    eval(engine.model.hiddenStates(prefix, state: stPlain))
                    eval(engine.model.hiddenStates([tail[0]], state: stPlain))
                    // recording pass over both tokens from the same prefix, then rollback to token 1
                    let st = engine.model.makeState()
                    eval(engine.model.hiddenStates(prefix, state: st))
                    let ck = st.checkpoint()
                    let (batched, _) = engine.model.allLogitsWithMulti(tail, state: st)
                    eval(batched)
                    st.restore(ck)
                    st.setRecording(true)
                    let (stepped, _) = engine.model.allLogitsWithMulti(tail, state: st)
                    eval(stepped)
                    st.rollback(keeping: 1, of: tail, from: ck, ngramWindow: engine.model.cfg.ngramSize - 1)
                    let d = st.recurrentDelta(vs: stPlain)
                    // Control for the state deltas: the plain path built the same
                    // way but with its prefix re-chunked (7 tokens at a time), the
                    // accepted "same computation, summed differently" band.
                    let stCtrl = engine.model.makeState()
                    var i0 = 0
                    while i0 < prefix.count {
                        let hi = min(i0 + 7, prefix.count)
                        eval(engine.model.hiddenStates(Array(prefix[i0 ..< hi]), state: stCtrl))
                        i0 = hi
                    }
                    eval(engine.model.hiddenStates([tail[0]], state: stCtrl))
                    let dc = stCtrl.recurrentDelta(vs: stPlain)
                    let after = engine.model.lastLogits([tail[1]], state: st)
                    let plainStep = engine.model.lastLogits([tail[1]], state: stPlain)
                    eval(after, plainStep)
                    let (rel, same) = PrefixCheck.compare(vec(batched), vec(stepped))
                    let (relRoll, sameRoll) = PrefixCheck.compare(vec(plainStep), vec(after))
                    let whole = PrefixCheck.logits(engine, ids: probe, .whole)
                    let (ctrl, _) = PrefixCheck.compare(whole, PrefixCheck.logits(engine, ids: probe, .chunked(7)))
                    let bound = max(ctrl * 3, 0.01)
                    print(String(
                        format: "  info  recording pass vs batched: %.4f%% of spread (top-1 %@); rollback state vs plain: "
                            + "ssm %.2e, conv %.2e, ple %.2e relative (re-chunk control: ssm %.2e, conv %.2e, ple %.2e); "
                            + "one more step: %.3f%% vs control %.3f%% (bound %.3f%%, top-1 %@)",
                        rel * 100, same ? "same" : "differs", d.ssm, d.conv, d.ple, dc.ssm, dc.conv, dc.ple,
                        relRoll * 100, ctrl * 100, bound * 100, sameRoll ? "same" : "differs"))
                    check("recording verify pass matches the batched pass (<= 0.1% of spread)", rel <= 0.001)
                    // A wrong window or a stale state reads order one; the band is
                    // three times what re-chunking the plain path moves the same
                    // tensors, never under 1e-2 (bf16 rounding), as in prefix-check.
                    check("rollback state stays inside 3x the re-chunk band (ssm, conv, ple)",
                          d.ssm <= max(3 * dc.ssm, 1e-2) && d.conv <= max(3 * dc.conv, 1e-2) && d.ple <= max(3 * dc.ple, 1e-2))
                    check("rollback then one step stays inside the prefill-rechunk band", relRoll <= bound)
                }

                // Cross-request state integrity, at the logits level, by the
                // prefix-check method: a state built by speculative decode and
                // handed on through the prefix cache must move the next turn's
                // logits no more than re-chunking a plain prefill already does
                // (bound = 3x that control, floor 1% of spread), the band that
                // separates re-association from a corrupted or misaligned
                // state. Turn 2 is turn 1's exact ids plus its generation plus a
                // token suffix, so this gates the speculative bookkeeping, not
                // the chat template's decode->re-encode round-trip. Text or
                // liveness comparisons were a near-tie lottery here: a 48-token
                // turn-1 reply is cut mid-think, and whether the model answers
                // the suffix or stops is decided by tenths of a logit (the
                // previous form of this gate flipped when the draft depth
                // changed from 4 to 2, with the logits inside the band).
                func vec(_ a: MLXArray) -> [Float] {
                    a.reshaped([-1]).asType(.float32).asArray(Float.self)
                }
                engine.dropPrefixCache()
                engine.generator.speculationEnabled = true
                let q = "Name three primary colors."
                let ids1 = try engine.encodeChat(
                    [ChatMessage(role: "user", content: q)], thinking: false)
                let (o1, s1) = try checkedGeneration(ids1)
                let cont = engine.tokenizer.encode(text: "\n\nThe capital of France is")
                let ids2 = ids1 + o1 + cont
                let hit = engine.prefixCache.take(matching: ids2, reserveTokens: ids2.count + 8)
                check("turn-2 reused the speculative turn-1 state", (hit?.reused ?? 0) > 0)
                if let hit = hit, hit.reused > 0 {
                    let rest = Array(ids2[hit.reused...])
                    let spec = vec(engine.model.lastLogits(rest, state: hit.state))
                    let whole = PrefixCheck.logits(engine, ids: ids2, .whole)
                    let (ctrl, _) = PrefixCheck.compare(
                        whole, PrefixCheck.logits(engine, ids: ids2, .chunked(7)))
                    let (rel, sameTop1) = PrefixCheck.compare(whole, spec)
                    let bound = max(ctrl * 3, 0.01)
                    print(String(
                        format: "  info  turn-2 logits from the reused speculative state: %.3f%% of "
                            + "spread vs a cold rebuild (prefill-rechunk control %.3f%%, bound %.3f%%), "
                            + "top-1 %@; reused %d of %d tokens after a %d-token turn 1 (%d verify passes)",
                        rel * 100, ctrl * 100, bound * 100, sameTop1 ? "same" : "differs",
                        hit.reused, ids2.count, o1.count, s1.verifyPasses))
                    check("reused speculative state stays inside the prefill-rechunk band", rel <= bound)
                }
                check("turn-1 speculation ran", s1.verifyPasses > 0)

                let sample = observation.finish()
                let vmAfter = ProcessMemory.vmActivity()
                let physical = ProcessMemory.residentBytes(), rss = ProcessMemory.lifetimeRSSPeakBytes()
                finalObservation = (sample, vmAfter, physical, rss)
                memoryValidated = sample.samples > 0 && sample.peakBytes > 0 && physical > 0 && rss > 0
                    && Double(max(sample.peakBytes, ProcessMemory.peakResidentBytes())) <= memoryTarget * 1e9
                check("whole MTP check process memory fits the priced target", memoryValidated)
                print(failures.isEmpty ? "MTP CHECK PASS" : "MTP CHECK FAIL: \(failures.joined(separator: ", "))")
                if !failures.isEmpty { throw ExitCode(2) }
                result = .success(())
            } catch { result = .failure(error) }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

// MARK: mtp-passcost

/// What a k-token pass costs relative to a 1-token pass when NOTHING has to
/// be fetched — the number the plateau-regime speculative arithmetic rests on
/// ("verifying k drafted tokens costs roughly the launches of one"). The
/// plateau itself needs a ~27 GB target this Mac cannot always spare; the
/// fetch-free cost fits in any pool that holds five tokens' experts: run the
/// same pass twice from one checkpoint and time the second, when every expert
/// it needs is already resident (the miss counter proves it). Positions come
/// from a real greedy continuation so routing is realistic.
/// One timed configuration of the verify pass: its multi-row attention.
struct PassVariant: Hashable {
    let attention: MultiRowAttention.Mode
    static let stock = PassVariant(attention: .stock)
    var name: String { attention.rawValue }
    init(attention: MultiRowAttention.Mode) { self.attention = attention }
    init?(name: String) {
        guard let mode = MultiRowAttention.Mode(rawValue: name) else { return nil }
        self.init(attention: mode)
    }
}

struct MTPPassCost: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mtp-passcost",
        abstract: "Fetch-free cost of a k-token verify pass relative to one token",
        shouldDisplay: false)
    @OptionGroup var model: ModelOptions
    @Option(help: "Tokens of plain greedy continuation to draw positions from") var maxTokens: Int = 64
    @Option(help: "Measurement positions (after one warm-up position)") var positions: Int = 8
    @Option(help: "Largest pass to time (the verify pass is draft depth + 1)") var maxBatch: Int = 5
    @Option var prompt: String = "Explain how a transistor works, in about 300 words."
    @Option(help: "Read the prompt from this file instead of --prompt (long-context runs)") var promptFile: String?
    @Option(help: "Prompt plus reply context window: auto (32768 for this diagnostic) or tokens")
    var maxContext: ContextWindowArgument = .automatic
    @Option(help: "Comma-separated verify-pass modes to time per pass (stock,split,exact) at every context; each mode sets the split and row-invariant controls itself; stock is always the reference and rebuild timings are skipped")
    var attentionModes: String = ""

    func run() throws {
        let plan: MemoryPlan
        if let tokens = maxContext.tokens {
            plan = try model.announcedPlan(maxContext: tokens, requireMTP: true)
        } else {
            plan = try model.announcedPlan(requireMTP: true)
        }
        let promptText = try promptFile.map { try String(contentsOfFile: $0, encoding: .utf8) } ?? prompt
        var modes: [PassVariant] = []
        if !attentionModes.isEmpty {
            for name in attentionModes.split(separator: ",") {
                guard let mode = PassVariant(name: name.trimmingCharacters(in: .whitespaces)) else {
                    throw ModelError("unknown attention mode '\(name)': use stock, split or exact")
                }
                if !modes.contains(mode) { modes.append(mode) }
            }
            if !modes.contains(.stock) { modes.insert(.stock, at: 0) }
        }
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                let m = engine.model
                guard let head = m.mtpHead else { throw ModelError("draft head not loaded") }
                var params = SampleParams.greedy
                params.maxTokens = maxTokens
                let ids = try engine.encodeChat(
                    [ChatMessage(role: "user", content: promptText)], thinking: false)
                print("prompt: \(ids.count) tokens; context window \(plan.maxContextTokens); modes: \(modes.isEmpty ? "stock only" : modes.map(\.name).joined(separator: ","))")
                engine.generator.speculationEnabled = false
                let (out, _) = engine.generator.generate(
                    promptIds: ids, params: params, eosIds: engine.eosIds)
                let seq = ids + out
                let need = ids.count + maxBatch * (positions + 1) + 1
                guard seq.count >= need else {
                    throw ModelError(
                        "continuation too short: \(out.count) tokens; lower --positions or raise --max-tokens")
                }

                // A fresh state over the prompt, with the draft head's cache aligned.
                let state = m.makeState()
                let mtpState = MTPState()
                state.mtp = mtpState
                let prefix = Array(seq[0 ..< ids.count])
                let (_, pm) = m.hiddenStatesWithMulti(prefix, state: state)
                eval(pm)
                state.lastMulti = head.consume(
                    chunk: prefix, chunkMulti: pm, prevMulti: nil,
                    resident: m.resident, rope: m.sharedRope, state: mtpState)

                func timed(_ body: () -> Void) -> Double {
                    let t0 = DispatchTime.now().uptimeNanoseconds
                    body()
                    return Double(DispatchTime.now().uptimeNanoseconds - t0) / 1e6
                }
                func median(_ a: [Double]) -> Double {
                    let s = a.sorted()
                    return s.isEmpty ? 0 : s[s.count / 2]
                }
                // per k: (coldMs, coldMisses, warmMs, warmMisses)
                var verify: [Int: [(Double, Int, Double, Int)]] = [:]
                var rebuild: [Int: [(Double, Int)]] = [:]
                var draft: [Double] = []
                // per "mode/k": warm ms; max |logit delta| over the stock logit spread; top-1 flips
                var modeMs: [String: [Double]] = [:]
                var modeDiff: [String: [Double]] = [:]
                var modeFlips: [String: Int] = [:]
                // row 0 of a k-row pass against the same position's 1-row stock pass:
                // how far each mode's multi-row pass sits from plain decode
                var rowDiff: [String: [Double]] = [:]
                var rowFlips: [String: Int] = [:]
                var plainRef: MLXArray? = nil
                // the stock pass against its own cold run at the same k: run-to-run determinism
                var coldDiff: [Int: [Double]] = [:]
                var coldFlips: [Int: Int] = [:]
                func key(_ mode: PassVariant, _ k: Int) -> String { "\(mode.name)/\(k)" }
                // Modes are timed at every context, so the split's threshold is lifted
                // here; each mode sets both verify-pass controls.
                func setMode(_ mode: PassVariant) {
                    m.optimizations.verifySplitAttention = mode.attention == .stock ? nil : true
                    m.optimizations.verifySplitMinContext = mode.attention == .stock ? nil : 0
                    m.optimizations.rowInvariantProjection = mode.attention == .exact ? true : nil
                }

                var p = ids.count
                for pos in 0 ... positions {  // position 0 is the warm-up (kernel compiles)
                    let record = pos > 0
                    for k in 1 ... maxBatch {
                        let chunk = Array(seq[p ..< p + k])
                        let ck = state.checkpoint()
                        setMode(.stock)
                        m.pool.resetStats()
                        var coldLogits: MLXArray? = nil
                        let cold = timed {
                            let (l, mu) = m.allLogitsWithMulti(chunk, state: state)
                            eval(l, mu)
                            coldLogits = l
                        }
                        let coldMiss = m.pool.misses
                        state.restore(ck)
                        if modes.isEmpty {
                            m.pool.resetStats()
                            let warm = timed {
                                let (l, mu) = m.allLogitsWithMulti(chunk, state: state)
                                eval(l, mu)
                            }
                            let warmMiss = m.pool.misses
                            state.restore(ck)
                            if record { verify[k, default: []].append((cold, coldMiss, warm, warmMiss)) }
                            if k < maxBatch {
                                // The rebuild after a rejection re-runs the kept tokens without logits.
                                _ = timed {
                                    let (_, mu) = m.hiddenStatesWithMulti(chunk, state: state)
                                    eval(mu)
                                }
                                state.restore(ck)
                                m.pool.resetStats()
                                let rw = timed {
                                    let (_, mu) = m.hiddenStatesWithMulti(chunk, state: state)
                                    eval(mu)
                                }
                                let rm = m.pool.misses
                                state.restore(ck)
                                if record { rebuild[k, default: []].append((rw, rm)) }
                            }
                        } else {
                            // Every mode, warm, from the same checkpoint; the order rotates per
                            // position so no mode always follows the cold run.
                            let shift = pos % modes.count
                            let order = Array(modes[shift...]) + Array(modes[..<shift])
                            var logitsByMode: [PassVariant: MLXArray] = [:]
                            for mode in order {
                                setMode(mode)
                                m.pool.resetStats()
                                var logits: MLXArray? = nil
                                let warm = timed {
                                    let (l, mu) = m.allLogitsWithMulti(chunk, state: state)
                                    eval(l, mu)
                                    logits = l
                                }
                                let warmMiss = m.pool.misses
                                state.restore(ck)
                                if record {
                                    modeMs[key(mode, k), default: []].append(warm)
                                    if mode == .stock { verify[k, default: []].append((cold, coldMiss, warm, warmMiss)) }
                                }
                                logitsByMode[mode] = logits
                            }
                            setMode(.stock)
                            if k == 1 { plainRef = logitsByMode[.stock]?.asType(.float32) }
                            if record, let c = coldLogits?.asType(.float32), let w = logitsByMode[.stock]?.asType(.float32) {
                                let spread = (w.max() - w.min()).item(Float.self)
                                coldDiff[k, default: []].append(spread > 0 ? Double(abs(c - w).max().item(Float.self) / spread) : 0)
                                coldFlips[k, default: 0] += Int((argMax(c, axis: -1) .!= argMax(w, axis: -1)).asType(.int32).sum().item(Int32.self))
                            }
                            if record, let plain = plainRef {
                                let spread = (plain.max() - plain.min()).item(Float.self)
                                let plainTop = argMax(plain, axis: -1)
                                for mode in modes {
                                    guard let l = logitsByMode[mode]?.asType(.float32) else { continue }
                                    let row0 = l[0..., 0 ..< 1, 0...]
                                    let d = abs(row0 - plain).max().item(Float.self)
                                    let f = (argMax(row0, axis: -1) .!= plainTop).asType(.int32).sum().item(Int32.self)
                                    rowDiff[key(mode, k), default: []].append(spread > 0 ? Double(d / spread) : 0)
                                    rowFlips[key(mode, k), default: 0] += Int(f)
                                }
                            }
                            if record, let ref = logitsByMode[.stock]?.asType(.float32) {
                                let spread = (ref.max() - ref.min()).item(Float.self)
                                let refTop = argMax(ref, axis: -1)
                                for mode in modes where mode != .stock {
                                    guard let l = logitsByMode[mode]?.asType(.float32) else { continue }
                                    let maxDiff = abs(l - ref).max().item(Float.self)
                                    let flips = (argMax(l, axis: -1) .!= refTop).asType(.int32).sum().item(Int32.self)
                                    modeDiff[key(mode, k), default: []].append(spread > 0 ? Double(maxDiff / spread) : 0)
                                    modeFlips[key(mode, k), default: 0] += Int(flips)
                                }
                            }
                        }
                    }
                    // One draft-head step (everything resident: it never fetches).
                    let e = m.resident.embed(MLXArray([Int32(seq[p])], [1, 1])).asType(.bfloat16)
                    let off = mtpState.offset
                    for i in 0 ..< 2 {
                        let d = timed {
                            let (s, _) = head(
                                embedded: e, hiddenMulti: state.lastMulti!, rope: m.sharedRope,
                                state: mtpState)
                            let dl = m.draftLogits(s)
                            eval(dl)
                        }
                        mtpState.trim(to: off)
                        if record && i == 1 { draft.append(d) }
                    }
                    // Advance for real by maxBatch tokens so the next position is fresh.
                    let step = Array(seq[p ..< p + maxBatch])
                    let (_, mu) = m.hiddenStatesWithMulti(step, state: state)
                    eval(mu)
                    state.lastMulti = head.consume(
                        chunk: step, chunkMulti: mu, prevMulti: state.lastMulti,
                        resident: m.resident, rope: m.sharedRope, state: mtpState)
                    p += maxBatch
                }

                let t1 = median(verify[1]!.map { $0.2 })
                print(String(
                    format: "fetch-free pass cost at ~%.0f experts/layer, median of %d positions (ms; ratio to the 1-token pass):",
                    plan.expertsPerLayerCached, positions))
                for k in 1 ... maxBatch {
                    let w = verify[k]!
                    print(String(
                        format: "  verify  k=%d: %7.1f ms  x%.2f   [warm misses %d | first run %7.1f ms, %d misses]",
                        k, median(w.map { $0.2 }), median(w.map { $0.2 }) / t1,
                        Int(median(w.map { Double($0.3) })), median(w.map { $0.0 }),
                        Int(median(w.map { Double($0.1) }))))
                }
                if modes.isEmpty {
                    for k in 1 ..< maxBatch {
                        let r = rebuild[k]!
                        print(String(
                            format: "  rebuild k=%d: %7.1f ms  x%.2f   [warm misses %d]",
                            k, median(r.map { $0.0 }), median(r.map { $0.0 }) / t1,
                            Int(median(r.map { Double($0.1) }))))
                    }
                }
                print(String(
                    format: "  draft step:   %7.1f ms  x%.2f   (one head step + lm_head, resident)",
                    median(draft), median(draft) / t1))
                if !modes.isEmpty {
                    print("multi-row attention modes at \(ids.count) prompt tokens (warm ms, median of \(positions) positions; diff = max |logit delta| / stock logit spread, median; flips = top-1 changes over all rows and positions):")
                    for k in 1 ... maxBatch {
                        for mode in modes {
                            let ms = median(modeMs[key(mode, k)] ?? [])
                            var line = "  " + mode.name.padding(toLength: 8, withPad: " ", startingAt: 0)
                            line += String(format: " k=%d: %7.1f ms  x%.2f", k, ms, ms / t1)
                            if mode != .stock {
                                line += String(format: "   diff %.2e  flips %d",
                                    median(modeDiff[key(mode, k)] ?? []), modeFlips[key(mode, k)] ?? 0)
                            }
                            print(line)
                        }
                    }
                    print("  stock pass, cold run against warm run at the same k (max |delta| / spread, median; top-1 flips over all rows):")
                    for k in 1 ... maxBatch {
                        print(String(format: "  stock  k=%d cold-vs-warm: diff %.2e  flips %d", k, median(coldDiff[k] ?? []), coldFlips[k] ?? 0))
                    }
                    print("  row 0 against the same position's 1-row stock pass (max |delta| / spread, median; top-1 flips):")
                    for k in 2 ... maxBatch {
                        for mode in modes {
                            print("  " + mode.name.padding(toLength: 8, withPad: " ", startingAt: 0)
                                + String(format: " k=%d row0: diff %.2e  flips %d", k,
                                    median(rowDiff[key(mode, k)] ?? []), rowFlips[key(mode, k)] ?? 0))
                        }
                    }
                    print("  engaged: split or exact attention in \(m.multiRowSplits) layer passes; row-invariant matmul in \(RowInvariantMatmul.calls) calls")
                }
                result = .success(())
            } catch { result = .failure(error) }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

/// Gate: in the exact mode (the split verify attention at every context with
/// the row-invariant projections, which runs one attention call per row),
/// every row of a k-row verify pass equals the one-row pass of the same mode at
/// that row's position bit for bit, and the state a k-row pass leaves behind is
/// the state k one-row passes leave behind (checked through the next token's
/// logits), so speculative decode in that mode cannot say anything plain
/// decode in that mode would not. It runs a prompt below the indexer budget,
/// whose positions advance one token at a time across 1,024 keys, where the
/// backend changes its attention kernel, and one above the budget (a real
/// selection). The stock deviation is reported alongside, the size of what
/// the controls remove.
struct MTPRowCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "mtp-rowcheck",
        abstract: "Gate: multi-row verify passes reproduce one-row decode bit for bit")
    @OptionGroup var model: ModelOptions
    @Option(help: "Prompt lengths to synthesize, comma-separated: one below the indexer budget and one above it")
    var promptTokens: String = "900,2600"
    @Option(help: "Positions compared per prompt (after one warm-up position)") var positions: Int = 4
    @Option(help: "Largest pass compared (the verify pass is draft depth + 1)") var maxBatch: Int = 3
    @Option(help: "Prompt plus reply context window: auto or tokens") var maxContext: ContextWindowArgument = .automatic
    @Option(help: "Key count to cross: a prompt that ends before it is extended to just below it and its positions advance one token at a time, so the passes' key counts straddle it (the backend changes its attention kernel at 1,024 keys); 0 keeps the usual stride")
    var cross: Int = 1024

    /// Deterministic prose: distinct entries, no repetition the indexer could collapse.
    static func prose(entries: Int) -> String {
        let subjects = ["The archive", "A courier", "The harbor office", "Every ledger", "The night clerk",
                        "An old survey", "The lighthouse keeper", "The tram depot", "A visiting auditor"]
        let verbs = ["recorded", "questioned", "measured", "misplaced", "compared", "reported", "restored", "counted"]
        let objects = ["the winter inventory", "a set of brass keys", "the tide tables", "three sealed crates",
                       "the eastern fence line", "a damaged pump", "the morning manifest", "the reservoir gauges",
                       "the granary receipts", "two borrowed lanterns", "the ferry schedule"]
        let tails = ["before the first frost.", "without telling the council.", "against last year's totals.",
                     "while the bridge was closed.", "under a borrowed lamp.", "as the ferry came in.",
                     "after the audit ended.", "for the third time that month.", "despite the storm warning."]
        var text = ""
        for i in 0 ..< entries {
            var sentences: [String] = []
            for j in 0 ..< 5 {
                let n = i * 5 + j
                sentences.append("\(subjects[(n * 7 + i) % subjects.count]) \(verbs[(n * 3 + j) % verbs.count]) "
                    + "\(objects[(n * 5 + i * 2) % objects.count]) \(tails[(n * 11 + j * 3) % tails.count])")
            }
            text += "Entry \(i + 1). " + sentences.joined(separator: " ") + "\n\n"
        }
        return text + "Summarize these entries in detail, one paragraph per entry."
    }

    func run() throws {
        let plan: MemoryPlan
        if let tokens = maxContext.tokens {
            plan = try model.announcedPlan(maxContext: tokens, requireMTP: true)
        } else {
            plan = try model.announcedPlan(requireMTP: true)
        }
        guard maxBatch >= 2, maxBatch <= RowInvariantMatmul.maxRows, positions >= 1 else {
            throw ModelError("--max-batch must be 2 to \(RowInvariantMatmul.maxRows) and --positions at least 1")
        }
        let lengths = promptTokens.split(separator: ",").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        guard !lengths.isEmpty, lengths.allSatisfy({ $0 > 0 }) else {
            throw ModelError("--prompt-tokens needs positive token counts")
        }
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                let m = engine.model
                guard let head = m.mtpHead else { throw ModelError("draft head not loaded") }
                var failures: [String] = []
                func check(_ name: String, _ ok: Bool) {
                    print(ok ? "PASS  \(name)" : "FAIL  \(name)")
                    if !ok { failures.append(name) }
                }
                func configure(exact: Bool) {
                    m.optimizations.verifySplitAttention = exact ? true : nil
                    m.optimizations.verifySplitMinContext = exact ? 0 : nil
                    m.optimizations.rowInvariantProjection = exact ? true : nil
                }
                struct Worst { var diff = 0.0; var flips = 0 }
                func compare(_ got: MLXArray, _ ref: MLXArray, spread: Float, into worst: inout Worst) {
                    let d = spread > 0 ? Double(abs(got - ref).max().item(Float.self) / spread) : 0
                    let f = Int((argMax(got, axis: -1) .!= argMax(ref, axis: -1)).asType(.int32).sum().item(Int32.self))
                    worst.diff = max(worst.diff, d)
                    worst.flips += f
                }
                for target in lengths {
                    var entries = max(2, target / 62)
                    var ids: [Int] = []
                    while true {
                        ids = try engine.encodeChat(
                            [ChatMessage(role: "user", content: Self.prose(entries: entries))], thinking: false)
                        if ids.count >= target || entries > 4096 { break }
                        entries += max(1, entries / 8)
                    }
                    let above = ids.count > m.cfg.indexerBudget
                    // Positions start at `start`: the prompt's end, or just below the
                    // crossing so the recorded rows' key counts run up to it.
                    let crossing = cross > 0 && ids.count <= cross - maxBatch - 2
                    let start = crossing ? cross - maxBatch - 2 : ids.count
                    let stride = crossing ? 1 : maxBatch + 1
                    let label = "\(ids.count)-token prompt, \(above ? "above" : "below") the indexer budget"
                        + (crossing ? ", rows across \(cross) keys" : "")
                    print("prompt: \(label) (\(m.cfg.indexerBudget)); positions from \(start) every \(stride) tokens; context window \(plan.maxContextTokens)")
                    configure(exact: false)
                    let need = start + stride * (positions + 1) + maxBatch + 1
                    var params = SampleParams.greedy
                    params.maxTokens = need - ids.count + 16
                    engine.generator.speculationEnabled = false
                    let (out, _) = engine.generator.generate(promptIds: ids, params: params, eosIds: engine.eosIds)
                    engine.generator.speculationEnabled = true
                    let seq = ids + out
                    guard seq.count >= need else {
                        throw ModelError("continuation too short: \(out.count) tokens; lower --positions")
                    }

                    let state = m.makeState()
                    let mtpState = MTPState()
                    state.mtp = mtpState
                    let prefix = Array(seq[0 ..< start])
                    let (_, pm) = m.hiddenStatesWithMulti(prefix, state: state)
                    eval(pm)
                    state.lastMulti = head.consume(
                        chunk: prefix, chunkMulti: pm, prevMulti: nil,
                        resident: m.resident, rope: m.sharedRope, state: mtpState)

                    /// Logits of a pass over `chunk`; the state advances by the chunk.
                    func pass(_ chunk: [Int]) -> MLXArray {
                        let (l, mu) = m.allLogitsWithMulti(chunk, state: state)
                        eval(l, mu)
                        return l.asType(.float32)
                    }
                    let splitsBefore = m.multiRowSplits, rowCallsBefore = RowInvariantMatmul.calls
                    // per k: every row of the k-row pass against the one-row pass at its position
                    var exactRows: [Int: Worst] = [:], stockRows: [Int: Worst] = [:]
                    // the next token after a maxBatch-row advance against after maxBatch one-row advances
                    var exactState = Worst(), stockState = Worst()
                    var p = start
                    for pos in 0 ... positions {  // position 0 is the warm-up (kernel compiles)
                        let record = pos > 0
                        let ck = state.checkpoint()
                        // References per mode: one-row passes at p ... p+maxBatch in that mode;
                        // the last one reads the carried state. The exact mode changes one-row
                        // rounding too, so each mode is held to its own one-row passes.
                        var refs: [Bool: [MLXArray]] = [:]
                        for exact in [true, false] {
                            configure(exact: exact)
                            var r: [MLXArray] = []
                            for i in 0 ... maxBatch { r.append(pass([seq[p + i]])) }
                            state.restore(ck)
                            refs[exact] = r
                        }
                        let spreads = refs[false]!.map { ($0.max() - $0.min()).item(Float.self) }
                        for k in 2 ... maxBatch {
                            let chunk = Array(seq[p ..< p + k])
                            for exact in [true, false] {
                                configure(exact: exact)
                                let l = pass(chunk)
                                state.restore(ck)
                                guard record, let ref = refs[exact] else { continue }
                                for r in 0 ..< k {
                                    let row = l[0..., r ..< r + 1, 0...]
                                    if exact { compare(row, ref[r], spread: spreads[r], into: &exactRows[k, default: Worst()]) }
                                    else { compare(row, ref[r], spread: spreads[r], into: &stockRows[k, default: Worst()]) }
                                }
                            }
                        }
                        for exact in [true, false] {
                            configure(exact: exact)
                            _ = pass(Array(seq[p ..< p + maxBatch]))
                            let next = pass([seq[p + maxBatch]])
                            state.restore(ck)
                            guard record, let ref = refs[exact] else { continue }
                            if exact { compare(next, ref[maxBatch], spread: spreads[maxBatch], into: &exactState) }
                            else { compare(next, ref[maxBatch], spread: spreads[maxBatch], into: &stockState) }
                        }
                        // Advance for real by the stride so the next position is fresh.
                        configure(exact: false)
                        let step = Array(seq[p ..< p + stride])
                        let (_, mu) = m.hiddenStatesWithMulti(step, state: state)
                        eval(mu)
                        state.lastMulti = head.consume(
                            chunk: step, chunkMulti: mu, prevMulti: state.lastMulti,
                            resident: m.resident, rope: m.sharedRope, state: mtpState)
                        p += stride
                    }
                    check("\(label): exact verify attention engaged (\(m.multiRowSplits - splitsBefore) layer passes)",
                        m.multiRowSplits > splitsBefore)
                    check("\(label): row-invariant projections engaged (\(RowInvariantMatmul.calls - rowCallsBefore) matmuls)",
                        RowInvariantMatmul.calls > rowCallsBefore)
                    for k in 2 ... maxBatch {
                        let e = exactRows[k] ?? Worst(diff: .infinity, flips: -1), s = stockRows[k] ?? Worst()
                        check("\(label): k=\(k), every row equals the one-row pass at its position over \(positions) positions "
                            + String(format: "(max deviation %.3g of the logit spread, %d top-1 flips; stock %.3g, %d flips)",
                                e.diff, e.flips, s.diff, s.flips), e.diff == 0 && e.flips == 0)
                    }
                    check("\(label): the state after a \(maxBatch)-row pass equals the state after \(maxBatch) one-row passes, "
                        + String(format: "through the next token's logits (max deviation %.3g, %d flips; stock %.3g, %d flips)",
                            exactState.diff, exactState.flips, stockState.diff, stockState.flips),
                        exactState.diff == 0 && exactState.flips == 0)
                }
                configure(exact: false)
                if failures.isEmpty { print("MTP ROWCHECK PASS") }
                else { throw ModelError("MTP ROWCHECK FAIL: " + failures.joined(separator: "; ")) }
            } catch { result = .failure(error) }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}
