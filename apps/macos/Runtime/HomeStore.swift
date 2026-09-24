import Foundation
import Darwin

/// Native control/recovery files are separate from the db.md records. All db.md
/// mutations go through the pinned official executable, never a format clone.
public struct ExternalHomeChange: Identifiable, Equatable, Sendable {
    public var id: String { path }
    public var path: String
    public var digest: String
    public var previousDraft: String?
    public var externalDraft: String?
    public var reason: String
    public var canAdopt: Bool { externalDraft != nil }
}
public final class HomeStore {
    public let root: URL
    private let dbmd: URL
    private var lockFD: Int32 = -1
    private var expectedHash: String?
    private var documentHashes: [String: String] = [:]
    private var persisted: HomeState?
    /// The Home opened while drafts it can adopt were edited outside Sevra.
    public private(set) var openedWithExternalDrafts = false
    private let allowsExternalDraftReview: Bool
    private let fm = FileManager.default
    private var record: URL { root.appendingPathComponent("db/records/state/home.md") }
    private var recovery: URL { root.appendingPathComponent(".sevra/recovery.json") }
    private var integrity: URL { root.appendingPathComponent(".sevra/integrity.json") }
    public var fault: ((String) throws -> Void)?
    private var documentsLedger: URL { root.appendingPathComponent(".sevra/documents.json") }
    private var restoration: URL { root.appendingPathComponent(".sevra/restoration.json") }
    public private(set) var restoreReview: HomeRestoreReview?
    struct Document: Codable {
        var path: String
        var type: String
        var body: String
        var immutable: Bool
        var summary: String? = nil
    }
    /// An owned Home file published create-only, such as a mini-app version.
    struct OwnedFile: Codable {
        var path: String
        var content: Data
    }
    /// A save's recovery record. It holds only what the save writes: the exact
    /// index body, the changed documents with the hashes they replace, and any
    /// files it publishes. It never copies unchanged history, so its size
    /// follows the change, not the Home.
    private struct Intent: Codable {
        /// Full state, from intents written before `index` existed.
        var state: HomeState? = nil
        /// The exact `records/state/home.md` body this save writes.
        var index: String? = nil
        var previousHash: String? = nil
        /// One artifact, from intents written before `artifacts` existed.
        var artifact: ArtifactProposal? = nil
        var artifacts: [ArtifactProposal]? = nil
        var documents: [Document]? = nil
        /// The complete ledger to replace. Older intents always carried it;
        /// reconciliation still does. Ordinary saves leave it out and name
        /// only the hashes their documents replace in `replaced`.
        var previousDocuments: [String: String]? = nil
        var replaced: [String: String]? = nil
        var files: [OwnedFile]? = nil
    }
    /// Stat identity of each verified document, so unchanged files are not
    /// hashed again on every save. Any content change moves ctime.
    private var verified: [String: (size: Int64, mtime: timespec, ctime: timespec, ino: ino_t, hash: String)] = [:]
    private var grantsURL: URL { root.appendingPathComponent(".sevra/app-grants.json") }
    public init(root requestedRoot: URL, dbmd: URL, allowExternalDraftReview: Bool = false) throws {
        self.dbmd = dbmd
        self.allowsExternalDraftReview = allowExternalDraftReview
        let fm = FileManager.default
        let requested = URL(fileURLWithPath: requestedRoot.path)
        guard requested.standardizedFileURL.path == requested.resolvingSymlinksInPath().path else {
            throw SevraError.refused("Home must not contain symbolic links.")
        }
        guard dbmd.path.hasPrefix("/"), fm.isExecutableFile(atPath: dbmd.path) else {
            throw SevraError.unavailable("The bundled db.md tool is missing.")
        }
        try fm.createDirectory(at: requested, withIntermediateDirectories: true, attributes: [.posixPermissions: 0o700])
        // Foundation folds macOS's system aliases (such as /private/tmp)
        // differently for absent and existing directories. Reconstruct after
        // creation so every owner, restart and IPC client binds the same path.
        let root = URL(fileURLWithPath: requested.path).standardizedFileURL
        self.root = root
        for child in [".sevra", "db", "artifacts", "sevra.toml"] { try checkPlainPath(root.appendingPathComponent(child)) }
        let marker = root.appendingPathComponent("sevra.toml")
        if fm.fileExists(atPath: root.appendingPathComponent("db/DB.md").path), !fm.fileExists(atPath: record.path), !fm.fileExists(atPath: marker.path) {
            throw SevraError.refused("This folder already contains a db.md store. Attach it as a source instead; using it as Home requires an explicit migration.")
        }
        if !fm.fileExists(atPath: marker.path) { try durable(Data("schema = 1\nproduct = \"Sevra Mac development\"\n".utf8), at: marker) }
        try fm.createDirectory(at: root.appendingPathComponent(".sevra"), withIntermediateDirectories: true, attributes: [.posixPermissions: 0o700])
        lockFD = open(root.appendingPathComponent(".sevra/owner.lock").path, O_RDWR | O_CREAT | O_NOFOLLOW | O_CLOEXEC, 0o600)
        guard lockFD >= 0, flock(lockFD, LOCK_EX | LOCK_NB) == 0 else {
            if lockFD >= 0 { close(lockFD); lockFD = -1 }
            throw SevraError.ownerBusy
        }
        if !fm.fileExists(atPath: root.appendingPathComponent("db/DB.md").path) {
            guard !fm.fileExists(atPath: record.path) else { throw SevraError.conflict("Home configuration is missing; restore a complete backup.") }
            try fm.createDirectory(at: root.appendingPathComponent("db/records"), withIntermediateDirectories: true, attributes: [.posixPermissions: 0o700])
            let config = root.appendingPathComponent("db/DB.md")
            // Exact versioned configuration, composed by dbmd at development
            // time. dbmd's CLI expects a DB.md before its first store command.
            try durable(Data(homeTemplate.utf8), at: config)
        }
        try fm.createDirectory(at: root.appendingPathComponent("artifacts"), withIntermediateDirectories: true, attributes: [.posixPermissions: 0o700])
        if fm.fileExists(atPath: documentsLedger.path) { documentHashes = try decoded([String: String].self, Data(contentsOf: documentsLedger)) }
        if fm.fileExists(atPath: recovery.path) {
            let intent = try decoded(Intent.self, Data(contentsOf: recovery))
            try apply(intent)
        }
        if fm.fileExists(atPath: integrity.path) {
            expectedHash = try decoded(String.self, Data(contentsOf: integrity))
        } else if fm.fileExists(atPath: record.path) {
            throw SevraError.conflict("Home integrity state is missing. Open a complete recovery copy; existing history has been preserved.")
        }
        try verifyForLoading()
        if fm.fileExists(atPath: restoration.path) {
            try checkPlainPath(restoration)
            restoreReview = try decoded(HomeRestoreReview.self, Data(contentsOf: restoration))
        }
    }
    deinit { if lockFD >= 0 { flock(lockFD, LOCK_UN); close(lockFD) } }

