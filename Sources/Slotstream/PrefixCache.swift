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
// Images. Token ids alone are not a sufficient key for a vision prompt: the
// template expands each image into a run of the *same* placeholder id, so two
// different pictures that resize to the same grid produce byte-identical ids.
// Matching on ids alone would hand a follow-up turn a state built from the
// wrong pixels. An entry therefore also carries an `ImageSegment` per image —
// where its run starts and a digest of the bytes that produced it — and a
// match requires the segments to agree as well as the ids. That is what makes
// a vision conversation cacheable at all; before it, every image request
// re-prefilled its whole prompt and re-ran the tower on every turn.
//
// Memory. A held state is ~27 KiB per token (KV + indexer) plus ~113 MB of
// fixed GDN recurrent state. Several conversations are genuinely additive.
// A miss evicts enough LRU entries before the caller allocates its state that
// retained + active states never exceed maxEntries and their token capacities
// share one budget. The governor sheds them before shrinking the pool.

import Foundation
import MLX

/// Sampling settings are deliberately absent: cached logits precede sampling.
/// Computation settings and model identity prevent reuse across a changed
/// numerical path or a different loaded model. No persistent cache is implied.
package struct PromptCheckpointKey: Equatable {
    // One version for direct generation and Engine requests. Long-context
    // qualification selects the same bounded arithmetic family; it is not a
    // separate cache identity. Retained logits never cross arithmetic epochs.
    package static let currentContextArithmetic = 1
    package let model: UUID
    package let optimizations: InferenceOptimizations
    package let prefillChunk: Int
    package let mtp: Bool
    package let contextArithmetic: Int
    package init(model: UUID, optimizations: InferenceOptimizations, prefillChunk: Int, mtp: Bool,
                 contextArithmetic: Int = PromptCheckpointKey.currentContextArithmetic) {
        self.model = model; self.optimizations = optimizations
        self.prefillChunk = prefillChunk; self.mtp = mtp; self.contextArithmetic = contextArithmetic
    }
}

/// Which retained states one request may resume from, when the engine has to
/// reproduce what reading the whole prompt computes.
///
/// The arithmetic depends on how tokens were grouped into passes and on
/// whether each one was read or generated: a 256-row pass sums a row in a
/// different order from a one-row decode step, and top-10 expert routing turns
/// that difference into different experts. So the state a previous turn left
/// behind, its prompt read in passes and then its reply decoded a token at a
/// time, is not the state this turn would have built by reading the same ids,
/// and continuing from it can change a token. Measured on a 1,430-token agent
/// turn (2026-09-17): a fresh read scored `>` at 0.9576 and `]` at 0.0421 for
/// one position of tool-call syntax, and the cached continuation inverted
/// them, so the model's first call arrived malformed and the host had to ask
/// again.
///
/// `boundaries` are this prompt's own prefill pass boundaries (see
/// `PrefillSchedule.resumeBoundaries`). A state of exactly that length, whose
/// every token was read in those same passes, is the state this request would
/// have held at that point anyway, so resuming from it and resuming from
/// nothing compute the same logits. `key` rejects a state built under a
/// different pass size, model or draft mode, whose passes were not these.
package struct PrefixResumeRule {
    package let key: PromptCheckpointKey
    package let boundaries: Set<Int>
    package init(key: PromptCheckpointKey, boundaries: Set<Int>) {
        self.key = key
        self.boundaries = boundaries
    }
}

/// A digest of one image's encoded bytes, wide enough that a collision is not
/// a practical concern. Bytes rather than the URL: the same http URL may serve
/// different pictures later, while identical bytes always decode, resize and
/// encode to the same rows for a given tower.
public struct ImageHash: Hashable, Sendable {
    public let hi: UInt64
    public let lo: UInt64
    public init(hi: UInt64, lo: UInt64) {
        self.hi = hi
        self.lo = lo
    }
}

/// One image's placeholder run inside an expanded prompt: where it starts, how
/// many tokens it occupies, and which image produced it. Offsets are in the
/// expanded id space — the same space `promptIds` is in.
public struct ImageSegment: Hashable, Sendable {
    public let start: Int
    public let count: Int
    public let hash: ImageHash
    /// Opaque in-process tower/processor identity. Legacy callers without a
    /// VisionPrompt keep nil; they cannot match a prepared image accidentally.
    package let preparationIdentity: String?
    public init(start: Int, count: Int, hash: ImageHash) {
        self.start = start
        self.count = count
        self.hash = hash
        self.preparationIdentity = nil
    }
    package init(start: Int, count: Int, hash: ImageHash, preparationIdentity: String?) {
        self.start = start
        self.count = count
        self.hash = hash
        self.preparationIdentity = preparationIdentity
    }
    /// One past the last token of the run.
    public var end: Int { start + count }
}

