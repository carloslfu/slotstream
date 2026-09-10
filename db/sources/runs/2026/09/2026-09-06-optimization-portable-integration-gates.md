---
type: run
id: 01m1wc6ab3mjatmvkc1xzvwgxw
created: 2026-09-06T22:07:31.171462+00:00
updated: 2026-09-06T22:07:31.557752+00:00
summary: V196 full native portable deployment path gates prepared
binary: unbuilt diagnostic source
captured_at: 2026-09-06
command: integrated-portable and integrated-portable-mtp source addition
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: V196 full native portable deployment path gates prepared
tool: source review and diagnostic implementation
---
V196 prepares native coverage of the actual portable deployment selection, closing a qualification gap identified while arranging final activation. V169's pure policy checks correctly selected original MLX rotation for missing/unknown platform identities, but the complete combined native diagnostic always selected integrationCandidate with fused RoPE enabled. That did not exercise the combined portable path's evaluated arithmetic.

Two diagnostic-only files now add integrated-portable and integrated-portable-mtp. They call the actual deploymentCandidate selector with an unqualified identity, then execute the same complete reference/candidate comparison covering row-cached embedding selection, state/logits, image input, sampling, continuation, cancellation, short/EOS exits and pin cleanup. Shared-angle reuse must execute; fused rotation dispatch must remain zero in both arms. The existing public optimizationIntegrated function signature is preserved exactly by forwarding into a private shared implementation, and all existing ordinary/vision/projection entry points retain their previous controls and checks. The new entry is package-only. This proves a future test can exercise the real fallback selection, not that it has yet passed.

The source is applied but unbuilt/unrun. No production arithmetic, public default, memory allowance, throughput estimate or public platform support claim changed. Actual execution on another chip/OS still requires that hardware; a forced portable path on this Mac cannot certify it. The next common source build can include these variants, with their native runs scheduled separately after context's frozen qualification if needed. All heavy work remains held for transport's explicit handback.


Artifact `/tmp/slotstream-optimization-execution/portable-integration-v196/after/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift` — 18839 bytes; SHA-256 `7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98`.

