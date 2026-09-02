#!/bin/bash
# Can something outside this repository actually use it?
#
# Until the package declared products, the answer was no: SwiftPM refused at
# graph resolution with "product 'SlotstreamCore' ... not found in package
# 'slotstream'". Nothing inside the repo would ever have noticed, because the
# binary builds either way. This builds a throwaway package that depends on the
# checkout by path, imports both libraries, and runs.
set -euo pipefail
cd "$(dirname "$0")/.."
REPO=$PWD
WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT
mkdir -p "$WORK/Sources/Consumer"

cat > "$WORK/Package.swift" <<SWIFT
// swift-tools-version: 6.0
import PackageDescription
let package = Package(
    name: "Consumer", platforms: [.macOS(.v14)],
    dependencies: [.package(path: "$REPO")],
    targets: [.executableTarget(name: "Consumer", dependencies: [
        .product(name: "Slotstream", package: "slotstream"),
        .product(name: "SlotstreamDiagnostics", package: "slotstream"),
    ], swiftSettings: [.swiftLanguageMode(.v5)])]
)
SWIFT

cat > "$WORK/Sources/Consumer/main.swift" <<'SWIFT'
import Foundation
import Slotstream
import SlotstreamDiagnostics

// Plan for a machine, without one byte of weights and without touching Metal.
let plan = try Planner.plan(PlanRequest(memoryGB: 16), on: Machine.simulated(ramGB: 32))
precondition(plan.slots > 0, "a 16 GB plan should size a pool")
precondition(plan.simulated, "a simulated machine must mark its plan")

// Ask about the weights without trying to load them.
let status = WeightStore.default.status()
precondition(status.bytesToFetch >= 0)

// Price a long prompt.
let wait = PrefillSchedule.estSeconds(tokens: 8000, maxChunk: plan.prefillChunk)
precondition(wait > 0)

// Run one of the library's own diagnostics.
let report = Diagnostics.prefillSchedule()
precondition(report.passed, "prefill-schedule should pass")

print("consumer ok: \(Int(plan.expertsPerLayerCached))/layer, "
    + "\(PrefillSchedule.describe(seconds: wait)) for 8k tokens, "
    + "\(PinnedModel.files.count) pinned files, diagnostics \(report.items.count) assertions")
SWIFT

cd "$WORK"
swift build 2>&1 | grep -E 'error:|warning: .*deprecated' && exit 1
.build/debug/Consumer