/// A bounded set of reusable conversation states plus the exact ids that
/// produced them. Not a general KV cache: every entry matches by exact prefix.
///
/// Entries are shared by every client, which is safe for a reason worth stating
/// rather than rediscovering: a match requires the incoming prompt to *begin
/// with the entire held id sequence*, so a client can only ever reuse state
/// whose full content it just supplied itself. There is nothing to learn from a
/// hit that the requester did not already send.
///
/// An ordinary conversation entry includes consumed reply tokens, so a repeated
/// identical prompt cannot reuse that longer state. An optional shorter input
/// checkpoint can be forked at its exact committed boundary; its remaining
/// prompt is still evaluated before any new output is sampled.
public final class PrefixCache {
    /// Main-model KV + raw indexer bytes per logical token. Retention is
    /// charged in these units using actual allocated sequence capacity, so
    /// stepped buffers, completed blocks and MTP cannot hide behind the count
    /// of live token IDs. Fixed recurrent state is budgeted separately.
    public static let bytesPerToken = 27_648

    /// 36 linear-attention layers × 48 value heads × 128 × 128 float32.
    public static let fixedBytesPerEntry = 36 * 48 * 128 * 128 * 4
    // Pinned MLX Contiguous may retain up to 16 KiB of excess backing storage.
    // Charge that bound even when a vocabulary row already owns its buffer.
    package static let logitStorageSlackBytes = 16_384

