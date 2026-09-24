import Foundation
import Darwin

public struct HomeArchiveEntry: Codable, Equatable, Sendable {
    public var path: String
    public var bytes: Int
    public var sha256: String
}
public struct HomeArchiveManifest: Codable, Equatable, Sendable {
    public var format = 1
    public var profile = "sevra-home-v1"
    public var homeID: String
    public var revision: Int
    public var created: Date
    public var files: [HomeArchiveEntry]
    public var externalEvidence: [String]
    public var homeDataComplete = true
    public var evidenceComplete: Bool
    public var runtimeReady = false
    public var authorityReady = false
}
public struct HomeArchiveResult: Sendable {
    public var url: URL
    public var manifest: HomeArchiveManifest
    public var digest: String
}
public struct HomeRestoreReview: Codable, Equatable, Sendable {
    public var archiveDigest: String
    public var snapshotDate: Date
    public var sourceHomeID: String
    public var reviewed = false
    public var privacyEpochKnown = false
    public var mergedExclusions: Int? = nil
}

/// A directory package containing a bounded, verified plain-file snapshot.
/// Device authority, owner locks, caches, model weights and credentials never
/// enter the package. No archive extractor or executable payload is involved.
public enum HomeArchive {
    static let maxFiles = 20_000
    static let maxBytes = 512 * 1024 * 1024
    static let maxFileBytes = 64 * 1024 * 1024
    static let owned = Set(["sevra.toml", "db", "artifacts", "assets", "extensions", "changes", "skills", "mini-apps", "runs"])
    private static let fm = FileManager.default

