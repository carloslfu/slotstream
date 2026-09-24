import Foundation
import Darwin
import Slotstream

// Fresh operations inspect current directories. Continuations retain bounded
// native DIR streams: Darwin telldir cookies cannot be moved to a newly opened
// DIR. A process-wide lease budget evicts inactive streams under pressure.
// Directory identities and timestamps are checked before and after each page.
struct SourceStamp: Equatable {
    let device: dev_t
    let inode: ino_t
    let size: Int64
    let modifiedSeconds: Int
    let modifiedNanos: Int
    let changedSeconds: Int
    let changedNanos: Int
    init(_ value: stat) {
        device = value.st_dev; inode = value.st_ino; size = value.st_size
        modifiedSeconds = value.st_mtimespec.tv_sec; modifiedNanos = value.st_mtimespec.tv_nsec
        changedSeconds = value.st_ctimespec.tv_sec; changedNanos = value.st_ctimespec.tv_nsec
    }
}

final class SourceWork {
    let cancellation: Cancellation
    let deadline = ProcessInfo.processInfo.systemUptime + SourceLimits.operationSeconds
    var entries = 0
    init(_ cancellation: Cancellation) { self.cancellation = cancellation }
    func available() throws -> Bool {
        try cancellation.check()
        return entries < SourceLimits.enumerationEntries && ProcessInfo.processInfo.systemUptime < deadline
    }
}

struct SourceEntry {
    let attachment: Int
    let path: String
    let value: stat
    var directory: Bool { value.st_mode & S_IFMT == S_IFDIR }
}

private final class WeakSourceDirectory {
    weak var value: SourceDirectory?
    init(_ value: SourceDirectory) { self.value = value }
}

// Shared across threads and Homes. The recursive lock also covers closing an
// evicted stream, so concurrent sessions cannot exceed the descriptor budget.
private enum SourceDirectoryBudget {
    static let lock = NSRecursiveLock()
    static var frames: [WeakSourceDirectory] = []
    static func acquire(_ frame: SourceDirectory) throws {
        lock.lock(); defer { lock.unlock() }
        frames.removeAll { $0.value == nil || $0.value?.leased == false }
        while frames.count >= SourceLimits.directoryStreams {
            guard let index = frames.firstIndex(where: { $0.value?.inUse == false }) else {
                throw SevraError.refused("Other source operations are using the directory budget. Retry this operation with a narrower folder scope.")
            }
            frames.remove(at: index).value?.closeStream(expire: true)
        }
        frame.leased = true
        frames.append(WeakSourceDirectory(frame))
    }
}

final class SourceDirectory {
    let attachment: Int
    let path: String
    var stamp: SourceStamp?
    var stream: UnsafeMutablePointer<DIR>?
    fileprivate var leased = false
    fileprivate var inUse = true
    private var expired = false
    init(attachment: Int, path: String) { self.attachment = attachment; self.path = path }
    deinit { closeStream() }
    func setActive(_ active: Bool) {
        SourceDirectoryBudget.lock.lock(); defer { SourceDirectoryBudget.lock.unlock() }
        inUse = active
    }
    func closeStream(expire: Bool = false) {
        SourceDirectoryBudget.lock.lock(); defer { SourceDirectoryBudget.lock.unlock() }
        if let stream { closedir(stream); self.stream = nil }
        leased = false
        if expire { expired = true }
    }
    func open(in session: SourceSession) throws {
        guard !expired else { throw SevraError.refused("This directory cursor expired to release resources. Restart without a cursor.") }
        if stream != nil { return }
        try SourceDirectoryBudget.acquire(self)
        let fd: Int32
        do { fd = try session.openPath(attachment: attachment, path: path, directory: true) }
        catch { closeStream(); throw error }
        var value = stat()
        guard fstat(fd, &value) == 0 else { close(fd); closeStream(); throw SevraError.refused("Cannot inspect this directory.") }
        guard let opened = fdopendir(fd) else { close(fd); closeStream(); throw SevraError.refused("Cannot list this directory.") }
        stamp = SourceStamp(value); stream = opened
    }
    func verify(in session: SourceSession? = nil) throws {
        guard !expired else { throw SevraError.refused("This directory cursor expired to release resources. Restart without a cursor.") }
        guard let stream else { return }
        var value = stat()
        guard fstat(dirfd(stream), &value) == 0, stamp == SourceStamp(value) else { throw changed() }
        if let session {
            let fd = try session.openPath(attachment: attachment, path: path, directory: true); defer { close(fd) }
            guard fstat(fd, &value) == 0, stamp == SourceStamp(value) else { throw changed() }
        }
    }
    private func changed() -> SevraError {
        SevraError.refused("The directory changed during navigation. Restart this listing or search without a cursor to see its current contents.")
    }
}

