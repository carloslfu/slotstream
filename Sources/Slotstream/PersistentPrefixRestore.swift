// Persistent prefix cache: restoring a head and the segment rows it names
// into a new state with the saved representation.

import Foundation
import MLX

extension PersistentPrefixCache {
    /// Read `entry` into a new state owned by `modelIdentity`. A head or
    /// segment that fails a check is removed, with every head that uses it,
    /// before the error is rethrown; an allocation or I/O failure keeps the
    /// files for a later request.
    package func restore(_ entry: PersistentPrefixEntry, layout: PersistentPrefixLayout, modelIdentity: UUID?,
                         includeDraft: Bool) throws -> RestoreResult {
        try operations.withLock {
            let start = RuntimeClock.now()
            do {
                let (state, bytes) = try read(entry, layout: layout, modelIdentity: modelIdentity,
                    includeDraft: includeDraft)
                touch(entry.file)
                let seconds = RuntimeClock.seconds(since: start)
                lock.withLock {
                    counters.restores += 1
                    counters.restoredTokens += entry.tokens.count
                    counters.restoredBytes += bytes
                }
                report("restored \(entry.tokens.count) tokens (\(Self.megabytes(bytes))) in \(String(format: "%.2f", seconds)) s")
                return RestoreResult(state: state, tokens: entry.tokens.count, bytes: bytes, seconds: seconds)
            } catch let error as PersistentPrefixFileError {
                let files = lock.withLock {
                    heads.filter { $0.file == entry.file || !$0.segments.isDisjoint(with: error.segments) }.map(\.file)
                }
                for segment in error.segments {
                    unlink(path(segment))
                    lock.withLock {
                        if segments.removeValue(forKey: segment) != nil { counters.removedSegments += 1 }
                    }
                }
                remove(heads: files, .rejected)
                lock.withLock { counters.restoreFailures += 1 }
                report("removed \(files.count) unusable state\(files.count == 1 ? "" : "s"): \(error)")
                throw error
            } catch {
                lock.withLock { counters.restoreFailures += 1 }
                throw error
            }
        }
    }

