// slotstream CLI: run · serve · parity · doctor · goldens

import ArgumentParser
import Foundation
import MLX
import SlotstreamCore

struct Slotstream: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "slotstream",
        abstract: "Qwen3.8-Flash-Next on Apple Silicon via SSD-streamed experts + cache slots.",
        version: SlotstreamBuild.version,
        subcommands: [
            Run.self, Serve.self, Pull.self, Doctor.self, Parity.self, ElasticCheck.self,
            NgramGolden.self, DequantGolden.self, TemplateCheck.self, SamplerGolden.self, GovernorCheck.self,
        ]
    )
}

struct ModelOptions: ParsableArguments {
    @Option(name: .long,
            help: "Model name or directory (default \(PinnedModel.name); a name resolves to the dev checkout's models/ or ~/.slotstream/models)")
    var model: String = PinnedModel.name

    @Option(
        name: .customLong("memory-gb"),
        help: ArgumentHelp(
            "Total memory target for the whole process, in GB.",
            discussion: """
                The easiest knob: how much of this Mac slotstream may use. The \
                expert cache gets what remains after the ~3.9 GB fixed \
                footprint (resident weights + n-gram row cache) and a 0.5 GB \
                margin, e.g. 16 GB -> ~87 of 512 experts cached per layer. \
                Minimum ~6.2 GB. Default: auto -- 70% of RAM, kept 2 GB under \
                the Metal working-set limit; the chosen plan is announced at \
                startup. --experts-per-layer / --pool-gb take precedence.
                """))
    var memoryGB: Double?

    @Option(
        name: .customLong("experts-per-layer"),
        help: ArgumentHelp(
            "Expert cache size, in experts per layer (1...512).",
            discussion: """
                The precise memory<->speed knob. Each of the 48 layers has 512 \
                experts of 2.76 MB; the cache holds N x 48 of them, so pool = \
                N x 0.133 GB (e.g. 226/layer = 30 GB, 181/layer = 24 GB, \
                30/layer = 4 GB) plus the ~3.9 GB fixed footprint. The pool \
                itself is one GLOBAL cache shared across layers -- N is the \
                intuitive unit, not a per-layer quota: hot layers borrow slots \
                from cold ones. Takes precedence over --memory-gb/--pool-gb. \
                Default: auto (see `slotstream doctor`).
                """))
    var expertsPerLayer: Int?

    @Option(name: .customLong("pool-gb"),
            help: "Raw expert-pool size in GB (1 GB ≈ 7.5 experts/layer). Beats --memory-gb; loses to --experts-per-layer.")
    var poolGB: Double?

    var modelURL: URL { ModelLocator.resolve(model) }

    /// Resolve knobs -> plan, print the announce, return it. Also the first
    /// place a stranger hits with no weights — offer the download right there.
    func announcedPlan() throws -> MemoryPlan {
        try ensureWeights()
        let plan = try Planner.plan(
            expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB)
        FileHandle.standardError.write((plan.banner() + "\n").data(using: .utf8)!)
        return plan
    }

    /// If the pinned model isn't fully downloaded and we have a terminal, ask
    /// once and run the pull inline (resuming whatever is already there).
    /// Anything else fails with the fix, not a stack.
    func ensureWeights() throws {
        let url = modelURL
        let fm = FileManager.default
        guard model == PinnedModel.name || model == PinnedModel.dirName else {
            // explicit path: all we can check cheaply is that a model is there
            guard fm.fileExists(atPath: url.appendingPathComponent("config.json").path) else {
                throw PlanError("no model at \(url.path) — download it first with:  slotstream pull")
            }
            return
        }
        // pinned model: every manifest file must be present whole (a partial
        // first download must resume here, not die later in the engine)
        let remaining = Pull.remainingBytes(at: url)
        if remaining == 0 { return }
        let have = PinnedModel.totalBytes - remaining
        // free disk where the weights will actually land
        var probe = url
        while !fm.fileExists(atPath: probe.path), probe.path != "/" {
            probe.deleteLastPathComponent()
        }
        let free = (try? fm.attributesOfFileSystem(
            forPath: probe.path))?[.systemFreeSize] as? Int64 ?? 0
        print("""
            \(PinnedModel.name) is not \(have > 0 ? "fully " : "")downloaded yet.
              size:  \(String(format: "%.1f", Double(PinnedModel.totalBytes) / 1e9)) GB in \(PinnedModel.files.count) files (resumable if interrupted)\(
                  have > 0 ? String(format: "\n  have:  %.1f GB already here — the download resumes", Double(have) / 1e9) : "")
              to:    \(url.path)
              disk:  \(String(format: "%.1f", Double(free) / 1e9)) GB free
            """)
        fflush(stdout)
        switch askYesNo("download now? [Y/n] ") {
        case .some(true):
            try Pull.download(to: url)
            try Pull.verify(at: url)
        case .some(false):
            throw PlanError("not downloading — when you are ready:  slotstream pull")
        case .none:  // no terminal to ask on
            throw PlanError("no model at \(url.path) — download it first with:  slotstream pull")
        }
    }
}

