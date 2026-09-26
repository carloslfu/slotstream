// Persistent tier of the conversation prefix cache: committed states of long
// conversations kept on disk, so a restarted server, or a conversation longer
// than in-memory retention allows, resumes without re-reading its prompt.
//
// Why this exists. PrefixCache retains at most four states in RAM, charged
// against a tenth of the pool budget (13,382 tokens at a 10 GB plan). A longer
// conversation is never retained, so every turn re-prefills all of it, and a
// restart discards everything. Re-reading a long prompt takes minutes, while
// the state it produces is ~27 KiB per token plus ~113 MB of fixed recurrent
// state that reads back from the SSD in a fraction of a second.
//
// What is stored. Exactly the committed representation `forkForPrefix` copies:
// live KV, indexer and pooled rows, the recurrent GDN state, the n-gram
// contexts, the draft head's cache when it is aligned, and the token ids that
// produced it. Buffers keep their allocated shape and dead capacity is zero on
// restore, so a restored state continues bit-identically
// (`optimization-state-check --variant persistent-prefix`).
//
// Writes. A head holds the token ids and the fixed recurrent arrays; its rows
// live in segments (PersistentPrefixFormat.swift). A state restored from, or
// written as, a head carries that head as its lineage, and its next save
// writes a new head plus one segment of only the rows added since; the rest
// are references. Past `maximumSegments` references a save rewrites every
// row, so chains stay short.
//
// What stays. Matching is the in-memory extend-only rule. A save removes the
// older states of its conversation except its immediate parent, which keeps
// the last turn regenerable or editable after a restart. When the quota needs
// room, files of other builds go first, then expired states, then one-off
// states nobody continued, then parents, then live conversations, each least
// recently used first. States unused past the maximum age are removed.
//
// Integrity. Every payload and header carries CRC-32. A mismatch removes the
// bad files and the request prefills normally. Files are written under a
// temporary name and renamed without fsync: a crash can leave a file that
// fails its checksum, never a state that is used.
//
// Privacy. Files hold a conversation's token ids and model state. The
// directory is created owner-only; `clear()`, `removeStates(overlapping:)` or
// deleting the directory erases them, and a request whose controller sets
// `persistsPrefixState = false` writes nothing.

import Foundation
import MLX

public final class PersistentPrefixCache {
    public let configuration: PersistentPrefixConfiguration
    public let identity: PersistentPrefixIdentity
    /// One line per save, restore, eviction or removed file. Set before use.
    public var onEvent: ((String) -> Void)?
    /// What opening the directory removed.
    public private(set) var maintenance = Maintenance()

    /// Headroom left on the volume after a write. A safety margin against
    /// filling the disk, not a measured value.
    package static let minimumFreeBytes: Int64 = 2_000_000_000
    package let instance = UUID()
    /// Most segments one head references before a save rewrites every row.
    /// Bounds restore reads and lets old segments be collected.
    package var maximumSegments = 32

    public enum SaveOutcome: Equatable, CustomStringConvertible {
        case saved
        case present
        case skipped(String)
        case failed(String)
        public var description: String {
            switch self {
            case .saved: return "saved"
            case .present: return "present"
            case .skipped(let why): return "skipped: \(why)"
            case .failed(let why): return "failed: \(why)"
            }
        }
    }

    package struct SaveResult {
        package let outcome: SaveOutcome
        package let tokens: Int
        /// Bytes written: the head plus any new segment.
        package let bytes: Int64
        /// Row bytes referenced in earlier segments instead of written.
        package let reusedBytes: Int64
        package let compacted: Bool
        package let seconds: Double
        package let removedFiles: Int
    }

    package struct RestoreResult {
        package let state: Qwen4ExpModel.State
        package let tokens: Int
        package let bytes: Int64
        package let seconds: Double
    }

    /// Files removed while opening the directory, by reason.
    public struct Maintenance: Equatable, Sendable {
        /// Written by another binary, model, setting or file format.
        public var otherBuilds = 0
        public var expired = 0
        public var unreadable = 0
        /// Interrupted writes and heads whose segments are missing or wrong.
        public var incomplete = 0
        public var orphanSegments = 0
        /// States removed because the directory held more than the quota.
        public var overQuota = 0
        public var bytes: Int64 = 0
        public var files: Int { otherBuilds + expired + unreadable + incomplete + orphanSegments + overQuota }
    }

