// Prefill + decode loop with sampling, stop tokens, and streaming callbacks.

import Foundation
import MLX

public struct SampleParams {
    public var temperature: Float = 0.7
    public var topP: Float = 0.8
    public var topK: Int = 20
    public var minP: Float = 0
    public var presencePenalty: Float = 1.5
    public var seed: UInt64? = nil
    public var maxTokens = 512
    /// Text sequences that end generation (Ollama `options.stop`, OpenAI `stop`).
    public var stop: [String] = []

    public init() {}

    /// Clamp every knob into the range the sampler is defined on.
    ///
    /// Values outside it used to produce silent garbage rather than an error:
    /// a `top_p` of 0 or a `min_p` above 1 filters out every candidate, and the
    /// old `probs / probs.sum()` then divided 0 by 0, so the sampler emitted
    /// token 0 forever. A negative `num_predict` (Ollama's "until EOS") indexed
    /// a reversed Range and trapped, killing the process.
    public func sanitized() -> SampleParams {
        var p = self
        if !p.temperature.isFinite { p.temperature = 0 }
        p.temperature = max(0, p.temperature)
        if !p.topP.isFinite || p.topP <= 0 || p.topP > 1 { p.topP = 1 }
        if !p.minP.isFinite { p.minP = 0 }
        p.minP = min(max(0, p.minP), 1)
        if !p.presencePenalty.isFinite { p.presencePenalty = 0 }
        p.topK = max(0, p.topK)
        // <= 0 means "as many as allowed" for Ollama (-1) and OpenAI clients.
        if p.maxTokens <= 0 { p.maxTokens = SampleParams.maxTokenCeiling }
        p.maxTokens = min(p.maxTokens, SampleParams.maxTokenCeiling)
        p.stop = p.stop.filter { !$0.isEmpty }
        return p
    }

    /// Upper bound on a single response. Decode is the slow axis here, so an
    /// unbounded "until EOS" request needs a ceiling that is generous but finite.
    public static let maxTokenCeiling = 32_768

    public static var instruct: SampleParams { SampleParams() }
    public static var thinking: SampleParams {
        var p = SampleParams()
        p.temperature = 1.0
        p.topP = 0.95
        p.presencePenalty = 0
        return p
    }
    public static var greedy: SampleParams {
        var p = SampleParams()
        p.temperature = 0
        p.presencePenalty = 0
        return p
    }

    /// Defaults for an agent turn that may call tools.
    ///
    /// Two departures from `instruct`, and both are about the tool grammar
    /// rather than taste:
    ///
    /// * **presence penalty 0.** The instruct default of 1.5 penalises every
    ///   token already used, and the call format is obliged to repeat itself —
    ///   `</parameter>` after every argument, then `</function>`, then
    ///   `</tool_call>`. Penalising a closing tag because an earlier argument
    ///   already used it pushes the model off the grammar exactly where it must
    ///   stay on it.
    /// * **low temperature.** A tool call is a structured artefact with one
    ///   right shape, not prose; there is nothing for sampling diversity to buy
    ///   here, and at 0.7 the same prompt answered with a call on one run and
    ///   with "I don't have any tools available" on the next.
    ///
    /// Not fully greedy: `0.2` keeps a little room to escape a repetition loop,
    /// which pure argmax has no way out of.
    public static var agent: SampleParams {
        var p = SampleParams()
        p.temperature = 0.2
        p.topP = 0.9
        p.presencePenalty = 0
        return p
    }
}

public struct GenStats: Codable {
    package init() {}
    public var requestSeconds = 0.0
    public var queueSeconds = 0.0
    public var imageEncodeSeconds = 0.0
    /// Configured vision query bound for this image request, not a kernel count.
    public var visionQueryTile = 0
    /// Counted after each query tile has actually evaluated, across tower blocks.
    public var visionQueryTileCalls = 0
    public var encodedImages = 0
    public var reusedImageFeatures = 0
    public var prefixSkippedImages = 0
    /// From Generator entry to first sampled, non-EOS token; excludes Engine queue.
    public var firstTokenSeconds: Double?
    /// From Engine entry to first nonempty decoded callback, before that callback.
    public var firstTextSeconds: Double?
    public var tokenCallbackSeconds = 0.0
    public var sampleSeconds = 0.0
    public var prefillLocalVictims = 0
    public var decodeLocalVictims = 0
    public var prefillSlotSliceBatches = 0
    public var decodeSlotSliceBatches = 0
    public var decodeSlotSliceRuns = 0
    public var decodeSlotScatterBatches = 0
    public var prefillSlotWordBatches = 0
    public var decodeSlotWordBatches = 0
    public var decodeSlotWordBuffers = 0
    public var prefillSlotCPUBatches = 0
    public var decodeSlotCPUBatches = 0
    public var prefixCheckpointForks = 0
    public var prefixCheckpointStores = 0
    public var prefixCheckpointRefusals = 0
    public var prefixCheckpointErrors = 0
    public var completePromptHits = 0
    public var completePromptStores = 0
    /// Shared prefixes: where the system prompt ended, the longest start the
    /// prompt had in common with a held state, the pass boundaries at or
    /// before those where this request kept a state, and how the in-memory
    /// checkpoints of those fared. Disk outcomes are in `persistentPrefix`.
    public var sharedPrefixHint: Int?
    public var sharedPrefixCommon: Int?
    public var sharedPrefixBoundaries: [Int] = []
    public var sharedPrefixStores = 0
    public var sharedPrefixRefusals = 0
    public var sharedPrefixErrors = 0
    /// States this request declined to continue from because they would not
    /// have reproduced a read of its own prompt (see `PrefixResumeRule`).
    public var alignedResumeRefusals = 0
    public var embeddingRowsEnabled = false
    /// Unique lookup rows served/read within this request, including MTP.
    public var embeddingRowHits = 0
    public var embeddingRowMisses = 0
    public var embeddingCachedRows = 0
    public var embeddingCachedPayloadBytes = 0
    public var reconciliationSeconds = 0.0
    public var draftSeconds = 0.0
    public var verifySeconds = 0.0
    /// Actual attempted depths: zero is a useful calibration/tail target step;
    /// minus one permanently hands this request to plain decode. Bounded by
    /// the request's output ceiling, and exported with diagnostic stats only.
    public var adaptiveDraftDepths: [Int] = []
    public var adaptiveDisabledAtOutput: Int?
    /// Expert Lookahead prefetch counters for this request; nil unless the
    /// experimental scheduler is installed. Optional keeps old JSON decodable.
    public var expertPrefetch: ExpertPrefetchObservation?
    public var adaptivePlainTokens = 0
    public var decodeForwardPasses = 0
    public var decodeModelTokens = 0
    /// Arrival intervals at the token callback, including earlier callback
    /// stalls. Speculative bursts can contain several very short intervals.
    public var interTokenSeconds: [Double] = []
    public var prefillPasses: [Int] = []
    public var prefillComputePasses: [Int] = []
    /// Actual maximum attention key extent of each committed compute pass,
    /// including masked numerical-alignment padding when that path executes.
    public var prefillComputeKeyExtents: [Int] = []
    /// Physical query rows, including cropped dummy rows used to preserve
    /// matrix-attention arithmetic for very short late-context tails.
    public var prefillComputeQueryRows: [Int] = []
    public var terminalQueryRowsSkipped = 0
    public var terminalMoERowsSkipped = 0
    public var abortedReadScopes = 0
    public var reconciledHeadTokens = 0
    public var reusedHeadTokens = 0
    public var lifetimeRSSPeakBytes: UInt64 = 0
    /// Kernel lifetime peak, separate from the current request's sampled peak.
    /// Optional so statistics saved before this field existed remain decodable.
    public var lifetimePhysicalFootprintPeakBytes: UInt64?
    public var physicalFootprintEndBytes: UInt64 = 0
    public var sampledFootprint: FootprintSampler.Result?
    public var imagePreparation: ImagePreparationObservation?
    public var generatorVMBefore: ProcessMemory.VMActivity?
    public var generatorVMAfter: ProcessMemory.VMActivity?
    public var generatorSystemBefore: ProcessMemory.OperatingConditions?
    public var generatorSystemAfter: ProcessMemory.OperatingConditions?
    public var mlxActiveEndBytes = 0
    public var mlxCacheEndBytes = 0
    public var prefillMLXActiveBytes = 0
    public var prefillMLXCacheBytes = 0
    public var prefillPhysicalFootprintBytes: UInt64 = 0
    public var prefillGPUWaitSeconds = 0.0
    public var prefillRowSortSeconds = 0.0
    public var prefillReadBytes = 0
    public var decodeReadBytes = 0
    public var allocatedSequenceBytes = 0
    public var sharedExpertPrelaunches = 0
    public var fusedRoPERotationsScheduled = 0
    public var fusedGDNProjectionsScheduled = 0
    public var packedGDNProjectionLayers = 0
    public var packedGDNProjectionPayloadBytes = 0
    public var ropeTableHits = 0
    public var ropeTableBuilds = 0
    public var residentExpertPrelaunches = 0
    public var residentExpertJoins = 0
    /// Host wait at the explicit join; this is not a measured GPU duration.
    public var residentExpertJoinSeconds = 0.0
    public var ngramCachedRows = 0
    public var cachedRouterBytes = 0
    public var ngramCachePayloadBytes = 0
    /// Every token in the prompt, whether or not it had to be recomputed.
    /// This is what the Ollama/OpenAI surfaces report as prompt_eval_count.
    public var promptTokens = 0
    /// Prompt tokens actually pushed through the model this request. Equal to
    /// `promptTokens` on a cold prompt; `promptTokens - reusedPrefixTokens`
    /// when the conversation prefix cache matched.
    public var prefillTokens = 0
    /// Prompt tokens served from the retained state of a previous request.
    public var reusedPrefixTokens = 0
    /// The caller's stop sequence that ended the reply, when one did. The
    /// Anthropic Messages API reports it back as `stop_sequence`.
    public var stopSequence: String?
    public var prefillSeconds = 0.0
    public var decodeTokens = 0
    public var decodeSeconds = 0.0
    public var expertHitRate = 0.0
    public var ngramRowHits = 0
    public var ngramRowMisses = 0
    public var ngramLookaheadRows = 0
    public var ngramLookaheadDiscarded = 0
    public var ngramLookaheadWaitSeconds = 0.0
    public var ngramPrefetchSeconds = 0.0
    /// Speculative decode (MTP): drafts proposed, drafts accepted, and verify
    /// passes run. Zero when the draft head is disabled.
    public var draftedTokens = 0
    public var acceptedDrafts = 0
    public var verifyPasses = 0
    public var draftAcceptRate: Double {
        draftedTokens > 0 ? Double(acceptedDrafts) / Double(draftedTokens) : 0
    }
    /// Process-lifetime high-water: max(physical-footprint peak, RSS peak,
    /// current footprint). Includes earlier requests and model loading.
    /// sampledFootprint remains the separate request-interval observation.
    public var peakMemoryGB = 0.0
    /// MLX-only high-water retained as a diagnostic, never as the RAM gate.
    public var mlxPeakMemoryGB = 0.0
    /// Read/scatter host intervals can overlap GPU work. Subtracting them
    /// from wall time does not measure GPU compute.
    public var prefillIOSeconds = 0.0
    public var prefillScatterSeconds = 0.0
    public var prefillRecords = 0
    /// The same split for decode. Prefill's was what showed the chunk size was
    /// the lever and read-ahead was not; decode had no equivalent, so "decode
    /// is slow" could not be attributed to the miss path, to the scatter, or
    /// to per-token dispatch without guessing. Everything not counted here is
    /// compute plus dispatch.
    public var decodeIOSeconds = 0.0
    public var decodeScatterSeconds = 0.0
    public var decodeRecords = 0
    /// "stop" (EOS or stop sequence), "length", "error", or a low-level
    /// caller's explicit "cancelled" checkpoint yield.
    public var finishReason = "stop"
    /// A recoverable request failure. The failed state is never cached and
    /// serving adapters must emit an error instead of a successful completion.
    public var runtimeError: String?
    public var requestFailure: RequestFailure?
    public var smallPrefillSweeps = 0
    public var contextArithmetic = "standard"
    public var preparationSeconds = 0.0
    /// Pressure-to-observed-safe-boundary latency, not GPU preemption time.
    public var memoryPressureCancelled = false
    public var memoryPressureBoundarySeconds: Double?
    /// Persistent prefix tier activity for this request; nil when no tier is
    /// attached or it had nothing to do.
    public var persistentPrefix: PersistentPrefixObservation?

