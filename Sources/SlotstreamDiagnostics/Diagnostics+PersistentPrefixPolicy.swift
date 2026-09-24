import Foundation
import Slotstream

extension Diagnostics {
    /// The persistent prefix tier's pure decisions and codecs: candidate
    /// selection, expiry, ancestors kept and replaced, removal classes, quota
    /// eviction over shared segments, extent tiling and reuse, byte layout,
    /// footer, names, checksums, headers and identity. No disk, no GPU.
    public static func persistentPrefixPolicy() -> CheckReport {
        var c = CheckBuilder("persistent-prefix-policy")
        // docs/CLI.md states the opt-in defaults; the claims name this gate.
        c.equal("default disk quota", PersistentPrefixConfiguration.defaultMaxBytes, 20_000_000_000)
        c.equal("default minimum state length", PersistentPrefixConfiguration.defaultMinimumTokens, 1024)
        c.equal("default maximum age in days", PersistentPrefixConfiguration.defaultMaxAgeDays, 30)
        c.equal("default maximum age", PersistentPrefixConfiguration.defaultMaxAge, 30 * 86_400)
        c.equal("a configuration forgets after the default age",
            PersistentPrefixConfiguration(directory: URL(fileURLWithPath: "/nonexistent")).maxAge, 30 * 86_400)
        c.equal("default minimum shared prefix", Generator.sharedPrefixMinimumTokens, 512)
        c.equal("default prefill pass, the shared save grid", PrefillTuning.chunk, 256)
        typealias Policy = PersistentPrefixPolicy
        typealias File = PersistentPrefixFile
        let now = 10_000_000.0, day = 86_400.0
        func segment(_ n: Int) -> String { String(format: "%032x", n) + ".slotseg" }
        func records(_ segments: [String], base: Int = 0) -> [String: File.SequenceRecord] {
            guard !segments.isEmpty else { return [:] }
            let extents = segments.enumerated().map {
                File.Extent(segment: $0.element, start: base + $0.offset * 10, end: base + ($0.offset + 1) * 10)
            }
            return ["kv.3.keys": File.SequenceRecord(name: "kv.3.keys", dtype: "bfloat16", shape: [1, 2, 1024, 8],
                axis: 2, base: base, live: segments.count * 10, extents: extents)]
        }
        func entry(_ file: String, _ tokens: [Int], identity: String = "own", used: Double, draft: Bool = true,
                   continued: Bool = false, shared: Bool = false, segments: [String] = []) -> PersistentPrefixEntry {
            PersistentPrefixEntry(file: file, identity: identity, tokens: tokens, bytes: 100, lastUsed: used,
                hasDraft: draft, continued: continued, shared: shared, sequences: records(segments))
        }

        let all = [entry("a", [1, 2, 3], used: now - 3), entry("b", [1, 2, 3, 4, 5], used: now - 5),
                   entry("c", [1, 2, 3, 4, 5, 6], used: now - 4, draft: false),
                   entry("d", [1, 2, 3, 4, 5, 6, 7], identity: "other", used: now - 6), entry("e", [9, 9, 9, 9], used: now - 1)]
        let prompt = [1, 2, 3, 4, 5, 6, 7, 8]
        func best(_ entries: [PersistentPrefixEntry], _ prompt: [Int], retained: Int = 0, draft: Bool = false,
                  maxAge: TimeInterval? = nil) -> String? {
            Policy.bestMatch(entries, identity: "own", prompt: prompt, longerThan: retained, requireDraft: draft,
                now: now, maxAge: maxAge)?.file
        }
        c.equal("longest own extendable state wins", best(all, prompt), "c")
        c.equal("a speculating request needs the draft cache", best(all, prompt, draft: true), "b")
        c.expect("memory retaining as much wins", best(all, prompt, retained: 6) == nil)
        c.equal("a prompt must be longer than the state", best(all, [1, 2, 3, 4, 5], draft: true), "a")
        c.expect("another identity never matches", best([all[3]], prompt) == nil)
        c.expect("a diverged prompt misses", best(all, [1, 2, 4, 5, 6, 7]) == nil)
        let stale = entry("s", [1, 2, 3, 4, 5, 6], used: now - 31 * day)
        c.expect("an expired state is not a candidate", best([stale], prompt, maxAge: 30 * day) == nil)
        c.equal("without a maximum age it is", best([stale], prompt), "s")
        c.equal("splice recovers the longest own extension",
            Policy.longestExtension(all, identity: "own", of: [1, 2], now: now, maxAge: nil), [1, 2, 3, 4, 5, 6])
        c.expect("splice never returns another identity's ids",
            Policy.longestExtension([all[3]], identity: "own", of: [1, 2], now: now, maxAge: nil) == nil)
        c.expect("splice skips expired states",
            Policy.longestExtension([stale], identity: "own", of: [1, 2], now: now, maxAge: 30 * day) == nil)
        c.equal("branch candidates retain shorter own extensions and exclude expired or foreign ids",
            Policy.extensions(all + [stale], identity: "own", of: [1, 2], now: now, maxAge: 30 * day),
            [[1, 2, 3], [1, 2, 3, 4, 5], [1, 2, 3, 4, 5, 6]])
        var transcript = all[0]
        transcript.splicingTokens = [1, 2, 3, 42, 43]
        c.equal("branch lookup uses generated metadata beyond the numerical checkpoint",
            Policy.extensions([transcript], identity: "own", of: [1, 2, 3, 42], now: now, maxAge: nil),
            [[1, 2, 3, 42, 43]])
        c.expect("identical transcripts are not extensions",
            Policy.extensions([transcript], identity: "own", of: transcript.splicingTokens!, now: now, maxAge: nil).isEmpty)
        c.equal("a save replaces older ancestors but keeps its parent",
            Set(Policy.redundantAncestors(all, identity: "own", by: prompt).map(\.file)), ["a", "b"])
        c.expect("a save with one ancestor keeps it",
            Policy.redundantAncestors([all[0]], identity: "own", by: prompt).isEmpty)
        c.expect("an unrelated save replaces nothing",
            Policy.redundantAncestors(all, identity: "own", by: [7, 7, 7, 7, 7]).isEmpty)

        // Shared prefixes: a head other conversations start with, kept during
        // the prompt's own prefill. Never redundant; found by the system
        // boundary or the longest head a prompt shares with a kept state;
        // saved at the last existing pass end at or before that target.
        let sharedHead = entry("g", [1, 2], used: now - 2, shared: true)
        c.equal("a save never replaces a shared prefix",
            Set(Policy.redundantAncestors(all + [sharedHead], identity: "own", by: prompt).map(\.file)), ["a", "b"])
        c.equal("the longest head a prompt shares with a live own state",
            Policy.longestCommonPrefix(all, identity: "own", prompt: [1, 2, 3, 4, 5, 6, 9], now: now, maxAge: nil), 6)
        c.equal("a head shorter than every state still counts",
            Policy.longestCommonPrefix(all, identity: "own", prompt: [1, 2, 9], now: now, maxAge: nil), 2)
        c.equal("another identity shares nothing",
            Policy.longestCommonPrefix([all[3]], identity: "own", prompt: prompt, now: now, maxAge: nil), 0)
        c.equal("an expired state shares nothing",
            Policy.longestCommonPrefix([stale], identity: "own", prompt: prompt, now: now, maxAge: 30 * day), 0)
        c.equal("a common prefix stops at the first difference", Policy.commonPrefixLength([1, 2, 3], [1, 2, 4]), 2)
        c.equal("an empty list shares nothing", Policy.commonPrefixLength([], [1]), 0)
        let header = [10, 11, 12], turnEnd = [20, 21]
        c.equal("the system boundary is just past the first turn end after the header",
            Policy.systemPrefixBoundary([10, 11, 12, 5, 6, 20, 21, 7, 20, 21], header: header, turnEnd: turnEnd), 7)
        c.expect("a prompt without a system message has no system boundary",
            Policy.systemPrefixBoundary([10, 11, 13, 5, 20, 21], header: header, turnEnd: turnEnd) == nil)
        c.expect("an unfinished system message has no system boundary",
            Policy.systemPrefixBoundary([10, 11, 12, 5, 6, 20], header: header, turnEnd: turnEnd) == nil)
        c.equal("a save point is the last pass end at or before its target",
            PrefillSchedule.lastPassEnd(atOrBefore: 3000, from: 0, remaining: 3600, maxChunk: 256, tailAware: false), 2816)
        c.equal("a target on a pass end is kept exactly",
            PrefillSchedule.lastPassEnd(atOrBefore: 2816, from: 0, remaining: 3600, maxChunk: 256, tailAware: false), 2816)
        c.equal("a target inside the first pass has no save point yet",
            PrefillSchedule.lastPassEnd(atOrBefore: 100, from: 0, remaining: 3600, maxChunk: 256, tailAware: false), 0)
        c.expect("a target behind the position has none",
            PrefillSchedule.lastPassEnd(atOrBefore: 100, from: 256, remaining: 3344, maxChunk: 256, tailAware: false) == nil)
        c.equal("a save point never passes the prompt end",
            PrefillSchedule.lastPassEnd(atOrBefore: 5000, from: 0, remaining: 600, maxChunk: 256, tailAware: false), 600)
        c.equal("read scopes end at the shared save point",
            PrefillSchedule.automaticScopeChoices(remaining: 3600, at: 0, maxChunk: 256, checkpoint: 2816)?.first,
            Array(repeating: 256, count: 11))

        // Removal classes: other build, expired, one-off, parent, conversation.
        let classes = [entry("x", [1, 2, 3], used: now - 1), entry("y", [1, 2, 3, 4], used: now - 9, continued: true),
                       entry("z", [7, 7, 7], used: now - 2), entry("w", [5, 5], identity: "other", used: now),
                       entry("v", [6, 6, 6], used: now - 40 * day, continued: true)]
        func value(_ index: Int) -> PersistentPrefixValue {
            Policy.value(of: classes[index], in: classes, identity: "own", now: now, maxAge: 30 * day)
        }
        c.equal("an extended state is a parent", value(0), .parent)
        c.equal("a continued leaf is a conversation", value(1), .conversation)
        c.equal("a leaf nobody continued is one-off", value(2), .oneOff)
        c.equal("another identity is another build", value(3), .foreign)
        c.equal("an unused state past the age is expired", value(4), .expired)
        c.equal("removal classes are ordered", PersistentPrefixValue.allCases.sorted().map(\.label),
            ["other build", "expired", "one-off", "parent", "conversation", "shared prefix"])
        c.equal("class decides before recency",
            Policy.evictionOrder(classes, identity: "own", now: now, maxAge: 30 * day).map(\.file),
            ["w", "v", "z", "x", "y"])
        // Lineages, not turns, decide what is shared: a head two conversations
        // start from goes last; one nobody started from is one-off.
        let lineages = [entry("p", [1, 2], used: now - 9, shared: true),
                        entry("q", [1, 2, 3], used: now - 1, continued: true),
                        entry("r", [1, 2, 4], used: now - 2, continued: true),
                        entry("t", [1, 2, 3, 5], used: now, continued: true),
                        entry("o", [8, 8], used: now - 3, shared: true)]
        func lineageValue(_ index: Int) -> PersistentPrefixValue {
            Policy.value(of: lineages[index], in: lineages, identity: "own", now: now, maxAge: 30 * day)
        }
        c.equal("a state two conversations start from is a shared prefix", lineageValue(0), .shared)
        c.equal("a state one conversation continues is a parent", lineageValue(1), .parent)
        c.equal("a shared prefix nobody started from is one-off", lineageValue(4), .oneOff)
        c.equal("a shared prefix goes last",
            Policy.evictionOrder(lineages, identity: "own", now: now, maxAge: 30 * day).map(\.file),
            ["o", "q", "r", "t", "p"])
        let regenerated = [entry("m", [1, 2, 3], used: now - 5, continued: true),
                           entry("n1", [1, 2, 3, 4], used: now - 1, continued: true),
                           entry("n2", [1, 2, 3, 6], used: now, continued: true)]
        c.equal("a reply two conversations continue is shared too",
            Policy.value(of: regenerated[0], in: regenerated, identity: "own", now: now, maxAge: nil), .shared)

        // Quota over shared segments: h2 continues h1 and shares its segment.
        let (s1, s2, s3) = (segment(1), segment(2), segment(3))
        let sizes = [s1: Int64(1000), s2: 1000, s3: 1000]
        let shared = [entry("h1", [1, 2], used: now - 1, segments: [s1]),
                      entry("h2", [1, 2, 3], used: now - 2, continued: true, segments: [s1, s2]),
                      entry("h3", [8, 8], used: now, segments: [s3])]
        func victims(_ quota: Int64, _ incoming: Int64, pinned: Set<String> = [], freed: Set<String> = []) -> [String]? {
            Policy.evictionVictims(shared, segments: sizes, identity: "own", quota: quota, incoming: incoming,
                pinned: pinned, freed: freed, now: now, maxAge: nil)?.map(\.file)
        }
        c.equal("held bytes count a shared segment once",
            Policy.heldBytes(shared, segments: sizes, pinned: []), 3300)
        c.equal("a write that fits evicts nothing", victims(3400, 100), [])
        c.equal("a one-off state goes first even when newest", victims(3000, 100), ["h3"])
        c.equal("a parent frees only its head while its child shares its rows", victims(2150, 100), ["h3", "h1", "h2"])
        c.equal("replaced states count as freed", victims(1200, 100, freed: ["h1", "h2"]), [])
        c.equal("pinned segments stay charged", victims(1100, 50, pinned: [s1]), ["h3", "h1", "h2"])
        c.expect("a write larger than the quota with its pinned rows is refused", victims(1040, 50, pinned: [s1]) == nil)
        c.equal("unreferenced segments are found",
            Policy.unreferencedSegments([shared[1]], segments: [s1, s2, s3]), [s3])

        // Extents.
        let record = records([s1, s2, s3])["kv.3.keys"]!
        c.expect("contiguous extents tile the live rows", Policy.tiles(record))
        var gap = record
        gap.extents[1].start += 1
        c.expect("a gap does not tile", !Policy.tiles(gap))
        var short = record
        short.live += 1
        c.expect("extents must reach the last live row", !Policy.tiles(short))
        var escaped = record
        escaped.extents[0].segment = "../\(s1)"
        c.expect("a path in a segment name is refused", !Policy.tiles(escaped))
        c.equal("clipping keeps the rows from a later base",
            Policy.clip(record.extents, from: 15, to: 30), [.init(segment: s2, start: 15, end: 20), .init(segment: s3, start: 20, end: 30)])
        c.equal("clipping both ends",
            Policy.clip(record.extents, from: 5, to: 25), [.init(segment: s1, start: 5, end: 10),
                .init(segment: s2, start: 10, end: 20), .init(segment: s3, start: 20, end: 25)])
        c.equal("an empty range clips to nothing", Policy.clip(record.extents, from: 30, to: 30), [])
        c.expect("rows the extents do not cover cannot be clipped", Policy.clip(record.extents, from: 0, to: 35) == nil)
        c.expect("an inverted range cannot be clipped", Policy.clip(record.extents, from: 31, to: 30) == nil)
        let rows = File.RowsRecord(name: "kv.3.keys", dtype: "bfloat16", leading: [1, 2], trailing: [8], start: 0, end: 10,
            offset: 8, byteCount: 320, crc32: 0)
        func held(_ names: [String], end: Int = 10) -> [String: PersistentPrefixSegmentEntry] {
            Dictionary(uniqueKeysWithValues: names.enumerated().map { index, name in
                var copy = rows
                copy.start = index * 10
                copy.end = index == names.count - 1 ? index * 10 + end : (index + 1) * 10
                return (name, PersistentPrefixSegmentEntry(file: name, identity: "own", bytes: 400, rows: ["kv.3.keys": copy]))
            })
        }
        let head = entry("h", [1], used: now, segments: [s1, s2, s3])
        c.expect("a head whose segments hold its rows is restorable",
            Policy.danglingReason(head, segments: held([s1, s2, s3])) == nil)
        c.expect("a missing segment leaves the head dangling", Policy.danglingReason(head, segments: held([s1, s2])) != nil)
        c.expect("a segment that holds fewer rows leaves it dangling",
            Policy.danglingReason(head, segments: held([s1, s2, s3], end: 9)) != nil)

        // Reuse: which parent rows a save references.
        func child(_ name: String = "kv.3.keys", dtype: String = "bfloat16", base: Int = 0, live: Int) -> File.SequenceRecord {
            File.SequenceRecord(name: name, dtype: dtype, shape: [1, 2, 1024, 8], axis: 2, base: base, live: live, extents: [])
        }
        let parent = records([s1, s2])
        func reuse(_ array: File.SequenceRecord, parent: [String: File.SequenceRecord]? = parent,
                   exists: Set<String> = [s1, s2, s3], maximum: Int = 32) -> PersistentPrefixReuse {
            Policy.reuse(child: [array], parent: parent, segmentExists: { exists.contains($0) }, maximumSegments: maximum)
        }
        let grown = reuse(child(live: 25))
        c.equal("a grown state references its parent rows", grown.extents["kv.3.keys"], parent["kv.3.keys"]!.extents)
        c.equal("and writes only newer rows", grown.firstNewRow["kv.3.keys"], 20)
        c.equal("its referenced segments are pinned", grown.segments, [s1, s2])
        c.expect("no compaction below the bound", !grown.compacted)
        let released = reuse(child(base: 12, live: 13))
        c.equal("released history clips the parent extents", released.extents["kv.3.keys"], [.init(segment: s2, start: 12, end: 20)])
        c.equal("released history writes from the parent's end", released.firstNewRow["kv.3.keys"], 20)
        c.equal("a base past the parent's rows writes every row", reuse(child(base: 22, live: 3)).firstNewRow["kv.3.keys"], 22)
        c.equal("another dtype writes every row", reuse(child(dtype: "float16", live: 25)).firstNewRow["kv.3.keys"], 0)
        c.equal("a rewound state writes every row", reuse(child(live: 15)).firstNewRow["kv.3.keys"], 0)
        c.equal("a missing segment writes every row", reuse(child(live: 25), exists: [s2]).firstNewRow["kv.3.keys"], 0)
        c.equal("no lineage writes every row", reuse(child(live: 25), parent: nil).firstNewRow["kv.3.keys"], 0)
        let bounded = reuse(child(live: 25), maximum: 2)
        c.expect("past the segment bound a save rewrites every row",
            bounded.compacted && bounded.segments.isEmpty && bounded.firstNewRow["kv.3.keys"] == 0
                && bounded.extents["kv.3.keys"] == [])
        c.expect("an exact fit is not compacted", !reuse(child(live: 25), maximum: 3).compacted)

        let kv = File.layout(shape: [1, 2, 2048, 256], axis: 2, length: 1500, itemBytes: 2)
        c.equal("KV live bytes", kv?.logicalBytes, 2 * 1500 * 256 * 2)
        c.equal("KV allocated bytes", kv?.capacityBytes, 2 * 2048 * 256 * 2)
        c.equal("KV chunks are heads", kv?.leading, 2)
        c.equal("KV row bytes", kv?.rowBytes, 512)
        c.expect("live rows beyond capacity are refused",
            File.layout(shape: [1, 2, 1024, 8], axis: 2, length: 1025, itemBytes: 2) == nil)
        c.expect("an axis outside the shape is refused", File.layout(shape: [1, 2], axis: 2, length: 0, itemBytes: 2) == nil)
        c.expect("an overflowing shape is refused",
            File.layout(shape: [Int.max / 2, 4], axis: 0, length: 1, itemBytes: 8) == nil)
        c.expect("an absurd allocation is refused",
            File.layout(shape: [1, 1 << 20, 1 << 15], axis: 1, length: 1, itemBytes: 2) == nil)
        let geometry = File.rows(leading: [1, 2], trailing: [8], itemBytes: 2, count: 10)
        c.expect("rows geometry", geometry?.chunks == 2 && geometry?.rowBytes == 16 && geometry?.bytes == 320)
        c.expect("overflowing rows are refused", File.rows(leading: [Int.max / 2], trailing: [4], itemBytes: 2, count: 3) == nil)

        let size = Int64(8 + 1000 + 300 + File.footerBytes)
        let footer = File.footer(headerOffset: 1008, headerLength: 300, headerCRC: 0xDEAD_BEEF)
        c.equal("footer size", footer.count, File.footerBytes)
        let parsed = File.parseFooter(footer, fileSize: size)
        c.expect("footer round trip", parsed?.offset == 1008 && parsed?.length == 300 && parsed?.crc == 0xDEAD_BEEF)
        c.expect("a header that does not end at the footer is refused", File.parseFooter(footer, fileSize: size + 1) == nil)
        var damaged = footer
        damaged[31] ^= 1
        c.expect("a damaged footer is refused", File.parseFooter(damaged, fileSize: size) == nil)
        let oversized = File.maximumHeaderBytes + 1
        c.expect("an oversized header is refused", File.parseFooter(
            File.footer(headerOffset: 8, headerLength: oversized, headerCRC: 0),
            fileSize: Int64(8 + oversized + File.footerBytes)) == nil)

        let name = File.fileName(identity: "own", tokens: [1, 2, 3])
        c.equal("head names are deterministic", name, File.fileName(identity: "own", tokens: [1, 2, 3]))
        c.equal("a head name over a prefix slice matches the array", File.fileName(identity: "own", tokens: [1, 2, 3, 4].prefix(3)), name)
        c.expect("head names depend on identity and ids",
            name != File.fileName(identity: "other", tokens: [1, 2, 3]) && name != File.fileName(identity: "own", tokens: [1, 2, 4]))
        c.expect("head names are recognized", File.isHeadName(name) && !File.isSegmentName(name))
        let fresh = File.newSegmentName()
        c.expect("segment names are recognized and random",
            File.isSegmentName(fresh) && !File.isHeadName(fresh) && fresh != File.newSegmentName())
        c.expect("names with other characters are refused",
            !File.isSegmentName("../" + fresh) && !File.isSegmentName(fresh.uppercased()) && !File.isHeadName("x.slotprefix"))
        c.equal("token ids are little-endian Int32", File.tokenBytes([1, 256]), [1, 0, 0, 0, 0, 1, 0, 0])

        let check = Array("123456789".utf8)
        c.equal("CRC-32 check value", check.withUnsafeBytes { File.crc32($0.baseAddress, $0.count) }, 0xCBF4_3926)
        let continued = check.withUnsafeBytes { raw -> UInt32 in
            let first = File.crc32(raw.baseAddress, 4)
            return File.crc32(raw.baseAddress!.advanced(by: 4), 5, seed: first)
        }
        c.equal("CRC-32 continues across chunks", continued, 0xCBF4_3926)

        // The in-memory hooks the generator uses around a restore, on logical
        // states that never touch MLX.
        let memory = PrefixCache(maxTokens: 64)
        let heldState = Qwen4ExpModel.State()
        heldState.tokenCount = 20
        memory.store(state: heldState, tokens: Array(1 ... 20))
        c.equal("memory match length is probed without taking",
            memory.retainedMatchLength(matching: Array(1 ... 21), completePromptKey: nil, modelIdentity: nil), 20)
        c.equal("probing keeps the entry", memory.heldTokens, 20)
        c.equal("an equal-length prompt has no ordinary memory match",
            memory.retainedMatchLength(matching: Array(1 ... 20), completePromptKey: nil, modelIdentity: nil), 0)
        memory.reserveForRestore(promptTokens: 50, reserveTokens: 60, reserveSequenceBytes: 0, restoredSequenceBytes: 0)
        c.equal("a restore makes room like a miss", memory.heldTokens, 0)
        memory.recordRestore()
        c.expect("a restore counts as a persistent hit",
            memory.hits == 1 && memory.persistentHits == 1 && memory.json()["persistent_hits"] as? Int == 1)
        memory.resetStats()
        c.equal("statistics reset clears persistent hits", memory.persistentHits, 0)
        memory.enabled = false
        c.equal("a disabled cache probes nothing",
            memory.retainedMatchLength(matching: Array(1 ... 21), completePromptKey: nil, modelIdentity: nil), 0)

        do {
            let control = RequestController(configuration: try ContextConfiguration(
                maxContextTokens: ContextPolicy.defaultTokens, maxPrefillWaitMinutes: 30, qualification: false),
                slackBytes: 0)
            c.expect("requests persist their state by default", control.persistsPrefixState)
            control.persistsPrefixState = false
            c.expect("a request can keep its state off disk", !control.persistsPrefixState)
        } catch {
            c.expect("request controller builds", false, "\(error)")
        }

        let identity = PersistentPrefixIdentity(components: ["x": "1", "y": "2"])
        c.equal("identity ignores component order", identity.digest,
            PersistentPrefixIdentity(components: ["y": "2", "x": "1"]).digest)
        c.expect("any component changes the identity",
            identity.digest != PersistentPrefixIdentity(components: ["x": "1", "y": "3"]).digest)
        c.equal("identity is a SHA-256 digest", identity.digest.count, 64)

        // The wire names of both headers are pinned: renaming a key would
        // make every file on disk unreadable.
        let headJSON = """
            {"arrays":[{"axis":0,"byteCount":12,"crc32":7,"dtype":"int32","length":3,"name":"tokens","offset":8,\
            "shape":[3]}],"attention":[{"indexer":{"compactRaw":true,"offset":3,"pooledCount":0,"pooledRatio":4,\
            "rawBase":0},"kvOffset":3,"layer":3}],"compactStateWindows":true,"continued":true,"format":2,\
            "identity":"own","kind":"head","linear":[{"layer":0,"ngramContext":[1,2]}],"ngramContext":[1,2],\
            "residentBytes":10,"sequenceBytes":4,"sequences":[{"axis":2,"base":0,"dtype":"bfloat16",\
            "extents":[{"end":3,"segment":"\(s1)","start":0}],"live":3,"name":"kv.3.keys","shape":[1,2,1024,8]}],\
            "tokenCount":3}
            """
        let segmentJSON = """
            {"format":2,"identity":"own","kind":"segment","rows":[{"byteCount":96,"crc32":9,"dtype":"bfloat16",\
            "end":3,"leading":[1,2],"name":"kv.3.keys","offset":8,"start":0,"trailing":[8]}]}
            """
        do {
            let decoded = try JSONDecoder().decode(File.Head.self, from: Data(headJSON.utf8))
            let again = try JSONDecoder().decode(File.Head.self, from: File.encodeHeader(decoded))
            c.expect("head header round trip", decoded == again && decoded.draft == nil && decoded.continued
                && decoded.sequences.first?.extents.first?.segment == s1 && Policy.tiles(decoded.sequences[0]))
            let segmentHeader = try JSONDecoder().decode(File.Segment.self, from: Data(segmentJSON.utf8))
            c.expect("segment header round trip", segmentHeader == (try JSONDecoder().decode(File.Segment.self,
                from: File.encodeHeader(segmentHeader))) && segmentHeader.rows.first?.byteCount == 96)
            let probe = try JSONDecoder().decode(File.Probe.self, from: Data(#"{"format":1,"identity":"old"}"#.utf8))
            c.expect("a first-format header still classifies", probe.format == 1 && probe.kind == nil)
        } catch {
            c.expect("headers decode", false, "\(error)")
        }
        return c.report()
    }
}
