import ArgumentParser
import Foundation
import Slotstream
import SlotstreamDiagnostics

struct OptimizationStateCheck: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "optimization-state-check",
        abstract: "Compare retained state and continued logits across optimization controls")
    @OptionGroup var model: ModelOptions
    @Option var tokens: Int = 256
    @Flag var json = false
    @Flag(help: "Check output limits, pending token ownership, EOS and cancellation")
    var generation = false
    @Option(help: "Candidate to compare: integrated | integrated-mtp | compute-islands | compute-islands-performance | slot-cpu-component | terminal-prefill-lifecycle | mtp-terminal-prefill | terminal-prefill-family | selected-attention-component | selected-attention-family | compact-state | compiled-norm | compiled-norm-component | mtp-compiled-norm | ngram | cache-bookkeeping | cache-containers | exact-read | read-handles | mtp-read-handles | read-handle-lifetime | mtp-cache-bookkeeping | mtp | indexer | sweep-placement | sweep-tiles | sweep-both | indexer-tiles | indexer-dense | indexer-dense-tiles | indexer-topk | indexer-visibility | rope | gdn-record | gdn-kernel | ple | workspace | scope | scope-256 | scope-lifecycle | scope-mtp-vision | mtp-work | lifecycle | output | router-weights | mtp-router-weights | router-projection | router-selection | block-selection | router | mtp-router | mtp-indexer | image-reuse | vision-attention | shared-overlap | prefill-family") var variant = "compact-state"

    func run() throws {
        let report: CheckReport
        if generation { report = try Diagnostics.optimizationGeneration(modelDir: model.modelURL) }
        else if ["runtime-budget-lifecycle", "governor-boundary", "governor-boundary-mtp", "read-failure-serving", "output-serving", "context-serving"].contains(variant) {
            // This executable has a synchronous root, as do its existing
            // Engine-backed commands. Bridge only the tokenizer load here.
            let ready = DispatchSemaphore(value: 0)
            var result: Result<CheckReport, Error>?
            Task {
                do {
                    if variant == "context-serving" {
                        result = .success(try await Diagnostics.contextServing(modelDir: model.modelURL))
                    } else if variant == "output-serving" {
                        result = .success(try await Diagnostics.optimizationOutputServing(modelDir: model.modelURL))
                    } else if variant == "read-failure-serving" {
                        result = .success(try await Diagnostics.optimizationReadFailureServing(modelDir: model.modelURL))
                    } else if variant == "runtime-budget-lifecycle" {
                        result = .success(try await Diagnostics.optimizationRuntimeBudgetLifecycle(modelDir: model.modelURL))
                    } else {
                        result = .success(try await Diagnostics.optimizationGovernorBoundary(modelDir: model.modelURL, mtp: variant == "governor-boundary-mtp"))
                    }
                }
                catch { result = .failure(error) }
                ready.signal()
            }
            ready.wait()
            report = try result!.get()
        }
        else if variant == "context-small-components-projections" {
            report = try Diagnostics.contextSmallComponents(modelDir: model.modelURL,
                paddedRouter: true, layers: 12, paddedProjections: true)
        }
        else if ["context-small-projections-64", "context-small-projections-128",
                 "context-small-projections-partial-64", "context-small-projections-partial-128",
                 "context-small-projections-prefix-64", "context-small-projections-prefix-128",
                 "context-small-projections-shorttail-64", "context-small-projections-shorttail-128",
                 "context-small-projections-sparse-prefix-64", "context-small-projections-sparse-prefix-128"].contains(variant) {
            report = try Diagnostics.contextSmallPass(modelDir: model.modelURL,
                pass: variant.hasSuffix("64") ? 64 : 128, swept: true, paddedRouter: true, paddedAttention: true,
                tokens: variant.contains("partial") ? 470 : variant.contains("shorttail") ? 449 : variant.contains("sparse") ? 2564 : 515,
                prefix: variant.contains("sparse") ? 2049 : variant.contains("prefix") ? 17 : 0,
                paddedProjections: true)
        }
        else if ["context-small-components", "context-small-components-padded", "context-small-components-full-padded"].contains(variant) {
            report = try Diagnostics.contextSmallComponents(modelDir: model.modelURL, paddedRouter: variant.hasSuffix("padded"), fullModel: variant.contains("full"))
        }
        else if ["context-small-aligned-partial-64", "context-small-aligned-partial-128", "context-small-aligned-prefix-64", "context-small-aligned-prefix-128"].contains(variant) {
            report = try Diagnostics.contextSmallPass(modelDir: model.modelURL,
                pass: variant.hasSuffix("64") ? 64 : 128, swept: true, paddedRouter: true, paddedAttention: true,
                tokens: variant.contains("partial") ? 470 : 515, prefix: variant.contains("prefix") ? 17 : 0)
        }
        else if ["context-small-64", "context-small-128", "context-small-swept-64", "context-small-swept-128", "context-small-swept-padded-64", "context-small-swept-padded-128", "context-small-swept-aligned-64", "context-small-swept-aligned-128"].contains(variant) {
            report = try Diagnostics.contextSmallPass(modelDir: model.modelURL,
                pass: variant.hasSuffix("64") ? 64 : 128, swept: variant.contains("swept"), paddedRouter: variant.contains("padded") || variant.contains("aligned"), paddedAttention: variant.contains("aligned"))
        }
        else if variant == "all-hit-replay" { report = try Diagnostics.optimizationAllHitReplay(modelDir: model.modelURL) }
        else if variant == "compute-islands" || variant == "compute-islands-performance" {
            report = try Diagnostics.optimizationComputeIslands(modelDir: model.modelURL, timed: variant == "compute-islands-performance")
        }
        else if variant == "compute-islands-quantized" || variant == "compute-islands-quantized-performance" {
            report = try Diagnostics.optimizationComputeIslands(modelDir: model.modelURL,
                timed: variant == "compute-islands-quantized-performance", quantizedOnly: true)
        }
        else if variant == "gdn-projection-packing" { report = try Diagnostics.optimizationGDNProjectionPacking(modelDir: model.modelURL) }
        else if variant == "gdn-profile" { report = try Diagnostics.optimizationGDNProfile(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "vision-capacity" { report = Diagnostics.optimizationVisionCapacity() }
        else if variant == "vision-tower-capacity" { report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL) }
        else if variant == "vision-prescaled-capacity" { report = Diagnostics.optimizationVisionCapacity(preserveQueryRounding: true) }
        else if variant == "vision-prescaled-tower" { report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL, preserveQueryRounding: true) }
        else if variant == "resident-overlap-component" { report = try Diagnostics.optimizationResidentOverlap(modelDir: model.modelURL) }
        else if variant == "resident-overlap-recovery" || variant == "resident-overlap-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "resident-overlap-recovery-mtp", residentOverlap: true)
        }
        else if variant == "state-recovery-lineage" { report = try Diagnostics.optimizationStateRecovery(modelDir: model.modelURL) }
        else if variant == "prefix-client-capacity" { report = try Diagnostics.optimizationPrefixCapacity() }
        else if variant == "rope-performance" { report = Diagnostics.optimizationRopePerformance() }
        else if variant == "rope-rotation-component" { report = Diagnostics.optimizationPartialRotation() }
        else if variant == "vision-query-tile-capacity" { report = Diagnostics.optimizationVisionCapacity(queryTile: 256) }
        else if variant == "vision-query-tile-tower" { report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL, queryTile: 256) }
        else if variant == "vision-query-maximum-reference" {
            report = try Diagnostics.optimizationVisionTowerCapacity(modelDir: model.modelURL,
                queryTile: 256, maximumReferenceOnly: true)
        }
        else if variant == "transfer-profile" { report = try Diagnostics.optimizationTransferProfile(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "slot-slices-component" { report = Diagnostics.optimizationSlotSlices() }
        else if variant == "slot-words-component" { report = Diagnostics.optimizationSlotSlices(wordWrites: true) }
        else if variant == "slot-cpu-component" { report = try Diagnostics.optimizationCPUSlotWrites() }
        else if variant == "slot-cpu-pool" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL, cpuWrites: true) }
        else if variant == "slot-cpu-storage" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL, cpuWrites: true) }
        else if variant == "slot-cpu-recovery" || variant == "slot-cpu-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "slot-cpu-recovery-mtp", cpuWrites: true)
        }
        else if variant == "embedding-rows" { report = try Diagnostics.optimizationEmbeddingRows(modelDir: model.modelURL) }
        else if variant == "embedding-runtime" || variant == "embedding-runtime-mtp" {
            report = try Diagnostics.optimizationEmbeddingRuntime(modelDir: model.modelURL, mtp: variant == "embedding-runtime-mtp")
        }
        else if variant == "integrated-gdn-projection" || variant == "integrated-gdn-projection-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL,
                mtp: variant == "integrated-gdn-projection-mtp", gdnProjection: true)
        }
        else if variant == "integrated-rope" || variant == "integrated-rope-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL,
                mtp: variant == "integrated-rope-mtp", ropeFusion: true)
        }
        else if variant == "integrated" || variant == "integrated-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL, mtp: variant == "integrated-mtp")
        }
        else if variant == "integrated-portable" || variant == "integrated-portable-mtp" {
            report = try Diagnostics.optimizationPortableIntegrated(modelDir: model.modelURL,
                mtp: variant == "integrated-portable-mtp")
        }
        else if variant == "integrated-vision-query" || variant == "integrated-vision-query-mtp" {
            report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL,
                mtp: variant == "integrated-vision-query-mtp", visionQueryTile: true)
        }
        else if variant == "prefix-vision" || variant == "prefix-vision-mtp" {
            report = try Diagnostics.optimizationPrefixVision(modelDir: model.modelURL, mtp: variant == "prefix-vision-mtp")
        }
        else if variant == "complete-prompt" || variant == "complete-prompt-mtp" {
            report = try Diagnostics.optimizationCompletePrompt(modelDir: model.modelURL, mtp: variant == "complete-prompt-mtp")
        }
        else if variant == "prefix-retention" || variant == "prefix-retention-mtp" {
            report = try Diagnostics.optimizationPrefixRetention(modelDir: model.modelURL, mtp: variant == "prefix-retention-mtp")
        }
        else if variant == "prefix-fork" || variant == "prefix-fork-mtp" {
            report = try Diagnostics.optimizationPrefixFork(modelDir: model.modelURL, tokens: tokens, mtp: variant == "prefix-fork-mtp")
        }
        else if variant == "slot-words-pool" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL, wordWrites: true) }
        else if variant == "slot-words-storage" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL, wordWrites: true) }
        else if variant == "slot-words-recovery" || variant == "slot-words-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "slot-words-recovery-mtp", wordWrites: true)
        }
        else if variant == "slot-slices-pool" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL, slotSlices: true) }
        else if variant == "slot-slices-storage" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL, slotSlices: true) }
        else if variant == "slot-slices-recovery" || variant == "slot-slices-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL,
                mtp: variant == "slot-slices-recovery-mtp", slotSlices: true)
        }
        else if variant == "image-failure" { report = try Diagnostics.optimizationImageFailure(modelDir: model.modelURL) }
        else if variant == "pool-requests" { report = try Diagnostics.optimizationPoolRequests(modelDir: model.modelURL) }
        else if variant == "packed-layout-component" { report = try Diagnostics.optimizationPackedLayout() }
        else if variant == "ngram-lookahead-rows" { report = try Diagnostics.optimizationNgramLookahead(modelDir:model.modelURL) }
        else if ["ngram-cache-reference", "ngram-cache-compact", "ngram-cache-reference-ring", "ngram-cache-compact-ring"].contains(variant) {
            report = try Diagnostics.optimizationNgramCache(modelDir: model.modelURL,
                compact: variant.contains("compact"), ring: variant.hasSuffix("-ring"))
        }
        else if variant == "ngram-lookahead-ticket" { report = try Diagnostics.optimizationNgramPrefetchTicket() }
        else if variant == "ngram-lookahead-recovery" || variant == "ngram-lookahead-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir:model.modelURL,
                mtp:variant == "ngram-lookahead-recovery-mtp",lookahead:true)
        }
        else if variant == "packed-layout-storage" { report = try Diagnostics.optimizationPackedStorage(modelDir:model.modelURL) }
        else if variant == "packed-layout-recovery" || variant == "packed-layout-recovery-mtp" {
            report = try Diagnostics.optimizationPackedRecovery(modelDir:model.modelURL,mtp:variant == "packed-layout-recovery-mtp")
        }
        else if variant == "read-recovery" { report = try Diagnostics.optimizationReadRecovery(modelDir: model.modelURL) }
        else if variant == "request-read-recovery" || variant == "request-read-recovery-mtp" {
            report = try Diagnostics.optimizationRequestReadRecovery(modelDir: model.modelURL, mtp: variant == "request-read-recovery-mtp")
        }
        else if variant == "sampler-performance" { report = Diagnostics.optimizationSamplerPerformance() }
        else if variant == "adaptive-mtp" { report = try Diagnostics.optimizationAdaptiveMTP(modelDir: model.modelURL) }
        else if variant == "adaptive-sensitivity" { report = try Diagnostics.optimizationAdaptiveSensitivity(modelDir: model.modelURL) }
        else if variant == "mtp-floor-cache" { report = try Diagnostics.optimizationMTPFloorCache(modelDir: model.modelURL) }
        else if variant == "floor-cache-mechanism" { report = try Diagnostics.optimizationFloorCacheMechanism(modelDir: model.modelURL) }
        else if variant == "indexer-raw-component" { report = Diagnostics.optimizationCompactIndexer() }
        else if variant == "read-handle-lifetime" { report = try Diagnostics.optimizationReadHandles(modelDir: model.modelURL) }
        else if variant == "mtp-read-handles" { report = try Diagnostics.optimizationMTPReadHandles(modelDir: model.modelURL) }
        else if variant == "selected-attention-component" { report = Diagnostics.optimizationSelectedAttention() }
        else if variant == "selected-attention-family" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens, selectedAttention: true) }
        else if variant == "terminal-query-family" {
            report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens,
                terminalPrefill: true, terminalQuery: true)
        }
        else if variant == "terminal-query-lifecycle" {
            report = try Diagnostics.optimizationTerminalPrefillLifecycle(modelDir: model.modelURL, lastQuery: true)
        }
        else if variant == "terminal-prefill-family" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens, terminalPrefill: true) }
        else if variant == "terminal-prefill-lifecycle" { report = try Diagnostics.optimizationTerminalPrefillLifecycle(modelDir: model.modelURL) }
        else if variant == "mtp-terminal-query" {
            report = try Diagnostics.optimizationMTPTerminalQuery(modelDir: model.modelURL)
        }
        else if variant == "mtp-terminal-prefill" { report = try Diagnostics.optimizationMTPTerminalPrefill(modelDir: model.modelURL) }
        else if variant == "exact-read" { report = Diagnostics.optimizationExactRead() }
        else if variant == "mtp-compiled-norm" { report = try Diagnostics.optimizationMTPCompiledNorm(modelDir: model.modelURL) }
        else if variant == "compiled-norm-component" { report = try Diagnostics.optimizationCompiledNorm() }
        else if variant == "cache-containers" { report = Diagnostics.optimizationCacheBookkeeping() }
        else if variant == "mtp-cache-bookkeeping" { report = try Diagnostics.optimizationMTPCacheBookkeeping(modelDir: model.modelURL) }
        else if variant == "router-selection" { report = Diagnostics.optimizationRouterSelection() }
        else if variant == "router-projection" { report = Diagnostics.optimizationRouterProjection() }
        else if variant == "block-selection" { report = Diagnostics.optimizationBlockSelection() }
        else if variant == "indexer-visibility" { report = Diagnostics.optimizationIndexerVisibility() }
        else if variant == "prefill-family" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "scope-256" { report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens, scoped: true) }
        else if variant == "output" { report = try Diagnostics.optimizationOutput() }
        else if variant == "output-tcp" { report = try Diagnostics.optimizationOutputTCP() }
        else if variant == "scope-mtp-vision" { report = try Diagnostics.optimizationScopeMTPVision(modelDir: model.modelURL) }
        else if variant == "mtp-work" { report = try Diagnostics.optimizationMTPWork(modelDir: model.modelURL) }
        else if variant == "mtp-work-integrated" {
            report = try Diagnostics.optimizationMTPWork(modelDir: model.modelURL, integratedBase: true)
        }
        else if variant == "scope-integrated-family" {
            report = try Diagnostics.optimizationPrefillFamily(modelDir: model.modelURL, tokens: tokens,
                scoped: true, integratedBase: true)
        }
        else if variant == "scope-integrated-lifecycle" {
            report = try Diagnostics.optimizationScopeLifecycle(modelDir: model.modelURL, integratedBase: true)
        }
        else if variant == "scope-integrated-mtp-vision" {
            report = try Diagnostics.optimizationScopeMTPVision(modelDir: model.modelURL, integratedBase: true)
        }
        else if variant == "scope-lifecycle" { report = try Diagnostics.optimizationScopeLifecycle(modelDir: model.modelURL) }
        else if variant == "scope" { report = try Diagnostics.optimizationReadScope(modelDir: model.modelURL, tokens: tokens) }
        else if variant == "gdn-kernel" { report = Diagnostics.optimizationGDNKernel() }
        else if variant == "lifecycle" { report = try Diagnostics.optimizationLifecycle(modelDir: model.modelURL) }
        else if variant == "mtp-indexer" { report = try Diagnostics.optimizationMTPIndexer(modelDir: model.modelURL) }
        else if variant == "mtp-indexer-raw" { report = try Diagnostics.optimizationMTPIndexer(modelDir: model.modelURL, rawCompact: true) }
        else if variant == "image-reuse" { report = try Diagnostics.optimizationImageReuse(modelDir: model.modelURL) }
        else if variant == "vision-attention" { report = Diagnostics.optimizationVisionAttention() }
        else if variant == "mtp-router" { report = try Diagnostics.optimizationMTP(modelDir: model.modelURL, router: true) }
        else if variant == "mtp-router-weights" { report = try Diagnostics.optimizationMTPRouterWeights(modelDir: model.modelURL) }
        else if variant == "mtp" { report = try Diagnostics.optimizationMTP(modelDir: model.modelURL) }
        else { report = try Diagnostics.optimizationState(modelDir: model.modelURL, tokens: tokens, variant: variant) }
        if json {
            let encoder = JSONEncoder(); encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
            print(String(data: try encoder.encode(report), encoding: .utf8)!)
        } else {
            for item in report.items { print("\(item.passed ? "PASS" : "FAIL")  \(item.name)") }
        }
        if !report.passed { throw ExitCode.failure }
    }
}
