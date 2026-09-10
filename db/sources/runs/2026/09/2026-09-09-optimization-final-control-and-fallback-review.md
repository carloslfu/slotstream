---
type: run
id: 01m24s07n7qssdhytwhnrt09ga
created: 2026-09-10T04:25:18.759600+00:00
updated: 2026-09-10T04:25:19.126430+00:00
summary: Exact final controls preserve selected defaults, reference compatibility and measured platform dispatch
binary: /Users/carlos/Projects/slotstream/.build/optimization/final-composition-build-v519/candidate/slotstream
captured_at: 2026-09-09
command: Read exact final control resolution and platform dispatch, compare source bytes with qualified V529 public consumer, enumerate initial fields and integration assignments
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Exact final controls preserve selected defaults, reference compatibility and measured platform dispatch
tool: Slotstream exact native and source qualification capture
---
Source review confirms the fourteen selected integration assignments, explicit reference initializer and measured fused-rotation platform boundary without changing any candidate source. Bounded MTP tail, adaptive speculation, duplicate-image reuse and other rejected prototypes are absent from the selected family. Automatic read grouping retains its request-local bounded prerequisite dispatch; base false fields are not misrepresented as unreachable code. The original unified rule retains the reference arm through qualification and one release after adoption. That release has not occurred, so deleting those controls now would violate the retention rule and disrupt existing public Codable/diagnostic compatibility. Explicit experimental options remain opt-in and grant no automatic deployment or performance claim. Exact full native, public-consumer, verification and installed evidence already covers this unchanged family; this review does not substitute for the remaining sustained and empirical envelope gates.

## Exact artifact inventory

```json
[
  {
    "path": "/Users/carlos/Projects/slotstream/Sources/Slotstream/OptimizationPlatform.swift",
    "bytes": 2036,
    "sha256": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-activation-preparation-v572/after/Sources/Slotstream/Optimizations.swift",
    "bytes": 15917,
    "sha256": "c4e09b8b6846abd3f6ac680c8c6723e9f123f84469ca4426afbab4375a2eb91c"
  },
  {
    "path": "/tmp/slotstream-optimization-execution/final-control-review-v601/result.json",
    "bytes": 4549,
    "sha256": "806c9f52ed60d1afd67a81ad5901ce8527e3d37f061b2cffa2125b9cd834faee"
  }
]
```

## Artifact SHA-256 e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf

Encoding: `utf-8`. Original bytes: 2036.

````````````text
import Darwin
import Foundation

/// Qualification identity for automatic activation of a new Metal kernel.
/// This is independent of simulated planner inputs and environment controls.
/// It grants neither a memory allowance nor a throughput estimate.
package struct OptimizationPlatform: Equatable {
    package let machineModel: String?
    package let chip: String?
    package let osBuild: String?
    package let nativeARM64: Bool

    package init(machineModel: String?, chip: String?, osBuild: String?, nativeARM64: Bool) {
        self.machineModel = machineModel; self.chip = chip
        self.osBuild = osBuild; self.nativeARM64 = nativeARM64
    }

    /// The complete native/serving RoPE gates currently cover this machine
    /// family and OS build only. An OS update, another SoC or failed identity
    /// read keeps the existing MLX implementation as the automatic fallback.
    package var qualifiedPartialRotation: Bool {
        nativeARM64 && machineModel == "Mac17,9" && chip == "Apple M5 Pro" && osBuild == "25G83"
    }

    private static func systemString(_ name: String) -> String? {
        var count = 0
        guard sysctlbyname(name, nil, &count, nil, 0) == 0, 1 < count, count <= 256 else { return nil }
        var bytes = [UInt8](repeating: 0, count: count)
        let capacity = count
        let result = bytes.withUnsafeMutableBytes { buffer in
            sysctlbyname(name, buffer.baseAddress, &count, nil, 0)
        }
        guard result == 0, 1 < count, count <= capacity, bytes[count - 1] == 0,
              !bytes[..<(count - 1)].contains(0) else { return nil }
        return String(bytes: bytes[..<(count - 1)], encoding: .utf8)
    }

    package static let current: Self = {
        #if arch(arm64)
        let native = true
        #else
        let native = false
        #endif
        return Self(machineModel: systemString("hw.model"), chip: systemString("machdep.cpu.brand_string"),
                    osBuild: systemString("kern.osversion"), nativeARM64: native)
    }()
}

