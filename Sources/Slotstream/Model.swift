// Qwen4Exp model assembly: 48 layers of (GDN | QSA) + MoE with
// hyper-connection residuals, PLE injection at the configured layer, and the
// final mixer + lm_head. Streams experts (SlotPool) and n-gram rows (NgramStore).

import Foundation
import MLX

public final class Qwen4ExpModel {
    /// All recurrent state and complete-prompt logits belong to this loaded model, even
    /// when another model has the same vocabulary and cache geometry.
    package let promptCheckpointIdentity = UUID()
    public let cfg: ModelConfig
    public let resident: ResidentWeights
    /// The reduced prefill reserve is qualified only for the maintained BF16
    /// trunk. A different weight dtype must keep the original allocation even
    /// when the attention dispatcher subsequently chooses its fallback.
    package lazy var hasBF16PrefillWeights: Bool = resident.arrays.values.allSatisfy {
        !$0.dtype.isFloatingPoint || $0.dtype == .bfloat16
    }
    public let pool: SlotPool
    public let ngram: NgramStore
    public var optimizations: InferenceOptimizations
    /// Only the bounded long-context prefill path selects this arithmetic.
    /// Kept outside the independent optimization candidate bundle.
    package var smallPrefillSweep = false
    package var smallPrefillReferenceStart = 0
    package var smallPrefillReferenceEnd = ContextPolicy.modelLimit
    package var alignSmallReferenceDispatch = false
    package var stableSmallPrefillRouting = false
    package var stableSmallPrefillAttention = false
    package var stableSmallPrefillProjections = false
    public var paddedSmallKeyDomains: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallKeyDomains } }
    public var paddedSmallQueryRows: Int { qsa.values.reduce(0) { $0 + $1.paddedSmallQueryRows } }
    public var smallPrefillSweeps: Int { moe.values.reduce(0) { $0 + $1.smallPrefillSweeps } }
    public var residentExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.residentPrelaunches } }
    public var residentExpertJoins: Int { moe.values.reduce(0) { $0 + $1.residentJoins } }
    public var residentExpertJoinSeconds: Double { moe.values.reduce(0) { $0 + $1.residentJoinSeconds } }
    public var sharedExpertPrelaunches: Int { moe.values.reduce(0) { $0 + $1.sharedPrelaunches } }
    public var indexerSpecializedRows: Int { qsa.values.reduce(0) { $0 + $1.indexer.specializedRows } }
    private var routerCacheConfigured = false
    public var cachedRouterBytes: Int {
        moe.values.reduce(0) { $0 + $1.routerProjection.cachedBytes }
            + (mtpHead?.moe.routerProjection.cachedBytes ?? 0)
    }

    /// Request entry calls this before a cached MTP draft can advance. Direct
    /// model callers also prepare before touching main recurrent state.
    public var compiledNormFinishes: Int {
        (attnHC + mlpHC + [mixer]).reduce(0) { $0 + $1.compiledFinishes }
    }
    public var readHandleCount: Int { pool.readHandleCount + ngram.readHandleCount }
    public var selectedAttentionTiles: Int {
        qsa.values.reduce(0) { $0 + $1.selectedAttentionTiles } + (mtpHead?.attn.selectedAttentionTiles ?? 0)
    }
    /// Scheduled upstream fused prefill tiles; evaluated results prove completion.
    public var fusedPrefillAttentionTiles: Int {
        qsa.values.reduce(0) { $0 + $1.fusedPrefillAttentionTiles } + (mtpHead?.attn.fusedPrefillAttentionTiles ?? 0)
    }
    /// Multi-row verify passes (per attention layer) that took the split or exact vector-kernel path.
    public var multiRowSplits: Int {
        qsa.values.reduce(0) { $0 + $1.multiRowSplits } + (mtpHead?.attn.multiRowSplits ?? 0)
    }
    public private(set) var terminalQueryRowsSkipped = 0
    public private(set) var terminalMoERowsSkipped = 0
    private enum HiddenDemand { case fullMulti, stateOnly, lastRow }
    private var compiledNormConfigured = false
    /// Lazy dispatch counters; GPU completion is established by evaluated outputs,
    /// never inferred from these scheduled-operation counts alone.
    public var fusedRoPERotationsScheduled: Int { rope.fusedRotationsScheduled }
    public var ropeTableHits: Int { rope.tableHits }
    public var ropeTableBuilds: Int { rope.tableBuilds }
    public var fusedGDNProjectionsScheduled: Int { gdn.values.reduce(0) { $0 + $1.fusedProjectionsScheduled } }
    func prepareOptimizationKernels(using executionOptions: InferenceOptimizations? = nil) {
        let optimizations = executionOptions ?? self.optimizations
        for layer in gdn.values { layer.fuseInputProjection = optimizations.fusedGDNProjection }
        rope.sharedTables = optimizations.sharedRoPE
        rope.fusedRotation = optimizations.fusedRoPE && PartialRotation.prepare()
        let selected = optimizations.selectedTextAttention && SelectedAttention.prepare()
        for layer in qsa.values { layer.selectedAttention = selected }
        mtpHead?.attn.selectedAttention = selected
        let fused = optimizations.fusedPrefillAttention == true && FusedPrefillAttention.available
        for layer in qsa.values { layer.fusedPrefillAttention = fused }
        mtpHead?.attn.fusedPrefillAttention = fused
        pool.directReadHandles = optimizations.directReadHandles
        ngram.directReadHandles = optimizations.directReadHandles
        let compiledNorm = optimizations.compiledNormFinish && CompiledArithmetic.prepare()
        if compiledNorm != compiledNormConfigured {
            for unit in attnHC + mlpHC + [mixer] { unit.compiledNormFinish = compiledNorm }
            compiledNormConfigured = compiledNorm
        }
        mtpHead?.attnHC.compiledNormFinish = compiledNorm
        mtpHead?.mlpHC.compiledNormFinish = compiledNorm
        mtpHead?.mixer.compiledNormFinish = compiledNorm
        let multiRow = MultiRowAttention.mode(
            splitAttention: optimizations.verifySplitAttention, rowInvariant: optimizations.rowInvariantProjection)
        let multiRowContext = optimizations.verifySplitMinContext ?? MultiRowAttention.defaultMinContext
        for layer in qsa.values { layer.multiRowMode = multiRow; layer.multiRowMinContext = multiRowContext }
        mtpHead?.attn.multiRowMode = multiRow
        mtpHead?.attn.multiRowMinContext = multiRowContext
        RowInvariantMatmul.enabled = optimizations.rowInvariantProjection == true
        ngram.ringEvictionOrder = optimizations.ngramRingOrder
        pool.denseLookup = optimizations.denseExpertLookup
        pool.sparsePinClearing = optimizations.sparsePoolPins
        pool.contiguousSlotWrites = optimizations.contiguousSlotWrites
        pool.wordSlotWrites = optimizations.wordSlotWrites
        pool.cpuSlotWrites = optimizations.cpuSlotWrites
        pool.layerLocalFloorEviction = optimizations.layerLocalFloorCache
        if routerCacheConfigured != optimizations.cachedRouterWeights {
            for layer in moe.values { layer.routerProjection.configure(cached: optimizations.cachedRouterWeights) }
            routerCacheConfigured = optimizations.cachedRouterWeights
        }
        mtpHead?.moe.routerProjection.configure(cached: optimizations.cachedRouterWeights)
        if optimizations.routerTopK { RouterSelection.prepare() }
        if optimizations.indexerBlockTopK { BlockSelection.prepare() }
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
    }

    let rope: Rope
    var gdn: [Int: GDNLayer] = [:]
    var qsa: [Int: QSAAttention] = [:]
    var moe: [Int: MoELayer] = [:]
    /// Work deferred between decode barriers until the next routing readback.
    private let routingReadbacks = RoutingReadbackQueue()
    var attnHC: [GatedResidual] = []
    var mlpHC: [GatedResidual] = []
    var ple: [Int: PLELayer] = [:]
    let mixer: GatedResidual
    let lmHead: QLinear
    /// The optional MTP draft head for self-speculative decode; loaded from
    /// mtp.safetensors on demand (`enableMTP`), everything resident.
    public private(set) var mtpHead: MTPHead? = nil
    /// Diagnostic observer; called on the serialized model thread with router-rank IDs.
    public var routerObserver: ((Int, [Int32]) -> Void)? {
        didSet { rebuildRouterObserver() }
    }
    package var contextNumericsObserver: ((Int, String, MLXArray) -> Void)?
    /// Expert Lookahead session: capture observer and/or prefetch scheduler.
    /// Nil leaves every hot path exactly as before: no closure, no copy.
    package var lookahead: ExpertLookaheadSession? {
        didSet { pool.lookahead = lookahead; rebuildRouterObserver() }
    }
    /// What the MoE layers actually call: the public observer composed with
    /// the lookahead session's route feed, rebuilt only when either changes.
    private var combinedRouterObserver: ((Int, [Int32]) -> Void)?
    private func rebuildRouterObserver() {
        let external = routerObserver
        guard let session = lookahead, session.isActive else { combinedRouterObserver = external; return }
        let topK = cfg.topK
        combinedRouterObserver = { layer, ids in
            external?(layer, ids)
            session.routes(layer: layer, rows: topK > 0 ? ids.count / topK : 0, topK: topK, ids: ids)
        }
    }
    package var gdnPhaseProfile: GDNPhaseProfile? {
        didSet { for layer in gdn.values { layer.phaseProfile = gdnPhaseProfile } }
    }
    public let runLayers: Int  // truncated for parity rigs; numLayers normally
    /// Layers between GPU barriers in the layer loop. One reproduces the
    /// original path exactly. Higher values defer the drain and rely on
    /// multi-generation pinning to keep an unevaluated gather's slots out of
    /// every victim scan; a pass that cannot afford those pins drains at every
    /// layer (`DecodeLookahead.barrierPeriod`). The engine selects four with the
    /// qualified decode lookahead unless the environment names a period.
    package var decodeBarrierLayers = Qwen4ExpModel.environmentBarrierLayers ?? 1

    public final class State {
        var modelIdentity: UUID?
        package var ownerModelIdentity: UUID? { modelIdentity }
        let checkpointIdentity = UUID()
        var checkpointLifetimes: [WeakStateCheckpointLifetime] = []
        var recordingEnabled = false
        var recordedTokenIds: [Int]?
        var recordingBaseTokenCount: Int?
        var linear: [Int: LinearCache] = [:]
        var kv: [Int: KVCache] = [:]
        var indexer: [Int: IndexerCache] = [:]
        var ngramCtx: [Int64] = []
        public var tokenCount = 0
        // A failed low-level forward can change early layers while tokenCount
        // still names the preceding boundary. Count alone cannot certify reuse.
        var committedBoundaryValid = true
        /// Speculative-decode companions, created lazily by the MTP-aware
        /// generate path: the draft head's own attention state, and the
        /// pre-mixer multi stream at the last consumed position (the next
        /// draft step's hidden input). They ride the prefix cache with the
        /// rest of the state so conversations keep their draft context.
        public var mtp: MTPState?
        public var lastMulti: MLXArray?
        /// A draft pointer alone is insufficient: plain inference may have
        /// advanced the main prefix since the draft cache was last updated.
        public var hasValidMTP: Bool {
            guard let row = lastMulti, row.ndim == 3, row.dim(0) == 1, row.dim(1) == 1 else { return false }
            return mtp?.isAligned(withConsumedTokens: tokenCount) == true
        }
        public func invalidateMTP() { mtp = nil; lastMulti = nil }
        /// Allocated sequence buffers, including unused capacity after trim.
        /// Recurrent state, convolution windows and allocator cache are separate.
        public var allocatedSequenceBytes: Int {
            kv.values.reduce(0) { $0 + $1.allocatedBytes }
                + indexer.values.reduce(0) { $0 + $1.allocatedBytes }
                + (mtp.map { $0.kv.allocatedBytes + $0.indexer.allocatedBytes } ?? 0)
        }
        var compactStateWindows = false
        /// The persisted head whose rows this state's committed rows equal,
        /// set when a persistent prefix tier writes or restores the state.
        /// A rewind below its boundary clears it (PersistentPrefixCache).
        package var persistedLineage: PersistentPrefixLineage?
        public init() {}
    }

    public convenience init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil) throws {
        try self.init(index: index, poolSlots: poolSlots, runLayers: runLayers, embeddingRowCache: nil)
    }

    package init(index: CheckpointIndex, poolSlots: Int, runLayers: Int? = nil, embeddingRowCache: Bool?,
                 packGDNProjections: Bool? = nil) throws {
        self.optimizations = try InferenceOptimizations.environment()
        try ModelProcessGuard.acquire()
        self.cfg = index.config
        let selectedLayers = runLayers ?? index.config.numLayers
        guard selectedLayers >= 1, selectedLayers <= index.config.numLayers else {
            throw ModelError(
                "layer count must be between 1 and \(index.config.numLayers), got \(selectedLayers)")
        }
        guard poolSlots >= 1, poolSlots <= Geometry.totalRecords else {
            throw ModelError(
                "expert-pool slot count must be between 1 and \(Geometry.totalRecords), got \(poolSlots)")
        }
        self.runLayers = selectedLayers
        let store = try ExpertStore(index: index)
        // Reject a wrong/custom checkpoint before allocating the 3.8 GB
        // resident trunk or the expert pool.
        try Geometry.check(against: index.config, recordBytes: store.recordBytes)
        // Explicit experimental startup path: full-file verification precedes
        // resident/pool allocation. Default construction needs no repack.
        if let path = ProcessInfo.processInfo.environment["SLOTSTREAM_EXPERT_LAYOUT"] {
            guard !path.isEmpty else { throw ModelError("SLOTSTREAM_EXPERT_LAYOUT must name a packed artifact directory") }
            let report = try store.loadPackedLayout(at:URL(fileURLWithPath:path,isDirectory:true))
            fputs("[expert-layout] verified \(report.bytes) bytes in \(report.seconds) s\n",stderr)
        }
        // parity rigs keep the truncated layers' experts resident? no — pool serves them
        self.resident = try ResidentWeights(index: index, embeddingRowCache: embeddingRowCache,
            packGDNProjections: packGDNProjections ?? optimizations.fusedGDNProjection)
        self.pool = SlotPool(slots: poolSlots, store: store)
        self.ngram = NgramStore(index: index, resident: resident)
        self.rope = Rope(dim: cfg.rotaryDim, base: cfg.ropeTheta)

        for l in 0 ..< self.runLayers {
            let base = "model.layers.\(l)"
            if cfg.layerTypes[l] == "linear_attention" {
                gdn[l] = GDNLayer(resident, layer: l)
            } else {
                qsa[l] = QSAAttention(resident, layer: l)
            }
            moe[l] = MoELayer(resident, layer: l, pool: pool)
            attnHC.append(GatedResidual(resident, base: base + ".attn_hyper_connection", useCombine: true))
            mlpHC.append(GatedResidual(resident, base: base + ".mlp_hyper_connection", useCombine: true))
            if cfg.pleLayerIndices.contains(l) {
                ple[l] = PLELayer(resident, layer: l, store: ngram)
            }
        }
        if Self.debugDir != nil { attnHC[0].debugName = "hc0" }
        mixer = GatedResidual(resident, base: "model.hyper_connection_mixer", useCombine: false)
        lmHead = resident.linear("lm_head")
    }

    /// The model's rotary embedding (the MTP head shares it).
    public var sharedRope: Rope { rope }

    /// lm_head applied to a draft-head sample hidden — the draft's logits.
    public func draftLogits(_ sample: MLXArray) -> MLXArray { lmHead(sample) }

    /// Load the MTP draft head (1.5 GB resident). Idempotent; throws when
    /// mtp.safetensors is absent.
    public func enableMTP(modelDir: URL) throws {
        guard mtpHead == nil else { return }
        mtpHead = MTPHead(try MTPWeights(modelDir: modelDir, config: cfg))
    }

    /// Conservative capacity needed before a request grows its sequence
    /// caches. Charges allocation steps, completed-block storage and the draft
    /// head when it may be used; it performs no allocation or GPU evaluation.
    public func sequenceCapacityBytes(tokens: Int, mtp: Bool) -> Int {
        let layers = cfg.layerTypes.prefix(runLayers).filter { $0 != "linear_attention" }.count + (mtp ? 1 : 0)
        let rowBytes = (2 * cfg.numKVHeads * cfg.headDim + cfg.indexerHeadDim) * 2
        return ContextGeometry.capacityBytes(tokens: tokens, layers: layers, rowBytes: rowBytes,
            pooledRowBytes: cfg.indexerHeadDim * 2, compressionRatio: cfg.indexerCompressRatio,
            indexerBudget: cfg.indexerBudget, incrementalIndexer: optimizations.incrementalIndexer)
    }

    /// Bound the next physical sequence allocations, keeping main, draft,
    /// raw-indexer and pooled-indexer capacity separate. Rollback retains spare
    /// rows, but they can only be reused by the buffer that actually owns them.
    package func sequenceAllocationBytes(tokens: Int, draftTokens: Int?, state: State,
                                         sharedBacking: Bool = false) -> Int {
        guard tokens >= 0, tokens <= ContextPolicy.modelLimit,
              draftTokens.map({ $0 >= 0 && $0 <= ContextPolicy.modelLimit }) ?? true else { return Int.max }
        let kvRowBytes = ContextBytes.product(cfg.numKVHeads, cfg.headDim, 2)
        let indexRowBytes = ContextBytes.product(cfg.indexerHeadDim, 2)
        func bytes(_ end: Int, kv: KVCache?, index: IndexerCache?, compact: Bool) -> Int {
            func replacement(_ count: Int, _ rowBytes: Int, _ owned: Int, step: Int = 1024) -> Int {
                ContextGeometry.nextBufferAllocationBytes(tokens: count, rowBytes: rowBytes,
                    allocatedBytes: sharedBacking ? 0 : owned, step: step)
            }
            let rawBase = index?.rawBase ?? 0
            guard end >= rawBase else { return Int.max }
            var result = ContextBytes.sum(
                replacement(end, kvRowBytes, kv?.keys?.nbytes ?? 0),
                replacement(end, kvRowBytes, kv?.values?.nbytes ?? 0),
                replacement(end - rawBase, indexRowBytes, index?.rawAllocatedBytes ?? 0,
                    step: compact && rawBase > 0 ? 256 : 1024))
            if end > cfg.indexerBudget, optimizations.incrementalIndexer || compact {
                let blocks = end / cfg.indexerCompressRatio
                result = ContextBytes.sum(result, replacement(blocks, indexRowBytes,
                    index?.pooledAllocatedBytes ?? 0, step: 256))
                if compact {
                    let first = min(blocks * cfg.indexerCompressRatio,
                        max(0, end - 32) / cfg.indexerCompressRatio * cfg.indexerCompressRatio)
                    if first - rawBase >= 256 {
                        // Compaction also creates a fresh small tail before
                        // releasing its parent; it is not a pre-allocation credit.
                        result = ContextBytes.sum(result, replacement(end - first, indexRowBytes, 0, step: 256))
                    }
                }
            }
            return result
        }
        var total = 0
        for layer in 0 ..< runLayers where cfg.layerTypes[layer] != "linear_attention" {
            let index = state.indexer[layer]
            total = ContextBytes.sum(total, bytes(tokens, kv: state.kv[layer], index: index,
                compact: index?.compactRaw ?? optimizations.compactIndexerRaw))
        }
        if let draftTokens {
            total = ContextBytes.sum(total, bytes(draftTokens, kv: state.mtp?.kv,
                index: state.mtp?.indexer, compact: state.mtp?.indexer.compactRaw ?? false))
        }
        return total
    }

    public func makeState() -> State {
        let s = State()
        s.modelIdentity = promptCheckpointIdentity
        s.ngramCtx = Array(repeating: Int64(cfg.eosTokenId), count: cfg.ngramSize - 1)
        for l in 0 ..< runLayers {
            if cfg.layerTypes[l] == "linear_attention" {
                s.linear[l] = LinearCache()
            } else {
                s.kv[l] = KVCache()
                s.indexer[l] = IndexerCache(compactRaw: optimizations.compactIndexerRaw)
            }
        }
        return s
    }

    /// One forward pass over `ids` (1, S). Returns final hidden (1, S, hidden).
    /// `perLayerHook` (parity rigs) receives the hyper-width h after each layer.
    /// Read once: ProcessInfo builds a fresh dictionary on every access, and
    /// this used to run 48 times per token.
    /// An explicit SLOTSTREAM_DECODE_BARRIER_LAYERS (1...48), parsed once; nil
    /// when unset or invalid.
    package static let environmentBarrierLayers: Int? = {
        guard let raw = ProcessInfo.processInfo.environment["SLOTSTREAM_DECODE_BARRIER_LAYERS"],
              let value = Int(raw), (1 ... 48).contains(value) else { return nil }
        return value
    }()

    static let debugDir = ProcessInfo.processInfo.environment["SS_DEBUG_DIR"]
    static let debugLayer = Int(ProcessInfo.processInfo.environment["SS_DEBUG_LAYER"] ?? "0") ?? 0

    static func debugDump(_ name: String, _ arr: MLXArray) {
        guard let dir = debugDir else { return }
        let v = arr.asType(.float32).asArray(Float.self)
        let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
        try? FileManager.default.createDirectory(atPath: dir, withIntermediateDirectories: true)
        try? d.write(to: URL(fileURLWithPath: dir).appendingPathComponent(name + ".bin"))
    }

    /// Replace the embeddings under each placeholder run with the tower's rows.
    ///
    /// The template expands one `<|image_pad|>` per image into a run of them,
    /// so what has to happen is a substitution of contiguous spans — which is
    /// what this does, entirely on the GPU. The first version copied the whole
    /// hidden to the CPU as float32, looped over `S × hidden` scalars, and
    /// uploaded it again, on every prefill pass of every vision request. It
    /// also scanned the ids for placeholders and, when the count disagreed with
    /// the rows it was given, logged a line and continued with unspliced
    /// placeholder embeddings — a silently wrong answer. A run carries its own
    /// rows, so the two cannot disagree; a wrong offset is a programming error
    /// and stops here.
    public static func spliceVision(
        _ h: MLXArray, runs: [VisionRun], length S: Int, hidden: Int
    ) -> MLXArray {
        var pieces: [MLXArray] = []
        var cursor = 0
        for run in runs.sorted(by: { $0.start < $1.start }) {
            precondition(
                run.start >= cursor && run.end <= S,
                "vision run \(run.start)..<\(run.end) outside 0..<\(S) or overlapping")
            if run.start > cursor { pieces.append(h[0..., cursor ..< run.start, 0...]) }
            pieces.append(run.rows.reshaped([1, run.count, hidden]).asType(h.dtype))
            cursor = run.end
        }
        if cursor < S { pieces.append(h[0..., cursor ..< S, 0...]) }
        return pieces.count == 1 ? pieces[0] : concatenated(pieces, axis: 1)
    }

    public func hiddenStates(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) -> MLXArray {
        checkpointCompatibility { try hiddenStatesChecked(ids, state: state, vision: vision, perLayerHook: perLayerHook) }
    }

    /// A read error may leave this caller-owned state partially advanced.
    /// Discard it or restore a prior checkpoint before any reuse. Generator
    /// performs that cleanup for its checked forward calls.
    public func hiddenStatesChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        let h = try hiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)
        return mixScope(h)
    }

    private func hiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil
    ) throws -> MLXArray {
        try runHiddenMulti(ids, state: state, vision: vision, perLayerHook: perLayerHook)!
    }

    private func validateForward(_ ids: [Int], state: State) throws {
        guard !ids.isEmpty, ids.allSatisfy({ $0 >= 0 && $0 < cfg.vocabSize }) else {
            throw ModelError("model forward requires a nonempty sequence of valid token IDs")
        }
        guard state.committedBoundaryValid else {
            throw ModelError("model state has an incomplete forward; restore a committed checkpoint or create a new state")
        }
        // State() and tokenCount are public API. Reject an uninitialized,
        // incompatible or offset-corrupted state before changing any cache;
        // otherwise QSA's required cache access can trap after early layers
        // have already advanced. MTP alignment is intentionally checked by
        // its own lifecycle: target verification may have a provisional head.
        guard state.modelIdentity == promptCheckpointIdentity,
              state.tokenCount >= 0, ids.count <= Int(Int32.max),
              state.tokenCount <= Int(Int32.max) - ids.count,
              state.linear.count == gdn.count,
              state.kv.count == qsa.count, state.indexer.count == qsa.count,
              gdn.keys.allSatisfy({ state.linear[$0] != nil }),
              qsa.keys.allSatisfy({ state.kv[$0]?.offset == state.tokenCount
                  && state.indexer[$0]?.offset == state.tokenCount }) else {
            throw ModelError("model state is uninitialized, incompatible or offset-inconsistent; use makeState() or restore a committed checkpoint")
        }
    }

    private func runHiddenMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = [],
        perLayerHook: ((Int, MLXArray) -> Void)? = nil,
        computeRanges: [Range<Int>]? = nil, shouldContinue: (() -> Bool)? = nil,
        demand: HiddenDemand = .fullMulti, executionOptions: InferenceOptimizations? = nil
    ) throws -> MLXArray? {
        let optimizations = executionOptions ?? self.optimizations
        try validateForward(ids, state: state)
        state.recordedTokenIds = state.recordingEnabled ? ids : nil
        state.recordingBaseTokenCount = state.recordingEnabled ? state.tokenCount : nil
        state.committedBoundaryValid = false
        let S = ids.count
        let referenceRows: Int
        if alignSmallReferenceDispatch, smallPrefillSweep, state.tokenCount >= smallPrefillReferenceStart,
           state.tokenCount < smallPrefillReferenceEnd {
            let blockStart = smallPrefillReferenceStart + ((state.tokenCount - smallPrefillReferenceStart) / 256) * 256
            referenceRows = min(256, smallPrefillReferenceEnd - blockStart)
        } else { referenceRows = 256 }
        let projectionRows = stableSmallPrefillProjections && smallPrefillSweep && S < referenceRows ? referenceRows : 0
        let ranges = computeRanges ?? stride(from: 0, to: S, by: 4096).map { $0 ..< min(S, $0 + 4096) }
        let layerMajor = optimizations.layerExpertWorkspace && ranges.count > 1
        // Public full-output APIs, MTP and truncated diagnostic models retain
        // all rows. The pinned final layer is QSA; no recurrent update is
        // inferred from a configuration label or omitted for another family.
        let terminalPruning = optimizations.terminalPrefillPruning && mtpHead == nil
            && runLayers == cfg.numLayers && qsa[runLayers - 1] != nil
            && perLayerHook == nil && demand != .fullMulti
        let terminalLastQuery = terminalPruning && optimizations.terminalLastQuery && demand == .lastRow
        if layerMajor {
            precondition(optimizations.compactStateWindows && optimizations.boundedIndexer && optimizations.boundedPLE
                && !state.linear.values.contains(where: { $0.record }),
                "a larger layer workspace requires bounded state, indexer, PLE and a non-recording prefill")
        }
        // A workspace holds a full layer of expert weights while reducing
        // routed tiles. Freed MLX buffers must not coexist with that live
        // allocation: its cache limit admits one last whole buffer and can
        // overshoot the requested byte limit. Clear only disposable buffers;
        // expert residency, tensor shapes and evaluation order stay intact.
        let savedWorkspaceCacheLimit = optimizations.layerExpertWorkspace && S >= SweepTuning.minTokens
            ? MLX.Memory.cacheLimit : nil
        if savedWorkspaceCacheLimit != nil {
            MLX.Memory.cacheLimit = 0
            MLX.Memory.clearCache()
        }
        defer {
            if let savedWorkspaceCacheLimit { MLX.Memory.cacheLimit = savedWorkspaceCacheLimit }
        }
        // A deferred barrier needs every in-flight layer's pins to outlive it,
        // so a pass the pool cannot pin that deeply drains at every layer.
        let barrierPeriod = DecodeLookahead.barrierPeriod(requested: decodeBarrierLayers, rows: S,
            topK: cfg.topK, experts: cfg.numExperts, slots: pool.slots,
            reservedSlots: lookahead?.prefetch?.configuration.slotCap ?? 0)
        pool.pinGenerations = barrierPeriod > 1 ? barrierPeriod + 1 : 1
        prepareOptimizationKernels(using: optimizations)
        pool.workspacePiecewiseWrites = optimizations.workspacePiecewiseWrites
        state.compactStateWindows = optimizations.compactStateWindows
        ngram.compactRows = optimizations.compactNgramRows
        mtpHead?.attn.indexer.incrementalBlocks = optimizations.incrementalIndexer
        mtpHead?.attn.boundedIndexer = optimizations.boundedIndexer
        mtpHead?.attn.indexer.denseBypass = optimizations.denseIndexerBypass
        mtpHead?.attn.indexer.specializedSelector = optimizations.indexerBlockTopK
        mtpHead?.moe.specializedRouter = optimizations.routerTopK
        var h0 = try resident.embedChecked(ids, shape: [1, S]).asType(.bfloat16)
        if !vision.isEmpty { h0 = Self.spliceVision(h0, runs: vision, length: S, hidden: cfg.hiddenSize) }
        Self.debugDump("embed", h0)
        var h = tiled(h0, repetitions: [1, 1, cfg.hcCount])

        // n-gram history: rolling context + new ids
        let history = state.ngramCtx + ids.map { Int64($0) }
        state.ngramCtx = Array(history.suffix(cfg.ngramSize - 1))
        let lookahead = optimizations.ngramLookahead && S >= 16 && runLayers > ngram.pleLayerIndex
            ? try ngram.beginPrefetch(history:history,nNew:S,maxTokens:optimizations.boundedPLE || layerMajor ? 256 : 1024) : nil
        defer { if let lookahead { ngram.discardPrefetch(lookahead) } }

        // Forecasts and completed-layer ticks deferred between barriers ride the
        // next routing readback (see the barrier below). A pass that returns
        // early or throws drops whatever is still queued.
        defer { routingReadbacks.discard() }
        // Attention forecast taps ride each layer's own routing readback, so the
        // queue is installed for them even when every layer is a barrier.
        let attentionTaps = self.lookahead?.attentionForecastTaps ?? []
        for l in 0 ..< runLayers {
            if shouldContinue?() == false { return nil }
            if MemTrace.on { MemTrace.enterLayer(l, kind: gdn[l] != nil ? "gdn" : "qsa") }
            moe[l]!.specializedRouter = optimizations.routerTopK
            moe[l]!.overlapShared = optimizations.overlapSharedExpert
            moe[l]!.overlapResident = optimizations.overlapResidentExperts
            moe[l]!.readbackQueue = barrierPeriod > 1 || !attentionTaps.isEmpty ? routingReadbacks : nil
            qsa[l]?.indexer.denseBypass = optimizations.denseIndexerBypass
            qsa[l]?.indexer.specializedSelector = optimizations.indexerBlockTopK
            moe[l]!.workspaceComputeRanges = layerMajor ? ranges : []
            moe[l]!.workspaceTokenTile = optimizations.workspaceTokenTile
            attnHC[l].minimumProjectionRows = projectionRows
            mlpHC[l].minimumProjectionRows = projectionRows
            gdn[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.minimumProjectionRows = projectionRows
            qsa[l]?.indexer.minimumProjectionRows = projectionRows
            ple[l]?.minimumProjectionRows = projectionRows
            moe[l]!.minimumProjectionRows = projectionRows
            if terminalPruning, l == runLayers - 1, demand == .stateOnly, layerMajor {
                let historyBase = history.count - S
                for range in ranges {
                    var hidden = h[0..., range, 0...]
                    if let p = ple[l] {
                        p.boundedTokens = true
                        let begin = max(0, historyBase + range.lowerBound - (cfg.ngramSize - 1))
                        hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + range.upperBound]),
                            nNew: range.count, cache: state.linear[l])
                    }
                    let x = attnHC[l](hidden).0
                    qsa[l]!.appendKeysOnly(x, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                    if shouldContinue?() == false { return nil }
                }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            if layerMajor {
                // Preserve the established 4096-token compute shapes while
                // sharing expert reads over the whole layer frontier.
                var bases: [MLXArray] = [], inputs: [MLXArray] = [], injections: [MLXArray] = []
                let historyBase = history.count - S
                for range in ranges {
                    let (lo, hi) = (range.lowerBound, range.upperBound)
                    let begin = max(0, historyBase + lo - (cfg.ngramSize - 1))
                    let lastQuery = terminalLastQuery && l == runLayers - 1
                    if lastQuery && hi < S {
                        // Earlier tiles contribute only persistent keys. Keep
                        // each original PLE/HC/projection compute shape.
                        var hidden = h[0..., lo ..< hi, 0...]
                        if let p = ple[l] {
                            p.boundedTokens = true
                            hidden = try hidden + p(hidden, history: Array(history[begin ..< historyBase + hi]),
                                nNew: hi - lo, cache: state.linear[l])
                        }
                        qsa[l]!.appendKeysOnly(attnHC[l](hidden).0, rope: rope,
                            cache: state.kv[l]!, idxCache: state.indexer[l]!)
                        if shouldContinue?() == false { return nil }
                        continue
                    }
                    let prepared = try prepareScopeAttention(layer: l, hidden: h[0..., lo ..< hi, 0...],
                        history: Array(history[begin ..< historyBase + hi]), state: state,
                        lastQueryOnly: lastQuery, executionOptions: optimizations)
                    eval(prepared.base, prepared.input, prepared.injection)
                    state.linear[l]?.compactWindows()
                    if shouldContinue?() == false { return nil }
                    bases.append(prepared.base); inputs.append(prepared.input); injections.append(prepared.injection)
                }
                let base = concatenated(bases, axis: 1)
                let input = concatenated(inputs, axis: 1)
                let injection = concatenated(injections, axis: 1)
                if optimizations.compactScopeFrontier {
                    // The previous frontier and the component arrays are no
                    // longer needed after their joined values materialize.
                    // Release them before loading the full expert workspace.
                    eval(base, input, injection)
                    bases.removeAll(); inputs.removeAll(); injections.removeAll()
                    h = base
                }
                MemTrace.mark("scope-frontier", nil)
                moe[l]!.routerObserver = combinedRouterObserver
                moe[l]!.useLayerWorkspace = true
                if terminalPruning, l == runLayers - 1, demand == .lastRow {
                    moe[l]!.useLayerWorkspace = false
                    moe[l]!.workspaceComputeRanges = []
                    let row = input.dim(1) - 1
                    let output = try moe[l]!(input[0..., row..., 0...])
                    h = base[0..., row..., 0...] + (output.expandedDimensions(axis: -2)
                        * injection[0..., row..., 0...].expandedDimensions(axis: -1)).reshaped([1, 1, cfg.hcCount * cfg.hiddenSize])
                    terminalMoERowsSkipped += S - 1
                    if terminalLastQuery { terminalQueryRowsSkipped += S - input.dim(1) }
                } else {
                    let output = try moe[l]!(input)
                    h = base + (output.expandedDimensions(axis: -2)
                        * injection.expandedDimensions(axis: -1)).reshaped(base.shape)
                }
                eval(h)
                self.lookahead?.layerCompleted(layer: l, x2: input)
                MemTrace.mark("layer-end", h)
                perLayerHook?(l, h)
                continue
            }
            if let p = ple[l] {
                p.boundedTokens = optimizations.boundedPLE
                h = try h + p(h, history: history, nNew: S, cache: state.linear[l] ?? nil)
                MemTrace.mark("ple", h)
            }
            let dbgLayer = Self.debugLayer
            let (x1, inj1) = attnHC[l](h)
            if l == dbgLayer { Self.debugDump("x1", x1); Self.debugDump("inj1", inj1!) }
            contextNumericsObserver?(l, "x1", x1)
            contextNumericsObserver?(l, "inj1", inj1!)
            MemTrace.mark("hc1", x1)
            if terminalPruning, l == runLayers - 1, demand == .stateOnly {
                qsa[l]!.appendKeysOnly(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!)
                if shouldContinue?() == false { return nil }
                terminalQueryRowsSkipped += S; terminalMoERowsSkipped += S
                state.tokenCount += S
                state.committedBoundaryValid = true
                return MLXArray.zeros([1, 0, cfg.hcCount * cfg.hiddenSize], dtype: h.dtype)
            }
            let attnOut: MLXArray
            if let g = gdn[l] {
                g.fusedRecording = optimizations.fusedGDNRecording
                attnOut = g(x1, cache: state.linear[l])
            } else {
                qsa[l]!.stableSmallKeyDomain = stableSmallPrefillAttention && smallPrefillSweep
                qsa[l]!.smallReferenceStart = smallPrefillReferenceStart
                qsa[l]!.smallReferenceEnd = smallPrefillReferenceEnd
                qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
                qsa[l]!.boundedIndexer = optimizations.boundedIndexer
                attnOut = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!,
                    lastQueryOnly: terminalLastQuery && l == runLayers - 1)
            }
            contextNumericsObserver?(l, "attn", attnOut)
            MemTrace.mark("attn", attnOut)
            if l == dbgLayer { Self.debugDump("attn", attnOut) }
            let lastQuery = terminalLastQuery && l == runLayers - 1
            let attentionInjection: MLXArray
            if lastQuery {
                let first = S - attnOut.dim(1)
                h = h[0..., first..., 0...]
                attentionInjection = inj1![0..., first..., 0...]
                terminalQueryRowsSkipped += first
            } else { attentionInjection = inj1! }
            h = h + (attnOut.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1))
                .reshaped(h.shape)
            contextNumericsObserver?(l, "hAfterAttn", h)
            if l == dbgLayer { Self.debugDump("hAfterAttn", h) }

            let pruneLastMoE = terminalPruning && l == runLayers - 1 && demand == .lastRow
            let (fullMLPInput, fullMLPInjection) = mlpHC[l](h)
            let mlpRow = h.dim(1) - 1
            let x2 = pruneLastMoE ? fullMLPInput[0..., mlpRow..., 0...] : fullMLPInput
            let inj2 = pruneLastMoE ? fullMLPInjection![0..., mlpRow..., 0...] : fullMLPInjection
            if pruneLastMoE {
                h = h[0..., mlpRow..., 0...]
                terminalMoERowsSkipped += S - 1
            }
            // Attention forecast taps for the next layer, on streams that now
            // hold this layer's attention output. They are evaluated with this
            // layer's routing readback and reach the scheduler before its demand.
            var deferredReadout: RouterForecastBatch?
            if !attentionTaps.isEmpty, !pruneLastMoE, l + 1 < runLayers, let session = self.lookahead,
               let attentionBatch = buildAttentionForecast(taps: attentionTaps, layer: l, streams: h, x2: x2,
                                                           injection: inj2!, state: state) {
                var batch = attentionBatch
                if session.readoutAfterDemand, batch.targets.contains(where: { $0.tap == .attentionReadout || $0.tap == .attentionReadoutCorrected }) {
                    // The readout's GPU work is submitted now and consumed after
                    // this layer's demand reads, so it runs while they are in
                    // flight instead of delaying the routing readback.
                    let readout = RouterForecastBatch(targets: batch.targets.filter { $0.tap == .attentionReadout || $0.tap == .attentionReadoutCorrected },
                                                      buildSeconds: batch.buildSeconds)
                    batch.targets.removeAll { $0.tap == .attentionReadout || $0.tap == .attentionReadoutCorrected }
                    batch.buildSeconds = 0
                    asyncEval(readout.targets.map { $0.logits })
                    deferredReadout = readout
                }
                if !batch.targets.isEmpty {
                    routingReadbacks.enqueue(batch.targets.map { $0.logits }) { [self] waited in
                        finishRouterForecast(session: session, layer: l, batch: batch, evalSeconds: waited)
                    }
                }
            }
            if l == dbgLayer { Self.debugDump("x2", x2) }
            contextNumericsObserver?(l, "x2", x2)
            contextNumericsObserver?(l, "inj2", inj2!)
            MemTrace.mark("hc2", x2)
            moe[l]!.routerObserver = combinedRouterObserver
            moe[l]!.useLayerWorkspace = optimizations.layerExpertWorkspace
            moe[l]!.disjointOutput = optimizations.disjointSweepOutput
            moe[l]!.boundedRows = optimizations.boundedSweepRows
            // A canonical terminal pass shorter than 256 uses the pool path.
            // Its smaller subpasses must preserve that expert arithmetic too.
            moe[l]!.smallPrefillSweep = smallPrefillSweep && referenceRows == 256
            moe[l]!.routerProjection.minimumRows = stableSmallPrefillRouting && smallPrefillSweep && S < referenceRows ? referenceRows : 0
            if let observe = contextNumericsObserver {
                moe[l]!.contextNumericsObserver = { name, value in observe(l, name, value) }
            } else { moe[l]!.contextNumericsObserver = nil }
            let moeOut = try moe[l]!(x2)
            if let readout = deferredReadout, let session = self.lookahead {
                // Consumed here, after the demand reads: the host copy waits only
                // for whatever of the readout the GPU has not finished.
                finishRouterForecast(session: session, layer: l, batch: readout, evalSeconds: 0)
            }
            contextNumericsObserver?(l, "moe", moeOut)
            if l == dbgLayer { Self.debugDump("moe", moeOut) }
            MemTrace.mark("moe", moeOut)
            h = h + (moeOut.expandedDimensions(axis: -2) * inj2!.expandedDimensions(axis: -1))
                .reshaped(h.shape)

            // synchronize the layer so pool references release before the next
            // layer's ensure() scatters (keeps slot writes in place, see PLAN §4.2)
            // Router-reuse forecast: after the MoE add these streams are the
            // next layer's input. The target layers' own hyper-connection reads
            // and routers are built lazily on them here and evaluated in the
            // same sync as the streams (one graph, one wait per layer); the
            // candidates are selected on the host before this layer's tick.
            var builtForecast = self.lookahead.flatMap { session in
                session.wantsRouterForecast ? buildRouterForecast(session: session, layer: l, streams: h, x2: x2) : nil
            }
            // The readout self-check (observer only): the streams after this
            // layer's MoE add are the next layer's exact input, so its readout
            // forecast should reproduce that layer's routing.
            if attentionTaps.contains(.boundaryReadout), l + 1 < runLayers, self.lookahead != nil {
                let started = RuntimeClock.now()
                let read = readoutForecast(target: l + 1, streams: h, state: state)
                let seconds = RuntimeClock.seconds(since: started)
                if builtForecast == nil { builtForecast = RouterForecastBatch(targets: [], buildSeconds: 0) }
                builtForecast!.targets.append((l + 1, .boundaryReadout, read.mixed, read.logits))
                builtForecast!.buildSeconds += seconds
            }
            let forecastBatch = builtForecast
            // Barrier period. The drain exists so this layer's pool references
            // release before the next layer's ensure() scatters into those slots.
            // Holding pins for several generations keeps an unevaluated gather's
            // slots out of every victim scan, so the same condition holds without
            // draining, and the barrier can fall on every Kth layer instead.
            // Between barriers the host still waits once per layer, on the next
            // layer's router indices. The forecast and this layer's completed
            // tick ride that wait, so the scheduler sees them one attention block
            // later than at K = 1. Held until the next barrier instead, they
            // arrived in bursts and too late to read ahead (decode serialization
            // round 3). K = 1 is the original path.
            let period = barrierPeriod
            let mustBarrier = period <= 1 || l == runLayers - 1 || (l + 1) % period == 0
            if mustBarrier {
                let evalStart = RuntimeClock.now()
                eval([h] + routingReadbacks.arrays + (forecastBatch?.targets.map { $0.logits } ?? []))
                let waited = RuntimeClock.seconds(since: evalStart)
                // Normally empty, because this layer's own routing readback drained
                // it; anything left belongs to earlier layers and finishes first.
                routingReadbacks.drain(waited: 0)
                if let forecastBatch, let session = self.lookahead {
                    finishRouterForecast(session: session, layer: l, batch: forecastBatch, evalSeconds: waited)
                }
                // Completed-layer boundary: the lookahead session may copy this
                // layer's small x2 to the host now and tick the prefetch window.
                self.lookahead?.layerCompleted(layer: l, x2: x2)
            } else if let session = self.lookahead {
                routingReadbacks.enqueue(forecastBatch?.targets.map { $0.logits } ?? []) { [self] waited in
                    if let forecastBatch {
                        finishRouterForecast(session: session, layer: l, batch: forecastBatch, evalSeconds: waited)
                    }
                    session.layerCompleted(layer: l, x2: x2)
                }
            }
            // The layer has finished reading the convolution parent. Compact
            // only multi-token passes; a one-token decode parent is bounded
            // to the small convolution window plus one row already.
            if optimizations.compactStateWindows, S > 1 {
                state.linear[l]?.compactWindows()
            }
            MemTrace.mark("layer-end", h)
            perLayerHook?(l, h)
        }
        if shouldContinue?() == false { return nil }
        state.tokenCount += S
        state.committedBoundaryValid = true
        return h
    }

    /// One layer's router-reuse forecast: lazy logits per target, the tap they
    /// were read at and the mixed inputs they came from.
    private struct RouterForecastBatch {
        typealias Target = (target: Int, tap: RouterForecastTap, mixed: MLXArray, logits: MLXArray)
        var targets: [Target]
        var buildSeconds: Double
    }

    /// Phase one, before the layer's sync: for each configured stride `s`,
    /// target `T = layer + s` gets its own `mlpHC[T]` mixed read of the live
    /// streams and its own router matmul, exactly the modules the real routing
    /// uses at T. What the forecast omits is the intermediate layers' updates
    /// (at stride 1 only T's attention sublayer, plus PLE when T is the PLE
    /// layer). Stride 0 reuses this layer's true `x2` as the C12 self-check.
    /// Nothing here touches the real router path, reference bits or pins.
    private func buildRouterForecast(session: ExpertLookaheadSession, layer l: Int, streams h: MLXArray, x2: MLXArray) -> RouterForecastBatch? {
        let started = RuntimeClock.now()
        var targets: [RouterForecastBatch.Target] = []
        if session.forecastSelfCheck {
            targets.append((l, .boundary, x2, moe[l]!.routerProjection(x2)))
        }
        for stride in session.routerForecastStrides {
            let t = l + stride
            guard stride > 0, t < runLayers else { continue }
            let mixed = mlpHC[t].mixedInput(h)
            targets.append((t, .boundary, mixed, moe[t]!.routerProjection(mixed)))
        }
        guard !targets.isEmpty else { return nil }
        return RouterForecastBatch(targets: targets, buildSeconds: RuntimeClock.seconds(since: started))
    }

    /// Attention taps (`RouterForecastTap`) at layer `l` for target `l + 1`,
    /// built before this layer's MoE call on streams that already hold its
    /// attention output: the target's own `mlpHC` mixed read and router, as at
    /// a boundary. `attentionShared` first adds this layer's shared expert
    /// through the layer's own inject weights, and the MoE call reuses those
    /// matmuls. What stays missing is this layer's routed experts and the
    /// target's attention sublayer. The logits ride this layer's routing readback.
    private func buildAttentionForecast(taps: [RouterForecastTap], layer l: Int, streams h: MLXArray,
                                        x2: MLXArray, injection: MLXArray, state: State) -> RouterForecastBatch? {
        let started = RuntimeClock.now()
        let t = l + 1
        var targets: [RouterForecastBatch.Target] = []
        // The attention tap and its corrected form share one mixed read and router
        // matmul; the readout tap and its corrected form share one readout.
        var plain: (mixed: MLXArray, logits: MLXArray)?
        var readout: (mixed: MLXArray, logits: MLXArray)?
        for tap in taps {
            switch tap {
            case .boundary:
                continue
            case .attention, .attentionCorrected:
                let read = plain ?? {
                    let mixed = mlpHC[t].mixedInput(h)
                    return (mixed, moe[t]!.routerProjection(mixed))
                }()
                plain = read
                guard tap == .attentionCorrected else {
                    targets.append((t, tap, read.mixed, read.logits))
                    continue
                }
                guard let correction = lookahead?.tapCorrection, correction.correctedTap == tap, correction.covers(target: t) else { continue }
                precondition(read.mixed.shape.last == correction.header.hidden,
                              "tap correction width \(correction.header.hidden) does not match the router input \(read.mixed.shape)")
                targets.append((t, tap, read.mixed, correction.apply(target: t, mixed: read.mixed, logits: read.logits)))
            case .attentionShared:
                let parts = moe[l]!.precomputedSharedParts ?? moe[l]!.sharedExpertParts(x2)
                moe[l]!.precomputedSharedParts = parts
                let shared = sigmoid(parts.1) * parts.0
                let streams = h + (shared.expandedDimensions(axis: -2) * injection.expandedDimensions(axis: -1))
                    .reshaped(h.shape)
                let mixed = mlpHC[t].mixedInput(streams)
                targets.append((t, tap, mixed, moe[t]!.routerProjection(mixed)))
            case .attentionReadout, .attentionReadoutCorrected:
                let read = readout ?? readoutForecast(target: t, streams: h, state: state)
                readout = read
                guard tap == .attentionReadoutCorrected else {
                    targets.append((t, tap, read.mixed, read.logits))
                    continue
                }
                guard let correction = lookahead?.tapCorrection, correction.correctedTap == tap, correction.covers(target: t) else { continue }
                precondition(read.mixed.shape.last == correction.header.hidden,
                              "tap correction width \(correction.header.hidden) does not match the readout's router input \(read.mixed.shape)")
                targets.append((t, tap, read.mixed, correction.apply(target: t, mixed: read.mixed, logits: read.logits)))
            case .boundaryReadout:
                // Built after this layer's MoE add, on the target's exact input.
                continue
            }
        }
        guard !targets.isEmpty else { return nil }
        return RouterForecastBatch(targets: targets, buildSeconds: RuntimeClock.seconds(since: started))
    }

    /// The readout taps: the target's own attention-side hyper-connection read
    /// of `streams`, its attention sublayer run on that read against its
    /// caches as they stand (nothing written), the injection back into the
    /// streams, then the target's mixed read and router, as at a boundary. On
    /// the streams after the source layer's attention add (`attentionReadout`)
    /// the input misses only the source layer's routed experts; on the streams
    /// after its MoE add (`boundaryReadout`) it is the target's exact input.
    /// The PLE layer's term is not added when the target is that layer, and a
    /// full-attention target attends densely, as the forward does within the
    /// indexer's budget.
    private func readoutForecast(target t: Int, streams h: MLXArray, state: State) -> (mixed: MLXArray, logits: MLXArray) {
        let (x1, inj1) = attnHC[t](h)
        let out: MLXArray
        if let g = gdn[t] {
            out = g.readout(x1, cache: state.linear[t])
        } else {
            out = qsa[t]!.readout(x1, rope: rope, cache: state.kv[t]!)
        }
        let streams = h + (out.expandedDimensions(axis: -2) * inj1!.expandedDimensions(axis: -1)).reshaped(h.shape)
        let mixed = mlpHC[t].mixedInput(streams)
        return (mixed, moe[t]!.routerProjection(mixed))
    }

    /// Phase two, after the sync: one host copy per target (three rows of 512
    /// logits), a partial top-k selection without a full sort, margins relative
    /// to each row's tenth logit, and the hand-off to the session.
    private func finishRouterForecast(session: ExpertLookaheadSession, layer l: Int, batch: RouterForecastBatch, evalSeconds: Double) {
        let started = RuntimeClock.now()
        let experts = cfg.numExperts
        let perRow = max(1, min(session.forecastCandidatesPerRow, experts))
        let tenth = min(cfg.topK, experts) - 1
        let k = max(perRow, tenth + 1)
        var topIdx = [Int32](repeating: -1, count: k)
        var topVal = [Float](repeating: -Float.infinity, count: k)
        for (t, tap, mixed, logits) in batch.targets {
            let rows = logits.size / experts
            let values = logits.asArray(Float.self)
            guard values.count == rows * experts, rows > 0 else { continue }
            var ids: [Int32] = []
            var margins: [Float] = []
            ids.reserveCapacity(rows * perRow); margins.reserveCapacity(rows * perRow)
            for r in 0 ..< rows {
                let base = r * experts
                var count = 0
                for e in 0 ..< experts {
                    let v = values[base + e]
                    if count == k, v <= topVal[k - 1] { continue }
                    var i = count < k ? count : k - 1
                    if count < k { count += 1 }
                    while i > 0, topVal[i - 1] < v {
                        topVal[i] = topVal[i - 1]; topIdx[i] = topIdx[i - 1]; i -= 1
                    }
                    topVal[i] = v; topIdx[i] = Int32(e)
                }
                let reference = topVal[tenth]
                for i in 0 ..< perRow {
                    ids.append(topIdx[i])
                    margins.append(topVal[i] - reference)
                }
            }
            session.forecast(sourceLayer: l, targetLayer: t, tap: tap, rows: rows, ids: ids, margins: margins,
                             inputs: session.captureForecastInputs ? mixed : nil)
        }
        session.prefetch?.addForecastSeconds(build: batch.buildSeconds, eval: evalSeconds,
                                             select: RuntimeClock.seconds(since: started))
    }

    private func mixScope(_ h: MLXArray, computeRanges: [Range<Int>]? = nil,
                          executionOptions: InferenceOptimizations? = nil) -> MLXArray {
        let optimizations = executionOptions ?? self.optimizations
        let ranges = computeRanges ?? stride(from: 0, to: h.dim(1), by: 4096).map { $0 ..< min(h.dim(1), $0 + 4096) }
        guard optimizations.layerExpertWorkspace, ranges.count > 1 else { return mixer(h).0 }
        var outputs: [MLXArray] = []
        for range in ranges {
            let mixed = mixer(h[0..., range, 0...]).0
            eval(mixed); outputs.append(mixed)
        }
        return concatenated(outputs, axis: 1)
    }

    private func prepareScopeAttention(layer l: Int, hidden: MLXArray, history: [Int64], state: State,
                                       lastQueryOnly: Bool = false, executionOptions: InferenceOptimizations? = nil)
        throws -> (base: MLXArray, input: MLXArray, injection: MLXArray) {
        let optimizations = executionOptions ?? self.optimizations
        var h = hidden
        if let p = ple[l] {
            p.boundedTokens = true
            h = try h + p(h, history: history, nNew: h.dim(1), cache: state.linear[l])
        }
        let (x1, inject) = attnHC[l](h)
        let attention: MLXArray
        if let g = gdn[l] {
            g.fusedRecording = optimizations.fusedGDNRecording
            attention = g(x1, cache: state.linear[l])
        } else {
            qsa[l]!.indexer.incrementalBlocks = optimizations.incrementalIndexer
            qsa[l]!.boundedIndexer = true
            attention = qsa[l]!(x1, rope: rope, cache: state.kv[l]!, idxCache: state.indexer[l]!, lastQueryOnly: lastQueryOnly)
        }
        let attentionInjection: MLXArray
        if lastQueryOnly {
            let first = h.dim(1) - attention.dim(1)
            h = h[0..., first..., 0...]
            attentionInjection = inject![0..., first..., 0...]
        } else { attentionInjection = inject! }
        h = h + (attention.expandedDimensions(axis: -2) * attentionInjection.expandedDimensions(axis: -1)).reshaped(h.shape)
        let (x2, inject2) = mlpHC[l](h)
        return (h, x2, inject2!)
    }

    /// Transactional prefill: only a completed whole-model scope is reusable.
    /// The checkpoint owns old recurrent states; append-only sequence caches
    /// restore logical offsets while retaining (and charging) grown capacity.
    package func consumeReadScope(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?) -> (logits: MLXArray?, committed: Bool) {
        checkpointCompatibility {
            try consumeReadScopeChecked(ids, passes: passes, state: state, vision: vision,
                head: head, final: final, shouldContinue: shouldContinue)
        }
    }

    package func consumeReadScopeChecked(_ ids: [Int], passes: [Int], state: State,
                          vision: [VisionRun], head: MTPHead?, final: Bool,
                          shouldContinue: (() -> Bool)?, executionOptions: InferenceOptimizations? = nil)
        throws -> (logits: MLXArray?, committed: Bool) {
        // Automatic grouping supplies a request-local execution value. The
        // public configuration stays immutable while other requests prepare.
        let optimizations = executionOptions ?? self.optimizations
        // The next speculative draft can call its head directly, without a
        // main-model forward to refresh private module flags. Restore the
        // only MTP dispatch flag changed by automatic workspace selection.
        let configuredBoundedIndexer = self.optimizations.boundedIndexer
        defer {
            if executionOptions != nil, optimizations.boundedIndexer != configuredBoundedIndexer {
                mtpHead?.attn.boundedIndexer = configuredBoundedIndexer
            }
        }
        precondition(!passes.isEmpty && passes.allSatisfy { $0 > 0 } && passes.reduce(0, +) == ids.count)
        try validateForward(ids, state: state)
        var offset = 0
        let ranges = passes.map { n -> Range<Int> in
            defer { offset += n }; return offset ..< offset + n
        }
        let checkpoint = state.checkpoint()
        var committed = false
        defer {
            if !committed { state.restore(checkpoint); state.setRecording(false) }
        }
        let demand: HiddenDemand = head != nil ? .fullMulti
            : final ? .lastRow : optimizations.demandedPrefillOutput ? .stateOnly : .fullMulti
        guard let multi = try runHiddenMulti(ids, state: state, vision: vision,
            computeRanges: ranges, shouldContinue: shouldContinue, demand: demand, executionOptions: optimizations) else { return (nil, false) }
        if let head {
            for range in ranges {
                if shouldContinue?() == false { return (nil, false) }
                state.lastMulti = try head.consumeChecked(chunk: Array(ids[range]),
                    chunkMulti: multi[0..., range, 0...], prevMulti: state.lastMulti,
                    resident: resident, rope: rope, state: state.mtp!,
                    vision: vision.compactMap { $0.clipped(to: range.lowerBound, range.upperBound) },
                    compactRetainedRow: optimizations.compactMTPRow)
            }
        }
        var logits: MLXArray?
        if final || !optimizations.demandedPrefillOutput {
            let mixed = mixScope(multi, computeRanges: multi.dim(1) == ids.count ? ranges : nil, executionOptions: optimizations)
            if final { logits = lmHead(mixed[0..., (mixed.dim(1) - 1)..., 0...]); eval(logits!) }
            else { eval(mixed) }
        }
        if shouldContinue?() == false { return (nil, false) }
        committed = true
        return (logits, true)
    }

    /// All state-producing operations complete. The terminal QSA outputs,
    /// MoE and final mixer have no state needed by subsequent prompt passes.
    package func consumePrompt(_ ids: [Int], state: State, vision: [VisionRun] = []) {
        checkpointCompatibility { try consumePromptChecked(ids, state: state, vision: vision) }
    }

    package func consumePromptChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws {
        _ = try runHiddenMulti(ids, state: state, vision: vision, demand: .stateOnly)
    }

    /// Like `hiddenStates`, but also returns the pre-final-mixer multi stream
    /// (B,S,hc*H) — the hidden the MTP draft head consumes ("scheme A": the
    /// main model truly emits the pre-mixer stream on the first draft step).
    public func hiddenStatesWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (mixed: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try hiddenStatesWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func hiddenStatesWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (mixed: MLXArray, multi: MLXArray) {
        let multi = try hiddenMulti(ids, state: state, vision: vision)
        return (mixScope(multi), multi)
    }

    /// Logits for the last position only.
    public func lastLogits(_ ids: [Int], state: State, vision: [VisionRun] = []) -> MLXArray {
        checkpointCompatibility { try lastLogitsChecked(ids, state: state, vision: vision) }
    }

    public func lastLogitsChecked(_ ids: [Int], state: State, vision: [VisionRun] = []) throws -> MLXArray {
        let multi = try runHiddenMulti(ids, state: state, vision: vision, demand: .lastRow)!
        let hidden = mixScope(multi)
        let last = hidden[0..., (hidden.dim(1) - 1)..., 0...]
        return lmHead(last)  // (1,1,vocab)
    }

    /// Logits at EVERY position plus the pre-mixer multi stream — the
    /// speculative verify pass needs both. S stays small (draft length + 1).
    public func allLogitsWithMulti(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) -> (logits: MLXArray, multi: MLXArray) {
        checkpointCompatibility { try allLogitsWithMultiChecked(ids, state: state, vision: vision) }
    }

    public func allLogitsWithMultiChecked(
        _ ids: [Int], state: State, vision: [VisionRun] = []
    ) throws -> (logits: MLXArray, multi: MLXArray) {
        let (mixed, multi) = try hiddenStatesWithMultiChecked(ids, state: state, vision: vision)
        return (lmHead(mixed), multi)
    }
}

