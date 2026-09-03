// Single source of truth for the version string: the CLI's --version, the
// /api/version response, and the release tag check in CI all read this.

public enum SlotstreamBuild {
    public static let version = "0.2.3"
}

/// Model name used in error messages. The pinned manifest lives in the
/// executable target, so Core keeps its own display string.
public enum PinnedModelName {
    public static let display = "qwen3.8-flash-next:4bit"
}
