import Foundation

/// Selection and creation are different operations. A remembered path that
/// disappeared must never turn into a fresh, apparently empty Home.
public enum HomeOpenIntent: Sendable { case existing, new, initial }

public enum HomeLocation {
    public static var defaultURL: URL {
        FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Sevra/Home", isDirectory: true)
    }

    public static func validate(_ requested: URL, intent: HomeOpenIntent) throws -> URL {
        let fm = FileManager.default
        let url = URL(fileURLWithPath: requested.path, isDirectory: true).standardizedFileURL
        guard url.isFileURL, url.path != "/", url.path == url.resolvingSymlinksInPath().path else {
            throw SevraError.refused("Choose a Home folder directly, without symbolic links.")
        }
        // A Home is an isolation boundary, never a subfolder of another Home.
        var ancestor = url.deletingLastPathComponent()
        while ancestor.path != "/" {
            if fm.fileExists(atPath: ancestor.appendingPathComponent("sevra.toml").path) {
                throw SevraError.refused("Choose a folder outside the existing Home. Each Home needs its own separate folder.")
            }
            ancestor.deleteLastPathComponent()
        }
        var directory: ObjCBool = false
        let exists = fm.fileExists(atPath: url.path, isDirectory: &directory)
        if exists && !directory.boolValue { throw SevraError.refused("Choose a folder, not a file.") }
        let hasMarker = fm.fileExists(atPath: url.appendingPathComponent("sevra.toml").path)
        let hasDatabase = fm.fileExists(atPath: url.appendingPathComponent("db/DB.md").path)
        switch intent {
        case .existing:
            guard exists else { throw SevraError.unavailable("This Home folder is missing or its drive is disconnected. Reconnect it, or use Open Home to locate it.") }
            guard hasMarker && hasDatabase else {
                throw SevraError.refused("This is not a Sevra Home. Choose the folder containing sevra.toml and db. A standalone db.md database can be attached to a conversation.")
            }
        case .new:
            let empty = !exists ? true : try fm.contentsOfDirectory(atPath: url.path).isEmpty
            guard empty else {
                throw SevraError.refused("Create a Home in a new or empty folder. Use Open Home for an existing Home.")
            }
        case .initial:
            let occupied = exists ? try !fm.contentsOfDirectory(atPath: url.path).isEmpty : false
            if occupied && !(hasMarker && hasDatabase) {
                throw SevraError.refused("This folder contains existing files but is not a complete Sevra Home. Open another Home or create one in an empty folder.")
            }
        }
        return url
    }
}
