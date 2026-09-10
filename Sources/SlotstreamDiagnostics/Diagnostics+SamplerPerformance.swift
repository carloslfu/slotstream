import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Fixed real-vocabulary sampler component; excludes model and serving.
    public static func optimizationSamplerPerformance() -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        let logits = MLXArray(Goldens.samplerLogits(vocab: 248320, seed: 99))
        eval(logits)
        var c = CheckBuilder("optimization-sampler-performance")
        let arms = ["reference", "threshold", "device", "combined"]
        c.measure("vocab", 248320); c.measure("draws_per_cell", 64)
        for filtered in [true, false] {
            let family = filtered ? "filtered" : "unfiltered"
            var params = SampleParams()
            if !filtered {
                params.temperature = 1.5; params.topK = 0; params.topP = 1; params.presencePenalty = 0
            }
            var expected: [Int] = []
            var reductions: [String: [Double]] = [:]
            for round in 1 ... 5 {
                var seconds: [String: Double] = [:]
                var valid: [String: Bool] = [:]
                let order = round.isMultiple(of: 2) ? Array(arms.reversed()) : arms
                for arm in order {
                    var sampler = Sampler(seed: 7)
                    sampler.valueOnlyTopK = arm == "threshold" || arm == "combined"
                    sampler.deviceDraw = arm == "device" || arm == "combined"
                    for _ in 0 ..< 2 { _ = sampler.next(logits, params: params, generated: []) }
                    sampler.rngState = 7
                    var generated = Set<Int>(), output: [Int] = []
                    output.reserveCapacity(64)
                    let vmBefore = ProcessMemory.vmActivity()
                    let powerBefore = ProcessMemory.operatingConditions()
                    let memory = FootprintSampler(intervalMilliseconds: 5)
                    let start = RuntimeClock.now()
                    for _ in 0 ..< 64 {
                        let token = sampler.next(logits, params: params, generated: generated)
                        output.append(token); generated.insert(token)
                    }
                    let elapsed = RuntimeClock.seconds(since: start)
                    let footprint = memory.finish()
                    let powerAfter = ProcessMemory.operatingConditions()
                    let vmAfter = ProcessMemory.vmActivity()
                    if expected.isEmpty { expected = output }
                    let exact = expected == output
                    let clean = vmBefore != nil && vmAfter != nil
                        && vmBefore!.swapins == vmAfter!.swapins && vmBefore!.swapouts == vmAfter!.swapouts
                    let nominal = powerBefore.thermalState == "nominal" && powerAfter.thermalState == "nominal"
                        && !powerBefore.lowPowerModeEnabled && !powerAfter.lowPowerModeEnabled
                    let fits = footprint.samples > 1 && footprint.peakBytes > 0 && footprint.peakBytes <= 1_000_000_000
                    let key = "\(family).round_\(round).\(arm)"
                    c.equal("\(key): exact draw sequence", output, expected)
                    c.expect("\(key): no interval swap", clean)
                    c.expect("\(key): nominal operating conditions", nominal)
                    c.expect("\(key): sampled footprint within one GB", fits)
                    c.measure("\(key).seconds", elapsed)
                    c.measure("\(key).sampled_peak_bytes", Double(footprint.peakBytes))
                    c.measure("\(key).samples", Double(footprint.samples))
                    for (i, token) in output.enumerated() { c.measure("\(key).token_\(i)", Double(token)) }
                    if let before = vmBefore, let after = vmAfter {
                        c.measure("\(key).swapins_before", Double(before.swapins))
                        c.measure("\(key).swapins_after", Double(after.swapins))
                        c.measure("\(key).swapouts_before", Double(before.swapouts))
                        c.measure("\(key).swapouts_after", Double(after.swapouts))
                    }
                    seconds[arm] = elapsed; valid[arm] = exact && clean && nominal && fits
                    if !clean || !nominal || !fits { return c.report() }
                }
                for arm in arms.dropFirst() where valid["reference"] == true && valid[arm] == true {
                    reductions[arm, default: []].append(1 - seconds[arm]! / seconds["reference"]!)
                }
            }
            for arm in arms.dropFirst() {
                let values = (reductions[arm] ?? []).sorted()
                c.measure("\(family).\(arm).valid_pairs", Double(values.count))
                c.expect("\(family).\(arm): five valid pairs", values.count == 5)
                if values.count == 5 {
                    let median = values[2], positive = Double(values.filter { $0 > 0 }.count) / 5
                    c.measure("\(family).\(arm).median_reduction_fraction", median)
                    c.measure("\(family).\(arm).positive_fraction", positive)
                    c.measure("\(family).\(arm).performance_gate_passed", median >= 0.05 && positive >= 0.8 ? 1 : 0)
                }
            }
        }
        return c.report()
    }
}
