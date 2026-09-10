import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationTerminalPrefillLifecycle(modelDir: URL, lastQuery: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        var options = InferenceOptimizations()
        options.compactStateWindows = true; options.compactMTPRow = true
        options.boundedIndexer = true; options.boundedPLE = true
        options.incrementalIndexer = true; options.demandedPrefillOutput = true
        options.layerExpertWorkspace = true; options.workspaceTokenTile = 1024
        options.compactScopeFrontier = true
        model.optimizations = options
        var c = CheckBuilder("optimization-terminal-prefill-lifecycle")
        let prefix = (0 ..< 1023).map { 1000 + ($0 * 7919) % 200_000 }
        let suffix = (0 ..< 512).map { 1237 + ($0 * 7927) % 200_000 }
        let reference = model.makeState(), candidate = model.makeState()
        eval(model.lastLogits(prefix, state: reference))
        eval(model.lastLogits(prefix, state: candidate))
        let checkpoint = candidate.checkpoint()
        let initial = candidate.diagnosticTensors()
        func exact(_ expected: [String: MLXArray], _ state: Qwen4ExpModel.State, _ label: String) {
            let got = state.diagnosticTensors()
            c.equal("\(label): fields", Set(expected.keys), Set(got.keys))
            for key in expected.keys.sorted() {
                if let actual = got[key] {
                    c.expect("\(label): \(key)", actual.shape == expected[key]!.shape
                        && (actual .== expected[key]!).all().item(Bool.self))
                }
            }
        }
        // An already-encoded image straddles the 256-row compute boundary.
        // This tests splice/state ownership independently of the real tower.
        let rows = MLXArray.full([16, model.cfg.hiddenSize], values: MLXArray(Float(0.03125))).asType(.bfloat16)
        let vision = [VisionRun(start: 250, rows: rows)]
        eval(model.lastLogits(Array(suffix[..<256]), state: reference,
            vision: vision.compactMap { $0.clipped(to: 0, 256) }))
        let expectedLogits = model.lastLogits(Array(suffix[256...]), state: reference,
            vision: vision.compactMap { $0.clipped(to: 256, 512) })
        eval(expectedLogits)
        options.terminalPrefillPruning = true
        options.terminalLastQuery = lastQuery
        model.optimizations = options
        var lastRouteLayer = -1, finalLayerChecks = 0
        model.routerObserver = { layer, _ in lastRouteLayer = layer }
        let beforeCapacity = candidate.allocatedSequenceBytes
        let cancelled = model.consumeReadScope(suffix, passes: [256, 256], state: candidate,
            vision: vision, head: nil, final: false, shouldContinue: {
                if lastRouteLayer == 46 {
                    finalLayerChecks += 1
                    // First is entry to layer 47; second follows its first
                    // complete cache-write tile, before the second tile.
                    return finalLayerChecks < 2
                }
                return true
            })
        model.routerObserver = nil
        c.expect("cancel after first terminal key tile", !cancelled.committed && finalLayerChecks == 2)
        c.expect("cancel returns no logits", cancelled.logits == nil)
        exact(initial, candidate, "cancel restores coherent prefix")
        c.expect("grown capacity remains charged after restore", candidate.allocatedSequenceBytes >= beforeCapacity)
        let queryStart = model.terminalQueryRowsSkipped, moeStart = model.terminalMoERowsSkipped
        let retry = model.consumeReadScope(suffix, passes: [256, 256], state: candidate,
            vision: vision, head: nil, final: false, shouldContinue: nil)
        c.expect("state-only retry commits without logits", retry.committed && retry.logits == nil)
        c.equal("state-only skips all terminal queries", model.terminalQueryRowsSkipped - queryStart, 512)
        c.equal("state-only skips all terminal MoE rows", model.terminalMoERowsSkipped - moeStart, 512)
        exact(reference.diagnosticTensors(), candidate, "state-only exact ordinary-pass state")
        candidate.restore(checkpoint)
        if lastQuery {
            lastRouteLayer = -1; finalLayerChecks = 0
            model.routerObserver = { layer, _ in lastRouteLayer = layer }
            let cancelledFinal = model.consumeReadScope(suffix, passes: [256, 256], state: candidate,
                vision: vision, head: nil, final: true, shouldContinue: {
                    if lastRouteLayer == 46 {
                        finalLayerChecks += 1
                        return finalLayerChecks < 2
                    }
                    return true
                })
            model.routerObserver = nil
            c.expect("last-query scope cancels after first key-only tile", !cancelledFinal.committed && finalLayerChecks == 2)
            c.expect("cancelled last-query scope returns no logits", cancelledFinal.logits == nil)
            exact(initial, candidate, "cancelled final demand restores coherent prefix")
        }
        let finalQueryStart = model.terminalQueryRowsSkipped
        let final = model.consumeReadScope(suffix, passes: [256, 256], state: candidate,
            vision: vision, head: nil, final: true, shouldContinue: nil)
        c.expect("last-row scope commits logits", final.committed && final.logits != nil)
        c.equal("final scope query reduction observed", model.terminalQueryRowsSkipped - finalQueryStart,
            lastQuery ? 448 : 0)
        if let logits = final.logits {
            let relative = abs(logits.asType(.float32) - expectedLogits.asType(.float32)).max()
                / maximum(expectedLogits.max() - expectedLogits.min(), 1e-6)
            c.measure("final_logit_spread_fraction", Double(relative.item(Float.self)))
            c.expect("last-row logits within one percent spread", relative.item(Float.self) <= 0.01)
            c.equal("last-row scope greedy token", argMax(logits.reshaped([-1])).item(Int.self),
                argMax(expectedLogits.reshaped([-1])).item(Int.self))
        }
        exact(reference.diagnosticTensors(), candidate, "last-row exact ordinary-pass state")
        model.optimizations = InferenceOptimizations()
        let nextReference = model.lastLogits([907], state: reference)
        let nextCandidate = model.lastLogits([907], state: candidate)
        c.expect("continued logits exact after cache-only and last-row paths", (nextReference .== nextCandidate).all().item(Bool.self))
        exact(reference.diagnosticTensors(), candidate, "continued after final-row scope")
        if lastQuery {
            // Above the sparse-indexer boundary, an enabled one-token path
            // must preserve the original mask and perform no query pruning.
            let padding = Array(repeating: 1337, count: 600)
            model.optimizations = InferenceOptimizations()
            eval(model.lastLogits(padding, state: reference))
            eval(model.lastLogits(padding, state: candidate))
            let baseline = model.lastLogits([2103], state: reference); eval(baseline)
            model.optimizations.terminalPrefillPruning = true
            model.optimizations.terminalLastQuery = true
            let saved = model.terminalQueryRowsSkipped
            let single = model.lastLogits([2103], state: candidate); eval(single)
            c.expect("enabled single-token path preserves sparse-indexer logits", (single .== baseline).all().item(Bool.self))
            c.equal("one demanded query is never skipped", model.terminalQueryRowsSkipped, saved)
            exact(reference.diagnosticTensors(), candidate, "one-token sparse continuation")
        }
        model.optimizations = options
        let savedQueries = model.terminalQueryRowsSkipped, savedMoE = model.terminalMoERowsSkipped
        let full = model.hiddenStatesWithMulti(Array(suffix.prefix(17)), state: model.makeState())
        eval(full.mixed, full.multi)
        c.equal("full-output API retains every mixed row", full.mixed.dim(1), 17)
        c.equal("full-output API retains every multi row", full.multi.dim(1), 17)
        c.equal("full-output API never prunes queries", model.terminalQueryRowsSkipped, savedQueries)
        c.equal("full-output API never prunes MoE", model.terminalMoERowsSkipped, savedMoE)
        return c.report()
    }
}
