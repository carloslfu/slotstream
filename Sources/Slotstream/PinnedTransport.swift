import Foundation

// The embedded manifest pins the exact original files and every CDN object.
enum PinnedTransport {
    static let revision = "13ec15dcebdddc817b57f0f9087c5ef82018f10e"
    static let defaults = [
        "https://huggingface.co/carloslfu/Qwen3.8-Flash-Next-MLX-4bit-Slotpack/resolve/\(revision)/slotpack/v1/\(manifestSHA256)"
    ]
    static let manifest: Result<SlotpackManifest, Error> = Result {
        try SlotpackManifest.load(Data(manifestJSON.utf8), digest: manifestSHA256, files: PinnedModel.files)
    }
    static var bases: [String] {
        if let value = ProcessInfo.processInfo.environment["SLOTSTREAM_COMPRESSED_SOURCES"] {
            let sources = value.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }
            if !sources.isEmpty { return sources }
        }
        return defaults
    }
}
