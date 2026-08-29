// High-level engine: model + tokenizer + chat templating, shared by CLI/server.

import Foundation
import MLX
import Tokenizers

public struct ChatMessage {
    public var role: String
    public var content: String
    public init(role: String, content: String) {
        self.role = role
        self.content = content
    }
}

public final class Engine {
    public let modelDir: URL
    public let model: Qwen4ExpModel
    public let generator: Generator
    public let tokenizer: any Tokenizers.Tokenizer
    public let eosIds: Set<Int>
    public let modelName: String
    /// Longest prompt accepted. Unbounded prompts are not free: KV plus indexer
    /// state costs ~27 KiB per token beyond the announced memory plan, and
    /// prefill runs at tens of tokens a second, so a huge prompt is a long,
    /// memory-growing stall rather than a fast failure.
    public var maxContextTokens = 32_768

    /// nil when `promptTokens` fits, otherwise the message to return to the client.
    public func contextError(promptTokens: Int) -> String? {
        guard promptTokens > maxContextTokens else { return nil }
        return "prompt is \(promptTokens) tokens, over this server's limit of "
            + "\(maxContextTokens) (raise it with --max-context, at ~27 KiB of "
            + "extra memory per token and tens of seconds of prefill per 1k tokens)"
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

    public convenience init(modelDir: URL, plan: MemoryPlan) async throws {
        try await self.init(modelDir: modelDir, poolSlots: plan.slots, plan: plan)
    }

    public init(modelDir: URL, poolSlots: Int, plan: MemoryPlan? = nil) async throws {
        self.modelDir = modelDir
        self._plan = plan
        // MLX's allocator otherwise retains freed transients (KV caches,
        // activations) in an unbounded internal cache — measured ~5 GB of RSS
        // above the memory plan after a few dozen requests. 2 GB keeps
        // per-token reallocation churn away while making real process memory
        // track the announced plan.
        MLX.GPU.set(cacheLimit: 2 << 30)
        self.modelName = "qwen3.8-flash-next:4bit"
        let t0 = Date()
        let index = try CheckpointIndex(dir: modelDir)
        self.model = try Qwen4ExpModel(index: index, poolSlots: poolSlots)
        model.validate()
        self.generator = Generator(model: model)
        if let p = plan, ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CHUNK"] == nil {
            generator.prefillChunk = p.prefillChunk
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
        let banner = "engine ready in \(String(format: "%.1f", -t0.timeIntervalSinceNow))s: "
            + "expert cache ~\(String(format: "%.0f", model.pool.slotsPerLayer))/\(model.cfg.numExperts) per layer "
            + "(\(model.pool.slots) global slots = \(String(format: "%.1f", Double(model.pool.poolBytes) / 1e9)) GB), "
            + "eos \(eos.sorted())\n"
        FileHandle.standardError.write(banner.data(using: .utf8)!)
    }

    public func encodeChat(_ messages: [ChatMessage], thinking: Bool) throws -> [Int] {
        let msgs: [[String: String]] = messages.map { ["role": $0.role, "content": $0.content] }
        return try tokenizer.applyChatTemplate(
            messages: msgs, tools: nil,
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
    /// Incremental detokenization keeps all of this generation's ids and diffs
    /// the decoded text against what has already been sent. Three rules matter:
    ///
    /// - The id list is never cleared mid-generation. Clearing it whenever
    ///   nothing had been emitted yet — exactly the state a response opening
    ///   with an emoji is in while it waits for the token that completes the
    ///   character — discarded those tokens and corrupted the start of the reply.
    /// - The diff is by Unicode scalar, never by Character. A later token can
    ///   contribute a scalar that merges into the grapheme cluster already sent
    ///   (an emoji plus U+FE0F is still one Character), and a grapheme-count
    ///   diff reports no new text and silently drops it.
    /// - While stop sequences are active, the last `maxStopLength - 1` scalars
    ///   are withheld, so the prefix of a stop sequence that straddles a token
    ///   boundary is never emitted before the rest of it arrives. Whatever is
    ///   still held back is flushed once generation ends.
    ///
    /// The invariant the tests hold this to: concatenating every streamed delta
    /// reproduces the non-streamed text exactly.
    public func generate(
        promptIds: [Int], params: SampleParams,
        onToken: ((Int, String) -> Bool)? = nil
    ) -> (text: String, ids: [Int], stats: GenStats) {
        lock.lock()
        defer { lock.unlock() }
        let params = params.sanitized()
        let stops = params.stop
        let holdBack = stops.isEmpty
            ? 0 : max(0, (stops.map { $0.unicodeScalars.count }.max() ?? 1) - 1)
        var streamIds: [Int] = []
        var sent = ""  // text already handed to the callback
        var lastTok = -1
        var clientGone = false

        /// Emit everything in `target` past what has already been sent.
        func emit(_ target: String, _ tok: Int) -> Bool {
            let vs = target.unicodeScalars
            let ss = sent.unicodeScalars
            guard vs.count >= ss.count, vs.starts(with: ss) else {
                // Detokenization revised text already sent (rare: byte-level BPE
                // decoding is monotone). Resync rather than desync forever.
                sent = target
                return true
            }
            let delta = String(String.UnicodeScalarView(vs.dropFirst(ss.count)))
            sent = target
            if delta.isEmpty { return true }
            guard let cb = onToken else { return true }
            return cb(tok, delta)
        }

        let (ids, stats) = generator.generate(
            promptIds: promptIds, params: params, eosIds: eosIds
        ) { [weak self] tok in
            guard let self else { return false }
            // Nothing to detokenize for: skip the decode entirely.
            if onToken == nil, stops.isEmpty { return true }
            lastTok = tok
            streamIds.append(tok)
            var visible = self.tokenizer.decode(tokens: streamIds, skipSpecialTokens: true)
            // A character whose UTF-8 spans several tokens is undecodable until
            // the last of them lands; hold it rather than emitting U+FFFD.
            while visible.hasSuffix("\u{FFFD}") { visible = String(visible.dropLast()) }
            if !stops.isEmpty, let cut = Self.stopIndex(visible, stops) {
                _ = emit(String(visible[visible.startIndex ..< cut]), tok)
                return false
            }
            let vs = visible.unicodeScalars
            let safe = String(String.UnicodeScalarView(vs.prefix(max(0, vs.count - holdBack))))
            if !emit(safe, tok) {
                clientGone = true
                return false
            }
            return true
        }

        var text = tokenizer.decode(tokens: ids, skipSpecialTokens: true)
        if !stops.isEmpty, let cut = Self.stopIndex(text, stops) {
            text = String(text[text.startIndex ..< cut])
        }
        // Flush the withheld tail (and any character held back for decoding) so
        // the stream and the returned text agree exactly.
        if !clientGone, onToken != nil, sent != text { _ = emit(text, lastTok) }
        return (text, ids, stats)
    }
}