final class SourceWalk {
    enum Step { case entry(SourceEntry), paused, end }
    let roots: [(attachment: Int, path: String)]
    let recursive: Bool
    var root = 0
    var stack: [SourceDirectory] = []
    var descend: SourceEntry?
    var pending: SourceEntry?
    var skipped: [String: Int] = [:]
    init(roots: [(Int, String)], recursive: Bool) { self.roots = roots; self.recursive = recursive }
    func skip(_ reason: String) { skipped[reason, default: 0] += 1 }
    func closeStreams() { stack.forEach { $0.closeStream() } }
    func pause() { stack.forEach { $0.setActive(false) } }
    func resume(in session: SourceSession) throws {
        // Verify every ancestor still names the same directory, not only the
        // leaf. This catches a replaced or renamed subtree between pages.
        for frame in stack { frame.setActive(true) }
        for frame in stack { try frame.verify(in: session) }
    }
    func verify() throws { for frame in stack { try frame.verify() } }
    func next(in session: SourceSession, work: SourceWork) throws -> Step {
        if let pending { self.pending = nil; return .entry(pending) }
        while try work.available() {
            if let descend {
                self.descend = nil
                let name = (descend.path as NSString).lastPathComponent
                if SourceLimits.skippedFolders.contains(name) || name.hasSuffix(".app") || name.hasSuffix(".xcodeproj") { skip("excluded_subtrees") }
                else if stack.count >= SourceLimits.traversalDepth { skip("depth_limited_subtrees") }
                else { stack.append(SourceDirectory(attachment: descend.attachment, path: descend.path)) }
            }
            if stack.isEmpty {
                guard root < roots.count else { return .end }
                let target = roots[root]; root += 1
                let attachment = session.attachments[target.attachment]
                if attachment.kind == .file {
                    do {
                        let item = try session.inspect(attachment: target.attachment, path: attachment.name)
                        let fd = try session.openItem(item); defer { close(fd) }
                        var value = stat()
                        guard fstat(fd, &value) == 0 else { skip("unreadable"); continue }
                        work.entries += 1
                        return .entry(SourceEntry(attachment: target.attachment, path: item.path, value: value))
                    } catch { skip("unreadable"); continue }
                }
                stack.append(SourceDirectory(attachment: target.attachment, path: target.path))
            }
            let frame = stack.last!
            do { try frame.open(in: session) }
            catch {
                // An existing cookie must never be silently skipped. A newly
                // encountered unreadable subtree is reported as incomplete.
                if frame.stamp != nil || stack.count == 1 { throw error }
                skip("unreadable_subtrees"); stack.removeLast(); continue
            }
            errno = 0
            guard let entry = readdir(frame.stream) else {
                guard errno == 0 else { throw SevraError.refused("Directory reading failed. Restart this listing or search.") }
                try frame.verify(); stack.removeLast(); continue
            }
            work.entries += 1
            let name = withUnsafePointer(to: &entry.pointee.d_name) { p in
                p.withMemoryRebound(to: CChar.self, capacity: Int(MAXNAMLEN) + 1) { String(cString: $0) }
            }
            if name == "." || name == ".." { continue }
            if name.hasPrefix(".") { skip("hidden_entries"); continue }
            let path = frame.path.isEmpty ? name : frame.path + "/" + name
            guard path.utf8.count <= SourceLimits.pathBytes else { skip("long_paths"); continue }
            var value = stat()
            guard fstatat(dirfd(frame.stream), name, &value, AT_SYMLINK_NOFOLLOW) == 0 else { skip("unreadable"); continue }
            let type = value.st_mode & S_IFMT
            guard type == S_IFREG || type == S_IFDIR else { skip(type == S_IFLNK ? "symbolic_links" : "special_files"); continue }
            let result = SourceEntry(attachment: frame.attachment, path: path, value: value)
            if recursive && result.directory { descend = result }
            return .entry(result)
        }
        return .paused
    }
}

struct SourceSearchPosition {
    let item: SourceItem
    var offset = 0
    var line = 1
    var hash: String?
}

final class SourceCursor {
    let signature: String
    let walk: SourceWalk
    var touched = ProcessInfo.processInfo.systemUptime
    var file: SourceSearchPosition?
    init(signature: String, walk: SourceWalk) { self.signature = signature; self.walk = walk }
}

