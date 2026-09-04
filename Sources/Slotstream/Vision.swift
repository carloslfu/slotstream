// Vision tower for Qwen3.8-Flash-Next VLM.
// Mirrors mlx-vlm qwen3_vl/vision.py and qwen_vision.zig (smartResize, bicubic, ViT 27 blocks).
// Checkpoint ships vision_tower.* (333 tensors, patch 16, merge 2, hidden 1152, out 2560).

import Foundation
import CoreGraphics
import ImageIO
import MLX
import MLXFast
import MLXNN
import UniformTypeIdentifiers

// MARK: - Vision config + helpers

public struct VisionConfig: Sendable {
    public init() {}
    public var hiddenSize = 1152
    public var depth = 27
    public var numHeads = 16
    public var patchSize = 16
    public var spatialMergeSize = 2
    public var temporalPatchSize = 2
    public var outHiddenSize = 2560
    public var numPositionEmbeddings = 2304
    public var headDim: Int { hiddenSize / numHeads }
}

public enum VisionError: Error, CustomStringConvertible {
    case msg(String)
    public var description: String {
        switch self { case .msg(let s): return s }
    }
}

// MARK: - Image preprocessing (Pillow-faithful)

/// Qwen3VL processor defaults (processing_qwen3_vl.py:96-98) + checkpoint overrides.
public struct VisionPreprocess {
    public static let factor: UInt32 = 32 // patch(16)*merge(2)
    public static let minPixels: UInt32 = 56 * 56
    public static let maxPixels: UInt32 = 14 * 14 * 4 * 1280
    public static let engineMaxPixels: UInt32 = 1536 * 1536 // cap vs 16.7M cfg

    /// Largest ratio between the sides of an accepted image, from the
    /// reference processor (`smart_resize` raises above 200). A sliver is not
    /// a picture, and the resize would spend the whole pixel budget on one
    /// dimension.
    public static let maxAspectRatio: Double = 200

    public static func effectiveBounds(cfgMin: UInt32, cfgMax: UInt32) -> (min: UInt32, max: UInt32) {
        let min = cfgMin > 0 ? cfgMin : minPixels
        let declared = cfgMax >= min ? cfgMax : max(maxPixels, min)
        let max = Swift.max(min, Swift.min(declared, engineMaxPixels))
        return (min, max)
    }

    public static func roundHalfEven(_ x: Double) -> Double {
        let fl = floor(x)
        let frac = x - fl
        if frac < 0.5 { return fl }
        if frac > 0.5 { return fl + 1 }
        return fmod(fl, 2.0) == 0 ? fl : fl + 1
    }

    public static func smartResize(h: UInt32, w: UInt32, factor: UInt32, minPixels: UInt32, maxPixels: UInt32) -> (h: UInt32, w: UInt32) {
        let fh = Double(h), fw = Double(w), ff = Double(factor)
        let fmin = Double(minPixels), fmax = Double(maxPixels)
        var hBar = roundHalfEven(fh / ff) * ff
        var wBar = roundHalfEven(fw / ff) * ff
        if hBar * wBar > fmax {
            let beta = sqrt((fh * fw) / fmax)
            hBar = Swift.max(ff, floor(fh / beta / ff) * ff)
            wBar = Swift.max(ff, floor(fw / beta / ff) * ff)
        } else if hBar * wBar < fmin {
            let beta = sqrt(fmin / (fh * fw))
            hBar = ceil(fh * beta / ff) * ff
            wBar = ceil(fw * beta / ff) * ff
        }
        return (UInt32(hBar), UInt32(wBar))
    }

    /// Largest decoded image accepted, chosen against `Server.maxBodyBytes`:
    /// base64 costs 4/3, so a 24 MiB picture is the biggest one a 32 MiB body
    /// can carry. A larger one is refused before any pixel is touched.
    public static let maxImageBytes = 24 << 20

