// `slotstream pull` and `slotstream pull-check`: argument parsing and
// rendering only. The download engine, the manifest and the integrity rules
// live in the Slotstream library (WeightStore); this file turns flags into a
// call and a CheckReport into the bytes these commands have always printed.

import ArgumentParser
import Foundation
import Darwin
import Slotstream
import SlotstreamDiagnostics

struct Pull: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Download losslessly compressed model weights (resumable and hash-verified). Then: slotstream serve")

    @Argument(help: "Model to pull (only \(PinnedModel.name) exists in v0)")
    var model: String = PinnedModel.name

    @Option(name: .customLong("dir"), help: "Destination directory (default ~/.slotstream/models/\(PinnedModel.dirName))")
    var dir: String?

    @Option(name: .customLong("connections"), help: "Fixed parallel connections, 1–32 (default: tune from 8)")
    var connections: Int?

    @Option(name: .customLong("transport"), help: "automatic (default), compressed, or raw; automatic preserves existing raw resumes")
    var transport = "automatic"

    @Flag(name: .customLong("verify"), help: "Verify an existing copy against the pinned upstream hashes; download nothing")
    var verifyOnly = false

    func run() throws {
        guard model == PinnedModel.name || model == PinnedModel.dirName else {
            throw ValidationError(
                "unknown model '\(model)' — v0 ships exactly one: \(PinnedModel.name)")
        }
        guard connections.map({ (1...32).contains($0) }) ?? true else { throw ValidationError("connections must be 1–32") }
        guard let selectedTransport = WeightTransport(rawValue: transport) else { throw ValidationError("transport must be automatic, compressed, or raw") }
        let dest = dir.map { URL(fileURLWithPath: ($0 as NSString).expandingTildeInPath) }
            ?? ModelLocator.resolve(model)
        if verifyOnly {
            try WeightStore.verify(at: dest, log: { print($0) })
            return
        }
        try withInterruptiblePull { cancellation in
            try WeightStore.download(to: dest, connections: connections, transport: selectedTransport, cancellation: cancellation, log: { print($0); fflush(stdout) })
        }
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

/// Route SIGINT/SIGTERM onto a normal dispatch queue; no locks or Foundation
/// calls execute inside a POSIX signal handler. The library persists verified
/// chunks before returning, and the caller restores the previous handlers.
func withInterruptiblePull(_ operation: (PullCancellation) throws -> Void) throws {
    let cancellation = PullCancellation()
    let signals: [Int32] = [SIGINT, SIGTERM]
    let previous = signals.map { signal($0, SIG_IGN) }
    let sources = signals.map { value -> DispatchSourceSignal in
        let source = DispatchSource.makeSignalSource(signal: value, queue: .global())
        source.setEventHandler { cancellation.cancel() }
        source.resume()
        return source
    }
    defer {
        sources.forEach { $0.cancel() }
        for (value, handler) in zip(signals, previous) { signal(value, handler) }
    }
    do { try operation(cancellation) }
    catch where cancellation.isCancelled {
        print("download interrupted; rerun to resume verified chunks")
        throw ExitCode(130)
    }
}