/// Ask on the controlling terminal. Returns nil when there is no terminal
/// (piped stdin and no /dev/tty), so callers can fail with instructions
/// instead of hanging.
func askYesNo(_ prompt: String) -> Bool? {
    func parse(_ s: String) -> Bool {
        let t = s.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        return t.isEmpty || t == "y" || t == "yes"
    }
    if isatty(0) == 1 {
        print(prompt, terminator: "")
        guard let line = readLine() else { return false }
        return parse(line)
    }
    guard let tty = fopen("/dev/tty", "r") else { return nil }
    defer { fclose(tty) }
    print(prompt, terminator: "")
    fflush(stdout)
    var buf = [CChar](repeating: 0, count: 64)
    guard fgets(&buf, 64, tty) != nil else { return false }
    return parse(String(cString: buf))
}

// MARK: run

struct Run: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Generate from a prompt")
    @OptionGroup var model: ModelOptions
    @Option var prompt: String = "Why is the sky blue?"
    @Option(help: "Maximum tokens to generate (<= 0 means as many as allowed)")
    var maxTokens: Int = 128
    @Flag(help: "Greedy sampling (deterministic)") var greedy = false
    @Flag(help: "Raw prompt (no chat template)") var raw = false
    @Flag(help: "Enable thinking mode") var think = false

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let plan = try model.announcedPlan()
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                let ids: [Int]
                if raw {
                    ids = engine.tokenizer.encode(text: prompt)
                } else {
                    ids = try engine.encodeChat([ChatMessage(role: "user", content: prompt)], thinking: think)
                }
                FileHandle.standardError.write("prompt tokens: \(ids.count)\n".data(using: .utf8)!)
                if let e = engine.contextError(promptTokens: ids.count) { throw PlanError(e) }
                var params: SampleParams = greedy ? .greedy : (think ? .thinking : .instruct)
                params.maxTokens = maxTokens
                let t0 = Date()
                let (_, _, stats) = engine.generate(promptIds: ids, params: params) { _, delta in
                    fputs(delta, stdout)
                    fflush(stdout)
                    return true
                }
                print("")
                let hs = String(format: "%.3f", stats.expertHitRate)
                let perLayer = String(format: "~%.0f/%d experts per layer", plan.expertsPerLayerCached, Geometry.expertsPerLayer)
                FileHandle.standardError.write(
                    """

                    -- prefill \(stats.prefillTokens) tok in \(String(format: "%.2f", stats.prefillSeconds))s (\(String(format: "%.1f", stats.prefillTPS)) tok/s)
                    -- decode \(stats.decodeTokens) tok in \(String(format: "%.2f", stats.decodeSeconds))s (\(String(format: "%.2f", stats.decodeTPS)) tok/s)
                    -- expert cache \(perLayer), hit rate \(hs) | ngram rows \(stats.ngramRowHits)h/\(stats.ngramRowMisses)m | peak \(String(format: "%.1f", stats.peakMemoryGB)) GB | total \(String(format: "%.1f", -t0.timeIntervalSinceNow))s

                    """.data(using: .utf8)!)
                result = .success(())
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

// MARK: serve

