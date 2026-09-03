// High-level engine: model + tokenizer + chat templating, shared by CLI/server.

import Foundation
import MLX
import Tokenizers

public struct ChatMessage {
    public var role: String
    public var content: String
    /// OpenAI-style function tool calls attached to an assistant message, e.g.
    /// [{"function": {"name": ..., "arguments": {"k": v}}}]. The chat template
    /// renders these back into the model's <tool_call> XML shape.
    public var toolCalls: [[String: Any]]?
    /// role=tool messages: the id of the tool call this result answers.
    public var toolCallId: String?
    public init(
        role: String, content: String,
        toolCalls: [[String: Any]]? = nil, toolCallId: String? = nil
    ) {
        self.role = role
        self.content = content
        self.toolCalls = toolCalls
        self.toolCallId = toolCallId
    }
}

public final class Engine {
    public let modelDir: URL
    public let model: Qwen4ExpModel
    public let generator: Generator
    public let tokenizer: any Tokenizers.Tokenizer
    public let eosIds: Set<Int>
    public let modelName: String
    /// Longest prompt accepted, at most `ContextPolicy.maxTokens` (the largest
    /// context that has been measured, see Context.swift). Unbounded prompts
    /// are not free: KV plus indexer state costs ~27 KiB per token, and a
    /// prompt is read in full before the first token, so a huge prompt is a
    /// long, memory-growing stall rather than a fast failure.
    public var maxContextTokens = ContextPolicy.maxTokens {
        didSet {
            let capped = min(prefixCache.maxTokens, maxContextTokens)
            prefixCache.configure(maxTokens: capped)
            // Keep /api/show's memory plan aligned with the allocation control
            // that actually changed; otherwise --max-context 1024 reported the
            // startup cache ceiling even though it had already been reduced.
            if let p = currentPlan, p.prefixCacheTokens != capped || p.maxContextTokens != maxContextTokens {
                updatePlan(MemoryPlan(
                    source: p.source, slots: p.slots, targetGB: p.targetGB,
                    ramGB: p.ramGB, workingSetGB: p.workingSetGB,
                    ramPercent: p.ramPercent, availableGB: p.availableGB,
                    clamped: p.clamped, prefillChunk: p.prefillChunk,
                    prefixCacheTokens: capped, mtpEnabled: p.mtpEnabled,
                    maxContextTokens: maxContextTokens, notes: p.notes))
            }
        }
    }

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
        guard promptTokens > maxContextTokens else { return nil }
        let wait = PrefillSchedule.describe(seconds: PrefillSchedule.estSeconds(
            tokens: promptTokens, maxChunk: generator.prefillChunk))
        let ceiling = maxContextTokens < ContextPolicy.maxTokens
            ? "this server was started with --max-context \(maxContextTokens); "
                + "the ceiling is \(ContextPolicy.maxTokens)"
            : "\(ContextPolicy.maxTokens) is the largest context slotstream has measured, "
                + "not a memory limit (context state costs ~27 KiB per token)"
        return "prompt is \(promptTokens) tokens, over this server's limit of "
            + "\(maxContextTokens) for prompt plus reply. \(ceiling). Reading a prompt "
            + "this long would take ~\(wait) before the first token here. Send less, or "
            + "split the material across turns of one conversation so each follow-up "
            + "reads only what is new."
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

    private let lock = NSLock()

    /// Run `body` with the generation lock held — the governor uses this to
    /// resize the pool strictly between requests.
    public func withExclusive<T>(_ body: () throws -> T) rethrows -> T {
        lock.lock()
        defer { lock.unlock() }
        return try body()
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
        self.modelDir = modelDir
        self._plan = plan
        // Sized from the same budget as the pool; SLOTSTREAM_PREFIX_CACHE=0
        // (or --no-prefix-cache) pins it off for parity work.
        let env = ProcessInfo.processInfo.environment["SLOTSTREAM_PREFIX_CACHE"]
        self.prefixCache = PrefixCache(
            maxTokens: plan?.prefixCacheTokens
                ?? Planner.prefixCacheTokensFor(poolBudgetGB: Geometry.gb(poolSlots)),
            enabled: env != "0")
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
        try model.validate()
        if plan?.mtpEnabled == true {
            try model.enableMTP(modelDir: modelDir)
        }
        self.generator = Generator(model: model)
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
        let banner = "engine ready in \(String(format: "%.1f", -t0.timeIntervalSinceNow))s: "
            + "expert cache ~\(String(format: "%.0f", model.pool.slotsPerLayer))/\(model.cfg.numExperts) per layer "
            + "(\(model.pool.slots) global slots = \(String(format: "%.1f", Double(model.pool.poolBytes) / 1e9)) GB), "
            + (model.mtpHead != nil ? "mtp draft head on, " : "")
            + "eos \(eos.sorted())\n"
        FileHandle.standardError.write(banner.data(using: .utf8)!)
    }