    struct Counters {
        var restores = 0, restoredTokens = 0, restoredBytes: Int64 = 0, restoreFailures = 0
        var saves = 0, deltaSaves = 0, compactions = 0, writtenBytes: Int64 = 0, reusedBytes: Int64 = 0
        var sharedSaves = 0
        var skippedSaves = 0, failedSaves = 0
        var evictions = 0, expired = 0, replaced = 0, rejected = 0, deleted = 0, removedSegments = 0
    }

    /// Guards the index and counters; held only briefly, so metadata readers
    /// never wait for disk.
    let lock = NSLock()
    /// Serializes saves, restores and removals: collecting segments must never
    /// race a save that references them.
    let operations = NSLock()
    var heads: [PersistentPrefixEntry] = []
    var segments: [String: PersistentPrefixSegmentEntry] = [:]
    var counters = Counters()
    private let lockDescriptor: Int32

    /// Creates the directory owner-only, takes its exclusive lock, indexes its
    /// files and removes what this build cannot use or the limits exclude.
    /// Throws when another process or cache holds the directory.
    public init(configuration: PersistentPrefixConfiguration, identity: PersistentPrefixIdentity) throws {
        guard configuration.maxBytes > 0 else { throw ModelError("the prefix cache disk quota must be positive") }
        guard configuration.minimumTokens >= 1, configuration.minimumTokens <= ContextPolicy.modelLimit else {
            throw ModelError("the persisted prefix minimum must be between 1 and \(ContextPolicy.modelLimit) tokens")
        }
        if let maxAge = configuration.maxAge, !(maxAge.isFinite && maxAge > 0) {
            throw ModelError("the persisted prefix maximum age must be positive")
        }
        self.configuration = configuration
        self.identity = identity
        try Self.prepareDirectory(configuration.directory)
        lockDescriptor = try Self.lockDirectory(configuration.directory)
        maintenance = openDirectory()
    }

    deinit {
        flock(lockDescriptor, LOCK_UN)
        close(lockDescriptor)
    }