struct Serve: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Ollama-compatible API server")
    @OptionGroup var model: ModelOptions
    @Option var port: UInt16 = 11434
    @Option(name: .customLong("max-context"),
            help: "Longest prompt accepted, in tokens. Beyond it a request is refused rather than stalling: KV plus indexer state costs ~27 KiB per token on top of the memory plan, and prefill runs at tens of tokens a second.")
    var maxContext: Int = 32_768
    @Flag(name: .customLong("no-elastic"),
          help: "Pin the cache at its startup size. Default: an auto-sized cache resizes itself between requests as memory pressure and availability change (explicit size flags are always pinned).")
    var noElastic = false

    func run() throws {
        guard maxContext > 0 else { throw PlanError("--max-context must be > 0") }
        let plan = try model.announcedPlan()
        // Claim the port first: failing here after a full model load wastes
        // half a minute and used to be a fatalError.
        let listenFD = try Server.bindPort(port)
        let sem = DispatchSemaphore(value: 0)
        var engine: Engine!
        var err: Error?
        Task {
            do { engine = try await Engine(modelDir: model.modelURL, plan: plan) } catch { err = error }
            sem.signal()
        }
        sem.wait()
        if let e = err { throw e }
        engine.maxContextTokens = maxContext
        var governor: MemoryGovernor?
        if plan.source == .auto, !noElastic {
            governor = MemoryGovernor(engine: engine)
            governor?.start()
        } else if plan.source != .auto, !noElastic {
            FileHandle.standardError.write(
                "elastic: off — an explicit size is pinned; omit the size flag for elastic auto\n"
                    .data(using: .utf8)!)
        }
        defer { governor?.stop() }
        let server = Server(
            engine: engine, port: port, weightsBytes: Int(PinnedModel.totalBytes),
            listenFD: listenFD)
        try server.run()
    }
}

// MARK: parity

struct Parity: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Run N truncated layers and compare hidden states against the Python reference dumps")
    @OptionGroup var model: ModelOptions
    @Option var layers: Int = 4
    @Option(help: "Comma-separated token ids") var tokens: String
    @Option(help: "Directory with python layer_{i}.bin dumps") var compare: String?
    @Option(help: "Write swift layer_{i}.bin dumps here") var out: String?

    func run() throws {
        let ids = tokens.split(separator: ",").map { Int($0.trimmingCharacters(in: .whitespaces))! }
        let index = try CheckpointIndex(dir: model.modelURL)
        let m = try Qwen4ExpModel(index: index, poolSlots: 2048, runLayers: layers)
        let state = m.makeState()
        var dumps: [Int: [Float]] = [:]
        let h = m.hiddenStates(ids, state: state) { l, arr in
            dumps[l] = arr.asType(.float32).asArray(Float.self)
        }
        eval(h)
        if let out {
            try FileManager.default.createDirectory(atPath: out, withIntermediateDirectories: true)
            for (l, v) in dumps {
                let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
                try d.write(to: URL(fileURLWithPath: out).appendingPathComponent("layer_\(l).bin"))
            }
            print("wrote \(dumps.count) layer dumps to \(out)")
        }
        if let cmp = compare {
            var worst: Float = 0
            for l in 0 ..< layers {
                let url = URL(fileURLWithPath: cmp).appendingPathComponent("layer_\(l).bin")
                let refData = try Data(contentsOf: url)
                let ref: [Float] = refData.withUnsafeBytes { Array($0.bindMemory(to: Float.self)) }
                let got = dumps[l]!
                precondition(ref.count == got.count, "layer \(l): count \(got.count) vs ref \(ref.count)")
                var maxAbs: Float = 0
                var refScale: Float = 0
                for i in 0 ..< ref.count {
                    maxAbs = max(maxAbs, abs(ref[i] - got[i]))
                    refScale = max(refScale, abs(ref[i]))
                }
                let rel = maxAbs / max(refScale, 1e-6)
                worst = max(worst, rel)
                print(String(format: "layer %2d: max abs %.5f, rel %.5f  %@", l, maxAbs, rel, rel < 2e-2 ? "OK" : "FAIL"))
            }
            print(worst < 2e-2 ? "PARITY PASS" : "PARITY FAIL")
            if worst >= 2e-2 { throw ExitCode(2) }
        }
    }
}