    public var prefillTPS: Double { prefillSeconds > 0 ? Double(prefillTokens) / prefillSeconds : 0 }
    public var prefixHit: Bool { reusedPrefixTokens > 0 }
    public var decodeTPS: Double { decodeSeconds > 0 ? Double(decodeTokens) / decodeSeconds : 0 }

    package mutating func recordProcessMemory() {
        physicalFootprintEndBytes = ProcessMemory.residentBytes()
        lifetimeRSSPeakBytes = ProcessMemory.lifetimeRSSPeakBytes()
        let peak = ProcessMemory.lifetimePhysicalFootprintPeakBytes()
        lifetimePhysicalFootprintPeakBytes = peak > 0 ? peak : nil
        peakMemoryGB = Double(max(physicalFootprintEndBytes, lifetimeRSSPeakBytes, peak)) / 1e9
    }
}

/// Token sampling, split out from the decode loop so it can be exercised on
/// synthetic logits with no checkpoint loaded (`slotstream sampler-golden`)
/// and compared against the numpy reference in `Tools/sampler_ref.py`.
///
/// Order matches HuggingFace's processor chain: presence penalty on raw
/// logits, then temperature, then top-k, then top-p, then min-p.
public struct Sampler {
    public var rngState: UInt64 = 0x9E37_79B9_7F4A_7C15
    public var valueOnlyTopK = false
    public var deviceDraw = false

    public init(seed: UInt64? = nil) {
        if let s = seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
    }

    public mutating func next(
        _ logits: MLXArray, params: SampleParams, generated: Set<Int>
    ) -> Int {
        var l = logits.reshaped([-1]).asType(.float32)
        if params.presencePenalty != 0 && !generated.isEmpty {
            // subtract penalty on already-generated tokens
            let ids = MLXArray(generated.sorted().map { Int32($0) })
            let current = take(l, ids, axis: 0)
            l = putAlong(l, ids, values: current - params.presencePenalty, axis: 0)
        }
        if params.temperature <= 0 {
            return argMax(l).item(Int.self)
        }
        l = l / params.temperature
        if params.topK > 0 && params.topK < l.dim(0) {
            let kth: MLXArray
            if valueOnlyTopK {
                // Only the threshold is needed, never the sort's indices.
                // Threshold ties still survive; CDF ordering and RNG are intact.
                kth = -partitioned(-l, kth: params.topK - 1)[params.topK - 1]
            } else {
                kth = takeAlong(
                    l, argPartition(-l, kth: params.topK - 1)[..<params.topK], axis: 0
                ).min()
            }
            l = which(l .< kth, MLXArray(-Float.infinity), l)
        }
        var probs = softmax(l, axis: -1)
        if params.topP < 1 {
            let order = argSort(-probs)
            let sorted = take(probs, order, axis: 0)
            let cum = cumsum(sorted, axis: 0)
            let keepSorted = (cum - sorted) .< params.topP  // keep until cumulative prob (exclusive) reaches topP
            var keep = MLXArray.zeros([probs.dim(0)], dtype: .bool)
            keep = putAlong(keep, order, values: keepSorted, axis: 0)
            probs = which(keep, probs, MLXArray(Float(0)))
        }
        if params.minP > 0 {
            let cutoff = probs.max() * params.minP
            probs = which(probs .< cutoff, MLXArray(Float(0)), probs)
        }
        // gumbel-free categorical: inverse CDF with a splitmix stream.
        // The draw is scaled by the unnormalized total instead of normalizing
        // the probabilities: it avoids a 0/0 when a filter empties the
        // candidate set, and since u < 1 it also guarantees u*total < total,
        // so the pick can never run off the end of the CDF onto a
        // zero-probability token the way a bare `cdf .< u` could.
        rngState = Splitmix.mix(rngState &+ 1)
        let u = Float(Double(rngState >> 11) / Double(1 << 53))
        let cdf = cumsum(probs, axis: 0)
        if deviceDraw {
            let total = cdf[probs.dim(0) - 1]
            let valid = isFinite(total) .&& (total .> MLXArray(Float(0)))
            // At zero, select the first strictly positive CDF. A lower-bound
            // search otherwise chooses a leading token with zero mass.
            let before = u == 0 ? cdf .<= MLXArray(Float(0)) : cdf .< (MLXArray(u) * total)
            let pick = minimum(before.sum(), MLXArray(probs.dim(0) - 1))
            let fallback = argMax(logits.reshaped([-1]).asType(.float32)).asType(pick.dtype)
            return which(valid, pick, fallback).item(Int.self)
        }
        let total = cdf[probs.dim(0) - 1].item(Float.self)
        guard total.isFinite, total > 0 else {
            // Nothing survived filtering (or the logits were NaN): fall back to
            // the most likely token rather than emitting token 0 forever.
            return argMax(logits.reshaped([-1]).asType(.float32)).item(Int.self)
        }
        let before = u == 0 ? cdf .<= MLXArray(Float(0)) : cdf .< MLXArray(u * total)
        let pick = before.sum().item(Int.self)
        return min(pick, probs.dim(0) - 1)
    }
}

public final class Generator {
    public let model: Qwen4ExpModel
    /// Tokens per prefill pass. Bigger is faster on long prompts: a chunk
    /// activates nearly every expert of every layer, so the expert stream is
    /// re-read roughly once per chunk and halving the chunk count halves the
    /// bytes moved. It costs transient activation memory, which is why it is a
    /// knob rather than "as large as the prompt". Measured in MEASUREMENTS.md.
    public var prefillChunk = PrefillTuning.chunk {
        didSet { if let ceiling = prefillBudgetCeiling { prefillChunk = min(max(1, prefillChunk), ceiling) } }
    }
    private var prefillBudgetCeiling: Int?
    /// The Engine refreshes this from the live plan under the generation
    /// lock. Optional read sharing cannot enlarge the caller's process target.
    package var readScopeFootprintLimitBytes: Int?
    /// Read-only pricing observation for bounded native diagnostics. No wire
    /// or environment setting can install this package-only callback.
    package var automaticScopePricingObserver: (([[Int]], [Int], Int) -> Void)?
    /// The raw next-token logits the prompt ends on, before any sampling, for
    /// checks that compare a continued conversation against a cold one. Reads
    /// the row to the CPU, so it is installed by diagnostics and nothing else.
    package var promptLogitsObserver: (([Float]) -> Void)?
    package func setPrefillBudgetCeiling(_ ceiling: Int?) {
        prefillBudgetCeiling = ceiling
        if let ceiling { prefillChunk = min(max(1, prefillChunk), ceiling) }
    }
    /// Draft tokens per speculative round when the MTP head is enabled.
    /// Operating choice: two drafts balance target passes against rejected work.
    /// The automatic-40%-RAM M5 Pro study tied depths two and three overall;
    /// it did not establish a universal optimum. Explicitly adopted 2026-09-11:
    /// db/records/decisions/draft-depth-defaults-to-two.md.
    /// Revisit with clean paired workload/context evidence. This does not change
    /// the separate MTP activation floor, memory policy or context bounds.
    public static let defaultDraftDepth = 2

    /// Preserve the 1...16 experimental override and fallback for invalid input.
    package static func resolveDraftDepth(_ environmentValue: String?) -> Int {
        if let value = environmentValue, let depth = Int(value), (1 ... 16).contains(depth) {
            return depth
        }
        return defaultDraftDepth
    }

