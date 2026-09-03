// The images a prompt carries, described before any of them is encoded.
//
// Why this is a type and not an `MLXArray` handed to `generate`. The tower is
// the expensive half of a vision prompt: 27 blocks with full attention over
// every patch, per image, per request. Whether an image needs encoding at all
// depends on how much of the prompt the prefix cache can reuse, and that is not
// known until `generate` has asked the cache. So the request builds the ids and
// the cache key first — both come from the image dimensions, which are free —
// and hands over this object, which runs the tower only for the images the
// reused state does not already cover.

import CoreGraphics
import Foundation
import CryptoKit
import MLX

extension ImageHash {
    /// SHA-256 of the encoded bytes, truncated to 128 bits.
    public init(hashing data: Data) {
        var digest = SHA256()
        digest.update(data: data)
        let bytes = Array(digest.finalize())
        func word(_ offset: Int) -> UInt64 {
            var v: UInt64 = 0
            for i in 0 ..< 8 { v = (v << 8) | UInt64(bytes[offset + i]) }
            return v
        }
        self.init(hi: word(0), lo: word(8))
    }
}

/// The images of one request, their placeholder runs in the expanded prompt,
/// and the tower that can turn them into rows on demand.
public final class VisionPrompt {
    struct Item {
        let image: CGImage
        let plan: VisionTower.ImagePlan
    }

    private let tower: VisionTower
    private let items: [Item]
    private let hiddenSize: Int

    /// Where each image sits in the expanded prompt, and which image it is.
    /// This is the part the prefix cache keys on; it is `Sendable` and holds no
    /// pixels.
    public let segments: [ImageSegment]

    init(tower: VisionTower, items: [Item], segments: [ImageSegment], hiddenSize: Int) {
        self.tower = tower
        self.items = items
        self.segments = segments
        self.hiddenSize = hiddenSize
    }

    /// Total placeholder tokens across every image.
    public var tokenCount: Int { segments.reduce(0) { $0 + $1.count } }

    /// The embedding rows prefill still needs, given that the state already
    /// consumed the first `reused` tokens, together with the prompt positions
    /// they belong to.
    ///
    /// An image entirely inside the reused prefix is skipped: its rows are
    /// already folded into the state's KV and recurrent history, and the cache
    /// only handed that state over because the digests matched, so they were
    /// this image's rows. An image the boundary falls inside is encoded and its
    /// consumed rows dropped — the tower has no way to produce a suffix on its
    /// own, since every patch attends to every other one.
    ///
    /// Returns nil when nothing is left to splice, which is the ordinary case
    /// for a follow-up turn on a conversation whose pictures have not changed.
    public func rows(consumedTokens reused: Int) -> (positions: [Int], rows: MLXArray)? {
        var positions: [Int] = []
        var chunks: [MLXArray] = []
        for (i, seg) in segments.enumerated() where seg.end > reused {
            let flat = tower.encode(items[i].image, plan: items[i].plan)
                .reshaped([seg.count, hiddenSize])
            let skip = max(0, reused - seg.start)
            chunks.append(skip == 0 ? flat : flat[skip ..< seg.count, 0...])
            positions.append(contentsOf: (seg.start + skip) ..< seg.end)
        }
        guard !chunks.isEmpty else { return nil }
        return (positions, chunks.count == 1 ? chunks[0] : concatenated(chunks, axis: 0))
    }
}
