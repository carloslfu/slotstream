// Everything about a vision request that can be decided without weights: the
// geometry the reference processor defines, what counts as an image source,
// how one placeholder becomes a run of them, and how a run is clipped to a
// prefill chunk.
//
// It is deliberately a lot of surface for a check that loads nothing. The
// tower's arithmetic is the part a wrong answer hides in — a picture that
// resizes to the wrong grid still produces fluent text about the wrong number
// of patches — and the alternative to checking it here is checking it with
// 105 GB of weights on one machine.

import CoreGraphics
import Foundation
import ImageIO
import MLX
import Slotstream

extension Diagnostics {
    public static func vision() -> CheckReport {
        var c = CheckBuilder("vision-check")
        let cfg = VisionConfig()
        let bounds = VisionPreprocess.effectiveBounds(cfgMin: 65536, cfgMax: 16_777_216)

        // MARK: geometry
        //
        // `smart_resize` rounds each side to a multiple of patch × merge with
        // banker's rounding, then rescales to fit the pixel budget. These rows
        // are the reference implementation's answers (transformers'
        // `smart_resize`, the same one Qwen3VLProcessor calls) at the pinned
        // checkpoint's bounds, so a drift in either direction shows up here.
        func tokens(_ h: Int, _ w: Int) -> Int? {
            try? VisionTower.plan(height: h, width: w, cfg: cfg, bounds: bounds).mergedTokens
        }
        func grid(_ h: Int, _ w: Int) -> [Int]? {
            guard let p = try? VisionTower.plan(height: h, width: w, cfg: cfg, bounds: bounds)
            else { return nil }
            return [Int(p.gridH), Int(p.gridW)]
        }
        c.equal("846x859 -> 52x54 patches", grid(846, 859), [52, 54])
        c.equal("846x859 -> 702 tokens", tokens(846, 859), 702)
        c.equal("1206x1570 -> 1862 tokens", tokens(1206, 1570), 1862)
        c.equal("1024x1024 -> 1024 tokens", tokens(1024, 1024), 1024)
        // Below min_pixels the reference scales *up*, so a thumbnail still
        // costs the floor rather than a handful of patches.
        c.equal("a 56x56 thumbnail is raised to the 64-token floor", tokens(56, 56), 64)
        c.equal("224x224 lands on the same floor", tokens(224, 224), 64)
        // Above the engine's own cap it scales down. This is slotstream's
        // choice, not the processor's: 1536² keeps one picture under 2,304
        // tokens of a 32k context and one tower pass inside the memory plan.
        c.equal("a 4K screenshot is capped at 2304 tokens", tokens(3840, 2160), 2304)
        c.equal("and lands on the cap's grid", grid(3840, 2160), [128, 72])
        c.expect(
            "the cap is the binding bound, not the processor's",
            bounds.max == VisionPreprocess.engineMaxPixels)

        // Banker's rounding, which is what Python's round() does and what the
        // reference relies on. 0.5 goes to even, not away from zero.
        c.equal("round-half-even keeps 0.5 at 0", VisionPreprocess.roundHalfEven(0.5), 0)
        c.equal("and sends 1.5 to 2", VisionPreprocess.roundHalfEven(1.5), 2)
        c.equal("and 2.5 back to 2", VisionPreprocess.roundHalfEven(2.5), 2)
        c.equal("3.5 to 4", VisionPreprocess.roundHalfEven(3.5), 4)

        // Degenerate shapes are refused rather than resized into a sliver.
        c.expect("a zero dimension is refused", tokens(0, 100) == nil)
        c.expect("an extreme aspect ratio is refused", tokens(1, 4000) == nil)
        c.expect("199:1 is still accepted", tokens(1, 199) != nil)

        // MARK: image sources
        //
        // The rule is one sentence: inline bytes only. Everything below is a
        // way of restating it, because the version that fell through to
        // `Data(contentsOf:)` made every one of these a fetch.
        let onePixelPNG =
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg=="
        func loads(_ s: String) -> Bool {
            (try? VisionPreprocess.loadImageData(from: s)) != nil
        }
        c.expect("bare base64 loads", loads(onePixelPNG))
        c.expect("a data: URL loads", loads("data:image/png;base64," + onePixelPNG))
        c.expect("whitespace around it is tolerated", loads("  " + onePixelPNG + "\n"))
        c.expect("http:// is refused", !loads("http://example.com/cat.png"))
        c.expect("https:// is refused", !loads("https://example.com/cat.png"))
        c.expect("file:// is refused", !loads("file:///etc/passwd"))
        // A path is not a scheme, so it reaches the base64 decoder and comes
        // out as nonsense that fails to decode as an image. What matters is
        // the file behind it is never opened, so this checks the bytes rather
        // than the verdict.
        let secret = FileManager.default.temporaryDirectory
            .appendingPathComponent("slotstream-vision-check-secret.txt")
        let secretBytes = Data("SLOTSTREAM SECRET FILE CONTENTS".utf8)
        try? secretBytes.write(to: secret)
        let fromPath = try? VisionPreprocess.loadImageData(from: secret.path)
        c.expect("a filesystem path never returns the file", fromPath != secretBytes)
        let fromFileURL = try? VisionPreprocess.loadImageData(from: "file://" + secret.path)
        c.expect("nor does a file:// URL", fromFileURL == nil)
        try? FileManager.default.removeItem(at: secret)
        c.expect("a data: URL that is not base64 is refused", !loads("data:image/png,%89PNG"))
        c.expect("an empty payload is refused", !loads(""))
        c.expect(
            "a payload past the size cap is refused before decoding",
            !loads(String(repeating: "A", count: 40 << 20)))
        // The refusal has to name the reason, or the fix is a guess.
        let why = (try? VisionPreprocess.loadImageData(from: "file:///etc/hosts")).map { _ in "" }
            ?? {
                do { _ = try VisionPreprocess.loadImageData(from: "file:///etc/hosts"); return "" }
                catch { return "\(error)" }
            }()
        c.expect("and says URLs are not fetched", why.contains("not fetched"))

        c.equal("a scheme is recognised", VisionPreprocess.uriScheme("data:x"), "data")
        c.equal("case-insensitively", VisionPreprocess.uriScheme("HTTPS://x"), "https")
        c.expect("base64 has none", VisionPreprocess.uriScheme(onePixelPNG) == nil)
        c.expect("nor does a windows-ish path", VisionPreprocess.uriScheme("../a/b") == nil)

        // A real (tiny) PNG decodes; a truncated one does not.
        let png = (try? VisionPreprocess.loadImageData(from: onePixelPNG)) ?? Data()
        c.expect("the fixture decodes to an image", (try? VisionPreprocess.decodeCGImage(png)) != nil)
        c.expect(
            "half a PNG does not",
            (try? VisionPreprocess.decodeCGImage(png.prefix(20))) == nil)

        // Transparency. The decoder's context is premultiplied, so a
        // transparent pixel drawn over fresh memory is black; slotstream fills
        // white first, because that is what every viewer composites onto and
        // what the sender saw. Before it did, black text on a transparent
        // background reached the model as black on black and it answered "the
        // image is entirely black, with no discernible features".
        //
        // A 1x1 fully transparent PNG, resized to the smallest grid: every
        // channel must normalize to +1 (white), never -1 (black).
        let clearPNG =
            "iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA360e5gAAAABJRU5ErkJggg=="
        if let bytes = try? VisionPreprocess.loadImageData(from: clearPNG),
            let clear = try? VisionPreprocess.decodeCGImage(bytes)
        {
            let pixels = VisionPreprocess.resizeAndNormalize(cg: clear, targetH: 32, targetW: 32)
            c.expect(
                "a transparent pixel composites onto white, not onto black",
                pixels.allSatisfy { $0 > 0.99 })
        } else {
            c.expect("the transparent fixture decodes", false)
        }

        // Truncation. ImageIO decodes half a PNG into the rows it has plus
        // blank space and calls the source complete, so an upload cut short
        // produced a confident description of a mostly empty picture. The
        // container's end marker is the signal it does not give.
        let wholePNG = (try? VisionPreprocess.loadImageData(from: onePixelPNG)) ?? Data()
        c.expect("a whole PNG has its IEND", VisionPreprocess.endMarkerPresent(wholePNG))
        c.expect(
            "half a PNG does not",
            !VisionPreprocess.endMarkerPresent(wholePNG.prefix(wholePNG.count / 2)))
        c.expect(
            "and it is refused rather than decoded",
            (try? VisionPreprocess.decodeCGImage(wholePNG.prefix(wholePNG.count / 2))) == nil)
        // JPEG's end marker is looked for near the tail, not at the exact end,
        // because cameras append after it.
        let jpegBody = Data([0xFF, 0xD8]) + Data(repeating: 0x11, count: 64)
        c.expect(
            "a JPEG missing its EOI is truncated",
            !VisionPreprocess.endMarkerPresent(jpegBody))
        c.expect(
            "one with EOI then trailing bytes is not",
            VisionPreprocess.endMarkerPresent(
                jpegBody + Data([0xFF, 0xD9]) + Data(repeating: 0x22, count: 32)))
        c.expect(
            "a container with no known terminator is left to ImageIO",
            VisionPreprocess.endMarkerPresent(Data([0x42, 0x4D, 0x01, 0x02, 0x03])))

        // MARK: EXIF orientation
        //
        // All eight, corner by corner, on a 2x2 image whose pixels are four
        // distinct colours. A phone stores the sensor's pixels plus a tag, so
        // getting this wrong means every portrait photograph reaches the model
        // on its side — and the token count too, since 5-8 swap the axes.
        //
        // Stored:  red  green      The table is EXIF's own: 6 rotates 90
        //          blue yellow     clockwise for display, so the stored
        //                          bottom-left ends up top-left.
        func corners(_ o: UInt32) -> [String]? {
            let stored: [(UInt8, UInt8, UInt8)] = [
                (255, 0, 0), (0, 255, 0),  // top-left, top-right
                (0, 0, 255), (255, 255, 0),  // bottom-left, bottom-right
            ]
            var bytes: [UInt8] = []
            for p in stored { bytes += [p.0, p.1, p.2, 255] }
            let provider = CGDataProvider(data: Data(bytes) as CFData)!
            guard
                let src = CGImage(
                    width: 2, height: 2, bitsPerComponent: 8, bitsPerPixel: 32,
                    bytesPerRow: 8, space: CGColorSpaceCreateDeviceRGB(),
                    bitmapInfo: CGBitmapInfo(
                        rawValue: CGImageAlphaInfo.premultipliedLast.rawValue
                            | CGBitmapInfo.byteOrder32Big.rawValue),
                    provider: provider, decode: nil, shouldInterpolate: false,
                    intent: .defaultIntent),
                let out = try? VisionPreprocess.upright(src, orientation: o)
            else { return nil }
            var raw = [UInt8](repeating: 0, count: out.height * out.width * 4)
            guard
                let ctx = CGContext(
                    data: &raw, width: out.width, height: out.height, bitsPerComponent: 8,
                    bytesPerRow: out.width * 4, space: CGColorSpaceCreateDeviceRGB(),
                    bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
                        | CGBitmapInfo.byteOrder32Big.rawValue)
            else { return nil }
            ctx.draw(out, in: CGRect(x: 0, y: 0, width: out.width, height: out.height))
            func name(_ i: Int) -> String {
                let (r, g, b) = (raw[i * 4], raw[i * 4 + 1], raw[i * 4 + 2])
                if r > 200 && g > 200 { return "yellow" }
                if r > 200 { return "red" }
                if g > 200 { return "green" }
                if b > 200 { return "blue" }
                return "?"
            }
            return [name(0), name(1), name(2), name(3)]  // TL, TR, BL, BR
        }
        let expected: [UInt32: [String]] = [
            1: ["red", "green", "blue", "yellow"],
            2: ["green", "red", "yellow", "blue"],
            3: ["yellow", "blue", "green", "red"],
            4: ["blue", "yellow", "red", "green"],
            5: ["red", "blue", "green", "yellow"],
            6: ["blue", "red", "yellow", "green"],
            7: ["yellow", "green", "blue", "red"],
            8: ["green", "yellow", "red", "blue"],
        ]
        for o in (UInt32(1) ... 8) {
            c.equal("EXIF orientation \(o) lands every corner", corners(o), expected[o])
        }
        c.equal(
            "an unknown orientation value is left alone", corners(99), expected[1])

        // MARK: pixel layout
        //
        // `buildPixelValues` reorders patches into merge blocks — the order the
        // 2×2 merger and the rotary embedding both assume. Rows here are patch
        // indices, so the check reads as "which patch is token N".
        //
        // A 64×64 image is 4×4 patches, so 2×2 merge blocks of 2×2 patches.
        // Token 0..3 must be the top-left block read row-major, token 4 the
        // start of the next block along — not patch 2 of the first row.
        let side: UInt32 = 64, patch: UInt32 = 16, merge: UInt32 = 2
        let gh = side / patch
        var chw = [Float](repeating: 0, count: 3 * Int(side * side))
        // Paint each patch with its own value in channel 0 so a token's first
        // pixel identifies the patch it came from.
        for py in 0 ..< Int(side) {
            for px in 0 ..< Int(side) {
                let patchIndex = (py / Int(patch)) * Int(gh) + (px / Int(patch))
                chw[py * Int(side) + px] = Float(patchIndex)
            }
        }
        let pv = VisionPreprocess.buildPixelValues(
            chw: chw, h: side, w: side, patch: patch, merge: merge, tps: 2)
        let feat = 3 * 2 * Int(patch) * Int(patch)
        c.equal("pixel values are one row per patch", pv.count, Int(gh * gh) * feat)
        let firstPixelOfToken = (0 ..< Int(gh * gh)).map { Int(pv[$0 * feat]) }
        c.equal(
            "patches are ordered by merge block, not by row",
            firstPixelOfToken, [0, 1, 4, 5, 2, 3, 6, 7, 8, 9, 12, 13, 10, 11, 14, 15])

        // MARK: runs
        //
        // A run is one image's placeholders. Prefill sees it in chunks, and a
        // chunk boundary may fall inside a picture.
        func clip(_ start: Int, _ count: Int, _ lo: Int, _ hi: Int) -> [Int]? {
            VisionRun.clip(start: start, count: count, to: lo, hi).map {
                [$0.start, $0.rowFrom, $0.rowTo]
            }
        }
        c.equal("a run inside the chunk is re-based whole", clip(10, 4, 8, 20), [2, 0, 4])
        c.equal("a run the chunk starts inside drops its head", clip(10, 4, 12, 20), [0, 2, 4])
        c.equal("a run the chunk ends inside drops its tail", clip(10, 4, 8, 12), [2, 0, 2])
        c.equal("a chunk strictly inside a run keeps the middle", clip(10, 10, 12, 15), [0, 2, 5])
        c.expect("a run before the chunk is skipped", clip(0, 4, 8, 20) == nil)
        c.expect("a run after it too", clip(30, 4, 8, 20) == nil)
        c.expect("an exactly-abutting run is not overlap", clip(8, 4, 12, 20) == nil)

        // MARK: request shaping
        //
        // Images must reach the tower in the order the template numbers them
        // ("Picture 1: ..."), across both wire dialects, or two pictures swap
        // silently and every answer is about the wrong one.
        let mixed: [[String: Any]] = [
            ["role": "user", "content": [["type": "text", "text": "first"]]],
            [
                "role": "user",
                "content": [
                    ["type": "image_url", "image_url": ["url": "A"]],
                    ["type": "text", "text": "and"],
                    ["type": "image_url", "image_url": "B"],
                ],
            ],
            ["role": "user", "content": "third", "images": ["C", "D"]],
        ]
        c.equal(
            "images come out in template order across both shapes",
            Engine.imageSources(in: mixed), ["A", "B", "C", "D"])
        c.equal("a text-only conversation has none", Engine.imageSources(in: [
            ["role": "user", "content": "hi"]
        ]), [])

        // Ollama's `images` field is folded into content parts, because that is
        // what the template inspects.
        let shaped = Server.templateMessages([
            "messages": [["role": "user", "content": "look", "images": ["Zm9v"]]]
        ])
        let parts = shaped.first?["content"] as? [[String: Any]] ?? []
        c.equal("an ollama images field becomes content parts", parts.count, 2)
        c.equal("the picture leads", (parts.first?["type"] as? String) ?? "", "image_url")
        c.expect(
            "and the text survives",
            parts.contains { ($0["text"] as? String) == "look" })
        c.expect(
            "the image part carries the bytes unchanged",
            parts.contains {
                ($0["image_url"] as? [String: Any])?["url"] as? String == "Zm9v"
            })
        // A text-only part array still collapses to a string, so the text path
        // is byte-for-byte what it was before vision existed.
        c.equal(
            "a text-only part array collapses to a string",
            Server.templateMessages([
                "messages": [["role": "user", "content": [["type": "text", "text": "hi"]]]]
            ]).first?["content"] as? String, "hi")

        // MARK: the typed path
        //
        // fx and the CLI carry pictures on ChatMessage; the template needs them
        // as parts, images first.
        var msg = ChatMessage(role: "user", content: "describe")
        msg.images = ["X"]
        let tv = msg.templateValue["content"] as? [[String: any Sendable]] ?? []
        c.equal("a typed turn with images renders as parts", tv.count, 2)
        c.equal("images first", (tv.first?["type"] as? String) ?? "", "image_url")
        c.equal(
            "a typed turn without them is still a plain string",
            ChatMessage(role: "user", content: "describe").templateValue["content"] as? String,
            "describe")

        // MARK: the plan
        //
        // The tower is not in the announced peak, so the plan has to say so.
        let withVision = try? Planner.plan(
            expertsPerLayer: 60, poolGB: nil, memoryGB: nil, ramGB: 48, workingSetGB: 36,
            availableGB: 40, vision: .auto, visionAvailable: true)
        let without = try? Planner.plan(
            expertsPerLayer: 60, poolGB: nil, memoryGB: nil, ramGB: 48, workingSetGB: 36,
            availableGB: 40, vision: .off, visionAvailable: true)
        c.expect("auto turns vision on when the checkpoint has a tower", withVision?.visionEnabled == true)
        c.expect("--vision off turns it back off", without?.visionEnabled == false)
        c.equal(
            "the tower does not move the announced peak",
            withVision?.expectedPeakGB, without?.expectedPeakGB)
        c.expect(
            "and the banner says what it will cost when it loads",
            (withVision?.banner() ?? "").contains("+0.9 GB"))
        c.expect(
            "a text-only checkpoint cannot be forced on",
            (try? Planner.plan(
                expertsPerLayer: 60, poolGB: nil, memoryGB: nil, ramGB: 48, workingSetGB: 36,
                availableGB: 40, vision: .on, visionAvailable: false)) == nil)
        c.expect(
            "the machine-shaped request carries the mode too",
            (try? Planner.plan(
                PlanRequest(expertsPerLayer: 60, vision: .auto),
                on: Machine(ramGB: 48, workingSetGB: 36, availableGB: 40, isSimulated: false),
                visionAvailable: true))?.visionEnabled == true)

        return c.report()
    }
}

