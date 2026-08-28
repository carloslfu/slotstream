// slotstream CLI: run · serve · parity · doctor · goldens

import ArgumentParser
import Foundation
import MLX
import SlotstreamCore

let defaultModelDir = FileManager.default.homeDirectoryForCurrentUser
    .appendingPathComponent("Projects/slotstream/models/qwen38-flash-next-mlx-4bit")

struct Slotstream: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "slotstream",
        abstract: "Qwen3.8-Flash-Next on Apple Silicon via SSD-streamed experts + cache slots.",
        subcommands: [Run.self, Serve.self, Parity.self, Doctor.self, NgramGolden.self, DequantGolden.self, TemplateCheck.self]
    )
}

/// Model geometry the cache math speaks in. Validated against config.json at
/// engine init; the CLI needs them before the checkpoint is opened.
enum Geometry {
    static let layers = 48
    static let expertsPerLayer = 512
    static let recordBytes = 2_764_800.0
    static let totalRecords = layers * expertsPerLayer
    /// Prefill can pin up to one full layer of experts (256-token chunk × top-10
    /// covers ~all 512) plus an in-flight miss batch; below this the eviction
    /// scan has no victim. 640 global ≈ 13/layer equivalent.
    static let floorSlots = 640

    static func gb(_ globalSlots: Int) -> Double { Double(globalSlots) * recordBytes / 1e9 }
    static func perLayer(_ globalSlots: Int) -> Double { Double(globalSlots) / Double(layers) }
}

struct ModelOptions: ParsableArguments {
    @Option(name: .long, help: "Model directory (MLX 4-bit checkpoint)")
    var model: String = defaultModelDir.path

    @Option(
        name: .customLong("experts-per-layer"),
        help: ArgumentHelp(
            "Expert cache size, in experts per layer (1...512).",
            discussion: """
                The primary memory<->speed knob. Each of the 48 layers has 512 \
                experts of 2.76 MB; the cache holds N x 48 of them, so memory = \
                N x 0.133 GB (e.g. 226/layer = 30 GB, 181/layer = 24 GB, \
                30/layer = 4 GB). The pool itself is one GLOBAL cache shared \
                across layers -- N is the intuitive unit, not a per-layer quota: \
                hot layers borrow slots from cold ones. Default: auto from \
                device memory (see `slotstream doctor`).
                """))
    var expertsPerLayer: Int?

    @Option(name: .customLong("pool-gb"),
            help: "Same knob in GB (1 GB ≈ 7.5 experts/layer). --experts-per-layer wins if both are given.")
    var poolGB: Double?

    var modelURL: URL { URL(fileURLWithPath: model) }

    func slots() -> Int {
        if let n = expertsPerLayer {
            return max(Geometry.floorSlots, min(n, Geometry.expertsPerLayer) * Geometry.layers)
        }
        if let g = poolGB { return max(Geometry.floorSlots, Int(g * 1e9 / Geometry.recordBytes)) }
        return autoSlots()
    }
}

func deviceWorkingSet() -> Int {
    Int(MLX.GPU.deviceInfo().maxRecommendedWorkingSetSize)
}

/// Auto cache size: working set − resident(3.9 GB) − headroom(6 GB), capped.
func autoSlots() -> Int {
    let ws = Double(deviceWorkingSet())
    let budget = min(max(ws - 3.9e9 - 6e9, 2e9), 30e9)
    return max(Geometry.floorSlots, Int(budget / Geometry.recordBytes))
}

// MARK: run