    public var draftDepth: Int = Generator.resolveDraftDepth(
        ProcessInfo.processInfo.environment["SLOTSTREAM_DRAFT_DEPTH"])
    /// Gate for the speculative path — `mtp-check` compares speculative
    /// against plain decode on the same loaded model by flipping this.
    public var speculationEnabled = true
    /// The template's system-message ids, set by the engine, so a prompt's
    /// system prompt can be kept as a shared prefix. Nil finds no system
    /// boundary; requests can still name one through `sharedPrefixTokens`.
    public var sharedPrefixMarkers: SharedPrefixMarkers?
    /// Shortest shared prefix worth a state: below this the fixed recurrent
    /// state costs more to keep than the prefill it saves. The disk tier's
    /// own `minimumTokens` applies on top. Provisional; `records/design/
    /// measured-operating-policies` states the tradeoff.
    public static var sharedPrefixMinimumTokens = 512
    /// Optional observer, disabled in ordinary inference. A/B its overhead.
    public var footprintSampling = false
    /// Deterministic cost injection for state-transition diagnostics only.
    /// Does not change allocations, model values or request authority.
    package var adaptiveCostOverride: ((Double, Bool) -> Double)?
    /// `SLOTSTREAM_SWEEP_TRACE=1` prints where a sweep's prefill time went.
    static let sweepTrace = ProcessInfo.processInfo.environment["SLOTSTREAM_SWEEP_TRACE"] == "1"
    /// MLX buffer-cache cap in bytes while a prompt of `SweepTuning.minTokens`
    /// or more is read, nil for no cap. The engine sets it from the memory
    /// plan: 512 MB at targets of 12 GB and under, where the sweep's varying
    /// array sizes filling the 2 GB cache cost a 7,960-token prompt 1.7 GB of
    /// peak at the 8.1 GB floor (measured 7.4 against 9.1 GB); nothing above,
    /// where the cache is cheap and the cap costs about 6% of prefill.
    /// `SLOTSTREAM_PREFILL_CACHE_MB` overrides at any target.
    public var prefillCacheLimit: Int? = nil
    /// Called after every prefill pass with (tokens read this request, tokens
    /// this request will read, seconds elapsed). `run` and `serve` hang a
    /// PrefillProgressReporter here so a five-minute prompt does not look
    /// like a hang.
    public var onPrefillProgress: ((Int, Int, Double) -> Void)?
    public var onPrefixCacheStatus: ((String) -> Void)?
    /// Same progress plus the absolute already-consumed prefix. The original
    /// callback remains compatible for embedding clients.
    public var onPrefillProgressAbsolute: ((Int, Int, Double, Int) -> Void)?
    var sampler = Sampler()
    var rngState: UInt64 {
        get { sampler.rngState }
        set { sampler.rngState = newValue }
    }

    public init(model: Qwen4ExpModel) {
        self.model = model
    }

    func sample(_ logits: MLXArray, params: SampleParams, generated: Set<Int>) -> Int {
        sampler.next(logits, params: params, generated: generated)
    }