    /// How many states (conversations and reusable checkpoints) fit at once.
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
        var images: [ImageSegment]
        var used: Int
        var reusable = false
        // A speculative retention opportunity has less value than an actual
        // conversation. A hit, or an ordinary return at this same boundary,
        // gives the checkpoint normal LRU standing.
        var wasUsedOrReturned = false
        var lastLogits: MLXArray?
        var promptKey: PromptCheckpointKey?
        /// True only when every one of `tokens` was read in the chronological
        /// prefill passes a fresh read of the same ids runs, under
        /// `producedKey`. A state that also consumed generated tokens, or one
        /// resumed from a position that was not a pass boundary, is false and
        /// `PrefixResumeRule` refuses it.
        var freshEquivalent = false
        /// The settings this state was actually built under, so a later
        /// request cannot continue it with a different pass size or draft mode.
        var producedKey: PromptCheckpointKey?
    }

    /// Do a held entry and an incoming prompt describe the same images?
    ///
    /// Checked in both directions over the entry's token range, which matters
    /// for the asymmetric cases: an entry whose image the prompt replaced (the
    /// first loop), and a text-only entry whose ids a vision prompt happens to
    /// extend because the placeholder id can also appear as a plain token (the
    /// second loop). Runs are compared by start and digest, not by length: an
    /// entry may end part-way through a run, and a partly consumed image is
    /// still the same image.
    public static func imagesAgree(
        entry: [ImageSegment], prompt: [ImageSegment], upTo tokens: Int
    ) -> Bool {
        for e in entry {
            guard let p = prompt.first(where: { $0.start == e.start }), p.hash == e.hash,
                  p.preparationIdentity == e.preparationIdentity
            else { return false }
        }
        for p in prompt where p.start < tokens {
            guard let e = entry.first(where: { $0.start == p.start }), e.hash == p.hash,
                  e.preparationIdentity == p.preparationIdentity
            else { return false }
        }
        return true
    }

    private let lock = NSLock()
    private var entries: [Entry] = []
    private var clock = 0
    private var decision = "not queried"
    package var lastDecision: String { lock.withLock { decision } }

    /// Ceiling on tokens held across *all* entries, so several conversations
    /// share one budget rather than each reserving the maximum. One long chat
    /// may still use the whole allowance.
    private var _maxTokens: Int
    private var _enabled: Bool
    private var budgetLimit: Int?
    /// Whether requests are running under `PrefixResumeRule`, which changes
    /// what is worth keeping: a state that also consumed generated tokens can
    /// then never be continued, so it is the first thing to release when room
    /// is needed, ahead of a boundary snapshot the next turn will resume.
    private var _resumeRuleInForce = false

    /// An allocation that has been reassigned to experts cannot be restored
    /// through a later cache toggle. Only a newly applied plan changes this.
    package func setBudgetLimit(_ tokens: Int?) {
        lock.withLock {
            budgetLimit = tokens.map { max(0, $0) }
            if let budgetLimit { _maxTokens = min(_maxTokens, budgetLimit) }
            while entries.reduce(0, { $0 + Self.charge($1) }) > _maxTokens { evictLRU() }
        }
    }

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
    private var _checkpointHits = 0
    private var _checkpointStores = 0
    private var _checkpointForkFailures = 0
    private var _persistentHits = 0
    private var _persistent: PersistentPrefixCache?
    public var hits: Int { lock.withLock { _hits } }
    /// Hits served by restoring a state from the persistent tier.
    public var persistentHits: Int { lock.withLock { _persistentHits } }
    /// The disk tier consulted when memory retains nothing as long as the
    /// incoming prompt's persisted prefix (see PersistentPrefixCache).
    public var persistent: PersistentPrefixCache? { lock.withLock { _persistent } }
    public func attachPersistent(_ tier: PersistentPrefixCache?) { lock.withLock { _persistent = tier } }
    public var misses: Int { lock.withLock { _misses } }
    public var evictions: Int { lock.withLock { _evictions } }
    public var checkpointHits: Int { lock.withLock { _checkpointHits } }
    public var checkpointStores: Int { lock.withLock { _checkpointStores } }
    public var heldCheckpoints: Int { lock.withLock { entries.filter(\.reusable).count } }

    public init(maxTokens: Int, enabled: Bool = true) {
        self._maxTokens = max(0, maxTokens)
        self._enabled = enabled
    }

    public var heldTokens: Int {
        lock.lock(); defer { lock.unlock() }
        return entries.reduce(0) { $0 + $1.tokens.count }
    }

    /// Additional resident ownership beyond the one active baseline already
    /// credited by the governor. Unallocated reservation never enters this sum.
    public var ownedAdditionalBytes: Int { ownedAdditionalBytes(mtpResident: false) }

    package func ownedAdditionalBytes(mtpResident: Bool) -> Int {
        lock.withLock {
            let held = entries.reduce(0) { total, entry in
                total + entry.state.allocatedSequenceBytes + Self.fixedBytesPerEntry
                    + (entry.lastLogits.map { $0.nbytes + Self.logitStorageSlackBytes } ?? 0)
            }
            let included = ContextGeometry.sequenceBytes(tokens: ContextPolicy.tokensInFixedFootprint, mtp: mtpResident)
                + Self.fixedBytesPerEntry
            return max(0, held - included)
        }
    }

    public var heldGB: Double {
        lock.withLock {
            let bytes = entries.reduce(0) { $0 + Self.charge($1) } * Self.bytesPerToken
                + entries.count * Self.fixedBytesPerEntry
            return Double(bytes) / 1e9
        }
    }

    /// Take ownership of a state that `promptIds` extends, or nil.
    ///
    /// The *longest* matching prefix wins, so a follow-up turn resumes the
    /// deepest state available rather than an older, shorter one. An ordinary
    /// hit transfers ownership; a reusable checkpoint forks independent cache
    /// contexts when the retained and active reservations both fit. Misses keep
    /// other conversations unless making room for the new active state requires
    /// eviction, preserving the multi-client and auxiliary-request behavior.
    public func take(
        matching promptIds: [Int], images: [ImageSegment] = [], reserveTokens: Int? = nil,
        reserveSequenceBytes: Int? = nil
    ) -> (state: Qwen4ExpModel.State, reused: Int)? {
        let hit = takeForGeneration(matching: promptIds, images: images, reserveTokens: reserveTokens,
            reserveSequenceBytes: reserveSequenceBytes, completePromptKey: nil)
        return hit.map { ($0.state, $0.reused) }
    }

    /// Equal-length reuse is legal only when the exact committed state's raw
    /// next-token logits were retained. The public extend-only API stays strict.
    package func takeForGeneration(
        matching promptIds: [Int], images: [ImageSegment] = [], reserveTokens: Int? = nil,
        reserveSequenceBytes: Int? = nil, completePromptKey: PromptCheckpointKey?, modelIdentity: UUID? = nil,
        resume: PrefixResumeRule? = nil
    ) -> (state: Qwen4ExpModel.State, reused: Int, logits: MLXArray?, freshEquivalent: Bool)? {
        lock.lock()
        defer { lock.unlock() }
        guard _enabled else { decision = "disabled"; entries.removeAll(); return nil }
        guard let i = bestEntry(matching: promptIds, images: images, completePromptKey: completePromptKey,
                modelIdentity: modelIdentity, resume: resume) else {
            decision = missReason(promptIds: promptIds, images: images, modelIdentity: modelIdentity, resume: resume)
            _misses += 1
            // The caller is about to allocate a new state. Make room first so
            // four retained states plus a fifth active state never coexist.
            reserveActiveTokens(max(promptIds.count, reserveTokens ?? promptIds.count, Self.tokenUnits(reserveSequenceBytes ?? 0)))
            return nil
        }
        let selected = entries[i]
        decision = "reusing \(selected.tokens.count) tokens"
        // An independent Swift context prevents later sampling/diagnostic
        // mutation from changing a retained entry. MLX owns storage aliases.
        let logits = promptIds.count == selected.tokens.count
            ? selected.lastLogits.map { $0.reshaped($0.shape) } : nil
        if selected.reusable {
            clock += 1
            entries[i].used = clock
            entries[i].wasUsedOrReturned = true
            keepPrefixesCurrent(of: promptIds, images: images)
            // Charge a complete future active branch in addition to retained
            // checkpoints. If it cannot remain, transfer the original entry
            // after eviction; do not create a fifth state or an unbudgeted fork.
            reserveActiveTokens(max(promptIds.count, reserveTokens ?? promptIds.count,
                Self.tokenUnits(reserveSequenceBytes ?? 0), Self.charge(selected)))
            if entries.contains(where: { $0.state === selected.state }) {
                do {
                    let branch = try selected.state.forkForPrefix()
                    _hits += 1; _checkpointHits += 1
                    return (branch, selected.tokens.count, logits, selected.freshEquivalent)
                } catch {
                    if let failed = entries.firstIndex(where: { $0.state === selected.state }) {
                        entries.remove(at: failed); _evictions += 1
                    }
                    _checkpointForkFailures += 1; _misses += 1
                    decision = "checkpoint fork failed"
                    return nil
                }
            }
            _hits += 1
            return (selected.state, selected.tokens.count, logits, selected.freshEquivalent)
        }
        let e = entries.remove(at: i)
        clock += 1
        keepPrefixesCurrent(of: promptIds, images: images)
        // A reused state grows too. Reserve its complete incoming prompt and
        // permitted reply before handing it out, just as on a miss.
        reserveActiveTokens(max(promptIds.count, reserveTokens ?? promptIds.count, Self.tokenUnits(reserveSequenceBytes ?? 0), Self.charge(e)))
        _hits += 1
        return (e.state, e.tokens.count, logits, e.freshEquivalent)
    }

    /// Called under the cache lock before a miss makes room for its state.
    /// Counts and refusal categories are safe to log; token values are not.
    private func missReason(promptIds: [Int], images: [ImageSegment], modelIdentity: UUID?,
                            resume: PrefixResumeRule?) -> String {
        guard !entries.isEmpty else { return "no retained state (\(_evictions) prior evictions)" }
        let matching = entries.filter { promptIds.starts(with: $0.tokens) }
        guard !matching.isEmpty else { return "retained states are not exact prefixes of this prompt" }
        let modelMatches = matching.filter { modelIdentity == nil || $0.state.modelIdentity == modelIdentity }
        guard !modelMatches.isEmpty else { return "model identity changed" }
        let imageMatches = modelMatches.filter { Self.imagesAgree(entry: $0.images, prompt: images, upTo: $0.tokens.count) }
        guard !imageMatches.isEmpty else { return "image content changed" }
        guard imageMatches.contains(where: { Self.resumable($0, promptIds: promptIds, resume: resume) }) else {
            return "matching tokens lack a compatible prefill-boundary state"
        }
        return "equal-length state has no compatible next-token logits"
    }

    /// Called with the lock held: the entry `takeForGeneration` would use.
    private func bestEntry(matching promptIds: [Int], images: [ImageSegment],
                           completePromptKey: PromptCheckpointKey?, modelIdentity: UUID?,
                           resume: PrefixResumeRule?) -> Int? {
        var best: Int?
        for (i, e) in entries.enumerated()
        where (modelIdentity == nil || e.state.modelIdentity == modelIdentity)
            && (promptIds.count > e.tokens.count || (completePromptKey != nil
                && e.promptKey == completePromptKey && e.lastLogits != nil
                && promptIds.count == e.tokens.count)) && promptIds.starts(with: e.tokens)
            && Self.imagesAgree(entry: e.images, prompt: images, upTo: e.tokens.count)
            && Self.resumable(e, promptIds: promptIds, resume: resume) {
            if best == nil || e.tokens.count > entries[best!].tokens.count { best = i }
        }
        return best
    }

    /// May this request continue from this entry and still compute what
    /// reading its whole prompt computes? Without a rule, every matching
    /// entry is offered, which is the original extend-only behavior.
    private static func resumable(_ e: Entry, promptIds: [Int], resume: PrefixResumeRule?) -> Bool {
        guard let resume else { return true }
        guard e.freshEquivalent, e.producedKey == resume.key else { return false }
        // The same ids at the same length: this is the state, not a prefix of
        // it, so there is no pass to reproduce and its retained logits stand.
        return promptIds.count == e.tokens.count || resume.boundaries.contains(e.tokens.count)
    }

    /// Prompt tokens the equivalent `takeForGeneration` would reuse, without
    /// taking, touching or evicting anything.
    package func retainedMatchLength(matching promptIds: [Int], images: [ImageSegment] = [],
                                     completePromptKey: PromptCheckpointKey?, modelIdentity: UUID?,
                                     resume: PrefixResumeRule? = nil) -> Int {
        lock.withLock {
            guard _enabled, let i = bestEntry(matching: promptIds, images: images,
                completePromptKey: completePromptKey, modelIdentity: modelIdentity, resume: resume) else { return 0 }
            return entries[i].tokens.count
        }
    }

    /// How many leading tokens of a text prompt some held text state shares:
    /// the boundary a shared-prefix checkpoint of this prompt would use. A
    /// state that the prompt extends outright shares all of its tokens, which
    /// the caller already reuses; the value matters when it exceeds that.
    package func longestCommonPrefix(with promptIds: [Int]) -> Int {
        lock.withLock {
            guard _enabled else { return 0 }
            var best = 0
            for entry in entries where entry.images.isEmpty {
                best = max(best, PersistentPrefixPolicy.commonPrefixLength(entry.tokens, promptIds))
            }
            return best
        }
    }

    /// Make room for a state about to be restored from disk, exactly as a miss
    /// makes room before its caller allocates: retained plus active states
    /// stay inside both the four-state and the shared-token ceilings.
    package func reserveForRestore(promptTokens: Int, reserveTokens: Int, reserveSequenceBytes: Int,
                                   restoredSequenceBytes: Int) {
        lock.withLock {
            guard _enabled else { return }
            reserveActiveTokens(max(promptTokens, reserveTokens, Self.tokenUnits(reserveSequenceBytes),
                Self.tokenUnits(restoredSequenceBytes)))
        }
    }

    /// A restored state is a hit, served by the persistent tier.
    package func recordRestore() { lock.withLock { _hits += 1; _persistentHits += 1 } }

    /// Declared by each request before it takes anything: whether it, and so
    /// the requests around it, must resume exactly. See `evictionCandidates`.
    package func resumeRuleInForce(_ inForce: Bool) { lock.withLock { _resumeRuleInForce = inForce } }

    private static func tokenUnits(_ bytes: Int) -> Int {
        if bytes == Int.max { return Int.max }
        let bytes = max(0, bytes)
        return bytes / bytesPerToken + (bytes % bytesPerToken == 0 ? 0 : 1)
    }

    private static func charge(_ entry: Entry) -> Int {
        max(entry.tokens.count, tokenUnits(entry.state.allocatedSequenceBytes))
            + tokenUnits(entry.lastLogits.map { $0.nbytes + logitStorageSlackBytes } ?? 0)
    }

    /// Called with the cache lock held. Saturating the allowance also avoids
    /// overflowing a diagnostic caller's arbitrarily large reserve request.
    private func reserveActiveTokens(_ reserve: Int) {
        let allowance = _maxTokens - min(_maxTokens, max(0, reserve))
        while !entries.isEmpty && (entries.count >= Self.maxEntries
            || entries.reduce(0, { $0 + Self.charge($1) }) > allowance) {
            evictLRU()
        }
    }

    /// The ids of the longest retained entry that *extends* `prefix`, without
    /// taking it.
    ///
    /// `take` asks the opposite question — is there an entry the incoming
    /// prompt extends — and consumes what it finds. This one asks whether a
    /// previous turn's own output is still held, so the caller can splice those
    /// exact ids back in place of a re-rendered assistant turn (`Engine`'s
    /// spliced encoding). It must not consume: the caller may still decide the
    /// entry does not describe the turn the client sent, and the entry is then
    /// wanted for the ordinary `take` that follows.
    public func peek(extending prefix: [Int]) -> [Int]? {
        peek(extending: prefix, matching: { _ in true })
    }

    /// Find the longest compatible transcript, not merely the longest branch.
    /// Snapshot metadata under the locks, then validate outside them so the
    /// caller can tokenize and check request cancellation without holding a
    /// cache lock. No state is consumed and no tensor payload is restored.
    package func peek(extending prefix: [Int], matching accepts: ([Int]) throws -> Bool) rethrows -> [Int]? {
        let (retained, tier) = lock.withLock { () -> ([[Int]], PersistentPrefixCache?) in
            guard _enabled else { return ([], nil) }
            var candidates: [[Int]] = []
            // Vision entries are skipped: the caller splices these ids into a
            // text-only render that carries no images, and the resulting prompt
            // would claim placeholder tokens it has no embeddings for.
            for e in entries
            where !e.reusable && e.images.isEmpty && e.tokens.count > prefix.count
                && e.tokens.starts(with: prefix) {
                candidates.append(e.tokens)
            }
            return (candidates, _persistent)
        }
        // After a restart, or for a conversation longer than memory retains,
        // the previous turn's exact ids exist only in the persistent tier.
        var best: [Int]?
        for ids in retained + (tier?.extensions(of: prefix) ?? []) {
            if ids.count > (best?.count ?? 0), try accepts(ids) { best = ids }
        }
        return best
    }

    /// Retain `state` as the consumer of exactly `tokens`, evicting
    /// least-recently-used entries until the shared budget fits.
    public func store(
        state s: Qwen4ExpModel.State, tokens t: [Int], images: [ImageSegment] = []
    ) {
        store(state: s, tokens: t, images: images, freshEquivalent: false, key: nil)
    }

    /// As above, recording how the state was built so a later request under
    /// `PrefixResumeRule` can tell whether continuing it is exact.
    package func store(
        state s: Qwen4ExpModel.State, tokens t: [Int], images: [ImageSegment],
        freshEquivalent: Bool, key: PromptCheckpointKey?
    ) {
        lock.lock()
        defer { lock.unlock() }
        guard _enabled, s.committedBoundaryValid, !t.isEmpty, t.count == s.tokenCount,
              t.count <= _maxTokens else { return }
        clock += 1
        // Repeating the same deterministic request produces the same consumed
        // token history. Replace its state instead of filling all four entries
        // with byte-identical conversations and evicting useful chats. Same
        // ids with different pictures is a different conversation, so the
        // images have to match for this to be a replacement.
        if let i = entries.firstIndex(where: { $0.tokens == t && $0.images == images
                && $0.state.modelIdentity == s.modelIdentity }) {
            // Cancellation at this same committed boundary may return the
            // active branch. Preserve the private reusable snapshot; adopting
            // the caller's mutable object would violate fork ownership.
            if entries[i].reusable {
                entries[i].used = clock
                entries[i].wasUsedOrReturned = true
                return
            }
            entries[i] = Entry(state: s, tokens: t, images: images, used: clock,
                freshEquivalent: freshEquivalent, producedKey: key)
        } else {
            entries.append(Entry(state: s, tokens: t, images: images, used: clock,
                freshEquivalent: freshEquivalent, producedKey: key))
        }
        keepPrefixesCurrent(of: t, images: images)
        while entries.count > Self.maxEntries
            || entries.reduce(0, { $0 + Self.charge($1) }) > _maxTokens
        {
            guard !entries.isEmpty else { break }
            evictLRU()
        }
    }

    /// Retain an exact committed common prefix while its producer continues.
    /// The caller supplies the actual consumed IDs/images, serializes with
    /// model execution and declares the producer's complete future reservation.
    /// Cache objects and MLX contexts are forked; both branches are charged at
    /// full allocated sequence capacity plus fixed recurrent state. False means
    /// retention is disabled or does not fit, without changing model behavior.
    @discardableResult
    public func storeReusableCheckpoint(
        state s: Qwen4ExpModel.State, tokens t: [Int], images: [ImageSegment] = [],
        reserveTokens: Int, reserveSequenceBytes: Int, retention: SharedPrefixRetention = .optional
    ) throws -> Bool {
        try storeCheckpoint(state: s, tokens: t, images: images, reserveTokens: reserveTokens,
            reserveSequenceBytes: reserveSequenceBytes, logits: nil, promptKey: nil,
            retention: retention, freshEquivalent: false, producedKey: nil)
    }

    /// As above, recording the settings and the read that produced the state.
    @discardableResult
    package func storeReusableCheckpoint(
        state s: Qwen4ExpModel.State, tokens t: [Int], images: [ImageSegment],
        reserveTokens: Int, reserveSequenceBytes: Int, retention: SharedPrefixRetention = .optional,
        freshEquivalent: Bool, key: PromptCheckpointKey?
    ) throws -> Bool {
        try storeCheckpoint(state: s, tokens: t, images: images, reserveTokens: reserveTokens,
            reserveSequenceBytes: reserveSequenceBytes, logits: nil, promptKey: nil, retention: retention,
            freshEquivalent: freshEquivalent, producedKey: key)
    }

    @discardableResult
    package func storeCompletePrompt(
        state s: Qwen4ExpModel.State, tokens t: [Int], images: [ImageSegment] = [],
        reserveTokens: Int, reserveSequenceBytes: Int, logits: MLXArray,
        vocabularySize: Int, key: PromptCheckpointKey, freshEquivalent: Bool = false
    ) throws -> Bool {
        guard vocabularySize > 0, logits.size == vocabularySize,
              logits.dtype == .bfloat16 || logits.dtype == .float32 else {
            throw ModelError("complete prompt requires exactly one raw vocabulary logit row")
        }
        guard key.model == s.modelIdentity else {
            throw ModelError("complete prompt key must belong to the state's loaded model")
        }
        return try storeCheckpoint(state: s, tokens: t, images: images, reserveTokens: reserveTokens,
            reserveSequenceBytes: reserveSequenceBytes, logits: logits, promptKey: key,
            freshEquivalent: freshEquivalent, producedKey: key)
    }

    private func storeCheckpoint(
        state s: Qwen4ExpModel.State, tokens t: [Int], images: [ImageSegment],
        reserveTokens: Int, reserveSequenceBytes: Int, logits: MLXArray?, promptKey: PromptCheckpointKey?,
        retention: SharedPrefixRetention = .optional,
        freshEquivalent: Bool = false, producedKey: PromptCheckpointKey? = nil
    ) throws -> Bool {
        guard !t.isEmpty, s.tokenCount == t.count else {
            throw ModelError("a reusable checkpoint needs its exact committed token count")
        }
        try s.validatePrefixFork()
        var committedImages: [ImageSegment] = []
        var previousEnd = 0
        for image in images {
            guard image.start >= previousEnd, image.count > 0,
                  !image.start.addingReportingOverflow(image.count).overflow else {
                throw ModelError("invalid image segments for reusable checkpoint")
            }
            previousEnd = image.start + image.count
            if image.start < t.count {
                committedImages.append(ImageSegment(start: image.start, count: min(image.count, t.count - image.start),
                    hash: image.hash, preparationIdentity: image.preparationIdentity))
            }
        }
        lock.lock(); defer { lock.unlock() }
        guard _enabled else { return false }
        let charge = max(t.count, Self.tokenUnits(s.allocatedSequenceBytes))
            + Self.tokenUnits(logits.map { $0.nbytes + Self.logitStorageSlackBytes } ?? 0)
        let active = max(t.count, reserveTokens, Self.tokenUnits(reserveSequenceBytes), charge)
        let allowance = _maxTokens - min(_maxTokens, active)
        guard charge <= allowance else { return false }
        // An entry marked differently describes a different lineage, not the
        // same snapshot: replace it below rather than keeping the older mark.
        func sameSnapshot(_ e: Entry) -> Bool {
            e.tokens == t && e.images == committedImages && e.state.modelIdentity == s.modelIdentity
                && e.reusable && e.promptKey == promptKey
                && e.freshEquivalent == freshEquivalent && e.producedKey == producedKey
        }
        if let existing = entries.firstIndex(where: sameSnapshot) {
            let retained = entries[existing].state
            clock += 1; entries[existing].used = clock
            if retention == .conversation { entries[existing].wasUsedOrReturned = true }
            reserveActiveTokens(active)
            if entries.contains(where: { $0.state === retained && sameSnapshot($0) }) { return true }
        }
        // Plan room before changing anything. Creating an unused checkpoint
        // may replace its own exact duplicate or other unused checkpoints, but
        // cannot evict unrelated conversations or checkpoints with actual hits.
        // One kept like a conversation may then also replace the least
        // recently used of those, as storing a conversation does. The active
        // producer outside the cache still occupies the fourth slot.
        var victims = Set<Int>()
        var inheritedConversationValue = false
        if let duplicate = entries.firstIndex(where: { $0.tokens == t && $0.images == committedImages
                && $0.state.modelIdentity == s.modelIdentity }) {
            inheritedConversationValue = !entries[duplicate].reusable || entries[duplicate].wasUsedOrReturned
            victims.insert(duplicate)
        }
        var remainingCount = entries.count - victims.count
        var remainingCharge = entries.enumerated().reduce(0) { $0 + (victims.contains($1.offset) ? 0 : Self.charge($1.element)) }
        // Least valuable first: snapshots nothing has used yet, then the
        // shallower snapshot of this very conversation, which this one
        // supersedes: a prompt that reaches the old boundary and still
        // matches these ids reaches the new one too. Without that second
        // group a used checkpoint pins the resume point where it was and a
        // long conversation re-reads a little more of itself every turn.
        // Under the rule a conversation state cannot be continued at all, so
        // it goes before a snapshot that can; without it, only speculative
        // snapshots may be given up, exactly as before.
        let unresumable = _resumeRuleInForce
            ? entries.enumerated().filter { !$0.element.freshEquivalent && $0.element.lastLogits == nil
                && !victims.contains($0.offset) }.sorted { $0.element.used < $1.element.used }
            : []
        // A boundary snapshot under the rule is what every following turn
        // resumes from, so storing anything else may not take it; only a
        // deeper snapshot of the same ids replaces it, below.
        let unused = entries.enumerated().filter { $0.element.reusable && !$0.element.wasUsedOrReturned
            && !victims.contains($0.offset)
            && !(_resumeRuleInForce && $0.element.freshEquivalent && $0.element.lastLogits == nil)
        }.sorted { $0.element.used < $1.element.used }
        let superseded = entries.enumerated().filter { $0.element.reusable && $0.element.wasUsedOrReturned
            && !victims.contains($0.offset) && $0.element.tokens.count < t.count
            && $0.element.producedKey == producedKey && t.starts(with: $0.element.tokens)
            && Self.imagesAgree(entry: $0.element.images, prompt: committedImages, upTo: $0.element.tokens.count)
        }.sorted { $0.element.tokens.count > $1.element.tokens.count }
        var candidates: [(offset: Int, element: Entry)] = []
        var candidateIndices = Set<Int>()
        func appendCandidates(_ rows: [(offset: Int, element: Entry)]) {
            for row in rows where candidateIndices.insert(row.offset).inserted {
                candidates.append(row)
            }
        }
        appendCandidates(unresumable)
        appendCandidates(unused)
        appendCandidates(superseded)
        // A shared head retained like a conversation may, after exhausting
        // the cheaper candidates above, replace the least-recently-used
        // conversation or exact boundary. This is the same standing ordinary
        // conversation states have and keeps upstream's shared-prefix policy.
        if retention == .conversation {
            appendCandidates(entries.enumerated()
                .filter { !victims.contains($0.offset) }
                .sorted { $0.element.used < $1.element.used })
        }
        for candidate in candidates where !victims.contains(candidate.offset) {
            if remainingCount < Self.maxEntries - 1 && remainingCharge <= allowance - charge { break }
            victims.insert(candidate.offset); remainingCount -= 1
            remainingCharge -= Self.charge(candidate.element)
        }
        guard remainingCount < Self.maxEntries - 1, remainingCharge <= allowance - charge else { return false }
        for victim in victims.sorted(by: >) { entries.remove(at: victim); _evictions += 1 }
        let frozen = try s.forkForPrefix()
        let frozenLogits = logits.map { contiguous($0.reshaped([-1])).reshaped([-1]) }
        if let frozenLogits { eval(frozenLogits) }
        clock += 1
        entries.append(Entry(state: frozen, tokens: t, images: committedImages, used: clock, reusable: true,
            wasUsedOrReturned: inheritedConversationValue || retention == .conversation,
            lastLogits: frozenLogits, promptKey: promptKey,
            freshEquivalent: freshEquivalent, producedKey: producedKey))
        _checkpointStores += 1
        return true
    }

    /// A checkpoint that a live conversation starts with stays as recent as
    /// that conversation, so an older, unrelated state goes before the start
    /// its next sibling (a new session, a subagent, a compaction request) will
    /// want. Called with the lock held, after `clock` has moved.
    private func keepPrefixesCurrent(of tokens: [Int], images: [ImageSegment]) {
        for i in entries.indices where entries[i].reusable && entries[i].tokens.count < tokens.count
            && tokens.starts(with: entries[i].tokens)
            && Self.imagesAgree(entry: entries[i].images, prompt: images, upTo: entries[i].tokens.count) {
            entries[i].used = max(entries[i].used, clock)
        }
    }

    /// Least valuable first. Ordinarily that is a snapshot nothing has used
    /// yet, which was taken speculatively. Under the resume rule a state that
    /// consumed generated tokens comes first instead: it can no longer be
    /// continued, and releasing it is how a long conversation keeps the
    /// boundary snapshot it does resume from.
    private func evictionCandidates() -> [(offset: Int, element: Entry)] {
        let all = Array(entries.enumerated())
        if _resumeRuleInForce {
            let unresumable = all.filter { !$0.element.freshEquivalent && $0.element.lastLogits == nil }
            if !unresumable.isEmpty { return unresumable }
        }
        let speculative = all.filter { $0.element.reusable && !$0.element.wasUsedOrReturned }
        return speculative.isEmpty ? all : speculative
    }

    private func evictLRU() {
        guard let lru = evictionCandidates().min(by: { $0.element.used < $1.element.used })?.offset
        else { return }
        entries.remove(at: lru)
        _evictions += 1
    }

    /// Apply a smaller live plan immediately, evicting until it is true.
    public func configure(maxTokens: Int) {
        lock.withLock {
            _maxTokens = min(max(0, maxTokens), budgetLimit ?? Int.max)
            while entries.reduce(0, { $0 + Self.charge($1) }) > _maxTokens {
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
        _checkpointHits = 0
        _checkpointStores = 0
        _checkpointForkFailures = 0
        _persistentHits = 0
    }

    public func json() -> [String: Any] {
        lock.lock()
        let held = entries.reduce(0) { $0 + $1.tokens.count }
        let charged = entries.reduce(0) { $0 + Self.charge($1) }
        let allocated = entries.reduce(0) { $0 + $1.state.allocatedSequenceBytes }
        let n = entries.count
        let heldImages = entries.reduce(0) { $0 + $1.images.count }
        let checkpointCount = entries.filter(\.reusable).count
        let (checkpointHits, checkpointStores, forkFailures) = (_checkpointHits, _checkpointStores, _checkpointForkFailures)
        let (h, m, e, enabled, maxTokens) =
            (_hits, _misses, _evictions, _enabled, _maxTokens)
        let (persistentHits, persistent) = (_persistentHits, _persistent)
        lock.unlock()
        var result: [String: Any] = [
            "enabled": enabled,
            "conversations": n,
            "max_conversations": Self.maxEntries,
            "held_tokens": held,
            "charged_token_capacity": charged,
            "allocated_sequence_bytes": allocated,
            "held_images": heldImages,
            "reusable_checkpoints": checkpointCount,
            "checkpoint_hits": checkpointHits,
            "checkpoint_stores": checkpointStores,
            "checkpoint_fork_failures": forkFailures,
            "held_gb": (Double(
                charged * Self.bytesPerToken + n * Self.fixedBytesPerEntry) / 1e9 * 100).rounded() / 100,
            "max_tokens": maxTokens,
            "hits": h,
            "misses": m,
            "evictions": e,
            "persistent_hits": persistentHits,
        ]
        if let persistent { result["persistent"] = persistent.json() }
        return result
    }
}
