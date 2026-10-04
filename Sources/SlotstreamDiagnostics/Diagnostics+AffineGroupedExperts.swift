import Foundation
import MLX
import Slotstream

extension Diagnostics {
    /// Component proof only. The model keeps using the complete expert domain
    /// until this operator also passes the independent full-model references.
    public static func affineGroupedExperts(baseline: URL, control: URL, output: URL,
                                           admissionChecks: Bool = false) throws -> Data {
        guard !FileManager.default.fileExists(atPath: output.path),
              !ProcessInfo.processInfo.environment.keys.contains(where: {
                  $0.hasPrefix("SLOTSTREAM_") || $0.hasPrefix("SS_DEBUG") || $0.hasPrefix("VQ_") || $0.hasPrefix("VQLAB_")
              }) else { throw ModelError("grouped expert probe requires a new output and no ambient overrides") }
        try ModelProcessGuard.acquire()
        guard let before = ProcessMemory.vmActivity(), before.reclaimableBytes >= 13_000_000_000 else {
            throw ModelError("grouped expert probe requires 13 GB actual reclaimable memory")
        }
        try FileManager.default.createDirectory(at: output, withIntermediateDirectories: false)
        let oldCache = MLX.Memory.cacheLimit, oldLimit = MLX.Memory.memoryLimit
        MLX.Memory.cacheLimit = 128_000_000; MLX.Memory.memoryLimit = min(oldLimit, 8_000_000_000)
        defer { Stream.gpu.synchronize(); MLX.Memory.clearCache(); MLX.Memory.cacheLimit = oldCache; MLX.Memory.memoryLimit = oldLimit }
        let started = ProcessInfo.processInfo.systemUptime
        func guardResources() throws {
            guard ProcessMemory.peakResidentBytes() <= 10_000_000_000,
                  let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= 3_000_000_000,
                  ProcessInfo.processInfo.systemUptime - started < 1800 else {
                throw ModelError("grouped expert probe exceeded its physical resource envelope")
            }
        }
        var guardFailure: Error?
        let index = try AffineExpertControl.open(baseline: baseline, control: control, shouldContinue: {
            do { try guardResources(); return true } catch { guardFailure = error; return false }
        })
        if let guardFailure { throw guardFailure }
        let pool = SlotPool(slots: 640, store: try ExpertStore(index: index))
        pool.workspacePiecewiseWrites = true
        var c = CheckBuilder("affine-grouped-experts"), complete = false
        var observations = [[String: Any]](), coldHashes = [String: String]()
        var admissionObservations = [[String: Any]]()
        let shapes = [1, 6, 7, 16, 44, 128, 204, 205, 256, 511, 512]
        let layers = [0, 47], patterns = ["wide", "skewed", "edges"]
        func save(_ failure: String? = nil) throws -> Data {
            var value: [String: Any] = ["schema": 1, "complete": complete, "qualification": false,
                "scope": "Exact component arithmetic across dispatch boundaries, residency and resize; no model integration or speed qualification",
                "control_manifest_sha256": AffineExpertControl.manifestSHA256,
                "shapes": shapes, "layers": layers, "patterns": patterns, "slots": [640, 640, 800, 640],
                "observations": observations, "saved_raw_f32_bytes": 0,
                "admission_checks": admissionChecks, "admission_observations": admissionObservations,
                "peak_process_bytes": ProcessMemory.peakResidentBytes(),
                "seconds": ProcessInfo.processInfo.systemUptime - started,
                "report": try JSONSerialization.jsonObject(with: JSONEncoder().encode(c.report()))]
            value["failure"] = failure
            let data = try JSONSerialization.data(withJSONObject: value, options: [.prettyPrinted, .sortedKeys])
            try data.write(to: output.appendingPathComponent("receipt.json"), options: .atomic)
            return data
        }
        func hash(_ value: MLXArray) -> String { AffineExpertControl.digest(value.asData(access: .copy).data) }
        func checkClock(_ before: ExpertLookaheadResidency, _ name: String) {
            let after = pool.lookaheadResidencySnapshot()
            c.equal(name + " keys", after.slotKeys, before.slotKeys)
            c.equal(name + " reference bits", after.referenceBits, before.referenceBits)
            c.equal(name + " hand", after.hand, before.hand)
            c.equal(name + " pins", pool.pinnedSlotCount, 0)
        }
        do {
            let valid = MLXArray.zeros([1, 1, 2560], dtype: .bfloat16), ids = (0..<10).map(Int32.init)
            let invalid: [(String, MLXArray, [Int32], Int)] = [
                ("shape", MLXArray.zeros([1, 1, 2559], dtype: .bfloat16), ids, 0),
                ("dtype", valid.asType(.float32), ids, 0),
                ("window", MLXArray.zeros([1, 513, 2560], dtype: .bfloat16), [Int32](repeating: 0, count: 5130), 0),
                ("short routes", valid, Array(ids.dropLast()), 0),
                ("negative route", valid, [-1] + Array(ids.dropFirst()), 0),
                ("large route", valid, [512] + Array(ids.dropFirst()), 0),
                ("negative layer", valid, ids, -1), ("large layer", valid, ids, 48),
            ]
            for (name, x, routes, layer) in invalid {
                let fetched = pool.recordsFetched
                do { _ = try AffineGroupedExperts.apply(x, ids: routes, layer: layer, pool: pool); c.expect("refuse " + name, false) }
                catch { c.expect("refuse " + name, String(describing: error).contains("bounded authenticated geometry")) }
                c.equal("refuse before reads " + name, pool.recordsFetched, fetched)
            }
            pool.admitOnSweep = true
            do { _ = try AffineGroupedExperts.apply(valid, ids: ids, layer: 0, pool: pool); c.expect("refuse admission", false) }
            catch { c.expect("refuse admission", String(describing: error).contains("no admission")) }
            pool.admitOnSweep = false
            guard c.report().passed else { throw ModelError("grouped expert rejection checks failed") }
            for (pass, slots) in [640, 640, 800, 640].enumerated() {
                try guardResources()
                if slots != pool.slots {
                    guard ProcessMemory.residentBytes() + UInt64(pool.growthTransientBytes(to: slots)) <= 10_000_000_000 else {
                        throw ModelError("grouped expert resize exceeds physical reservation")
                    }
                    pool.resize(to: slots)
                }
                if pass == 1 {
                    for layer in layers {
                        _ = try pool.ensureChecked((0..<128).map { ExpertKey(layer, $0) })
                        pool.unpinAll()
                    }
                }
                for layer in layers { for count in shapes { for pattern in patterns {
                    try guardResources()
                    let key = "l\(layer)/s\(count)/\(pattern)", name = "p\(pass)/" + key
                    let edges = [0, 1, 30, 31, 32, 33, 479, 480, 510, 511]
                    var routes = [Int32]()
                    for token in 0..<count { for rank in 0..<10 {
                        let expert: Int
                        switch pattern {
                        case "wide": expert = (token * 17 + rank * 53) % 512
                        case "skewed": expert = (token % 2 + rank) % 11
                        default: expert = edges[(rank + token) % 10]
                        }
                        routes.append(Int32(expert))
                    } }
                    let x = MLXArray((0..<(count * 2560)).map {
                        Float(($0 * 29 + layer * 17) % 513 - 256) / 256
                    }).asType(.bfloat16).reshaped([1, count, 2560])
                    let weights = MLXArray((1...10).map { Float($0) / 55 }).asType(.bfloat16).reshaped([1, 1, 10, 1])
                    let clock = pool.lookaheadResidencySnapshot()
                    let expected = try AffineGroupedExperts.fullDomain(x, ids: routes, layer: layer, pool: pool)
                    let (actual, o) = try AffineGroupedExperts.apply(x, ids: routes, layer: layer, pool: pool)
                    let expectedHash = hash(expected), actualHash = hash(actual)
                    let weightedHash = hash((actual * weights).sum(axis: 2))
                    c.equal(name + " route shape", actual.shape, [1, count, 10, 2560])
                    c.equal(name + " dtype", actual.dtype, .bfloat16)
                    c.equal(name + " exact per-route bytes", actualHash, expectedHash)
                    c.equal(name + " exact weighted reduction", weightedHash, hash((expected * weights).sum(axis: 2)))
                    c.equal(name + " reference dispatch family", o.groupedKernel, count * 10 >= 2048)
                    c.expect(name + " bounded rows", o.maximumRows <= 287)
                    c.equal(name + " bounded weight bank", o.maximumWeightBytes, 32 * 2_150_400)
                    if pass == 0 { coldHashes[key] = expectedHash }
                    c.equal(name + " exact cold/warm/resize bytes", actualHash, coldHashes[key])
                    checkClock(clock, name)
                    observations.append(["case": name, "expected_sha256": expectedHash, "actual_sha256": actualHash,
                        "weighted_sha256": weightedHash, "groups": o.groups, "tiles": o.tiles,
                        "resident_groups": o.residentGroups, "maximum_rows": o.maximumRows,
                        "maximum_weight_bytes": o.maximumWeightBytes, "grouped_kernel": o.groupedKernel])
                    _ = try save()
                    guard c.report().passed else { throw ModelError("grouped expert arithmetic or ownership differs") }
                } } }
            }
            if admissionChecks {
                let reference = SlotPool(slots: 640, store: pool.expertStore)
                let grouped = SlotPool(slots: 640, store: pool.expertStore)
                for arena in [reference, grouped] {
                    arena.workspacePiecewiseWrites = true
                    arena.admissionPiecewiseWrites = true
                    arena.admitOnSweep = true
                }
                func equalClock(_ label: String) {
                    let a = reference.lookaheadResidencySnapshot(), b = grouped.lookaheadResidencySnapshot()
                    c.equal(label + " CLOCK keys", b.slotKeys, a.slotKeys)
                    c.equal(label + " CLOCK reference bits", b.referenceBits, a.referenceBits)
                    c.equal(label + " CLOCK hand", b.hand, a.hand)
                    c.equal(label + " reference pins", reference.pinnedSlotCount, 0)
                    c.equal(label + " grouped pins", grouped.pinnedSlotCount, 0)
                }
                for (pass, slots) in [640, 640, 800, 640].enumerated() {
                    for arena in [reference, grouped] {
                        try guardResources()
                        guard ProcessMemory.residentBytes() + UInt64(arena.growthTransientBytes(to: slots)) <= 10_000_000_000 else {
                            throw ModelError("admission fixture resize exceeds physical reservation")
                        }
                        arena.resize(to: slots)
                        if pass == 1 {
                            // Fill and evict with unrelated layers, then mix
                            // cached and uncached requested experts. Both
                            // operators start from the same real CLOCK state.
                            for begin in stride(from: 0, to: 640, by: 32) {
                                _ = try arena.ensureChecked((begin..<(begin + 32)).map { ExpertKey(10 + $0 / 512, $0 % 512) })
                                arena.unpinAll()
                            }
                            _ = try arena.ensureChecked((0..<64).map { ExpertKey(0, $0) })
                            arena.unpinAll()
                        }
                    }
                    for (layer, count, pattern) in [(0, 7, "wide"), (0, 205, "edges"), (47, 512, "wide"), (47, 512, "skewed")] {
                        try guardResources()
                        let name = "admission/p\(pass)/l\(layer)/s\(count)/\(pattern)"
                        let edges = [0, 1, 30, 31, 32, 33, 479, 480, 510, 511]
                        var routes = [Int32]()
                        for token in 0..<count { for rank in 0..<10 {
                            let expert: Int
                            switch pattern {
                            case "wide": expert = (token * 17 + rank * 53) % 512
                            case "skewed": expert = (token % 2 + rank) % 11
                            default: expert = edges[(rank + token) % 10]
                            }
                            routes.append(Int32(expert))
                        } }
                        let x = MLXArray((0..<(count * 2560)).map {
                            Float(($0 * 29 + layer * 17) % 513 - 256) / 256
                        }).asType(.bfloat16).reshaped([1, count, 2560])
                        equalClock(name + " before")
                        let expected = try AffineGroupedExperts.fullDomain(x, ids: routes, layer: layer,
                            pool: reference, allowAdmissions: true)
                        let (actual, observed) = try AffineGroupedExperts.apply(x, ids: routes, layer: layer,
                            pool: grouped, allowAdmissions: true)
                        c.equal(name + " exact output", hash(actual), hash(expected))
                        c.equal(name + " unchanged component bytes", hash(actual), coldHashes["l\(layer)/s\(count)/\(pattern)"])
                        equalClock(name + " after")
                        var counts = [Int](repeating: 0, count: 512)
                        for route in routes { counts[Int(route)] += 1 }
                        let activeExperts: [Int] = (0..<512).filter { counts[$0] > 0 }
                        let ranked: [Int] = activeExperts.sorted { a, b in
                            if counts[a] != counts[b] { return counts[a] > counts[b] }
                            return a < b
                        }
                        let hot: [Int] = Array(ranked.prefix(max(1, slots / 48)))
                        c.equal(name + " complete hot set admitted", observed.admissionRecords, hot.count)
                        let keys = hot.map { ExpertKey(layer, $0) }
                        guard keys.allSatisfy({ reference.isResident($0) && grouped.isResident($0) }) else {
                            throw ModelError("grouped admission lost a selected record")
                        }
                        let actualBytes = grouped.gatherResident(keys).map(hash)
                        c.equal(name + " exact nine-piece cache records", actualBytes, reference.gatherResident(keys).map(hash))
                        admissionObservations.append(["case": name, "output_sha256": hash(actual),
                            "admitted_experts": hot, "cache_piece_sha256": actualBytes,
                            "groups": observed.groups, "resident_groups": observed.residentGroups])
                        _ = try save()
                        guard c.report().passed else { throw ModelError("grouped admission changed cache bytes, CLOCK or arithmetic") }
                    }
                }
                let before = grouped.lookaheadResidencySnapshot(), fault = ReadFault(afterJobs: 1)
                grouped.readFault = fault
                do {
                    _ = try AffineGroupedExperts.apply(MLXArray.zeros([1, 7, 2560], dtype: .bfloat16),
                        ids: (0..<70).map(Int32.init), layer: 3, pool: grouped, allowAdmissions: true)
                    c.expect("failed staging never publishes admission", false)
                } catch { c.expect("failed staging is observed", fault.hasFired) }
                grouped.readFault = nil
                let after = grouped.lookaheadResidencySnapshot()
                c.equal("failed staging preserves CLOCK keys", after.slotKeys, before.slotKeys)
                c.equal("failed staging preserves CLOCK bits", after.referenceBits, before.referenceBits)
                c.equal("failed staging preserves CLOCK hand", after.hand, before.hand)
                c.equal("failed staging retains no pins", grouped.pinnedSlotCount, 0)
                c.equal("complete admission trajectory", admissionObservations.count, 16)
            }
            try index.verifyAuthenticatedFilesUnchanged(); try guardResources()
            c.equal("complete frozen matrix", observations.count, 4 * layers.count * shapes.count * patterns.count)
            complete = c.report().passed
            return try save()
        } catch { _ = try? save(String(describing: error)); throw error }
    }
}
