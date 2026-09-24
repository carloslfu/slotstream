import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Temporary files and synthetic states grown through the real cache
    /// update paths: exact restore, rows written once and referenced by later
    /// turns, kept parents and branches, rewriting long chains, collected
    /// segments, corruption, what opening a directory removes, other builds,
    /// expiry, a lowered quota, deletion, inspection, rewinds, and a head a
    /// conversation's checkpoint already wrote at a shared prefix's boundary
    /// being upgraded to shared instead of short-circuited.
    public static func persistentPrefixRoundTrip() throws -> CheckReport {
        var c = CheckBuilder("persistent-prefix-round-trip")
        let root = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-persistent-prefix-\(getpid())-\(UUID().uuidString)")
        defer { try? FileManager.default.removeItem(at: root) }
        let identity = PersistentPrefixIdentity(components: ["fixture": "persistent-prefix-round-trip"])
        func configuration(_ directory: URL = root, quota: Int64 = 1 << 30,
                           maxAge: TimeInterval? = PersistentPrefixConfiguration.defaultMaxAge) -> PersistentPrefixConfiguration {
            PersistentPrefixConfiguration(directory: directory, maxBytes: quota, minimumTokens: 1000, maxAge: maxAge)
        }
        func digests(_ state: Qwen4ExpModel.State) -> [String: String] {
            state.prefixForkDiagnosticTensors().mapValues { array in
                let bytes = array.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
                return "\(array.dtype):\(array.shape):"
                    + SHA256.hash(data: Data(bytes)).map { String(format: "%02x", $0) }.joined()
            }
        }
        func skipped(_ outcome: PersistentPrefixCache.SaveOutcome) -> Bool {
            if case .skipped = outcome { return true }
            return false
        }
        func ids(_ count: Int, seed: Int) -> [Int] { (0 ..< count).map { 1000 + (($0 + seed * 7_001) * 7919) % 200_000 } }
        func head(_ tokens: [Int]) -> String { PersistentPrefixFile.fileName(identity: identity.digest, tokens: tokens) }
        func stateFiles(_ directory: URL) -> [String] {
            ((try? FileManager.default.contentsOfDirectory(atPath: directory.path)) ?? [])
                .filter { $0.hasSuffix(".slotprefix") || $0.hasSuffix(".slotseg") }.sorted()
        }
        func exists(_ path: String) -> Bool { FileManager.default.fileExists(atPath: path) }
        for dtype in [DType.bool, .uint8, .uint32, .int32, .int64, .float16, .bfloat16, .float32] {
            c.equal("\(dtype) name round trip",
                PersistentPrefixFile.name(of: dtype).flatMap { PersistentPrefixFile.dtype(named: $0) }, dtype)
        }
        c.expect("unsupported dtype names are refused", PersistentPrefixFile.dtype(named: "complex64") == nil)

        let base = ids(1500, seed: 0)
        let child = base + ids(300, seed: 1)
        let branch = base + ids(300, seed: 2)
        let grand = child + ids(300, seed: 3)
        let fourth = grand + ids(300, seed: 4)
        let fifth = fourth + ids(300, seed: 5)
        let fixture = Qwen4ExpModel.State.persistenceFixture(tokens: base.count)
        let expected = digests(fixture)
        let layout = PersistentPrefixLayout(state: fixture)
        c.expect("fixture releases raw indexer rows", fixture.diagnosticIndexerBases().values.contains { $0 > 0 })
        c.expect("fixture draft cache is aligned", fixture.hasValidMTP)
        func restore(_ tier: PersistentPrefixCache, _ tokens: [Int], draft: Bool = true) throws -> Qwen4ExpModel.State? {
            guard let entry = tier.candidate(extending: tokens + [5], longerThan: 0, requireDraft: draft),
                  entry.tokens == tokens else { return nil }
            return try tier.restore(entry, layout: layout, modelIdentity: nil, includeDraft: draft).state
        }
        var baseBytes: Int64 = 0, deltaBytes: Int64 = 0, reusedBytes: Int64 = 0
        var fourthExpected: [String: String] = [:]
        var fifthSegment = ""
        do {
            let tier = try PersistentPrefixCache(configuration: configuration(), identity: identity)
            c.expect("a second cache cannot share the directory",
                (try? PersistentPrefixCache(configuration: configuration(), identity: identity)) == nil)
            c.equal("an empty directory needs no maintenance", tier.maintenance.files, 0)
            let short = Qwen4ExpModel.State.persistenceFixture(tokens: 999)
            c.expect("states below the minimum are skipped",
                skipped(tier.save(state: short, tokens: Array(base.prefix(999))).outcome))
            c.expect("ids that are not the state's are refused",
                skipped(tier.save(state: fixture, tokens: Array(base.dropLast())).outcome))
            let saved = tier.save(state: fixture, tokens: base)
            baseBytes = saved.bytes
            c.equal("save writes the state", saved.outcome, .saved)
            c.expect("a first save writes every row", saved.reusedBytes == 0 && tier.storedStates == 1 && tier.storedSegments == 1)
            c.equal("saving records the state's lineage", fixture.persistedLineage?.head, head(base))
            c.equal("saving the same state again writes nothing", tier.save(state: fixture, tokens: base).outcome, .present)
            c.equal("source unchanged by saving", digests(fixture), expected)
            c.expect("a prompt equal to the state is not a candidate",
                tier.candidate(extending: base, longerThan: 0, requireDraft: false) == nil)
            c.expect("memory retaining as much wins",
                tier.candidate(extending: base + [5], longerThan: base.count, requireDraft: false) == nil)
            guard let entry = tier.candidate(extending: base + [5], longerThan: 0, requireDraft: true) else {
                c.expect("saved state is a candidate", false)
                return c.report()
            }
            let restored = try tier.restore(entry, layout: layout, modelIdentity: fixture.ownerModelIdentity,
                includeDraft: true)
            c.expect("restored state is a new object", restored.state !== fixture)
            c.equal("restored representation is exact", digests(restored.state), expected)
            c.equal("restored allocated sequence bytes", restored.state.allocatedSequenceBytes,
                fixture.allocatedSequenceBytes)
            c.equal("restored indexer bases", restored.state.diagnosticIndexerBases(), fixture.diagnosticIndexerBases())
            c.expect("restored draft cache is aligned", restored.state.hasValidMTP)
            c.equal("restored owner", restored.state.ownerModelIdentity, fixture.ownerModelIdentity)
            c.equal("a restore records its lineage", restored.state.persistedLineage?.head, entry.file)
            let plain = try tier.restore(entry, layout: layout, modelIdentity: nil, includeDraft: false)
            c.expect("a plain restore omits the draft cache and its rows", plain.state.mtp == nil
                && plain.state.lastMulti == nil
                && plain.state.persistedLineage?.sequences.keys.contains { $0.hasPrefix("draft.") } == false)

            // A continued conversation writes only its new rows. Restored
            // buffers are adopted by MLX; growing them leaves the files alone.
            restored.state.extendPersistenceFixture(to: child.count)
            c.equal("source unchanged by restored growth", digests(fixture), expected)
            let childExpected = digests(restored.state)
            let grown = tier.save(state: restored.state, tokens: child)
            deltaBytes = grown.bytes
            reusedBytes = grown.reusedBytes
            c.equal("an extending save is written", grown.outcome, .saved)
            c.expect("it references the rows already on disk", grown.reusedBytes > 0 && !grown.compacted)
            c.expect("it writes less than the first save", grown.bytes < saved.bytes, "\(grown.bytes) vs \(saved.bytes)")
            c.expect("the parent state stays", grown.removedFiles == 0 && tier.storedStates == 2 && tier.storedSegments == 2)
            c.equal("the extended state is a parent", tier.value(of: head(base)), .parent)
            c.equal("the continued state is a conversation", tier.value(of: head(child)), .conversation)
            c.equal("the continuation restores exactly", try restore(tier, child).map(digests), childExpected)
            c.equal("the parent still restores exactly", try restore(tier, base).map(digests), expected)
            let cache = PrefixCache(maxTokens: 8192)
            cache.attachPersistent(tier)
            c.equal("splice reads persisted ids when memory is empty", cache.peek(extending: Array(base.prefix(64))), child)
            c.equal("prefix cache reports the tier", (cache.json()["persistent"] as? [String: Any])?["states"] as? Int, 2)
            c.expect("generated ids attach to an aligned state", tier.rememberConversation(tokens: child + [7, 8, 9]))
            c.equal("splicing includes the generated suffix", cache.peek(extending: child + [7]), child + [7, 8, 9])
            c.equal("conversation metadata preserves every tensor bit", try restore(tier, child).map(digests), childExpected)
            c.equal("metadata never extends the numerical state", tier.candidate(extending: child + [7, 8, 9],
                longerThan: 0, requireDraft: true)?.tokens, child)

            // Regenerating the reply branches from the kept parent.
            guard let again = try restore(tier, base) else {
                c.expect("the parent is a candidate", false)
                return c.report()
            }
            again.extendPersistenceFixture(to: branch.count, seed: 1)
            let branchExpected = digests(again)
            c.expect("the branch holds different rows", branchExpected != childExpected)
            let branched = tier.save(state: again, tokens: branch)
            c.expect("a branch also writes only its rows",
                branched.outcome == .saved && branched.reusedBytes > 0 && tier.storedStates == 3)
            c.equal("the branch restores exactly", try restore(tier, branch).map(digests), branchExpected)
            c.equal("the first continuation still restores exactly", try restore(tier, child).map(digests), childExpected)
            c.equal("shorter matching disk branch survives a longer incompatible transcript",
                cache.peek(extending: base, matching: { $0 == branch }), branch)
            let memoryBranch = base + [42]
            let memoryState = Qwen4ExpModel.State()
            memoryState.tokenCount = memoryBranch.count
            cache.store(state: memoryState, tokens: memoryBranch)
            c.equal("short matching memory branch survives longer disk branches",
                cache.peek(extending: base, matching: { $0 == memoryBranch }), memoryBranch)
            let longMemory = base + Array(repeating: 43, count: 400)
            let longState = Qwen4ExpModel.State()
            longState.tokenCount = longMemory.count
            cache.store(state: longState, tokens: longMemory)
            c.equal("matching disk branch survives longer incompatible memory branch",
                cache.peek(extending: base, matching: { $0 == branch }), branch)
            c.expect("neither tier invents a match",
                cache.peek(extending: base, matching: { $0.last == -1 }) == nil)
            cache.attachPersistent(nil)

            // A third turn keeps its parent and removes the older ancestor,
            // but not the rows its descendants share.
            guard let childState = try restore(tier, child) else {
                c.expect("the continuation is a candidate", false)
                return c.report()
            }
            childState.extendPersistenceFixture(to: grand.count)
            let grandExpected = digests(childState)
            let third = tier.save(state: childState, tokens: grand)
            c.expect("a third turn removes the grandparent",
                third.outcome == .saved && third.reusedBytes > 0 && tier.value(of: head(base)) == nil)
            c.expect("its parent and the branch stay", tier.value(of: head(child)) == .parent && tier.storedStates == 3)
            c.equal("rows shared with the removed state are kept", tier.storedSegments, 4)
            c.equal("the chain restores exactly", try restore(tier, grand).map(digests), grandExpected)

            // Past the segment bound a save rewrites every row; the next turn
            // references the rewrite and old segments are collected.
            tier.maximumSegments = 2
            guard let grandState = try restore(tier, grand) else {
                c.expect("the chain is a candidate", false)
                return c.report()
            }
            grandState.extendPersistenceFixture(to: fourth.count)
            fourthExpected = digests(grandState)
            let rewritten = tier.save(state: grandState, tokens: fourth)
            c.expect("a long chain is rewritten", rewritten.outcome == .saved && rewritten.compacted && rewritten.reusedBytes == 0)
            c.equal("the tier counts the rewrite", tier.json()["compactions"] as? Int, 1)
            c.equal("the rewritten state restores exactly", try restore(tier, fourth).map(digests), fourthExpected)
            tier.maximumSegments = 32
            guard let fourthState = try restore(tier, fourth) else {
                c.expect("the rewritten state is a candidate", false)
                return c.report()
            }
            fourthState.extendPersistenceFixture(to: fifth.count)
            let fifthExpected = digests(fourthState)
            let collectedBefore = tier.json()["removed_segments"] as? Int ?? 0
            let next = tier.save(state: fourthState, tokens: fifth)
            c.expect("the next turn references the rewritten rows", next.outcome == .saved && next.reusedBytes > 0)
            c.equal("segments no state uses are collected", tier.json()["removed_segments"] as? Int, collectedBefore + 2)
            c.equal("the fifth turn restores exactly", try restore(tier, fifth).map(digests), fifthExpected)
            c.expect("the tier counts states written as references", (tier.json()["delta_saves"] as? Int ?? 0) >= 4)

            // A corrupted segment condemns exactly the states that use it.
            guard let branchEntry = tier.indexedEntries.first(where: { $0.tokens == branch }),
                  let shared = branchEntry.sequences["kv.3.keys"]?.extents.first?.segment,
                  let rows = tier.indexedSegments[shared]?.rows["kv.3.keys"] else {
                c.expect("the branch references a shared segment", false)
                return c.report()
            }
            let sharedPath = root.appendingPathComponent(shared).path
            let fd = open(sharedPath, O_RDWR)
            var byte: UInt8 = 0
            pread(fd, &byte, 1, off_t(rows.offset + 1))
            byte ^= 0xFF
            pwrite(fd, &byte, 1, off_t(rows.offset + 1))
            close(fd)
            do {
                _ = try restore(tier, branch)
                c.expect("a corrupted segment is refused", false)
            } catch {
                c.expect("a corrupted segment is refused", "\(error)".contains("checksum"), "\(error)")
            }
            c.expect("the segment and the states using it are removed",
                !exists(sharedPath) && tier.value(of: head(branch)) == nil)
            c.equal("states that do not use it survive", try restore(tier, fifth).map(digests), fifthExpected)
            fifthSegment = tier.indexedEntries.first { $0.tokens == fifth }?.sequences["kv.3.keys"]?.extents.last?.segment ?? ""
        }

        // Reopening removes interrupted writes, unreadable files and states
        // whose rows disappeared while no cache held the directory.
        let interrupted = root.appendingPathComponent(".interrupted.slotseg.1.tmp").path
        let garbage = root.appendingPathComponent(String(repeating: "a", count: 32) + ".slotseg").path
        FileManager.default.createFile(atPath: interrupted, contents: Data([1]))
        FileManager.default.createFile(atPath: garbage, contents: Data(repeating: 7, count: 100))
        c.expect("the fifth turn wrote its own segment", PersistentPrefixFile.isSegmentName(fifthSegment))
        unlink(root.appendingPathComponent(fifthSegment).path)
        do {
            let tier = try PersistentPrefixCache(configuration: configuration(), identity: identity)
            c.expect("interrupted and unreadable files are removed on open",
                !exists(interrupted) && !exists(garbage) && tier.maintenance.unreadable == 1)
            c.expect("a state missing its rows is removed on open",
                tier.maintenance.incomplete == 2 && tier.value(of: head(fifth)) == nil)
            c.equal("its parent still restores exactly after reopening", try restore(tier, fourth).map(digests), fourthExpected)
            if let entry = tier.candidate(extending: fourth + [5], longerThan: 0, requireDraft: true) {
                let wrong = PersistentPrefixLayout(linearLayers: layout.linearLayers,
                    attentionLayers: layout.attentionLayers.union([11]), compactIndexerRaw: layout.compactIndexerRaw)
                c.expect("a different layer structure is refused",
                    (try? tier.restore(entry, layout: wrong, modelIdentity: nil, includeDraft: false)) == nil)
                c.equal("the unusable state is removed", tier.storedStates, 0)
            } else {
                c.expect("the reopened state is a candidate", false)
            }
            c.equal("its rows are collected with it", stateFiles(root), [])
        }

        // Another build's files are removed when this one opens the directory.
        let otherDirectory = root.appendingPathComponent("other")
        do {
            let tier = try PersistentPrefixCache(configuration: configuration(otherDirectory), identity: identity)
            _ = tier.save(state: Qwen4ExpModel.State.persistenceFixture(tokens: base.count), tokens: base)
        }
        do {
            let other = PersistentPrefixIdentity(components: ["fixture": "another build"])
            let tier = try PersistentPrefixCache(configuration: configuration(otherDirectory), identity: other)
            c.expect("another build's files are removed on open",
                tier.maintenance.otherBuilds == 2 && stateFiles(otherDirectory).isEmpty && tier.storedStates == 0)
            c.equal("its save writes every row", tier.save(state: fixture, tokens: base).reusedBytes, 0)
        }

        // A prefix other conversations start with is saved as shared, and a
        // new prompt finds the longest start it has in common with a state.
        let sharedDirectory = root.appendingPathComponent("shared")
        do {
            let tier = try PersistentPrefixCache(configuration: configuration(sharedDirectory), identity: identity)
            c.equal("an empty directory shares no prefix", tier.longestCommonPrefix(with: base), 0)
            let prefix = Array(base.prefix(1200))
            let saved = tier.save(state: Qwen4ExpModel.State.persistenceFixture(tokens: prefix.count),
                tokens: prefix, shared: true)
            c.equal("a shared prefix is saved", saved.outcome, .saved)
            c.equal("it counts as a shared state", tier.storedSharedStates, 1)
            c.equal("a conversation that starts with it shares all of it", tier.longestCommonPrefix(with: base), prefix.count)
            c.equal("a prompt that diverges inside it shares up to the divergence",
                tier.longestCommonPrefix(with: Array(prefix.prefix(700)) + [7]), 700)
            c.equal("an unrelated prompt shares nothing", tier.longestCommonPrefix(with: ids(1500, seed: 8)), 0)
        }

        // The same boundary can already hold a conversation's own checkpoint:
        // the engine writes one at a prompt's last resume boundary, which is
        // also where a long system prompt's last complete pass ends. That write
        // comes first and without the flag, so the shared save that follows
        // finds the ids present. It must upgrade the head: the flag has to
        // reach the file, or a later save removes the head as a redundant
        // ancestor and no other conversation can start from it.
        let upgradeDirectory = root.appendingPathComponent("shared-upgrade")
        let upgradePrefix = Array(base.prefix(1200))
        var upgradeExpected: [String: String] = [:]
        do {
            let tier = try PersistentPrefixCache(configuration: configuration(upgradeDirectory), identity: identity)
            let checkpoint = Qwen4ExpModel.State.persistenceFixture(tokens: upgradePrefix.count)
            upgradeExpected = digests(checkpoint)
            let first = tier.save(state: checkpoint, tokens: upgradePrefix)
            c.expect("a checkpoint at the boundary is written without the flag",
                first.outcome == .saved && tier.storedSharedStates == 0 && tier.value(of: head(upgradePrefix)) == .oneOff)
            let upgraded = tier.save(state: checkpoint, tokens: upgradePrefix, shared: true)
            c.equal("the shared save that follows upgrades the head", upgraded.outcome, .saved)
            c.expect("rewriting the head references its rows instead of writing them again",
                upgraded.reusedBytes > 0 && !upgraded.compacted)
            c.expect("and writes less than the checkpoint did", upgraded.bytes < first.bytes,
                "\(upgraded.bytes) vs \(first.bytes)")
            c.equal("the head is shared", tier.storedSharedStates, 1)
            c.equal("the upgraded head restores exactly", try restore(tier, upgradePrefix).map(digests), upgradeExpected)
            guard let grown = try restore(tier, upgradePrefix) else {
                c.expect("the upgraded head is a candidate", false)
                return c.report()
            }
            grown.extendPersistenceFixture(to: child.count)
            _ = tier.save(state: grown, tokens: child)
            grown.extendPersistenceFixture(to: grand.count)
            _ = tier.save(state: grown, tokens: grand)
            c.expect("two later turns keep it instead of removing it as an ancestor",
                tier.value(of: head(upgradePrefix)) != nil && tier.storedSharedStates == 1)
            c.equal("its rows still restore exactly", try restore(tier, upgradePrefix).map(digests), upgradeExpected)
            // A shared prefix that is not written leaves no counter behind, so
            // the reason has to reach the tier's event stream.
            var sharedReports: [String] = []
            tier.onEvent = { sharedReports.append($0) }
            let short = Array(upgradePrefix.prefix(999))
            c.equal("a shared prefix below the write minimum is skipped",
                tier.save(state: Qwen4ExpModel.State.persistenceFixture(tokens: short.count), tokens: short,
                    shared: true).outcome, .skipped("shorter than 1000 tokens"))
            c.expect("and it says why", sharedReports.contains {
                $0.contains("kept no shared 999-token prefix: shorter than 1000 tokens") })
        }
        do {
            let tier = try PersistentPrefixCache(configuration: configuration(upgradeDirectory), identity: identity)
            c.expect("a reopened directory reads the flag from the head, not from memory",
                tier.storedSharedStates == 1 && tier.storedStates == 3)
            c.equal("and restores the upgraded head", try restore(tier, upgradePrefix).map(digests), upgradeExpected)
        }

        // A state unused past the maximum age is removed on open.
        let expiryDirectory = root.appendingPathComponent("expiry")
        do {
            let tier = try PersistentPrefixCache(configuration: configuration(expiryDirectory), identity: identity)
            _ = tier.save(state: Qwen4ExpModel.State.persistenceFixture(tokens: base.count), tokens: base)
        }
        let old = Int(Date().timeIntervalSince1970) - 31 * 86_400
        var times = [timeval(tv_sec: old, tv_usec: 0), timeval(tv_sec: old, tv_usec: 0)]
        utimes(expiryDirectory.appendingPathComponent(head(base)).path, &times)
        do {
            let tier = try PersistentPrefixCache(configuration: configuration(expiryDirectory, maxAge: nil), identity: identity)
            c.equal("without a maximum age an old state stays", tier.storedStates, 1)
        }
        do {
            let tier = try PersistentPrefixCache(configuration: configuration(expiryDirectory), identity: identity)
            c.expect("an old state is removed with its rows on open", tier.maintenance.expired == 1
                && tier.maintenance.orphanSegments == 1 && stateFiles(expiryDirectory).isEmpty)
        }

        // A lowered quota applies on open, and one-off states go first even
        // when they are the newest.
        let quotaDirectory = root.appendingPathComponent("quota")
        let oneOff = ids(1500, seed: 9)
        var total: Int64 = 0
        do {
            let tier = try PersistentPrefixCache(configuration: configuration(quotaDirectory), identity: identity)
            let conversation = Qwen4ExpModel.State.persistenceFixture(tokens: base.count)
            _ = tier.save(state: conversation, tokens: base)
            conversation.extendPersistenceFixture(to: child.count)
            c.expect("a state grown after its save writes only new rows", tier.save(state: conversation, tokens: child).reusedBytes > 0)
            _ = tier.save(state: Qwen4ExpModel.State.persistenceFixture(tokens: oneOff.count), tokens: oneOff)
            c.equal("a request nobody continued is one-off", tier.value(of: head(oneOff)), .oneOff)
            total = tier.storedBytes
        }
        do {
            let tier = try PersistentPrefixCache(configuration: configuration(quotaDirectory, quota: total - 1), identity: identity)
            c.expect("a lowered quota removes the one-off state on open",
                tier.maintenance.overQuota == 1 && tier.value(of: head(oneOff)) == nil
                    && tier.value(of: head(child)) == .conversation && tier.storedBytes < total)
            c.equal("deleting a conversation removes its states", tier.removeStates(overlapping: child), 2)
            c.expect("and the rows only they used", tier.storedStates == 0 && stateFiles(quotaDirectory).isEmpty)
            _ = tier.save(state: Qwen4ExpModel.State.persistenceFixture(tokens: oneOff.count), tokens: oneOff)
            let report = try PersistentPrefixCache.inspect(directory: quotaDirectory)
            c.expect("inspection lists states while the directory is in use", report.inUse && report.states.count == 1
                && report.segments == 1 && report.states.first?.tokens == oneOff.count
                && report.totalBytes == tier.storedBytes)
            c.expect("a directory in use cannot be cleared from outside",
                (try? PersistentPrefixCache.clear(directory: quotaDirectory)) == nil)
            c.equal("clearing removes every state file", tier.clear(), 2)
            c.expect("nothing remains", tier.storedStates == 0 && stateFiles(quotaDirectory).isEmpty)
            _ = tier.save(state: Qwen4ExpModel.State.persistenceFixture(tokens: oneOff.count), tokens: oneOff)
        }
        let cleared = try PersistentPrefixCache.clear(directory: quotaDirectory)
        c.expect("an unused directory clears from outside", cleared.files == 2 && stateFiles(quotaDirectory).isEmpty)
        c.expect("inspection of an unused directory", try PersistentPrefixCache.inspect(directory: quotaDirectory).inUse == false)

        // A rewind below the persisted boundary may rewrite rows, so the
        // lineage goes; a rewind to the boundary keeps it.
        do {
            let tier = try PersistentPrefixCache(configuration: configuration(root.appendingPathComponent("rewind")),
                identity: identity)
            let state = Qwen4ExpModel.State.persistenceFixture(tokens: 1000)
            let early = state.checkpoint()
            state.extendPersistenceFixture(to: base.count)
            _ = tier.save(state: state, tokens: base)
            let late = state.checkpoint()
            state.extendPersistenceFixture(to: 1600)
            try state.restoreChecked(late)
            c.equal("a rewind to the persisted boundary keeps the lineage", state.persistedLineage?.tokenCount, base.count)
            try state.restoreChecked(early)
            c.expect("a rewind below it clears the lineage", state.persistedLineage == nil)
            state.extendPersistenceFixture(to: child.count)
            c.equal("its next save writes every row", tier.save(state: state, tokens: base + Array(child.dropFirst(base.count)))
                .reusedBytes, 0)
        }
        c.measure("base_write_bytes", Double(baseBytes))
        c.measure("continued_write_bytes", Double(deltaBytes))
        c.measure("continued_reused_bytes", Double(reusedBytes))
        c.measure("fixture_sequence_bytes", Double(fixture.allocatedSequenceBytes))
        return c.report()
    }
}