    /// The encoded bytes behind an image argument. Separate from decoding
    /// because the prefix cache keys an image on exactly these bytes.
    ///
    /// **Only inline bytes are accepted** — a `data:` URL or bare base64.
    /// slotstream never dereferences a URL a request handed it. The earlier
    /// version of this function fell through to `Data(contentsOf:)`, which
    /// turns any string whose base64 decode happens to fail into a fetch: an
    /// unbounded, untimed request to an attacker-chosen host, and, via
    /// `file://`, a read of any image on the disk. Both are reachable from
    /// anything that can POST to the loopback port. Refusing outright also
    /// keeps the promise SECURITY.md makes (loopback only, no outbound
    /// traffic) true of the serving path, and matches Ollama, which likewise
    /// takes base64 only.
    public static func loadImageData(from source: String) throws -> Data {
        let trimmed = source.trimmingCharacters(in: .whitespacesAndNewlines)
        if let scheme = uriScheme(trimmed), scheme != "data" {
            throw VisionError.msg(
                "image source must be inline bytes (a data: URL or base64); "
                    + "'\(scheme):' URLs are not fetched")
        }
        let payload: Substring
        if trimmed.hasPrefix("data:") {
            guard let comma = trimmed.firstIndex(of: ",") else {
                throw VisionError.msg("malformed data: URL — no comma before the payload")
            }
            let meta = trimmed[trimmed.index(trimmed.startIndex, offsetBy: 5) ..< comma]
            guard meta.contains(";base64") else {
                throw VisionError.msg("data: URL must be base64-encoded (';base64,' before the payload)")
            }
            payload = trimmed[trimmed.index(after: comma)...]
        } else {
            payload = trimmed[trimmed.startIndex...]
        }
        // 4/3 of the cap, checked before decoding so an oversized payload is
        // never materialized twice.
        guard payload.count <= (maxImageBytes / 3) * 4 + 4 else {
            throw VisionError.msg("image is larger than \(maxImageBytes >> 20) MiB")
        }
        guard
            let data = Data(
                base64Encoded: String(payload), options: .ignoreUnknownCharacters),
            !data.isEmpty
        else {
            throw VisionError.msg("image payload is not valid base64")
        }
        guard data.count <= maxImageBytes else {
            throw VisionError.msg("image is larger than \(maxImageBytes >> 20) MiB")
        }
        return data
    }

    /// The URI scheme of `s`, if it starts with one (RFC 3986: a letter then
    /// letters, digits, `+`, `-`, `.`, then a colon). Base64 has no colon, so
    /// anything this finds was meant as a URL.
    public static func uriScheme(_ s: String) -> String? {
        var scheme = ""
        for ch in s {
            if ch == ":" { return scheme.isEmpty ? nil : scheme.lowercased() }
            let ok = ch.isLetter || (!scheme.isEmpty && (ch.isNumber || ch == "+" || ch == "-" || ch == "."))
            guard ok, ch.isASCII else { return nil }
            scheme.append(ch)
        }
        return nil
    }

    /// Decode encoded image bytes to an upright CGImage.
    ///
    /// Two things happen here that a plain `CGImageSourceCreateImageAtIndex`
    /// does not do, and both were found by feeding the finished path awkward
    /// files rather than photographs.
    ///
    /// **The EXIF orientation is applied.** A phone stores its sensor's pixels
    /// and a tag saying which way is up; every viewer, and the reference
    /// processor (`transformers.image_utils.load_image` runs
    /// `ImageOps.exif_transpose`), turns the picture before looking at it.
    /// Ignoring the tag sends every portrait photograph to the model on its
    /// side — measured on a tagged image whose corners are known: the model
    /// named the stored corner, not the displayed one.
    ///
    /// **A truncated file is refused.** ImageIO is deliberately lenient: half
    /// a PNG decodes to the rows it has and blank space for the rest, so an
    /// upload cut short by a dropped connection produced a confident
    /// description of a mostly empty image. Its own status is no help — it
    /// reports `complete` for that file, because all the data it was given was
    /// given at once — so the container's end marker is checked instead.
    public static func decodeCGImage(_ data: Data) throws -> CGImage {
        guard let src = CGImageSourceCreateWithData(data as CFData, nil),
            CGImageSourceGetCount(src) > 0
        else {
            throw VisionError.msg("failed to decode image")
        }
        let status = CGImageSourceGetStatusAtIndex(src, 0)
        guard status == .statusComplete, endMarkerPresent(data) else {
            throw VisionError.msg(
                "image data is incomplete — it ends mid-file, so it was probably "
                    + "truncated in transit; send the whole picture")
        }
        guard let cg = CGImageSourceCreateImageAtIndex(src, 0, nil) else {
            throw VisionError.msg("failed to decode image")
        }
        let props = CGImageSourceCopyPropertiesAtIndex(src, 0, nil) as? [CFString: Any]
        let orientation = (props?[kCGImagePropertyOrientation] as? UInt32) ?? 1
        return try upright(cg, orientation: orientation)
    }

    /// Does the file end where its container says it should?
    ///
    /// Only the three formats with an unambiguous terminator are judged, and
    /// only in the direction that is safe: a missing end marker is a
    /// truncation, an unrecognised container is left to ImageIO. PNG must end
    /// in `IEND`; JPEG must contain the end-of-image marker near its tail
    /// (cameras and editors do append after it, so this looks in the last few
    /// hundred bytes rather than at the exact end); GIF ends with `;`.
    public static func endMarkerPresent(_ data: Data) -> Bool {
        let bytes = [UInt8](data)
        if bytes.count >= 8, Array(bytes.prefix(8)) == [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A] {
            return bytes.count >= 12 && Array(bytes.suffix(8).prefix(4)) == [0x49, 0x45, 0x4E, 0x44]
        }
        if bytes.count >= 3, bytes[0] == 0xFF, bytes[1] == 0xD8 {
            let tail = bytes.suffix(512)
            var prev: UInt8 = 0
            for b in tail {
                if prev == 0xFF && b == 0xD9 { return true }
                prev = b
            }
            return false
        }
        if bytes.count >= 6, Array(bytes.prefix(3)) == [0x47, 0x49, 0x46] {
            return bytes.last == 0x3B
        }
        return true
    }