extension Diagnostics {
    /// The splice itself, on real arrays — T1, because it needs MLX but no
    /// weights.
    ///
    /// This is the function a wrong answer hides in. Every other vision check
    /// is about deciding *where* the rows go; this is the one that puts them
    /// there, and a splice off by one run leaves a fluent model describing a
    /// picture through a window shifted by a token. The values below are
    /// chosen so the assertion reads as "which row is at position N".
    public static func visionSplice() -> CheckReport {
        var c = CheckBuilder("vision-splice")
        let H = 4

        /// A hidden state whose every row is its own index, and runs whose
        /// rows are negative, so a spliced position is unmistakable.
        func hidden(_ S: Int) -> MLXArray {
            MLXArray((0 ..< S * H).map { Float($0 / H) }, [1, S, H])
        }
        func run(start: Int, count: Int, mark: Float) -> VisionRun {
            VisionRun(
                start: start,
                rows: MLXArray((0 ..< count * H).map { _ in mark }, [count, H]))
        }
        /// The first element of each position, after the splice.
        func firsts(_ h: MLXArray, _ S: Int) -> [Float] {
            let flat = h.reshaped([S, H]).asType(.float32).asArray(Float.self)
            return (0 ..< S).map { flat[$0 * H] }
        }

        let S = 8
        var out = Qwen4ExpModel.spliceVision(
            hidden(S), runs: [run(start: 2, count: 3, mark: -1)], length: S, hidden: H)
        c.equal(
            "one run replaces exactly its own span",
            firsts(out, S), [0, 1, -1, -1, -1, 5, 6, 7])
        c.equal("and the shape survives", out.shape, [1, S, H])

        out = Qwen4ExpModel.spliceVision(
            hidden(S),
            runs: [run(start: 5, count: 2, mark: -2), run(start: 1, count: 2, mark: -1)],
            length: S, hidden: H)
        c.equal(
            "two runs are placed in offset order, whatever order they arrive in",
            firsts(out, S), [0, -1, -1, 3, 4, -2, -2, 7])

        out = Qwen4ExpModel.spliceVision(
            hidden(S), runs: [run(start: 0, count: S, mark: -9)], length: S, hidden: H)
        c.equal(
            "a run covering the whole chunk leaves nothing of the embedding",
            firsts(out, S), Array(repeating: -9, count: S))

        out = Qwen4ExpModel.spliceVision(
            hidden(S), runs: [run(start: 0, count: 2, mark: -1)], length: S, hidden: H)
        c.equal("a run at the head", firsts(out, S), [-1, -1, 2, 3, 4, 5, 6, 7])
        out = Qwen4ExpModel.spliceVision(
            hidden(S), runs: [run(start: 6, count: 2, mark: -1)], length: S, hidden: H)
        c.equal("a run at the tail", firsts(out, S), [0, 1, 2, 3, 4, 5, -1, -1])
        c.equal("leaves the right length", firsts(out, S).count, S)

        // Clipping to a prefill chunk, on the arrays rather than the
        // arithmetic: the rows that survive must be the right rows, not just
        // the right count.
        let whole = run(start: 4, count: 4, mark: 0)
        let rows = MLXArray((0 ..< 4 * H).map { Float(-($0 / H) - 1) }, [4, H])
        let numbered = VisionRun(start: 4, rows: rows)
        c.equal("a run entirely inside a chunk keeps every row", numbered.clipped(to: 0, 8)?.count, 4)
        let tailHalf = numbered.clipped(to: 6, 10)
        c.equal("a chunk starting inside a run keeps the tail", tailHalf?.count, 2)
        c.equal("re-based to the chunk", tailHalf?.start, 0)
        if let t = tailHalf {
            let v = t.rows.asType(.float32).asArray(Float.self)
            c.equal("and it is the run's last two rows, not its first", [v[0], v[H]], [-3, -4])
        }
        c.expect("a run outside the chunk is dropped", whole.clipped(to: 0, 2) == nil)

        return c.report()
    }
}
