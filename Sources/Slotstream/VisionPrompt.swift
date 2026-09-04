// The images a prompt carries, described before any of them is encoded.
//
// Why this is a type and not an `MLXArray` handed to `generate`. The tower is
// the expensive half of a vision prompt: 27 blocks of full attention over every
// patch, per image, per request. Whether an image needs encoding at all depends
// on how much of the prompt the prefix cache can reuse, and that is not known
// until `generate` has asked the cache. So the request builds the ids and the
// cache key first — both follow from the image dimensions, which are free — and
// hands over this object, which runs the tower only for the images the reused
// state does not already cover.

import CoreGraphics
import CryptoKit
import Foundation
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

/// One contiguous run of placeholder tokens and the tower rows that fill it.
///
/// A run is the unit the splice works in, rather than a list of positions,
/// because a run is exactly what an image expands to: `count` copies of the
/// placeholder id starting at `start`. Keeping them together means the row
/// count and the position count cannot disagree — the mismatch the first
/// version of this code detected at splice time and then only logged.
public struct VisionRun {
    /// Offset of the first token of the run, in the same space as the ids
    /// handed to the model.
    public let start: Int
    /// Rows, `[count, hiddenSize]`, one per token of the run.
    public let rows: MLXArray

    public var count: Int { rows.dim(0) }
    public var end: Int { start + count }

    public init(start: Int, rows: MLXArray) {
        self.start = start
        self.rows = rows
    }

    /// The part of this run inside `[lo, hi)`, re-based to `lo`, or nil when
    /// the run lies entirely outside it.
    public func clipped(to lo: Int, _ hi: Int) -> VisionRun? {
        guard let c = Self.clip(start: start, count: count, to: lo, hi) else { return nil }
        if c.rowFrom == 0 && c.rowTo == count { return VisionRun(start: c.start, rows: rows) }
        return VisionRun(start: c.start, rows: rows[c.rowFrom ..< c.rowTo, 0...])
    }

    /// The arithmetic of `clipped`, without the rows — the part worth checking
    /// by a test that allocates nothing. Returns the re-based start and the
    /// half-open range of rows that survive, or nil for no overlap.
    public static func clip(
        start: Int, count: Int, to lo: Int, _ hi: Int
    ) -> (start: Int, rowFrom: Int, rowTo: Int)? {
        let from = Swift.max(start, lo), to = Swift.min(start + count, hi)
        guard from < to else { return nil }
        return (from - lo, from - start, to - start)
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

    /// The runs prefill still needs, given that the state already consumed the
    /// first `reused` tokens. Running the tower is the expensive part, so this
    /// is where it happens — not at tokenize time.
    ///
    /// An image entirely inside the reused prefix is skipped: its rows are
    /// already folded into that state's KV and recurrent history, and the cache
    /// only handed the state over because the digests matched, so they were
    /// this image's rows. An image the boundary falls inside is encoded and its
    /// consumed rows dropped — the tower cannot produce a suffix on its own,
    /// since every patch attends to every other one.
    ///
    /// Empty is the ordinary case for a follow-up turn on a conversation whose
    /// pictures have not changed.
    public func runs(consumedTokens reused: Int) -> [VisionRun] {
        var out: [VisionRun] = []
        for (i, seg) in segments.enumerated() where seg.end > reused {
            let flat = tower.encode(items[i].image, plan: items[i].plan)
                .reshaped([seg.count, hiddenSize])
            let skip = Swift.max(0, reused - seg.start)
            out.append(
                VisionRun(
                    start: seg.start + skip,
                    rows: skip == 0 ? flat : flat[skip ..< seg.count, 0...]))
        }
        return out
    }
}