````text
import CryptoKit
import CoreGraphics
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Sequential full-model reference/candidate ownership. Only hashes, token
    /// IDs and scalar observations cross arms, never an MLX tensor or model.
    public static func optimizationIntegrated(modelDir: URL, mtp: Bool, visionQueryTile: Bool = false,
                                             ropeFusion: Bool = false, gdnProjection: Bool = false) throws -> CheckReport {
        try integratedComparison(modelDir: modelDir, mtp: mtp, visionQueryTile: visionQueryTile,
            ropeFusion: ropeFusion, gdnProjection: gdnProjection, portableRotation: false)
    }

    /// Run the complete candidate through the actual unqualified-platform
    /// selector. This exercises portable arithmetic on the available Mac; it
    /// does not certify execution or speed on hardware we have not measured.
    package static func optimizationPortableIntegrated(modelDir: URL, mtp: Bool) throws -> CheckReport {
        try integratedComparison(modelDir: modelDir, mtp: mtp, visionQueryTile: false,
            ropeFusion: false, gdnProjection: false, portableRotation: true)
    }

    private static func integratedComparison(modelDir: URL, mtp: Bool, visionQueryTile: Bool,
                                            ropeFusion: Bool, gdnProjection: Bool,
                                            portableRotation: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-integrated\(mtp ? "-mtp" : "")\(visionQueryTile ? "-vision-query" : "")\(portableRotation ? "-portable" : "")")
        struct Results {
            var state: [String: [String: String]] = [:]
            var outputs: [String: [Int]] = [:]
        }
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        func arm(candidate: Bool, expected: Results?) throws -> Results {
            let index = try CheckpointIndex(dir: modelDir)
            let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: candidate,
                packGDNProjections: candidate && gdnProjection)
            if mtp { try model.enableMTP(modelDir: modelDir) }
            model.optimizations = candidate ? .integrationCandidate : InferenceOptimizations()
            if candidate && portableRotation {
                model.optimizations = .deploymentCandidate(on: OptimizationPlatform(
                    machineModel: nil, chip: nil, osBuild: nil, nativeARM64: false))
            }
            model.optimizations.fusedGDNProjection = candidate && gdnProjection
            if candidate && visionQueryTile { model.optimizations.visionQueryTile = 256 }
            if candidate && ropeFusion {
                model.optimizations.sharedRoPE = true
                model.optimizations.fusedRoPE = true
            }
            let generator = Generator(model: model)
            generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
            generator.speculationEnabled = mtp; generator.draftDepth = 1
            var params = SampleParams.greedy; params.maxTokens = 8; params.seed = 7
            var results = Results()
            c.equal("\(candidate): embedding selection", model.resident.usesEmbeddingRows, candidate)
            for count in [-1, 1, Int.max] {
                let invalid = model.makeState(); invalid.tokenCount = count
                let before = invalid.prefixForkDiagnosticTensors().mapValues(hash)
                do {
                    _ = try model.lastLogitsChecked([17], state: invalid)
                    c.expect("\(candidate): invalid public offset rejected", false)
                } catch { c.expect("\(candidate): invalid public offset rejected", true) }
                c.equal("\(candidate): rejected offset leaves state unchanged", invalid.prefixForkDiagnosticTensors().mapValues(hash), before)
            }
            let blank = Qwen4ExpModel.State()
            let blankFields = blank.prefixForkDiagnosticTensors().mapValues(hash)
            do {
                _ = try model.lastLogitsChecked([17], state: blank)
                c.expect("\(candidate): empty public State rejected", false)
            } catch { c.expect("\(candidate): empty public State rejected", true) }
            c.equal("\(candidate): empty-state rejection is atomic", blank.prefixForkDiagnosticTensors().mapValues(hash), blankFields)
            let tower = try VisionTower(index: index)
            let png = Data(base64Encoded: "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==")!
            let image: CGImage
            if visionQueryTile {
                guard let context = CGContext(data: nil, width: 512, height: 512,
                    bitsPerComponent: 8, bytesPerRow: 2048, space: CGColorSpaceCreateDeviceRGB(),
                    bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
                    throw ModelError("cannot allocate bounded integrated image fixture")
                }
                context.setFillColor(CGColor(red: 1, green: 0, blue: 0, alpha: 1))
                context.fill(CGRect(x: 0, y: 0, width: 512, height: 512))
                guard let made = context.makeImage() else { throw ModelError("cannot materialize integrated image fixture") }
                image = made
            } else { image = try VisionPreprocess.decodeCGImage(png) }
            let imagePlan = try tower.plan(for: image)
            func vision(_ start: Int?) -> VisionPrompt? {
                guard let start else { return nil }
                return VisionPrompt(tower: tower, items: [.init(image: image, plan: imagePlan)],
                    segments: [.init(start: start, count: imagePlan.mergedTokens,
                        hash: ImageHash(hashing: visionQueryTile ? Data("solid-red-512x512-CGContext-v1".utf8) : png))],
                    hiddenSize: model.cfg.hiddenSize)
            }
            let cases: [(String, Int, Int?)] = [
                ("cached17", 17, nil), ("boundary255", 255, nil), ("boundary256", 256, nil),
                ("boundary257", 257, nil), ("long1025", 1025, nil),
                ("image-before", 273, 1),
                ("image-crossing", 273 + imagePlan.mergedTokens, 256 - imagePlan.mergedTokens / 2)
            ]
            for (label, count, start) in cases {
                FileHandle.standardError.write(Data("integrated \(candidate ? "candidate" : "reference") / \(label)\n".utf8))
                var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
                if let start {
                    ids.replaceSubrange(start..<start+imagePlan.mergedTokens,
                        with: repeatElement(model.cfg.imageTokenId, count: imagePlan.mergedTokens))
                }
                let cache = PrefixCache(maxTokens: 8192)
                var keepGoing = true
                generator.onPrefillProgress = { done, total, _ in
                    if done == total && done > 0 { keepGoing = false }
                }
                let vp = vision(start)
                let prefill = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    vision: vp, shouldContinue: { keepGoing })
                c.equal("\(candidate)/\(label): cancelled prefill releases request pins", model.pool.pinnedSlotCount, 0)
                generator.onPrefillProgress = nil
                c.expect("\(candidate)/\(label): cancellation commits complete prefill", prefill.0.isEmpty && prefill.1.runtimeError == nil && prefill.1.prefillTokens == count)
                guard let taken = cache.take(matching: ids + [17], images: vp?.cacheSegments(
                    attentionPadding: model.optimizations.visionAttentionPadding,
                    queryTile: model.optimizations.visionQueryTile) ?? []) else {
                    throw ModelError("integrated prefill lost its complete committed state")
                }
                c.equal("\(candidate)/\(label): exact committed offset", taken.state.tokenCount, count)
                if mtp { c.expect("\(candidate)/\(label): head is aligned", taken.state.hasValidMTP) }
                var fields = taken.state.prefixForkDiagnosticTensors().mapValues(hash)
                taken.state.invalidateMTP()
                fields["continuedLogits"] = hash(try model.lastLogitsChecked([17], state: taken.state))
                results.state[label] = fields
                if let wanted = expected?.state[label] { c.equal("\(label): all state bytes and continued logits exact", fields, wanted) }
                let full = generator.generate(promptIds: ids, params: params, eosIds: [], vision: vision(start))
                c.equal("\(candidate)/\(label): completed request releases pins", model.pool.pinnedSlotCount, 0)
                if visionQueryTile {
                    c.equal("\(candidate)/\(label): explicit vision query bound", full.1.visionQueryTile,
                        candidate && start != nil ? 256 : 0)
                    c.equal("\(candidate)/\(label): executed vision tile count", full.1.visionQueryTileCalls,
                        candidate && start != nil ? tower.vcfg.depth * ((imagePlan.patches + 255) / 256) : 0)
                }
                c.expect("\(candidate)/\(label): full completion succeeds", full.1.runtimeError == nil && full.0.count == params.maxTokens)
                if mtp { c.expect("\(candidate)/\(label): verification executes", full.1.verifyPasses > 0) }
                else { c.equal("\(candidate)/\(label): final forward work is explicit", full.1.decodeModelTokens, params.maxTokens - (candidate ? 1 : 0)) }
                c.expect("\(candidate)/\(label): embeddings remain bounded", full.1.embeddingCachedPayloadBytes <= 11_796_480)
                results.outputs[label] = full.0
                if let wanted = expected?.outputs[label] { c.equal("\(label): exact complete greedy IDs", full.0, wanted) }
            }

            let prompt = (0..<273).map { 1000 + ($0 * 79) % 190_000 }
            for filtered in [false, true] {
                var sample = params
                sample.temperature = 0.7; sample.topK = filtered ? 40 : 0
                sample.topP = filtered ? 0.8 : 1; sample.minP = filtered ? 0.05 : 0
                sample.presencePenalty = filtered ? 1.1 : 0
                for seed: UInt64 in [7, 7_046_029_254_386_353_130] {
                    sample.seed = seed
                    let label = "sample/\(filtered)/\(seed)"
                    let first = generator.generate(promptIds: Array(prompt.prefix(17)), params: sample, eosIds: [])
                    let repeatRun = generator.generate(promptIds: Array(prompt.prefix(17)), params: sample, eosIds: [])
                    c.equal("\(candidate)/\(label): sampled requests return an idle pool", model.pool.pinnedSlotCount, 0)
                    c.expect("\(candidate)/\(label): sampled output completes", first.1.runtimeError == nil && first.0.count == sample.maxTokens)
                    c.equal("\(candidate)/\(label): seeded replay exact", repeatRun.0, first.0)
                    results.outputs[label] = first.0
                    if let wanted = expected?.outputs[label] { c.equal("\(label): integrated sampled IDs match reference", first.0, wanted) }
                }
            }
            let retained = PrefixCache(maxTokens: 8192)
            let first = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained)
            c.expect("\(candidate): first retained request succeeds", first.1.runtimeError == nil)
            let casesOfReuse: [(String, [Int])] = [
                ("same", prompt),
                ("auxiliary", Array(prompt.prefix(17)) + [23]),
                ("divergent", Array(prompt.prefix(256)) + Array(repeating: 907, count: 259)),
                ("same-after-auxiliary", prompt),
                ("edited", [999] + Array(prompt.dropFirst()))
            ]
            for (label, ids) in casesOfReuse {
                let outcome = generator.generate(promptIds: ids, params: params, eosIds: [], cache: retained)
                c.equal("\(candidate)/\(label): cache reuse releases request pins", model.pool.pinnedSlotCount, 0)
                c.expect("\(candidate)/\(label): reusable-cache request succeeds", outcome.1.runtimeError == nil && outcome.0.count == params.maxTokens)
                if label == "same" {
                    c.equal("\(candidate): complete checkpoint is exercised", outcome.1.reusedPrefixTokens, candidate ? prompt.count : 0)
                    c.equal("\(candidate): complete hit is observed", outcome.1.completePromptHits, candidate ? 1 : 0)
                    c.equal("\(candidate): complete hit eliminates prefill", outcome.1.prefillTokens, candidate ? 0 : prompt.count)
                    c.equal("\(candidate): same prompt repeats exactly", outcome.0, first.0)
                }
                if label == "edited" { c.equal("\(candidate): edited prefix refuses prior state", outcome.1.reusedPrefixTokens, 0) }
                c.equal("\(candidate)/\(label): no invalid checkpoint published", outcome.1.prefixCheckpointErrors, 0)
                let key = "reuse/\(label)"; results.outputs[key] = outcome.0
                if let wanted = expected?.outputs[key] { c.equal("\(label): interleaved output matches independent reference", outcome.0, wanted) }
            }
            // A shorter committed checkpoint must still help when the entire
            // input differs. Exercise this independently of identical retries
            // and retain the same four physical-state budget.
            let editedTail = Array(prompt.prefix(256)) + Array(repeating: 907, count: 17)
            let partial = PrefixCache(maxTokens: 8192)
            _ = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: partial)
            let tailResult = generator.generate(promptIds: editedTail, params: params, eosIds: [], cache: partial)
            c.expect("\(candidate): partial fallback succeeds", tailResult.1.runtimeError == nil)
            c.equal("\(candidate): edited tail uses the shorter checkpoint", tailResult.1.reusedPrefixTokens, candidate ? 256 : 0)
            c.equal("\(candidate): partial fallback is not a complete hit", tailResult.1.completePromptHits, 0)
            c.expect("\(candidate): combined retention respects physical-state count",
                (partial.json()["conversations"] as? Int ?? Int.max) <= PrefixCache.maxEntries)
            results.outputs["partial-fallback"] = tailResult.0
            if let wanted = expected?.outputs["partial-fallback"] {
                c.equal("partial fallback output matches independent reference", tailResult.0, wanted)
            }
            var delivered: [Int] = []
            let cancelled = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained,
                onToken: { id in delivered.append(id); return delivered.count < 2 })
            c.equal("\(candidate): callback cancellation releases request pins", model.pool.pinnedSlotCount, 0)
            c.equal("\(candidate): callback cancellation has no hidden output", cancelled.0, delivered)
            c.equal("\(candidate): callback stops at two emissions", delivered.count, 2)
            c.equal("\(candidate): cancellation preserves exact output prefix", delivered, Array(first.0.prefix(2)))
            c.expect("\(candidate): client cancellation is not a model error", cancelled.1.runtimeError == nil)
            let retry = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained)
            c.equal("\(candidate): retry returns an idle pool", model.pool.pinnedSlotCount, 0)
            c.equal("\(candidate): retry after cancellation is exact", retry.0, first.0)
            c.expect("\(candidate): prefix capacity stays bounded", retained.heldTokens <= 8192)
            // Exercise exits that can follow a fresh pinned dispatch without
            // another forward to clear the pins. Derive EOS from this same
            // arithmetic path, so this gate does not assume a vocabulary ID.
            var one = params; one.maxTokens = 1
            let short = Array(prompt.prefix(17))
            let single = generator.generate(promptIds: short, params: one, eosIds: [])
            c.equal("\(candidate): one-token request releases pins", model.pool.pinnedSlotCount, 0)
            c.equal("\(candidate): one-token request emits exactly one token", single.0.count, 1)
            if let eos = single.0.first {
                let stopped = generator.generate(promptIds: short, params: params, eosIds: [eos])
                c.expect("\(candidate): immediate EOS succeeds without emitted output",
                    stopped.1.runtimeError == nil && stopped.0.isEmpty && stopped.1.finishReason == "stop")
                c.equal("\(candidate): immediate EOS releases pins", model.pool.pinnedSlotCount, 0)
            }
            if ropeFusion || InferenceOptimizations.integrationCandidate.fusedRoPE {
                c.equal("\(candidate): fused RoPE evaluated paths", model.fusedRoPERotationsScheduled > 0,
                    candidate && !portableRotation)
                c.equal("\(candidate): shared RoPE evaluated paths", model.ropeTableHits > 0, candidate)
                c.measure("\(candidate).fused_rotations_scheduled", Double(model.fusedRoPERotationsScheduled))
            }
            if gdnProjection {
                let state = model.makeState(), before = model.fusedGDNProjectionsScheduled
                let logits = model.lastLogits([907], state: state); eval(logits)
                var snapshot = state.diagnosticTensors().mapValues(hash)
                snapshot["logits"] = hash(logits)
                results.state["gdn-single"] = snapshot
                if let wanted = expected?.state["gdn-single"] {
                    c.equal("integrated one-token projection state and logits", snapshot, wanted)
                }
                let layers = model.cfg.layerTypes.filter { $0 == "linear_attention" }.count
                c.equal("\(candidate): one-token projection mechanism", model.fusedGDNProjectionsScheduled - before,
                    candidate ? layers : 0)
                c.equal("\(candidate): packed projection layers", model.resident.packedGDNProjectionLayers,
                    candidate ? layers : 0)
            }
            return results
        }
        let reference = try arm(candidate: false, expected: nil)
        MLX.Memory.clearCache()
        _ = try arm(candidate: true, expected: reference)
        return c.report()
    }
}

