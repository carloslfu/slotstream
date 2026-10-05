import Foundation
import MLX

/// Produced only by an Engine observing its loaded controls. A caller-created
/// planner proposal cannot substitute for this observation when confirming a
/// speed profile. Complete file authentication and health remain the owner's
/// separate obligations before publication.
public struct LoadedModelPackCandidate: Sendable {
    public let candidate: ModelPackCandidate
    public let hardware: ModelPackHardware
    public let physicalRAMGB: Double
    fileprivate init(candidate: ModelPackCandidate, hardware: ModelPackHardware, physicalRAMGB: Double) {
        self.candidate = candidate; self.hardware = hardware; self.physicalRAMGB = physicalRAMGB
    }
}

extension Engine {
    /// Conservative boundary for measured product evidence. Explicit runtime
    /// experiments remain usable, but cannot inherit the default profile's
    /// measurements. Only names are inspected; secret values are never hashed,
    /// retained or exposed as evidence. These two names select test/build tools
    /// and have no effect on execution inside an already built runtime.
    package static func admitsStartupEvidence(environment: [String: String],
        build: SlotstreamBuild.PerformanceConfiguration = .current) -> Bool {
        guard build == .release else { return false }
        let tooling: Set<String> = ["SLOTSTREAM_TEST_BINARY", "SLOTSTREAM_METALLIB_MACOS"]
        return !environment.keys.contains { name in
            (name.hasPrefix("SLOTSTREAM_") && !tooling.contains(name)) || name.hasPrefix("MLX_")
        }
    }

    /// Observe a loaded runtime under the generation gate. This never opens
    /// weight files or initializes a missing correction. A proposal alone must
    /// not be treated as the actual runtime after headroom, feature or kernel
    /// fallback changed during loading. Call after the bounded startup check.
    public func startupCandidate(pack: ModelPack, liveMemory: LiveMemoryManagement,
                                 observation: ModelPackStartupObservation) throws -> LoadedModelPackCandidate? {
        try withExclusive {
            let machine = Machine.current()
            guard Self.admitsStartupEvidence(environment: ProcessInfo.processInfo.environment),
                  let plan = currentPlan,
                  !plan.simulated, plan.ramGB == machine.ramGB,
                  try startupExecutionIdentity(pack: pack, liveMemory: liveMemory) != nil,
                  observation.hardware == ModelPackHardware.current(modelDirectory: modelDir),
                  Device.defaultDevice() == .gpu,
                  (model.mtpHead != nil) == plan.mtpEnabled else { return nil }
            let expectedOptimizations = pack.startupOptimizations(plan: plan, hardware: observation.hardware)
            guard model.optimizations == expectedOptimizations,
                  expectedOptimizations.fusedPrefillAttention != true || FusedPrefillAttention.available,
                  model.decodeBarrierLayers == (plan.decodeLookahead ? DecodeLookahead.barrierLayers : 1) else { return nil }
            if plan.decodeLookahead {
                guard let scheduler = model.lookahead?.prefetch else { return nil }
                var expected = ExpertPrefetchConfiguration.qualifiedDecode
                if pack.startupDefaults.lookahead == .originalAutomatic,
                   case .automaticCorrected(let bytes) = observation.originalLookahead {
                    let pins = pack.decodeForecastFiles.filter { $0.size == bytes }
                    guard pins.count == 1, scheduler.loadedTapCorrectionIdentity == pins[0].sha256,
                          let path = scheduler.configuration.correctionPath,
                          URL(fileURLWithPath: path).standardizedFileURL.resolvingSymlinksInPath()
                            == modelDir.appendingPathComponent(pins[0].path).standardizedFileURL.resolvingSymlinksInPath() else { return nil }
                    expected.tap = .attentionCorrected; expected.windowLayers = 1
                    expected.correctionPath = path; expected.correctionBytes = bytes
                    // The scheduler owns staging and correction bytes. The
                    // plan also charges the model's separate router cache.
                    expected.reserveBytes += DecodeLookahead.roundedMiB(bytes)
                }
                guard scheduler.configuration == expected else { return nil }
            } else if model.lookahead?.prefetch != nil { return nil }
            guard let candidate = try pack.startupCandidate(plan: plan, liveMemory: liveMemory, observation: observation) else { return nil }
            return LoadedModelPackCandidate(candidate: candidate, hardware: observation.hardware, physicalRAMGB: machine.ramGB)
        }
    }
}