/// A zero-copy snapshot of a State, for speculative-decode rollback. The
/// recurrent caches' arrays are REPLACED on every step (the GDN kernel emits
/// a fresh state_out; conv windows are re-sliced), never mutated in place, so
/// holding references is enough. KV/indexer buffers ARE written in place, but
/// only at rows past their offset — rolling the offset back is a full undo.
/// Compact main indexers additionally retain their bounded raw/pooled storage
/// here, so a cancelled long scope can undo released raw history exactly.
public struct StateCheckpoint {
    var lifetime: StateCheckpointLifetime
    var conv: [Int: MLXArray]
    var ssm: [Int: MLXArray]
    var pleConv: [Int: MLXArray]
    var kvOffsets: [Int: Int]
    var indexerOffsets: [Int: Int]
    var indexerSnapshots: [Int: IndexerCache.Snapshot]
    var ngramCtx: [Int64]
    var tokenCount: Int
    var committedBoundaryValid: Bool
    var mtpBoundaryValid: Bool
    var mtpOffset: Int
    var lastMulti: MLXArray?
}

extension Qwen4ExpModel.State {
    package func diagnosticIndexerBases() -> [String: Int] {
        Dictionary(uniqueKeysWithValues: indexer.map { ("index.\($0.key)", $0.value.rawBase) })
    }
    package var diagnosticDraftIndexerBase: Int? { mtp?.indexer.rawBase }
    /// Read-only logical state for exact continuation/ownership diagnostics.
    /// Indexer arrays expose the retained raw range, whose absolute base is
    /// available to package diagnostics. Released rows are represented by
    /// completed keys, not reconstructed or fabricated raw values.
    /// Returned arrays retain storage; release the snapshot before measuring
    /// liveness or memory. Unwritten KV capacity is deliberately excluded.
    public func diagnosticTensors() -> [String: MLXArray] {
        var result: [String: MLXArray] = [:]
        for (l, c) in linear {
            result["conv.\(l)"] = c.convState
            result["ssm.\(l)"] = c.ssmState
            result["ple.\(l)"] = c.pleConvState
        }
        for (l, c) in kv {
            result["key.\(l)"] = c.keys.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
            result["value.\(l)"] = c.values.map { $0[0..., 0..., 0 ..< c.offset, 0...] }
        }
        for (l, c) in indexer { result["index.\(l)"] = c.diagnosticValues() }
        result["ngram"] = MLXArray(ngramCtx)
        result["tokens"] = MLXArray(Int64(tokenCount))
        result["lastMulti"] = lastMulti
        if let c = mtp {
            result["mtp.key"] = c.kv.keys.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.value"] = c.kv.values.map { $0[0..., 0..., 0 ..< c.kv.offset, 0...] }
            result["mtp.index"] = c.indexer.diagnosticValues()
            result["mtp.offset"] = MLXArray(Int64(c.offset))
        }
        return result
    }

