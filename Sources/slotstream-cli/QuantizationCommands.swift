import ArgumentParser
import Foundation
import Slotstream
import SlotstreamDiagnostics

struct QuantizationGenerationCheck: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "quantization-generation-check",
        abstract: "Check bounded candidate speculative generation without activating a pack")
    @Option(name: .long) var sourceDirectory: String
    @Option(name: .long) var sourceInventory: String
    @Option(name: .long) var denseOverlayBaseline: String
    @Option(name: .long) var denseOverlayManifest: String
    @Option(name: .long) var generationProfile: String
    @Option(name: .long) var output: String
    func run() throws {
        print(String(decoding: try Diagnostics.quantizationSpeculation(
            source: URL(fileURLWithPath: sourceDirectory), inventory: URL(fileURLWithPath: sourceInventory),
            baseline: URL(fileURLWithPath: denseOverlayBaseline), composite: URL(fileURLWithPath: denseOverlayManifest),
            profile: URL(fileURLWithPath: generationProfile), output: URL(fileURLWithPath: output)), as: UTF8.self))
    }
}

struct QuantizationStateCheck: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "quantization-state-check",
        abstract: "Check bounded candidate state recording and recovery without activating a pack")
    @Option(name: .long) var sourceDirectory: String
    @Option(name: .long) var sourceInventory: String
    @Option(name: .long) var output: String
    @Option(name: .long) var denseOverlayBaseline: String?
    @Option(name: .long) var denseOverlayManifest: String?
    @Flag(name: .long, help: "Cross the sparse-attention threshold within the recorded pass")
    var sparseBoundary = false
    func validate() throws {
        guard (denseOverlayBaseline == nil) == (denseOverlayManifest == nil) else {
            throw ValidationError("dense composite requires both baseline and manifest")
        }
    }
    func run() throws {
        print(String(decoding: try Diagnostics.quantizationState(source: URL(fileURLWithPath: sourceDirectory),
            inventory: URL(fileURLWithPath: sourceInventory), output: URL(fileURLWithPath: output),
            denseOverlayBaseline: denseOverlayBaseline.map { URL(fileURLWithPath: $0) },
            denseOverlayManifest: denseOverlayManifest.map { URL(fileURLWithPath: $0) },
            sparseBoundary: sparseBoundary), as: UTF8.self))
    }
}