struct Run: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Generate from a prompt")
    @OptionGroup var model: ModelOptions
    @Option var prompt: String = "Why is the sky blue?"
    @Option var maxTokens: Int = 128
    @Flag(help: "Greedy sampling (deterministic)") var greedy = false
    @Flag(help: "Raw prompt (no chat template)") var raw = false
    @Flag(help: "Enable thinking mode") var think = false

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var result: Result<Void, Error> = .success(())
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, poolSlots: model.slots())
                let ids: [Int]
                if raw {
                    ids = engine.tokenizer.encode(text: prompt)
                } else {
                    ids = try engine.encodeChat([ChatMessage(role: "user", content: prompt)], thinking: think)
                }
                FileHandle.standardError.write("prompt tokens: \(ids.count)\n".data(using: .utf8)!)
                var params: SampleParams = greedy ? .greedy : (think ? .thinking : .instruct)
                params.maxTokens = maxTokens
                let t0 = Date()
                let (_, _, stats) = engine.generate(promptIds: ids, params: params) { _, delta in
                    fputs(delta, stdout)
                    fflush(stdout)
                    return true
                }
                print("")
                let hs = String(format: "%.3f", stats.expertHitRate)
                let perLayer = String(format: "~%.0f/%d experts per layer", Geometry.perLayer(model.slots()), Geometry.expertsPerLayer)
                FileHandle.standardError.write(
                    """

                    -- prefill \(stats.prefillTokens) tok in \(String(format: "%.2f", stats.prefillSeconds))s (\(String(format: "%.1f", stats.prefillTPS)) tok/s)
                    -- decode \(stats.decodeTokens) tok in \(String(format: "%.2f", stats.decodeSeconds))s (\(String(format: "%.2f", stats.decodeTPS)) tok/s)
                    -- expert cache \(perLayer), hit rate \(hs) | ngram rows \(stats.ngramRowHits)h/\(stats.ngramRowMisses)m | peak \(String(format: "%.1f", stats.peakMemoryGB)) GB | total \(String(format: "%.1f", -t0.timeIntervalSinceNow))s

                    """.data(using: .utf8)!)
                result = .success(())
            } catch {
                result = .failure(error)
            }
            sem.signal()
        }
        sem.wait()
        try result.get()
    }
}

// MARK: serve

struct Serve: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Ollama-compatible API server")
    @OptionGroup var model: ModelOptions
    @Option var port: UInt16 = 11434

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var engine: Engine!
        var err: Error?
        Task {
            do { engine = try await Engine(modelDir: model.modelURL, poolSlots: model.slots()) } catch { err = error }
            sem.signal()
        }
        sem.wait()
        if let e = err { throw e }
        let server = Server(engine: engine, port: port)
        try server.run()
    }
}

// MARK: parity

struct Parity: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Run N truncated layers and compare hidden states against the Python reference dumps")
    @OptionGroup var model: ModelOptions
    @Option var layers: Int = 4
    @Option(help: "Comma-separated token ids") var tokens: String
    @Option(help: "Directory with python layer_{i}.bin dumps") var compare: String?
    @Option(help: "Write swift layer_{i}.bin dumps here") var out: String?

    func run() throws {
        let ids = tokens.split(separator: ",").map { Int($0.trimmingCharacters(in: .whitespaces))! }
        let index = try CheckpointIndex(dir: model.modelURL)
        let m = try Qwen4ExpModel(index: index, poolSlots: 2048, runLayers: layers)
        let state = m.makeState()
        var dumps: [Int: [Float]] = [:]
        let h = m.hiddenStates(ids, state: state) { l, arr in
            dumps[l] = arr.asType(.float32).asArray(Float.self)
        }
        eval(h)
        if let out {
            try FileManager.default.createDirectory(atPath: out, withIntermediateDirectories: true)
            for (l, v) in dumps {
                let d = v.withUnsafeBufferPointer { Data(buffer: $0) }
                try d.write(to: URL(fileURLWithPath: out).appendingPathComponent("layer_\(l).bin"))
            }
            print("wrote \(dumps.count) layer dumps to \(out)")
        }
        if let cmp = compare {
            var worst: Float = 0
            for l in 0 ..< layers {
                let url = URL(fileURLWithPath: cmp).appendingPathComponent("layer_\(l).bin")
                let refData = try Data(contentsOf: url)
                let ref: [Float] = refData.withUnsafeBytes { Array($0.bindMemory(to: Float.self)) }
                let got = dumps[l]!
                precondition(ref.count == got.count, "layer \(l): count \(got.count) vs ref \(ref.count)")
                var maxAbs: Float = 0
                var refScale: Float = 0
                for i in 0 ..< ref.count {
                    maxAbs = max(maxAbs, abs(ref[i] - got[i]))
                    refScale = max(refScale, abs(ref[i]))
                }
                let rel = maxAbs / max(refScale, 1e-6)
                worst = max(worst, rel)
                print(String(format: "layer %2d: max abs %.5f, rel %.5f  %@", l, maxAbs, rel, rel < 2e-2 ? "OK" : "FAIL"))
            }
            print(worst < 2e-2 ? "PARITY PASS" : "PARITY FAIL")
            if worst >= 2e-2 { throw ExitCode(2) }
        }
    }
}

