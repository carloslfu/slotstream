---
type: run
id: 01m1zg3grsf7h3xm20vpxrhtff
created: 2026-09-08T03:13:37.049346+00:00
updated: 2026-09-08T03:13:37.309754+00:00
summary: Integrated native diagnostics isolate retained prefill state before full generation
binary: V304 af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d; new source deltas remain unbuilt
captured_at: 2026-09-08
command: Source edit and git diff --check; no compiler or model run for the changed source
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Integrated native diagnostics isolate retained prefill state before full generation
tool: Native Slotstream, Python assessment and source review
---
# Limit retained state overlap in the integrated correctness harness

V344 changes only Diagnostics+Integrated.swift after the V342 compact-cache candidate edit. The cancelled-prefill phase now runs in committedFields, returning only its existing state/continued-logit hashes. Its PrefixCache, taken model state and vision prompt no longer need to remain in the surrounding scope while an independent full request executes. A defer also clears the progress callback if the phase exits early.

All original prompt cases, image geometry, output budgets, model/pool settings, state and continued-logit comparisons, sampled/greedy checks, prefix/cancellation behavior and native assertion names remain. The equivalent expected token count is obtained from the unchanged prepared IDs. The selected compact-cache format/payload assertions added in V342 remain in place. Serving drivers and runtime inference math are untouched.

This narrows diagnostic ownership; it is not a measured memory reduction or a claim that the previous pressure failures are fixed. The earlier vision integration stopped in its reference long1025 text case before image processing, so it cannot identify a vision-kernel failure. The new source has only source/diff/whitespace review. It must be compiled and pass the full native state/output checks and actual resource guard. Existing V304 results continue to refer to the old binary, and automatic defaults and the installed release remain unchanged.

Selected cache integration: [[sources/runs/2026/09/2026-09-08-optimization-compact-cache-candidate-integration]]. Failure-time footprint observation remains the separate unbound V341 tool: [[sources/runs/2026/09/2026-09-08-optimization-failure-footprint-observer]].


## Complete artifact inventory

Every listed file is embedded below once per SHA-256, including the source archives. Large text uses gzip plus base64 and binary uses base64; decoding recovers the exact bytes named in this inventory. No original artifact is edited.

```json
[
  {
    "path": "/private/tmp/slotstream-optimization-execution/native-state-lifetime-v344/after.swift",
    "bytes": 19728,
    "sha256": "1274da5c2aed15f2ceb8e42777ea7114e7db83935c059bf633020b5a8ca6be4b"
  },
  {
    "path": "/private/tmp/slotstream-optimization-execution/native-state-lifetime-v344/before.json",
    "bytes": 330,
    "sha256": "a1290f503428637065a3fd70b748f82df75c32dd4a99d67e7558c5d9f9ddc2ac"
  },
  {
    "path": "/private/tmp/slotstream-optimization-execution/native-state-lifetime-v344/before.swift",
    "bytes": 19272,
    "sha256": "6c9075527307293ab0b4ecd8d297ead227e462aec2dee66f884ab01161f986a0"
  },
  {
    "path": "/private/tmp/slotstream-optimization-execution/native-state-lifetime-v344/lifetime.patch",
    "bytes": 4767,
    "sha256": "3e01ec3dcbcff4e81ff50d18c895b59fd0edf7926acdaf69d8b50cde84d67d81"
  },
  {
    "path": "/private/tmp/slotstream-optimization-execution/native-state-lifetime-v344/manifest.json",
    "bytes": 738,
    "sha256": "48a73e3f9d832c496f16d6164e5f4a02c3974d03667ccfa98f6057877733959e"
  }
]
```


## Artifact SHA-256 1274da5c2aed15f2ceb8e42777ea7114e7db83935c059bf633020b5a8ca6be4b

Encoding: `utf-8`. Original bytes: 19728.

