import Foundation
import Slotstream

extension Diagnostics {
    public static func modelPackStartupDefaults() throws -> CheckReport {
        var c = CheckBuilder("model-pack-startup-defaults")
        let pack = ModelPackRegistry.baseline, defaults = ModelPackRegistry.baseline.startupDefaults
        let research = ModelPackRegistry.researchStandalone
        try research.startupDefaults.validate(resources: research.memoryProfile)
        let researchPlan = try research.startupPlan(customMemoryGB: 14,
            on: .simulated(ramGB: 48, availableGB: 40), mtpAvailable: true)
        c.expect("standalone recipe prices streamed drafts and lookahead inside the saved ceiling",
            researchPlan.mtpStreamedExperts && researchPlan.decodeLookahead && researchPlan.expectedPeakGB <= 14
                && researchPlan.memoryLimitGB == 14 && researchPlan.resources == .affine3Native)
        c.expect("local trial remains outside supported selection and downloads",
            !ModelPackRegistry.supported.contains(where: { $0.id == research.id }))
        do { _ = try ModelPackRegistry.resolve(.pack(research.id)); c.expect("research pack cannot be selected by users", false) }
        catch { c.expect("research pack cannot be selected by users", true) }
        c.equal("legacy activation mapping binds the exact historical startup recipe",
            defaults.recipeIdentity, ModelPackStartupDefaults.legacyOriginalRecipeIdentity)
        func encoded(_ plan: MemoryPlan) throws -> Data {
            try JSONSerialization.data(withJSONObject: plan.json(), options: [.sortedKeys])
        }
        try defaults.validate(resources: pack.memoryProfile)
        for ram in [16.0, 24, 32, 48, 64, 96] {
            let quiet = Machine.simulated(ramGB: ram, availableGB: ram)
            let busy = Machine.simulated(ramGB: ram, availableGB: 1)
            let ceiling = try pack.automaticMemoryCeilingGB(on: quiet)
            c.equal("automatic ceiling ignores transient availability/\(ram)",
                try pack.automaticMemoryCeilingGB(on: busy), ceiling)
            let expected = min(Planner.usefulCeilingGB, floor(Planner.maximumMemoryLimitGB(
                ramGB: ram, workingSetGB: quiet.workingSetGB) * 2) / 2)
            c.equal("original Desktop keeps its existing total ceiling/\(ram)", ceiling, expected)
            for draft in [false, true] {
                let proposed = try pack.startupPlan(on: quiet, mtpAvailable: draft)
                let legacy = try Planner.plan(PlanRequest(memoryLimitGB: ceiling, mtp: .auto,
                    vision: .off, maxContextTokens: 32768), on: quiet, mtpAvailable: draft)
                c.equal("original complete plan remains byte-identical/\(ram)/\(draft)", try encoded(proposed), try encoded(legacy))
                c.expect("simulated startup never creates measured evidence", proposed.simulated)
            }
            do { _ = try pack.startupPlan(on: busy); c.expect("automatic policy cannot waive current headroom", false) }
            catch { c.expect("automatic policy cannot waive current headroom", true) }
        }

        func recipe(id: String = "fixture-startup", ceiling: Int64 = 14_000_000_000, context: Int = 32768,
                    draft: Planner.MTPMode = .auto, placement: Planner.MTPExpertPlacement = .automatic, depth: Int = 2,
                    lookahead: ModelPackStartupDefaults.Lookahead = .originalAutomatic,
                    prefix: Bool = true, short: Int = 1536, chunk: Int = 512,
                    keepAlive: GPUKeepAlive.Policy = .auto, reference: String = "fixture-only") -> ModelPackStartupDefaults {
            ModelPackStartupDefaults(id: id, automaticCeilingBytes: ceiling, contextTokens: context,
                draftMode: draft, draftPlacement: placement, draftDepth: depth, lookahead: lookahead,
                prefixCacheEnabled: prefix, shortPromptTokens: short, shortPromptChunk: chunk,
                gpuKeepAlive: keepAlive, reference: reference)
        }
        let own = recipe(), quiet = Machine.simulated(ramGB: 48, availableGB: 40)
        // A synthetic recipe over the same ledger isolates policy ownership.
        // It does not construct or register an alternative product artifact.
        c.equal("a pack recipe does not borrow the original automatic cap",
            try own.automaticCeilingGB(resources: .original, on: quiet), 14)
        let ownPlan = try own.plan(pack: pack, customMemoryGB: nil, on: quiet,
            mtpAvailable: true, originalLookahead: .automatic)
        c.equal("startup uses the recipe's own saved ceiling", ownPlan.memoryLimitGB, 14)
        let pressured = try own.plan(pack: pack, customMemoryGB: nil,
            on: .simulated(ramGB: 48, availableGB: 12), mtpAvailable: false, originalLookahead: .automatic)
        c.expect("busy initial target retains the larger recipe ceiling",
            (pressured.targetGB ?? 14) < 14 && pressured.memoryLimitGB == 14)
        let custom = try own.plan(pack: pack, customMemoryGB: 30, on: quiet,
            mtpAvailable: true, originalLookahead: .automatic)
        c.expect("custom may exceed the automatic recommendation without replacement",
            custom.memoryLimitGB == 30 && custom.targetGB == 30 && custom.resources == .original)
        let fractional = try own.plan(pack: pack, customMemoryGB: 9.99, on: quiet,
            mtpAvailable: false, originalLookahead: .automatic)
        c.expect("a valid precise custom value is never rounded to the control increment",
            fractional.memoryLimitGB == 9.99 && fractional.targetGB == 9.99)
        let corrected = try pack.startupPlan(on: quiet, mtpAvailable: true,
            originalLookahead: .automaticCorrected(bytes: 40_000_000))
        let uncorrected = try pack.startupPlan(on: quiet, mtpAvailable: true)
        c.expect("original forecast bytes remain separately charged inside the same ceiling",
            corrected.lookaheadReserveBytes > uncorrected.lookaheadReserveBytes && corrected.slots < uncorrected.slots
                && corrected.memoryLimitGB == uncorrected.memoryLimitGB)
        c.equal("an explicit candidate recipe cannot inherit original correction settings",
            recipe(lookahead: .uncorrected).planningLookahead(original: .automaticCorrected(bytes: 40_000_000)),
            .retained(enabled: true, bytes: DecodeLookahead.reserveBytes))
        for invalid in [Double.nan, .infinity, -1, 0, 8, 100] {
            do { _ = try own.plan(pack: pack, customMemoryGB: invalid, on: quiet,
                mtpAvailable: false, originalLookahead: .automatic); c.expect("invalid saved limits fail before allocation", false) }
            catch { c.expect("invalid saved limits fail before allocation", true) }
        }
        for available: Double? in [nil, .nan, .infinity, -1, 49] {
            let unknown = Machine.simulated(ramGB: 48, availableGB: available)
            c.equal("missing or invalid availability does not rewrite the hardware ceiling",
                try own.automaticCeilingGB(resources: .original, on: unknown), 14)
            do { _ = try own.plan(pack: pack, customMemoryGB: nil, on: unknown,
                mtpAvailable: false, originalLookahead: .automatic); c.expect("unknown headroom cannot admit a plan", false) }
            catch { c.expect("unknown headroom cannot admit a plan", true) }
        }
        for machine in [Machine.simulated(ramGB: 8), .simulated(ramGB: .nan), .simulated(ramGB: .infinity),
                        .simulated(ramGB: 48, workingSetGB: 49), .simulated(ramGB: 48, workingSetGB: 1)] {
            do { _ = try pack.automaticMemoryCeilingGB(on: machine); c.expect("invalid hardware cannot invent an automatic cap", false) }
            catch { c.expect("invalid hardware cannot invent an automatic cap", true) }
        }
        for invalid in [recipe(id: ""), recipe(ceiling: 0), recipe(ceiling: 14_000_000_001), recipe(context: 0),
                        recipe(depth: 5), recipe(draft: .off), recipe(short: 32769), recipe(chunk: 128),
                        recipe(lookahead: .uncorrected), recipe(reference: "")] {
            do { try invalid.validate(resources: .original); c.expect("malformed or incompatible compiled recipes fail closed", false) }
            catch { c.expect("malformed or incompatible compiled recipes fail closed", true) }
        }
        try recipe(draft: .off, depth: 0).validate(resources: .original)
        try recipe(lookahead: .off).validate(resources: .affine3GroupedControl)
        try recipe(lookahead: .uncorrected).validate(resources: .affine3GroupedLookaheadControl)
        let identity = own.executionIdentity(liveMemory: .automatic)
        c.equal("execution identities are deterministic", identity, recipe().executionIdentity(liveMemory: .automatic))
        for changed in [recipe(depth: 3), recipe(short: 0), recipe(chunk: 1024), recipe(prefix: false),
                        recipe(keepAlive: .on), recipe(lookahead: .off), recipe(placement: .streamed), recipe(context: 8192)] {
            c.expect("changing a non-planner choice changes execution identity",
                changed.executionIdentity(liveMemory: .automatic) != identity)
        }
        c.expect("live adjustment is independent but remains identified",
            own.executionIdentity(liveMemory: .fixed) != identity)
        c.equal("startup policy does not change the original download manifest", pack.manifestDigest,
            "8e10fef2cfa5c6d8590494f5dbed440a7617a404fa17ce169cf55fb99b71e082")
        let older: [String: Any] = ["generation": UUID().uuidString, "identity": String(repeating: "1", count: 64),
            "packID": pack.id, "manifestDigest": pack.manifestDigest, "contextTokens": 32768,
            "mtp": false, "vision": false, "liveMemory": "automatic", "startupTargetGB": 10, "memoryCeilingGB": 10]
        let decoded = try JSONDecoder().decode(AppliedModelConfiguration.self,
            from: JSONSerialization.data(withJSONObject: older, options: [.sortedKeys]))
        c.expect("older applied receipts retain missing startup policy explicitly",
            decoded.startupPolicyID == nil && decoded.executionPolicyIdentity == nil)
        return c.report()
    }
}