struct QuantizationCheck: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "quantization-check",
        abstract: "Check candidate layout and native decoding; does not enable or qualify a new model pack")
    @Option(name: .long, help: "Pinned row fixtures from Tools/quantization_fixture.py")
    var fixtureDirectory: String?
    @Option(name: .long, help: "Pinned fused binding fixtures from Tools/vq_fused_reference.py")
    var fusedFixtureDirectory: String?
    @Option(name: .long, help: "Complete real expert records from Tools/vq_record_reference.py")
    var recordFixtureDirectory: String?
    @Option(name: .long, help: "Pinned large-prefill expert fixtures from Tools/vq_prefill_reference.py")
    var prefillFixtureDirectory: String?
    @Option(name: .long, help: "Corrected dense-block reference fixture from Tools/vq_trunk_reference.py")
    var trunkFixtureDirectory: String?
    @Option(name: .long, help: "Research-only pinned VQ download to check against record and/or row fixtures")
    var sourceDirectory: String?
    @Option(name: .long, help: "Exact inspected inventory.json for the research VQ download")
    var sourceInventory: String?
    @Flag(name: .long, help: "Check synthetic native VQ and affine kernels")
    var kernels = false
    func validate() throws {
        guard (sourceDirectory == nil) == (sourceInventory == nil) else {
            throw ValidationError("--source-directory and --source-inventory must be provided together")
        }
        if sourceDirectory != nil {
            guard recordFixtureDirectory != nil || fixtureDirectory != nil,
                  fusedFixtureDirectory == nil, trunkFixtureDirectory == nil, prefillFixtureDirectory == nil, !kernels else {
                throw ValidationError("direct source checks require record and/or row fixtures only")
            }
        }
    }
    func run() throws {
        let source = sourceDirectory.map { URL(fileURLWithPath: $0) }
        let inventory = sourceInventory.map { URL(fileURLWithPath: $0) }
        var reports = [try Diagnostics.quantizationGeometry(), try Diagnostics.quantizationMetadata(),
                       try Diagnostics.quantizationReadBatch(),
                       try Diagnostics.quantizationPLEStorage(), try Diagnostics.quantizationTensorFile()]
        if kernels {
            reports.append(try Diagnostics.quantizationKernels())
            reports.append(try Diagnostics.quantizationCandidateArithmetic())
        }
        if let fixtureDirectory {
            reports.append(try Diagnostics.quantizationFixtures(directory: URL(fileURLWithPath: fixtureDirectory),
                                                               sourceDirectory: source, inventory: inventory))
        }
        if let fusedFixtureDirectory {
            reports.append(try Diagnostics.quantizationFixtures(directory: URL(fileURLWithPath: fusedFixtureDirectory), fused: true))
        }
        if let recordFixtureDirectory {
            reports.append(try Diagnostics.quantizationRecords(directory: URL(fileURLWithPath: recordFixtureDirectory),
                                                              sourceDirectory: source, inventory: inventory))
        }
        if let prefillFixtureDirectory {
            reports.append(try Diagnostics.quantizationRecords(directory: URL(fileURLWithPath: prefillFixtureDirectory), prefill: true))
        }
        if let trunkFixtureDirectory {
            reports.append(try Diagnostics.quantizationTrunk(directory: URL(fileURLWithPath: trunkFixtureDirectory)))
        }
        let encoder = JSONEncoder(); encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        print(String(decoding: try encoder.encode(reports), as: UTF8.self))
        guard reports.allSatisfy(\.passed) else { throw ExitCode.failure }
    }
}

