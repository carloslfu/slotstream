// Persistent prefix cache: writing a committed state as a head plus, when it
// has rows no persisted segment holds, one new segment.

import Foundation
import MLX

extension PersistentPrefixCache {
    private struct LiveSequence {
        var record: PersistentPrefixFile.SequenceRecord
        let buffer: MLXArray?
    }

    private struct Plan {
        var payloads: [PersistentPrefixFile.Payload] = []
        var arrays: [PersistentPrefixFile.ArrayRecord] = []
        var sequences: [LiveSequence] = []
        var header: PersistentPrefixFile.Head
    }

    /// Write `state`, which consumed exactly `tokens`, unless a head already
    /// holds the same ids with at least the same draft state. Rows below the
    /// state's lineage boundary are referenced, not written. Never throws: a
    /// state that cannot be written leaves the request and memory unchanged.
    /// `shared` marks a state written inside a prompt at a boundary other
    /// conversations start with; later saves of conversations that extend it
    /// keep it, and it is classed by how many lineages start with it.
    package func save(state: Qwen4ExpModel.State, tokens: [Int], shared: Bool = false, prefillChunk: Int? = nil) -> SaveResult {
        operations.withLock { saveHoldingOperations(state: state, tokens: tokens, shared: shared, prefillChunk: prefillChunk) }
    }