    private func read(_ entry: PersistentPrefixEntry, layout expected: PersistentPrefixLayout, modelIdentity: UUID?,
                      includeDraft: Bool) throws -> (Qwen4ExpModel.State, Int64) {
        typealias Failure = PersistentPrefixFileError
        let fd = open(path(entry.file), O_RDONLY | O_CLOEXEC)
        guard fd >= 0 else { throw Failure("cannot open: \(String(cString: strerror(errno)))") }
        defer { close(fd) }
        var info = stat()
        guard fstat(fd, &info) == 0, Int64(info.st_size) == entry.bytes else { throw Failure("file changed on disk") }
        let (data, payloadEnd) = try PersistentPrefixFile.readHeaderData(fd, size: entry.bytes)
        guard let header = try? JSONDecoder().decode(PersistentPrefixFile.Head.self, from: data),
              header.format == PersistentPrefixFile.formatVersion, header.kind == .head,
              header.identity == identity.digest else {
            throw Failure("file identity changed")
        }
        try Self.validate(header, payloadEnd: payloadEnd)
        guard header.prefillChunk == entry.prefillChunk else { throw Failure("producing prefill arithmetic changed") }
        guard try Self.readTokens(fd, header: header) == entry.tokens else { throw Failure("token ids changed") }
        guard header.linear.map(\.layer).sorted() == expected.linearLayers.sorted(),
              header.attention.map(\.layer).sorted() == expected.attentionLayers.sorted(),
              Set(header.linear.map(\.layer)).count == header.linear.count,
              Set(header.attention.map(\.layer)).count == header.attention.count else {
            throw Failure("layer structure differs from the loaded model")
        }
        let fixed = Dictionary(header.arrays.map { ($0.name, $0) }, uniquingKeysWith: { first, _ in first })
        let sequences = Dictionary(header.sequences.map { ($0.name, $0) }, uniquingKeysWith: { first, _ in first })
        let known = indexedSegments
        var readers: [String: Int32] = [:]
        defer { for reader in readers.values { close(reader) } }
        var restored: [String: PersistentPrefixFile.SequenceRecord] = [:]
        var bytes = Int64(header.tokenCount * 4)
        func array(_ name: String, rank: Int?) throws -> MLXArray? {
            guard let record = fixed[name] else { return nil }
            guard record.axis == 0, record.shape.first == record.length,
                  rank.map({ record.shape.count == $0 }) ?? true else {
                throw Failure("\(name) does not match its recorded state")
            }
            bytes += record.byteCount
            return try Self.readArray(fd, record)
        }
        func rows(_ name: String, axis: Int, base: Int, live: Int, rank: Int) throws -> MLXArray? {
            guard let record = sequences[name] else { return nil }
            guard record.axis == axis, record.base == base, record.live == live, record.shape.count == rank else {
                throw Failure("\(name) does not match its recorded state")
            }
            let (array, read) = try readSequence(record, segments: known, readers: &readers)
            bytes += read
            restored[name] = record
            return array
        }
        func indexer(_ record: PersistentPrefixFile.IndexerRecord, _ prefix: String,
                     committed: Int) throws -> IndexerCache.PersistedStorage {
            guard record.offset == committed, record.rawBase >= 0, record.rawBase <= record.offset,
                  record.compactRaw || record.rawBase == 0, record.pooledRatio >= 1, record.pooledCount >= 0,
                  record.pooledCount <= record.offset / record.pooledRatio else {
                throw Failure("\(prefix) ranges are invalid")
            }
            let raw = try rows("\(prefix).raw", axis: 1, base: record.rawBase, live: record.offset - record.rawBase,
                rank: 3)
            let pooled = try rows("\(prefix).pooled", axis: 1, base: 0, live: record.pooledCount, rank: 3)
            guard raw != nil || record.offset == record.rawBase, pooled != nil || record.pooledCount == 0 else {
                throw Failure("\(prefix) rows are missing")
            }
            return .init(raw: raw, pooled: pooled, offset: record.offset, rawBase: record.rawBase,
                pooledCount: record.pooledCount, pooledRatio: record.pooledRatio)
        }
        let state = Qwen4ExpModel.State()
        state.modelIdentity = modelIdentity
        state.tokenCount = header.tokenCount
        state.ngramCtx = header.ngramContext
        state.committedBoundaryValid = true
        state.compactStateWindows = header.compactStateWindows
        for record in header.linear {
            let cache = LinearCache()
            cache.convState = try array("linear.\(record.layer).conv", rank: nil)
            cache.ssmState = try array("linear.\(record.layer).ssm", rank: nil)
            cache.pleConvState = try array("linear.\(record.layer).ple", rank: nil)
            cache.ngramCtx = record.ngramContext
            state.linear[record.layer] = cache
        }
        for record in header.attention {
            guard record.kvOffset == header.tokenCount, record.indexer.compactRaw == expected.compactIndexerRaw else {
                throw Failure("attention layer \(record.layer) is not at the committed boundary")
            }
            let kv = KVCache()
            kv.keys = try rows("kv.\(record.layer).keys", axis: 2, base: 0, live: record.kvOffset, rank: 4)
            kv.values = try rows("kv.\(record.layer).values", axis: 2, base: 0, live: record.kvOffset, rank: 4)
            kv.offset = record.kvOffset
            guard (kv.keys != nil) == (kv.values != nil), kv.keys != nil || record.kvOffset == 0 else {
                throw Failure("attention layer \(record.layer) rows are missing")
            }
            state.kv[record.layer] = kv
            let index = IndexerCache(compactRaw: record.indexer.compactRaw)
            index.restorePersisted(try indexer(record.indexer, "indexer.\(record.layer)", committed: header.tokenCount))
            state.indexer[record.layer] = index
        }
        if includeDraft, let draft = header.draft {
            guard header.tokenCount > 0, draft.kvOffset == header.tokenCount - 1, !draft.indexer.compactRaw else {
                throw Failure("draft cache is not aligned")
            }
            let mtp = MTPState()
            mtp.kv.keys = try rows("draft.kv.keys", axis: 2, base: 0, live: draft.kvOffset, rank: 4)
            mtp.kv.values = try rows("draft.kv.values", axis: 2, base: 0, live: draft.kvOffset, rank: 4)
            mtp.kv.offset = draft.kvOffset
            mtp.indexer.restorePersisted(try indexer(draft.indexer, "draft.indexer", committed: draft.kvOffset))
            state.mtp = mtp
            state.lastMulti = try array("draft.last_multi", rank: 3)
            guard state.hasValidMTP else { throw Failure("draft cache is not aligned") }
        }
        do { try state.validatePrefixFork() } catch { throw Failure("\(error)") }
        // Only the arrays this state holds: a plain restore carries no draft rows.
        state.persistedLineage = PersistentPrefixLineage(tier: instance, head: entry.file,
            tokenCount: header.tokenCount, sequences: restored)
        return (state, bytes)
    }

