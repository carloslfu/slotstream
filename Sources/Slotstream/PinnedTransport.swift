import Foundation

// The embedded manifest pins the exact original files and every CDN object.
enum PinnedTransport {
    static let defaults = [
        "https://weights.sevra.page/slotpack/v1/\(manifestSHA256)"
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