    /// Runs prefill + decode; calls `onToken` for each generated token id.
    /// Returns (tokenIds, stats). `stop` checked between tokens (cancellation).
    /// `cache`, when given, is consulted for a state this prompt extends and
    /// receives the state back at the end, holding exactly the ids it consumed.
    public func generate(
        promptIds: [Int], params: SampleParams, eosIds: Set<Int>,
        cache: PrefixCache? = nil, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int) -> Bool)? = nil
    ) -> ([Int], GenStats) {
        generate(promptIds: promptIds, params: params, eosIds: eosIds, cache: cache, vision: vision,
            shouldContinue: shouldContinue, onToken: onToken, request: nil)
    }

    public func generate(
        promptIds: [Int], params: SampleParams, eosIds: Set<Int>,
        cache: PrefixCache? = nil, vision: VisionPrompt? = nil,
        shouldContinue: (() -> Bool)? = nil,
        onToken: ((Int) -> Bool)? = nil,
        request: RequestController?, onAdmitted: (() -> Bool)? = nil
    ) -> ([Int], GenStats) {
        generate(promptIds: promptIds, params: params, eosIds: eosIds, cache: cache,
            vision: vision, shouldContinue: shouldContinue, onToken: onToken,
            request: request, onAdmitted: onAdmitted, continuing: nil, retaining: nil)
    }

    package func generate(
        promptIds: [Int], params: SampleParams, eosIds: Set<Int>,
        cache: PrefixCache?, vision: VisionPrompt?, shouldContinue: (() -> Bool)?,
        onToken: ((Int) -> Bool)?, request: RequestController?, onAdmitted: (() -> Bool)?,
        continuing: GenerationPhaseState?, retaining: GenerationPhaseState?
    ) -> ([Int], GenStats) {
        let requestStart = RuntimeClock.now()
        let smallSweepStart = model.smallPrefillSweeps
        let originalSmallSweep = model.smallPrefillSweep
        let originalReferenceStart = model.smallPrefillReferenceStart
        let originalReferenceEnd = model.smallPrefillReferenceEnd
        let originalSmallRouting = model.stableSmallPrefillRouting
        let originalSmallAttention = model.stableSmallPrefillAttention
        let originalSmallProjections = model.stableSmallPrefillProjections
        let originalReferenceDispatch = model.alignSmallReferenceDispatch
        defer {
            model.smallPrefillSweep = originalSmallSweep
            model.smallPrefillReferenceStart = originalReferenceStart
            model.smallPrefillReferenceEnd = originalReferenceEnd
            model.stableSmallPrefillRouting = originalSmallRouting
            model.stableSmallPrefillAttention = originalSmallAttention
            model.stableSmallPrefillProjections = originalSmallProjections
            model.alignSmallReferenceDispatch = originalReferenceDispatch
        }
        let sharedPrelaunchStart = model.sharedExpertPrelaunches
        let rotationStart = model.fusedRoPERotationsScheduled
        let gdnProjectionStart = model.fusedGDNProjectionsScheduled
        let ropeHitStart = model.ropeTableHits
        let ropeBuildStart = model.ropeTableBuilds
        let residentPrelaunchStart = model.residentExpertPrelaunches
        let residentJoinsStart = model.residentExpertJoins
        let residentJoinStart = model.residentExpertJoinSeconds
        let terminalQueryStart = model.terminalQueryRowsSkipped
        let terminalMoEStart = model.terminalMoERowsSkipped
        let footprint = footprintSampling ? FootprintSampler() : nil
        let params = params.sanitized()
        sampler.valueOnlyTopK = model.optimizations.valueOnlySamplerThreshold
        sampler.deviceDraw = model.optimizations.deviceSamplerDraw
        if let s = params.seed { rngState = s == 0 ? 0xDEAD_BEEF : s }
        var stats = GenStats()
        // The speculative loop borrows stats as inout. Its continuation
        // callback must record cancellation outside that exclusive borrow.
        var callerCancellation: RequestFailure?
        stats.promptTokens = promptIds.count
        model.lookahead?.prefetch?.resetObservation()
        let embeddingHitsStart = model.resident.embeddingRowHits
        let embeddingMissesStart = model.resident.embeddingRowMisses
        func finish(_ output: [Int]) -> ([Int], GenStats) {
            // No speculative ticket survives the request; every owned reader
            // is joined before the next request can start.
            if let session = model.lookahead {
                session.requestFinished()
                stats.expertPrefetch = session.prefetch?.observation
            }
            // Every completion, cancellation and early refusal publishes the
            // same memory observations. Several early exits used to leave zero.
            stats.recordProcessMemory()
            stats.smallPrefillSweeps = model.smallPrefillSweeps - smallSweepStart
            stats.embeddingRowsEnabled = model.resident.usesEmbeddingRows
            stats.embeddingRowHits = model.resident.embeddingRowHits - embeddingHitsStart
            stats.embeddingRowMisses = model.resident.embeddingRowMisses - embeddingMissesStart
            stats.embeddingCachedRows = model.resident.embeddingCachedRows
            stats.embeddingCachedPayloadBytes = model.resident.embeddingCachedPayloadBytes
            if let failure = request?.failure {
                stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
                stats.memoryPressureCancelled = failure.code == .insufficientMemory
            } else if let failure = callerCancellation {
                stats.requestFailure = failure
                stats.finishReason = "cancelled"
            } else if stats.requestFailure?.code == .clientCancelled {
                stats.finishReason = "cancelled"
            }
            return (output, stats)
        }
        stats.imagePreparation = vision?.preparationObservation
        stats.visionQueryTile = vision == nil ? 0 : model.optimizations.visionQueryTile
        stats.generatorVMBefore = footprintSampling ? ProcessMemory.vmActivity() : nil
        stats.generatorSystemBefore = footprintSampling ? ProcessMemory.operatingConditions() : nil
        // An empty prompt would leave `logits` at its placeholder value and make
        // the sampler invent a first token from nothing. Callers reject this at
        // the API boundary; this is the backstop.
        guard !promptIds.isEmpty else {
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            stats.sampledFootprint = footprint?.finish()
            stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
            stats.cachedRouterBytes = model.cachedRouterBytes
            stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
            stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
            return finish([])
        }
        // Preserve the idle-pool guarantee even when a nonempty request is
        // rejected before state reservation or model preparation.
        defer { Stream.gpu.synchronize(); model.pool.unpinAll() }
        guard promptIds.count <= ContextPolicy.modelLimit,
              params.maxTokens <= ContextPolicy.modelLimit - promptIds.count else {
            let failure = RequestFailure(.contextLengthExceeded, "prompt plus output exceeds the model context limit")
            request?.fail(failure)
            stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
            stats.sampledFootprint = footprint?.finish()
            return finish([])
        }
        // A retained checkpoint may fork backing arrays. Its reservation is
        // real future work, so require physical headroom before taking it.
        let forkBytes = (cache?.heldCheckpoints ?? 0) > 0
            ? model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                mtp: speculationEnabled && model.mtpHead != nil) : 0
        do { try request?.check(nextAllocationBytes: ContextBytes.sum(PrefixCache.fixedBytesPerEntry, forkBytes), phase: "state reservation") }
        catch {
            stats.sampledFootprint = footprint?.finish()
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return finish([])
        }
        model.prepareOptimizationKernels()
        // Vision prompts are cacheable, but not on ids alone: every image
        // expands to a run of the same placeholder id, so a second picture of
        // the same shape produces identical ids. The image segments carry a
        // digest of the bytes behind each run, and `take` requires those to
        // agree as well; a swapped image therefore misses instead of resuming
        // a state built from the wrong pixels.
        let images = vision?.cacheSegments(for: model.optimizations) ?? []
        // A hit hands over the state and the count of prompt tokens it already
        // consumed; a miss evicts enough LRU state before this allocation to
        // keep retained + active state inside the shared bounds (PrefixCache).
        let checkpointHitsBefore = cache?.checkpointHits ?? 0
        let completeKey = model.optimizations.completePromptCheckpoint
            ? PromptCheckpointKey(model: model.promptCheckpointIdentity, optimizations: model.optimizations,
                prefillChunk: prefillChunk, mtp: speculationEnabled && model.mtpHead != nil) : nil
        let reserveSequenceBytes = model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
            mtp: speculationEnabled && model.mtpHead != nil)
        // What this request may continue from, when a cached turn has to
        // compute what a cold one does: its own pass boundaries, reached by
        // reading exactly these ids under exactly these settings. Nil keeps
        // the original extend-only reuse.
        let resumeRule = model.optimizations.resumesOnPassBoundaries
            ? PrefixResumeRule(
                key: PromptCheckpointKey(model: model.promptCheckpointIdentity,
                    optimizations: model.optimizations, prefillChunk: prefillChunk,
                    mtp: speculationEnabled && model.mtpHead != nil),
                boundaries: PrefillSchedule.resumeBoundaries(tokens: promptIds.count,
                    maxChunk: prefillChunk, tailAware: model.optimizations.tailAwarePrefill))
            : nil
        cache?.resumeRuleInForce(resumeRule != nil)
        // The persistent tier answers first only when it holds a longer state
        // than memory does, and makes room exactly like a miss before reading.
        let restored = continuing == nil ? restorePersistentPrefix(cache: cache, promptIds: promptIds, images: images,
            completePromptKey: completeKey, reserveTokens: promptIds.count + params.maxTokens,
            reserveSequenceBytes: reserveSequenceBytes, request: request, resume: resumeRule, stats: &stats) : nil
        var hit: (state: Qwen4ExpModel.State, reused: Int, logits: MLXArray?, freshEquivalent: Bool)?
        if let continuing {
            let held = continuing.held
            continuing.held = nil
            guard let held, images.isEmpty, held.state.tokenCount == held.tokens.count,
                  promptIds.count > held.tokens.count, promptIds.starts(with: held.tokens),
                  held.key == PromptCheckpointKey(model: model.promptCheckpointIdentity,
                    optimizations: model.optimizations, prefillChunk: prefillChunk,
                    mtp: speculationEnabled && model.mtpHead != nil) else {
                let failure = RequestFailure(.invalidConfiguration, "generation phase state does not match its continuation")
                request?.fail(failure)
                stats.requestFailure = failure; stats.runtimeError = failure.message; stats.finishReason = "error"
                return finish([])
            }
            cache?.reserveForRestore(promptTokens: promptIds.count, reserveTokens: promptIds.count + params.maxTokens,
                reserveSequenceBytes: reserveSequenceBytes, restoredSequenceBytes: held.state.allocatedSequenceBytes)
            hit = (held.state, held.tokens.count, nil, false)
        } else if let restored {
            // Only a boundary-aligned state is offered to a request under the
            // rule (PersistentPrefixPolicy.bestMatch), and the tier's identity
            // covers the settings, so a restored state is fresh-equivalent.
            hit = (restored.state, restored.tokens, nil, resumeRule != nil)
        } else {
            hit = cache?.takeForGeneration(
                matching: promptIds, images: images,
                reserveTokens: promptIds.count + params.maxTokens,
                reserveSequenceBytes: reserveSequenceBytes, completePromptKey: completeKey,
                modelIdentity: model.promptCheckpointIdentity, resume: resumeRule)
        }
        // A state whose draft cache does not match the mode this request was
        // offered cannot be continued exactly: finish it from the start rather
        // than read the rest of the prompt through a different head.
        if let taken = hit, resumeRule?.key.mtp == true, !taken.state.hasValidMTP {
            stats.alignedResumeRefusals += 1
            hit = nil
        }
        let state = hit?.state ?? model.makeState()
        let reused = hit?.reused ?? 0
        if let onPrefixCacheStatus {
            let source = restored != nil ? "disk" : "memory"
            let decision = reused > 0 ? "reusing \(reused)/\(promptIds.count) tokens from \(source)"
                : "miss: " + (stats.alignedResumeRefusals > 0 ? "draft state incompatible" : cache?.lastDecision ?? "disabled")
            let disk = stats.persistentPrefix?.restoreFailure.map { "; disk restore refused: " + $0 } ?? ""
            onPrefixCacheStatus(decision + disk)
        }
        // Every token of this state was read in the passes this prefill is
        // about to continue, so what it stores next is fresh-equivalent too.
        let alignedPrefill = reused == 0 || (resumeRule != nil && hit?.freshEquivalent == true)
        let stateKnowsMTP = hit == nil || state.hasValidMTP
        let mtpHead = speculationEnabled && stateKnowsMTP ? model.mtpHead : nil
        // The settings this request actually ran under. A strict-prefix hit can
        // have been produced without a draft state; that request deliberately
        // finishes plain, so stamp the mode used rather than the one asked for.
        let producedKey = PromptCheckpointKey(model: model.promptCheckpointIdentity,
            optimizations: model.optimizations, prefillChunk: prefillChunk, mtp: mtpHead != nil)
        // The last pass boundary this prefill crosses. A longer prompt that
        // extends these ids reads through the same position, so this is the
        // deepest state the next turn can continue from exactly. Zero keeps
        // common-prefix retention off, as `prefixCheckpointTokens` always has.
        let checkpointAt: Int = {
            guard model.optimizations.prefixCheckpointTokens > 0 else { return 0 }
            guard let resumeRule else { return model.optimizations.prefixCheckpointTokens }
            return resumeRule.boundaries.max() ?? 0
        }()
        model.smallPrefillReferenceStart = reused
        model.smallPrefillReferenceEnd = promptIds.count
        var smallReferenceStart: Int?
        func allocationBytes(end: Int, draftEnd: Int? = nil, workspaceBytes: Int = 0) -> Int {
            let allocated = model.sequenceAllocationBytes(tokens: end, draftTokens: draftEnd, state: state,
                sharedBacking: (cache?.heldCheckpoints ?? 0) > 0 || hit?.logits != nil)
            return ContextBytes.sum(allocated, workspaceBytes)
        }
        func checkAllocation(end: Int, draftEnd: Int? = nil, workspaceBytes: Int = 0, phase: String) throws {
            try request?.check(nextAllocationBytes: allocationBytes(end: end, draftEnd: draftEnd,
                workspaceBytes: workspaceBytes), phase: phase)
        }
        let canContinue: () -> Bool = {
            // Sampling and cancellation checks do not imply a forward. Each
            // actual prefill, decode or speculative allocation is priced at
            // its real end position immediately before that work starts.
            do { try request?.check(phase: "inference boundary") }
            catch { return false }
            if shouldContinue?() == false {
                let failure = request?.failure ?? RequestFailure(.clientCancelled, "inference was cancelled by its caller")
                request?.fail(failure)
                callerCancellation = failure
                return false
            }
            return true
        }
        do {
            try request?.admit(missingTokens: promptIds.count - reused, from: reused,
                maxChunk: prefillChunk, tailAware: model.optimizations.tailAwarePrefill)
            let initialEnd = min(promptIds.count, reused + prefillChunk)
            try checkAllocation(end: initialEnd, draftEnd: mtpHead != nil ? max(0, initialEnd - 1) : nil,
                phase: "initial state allocation")
            if onAdmitted?() == false {
                request?.cancel()
                stats.sampledFootprint = footprint?.finish()
                return finish([])
            }
        } catch {
            stats.sampledFootprint = footprint?.finish()
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            return finish([])
        }
        stats.reusedPrefixTokens = reused
        stats.prefixCheckpointForks = (cache?.checkpointHits ?? 0) - checkpointHitsBefore
        stats.completePromptHits = hit?.logits == nil ? 0 : 1
        // Boundaries inside this prompt that other conversations start with,
        // ascending. Each is kept at the last completed pass at or before it.
        var pendingShared = sharedPrefixTargets(cache: cache, promptIds: promptIds, images: images, reused: reused,
            request: request, stats: &stats)
        MLX.Memory.peakMemory = 0
        // Zero before prefill, not only after: otherwise these carry the
        // previous request's decode phase into this request's prefill split.
        model.pool.resetStats()
        model.ngram.resetStats()
        model.ngram.resetObservation()

        // ---- prefill in chunks (only the tokens the state has not consumed)
        // With the MTP draft head enabled, every chunk also flows through the
        // head so its attention cache covers the whole prompt: the entry for
        // token i fuses the previous position's multi stream with token i's
        // embedding, keeping the invariant mtp.offset == tokenCount - 1.
        // A state handed back by the cache that a plain-path request built
        // has no draft cache to extend; finish that request plain rather than
        // speculating over a misaligned head (unreachable in serve, where the
        // mode is fixed per process; the A/B tools flip it per request).
        // Vision prompts speculate too now: the head's prefill consumption
        // splices the tower's rows at the placeholder positions (MTPHead's
        // `spliceVisionEmbeds`), so its cache is built on the embeddings the
        // main model actually saw. A state produced by a plain vision request
        // still runs plain, since its head cache would claim positions the
        // main state no longer matches.
        if mtpHead != nil && state.mtp == nil { state.mtp = MTPState() }
        if mtpHead == nil { state.invalidateMTP() }
        // Vision: the tower runs here and not at tokenize time, so an image the
        // reused prefix already covers costs nothing at all. What comes back is
        // one run per image still needing a splice, at absolute prompt offsets,
        // which each chunk clips to its own window. The offsets come from the
        // segments rather than from a scan for placeholder ids, so the reused
        // head is skipped for free.
        // A sweep allocates arrays whose sizes vary from group to group, and
        // MLX's buffer cache keeps every freed size up to its limit, so by the
        // end of a long prompt the cache alone held its whole 2 GB (measured
        // 2.16 GB) on top of the pass. Where memory is tight the engine caps
        // it while the prompt is read (`prefillCacheLimit`); decode's small,
        // uniform working set gets the full cache back.
        let savedCacheLimit = MLX.Memory.cacheLimit
        defer { MLX.Memory.cacheLimit = savedCacheLimit }
        if let cap = prefillCacheLimit, promptIds.count - reused >= SweepTuning.minTokens {
            MLX.Memory.cacheLimit = min(savedCacheLimit, cap)
        }
        let imageStart = RuntimeClock.now()
        let visionRuns: [VisionRun]
        do {
            visionRuns = try vision?.runsChecked(consumedTokens: reused, deduplicate: model.optimizations.deduplicateImages,
                attentionPadding: model.optimizations.visionAttentionPadding,
                queryTile: model.optimizations.visionQueryTile, request: request) ?? []
        } catch {
            Stream.gpu.synchronize()
            model.pool.unpinAll()
            model.pool.admitOnSweep = false
            stats.runtimeError = "image preprocessing failed: \(error)"
            stats.visionQueryTileCalls = vision?.executedQueryTiles ?? 0
            stats.finishReason = "error"
            stats.imageEncodeSeconds = RuntimeClock.seconds(since: imageStart)
            stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
            stats.sampledFootprint = footprint?.finish()
            stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
            stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
            return finish([])
        }
        // The tower evaluates each transformer block, but its final merger is
        // lazy. Complete it here so image time includes the whole encoder and
        // prefill time does not silently absorb the last image projection.
        if !visionRuns.isEmpty { eval(visionRuns.map(\.rows)) }
        stats.imageEncodeSeconds = RuntimeClock.seconds(since: imageStart)
        stats.encodedImages = vision?.encodedImages ?? 0
        stats.visionQueryTileCalls = vision?.executedQueryTiles ?? 0
        stats.reusedImageFeatures = vision?.reusedImageFeatures ?? 0
        stats.prefixSkippedImages = vision?.prefixSkippedImages ?? 0
        var t0 = RuntimeClock.now()
        var logits: MLXArray = hit?.logits ?? MLXArray(0)
        var i = reused
        func discardFailedState(_ error: Error) {
            // Read workers are already joined by the checked stores. Complete
            // previously queued, valid pool copies and GPU readers before
            // releasing pins. This request state is never returned to cache.
            model.pool.commitAdmissions()
            Stream.gpu.synchronize()
            model.pool.unpinAll()
            model.pool.admitOnSweep = false
            state.setRecording(false)
            state.invalidateMTP()
            stats.runtimeError = "model execution failed: \(error)"
            stats.finishReason = "error"
        }
        func progress(_ done: Int, _ elapsed: Double) {
            onPrefillProgress?(done, promptIds.count - reused, elapsed)
            onPrefillProgressAbsolute?(done, promptIds.count - reused, elapsed, reused)
        }
        if i < promptIds.count { progress(0, 0) }
        var cancelledPrefill = false
        while i < promptIds.count {
            if cancelledPrefill || !canContinue() {
                MLX.Memory.cacheLimit = savedCacheLimit
                stats.finishReason = "stop"
                stats.prefillTokens = i - reused
                stats.prefillSeconds = RuntimeClock.seconds(since: t0)
                stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
                stats.prefillRecords = model.pool.recordsFetched
                stats.prefillLocalVictims = model.pool.floorLocalVictims
                stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
                stats.allocatedSequenceBytes = state.allocatedSequenceBytes
                stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
                stats.sampledFootprint = footprint?.finish()
                model.pool.admitOnSweep = false
                // Each completed chronological pass is a whole-stack commit.
                // Publish only that boundary; a partial image keeps its digest
                // and consumed span, never identities of future images.
                Stream.gpu.synchronize()
                model.pool.unpinAll()
                if request?.mayRetainState != false, i > 0, state.tokenCount == i {
                    let committedImages = images.compactMap { image -> ImageSegment? in
                        guard image.start < i else { return nil }
                        return ImageSegment(start: image.start, count: min(image.count, i - image.start),
                            hash: image.hash, preparationIdentity: image.preparationIdentity)
                    }
                    // A cancelled prefill stops on a completed pass, so this
                    // prefix is exactly what reading it computes when the
                    // whole read was aligned.
                    let alignedHere = alignedPrefill && (resumeRule?.boundaries.contains(i) ?? false)
                    cache?.store(state: state, tokens: Array(promptIds.prefix(i)), images: committedImages,
                        freshEquivalent: alignedHere, key: producedKey)
                    persistPrefix(cache: cache, state: state, tokens: Array(promptIds.prefix(i)),
                        images: committedImages, request: request,
                        aligned: resumeRule == nil || alignedHere, stats: &stats)
                }
                stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
                stats.cachedRouterBytes = model.cachedRouterBytes
                stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
                stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
                return finish([])
            }
            let configuredOptimizations = model.optimizations
            // Local execution controls cannot race with metadata or another
            // request's preparation reading the public model configuration.
            var executionOptimizations = configuredOptimizations
            // Shape changes retain the measured envelope and are qualified
            // against the rechunking numerical contract, not assumed exact.
            var passes = executionOptimizations.readScopeEnabled
                ? PrefillSchedule.scopePasses(remaining: promptIds.count - i, at: i,
                    maxChunk: prefillChunk, maxScope: executionOptimizations.readScopeTokens,
                    tailAware: executionOptimizations.tailAwarePrefill)
                : [PrefillSchedule.next(remaining: promptIds.count - i, at: i,
                    maxChunk: prefillChunk, tailAware: executionOptimizations.tailAwarePrefill)]
            if let cache, executionOptimizations.readScopeEnabled, cache.enabled, cache.maxTokens > 0 {
                // A read scope may otherwise step over the intended reusable
                // checkpoint. End the group at an existing compute boundary;
                // the next group still reuses reads across its remaining rows.
                passes = PrefillSchedule.preservingCheckpoint(passes, from: i,
                    checkpoint: checkpointAt)
            }
            // The next shared-prefix save point: the last chronological pass
            // end at or before the nearest target. Groups end there as well,
            // and the automatic scope receives it below, so nothing steps over
            // it; no pass is reshaped to reach the exact target.
            let sharedCheckpoint: Int? = pendingShared.first.flatMap {
                PrefillSchedule.lastPassEnd(atOrBefore: $0, from: i, remaining: promptIds.count - i,
                    maxChunk: prefillChunk, tailAware: executionOptimizations.tailAwarePrefill)
            }.flatMap { $0 > i ? $0 : nil }
            if let sharedCheckpoint {
                passes = PrefillSchedule.preservingCheckpoint(passes, from: i, checkpoint: sharedCheckpoint)
            }
            let fixedCheckpoint: Int? = cache?.enabled == true && (cache?.maxTokens ?? 0) > 0
                && checkpointAt > i ? checkpointAt : nil
            let scopeCheckpoint = [fixedCheckpoint, sharedCheckpoint].compactMap { $0 }.min()
            model.smallPrefillSweep = PrefillSchedule.chunk(at: i, maxChunk: 256) < 256
            if model.smallPrefillSweep {
                model.stableSmallPrefillRouting = true
                model.stableSmallPrefillAttention = true
                model.stableSmallPrefillProjections = true
                model.alignSmallReferenceDispatch = true
                stats.contextArithmetic = "reference-256-v1"
                // Larger or odd earlier passes need not end at an absolute
                // multiple of 256. This phase's first missing row is its
                // reference origin, including when it starts from a cache hit.
                if smallReferenceStart == nil { smallReferenceStart = i }
                model.smallPrefillReferenceStart = smallReferenceStart!
                let count = ContextWorkspace.boundedSmallPass(requested: passes.first ?? 0, at: i,
                    referenceStart: model.smallPrefillReferenceStart, referenceEnd: promptIds.count)
                passes = count > 0 ? [count] : []
            }
            let gpu = Device.defaultDevice() == .gpu
            let readPolicy = PrefillReadPolicy(options: configuredOptimizations,
                gpu: gpu, nax: gpu && configuredOptimizations.fusedPrefillWorkspace == true && FusedPrefillAttention.available,
                bf16: configuredOptimizations.fusedPrefillWorkspace == true && model.hasBF16PrefillWeights,
                headDimension: model.cfg.headDim, attentionHeads: model.cfg.numAttentionHeads,
                kvHeads: model.cfg.numKVHeads, vision: vision != nil,
                smallPass: model.smallPrefillSweep)
            func prefillAllocation(_ group: [Int], options: InferenceOptimizations) -> Int {
                let end = i + group.reduce(0, +)
                var at = i, workspace = 0
                for pass in group {
                    at += pass
                    workspace = max(workspace, ContextWorkspace.prefillBytes(pass: pass, context: at,
                        attentionHeads: model.cfg.numAttentionHeads,
                        referenceStart: model.smallPrefillReferenceStart, referenceEnd: promptIds.count,
                        minimumProjectionRows: model.smallPrefillSweep && model.stableSmallPrefillProjections ? 256 : 0,
                        padSmallQueries: model.smallPrefillSweep && model.stableSmallPrefillAttention,
                        fusedKVHeads: readPolicy.fusedKVHeads))
                }
                workspace = ContextBytes.sum(workspace, ContextBytes.product(max(0, end - i - (group.max() ?? 0)), 32_768))
                if options.layerExpertWorkspace, end - i >= SweepTuning.minTokens {
                    let admits = end == promptIds.count && SlotPool.sweepAdmitEnabled
                    let admissionRecords = admits ? min(model.cfg.numExperts,
                        max(1, model.pool.slots / model.cfg.numLayers)) : 0
                    workspace = ContextBytes.sum(workspace, ContextWorkspace.expertWorkspaceBytes(
                        tokens: end - i, tile: options.workspaceTokenTile,
                        experts: model.cfg.numExperts, topK: model.cfg.topK,
                        hidden: model.cfg.hiddenSize, intermediate: model.cfg.moeIntermediate,
                        recordBytes: model.pool.recordBytes, loadBatch: ExpertStore.defaultLoadBatch,
                        admissionPoolBytes: admits ? model.pool.poolBytes : 0,
                        admissionRecords: admissionRecords,
                        largestWriteBytes: options.workspacePiecewiseWrites ? model.pool.largestWorkspacePieceBytes : nil))
                }
                if let head = mtpHead {
                    // runHiddenMulti evaluates and releases the main expert
                    // workspace before consumeChecked starts the resident
                    // draft head. Only the full multi-stream output survives.
                    // Price both peaks, including that overlap, instead of
                    // disabling fused main attention whenever MTP is loaded.
                    workspace = max(workspace, ContextWorkspace.mtpPrefillBytes(
                        passes: group, at: i, hiddenSize: head.cfg.hiddenSize,
                        hcCount: head.cfg.hcCount, attentionHeads: head.cfg.numAttentionHeads))
                }
                return allocationBytes(end: end, draftEnd: mtpHead != nil ? max(0, end - 1) : nil,
                    workspaceBytes: workspace)
            }
            do {
                let ordinaryBytes = prefillAllocation(passes, options: configuredOptimizations)
                var checked = false
                // Automatic selection never rewrites an explicit experimental
                // scope, tail schedule or workspace geometry. Unguarded direct
                // Generator callers retain their original execution path.
                if let request, configuredOptimizations.automaticReadScope == true,
                   configuredOptimizations.compactStateWindows && configuredOptimizations.compactMTPRow,
                   !configuredOptimizations.tailAwarePrefill,
                   !configuredOptimizations.layerExpertWorkspace && configuredOptimizations.readScopeTokens == 0,
                   configuredOptimizations.workspaceTokenTile == 256,
                   !configuredOptimizations.workspacePiecewiseWrites && !configuredOptimizations.compactScopeFrontier,
                   !model.smallPrefillSweep,
                   let groups = PrefillSchedule.automaticScopeChoices(remaining: promptIds.count - i, at: i,
                       maxChunk: prefillChunk, checkpoint: scopeCheckpoint,
                       maximumScope: readPolicy.maximumScope(at: i, maxChunk: prefillChunk,
                           gpu: gpu, override: configuredOptimizations.automaticReadScopeLimit)) {
                    var scoped = configuredOptimizations
                    scoped.layerExpertWorkspace = true; scoped.readScopeTokens = groups[0].reduce(0, +)
                    scoped.boundedIndexer = true; scoped.boundedPLE = true
                    scoped.workspaceTokenTile = 1024; scoped.compactScopeFrontier = true
                    let footprintBytes = Int(clamping: ProcessMemory.residentBytes())
                    let priced = groups.map { (passes: $0, bytes: prefillAllocation($0, options: scoped)) }
                    automaticScopePricingObserver?(priced.map(\.passes), priced.map(\.bytes), footprintBytes)
                    let ordinaryCandidates = priced.filter {
                        ContextWorkspace.fitsAutomaticScope(footprintBytes: footprintBytes,
                            allocationBytes: $0.bytes, limitBytes: readScopeFootprintLimitBytes)
                    }
                    var candidates = ordinaryCandidates.map { (passes: $0.passes, bytes: $0.bytes, options: scoped) }
                    let ordinaryScope = ordinaryCandidates.first?.passes.reduce(0, +) ?? (passes.max() ?? 256)
                    var bounded = scoped; bounded.workspacePiecewiseWrites = true
                    for group in groups where readPolicy.permitsBoundedWrites(scope: group.reduce(0, +),
                        ordinaryScope: ordinaryScope, mtp: mtpHead != nil) {
                        let bytes = prefillAllocation(group, options: bounded)
                        if ContextWorkspace.fitsAutomaticScope(footprintBytes: footprintBytes,
                            allocationBytes: bytes, limitBytes: readScopeFootprintLimitBytes) {
                            candidates.append((passes: group, bytes: bytes, options: bounded))
                        }
                    }
                    candidates.sort { $0.passes.reduce(0, +) > $1.passes.reduce(0, +) }
                    if !candidates.isEmpty {
                        if let selected = try request.chooseAllocation(alternativeBytes: candidates.map(\.bytes),
                            fallbackBytes: ordinaryBytes, phase: "prefill pass") {
                            passes = candidates[selected].passes; executionOptimizations = candidates[selected].options
                        }
                        checked = true
                    }
                }
                if !checked { try request?.check(nextAllocationBytes: ordinaryBytes, phase: "prefill pass") }
            } catch { cancelledPrefill = true; continue }
            // Shared prefixes: a target whose last pass boundary is this one
            // is kept now, before the next pass moves past it. One this
            // request already stepped over (a reshaped small pass) is dropped.
            while let target = pendingShared.first, target < i + (passes.first ?? 0) {
                pendingShared.removeFirst()
                guard i <= target, i > reused else { continue }
                retainSharedPrefix(cache: cache, state: state, promptIds: promptIds, at: i, images: images,
                    reserveTokens: promptIds.count + params.maxTokens,
                    reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                        mtp: mtpHead != nil), request: request, aligned: alignedPrefill, key: producedKey, stats: &stats)
            }
            let hi = i + passes.reduce(0, +)
            guard hi > i else {
                request?.fail(RequestFailure(.contextLengthExceeded, "no bounded prefill pass fits the remaining model context"))
                cancelledPrefill = true; continue
            }
            // Only the last pass warms the pool with the prompt's hot experts
            // (sweep admission); no other pass may evict what decode was using.
            model.pool.admitOnSweep = hi == promptIds.count
            let chunk = Array(promptIds[i ..< hi])
            let chunkVision = visionRuns.compactMap { $0.clipped(to: i, hi) }
            model.lookahead?.beginPass(phase: .prefill, tokens: chunk, features: [])
            do {
            if executionOptimizations.readScopeEnabled, passes.count > 1 {
                let result = try model.consumeReadScopeChecked(chunk, passes: passes, state: state,
                    vision: chunkVision, head: mtpHead, final: hi == promptIds.count,
                    shouldContinue: canContinue, executionOptions: executionOptimizations)
                if !result.committed {
                    stats.abortedReadScopes += 1
                    cancelledPrefill = true
                    continue
                }
                if let value = result.logits { logits = value }
            } else if let head = mtpHead {
                let (mixed, multi) = try model.hiddenStatesWithMultiChecked(chunk, state: state, vision: chunkVision)
                state.lastMulti = try head.consumeChecked(
                    chunk: chunk, chunkMulti: multi, prevMulti: state.lastMulti,
                    resident: model.resident, rope: model.rope, state: state.mtp!,
                    vision: chunkVision, compactRetainedRow: executionOptimizations.compactMTPRow)
                if hi == promptIds.count {
                    logits = model.lmHead(mixed[0..., (mixed.dim(1) - 1)..., 0...])
                    eval(logits)
                } else if !executionOptimizations.demandedPrefillOutput {
                    eval(mixed)
                }
            } else if hi == promptIds.count {
                logits = try model.lastLogitsChecked(chunk, state: state, vision: chunkVision)
                eval(logits)
            } else if executionOptimizations.demandedPrefillOutput {
                try model.consumePromptChecked(chunk, state: state, vision: chunkVision)
            } else {
                let h = try model.hiddenStatesChecked(chunk, state: state, vision: chunkVision)
                eval(h)
            }
            try request?.check(phase: "prefill commit")
            model.lookahead?.endPass()
            } catch {
                model.lookahead?.endPass(aborted: true)
                discardFailedState(error)
                if executionOptimizations.readScopeEnabled, passes.count > 1 { stats.abortedReadScopes += 1 }
                stats.prefillTokens = i - reused
                stats.prefillSeconds = RuntimeClock.seconds(since: t0)
                stats.prefillIOSeconds = model.pool.ioSeconds
                stats.prefillScatterSeconds = model.pool.scatterSeconds
                stats.prefillRecords = model.pool.recordsFetched
                stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
                stats.allocatedSequenceBytes = state.allocatedSequenceBytes
                stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
                stats.sampledFootprint = footprint?.finish()
                stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
                stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
                stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
                return finish([])
            }
            stats.prefillPasses.append(chunk.count)
            stats.prefillComputePasses.append(contentsOf: passes)
            var keyEnd = i
            for pass in passes {
                keyEnd += pass
                stats.prefillComputeQueryRows.append(model.smallPrefillSweep && model.stableSmallPrefillAttention
                    ? ContextWorkspace.queryRows(pass: pass, context: keyEnd,
                        referenceStart: model.smallPrefillReferenceStart, referenceEnd: model.smallPrefillReferenceEnd) : pass)
                stats.prefillComputeKeyExtents.append(model.smallPrefillSweep && model.stableSmallPrefillAttention
                    ? ContextWorkspace.keyExtent(pass: pass, context: keyEnd,
                        referenceStart: model.smallPrefillReferenceStart, referenceEnd: model.smallPrefillReferenceEnd) : keyEnd)
            }
            i = hi
            if let cache, i == checkpointAt, reused < i, i < promptIds.count {
                // Only an existing whole-stack commit is eligible. Do not
                // split/rebatch a pass merely to manufacture this boundary.
                do {
                    // With the rule in force this boundary, not the consumed
                    // conversation, is what a later run can restore exactly.
                    // Written before the fork, so the snapshot the next turn
                    // resumes carries the lineage and its own save references
                    // these rows instead of writing them again.
                    if resumeRule != nil {
                        persistPrefix(cache: cache, state: state, tokens: Array(promptIds.prefix(i)),
                            images: images, request: request, aligned: alignedPrefill, stats: &stats)
                    }
                    let retained = try cache.storeReusableCheckpoint(state: state,
                        tokens: Array(promptIds.prefix(i)), images: images,
                        reserveTokens: promptIds.count + params.maxTokens,
                        reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                            mtp: mtpHead != nil),
                        freshEquivalent: alignedPrefill, key: producedKey)
                    if retained { stats.prefixCheckpointStores += 1 }
                    else { stats.prefixCheckpointRefusals += 1 }
                } catch {
                    // Optional retention must not publish an invalid state or
                    // fail an otherwise valid forward. The miss stays visible.
                    stats.prefixCheckpointErrors += 1
                }
            }
            progress(i - reused, RuntimeClock.seconds(since: t0))
        }
        if reused < promptIds.count, let cache, completeKey != nil {
            // Reuse the actual complete prefill boundary, without splitting
            // or replaying a pass. State alone cannot supply the first token;
            // retain its compact raw logits too, before any sampling mutation.
            do {
                let retained = try cache.storeCompletePrompt(state: state, tokens: promptIds, images: images,
                    reserveTokens: promptIds.count + params.maxTokens,
                    reserveSequenceBytes: model.sequenceCapacityBytes(tokens: promptIds.count + params.maxTokens,
                        mtp: mtpHead != nil), logits: logits, vocabularySize: model.cfg.vocabSize,
                    key: producedKey, freshEquivalent: alignedPrefill)
                if retained { stats.completePromptStores += 1 }
                else { stats.prefixCheckpointRefusals += 1 }
            } catch { stats.prefixCheckpointErrors += 1 }
        }
        MLX.Memory.cacheLimit = savedCacheLimit
        model.pool.admitOnSweep = false
        // The new projection shape applies only while consuming missing
        // prompt rows. Ordinary decode and speculative verification retain
        // their established arithmetic even after a long-context prefill.
        model.smallPrefillSweep = false
        if let session = model.lookahead, session.observer != nil {
            // Replay boundary: the complete CLOCK state decode starts from.
            session.residency(model.pool.lookaheadResidencySnapshot())
        }
        stats.prefillTokens = promptIds.count - reused
        stats.prefillSeconds = RuntimeClock.seconds(since: t0)
        stats.prefillIOSeconds = model.pool.ioSeconds
        stats.prefillScatterSeconds = model.pool.scatterSeconds
        stats.prefillRecords = model.pool.recordsFetched
        stats.prefillLocalVictims = model.pool.floorLocalVictims
        stats.prefillSlotSliceBatches = model.pool.slotSliceBatches
        stats.prefillSlotWordBatches = model.pool.slotWordBatches
        stats.prefillSlotCPUBatches = model.pool.slotCPUBatches
        stats.prefillMLXActiveBytes = MLX.Memory.activeMemory
        stats.prefillMLXCacheBytes = MLX.Memory.cacheMemory
        stats.prefillPhysicalFootprintBytes = ProcessMemory.residentBytes()
        stats.prefillReadBytes = model.pool.recordsFetched * model.pool.recordBytes
        stats.prefillGPUWaitSeconds = model.pool.sweepWaitSeconds
        stats.prefillRowSortSeconds = model.pool.sweepSortSeconds
        if Self.sweepTrace {
            let line = String(
                format: "sweep trace: io %.2fs, gpu wait %.2fs, row sort %.2fs, pool copies %.2fs, "
                    + "mlx peak %.2f GB, mlx cache %.2f GB\n",
                model.pool.ioSeconds, model.pool.sweepWaitSeconds, model.pool.sweepSortSeconds,
                model.pool.scatterSeconds, Double(MLX.Memory.peakMemory) / 1e9,
                Double(MLX.Memory.cacheMemory) / 1e9)
            FileHandle.standardError.write(line.data(using: .utf8)!)
        }
        model.pool.resetStats()
        model.ngram.resetStats()
        if let promptLogitsObserver, logits.size == model.cfg.vocabSize {
            promptLogitsObserver(logits.reshaped([-1]).asType(.float32).asArray(Float.self))
        }

        // ---- decode
        var out: [Int] = []
        var generated = Set<Int>()
        var reason = "length"
        // Exactly the ids `state` has consumed, tracked rather than inferred:
        // a token is sampled before it is fed, so both break paths below leave
        // the last one unconsumed and it must not be claimed.
        var consumed = promptIds
        t0 = RuntimeClock.now()
        var firstToken: Double?
        var callbackSeconds = 0.0
        var lastTokenAt: UInt64?
        var interTokenSeconds: [Double] = []
        let observedToken: (Int) -> Bool = { tok in
            request?.sampledFirstToken()
            if firstToken == nil { firstToken = RuntimeClock.seconds(since: requestStart) }
            if let previous = lastTokenAt { interTokenSeconds.append(RuntimeClock.seconds(since: previous)) }
            lastTokenAt = RuntimeClock.now()
            let start = RuntimeClock.now()
            let result = onToken?(tok) ?? true
            callbackSeconds += RuntimeClock.seconds(since: start)
            return result
        }
        do {
        if let head = mtpHead, speculationEnabled, let mtpState = state.mtp {
            try speculativeDecode(
                head: head, mtpState: mtpState, state: state, logits: logits,
                params: params, eosIds: eosIds, shouldContinue: canContinue,
                contextLimit: request?.configuration.maxContextTokens ?? ContextPolicy.modelLimit,
                checkAllocation: { main, draft, workspace, phase in
                    try checkAllocation(end: main, draftEnd: draft, workspaceBytes: workspace, phase: phase)
                },
                onToken: observedToken, out: &out, generated: &generated,
                reason: &reason, consumed: &consumed, stats: &stats)
        } else {
            state.invalidateMTP()
            for _ in 0 ..< max(0, params.maxTokens) {
                if !canContinue() { reason = "stop"; break }
                let sampleStart = RuntimeClock.now()
                let tok = sample(logits, params: params, generated: generated)
                stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                if eosIds.contains(tok) { reason = "stop"; break }
                out.append(tok)
                generated.insert(tok)
                // The callback stops the run for a stop sequence or a gone client.
                if !observedToken(tok) { reason = "stop"; break }
                if model.optimizations.skipUnusedFinalForward, out.count == params.maxTokens { break }
                try checkAllocation(end: state.tokenCount + 1, workspaceBytes: 1_300_000, phase: "decode cache growth")
                model.lookahead?.beginPass(phase: .mainPlain, tokens: [tok], features: [])
                logits = try model.lastLogitsChecked([tok], state: state)
                stats.decodeForwardPasses += 1
                stats.decodeModelTokens += 1
                consumed.append(tok)
                eval(logits)
                model.lookahead?.endPass()
            }
        }
        } catch {
            discardFailedState(error)
            reason = "error"
        }
        if stats.runtimeError == nil, request?.mayRetainState != false {
            if let retaining {
                // Transfer the active state rather than storing an alias that
                // a later phase could mutate behind the cache's token ledger.
                retaining.held = (state, consumed, producedKey)
            } else {
            // The conversation entry holds generated tokens, so under the rule
            // it can never be continued exactly; it still carries this turn's
            // exact ids, which `peek` splices into the next prompt. The state
            // a later turn resumes is the boundary checkpoint above.
            cache?.store(state: state, tokens: consumed, images: images,
                freshEquivalent: false, key: producedKey)
            if resumeRule == nil {
                persistPrefix(cache: cache, state: state, tokens: consumed, images: images,
                    request: request, aligned: true, stats: &stats)
            } else if images.isEmpty, cache?.enabled == true, request?.persistsPrefixState != false {
                // Keep the exact rendered conversation without pretending the
                // generated suffix is a fresh-equivalent numerical state.
                cache?.persistent?.rememberConversation(tokens: consumed)
            }
            }
        }
        stats.finishReason = reason
        stats.decodeTokens = out.count
        stats.decodeSeconds = RuntimeClock.seconds(since: t0)
        stats.firstTokenSeconds = firstToken
        stats.tokenCallbackSeconds = callbackSeconds
        stats.interTokenSeconds = interTokenSeconds
        stats.expertHitRate = model.pool.hitRate
        // The pool's counters were reset after prefill, so these cover decode
        // only.
        stats.decodeIOSeconds = model.pool.ioSeconds
        stats.decodeScatterSeconds = model.pool.scatterSeconds
        stats.decodeRecords = model.pool.recordsFetched
        stats.decodeLocalVictims = model.pool.floorLocalVictims
        stats.decodeSlotSliceBatches = model.pool.slotSliceBatches
        stats.decodeSlotSliceRuns = model.pool.slotSliceRuns
        stats.decodeSlotScatterBatches = model.pool.slotScatterBatches
        stats.decodeSlotWordBatches = model.pool.slotWordBatches
        stats.decodeSlotWordBuffers = model.pool.slotWordBuffers
        stats.decodeSlotCPUBatches = model.pool.slotCPUBatches
        stats.decodeReadBytes = model.pool.recordsFetched * model.pool.recordBytes
        stats.ngramRowHits = model.ngram.rowHits
        stats.ngramRowMisses = model.ngram.rowMisses
        stats.ngramLookaheadRows = model.ngram.lookaheadRowsConsumed
        stats.ngramLookaheadDiscarded = model.ngram.lookaheadTicketsDiscarded
        stats.ngramLookaheadWaitSeconds = model.ngram.lookaheadWaitSeconds
        stats.ngramPrefetchSeconds = model.ngram.prefetchSeconds
        stats.allocatedSequenceBytes = state.allocatedSequenceBytes
        stats.ngramCachedRows = model.ngram.cachedRowCount
        stats.cachedRouterBytes = model.cachedRouterBytes
        stats.ngramCachePayloadBytes = model.ngram.cachedPayloadBytes
        stats.mlxPeakMemoryGB = Double(MLX.Memory.peakMemory) / 1e9
        stats.mlxActiveEndBytes = MLX.Memory.activeMemory
        stats.mlxCacheEndBytes = MLX.Memory.cacheMemory
        stats.sampledFootprint = footprint?.finish()
        stats.terminalQueryRowsSkipped = model.terminalQueryRowsSkipped - terminalQueryStart
            stats.terminalMoERowsSkipped = model.terminalMoERowsSkipped - terminalMoEStart
            stats.sharedExpertPrelaunches = model.sharedExpertPrelaunches - sharedPrelaunchStart
            stats.fusedRoPERotationsScheduled = model.fusedRoPERotationsScheduled - rotationStart
            stats.fusedGDNProjectionsScheduled = model.fusedGDNProjectionsScheduled - gdnProjectionStart
            stats.packedGDNProjectionLayers = model.resident.packedGDNProjectionLayers
            stats.packedGDNProjectionPayloadBytes = model.resident.packedGDNProjectionPayloadBytes
            stats.ropeTableHits = model.ropeTableHits - ropeHitStart
            stats.ropeTableBuilds = model.ropeTableBuilds - ropeBuildStart
            stats.residentExpertPrelaunches = model.residentExpertPrelaunches - residentPrelaunchStart
            stats.residentExpertJoins = model.residentExpertJoins - residentJoinsStart
            stats.residentExpertJoinSeconds = model.residentExpertJoinSeconds - residentJoinStart
        stats.generatorVMAfter = footprintSampling ? ProcessMemory.vmActivity() : nil
        stats.generatorSystemAfter = footprintSampling ? ProcessMemory.operatingConditions() : nil
        stats.requestSeconds = RuntimeClock.seconds(since: requestStart)
        return finish(out)
    }
}

