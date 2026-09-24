import Foundation
import Darwin

/// One staged change to a file in an attachment the person allowed Sevra to
/// change. Nothing is written until the person approves the whole set.
public struct FileChange: Codable, Sendable, Equatable, Identifiable {
    public enum Operation: String, Codable, Sendable { case create, update, recordCreate, recordUpdate }
    public enum Status: String, Codable, Sendable { case pending, applied, undone, conflict, skipped }
    public var id: String
    public var operation: Operation
    public var attachment: String
    public var path: String
    public var display: String
    public var baseHash: String?
    /// The complete new text. Cleared after the set is applied; the review
    /// preview and the undo copy in Home remain.
    public var content: String
    public var recordType: String?
    public var recordSummary: String?
    public var fileID: String?
    public var preview: [DiffLine] = []
    public var previewTruncated = false
    public var added = 0
    public var removed = 0
    public var status: Status = .pending
    public var appliedHash: String?
    public var appliedPath: String?
    public var createdFolders: [String]?
    /// Where an undone new file went in the Trash.
    public var trashedPath: String?
    /// Working state while staging; never persisted.
    public var before: String?

    enum CodingKeys: String, CodingKey {
        case id, operation, attachment, path, display, baseHash, content, recordType, recordSummary, fileID, preview, previewTruncated, added, removed, status, appliedHash, appliedPath, createdFolders, trashedPath
    }
    public init(id: String, operation: Operation, attachment: String, path: String, display: String, baseHash: String?, content: String) {
        self.id = id; self.operation = operation; self.attachment = attachment; self.path = path; self.display = display; self.baseHash = baseHash; self.content = content
    }
    public var isRecord: Bool { operation == .recordCreate || operation == .recordUpdate }
    public var isCreation: Bool { operation == .create || operation == .recordCreate }
}

public struct DiffLine: Codable, Sendable, Equatable {
    public enum Kind: String, Codable, Sendable { case same, added, removed, gap }
    public var kind: Kind
    public var text: String
    public var oldLine: Int?
    public var newLine: Int?
}

public struct AttachmentRoot: Codable, Sendable, Equatable {
    public var name: String
    public var path: String
    public var kind: AttachmentKind
    public var device: Int64
    public var inode: UInt64
}

public struct ChangeSet: Codable, Sendable, Equatable, Identifiable {
    public enum State: String, Codable, Sendable { case proposed, applying, applied, partial, undone, rejected }
    public var id: String
    public var changes: [FileChange]
    public var roots: [String: AttachmentRoot]
    public var state: State = .proposed
    public var applied: Date?
    public var note: String?
    /// Binds approval to the exact reviewed operations and bases.
    public var digest: String {
        let parts = changes.map { [$0.id, $0.operation.rawValue, $0.attachment, $0.path, $0.baseHash ?? "", digestText($0.content), $0.recordType ?? "", $0.recordSummary ?? ""].joined(separator: "\u{1F}") }
        let roots = self.roots.keys.sorted().map { key in "\(key)=\(self.roots[key]!.device):\(self.roots[key]!.inode)" }
        return digestText(([id] + parts + roots).joined(separator: "\u{1E}"))
    }
    public var summary: String {
        let created = changes.filter(\.isCreation).count, updated = changes.count - created
        return [created > 0 ? "\(created) new" : nil, updated > 0 ? "\(updated) changed" : nil].compactMap { $0 }.joined(separator: ", ")
    }
}

