import Foundation
import Slotstream

extension Diagnostics {
    /// Pure proposals and synthetic evidence only. No payload read, allocation,
    /// alternative pack registration or performance claim occurs here.
    public static func modelPackStartupSelection() throws -> CheckReport {
        var c = CheckBuilder("model-pack-startup-selection")
        let pack = ModelPackRegistry.baseline
        let hardware = ModelPackHardware(model: "fixture-mac", chip: "fixture-chip", osBuild: "fixture-os",
            nativeARM64: true, storage: .internalLocal, volumeID: "fixture-disk",
            thermalState: "nominal", lowPowerModeEnabled: false)
        let machine = Machine(ramGB: 48, workingSetGB: 36, availableGB: 40, isSimulated: false)
        let observed = ModelPackStartupObservation(pack: pack, hardware: hardware, mtpAvailable: true)
        func input(memory: Double? = nil, live: LiveMemoryManagement = .automatic,
                   observations: [ModelPackStartupObservation]? = nil, installed: [String: String]? = nil,
                   system: Machine? = nil, context: Int = 32768,
                   features: Set<ModelPackFeature> = [.text, .tools]) throws -> ModelPackSelectionContext {
            try ModelPackRegistry.startupContext(on: system ?? machine, hardware: hardware,
                contextTokens: context, requiredFeatures: features, customMemoryGB: memory, liveMemory: live,
                observations: observations ?? [observed],
                acceptedInstalledManifests: installed ?? [pack.id: pack.manifestDigest], incumbentPackID: pack.id)
        }
        let automatic = try input()
        let originalPlan = try pack.startupPlan(on: machine, mtpAvailable: true)
        c.equal("one accepted complete installation produces one proposal", automatic.candidates.count, 1)
        let proposal = automatic.candidates[0]
        c.equal("proposal uses the pack's own automatic ceiling", automatic.ceilingBytes,
            Int64(try pack.automaticMemoryCeilingGB(on: machine) * 1e9))
        c.equal("proposal prices the actual complete startup allocation", proposal.expectedPeakBytes,
            Int64(originalPlan.memoryLedger.expectedPeakBytes))
        c.equal("proposal keeps its observed storage and operating conditions", proposal.hardware, hardware)
        c.expect("proposal binds execution rather than an arbitrary recipe label",
            proposal.executionPolicyID.count == 64 && proposal.executionPolicyID != pack.startupDefaults.id)
        let custom = try input(memory: 14), fixed = try input(memory: 14, live: .fixed)
        c.equal("custom ceiling is preserved exactly", custom.ceilingBytes, 14_000_000_000)
        c.equal("live mode leaves the startup allocation unchanged",
            custom.candidates.first?.targetBytes, fixed.candidates.first?.targetBytes)
        c.expect("live mode changes the complete execution identity",
            custom.candidates.first?.configurationDigest != fixed.candidates.first?.configurationDigest)
        let fractional = try input(memory: 9.99, observations: [
            ModelPackStartupObservation(pack: pack, hardware: hardware, mtpAvailable: false)])
        c.equal("a supported custom limit is not rounded to a slider increment", fractional.ceilingBytes, 9_990_000_000)
        c.equal("the precise custom limit reaches the proposal", fractional.candidates.first?.targetBytes, 9_990_000_000)
        for state in [try input(installed: [:]), try input(installed: [pack.id: "changed"]),
                      try input(observations: []), try input(memory: 100), try input(memory: 1),
                      try input(context: 8192), try input(features: [.images]),
                      try input(system: Machine(ramGB: 48, workingSetGB: 36, availableGB: nil, isSimulated: false)),
                      try input(system: Machine(ramGB: 48, workingSetGB: 36, availableGB: 1, isSimulated: false))] {
            c.expect("missing, unaccepted, incompatible or infeasible content cannot propose itself", state.candidates.isEmpty)
        }
        let busy = try input(system: Machine(ramGB: 48, workingSetGB: 36, availableGB: 12, isSimulated: false))
        c.equal("a busy start cannot lower the automatic policy ceiling", busy.ceilingBytes, automatic.ceilingBytes)
        c.expect("busy startup proposes a smaller current allocation",
            (busy.candidates.first?.targetBytes ?? Int64.max) < proposal.targetBytes)
        for memory in [Double.nan, .infinity, -1, 0] {
            do { _ = try input(memory: memory); c.expect("invalid saved memory is refused", false) }
            catch { c.expect("invalid saved memory is refused", true) }
        }
        do { _ = try input(observations: [observed, observed]); c.expect("duplicate observations fail closed", false) }
        catch { c.expect("duplicate observations fail closed", true) }
        let corrected = ModelPackStartupObservation(pack: pack, hardware: hardware, mtpAvailable: true,
            originalLookahead: .automaticCorrected(bytes: TapCorrectionSidecar.attention.size))
        let correctedProposal = try input(observations: [corrected]).candidates.first
        c.expect("the active pinned correction changes the complete execution identity",
            correctedProposal != nil && correctedProposal?.executionPolicyID != proposal.executionPolicyID)
        for lookahead: DecodeLookaheadPlanning in [.off, .reserved(bytes: 1), .retained(enabled: true, bytes: 1),
                                                  .automaticCorrected(bytes: 1)] {
            c.expect("experimental or unknown forecast cannot inherit automatic evidence",
                try input(observations: [ModelPackStartupObservation(pack: pack, hardware: hardware,
                    mtpAvailable: true, originalLookahead: lookahead)]).candidates.isEmpty)
        }
        // The same generated proposal is consumable by the real matching
        // policy. This profile exists only in the diagnostic's local variable.
        let profile = AutomaticPackProfile(id: "fixture-startup", packID: pack.id, manifestDigest: pack.manifestDigest,
            executionPolicyID: proposal.executionPolicyID, contextTokens: proposal.contextTokens, features: proposal.features,
            qualityRank: 0, qualityReference: "fixture-quality", evidence: .measured(hardware: hardware,
                ramBytes: 48_000_000_000, configurationDigest: proposal.configurationDigest,
                decodeLowerBound: 21, reference: "fixture-only"))
        c.equal("actual generated proposal matches its exact synthetic complete profile",
            AutomaticPackPolicy.choose(automatic, profiles: [profile], registeredManifests: [pack.id: pack.manifestDigest])?.profile.id,
            profile.id)
        c.expect("a different saved ceiling cannot inherit that measured configuration",
            AutomaticPackPolicy.choose(custom, profiles: [profile], registeredManifests: [pack.id: pack.manifestDigest]) == nil)
        let selected = try ModelPackRegistry.resolve(.automatic, context: automatic)
        c.expect("production remains an unqualified supported fallback",
            selected.pack.id == pack.id && selected.automaticProfileID == nil && !selected.meetsMeasuredSpeedTarget)
        let overridden = try ModelPackRegistry.resolve(.pack(pack.id), context: try input(installed: [:]))
        c.expect("explicit choice remains exact without granting installation or allocation",
            overridden.pack.id == pack.id && !overridden.automatic && overridden.evidence == .unknown)
        let prospective = ModelPackStartupObservation.setup(pack: pack, hardware: hardware, environment: [:])
        c.expect("complete setup proposes its declared independent draft", prospective.mtpAvailable)
        c.equal("complete setup prices its pinned optional forecast", prospective.originalLookahead,
            .automaticCorrected(bytes: TapCorrectionSidecar.attention.size))
        let disabledForecast = ModelPackStartupObservation.setup(pack: pack, hardware: hardware,
            environment: ["SLOTSTREAM_OPT_EXPERT_PREFETCH": "0"])
        c.equal("setup respects an explicit forecast override", disabledForecast.originalLookahead, .off)
        let offer = try ModelPackRegistry.setupOffer(.automatic, on: machine, hardware: hardware,
            contextTokens: 32768, requiredFeatures: [.text, .tools], observations: [prospective])
        c.expect("an undownloaded setup offer is distinct from qualification",
            offer.pack.id == pack.id && offer.automatic && offer.evidence == .unknown && offer.automaticProfileID == nil)
        c.expect("creating an offer does not admit unaccepted files",
            try input(observations: [prospective], installed: [:]).candidates.isEmpty)
        let explicitOffer = try ModelPackRegistry.setupOffer(.pack(pack.id), on: machine, hardware: hardware,
            contextTokens: 32768, requiredFeatures: [.text, .tools], observations: [])
        c.expect("an explicit supported pack can be reviewed before it is installed",
            explicitOffer.pack.id == pack.id && !explicitOffer.automatic && explicitOffer.evidence == .unknown)
        do {
            _ = try ModelPackRegistry.setupOffer(.pack("unavailable-saved-choice"), on: machine, hardware: hardware,
                contextTokens: 32768, requiredFeatures: [.text, .tools], observations: [prospective])
            c.expect("setup cannot replace an unavailable explicit choice", false)
        } catch { c.expect("setup cannot replace an unavailable explicit choice", true) }
        do {
            _ = try ModelPackRegistry.setupOffer(.automatic, on: machine, hardware: hardware,
                contextTokens: 32768, requiredFeatures: [.text, .tools], observations: [prospective, prospective])
            c.expect("ambiguous setup observations are refused", false)
        } catch { c.expect("ambiguous setup observations are refused", true) }
        let temporary = FileManager.default.temporaryDirectory.appendingPathComponent("setup-destination-" + UUID().uuidString)
        try FileManager.default.createDirectory(at: temporary, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: temporary) }
        let existingVolume = ModelPackHardware.current(modelDirectory: temporary)
        let prospectiveVolume = ModelPackHardware.setupDestination(temporary.appendingPathComponent("new/pack"))
        c.equal("uncreated setup directory uses its existing ancestor's volume", prospectiveVolume.volumeID, existingVolume.volumeID)
        c.equal("uncreated setup directory keeps its actual storage class", prospectiveVolume.storage, existingVolume.storage)
        c.expect("prospective storage inspection creates no model directory",
            !FileManager.default.fileExists(atPath: temporary.appendingPathComponent("new").path))
        return c.report()
    }
}