extension Generator {
    /// Hard cap bounds recording memory even if an embedding client assigns
    /// an arbitrary public depth. A terminal target output needs no draft.
    public static func effectiveDraftDepth(requested: Int, remainingOutputs: Int, bounded: Bool) -> Int {
        let depth = min(16, max(1, requested))
        return bounded ? min(depth, max(0, remainingOutputs - (remainingOutputs > 0 ? 1 : 0))) : depth
    }

    /// Self-speculative decode with the MTP draft head. One round:
    ///
    ///   1. draft `draftDepth` tokens greedily by chaining the head
    ///      (each step fuses the previous multi stream with the previous
    ///      token's embedding — "scheme A"),
    ///   2. verify them in one batched main-model pass, whose measured cost
    ///      grows with the number of positions,
    ///   3. sample sequentially from the verified logits with the plain
    ///      loop's exact semantics — same rng draw order, same presence
    ///      penalty evolution, drawing ONLY for tokens the plain loop would
    ///      have sampled, so the sampler stream never desyncs,
    ///   4. reconcile: the verify pass consumed all k+1 tokens; if some were
    ///      rejected, roll the state back (zero-copy checkpoint — recurrent
    ///      arrays are replaced, never mutated; KV rolls back by offset).
    ///      Recorded target states avoid replaying accepted target tokens;
    ///      only draft entries with provisional hidden inputs need rebuilding.
    ///
    /// Every emitted token's logits still come from the main model, so this
    /// changes WHAT computes the logits (batched passes instead of
    /// single-token passes), not the sampling rule. Batch shape changes move
    /// logits within the same floating-point envelope as prefill re-chunking
    /// (see MEASUREMENTS on the prefix cache); `mtp-check` gates on that.
    func speculativeDecode(
        head: MTPHead, mtpState: MTPState, state: Qwen4ExpModel.State,
        logits: MLXArray, params: SampleParams, eosIds: Set<Int>,
        shouldContinue: (() -> Bool)?, contextLimit: Int,
        checkAllocation: (Int, Int?, Int, String) throws -> Void, onToken: ((Int) -> Bool)?,
        out: inout [Int], generated: inout Set<Int>, reason: inout String,
        consumed: inout [Int], stats: inout GenStats
    ) throws {
        // The first token comes off the prefill logits exactly like the
        // plain loop's first iteration.
        var pending: Int? = nil
        var policy = model.optimizations.adaptiveSpeculation ? AdaptiveSpeculationPolicy(maximumDepth: draftDepth) : nil
        if params.maxTokens > 0 {
            if let keepGoing = shouldContinue, !keepGoing() { reason = "stop"; return }
            let sampleStart = RuntimeClock.now()
            let tok = sample(logits, params: params, generated: generated)
            stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
            if eosIds.contains(tok) { reason = "stop"; return }
            out.append(tok)
            generated.insert(tok)
            if let cb = onToken, !cb(tok) { reason = "stop"; return }
            pending = tok
        }

        while let p = pending, out.count < params.maxTokens {
            if let keepGoing = shouldContinue, !keepGoing() { reason = "stop"; break }
            let action = policy?.action(contextTokens: state.tokenCount)
            if action == .plain {
                stats.adaptiveDraftDepths.append(-1)
                stats.adaptiveDisabledAtOutput = out.count
                // A disabled head cannot be resumed from a stale cache. The
                // already-emitted pending token is consumed exactly once.
                state.invalidateMTP()
                var tokenToConsume = p
                while out.count < params.maxTokens {
                    if shouldContinue?() == false { reason = "stop"; break }
                    try checkAllocation(state.tokenCount + 1, nil, 1_300_000, "plain decode cache growth")
                    model.lookahead?.beginPass(phase: .mainPlain, tokens: [tokenToConsume], features: [])
                    let nextLogits = try model.lastLogitsChecked([tokenToConsume], state: state)
                    consumed.append(tokenToConsume)
                    eval(nextLogits)
                    model.lookahead?.endPass()
                    stats.decodeForwardPasses += 1; stats.decodeModelTokens += 1
                    let sampleStart = RuntimeClock.now()
                    let token = sample(nextLogits, params: params, generated: generated)
                    stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                    if eosIds.contains(token) { reason = "stop"; break }
                    out.append(token); generated.insert(token)
                    stats.adaptivePlainTokens += 1
                    if onToken?(token) == false { reason = "stop"; break }
                    tokenToConsume = token
                }
                return
            }
            let emittedBefore = out.count, sampleBefore = stats.sampleSeconds
            let draftBefore = stats.draftSeconds, verifyBefore = stats.verifySeconds
            let reconcileBefore = stats.reconciliationSeconds
            let ck = state.checkpoint()

            // ---- draft (greedy chain; provisional MTP cache entries)
            var drafts: [Int] = []
            let draftStart = RuntimeClock.now()
            var dMulti = state.lastMulti!
            var dTok = p
            // Expert Lookahead start features: position zero is the committed
            // main context plus the pending token's embedding; later positions
            // are the draft head's own multi outputs plus each draft token's
            // embedding. Retained only when a collector or predictor asks.
            let wantsFeatures = model.lookahead?.wantsStartFeatures ?? false
            var featureContexts: [MLXArray] = wantsFeatures ? [dMulti] : []
            var featureEmbeddings: [MLXArray] = []
            let requestedDepth: Int
            if case .draft(let depth) = action { requestedDepth = depth }
            else { requestedDepth = draftDepth }
            // Optional tail shortening changes verification batch shapes.
            // Both greedy and sampled counterexamples exist, so the combined
            // candidate keeps this experimental control off. Sampled requests
            // always keep the original schedule. Context bounds still apply.
            let boundedTail = model.optimizations.boundedDraftTail && params.temperature <= 0
            let requestedAvailable = action == .calibrate ? 0 : Self.effectiveDraftDepth(requested: requestedDepth,
                remainingOutputs: params.maxTokens - out.count,
                bounded: boundedTail || policy != nil)
            // Provisional verification must fit the same total context as
            // committed tokens, even when legacy draft-tail bounding is off.
            let availableDepth = ContextPolicy.maximumDraftDepth(requested: requestedAvailable,
                at: state.tokenCount, limit: contextLimit)
            if policy != nil { stats.adaptiveDraftDepths.append(availableDepth) }
            var draftCancelled = false
            for _ in 0 ..< availableDepth {
                if shouldContinue?() == false { draftCancelled = true; break }
                try checkAllocation(state.tokenCount, mtpState.offset + 1, 1_300_000, "draft cache growth")
                let e = try model.resident.embedChecked([dTok], shape: [1, 1]).asType(.bfloat16)
                let (s, m) = head(embedded: e, hiddenMulti: dMulti, rope: model.rope, state: mtpState)
                let dl = model.lmHead(s)
                dTok = argMax(dl.reshaped([-1]).asType(.float32)).item(Int.self)
                drafts.append(dTok)
                if wantsFeatures { featureEmbeddings.append(e); featureContexts.append(m) }
                dMulti = m
            }
            stats.draftedTokens += drafts.count
            stats.draftSeconds += RuntimeClock.seconds(since: draftStart)
            if draftCancelled || shouldContinue?() == false {
                try state.restoreChecked(ck); state.setRecording(false)
                reason = "stop"; break
            }

            // ---- one batched verify pass over pending + drafts, recording
            // the recurrent state after every position so a rejection can
            // roll back to the kept prefix without re-running it.
            let verifyIds = [p] + drafts
            let verifyEnd = state.tokenCount + verifyIds.count
            try checkAllocation(verifyEnd, mtpState.offset,
                ContextWorkspace.prefillBytes(pass: verifyIds.count, context: verifyEnd), "speculative verification")
            if wantsFeatures, let session = model.lookahead {
                // The last drafted token's embedding is the one extra row read
                // this feature contract charges; every other input already
                // existed before the verification pass.
                featureEmbeddings.append(try model.resident.embedChecked([dTok], shape: [1, 1]).asType(.bfloat16))
                var features: [ExpertLookaheadStartFeature] = []
                for i in 0 ..< verifyIds.count where i < featureContexts.count && i < featureEmbeddings.count {
                    features.append(ExpertLookaheadStartFeature(kind: i, token: verifyIds[i],
                        context: featureContexts[i], embedding: featureEmbeddings[i]))
                }
                session.beginPass(phase: .mainVerify, tokens: verifyIds, features: features)
            } else {
                model.lookahead?.beginPass(phase: .mainVerify, tokens: verifyIds, features: [])
            }
            let verifyStart = RuntimeClock.now()
            state.setRecording(true)
            let (vLogits, vMulti) = try model.allLogitsWithMultiChecked(verifyIds, state: state)
            eval(vLogits, vMulti)
            stats.verifyPasses += 1
            stats.decodeForwardPasses += 1
            stats.decodeModelTokens += verifyIds.count
            stats.verifySeconds += RuntimeClock.seconds(since: verifyStart)

            // ---- sequential acceptance
            var good = 0  // accepted drafts == generation tokens consumed beyond p
            var nextPending: Int? = nil
            for i in 0 ... drafts.count {
                if out.count >= params.maxTokens { break }  // reason stays "length"
                if shouldContinue?() == false { reason = "stop"; break }
                let sampleStart = RuntimeClock.now()
                let tok = sample(
                    vLogits[0..., i ..< (i + 1), 0...], params: params, generated: generated)
                stats.sampleSeconds += RuntimeClock.seconds(since: sampleStart)
                if eosIds.contains(tok) { reason = "stop"; break }
                out.append(tok)
                generated.insert(tok)
                if let cb = onToken, !cb(tok) { reason = "stop"; break }
                if i < drafts.count && tok == drafts[i] {
                    good += 1
                    continue
                }
                nextPending = tok  // the rejection correction, or the bonus token
                break
            }
            stats.acceptedDrafts += good

            // ---- reconcile the state with what was actually kept: roll the
            // recurrent caches back to the recorded state at the last kept
            // position, trim the attention caches, and slice the pass's own
            // multi stream (causal, so its first keep.count positions are
            // exactly the kept tokens' stream). No re-run.
            let reconcileStart = RuntimeClock.now()
            let keep = [p] + Array(drafts[0 ..< good])
            try checkAllocation(ck.tokenCount + keep.count, ck.mtpOffset + keep.count,
                ContextBytes.product(keep.count, 1_300_000), "draft reconciliation")
            try state.rollbackChecked(
                keeping: keep.count, of: verifyIds, from: ck, ngramWindow: model.cfg.ngramSize - 1)
            let passMulti = keep.count == verifyIds.count
                ? vMulti : vMulti[0..., 0 ..< keep.count, 0...]
            if model.optimizations.reuseFirstMTPEntry && !drafts.isEmpty {
                // The first draft-cache entry uses the true checkpoint multi
                // and pending token. Later entries used provisional multis.
                mtpState.trim(to: ck.mtpOffset + 1)
                let first = passMulti[0..., 0 ..< 1, 0...]
                state.lastMulti = model.optimizations.compactMTPRow ? contiguous(first) : first
                eval(state.lastMulti!)
                stats.reusedHeadTokens += 1
                if keep.count > 1 {
                    state.lastMulti = try head.consumeChecked(chunk: Array(keep.dropFirst()),
                        chunkMulti: passMulti[0..., 1 ..< keep.count, 0...], prevMulti: state.lastMulti,
                        resident: model.resident, rope: model.rope, state: mtpState,
                        compactRetainedRow: model.optimizations.compactMTPRow)
                    stats.reconciledHeadTokens += keep.count - 1
                }
            } else {
                mtpState.trim(to: ck.mtpOffset)
                state.lastMulti = try head.consumeChecked(
                    chunk: keep, chunkMulti: passMulti, prevMulti: ck.lastMulti,
                    resident: model.resident, rope: model.rope, state: mtpState,
                    compactRetainedRow: model.optimizations.compactMTPRow)
                stats.reconciledHeadTokens += keep.count
            }
            consumed.append(contentsOf: keep)
            stats.reconciliationSeconds += RuntimeClock.seconds(since: reconcileStart)
            if let session = model.lookahead {
                session.passReconciled(kept: keep.count)
                session.endPass()
            }
            // The draft cache holds one entry per consumed token except the
            // first. A drift here silently degrades every later draft, so
            // fail loud instead.
            precondition(
                mtpState.offset == state.tokenCount - 1,
                "mtp cache misaligned: \(mtpState.offset) entries at \(state.tokenCount) tokens")
            pending = nextPending
            if reason == "stop" { break }
            if policy != nil, out.count > emittedBefore {
                let targetCost = stats.verifySeconds - verifyBefore + stats.sampleSeconds - sampleBefore
                if action == .calibrate {
                    policy?.observePlain(seconds: adaptiveCostOverride?(targetCost, false) ?? targetCost,
                        contextTokens: state.tokenCount)
                } else if !drafts.isEmpty {
                    let totalCost = targetCost + stats.draftSeconds - draftBefore + stats.reconciliationSeconds - reconcileBefore
                    policy?.observeDraft(seconds: adaptiveCostOverride?(totalCost, true) ?? totalCost,
                        emitted: out.count - emittedBefore, drafted: drafts.count, accepted: good)
                }
            }
        }
    }
}

/// Prefill chunking. Overridable so the size can be measured and so a small
/// machine can trade prefill speed for transient memory.
public enum PrefillTuning {
    public static var chunk: Int {
        if let s = ProcessInfo.processInfo.environment["SLOTSTREAM_PREFILL_CHUNK"],
            let n = Int(s), n > 0
        {
            return min(n, 4096)
        }
        return 256
    }
}
