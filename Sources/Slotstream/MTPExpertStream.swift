import Foundation
import MLX

/// The draft head's routed experts, streamed through a small cache.
///
/// The head's 512 routed experts are 1.42 GB of its 1.47 GB file, and a draft
/// step routes its one row to 10 of them. On a small memory budget those bytes
/// are worth more as main-model cache, so a streamed head keeps `slots` of its
/// experts in a CLOCK cache and reads a missing one from `mtp.safetensors` when
/// a draft row routes to it: an uncached descriptor, one read per piece into
/// host scratch, then a copy into the slot. The gathers read the same bytes
/// from another slot index, so draft arithmetic is unchanged.
///
/// Replacing a slot's bytes from the CPU is safe because every earlier reader
/// has finished: a row's routing is read back on the host, and it depends on
/// the previous draft row's output, whose gathers therefore completed. The
/// verify pass never reads these slots, and consumption runs only the head's
/// attention (`MTPHead.forward(stateOnly:)`).
/// db/records/decisions/draft-head-streams-its-experts-below-76-per-layer.md
package final class MTPExpertStream {
    static let pieceSuffixes = [
        "gate_proj.weight", "gate_proj.scales", "gate_proj.biases",
        "up_proj.weight", "up_proj.scales", "up_proj.biases",
        "down_proj.weight", "down_proj.scales", "down_proj.biases",
    ]

    let slots: Int
    /// The nine pieces, each `slots` records long, in `pieceSuffixes` order.
    package let pools: [MLXArray]
    private let fd: Int32
    private let verifiedOwner: VQTensorFile?
    private let verifiedRefs: [TensorRef]
    private let expertCount: Int
    private let starts: [Int]
    private let pieceBytes: [Int]
    private let pieceOffsets: [Int]
    private let recordBytes: Int
    private let bases: [UnsafeMutableRawPointer]
    private var slotOf: [Int32]
    private var keyOf: [Int32]
    private var refBit: [Bool]
    private var hand = 0
    private let scratch: UnsafeMutableRawPointer
    private let scratchRecords: Int
    package private(set) var hits = 0
    package private(set) var misses = 0
    package private(set) var readSeconds = 0.0
    /// Test seam: the next read fails with this error, once.
    package var readFault: Error?
    /// Test seam after joined reads, before any cache byte is published.
    package var readJoinFault: Error?

    var residentBytes: Int { pools.reduce(0) { $0 + $1.nbytes } + scratchRecords * recordBytes }

    init(url: URL, base: String, expertCount: Int, topK: Int, slots: Int) throws {
        guard slots >= topK, slots <= expertCount, topK > 0 else {
            throw ModelError("draft expert stream needs between \(topK) and \(expertCount) slots (got \(slots))")
        }
        let handle = try FileHandle(forReadingFrom: url)
        defer { try? handle.close() }
        guard let lengthBytes = try handle.read(upToCount: 8), lengthBytes.count == 8 else {
            throw ModelError("draft expert stream: truncated mtp.safetensors header")
        }
        let length = Int(lengthBytes.withUnsafeBytes { $0.loadUnaligned(as: UInt64.self) })
        guard length > 0, length < 100_000_000, let header = try handle.read(upToCount: length), header.count == length,
              let json = try JSONSerialization.jsonObject(with: header) as? [String: Any] else {
            throw ModelError("draft expert stream: unreadable mtp.safetensors header")
        }
        var starts: [Int] = [], pieceBytes: [Int] = [], pieceOffsets: [Int] = []
        var shapes: [[Int]] = [], dtypes: [DType] = []
        var record = 0
        for suffix in Self.pieceSuffixes {
            let name = base + ".switch_mlp." + suffix
            guard let entry = json[name] as? [String: Any], let offsets = entry["data_offsets"] as? [Int],
                  offsets.count == 2, offsets[1] > offsets[0], let shape = entry["shape"] as? [Int],
                  shape.first == expertCount, let dtype = entry["dtype"] as? String else {
                throw ModelError("draft expert stream: \(name) is missing or not \(expertCount) experts")
            }
            let total = offsets[1] - offsets[0]
            guard total % expertCount == 0 else { throw ModelError("draft expert stream: \(name) is not split per expert") }
            switch dtype {
            case "U32": dtypes.append(.uint32)
            case "BF16": dtypes.append(.bfloat16)
            case "F16": dtypes.append(.float16)
            case "F32": dtypes.append(.float32)
            default: throw ModelError("draft expert stream: \(name) has unsupported dtype \(dtype)")
            }
            starts.append(8 + length + offsets[0])
            pieceBytes.append(total / expertCount)
            pieceOffsets.append(record)
            record += total / expertCount
            shapes.append([slots] + Array(shape.dropFirst()))
        }
        // The planner charges streamed heads by this geometry.
        guard record == PlannerCostModel.mtpExpertBytes, expertCount == PlannerCostModel.mtpExpertCount,
              topK <= PlannerCostModel.mtpStreamScratchExperts else {
            throw ModelError("draft expert stream: \(expertCount) experts of \(record) bytes and top \(topK) do not match the planned geometry")
        }
        let fd = open(url.path, O_RDONLY)
        guard fd >= 0 else { throw ModelError("draft expert stream: cannot open \(url.path)") }
        guard fcntl(fd, F_NOCACHE, 1) == 0, fcntl(fd, F_RDAHEAD, 0) == 0 else {
            close(fd)
            throw ModelError("draft expert stream: cannot disable caching on \(url.path)")
        }
        var memory: UnsafeMutableRawPointer? = nil
        guard posix_memalign(&memory, 16384, topK * record) == 0, let memory else {
            close(fd)
            throw ModelError("out of memory for the draft expert read buffer")
        }
        let pools = zip(shapes, dtypes).map { MLXArray.zeros($0.0, dtype: $0.1) }
        eval(pools)
        var bases: [UnsafeMutableRawPointer] = []
        for (piece, pool) in pools.enumerated() {
            let wrapped = pool.asData(access: .noCopyIfContiguous)
            guard wrapped.data.count == pool.nbytes, pool.nbytes == slots * pieceBytes[piece],
                  let base = wrapped.data.withUnsafeBytes({ $0.baseAddress }) else {
                close(fd); free(memory)
                throw ModelError("draft expert stream: slot memory is not addressable")
            }
            bases.append(UnsafeMutableRawPointer(mutating: base))
        }
        self.fd = fd
        self.verifiedOwner = nil
        self.verifiedRefs = []
        self.slots = slots
        self.pools = pools
        self.expertCount = expertCount
        self.starts = starts
        self.pieceBytes = pieceBytes
        self.pieceOffsets = pieceOffsets
        self.recordBytes = record
        self.bases = bases
        self.scratch = memory
        self.scratchRecords = topK
        slotOf = Array(repeating: -1, count: expertCount)
        keyOf = Array(repeating: -1, count: slots)
        refBit = Array(repeating: false, count: slots)
    }

    /// The independently configured candidate head must never reopen a path
    /// after hashing it. The complete original sidecar is authenticated before
    /// this allocation; every demanded range is read through that same owner.
    package init(verifiedOwner owner: VQTensorFile, slots: Int) throws {
        let count = PlannerCostModel.mtpExpertCount
        let topK = PlannerCostModel.mtpStreamScratchExperts
        guard owner.fileSHA256 == VQDraftWeights.fileSHA256, owner.uncachedRandomReads,
              (topK...count).contains(slots) else {
            throw ModelError("independent draft stream requires its pinned original sidecar and bounded cache")
        }
        var refs: [TensorRef] = [], sizes: [Int] = [], offsets: [Int] = []
        var shapes: [[Int]] = [], dtypes: [DType] = [], record = 0
        for suffix in Self.pieceSuffixes {
            let name = "mtp.layers.0.mlp.switch_mlp." + suffix
            guard let ref = owner.tensors[name], ref.shape.count == 3, ref.shape[0] == count,
                  ref.byteCount > 0, ref.byteCount % count == 0,
                  ref.dtype == (suffix.hasSuffix(".weight") ? "U32" : "BF16") else {
                throw ModelError("independent draft expert geometry differs from its pinned recipe")
            }
            refs.append(ref); sizes.append(ref.byteCount / count); offsets.append(record)
            record += ref.byteCount / count
            shapes.append([slots] + Array(ref.shape.dropFirst()))
            dtypes.append(ref.dtype == "U32" ? .uint32 : .bfloat16)
        }
        guard record == PlannerCostModel.mtpExpertBytes else {
            throw ModelError("independent draft stream differs from its memory ledger")
        }
        try owner.verifyUnchanged()
        var pointer: UnsafeMutableRawPointer?
        guard posix_memalign(&pointer, 16384, topK * record) == 0, let pointer else {
            throw ModelError("out of memory for the independent draft read buffer")
        }
        let arrays = zip(shapes, dtypes).map { MLXArray.zeros($0.0, dtype: $0.1) }
        eval(arrays)
        var addresses: [UnsafeMutableRawPointer] = []
        for (piece, array) in arrays.enumerated() {
            let view = array.asData(access: .noCopyIfContiguous)
            guard view.data.count == array.nbytes, array.nbytes == slots * sizes[piece],
                  let base = view.data.withUnsafeBytes({ $0.baseAddress }) else {
                free(pointer); throw ModelError("independent draft cache is not addressable")
            }
            addresses.append(UnsafeMutableRawPointer(mutating: base))
        }
        self.fd = -1; verifiedOwner = owner; verifiedRefs = refs
        self.slots = slots; pools = arrays; expertCount = count
        starts = refs.map(\.byteOffset); pieceBytes = sizes; pieceOffsets = offsets
        recordBytes = record; bases = addresses; scratch = pointer; scratchRecords = topK
        slotOf = Array(repeating: -1, count: count)
        keyOf = Array(repeating: -1, count: slots)
        refBit = Array(repeating: false, count: slots)
    }

    deinit {
        if fd >= 0 { close(fd) }
        free(scratch)
    }

    /// Slot indices holding `ids`, reading the missing experts first. The
    /// distinct experts of one call must fit the cache; a draft row's ten do.
    /// A failed read leaves its slots empty, never stale, and throws.
    package func slots(for ids: [Int32]) throws -> [Int32] {
        let distinct = Set(ids)
        guard distinct.count <= slots, distinct.allSatisfy({ $0 >= 0 && Int($0) < expertCount }) else {
            throw ModelError("draft expert stream: \(distinct.count) experts in one call exceed its \(slots) slots or its range")
        }
        var out = [Int32](repeating: -1, count: ids.count)
        var used = Set<Int32>()
        for (i, e) in ids.enumerated() {
            let s = slotOf[Int(e)]
            if s >= 0 { out[i] = s; refBit[Int(s)] = true; used.insert(s); hits += 1 }
        }
        var missing: [(expert: Int32, slot: Int32)] = []
        for (i, e) in ids.enumerated() where out[i] < 0 {
            if let earlier = missing.first(where: { $0.expert == e }) { out[i] = earlier.slot; continue }
            var victim: Int32 = -1
            var scanned = 0
            while victim < 0 {
                let c = hand
                hand = (hand + 1) % slots
                scanned += 1
                if used.contains(Int32(c)) { continue }
                if refBit[c] && scanned <= 2 * slots { refBit[c] = false; continue }
                victim = Int32(c)
            }
            // Unmap the victim before its bytes change.
            let old = keyOf[Int(victim)]
            if old >= 0 { slotOf[Int(old)] = -1 }
            keyOf[Int(victim)] = -1
            used.insert(victim)
            out[i] = victim
            missing.append((e, victim))
        }
        var lo = 0
        while lo < missing.count {
            let batch = Array(missing[lo ..< min(lo + scratchRecords, missing.count)])
            try read(batch)
            for m in batch {
                keyOf[Int(m.slot)] = m.expert
                slotOf[Int(m.expert)] = m.slot
                refBit[Int(m.slot)] = true
            }
            misses += batch.count
            lo += batch.count
        }
        return out
    }

    private func read(_ batch: [(expert: Int32, slot: Int32)]) throws {
        if let fault = readFault { readFault = nil; throw fault }
        let start = RuntimeClock.now()
        defer { readSeconds += RuntimeClock.seconds(since: start) }
        let pieces = Self.pieceSuffixes.count
        let jobs = batch.count * pieces
        var status = [Int32](repeating: 0, count: jobs)
        let fd = self.fd, scratch = self.scratch, bases = self.bases, recordBytes = self.recordBytes
        let starts = self.starts, pieceBytes = self.pieceBytes, pieceOffsets = self.pieceOffsets
        let owner = verifiedOwner, refs = verifiedRefs
        try owner?.verifyUnchanged()
        status.withUnsafeMutableBufferPointer { results in
            let results = results.baseAddress!
            DispatchQueue.concurrentPerform(iterations: jobs) { j in
                let m = batch[j / pieces], p = j % pieces
                let count = pieceBytes[p]
                let buffer = scratch + (j / pieces) * recordBytes + pieceOffsets[p]
                let offset = starts[p] + Int(m.expert) * count
                if let owner {
                    do { try owner.readDirect(into: buffer, ref: refs[p], offset: Int(m.expert) * count, count: count) }
                    catch { results[j] = -2 }
                    return
                }
                var done = 0
                while done < count {
                    let got = pread(fd, buffer + done, count - done, off_t(offset + done))
                    if got < 0, errno == EINTR { continue }
                    if got <= 0 { results[j] = got < 0 ? errno : -1; return }
                    done += got
                }
            }
        }
        if let failed = status.first(where: { $0 != 0 }) {
            if failed == -2 { throw ModelError("authenticated draft expert read failed; no partial batch was published") }
            throw ModelError(failed < 0 ? "draft expert read hit the end of mtp.safetensors"
                : "draft expert read failed: \(String(cString: strerror(failed)))")
        }
        try owner?.verifyUnchanged()
        if let fault = readJoinFault { readJoinFault = nil; throw fault }
        // Workers only fill reserved scratch. Copy after all reads and the
        // identity check succeed; no failed batch can publish partial bytes.
        for (row, item) in batch.enumerated() {
            for piece in 0..<pieces {
                memcpy(bases[piece] + Int(item.slot) * pieceBytes[piece],
                    scratch + row * recordBytes + pieceOffsets[piece], pieceBytes[piece])
            }
        }
    }
}
