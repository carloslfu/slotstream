import ArgumentParser
import Foundation
import Slotstream

/// Lists or clears a persistent prefix cache directory without loading a model.
struct PrefixCacheCommand: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "prefix-cache",
        abstract: "Show what a --prefix-cache-dir directory holds, or clear it",
        discussion: """
            Reads the directory without loading a model. Each conversation state is listed \
            with the build that wrote it, its token count, head size and last use; the rows \
            states share are counted once, as segments. --clear removes every state file and \
            refuses while a server or app holds the directory.
            """)

    @Option(name: .customLong("dir"),
            help: "The directory given to serve --prefix-cache-dir. Default: the one servers that `slotstream launch` starts use, ~/.slotstream/prefix-cache.")
    var dir: String = CodingToolLaunch.BackgroundServer.prefixCacheDirectory(home: ModelLocator.home.path)

    @Flag(help: "Remove every state file in the directory.")
    var clear = false

    @Flag(help: "Print JSON instead of text.")
    var json = false

    func run() throws {
        let url = URL(fileURLWithPath: (dir as NSString).expandingTildeInPath, isDirectory: true)
        if clear {
            let removed = try PersistentPrefixCache.clear(directory: url)
            if json {
                try emit(["directory": url.path, "removed_files": removed.files, "removed_bytes": removed.bytes])
            } else {
                print("removed \(removed.files) file\(removed.files == 1 ? "" : "s") (\(Self.gigabytes(removed.bytes))) from \(url.path)")
            }
            return
        }
        let report = try PersistentPrefixCache.inspect(directory: url)
        let states = report.states.sorted { ($0.identity, $1.lastUsed) < ($1.identity, $0.lastUsed) }
        let formatter = ISO8601DateFormatter()
        if json {
            try emit([
                "directory": url.path,
                "in_use": report.inUse,
                "total_bytes": report.totalBytes,
                "segments": report.segments,
                "segment_bytes": report.segmentBytes,
                "other_format_files": report.otherFormatFiles,
                "other_format_bytes": report.otherFormatBytes,
                "unreadable_files": report.unreadableFiles,
                "unreadable_bytes": report.unreadableBytes,
                "states": states.map {
                    ["identity": $0.identity, "tokens": $0.tokens, "head_bytes": $0.headBytes,
                     "last_used": formatter.string(from: $0.lastUsed), "continued": $0.continued,
                     "draft": $0.hasDraft, "shared": $0.shared, "segments": $0.segments] as [String: Any]
                },
            ])
            return
        }
        let sharedCount = states.filter(\.shared).count
        print("\(url.path): \(states.count) state\(states.count == 1 ? "" : "s")"
            + (sharedCount > 0 ? " (\(sharedCount) shared prefix\(sharedCount == 1 ? "" : "es"))" : "")
            + " and \(report.segments) segment\(report.segments == 1 ? "" : "s"), \(Self.gigabytes(report.totalBytes))")
        if report.inUse { print("  in use by a running server or app, so the contents may be changing") }
        if !states.isEmpty {
            let dates = DateFormatter()
            dates.dateFormat = "yyyy-MM-dd HH:mm"
            print("  build         tokens      head  last used         ")
            for state in states {
                let details = [state.shared ? "shared prefix" : nil, state.continued ? "continued" : nil,
                               state.hasDraft ? "draft" : nil].compactMap { $0 }
                print("  " + String(state.identity.prefix(12)) + "  "
                    + String(repeating: " ", count: max(0, 8 - "\(state.tokens)".count)) + "\(state.tokens)"
                    + "  " + String(format: "%6.1f MB", Double(state.headBytes) / 1e6)
                    + "  " + dates.string(from: state.lastUsed)
                    + (details.isEmpty ? "" : "  " + details.joined(separator: ", ")))
            }
        }
        if report.segments > 0 {
            print("  rows in \(report.segments) segment\(report.segments == 1 ? "" : "s"): \(Self.gigabytes(report.segmentBytes))")
        }
        if report.otherFormatFiles > 0 {
            print("  \(report.otherFormatFiles) file\(report.otherFormatFiles == 1 ? "" : "s") in another file format "
                + "(\(Self.gigabytes(report.otherFormatBytes))), removed when a current build opens the directory")
        }
        if report.unreadableFiles > 0 {
            print("  \(report.unreadableFiles) unreadable file\(report.unreadableFiles == 1 ? "" : "s") "
                + "(\(Self.gigabytes(report.unreadableBytes))): a damaged file is removed when a current build opens "
                + "the directory; one the system refuses to read is kept, and servers run without the disk cache "
                + "until it is fixed or cleared")
        }
    }

    private func emit(_ object: [String: Any]) throws {
        let data = try JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted, .sortedKeys])
        print(String(decoding: data, as: UTF8.self))
    }

    private static func gigabytes(_ bytes: Int64) -> String { String(format: "%.2f GB", Double(bytes) / 1e9) }
}
