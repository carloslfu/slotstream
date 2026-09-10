import Darwin
import Foundation

/// Qualification identity for automatic activation of a new Metal kernel.
/// This is independent of simulated planner inputs and environment controls.
/// It grants neither a memory allowance nor a throughput estimate.
package struct OptimizationPlatform: Equatable {
    package let machineModel: String?
    package let chip: String?
    package let osBuild: String?
    package let nativeARM64: Bool

    package init(machineModel: String?, chip: String?, osBuild: String?, nativeARM64: Bool) {
        self.machineModel = machineModel; self.chip = chip
        self.osBuild = osBuild; self.nativeARM64 = nativeARM64
    }

    /// The complete native/serving RoPE gates currently cover this machine
    /// family and OS build only. An OS update, another SoC or failed identity
    /// read keeps the existing MLX implementation as the automatic fallback.
    package var qualifiedPartialRotation: Bool {
        nativeARM64 && machineModel == "Mac17,9" && chip == "Apple M5 Pro" && osBuild == "25G83"
    }

    private static func systemString(_ name: String) -> String? {
        var count = 0
        guard sysctlbyname(name, nil, &count, nil, 0) == 0, 1 < count, count <= 256 else { return nil }
        var bytes = [UInt8](repeating: 0, count: count)
        let capacity = count
        let result = bytes.withUnsafeMutableBytes { buffer in
            sysctlbyname(name, buffer.baseAddress, &count, nil, 0)
        }
        guard result == 0, 1 < count, count <= capacity, bytes[count - 1] == 0,
              !bytes[..<(count - 1)].contains(0) else { return nil }
        return String(bytes: bytes[..<(count - 1)], encoding: .utf8)
    }

    package static let current: Self = {
        #if arch(arm64)
        let native = true
        #else
        let native = false
        #endif
        return Self(machineModel: systemString("hw.model"), chip: systemString("machdep.cpu.brand_string"),
                    osBuild: systemString("kern.osversion"), nativeARM64: native)
    }()
}
