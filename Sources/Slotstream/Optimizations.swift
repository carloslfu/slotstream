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
    /// Upstream MLX fused D256 prefill, independently qualified from the
    /// experimental selected-block kernel. Nil retains backend heuristics.
    /// Optional so older serialized settings remain decodable.
    public var fusedPrefillAttention: Bool? = nil
    /// Allocation accounting for the supported fused BF16 path. Deployment
    /// enables it with qualified fusion; nil keeps the original reserve for
    /// explicit reference settings and older serialized control sets.
    public var fusedPrefillWorkspace: Bool? = nil
    /// Diagnostic override of automatic read grouping. Nil lets the runtime
    /// select the bound from the actual attention path and key extent.
    public var automaticReadScopeLimit: Int? = nil
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
    /// Continue a retained conversation only from a state this request would
    /// have built itself, so a cached turn computes what a cold one does.
    ///
    /// Without it a turn resumes whatever state the previous turn left: its
    /// prompt read in passes, its reply decoded one token at a time. That is
    /// not what reading those same ids computes, and the difference can cross
    /// a token boundary (see `PrefixResumeRule`). With it the engine resumes
    /// only at its own prefill pass boundaries and re-reads the rest.
    /// Optional so control sets saved before this existed decode unchanged;
    /// nil is the original behavior.
    public var alignedPrefixResume: Bool? = nil

    /// Does this request have to reproduce a fresh read of its prompt?
    public var resumesOnPassBoundaries: Bool { alignedPrefixResume == true }
    /// Expert Lookahead raw-staging prefetch (experimental, off by default).
    /// `expertPrefetchShadow` runs forecasts without reads to price overhead.
    /// Optional so control sets saved before the experiment decode unchanged.
    public var expertPrefetch: Bool? = nil
    public var expertPrefetchShadow: Bool? = nil
    /// Speculative verify attention: the three-to-eight-row pass goes through
    /// the vector kernel two rows at a time from the measured context
    /// crossover instead of the dense kernel, whose cost grows with the
    /// context. In the deployment family. `verifySplitMinContext` overrides
    /// the measured threshold (keys; zero engages at any context). With
    /// `rowInvariantProjection` the split becomes the exact mode's attention,
    /// one call per row from two rows up. Optional so control sets saved
    /// before the path decode unchanged.
    public var verifySplitAttention: Bool? = nil
    public var verifySplitMinContext: Int? = nil
    /// Row-invariant small projections (router, inject weights, and dense or
    /// quantized QLinear) for passes of one to eight rows. With the split
    /// verify attention it selects the exact mode, in which a verify pass of
    /// up to `MultiRowAttention.exactMaxRows` rows reproduces the one-row
    /// passes of this mode bit for bit. It changes plain decode's rounding as
    /// well.
    public var rowInvariantProjection: Bool? = nil

    public var readScopeEnabled: Bool {
        readScopeTokens > 0 && layerExpertWorkspace && compactStateWindows
            && compactMTPRow && boundedIndexer && boundedPLE
    }

    public init() {}

    /// Arithmetic-preserving base used by deployment and exact diagnostics.
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
        result.alignedPrefixResume = true
        result.sharedRoPE = true
        result.fusedRoPE = true
        result.verifySplitAttention = true
        return result
    }

    /// Select the automatically deployed family with the measured kernel
    /// qualification boundary. Explicit controls can qualify another platform;
    /// kernel initialization and shape fallbacks also apply.
    package static func deploymentCandidate(on platform: OptimizationPlatform = .current) -> Self {
        var result = integrationCandidate
        result.fusedRoPE = result.fusedRoPE && platform.qualifiedPartialRotation
        result.fusedPrefillAttention = platform.qualifiedFusedPrefill ? true : nil
        result.fusedPrefillWorkspace = result.fusedPrefillAttention
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
        result.fusedPrefillAttention = try flag("SLOTSTREAM_OPT_FUSED_PREFILL",
            fallback: result.fusedPrefillAttention == true) ? true : nil
        result.fusedPrefillWorkspace = try flag("SLOTSTREAM_OPT_FUSED_WORKSPACE",
            fallback: result.fusedPrefillWorkspace == true) ? true : nil
        let automaticScopeLimitKey = "SLOTSTREAM_OPT_AUTO_SCOPE_LIMIT"
        recognized.insert(automaticScopeLimitKey)
        if let value = env[automaticScopeLimitKey] {
            guard let count = Int(value), [8192, 16384].contains(count) else {
                throw ModelError("\(automaticScopeLimitKey) must be 8192 or 16384")
            }
            result.automaticReadScopeLimit = count
        }
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
        result.alignedPrefixResume = try flag("SLOTSTREAM_OPT_ALIGNED_RESUME",
            fallback: result.alignedPrefixResume ?? false) ? true : nil
        result.cachedRouterWeights = try flag("SLOTSTREAM_OPT_ROUTER_WEIGHTS", fallback: result.cachedRouterWeights)
        result.expertPrefetch = try flag("SLOTSTREAM_OPT_EXPERT_PREFETCH", fallback: result.expertPrefetch ?? false) ? true : nil
        result.expertPrefetchShadow = try flag("SLOTSTREAM_OPT_EXPERT_PREFETCH_SHADOW", fallback: result.expertPrefetchShadow ?? false) ? true : nil
        guard !(result.expertPrefetch == true && result.expertPrefetchShadow == true) else {
            throw ModelError("EXPERT_PREFETCH and EXPERT_PREFETCH_SHADOW are mutually exclusive")
        }
        result.verifySplitAttention = try flag("SLOTSTREAM_OPT_VERIFY_SPLIT", fallback: result.verifySplitAttention ?? false) ? true : nil
        let splitContextKey = "SLOTSTREAM_OPT_VERIFY_SPLIT_CONTEXT"
        recognized.insert(splitContextKey)
        if let value = env[splitContextKey] {
            guard let n = Int(value), n >= 0, n <= ContextPolicy.modelLimit else {
                throw ModelError("\(splitContextKey) must be a key count from 0 to \(ContextPolicy.modelLimit)")
            }
            result.verifySplitMinContext = n
        }
        result.rowInvariantProjection = try flag("SLOTSTREAM_OPT_ROW_INVARIANT", fallback: result.rowInvariantProjection ?? false) ? true : nil
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