// MARK: doctor

struct Doctor: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Device + recommended preset")
    func run() throws {
        let info = MLX.GPU.deviceInfo()
        let ws = deviceWorkingSet()
        print("device: \(info.architecture)  |  memory \(String(format: "%.0f", Double(info.memorySize) / 1e9)) GB, "
            + "Metal working set \(String(format: "%.1f", Double(ws) / 1e9)) GB")
        print("model:  \(Geometry.layers) layers x \(Geometry.expertsPerLayer) experts, "
            + "2.76 MB each  (\(Geometry.totalRecords) records = 67.9 GB streamed from SSD)")
        let auto = autoSlots()
        print(String(
            format: "auto cache: ~%.0f of %d experts per layer   (%d global slots = %.1f GB, %.0f%% coverage)",
            Geometry.perLayer(auto), Geometry.expertsPerLayer, auto, Geometry.gb(auto),
            100 * Double(auto) / Double(Geometry.totalRecords)))
        print("""

        the knob:  --experts-per-layer N   memory = N x 0.133 GB   (floor 14/layer)
                   --pool-gb G             same knob in GB (1 GB = 7.5 experts/layer)

        reference points measured on this model:
          512/layer = 67.9 GB  everything resident
          226/layer = 30.0 GB  this device's auto
          181/layer = 24.0 GB  20 tok/s warm decode
           30/layer =  4.0 GB  5.6 tok/s, 7.3 GB total peak (identical output)

        The pool is one global cache shared across all layers; per-layer is the
        unit of intuition (each token activates 10 of 512 per layer), not a
        quota -- hot layers borrow slots from cold ones.
        """)
    }
}

// MARK: goldens

struct NgramGolden: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "ngram-golden",
        abstract: "Print n-gram row ids for a token sequence (compare vs python)")
    @OptionGroup var model: ModelOptions
    @Option var tokens: String

    func run() throws {
        let ids = tokens.split(separator: ",").map { Int64($0.trimmingCharacters(in: .whitespaces))! }
        let index = try CheckpointIndex(dir: model.modelURL)
        let resident = try ResidentWeights(index: index)
        let store = NgramStore(index: index, resident: resident)
        let eos = Int64(index.config.eosTokenId)
        let history = [eos, eos] + ids
        let rows = store.rowIds(history: history, nNew: ids.count)
        for (i, r) in rows.enumerated() {
            print("pos\(i): " + r.map(String.init).joined(separator: ","))
        }
    }
}

struct DequantGolden: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "dequant-golden",
        abstract: "CPU-dequantize one ngram row and print values (compare vs mx.dequantize)")
    @OptionGroup var model: ModelOptions
    @Option var gid: Int64 = 12345

    func run() throws {
        let index = try CheckpointIndex(dir: model.modelURL)
        let resident = try ResidentWeights(index: index)
        let store = NgramStore(index: index, resident: resident)
        print("rowsPerShard: \(store.rowsPerShard)")
        print("multipliers: \(store.multipliers)")
        let row = store.debugRow(gid)
        print("row[\(gid)][0..16]: " + row.prefix(16).map { String(format: "%.6f", $0) }.joined(separator: ","))
    }
}

struct TemplateCheck: ParsableCommand {
    static let configuration = CommandConfiguration(
        commandName: "template-check",
        abstract: "Render the chat template for a canned conversation and print token ids")
    @OptionGroup var model: ModelOptions
    @Flag var think = false

    func run() throws {
        let sem = DispatchSemaphore(value: 0)
        var out: [Int] = []
        var err: Error?
        Task {
            do {
                let engine = try await Engine(modelDir: model.modelURL, poolSlots: 64)
                out = try engine.encodeChat(
                    [
                        ChatMessage(role: "system", content: "You are helpful."),
                        ChatMessage(role: "user", content: "Hi there"),
                    ], thinking: think)
            } catch { err = error }
            sem.signal()
        }
        sem.wait()
        if let e = err { throw e }
        print(out.map(String.init).joined(separator: ","))
    }
}

Slotstream.main()
