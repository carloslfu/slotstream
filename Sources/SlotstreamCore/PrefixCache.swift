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
// Memory. A held state is ~27 KiB per token (KV + indexer). Peak process
// memory is unchanged by caching, because a miss evicts before the caller
// allocates the replacement, so exactly one state is ever live — the same one
// that existed transiently before. What rises is the *idle* floor between
// requests, which is why retention is capped from the memory plan and why the
// governor sheds this before it shrinks the pool.

import Foundation

/// One conversation's worth of reusable model state, plus the exact ids that
/// produced it. Not a general KV cache: a single slot, matched by exact prefix.
///
/// One slot is shared by every client, which is safe for a reason worth stating
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
    public var maxTokens: Int
    public var enabled: Bool

    public private(set) var hits = 0
    public private(set) var misses = 0
    public private(set) var evictions = 0

    public init(maxTokens: Int, enabled: Bool = true) {
        self.maxTokens = maxTokens
        self.enabled = enabled
    }

    public var heldTokens: Int {
        lock.lock(); defer { lock.unlock() }
        return entries.reduce(0) { $0 + $1.tokens.count }
    }

    public var heldGB: Double {
        Double(heldTokens) * Double(Self.bytesPerToken) / 1e9
    }

    /// Take ownership of a state that `promptIds` extends, or nil.
    ///
    /// The *longest* matching prefix wins, so a follow-up turn resumes the
    /// deepest state available rather than an older, shorter one. A hit removes
    /// that entry (the caller now owns the state and will hand it back with the
    /// ids it consumed); a miss leaves the others alone — evicting them would
    /// reintroduce exactly the single-slot failure described above.
    public func take(matching promptIds: [Int]) -> (state: Qwen4ExpModel.State, reused: Int)? {
        lock.lock()
        defer { lock.unlock() }
        guard enabled else { entries.removeAll(); return nil }
        // Strictly greater: at least one new token must remain to produce
        // logits from, and the state cannot be rewound to yield them.
        var best: Int?
        for (i, e) in entries.enumerated()
        where promptIds.count > e.tokens.count && promptIds.starts(with: e.tokens) {
            if best == nil || e.tokens.count > entries[best!].tokens.count { best = i }
        }
        guard let i = best else {
            misses += 1
            return nil
        }
        let e = entries.remove(at: i)
        hits += 1
        return (e.state, e.tokens.count)
    }

    /// Retain `state` as the consumer of exactly `tokens`, evicting
    /// least-recently-used entries until the shared budget fits.
    public func store(state s: Qwen4ExpModel.State, tokens t: [Int]) {
        lock.lock()
        defer { lock.unlock() }
        guard enabled, !t.isEmpty, t.count <= maxTokens else { return }
        clock += 1
        entries.append(Entry(state: s, tokens: t, used: clock))
        while entries.count > Self.maxEntries
            || entries.reduce(0, { $0 + $1.tokens.count }) > maxTokens
        {
            guard let lru = entries.enumerated().min(by: { $0.element.used < $1.element.used })?.offset
            else { break }
            entries.remove(at: lru)
            evictions += 1
        }
    }

    /// Release everything held. Used by the governor when memory tightens and
    /// by `--no-prefix-cache`.
    public func drop() {
        lock.lock()
        defer { lock.unlock() }
        evictions += entries.count
        entries.removeAll()
    }

    public func resetStats() {
        lock.lock()
        defer { lock.unlock() }
        hits = 0
        misses = 0
        evictions = 0
    }

    public func json() -> [String: Any] {
        lock.lock()
        let held = entries.reduce(0) { $0 + $1.tokens.count }
        let n = entries.count
        let (h, m, e) = (hits, misses, evictions)
        lock.unlock()
        return [
            "enabled": enabled,
            "conversations": n,
            "max_conversations": Self.maxEntries,
            "held_tokens": held,
            "held_gb": (Double(held) * Double(Self.bytesPerToken) / 1e9 * 100).rounded() / 100,
            "max_tokens": maxTokens,
            "hits": h,
            "misses": m,
            "evictions": e,
        ]
    }
}
