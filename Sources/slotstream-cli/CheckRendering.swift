// Rendering for the check subcommands.
//
// The check bodies live in SlotstreamDiagnostics; these functions turn a
// CheckReport into the exact bytes each subcommand has always printed.
// `Tools/static_gates.sh` runs the commands and `Tools/sampler_gates.sh`
// counts `^PASS` lines out of governor-check, so the shapes below are a
// contract with the shell gates, not a style choice.

import ArgumentParser
import Foundation
import SlotstreamDiagnostics

enum CheckRendering {
    /// `PASS  name` / `FAIL  name` per item, a trailing banner, exit 2 on failure.
    static func emit(_ report: CheckReport, banner: String) throws {
        for item in report.items {
            print("\(item.passed ? "PASS" : "FAIL")  \(item.name)")
        }
        if !report.passed { throw ExitCode(2) }
        print(banner)
    }

    /// governor-check's shape: a failure carries its detail on the same line,
    /// then a blank line and a tally.
    static func emitTally(_ report: CheckReport, label: String) throws {
        var passed = 0, failed = 0
        for item in report.items {
            if item.passed {
                print("PASS  \(item.name)")
                passed += 1
            } else {
                print("FAIL  \(item.name)  \(item.detail ?? "")")
                failed += 1
            }
        }
        print("")
        print("\(label): passed \(passed), failed \(failed)")
        if failed > 0 { throw ExitCode(2) }
    }
}
