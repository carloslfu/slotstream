import Foundation
import Slotstream

public struct EngineTurn: Sendable {
    public var text: String
    public var calls: [ProposedTool]
    public var finishReason: String
    /// Recorded with the run when the turn thought first. Never the thought itself.
    public var thinking: ThinkingReceipt?
    /// What this turn cost, as the engine measured it. Numbers only.
    public var metrics: ResponseMetrics?
    public init(text: String, calls: [ProposedTool] = [], finishReason: String = "stop", metrics: ResponseMetrics? = nil) {
        self.text = text; self.calls = calls; self.finishReason = finishReason; self.metrics = metrics
    }
    /// Completion and size gate applied to every turn, before any tool runs.
    public func validateCompletion() throws {
        guard finishReason == "stop" || finishReason == "tool_calls" else {
            throw SevraError.refused("The model response ended before a successful completion (\(finishReason)). Proposed actions were not executed.")
        }
        guard text.utf8.count <= 262144, calls.count <= EngineTurn.maxCalls, Set(calls.map(\.id)).count == calls.count else {
            throw SevraError.refused("The response exceeded its bounds or reused a tool-call ID.")
        }
        guard finishReason != "tool_calls" || !calls.isEmpty else { throw SevraError.refused("The model declared tool calls but returned none. No actions were executed.") }
    }
    /// Staging several files is one reviewed change, so a turn may propose up
    /// to eight calls. Proposal tools still stand alone.
    public static let maxCalls = 8
    /// Validates the entire call set against the tools offered for this job.
    public func validate(offered: [ToolSpec]) throws {
        try validateCompletion()
        if calls.count > 1, let terminal = calls.first(where: { call in offered.first { $0.name == call.name }?.terminal == true }) {
            throw SevraError.refused(terminal.name == "artifact.propose" ? "Propose one document for review in its own response. No actions from this response were executed." : "Propose \(terminal.name) in its own response. No actions from this response were executed.")
        }
        var correction: ToolSchemaError?
        for call in calls {
            do { try call.validate(offered: offered) }
            catch let error as ToolSchemaError { if correction == nil { correction = error } }
            catch { throw error }
        }
        if let correction { throw correction }
    }
    /// The original starter tool set.
    public func validate() throws { try validate(offered: ToolCatalog.specs(for: [.read, .document])) }
}
/// Latest-state observation is bounded independently from the authoritative
/// completion. Slow views cannot block generation or enqueue token tasks.
public final class TurnBuffer: @unchecked Sendable {
    private let lock = NSLock()
    private var text = ""
    private var status = "Preparing"
    private var thoughts = ""
    private var thoughtBytes = 0
    private var thoughtTokens = 0
    private var thoughtEnding: ThinkingReceipt.Ending?
    private var thinkingStarted: TimeInterval?
    private var thinkingEnded: TimeInterval?
    /// Arrival times of the first and latest token of each phase, for the
    /// live writing speed. The recorded numbers come from the engine.
    private var thoughtTokenTimes: (first: TimeInterval, last: TimeInterval)?
    private var answerTokens = 0
    private var answerTokenTimes: (first: TimeInterval, last: TimeInterval)?
    public init() {}
    public func append(_ delta: String) -> Bool {
        lock.lock(); defer { lock.unlock() }
        guard text.utf8.count + delta.utf8.count <= 262144 else { return false }
        text += delta; return true
    }
    public func stage(_ s: String) { lock.lock(); status = s; lock.unlock() }
    public func snapshot() -> (String, String) { lock.lock(); defer { lock.unlock() }; return (text, status) }
    /// The visible thought is bounded; tokens past the bound still count.
    /// One call is one thought token. The visible text is bounded; tokens past
    /// the bound still count.
    public func appendThought(_ delta: String) {
        lock.lock(); defer { lock.unlock() }
        let now = ProcessInfo.processInfo.systemUptime
        if thinkingStarted == nil { thinkingStarted = now }
        thoughtTokenTimes = (thoughtTokenTimes?.first ?? now, now)
        thoughtTokens += 1
        guard thoughtBytes + delta.utf8.count <= 65536 else { return }
        thoughts += delta; thoughtBytes += delta.utf8.count
    }
    /// One answer token arrived. Text can lag behind tokens while tool-call
    /// markup is held back, so tokens are counted where the engine yields them.
    public func countAnswerToken() {
        lock.lock(); defer { lock.unlock() }
        let now = ProcessInfo.processInfo.systemUptime
        answerTokenTimes = (answerTokenTimes?.first ?? now, now)
        answerTokens += 1
    }
    /// The phase writing now, its tokens so far, and the time between its
    /// first and latest token. Nil before the first token of either phase.
    public func generation() -> (thinking: Bool, tokens: Int, seconds: Double)? {
        lock.lock(); defer { lock.unlock() }
        if let times = answerTokenTimes { return (false, answerTokens, times.last - times.first) }
        if thinkingEnded == nil, let times = thoughtTokenTimes { return (true, thoughtTokens, times.last - times.first) }
        return nil
    }
    public func beginThinking() { lock.lock(); if thinkingStarted == nil { thinkingStarted = ProcessInfo.processInfo.systemUptime }; lock.unlock() }
    public func endThinking(_ ending: ThinkingReceipt.Ending) {
        lock.lock(); defer { lock.unlock() }
        if thinkingStarted == nil { thinkingStarted = ProcessInfo.processInfo.systemUptime }
        if thinkingEnded == nil { thinkingEnded = ProcessInfo.processInfo.systemUptime; thoughtEnding = ending }
    }
    public var thinkingSeconds: Double { thinking()?.seconds ?? 0 }
    public func thinking() -> (text: String, seconds: Double, active: Bool, ending: ThinkingReceipt.Ending?)? {
        lock.lock(); defer { lock.unlock() }
        guard let started = thinkingStarted else { return nil }
        let end = thinkingEnded ?? ProcessInfo.processInfo.systemUptime
        return (thoughts, max(0, end - started), thinkingEnded == nil, thoughtEnding)
    }
    /// The receipt as far as this buffer can tell: exact when the thought
    /// ended normally, `stopped` when the run ended first. Nil if no thought ran.
    public func thinkingReceipt(level: String, budgetTokens: Int) -> ThinkingReceipt? {
        lock.lock(); defer { lock.unlock() }
        guard let started = thinkingStarted else { return nil }
        let end = thinkingEnded ?? ProcessInfo.processInfo.systemUptime
        return ThinkingReceipt(level: level, budgetTokens: budgetTokens, tokens: thoughtTokens, seconds: max(0, end - started), ending: thoughtEnding ?? .stopped)
    }
}
public protocol Inference: Sendable {
    var simulated: Bool { get }
    var performanceTelemetry: PerformanceTelemetry? { get }
    func configure(_ preferences: PerformancePreferences) async throws
    func prepareCache(_ context: InferenceCacheContext) async throws
    func turn(history: [ChatMessage], tools: [ToolDefinition], cancellation: Cancellation, buffer: TurnBuffer) async throws -> EngineTurn
    /// A turn that may think first. `thinking` is nil for tool turns; `control`
    /// carries Answer now. Engines without thinking answer directly.
    /// `replyTokens` is the most the reply may use; the engine may use less
    /// when the context is nearly full.
    func turn(history: [ChatMessage], tools: [ToolDefinition], thinking: ThinkingRequest?, replyTokens: Int, control: ThinkingControl, cancellation: Cancellation, buffer: TurnBuffer) async throws -> EngineTurn
    func unload() async
    /// Starts work the first message would otherwise wait for, such as
    /// checking the model files. Never loads the model.
    func prepareAhead() async
    /// Drops everything a private conversation left in memory. Engines that
    /// cannot do less release the model.
    func releasePrivateState() async
}
public extension Inference {
    func prepareCache(_ context: InferenceCacheContext) async throws {}
    func prepareAhead() async {}
    func releasePrivateState() async { await unload() }
    func turn(history: [ChatMessage], tools: [ToolDefinition], thinking: ThinkingRequest?, replyTokens: Int, control: ThinkingControl, cancellation: Cancellation, buffer: TurnBuffer) async throws -> EngineTurn {
        try await turn(history: history, tools: tools, cancellation: cancellation, buffer: buffer)
    }
}

