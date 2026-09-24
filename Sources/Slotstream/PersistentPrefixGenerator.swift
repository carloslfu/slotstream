// Generator glue for the persistent prefix tier, and the weights-free state
// fixture its round-trip check builds through the real cache update paths.

import Foundation
import MLX

/// What the disk tier did for one request. Nil in GenStats when no tier is
/// attached, so statistics saved before this field existed still decode.
public struct PersistentPrefixObservation: Codable, Equatable, Sendable {
    public var restoredTokens = 0
    public var restoreSeconds = 0.0
    public var restoreBytes: Int64 = 0
    public var restoreFailure: String?
    public var saveOutcome: String?
    public var savedTokens = 0
    public var saveSeconds = 0.0
    /// Bytes written: heads plus new segments.
    public var saveBytes: Int64 = 0
    /// Row bytes the written heads reference in segments already on disk.
    public var reusedBytes: Int64?
    public var removedFiles = 0
    /// A shared prefix written inside this prompt, at a boundary other
    /// conversations start with: the outcome and, when saved, its length.
    public var sharedSaveOutcome: String?
    public var sharedSavedTokens = 0
    public var sharedSaveSeconds = 0.0
    public var sharedSaveBytes: Int64 = 0
    public init() {}

    /// Statistics written by 0.2.18 to 0.2.20 have no shared-prefix fields,
    /// and the generated decoder refuses a missing key even when the property
    /// has a default. A missing key keeps its default instead.
    public init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        restoredTokens = try c.decodeIfPresent(Int.self, forKey: .restoredTokens) ?? 0
        restoreSeconds = try c.decodeIfPresent(Double.self, forKey: .restoreSeconds) ?? 0
        restoreBytes = try c.decodeIfPresent(Int64.self, forKey: .restoreBytes) ?? 0
        restoreFailure = try c.decodeIfPresent(String.self, forKey: .restoreFailure)
        saveOutcome = try c.decodeIfPresent(String.self, forKey: .saveOutcome)
        savedTokens = try c.decodeIfPresent(Int.self, forKey: .savedTokens) ?? 0
        saveSeconds = try c.decodeIfPresent(Double.self, forKey: .saveSeconds) ?? 0
        saveBytes = try c.decodeIfPresent(Int64.self, forKey: .saveBytes) ?? 0
        reusedBytes = try c.decodeIfPresent(Int64.self, forKey: .reusedBytes)
        removedFiles = try c.decodeIfPresent(Int.self, forKey: .removedFiles) ?? 0
        sharedSaveOutcome = try c.decodeIfPresent(String.self, forKey: .sharedSaveOutcome)
        sharedSavedTokens = try c.decodeIfPresent(Int.self, forKey: .sharedSavedTokens) ?? 0
        sharedSaveSeconds = try c.decodeIfPresent(Double.self, forKey: .sharedSaveSeconds) ?? 0
        sharedSaveBytes = try c.decodeIfPresent(Int64.self, forKey: .sharedSaveBytes) ?? 0
    }
}

/// The template's ids around a system message, so the engine can find where
/// a prompt's system prompt ends without rendering anything.
public struct SharedPrefixMarkers: Equatable, Sendable {
    /// `<|im_start|>system\n`
    public var systemHeader: [Int]
    /// `<|im_end|>\n`
    public var turnEnd: [Int]
    public init(systemHeader: [Int], turnEnd: [Int]) {
        self.systemHeader = systemHeader; self.turnEnd = turnEnd
    }
}

extension Generator {
    /// The attached tier, when this request may use it: text only, and run
    /// under the exact settings the tier's identity captured.
    private func persistentTier(_ cache: PrefixCache?, images: [ImageSegment]) -> PersistentPrefixCache? {
        guard let cache, cache.enabled, images.isEmpty, let tier = cache.persistent,
              tier.identity.optimizations == nil || tier.identity.optimizations == model.optimizations
        else { return nil }
        return tier
    }

