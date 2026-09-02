// slotstream CLI: run · serve · parity · doctor · goldens

import ArgumentParser
import Foundation
import MLX
import Slotstream
import SlotstreamDiagnostics

struct Slotstream: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "slotstream",
        abstract: "Qwen3.8-Flash-Next on Apple Silicon via SSD-streamed experts + cache slots.",
        version: SlotstreamBuild.version,
        subcommands: [
            Run.self, Serve.self, Pull.self, Doctor.self, Parity.self, ElasticCheck.self,
            NgramGolden.self, DequantGolden.self, TemplateCheck.self, SamplerGolden.self, GovernorCheck.self,
            PrefixCheck.self, ElasticDrill.self, RuntimeCheck.self, PullCheck.self,
            MTPParity.self, MTPAccept.self, MTPCheck.self, MTPFixtureInputs.self, MTPBench.self, MTPPassCost.self,
            ContextCheck.self, PrefillScheduleCommand.self,
        ]
    )
}

/// Weights-free regressions for process and cache safety invariants that are
/// otherwise only observable during a 100+ GB model run. The checks themselves
/// live in SlotstreamDiagnostics; this is the adapter that prints them.
struct RuntimeCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "runtime-check",
        abstract: "Check process RSS accounting and prefix-cache bounds without loading weights")

    func run() throws {
        try CheckRendering.emit(Diagnostics.runtime(), banner: "RUNTIME CHECK PASS")
    }
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
                expert cache gets what remains after the conservatively charged \
                resident/runtime/context footprint and a 1 GB margin. Run \
                `slotstream doctor --memory-gb N` for the exact cache size. \
                Default: auto -- 70% of RAM, kept 2 GB under \
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
                30/layer = 4 GB) plus the fixed runtime/context footprint. The pool \
                itself is one GLOBAL cache shared across layers -- N is the \
                intuitive unit, not a per-layer quota: hot layers borrow slots \
                from cold ones. Takes precedence over --memory-gb/--pool-gb. \
                Default: auto (see `slotstream doctor`).
                """))
    var expertsPerLayer: Int?

    @Option(name: .customLong("pool-gb"),
            help: "Raw expert-pool size in GB (1 GB ≈ 7.5 experts/layer). Beats --memory-gb; loses to --experts-per-layer.")
    var poolGB: Double?

    @Option(
        name: .customLong("max-ram-percent"),
        help: ArgumentHelp(
            "Auto only: the largest share of this Mac's RAM auto may target (default 70).",
            discussion: """
                Lower it to keep more of the machine for your other apps; auto \
                still sizes down on its own when they are actually holding \
                memory. It cannot raise the target past the point where more \
                cache stops buying decode speed (~33 GB) — use --memory-gb for \
                that. Ignored when an explicit memory knob is given.
                """))
    var maxRAMPercent: Double?

    @Option(
        name: .customLong("mtp"),
        help: ArgumentHelp(
            "Speculative decode with the MTP draft head: auto | on | off (default auto).",
            discussion: """
                The model's own next-next-token head drafts a few tokens \
                and the main model verifies them in one batched pass. Costs \
                a fixed 1.6 GB of memory; auto enables it only when the \
                expert cache still reaches ~120 experts/layer after paying, \
                which is where the multiplier beats spending the same RAM on \
                cache. Needs the separately converted mtp.safetensors next \
                to the model (Tools/mtp_convert.py).
                """))
    var mtp: String = "auto"

    // Resolved once here so the tokenizer, the draft-head probe, and the index
    // all see the real directory; Foundation will not list a symlinked one.
    var modelURL: URL { ModelLocator.resolve(model).resolvingSymlinksInPath() }

    func mtpMode() throws -> Planner.MTPMode {
        guard let m = Planner.MTPMode(rawValue: mtp) else {
            throw PlanError("--mtp must be auto, on, or off (got \(mtp))")
        }
        return m
    }

    /// Resolve knobs -> plan, print the announce, return it. Also the first
    /// place a stranger hits with no weights — offer the download right there.
    func announcedPlan(maxContext: Int = ContextPolicy.maxTokens) throws -> MemoryPlan {
        try ensureWeights()
        let plan = try Planner.plan(
            expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB,
            ramPercent: maxRAMPercent,
            mtp: mtpMode(), mtpAvailable: MTPWeights.present(modelDir: modelURL),
            maxContextTokens: maxContext)
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
        var remaining = WeightStore.remainingBytes(at: url)
        var corrupt: [PinnedModel.File] = []
        if remaining == 0 {
            // Size alone cannot distinguish a valid file from same-size
            // corruption. Hash before loading; this takes seconds and prevents
            // a damaged tokenizer/config/weight from reaching the engine.
            corrupt = WeightStore.invalidFiles(at: url)
            if corrupt.isEmpty { return }
            remaining = corrupt.reduce(0) { $0 + $1.size }
            print("found \(corrupt.count) same-size file(s) that fail the pinned sha256: "
                + corrupt.map(\.path).joined(separator: ", "))
        }
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
              time:  \(WeightStore.etaHint(remaining)) at best (a 1 Gbit/s link) — a slower link takes longer
              to:    \(url.path)
              disk:  \(String(format: "%.1f", Double(free) / 1e9)) GB free
            """)
        fflush(stdout)
        switch askYesNo("download now? [Y/n] ") {
        case .some(true):
            try WeightStore.download(to: url, log: { print($0) })
            try WeightStore.verify(at: url, log: { print($0) })
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
                if let e = engine.contextError(promptTokens: ids.count) { throw PlanError(e) }
                let wait = PrefillSchedule.estSeconds(tokens: ids.count, maxChunk: engine.generator.prefillChunk)
                FileHandle.standardError.write(
                    "prompt tokens: \(ids.count) (~\(PrefillSchedule.describe(seconds: wait)) to the first token at this plan)\n"
                        .data(using: .utf8)!)
                // A long prompt reports its progress so minutes of silence do
                // not read as a hang; short prompts stay quiet.
                let progress = PrefillProgressReporter(
                    quietBelowTokens: 2048, maxChunk: engine.generator.prefillChunk) { line in
                    FileHandle.standardError.write("  \(line)\n".data(using: .utf8)!)
                }
                engine.generator.onPrefillProgress = progress.report
                var params: SampleParams = greedy ? .greedy : (think ? .thinking : .instruct)
                params.maxTokens = maxTokens
                let t0 = Date()
                let (_, _, stats) = engine.generate(
                    promptIds: ids, params: params, onToken: { _, delta in
                    fputs(delta, stdout)
                    fflush(stdout)
                    return true
                })
                print("")
                let hs = String(format: "%.3f", stats.expertHitRate)
                let perLayer = String(format: "~%.0f/%d experts per layer", plan.expertsPerLayerCached, Geometry.expertsPerLayer)
                FileHandle.standardError.write(
                    """

                    -- prefill \(stats.prefillTokens) tok in \(String(format: "%.2f", stats.prefillSeconds))s (\(String(format: "%.1f", stats.prefillTPS)) tok/s)\(stats.prefixHit ? " | \(stats.reusedPrefixTokens) of \(stats.promptTokens) reused from the previous turn" : "")
                    -- prefill split: io \(String(format: "%.2f", stats.prefillIOSeconds))s + scatter \(String(format: "%.2f", stats.prefillScatterSeconds))s + compute \(String(format: "%.2f", max(0, stats.prefillSeconds - stats.prefillIOSeconds - stats.prefillScatterSeconds)))s | \(stats.prefillRecords) records (\(String(format: "%.1f", Double(stats.prefillRecords) * 2.7648e-3)) GB, \(String(format: "%.1f", Double(stats.prefillRecords) * 2.7648e-3 / max(stats.prefillIOSeconds, 1e-9))) GB/s)
                    -- decode \(stats.decodeTokens) tok in \(String(format: "%.2f", stats.decodeSeconds))s (\(String(format: "%.2f", stats.decodeTPS)) tok/s)\(stats.verifyPasses > 0 ? String(format: " | mtp %d/%d drafts accepted (%.0f%%), %d verify passes", stats.acceptedDrafts, stats.draftedTokens, 100 * stats.draftAcceptRate, stats.verifyPasses) : "")
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
    @Option(
        name: .customLong("max-context"),
        help: ArgumentHelp(
            "Longest prompt plus reply accepted per request, in tokens (default and ceiling \(ContextPolicy.maxTokens)).",
            discussion: """
                Past it a request is refused with a 400 that says why, instead \
                of stalling. The ceiling is the largest context slotstream has \
                measured on real hardware, not a memory limit: the model is \
                trained for 262,144 tokens and context state costs ~27 KiB per \
                token. What a long prompt really costs is time, since all of it \
                is read before the first token; `doctor` prints the wait for \
                this machine and `context-check` measures a longer prompt.
                """))
    var maxContext: Int = ContextPolicy.maxTokens
    @Flag(name: .customLong("no-elastic"),
          help: "Pin the cache at its startup size. Default: an auto-sized cache resizes itself between requests as memory pressure and availability change (explicit size flags are always pinned).")
    var noElastic = false
    @Flag(name: .customLong("no-prefix-cache"),
          help: "Re-prefill every request from scratch. Default: the state of one request is reused by the next when that request's prompt extends it, so a chat turn only prefills what is new.")
    var noPrefixCache = false

    func run() throws {
        if let why = ContextPolicy.validationError(maxContext) { throw PlanError(why) }
        let plan = try model.announcedPlan(maxContext: maxContext)
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
        // Long prompts announce themselves in the server log with the wait to
        // expect, then report by quarters; anything under 2k tokens is quiet.
        let progress = PrefillProgressReporter(
            quietBelowTokens: 2048, maxChunk: engine.generator.prefillChunk) { line in
            let stamp = DateFormatter.localizedString(
                from: Date(), dateStyle: .none, timeStyle: .medium)
            FileHandle.standardError.write("[\(stamp)] \(line)\n".data(using: .utf8)!)
        }
        engine.generator.onPrefillProgress = progress.report
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
        guard layers >= 1, layers <= Geometry.layers else {
            throw ValidationError("--layers must be between 1 and \(Geometry.layers)")
        }
        let fields = tokens.split(separator: ",", omittingEmptySubsequences: false)
        let parsed = fields.map { Int($0.trimmingCharacters(in: .whitespaces)) }
        guard !fields.isEmpty, parsed.allSatisfy({ $0 != nil }) else {
            throw ValidationError("--tokens must be a non-empty comma-separated list of integers")
        }
        let ids = parsed.compactMap { $0 }
        let index = try CheckpointIndex(dir: model.modelURL)
        guard ids.allSatisfy({ $0 >= 0 && $0 < index.config.vocabSize }) else {
            throw ValidationError("--tokens contains an id outside 0..<\(index.config.vocabSize)")
        }
        let m = try Qwen4ExpModel(index: index, poolSlots: 2048, runLayers: layers)
        try m.validate()
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
                guard refData.count % MemoryLayout<Float>.size == 0 else {
                    throw ValidationError("layer \(l) reference is not a whole number of Float32 values")
                }
                let ref: [Float] = refData.withUnsafeBytes { Array($0.bindMemory(to: Float.self)) }
                guard let got = dumps[l] else {
                    throw ValidationError("no generated dump for layer \(l)")
                }
                guard ref.count == got.count else {
                    throw ValidationError(
                        "layer \(l) reference has \(ref.count) floats, generated dump has \(got.count)")
                }
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
        abstract: "Machine report, the plan your flags produce, and what each memory target buys")
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

    @Flag(name: .customLong("json"),
          help: "Print the resolved plan as JSON instead of the report. Estimates are unrounded here; the report rounds them.")
    var asJSON = false

    @Option(name: .customLong("max-context"),
            help: "Preview the plan `serve --max-context N` would announce (default and ceiling \(ContextPolicy.maxTokens)).")
    var maxContext: Int = ContextPolicy.maxTokens

    /// One line on the 104 GB the plan above says nothing about: is it here,
    /// is there room for it, and roughly how long it takes.
    func weightsLine() -> String {
        let url = model.modelURL
        guard model.model == PinnedModel.name || model.model == PinnedModel.dirName else {
            return "weights: \(url.path) (not the pinned model — size unknown)"
        }
        let fm = FileManager.default
        let remaining = WeightStore.remainingBytes(at: url)
        if remaining == 0 {
            return String(format: "weights: present by size, %.1f GB at %@ (run pull --verify for hashes)",
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
                      Double(remaining) / 1e9, WeightStore.etaHint(remaining), room)
    }

    func run() throws {
        // --json is for machines: emit the plan and nothing else.
        let quiet = asJSON
        let info = MLX.GPU.deviceInfo()
        if !quiet {
            print("device: \(info.architecture)  |  "
                + String(format: "%.0f GB RAM (%.1f GB reclaimable now), %.1f GB Metal working set",
                         Planner.deviceRAMGB(),
                         Planner.deviceAvailableGB() ?? .nan, Planner.deviceWorkingSetGB()))
        }
        if !quiet {
            print("model:  \(Geometry.layers) layers x \(Geometry.expertsPerLayer) experts x 2.76 MB "
                + "(\(Geometry.totalRecords) records = 67.9 GB streamed from SSD)")
        }
        // Disk is the gate that bites before memory does, and the README sends
        // people here *before* they download, so answer that question too.
        if !quiet { print(weightsLine()) }
        if !quiet { print("") }
        let simulating = simRAM != nil || simWorkingSet != nil || simAvailable != nil
        if simulating, !quiet { print("what-if for a simulated machine (this device shown above):") }
        let simulatedAvailable = simulating
            ? (simAvailable ?? simRAM ?? Planner.deviceRAMGB()) : nil
        // A what-if plans against a Machine that says it is simulated, so the
        // plan it produces is marked and can never be handed to Engine.load.
        let device: Machine = simulating
            ? Machine(
                ramGB: simRAM ?? Planner.deviceRAMGB(),
                workingSetGB: simWorkingSet ?? (simRAM.map { $0 * 0.75 } ?? Planner.deviceWorkingSetGB()),
                availableGB: simulatedAvailable, isSimulated: true)
            : .current()
        let plan = try Planner.plan(
            PlanRequest(
                expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB,
                memoryGB: model.memoryGB, maxRAMPercent: model.maxRAMPercent,
                mtp: try model.mtpMode(), maxContextTokens: maxContext),
            on: device,
            mtpAvailable: MTPWeights.present(modelDir: model.modelURL))
        if asJSON {
            let data = try JSONSerialization.data(
                withJSONObject: plan.json(), options: [.prettyPrinted, .sortedKeys])
            print(String(decoding: data, as: UTF8.self))
            return
        }
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

            what a memory target buys (conservative warm-decode estimate from
            measured M5 Pro anchors: 30/layer = 6.0, 150/layer = 11.6; the last
            column is the wait before the first token of a prompt filling the
            whole context, follow-up turns read only what is new):
              target     experts/layer  est. warm decode   pass    full \(maxContext)-token prompt
            """)
        for t in [Planner.minMemoryGB, 10, 12, 16, 24, 28, 36, 48, 73]
        where t >= Planner.minMemoryGB
        {
            let s = Planner.slotsForTarget(t)
            let e = Geometry.perLayer(s)
            let est = Planner.estWarmTokS(expertsPerLayer: e)
            let full = s >= Geometry.totalRecords
            let chunk = Planner.prefillChunkFor(poolBudgetGB: Planner.poolBudgetGB(t))
            let wait = PrefillSchedule.estSeconds(tokens: maxContext, maxChunk: chunk)
            print(String(
                format: "  %6.1f GB   %8.0f/512      ~%2.0f tok/s%@   %5d   ~%@",
                t, e, est, full ? " (resident)" : "", chunk,
                PrefillSchedule.describe(seconds: wait)))
        }
        print("""

        time to first token at this plan, by prompt length (the pass shrinks past ~4k
        tokens so its transient memory stays inside what was measured):
        """)
        let chunk = plan.prefillChunk
        var lengths = [2048, 8192, 16384].filter { $0 < maxContext }
        lengths.append(maxContext)
        let row = lengths.map { n -> String in
                let secs = PrefillSchedule.estSeconds(tokens: n, maxChunk: chunk)
                let label = n % 1024 == 0 ? "\(n / 1024)k" : "\(n)"
                return "\(label) ~\(PrefillSchedule.describe(seconds: secs))"
            }
        print("  " + row.joined(separator: " · ") + " (the cap)")
        print("""
          context state is ~27 KiB per token; the cap of \(ContextPolicy.maxTokens) is the largest context
          measured so far, not a memory limit. `slotstream context-check --tokens N` measures a
          longer prompt on this Mac and stops before it swaps.
        """)
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
    var bigSlots: Int = 960

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let tokens = maxTokens
        let big = bigSlots
        Task {
            do {
                // stay near the safe floor; equality is independent of size
                let smallSlots = Geometry.floorSlots
                let engine = try await Engine(modelDir: model.modelURL, poolSlots: smallSlots)
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
                engine.withExclusive { engine.model.pool.resize(to: big); engine.publishPoolSnapshot() }
                let b = gen("after grow  ")
                engine.withExclusive { engine.model.pool.resize(to: smallSlots); engine.publishPoolSnapshot() }
                let c = gen("after shrink")
                engine.withExclusive { engine.model.pool.resize(to: 800); engine.publishPoolSnapshot() }
                let d = gen("after regrow")
                if a == b, b == c, c == d {
                    print("ELASTIC CHECK PASS: 4 generations byte-identical across "
                        + "\(Int(Geometry.perLayer(smallSlots)))→\(Int(Geometry.perLayer(big)))"
                        + "→\(Int(Geometry.perLayer(smallSlots)))→\(Int(Geometry.perLayer(800))) experts/layer")
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
                // floor plus both policy dead-bands: shrink needs 1 GB and the
                // later recovery needs 2 GB. Below that, the governor correctly
                // refuses to grow and the drill would misreport a policy failure.
                // The planner's round-trip reserves prefill/cache state from
                // this budget too, so use 3 GB to leave the desired expert pool
                // safely more than 2 GB above the floor after that reservation.
                let extraSlots = Int((3.0e9 / Geometry.recordBytes).rounded(.up))
                let minStartSlots = Geometry.floorSlots + extraSlots
                let minStartPool = Geometry.gb(minStartSlots)
                let minAvailable = max(12.0, minStartPool * 3)
                guard let realAvail = Planner.deviceAvailableGB(), realAvail >= minAvailable else {
                    print(String(format:
                        "ELASTIC DRILL SKIP: needs ~%.0f GB reclaimable to leave room for a "
                        + "shrink, machine has %.1f GB. Close some apps and retry.",
                        minAvailable, Planner.deviceAvailableGB() ?? 0))
                    sem.signal()
                    return
                }
                // Take at most a third of what is genuinely free for the pool,
                // but always start far enough above the floor to cross the
                // governor's 1 GB dead-band. Running an auto replan here used
                // to subtract availability slack and cache costs again, turning
                // --slots 1000 into a pool that was too small to shrink.
                let cappedSlots = Int(realAvail / 3 * 1e9 / Geometry.recordBytes)
                let initialSlots = min(max(startSlots, minStartSlots), cappedSlots)
                let poolCeiling = Geometry.gb(initialSlots)
                let chunk = Planner.prefillChunkFor(poolBudgetGB: poolCeiling)
                let cacheTokens = Planner.prefixCacheTokensFor(poolBudgetGB: poolCeiling)
                let target = poolCeiling + Planner.fixedFootprintGB
                    + Planner.prefillCostGB(chunk)
                    + Planner.prefixCacheCostGB(tokens: cacheTokens)
                    + Planner.planningMarginGB
                let plan = MemoryPlan(
                    source: .auto, slots: initialSlots, targetGB: target,
                    ramGB: Planner.deviceRAMGB(),
                    workingSetGB: Planner.deviceWorkingSetGB(),
                    ramPercent: Planner.defaultRAMPercent,
                    availableGB: realAvail, clamped: false,
                    prefillChunk: chunk, prefixCacheTokens: cacheTokens,
                    notes: ["elastic drill bounded test plan"])
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
                let shrinkInputs = GovernorPolicy.Inputs(
                    currentSlots: s0, availableGB: 2.0,
                    ramGB: plan.ramGB, workingSetGB: plan.workingSetGB,
                    ramPercent: plan.ramPercent)
                let startCache = engine.prefixCache.maxTokens
                gov.pollNow()
                let s1 = engine.model.pool.slots
                let underPressure = gen()
                note(String(format: "  squeeze: %d slots (~%.0f/layer) -> %@",
                    s1, Geometry.perLayer(s1), underPressure))
                if s1 >= s0 { fail.append("governor did not shrink: \(s0) -> \(s1)") }
                // Expect the controls for the pool the governor actually landed
                // on. decide() applies dead-bands and a per-step shed cap, so
                // the resulting pool is frequently not the target desiredSlots
                // suggested; asserting against that suggestion made this gate
                // pass on a quiet machine and fail on a busy one, which is the
                // opposite of what a memory gate is for. Tracking s1 still
                // proves the point -- the live controls follow the real pool --
                // and the ceiling must separately have gone down, so this
                // cannot pass by never changing at all.
                let shrinkControls = GovernorPolicy.liveControls(
                    for: s1, inputs: shrinkInputs)
                let expectedChunk = shrinkControls.prefillChunk
                let expectedCache = shrinkControls.prefixCacheTokens
                if engine.prefixCache.maxTokens >= startCache {
                    fail.append("prefix-cache ceiling did not shrink at all: stayed at \(startCache)")
                }
                if engine.generator.prefillChunk != expectedChunk {
                    fail.append("live prefill chunk stayed at \(engine.generator.prefillChunk), expected \(expectedChunk) after shrink")
                }
                if engine.prefixCache.maxTokens != expectedCache {
                    fail.append("live prefix-cache ceiling stayed at \(engine.prefixCache.maxTokens), expected \(expectedCache) after shrink")
                }
                if underPressure != before {
                    fail.append("output changed across a shrink\n    before: \(before)\n    after:  \(underPressure)")
                }

                // --- grow: memory comes back, but only to where we started —
                //     never to a figure the machine cannot actually honour.
                // The governor credits the currently resident (shrunken) pool
                // and fixed weights before replanning. Find the smallest safe
                // availability stimulus that reconstructs the actual starting
                // pool; deriving it from the hand-built target loses the
                // planner's nonlinear prefill/cache reservations and can land
                // below the 2 GB grow dead-band.
                func desiredSlots(at available: Double) -> Int {
                    GovernorPolicy.desiredSlots(GovernorPolicy.Inputs(
                        currentSlots: s1, availableGB: available,
                        ramGB: plan.ramGB, workingSetGB: plan.workingSetGB,
                        ramPercent: plan.ramPercent)) ?? s1
                }
                var low = 0.0
                var high = realAvail
                if desiredSlots(at: high) < s0 {
                    fail.append("real reclaimable memory cannot reconstruct the bounded starting pool")
                } else {
                    for _ in 0 ..< 48 {
                        let mid = (low + high) / 2
                        if desiredSlots(at: mid) < s0 { low = mid } else { high = mid }
                    }
                }
                let recoveryAvailability = high
                let recoveryInputs = GovernorPolicy.Inputs(
                    currentSlots: s1, availableGB: recoveryAvailability,
                    ramGB: plan.ramGB, workingSetGB: plan.workingSetGB,
                    ramPercent: plan.ramPercent)
                note(String(
                    format: "  recovery stimulus: %.1f GB available -> %d desired slots (%.1f GB growth)",
                    recoveryAvailability,
                    GovernorPolicy.desiredSlots(recoveryInputs) ?? s1,
                    Geometry.gb((GovernorPolicy.desiredSlots(recoveryInputs) ?? s1) - s1)))
                Planner.availabilityOverride = recoveryAvailability
                gov.pollNow()
                if engine.model.pool.slots != s1 {
                    fail.append("governor grew during the cooldown (should wait \(Int(GovernorPolicy.growCooldown)) s)")
                } else {
                    note("  cooldown: held at \(s1) slots, as designed")
                }

                if !skipGrow {
                    note("  waiting out the \(Int(GovernorPolicy.growCooldown)) s grow cooldown...")
                    try await Task.sleep(
                        for: .seconds(GovernorPolicy.growCooldown + 3))
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
    var slots: Int = Geometry.floorSlots
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
        let fields = tokens.split(separator: ",", omittingEmptySubsequences: false)
        let parsed = fields.map { Int64($0.trimmingCharacters(in: .whitespaces)) }
        guard !fields.isEmpty, parsed.allSatisfy({ $0 != nil }) else {
            throw ValidationError("--tokens must be a non-empty comma-separated list of integers")
        }
        let ids = parsed.compactMap { $0 }
        let index = try CheckpointIndex(dir: model.modelURL)
        guard ids.allSatisfy({ $0 >= 0 && $0 < Int64(index.config.vocabSize) }) else {
            throw ValidationError("--tokens contains an id outside 0..<\(index.config.vocabSize)")
        }
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
        guard gid >= 0 else { throw ValidationError("--gid must not be negative") }
        let index = try CheckpointIndex(dir: model.modelURL)
        let resident = try ResidentWeights(index: index)
        let store = NgramStore(index: index, resident: resident)
        guard gid >= 0, gid < Int64(store.rowCapacity) else {
            throw ValidationError("--gid must be between 0 and \(store.rowCapacity - 1)")
        }
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

    func run() throws {
        try CheckRendering.emitTally(Diagnostics.governorPolicy(), label: "governor policy")
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

    func run() throws {
        var p = SampleParams()
        p.temperature = temperature
        p.topP = topP
        p.topK = topK
        p.minP = minP
        p.presencePenalty = presencePenalty
        let picks = try Goldens.sampler(
            vocab: vocab, draws: draws, seed: seed, logitSeed: logitSeed, params: p,
            accumulate: accumulate)
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
                out = try await Engine.encodeChatWithoutModel(
                    modelDir: model.modelURL,
                    messages: [
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
