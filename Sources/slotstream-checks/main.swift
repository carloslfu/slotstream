// The check runner. Runs the catalogue on a Command Line Tools machine, which
// is the only way to run these locally: this toolchain ships neither XCTest nor
// Swift Testing. CI runs the same binary, so a check is reported by the same
// name everywhere.
//
//   slotstream-checks                       every tier the machine can honour
//   slotstream-checks --tier t0             one tier
//   slotstream-checks --filter prefill      checks whose name contains this
//   slotstream-checks --json                machine-readable, for the store
//   slotstream-checks --list                names and tiers, run nothing
//
// Tiers above T0 touch MLX and are run one at a time, never concurrently: the
// per-user process guard permits several model objects inside one process, so
// nothing else stops two checks stacking GPU allocations on a shared machine.

import Foundation
import SlotstreamDiagnostics
import SlotstreamTestKit

struct Options {
    var tiers: Set<Tier> = [.t0]
    var filter: String?
    var json = false
    var list = false
}

func parse(_ argv: [String]) -> Options {
    var o = Options()
    var explicitTiers: Set<Tier> = []
    var i = 0
    while i < argv.count {
        switch argv[i] {
        case "--tier":
            i += 1
            guard i < argv.count, let t = Tier(rawValue: argv[i].lowercased()) else {
                fail("--tier needs one of: \(Tier.allCases.map(\.rawValue).joined(separator: ", "))")
            }
            explicitTiers.insert(t)
        case "--filter":
            i += 1
            guard i < argv.count else { fail("--filter needs a substring") }
            o.filter = argv[i]
        case "--json": o.json = true
        case "--list": o.list = true
        case "-h", "--help":
            print(
                """
                slotstream-checks — run the check catalogue

                  --tier <t0|t1|t2|t3|t4>   run this tier (repeatable; default t0)
                  --filter <substring>      only checks whose name contains it
                  --json                    one JSON object with every report
                  --list                    print names and tiers, run nothing
                """)
            exit(0)
        default:
            fail("unknown argument: \(argv[i])")
        }
        i += 1
    }
    if !explicitTiers.isEmpty { o.tiers = explicitTiers }
    return o
}

func fail(_ message: String) -> Never {
    FileHandle.standardError.write(Data((message + "\n").utf8))
    exit(2)
}

let options = parse(Array(CommandLine.arguments.dropFirst()))
let checks = Catalogue.matching(tiers: options.tiers, filter: options.filter)

if options.list {
    for check in checks { print("\(check.tier.rawValue)  \(check.name)") }
    exit(0)
}

if checks.isEmpty {
    fail("no checks matched (tiers: \(options.tiers.map(\.rawValue).sorted().joined(separator: ",")))")
}

var reports: [CheckReport] = []
var failed = 0
var skipped = 0

for check in checks {
    let report: CheckReport
    do {
        report = try check.body()
    } catch {
        report = CheckReport(
            name: check.name,
            items: [CheckItem(name: "threw", passed: false, detail: "\(error)")])
    }
    reports.append(report)

    if !options.json {
        if let reason = report.skipped {
            print("SKIP  \(report.name) — \(reason)")
        } else if report.passed {
            print("PASS  \(report.name) (\(report.items.count) assertions)")
        } else {
            print("FAIL  \(report.name)")
            for item in report.failures {
                print("        \(item.name)\(item.detail.map { ": \($0)" } ?? "")")
            }
        }
    }
    if report.skipped != nil {
        skipped += 1
    } else if !report.passed {
        failed += 1
    }
}

if options.json {
    struct Run: Codable {
        var checks: [CheckReport]
        var passed: Int
        var failed: Int
        var skipped: Int
    }
    let run = Run(
        checks: reports, passed: reports.count - failed - skipped, failed: failed,
        skipped: skipped)
    let encoder = JSONEncoder()
    encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
    if let data = try? encoder.encode(run), let text = String(data: data, encoding: .utf8) {
        print(text)
    }
} else {
    let assertions = reports.reduce(0) { $0 + $1.items.count }
    print("")
    print(
        "\(reports.count - failed - skipped) passed, \(failed) failed, \(skipped) skipped "
            + "(\(assertions) assertions)")
}

exit(failed == 0 ? 0 : 1)