    /// One sequence array assembled from its extents into a buffer of the
    /// recorded allocated shape, dead capacity zeroed.
    private func readSequence(_ record: PersistentPrefixFile.SequenceRecord,
                              segments known: [String: PersistentPrefixSegmentEntry],
                              readers: inout [String: Int32]) throws -> (MLXArray, Int64) {
        typealias Failure = PersistentPrefixFileError
        guard let dtype = PersistentPrefixFile.dtype(named: record.dtype),
              let layout = PersistentPrefixFile.layout(shape: record.shape, axis: record.axis, length: record.live,
                itemBytes: dtype.size),
              PersistentPrefixPolicy.tiles(record) else {
            throw Failure("\(record.name) has an invalid layout")
        }
        let span = layout.rowBytes * record.shape[record.axis]
        let memory = try Self.allocate(layout.capacityBytes, for: record.name)
        var read: Int64 = 0
        do {
            for extent in record.extents {
                guard let segment = known[extent.segment], segment.identity == identity.digest,
                      let rows = segment.rows[record.name], rows.dtype == record.dtype,
                      rows.leading == record.leading, rows.trailing == record.trailing,
                      rows.start <= extent.start, extent.end <= rows.end,
                      Int64(layout.leading) * Int64(rows.end - rows.start) * Int64(layout.rowBytes) == rows.byteCount else {
                    throw Failure("segment \(extent.segment) does not hold \(record.name) rows \(extent.start)..<\(extent.end)",
                        segments: [extent.segment])
                }
                let count = rows.end - rows.start
                let skip = extent.start - rows.start
                let takeBytes = (extent.end - extent.start) * layout.rowBytes
                func destination(_ chunk: Int) -> UnsafeMutableRawPointer {
                    memory.advanced(by: chunk * span + (extent.start - record.base) * layout.rowBytes)
                }
                do {
                    let reader = try Self.reader(for: extent.segment, directory: configuration.directory,
                        readers: &readers)
                    if skip == 0 && extent.end == rows.end {
                        var crc: UInt32 = 0
                        for chunk in 0 ..< layout.leading {
                            try PersistentPrefixFile.readAll(reader, destination(chunk), takeBytes,
                                at: rows.offset + Int64(chunk * count * layout.rowBytes))
                            crc = PersistentPrefixFile.crc32(destination(chunk), takeBytes, seed: crc)
                        }
                        guard crc == rows.crc32 else {
                            throw Failure("\(record.name) checksum mismatch in segment \(extent.segment)")
                        }
                    } else {
                        // Rows released since the segment was written, such as
                        // compacted indexer history: check all, keep the live part.
                        let scratch = try Self.allocate(Int(rows.byteCount), for: record.name)
                        defer { free(scratch) }
                        try PersistentPrefixFile.readAll(reader, scratch, Int(rows.byteCount), at: rows.offset)
                        guard PersistentPrefixFile.crc32(scratch, Int(rows.byteCount)) == rows.crc32 else {
                            throw Failure("\(record.name) checksum mismatch in segment \(extent.segment)")
                        }
                        for chunk in 0 ..< layout.leading {
                            memcpy(destination(chunk), scratch.advanced(by: (chunk * count + skip) * layout.rowBytes),
                                takeBytes)
                        }
                    }
                } catch let failure as PersistentPrefixFileError where failure.segments.isEmpty {
                    throw Failure(failure.description, segments: [extent.segment])
                }
                read += Int64(layout.leading * takeBytes)
            }
            let live = record.live * layout.rowBytes
            for chunk in 0 ..< layout.leading { memset(memory.advanced(by: chunk * span + live), 0, span - live) }
        } catch {
            free(memory)
            throw error
        }
        return (MLXArray(rawPointer: memory, record.shape, dtype: dtype) { free(memory) }, read)
    }

