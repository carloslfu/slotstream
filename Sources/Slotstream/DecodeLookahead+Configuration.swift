import Foundation

extension DecodeLookaheadPlanning {
    /// `automatic` unless the environment names a prefetch switch or an explicit
    /// reserve. `SLOTSTREAM_OPT_EXPERT_PREFETCH=0` turns the default off; `=1`
    /// selects the experimental configuration its tuning variables describe.
    public static func environment(_ env: [String: String] = ProcessInfo.processInfo.environment) -> Self {
        guard ExpertPrefetchConfiguration.explicitlyConfigured(env) else { return .automatic }
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

    /// True when the environment selects an experimental lookahead instead of
    /// the qualified default: either prefetch switch, or an explicit reserve
    /// (the capacity control). Tuning variables alone do not change the default.
    package static func explicitlyConfigured(_ env: [String: String] = ProcessInfo.processInfo.environment) -> Bool {
        env["SLOTSTREAM_OPT_EXPERT_PREFETCH"] != nil || env["SLOTSTREAM_OPT_EXPERT_PREFETCH_SHADOW"] != nil
            || env["SLOTSTREAM_EXPERT_LOOKAHEAD_RESERVE_MIB"] != nil
    }
}
