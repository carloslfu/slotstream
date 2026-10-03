import Foundation
import Slotstream
import SlotstreamDiagnostics

extension Catalogue {
    static func vqRecordProfile() throws -> CheckReport {
        var c = CheckBuilder("vq-record-profile")
        guard let url = Bundle.module.url(forResource: "vq-record-profile-v1", withExtension: "json") else {
            throw ModelError("missing VQ record fixture")
        }
        let data = try Data(contentsOf: url)
        let profile = try VQRecordProfile.load(data, alignment: 1)
        c.equal("exact pinned revision", profile.revision, "8684640a3956b01c47f5d47f9b999e2ab8b985f1")
        let expected = [2_611_200, 2_611_200] + Array(repeating: 1_280_000, count: 25)
            + Array(repeating: 1_382_400, count: 7) + [1_280_000, 1_382_400]
            + Array(repeating: 1_280_000, count: 11) + [1_382_400]
        c.equal("48 exact ordered record sizes", profile.recordBytesByLayer, expected)
        c.equal("one expert across 48 layers", profile.recordBytesByLayer.reduce(0, +), 65_024_000)
        c.equal("all expert payload", profile.allExpertPayloadBytes, 33_292_288_000)
        c.equal("shared books", profile.codebookBytes, 19_535_872)
        c.equal("early class layers", profile.earlyLayers.layers, 0..<2)
        c.equal("remaining class layers", profile.remainingLayers.layers, 2..<48)
        c.equal("early class payload", profile.earlyLayers.slotPayloadBytes, 2_611_200)
        c.equal("remaining class payload", profile.remainingLayers.slotPayloadBytes, 1_382_400)
        c.equal("early unpadded stride", profile.earlyLayers.slotStrideBytes, 2_611_200)
        c.equal("remaining unpadded stride", profile.remainingLayers.slotStrideBytes, 1_382_400)
        for layer in 0..<48 {
            let classes = [profile.earlyLayers, profile.remainingLayers].filter { $0.layers.contains(layer) }
            c.equal("layer \(layer) belongs to exactly one class", classes.count, 1)
            c.expect("layer \(layer) record fits its class", classes.first.map {
                expected[layer] <= $0.slotPayloadBytes && $0.slotPayloadBytes <= $0.slotStrideBytes
            } ?? false)
        }
        let ledger = try profile.ledger(earlyLayerSlots: 64, remainingLayerSlots: 640)
        c.equal("ledger early layers", ledger.earlyLayers.geometry.layers, 0..<2)
        c.equal("ledger remaining layers", ledger.remainingLayers.geometry.layers, 2..<48)
        c.equal("ledger early count", ledger.earlyLayers.slotCount, 64)
        c.equal("ledger remaining count", ledger.remainingLayers.slotCount, 640)
        c.equal("64 early slots", ledger.earlyLayers.poolAllocatedBytes, 167_116_800)
        c.equal("640 remaining slots", ledger.remainingLayers.poolAllocatedBytes, 884_736_000)
        c.equal("mixed class pool sum", ledger.poolAllocatedBytes, 1_051_852_800)
        c.equal("mixed class slot count", ledger.slotCount, 704)
        c.equal("ledger exact record sizes", ledger.actualRecordBytesByLayer, expected)
        c.equal("layer 2 actual bytes", ledger.actualRecordBytesByLayer[2], 1_280_000)
        c.equal("layer 2 charged stride", ledger.remainingLayers.geometry.slotStrideBytes, 1_382_400)
        c.equal("ledger shared books", ledger.sharedCodebookBytes, 19_535_872)
        c.equal("ledger all expert payload", ledger.allExpertPayloadBytes, 33_292_288_000)
        let empty = try profile.ledger(earlyLayerSlots: 0, remainingLayerSlots: 0)
        c.equal("empty early pool", empty.earlyLayers.poolAllocatedBytes, 0)
        c.equal("empty remaining pool", empty.remainingLayers.poolAllocatedBytes, 0)
        c.equal("empty total pool", empty.poolAllocatedBytes, 0)
        c.equal("empty total slot count", empty.slotCount, 0)
        let full = try profile.ledger(earlyLayerSlots: 1_024, remainingLayerSlots: 23_552)
        c.equal("all early expert slots", full.earlyLayers.slotCount, 1_024)
        c.equal("all remaining expert slots", full.remainingLayers.slotCount, 23_552)
        c.equal("full slot count", full.slotCount, 24_576)
        c.equal("full allocated pool", full.poolAllocatedBytes, 35_232_153_600)
        c.equal("early-only pool", try profile.ledger(earlyLayerSlots: 1, remainingLayerSlots: 0).poolAllocatedBytes, 2_611_200)
        c.equal("remaining-only pool", try profile.ledger(earlyLayerSlots: 0, remainingLayerSlots: 1).poolAllocatedBytes, 1_382_400)
        let aligned = try VQRecordProfile.load(data, alignment: 4096)
        c.equal("4096-aligned early stride", aligned.earlyLayers.slotStrideBytes, 2_613_248)
        c.equal("4096-aligned remaining stride", aligned.remainingLayers.slotStrideBytes, 1_384_448)
        let alignedLedger = try aligned.ledger(earlyLayerSlots: 64, remainingLayerSlots: 640)
        c.equal("4096-aligned remaining pool", alignedLedger.remainingLayers.poolAllocatedBytes, 886_046_720)
        c.equal("4096-aligned mixed pool", alignedLedger.poolAllocatedBytes, 1_053_294_592)
        c.equal("alignment preserves early payload", aligned.earlyLayers.slotPayloadBytes, 2_611_200)
        c.equal("alignment preserves remaining payload", aligned.remainingLayers.slotPayloadBytes, 1_382_400)
        c.equal("alignment preserves actual record sizes", aligned.recordBytesByLayer, expected)
        c.equal("legacy affine-4 record bytes", Geometry.recordBytes, 2_764_800.0)
        c.equal("legacy affine-4 640-slot GB", Geometry.gb(640), 1.769472)
        c.equal("legacy affine-4 floor slots", Geometry.slotsForPoolGB(1.769472), 640)
        // Pure byte arithmetic, not a measured pool or speed improvement.
        c.equal("same raw bytes hold twice as many remaining slots",
            1_769_472_000 / profile.remainingLayers.slotStrideBytes, 1_280)

        func rejects(_ label: String, reason: String, _ change: (inout [String: Any]) -> Void) throws {
            var object = try JSONSerialization.jsonObject(with: data) as! [String: Any]
            let original = try JSONSerialization.data(withJSONObject: object, options: [.sortedKeys])
            change(&object)
            let altered = try JSONSerialization.data(withJSONObject: object, options: [.sortedKeys])
            c.expect("\(label) changes the manifest", altered != original)
            do {
                _ = try VQRecordProfile.load(altered, alignment: 1)
                c.expect(label, false, "altered manifest was accepted")
            } catch let error as ModelError {
                c.expect(label, error.description.contains(reason), error.description)
            } catch {
                c.expect(label, false, "unexpected rejection: \(error)")
            }
        }
        try rejects("unsupported revision", reason: "unsupported VQ schema, model, or revision") { $0["revision"] = "unapproved" }
        try rejects("changed source receipt", reason: "source hashes differ") { object in
            var source = object["source"] as! [String: Any]
            source["indexSHA256"] = String(repeating: "0", count: 64)
            object["source"] = source
        }
        try rejects("orphan tensor", reason: "tensor set contains") { object in
            var tensors = object["tensors"] as! [[String: Any]]
            tensors[0]["name"] = "orphan.codebook"
            object["tensors"] = tensors
        }
        try rejects("wrong tensor bytes", reason: "declared byte count mismatch") { object in
            var tensors = object["tensors"] as! [[String: Any]]
            tensors[0]["byteCount"] = 1025
            object["tensors"] = tensors
        }
        try rejects("wrong expert dimension", reason: "unexpected shape or dtype") { object in
            var tensors = object["tensors"] as! [[String: Any]]
            let index = tensors.firstIndex { ($0["name"] as! String).hasSuffix(".codes") }!
            var shape = tensors[index]["shape"] as! [Int]
            shape[0] = 511
            tensors[index]["shape"] = shape
            object["tensors"] = tensors
        }
        try rejects("wrong codes dtype", reason: "unexpected shape or dtype") { object in
            var tensors = object["tensors"] as! [[String: Any]]
            let index = tensors.firstIndex { ($0["name"] as! String).hasSuffix(".codes") && $0["dtype"] as? String == "U8" }!
            tensors[index]["dtype"] = "U32"
            object["tensors"] = tensors
        }
        for suffix in [".vq_scales", ".codebook"] {
            try rejects("missing \(suffix)", reason: "144 modules and 432 tensors") { object in
                var tensors = object["tensors"] as! [[String: Any]]
                tensors.remove(at: tensors.firstIndex { ($0["name"] as! String).hasSuffix(suffix) }!)
                object["tensors"] = tensors
            }
        }
        try rejects("duplicate tensor", reason: "duplicate module or tensor name") { object in
            var tensors = object["tensors"] as! [[String: Any]]
            tensors[1] = tensors[0]
            object["tensors"] = tensors
        }
        try rejects("orphan VQ scale", reason: "tensor set contains") { object in
            var tensors = object["tensors"] as! [[String: Any]]
            let index = tensors.firstIndex { ($0["name"] as! String).hasSuffix(".vq_scales") }!
            tensors[index]["name"] = "model.layers.0.mlp.switch_mlp.orphan.vq_scales"
            object["tensors"] = tensors
        }
        try rejects("affine weight under VQ module", reason: "tensor set contains") { object in
            var tensors = object["tensors"] as! [[String: Any]]
            let index = tensors.firstIndex { ($0["name"] as! String).hasSuffix(".codes") }!
            tensors[index]["name"] = "model.layers.0.mlp.switch_mlp.down_proj.weight"
            object["tensors"] = tensors
        }
        try rejects("changed config receipt", reason: "source hashes differ") { object in
            var source = object["source"] as! [String: Any]
            source["configSHA256"] = String(repeating: "0", count: 64)
            object["source"] = source
        }
        try rejects("duplicate header hash", reason: "139 unique files and hashes") { object in
            var source = object["source"] as! [String: Any]
            var headers = source["headers"] as! [[String: Any]]
            headers[1]["sha256"] = headers[0]["sha256"]
            source["headers"] = headers
            object["source"] = source
        }
        try rejects("changed header hash with unchanged receipt label", reason: "frozen manifest fingerprint") { object in
            var source = object["source"] as! [String: Any]
            var headers = source["headers"] as! [[String: Any]]
            headers[0]["sha256"] = String(repeating: "f", count: 64)
            source["headers"] = headers
            object["source"] = source
        }
        try rejects("changed header file with unchanged receipt label", reason: "frozen manifest fingerprint") { object in
            var source = object["source"] as! [String: Any]
            var headers = source["headers"] as! [[String: Any]]
            headers[0]["file"] = "forged-header.safetensors"
            source["headers"] = headers
            object["source"] = source
        }
        try rejects("self-consistent cross-layer tuple swap", reason: "frozen manifest fingerprint") { object in
            let first = "model.layers.0.mlp.switch_mlp.gate_proj"
            let second = "model.layers.2.mlp.switch_mlp.gate_proj"
            var modules = object["modules"] as! [[String: Any]]
            let firstModule = modules.firstIndex { $0["name"] as? String == first }!
            let secondModule = modules.firstIndex { $0["name"] as? String == second }!
            for field in ["dim", "k", "group"] {
                let value = modules[firstModule][field]
                modules[firstModule][field] = modules[secondModule][field]
                modules[secondModule][field] = value
            }
            object["modules"] = modules
            var tensors = object["tensors"] as! [[String: Any]]
            for suffix in [".codes", ".vq_scales", ".codebook"] {
                let firstTensor = tensors.firstIndex { $0["name"] as? String == first + suffix }!
                let secondTensor = tensors.firstIndex { $0["name"] as? String == second + suffix }!
                for field in ["shape", "dtype", "byteCount"] {
                    let value = tensors[firstTensor][field]
                    tensors[firstTensor][field] = tensors[secondTensor][field]
                    tensors[secondTensor][field] = value
                }
            }
            object["tensors"] = tensors
        }
        try rejects("alternate expert geometry", reason: "alternate expert geometry") { object in
            var modules = object["modules"] as! [[String: Any]]
            modules[0]["input"] = 641
            object["modules"] = modules
        }
        for field in ["dim", "group"] {
            try rejects("alternate \(field)", reason: "alternate expert geometry") { object in
                var modules = object["modules"] as! [[String: Any]]
                modules[0][field] = 3
                object["modules"] = modules
            }
        }
        try rejects("unsupported codebook K", reason: "unsupported codebook tuple") { object in
            var modules = object["modules"] as! [[String: Any]]
            modules[0]["k"] = 1024
            object["modules"] = modules
        }
        try rejects("noncanonical layer spelling", reason: "noncanonical module") { object in
            var modules = object["modules"] as! [[String: Any]]
            let original = modules[0]["name"] as! String
            let renamed = original.replacingOccurrences(of: "model.layers.0.", with: "model.layers.00.")
            modules[0]["name"] = renamed
            object["modules"] = modules
            var tensors = object["tensors"] as! [[String: Any]]
            for index in tensors.indices where (tensors[index]["name"] as! String).hasPrefix(original + ".") {
                let name = tensors[index]["name"] as! String
                tensors[index]["name"] = renamed + name.dropFirst(original.count)
            }
            object["tensors"] = tensors
        }
        try rejects("mixed affine suffix", reason: "tensor set contains") { object in
            var tensors = object["tensors"] as! [[String: Any]]
            let old = tensors[2]["name"] as! String
            tensors[2]["name"] = old.replacingOccurrences(of: ".vq_scales", with: ".scales")
            object["tensors"] = tensors
        }
        try rejects("oversized tensor shape", reason: "unexpected shape or dtype") { object in
            var tensors = object["tensors"] as! [[String: Any]]
            tensors[0]["shape"] = [Int.max, Int.max]
            object["tensors"] = tensors
        }
        for (early, remaining, reason) in [(-1, 0, "early-layer"), (1_025, 0, "early-layer"),
            (Int.max, 0, "early-layer"), (0, -1, "remaining-layer"),
            (0, 23_553, "remaining-layer"), (0, Int.max, "remaining-layer")] {
            do {
                _ = try profile.ledger(earlyLayerSlots: early, remainingLayerSlots: remaining)
                c.expect("reject class counts \(early)/\(remaining)", false)
            } catch let error as ModelError {
                c.expect("reject class counts \(early)/\(remaining)",
                    error.description.contains("\(reason) slot count"), error.description)
            } catch {
                c.expect("reject class counts \(early)/\(remaining)", false, "unexpected rejection: \(error)")
            }
        }
        for alignment in [0, -1, 3, Int.max] {
            do { _ = try VQRecordProfile.load(data, alignment: alignment); c.expect("reject alignment \(alignment)", false) }
            catch { c.expect("reject alignment \(alignment)", true) }
        }
        let wide = try VQRecordProfile.load(data, alignment: 1 << 62)
        c.equal("large early alignment is valid", wide.earlyLayers.slotStrideBytes, 1 << 62)
        c.equal("large remaining alignment is valid", wide.remainingLayers.slotStrideBytes, 1 << 62)
        c.equal("large aligned empty pool is valid",
            try wide.ledger(earlyLayerSlots: 0, remainingLayerSlots: 0).poolAllocatedBytes, 0)
        for (early, remaining, reason) in [(2, 0, "early-layer slot pool: byte multiplication overflow"),
            (0, 2, "remaining-layer slot pool: byte multiplication overflow"),
            (1, 1, "slot pools: byte addition overflow")] {
            do {
                _ = try wide.ledger(earlyLayerSlots: early, remainingLayerSlots: remaining)
                c.expect("large aligned pool overflows \(early)/\(remaining)", false, "overflowing pool was accepted")
            } catch let error as ModelError {
                c.expect("large aligned pool overflows \(early)/\(remaining)",
                    error.description.contains(reason), error.description)
            } catch {
                c.expect("large aligned pool overflows \(early)/\(remaining)", false, "unexpected error: \(error)")
            }
        }
        return c.report()
    }
}
