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

public struct VisionConfig {
    var hiddenSize = 1152
    var depth = 27
    var numHeads = 16
    var patchSize = 16
    var spatialMergeSize = 2
    var temporalPatchSize = 2
    var outHiddenSize = 2560
    var numPositionEmbeddings = 2304
    var headDim: Int { hiddenSize / numHeads }
}

enum VisionError: Error, CustomStringConvertible {
    case msg(String)
    var description: String {
        switch self { case .msg(let s): return s }
    }
}

// MARK: - Image preprocessing (Pillow-faithful)

/// Qwen3VL processor defaults (processing_qwen3_vl.py:96-98) + checkpoint overrides.
struct VisionPreprocess {
    static let factor: UInt32 = 32 // patch(16)*merge(2)
    static let minPixels: UInt32 = 56 * 56
    static let maxPixels: UInt32 = 14 * 14 * 4 * 1280
    static let engineMaxPixels: UInt32 = 1536 * 1536 // cap vs 16.7M cfg

    static func effectiveBounds(cfgMin: UInt32, cfgMax: UInt32) -> (min: UInt32, max: UInt32) {
        let min = cfgMin > 0 ? cfgMin : minPixels
        let declared = cfgMax >= min ? cfgMax : max(maxPixels, min)
        let max = Swift.max(min, Swift.min(declared, engineMaxPixels))
        return (min, max)
    }

    static func roundHalfEven(_ x: Double) -> Double {
        let fl = floor(x)
        let frac = x - fl
        if frac < 0.5 { return fl }
        if frac > 0.5 { return fl + 1 }
        return fmod(fl, 2.0) == 0 ? fl : fl + 1
    }

