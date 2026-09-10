---
type: run
id: 01m1wdrbep3mq75rk3783r5pef
created: 2026-09-06T22:34:50.710353+00:00
updated: 2026-09-06T22:34:51.017382+00:00
summary: V199 actual-default qualification preparation and V200 exact historical evidence recovery
binary: no native build or model execution
captured_at: 2026-09-06
command: unapplied activation draft; byte-exact restoration of three absent HEAD source records; dbmd index rebuild --layer sources
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: V199 actual-default qualification preparation and V200 exact historical evidence recovery
tool: source review; exact Git recovery; dbmd index and validation
---
V199 prepares, but does not apply, the eventual actual-default qualification change. Source review found that enabling automatic defaults only after the final explicitly controlled matrix would create a different source/binary identity and leave the deployed resolution path untested. The draft instead selects deploymentCandidate through environment resolution, selects row-backed embedding loading by default, preserves the explicit reference initializer and every override, and updates the two native assertions that currently require the public default to be off. A complete-prompt explicit-disable assertion is included. Comments describe the intended final behavior. All four before/after files are retained below; this is not live source, build or qualification evidence.

The activation sequence remains conditional on final independently measured candidate decisions and the context P5 source interval returning. Review/rebase the draft against that final family, build an isolated actual-default candidate, freeze the V195 workload/control contract before the first final paired cell, then execute native/fallback, all final paired/soak and full actual-default acceptance against that same identity. Promote exactly those tested source bytes and executable, without a subsequent untested default/arithmetic change. This avoids inferring deployed behavior from a predecessor's explicitly enabled controls. Prototype controls remain off unless independently qualified; no theoretical component savings become planner credit. No public default has been changed here.

V200 separately repairs a concrete evidence-closure omission. Three prior Hermes v0.2.8 acceptance sources were absent in the shared dirty tree before either the current optimization or context task began. The context task independently found explicit null entries in its initial baseline, no archived baseline bytes, no indexed IDs and no deletion/relocation explanation in the log. Their exact original blobs remain in shared Git HEAD cf5bc50c11aed8eb7b01f1d5d7b9270d1e20dc7d. With that source-owner agreement, only those three absent worktree paths were restored from HEAD; their original coordinates, IDs, frontmatter timestamps and body bytes are unchanged. The same SHA-256s match before and after native dbmd sources-index repair. Validation reports zero errors and the existing single historical log-kind warning. No ref, index staging, commit or publication changed. This recovers historical evidence; it does not qualify the current runtime.

Preserved originals: [[sources/runs/2026/09/2026-09-05-hermes-release-client-acceptance]], [[sources/runs/2026/09/2026-09-05-hermes-release-context-and-gates]], [[sources/runs/2026/09/2026-09-05-hermes-release-published-install]]. Their original raw bodies remain at those coordinates rather than being rewritten into this report. All143 runtime Source files and the unrun V198 queue remain unchanged. All build/model/performance/capacity/storage work is still held for transport's installed acceptance and explicit handback.


Artifact `/tmp/slotstream-optimization-execution/default-activation-preparation-v199/activation-draft.patch` — 5853 bytes; SHA-256 `08e43c099f8bfb5260d54bf7a17c7c45f319cd778a5024dd8754219509973495`.

````text
--- a/Sources/Slotstream/Optimizations.swift
+++ b/Sources/Slotstream/Optimizations.swift
@@ -1,7 +1,8 @@
 import Foundation
 
-/// Independent controls retained while each candidate is qualified. Defaults
-/// stay on the reference implementation until its acceptance gates pass.
+/// Explicit controls for independently evaluated execution paths. The public
+/// initializer is the reference; environment resolution selects the deployment
+/// family and applies explicit overrides. Experimental paths remain disabled.
 public struct InferenceOptimizations: Codable, Equatable {
     public var compactStateWindows = false
     public var compactMTPRow = false
@@ -76,8 +77,8 @@
 
     public init() {}
 
-    /// The next joint qualification candidate. Explicit selection only; this
-    /// does not change public initializer or environment defaults. Row-backed
+    /// Joint execution family used by deployment selection and its diagnostics.
+    /// The public initializer remains the explicit reference. Row-backed
     /// embeddings are selected independently at model construction.
     package static var integrationCandidate: Self {
         var result = Self()
@@ -95,10 +96,9 @@
         return result
     }
 
-    /// Candidate for eventual automatic selection after combined acceptance.
-    /// Public/environment defaults remain unchanged until that gate passes.
-    /// Explicit experimental controls and diagnostics can still qualify a new
-    /// platform; the kernel's initialization and shape fallbacks also apply.
+    /// Select the automatically deployed family with the measured kernel
+    /// qualification boundary. Explicit controls can qualify another platform;
+    /// kernel initialization and shape fallbacks also apply.
     package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
         var result = integrationCandidate
         result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
@@ -106,7 +106,7 @@
     }
 
     public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) throws -> Self {
-        try resolving(environment: env, defaults: Self())
+        try resolving(environment: env, defaults: deploymentCandidate())
     }
 
     /// Apply explicit overrides to a selected default family. Keeping this
--- a/Sources/Slotstream/Weights.swift
+++ b/Sources/Slotstream/Weights.swift
@@ -108,7 +108,7 @@
         // run/serve or they can silently stack underneath another model.
         try ModelProcessGuard.acquire()
         self.config = index.config
-        let setting = ProcessInfo.processInfo.environment["SLOTSTREAM_EMBEDDING_ROWS"] ?? "0"
+        let setting = ProcessInfo.processInfo.environment["SLOTSTREAM_EMBEDDING_ROWS"] ?? "1"
         guard setting == "0" || setting == "1" else { throw ModelError("SLOTSTREAM_EMBEDDING_ROWS must be 0 or 1") }
         let useRows = embeddingRowCache ?? (setting == "1")
         self.embeddingRows = useRows ? try EmbeddingRows(index: index) : nil
--- a/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift
@@ -21,7 +21,8 @@
         let sampler = FootprintSampler()
         let observed = sampler.finish()
         c.expect("footprint sampler includes endpoints", observed.samples >= 2 && observed.peakBytes > 0)
-        c.equal("reference optimization defaults", try InferenceOptimizations.environment([:]), InferenceOptimizations())
+        c.equal("automatic platform-qualified optimization defaults",
+            try InferenceOptimizations.environment([:]), InferenceOptimizations.deploymentCandidate())
         let qualified = OptimizationPlatform(machineModel: "Mac17,9", chip: "Apple M5 Pro",
             osBuild: "25G83", nativeARM64: true)
         c.equal("qualified platform keeps the complete joint candidate",
@@ -114,8 +115,8 @@
                     var value = scopedDefaults; value.readScopeTokens = 4096; return value
                 }()), scopedDefaults)
         let environmentFunction: ([String: String]) throws -> InferenceOptimizations = InferenceOptimizations.environment