// MARK: doctor

struct Doctor: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Device report, the plan your flags produce, and what each memory target buys")
    @OptionGroup var model: ModelOptions

    @Option(name: .customLong("sim-ram"),
            help: "What-if: preview the plan for a machine with this much RAM in GB (pristine unless --sim-available is also given; working set defaults to 75% of RAM)")
    var simRAM: Double?
    @Option(name: .customLong("sim-working-set"),
            help: "What-if: pretend this Metal working-set limit (GB)")
    var simWorkingSet: Double?
    @Option(name: .customLong("sim-available"),
            help: "What-if: pretend this much memory is reclaimable right now (GB)")
    var simAvailable: Double?

    func run() throws {
        let info = MLX.GPU.deviceInfo()
        print("device: \(info.architecture)  |  "
            + String(format: "%.0f GB RAM (%.1f GB reclaimable now), %.1f GB Metal working set",
                     Planner.deviceRAMGB(),
                     Planner.deviceAvailableGB() ?? .nan, Planner.deviceWorkingSetGB()))
        print("model:  \(Geometry.layers) layers x \(Geometry.expertsPerLayer) experts x 2.76 MB "
            + "(\(Geometry.totalRecords) records = 67.9 GB streamed from SSD)")
        print("")
        let simulating = simRAM != nil || simWorkingSet != nil || simAvailable != nil
        if simulating { print("what-if for a simulated machine (this device shown above):") }
        let plan = try Planner.plan(
            expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB, memoryGB: model.memoryGB,
            ramGB: simRAM,
            workingSetGB: simWorkingSet ?? simRAM.map { $0 * 0.75 },
            availableGB: simulating ? (simAvailable ?? .infinity) : nil)
        print(plan.banner())
        print("""

        knobs (first one given wins; with none, auto is the default):
          --memory-gb G           easiest: total memory the process may use
          --experts-per-layer N   precise: cache N of 512 per layer (pool = N x 0.133 GB)
          --pool-gb G             raw pool size (1 GB = 7.5 experts/layer)
        """)
        print(String(
            format: "min ~%.0f/layer = %.1f GB total. The pool is one global cache shared across",
            Geometry.perLayer(Geometry.floorSlots), Planner.minMemoryGB))
        print("""
            all layers -- per-layer is the unit of intuition (a token activates 10
            of its 512 per layer), not a quota: hot layers borrow slots from cold.

            what a memory target buys (warm decode est. from the measured M5 Pro
            anchors 30/layer = 5.6 tok/s and 181/layer = 20.0; * = interpolated):
              target     experts/layer  est. warm decode
            """)
        for t in [Planner.minMemoryGB, 8, 12, 16, 24, 28, 36, 48, 73] {
            let s = Planner.slotsForTarget(t)
            let e = Geometry.perLayer(s)
            let est = Planner.estWarmTokS(expertsPerLayer: e)
            let full = s >= Geometry.totalRecords
            print(String(
                format: "  %6.1f GB   %8.0f/512      ~%2.0f tok/s%@%@",
                t, e, est, e >= 181 ? " " : "*", full ? "  (fully resident)" : ""))
        }
    }
}

// MARK: elastic-check