    static func smartResize(h: UInt32, w: UInt32, factor: UInt32, minPixels: UInt32, maxPixels: UInt32) -> (h: UInt32, w: UInt32) {
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

    /// Load CGImage from data: URL (base64) or http(s) URL or raw base64.
    static func loadCGImage(from urlString: String) throws -> CGImage {
        let data: Data
        if urlString.hasPrefix("data:") {
            guard let comma = urlString.firstIndex(of: ","), let decoded = Data(base64Encoded: String(urlString[urlString.index(after: comma)...]), options: .ignoreUnknownCharacters) else {
                throw VisionError.msg("invalid data URL")
            }
            data = decoded
        } else if urlString.hasPrefix("http://") || urlString.hasPrefix("https://") {
            guard let url = URL(string: urlString), let d = try? Data(contentsOf: url) else {
                throw VisionError.msg("failed to fetch image URL")
            }
            data = d
        } else {
            // raw base64
            if let decoded = Data(base64Encoded: urlString, options: .ignoreUnknownCharacters) {
                data = decoded
            } else if let url = URL(string: urlString), let d = try? Data(contentsOf: url) {
                data = d
            } else {
                throw VisionError.msg("invalid image url/base64")
            }
        }
        guard let src = CGImageSourceCreateWithData(data as CFData, nil), let cg = CGImageSourceCreateImageAtIndex(src, 0, nil) else {
            throw VisionError.msg("failed to decode image")
        }
        return cg
    }

    /// Resize via CoreGraphics bicubic (high) and normalize to [-1,1] CHW float32.
    static func resizeAndNormalize(cg: CGImage, targetH: UInt32, targetW: UInt32) -> [Float] {
        let w = Int(targetW), h = Int(targetH)
        let bytesPerRow = w * 4
        var raw = [UInt8](repeating: 0, count: h * bytesPerRow)
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        guard let ctx = CGContext(data: &raw, width: w, height: h, bitsPerComponent: 8, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue | CGBitmapInfo.byteOrder32Big.rawValue) else {
            return [Float](repeating: 0, count: 3 * h * w)
        }
        ctx.interpolationQuality = .high
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
    static func buildPixelValues(chw: [Float], h: UInt32, w: UInt32, patch: UInt32, merge: UInt32, tps: UInt32) -> [Float] {
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
        var kept: [String: MLXArray] = [:]
        let files = Set(index.tensors.values.map { $0.file })
        for f in files.sorted(by: { $0.lastPathComponent < $1.lastPathComponent }) {
            let all = try loadArrays(url: f)
            for (rawKey, arr) in all {
                var key = rawKey
                if key.hasPrefix("language_model.") { key.removeFirst("language_model.".count) }
                if key.hasPrefix("vision_tower.") || key.hasPrefix("model.visual.") {
                    kept[key] = arr
                }
            }
        }
        // patch embed weight [1152,3,2,16,16] -> [1152,1536]
        guard let pw5 = kept["vision_tower.patch_embed.proj.weight"] else { throw VisionError.msg("missing patch_embed weight") }
        let wShape = pw5.shape
        // wShape is 5D: [out, C, t, h, w] -> reshape to [out, C*t*h*w]
        let flat = wShape[1]*wShape[2]*wShape[3]*wShape[4]
        let pw = pw5.reshaped([wShape[0], flat])
        kept["vision_tower.patch_embed.proj.weight.flat"] = pw
        eval(Array(kept.values))
        self.arrays = kept
        // extract for fast access
        self.patchW = pw
        self.patchB = kept["vision_tower.patch_embed.proj.bias"]!
        self.posEmbed = kept["vision_tower.pos_embed.weight"]!
        self.mergerNormW = kept["vision_tower.merger.norm.weight"]!
        self.mergerNormB = kept["vision_tower.merger.norm.bias"]!
        self.mergerFc1W = kept["vision_tower.merger.linear_fc1.weight"]!
        self.mergerFc1B = kept["vision_tower.merger.linear_fc1.bias"]!
        self.mergerFc2W = kept["vision_tower.merger.linear_fc2.weight"]!
        self.mergerFc2B = kept["vision_tower.merger.linear_fc2.bias"]!
        var blks: [Block] = []
        for i in 0..<vc.depth {
            let p = "vision_tower.blocks.\(i)"
            blks.append(Block(
                norm1W: kept["\(p).norm1.weight"]!, norm1B: kept["\(p).norm1.bias"]!,
                norm2W: kept["\(p).norm2.weight"]!, norm2B: kept["\(p).norm2.bias"]!,
                qkvW: kept["\(p).attn.qkv.weight"]!, qkvB: kept["\(p).attn.qkv.bias"]!,
                projW: kept["\(p).attn.proj.weight"]!, projB: kept["\(p).attn.proj.bias"]!,
                fc1W: kept["\(p).mlp.linear_fc1.weight"]!, fc1B: kept["\(p).mlp.linear_fc1.bias"]!,
                fc2W: kept["\(p).mlp.linear_fc2.weight"]!, fc2B: kept["\(p).mlp.linear_fc2.bias"]!
            ))
        }
        self.blocks = blks
        FileHandle.standardError.write("[vision] tower \(vc.depth)x\(vc.hiddenSize) loaded \(kept.count) tensors\n".data(using: .utf8)!)
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

    private func attention(_ normed: MLXArray, _ blk: Block, cos: MLXArray, sin: MLXArray) -> MLXArray {
        let N = normed.dim(0)
        let heads = vcfg.numHeads
        let hd = vcfg.headDim
        // qkv [N, 3*hidden]
        let qkv = dense(normed, blk.qkvW, blk.qkvB)
        let qkv3 = qkv.reshaped([N, 3, heads, hd])
        let q = qkv3[0...,0,0...,0...]
        let k = qkv3[0...,1,0...,0...]
        let v = qkv3[0...,2,0...,0...]
        // rope
        func applyRope(_ x: MLXArray) -> MLXArray {
            let rh = rotateHalf(x)
            return x * cos + rh * sin
        }
        let qr = applyRope(q)
        let kr = applyRope(k)
        // to heads-first for matmul
        let qh = qr.transposed(1,0,2).asType(.float32)
        let kh = kr.transposed(1,0,2).asType(.float32)
        let vh = v.transposed(1,0,2).asType(.float32)
        let scale = 1.0 / sqrt(Float(hd))
        let scores = matmul(qh, kh.transposed(0,2,1)) * scale
        let probs = softmax(scores, axis: -1)
        let ctx = matmul(probs, vh).asType(.bfloat16)
        let ctt = ctx.transposed(1,0,2).reshaped([N, vcfg.hiddenSize])
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

    /// Convenience: encode CGImage -> embeddings
    public func encodeImage(_ cg: CGImage) throws -> (MLXArray, Int, Int, Int) {
        let srcH = UInt32(cg.height), srcW = UInt32(cg.width)
        // checkpoint processor bounds: longest_edge 16777216, shortest 65536
        let (minP, maxP) = VisionPreprocess.effectiveBounds(cfgMin: 65536, cfgMax: 16777216)
        let resized = VisionPreprocess.smartResize(h: srcH, w: srcW, factor: VisionPreprocess.factor, minPixels: minP, maxPixels: maxP)
        let chw = VisionPreprocess.resizeAndNormalize(cg: cg, targetH: resized.h, targetW: resized.w)
        let tps: UInt32 = UInt32(vcfg.temporalPatchSize)
        let pixelFlat = VisionPreprocess.buildPixelValues(chw: chw, h: resized.h, w: resized.w, patch: UInt32(vcfg.patchSize), merge: UInt32(vcfg.spatialMergeSize), tps: tps)
        let N = Int(resized.h / UInt32(vcfg.patchSize) * resized.w / UInt32(vcfg.patchSize))
        let feat = 3 * Int(tps) * vcfg.patchSize * vcfg.patchSize
        let pv = MLXArray(pixelFlat, [N, feat])
        let gh = resized.h / UInt32(vcfg.patchSize)
        let gw = resized.w / UInt32(vcfg.patchSize)
        let emb = forward(pixelValues: pv, gridH: gh, gridW: gw)
        let nMerged = Int(gh / UInt32(vcfg.spatialMergeSize) * gw / UInt32(vcfg.spatialMergeSize))
        return (emb, N, nMerged, Int(gh))
    }
}