    private func saveHoldingOperations(state: Qwen4ExpModel.State, tokens: [Int], shared: Bool, prefillChunk: Int?) -> SaveResult {
        let start = RuntimeClock.now()
        var removed = 0, written: Int64 = 0, reused: Int64 = 0, compacted = false
        func finish(_ outcome: SaveOutcome) -> SaveResult {
            let saved = outcome == .saved
            // A shared prefix that is not written is the one outcome no counter
            // names, and a caller cannot see it in the request's statistics
            // either. Report why, so a loss is visible in the server log.
            if shared {
                switch outcome {
                case .skipped(let why): report("kept no shared \(tokens.count)-token prefix: \(why)")
                case .failed(let why): report("failed to write the shared \(tokens.count)-token prefix: \(why)")
                default: break
                }
            }
            lock.withLock {
                switch outcome {
                case .saved:
                    counters.saves += 1
                    counters.writtenBytes += written
                    counters.reusedBytes += reused
                    if reused > 0 { counters.deltaSaves += 1 }
                    if compacted { counters.compactions += 1 }
                    if shared { counters.sharedSaves += 1 }
                case .skipped: counters.skippedSaves += 1
                case .failed: counters.failedSaves += 1
                case .present: break
                }
            }
            return SaveResult(outcome: outcome, tokens: tokens.count, bytes: saved ? written : 0,
                reusedBytes: saved ? reused : 0, compacted: saved && compacted,
                seconds: RuntimeClock.seconds(since: start), removedFiles: removed)
        }
        guard tokens.count >= configuration.minimumTokens else {
            return finish(.skipped("shorter than \(configuration.minimumTokens) tokens"))
        }
        removed += removeExpired()
        let includeDraft = state.hasValidMTP
        var plan: Plan
        do {
            plan = try Self.plan(state: state, tokens: tokens, identity: identity.digest, includeDraft: includeDraft)
        } catch { return finish(.skipped("\(error)")) }
        let name = PersistentPrefixFile.fileName(identity: identity.digest, tokens: tokens)
        // A head already holding these exact ids is a no-op only when it also
        // carries this save's shared flag. The engine writes a conversation's
        // own checkpoint at the same boundary a long system prompt's shared
        // prefix would use whenever that prompt's last pass end is also its
        // last resume boundary, and that checkpoint write comes first, without
        // the flag. Answering `.present` there would leave the head classed as
        // the conversation's own, so a later save would remove it as a
        // redundant ancestor and no other conversation could start from it.
        // Rewriting the head is what puts the flag in the file.
        if let existing = lock.withLock({ heads.first { $0.file == name } }), existing.tokens == tokens, existing.prefillChunk == prefillChunk,
           existing.hasDraft || !includeDraft, existing.shared || !shared {
            touch(name)
            return finish(.present)
        }

        // Rows below the lineage boundary equal that head's rows, so they can
        // be referenced. The head name binds the lineage to these exact ids.
        var parent: [String: PersistentPrefixFile.SequenceRecord]?
        if let lineage = state.persistedLineage, lineage.tier == instance, lineage.tokenCount <= tokens.count,
           lineage.head == PersistentPrefixFile.fileName(identity: identity.digest,
                tokens: tokens.prefix(lineage.tokenCount)) {
            parent = lineage.sequences
        }
        let known = indexedSegments
        let reuse = PersistentPrefixPolicy.reuse(child: plan.sequences.map(\.record), parent: parent,
            segmentExists: { known[$0]?.identity == self.identity.digest }, maximumSegments: maximumSegments)
        compacted = reuse.compacted

        let segmentName = PersistentPrefixFile.newSegmentName()
        var segmentPayloads: [PersistentPrefixFile.Payload] = []
        var rowRecords: [PersistentPrefixFile.RowsRecord] = []
        var sequences: [PersistentPrefixFile.SequenceRecord] = []
        for live in plan.sequences {
            var record = live.record
            guard let dtype = PersistentPrefixFile.dtype(named: record.dtype) else {
                return finish(.skipped("cannot persist \(record.name)"))
            }
            var extents = reuse.extents[record.name] ?? []
            for extent in extents {
                reused += Int64(PersistentPrefixFile.rows(leading: record.leading, trailing: record.trailing,
                    itemBytes: dtype.size, count: extent.end - extent.start)?.bytes ?? 0)
            }
            let first = reuse.firstNewRow[record.name] ?? record.base
            if record.end > first {
                guard let buffer = live.buffer,
                      let view = Self.rows(of: buffer, axis: record.axis, (first - record.base) ..< record.live),
                      let geometry = PersistentPrefixFile.rows(leading: record.leading, trailing: record.trailing,
                        itemBytes: dtype.size, count: record.end - first) else {
                    return finish(.skipped("cannot persist rows of \(record.name)"))
                }
                segmentPayloads.append(.array(view))
                rowRecords.append(.init(name: record.name, dtype: record.dtype, leading: record.leading,
                    trailing: record.trailing, start: first, end: record.end, offset: 0,
                    byteCount: Int64(geometry.bytes), crc32: 0))
                extents.append(.init(segment: segmentName, start: first, end: record.end))
            }
            record.extents = extents
            sequences.append(record)
        }

        let overhead = Int64(PersistentPrefixFile.magic.count + PersistentPrefixFile.footerBytes + 65_536)
        let extentCount = sequences.reduce(0) { $0 + $1.extents.count }
        let segmentEstimate = rowRecords.isEmpty ? 0
            : rowRecords.reduce(overhead) { $0 + $1.byteCount + 512 }
        let headEstimate = plan.arrays.reduce(overhead) { $0 + $1.byteCount + 512 }
            + Int64(512 * (sequences.count + extentCount))
        let estimate = headEstimate + segmentEstimate
        let (redundant, strictPrefixes) = lock.withLock { () -> ([PersistentPrefixEntry], Int) in
            (PersistentPrefixPolicy.redundantAncestors(heads, identity: identity.digest, by: tokens),
             heads.filter { $0.identity == identity.digest && $0.tokens.count < tokens.count
                && tokens.starts(with: $0.tokens) }.count)
        }
        let continued = parent != nil || strictPrefixes > 0
        let now = Self.now()
        let victims = lock.withLock {
            PersistentPrefixPolicy.evictionVictims(heads, segments: segments.mapValues(\.bytes),
                identity: identity.digest, quota: configuration.maxBytes, incoming: estimate, pinned: reuse.segments,
                freed: Set(redundant.map(\.file) + [name]), now: now, maxAge: configuration.maxAge)
        }
        guard let victims else {
            return finish(.skipped("a \(Self.megabytes(estimate)) write exceeds the \(Self.megabytes(configuration.maxBytes)) quota"))
        }
        let reclaimed = victims.reduce(Int64(0)) { $0 + $1.bytes }
        guard Self.availableBytes(configuration.directory) + reclaimed >= estimate + Self.minimumFreeBytes else {
            return finish(.skipped("less than \(Self.megabytes(estimate + Self.minimumFreeBytes)) free on the volume"))
        }
        if !victims.isEmpty {
            for victim in victims {
                report("evicted \(victim.tokens.count)-token state \(victim.file) (\(Self.megabytes(victim.bytes)))")
            }
            removed += remove(heads: victims.map(\.file), .evicted, keeping: reuse.segments)
        }

        let directory = configuration.directory
        func temporary(_ file: String) -> String {
            directory.appendingPathComponent(".\(file).\(getpid()).\(UUID().uuidString).tmp").path
        }
        var newSegment: PersistentPrefixSegmentEntry?
        let entry: PersistentPrefixEntry
        do {
            if !segmentPayloads.isEmpty {
                let temp = temporary(segmentName)
                defer { unlink(temp) }
                var placedRows = rowRecords
                let size = try PersistentPrefixFile.writeContainer(to: temp, payloads: segmentPayloads,
                    expected: rowRecords.map(\.byteCount)) { placed in
                    for i in placedRows.indices {
                        placedRows[i].offset = placed[i].offset
                        placedRows[i].crc32 = placed[i].crc32
                    }
                    return try PersistentPrefixFile.encodeHeader(PersistentPrefixFile.Segment(
                        format: PersistentPrefixFile.formatVersion, kind: .segment, identity: identity.digest,
                        rows: placedRows))
                }
                guard rename(temp, path(segmentName)) == 0 else {
                    throw ModelError("cannot rename \(temp): \(String(cString: strerror(errno)))")
                }
                let segment = PersistentPrefixSegmentEntry(file: segmentName, identity: identity.digest, bytes: size,
                    rows: Dictionary(uniqueKeysWithValues: placedRows.map { ($0.name, $0) }))
                // Indexed before its head: collection runs only under `operations`.
                lock.withLock { segments[segmentName] = segment }
                newSegment = segment
                written += size
            }
            var arrays = plan.arrays
            var header = plan.header
            header.continued = continued
            header.shared = shared ? true : nil
            header.prefillChunk = prefillChunk
            header.sequences = sequences
            let temp = temporary(name)
            defer { unlink(temp) }
            let size = try PersistentPrefixFile.writeContainer(to: temp, payloads: plan.payloads,
                expected: arrays.map(\.byteCount)) { placed in
                for i in arrays.indices {
                    arrays[i].offset = placed[i].offset
                    arrays[i].crc32 = placed[i].crc32
                }
                header.arrays = arrays
                return try PersistentPrefixFile.encodeHeader(header)
            }
            guard rename(temp, path(name)) == 0 else {
                throw ModelError("cannot rename \(temp): \(String(cString: strerror(errno)))")
            }
            written += size
            entry = PersistentPrefixEntry(file: name, identity: identity.digest, tokens: tokens, bytes: size,
                lastUsed: Self.now(), sequenceBytes: header.sequenceBytes, residentBytes: header.residentBytes,
                hasDraft: header.draft != nil, continued: continued, shared: shared, prefillChunk: prefillChunk,
                sequences: Dictionary(uniqueKeysWithValues: sequences.map { ($0.name, $0) }))
        } catch {
            if let newSegment {
                unlink(path(newSegment.file))
                lock.withLock { segments[newSegment.file] = nil }
            }
            return finish(.failed("\(error)"))
        }
        lock.withLock {
            heads.removeAll { $0.file == name }
            heads.append(entry)
        }
        state.persistedLineage = PersistentPrefixLineage(tier: instance, head: name, tokenCount: tokens.count,
            sequences: entry.sequences)
        let older = redundant.map(\.file).filter { $0 != name }
        removed += remove(heads: older, .replaced)
        let result = finish(.saved)
        report((shared ? "saved shared \(tokens.count)-token prefix (" : "saved \(tokens.count) tokens (")
            + "\(Self.megabytes(written)) written"
            + (reused > 0 ? ", \(Self.megabytes(reused)) of rows reused" : "")
            + (compacted ? ", rows rewritten" : "") + ") in \(String(format: "%.2f", result.seconds)) s"
            + (removed > 0 ? ", removed \(removed) older file\(removed == 1 ? "" : "s")" : ""))
        return result
    }

