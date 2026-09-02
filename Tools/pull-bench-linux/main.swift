// Entry point for the Linux bandwidth harness. The download engine, the
// manifest and the integrity rules are copied verbatim from the library
// (Sources/Slotstream/WeightDownload.swift, WeightStore.swift,
// PinnedModel.swift, Errors.swift); the command shells below stand in for the
// CLI's, which cannot come along because they import the library as a module.
import ArgumentParser
import Foundation

struct Pull: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Download the model weights (parallel, resumable, hash-verified)")

    @Argument var model: String = PinnedModel.name
    @Option(name: .customLong("dir")) var dir: String?
    @Option(name: .customLong("connections")) var connections: Int?
    @Flag(name: .customLong("verify")) var verifyOnly = false

    func run() throws {
        let dest = dir.map { URL(fileURLWithPath: ($0 as NSString).expandingTildeInPath) }
            ?? ModelLocator.resolve(model)
        if verifyOnly {
            try WeightStore.verify(at: dest, log: { print($0) })
            return
        }
        try WeightStore.download(to: dest, connections: connections, log: { print($0) })
        try WeightStore.verify(at: dest, log: { print($0) })
    }
}

/// The integrity regressions, asserted here without the diagnostics module.
struct PullCheck: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "pull-check")

    func run() throws {
        var failures: [String] = []
        func check(_ name: String, _ ok: Bool) {
            print("\(ok ? "PASS" : "FAIL")  \(name)")
            if !ok { failures.append(name) }
        }
        let dir = FileManager.default.temporaryDirectory
            .appendingPathComponent("pullbench-check-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: dir) }
        let file = dir.appendingPathComponent("same-size")
        let abc = "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad"
        try Data("abc".utf8).write(to: file)
        check("matching file is accepted", WeightStore.fileMatches(file, size: 3, sha256: abc))
        try Data("xyz".utf8).write(to: file)
        check("same-size corruption is rejected", !WeightStore.fileMatches(file, size: 3, sha256: abc))
        check("exact Content-Range is accepted", WeightStore.validContentRange(
            "bytes 64-127/256", start: 64, length: 64, total: 256))
        check("wrong range start is rejected", !WeightStore.validContentRange(
            "bytes 0-63/256", start: 64, length: 64, total: 256))
        check("every pinned file has a digest", PinnedModel.files.allSatisfy { $0.sha256 != nil })
        if !failures.isEmpty { throw ExitCode(2) }
        print("PULL CHECK PASS")
    }
}

struct PullBench: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "pullbench",
        abstract: "slotstream's pull, built on Linux for bandwidth measurement",
        subcommands: [Pull.self, PullCheck.self])
}
PullBench.main()
