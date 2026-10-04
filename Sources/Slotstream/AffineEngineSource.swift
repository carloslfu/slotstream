import Darwin
import Foundation
import Tokenizers

/// Internal admission for the authenticated affine control. This does not
/// add an eligible artifact to Auto or bypass product qualification.
package struct AffineEngineSource {
    package let control: URL
    package let coefficients: URL
    package let piecewiseAllocation: Bool
    package let groupedExperts: Bool
    package let vision: Bool
    package var resources: PackMemoryProfile {
        vision ? .affine3GroupedVisionControl : (groupedExperts ? .affine3GroupedControl
            : (piecewiseAllocation ? .affine3PiecewiseControl : .affine3Control))
    }
    package init(control: URL, coefficients: URL, piecewiseAllocation: Bool = false,
                 groupedExperts: Bool = false, vision: Bool = false) {
        self.control = control
        self.coefficients = coefficients
        self.piecewiseAllocation = piecewiseAllocation
        self.groupedExperts = groupedExperts
        self.vision = vision
    }
}

/// Preserve the tokenizer library's parser and template semantics while
/// preventing mutable source paths from being reopened after validation.
/// The allowlist and each size/hash come from the shipped parent identity.
/// The larger tokenizer bound is deliberately separate from the four-MB
/// tensor/manifest metadata parser.
package struct PinnedTokenizerMetadata {
    private let files: [String: Data]
    package var generationConfig: Data { files["generation_config.json"]! }
    package static let names = ["config.json", "tokenizer.json", "tokenizer_config.json",
                                "chat_template.jinja", "generation_config.json"]

    package init(directory: URL) throws {
        var captured: [String: Data] = [:]
        for name in Self.names {
            guard let pin = PinnedModel.files.first(where: { $0.path == name }),
                  let sha = pin.sha256, pin.size > 0, pin.size <= 16_000_000 else {
                throw ModelError("missing bounded tokenizer metadata identity")
            }
            let fd = open(directory.appendingPathComponent(name).path,
                O_RDONLY | O_NOFOLLOW | O_NONBLOCK | O_CLOEXEC)
            guard fd >= 0 else { throw ModelError("cannot open pinned tokenizer metadata: \(name)") }
            let handle = FileHandle(fileDescriptor: fd, closeOnDealloc: true)
            defer { try? handle.close() }
            var value = stat()
            guard fstat(fd, &value) == 0, value.st_mode & S_IFMT == S_IFREG,
                  value.st_size == pin.size,
                  let data = try handle.read(upToCount: Int(pin.size) + 1), data.count == Int(pin.size),
                  AffineExpertControl.digest(data) == sha else {
                throw ModelError("tokenizer metadata differs from its pinned bytes: \(name)")
            }
            captured[name] = data
        }
        self.files = captured
    }

    package func load() async throws -> any Tokenizers.Tokenizer {
        // mkdtemp creates this invocation's private directory atomically. No
        // source path, symlink or unrelated directory is ever overwritten.
        var path = Array(FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-tokenizer-XXXXXX").path.utf8CString)
        guard mkdtemp(&path) != nil else { throw ModelError("cannot create private tokenizer snapshot") }
        let directory = URL(fileURLWithPath: String(cString: path), isDirectory: true)
        defer { try? FileManager.default.removeItem(at: directory) }
        for name in Self.names {
            try files[name]!.write(to: directory.appendingPathComponent(name), options: .withoutOverwriting)
        }
        return try await AutoTokenizer.from(modelFolder: directory)
    }
}

/// Owned image preprocessing metadata for the explicit candidate. Verification
/// captures the exact original values before any image or model allocation.
/// The later tower and geometry paths never reopen these mutable source paths.
package struct PinnedVisionMetadata {
    package let configuration: (VisionConfig, (min: UInt32, max: UInt32))

    package init(directory: URL) throws {
        func read(_ name: String) throws -> Data {
            guard let pin = PinnedModel.files.first(where: { $0.path == name }),
                  let sha = pin.sha256, pin.size > 0, pin.size <= 4_000_000 else {
                throw ModelError("missing bounded vision metadata pin")
            }
            let data = try AffineExpertControl.bounded(directory.appendingPathComponent(name),
                maximum: Int(pin.size), sha256: sha)
            guard data.count == pin.size else { throw ModelError("vision metadata size changed") }
            return data
        }
        configuration = try VisionTower.configuration(configData: read("config.json"),
            processorData: read("preprocessor_config.json"))
    }
}
