// Process-wide safety helpers: real RSS accounting and a single model-bearing
// Slotstream process per user. MLX allocator counters are useful diagnostics,
// but they do not include Swift heaps, mmap residency, or raw I/O buffers.

import Darwin
import Foundation

public enum ProcessMemory {
    public struct OperatingConditions: Codable, Equatable, Sendable {
        public let thermalState: String
        public let lowPowerModeEnabled: Bool
    }
    /// Instantaneous OS policy state, distinct from pmset warning history.
    /// Neither value is a temperature sensor or an energy measurement.
    public static func operatingConditions() -> OperatingConditions {
        let process = ProcessInfo.processInfo
        let thermal: String
        switch process.thermalState {
        case .nominal: thermal = "nominal"
        case .fair: thermal = "fair"
        case .serious: thermal = "serious"
        case .critical: thermal = "critical"
        @unknown default: thermal = "unknown"
        }
        return OperatingConditions(thermalState: thermal, lowPowerModeEnabled: process.isLowPowerModeEnabled)
    }

    public struct VMActivity: Codable, Equatable, Sendable {
        public let swapins: UInt64
        public let swapouts: UInt64
        public let reclaimableBytes: UInt64
    }
    private static let hostPort = mach_host_self()

    /// Global VM counters at a named request boundary. These are separate
    /// from process startup and still reject any swap activity in that interval.
    public static func vmActivity() -> VMActivity? {
        var info = vm_statistics64_data_t()
        var count = mach_msg_type_number_t(MemoryLayout<vm_statistics64_data_t>.stride / MemoryLayout<integer_t>.stride)
        let result = withUnsafeMutablePointer(to: &info) { p in
            p.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                host_statistics64(hostPort, HOST_VM_INFO64, $0, &count)
            }
        }
        guard result == KERN_SUCCESS else { return nil }
        let pages = UInt64(info.free_count) + UInt64(info.purgeable_count) + UInt64(info.external_page_count)
        return VMActivity(swapins: UInt64(info.swapins), swapouts: UInt64(info.swapouts),
            reclaimableBytes: pages * UInt64(vm_page_size))
    }

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

    /// Lifetime high-water RSS alone. It is not physical footprint and cannot
    /// be reset between requests. On Darwin, ru_maxrss is reported in bytes.
    public static func lifetimeRSSPeakBytes() -> UInt64 {
        var usage = rusage()
        guard getrusage(RUSAGE_SELF, &usage) == 0 else { return 0 }
        return UInt64(max(0, usage.ru_maxrss))
    }

    /// Legacy observation: lifetime RSS or current footprint, whichever is
    /// larger. This can miss an earlier physical-footprint peak; it is not an
    /// upper bound. Use sampled footprint and the separate observations too.
    public static func peakResidentBytes() -> UInt64 {
        max(lifetimeRSSPeakBytes(), residentBytes())
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
