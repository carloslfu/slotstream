import Foundation
import MLX

extension VQLayout {
    /// The real U8/D2, packed D4 and packed D8 classes enter the wide-bank
    /// experiment. D2/K1024 retains the prior 96-row resource bound.
    /// These are research limits, not recommended production cache sizes.
    package var maximumResearchBankRows: Int {
        (dimensions == 2 && codebookEntries == 256 && packing == .unpacked8)
            || (dimensions == 4 && [256, 2048].contains(codebookEntries) && packing == .words32)
            || (dimensions == 8 && codebookEntries == 16384 && packing == .words32) ? 512 : 96
    }
}

/// Experimental fused expert projection for the reviewed VQ 3.2/4.4 runtime.
/// Not admitted by Engine.load. Cache ownership and whole-model qualification
/// must be established separately before a pack can use this path.
package struct VQExpert {
    private let codes: MLXArray
    private let prefillCodes: MLXArray
    private let codebook: MLXArray
    private let scales: MLXArray
    private let layout: VQLayout
    private let expertCount: Int
    private let outputRows: Int
    private let rowKernel: MLXFast.MLXFastKernel
    private let simdKernel: MLXFast.MLXFastKernel?
    private let prefillKernel: MLXFast.MLXFastKernel

    // Geometry is deliberately limited to the inspected Flash Next expert
    // families. This is an implementation bound, not a quality/performance cap.
    package init(codes: MLXArray, codebook: MLXArray, scales: MLXArray, layout: VQLayout, residentBank: Bool = false,
                 bankAdmission: VQBankAdmission = .standard) throws {
        guard residentBank || bankAdmission == .standard else { throw ModelError("larger admission requires an owned VQ bank") }
        let maximumRows = residentBank ? try bankAdmission.maximumRows(for: layout) : 32
        guard [640, 2560].contains(layout.columns), layout.groupSize == 64,
              codes.ndim == 3, (1...maximumRows).contains(codes.dim(0)), (1...2560).contains(codes.dim(1)),
              codebook.dtype == .float16, codebook.shape == [layout.codebookEntries, layout.dimensions],
              scales.dtype == .float16, scales.shape == [codes.dim(0), codes.dim(1), layout.columns / 64],
              codes.nbytes + codebook.nbytes + scales.nbytes <= (residentBank ? bankAdmission.maximumProjectionBytes : 256_000_000) else {
            throw ModelError("VQ expert exceeds the bounded inspected projection geometry")
        }
        switch (layout.dimensions, layout.codebookEntries, layout.packing) {
        case (2, 256, .unpacked8):
            guard codes.dtype == .uint8, codes.dim(2) == layout.codeRowBytes else {
                throw ModelError("VQ U8 expert code shape or dtype mismatch")
            }
            self.codes = codes.view(dtype: .uint32)
        case (2, 1024, .words32), (4, 256, .words32), (4, 2048, .words32), (8, 16384, .words32):
            guard codes.dtype == .uint32, codes.dim(2) == layout.codeRowBytes / 4 else {
                throw ModelError("VQ packed expert code shape or dtype mismatch")
            }
            self.codes = codes.reshaped(codes.shape)
        default: throw ModelError("VQ expert layout is outside the inspected kernel families")
        }
        // MLXArray is a mutable reference object. Keep private array contexts
        // so caller-side assignment cannot retarget an admitted record. These
        // views retain values, not leases on externally reused bank memory.
        self.codebook = codebook.reshaped(codebook.shape)
        prefillCodes = codes.reshaped(codes.shape)
        self.scales = scales.reshaped(scales.shape); self.layout = layout
        expertCount = codes.dim(0); outputRows = codes.dim(1)
        let kernels = try VQExpertKernels.shared(layout)
        rowKernel = kernels.row; simdKernel = kernels.simd; prefillKernel = kernels.prefill
    }

    /// A complete expert segment retains all its routed rows when storage is
    /// partitioned. Each independent reference tile has at most 32 rows and
    /// 64 output columns. Keep the pinned F16 input/output conversion.
    package func prefill(_ x: MLXArray, expertIDs: [UInt32], sourceRows: [UInt32]) throws -> MLXArray {
        guard x.ndim == 2, x.dim(1) == layout.columns, (1...5120).contains(x.dim(0)),
              [.float16, .bfloat16].contains(x.dtype), (1...5120).contains(expertIDs.count),
              sourceRows.count == expertIDs.count, sourceRows.allSatisfy({ $0 < UInt32(x.dim(0)) }),
              expertIDs.allSatisfy({ $0 < UInt32(expertCount) }),
              zip(expertIDs, expertIDs.dropFirst()).allSatisfy({ $0 <= $1 }) else {
            throw ModelError("VQ segmented prefill requires bounded sorted experts and valid source rows")
        }
        var tiles: [Int32] = [], first = 0
        while first < expertIDs.count {
            var end = first + 1
            while end < expertIDs.count, expertIDs[end] == expertIDs[first] { end += 1 }
            guard end - first <= 512 else { throw ModelError("VQ prefill expert segment exceeds its bound") }
            for row in stride(from: first, to: end, by: 32) {
                tiles += [Int32(expertIDs[first]), Int32(row), Int32(min(32, end - row))]
            }
            first = end
        }
        let count = tiles.count / 3
        let dims = MLXArray([Int32(outputRows), Int32(layout.columns), Int32(layout.columns / 64),
                             Int32(layout.codebookEntries), Int32(count)])
        return prefillKernel([prefillCodes, codebook, scales, x.asType(.float16), MLXArray(sourceRows), MLXArray(tiles), dims],
            grid: (32 * ((outputRows + 63) / 64), 4 * count, 1), threadGroup: (32, 4, 1),
            outputShapes: [[expertIDs.count, outputRows]], outputDTypes: [.float16])[0].asType(x.dtype)
    }

    /// x is [tokenRows, inputColumns], indices is [tokenRows, topK]. The
    /// caller may flatten token/expert pairs for down_proj (then topK = 1).
    /// Inputs pass through F16 and results return to the original dtype, as
    /// VQ_DECODE_BF16IO=0 in the pinned reference. Packed D8 uses the reference
    /// SIMD reduction only at <=20 routed pairs and >=32 scale groups.
    package func call(_ x: MLXArray, indices: MLXArray) throws -> MLXArray {
        guard x.ndim == 2, indices.ndim == 2, indices.dtype == .uint32,
              indices.dim(0) == x.dim(0), (1...10).contains(indices.dim(1)),
              x.dim(0) > 0, x.dim(0) <= 4096 / indices.dim(1) else {
            throw ModelError("VQ expert route shape is outside the bounded projection")
        }
        return try operation(x, expertIDs: indices.asArray(UInt32.self), topK: indices.dim(1))()
    }

    /// Prepare a projection from CPU routing, which SSD-backed inference must
    /// already know before reading experts. Validate once and keep private
    /// array contexts in the closure; repeated calls need no GPU max/readback.
    /// This owns array values, not future cache-slot pins or allocator leases.
    package func operation(_ x: MLXArray, expertIDs: [UInt32], topK: Int,
                           dispatchPairs: Int? = nil) throws -> () -> MLXArray {
        guard x.ndim == 2, x.dim(1) == layout.columns, x.dim(0) > 0,
              [.float16, .bfloat16].contains(x.dtype), (1...10).contains(topK),
              x.dim(0) <= 4096 / topK, expertIDs.count == x.dim(0) * topK,
              expertIDs.allSatisfy({ $0 < UInt32(expertCount) }) else {
            throw ModelError("VQ expert inputs or expert indices are outside the bounded projection")
        }
        let input = x.reshaped(x.shape)
        let indices = MLXArray(expertIDs)
        let n = expertIDs.count
        // A storage partition must retain the original operation's arithmetic
        // dispatch. The kernel still sees its local rows for bounds and I/O.
        let wholePairs = dispatchPairs ?? n
        guard (n...4096).contains(wholePairs) else {
            throw ModelError("VQ partition dispatch must cover its rows within the fused reference bound")
        }
        // A recorded verify pass contains up to five tokens, each routed to
        // ten experts. D8 must retain the single-token SIMD reduction across
        // that pass: switching to the scalar reduction at the third token
        // changes BF16 outputs and can change the target's accepted answer.
        // Ordinary reference/prefill dispatch remains unchanged. Use the
        // whole operation's pair count, never the storage partition's size.
        let invariantVerify = RowInvariantMatmul.enabled && wholePairs <= 50
        let simd = layout.dimensions == 8 && (wholePairs <= 20 || invariantVerify)
            && layout.columns / 64 >= 32
        let kernel = simd ? simdKernel! : rowKernel
        let dims = MLXArray([Int32(outputRows), Int32(layout.columns), Int32(layout.dimensions), Int32(64), Int32(n), Int32(layout.codebookEntries)])
        let group = min(256, outputRows)
        return { kernel([input.asType(.float16), indices, codes, codebook, scales, dims],
            template: [("T", DType.float16), ("BITS", layout.bits), ("MAX_K", layout.codebookEntries),
                ("MAX_NSUB", layout.columns / layout.dimensions), ("MAX_NX4", layout.columns / 4),
                ("MAX_TILE", 512), ("SZ", 0), ("XKREP", topK)],
            grid: simd ? (32, ((outputRows + 7) / 8) * 8, n) : (((outputRows + group - 1) / group) * group, n, 1),
            threadGroup: simd ? (32, 8, 1) : (group, 1, 1),
            outputShapes: [[input.dim(0), topK, outputRows]], outputDTypes: [.float16])[0].asType(input.dtype) }
    }
}
