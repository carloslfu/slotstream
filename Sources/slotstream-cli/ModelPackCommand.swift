import ArgumentParser
import Foundation
import Slotstream

struct ModelPackCommand: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "model-packs",
        abstract: "Inspect maintained quantizations and Auto selection without loading or downloading weights")
    @Option(name: .long, help: "auto or an immutable supported pack ID") var selection = "auto"
    @Flag(name: .long, help: "Print machine-readable identities and qualification status") var json = false
    func run() throws {
        let decision = try ModelPackRegistry.resolve(selection == "auto" ? .automatic : .pack(selection))
        if json {
            let rows: [[String: Any]] = ModelPackRegistry.supported.map { pack in
                ["id": pack.id, "title": pack.title, "manifest_sha256": pack.manifestDigest,
                 "checkpoint_revision": pack.checkpointRevision, "conversion_revision": pack.conversionRevision,
                 "layout": pack.layout, "compatibility": pack.compatibility,
                 "required_bytes": pack.requiredBytes, "total_bytes": pack.totalBytes,
                 "qualified_automatic_profiles": pack.qualifiedAutomaticProfiles,
                 "support_evidence": pack.supportEvidence]
            }
            let data = try JSONSerialization.data(withJSONObject: ["schema": 1, "packs": rows,
                "selected": decision.pack.id, "automatic": decision.automatic, "reason": decision.reason],
                options: [.prettyPrinted, .sortedKeys])
            print(String(decoding: data, as: UTF8.self))
        } else {
            print("Selected: \(decision.pack.title) (\(decision.pack.id))")
            print(decision.reason)
            print("This lists supported packs; it does not certify a generation-speed target.")
        }
    }
}
