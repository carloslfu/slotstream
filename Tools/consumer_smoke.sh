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
JOBS=${SLOTSTREAM_BUILD_JOBS-2}
case "$JOBS" in
  1|2|3|4|5|6|7|8) ;;
  *) echo "consumer: SLOTSTREAM_BUILD_JOBS must be an integer from 1 to 8" >&2; exit 1 ;;
esac
WORK=$(mktemp -d)
trap 'rm -rf "$WORK"' EXIT
mkdir -p "$WORK/Sources/Consumer"

cat > "$WORK/Package.swift" <<SWIFT
// swift-tools-version: 6.0
import PackageDescription
let package = Package(
    name: "Consumer", platforms: [.macOS(.v14)],
    dependencies: [.package(name: "slotstream", path: "$REPO")],
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

// Existing callers may forward nonescaping logs and hold the original API
// as function values. Compile these without starting any download.
func forwardInstance(_ store: WeightStore, log: WeightStore.Log) throws {
    try store.download(log: log)
}
func forwardStatic(_ directory: URL, log: WeightStore.Log) throws {
    try WeightStore.download(to: directory, log: log)
}
let oldDownload: (URL, Int?, [String]?, WeightStore.Log) throws -> Void = WeightStore.download
let oldOptions: ([String]?, Int?) -> PullOptions = PullOptions.init
let cancelled = PullCancellation()
cancelled.cancel()
let cancelledOptions = PullOptions(cancellation: cancelled)

// Preserve existing public function-value signatures and ordinary calls.
func legacyEngineMethods(_ engine: Engine) {
    let generate: ([Int], SampleParams, VisionPrompt?, (() -> Bool)?, ((Int, String) -> Bool)?) -> (text: String, ids: [Int], stats: GenStats) = engine.generate
    let images: ([[String: Any]], [[String: Any]]?, Bool) throws -> ([Int], VisionPrompt?) = engine.encodeWithVision
    let typedImages: ([ChatMessage], [ToolDefinition], Bool, String?) throws -> ([Int], VisionPrompt?) = engine.encodeChatWithVision
    let tower: () throws -> VisionTower = engine.ensureVisionTower
    _ = (generate, images, typedImages, tower)
}
let oldPlanner: (PlanRequest, Machine, Bool, Bool) throws -> MemoryPlan = Planner.plan
let loosePlanner: (Int?, Double?, Double?, Double?, Double?, Double?, Double?, Planner.MTPMode, Bool, Planner.VisionMode, Bool, Bool, Int, Bool) throws -> MemoryPlan = Planner.plan
let optimizationEnvironment: ([String: String]) throws -> InferenceOptimizations = InferenceOptimizations.environment
let explicitReference = InferenceOptimizations()
precondition(!explicitReference.compactStateWindows)
let explicitOptOut = try optimizationEnvironment(["SLOTSTREAM_OPT_COMPACT_STATE": "0"])
precondition(!explicitOptOut.compactStateWindows)
let policy = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 0)
precondition(policy.maxContextTokens == 65536)
let controller = RequestController(configuration: policy, slackBytes: 0, availableGB: { 100 })
try controller.check()

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
# Only a compiler diagnostic fails this ("path:line:col: error: ..."); SwiftPM's
# own cache chatter can contain the word too ("skipping cache due to an
# error: ...") and took a green build down once.
if ! swift build -j "$JOBS" > "$WORK/build.log" 2>&1; then
  cat "$WORK/build.log" >&2
  exit 1
fi
if grep -E '(^|: )error: |warning: .*deprecated' "$WORK/build.log"; then
  exit 1
fi
.build/debug/Consumer