extension SourceSession {
    static func relativePath(_ requested: String, directory: Bool) throws -> String {
        var path = requested
        while path.hasPrefix("./") { path.removeFirst(2) }
        if directory && (path == "." || path.isEmpty) { return "" }
        let parts = path.split(separator: "/", omittingEmptySubsequences: false)
        guard !path.isEmpty, path.utf8.count <= SourceLimits.pathBytes, !path.hasPrefix("/"), !path.contains("\0"),
              parts.allSatisfy({ !$0.isEmpty && $0 != "." && $0 != ".." }) else {
            throw SevraError.refused("Use a relative path inside an attached folder, without parent components.")
        }
        return path
    }

    func openPath(attachment index: Int, path: String, directory: Bool) throws -> Int32 {
        guard attachments.indices.contains(index) else { throw SevraError.refused("That attachment is no longer available.") }
        let attachment = attachments[index]
        let path = try Self.relativePath(path, directory: directory)
        if attachment.kind == .file {
            guard !directory, path == attachment.name else { throw SevraError.refused("This attachment grants only the selected file, not its siblings.") }
        } else if path.split(separator: "/").contains(where: { $0.hasPrefix(".") }) {
            throw SevraError.refused("Hidden files are excluded from folder access. Attach that file explicitly to read it.")
        }
        // openat(".") gives each traversal an independent directory offset;
        // dup alone would share the root's readdir position across requests.
        var fd = openat(attachment.descriptor, ".", O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC)
        guard fd >= 0 else { throw SevraError.refused("The attached folder is no longer readable.") }
        let parts = path.split(separator: "/")
        for (position, component) in parts.enumerated() {
            let flags = O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC | (directory || position < parts.count - 1 ? O_DIRECTORY : 0)
            let next = openat(fd, String(component), flags)
            close(fd)
            guard next >= 0 else { throw SevraError.refused("\(path) is missing, unreadable or a symbolic link. List the folder again to see current names.") }
            fd = next
        }
        var value = stat()
        guard fstat(fd, &value) == 0, value.st_mode & S_IFMT == (directory ? S_IFDIR : S_IFREG) else {
            close(fd); throw SevraError.refused("\(path) is no longer an ordinary \(directory ? "folder" : "file").")
        }
        return fd
    }

    func inspect(attachment index: Int, path: String) throws -> SourceItem {
        let path = try Self.relativePath(path, directory: false)
        let fd = try openPath(attachment: index, path: path, directory: false); defer { close(fd) }
        var value = stat()
        guard fstat(fd, &value) == 0 else { throw SevraError.refused("Cannot inspect the selected file.") }
        return SourceItem(id: attachments[index].id + ":" + path, attachment: index, path: path,
                          size: value.st_size, device: value.st_dev, inode: value.st_ino, kind: Self.kind(of: path))
    }

    func item(_ id: String) throws -> SourceItem {
        guard let separator = id.firstIndex(of: ":"), let index = attachments.firstIndex(where: { $0.id == id[..<separator] }) else {
            throw SevraError.refused("Unknown file ID. Use source.list, source.find or a search result.")
        }
        return try inspect(attachment: index, path: String(id[id.index(after: separator)...]))
    }

    func attachmentIndex(_ id: String?) throws -> Int {
        if let id, let index = attachments.firstIndex(where: { $0.id == id }) { return index }
        if id == nil && attachments.count == 1 { return 0 }
        throw SevraError.refused("Choose an attachment ID from source.list or the attachment list, such as a1.")
    }

    func resolve(_ call: ProposedTool) throws -> SourceItem {
        if let id = try call.optionalString("id") {
            guard try call.optionalString("path") == nil, try call.optionalString("attachment") == nil else {
                throw SevraError.refused("Read by id, or by attachment and path, not both.")
            }
            return try item(id)
        }
        let index = try attachmentIndex(call.optionalString("attachment"))
        return try inspect(attachment: index, path: call.string("path"))
    }