    public func checkpoint() -> StateCheckpoint {
        var conv: [Int: MLXArray] = [:]
        var ssm: [Int: MLXArray] = [:]
        var pleConv: [Int: MLXArray] = [:]
        for (l, c) in linear {
            if let a = c.convState { conv[l] = a }
            if let a = c.ssmState { ssm[l] = a }
            if let a = c.pleConvState { pleConv[l] = a }
        }
        checkpointLifetimes.removeAll { $0.value == nil }
        let lifetime = StateCheckpointLifetime(owner: checkpointIdentity, tokens: tokenCount,
            mtpOffset: mtp?.offset ?? 0)
        checkpointLifetimes.append(WeakStateCheckpointLifetime(lifetime))
        return StateCheckpoint(
            lifetime: lifetime, conv: conv, ssm: ssm, pleConv: pleConv,
            kvOffsets: kv.mapValues { $0.offset },
            indexerOffsets: indexer.mapValues { $0.offset },
            indexerSnapshots: indexer.compactMapValues { $0.snapshot() },
            ngramCtx: ngramCtx, tokenCount: tokenCount,
            committedBoundaryValid: committedBoundaryValid,
            mtpBoundaryValid: mtp == nil || hasValidMTP
                || (tokenCount == 0 && mtp?.offset == 0 && lastMulti == nil),
            mtpOffset: mtp?.offset ?? 0, lastMulti: lastMulti)
    }

