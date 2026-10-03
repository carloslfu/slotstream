import Foundation
import MLX

/// Research-only fixed-capacity residency. Each validated layout has its own
/// bank and each layer owns its shared codebooks once. There is no resizing,
/// speculative I/O or automatic memory policy in this numerical probe.
package final class VQRecordCache {
    private let checkpoint: VQCheckpoint
    private let layouts: [VQRecordLayout]
    private let banks: [VQRecordLayout: VQRecordBank]
    private var books: [Int: [MLXArray]] = [:]
    private var readPlans: [Int: VQRecordReadPlan] = [:]
    private let parallelReads: Bool
    private let reinvestDenseSavings: Bool
    private var maximumStagingBytes = 0
    private var maximumPrefillStagingBytes = 0
    private var prefillReadBatches = 0, prefillReadRecords = 0
    package let reservedBankBytes: Int
    package let maximumBookBytes: Int
    package private(set) var residentBookBytes = 0

    package init(_ checkpoint: VQCheckpoint, capacityPerClass: Int, wide: Bool = false, parallelReads: Bool = false,
                 reinvestDenseSavings: Bool = false) throws {
        guard !reinvestDenseSavings || (checkpoint.compositeSHA256 == VQDenseOverlay.identitySHA256 && wide && parallelReads && capacityPerClass == 96) else {
            throw ModelError("dense reinvestment requires the exact composite and wide parallel residency")
        }
        self.checkpoint = checkpoint
        self.parallelReads = parallelReads
        self.reinvestDenseSavings = reinvestDenseSavings
        layouts = try (0..<48).map { try checkpoint.recordLayout(layer: $0) }
        let counts = layouts.reduce(into: [VQRecordLayout: Int]()) { $0[$1, default: 0] += 1 }
        // The pinned research profile identifies its most common descriptor
        // class explicitly. In 2.1 it spans 37 layers and there are three
        // classes; the larger packs span 41/42 layers across two classes.
        // This fixed experiment is not an automatic sizing policy.
        let wideLayout = layouts[checkpoint.wideRecordLayer]
        var capacities: [VQRecordLayout: Int] = [:]
        var admissions: [VQRecordLayout: VQBankAdmission] = [:]
        var bytes = 0, bookBytes = 0
        for layout in counts.keys {
            let admission: VQBankAdmission = reinvestDenseSavings && layout == wideLayout ? .denseCompositeReinvestment : .standard
            let capacity = (wide && layout == wideLayout ? 512 : capacityPerClass) * (reinvestDenseSavings ? 3 : 1)
            let maximumRows = try layout.projections.map { try admission.maximumRows(for: $0) }.min()!
            guard capacity <= maximumRows else { throw ModelError("wide VQ cache class is unqualified") }
            capacities[layout] = capacity
            admissions[layout] = admission
            bytes = try QuantizationBytes.sum(bytes, QuantizationBytes.product(capacity, layout.recordBytes))
        }
        for layout in layouts { bookBytes = try QuantizationBytes.sum(bookBytes, layout.codebookBytes) }
        guard (32...96).contains(capacityPerClass), counts.count == checkpoint.recordClassCount,
              !wide || capacityPerClass == 96,
              bytes + bookBytes <= (reinvestDenseSavings ? 3_600_000_000 : (wide ? 1_800_000_000 : 650_000_000)),
              let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= UInt64(bytes + bookBytes + 3_000_000_000) else {
            throw ModelError("VQ research cache exceeds its allocation or real-headroom bound")
        }
        var created: [VQRecordLayout: VQRecordBank] = [:]
        for (layout, capacity) in capacities { created[layout] = try VQRecordBank(layout: layout, capacity: capacity, admission: admissions[layout]!) }
        banks = created; reservedBankBytes = bytes; maximumBookBytes = bookBytes
    }

    package var stats: [String: Int] {
        let values = banks.values.map { $0.snapshot() }
        return ["allocation_classes": banks.count, "reserved_bank_bytes": reservedBankBytes,
                "total_capacity": values.reduce(0) { $0 + $1.capacity },
                "maximum_bank_capacity": values.map(\.capacity).max() ?? 0,
                "minimum_bank_capacity": values.map(\.capacity).min() ?? 0,
                "dense_savings_reinvested": reinvestDenseSavings ? 1 : 0,
                "maximum_executed_slot": values.map(\.maximumExecutedSlot).max() ?? -1,
                "minimum_class_maximum_executed_slot": values.map(\.maximumExecutedSlot).min() ?? -1,
                "resident_book_bytes": residentBookBytes, "maximum_book_bytes": maximumBookBytes,
                "parallel_read_lanes": parallelReads ? VQRecordReadBatch.maximumLanes : 0,
                "maximum_read_staging_bytes": maximumStagingBytes,
                "maximum_prefill_staging_bytes": maximumPrefillStagingBytes,
                "prefill_read_batches": prefillReadBatches, "prefill_read_records": prefillReadRecords,
                "occupied_records": values.reduce(0) { $0 + $1.occupied },
                "pinned_records": values.reduce(0) { $0 + $1.pinned },
                "hits": values.reduce(0) { $0 + $1.hits }, "loads": values.reduce(0) { $0 + $1.loads },
                "evictions": values.reduce(0) { $0 + $1.evictions }]
    }

    private func sharedBooks(_ layer: Int) throws -> [MLXArray] {
        guard (0..<48).contains(layer) else { throw ModelError("VQ cache layer is out of range") }
        if let present = books[layer] { return present }
        let loaded = try checkpoint.recordBooks(layer: layer)
        let bytes = loaded.reduce(0) { $0 + $1.nbytes }
        guard bytes == layouts[layer].codebookBytes, bytes <= maximumBookBytes - residentBookBytes else {
            throw ModelError("VQ shared codebooks differ from the reserved ledger")
        }
        books[layer] = loaded; residentBookBytes += bytes
        return loaded
    }

    private func readPlan(_ layer: Int) throws -> VQRecordReadPlan {
        if let present = readPlans[layer] { return present }
        let plan = try checkpoint.recordReadPlan(layer: layer)
        readPlans[layer] = plan
        return plan
    }

    /// A scan reads into private immutable staging and never changes expert
    /// bank membership, pins or CLOCK history. Reuse the layer's one owned
    /// codebook set and immutable descriptor plan after all workers join.
    package func prefillRecords(layer: Int, experts: [UInt32],
                                shouldContinue: () -> Bool = { true }) throws -> VQRecordBatch {
        guard parallelReads, (0..<48).contains(layer) else {
            throw ModelError("parallel VQ prefill requires explicitly enabled bounded reads")
        }
        let shared = try sharedBooks(layer), plan = try readPlan(layer)
        let reservation = try VQPrefillRecords.reservation(experts: experts.count, layout: layouts[layer],
                                                          scratchReadBytes: plan.scratchReadBytes)
        let batch = try VQPrefillRecords.load(layer: layer, experts: experts, layout: layouts[layer],
            plan: plan, books: shared, shouldContinue: shouldContinue)
        maximumPrefillStagingBytes = max(maximumPrefillStagingBytes, reservation)
        prefillReadBatches += 1; prefillReadRecords += experts.count
        return batch
    }

    package func call(_ x: MLXArray, layer: Int, routes: [UInt32]) throws -> VQRouteStream.Result {
        guard (0..<48).contains(layer), let bank = banks[layouts[layer]] else { throw ModelError("VQ cache has no compatible allocation class") }
        let shared = try sharedBooks(layer)
        let batchReader: VQRecordBank.BatchReader?
        if parallelReads {
            let plan = try readPlan(layer)
            batchReader = { keys in
                guard keys.allSatisfy({ $0.layer == layer }) else { throw ModelError("VQ parallel read crossed its layer plan") }
                let reservation = try VQRecordReadBatch.reservation(jobs: keys.count, pieceBytes: plan.pieceBytes,
                                                                   scratchReadBytes: plan.scratchReadBytes)
                guard let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= UInt64(reservation + 3_000_000_000) else {
                    throw ModelError("VQ read staging lost its real-headroom reservation")
                }
                self.maximumStagingBytes = max(self.maximumStagingBytes, reservation)
                return try VQRecordReadBatch.read(experts: keys.map(\.expert), pieceBytes: plan.pieceBytes,
                                                   scratchReadBytes: plan.scratchReadBytes) { expert, keepGoing in
                    try plan.read(expert: expert, shouldContinue: keepGoing)
                }
            }
        } else { batchReader = nil }
        return try VQRouteStream.partition(x, routes: routes) { _, input, localRoutes, dispatchPairs in
            try bank.call(input, layer: layer, routes: localRoutes, dispatchPairs: dispatchPairs, books: shared,
                          batchReader: batchReader) { key, emit in
                try self.checkpoint.readRecord(layer: key.layer, expert: key.expert, emit: emit)
            }
        }
    }
}
