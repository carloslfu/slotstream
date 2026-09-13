// Framing for one node's array payload — the bytes after the header line of
// `data.kv`. Each array is
// `<len:u32-le><header:len bytes of JSON><floats:shape-product*4 bytes>`, and
// the float byte count is derived from the parsed shape so the walk never
// consumes into the next array's header.
//
// The walk keeps an offset into the one `Data` instead of carving a fresh
// copy out after each array. `Data.subdata(in:)` copies, so the earlier shape
// moved the whole remainder of the file once per array: a node holds two to
// three arrays per layer — a hundred-plus for this model — so loading one node
// pushed roughly half its own size through memcpy a hundred times over. The
// loader still reads the file whole; this only stops it re-copying it.
//
// `arrays(in:from:)` is pure so the weight-free gate can frame synthetic bytes
// through the same entry point the loader uses.

import Foundation
import MLX

package enum NodeBody {
    /// A framing failure, carried as the message the loader logs.
    package struct Failure: Error {
        package let message: String
    }

    /// Parse the array sequence that starts at `start` and runs to the end of
    /// `data`. Throws `Failure` naming the first malformed array.
    package static func arrays(in data: Data, from start: Int) throws -> [String: MLXArray] {
        var arraysByName: [String: MLXArray] = [:]
        var cursor = start
        while data.endIndex - cursor >= 4 {
            // Read the length byte-wise: an odd-sized header leaves the cursor
            // unaligned, and `load(as:)` would require 4-byte alignment.
            let length = UInt32(data[cursor]) | (UInt32(data[cursor + 1]) << 8)
                | (UInt32(data[cursor + 2]) << 16) | (UInt32(data[cursor + 3]) << 24)
            let headerStart = cursor + 4
            guard data.endIndex - headerStart >= Int(length) else {
                throw Failure(message: "truncated array header")
            }
            let headerData = data[headerStart..<(headerStart + Int(length))]
            guard let header = try? JSONSerialization.jsonObject(with: headerData) as? [String: Any],
                  let name = header["name"] as? String,
                  let shape = header["shape"] as? [Int]
            else {
                throw Failure(message: "invalid array header JSON")
            }
            var elementCount = 1
            for dim in shape {
                guard dim >= 0 else {
                    throw Failure(message: "invalid or overflowing shape for \(name)")
                }
                let (next, overflow) = elementCount.multipliedReportingOverflow(by: dim)
                guard !overflow else {
                    throw Failure(message: "invalid or overflowing shape for \(name)")
                }
                elementCount = next
            }
            let (dataBytes, byteOverflow) = elementCount.multipliedReportingOverflow(by: 4)
            let dataStart = headerStart + Int(length)
            guard !byteOverflow, dataBytes <= data.endIndex - dataStart else {
                throw Failure(message: "truncated array data for \(name)")
            }
            let raw = data[dataStart..<(dataStart + dataBytes)]
            cursor = dataStart + dataBytes
            let floats = raw.withUnsafeBytes { Array($0.bindMemory(to: Float.self)) }
            // Restore to the dtype the live model held (liveDtype, added in
            // v3 headers): the SSM state must come back as float32 or the
            // recurrence diverges. Older headers without the field restore
            // as bfloat16, which only the bf16 arrays did hold.
            let dt: DType
            switch header["liveDtype"] as? String {
            case "float32": dt = .float32
            case "float16": dt = .float16
            default: dt = .bfloat16
            }
            arraysByName[name] = MLXArray(floats, shape).asType(dt)
        }
        if data.endIndex - cursor > 0 {
            throw Failure(message: "trailing \(data.endIndex - cursor) bytes")
        }
        return arraysByName
    }
}