-        c.equal("public environment function value keeps its signature and reference default",
-            try environmentFunction([:]), InferenceOptimizations())
+        c.equal("public environment function value keeps its signature and automatic default",
+            try environmentFunction([:]), InferenceOptimizations.deploymentCandidate())
         c.expect("typed override enables compaction", try InferenceOptimizations.environment([
             "SLOTSTREAM_OPT_COMPACT_STATE": "1"]).compactStateWindows)
         do {
--- a/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift
+++ b/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift
@@ -16,7 +16,9 @@
         options.prefixCheckpointTokens = 0
         var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
         var c = CheckBuilder("optimization-complete-prompt\(mtp ? "-mtp" : "")")
-        c.expect("complete prompt remains default off", try !InferenceOptimizations.environment([:]).completePromptCheckpoint)
+        c.expect("automatic complete prompt checkpoint is enabled", try InferenceOptimizations.environment([:]).completePromptCheckpoint)
+        c.expect("complete prompt checkpoint can be explicitly disabled",
+            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPLETE_PROMPT": "0"]).completePromptCheckpoint)
         c.expect("explicit complete prompt option", try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPLETE_PROMPT": "1"]).completePromptCheckpoint)
         func hash(_ a: MLXArray) -> String {
             "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"

````

Artifact `/tmp/slotstream-optimization-execution/default-activation-preparation-v199/after/Sources/Slotstream/Optimizations.swift` — 14171 bytes; SHA-256 `450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95`.

````text
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

    /// Joint execution family used by deployment selection and its diagnostics.
    /// The public initializer remains the explicit reference. Row-backed
    /// embeddings are selected independently at model construction.
    package static var integrationCandidate: Self {
        var result = Self()
        result.compactStateWindows = true
        result.compactMTPRow = true
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

````

Artifact `/tmp/slotstream-optimization-execution/default-activation-preparation-v199/after/Sources/Slotstream/Weights.swift` — 11340 bytes; SHA-256 `4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f`.

````text
// Resident weight loading and the quantized-linear primitive.
//
// Residents = everything except routed experts (switch_mlp) and the n-gram
// store shards; ~3.8 GB at 4-bit, loaded whole via MLX's safetensors reader.

import Foundation
import MLX

/// A linear layer read from the checkpoint: quantized (weight+scales+biases)
/// or plain bf16, decided by whether `<name>.scales` exists.
public struct QLinear {
    public let w: MLXArray
    public let scales: MLXArray?
    public let biases: MLXArray?
    public let groupSize: Int
    public let bits: Int

    package init(w: MLXArray, scales: MLXArray?, biases: MLXArray?, groupSize: Int, bits: Int) {
        self.w = w; self.scales = scales; self.biases = biases
        self.groupSize = groupSize; self.bits = bits
    }

    public var isQuantized: Bool { scales != nil }

    public func callAsFunction(_ x: MLXArray) -> MLXArray {
        if let s = scales {
            return quantizedMM(
                x, w, scales: s, biases: biases, transpose: true,
                groupSize: groupSize, bits: bits)
        }
        return matmul(x, w.transposed())
    }

    /// Keep the established row dispatch for a token-wise projection. Dummy
    /// rows are cropped before any sequence operation or cache update. This
    /// does not pad attention queries, recurrent steps, or logical token IDs.
    package func callAsFunction(_ x: MLXArray, minimumRows: Int) -> MLXArray {
        Self.withReferenceRows(x, minimumRows: minimumRows) { self($0) }
    }

    package static func withReferenceRows(_ x: MLXArray, minimumRows: Int,
                                          _ project: (MLXArray) -> MLXArray) -> MLXArray {
        let rows = x.size / x.dim(-1)
        guard rows > 0, rows < minimumRows, minimumRows <= 256 else { return project(x) }
        let flat = x.reshaped([rows, x.dim(-1)])
        let padded = concatenated([flat, broadcast(flat[(rows - 1)...],
            to: [minimumRows - rows, x.dim(-1)])], axis: 0)
        let output = project(padded)
        return output[0 ..< rows].reshaped(Array(x.shape.dropLast()) + [output.dim(-1)])
    }
}

/// Anything that can hand out named tensors from a checkpoint: the resident
/// trunk (ResidentWeights) or the MTP block's own file (MTPWeights). Layer
/// blocks are built against this so the MTP head can reuse them verbatim.
public protocol TensorSource: AnyObject {
    var config: ModelConfig { get }
    func optionalTensor(_ name: String) -> MLXArray?
}

extension TensorSource {
    public func has(_ name: String) -> Bool { optionalTensor(name) != nil }

    public func tensor(_ name: String) -> MLXArray {
        guard let a = optionalTensor(name) else { fatalError("missing tensor \(name)") }
        return a
    }

    public func linear(_ base: String, groupSize: Int? = nil, bits: Int? = nil) -> QLinear {
        let w = tensor(base + ".weight")
        let s = optionalTensor(base + ".scales")
        let b = optionalTensor(base + ".biases")
        return QLinear(
            w: w, scales: s, biases: b,
            groupSize: groupSize ?? config.qGroup, bits: bits ?? config.qBits)
    }
}

public final class ResidentWeights: TensorSource {
    public let arrays: [String: MLXArray]
    public let config: ModelConfig
    package let packedGDNProjections: [Int: PackedProjectionPair]
    public var packedGDNProjectionLayers: Int { packedGDNProjections.count }
    /// Shared backing already included in named resident tensors; not extra bytes.
    public var packedGDNProjectionPayloadBytes: Int {
        packedGDNProjections.values.reduce(0) { $0 + $1.payloadBytes }
    }
    private let embeddingRows: EmbeddingRows?
    public var usesEmbeddingRows: Bool { embeddingRows != nil }
    package var embeddingReadFault: ReadFault? {
        get { embeddingRows?.readFault }
        set { embeddingRows?.readFault = newValue }
    }
    package var embeddingRowHits: Int { embeddingRows?.uniqueRowHits ?? 0 }
    package var embeddingRowMisses: Int { embeddingRows?.uniqueRowMisses ?? 0 }
    package var embeddingCachedRows: Int { embeddingRows?.cachedRows ?? 0 }
    package var embeddingCachedPayloadBytes: Int { embeddingRows?.cachedPayloadBytes ?? 0 }
    package func clearEmbeddingRows() { embeddingRows?.clear() }

    public convenience init(index: CheckpointIndex, includeLayerExperts: Set<Int> = []) throws {
        try self.init(index: index, includeLayerExperts: includeLayerExperts, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, includeLayerExperts: Set<Int> = [], embeddingRowCache: Bool?,
                 packGDNProjections: Bool = false) throws {
        // Golden/debug commands can load the multi-GB resident trunk without
        // constructing Qwen4ExpModel. They need the same cross-process guard as
        // run/serve or they can silently stack underneath another model.
        try ModelProcessGuard.acquire()
        self.config = index.config
        let setting = ProcessInfo.processInfo.environment["SLOTSTREAM_EMBEDDING_ROWS"] ?? "1"
        guard setting == "0" || setting == "1" else { throw ModelError("SLOTSTREAM_EMBEDDING_ROWS must be 0 or 1") }
        let useRows = embeddingRowCache ?? (setting == "1")
        self.embeddingRows = useRows ? try EmbeddingRows(index: index) : nil
        var kept: [String: MLXArray] = [:]
        let files = Set(index.tensors.values.map { $0.file })
        for f in files.sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
            let all = try loadArrays(url: f)
            for (rawKey, arr) in all {
                var key = rawKey
                if key.hasPrefix("language_model.") { key.removeFirst("language_model.".count) }
                if key.hasPrefix("mtp.") || key.hasPrefix("vision_tower.") || key.hasPrefix("model.visual.") {
                    continue
                }
                if key.contains("ngram_embedding.shard_") { continue }
                if key.contains(".switch_mlp.") {
                    // routed experts stay on SSD unless explicitly requested (parity rig)
                    let isWanted = includeLayerExperts.contains { key.contains("model.layers.\($0).mlp.switch_mlp.") }
                    if !isWanted { continue }
                }
                kept[key] = arr
            }
        }
        var packed: [Int: PackedProjectionPair] = [:]
        if packGDNProjections {
            func projection(_ base: String) -> QLinear? {
                guard let weight = kept[base + ".weight"] else { return nil }
                return QLinear(w: weight, scales: kept[base + ".scales"], biases: kept[base + ".biases"],
                    groupSize: index.config.qGroup, bits: index.config.qBits)
            }
            for layer in config.layerTypes.indices where config.layerTypes[layer] == "linear_attention" {
                let base = "model.layers.\(layer).linear_attn"
                let a = base + ".in_proj_qkv", b = base + ".in_proj_z"
                guard let first = projection(a), let second = projection(b),
                      let pair = PackedProjectionPair(first, second) else { continue }
                for (name, view) in [(a, pair.first), (b, pair.second)] {
                    kept[name + ".weight"] = view.w
                    kept[name + ".scales"] = view.scales
                    kept[name + ".biases"] = view.biases
                }
                packed[layer] = pair
            }
        }
        self.packedGDNProjections = packed
        // Keep the public tensor dictionary complete. In the experimental row
        // path only lookup tensors stay lazy; explicit external tensor access
        // can still materialize their exact original values. No planner credit
        // is granted for this optional retention change.
        eval(kept.filter { !useRows || !EmbeddingRows.names.contains($0.key) }.map(\.value))
        self.arrays = kept
    }

    public func optionalTensor(_ name: String) -> MLXArray? { arrays[name] }

    /// Dequantized embedding rows for token ids: (B, S) -> (B, S, hidden).
    public func embed(_ ids: MLXArray) -> MLXArray {
        do { return try embedChecked(ids) }
        catch { preconditionFailure("embedding lookup failed: \(error)") }
    }

    /// Error-propagating companion for checked main/draft execution. Larger
    /// callers are split only for independent row lookup/dequantization; no
    /// model arithmetic or chronological prefill boundary is changed.
    public func embedChecked(_ ids: MLXArray) throws -> MLXArray {
        if let embeddingRows {
            guard [.uint8, .uint16, .uint32, .uint64, .int8, .int16, .int32, .int64].contains(ids.dtype) else {
                throw ModelError("embedding row IDs must be integers")
            }
            // Validate before narrowing: a large Int64 must not wrap onto a
            // different, apparently valid token ID.
            let values = ids.asType(.int64).asArray(Int64.self).map(Int.init)
            guard values.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
                throw ModelError("embedding row ID outside vocabulary")
            }
            return try gatherEmbeddingRows(values, shape: ids.shape, rows: embeddingRows)
        }
        let w = tensor("model.embed_tokens.weight")
        guard let s = arrays["model.embed_tokens.scales"] else {
            return take(w, ids, axis: 0)
        }
        let b = arrays["model.embed_tokens.biases"]
        let rows = take(w, ids, axis: 0)
        let rs = take(s, ids, axis: 0)
        let rb = b.map { take($0, ids, axis: 0) }
        return dequantized(
            rows, scales: rs, biases: rb, groupSize: config.qGroup, bits: config.qBits)
    }

    /// Main and draft callers already own CPU token IDs. Avoid uploading them
    /// merely to synchronize a cast/readback in the row-cache path.
    package func embedChecked(_ ids: [Int], shape: [Int]) throws -> MLXArray {
        guard ids.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
            throw ModelError("embedding row ID outside vocabulary")
        }
        if let embeddingRows { return try gatherEmbeddingRows(ids, shape: shape, rows: embeddingRows) }
        return try embedChecked(MLXArray(ids.map(Int32.init), shape))
    }

    private func gatherEmbeddingRows(_ values: [Int], shape: [Int], rows: EmbeddingRows) throws -> MLXArray {
        var count = 1
        for dim in shape {
            let next = count.multipliedReportingOverflow(by: dim)
            guard dim >= 0, dim <= Int(Int32.max), !next.overflow else {
                throw ModelError("invalid embedding lookup shape")
            }
            count = next.partialValue
        }
        guard count == values.count else { throw ModelError("embedding lookup shape does not match IDs") }
        if values.isEmpty { return MLXArray.zeros(shape + [config.hiddenSize], dtype: .bfloat16) }
        if values.count <= 4096 { return try rows.gather(values, shape: shape) }
        var parts: [MLXArray] = []
        for lo in stride(from: 0, to: values.count, by: 4096) {
            let end = min(values.count, lo + 4096)
            parts.append(try rows.gather(Array(values[lo ..< end]), shape: [end - lo]))
        }
        return concatenated(parts, axis: 0).reshaped(shape + [config.hiddenSize])
    }
}

````

Artifact `/tmp/slotstream-optimization-execution/default-activation-preparation-v199/after/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift` — 17254 bytes; SHA-256 `75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d`.

````text
import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationCompletePrompt(modelDir: URL, mtp: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let index = try CheckpointIndex(dir: modelDir)
        let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: true)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
        generator.speculationEnabled = mtp; generator.draftDepth = 1
        var options = InferenceOptimizations.integrationCandidate
        options.prefixCheckpointTokens = 0
        var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
        var c = CheckBuilder("optimization-complete-prompt\(mtp ? "-mtp" : "")")
        c.expect("automatic complete prompt checkpoint is enabled", try InferenceOptimizations.environment([:]).completePromptCheckpoint)
        c.expect("complete prompt checkpoint can be explicitly disabled",
            try !InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPLETE_PROMPT": "0"]).completePromptCheckpoint)
        c.expect("explicit complete prompt option", try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPLETE_PROMPT": "1"]).completePromptCheckpoint)
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        func stateAfter(_ cache: PrefixCache, _ ids: [Int], _ output: [Int], _ vision: VisionPrompt?) throws -> [String: String] {
            guard let hit = cache.take(matching: ids + output + [907], images: vision?.segments ?? []) else {
                throw ModelError("complete-prompt diagnostic lost consumed state")
            }
            var values = hit.state.prefixForkDiagnosticTensors().mapValues(hash)
            hit.state.invalidateMTP()
            values["continuedLogits"] = hash(try model.lastLogitsChecked([907], state: hit.state))
            return values
        }
        let tower = try VisionTower(index: index)
        let bytes = ["iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
                     "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA360e5gAAAABJRU5ErkJggg=="].map { Data(base64Encoded: $0)! }
        let images = try bytes.map { try VisionPreprocess.decodeCGImage($0) }
        let plans = try images.map { try tower.plan(for: $0) }
        func vision(_ start: Int?, color: Int = 0) -> VisionPrompt? {
            guard let start else { return nil }
            return VisionPrompt(tower: tower, items: [.init(image: images[color], plan: plans[color])],
                segments: [.init(start: start, count: plans[color].mergedTokens, hash: ImageHash(hashing: bytes[color]))],
                hiddenSize: model.cfg.hiddenSize)
        }
        let cases: [(Int, Int?)] = [(17, nil), (255, nil), (256, nil), (257, nil), (1025, nil),
            (273, 1), (273 + plans[0].mergedTokens, 256 - plans[0].mergedTokens / 2)]
        for (count, imageStart) in cases {
            let label = "\(count)/image=\(String(describing: imageStart))"
            FileHandle.standardError.write(Data("complete prompt \(label)\n".utf8))
            var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
            if let imageStart {
                ids.replaceSubrange(imageStart..<imageStart+plans[0].mergedTokens,
                    with: repeatElement(model.cfg.imageTokenId, count: plans[0].mergedTokens))
            }
            let referenceCache = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            let referenceVision = vision(imageStart)
            let reference = generator.generate(promptIds: ids, params: params, eosIds: [], cache: referenceCache, vision: referenceVision)
            c.expect("\(label): reference completes", reference.1.runtimeError == nil && reference.0.count == params.maxTokens)
            let expected = try stateAfter(referenceCache, ids, reference.0, referenceVision)
            referenceCache.drop()
            options.completePromptCheckpoint = true; model.optimizations = options
            let cache = PrefixCache(maxTokens: 8192)
            for attempt in 0..<3 {
                let vp = vision(imageStart)
                let result = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vp)
                c.expect("\(label)/\(attempt): completes", result.1.runtimeError == nil)
                c.equal("\(label)/\(attempt): exact output IDs", result.0, reference.0)
                c.equal("\(label)/\(attempt): complete hits", result.1.completePromptHits, attempt == 0 ? 0 : 1)
                c.equal("\(label)/\(attempt): prefill tokens", result.1.prefillTokens, attempt == 0 ? count : 0)
                c.equal("\(label)/\(attempt): reused tokens", result.1.reusedPrefixTokens, attempt == 0 ? 0 : count)
                c.equal("\(label)/\(attempt): retained prompts", cache.heldCheckpoints, 1)
                c.equal("\(label)/\(attempt): checkpoint errors", result.1.prefixCheckpointErrors, 0)
                if attempt > 0 {
                    c.equal("\(label)/\(attempt): no prefill records", result.1.prefillRecords, 0)
                    c.equal("\(label)/\(attempt): no prefill passes", result.1.prefillPasses, [])
                    c.equal("\(label)/\(attempt): tower skipped", result.1.encodedImages, 0)
                }
                c.equal("\(label)/\(attempt): all state and continued logits exact", try stateAfter(cache, ids, result.0, vp), expected)
            }
            c.expect("\(label): public API remains strictly extend-only", cache.take(matching: ids, images: vision(imageStart)?.segments ?? []) == nil)
            if imageStart != nil {
                let changed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vision(imageStart, color: 1))
                c.equal("\(label): changed pixels refuse reuse", changed.1.completePromptHits, 0)
                c.equal("\(label): changed pixels rebuild prompt", changed.1.prefillTokens, count)
            }
            if count == 17 {
                for filtered in [false, true] {
                    var sample = params; sample.temperature = 0.7
                    sample.topK = filtered ? 40 : 0; sample.topP = filtered ? 0.8 : 1
                    sample.minP = filtered ? 0.05 : 0; sample.presencePenalty = filtered ? 1.1 : 0
                    for seed: UInt64 in [7, 7_046_029_254_386_353_130] {
                        sample.seed = seed
                        let cold = generator.generate(promptIds: ids, params: sample, eosIds: [])
                        let hot = generator.generate(promptIds: ids, params: sample, eosIds: [], cache: cache)
                        c.equal("sample \(filtered)/\(seed): exact output", hot.0, cold.0)
                        c.equal("sample \(filtered)/\(seed): complete hit", hot.1.completePromptHits, 1)
                    }
                }
                // Public maxTokens <= 0 means "up to the response ceiling";
                // test zero emissions through cancellation, never by asking
                // this bounded diagnostic to generate 32,768 tokens.
                for limit in [1] {
                    var limited = params; limited.maxTokens = limit
                    let result = generator.generate(promptIds: ids, params: limited, eosIds: [], cache: cache)
                    c.equal("limit \(limit): exact output count", result.0.count, limit)
                    c.equal("limit \(limit): complete hit", result.1.completePromptHits, 1)
                }
                let noOutput = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    shouldContinue: { false })
                c.expect("cancel before first output is empty", noOutput.0.isEmpty && noOutput.1.finishReason == "cancelled" && noOutput.1.requestFailure?.code == .clientCancelled)
                c.equal("zero-emission cancellation reuses complete prompt", noOutput.1.completePromptHits, 1)
                let eos = generator.generate(promptIds: ids, params: params, eosIds: [reference.0[0]], cache: cache)
                c.expect("EOS stops without output", eos.0.isEmpty && eos.1.finishReason == "stop")
                var delivered: [Int] = []
                let stopped = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    onToken: { delivered.append($0); return delivered.count < 2 })
                c.equal("callback cancellation preserves exact prefix", stopped.0, Array(reference.0.prefix(2)))
                let retry = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("cancelled request preserves root", retry.0, reference.0)
                c.equal("retry avoids prefill", retry.1.prefillTokens, 0)
                let key = PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp)
                for wrongKey in [PromptCheckpointKey(model: UUID(), optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: 128, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: !mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: mtp, contextArithmetic: 0)] {
                    c.expect("wrong model, schedule, draft or arithmetic identity refuses complete hit",
                        cache.takeForGeneration(matching: ids, completePromptKey: wrongKey) == nil)
                }
                if let root = cache.takeForGeneration(matching: ids, completePromptKey: key), let raw = root.logits {
                    let rawHash = hash(raw)
                    let unit = PrefixCache.bytesPerToken
                    let stateCharge = max(ids.count, (root.state.allocatedSequenceBytes + unit - 1) / unit)
                    let logitCharge = (raw.nbytes + PrefixCache.logitStorageSlackBytes + unit - 1) / unit
                    let charge = stateCharge + logitCharge
                    for budget in [0, charge, 2 * charge - 1, 2 * charge] {
                        let bounded = PrefixCache(maxTokens: budget)
                        let stored = try bounded.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: ids.count + params.maxTokens, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: raw, vocabularySize: model.cfg.vocabSize, key: key)
                        c.equal("logits charged at budget \(budget)", stored, budget >= 2 * charge)
                        c.equal("exact charged capacity at budget \(budget)", bounded.json()["charged_token_capacity"] as? Int,
                            stored ? charge : 0)
                    }
                    let owned = PrefixCache(maxTokens: 8192)
                    c.expect("ownership checkpoint stored", try owned.storeCompletePrompt(state: root.state, tokens: ids,
                        reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                        logits: raw, vocabularySize: model.cfg.vocabSize, key: key))
                    raw[0] = MLXArray(Float(333))
                    if let first = owned.takeForGeneration(matching: ids, completePromptKey: key), let firstRow = first.logits {
                        c.equal("producer logit context cannot mutate retained row", hash(firstRow), rawHash)
                        firstRow[0] = MLXArray(Float(-333))
                    } else { c.expect("owned checkpoint remains readable", false) }
                    if let second = owned.takeForGeneration(matching: ids, completePromptKey: key), let secondRow = second.logits {
                        c.equal("returned logit context cannot mutate retained row", hash(secondRow), rawHash)
                    } else { c.expect("owned checkpoint remains repeatable", false) }
                    do {
                        _ = try owned.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: MLXArray.zeros([2], dtype: .bfloat16), vocabularySize: model.cfg.vocabSize, key: key)
                        c.expect("malformed logits rejected", false)
                    } catch { c.expect("malformed logits rejected", true) }
                    c.equal("invalid logits preserve existing checkpoint", owned.heldCheckpoints, 1)
                    owned.configure(maxTokens: 0)
                    c.equal("pressure releases state and logits", owned.heldTokens, 0)
                    c.equal("pressure preserves borrowed active state", root.state.tokenCount, count)
                } else { c.expect("complete root exposes logits for ownership checks", false) }
                Stream.gpu.synchronize()
                model.pool.unpinAll()
                try model.pool.diagnosticDiscardResidency()
                let fault = ReadFault(afterJobs: 0); model.pool.readFault = fault
                let failed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                model.pool.readFault = nil
                c.expect("decode read fault fires after complete reuse", fault.hasFired && failed.1.runtimeError != nil)
                c.equal("failed decode reused the prompt", failed.1.completePromptHits, 1)
                let recovered = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("decode failure preserves exact reusable root", recovered.0, reference.0)
                c.equal("read-failure retry avoids prefill", recovered.1.prefillTokens, 0)
                var edited = ids; edited[0] += 1
                let edit = generator.generate(promptIds: edited, params: params, eosIds: [], cache: cache)
                c.equal("edited token misses", edit.1.reusedPrefixTokens, 0)
                let auxiliary = generator.generate(promptIds: [17, 23, 31], params: params, eosIds: [], cache: cache)
                c.expect("auxiliary completes", auxiliary.1.runtimeError == nil)
                let interleaved = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("interleaved output remains exact", interleaved.0, reference.0)
                c.expect("charged capacity stays bounded", (cache.json()["charged_token_capacity"] as? Int ?? Int.max) <= cache.maxTokens)
            }
            cache.drop()
        }
        if mtp {
            let ids = (0..<17).map { 1000 + $0 * 79 }
            let transition = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            generator.speculationEnabled = false
            let plain = generator.generate(promptIds: ids, params: params, eosIds: [], cache: transition)
            c.expect("draft transition seed succeeds", plain.1.runtimeError == nil)
            guard let consumed = transition.peek(extending: ids) else { throw ModelError("draft transition lost exact consumed IDs") }
            let extended = consumed + [907]
            options.completePromptCheckpoint = true; model.optimizations = options
            generator.speculationEnabled = true
            let fallback = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("plain cached state finishes current request plain", fallback.1.verifyPasses, 0)
            c.equal("plain-to-draft transition really reused state", fallback.1.reusedPrefixTokens, consumed.count)
            let rebuilt = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("complete prompt with missing head is not an MTP hit", rebuilt.1.completePromptHits, 0)
            c.equal("missing draft head is rebuilt from the full prompt", rebuilt.1.prefillTokens, extended.count)
            c.expect("rebuilt draft participates", rebuilt.1.verifyPasses > 0)
            let hot = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("rebuilt draft checkpoint can be reused completely", hot.1.completePromptHits, 1)
            c.equal("reused draft output is exact", hot.0, rebuilt.0)
        }
        c.measure("end_physical_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}

````

Artifact `/tmp/slotstream-optimization-execution/default-activation-preparation-v199/after/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift` — 18311 bytes; SHA-256 `3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6`.

````text
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
        c.equal("automatic platform-qualified optimization defaults",
            try InferenceOptimizations.environment([:]), InferenceOptimizations.deploymentCandidate())
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
        c.equal("public environment function value keeps its signature and automatic default",
            try environmentFunction([:]), InferenceOptimizations.deploymentCandidate())
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

````

Artifact `/tmp/slotstream-optimization-execution/default-activation-preparation-v199/before/Sources/Slotstream/Optimizations.swift` — 14169 bytes; SHA-256 `3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55`.

````text
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

````

Artifact `/tmp/slotstream-optimization-execution/default-activation-preparation-v199/before/Sources/Slotstream/Weights.swift` — 11340 bytes; SHA-256 `27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b`.

````text
// Resident weight loading and the quantized-linear primitive.
//
// Residents = everything except routed experts (switch_mlp) and the n-gram
// store shards; ~3.8 GB at 4-bit, loaded whole via MLX's safetensors reader.

import Foundation
import MLX

/// A linear layer read from the checkpoint: quantized (weight+scales+biases)
/// or plain bf16, decided by whether `<name>.scales` exists.
public struct QLinear {
    public let w: MLXArray
    public let scales: MLXArray?
    public let biases: MLXArray?
    public let groupSize: Int
    public let bits: Int

    package init(w: MLXArray, scales: MLXArray?, biases: MLXArray?, groupSize: Int, bits: Int) {
        self.w = w; self.scales = scales; self.biases = biases
        self.groupSize = groupSize; self.bits = bits
    }

    public var isQuantized: Bool { scales != nil }

    public func callAsFunction(_ x: MLXArray) -> MLXArray {
        if let s = scales {
            return quantizedMM(
                x, w, scales: s, biases: biases, transpose: true,
                groupSize: groupSize, bits: bits)
        }
        return matmul(x, w.transposed())
    }

    /// Keep the established row dispatch for a token-wise projection. Dummy
    /// rows are cropped before any sequence operation or cache update. This
    /// does not pad attention queries, recurrent steps, or logical token IDs.
    package func callAsFunction(_ x: MLXArray, minimumRows: Int) -> MLXArray {
        Self.withReferenceRows(x, minimumRows: minimumRows) { self($0) }
    }

    package static func withReferenceRows(_ x: MLXArray, minimumRows: Int,
                                          _ project: (MLXArray) -> MLXArray) -> MLXArray {
        let rows = x.size / x.dim(-1)
        guard rows > 0, rows < minimumRows, minimumRows <= 256 else { return project(x) }
        let flat = x.reshaped([rows, x.dim(-1)])
        let padded = concatenated([flat, broadcast(flat[(rows - 1)...],
            to: [minimumRows - rows, x.dim(-1)])], axis: 0)
        let output = project(padded)
        return output[0 ..< rows].reshaped(Array(x.shape.dropLast()) + [output.dim(-1)])
    }
}

/// Anything that can hand out named tensors from a checkpoint: the resident
/// trunk (ResidentWeights) or the MTP block's own file (MTPWeights). Layer
/// blocks are built against this so the MTP head can reuse them verbatim.
public protocol TensorSource: AnyObject {
    var config: ModelConfig { get }
    func optionalTensor(_ name: String) -> MLXArray?
}

extension TensorSource {
    public func has(_ name: String) -> Bool { optionalTensor(name) != nil }

    public func tensor(_ name: String) -> MLXArray {
        guard let a = optionalTensor(name) else { fatalError("missing tensor \(name)") }
        return a
    }

    public func linear(_ base: String, groupSize: Int? = nil, bits: Int? = nil) -> QLinear {
        let w = tensor(base + ".weight")
        let s = optionalTensor(base + ".scales")
        let b = optionalTensor(base + ".biases")
        return QLinear(
            w: w, scales: s, biases: b,
            groupSize: groupSize ?? config.qGroup, bits: bits ?? config.qBits)
    }
}

public final class ResidentWeights: TensorSource {
    public let arrays: [String: MLXArray]
    public let config: ModelConfig
    package let packedGDNProjections: [Int: PackedProjectionPair]
    public var packedGDNProjectionLayers: Int { packedGDNProjections.count }
    /// Shared backing already included in named resident tensors; not extra bytes.
    public var packedGDNProjectionPayloadBytes: Int {
        packedGDNProjections.values.reduce(0) { $0 + $1.payloadBytes }
    }
    private let embeddingRows: EmbeddingRows?
    public var usesEmbeddingRows: Bool { embeddingRows != nil }
    package var embeddingReadFault: ReadFault? {
        get { embeddingRows?.readFault }
        set { embeddingRows?.readFault = newValue }
    }
    package var embeddingRowHits: Int { embeddingRows?.uniqueRowHits ?? 0 }
    package var embeddingRowMisses: Int { embeddingRows?.uniqueRowMisses ?? 0 }
    package var embeddingCachedRows: Int { embeddingRows?.cachedRows ?? 0 }
    package var embeddingCachedPayloadBytes: Int { embeddingRows?.cachedPayloadBytes ?? 0 }
    package func clearEmbeddingRows() { embeddingRows?.clear() }

    public convenience init(index: CheckpointIndex, includeLayerExperts: Set<Int> = []) throws {
        try self.init(index: index, includeLayerExperts: includeLayerExperts, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, includeLayerExperts: Set<Int> = [], embeddingRowCache: Bool?,
                 packGDNProjections: Bool = false) throws {
        // Golden/debug commands can load the multi-GB resident trunk without
        // constructing Qwen4ExpModel. They need the same cross-process guard as
        // run/serve or they can silently stack underneath another model.
        try ModelProcessGuard.acquire()
        self.config = index.config
        let setting = ProcessInfo.processInfo.environment["SLOTSTREAM_EMBEDDING_ROWS"] ?? "0"
        guard setting == "0" || setting == "1" else { throw ModelError("SLOTSTREAM_EMBEDDING_ROWS must be 0 or 1") }
        let useRows = embeddingRowCache ?? (setting == "1")
        self.embeddingRows = useRows ? try EmbeddingRows(index: index) : nil
        var kept: [String: MLXArray] = [:]
        let files = Set(index.tensors.values.map { $0.file })
        for f in files.sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
            let all = try loadArrays(url: f)
            for (rawKey, arr) in all {
                var key = rawKey
                if key.hasPrefix("language_model.") { key.removeFirst("language_model.".count) }
                if key.hasPrefix("mtp.") || key.hasPrefix("vision_tower.") || key.hasPrefix("model.visual.") {
                    continue
                }
                if key.contains("ngram_embedding.shard_") { continue }
                if key.contains(".switch_mlp.") {
                    // routed experts stay on SSD unless explicitly requested (parity rig)
                    let isWanted = includeLayerExperts.contains { key.contains("model.layers.\($0).mlp.switch_mlp.") }
                    if !isWanted { continue }
                }
                kept[key] = arr
            }
        }
        var packed: [Int: PackedProjectionPair] = [:]
        if packGDNProjections {
            func projection(_ base: String) -> QLinear? {
                guard let weight = kept[base + ".weight"] else { return nil }
                return QLinear(w: weight, scales: kept[base + ".scales"], biases: kept[base + ".biases"],
                    groupSize: index.config.qGroup, bits: index.config.qBits)
            }
            for layer in config.layerTypes.indices where config.layerTypes[layer] == "linear_attention" {
                let base = "model.layers.\(layer).linear_attn"
                let a = base + ".in_proj_qkv", b = base + ".in_proj_z"
                guard let first = projection(a), let second = projection(b),
                      let pair = PackedProjectionPair(first, second) else { continue }
                for (name, view) in [(a, pair.first), (b, pair.second)] {
                    kept[name + ".weight"] = view.w
                    kept[name + ".scales"] = view.scales
                    kept[name + ".biases"] = view.biases
                }
                packed[layer] = pair
            }
        }
        self.packedGDNProjections = packed
        // Keep the public tensor dictionary complete. In the experimental row
        // path only lookup tensors stay lazy; explicit external tensor access
        // can still materialize their exact original values. No planner credit
        // is granted for this optional retention change.
        eval(kept.filter { !useRows || !EmbeddingRows.names.contains($0.key) }.map(\.value))
        self.arrays = kept
    }

    public func optionalTensor(_ name: String) -> MLXArray? { arrays[name] }

    /// Dequantized embedding rows for token ids: (B, S) -> (B, S, hidden).
    public func embed(_ ids: MLXArray) -> MLXArray {
        do { return try embedChecked(ids) }
        catch { preconditionFailure("embedding lookup failed: \(error)") }
    }

    /// Error-propagating companion for checked main/draft execution. Larger
    /// callers are split only for independent row lookup/dequantization; no
    /// model arithmetic or chronological prefill boundary is changed.
    public func embedChecked(_ ids: MLXArray) throws -> MLXArray {
        if let embeddingRows {
            guard [.uint8, .uint16, .uint32, .uint64, .int8, .int16, .int32, .int64].contains(ids.dtype) else {
                throw ModelError("embedding row IDs must be integers")
            }
            // Validate before narrowing: a large Int64 must not wrap onto a
            // different, apparently valid token ID.
            let values = ids.asType(.int64).asArray(Int64.self).map(Int.init)
            guard values.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
                throw ModelError("embedding row ID outside vocabulary")
            }
            return try gatherEmbeddingRows(values, shape: ids.shape, rows: embeddingRows)
        }
        let w = tensor("model.embed_tokens.weight")
        guard let s = arrays["model.embed_tokens.scales"] else {
            return take(w, ids, axis: 0)
        }
        let b = arrays["model.embed_tokens.biases"]
        let rows = take(w, ids, axis: 0)
        let rs = take(s, ids, axis: 0)
        let rb = b.map { take($0, ids, axis: 0) }
        return dequantized(
            rows, scales: rs, biases: rb, groupSize: config.qGroup, bits: config.qBits)
    }

    /// Main and draft callers already own CPU token IDs. Avoid uploading them
    /// merely to synchronize a cast/readback in the row-cache path.
    package func embedChecked(_ ids: [Int], shape: [Int]) throws -> MLXArray {
        guard ids.allSatisfy({ $0 >= 0 && $0 < config.vocabSize }) else {
            throw ModelError("embedding row ID outside vocabulary")
        }
        if let embeddingRows { return try gatherEmbeddingRows(ids, shape: shape, rows: embeddingRows) }
        return try embedChecked(MLXArray(ids.map(Int32.init), shape))
    }

    private func gatherEmbeddingRows(_ values: [Int], shape: [Int], rows: EmbeddingRows) throws -> MLXArray {
        var count = 1
        for dim in shape {
            let next = count.multipliedReportingOverflow(by: dim)
            guard dim >= 0, dim <= Int(Int32.max), !next.overflow else {
                throw ModelError("invalid embedding lookup shape")
            }
            count = next.partialValue
        }
        guard count == values.count else { throw ModelError("embedding lookup shape does not match IDs") }
        if values.isEmpty { return MLXArray.zeros(shape + [config.hiddenSize], dtype: .bfloat16) }
        if values.count <= 4096 { return try rows.gather(values, shape: shape) }
        var parts: [MLXArray] = []
        for lo in stride(from: 0, to: values.count, by: 4096) {
            let end = min(values.count, lo + 4096)
            parts.append(try rows.gather(Array(values[lo ..< end]), shape: [end - lo]))
        }
        return concatenated(parts, axis: 0).reshaped(shape + [config.hiddenSize])
    }
}

