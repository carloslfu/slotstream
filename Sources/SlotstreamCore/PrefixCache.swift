// Conversation prefix cache: reuse of one generation's model state by the next
// request, when the next prompt extends the one that produced it.
//
// Why this exists. `Generator.generate` used to call `model.makeState()` on
// every request, so a chat re-prefilled its entire history every turn. At the
// measured 92 tok/s that is ~9 s of dead air at turn 2 (~800 tokens), ~33 s at
// turn 5, ~65 s at turn 10 — by which point prefill is most of the wait for a
// 500-token reply, and all of it is recomputing tokens the previous turn
// already processed. Agentic and tool-loop use, many short turns over one long
// identical prefix, is both the worst case and the use that most justifies a
// local model.
//
// Extend-only, never rewind. A pure-attention runner can slice a KV cache to
// any prefix. This model cannot: `LinearCache` holds the GDN recurrent state,
// which is a fold over every token seen and has no inverse, and `ngramCtx`
// is likewise carried forward. So the state is reusable only when the new
// prompt *extends* exactly the ids that produced it; anything else — an edited
// earlier message, a different conversation, a regenerate with a shorter
// prompt — is a full rebuild. That covers the dominant chat and tool-loop
// shape and fails safe for the rest.
//
// Memory. A held state is ~27 KiB per token (KV + indexer) plus ~113 MB of
// fixed GDN recurrent state. Several conversations are genuinely additive.
// A miss evicts enough LRU entries before the caller allocates its state that
// retained + active states never exceed maxEntries and their token capacities
// share one budget. The governor sheds them before shrinking the pool.

import Foundation

/// A bounded set of reusable conversation states plus the exact ids that
/// produced them. Not a general KV cache: every entry matches by exact prefix.
///
/// Entries are shared by every client, which is safe for a reason worth stating
/// rather than rediscovering: a match requires the incoming prompt to *begin
/// with the entire held id sequence*, so a client can only ever reuse state
/// whose full content it just supplied itself. There is nothing to learn from a
/// hit that the requester did not already send.
///
/// A repeated identical prompt deliberately does **not** hit: the held sequence
/// includes the previous reply and is therefore longer, so the match fails and
/// the request rebuilds. Asking the same question twice keeps giving the same
/// answer.
public final class PrefixCache {
    /// KV + indexer per token. The same figure the context-limit message and
    /// the planner quote; measured in MEASUREMENTS.md.
    public static let bytesPerToken = 27_648

    /// 36 linear-attention layers × 48 value heads × 128 × 128 float32.
    public static let fixedBytesPerEntry = 36 * 48 * 128 * 128 * 4

    /// How many conversations may be held at once.
    ///
    /// **This is not one for a measured reason.** A single slot was defeated by
    /// the first real client it met: Open WebUI fires a title-generation
    /// request straight after each chat turn, with a completely different
    /// prompt, so by the time the user's next turn arrives the one slot holds
    /// the title prompt and the conversation has been evicted. Measured through
    /// its UI: 0 hits, 7 misses across a two-turn chat. Any client with
    /// auxiliary requests — title, tags, follow-up suggestions, embeddings —
    /// behaves the same way, so a one-slot cache is a cache that only works in
    /// benchmarks.
    public static let maxEntries = 4

    private struct Entry {
        var state: Qwen4ExpModel.State
        var tokens: [Int]
        var used: Int
    }

    private let lock = NSLock()
    private var entries: [Entry] = []
    private var clock = 0

    /// Ceiling on tokens held across *all* entries, so several conversations
    /// share one budget rather than each reserving the maximum. One long chat
    /// may still use the whole allowance.
    private var _maxTokens: Int
    private var _enabled: Bool

    public var maxTokens: Int {
        get { lock.withLock { _maxTokens } }
        set { configure(maxTokens: newValue) }
    }
    public var enabled: Bool {
        get { lock.withLock { _enabled } }
        set {
            lock.withLock {
                _enabled = newValue
                if !newValue { _evictions += entries.count; entries.removeAll() }
            }
        }
    }

    private var _hits = 0
    private var _misses = 0
    private var _evictions = 0
    public var hits: Int { lock.withLock { _hits } }
    public var misses: Int { lock.withLock { _misses } }
    public var evictions: Int { lock.withLock { _evictions } }