    /// Apply an EXIF orientation, returning an image whose pixel (0,0) is the
    /// top-left the photographer saw. Orientations 5-8 transpose the axes, so
    /// the result's width and height are swapped — which matters beyond the
    /// pixels, because the token count follows from the dimensions.
    public static func upright(_ cg: CGImage, orientation: UInt32) throws -> CGImage {
        guard (2 ... 8).contains(orientation) else { return cg }
        let w = cg.width, h = cg.height
        let transposed = orientation >= 5
        let outW = transposed ? h : w
        let outH = transposed ? w : h
        guard
            let ctx = CGContext(
                data: nil, width: outW, height: outH, bitsPerComponent: 8,
                bytesPerRow: 0, space: CGColorSpaceCreateDeviceRGB(),
                bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue
                    | CGBitmapInfo.byteOrder32Big.rawValue)
        else {
            throw VisionError.msg("could not allocate a context to rotate the image")
        }
        // Quartz draws from the bottom left, so each case below is written as
        // the transform that puts the *stored* image where the *displayed* one
        // belongs. The eight are checked exactly, corner by corner, in
        // `vision-check`; do not adjust one by eye.
        let fw = CGFloat(w), fh = CGFloat(h)
        switch orientation {
        case 2:  // mirrored horizontally
            ctx.translateBy(x: fw, y: 0)
            ctx.scaleBy(x: -1, y: 1)
        case 3:  // rotated 180
            ctx.translateBy(x: fw, y: fh)
            ctx.rotate(by: .pi)
        case 4:  // mirrored vertically
            ctx.translateBy(x: 0, y: fh)
            ctx.scaleBy(x: 1, y: -1)
        case 5:  // transposed (mirrored along the main diagonal)
            ctx.rotate(by: -.pi / 2)
            ctx.translateBy(x: -fw, y: 0)
            ctx.translateBy(x: 0, y: fh)
            ctx.scaleBy(x: 1, y: -1)
        case 6:  // rotated 90 clockwise for display
            ctx.translateBy(x: 0, y: fw)
            ctx.rotate(by: -.pi / 2)
        case 7:  // transverse: case 6, then flipped along the other axis
            ctx.translateBy(x: 0, y: CGFloat(outH))
            ctx.scaleBy(x: 1, y: -1)
            ctx.translateBy(x: 0, y: fw)
            ctx.rotate(by: -.pi / 2)
        case 8:  // rotated 90 counter-clockwise for display
            ctx.translateBy(x: fh, y: 0)
            ctx.rotate(by: .pi / 2)
        default:
            break
        }
        ctx.draw(cg, in: CGRect(x: 0, y: 0, width: fw, height: fh))
        guard let out = ctx.makeImage() else {
            throw VisionError.msg("could not rotate the image to its stated orientation")
        }
        return out
    }

    /// Resize via CoreGraphics bicubic (high) and normalize to [-1,1] CHW float32.
    public static func resizeAndNormalize(cg: CGImage, targetH: UInt32, targetW: UInt32) -> [Float] {
        let w = Int(targetW), h = Int(targetH)
        let bytesPerRow = w * 4
        var raw = [UInt8](repeating: 0, count: h * bytesPerRow)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        guard let ctx = CGContext(data: &raw, width: w, height: h, bitsPerComponent: 8, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue) else {
            return [Float](repeating: 0, count: 3 * h * w)
        }
        ctx.interpolationQuality = .high
        // Composite onto white, not onto the zeroed buffer.
        //
        // The context is premultiplied, so a transparent pixel drawn over
        // fresh memory comes out black. That is not a subtle difference for
        // the images people actually send: a logo, a chart, a diagram or a
        // screenshot exported with transparency is usually dark content on
        // nothing, and on black it is dark content on black. Measured before
        // this line existed, black text on a transparent background made the
        // model answer "the image is entirely black, with no discernible
        // features" — the picture did not survive the decoder. White is what
        // every viewer composites onto, so it is what the sender saw.
        ctx.setFillColor(gray: 1, alpha: 1)
        ctx.fill(CGRect(x: 0, y: 0, width: w, height: h))
        ctx.draw(cg, in: CGRect(x: 0, y: 0, width: w, height: h))
        // Convert to CHW normalized
        let plane = h * w
        var chw = [Float](repeating: 0, count: 3 * plane)
        for y in 0..<h {
            for x in 0..<w {
                let offset = y * bytesPerRow + x * 4
                let r = Float(raw[offset]) / 127.5 - 1.0
                let g = Float(raw[offset+1]) / 127.5 - 1.0
                let b = Float(raw[offset+2]) / 127.5 - 1.0
                let idx = y * w + x
                chw[0*plane + idx] = r
                chw[1*plane + idx] = g
                chw[2*plane + idx] = b
            }
        }
        return chw
    }

