import Foundation
import Darwin
var result: [String: Any] = ["thermalState": ["nominal", "fair", "serious", "critical"][min(3, max(0, ProcessInfo.processInfo.thermalState.rawValue))], "lowPowerModeEnabled": ProcessInfo.processInfo.isLowPowerModeEnabled]
if CommandLine.arguments.count == 2, let pid = Int32(CommandLine.arguments[1]) {
    var info = rusage_info_v4()
    let rc = withUnsafeMutablePointer(to: &info) { p in
        proc_pid_rusage(pid, RUSAGE_INFO_V4, UnsafeMutableRawPointer(p).assumingMemoryBound(to: rusage_info_t?.self))
    }
    if rc == 0 {
        result["pageins"] = info.ri_pageins
        result["physicalFootprintBytes"] = info.ri_phys_footprint
        result["residentBytes"] = info.ri_resident_size
    } else { result["processError"] = rc }
}
let data = try JSONSerialization.data(withJSONObject: result, options: [.sortedKeys])
print(String(decoding: data, as: UTF8.self))