    public func encodeChat(
        _ messages: [ChatMessage], thinking: Bool, tools: [[String: Any]]? = nil
    ) throws -> [Int] {
        let msgs: [Message] = messages.map { m in
            var d: [String: any Sendable] = ["role": m.role, "content": m.content]
            if let tc = m.toolCalls {
                d["tool_calls"] = tc.map { Self.sendableDict($0) }
            }
            if let id = m.toolCallId {
                d["tool_call_id"] = id
            }
            return d
        }
        return try tokenizer.applyChatTemplate(
            messages: msgs,
            tools: tools?.map { Self.sendableDict($0) },
            additionalContext: ["enable_thinking": thinking])
    }

    /// Deep-convert JSON-ish [String: Any] into [String: any Sendable] so the
    /// chat template can see tool schemas and tool_calls verbatim.
    private static func sendableDict(_ d: [String: Any]) -> [String: any Sendable] {
        var out: [String: any Sendable] = [:]
        for (k, v) in d { out[k] = sendableValue(v) }
        return out
    }

    private static func sendableValue(_ v: Any) -> any Sendable {
        switch v {
        case let s as String: return s
        case let i as Int: return i
        case let d as Double: return d
        case let b as Bool: return b
        case let arr as [Any]: return arr.map { sendableValue($0) }
        case let dict as [String: Any]:
            var out: [String: any Sendable] = [:]
            for (k, val) in dict { out[k] = sendableValue(val) }
            return out
        default: return String(describing: v)
        }
    }

    /// Render a template without constructing the multi-GB model. Installer
    /// and API acceptance checks run this while a server is already live; the
    /// old implementation built a second Engine merely to load the tokenizer,
    /// so the singleton guard correctly rejected the check it was meant to run.
    public static func encodeChatWithoutModel(
        modelDir: URL, messages: [ChatMessage], thinking: Bool,
        tools: [[String: Any]]? = nil
    ) async throws -> [Int] {
        let tokenizer = try await AutoTokenizer.from(modelFolder: modelDir)
        let msgs: [Message] = messages.map { m in
            var d: [String: any Sendable] = ["role": m.role, "content": m.content]
            if let tc = m.toolCalls {
                d["tool_calls"] = tc.map { sendableDict($0) }
            }
            if let id = m.toolCallId {
                d["tool_call_id"] = id
            }
            return d
        }
        return try tokenizer.applyChatTemplate(
            messages: msgs,
            tools: tools?.map { sendableDict($0) },
            additionalContext: ["enable_thinking": thinking])
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
        promptIds: [Int], params: SampleParams,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int, String) -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        lock.lock()
        defer { lock.unlock() }
        var params = params.sanitized()
        let room = max(0, maxContextTokens - promptIds.count)
        if room == 0 {
            var stats = GenStats()
            stats.promptTokens = promptIds.count
            stats.finishReason = "length"
            stats.peakMemoryGB = ProcessMemory.peakResidentGB
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

        func emit(_ delta: String, _ tok: Int) -> Bool {
            if delta.isEmpty { return true }
            delivered += delta
            guard let cb = onToken else { return true }
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
            lastTok = tok
            pendingIds.append(tok)
            let ok = flushStablePrefix(tok)
            if !ok, !stopFound { clientGone = true }
            return ok
        } : nil

        let (ids, stats) = generator.generate(
            promptIds: promptIds, params: params, eosIds: eosIds, cache: prefixCache,
            shouldContinue: {
                guard !clientGone, !stopFound else { return false }
                return shouldContinue?() ?? true
            }, onToken: tokenHandler)

        var text = tokenizer.decode(tokens: ids, skipSpecialTokens: true)
        if !stops.isEmpty, let cut = Self.stopIndex(text, stops) {
            text = String(text[text.startIndex ..< cut])
        }
        // The one full decode is both the non-streamed result and an exact final
        // reconciliation for the bounded incremental decoder.
        if !clientGone, onToken != nil {
            let target = text.unicodeScalars
            let sent = delivered.unicodeScalars
            if target.count >= sent.count, target.starts(with: sent) {
                _ = emit(String(String.UnicodeScalarView(target.dropFirst(sent.count))), lastTok)
            }
        }
        return (text, ids, stats)
    }
}
