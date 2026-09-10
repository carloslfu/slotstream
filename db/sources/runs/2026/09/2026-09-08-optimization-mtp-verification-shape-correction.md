---
type: run
id: 01m20jmy8hd63pxnz7r4n4nv9r
created: 2026-09-08T13:17:19.505176+00:00
updated: 2026-09-08T13:17:19.781012+00:00
summary: Combined candidate restores fixed MTP verification shape after exact-output failures
binary: Source correction only; current compiled V349 remains separately rejected for MTP
captured_at: 2026-09-08
command: Four-file V359 source correction and git diff --check; candidate build and native rerun pending
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Combined candidate restores fixed MTP verification shape after exact-output failures
tool: Slotstream exact native and source qualification capture
---
V359 removes boundedDraftTail from the explicit integrationCandidate and therefore from its eventual deployment family. Compact BF16 n-gram rows remain selected. Public initializer/environment reference defaults and installed artifacts remain unchanged. The experimental tail flag remains available only by explicit selection; no discarded optimization is silently adopted.

The Runtime diagnostic now requires the candidate to retain the original MTP verification shape. Integrated tests retain every prior case and exact-output comparison, including fixed two-output equality to both the independent reference and the longer same-arm greedy prefix. Both arms must now execute the original one draft and two target positions at this terminal boundary. Changing these work assertions describes the removal of the failed optimization, not a relaxation of output equality. All cache format/payload, state hashes, sampled replay/work, rollback and recovery checks remain.

Generate.swift changes only its explanatory comment; no new kernel, sampling rule or context policy is introduced. The four complete before/after source images and exact patch are preserved below. The full native report motivating this prospective correction is [[sources/runs/2026/09/2026-09-08-optimization-compact-tail-native-counterexample]]. Source checks alone do not prove the correction; a new exact build and the original complete native cases are required. The failed V349 identity and prior V343 isolated result remain unchanged.

## Exact artifact inventory

```json
[
  {
    "path": "/tmp/slotstream-optimization-execution/mtp-shape-correction-v359/after/Sources/Slotstream/Generate.swift",
    "bytes": 74337,
    "sha256": "9bd9619a98aa62685be2de5148942455456b5d30fcf18e5a384148a4ae313da2"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/mtp-shape-correction-v359/after/Sources/Slotstream/Optimizations.swift",
    "bytes": 14290,
    "sha256": "9ec7c669fbe7c88a88ec55aedbdc7afb87b696182333324265fdf95f60a5a5f1"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/mtp-shape-correction-v359/after/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift",
    "bytes": 22026,
    "sha256": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/mtp-shape-correction-v359/after/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
    "bytes": 18429,
    "sha256": "a57d3ec3d19007bdb48a109214bcc3eb1e6b4e401cb3baaa1296952e39d4bfc6"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/mtp-shape-correction-v359/before/Sources/Slotstream/Generate.swift",
    "bytes": 74261,
    "sha256": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/mtp-shape-correction-v359/before/Sources/Slotstream/Optimizations.swift",
    "bytes": 14247,
    "sha256": "ba34563a589b3a64fceed9a614bae0fb2149b1a117483cf7d3da6b2b5554b598"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/mtp-shape-correction-v359/before/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift",
    "bytes": 22051,
    "sha256": "512dd096a194f8c56f1d9be16931714035150ca54cbb02cbbb9d0aec5871657d"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/mtp-shape-correction-v359/before/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
    "bytes": 18364,
    "sha256": "f0bba52fb1f9fbea0dca0c5d59634831293ca0088c1ccd15d7dd5bdd4dc07198"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/mtp-shape-correction-v359/before.json",
    "bytes": 662,
    "sha256": "e16219f00d4ace0066f8aef9268582604cb419c9ec6ccc87a9f5be06589b93f3"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/mtp-shape-correction-v359/correction.patch",
    "bytes": 5181,
    "sha256": "60ad16e77647f52e043a2e37ae1a72f0d83228b8ee09ca05eecc8070f9cee03e"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/mtp-shape-correction-v359/manifest.json",
    "bytes": 3012,
    "sha256": "04faf9495cec20ff928ffabfe2ad6f5008cf76942bccc18ca366fa1d06c80760"
  }
]
```

## Artifact SHA-256 9bd9619a98aa62685be2de5148942455456b5d30fcf18e5a384148a4ae313da2

Encoding: `gzip+base64`. Original bytes: 74337.

````````````text
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
````````````

## Artifact SHA-256 9ec7c669fbe7c88a88ec55aedbdc7afb87b696182333324265fdf95f60a5a5f1

Encoding: `utf-8`. Original bytes: 14290.

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
    /// Experimental shortening changes verification shapes and can change
    /// greedy output. Excluded from the combined candidate; sampled requests
    /// retain their original shapes. Independent context bounds always apply.
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

## Artifact SHA-256 5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941

Encoding: `utf-8`. Original bytes: 22026.

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
            c.equal("\(candidate): original MTP verification shape selected", model.optimizations.boundedDraftTail, false)
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
                c.equal("\(candidate): terminal draft work is explicit", terminal.1.draftedTokens, 1)
                c.equal("\(candidate): terminal target work is explicit", terminal.1.decodeModelTokens, 2)
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