````````````

## Artifact SHA-256 c4e09b8b6846abd3f6ac680c8c6723e9f123f84469ca4426afbab4375a2eb91c

Encoding: `utf-8`. Original bytes: 15917.

````````````text
import Foundation

/// Explicit controls for independently evaluated execution paths. The public
/// initializer is the reference; environment resolution selects the deployment
/// family and applies explicit overrides. Experimental paths remain disabled.
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
    /// Optional for backward-compatible decoding of saved control sets.
    /// Automatic grouping preserves the ordinary chronological fallback and
    /// requires a request memory controller. Explicit read scopes take priority.
    public var automaticReadScope: Bool? = nil
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

    /// Joint execution family used by deployment selection and its diagnostics.
    /// The public initializer remains the explicit reference. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
        result.compactNgramRows = true
        result.automaticReadScope = true
        result.visionQueryTile = 256
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

    /// Select the automatically deployed family with the measured kernel
    /// qualification boundary. Explicit controls can qualify another platform;
    /// kernel initialization and shape fallbacks also apply.
    package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
        var result = integrationCandidate
        result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
        return result
    }

    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
        try resolving(environment: env, defaults: deploymentCandidate())
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
        // An explicit alternative overrides an inherited vision choice. Two
        // explicitly enabled alternatives remain incompatible and must refuse.
        if env[visionPaddingKey] != nil && result.visionAttentionPadding != 0 && env[visionTileKey] == nil {
            result.visionQueryTile = 0
        }
        if env[visionTileKey] != nil && result.visionQueryTile != 0 && env[visionPaddingKey] == nil {
            result.visionAttentionPadding = 0
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
        // Manual scope controls suppress an inherited automatic policy. An
        // explicit AUTO_READ_SCOPE=1 requests policy selection over that base;
        // explicit nonzero read scopes still retain their original semantics.
        let manualScopeKeys = ["SLOTSTREAM_OPT_LAYER_WORKSPACE", "SLOTSTREAM_OPT_READ_SCOPE",
            "SLOTSTREAM_OPT_INDEXER_TILES", "SLOTSTREAM_OPT_PLE_TILES",
            "SLOTSTREAM_OPT_WORKSPACE_TILE", "SLOTSTREAM_OPT_SCOPE_FRONTIER",
            "SLOTSTREAM_OPT_WORKSPACE_PIECES"]
        let inheritedAutomatic = result.automaticReadScope == true
            && !manualScopeKeys.contains(where: { env[$0] != nil })
        result.automaticReadScope = try flag("SLOTSTREAM_OPT_AUTO_READ_SCOPE",
            fallback: inheritedAutomatic) ? true : nil
        let unknown = env.keys.filter { $0.hasPrefix("SLOTSTREAM_OPT_") && !recognized.contains($0) }.sorted()
        guard unknown.isEmpty else { throw ModelError("unknown optimization controls: \(unknown.joined(separator: ", "))") }
        return result
    }
}

````````````

## Artifact SHA-256 806c9f52ed60d1afd67a81ad5901ce8527e3d37f061b2cffa2125b9cd834faee

Encoding: `utf-8`. Original bytes: 4549.