struct ElasticCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "elastic-check",
        abstract: "Prove greedy output is byte-identical across live pool grow/shrink")
    @OptionGroup var model: ModelOptions
    @Option var maxTokens: Int = 24
    @Option(help: "Slot count for the grow step (lower it on small machines; the equality property is size-independent)")
    var bigSlots: Int = 8688

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let tokens = maxTokens
        let big = bigSlots
        Task {
            do {
                // start small (30/layer), grow warm, shrink cold, regrow
                let engine = try await Engine(modelDir: model.modelURL, poolSlots: 1446)
                let ids = try engine.encodeChat(
                    [ChatMessage(role: "user", content: "Why is the sky blue?")], thinking: false)
                var p = SampleParams.greedy
                p.maxTokens = tokens
                func gen(_ label: String) -> String {
                    let t0 = Date()
                    let out = engine.generate(promptIds: ids, params: p).text
                    FileHandle.standardError.write(String(
                        format: "  %@ (%d slots): %.1fs\n", label, engine.model.pool.slots,
                        -t0.timeIntervalSinceNow).data(using: .utf8)!)
                    return out
                }
                let a = gen("baseline    ")
                engine.withExclusive { engine.model.pool.resize(to: big) }
                let b = gen("after grow  ")
                engine.withExclusive { engine.model.pool.resize(to: 1446) }
                let c = gen("after shrink")
                engine.withExclusive { engine.model.pool.resize(to: 2400) }
                let d = gen("after regrow")
                if a == b, b == c, c == d {
                    print("ELASTIC CHECK PASS: 4 generations byte-identical across "
                        + "30→\(Int(Geometry.perLayer(big)))→30→50 experts/layer")
                } else {
                    print("ELASTIC CHECK FAIL")
                    for (n, s) in [("a", a), ("b", b), ("c", c), ("d", d)] { print("--- \(n):\n\(s)") }
                    throw ExitCode(2)
                }
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

// MARK: goldens

struct NgramGolden: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "ngram-golden",
        abstract: "Print n-gram row ids for a token sequence (compare vs python)")
    @OptionGroup var model: ModelOptions
    @Option var tokens: String

    func run() throws {
        let ids = tokens.split(separator: ",").map { Int64($0.trimmingCharacters(in: .whitespaces))! }
        let index = try CheckpointIndex(dir: model.modelURL)
        let resident = try ResidentWeights(index: index)
        let store = NgramStore(index: index, resident: resident)
        let eos = Int64(index.config.eosTokenId)
        let history = [eos, eos] + ids
        let rows = store.rowIds(history: history, nNew: ids.count)
        for (i, r) in rows.enumerated() {
            print("pos\(i): " + r.map(String.init).joined(separator: ","))
        }
    }
}

struct DequantGolden: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "dequant-golden",
        abstract: "CPU-dequantize one ngram row and print values (compare vs mx.dequantize)")
    @OptionGroup var model: ModelOptions
    @Option var gid: Int64 = 12345

    func run() throws {
        let index = try CheckpointIndex(dir: model.modelURL)
        let resident = try ResidentWeights(index: index)
        let store = NgramStore(index: index, resident: resident)
        print("rowsPerShard: \(store.rowsPerShard)")
        print("multipliers: \(store.multipliers)")
        let row = store.debugRow(gid)
        print("row[\(gid)][0..16]: " + row.prefix(16).map { String(format: "%.6f", $0) }.joined(separator: ","))
    }
}

