import Foundation
import Slotstream

extension Diagnostics {
    /// Tiny metadata fixtures only. Their placeholder tensor hashes cannot
    /// load a model. Real standalone payload, arithmetic and Engine acceptance
    /// require the separately frozen complete export and physical checks.
    public static func affineStandaloneMetadata() throws -> CheckReport {
        var c = CheckBuilder("affine-standalone-metadata")
        let directory = FileManager.default.temporaryDirectory.appendingPathComponent("standalone-" + UUID().uuidString)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: false)
        defer { try? FileManager.default.removeItem(at: directory) }
        let path = directory.appendingPathComponent(AffineStandalonePack.manifestName)
        let retained = [7_208_435_256, 10_000_066_976, 10_000_066_984, 5_975_940_800,
            285_936_984, 353_675_168, 281_884_896, 322_069_784, 341_252_960, 328_733_960, 724_345_128]
        let placeholder = String(repeating: "0", count: 64)
        var pins = zip(AffineStandalonePack.retainedNames, retained).map {
            AffineStandalonePack.File(path: $0.0, size: $0.1, sha256: placeholder)
        }
        pins += AffineStandalonePack.expertNames.enumerated().map {
            .init(path: $0.element, size: $0.offset < 10 ? 1_101_006_056 : 1_101_006_064, sha256: placeholder)
        }
        pins += AffineStandalonePack.companionFiles
        let files = try JSONSerialization.jsonObject(with: JSONEncoder().encode(pins)) as! [[String: Any]]
        let root: [String: Any] = ["schema": 1, "kind": "standalone-research-bundle-v1", "complete": true,
            "qualification": false, "identity": AffineStandalonePack.expectedIdentity,
            "file_bytes": 90_232_537_746, "files": files, "reconstruction": []]
        func write(_ value: [String: Any]) throws -> String {
            let raw = try JSONSerialization.data(withJSONObject: value, options: [.sortedKeys])
            try raw.write(to: path, options: .atomic)
            return AffineExpertControl.digest(raw)
        }
        let sha = try write(root)
        let captured = try AffineStandalonePack.readMetadata(directory: directory, manifestSHA256: sha)
        c.equal("complete metadata owns exactly the standalone file namespace", captured.count, 78)
        c.equal("full planned bytes include unchanged draft and preprocessing", captured.values.reduce(0) { $0 + $1.size }, 90_232_537_746)
        c.expect("no original model shard is needed", captured.keys.allSatisfy { !$0.hasPrefix("model-") })
        c.equal("tokenizer vision and draft select the preserved parent config", PinnedParentLayout.standalone.configurationName, "parent-config.json")
        c.equal("existing overlay configuration name is unchanged", PinnedParentLayout.original.configurationName, "config.json")
        let arithmetic = AffineExpertControl.Artifact.minmax.arithmeticIdentity(
            rotarySHA256: VQRotaryCoefficients.sha256, piecewise: true, grouped: true)
        let exported = AffineExpertControl.Artifact.minmax.arithmeticIdentity(
            rotarySHA256: VQRotaryCoefficients.sha256, piecewise: true, grouped: true, storageSHA256: sha)
        c.equal("standalone cache identity retains arithmetic and binds the entire export", exported, arithmetic + ":standalone:" + sha)
        c.expect("another standalone manifest cannot reuse the same prefix identity", exported !=
            AffineExpertControl.Artifact.minmax.arithmeticIdentity(rotarySHA256: VQRotaryCoefficients.sha256,
                piecewise: true, grouped: true, storageSHA256: placeholder))
        do {
            _ = try AffineStandalonePack(directory: directory, manifestSHA256: sha)
            c.expect("a self-pinned complete manifest cannot grant research model admission", false)
        } catch { c.expect("a self-pinned complete manifest cannot grant research model admission",
            String(describing: error).contains("allowlist")) }

        var invalid = [[String: Any]]()
        for (key, value): (String, Any) in [("schema", true), ("schema", 2), ("complete", false),
            ("qualification", true), ("kind", "untrusted-format"), ("file_bytes", 90_232_537_745)] {
            var copy = root; copy[key] = value; invalid.append(copy)
        }
        var alteredIdentity = AffineStandalonePack.expectedIdentity
        alteredIdentity["conversion_policy"] = "BF16-conversion"
        var altered = root; altered["identity"] = alteredIdentity; invalid.append(altered)
        for edit: (inout [[String: Any]]) -> Void in [
            { $0.removeLast() }, { $0.append($0[0]) },
            { $0[0]["path"] = "../retained-00001.safetensors" },
            { $0[0]["path"] = "RETAINED-00001.safetensors" },
            { $0[0]["sha256"] = "not-a-digest" }, { $0[0]["size"] = Int.max },
            { $0[0]["size"] = true }, { $0[0]["optional"] = true },
            { rows in let i = rows.firstIndex { $0["path"] as? String == "parent-config.json" }!; rows[i]["sha256"] = placeholder },
            { rows in let i = rows.firstIndex { $0["path"] as? String == "mtp.safetensors" }!; rows[i]["optional"] = false },
            { rows in let i = rows.firstIndex { $0["path"] as? String == "config.json" }!; rows[i]["size"] = 33_408 },
        ] {
            var changed = files; edit(&changed)
            var copy = root; copy["files"] = changed; invalid.append(copy)
        }
        for (index, value) in invalid.enumerated() {
            let changedSHA = try write(value)
            do {
                _ = try AffineStandalonePack.readMetadata(directory: directory, manifestSHA256: changedSHA)
                c.expect("malformed standalone manifest \(index) refused before allocation", false)
            } catch { c.expect("malformed standalone manifest \(index) refused before allocation", true) }
        }
        _ = try write(root)
        for wrong in ["", "../digest", String(repeating: "F", count: 64), String(repeating: "a", count: 64)] {
            do {
                _ = try AffineStandalonePack.readMetadata(directory: directory, manifestSHA256: wrong)
                c.expect("an absent malformed or mismatched trust anchor is refused", false)
            } catch { c.expect("an absent malformed or mismatched trust anchor is refused", true) }
        }
        // Captured pins survive a path change; no loader may reopen a new
        // manifest and accept it merely because its shape is compatible.
        try Data("{}".utf8).write(to: path, options: .atomic)
        c.equal("captured file identities survive manifest path mutation", captured.count, 78)
        do {
            _ = try AffineStandalonePack.readMetadata(directory: directory, manifestSHA256: sha)
            c.expect("a changed manifest is refused on a fresh admission", false)
        } catch { c.expect("a changed manifest is refused on a fresh admission", true) }
        _ = try write(root)
        let moved = directory.appendingPathComponent("saved-manifest.json")
        try FileManager.default.moveItem(at: path, to: moved)
        try FileManager.default.createSymbolicLink(at: path, withDestinationURL: moved)
        do {
            _ = try AffineStandalonePack.readMetadata(directory: directory, manifestSHA256: sha)
            c.expect("manifest leaf symlinks cannot replace a regular captured file", false)
        } catch { c.expect("manifest leaf symlinks cannot replace a regular captured file", true) }
        try FileManager.default.removeItem(at: path)
        try Data(repeating: 32, count: 4_000_001).write(to: path)
        do {
            _ = try AffineStandalonePack.readMetadata(directory: directory, manifestSHA256: sha)
            c.expect("metadata byte bound applies before parsing", false)
        } catch { c.expect("metadata byte bound applies before parsing", true) }
        c.expect("research manifest admission cannot register a supported model", ModelPackRegistry.supported.count == 1)
        return c.report()
    }
}