enum LineDiff {
    static let previewLines = 600
    static let lineCharacters = 400
    /// Unified-style preview with two lines of context around each change.
    /// Largest changed region, in old lines times new lines, aligned line by
    /// line. Alignment time grows with its square; past this, the region is
    /// shown as removed and then added, which is still exactly what changes.
    static let alignmentBudget = 4_000_000
    static func preview(before: String, after: String) -> (lines: [DiffLine], truncated: Bool, added: Int, removed: Int) {
        let old = before.isEmpty ? [] : before.components(separatedBy: "\n")
        let new = after.components(separatedBy: "\n")
        // Unchanged leading and trailing lines need no alignment.
        var prefix = 0
        while prefix < old.count, prefix < new.count, old[prefix] == new[prefix] { prefix += 1 }
        var suffix = 0
        while suffix < old.count - prefix, suffix < new.count - prefix, old[old.count - 1 - suffix] == new[new.count - 1 - suffix] { suffix += 1 }
        let oldChanged = Array(old[prefix..<(old.count - suffix)]), newChanged = Array(new[prefix..<(new.count - suffix)])
        var removedOffsets = Set<Int>(), insertedOffsets = Set<Int>()
        if oldChanged.count * newChanged.count <= alignmentBudget {
            for change in newChanged.difference(from: oldChanged) {
                switch change {
                case .remove(let offset, _, _): removedOffsets.insert(prefix + offset)
                case .insert(let offset, _, _): insertedOffsets.insert(prefix + offset)
                }
            }
        } else {
            removedOffsets = Set(prefix..<(old.count - suffix))
            insertedOffsets = Set(prefix..<(new.count - suffix))
        }
        var all: [DiffLine] = []
        var i = 0, j = 0
        func clip(_ s: String) -> String { s.count > lineCharacters ? String(s.prefix(lineCharacters)) + "…" : s }
        while i < old.count || j < new.count {
            if i < old.count && removedOffsets.contains(i) { all.append(DiffLine(kind: .removed, text: clip(old[i]), oldLine: i + 1)); i += 1 }
            else if j < new.count && insertedOffsets.contains(j) { all.append(DiffLine(kind: .added, text: clip(new[j]), newLine: j + 1)); j += 1 }
            else if i < old.count && j < new.count { all.append(DiffLine(kind: .same, text: clip(old[i]), oldLine: i + 1, newLine: j + 1)); i += 1; j += 1 }
            else if i < old.count { all.append(DiffLine(kind: .removed, text: clip(old[i]), oldLine: i + 1)); i += 1 }
            else { all.append(DiffLine(kind: .added, text: clip(new[j]), newLine: j + 1)); j += 1 }
        }
        let changed = all.indices.filter { all[$0].kind != .same }
        var keep = Set<Int>()
        for index in changed { for k in max(0, index - 2)...min(all.count - 1, index + 2) { keep.insert(k) } }
        var lines: [DiffLine] = []
        var previous: Int?
        for index in keep.sorted() {
            if let previous, index > previous + 1 { lines.append(DiffLine(kind: .gap, text: "")) }
            lines.append(all[index]); previous = index
        }
        let truncated = lines.count > previewLines
        return (Array(lines.prefix(previewLines)), truncated, all.filter { $0.kind == .added }.count, all.filter { $0.kind == .removed }.count)
    }
}

/// Applies and reverses approved change sets through the attachment's folder
/// descriptor. Every change is checked against the exact reviewed base, and
/// the previous bytes are kept in Home before anything is replaced.
struct ChangeApplier {
    let session: SourceSession
    let home: URL
    /// Check dependency: called after each durable step, to prove recovery.
    var fault: (@Sendable (String) -> Void)? = nil

    var folder: URL { home.appendingPathComponent("changes") }

    func attachment(for change: FileChange, in set: ChangeSet) throws -> Attachment {
        guard let root = set.roots[change.attachment] else { throw SevraError.refused("This change set is missing its folder identity.") }
        guard let attachment = session.attachments.first(where: { Int64($0.device) == root.device && UInt64($0.inode) == root.inode }) else {
            throw SevraError.refused("Attach \(root.name) again to change it. Sevra keeps folder access only while the folder is attached.")
        }
        guard attachment.access == .change else { throw SevraError.refused("\(root.name) is attached read-only now. Allow changes to it first.") }
        return attachment
    }

    /// Walks to the parent folder of `path` without following links, creating
    /// missing folders when asked. Returns the parent descriptor and name.
    func parent(of path: String, in attachment: Attachment, create: Bool, created: inout [String]) throws -> (Int32, String) {
        let parts = path.split(separator: "/").map(String.init)
        guard let name = parts.last else { throw SevraError.refused("Invalid path.") }
        var fd = dup(attachment.descriptor)
        var walked = ""
        for component in parts.dropLast() {
            walked += (walked.isEmpty ? "" : "/") + component
            var next = openat(fd, component, O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC)
            if next < 0 && errno == ENOENT && create {
                guard mkdirat(fd, component, 0o755) == 0 || errno == EEXIST else { close(fd); throw SevraError.refused("Could not create the folder \(walked).") }
                created.append(walked)
                next = openat(fd, component, O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC)
            }
            close(fd)
            guard next >= 0 else { throw SevraError.refused("\(attachment.name)/\(walked) is missing or is not an ordinary folder.") }
            fd = next
        }
        return (fd, name)
    }