````

Artifact `/tmp/slotstream-optimization-execution/portable-integration-v196/after/Sources/slotstream-cli/OptimizationCommands.swift` — 21932 bytes; SHA-256 `ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571`.

````text
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

````

Artifact `/tmp/slotstream-optimization-execution/portable-integration-v196/before/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift` — 17558 bytes; SHA-256 `a3cb658bbf29d1f119da68d517fba8e73db64a8ce6b698d14b5671fc25af5ccd`.

````text
import CryptoKit
import CoreGraphics
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Sequential full-model reference/candidate ownership. Only hashes, token
    /// IDs and scalar observations cross arms, never an MLX tensor or model.
    public static func optimizationIntegrated(modelDir: URL, mtp: Bool, visionQueryTile: Bool = false,
                                             ropeFusion: Bool = false, gdnProjection: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        var c = CheckBuilder("optimization-integrated\(mtp ? "-mtp" : "")\(visionQueryTile ? "-vision-query" : "")")
        struct Results {
            var state: [String: [String: String]] = [:]
            var outputs: [String: [Int]] = [:]
        }
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        func arm(candidate: Bool, expected: Results?) throws -> Results {
            let index = try CheckpointIndex(dir: modelDir)
            let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: candidate,
                packGDNProjections: candidate && gdnProjection)
            if mtp { try model.enableMTP(modelDir: modelDir) }
            model.optimizations = candidate ? .integrationCandidate : InferenceOptimizations()
            model.optimizations.fusedGDNProjection = candidate && gdnProjection
            if candidate && visionQueryTile { model.optimizations.visionQueryTile = 256 }
            if candidate && ropeFusion {
                model.optimizations.sharedRoPE = true
                model.optimizations.fusedRoPE = true
            }
            let generator = Generator(model: model)
            generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
            generator.speculationEnabled = mtp; generator.draftDepth = 1
            var params = SampleParams.greedy; params.maxTokens = 8; params.seed = 7
            var results = Results()
            c.equal("\(candidate): embedding selection", model.resident.usesEmbeddingRows, candidate)
            for count in [-1, 1, Int.max] {
                let invalid = model.makeState(); invalid.tokenCount = count
                let before = invalid.prefixForkDiagnosticTensors().mapValues(hash)
                do {
                    _ = try model.lastLogitsChecked([17], state: invalid)
                    c.expect("\(candidate): invalid public offset rejected", false)
                } catch { c.expect("\(candidate): invalid public offset rejected", true) }
                c.equal("\(candidate): rejected offset leaves state unchanged", invalid.prefixForkDiagnosticTensors().mapValues(hash), before)
            }
            let blank = Qwen4ExpModel.State()
            let blankFields = blank.prefixForkDiagnosticTensors().mapValues(hash)
            do {
                _ = try model.lastLogitsChecked([17], state: blank)
                c.expect("\(candidate): empty public State rejected", false)
            } catch { c.expect("\(candidate): empty public State rejected", true) }
            c.equal("\(candidate): empty-state rejection is atomic", blank.prefixForkDiagnosticTensors().mapValues(hash), blankFields)
            let tower = try VisionTower(index: index)
            let png = Data(base64Encoded: "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==")!
            let image: CGImage
            if visionQueryTile {
                guard let context = CGContext(data: nil, width: 512, height: 512,
                    bitsPerComponent: 8, bytesPerRow: 2048, space: CGColorSpaceCreateDeviceRGB(),
                    bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
                    throw ModelError("cannot allocate bounded integrated image fixture")
                }
                context.setFillColor(CGColor(red: 1, green: 0, blue: 0, alpha: 1))
                context.fill(CGRect(x: 0, y: 0, width: 512, height: 512))
                guard let made = context.makeImage() else { throw ModelError("cannot materialize integrated image fixture") }
                image = made
            } else { image = try VisionPreprocess.decodeCGImage(png) }
            let imagePlan = try tower.plan(for: image)
            func vision(_ start: Int?) -> VisionPrompt? {
                guard let start else { return nil }
                return VisionPrompt(tower: tower, items: [.init(image: image, plan: imagePlan)],
                    segments: [.init(start: start, count: imagePlan.mergedTokens,
                        hash: ImageHash(hashing: visionQueryTile ? Data("solid-red-512x512-CGContext-v1".utf8) : png))],
                    hiddenSize: model.cfg.hiddenSize)
            }
            let cases: [(String, Int, Int?)] = [
                ("cached17", 17, nil), ("boundary255", 255, nil), ("boundary256", 256, nil),
                ("boundary257", 257, nil), ("long1025", 1025, nil),
                ("image-before", 273, 1),
                ("image-crossing", 273 + imagePlan.mergedTokens, 256 - imagePlan.mergedTokens / 2)
            ]
            for (label, count, start) in cases {
                FileHandle.standardError.write(Data("integrated \(candidate ? "candidate" : "reference") / \(label)\n".utf8))
                var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
                if let start {
                    ids.replaceSubrange(start..<start+imagePlan.mergedTokens,
                        with: repeatElement(model.cfg.imageTokenId, count: imagePlan.mergedTokens))
                }
                let cache = PrefixCache(maxTokens: 8192)
                var keepGoing = true
                generator.onPrefillProgress = { done, total, _ in
                    if done == total && done > 0 { keepGoing = false }
                }
                let vp = vision(start)
                let prefill = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    vision: vp, shouldContinue: { keepGoing })
                c.equal("\(candidate)/\(label): cancelled prefill releases request pins", model.pool.pinnedSlotCount, 0)
                generator.onPrefillProgress = nil
                c.expect("\(candidate)/\(label): cancellation commits complete prefill", prefill.0.isEmpty && prefill.1.runtimeError == nil && prefill.1.prefillTokens == count)
                guard let taken = cache.take(matching: ids + [17], images: vp?.cacheSegments(
                    attentionPadding: model.optimizations.visionAttentionPadding,
                    queryTile: model.optimizations.visionQueryTile) ?? []) else {
                    throw ModelError("integrated prefill lost its complete committed state")
                }
                c.equal("\(candidate)/\(label): exact committed offset", taken.state.tokenCount, count)
                if mtp { c.expect("\(candidate)/\(label): head is aligned", taken.state.hasValidMTP) }
                var fields = taken.state.prefixForkDiagnosticTensors().mapValues(hash)
                taken.state.invalidateMTP()
                fields["continuedLogits"] = hash(try model.lastLogitsChecked([17], state: taken.state))
                results.state[label] = fields
                if let wanted = expected?.state[label] { c.equal("\(label): all state bytes and continued logits exact", fields, wanted) }
                let full = generator.generate(promptIds: ids, params: params, eosIds: [], vision: vision(start))
                c.equal("\(candidate)/\(label): completed request releases pins", model.pool.pinnedSlotCount, 0)
                if visionQueryTile {
                    c.equal("\(candidate)/\(label): explicit vision query bound", full.1.visionQueryTile,
                        candidate && start != nil ? 256 : 0)
                    c.equal("\(candidate)/\(label): executed vision tile count", full.1.visionQueryTileCalls,
                        candidate && start != nil ? tower.vcfg.depth * ((imagePlan.patches + 255) / 256) : 0)
                }
                c.expect("\(candidate)/\(label): full completion succeeds", full.1.runtimeError == nil && full.0.count == params.maxTokens)
                if mtp { c.expect("\(candidate)/\(label): verification executes", full.1.verifyPasses > 0) }
                else { c.equal("\(candidate)/\(label): final forward work is explicit", full.1.decodeModelTokens, params.maxTokens - (candidate ? 1 : 0)) }
                c.expect("\(candidate)/\(label): embeddings remain bounded", full.1.embeddingCachedPayloadBytes <= 11_796_480)
                results.outputs[label] = full.0
                if let wanted = expected?.outputs[label] { c.equal("\(label): exact complete greedy IDs", full.0, wanted) }
            }

            let prompt = (0..<273).map { 1000 + ($0 * 79) % 190_000 }
            for filtered in [false, true] {
                var sample = params
                sample.temperature = 0.7; sample.topK = filtered ? 40 : 0
                sample.topP = filtered ? 0.8 : 1; sample.minP = filtered ? 0.05 : 0
                sample.presencePenalty = filtered ? 1.1 : 0
                for seed: UInt64 in [7, 7_046_029_254_386_353_130] {
                    sample.seed = seed
                    let label = "sample/\(filtered)/\(seed)"
                    let first = generator.generate(promptIds: Array(prompt.prefix(17)), params: sample, eosIds: [])
                    let repeatRun = generator.generate(promptIds: Array(prompt.prefix(17)), params: sample, eosIds: [])
                    c.equal("\(candidate)/\(label): sampled requests return an idle pool", model.pool.pinnedSlotCount, 0)
                    c.expect("\(candidate)/\(label): sampled output completes", first.1.runtimeError == nil && first.0.count == sample.maxTokens)
                    c.equal("\(candidate)/\(label): seeded replay exact", repeatRun.0, first.0)
                    results.outputs[label] = first.0
                    if let wanted = expected?.outputs[label] { c.equal("\(label): integrated sampled IDs match reference", first.0, wanted) }
                }
            }
            let retained = PrefixCache(maxTokens: 8192)
            let first = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained)
            c.expect("\(candidate): first retained request succeeds", first.1.runtimeError == nil)
            let casesOfReuse: [(String, [Int])] = [
                ("same", prompt),
                ("auxiliary", Array(prompt.prefix(17)) + [23]),
                ("divergent", Array(prompt.prefix(256)) + Array(repeating: 907, count: 259)),
                ("same-after-auxiliary", prompt),
                ("edited", [999] + Array(prompt.dropFirst()))
            ]
            for (label, ids) in casesOfReuse {
                let outcome = generator.generate(promptIds: ids, params: params, eosIds: [], cache: retained)
                c.equal("\(candidate)/\(label): cache reuse releases request pins", model.pool.pinnedSlotCount, 0)
                c.expect("\(candidate)/\(label): reusable-cache request succeeds", outcome.1.runtimeError == nil && outcome.0.count == params.maxTokens)
                if label == "same" {
                    c.equal("\(candidate): complete checkpoint is exercised", outcome.1.reusedPrefixTokens, candidate ? prompt.count : 0)
                    c.equal("\(candidate): complete hit is observed", outcome.1.completePromptHits, candidate ? 1 : 0)
                    c.equal("\(candidate): complete hit eliminates prefill", outcome.1.prefillTokens, candidate ? 0 : prompt.count)
                    c.equal("\(candidate): same prompt repeats exactly", outcome.0, first.0)
                }
                if label == "edited" { c.equal("\(candidate): edited prefix refuses prior state", outcome.1.reusedPrefixTokens, 0) }
                c.equal("\(candidate)/\(label): no invalid checkpoint published", outcome.1.prefixCheckpointErrors, 0)
                let key = "reuse/\(label)"; results.outputs[key] = outcome.0
                if let wanted = expected?.outputs[key] { c.equal("\(label): interleaved output matches independent reference", outcome.0, wanted) }
            }
            // A shorter committed checkpoint must still help when the entire
            // input differs. Exercise this independently of identical retries
            // and retain the same four physical-state budget.
            let editedTail = Array(prompt.prefix(256)) + Array(repeating: 907, count: 17)
            let partial = PrefixCache(maxTokens: 8192)
            _ = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: partial)
            let tailResult = generator.generate(promptIds: editedTail, params: params, eosIds: [], cache: partial)
            c.expect("\(candidate): partial fallback succeeds", tailResult.1.runtimeError == nil)
            c.equal("\(candidate): edited tail uses the shorter checkpoint", tailResult.1.reusedPrefixTokens, candidate ? 256 : 0)
            c.equal("\(candidate): partial fallback is not a complete hit", tailResult.1.completePromptHits, 0)
            c.expect("\(candidate): combined retention respects physical-state count",
                (partial.json()["conversations"] as? Int ?? Int.max) <= PrefixCache.maxEntries)
            results.outputs["partial-fallback"] = tailResult.0
            if let wanted = expected?.outputs["partial-fallback"] {
                c.equal("partial fallback output matches independent reference", tailResult.0, wanted)
            }
            var delivered: [Int] = []
            let cancelled = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained,
                onToken: { id in delivered.append(id); return delivered.count < 2 })
            c.equal("\(candidate): callback cancellation releases request pins", model.pool.pinnedSlotCount, 0)
            c.equal("\(candidate): callback cancellation has no hidden output", cancelled.0, delivered)
            c.equal("\(candidate): callback stops at two emissions", delivered.count, 2)
            c.equal("\(candidate): cancellation preserves exact output prefix", delivered, Array(first.0.prefix(2)))
            c.expect("\(candidate): client cancellation is not a model error", cancelled.1.runtimeError == nil)
            let retry = generator.generate(promptIds: prompt, params: params, eosIds: [], cache: retained)
            c.equal("\(candidate): retry returns an idle pool", model.pool.pinnedSlotCount, 0)
            c.equal("\(candidate): retry after cancellation is exact", retry.0, first.0)
            c.expect("\(candidate): prefix capacity stays bounded", retained.heldTokens <= 8192)
            // Exercise exits that can follow a fresh pinned dispatch without
            // another forward to clear the pins. Derive EOS from this same
            // arithmetic path, so this gate does not assume a vocabulary ID.
            var one = params; one.maxTokens = 1
            let short = Array(prompt.prefix(17))
            let single = generator.generate(promptIds: short, params: one, eosIds: [])
            c.equal("\(candidate): one-token request releases pins", model.pool.pinnedSlotCount, 0)
            c.equal("\(candidate): one-token request emits exactly one token", single.0.count, 1)
            if let eos = single.0.first {
                let stopped = generator.generate(promptIds: short, params: params, eosIds: [eos])
                c.expect("\(candidate): immediate EOS succeeds without emitted output",
                    stopped.1.runtimeError == nil && stopped.0.isEmpty && stopped.1.finishReason == "stop")
                c.equal("\(candidate): immediate EOS releases pins", model.pool.pinnedSlotCount, 0)
            }
            if ropeFusion || InferenceOptimizations.integrationCandidate.fusedRoPE {
                c.equal("\(candidate): fused RoPE evaluated paths", model.fusedRoPERotationsScheduled > 0, candidate)
                c.equal("\(candidate): shared RoPE evaluated paths", model.ropeTableHits > 0, candidate)
                c.measure("\(candidate).fused_rotations_scheduled", Double(model.fusedRoPERotationsScheduled))
            }
            if gdnProjection {
                let state = model.makeState(), before = model.fusedGDNProjectionsScheduled
                let logits = model.lastLogits([907], state: state); eval(logits)
                var snapshot = state.diagnosticTensors().mapValues(hash)
                snapshot["logits"] = hash(logits)
                results.state["gdn-single"] = snapshot
                if let wanted = expected?.state["gdn-single"] {
                    c.equal("integrated one-token projection state and logits", snapshot, wanted)
                }
                let layers = model.cfg.layerTypes.filter { $0 == "linear_attention" }.count
                c.equal("\(candidate): one-token projection mechanism", model.fusedGDNProjectionsScheduled - before,
                    candidate ? layers : 0)
                c.equal("\(candidate): packed projection layers", model.resident.packedGDNProjectionLayers,
                    candidate ? layers : 0)
            }
            return results
        }
        let reference = try arm(candidate: false, expected: nil)
        MLX.Memory.clearCache()
        _ = try arm(candidate: true, expected: reference)
        return c.report()
    }
}

