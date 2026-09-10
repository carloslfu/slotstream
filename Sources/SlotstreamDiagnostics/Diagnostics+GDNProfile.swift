import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Fixed-forward replay with and without serialized GDN attribution.
    /// All layers use real trained weights and activations after a 256-token
    /// nonzero-state prefix. This is not a request-speed qualification.
    public static func optimizationGDNProfile(modelDir: URL, tokens: Int) throws -> CheckReport {
        try optimizationPhaseProfile(modelDir: modelDir, tokens: tokens, transfer: false)
    }

    public static func optimizationTransferProfile(modelDir: URL, tokens: Int) throws -> CheckReport {
        try optimizationPhaseProfile(modelDir: modelDir, tokens: tokens, transfer: true)
    }

    private static func optimizationPhaseProfile(modelDir: URL, tokens: Int, transfer: Bool) throws -> CheckReport {
        guard [1, 32, 256, 1024].contains(tokens) else {
            throw ModelError("phase profile tokens must be 1, 32, 256 or 1024")
        }
        MLX.Memory.cacheLimit = 128 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640)
        var options = InferenceOptimizations()
        options.compactStateWindows = true
        model.optimizations = options
        let state = model.makeState()
        let prefix = (0 ..< 256).map { 1000 + ($0 * 7919) % 200_000 }
        let ids = (256 ..< 256 + tokens).map { 1000 + ($0 * 7919) % 200_000 }
        eval(try model.lastLogitsChecked(prefix, state: state))
        let checkpoint = state.checkpoint()
        let layerIDs = model.cfg.layerTypes.indices.filter { model.cfg.layerTypes[$0] == "linear_attention" }
        var c = CheckBuilder(transfer ? "optimization-expert-transfer-profile" : "optimization-gdn-phase-profile")
        c.measure("tokens", Double(tokens)); c.measure("prefix_tokens", 256)
        c.measure("gdn_layers", Double(layerIDs.count)); c.measure("rounds", 5)
        var referenceRoutes: [Int: [Int32]] = [:]
        model.routerObserver = { referenceRoutes[$0] = $1 }
        let reference = try model.lastLogitsChecked(ids, state: state)
        eval(reference)
        model.routerObserver = nil
        let referenceState = state.diagnosticTensors()
        eval(Array(referenceState.values))
        // Compile and exercise both scheduling patterns before timed replay.
        for traced in [false, true] {
            state.restore(checkpoint)
            if transfer {
                // The preceding full forward is evaluated above. Its final
                // layer's bookkeeping pins persist until the next layer entry.
                model.pool.unpinAll()
                try model.pool.diagnosticDiscardResidency()
            }
            model.gdnPhaseProfile = traced && !transfer ? GDNPhaseProfile() : nil
            model.pool.transferProfile = traced && transfer ? ExpertTransferProfile() : nil
            eval(try model.lastLogitsChecked(ids, state: state))
        }
        model.gdnPhaseProfile = nil
        model.pool.transferProfile = nil
        defer { model.gdnPhaseProfile = nil; model.pool.transferProfile = nil; model.routerObserver = nil }
        for round in 1 ... 5 {
            let arms = round.isMultiple(of: 2) ? [true, false] : [false, true]
            for traced in arms {
                state.restore(checkpoint)
                if transfer {
                    model.pool.unpinAll()
                    try model.pool.diagnosticDiscardResidency()
                }
                let profile = traced && !transfer ? GDNPhaseProfile() : nil
                let transferProfile = traced && transfer ? ExpertTransferProfile() : nil
                model.gdnPhaseProfile = profile
                model.pool.transferProfile = transferProfile
                var routes: [Int: [Int32]] = [:]
                // Route observation is identical in both arms; it is part of
                // this replay profile and not a silent request benchmark.
                model.routerObserver = { routes[$0] = $1 }
                model.pool.resetStats()
                let vmBefore = ProcessMemory.vmActivity()
                let powerBefore = ProcessMemory.operatingConditions()
                let sampler = FootprintSampler(intervalMilliseconds: 5)
                let start = RuntimeClock.now()
                let logits = try model.lastLogitsChecked(ids, state: state)
                eval(logits)
                let seconds = RuntimeClock.seconds(since: start)
                let footprint = sampler.finish()
                let vmAfter = ProcessMemory.vmActivity()
                let powerAfter = ProcessMemory.operatingConditions()
                model.routerObserver = nil
                model.gdnPhaseProfile = nil
                model.pool.transferProfile = nil
                let name = "round_\(round).\(traced ? "traced" : "untraced")"
                let clean = vmBefore != nil && vmAfter != nil
                    && vmBefore!.swapins == vmAfter!.swapins && vmBefore!.swapouts == vmAfter!.swapouts
                let nominal = powerBefore.thermalState == "nominal" && powerAfter.thermalState == "nominal"
                    && !powerBefore.lowPowerModeEnabled && !powerAfter.lowPowerModeEnabled
                let fits = footprint.samples > 0 && footprint.peakBytes > 0 && footprint.peakBytes <= 10_000_000_000
                c.expect("\(name): exact logits", (logits .== reference).all().item(Bool.self))
                c.equal("\(name): ordered routes", routes, referenceRoutes)
                let actualState = state.diagnosticTensors()
                c.equal("\(name): state fields", Set(actualState.keys), Set(referenceState.keys))
                for key in referenceState.keys.sorted() {
                    let actual = actualState[key]!, expected = referenceState[key]!
                    c.expect("\(name): exact state \(key)", actual.shape == expected.shape && actual.dtype == expected.dtype
                        && (actual.reshaped([-1]).view(dtype: .uint8) .== expected.reshaped([-1]).view(dtype: .uint8)).all().item(Bool.self))
                }
                c.expect("\(name): clean interval", clean)
                c.expect("\(name): nominal power", nominal)
                c.expect("\(name): sampled footprint within 10 GB", fits)
                c.measure("\(name).seconds", seconds)
                c.measure("\(name).expert_read_seconds", model.pool.ioSeconds)
                c.measure("\(name).scatter_enqueue_seconds", model.pool.scatterSeconds)
                c.measure("\(name).records_fetched", Double(model.pool.recordsFetched))
                c.measure("\(name).sampled_peak_bytes", Double(footprint.peakBytes))
                c.measure("\(name).footprint_samples", Double(footprint.samples))
                if let before = vmBefore, let after = vmAfter {
                    c.measure("\(name).swapins_before", Double(before.swapins))
                    c.measure("\(name).swapins_after", Double(after.swapins))
                    c.measure("\(name).swapouts_before", Double(before.swapouts))
                    c.measure("\(name).swapouts_after", Double(after.swapouts))
                }
                if let profile {
                    c.equal("\(name): all GDN layers observed once", profile.samples.map(\.layer), layerIDs)
                    c.expect("\(name): correct per-layer token extent", profile.samples.allSatisfy { $0.tokens == tokens })
                    for sample in profile.samples {
                        let key = "\(name).layer_\(sample.layer)"
                        c.measure("\(key).input_wait_seconds", sample.inputWait)
                        c.measure("\(key).preparation_seconds", sample.preparation)
                        c.measure("\(key).recurrence_seconds", sample.recurrence)
                        c.measure("\(key).finish_seconds", sample.finish)
                    }
                    for (key, values) in [
                        ("input_wait_seconds", profile.samples.map(\.inputWait)),
                        ("preparation_seconds", profile.samples.map(\.preparation)),
                        ("recurrence_seconds", profile.samples.map(\.recurrence)),
                        ("finish_seconds", profile.samples.map(\.finish))] {
                        c.expect("\(name): finite nonnegative \(key)", values.allSatisfy { $0.isFinite && $0 >= 0 })
                        c.measure("\(name).gdn_\(key)", values.reduce(0, +))
                    }
                }
                if let p = transferProfile {
                    c.expect("\(name): actual staging batches observed", p.batches > 0)
                    c.equal("\(name): nine buffers per complete batch", p.wrappedBuffers, p.batches * 9)
                    c.expect("\(name): bounded immediate release count", p.immediateReleaseBuffers >= 0 && p.immediateReleaseBuffers <= p.wrappedBuffers)
                    c.equal("\(name): exact read payload observed", p.allocatedBytes, model.pool.recordsFetched * model.pool.recordBytes)
                    for (key, value) in [
                        ("allocation_seconds", p.allocationSeconds), ("wrapping_seconds", p.wrappingSeconds),
                        ("staging_eval_seconds", p.stagingEvalSeconds),
                        ("scatter_prior_wait_seconds", p.scatterPriorWaitSeconds),
                        ("scatter_execution_seconds", p.scatterExecutionSeconds)] {
                        c.expect("\(name): finite nonnegative \(key)", value.isFinite && value >= 0)
                        c.measure("\(name).\(key)", value)
                    }
                    c.measure("\(name).allocated_bytes", Double(p.allocatedBytes))
                    c.measure("\(name).staging_batches", Double(p.batches))
                    c.measure("\(name).wrapped_buffers", Double(p.wrappedBuffers))
                    c.measure("\(name).immediate_release_buffers", Double(p.immediateReleaseBuffers))
                }
                if !clean || !nominal || !fits { return c.report() }
            }
        }
        return c.report()
    }
}