    public init(maxTokens: Int, enabled: Bool = true) {
        self._maxTokens = max(0, maxTokens)
        self._enabled = enabled
    }

    public var heldTokens: Int {
        lock.lock(); defer { lock.unlock() }
        return entries.reduce(0) { $0 + $1.tokens.count }
    }

    public var heldGB: Double {
        lock.withLock {
            let bytes = entries.reduce(0) { $0 + $1.tokens.count } * Self.bytesPerToken
                + entries.count * Self.fixedBytesPerEntry
            return Double(bytes) / 1e9
        }
    }

    /// Take ownership of a state that `promptIds` extends, or nil.
    ///
    /// The *longest* matching prefix wins, so a follow-up turn resumes the
    /// deepest state available rather than an older, shorter one. A hit removes
    /// that entry (the caller now owns the state and will hand it back with the
    /// ids it consumed); a miss leaves the others alone — evicting them would
    /// reintroduce exactly the single-slot failure described above.
    public func take(
        matching promptIds: [Int], reserveTokens: Int? = nil
    ) -> (state: Qwen4ExpModel.State, reused: Int)? {
        lock.lock()
        defer { lock.unlock() }
        guard _enabled else { entries.removeAll(); return nil }
        // Strictly greater: at least one new token must remain to produce
        // logits from, and the state cannot be rewound to yield them.
        var best: Int?
        for (i, e) in entries.enumerated()
        where promptIds.count > e.tokens.count && promptIds.starts(with: e.tokens) {
            if best == nil || e.tokens.count > entries[best!].tokens.count { best = i }
        }
        guard let i = best else {
            _misses += 1
            // The caller is about to allocate a new state. Make room first so
            // four retained states plus a fifth active state never coexist.
            let reserve = max(promptIds.count, reserveTokens ?? promptIds.count)
            while !entries.isEmpty
                && (entries.count >= Self.maxEntries
                    || entries.reduce(0, { $0 + $1.tokens.count }) + reserve > _maxTokens)
            {
                evictLRU()
            }
            return nil
        }
        let e = entries.remove(at: i)
        _hits += 1
        return (e.state, e.tokens.count)
    }

    /// Retain `state` as the consumer of exactly `tokens`, evicting
    /// least-recently-used entries until the shared budget fits.
    public func store(state s: Qwen4ExpModel.State, tokens t: [Int]) {
        lock.lock()
        defer { lock.unlock() }
        guard _enabled, !t.isEmpty, t.count <= _maxTokens else { return }
        clock += 1
        entries.append(Entry(state: s, tokens: t, used: clock))
        while entries.count > Self.maxEntries
            || entries.reduce(0, { $0 + $1.tokens.count }) > _maxTokens
        {
            guard !entries.isEmpty else { break }
            evictLRU()
        }
    }

    private func evictLRU() {
        guard let lru = entries.enumerated().min(by: { $0.element.used < $1.element.used })?.offset
        else { return }
        entries.remove(at: lru)
        _evictions += 1
    }

    /// Apply a smaller live plan immediately, evicting until it is true.
    public func configure(maxTokens: Int) {
        lock.withLock {
            _maxTokens = max(0, maxTokens)
            while entries.reduce(0, { $0 + $1.tokens.count }) > _maxTokens {
                evictLRU()
            }
        }
    }

    /// Release everything held. Used by the governor when memory tightens and
    /// by `--no-prefix-cache`.
    public func drop() {
        lock.lock()
        defer { lock.unlock() }
        _evictions += entries.count
        entries.removeAll()
    }

    public func resetStats() {
        lock.lock()
        defer { lock.unlock() }
        _hits = 0
        _misses = 0
        _evictions = 0
    }

    public func json() -> [String: Any] {
        lock.lock()
        let held = entries.reduce(0) { $0 + $1.tokens.count }
        let n = entries.count
        let (h, m, e, enabled, maxTokens) =
            (_hits, _misses, _evictions, _enabled, _maxTokens)
        lock.unlock()
        return [
            "enabled": enabled,
            "conversations": n,
            "max_conversations": Self.maxEntries,
            "held_tokens": held,
            "held_gb": (Double(
                held * Self.bytesPerToken + n * Self.fixedBytesPerEntry) / 1e9 * 100).rounded() / 100,
            "max_tokens": maxTokens,
            "hits": h,
            "misses": m,
            "evictions": e,
        ]
    }
}
