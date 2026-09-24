import Foundation

/// Disposable acceleration in the Home's excluded `.sevra` runtime directory.
/// It stays out of canonical records and backups, leaves when the Home is
/// deleted, and follows the engine's existing disk quota,
/// age, permissions and executable-identity policy. A missing cache is a miss.
public struct InferenceCacheContext: Sendable, Equatable {
    public let home: URL
    public let privateThread: String?
    public let directory: URL?

    public init(home: URL, thread: WorkThread, thinking: Bool) {
        self.home = home.standardizedFileURL.resolvingSymlinksInPath()
        privateThread = thread.mode == .incognito ? thread.id : nil
        // A later plain turn can splice held thought ids back into its
        // rendered history. Keep that entire thread off disk, including when
        // the thinking switch has since been turned off.
        let eligible = thread.mode != .incognito && !thinking && thread.thinking != true
            && !thread.allRuns.contains { $0.thinking != nil }
        if eligible {
            directory = self.home.appendingPathComponent(".sevra/prefix-cache", isDirectory: true)
        } else { directory = nil }
    }
}