## Artifact SHA-256 a57d3ec3d19007bdb48a109214bcc3eb1e6b4e401cb3baaa1296952e39d4bfc6

Encoding: `utf-8`. Original bytes: 18429.

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
        c.expect("combined candidate preserves the original MTP verification shape",
            !candidate.boundedDraftTail)
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

## Artifact SHA-256 7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d

Encoding: `gzip+base64`. Original bytes: 74261.

````````````text
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
````````````

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

## Artifact SHA-256 e16219f00d4ace0066f8aef9268582604cb419c9ec6ccc87a9f5be06589b93f3

Encoding: `utf-8`. Original bytes: 662.

````````````text
{
  "at": "2026-09-08T13:11:57.951218+00:00",
  "sources": {
    "Sources/Slotstream/Optimizations.swift": "ba34563a589b3a64fceed9a614bae0fb2149b1a117483cf7d3da6b2b5554b598",
    "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "f0bba52fb1f9fbea0dca0c5d59634831293ca0088c1ccd15d7dd5bdd4dc07198",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "512dd096a194f8c56f1d9be16931714035150ca54cbb02cbbb9d0aec5871657d"
  },
  "failed_native_qualification_sha256": "e921d999d9a52cbb93c245ddb7981668018cf496d4f49744f2e01441eb85afd8"
}

````````````

## Artifact SHA-256 60ad16e77647f52e043a2e37ae1a72f0d83228b8ee09ca05eecc8070f9cee03e

Encoding: `utf-8`. Original bytes: 5181.

````````````text
--- a/Sources/Slotstream/Optimizations.swift
+++ b/Sources/Slotstream/Optimizations.swift
@@ -36,8 +36,9 @@
     /// Experimental bounded layer-major scope; zero keeps chronological passes.
     public var readScopeTokens = 0
     public var reuseFirstMTPEntry = false
-    /// Greedy-only optional shortening; sampled requests retain their original
-    /// verification shapes. Independent context bounds always apply.
+    /// Experimental shortening changes verification shapes and can change
+    /// greedy output. Excluded from the combined candidate; sampled requests
+    /// retain their original shapes. Independent context bounds always apply.
     public var boundedDraftTail = false
     public var adaptiveSpeculation = false
     public var resolvedRuntimeBudget = false
@@ -84,7 +85,6 @@
         result.compactStateWindows = true
         result.compactMTPRow = true
         result.compactNgramRows = true
-        result.boundedDraftTail = true
         result.skipUnusedFinalForward = true
         result.valueOnlySamplerThreshold = true
         result.deviceSamplerDraw = true
--- a/Sources/Slotstream/Generate.swift
+++ b/Sources/Slotstream/Generate.swift
@@ -1148,8 +1148,9 @@
             if case .draft(let depth) = action { requestedDepth = depth }
             else { requestedDepth = draftDepth }
             // Optional tail shortening changes verification batch shapes.
