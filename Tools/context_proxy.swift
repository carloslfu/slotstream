import Foundation

/// Tests execute production policy. Observations are values; no model exists.
@main enum ContextContracts {
    static var counts: [String: Int] = [:]
    static var failures: [String] = []
    static func check(_ gate: String, _ name: String, _ ok: Bool) {
        counts[gate, default: 0] += 1
        if !ok { failures.append("\(gate): \(name)") }
    }
    static func failure(_ code: RequestFailure.Code, _ action: () throws -> Void) -> Bool {
        do { try action(); return false }
        catch let error as RequestFailure { return error.code == code }
        catch { return false }
    }

    static func main() throws {
        do {
            try defaults()
            try planning()
            schedules()
            try requests()
        } catch { failures.append("unexpected error: \(error)") }
        let report: [String: Any] = ["passed": failures.isEmpty, "assertions": counts.values.reduce(0, +),
                                    "gates": counts, "failures": failures,
                                    "hardware_qualified": false, "model_loaded": false]
        print(String(decoding: try JSONSerialization.data(withJSONObject: report, options: [.sortedKeys]), as: UTF8.self))
        if !failures.isEmpty { exit(1) }
    }

    static func defaults() throws {
        let fixture = try JSONSerialization.jsonObject(with: Data(contentsOf: URL(fileURLWithPath: CommandLine.arguments[1]))) as! [String: Any]
        let fields = fixture["projection_fields"] as! [String]
        for tier in fixture["tiers"] as! [[String: Any]] {
            let args = tier["args"] as! [String]
            func value(_ flag: String) -> Double { Double(args[args.firstIndex(of: flag)! + 1])! }
            var previous: NSDictionary?
            for _ in 0..<2 {
                let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
                    ramGB: value("--sim-ram"), workingSetGB: value("--sim-working-set"), availableGB: value("--sim-available"),
                    mtp: .off, vision: .off, simulated: true)
                let projection = p.json().filter { fields.contains($0.key) } as NSDictionary
                check("C01", "frozen default tier \(tier["tier"]!)", projection.isEqual(tier["expected"] as! NSDictionary))
                if let previous { check("C01", "repeated default projection", projection.isEqual(previous)) }
                previous = projection
            }
        }
        check("C09", "legacy default", (try ContextConfiguration()).maxContextTokens == 32768)
        check("C09", "public limit still requires hardware qualification", ContextPolicy.maxTokens == 65536)
        check("C09", "model limit available through explicit qualification", (try ContextConfiguration(maxContextTokens: 262144, qualification: true)).maxContextTokens == 262144)
        for cap in [Int.min, -1, 0, 65537, 262145, Int.max] {
            check("C09", "invalid public configuration \(cap)", failure(.contextLengthExceeded) { _ = try ContextConfiguration(maxContextTokens: cap) })
        }
    }

    static func planning() throws {
        let caps = [1, 1023, 1024, 1025, 4096, 8192, 32767, 32768, 32769, 65535, 65536, 65537,
                    128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
        for cap in caps {
            let rows = ((cap + 1023) / 1024) * 1024
            check("C04", "allocated main rows", ContextGeometry.sequenceBytes(tokens: cap) == rows * 12 * 2304)
            check("C04", "allocated draft rows", ContextGeometry.sequenceBytes(tokens: cap, mtp: true) == rows * 13 * 2304)
            for target in [8.1, 10, 16, 22, 33] {
                for mtp in [Planner.MTPMode.off, .on, .auto] {
                    for vision in [Planner.VisionMode.off, .on, .auto] {
                        for cache in [false, true] {
                            do {
                                let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                                    ramGB: 51.5, workingSetGB: 40.2, availableGB: 44,
                                    mtp: mtp, mtpAvailable: true, vision: vision, visionAvailable: true,
                                    visionResidentReserved: vision != .off, maxContextTokens: cap,
                                    simulated: true, qualification: true,
                                    runtimePolicy: RuntimeAllocationPolicy(prefixCacheEnabled: cache))
                                check("C02", "resolved plan fits target", p.memoryLedger.expectedPeakBytes <= Int(target * 1e9))
                                check("C02", "requested context preserved", p.maxContextTokens == cap)
                                check("C02", "explicit draft preserved", mtp != .on || p.mtpEnabled)
                                check("C04", "disabled retention spends no capacity", cache || p.prefixCacheTokens == 0)
                            } catch {
                                check("C02", "typed plan refusal", error is PlanError && !String(describing: error).isEmpty)
                            }
                        }
                    }
                }
            }
        }
        let machine = Machine.simulated(ramGB: 51.5, workingSetGB: 40.2, availableGB: 44)
        for target in [8.1, 10, 16, 22] {
            let request = PlanRequest(memoryGB: target, mtp: .off, vision: .off, maxContextTokens: 262144)
            let result = Planner.contextFeasibility(request, on: machine, qualification: true)
            check("C03", "solver maximum accepted", result.maximumPlan != nil)
            if result.maximumFeasibleWindow < 262144 {
                let next = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                    ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off,
                    maxContextTokens: result.maximumFeasibleWindow + 1, simulated: true, qualification: true)
                check("C03", "next token refused", next == nil)
            }
        }
        for invalid in [-1, Int.max] {
            check("C04", "invalid capacity refuses", ContextGeometry.sequenceBytes(tokens: invalid) == Int.max)
        }
        check("C04", "growth charges replacement", ContextGeometry.nextBufferAllocationBytes(tokens: 1025, rowBytes: 1024, allocatedBytes: 1024 * 1024) == 2048 * 1024)
        check("C04", "same buffer can reuse capacity", ContextGeometry.nextBufferAllocationBytes(tokens: 1024, rowBytes: 1024, allocatedBytes: 4096 * 1024) == 0)
        check("C04", "Hermes reserve anchor", ContextMemoryLedger.transientReserveBytes(context: 65536) == 905969664)
        for cap in [1024, 32768, 65536, 131072, 262144] {
            for available in [0.0, 4, 16, 32] {
                for owned in [0, ContextGeometry.additionalActiveBytes(tokens: cap)] {
                    let input = GovernorPolicy.Inputs(currentSlots: 4000, availableGB: available, ramGB: 51.5,
                        workingSetGB: 40.2, maxContextTokens: cap, ownedAdditionalBytes: owned, contextQualification: true)
                    if let plan = GovernorPolicy.desiredPlan(input) {
                        check("C05", "governor keeps window", plan.maxContextTokens == cap)
                        let budget = min(40.2, available + Geometry.gb(4000) + Planner.fixedFootprintGB + Double(owned) / 1e9 - Planner.availabilitySlackGB(ramGB: 51.5))
                        check("C05", "owned credit used once", Double(plan.memoryLedger.expectedPeakBytes) <= budget * 1e9)
                    } else { check("C05", "infeasible replan does not grant admission", GovernorPolicy.desiredSlots(input) == nil) }
                }
            }
        }
    }

    static func schedules() {
        var seed: UInt64 = 713
        for index in 0..<400 {
            seed = seed &* 6364136223846793005 &+ 1
            let start = index < 8 ? [0, 1, 65535, 128255, 128256, 131071, 262079, 262143][index] : Int(seed % 262144)
            let count = 262144 - start
            let chunk = [64, 128, 256, 511, 512, 1024, 4095, 4096][index % 8]
            for tail in [false, true] {
                let passes = PrefillSchedule.computePasses(tokens: count, from: start, maxChunk: chunk, tailAware: tail)
                var position = start
                for pass in passes {
                    position += pass.tokens
                    check("C06", "actual padded product bound", pass.tokens > 0 && pass.queryRows >= pass.tokens
                        && pass.keyExtent >= position && pass.queryRows * pass.keyExtent <= 4096 * 8016)
                }
                check("C06", "complete arbitrary-prefix schedule", !passes.isEmpty && position == 262144)
            }
        }
        for pair in [(Int.max, 1), (1, Int.max), (-1, 1), (1, -1), (262144, 1)] {
            check("C08", "overflow/out-of-model diagnostic", PrefillSchedule.computePasses(tokens: pair.0, from: pair.1, maxChunk: 4096).isEmpty)
        }
        check("C06", "unmeasured late cost stays unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
        check("C06", "Hermes measured schedule keeps estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)
        for room in 0...18 {
            check("C10", "draft plus pending token stays in window", ContextPolicy.maximumDraftDepth(requested: 16, at: 65536 - room, limit: 65536) == min(16, max(0, room - 1)))
        }
    }

    static func requests() throws {
        for wait in [Double.nan, .infinity, -.infinity, -1, Double.greatestFiniteMagnitude] {
            check("C13", "invalid wait fails before allocation", failure(.invalidConfiguration) { _ = try ContextConfiguration(maxPrefillWaitMinutes: wait) })
        }
        for phase in ["queue", "tokenization", "image preparation", "prefill", "decode"] {
            var tick: UInt64 = 0
            var available: Double? = 10
            var pressure = false
            let config = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 1)
            let deadline = RequestController(configuration: config, slackBytes: 100, clock: { tick }, availableGB: { available })
            tick = 61_000_000_000
            if phase == "decode" { deadline.sampledFirstToken(); try deadline.check(phase: phase) }
            else { check("C13", "deadline includes \(phase)", failure(.prefillDeadlineExceeded) { try deadline.check(phase: phase) }) }
            tick = 0
            let control = RequestController(configuration: config, slackBytes: 100, clock: { tick }, availableGB: { available }, pressure: { pressure })
            available = nil
            check("C14", "unreadable observation cannot authorize growth", failure(.insufficientMemory) { try control.check(nextAllocationBytes: 1, phase: phase) })
            available = 10
            check("C15", "failed controller stays failed", failure(.insufficientMemory) { try control.check() })
            let fresh = RequestController(configuration: config, slackBytes: 100, availableGB: { available }, pressure: { pressure })
            try fresh.check(nextAllocationBytes: 1, phase: phase)
            check("C15", "fresh request recovers", fresh.failure == nil)
            pressure = true
            check("C14", "injected pressure \(phase)", failure(.insufficientMemory) { try fresh.check(phase: phase) })
            check("C15", "pressure state cannot be retained", !fresh.mayRetainState)
        }
        var tick: UInt64 = 0
        let config = try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 1)
        let estimate = RequestController(configuration: config, slackBytes: 0, clock: { tick }, availableGB: { 10 })
        check("C13", "cold estimate refuses", failure(.prefillWaitExceeded) { try estimate.admit(missingTokens: 32768, from: 0, maxChunk: 256) })
        let reuse = RequestController(configuration: config, slackBytes: 0, clock: { tick }, availableGB: { 10 })
        try reuse.admit(missingTokens: 32, from: 64000, maxChunk: 4096)
        check("C13", "real prefix position prices missing work", reuse.failure == nil)
        tick = 61_000_000_000
        check("C13", "estimate never resets deadline", failure(.prefillDeadlineExceeded) { try reuse.check() })
        let pool = RequestMemoryReservations()
        var controllers: [RequestController] = []
        for _ in 0..<8 {
            let c = RequestController(configuration: config, slackBytes: 1_000_000, availableGB: { 0.010 })
            try c.attachReservations(pool)
            do { try c.reservePreparedImageBytes(4_000_000); controllers.append(c) } catch {}
        }
        check("C14", "queued images cannot spend same headroom", controllers.count == 2 && pool.reservedBytes == 8_000_000)
        controllers.removeAll()
        check("C15", "request lifetime releases reservations", pool.reservedBytes == 0)
        let zero = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536, maxPrefillWaitMinutes: 0), slackBytes: 1, clock: { tick }, availableGB: { 0 })
        check("C14", "zero wait retains memory guard", failure(.insufficientMemory) { try zero.check(nextAllocationBytes: 1) })
        let cancelled = RequestController(configuration: config, slackBytes: 0, connected: { false })
        check("C13", "disconnect before allocation", failure(.clientCancelled) { try cancelled.check() })
    }
}
