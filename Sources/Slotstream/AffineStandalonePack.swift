import Foundation

/// Explicit research admission for the complete, same-parent export. The
/// independently produced completion manifest must also enter the compiled
/// research allowlist before loading. A caller-supplied digest is not artifact
/// admission. This type does not register a pack or make it available to Auto.
/// A file list or the manifest's `complete` flag alone never authenticates
/// tensor payloads: `open` transfers only fully verified file owners.
package struct AffineStandalonePack {
    package struct File: Codable, Equatable, Sendable {
        package let path: String
        package let size: Int
        package let sha256: String
        package let optional: Bool
        package init(path: String, size: Int, sha256: String, optional: Bool = false) {
            self.path = path; self.size = size; self.sha256 = sha256; self.optional = optional
        }
    }
    private struct Manifest: Decodable {
        let schema: Int, kind: String, complete: Bool, qualification: Bool
        let identity: [String: String], files: [File], file_bytes: Int
    }
    private struct Index: Decodable { let weight_map: [String: String] }
    private struct Control: Decodable {
        struct File: Decodable { let path: String, size: Int, sha256: String }
        let files: [File]
    }

    package static let manifestName = "standalone-manifest.json"
    /// Complete export and independent whole-file audit, October 5, 2026.
    /// This exact digest admits research execution only; product quality,
    /// performance and supported-pack qualification remain separate gates.
    /// Do not replace this with caller or manifest authority.
    package static let admittedManifestSHA256: String? =
        "8f8c9a58558828a76d8eb6d40299ac472380adb456790f4f82330bdf5dc352d5"
    package static let fileBytes = 90_232_537_746
    package static let retainedNames = (1...11).map { String(format: "retained-%05d.safetensors", $0) }
    package static let expertNames = (0..<48).map { String(format: "experts-%02d.safetensors", $0) }
    /// Pinned generated metadata comes from the reviewed, complete header
    /// plan. It is independent of a caller-supplied completion manifest.
    package static let generatedFiles = [
        File(path: "config.json", size: 61_093,
             sha256: "34769d0c76cbb19d8a10e7a2fc2ee9b30eff6ff77256fdd081930b2b4e08c5c6"),
        File(path: "model.safetensors.index.json", size: 325_890,
             sha256: "2d5e53bf1dff15e4c4add887a44f6a2cf0ab2de4da1dde30c279dcb12f6f722e"),
        File(path: "README.md", size: 1494,
             sha256: "53c698a78f79327a213eb21ef30211ef53cb391687a5b2a2ee1540da2acd6161"),
        File(path: "expert-control-manifest.json", size: 76_350,
             sha256: AffineExpertControl.manifestSHA256),
        File(path: "angles-f32le.bin", size: 67_108_864,
             sha256: VQRotaryCoefficients.sha256),
    ]
    package static var companionFiles: [File] {
        let renamed = ["config.json": "parent-config.json",
            "model.safetensors.index.json": "parent-model.safetensors.index.json",
            "README.md": "PARENT-README.md"]
        return PinnedModel.files.filter { !($0.path.hasPrefix("model-") && $0.path.hasSuffix(".safetensors")) }
            .map { File(path: renamed[$0.path] ?? $0.path, size: Int($0.size), sha256: $0.sha256 ?? "",
                        optional: $0.optional) } + generatedFiles
    }
    package static var expectedIdentity: [String: String] {
        func hash(_ path: String) -> String { PinnedModel.files.first { $0.path == path }?.sha256 ?? "" }
        return ["format": "qwen-flash-next-affine3-experts-v1", "parent_revision": PinnedModel.revision,
            "parent_config_sha256": hash("config.json"), "parent_index_sha256": hash("model.safetensors.index.json"),
            "expert_control_manifest_sha256": AffineExpertControl.manifestSHA256,
            "conversion_policy": AffineExpertControl.policy, "rotary_sha256": VQRotaryCoefficients.sha256,
            "license_sha256": hash("LICENSE"), "tokenizer_sha256": hash("tokenizer.json"),
            "template_sha256": hash("chat_template.jinja"), "draft_sha256": VQDraftWeights.fileSHA256]
    }

    package let directory: URL
    package let manifestSHA256: String
    package let files: [String: File]

    private static func validSHA(_ value: String) -> Bool {
        value.utf8.count == 64 && value.utf8.allSatisfy { (48...57).contains($0) || (97...102).contains($0) }
    }

    /// Metadata admission is CPU-only and bounded. All later reads use these
    /// captured file pins, never a reopened or mutable manifest.
    package init(directory: URL, manifestSHA256: String) throws {
        guard let admitted = Self.admittedManifestSHA256, manifestSHA256 == admitted else {
            throw ModelError("standalone export is not in the compiled research allowlist")
        }
        self.files = try Self.readMetadata(directory: directory, manifestSHA256: manifestSHA256)
        self.directory = directory.resolvingSymlinksInPath(); self.manifestSHA256 = manifestSHA256
    }

    /// Inspection cannot construct a model-loading capability. Keeping it
    /// separate permits bounded malformed-file tests before a real exported
    /// artifact has earned a compiled research identity.
    package static func readMetadata(directory: URL, manifestSHA256: String) throws -> [String: File] {
        guard directory.isFileURL, Self.validSHA(manifestSHA256) else {
            throw ModelError("standalone research loading requires an explicit complete manifest digest")
        }
        let directory = directory.resolvingSymlinksInPath()
        let raw = try AffineExpertControl.bounded(directory.appendingPathComponent(Self.manifestName),
            maximum: 4_000_000, sha256: manifestSHA256)
        let manifest = try JSONDecoder().decode(Manifest.self, from: raw)
        guard manifest.schema == 1, manifest.kind == "standalone-research-bundle-v1",
              manifest.complete, !manifest.qualification, manifest.identity == Self.expectedIdentity,
              manifest.file_bytes == Self.fileBytes, manifest.files.count == 78 else {
            throw ModelError("standalone manifest differs from the inspected complete same-parent export")
        }
        let required = Set(Self.retainedNames + Self.expertNames + Self.companionFiles.map(\.path))
        guard required.count == 78 else { throw ModelError("compiled standalone file coverage changed") }
        var files: [String: File] = [:], total = 0
        for file in manifest.files {
            guard required.contains(file.path), files[file.path] == nil, Self.validSHA(file.sha256),
                  file.size > 0, file.size <= Self.fileBytes else {
                throw ModelError("standalone file identity, namespace or extent changed")
            }
            total = try QuantizationBytes.sum(total, file.size)
            files[file.path] = file
        }
        guard total == Self.fileBytes, Set(files.keys) == required,
              Self.companionFiles.allSatisfy({ files[$0.path] == $0 }),
              (Self.retainedNames + Self.expertNames).allSatisfy({ files[$0]?.optional == false }) else {
            throw ModelError("standalone file coverage, component pins or complete byte ledger changed")
        }
        return files
    }

    private func metadata(_ name: String) throws -> Data {
        guard let file = files[name], file.size <= 4_000_000 else {
            throw ModelError("standalone metadata lacks its bounded identity")
        }
        let raw = try AffineExpertControl.bounded(directory.appendingPathComponent(name),
            maximum: file.size, sha256: file.sha256)
        guard raw.count == file.size else { throw ModelError("standalone metadata extent changed") }
        return raw
    }

    package func open(authenticationLanes: Int = AuthenticatedTensorBatch.maximumLanes,
                      shouldContinue: () -> Bool = { true }) throws -> CheckpointIndex {
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        // Retain the already-qualified parent parser. The generated mixed
        // config is independently pinned above, but cannot broaden public
        // ModelConfig/CheckpointIndex admission or configure the draft head.
        let parent = try ModelConfig.parse(metadata("parent-config.json"), label: "standalone pinned parent configuration")
        _ = try metadata("config.json")
        _ = try metadata("parent-model.safetensors.index.json")
        let index = try JSONDecoder().decode(Index.self, from: metadata("model.safetensors.index.json")).weight_map
        let control = try JSONDecoder().decode(Control.self, from: metadata("expert-control-manifest.json"))
        guard control.files.count == 48, Set(control.files.map(\.path)) == Set(Self.expertNames),
              control.files.allSatisfy({ files[$0.path] == File(path: $0.path, size: $0.size, sha256: $0.sha256) }),
              index.count == 3215, Set(index.values) == Set(Self.retainedNames + Self.expertNames) else {
            throw ModelError("standalone expert identity or tensor coverage changed")
        }
        let names = (Self.retainedNames + Self.expertNames).sorted()
        let inputs = names.map { name -> AuthenticatedTensorBatch.Input in
            let pin = files[name]!
            return .init(url: directory.appendingPathComponent(name), bytes: pin.size, sha256: pin.sha256)
        }
        let opened = try AuthenticatedTensorBatch.open(inputs, lanes: authenticationLanes, shouldContinue: shouldContinue)
        var owners: [URL: VQTensorFile] = [:], tensors: [String: TensorRef] = [:]
        for (name, owner) in zip(names, opened) {
            guard shouldContinue() else { throw CheckpointReadError.cancelled }
            guard Set(owner.tensors.keys) == Set(index.filter { $0.value == name }.keys) else {
                throw ModelError("standalone shard differs from its complete pinned tensor index")
            }
            owners[directory.appendingPathComponent(name)] = owner
            for (key, ref) in owner.tensors {
                let normalized = key.hasPrefix("language_model.") ? String(key.dropFirst("language_model.".count)) : key
                guard tensors[normalized] == nil else { throw ModelError("duplicate standalone tensor identity") }
                tensors[normalized] = ref
            }
        }
        // Main routed experts have their own three-bit recipe. Every other
        // file is authenticated from the caller's frozen whole-pack manifest.
        for layer in 0..<48 {
            for (projection, rows, columns) in [("gate_proj", 640, 2560), ("up_proj", 640, 2560), ("down_proj", 2560, 640)] {
                for suffix in ["weight", "scales", "biases"] {
                    let name = "model.layers.\(layer).mlp.switch_mlp.\(projection).\(suffix)"
                    guard let ref = tensors[name],
                          ref.shape == [512, rows, suffix == "weight" ? columns * 3 / 32 : columns / 64],
                          ref.dtype == (suffix == "weight" ? "U32" : "BF16"),
                          ref.file.lastPathComponent == Self.expertNames[layer] else {
                        throw ModelError("standalone routed expert geometry or ownership changed")
                    }
                }
            }
        }
        for owner in owners.values { try owner.verifyUnchanged() }
        guard shouldContinue() else { throw CheckpointReadError.cancelled }
        return try CheckpointIndex(authenticatedDirectory: directory, config: parent.withAffineExpertControl(),
            files: owners, tensors: tensors, affineExpertArtifact: .minmax, authenticatedStorageIdentity: manifestSHA256)
    }
}