````````````text
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
            // Only hashes leave this phase. Its prefix cache and taken state
            // need not remain live while the independent full request runs.
            func committedFields(label: String, ids: [Int], start: Int?) throws -> [String: String] {
                let cache = PrefixCache(maxTokens: 8192)
                var keepGoing = true
                generator.onPrefillProgress = { done, total, _ in
                    if done == total && done > 0 { keepGoing = false }
                }
                defer { generator.onPrefillProgress = nil }
                let vp = vision(start)
                let prefill = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    vision: vp, shouldContinue: { keepGoing })
                c.equal("\(candidate)/\(label): cancelled prefill releases request pins", model.pool.pinnedSlotCount, 0)
                generator.onPrefillProgress = nil
                c.expect("\(candidate)/\(label): cancellation commits complete prefill", prefill.0.isEmpty && prefill.1.runtimeError == nil && prefill.1.prefillTokens == ids.count)
                guard let taken = cache.take(matching: ids + [17], images: vp?.cacheSegments(
                    attentionPadding: model.optimizations.visionAttentionPadding,
                    queryTile: model.optimizations.visionQueryTile) ?? []) else {
                    throw ModelError("integrated prefill lost its complete committed state")
                }
                c.equal("\(candidate)/\(label): exact committed offset", taken.state.tokenCount, ids.count)
                if mtp { c.expect("\(candidate)/\(label): head is aligned", taken.state.hasValidMTP) }
                var fields = taken.state.prefixForkDiagnosticTensors().mapValues(hash)
                taken.state.invalidateMTP()
                fields["continuedLogits"] = hash(try model.lastLogitsChecked([17], state: taken.state))
                return fields
            }
            for (label, count, start) in cases {
                FileHandle.standardError.write(Data("integrated \(candidate ? "candidate" : "reference") / \(label)\n".utf8))
                var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
                if let start {
                    ids.replaceSubrange(start..<start+imagePlan.mergedTokens,
                        with: repeatElement(model.cfg.imageTokenId, count: imagePlan.mergedTokens))
                }
                let fields = try committedFields(label: label, ids: ids, start: start)
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
                c.equal("\(candidate)/\(label): selected n-gram cache format", model.ngram.compactRows, candidate)
                c.expect("\(candidate)/\(label): n-gram cache contains real rows", full.1.ngramCachedRows > 0)
                c.equal("\(candidate)/\(label): exact n-gram cache payload accounting", full.1.ngramCachePayloadBytes,
                    full.1.ngramCachedRows * model.ngram.headDim * (candidate ? 2 : 4))
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

````````````


## Artifact SHA-256 a1290f503428637065a3fd70b748f82df75c32dd4a99d67e7558c5d9f9ddc2ac

Encoding: `utf-8`. Original bytes: 330.

````````````text
{
  "source": "/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift",
  "sha256": "6c9075527307293ab0b4ecd8d297ead227e462aec2dee66f884ab01161f986a0",
  "bytes": 19272,
  "classification": "Preimage after V342 compact-cache assertions; native lifetime narrowing only; no compiled result."
}

````````````


## Artifact SHA-256 6c9075527307293ab0b4ecd8d297ead227e462aec2dee66f884ab01161f986a0

Encoding: `utf-8`. Original bytes: 19272.

````````````text
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
                c.equal("\(candidate)/\(label): selected n-gram cache format", model.ngram.compactRows, candidate)
                c.expect("\(candidate)/\(label): n-gram cache contains real rows", full.1.ngramCachedRows > 0)
                c.equal("\(candidate)/\(label): exact n-gram cache payload accounting", full.1.ngramCachePayloadBytes,
                    full.1.ngramCachedRows * model.ngram.headDim * (candidate ? 2 : 4))
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

````````````


## Artifact SHA-256 3e01ec3dcbcff4e81ff50d18c895b59fd0edf7926acdaf69d8b50cde84d67d81

Encoding: `utf-8`. Original bytes: 4767.

````````````text
--- before/Diagnostics+Integrated.swift
+++ after/Diagnostics+Integrated.swift
@@ -99,6 +99,33 @@
                 ("image-before", 273, 1),
                 ("image-crossing", 273 + imagePlan.mergedTokens, 256 - imagePlan.mergedTokens / 2)
             ]