    /// Create the directory and prove it is writable, without indexing it.
    /// Serve calls this before loading the model so a bad path fails fast.
    public static func prepareDirectory(_ directory: URL) throws {
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true,
            attributes: [.posixPermissions: 0o700])
        var isDirectory: ObjCBool = false
        guard FileManager.default.fileExists(atPath: directory.path, isDirectory: &isDirectory), isDirectory.boolValue,
              access(directory.path, R_OK | W_OK | X_OK) == 0 else {
            throw ModelError("prefix cache directory \(directory.path) is not a writable directory")
        }
    }

    static func lockDirectory(_ directory: URL) throws -> Int32 {
        let fd = open(directory.appendingPathComponent(".lock").path, O_RDWR | O_CREAT | O_CLOEXEC, 0o600)
        guard fd >= 0 else {
            throw ModelError("cannot lock \(directory.path): \(String(cString: strerror(errno)))")
        }
        guard flock(fd, LOCK_EX | LOCK_NB) == 0 else {
            close(fd)
            throw ModelError("prefix cache directory \(directory.path) is in use by another process or cache")
        }
        return fd
    }

    // MARK: opening

    private func openDirectory() -> Maintenance {
        let directory = configuration.directory
        var result = Maintenance()
        var found: [PersistentPrefixEntry] = []
        var foundSegments: [String: PersistentPrefixSegmentEntry] = [:]
        func discard(_ name: String, _ bytes: Int64, _ reason: WritableKeyPath<Maintenance, Int>) {
            unlink(directory.appendingPathComponent(name).path)
            result[keyPath: reason] += 1
            result.bytes += bytes
        }
        let names = (try? FileManager.default.contentsOfDirectory(atPath: directory.path)) ?? []
        for name in names.sorted() {
            let path = directory.appendingPathComponent(name).path
            if name.hasPrefix("."), name.hasSuffix(".tmp") {
                // An interrupted write. The directory lock proves no writer is live.
                discard(name, Self.fileSize(path), \.incomplete)
                continue
            }
            guard name.hasSuffix("." + PersistentPrefixFile.headExtension)
                || name.hasSuffix("." + PersistentPrefixFile.segmentExtension) else { continue }
            do {
                switch try Self.readFile(directory: directory, name: name) {
                case .head(let entry) where entry.identity == identity.digest: found.append(entry)
                case .segment(let segment) where segment.identity == identity.digest: foundSegments[name] = segment
                case .head(let entry): discard(name, entry.bytes, \.otherBuilds)
                case .segment(let segment): discard(name, segment.bytes, \.otherBuilds)
                case .otherFormat(let bytes): discard(name, bytes, \.otherBuilds)
                }
            } catch {
                discard(name, Self.fileSize(path), \.unreadable)
            }
        }
        let now = Self.now()
        found.removeAll { head in
            if PersistentPrefixPolicy.isExpired(head, now: now, maxAge: configuration.maxAge) {
                discard(head.file, head.bytes, \.expired)
                return true
            }
            if PersistentPrefixPolicy.danglingReason(head, segments: foundSegments) != nil {
                discard(head.file, head.bytes, \.incomplete)
                return true
            }
            return false
        }
        // A lowered quota applies now, not at the next save.
        if let victims = PersistentPrefixPolicy.evictionVictims(found, segments: foundSegments.mapValues(\.bytes),
                identity: identity.digest, quota: configuration.maxBytes, incoming: 0, pinned: [], freed: [],
                now: now, maxAge: configuration.maxAge), !victims.isEmpty {
            let files = Set(victims.map(\.file))
            for victim in victims { discard(victim.file, victim.bytes, \.overQuota) }
            found.removeAll { files.contains($0.file) }
        }
        for name in PersistentPrefixPolicy.unreferencedSegments(found, segments: foundSegments.keys) {
            discard(name, foundSegments[name]?.bytes ?? 0, \.orphanSegments)
            foundSegments[name] = nil
        }
        lock.withLock {
            heads = found
            segments = foundSegments
        }
        return result
    }

    package enum ScannedFile {
        case head(PersistentPrefixEntry)
        case segment(PersistentPrefixSegmentEntry)
        case otherFormat(bytes: Int64)
    }

    /// Read and validate one file's header, and a head's token ids.
    package static func readFile(directory: URL, name: String) throws -> ScannedFile {
        typealias Failure = PersistentPrefixFileError
        let fd = open(directory.appendingPathComponent(name).path, O_RDONLY | O_CLOEXEC)
        guard fd >= 0 else { throw Failure("cannot open: \(String(cString: strerror(errno)))") }
        defer { close(fd) }
        var info = stat()
        guard fstat(fd, &info) == 0 else { throw Failure("cannot stat") }
        let size = Int64(info.st_size)
        let modified = Double(info.st_mtimespec.tv_sec) + Double(info.st_mtimespec.tv_nsec) / 1e9
        let (data, payloadEnd) = try PersistentPrefixFile.readHeaderData(fd, size: size)
        guard let probe = try? JSONDecoder().decode(PersistentPrefixFile.Probe.self, from: data) else {
            throw Failure("unreadable header")
        }
        guard probe.format == PersistentPrefixFile.formatVersion else { return .otherFormat(bytes: size) }
        if name.hasSuffix("." + PersistentPrefixFile.headExtension) {
            guard probe.kind == .head, PersistentPrefixFile.isHeadName(name),
                  let header = try? JSONDecoder().decode(PersistentPrefixFile.Head.self, from: data) else {
                throw Failure("unreadable head")
            }
            try validate(header, payloadEnd: payloadEnd)
            let tokens = try readTokens(fd, header: header)
            if let ids = header.splicingTokens {
                guard ids.count <= ContextPolicy.modelLimit, ids.starts(with: tokens),
                      ids.allSatisfy({ $0 >= 0 && $0 <= Int(Int32.max) }) else {
                    throw Failure("invalid conversation token metadata")
                }
            }
            guard name == PersistentPrefixFile.fileName(identity: header.identity, tokens: tokens) else {
                throw Failure("file name does not match its contents")
            }
            var entry = PersistentPrefixEntry(file: name, identity: header.identity, tokens: tokens, bytes: size,
                lastUsed: modified, sequenceBytes: header.sequenceBytes, residentBytes: header.residentBytes,
                hasDraft: header.draft != nil, continued: header.continued, shared: header.shared ?? false, prefillChunk: header.prefillChunk,
                sequences: Dictionary(uniqueKeysWithValues: header.sequences.map { ($0.name, $0) }))
            entry.splicingTokens = header.splicingTokens
            return .head(entry)
        }
        guard probe.kind == .segment, PersistentPrefixFile.isSegmentName(name),
              let header = try? JSONDecoder().decode(PersistentPrefixFile.Segment.self, from: data) else {
            throw Failure("unreadable segment")
        }
        var expected = Int64(PersistentPrefixFile.magic.count)
        var rows: [String: PersistentPrefixFile.RowsRecord] = [:]
        for record in header.rows {
            guard record.offset == expected, rows[record.name] == nil, record.start >= 0, record.end > record.start,
                  let dtype = PersistentPrefixFile.dtype(named: record.dtype),
                  let geometry = PersistentPrefixFile.rows(leading: record.leading, trailing: record.trailing,
                    itemBytes: dtype.size, count: record.end - record.start),
                  Int64(geometry.bytes) == record.byteCount else {
                throw Failure("segment rows \(record.name) are invalid")
            }
            rows[record.name] = record
            expected += record.byteCount
        }
        guard expected == payloadEnd else { throw Failure("segment rows do not end at the header") }
        return .segment(PersistentPrefixSegmentEntry(file: name, identity: header.identity, bytes: size, rows: rows))
    }

    /// Payloads sit back to back from the magic to the header, names are
    /// unique, and every sequence array's extents tile its live rows.
    static func validate(_ header: PersistentPrefixFile.Head, payloadEnd: Int64) throws {
        typealias Failure = PersistentPrefixFileError
        guard header.tokenCount > 0, header.tokenCount <= ContextPolicy.modelLimit else {
            throw Failure("token count is invalid")
        }
        var expected = Int64(PersistentPrefixFile.magic.count)
        var names = Set<String>()
        for record in header.arrays {
            guard record.offset == expected, record.byteCount >= 0, names.insert(record.name).inserted else {
                throw Failure("array \(record.name) is out of place")
            }
            expected += record.byteCount
        }
        guard expected == payloadEnd else { throw Failure("arrays do not end at the header") }
        for record in header.sequences {
            guard names.insert(record.name).inserted, let dtype = PersistentPrefixFile.dtype(named: record.dtype),
                  PersistentPrefixFile.layout(shape: record.shape, axis: record.axis, length: record.live,
                    itemBytes: dtype.size) != nil,
                  PersistentPrefixPolicy.tiles(record) else {
                throw Failure("sequence \(record.name) is invalid")
            }
        }
    }

    static func readTokens(_ fd: Int32, header: PersistentPrefixFile.Head) throws -> [Int] {
        let count = header.tokenCount
        guard let record = header.arrays.first(where: { $0.name == "tokens" }), record.dtype == "int32",
              record.shape == [count], record.axis == 0, record.length == count,
              record.byteCount == Int64(count * 4) else {
            throw PersistentPrefixFileError("token ids are missing")
        }
        var ids = [Int32](repeating: 0, count: count)
        try ids.withUnsafeMutableBytes { raw in
            try PersistentPrefixFile.readAll(fd, raw.baseAddress!, raw.count, at: record.offset)
            guard PersistentPrefixFile.crc32(raw.baseAddress, raw.count) == record.crc32 else {
                throw PersistentPrefixFileError("token checksum mismatch")
            }
        }
        return ids.map { Int(Int32(littleEndian: $0)) }
    }

    // MARK: index

    public var storedStates: Int { lock.withLock { heads.filter { $0.identity == identity.digest }.count } }
    public var storedSegments: Int { lock.withLock { segments.count } }
    public var storedBytes: Int64 {
        lock.withLock { heads.reduce(Int64(0)) { $0 + $1.bytes } + segments.values.reduce(Int64(0)) { $0 + $1.bytes } }
    }

    package var indexedEntries: [PersistentPrefixEntry] { lock.withLock { heads } }
    package var indexedSegments: [String: PersistentPrefixSegmentEntry] { lock.withLock { segments } }

    package func candidate(extending prompt: [Int], longerThan retained: Int,
                           requireDraft: Bool, boundaries: Set<Int>? = nil, prefillChunk: Int? = nil) -> PersistentPrefixEntry? {
        let now = Self.now()
        return lock.withLock {
            PersistentPrefixPolicy.bestMatch(heads, identity: identity.digest, prompt: prompt, longerThan: retained,
                requireDraft: requireDraft, now: now, maxAge: configuration.maxAge, boundaries: boundaries, prefillChunk: prefillChunk)
        }
    }

    package func longestExtension(of prefix: [Int]) -> [Int]? {
        let now = Self.now()
        return lock.withLock {
            PersistentPrefixPolicy.longestExtension(heads, identity: identity.digest, of: prefix, now: now,
                maxAge: configuration.maxAge)
        }
    }

    package func extensions(of prefix: [Int]) -> [[Int]] {
        let now = Self.now()
        return lock.withLock {
            PersistentPrefixPolicy.extensions(heads, identity: identity.digest, of: prefix, now: now,
                maxAge: configuration.maxAge)
        }
    }

    /// How many leading tokens of `prompt` some own unexpired state shares:
    /// the boundary a shared-prefix save of this prompt would use.
    package func longestCommonPrefix(with prompt: [Int]) -> Int {
        let now = Self.now()
        return lock.withLock {
            PersistentPrefixPolicy.longestCommonPrefix(heads, identity: identity.digest, prompt: prompt, now: now,
                maxAge: configuration.maxAge)
        }
    }

    /// Own states written as shared prefixes.
    public var storedSharedStates: Int {
        lock.withLock { heads.filter { $0.identity == identity.digest && $0.shared }.count }
    }

    /// The removal class of each own state, for reports and checks.
    package func value(of file: String) -> PersistentPrefixValue? {
        let now = Self.now()
        return lock.withLock {
            heads.first { $0.file == file }.map {
                PersistentPrefixPolicy.value(of: $0, in: heads, identity: identity.digest, now: now,
                    maxAge: configuration.maxAge)
            }
        }
    }

    // MARK: removal

    enum Removal { case evicted, replaced, rejected, expired, deleted }

    func path(_ file: String) -> String { configuration.directory.appendingPathComponent(file).path }

    /// Called with `operations` held. Removes heads, then every segment no
    /// head references except `keeping`, which an unfinished save still needs.
    @discardableResult
    func remove(heads files: [String], _ reason: Removal, keeping: Set<String> = []) -> Int {
        var removed = 0
        for file in files {
            if unlink(path(file)) == 0 || errno == ENOENT { removed += 1 }
            lock.withLock {
                heads.removeAll { $0.file == file }
                switch reason {
                case .evicted: counters.evictions += 1
                case .replaced: counters.replaced += 1
                case .rejected: counters.rejected += 1
                case .expired: counters.expired += 1
                case .deleted: counters.deleted += 1
                }
            }
        }
        return removed + collectGarbage(keeping: keeping)
    }

    /// Called with `operations` held.
    @discardableResult
    func collectGarbage(keeping: Set<String> = []) -> Int {
        let orphans = lock.withLock {
            PersistentPrefixPolicy.unreferencedSegments(heads, segments: segments.keys).filter { !keeping.contains($0) }
        }
        for name in orphans {
            unlink(path(name))
            lock.withLock {
                segments[name] = nil
                counters.removedSegments += 1
            }
        }
        return orphans.count
    }

    /// Called with `operations` held.
    @discardableResult
    func removeExpired(keeping: Set<String> = []) -> Int {
        let now = Self.now()
        let expired = lock.withLock {
            heads.filter { PersistentPrefixPolicy.isExpired($0, now: now, maxAge: configuration.maxAge) }.map(\.file)
        }
        guard !expired.isEmpty else { return 0 }
        report("forgot \(expired.count) state\(expired.count == 1 ? "" : "s") unused past the maximum age")
        return remove(heads: expired, .expired, keeping: keeping)
    }

    func touch(_ file: String) {
        utimes(path(file), nil)
        let now = Self.now()
        lock.withLock { if let i = heads.firstIndex(where: { $0.file == file }) { heads[i].lastUsed = now } }
    }

    /// Remove every state and segment in the directory, including files this
    /// build could not use. Returns the number of files removed.
    @discardableResult
    public func clear() -> Int {
        operations.withLock {
            let names = (try? FileManager.default.contentsOfDirectory(atPath: configuration.directory.path)) ?? []
            var removed = 0
            for name in names where Self.isStateFile(name) && unlink(path(name)) == 0 { removed += 1 }
            lock.withLock {
                counters.deleted += heads.count
                heads.removeAll()
                segments.removeAll()
            }
            report("cleared \(removed) file\(removed == 1 ? "" : "s")")
            return removed
        }
    }

    /// Remove own states whose ids are a prefix of `tokens` or begin with
    /// them: every persisted state of a conversation being deleted, given its
    /// latest ids. Earlier states it shares with other branches go too.
    /// Returns the number of states removed.
    @discardableResult
    public func removeStates(overlapping tokens: [Int]) -> Int {
        guard !tokens.isEmpty else { return 0 }
        return operations.withLock {
            let files = lock.withLock {
                heads.filter { $0.identity == identity.digest && !$0.tokens.isEmpty
                    && ($0.tokens.starts(with: tokens) || tokens.starts(with: $0.tokens)) }.map(\.file)
            }
            guard !files.isEmpty else { return 0 }
            remove(heads: files, .deleted)
            report("removed \(files.count) state\(files.count == 1 ? "" : "s") of a deleted conversation")
            return files.count
        }
    }

    func report(_ line: String) { onEvent?(line) }

    static func isStateFile(_ name: String) -> Bool {
        name.hasSuffix("." + PersistentPrefixFile.headExtension) || name.hasSuffix("." + PersistentPrefixFile.segmentExtension)
            || (name.hasPrefix(".") && name.hasSuffix(".tmp"))
    }

    static func now() -> Double { Date().timeIntervalSince1970 }

    static func fileSize(_ path: String) -> Int64 {
        var info = stat()
        return stat(path, &info) == 0 ? Int64(info.st_size) : 0
    }

    static func megabytes(_ bytes: Int64) -> String { String(format: "%.1f MB", Double(bytes) / 1e6) }

    static func availableBytes(_ directory: URL) -> Int64 {
        var info = statfs()
        guard statfs(directory.path, &info) == 0 else { return 0 }
        return Int64(info.f_bavail) * Int64(info.f_bsize)
    }

    public func json() -> [String: Any] {
        let now = Self.now()
        return lock.withLock {
            let own = heads.filter { $0.identity == identity.digest }
            var classes: [PersistentPrefixValue: Int] = [:]
            for entry in own {
                classes[PersistentPrefixPolicy.value(of: entry, in: own, identity: identity.digest, now: now,
                    maxAge: configuration.maxAge), default: 0] += 1
            }
            let headBytes = heads.reduce(Int64(0)) { $0 + $1.bytes }
            let segmentBytes = segments.values.reduce(Int64(0)) { $0 + $1.bytes }
            let c = counters, m = maintenance
            return [
                "directory": configuration.directory.path,
                "states": own.count,
                "conversations": classes[.conversation] ?? 0,
                "parents": classes[.parent] ?? 0,
                "one_off": classes[.oneOff] ?? 0,
                "shared": classes[.shared] ?? 0,
                "shared_prefixes": own.filter(\.shared).count,
                "held_tokens": own.reduce(0) { $0 + $1.tokens.count },
                "segments": segments.count,
                "bytes": headBytes + segmentBytes,
                "head_bytes": headBytes,
                "segment_bytes": segmentBytes,
                "max_bytes": configuration.maxBytes,
                "minimum_tokens": configuration.minimumTokens,
                "max_age_seconds": configuration.maxAge ?? 0,
                "restores": c.restores,
                "restored_tokens": c.restoredTokens,
                "restored_bytes": c.restoredBytes,
                "restore_failures": c.restoreFailures,
                "saves": c.saves,
                "delta_saves": c.deltaSaves,
                "shared_saves": c.sharedSaves,
                "compactions": c.compactions,
                "written_bytes": c.writtenBytes,
                "reused_bytes": c.reusedBytes,
                "skipped_saves": c.skippedSaves,
                "failed_saves": c.failedSaves,
                "evictions": c.evictions,
                "expired_states": c.expired,
                "replaced_states": c.replaced,
                "rejected_files": c.rejected,
                "deleted_states": c.deleted,
                "removed_segments": c.removedSegments,
                "opened": [
                    "removed_other_builds": m.otherBuilds, "removed_expired": m.expired,
                    "removed_unreadable": m.unreadable, "removed_incomplete": m.incomplete,
                    "removed_orphan_segments": m.orphanSegments, "removed_over_quota": m.overQuota,
                    "removed_bytes": m.bytes,
                ] as [String: Any],
            ]
        }
    }
}