    /// Start or stop recording per-position recurrent states in the linear
    /// layers (speculative verify passes only).
    public func setRecording(_ on: Bool) {
        recordingEnabled = on
        recordedTokenIds = nil
        recordingBaseTokenCount = nil
        for cache in indexer.values { cache.preserveRecordingRows(on) }
        for (_, cache) in linear {
            if on { cache.record = true } else { cache.clearRecording() }
        }
    }

    /// After a recording pass over `ids` from checkpoint `c`, keep only its
    /// first `n` tokens: recurrent states become the recorded ones at
    /// position n-1, KV and indexer caches trim to the checkpoint offset
    /// plus n, and the n-gram context is rebuilt from the ids. No model
    /// compute. `n` must be at least 1 and at most ids.count; keeping all of
    /// them only clears the recording.
    public func rollback(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) {
        do { try rollbackChecked(keeping: n, of: ids, from: c, ngramWindow: ngramWindow) }
        catch { preconditionFailure("\(error)") }
    }

    /// Recover only the recorded pass on this state; reject invalid input before mutation.
    public func rollbackChecked(keeping n: Int, of ids: [Int], from c: StateCheckpoint, ngramWindow: Int) throws {
        try validateRollback(keeping: n, ids: ids, checkpoint: c, ngramWindow: ngramWindow)
        if n < ids.count {
            for (_, cache) in linear {
                if !cache.ssmStates.isEmpty { cache.ssmState = cache.ssmStates[n - 1] }
                if !cache.convStates.isEmpty { cache.convState = cache.convStates[n - 1] }
                if !cache.pleConvStates.isEmpty { cache.pleConvState = cache.pleConvStates[n - 1] }
            }
            for (l, cache) in kv { cache.trim(to: (c.kvOffsets[l] ?? 0) + n) }
            for (l, cache) in indexer { cache.trim(to: (c.indexerOffsets[l] ?? 0) + n) }
            let history = c.ngramCtx + ids.prefix(n).map { Int64($0) }
            ngramCtx = Array(history.suffix(ngramWindow))
            tokenCount = c.tokenCount + n
        }
        invalidateCheckpoints(after: tokenCount, mtpOffset: nil)
        setRecording(false)
        if compactStateWindows {
            for cache in linear.values { cache.compactWindows() }
        }
    }