struct QuantizationModelCheck: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "quantization-model-check",
        abstract: "Check research VQ complete-stack parity; does not enable a candidate pack")
    @Option(name: .long) var sourceDirectory: String
    @Option(name: .long) var sourceInventory: String
    @Option(name: .long) var fixtureDirectory: String
    @Option(name: .long) var output: String
    @Flag(name: .long, help: "Use the fixed 512-row complete-prefill hash fixture") var prefill = false
    @Flag(name: .long, help: "Check the fixed 2053-token sparse-selection and continuation profile") var sparse = false
    @Flag(name: .long, help: "Use fixed 96-record allocation classes in the experimental parity probe") var residentRecords = false
    @Flag(name: .long, help: "Retain the authenticated text weights in the 10 GB research probe") var residentText = false
    @Flag(name: .long, help: "Research with 512 rows for the main expert class; requires both residency flags") var wideRecords = false
    @Flag(name: .long, help: "Overlap bounded demanded reads; requires resident records and text") var parallelRecords = false
    @Flag(name: .long, help: "Research only: reinvest composite dense savings in 1536/288 expert banks inside the same process bound") var reinvestDenseSavings = false
    @Flag(name: .long, help: "Research only: uncached random reads on authenticated expert-containing shards; requires reinvested composite") var uncachedExpertReads = false
    @Option(name: .long, help: "Research only: pinned lossless aligned expert records; requires reinvested composite and buffered reads") var packedRecordDirectory: String?
    @Flag(name: .long, help: "Compare actual greedy generation and every retained state boundary") var greedy = false
    @Option(name: .long, help: "Frozen bench/quantization/greedy-v1.json, required with --greedy") var generationProfile: String?
    @Option(name: .long, help: "Research composite only: pinned installed affine baseline; requires a prefill, sparse or greedy profile and --dense-overlay-manifest") var denseOverlayBaseline: String?
    @Option(name: .long, help: "Research composite only: exact independently frozen tensor map") var denseOverlayManifest: String?
    func validate() throws {
        guard (denseOverlayBaseline == nil) == (denseOverlayManifest == nil), denseOverlayBaseline == nil || prefill || sparse || greedy else {
            throw ValidationError("--dense-overlay-baseline and --dense-overlay-manifest require each other and --prefill, --sparse or --greedy")
        }
        guard packedRecordDirectory == nil || (reinvestDenseSavings && !uncachedExpertReads) else {
            throw ValidationError("--packed-record-directory requires reinvested banks and buffered reads")
        }
        guard !uncachedExpertReads || reinvestDenseSavings else {
            throw ValidationError("--uncached-expert-reads requires --reinvest-dense-savings")
        }
        guard !reinvestDenseSavings || (denseOverlayBaseline != nil && wideRecords && parallelRecords && residentRecords && residentText && (greedy || sparse)) else {
            throw ValidationError("--reinvest-dense-savings requires the composite, wide parallel residency, and --greedy or --sparse")
        }
        guard [prefill, sparse, greedy].filter({ $0 }).count <= 1, greedy == (generationProfile != nil),
              (!residentRecords && !residentText) || sparse || greedy,
              (!wideRecords && !parallelRecords) || (residentRecords && residentText) else {
            throw ValidationError("--prefill, --sparse and --greedy are exclusive; --greedy requires --generation-profile; --resident-records/--resident-text require --sparse or --greedy; --wide-records/--parallel-records require both residency flags")
        }
    }
    func run() throws {
        if greedy, let generationProfile {
            print(String(decoding: try Diagnostics.quantizationGeneration(source: URL(fileURLWithPath: sourceDirectory),
                inventory: URL(fileURLWithPath: sourceInventory), profileURL: URL(fileURLWithPath: generationProfile),
                fixtureDirectory: URL(fileURLWithPath: fixtureDirectory), output: URL(fileURLWithPath: output), residentRecords: residentRecords, residentText: residentText, wideRecords: wideRecords, parallelRecords: parallelRecords,
                denseOverlayBaseline: denseOverlayBaseline.map { URL(fileURLWithPath: $0) },
                denseOverlayManifest: denseOverlayManifest.map { URL(fileURLWithPath: $0) }, reinvestDenseSavings: reinvestDenseSavings, uncachedExpertReads: uncachedExpertReads, packedRecordDirectory: packedRecordDirectory.map { URL(fileURLWithPath: $0) }), as: UTF8.self))
            return
        }
        if prefill || sparse {
            print(String(decoding: try Diagnostics.quantizationPrefillModel(source: URL(fileURLWithPath: sourceDirectory),
                inventory: URL(fileURLWithPath: sourceInventory), fixtureDirectory: URL(fileURLWithPath: fixtureDirectory),
                output: URL(fileURLWithPath: output), sparse: sparse, residentRecords: residentRecords, residentText: residentText, wideRecords: wideRecords, parallelRecords: parallelRecords,
                denseOverlayBaseline: denseOverlayBaseline.map { URL(fileURLWithPath: $0) },
                denseOverlayManifest: denseOverlayManifest.map { URL(fileURLWithPath: $0) }, reinvestDenseSavings: reinvestDenseSavings, uncachedExpertReads: uncachedExpertReads, packedRecordDirectory: packedRecordDirectory.map { URL(fileURLWithPath: $0) }), as: UTF8.self))
            return
        }
        print(String(decoding: try Diagnostics.quantizationModel(source: URL(fileURLWithPath: sourceDirectory),
            inventory: URL(fileURLWithPath: sourceInventory), fixtureDirectory: URL(fileURLWithPath: fixtureDirectory),
            output: URL(fileURLWithPath: output)), as: UTF8.self))
    }
}