// MARK: - inspection without a model

extension PersistentPrefixCache {
    /// A directory's contents as any build sees them, for `slotstream prefix-cache`.
    public struct DirectoryReport: Sendable {
        public struct State: Sendable {
            public let identity: String
            public let tokens: Int
            public let headBytes: Int64
            public let lastUsed: Date
            public let continued: Bool
            public let hasDraft: Bool
            /// Written inside a prompt, at a boundary other conversations start with.
            public let shared: Bool
            public let segments: Int
        }
        public var states: [State] = []
        public var segments = 0
        public var segmentBytes: Int64 = 0
        /// Files in another file format, which any current build removes.
        public var otherFormatFiles = 0
        public var otherFormatBytes: Int64 = 0
        public var unreadableFiles = 0
        public var unreadableBytes: Int64 = 0
        /// Another process holds the directory, so its contents may be changing.
        public var inUse = false
        public var totalBytes: Int64 {
            states.reduce(Int64(0)) { $0 + $1.headBytes } + segmentBytes + otherFormatBytes + unreadableBytes
        }
    }

    public static func inspect(directory: URL) throws -> DirectoryReport {
        var isDirectory: ObjCBool = false
        guard FileManager.default.fileExists(atPath: directory.path, isDirectory: &isDirectory), isDirectory.boolValue else {
            throw ModelError("\(directory.path) is not a directory")
        }
        var result = DirectoryReport()
        let fd = open(directory.appendingPathComponent(".lock").path, O_RDONLY | O_CLOEXEC)
        if fd >= 0 {
            if flock(fd, LOCK_SH | LOCK_NB) == 0 { flock(fd, LOCK_UN) } else { result.inUse = true }
            close(fd)
        }
        for name in try FileManager.default.contentsOfDirectory(atPath: directory.path).sorted()
        where name.hasSuffix("." + PersistentPrefixFile.headExtension) || name.hasSuffix("." + PersistentPrefixFile.segmentExtension) {
            do {
                switch try readFile(directory: directory, name: name) {
                case .head(let entry):
                    result.states.append(.init(identity: entry.identity, tokens: entry.tokens.count, headBytes: entry.bytes,
                        lastUsed: Date(timeIntervalSince1970: entry.lastUsed), continued: entry.continued,
                        hasDraft: entry.hasDraft, shared: entry.shared, segments: entry.segments.count))
                case .segment(let segment):
                    result.segments += 1
                    result.segmentBytes += segment.bytes
                case .otherFormat(let bytes):
                    result.otherFormatFiles += 1
                    result.otherFormatBytes += bytes
                }
            } catch {
                result.unreadableFiles += 1
                result.unreadableBytes += fileSize(directory.appendingPathComponent(name).path)
            }
        }
        return result
    }

