// Process-wide safety helpers: physical footprint, RSS and a single model-bearing
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

    /// Global VM counters at a named request boundary. Paging is diagnostic:
    /// these host-wide counters cannot attribute activity to this process and
    /// must not decide functional correctness or process-budget acceptance.
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

    private static func vmInfo() -> (task_vm_info_data_t, mach_msg_type_number_t)? {
        var info = task_vm_info_data_t()
        var count = mach_msg_type_number_t(
            MemoryLayout<task_vm_info_data_t>.stride / MemoryLayout<natural_t>.stride)
        let kr = withUnsafeMutablePointer(to: &info) { p in
            p.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                task_info(mach_task_self_, task_flavor_t(TASK_VM_INFO), $0, &count)
            }
        }
        return kr == KERN_SUCCESS ? (info, count) : nil
    }

    /// Current physical footprint as reported by Mach. `phys_footprint` is the
    /// number Activity Monitor uses and includes non-MLX allocations.
    public static func residentBytes() -> UInt64 {
        vmInfo().map { UInt64($0.0.phys_footprint) } ?? 0
    }

    // task_info may return an older revision than the SDK's structure. Check
    // the returned byte count before using the rev3 ledger field. Swift cannot
    // import TASK_VM_INFO_REV3_COUNT, so derive this field's extent from its ABI.
    static func footprintPeak(info: task_vm_info_data_t, count: mach_msg_type_number_t) -> UInt64 {
        guard let offset = MemoryLayout<task_vm_info_data_t>.offset(of: \.ledger_phys_footprint_peak),
              Int(count) * MemoryLayout<integer_t>.stride >= offset + MemoryLayout<Int64>.size,
              info.ledger_phys_footprint_peak > 0 else { return 0 }
        return UInt64(info.ledger_phys_footprint_peak)
    }

    /// Kernel-recorded lifetime physical-footprint high-water, including GPU
    /// allocations that have since been freed. Zero means unavailable. This is
    /// process-wide, not resettable or attributable to an individual request.
    public static func lifetimePhysicalFootprintPeakBytes() -> UInt64 {
        guard let (info, count) = vmInfo() else { return 0 }
        return footprintPeak(info: info, count: count)
    }

    /// Lifetime high-water RSS alone. It is not physical footprint and cannot
    /// be reset between requests. On Darwin, ru_maxrss is reported in bytes.
    public static func lifetimeRSSPeakBytes() -> UInt64 {
        var usage = rusage()
        guard getrusage(RUSAGE_SELF, &usage) == 0 else { return 0 }
        return UInt64(max(0, usage.ru_maxrss))
    }

    /// Compatibility high-water: maximum of lifetime physical footprint,
    /// lifetime RSS and current footprint. RSS alone misses released GPU
    /// buffers. Keep per-request sampled observations separate from this
    /// process-lifetime value. If Mach is unavailable, retain the RSS fallback.
    public static func peakResidentBytes() -> UInt64 {
        let rss = lifetimeRSSPeakBytes()
        guard let (info, count) = vmInfo() else { return rss }
        return max(rss, UInt64(info.phys_footprint), footprintPeak(info: info, count: count))
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