-            // A seeded-sampling counterexample requires the original schedule
-            // for sampled requests. The context limit below remains mandatory.
+            // Both greedy and sampled counterexamples exist, so the combined
+            // candidate keeps this experimental control off. Sampled requests
+            // always keep the original schedule. Context bounds still apply.
             let boundedTail = model.optimizations.boundedDraftTail && params.temperature <= 0
             let requestedAvailable = action == .calibrate ? 0 : Self.effectiveDraftDepth(requested: requestedDepth,
                 remainingOutputs: params.maxTokens - out.count,
--- a/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift
@@ -53,13 +53,14 @@
         c.expect("explicit kernel fallback remains available",
             try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_FUSED_ROPE": "0"]).fusedRoPE)
         let candidate = InferenceOptimizations.integrationCandidate
+        c.expect("combined candidate preserves the original MTP verification shape",
+            !candidate.boundedDraftTail)
         c.equal("absent overrides retain the selected default family",
             try InferenceOptimizations.resolving(environment: [:], defaults: candidate), candidate)
         let candidateFlags: [(String, WritableKeyPath<InferenceOptimizations, Bool>)] = [
             ("SLOTSTREAM_OPT_COMPACT_STATE", \.compactStateWindows),
             ("SLOTSTREAM_OPT_COMPACT_MTP", \.compactMTPRow),
             ("SLOTSTREAM_OPT_NGRAM_ROWS", \.compactNgramRows),
-            ("SLOTSTREAM_OPT_MTP_TAIL", \.boundedDraftTail),
             ("SLOTSTREAM_OPT_FINAL_FORWARD", \.skipUnusedFinalForward),
             ("SLOTSTREAM_OPT_SAMPLER_THRESHOLD", \.valueOnlySamplerThreshold),
             ("SLOTSTREAM_OPT_SAMPLER_DRAW", \.deviceSamplerDraw),
--- a/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift
@@ -56,7 +56,7 @@
             var params = SampleParams.greedy; params.maxTokens = 8; params.seed = 7
             var results = Results()
             c.equal("\(candidate): embedding selection", model.resident.usesEmbeddingRows, candidate)
-            c.equal("\(candidate): bounded greedy tail selection", model.optimizations.boundedDraftTail, candidate)
+            c.equal("\(candidate): original MTP verification shape selected", model.optimizations.boundedDraftTail, false)
             for count in [-1, 1, Int.max] {
                 let invalid = model.makeState(); invalid.tokenCount = count
                 let before = invalid.prefixForkDiagnosticTensors().mapValues(hash)
@@ -255,8 +255,8 @@
                 c.expect("\(candidate): two-token MTP request completes",
                     terminal.1.runtimeError == nil && terminal.0.count == 2)
                 c.equal("\(candidate): two-token MTP releases pins", model.pool.pinnedSlotCount, 0)
-                c.equal("\(candidate): terminal draft work is explicit", terminal.1.draftedTokens, candidate ? 0 : 1)
-                c.equal("\(candidate): terminal target work is explicit", terminal.1.decodeModelTokens, candidate ? 1 : 2)
+                c.equal("\(candidate): terminal draft work is explicit", terminal.1.draftedTokens, 1)
+                c.equal("\(candidate): terminal target work is explicit", terminal.1.decodeModelTokens, 2)
                 c.equal("\(candidate): terminal verification executes once", terminal.1.verifyPasses, 1)
                 c.equal("\(candidate): terminal forward executes once", terminal.1.decodeForwardPasses, 1)
                 c.equal("\(candidate): bounded output preserves the longer greedy prefix",

````````````

## Artifact SHA-256 04faf9495cec20ff928ffabfe2ad6f5008cf76942bccc18ca366fa1d06c80760

Encoding: `utf-8`. Original bytes: 3012.

````````````text
{
  "at": "2026-09-08T13:12:42.989855+00:00",
  "before_sha256": {
    "Sources/Slotstream/Optimizations.swift": "ba34563a589b3a64fceed9a614bae0fb2149b1a117483cf7d3da6b2b5554b598",
    "Sources/Slotstream/Generate.swift": "7036e275990695568a948e279505cc03495da21d8b5f81a5f9160843d59c0c0d",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "f0bba52fb1f9fbea0dca0c5d59634831293ca0088c1ccd15d7dd5bdd4dc07198",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "512dd096a194f8c56f1d9be16931714035150ca54cbb02cbbb9d0aec5871657d"
  },
  "after_sha256": {
    "Sources/Slotstream/Optimizations.swift": "9ec7c669fbe7c88a88ec55aedbdc7afb87b696182333324265fdf95f60a5a5f1",
    "Sources/Slotstream/Generate.swift": "9bd9619a98aa62685be2de5148942455456b5d30fcf18e5a384148a4ae313da2",
    "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift": "a57d3ec3d19007bdb48a109214bcc3eb1e6b4e401cb3baaa1296952e39d4bfc6",
    "Sources/SlotstreamDiagnostics/Diagnostics+Integrated.swift": "5eb2132959b1db779caa520a3eefe5d6c5ffdd9ed317750c8cee48f02bd05941"
  },
  "patch_sha256": "60ad16e77647f52e043a2e37ae1a72f0d83228b8ee09ca05eecc8070f9cee03e",
  "change": "Preserve the fixed MTP verification schedule in integration/deployment candidates. Retain compact BF16 cache and every exact-output assertion. Experimental tail flag remains explicit only.",
  "failed_native_report": "/Users/carlos/Projects/slotstream/.build/optimization/compact-tail-native-v350/combined-mtp/stdout.txt",
  "failed_native_stdout_sha256": "5cba162a2508534c86a128523dee1a41a89d1b9b0bdb8e321a5dcc1e2d0acb7c",
  "total_assertions": 327,
  "failed_assertions": [
    {
      "detail": "got [33, 428, 329, 271, 487, 1006, 271, 487], want [33, 428, 329, 271, 487, 1006, 271, 13]",
      "name": "cached17: exact complete greedy IDs",
      "passed": false
    },
    {
      "detail": "got [5513, 271, 510, 271, 248045, 271, 248044, 4876], want [5513, 271, 510, 271, 248045, 271, 248044, 871]",
      "name": "boundary256: exact complete greedy IDs",
      "passed": false
    },
    {
      "detail": "got [2541, 261, 656, 258, 6, 198, 220, 248046], want [2541, 261, 656, 258, 6, 198, 220, 220]",
      "name": "long1025: exact complete greedy IDs",
      "passed": false
    },
    {
      "detail": "got [5513, 12, 248044, 320, 2793, 25, 2212, 14905], want [5513, 12, 248044, 320, 2793, 25, 2212, 21227]",
      "name": "image-before: exact complete greedy IDs",
      "passed": false
    },
    {
      "detail": "got [33, 461], want [33, 428]",
      "name": "true: bounded output preserves the longer greedy prefix",
      "passed": false
    },
    {
      "detail": "got [33, 461], want [33, 428]",
      "name": "two-token MTP integrated output matches reference",
      "passed": false
    }
  ],
  "shared_public_defaults_unchanged": true,
  "compiled": false,
  "qualified": false,
  "reproduction_required": "Same original full native cases on the corrected exact candidate; original six failures remain immutable."
}

````````````
