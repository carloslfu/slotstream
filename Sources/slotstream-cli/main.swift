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
            Run.self, Serve.self, Launch.self, Stop.self, Pull.self, Doctor.self, PrefixCacheCommand.self, Parity.self, ElasticCheck.self,
            NgramGolden.self, DequantGolden.self, TemplateCheck.self, SamplerGolden.self, GovernorCheck.self,
            PrefixCheck.self, PrefixExactCheck.self, ElasticDrill.self, RuntimeCheck.self, PullCheck.self,
            MTPParity.self, MTPAccept.self, MTPCheck.self, MTPRowCheck.self, MTPFixtureInputs.self, MTPBench.self, MTPPassCost.self,
            ContextCheck.self, PrefillScheduleCommand.self, SweepCheck.self,
            VisionParity.self, OptimizationStateCheck.self, PackExperts.self,
            ExpertLookaheadCapture.self, ExpertLookaheadBench.self, ExpertLookaheadCheck.self, ExpertLookaheadPredict.self,
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
                resident/runtime/context footprint and a nominal 1 GB margin. Run \
                `slotstream doctor --memory-gb N` for the exact cache size. \
                This is a budget, not an instruction to fill RAM: context and \
                temporary workspace use memory as needed. Auto will not trade \
                away cache above the measured decode range for more context; \
                --max-context N chooses that tradeoff explicitly. \
                Default: auto -- a model-specific target based on measured \
                tradeoffs, bounded by 70% of RAM, the Metal working set minus \
                2 GB, and live availability. The chosen plan is announced at \
                startup. An explicit target pins the cache and disables auto \
                resizing. --experts-per-layer / --pool-gb take precedence.
                """))
    var memoryGB: Double?

    @Option(name: .customLong("memory-limit-gb"), help: ArgumentHelp(
        "Use up to this many GB, adapting the cache as available memory changes.",
        discussion: """
            Replaces the default model ceiling while keeping GPU and system headroom. \
            The cache shrinks when other apps need memory and can grow back within \
            this limit. --max-ram-percent can further restrict it. Cannot be combined \
            with --memory-gb, --pool-gb or --experts-per-layer, which pin the cache. \
            Use doctor with the same options to see the budget available now.
            """))
    var memoryLimitGB: Double?

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
                memory. It cannot raise the model's default ceiling, which \
                reflects measured tradeoffs on tested hardware. Use \
                --memory-limit-gb for an adaptive ceiling beyond that default; \
                this percentage can restrict it further. Ignored when a fixed \
                memory or cache size is given.
                """))
    var maxRAMPercent: Double?

    @Option(
        name: .customLong("mtp"),
        help: ArgumentHelp(
            "Speculative decode with the MTP draft head: auto | on | off (default auto).",
            discussion: """
                The model's own next-next-token head drafts \(Generator.defaultDraftDepth) tokens by default \
                and the main model verifies them in one batched pass. \
                SLOTSTREAM_DRAFT_DEPTH overrides the depth (1...16). Costs \
                a fixed 1.6 GB of memory; auto enables it only when the \
                expert cache still reaches ~120 experts/layer after paying, \
                which is where the multiplier beats spending the same RAM on \
                cache. Needs the separately converted mtp.safetensors next \
                to the model (Tools/mtp_convert.py).
                """))
    var mtp: String = "auto"

    @Option(
        name: .customLong("vision"),
        help: ArgumentHelp(
            "Accept images: auto | on | off (default auto).",
            discussion: """
                The checkpoint carries a vision tower; auto loads it the \
                first time a request sends a picture and keeps it resident \
                after that (0.9 GB, reserved inside the process memory \
                target before loading). Image attention also needs workspace. \
                A request is refused if its reservation or real headroom is \
                insufficient. off refuses images outright.
                """))
    var vision: String = "auto"

    // Resolved once here so the tokenizer, the draft-head probe, and the index
    // all see the real directory; Foundation will not list a symlinked one.
    var modelURL: URL { ModelLocator.resolve(model).resolvingSymlinksInPath() }

    func validate() throws {
        if let limit = memoryLimitGB {
            guard limit.isFinite, limit >= Planner.minMemoryGB else {
                throw ValidationError("--memory-limit-gb must be finite and at least \(Planner.minMemoryGB) GB")
            }
            guard memoryGB == nil, poolGB == nil, expertsPerLayer == nil else {
                throw ValidationError("--memory-limit-gb cannot be combined with --memory-gb, --pool-gb or --experts-per-layer")
            }
        }
    }

    func mtpMode() throws -> Planner.MTPMode {
        guard let m = Planner.MTPMode(rawValue: mtp) else {
            throw PlanError("--mtp must be auto, on, or off (got \(mtp))")
        }
        return m
    }

    func rejectAdaptiveLimitForFixedDiagnostic() throws {
        guard memoryLimitGB == nil else {
            throw ValidationError("--memory-limit-gb does not apply to this fixed diagnostic profile; use run, serve or doctor to exercise an adaptive budget")
        }
    }

    func visionMode() throws -> Planner.VisionMode {
        guard let v = Planner.VisionMode(rawValue: vision) else {
            throw PlanError("--vision must be auto, on, or off (got \(vision))")
        }
        return v
    }

    /// Does this checkpoint carry a tower? Reads the shard headers only.
    func visionAvailable() -> Bool {
        guard let idx = try? CheckpointIndex(dir: modelURL) else { return false }
        return VisionTower.present(index: idx)
    }

    /// Resolve knobs -> plan, print the announce, return it. Also the first
    /// place a stranger hits with no weights — offer the download right there.
    func announcedPlan(maxContext: Int = ContextPolicy.defaultTokens, prefixCacheEnabled: Bool = true,
                       maxPrefillWait: Double = 30, qualification: Bool = false,
                       requireMTP: Bool = false) throws -> MemoryPlan {
        let configuration = try ContextConfiguration(maxContextTokens: maxContext,
            maxPrefillWaitMinutes: maxPrefillWait, qualification: qualification)
        let policy = try runtimePolicy(prefixCacheEnabled: prefixCacheEnabled)
        let requestedMTP = try mtpMode(); _ = try visionMode()
        if requireMTP, requestedMTP == .off {
            throw PlanError("this diagnostic requires the MTP draft head; --mtp off is incompatible")
        }
        try ensureWeights()
        let base = try Planner.plan(
            expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB, memoryLimitGB: memoryLimitGB,
            ramPercent: maxRAMPercent,
            mtp: requireMTP ? .on : requestedMTP, mtpAvailable: MTPWeights.present(modelDir: modelURL),
            vision: visionMode(), visionAvailable: visionAvailable(),
            maxContextTokens: maxContext, qualification: qualification,
            runtimePolicy: policy, decodeLookahead: DecodeLookaheadPlanning.environment(modelDirectory: modelURL))
        let plan = try runtimePlan(base, prefixCacheEnabled: prefixCacheEnabled).withRequestPolicy(configuration)
        if plan.source == .auto || plan.source == .memoryGB {
            try Planner.validateMemoryBudget(plan, availableGB: plan.availableGB)
        }
        FileHandle.standardError.write((plan.banner() + "\n").data(using: .utf8)!)
        return plan
    }

    /// The announce for a window that may be automatic. The automatic choice
    /// is printed under the plan; a startup lowering is one of the plan's notes.
    func announcedPlan(window: ContextWindowArgument, prefixCacheEnabled: Bool = true,
                       maxPrefillWait: Double = 30) throws -> MemoryPlan {
        if let tokens = window.tokens {
            return try announcedPlan(maxContext: tokens, prefixCacheEnabled: prefixCacheEnabled,
                maxPrefillWait: maxPrefillWait)
        }
        _ = try ContextConfiguration(maxPrefillWaitMinutes: maxPrefillWait)
        let policy = try runtimePolicy(prefixCacheEnabled: prefixCacheEnabled)
        let request = PlanRequest(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB, memoryLimitGB: memoryLimitGB,
            maxRAMPercent: maxRAMPercent, mtp: try mtpMode(), vision: try visionMode())
        try ensureWeights()
        let resolved = try Planner.resolveContextWindow(.automatic, request: request, on: .current(),
            mtpAvailable: MTPWeights.present(modelDir: modelURL), visionAvailable: visionAvailable(),
            runtimePolicy: policy, decodeLookahead: DecodeLookaheadPlanning.environment(modelDirectory: modelURL))
        let configuration = try ContextConfiguration(maxContextTokens: resolved.plan.maxContextTokens,
            maxPrefillWaitMinutes: maxPrefillWait)
        let plan = try runtimePlan(resolved.plan, prefixCacheEnabled: prefixCacheEnabled).withRequestPolicy(configuration)
        if plan.source == .auto || plan.source == .memoryGB {
            try Planner.validateMemoryBudget(plan, availableGB: plan.availableGB)
        }
        var announce = plan.banner() + "\n"
        if let automatic = resolved.automatic {
            announce += automatic.announcement(served: plan.maxContextTokens) + "\n"
        }
        FileHandle.standardError.write(announce.data(using: .utf8)!)
        return plan
    }

    /// The window `serve --max-context auto` would choose on this Mac now,
    /// with these options. Prints nothing and downloads nothing.
    func automaticWindow() throws -> Int {
        let request = PlanRequest(expertsPerLayer: expertsPerLayer, poolGB: poolGB, memoryGB: memoryGB, memoryLimitGB: memoryLimitGB,
            maxRAMPercent: maxRAMPercent, mtp: try mtpMode(), vision: try visionMode())
        return try Planner.resolveContextWindow(.automatic, request: request, on: .current(),
            mtpAvailable: MTPWeights.present(modelDir: modelURL), visionAvailable: visionAvailable(),
            runtimePolicy: try runtimePolicy(),
            decodeLookahead: DecodeLookaheadPlanning.environment(modelDirectory: modelURL)).plan.maxContextTokens
    }

    /// Whether the pinned model still has files to download. An explicit
    /// directory counts as present when it holds a config.
    func weightsMissing() -> Bool {
        guard model == PinnedModel.name || model == PinnedModel.dirName else {
            return !FileManager.default.fileExists(atPath: modelURL.appendingPathComponent("config.json").path)
        }
        return WeightStore.remainingBytes(at: modelURL) > 0
    }

    /// The announce, doctor and serving metadata share the same reservation
    /// resolution. Merely printing a simulated plan never makes it loadable.
    func runtimePlan(_ base: MemoryPlan, prefixCacheEnabled: Bool = true) throws -> MemoryPlan {
        try Planner.applyingRuntimePolicy(base, policy: runtimePolicy(prefixCacheEnabled: prefixCacheEnabled))
    }

    func runtimePolicy(prefixCacheEnabled: Bool = true) throws -> RuntimeAllocationPolicy {
        let env = ProcessInfo.processInfo.environment
        let chunk: Int?
        if let raw = env["SLOTSTREAM_PREFILL_CHUNK"] {
            guard let value = Int(raw) else { throw PlanError("SLOTSTREAM_PREFILL_CHUNK must be an integer") }
            chunk = value
        } else { chunk = nil }
        return try RuntimeAllocationPolicy(prefillChunkOverride: chunk,
            prefixCacheEnabled: prefixCacheEnabled && env["SLOTSTREAM_PREFIX_CACHE"] != "0")
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
        let have = max(0, PinnedModel.requiredBytes - remaining)
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
              time:  measured during download; compressed transfer and reconstruction overlap
              to:    \(url.path)
              disk:  \(String(format: "%.1f", Double(free) / 1e9)) GB free
            """)
        fflush(stdout)
        switch askYesNo("download now? [Y/n] ") {
        case .some(true):
            try withInterruptiblePull { cancellation in
                try WeightStore.download(to: url, transport: .automatic, cancellation: cancellation, log: { print($0); fflush(stdout) })
            }
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

/// `--max-context auto` (the default) or a token count.
enum ContextWindowArgument: ExpressibleByArgument, Equatable {
    case automatic
    case tokens(Int)

    init?(argument: String) {
        if argument.lowercased() == "auto" { self = .automatic; return }
        guard let tokens = Int(argument) else { return nil }
        self = .tokens(tokens)
    }

    var defaultValueDescription: String { "auto" }

    var tokens: Int? {
        if case .tokens(let tokens) = self { return tokens }
        return nil
    }
}

// MARK: run

struct Run: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Generate from a prompt")
    @OptionGroup var model: ModelOptions
    @Option(help: "Prompt plus reply context window: auto (this Mac's automatic window) or tokens up to \(ContextPolicy.maxTokens)")
    var maxContext: ContextWindowArgument = .automatic
    @Option(help: "Accepted request to first model token budget in minutes; 0 disables only time")
    var maxPrefillWait = 30.0
    @Option var prompt: String = "Why is the sky blue?"
    @Option(help: "Read the exact UTF-8 prompt from a file") var promptFile: String?
    @Option(help: "Write exact tokens, effective configuration and generation measurements as JSON")
    var statsJson: String?
    @Option(help: "Deterministic sampling seed") var seed: UInt64?
    @Flag(help: "Sample physical footprint during generation (diagnostic overhead)")
    var sampleFootprint = false
    @Option(help: "Maximum tokens to generate (<= 0 means as many as allowed)")
    var maxTokens: Int = 128
    @Flag(help: "Greedy sampling (deterministic)") var greedy = false
    @Flag(help: "Raw prompt (no chat template)") var raw = false
    @Flag(help: "Enable thinking mode") var think = false
    @Option(
        name: .customLong("image"),
        help: ArgumentHelp(
            "Path to an image to send with the prompt (repeatable).",
            discussion: """
                Read from disk here, by you, and sent inline — the server \
                itself never opens a path or a URL a request names.
                """))
    var images: [String] = []

    func run() throws {
        if raw, !images.isEmpty {
            throw PlanError("--raw has no chat template to place an image in; drop one of them")
        }
        _ = try ContextConfiguration(maxContextTokens: maxContext.tokens ?? ContextPolicy.defaultTokens,
            maxPrefillWaitMinutes: maxPrefillWait)
        let launchStart = RuntimeClock.now()
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let plan = try model.announcedPlan(window: maxContext, maxPrefillWait: maxPrefillWait)
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                let loadSeconds = RuntimeClock.seconds(since: launchStart)
                engine.generator.footprintSampling = sampleFootprint
                let control = try engine.beginRequest()
                let encodeStart = RuntimeClock.now()
                var promptText = prompt
                if let promptFile {
                    let handle = try FileHandle(forReadingFrom: URL(fileURLWithPath: promptFile))
                    defer { try? handle.close() }
                    var data = Data()
                    while true {
                        let (next, overflow) = data.count.addingReportingOverflow(65_536)
                        try control.checkInputBytes(overflow ? Int.max : next)
                        guard let part = try handle.read(upToCount: 65_536), !part.isEmpty else { break }
                        data.append(part)
                    }
                    try control.checkInputBytes(data.count)
                    guard let decoded = String(data: data, encoding: .utf8) else {
                        throw PlanError("prompt file must contain valid UTF-8")
                    }
                    promptText = decoded
                }
                let ids: [Int]
                var vision: VisionPrompt?
                if raw {
                    try control.checkInputBytes(promptText.utf8.count)
                    ids = engine.tokenizer.encode(text: promptText)
                } else {
                    var msg = ChatMessage(role: "user", content: promptText)
                    var retainedInputBytes = promptText.utf8.count
                    msg.images = try images.map { path in
                        let handle = try FileHandle(forReadingFrom: URL(fileURLWithPath: path))
                        defer { try? handle.close() }
                        let size = try handle.seekToEnd()
                        guard size > 0, size <= UInt64(VisionPreprocess.maxImageBytes) else {
                            throw PlanError("image must be nonempty and at most \(VisionPreprocess.maxImageBytes >> 20) MiB")
                        }
                        let encodedBytes = ((Int(size) + 2) / 3) * 4
                        let (next, overflow) = retainedInputBytes.addingReportingOverflow(encodedBytes)
                        try control.checkInputBytes(overflow ? Int.max : next)
                        retainedInputBytes = next
                        try handle.seek(toOffset: 0)
                        let d = try handle.read(upToCount: Int(size) + 1) ?? Data()
                        guard d.count == Int(size) else {
                            throw PlanError("image changed size while being read")
                        }
                        return d.base64EncodedString()
                    }
                    (ids, vision) = try engine.encodeChatWithVision([msg], thinking: think, request: control)
                }
                if let e = engine.contextError(promptTokens: ids.count) { throw PlanError(e) }
                let encodeSeconds = RuntimeClock.seconds(since: encodeStart)
                let wait = PrefillSchedule.estSeconds(tokens: ids.count, maxChunk: engine.generator.prefillChunk, tailAware: engine.model.optimizations.tailAwarePrefill)
                FileHandle.standardError.write(
                    "prompt tokens: \(ids.count) (~\(PrefillSchedule.describe(seconds: wait)) to the first token at this plan)\n"
                        .data(using: .utf8)!)
                // A long prompt reports its progress so minutes of silence do
                // not read as a hang; short prompts stay quiet.
                let progress = PrefillProgressReporter(
                    quietBelowTokens: 2048, maxChunk: engine.generator.prefillChunk) { line in
                    FileHandle.standardError.write("  \(line)\n".data(using: .utf8)!)
                }
                progress.tailAware = engine.model.optimizations.tailAwarePrefill
                engine.generator.onPrefillProgressAbsolute = progress.report
                var params: SampleParams = greedy ? .greedy : (think ? .thinking : .instruct)
                params.maxTokens = maxTokens
                params.seed = seed
                let t0 = Date()
                let (text, outputIds, stats) = engine.generate(
                    promptIds: ids, params: params, vision: vision, onToken: { _, delta in
                    fputs(delta, stdout)
                    fflush(stdout)
                    return true
                }, request: control)
                print("")
                if let statsJson {
                    let workspaceGB = engine.model.optimizations.layerExpertWorkspace
                        ? Double(engine.model.cfg.numExperts * engine.model.pool.recordBytes) / 1e9 : 0
                    // Conservative experimental allowance, not a calibrated
                    // production parameter family or a fixed-total comparison.
                    let scopeGB = engine.model.optimizations.readScopeEnabled
                        ? max(0, Planner.prefillCostGB(engine.model.optimizations.readScopeTokens)
                            - Planner.prefillCostGB(engine.generator.prefillChunk))
                            + Double(PrefixCache.fixedBytesPerEntry) / 1e9 : 0
                    let statsData = try JSONEncoder().encode(stats)
                    let routerGB = Double(stats.cachedRouterBytes) / 1e9
                    let payload: [String: Any] = [
                        "schema_version": 1,
                        "stats": try JSONSerialization.jsonObject(with: statsData),
                        "prompt_ids": ids, "output_ids": outputIds, "text": text,
                        "plan": plan.json(), "effective_prefill_chunk": engine.generator.prefillChunk,
                        "effective_pool_slots": engine.model.pool.slots,
                        "effective_prefill_cost_gb": Planner.prefillCostGB(engine.generator.prefillChunk),
                        "effective_expected_peak_gb": plan.expectedPeakGB + Planner.prefillCostGB(engine.generator.prefillChunk) - Planner.prefillCostGB(plan.prefillChunk) + workspaceGB + scopeGB + routerGB,
                        "extra_expert_workspace_gb": workspaceGB,
                        "extra_read_scope_allowance_gb": scopeGB,
                        "extra_router_cache_gb": routerGB,
                        "experimental_memory_family": workspaceGB > 0 || scopeGB > 0 || routerGB > 0,
                        "optimizations": try JSONSerialization.jsonObject(with: JSONEncoder().encode(engine.model.optimizations)),
                        "effective_mtp": engine.model.mtpHead != nil && engine.generator.speculationEnabled,
                        "load_seconds": loadSeconds, "encode_seconds": encodeSeconds,
                        "launch_seconds": RuntimeClock.seconds(since: launchStart),
                        "sampling": ["greedy": greedy, "seed": seed.map(String.init) ?? "default",
                                     "requested_max_tokens": String(maxTokens)],
                    ]
                    try JSONSerialization.data(withJSONObject: payload, options: [.sortedKeys])
                        .write(to: URL(fileURLWithPath: statsJson), options: .atomic)
                }
                if let error = stats.runtimeError { throw ModelError(error) }
                let hs = String(format: "%.3f", stats.expertHitRate)
                let perLayer = String(format: "~%.0f/%d experts per layer", plan.expertsPerLayerCached, Geometry.expertsPerLayer)
                let memoryObservation: String
                if let sample = stats.sampledFootprint {
                    memoryObservation = String(format: "sampled footprint peak %.3f GB", Double(sample.peakBytes) / 1e9)
                } else if let peak = stats.lifetimePhysicalFootprintPeakBytes {
                    memoryObservation = String(format: "lifetime footprint peak %.3f GB, current footprint %.3f GB",
                        Double(peak) / 1e9, Double(stats.physicalFootprintEndBytes) / 1e9)
                } else {
                    memoryObservation = String(format: "RSS high-water %.3f GB, current footprint %.3f GB",
                        Double(stats.lifetimeRSSPeakBytes) / 1e9, Double(stats.physicalFootprintEndBytes) / 1e9)
                }
                FileHandle.standardError.write(
                    """

                    -- prefill \(stats.prefillTokens) tok in \(String(format: "%.2f", stats.prefillSeconds))s (\(String(format: "%.1f", stats.prefillTPS)) tok/s)\(stats.prefixHit ? " | \(stats.reusedPrefixTokens) of \(stats.promptTokens) reused from the previous turn" : "")
                    -- prefill split: io \(String(format: "%.2f", stats.prefillIOSeconds))s + scatter \(String(format: "%.2f", stats.prefillScatterSeconds))s | \(stats.prefillRecords) records (\(String(format: "%.1f", Double(stats.prefillRecords) * 2.7648e-3)) GB, \(String(format: "%.1f", Double(stats.prefillRecords) * 2.7648e-3 / max(stats.prefillIOSeconds, 1e-9))) GB/s)
                    -- decode \(stats.decodeTokens) tok in \(String(format: "%.2f", stats.decodeSeconds))s (\(String(format: "%.2f", stats.decodeTPS)) tok/s)
                    \(RouterTrace.flush().map { $0 + "\n" } ?? "")\(MemTrace.on ? MemTrace.report() + "\n" : "")-- decode split: io \(String(format: "%.2f", stats.decodeIOSeconds))s + scatter \(String(format: "%.2f", stats.decodeScatterSeconds))s | \(stats.decodeRecords) records\(stats.verifyPasses > 0 ? String(format: " | mtp %d/%d drafts accepted (%.0f%%), %d verify passes", stats.acceptedDrafts, stats.draftedTokens, 100 * stats.draftAcceptRate, stats.verifyPasses) : "")
                    -- expert cache \(perLayer), hit rate \(hs) | ngram rows \(stats.ngramRowHits)h/\(stats.ngramRowMisses)m | \(memoryObservation) | total \(String(format: "%.1f", -t0.timeIntervalSinceNow))s

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
            "Longest prompt plus reply accepted per request: auto, or tokens up to \(ContextPolicy.maxTokens).",
            discussion: """
                auto (the default) picks this Mac's window: the largest of \
                32768, 65536, 131072 and 262144 that keeps speculative decoding, \
                retains one complete conversation and adds at most 10% to an \
                estimated request, without an unmeasured cache reduction. \
                `doctor` shows the choice and its tradeoff. \
                The configured window stays fixed for this engine; the planner \
                fits its state and workspaces before loading, and requests \
                above the window are refused. --max-prefill-wait separately \
                bounds accepted-request-to-first-token time; `context-check` \
                runs explicit capacity diagnostics.
                """))
    var maxContext: ContextWindowArgument = .automatic
    @Option(help: "Accepted request to first model token budget in minutes; 0 disables only time")
    var maxPrefillWait = 30.0
    @Flag(name: .customLong("no-elastic"),
          help: "Pin the cache at its startup size. Default: an auto-sized cache resizes itself between requests as memory pressure and availability change (explicit size flags are always pinned).")
    var noElastic = false
    @Flag(name: .customLong("no-prefix-cache"),
          help: "Re-prefill every request from scratch. Default: the state of one request is reused by the next when that request's prompt extends it, so a chat turn only prefills what is new, and a prefix that conversations share, such as a system prompt, is kept once for all of them.")
    var noPrefixCache = false
    @Option(name: .customLong("prefix-cache-dir"),
            help: ArgumentHelp(
                "Also keep conversation states on disk in this directory, so a restart or a conversation too long to keep in memory resumes without re-reading its prompt.",
                discussion: """
                    Off unless a directory is named. Files hold each conversation's token ids \
                    and model state; delete the directory to erase them. A file is used only \
                    by the same binary, model files and settings that wrote it. A prefix that \
                    conversations share, such as a system prompt or a document they all start \
                    with, is written once as a shared prefix and reused by every later \
                    conversation that starts with it.
                    """))
    var prefixCacheDir: String?
    @Option(name: .customLong("prefix-cache-disk-gb"),
            help: "Disk quota for --prefix-cache-dir in GB. When it is full, files of other builds go first, then states nobody continued, then parents kept for regenerating a reply, then conversations, then prefixes several conversations start with, least recently used first.")
    var prefixCacheDiskGB = Double(PersistentPrefixConfiguration.defaultMaxBytes) / 1e9
    @Option(name: .customLong("prefix-cache-min-tokens"),
            help: "Shortest state written to --prefix-cache-dir, in tokens; applies to conversation states and shared prefixes alike.")
    var prefixCacheMinTokens = PersistentPrefixConfiguration.defaultMinimumTokens
    @Option(name: .customLong("prefix-cache-max-age-days"),
            help: "Remove states in --prefix-cache-dir unused for this many days; 0 keeps them until the quota needs room.")
    var prefixCacheMaxAgeDays = Double(PersistentPrefixConfiguration.defaultMaxAgeDays)
    @Option(name: .customLong("idle-exit"),
            help: ArgumentHelp(
                "Stop after this many minutes with no requests and no registered agent still running; 0 keeps serving.",
                discussion: """
                    Off by default. `slotstream launch` starts its server with 30 and registers \
                    each agent it opens (POST /slotstream/clients), so the server stays while \
                    an agent is open and stops that long after the last one exits.
                    """))
    var idleExit = 0.0

    func run() throws {
        if let tokens = maxContext.tokens, let why = ContextPolicy.validationError(tokens) { throw PlanError(why) }
        guard idleExit.isFinite, idleExit >= 0, idleExit <= CodingToolLaunch.maximumIdleMinutes else {
            throw PlanError("--idle-exit must be between 0 and \(Int(CodingToolLaunch.maximumIdleMinutes)) minutes")
        }
        // `slotstream stop` sends SIGTERM, also while the model loads. Say so
        // in the log, then leave at once: disk cache files are written whole
        // or detected as torn.
        signal(SIGTERM, SIG_IGN)
        let terminate = DispatchSource.makeSignalSource(signal: SIGTERM, queue: .global())
        terminate.setEventHandler { Self.leave("stopping: asked to stop (SIGTERM)") }
        terminate.resume()
        var persistentConfiguration: PersistentPrefixConfiguration?
        if let dir = prefixCacheDir {
            guard !noPrefixCache else {
                throw PlanError("--prefix-cache-dir needs the in-memory prefix cache; remove --no-prefix-cache")
            }
            guard prefixCacheDiskGB.isFinite, prefixCacheDiskGB > 0, prefixCacheDiskGB < 1e9 else {
                throw PlanError("--prefix-cache-disk-gb must be a positive number of GB")
            }
            guard (1 ... ContextPolicy.modelLimit).contains(prefixCacheMinTokens) else {
                throw PlanError("--prefix-cache-min-tokens must be between 1 and \(ContextPolicy.modelLimit)")
            }
            guard prefixCacheMaxAgeDays.isFinite, prefixCacheMaxAgeDays >= 0, prefixCacheMaxAgeDays <= 36_500 else {
                throw PlanError("--prefix-cache-max-age-days must be between 0 and 36500")
            }
            let url = URL(fileURLWithPath: (dir as NSString).expandingTildeInPath, isDirectory: true)
            // Fail before the model loads, not after.
            try PersistentPrefixCache.prepareDirectory(url)
            persistentConfiguration = PersistentPrefixConfiguration(directory: url,
                maxBytes: Int64(prefixCacheDiskGB * 1e9), minimumTokens: prefixCacheMinTokens,
                maxAge: prefixCacheMaxAgeDays > 0 ? prefixCacheMaxAgeDays * 86_400 : nil)
        }
        let plan = try model.announcedPlan(window: maxContext, prefixCacheEnabled: !noPrefixCache, maxPrefillWait: maxPrefillWait)
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
        engine.maxContextTokens = plan.maxContextTokens
        // Long prompts announce themselves in the server log with the wait to
        // expect, then report elapsed progress, including a slow short suffix.
        let progress = PrefillProgressReporter(
            quietBelowTokens: 2048, maxChunk: engine.generator.prefillChunk) { line in
            let stamp = DateFormatter.localizedString(
                from: Date(), dateStyle: .none, timeStyle: .medium)
            FileHandle.standardError.write("[\(stamp)] \(line)\n".data(using: .utf8)!)
        }
        progress.tailAware = engine.model.optimizations.tailAwarePrefill
        engine.generator.onPrefixCacheStatus = { line in
            FileHandle.standardError.write(Data("prefix cache: \(line)\n".utf8))
        }
        engine.generator.onPrefillProgressAbsolute = { done, total, elapsed, base in
            progress.maxChunk = engine.generator.prefillChunk
            progress.report(done: done, total: total, elapsed: elapsed, base: base)
        }
        if noPrefixCache {
            engine.prefixCache.enabled = false
            engine.prefixCache.drop()
            FileHandle.standardError.write(
                "prefix cache: off — every request re-prefills its whole prompt\n"
                    .data(using: .utf8)!)
        }
        if let persistentConfiguration {
            let tier = try engine.enablePersistentPrefixCache(persistentConfiguration)
            tier.onEvent = { line in
                let stamp = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
                FileHandle.standardError.write("[\(stamp)] prefix cache disk: \(line)\n".data(using: .utf8)!)
            }
            let held = String(format: "%.2f", Double(tier.storedBytes) / 1e9)
            let quota = String(format: "%.2f", Double(persistentConfiguration.maxBytes) / 1e9)
            let states = tier.storedStates
            let forget = persistentConfiguration.maxAge.map {
                "; forgets states unused for \(String(format: "%g", $0 / 86_400)) days"
            } ?? "; keeps states until the quota needs room"
            // Opening the directory removes what this build cannot use or the
            // limits exclude, before this callback exists, so report it here.
            let opened = tier.maintenance
            var removed: [String] = []
            if opened.otherBuilds > 0 { removed.append("\(opened.otherBuilds) from other builds") }
            if opened.expired > 0 { removed.append("\(opened.expired) expired") }
            if opened.overQuota > 0 { removed.append("\(opened.overQuota) over the quota") }
            if opened.unreadable + opened.incomplete > 0 {
                removed.append("\(opened.unreadable + opened.incomplete) unreadable or incomplete")
            }
            if opened.orphanSegments > 0 { removed.append("\(opened.orphanSegments) unused row segments") }
            FileHandle.standardError.write(("prefix cache disk: \(persistentConfiguration.directory.path) holds "
                + "\(states) state\(states == 1 ? "" : "s") (\(held) GB of \(quota) GB); writes states of "
                + "\(persistentConfiguration.minimumTokens) tokens or more" + forget
                + (removed.isEmpty ? "" : "; removed " + removed.joined(separator: ", ")
                    + String(format: " (%.2f GB)", Double(opened.bytes) / 1e9))
                + "\n").data(using: .utf8)!)
        }
        var governor: MemoryGovernor?
        if plan.source == .auto, !noElastic {
            governor = MemoryGovernor(engine: engine)
            governor?.start()
        } else if noElastic {
            FileHandle.standardError.write(
                "elastic: off (--no-elastic); the cache stays at its startup size\n".data(using: .utf8)!)
        } else if plan.source != .auto, !noElastic {
            FileHandle.standardError.write(
                "elastic: off — an explicit size is pinned; omit the size flag for elastic auto\n"
                    .data(using: .utf8)!)
        }
        defer { governor?.stop() }
        let server = Server(
            engine: engine, port: port, weightsBytes: Int(PinnedModel.totalBytes),
            listenFD: listenFD)
        server.onDiagnostic = { line in
            let stamp = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
            FileHandle.standardError.write(Data("[\(stamp)] \(line)\n".utf8))
        }
        if idleExit > 0 {
            let minutes = idleExit
            server.idleExit = (minutes * 60, {
                Self.leave("stopping: no requests and no agents for \(String(format: "%g", minutes)) minutes (--idle-exit)")
            })
            FileHandle.standardError.write(Data(("idle exit: stops after \(String(format: "%g", minutes)) minutes "
                + "with no requests and no registered agent still running\n").utf8))
        }
        try withExtendedLifetime(terminate) {
            try server.run()
        }
    }

    /// Log why the server stops and end the process without running exit
    /// handlers, which could race the engine's own threads.
    static func leave(_ reason: String) -> Never {
        let stamp = DateFormatter.localizedString(from: Date(), dateStyle: .none, timeStyle: .medium)
        FileHandle.standardError.write(Data("[\(stamp)] \(reason)\n".utf8))
        fflush(stdout)
        fflush(stderr)
        _exit(0)
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
    @Flag(help: "Use one-row projections for the historical MLX 0.31 layer reference")
    var rowInvariant = false

    func run() throws {
        try model.rejectAdaptiveLimitForFixedDiagnostic()
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
        if rowInvariant { m.optimizations.rowInvariantProjection = true }
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
            help: "Preview the plan `serve --max-context` would announce: auto (this Mac's automatic window, the default) or tokens up to \(ContextPolicy.maxTokens).")
    var maxContext: ContextWindowArgument = .automatic
    @Option(help: "Accepted request to first model token budget in minutes; 0 disables only time")
    var maxPrefillWait = 30.0

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
        _ = try ContextConfiguration(maxContextTokens: self.maxContext.tokens ?? ContextPolicy.defaultTokens,
            maxPrefillWaitMinutes: maxPrefillWait)
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
        let lookahead = DecodeLookaheadPlanning.environment(modelDirectory: model.modelURL)
        // The window: explicit, or this machine's automatic choice planned
        // against the (possibly simulated) live memory, exactly as serve does.
        var automatic: AutomaticContextWindow?
        var automaticPlan: MemoryPlan?
        let maxContext: Int
        if let tokens = self.maxContext.tokens {
            maxContext = tokens
        } else {
            let tierRequest = PlanRequest(expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB,
                memoryGB: model.memoryGB, memoryLimitGB: model.memoryLimitGB, maxRAMPercent: model.maxRAMPercent,
                mtp: try model.mtpMode(), vision: try model.visionMode())
            let mtpPresent = MTPWeights.present(modelDir: model.modelURL)
            let visionPresent = model.visionAvailable()
            let policy = try model.runtimePolicy()
            if let resolved = try? Planner.resolveContextWindow(.automatic, request: tierRequest, on: device,
                    mtpAvailable: mtpPresent, visionAvailable: visionPresent, runtimePolicy: policy,
                    decodeLookahead: lookahead) {
                automatic = resolved.automatic
                automaticPlan = resolved.plan
                maxContext = resolved.plan.maxContextTokens
            } else {
                automatic = Planner.automaticContextWindow(tierRequest, on: device, mtpAvailable: mtpPresent,
                    visionAvailable: visionPresent, runtimePolicy: policy, decodeLookahead: lookahead)
                maxContext = ContextPolicy.defaultTokens
            }
        }
        let configuration = try ContextConfiguration(maxContextTokens: maxContext, maxPrefillWaitMinutes: maxPrefillWait)
        let request = PlanRequest(expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB,
            memoryGB: model.memoryGB, memoryLimitGB: model.memoryLimitGB, maxRAMPercent: model.maxRAMPercent,
            mtp: try model.mtpMode(), vision: try model.visionMode(), maxContextTokens: maxContext)
        let feasibility = Planner.contextFeasibility(request, on: device,
            mtpAvailable: MTPWeights.present(modelDir: model.modelURL),
            visionAvailable: model.visionAvailable(), runtimePolicy: try model.runtimePolicy(),
            decodeLookahead: lookahead)
        let advisory: MemoryPlan?
        if feasibility.requestedPlan == nil, maxContext <= ContextPolicy.defaultTokens,
           model.expertsPerLayer != nil || model.poolGB != nil {
            advisory = try Planner.plan(expertsPerLayer: model.expertsPerLayer, poolGB: model.poolGB,
                memoryGB: model.memoryGB, memoryLimitGB: model.memoryLimitGB, ramGB: device.ramGB, workingSetGB: device.workingSetGB,
                availableGB: device.availableGB, ramPercent: model.maxRAMPercent,
                mtp: model.mtpMode(), mtpAvailable: MTPWeights.present(modelDir: model.modelURL),
                vision: model.visionMode(), visionAvailable: model.visionAvailable(),
                maxContextTokens: maxContext, simulated: device.isSimulated, qualification: false,
                runtimePolicy: model.runtimePolicy(), decodeLookahead: lookahead)
        } else { advisory = nil }
        guard let requestedPlan = feasibility.requestedPlan ?? advisory else {
            if asJSON {
                let output: [String: Any] = ["error": ["code": "insufficient_memory",
                    "message": feasibility.refusal ?? "requested configuration does not fit"],
                    "context_feasibility": feasibility.json]
                print(String(decoding: try JSONSerialization.data(withJSONObject: output,
                    options: [.prettyPrinted, .sortedKeys]), as: UTF8.self))
                throw ExitCode(2)
            }
            throw PlanError("\(feasibility.refusal ?? "requested configuration does not fit"); maximum feasible window: \(feasibility.maximumFeasibleWindow) tokens")
        }
        // Keep the exact automatic decision, including its busy-start notes.
        // Feasibility remains an independent prerequisite above.
        let plan = try (automaticPlan ?? requestedPlan).withRequestPolicy(configuration)
        if asJSON {
            var output = plan.json(); output["context_feasibility"] = feasibility.json
            output["context_window_source"] = automatic == nil ? "explicit" : "automatic"
            if let automatic { output["automatic_context_window"] = automatic.json }
            let data = try JSONSerialization.data(
                withJSONObject: output, options: [.prettyPrinted, .sortedKeys])
            print(String(decoding: data, as: UTF8.self))
            return
        }
        print(plan.banner())
        print("memory-feasible window: \(feasibility.maximumFeasibleWindow) tokens; separate from the \(maxPrefillWait)-minute request-to-first-token policy")
        if let automatic { print(automatic.report(served: maxContext)) }
        print("""

        memory controls (with none, auto is the default):
          --memory-limit-gb G     adaptive ceiling; cache shrinks and recovers within it
          --memory-gb G           total process budget with a fixed cache
          --experts-per-layer N   precise: cache N of 512 per layer (pool = N x 0.133 GB)
          --pool-gb G             raw pool size (1 GB = 7.5 experts/layer)
        Use the adaptive ceiling alone. Among fixed controls, experts-per-layer
        takes precedence over pool-gb, then memory-gb.
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
            let row: MemoryPlan
            do {
                row = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: t,
                    ramGB: device.ramGB, workingSetGB: device.workingSetGB, availableGB: device.availableGB,
                    maxContextTokens: maxContext, simulated: true, runtimePolicy: model.runtimePolicy())
                try Planner.validateMemoryBudget(row, availableGB: device.availableGB)
            } catch {
                // Name the constraint: a target above what this Mac can hold
                // is a different answer from a target too small for the window.
                let why = String(describing: error)
                let reason = why.contains("total-memory target")
                    ? "too small for a \(maxContext)-token window"
                    : t > device.workingSetGB
                        ? "above this Mac's " + String(format: "%.1f", device.workingSetGB) + " GB Metal working set"
                        : why.contains("reclaimable memory")
                            ? "more than is reclaimable right now for a \(maxContext)-token window"
                            : "not available: \(why)"
                print(String(format: "  %6.1f GB   ", t) + reason); continue
            }
            let e = row.expertsPerLayerCached
            let est = row.estWarmTokS
            let full = row.fullyResident
            let chunk = row.prefillChunk
            let wait = PrefillSchedule.estSeconds(tokens: maxContext, maxChunk: chunk)
            print(String(
                format: "  %6.1f GB   %8.0f/512      ~%2.0f tok/s%@   %5d   %@",
                t, e, est, full ? " (resident)" : "", chunk,
                wait.isFinite ? "~" + PrefillSchedule.describe(seconds: wait) : "not yet calibrated"))
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
                return secs.isFinite ? "\(label) ~\(PrefillSchedule.describe(seconds: secs))" : "\(label) not yet calibrated"
            }
        print("  " + row.joined(separator: " · ") + " (the cap)")
        print("""
          context state is ~27 KiB per token, up to the model's \(ContextPolicy.modelLimit)-token limit.
          `slotstream context-check --tokens N` reads an N-token synthetic prompt on this Mac and
          stops early if reclaimable memory falls below its floor or its time limit passes.
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
        try model.rejectAdaptiveLimitForFixedDiagnostic()
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
    @Option(help: "Hard total-memory ceiling for this diagnostic; use --memory-limit-gb 10 for small-cache pressure recovery, or an explicit larger ceiling for the full availability drill")
    var maxMemoryGB: Double = 10

    func validate() throws {
        guard slots > 0, slots <= Geometry.totalRecords else {
            throw ValidationError("--slots must be positive and within the model's expert count")
        }
        guard maxMemoryGB.isFinite, (8.1 ... 26).contains(maxMemoryGB) else {
            throw ValidationError("--max-memory-gb must be between 8.1 and 26")
        }
    }

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
        let memoryCeiling = maxMemoryGB
        Task {
            do {
                let oldAvailability = Planner.availabilityOverride
                defer { Planner.availabilityOverride = oldAvailability }
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
                // The availability-driven drill crosses both ordinary deadbands.
                // A smaller adaptive profile instead donates on a bounded
                // pressure event and verifies restoration below the grow band.
                // The planner's round-trip reserves prefill/cache state from
                // this budget too, so use 3 GB to leave the desired expert pool
                // safely more than 2 GB above the floor after that reservation.
                let extraSlots = Int((3.0e9 / Geometry.recordBytes).rounded(.up))
                let minStartSlots = Geometry.floorSlots + extraSlots
                let minStartPool = Geometry.gb(minStartSlots)
                let minimumTarget = minStartPool + Planner.fixedFootprintGB
                    + Planner.prefillCostGB(Planner.prefillChunkFor(poolBudgetGB: minStartPool))
                    + Planner.prefixCacheCostGB(tokens: Planner.prefixCacheTokensFor(poolBudgetGB: minStartPool))
                    + Planner.planningMarginGB
                guard model.memoryLimitGB != nil || minimumTarget <= memoryCeiling else {
                    throw PlanError(String(format:
                        "elastic-drill needs at least a %.3f GB total target, above --max-memory-gb %.3f; "
                        + "the normal governor deadbands require this larger test. "
                        + "Use an explicit sufficient ceiling only with that target plus 3 GB physically reclaimable.",
                        minimumTarget, memoryCeiling))
                }
                let minAvailable = model.memoryLimitGB.map { min($0, memoryCeiling) + 3 }
                    ?? max(12.0, minStartPool * 3)
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
                // A supplied adaptive ceiling must start from that planner's
                // cache/workspace split, not the legacy hand-sized arena. The
                // two splits can fit the same budget but are not interchangeable
                // when checking whether recovery restores the initial cache.
                let adaptivePlan: MemoryPlan?
                if let limit = model.memoryLimitGB {
                    guard limit <= memoryCeiling else {
                        throw PlanError("elastic-drill adaptive limit exceeds --max-memory-gb")
                    }
                    adaptivePlan = try Planner.plan(PlanRequest(memoryLimitGB: limit, mtp: .off, vision: .off), on: .current())
                        .withRequestPolicy(ContextConfiguration(maxPrefillWaitMinutes: 17))
                    guard let adaptivePlan, adaptivePlan.slots > Geometry.floorSlots else {
                        throw PlanError("elastic-drill adaptive limit leaves no cache above the floor to donate")
                    }
                } else { adaptivePlan = nil }
                let target = adaptivePlan?.targetGB ?? (poolCeiling + Planner.fixedFootprintGB
                    + Planner.prefillCostGB(chunk)
                    + Planner.prefixCacheCostGB(tokens: cacheTokens)
                    + Planner.planningMarginGB)
                guard target <= memoryCeiling else {
                    throw PlanError(String(format:
                        "elastic-drill needs a %.3f GB total target, above --max-memory-gb %.3f; "
                        + "the normal governor deadbands require this larger test. "
                        + "Use an explicit sufficient ceiling only with that target plus 3 GB physically reclaimable.",
                        target, memoryCeiling))
                }
                if let limit = model.memoryLimitGB, target > limit {
                    throw PlanError("elastic-drill starting budget exceeds --memory-limit-gb")
                }
                guard realAvail >= target + 3 else {
                    throw PlanError(String(format:
                        "elastic-drill requires %.3f GB reclaimable for its target plus 3 GB spare; observed %.3f",
                        target + 3, realAvail))
                }
                let observation = FootprintSampler()
                let vmBefore = ProcessMemory.vmActivity()
                var complete = false
                var outputs: [[Int]] = []
                var finalObservation: (sample: FootprintSampler.Result, vm: ProcessMemory.VMActivity?, physical: UInt64, rss: UInt64)?
                defer {
                    let observed = finalObservation ?? (sample: observation.finish(), vm: ProcessMemory.vmActivity(),
                        physical: ProcessMemory.residentBytes(), rss: ProcessMemory.lifetimeRSSPeakBytes())
                    let sample = observed.sample
                    let vmAfter = observed.vm
                    let report: [String: Any] = [
                        "complete": complete, "target_gb": target, "ceiling_gb": memoryCeiling,
                        "sampled_peak_bytes": sample.peakBytes, "samples": sample.samples,
                        "physical_footprint_end_bytes": observed.physical,
                        "lifetime_rss_peak_bytes": observed.rss,
                        "lifetime_physical_footprint_peak_bytes": ProcessMemory.lifetimePhysicalFootprintPeakBytes(),
                        "swapins_before": vmBefore.map { $0.swapins as Any } ?? NSNull(),
                        "swapins_after": vmAfter.map { $0.swapins as Any } ?? NSNull(),
                        "swapouts_before": vmBefore.map { $0.swapouts as Any } ?? NSNull(),
                        "swapouts_after": vmAfter.map { $0.swapouts as Any } ?? NSNull(),
                        "swap_clean": vmBefore != nil && vmAfter != nil
                            && vmBefore?.swapins == vmAfter?.swapins && vmBefore?.swapouts == vmAfter?.swapouts,
                        "output_ids": outputs,
                    ]
                    if let data = try? JSONSerialization.data(withJSONObject: report, options: [.sortedKeys]) {
                        note("ELASTIC DRILL MEMORY " + String(decoding: data, as: UTF8.self))
                    }
                }
                let plan = adaptivePlan ?? MemoryPlan(
                    source: .auto, slots: initialSlots, targetGB: target,
                    ramGB: Planner.deviceRAMGB(),
                    workingSetGB: Planner.deviceWorkingSetGB(),
                    ramPercent: Planner.defaultRAMPercent,
                    availableGB: realAvail, clamped: false,
                    prefillChunk: chunk, prefixCacheTokens: cacheTokens,
                    notes: ["elastic drill bounded test plan"], maxPrefillWaitMinutes: 17,
                    memoryLimitGB: model.memoryLimitGB)
                let engine = try await Engine(modelDir: model.modelURL, plan: plan)
                // Serve assigns its configured context after loading. Exercise
                // that real plan-copy path before allowing the governor to run.
                engine.maxContextTokens = plan.maxContextTokens
                guard engine.currentPlan?.memoryLimitGB == plan.memoryLimitGB,
                      engine.currentPlan?.maxPrefillWaitMinutes == plan.maxPrefillWaitMinutes else {
                    throw PlanError("elastic-drill context assignment lost the adaptive ceiling or request deadline")
                }
                func checkMemory(nextSlots: Int? = nil) throws {
                    let additional = nextSlots.map { $0 > engine.model.pool.slots ? Geometry.gb($0) : 0 } ?? 0
                    guard let available = Planner.deviceAvailableGB(), available >= 3 + additional else {
                        throw PlanError("elastic-drill lost real memory headroom before work; no simulated availability authorizes allocation")
                    }
                    let physical = ProcessMemory.residentBytes(), rss = ProcessMemory.lifetimeRSSPeakBytes()
                    guard physical > 0, rss > 0,
                          ProcessMemory.peakResidentGB <= memoryCeiling else {
                        throw PlanError("elastic-drill physical memory observation is unavailable or exceeds its explicit ceiling")
                    }
                }
                try checkMemory()
                note(String(format: "  (machine has %.1f GB reclaimable; drill capped at a "
                    + "%.1f GB pool)", realAvail, plan.poolGB))

                var p = SampleParams.greedy
                p.maxTokens = 20
                let ids = try engine.encodeChat(
                    [ChatMessage(role: "user", content: "Name three rivers, comma separated.")],
                    thinking: false)
                func gen() throws -> String {
                    try checkMemory()
                    var interrupted: Error?
                    let generated = engine.generate(promptIds: ids, params: p, shouldContinue: {
                        do { try checkMemory(); return true }
                        catch { interrupted = error; return false }
                    })
                    outputs.append(generated.ids)
                    if let interrupted { throw interrupted }
                    guard generated.stats.runtimeError == nil, generated.stats.requestFailure == nil,
                          !generated.ids.isEmpty else {
                        throw PlanError("elastic-drill generation failed or returned no output")
                    }
                    try checkMemory()
                    return generated.text
                }

                let gov = MemoryGovernor(engine: engine)
                // Exercise the real queued poll/resize path at controlled
                // boundaries. A background timer could apply an unchecked
                // availability stimulus during the cooldown sleep.
                defer { gov.stop() }

                let before = try gen()
                let s0 = engine.model.pool.slots
                note(String(format: "  start:  %d slots (~%.0f/layer) -> %@",
                    s0, Geometry.perLayer(s0), before))

                // --- shrink: pretend the machine just got busy
                let smallRecovery = Geometry.gb(s0 - Geometry.floorSlots) < 2
                let shrinkAvailability = smallRecovery ? min(realAvail, target + 3) : 2.0
                Planner.availabilityOverride = shrinkAvailability
                func inputs(at available: Double) -> GovernorPolicy.Inputs {
                    GovernorPolicy.Inputs(currentSlots: engine.model.pool.slots, availableGB: available,
                        ramGB: plan.ramGB, workingSetGB: plan.workingSetGB, ramPercent: plan.ramPercent,
                        maxContextTokens: engine.maxContextTokens,
                        ownedAdditionalBytes: engine.prefixCache.ownedAdditionalBytes(mtpResident: false),
                        memoryLimitGB: plan.memoryLimitGB)
                }
                func pollBounded(pressure: GovernorPolicy.Pressure? = nil) throws {
                    guard let available = Planner.availabilityOverride,
                          let desired = GovernorPolicy.desiredPlan(inputs(at: available)),
                          desired.expectedPeakGB <= memoryCeiling,
                          desired.slots <= s0 else {
                        throw PlanError("elastic-drill stimulus exceeds its bounded starting arena or total-memory ceiling")
                    }
                    try checkMemory(nextSlots: desired.slots)
                    if let pressure { gov.pressureNow(pressure) } else { gov.pollNow() }
                    try checkMemory()
                    guard engine.currentPlan?.memoryLimitGB == plan.memoryLimitGB,
                          engine.currentPlan?.maxPrefillWaitMinutes == plan.maxPrefillWaitMinutes else {
                        throw PlanError("elastic-drill resize lost the adaptive ceiling or request deadline")
                    }
                    if engine.model.pool.slots == desired.slots,
                       engine.currentPlan?.targetGB != desired.targetGB {
                        throw PlanError("elastic-drill resize retained a stale startup budget")
                    }
                }
                let shrinkInputs = inputs(at: shrinkAvailability)
                let startCache = engine.prefixCache.maxTokens
                try pollBounded(pressure: smallRecovery ? .warning : nil)
                let s1 = engine.model.pool.slots
                let underPressure = try gen()
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
                func restoresBudget(at available: Double) -> Bool {
                    guard let p = GovernorPolicy.desiredPlan(inputs(at: available)) else { return false }
                    return p.slots >= s0 && (!smallRecovery || (p.targetGB ?? 0) >= target)
                }
                var low = 0.0
                var high = min(realAvail, Planner.deviceAvailableGB() ?? 0)
                if !restoresBudget(at: high) {
                    fail.append("real reclaimable memory cannot reconstruct the bounded starting pool")
                } else {
                    for _ in 0 ..< 48 {
                        let mid = (low + high) / 2
                        if restoresBudget(at: mid) { high = mid } else { low = mid }
                    }
                }
                let recoveryAvailability = high
                let recoveryInputs = inputs(at: recoveryAvailability)
                note(String(
                    format: "  recovery stimulus: %.1f GB available -> %d desired slots (%.1f GB growth)",
                    recoveryAvailability,
                    GovernorPolicy.desiredSlots(recoveryInputs) ?? s1,
                    Geometry.gb((GovernorPolicy.desiredSlots(recoveryInputs) ?? s1) - s1)))
                Planner.availabilityOverride = recoveryAvailability
                try pollBounded()
                if engine.model.pool.slots != s1 {
                    fail.append("governor grew during the cooldown (should wait \(Int(GovernorPolicy.growCooldown)) s)")
                } else {
                    note("  cooldown: held at \(s1) slots, as designed")
                }

                if !skipGrow {
                    note("  waiting out the \(Int(GovernorPolicy.growCooldown)) s grow cooldown...")
                    for _ in 0 ..< Int(GovernorPolicy.growCooldown + 3) {
                        try await Task.sleep(for: .seconds(1))
                        try checkMemory()
                    }
                    try pollBounded()
                    let s2 = engine.model.pool.slots
                    let recovered = try gen()
                    note(String(format: "  recover: %d slots (~%.0f/layer) -> %@",
                        s2, Geometry.perLayer(s2), recovered))
                    if s2 <= s1 { fail.append("governor did not grow back: \(s1) -> \(s2)") }
                    if s2 != s0 { fail.append("governor did not restore the complete starting cache: \(s2) instead of \(s0)") }
                    if recovered != before {
                        fail.append("output changed across a grow\n    before: \(before)\n    after:  \(recovered)")
                    }
                }
                Planner.availabilityOverride = nil
                if let first = outputs.first, !outputs.allSatisfy({ $0 == first }) {
                    fail.append("output token IDs changed across governor transitions")
                }
                let finalSample = observation.finish()
                let finalVM = ProcessMemory.vmActivity()
                let finalPhysical = ProcessMemory.residentBytes(), finalRSS = ProcessMemory.lifetimeRSSPeakBytes()
                finalObservation = (finalSample, finalVM, finalPhysical, finalRSS)
                if finalSample.peakBytes == 0 || finalPhysical == 0 || finalRSS == 0
                    || Double(max(finalSample.peakBytes, ProcessMemory.peakResidentBytes())) > memoryCeiling * 1e9 {
                    fail.append("final sampled footprint, physical footprint or RSS is unavailable or exceeds the ceiling")
                }

                if fail.isEmpty {
                    complete = true
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
    @Flag(help: "Also enforce the historical cross-schedule rounding bounds. This compares different arithmetic, not same-backend cache equivalence.")
    var legacyRechunkBounds = false

    /// A multi-turn chat, driven exactly as a client drives one: every turn
    /// re-sends the whole history through the chat template, so the prompt is
    /// re-tokenized from text each time. That is the real test of whether a
    /// cache can hit at all — re-encoding the previous reply has to reproduce
    /// the ids that were generated.
    ///
    /// The notes are not decoration. A turn may resume only at one of its own
    /// prefill pass boundaries (`PrefixResumeRule`), so a chat whose whole
    /// history is fifty tokens has nothing to resume and would prove nothing
    /// about reuse. This history crosses several.
    static let context = (1 ... 90)
        .map { "Note \($0): item \($0) weighs \($0 * 3) grams." }
        .joined(separator: " ")
    static let turns = [
        "\(context)\n\nName one planet. Answer with just the name.",
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
    /// is not associative. These historical observations remain useful when
    /// studying a kernel upgrade, but growing cross-schedule drift does not
    /// establish cache corruption. The production cache preserves the cold
    /// producing schedule; prefix-exact-check requires identical raw logits.
    /// --legacy-rechunk-bounds retains the original acceptance experiment.
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
        try model.rejectAdaptiveLimitForFixedDiagnostic()
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        let tokens = maxTokens
        let poolSlots = slots
        let enforceLegacyBounds = legacyRechunkBounds
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
                // Preserve the historical different-schedule experiment. It
                // bypasses the cache and cannot establish cache equivalence:
                // an arithmetic upgrade can change the rounding pattern.
                // The actual cache must keep both replies below and the raw
                // logits in prefix-exact-check identical to a cold read.
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
                    // Historical control: a different prefill schedule. New
                    // kernels can change its rounding independently of the
                    // incremental schedule, so this is not an accuracy oracle.
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
                // Keep the original empirical bounds behind the explicit
                // historical experiment. No tolerance replaces the strict
                // same-schedule cache check run by the verification battery.
                let bound = max(worstControl * 3, 0.01)
                if enforceLegacyBounds, worst > bound {
                    failures.append(String(format:
                        "reused state moved logits by %.2f%% of their spread, over the "
                        + "%.2f%% historical bound set by the prefill-rechunk control", worst * 100, bound * 100))
                }
                // Depth must not amplify it. Allow a factor of 3 over the
                // shallowest probe before calling it drift.
                if enforceLegacyBounds, let first = deltas.first?.1, let deepest = deltas.last?.1,
                    first > 0, deepest > max(first * 3, 0.01)
                {
                    failures.append(String(format:
                        "cross-schedule drift exceeds the historical depth bound (%.3f%% -> %.3f%%)",
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

                // ---- 4b. Reuse may not change the answer. A resumed turn now
                //          computes what a cold one computes, so the replies
                //          are the same replies, not merely close ones.
                if engine.model.optimizations.resumesOnPassBoundaries {
                    for (i, (a, b)) in zip(cold, warmA).enumerated() where a.0 != b.0 {
                        failures.append("a continued turn \(i + 1) answered differently from a cold one\n"
                            + "    cold: \(a.0)\n    warm: \(b.0)")
                    }
                }

                // ---- 5. A prompt that does not extend the held state must
                //         rebuild, and must still be deterministic.
                let editQ = "\(Self.context)\n\nName one ocean. Answer with just the name."
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

                note("  historical rechunk bounds: \(enforceLegacyBounds ? "enforced" : "diagnostic only; prefix-exact-check gates identical cold/warm logits")")
                if failures.isEmpty {
                    print(String(format:
                        "PREFIX CHECK PASS: historical cross-schedule drift %.2f%% vs %.2f%% for the "
                        + "rechunk control, top-1 %d/%d; %d of %d "
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
        try model.rejectAdaptiveLimitForFixedDiagnostic()
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
        try model.rejectAdaptiveLimitForFixedDiagnostic()
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
        try model.rejectAdaptiveLimitForFixedDiagnostic()
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