    func navigation(_ call: ProposedTool, recursive: Bool) throws -> SourceCursor {
        let attachment = try call.optionalString("attachment")
        let path = try Self.relativePath(call.optionalString("path") ?? "", directory: true)
        let query = try call.optionalString("query")?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let match = try call.optionalString("match") ?? "phrase"
        guard ["phrase", "words"].contains(match) else { throw SevraError.refused("Search match must be phrase or words.") }
        if call.name != "source.list" {
            guard !query.isEmpty, query.utf8.count <= 256 else { throw SevraError.refused("Use a short nonempty search query.") }
        }
        let signature = json(["tool": call.name, "attachment": attachment ?? "", "path": path, "query": query, "match": match])
        let now = ProcessInfo.processInfo.systemUptime
        cursors = cursors.filter { now - $0.value.touched < SourceLimits.cursorLifetime }
        if let token = try call.optionalString("cursor") {
            guard let cursor = cursors[token], cursor.signature == signature else {
                throw SevraError.refused("This cursor expired or belongs to another query or scope. Restart without a cursor, or reuse the original query and scope.")
            }
            cursors.removeValue(forKey: token)
            return cursor
        }
        let indices: [Int]
        if attachment != nil || !path.isEmpty { indices = [try attachmentIndex(attachment)] }
        else { indices = Array(attachments.indices) }
        guard path.isEmpty || !indices.contains(where: { attachments[$0].kind == .file }) else {
            throw SevraError.refused("A selected file is not a folder. Omit path to list that file.")
        }
        return SourceCursor(signature: signature, walk: SourceWalk(roots: indices.map { ($0, path) }, recursive: recursive))
    }

    func continuation(_ cursor: SourceCursor) -> String {
        while cursors.count >= SourceLimits.cursorCount, let oldest = cursors.min(by: { $0.value.touched < $1.value.touched })?.key { cursors.removeValue(forKey: oldest) }
        let token = UUID().uuidString.lowercased()
        cursor.touched = ProcessInfo.processInfo.systemUptime
        cursors[token] = cursor
        return token
    }

    var sourceDescriptions: [[String: Any]] {
        attachments.map { ["id": $0.id, "name": $0.name, "kind": $0.kind.rawValue, "can_change": $0.access == .change,
                            "navigation": $0.kind == .file ? "selected file only" : "live folder; use path to browse subfolders"] }
    }

    func entryDescription(_ entry: SourceEntry) -> [String: Any] {
        let attachment = attachments[entry.attachment]
        let path = attachment.kind != .file && (attachments.count > 1 || attachment.kind == .knowledge) ? attachment.name + "/" + entry.path : entry.path
        var result: [String: Any] = ["attachment": attachment.id, "path": path, "relative_path": entry.path,
                                     "kind": entry.directory ? "folder" : Self.kind(of: entry.path).label]
        if !entry.directory { result["id"] = attachment.id + ":" + entry.path; result["bytes"] = entry.value.st_size }
        return result
    }

    func navigate(_ call: ProposedTool, cancellation: Cancellation) throws -> String {
        let finding = call.name == "source.find"
        let cursor = try navigation(call, recursive: finding)
        let work = SourceWork(cancellation)
        var retained = false
        defer { if retained { cursor.walk.pause() } else { cursor.walk.closeStreams() } }
        try cursor.walk.resume(in: self)
        let query = try call.optionalString("query")?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        var files: [[String: Any]] = [], directories: [[String: Any]] = [], matches: [[String: Any]] = []
        var bytes = 0, count = 0, finished = false
        loop: while count < SourceLimits.listPage {
            switch try cursor.walk.next(in: self, work: work) {
            case .paused: break loop
            case .end: finished = true; break loop
            case .entry(let entry):
                if finding && entry.path.range(of: query, options: [.caseInsensitive, .diacriticInsensitive]) == nil { continue }
                let row = entryDescription(entry)
                let size = json(row).utf8.count
                if count > 0 && bytes + size > SourceLimits.resultBytes { cursor.walk.pending = entry; break loop }
                bytes += size; count += 1
                if finding { matches.append(row) }
                else if entry.directory { directories.append(row) }
                else { files.append(row) }
            }
        }
        try cursor.walk.verify()
        try cancellation.check()
        var result: [String: Any] = ["attachments": sourceDescriptions, "skipped": cursor.walk.skipped,
                                    "complete": finished, "note": "Current names. Hidden entries and symbolic links are excluded. Use a directory's attachment and relative_path to browse it. A continuation uses the same query and scope."]
        if finding { result["matches"] = matches }
        else { result["files"] = files; result["directories"] = directories }
        if !finished { result["next_cursor"] = continuation(cursor); retained = true }
        return json(result)
    }

