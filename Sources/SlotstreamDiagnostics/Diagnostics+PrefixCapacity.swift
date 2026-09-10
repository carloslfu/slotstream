import Slotstream

extension Diagnostics {
    /// Cache-policy fixtures carry logical IDs only and are never forwarded
    /// through the model. Numerical/fork ownership checks use actual tensors
    /// in the separate retention, complete-prompt and lineage diagnostics.
    public static func optimizationPrefixCapacity() throws -> CheckReport {
        var c = CheckBuilder("optimization-prefix-client-capacity")
        func state(_ ids: [Int]) -> Qwen4ExpModel.State {
            let result = Qwen4ExpModel.State(); result.tokenCount = ids.count
            return result
        }
        let prompts = (0..<4).map { Array(repeating: 1000 + $0, count: 17) }
        func trace(checkpoints: Bool) throws -> ([Int], [Bool]) {
            let cache = PrefixCache(maxTokens: 8192)
            for (n, prompt) in prompts.enumerated() {
                c.expect("\(checkpoints)/client \(n): first request misses", cache.take(matching: prompt, reserveTokens: 18) == nil)
                let active = state(prompt)
                if checkpoints {
                    try cache.storeReusableCheckpoint(state: active, tokens: prompt,
                        reserveTokens: 18, reserveSequenceBytes: 0)
                }
                active.tokenCount += 1
                cache.store(state: active, tokens: prompt + [907])
                c.expect("\(checkpoints)/client \(n): bounded idle count",
                    (cache.json()["conversations"] as? Int ?? 99) <= PrefixCache.maxEntries)
            }
            c.equal("\(checkpoints): four ordinary conversations available",
                prompts.filter { cache.peek(extending: $0) == $0 + [907] }.count, 4)
            var reused: [Int] = []
            for prompt in prompts {
                let next = prompt + [907, 23]
                let hit = cache.take(matching: next, reserveTokens: 19)
                reused.append(hit?.reused ?? 0)
                let active = hit?.state ?? state(next); active.tokenCount = next.count
                cache.store(state: active, tokens: next)
            }
            // A fifth unrelated auxiliary request may evict one ordinary
            // conversation, exactly as the baseline cache does.
            let auxiliary = [17, 19, 23]
            _ = cache.take(matching: auxiliary, reserveTokens: 4)
            cache.store(state: state(auxiliary), tokens: auxiliary)
            let survivors = prompts.map { cache.peek(extending: $0) == $0 + [907, 23] }
            c.equal("\(checkpoints): three conversations survive auxiliary request", survivors.filter { $0 }.count, 3)
            c.expect("\(checkpoints): bounded charged capacity",
                (cache.json()["charged_token_capacity"] as? Int ?? Int.max) <= cache.maxTokens)
            return (reused, survivors)
        }
        let reference = try trace(checkpoints: false), candidate = try trace(checkpoints: true)
        c.equal("four-client follow-up hit counts match baseline", candidate.0, reference.0)
        c.equal("auxiliary request preserves baseline LRU survivors", candidate.1, reference.1)

        for tokenPressure in [false, true] {
            let cache = PrefixCache(maxTokens: tokenPressure ? 130 : 8192)
            let ordinary = tokenPressure ? 2 : 3
            for n in 0..<ordinary {
                let ids = Array(repeating: 2000 + n, count: tokenPressure ? 50 : 17)
                cache.store(state: state(ids), tokens: ids)
            }
            let before = cache.heldTokens, evictions = cache.evictions
            c.expect("\(tokenPressure): optional snapshot cannot evict conversations",
                try !cache.storeReusableCheckpoint(state: state(prompts[0]), tokens: prompts[0],
                    reserveTokens: 17, reserveSequenceBytes: 0))
            c.equal("\(tokenPressure): refused snapshot preserves tokens", cache.heldTokens, before)
            c.equal("\(tokenPressure): refused snapshot does not evict", cache.evictions, evictions)
        }
        let priority = PrefixCache(maxTokens: 8192)
        priority.store(state: state(prompts[0] + [907]), tokens: prompts[0] + [907])
        try priority.storeReusableCheckpoint(state: state(prompts[1]), tokens: prompts[1],
            reserveTokens: 17, reserveSequenceBytes: 0)
        for prompt in prompts.dropFirst(2) { priority.store(state: state(prompt + [907]), tokens: prompt + [907]) }
        _ = priority.take(matching: [7000], reserveTokens: 1)
        c.equal("unused checkpoint yields before older conversation", priority.heldCheckpoints, 0)
        c.equal("older ordinary conversation survives", priority.peek(extending: prompts[0]), prompts[0] + [907])

        for adoption in 0..<3 {
            let cache = PrefixCache(maxTokens: 8192)
            if adoption == 2 { cache.store(state: state(prompts[0]), tokens: prompts[0]) }
            try cache.storeReusableCheckpoint(state: state(prompts[0]), tokens: prompts[0],
                reserveTokens: 18, reserveSequenceBytes: 0)
            if adoption == 1 { cache.store(state: state(prompts[0]), tokens: prompts[0]) }
            else if adoption == 0 { _ = cache.take(matching: prompts[0] + [907], reserveTokens: 18) }
            for prompt in prompts.dropFirst() { cache.store(state: state(prompt + [907]), tokens: prompt + [907]) }
            c.expect("\(adoption): used, returned or promoted checkpoint retains normal LRU value",
                try cache.storeReusableCheckpoint(state: state(prompts[0]), tokens: prompts[0],
                    reserveTokens: 18, reserveSequenceBytes: 0))
            c.equal("\(adoption): three retained plus active producer", cache.json()["conversations"] as? Int, 3)
            c.equal("\(adoption): valuable checkpoint survives", cache.heldCheckpoints, 1)
        }
        // A checkpoint ending inside an image must keep its source identity.
        // These states carry no tensors and never run image or model inference.
        let imageCache = PrefixCache(maxTokens: 8192)
        let imageHash = ImageHash(hi: 7, lo: 11)
        let image = ImageSegment(start: 1, count: 20, hash: imageHash,
            preparationIdentity: "processor-a")
        c.equal("image extent is exclusive", image.end, 21)
        c.expect("partial image checkpoint admitted", try imageCache.storeReusableCheckpoint(
            state: state(prompts[0]), tokens: prompts[0], images: [image],
            reserveTokens: 18, reserveSequenceBytes: 0))
        c.expect("same image identity reuses a partial checkpoint",
            imageCache.take(matching: prompts[0] + [907], images: [image], reserveTokens: 18) != nil)
        let changedImage = ImageSegment(start: 1, count: 20, hash: imageHash,
            preparationIdentity: "processor-b")
        c.expect("same bytes from a different image processor do not reuse",
            imageCache.take(matching: prompts[0] + [907], images: [changedImage], reserveTokens: 18) == nil)
        c.equal("partial image hit counted", imageCache.checkpointHits, 1)
        c.equal("image mismatch counted", imageCache.misses, 1)
        for invalid in [
            [ImageSegment(start: -1, count: 1, hash: imageHash)],
            [ImageSegment(start: 0, count: 0, hash: imageHash)],
            [ImageSegment(start: Int.max, count: 1, hash: imageHash)],
            [ImageSegment(start: 0, count: 3, hash: imageHash),
             ImageSegment(start: 2, count: 1, hash: imageHash)],
        ] {
            let held = imageCache.heldTokens
            do {
                try imageCache.storeReusableCheckpoint(state: state(prompts[0]), tokens: prompts[0],
                    images: invalid, reserveTokens: 18, reserveSequenceBytes: 0)
                c.expect("invalid image extent refused", false)
            } catch {
                c.expect("invalid image extent refused", true)
            }
            c.equal("invalid image extent preserves retained state", imageCache.heldTokens, held)
        }
        let retained = imageCache.heldTokens
        imageCache.resetStats()
        c.equal("resetting observations preserves cached state", imageCache.heldTokens, retained)
        c.equal("reset clears hit count", imageCache.hits, 0)
        c.equal("reset clears miss count", imageCache.misses, 0)
        c.equal("reset clears checkpoint observations", imageCache.checkpointStores, 0)
        imageCache.drop()
        c.equal("explicit drop releases retained state", imageCache.heldTokens, 0)
        c.expect("drop preserves the enabled policy", imageCache.enabled)
        return c.report()
    }
}