    /// Remove every state file from a directory that no process is using.
    public static func clear(directory: URL) throws -> (files: Int, bytes: Int64) {
        var isDirectory: ObjCBool = false
        guard FileManager.default.fileExists(atPath: directory.path, isDirectory: &isDirectory), isDirectory.boolValue else {
            throw ModelError("\(directory.path) is not a directory")
        }
        let fd = try lockDirectory(directory)
        defer {
            flock(fd, LOCK_UN)
            close(fd)
        }
        var files = 0
        var bytes: Int64 = 0
        for name in try FileManager.default.contentsOfDirectory(atPath: directory.path) where isStateFile(name) {
            let path = directory.appendingPathComponent(name).path
            let size = fileSize(path)
            if unlink(path) == 0 {
                files += 1
                bytes += size
            } else {
                let code = errno
                if code != ENOENT {
                    throw ModelError("cannot remove prefix cache file \(path): \(String(cString: strerror(code)))")
                }
            }
        }
        return (files, bytes)
    }
}

/// The cache layers a loaded model allocates. A restored head must match
/// them exactly, including whether the main indexers release raw rows.
package struct PersistentPrefixLayout: Equatable, Sendable {
    package let linearLayers: Set<Int>
    package let attentionLayers: Set<Int>
    package let compactIndexerRaw: Bool

    package init(linearLayers: Set<Int>, attentionLayers: Set<Int>, compactIndexerRaw: Bool) {
        self.linearLayers = linearLayers
        self.attentionLayers = attentionLayers
        self.compactIndexerRaw = compactIndexerRaw
    }

    package init(model: Qwen4ExpModel) {
        let types = Array(model.cfg.layerTypes.prefix(model.runLayers))
        linearLayers = Set(types.indices.filter { types[$0] == "linear_attention" })
        attentionLayers = Set(types.indices.filter { types[$0] != "linear_attention" })
        compactIndexerRaw = model.optimizations.compactIndexerRaw
    }

    package init(state: Qwen4ExpModel.State) {
        linearLayers = Set(state.linear.keys)
        attentionLayers = Set(state.kv.keys)
        compactIndexerRaw = state.indexer.values.first?.compactRaw ?? false
    }
}