    /// Build pixel_values [N, C*tps*ps*ps] in merge-block order, feature [C, tps, py, px].
    /// For still image tps=2 duplicate frame.
    public static func buildPixelValues(chw: [Float], h: UInt32, w: UInt32, patch: UInt32, merge: UInt32, tps: UInt32) -> [Float] {
        let C: UInt32 = 3
        let gh = h / patch
        let gw = w / patch
        let mh = gh / merge
        let mw = gw / merge
        let N = Int(gh * gw)
        let feat = Int(C * tps * patch * patch)
        var out = [Float](repeating: 0, count: N * feat)
        let plane = Int(h * w)
        // frames duplicated for still image
        // We have single chw, duplicate logically via indexing tt
        var token = 0
        for bh in 0..<Int(mh) {
            for bw in 0..<Int(mw) {
                for ir in 0..<Int(merge) {
                    for ic in 0..<Int(merge) {
                        let row = bh * Int(merge) + ir
                        let col = bw * Int(merge) + ic
                        let base = token * feat
                        var f = 0
                        for c in 0..<Int(C) {
                            for _ in 0..<Int(tps) {
                                for py in 0..<Int(patch) {
                                    let y = row * Int(patch) + py
                                    for px in 0..<Int(patch) {
                                        let x = col * Int(patch) + px
                                        out[base + f] = chw[c*plane + y*Int(w) + x]
                                        f += 1
                                    }
                                }
                            }
                        }
                        token += 1
                    }
                }
            }
        }
        return out
    }
}

// MARK: - VisionTower

public final class VisionTower: TensorSource {
    public let arrays: [String: MLXArray]
    public let config: ModelConfig
    public let vcfg: VisionConfig

    private struct Block {
        let norm1W: MLXArray, norm1B: MLXArray
        let norm2W: MLXArray, norm2B: MLXArray
        let qkvW: MLXArray, qkvB: MLXArray
        let projW: MLXArray, projB: MLXArray
        let fc1W: MLXArray, fc1B: MLXArray
        let fc2W: MLXArray, fc2B: MLXArray
    }
    private let blocks: [Block]
    private let patchW: MLXArray // [hidden, 1536]
    private let patchB: MLXArray
    private let posEmbed: MLXArray // [2304, hidden]
    private let mergerNormW: MLXArray, mergerNormB: MLXArray
    private let mergerFc1W: MLXArray, mergerFc1B: MLXArray
    private let mergerFc2W: MLXArray, mergerFc2B: MLXArray

    /// Pixel bounds this checkpoint's processor declares, already clamped to
    /// what the engine will spend on one image. Read from
    /// `preprocessor_config.json` rather than hardcoded, so a checkpoint that
    /// ships different bounds is honoured instead of silently overridden.
    public let pixelBounds: (min: UInt32, max: UInt32)

    /// Resident bytes the tower will occupy, from the checkpoint index alone —
    /// no tensor is read. The memory plan charges this before deciding whether
    /// vision fits (see `Planner.visionResidentGB`).
    public static func residentBytes(index: CheckpointIndex) -> Int {
        var total = 0
        for (name, ref) in index.tensors where isTowerKey(name) {
            var count = ref.itemSize
            for dim in ref.shape { count *= dim }
            total += count
        }
        return total
    }

    /// Does this checkpoint carry a vision tower at all?
    public static func present(index: CheckpointIndex) -> Bool {
        index.tensors.keys.contains(where: isTowerKey)
    }

    static func isTowerKey(_ name: String) -> Bool {
        name.hasPrefix("vision_tower.") || name.hasPrefix("model.visual.")
    }