````

Artifact `/tmp/slotstream-optimization-execution/portable-integration-v196/before/Sources/slotstream-cli/OptimizationCommands.swift` — 21678 bytes; SHA-256 `bb3a76becb56a4e6bd46fe118122b8479e55a61701ce4d37aa7c39a88d456022`.

````text
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

````

Artifact `/tmp/slotstream-optimization-execution/portable-integration-v196/fix.patch` — 4188 bytes; SHA-256 `92b2d1d97091db08c56fed6981238ec6c099f6124bde3d61aa17434fb2b791ca`.

````text
--- a/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift
@@ -9,8 +9,23 @@
     /// IDs and scalar observations cross arms, never an MLX tensor or model.
     public static func optimizationIntegrated(modelDir: URL, mtp: Bool, visionQueryTile: Bool = false,
                                              ropeFusion: Bool = false, gdnProjection: Bool = false) throws -> CheckReport {
+        try integratedComparison(modelDir: modelDir, mtp: mtp, visionQueryTile: visionQueryTile,
+            ropeFusion: ropeFusion, gdnProjection: gdnProjection, portableRotation: false)
+    }
+
+    /// Run the complete candidate through the actual unqualified-platform
+    /// selector. This exercises portable arithmetic on the available Mac; it
+    /// does not certify execution or speed on hardware we have not measured.
+    package static func optimizationPortableIntegrated(modelDir: URL, mtp: Bool) throws -> CheckReport {
+        try integratedComparison(modelDir: modelDir, mtp: mtp, visionQueryTile: false,
+            ropeFusion: false, gdnProjection: false, portableRotation: true)
+    }
+
+    private static func integratedComparison(modelDir: URL, mtp: Bool, visionQueryTile: Bool,
+                                            ropeFusion: Bool, gdnProjection: Bool,
+                                            portableRotation: Bool) throws -> CheckReport {
         MLX.Memory.cacheLimit = 128 << 20
-        var c = CheckBuilder("optimization-integrated\(mtp ? "-mtp" : "")\(visionQueryTile ? "-vision-query" : "")")
+        var c = CheckBuilder("optimization-integrated\(mtp ? "-mtp" : "")\(visionQueryTile ? "-vision-query" : "")\(portableRotation ? "-portable" : "")")
         struct Results {
             var state: [String: [String: String]] = [:]
             var outputs: [String: [Int]] = [:]
@@ -24,6 +39,10 @@
                 packGDNProjections: candidate && gdnProjection)
             if mtp { try model.enableMTP(modelDir: modelDir) }
             model.optimizations = candidate ? .integrationCandidate : InferenceOptimizations()
+            if candidate && portableRotation {
+                model.optimizations = .deploymentCandidate(on: OptimizationPlatform(
+                    machineModel: nil, chip: nil, osBuild: nil, nativeARM64: false))
+            }
             model.optimizations.fusedGDNProjection = candidate && gdnProjection
             if candidate && visionQueryTile { model.optimizations.visionQueryTile = 256 }
             if candidate && ropeFusion {
@@ -212,7 +231,8 @@
                 c.equal("\(candidate): immediate EOS releases pins", model.pool.pinnedSlotCount, 0)
             }
             if ropeFusion || InferenceOptimizations.integrationCandidate.fusedRoPE {
-                c.equal("\(candidate): fused RoPE evaluated paths", model.fusedRoPERotationsScheduled > 0, candidate)
+                c.equal("\(candidate): fused RoPE evaluated paths", model.fusedRoPERotationsScheduled > 0,
+                    candidate && !portableRotation)
                 c.equal("\(candidate): shared RoPE evaluated paths", model.ropeTableHits > 0, candidate)
                 c.measure("\(candidate).fused_rotations_scheduled", Double(model.fusedRoPERotationsScheduled))
             }
--- a/Sources/slotstream-cli/OptimizationCommands.swift
+++ b/Sources/slotstream-cli/OptimizationCommands.swift
@@ -122,6 +122,10 @@
         else if variant == "integrated" || variant == "integrated-mtp" {
             report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL, mtp: variant == "integrated-mtp")
         }
