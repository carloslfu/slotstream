// High-level engine: model + tokenizer + chat templating, shared by CLI/server.

import CoreGraphics
import Foundation
import MLX
import Tokenizers

public struct ChatMessage {
    public var role: String
    public var content: String
    /// An assistant turn's reasoning, rendered as `reasoning_content`. Clients
    /// that keep reasoning in history can replay it; fx does not send any.
    public var reasoning: String?
    /// Calls this assistant turn made.
    public var toolCalls: [ParsedToolCall]
    /// For a `tool` message: which call it answers.
    public var toolCallId: String?
    public var toolName: String?
    /// Pictures this turn carries, as inline bytes (a `data:` URL or bare
    /// base64) in the order the template should render them. Text-only paths
    /// leave it empty and behave exactly as before.
    public var images: [String] = []

    public init(role: String, content: String) {
        self.role = role
        self.content = content
        self.reasoning = nil
        self.toolCalls = []
        self.toolCallId = nil
        self.toolName = nil
    }

    public init(
        role: String, content: String, reasoning: String? = nil,
        toolCalls: [ParsedToolCall] = [], toolCallId: String? = nil, toolName: String? = nil
    ) {
        self.role = role
        self.content = content
        self.reasoning = reasoning
        self.toolCalls = toolCalls
        self.toolCallId = toolCallId
        self.toolName = toolName
    }

    /// The dictionary the chat template consumes.
    ///
    /// Tool-call arguments are bridged as an unordered dictionary because
    /// swift-jinja accepts nothing else, so the template's `arguments|items`
    /// follows Swift's hash order. That is why a generated assistant turn is
    /// spliced back as raw ids rather than re-rendered (`PrefixCache`): a
    /// re-render is semantically identical but not byte-identical, and the
    /// prefix cache matches on bytes.
    public var templateValue: [String: any Sendable] {
        var m: [String: any Sendable] = ["role": role, "content": content]
        // The template checks each content part for an `image`/`image_url`
        // key, so a turn with pictures has to arrive as parts rather than a
        // string. Images first, then the text: that is the order the template
        // numbers them in ("Picture 1: ..."), and the order
        // `Engine.imageSources` reads them back in.
        if !images.isEmpty {
            var parts: [[String: any Sendable]] = images.map {
                ["type": "image_url", "image_url": ["url": $0] as [String: any Sendable]]
            }
            if !content.isEmpty { parts.append(["type": "text", "text": content]) }
            m["content"] = parts
        }
        if let r = reasoning, !r.isEmpty { m["reasoning_content"] = r }
        if !toolCalls.isEmpty {
            m["tool_calls"] = toolCalls.map { call in
                [
                    "type": "function",
                    "function": [
                        "name": call.name,
                        "arguments": call.arguments.mapValues { $0.any },
                    ] as [String: any Sendable],
                ] as [String: any Sendable]
            }
        }
        return m
    }
}

public final class Engine {
    public let modelDir: URL
    public let model: Qwen4ExpModel
    public let generator: Generator
    public let tokenizer: any Tokenizers.Tokenizer
    public let eosIds: Set<Int>
    public let modelName: String
    /// Lazily-loaded vision tower (VLM). Loaded on the first request that
    /// carries an image and then cached; see `ensureVisionTower`.
    public private(set) var visionTower: VisionTower?
    /// Whether this process will accept images at all (`--vision`). False
    /// makes every image request a 400 that says so, rather than a surprise
    /// gigabyte.
    public var visionAllowed = true
    /// Whether the checkpoint carries a tower at all, read once at startup so
    /// the fx catalogue and `/api/show` can answer without touching it.
    public private(set) var visionAvailable = false
    /// Longest prompt accepted, at most `ContextPolicy.maxTokens` (the largest
    /// context that has been measured, see Context.swift). Unbounded prompts
    /// are not free: KV plus indexer state costs ~27 KiB per token, and a
    /// prompt is read in full before the first token, so a huge prompt is a
    /// long, memory-growing stall rather than a fast failure.
    private let contextLock = NSRecursiveLock()
    private var configuredContextTokens = ContextPolicy.defaultTokens
    private let allocatedContextTokens: Int
    private var contextAssignmentFailure: RequestFailure?
    public var maxContextTokens: Int {
        get { contextLock.withLock { configuredContextTokens } }
        set {
            contextLock.lock(); defer { contextLock.unlock() }
            if let why = ContextPolicy.validationError(newValue, qualification: currentPlan?.contextQualification ?? false) {
                contextAssignmentFailure = RequestFailure(.invalidConfiguration, why); return
            }
            guard newValue <= allocatedContextTokens else {
                contextAssignmentFailure = RequestFailure(.invalidConfiguration,
                    "context assignment exceeds this engine's allocated plan; construct a new Engine with a validated plan")
                return
            }
            contextAssignmentFailure = nil
            configuredContextTokens = newValue
            let capped = min(prefixCache.maxTokens, newValue)
            prefixCache.configure(maxTokens: capped)
            if let p = currentPlan {
                updatePlan(MemoryPlan(source: p.source, slots: p.slots, targetGB: p.targetGB,
                    ramGB: p.ramGB, workingSetGB: p.workingSetGB, ramPercent: p.ramPercent,
                    availableGB: p.availableGB, clamped: p.clamped, prefillChunk: p.prefillChunk,
                    prefixCacheTokens: capped, mtpEnabled: p.mtpEnabled, visionEnabled: p.visionEnabled,
                    visionResidentReserved: p.visionResidentReserved, maxContextTokens: newValue,
                    notes: p.notes, runtimeAllocationPolicy: p.runtimeAllocationPolicy,
                    maxPrefillWaitMinutes: p.maxPrefillWaitMinutes, contextQualification: p.contextQualification))
            }
        }
    }

    /// Call when a complete request is accepted, before tokenization or images.
    public func beginRequest(connected: @escaping () -> Bool = { true }) throws -> RequestController {
        if let override = requestControllerOverride {
            let control = try override(); try control.attachReservations(requestReservations); return control
        }
        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
        if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
        let configuration = try ContextConfiguration(maxContextTokens: maxContextTokens,
            maxPrefillWaitMinutes: currentPlan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            qualification: currentPlan?.contextQualification ?? false)
        let control = RequestController(configuration: configuration,
            slackBytes: Int(Planner.availabilitySlackGB(ramGB: currentPlan?.ramGB ?? Planner.deviceRAMGB()) * 1e9),
            connected: connected, pressure: { [weak self] in
                guard let self else { return true }
                return self.pressureBoundary.snapshot() != nil || self.osPressureLock.withLock { self.osPressure }
            })
        try control.attachReservations(requestReservations)
        return control
    }
    private let requestReservations = RequestMemoryReservations()