    public init(index: CheckpointIndex) throws {
        self.config = index.config
        var vc = VisionConfig()
        let data = try Data(contentsOf: index.dir.appendingPathComponent("config.json"))
        if let root = try JSONSerialization.jsonObject(with: data) as? [String: Any], let v = root["vision_config"] as? [String: Any] {
            if let x = v["hidden_size"] as? Int { vc.hiddenSize = x }
            if let x = v["depth"] as? Int { vc.depth = x }
            if let x = v["num_heads"] as? Int { vc.numHeads = x }
            if let x = v["patch_size"] as? Int { vc.patchSize = x }
            if let x = v["spatial_merge_size"] as? Int { vc.spatialMergeSize = x }
            if let x = v["temporal_patch_size"] as? Int { vc.temporalPatchSize = x }
            if let x = v["out_hidden_size"] as? Int { vc.outHiddenSize = x }
            if let x = v["num_position_embeddings"] as? Int { vc.numPositionEmbeddings = x }
        }
        self.vcfg = vc
        // The processor's own bounds. `size.shortest_edge` is min_pixels and
        // `size.longest_edge` is max_pixels in every Qwen*VL processor; the
        // engine cap is applied on top by `effectiveBounds`.
        var cfgMin: UInt32 = 0, cfgMax: UInt32 = 0
        let procPath = index.dir.appendingPathComponent("preprocessor_config.json")
        if let pdata = try? Data(contentsOf: procPath),
            let proc = try? JSONSerialization.jsonObject(with: pdata) as? [String: Any],
            let size = proc["size"] as? [String: Any]
        {
            if let v = size["shortest_edge"] as? Int, v > 0 { cfgMin = UInt32(clamping: v) }
            if let v = size["longest_edge"] as? Int, v > 0 { cfgMax = UInt32(clamping: v) }
        }
        self.pixelBounds = VisionPreprocess.effectiveBounds(cfgMin: cfgMin, cfgMax: cfgMax)
        var kept: [String: MLXArray] = [:]
        let files = Set(index.tensors.values.map { $0.file })
        for f in files.sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
            let all = try loadArrays(url: f)
            for (rawKey, arr) in all {
                var key = rawKey
                if key.hasPrefix("language_model.") { key.removeFirst("language_model.".count) }
                if Self.isTowerKey(key) {
                    kept[key] = arr
                }
            }
        }
        // Every tensor below is required. A checkpoint missing one is a
        // checkpoint this tower cannot run, and saying so beats trapping the
        // process on a force-unwrap halfway through a request.
        func need(_ name: String) throws -> MLXArray {
            guard let a = kept[name] else {
                throw VisionError.msg("vision tower is missing \(name)")
            }
            return a
        }
        // patch embed weight [1152,3,2,16,16] -> [1152,1536]
        let pw5 = try need("vision_tower.patch_embed.proj.weight")
        let wShape = pw5.shape
        guard wShape.count == 5 else {
            throw VisionError.msg(
                "vision_tower.patch_embed.proj.weight has shape \(wShape), expected 5 axes")
        }
        // wShape is 5D: [out, C, t, h, w] -> reshape to [out, C*t*h*w]
        let flat = wShape[1] * wShape[2] * wShape[3] * wShape[4]
        guard flat == 3 * vc.temporalPatchSize * vc.patchSize * vc.patchSize else {
            throw VisionError.msg(
                "patch_embed expects \(3 * vc.temporalPatchSize * vc.patchSize * vc.patchSize) "
                    + "features per patch, checkpoint has \(flat)")
        }
        guard vc.hiddenSize % vc.numHeads == 0, (vc.headDim / 2) % 2 == 0 else {
            throw VisionError.msg(
                "vision hidden_size \(vc.hiddenSize) / num_heads \(vc.numHeads) does not give "
                    + "an even half head dimension, which the 2-D rotary embedding requires")
        }
        guard vc.outHiddenSize == index.config.hiddenSize else {
            throw VisionError.msg(
                "vision out_hidden_size \(vc.outHiddenSize) does not match the text model's "
                    + "hidden size \(index.config.hiddenSize); the tower cannot be spliced")
        }
        let pw = pw5.reshaped([wShape[0], flat])
        kept["vision_tower.patch_embed.proj.weight.flat"] = pw
        eval(Array(kept.values))
        self.arrays = kept
        // extract for fast access
        self.patchW = pw
        self.patchB = try need("vision_tower.patch_embed.proj.bias")
        self.posEmbed = try need("vision_tower.pos_embed.weight")
        self.mergerNormW = try need("vision_tower.merger.norm.weight")
        self.mergerNormB = try need("vision_tower.merger.norm.bias")
        self.mergerFc1W = try need("vision_tower.merger.linear_fc1.weight")
        self.mergerFc1B = try need("vision_tower.merger.linear_fc1.bias")
        self.mergerFc2W = try need("vision_tower.merger.linear_fc2.weight")
        self.mergerFc2B = try need("vision_tower.merger.linear_fc2.bias")
        var blks: [Block] = []
        for i in 0..<vc.depth {
            let p = "vision_tower.blocks.\(i)"
            blks.append(
                Block(
                    norm1W: try need("\(p).norm1.weight"), norm1B: try need("\(p).norm1.bias"),
                    norm2W: try need("\(p).norm2.weight"), norm2B: try need("\(p).norm2.bias"),
                    qkvW: try need("\(p).attn.qkv.weight"), qkvB: try need("\(p).attn.qkv.bias"),
                    projW: try need("\(p).attn.proj.weight"), projB: try need("\(p).attn.proj.bias"),
                    fc1W: try need("\(p).mlp.linear_fc1.weight"),
                    fc1B: try need("\(p).mlp.linear_fc1.bias"),
                    fc2W: try need("\(p).mlp.linear_fc2.weight"),
                    fc2B: try need("\(p).mlp.linear_fc2.bias")))
        }
        self.blocks = blks
    }

    public func optionalTensor(_ name: String) -> MLXArray? { arrays[name] }

    // MARK: helpers

    @inline(__always) private func dense(_ x: MLXArray, _ w: MLXArray, _ b: MLXArray?) -> MLXArray {
        var y = matmul(x, w.T)
        if let b { y = y + b }
        return y
    }
    @inline(__always) private func layerNorm(_ x: MLXArray, _ w: MLXArray, _ b: MLXArray) -> MLXArray {
        MLXFast.layerNorm(x, weight: w, bias: b, eps: 1e-6)
    }
    private func geluTanh(_ x: MLXArray) -> MLXArray {
        // 0.5*x*(1+tanh(sqrt(2/pi)*(x+0.044715*x^3)))
        let c1 = MLXArray(0.79788456, dtype: .bfloat16)
        let c2 = MLXArray(0.044715, dtype: .bfloat16)
        let half = MLXArray(0.5, dtype: .bfloat16)
        let one = MLXArray(1.0, dtype: .bfloat16)
        let x3 = x * x * x
        let inner = c1 * (x + c2 * x3)
        // mlx has tanh
        let t = tanh(inner)
        return half * x * (one + t)
    }
    private func geluExact(_ x: MLXArray) -> MLXArray {
        // 0.5*x*(1+erf(x/sqrt2))
        let invSqrt2 = MLXArray(0.70710678, dtype: .bfloat16)
        let half = MLXArray(0.5, dtype: .bfloat16)
        let one = MLXArray(1.0, dtype: .bfloat16)
        let e = erf(x * invSqrt2)
        return half * x * (one + e)
    }

    // Build vision RoPE cos/sin [N,1,headDim] bf16
    private func buildRope(gridH: UInt32, gridW: UInt32) -> (MLXArray, MLXArray) {
        let hd = vcfg.headDim
        let half = hd/2
        let nfreq = half/2
        let merge = Int(vcfg.spatialMergeSize)
        let mh = Int(gridH) / merge
        let mw = Int(gridW) / merge
        let N = Int(gridH * gridW)
        let theta: Double = 10000
        var invFreq = [Double](repeating: 0, count: nfreq)
        for k in 0..<nfreq {
            let exp = -Double(2*k)/Double(half)
            invFreq[k] = pow(theta, exp)
        }
        var cosBuf = [Float](repeating: 0, count: N*hd)
        var sinBuf = [Float](repeating: 0, count: N*hd)
        var token = 0
        for bh in 0..<mh {
            for bw in 0..<mw {
                for ir in 0..<merge {
                    for ic in 0..<merge {
                        let row = Double(bh*merge + ir)
                        let col = Double(bw*merge + ic)
                        let base = token*hd
                        for k in 0..<nfreq {
                            let ah = row * invFreq[k]
                            let aw = col * invFreq[k]
                            cosBuf[base+k] = Float(cos(ah))
                            cosBuf[base+nfreq+k] = Float(cos(aw))
                            cosBuf[base+half+k] = Float(cos(ah))
                            cosBuf[base+half+nfreq+k] = Float(cos(aw))
                            sinBuf[base+k] = Float(sin(ah))
                            sinBuf[base+nfreq+k] = Float(sin(aw))
                            sinBuf[base+half+k] = Float(sin(ah))
                            sinBuf[base+half+nfreq+k] = Float(sin(aw))
                        }
                        token += 1
                    }
                }
            }
        }
        // bfloat16, like everything else in the tower. Keeping the angles in
        // float32 and rotating there was tried, on the theory that 8 mantissa
        // bits of cosine is a real loss of angle: measured against the float32
        // oracle it made agreement slightly *worse* (0.99847 against 0.99870),
        // because at this depth the residual stream's own rounding dominates
        // and the two errors were partly cancelling. It is not a lever; do not
        // re-derive it.
        let shape = [N, 1, hd]
        let cosA = MLXArray(cosBuf, shape)
        let sinA = MLXArray(sinBuf, shape)
        return (cosA.asType(.bfloat16), sinA.asType(.bfloat16))
    }

    private func posEmbedInterpolate(gridH: UInt32, gridW: UInt32) -> MLXArray {
        let G = Int(sqrt(Double(vcfg.numPositionEmbeddings))) // 48
        let merge = Int(vcfg.spatialMergeSize)
        let gh = Int(gridH), gw = Int(gridW)
        let mh = gh / merge, mw = gw / merge
        let N = gh * gw
        // axis helpers
        func axis(_ len: Int) -> (fl: [Int], cl: [Int], fr: [Double]) {
            var fl=[Int](repeating:0,count:len), cl=[Int](repeating:0,count:len), fr=[Double](repeating:0,count:len)
            let last = Double(G-1)
            for i in 0..<len {
                let v = len==1 ? 0 : last*Double(i)/Double(len-1)
                let f = Int(v)
                fl[i]=f; cl[i]=min(f+1, G-1); fr[i]=v-Double(f)
            }
            return (fl,cl,fr)
        }
        let ha = axis(gh), wa = axis(gw)
        var idx0=[Int32](repeating:0,count:N), idx1=[Int32](repeating:0,count:N), idx2=[Int32](repeating:0,count:N), idx3=[Int32](repeating:0,count:N)
        var w0=[Float](repeating:0,count:N), w1=[Float](repeating:0,count:N), w2=[Float](repeating:0,count:N), w3=[Float](repeating:0,count:N)
        var token=0
        for bh in 0..<mh {
            for bw in 0..<mw {
                for ir in 0..<merge {
                    for ic in 0..<merge {
                        let row = bh*merge+ir, col=bw*merge+ic
                        let hf=ha.fl[row], hc=ha.cl[row], wf=wa.fl[col], wc=wa.cl[col]
                        let dh=Float(ha.fr[row]), dw=Float(wa.fr[col])
                        let gi = Int32(G)
                        idx0[token]=Int32(hf)*gi+Int32(wf)
                        idx1[token]=Int32(hf)*gi+Int32(wc)
                        idx2[token]=Int32(hc)*gi+Int32(wf)
                        idx3[token]=Int32(hc)*gi+Int32(wc)
                        w0[token]=(1-dh)*(1-dw); w1[token]=(1-dh)*dw; w2[token]=dh*(1-dw); w3[token]=dh*dw
                        token+=1
                    }
                }
            }
        }
        // gather + weighted sum
        let idxShape=[N]
        let wShape=[N,1]
        func gather(_ idx:[Int32]) -> MLXArray {
            let arr = MLXArray(idx, idxShape)
            return take(posEmbed, arr, axis: 0) // [N, hidden]
        }
        let g0=gather(idx0), g1=gather(idx1), g2=gather(idx2), g3=gather(idx3)
        let wf0=MLXArray(w0,wShape).asType(.bfloat16), wf1=MLXArray(w1,wShape).asType(.bfloat16), wf2=MLXArray(w2,wShape).asType(.bfloat16), wf3=MLXArray(w3,wShape).asType(.bfloat16)
        let r0 = g0 * wf0, r1 = g1 * wf1, r2 = g2 * wf2, r3 = g3 * wf3
        return (r0 + r1 + r2 + r3).asType(.bfloat16)
    }

    private func rotateHalf(_ x: MLXArray) -> MLXArray {
        let hd = x.dim(-1)
        let half = hd/2
        let x1 = x[0..., 0..., 0..<half]
        let x2 = x[0..., 0..., half...]
        return concatenated([-x2, x1], axis: -1)
    }

    /// One block's attention. Full bidirectional attention over every patch —
    /// this tower has no windowing and no mask.
    ///
    /// **The fused kernel is load-bearing, for the same reason it is in
    /// `Layers.attend`.** Written as `softmax(q·kᵀ)·v` this materializes an
    /// `[heads, N, N]` score matrix and a second one for the probabilities. In
    /// float32 at the engine's largest image (9,216 patches) that is 5.4 GB
    /// each, twice, per block — on a machine whose whole promise is a memory
    /// plan. `MLXFast.scaledDotProductAttention` never forms it.
    private func attention(_ normed: MLXArray, _ blk: Block, cos: MLXArray, sin: MLXArray) -> MLXArray {
        let N = normed.dim(0)
        let heads = vcfg.numHeads
        let hd = vcfg.headDim
        // qkv [N, 3*hidden]
        let qkv = dense(normed, blk.qkvW, blk.qkvB)
        let qkv3 = qkv.reshaped([N, 3, heads, hd])
        let q = qkv3[0..., 0, 0..., 0...]
        let k = qkv3[0..., 1, 0..., 0...]
        let v = qkv3[0..., 2, 0..., 0...]
        // rope
        func applyRope(_ x: MLXArray) -> MLXArray {
            x * cos + rotateHalf(x) * sin
        }
        // [N, heads, hd] -> [1, heads, N, hd], the layout SDPA takes.
        let qh = applyRope(q).transposed(1, 0, 2).reshaped([1, heads, N, hd])
        let kh = applyRope(k).transposed(1, 0, 2).reshaped([1, heads, N, hd])
        let vh = v.transposed(1, 0, 2).reshaped([1, heads, N, hd])
        let o = MLXFast.scaledDotProductAttention(
            queries: qh, keys: kh, values: vh, scale: 1.0 / sqrt(Float(hd)), mask: .none)
        let ctt = o.reshaped([heads, N, hd]).transposed(1, 0, 2).reshaped([N, vcfg.hiddenSize])
        return dense(ctt, blk.projW, blk.projB)
    }

    // MARK: forward

    /// Encode one image: pixelValues [N, 1536] float32 -> [1, N/4, outHidden] bf16
    public func forward(pixelValues: MLXArray, gridH: UInt32, gridW: UInt32) -> MLXArray {
        let N = Int(gridH * gridW)
        var x = pixelValues.asType(.bfloat16)
        x = dense(x, patchW, patchB) // [N, hidden]
        let pos = posEmbedInterpolate(gridH: gridH, gridW: gridW)
        x = x + pos
        let (cos, sin) = buildRope(gridH: gridH, gridW: gridW)
        for blk in blocks {
            // attn
            let n1 = layerNorm(x, blk.norm1W, blk.norm1B)
            let attnOut = attention(n1, blk, cos: cos, sin: sin)
            x = x + attnOut
            // mlp
            let n2 = layerNorm(x, blk.norm2W, blk.norm2B)
            var fc = dense(n2, blk.fc1W, blk.fc1B)
            fc = geluTanh(fc)
            fc = dense(fc, blk.fc2W, blk.fc2B)
            x = x + fc
            // Bound the graph to one block. Without this MLX builds all 27
            // before evaluating any of them and holds every block's
            // activations at once — the same trap `Layers.attend` documents.
            eval(x)
        }
        // merger
        let normed = layerNorm(x, mergerNormW, mergerNormB)
        let merge2 = Int(vcfg.spatialMergeSize * vcfg.spatialMergeSize)
        let nMerged = N / merge2
        let grouped = normed.reshaped([nMerged, vcfg.hiddenSize * merge2])
        var m = dense(grouped, mergerFc1W, mergerFc1B)
        m = geluExact(m)
        m = dense(m, mergerFc2W, mergerFc2B) // [nMerged, outHidden]
        return m.reshaped([1, nMerged, vcfg.outHiddenSize])
    }

    /// How many tokens an image will occupy, and at what resolution — from its
    /// dimensions alone, without touching a pixel or running a block.
    ///
    /// This exists so the prompt's placeholder runs, and therefore the prefix
    /// cache key, can be built before any image is encoded. The tower is the
    /// expensive part (27 blocks with full attention over the patches); the
    /// geometry is arithmetic.
    public struct ImagePlan: Sendable {
        public let height: UInt32
        public let width: UInt32
        public let gridH: UInt32
        public let gridW: UInt32
        /// Patches before the 2x2 spatial merge.
        public let patches: Int
        /// Tokens after the merge — the length of this image's placeholder run.
        public let mergedTokens: Int
    }

    public func plan(for cg: CGImage) throws -> ImagePlan {
        try Self.plan(height: cg.height, width: cg.width, cfg: vcfg, bounds: pixelBounds)
    }

    /// The geometry alone, with no tower and no pixels — so it can be checked
    /// against the reference processor's table by a test that loads nothing.
    public static func plan(
        height: Int, width: Int, cfg: VisionConfig, bounds: (min: UInt32, max: UInt32)
    ) throws -> ImagePlan {
        let h = height, w = width
        guard h > 0, w > 0 else { throw VisionError.msg("image has a zero dimension") }
        let ratio = Double(max(h, w)) / Double(min(h, w))
        guard ratio <= VisionPreprocess.maxAspectRatio else {
            throw VisionError.msg(
                "image is \(w)x\(h): the ratio between its sides is "
                    + String(format: "%.0f", ratio)
                    + ", above the \(Int(VisionPreprocess.maxAspectRatio)) the processor allows")
        }
        let (minP, maxP) = bounds
        let resized = VisionPreprocess.smartResize(
            h: UInt32(h), w: UInt32(w), factor: VisionPreprocess.factor,
            minPixels: minP, maxPixels: maxP)
        let gh = resized.h / UInt32(cfg.patchSize)
        let gw = resized.w / UInt32(cfg.patchSize)
        let merge = UInt32(cfg.spatialMergeSize)
        return ImagePlan(
            height: resized.h, width: resized.w, gridH: gh, gridW: gw,
            patches: Int(gh * gw), mergedTokens: Int((gh / merge) * (gw / merge)))
    }

    /// Run the tower for one image against a plan already computed for it.
    public func encode(_ cg: CGImage, plan p: ImagePlan) -> MLXArray {
        let chw = VisionPreprocess.resizeAndNormalize(cg: cg, targetH: p.height, targetW: p.width)
        let tps: UInt32 = UInt32(vcfg.temporalPatchSize)
        let pixelFlat = VisionPreprocess.buildPixelValues(
            chw: chw, h: p.height, w: p.width, patch: UInt32(vcfg.patchSize),
            merge: UInt32(vcfg.spatialMergeSize), tps: tps)
        let feat = 3 * Int(tps) * vcfg.patchSize * vcfg.patchSize
        let pv = MLXArray(pixelFlat, [p.patches, feat])
        return forward(pixelValues: pv, gridH: p.gridH, gridW: p.gridW)
    }

}