    /// Restore the longest persisted state this prompt extends when memory
    /// retains nothing as long. Room is made first, exactly as for a miss, and
    /// the whole read is priced against reclaimable memory. Any failure falls
    /// back to the ordinary in-memory take.
    func restorePersistentPrefix(cache: PrefixCache?, promptIds: [Int], images: [ImageSegment],
                                 completePromptKey: PromptCheckpointKey?, reserveTokens: Int,
                                 reserveSequenceBytes: Int, request: RequestController?,
                                 resume: PrefixResumeRule?,
                                 stats: inout GenStats) -> PersistentPrefixCache.RestoreResult? {
        guard let cache, let tier = persistentTier(cache, images: images) else { return nil }
        let draft = speculationEnabled && model.mtpHead != nil
        let retained = cache.retainedMatchLength(matching: promptIds, images: images,
            completePromptKey: completePromptKey, modelIdentity: model.promptCheckpointIdentity,
            resume: resume)
        // A state saved at one of this prompt's own pass boundaries is the
        // state this request would have read; any other length is refused for
        // the same reason an in-memory conversation entry is.
        guard let entry = tier.candidate(extending: promptIds, longerThan: retained, requireDraft: draft,
            boundaries: resume?.boundaries, prefillChunk: resume?.key.prefillChunk)
        else { return nil }
        var observation = stats.persistentPrefix ?? PersistentPrefixObservation()
        defer { stats.persistentPrefix = observation }
        cache.reserveForRestore(promptTokens: promptIds.count, reserveTokens: reserveTokens,
            reserveSequenceBytes: reserveSequenceBytes, restoredSequenceBytes: entry.sequenceBytes)
        do {
            if let request, try request.chooseAllocation(preferredBytes: entry.residentBytes, fallbackBytes: 0,
                    phase: "persistent prefix restore") == false {
                observation.restoreFailure = "insufficient memory for a \(entry.residentBytes)-byte state"
                return nil
            }
            let result = try tier.restore(entry, layout: PersistentPrefixLayout(model: model),
                modelIdentity: model.promptCheckpointIdentity, includeDraft: draft)
            cache.recordRestore()
            observation.restoredTokens = result.tokens
            observation.restoreSeconds = result.seconds
            observation.restoreBytes = result.bytes
            return result
        } catch {
            observation.restoreFailure = "\(error)"
            return nil
        }
    }

    /// Write the committed state of a text request long enough to be worth
    /// it, unless its controller keeps the conversation off disk. `shared`
    /// writes a prefix other conversations start with, from inside a prompt.
    func persistPrefix(cache: PrefixCache?, state: Qwen4ExpModel.State, tokens: [Int], images: [ImageSegment],
                       request: RequestController?, aligned: Bool = true,
                       stats: inout GenStats, shared: Bool = false) {
        guard aligned, let tier = persistentTier(cache, images: images),
              tokens.count >= tier.configuration.minimumTokens else { return }
        var observation = stats.persistentPrefix ?? PersistentPrefixObservation()
        defer { stats.persistentPrefix = observation }
        guard request?.persistsPrefixState != false else {
            let skipped = PersistentPrefixCache.SaveOutcome.skipped("this request does not persist its state").description
            if shared { observation.sharedSaveOutcome = skipped } else { observation.saveOutcome = skipped }
            return
        }
        let result = tier.save(state: state, tokens: tokens, shared: shared,
            prefillChunk: model.optimizations.resumesOnPassBoundaries ? prefillChunk : nil)
        if shared {
            observation.sharedSaveOutcome = result.outcome.description
            observation.sharedSavedTokens = result.outcome == .saved ? result.tokens : 0
            observation.sharedSaveSeconds += result.seconds
            observation.sharedSaveBytes += result.bytes
        } else {
            observation.saveOutcome = result.outcome.description
            observation.savedTokens = result.outcome == .saved ? result.tokens : 0
            observation.saveSeconds += result.seconds
            observation.saveBytes += result.bytes
        }
        observation.reusedBytes = (observation.reusedBytes ?? 0) + result.reusedBytes
        observation.removedFiles += result.removedFiles
    }

    /// Boundaries inside this prompt worth a shared-prefix state, ascending:
    /// where its system prompt ends, and the longest start it has in common
    /// with a state some tier already holds. Both are the exact boundaries;
    /// the prefill loop saves at the last completed pass at or before each,
    /// so no pass is ever reshaped for a save. Text prompts only, and only
    /// beyond what this request already reuses.
    func sharedPrefixTargets(cache: PrefixCache?, promptIds: [Int], images: [ImageSegment], reused: Int,
                             request: RequestController?, stats: inout GenStats) -> [Int] {
        guard let cache, cache.enabled, images.isEmpty else { return [] }
        var targets = Set<Int>()
        let hint = request?.sharedPrefixTokens ?? sharedPrefixMarkers.flatMap {
            PersistentPrefixPolicy.systemPrefixBoundary(promptIds, header: $0.systemHeader, turnEnd: $0.turnEnd)
        }
        if let hint { targets.insert(hint) }
        var common = cache.longestCommonPrefix(with: promptIds)
        if let tier = persistentTier(cache, images: images) {
            common = max(common, tier.longestCommonPrefix(with: promptIds))
        }
        if common > 0 { targets.insert(common) }
        stats.sharedPrefixHint = hint
        stats.sharedPrefixCommon = common
        return targets.filter { $0 > reused && $0 < promptIds.count && $0 >= Self.sharedPrefixMinimumTokens }.sorted()
    }

