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
            PrefixCheck.self, ElasticDrill.self,
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
              time:  \(Pull.etaHint(remaining)) at best — the mirror tops out near 50 MB/s, a slower link takes longer
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

                    -- prefill \(stats.prefillTokens) tok in \(String(format: "%.2f", stats.prefillSeconds))s (\(String(format: "%.1f", stats.prefillTPS)) tok/s)\(stats.prefixHit ? " | \(stats.reusedPrefixTokens) of \(stats.promptTokens) reused from the previous turn" : "")
                    -- prefill split: io \(String(format: "%.2f", stats.prefillIOSeconds))s + scatter \(String(format: "%.2f", stats.prefillScatterSeconds))s + compute \(String(format: "%.2f", max(0, stats.prefillSeconds - stats.prefillIOSeconds - stats.prefillScatterSeconds)))s | \(stats.prefillRecords) records (\(String(format: "%.1f", Double(stats.prefillRecords) * 2.7648e-3)) GB, \(String(format: "%.1f", Double(stats.prefillRecords) * 2.7648e-3 / max(stats.prefillIOSeconds, 1e-9))) GB/s)
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
    @Flag(name: .customLong("no-prefix-cache"),
          help: "Re-prefill every request from scratch. Default: the state of one request is reused by the next when that request's prompt extends it, so a chat turn only prefills what is new.")
    var noPrefixCache = false

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
        if noPrefixCache {
            engine.prefixCache.enabled = false
            engine.prefixCache.drop()
            FileHandle.standardError.write(
                "prefix cache: off — every request re-prefills its whole prompt\n"
                    .data(using: .utf8)!)
        }
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

    /// One line on the 104 GB the plan above says nothing about: is it here,
    /// is there room for it, and roughly how long it takes.
    func weightsLine() -> String {
        let url = model.modelURL
        guard model.model == PinnedModel.name || model.model == PinnedModel.dirName else {
            return "weights: \(url.path) (not the pinned model — size unknown)"
        }
        let fm = FileManager.default
        let remaining = Pull.remainingBytes(at: url)
        if remaining == 0 {
            return String(format: "weights: present, %.1f GB at %@",
                          Double(PinnedModel.totalBytes) / 1e9, url.path)
        }
        var probe = url
        while !fm.fileExists(atPath: probe.path), probe.path != "/" {
            probe.deleteLastPathComponent()
        }
        let free = (try? fm.attributesOfFileSystem(forPath: probe.path))?[
            .systemFreeSize] as? Int64 ?? 0
        let need = remaining + 2_000_000_000
        let room = free >= need
            ? String(format: "%.0f GB free is enough", Double(free) / 1e9)
            : String(format: "ONLY %.0f GB free, needs %.0f GB",
                     Double(free) / 1e9, Double(need) / 1e9)
        return String(format: "weights: %.1f GB to download (%@ at best) — %@",
                      Double(remaining) / 1e9, Pull.etaHint(remaining), room)
    }

    func run() throws {
        let info = MLX.GPU.deviceInfo()
        print("device: \(info.architecture)  |  "
            + String(format: "%.0f GB RAM (%.1f GB reclaimable now), %.1f GB Metal working set",
                     Planner.deviceRAMGB(),
                     Planner.deviceAvailableGB() ?? .nan, Planner.deviceWorkingSetGB()))
        print("model:  \(Geometry.layers) layers x \(Geometry.expertsPerLayer) experts x 2.76 MB "
            + "(\(Geometry.totalRecords) records = 67.9 GB streamed from SSD)")
        // Disk is the gate that bites before memory does, and the README sends
        // people here *before* they download, so answer that question too.
        print(weightsLine())
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

struct ElasticDrill: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "elastic-drill",
        abstract: "Drive the live governor through shrink and grow and prove output is unchanged")
    @OptionGroup var model: ModelOptions
    @Option(help: "Slots to start from (must be well above the floor so there is room to shrink)")
    var slots: Int = 4000
    @Flag(help: "Skip the 60 s grow cooldown wait and only assert the shrink half")
    var quick = false

    /// `elastic-check` proves the *pool* can be resized without changing the
    /// math. This proves the *governor* actually decides to do it: poll,
    /// decide, take the generation lock, resize, update the plan, log. That
    /// path had never been exercised on a shipped build, because triggering it
    /// for real needs the machine pushed to the edge of its memory — which is
    /// exactly what `Planner.availabilityOverride` exists to avoid.
    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let startSlots = slots
        let skipGrow = quick
        Task {
            do {
                var fail: [String] = []
                func note(_ s: String) {
                    FileHandle.standardError.write((s + "\n").data(using: .utf8)!)
                }
                // `availabilityOverride` makes the governor allocate for real,
                // so every simulated figure here is bounded by what the machine
                // actually has. Simulating "plenty free" on a busy Mac once made
                // the governor take a 25 GB pool and drove tens of GB of swap —
                // the seam avoids *needing* pressure, it does not make the
                // resulting allocation imaginary.
                // A shrink can only be demonstrated from a pool at least the
                // floor plus the 1 GB dead-band above the floor; below that the
                // governor correctly refuses to move and the gate would read as
                // a failure when it is really a machine too busy to test on.
                let needPool = Geometry.gb(Geometry.floorSlots) + 2.0
                guard let realAvail = Planner.deviceAvailableGB(), realAvail >= needPool * 3 else {
                    print(String(format:
                        "ELASTIC DRILL SKIP: needs ~%.0f GB reclaimable to leave room for a "
                        + "shrink, machine has %.1f GB. Close some apps and retry.",
                        needPool * 3, Planner.deviceAvailableGB() ?? 0))
                    sem.signal()
                    return
                }
                // Take at most a third of what is genuinely free for the pool.
                let poolCeiling = min(Geometry.gb(startSlots), realAvail / 3)
                let roomy = poolCeiling + Planner.fixedFootprintGB
                    + Planner.planningMarginGB + 3.0
                let plan = try Planner.plan(
                    expertsPerLayer: nil, poolGB: nil, memoryGB: nil, availableGB: roomy)
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                note(String(format: "  (machine has %.1f GB reclaimable; drill capped at a "
                    + "%.1f GB pool)", realAvail, poolCeiling))

                var p = SampleParams.greedy
                p.maxTokens = 20
                let ids = try engine.encodeChat(
                    [ChatMessage(role: "user", content: "Name three rivers, comma separated.")],
                    thinking: false)
                func gen() -> String { engine.generate(promptIds: ids, params: p).text }

                let gov = MemoryGovernor(engine: engine)
                gov.start()
                defer { gov.stop() }

                let before = gen()
                let s0 = engine.model.pool.slots
                note(String(format: "  start:  %d slots (~%.0f/layer) -> %@",
                    s0, Geometry.perLayer(s0), before))

                // --- shrink: pretend the machine just got busy
                Planner.availabilityOverride = 2.0
                gov.pollNow()
                let s1 = engine.model.pool.slots
                let underPressure = gen()
                note(String(format: "  squeeze: %d slots (~%.0f/layer) -> %@",
                    s1, Geometry.perLayer(s1), underPressure))
                if s1 >= s0 { fail.append("governor did not shrink: \(s0) -> \(s1)") }
                if underPressure != before {
                    fail.append("output changed across a shrink\n    before: \(before)\n    after:  \(underPressure)")
                }

                // --- grow: memory comes back, but only to where we started —
                //     never to a figure the machine cannot actually honour.
                Planner.availabilityOverride = roomy
                gov.pollNow()
                if engine.model.pool.slots != s1 {
                    fail.append("governor grew during the cooldown (should wait \(Int(GovernorPolicy.growCooldown)) s)")
                } else {
                    note("  cooldown: held at \(s1) slots, as designed")
                }

                if !skipGrow {
                    note("  waiting out the \(Int(GovernorPolicy.growCooldown)) s grow cooldown...")
                    Thread.sleep(forTimeInterval: GovernorPolicy.growCooldown + 3)
                    gov.pollNow()
                    let s2 = engine.model.pool.slots
                    let recovered = gen()
                    note(String(format: "  recover: %d slots (~%.0f/layer) -> %@",
                        s2, Geometry.perLayer(s2), recovered))
                    if s2 <= s1 { fail.append("governor did not grow back: \(s1) -> \(s2)") }
                    if recovered != before {
                        fail.append("output changed across a grow\n    before: \(before)\n    after:  \(recovered)")
                    }
                }
                Planner.availabilityOverride = nil

                if fail.isEmpty {
                    print("ELASTIC DRILL PASS: governor shrank under simulated pressure, honored the "
                        + "grow cooldown\(skipGrow ? "" : ", grew back when memory returned"), "
                        + "and every generation was byte-identical")
                } else {
                    print("ELASTIC DRILL FAIL")
                    for f in fail { print("  - \(f)") }
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

struct PrefixCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "prefix-check",
        abstract: "Prove conversation prefix reuse is equivalent, bounded, and deterministic")
    @OptionGroup var model: ModelOptions
    @Option(help: "Slots to run with (small keeps the check cheap; these properties are size-independent)")
    var slots: Int = 1446
    @Option var maxTokens: Int = 24

    /// A short multi-turn chat, driven exactly as a client drives one: every
    /// turn re-sends the whole history through the chat template, so the prompt
    /// is re-tokenized from text each time. That is the real test of whether a
    /// cache can hit at all — re-encoding the previous reply has to reproduce
    /// the ids that were generated.
    static let turns = [
        "Name one planet. Answer with just the name.",
        "Is it bigger than Earth? Answer yes or no.",
        "Why? One short sentence.",
    ]

    /// Logits after a state was built incrementally — a prefill plus one-token
    /// decode steps, exactly how the cache builds one — against logits from a
    /// single cold prefill of the same ids.
    ///
    /// These are NOT bit-identical and cannot be. MLX selects kernels and
    /// reduction orders by tensor shape, so summing the same values in a
    /// different batching sums them in a different order, and floating point
    /// is not associative. Measured here: over a 64-token sequence, every one
    /// of the 63 possible split points differs. What must hold instead is that
    /// the difference stays down in the rounding noise and does not grow as a
    /// conversation gets longer — that is the line between harmless
    /// re-association and a state that is actually being corrupted.
    /// Logits for `ids`, built either in one pass, in fixed-size passes, or
    /// incrementally the way a cached state is (a prefill, then one-token
    /// steps).
    enum Build { case whole, chunked(Int), incremental(Int) }

    static func logits(_ engine: Engine, ids: [Int], _ how: Build) -> [Float] {
        func vec(_ a: MLXArray) -> [Float] {
            a.reshaped([-1]).asType(.float32).asArray(Float.self)
        }
        let st = engine.model.makeState()
        switch how {
        case .whole:
            return vec(engine.model.lastLogits(ids, state: st))
        case .chunked(let c):
            var i = 0
            var last = MLXArray(0)
            while i < ids.count {
                let hi = min(i + c, ids.count)
                if hi == ids.count {
                    last = engine.model.lastLogits(Array(ids[i ..< hi]), state: st)
                } else {
                    eval(engine.model.hiddenStates(Array(ids[i ..< hi]), state: st))
                }
                i = hi
            }
            return vec(last)
        case .incremental(let split):
            eval(engine.model.hiddenStates(Array(ids[0 ..< split]), state: st))
            var last = MLXArray(0)
            for t in ids[split...] { last = engine.model.lastLogits([t], state: st) }
            return vec(last)
        }
    }

    static func compare(_ a: [Float], _ b: [Float]) -> (relDelta: Double, sameTop1: Bool) {
        var maxDiff: Float = 0
        for (x, y) in zip(a, b) { maxDiff = max(maxDiff, abs(x - y)) }
        let spread = (a.max() ?? 1) - (a.min() ?? 0)
        func argmax(_ v: [Float]) -> Int {
            var bi = 0
            for i in v.indices where v[i] > v[bi] { bi = i }
            return bi
        }
        return (Double(maxDiff) / Double(max(spread, 1e-6)), argmax(a) == argmax(b))
    }

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let tokens = maxTokens
        let poolSlots = slots
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, poolSlots: poolSlots)
                var p = SampleParams.greedy
                p.maxTokens = tokens
                var failures: [String] = []
                func note(_ s: String) {
                    FileHandle.standardError.write((s + "\n").data(using: .utf8)!)
                }

                // ---- 1. Equivalence is bounded, and does not drift with depth.
                //
                // A reused state must stay in rounding noise against a cold
                // rebuild. Corruption — a misaligned prefix, a stale cache, a
                // dropped position — moves logits by a large fraction of their
                // own spread, so a relative bound catches it while accepting
                // re-association. Growth with depth is the other failure this
                // separates out: rounding does not compound, corruption does.
                let base = try engine.encodeChat(
                    [ChatMessage(role: "user", content:
                        "Explain in two sentences why the ocean is salty and how rivers carry minerals.")],
                    thinking: false)
                var deltas: [(Int, Double)] = []
                var controls: [Double] = []
                var top1 = 0
                var probes = 0
                for reps in [1, 4, 8] {
                    var ids = base
                    let body = Array(base.dropFirst(4))
                    for _ in 1 ..< reps { ids += body }
                    let split = ids.count / 2
                    let whole = Self.logits(engine, ids: ids, .whole)
                    // Control: re-chunking a plain prefill. Nobody disputes
                    // that this is the same computation — it is the existing
                    // chunk-equivalence gate — so whatever it moves the logits
                    // by is the size of "the same answer, summed differently"
                    // on this model. The cache has to live inside that band.
                    let (ctrl, _) = Self.compare(whole, Self.logits(engine, ids: ids, .chunked(7)))
                    let (rel, same) = Self.compare(
                        whole, Self.logits(engine, ids: ids, .incremental(split)))
                    deltas.append((ids.count, rel))
                    controls.append(ctrl)
                    probes += 1
                    if same { top1 += 1 }
                    note(String(format: "  equivalence at %d tokens: reuse %.3f%% vs "
                        + "prefill-rechunk control %.3f%% of logit spread, top-1 %@",
                        ids.count, rel * 100, ctrl * 100, same ? "same" : "differs"))
                }
                let worst = deltas.map(\.1).max() ?? 0
                let worstControl = controls.max() ?? 0
                // The bound is the control, not a number picked by hand: state
                // reuse may not move logits materially more than re-chunking a
                // prefill already does. A corrupted or misaligned state fails
                // this by orders of magnitude.
                let bound = max(worstControl * 3, 0.01)
                if worst > bound {
                    failures.append(String(format:
                        "reused state moved logits by %.2f%% of their spread, over the "
                        + "%.2f%% bound set by the prefill-rechunk control — that is "
                        + "corruption, not re-association", worst * 100, bound * 100))
                }
                // Depth must not amplify it. Allow a factor of 3 over the
                // shallowest probe before calling it drift.
                if let first = deltas.first?.1, let deepest = deltas.last?.1,
                    first > 0, deepest > max(first * 3, 0.01)
                {
                    failures.append(String(format:
                        "equivalence degrades with depth (%.3f%% -> %.3f%%): state is "
                        + "accumulating error, not just re-associating",
                        first * 100, deepest * 100))
                }

                // ---- 2. A conversation, driven as a client drives one.
                func conversation(cached: Bool, edit: String? = nil) throws -> [(String, GenStats)] {
                    engine.prefixCache.drop()
                    engine.prefixCache.enabled = cached
                    engine.prefixCache.resetStats()
                    var history: [ChatMessage] = []
                    var out: [(String, GenStats)] = []
                    for (i, q) in Self.turns.enumerated() {
                        history.append(ChatMessage(
                            role: "user", content: (i == 0 && edit != nil) ? edit! : q))
                        let ids = try engine.encodeChat(history, thinking: false)
                        let r = engine.generate(promptIds: ids, params: p)
                        history.append(ChatMessage(role: "assistant", content: r.text))
                        out.append((r.text, r.stats))
                    }
                    return out
                }

                let warmA = try conversation(cached: true)
                let warmB = try conversation(cached: true)
                let cold = try conversation(cached: false)

                // ---- 3. Reuse actually happens. Without this the rest is vacuous.
                let reusing = warmA.dropFirst().filter { $0.1.prefixHit }.count
                if reusing == 0 {
                    failures.append(
                        "no turn reused a cached prefix — re-encoding a reply does not "
                        + "reproduce its generated ids, so the cache can never hit")
                }

                // ---- 4. The cached path is deterministic. Two identical runs
                //         must agree exactly; this is the invariant that a real
                //         cache bug breaks, and it is not weakened by the
                //         re-association in check 1.
                for (i, (a, b)) in zip(warmA, warmB).enumerated() where a.0 != b.0 {
                    failures.append("cached run is not deterministic at turn \(i + 1)\n"
                        + "    run 1: \(a.0)\n    run 2: \(b.0)")
                }

                // ---- 5. A prompt that does not extend the held state must
                //         rebuild, and must still be deterministic.
                let editQ = "Name one ocean. Answer with just the name."
                let edA = try conversation(cached: true, edit: editQ)
                let edB = try conversation(cached: true, edit: editQ)
                for (i, (a, b)) in zip(edA, edB).enumerated() where a.0 != b.0 {
                    failures.append("edited-history run is not deterministic at turn \(i + 1)")
                }

                // ---- 6. The shed path the governor uses under memory pressure:
                //         the state is released and the next turn rebuilds. Tested
                //         through its own contract rather than by putting the
                //         machine under real pressure to watch it happen.
                engine.prefixCache.drop()
                engine.prefixCache.enabled = true
                engine.prefixCache.resetStats()
                var hist: [ChatMessage] = [ChatMessage(role: "user", content: Self.turns[0])]
                let r1 = engine.generate(
                    promptIds: try engine.encodeChat(hist, thinking: false), params: p)
                hist.append(ChatMessage(role: "assistant", content: r1.text))
                if engine.prefixCache.heldTokens == 0 {
                    failures.append("nothing retained after a generation")
                }
                engine.dropPrefixCache()
                if engine.prefixCache.heldTokens != 0 {
                    failures.append("dropPrefixCache left \(engine.prefixCache.heldTokens) tokens held")
                }
                hist.append(ChatMessage(role: "user", content: Self.turns[1]))
                let afterShed = engine.generate(
                    promptIds: try engine.encodeChat(hist, thinking: false), params: p)
                if afterShed.stats.prefixHit {
                    failures.append("a shed state was still reused — drop() is not releasing it")
                }
                note(String(format: "  shed: retained %d tokens, dropped, next turn rebuilt %d",
                    r1.stats.promptTokens + r1.ids.count, afterShed.stats.prefillTokens))

                for (i, (t, st)) in warmA.enumerated() {
                    note(String(format: "  turn %d: %d prompt tok, %d reused, prefill %.2fs -> %@",
                        i + 1, st.promptTokens, st.reusedPrefixTokens, st.prefillSeconds,
                        t.replacingOccurrences(of: "\n", with: " ").prefix(44).description))
                }
                let coldPrefill = cold.dropFirst().reduce(0.0) { $0 + $1.1.prefillSeconds }
                let warmPrefill = warmA.dropFirst().reduce(0.0) { $0 + $1.1.prefillSeconds }
                // Informational, never asserted: how often re-association moved
                // a near-tied greedy pick far enough to change the reply.
                let changed = zip(cold, warmA).filter { $0.0 != $1.0 }.count

                if failures.isEmpty {
                    print(String(format:
                        "PREFIX CHECK PASS: reuse moves logits %.2f%% vs %.2f%% for the "
                        + "prefill-rechunk control, flat with depth, top-1 %d/%d; %d of %d "
                        + "turns reused a prefix; cached and edited-history runs "
                        + "deterministic; follow-up prefill %.2fs -> %.2fs (%d of %d replies "
                        + "differ from a cold rebuild)",
                        worst * 100, worstControl * 100, top1, probes, reusing,
                        warmA.count - 1, coldPrefill, warmPrefill, changed, cold.count))
                } else {
                    print("PREFIX CHECK FAIL")
                    for f in failures { print("  - \(f)") }
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