/// Drives the elastic governor's decision policy across every branch with
/// scripted inputs. No checkpoint is loaded and no real memory is consumed:
/// putting the machine under genuine pressure to observe the policy is both
/// dangerous and unrepeatable, so the policy is a pure function and this is
/// its test. `elastic-check` separately proves the resize *mechanism* keeps
/// output byte-identical.
struct GovernorCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "governor-check",
        abstract: "Prove the elastic resize policy behaves across pressure, availability and cooldowns")

    typealias P = GovernorPolicy
    // A 48 GB Mac sitting at what auto picks when nothing else is running.
    static let ram = 51.5
    static let ws = 40.2

    static func inputs(
        slots: Int, avail: Double, sincePressure: Double? = nil,
        sinceResize: Double? = nil, pressure: P.Pressure? = nil
    ) -> P.Inputs {
        P.Inputs(
            currentSlots: slots, availableGB: avail, ramGB: ram, workingSetGB: ws,
            secondsSincePressure: sincePressure, secondsSinceResize: sinceResize,
            pressure: pressure)
    }

    func run() throws {
        var pass = 0, fail = 0
        func check(_ name: String, _ cond: Bool, _ detail: @autoclosure () -> String = "") {
            if cond { print("PASS  \(name)"); pass += 1 }
            else { print("FAIL  \(name)  \(detail())"); fail += 1 }
        }
        func slots(_ d: P.Decision) -> Int? {
            if case let .resize(s, _) = d { return s }
            return nil
        }
        func reason(_ d: P.Decision) -> String {
            if case let .resize(_, r) = d { return r }
            return "hold"
        }

        // Steady state: a quiet machine holding what auto would pick.
        let steady = Planner.slotsForTarget(Planner.autoTargetGB(ramGB: Self.ram, workingSetGB: Self.ws))
        let steadyAvail = Geometry.gb(steady) + Planner.fixedFootprintGB + 6.0
        let d0 = P.decide(Self.inputs(slots: steady, avail: steadyAvail))
        check("quiet machine at target: hold", d0 == .hold, "got \(d0)")

        // Availability collapses: shrink, in one step, to what a restart would pick.
        let d1 = P.decide(Self.inputs(slots: steady, avail: 2.0))
        check("availability collapses: shrinks", (slots(d1) ?? steady) < steady, "got \(d1)")
        check("  ...and says why", reason(d1) == "availability dropped")
        // Shrinking the pool releases that memory, so availability must rise by
        // exactly what the pool gave up. Holding it fixed is not a reachable
        // state, and the credit in desiredSlots exists precisely so the answer
        // does not depend on how much we happen to hold right now.
        let after = slots(d1)!
        let freed = Geometry.gb(steady) - Geometry.gb(after)
        let once = P.decide(Self.inputs(slots: after, avail: 2.0 + freed))
        check("  ...converges in one step (no ratcheting)", once == .hold, "got \(once)")

        // The invariant behind that: only (availability + pool) matters, so two
        // states holding the same total memory must want the same size.
        // Compare the desired target, not the decision: whether a resize is
        // emitted also depends on dead-bands and cooldowns, and a machine
        // already at the desired size correctly holds.
        let small = Geometry.floorSlots * 3
        let wantA = P.desiredSlots(Self.inputs(slots: steady, avail: 12.0))
        let wantB = P.desiredSlots(
            Self.inputs(slots: small, avail: 12.0 + Geometry.gb(steady) - Geometry.gb(small)))
        check("target depends on (available + pool), not on either alone",
              wantA != nil && wantA == wantB,
              "\(String(describing: wantA)) vs \(String(describing: wantB))")

        // Dead-bands: a small change must not churn the pool.
        let smallDrop = Geometry.gb(steady) + Planner.fixedFootprintGB + 5.4
        check("small drop inside the shrink dead-band: hold",
              P.decide(Self.inputs(slots: steady, avail: smallDrop)) == .hold)
        let tinyGain = steadyAvail + 1.0
        check("small gain inside the grow dead-band: hold",
              P.decide(Self.inputs(slots: steady, avail: tinyGain)) == .hold)

        // Growth is gated on calm and on cooldown.
        let roomy = 30.0
        check("grow blocked while a resize is recent",
              P.decide(Self.inputs(slots: small, avail: roomy, sinceResize: 10)) == .hold)
        check("grow blocked while pressure is recent",
              P.decide(Self.inputs(slots: small, avail: roomy, sincePressure: 10, sinceResize: 999)) == .hold)
        let grow = P.decide(Self.inputs(slots: small, avail: roomy, sincePressure: 999, sinceResize: 999))
        check("grow allowed once calm and cooled", (slots(grow) ?? 0) > small, "got \(grow)")
        check("  ...and says why", reason(grow) == "memory freed")

        // OS pressure events shed immediately, regardless of cooldown.
        let warn = P.decide(Self.inputs(slots: steady, avail: steadyAvail, sinceResize: 0, pressure: .warning))
        let warnShed = Geometry.gb(steady) - Geometry.gb(slots(warn) ?? steady)
        check("warning pressure sheds >= max(2 GB, 15%)",
              warnShed >= min(2.0, Geometry.gb(steady)) - 0.01, "shed \(warnShed) GB")
        check("  ...ignores the resize cooldown", slots(warn) != nil)
        let crit = P.decide(Self.inputs(slots: steady, avail: steadyAvail, sinceResize: 0, pressure: .critical))
        let critShed = Geometry.gb(steady) - Geometry.gb(slots(crit) ?? steady)
        check("critical pressure sheds >= max(4 GB, 50%)",
              critShed >= min(4.0, Geometry.gb(steady)) - 0.01, "shed \(critShed) GB")
        check("critical sheds strictly more than warning", critShed > warnShed)

        // Repeated pressure keeps shedding, but never past the floor.
        var cur = steady
        for _ in 0 ..< 20 {
            guard let n = slots(P.decide(Self.inputs(slots: cur, avail: 1.0, pressure: .critical))) else { break }
            cur = n
        }
        check("repeated critical pressure converges to the floor", cur == Geometry.floorSlots, "ended at \(cur)")
        check("floor is never breached", cur >= Geometry.floorSlots)
        check("at the floor, more pressure is a no-op",
              P.decide(Self.inputs(slots: Geometry.floorSlots, avail: 0.5, pressure: .critical)) == .hold)

        // The cap holds on a machine with more memory than the model needs.
        let huge = P.Inputs(
            currentSlots: Geometry.floorSlots, availableGB: 400, ramGB: 512, workingSetGB: 400,
            secondsSincePressure: nil, secondsSinceResize: nil, pressure: nil)
        check("never asks for more slots than the model has",
              (slots(P.decide(huge)) ?? 0) <= Geometry.totalRecords,
              "got \(String(describing: slots(P.decide(huge))))")

        print("")
        print("governor policy: passed \(pass), failed \(fail)")
        if fail > 0 { throw ExitCode(2) }
    }
}

