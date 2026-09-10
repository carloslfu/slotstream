// Platform observations are separate from the pure planning policy.
// Public Planner entry points remain source-compatible.
import Darwin
import Foundation
import MLX

extension Planner {
    public static func deviceRAMGB() -> Double {
        Double(ProcessInfo.processInfo.physicalMemory) / 1e9
    }

    public static func deviceWorkingSetGB() -> Double {
        let ws = Double(MLX.GPU.deviceInfo().maxRecommendedWorkingSetSize) / 1e9
        return ws > 0 ? ws : deviceRAMGB() * 0.75
    }

    public static func deviceAvailableGB() -> Double? {
        var count = mach_msg_type_number_t(
            MemoryLayout<vm_statistics64_data_t>.stride / MemoryLayout<integer_t>.stride)
        var stats = vm_statistics64_data_t()
        let kr = withUnsafeMutablePointer(to: &stats) { p in
            p.withMemoryRebound(to: integer_t.self, capacity: Int(count)) {
                host_statistics64(mach_host_self(), HOST_VM_INFO64, $0, &count)
            }
        }
        guard kr == KERN_SUCCESS else { return nil }
        let pages = Double(stats.free_count) + Double(stats.purgeable_count)
            + Double(stats.external_page_count)
        return pages * Double(vm_page_size) / 1e9
    }
}