````````````text
{
  "classification": "Source review of exact final selected controls; no new model qualification or activation",
  "candidate_sha256": "9268e4b2a3371e78a71d493d7788559a06a22498e8061a89278c4918c6764673",
  "sources": {
    "/tmp/slotstream-optimization-execution/final-activation-preparation-v572/after/Sources/Slotstream/Optimizations.swift": "c4e09b8b6846abd3f6ac680c8c6723e9f123f84469ca4426afbab4375a2eb91c",
    "/Users/carlos/Projects/slotstream/Sources/Slotstream/OptimizationPlatform.swift": "e4c17aeb1ab294ac9d9e9c60095cc5360382c0809a4f579672b4d0b66a0ed3cf"
  },
  "public_reference_initializer_fields": {
    "compactStateWindows": "false",
    "compactMTPRow": "false",
    "skipUnusedFinalForward": "false",
    "tailAwarePrefill": "false",
    "demandedPrefillOutput": "false",
    "terminalPrefillPruning": "false",
    "terminalLastQuery": "false",
    "compactNgramRows": "false",
    "incrementalIndexer": "false",
    "compactIndexerRaw": "false",
    "valueOnlySamplerThreshold": "false",
    "deviceSamplerDraw": "false",
    "disjointSweepOutput": "false",
    "boundedSweepRows": "false",
    "boundedIndexer": "false",
    "sharedRoPE": "false",
    "fusedRoPE": "false",
    "fusedGDNProjection": "false",
    "fusedGDNRecording": "false",
    "boundedPLE": "false",
    "ngramLookahead": "false",
    "layerExpertWorkspace": "false",
    "workspaceTokenTile": "256",
    "compactScopeFrontier": "false",
    "workspacePiecewiseWrites": "false",
    "readScopeTokens": "0",
    "automaticReadScope": "nil",
    "reuseFirstMTPEntry": "false",
    "boundedDraftTail": "false",
    "adaptiveSpeculation": "false",
    "resolvedRuntimeBudget": "false",
    "layerLocalFloorCache": "false",
    "boundedOutputQueue": "false",
    "responsiveGovernor": "false",
    "routerTopK": "false",
    "denseIndexerBypass": "false",
    "indexerBlockTopK": "false",
    "overlapSharedExpert": "false",
    "overlapResidentExperts": "false",
    "deduplicateImages": "false",
    "visionAttentionPadding": "0",
    "visionQueryTile": "0",
    "cachedRouterWeights": "false",
    "directReadHandles": "false",
    "compiledNormFinish": "false",
    "selectedTextAttention": "false",
    "ngramRingOrder": "false",
    "denseExpertLookup": "false",
    "sparsePoolPins": "false",
    "contiguousSlotWrites": "false",
    "wordSlotWrites": "false",
    "cpuSlotWrites": "false",
    "prefixCheckpointTokens": "0",
    "completePromptCheckpoint": "false"
  },
  "integration_assignments": {
    "compactStateWindows": "true",
    "compactMTPRow": "true",
    "compactNgramRows": "true",
    "automaticReadScope": "true",
    "visionQueryTile": "256",
    "skipUnusedFinalForward": "true",
    "valueOnlySamplerThreshold": "true",
    "deviceSamplerDraw": "true",
    "boundedOutputQueue": "true",
    "responsiveGovernor": "true",
    "prefixCheckpointTokens": "256",
    "completePromptCheckpoint": "true",
    "sharedRoPE": "true",
    "fusedRoPE": "true"
  },
  "automatic_dispatch_boundary": "Automatic read-scope policy may enable its bounded workspace prerequisites per eligible request; unselected base fields do not imply their code is unreachable. Existing memory/controller/shape fallback remains.",
  "fused_rotation_default_qualification": {
    "native_arm64": true,
    "model": "Mac17,9",
    "chip": "Apple M5 Pro",
    "os_build": "25G83",
    "otherwise": "shared-angle reference rotation; explicit diagnostic override remains available"
  },
  "retained_switch_disposition": "Keep qualified reference switches through initial adoption and one release, as the original unified execution rule requires. No release has occurred. Preserve public Codable controls and diagnostic APIs. Failed experimental controls remain explicit opt-in, absent from the selected family; they are not promoted by this closure. Remove eligible internal temporary switches only after that retention period, with API compatibility and hardware/shape dispatch preserved.",
  "selected_family_changed": false,
  "numerical_goldens_changed": false,
  "public_api_removed": false,
  "existing_evidence": [
    "V522 pure/CLI controls and override qualification",
    "V523 native/lifecycle/recovery and fallback qualification",
    "V529 public consumer source compatibility",
    "V587 complete original verification",
    "V585 installed upgrade/E2E/rollback"
  ],
  "remaining_before_activation": [
    "both original sustained cohorts",
    "empirical calibration and footprint envelope",
    "final measurement/claims/projection/source closure"
  ]
}

````````````
