// slotstream Swift feasibility probe.
//
// Proves the whole streaming mechanism in miniature, in the target language:
//   1. allocate a quantized expert slot pool
//   2. pread expert records from an on-disk store (F_NOCACHE) into staging
//   3. write staging into pool slots (measure GB/s, check for full-pool copies)
//   4. gatherQuantizedMM over the pool == quantizedMatmul on the same expert
//
// If all four pass, the SlotPool architecture is sound in Swift.

import Foundation
import MLX
import MLXNN
import MLXRandom

let H = 2560, FF = 640, GROUP = 64, BITS = 4

// One expert = gate/up/down, each weight+scales+biases.
let gwBytes = FF * (H / 8) * 4      // uint32
let gsBytes = FF * (H / GROUP) * 2  // bfloat16
let dwBytes = H * (FF / 8) * 4
let dsBytes = H * (FF / GROUP) * 2
let recordBytes = 2 * (gwBytes + 2 * gsBytes) + (dwBytes + 2 * dsBytes)

func now() -> Double { Date().timeIntervalSince1970 }

func hr(_ s: String) { print("\n=== \(s) ==="); }

// ---------------------------------------------------------------- slot pool

final class SlotPool {
    let slots: Int
    var gw: MLXArray, gs: MLXArray, gb: MLXArray
    var uw: MLXArray, us: MLXArray, ub: MLXArray
    var dw: MLXArray, ds: MLXArray, db: MLXArray

    init(slots: Int) {
        self.slots = slots
        gw = MLXArray.zeros([slots, FF, H / 8], dtype: .uint32)
        gs = MLXArray.zeros([slots, FF, H / GROUP], dtype: .bfloat16)
        gb = MLXArray.zeros([slots, FF, H / GROUP], dtype: .bfloat16)
        uw = MLXArray.zeros([slots, FF, H / 8], dtype: .uint32)
        us = MLXArray.zeros([slots, FF, H / GROUP], dtype: .bfloat16)
        ub = MLXArray.zeros([slots, FF, H / GROUP], dtype: .bfloat16)
        dw = MLXArray.zeros([slots, H, FF / 8], dtype: .uint32)
        ds = MLXArray.zeros([slots, H, FF / GROUP], dtype: .bfloat16)
        db = MLXArray.zeros([slots, H, FF / GROUP], dtype: .bfloat16)
        eval(gw, gs, gb, uw, us, ub, dw, ds, db)
    }

    var bytes: Int {
        (gw.nbytes + gs.nbytes + gb.nbytes + uw.nbytes + us.nbytes + ub.nbytes
            + dw.nbytes + ds.nbytes + db.nbytes)
    }
}

// ------------------------------------------------------- expert store on disk

/// Fixed-size expert records; `idx` -> pread at idx*stride. This is `experts.bin`.
final class ExpertStore {
    let fd: Int32
    let stride: Int
    let count: Int

    init(path: String, count: Int) throws {
        self.count = count
        self.stride = (recordBytes + 16383) / 16384 * 16384  // 16 KiB aligned
        // build the store if absent
        if !FileManager.default.fileExists(atPath: path) {
            print("  building expert store: \(count) records x \(stride) B "
                + "= \(Double(count * stride) / 1e9) GB")
            let out = FileManager.default.createFile(atPath: path, contents: nil)
            precondition(out)
            let h = FileHandle(forWritingAtPath: path)!
            var rec = [UInt8](repeating: 0, count: stride)
            for i in 0 ..< count {
                // stamp each record so we can verify we read the right one
                rec[0] = UInt8(i & 0xFF); rec[1] = UInt8((i >> 8) & 0xFF)
                h.write(Data(rec))
            }
            try h.close()
        }
        fd = open(path, O_RDONLY)
        precondition(fd >= 0, "open failed")
        _ = fcntl(fd, F_NOCACHE, 1)
        _ = fcntl(fd, F_RDAHEAD, 0)
    }

    deinit { close(fd) }

    /// Read `n` records into one contiguous staging buffer, in parallel.
    func readBatch(_ ids: [Int], into buf: UnsafeMutableRawPointer, queueDepth: Int) {
        let n = ids.count
        DispatchQueue.concurrentPerform(iterations: min(queueDepth, n)) { w in
            var i = w
            while i < n {
                let dst = buf.advanced(by: i * recordBytes)
                let got = pread(fd, dst, recordBytes, off_t(ids[i] * stride))
                precondition(got == recordBytes, "short read \(got)")
                i += queueDepth
            }
        }
    }
}

// --------------------------------------------------------------------- main

let poolSlots = Int(ProcessInfo.processInfo.environment["SLOTS"] ?? "2048")!
let storePath = ProcessInfo.processInfo.environment["STORE"]
    ?? "\(NSHomeDirectory())/Projects/slotstream/models/.probe_experts.bin"
let storeCount = Int(ProcessInfo.processInfo.environment["STORE_N"] ?? "4096")!

print("slotstream Swift probe")
print("  record bytes : \(recordBytes)")
print("  pool slots   : \(poolSlots)")

hr("1. allocate slot pool")
var t0 = now()
let pool = SlotPool(slots: poolSlots)
print("  pool \(String(format: "%.2f", Double(pool.bytes) / 1e9)) GB "
    + "allocated in \(String(format: "%.2f", now() - t0)) s")
print("  GPU active: \(String(format: "%.2f", Double(GPU.activeMemory) / 1e9)) GB, "
    + "peak \(String(format: "%.2f", Double(GPU.peakMemory) / 1e9)) GB")

