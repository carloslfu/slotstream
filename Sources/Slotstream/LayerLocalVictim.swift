import Foundation

/// At the minimum cache size, current-layer records excluded by the complete
/// pinned request are known not to be needed until a later model pass. Prefer
/// those to records in layers about to execute. Larger arenas retain CLOCK's
/// ability to lend capacity across layers; trace replay rejected this policy
/// there. Admission from staged sweep groups also retains ordinary CLOCK.
package enum LayerLocalVictim {
    @inline(__always)
    package static func choose(
        count: Int, hand: Int, layer: Int,
        keyAt: (Int) -> ExpertKey?, isPinned: (Int) -> Bool
    ) -> Int? {
        guard count > 0, hand >= 0, hand < count, layer >= 0 else { return nil }
        var local: Int?
        var slot = hand
        for _ in 0 ..< count {
            if !isPinned(slot) {
                guard let key = keyAt(slot) else { return slot }
                if local == nil, key.layer == layer { local = slot }
            }
            slot = slot + 1 == count ? 0 : slot + 1
        }
        return local
    }
}