    private static func reader(for segment: String, directory: URL, readers: inout [String: Int32]) throws -> Int32 {
        if let fd = readers[segment] { return fd }
        guard PersistentPrefixFile.isSegmentName(segment) else { throw PersistentPrefixFileError("invalid segment name") }
        let fd = open(directory.appendingPathComponent(segment).path, O_RDONLY | O_CLOEXEC)
        guard fd >= 0 else {
            let reason = String(cString: strerror(errno))
            // Only a missing file condemns the segment; other errors may pass.
            if errno == ENOENT { throw PersistentPrefixFileError("segment \(segment) is missing") }
            throw ModelError("cannot open segment \(segment): \(reason)")
        }
        readers[segment] = fd
        return fd
    }

    /// Page-aligned, so MLX can adopt the buffer instead of copying it.
    private static func allocate(_ bytes: Int, for name: String) throws -> UnsafeMutableRawPointer {
        let pageBytes = 16_384
        let allocation = max(pageBytes, (bytes + pageBytes - 1) / pageBytes * pageBytes)
        var pointer: UnsafeMutableRawPointer?
        guard posix_memalign(&pointer, pageBytes, allocation) == 0, let memory = pointer else {
            throw ModelError("out of memory restoring \(name) (\(bytes) bytes)")
        }
        return memory
    }

    /// A whole fixed array stored in the head.
    static func readArray(_ fd: Int32, _ record: PersistentPrefixFile.ArrayRecord) throws -> MLXArray {
        guard let dtype = PersistentPrefixFile.dtype(named: record.dtype),
              let layout = PersistentPrefixFile.layout(shape: record.shape, axis: record.axis, length: record.length,
                itemBytes: dtype.size), Int64(layout.logicalBytes) == record.byteCount else {
            throw PersistentPrefixFileError("\(record.name) has an invalid layout")
        }
        let memory = try allocate(layout.capacityBytes, for: record.name)
        let live = layout.rowBytes * record.length
        let span = layout.rowBytes * record.shape[record.axis]
        var crc: UInt32 = 0
        do {
            for chunk in 0 ..< layout.leading {
                let destination = memory.advanced(by: chunk * span)
                try PersistentPrefixFile.readAll(fd, destination, live, at: record.offset + Int64(chunk * live))
                crc = PersistentPrefixFile.crc32(destination, live, seed: crc)
                memset(destination.advanced(by: live), 0, span - live)
            }
            guard crc == record.crc32 else { throw PersistentPrefixFileError("\(record.name) checksum mismatch") }
        } catch {
            free(memory)
            throw error
        }
        return MLXArray(rawPointer: memory, record.shape, dtype: dtype) { free(memory) }
    }
}
