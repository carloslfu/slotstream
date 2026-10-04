import Foundation
import Slotstream

extension Diagnostics {
    /// Synthetic evidence exercises policy without registering, downloading or
    /// allocating a model. Real speed/quality qualification stays independent.
    public static func automaticPackPolicy() throws -> CheckReport {
        var c = CheckBuilder("automatic-pack-policy")
        func system(model: String? = "test-mac", chip: String? = "test-chip", build: String? = "test-os",
                    native: Bool = true, storage: ModelPackHardware.Storage = .internalLocal,
                    volume: String? = "test-disk", thermal: String? = "nominal", lowPower: Bool? = false) -> ModelPackHardware {
            ModelPackHardware(model: model, chip: chip, osBuild: build, nativeARM64: native,
                storage: storage, volumeID: volume, thermalState: thermal, lowPowerModeEnabled: lowPower)
        }
        let hardware = system()
        let manifest = String(repeating: "a", count: 64), digest = String(repeating: "b", count: 64)
        let featureSet: Set<ModelPackFeature> = [.text, .tools, .prefixReuse]
        func candidate(_ id: String = "original", target: Int64 = 14_000_000_000,
                       peak: Int64 = 13_000_000_000, hash: String? = nil,
                       policy: String = "fixture-v1", context: Int = 32768,
                       features: Set<ModelPackFeature>? = nil, simulated: Bool = false) -> ModelPackCandidate {
            ModelPackCandidate(packID: id, manifestDigest: hash ?? manifest, executionPolicyID: policy,
                configurationDigest: digest, targetBytes: target, expectedPeakBytes: peak,
                contextTokens: context, features: features ?? featureSet, simulated: simulated)
        }
        func measured(_ id: String, pack: String = "original", rate: Double = 21,
                      rank: Int = 0, hash: String? = nil, quality: String = "fixture-outcomes",
                      hw: ModelPackHardware? = nil, configuration: String? = nil) -> AutomaticPackProfile {
            AutomaticPackProfile(id: id, packID: pack, manifestDigest: hash ?? manifest,
                executionPolicyID: "fixture-v1", contextTokens: 32768, features: featureSet,
                qualityRank: rank, qualityReference: quality,
                evidence: .measured(hardware: hw ?? hardware, ramBytes: 48_000_000_000,
                    configurationDigest: configuration ?? digest, decodeLowerBound: rate, reference: "fixture-run"))
        }
        func estimated(_ id: String = "estimate", anchors: [String] = ["anchor"],
                       quality: String = "fixture-outcomes", rationale: String = "bounded fixture geometry") -> AutomaticPackProfile {
            AutomaticPackProfile(id: id, packID: "original", manifestDigest: manifest,
                executionPolicyID: "fixture-v1", contextTokens: 32768, features: featureSet,
                qualityRank: 0, qualityReference: quality,
                evidence: .estimated(models: ["test-mac"], chips: ["test-chip"], osBuilds: ["test-os"],
                    storage: [.internalLocal], ramBytes: 16_000_000_000...64_000_000_000,
                    targetBytes: 10_000_000_000...24_000_000_000, anchors: anchors, rationale: rationale))
        }
        func context(candidates: [ModelPackCandidate]? = nil, installed: [String: String]? = nil,
                     ceiling: Int64 = 20_000_000_000, available: Double? = 40,
                     ram: Double = 48, working: Double = 36, hw: ModelPackHardware? = nil,
                     tokens: Int = 32768, features: Set<ModelPackFeature> = [.text, .tools],
                     incumbent: String? = nil, simulated: Bool = false) -> ModelPackSelectionContext {
            ModelPackSelectionContext(machine: Machine(ramGB: ram, workingSetGB: working,
                availableGB: available, isSimulated: simulated), hardware: hw ?? hardware,
                ceilingBytes: ceiling, contextTokens: tokens, requiredFeatures: features,
                acceptedInstalledManifests: installed ?? ["original": manifest, "candidate": manifest],
                candidates: candidates ?? [candidate(), candidate("candidate")], incumbentPackID: incumbent)
        }
        let registered = ["original": manifest, "candidate": manifest]
        func choose(_ profiles: [AutomaticPackProfile], _ input: ModelPackSelectionContext? = nil) -> AutomaticPackPolicy.Match? {
            AutomaticPackPolicy.choose(input ?? context(), profiles: profiles, registeredManifests: registered)
        }
        let original = measured("original-point"), alternative = measured("candidate-point", pack: "candidate", rate: 23, rank: 1)
        c.equal("quality wins once both measured configurations meet the target", choose([alternative, original])?.profile.id, original.id)
        c.equal("meeting the speed target precedes quality ranking among qualified packs",
            choose([measured("slow", rate: 19), alternative])?.profile.id, alternative.id)
        let miss = choose([measured("slow", rate: 19)])
        c.expect("a measured miss stays supported without acquiring a passing target", miss?.evidence == .measured && miss?.targetMet == false)
        let tied = measured("a-candidate", pack: "candidate", rate: 21)
        c.equal("incumbent breaks an otherwise equal comparison", choose([original, tied], context(incumbent: "original"))?.profile.id, original.id)
        c.equal("deterministic final tie break ignores registry order", choose([original, tied])?.profile.id, choose([tied, original])?.profile.id)
        c.expect("unknown installed content cannot be selected", choose([original], context(installed: [:])) == nil)
        c.expect("a different installed digest cannot be selected", choose([original], context(installed: ["original": "stale"])) == nil)
        c.expect("an unregistered pack cannot qualify itself", choose([measured("remote", pack: "downloaded")],
            context(candidates: [candidate("downloaded")], installed: ["downloaded": manifest])) == nil)
        c.expect("an unqualified outcome profile is excluded", choose([measured("no-quality", quality: "")]) == nil)
        c.expect("ambiguous profile identities fail closed", choose([original, original]) == nil)
        c.expect("configuration changes lose the old measurement", choose([measured("old", configuration: "changed")]) == nil)
        for invalid in [Double.nan, .infinity, 0, -1] {
            c.expect("invalid measured bound cannot pass", choose([measured("bad-rate", rate: invalid)]) == nil)
        }
        for input in [context(ceiling: 13_999_999_999), context(ceiling: 0), context(available: nil),
                      context(available: .nan), context(available: .infinity), context(available: -1),
                      context(available: 49), context(working: 49), context(ram: .nan),
                      context(working: 1), context(working: .infinity), context(tokens: 8192),
                      context(features: [.images]), context(candidates: [candidate(peak: 14_000_000_001)]),
                      context(candidates: [candidate(peak: 0)]), context(candidates: [candidate(target: 0)]),
                      context(candidates: [candidate(policy: "changed")]),
                      context(candidates: [candidate(hash: "changed")]),
                      context(candidates: [candidate(context: 8192)]),
                      context(candidates: [candidate(features: [.text])])] {
            c.expect("infeasible or mismatched complete configuration is excluded", choose([original], input) == nil)
        }
        let minimumAvailability = 14 + Planner.availabilitySlackGB(ramGB: 48)
        // Decimal GB cannot represent every byte boundary exactly. The next
        // representable value floors to the intended exact available bytes;
        // the production conversion remains conservative rather than adding
        // a floating-point tolerance to the allocation allowance.
        c.expect("exact custom ceiling and headroom are admitted", choose([original],
            context(ceiling: 14_000_000_000, available: minimumAvailability.nextUp, working: 16)) != nil)
        c.expect("one byte below the headroom requirement is excluded", choose([original],
            context(available: minimumAvailability - 1e-9)) == nil)
        for changed in [system(model: "different"), system(chip: "different"), system(build: "updated"),
                        system(volume: "different-disk"), system(native: false), system(storage: .unknown, volume: nil),
                        system(thermal: "fair"), system(lowPower: true), system(thermal: nil, lowPower: nil)] {
            c.expect("changed hardware does not inherit a measured result", choose([original], context(hw: changed)) == nil)
        }
        for changed in [system(thermal: "fair"), system(lowPower: true), system(thermal: nil, lowPower: nil)] {
            c.expect("an unsupported operating-state profile cannot qualify itself",
                choose([measured("unsupported-conditions", hw: changed)], context(hw: changed)) == nil)
        }
        c.expect("a RAM estimate is not a measured profile", choose([original], context(ram: 64)) == nil)
        c.expect("simulated machine cannot produce measured evidence", choose([original], context(simulated: true)) == nil)
        c.expect("simulated plan cannot produce measured evidence", choose([original], context(candidates: [candidate(simulated: true)])) == nil)
        let anchor = measured("anchor", rate: 18), estimate = estimated()
        let estimatedMatch = choose([anchor, estimate], context(ram: 64, working: 48))
        c.expect("reviewed larger-Mac estimate keeps its evidence and missing speed bound",
            estimatedMatch?.evidence == .estimated && estimatedMatch?.decodeLowerBound == nil && estimatedMatch?.targetMet == false)
        c.equal("a local measured match precedes an estimated profile", choose([anchor, estimate])?.evidence, .measured)
        for profiles in [[estimate], [estimated(anchors: ["estimate"])], [anchor, estimated(anchors: ["anchor", "anchor"])],
                         [anchor, estimated(quality: "different")], [anchor, estimated(rationale: "")]] {
            c.expect("missing, circular, duplicate or unrelated estimate anchors are excluded",
                choose(profiles, context(ram: 64, working: 48)) == nil)
        }
        c.expect("estimate does not extrapolate outside its RAM scope", choose([anchor, estimate], context(ram: 96)) == nil)
        c.expect("estimate does not extrapolate outside its target scope", choose([anchor, estimate],
            context(candidates: [candidate(target: 25_000_000_000)], ceiling: 30_000_000_000, ram: 64, working: 48)) == nil)
        let planning = choose([anchor, estimate], context(ram: 64, working: 48, simulated: true))
        c.expect("planner-only estimate never grants a measured badge", planning?.evidence == .estimated && planning?.targetMet == false)
        let baseline = ModelPackRegistry.baseline
        let plan = try Planner.plan(PlanRequest(memoryLimitGB: 14, mtp: .off, vision: .off, maxContextTokens: 32768),
            on: .simulated(ramGB: 48, availableGB: 40))
        let actual = try ModelPackCandidate(pack: baseline, plan: plan, executionPolicyID: "test-v1", tools: true, prefixReuse: true)
        let changed = try ModelPackCandidate(pack: baseline, plan: plan, executionPolicyID: "test-v2", tools: true, prefixReuse: true)
        let noPrefix = try ModelPackCandidate(pack: baseline, plan: plan, executionPolicyID: "test-v1", tools: true, prefixReuse: false)
        c.expect("public candidate fingerprints complete plan and execution policy",
            actual.configurationDigest != changed.configurationDigest && actual.configurationDigest != noPrefix.configurationDigest &&
            actual.targetBytes == 14_000_000_000 && actual.simulated && actual.expectedPeakBytes <= actual.targetBytes)
        let research = try Planner.plan(resources: .affine3GroupedControl, expertsPerLayer: nil, poolGB: nil,
            memoryGB: 14, ramGB: 48, workingSetGB: 36, availableGB: 40, mtp: .off, vision: .off,
            maxContextTokens: 32768, simulated: true, qualification: false, mtpExperts: .automatic)
        do {
            _ = try ModelPackCandidate(pack: baseline, plan: research, executionPolicyID: "test-v1", tools: true, prefixReuse: true)
            c.expect("parent pack cannot authorize candidate resource arithmetic", false)
        } catch { c.expect("parent pack cannot authorize candidate resource arithmetic", true) }
        let auto = try ModelPackRegistry.resolve(.automatic, context: context())
        c.expect("empty production registry remains an honest supported fallback", auto.pack.id == baseline.id &&
            auto.automaticProfileID == nil && auto.evidence == .unknown && !auto.meetsMeasuredSpeedTarget)
        let retained = try ModelPackRegistry.resolve(.automatic, context: context(candidates: [actual],
            installed: [baseline.id: baseline.manifestDigest], incumbent: baseline.id))
        c.expect("unmatched Auto preserves an accepted supported incumbent", retained.pack.id == baseline.id &&
            retained.reason.contains("Keeps") && retained.evidence == .unknown)
        let override = try ModelPackRegistry.resolve(.pack(baseline.id), context: context(available: nil))
        c.expect("explicit override is independent of recommendation and still needs admission", !override.automatic &&
            override.pack.id == baseline.id && override.evidence == .unknown && !override.meetsMeasuredSpeedTarget)
        do { _ = try ModelPackRegistry.resolve(.pack("removed"), context: context()); c.expect("missing explicit pack is preserved as an error", false) }
        catch { c.expect("missing explicit pack is preserved as an error", true) }
        let legacyResolver: (ModelPackSelection) throws -> ModelPackDecision = ModelPackRegistry.resolve
        c.equal("old resolver function-value type is preserved", try legacyResolver(.automatic).pack.id, baseline.id)
        for gb in [Double.nan, .infinity, -1, 1e100] { c.expect("byte conversion rejects invalid bounds", AutomaticPackPolicy.bytes(gb) == nil) }
        return c.report()
    }
}