    static func rows(of buffer: MLXArray, axis: Int, _ range: Range<Int>) -> MLXArray? {
        guard axis >= 0, axis < buffer.ndim, range.lowerBound >= 0, range.upperBound <= buffer.dim(axis) else { return nil }
        switch axis {
        case 0: return buffer[range]
        case 1: return buffer[0..., range]
        case 2: return buffer[0..., 0..., range]
        default: return nil
        }
    }

    private static func plan(state s: Qwen4ExpModel.State, tokens: [Int], identity: String,
                             includeDraft: Bool) throws -> Plan {
        guard s.committedBoundaryValid, s.tokenCount == tokens.count, !s.recordingEnabled,
              Set(s.kv.keys) == Set(s.indexer.keys),
              s.kv.values.allSatisfy({ $0.offset == s.tokenCount }),
              s.indexer.values.allSatisfy({ $0.offset == s.tokenCount }) else {
            throw ModelError("state is not at a committed boundary")
        }
        guard s.linear.values.allSatisfy({ !$0.record && $0.convStates.isEmpty && $0.ssmStates.isEmpty
            && $0.pleConvStates.isEmpty }) else {
            throw ModelError("state is recording a speculative pass")
        }
        guard tokens.allSatisfy({ $0 >= 0 && $0 <= Int(Int32.max) }) else {
            throw ModelError("token ids are outside the persisted range")
        }
        var plan = Plan(header: PersistentPrefixFile.Head(format: PersistentPrefixFile.formatVersion, kind: .head,
            identity: identity, tokenCount: tokens.count, continued: false, compactStateWindows: s.compactStateWindows,
            ngramContext: s.ngramCtx, linear: [], attention: [], draft: nil, arrays: [], sequences: [],
            sequenceBytes: 0, residentBytes: 0))
        plan.payloads.append(.host(PersistentPrefixFile.tokenBytes(tokens)))
        plan.arrays.append(.init(name: "tokens", dtype: "int32", shape: [tokens.count], axis: 0, length: tokens.count,
            offset: 0, byteCount: Int64(tokens.count * 4), crc32: 0))
        func fixed(_ name: String, _ buffer: MLXArray?) throws {
            guard let buffer else { return }
            let shape = buffer.shape
            guard let dtype = PersistentPrefixFile.name(of: buffer.dtype), let first = shape.first,
                  let layout = PersistentPrefixFile.layout(shape: shape, axis: 0, length: first,
                    itemBytes: buffer.dtype.size) else {
                throw ModelError("cannot persist \(name): \(buffer.dtype) \(shape)")
            }
            plan.payloads.append(.array(buffer))
            plan.arrays.append(.init(name: name, dtype: dtype, shape: shape, axis: 0, length: first, offset: 0,
                byteCount: Int64(layout.logicalBytes), crc32: 0))
            plan.header.residentBytes += layout.capacityBytes
        }
        func sequence(_ name: String, _ buffer: MLXArray?, axis: Int, base: Int, live: Int) throws {
            guard let buffer else {
                guard live == 0 else { throw ModelError("cannot persist \(name): \(live) live rows without storage") }
                return
            }
            let shape = buffer.shape
            guard let dtype = PersistentPrefixFile.name(of: buffer.dtype), base >= 0,
                  let layout = PersistentPrefixFile.layout(shape: shape, axis: axis, length: live,
                    itemBytes: buffer.dtype.size) else {
                throw ModelError("cannot persist \(name): \(buffer.dtype) \(shape) with \(live) live rows")
            }
            plan.sequences.append(LiveSequence(record: .init(name: name, dtype: dtype, shape: shape, axis: axis,
                base: base, live: live, extents: []), buffer: buffer))
            plan.header.sequenceBytes += layout.capacityBytes
            plan.header.residentBytes += layout.capacityBytes
        }
        func indexer(_ cache: IndexerCache, _ prefix: String) throws -> PersistentPrefixFile.IndexerRecord {
            let storage = cache.persistedStorage()
            // Only completed blocks are pooled. A partial block would change as
            // tokens arrive, and a later save would reference its stale row.
            guard storage.pooledRatio >= 1, storage.pooledCount <= storage.offset / storage.pooledRatio else {
                throw ModelError("cannot persist \(prefix): pooled rows extend past completed blocks")
            }
            try sequence("\(prefix).raw", storage.raw, axis: 1, base: storage.rawBase,
                live: storage.offset - storage.rawBase)
            try sequence("\(prefix).pooled", storage.pooled, axis: 1, base: 0, live: storage.pooledCount)
            return .init(offset: storage.offset, rawBase: storage.rawBase, compactRaw: cache.compactRaw,
                pooledCount: storage.pooledCount, pooledRatio: storage.pooledRatio)
        }
        for layer in s.linear.keys.sorted() {
            let cache = s.linear[layer]!
            try fixed("linear.\(layer).conv", cache.convState)
            try fixed("linear.\(layer).ssm", cache.ssmState)
            try fixed("linear.\(layer).ple", cache.pleConvState)
            plan.header.linear.append(.init(layer: layer, ngramContext: cache.ngramCtx))
        }
        for layer in s.kv.keys.sorted() {
            let kv = s.kv[layer]!
            try sequence("kv.\(layer).keys", kv.keys, axis: 2, base: 0, live: kv.offset)
            try sequence("kv.\(layer).values", kv.values, axis: 2, base: 0, live: kv.offset)
            plan.header.attention.append(.init(layer: layer, kvOffset: kv.offset,
                indexer: try indexer(s.indexer[layer]!, "indexer.\(layer)")))
        }
        if includeDraft, let mtp = s.mtp, let row = s.lastMulti {
            try sequence("draft.kv.keys", mtp.kv.keys, axis: 2, base: 0, live: mtp.kv.offset)
            try sequence("draft.kv.values", mtp.kv.values, axis: 2, base: 0, live: mtp.kv.offset)
            let record = try indexer(mtp.indexer, "draft.indexer")
            try fixed("draft.last_multi", row)
            plan.header.draft = .init(kvOffset: mtp.kv.offset, indexer: record)
        }
        return plan
    }
}