````

Artifact `/tmp/slotstream-optimization-execution/default-activation-preparation-v199/before/Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift` — 17050 bytes; SHA-256 `0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da`.

````text
import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationCompletePrompt(modelDir: URL, mtp: Bool) throws -> CheckReport {
        MLX.Memory.cacheLimit = 128 << 20
        let index = try CheckpointIndex(dir: modelDir)
        let model = try Qwen4ExpModel(index: index, poolSlots: 640, embeddingRowCache: true)
        if mtp { try model.enableMTP(modelDir: modelDir) }
        let generator = Generator(model: model)
        generator.prefillChunk = 256; generator.prefillCacheLimit = 64 << 20
        generator.speculationEnabled = mtp; generator.draftDepth = 1
        var options = InferenceOptimizations.integrationCandidate
        options.prefixCheckpointTokens = 0
        var params = SampleParams.greedy; params.maxTokens = 4; params.seed = 7
        var c = CheckBuilder("optimization-complete-prompt\(mtp ? "-mtp" : "")")
        c.expect("complete prompt remains default off", try !InferenceOptimizations.environment([:]).completePromptCheckpoint)
        c.expect("explicit complete prompt option", try InferenceOptimizations.environment(["SLOTSTREAM_OPT_COMPLETE_PROMPT": "1"]).completePromptCheckpoint)
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        func stateAfter(_ cache: PrefixCache, _ ids: [Int], _ output: [Int], _ vision: VisionPrompt?) throws -> [String: String] {
            guard let hit = cache.take(matching: ids + output + [907], images: vision?.segments ?? []) else {
                throw ModelError("complete-prompt diagnostic lost consumed state")
            }
            var values = hit.state.prefixForkDiagnosticTensors().mapValues(hash)
            hit.state.invalidateMTP()
            values["continuedLogits"] = hash(try model.lastLogitsChecked([907], state: hit.state))
            return values
        }
        let tower = try VisionTower(index: index)
        let bytes = ["iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==",
                     "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA360e5gAAAABJRU5ErkJggg=="].map { Data(base64Encoded: $0)! }
        let images = try bytes.map { try VisionPreprocess.decodeCGImage($0) }
        let plans = try images.map { try tower.plan(for: $0) }
        func vision(_ start: Int?, color: Int = 0) -> VisionPrompt? {
            guard let start else { return nil }
            return VisionPrompt(tower: tower, items: [.init(image: images[color], plan: plans[color])],
                segments: [.init(start: start, count: plans[color].mergedTokens, hash: ImageHash(hashing: bytes[color]))],
                hiddenSize: model.cfg.hiddenSize)
        }
        let cases: [(Int, Int?)] = [(17, nil), (255, nil), (256, nil), (257, nil), (1025, nil),
            (273, 1), (273 + plans[0].mergedTokens, 256 - plans[0].mergedTokens / 2)]
        for (count, imageStart) in cases {
            let label = "\(count)/image=\(String(describing: imageStart))"
            FileHandle.standardError.write(Data("complete prompt \(label)\n".utf8))
            var ids = (0..<count).map { 1000 + ($0 * 79) % 190_000 }
            if let imageStart {
                ids.replaceSubrange(imageStart..<imageStart+plans[0].mergedTokens,
                    with: repeatElement(model.cfg.imageTokenId, count: plans[0].mergedTokens))
            }
            let referenceCache = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            let referenceVision = vision(imageStart)
            let reference = generator.generate(promptIds: ids, params: params, eosIds: [], cache: referenceCache, vision: referenceVision)
            c.expect("\(label): reference completes", reference.1.runtimeError == nil && reference.0.count == params.maxTokens)
            let expected = try stateAfter(referenceCache, ids, reference.0, referenceVision)
            referenceCache.drop()
            options.completePromptCheckpoint = true; model.optimizations = options
            let cache = PrefixCache(maxTokens: 8192)
            for attempt in 0..<3 {
                let vp = vision(imageStart)
                let result = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vp)
                c.expect("\(label)/\(attempt): completes", result.1.runtimeError == nil)
                c.equal("\(label)/\(attempt): exact output IDs", result.0, reference.0)
                c.equal("\(label)/\(attempt): complete hits", result.1.completePromptHits, attempt == 0 ? 0 : 1)
                c.equal("\(label)/\(attempt): prefill tokens", result.1.prefillTokens, attempt == 0 ? count : 0)
                c.equal("\(label)/\(attempt): reused tokens", result.1.reusedPrefixTokens, attempt == 0 ? 0 : count)
                c.equal("\(label)/\(attempt): retained prompts", cache.heldCheckpoints, 1)
                c.equal("\(label)/\(attempt): checkpoint errors", result.1.prefixCheckpointErrors, 0)
                if attempt > 0 {
                    c.equal("\(label)/\(attempt): no prefill records", result.1.prefillRecords, 0)
                    c.equal("\(label)/\(attempt): no prefill passes", result.1.prefillPasses, [])
                    c.equal("\(label)/\(attempt): tower skipped", result.1.encodedImages, 0)
                }
                c.equal("\(label)/\(attempt): all state and continued logits exact", try stateAfter(cache, ids, result.0, vp), expected)
            }
            c.expect("\(label): public API remains strictly extend-only", cache.take(matching: ids, images: vision(imageStart)?.segments ?? []) == nil)
            if imageStart != nil {
                let changed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache, vision: vision(imageStart, color: 1))
                c.equal("\(label): changed pixels refuse reuse", changed.1.completePromptHits, 0)
                c.equal("\(label): changed pixels rebuild prompt", changed.1.prefillTokens, count)
            }
            if count == 17 {
                for filtered in [false, true] {
                    var sample = params; sample.temperature = 0.7
                    sample.topK = filtered ? 40 : 0; sample.topP = filtered ? 0.8 : 1
                    sample.minP = filtered ? 0.05 : 0; sample.presencePenalty = filtered ? 1.1 : 0
                    for seed: UInt64 in [7, 7_046_029_254_386_353_130] {
                        sample.seed = seed
                        let cold = generator.generate(promptIds: ids, params: sample, eosIds: [])
                        let hot = generator.generate(promptIds: ids, params: sample, eosIds: [], cache: cache)
                        c.equal("sample \(filtered)/\(seed): exact output", hot.0, cold.0)
                        c.equal("sample \(filtered)/\(seed): complete hit", hot.1.completePromptHits, 1)
                    }
                }
                // Public maxTokens <= 0 means "up to the response ceiling";
                // test zero emissions through cancellation, never by asking
                // this bounded diagnostic to generate 32,768 tokens.
                for limit in [1] {
                    var limited = params; limited.maxTokens = limit
                    let result = generator.generate(promptIds: ids, params: limited, eosIds: [], cache: cache)
                    c.equal("limit \(limit): exact output count", result.0.count, limit)
                    c.equal("limit \(limit): complete hit", result.1.completePromptHits, 1)
                }
                let noOutput = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    shouldContinue: { false })
                c.expect("cancel before first output is empty", noOutput.0.isEmpty && noOutput.1.finishReason == "cancelled" && noOutput.1.requestFailure?.code == .clientCancelled)
                c.equal("zero-emission cancellation reuses complete prompt", noOutput.1.completePromptHits, 1)
                let eos = generator.generate(promptIds: ids, params: params, eosIds: [reference.0[0]], cache: cache)
                c.expect("EOS stops without output", eos.0.isEmpty && eos.1.finishReason == "stop")
                var delivered: [Int] = []
                let stopped = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache,
                    onToken: { delivered.append($0); return delivered.count < 2 })
                c.equal("callback cancellation preserves exact prefix", stopped.0, Array(reference.0.prefix(2)))
                let retry = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("cancelled request preserves root", retry.0, reference.0)
                c.equal("retry avoids prefill", retry.1.prefillTokens, 0)
                let key = PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp)
                for wrongKey in [PromptCheckpointKey(model: UUID(), optimizations: model.optimizations,
                    prefillChunk: generator.prefillChunk, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: 128, mtp: mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: !mtp),
                    PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                        prefillChunk: generator.prefillChunk, mtp: mtp, contextArithmetic: 0)] {
                    c.expect("wrong model, schedule, draft or arithmetic identity refuses complete hit",
                        cache.takeForGeneration(matching: ids, completePromptKey: wrongKey) == nil)
                }
                if let root = cache.takeForGeneration(matching: ids, completePromptKey: key), let raw = root.logits {
                    let rawHash = hash(raw)
                    let unit = PrefixCache.bytesPerToken
                    let stateCharge = max(ids.count, (root.state.allocatedSequenceBytes + unit - 1) / unit)
                    let logitCharge = (raw.nbytes + PrefixCache.logitStorageSlackBytes + unit - 1) / unit
                    let charge = stateCharge + logitCharge
                    for budget in [0, charge, 2 * charge - 1, 2 * charge] {
                        let bounded = PrefixCache(maxTokens: budget)
                        let stored = try bounded.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: ids.count + params.maxTokens, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: raw, vocabularySize: model.cfg.vocabSize, key: key)
                        c.equal("logits charged at budget \(budget)", stored, budget >= 2 * charge)
                        c.equal("exact charged capacity at budget \(budget)", bounded.json()["charged_token_capacity"] as? Int,
                            stored ? charge : 0)
                    }
                    let owned = PrefixCache(maxTokens: 8192)
                    c.expect("ownership checkpoint stored", try owned.storeCompletePrompt(state: root.state, tokens: ids,
                        reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                        logits: raw, vocabularySize: model.cfg.vocabSize, key: key))
                    raw[0] = MLXArray(Float(333))
                    if let first = owned.takeForGeneration(matching: ids, completePromptKey: key), let firstRow = first.logits {
                        c.equal("producer logit context cannot mutate retained row", hash(firstRow), rawHash)
                        firstRow[0] = MLXArray(Float(-333))
                    } else { c.expect("owned checkpoint remains readable", false) }
                    if let second = owned.takeForGeneration(matching: ids, completePromptKey: key), let secondRow = second.logits {
                        c.equal("returned logit context cannot mutate retained row", hash(secondRow), rawHash)
                    } else { c.expect("owned checkpoint remains repeatable", false) }
                    do {
                        _ = try owned.storeCompletePrompt(state: root.state, tokens: ids,
                            reserveTokens: 4096, reserveSequenceBytes: root.state.allocatedSequenceBytes,
                            logits: MLXArray.zeros([2], dtype: .bfloat16), vocabularySize: model.cfg.vocabSize, key: key)
                        c.expect("malformed logits rejected", false)
                    } catch { c.expect("malformed logits rejected", true) }
                    c.equal("invalid logits preserve existing checkpoint", owned.heldCheckpoints, 1)
                    owned.configure(maxTokens: 0)
                    c.equal("pressure releases state and logits", owned.heldTokens, 0)
                    c.equal("pressure preserves borrowed active state", root.state.tokenCount, count)
                } else { c.expect("complete root exposes logits for ownership checks", false) }
                Stream.gpu.synchronize()
                model.pool.unpinAll()
                try model.pool.diagnosticDiscardResidency()
                let fault = ReadFault(afterJobs: 0); model.pool.readFault = fault
                let failed = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                model.pool.readFault = nil
                c.expect("decode read fault fires after complete reuse", fault.hasFired && failed.1.runtimeError != nil)
                c.equal("failed decode reused the prompt", failed.1.completePromptHits, 1)
                let recovered = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("decode failure preserves exact reusable root", recovered.0, reference.0)
                c.equal("read-failure retry avoids prefill", recovered.1.prefillTokens, 0)
                var edited = ids; edited[0] += 1
                let edit = generator.generate(promptIds: edited, params: params, eosIds: [], cache: cache)
                c.equal("edited token misses", edit.1.reusedPrefixTokens, 0)
                let auxiliary = generator.generate(promptIds: [17, 23, 31], params: params, eosIds: [], cache: cache)
                c.expect("auxiliary completes", auxiliary.1.runtimeError == nil)
                let interleaved = generator.generate(promptIds: ids, params: params, eosIds: [], cache: cache)
                c.equal("interleaved output remains exact", interleaved.0, reference.0)
                c.expect("charged capacity stays bounded", (cache.json()["charged_token_capacity"] as? Int ?? Int.max) <= cache.maxTokens)
            }
            cache.drop()
        }
        if mtp {
            let ids = (0..<17).map { 1000 + $0 * 79 }
            let transition = PrefixCache(maxTokens: 8192)
            options.completePromptCheckpoint = false; model.optimizations = options
            generator.speculationEnabled = false
            let plain = generator.generate(promptIds: ids, params: params, eosIds: [], cache: transition)
            c.expect("draft transition seed succeeds", plain.1.runtimeError == nil)
            guard let consumed = transition.peek(extending: ids) else { throw ModelError("draft transition lost exact consumed IDs") }
            let extended = consumed + [907]
            options.completePromptCheckpoint = true; model.optimizations = options
            generator.speculationEnabled = true
            let fallback = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("plain cached state finishes current request plain", fallback.1.verifyPasses, 0)
            c.equal("plain-to-draft transition really reused state", fallback.1.reusedPrefixTokens, consumed.count)
            let rebuilt = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("complete prompt with missing head is not an MTP hit", rebuilt.1.completePromptHits, 0)
            c.equal("missing draft head is rebuilt from the full prompt", rebuilt.1.prefillTokens, extended.count)
            c.expect("rebuilt draft participates", rebuilt.1.verifyPasses > 0)
            let hot = generator.generate(promptIds: extended, params: params, eosIds: [], cache: transition)
            c.equal("rebuilt draft checkpoint can be reused completely", hot.1.completePromptHits, 1)
            c.equal("reused draft output is exact", hot.0, rebuilt.0)
        }
        c.measure("end_physical_bytes", Double(ProcessMemory.residentBytes()))
        return c.report()
    }
}

