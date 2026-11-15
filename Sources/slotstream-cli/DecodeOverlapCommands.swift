// Gates for demand misses that read straight into their pool slots. Direct
// reads must leave the arithmetic untouched and recover from a failed read
// without leaving a stale or partial slot behind. The experimental read
// threads (SLOTSTREAM_OPT_DEMAND_THREADS) are held to the same two things.

import ArgumentParser
import Foundation
import SlotstreamDiagnostics

struct DecodeOverlapCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "decode-overlap-check",
        abstract: "Prove direct demand reads leave outputs exact and recover from read failures")
    @OptionGroup var model: ModelOptions
    @Option(help: "Tokens to generate per run")
    var tokens: Int = 24

    func run() throws {
        try model.rejectMirrors()
        var failed = false
        for report in try Diagnostics.decodeOverlap(modelDir: model.modelURL, tokens: tokens) {
            for item in report.items {
                print("\(item.passed ? "PASS" : "FAIL")  \(report.name): \(item.name)\(item.passed ? "" : "  \(item.detail ?? "")")")
            }
            if !report.passed { failed = true }
        }
        if failed { throw ExitCode(2) }
        print("DECODE OVERLAP CHECK PASS")
    }
}
