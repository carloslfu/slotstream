import Foundation
import Slotstream

extension Diagnostics {
    public static func optimizationCacheBookkeeping() -> CheckReport {
        var c = CheckBuilder("optimization-cache-bookkeeping")
        for capacity in [1, 7, 31, 640] {
            var ring = FIFOKeys(capacity: capacity), oracle: [Int64] = []
            for step in 0..<(capacity * 5 + 20) {
                if oracle.count == capacity {
                    for _ in 0..<max(1, capacity / 10) {
                        c.equal("FIFO \(capacity), pop \(step)", ring.popFirst(), oracle.removeFirst())
                    }
                }
                let key = Int64(step % (capacity + 3))
                ring.append(key); oracle.append(key)
                c.equal("FIFO \(capacity), count \(step)", ring.count, oracle.count)
            }
            while !oracle.isEmpty { c.equal("FIFO \(capacity), drain", ring.popFirst(), oracle.removeFirst()) }
            c.equal("FIFO \(capacity), empty", ring.popFirst(), nil)
            ring.removeAll(); ring.append(-1)
            c.equal("FIFO \(capacity), clear/reuse", ring.popFirst(), -1)
        }
        var table = ExpertSlotIndex(layers: 3, experts: 7)
        var reference: [ExpertKey: Int] = [:]
        // Boundaries plus malformed/non-model keys must not alias real rows.
        let keys = (0..<21).map { ExpertKey($0 / 7, $0 % 7) }
            + [ExpertKey(-1, 0), ExpertKey(0, -1), ExpertKey(3, 0), ExpertKey(0, 7)]
        for step in 0..<400 {
            if step % 17 == 0 { table.configure(dense: (step / 17).isMultiple(of: 2)) }
            let key = keys[(step * 13) % keys.count]
            if step % 3 == 0 { table.removeValue(forKey: key); reference[key] = nil }
            else { table[key] = step; reference[key] = step }
            if step % 71 == 0 { table.removeAll(keepingCapacity: true); reference.removeAll() }
            for key in keys { c.equal("slot index \(step), \(key.layer)/\(key.expert)", table[key], reference[key]) }
        }
        table.configure(dense: true)
        c.equal("dense map payload", table.denseBytes, 3 * 7 * 4)
        table.configure(dense: false)
        c.equal("dense map release", table.denseBytes, 0)
        for count in [1, 7, 640] {
            var pins = SlotPins(count: count), reference = Set<Int>()
            for step in 0..<200 {
                if step % 11 == 0 { pins.configure(sparse: (step / 11).isMultiple(of: 2)) }
                let slot = (step * 13) % count
                pins.pin(slot); pins.pin(slot); reference.insert(slot)
                if step % 17 == 0 { pins.unpinAll(); reference.removeAll() }
                c.equal("pin count \(count), step \(step)", pins.count, reference.count)
                c.expect("pin set \(count), step \(step)", (0..<count).allSatisfy { pins[$0] == reference.contains($0) })
            }
            pins.unpinAll(); pins.unpinAll()
            c.expect("pin clear is idempotent \(count)", (0..<count).allSatisfy { !pins[$0] })
        }
        // Pin generations. A slot stays pinned while it was pinned in one of the
        // last `depth` generations, and re-pinning moves ownership forward so an
        // older generation's retirement leaves it pinned. This is what lets the
        // layer barrier be deferred: a slot an unevaluated gather still reads
        // cannot be chosen as a victim while it stays pinned.
        for depth in [1, 2, 3, 5] {
            let count = 64
            var pins = SlotPins(count: count)
            pins.configure(depth: depth)
            var owner: [Int: Int] = [:]
            var absolute = 0
            for step in 0..<300 {
                let slot = (step * 7) % count
                pins.pin(slot); pins.pin(slot)
                owner[slot] = absolute
                if step % 3 == 0 {
                    pins.retireGeneration()
                    absolute += 1
                    for (s, g) in owner where g <= absolute - depth { owner.removeValue(forKey: s) }
                }
                let expected = Set(owner.keys)
                c.equal("pin depth \(depth) count, step \(step)", pins.count, expected.count)
                c.expect("pin depth \(depth) set, step \(step)",
                         (0..<count).allSatisfy { pins[$0] == expected.contains($0) })
            }
            pins.unpinAll()
            c.expect("pin depth \(depth) unpin-all clears",
                     (0..<count).allSatisfy { !pins[$0] } && pins.count == 0)
        }
        // Depth one must remain the shipped path exactly: one retirement is an
        // unpin-all, so the deferred barrier cannot change default behaviour.
        var legacy = SlotPins(count: 16)
        legacy.configure(depth: 1)
        legacy.pin(3); legacy.pin(9)
        legacy.retireGeneration()
        c.expect("depth one retire is unpin-all", !legacy[3] && !legacy[9] && legacy.count == 0)
        // Raising depth after slots are already pinned keeps them pinned.
        var grown = SlotPins(count: 16)
        grown.pin(2); grown.pin(5)
        grown.configure(depth: 3)
        c.expect("depth change keeps live pins", grown[2] && grown[5] && grown.count == 2)
        grown.retireGeneration(); grown.retireGeneration()
        c.expect("depth change pins survive two retirements", grown[2] && grown[5])
        grown.retireGeneration()
        c.expect("depth change pins retire on the third", !grown[2] && !grown[5] && grown.count == 0)
        return c.report()
    }
}
