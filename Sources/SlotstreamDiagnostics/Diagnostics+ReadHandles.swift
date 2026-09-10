import Foundation
import Slotstream

extension Diagnostics {
    public static func optimizationReadHandles(modelDir: URL) throws -> CheckReport {
        var c = CheckBuilder("optimization-read-handle-lifetime")
        var owner: CheckpointIndex? = try CheckpointIndex(dir: modelDir)
        weak var observedOwner = owner
        let ref = owner!.ref("model.layers.0.mlp.switch_mlp.gate_proj.weight")
        var handle: TensorReadHandle? = owner!.readHandle(for: ref)
        var expected = [UInt8](repeating: 0, count: 97)
        try expected.withUnsafeMutableBytes { try owner!.preadChecked(into: $0.baseAddress!, ref, offset: ref.byteCount - 97, count: 97) }
        owner = nil
        c.expect("handle retains the index and descriptor", observedOwner != nil)
        var got = [UInt8](repeating: 0, count: 101)
        try got.withUnsafeMutableBytes { try handle!.readChecked(into: $0.baseAddress!, offset: ref.byteCount - 97, count: 97) }
        c.equal("owned handle reads exact final tensor bytes", Array(got.prefix(97)), expected)
        c.equal("tensor-end read preserves destination suffix", Array(got.suffix(4)), [0, 0, 0, 0])
        for (offset, count) in [(-1, 1), (ref.byteCount, 1), (0, ref.byteCount + 1), (Int.max, 1)] {
            do {
                try got.withUnsafeMutableBytes { try handle!.readChecked(into: $0.baseAddress!, offset: offset, count: count) }
                c.expect("invalid tensor span \(offset)/\(count)", false)
            } catch let error as CheckpointReadError {
                if case .invalidRange = error { c.expect("invalid tensor span \(offset)/\(count)", true) }
                else { c.expect("invalid tensor span \(offset)/\(count)", false, error.description) }
            }
        }
        do {
            try got.withUnsafeMutableBytes { try handle!.readChecked(into: $0.baseAddress!, offset: 0, count: 1, shouldContinue: { false }) }
            c.expect("handle cancellation is reported", false)
        } catch let error as CheckpointReadError {
            if case .cancelled = error { c.expect("handle cancellation is reported", true) }
            else { c.expect("handle cancellation is reported", false, error.description) }
        }
        handle = nil
        c.expect("last handle releases the owner without a cycle", observedOwner == nil)
        return c.report()
    }
}