    // Package-only dependency seam for deterministic HTTP diagnostics. No wire
    // field or environment variable can install it.
    package var requestControllerOverride: (() throws -> RequestController)?

    public var contextPolicyJSON: [String: Any] {
        let plan = currentPlan
        return ["configured_window": maxContextTokens, "model_limit": ContextPolicy.modelLimit,
            "implementation_limit": ContextPolicy.implementationLimit,
            "mtp_limit": ContextPolicy.mtpLimit, "vision_limit": ContextPolicy.visionLimit,
            "max_prefill_wait_minutes": plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            "wait_scope": "accepted_request_to_first_model_token",
            "qualification": plan?.contextQualification ?? false,
            "allocation_available": planLock.withLock { allocationUnavailable == nil },
            "estimate_scope": "measured M5 Pro anchors; unknown for unqualified pass sizes"]
    }

    deinit { pressureMonitor?.cancel() }

    private var allocationUnavailable: RequestFailure?
    package func setAllocationUnavailable(_ failure: RequestFailure?) {
        planLock.withLock { allocationUnavailable = failure }
    }

    private let osPressureLock = NSLock()
    private var osPressure = false
    private var pressureMonitor: DispatchSourceMemoryPressure?

    /// Retained conversation state, so a follow-up turn re-prefills only what
    /// is new. See PrefixCache for the extend-only rule and the memory story.
    public let prefixCache: PrefixCache

    /// Release the retained conversation state. Takes the generation lock, so
    /// never call it from inside `generate`.
    public func dropPrefixCache() {
        withExclusive { prefixCache.drop() }
    }

    /// nil when `promptTokens` fits, otherwise the message to return to the client.
    ///
    /// The message names the cap for what it is. It used to tell people to
    /// raise --max-context, which cannot go past the ceiling the server was
    /// already at.
    public func contextError(promptTokens: Int) -> String? {
        if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { return contextAssignmentFailure.message }
        guard promptTokens < 0 || promptTokens > maxContextTokens else { return nil }
        return "context_length_exceeded: prompt is \(promptTokens) tokens, over the configured \(maxContextTokens)-token prompt-plus-reply window. Send less or restart with a larger supported --max-context; the model limit is \(ContextPolicy.modelLimit)."
    }
    /// The live memory plan (updated by the elastic governor on resize; nil
    /// for internal fixed-size uses). Guarded by its own lock so /api reads
    /// never block behind a running generation.
    private var _plan: MemoryPlan?
    private let planLock = NSLock()
    public var currentPlan: MemoryPlan? {
        planLock.lock()
        defer { planLock.unlock() }
        return _plan
    }
    public func updatePlan(_ p: MemoryPlan) {
        planLock.lock()
        _plan = p
        planLock.unlock()
    }

    private let lock = GenerationGate()
    package let pressureBoundary = PressureBoundary()
    // Immutable after startup, so the governor never reads mutable model
    // controls concurrently with a request changing its diagnostic options.
    package let responsiveGovernor: Bool

    /// Run `body` with the generation lock held — the governor uses this to
    /// resize the pool strictly between requests.
    public func withExclusive<T>(_ body: () throws -> T) rethrows -> T {
        lock.lock()
        defer { lock.unlock() }
        return try body()
    }

    @discardableResult
    package func tryWithExclusive(_ body: () -> Void) -> Bool {
        lock.tryWithExclusive(body)
    }

    /// Pool numbers for the metadata endpoints, published rather than read
    /// live. Reading SlotPool's mutable Swift arrays while the governor
    /// resizes is a data race, but taking the *generation* lock to avoid it
    /// made /api/tags and /api/ps block for the whole of a running request, so
    /// a client that polls either one saw a generating server as a hung one.
    private var _poolSnapshot: (slots: Int, slotsPerLayer: Double, poolBytes: Int) = (0, 0, 0)
    private let poolSnapshotLock = NSLock()

    public func poolSnapshot() -> (slots: Int, slotsPerLayer: Double, poolBytes: Int) {
        poolSnapshotLock.lock()
        defer { poolSnapshotLock.unlock() }
        return _poolSnapshot
    }

    /// Re-read the pool and publish it. **Call with the generation lock held**
    /// (inside `withExclusive`), which is where every resize already happens.
    public func publishPoolSnapshot() {
        let s = (model.pool.slots, model.pool.slotsPerLayer, model.pool.poolBytes)
        poolSnapshotLock.lock()
        _poolSnapshot = s
        poolSnapshotLock.unlock()
    }

    public convenience init(modelDir: URL, plan: MemoryPlan) async throws {
        try await self.init(modelDir: modelDir, poolSlots: plan.slots, plan: plan)
    }

