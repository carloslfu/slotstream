/// Couple the automatic read envelope to the attention workspace actually
/// available for this request. This never grants memory: every candidate still
/// goes through physical-footprint, live-headroom and request admission.
package struct PrefillReadPolicy {
    package let fusedKVHeads: Int?

    package init(options: InferenceOptimizations, gpu: Bool, nax: Bool,
                 bf16: Bool, headDimension: Int, attentionHeads: Int, kvHeads: Int,
                 vision: Bool, smallPass: Bool) {
        let supported = options.fusedPrefillWorkspace == true
            && options.fusedPrefillAttention == true && gpu && nax && bf16
            && headDimension == 256 && attentionHeads > 0 && kvHeads > 0
            && kvHeads <= attentionHeads && attentionHeads % kvHeads == 0
            && !vision && !smallPass
            && !options.terminalPrefillPruning && !options.selectedTextAttention
        fusedKVHeads = supported ? kvHeads : nil
    }

    /// The combined policy shares up to 16K tokens of reads only within the
    /// fused reservation's measured 256-query / 16K-key envelope. Later keys,
    /// other compute shapes and fallback attention retain the established cap.
    /// Explicit diagnostic overrides can study grouping independently.
    package func maximumScope(at position: Int, maxChunk: Int, gpu: Bool,
                              override: Int?) -> Int {
        guard gpu else { return 8192 }
        if let override { return override }
        guard fusedKVHeads != nil, (256 ... 4096).contains(maxChunk), position >= 0, position < 8192,
              PrefillSchedule.chunk(at: position, maxChunk: maxChunk) == 256 else { return 8192 }
        return 16384 - position
    }

    /// Extra write barriers are worthwhile only when they buy a substantially
    /// larger read group. Qualify the MTP case that at least doubles a group
    /// fitting the process budget; never pay for barriers at the same scope.
    /// This is a performance threshold, not a memory or arithmetic limit.
    /// Revisit with matched scope/write timing and physical-peak evidence;
    /// qualification: db/records/measurements/mtp-prefill-policy-2026-09-21.md.
    package func permitsBoundedWrites(scope: Int, ordinaryScope: Int, mtp: Bool) -> Bool {
        fusedKVHeads != nil && mtp && scope > 8192 && scope <= 16384
            && ordinaryScope > 0 && ordinaryScope <= scope / 2
    }
}
