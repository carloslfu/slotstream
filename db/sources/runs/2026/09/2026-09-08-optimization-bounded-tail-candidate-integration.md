---
type: run
id: 01m1zkt8pxx0h6y8g2mdtj86xw
created: 2026-09-08T04:18:28.189545+00:00
updated: 2026-09-08T04:18:28.466171+00:00
summary: Qualified bounded greedy tail joins the explicit combined candidate
binary: source-only; no new binary
captured_at: 2026-09-08
command: Source integration of the qualified V343 bounded greedy tail; independent qualification reassessment, three-file patch and git diff --check
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Qualified bounded greedy tail joins the explicit combined candidate
tool: Slotstream local qualification and exact artifact capture
---
V347 adds boundedDraftTail to the explicit integrationCandidate beside the separately qualified compact BF16 cache. Runtime diagnostics cover the new flag's overrides and reference restoration. Integrated native diagnostics additionally compare fixed two-output work, exact output against the independent reference and longer same-arm prefix, sampled verification work and replay across the original seeds and filters. V342 compact-cache payload checks and V344 narrowed diagnostic state lifetime remain.

This capture records source changes only. The new assertions have not yet been compiled or executed, and these three source files do not belong to the old V304 evidence identity. Shared public/environment reference defaults and installed binaries remain unchanged. A new exact candidate build and final native, serving, lifetime, resource, client, sustained-throughput, calibration and activation gates remain required. The complete before/after bytes and patch follow.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/bounded-tail-candidate-integration-v347/after/Sources/Slotstream/Optimizations.swift",
    "bytes": 14247,
    "sha256": "ba34563a589b3a64fceed9a614bae0fb2149b1a117483cf7d3da6b2b5554b598"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/bounded-tail-candidate-integration-v347/after/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift",
    "bytes": 22051,
    "sha256": "512dd096a194f8c56f1d9be16931714035150ca54cbb02cbbb9d0aec5871657d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/bounded-tail-candidate-integration-v347/after/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
    "bytes": 18364,
    "sha256": "f0bba52fb1f9fbea0dca0c5d59634831293ca0088c1ccd15d7dd5bdd4dc07198"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/bounded-tail-candidate-integration-v347/before/Sources/Slotstream/Optimizations.swift",
    "bytes": 14208,
    "sha256": "0ef3216055f57d8adfbc91ae9a28cbefd1ba45b1b08f86502363b6f5329cb494"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/bounded-tail-candidate-integration-v347/before/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift",
    "bytes": 19728,
    "sha256": "1274da5c2aed15f2ceb8e42777ea7114e7db83935c059bf633020b5a8ca6be4b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/bounded-tail-candidate-integration-v347/before/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
    "bytes": 18303,
    "sha256": "25baf57d41c3d2df4928f3f3273fbbbb2514a0dab6793fc7619f642c8b293994"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/bounded-tail-candidate-integration-v347/before.json",
    "bytes": 376,
    "sha256": "cfe56b5bf0d412772d28aa206848540141e2ff67d97266906d1fb8cd8a37f29d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/bounded-tail-candidate-integration-v347/integration.patch",
    "bytes": 5259,
    "sha256": "70305ecabc5ce64a9c15d113e4ae0b708f56783367dc1865d49fa1f46b32239b"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/bounded-tail-candidate-integration-v347/manifest.json",
    "bytes": 2184,
    "sha256": "deb60bcd348699bd2254d110631a5f080703fff7387bd0104392632a9ed56c03"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/bounded-tail-candidate-integration-v347/qualified-prerequisite.json",
    "bytes": 8794,
    "sha256": "f6c9a2dfdf23c074dac9eea02139cbe10d6e8283d75ae28e4b2afbf84ea499e5"
  }
]
```

## Artifact SHA-256 ba34563a589b3a64fceed9a614bae0fb2149b1a117483cf7d3da6b2b5554b598

Encoding: `utf-8`. Original bytes: 14247.

````````````text
import Foundation

/// Independent controls retained while each candidate is qualified. Defaults
/// stay on the reference implementation until its acceptance gates pass.
public struct InferenceOptimizations: Codable, Equatable {
    public var compactStateWindows = false
    public var compactMTPRow = false
    public var skipUnusedFinalForward = false
    public var tailAwarePrefill = false
    public var demandedPrefillOutput = false
    public var terminalPrefillPruning = false
    /// Independent final-QSA output reduction; a 64-row tail retains matrix
    /// dispatch for attention/output/HC, and shorter passes keep every row.
    /// Requires terminal prefill demand.
    package static let terminalQueryTile = 64
    public var terminalLastQuery = false
    public var compactNgramRows = false
    public var incrementalIndexer = false
    public var compactIndexerRaw = false
    public var valueOnlySamplerThreshold = false
    public var deviceSamplerDraw = false
    public var disjointSweepOutput = false
    public var boundedSweepRows = false
    public var boundedIndexer = false
    public var sharedRoPE = false
    public var fusedRoPE = false
    /// Requires the optional shared-backing layout at model construction.
    public var fusedGDNProjection = false
    public var fusedGDNRecording = false
    public var boundedPLE = false
    public var ngramLookahead = false
    public var layerExpertWorkspace = false
    public var workspaceTokenTile = 256
    public var compactScopeFrontier = false
    public var workspacePiecewiseWrites = false
    /// Experimental bounded layer-major scope; zero keeps chronological passes.
    public var readScopeTokens = 0
    public var reuseFirstMTPEntry = false
    /// Greedy-only optional shortening; sampled requests retain their original
    /// verification shapes. Independent context bounds always apply.
    public var boundedDraftTail = false
    public var adaptiveSpeculation = false
    public var resolvedRuntimeBudget = false
    public var layerLocalFloorCache = false
    public var boundedOutputQueue = false
    public var responsiveGovernor = false
    public var routerTopK = false
    public var denseIndexerBypass = false
    public var indexerBlockTopK = false
    public var overlapSharedExpert = false
    public var overlapResidentExperts = false
    public var deduplicateImages = false
    public var visionAttentionPadding = 0
    /// Independent, bounded original-attention path. Qualification pending.
    public var visionQueryTile = 0
    public var cachedRouterWeights = false
    public var directReadHandles = false
    public var compiledNormFinish = false
    public var selectedTextAttention = false
    public var ngramRingOrder = false
    public var denseExpertLookup = false
    public var sparsePoolPins = false
    public var contiguousSlotWrites = false
    public var wordSlotWrites = false
    public var cpuSlotWrites = false
    /// Exact already-scheduled commit boundary; zero disables common-prefix retention.
    public var prefixCheckpointTokens = 0
    /// Retain the complete committed prompt and its raw last logits. This is
    /// independently qualified before joining integrationCandidate.
    public var completePromptCheckpoint = false

    public var readScopeEnabled: Bool {
        readScopeTokens > 0 && layerExpertWorkspace && compactStateWindows
            && compactMTPRow && boundedIndexer && boundedPLE
    }

    public init() {}

    /// The next joint qualification candidate. Explicit selection only; this
    /// does not change public initializer or environment defaults. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
        result.compactNgramRows = true
        result.boundedDraftTail = true
        result.skipUnusedFinalForward = true
        result.valueOnlySamplerThreshold = true
        result.deviceSamplerDraw = true
        result.boundedOutputQueue = true
        result.responsiveGovernor = true
        result.prefixCheckpointTokens = 256
        result.completePromptCheckpoint = true
        result.sharedRoPE = true
        result.fusedRoPE = true
        return result
    }

    /// Candidate for eventual automatic selection after combined acceptance.
    /// Public/environment defaults remain unchanged until that gate passes.
    /// Explicit experimental controls and diagnostics can still qualify a new
    /// platform; the kernel's initialization and shape fallbacks also apply.
    package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
        var result = integrationCandidate
        result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
        return result
    }

    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
        try resolving(environment: env, defaults: Self())
    }

    /// Apply explicit overrides to a selected default family. Keeping this
    /// separate lets deployment qualify the actual resolution path while the
    /// public default and the explicit reference initializer remain unchanged.
    package static func resolving(environment env: [String: String], defaults: Self) throws -> Self {
        var result = defaults
        var recognized = Set<String>()
        func flag(_ name: String, fallback: Bool) throws -> Bool {
            recognized.insert(name)
            guard let value = env[name] else { return fallback }
            guard value == "0" || value == "1" else {
                throw ModelError("\(name) must be 0 or 1")
            }
            return value == "1"
        }
        result.compactStateWindows = try flag("SLOTSTREAM_OPT_COMPACT_STATE", fallback: result.compactStateWindows)
        result.completePromptCheckpoint = try flag("SLOTSTREAM_OPT_COMPLETE_PROMPT", fallback: result.completePromptCheckpoint)
        result.compactMTPRow = try flag("SLOTSTREAM_OPT_COMPACT_MTP", fallback: result.compactMTPRow)
        result.skipUnusedFinalForward = try flag("SLOTSTREAM_OPT_FINAL_FORWARD", fallback: result.skipUnusedFinalForward)
        result.tailAwarePrefill = try flag("SLOTSTREAM_OPT_TAIL_SCHEDULE", fallback: result.tailAwarePrefill)
        result.demandedPrefillOutput = try flag("SLOTSTREAM_OPT_OUTPUT_DEMAND", fallback: result.demandedPrefillOutput)
        result.terminalPrefillPruning = try flag("SLOTSTREAM_OPT_TERMINAL_PREFILL", fallback: result.terminalPrefillPruning)
        result.terminalLastQuery = try flag("SLOTSTREAM_OPT_TERMINAL_QUERY", fallback: result.terminalLastQuery)
        guard !result.terminalLastQuery || result.terminalPrefillPruning else {
            throw ModelError("TERMINAL_QUERY requires TERMINAL_PREFILL")
        }
        result.compactNgramRows = try flag("SLOTSTREAM_OPT_NGRAM_ROWS", fallback: result.compactNgramRows)
        result.incrementalIndexer = try flag("SLOTSTREAM_OPT_INDEXER_BLOCKS", fallback: result.incrementalIndexer)
        result.compactIndexerRaw = try flag("SLOTSTREAM_OPT_INDEXER_RAW", fallback: result.compactIndexerRaw)
        guard !result.compactIndexerRaw || result.incrementalIndexer else {
            throw ModelError("INDEXER_RAW requires INDEXER_BLOCKS")
        }
        result.valueOnlySamplerThreshold = try flag("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", fallback: result.valueOnlySamplerThreshold)
        result.deviceSamplerDraw = try flag("SLOTSTREAM_OPT_SAMPLER_DRAW", fallback: result.deviceSamplerDraw)
        result.disjointSweepOutput = try flag("SLOTSTREAM_OPT_SWEEP_PLACEMENT", fallback: result.disjointSweepOutput)
        result.boundedSweepRows = try flag("SLOTSTREAM_OPT_SWEEP_TILES", fallback: result.boundedSweepRows)
        result.boundedIndexer = try flag("SLOTSTREAM_OPT_INDEXER_TILES", fallback: result.boundedIndexer)
        result.sharedRoPE = try flag("SLOTSTREAM_OPT_SHARED_ROPE", fallback: result.sharedRoPE)
        result.fusedRoPE = try flag("SLOTSTREAM_OPT_FUSED_ROPE", fallback: result.fusedRoPE)
        result.fusedGDNProjection = try flag("SLOTSTREAM_OPT_GDN_PROJECTION", fallback: result.fusedGDNProjection)
        result.fusedGDNRecording = try flag("SLOTSTREAM_OPT_GDN_RECORD", fallback: result.fusedGDNRecording)
        result.boundedPLE = try flag("SLOTSTREAM_OPT_PLE_TILES", fallback: result.boundedPLE)
        result.ngramLookahead = try flag("SLOTSTREAM_OPT_NGRAM_LOOKAHEAD", fallback: result.ngramLookahead)
        result.layerExpertWorkspace = try flag("SLOTSTREAM_OPT_LAYER_WORKSPACE", fallback: result.layerExpertWorkspace)
        result.reuseFirstMTPEntry = try flag("SLOTSTREAM_OPT_MTP_FIRST_ENTRY", fallback: result.reuseFirstMTPEntry)
        result.boundedDraftTail = try flag("SLOTSTREAM_OPT_MTP_TAIL", fallback: result.boundedDraftTail)
        result.adaptiveSpeculation = try flag("SLOTSTREAM_OPT_ADAPTIVE_MTP", fallback: result.adaptiveSpeculation)
        result.resolvedRuntimeBudget = try flag("SLOTSTREAM_OPT_RUNTIME_BUDGET", fallback: result.resolvedRuntimeBudget)
        result.layerLocalFloorCache = try flag("SLOTSTREAM_OPT_FLOOR_CACHE", fallback: result.layerLocalFloorCache)
        result.boundedOutputQueue = try flag("SLOTSTREAM_OPT_OUTPUT_QUEUE", fallback: result.boundedOutputQueue)
        result.responsiveGovernor = try flag("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", fallback: result.responsiveGovernor)
        result.routerTopK = try flag("SLOTSTREAM_OPT_ROUTER_TOPK", fallback: result.routerTopK)
        result.denseIndexerBypass = try flag("SLOTSTREAM_OPT_INDEXER_DENSE", fallback: result.denseIndexerBypass)
        result.indexerBlockTopK = try flag("SLOTSTREAM_OPT_INDEXER_TOPK", fallback: result.indexerBlockTopK)
        result.overlapSharedExpert = try flag("SLOTSTREAM_OPT_SHARED_OVERLAP", fallback: result.overlapSharedExpert)
        result.overlapResidentExperts = try flag("SLOTSTREAM_OPT_RESIDENT_OVERLAP", fallback: result.overlapResidentExperts)
        result.deduplicateImages = try flag("SLOTSTREAM_OPT_IMAGE_REUSE", fallback: result.deduplicateImages)
        result.directReadHandles = try flag("SLOTSTREAM_OPT_READ_HANDLES", fallback: result.directReadHandles)
        result.compiledNormFinish = try flag("SLOTSTREAM_OPT_COMPILED_NORM", fallback: result.compiledNormFinish)
        result.selectedTextAttention = try flag("SLOTSTREAM_OPT_SELECTED_ATTENTION", fallback: result.selectedTextAttention)
        result.ngramRingOrder = try flag("SLOTSTREAM_OPT_NGRAM_RING", fallback: result.ngramRingOrder)
        result.denseExpertLookup = try flag("SLOTSTREAM_OPT_EXPERT_MAP", fallback: result.denseExpertLookup)
        result.sparsePoolPins = try flag("SLOTSTREAM_OPT_POOL_PINS", fallback: result.sparsePoolPins)
        result.contiguousSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_SLICES", fallback: result.contiguousSlotWrites)
        result.wordSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_WORDS", fallback: result.wordSlotWrites)
        result.cpuSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_CPU", fallback: result.cpuSlotWrites)
        guard !result.cpuSlotWrites || (!result.wordSlotWrites && !result.contiguousSlotWrites) else {
            throw ModelError("SLOT_CPU cannot be combined with SLOT_WORDS or SLOT_SLICES")
        }
        let checkpointKey = "SLOTSTREAM_OPT_PREFIX_CHECKPOINT"
        recognized.insert(checkpointKey)
        if let value = env[checkpointKey] {
            guard let n = Int(value), [0, 256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(checkpointKey) must be 0, 256, 512, 1024, 2048 or 4096")
            }
            result.prefixCheckpointTokens = n
        }
        result.cachedRouterWeights = try flag("SLOTSTREAM_OPT_ROUTER_WEIGHTS", fallback: result.cachedRouterWeights)
        let visionPaddingKey = "SLOTSTREAM_OPT_VISION_PADDING"
        recognized.insert(visionPaddingKey)
        if let value = env[visionPaddingKey] {
            guard let n = Int(value), [0, 80, 128].contains(n) else {
                throw ModelError("\(visionPaddingKey) must be 0, 80 or 128")
            }
            result.visionAttentionPadding = n
        }
        let visionTileKey = "SLOTSTREAM_OPT_VISION_QUERY_TILE"
        recognized.insert(visionTileKey)
        if let value = env[visionTileKey] {
            guard let n = Int(value), [0, 256].contains(n) else {
                throw ModelError("\(visionTileKey) must be 0 or 256")
            }
            result.visionQueryTile = n
        }
        guard result.visionQueryTile == 0 || result.visionAttentionPadding == 0 else {
            throw ModelError("VISION_QUERY_TILE and VISION_PADDING are independent candidates")
        }
        result.compactScopeFrontier = try flag("SLOTSTREAM_OPT_SCOPE_FRONTIER", fallback: result.compactScopeFrontier)
        result.workspacePiecewiseWrites = try flag("SLOTSTREAM_OPT_WORKSPACE_PIECES", fallback: result.workspacePiecewiseWrites)
        let tileKey = "SLOTSTREAM_OPT_WORKSPACE_TILE"
        recognized.insert(tileKey)
        if let value = env[tileKey] {
            guard let n = Int(value), [256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(tileKey) must be 256, 512, 1024, 2048 or 4096")
            }
            result.workspaceTokenTile = n
        }
        let scopeKey = "SLOTSTREAM_OPT_READ_SCOPE"
        recognized.insert(scopeKey)
        if let value = env[scopeKey] {
            guard let n = Int(value), [0, 1024, 4096, 8192].contains(n) else {
                throw ModelError("\(scopeKey) must be 0, 1024, 4096 or 8192")
            }
            result.readScopeTokens = n
        }
        guard result.readScopeTokens == 0 || result.readScopeEnabled else {
            throw ModelError("read scopes require LAYER_WORKSPACE, COMPACT_STATE, COMPACT_MTP, INDEXER_TILES and PLE_TILES")
        }
        let unknown = env.keys.filter { $0.hasPrefix("SLOTSTREAM_OPT_") && !recognized.contains($0) }.sorted()
        guard unknown.isEmpty else { throw ModelError("unknown optimization controls: \(unknown.joined(separator: ", "))") }
        return result
    }
}

````````````

## Artifact SHA-256 512dd096a194f8c56f1d9be16931714035150ca54cbb02cbbb9d0aec5871657d

Encoding: `utf-8`. Original bytes: 22051.

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
            var sampledWork: [String: [Int]] = [:]
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
            c.equal("\(candidate): bounded greedy tail selection", model.optimizations.boundedDraftTail, candidate)
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
                    if mtp {
                        let work = [first.1.draftedTokens, first.1.verifyPasses,
                            first.1.decodeModelTokens, first.1.decodeForwardPasses]
                        let repeatWork = [repeatRun.1.draftedTokens, repeatRun.1.verifyPasses,
                            repeatRun.1.decodeModelTokens, repeatRun.1.decodeForwardPasses]
                        c.equal("\(candidate)/\(label): sampled replay keeps verification work", repeatWork, work)
                        results.sampledWork[label] = work
                        if let expected {
                            c.equal("\(label): integrated sampled verification work matches reference",
                                work, expected.sampledWork[label] ?? [])
                        }
                    }
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
            if mtp {
                var two = params; two.maxTokens = 2
                let terminal = generator.generate(promptIds: short, params: two, eosIds: [])
                c.expect("\(candidate): two-token MTP request completes",
                    terminal.1.runtimeError == nil && terminal.0.count == 2)
                c.equal("\(candidate): two-token MTP releases pins", model.pool.pinnedSlotCount, 0)
                c.equal("\(candidate): terminal draft work is explicit", terminal.1.draftedTokens, candidate ? 0 : 1)
                c.equal("\(candidate): terminal target work is explicit", terminal.1.decodeModelTokens, candidate ? 1 : 2)
                c.equal("\(candidate): terminal verification executes once", terminal.1.verifyPasses, 1)
                c.equal("\(candidate): terminal forward executes once", terminal.1.decodeForwardPasses, 1)
                c.equal("\(candidate): bounded output preserves the longer greedy prefix",
                    terminal.0, Array((results.outputs["cached17"] ?? []).prefix(2)))
                results.outputs["mtp-two-output"] = terminal.0
                if let expected {
                    c.equal("two-token MTP integrated output matches reference",
                        terminal.0, expected.outputs["mtp-two-output"] ?? [])
                }
            }
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

## Artifact SHA-256 f0bba52fb1f9fbea0dca0c5d59634831293ca0088c1ccd15d7dd5bdd4dc07198

Encoding: `utf-8`. Original bytes: 18364.

````````````text
// Process and cache safety invariants that are otherwise only observable
// during a 100+ GB model run. Weights-free on purpose: these are the rules a
// long run depends on, checked in milliseconds on every push.

import Foundation
import Slotstream

extension Diagnostics {
    public static func runtime() throws -> CheckReport {
        var c = CheckBuilder("runtime-check")

        if let before = ProcessMemory.vmActivity(), let after = ProcessMemory.vmActivity() {
            c.expect("request VM counters are monotonic", after.swapins >= before.swapins && after.swapouts >= before.swapouts)
            c.expect("request VM reclaimable bytes are available", before.reclaimableBytes > 0)
        } else { c.expect("request VM counters are available", false) }
        c.expect("process physical footprint is readable", ProcessMemory.residentBytes() > 0)
        c.expect("process RSS high-water is readable", ProcessMemory.peakResidentBytes() > 0)
        c.expect("lifetime RSS is separately readable", ProcessMemory.lifetimeRSSPeakBytes() > 0)
        let start = RuntimeClock.now()
        c.expect("monotonic duration is nonnegative", RuntimeClock.seconds(since: start) >= 0)
        let sampler = FootprintSampler()
        let observed = sampler.finish()
        c.expect("footprint sampler includes endpoints", observed.samples >= 2 && observed.peakBytes > 0)
        c.equal("reference optimization defaults", try InferenceOptimizations.environment([:]), InferenceOptimizations())
        let qualified = OptimizationPlatform(machineModel: "Mac17,9", chip: "Apple M5 Pro",
            osBuild: "25G83", nativeARM64: true)
        c.equal("qualified platform keeps the complete joint candidate",
            InferenceOptimizations.deploymentCandidate(on: qualified), .integrationCandidate)
        var fallback = InferenceOptimizations.integrationCandidate
        fallback.fusedRoPE = false
        let unknownPlatforms: [OptimizationPlatform] = [
            .init(machineModel: nil, chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: nil, osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: nil, nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: false),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "23A344", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "24A335", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G84", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "26A1", nativeARM64: true),
            .init(machineModel: "Mac14,6", chip: "Apple M2 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,10", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro extra", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "", chip: "", osBuild: "", nativeARM64: true),
        ]
        for (i, platform) in unknownPlatforms.enumerated() {
            c.equal("unqualified platform \(i) keeps portable work and original rotation",
                InferenceOptimizations.deploymentCandidate(on: platform), fallback)
        }
        c.equal("platform selection is deterministic", OptimizationPlatform.current, OptimizationPlatform.current)
        c.expect("explicit kernel qualification remains available",
            try InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "1"]).fusedRoPE)
        c.expect("explicit kernel fallback remains available",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "0"]).fusedRoPE)
        let candidate = InferenceOptimizations.integrationCandidate
        c.equal("absent overrides retain the selected default family",
            try InferenceOptimizations.resolving(environment: [:], defaults: candidate), candidate)
        let candidateFlags: [(String, WritableKeyPath<InferenceOptimizations, Bool>)] = [
            ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
            ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
            ("SLOTSTREAM_OPT_NGRAM_ROWS", \.compactNgramRows),
            ("SLOTSTREAM_OPT_MTP_TAIL", \.boundedDraftTail),
            ("SLOTSTREAM_OPT_FINAL_FORWARD", \.skipUnusedFinalForward),
            ("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", \.valueOnlySamplerThreshold),
            ("SLOTSTREAM_OPT_SAMPLER_DRAW", \.deviceSamplerDraw),
            ("SLOTSTREAM_OPT_OUTPUT_QUEUE", \.boundedOutputQueue),
            ("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", \.responsiveGovernor),
            ("SLOTSTREAM_OPT_COMPLETE_PROMPT", \.completePromptCheckpoint),
            ("SLOTSTREAM_OPT_SHARED_ROPE", \.sharedRoPE),
            ("SLOTSTREAM_OPT_FUSED_ROPE", \.fusedRoPE),
        ]
        for (name, field) in candidateFlags {
            var disabled = candidate
            disabled[keyPath: field] = false
            c.equal("explicit zero disables only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "0"], defaults: candidate), disabled)
            c.equal("explicit one restores only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "1"], defaults: disabled), candidate)
        }
        var referenceOverrides = Dictionary(uniqueKeysWithValues: candidateFlags.map { ($0.0, "0") })
        referenceOverrides["SLOTSTREAM_OPT_PREFIX_CHECKPOINT"] = "0"
        c.equal("explicit zeros restore the complete reference inference family",
            try InferenceOptimizations.resolving(environment: referenceOverrides, defaults: candidate),
            InferenceOptimizations())
        var noCheckpoint = candidate
        noCheckpoint.prefixCheckpointTokens = 0
        c.equal("explicit numeric zero disables inherited prefix retention",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0"],
                defaults: candidate), noCheckpoint)
        c.equal("non-optimization environment leaves the family intact",
            try InferenceOptimizations.resolving(environment: ["PATH": "/unused"], defaults: candidate), candidate)
        for env in [["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"], ["SLOTSTREAM_OPT_TYPO": "0"]] {
            do {
                _ = try InferenceOptimizations.resolving(environment: env, defaults: candidate)
                c.expect("selected defaults still reject invalid override \(env)", false)
            } catch { c.expect("selected defaults still reject invalid override \(env)", true) }
        }
        var scopedDefaults = candidate
        scopedDefaults.readScopeTokens = 4096
        scopedDefaults.layerExpertWorkspace = true
        scopedDefaults.boundedIndexer = true
        scopedDefaults.boundedPLE = true
        c.equal("valid inherited read scope retains its prerequisites",
            try InferenceOptimizations.resolving(environment: [:], defaults: scopedDefaults), scopedDefaults)
        for name in ["SLOTSTREAM_OPT_COMPACT_STATE", "SLOTSTREAM_OPT_COMPACT_MTP",
                     "SLOTSTREAM_OPT_LAYER_WORKSPACE", "SLOTSTREAM_OPT_INDEXER_TILES", "SLOTSTREAM_OPT_PLE_TILES"] {
            do {
                _ = try InferenceOptimizations.resolving(environment: [name: "0"], defaults: scopedDefaults)
                c.expect("inherited scope rejects disabled prerequisite \(name)", false)
            } catch { c.expect("inherited scope rejects disabled prerequisite \(name)", true) }
        }
        scopedDefaults.readScopeTokens = 0
        c.equal("scope can be disabled while retaining its other independent work",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_READ_SCOPE": "0"],
                defaults: {
                    var value = scopedDefaults; value.readScopeTokens = 4096; return value
                }()), scopedDefaults)
        let environmentFunction: ([String: String]) throws -> InferenceOptimizations = InferenceOptimizations.environment
        c.equal("public environment function value keeps its signature and reference default",
            try environmentFunction([:]), InferenceOptimizations())
        c.expect("typed override enables compaction", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_COMPACT_STATE": "1"]).compactStateWindows)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPACT_STATE": "yes"])
            c.expect("malformed override refused", false)
        } catch { c.expect("malformed override refused", true) }

        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_TYPO": "1"])
            c.expect("unknown optimization refused", false)
        } catch { c.expect("unknown optimization refused", true) }

        for value in ["-1", "1", "16384", "bad"] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": value])
                c.expect("invalid read scope \(value) refused", false)
            } catch { c.expect("invalid read scope \(value) refused", true) }
        }
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": "8192"])
            c.expect("unbounded read scope refused", false)
        } catch { c.expect("unbounded read scope refused", true) }

        c.equal("explicit workspace tile is recorded", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"]).workspaceTokenTile, 2048)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_WORKSPACE_TILE": "8192"])
            c.expect("unbounded workspace tile refused", false)
        } catch { c.expect("unbounded workspace tile refused", true) }

        c.equal("terminal output needs no speculative draft", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 1, bounded: true), 0)
        c.equal("draft count fits remaining output", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 3, bounded: true), 2)
        c.equal("public depth cannot exceed recording cap", Generator.effectiveDraftDepth(requested: Int.max, remainingOutputs: Int.max, bounded: false), 16)
        c.equal("negative remaining output cannot underflow", Generator.effectiveDraftDepth(requested: Int.min, remainingOutputs: Int.min, bounded: true), 0)

        // The prefix cache holds four conversations, not one: Open WebUI's
        // interleaved title request defeated a single slot.
        // Logical cache fixtures are never forwarded through the model, but
        // still declare exactly the number of represented token IDs.
        func fixture(_ count: Int) -> Qwen4ExpModel.State {
            let state = Qwen4ExpModel.State(); state.tokenCount = count; return state
        }
        let cache = PrefixCache(maxTokens: 100)
        for token in 1 ... PrefixCache.maxEntries {
            cache.store(state: fixture(1), tokens: [token])
        }
        c.equal(
            "prefix cache reaches its four-entry bound",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        cache.store(state: fixture(1), tokens: [PrefixCache.maxEntries])
        c.equal(
            "an identical history replaces instead of duplicating an entry",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        _ = cache.take(matching: [999], reserveTokens: 1)
        c.equal(
            "a miss evicts before allocating a fifth state",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries - 1)
        cache.configure(maxTokens: 2)
        c.expect("a smaller live token ceiling evicts immediately", cache.heldTokens <= 2)
        c.expect("held GB includes fixed recurrent state", cache.heldGB > 0.1)
        let growth = PrefixCache(maxTokens: 20)
        growth.store(state: fixture(4), tokens: [1, 2, 3, 4])
        growth.store(state: fixture(4), tokens: [7, 8, 9, 10])
        growth.store(state: fixture(4), tokens: [11, 12, 13, 14])
        c.expect("growing hit still reuses its state", growth.take(matching: [1, 2, 3, 4, 5], reserveTokens: 17) != nil)
        c.equal("growing hit reserves future state before allocation", growth.heldTokens, 0)
        growth.store(state: fixture(1), tokens: [4])
        c.expect("huge reservation safely misses", growth.take(matching: [9], reserveTokens: Int.max) == nil)
        c.equal("huge reservation releases held state", growth.heldTokens, 0)

        let capacity = PrefixCache(maxTokens: 4096)
        for token in 1 ... 4 { capacity.store(state: fixture(1), tokens: [token]) }
        c.expect("capacity reservation still hits", capacity.take(matching: [1, 2], reserveTokens: 2,
            reserveSequenceBytes: 4096 * PrefixCache.bytesPerToken) != nil)
        c.equal("capacity growth reserves bytes before reuse", capacity.heldTokens, 0)
        capacity.store(state: fixture(1), tokens: [7])
        _ = capacity.take(matching: [9], reserveSequenceBytes: Int.max)
        c.equal("saturated byte reservation evicts safely", capacity.heldTokens, 0)

        // Image keying. Every image expands to a run of the same placeholder
        // id, so ids alone cannot tell two pictures apart; the digest can, and
        // a match has to agree in both directions.
        let a = ImageHash(hashing: Data("picture A".utf8))
        let b = ImageHash(hashing: Data("picture B".utf8))
        c.expect("identical bytes hash alike", a == ImageHash(hashing: Data("picture A".utf8)))
        c.expect("different bytes do not", a != b)
        let held = [ImageSegment(start: 4, count: 8, hash: a)]
        c.expect(
            "the same image at the same offset matches",
            PrefixCache.imagesAgree(entry: held, prompt: held, upTo: 12))
        c.expect(
            "a swapped image does not",
            !PrefixCache.imagesAgree(
                entry: held, prompt: [ImageSegment(start: 4, count: 8, hash: b)], upTo: 12))
        c.expect(
            "an entry ending inside a run still matches that run",
            PrefixCache.imagesAgree(
                entry: [ImageSegment(start: 4, count: 3, hash: a)], prompt: held, upTo: 7))
        c.expect(
            "a text-only entry rejects a prompt with an image inside its range",
            !PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 12))
        c.expect(
            "an image beyond the entry's range is irrelevant to the match",
            PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 4))

        let vcache = PrefixCache(maxTokens: 100)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "a vision conversation is held, not discarded",
            vcache.take(matching: [1, 2, 3, 4], images: held, reserveTokens: 4) != nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the same ids with a different picture miss",
            vcache.take(
                matching: [1, 2, 3, 4], images: [ImageSegment(start: 4, count: 8, hash: b)],
                reserveTokens: 4) == nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the text-only splice never sees a vision entry",
            vcache.peek(extending: [1, 2]) == nil)

        // A client can re-render an assistant turn differently from the exact
        // ids the server generated (fx omits reasoning when it sends history
        // back). `peek` finds the longest retained extension for the splice,
        // but does not consume it before the ordinary cache match.
        let spliceCache = PrefixCache(maxTokens: 100)
        spliceCache.store(state: fixture(3), tokens: [7, 8, 9])
        spliceCache.store(state: fixture(4), tokens: [7, 8, 9, 10])
        c.equal(
            "prefix splice chooses the longest retained extension",
            spliceCache.peek(extending: [7, 8]), [7, 8, 9, 10])
        c.expect(
            "prefix splice is strict, not an identical-history match",
            spliceCache.peek(extending: [7, 8, 9, 10]) == nil)
        c.equal(
            "prefix splice lookup does not consume the retained state",
            spliceCache.take(matching: [7, 8, 9, 10, 11])?.reused, 4)
        spliceCache.enabled = false
        c.expect(
            "a disabled prefix cache offers no splice",
            spliceCache.peek(extending: [7]) == nil)

        // Weights behind a symlink: Foundation refuses to list the link itself,
        // so the index must resolve it first (it did not, before 0.2.1).
        let tmp = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-runtime-check-\(getpid())")
        let real = tmp.appendingPathComponent("real")
        let link = tmp.appendingPathComponent("link")
        try FileManager.default.createDirectory(at: real, withIntermediateDirectories: true)
        FileManager.default.createFile(
            atPath: real.appendingPathComponent("model-00001-of-00001.safetensors").path,
            contents: Data())
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: real)
        defer { try? FileManager.default.removeItem(at: tmp) }
        c.equal(
            "shard listing works through a symlinked model dir",
            (try? CheckpointIndex.shardFiles(in: link))?.count, 1)

        // The memory promise: a plan never expects to peak past its target.
        for target in [Planner.minMemoryGB, 10, 16, 30] where target >= Planner.minMemoryGB {
            let p = try Planner.plan(
                expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: 64, workingSetGB: 64, availableGB: 64)
            c.expect(
                "\(target) GB plan stays inside its target",
                p.expectedPeakGB <= target + 0.01,
                "expected peak \(p.expectedPeakGB) GB")
            c.measure("peak_gb_at_\(Int(target))", p.expectedPeakGB)
        }
        return c.report()
    }
}

````````````

## Artifact SHA-256 0ef3216055f57d8adfbc91ae9a28cbefd1ba45b1b08f86502363b6f5329cb494

Encoding: `utf-8`. Original bytes: 14208.

````````````text
import Foundation

/// Independent controls retained while each candidate is qualified. Defaults
/// stay on the reference implementation until its acceptance gates pass.
public struct InferenceOptimizations: Codable, Equatable {
    public var compactStateWindows = false
    public var compactMTPRow = false
    public var skipUnusedFinalForward = false
    public var tailAwarePrefill = false
    public var demandedPrefillOutput = false
    public var terminalPrefillPruning = false
    /// Independent final-QSA output reduction; a 64-row tail retains matrix
    /// dispatch for attention/output/HC, and shorter passes keep every row.
    /// Requires terminal prefill demand.
    package static let terminalQueryTile = 64
    public var terminalLastQuery = false
    public var compactNgramRows = false
    public var incrementalIndexer = false
    public var compactIndexerRaw = false
    public var valueOnlySamplerThreshold = false
    public var deviceSamplerDraw = false
    public var disjointSweepOutput = false
    public var boundedSweepRows = false
    public var boundedIndexer = false
    public var sharedRoPE = false
    public var fusedRoPE = false
    /// Requires the optional shared-backing layout at model construction.
    public var fusedGDNProjection = false
    public var fusedGDNRecording = false
    public var boundedPLE = false
    public var ngramLookahead = false
    public var layerExpertWorkspace = false
    public var workspaceTokenTile = 256
    public var compactScopeFrontier = false
    public var workspacePiecewiseWrites = false
    /// Experimental bounded layer-major scope; zero keeps chronological passes.
    public var readScopeTokens = 0
    public var reuseFirstMTPEntry = false
    /// Greedy-only optional shortening; sampled requests retain their original
    /// verification shapes. Independent context bounds always apply.
    public var boundedDraftTail = false
    public var adaptiveSpeculation = false
    public var resolvedRuntimeBudget = false
    public var layerLocalFloorCache = false
    public var boundedOutputQueue = false
    public var responsiveGovernor = false
    public var routerTopK = false
    public var denseIndexerBypass = false
    public var indexerBlockTopK = false
    public var overlapSharedExpert = false
    public var overlapResidentExperts = false
    public var deduplicateImages = false
    public var visionAttentionPadding = 0
    /// Independent, bounded original-attention path. Qualification pending.
    public var visionQueryTile = 0
    public var cachedRouterWeights = false
    public var directReadHandles = false
    public var compiledNormFinish = false
    public var selectedTextAttention = false
    public var ngramRingOrder = false
    public var denseExpertLookup = false
    public var sparsePoolPins = false
    public var contiguousSlotWrites = false
    public var wordSlotWrites = false
    public var cpuSlotWrites = false
    /// Exact already-scheduled commit boundary; zero disables common-prefix retention.
    public var prefixCheckpointTokens = 0
    /// Retain the complete committed prompt and its raw last logits. This is
    /// independently qualified before joining integrationCandidate.
    public var completePromptCheckpoint = false

    public var readScopeEnabled: Bool {
        readScopeTokens > 0 && layerExpertWorkspace && compactStateWindows
            && compactMTPRow && boundedIndexer && boundedPLE
    }

    public init() {}

    /// The next joint qualification candidate. Explicit selection only; this
    /// does not change public initializer or environment defaults. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
        result.compactNgramRows = true
        result.skipUnusedFinalForward = true
        result.valueOnlySamplerThreshold = true
        result.deviceSamplerDraw = true
        result.boundedOutputQueue = true
        result.responsiveGovernor = true
        result.prefixCheckpointTokens = 256
        result.completePromptCheckpoint = true
        result.sharedRoPE = true
        result.fusedRoPE = true
        return result
    }

    /// Candidate for eventual automatic selection after combined acceptance.
    /// Public/environment defaults remain unchanged until that gate passes.
    /// Explicit experimental controls and diagnostics can still qualify a new
    /// platform; the kernel's initialization and shape fallbacks also apply.
    package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
        var result = integrationCandidate
        result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
        return result
    }

    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
        try resolving(environment: env, defaults: Self())
    }

    /// Apply explicit overrides to a selected default family. Keeping this
    /// separate lets deployment qualify the actual resolution path while the
    /// public default and the explicit reference initializer remain unchanged.
    package static func resolving(environment env: [String: String], defaults: Self) throws -> Self {
        var result = defaults
        var recognized = Set<String>()
        func flag(_ name: String, fallback: Bool) throws -> Bool {
            recognized.insert(name)
            guard let value = env[name] else { return fallback }
            guard value == "0" || value == "1" else {
                throw ModelError("\(name) must be 0 or 1")
            }
            return value == "1"
        }
        result.compactStateWindows = try flag("SLOTSTREAM_OPT_COMPACT_STATE", fallback: result.compactStateWindows)
        result.completePromptCheckpoint = try flag("SLOTSTREAM_OPT_COMPLETE_PROMPT", fallback: result.completePromptCheckpoint)
        result.compactMTPRow = try flag("SLOTSTREAM_OPT_COMPACT_MTP", fallback: result.compactMTPRow)
        result.skipUnusedFinalForward = try flag("SLOTSTREAM_OPT_FINAL_FORWARD", fallback: result.skipUnusedFinalForward)
        result.tailAwarePrefill = try flag("SLOTSTREAM_OPT_TAIL_SCHEDULE", fallback: result.tailAwarePrefill)
        result.demandedPrefillOutput = try flag("SLOTSTREAM_OPT_OUTPUT_DEMAND", fallback: result.demandedPrefillOutput)
        result.terminalPrefillPruning = try flag("SLOTSTREAM_OPT_TERMINAL_PREFILL", fallback: result.terminalPrefillPruning)
        result.terminalLastQuery = try flag("SLOTSTREAM_OPT_TERMINAL_QUERY", fallback: result.terminalLastQuery)
        guard !result.terminalLastQuery || result.terminalPrefillPruning else {
            throw ModelError("TERMINAL_QUERY requires TERMINAL_PREFILL")
        }
        result.compactNgramRows = try flag("SLOTSTREAM_OPT_NGRAM_ROWS", fallback: result.compactNgramRows)
        result.incrementalIndexer = try flag("SLOTSTREAM_OPT_INDEXER_BLOCKS", fallback: result.incrementalIndexer)
        result.compactIndexerRaw = try flag("SLOTSTREAM_OPT_INDEXER_RAW", fallback: result.compactIndexerRaw)
        guard !result.compactIndexerRaw || result.incrementalIndexer else {
            throw ModelError("INDEXER_RAW requires INDEXER_BLOCKS")
        }
        result.valueOnlySamplerThreshold = try flag("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", fallback: result.valueOnlySamplerThreshold)
        result.deviceSamplerDraw = try flag("SLOTSTREAM_OPT_SAMPLER_DRAW", fallback: result.deviceSamplerDraw)
        result.disjointSweepOutput = try flag("SLOTSTREAM_OPT_SWEEP_PLACEMENT", fallback: result.disjointSweepOutput)
        result.boundedSweepRows = try flag("SLOTSTREAM_OPT_SWEEP_TILES", fallback: result.boundedSweepRows)
        result.boundedIndexer = try flag("SLOTSTREAM_OPT_INDEXER_TILES", fallback: result.boundedIndexer)
        result.sharedRoPE = try flag("SLOTSTREAM_OPT_SHARED_ROPE", fallback: result.sharedRoPE)
        result.fusedRoPE = try flag("SLOTSTREAM_OPT_FUSED_ROPE", fallback: result.fusedRoPE)
        result.fusedGDNProjection = try flag("SLOTSTREAM_OPT_GDN_PROJECTION", fallback: result.fusedGDNProjection)
        result.fusedGDNRecording = try flag("SLOTSTREAM_OPT_GDN_RECORD", fallback: result.fusedGDNRecording)
        result.boundedPLE = try flag("SLOTSTREAM_OPT_PLE_TILES", fallback: result.boundedPLE)
        result.ngramLookahead = try flag("SLOTSTREAM_OPT_NGRAM_LOOKAHEAD", fallback: result.ngramLookahead)
        result.layerExpertWorkspace = try flag("SLOTSTREAM_OPT_LAYER_WORKSPACE", fallback: result.layerExpertWorkspace)
        result.reuseFirstMTPEntry = try flag("SLOTSTREAM_OPT_MTP_FIRST_ENTRY", fallback: result.reuseFirstMTPEntry)
        result.boundedDraftTail = try flag("SLOTSTREAM_OPT_MTP_TAIL", fallback: result.boundedDraftTail)
        result.adaptiveSpeculation = try flag("SLOTSTREAM_OPT_ADAPTIVE_MTP", fallback: result.adaptiveSpeculation)
        result.resolvedRuntimeBudget = try flag("SLOTSTREAM_OPT_RUNTIME_BUDGET", fallback: result.resolvedRuntimeBudget)
        result.layerLocalFloorCache = try flag("SLOTSTREAM_OPT_FLOOR_CACHE", fallback: result.layerLocalFloorCache)
        result.boundedOutputQueue = try flag("SLOTSTREAM_OPT_OUTPUT_QUEUE", fallback: result.boundedOutputQueue)
        result.responsiveGovernor = try flag("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", fallback: result.responsiveGovernor)
        result.routerTopK = try flag("SLOTSTREAM_OPT_ROUTER_TOPK", fallback: result.routerTopK)
        result.denseIndexerBypass = try flag("SLOTSTREAM_OPT_INDEXER_DENSE", fallback: result.denseIndexerBypass)
        result.indexerBlockTopK = try flag("SLOTSTREAM_OPT_INDEXER_TOPK", fallback: result.indexerBlockTopK)
        result.overlapSharedExpert = try flag("SLOTSTREAM_OPT_SHARED_OVERLAP", fallback: result.overlapSharedExpert)
        result.overlapResidentExperts = try flag("SLOTSTREAM_OPT_RESIDENT_OVERLAP", fallback: result.overlapResidentExperts)
        result.deduplicateImages = try flag("SLOTSTREAM_OPT_IMAGE_REUSE", fallback: result.deduplicateImages)
        result.directReadHandles = try flag("SLOTSTREAM_OPT_READ_HANDLES", fallback: result.directReadHandles)
        result.compiledNormFinish = try flag("SLOTSTREAM_OPT_COMPILED_NORM", fallback: result.compiledNormFinish)
        result.selectedTextAttention = try flag("SLOTSTREAM_OPT_SELECTED_ATTENTION", fallback: result.selectedTextAttention)
        result.ngramRingOrder = try flag("SLOTSTREAM_OPT_NGRAM_RING", fallback: result.ngramRingOrder)
        result.denseExpertLookup = try flag("SLOTSTREAM_OPT_EXPERT_MAP", fallback: result.denseExpertLookup)
        result.sparsePoolPins = try flag("SLOTSTREAM_OPT_POOL_PINS", fallback: result.sparsePoolPins)
        result.contiguousSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_SLICES", fallback: result.contiguousSlotWrites)
        result.wordSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_WORDS", fallback: result.wordSlotWrites)
        result.cpuSlotWrites = try flag("SLOTSTREAM_OPT_SLOT_CPU", fallback: result.cpuSlotWrites)
        guard !result.cpuSlotWrites || (!result.wordSlotWrites && !result.contiguousSlotWrites) else {
            throw ModelError("SLOT_CPU cannot be combined with SLOT_WORDS or SLOT_SLICES")
        }
        let checkpointKey = "SLOTSTREAM_OPT_PREFIX_CHECKPOINT"
        recognized.insert(checkpointKey)
        if let value = env[checkpointKey] {
            guard let n = Int(value), [0, 256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(checkpointKey) must be 0, 256, 512, 1024, 2048 or 4096")
            }
            result.prefixCheckpointTokens = n
        }
        result.cachedRouterWeights = try flag("SLOTSTREAM_OPT_ROUTER_WEIGHTS", fallback: result.cachedRouterWeights)
        let visionPaddingKey = "SLOTSTREAM_OPT_VISION_PADDING"
        recognized.insert(visionPaddingKey)
        if let value = env[visionPaddingKey] {
            guard let n = Int(value), [0, 80, 128].contains(n) else {
                throw ModelError("\(visionPaddingKey) must be 0, 80 or 128")
            }
            result.visionAttentionPadding = n
        }
        let visionTileKey = "SLOTSTREAM_OPT_VISION_QUERY_TILE"
        recognized.insert(visionTileKey)
        if let value = env[visionTileKey] {
            guard let n = Int(value), [0, 256].contains(n) else {
                throw ModelError("\(visionTileKey) must be 0 or 256")
            }
            result.visionQueryTile = n
        }
        guard result.visionQueryTile == 0 || result.visionAttentionPadding == 0 else {
            throw ModelError("VISION_QUERY_TILE and VISION_PADDING are independent candidates")
        }
        result.compactScopeFrontier = try flag("SLOTSTREAM_OPT_SCOPE_FRONTIER", fallback: result.compactScopeFrontier)
        result.workspacePiecewiseWrites = try flag("SLOTSTREAM_OPT_WORKSPACE_PIECES", fallback: result.workspacePiecewiseWrites)
        let tileKey = "SLOTSTREAM_OPT_WORKSPACE_TILE"
        recognized.insert(tileKey)
        if let value = env[tileKey] {
            guard let n = Int(value), [256, 512, 1024, 2048, 4096].contains(n) else {
                throw ModelError("\(tileKey) must be 256, 512, 1024, 2048 or 4096")
            }
            result.workspaceTokenTile = n
        }
        let scopeKey = "SLOTSTREAM_OPT_READ_SCOPE"
        recognized.insert(scopeKey)
        if let value = env[scopeKey] {
            guard let n = Int(value), [0, 1024, 4096, 8192].contains(n) else {
                throw ModelError("\(scopeKey) must be 0, 1024, 4096 or 8192")
            }
            result.readScopeTokens = n
        }
        guard result.readScopeTokens == 0 || result.readScopeEnabled else {
            throw ModelError("read scopes require LAYER_WORKSPACE, COMPACT_STATE, COMPACT_MTP, INDEXER_TILES and PLE_TILES")
        }
        let unknown = env.keys.filter { $0.hasPrefix("SLOTSTREAM_OPT_") && !recognized.contains($0) }.sorted()
        guard unknown.isEmpty else { throw ModelError("unknown optimization controls: \(unknown.joined(separator: ", "))") }
        return result
    }
}

````````````

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

## Artifact SHA-256 25baf57d41c3d2df4928f3f3273fbbbb2514a0dab6793fc7619f642c8b293994

Encoding: `utf-8`. Original bytes: 18303.

````````````text
// Process and cache safety invariants that are otherwise only observable
// during a 100+ GB model run. Weights-free on purpose: these are the rules a
// long run depends on, checked in milliseconds on every push.

import Foundation
import Slotstream

extension Diagnostics {
    public static func runtime() throws -> CheckReport {
        var c = CheckBuilder("runtime-check")

        if let before = ProcessMemory.vmActivity(), let after = ProcessMemory.vmActivity() {
            c.expect("request VM counters are monotonic", after.swapins >= before.swapins && after.swapouts >= before.swapouts)
            c.expect("request VM reclaimable bytes are available", before.reclaimableBytes > 0)
        } else { c.expect("request VM counters are available", false) }
        c.expect("process physical footprint is readable", ProcessMemory.residentBytes() > 0)
        c.expect("process RSS high-water is readable", ProcessMemory.peakResidentBytes() > 0)
        c.expect("lifetime RSS is separately readable", ProcessMemory.lifetimeRSSPeakBytes() > 0)
        let start = RuntimeClock.now()
        c.expect("monotonic duration is nonnegative", RuntimeClock.seconds(since: start) >= 0)
        let sampler = FootprintSampler()
        let observed = sampler.finish()
        c.expect("footprint sampler includes endpoints", observed.samples >= 2 && observed.peakBytes > 0)
        c.equal("reference optimization defaults", try InferenceOptimizations.environment([:]), InferenceOptimizations())
        let qualified = OptimizationPlatform(machineModel: "Mac17,9", chip: "Apple M5 Pro",
            osBuild: "25G83", nativeARM64: true)
        c.equal("qualified platform keeps the complete joint candidate",
            InferenceOptimizations.deploymentCandidate(on: qualified), .integrationCandidate)
        var fallback = InferenceOptimizations.integrationCandidate
        fallback.fusedRoPE = false
        let unknownPlatforms: [OptimizationPlatform] = [
            .init(machineModel: nil, chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: nil, osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: nil, nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: false),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "23A344", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "24A335", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "25G84", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro", osBuild: "26A1", nativeARM64: true),
            .init(machineModel: "Mac14,6", chip: "Apple M2 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Max", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,10", chip: "Apple M5 Pro", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "Mac17,9", chip: "Apple M5 Pro extra", osBuild: "25G83", nativeARM64: true),
            .init(machineModel: "", chip: "", osBuild: "", nativeARM64: true),
        ]
        for (i, platform) in unknownPlatforms.enumerated() {
            c.equal("unqualified platform \(i) keeps portable work and original rotation",
                InferenceOptimizations.deploymentCandidate(on: platform), fallback)
        }
        c.equal("platform selection is deterministic", OptimizationPlatform.current, OptimizationPlatform.current)
        c.expect("explicit kernel qualification remains available",
            try InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "1"]).fusedRoPE)
        c.expect("explicit kernel fallback remains available",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "0"]).fusedRoPE)
        let candidate = InferenceOptimizations.integrationCandidate
        c.equal("absent overrides retain the selected default family",
            try InferenceOptimizations.resolving(environment: [:], defaults: candidate), candidate)
        let candidateFlags: [(String, WritableKeyPath<InferenceOptimizations, Bool>)] = [
            ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
            ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
            ("SLOTSTREAM_OPT_NGRAM_ROWS", \.compactNgramRows),
            ("SLOTSTREAM_OPT_FINAL_FORWARD", \.skipUnusedFinalForward),
            ("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", \.valueOnlySamplerThreshold),
            ("SLOTSTREAM_OPT_SAMPLER_DRAW", \.deviceSamplerDraw),
            ("SLOTSTREAM_OPT_OUTPUT_QUEUE", \.boundedOutputQueue),
            ("SLOTSTREAM_OPT_RESPONSIVE_GOVERNOR", \.responsiveGovernor),
            ("SLOTSTREAM_OPT_COMPLETE_PROMPT", \.completePromptCheckpoint),
            ("SLOTSTREAM_OPT_SHARED_ROPE", \.sharedRoPE),
            ("SLOTSTREAM_OPT_FUSED_ROPE", \.fusedRoPE),
        ]
        for (name, field) in candidateFlags {
            var disabled = candidate
            disabled[keyPath: field] = false
            c.equal("explicit zero disables only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "0"], defaults: candidate), disabled)
            c.equal("explicit one restores only \(name)",
                try InferenceOptimizations.resolving(environment: [name: "1"], defaults: disabled), candidate)
        }
        var referenceOverrides = Dictionary(uniqueKeysWithValues: candidateFlags.map { ($0.0, "0") })
        referenceOverrides["SLOTSTREAM_OPT_PREFIX_CHECKPOINT"] = "0"
        c.equal("explicit zeros restore the complete reference inference family",
            try InferenceOptimizations.resolving(environment: referenceOverrides, defaults: candidate),
            InferenceOptimizations())
        var noCheckpoint = candidate
        noCheckpoint.prefixCheckpointTokens = 0
        c.equal("explicit numeric zero disables inherited prefix retention",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_PREFIX_CHECKPOINT": "0"],
                defaults: candidate), noCheckpoint)
        c.equal("non-optimization environment leaves the family intact",
            try InferenceOptimizations.resolving(environment: ["PATH": "/unused"], defaults: candidate), candidate)
        for env in [["SLOTSTREAM_OPT_COMPLETE_PROMPT": "false"], ["SLOTSTREAM_OPT_TYPO": "0"]] {
            do {
                _ = try InferenceOptimizations.resolving(environment: env, defaults: candidate)
                c.expect("selected defaults still reject invalid override \(env)", false)
            } catch { c.expect("selected defaults still reject invalid override \(env)", true) }
        }
        var scopedDefaults = candidate
        scopedDefaults.readScopeTokens = 4096
        scopedDefaults.layerExpertWorkspace = true
        scopedDefaults.boundedIndexer = true
        scopedDefaults.boundedPLE = true
        c.equal("valid inherited read scope retains its prerequisites",
            try InferenceOptimizations.resolving(environment: [:], defaults: scopedDefaults), scopedDefaults)
        for name in ["SLOTSTREAM_OPT_COMPACT_STATE", "SLOTSTREAM_OPT_COMPACT_MTP",
                     "SLOTSTREAM_OPT_LAYER_WORKSPACE", "SLOTSTREAM_OPT_INDEXER_TILES", "SLOTSTREAM_OPT_PLE_TILES"] {
            do {
                _ = try InferenceOptimizations.resolving(environment: [name: "0"], defaults: scopedDefaults)
                c.expect("inherited scope rejects disabled prerequisite \(name)", false)
            } catch { c.expect("inherited scope rejects disabled prerequisite \(name)", true) }
        }
        scopedDefaults.readScopeTokens = 0
        c.equal("scope can be disabled while retaining its other independent work",
            try InferenceOptimizations.resolving(environment: ["SLOTSTREAM_OPT_READ_SCOPE": "0"],
                defaults: {
                    var value = scopedDefaults; value.readScopeTokens = 4096; return value
                }()), scopedDefaults)
        let environmentFunction: ([String: String]) throws -> InferenceOptimizations = InferenceOptimizations.environment
        c.equal("public environment function value keeps its signature and reference default",
            try environmentFunction([:]), InferenceOptimizations())
        c.expect("typed override enables compaction", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_COMPACT_STATE": "1"]).compactStateWindows)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPACT_STATE": "yes"])
            c.expect("malformed override refused", false)
        } catch { c.expect("malformed override refused", true) }

        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_TYPO": "1"])
            c.expect("unknown optimization refused", false)
        } catch { c.expect("unknown optimization refused", true) }

        for value in ["-1", "1", "16384", "bad"] {
            do {
                _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": value])
                c.expect("invalid read scope \(value) refused", false)
            } catch { c.expect("invalid read scope \(value) refused", true) }
        }
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_READ_SCOPE": "8192"])
            c.expect("unbounded read scope refused", false)
        } catch { c.expect("unbounded read scope refused", true) }

        c.equal("explicit workspace tile is recorded", try InferenceOptimizations.environment([
            "SLOTSTREAM_OPT_WORKSPACE_TILE": "2048"]).workspaceTokenTile, 2048)
        do {
            _ = try InferenceOptimizations.environment(["SLOTSTREAM_OPT_WORKSPACE_TILE": "8192"])
            c.expect("unbounded workspace tile refused", false)
        } catch { c.expect("unbounded workspace tile refused", true) }

        c.equal("terminal output needs no speculative draft", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 1, bounded: true), 0)
        c.equal("draft count fits remaining output", Generator.effectiveDraftDepth(requested: 16, remainingOutputs: 3, bounded: true), 2)
        c.equal("public depth cannot exceed recording cap", Generator.effectiveDraftDepth(requested: Int.max, remainingOutputs: Int.max, bounded: false), 16)
        c.equal("negative remaining output cannot underflow", Generator.effectiveDraftDepth(requested: Int.min, remainingOutputs: Int.min, bounded: true), 0)

        // The prefix cache holds four conversations, not one: Open WebUI's
        // interleaved title request defeated a single slot.
        // Logical cache fixtures are never forwarded through the model, but
        // still declare exactly the number of represented token IDs.
        func fixture(_ count: Int) -> Qwen4ExpModel.State {
            let state = Qwen4ExpModel.State(); state.tokenCount = count; return state
        }
        let cache = PrefixCache(maxTokens: 100)
        for token in 1 ... PrefixCache.maxEntries {
            cache.store(state: fixture(1), tokens: [token])
        }
        c.equal(
            "prefix cache reaches its four-entry bound",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        cache.store(state: fixture(1), tokens: [PrefixCache.maxEntries])
        c.equal(
            "an identical history replaces instead of duplicating an entry",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries)
        _ = cache.take(matching: [999], reserveTokens: 1)
        c.equal(
            "a miss evicts before allocating a fifth state",
            cache.json()["conversations"] as? Int, PrefixCache.maxEntries - 1)
        cache.configure(maxTokens: 2)
        c.expect("a smaller live token ceiling evicts immediately", cache.heldTokens <= 2)
        c.expect("held GB includes fixed recurrent state", cache.heldGB > 0.1)
        let growth = PrefixCache(maxTokens: 20)
        growth.store(state: fixture(4), tokens: [1, 2, 3, 4])
        growth.store(state: fixture(4), tokens: [7, 8, 9, 10])
        growth.store(state: fixture(4), tokens: [11, 12, 13, 14])
        c.expect("growing hit still reuses its state", growth.take(matching: [1, 2, 3, 4, 5], reserveTokens: 17) != nil)
        c.equal("growing hit reserves future state before allocation", growth.heldTokens, 0)
        growth.store(state: fixture(1), tokens: [4])
        c.expect("huge reservation safely misses", growth.take(matching: [9], reserveTokens: Int.max) == nil)
        c.equal("huge reservation releases held state", growth.heldTokens, 0)

        let capacity = PrefixCache(maxTokens: 4096)
        for token in 1 ... 4 { capacity.store(state: fixture(1), tokens: [token]) }
        c.expect("capacity reservation still hits", capacity.take(matching: [1, 2], reserveTokens: 2,
            reserveSequenceBytes: 4096 * PrefixCache.bytesPerToken) != nil)
        c.equal("capacity growth reserves bytes before reuse", capacity.heldTokens, 0)
        capacity.store(state: fixture(1), tokens: [7])
        _ = capacity.take(matching: [9], reserveSequenceBytes: Int.max)
        c.equal("saturated byte reservation evicts safely", capacity.heldTokens, 0)

        // Image keying. Every image expands to a run of the same placeholder
        // id, so ids alone cannot tell two pictures apart; the digest can, and
        // a match has to agree in both directions.
        let a = ImageHash(hashing: Data("picture A".utf8))
        let b = ImageHash(hashing: Data("picture B".utf8))
        c.expect("identical bytes hash alike", a == ImageHash(hashing: Data("picture A".utf8)))
        c.expect("different bytes do not", a != b)
        let held = [ImageSegment(start: 4, count: 8, hash: a)]
        c.expect(
            "the same image at the same offset matches",
            PrefixCache.imagesAgree(entry: held, prompt: held, upTo: 12))
        c.expect(
            "a swapped image does not",
            !PrefixCache.imagesAgree(
                entry: held, prompt: [ImageSegment(start: 4, count: 8, hash: b)], upTo: 12))
        c.expect(
            "an entry ending inside a run still matches that run",
            PrefixCache.imagesAgree(
                entry: [ImageSegment(start: 4, count: 3, hash: a)], prompt: held, upTo: 7))
        c.expect(
            "a text-only entry rejects a prompt with an image inside its range",
            !PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 12))
        c.expect(
            "an image beyond the entry's range is irrelevant to the match",
            PrefixCache.imagesAgree(entry: [], prompt: held, upTo: 4))

        let vcache = PrefixCache(maxTokens: 100)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "a vision conversation is held, not discarded",
            vcache.take(matching: [1, 2, 3, 4], images: held, reserveTokens: 4) != nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the same ids with a different picture miss",
            vcache.take(
                matching: [1, 2, 3, 4], images: [ImageSegment(start: 4, count: 8, hash: b)],
                reserveTokens: 4) == nil)
        vcache.store(state: fixture(3), tokens: [1, 2, 3], images: held)
        c.expect(
            "the text-only splice never sees a vision entry",
            vcache.peek(extending: [1, 2]) == nil)

        // A client can re-render an assistant turn differently from the exact
        // ids the server generated (fx omits reasoning when it sends history
        // back). `peek` finds the longest retained extension for the splice,
        // but does not consume it before the ordinary cache match.
        let spliceCache = PrefixCache(maxTokens: 100)
        spliceCache.store(state: fixture(3), tokens: [7, 8, 9])
        spliceCache.store(state: fixture(4), tokens: [7, 8, 9, 10])
        c.equal(
            "prefix splice chooses the longest retained extension",
            spliceCache.peek(extending: [7, 8]), [7, 8, 9, 10])
        c.expect(
            "prefix splice is strict, not an identical-history match",
            spliceCache.peek(extending: [7, 8, 9, 10]) == nil)
        c.equal(
            "prefix splice lookup does not consume the retained state",
            spliceCache.take(matching: [7, 8, 9, 10, 11])?.reused, 4)
        spliceCache.enabled = false
        c.expect(
            "a disabled prefix cache offers no splice",
            spliceCache.peek(extending: [7]) == nil)

        // Weights behind a symlink: Foundation refuses to list the link itself,
        // so the index must resolve it first (it did not, before 0.2.1).
        let tmp = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-runtime-check-\(getpid())")
        let real = tmp.appendingPathComponent("real")
        let link = tmp.appendingPathComponent("link")
        try FileManager.default.createDirectory(at: real, withIntermediateDirectories: true)
        FileManager.default.createFile(
            atPath: real.appendingPathComponent("model-00001-of-00001.safetensors").path,
            contents: Data())
        try FileManager.default.createSymbolicLink(at: link, withDestinationURL: real)
        defer { try? FileManager.default.removeItem(at: tmp) }
        c.equal(
            "shard listing works through a symlinked model dir",
            (try? CheckpointIndex.shardFiles(in: link))?.count, 1)

        // The memory promise: a plan never expects to peak past its target.
        for target in [Planner.minMemoryGB, 10, 16, 30] where target >= Planner.minMemoryGB {
            let p = try Planner.plan(
                expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                ramGB: 64, workingSetGB: 64, availableGB: 64)
            c.expect(
                "\(target) GB plan stays inside its target",
                p.expectedPeakGB <= target + 0.01,
                "expected peak \(p.expectedPeakGB) GB")
            c.measure("peak_gb_at_\(Int(target))", p.expectedPeakGB)
        }
        return c.report()
    }
}

````````````

## Artifact SHA-256 cfe56b5bf0d412772d28aa206848540141e2ff67d97266906d1fb8cd8a37f29d

Encoding: `utf-8`. Original bytes: 376.

````````````text
{
  "Sources/Slotstream/Optimizations.swift": "0ef3216055f57d8adfbc91ae9a28cbefd1ba45b1b08f86502363b6f5329cb494",
  "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "25baf57d41c3d2df4928f3f3273fbbbb2514a0dab6793fc7619f642c8b293994",
  "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "1274da5c2aed15f2ceb8e42777ea7114e7db83935c059bf633020b5a8ca6be4b"
}

````````````

## Artifact SHA-256 70305ecabc5ce64a9c15d113e4ae0b708f56783367dc1865d49fa1f46b32239b

Encoding: `utf-8`. Original bytes: 5259.

````````````text
--- before/Sources/Slotstream/Optimizations.swift
+++ after/Sources/Slotstream/Optimizations.swift
@@ -84,6 +84,7 @@
         result.compactStateWindows = true
         result.compactMTPRow = true
         result.compactNgramRows = true
+        result.boundedDraftTail = true
         result.skipUnusedFinalForward = true
         result.valueOnlySamplerThreshold = true
         result.deviceSamplerDraw = true
--- before/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift
+++ after/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift
@@ -59,6 +59,7 @@
             ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
             ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
             ("SLOTSTREAM_OPT_NGRAM_ROWS", \.compactNgramRows),
+            ("SLOTSTREAM_OPT_MTP_TAIL", \.boundedDraftTail),
             ("SLOTSTREAM_OPT_FINAL_FORWARD", \.skipUnusedFinalForward),
             ("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", \.valueOnlySamplerThreshold),
             ("SLOTSTREAM_OPT_SAMPLER_DRAW", \.deviceSamplerDraw),
--- before/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift
+++ after/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift
@@ -29,6 +29,7 @@
         struct Results {
             var state: [String: [String: String]] = [:]
             var outputs: [String: [Int]] = [:]
+            var sampledWork: [String: [Int]] = [:]
         }
         func hash(_ a: MLXArray) -> String {
             "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
@@ -55,6 +56,7 @@
             var params = SampleParams.greedy; params.maxTokens = 8; params.seed = 7
             var results = Results()
             c.equal("\(candidate): embedding selection", model.resident.usesEmbeddingRows, candidate)
+            c.equal("\(candidate): bounded greedy tail selection", model.optimizations.boundedDraftTail, candidate)
             for count in [-1, 1, Int.max] {
                 let invalid = model.makeState(); invalid.tokenCount = count
                 let before = invalid.prefixForkDiagnosticTensors().mapValues(hash)
@@ -172,6 +174,18 @@
                     c.equal("\(candidate)/\(label): seeded replay exact", repeatRun.0, first.0)
                     results.outputs[label] = first.0
                     if let wanted = expected?.outputs[label] { c.equal("\(label): integrated sampled IDs match reference", first.0, wanted) }
+                    if mtp {
+                        let work = [first.1.draftedTokens, first.1.verifyPasses,
+                            first.1.decodeModelTokens, first.1.decodeForwardPasses]
+                        let repeatWork = [repeatRun.1.draftedTokens, repeatRun.1.verifyPasses,
+                            repeatRun.1.decodeModelTokens, repeatRun.1.decodeForwardPasses]
+                        c.equal("\(candidate)/\(label): sampled replay keeps verification work", repeatWork, work)
+                        results.sampledWork[label] = work
+                        if let expected {
+                            c.equal("\(label): integrated sampled verification work matches reference",
+                                work, expected.sampledWork[label] ?? [])
+                        }
+                    }
                 }
             }
             let retained = PrefixCache(maxTokens: 8192)
@@ -235,6 +249,24 @@
             let single = generator.generate(promptIds: short, params: one, eosIds: [])
             c.equal("\(candidate): one-token request releases pins", model.pool.pinnedSlotCount, 0)
             c.equal("\(candidate): one-token request emits exactly one token", single.0.count, 1)
+            if mtp {
+                var two = params; two.maxTokens = 2
+                let terminal = generator.generate(promptIds: short, params: two, eosIds: [])
+                c.expect("\(candidate): two-token MTP request completes",
+                    terminal.1.runtimeError == nil && terminal.0.count == 2)
+                c.equal("\(candidate): two-token MTP releases pins", model.pool.pinnedSlotCount, 0)
+                c.equal("\(candidate): terminal draft work is explicit", terminal.1.draftedTokens, candidate ? 0 : 1)
+                c.equal("\(candidate): terminal target work is explicit", terminal.1.decodeModelTokens, candidate ? 1 : 2)
+                c.equal("\(candidate): terminal verification executes once", terminal.1.verifyPasses, 1)
+                c.equal("\(candidate): terminal forward executes once", terminal.1.decodeForwardPasses, 1)
+                c.equal("\(candidate): bounded output preserves the longer greedy prefix",
+                    terminal.0, Array((results.outputs["cached17"] ?? []).prefix(2)))
+                results.outputs["mtp-two-output"] = terminal.0
+                if let expected {
+                    c.equal("two-token MTP integrated output matches reference",
+                        terminal.0, expected.outputs["mtp-two-output"] ?? [])
+                }
+            }
             if let eos = single.0.first {
                 let stopped = generator.generate(promptIds: short, params: params, eosIds: [eos])
                 c.expect("\(candidate): immediate EOS succeeds without emitted output",

````````````

## Artifact SHA-256 deb60bcd348699bd2254d110631a5f080703fff7387bd0104392632a9ed56c03

Encoding: `utf-8`. Original bytes: 2184.

````````````text
{
  "classification": "Qualified greedy bounded-tail control selected in explicit integrationCandidate, alongside V342 compact rows and V344 diagnostic lifetime work. New combined source unbuilt and unqualified; automatic defaults and installed binaries unchanged.",
  "before_sha256": {
    "Sources/Slotstream/Optimizations.swift": "0ef3216055f57d8adfbc91ae9a28cbefd1ba45b1b08f86502363b6f5329cb494",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "25baf57d41c3d2df4928f3f3273fbbbb2514a0dab6793fc7619f642c8b293994",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "1274da5c2aed15f2ceb8e42777ea7114e7db83935c059bf633020b5a8ca6be4b"
  },
  "after_sha256": {
    "Sources/Slotstream/Optimizations.swift": "ba34563a589b3a64fceed9a614bae0fb2149b1a117483cf7d3da6b2b5554b598",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "f0bba52fb1f9fbea0dca0c5d59634831293ca0088c1ccd15d7dd5bdd4dc07198",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "512dd096a194f8c56f1d9be16931714035150ca54cbb02cbbb9d0aec5871657d"
  },
  "patch_sha256": "70305ecabc5ce64a9c15d113e4ae0b708f56783367dc1865d49fa1f46b32239b",
  "native_checks_added": [
    "Actual selected tail flag in both arms.",
    "Exact two-output MTP completion/pins, one verify/forward, zero versus one draft and one versus two target positions.",
    "Two-output IDs agree with the same-arm longer prefix and independent reference.",
    "Filtered/unfiltered sampled requests at both original seeds preserve replay and reference draft/model/verification work."
  ],
  "qualified_component": "V34332cells16cleanpairs: median paired request time11.875961780644756percent lower and first-job time5.183049530379519percent lower. Original V338 greedy cohort remains failed.",
  "validation": "Source and whitespace review only. These new Swift assertions have not been compiled or run. All final combined native/serving/lifetime/resource/client/calibration and activation gates remain.",
  "sustained_tps_claim": false,
  "compiler_launched": false,
  "model_launched_for_changed_source": false,
  "automatic_defaults_activated": false,
  "git_staged_committed_pushed": false
}

````````````

## Artifact SHA-256 f6c9a2dfdf23c074dac9eea02139cbe10d6e8283d75ae28e4b2afbf84ea499e5

Encoding: `utf-8`. Original bytes: 8794.

````````````text
{
  "assessment": {
    "completed": true,
    "passed": true,
    "qualified": true,
    "cells": 32,
    "acceptance": [
      {
        "candidate": "candidate",
        "passed": true,
        "checks": {
          "minimum_pairs": true,
          "median_client_reduction": true,
          "positive_fraction": true,
          "exact_outputs": true
        }
      }
    ],
    "startup_acceptance": [
      {
        "candidate": "candidate",
        "passed": true,
        "checks": {
          "minimum_pairs": true,
          "median_first_job_non_regression": true
        },
        "eligible_rounds": [
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,
          9,
          10,
          11,
          12,
          13,
          14,
          15,
          16
        ],
        "excluded_rounds": [],
        "median_first_job_reduction_fraction": 0.05183049530379519
      }
    ],
    "summary": [
      {
        "reference": "reference",
        "candidate": "candidate",
        "comparison_basis": "fixed-pool",
        "pairs": [
          {
            "round": 1,
            "client_reduction_fraction": 0.13763037635987585,
            "generator_reduction_fraction": 0.13769763504212096,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -363696,
            "sampled_peak_savings_bytes": 119046192,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 2,
            "client_reduction_fraction": 0.10564585055107789,
            "generator_reduction_fraction": 0.1056940227451526,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -363696,
            "sampled_peak_savings_bytes": 118357992,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 3,
            "client_reduction_fraction": 0.1348077042062653,
            "generator_reduction_fraction": 0.1348633516312766,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -363696,
            "sampled_peak_savings_bytes": 118833152,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 4,
            "client_reduction_fraction": 0.09602681437343308,
            "generator_reduction_fraction": 0.09605783264063739,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -363696,
            "sampled_peak_savings_bytes": 118177864,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 5,
            "client_reduction_fraction": 0.08954223996698896,
            "generator_reduction_fraction": 0.08959512688368887,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -369840,
            "sampled_peak_savings_bytes": 118702104,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 6,
            "client_reduction_fraction": 0.10867285796754134,
            "generator_reduction_fraction": 0.10873639321056605,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -363696,
            "sampled_peak_savings_bytes": 118636592,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 7,
            "client_reduction_fraction": 0.09318402477729493,
            "generator_reduction_fraction": 0.09322391081856851,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -363696,
            "sampled_peak_savings_bytes": 108707768,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 8,
            "client_reduction_fraction": 0.12730946569844914,
            "generator_reduction_fraction": 0.12733191737122196,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -363696,
            "sampled_peak_savings_bytes": 118702128,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 9,
            "client_reduction_fraction": 0.11973598671280317,
            "generator_reduction_fraction": 0.11972575187950363,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -363696,
            "sampled_peak_savings_bytes": 119013424,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 10,
            "client_reduction_fraction": 0.09590235791585833,
            "generator_reduction_fraction": 0.09603126122714223,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -363696,
            "sampled_peak_savings_bytes": 118374376,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 11,
            "client_reduction_fraction": 0.11880056083726875,
            "generator_reduction_fraction": 0.11884337710463566,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -380080,
            "sampled_peak_savings_bytes": 118702176,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 12,
            "client_reduction_fraction": 0.11875608161336859,
            "generator_reduction_fraction": 0.11879474861324968,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -363696,
            "sampled_peak_savings_bytes": 118194248,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 13,
            "client_reduction_fraction": 0.11521937571808805,
            "generator_reduction_fraction": 0.11530488775288195,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -363696,
            "sampled_peak_savings_bytes": 118439912,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 14,
            "client_reduction_fraction": 0.11876315399952653,
            "generator_reduction_fraction": 0.1187666849147857,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -363696,
            "sampled_peak_savings_bytes": 118800432,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 15,
            "client_reduction_fraction": 0.15894040866497372,
            "generator_reduction_fraction": 0.15899839496675605,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -363696,
            "sampled_peak_savings_bytes": 118783928,
            "output_ids_equal": true,
            "wire_text_equal": true
          },
          {
            "round": 16,
            "client_reduction_fraction": 0.13135735925667813,
            "generator_reduction_fraction": 0.13137812551017714,
            "sequence_reduction_fraction": 0.0,
            "active_savings_share": null,
            "active_savings_bytes": -380080,
            "sampled_peak_savings_bytes": 131137560,
            "output_ids_equal": true,
            "wire_text_equal": true
          }
        ],
        "excluded_rounds": [],
        "median_client_reduction_fraction": 0.11875961780644756,
        "median_generator_reduction_fraction": 0.11878071676401769
      }
    ],
    "first_job_prefill_records": 3383,
    "historical_rows_used": 0,
    "original_study_remains_failed": true,
    "adaptive_policy_adopted": false,
    "activation_performed": false
  },
  "qualification_sha256": "d2a75b7efa1de5f5b9bdb9a064283c46c7021dd399869f7b749c34b0e7da4053",
  "executor_sha256": "9d271faf1b0739708c04fad503aa4c4646341bcbe0df841908f4b1825fafc74b",
  "classification": "Passing fresh same-binary optional gate; final combination and activation still required."
}

````````````