    func readFile(_ directory: Int32, _ name: String) throws -> (Data, stat) {
        let fd = openat(directory, name, O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
        guard fd >= 0 else { throw SevraError.conflict("\(name) is missing or is not an ordinary file.") }
        defer { close(fd) }
        var info = stat()
        guard fstat(fd, &info) == 0, info.st_mode & S_IFMT == S_IFREG, info.st_size <= Int64(SourceLimits.textBytes) else { throw SevraError.conflict("\(name) is not an ordinary text file.") }
        var data = Data(), buffer = [UInt8](repeating: 0, count: 65536)
        while true {
            let n = read(fd, &buffer, buffer.count)
            if n < 0 && errno == EINTR { continue }
            guard n >= 0 else { throw SevraError.conflict("Could not read \(name).") }
            if n == 0 { break }
            data.append(contentsOf: buffer.prefix(n))
        }
        return (data, info)
    }

    /// Writes `data` next to the target and atomically puts it in place.
    /// With `replace`, the old file is swapped out, verified and removed; a
    /// mismatch swaps it back so a concurrent edit is never lost.
    func place(_ data: Data, directory: Int32, name: String, replace: (hash: String, info: stat)?, tag: String) throws {
        let temporary = ".sevra-\(tag).tmp"
        unlinkat(directory, temporary, 0)
        let mode: mode_t = replace.map { $0.info.st_mode & 0o7777 } ?? 0o644
        let fd = openat(directory, temporary, O_WRONLY | O_CREAT | O_EXCL | O_NOFOLLOW | O_CLOEXEC, mode)
        guard fd >= 0 else { throw SevraError.refused("Could not stage the new file next to \(name).") }
        var closed = false
        defer { if !closed { close(fd) } }
        if let replace {
            // Keep Finder tags, extended attributes and permissions.
            let source = openat(directory, name, O_RDONLY | O_NOFOLLOW | O_CLOEXEC)
            if source >= 0 { _ = fcopyfile(source, fd, nil, copyfile_flags_t(COPYFILE_XATTR | COPYFILE_ACL)); close(source) }
            fchmod(fd, replace.info.st_mode & 0o7777)
        }
        try data.withUnsafeBytes { raw in
            var offset = 0
            while offset < raw.count {
                let n = write(fd, raw.baseAddress!.advanced(by: offset), raw.count - offset)
                if n < 0 && errno == EINTR { continue }
                guard n > 0 else { unlinkat(directory, temporary, 0); throw SevraError.refused("Storage failed while writing \(name).") }
                offset += n
            }
        }
        guard fcntl(fd, F_FULLFSYNC) == 0 else { unlinkat(directory, temporary, 0); throw SevraError.refused("Storage did not confirm \(name).") }
        close(fd); closed = true
        if let replace {
            guard replace.info.st_nlink <= 1 else { unlinkat(directory, temporary, 0); throw SevraError.refused("\(name) has other hard links, so Sevra will not replace it.") }
            guard renameatx_np(directory, temporary, directory, name, UInt32(RENAME_SWAP)) == 0 else {
                unlinkat(directory, temporary, 0); throw SevraError.conflict("\(name) changed or disappeared. Nothing was replaced.")
            }
            // The old file now has the temporary name. Confirm it is exactly
            // the reviewed base before discarding it.
            let old = try? readFile(directory, temporary)
            guard let old, digestBytes(old.0) == replace.hash, old.1.st_ino == replace.info.st_ino else {
                renameatx_np(directory, temporary, directory, name, UInt32(RENAME_SWAP))
                unlinkat(directory, temporary, 0)
                throw SevraError.conflict("\(name) changed while Sevra was saving. Your version was kept.")
            }
            unlinkat(directory, temporary, 0)
        } else {
            guard renameatx_np(directory, temporary, directory, name, UInt32(RENAME_EXCL)) == 0 else {
                unlinkat(directory, temporary, 0); throw SevraError.conflict("\(name) already exists. Nothing was replaced.")
            }
        }
        fsync(directory)
    }

    func manifestURL(_ set: ChangeSet) -> URL { folder.appendingPathComponent(set.id).appendingPathComponent("manifest.json") }

    func prepare(_ set: ChangeSet) throws {
        try FileManager.default.createDirectory(at: folder.appendingPathComponent(set.id), withIntermediateDirectories: true, attributes: [.posixPermissions: 0o700])
    }

    func record(_ set: ChangeSet) throws {
        try prepare(set)
        var stored = set
        for i in stored.changes.indices { stored.changes[i].content = ""; stored.changes[i].preview = [] }
        try durable(try encoded(stored), at: manifestURL(set))
    }

    func saveBefore(_ data: Data, set: ChangeSet, change: FileChange) throws {
        try durable(data, at: folder.appendingPathComponent(set.id).appendingPathComponent(change.id + ".before"))
    }

    func loadBefore(set: ChangeSet, change: FileChange) throws -> Data {
        let data = try HomeArchive.read("changes/\(set.id)/\(change.id).before", at: home)
        guard digestBytes(data) == change.baseHash else { throw SevraError.conflict("The saved previous version of \(change.display) is damaged.") }
        return data
    }

    func apply(_ original: ChangeSet, cancellation: Cancellation) throws -> ChangeSet {
        var set = original
        set.state = .applying
        try prepare(set)
        // Check every base first so a stale set changes nothing.
        for change in set.changes {
            let attachment = try attachment(for: change, in: set)
            var none: [String] = []
            if change.isCreation {
                if change.operation == .create, let (fd, name) = try? parent(of: change.path, in: attachment, create: false, created: &none) {
                    var info = stat()
                    let exists = fstatat(fd, name, &info, AT_SYMLINK_NOFOLLOW) == 0
                    close(fd)
                    guard !exists else { throw SevraError.conflict("\(change.display) now exists. Nothing was changed.") }
                }
            } else {
                let (fd, name) = try parent(of: change.path, in: attachment, create: false, created: &none)
                defer { close(fd) }
                let (data, _) = try readFile(fd, name)
                guard digestBytes(data) == change.baseHash else { throw SevraError.conflict("\(change.display) changed after Sevra read it. Nothing was changed. Ask again to work from the current text.") }
                try saveBefore(data, set: set, change: change)
            }
        }
        try record(set)
        var failure: Error?
        for i in set.changes.indices {
            do {
                try cancellation.check()
                let change = set.changes[i]
                let attachment = try attachment(for: change, in: set)
                if change.isRecord {
                    let tool = try session.tool(for: attachment)
                    if change.operation == .recordCreate {
                        let response = try tool.run(["write", change.path, "--type", change.recordType ?? "note", "--summary", change.recordSummary ?? "", "--body-file", "@BODY"],
                                                    write: true, input: Data(change.content.utf8), cancellation: nil)
                        let written = (response as? [String: Any])?["written"] as? String ?? change.path
                        set.changes[i].appliedPath = written
                        // db.md files a record by its type. Show where it went.
                        if written != change.path { set.changes[i].display = attachment.name + "/" + written }
                    } else {
                        // dbmd has no compare-and-set, so check the reviewed base
                        // again just before it rewrites the record. An edit made
                        // while earlier changes were written is kept.
                        var walked: [String] = []
                        let (fd, name) = try parent(of: change.path, in: attachment, create: false, created: &walked)
                        let current = Result { try readFile(fd, name).0 }
                        close(fd)
                        guard digestBytes(try current.get()) == change.baseHash else { throw SevraError.conflict("\(change.display) changed after Sevra read it. Your version was kept.") }
                        _ = try tool.run(["body", "set", change.path, "--body-file", "@BODY"], write: true, input: Data(RecordText.body(of: change.content).utf8), cancellation: nil)
                        set.changes[i].appliedPath = change.path
                    }
                    var none: [String] = []
                    let (fd, name) = try parent(of: set.changes[i].appliedPath!, in: attachment, create: false, created: &none)
                    defer { close(fd) }
                    set.changes[i].appliedHash = digestBytes(try readFile(fd, name).0)
                } else {
                    var created: [String] = []
                    let (fd, name) = try parent(of: change.path, in: attachment, create: change.isCreation, created: &created)
                    defer { close(fd) }
                    let data = Data(change.content.utf8)
                    if change.isCreation {
                        try place(data, directory: fd, name: name, replace: nil, tag: "\(set.id)-\(change.id)")
                    } else {
                        let (current, info) = try readFile(fd, name)
                        guard digestBytes(current) == change.baseHash else { throw SevraError.conflict("\(change.display) changed after Sevra read it.") }
                        try place(data, directory: fd, name: name, replace: (change.baseHash!, info), tag: "\(set.id)-\(change.id)")
                    }
                    set.changes[i].appliedHash = digestBytes(data)
                    set.changes[i].appliedPath = change.path
                    set.changes[i].createdFolders = created.isEmpty ? nil : created
                }
                set.changes[i].status = .applied
                try record(set)
                fault?("applied-\(i + 1)")
            } catch {
                set.changes[i].status = .conflict
                failure = error
                for j in (i + 1)..<set.changes.count { set.changes[j].status = .skipped }
                break
            }
        }
        set.applied = Date()
        set.state = failure == nil ? .applied : (set.changes.contains { $0.status == .applied } ? .partial : .rejected)
        set.note = failure.map { ($0 as? LocalizedError)?.errorDescription ?? $0.localizedDescription }
        try record(set)
        for i in set.changes.indices { set.changes[i].content = "" }
        return set
    }

    func undo(_ original: ChangeSet) throws -> ChangeSet {
        var set = original
        var problems: [String] = []
        var rebuilt = Set<String>()
        for i in set.changes.indices.reversed() where set.changes[i].status == .applied {
            let change = set.changes[i]
            do {
                let attachment = try attachment(for: change, in: set)
                var none: [String] = []
                let path = change.appliedPath ?? change.path
                let (fd, name) = try parent(of: path, in: attachment, create: false, created: &none)
                defer { close(fd) }
                let (current, info) = try readFile(fd, name)
                guard digestBytes(current) == change.appliedHash else { throw SevraError.conflict("\(change.display) was edited after Sevra changed it, so it was left as is.") }
                if change.isCreation {
                    set.changes[i].trashedPath = try trash(directory: fd, name: name, expected: change.appliedHash!, identity: info, tag: "\(set.id)-\(change.id)")
                    for folder in (change.createdFolders ?? []).reversed() { unlinkat(attachment.descriptor, folder, AT_REMOVEDIR) }
                } else {
                    let before = try loadBefore(set: set, change: change)
                    try place(before, directory: fd, name: name, replace: (change.appliedHash!, info), tag: "\(set.id)-\(change.id)-undo")
                }
                if change.isRecord, !rebuilt.contains(attachment.id) {
                    _ = try session.tool(for: attachment).run(["index", "rebuild"], write: true, cancellation: nil)
                    rebuilt.insert(attachment.id)
                }
                set.changes[i].status = .undone
            } catch {
                problems.append(describe(error))
            }
        }
        set.state = problems.isEmpty ? .undone : .partial
        set.note = problems.isEmpty ? nil : problems.joined(separator: " ")
        try record(set)
        return set
    }

    /// Moves a file Sevra created to the Trash without following a changed
    /// path: it first moves the file by handle into a private folder beside
    /// it, confirms it is the same verified file, then trashes that folder's
    /// entry. The file keeps its name in the Trash.
    func trash(directory: Int32, name: String, expected: String, identity: stat, tag: String) throws -> String? {
        let holder = ".sevra-undo-\(tag)"
        guard mkdirat(directory, holder, 0o700) == 0 else { throw SevraError.refused("Could not prepare to move \(name) to the Trash.") }
        let folder = openat(directory, holder, O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC)
        guard folder >= 0 else { unlinkat(directory, holder, AT_REMOVEDIR); throw SevraError.refused("Could not prepare to move \(name) to the Trash.") }
        defer { close(folder); unlinkat(directory, holder, AT_REMOVEDIR) }
        guard renameatx_np(directory, name, folder, name, UInt32(RENAME_EXCL)) == 0 else { throw SevraError.conflict("\(name) changed or disappeared, so it was left as is.") }
        func putBack() { _ = renameatx_np(folder, name, directory, name, UInt32(RENAME_EXCL)) }
        guard let moved = try? readFile(folder, name), moved.1.st_ino == identity.st_ino, moved.1.st_dev == identity.st_dev, digestBytes(moved.0) == expected else {
            putBack(); throw SevraError.conflict("\(name) was edited after Sevra created it, so it was left as is.")
        }
        var buffer = [CChar](repeating: 0, count: Int(MAXPATHLEN))
        guard fcntl(folder, F_GETPATH, &buffer) == 0 else { putBack(); throw SevraError.refused("Could not locate \(name) to move it to the Trash.") }
        let url = URL(fileURLWithPath: String(cString: buffer)).appendingPathComponent(name)
        var result: NSURL?
        do { try FileManager.default.trashItem(at: url, resultingItemURL: &result) }
        catch { putBack(); throw SevraError.refused("Could not move \(name) to the Trash. It was left in place.") }
        return result?.path
    }

    private func describe(_ error: Error) -> String { (error as? LocalizedError)?.errorDescription ?? error.localizedDescription }
}