    public init(modelDir: URL, poolSlots: Int, plan: MemoryPlan? = nil) async throws {
        // A plan made for a simulated machine may be printed and compared,
        // never loaded. Simulating memory the machine does not have still
        // allocates for real: on 2026-08-30 a simulated 60 GB drove a 25.4 GB
        // allocation and 39 GB of swap. The flag travels on the plan so this
        // cannot be forgotten at a call site.
        if plan?.simulated == true { throw SlotstreamError.simulatedDeviceCannotLoad }
        let context = try ContextConfiguration(maxContextTokens: plan?.maxContextTokens ?? ContextPolicy.defaultTokens,
            maxPrefillWaitMinutes: plan?.maxPrefillWaitMinutes ?? ContextConfiguration.defaultWaitMinutes,
            qualification: plan?.contextQualification ?? false)
        guard poolSlots >= Geometry.floorSlots, poolSlots <= Geometry.totalRecords,
              plan == nil || plan?.slots == poolSlots else {
            throw SlotstreamError.invalidPlan("engine pool must match a supported memory plan")
        }
        let initialLedger = plan?.memoryLedger ?? ContextMemoryLedger(slots: poolSlots,
            context: context.maxContextTokens, chunk: 256,
            retentionTokens: Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            mtp: false, visionResident: false)
        let initial = RequestController(configuration: context,
            slackBytes: Int(Planner.availabilitySlackGB(ramGB: plan?.ramGB ?? Planner.deviceRAMGB()) * 1e9))
        try initial.check(nextAllocationBytes: initialLedger.expectedPeakBytes, phase: "model allocation")
        self.allocatedContextTokens = context.maxContextTokens
        self.configuredContextTokens = context.maxContextTokens
        self.modelDir = modelDir
        self._plan = plan
        // Sized from the same budget as the pool; SLOTSTREAM_PREFIX_CACHE=0
        // (or --no-prefix-cache) pins it off for parity work.
        let env = ProcessInfo.processInfo.environment["SLOTSTREAM_PREFIX_CACHE"]
        self.prefixCache = PrefixCache(
            maxTokens: plan?.prefixCacheTokens
                ?? Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            enabled: env != "0" && (plan?.runtimeAllocationPolicy?.prefixCacheEnabled ?? true))
        if let p = plan, p.runtimeAllocationPolicy != nil { prefixCache.setBudgetLimit(p.prefixCacheTokens) }
        // MLX's allocator otherwise retains freed transients (KV caches,
        // activations) in an unbounded internal cache — measured ~5 GB of RSS
        // above the memory plan after a few dozen requests. 2 GB keeps
        // per-token reallocation churn away while making real process memory
        // track the announced plan.
        MLX.Memory.cacheLimit = 2 << 30
        self.modelName = "qwen3.8-flash-next:4bit"
        let t0 = Date()
        let index = try CheckpointIndex(dir: modelDir)
        self.model = try Qwen4ExpModel(index: index, poolSlots: poolSlots)
        self.responsiveGovernor = model.optimizations.responsiveGovernor
        try model.validate()
        // Read from the index that is already open — no tensor is touched, and
        // nothing is allocated until an image actually arrives.
        self.visionAvailable = VisionTower.present(index: index)
        self.visionAllowed = plan?.visionEnabled ?? visionAvailable
        if plan?.mtpEnabled == true {
            try model.enableMTP(modelDir: modelDir)
        }
        self.generator = Generator(model: model)
        if let p = plan, p.runtimeAllocationPolicy != nil {
            generator.setPrefillBudgetCeiling(p.prefillChunk)
            generator.prefillChunk = p.prefillChunk
        }
        if let p = plan, ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CHUNK"] == nil {
            generator.prefillChunk = p.prefillChunk
        }
        if let mb = Int(ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CACHE_MB"] ?? "") {
            generator.prefillCacheLimit = max(0, mb) << 20
        } else if let p = plan, p.expectedPeakGB <= 12 {
            generator.prefillCacheLimit = 512 << 20
        }
        self.tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        var eos: Set<Int> = [index.config.eosTokenId]
        if let e = tokenizer.eosTokenId { eos.insert(e) }
        // generation_config may list several
        if let d = try? Data(contentsOf: modelDir.appendingPathComponent("generation_config.json")),
            let o = try? JSONSerialization.jsonObject(with: d) as? [String: Any]
        {
            if let list = o["eos_token_id"] as? [Int] { list.forEach { eos.insert($0) } }
            if let one = o["eos_token_id"] as? Int { eos.insert(one) }
        }
        self.eosIds = eos
        publishPoolSnapshot()
        let monitor = DispatchSource.makeMemoryPressureSource(eventMask: [.normal, .warning, .critical],
            queue: DispatchQueue(label: "slotstream.request-pressure"))
        monitor.setEventHandler { [weak self, weak monitor] in
            guard let self, let monitor else { return }
            self.osPressureLock.withLock { self.osPressure = !monitor.data.contains(.normal) }
        }
        monitor.resume(); pressureMonitor = monitor
        let banner = "engine ready in \(String(format: "%.1f", -t0.timeIntervalSinceNow))s: "
            + "expert cache ~\(String(format: "%.0f", model.pool.slotsPerLayer))/\(model.cfg.numExperts) per layer "
            + "(\(model.pool.slots) global slots = \(String(format: "%.1f", Double(model.pool.poolBytes) / 1e9)) GB), "
            + (model.mtpHead != nil ? "mtp draft head on, " : "")
            + "eos \(eos.sorted())\n"
        FileHandle.standardError.write(banner.data(using: .utf8)!)
    }

    public func encodeChat(_ messages: [ChatMessage], thinking: Bool) throws -> [Int] {
        try encodeChat(messages, tools: [], thinking: thinking, effort: nil)
    }

    /// Render a conversation that may declare tools and replay tool calls.
    ///
    /// `tools` empty renders no `<tools>` block at all, which is what the
    /// Ollama and OpenAI dialects pass, so their bytes are unchanged.
    public func encodeChat(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: Self.additionalContext(thinking: thinking, effort: effort))
    }

    /// Encode a conversation, substituting the exact ids this server generated
    /// for any assistant turn it can still prove it produced.
    ///
    /// Why this exists. The prefix cache matches on bytes, and it must: the GDN
    /// recurrent state is a fold over the tokens it consumed, with no inverse,
    /// so a state may only be extended by the very ids that built it. A client
    /// replaying history does not send those ids — it sends its own view of the
    /// turn, which the template then re-renders. Whenever that re-render
    /// differs by a single byte, the next turn rebuilds the whole prompt.
    ///
    /// With reasoning ON that is not an edge case, it is every turn: fx (and
    /// most clients) never echo reasoning back, so the re-render is missing the
    /// `<think>` block the model actually produced, and the state cannot match.
    /// Measured on this machine, a two-turn tool loop reused 303 of 325 tokens
    /// with reasoning off and 0 of 349 with it on — three and a half times the
    /// wall time for the identical second turn.
    ///
    /// The splice closes that. For each assistant turn, ask the cache whether it
    /// still holds a state whose ids begin with exactly the prompt that turn was
    /// generated from; if it does, the remainder of those ids *is* that turn,
    /// verbatim. Check that the remainder really describes the turn the client
    /// sent (same calls, same arguments, same text) and then use the held ids in
    /// place of the re-render, tokenizing only the conversation after it.
    ///
    /// Splitting the text at `<|im_end|>` is safe because it is an added token
    /// and therefore a hard tokenizer boundary: the suffix tokenizes identically
    /// whether or not the text before it is present. That is measured, not
    /// assumed — see the `chat-splice` check.
    ///
    /// Any mismatch anywhere falls back to the plain render, which is the
    /// behaviour that existed before. The splice can make a turn cheaper; it can
    /// never make one wrong.
    public func encodeChatSpliced(
        _ messages: [ChatMessage], tools: [ToolDefinition], thinking: Bool, effort: String?
    ) throws -> [Int] {
        let full = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        guard prefixCache.enabled, messages.contains(where: { $0.role == "assistant" })
        else { return full }
        let fullText = tokenizer.decode(tokens: full, skipSpecialTokens: false)

        var spliced: [Int] = []  // ids exactly as the model saw or produced them
        var consumed = 0  // characters of fullText those ids already cover
        var didSplice = false

        func index(_ offset: Int) -> String.Index {
            fullText.index(fullText.startIndex, offsetBy: offset)
        }

        for k in messages.indices where messages[k].role == "assistant" {
            guard
                let headIds = try? encodeChat(
                    Array(messages[0..<k]), tools: tools, thinking: thinking, effort: effort)
            else { break }
            let headText = tokenizer.decode(tokens: headIds, skipSpecialTokens: false)
            guard fullText.hasPrefix(headText), headText.count >= consumed else { break }
            // The ids that produced turn k: what is already spliced, plus the
            // conversation between there and this turn's generation prompt.
            let bridge = String(fullText[index(consumed)..<index(headText.count)])
            let producer =
                spliced + (bridge.isEmpty ? [] : tokenizer.encode(text: bridge, addSpecialTokens: false))
            guard let entry = prefixCache.peek(extending: producer) else { break }
            let generated = Array(entry[producer.count...])
            let genText = tokenizer.decode(tokens: generated, skipSpecialTokens: false)
            guard Self.spliceDescribes(genText, messages[k], tools: tools) else { break }
            guard
                let end = fullText.range(
                    of: "<|im_end|>", range: index(headText.count)..<fullText.endIndex)
            else { break }
            spliced = entry
            consumed = fullText.distance(from: fullText.startIndex, to: end.lowerBound)
            didSplice = true
        }

        guard didSplice else { return full }
        let tail = String(fullText[index(consumed)...])
        return spliced + tokenizer.encode(text: tail, addSpecialTokens: false)
    }

    /// Does this generated text describe the assistant turn the client sent?
    ///
    /// Deliberately compares meaning rather than bytes: the client's copy has
    /// been through its own JSON round trip, so whitespace and argument order
    /// may differ, but the calls it reports must be the calls that were made.
    /// Reasoning is ignored — the client dropping it is the whole reason the
    /// splice is needed.
    public static func spliceDescribes(
        _ generated: String, _ message: ChatMessage, tools: [ToolDefinition]
    ) -> Bool {
        let (_, body) = ThinkSplitter.split(generated)
        let visible = body.isEmpty && !generated.contains("</think>") ? generated : body
        let events = ToolCallSplitter.parseAll(visible, tools: tools.map { $0.schema })
        var calls: [ParsedToolCall] = []
        var text = ""
        for e in events {
            switch e {
            case .toolCall(let c): calls.append(c)
            case .text(let t): text += t
            case .malformed: return false
            default: break
            }
        }
        guard calls.count == message.toolCalls.count else { return false }
        for (a, b) in zip(calls, message.toolCalls) {
            guard a.name == b.name, a.arguments == b.arguments else { return false }
        }
        // The text is compared after trimming only. A client that rewrites the
        // assistant's prose is describing a different turn, and re-rendering it
        // is then the correct answer.
        return text.trimmingCharacters(in: .whitespacesAndNewlines)
            == message.content.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    static func additionalContext(thinking: Bool, effort: String?) -> [String: any Sendable] {
        var ctx: [String: any Sendable] = ["enable_thinking": thinking]
        if let e = effort, thinking { ctx["reasoning_effort"] = e }
        return ctx
    }

    /// Render a template without constructing the multi-GB model. Installer
    /// and API acceptance checks run this while a server is already live; the
    /// old implementation built a second Engine merely to load the tokenizer,
    /// so the singleton guard correctly rejected the check it was meant to run.
    public static func encodeChatWithoutModel(
        modelDir: URL, messages: [ChatMessage], thinking: Bool,
        tools: [ToolDefinition] = [], effort: String? = nil
    ) async throws -> [Int] {
        let tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        return try tokenizer.applyChatTemplate(
            messages: messages.map { $0.templateValue },
            tools: tools.isEmpty ? nil : tools.map { $0.templateValue },
            additionalContext: additionalContext(thinking: thinking, effort: effort))
    }

    /// OpenAI path: messages already contain image_url parts, and content may
    /// be String or [[String: Any]] (vision). The nested arrays must be
    /// bridged to the tokenizer's `[String: any Sendable]` messages or the
    /// vision parts are silently dropped before the Jinja template can render
    /// them as <|image_pad|>.
    public func encodeChatOpenAI(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> [Int] {
        func toSendable(_ v: Any) -> any Sendable {
            if let arr = v as? [[String: Any]] {
                return arr.map { d -> [String: any Sendable] in
                    var out: [String: any Sendable] = [:]
                    for (k, vv) in d { out[k] = toSendable(vv) }
                    return out
                } as any Sendable
            }
            if let d = v as? [String: Any] {
                var out: [String: any Sendable] = [:]
                for (k, vv) in d { out[k] = toSendable(vv) }
                return out as any Sendable
            }
            if let a = v as? [Any] {
                return a.map { toSendable($0) } as any Sendable
            }
            return v as any Sendable
        }
        let msgs: [[String: any Sendable]] = messages.map { dict in
            var m: [String: any Sendable] = [:]
            for (k, v) in dict { m[k] = toSendable(v) }
            return m
        }
        let toolSpecs: [[String: any Sendable]]? = tools?.map { dict in
            var t: [String: any Sendable] = [:]
            for (k, v) in dict { t[k] = toSendable(v) }
            return t
        }
        return try tokenizer.applyChatTemplate(
            messages: msgs, tools: toolSpecs, additionalContext: ["enable_thinking": thinking])
    }

    // MARK: Vision

    /// Load the vision tower on first use, and only if the machine can spare
    /// it right now.
    ///
    /// **Under the generation lock, not a lock of its own.** Loading is
    /// ~0.9 GB of MLX arrays plus an `eval`; a private lock let that run on a
    /// connection thread while another request was mid-generation, which is
    /// exactly the concurrent GPU work every other allocation path in this
    /// file serializes. `withExclusive` is that serialization, and it also
    /// makes the availability reading below meaningful: nothing else can
    /// allocate between reading it and taking the memory.
    ///
    /// Replan before allocation so a target-driven process pays for the
    /// tower with expert capacity. Also require real machine headroom: an
    /// accounting allowance is not proof that physical memory is available.
    public func ensureVisionTower() throws -> VisionTower { try ensureVisionTower(request: nil) }

    public func ensureVisionTower(request: RequestController?, workspaceBytes: Int = 0) throws -> VisionTower {
        guard workspaceBytes >= 0 else {
            throw RequestFailure(.invalidConfiguration, "vision workspace bytes must be nonnegative")
        }
        guard visionAllowed else {
            throw SlotstreamError.vision(
                "this server was started with --vision off; images are not accepted")
        }
        if let request { try lock.lock(request: request) } else { lock.lock() }
        defer { lock.unlock() }
        return try { () throws -> VisionTower in
            try request?.check(nextAllocationBytes: visionTower == nil ? 1_900_000_000 : 0, phase: "vision tower allocation")
            if pressureBoundary.snapshot() != nil {
                let failure = RequestFailure(.insufficientMemory, "memory pressure interrupted image preparation; retry after the cache resizes")
                throw request?.fail(failure) ?? failure
            }
            let reservedPlan: MemoryPlan?
            do { reservedPlan = try currentPlan.map { try Planner.loadingVision($0) } }
            catch {
                let failure = RequestFailure(.insufficientMemory, "vision allocation cannot fit the current plan: \(error)")
                throw request?.fail(failure) ?? failure
            }
            if let charged = reservedPlan {
                let ledger = charged.memoryLedger
                let peak = ContextBytes.sum(ledger.expectedPeakBytes - ledger.prefillBytes,
                    max(ledger.prefillBytes, workspaceBytes))
                if let target = charged.targetGB, Double(peak) > target * 1e9 {
                    var failure = RequestFailure(.insufficientMemory,
                        "image attention workspace exceeds this process memory target; resize the image or raise --memory-gb")
                    failure.requiredBytes = peak
                    failure.availableBytes = target < Double(Int.max) / 1e9 ? Int(target * 1e9) : Int.max
                    throw request?.fail(failure) ?? failure
                }
            }
            try request?.check(nextAllocationBytes: workspaceBytes, phase: "vision workspace admission")
            if let vt = visionTower { return vt }
            let idx = try CheckpointIndex(dir: modelDir)
            guard VisionTower.present(index: idx) else {
                throw SlotstreamError.vision(
                    "this checkpoint has no vision tower — it is a text-only model")
            }
            let needGB = Double(VisionTower.residentBytes(index: idx)) / 1e9
            guard needGB <= Planner.visionResidentGB else {
                throw SlotstreamError.vision("vision weights exceed the supported resident allowance")
            }
            if let avail = Planner.deviceAvailableGB(), avail.isFinite,
                avail < needGB + Planner.visionLoadMarginGB
            {
                let failure = RequestFailure(.insufficientMemory, String(
                        format: "the vision tower needs %.1f GB and only %.1f GB is reclaimable "
                            + "right now — close other apps and retry, or restart with a lower "
                            + "--memory-gb so the tower fits",
                        needGB, avail))
                throw request?.fail(failure) ?? failure
            }
            if let p = reservedPlan {
                // The lock excludes generation and governor mutation. Shrink
                // releases the old arena before allocating the smaller one.
                model.pool.resize(to: p.slots)
                if p.runtimeAllocationPolicy != nil {
                    generator.setPrefillBudgetCeiling(p.prefillChunk)
                    prefixCache.setBudgetLimit(p.prefixCacheTokens)
                }
                generator.prefillChunk = min(generator.prefillChunk, p.prefillChunk)
                prefixCache.configure(maxTokens: min(prefixCache.maxTokens, p.prefixCacheTokens))
                MLX.Memory.clearCache()
                updatePlan(p)
                publishPoolSnapshot()
            }
            let vt = try VisionTower(index: idx)
            self.visionTower = vt
            return vt
        }()
    }

    /// Tokenize with vision expansion: each template image_pad is worth
    /// N_merged real tokens, so the template's single pad is expanded to a run
    /// of pads that the tower's embeddings will fill. Returns the expanded ids
    /// and a `VisionPrompt` when the request carries images, nil otherwise.
    ///
    /// The tower does not run here. The run lengths come from each image's
    /// dimensions, so the ids — and with them the prefix cache key — are ready
    /// before any pixels are read. `Generator.generate` asks the cache first
    /// and then encodes only the images that the reused state does not cover.
    public func encodeWithVision(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false
    ) throws -> ([Int], VisionPrompt?) {
        try encodeWithVision(messages: messages, tools: tools, thinking: thinking, request: nil)
    }

    public func encodeWithVision(
        messages: [[String: Any]], tools: [[String: Any]]?, thinking: Bool = false,
        request: RequestController?
    ) throws -> ([Int], VisionPrompt?) {
        let request: RequestController? = try request ?? beginRequest()
        try request?.attachReservations(requestReservations)
        try request?.checkInputBytes(ContextBytes.sum(ContextInputMemory.bytes(messages), ContextInputMemory.bytes(tools ?? [])))
        let baseIds = try encodeChatOpenAI(messages: messages, tools: tools, thinking: thinking)
        return try withImages(baseIds: baseIds, sources: Self.imageSources(in: messages), request: request)
    }

    /// The typed path (`ChatMessage`), for the fx gateway and the CLI. Renders
    /// through the same template as `encodeChat` and then expands the same
    /// placeholders.
    public func encodeChatWithVision(
        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
        effort: String? = nil
    ) throws -> ([Int], VisionPrompt?) {
        try encodeChatWithVision(messages, tools: tools, thinking: thinking, effort: effort, request: nil)
    }

    public func encodeChatWithVision(
        _ messages: [ChatMessage], tools: [ToolDefinition] = [], thinking: Bool = false,
        effort: String? = nil, request: RequestController?
    ) throws -> ([Int], VisionPrompt?) {
        let request: RequestController? = try request ?? beginRequest()
        try request?.attachReservations(requestReservations)
        try request?.checkInputBytes(ContextInputMemory.bytes(messages: messages, tools: tools))
        let baseIds = try encodeChat(messages, tools: tools, thinking: thinking, effort: effort)
        return try withImages(baseIds: baseIds, sources: messages.flatMap { $0.images }, request: request)
    }

    /// Expand each `<|image_pad|>` the template rendered into the run of
    /// placeholders its image is worth, and describe the images for the tower
    /// and the prefix cache. Shared by every surface so they cannot drift.
    private func withImages(baseIds: [Int], sources: [String], request: RequestController? = nil) throws -> ([Int], VisionPrompt?) {
        defer { request?.releaseDispatchReservation() }
        try request?.check(phase: "prompt preparation")
        if sources.isEmpty { return (baseIds, nil) }
        let started = RuntimeClock.now()
        let observer = generator.footprintSampling ? FootprintSampler() : nil
        let vmBefore = generator.footprintSampling ? ProcessMemory.vmActivity() : nil
        var observationFinished = false
        defer { if !observationFinished { _ = observer?.finish() } }
        // Decode and hash first: it needs no tower, it is cheap next to one,
        // and a malformed picture should be a 400 before the process commits
        // 0.9 GB to a tower it may not otherwise need.
        var decoded: [(cg: CGImage, hash: ImageHash)] = []
        let sourceBatch = DecodedImageBatch(deduplicate: model.optimizations.deduplicateImages)
        decoded.reserveCapacity(sources.count)
        for (i, source) in sources.enumerated() {
            try request?.check(nextAllocationBytes: min(source.utf8.count, VisionPreprocess.maxImageBytes * 2), phase: "image source decoding")
            do {
                let data = try VisionPreprocess.loadImageData(from: source)
                decoded.append(try sourceBatch.decode(data, request: request))
            } catch let failure as RequestFailure { throw failure }
            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
        }
        let decodedSeconds = RuntimeClock.seconds(since: started)
        let (visionConfig, pixelBounds) = try VisionTower.configuration(directory: modelDir)
        var items: [VisionPrompt.Item] = []
        items.reserveCapacity(decoded.count)
        var expandedCount = baseIds.count
        for (i, d) in decoded.enumerated() {
            try request?.check(phase: "image geometry")
            do {
                let plan = try VisionTower.plan(height: d.cg.height, width: d.cg.width,
                    cfg: visionConfig, bounds: pixelBounds)
                let (next, overflow) = expandedCount.addingReportingOverflow(plan.mergedTokens - 1)
                guard !overflow, next <= min(maxContextTokens, ContextPolicy.visionLimit) else {
                    throw RequestFailure(.contextLengthExceeded,
                        "image-expanded input exceeds the configured or qualified vision context; reduce the history or image count")
                }
                expandedCount = next
                items.append(VisionPrompt.Item(image: d.cg, plan: plan))
            } catch let failure as RequestFailure { throw failure }
            catch { throw SlotstreamError.vision("image \(i + 1): \(error)") }
        }
        let towerStart = RuntimeClock.now()
        let workspace = items.map { ContextWorkspace.visionBytes(patches: $0.plan.patches,
            hidden: visionConfig.hiddenSize, heads: visionConfig.numHeads,
            queryTile: model.optimizations.visionQueryTile, padding: model.optimizations.visionAttentionPadding) }.max() ?? 0
        let vt = try ensureVisionTower(request: request, workspaceBytes: ContextBytes.sum(workspace, sourceBatch.chargedBytes))
        let towerReadySeconds = RuntimeClock.seconds(since: towerStart)
        // The template renders one `<|image_pad|>` per image; the tower
        // produces `mergedTokens` rows for it. Expanding the pad into a run of
        // that length is what makes the two line up, and it moves every token
        // after the first image — ids and segment offsets alike, in one sweep,
        // so a later prompt that extends this one keys identically.
        let imageId = model.cfg.imageTokenId
        let perImage = items.map { $0.plan.mergedTokens }
        var expanded: [Int] = []
        var segments: [ImageSegment] = []
        expanded.reserveCapacity(baseIds.count + perImage.reduce(0, +) - perImage.count)
        var imgIdx = 0
        for tok in baseIds {
            if tok == imageId, imgIdx < perImage.count {
                segments.append(
                    ImageSegment(
                        start: expanded.count, count: perImage[imgIdx], hash: decoded[imgIdx].hash))
                expanded.append(contentsOf: repeatElement(imageId, count: perImage[imgIdx]))
                imgIdx += 1
            } else {
                expanded.append(tok)
            }
        }
        // Both directions are checked. Too few placeholders means the template
        // did not render an image this code found; too many means something
        // else in the prompt tokenized to the placeholder id — a user who
        // typed the literal `<|image_pad|>`, for instance. Either way the rows
        // and the runs would not correspond, so the request stops here rather
        // than putting embeddings under the wrong tokens.
        guard imgIdx == items.count else {
            throw SlotstreamError.vision(
                "the chat template rendered \(imgIdx) image placeholders for \(items.count) "
                    + "images; slotstream cannot place the rest")
        }
        let placeholders = expanded.reduce(0) { $0 + ($1 == imageId ? 1 : 0) }
        guard placeholders == perImage.reduce(0, +) else {
            throw SlotstreamError.vision(
                "the prompt carries \(placeholders) image placeholder tokens but the images "
                    + "account for \(perImage.reduce(0, +)); remove any literal <|image_pad|> "
                    + "from the text")
        }
        guard expanded.count <= min(maxContextTokens, ContextPolicy.visionLimit) else {
            throw RequestFailure(.contextLengthExceeded, "image-expanded input exceeds the configured or qualified vision context limit")
        }
        let prompt = VisionPrompt(tower: vt, items: items, segments: segments, hiddenSize: model.cfg.hiddenSize)
        prompt.preparationRequest = request
        prompt.preparationObservation = ImagePreparationObservation(
            seconds: RuntimeClock.seconds(since: started), sourceDecodeSeconds: decodedSeconds,
            towerReadySeconds: towerReadySeconds, sampledFootprint: observer?.finish(),
            vmBefore: vmBefore, vmAfter: generator.footprintSampling ? ProcessMemory.vmActivity() : nil,
            sourceDecodedImages: sourceBatch.decodedImages, sourceReusedImages: sourceBatch.reusedImages,
            sourceAdmissionBytes: sourceBatch.chargedBytes)
        observationFinished = true
        return (expanded, prompt)
    }

    /// Every image a request carries, in the order the chat template will
    /// render them: message by message, part by part, and Ollama's per-message
    /// `images` array after that message's content parts — which is where the
    /// template puts them too.
    public static func imageSources(in messages: [[String: Any]]) -> [String] {
        var out: [String] = []
        for m in messages {
            if let content = m["content"] as? [[String: Any]] {
                for part in content {
                    if let iu = part["image_url"] as? [String: Any], let u = iu["url"] as? String {
                        out.append(u)
                    } else if let u = part["image_url"] as? String {
                        out.append(u)
                    } else if let u = part["image"] as? String {
                        out.append(u)
                    }
                }
            }
            for b64 in (m["images"] as? [String] ?? []) { out.append(b64) }
        }
        return out
    }

    /// Earliest position at which any stop sequence occurs, or nil.
    private static func stopIndex(_ text: String, _ stops: [String]) -> String.Index? {
        var best: String.Index?
        for s in stops {
            if let r = text.range(of: s), best == nil || r.lowerBound < best! {
                best = r.lowerBound
            }
        }
        return best
    }

    /// Serialized generation (single-flight; callers queue on the lock).
    ///
    /// Incremental detokenization consumes bounded groups of token ids, keeping
    /// incomplete UTF-8 bytes at the group boundary. Two rules matter:
    ///
    /// - Emission and stop holdback are by Unicode scalar, never Character. A
    ///   later token can contribute a scalar that merges into the grapheme
    ///   already sent (an emoji plus U+FE0F is still one Character).
    /// - While stop sequences are active, the last `maxStopLength - 1` scalars
    ///   are withheld, so the prefix of a stop sequence that straddles a token
    ///   boundary is never emitted before the rest of it arrives. Whatever is
    ///   still held back is flushed once generation ends.
    ///
    /// The invariant the tests hold this to: concatenating every streamed delta
    /// reproduces the non-streamed text exactly.
    public func generate(
        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        generate(promptIds: promptIds, params: params, vision: vision,
            shouldContinue: shouldContinue, onToken: onToken, request: nil)
    }

    public func generate(
        promptIds: [Int], params: SampleParams, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil,
        request: RequestController?, onAdmitted: (() -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        let requestStart = RuntimeClock.now()
        let control: RequestController
        do {
            if let contextAssignmentFailure = contextLock.withLock({ contextAssignmentFailure }) { throw contextAssignmentFailure }
            if let unavailable = planLock.withLock({ allocationUnavailable }) { throw unavailable }
            control = try request ?? beginRequest()
            try control.attachReservations(requestReservations)
            guard control.configuration.maxContextTokens <= allocatedContextTokens else {
                throw RequestFailure(.invalidConfiguration, "request policy exceeds the allocated engine window")
            }
            if let why = contextError(promptTokens: promptIds.count) {
                throw RequestFailure(.contextLengthExceeded, why)
            }
            guard promptIds.count <= control.configuration.maxContextTokens else {
                throw RequestFailure(.contextLengthExceeded, "prompt exceeds this request's configured context window")
            }
            try lock.lock(request: control)
        } catch {
            var stats = GenStats(); stats.promptTokens = promptIds.count
            let failure = error as? RequestFailure ?? RequestFailure(.inferenceError, String(describing: error))
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.memoryPressureCancelled = failure.code == .insufficientMemory
            if failure.code == .insufficientMemory, let ticket = pressureBoundary.snapshot() {
                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            stats.requestSeconds = request?.elapsedSeconds ?? RuntimeClock.seconds(since: requestStart)
            stats.recordProcessMemory()
            return ("", [], stats)
        }
        let queueSeconds = RuntimeClock.seconds(since: requestStart)
        let preparationSeconds = max(0, control.elapsedSeconds - queueSeconds)
        defer { control.releaseDispatchReservation(); lock.unlock() }
        var params = params.sanitized()
        // A queued request may acquire the lock before the waiting governor.
        // Refuse it before image encoding, cache checkout or GPU allocation.
        if let ticket = pressureBoundary.snapshot() {
            var stats = GenStats()
            stats.promptTokens = promptIds.count
            stats.memoryPressureCancelled = true
            let failure = control.fail(RequestFailure(.insufficientMemory,
                "memory pressure interrupted inference; retry after the cache resizes"))
            stats.requestFailure = failure; stats.runtimeError = failure.message
            stats.finishReason = "error"
            stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            stats.recordProcessMemory()
            return ("", [], stats)
        }
        let modeLimit = vision == nil ? ContextPolicy.modelLimit : ContextPolicy.visionLimit
        let effectiveWindow = min(maxContextTokens, control.configuration.maxContextTokens, modeLimit)
        guard promptIds.count <= effectiveWindow else {
            let failure = control.fail(RequestFailure(.contextLengthExceeded,
                "prompt exceeds the configured or qualified vision context window"))
            var stats = GenStats(); stats.promptTokens = promptIds.count
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.queueSeconds = queueSeconds; stats.preparationSeconds = preparationSeconds
            stats.recordProcessMemory()
            return ("", [], stats)
        }
        let room = max(0, effectiveWindow - promptIds.count)
        if room == 0 {
            if onAdmitted?() == false { control.cancel() }
            var stats = GenStats()
            if let failure = control.failure {
                stats.requestFailure = failure; stats.runtimeError = failure.message
            }
            stats.promptTokens = promptIds.count
            stats.finishReason = control.failure == nil ? "length" : "error"
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.queueSeconds = queueSeconds
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            stats.recordProcessMemory()
            return ("", [], stats)
        }
        // Context is prompt + completion, not two independent 32k allowances.
        params.maxTokens = min(params.maxTokens, room)
        let stops = params.stop
        let holdBack = stops.isEmpty
            ? 0 : max(0, (stops.map { $0.unicodeScalars.count }.max() ?? 1) - 1)
        var pendingIds: [Int] = []
        var withheld = ""
        var delivered = ""
        var lastTok = -1
        var clientGone = false
        var stopFound = false
        var firstTextSeconds: Double?
        var pressureObserved: PressureTicket?
        var pressureBoundarySeconds: Double?

        func observePressure() -> Bool {
            guard let ticket = pressureBoundary.snapshot() else { return false }
            control.fail(RequestFailure(.insufficientMemory,
                "memory pressure interrupted inference; retry after the cache resizes"))
            if pressureObserved == nil {
                pressureObserved = ticket
                pressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            return true
        }

        func emit(_ delta: String, _ tok: Int) -> Bool {
            if delta.isEmpty { return true }
            delivered += delta
            guard let cb = onToken else { return true }
            if firstTextSeconds == nil { firstTextSeconds = RuntimeClock.seconds(since: requestStart) }
            return cb(tok, delta)
        }

        /// Feed a stable decoded piece through the stop-sequence holdback.
        func feed(_ piece: String, final: Bool, tok: Int) -> Bool {
            withheld += piece
            if !stops.isEmpty, let cut = Self.stopIndex(withheld, stops) {
                _ = emit(String(withheld[..<cut]), tok)
                withheld = ""
                stopFound = true
                return false
            }
            let scalars = withheld.unicodeScalars
            let n = final ? scalars.count : max(0, scalars.count - holdBack)
            let delta = String(String.UnicodeScalarView(scalars.prefix(n)))
            withheld = String(String.UnicodeScalarView(scalars.dropFirst(n)))
            return emit(delta, tok)
        }

        /// Qwen's ByteLevel decoder is concatenative once a UTF-8 scalar is
        /// complete. Decode small bounded groups and retain four token bytes at
        /// the boundary; if the candidate still ends in U+FFFD, retain more.
        /// This makes streaming decode O(n), rather than decoding tokens 1...n
        /// after every generated token.
        func flushStablePrefix(_ tok: Int) -> Bool {
            guard !pendingIds.isEmpty else { return true }
            // Start from everything buffered and hand back one token at a time
            // while the decode still ends mid-scalar. Waiting for eight tokens
            // before the first flush and holding four back after it gave
            // clients one delta per four tokens, and no delta at all for a
            // reply shorter than eight; the byte-exactness this protects rests
            // on the replacement-character check below, not on the backlog.
            var n = pendingIds.count
            var piece = ""
            while n > 0 {
                piece = tokenizer.decode(
                    tokens: Array(pendingIds.prefix(n)), skipSpecialTokens: true)
                if !piece.hasSuffix("\u{FFFD}") { break }
                n -= 1
            }
            guard n > 0 else { return true }
            pendingIds.removeFirst(n)
            return feed(piece, final: false, tok: tok)
        }

        let needsIncrementalDecode = onToken != nil || !stops.isEmpty
        let tokenHandler: ((Int) -> Bool)? = needsIncrementalDecode ? { tok in
            control.sampledFirstToken()
            lastTok = tok
            pendingIds.append(tok)
            let ok = flushStablePrefix(tok)
            if !ok, !stopFound { clientGone = true }
            // A pressure event can arrive inside a client callback. This is
            // already a supported committed-emission boundary in both decode
            // paths; do not spend another forward before observing it.
            return ok && !observePressure()
        } : { _ in control.sampledFirstToken(); return !observePressure() }

        // Snapshot after any vision reservation/governor resize, while this
        // request owns the generation gate. Keep explicit process targets and
        // the device working set separate from reclaimable-memory admission.
        generator.readScopeFootprintLimitBytes = currentPlan.flatMap { plan in
            let limit = min(plan.targetGB ?? plan.expectedPeakGB, plan.workingSetGB)
            return limit.isFinite && limit > 0 && limit < Double(Int.max) / 1e9
                ? Int(limit * 1e9) : 0
        }
        var (ids, stats) = generator.generate(
            promptIds: promptIds, params: params, eosIds: eosIds, cache: prefixCache,
            vision: vision,
            shouldContinue: {
                guard !clientGone, !stopFound else { return false }
                if observePressure() { return false }
                return shouldContinue?() ?? true
            }, onToken: tokenHandler, request: control, onAdmitted: onAdmitted)

        var text = tokenizer.decode(tokens: ids, skipSpecialTokens: true)
        if !stops.isEmpty, let cut = Self.stopIndex(text, stops) {
            text = String(text[text.startIndex ..< cut])
        }
        // The one full decode is both the non-streamed result and an exact final
        // reconciliation for the bounded incremental decoder.
        if !clientGone, control.failure == nil, stats.runtimeError == nil, onToken != nil {
            let target = text.unicodeScalars
            let sent = delivered.unicodeScalars
            if target.count >= sent.count, target.starts(with: sent) {
                _ = emit(String(String.UnicodeScalarView(target.dropFirst(sent.count))), lastTok)
            }
        }
        stats.queueSeconds = queueSeconds
        stats.preparationSeconds = preparationSeconds
        stats.memoryPressureCancelled = pressureObserved != nil
        if pressureObserved != nil {
            stats.runtimeError = stats.runtimeError
                ?? "memory pressure interrupted inference; retry after the cache resizes"
            stats.finishReason = "error"
        }
        stats.memoryPressureBoundarySeconds = pressureBoundarySeconds
        stats.firstTextSeconds = firstTextSeconds
        if let failure = control.failure {
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.memoryPressureCancelled = failure.code == .insufficientMemory
            // A request guard can see the ticket before the legacy continuation
            // callback runs. Preserve the same observed boundary in that path.
            if failure.code == .insufficientMemory, stats.memoryPressureBoundarySeconds == nil,
               let ticket = pressureBoundary.snapshot() {
                stats.memoryPressureBoundarySeconds = RuntimeClock.seconds(since: ticket.requestedAt)
            }
            prefixCache.drop()
            Stream.gpu.synchronize()
            MLX.Memory.clearCache()
        }
        stats.requestSeconds = control.elapsedSeconds
        stats.recordProcessMemory()
        return (text, ids, stats)
    }
}