/// Reply budgets. A document, file change or app can be long; a plain answer
/// rarely is. These are development operating bounds for a 32,768-token
/// window at a few to sixteen tokens per second, not measured optima.
public enum ReplyPolicy {
    public static let answerTokens = 4096
    public static let proposalTokens = 12288
    public static let minimumTokens = 256
    /// What a turn's reply may use. A thought shortens a plain answer, which
    /// is the bound thinking was measured with, but never a turn that can
    /// stage a change, a document or an app: those need their whole budget,
    /// and the thought has its own.
    public static func replyTokens(thinking: ThinkingRequest?, requested: Int, tools: Bool, room: Int) -> Int {
        min(tools ? requested : (thinking?.replyTokens ?? requested), room)
    }
}

private final class InferenceExecutor: SerialExecutor, @unchecked Sendable {
    private let queue = DispatchQueue(label: "sevra.inference", qos: .userInitiated, autoreleaseFrequency: .workItem)
    func enqueue(_ job: consuming ExecutorJob) {
        let job = UnownedJob(job)
        queue.async { job.runSynchronously(on: self.asUnownedSerialExecutor()) }
    }
}

public actor LocalInference: Inference {
    private nonisolated let executor = InferenceExecutor()
    public nonisolated var unownedExecutor: UnownedSerialExecutor { executor.asUnownedSerialExecutor() }
    public nonisolated let simulated = false
    public nonisolated let performanceTelemetry: PerformanceTelemetry? = PerformanceTelemetry()
    private var engine: Engine?
    private var governor: MemoryGovernor?
    private let model: URL
    private let modelVerification = ModelVerificationCache()
    /// The file check started ahead of the first message, off the inference
    /// queue. A turn joins it instead of hashing again.
    private let ahead = VerificationAhead()
    private var releasedAt: TimeInterval?
    private var preferences: PerformancePreferences
    private var inTurn = false
    private var cacheContext: InferenceCacheContext?
    private var privateWorkingState = false
    public private(set) var persistentCacheActive = false
    /// The engine's own statistics for each request of the last turn, so a
    /// real check can compare them with what the app recorded.
    public private(set) var lastStats: [GenStats] = []
    public init(model: URL = WeightStore.default.modelDirectory, preferences: PerformancePreferences = .init()) {
        self.model = model; self.preferences = preferences
    }
    /// Explicit bounded configuration for existing callers and real checks.
    public init(model: URL = WeightStore.default.modelDirectory, memoryGB: Double) {
        self.model = model; self.preferences = .init(budget: .custom, customGB: memoryGB)
    }
    public func prepareCache(_ context: InferenceCacheContext) async throws {
        guard !inTurn else { throw SevraError.refused("Cache ownership changes after the current response.") }
        guard cacheContext != context || (privateWorkingState && context.directory != nil) else { return }
        // On a privacy/Home transition, clear memory before encoding as well
        // as detaching disk. A promoted or copied history must not splice a
        // previous private session's thought ids into a persistable request.
        engine?.disablePersistentPrefixCache()
        engine?.dropPrefixCache()
        privateWorkingState = false
        cacheContext = context
        configurePersistentCache()
    }
    private func configurePersistentCache() {
        persistentCacheActive = false
        guard !privateWorkingState, let engine, let directory = cacheContext?.directory else { return }
        // Acceleration is optional: an unwritable/full cache must never
        // prevent a model request. The engine detaches before opening a tier.
        persistentCacheActive = (try? engine.enablePersistentPrefixCache(.init(directory: directory))) != nil
    }
    public func configure(_ preferences: PerformancePreferences) async throws {
        try PerformancePolicy.validate(preferences, on: .current())
        guard !inTurn else { throw SevraError.refused("Memory settings apply after the current response.") }
        if self.preferences.budget != preferences.budget ||
            (preferences.budget == .custom && self.preferences.customGB != preferences.customGB) {
            await unload()
            performanceTelemetry?.update(state: "Model not loaded", detail: "Your new budget applies to the next message.")
        }
        self.preferences = preferences
    }
    public func turn(history: [ChatMessage], tools: [ToolDefinition], cancellation: Cancellation, buffer: TurnBuffer) async throws -> EngineTurn {
        try await turn(history: history, tools: tools, thinking: nil, replyTokens: ReplyPolicy.answerTokens, control: ThinkingControl(), cancellation: cancellation, buffer: buffer)
    }
    public func turn(history: [ChatMessage], tools definitions: [ToolDefinition], thinking requested: ThinkingRequest?, replyTokens requestedReply: Int, control: ThinkingControl, cancellation: Cancellation, buffer: TurnBuffer) async throws -> EngineTurn {
        guard !inTurn else { throw SevraError.refused("The local model is already in use.") }
        inTurn = true
        let started = ProcessInfo.processInfo.systemUptime
        var prepared = false
        var metrics = ResponseMetrics()
        metrics.rounds = 1
        lastStats = []
        defer {
            inTurn = false
            performanceTelemetry?.update(state: self.engine == nil ? "Model not loaded" : "Ready",
                detail: self.engine == nil ? "Loads when you send a message." : "Ready for your next message.", engine: self.engine)
        }
        try cancellation.check()
        if engine == nil {
            performanceTelemetry?.update(state: "Loading", detail: "Preparing the local model.")
            buffer.stage("Verifying the local model")
            // Join the check started ahead; Stop still ends the wait. The
            // proof it leaves belongs to this owner, as one made here would.
            while ahead.running {
                try cancellation.check()
                try await Task.sleep(nanoseconds: 50_000_000)
            }
            let store = WeightStore(modelDirectory: model)
            let verified: Bool
            do {
                verified = try modelVerification.check(files: PinnedModel.files.map { model.appendingPathComponent($0.path) },
                    shouldContinue: { !cancellation.isCancelled }) {
                        try store.status(shouldContinue: { !cancellation.isCancelled }).isReady
                    }
            }
            catch { try cancellation.check(); throw error }
            guard verified else { throw SevraError.unavailable("The local model is missing or incomplete. Set up the model before sending.") }
            try cancellation.check()
            // XNU caches host_statistics64 for a one-second window. A fast
            // verified reload can otherwise size against our already-freed
            // model, disable MTP and invalidate compatible disk checkpoints.
            // Wait only for the remainder of that window; never invent credit
            // for released bytes or override the real availability guard.
            if let releasedAt {
                let remaining = PerformancePolicy.memoryObservationDelay - (ProcessInfo.processInfo.systemUptime - releasedAt)
                if remaining > 0 { try await Task.sleep(nanoseconds: UInt64(remaining * 1e9)) }
                try cancellation.check()
            }
            let machine = Machine.current()
            let plan = try PerformancePolicy.plan(preferences, on: machine, mtpAvailable: MTPWeights.present(modelDir: model),
                decodeLookahead: .environment(modelDirectory: model))
            buffer.stage("Loading the local model")
            engine = try await Engine(modelDir: model, plan: plan)
            try engine?.configureShortPromptPrefill(maxPromptTokens: PerformancePolicy.shortPromptTokens,
                chunk: PerformancePolicy.shortPromptChunk)
            configurePersistentCache()
            if let engine {
                governor = MemoryGovernor(engine: engine)
                governor?.start()
            }
            metrics.loadSeconds = ProcessInfo.processInfo.systemUptime - started
            try cancellation.check()
        }
        guard let engine else { throw SevraError.unavailable("Model is unavailable.") }
        // Also protect direct LocalInference callers that did not supply a
        // fresh ownership context before asking for a thought.
        if requested != nil {
            if persistentCacheActive { engine.disablePersistentPrefixCache(); engine.dropPrefixCache() }
            persistentCacheActive = false; privateWorkingState = true
        }
        performanceTelemetry?.update(state: "In use", detail: "Responding on your Mac.", engine: engine)
        // Time to first token starts here, after any load, which is reported apart.
        let ready = ProcessInfo.processInfo.systemUptime
        var firstToken: Double?
        let request = try engine.beginRequest(connected: { !cancellation.isCancelled })
        // A tool turn thinks too when the person asked for it. The thought
        // runs first, then the same turn may call tools, which is what the
        // template renders. What the thought must not do is take the reply
        // budget a staged proposal needs, so only a plain answer uses the
        // thinking reply cap.
        let thinking = requested
        buffer.stage("Reading the conversation")
        // Spliced: an assistant turn the engine itself produced, thought block
        // included, is re-encoded from its held ids so the prefix state matches.
        let ids = try engine.encodeChatSpliced(history, tools: definitions, thinking: thinking != nil, effort: thinking?.level)
        try cancellation.check()
        let room = engine.maxContextTokens - ids.count - (thinking?.budgetTokens ?? 0)
        let replyTokens = ReplyPolicy.replyTokens(thinking: thinking, requested: requestedReply, tools: !definitions.isEmpty, room: room)
        guard replyTokens >= ReplyPolicy.minimumTokens else { throw SevraError.refused("This request is too large for the current context. Start a new thread or read less of the source at once.") }
        let splitter = ToolCallSplitter(tools: definitions.map(\.schema))
        var calls: [ProposedTool] = []
        var malformed = false
        var text = ""
        var tooLarge = false
        func consume(_ events: [ToolStreamEvent]) {
            for event in events {
                switch event {
                case .text(let part): text += part; if !buffer.append(part) { tooLarge = true }
                case .toolCall(let call): calls.append(ProposedTool(id: call.id, name: call.name, arguments: call.arguments))
                case .malformed: malformed = true
                default: break
                }
            }
        }
        var params = SampleParams.greedy; params.maxTokens = replyTokens
        var receipt: ThinkingReceipt?
        engine.generator.onPrefillProgressAbsolute = { done, total, _, reused in buffer.stage("Reading context: \(done + reused) of \(total + reused) tokens") }
        defer { engine.generator.onPrefillProgressAbsolute = nil }
        func markPrepared() {
            if !prepared {
                prepared = true
                let now = ProcessInfo.processInfo.systemUptime
                performanceTelemetry?.prepared(in: now - started)
                firstToken = now - ready
            }
        }
        let answerToken: (Int, String) -> Bool = { _, delta in
            markPrepared()
            buffer.countAnswerToken()
            buffer.stage("Responding")
            consume(splitter.push(delta)); return !cancellation.isCancelled && !tooLarge
        }
        let result: Engine.GenerationResult
        if let thinking {
            // The template opens the thought block itself. The thought ends at the
            // model's close tag, at the budget, or when the person asks for the
            // answer; in the last two cases the documented closure is appended.
            // Continue the same turn's active state when the sampler changes.
            // The engine owns the pending token and both phases under one gate.
            let closeIDs = engine.tokenizer.encode(text: ThinkingPolicy.closeTag, addSpecialTokens: false)
            guard closeIDs.count == 1, let closeID = closeIDs.first else { throw SevraError.unavailable("This model does not expose a single thinking close token.") }
            var thoughtParams = SampleParams.thinking; thoughtParams.seed = thinking.seed; thoughtParams.maxTokens = thinking.budgetTokens
            var closed = false, answerNow = false, thoughtTokens = 0
            // The clock starts at the first thought token, after prefill, so the
            // receipt and the live counter measure thinking and nothing else.
            buffer.stage("Thinking")
            let phases = try engine.generatePhased(promptIds: ids, first: thoughtParams, second: params, shouldContinue: { !cancellation.isCancelled }, onFirstToken: { tok, delta in
                markPrepared()
                if tok == closeID { closed = true; return false }
                if let tag = delta.range(of: ThinkingPolicy.closeTag) {
                    buffer.appendThought(String(delta[..<tag.lowerBound])); closed = true; return false
                }
                thoughtTokens += 1
                buffer.appendThought(delta)
                if control.answerRequested { answerNow = true; return false }
                return !cancellation.isCancelled && thoughtTokens < thinking.budgetTokens
            }, onSecondToken: answerToken, request: request, transition: { thought in
                let ending: ThinkingReceipt.Ending = cancellation.isCancelled ? .stopped : closed ? .closed : answerNow ? .answerNow : .budget
                buffer.endThinking(ending)
                try cancellation.check()
                if let error = thought.stats.runtimeError { throw SevraError.refused(error) }
                metrics.record(thought.stats, thought: true, first: true)
                lastStats.append(thought.stats)
                let separator = engine.tokenizer.encode(text: "\n\n", addSpecialTokens: false)
                receipt = ThinkingReceipt(level: thinking.level, budgetTokens: thinking.budgetTokens, tokens: thoughtTokens, seconds: buffer.thinkingSeconds, ending: ending)
                // The thought samples so it cannot loop; the answer stays greedy like
                // every other answer in this app, within the same reply cap.
                buffer.stage("Responding")
                return closed ? separator : engine.tokenizer.encode(text: ThinkingPolicy.closure, addSpecialTokens: false) + [closeID] + separator
            })
            result = phases.second
        } else {
            result = engine.generate(promptIds: ids, params: params,
                shouldContinue: { !cancellation.isCancelled && !tooLarge }, onToken: answerToken, request: request)
        }
        consume(splitter.flush())
        try cancellation.check()
        if let error = result.stats.runtimeError { throw SevraError.refused(error) }
        guard !malformed, !tooLarge else { throw SevraError.refused("The model produced an incomplete or oversized response. No proposed actions were executed.") }
        metrics.record(result.stats, thought: false, first: thinking == nil)
        lastStats.append(result.stats)
        metrics.firstTokenSeconds = firstToken
        metrics.windowTokens = engine.maxContextTokens
        // The current budget can be lower than the saved ceiling under contention.
        let memoryPlan = engine.currentPlan
        metrics.budgetGB = memoryPlan.map { $0.targetGB ?? $0.expectedPeakGB }
        metrics.memoryLimitGB = memoryPlan?.memoryLimitGB
        metrics.customBudget = preferences.budget == .custom
        var turn = EngineTurn(text: text, calls: calls, finishReason: result.stats.finishReason, metrics: metrics)
        turn.thinking = receipt
        try turn.validateCompletion()
        return turn
    }
    /// Checks the pinned model files now, so the first message after launch
    /// does not wait for the whole hash. It runs at utility priority, reads
    /// in bounded chunks and loads nothing. Skipped in Low Power Mode, when
    /// the model is loaded, or when the files are not all present.
    public func prepareAhead() async {
        guard engine == nil, !inTurn, !ProcessInfo.processInfo.isLowPowerModeEnabled,
              WeightStore.remainingBytes(at: model) == 0, ahead.begin() else { return }
        let cache = modelVerification, model = model, ahead = ahead
        let files = PinnedModel.files.map { model.appendingPathComponent($0.path) }
        DispatchQueue.global(qos: .utility).async {
            let store = WeightStore(modelDirectory: model)
            _ = try? cache.check(files: files, shouldContinue: { !ahead.cancelled }) {
                try store.status(shouldContinue: { !ahead.cancelled }).isReady
            }
            ahead.end()
        }
    }
    /// After a private reply: the conversation's prompt state and the
    /// allocator's reusable buffers go; the weights stay loaded, so the next
    /// reply does not reload the model. Nothing private was written to disk.
    public func releasePrivateState() async {
        while inTurn { try? await Task.sleep(nanoseconds: 20_000_000) }
        guard let engine else { return }
        engine.disablePersistentPrefixCache()
        engine.dropPrefixCache()
        engine.withExclusive { Engine.releaseUnusedMemory() }
        persistentCacheActive = false
        privateWorkingState = false
        // The next turn sets up its own context from scratch.
        cacheContext = nil
    }
    public func unload() async {
        // A check running ahead stops; model setup may be changing the files.
        ahead.cancel()
        while inTurn { try? await Task.sleep(nanoseconds: 20_000_000) }
        let wasLoaded = engine != nil
        performanceTelemetry?.update(state: "Releasing memory", detail: "Returning model memory to your Mac.")
        await governor?.stopAndWait(); governor = nil
        autoreleasepool {
            engine?.dropPrefixCache(); engine = nil
            persistentCacheActive = false
            privateWorkingState = false
            Engine.releaseUnusedMemory()
        }
        if wasLoaded { releasedAt = ProcessInfo.processInfo.systemUptime }
        performanceTelemetry?.update(state: "Model not loaded", detail: "Loads when you send a message.")
    }
}

