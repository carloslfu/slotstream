import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationFloorCacheMechanism(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        let store = try ExpertStore(index: CheckpointIndex(dir: modelDir))
        let pool = SlotPool(slots: Geometry.floorSlots, store: store)
        pool.layerLocalFloorEviction = true
        let original = (0 ..< Geometry.floorSlots).map { ExpertKey($0 / 512, $0 % 512) }
        _ = try pool.ensureChecked(original)
        var c = CheckBuilder("optimization-floor-cache-mechanism")
        c.equal("initial empty arena admits each requested record once", pool.recordsFetched, 640)
        c.equal("complete initial demand is pinned", pool.pinnedSlotCount, 640)
        do {
            _ = try pool.ensureChecked([ExpertKey(1, 200)])
            c.expect("exhausted request refuses before eviction", false)
        } catch SlotPoolError.exhausted {
            c.equal("exhaustion cannot evict a pinned record", pool.floorLocalVictims, 0)
            c.equal("exhaustion cannot issue a read", pool.recordsFetched, 640)
        }
        pool.unpinAll(); pool.resetStats()
        let chosen = try pool.ensureChecked([ExpertKey(1, 0), ExpertKey(1, 200)])
        c.equal("current requested hit remains pinned", chosen[0], 512)
        c.equal("unused current-layer record is the first eligible victim", chosen[1], 513)
        c.expect("other layers retain upcoming records", pool.isResident(ExpertKey(0, 0)))
        c.expect("the displaced current-layer mapping is removed", !pool.isResident(ExpertKey(1, 1)))
        c.equal("local selection is observed", pool.floorLocalVictims, 1)
        c.equal("one actual record read for one new key", pool.recordsFetched, 1)
        let expected = store.readBatch([ExpertKey(1, 200)])
        let actual = pool.gatherResident([ExpertKey(1, 200)])
        for piece in expected.indices {
            c.expect("replaced slot has exact tensor bytes \(piece)", (expected[piece] .== actual[piece]).all().item(Bool.self))
        }
        pool.unpinAll(); pool.resize(to: 641)
        _ = try pool.ensureChecked([ExpertKey(2, 0)]) // fills the one new empty slot
        pool.unpinAll(); pool.resetStats()
        _ = try pool.ensureChecked([ExpertKey(2, 1)])
        c.equal("one slot above the floor retains ordinary CLOCK", pool.floorLocalVictims, 0)
        c.expect("larger arena can lend capacity across layers", !pool.isResident(ExpertKey(0, 0)))
        pool.unpinAll(); pool.resize(to: 640)
        _ = try pool.ensureChecked(original)
        pool.unpinAll(); pool.resetStats()
        let staged = store.readBatch([ExpertKey(1, 200)])
        pool.admit(layer: 1, experts: [200], rows: [0], from: staged)
        pool.commitAdmissions()
        c.equal("staged sweep admission retains ordinary CLOCK", pool.floorLocalVictims, 0)
        c.expect("staged admission does not take the current-layer victim", pool.isResident(ExpertKey(1, 1)))
        c.expect("staged admission uses the original cross-layer hand", !pool.isResident(ExpertKey(0, 0)))
        let admitted = pool.gatherResident([ExpertKey(1, 200)])
        for piece in staged.indices {
            c.expect("staged fallback has exact tensor bytes \(piece)", (staged[piece] .== admitted[piece]).all().item(Bool.self))
        }
        return c.report()
    }

    public static func optimizationLayerLocalVictim() -> CheckReport {
        var c = CheckBuilder("optimization-layer-local-victim")
        for count in [1, 4, 17, 640] {
            for hand in Set([0, count - 1]) {
                for layer in [0, 2, 47] {
                    for pattern in 0 ..< 8 {
                        let keys: [ExpertKey?] = (0 ..< count).map {
                            pattern & 1 != 0 && $0 % 4 == 0 ? nil : ExpertKey($0 % 3, $0 % 512)
                        }
                        let pins = Set((0 ..< count).filter { pattern & 4 != 0 || pattern & 2 != 0 && $0 % 3 == 0 })
                        let result = LayerLocalVictim.choose(count: count, hand: hand, layer: layer,
                            keyAt: { keys[$0] }, isPinned: { pins.contains($0) })
                        let order = (0 ..< count).map { (hand + $0) % count }.filter { !pins.contains($0) }
                        let empty = order.first { keys[$0] == nil }
                        let eligible = order.first { keys[$0]?.layer == layer }
                        let label = "\(count)/\(hand)/\(layer)/\(pattern)"
                        c.equal("\(label): empty priority, then circular eligible victim", result, empty ?? eligible)
                        if let result {
                            c.expect("\(label): requested resident records cannot be evicted", !pins.contains(result))
                        }
                    }
                }
            }
        }
        for (count, hand, layer) in [(0, 0, 0), (1, -1, 0), (1, 1, 0), (1, 0, -1)] {
            var inspected = false
            let result = LayerLocalVictim.choose(count: count, hand: hand, layer: layer,
                keyAt: { _ in inspected = true; return nil }, isPinned: { _ in inspected = true; return false })
            c.expect("invalid domain is rejected before inspecting storage", result == nil && !inspected)
        }
        return c.report()
    }
}
