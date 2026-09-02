// `slotstream pull` and `slotstream pull-check`: argument parsing and
// rendering only. The download engine, the manifest and the integrity rules
// live in the Slotstream library (WeightStore); this file turns flags into a
// call and a CheckReport into the bytes these commands have always printed.

import ArgumentParser
import Foundation
import Slotstream
import SlotstreamDiagnostics

struct Pull: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Download the model weights (parallel, resumable, hash-verified). Then: slotstream serve")

    @Argument(help: "Model to pull (only \(PinnedModel.name) exists in v0)")
    var model: String = PinnedModel.name

    @Option(name: .customLong("dir"), help: "Destination directory (default ~/.slotstream/models/\(PinnedModel.dirName))")
    var dir: String?

    @Option(name: .customLong("connections"), help: "Parallel connections (default \(PullTuning.connections))")
    var connections: Int?

    @Flag(name: .customLong("verify"), help: "Verify an existing copy against the pinned upstream hashes; download nothing")
    var verifyOnly = false

    func run() throws {
        guard model == PinnedModel.name || model == PinnedModel.dirName else {
            throw ValidationError(
                "unknown model '\(model)' — v0 ships exactly one: \(PinnedModel.name)")
        }
        let dest = dir.map { URL(fileURLWithPath: ($0 as NSString).expandingTildeInPath) }
            ?? ModelLocator.resolve(model)
        if verifyOnly {
            try WeightStore.verify(at: dest, log: { print($0) })
            return
        }
        try WeightStore.download(to: dest, connections: connections, log: { print($0) })
        try WeightStore.verify(at: dest, log: { print($0) })
        print("\nready. next:  slotstream serve     (or: slotstream run --prompt \"...\")")
    }
}

/// Weights-free regressions for integrity decisions that previously required a
/// 104 GB download to exercise.
struct PullCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "pull-check",
        abstract: "Check same-size corruption detection and HTTP range validation")

    func run() throws {
        try CheckRendering.emit(Diagnostics.pullIntegrity(), banner: "PULL CHECK PASS")
    }
}