/// A file check running ahead of the first message. At most one runs.
final class VerificationAhead: @unchecked Sendable {
    private let lock = NSLock()
    private var state = (running: false, cancelled: false)
    var running: Bool { lock.withLock { state.running } }
    var cancelled: Bool { lock.withLock { state.cancelled } }
    /// False when a check is already running.
    func begin() -> Bool { lock.withLock { guard !state.running else { return false }; state = (true, false); return true } }
    func end() { lock.withLock { state.running = false } }
    func cancel() { lock.withLock { if state.running { state.cancelled = true } } }
}

/// Explicit test dependency. Production never silently falls back to it.
public actor ScriptedInference: Inference {
    public nonisolated let simulated = true
    private var turns: [EngineTurn]
    private var traces: [String]
    private let delay: UInt64
    public private(set) var calls = 0
    public private(set) var observedContexts: [[ChatMessage]] = []
    public private(set) var observedThinking: [ThinkingRequest?] = []
    public private(set) var observedReplyTokens: [Int] = []
    public private(set) var observedCacheContexts: [InferenceCacheContext] = []
    public func prepareCache(_ context: InferenceCacheContext) async throws { observedCacheContexts.append(context) }
    public private(set) var observedTools: [[String]] = []
    public init(turns: [EngineTurn], delayNanoseconds: UInt64 = 0, thinkingTraces: [String] = []) { self.turns = turns; delay = delayNanoseconds; traces = thinkingTraces }
    public func turn(history: [ChatMessage], tools: [ToolDefinition], cancellation: Cancellation, buffer: TurnBuffer) async throws -> EngineTurn {
        try await turn(history: history, tools: tools, thinking: nil, replyTokens: ReplyPolicy.answerTokens, control: ThinkingControl(), cancellation: cancellation, buffer: buffer)
    }
    public func turn(history: [ChatMessage], tools: [ToolDefinition], thinking requested: ThinkingRequest?, replyTokens: Int, control: ThinkingControl, cancellation: Cancellation, buffer: TurnBuffer) async throws -> EngineTurn {
        calls += 1
        observedContexts.append(history)
        observedTools.append(tools.map(\.name))
        let thinking = requested
        observedThinking.append(thinking)
        observedReplyTokens.append(replyTokens)
        guard !turns.isEmpty else { throw SevraError.unavailable("The scripted test has no further responses.") }
        var turn = turns.removeFirst()
        // Measured like the real engine, with one scripted word or character
        // standing for one token. A turn may also carry exact numbers.
        let begun = ProcessInfo.processInfo.systemUptime
        var measured = ResponseMetrics()
        measured.rounds = 1
        if let thinking {
            // One scripted word stands for one thought token.
            let trace = traces.isEmpty ? "Scripted reasoning." : traces.removeFirst()
            var tokens = 0
            var ending = ThinkingReceipt.Ending.closed
            buffer.beginThinking(); buffer.stage("Thinking")
            let thoughtStart = ProcessInfo.processInfo.systemUptime
            for word in trace.split(separator: " ") {
                try cancellation.check()
                if delay > 0 { try await Task.sleep(nanoseconds: delay) }
                if measured.firstTokenSeconds == nil { measured.firstTokenSeconds = ProcessInfo.processInfo.systemUptime - begun }
                buffer.appendThought(String(word) + " "); tokens += 1
                if control.answerRequested { ending = .answerNow; break }
                if tokens >= thinking.budgetTokens { ending = .budget; break }
            }
            buffer.endThinking(ending)
            measured.thoughtTokens = tokens; measured.thoughtSeconds = ProcessInfo.processInfo.systemUptime - thoughtStart
            turn.thinking = ThinkingReceipt(level: thinking.level, budgetTokens: thinking.budgetTokens, tokens: tokens, seconds: buffer.thinkingSeconds, ending: ending)
        }
        let answerStart = ProcessInfo.processInfo.systemUptime
        for character in turn.text {
            try cancellation.check()
            if delay > 0 { try await Task.sleep(nanoseconds: delay) }
            if measured.firstTokenSeconds == nil { measured.firstTokenSeconds = ProcessInfo.processInfo.systemUptime - begun }
            buffer.countAnswerToken()
            _ = buffer.append(String(character)); buffer.stage("Simulated response")
        }
        measured.answerTokens = turn.text.count; measured.answerSeconds = ProcessInfo.processInfo.systemUptime - answerStart
        if turn.metrics == nil { turn.metrics = measured }
        try cancellation.check(); return turn
    }
    public func unload() {}
}
