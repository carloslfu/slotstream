import Foundation

extension DecodeLookaheadPlanning {
    /// `automatic` unless the environment names a prefetch switch or an explicit
    /// reserve. `SLOTSTREAM_OPT_EXPERT_PREFETCH=0` turns the default off; `=1`
    /// selects the experimental configuration its tuning variables describe.
    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment,
                                   modelDirectory: URL? = nil) -> Self {
        environment(env, modelDirectory: modelDirectory, pinnedSHA256: RouterTapCorrection.shippedSHA256)
    }

    /// The same with the digest a located correction must carry (nil skips it, for tests).
    package static func environment(_ env: [String: String], modelDirectory: URL?, pinnedSHA256: String?) -> Self {
        guard ExpertPrefetchConfiguration.explicitlyConfigured(env) else {
            // The automatic default carries the checkpoint's shipped correction
            // when one is located next to the weights, so the plan charges it.
            if let modelDirectory,
               let located = RouterTapCorrection.shipped(modelDirectory: modelDirectory, env: env, pinnedSHA256: pinnedSHA256).located {
                return .automaticCorrected(bytes: located.header.fileBytes)
            }
            return .automatic
        }
        let bytes = ExpertPrefetchConfiguration.plannedReserveBytes(env)
        return bytes > 0 ? .reserved(bytes: bytes) : .off
    }
}

extension ExpertPrefetchConfiguration {
    /// Exactly the configuration the B1 cohort ran ("combined" in the decode
    /// serialization attribution configs). A T0 check parses that environment and
    /// requires equality, so the default cannot drift from what was measured.
    package static var qualifiedDecode: Self {
        var c = Self()
        c.enabled = true
        c.policy = .router
        c.strides = [2]
        c.windowLayers = 2
        c.topPerLayer = 24
        c.issueCapPerTarget = 32
        c.threshold = 0.062
        c.capRecords = 32
        c.lanes = 16
        c.adoption = .slot
        c.slotCap = 64
        c.device = .gpu
        c.memoLayers = 0
        c.readShape = .piece
        c.reserveBytes = defaultReserveBytes
        return c
    }

    /// The qualified default with the checkpoint's measured correction when one
    /// is located next to the weights (`RouterTapCorrection.locate`): the
    /// corrected attention tap the held-out confirmation measured at 1.031 over
    /// the plain tap, its file joining the reserve in whole MiB. Without a
    /// located correction this is `qualifiedDecode` unchanged. Selecting it is
    /// the engine's decision at load; the planner charges
    /// `DecodeLookahead.reserveBytes(correctionBytes:)` for it.
    package static func qualifiedDecode(correction: RouterTapCorrection.Located?) -> Self {
        var c = qualifiedDecode
        guard let correction else { return c }
        c.tap = .attentionCorrected
        c.windowLayers = 1
        c.correctionPath = correction.path
        c.correctionBytes = correction.header.fileBytes
        c.reserveBytes = DecodeLookahead.stagingReserveBytes + DecodeLookahead.roundedMiB(correction.header.fileBytes)
        return c
    }

    /// Reuse the existing plain attention mechanism in a separately identified
    /// native three-bit probe. It needs no correction bytes and keeps the same
    /// staging reserve. The original pack's measured gain does not qualify this
    /// configuration on different expert weights.
    package static var experimentalAffineAttention: Self {
        var c = qualifiedDecode
        c.tap = .attention
        c.windowLayers = 1
        return c
    }

    /// True when the environment selects an experimental lookahead instead of
    /// the qualified default: either prefetch switch, or an explicit reserve
    /// (the capacity control). Tuning variables alone do not change the default.
    package static func explicitlyConfigured(_ env: [String: String] = ProcessInfo.processInfo.environment) -> Bool {
        env["SLOTSTREAM_OPT_EXPERT_PREFETCH"] != nil || env["SLOTSTREAM_OPT_EXPERT_PREFETCH_SHADOW"] != nil
            || env["SLOTSTREAM_EXPERT_LOOKAHEAD_RESERVE_MIB"] != nil
    }
}
