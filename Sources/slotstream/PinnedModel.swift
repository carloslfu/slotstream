// GENERATED from the Hugging Face API for the pinned revision — do not hand-edit.
// Regenerate: curl the /tree/<revision>?recursive=true endpoint and rebuild this table.

import Foundation

/// The one model slotstream v0 runs, pinned to an exact upstream revision.
/// LFS files carry upstream sha256; small config files are size-checked and
/// then structurally validated by the engine when it loads them.
enum PinnedModel {
    static let name = "qwen3.8-flash-next:4bit"
    static let dirName = "qwen38-flash-next-mlx-4bit"
    static let repo = "pipenetwork/Qwen3.8-Flash-Next-MLX-4bit"
    static let revision = "aa7c790e804bbf9d491ddb109c3d61bc4a555f7c"
    /// Byte-identical mirror (same file sha256s) under the author's account,
    /// tried first so the project does not depend on a third party staying up.
    static let mirrorRepo = "carloslfu/Qwen3.8-Flash-Next-MLX-4bit"
    static let mirrorRevision = "852ebf6fdeb104dd078abe01cd4237c8a4c684fc"

    struct File {
        let path: String
        let size: Int64
        let sha256: String?
    }

    static let files: [File] = [
        File(path: "LICENSE", size: 3235, sha256: nil),
        File(path: "README.md", size: 6139, sha256: nil),
        File(path: "chat_template.jinja", size: 8952, sha256: nil),
        File(path: "config.json", size: 33408, sha256: nil),
        File(path: "generation_config.json", size: 202, sha256: nil),
        File(path: "merges.txt", size: 3353259, sha256: nil),
        File(path: "model-00001.safetensors", size: 10039592993, sha256: "206c2e6ee138c902115f0686a43e0d56097518945bbcd6d3ab10bf916278f86c"),
        File(path: "model-00002.safetensors", size: 10000066971, sha256: "48f925c8652fd3210bd8593b41b9fbd66f02567e0e1e7abc28b75e2601f8af26"),
        File(path: "model-00003.safetensors", size: 10000066984, sha256: "cb0a951b9aed16ddad882a75c4c07b2615fa364db7c83cfcf7166dc481def85a"),
        File(path: "model-00004.safetensors", size: 10170248438, sha256: "f57df447a6acc2d16e69a66c708291d692f0f7476f74ab20aee3d2554c2896c8"),
        File(path: "model-00005.safetensors", size: 10194989755, sha256: "bc133543936364e026b413f1ab4b30f2847846d5a8cc1d201cadfd9396327320"),
        File(path: "model-00006.safetensors", size: 10262727991, sha256: "9231085f2723a8a3e26fc00836a789400527320ef8a6e219df6974ea4f8eee95"),
        File(path: "model-00007.safetensors", size: 10190937668, sha256: "03dffb750368b02fe517f2f1bfd7d5db69c419630801c3ffce88d8a6971046d5"),
        File(path: "model-00008.safetensors", size: 10231122683, sha256: "910401c0e420a50b901b170895e7a180c5908a45634be9c92903977ecaa14986"),
        File(path: "model-00009.safetensors", size: 10250305804, sha256: "0c77b22503b8e783cc345cd8afe63e007f9d0d0581cbda3f366250e38e096634"),
        File(path: "model-00010.safetensors", size: 10237786674, sha256: "115466ffb3e92a8e2a338d72395f7c32a176dadc791d2049ff9a8daadb347ed7"),
        File(path: "model-00011.safetensors", size: 2192353120, sha256: "9128a9cbf81cd25bc4cbebe8adeefa12fa36ee96fcccb6f5fe378343b45131f0"),
        File(path: "model.safetensors.index.json", size: 317973, sha256: nil),
        File(path: "preprocessor_config.json", size: 390, sha256: nil),
        File(path: "qwen4_exp.py", size: 35046, sha256: nil),
        File(path: "tokenizer.json", size: 12809320, sha256: "0997f410c57a1f4e53b09e4be8f4a172d90edd9564368fb0847030937229b9f3"),
        File(path: "tokenizer_config.json", size: 17928, sha256: nil),
        File(path: "video_preprocessor_config.json", size: 385, sha256: nil),
        File(path: "vocab.json", size: 6722759, sha256: nil),
    ]

    static var totalBytes: Int64 { files.reduce(0) { $0 + $1.size } }  // 103793508077 = 103.8 GB
}
