// Vision commands: the tower's own gates.
//
// `vision-parity` is the one that matters. The tower is 27 blocks of matrix
// algebra whose failure mode is silence — a wrong rotary layout, a merger norm
// applied after the shuffle instead of before, a transposed weight, and the
// model still answers fluently, about the wrong picture. Nothing downstream
// notices. So the embeddings are compared against an independent
// implementation in Python, the same discipline `Tools/parity_ref.py` applies
// to the language model.
//
// Neither command loads the 105 GB trunk or the expert pool: the tower is 333
// tensors and 0.9 GB, and `VisionTower` reads only those.

import ArgumentParser
import CoreGraphics
import Foundation
import MLX
import Slotstream

/// Dump one image's tower input and output for `Tools/vision_ref.py`.
struct VisionParity: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "vision-parity",
        abstract: "Dump the vision tower's pixel input and embedding output for the Python oracle")

    @OptionGroup var model: ModelOptions
    @Option(help: "Image to encode (default: Tools/assets/vision_test/secret1.jpg)")
    var image: String?
    @Option(help: "Directory to write pixels.bin, embed.bin and manifest.json into")
    var out: String = ".build/vision-parity"

    func run() throws {
        let path = try VisionAssets.resolve(image)
        let index = try CheckpointIndex(dir: model.modelURL)
        guard VisionTower.present(index: index) else {
            throw PlanError("this checkpoint has no vision tower")
        }
        let bytes = Double(VisionTower.residentBytes(index: index)) / 1e9
        FileHandle.standardError.write(
            String(format: "loading the vision tower (%.3f GB resident)\n", bytes)
                .data(using: .utf8)!)
        let tower = try VisionTower(index: index)
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let cg = try VisionPreprocess.decodeCGImage(data)
        let plan = try tower.plan(for: cg)

        // The same two steps `encode` runs, kept apart so the exact pixel
        // tensor the tower saw is what the oracle is given. Otherwise a
        // preprocessing difference would read as a tower difference.
        let chw = VisionPreprocess.resizeAndNormalize(
            cg: cg, targetH: plan.height, targetW: plan.width)
        let pixels = VisionPreprocess.buildPixelValues(
            chw: chw, h: plan.height, w: plan.width, patch: UInt32(tower.vcfg.patchSize),
            merge: UInt32(tower.vcfg.spatialMergeSize), tps: UInt32(tower.vcfg.temporalPatchSize))
        let feat = 3 * tower.vcfg.temporalPatchSize * tower.vcfg.patchSize * tower.vcfg.patchSize
        let pv = MLXArray(pixels, [plan.patches, feat])
        let embed = tower.forward(pixelValues: pv, gridH: plan.gridH, gridW: plan.gridW)
        eval(embed)

        let dir = URL(fileURLWithPath: out)
        try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
        func write(_ name: String, _ values: [Float]) throws {
            try values.withUnsafeBufferPointer { Data(buffer: $0) }
                .write(to: dir.appendingPathComponent(name))
        }
        try write("pixels.bin", pixels)
        try write("embed.bin", embed.asType(.float32).asArray(Float.self))
        let manifest: [String: Any] = [
            "image": path,
            "model_dir": model.modelURL.path,
            "height": Int(plan.height), "width": Int(plan.width),
            "grid_h": Int(plan.gridH), "grid_w": Int(plan.gridW),
            "patches": plan.patches, "merged_tokens": plan.mergedTokens,
            "features_per_patch": feat,
            "hidden_size": tower.vcfg.hiddenSize,
            "out_hidden_size": tower.vcfg.outHiddenSize,
            "depth": tower.vcfg.depth, "num_heads": tower.vcfg.numHeads,
            "resident_gb": bytes,
        ]
        try JSONSerialization.data(withJSONObject: manifest, options: [.prettyPrinted, .sortedKeys])
            .write(to: dir.appendingPathComponent("manifest.json"))
        print(
            "wrote \(plan.patches) patches -> \(plan.mergedTokens) tokens "
                + "(\(plan.width)x\(plan.height), grid \(plan.gridW)x\(plan.gridH)) to \(out)")
    }
}

/// Where the repo's small test images are, from wherever a tool was run.
enum VisionAssets {
    static let relative = "Tools/assets/vision_test"

    static func resolve(_ forced: String?) throws -> String {
        if let forced {
            guard FileManager.default.fileExists(atPath: forced) else {
                throw PlanError("no image at \(forced)")
            }
            return forced
        }
        guard let found = first("secret1.jpg") else {
            throw PlanError(
                "no \(relative)/secret1.jpg in reach — run from the repository or pass --image")
        }
        return found
    }

    /// The named asset, searched from the working directory upward, so a tool
    /// run from `.build` or a subdirectory still finds it.
    static func first(_ name: String) -> String? {
        for base in [".", "..", "../..", "../../.."] {
            let p = "\(base)/\(relative)/\(name)"
            if FileManager.default.fileExists(atPath: p) { return p }
        }
        return nil
    }
}
