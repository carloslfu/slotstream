import Foundation
import MLX

/// MLX 0.32.2's NAX split-D256 kernel (upstream PR #3842), selected through
/// forceFused (PR #4185). Its default heuristic misses our 256-row passes.
/// This changes reduction order, so qualification is numerical/task fidelity;
/// reuse within this backend still has to reproduce a cold prompt bit for bit.
package enum FusedPrefillAttention {
    /// Diagnostic-only tap installed by a bounded capture command. No tensor
    /// readback or capture occurs during ordinary inference.
    package static var diagnosticTap: ((MLXArray, MLXArray, MLXArray, MLXArray) -> Void)?
    /// Mirror the pinned backend's hardware/OS capability, independently of
    /// the narrower automatic qualification profile. Never force generic D256
    /// on an older GPU merely because an environment override requested it.
    package static func supportsNAX(architecture: String, major: Int, minor: Int) -> Bool {
        guard major > 26 || (major == 26 && minor >= 2),
              architecture.hasPrefix("applegpu_g"),
              let suffix = architecture.last,
              let generation = Int(architecture.dropFirst("applegpu_g".count).dropLast()) else { return false }
        return ["s", "p"].contains(String(suffix)) && generation >= (suffix == "p" ? 18 : 17)
    }

    package static let available: Bool = {
        #if arch(arm64)
        let os = ProcessInfo.processInfo.operatingSystemVersion
        return supportsNAX(architecture: GPU.deviceInfo().architecture,
            major: os.majorVersion, minor: os.minorVersion)
        #else
        return false
        #endif
    }()

    /// Even unchanged optimization flags can dispatch differently after an
    /// OS/GPU change. A copied disk cache must not inherit that arithmetic.
    package static func environmentIdentity(_ environment: [String: String]) -> String {
        let options = environment.filter { $0.key.hasPrefix("MLX_") }
        let encoder = JSONEncoder(); encoder.outputFormatting = [.sortedKeys]
        // String dictionaries always encode; JSON preserves embedded separators.
        return String(decoding: try! encoder.encode(options), as: UTF8.self)
    }

    package static let cacheIdentity = "mlx-0.32.2:\(GPU.deviceInfo().architecture):\(OptimizationPlatform.current.osBuild ?? "unknown"):nax=\(available):\(environmentIdentity(ProcessInfo.processInfo.environment))"

    package static func supported(q: MLXArray, k: MLXArray, v: MLXArray) -> Bool {
        guard available, Device.defaultDevice() == .gpu, q.ndim == 4, k.ndim == 4, v.ndim == 4,
              q.dtype == .bfloat16, k.dtype == q.dtype, v.dtype == q.dtype,
              q.dim(3) == 256, k.dim(3) == 256, v.dim(3) == 256,
              q.dim(2) > 8, q.dim(2) <= k.dim(2), k.dim(2) == v.dim(2),
              q.dim(0) == k.dim(0), k.dim(0) == v.dim(0),
              k.dim(1) > 0, k.dim(1) == v.dim(1), q.dim(1) % k.dim(1) == 0 else { return false }
        return true
    }

    package static func diagnosticProductionAttention(q: MLXArray, k: MLXArray, v: MLXArray,
        mask: MLXArray?, base: Int, block: Int, onFused: (() -> Void)? = nil) -> MLXArray {
        QSAAttention.attend(q: q, k: k, v: v, sparse: mask, base: base,
            scale: 0.0625, block: block, fusedPrefillAttention: true, onFused: onFused)
    }

    package static func attend(q: MLXArray, k: MLXArray, v: MLXArray, scale: Float,
        mask: MLXFast.ScaledDotProductAttentionMaskMode, enabled: Bool,
        onFused: (() -> Void)? = nil) -> MLXArray {
        let fused = enabled && supported(q: q, k: k, v: v)
        if let tap = diagnosticTap, case .array(let keep) = mask { tap(q, k, v, keep) }
        if fused { onFused?() }
        return MLXFast.scaledDotProductAttention(queries: q, keys: k, values: v,
            scale: scale, mask: mask, forceFused: fused)
    }
}