hr("2. correctness: gatherQuantizedMM over pool == quantizedMatmul")
let w = MLXRandom.normal([FF, H]).asType(.bfloat16)
let (qw, sc, bi) = quantized(w, groupSize: GROUP, bits: BITS)
let target = 7
pool.gw[target] = qw
pool.gs[target] = sc
pool.gb[target] = bi!
eval(pool.gw, pool.gs, pool.gb)

let x = MLXRandom.normal([1, 1, H]).asType(.bfloat16)
let idx = MLXArray([Int32(target)]).reshaped([1, 1, 1])
let got = gatherQuantizedMM(x, pool.gw, scales: pool.gs, biases: pool.gb,
                            rhsIndices: idx, transpose: true,
                            groupSize: GROUP, bits: BITS)
let ref = quantizedMatmul(x, qw, scales: sc, biases: bi, transpose: true,
                          groupSize: GROUP, bits: BITS)
eval(got, ref)
let diff = (got.reshaped([-1]) - ref.reshaped([-1])).abs().max().item(Float.self)
print("  max abs diff vs quantizedMatmul: \(diff)  [\(diff == 0 ? "PASS" : "CHECK")]")

hr("3. slot-write throughput (batched scatter)")
let nbatch = 48
let batchGW = MLXArray.zeros([nbatch, FF, H / 8], dtype: .uint32)
let batchGS = MLXArray.zeros([nbatch, FF, H / GROUP], dtype: .bfloat16)
let batchDW = MLXArray.zeros([nbatch, H, FF / 8], dtype: .uint32)
let batchDS = MLXArray.zeros([nbatch, H, FF / GROUP], dtype: .bfloat16)
eval(batchGW, batchGS, batchDW, batchDS)
let slotIdx = MLXArray((0 ..< nbatch).map { Int32(($0 * 7919) % poolSlots) })
eval(slotIdx)

@MainActor func writeBatch() {
    pool.gw[slotIdx] = batchGW; pool.gs[slotIdx] = batchGS; pool.gb[slotIdx] = batchGS
    pool.uw[slotIdx] = batchGW; pool.us[slotIdx] = batchGS; pool.ub[slotIdx] = batchGS
    pool.dw[slotIdx] = batchDW; pool.ds[slotIdx] = batchDS; pool.db[slotIdx] = batchDS
    eval(pool.gw, pool.gs, pool.gb, pool.uw, pool.us, pool.ub, pool.dw, pool.ds, pool.db)
}
writeBatch()
GPU.resetPeakMemory()
t0 = now()
let reps = 8
for _ in 0 ..< reps { writeBatch() }
var dt = (now() - t0) / Double(reps)
print("  \(nbatch) experts: \(String(format: "%.2f", dt * 1000)) ms  "
    + "-> \(String(format: "%.2f", Double(nbatch * recordBytes) / dt / 1e9)) GB/s")
print("  peak \(String(format: "%.2f", Double(GPU.peakMemory) / 1e9)) GB vs pool "
    + "\(String(format: "%.2f", Double(pool.bytes) / 1e9)) GB "
    + "[\(GPU.peakMemory < Int(Double(pool.bytes) * 1.6) ? "in-place OK" : "COPY!")]")

hr("4. end-to-end: pread from SSD -> staging -> pool slots")
let store = try ExpertStore(path: storePath, count: storeCount)
let staging = UnsafeMutableRawPointer.allocate(
    byteCount: nbatch * recordBytes, alignment: 16384)
defer { staging.deallocate() }

for qd in [1, 4, 8, 16] {
    var ids: [Int] = []
    var seed = UInt64(12345 &+ qd)
    for _ in 0 ..< nbatch {
        seed = seed &* 6364136223846793005 &+ 1442695040888963407
        ids.append(Int((seed >> 33) % UInt64(storeCount)))
    }
    let t = now()
    let iters = 6
    for _ in 0 ..< iters { store.readBatch(ids, into: staging, queueDepth: qd) }
    let d = (now() - t) / Double(iters)
    print("  QD\(qd): \(nbatch) records \(String(format: "%7.2f", d * 1000)) ms  "
        + "-> \(String(format: "%5.2f", Double(nbatch * recordBytes) / d / 1e9)) GB/s")
}

// full cycle: read + upload, the real per-step cost
var ids: [Int] = []
var seed: UInt64 = 999
for _ in 0 ..< nbatch {
    seed = seed &* 6364136223846793005 &+ 1442695040888963407
    ids.append(Int((seed >> 33) % UInt64(storeCount)))
}
t0 = now()
let cycles = 6
for _ in 0 ..< cycles {
    store.readBatch(ids, into: staging, queueDepth: 8)
    writeBatch()
}
dt = (now() - t0) / Double(cycles)
print("  FULL CYCLE (pread QD8 + slot write): \(String(format: "%.2f", dt * 1000)) ms "
    + "for \(nbatch) experts = \(String(format: "%.1f", Double(nbatch * recordBytes) / 1e6)) MB")
print("  => implies \(String(format: "%.1f", 1.0 / dt)) such refills/s")

hr("5. verify record identity (did we read the record we asked for?)")
var okCount = 0
store.readBatch(ids, into: staging, queueDepth: 8)
for (i, id) in ids.enumerated() {
    let p = staging.advanced(by: i * recordBytes).assumingMemoryBound(to: UInt8.self)
    let stamp = Int(p[0]) | (Int(p[1]) << 8)
    if stamp == (id & 0xFFFF) { okCount += 1 }
}
print("  \(okCount)/\(ids.count) records matched their stamp "
    + "[\(okCount == ids.count ? "PASS" : "FAIL")]")

print("\nprobe complete")
