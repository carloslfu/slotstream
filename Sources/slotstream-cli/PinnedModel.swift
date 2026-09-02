// GENERATED from the Hugging Face API for the pinned revision — do not hand-edit
// the upstream rows. Regenerate: curl the /tree/<revision>?recursive=true endpoint
// and rebuild this table. The one hand-added row is the MTP draft head at the
// end, which exists only on the mirror (see its comment).

import Foundation

/// The one model slotstream v0 runs, pinned to an exact upstream revision.
/// Every file carries the digest of the pinned revision. Small text files need
/// content integrity too: a same-size tokenizer or template change can alter
/// model semantics while still parsing successfully.
enum PinnedModel {
    static let name = "qwen3.8-flash-next:4bit"
    static let dirName = "qwen38-flash-next-mlx-4bit"
    static let repo = "pipenetwork/Qwen3.8-Flash-Next-MLX-4bit"
    static let revision = "aa7c790e804bbf9d491ddb109c3d61bc4a555f7c"
    /// Byte-identical mirror (same file sha256s) under the author's account,
    /// tried first so the project does not depend on a third party staying up.
    static let mirrorRepo = "carloslfu/Qwen3.8-Flash-Next-MLX-4bit"
    static let mirrorRevision = "e9d552f83de4665d243d5c9cf73201a1ca6c16d7"

    struct File {
        let path: String
        let size: Int64
        let sha256: String?
        /// An optional file is pinned like any other when present, but a
        /// source that does not carry it leaves the pull green and the
        /// startup manifest check quiet; the engine runs without it.
        var optional: Bool = false
    }

    static let files: [File] = [
        File(path: "LICENSE", size: 3235, sha256: "a0dc422560841fd68e06d974907f8b4c709bca44a67daad2b528437bdf676c08"),
        File(path: "README.md", size: 6139, sha256: "db1e0d8575543e7a8d324fd22afd2d596a002e9163ed1f971b6b8df0abbe65fd"),
        File(path: "chat_template.jinja", size: 8952, sha256: "c3cf9e34abf4f9e36c2d72165aa9c132d3e2a725b6c2586aaa3a8af9d7a81041"),
        File(path: "config.json", size: 33408, sha256: "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5"),
        File(path: "generation_config.json", size: 202, sha256: "e70c136c1b78ddc1fb0905bac8e733a4dc448d4f852a5dd75143fffc70be550e"),
        File(path: "merges.txt", size: 3353259, sha256: "a9d356d7bdf1ef4949e3e748e95b8e10ad9d4e2e838eddc38a0a7b6b94d1db8d"),
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
        File(path: "model.safetensors.index.json", size: 317973, sha256: "072cc2c60b8af6cce82a387f62e39ca88754c3a6fccae0816dd21bb89d27470d"),
        File(path: "preprocessor_config.json", size: 390, sha256: "27225450ac9c6529872ee1924fcb0962ff5634834f817040f444118116f4e516"),
        File(path: "qwen4_exp.py", size: 35046, sha256: "6fae4ec0decbf77ca4a4571de683bc5580ec75e84325ecb432dfcd2fc81df75e"),
        File(path: "tokenizer.json", size: 12809320, sha256: "0997f410c57a1f4e53b09e4be8f4a172d90edd9564368fb0847030937229b9f3"),
        File(path: "tokenizer_config.json", size: 17928, sha256: "b11349aafa7cdc6a320767cf7ceb29ed82f7eda5d65e8e0819e76f0ce947bf27"),
        File(path: "video_preprocessor_config.json", size: 385, sha256: "7768af27c1fafa9cc9011c1dc20067e03f8915e03b63504550e11d5066986d13"),
        File(path: "vocab.json", size: 6722759, sha256: "ce99b4cb2983d118806ce0a8b777a35b093e2000a503ebde25853284c9dfa003"),
        // The MTP draft head for speculative decode. The upstream conversion
        // drops the `mtp.*` tensors, so this file was converted from the
        // official Qwen/Qwen3.8-Flash-Next release by Tools/mtp_convert.py
        // (provenance in mtp.provenance.json next to it on the mirror) and is
        // hosted on the mirror only. Optional: without it, `--mtp auto` stays
        // off and everything else runs unchanged.
        File(path: "mtp.safetensors", size: 1470955171, sha256: "c80b58faae46eeacb94dea49dd3453566ee05597fbd28c7c647eccb2862ab744", optional: true),
    ]

    static var totalBytes: Int64 { files.reduce(0) { $0 + $1.size } }  // 105264463248 = 105.3 GB, head included
    static var requiredFiles: [File] { files.filter { !$0.optional } }
}