+        else if variant == "integrated-portable" || variant == "integrated-portable-mtp" {
+            report = try Diagnostics.optimizationPortableIntegrated(modelDir: model.modelURL,
+                mtp: variant == "integrated-portable-mtp")
+        }
         else if variant == "integrated-vision-query" || variant == "integrated-vision-query-mtp" {
             report = try Diagnostics.optimizationIntegrated(modelDir: model.modelURL,
                 mtp: variant == "integrated-vision-query-mtp", visionQueryTile: true)

````

Artifact `/tmp/slotstream-optimization-execution/portable-integration-v196/manifest.json` — 869 bytes; SHA-256 `590b047428015b321f6722a4d8028c92cc1b25e92428337363fbe61325cad127`.

````text
{
  "files": [
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift",
      "before_sha256": "a3cb658bbf29d1f119da68d517fba8e73db64a8ce6b698d14b5671fc25af5ccd",
      "after_sha256": "7f56163e8e1883da54874917ca11c239f65806586b8409a9f39a5f9516f2df98"
    },
    {
      "path": "Sources/slotstream-cli/OptimizationCommands.swift",
      "before_sha256": "bb3a76becb56a4e6bd46fe118122b8479e55a61701ce4d37aa7c39a88d456022",
      "after_sha256": "ae17fae2d748198fa56a06c6a0ce0feaab2515c3997fcb9a5c7cfe84aa283571"
    }
  ],
  "status": "applied diagnostic-only source; unbuilt/unrun",
  "variants": [
    "integrated-portable",
    "integrated-portable-mtp"
  ],
  "production_defaults_changed": false,
  "preserves": "Existing public diagnostics function signature; ordinary candidate path and checks; tested-only platform dispatch identity"
}

````
