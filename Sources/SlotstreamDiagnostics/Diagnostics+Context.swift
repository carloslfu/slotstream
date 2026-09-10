import Foundation
import Slotstream

extension Diagnostics {
    public static func configurableContext() throws -> CheckReport {
        var c = CheckBuilder("configurable-context")
        let cacheModel = UUID(), cacheOptions = InferenceOptimizations()
        let currentKey = PromptCheckpointKey(model: cacheModel, optimizations: cacheOptions,
            prefillChunk: 256, mtp: false)
        c.equal("prompt cache defaults to the current arithmetic epoch", currentKey.contextArithmetic, 1)
        c.expect("old arithmetic cannot match a current prompt checkpoint", currentKey != PromptCheckpointKey(
            model: cacheModel, optimizations: cacheOptions, prefillChunk: 256, mtp: false, contextArithmetic: 0))
        let caps = [1, 1024, 4096, 8192, 32768, 32769, 65535, 65536, 65537,
                    128255, 128256, 128257, 131071, 131072, 131073, 262143, 262144]
        for cap in caps {
            let bytes = ContextGeometry.sequenceBytes(tokens: cap)
            // Independent allocator geometry, not a restatement of a helper call.
            let rows = ((cap + 1023) / 1024) * 1024
            c.equal("main allocated capacity \(cap)", bytes, rows * 12 * (2 * 2 * 256 + 128) * 2)
            c.equal("MTP allocated capacity \(cap)", ContextGeometry.sequenceBytes(tokens: cap, mtp: true),
                    rows * 13 * (2 * 2 * 256 + 128) * 2)
        }
        c.equal("overflowing capacity is refused", ContextGeometry.sequenceBytes(tokens: Int.max), Int.max)
        c.equal("negative capacity is refused", ContextGeometry.sequenceBytes(tokens: -1), Int.max)
        // These represent separately owned buffers, including different spare
        // main/draft capacities after rollback. A large unrelated buffer cannot
        // pay for a replacement, and old storage is not yet reclaimable.
        let keyRow = 2 * 256 * 2
        let mainGrowth = ContextGeometry.nextBufferAllocationBytes(tokens: 1025,
            rowBytes: keyRow, allocatedBytes: 1024 * keyRow)
        let draftSpare = ContextGeometry.nextBufferAllocationBytes(tokens: 1024,
            rowBytes: keyRow, allocatedBytes: 4096 * keyRow)
        c.equal("main growth charges complete replacement", mainGrowth, 2048 * keyRow)
        c.equal("draft can reuse its own spare rows", draftSpare, 0)
        c.equal("draft spare does not offset main growth", mainGrowth + draftSpare, 2048 * keyRow)
        c.equal("matching buffer reuses existing capacity", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1024, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 0)
        c.equal("absent pooled indexer needs its own allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1025, rowBytes: 256, allocatedBytes: 0, step: 256), 1280 * 256)
        c.equal("compact raw growth preserves its 256-row step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 304, rowBytes: 256, allocatedBytes: 256 * 256, step: 256), 512 * 256)
        c.equal("compact tail copy is a new allocation", ContextGeometry.nextBufferAllocationBytes(
            tokens: 32, rowBytes: 256, allocatedBytes: 0, step: 256), 256 * 256)
        c.equal("provisional batch crosses the next allocation step", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1023 + 1 + 16, rowBytes: keyRow, allocatedBytes: 1024 * keyRow), 2048 * keyRow)
        c.equal("checkpoint copy cannot spend shared backing", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1000, rowBytes: keyRow, allocatedBytes: 0), 1024 * keyRow)
        c.equal("invalid allocation geometry refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: Int.max, rowBytes: keyRow, allocatedBytes: 0), Int.max)
        c.equal("negative owned byte count refuses", ContextGeometry.nextBufferAllocationBytes(
            tokens: 1, rowBytes: keyRow, allocatedBytes: -1), Int.max)
        for room in 0 ... 18 {
            let depth = ContextPolicy.maximumDraftDepth(requested: 16, at: 65536 - room, limit: 65536)
            c.equal("provisional context bounds draft depth/\(room)", depth, min(16, max(0, room - 1)))
            if room > 0 { c.expect("pending plus drafts remain inside context/\(room)", 1 + depth <= room) }
        }
        c.equal("Hermes transient anchor remains fixed", ContextMemoryLedger.transientReserveBytes(context: 65536), 905_969_664)
        c.equal("default has no extra reserve", ContextMemoryLedger.transientReserveBytes(context: 32768), 0)
        // Concurrent requests see one unchanged injected reading. Atomic
        // reservations, not real large allocations, decide how many fit.
        let reservations = RequestMemoryReservations()
        let resultLock = NSLock()
        var accepted: [RequestController] = []
        var refusals = 0
        let reservationPolicy = try ContextConfiguration(maxPrefillWaitMinutes: 0)
        DispatchQueue.concurrentPerform(iterations: 8) { _ in
            let control = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000,
                availableGB: { 0.010 })
            do {
                try control.attachReservations(reservations)
                try control.reservePreparedImageBytes(4_000_000)
                resultLock.withLock { accepted.append(control) }
            } catch { resultLock.withLock { refusals += 1 } }
        }
        c.equal("concurrent preparations cannot spend the same headroom", accepted.count, 2)
        c.equal("excess concurrent preparations refuse before allocation", refusals, 6)
        c.equal("queued decoded pixels remain reserved", reservations.reservedBytes, 8_000_000)
        if let active = accepted.first {
            do { try active.check(nextAllocationBytes: 3_000_000, phase: "test active generation") } catch {}
            c.equal("generation cannot spend queued preparation ownership", active.failure?.code, .insufficientMemory)
            c.equal("failed dispatch preserves retained-pixel reservations", reservations.reservedBytes, 8_000_000)
        }
        var retainedPreparation: RequestController? = accepted.popLast()
        accepted.removeAll()
        c.equal("prepared-image owner keeps its lease after request queue release", reservations.reservedBytes, 4_000_000)
        withExtendedLifetime(retainedPreparation) {}
        retainedPreparation = nil
        c.equal("last preparation owner releases its exact reservation", reservations.reservedBytes, 0)
        do {
            let fresh = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000, availableGB: { 0.010 })
            try fresh.attachReservations(reservations)
            try fresh.checkInputBytes(100_000)
            try fresh.checkInputBytes(1)
            c.equal("shorter later input check cannot release retained copies", reservations.reservedBytes, 1_600_000)
            try fresh.check(nextAllocationBytes: 4_000_000, phase: "test dispatch")
            c.equal("prepared and pending dispatch bytes are separately reserved", reservations.reservedBytes, 5_600_000)
            fresh.releaseDispatchReservation()
            c.equal("completed dispatch releases only transient ownership", reservations.reservedBytes, 1_600_000)
        }
        c.equal("request completion returns all reservations", reservations.reservedBytes, 0)
        // Optional workspace selection must not turn a feasible ordinary
        // request into a sticky refusal, or spend another request's lease.
        for shared in [false, true] {
            let label = "allocation choice/shared=\(shared)"
            let pool = RequestMemoryReservations()
            var room = 0.010
            var control: RequestController? = RequestController(configuration: reservationPolicy,
                slackBytes: 1_000_000, availableGB: { room })
            if shared { try control!.attachReservations(pool) }
            let preferred = try control!.chooseAllocation(preferredBytes: 8_000_000,
                fallbackBytes: 2_000_000, phase: label)
            c.expect("\(label): selects the fitting preferred path", preferred)
            c.equal("\(label): charges only selected dispatch", pool.reservedBytes, shared ? 8_000_000 : 0)
            room = 0.006
            let fallback = try control!.chooseAllocation(preferredBytes: 8_000_000,
                fallbackBytes: 2_000_000, phase: label)
            c.expect("\(label): keeps a feasible ordinary path", !fallback)
            c.equal("\(label): preferred refusal is not sticky", control!.failure, nil)
            c.equal("\(label): replaces rather than adds dispatch ownership", pool.reservedBytes, shared ? 2_000_000 : 0)
            room = 0.010
            let recovered = try control!.chooseAllocation(preferredBytes: 8_000_000,
                fallbackBytes: 2_000_000, phase: label)
            c.expect("\(label): later headroom can select the preferred path", recovered)
            room = 0.002
            do {
                _ = try control!.chooseAllocation(preferredBytes: 8_000_000,
                    fallbackBytes: 2_000_000, phase: label)
                c.expect("\(label): both infeasible paths must refuse", false)
            } catch let error as RequestFailure {
                c.equal("\(label): typed fallback refusal", error.code, .insufficientMemory)
                c.equal("\(label): reports minimum required bytes with slack", error.requiredBytes, 3_000_000)
            }
            c.equal("\(label): failed choice preserves prior ownership", pool.reservedBytes, shared ? 8_000_000 : 0)
            control = nil
            c.equal("\(label): completion releases every lease", pool.reservedBytes, 0)
        }
        do {
            let pool = RequestMemoryReservations()
            var queued: RequestController? = RequestController(configuration: reservationPolicy,
                slackBytes: 1_000_000, availableGB: { 0.013 })
            var active: RequestController? = RequestController(configuration: reservationPolicy,
                slackBytes: 1_000_000, availableGB: { 0.013 })
            try queued!.attachReservations(pool); try active!.attachReservations(pool)
            try queued!.reservePreparedImageBytes(4_000_000)
            try active!.reservePreparedImageBytes(2_000_000)
            let selected = try active!.chooseAllocation(preferredBytes: 8_000_000,
                fallbackBytes: 4_000_000, phase: "queued preparation choice")
            c.expect("optional workspace cannot spend queued or own preparation", !selected)
            c.equal("selected dispatch preserves both preparation owners", pool.reservedBytes, 10_000_000)
            active!.releaseDispatchReservation()
            c.equal("choice release preserves all retained preparation", pool.reservedBytes, 6_000_000)
            active = nil
            c.equal("active completion preserves the queued owner", pool.reservedBytes, 4_000_000)
            queued = nil
            c.equal("all choice and preparation owners release", pool.reservedBytes, 0)
        }
        do {
            let pool = RequestMemoryReservations(), lock = NSLock()
            var controls: [RequestController] = [], choices: [Bool] = [], errors = 0
            DispatchQueue.concurrentPerform(iterations: 2) { _ in
                let control = RequestController(configuration: reservationPolicy,
                    slackBytes: 1_000_000, availableGB: { 0.013 })
                do {
                    try control.attachReservations(pool)
                    let choice = try control.chooseAllocation(preferredBytes: 8_000_000,
                        fallbackBytes: 4_000_000, phase: "concurrent workspace choice")
                    lock.withLock { controls.append(control); choices.append(choice) }
                } catch { lock.withLock { errors += 1 } }
            }
            c.equal("concurrent optional choices both complete", errors, 0)
            c.equal("exactly one preferred workspace owns the available room", choices.filter { $0 }.count, 1)
            c.equal("the other concurrent request atomically selects its fallback", choices.filter { !$0 }.count, 1)
            c.equal("concurrent selection cannot double-spend room", pool.reservedBytes, 12_000_000)
            controls.removeAll()
            c.equal("concurrent choices leave no reservation leak", pool.reservedBytes, 0)
        }
        for shared in [false, true] {
            let pool = RequestMemoryReservations()
            let control = RequestController(configuration: reservationPolicy,
                slackBytes: 1_000_000, availableGB: { 0.010 })
            if shared { try control.attachReservations(pool) }
            let overflow = try control.chooseAllocation(preferredBytes: Int.max,
                fallbackBytes: 2_000_000, phase: "overflowing optional workspace")
            c.expect("overflowing optional size selects finite fallback/\(shared)", !overflow)
            c.equal("optional overflow does not poison request/\(shared)", control.failure, nil)
            for (preferred, fallback) in [(-1, 0), (1, -1), (1, 2)] {
                let invalid = RequestController(configuration: reservationPolicy,
                    slackBytes: 0, availableGB: { 1 })
                if shared { try invalid.attachReservations(pool) }
                do {
                    _ = try invalid.chooseAllocation(preferredBytes: preferred, fallbackBytes: fallback,
                        phase: "invalid choice geometry")
                    c.expect("invalid allocation choice refuses/\(shared)/\(preferred)/\(fallback)", false)
                } catch let error as RequestFailure {
                    c.equal("invalid allocation choice is typed/\(shared)/\(preferred)/\(fallback)", error.code, .invalidConfiguration)
                }
            }
            do {
                _ = try control.chooseAllocation(preferredBytes: Int.max, fallbackBytes: Int.max,
                    phase: "both choices overflow")
                c.expect("overflowing fallback refuses/\(shared)", false)
            } catch let error as RequestFailure {
                c.equal("overflowing fallback is typed/\(shared)", error.code, .insufficientMemory)
            }
        }
        let unreadableChoices: [Double?] = [nil, .nan, .infinity, -1]
        for reading in unreadableChoices {
            let standalone = RequestController(configuration: reservationPolicy,
                slackBytes: 0, availableGB: { reading })
            let choice = try standalone.chooseAllocation(preferredBytes: 8, fallbackBytes: 4,
                phase: "unreadable optional allocation")
            c.expect("unreadable memory never authorizes an optional workspace/\(String(describing: reading))", !choice)
            let shared = RequestController(configuration: reservationPolicy,
                slackBytes: 0, availableGB: { reading })
            try shared.attachReservations(RequestMemoryReservations())
            do {
                _ = try shared.chooseAllocation(preferredBytes: 8, fallbackBytes: 4,
                    phase: "unreadable shared allocation")
                c.expect("unreadable shared budget refuses", false)
            } catch let error as RequestFailure {
                c.equal("unreadable shared budget remains fail closed", error.code, .insufficientMemory)
            }
        }
        do {
            let long = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536,
                maxPrefillWaitMinutes: 0), slackBytes: 0, availableGB: { nil })
            do {
                _ = try long.chooseAllocation(preferredBytes: 8, fallbackBytes: 4, phase: "unknown long context")
                c.expect("unknown long-context fallback must refuse", false)
            } catch let error as RequestFailure {
                c.equal("long-context fallback preserves stricter admission", error.code, .insufficientMemory)
            }
            var tick: UInt64 = 0
            let expired = RequestController(configuration: try ContextConfiguration(maxPrefillWaitMinutes: 1),
                slackBytes: 0, clock: { tick }, availableGB: { 1 })
            tick = 60_000_000_000
            let disconnected = RequestController(configuration: reservationPolicy, slackBytes: 0,
                availableGB: { 1 }, connected: { false })
            let pressured = RequestController(configuration: reservationPolicy, slackBytes: 0,
                availableGB: { 1 }, pressure: { true })
            for (control, code) in [(expired, RequestFailure.Code.prefillDeadlineExceeded),
                                     (disconnected, .clientCancelled), (pressured, .insufficientMemory)] {
                do {
                    _ = try control.chooseAllocation(preferredBytes: 8, fallbackBytes: 4, phase: "terminal guard choice")
                    c.expect("allocation selection cannot bypass \(code)", false)
                } catch let error as RequestFailure {
                    c.equal("selection preserves terminal guard/\(code)", error.code, code)
                }
            }
        }
        // The single-choice cases above exercise the same delegated guards.
        // Multiple choices must retain preference order and atomically own
        // only the selected workspace, including retained preparations.
        for shared in [false, true] {
            let label = "multiple allocation choices/shared=\(shared)"
            let pool = RequestMemoryReservations()
            var room = 0.010
            var control: RequestController? = RequestController(configuration: reservationPolicy,
                slackBytes: 1_000_000, availableGB: { room })
            if shared { try control!.attachReservations(pool) }
            for (available, expected) in [(0.010, Optional(0)), (0.007, Optional(1)),
                                           (0.005, Optional(2)), (0.003, nil)] {
                room = available
                let selected = try control!.chooseAllocation(alternativeBytes: [8_000_000, 6_000_000, 4_000_000],
                    fallbackBytes: 2_000_000, phase: label)
                c.equal("\(label): largest fitting group at exact boundary/\(available)", selected, expected)
                let bytes = expected.map { [8_000_000, 6_000_000, 4_000_000][$0] } ?? 2_000_000
                c.equal("\(label): replaces only selected dispatch/\(available)", pool.reservedBytes, shared ? bytes : 0)
                c.equal("\(label): discarded alternatives do not poison request/\(available)", control!.failure, nil)
            }
            room = 0.010
            let ordered = try control!.chooseAllocation(alternativeBytes: [4_000_000, 8_000_000, 6_000_000],
                fallbackBytes: 2_000_000, phase: label)
            c.equal("\(label): caller preference is not sorted by price", ordered, 0)
            let overflow = try control!.chooseAllocation(alternativeBytes: [Int.max, 6_000_000],
                fallbackBytes: 2_000_000, phase: label)
            c.equal("\(label): overflowing first choice keeps finite second", overflow, 1)
            let empty = try control!.chooseAllocation(alternativeBytes: [], fallbackBytes: 2_000_000, phase: label)
            c.equal("\(label): empty alternatives retain ordinary dispatch", empty, nil)
            c.equal("\(label): empty choice replaces prior ownership", pool.reservedBytes, shared ? 2_000_000 : 0)
            room = 0.002
            do {
                _ = try control!.chooseAllocation(alternativeBytes: [8_000_000, 6_000_000, 4_000_000],
                    fallbackBytes: 2_000_000, phase: label)
                c.expect("\(label): infeasible fallback must refuse", false)
            } catch let error as RequestFailure {
                c.equal("\(label): fallback refusal remains typed", error.code, .insufficientMemory)
                c.equal("\(label): reports minimum required bytes", error.requiredBytes, 3_000_000)
            }
            room = 0.010
            do {
                _ = try control!.chooseAllocation(alternativeBytes: [], fallbackBytes: 0, phase: label)
                c.expect("\(label): terminal failure cannot be cleared by an empty choice", false)
            } catch let error as RequestFailure {
                c.equal("\(label): terminal failure stays sticky", error.code, .insufficientMemory)
            }
            control = nil
            c.equal("\(label): all choice ownership releases", pool.reservedBytes, 0)
            for (choices, fallback) in [([8, -1], 0), ([8, 1], 2), ([], -1)] {
                let invalid = RequestController(configuration: reservationPolicy, slackBytes: 0, availableGB: { 1 })
                if shared { try invalid.attachReservations(pool) }
                do {
                    _ = try invalid.chooseAllocation(alternativeBytes: choices, fallbackBytes: fallback, phase: label)
                    c.expect("\(label): every alternative must be valid/\(choices)/\(fallback)", false)
                } catch let error as RequestFailure {
                    c.equal("\(label): invalid later choice refuses before selecting/\(choices)/\(fallback)",
                        error.code, .invalidConfiguration)
                }
            }
        }
        do {
            let pool = RequestMemoryReservations()
            let queued = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000, availableGB: { 0.013 })
            let active = RequestController(configuration: reservationPolicy, slackBytes: 1_000_000, availableGB: { 0.013 })
            try queued.attachReservations(pool); try active.attachReservations(pool)
            try queued.reservePreparedImageBytes(4_000_000); try active.reservePreparedImageBytes(2_000_000)
            let choice = try active.chooseAllocation(alternativeBytes: [8_000_000, 6_000_000, 4_000_000],
                fallbackBytes: 2_000_000, phase: "multiple choices with preparations")
            c.equal("multiple choices charge own and queued preparation before selecting", choice, 1)
            c.equal("multiple choices preserve preparation and selected dispatch", pool.reservedBytes, 12_000_000)
            active.releaseDispatchReservation()
            c.equal("multiple choice release preserves both preparation owners", pool.reservedBytes, 6_000_000)
            withExtendedLifetime((queued, active)) {}
        }
        do {
            let pool = RequestMemoryReservations(), lock = NSLock()
            var controls: [RequestController] = [], choices: [Int?] = [], errors = 0
            DispatchQueue.concurrentPerform(iterations: 3) { _ in
                let control = RequestController(configuration: reservationPolicy,
                    slackBytes: 1_000_000, availableGB: { 0.015 })
                do {
                    try control.attachReservations(pool)
                    let choice = try control.chooseAllocation(alternativeBytes: [8_000_000, 4_000_000],
                        fallbackBytes: 2_000_000, phase: "concurrent multiple choices")
                    lock.withLock { controls.append(control); choices.append(choice) }
                } catch { lock.withLock { errors += 1 } }
            }
            c.equal("concurrent multiple choices all fit without double spending", errors, 0)
            c.equal("concurrent multiple choices allocate one largest scope", choices.filter { $0 == 0 }.count, 1)
            c.equal("concurrent multiple choices allocate one smaller scope", choices.filter { $0 == 1 }.count, 1)
            c.equal("concurrent multiple choices retain one ordinary fallback", choices.filter { $0 == nil }.count, 1)
            c.equal("concurrent multiple choices charge selected bytes once", pool.reservedBytes, 14_000_000)
            controls.removeAll()
            c.equal("concurrent multiple choices release every lease", pool.reservedBytes, 0)
        }
        for (chunk, counts) in [(256, Array(stride(from: 16, through: 4, by: -1))),
                                (512, Array(stride(from: 8, through: 4, by: -1))), (1024, [4])] {
            let choices = PrefillSchedule.automaticScopeChoices(remaining: 4099, at: 0, maxChunk: chunk, checkpoint: nil)
            c.equal("adaptive scope enumerates all full-pass sizes/\(chunk)", choices?.map(\.count), counts)
        }
        // Grouping may change read reuse, never the numerical compute
        // schedule. Check real planner ceilings, partial tails, cached offsets,
        // context-boundary reductions and the exact model limit.
        for ceiling in [256, 512, 1024, 2048, 4096] {
            for position in [0, 1, 255, 256, 257, 8192, 32768, 65536, 127744, 128000, 261120] {
                for requested in [1, 255, 256, 257, 767, 768, 1023, 1024, 1025, 2048, 2051, 4096, 8192] {
                    let remaining = min(requested, ContextPolicy.modelLimit - position)
                    let checkpoints: [Int?] = [nil, 256, position + 256]
                    for checkpoint in checkpoints {
                        let alternatives = PrefillSchedule.automaticScopeChoices(remaining: remaining, at: position,
                            maxChunk: ceiling, checkpoint: checkpoint)
                        c.equal("adaptive choices retain original eligibility/\(ceiling)/\(position)/\(remaining)/\(String(describing: checkpoint))",
                            alternatives?.first, PrefillSchedule.automaticScopePasses(remaining: remaining,
                                at: position, maxChunk: ceiling, checkpoint: checkpoint))
                        if let grouped = PrefillSchedule.automaticScopePasses(remaining: remaining, at: position,
                            maxChunk: ceiling, checkpoint: checkpoint) {
                            c.expect("adaptive choices preserve original schedule and every useful prefix/\(ceiling)/\(position)/\(remaining)/\(String(describing: checkpoint))",
                                alternatives?.first == grouped && alternatives?.last?.count == 4
                                    && alternatives?.count == grouped.count - 3
                                    && alternatives?.allSatisfy { $0 == Array(grouped.prefix($0.count)) } == true)
                            var at = position, left = remaining
                            var identical = true
                            for pass in grouped {
                                let ordinary = PrefillSchedule.next(remaining: left, at: at,
                                    maxChunk: ceiling, tailAware: false)
                                identical = identical && pass == ordinary
                                at += pass; left -= pass
                            }
                            c.expect("automatic group preserves every ordinary shape/\(ceiling)/\(position)/\(remaining)/\(String(describing: checkpoint))",
                                identical && grouped.count >= 4 && grouped.reduce(0, +) <= 4096
                                    && grouped.allSatisfy { [256, 512, 1024].contains($0) && PrefillSchedule.fits($0, at: at - $0) })
                            if let checkpoint, checkpoint > position, checkpoint <= at {
                                let ordinaryEnds = PrefillSchedule.computePasses(tokens: at - position,
                                    from: position, maxChunk: ceiling).map { $0.keyExtent }
                                // Only scheduled boundaries are retainable; an
                                // arbitrary interior checkpoint is not a new shape.
                                c.expect("automatic scope retains a scheduled checkpoint/\(ceiling)/\(position)/\(remaining)/\(checkpoint)",
                                    !ordinaryEnds.contains(checkpoint) || checkpoint == at)
                            }
                        }
                    }
                }
            }
        }
        for count in [1, 255, 256, 257, 767, 768, 1023] {
            c.equal("short prompt keeps chronological dispatch/\(count)",
                PrefillSchedule.automaticScopePasses(remaining: count, at: 0, maxChunk: 256, checkpoint: nil), nil)
        }
        c.equal("1024-row automatic threshold keeps four original passes",
            PrefillSchedule.automaticScopePasses(remaining: 1024, at: 0, maxChunk: 256, checkpoint: nil), [256, 256, 256, 256])
        c.equal("cold common-prefix checkpoint precedes read grouping",
            PrefillSchedule.automaticScopePasses(remaining: 4096, at: 0, maxChunk: 256, checkpoint: 256), nil)
        c.equal("cached prefix permits remaining whole passes",
            PrefillSchedule.automaticScopePasses(remaining: 1280, at: 256, maxChunk: 256, checkpoint: 256), Array(repeating: 256, count: 5))
        c.equal("512-row planner preserves its own arithmetic",
            PrefillSchedule.automaticScopePasses(remaining: 4096, at: 0, maxChunk: 512, checkpoint: nil), Array(repeating: 512, count: 8))
        c.equal("1024-row planner preserves its own arithmetic",
            PrefillSchedule.automaticScopePasses(remaining: 4096, at: 0, maxChunk: 1024, checkpoint: nil), Array(repeating: 1024, count: 4))
        for ceiling in [2048, 4096] {
            c.equal("no speculative benefit from too few large passes/\(ceiling)",
                PrefillSchedule.automaticScopePasses(remaining: 8192, at: 0, maxChunk: ceiling, checkpoint: nil), nil)
        }
        for args in [(-1, 0, 256), (Int.max, 0, 256), (1024, -1, 256), (1024, ContextPolicy.modelLimit, 256),
                     (1024, 0, 0), (1024, 0, 4097)] {
            c.equal("invalid automatic geometry refuses/\(args)", PrefillSchedule.automaticScopePasses(
                remaining: args.0, at: args.1, maxChunk: args.2, checkpoint: nil), nil)
        }
        c.expect("optional scope fits the exact process boundary", ContextWorkspace.fitsAutomaticScope(
            footprintBytes: 7_000_000_000, allocationBytes: 3_000_000_000, limitBytes: 10_000_000_000))
        c.expect("one excess byte keeps the ordinary path", !ContextWorkspace.fitsAutomaticScope(
            footprintBytes: 7_000_000_001, allocationBytes: 3_000_000_000, limitBytes: 10_000_000_000))
        c.expect("ordinary unsigned Mach footprint converts without truncation", ContextWorkspace.fitsAutomaticScope(
            footprintBytes: Int(clamping: UInt64(7_000_000_000)), allocationBytes: 3_000_000_000,
            limitBytes: 10_000_000_000))
        c.expect("unrepresentable Mach footprint cannot authorize an optional workspace", !ContextWorkspace.fitsAutomaticScope(
            footprintBytes: Int(clamping: UInt64.max), allocationBytes: 1, limitBytes: nil))
        for args in [(0, 1, 10), (-1, 1, 10), (1, -1, 10), (1, Int.max, Int.max), (Int.max - 1, 2, Int.max), (1, 1, 0)] {
            c.expect("invalid optional process budget refuses/\(args)", !ContextWorkspace.fitsAutomaticScope(
                footprintBytes: args.0, allocationBytes: args.1, limitBytes: args.2))
        }
        for cap in caps {
            for target in [8.1, 10, 16, 24, 33] {
                for mtp in [Planner.MTPMode.off, .on, .auto] {
                    do {
                        let p = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44,
                            mtp: mtp, mtpAvailable: true, vision: .off, maxContextTokens: cap,
                            simulated: true, qualification: true)
                        c.expect("fit \(cap)/\(target)/\(mtp)", p.memoryLedger.expectedPeakBytes <= Int(target * 1e9))
                        c.equal("preserve window \(cap)/\(target)/\(mtp)", p.maxContextTokens, cap)
                        if mtp == .on { c.expect("forced MTP stays on \(cap)/\(target)", p.mtpEnabled) }
                    } catch {
                        c.expect("bounded refusal \(cap)/\(target)/\(mtp)", !String(describing: error).isEmpty)
                    }
                }
            }
        }
        let baseline = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off, simulated: true)
        let small = try Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 16,
            ramGB: 51.5, workingSetGB: 40.2, availableGB: 44, mtp: .off, vision: .off,
            maxContextTokens: 1024, simulated: true)
        c.expect("short cap refunds retention instead of reserving 32K", small.prefixCacheTokens <= 1024 && small.slots > baseline.slots)
        let machine = Machine.simulated(ramGB: 51.5, workingSetGB: 40.2, availableGB: 44)
        for target in [8.1, 10, 16, 24, 33] {
            let request = PlanRequest(memoryGB: target, mtp: .off, vision: .off, maxContextTokens: ContextPolicy.modelLimit)
            let result = Planner.contextFeasibility(request, on: machine, qualification: true)
            c.expect("solver maximum accepted at \(target)", result.maximumPlan != nil)
            if result.maximumFeasibleWindow < ContextPolicy.modelLimit {
                let next = result.maximumFeasibleWindow + 1
                let p = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: target,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: next, simulated: true, qualification: true)
                c.expect("next solver token refused at \(target)", p == nil)
            }
        }
        for chunk in [64, 128, 256, 512, 1024, 2048, 4096] {
            for start in [0, 1, 32768, 65535, 128255, 128256, 128257, 131071, 262079, 262143] {
                let count = ContextPolicy.modelLimit - start
                var position = start
                let passes = PrefillSchedule.passes(tokens: count, from: start, maxChunk: chunk)
                var bounded = !passes.isEmpty
                for n in passes {
                    // Ordinary scheduling has always clamped small batch
                    // overrides up to 256. The 64-row floor applies only
                    // after the 256-row query/key product no longer fits.
                    let floor = 256 * (position + 256) <= 4096 * 8016 ? 256 : 64
                    bounded = bounded && n > 0 && n <= max(floor, chunk)
                        && n * (position + n) <= 4096 * 8016
                    position += n
                }
                c.expect("bounded schedule \(chunk) from \(start)", bounded && position == ContextPolicy.modelLimit)
            }
        }
        c.expect("overflowing schedule is refused", PrefillSchedule.passes(tokens: Int.max, from: Int.max, maxChunk: 4096).isEmpty)
        c.expect("uncalibrated late schedule is unknown", PrefillSchedule.estimateSeconds(tokens: 262144, maxChunk: 4096) == nil)
        c.expect("Hermes schedule retains an estimate", PrefillSchedule.estimateSeconds(tokens: 65536, maxChunk: 4096) != nil)
        let oddLate = PrefillSchedule.computePasses(tokens: 512, from: 200000, maxChunk: 4095)
        c.equal("diagnostic odd late schedule matches the canonical runtime shape", oddLate.map(\.tokens), Array(repeating: 64, count: 8))
        c.equal("diagnostic includes masked canonical columns", oddLate.map(\.keyExtent),
            Array(repeating: 200256, count: 4) + Array(repeating: 200512, count: 4))
        c.expect("diagnostic includes physical query rows", oddLate.allSatisfy { $0.queryRows == 64 })
        let paddedTail = PrefillSchedule.computePasses(tokens: 449, from: 200000, maxChunk: 4095)
        c.equal("diagnostic tail reports its padded query geometry", paddedTail.last?.queryRows, 64)
        c.equal("diagnostic tail preserves its one logical token", paddedTail.last?.tokens, 1)

        var tick: UInt64 = 0
        var available = 10.0
        var connected = true
        var pressure = false
        func controller(wait: Double = 1, cap: Int = 65536) throws -> RequestController {
            try RequestController(configuration: ContextConfiguration(maxContextTokens: cap, maxPrefillWaitMinutes: wait),
                slackBytes: 1_500_000_000, clock: { tick }, availableGB: { available },
                connected: { connected }, pressure: { pressure })
        }
        for invalid in [Double.nan, .infinity, -.infinity, -1, Double.greatestFiniteMagnitude] {
            c.expect("invalid duration \(invalid) refused", (try? ContextConfiguration(maxPrefillWaitMinutes: invalid)) == nil)
        }
        let estimated = try controller()
        do { try estimated.admit(missingTokens: 32768, from: 0, maxChunk: 256) } catch {}
        c.equal("cold estimate refuses before prefill", estimated.failure?.code, .prefillWaitExceeded)
        let reused = try controller()
        try reused.admit(missingTokens: 32, from: 64000, maxChunk: 4096)
        c.expect("fast continuation admits from its real position", reused.failure == nil)
        tick = 61_000_000_000
        do { try reused.check(phase: "image preparation") } catch {}
        c.equal("elapsed preparation still trips deadline", reused.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let queue = try controller()
        tick = 61_000_000_000
        do { try queue.check(phase: "queue") } catch {}
        c.equal("queue uses same clock", queue.failure?.code, .prefillDeadlineExceeded)
        tick = 0
        let decoding = try controller()
        decoding.sampledFirstToken(); tick = 61_000_000_000
        try decoding.check(phase: "decode")
        c.expect("decode does not inherit the prefill deadline", decoding.failure == nil)
        let timeless = try controller(wait: 0)
        tick += 100_000_000_000; try timeless.check()
        available = 1
        do { try timeless.check(nextAllocationBytes: 1) } catch {}
        c.equal("zero time policy retains memory guard", timeless.failure?.code, .insufficientMemory)
        available = 3
        let growth = try controller(wait: 0)
        do { try growth.check(nextAllocationBytes: 2_000_000_000) } catch {}
        c.equal("next allocation is charged before it starts", growth.failure?.code, .insufficientMemory)
        available = 10; pressure = true
        let pressed = try controller(wait: 0)
        do { try pressed.check() } catch {}
        c.equal("pressure is independent of time", pressed.failure?.code, .insufficientMemory)
        pressure = false; connected = false
        let cancelled = try controller()
        do { try cancelled.check() } catch {}
        c.equal("disconnect is typed cancellation", cancelled.failure?.code, .clientCancelled)
        c.expect("failed request cannot retain state", !cancelled.mayRetainState)
        let unknown = RequestController(configuration: try ContextConfiguration(maxContextTokens: 65536),
            slackBytes: 1_500_000_000, availableGB: { nil })
        do { try unknown.check(nextAllocationBytes: 1) } catch {}
        c.equal("unknown memory refuses long-state growth", unknown.failure?.code, .insufficientMemory)
        var governor = GovernorPolicy.Inputs(currentSlots: 2000, availableGB: 4, ramGB: 51.5,
            workingSetGB: 40.2, maxContextTokens: 65536)
        let empty = GovernorPolicy.desiredPlan(governor)
        governor.ownedAdditionalBytes = 1_000_000_000
        let owned = GovernorPolicy.desiredPlan(governor)
        c.expect("owned memory changes replan credit", (owned?.targetGB ?? 0) > (empty?.targetGB ?? 0))
        c.equal("request cap survives ownership credit", owned?.maxContextTokens, 65536)
        governor.availableGB = 0; governor.currentSlots = Geometry.floorSlots
        governor.maxContextTokens = ContextPolicy.modelLimit; governor.contextQualification = true
        governor.ownedAdditionalBytes = 0
        c.expect("infeasible governor plan is explicit", GovernorPolicy.desiredPlan(governor) == nil)
        for cap in [1, 1024, ContextPolicy.defaultTokens, ContextPolicy.mtpLimit] {
            for mtp in [false, true] {
                let exhausted = GovernorPolicy.Inputs(currentSlots: Geometry.floorSlots,
                    availableGB: 0, ramGB: 51.5, workingSetGB: 40.2,
                    mtpEnabled: mtp, maxContextTokens: cap)
                c.expect("ordinary startup advisory cannot authorize live work/\(cap)/\(mtp)",
                    GovernorPolicy.desiredPlan(exhausted) == nil)
                c.equal("infeasible floor does not invent a smaller arena/\(cap)/\(mtp)",
                    GovernorPolicy.decide(exhausted), .hold)
                var recovered = exhausted
                recovered.availableGB = 10
                if let plan = GovernorPolicy.desiredPlan(recovered) {
                    let physical = min(recovered.workingSetGB, recovered.availableGB
                        + Geometry.gb(recovered.currentSlots) + Planner.fixedFootprintGB
                        + (mtp ? Planner.mtpResidentGB : 0)
                        - Planner.availabilitySlackGB(ramGB: recovered.ramGB))
                    c.expect("recovery fits its credited physical budget/\(cap)/\(mtp)",
                        Double(plan.memoryLedger.expectedPeakBytes) <= physical * 1e9)
                    c.equal("feasible recovery preserves required head/\(cap)/\(mtp)", plan.mtpEnabled, mtp)
                } else {
                    c.expect("ordinary context has a feasible pure recovery/\(cap)/\(mtp)", false)
                }
            }
        }
        c.equal("overflowing public ledger saturates to refusal", ContextMemoryLedger(slots: Int.max,
            context: Int.max, chunk: Int.max, retentionTokens: Int.max, mtp: true, visionResident: true).expectedPeakBytes, Int.max)
        func expertWorkspace(_ tokens: Int = 4096, tile: Int = 1024,
                             batch: Int = 32, pool: Int = 0, admissions: Int = 0,
                             record: Int = 2_764_800) -> Int {
            ContextWorkspace.expertWorkspaceBytes(tokens: tokens, tile: tile, experts: 512,
                topK: 10, hidden: 2560, intermediate: 640, recordBytes: record,
                loadBatch: batch, admissionPoolBytes: pool, admissionRecords: admissions)
        }
        c.expect("scope admission prices old and replacement expert storage",
            expertWorkspace() >= 2 * 512 * 2_764_800 + 32 * 2_764_800)
        c.expect("scope staging override cannot hide a whole-layer upload",
            expertWorkspace(batch: 512) > expertWorkspace(batch: 32))
        c.expect("scope admission prices decode-pool replacement",
            expertWorkspace(pool: 1217 * 2_764_800, admissions: 25) > expertWorkspace())
        c.expect("large routed tile increases allocation reservation",
            expertWorkspace(tile: 4096) > expertWorkspace(tile: 1024))
        c.expect("merged routed tail cannot reduce allocation reservation",
            expertWorkspace(1279, tile: 1024) >= expertWorkspace(1024, tile: 1024))
        c.expect("retained scope outputs are charged beyond one compute tile",
            expertWorkspace(8192) > expertWorkspace(4096))
        c.equal("scope record overflow refuses before dispatch", expertWorkspace(record: Int.max), Int.max)
        c.equal("invalid scope tile refuses before dispatch", expertWorkspace(tile: 0), Int.max)
        c.equal("invalid scope staging refuses before dispatch", expertWorkspace(batch: 513), Int.max)
        c.equal("negative scope pool refuses before dispatch", expertWorkspace(pool: -1), Int.max)
        c.equal("scope admission requires an actual pool allocation", expertWorkspace(admissions: 1), Int.max)
        c.equal("invalid scope extent refuses before dispatch", expertWorkspace(0), Int.max)
        c.expect("grouped matmul expert padding is charged for a small route set",
            ContextWorkspace.expertWorkspaceBytes(tokens: 1, tile: 256, experts: 512,
                topK: 1, hidden: 2560, intermediate: 640, recordBytes: 1, loadBatch: 1)
                >= 2048 * (5 * 2560 + 4 * 640) * 4)
        c.equal("scope route geometry rejects more routes than experts",
            ContextWorkspace.expertWorkspaceBytes(tokens: 4096, tile: 1024, experts: 512,
                topK: 513, hidden: 2560, intermediate: 640, recordBytes: 2_764_800,
                loadBatch: 32), Int.max)
        let originalVision = ContextWorkspace.visionBytes(patches: 9216)
        let tiledVision = ContextWorkspace.visionBytes(patches: 9216, queryTile: 256)
        c.expect("vision charge uses actual query bound", originalVision > tiledVision * 4)
        c.equal("unsupported vision mode is refused", ContextWorkspace.visionBytes(patches: 9216, queryTile: 512), Int.max)
        c.expect("late 64 pass retains context-dependent workspace", ContextWorkspace.prefillBytes(pass: 64, context: 262144) > 64 * 1_300_000)
        for override in [1, 64, 128, 256, 257, 511, 513, 1023, 2047, 4095, 4096] {
            for position in [0, 32768, 65535, 65536] {
                c.expect("ordinary window preserves original floor/\(override)/\(position)",
                    PrefillSchedule.chunk(at: position, maxChunk: override) >= 256)
            }
        }
        c.equal("projection shape padding is charged before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 256), 256 * 1_300_000)
        c.equal("invalid projection shape refuses before dispatch", ContextWorkspace.prefillBytes(pass: 64,
            context: 256, minimumProjectionRows: 257), Int.max)
        c.equal("unbounded 128 final pass is refused", ContextWorkspace.prefillBytes(pass: 128, context: 262144), Int.max)
        c.equal("small attention domain stops at actual prompt end", ContextWorkspace.keyExtent(pass: 64,
            context: 448, referenceEnd: 470), 470)
        c.equal("small attention domain follows exact prefix origin", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 17, referenceEnd: 515), 273)
        c.equal("invalid reference domain fails closed", ContextWorkspace.keyExtent(pass: 64,
            context: 81, referenceStart: 18, referenceEnd: 515), Int.max)
        c.equal("one-row tail preserves matrix query dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 449, referenceEnd: 449), 64)
        c.equal("canonical one-row terminal keeps vector dispatch", ContextWorkspace.queryRows(pass: 1,
            context: 513, referenceEnd: 513), 1)
        c.equal("one-row tail prices its real key domain", ContextWorkspace.keyExtent(pass: 1,
            context: 449, referenceEnd: 449), 449)
        c.expect("padded tail workspace includes physical queries", ContextWorkspace.prefillBytes(pass: 1,
            context: 262143, referenceEnd: 262144, minimumProjectionRows: 256, padSmallQueries: true)
            >= 64 * 262144 * (24 * 8 + 16))
        for override in [64, 68, 127, 128, 136, 137, 255] {
            c.equal("late odd override selects a qualified full-pass shape/\(override)",
                ContextWorkspace.boundedSmallPass(requested: override, at: 200000,
                    referenceStart: 200000, referenceEnd: 262144), override >= 128 ? 128 : 64)
        }
        for origin in [0, 1, 17, 130001, 131073] {
            var position = max(origin, 256273), total = 0
            while position < ContextPolicy.modelLimit {
                let n = ContextWorkspace.boundedSmallPass(requested: 128, at: position,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                guard n > 0 else { c.expect("small-pass schedule advances/\(origin)", false); break }
                let extent = ContextWorkspace.keyExtent(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                let queries = ContextWorkspace.queryRows(pass: n, context: position + n,
                    referenceStart: origin, referenceEnd: ContextPolicy.modelLimit)
                c.expect("actual padded product stays bounded/\(origin)/\(position)",
                    queries * extent <= PrefillSchedule.measuredQueryKeyProduct)
                c.expect("small pass never crosses its reference domain/\(origin)/\(position)",
                    n <= 256 - ((position - origin) % 256))
                position += n; total += n
            }
            c.equal("small-pass schedule closes/\(origin)", total, ContextPolicy.modelLimit - max(origin, 256273))
        }
        let busy = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
            on: Machine.simulated(ramGB: 16, workingSetGB: 12, availableGB: 5))
        c.equal("busy machine never calls an unphysical window feasible", busy.maximumFeasibleWindow, 0)
        for prefix in [false, true] {
            let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
            let result = Planner.contextFeasibility(PlanRequest(memoryGB: 10, mtp: .off, vision: .off),
                on: machine, runtimePolicy: policy, qualification: true)
            c.expect("solver freezes actual retention policy \(prefix)", result.maximumPlan?.runtimeAllocationPolicy == policy)
            if let maximum = result.maximumPlan, maximum.maxContextTokens < ContextPolicy.modelLimit {
                let next = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: 10,
                    ramGB: machine.ramGB, workingSetGB: machine.workingSetGB, availableGB: 44,
                    mtp: .off, vision: .off, maxContextTokens: maximum.maxContextTokens + 1,
                    simulated: true, qualification: true, runtimePolicy: policy)
                c.expect("same-policy next token fails \(prefix)", next == nil)
            }
        }
        c.expect("negative scope start is refused", PrefillSchedule.scopePasses(remaining: 10,
            at: -1, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        c.expect("overflowing scope is refused", PrefillSchedule.scopePasses(remaining: Int.max,
            at: 262140, maxChunk: 4096, maxScope: 8192, tailAware: false).isEmpty)
        let inputGuard = RequestController(configuration: try ContextConfiguration(), slackBytes: 0, availableGB: { 10 })
        do { try inputGuard.check(nextAllocationBytes: -1) } catch {}
        c.equal("negative public allocation cannot bypass guard", inputGuard.failure?.code, .invalidConfiguration)
        c.equal("negative public workspace scope refuses safely", ContextWorkspace.prefillBytes(pass: 64, context: 1024, scope: Int.min), Int.max)
        var nested = JSONValue.string("payload")
        for _ in 0 ..< 64 { nested = .array([nested]) }
        c.equal("deep input is bounded before template recursion", ContextInputMemory.bytes(nested), Int.max)
        let tool = ToolDefinition(name: "read", description: "description", parameters: .object(["long": .string(String(repeating: "x", count: 5000))]))
        c.expect("tool schema charged before tokenization", ContextInputMemory.bytes(messages: [], tools: [tool]) >= 5000)
        // Freeze a whole-machine reading, then account for what an existing
        // instance actually owns. A feasible restart and settled governor
        // must agree. The preserved legacy startup floor can also return an
        // advisory that exceeds the physical budget; that is a refusal case,
        // never evidence that the live governor should admit work.
        var governorCaps = Set<Int>()
        var advisoryRefusals = Set<String>()
        for cap in [8192, 32768, 65536, 131072, 262144] {
            for prefix in [false, true] {
                let policy = try RuntimeAllocationPolicy(prefillChunkOverride: 256, prefixCacheEnabled: prefix)
                for mode in [0, 1, 2] where mode == 0 || cap <= 65536 {
                    for whole in [10.0, 12.0, 18.0, 44.0] {
                        let label = "governor \(cap)/prefix=\(prefix)/mode=\(mode)/available=\(whole)"
                        let initial = try? Planner.plan(expertsPerLayer: nil, poolGB: nil, memoryGB: nil,
                            ramGB: 51.5, workingSetGB: 40.2, availableGB: whole,
                            mtp: mode == 1 ? .on : .off, mtpAvailable: mode == 1,
                            vision: mode == 2 ? .on : .off, visionAvailable: mode == 2,
                            visionResidentReserved: mode == 2, maxContextTokens: cap,
                            qualification: true, runtimePolicy: policy)
                        guard let initial else { continue }
                        let additional = ContextGeometry.additionalActiveBytes(tokens: cap, mtp: mode == 1)
                        let held = prefix ? min(initial.prefixCacheTokens, 8192) * PrefixCache.bytesPerToken : 0
                        let owned = additional + held + (held > 0 ? PrefixCache.fixedBytesPerEntry : 0)
                        let physical = whole - initial.poolGB - Planner.fixedFootprintGB
                            - (mode == 1 ? Planner.mtpResidentGB : 0)
                            - (mode == 2 ? Planner.visionResidentGB : 0) - Double(owned) / 1e9
                        guard physical >= 0 else { continue }
                        governorCaps.insert(cap)
                        var input = GovernorPolicy.Inputs(currentSlots: initial.slots, availableGB: physical,
                            ramGB: 51.5, workingSetGB: 40.2, mtpEnabled: mode == 1,
                            visionEnabled: mode == 2, visionResidentReserved: mode == 2,
                            maxContextTokens: cap, runtimeAllocationPolicy: policy,
                            ownedAdditionalBytes: owned, contextQualification: true)
                        let settled = GovernorPolicy.desiredPlan(input)
                        let physicalBudget = min(input.workingSetGB,
                            whole - Planner.availabilitySlackGB(ramGB: input.ramGB))
                        let peak = Double(initial.memoryLedger.expectedPeakBytes)
                        let feasible = peak <= physicalBudget * 1e9
                            && (initial.targetGB.map { peak <= $0 * 1e9 } ?? true)
                        if !feasible {
                            advisoryRefusals.insert("\(cap)/\(prefix)/\(mode)/\(whole)")
                            c.expect("\(label): legacy startup advisory is refused live", settled == nil)
                            let target: Int
                            switch GovernorPolicy.decide(input) {
                            case .hold: target = input.currentSlots
                            case .resize(let slots, _): target = slots
                            }
                            c.equal("\(label): infeasible advisory settles at arena floor", target, Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - target)
                            input.currentSlots = target
                            c.expect("\(label): returning owned pool bytes cannot invent feasibility",
                                GovernorPolicy.desiredPlan(input) == nil)
                            c.equal("\(label): infeasible floor cannot shrink further", GovernorPolicy.decide(input), .hold)
                            continue
                        }
                        c.expect("\(label): same allocation after ownership credit", settled.map { abs($0.slots - initial.slots) <= 1 } ?? false)
                        c.equal("\(label): settled policy holds", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): chunk policy persists", settled?.prefillChunk, 256)
                        c.equal("\(label): mode persists", settled?.mtpEnabled, mode == 1)
                        if !prefix { c.equal("\(label): no retention resurrection", settled?.prefixCacheTokens, 0) }
                        input.pressure = .critical
                        let decision = GovernorPolicy.decide(input)
                        if case .resize(let slots, _) = decision {
                            c.expect("\(label): pressure gives memory back", slots < input.currentSlots && slots >= Geometry.floorSlots)
                            input.availableGB += Geometry.gb(input.currentSlots - slots)
                            input.currentSlots = slots
                        }
                        input.pressure = nil; input.secondsSincePressure = 1
                        c.equal("\(label): recovery respects cooldown", GovernorPolicy.decide(input), .hold)
                        input.secondsSincePressure = 61; input.secondsSinceResize = 61
                        if case .resize(let slots, _) = GovernorPolicy.decide(input) {
                            input.availableGB -= Geometry.gb(slots - input.currentSlots)
                            input.currentSlots = slots
                        }
                        c.equal("\(label): one recovery step settles", GovernorPolicy.decide(input), .hold)
                        c.equal("\(label): context survives recovery", GovernorPolicy.desiredPlan(input)?.maxContextTokens, cap)
                    }
                }
            }
        }
        c.equal("governor matrix executes every intended cap", governorCaps, Set([8192, 32768, 65536, 131072, 262144]))
        c.equal("governor matrix preserves all four original unphysical advisories", advisoryRefusals,
            Set(["8192/false/0/10.0", "8192/true/0/10.0", "32768/false/0/10.0", "32768/true/0/10.0"]))
        return c.report()
    }
}
