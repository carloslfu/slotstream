import Foundation

/// An applied load, not a saved preference or a promise about speed. The
/// generation changes after every reload; reusable arithmetic identity also
/// binds the executable and actual engine optimizations through the existing
/// persistent-prefix identity. Live cache resizing stays within this load's
/// context/features/ceiling and is reported separately by the current plan.
public struct AppliedModelConfiguration: Codable, Equatable, Sendable {
    public let generation: UUID
    public let identity: String
    public let packID: String
    public let manifestDigest: String
    public let contextTokens: Int
    public let mtp: Bool
    public let vision: Bool
    public let liveMemory: LiveMemoryManagement
    public let startupTargetGB: Double?
    public let memoryCeilingGB: Double?
}

extension Engine {
    /// For product owners after verifying the registered pack and completing
    /// Engine initialization. Legacy load and serving entry points are intact.
    public func appliedConfiguration(pack: ModelPack, liveMemory: LiveMemoryManagement) throws -> AppliedModelConfiguration {
        try withExclusive {
            guard ModelPackRegistry.supported.contains(where: { $0.id == pack.id && $0.manifestDigest == pack.manifestDigest }),
                  let plan = currentPlan else { throw ModelError("Cannot identify an unsupported or unplanned product configuration") }
            let arithmetic = try PersistentPrefixIdentity.make(model: model, modelDirectory: modelDir)
            let ledger = try JSONSerialization.data(withJSONObject: plan.json(), options: [.sortedKeys])
            let identity = PersistentPrefixIdentity(components: ["schema": "product-configuration-v1",
                "pack": pack.manifestDigest, "arithmetic": arithmetic.digest,
                "plan": String(decoding: ledger, as: UTF8.self), "live_memory": liveMemory.rawValue]).digest
            return AppliedModelConfiguration(generation: UUID(), identity: identity, packID: pack.id,
                manifestDigest: pack.manifestDigest, contextTokens: plan.maxContextTokens,
                mtp: plan.mtpEnabled, vision: plan.visionEnabled, liveMemory: liveMemory,
                startupTargetGB: plan.targetGB, memoryCeilingGB: plan.memoryLimitGB)
        }
    }
}