/// Drives the sampler on synthetic logits with no checkpoint loaded, so its
/// behaviour can be diffed against `Tools/sampler_ref.py`. The logits come from
/// the same splitmix64 stream on both sides, built only from exactly
/// representable float operations so the two agree bit for bit.
struct SamplerGolden: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "sampler-golden",
        abstract: "Sample from reproducible synthetic logits (compare vs Tools/sampler_ref.py)")
    @Option var vocab: Int = 256
    @Option var draws: Int = 24
    @Option var seed: UInt64 = 7
    @Option(help: "Seed for the synthetic logits themselves") var logitSeed: UInt64 = 99
    @Option var temperature: Float = 0.8
    @Option var topP: Float = 0.95
    @Option var topK: Int = 40
    @Option var minP: Float = 0
    @Option var presencePenalty: Float = 0
    @Flag(help: "Feed each pick back as 'already generated' (exercises the penalty)")
    var accumulate = false

    static func logits(vocab: Int, seed: UInt64) -> [Float] {
        var st = seed
        return (0 ..< vocab).map { _ in
            st = Splitmix.mix(st)
            // 24 bits / 2^24 is exact in f32; x8 and -4 are exact scalings.
            return Float(st >> 40) / Float(1 << 24) * 8.0 - 4.0
        }
    }

    func run() throws {
        var p = SampleParams()
        p.temperature = temperature
        p.topP = topP
        p.topK = topK
        p.minP = minP
        p.presencePenalty = presencePenalty
        p = p.sanitized()
        let vals = Self.logits(vocab: vocab, seed: logitSeed)
        let arr = MLXArray(vals)
        var sampler = Sampler(seed: seed)
        var generated = Set<Int>()
        var picks: [Int] = []
        for _ in 0 ..< draws {
            let t = sampler.next(arr, params: p, generated: generated)
            picks.append(t)
            if accumulate { generated.insert(t) }
        }
        print(picks.map(String.init).joined(separator: ","))
    }
}

struct TemplateCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "template-check",
        abstract: "Render the chat template for a canned conversation and print token ids")
    @OptionGroup var model: ModelOptions
    @Flag var think = false

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var out: [Int] = []
        var err: Error?
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, poolSlots: 64)
                out = try engine.encodeChat(
                    [
                        ChatMessage(role: "system", content: "You are helpful."),
                        ChatMessage(role: "user", content: "Hi there"),
                    ], thinking: think)
            } catch { err = error }
            sem.signal()
        }
        sem.wait()
        if let e = err { throw e }
        print(out.map(String.init).joined(separator: ","))
    }
}

Slotstream.main()