    /// Diagnostic for the rollback gate: the largest relative difference, over
    /// all linear layers, between this state's recurrent tensors and another's
    /// (max |a-b| / max |b|). A wrong window or a stale state reads order one;
    /// re-association reads bf16-ulp small.
    public func recurrentDelta(vs other: Qwen4ExpModel.State) -> (ssm: Double, conv: Double, ple: Double) {
        func delta(_ a: MLXArray?, _ b: MLXArray?) -> Double {
            guard let a, let b else { return (a == nil && b == nil) ? 0 : .infinity }
            guard a.shape == b.shape else { return .infinity }
            let d = abs(a.asType(.float32) - b.asType(.float32)).max().item(Float.self)
            let m = abs(b.asType(.float32)).max().item(Float.self)
            return Double(m > 0 ? d / m : d)
        }
        var s = 0.0, c = 0.0, p = 0.0
        for (l, cache) in linear {
            guard let o = other.linear[l] else { continue }
            s = max(s, delta(cache.ssmState, o.ssmState))
            c = max(c, delta(cache.convState, o.convState))
            p = max(p, delta(cache.pleConvState, o.pleConvState))
        }
        return (s, c, p)
    }

    public func restore(_ c: StateCheckpoint) {
        do { try restoreChecked(c) }
        catch { preconditionFailure("\(error)") }
    }

