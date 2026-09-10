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
    package init(count: Int, sparse: Bool = false) {
        flags = Array(repeating: false, count: count)
        self.sparse = sparse
    }
    package mutating func configure(sparse enabled: Bool) {
        guard sparse != enabled else { return }
        touched = enabled ? flags.indices.filter { flags[$0] } : []
        sparse = enabled
    }
    package subscript(_ slot: Int) -> Bool { flags[slot] }
    package mutating func pin(_ slot: Int) {
        guard !flags[slot] else { return }
        flags[slot] = true
        count += 1
        if sparse { touched.append(slot) }
    }
    package mutating func unpinAll() {
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
        if sparse { touched.removeAll { $0 == slot } }
    }
}
