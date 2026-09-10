import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationPrefixRetention(modelDir: URL, mtp: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        var options = InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.skipUnusedFinalForward = true
        model.optimizations = options
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
        generator.speculationEnabled = mtp; generator.draftDepth = 1
        var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
        var c = CheckBuilder("optimization-prefix-retention\(mtp ? "-mtp" : "")")
        let prefix = (0 ..< 256).map { 1000 + ($0 * 7919) % 200_000 }
        let prompt = prefix + (0 ..< 17).map { 1700 + $0 * 107 }
        func snapshot(_ state: Qwen4ExpModel.State) -> [String: String] {
            state.prefixForkDiagnosticTensors().mapValues { array in
                let bytes = array.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
                return "\(array.dtype):\(array.shape):\(SHA256.hash(data: Data(bytes)))"
            }
        }
        // Create an actual committed, MTP-aligned root. No sampled token has
        // been consumed and no diagnostic array is retained across mutations.
        let seedCache = PrefixCache(maxTokens: 8192)
        var keepGoing = true
        generator.onPrefillProgress = { done, total, _ in if done == total && done > 0 { keepGoing = false } }
        let seeded = generator.generate(promptIds: prefix, params: params, eosIds: [], cache: seedCache,
            shouldContinue: { keepGoing })
        generator.onPrefillProgress = nil
        guard let root = seedCache.take(matching: prompt)?.state else { throw ModelError("prefix retention seed missing") }
        c.expect("seed succeeds without output", seeded.1.runtimeError == nil && seeded.0.isEmpty)
        c.equal("seed is exactly committed", root.tokenCount, prefix.count)
        if mtp { c.expect("seed draft is aligned", root.hasValidMTP) }
        let original = snapshot(root)
        let bytes = root.allocatedSequenceBytes
        let unit = PrefixCache.bytesPerToken
        let charge = max(prefix.count, bytes / unit + (bytes % unit == 0 ? 0 : 1))
        func store(_ cache: PrefixCache, reserve: Int? = nil, sequence: Int? = nil,
                   images: [ImageSegment] = []) throws -> Bool {
            try cache.storeReusableCheckpoint(state: root, tokens: prefix, images: images,
                reserveTokens: reserve ?? charge, reserveSequenceBytes: sequence ?? bytes)
        }
        for limit in [0, charge, charge * 2 - 1, charge * 2, charge * 3, charge * 4, charge * 8] {
            let cache = PrefixCache(maxTokens: limit)
            let retained = try store(cache)
            c.equal("budget \(limit): exact two-state fit", retained, limit >= charge * 2)
            c.equal("budget \(limit): retained charge", cache.json()["charged_token_capacity"] as? Int,
                retained ? charge : 0)
            c.equal("budget \(limit): store count", cache.checkpointStores, retained ? 1 : 0)
            cache.drop()
        }
        let cache = PrefixCache(maxTokens: charge * 8)
        c.expect("initial retention", try store(cache))
        c.expect("same committed prefix is deduplicated", try store(cache))
        c.equal("dedup allocates no new checkpoint", cache.checkpointStores, 1)
        c.equal("one frozen entry", cache.heldCheckpoints, 1)
        c.expect("input checkpoint cannot become assistant output", cache.peek(extending: Array(prefix.prefix(10))) == nil)
        c.expect("equal length cannot produce next logits", cache.take(matching: prefix) == nil)
        var edited = prompt; edited[19] += 1
        c.expect("edited earlier token misses", cache.take(matching: edited) == nil)
        for n in 0 ..< 3 {
            guard let branch = cache.take(matching: prompt, reserveTokens: charge) else {
                throw ModelError("repeat prefix fork missing")
            }
            c.expect("branch \(n): independent root", branch.state !== root)
            c.equal("branch \(n): exact represented state", snapshot(branch.state), original)
            c.equal("branch \(n): retained snapshot survives", cache.heldCheckpoints, 1)
            c.equal("branch \(n): reuse count", branch.reused, 256)
        }
        c.equal("three reusable hits", cache.checkpointHits, 3)
        // Returning a producer at the same boundary must not replace the
        // private snapshot with this externally owned mutable state.
        let producer = try root.forkForPrefix()
        cache.store(state: producer, tokens: prefix)
        producer.tokenCount = 0
        c.equal("ordinary return preserves reusable status", cache.heldCheckpoints, 1)
        c.equal("ordinary return preserves private state", cache.take(matching: prompt)?.state.tokenCount, 256)
        c.expect("huge token reservation refuses without eviction", try !store(cache, reserve: Int.max))
        c.expect("huge byte reservation refuses without eviction", try !store(cache, sequence: Int.max))
        c.equal("refusal preserves coherent checkpoint", cache.heldCheckpoints, 1)
        // Synthetic IDs below exercise cache selection/accounting only. They
        // are never fed to the model with these bookkeeping fixture states.
        for n in 0 ..< 3 {
            let ids = Array(repeating: 800 + n, count: 256)
            cache.store(state: try root.forkForPrefix(), tokens: ids)
        }
        c.equal("four retained states while idle", cache.json()["conversations"] as? Int, 4)
        c.expect("existing checkpoint survives room for active branch", try store(cache))
        c.equal("at most three retained plus producer", cache.json()["conversations"] as? Int, 3)
        cache.drop()
        c.expect("reseed before longest-match fixture", try store(cache))
        let longer = prefix + [17]
        let longerState = try root.forkForPrefix(); longerState.tokenCount = longer.count
        cache.store(state: longerState, tokens: longer)
        c.equal("ordinary output still available for splicing", cache.peek(extending: prefix), longer)
        let longest = cache.take(matching: longer + [23])
        c.expect("longer ordinary entry wins", longest?.state === longerState)
        c.equal("longer ordinary reuse", longest?.reused, 257)
        c.equal("shorter common checkpoint stays retained", cache.heldCheckpoints, 1)
        cache.configure(maxTokens: charge)
        let forkHits = cache.checkpointHits
        let transferred = cache.take(matching: prompt, reserveTokens: charge)
        c.expect("tight reservation transfers coherent ownership", transferred != nil)
        c.equal("transfer avoids extra fork", cache.checkpointHits, forkHits)
        c.equal("transferred checkpoint no longer retained", cache.heldCheckpoints, 0)
        if let transferred { c.equal("transferred bytes are intact", snapshot(transferred.state), original) }
        for action in 0 ..< 4 {
            cache.setBudgetLimit(nil); cache.enabled = true; cache.configure(maxTokens: charge * 8)
            c.expect("lifecycle \(action): seed", try store(cache))
            let active = cache.take(matching: prompt)!.state
            switch action {
            case 0: cache.drop()
            case 1: cache.configure(maxTokens: 0)
            case 2: cache.enabled = false
            default:
                cache.setBudgetLimit(0); cache.configure(maxTokens: charge * 8)
                c.equal("released budget cannot be resurrected", cache.maxTokens, 0)
            }
            c.equal("lifecycle \(action): retention released", cache.heldTokens, 0)
            c.equal("lifecycle \(action): active branch survives", snapshot(active), original)
            if action != 0 { c.expect("lifecycle \(action): refuses new retention", try !store(cache)) }
        }
        cache.setBudgetLimit(nil); cache.enabled = true; cache.configure(maxTokens: charge * 8)
        c.expect("validation seed", try store(cache))
        func rejected(_ name: String, _ operation: () throws -> Void) {
            do { try operation(); c.expect(name, false) } catch { c.expect(name, true) }
            c.equal("\(name): no prior checkpoint lost", cache.heldCheckpoints, 1)
        }
        rejected("wrong token count") {
            _ = try cache.storeReusableCheckpoint(state: root, tokens: prefix + [1], reserveTokens: charge, reserveSequenceBytes: bytes)
        }
        root.setRecording(true)
        rejected("recording state") { _ = try store(cache) }
        root.setRecording(false)
        if mtp {
            let row = root.lastMulti
            root.lastMulti = nil
            rejected("misaligned draft state") { _ = try store(cache) }
            rejected("misaligned draft fork") { _ = try root.forkForPrefix() }
            root.lastMulti = row
        }
        for failureLayer in [0, 3] {
            let broken = try root.forkForPrefix(), saved = broken.checkpoint()
            try model.pool.diagnosticDiscardResidency()
            let fault = ReadFault(afterJobs: 0)
            model.routerObserver = { layer, _ in if layer == failureLayer { model.pool.readFault = fault } }
            do { _ = try model.lastLogitsChecked([907], state: broken); c.expect("partial layer\(failureLayer): read error", false) }
            catch { c.expect("partial layer\(failureLayer): read error", true) }
            model.routerObserver = nil; model.pool.readFault = nil
            c.expect("partial layer\(failureLayer): fault fired", fault.hasFired)
            c.equal("partial layer\(failureLayer): old count alone is insufficient", broken.tokenCount, prefix.count)
            rejected("partial layer\(failureLayer): cannot publish checkpoint") {
                _ = try cache.storeReusableCheckpoint(state: broken, tokens: prefix,
                    reserveTokens: charge, reserveSequenceBytes: bytes)
            }
            rejected("partial layer\(failureLayer): cannot fork") { _ = try broken.forkForPrefix() }
            rejected("partial layer\(failureLayer): cannot continue") { _ = try model.lastLogitsChecked([17], state: broken) }
            let invalidCache = PrefixCache(maxTokens: charge * 8)
            invalidCache.store(state: broken, tokens: prefix)
            c.equal("partial layer\(failureLayer): ordinary cache refuses too", invalidCache.heldTokens, 0)
            broken.restore(saved)
            c.equal("partial layer\(failureLayer): restore recovers exact state", snapshot(broken), original)
            c.equal("partial layer\(failureLayer): restored prefix can fork", snapshot(try broken.forkForPrefix()), original)
            c.equal("partial layer\(failureLayer): pins released", model.pool.pinnedSlotCount, 0)
        }
        let hash = ImageHash(hi: 17, lo: 23)
        for images in [[ImageSegment(start: -1, count: 1, hash: hash)],
                       [ImageSegment(start: 0, count: 0, hash: hash)],
                       [ImageSegment(start: Int.max, count: 1, hash: hash)],
                       [ImageSegment(start: 2, count: 10, hash: hash), ImageSegment(start: 3, count: 2, hash: hash)]] {
            rejected("malformed image \(images)") { _ = try store(cache, images: images) }
        }
        // This tests image metadata identity, not tower numerical integration.
        cache.drop()
        let image = ImageSegment(start: 128, count: 256, hash: hash, preparationIdentity: "fixture-A")
        let future = ImageSegment(start: 1000, count: 2, hash: hash)
        c.expect("partial image and future span retained correctly", try store(cache, images: [image, future]))
        c.equal("future image absent from checkpoint", cache.json()["held_images"] as? Int, 1)
        c.expect("same partial image hits", cache.take(matching: prompt, images: [image]) != nil)
        c.expect("image versus text misses", cache.take(matching: prompt) == nil)
        c.expect("different pixels miss", cache.take(matching: prompt,
            images: [ImageSegment(start: 128, count: 256, hash: ImageHash(hi: 18, lo: 23), preparationIdentity: "fixture-A")]) == nil)
        c.expect("different preparation misses", cache.take(matching: prompt,
            images: [ImageSegment(start: 128, count: 256, hash: hash, preparationIdentity: "fixture-B")]) == nil)
        cache.drop()

        // Actual Generator requests keep identical chronological pass boundaries
        // in cold and checkpoint paths, so full generated IDs must be exact.
        let reference = generator.generate(promptIds: prompt, params: params, eosIds: [])
        c.expect("reference generation succeeds", reference.1.runtimeError == nil)
        options.prefixCheckpointTokens = 256; model.optimizations = options
        for n in 0 ..< 3 {
            let result = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
            c.expect("request \(n): succeeds", result.1.runtimeError == nil)
            c.equal("request \(n): exact output", result.0, reference.0)
            c.equal("request \(n): exact reused prefix", result.1.reusedPrefixTokens, n == 0 ? 0 : 256)
            c.equal("request \(n): fork observation", result.1.prefixCheckpointForks, n == 0 ? 0 : 1)
            c.equal("request \(n): checkpoint error count", result.1.prefixCheckpointErrors, 0)
            c.equal("request \(n): snapshot remains reusable", cache.heldCheckpoints, 1)
            if mtp { c.expect("request \(n): draft verification still runs", result.1.verifyPasses > 0) }
        }
        for (n, count) in [17, 259, 1795].enumerated() {
            let branchPrompt = prefix + (0 ..< count).map { 3100 + (($0 * 997 + n) % 190_000) }
            options.prefixCheckpointTokens = 0; model.optimizations = options
            let direct = generator.generate(promptIds: branchPrompt, params: params, eosIds: [])
            options.prefixCheckpointTokens = 256; model.optimizations = options
            let branch = generator.generate(promptIds: branchPrompt, params: params, eosIds: [], cache: cache)
            c.expect("divergent client \(n): direct and branch succeed", direct.1.runtimeError == nil && branch.1.runtimeError == nil)
            c.equal("divergent client \(n): shared prefix reused", branch.1.reusedPrefixTokens, 256)
            c.equal("divergent client \(n): exact output", branch.0, direct.0)
            let auxiliary = generator.generate(promptIds: [19, 23, 907], params: params, eosIds: [], cache: cache)
            c.expect("auxiliary request \(n): succeeds", auxiliary.1.runtimeError == nil)
            c.equal("auxiliary request \(n): does not steal common prefix", cache.heldCheckpoints, 1)
            c.expect("auxiliary request \(n): respects state count", (cache.json()["conversations"] as? Int ?? 99) <= PrefixCache.maxEntries)
        }
        cache.drop()
        // Cancellation returns exactly the boundary we just checkpointed.
        keepGoing = true
        generator.onPrefillProgress = { done, _, _ in if done == 256 { keepGoing = false } }
        let cancelled = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache,
            shouldContinue: { keepGoing })
        generator.onPrefillProgress = nil
        c.expect("boundary cancellation emits nothing", cancelled.0.isEmpty)
        c.equal("boundary cancellation preserves checkpoint", cache.heldCheckpoints, 1)
        c.equal("boundary cancellation has exact committed bytes", snapshot(cache.take(matching: prompt)!.state), original)
        cache.drop()
        // A later failed forward cannot invalidate an earlier frozen commit.
        try model.pool.diagnosticDiscardResidency()
        let fault = ReadFault(afterJobs: 0)
        generator.onPrefillProgress = { done, _, _ in if done == 256 { model.pool.readFault = fault } }
        let failed = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
        model.pool.readFault = nil; generator.onPrefillProgress = nil
        c.expect("second-pass fault exercised", fault.hasFired)
        c.expect("second-pass failure reported without output", failed.1.runtimeError != nil && failed.0.isEmpty)
        c.equal("failure retains only the committed prefix", cache.heldTokens, 256)
        c.equal("failure leaves no request pins", model.pool.pinnedSlotCount, 0)
        let retry = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
        c.equal("retry resumes committed prefix", retry.1.reusedPrefixTokens, 256)
        c.expect("retry succeeds", retry.1.runtimeError == nil)
        c.equal("retry produces exact output", retry.0, reference.0)
        cache.drop()
        options.prefixCheckpointTokens = 512; model.optimizations = options
        let noBoundary = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: cache)
        c.equal("absent boundary changes no batching", noBoundary.1.prefillPasses, reference.1.prefillPasses)
        c.equal("absent boundary retains no checkpoint", cache.heldCheckpoints, 0)
        c.equal("absent boundary exact output", noBoundary.0, reference.0)
        c.equal("producer remains unchanged throughout", snapshot(root), original)
        if mtp {
            // The legacy callback above intentionally retains a committed
            // prefix. A typed request cancellation must instead fail closed,
            // including when the speculative loop has an inout stats borrow.
            let configuration = try ContextConfiguration(maxContextTokens: 1024, maxPrefillWaitMinutes: 0)
            let shortPrompt = Array(prefix.prefix(17))
            for stopAt in [0, 1, 3] {
                let request = RequestController(configuration: configuration, slackBytes: 0)
                let held = PrefixCache(maxTokens: 8192)
                var delivered = 0
                let stopped = generator.generate(promptIds: shortPrompt, params: params, eosIds: [], cache: held,
                    shouldContinue: { delivered < stopAt },
                    onToken: { _ in delivered += 1; return true }, request: request)
                c.equal("typed MTP cancel \(stopAt): exact delivery boundary", stopped.0.count, stopAt)
                c.equal("typed MTP cancel \(stopAt): failure code", stopped.1.requestFailure?.code, .clientCancelled)
                c.expect("typed MTP cancel \(stopAt): failure is observable", stopped.1.runtimeError != nil)
                c.equal("typed MTP cancel \(stopAt): invalid request state is not retained", held.heldTokens, 0)
                c.equal("typed MTP cancel \(stopAt): all request pins released", model.pool.pinnedSlotCount, 0)
            }
            let recovery = generator.generate(promptIds: shortPrompt, params: params, eosIds: [],
                request: RequestController(configuration: configuration, slackBytes: 0))
            c.expect("typed MTP cancellation recovers on a fresh request", recovery.1.runtimeError == nil)
            c.equal("typed MTP recovery completes its reply", recovery.0.count, params.maxTokens)
            c.equal("typed MTP recovery releases its pins", model.pool.pinnedSlotCount, 0)
        }
        c.measure("checkpoint_allocated_sequence_bytes", Double(bytes))
        c.measure("checkpoint_charged_tokens", Double(charge))
        c.measure("end_physical_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}
