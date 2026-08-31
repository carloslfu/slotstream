// Process-wide safety helpers: real RSS accounting and a single model-bearing
// Slotstream process per user. MLX allocator counters are useful diagnostics,
// but they do not include Swift heaps, mmap residency, or raw I/O buffers.

import Darwin
import Foundation

public enum ProcessMemory {
    /// Current physical footprint as reported by Mach. `phys_footprint` is the
    /// number Activity Monitor uses and includes non-MLX allocations.
    public static func residentBytes() -> UInt64 {
        var info = task_vm_info_data_t()
        var count = mach_msg_type_number_t(
            MemoryLayout<task_vm_info_data_t>.stride / MemoryLayout<natural_t>.stride)
        let kr = withUnsafeMutablePointer(to: &info) { p in
            p.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), $0, &count)
            }
        }
        return kr == KERN_SUCCESS ? UInt64(info.phys_footprint) : 0
    }

    /// Lifetime high-water RSS. On Darwin, `ru_maxrss` is reported in bytes.
    public static func peakResidentBytes() -> UInt64 {
        var usage = rusage()
        guard getrusage(RUSAGE_SELF, &usage) == 0 else { return residentBytes() }
        return max(UInt64(max(0, usage.ru_maxrss)), residentBytes())
    }

    public static var residentGB: Double { Double(residentBytes()) / 1e9 }
    public static var peakResidentGB: Double { Double(peakResidentBytes()) / 1e9 }
}

/// Loading two copies of this model is enough to put an otherwise healthy Mac
/// into compressor/swap thrash. The lock is process-wide, so multiple model
/// objects inside one verification process remain possible, while a second
/// Slotstream process fails before allocating resident weights or a pool.
enum ModelProcessGuard {
    private static let stateLock = NSLock()
    private static var lockFD: Int32 = -1

    static func acquire() throws {
        stateLock.lock()
        defer { stateLock.unlock() }
        if lockFD >= 0 { return }
        let path = "/tmp/slotstream-model-\(getuid()).lock"
        let fd = open(path, O_RDWR | O_CREAT, 0o600)
        guard fd >= 0 else {
            throw ModelError("cannot create model-process lock at \(path): \(String(cString: strerror(errno)))")
        }
        guard flock(fd, LOCK_EX | LOCK_NB) == 0 else {
            close(fd)
            throw ModelError(
                "another Slotstream model process is already running for this user — "
                    + "stop it before starting run, serve, parity, or a heavyweight check")
        }
        lockFD = fd
    }
}
