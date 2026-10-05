// Single source of truth for the version string: the CLI's --version, the
// /api/version response, and the release tag check in CI all read this.

public enum SlotstreamBuild {
    public static let version = "0.2.28"

    /// Read the compiler's actual assertion mode rather than a user-supplied
    /// DEBUG define. The checked optimized build is the measured product
    /// configuration; debug and unchecked builds keep unknown speed evidence.
    package enum PerformanceConfiguration: String, CaseIterable, Sendable {
        case debug, release, unchecked, unknown

        package static var current: Self {
            if _isDebugAssertConfiguration() { return .debug }
            if _isReleaseAssertConfiguration() { return .release }
            if _isFastAssertConfiguration() { return .unchecked }
            return .unknown
        }
    }
}

/// Model name used in error messages. The pinned manifest lives in the
/// executable target, so Core keeps its own display string.
public enum PinnedModelName {
    public static let display = "qwen3.8-flash-next:4bit"
}
