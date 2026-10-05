---
type: run
created: 2026-10-05T00:22:31.778223+00:00
updated: 2026-10-05T00:22:31.778223+00:00
summary: Explicit machine-observation identity in the final prepared startup-selection fixture
binary: Source on 21b976671b8473657f08cd77fb36c8ce876022ec plus captured edits; native acceptance pending
captured_at: 2026-10-04
command: Read Machine initializer contract; git diff --check
discarded: false
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Startup selection fixture identity correction
tool: Source review and exact final fixture capture
---

The fixture in [[sources/runs/2026/10/2026-10-04-pack-startup-proposals-preparation]] omitted the required explicit isSimulated argument at three constructor calls. Source review of Machine.init found this before native compilation of the proposal stage. The final source below explicitly marks these synthetic policy inputs as observations so they exercise missing/low headroom and exact measured-profile matching. No model allocation or real measurement occurs. All scenarios, thresholds and assertions are unchanged; native compilation and assertions remain pending.

### Sources/SlotstreamDiagnostics/Diagnostics+ModelPackStartupSelection.swift

Bytes: 7591. SHA-256: `15b11cf7cfebcdd5acd910ade73c4091673b3adb5149ebb1f71e28c2b240a750`.

````swift
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
        return c.report()
    }
}

````