    /// Keep the state at a completed pass boundary as a shared prefix: on
    /// disk for later processes, and as a reusable checkpoint for the
    /// conversations that follow in this one. Disk first, so the live state
    /// carries the lineage of the shared head and this request's own save
    /// then writes only the rows after it.
    func retainSharedPrefix(cache: PrefixCache?, state: Qwen4ExpModel.State, promptIds: [Int], at boundary: Int,
                            images: [ImageSegment], reserveTokens: Int, reserveSequenceBytes: Int,
                            request: RequestController?, aligned: Bool, key: PromptCheckpointKey, stats: inout GenStats) {
        guard let cache, boundary > 0, boundary < promptIds.count, state.tokenCount == boundary,
              !stats.sharedPrefixBoundaries.contains(boundary) else { return }
        let tokens = Array(promptIds.prefix(boundary))
        Stream.gpu.synchronize()
        persistPrefix(cache: cache, state: state, tokens: tokens, images: images, request: request,
            aligned: aligned || !model.optimizations.resumesOnPassBoundaries, stats: &stats, shared: true)
        do {
            let retained = try cache.storeReusableCheckpoint(state: state, tokens: tokens, images: images,
                reserveTokens: reserveTokens, reserveSequenceBytes: reserveSequenceBytes,
                retention: request?.sharedPrefixRetention ?? .optional, freshEquivalent: aligned, key: key)
            if retained { stats.sharedPrefixStores += 1 } else { stats.sharedPrefixRefusals += 1 }
        } catch {
            stats.sharedPrefixErrors += 1
        }
        stats.sharedPrefixBoundaries.append(boundary)
    }
}

extension Qwen4ExpModel.State {
    /// A weights-free state for `persistent-prefix-round-trip`: two attention
    /// layers with compacting indexers, three recurrent layers (one sliced
    /// window, one PLE window) and an aligned draft cache, grown through the
    /// real update paths in 256-token passes. Values are small integers.
    package static func persistenceFixture(tokens: Int, compactRaw: Bool = true,
                                           draft: Bool = true) -> Qwen4ExpModel.State {
        let state = Qwen4ExpModel.State()
        state.modelIdentity = UUID()
        state.compactStateWindows = true
        for layer in [0, 1, 2] {
            let cache = LinearCache()
            cache.ngramCtx = [Int64(layer), 7]
            state.linear[layer] = cache
        }
        for layer in [3, 7] {
            state.kv[layer] = KVCache()
            state.indexer[layer] = IndexerCache(compactRaw: compactRaw)
        }
        if draft { state.mtp = MTPState() }
        state.extendPersistenceFixture(to: tokens)
        return state
    }

    /// Grow the fixture. `seed` changes every new row, so two branches grown
    /// from one state to the same length hold different values.
    package func extendPersistenceFixture(to tokens: Int, seed: Int = 0) {
        func rows(_ shape: [Int], _ value: Int) -> MLXArray {
            let count = shape.reduce(1, *)
            let offset = value + seed * 7
            return MLXArray((0 ..< count).map { Float(($0 * 31 + offset * 17) % 251) - 125 }).reshaped(shape)
        }
        func appendIndexer(_ cache: IndexerCache, _ values: MLXArray) {
            let raw = cache.update(values), base = cache.rawBase
            let blocks = cache.offset / 4
            if blocks > 0 {
                let pooled = cache.completedBlocks(count: blocks, ratio: 4) { lo, hi in
                    raw[0..., (lo * 4 - base) ..< (hi * 4 - base), 0...].reshaped([1, hi - lo, 4, 16])
                        .asType(.float32).mean(axis: 2).asType(.bfloat16)
                }
                eval(pooled)
            }
            cache.materializeStorage()
        }
        while tokenCount < tokens {
            let start = tokenCount, count = min(256, tokens - start)
            for layer in kv.keys.sorted() {
                let cache = kv[layer]!
                _ = cache.updateAndFetch(rows([1, 2, count, 8], layer * 100 + start).asType(.bfloat16),
                                         rows([1, 2, count, 8], layer * 101 + start).asType(.bfloat16))
                eval(cache.keys!, cache.values!)
                appendIndexer(indexer[layer]!, rows([1, count, 16], layer * 103 + start).asType(.bfloat16))
            }
            for layer in linear.keys.sorted() {
                let cache = linear[layer]!
                // A window sliced out of a larger activation, as prefill leaves it.
                cache.convState = rows([1, 5, 24], layer * 107 + start).asType(.bfloat16)[0..., 1 ..< 4, 0...]
                cache.ssmState = rows([1, 4, 8, 8], layer * 109 + start)
                if layer == 1 { cache.pleConvState = rows([1, 3, 12], layer * 113 + start).asType(.bfloat16) }
                eval([cache.convState, cache.ssmState, cache.pleConvState].compactMap { $0 })
            }
            if let mtp {
                // The draft cache holds one entry per consumed token except the first.
                let draftRows = start == 0 ? count - 1 : count
                if draftRows > 0 {
                    _ = mtp.kv.updateAndFetch(rows([1, 2, draftRows, 8], 997 + start).asType(.bfloat16),
                                              rows([1, 2, draftRows, 8], 991 + start).asType(.bfloat16))
                    appendIndexer(mtp.indexer, rows([1, draftRows, 16], 983 + start).asType(.bfloat16))
                    mtp.materialize()
                }
                lastMulti = rows([1, 1, 32], 977 + start).asType(.bfloat16)
                eval(lastMulti!)
            }
            ngramCtx = [Int64(start), Int64(start + count)]
            tokenCount = start + count
        }
    }
}