````

Artifact `/tmp/slotstream-optimization-execution/default-activation-preparation-v199/before/Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift` — 18240 bytes; SHA-256 `06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29`.

````text
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

````

Artifact `/tmp/slotstream-optimization-execution/default-activation-preparation-v199/manifest.json` — 2576 bytes; SHA-256 `14e0f29375e9eb00c251fa728cf6d34e7e72888c6830a95a98c035cb9cba6f7d`.

````text
{
  "state": "UNAPPLIED, UNBUILT, UNQUALIFIED PREPARATION ONLY",
  "files": [
    {
      "path": "Sources/Slotstream/Optimizations.swift",
      "before_sha256": "3960a8320118df500bebcd60ed84f879532d21831f05b0b58a73ca9bd596da55",
      "draft_after_sha256": "450d07494a5cc12568c82cb1a330ce1613e30a0e93efdc97597d687c36d8fc95"
    },
    {
      "path": "Sources/Slotstream/Weights.swift",
      "before_sha256": "27ac2c307f2fbb5cc33822d1fedc6847db4c32f7c33cb71a5a10e561cd902c4b",
      "draft_after_sha256": "4c6112412f38192de1955bedb6b7f3cddcb2d0b338b570b6b688df4638a55e5f"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+Runtime.swift",
      "before_sha256": "06da1150cccc0c47328d4c189c562ca77f716726b7f041585f45c43244132f29",
      "draft_after_sha256": "3c61121e89651dd6bb0ca41cef832612a2f1601e55cab3adebb4e0489a3da1a6"
    },
    {
      "path": "Sources/SlotstreamDiagnostics/Diagnostics+CompletePrompt.swift",
      "before_sha256": "0166555aba0d15daf7a0570607978e4c341aec9ab430f5ce3bc25e3370f149da",
      "draft_after_sha256": "75cdd2137b2856407d2fb297504039b174b3ae116b40608d5f42fabf0237a66d"
    }
  ],
  "does_not_change_live_defaults": true,
  "dependencies": [
    "All optional candidates have their frozen measured dispositions",
    "P5 context qualification has returned its unchanged source interval",
    "Review/rebase this draft against final selected integrationCandidate and source",
    "Build actual-default candidate in isolated source snapshot; explicit all-off reference must still be available",
    "Freeze V195 full workload/control contract against that same actual-default candidate BEFORE final7paired studies",
    "Run all native/fallback/reference/overlay checks on that exact candidate",
    "Run final7paired studies, actual-default serve smoke, bounded soaks, full acceptance and calibration/artifact checks",
    "Promote exact tested source/build; no post-qualification arithmetic/default edit can borrow older identity"
  ],
  "limits": [
    "Initializer InferenceOptimizations() remains explicit reference",
    "48 boolean and numeric overrides must restore reference exactly",
    "Only fused RoPE uses measured Mac17,9/Apple M5 Pro/25G83 nativeARM64 automatic dispatch; other platforms take original rotation",
    "Do not sum separate component speedups or spend theoretical memory credits",
    "Default activation must not be folded into context P5 frozen executable",
    "Prototype controls remain default-off unless their own gate passes; final control documentation/disposition is separate"
  ]
}

