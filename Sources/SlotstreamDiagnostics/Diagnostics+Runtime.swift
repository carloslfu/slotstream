// Process and cache safety invariants that are otherwise only observable
// during a 100+ GB model run. Weights-free on purpose: these are the rules a
// long run depends on, checked in milliseconds on every push.

import Foundation
import Slotstream

extension Diagnostics {
    public static func runtime() throws -> CheckReport {
        var c = CheckBuilder("runtime-check")

        c.expect("process physical footprint is readable", ProcessMemory.residentBytes() > 0)
        c.expect("process RSS high-water is readable", ProcessMemory.peakResidentBytes() > 0)

        // The prefix cache holds four conversations, not one: Open WebUI's
        // interleaved title request defeated a single slot.
        let cache = PrefixCache(maxTokens: 100)
        for token in 1 ... PrefixCache.maxEntries {
            cache.store(state: Qwen4ExpModel.State(), tokens: [token])
        }
        c.equal(
            "prefix cache reaches its four-entry bound",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        cache.store(state: Qwen4ExpModel.State(), tokens: [PrefixCache.maxEntries])
        c.equal(
            "an identical history replaces instead of duplicating an entry",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        _ = cache.take(matching: [999], reserveTokens: 1)
        c.equal(
            "a miss evicts before allocating a fifth state",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries - 1)
        cache.configure(maxTokens: 2)
        c.expect("a smaller live token ceiling evicts immediately", cache.heldTokens <= 2)
        c.expect("held GB includes fixed recurrent state", cache.heldGB > 0.1)

        // Image keying. Every image expands to a run of the same placeholder
        // id, so ids alone cannot tell two pictures apart; the digest can, and
        // a match has to agree in both directions.
        let a = ImageHash(hashing: Data("picture A".utf8))
        let b = ImageHash(hashing: Data("picture B".utf8))
        c.expect("identical bytes hash alike", a == ImageHash(hashing: Data("picture A".utf8)))
        c.expect("different bytes do not", a != b)
        let held = [ImageSegment(start: 4, count: 8, hash: a)]
        c.expect(
            "the same image at the same offset matches",
            PrefixCache.imagesAgree(entry: held, prompt: held, upTo: 12))
        c.expect(
            "a swapped image does not",
            !PrefixCache.imagesAgree(
                entry: held, prompt: [ImageSegment(start: 4, count: 8, hash: b)], upTo: 12))
        c.expect(
            "an entry ending inside a run still matches that run",
            PrefixCache.imagesAgree(
                entry: [ImageSegment(start: 4, count: 3, hash: a)], prompt: held, upTo: 7))
        c.expect(
            "a text-only entry rejects a prompt with an image inside its range",
            !PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 12))
        c.expect(
            "an image beyond the entry's range is irrelevant to the match",
            PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 4))

        let vcache = PrefixCache(maxTokens: 100)
        vcache.store(state: Qwen4ExpModel.State(), tokens: [1, 2, 3], images: held)
        c.expect(
            "a vision conversation is held, not discarded",
            vcache.take(matching: [1, 2, 3, 4], images: held, reserveTokens: 4) != nil)
        vcache.store(state: Qwen4ExpModel.State(), tokens: [1, 2, 3], images: held)
        c.expect(
            "the same ids with a different picture miss",
            vcache.take(
                matching: [1, 2, 3, 4], images: [ImageSegment(start: 4, count: 8, hash: b)],
                reserveTokens: 4) == nil)
        vcache.store(state: Qwen4ExpModel.State(), tokens: [1, 2, 3], images: held)
        c.expect(
            "the text-only splice never sees a vision entry",
            vcache.peek(extending: [1, 2]) == nil)

        // A client can re-render an assistant turn differently from the exact
        // ids the server generated (fx omits reasoning when it sends history
        // back). `peek` finds the longest retained extension for the splice,
        // but does not consume it before the ordinary cache match.
        let spliceCache = PrefixCache(maxTokens: 100)
        spliceCache.store(state: Qwen4ExpModel.State(), tokens: [7, 8, 9])
        spliceCache.store(state: Qwen4ExpModel.State(), tokens: [7, 8, 9, 10])
        c.equal(
            "prefix splice chooses the longest retained extension",
            spliceCache.peek(extending: [7, 8]), [7, 8, 9, 10])
        c.expect(
            "prefix splice is strict, not an identical-history match",
            spliceCache.peek(extending: [7, 8, 9, 10]) == nil)
        c.equal(
            "prefix splice lookup does not consume the retained state",
            spliceCache.take(matching: [7, 8, 9, 10, 11])?.reused, 4)
        spliceCache.enabled = false
        c.expect(
            "a disabled prefix cache offers no splice",
            spliceCache.peek(extending: [7]) == nil)

        // Disk quota enforcement (the --kv-cache-size path), weights-free:
        // a fake leaf with a v4 data.kv and an index row must leave the DB
        // AND the disk when a smaller quota forces eviction, and lookup must
        // not resurrect it through the unindexed-but-on-disk heal path.
        let kvDir = FileManager.default.temporaryDirectory
            .appendingPathComponent(
                "slotstream-runtimecheck-kv-\(Int(Date().timeIntervalSince1970 * 1000))",
                isDirectory: true)
        try? FileManager.default.createDirectory(
            at: kvDir, withIntermediateDirectories: true)
        DiskCache.dirOverride = kvDir.path
        defer {
            try? FileManager.default.removeItem(at: kvDir)
            DiskCache.dirOverride = nil
            DiskCache.maxBytesOverride = nil
        }
        let emb: [Float] = [0.5, -0.25, 1.0, 0.125]
        let key = ChunkIndex.makeKey(parentSha: nil, embeddings: emb)
        let chunkDir = kvDir.appendingPathComponent(key, isDirectory: true)
        try? FileManager.default.createDirectory(at: chunkDir, withIntermediateDirectories: true)
        try? Data("{\"version\":4}\n".utf8).write(
            to: chunkDir.appendingPathComponent("data.kv"))
        ChunkIndex.shared.register(
            key: key, parentSha: nil, depth: 0,
            parentTokenCount: 0, tokenCount: 128, sizeBytes: 1_000_000)
        DiskCache.maxBytesOverride = 1e-6  // ~1 KB: the 1 MB chunk is over quota
        let freed = DiskCache.enforceQuota()
        c.expect("forced eviction frees an over-quota leaf", freed >= 1_000_000)
        c.expect(
            "an evicted leaf's directory leaves the disk",
            !FileManager.default.fileExists(
                atPath: chunkDir.appendingPathComponent("data.kv").path))
        let resurrected = DiskCache.longestPrefixHit(
            chunk: 128, embed: { d in d == 0 ? emb : nil })
        c.expect("lookup does not resurrect an evicted chunk", resurrected == nil)
        DiskCache.maxBytesOverride = nil

        // Turn-boundary chains (one variable node per prompt, one per decode)
        // are walked by longestVariableChain over childEndpoints from the
        // deepest fixed boundary, each candidate re-verified against THIS
        // prompt's delta embeddings. Weights-free: synthetic embeddings stand
        // in for the model's — only key derivation, index rows and the
        // placeholder data.kv files matter. Fixed chain: two chunks of 128;
        // turn chain: prompt node at 300, decode node at 340, plus a foreign
        // row registered past the end whose content cannot re-derive.
        func registerNode(parent: String?, lo: Int, hi: Int, _ e: [Float]) -> String {
            let k = ChunkIndex.makeKey(parentSha: parent, embeddings: e)
            ChunkIndex.shared.register(
                key: k, parentSha: parent, depth: 0,
                parentTokenCount: lo, tokenCount: hi, sizeBytes: 16)
            let nodeDir = kvDir.appendingPathComponent(k, isDirectory: true)
            try? FileManager.default.createDirectory(
                at: nodeDir, withIntermediateDirectories: true)
            try? Data("{\"version\":4}\n".utf8).write(
                to: nodeDir.appendingPathComponent("data.kv"))
            return k
        }
        let emb0: [Float] = [0.5, -0.25, 1.0, 0.125]
        let emb1: [Float] = [1.5, 0.25, -1.0, 0.5]
        let turn0: [Float] = [2.0, 1.0, -0.5, 0.25]
        let turn1: [Float] = [0.125, -1.0, 2.0, 0.75]
        let rootKey = registerNode(parent: nil, lo: 0, hi: 128, emb0)
        let chunkKey = registerNode(parent: rootKey, lo: 128, hi: 256, emb1)
        let promptNodeKey = registerNode(parent: chunkKey, lo: 256, hi: 300, turn0)
        let decodeNodeKey = registerNode(parent: promptNodeKey, lo: 300, hi: 340, turn1)
        _ = registerNode(parent: decodeNodeKey, lo: 340, hi: 360, [9.0, 9.0, 9.0, 9.0])
        let fakeEmbed: (Int, Int) -> [Float]? = { lo, hi in
            switch (lo, hi) {
            case (0, 128): return emb0
            case (128, 256): return emb1
            case (256, 300): return turn0
            case (300, 340): return turn1
            default: return [3.0, 3.0, 3.0, 3.0]
            }
        }
        let fixed = DiskCache.longestPrefixHit(
            chunk: 128, embed: { d in d == 0 ? emb0 : d == 1 ? emb1 : nil })
        c.equal("fixed chain walk still reaches its boundary nodes", fixed, 256)
        let chain = DiskCache.longestVariableChain(
            parentSha: chunkKey, parentTokenCount: 256, promptCount: 380,
            embedRange: fakeEmbed)
        c.expect(
            "turn chain walks the prompt node then the decode node",
            chain.keys == [promptNodeKey, decodeNodeKey])
        c.equal(
            "turn chain ends at the last content-verified node", chain.end, 340)
        c.expect(
            "a foreign child never verifies, even with a matching boundary",
            DiskCache.longestVariableChain(
                parentSha: decodeNodeKey, parentTokenCount: 340, promptCount: 380,
                embedRange: fakeEmbed).keys.isEmpty)
        let short = DiskCache.longestVariableChain(
            parentSha: chunkKey, parentTokenCount: 256, promptCount: 320,
            embedRange: fakeEmbed)
        c.expect(
            "a prompt shorter than a held node stops below it, never rewinds",
            short.keys == [promptNodeKey] && short.end == 300)
        let cold = DiskCache.longestVariableChain(
            parentSha: nil, parentTokenCount: 0, promptCount: 380,
            embedRange: { _, _ in nil })
        c.expect(
            "a walk without embeddings verifies nothing",
            cold.keys.isEmpty && cold.end == 0)

        // A dead conversation is now a deep chain, and one eviction pass can
        // only see its current tip: quota enforcement must iterate until the
        // whole chain is gone (it used to free one node per pass).
        var chainPrev: String? = nil
        var deepChainKeys: [String] = []
        for i in 0..<4 {
            let k = registerNode(
                parent: chainPrev, lo: i * 10, hi: (i + 1) * 10,
                [Float(i + 10), 0.5, -0.5, 1.5])
            ChunkIndex.shared.register(
                key: k, parentSha: chainPrev, depth: i,
                parentTokenCount: i * 10, tokenCount: (i + 1) * 10,
                sizeBytes: 1_000_000)
            deepChainKeys.append(k)
            chainPrev = k
        }
        DiskCache.maxBytesOverride = 1e-6
        let freedDeep = DiskCache.enforceQuota()
        c.expect("quota enforcement eats a dead turn chain to its root", freedDeep >= 4_000_000)
        c.expect(
            "every node of the dead chain left the disk",
            deepChainKeys.allSatisfy {
                !FileManager.default.fileExists(
                    atPath: kvDir.appendingPathComponent($0, isDirectory: true)
                        .appendingPathComponent("data.kv").path)
            })
        DiskCache.maxBytesOverride = nil

        // Recency must outrank depth. A leaf saved seconds after its elders
        // sits in the youngest age tier and survives a deficit those elders
        // cover; under plain depth-first ordering the fresh depth-0 leaf went
        // first, which is how the saver evicted the node it had just written
        // (a live conversation's tip is also its shallowest leaf).
        var agePrev: String? = nil
        var ageTip = ""
        for i in 0..<4 {
            ageTip = registerNode(
                parent: agePrev, lo: 100 + i * 10, hi: 110 + i * 10,
                [Float(i + 40), 0.5, -0.5, 1.5])
            ChunkIndex.shared.register(
                key: ageTip, parentSha: agePrev, depth: i,
                parentTokenCount: 100 + i * 10, tokenCount: 110 + i * 10,
                sizeBytes: 1_000_000)
            agePrev = ageTip
        }
        let freshKey = registerNode(parent: nil, lo: 200, hi: 210, [7.0, 0.5, -0.5, 1.5])
        ChunkIndex.shared.register(
            key: freshKey, parentSha: nil, depth: 0,
            parentTokenCount: 200, tokenCount: 210, sizeBytes: 1_000_000)
        // Total ≈ 5 MB of rows; the quota leaves a deficit smaller than one
        // node — exactly the shape of the reported bug.
        DiskCache.maxBytesOverride = 4_200_000.0 / 1_073_741_824.0
        _ = DiskCache.enforceQuota()
        c.expect(
            "an old deep tip is evicted before a fresh shallow leaf",
            !ChunkIndex.shared.contains(key: ageTip))
        c.expect(
            "the freshest leaf survives a deficit its elders cover",
            ChunkIndex.shared.contains(key: freshKey))
        DiskCache.maxBytesOverride = nil

        // Weights behind a symlink: Foundation refuses to list the link itself,
        // so the index must resolve it first (it did not, before 0.2.1).
        let tmp = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-runtime-check-\(getpid())")
        let real = tmp.appendingPathComponent("real")
        let link = tmp.appendingPathComponent("link")
        try FileManager.default.createDirectory(at: real, withIntermediateDirectories: true)
        FileManager.default.createFile(
            atPath: real.appendingPathComponent("model-00001-of-00001.safetensors").path,
            contents: Data())
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: real)
        defer { try? FileManager.default.removeItem(at: tmp) }
        c.equal(
            "shard listing works through a symlinked model dir",
            (try? CheckpointIndex.shardFiles(in: link))?.count, 1)

        // The memory promise: a plan never expects to peak past its target.
        for target in [Planner.minMemoryGB, 10, 16, 30] where target >= Planner.minMemoryGB {
            let p = try Planner.plan(
                expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: 64, workingSetGB: 64, availableGB: 64)
            c.expect(
                "\(target) GB plan stays inside its target",
                p.expectedPeakGB <= target + 0.01,
                "expected peak \(p.expectedPeakGB) GB")
            c.measure("peak_gb_at_\(Int(target))", p.expectedPeakGB)
        }
        return c.report()
    }
}