+            // Only hashes leave this phase. Its prefix cache and taken state
+            // need not remain live while the independent full request runs.
+            func committedFields(label: String, ids: [Int], start: Int?) throws -> [String: String] {
+                let cache = PrefixCache(maxTokens: 8192)
+                var keepGoing = true
+                generator.onPrefillProgress = { done, total, _ in
+                    if done == total && done > 0 { keepGoing = false }
+                }
+                defer { generator.onPrefillProgress = nil }
+                let vp = vision(start)
+                let prefill = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
+                    vision: vp, shouldContinue: { keepGoing })
+                c.equal("\(candidate)/\(label): cancelled prefill releases request pins", model.pool.pinnedSlotCount, 0)
+                generator.onPrefillProgress = nil
+                c.expect("\(candidate)/\(label): cancellation commits complete prefill", prefill.0.isEmpty && prefill.1.runtimeError == nil && prefill.1.prefillTokens == ids.count)
+                guard let taken = cache.take(matching: ids + [17], images: vp?.cacheSegments(
+                    attentionPadding: model.optimizations.visionAttentionPadding,
+                    queryTile: model.optimizations.visionQueryTile) ?? []) else {
+                    throw ModelError("integrated prefill lost its complete committed state")
+                }
+                c.equal("\(candidate)/\(label): exact committed offset", taken.state.tokenCount, ids.count)
+                if mtp { c.expect("\(candidate)/\(label): head is aligned", taken.state.hasValidMTP) }
+                var fields = taken.state.prefixForkDiagnosticTensors().mapValues(hash)
+                taken.state.invalidateMTP()
+                fields["continuedLogits"] = hash(try model.lastLogitsChecked([17], state: taken.state))
+                return fields
+            }
             for (label, count, start) in cases {
                 FileHandle.standardError.write(Data("integrated \(candidate ? "candidate" : "reference") / \(label)\n".utf8))
                 var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
@@ -106,27 +133,7 @@
                     ids.replaceSubrange(start..<start+imagePlan.mergedTokens,
                         with: repeatElement(model.cfg.imageTokenId, count: imagePlan.mergedTokens))
                 }
-                let cache = PrefixCache(maxTokens: 8192)
-                var keepGoing = true
-                generator.onPrefillProgress = { done, total, _ in
-                    if done == total && done > 0 { keepGoing = false }
-                }
-                let vp = vision(start)
-                let prefill = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
-                    vision: vp, shouldContinue: { keepGoing })
-                c.equal("\(candidate)/\(label): cancelled prefill releases request pins", model.pool.pinnedSlotCount, 0)
-                generator.onPrefillProgress = nil
-                c.expect("\(candidate)/\(label): cancellation commits complete prefill", prefill.0.isEmpty && prefill.1.runtimeError == nil && prefill.1.prefillTokens == count)
-                guard let taken = cache.take(matching: ids + [17], images: vp?.cacheSegments(
-                    attentionPadding: model.optimizations.visionAttentionPadding,
-                    queryTile: model.optimizations.visionQueryTile) ?? []) else {
-                    throw ModelError("integrated prefill lost its complete committed state")
-                }
-                c.equal("\(candidate)/\(label): exact committed offset", taken.state.tokenCount, count)
-                if mtp { c.expect("\(candidate)/\(label): head is aligned", taken.state.hasValidMTP) }
-                var fields = taken.state.prefixForkDiagnosticTensors().mapValues(hash)
-                taken.state.invalidateMTP()
-                fields["continuedLogits"] = hash(try model.lastLogitsChecked([17], state: taken.state))
+                let fields = try committedFields(label: label, ids: ids, start: start)
                 results.state[label] = fields
                 if let wanted = expected?.state[label] { c.equal("\(label): all state bytes and continued logits exact", fields, wanted) }
                 let full = generator.generate(promptIds: ids, params: params, eosIds: [], vision: vision(start))

````````````


## Artifact SHA-256 48a73e3f9d832c496f16d6164e5f4a02c3974d03667ccfa98f6057877733959e

Encoding: `utf-8`. Original bytes: 738.

````````````text
{
  "source": "/Users/carlos/Projects/slotstream/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift",
  "before_sha256": "6c9075527307293ab0b4ecd8d297ead227e462aec2dee66f884ab01161f986a0",
  "after_sha256": "1274da5c2aed15f2ceb8e42777ea7114e7db83935c059bf633020b5a8ca6be4b",
  "patch_sha256": "3e01ec3dcbcff4e81ff50d18c895b59fd0edf7926acdaf69d8b50cde84d67d81",
  "purpose": "Limit diagnostic prefix cache and taken-state lifetime to hash capture before independent full generation. Preserve original inputs, outputs and state assertions. Also clear progress callback on early exit.",
  "source_only": true,
  "compiled": false,
  "native_qualified": false,
  "measured_memory_benefit": null,
  "runtime_defaults_changed": false
}

````````````
