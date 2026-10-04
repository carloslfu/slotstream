import MLX
import MLXNN

/// Unqualified, explicit research operator. It preserves the full reference
/// dispatch family while bounding each expert group independently of cache
/// residency. Model selection is explicit and binds the matching grouped
/// workspace contract, including complete destination-piece replacement.
package enum AffineGroupedExperts {
    package struct Observation {
        package var groups = 0
        package var tiles = 0
        package var residentGroups = 0
        package var maximumRows = 0
        package var maximumWeightBytes = 0
        package var groupedKernel = false
        package var admissionRecords = 0
    }

    private static func validate(_ x: MLXArray, ids: [Int32], layer: Int, pool: SlotPool,
                                 allowAdmissions: Bool) throws {
        let cfg = pool.expertStore.index.config
        guard pool.expertStore.index.hasAuthenticatedFiles,
              pool.expertStore.quantization.bits == 3, pool.expertStore.quantization.groupSize == 64,
              pool.recordBytes == 2_150_400, cfg.numExperts == 512, cfg.topK == 10,
              cfg.hiddenSize == 2560, cfg.moeIntermediate == 640,
              x.ndim == 3, x.dim(0) == 1, (1...512).contains(x.dim(1)),
              x.dim(2) == cfg.hiddenSize, x.dtype == .bfloat16,
              ids.count == x.dim(1) * cfg.topK,
              ids.allSatisfy({ (0..<512).contains(Int($0)) }),
              (0..<cfg.numLayers).contains(layer),
              (!pool.admitOnSweep || allowAdmissions),
              (!allowAdmissions || pool.admissionPiecewiseWrites) else {
            throw ModelError("grouped affine probe requires bounded authenticated geometry and no admission")
        }
    }

    /// The existing full-domain reference operator, retained separately as
    /// this component probe's oracle. Full native reference gates still have
    /// to pass before a grouped implementation can be selected by a model.
    package static func fullDomain(_ x: MLXArray, ids: [Int32], layer: Int, pool: SlotPool,
                                   allowAdmissions: Bool = false) throws -> MLXArray {
        try validate(x, ids: ids, layer: layer, pool: pool, allowAdmissions: allowAdmissions)
        let order = argSort(MLXArray(ids)), inverse = argSort(order)
        let sorted = MLXArray(ids)[order]
        let input = x.reshaped([x.dim(1), 1, 2560])[floorDivide(order, Int32(10))]
        let w = try pool.layerWorkspaceChecked(layer: layer, experts: Array(Set(ids.map(Int.init))).sorted())
        let up = gatherQuantizedMM(input, w[3], scales: w[4], biases: w[5], rhsIndices: sorted,
            transpose: true, groupSize: 64, bits: 3, sortedIndices: true)
        let gate = gatherQuantizedMM(input, w[0], scales: w[1], biases: w[2], rhsIndices: sorted,
            transpose: true, groupSize: 64, bits: 3, sortedIndices: true)
        let down = gatherQuantizedMM(MLXNN.silu(gate) * up, w[6], scales: w[7], biases: w[8], rhsIndices: sorted,
            transpose: true, groupSize: 64, bits: 3, sortedIndices: true)
        let result = down[inverse].reshaped([1, x.dim(1), 10, 2560])
        eval(result)
        if pool.admitOnSweep, SlotPool.sweepAdmitEnabled {
            var counts = [Int](repeating: 0, count: 512)
            for id in ids { counts[Int(id)] += 1 }
            let hot = (0..<512).filter { counts[$0] > 0 }.sorted {
                counts[$0] != counts[$1] ? counts[$0] > counts[$1] : $0 < $1
            }
            let selected = Array(hot.prefix(max(1, pool.slots / 48)))
            pool.admit(layer: layer, experts: selected, rows: selected, from: w)
            pool.commitAdmissions()
        }
        return result
    }

    package static func apply(_ x: MLXArray, ids: [Int32], layer: Int, pool: SlotPool,
                              allowAdmissions: Bool = false) throws -> (MLXArray, Observation) {
        try validate(x, ids: ids, layer: layer, pool: pool, allowAdmissions: allowAdmissions)
        // MLX's reference dispatch selects grouped RHS only at four routed
        // rows per original expert. A smaller weight bank must not cause a
        // short pass to cross that threshold and change its dot product.
        let grouped = ids.count >= 4 * 512
        var observation = Observation(); observation.groupedKernel = grouped
        let order = argSort(MLXArray(ids)).asArray(Int32.self)
        var byExpert = [[Int32]](repeating: [], count: 512)
        for row in order { byExpert[Int(ids[Int(row)])].append(row) }
        let active = (0..<512).filter { !byExpert[$0].isEmpty }
        let resident = Set(active.filter { pool.isResident(ExpertKey(layer, $0)) })
        let hot = pool.admitOnSweep && SlotPool.sweepAdmitEnabled ? Array(active.sorted {
            byExpert[$0].count != byExpert[$1].count ? byExpert[$0].count > byExpert[$1].count : $0 < $1
        }.prefix(max(1, pool.slots / 48))) : []
        let hotSet = Set(hot)
        var hotOrder: [Int] = [], hotParts: [[MLXArray]] = []
        let flat = x.reshaped([x.dim(1), 2560])
        var outputs: [MLXArray] = [], outputOrder: [Int32] = []
        for cached in [true, false] {
            let experts = active.filter { resident.contains($0) == cached }
            for begin in stride(from: 0, to: experts.count, by: 32) {
                let group = Array(experts[begin..<min(begin + 32, experts.count)])
                let raw = try cached ? pool.gatherResident(group.map { ExpertKey(layer, $0) })
                    : pool.readStagedChecked(layer: layer, experts: group)
                // A fixed 32-expert RHS keeps M5's NAX BM=32 even when a
                // highly skewed group contains just one real expert. Padded
                // weights are never addressed by a real or repeated row.
                let w = raw.map { value -> MLXArray in
                    guard group.count < 32 else { return value }
                    return concatenated([value, MLXArray.zeros([32 - group.count] + Array(value.shape.dropFirst()), dtype: value.dtype)], axis: 0)
                }
                eval(w)
                observation.groups += 1
                if cached { observation.residentGroups += 1 }
                observation.maximumWeightBytes = max(observation.maximumWeightBytes, w.reduce(0) { $0 + $1.nbytes })
                var local = [Int32](repeating: -1, count: 512)
                for (number, expert) in group.enumerated() { local[expert] = Int32(number) }
                let rows = group.flatMap { byExpert[$0] }
                for start in stride(from: 0, to: rows.count, by: 256) {
                    let chosen = Array(rows[start..<min(start + 256, rows.count)])
                    var rowIDs = chosen, rhs = chosen.map { local[Int(ids[Int($0)])] }
                    if grouped {
                        let minimum = max(128, chosen.count), remainder = ids.count % 32
                        let padded = ((minimum - remainder + 31) / 32) * 32 + remainder
                        rowIDs.append(contentsOf: repeatElement(chosen.last!, count: padded - chosen.count))
                        rhs.append(contentsOf: repeatElement(rhs.last!, count: padded - chosen.count))
                    }
                    let input = flat[MLXArray(rowIDs.map { $0 / 10 })].expandedDimensions(axis: 1)
                    let indices = MLXArray(rhs)
                    let up = gatherQuantizedMM(input, w[3], scales: w[4], biases: w[5], rhsIndices: indices,
                        transpose: true, groupSize: 64, bits: 3, sortedIndices: grouped)
                    let gate = gatherQuantizedMM(input, w[0], scales: w[1], biases: w[2], rhsIndices: indices,
                        transpose: true, groupSize: 64, bits: 3, sortedIndices: grouped)
                    let down = gatherQuantizedMM(MLXNN.silu(gate) * up, w[6], scales: w[7], biases: w[8], rhsIndices: indices,
                        transpose: true, groupSize: 64, bits: 3, sortedIndices: grouped)
                    let complete = down[0..<chosen.count]
                    // This explicit first probe holds no unevaluated group
                    // reader when the next group is loaded or released.
                    eval(complete)
                    outputs.append(complete); outputOrder.append(contentsOf: chosen)
                    observation.tiles += 1
                    observation.maximumRows = max(observation.maximumRows, rowIDs.count)
                }
                let picks = group.enumerated().filter { hotSet.contains($0.element) }
                if !picks.isEmpty {
                    // Advanced-index Gather owns a new allocation in the
                    // pinned MLX backend. It cannot retain a view of this
                    // complete group. Finish the copies before releasing it.
                    let indices = MLXArray(picks.map { Int32($0.offset) })
                    let copied = w.map { $0[indices] }
                    eval(copied)
                    hotParts.append(copied); hotOrder.append(contentsOf: picks.map(\.element))
                }
            }
        }
        guard outputOrder.count == ids.count, Set(outputOrder).count == ids.count else {
            throw ModelError("grouped affine routes did not cover the complete original order")
        }
        var inverse = [Int32](repeating: 0, count: ids.count)
        for (position, row) in outputOrder.enumerated() { inverse[Int(row)] = Int32(position) }
        let result = concatenated(outputs, axis: 0)[MLXArray(inverse)].reshaped([1, x.dim(1), 10, 2560])
        eval(result)
        if !hot.isEmpty {
            // Retain only selected records and finish every group reader
            // before touching CLOCK. Preserve the original global hot order,
            // independent of resident-first execution and physical grouping.
            let staged = (0..<9).map { piece in concatenated(hotParts.map { $0[piece] }, axis: 0) }
            eval(staged); hotParts.removeAll()
            let locations = Dictionary(uniqueKeysWithValues: hotOrder.enumerated().map { ($0.element, $0.offset) })
            guard locations.count == hot.count, hot.allSatisfy({ locations[$0] != nil }) else {
                throw ModelError("grouped affine admission did not retain every selected record")
            }
            pool.admit(layer: layer, experts: hot, rows: hot.map { locations[$0]! }, from: staged)
            pool.commitAdmissions()
            observation.admissionRecords = hot.count
        }
        return (result, observation)
    }
}