    static func pathKey(_ path: String) throws -> String {
        let parts = path.split(separator: "/", omittingEmptySubsequences: false)
        guard !path.isEmpty, path.utf8.count <= 1024, !path.contains("\\"), !path.contains(":"),
              !path.unicodeScalars.contains(where: { CharacterSet.controlCharacters.contains($0) }),
              parts.allSatisfy({ !$0.isEmpty && $0 != "." && $0 != ".." && !$0.hasPrefix(".") }),
              let top = parts.first, owned.contains(String(top)) else {
            throw SevraError.refused("The Home backup contains an unsafe or unsupported path.")
        }
        return path.precomposedStringWithCanonicalMapping.lowercased()
    }
    private static func plainRoot(_ root: URL) throws {
        // Foundation may fold /private/tmp back to the /tmp symlink. Use the
        // POSIX physical path for the directory check, permitting only Apple's
        // standard root aliases, never user-created symbolic links.
        var expected = root.path
        for alias in ["/tmp", "/var", "/etc"] where expected == alias || expected.hasPrefix(alias + "/") {
            expected = "/private" + expected; break
        }
        guard let physical = realpath(root.path, nil) else { throw SevraError.refused("The backup folder is missing or changed.") }
        defer { free(physical) }
        guard String(cString: physical) == expected else { throw SevraError.refused("Choose a folder without symbolic links.") }
        var s = stat()
        guard lstat(physical, &s) == 0, s.st_mode & S_IFMT == S_IFDIR else { throw SevraError.refused("The backup folder is missing or changed.") }
    }
    static func read(_ path: String, at root: URL, limit: Int = maxFileBytes) throws -> Data {
        // The special manifest name is host-owned; all payload paths use pathKey.
        if path != "manifest.json" { _ = try pathKey(path) }
        var fd = open(root.path, O_RDONLY | O_DIRECTORY | O_NOFOLLOW | O_CLOEXEC)
        guard fd >= 0 else { throw SevraError.refused("Cannot open the Home backup safely.") }
        defer { close(fd) }
        let parts = path.split(separator: "/")
        for (i, part) in parts.enumerated() {
            let flags = O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC | (i < parts.count - 1 ? O_DIRECTORY : 0)
            let next = openat(fd, String(part), flags)
            guard next >= 0 else { throw SevraError.refused("A backup file is missing or is not an ordinary file: \(path)") }
            close(fd); fd = next
        }
        var before = stat()
        guard fstat(fd, &before) == 0, before.st_mode & S_IFMT == S_IFREG, before.st_size >= 0, before.st_size <= limit else {
            throw SevraError.refused("A backup file is unsupported or exceeds its size limit: \(path)")
        }
        var data = Data(), buffer = [UInt8](repeating: 0, count: 65536)
        while true {
            let count = Darwin.read(fd, &buffer, buffer.count)
            if count < 0 && errno == EINTR { continue }
            guard count >= 0 else { throw SevraError.refused("Could not read \(path).") }
            if count == 0 { break }
            guard data.count + count <= limit else { throw SevraError.refused("A backup file grew while being read.") }
            data.append(contentsOf: buffer.prefix(count))
        }
        var after = stat()
        guard fstat(fd, &after) == 0, before.st_size == data.count,
              before.st_mtimespec.tv_sec == after.st_mtimespec.tv_sec, before.st_mtimespec.tv_nsec == after.st_mtimespec.tv_nsec,
              before.st_ctimespec.tv_sec == after.st_ctimespec.tv_sec, before.st_ctimespec.tv_nsec == after.st_ctimespec.tv_nsec else {
            throw SevraError.conflict("A backup file changed during reading. Try again after editing stops.")
        }
        return data
    }
    static func inventory(_ root: URL, payload: Bool) throws -> [String] {
        try plainRoot(root)
        var files: [String] = [], keys = Set<String>(), visited = 0
        func walk(_ directory: URL, prefix: String) throws {
            for name in try fm.contentsOfDirectory(atPath: directory.path).sorted() {
                if name.hasPrefix(".") {
                    // Only known disposable local metadata is excluded. Never
                    // silently omit an arbitrary hidden user asset from a backup.
                    if !payload && ((prefix.isEmpty && [".sevra", ".DS_Store"].contains(name)) || (prefix.hasPrefix("db/") && [".dbmd.transaction.lock", ".index.lock", ".DS_Store"].contains(name)) || (prefix == "db/" && name == ".dbmd")) { continue }
                    throw SevraError.refused("Unrecognized hidden Home content: \(prefix + name). Move it outside the Home before exporting.")
                }
                let path = prefix + name
                if payload && path == "manifest.json" { continue }
                _ = try pathKey(path)
                visited += 1
                guard visited <= maxFiles else { throw SevraError.refused("This Home exceeds the backup entry limit.") }
                let key = path.precomposedStringWithCanonicalMapping.lowercased()
                guard keys.insert(key).inserted else { throw SevraError.refused("Backup paths collide after Unicode/case normalization.") }
                var s = stat()
                let url = directory.appendingPathComponent(name)
                guard lstat(url.path, &s) == 0 else { throw SevraError.conflict("Home changed while it was being inspected.") }
                if s.st_mode & S_IFMT == S_IFDIR { try walk(url, prefix: path + "/") }
                else if s.st_mode & S_IFMT == S_IFREG { files.append(path) }
                else { throw SevraError.refused("Backups require ordinary files and folders; symbolic links are not followed.") }
            }
        }
        try walk(root, prefix: "")
        return files.sorted()
    }
    private static func physicalDestination(_ destination: URL) throws -> URL {
        let parent = destination.deletingLastPathComponent()
        try plainRoot(parent)
        guard let physical = realpath(parent.path, nil) else { throw SevraError.refused("The destination folder is unavailable.") }
        defer { free(physical) }
        return URL(fileURLWithPath: String(cString: physical) + "/" + destination.lastPathComponent)
    }
    private static func stage(for destination: URL) throws -> URL {
        let parent = destination.deletingLastPathComponent()
        try plainRoot(parent)
        guard !fm.fileExists(atPath: destination.path), !["", ".", ".."].contains(destination.lastPathComponent) else {
            throw SevraError.refused("Choose a new backup or restore destination. Existing folders are never replaced.")
        }
        let stage = parent.appendingPathComponent(".sevra-transfer-" + UUID().uuidString)
        try fm.createDirectory(at: stage, withIntermediateDirectories: false, attributes: [.posixPermissions: 0o700])
        return stage
    }
    /// Each file is pushed to the drive; the last one written flushes the
    /// drive's cache for all of them, instead of one full flush per file.
    private static func put(_ data: Data, path: String, in root: URL, _ level: Durability = .pushed) throws {
        let target = root.appendingPathComponent(path)
        try fm.createDirectory(at: target.deletingLastPathComponent(), withIntermediateDirectories: true, attributes: [.posixPermissions: 0o700])
        try durable(data, at: target, level)
    }
    private static func publish(_ staged: URL, as destination: URL) throws {
        // RENAME_EXCL is atomic create-only publication on macOS.
        guard renamex_np(staged.path, destination.path, UInt32(RENAME_EXCL)) == 0 else {
            throw SevraError.conflict("The destination changed. Existing data was not replaced.")
        }
        try syncDirectory(destination.deletingLastPathComponent())
    }
    static func export(root: URL, state: HomeState, to destination: URL, verify: () throws -> Void) throws -> HomeArchiveResult {
        let destination = try physicalDestination(destination)
        let staging = try stage(for: destination)
        defer { try? fm.removeItem(at: staging) }
        try verify()
        let paths = try inventory(root, payload: false)
        var entries: [HomeArchiveEntry] = [], bytes = 0
        for path in paths {
            try autoreleasepool {
                let data = try read(path, at: root)
                bytes += data.count
                guard bytes <= maxBytes else { throw SevraError.refused("This Home exceeds the backup size limit.") }
                try put(data, path: path, in: staging)
                entries.append(HomeArchiveEntry(path: path, bytes: data.count, sha256: digestBytes(data)))
            }
        }
        guard paths.contains("db/DB.md"), paths.contains("db/records/state/home.md"), paths.contains("sevra.toml") else {
            throw SevraError.refused("A complete Home requires its configuration and canonical state.")
        }
        let evidence = Set(state.threads.flatMap { $0.allRuns.flatMap { ($0.excerpts ?? []) + ($0.proposal?.citations ?? []) } }.map(\.path)).sorted()
        let manifest = HomeArchiveManifest(homeID: state.id, revision: state.revision, created: Date(), files: entries, externalEvidence: evidence, evidenceComplete: evidence.isEmpty)
        let data = try encoded(manifest)
        try put(data, path: "manifest.json", in: staging, .flushed)
        // Bind every file and the inventory to the same completed owner view,
        // including arbitrary owned assets outside the dbmd integrity ledger.
        try verify()
        guard try inventory(root, payload: false) == paths else { throw SevraError.conflict("Home contents changed during backup.") }
        for entry in entries {
            guard try digestBytes(read(entry.path, at: root)) == entry.sha256 else { throw SevraError.conflict("Home contents changed during backup.") }
        }
        try publish(staging, as: destination)
        return HomeArchiveResult(url: destination, manifest: manifest, digest: digestBytes(data))
    }
    public static func inspect(_ archive: URL) throws -> HomeArchiveResult {
        try plainRoot(archive)
        let data = try read("manifest.json", at: archive, limit: 8 * 1024 * 1024)
        let manifest = try decoded(HomeArchiveManifest.self, data)
        guard manifest.format == 1, manifest.profile == "sevra-home-v1", UUID(uuidString: manifest.homeID) != nil,
              manifest.revision >= 0, manifest.files.count <= maxFiles, manifest.homeDataComplete,
              !manifest.runtimeReady, !manifest.authorityReady else { throw SevraError.refused("This Home backup format is unsupported or incomplete.") }
        var keys = Set<String>(), size = 0
        for entry in manifest.files {
            guard keys.insert(try pathKey(entry.path)).inserted, entry.bytes >= 0, entry.bytes <= maxFileBytes,
                  entry.sha256.count == 64, entry.sha256.allSatisfy({ $0.isHexDigit }) else { throw SevraError.refused("The backup manifest contains invalid or colliding entries.") }
            size += entry.bytes
            guard size <= maxBytes else { throw SevraError.refused("This backup exceeds its size limit.") }
            let file = try read(entry.path, at: archive)
            guard file.count == entry.bytes, digestBytes(file) == entry.sha256 else { throw SevraError.conflict("Backup verification failed for \(entry.path). Nothing was restored.") }
        }
        guard try inventory(archive, payload: true) == manifest.files.map(\.path).sorted(),
              keys.contains("db/db.md"), keys.contains("db/records/state/home.md"), keys.contains("sevra.toml") else { throw SevraError.refused("Backup closure is incomplete or contains undeclared files.") }
        return HomeArchiveResult(url: archive, manifest: manifest, digest: digestBytes(data))
    }
    public static func restore(_ archive: URL, to destination: URL, dbmd: URL, knownHome: HomeState? = nil) throws -> HomeArchiveResult {
        let result = try inspect(archive)
        let destination = try physicalDestination(destination)
        guard let archivePath = realpath(archive.path, nil) else { throw SevraError.refused("The selected backup is unavailable.") }
        defer { free(archivePath) }
        guard !destination.path.hasPrefix(String(cString: archivePath) + "/") else { throw SevraError.refused("Restore beside the backup or in another folder. The backup itself must stay unchanged.") }
        let staging = try stage(for: destination)
        defer { try? fm.removeItem(at: staging) }
        for (index, entry) in result.manifest.files.enumerated() {
            try autoreleasepool {
                let data = try read(entry.path, at: archive)
                guard data.count == entry.bytes, digestBytes(data) == entry.sha256 else { throw SevraError.conflict("The backup changed during restore.") }
                try put(data, path: entry.path, in: staging, index == result.manifest.files.count - 1 ? .flushed : .pushed)
            }
        }
        try HomeStore.prepareRestoredHome(at: staging, manifest: result.manifest,
            review: HomeRestoreReview(archiveDigest: result.digest, snapshotDate: result.manifest.created, sourceHomeID: result.manifest.homeID), dbmd: dbmd, knownHome: knownHome)
        try publish(staging, as: destination)
        return HomeArchiveResult(url: destination, manifest: result.manifest, digest: result.digest)
    }
}