````

Artifact `/tmp/slotstream-optimization-execution/historical-evidence-recovery-v200/index-repair.json` — 41 bytes; SHA-256 `787f38734ca430818b5106bdeb19d5234d4dca04a751c4456fcbb8078f49190e`.

````text
{"rebuilt":true,"scope":"layer sources"}

````

Artifact `/tmp/slotstream-optimization-execution/historical-evidence-recovery-v200/receipt.json` — 1548 bytes; SHA-256 `cc39905d73551ddf6d4a2891c3cc36db128324cbb463fff1eb39fe90d12471ff`.

````text
{
  "restored_at_unix": 1788733933.896298,
  "head": "cf5bc50c11aed8eb7b01f1d5d7b9270d1e20dc7d",
  "rows": [
    {
      "path": "db/sources/runs/2026/09/2026-09-05-hermes-release-client-acceptance.md",
      "original_bytes": 55033,
      "original_sha256": "6362bb1743aa8bce4cfc2c0243ba6ac76044f876bdc4d50c839bde3664808639",
      "before_present": false,
      "restored_sha256": "6362bb1743aa8bce4cfc2c0243ba6ac76044f876bdc4d50c839bde3664808639"
    },
    {
      "path": "db/sources/runs/2026/09/2026-09-05-hermes-release-context-and-gates.md",
      "original_bytes": 30225,
      "original_sha256": "53acb972f7fbfa2cb26dfcb21b94740a293100afa245f7de34240d7b4915ea06",
      "before_present": false,
      "restored_sha256": "53acb972f7fbfa2cb26dfcb21b94740a293100afa245f7de34240d7b4915ea06"
    },
    {
      "path": "db/sources/runs/2026/09/2026-09-05-hermes-release-published-install.md",
      "original_bytes": 19052,
      "original_sha256": "2041c243b2c6e2e6ca3ab5b680a3d954ed806faf97190854d4c49d43872ea403",
      "before_present": false,
      "restored_sha256": "2041c243b2c6e2e6ca3ab5b680a3d954ed806faf97190854d4c49d43872ea403"
    }
  ],
  "git_stdout": "",
  "git_stderr": "",
  "restoration": "Exact original worktree bytes only; no record authoring/frontmatter restamp, index staging, ref change or publication",
  "reason": "Pre-existing absence in both task baselines, no known intentional relocation; context owner independently confirms restoration appropriate. Original source coordinates/IDs/timestamps are retained."
}

````

Artifact `/tmp/slotstream-optimization-execution/historical-evidence-recovery-v200/validation.json` — 482 bytes; SHA-256 `e70856bf9026f95af1d1c941e733a43a4deac372d8426ce715e49c52c3228996`.

````text
{
  "issues": [
    {
      "code": "LOG_UNKNOWN_KIND",
      "file": "log.md",
      "key": null,
      "line": 124,
      "message": "log entry kind `change` is not recognized",
      "related": [],
      "severity": "warning",
      "suggestion": "use one of: ingest, create, update, delete, rename, link, validate, index-rebuild, contradiction"
    }
  ],
  "scope": "all",
  "store": "db",
  "summary": {
    "errors": 0,
    "info": 0,
    "total": 1,
    "warnings": 1
  }
}

````