struct QuantizationPerformancePilot: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "quantization-performance-pilot",
        abstract: "Validate or time the frozen experimental VQ text profile; never qualifies a pack")
    @Option(name: .long) var sourceDirectory: String
    @Option(name: .long) var sourceInventory: String
    @Option(name: .long) var profile: String
    @Option(name: .long) var output: String
    @Option(name: .long, help: "Research only: exact pinned contiguous expert directory, for its frozen profile") var packedRecordDirectory: String?
    @Flag(name: .long, help: "Measure 128 tokens after a separate successful validation") var measure = false
    @Option(name: .long, help: "Successful validation receipt from this exact producer and profile") var validationReceipt: String?
    @Option(name: .long, help: "Research composite only: pinned installed affine baseline") var denseOverlayBaseline: String?
    @Option(name: .long, help: "Research composite only: exact frozen tensor map; requires matching composite reference") var denseOverlayManifest: String?
    func validate() throws {
        guard (denseOverlayBaseline == nil) == (denseOverlayManifest == nil) else {
            throw ValidationError("dense composite requires both baseline and manifest")
        }
        guard measure == (validationReceipt != nil) else {
            throw ValidationError("--measure requires --validation-receipt; validation mode accepts neither")
        }
    }
    func run() throws {
        print(String(decoding: try Diagnostics.quantizationPerformancePilot(
            source: URL(fileURLWithPath: sourceDirectory), inventory: URL(fileURLWithPath: sourceInventory),
            profileURL: URL(fileURLWithPath: profile), output: URL(fileURLWithPath: output),
            validationURL: validationReceipt.map { URL(fileURLWithPath: $0) },
            denseOverlayBaseline: denseOverlayBaseline.map { URL(fileURLWithPath: $0) },
            denseOverlayManifest: denseOverlayManifest.map { URL(fileURLWithPath: $0) },
            packedRecordDirectory: packedRecordDirectory.map { URL(fileURLWithPath: $0) }), as: UTF8.self))
    }
}

struct QuantizationBench: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "quantization-bench",
        abstract: "Run the bounded synthetic screen-v1 kernel timings; no model pack is qualified")
    @Option(name: .long, help: "Run fused-v2 instead, requiring exact binding fixtures from Tools/vq_fused_reference.py")
    var fusedFixtureDirectory: String?
    func run() throws {
        print(String(decoding: try Diagnostics.quantizationBench(
            fusedFixtureDirectory: fusedFixtureDirectory.map { URL(fileURLWithPath: $0) }), as: UTF8.self))
    }
}

struct QuantizationLogits: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "quantization-logits",
        abstract: "Export bounded full-vocabulary baseline logits for a frozen quantization pilot")
    @Option(name: .long, help: "Existing pinned 4-bit checkpoint directory")
    var model: String
    @Option(name: .long, help: "Frozen JSON token list, at most 2048 tokens")
    var tokens: String
    @Option(name: .long, help: "New output directory for logits and the raw receipt")
    var output: String
    func run() throws {
        print(String(decoding: try Diagnostics.quantizationLogits(modelDir: URL(fileURLWithPath: model),
            tokensFile: URL(fileURLWithPath: tokens), output: URL(fileURLWithPath: output)), as: UTF8.self))
    }
}

struct QuantizationDraftCheck: ParsableCommand {
    static let configuration = CommandConfiguration(commandName: "quantization-draft-check",
        abstract: "Compare the separately authenticated research draft head; does not enable speculation or a pack")
    @Option(name: .long) var baseline: String
    @Option(name: .long) var fixture: String
    @Option(name: .long) var output: String
    @Flag(name: .long, help: "Use explicit Python-compatible research arithmetic and the bounded rotary table")
    var referenceArithmetic = false
    func run() throws {
        print(String(decoding: try Diagnostics.quantizationDraft(baseline: URL(fileURLWithPath: baseline),
            fixture: URL(fileURLWithPath: fixture), output: URL(fileURLWithPath: output),
            referenceArithmetic: referenceArithmetic), as: UTF8.self))
    }
}
