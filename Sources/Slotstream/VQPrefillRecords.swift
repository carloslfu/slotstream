import Foundation
import MLX

/// Immutable prefill staging assembled from the same joined, bounded read
/// lanes as demanded decode records. Only the caller owns MLX values and
/// loader state; workers receive an authenticated immutable positional plan.
/// This is an explicit research path, not a product allocation policy.
package enum VQPrefillRecords {
    package static let maximumReservationBytes = 300_000_000

    /// Charge the complete private read result, read scratch, final MLX
    /// arrays and the largest simultaneous concatenation buffer. Shared
    /// codebooks are already owned and priced by the caller, exactly once.
    package static func reservation(experts: Int, layout: VQRecordLayout, scratchReadBytes: Int) throws -> Int {
        let reading = try VQRecordReadBatch.reservation(jobs: experts,
            pieceBytes: layout.pieceBytes, scratchReadBytes: scratchReadBytes)
        let arrays = try QuantizationBytes.product(experts, layout.recordBytes)
        let joining = try QuantizationBytes.product(experts, layout.pieceBytes.max()!)
        let total = try QuantizationBytes.sum(QuantizationBytes.sum(reading, arrays), joining)
        guard total <= maximumReservationBytes else {
            throw ModelError("parallel VQ prefill exceeds its complete staging reservation")
        }
        return total
    }

    package static func load(layer: Int, experts: [UInt32], layout: VQRecordLayout,
                             plan: VQRecordReadPlan, books: [MLXArray],
                             processLimit: UInt64 = 10_000_000_000,
                             shouldContinue: () -> Bool = { true }) throws -> VQRecordBatch {
        guard (0..<48).contains(layer), (1...32).contains(experts.count),
              Set(experts).count == experts.count, experts.allSatisfy({ $0 < 512 }),
              plan.pieceBytes == layout.pieceBytes, books.count == 3,
              processLimit == 10_000_000_000 else {
            throw ModelError("parallel VQ prefill needs a complete bounded authenticated record plan")
        }
        for (index, book) in books.enumerated() {
            let projection = layout.projections[index]
            guard book.dtype == .float16, book.shape == [projection.codebookEntries, projection.dimensions] else {
                throw ModelError("parallel VQ prefill codebook differs from its record layout")
            }
        }
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        let bytes = try reservation(experts: experts.count, layout: layout, scratchReadBytes: plan.scratchReadBytes)
        let held = ProcessMemory.residentBytes()
        guard held > 0, held <= processLimit, UInt64(bytes) <= processLimit - held,
              let vm = ProcessMemory.vmActivity(), vm.reclaimableBytes >= UInt64(bytes + 3_000_000_000) else {
            throw ModelError("parallel VQ prefill lost its complete staging or physical-memory reservation")
        }
        let records = try VQRecordReadBatch.read(experts: experts.map(Int.init), pieceBytes: plan.pieceBytes,
            scratchReadBytes: plan.scratchReadBytes) { expert, keepGoing in
                try plan.read(expert: expert, shouldContinue: keepGoing)
            }
        // Every lane has joined before cancellation or any MLX publication.
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        var codes: [MLXArray] = [], scales: [MLXArray] = []
        for index in 0..<3 {
            let projection = layout.projections[index], rows = index == 2 ? 2560 : 640
            for piece in 0...1 {
                guard shouldContinue() else { throw CheckpointReadError.cancelled }
                let offset = index * 2 + piece
                let extent = try QuantizationBytes.product(experts.count, layout.pieceBytes[offset])
                let array = try autoreleasepool { () throws -> MLXArray in
                    var bytes = Data(); bytes.reserveCapacity(extent)
                    for record in records { bytes.append(record[offset]) }
                    guard bytes.count == extent else { throw ModelError("parallel VQ prefill lost a complete record piece") }
                    let unpacked = projection.packing == .unpacked8
                    let columns = piece == 0 ? projection.codeRowBytes / (unpacked ? 1 : 4) : projection.columns / 64
                    let dtype: DType = piece == 0 ? (unpacked ? .uint8 : .uint32) : .float16
                    let value = MLXArray(bytes, [experts.count, rows, columns], dtype: dtype)
                    eval(value)
                    guard value.nbytes == extent else { throw ModelError("parallel VQ prefill allocation differs from its ledger") }
                    return value
                }
                if piece == 0 { codes.append(array) } else { scales.append(array) }
            }
        }
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        guard ProcessMemory.peakResidentBytes() <= processLimit else {
            throw ModelError("parallel VQ prefill exceeded its physical-process envelope")
        }
        return try VQRecordBatch(layer: layer, expertIDs: experts, layout: layout,
                                 codes: codes, books: books, scales: scales)
    }
}
