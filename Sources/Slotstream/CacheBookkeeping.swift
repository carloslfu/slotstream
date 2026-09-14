// CPU-only bookkeeping with the same eviction/pinning policy as the original
// containers. These change how keys are stored, never what model work runs.
import Foundation

package struct FIFOKeys {
    private var storage: [Int64] = []
    private var head = 0
    package private(set) var count = 0
    package let capacity: Int
    package init(capacity: Int) {
        precondition(capacity > 0)
        self.capacity = capacity
    }
    package mutating func append(_ key: Int64) {
        precondition(count < capacity)
        let slot = (head + count) % capacity
        if slot == storage.count { storage.append(key) }
        else { storage[slot] = key }
        count += 1
    }
    package mutating func popFirst() -> Int64? {
        guard count > 0 else { return nil }
        let key = storage[head]
        head = (head + 1) % capacity
        count -= 1
        return key
    }
    package mutating func removeAll() {
        storage.removeAll(); head = 0; count = 0
    }
}

/// Direct indexing of the finite model expert domain. The small dictionary
/// fallback makes the container total for diagnostic/non-model keys too.
package struct ExpertSlotIndex {
    private let layers: Int
    private let experts: Int
    private var dictionary: [ExpertKey: Int] = [:]
    private var dense: [Int32] = []
    package var isDense: Bool { !dense.isEmpty }
    package init(layers: Int, experts: Int) {
        precondition(layers > 0 && experts > 0)
        self.layers = layers; self.experts = experts
    }
    private func offset(_ key: ExpertKey) -> Int? {
        guard key.layer >= 0, key.layer < layers, key.expert >= 0, key.expert < experts else { return nil }
        return key.layer * experts + key.expert
    }
    package mutating func configure(dense enabled: Bool) {
        guard enabled != isDense else { return }
        if enabled {
            dense = Array(repeating: -1, count: layers * experts)
            for (key, value) in dictionary {
                if let i = offset(key) { dense[i] = Int32(value) }
            }
            dictionary = dictionary.filter { offset($0.key) == nil }
        } else {
            for i in dense.indices where dense[i] >= 0 {
                dictionary[ExpertKey(i / experts, i % experts)] = Int(dense[i])
            }
            dense.removeAll()
        }
    }
    package subscript(_ key: ExpertKey) -> Int? {
        get {
            if isDense, let i = offset(key) { return dense[i] < 0 ? nil : Int(dense[i]) }
            return dictionary[key]
        }
        set {
            if isDense, let i = offset(key) { dense[i] = newValue.map(Int32.init) ?? -1 }
            else { dictionary[key] = newValue }
        }
    }
    package mutating func removeValue(forKey key: ExpertKey) { self[key] = nil }
    package mutating func removeAll(keepingCapacity: Bool) {
        dictionary.removeAll(keepingCapacity: keepingCapacity)
        for i in dense.indices { dense[i] = -1 }
    }
    package var denseBytes: Int { dense.count * MemoryLayout<Int32>.stride }
}

package struct SlotPins {
    private var flags: [Bool]
    private var touched: [Int] = []
    private var sparse = false
    package private(set) var count = 0

    /// Pins normally live exactly one layer: the MoE retires the previous
    /// layer's pins just before choosing its own victims, which is why the
    /// engine must drain the GPU at every layer boundary before the next
    /// layer's ensure() can scatter. Holding pins for several generations
    /// instead removes that requirement, because a slot an unevaluated gather
    /// still reads cannot be chosen as a victim while it stays pinned.
    /// `depth == 1` is the original behaviour, bit for bit: `retireGeneration`
    /// then does exactly what `unpinAll` did.
    private var ring: [[Int]] = []
    private var pinnedIn: [Int] = []
    private var head = 0
    private var absolute = 0
    package private(set) var depth = 1

    package init(count: Int, sparse: Bool = false) {
        flags = Array(repeating: false, count: count)
        self.sparse = sparse
    }
    package mutating func configure(sparse enabled: Bool) {
        guard sparse != enabled else { return }
        touched = enabled ? flags.indices.filter { flags[$0] } : []
        sparse = enabled
    }
    /// Number of generations a pin survives. Raising it costs pinned capacity
    /// (about one layer's routed experts per extra generation) and buys the
    /// right to defer the layer barrier.
    package mutating func configure(depth d: Int) {
        let wanted = max(1, d)
        guard wanted != depth else { return }
        // Collapse whatever is pinned now into a single live generation, so a
        // change of depth never strands a pin in a retired ring slot.
        depth = wanted
        absolute = 0
        head = 0
        if wanted == 1 {
            ring = []; pinnedIn = []
        } else {
            ring = Array(repeating: [], count: wanted)
            pinnedIn = Array(repeating: -1, count: flags.count)
            for slot in flags.indices where flags[slot] {
                pinnedIn[slot] = 0
                ring[0].append(slot)
            }
        }
    }
    package subscript(_ slot: Int) -> Bool { flags[slot] }
    package mutating func pin(_ slot: Int) {
        if depth > 1 {
            if !flags[slot] { flags[slot] = true; count += 1 }
            // Re-pinning in a newer generation moves ownership forward, so the
            // older generation's retirement leaves the slot pinned.
            if pinnedIn[slot] != absolute { pinnedIn[slot] = absolute; ring[head].append(slot) }
            return
        }
        guard !flags[slot] else { return }
        flags[slot] = true
        count += 1
        if sparse { touched.append(slot) }
    }
    /// Retire the oldest live generation and open a new one. At depth 1 this is
    /// the original unpin-all.
    package mutating func retireGeneration() {
        guard depth > 1 else { unpinAll(); return }
        absolute += 1
        head = (head + 1) % depth
        let retiring = absolute - depth
        for slot in ring[head] where flags[slot] && pinnedIn[slot] == retiring {
            flags[slot] = false; count -= 1; pinnedIn[slot] = -1
        }
        ring[head].removeAll(keepingCapacity: true)
    }
    package mutating func unpinAll() {
        if depth > 1 {
            for generation in ring.indices {
                for slot in ring[generation] where flags[slot] { flags[slot] = false; pinnedIn[slot] = -1 }
                ring[generation].removeAll(keepingCapacity: true)
            }
            head = 0; absolute = 0; count = 0
            return
        }
        if sparse {
            for slot in touched { flags[slot] = false }
            touched.removeAll(keepingCapacity: true)
        } else {
            for slot in flags.indices where flags[slot] { flags[slot] = false }
        }
        count = 0
    }
    /// Failure cleanup only; the ordinary unpin-all path stays unchanged.
    package mutating func unpin(_ slot: Int) {
        guard flags[slot] else { return }
        flags[slot] = false; count -= 1
        if depth > 1 { pinnedIn[slot] = -1; return }
        if sparse { touched.removeAll { $0 == slot } }
    }
}