    public func load() throws -> HomeState {
        try verifyForLoading()
        guard fm.fileExists(atPath: record.path) else { return HomeState() }
        var state = try decoded(HomeState.self, Data(try recordBody().utf8))
        try Self.validateIdentities(state)
        if state.storageLayout == 2 {
            guard !documentHashes.isEmpty else { throw SevraError.conflict("Home document integrity state is missing. Restore a complete recovery copy.") }
            for i in state.threads.indices {
                let id = state.threads[i].id
                // A draft-only save updates the index, not the thread record,
                // so the index can hold the newer draft revision.
                let indexedRevision = state.threads[i].draftRevision
                state.threads[i] = try decoded(WorkThread.self, Data(try loadedBody("records/threads/\(id).md").utf8))
                guard state.threads[i].id == id, state.threads[i].mode != .incognito else { throw SevraError.conflict("A thread record has an invalid owner or privacy mode.") }
                state.threads[i].draft = try decoded(String.self, Data(try loadedBody("records/drafts/\(id).md", draft: true).utf8))
                if let indexedRevision, indexedRevision > (state.threads[i].draftRevision ?? 0) { state.threads[i].draftRevision = indexedRevision }
            }
        } else if state.storageLayout != nil { throw SevraError.unavailable("This Home's storage layout is unsupported.") }
        persisted = state
        return state
    }
    /// The index body. `verify` has just bound the file to its integrity hash,
    /// so the bytes are exactly what dbmd wrote; read them without launching
    /// dbmd. An unrecognized layout falls back to dbmd's own parser.
    private func recordBody() throws -> String {
        let data = try Data(contentsOf: record)
        guard digestBytes(data) == expectedHash else { throw SevraError.conflict("Home records changed outside Sevra. Writes and AI context are paused; the changed files have been preserved.") }
        let body = RecordText.body(of: String(decoding: data, as: UTF8.self))
        return body.isEmpty ? try self.body(record) : body.trimmingCharacters(in: .newlines)
    }
    /// A thread or draft record's body, bound to the integrity ledger. Opening
    /// reads these directly instead of launching dbmd twice per thread. A draft
    /// edited outside Sevra, which opening allowed for review, is read through
    /// dbmd exactly as before.
    private func loadedBody(_ path: String, draft: Bool = false) throws -> String {
        do { return try trackedBody(path) }
        catch SevraError.conflict(let message) {
            guard draft, openedWithExternalDrafts else { throw SevraError.conflict(message) }
            return try body(root.appendingPathComponent("db/" + path))
        }
    }
    private func verifyForLoading() throws {
        do { try verify() }
        catch {
            guard allowsExternalDraftReview else { throw error }
            let changes = try inspectExternalChanges()
            guard !changes.isEmpty, changes.allSatisfy(\.canAdopt) else { throw error }
            openedWithExternalDrafts = true
        }
    }
    public func inspectExternalChanges() throws -> [ExternalHomeChange] {
        try checkPlainPath(record)
        let actual = try currentHash()
        guard actual == expectedHash else {
            return [.init(path: "records/state/home.md", digest: actual ?? "missing", previousDraft: nil, externalDraft: nil, reason: "Conversation ownership or state changed. Restore a complete backup; this change cannot be adopted as a draft.")]
        }
        guard fm.fileExists(atPath: record.path) else { return [] }
        let index = try decoded(HomeState.self, Data(try body(record).utf8))
        try Self.validateIdentities(index)
        let drafts = Dictionary(uniqueKeysWithValues: index.threads.map { ("records/drafts/" + $0.id + ".md", $0.id) })
        var changes: [ExternalHomeChange] = []
        for (path, expected) in documentHashes.sorted(by: { $0.key < $1.key }) {
            let url = root.appendingPathComponent("db/" + path)
            do { try checkPlainPath(url) }
            catch {
                changes.append(.init(path: path, digest: "unsafe-path", previousDraft: nil, externalDraft: nil, reason: "A symbolic link replaced owned data. Restore the ordinary file before continuing.")); continue
            }
            guard fm.fileExists(atPath: url.path) else {
                changes.append(.init(path: path, digest: "missing", previousDraft: nil, externalDraft: nil, reason: "A required file is missing. Restore it from a complete backup.")); continue
            }
            let data = try Data(contentsOf: url), hash = digestBytes(data)
            if hash == expected { continue }
            var change = ExternalHomeChange(path: path, digest: hash, previousDraft: nil, externalDraft: nil, reason: "This is conversation evidence, configuration or runtime state. It cannot be adopted as a draft. Its bytes are preserved; use a complete backup for recovery.")
            if let id = drafts[path] {
                change.reason = "The edited draft is not a valid bounded Sevra draft record. Preserve its text and restore the original record structure."
                if data.count <= 128 * 1024,
                   let json = try? JSONSerialization.jsonObject(with: command(["show", url.path, "--json"])) as? [String: Any],
                   json["type"] as? String == "sevra-draft", let body = json["body"] as? String,
                   let draft = try? decoded(String.self, Data(body.trimmingCharacters(in: .newlines).utf8)), draft.utf8.count <= 65536,
                   try digestBytes(Data(contentsOf: url)) == hash {
                    change.externalDraft = draft
                    change.previousDraft = openedWithExternalDrafts ? nil : persisted?.threads.first(where: { $0.id == id })?.draft
                    change.reason = "Review this unsent draft. Adopting it preserves the edited file and the previously acknowledged text when available in a local draft-conflict record. It does not send a message or grant AI access."
                }
            }
            changes.append(change)
        }
        return changes
    }
    public func reconcileExternalDrafts(reviewed: [String: String]) throws -> HomeState {
        let changes = try inspectExternalChanges()
        guard !changes.isEmpty, changes.allSatisfy(\.canAdopt),
              Dictionary(uniqueKeysWithValues: changes.map { ($0.path, $0.digest) }) == reviewed,
              !fm.fileExists(atPath: recovery.path) else { throw SevraError.conflict("Home changed again or contains a change that cannot be adopted. Inspect the current files before continuing.") }
        guard var next = persisted else { throw SevraError.conflict("Open the Home before reviewing its draft changes.") }
        var accepted = documentHashes, versions: [Document] = []
        for change in changes {
            let id = URL(fileURLWithPath: change.path).deletingPathExtension().lastPathComponent
            guard let i = next.threads.firstIndex(where: { $0.id == id }), let draft = change.externalDraft else { throw SevraError.refused("Draft owner is missing.") }
            let raw = try Data(contentsOf: root.appendingPathComponent("db/" + change.path))
            guard digestBytes(raw) == change.digest else { throw SevraError.conflict("The reviewed draft changed again. Inspect it again.") }
            accepted[change.path] = change.digest
            let preserved = storedJSON(["path": change.path, "external_sha256": change.digest, "external_file_base64": raw.base64EncodedString(), "previous_known": change.previousDraft != nil, "previous_draft": change.previousDraft ?? "", "adopted_draft": draft])
            versions.append(Document(path: "records/drafts/conflicts/" + UUID().uuidString + ".md", type: "sevra-draft-conflict", body: preserved, immutable: true))
            next.threads[i].draft = draft; next.threads[i].draftRevision = (next.threads[i].draftRevision ?? 0) + 1
        }
        // A second complete inspection binds the review to every changed file.
        guard try inspectExternalChanges() == changes else { throw SevraError.conflict("Home changed during review. Inspect the current files again.") }
        next.revision += 1
        let documents = try prepareDocuments(next) + versions
        let intent = Intent(state: next, previousHash: expectedHash, artifact: nil, documents: documents, previousDocuments: accepted)
        try durable(try encoded(intent), at: recovery)
        try fault?("intent"); try apply(intent)
        persisted = next; openedWithExternalDrafts = false
        return next
    }
    private static func validateIdentities(_ state: HomeState) throws {
        guard state.schema == 1 else { throw SevraError.unavailable("This Home uses an unsupported schema. Update Sevra before opening it.") }
        guard UUID(uuidString: state.id) != nil, state.revision >= 0,
              state.threads.filter({ $0.id == "home" }).count == 1,
              Set(state.threads.map { $0.id.lowercased() }).count == state.threads.count,
              state.threads.allSatisfy({ $0.id == "home" || UUID(uuidString: $0.id) != nil }) else {
            throw SevraError.refused("Home contains invalid or colliding record identities.")
        }
    }
    public func exportHome(to destination: URL) throws -> HomeArchiveResult {
        guard !fm.fileExists(atPath: recovery.path) else { throw SevraError.conflict("Resolve the interrupted save before creating a backup.") }
        return try HomeArchive.export(root: root, state: load(), to: destination, verify: verify)
    }
    public func acknowledgeRestore(archiveDigest: String) throws {
        try verify()
        guard var review = restoreReview, review.archiveDigest == archiveDigest else { throw SevraError.refused("This restore review is no longer current.") }
        review.reviewed = true
        try durable(try encoded(review), at: restoration)
        restoreReview = review
    }
    static func prepareRestoredHome(at root: URL, manifest: HomeArchiveManifest, review initialReview: HomeRestoreReview, dbmd: URL, knownHome: HomeState?) throws {
        // Reconstruct integrity evidence from verified payload bytes, never
        // restore locks, endpoint credentials, approvals or private baselines.
        let control = root.appendingPathComponent(".sevra")
        try FileManager.default.createDirectory(at: control, withIntermediateDirectories: false, attributes: [.posixPermissions: 0o700])
        let stateFile = root.appendingPathComponent("db/records/state/home.md")
        try durable(try encoded(digestBytes(Data(contentsOf: stateFile))), at: control.appendingPathComponent("integrity.json"))
        var hashes: [String: String] = [:]
        for entry in manifest.files where entry.path.hasPrefix("db/") {
            let path = String(entry.path.dropFirst(3))
            let name = (path as NSString).lastPathComponent
            if path == "DB.md" || (["records/threads/", "records/drafts/", "records/app-data/", "sources/conversations/", "sources/excerpts/"].contains(where: path.hasPrefix) && name != "index.md" && name != "index.jsonl") {
                hashes[path] = entry.sha256
            }
        }
        try durable(try encoded(hashes), at: control.appendingPathComponent("documents.json"))
        try durable(try encoded(initialReview), at: control.appendingPathComponent("restoration.json"))
        let store = try HomeStore(root: root, dbmd: dbmd)
        var state = try store.load()
        guard state.id == manifest.homeID, state.revision == manifest.revision else { throw SevraError.refused("Backup state does not match its Home manifest.") }
        let config = root.appendingPathComponent("db/DB.md")
        if try Data(contentsOf: config) == Data(legacyHomeTemplate.utf8) {
            _ = try store.command(["fm", "set", config.path, "owner=Local user", "--json"])
            store.documentHashes["DB.md"] = digestBytes(try Data(contentsOf: config))
            try durable(try encoded(store.documentHashes), at: store.documentsLedger)
        }
        _ = try store.command(["validate", "--all", "--json"])
        if let knownHome, knownHome.id == state.id, knownHome.revision >= state.revision {
            var changed = false, count = 0
            for exclusion in knownHome.memories where exclusion.forgotten {
                if let i = state.memories.firstIndex(where: { $0.id == exclusion.id }) {
                    if !state.memories[i].forgotten || state.memories[i].admitted {
                        state.memories[i].forgotten = true; state.memories[i].admitted = false; changed = true; count += 1
                    }
                } else { state.memories.append(exclusion); changed = true; count += 1 }
            }
            if changed { state.revision = max(state.revision, knownHome.revision) + 1; try store.save(state) }
            var review = initialReview; review.privacyEpochKnown = true; review.mergedExclusions = count
            try durable(try encoded(review), at: control.appendingPathComponent("restoration.json"))
        }
    }
    /// Checks every tracked document before a write. Each folder's path is
    /// checked once per pass rather than once per document, and a document
    /// whose file identity is unchanged since it was hashed costs one lstat.
    /// Any content change moves ctime, which nothing but the kernel can set.
    public func verify() throws {
        for child in [".sevra", "artifacts", "extensions", "changes"] { try checkPlainPath(root.appendingPathComponent(child)) }
        try checkPlainPath(record)
        let actual = try currentHash()
        guard actual == expectedHash else {
            throw SevraError.conflict("Home records changed outside Sevra. Writes and AI context are paused; the changed files have been preserved.")
        }
        let db = root.path + "/db/"
        var folders = Set<Substring>()
        for (path, expected) in documentHashes {
            let folder = path.lastIndex(of: "/").map { path[..<$0] } ?? ""
            if folders.insert(folder).inserted { try checkPlainPath(root.appendingPathComponent("db/" + folder)) }
            var info = stat()
            guard lstat(db + path, &info) == 0 else {
                throw SevraError.conflict("A Home document changed outside Sevra: \(path). Writes and AI context are paused; its bytes are preserved.")
            }
            guard info.st_mode & S_IFMT == S_IFREG else { throw SevraError.refused("Home storage requires ordinary files and folders; symbolic links and special files are refused.") }
            if let known = verified[path], known.hash == expected, known.size == info.st_size, known.ino == info.st_ino,
               known.mtime.tv_sec == info.st_mtimespec.tv_sec, known.mtime.tv_nsec == info.st_mtimespec.tv_nsec,
               known.ctime.tv_sec == info.st_ctimespec.tv_sec, known.ctime.tv_nsec == info.st_ctimespec.tv_nsec { continue }
            guard digestBytes(try Data(contentsOf: URL(fileURLWithPath: db + path))) == expected else {
                verified.removeValue(forKey: path)
                throw SevraError.conflict("A Home document changed outside Sevra: \(path). Writes and AI context are paused; its bytes are preserved.")
            }
            verified[path] = (info.st_size, info.st_mtimespec, info.st_ctimespec, info.st_ino, expected)
        }
    }
    /// Hashes a document this store just wrote and records the identity it had
    /// before the read, so the next `verify` need not read it again. A change
    /// after the lstat moves ctime, so that pass hashes it anyway.
    private func hashWritten(_ path: String) throws -> String {
        let full = root.path + "/db/" + path
        var info = stat()
        let identified = lstat(full, &info) == 0
        let hash = digestBytes(try Data(contentsOf: URL(fileURLWithPath: full)))
        if identified { verified[path] = (info.st_size, info.st_mtimespec, info.st_ctimespec, info.st_ino, hash) }
        else { verified.removeValue(forKey: path) }
        return hash
    }
    /// Read the current saved file through directory handles. The UI does not
    /// depend on a separately installed Markdown editor or silently follow links.
    public func readArtifact(_ path: String) throws -> String { try Self.readArtifact(path, at: root) }
    /// The same read by Home folder alone, so it never waits behind a save.
    public static func readArtifact(_ path: String, at root: URL) throws -> String {
        let parts = path.split(separator: "/", omittingEmptySubsequences: false)
        guard parts.count == 2, parts[0] == "artifacts" else { throw SevraError.refused("Invalid saved document path.") }
        try Self.validateFilename(String(parts[1]))
        let homeFD = open(root.path, O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC)
        guard homeFD >= 0 else { throw SevraError.refused("Home is no longer accessible.") }
        defer { close(homeFD) }
        let directory = openat(homeFD, "artifacts", O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC)
        guard directory >= 0 else { throw SevraError.refused("The saved document folder is missing or changed.") }
        defer { close(directory) }
        let fd = openat(directory, String(parts[1]), O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
        guard fd >= 0 else { throw SevraError.refused("The saved document is missing or is a symbolic link.") }
        defer { close(fd) }
        var before = stat()
        // UI read budget, matching the initial bounded UTF-8 source reader.
        let limit = 1_048_576
        guard fstat(fd, &before) == 0, before.st_mode & S_IFMT == S_IFREG, before.st_size <= limit else {
            throw SevraError.refused("Preview supports ordinary UTF-8 documents up to one megabyte. Reveal this file in Finder to inspect it.")
        }
        var data = Data(), buffer = [UInt8](repeating: 0, count: 16384)
        while true {
            let n = read(fd, &buffer, buffer.count)
            if n < 0 && errno == EINTR { continue }
            guard n >= 0 else { throw SevraError.refused("Could not read the saved document.") }
            if n == 0 { break }
            data.append(contentsOf: buffer.prefix(n))
            guard data.count <= limit else { throw SevraError.refused("The document grew beyond the preview limit.") }
        }
        var after = stat()
        guard fstat(fd, &after) == 0, data.count == before.st_size,
              before.st_mtimespec.tv_sec == after.st_mtimespec.tv_sec, before.st_mtimespec.tv_nsec == after.st_mtimespec.tv_nsec,
              before.st_ctimespec.tv_sec == after.st_ctimespec.tv_sec, before.st_ctimespec.tv_nsec == after.st_ctimespec.tv_nsec,
              let text = String(data: data, encoding: .utf8) else {
            throw SevraError.conflict("The saved document changed during reading or is not UTF-8. Open it again after editing finishes.")
        }
        return text
    }
    private func currentHash() throws -> String? {
        guard fm.fileExists(atPath: record.path) else { return nil }
        return digestBytes(try Data(contentsOf: record))
    }
    public func save(_ state: HomeState, artifact: ArtifactProposal? = nil) throws {
        try save(state, artifacts: artifact.map { [$0] } ?? [], extraDocuments: [], files: [])
    }
    func save(_ state: HomeState, artifact: ArtifactProposal? = nil, extraDocuments: [Document], files: [OwnedFile]) throws {
        try save(state, artifacts: artifact.map { [$0] } ?? [], extraDocuments: extraDocuments, files: files)
    }
    /// One transaction for the latest state plus everything it publishes:
    /// several artifacts, extra records and owned files may ride in one save.
    func save(_ state: HomeState, artifacts: [ArtifactProposal], extraDocuments: [Document], files: [OwnedFile]) throws {
        try verify()
        for artifact in artifacts {
            try Self.validateFilename(artifact.filename)
            guard !artifact.content.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty,
                  artifact.content.utf8.count <= 65536 else { throw SevraError.refused("The proposed document is empty or too large.") }
        }
        guard Set(artifacts.map(\.filename)).count == artifacts.count else { throw SevraError.refused("Two documents in one save cannot share a filename.") }
        // Incognito is removed at this final serializer boundary as well as by
        // the caller. Its drafts, messages, proposals and receipts never enter disk.
        var persistent = state
        persistent.threads.removeAll { $0.mode == .incognito }
        let ids = Set(persistent.threads.map(\.id))
        guard persistent.schema == 1, persistent.threads.filter({ $0.id == "home" }).count == 1, ids.count == persistent.threads.count else {
            throw SevraError.refused("Home must have a supported schema, one Home stream and unique thread identities.")
        }
        persistent.submissions = persistent.submissions?.filter { ids.contains($0.threadID) }
        persistent.storageLayout = 2
        for file in files { try Self.validateOwnedPath(file.path) }
        var documents = try prepareDocuments(persistent)
        // A later version of the same record replaces an earlier one.
        var extras: [String: Int] = [:]
        for document in extraDocuments {
            if let at = extras[document.path] { documents[at] = document }
            else { extras[document.path] = documents.count; documents.append(document) }
        }
        var replaced: [String: String] = [:]
        for document in documents { if let hash = documentHashes[document.path] { replaced[document.path] = hash } }
        let intent = Intent(state: nil, index: try Self.indexText(persistent), previousHash: expectedHash, artifact: nil,
                            artifacts: artifacts.isEmpty ? nil : artifacts, documents: documents, previousDocuments: nil,
                            replaced: replaced, files: files.isEmpty ? nil : files)
        // The intent is the commit point: fully flushed before any record
        // changes, so an interrupted save always finishes on restart.
        try durable(try encoded(intent), at: recovery)
        try fault?("intent")
        try apply(intent)
        persisted = persistent
    }
    /// The index record: every thread's metadata without its history, drafts
    /// or review payloads, which live in their own records.
    static func indexText(_ state: HomeState) throws -> String {
        var index = state
        for i in index.threads.indices {
            index.threads[i].messages = []; index.threads[i].draft = ""
            index.threads[i].run?.excerpts = nil; index.threads[i].run?.proposal = nil; index.threads[i].run?.trace = []
            index.threads[i].run?.changes = nil; index.threads[i].run?.appProposal = nil; index.threads[i].run?.skillProposal = nil
            index.threads[i].pastRuns = nil
        }
        return String(decoding: try encoded(index), as: UTF8.self)
    }
    private func prepareDocuments(_ state: HomeState) throws -> [Document] {
        var documents: [Document] = []
        let calendar = Calendar(identifier: .gregorian)
        let now = Date(), year = calendar.component(.year, from: now), month = calendar.component(.month, from: now)
        var previous: [String: WorkThread] = [:]
        for thread in persisted?.threads ?? [] { previous[thread.id] = thread }
        let layout = persisted?.storageLayout == 2
        for thread in state.threads {
            guard thread.id == "home" || UUID(uuidString: thread.id) != nil else { throw SevraError.refused("Invalid stored thread identity.") }
            var record = thread; record.draft = ""
            let old = previous[thread.id]
            var oldRecord = old; oldRecord?.draft = ""
            // A draft-only change moves only the draft revision. The index
            // carries that revision, so the whole thread record, with every
            // message, is not rewritten for each autosave.
            var compared = record; compared.draftRevision = oldRecord?.draftRevision
            let unchanged = compared == oldRecord
            if !unchanged || documentHashes["records/threads/\(thread.id).md"] == nil {
                documents.append(Document(path: "records/threads/\(thread.id).md", type: "sevra-thread", body: String(decoding: try encoded(record), as: UTF8.self), immutable: false))
            }
            if thread.draft != old?.draft || documentHashes["records/drafts/\(thread.id).md"] == nil {
                documents.append(Document(path: "records/drafts/\(thread.id).md", type: "sevra-draft", body: String(decoding: try encoded(thread.draft), as: UTF8.self), immutable: false))
            }
            // Messages and excerpts are part of the record, so an unchanged
            // record has no new ones to log.
            guard !(layout && unchanged) else { continue }
            var oldMessages: [String: Message] = [:]
            for message in old?.messages ?? [] { oldMessages[message.id] = message }
            for message in thread.messages where !message.text.isEmpty {
                guard !layout || oldMessages[message.id] != message else { continue }
                let payload = storedJSON(["thread_id": thread.id, "message_id": message.id, "role": message.role, "text": message.text, "run_id": message.runID ?? "", "revision": state.revision])
                let name = "event-\(state.revision)-" + digestText(payload).prefix(24) + ".md"
                documents.append(Document(path: String(format: "sources/conversations/%04d/%02d/", year, month) + name, type: "note", body: payload, immutable: true))
            }
            if let run = thread.run {
                for excerpt in run.excerpts ?? [] where !(old?.run?.id == run.id && old?.run?.excerpts?.contains(excerpt) == true) {
                    let payload = String(decoding: try encoded(excerpt), as: UTF8.self)
                    let name = run.id + "-" + excerpt.id + "-" + digestText(payload).prefix(24) + ".md"
                    documents.append(Document(path: String(format: "sources/excerpts/%04d/%02d/", year, month) + name, type: "note", body: payload, immutable: true))
                }
            }
        }
        return documents
    }
    /// Applies a durable intent. Every step is idempotent, so a restart that
    /// finds the intent finishes it. Ordinary saves read nothing back through
    /// dbmd: a record's hash already proves it is the predecessor. Only a
    /// replay, where a record may already hold its new body, compares bodies.
    ///
    /// Durability: the intent was fully flushed before this runs. Each written
    /// file is pushed to the device with fsync, and one full flush of the
    /// ledger at the end empties the drive cache, making the whole save
    /// durable before the intent is removed. Until then, a power loss replays
    /// the intent.
    private func apply(_ intent: Intent) throws {
        let text: String
        if let index = intent.index { text = index }
        else if let state = intent.state {
            if intent.documents != nil { text = try Self.indexText(state) }
            else { text = String(decoding: try encoded(state), as: UTF8.self) }
        } else { throw SevraError.conflict("An interrupted save could not be read. Recovery preserved the existing files.") }
        let current = try currentHash()
        // A restart can find the exact next body already written by dbmd but
        // no completion receipt. It may finish this intent, never overwrite a
        // different external revision with the cached predecessor.
        let alreadyWritten = try current != intent.previousHash && fm.fileExists(atPath: record.path) && body(record) == text
        guard current == intent.previousHash || alreadyWritten else {
            throw SevraError.conflict("An interrupted save conflicts with external edits. Recovery preserved both versions.")
        }
        var nextHashes = intent.previousDocuments ?? documentHashes
        if nextHashes["DB.md"] == nil { nextHashes["DB.md"] = digestBytes(try Data(contentsOf: root.appendingPathComponent("db/DB.md"))) }
        for document in intent.documents ?? [] {
            let url = root.appendingPathComponent("db/" + document.path)
            try checkPlainPath(url)
            if fm.fileExists(atPath: url.path) {
                let previous = intent.replaced?[document.path] ?? intent.previousDocuments?[document.path]
                if !document.immutable, let previous, digestBytes(try Data(contentsOf: url)) == previous {
                    try writeDocument(document, existing: true)
                } else if try body(url) != document.body {
                    throw SevraError.conflict("Recovery found a different document at \(document.path). Both versions are preserved.")
                }
                // Otherwise an interrupted attempt already wrote this body.
            } else {
                try writeDocument(document, existing: false)
            }
            nextHashes[document.path] = try hashWritten(document.path)
        }
        try fault?("documents")
        for file in intent.files ?? [] {
            try Self.validateOwnedPath(file.path)
            let target = root.appendingPathComponent(file.path)
            try fm.createDirectory(at: target.deletingLastPathComponent(), withIntermediateDirectories: true, attributes: [.posixPermissions: 0o700])
            try checkPlainPath(target)
            if fm.fileExists(atPath: target.path) {
                guard digestBytes(try Data(contentsOf: target)) == digestBytes(file.content) else {
                    throw SevraError.conflict("An extension file already exists with different content: \(file.path).")
                }
                continue
            }
            let stage = root.appendingPathComponent(".sevra/owned-stage")
            try durable(file.content, at: stage, .pushed)
            guard link(stage.path, target.path) == 0 else { throw SevraError.conflict("Could not publish \(file.path) without replacing a file.") }
            try syncDirectory(target.deletingLastPathComponent())
            try fm.removeItem(at: stage)
        }
        if intent.files != nil { try fault?("files") }
        for artifact in (intent.artifacts ?? []) + (intent.artifact.map { [$0] } ?? []) {
            try Self.validateFilename(artifact.filename)
            let target = root.appendingPathComponent("artifacts/" + artifact.filename)
            try checkPlainPath(target)
            if fm.fileExists(atPath: target.path) {
                guard digestBytes(try Data(contentsOf: target)) == digestText(artifact.content) else {
                    throw SevraError.conflict("The artifact destination already contains different content.")
                }
            } else {
                let stage = root.appendingPathComponent(".sevra/artifact-stage")
                try durable(Data(artifact.content.utf8), at: stage, .pushed)
                // link is create-only publication on this same filesystem.
                guard link(stage.path, target.path) == 0 else { throw SevraError.conflict("Could not create the artifact without replacing a file.") }
                try syncDirectory(target.deletingLastPathComponent())
                try fm.removeItem(at: stage)
            }
            try fault?("artifact")
        }
        if !alreadyWritten {
            // dbmd reads this scratch body and it is deleted right after, so
            // it needs no flush of its own.
            let temp = root.appendingPathComponent(".sevra/record-body")
            try durable(Data(text.utf8), at: temp, .none)
            defer { try? fm.removeItem(at: temp) }
            if current == nil {
                _ = try command(["write", "records/state/home.md", "--dir", root.appendingPathComponent("db").path, "--type", "sevra-home", "--summary", "Sevra Home state and conversation history", "--fm", "meta-type=operational", "--body-file", temp.path, "--json"])
            } else {
                _ = try command(["body", "set", record.path, "--body-file", temp.path, "--json"])
            }
            try syncFile(record, full: false)
            try syncDirectory(record.deletingLastPathComponent())
        }
        try fault?("record")
        expectedHash = try currentHash()
        guard let expectedHash else { throw SevraError.conflict("Saved record is missing.") }
        try durable(try encoded(expectedHash), at: integrity, .pushed)
        // The one full flush: it empties the drive cache, which now holds every
        // write above, so the save is durable before the intent goes.
        try durable(try encoded(nextHashes), at: documentsLedger)
        documentHashes = nextHashes
        try fm.removeItem(at: recovery)
        try syncDirectory(recovery.deletingLastPathComponent())
    }
    private func checkPlainPath(_ url: URL) throws {
        var cursor = root
        let components = url.path.dropFirst(root.path.count).split(separator: "/")
        for component in components {
            cursor.appendPathComponent(String(component))
            var s = stat()
            if lstat(cursor.path, &s) == 0 {
                guard s.st_mode & S_IFMT == S_IFREG || s.st_mode & S_IFMT == S_IFDIR else { throw SevraError.refused("Home storage requires ordinary files and folders; symbolic links and special files are refused.") }
            }
        }
    }
    private func writeDocument(_ doc: Document, existing: Bool) throws {
        // A scratch body for dbmd, deleted right after; no flush needed.
        let temp = root.appendingPathComponent(".sevra/document-body")
        try durable(Data(doc.body.utf8), at: temp, .none)
        defer { try? fm.removeItem(at: temp) }
        let url = root.appendingPathComponent("db/" + doc.path)
        if existing { _ = try command(["body", "set", url.path, "--body-file", temp.path, "--json"]) }
        else {
            let result = try command(["write", doc.path, "--dir", root.appendingPathComponent("db").path, "--type", doc.type, "--summary", doc.summary ?? (doc.immutable ? "Immutable conversation event" : "Sevra thread or unsent draft"), "--body-file", temp.path, "--json"])
            if let object = try JSONSerialization.jsonObject(with: result) as? [String: Any], let actual = object["written"] as? String, actual != doc.path {
                _ = try command(["rename", actual, doc.path, "--json"])
            }
        }
        // Pushed to the device now; the save's final full flush makes it durable.
        try syncFile(url, full: false); try syncDirectory(url.deletingLastPathComponent())
    }
    static func validateOwnedPath(_ path: String) throws {
        let parts = path.split(separator: "/", omittingEmptySubsequences: false)
        guard parts.count >= 3, parts[0] == "extensions", ["miniapps", "skills"].contains(parts[1]),
              parts.allSatisfy({ !$0.isEmpty && $0 != "." && $0 != ".." && !$0.hasPrefix(".") && $0.utf8.count <= 128 }) else {
            throw SevraError.refused("Invalid extension file path.")
        }
    }
    /// The documents Sevra tracks under a prefix, such as app records.
    func documents(under prefix: String) -> [String] { documentHashes.keys.filter { $0.hasPrefix(prefix) }.sorted() }
    /// Reads a tracked record's body. The bytes must match the integrity
    /// ledger, which proves they are exactly what dbmd wrote for Sevra.
    func trackedBody(_ path: String) throws -> String {
        guard let expected = documentHashes[path] else { throw SevraError.refused("Unknown Home record.") }
        let url = root.appendingPathComponent("db/" + path)
        try checkPlainPath(url)
        let data = try Data(contentsOf: url)
        guard digestBytes(data) == expected else { throw SevraError.conflict("A Home record changed outside Sevra: \(path). Writes and AI context are paused; its bytes are preserved.") }
        let text = String(decoding: data, as: UTF8.self)
        let body = RecordText.body(of: text)
        return body.isEmpty ? try self.body(url) : body.trimmingCharacters(in: .newlines)
    }
    func readOwned(_ path: String, limit: Int) throws -> Data { try Self.readOwned(path, at: root, limit: limit) }
    /// Reads an app or skill file by Home folder alone. Callers compare the
    /// bytes with the digest recorded when the person approved them.
    static func readOwned(_ path: String, at root: URL, limit: Int) throws -> Data {
        try validateOwnedPath(path)
        return try HomeArchive.read(path, at: root, limit: limit)
    }
    /// Grants are device control state. The owner is the only writer, so a
    /// cached copy stays exact after the first read.
    func grants() -> [String: AppGrant] {
        if let grantCache { return grantCache }
        let value = (try? Data(contentsOf: grantsURL)).flatMap { try? decoded([String: AppGrant].self, $0) } ?? [:]
        grantCache = value
        return value
    }
    func saveGrants(_ grants: [String: AppGrant]) throws {
        try durable(try encoded(grants), at: grantsURL)
        grantCache = grants
    }
    private var grantCache: [String: AppGrant]?

    public static func validateFilename(_ name: String) throws {
        guard !name.hasPrefix("."), name.hasSuffix(".md"), name.utf8.count <= 100,
              !name.isEmpty, name.unicodeScalars.allSatisfy({ CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.").contains($0) }) else {
            throw SevraError.refused("Use a simple Markdown filename without folders, such as briefing.md.")
        }
    }
    private func body(_ path: URL) throws -> String {
        let result = try command(["show", path.path, "--json"])
        let object = try JSONSerialization.jsonObject(with: result)
        if let text = object as? String { return text.trimmingCharacters(in: .newlines) }
        if let d = object as? [String: Any], let text = d["body"] as? String { return text.trimmingCharacters(in: .newlines) }
        throw SevraError.unavailable("Unexpected db.md response for a record body.")
    }
    @discardableResult private func command(_ arguments: [String]) throws -> Data {
        let p = Process(); p.executableURL = dbmd; p.arguments = arguments; p.currentDirectoryURL = root.appendingPathComponent("db")
        p.environment = ["HOME": NSHomeDirectory(), "PATH": "/usr/bin:/bin", "LANG": "en_US.UTF-8"]
        let output = Pipe(); p.standardOutput = output; p.standardError = output
        try p.run()
        let timeout = DispatchWorkItem { if p.isRunning { p.terminate() } }
        let hardTimeout = DispatchWorkItem { if p.isRunning { kill(p.processIdentifier, SIGKILL) } }
        DispatchQueue.global().asyncAfter(deadline: .now() + 15, execute: timeout)
        DispatchQueue.global().asyncAfter(deadline: .now() + 17, execute: hardTimeout)
        defer { timeout.cancel(); hardTimeout.cancel() }
        var result = Data()
        while let next = try output.fileHandleForReading.read(upToCount: 65536), !next.isEmpty {
            guard result.count + next.count <= 16 * 1024 * 1024 else { kill(p.processIdentifier, SIGKILL); p.waitUntilExit(); throw SevraError.refused("db.md returned more than the response budget.") }
            result.append(next)
        }
        p.waitUntilExit()
        guard p.terminationStatus == 0 else { throw SevraError.refused("db.md could not complete the operation: " + String(decoding: result.prefix(2048), as: UTF8.self)) }
        return result
    }
}

/// `full` asks the drive to empty its cache (F_FULLFSYNC). Without it the
/// data is pushed to the device, and a later full flush makes it durable.
func syncFile(_ url: URL, full: Bool = true) throws {
    let fd = open(url.path, O_RDONLY | O_NOFOLLOW | O_CLOEXEC)
    guard fd >= 0 else { throw SevraError.refused("Cannot open saved file for synchronization.") }
    defer { close(fd) }
    guard (full ? fcntl(fd, F_FULLFSYNC) : fsync(fd)) == 0 else { throw SevraError.refused("Storage did not acknowledge a durable save.") }
}
/// How far `durable` carries a write before it returns.
enum Durability {
    /// Written and renamed into place only: scratch files deleted right after.
    case none
    /// Pushed to the device (fsync). A later full flush makes it durable.
    case pushed
    /// On stable storage (F_FULLFSYNC), including every earlier pushed write.
    case flushed
}
func syncDirectory(_ url: URL) throws {
    let fd = open(url.path, O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC)
    guard fd >= 0 else { throw SevraError.refused("Cannot open the save directory.") }
    defer { close(fd) }
    guard fsync(fd) == 0 else { throw SevraError.refused("Could not synchronize the save directory.") }
}
func durable(_ data: Data, at url: URL, _ level: Durability = .flushed) throws {
    let temp = url.deletingLastPathComponent().appendingPathComponent(".write-" + UUID().uuidString)
    let fd = open(temp.path, O_WRONLY | O_CREAT | O_EXCL | O_NOFOLLOW | O_CLOEXEC, 0o600)
    guard fd >= 0 else { throw SevraError.refused("Cannot stage a save. Check free space and folder access.") }
    defer { close(fd); unlink(temp.path) }
    try data.withUnsafeBytes { bytes in
        var offset = 0
        while offset < bytes.count {
            let count = Darwin.write(fd, bytes.baseAddress!.advanced(by: offset), bytes.count - offset)
            if count < 0 && errno == EINTR { continue }
            guard count > 0 else { throw SevraError.refused("Storage failed during save. Your previous revision is preserved.") }
            offset += count
        }
    }
    let synced: Int32
    switch level {
    case .none: synced = 0
    case .pushed: synced = fsync(fd)
    case .flushed: synced = fcntl(fd, F_FULLFSYNC)
    }
    guard synced == 0, rename(temp.path, url.path) == 0 else { throw SevraError.refused("Storage did not confirm the save.") }
    if level != .none { try syncDirectory(url.deletingLastPathComponent()) }
}
