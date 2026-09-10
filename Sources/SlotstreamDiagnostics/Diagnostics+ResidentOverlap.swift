import CryptoKit
import Foundation
import MLX
import Slotstream

extension Diagnostics {
    public static func optimizationResidentOverlap(modelDir: URL) throws -> CheckReport {
        MLX.Memory.cacheLimit = 64 << 20
        let model = try Qwen4ExpModel(index: CheckpointIndex(dir: modelDir), poolSlots: 640, runLayers: 4)
        var c = CheckBuilder("optimization-resident-overlap")
        func hash(_ a: MLXArray) -> String {
            "\(a.dtype):\(a.shape):\(SHA256.hash(data: Data(a.reshaped([-1]).view(dtype: .uint8).asArray(UInt8.self))))"
        }
        var routed: [Int32] = []
        model.routerObserver = { _, ids in routed = ids }
        for rows in [1, 2, 8] {
            for seed in [7, 31] {
                let values = (0..<(rows * model.cfg.hiddenSize)).map {
                    Float(($0 * 131 + seed * 17) % 1024 - 512) / 512
                }
                let input = MLXArray(values, [1, rows, model.cfg.hiddenSize]).asType(.bfloat16)
                eval(input)
                let reference = try model.diagnosticResidentExpertOutput(input, layer: 0, overlapping: false)
                eval(reference)
                let expected = hash(reference), route = routed
                let unique = Array(Set(route.map(Int.init))).sorted()
                let absent = (0..<model.cfg.numExperts).first { !unique.contains($0) }!
                func prepare(_ warm: [Int]) throws {
                    model.pool.unpinAll(); model.pool.resize(to: 1)
                    _ = try model.pool.ensureChecked([ExpertKey(0, absent)])
                    model.pool.unpinAll(); model.pool.resize(to: 640)
                    if !warm.isEmpty { _ = try model.pool.ensureChecked(warm.map { ExpertKey(0, $0) }) }
                    model.pool.unpinAll()
                    for id in unique { c.equal("explicit resident set rows=\(rows) seed=\(seed) expert=\(id)",
                        model.pool.isResident(ExpertKey(0, id)), warm.contains(id)) }
                }
                let counts = rows == 1 ? Array(0...unique.count) : [0, unique.count / 2, unique.count]
                for count in counts {
                    let warm = Array(unique.prefix(count))
                    try prepare(warm)
                    let before = model.residentExpertPrelaunches
                    let result = try model.diagnosticResidentExpertOutput(input, layer: 0, overlapping: true)
                    eval(result)
                    let name = "rows=\(rows) seed=\(seed) resident=\(count)/\(unique.count)"
                    c.equal(name + ": exact complete MoE output", hash(result), expected)
                    c.equal(name + ": ordered router IDs", routed, route)
                    c.equal(name + ": actual prelaunch", model.residentExpertPrelaunches - before,
                        rows == 1 && count > 0 && count < unique.count ? 1 : 0)
                    c.expect(name + ": finite output", isFinite(result).all().item(Bool.self))
                }
                if rows == 1 {
                    try prepare(Array(unique.prefix(5)))
                    let launches = model.residentExpertPrelaunches, joins = model.residentExpertJoins
                    let fault = ReadFault(afterJobs: 0)
                    model.pool.readFault = fault
                    do {
                        _ = try model.diagnosticResidentExpertOutput(input, layer: 0, overlapping: true)
                        c.expect("seed=\(seed): actual mixed read failure", false)
                    } catch { c.expect("seed=\(seed): actual mixed read failure", fault.hasFired) }
                    model.pool.readFault = nil
                    c.equal("seed=\(seed): failed read submitted resident GPU work", model.residentExpertPrelaunches - launches, 1)
                    c.equal("seed=\(seed): failed read joined resident GPU work", model.residentExpertJoins - joins, 1)
                    c.equal("seed=\(seed): failed read releases all temporary pins", model.pool.pinnedSlotCount, 0)
                    let retry = try model.diagnosticResidentExpertOutput(input, layer: 0, overlapping: true)
                    eval(retry)
                    c.equal("seed=\(seed): exact retry after joined failure", hash(retry), expected)
                }
            }
        }
        model.pool.unpinAll()
        c.expect("bounded physical footprint", ProcessMemory.residentBytes() < 8_100_000_000)
        c.measure("resident_expert_prelaunches", Double(model.residentExpertPrelaunches))
        c.measure("host_join_seconds_not_gpu_duration", model.residentExpertJoinSeconds)
        return c.report()
    }
}
