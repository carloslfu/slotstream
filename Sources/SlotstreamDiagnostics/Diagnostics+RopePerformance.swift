import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// A bounded QSA rotation/angle-table component, not trained-model latency.
    /// Actual production Rope/PartialRotation dispatch, fixed materialized BF16
    /// query/key inputs and twelve QSA layers per pass. No projection or attention.
    public static func optimizationRopePerformance() -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        var c = CheckBuilder("optimization-rope-performance")
        c.expect("exact fused kernel initialized", PartialRotation.prepare())
        guard PartialRotation.prepare() else { return c.report() }
        let arms = ["reference", "tables", "fused", "combined"]
        let passes = 32, layers = 12
        c.measure("passes_per_cell", Double(passes)); c.measure("layers_per_pass", Double(layers))
        for rows in [1, 256, 1024] {
            let q = sin(MLXArray(0..<rows * 24 * 256).asType(.float32) * Float(0.0137))
                .reshaped([1, rows, 24, 256]).asType(.bfloat16).transposed(0, 2, 1, 3)
            let k = cos(MLXArray(0..<rows * 2 * 256).asType(.float32) * Float(0.0091))
                .reshaped([1, rows, 2, 256]).asType(.bfloat16).transposed(0, 2, 1, 3)
            eval(q, k)
            let oracle = Rope(dim: 64, base: 10_000_000)
            let (ec, es) = oracle.table(start: 8192 + (passes - 1) * rows, count: rows)
            let eq = oracle.rotate(q, ec.expandedDimensions(axis: 1), es.expandedDimensions(axis: 1))
            let ek = oracle.rotate(k, ec.expandedDimensions(axis: 1), es.expandedDimensions(axis: 1))
            eval(eq, ek)
            for round in 1...5 {
                for arm in round.isMultiple(of: 2) ? Array(arms.reversed()) : arms {
                    let rope = Rope(dim: 64, base: 10_000_000)
                    rope.sharedTables = arm == "tables" || arm == "combined"
                    rope.fusedRotation = arm == "fused" || arm == "combined"
                    func apply(_ position: Int) -> (MLXArray, MLXArray) {
                        let (co, si) = rope.table(start: position, count: rows)
                        let anglesC = co.expandedDimensions(axis: 1), anglesS = si.expandedDimensions(axis: 1)
                        let oq = rope.rotate(q, anglesC, anglesS), ok = rope.rotate(k, anglesC, anglesS)
                        eval(oq, ok)
                        return (oq, ok)
                    }
                    for _ in 0..<3 { _ = apply(4096) }
                    let before = ProcessMemory.vmActivity(), powerBefore = ProcessMemory.operatingConditions()
                    let samples = FootprintSampler(intervalMilliseconds: 2)
                    let hitStart = rope.tableHits, buildStart = rope.tableBuilds
                    let rotationStart = rope.fusedRotationsScheduled
                    var output: (MLXArray, MLXArray)?
                    let start = RuntimeClock.now()
                    for pass in 0..<passes {
                        for _ in 0..<layers { output = apply(8192 + pass * rows) }
                    }
                    let elapsed = RuntimeClock.seconds(since: start)
                    let footprint = samples.finish(), after = ProcessMemory.vmActivity()
                    let powerAfter = ProcessMemory.operatingConditions()
                    let key = "rows_\(rows).round_\(round).\(arm)"
                    c.measure("\(key).seconds", elapsed)
                    c.measure("\(key).sampled_peak_bytes", Double(footprint.peakBytes))
                    c.measure("\(key).samples", Double(footprint.samples))
                    let same = output.map {
                        $0.0.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self) == eq.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
                        && $0.1.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self) == ek.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self)
                    } ?? false
                    c.expect("\(key): exact query and key bytes", same)
                    c.equal("\(key): actual table builds", rope.tableBuilds - buildStart, passes * (rope.sharedTables ? 1 : layers))
                    c.equal("\(key): actual table hits", rope.tableHits - hitStart, rope.sharedTables ? passes * (layers - 1) : 0)
                    c.equal("\(key): actual rotation scheduling", rope.fusedRotationsScheduled - rotationStart,
                        rope.fusedRotation ? passes * layers * 2 : 0)
                    let clean = before != nil && after != nil && before!.swapins == after!.swapins && before!.swapouts == after!.swapouts
                    let nominal = powerBefore.thermalState == "nominal" && powerAfter.thermalState == "nominal"
                        && !powerBefore.lowPowerModeEnabled && !powerAfter.lowPowerModeEnabled
                    let fits = footprint.samples > 1 && footprint.peakBytes > 0 && footprint.peakBytes <= 2_000_000_000
                    c.expect("\(key): zero interval swap", clean)
                    c.expect("\(key): nominal operating state", nominal)
                    c.expect("\(key): sampled footprint below two GB", fits)
                    if !same || !clean || !nominal || !fits { return c.report() }
                }
            }
        }
        return c.report()
    }
}
