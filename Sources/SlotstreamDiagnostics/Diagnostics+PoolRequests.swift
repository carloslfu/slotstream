import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationPoolRequests(modelDir: URL, slotSlices: Bool = false, wordWrites: Bool = false, cpuWrites: Bool = false) throws -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        let store = try ExpertStore(index: CheckpointIndex(dir: modelDir))
        var c = CheckBuilder("optimization-pool-requests")
        let keys = [ExpertKey(0, 0), ExpertKey(0, 1), ExpertKey(1, 2), ExpertKey(1, 3), ExpertKey(2, 4)]
        for dense in [false, true] {
            for sparse in [false, true] {
                let label = "dense=\(dense), sparse=\(sparse)"
                let pool = SlotPool(slots: 4, store: store)
                pool.contiguousSlotWrites = slotSlices
                pool.wordSlotWrites = wordWrites
                pool.cpuSlotWrites = cpuWrites
                pool.denseLookup = dense; pool.sparsePinClearing = sparse
                c.equal("\(label): empty request", try pool.ensureChecked([]), [])
                let repeated = [keys[0], keys[1], keys[0], keys[1], keys[0]]
                let locations = try pool.ensureChecked(repeated)
                c.equal("\(label): every duplicate maps to the same slot", locations,
                    [locations[0], locations[1], locations[0], locations[1], locations[0]])
                c.expect("\(label): distinct keys have distinct slots", locations[0] != locations[1])
                c.equal("\(label): repeated keys use two pins", pool.pinnedSlotCount, 2)
                c.equal("\(label): repeated keys read two records", pool.recordsFetched, 2)
                c.equal("\(label): logical miss count includes all requested keys", pool.misses, repeated.count)
                let source = store.readBatch(Array(keys.prefix(2)))
                let got = pool.gatherResident(Array(keys.prefix(2)))
                for piece in source.indices {
                    c.expect("\(label): exact source bytes for piece \(piece)",
                        (source[piece] .== got[piece]).all().item(Bool.self))
                }
                _ = try pool.ensureChecked(Array(keys[2 ... 3]))
                c.equal("\(label): pool can pin its exact capacity", pool.pinnedSlotCount, 4)
                let reads = pool.recordsFetched, hits = pool.hits, misses = pool.misses
                do {
                    _ = try pool.ensureChecked([keys[0], keys[4]])
                    c.expect("\(label): exhausted request rejected", false)
                } catch SlotPoolError.exhausted(let needed, let available) {
                    c.equal("\(label): exact extra capacity request", needed, 1)
                    c.equal("\(label): no free pin capacity", available, 0)
                }
                c.equal("\(label): exhaustion performs no reads", pool.recordsFetched, reads)
                c.equal("\(label): exhaustion leaves hit statistics unchanged", pool.hits, hits)
                c.equal("\(label): exhaustion leaves miss statistics unchanged", pool.misses, misses)
                c.equal("\(label): exhaustion leaves pins unchanged", pool.pinnedSlotCount, 4)
                c.expect("\(label): exhaustion retains every valid mapping", keys.prefix(4).allSatisfy { pool.isResident($0) })
                c.expect("\(label): rejected key has no published mapping", !pool.isResident(keys[4]))
                for key in [ExpertKey(-1, 0), ExpertKey(0, -1), ExpertKey(48, 0), ExpertKey(0, 512), ExpertKey(Int.max, Int.max)] {
                    do {
                        _ = try pool.ensureChecked([keys[0], key])
                        c.expect("\(label): malformed key rejected \(key)", false)
                    } catch SlotPoolError.invalidKey(let rejected) {
                        c.equal("\(label): malformed key identified", rejected, key)
                    }
                }
                c.equal("\(label): invalid keys perform no reads", pool.recordsFetched, reads)
                c.equal("\(label): invalid keys leave hit statistics unchanged", pool.hits, hits)
                c.equal("\(label): duplicate hits work with a fully pinned pool",
                    try pool.ensureChecked(Array(repeating: keys[0], count: 65)), Array(repeating: locations[0], count: 65))
                pool.unpinAll()
                c.equal("\(label): all pins release", pool.pinnedSlotCount, 0)
                _ = try pool.ensureChecked([keys[4], keys[4]])
                c.equal("\(label): retry after release reads one new record", pool.recordsFetched, reads + 1)
                c.expect("\(label): retry publishes requested key", pool.isResident(keys[4]))
                pool.unpinAll()
                pool.resize(to: 6)
                c.expect("\(label): growth preserves live mappings", pool.isResident(keys[4]))
                let grown = try pool.ensureChecked([keys[4], keys[4]])
                c.equal("\(label): growth preserves duplicate aliases", grown[0], grown[1])
                pool.resize(to: 1)
                c.equal("\(label): shrink drops stale pins", pool.pinnedSlotCount, 0)
                let small = try pool.ensureChecked(Array(repeating: keys[0], count: 65))
                c.equal("\(label): one slot serves repeated requests", small, Array(repeating: 0, count: 65))
                c.equal("\(label): one slot has one pin", pool.pinnedSlotCount, 1)
                if slotSlices { c.expect("\(label): slice copies executed", pool.slotSliceBatches > 0) }
                if cpuWrites { c.expect("\(label): CPU copies executed", pool.slotCPUBatches > 0) }
                if wordWrites { c.expect("\(label): word copies executed", pool.slotWordBatches > 0) }
            }
        }
        return c.report()
    }
}
