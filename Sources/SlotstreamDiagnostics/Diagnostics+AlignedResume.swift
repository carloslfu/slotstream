// The rule that keeps a continued conversation equal to a cold one: which
// retained states a request may resume from, and which it must refuse.
//
// Weights-free. The arithmetic this protects is measured against the real
// model by `prefix-exact-check`; what is checked here is the policy that
// decides what gets offered, which is where the defect lived: every turn
// resumed whatever state the previous turn left behind, including the tokens
// it had generated one at a time, and that state does not hold what reading
// the same ids holds.

import Foundation
import Slotstream

extension Diagnostics {
    public static func alignedPrefixResume() throws -> CheckReport {
        var c = CheckBuilder("aligned-prefix-resume")

        // ---- 1. The boundaries a later request may resume at.
        let chunk = 256
        c.equal("boundaries are the pass ends before the last pass",
            PrefillSchedule.resumeBoundaries(tokens: 1430, maxChunk: chunk).sorted(),
            [256, 512, 768, 1024, 1280])
        c.equal("a prompt that ends on a pass boundary does not offer its own end",
            PrefillSchedule.resumeBoundaries(tokens: 1280, maxChunk: chunk).sorted(),
            [256, 512, 768, 1024])
        c.equal("a prompt shorter than one pass offers nothing",
            PrefillSchedule.resumeBoundaries(tokens: 200, maxChunk: chunk).sorted(), [])
        c.equal("a prompt of exactly one pass offers nothing",
            PrefillSchedule.resumeBoundaries(tokens: 256, maxChunk: chunk).sorted(), [])
        c.equal("two passes offer the first", PrefillSchedule.resumeBoundaries(tokens: 512, maxChunk: chunk).sorted(), [256])
        c.equal("a larger plan pass moves the boundaries with it",
            PrefillSchedule.resumeBoundaries(tokens: 9000, maxChunk: 2048).sorted(),
            [2048, 4096, 6144, 8192])

        // Every boundary is a prefix sum of this prompt's own passes, and the
        // end of the prompt never is. This is the property the resumed read
        // depends on: the passes after it are the passes a fresh read runs.
        for tokens in [300, 512, 513, 1430, 4096, 5000] {
            for maxChunk in [256, 1024] {
                let passes = PrefillSchedule.passes(tokens: tokens, maxChunk: maxChunk)
                var sums: Set<Int> = [], at = 0
                for pass in passes.dropLast() { at += pass; sums.insert(at) }
                c.equal("\(tokens)/\(maxChunk): boundaries are this prompt's own pass ends",
                    PrefillSchedule.resumeBoundaries(tokens: tokens, maxChunk: maxChunk), sums)
            }
        }
        // A boundary of a prompt is still a boundary of every longer prompt:
        // that is what lets a turn resume a state an earlier, shorter turn
        // built, and it is why the final partial pass is excluded.
        var carried = true
        for tokens in stride(from: 260, through: 3000, by: 37) {
            let mine = PrefillSchedule.resumeBoundaries(tokens: tokens, maxChunk: chunk)
            for longer in [tokens + 1, tokens + 255, tokens + 4096] {
                carried = carried && mine.isSubset(of: PrefillSchedule.resumeBoundaries(tokens: longer, maxChunk: chunk))
            }
        }
        c.expect("a shorter prompt's boundaries stay boundaries of a longer one", carried)
        // Late context reads against the reference origin of the read it is
        // in, not the position alone, so nothing there may be resumed.
        let late = PrefillSchedule.resumeBoundaries(tokens: min(ContextPolicy.modelLimit, 200_000), maxChunk: chunk)
        c.expect("no boundary is offered inside the late-context regime",
            late.allSatisfy { PrefillSchedule.chunk(at: $0, maxChunk: 256) >= 256 })

        // ---- 2. What the cache offers under the rule.
        func state(_ ids: [Int]) -> Qwen4ExpModel.State {
            let result = Qwen4ExpModel.State(); result.tokenCount = ids.count
            return result
        }
        let key = PromptCheckpointKey(model: UUID(), optimizations: .integrationCandidate,
            prefillChunk: chunk, mtp: false)
        let other = PromptCheckpointKey(model: key.model, optimizations: .integrationCandidate,
            prefillChunk: 1024, mtp: false)
        let prompt = (0 ..< 1430).map { 1000 + $0 }
        let rule = PrefixResumeRule(key: key,
            boundaries: PrefillSchedule.resumeBoundaries(tokens: prompt.count, maxChunk: chunk))

        func offered(_ build: (PrefixCache) throws -> Void, rule: PrefixResumeRule?) rethrows -> Int {
            let cache = PrefixCache(maxTokens: 1 << 20)
            try build(cache)
            return cache.retainedMatchLength(matching: prompt, completePromptKey: key,
                modelIdentity: nil, resume: rule)
        }
        // The conversation state the previous turn left: its prompt read in
        // passes, then its reply decoded one token at a time.
        let conversation: (PrefixCache) -> Void = { cache in
            let ids = Array(prompt.prefix(1299))
            cache.store(state: state(ids), tokens: ids, images: [], freshEquivalent: false, key: key)
        }
        c.equal("without the rule a conversation state is still offered",
            offered(conversation, rule: nil), 1299)
        c.equal("under the rule a state holding generated tokens is refused",
            offered(conversation, rule: rule), 0)

        func checkpoint(_ length: Int, freshEquivalent: Bool = true,
                        key producing: PromptCheckpointKey? = nil) -> (PrefixCache) throws -> Void {
            { cache in
                let ids = Array(prompt.prefix(length))
                try cache.storeReusableCheckpoint(state: state(ids), tokens: ids, images: [],
                    reserveTokens: prompt.count, reserveSequenceBytes: 0,
                    freshEquivalent: freshEquivalent, key: producing ?? key)
            }
        }
        c.equal("a boundary checkpoint this read would have built is offered",
            try offered(checkpoint(1280), rule: rule), 1280)
        c.equal("the deepest boundary wins", try offered({ cache in
            try checkpoint(256)(cache); try checkpoint(1280)(cache)
        }, rule: rule), 1280)
        c.equal("a state at a position this read never stops at is refused",
            try offered(checkpoint(1299), rule: rule), 0)
        c.equal("a state not built by these passes is refused",
            try offered(checkpoint(1280, freshEquivalent: false), rule: rule), 0)
        c.equal("a state built under another pass size is refused",
            try offered(checkpoint(1280, key: other), rule: rule), 0)
        c.equal("without the rule an unmarked state is still offered",
            try offered(checkpoint(1299, freshEquivalent: false), rule: nil), 1299)

        // The complete prompt is the same ids at the same length, so its
        // retained logits stand whatever the boundaries are, as long as the
        // read that produced them was itself exact. That path needs a state a
        // real model owns; `prefix-exact-check` covers it against the weights.

        // Taking, not only reporting: the state and its mark travel together.
        let cache = PrefixCache(maxTokens: 1 << 20)
        try checkpoint(1280)(cache)
        conversation(cache)
        let taken = cache.takeForGeneration(matching: prompt, reserveTokens: prompt.count,
            completePromptKey: key, modelIdentity: nil, resume: rule)
        c.equal("the rule takes the boundary state, not the longer conversation", taken?.reused, 1280)
        c.expect("a taken boundary state reports that it is exact", taken?.freshEquivalent == true)
        c.equal("the conversation's ids stay available to splice the next prompt",
            cache.peek(extending: Array(prompt.prefix(1172)))?.count, 1299)

        // ---- 3. A conversation's resume point has to keep moving forward.
        //
        // The snapshot a turn resumed is used, so nothing would evict it, and
        // a deeper one asked for on a tight budget used to be refused: the
        // conversation then re-read a little more of itself every turn. A
        // deeper snapshot of the same ids supersedes the shallower one.
        func advancing(budget: Int) throws -> ([Int], Bool) {
            let cache = PrefixCache(maxTokens: budget)
            try checkpoint(1024)(cache)
            _ = cache.takeForGeneration(matching: prompt, reserveTokens: prompt.count,
                completePromptKey: key, modelIdentity: nil, resume: rule)
            let stored = try cache.storeReusableCheckpoint(state: state(Array(prompt.prefix(1280))),
                tokens: Array(prompt.prefix(1280)), images: [], reserveTokens: prompt.count,
                reserveSequenceBytes: 0, freshEquivalent: true, key: key)
            var held: [Int] = []
            for length in [1024, 1280] where cache.retainedMatchLength(matching: Array(prompt.prefix(length + 1)),
                completePromptKey: key, modelIdentity: nil, resume: PrefixResumeRule(key: key,
                    boundaries: PrefillSchedule.resumeBoundaries(tokens: length + 1, maxChunk: chunk))) == length {
                held.append(length)
            }
            return (held, stored)
        }
        let roomy = try advancing(budget: 4000)
        c.expect("with room both the shared prefix and the deeper snapshot are kept",
            roomy.1 && roomy.0 == [1024, 1280], "\(roomy)")
        let tight = try advancing(budget: 3000)
        c.expect("on a tight budget the deeper snapshot replaces the one it supersedes",
            tight.1 && tight.0 == [1280], "\(tight)")

        // ---- 4. The same rule on the disk tier.
        let entries = [768, 1280, 1299].map {
            PersistentPrefixEntry(file: "s\($0)", identity: "own", tokens: Array(prompt.prefix($0)),
                bytes: 1, lastUsed: 1, sequenceBytes: 1, residentBytes: 1, prefillChunk: chunk)
        }
        c.equal("the tier offers its longest state when nothing constrains it",
            PersistentPrefixPolicy.bestMatch(entries, identity: "own", prompt: prompt, longerThan: 0,
                requireDraft: false, now: 1, maxAge: nil)?.tokens.count, 1299)
        c.equal("the tier offers only a boundary state under the rule",
            PersistentPrefixPolicy.bestMatch(entries, identity: "own", prompt: prompt, longerThan: 0,
                requireDraft: false, now: 1, maxAge: nil, boundaries: rule.boundaries, prefillChunk: chunk)?.tokens.count, 1280)
        c.expect("a common boundary cannot hide different producing passes",
            PersistentPrefixPolicy.bestMatch(entries, identity: "own", prompt: prompt, longerThan: 0,
                requireDraft: false, now: 1, maxAge: nil, boundaries: rule.boundaries, prefillChunk: chunk * 2) == nil)
        let unknown = PersistentPrefixEntry(file: "legacy", identity: "own", tokens: Array(prompt.prefix(1280)), bytes: 1, lastUsed: 1)
        c.expect("unknown producing arithmetic cannot satisfy an aligned restore",
            PersistentPrefixPolicy.bestMatch([unknown], identity: "own", prompt: prompt, longerThan: 0,
                requireDraft: false, now: 1, maxAge: nil, boundaries: rule.boundaries, prefillChunk: chunk) == nil)

        // ---- 5. The switch itself.
        c.expect("the deployed family resumes on pass boundaries",
            InferenceOptimizations.integrationCandidate.resumesOnPassBoundaries)
        c.expect("an explicit 0 turns it off",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_ALIGNED_RESUME": "0"]).resumesOnPassBoundaries)
        c.expect("an explicit 1 turns it on",
            try InferenceOptimizations.environment(["SLOTSTREAM_OPT_ALIGNED_RESUME": "1"]).resumesOnPassBoundaries)
        var saved = try JSONSerialization.jsonObject(
            with: JSONEncoder().encode(InferenceOptimizations.integrationCandidate)) as! [String: Any]
        c.expect("the switch is part of a saved control set", saved["alignedPrefixResume"] != nil)
        saved.removeValue(forKey: "alignedPrefixResume")
        let old = try JSONDecoder().decode(InferenceOptimizations.self,
            from: JSONSerialization.data(withJSONObject: saved))
        c.expect("control sets saved before it existed decode as the original behavior",
            !old.resumesOnPassBoundaries)
        c.expect("the switch is part of a checkpoint's identity",
            PromptCheckpointKey(model: key.model, optimizations: old, prefillChunk: chunk, mtp: false) != key)

        return c.report()
    }
}