    func search(_ call: ProposedTool, cancellation: Cancellation) throws -> String {
        let cursor = try navigation(call, recursive: true)
        let work = SourceWork(cancellation)
        var retained = false
        defer { if retained { cursor.walk.pause() } else { cursor.walk.closeStreams() } }
        try cursor.walk.resume(in: self)
        let query = try call.string("query").trimmingCharacters(in: .whitespacesAndNewlines)
        let words = query.split(whereSeparator: { $0.isWhitespace }).map(String.init)
        let allWords = try call.optionalString("match") == "words"
        let options: String.CompareOptions = [.caseInsensitive, .diacriticInsensitive]
        var hits: [[String: Any]] = [], unreadable: [String] = [], scans: [String] = []
        var scanned = 0, newDocuments = 0, outputBytes = 0, finished = false
        loop: while hits.count < SourceLimits.searchHits {
            guard try work.available() else { break }
            if cursor.file == nil {
                switch try cursor.walk.next(in: self, work: work) {
                case .end: finished = true; break loop
                case .paused: break loop
                case .entry(let entry):
                    if entry.directory { continue }
                    if Self.kind(of: entry.path) == .other { cursor.walk.skip("unsupported_files"); continue }
                    do { cursor.file = SourceSearchPosition(item: try inspect(attachment: entry.attachment, path: entry.path)) }
                    catch { cursor.walk.skip("unreadable"); if unreadable.count < 5 { unreadable.append(entry.path) }; continue }
                }
            }
            guard var position = cursor.file else { continue }
            let item = position.item
            let document = item.kind != .text
            if scanned > 0 && scanned + Int(item.size) > SourceLimits.searchScanBytes { break }
            if document && cache[item.id]?.document == nil {
                guard newDocuments < SourceLimits.searchNewDocuments else { break }
                newDocuments += 1
            }
            let content: (text: String, hash: String, document: ExtractedDocument?)
            do { content = try text(item, cancellation: cancellation) }
            catch SevraError.cancelled { throw SevraError.cancelled }
            catch {
                if position.hash != nil { throw SevraError.refused("A search result file changed or became unreadable. Restart the search without a cursor.") }
                cursor.walk.skip("unreadable"); if unreadable.count < 5 { unreadable.append(display(item)) }
                cursor.file = nil; continue
            }
            scanned += cache[item.id]?.bytes.count ?? Int(item.size)
            // Bind the byte position to extracted text as well as source bytes:
            // OCR may add text without changing the original PDF.
            let hash = content.hash + ":" + digestText(content.text)
            if let previous = position.hash, previous != hash {
                throw SevraError.refused("The file changed during this search. Restart without a cursor to search its current contents.")
            }
            position.hash = hash
            if let doc = content.document, !doc.textless.subtracting(doc.recognized).isEmpty, scans.count < 10 { scans.append(item.id) }
            let utf8 = content.text.utf8
            guard position.offset <= utf8.count else { throw SevraError.refused("The search position is no longer valid. Restart without a cursor.") }
            var start = utf8.index(utf8.startIndex, offsetBy: position.offset)
            while start < utf8.endIndex {
                if !(try work.available()) { cursor.file = position; break loop }
                let end = utf8[start...].firstIndex(of: 10) ?? utf8.endIndex
                let line = String(decoding: utf8[start..<end], as: UTF8.self)
                let range: Range<String.Index>?
                if allWords { range = words.allSatisfy { line.range(of: $0, options: options) != nil } ? line.range(of: words[0], options: options) : nil }
                else { range = line.range(of: query, options: options) }
                if let range {
                    let snippet = String(line[..<range.lowerBound].suffix(60) + line[range.lowerBound...].prefix(100))
                    var hit: [String: Any] = ["id": item.id, "attachment": attachments[item.attachment].id, "path": display(item),
                                              "line": position.line, "offset": position.offset + line[..<range.lowerBound].utf8.count, "snippet": snippet]
                    if let doc = content.document, doc.pages.count > 1 { hit["page"] = doc.page(at: position.offset) }
                    let size = json(hit).utf8.count
                    if !hits.isEmpty && outputBytes + size > SourceLimits.resultBytes { cursor.file = position; break loop }
                    outputBytes += size; hits.append(hit)
                }
                let next = end == utf8.endIndex ? end : utf8.index(after: end)
                position.offset += utf8.distance(from: start, to: next); position.line += 1
                start = next
                cursor.file = start == utf8.endIndex ? nil : position
                if hits.count >= SourceLimits.searchHits { break loop }
            }
            cursor.file = nil
        }
        try cursor.walk.verify()
        try cancellation.check()
        var result: [String: Any] = ["matches": hits, "match": allWords ? "all words on a line" : "phrase", "complete": finished,
                                    "skipped": cursor.walk.skipped, "note": "Read a match with source.read and its offset to cite it. Continue with next_cursor and the same query and scope. New searches inspect current files; this is not an atomic snapshot of the whole folder."]
        if !finished { result["next_cursor"] = continuation(cursor); retained = true }
        if !unreadable.isEmpty { result["unreadable"] = unreadable }
        if !scans.isEmpty { result["scanned_pages_not_searched"] = scans }
        return json(result)
    }
}