    /// Restore a live ancestor checkpoint from this exact state. KV storage is
    /// append-only, so snapshots from discarded future branches cannot be reused.
    public func restoreChecked(_ c: StateCheckpoint) throws {
        try validateCheckpoint(c)
        for (l, cache) in linear {
            cache.convState = c.conv[l]
            cache.ssmState = c.ssm[l]
            cache.pleConvState = c.pleConv[l]
        }
        for (l, cache) in kv {
            cache.trim(to: c.kvOffsets[l] ?? 0)
            if let k = cache.keys, let v = cache.values { eval(k, v) }
        }
        for (l, cache) in indexer {
            if let snapshot = c.indexerSnapshots[l] { cache.restore(snapshot) }
            else { cache.trim(to: c.indexerOffsets[l] ?? 0) }
            // Dense attention may not have evaluated raw indexer writes.
            // Detach their graph before a canceled scope releases its inputs.
            cache.materializeStorage()
        }
        ngramCtx = c.ngramCtx
        tokenCount = c.tokenCount
        committedBoundaryValid = c.committedBoundaryValid
        mtp?.trim(to: c.mtpOffset)
        mtp?.materialize()
        lastMulti = c.lastMulti
        invalidateCheckpoints(after: tokenCount, mtpOffset: c.mtpOffset)
        setRecording(false)
    }
}

// PLE cache slot rides on the linear cache of its (linear-attention) layer; if
// the PLE layer were ever a QSA layer this would need its own cache. Reject it
// at init time instead of failing silently.
extension Qwen4ExpModel {
    public func validate() throws {
        try Geometry.check(against: cfg, recordBytes: pool.recordBytes)
        for l in cfg.pleLayerIndices where l < runLayers {
            guard cfg.layerTypes[l] == "linear_attention" else {
                throw ModelError(
                    "PLE layer \(l) is not linear_attention, so its recurrent cache has no home — check --model")
            }
        }
    }
}
