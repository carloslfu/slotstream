---
type: run
id: 01m1y2rkxck9xexqkd8fn9asd8
created: 2026-09-07T14:01:13.900424+00:00
updated: 2026-09-07T14:01:14.331865+00:00
summary: Native Swift retained-window synchronization evidence
binary: V304 af5ff036d03e85210ed40fd3ba02207ecc935d44dc67264cd44a05eb70d2632d; native probe separately identified
captured_at: 2026-09-07
command: Frozen native component, build lease and campaign protocols below
discarded: 'false'
machines: '[[records/machines/macbook-pro-m5-pro-48gb]]'
title: Native Swift retained-window synchronization evidence
tool: python3
---
# Native Swift confirmation

V302 preserves a real compile failure: two explicit annotations named MLXArrayData at top level, although the installed Swift API nests that result type. The 15.478840542-second attempt launches no probe and is not a failed inference experiment. V303 removes only those two annotations and lets the actual asData(access: .copy) return type be inferred. It compiles the standalone probe against 243 existing pinned MLX/Cmlx/Numerics objects, with 284 pinned inputs and a private module cache/output. Native Swift MLX reports 0.31.6; the earlier Python component used distribution 0.31.1. Neither rebuilt Slotstream nor loaded the model.

V303 passes all 12 both/one/absent-window cases with exact copied Data bytes, shapes and dtypes. At each parent prompt size 17, 256 and 4096, all 16 fixed interleaved measurement pairs are VM-clean. Median paired reductions are 47.31509229716028%, 48.09678912534018% and 46.23840309039572%. Separate/joined per-compaction arm medians are 537.948242/275.790039, 494.909828/254.963867 and 511.060875/261.019852 microseconds. Each arm performs 64 compactions per measurement after its warmup. The exact geometry is 10240 channels, a three-row GDN window and a nine-row PLE window. Allocator active peak is 336,183,296 bytes; no serving or process-footprint saving is inferred.

The native compile-and-run wrapper passes in 31.467029375 seconds under protocol 2a61aac9c0a3fc3497696ab018e7bf6228ba7b5675047eea508adf06fb2619f3. Probe binary is 59a7de583644531bdce0e0d77912188ca484da8d753fa0c306c78eb868e15230. Identity, normal pressure, owned-resource bounds, drain and deadline checks pass. Generated module caches are omitted from this evidence inventory; their source/object identities, commands, compiler output, raw pairs, edge cases and guards are captured. These isolated native timings support a concrete implementation candidate, not a whole-model speedup or activation.

## Evidence inventory

````json
[
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v302/Probe.swift",
    "sha256": "c8880a7f919d73b5a5a141cb784499ad33cc7bc53b5cb6309bbcb5f943f9b489",
    "bytes": 6173
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v302/compile.memory.json",
    "sha256": "2e387b8764551b19b642632a9b18ebdec5220469ea392095247960265941c8f7",
    "bytes": 50684
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v302/compile.memory.samples.jsonl",
    "sha256": "beb585a42e482649de2ab9b9b1a3ba808e9e0b0bd9c7b6a73307cf45ec44e473",
    "bytes": 11293
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v302/compile.stderr.txt",
    "sha256": "0734ef0f3183d5d701d45bef0b35089b2ad06f56a630b9734c8c16c67e6a6038",
    "bytes": 1013
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v302/compile.stdout.txt",
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "bytes": 0
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v302/manifest.json",
    "sha256": "1a20b4c055af69f0b325907dd344bc2009c525406f200dd8e449b1c6c4e2f636",
    "bytes": 35152
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v302/mlx.metallib",
    "sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
    "bytes": 131041909
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v302/preparation.json",
    "sha256": "71450f9ee070a5b7fbcd8334bd2194a1f64720e075b0f0628e5521db0515c79a",
    "bytes": 82090
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v302/protocol.json",
    "sha256": "bf2fb767f143f189cb21572b4425d260f3ed0b43580d6f08116186a405dcfa26",
    "bytes": 83948
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v302/run.py",
    "sha256": "4e792202d3f4687792eccae207b5a816f78093ecb3e5a8b2e5ed0ebb803be636",
    "bytes": 4767
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/Probe.swift",
    "sha256": "9c33545dac887f211b634987e6bae269bc87bfa822f1bd469f5c475e666984c8",
    "bytes": 6145
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/compile.memory.json",
    "sha256": "13caaa9d1e81b7b2421b58d6e28c8c473b5bf03c6064b98c5d6422af3a3c65b1",
    "bytes": 51038
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/compile.memory.samples.jsonl",
    "sha256": "1e22275baeb90adfc11359c57ebd7b15aca7a14e97fd125fee5606adc584caff",
    "bytes": 11554
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/compile.stderr.txt",
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "bytes": 0
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/compile.stdout.txt",
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "bytes": 0
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/component-result.json",
    "sha256": "96f2a2be7fad101e980d1e2ef9dbb5b92fc535bcbfc056e637758a700620e538",
    "bytes": 21874
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/manifest.json",
    "sha256": "597f2b26510005308a1556682c3c85f3e5342b62d08c7e3e7c56e68ada7815b2",
    "bytes": 36184
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/mlx.metallib",
    "sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
    "bytes": 131041909
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/preparation.json",
    "sha256": "f49ea420a6a10ee1631eac90fabfd9e3f4897ca30ad2816dfb4b78f463e42829",
    "bytes": 82709
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/probe",
    "sha256": "59a7de583644531bdce0e0d77912188ca484da8d753fa0c306c78eb868e15230",
    "bytes": 24934968
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/protocol.json",
    "sha256": "2a61aac9c0a3fc3497696ab018e7bf6228ba7b5675047eea508adf06fb2619f3",
    "bytes": 84579
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/run.memory.json",
    "sha256": "77399276b3eb4c126aeb887d305092edbf47c020ce8ed1d75184dc2b94d4fa3d",
    "bytes": 21167
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/run.memory.samples.jsonl",
    "sha256": "442e85f6ec4d69012c9b2a121c2f4de749d75558b098e648a353554f79deb57f",
    "bytes": 11063
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/run.py",
    "sha256": "4e792202d3f4687792eccae207b5a816f78093ecb3e5a8b2e5ed0ebb803be636",
    "bytes": 4767
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/run.stderr.txt",
    "sha256": "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855",
    "bytes": 0
  },
  {
    "path": "/tmp/slotstream-optimization-execution/compact-window-native-v303/run.stdout.txt",
    "sha256": "e9d49e1478b0334c6a00bd354fb0d7de1727293202df6e019567c85477c1dc35",
    "bytes": 570
  }
]
````

## /tmp/slotstream-optimization-execution/compact-window-native-v302/Probe.swift

SHA-256 `c8880a7f919d73b5a5a141cb784499ad33cc7bc53b5cb6309bbcb5f943f9b489`.

````text
import Foundation
import MLX

private struct ProbeFailure: Error { let message: String }

private final class Windows {
    var convState: MLXArray?
    var pleConvState: MLXArray?

    func compact(joined: Bool) {
        if let window = convState { convState = contiguous(window) }
        if let window = pleConvState { pleConvState = contiguous(window) }
        if joined {
            let windows = [convState, pleConvState].compactMap { $0 }
            if !windows.isEmpty { eval(windows) }
        } else {
            if let window = convState { eval(window) }
            if let window = pleConvState { eval(window) }
        }
    }
}

private func require(_ condition: Bool, _ message: String) throws {
    if !condition { throw ProbeFailure(message: message) }
}

private func same(_ a: MLXArray?, _ b: MLXArray?) throws {
    try require((a == nil) == (b == nil), "optional state differs")
    if let a, let b {
        try require(a.shape == b.shape && a.dtype == b.dtype, "shape or dtype differs")
        let x: MLXArrayData = a.asData(access: .copy)
        let y: MLXArrayData = b.asData(access: .copy)
        try require(x.data == y.data, "copied bytes differ")
    }
}

private func vm() throws -> [String: Int] {
    let task = Process(), pipe = Pipe()
    task.executableURL = URL(fileURLWithPath: "/usr/bin/vm_stat")
    task.standardOutput = pipe
    try task.run()
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    task.waitUntilExit()
    try require(task.terminationStatus == 0, "vm_stat failed")
    let text = String(decoding: data, as: UTF8.self)
    var result: [String: Int] = [:]
    for line in text.split(separator: "\n") {
        let parts = line.split(separator: ":", maxSplits: 1)
        guard parts.count == 2 else { continue }
        let name = parts[0].lowercased()
        if name == "swapins" || name == "swapouts" {
            let value = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
                .trimmingCharacters(in: CharacterSet(charactersIn: "."))
            result[name] = Int(value)
        }
    }
    try require(result.count == 2, "missing VM counters")
    return result
}

private func median(_ values: [Double]) -> Double {
    let sorted = values.sorted(), middle = values.count / 2
    return sorted.count % 2 == 1 ? sorted[middle] : (sorted[middle - 1] + sorted[middle]) / 2
}

private func parent(rows: Int, width: Int) -> MLXArray {
    let count = rows * width
    let value = MLXArray(Int32(0) ..< Int32(count)).asType(.bfloat16).reshaped([1, rows, width])
    eval(value)
    return value
}

private func timed(_ a: MLXArray, _ b: MLXArray, joined: Bool) -> (Double, Windows) {
    let windows = Windows()
    let start = DispatchTime.now().uptimeNanoseconds
    for _ in 0 ..< 64 {
        windows.convState = a
        windows.pleConvState = b
        windows.compact(joined: joined)
    }
    let seconds = Double(DispatchTime.now().uptimeNanoseconds - start) / 1e9 / 64
    return (seconds, windows)
}

@main
private struct Probe {
    static func main() throws {
        try require(CommandLine.arguments.count == 2, "expected result path")
        Memory.cacheLimit = 64 * 1024 * 1024
        var cases: [[String: Any]] = [], edgeCases = 0
        for length in [17, 256, 4096] {
            let pa = parent(rows: length + 3, width: 10240)
            let pb = parent(rows: length + 9, width: 10240)
            let a = pa[0..., length..., 0...], b = pb[0..., length..., 0...]
            let inputs: [(MLXArray?, MLXArray?)] = [(nil, nil), (a, nil), (nil, b), (a, b)]
            for (a, b) in inputs {
                let old = Windows(), new = Windows()
                old.convState = a; old.pleConvState = b
                new.convState = a; new.pleConvState = b
                old.compact(joined: false); new.compact(joined: true)
                try same(old.convState, new.convState)
                try same(old.pleConvState, new.pleConvState)
                edgeCases += 1
            }
            for joined in [false, true] { _ = timed(a, b, joined: joined) }
            var rows: [[String: Any]] = [], clean: [[String: Double]] = []
            for round in 1 ... 16 {
                let before = try vm()
                var times: [String: Double] = [:]
                for joined in round % 2 == 1 ? [false, true] : [true, false] {
                    let (seconds, windows) = timed(a, b, joined: joined)
                    times[joined ? "joined" : "separate"] = seconds
                    try same(windows.convState, a)
                    try same(windows.pleConvState, b)
                }
                let after = try vm(), eligible = before == after
                rows.append(["round": round, "seconds_per_compaction": times,
                    "before_vm": before, "after_vm": after, "eligible": eligible])
                if eligible { clean.append(times) }
            }
            try require(clean.count >= 5, "too few clean component pairs")
            let summary: [String: Any] = ["clean_pairs": clean.count,
                "median_separate_seconds": median(clean.map { $0["separate"]! }),
                "median_joined_seconds": median(clean.map { $0["joined"]! }),
                "median_paired_reduction_percent": median(clean.map { 100 * (1 - $0["joined"]! / $0["separate"]!) })]
            cases.append(["parent_prompt_rows": length, "pairs": rows, "summary": summary])
            let progress = try JSONSerialization.data(withJSONObject: ["length": length, "summary": summary], options: [.sortedKeys])
            print(String(decoding: progress, as: UTF8.self))
        }
        let report: [String: Any] = ["passed": true, "edge_cases": edgeCases, "cases": cases,
            "allocator_active_peak_bytes": Memory.peakMemory,
            "classification": "Native Swift array component using pinned existing MLX objects. No Slotstream model, runtime source change or serving-speed claim."]
        let data = try JSONSerialization.data(withJSONObject: report, options: [.prettyPrinted, .sortedKeys])
        try data.write(to: URL(fileURLWithPath: CommandLine.arguments[1]), options: .atomic)
    }
}

````

## /tmp/slotstream-optimization-execution/compact-window-native-v302/compile.stderr.txt

SHA-256 `0734ef0f3183d5d701d45bef0b35089b2ad06f56a630b9734c8c16c67e6a6038`.

````text
/tmp/slotstream-optimization-execution/compact-window-native-v302/Probe.swift:31:16: error: cannot find type 'MLXArrayData' in scope
 29 |     if let a, let b {
 30 |         try require(a.shape == b.shape && a.dtype == b.dtype, "shape or dtype differs")
 31 |         let x: MLXArrayData = a.asData(access: .copy)
    |                `- error: cannot find type 'MLXArrayData' in scope
 32 |         let y: MLXArrayData = b.asData(access: .copy)
 33 |         try require(x.data == y.data, "copied bytes differ")

/tmp/slotstream-optimization-execution/compact-window-native-v302/Probe.swift:32:16: error: cannot find type 'MLXArrayData' in scope
 30 |         try require(a.shape == b.shape && a.dtype == b.dtype, "shape or dtype differs")
 31 |         let x: MLXArrayData = a.asData(access: .copy)
 32 |         let y: MLXArrayData = b.asData(access: .copy)
    |                `- error: cannot find type 'MLXArrayData' in scope
 33 |         try require(x.data == y.data, "copied bytes differ")
 34 |     }

````

## /tmp/slotstream-optimization-execution/compact-window-native-v302/compile.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/compact-window-native-v302/manifest.json

SHA-256 `1a20b4c055af69f0b325907dd344bc2009c525406f200dd8e449b1c6c4e2f636`.

````text
{
  "passed": false,
  "protocol_sha256": "bf2fb767f143f189cb21572b4425d260f3ed0b43580d6f08116186a405dcfa26",
  "steps": [
    {
      "name": "compile",
      "command": [
        "/Library/Developer/CommandLineTools/usr/bin/swiftc",
        "-O",
        "-whole-module-optimization",
        "-num-threads",
        "1",
        "-j1",
        "-parse-as-library",
        "-swift-version",
        "6",
        "-target",
        "arm64-apple-macosx14.0",
        "-sdk",
        "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk",
        "-I",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules",
        "-module-cache-path",
        "/tmp/slotstream-optimization-execution/compact-window-native-v302/module-cache",
        "-Xcc",
        "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/module.modulemap",
        "-Xcc",
        "-I/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include",
        "-Xcc",
        "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/module.modulemap",
        "-Xcc",
        "-I/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include",
        "/tmp/slotstream-optimization-execution/compact-window-native-v302/Probe.swift",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/fmt/src/format.cc.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/framework/Cmlx.m.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/array.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/closure.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/compile.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/cuda.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/device.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/error.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/export.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fast.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fft.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io_types.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/linalg.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/map.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/memory.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/metal.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/ops.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/random.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/stream.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/string.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms_impl.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/vector.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/version.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-conditional/compiled_conditional.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/arange.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_ops.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_two.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/compiled_preamble.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/conv.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/copy.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fft.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_axis.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_front.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemv_masked.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/hadamard.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/logsumexp.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/masked_scatter.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce_utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scan.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter_axis.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/softmax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/sort.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_3d.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_general.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_masked.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_segmented.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary_ops.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary_ops.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/array.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/broadcasting.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/common.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/compiled.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/load.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/reduce.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/slicing.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/arg_reduce.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/binary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/cholesky.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/conv.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/copy.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/device_info.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/distributed.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eig.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eigh.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/encoder.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eval.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/fft.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/bnns.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/cblas.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/hadamard.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/indexing.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/inverse.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/jit_compiler.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/logsumexp.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/luf.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/masked_mm.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/matmul.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/primitives.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/qrf.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/quantized.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/reduce.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/scan.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/select.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/softmax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/sort.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/svd.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/threefry.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/unary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cuda/no_cuda.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/copy.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/primitives.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/slicing.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/allocator.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/binary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/compiled.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/conv.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/copy.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/custom_kernel.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device_info.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/distributed.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/eval.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/event.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fence.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fft.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/hadamard.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/indexing.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/jit_kernels.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/logsumexp.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/matmul.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/metal.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/normalization.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/primitives.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/quantized.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/reduce.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/resident.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/rope.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scaled_dot_product_attention.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scan.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/slicing.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/softmax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/sort.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/ternary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/unary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/compile.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/device.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/distributed.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/jaccl/no_jaccl.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/mpi/no_mpi.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/nccl/no_nccl.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ops.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/primitives.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ring/no_ring.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype_utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/einsum.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/export.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fast.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fft.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/graph_utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/load.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/no_gguf.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/safetensors.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/linalg.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/ops.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/primitives.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/random.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/scheduler.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/transforms.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/version.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AdditiveArithmetic.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AlgebraicField.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Codable.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+ElementaryFunctions.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Hashable.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+IntegerLiteral.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Numeric.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+StringConvertible.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Polar.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Scale.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ArrayAt.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Cmlx+Util.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/DType.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Device.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ErrorHandler.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Export.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/FFT.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Factory.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Foundation+Util.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/GPU+Metal.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/IO.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Linalg.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Bytes.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Indexing.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Init.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Metal.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Normalizer.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Ops.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+maskFill.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXCustomFunction.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFast.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFastKernel.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Memory.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Nested.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops+Array.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ParameterTypes.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Protocols.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Random.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/State.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Stream.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Compile.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+CompileOverloads.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Eval.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Grad.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Internal.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Vmap.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/WiredMemory.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Numerics.build/Numerics.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AlgebraicField.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ApproximateEquality.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AugmentedArithmetic.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Double+Real.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ElementaryFunctions.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float+Real.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float16+Real.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float80+Real.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Real.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RealFunctions.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RelaxedArithmetic.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/_NumericsShims.build/_NumericsShims.c.o",
        "-lc++",
        "-framework",
        "Foundation",
        "-framework",
        "Metal",
        "-framework",
        "Accelerate",
        "-o",
        "/tmp/slotstream-optimization-execution/compact-window-native-v302/probe"
      ],
      "passed": false,
      "exit_code": 1
    }
  ],
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 23594237952,
    "swapins": 44116164,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   723607.\nPages active:                                 779776.\nPages inactive:                               772371.\nPages speculative:                             14719.\nPages throttled:                                   0.\nPages wired down:                             215655.\nPages purgeable:                               19732.\n\"Translation faults\":                    15860734990.\nPages copy-on-write:                       777093546.\nPages zero filled:                       21762697310.\nPages reactivated:                        3568133375.\nPages purged:                               74749095.\nFile-backed pages:                            696739.\nAnonymous pages:                              870127.\nPages stored in compressor:                  1567482.\nPages occupied by compressor:                 577316.\nDecompressions:                           1198245862.\nCompressions:                             1515613636.\nPageins:                                  7813040462.\nPageouts:                                   11175861.\nSwapins:                                    44116164.\nSwapouts:                                   77536098.\nPages tagged:                                 174804.\nPages tagged resident:                        119571.\nPages tagged compressed:                       55233.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6911.\nPages tag-storage free:                         2222.\nPages tag-storage non-tag pageable:            89163.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8554624.\nTagged compressions:                        11571480.\nTagged decompressions:                      10665394.\n"
  },
  "error": "RuntimeError: compile failed; no automatic retry",
  "elapsed_seconds": 15.478840542,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 23603347456,
    "swapins": 44116164,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   716990.\nPages active:                                 773572.\nPages inactive:                               778844.\nPages speculative:                             20761.\nPages throttled:                                   0.\nPages wired down:                             216151.\nPages purgeable:                                4548.\n\"Translation faults\":                    15861044203.\nPages copy-on-write:                       777132517.\nPages zero filled:                       21762859477.\nPages reactivated:                        3568133539.\nPages purged:                               74750183.\nFile-backed pages:                            719096.\nAnonymous pages:                              854081.\nPages stored in compressor:                  1567437.\nPages occupied by compressor:                 577300.\nDecompressions:                           1198245907.\nCompressions:                             1515613636.\nPageins:                                  7813048914.\nPageouts:                                   11175861.\nSwapins:                                    44116164.\nSwapouts:                                   77536098.\nPages tagged:                                 174831.\nPages tagged resident:                        119599.\nPages tagged compressed:                       55232.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6911.\nPages tag-storage free:                         2234.\nPages tag-storage non-tag pageable:            89151.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8554560.\nTagged compressions:                        11571480.\nTagged decompressions:                      10665395.\n"
  },
  "pressure": {
    "command": [
      "sysctl",
      "-n",
      "kern.memorystatus_vm_pressure_level"
    ],
    "level": 1,
    "name": "normal",
    "stdout": "1\n",
    "stderr": ""
  },
  "identity_unchanged": true,
  "remaining_jobs": [],
  "model_lock_free": true,
  "within_reservation": true
}

````

## /tmp/slotstream-optimization-execution/compact-window-native-v302/preparation.json

SHA-256 `71450f9ee070a5b7fbcd8334bd2194a1f64720e075b0f0628e5521db0515c79a`.

````text
{
  "classification": "Prepared only: link one standalone Swift array probe against existing pinned MLX/Cmlx/Numerics object files, using its exact public eval/contiguous bindings. Shared build state is read-only; no Slotstream rebuild or model. No compiler or probe launched.",
  "compile_command": [
    "/Library/Developer/CommandLineTools/usr/bin/swiftc",
    "-O",
    "-whole-module-optimization",
    "-num-threads",
    "1",
    "-j1",
    "-parse-as-library",
    "-swift-version",
    "6",
    "-target",
    "arm64-apple-macosx14.0",
    "-sdk",
    "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk",
    "-I",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules",
    "-module-cache-path",
    "/tmp/slotstream-optimization-execution/compact-window-native-v302/module-cache",
    "-Xcc",
    "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/module.modulemap",
    "-Xcc",
    "-I/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include",
    "-Xcc",
    "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/module.modulemap",
    "-Xcc",
    "-I/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include",
    "/tmp/slotstream-optimization-execution/compact-window-native-v302/Probe.swift",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/fmt/src/format.cc.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/framework/Cmlx.m.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/array.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/closure.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/compile.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/cuda.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/device.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/error.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/export.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fast.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fft.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io_types.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/linalg.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/map.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/memory.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/metal.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/ops.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/random.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/stream.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/string.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms_impl.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/vector.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/version.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-conditional/compiled_conditional.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/arange.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_ops.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_two.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/compiled_preamble.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/conv.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/copy.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fft.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_axis.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_front.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemv_masked.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/hadamard.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/logsumexp.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/masked_scatter.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce_utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scan.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter_axis.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/softmax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/sort.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_3d.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_general.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_masked.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_segmented.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary_ops.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary_ops.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/array.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/broadcasting.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/common.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/compiled.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/load.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/reduce.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/slicing.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/arg_reduce.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/binary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/cholesky.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/conv.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/copy.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/device_info.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/distributed.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eig.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eigh.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/encoder.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eval.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/fft.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/bnns.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/cblas.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/hadamard.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/indexing.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/inverse.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/jit_compiler.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/logsumexp.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/luf.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/masked_mm.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/matmul.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/primitives.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/qrf.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/quantized.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/reduce.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/scan.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/select.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/softmax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/sort.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/svd.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/threefry.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/unary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cuda/no_cuda.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/copy.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/primitives.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/slicing.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/allocator.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/binary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/compiled.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/conv.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/copy.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/custom_kernel.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device_info.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/distributed.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/eval.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/event.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fence.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fft.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/hadamard.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/indexing.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/jit_kernels.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/logsumexp.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/matmul.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/metal.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/normalization.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/primitives.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/quantized.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/reduce.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/resident.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/rope.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scaled_dot_product_attention.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scan.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/slicing.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/softmax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/sort.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/ternary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/unary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/compile.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/device.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/distributed.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/jaccl/no_jaccl.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/mpi/no_mpi.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/nccl/no_nccl.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ops.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/primitives.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ring/no_ring.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype_utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/einsum.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/export.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fast.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fft.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/graph_utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/load.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/no_gguf.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/safetensors.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/linalg.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/ops.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/primitives.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/random.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/scheduler.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/transforms.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/version.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AdditiveArithmetic.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AlgebraicField.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Codable.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+ElementaryFunctions.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Hashable.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+IntegerLiteral.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Numeric.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+StringConvertible.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Polar.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Scale.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ArrayAt.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Cmlx+Util.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/DType.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Device.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ErrorHandler.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Export.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/FFT.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Factory.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Foundation+Util.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/GPU+Metal.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/IO.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Linalg.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Bytes.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Indexing.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Init.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Metal.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Normalizer.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Ops.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+maskFill.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXCustomFunction.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFast.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFastKernel.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Memory.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Nested.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops+Array.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ParameterTypes.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Protocols.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Random.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/State.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Stream.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Compile.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+CompileOverloads.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Eval.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Grad.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Internal.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Vmap.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/WiredMemory.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Numerics.build/Numerics.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AlgebraicField.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ApproximateEquality.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AugmentedArithmetic.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Double+Real.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ElementaryFunctions.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float+Real.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float16+Real.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float80+Real.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Real.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RealFunctions.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RelaxedArithmetic.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/_NumericsShims.build/_NumericsShims.c.o",
    "-lc++",
    "-framework",
    "Foundation",
    "-framework",
    "Metal",
    "-framework",
    "Accelerate",
    "-o",
    "/tmp/slotstream-optimization-execution/compact-window-native-v302/probe"
  ],
  "run_command": [
    "/tmp/slotstream-optimization-execution/compact-window-native-v302/probe",
    "/tmp/slotstream-optimization-execution/compact-window-native-v302/component-result.json"
  ],
  "input_identity": {
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/config.json": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/fmt/src/format.cc.o": "69b57112e757de7bdc8e54b30c64931878f8010d38645b687411cc7e4769d917",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/framework/Cmlx.m.o": "8d2a6aa100f8374ef2eb57f902a790cdf31fc451794c427772626789b8ebf53d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/array.cpp.o": "30532dd682b1dd98901b7136b5498aa2b3f585ddf471a8cbb0010c377f93bb5a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/broadcasting.cpp.o": "094105b96239c83ecb7b63a41bcadfeb5e353aad37a097f683c249846f42159d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/common.cpp.o": "3e015bc6b85e5fcaef89b1aceef3076bd583d99cfcd0ff5e7bf3783ae79d2328",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/compiled.cpp.o": "dd92575b42e05bacd571a2e71cce98d740cf5f8e334aabc9383a5c48ba4d4baf",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/load.cpp.o": "7a0ad74eb57c9d554d47436de8600a8ffa2a1b310b6ac8b68270d9717ea9cadf",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/reduce.cpp.o": "510cedbc33ea4f95a63e8dcace1ea243856d5bd383f06fab5d6b57551ca5005d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/slicing.cpp.o": "b4007ba488a292985e6bd3aef85d57f206913f6ea968786390b7df42122f21ee",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/utils.cpp.o": "5e3ca26c38e7bf64c12534597634c1b697b4dafcad73de76a7ca0a3f52f46221",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/arg_reduce.cpp.o": "93c71e348baa9417f4846aa16dc8f130b2ef9b43a25ea3a6477f6d305fdff51f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/binary.cpp.o": "fa8ac9a7bd26890d5c142d9087c5450919d35d70b6586b0c5251e43d633311d7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/cholesky.cpp.o": "7dc36b27e51f62083e2b7f4bc1e9fa9cce47cfef9ddff20e4adbeb57da03e7ac",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/conv.cpp.o": "983944123cd755502b17ccc19c62b1f8846b0bbd9fa0e09868d66fed975d7e2a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/copy.cpp.o": "f3f4d639e45322ed8fa7a695c522eedf910769f2dd7905d227a52b28fea5e7dd",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/device_info.cpp.o": "39219ce19e4f0799d12bacf4b8df4a782f1b32e317fbf70c9864d543661c033e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/distributed.cpp.o": "b9fcf46b6d7f1f5c2d36c53c6e06261fc81cbf160ee0dbe2bbd83ecb96ca0a52",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eig.cpp.o": "62275cf9a1d89f5006e113dd7755c445ee8a22fdf1b96acf9f94af6f8f813300",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eigh.cpp.o": "bf231d995580dc02111eeb008fb0f61e1bbbdd631da23e1c8f389ebe8c88bf39",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/encoder.cpp.o": "0c94ddb994b5ee98055adec38a5d9a5450a87afa37ccdb02d3c5abd5b5c1fcc7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eval.cpp.o": "25ef98ae757de3e6ebf37d347aa1080c09dc78534229dfeba22d6e711ad68a8a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/fft.cpp.o": "9eab5b584815f2b316e4cbf2a1b768e8e97f9a6ff43c9544a52050bb0bd01d4a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/bnns.cpp.o": "0fb568aa1ed325fdfedf4b55b249bfdf934e310affafd3c5ac4c97ab3fa462ed",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/cblas.cpp.o": "320ed54f47be3dbae3199ad40bc9757b8c499217a1eb0e4208adef585ba9c006",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/hadamard.cpp.o": "261e2c01b7ee56ee893f3c2822b548647165dd21f97734f8a90dfbeab15ecb9c",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/indexing.cpp.o": "7967a32dd7c90eb05c6d87176562e523a38d02d897b806fd28971ba85d1382b6",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/inverse.cpp.o": "cf6e877d03e0c88c0a04b5e418d3cf3ae367994e98b58f585528e280b0600066",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/jit_compiler.cpp.o": "0fff40492d0f7580aed7d33d956a5e689ae1699feeb839e2b81897f98a989448",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/logsumexp.cpp.o": "6d69ee2eb32c309016ae6d096b6cbf3293a9331d7cee202b1b8fa52ae88777f9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/luf.cpp.o": "f5013195c58933ed0f1051e379d3fc87e602b1eaaf525f3c50bce945101835be",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/masked_mm.cpp.o": "840c47c4604723685ed008beff4f06fe39a90e85ac23fee2c5dfaa573023874a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/matmul.cpp.o": "492f84fdb552c09db154d16964e3f5466ac3057e442ec06aef84f431ff964c51",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/primitives.cpp.o": "d3a63986e4b2d855ac04ed403c421c5d92fa185b5557fdecd0d017b3040de385",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/qrf.cpp.o": "b78b178631155b4c4d65cb7c7844c2c3bfa31810a90c8a01a9c5788fe53634e7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/quantized.cpp.o": "b72f9f8a853b8f65609d2c143f1e24d1b39d1b037d7d83ec317395f16d949fcd",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/reduce.cpp.o": "3ae45925724168989c5248740f71b0efacac0c09d0b35519c079b729bd0a46d8",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/scan.cpp.o": "f4dddd85556bfc6c731485f188de67055b14fb2ebda0dc4c739501104d8c37e7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/select.cpp.o": "3cf52f02aded5074e8b997264b0e3d60bc9689e300788f01077e4df0d57f6e1e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/softmax.cpp.o": "30211f19597d7190e96cdcc6afbc0e4961da57f08fb6e83d72010b296f44bea3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/sort.cpp.o": "86c1534bb8281a75ade0d6abb7c0db137c984ba7b1791a3a5ac192ff87f86c00",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/svd.cpp.o": "04f3530b8e6bac6a5626b65e3d825364306ec5348f021f3e1711879ea3d90a20",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/threefry.cpp.o": "4921c145891c984870dd36c35e62ca45bafeae04bb00ccc6143911020cace5e4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/unary.cpp.o": "53fc58746513684e02fb65ab8c8e2f3e20da16509552b698da9d4a6afdec36ec",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cuda/no_cuda.cpp.o": "9971b0432baf787d91e84a3f3c8ed090c9c9ca4443a98251f80e15953c9dc83b",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/copy.cpp.o": "81460d7667ba1a9c6e811baa48387a3a920b87abcd8ddc48a0ff5777e414968e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/primitives.cpp.o": "71adbff757b9e026bc36489d78745703fc65fea80a767d6e810ff73eab1ceb32",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/slicing.cpp.o": "bb7a3dd9573353b436b45fa51efcb667e9a4c9b47b35ce9bebdd7f031baf411b",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/allocator.cpp.o": "e5508ff87a20f70e3eee503f9a3b07b521cc0e60d037b1b987b48ae77026d4f3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/binary.cpp.o": "9cd85a428aa9743a6a29bbb132fb1cb81d444e6f6d5848a942c2ff1241aced56",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/compiled.cpp.o": "4325851791d3ace0c5068d2e9437027a27657b57e66f9066ff79621241d2fcb1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/conv.cpp.o": "1598e979b81e8c2a89f67f06b3da9918f4df42b91d04b2b3d54f130d2083cd19",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/copy.cpp.o": "a91db579e32e9015291980fc551829cc77311186225516d042775958060213e1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/custom_kernel.cpp.o": "5d4d3666204d80c0d2de59f9763e265249982b67bc77297f97e51ad482a2ed17",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device.cpp.o": "c1c60f4cdaffe5d88d9280d19902d4074fe5f82f18244f40dfb4447e7353a240",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device_info.cpp.o": "4c12633a5087f8827421fb49b32b6e6273738dfe049a1250e39753e2a28a7ea3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/distributed.cpp.o": "16e5bb9dd72728220db9ee51a6051f7b4959096160827bc3f93011355a0ca0c5",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/eval.cpp.o": "bdf73907297c2fa1456193f804d59fcc8376dd585a33fe9ae282dc56e2d9e051",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/event.cpp.o": "50d74143a646f2fc9f50c67839284c44aad33d935515b3da69092271385203f2",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fence.cpp.o": "2b4d0a1295ec5dd9c384162c018324c7802bac6d1c9303daf44546ebda41bc40",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fft.cpp.o": "b551b81ee77df14afbbe72634d2608d3e96fdf1366736ef284e41e32d8fc71de",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/hadamard.cpp.o": "0974711ec11870b1ad150943790720c0e631fe8eb9eb1c79582c01e7a6d622f3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/indexing.cpp.o": "faa5080a948116c233d81aaf320966d4e7bb7b656a1d2388f1c1e8a5219f1600",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/jit_kernels.cpp.o": "af2ecbf4d66440875b0a88cdcb3b8358f8f1e880dccb24f85b550dea264e9167",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/logsumexp.cpp.o": "da54f9598a0231412df05f2aeef92ca9e4f087873b1828bc6f69c8fcdaeec944",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/matmul.cpp.o": "c7796ce9482b2a704b33e4f7b2638dea5e966766967d0d914eaee87bf4a3b480",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/metal.cpp.o": "46e578871a16c846817587692935cb273c04aa4fa9714da6d3cecba5fb97cd77",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/normalization.cpp.o": "924f599b35ca7966cc9d373e7dc630be56ce15c81f6d69b99f5c896456df284d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/primitives.cpp.o": "001596eb7e84b5c536063c11bbec41127f2fe73fb1dbffd0c34c64fa84279ec1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/quantized.cpp.o": "e56dfeb00a71b33a92ad0adca4c77c50dde96fd5728dff3f3a745ce679831424",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/reduce.cpp.o": "348825f13897fc0b8898b3651c1d7699f66633ce34209f29170627c5196e13c3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/resident.cpp.o": "00d61a303d29bef50644a278f934f1d35f61a833aa86e852787d31a8a60686e4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/rope.cpp.o": "5786f1307ad2804ab51b0c9128a4c26a7aff4a9841d617f88b417e6b4b6d369b",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scaled_dot_product_attention.cpp.o": "1de1ccabb636bb34f960ad5bd0db3a7908776c90d3629babb8def148d7598da6",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scan.cpp.o": "1342ca678eeb32d2a30d42aec6f1a7ccf7c3243257482082ca5dfb4c9243d6aa",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/slicing.cpp.o": "161c81655b45ab8a49b6eccebf93e5b708aff3329b2a052acfd95048eaf9c0d3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/softmax.cpp.o": "9610229f541aa7690913a7d5c55dae6737355b01d880394f5411823cd231bd9f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/sort.cpp.o": "53e8642d013707e76c87e39f24c28c1d21d9ba4888a8e8ce96e3f69b64507f45",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/ternary.cpp.o": "902ce11bdf6dfd31307366eaba0f2e422f384219451fef8946b1b8fa0e83cd0a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/unary.cpp.o": "4ffcf1a6d35aea8944a16ded8a3d06755107ec63370f4a4ba33a2a02de08e021",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/utils.cpp.o": "dd8d8f7bcb267f34d0cabb64041a00cc2b1ba2f3b27233d838a42ecb85cfb207",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/compile.cpp.o": "31d77a9a2f8322f814cd049801fa8d08ce702a199ec57721384ccee56da356cb",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/device.cpp.o": "6a7694967ed507d4110d7b9cb1fb8c675a902d7d764e666edda0847ad3667d0b",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/distributed.cpp.o": "4c9c30dcad826ec9364be6cd682ff3bea28f89983102047ed0357847c1b3296e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/jaccl/no_jaccl.cpp.o": "f91c8ab3a155850f58f454f7fd3e74d5d4906ad4c06844e02a8784b38cb90993",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/mpi/no_mpi.cpp.o": "10acd6665cc6ffa3774a59e9cad4f0dfa6cd5c6ccc7fa0129535bb26196ac3e4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/nccl/no_nccl.cpp.o": "78b02e551e66f1dad92a837390fc2abb1b03f401379ae94fbc4e15cb6ed66a39",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ops.cpp.o": "1ffae794bbfe8a6081f9c30f607b214ea3a05a1b247b91a68a5e9ca51c611560",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/primitives.cpp.o": "904e91983ca5231004b1c2804163f13d3d195060fc1030bffa2f408c6e00ab8e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ring/no_ring.cpp.o": "91f20e70446d982d2dca77025afb663bacb742828bc447192b5db85772f7498e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/utils.cpp.o": "c06dad5aef245df0374b77fe859470192ab1fba6f08baff5f85d24eb34369106",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype.cpp.o": "752e9ddaa326f51e5a773630ee4ec00f2530fece516f8eda423ecec20d83f21e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype_utils.cpp.o": "75c4e22a9e754ddecfd15e27c090d5b203b71252857a7b57a08c9540c9eb2942",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/einsum.cpp.o": "9bcf39b825297d0693b166e8438a278eecb2420fe326496599284a9e80214d4a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/export.cpp.o": "2a875945b7038287583879118630a6e61e0e671eed596bd514d89dec4c62af30",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fast.cpp.o": "467740ae1d7ff52f5236c61ff17adab3d08bc1f70a62f5373c75c2a20188af71",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fft.cpp.o": "40b4ca3f8b31f41c63ce8de86f3ce7a1c436b2a47b5ffa3ad7641190fc087ed7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/graph_utils.cpp.o": "40aaf25251ac61ef630077d30239658b90d71d3ce8695bf759b15bddd6ed92ba",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/load.cpp.o": "7451aea7303c2fecf47d5dd039ba472404476983498a715b41c48df61779b25c",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/no_gguf.cpp.o": "b59154f0eb9c18a0ce9b79b7643d6ba02fe66db70c1a19c82ca12a28b64b4553",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/safetensors.cpp.o": "7d548372aa0fe038f21f5ec2b4767b791adc7f7b1494b7330257956ec27b198a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/linalg.cpp.o": "e116159469fca5e577781afe2d1b83ca3656fbc17c67996d1947b823e2d35e4b",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/ops.cpp.o": "d8abe4e0a86579557e63b0ed3caea13452418a295397b82ab316d3b7d012d76e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/primitives.cpp.o": "95b26346c15aaf75c3e1a74fca01a29b72a226cb241dc97ef1b7185db22893cb",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/random.cpp.o": "43f40f0e32d29fab03f12f440bdaf0717121924c25709fe05eea7cc0dbdcb912",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/scheduler.cpp.o": "709e224da58c4a77d5293bf6c4cc744053209d882d21a3098b0fbb43ba894efc",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/transforms.cpp.o": "583e831e8b986e7c4b27099a143294d05f939360199bed62e0c3202f9c96135e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/utils.cpp.o": "1bd46f6631148b3339cf4d9b466783b70a51eca1da1d1b25b31217949e8fe0ce",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/version.cpp.o": "025f08fa0c53c11869f1d012af2b827c6c496b2251d7b9535757865768136aa4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/array.cpp.o": "01a92229642efd1157f90ccf8f499f89bdd5b82f7d020e06ecf94f9666283d5e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/closure.cpp.o": "d269684eb5d2ab380b7f74b6284fca58ce8944cb62e24173a2cef1aad52bab07",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/compile.cpp.o": "af172d64e2dcbf9b26f792f177720826b12e2365f203d5d8dc1c795db8631cb9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/cuda.cpp.o": "4b320306a09a5c2f9dd39c5354fc159a507a144ac99ffc849d4a4f066c2b06c8",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/device.cpp.o": "55d839ec45ee10e70327d79416a7be04b701aba23b5c818b491c1fa4efb8a856",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/error.cpp.o": "d58d2e5c86aa3849a68dd2911bf9ec895ed6fc5208a73024ddad20f0600d14ec",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/export.cpp.o": "363470b9989c7cc436972b18e98d6e2e8a908a2c18a7fefc15e0dd9f3cb2f36d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fast.cpp.o": "31dbf96cbecbcba2d537b387f9cfc55f5ce67f6bfca12c08f7886da229cd3f99",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fft.cpp.o": "ad8e1b293605c0fef89e3cdb5eb50947ef7054805c0e959e1573072d1c2db51f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io.cpp.o": "15a27b007732de44544b5959dd5cb88bea03a29f9148bd2d2463efcede5ecb59",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io_types.cpp.o": "a79671c8bd19c68c8485a498494e260509601b0ff388f52ab7c80ee773852d3f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/linalg.cpp.o": "7fdb0203c67ece5e4d186eebdb66df578d625dd295eb440e8be282dbaa7f7f9a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/map.cpp.o": "f09a6ca0a96e0bbab5c26e20255acdb9bdeee407271e34aec10fb229389ad472",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/memory.cpp.o": "825ac3b57ba0e5809e142051c7f7f7aaab59f7dba7b7ecd46db3dcaa7d2270e6",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/metal.cpp.o": "3a7f4e24bf8c598f25e206b1d8352d717929b470ca03cdea64b5d43580289ab9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/ops.cpp.o": "c681b92007d98636fb56ac734fbc61f1963dd66dda0077ba70d6c97ebf77d9d4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/random.cpp.o": "456279b00802d4ed4b219f095199cd3b675a5a1d6a2e0ade59c5d043f323a7b6",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/stream.cpp.o": "b4f1cbb839d1d57222cfd661c0649a972a0be72985c3b96aa385f675b4cf5562",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/string.cpp.o": "5977dcf157e4d7cc70dc7751691b21838c4a3e23ff718323840bfde20913708b",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms.cpp.o": "c0e342605cc3fb8bae0923c546b449ce2a14c201b6e74676c191e56a3a1bb399",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms_impl.cpp.o": "c60c9ddd0bff9d7e7a54002a6f4ff9e1812f7aaf0665f5a29279d1889199c802",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/vector.cpp.o": "f0f1532531493b9fdf188c4c6e215672e5430de8f5a4ff477f682083c9ada45f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/version.cpp.o": "6a1a24dbdf93764a8bc13ee7352c19f38ab606185bbe67711d27025d0c39e284",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-conditional/compiled_conditional.cpp.o": "af7ce0390e74eaa18614408c91e692fee4887b2fcfb69c1eea3a781f2c903b81",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/arange.cpp.o": "3c9a2b2caac2bce7cbff8b998c66666a55ffbba3d6cd78c47d703f8f0a3b2b43",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary.cpp.o": "e23b144678ac3882051fdea71b2db0dfa8bfd6c0bcf5b90421aa326d2ec161a0",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_ops.cpp.o": "0820b0eb53d379983d9f797527f1bc3320361a1a94ba0ea784e9d4b3d8e974ad",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_two.cpp.o": "bdc0a4f184ae160cf9469acc0560608536a2f71e127fa2afdfa32e9f7798f964",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/compiled_preamble.cpp.o": "851065037d02bffeb8f76fcc71b996d7855b3a536a559ceb49655370d8725251",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/conv.cpp.o": "8db83fdd392a3b85a76d20468a3e8eff56056b68476fbbf9b4eafc2323614ab0",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/copy.cpp.o": "fb6a86580681b44610db9e0263e79cef61f83e8bd2aa7813d6a22e81cd0523ce",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fft.cpp.o": "3659fe8f05ef5932e5f9d9460d2f589974c5b738e8573d2ac968f80dbd383b0d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized.cpp.o": "c944fd234df46a3061f51c60b70972864058b05b6dc36f67d42c33e953399f1c",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized_nax.cpp.o": "8b5f62fa53145a060531af2f19a9ed5fa9f04c195371e47f1f2249d866693fce",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather.cpp.o": "18f727f2638c178c9b67a9736e862a7b950644bf8e637489718da38498f0fc09",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_axis.cpp.o": "e691bd82ed1d1b358306be221c913d87f2d2a3cb925cbbd0fb1171386a745667",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_front.cpp.o": "0b2a408e7fd6d9ee9e307d7103cad98192640bc3014012bbbdacd371a8f200fc",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm.cpp.o": "79bbcf2abdb0e9e45f7adbde37811be39c1eeee44747b4b9383e48baa345b539",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm_nax.cpp.o": "c4b7b788b5b13c9d661ee09dd3c6d52edadd761509eceb100a4339891f9a5de6",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemv_masked.cpp.o": "c6bd288c241bd0735c2721f47cd96a1cddc13672292b50b246ab25fcc4ec1561",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/hadamard.cpp.o": "1a6def72c5bd7ff49a5ea9120787bef731eb1a5d7ef96e42c4245f29b638e428",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/logsumexp.cpp.o": "0970e2ee305242d8cd764567716f6c44631e6b5d9955182a304b8caaa1182d16",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/masked_scatter.cpp.o": "5a8759be17dfc581de12977430fa0f879efc3f4b17b9c19f2af19e5cd615f462",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized.cpp.o": "1e0c182c80e558756b9f39cb3c7dd89ea5730f7faed63828f448531677a625a1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_nax.cpp.o": "257190e7d703f137372d47c373c5536caa7a6a066e2c2d77074ca324d06f28d2",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_utils.cpp.o": "6d2eb0e880fbaca30508971421d725f60679b67a300e45d6bf9cdd86a86215e3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce.cpp.o": "913d0c1e9a26c88aacce7940eff3db218a43d4cb4a1ef7af928a019f1d23d57c",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce_utils.cpp.o": "9c037b06579d5a903aea93c02de5fe35be08f004e320911bdca260e93c9dcbac",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scan.cpp.o": "9422c9ed3ce356965fa1f25af419835201bd32301e2775559c4801b90f729d20",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter.cpp.o": "9303de749ea4b01d183a64ef286334059189e50dfb7a784a53af62aeaaf83b15",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter_axis.cpp.o": "715aebf787d11add63df3f517227c7b690eb7c78d49a2d061fe9edc4a143ad84",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/softmax.cpp.o": "0fb0269673db54b5dd17c59cbf23eb689e94be76958d6a846e8a9eba3d50b792",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/sort.cpp.o": "4e3d7479625da6d164d62a9ae9d8477292a6dec121473e1ac9f188bae63cb248",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention.cpp.o": "6b182f3a2d81a8491a172a919c9acfc7ee568861128a1da040b37b3b1c1f0a8e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention_nax.cpp.o": "c4835e907986c4a184c34c3a5cfc85cd6b2325eba66f662cfd56f6bc0b459c20",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv.cpp.o": "1d1baecd95c91d9481fed8ce793504bd9c84f7281f3e4805c71963da5bb115b9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_3d.cpp.o": "762d30a49c39ebceba474a81090fcda2e9670e4767a395c1a53ca04f01e202b4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_general.cpp.o": "97479dd7f25ef087223d7f8b61ff71119097412a44ed833e9e37ae4d99686755",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused.cpp.o": "e09aed537fce301eb05893442c65e0ff638ef4045d831d0e40f4f2b5621451f8",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused_nax.cpp.o": "d57df12d7db01db6d26cbb6447594d29b016f9b24f84eb930ca44275d100b74d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather.cpp.o": "49796b962b48a84dd743dcc6b610c7b01da199c55109a228fd348d08c2b16622",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather_nax.cpp.o": "da58927f75a52e5b360e4a77c7efdc5669168730ce34cf6cb2f2c36775f278e0",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_masked.cpp.o": "e1bc2327eb2a4386b0b064400de87965c9efb96dd490cbf71b4d26cfb4aeb9e5",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_segmented.cpp.o": "f9656b7d816fa173636d75cb0b0c3ca7de1d6bde6d447bc6b5fba07b8fe8274a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk.cpp.o": "e5f8b52754a5ac642c35af0bb52b4b735f94a8b40d1f362414653e1d4e864cb3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk_nax.cpp.o": "9440bdef84a191f36dec6122aa42769ec9dfc813732f31b14c3f1b818f3e8e44",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary.cpp.o": "fa8c7251c79a1f93bbfa933913e09ffdcb850867fb6e91567d8b30a7db7927fa",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary_ops.cpp.o": "23cc2755bf280a5edffc3050ef591016f32082611bf4292c110dde4a8b058dd3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary.cpp.o": "79e1d8824408bd5ddcad5b51484b322fc327ec08fde04fd53d6bac8d6ac974e9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary_ops.cpp.o": "618b447a12b5243470c955832d5864ba52835b79207168b64569bd34fc19a112",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/utils.cpp.o": "6e777139be46bd4cdfe9a8ca0e04baf55e915050b05c5658063db7b491cd32a9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AdditiveArithmetic.swift.o": "a69d464f901e019c44155221cd05f132384ecd2364c883aaee5486690f507011",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AlgebraicField.swift.o": "eba8a96b7796b6c6a193541ee01ec68e60cdcbce0292f28734ef864eb633b3eb",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Codable.swift.o": "72d6dadc294a92ac8ea8f5d7d77968b5003bdfaca2497fc78aacefaa294a888c",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+ElementaryFunctions.swift.o": "7409e952a8b103cd377ecd1c977f3f080a822f5dc3683bcc59aa65c4f3971155",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Hashable.swift.o": "1bc1dfe97bf8ea0bba48b999e4af7d1550c91599ea10d1dabeab79e7fe279198",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+IntegerLiteral.swift.o": "ce1349ac92d903eaa8b2f6dde3b08905fca22ee2108bd31fd560d2bc8e2d5ef5",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Numeric.swift.o": "6cd53c41482fa9f2d7bad46ef12e332a1881aa30e91cb4178bbed7184d5691b3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+StringConvertible.swift.o": "423f0543333749762d29516681ca5655108dc5e3ddbfc62ad3525f04eafbef43",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex.swift.o": "094f21373bb5a36434dc7dfabf19460def2b00e4aa13b07edbb333fc3b42a402",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Polar.swift.o": "6e625e79d1d2d1c24a42f75c5b63787577cb13555b186262fa600756d75b329f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Scale.swift.o": "4f16291134816209e2cdf307ca427ee47235ed9bf8982d04cdd96107b6b864b1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ArrayAt.swift.o": "84bab294a10b59ffd284b93a8455bd5bf3630277d4cf333e466b2cf87bb8b947",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Cmlx+Util.swift.o": "75a521939250f35f390be134af117e9dc61037dac4ff0ade08bf92218e57d44f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/DType.swift.o": "34d20175e0524325677bc8103616c91958fd1e091f8bde75280a6ec8d89eb862",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Device.swift.o": "6b97d288b86bdc27716b7e6e465bf5b9d1f433c73ec72579cd9316ef2409cd25",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ErrorHandler.swift.o": "0e1e2cd69f22360b7eb04c125f8482a112aeb9005dae66ea4fa24da58191e034",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Export.swift.o": "0b8ce025fd5c396b85b6eb5656914cda0867cabf133566e3c025193931084694",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/FFT.swift.o": "16e41f83ec533894ebef784632a6e98091bcf00d405dde82be85de408cfa5f00",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Factory.swift.o": "9f78dcb9a23c76af2543ac28d0e57482defc000f13f577678c0290e713c185ca",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Foundation+Util.swift.o": "5ea528aec5edd6469e4b7568feda26efb3c87d93d143ad6a2cb177e5a34fb0dd",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/GPU+Metal.swift.o": "02546f4b66d6fa35f0923ff2deffbefb4011910b02010e06ecdcdc7086052d53",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/IO.swift.o": "82a3dc942750f611910c7a29814e4de7c8695ab1921dfaa649303921db9d907a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Linalg.swift.o": "ba47eb93a185956f080a648a6cb06291d37fce67ac4937641deafa2c15879a9d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Bytes.swift.o": "00af9ffbf607691fd965bf6fec0107e17bf2ed1d6f91380f5e64320fa3ae1ec8",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Indexing.swift.o": "751d23d270550cd969ad25d21c290cca64d0f0a0845d7caa2345e435f9b724f2",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Init.swift.o": "3140f413206c893d1fcd17696ac084c97ccce4e7adf852411f1a5088d9ac8650",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Metal.swift.o": "05716b0f8e1853c064ba5d4e0fded0ec3b59916f85e4d74035bdd41b6c3c83d9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Normalizer.swift.o": "a21f2b51fe66070988772fab40ad497bd72be568910cc687a682d18688c8a313",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Ops.swift.o": "1683fd5a0775f73a1ff3521223cb5e4f0233aec23e8e17c3d2dc3cfa51437c53",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+maskFill.swift.o": "e1b8c30e04e04c4992da6641366faafda3f7955c5585d657f76d6b86254b2ec4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray.swift.o": "347c54a948d9e138645a054f9d20559689f46cb9e1927d39444337590a1b71aa",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXCustomFunction.swift.o": "1b4bb8c2f4250409976b23ff07cff414af7d42a3f393092b5eb9162c3a3996ec",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFast.swift.o": "6f9fc8aa1edd0becca15af2b61aef439a86bd4e2c7c566aa7d4d30f1d9d092dc",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFastKernel.swift.o": "632e246c233c5d19044c7d4fb3924e22c72065666269759d4363b8808c1f79f1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Memory.swift.o": "cb08bae8b9c96cb709cb4676bafa146da99c7b0af179454a9cbe4a0cac6af30a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Nested.swift.o": "ee31ff1c33d3e19e0b7a66a77c80b7fc39ab731f2665f9e25c009f5c317b1c95",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops+Array.swift.o": "526cdf83159dc6010b02261cb0d36282259c8d194cd4a88fc9714588b9932238",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops.swift.o": "a0fc7cc1a71eb0d0413f7cc0ddc017dd4fabe257bd1a2fabb62f0ed0fe979ac6",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ParameterTypes.swift.o": "e0ccf750d81190bfa43cec7058f0effe35754ab29faea583d49078722988df3f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Protocols.swift.o": "d8baa0e2bee717fcf6bd2699be6faaa5f686729564bdddeac02708841ea4bf25",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Random.swift.o": "88ec4d44977072165b7dbd5940ac089980803d2c531acc473c6e1148c3666ee7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/State.swift.o": "1880591bd2dd331b8f03949c86477ad33479bbeba7d7558aa36f48d4c813b490",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Stream.swift.o": "f5b3a513906807e6a1f0f7b0014ee8b5251baf5850efe2f87ff84bd67da2487d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Compile.swift.o": "8e91ad773c18b6c9feeabd42927672078f710d9563d1f03e89a7e17957dd9baa",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+CompileOverloads.swift.o": "cda378a0ed311d80cc5737ae31214e54c2d1123621a065b1b2e2c0ffe84f4f96",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Eval.swift.o": "60c49bea3adbb72d494cb23d5b018483ab7632856c6a0ac666039398bbffb4d1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Grad.swift.o": "fc199078c7e6cc48f238ce0dd5125a3615f757880192a34787980fb8a77e4dd0",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Internal.swift.o": "13abc5004d3f85cab008f940bbf7447b5ec26fd68926b58cbbfd12854c370463",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Vmap.swift.o": "f3b88c8e08d1c5c545fb5054513b64f6834806d35b2e395098ce8052a04be795",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms.swift.o": "a09e4bc4bf57fb13c636ef51c5641669b0fe6d3fc7ed21e48e607a0389ffd80e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/WiredMemory.swift.o": "9aa95a6e85e822e4160571214b0d4baba24a9db51bc4cb7de0b5959d4371b9aa",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/ComplexModule.swiftmodule": "f4f78bc6fa741850deaf7da3f213909ae6ba0ad63404a8271344497db0af2a61",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/MLX.swiftmodule": "07ffbc362911aa40f89a820dd526cdf3c1c27764f6fcfab035b71aeb08d31984",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/Numerics.swiftmodule": "b855c0df442fd2baf4f82dd412ca1a844f8536c3069ebf72d8d2628c38c5d2b1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/RealModule.swiftmodule": "7674a92e29d5d93f24a30891fe17ea92eb2ef3eb20008c7aef67bcf563f1b8f7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Numerics.build/Numerics.swift.o": "ab18464a9dd302ea47951c15ad6f4ac874bc5135f0510d01ff9003e122a73d45",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AlgebraicField.swift.o": "6824cdc8fa1e064644fba63d549b948ae7747126e73e82d5be36472d6200d706",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ApproximateEquality.swift.o": "c8faac7ab4ce7ea0de7de3171c4a5943902f32e39a3f16a0e4bd64264bbb3457",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AugmentedArithmetic.swift.o": "acd82faee4a1033542ff9d13f3cd48505cdb56f2c007cec92fcf6cd3d7008b4e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Double+Real.swift.o": "de2a8401e56ff115a990ef6665b1c8e55b47a05ee72dd07f8a0264edb22fcc1d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ElementaryFunctions.swift.o": "ca595b82373d61a316003b9f6d83b88a4e9d5f2ec19b00d230a4785698789ae7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float+Real.swift.o": "be994cb74388a175f7af2c4562168a9a3e72e9cfd8fa7a6ecdfeef24e0bf3c0a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float16+Real.swift.o": "db8b057cc6aab3d803d85903afec2617a7a4ab5839b759f3c5854d4942a44631",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float80+Real.swift.o": "85d5fe5d368547fff5c594292cd23a1eea5a3dc367f15c13453a3574771fab12",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Real.swift.o": "83d203a7c0aa3b5a70ef26971be2ad0e8e7273d8d3783f1761018560506b481d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RealFunctions.swift.o": "4ac89fe2bdbe467a897695b111a83aea078bc13df5743222e69a845cb6382391",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RelaxedArithmetic.swift.o": "4e5565a2d8ff2ea6a2dfda6565f0a508328b9963f2e40f5e76b67ea36181eb48",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/_NumericsShims.build/_NumericsShims.c.o": "b2e808dc4875069f768072c7800ea6ba8b548f9a222478b3e07f069b4d17f120",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/array.h": "d2205ba0ce146ff722f2ca97c170facb19b28784e7ffa47a07cdad69651c9801",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/closure.h": "b43a6d7c0e943a8df0f67377d49d92f4fa76eea79eed049adaff80e05ed854f7",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/compile.h": "448c6aafe37d52c82f63311a8ab3e1b876f7b0d7fcdc250d91a0ac1105a4b531",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/cuda.h": "ee99d74dc4131dca3ec7ab7d9015ff109481ee6fbcf3c015de7ebfdcc7df2644",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/device.h": "3e7556aab2f97fddf943b8f6e30b62064ee589705ad1643716bdd7ea37d6fe2f",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/distributed.h": "68b1dcbdc8dc8c1b4d58220caa7aec2396776282691e99999ff6547b52f7e28e",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/distributed_group.h": "26334e23cabc877a77a85ee212f8c498f35ae9426036b99957a106afe28a0c0e",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/error.h": "80090e79eb9add61961885e7aa491b9f47d1b838d188303734490e528b0db2c2",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/export.h": "723346c34761fb87c9a03a133ecff8f9fd8f83a3d80e680d63557c58739e11c1",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/fast.h": "b24116ec6a5558e976cbdb14474c2e8f88710bf68f7cb5da02d5ba3fa4b385be",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/fft.h": "21a73e39cb7a8f3a69590fff88017f524ff0a9761027c9bf0441f97afb88ffec",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/half.h": "90d57285c4b8436fbea18758661e84bf962c13179d545bbaac52b176de899ed8",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/io.h": "3a076e00fbfbec9d45160b61695e19b72377389cde4d79e0a317cc58abb2a4bd",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/io_types.h": "892e3108eb50b8414091b67d01241ad6b1ccd815fca60cdc707e5e96dbb226f6",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/linalg.h": "10512f19bfcf3f1f6ed9e3de07d43f84dd3492833e7b0ab6e0288ba552f73266",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/map.h": "4d5df4eef2757ca76b83dea06935568611d439ad3a8687c3b0df739902377a4d",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/memory.h": "850ae0be9ac300cfae23ee259441dca2a1e2055606427ac26f3d967b5c03a6e8",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/metal.h": "58ebd8b50add425f046d5fb5ef1bc747eff347b79db8a2b01f6af3967435b8be",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/mlx.h": "aeb941792b77d0de4101d3299f8f24bebfaa478965c466151adbf02702249c76",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/ops.h": "d540165d1321768a4039d0d436e004959e197026b6f9ec964730e3a03746d586",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/optional.h": "b0f20e24bd02cba4c2f624cd83f68a096a9d4ae6b2e4c4eb30d13719660ecf36",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/random.h": "7b21eea9c4b0b19636365b114f36d54ed1e534d9b353446b37aae8f9c3ef4df3",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/stream.h": "560e537e50cdc313c6651ab55e9a116721c591efff778de7b293440ee39cabaf",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/string.h": "29b3cfafb60b536a27c2ad96f9868c892e9242754868e1b770f55b7cf34ef598",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/transforms.h": "2cf31bbda041fdf60a83243cff2f9d000cff148b153f406158f8e77ff2072ceb",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/transforms_impl.h": "2700a13d26aa07339a815b4762b74d9bd6ffa0a9a21298be828ca367b5817701",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/vector.h": "b75108edace10f99f01da0dcb08a146d1449dcfcaaa24aa7b66e48e9f227e2c7",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/version.h": "d1c9aecddd98ad6c16b7c56c056f5b1040a633c4548fe97297481fd625450810",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx.h": "c9c79beb34545869213b31a290d159ba61afb7792b7500ca5f43d60d6b861474",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/module.modulemap": "a97dea631e9b7fa3b130b39f88b947d521e67e1ba5819e90b194abbe84a372d8",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/MLX/Memory.swift": "cb6976cc37aa3e8a0fa1be8269fea2869ecdf5951e469556f67e21604b1701f8",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/MLX/Ops.swift": "f79d9e5032b32cfee1744d5371a62a554be2e39c8a7165b4b022cbc4d4a2609e",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/MLX/Transforms+Eval.swift": "14b867c903be78547b426305257ca70e214b7b854acf1c0dc2cf7c82333f4999",
    "/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/_NumericsShims.h": "361bd79467ead784ac39b7f187895f996e149d017a7270dc590d01ffa0037b3a",
    "/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/module.modulemap": "c97db16dd177b4cee16673108b1dd2703d5cba99132ae45e16e4c0945941d8ed",
    "/tmp/slotstream-optimization-execution/compact-window-native-v302/Probe.swift": "c8880a7f919d73b5a5a141cb784499ad33cc7bc53b5cb6309bbcb5f943f9b489"
  },
  "object_count": 243,
  "module_version": "0.31.6",
  "metal_source": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/mlx.metallib",
  "metal_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_sha256": "c8880a7f919d73b5a5a141cb784499ad33cc7bc53b5cb6309bbcb5f943f9b489",
  "protocol": {
    "parent_prompt_rows": [
      17,
      256,
      4096
    ],
    "fixed_pairs_per_shape": 16,
    "iterations_per_arm": 64,
    "warmup_batches_per_arm": 1,
    "minimum_clean_pairs": 5,
    "replacement_rounds": 0,
    "byte_equality": true,
    "serving_claim": false
  }
}

````

## /tmp/slotstream-optimization-execution/compact-window-native-v302/protocol.json

SHA-256 `bf2fb767f143f189cb21572b4425d260f3ed0b43580d6f08116186a405dcfa26`.

````text
{
  "classification": "Compile/link a standalone native Swift component against243 pinned existing MLX/Cmlx/Numerics objects, then run48 fixed component pairs and12 byte/optional-state cases. No Slotstream model or runtime source change and no serving-speed claim.",
  "deadline_utc": "2026-09-07T13:54:00Z",
  "preparation": {
    "classification": "Prepared only: link one standalone Swift array probe against existing pinned MLX/Cmlx/Numerics object files, using its exact public eval/contiguous bindings. Shared build state is read-only; no Slotstream rebuild or model. No compiler or probe launched.",
    "compile_command": [
      "/Library/Developer/CommandLineTools/usr/bin/swiftc",
      "-O",
      "-whole-module-optimization",
      "-num-threads",
      "1",
      "-j1",
      "-parse-as-library",
      "-swift-version",
      "6",
      "-target",
      "arm64-apple-macosx14.0",
      "-sdk",
      "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk",
      "-I",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules",
      "-module-cache-path",
      "/tmp/slotstream-optimization-execution/compact-window-native-v302/module-cache",
      "-Xcc",
      "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/module.modulemap",
      "-Xcc",
      "-I/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include",
      "-Xcc",
      "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/module.modulemap",
      "-Xcc",
      "-I/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include",
      "/tmp/slotstream-optimization-execution/compact-window-native-v302/Probe.swift",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/fmt/src/format.cc.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/framework/Cmlx.m.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/array.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/closure.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/compile.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/cuda.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/device.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/error.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/export.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fast.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fft.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io_types.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/linalg.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/map.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/memory.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/metal.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/ops.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/random.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/stream.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/string.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms_impl.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/vector.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/version.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-conditional/compiled_conditional.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/arange.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_ops.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_two.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/compiled_preamble.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/conv.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/copy.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fft.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_axis.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_front.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemv_masked.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/hadamard.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/logsumexp.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/masked_scatter.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce_utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scan.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter_axis.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/softmax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/sort.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_3d.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_general.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_masked.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_segmented.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary_ops.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary_ops.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/array.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/broadcasting.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/common.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/compiled.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/load.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/reduce.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/slicing.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/arg_reduce.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/binary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/cholesky.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/conv.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/copy.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/device_info.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/distributed.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eig.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eigh.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/encoder.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eval.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/fft.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/bnns.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/cblas.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/hadamard.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/indexing.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/inverse.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/jit_compiler.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/logsumexp.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/luf.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/masked_mm.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/matmul.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/primitives.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/qrf.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/quantized.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/reduce.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/scan.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/select.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/softmax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/sort.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/svd.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/threefry.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/unary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cuda/no_cuda.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/copy.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/primitives.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/slicing.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/allocator.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/binary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/compiled.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/conv.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/copy.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/custom_kernel.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device_info.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/distributed.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/eval.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/event.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fence.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fft.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/hadamard.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/indexing.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/jit_kernels.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/logsumexp.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/matmul.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/metal.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/normalization.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/primitives.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/quantized.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/reduce.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/resident.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/rope.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scaled_dot_product_attention.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scan.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/slicing.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/softmax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/sort.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/ternary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/unary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/compile.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/device.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/distributed.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/jaccl/no_jaccl.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/mpi/no_mpi.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/nccl/no_nccl.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ops.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/primitives.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ring/no_ring.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype_utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/einsum.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/export.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fast.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fft.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/graph_utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/load.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/no_gguf.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/safetensors.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/linalg.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/ops.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/primitives.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/random.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/scheduler.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/transforms.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/version.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AdditiveArithmetic.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AlgebraicField.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Codable.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+ElementaryFunctions.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Hashable.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+IntegerLiteral.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Numeric.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+StringConvertible.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Polar.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Scale.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ArrayAt.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Cmlx+Util.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/DType.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Device.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ErrorHandler.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Export.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/FFT.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Factory.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Foundation+Util.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/GPU+Metal.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/IO.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Linalg.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Bytes.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Indexing.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Init.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Metal.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Normalizer.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Ops.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+maskFill.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXCustomFunction.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFast.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFastKernel.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Memory.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Nested.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops+Array.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ParameterTypes.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Protocols.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Random.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/State.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Stream.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Compile.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+CompileOverloads.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Eval.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Grad.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Internal.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Vmap.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/WiredMemory.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Numerics.build/Numerics.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AlgebraicField.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ApproximateEquality.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AugmentedArithmetic.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Double+Real.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ElementaryFunctions.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float+Real.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float16+Real.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float80+Real.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Real.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RealFunctions.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RelaxedArithmetic.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/_NumericsShims.build/_NumericsShims.c.o",
      "-lc++",
      "-framework",
      "Foundation",
      "-framework",
      "Metal",
      "-framework",
      "Accelerate",
      "-o",
      "/tmp/slotstream-optimization-execution/compact-window-native-v302/probe"
    ],
    "run_command": [
      "/tmp/slotstream-optimization-execution/compact-window-native-v302/probe",
      "/tmp/slotstream-optimization-execution/compact-window-native-v302/component-result.json"
    ],
    "input_identity": {
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/config.json": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/fmt/src/format.cc.o": "69b57112e757de7bdc8e54b30c64931878f8010d38645b687411cc7e4769d917",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/framework/Cmlx.m.o": "8d2a6aa100f8374ef2eb57f902a790cdf31fc451794c427772626789b8ebf53d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/array.cpp.o": "30532dd682b1dd98901b7136b5498aa2b3f585ddf471a8cbb0010c377f93bb5a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/broadcasting.cpp.o": "094105b96239c83ecb7b63a41bcadfeb5e353aad37a097f683c249846f42159d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/common.cpp.o": "3e015bc6b85e5fcaef89b1aceef3076bd583d99cfcd0ff5e7bf3783ae79d2328",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/compiled.cpp.o": "dd92575b42e05bacd571a2e71cce98d740cf5f8e334aabc9383a5c48ba4d4baf",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/load.cpp.o": "7a0ad74eb57c9d554d47436de8600a8ffa2a1b310b6ac8b68270d9717ea9cadf",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/reduce.cpp.o": "510cedbc33ea4f95a63e8dcace1ea243856d5bd383f06fab5d6b57551ca5005d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/slicing.cpp.o": "b4007ba488a292985e6bd3aef85d57f206913f6ea968786390b7df42122f21ee",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/utils.cpp.o": "5e3ca26c38e7bf64c12534597634c1b697b4dafcad73de76a7ca0a3f52f46221",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/arg_reduce.cpp.o": "93c71e348baa9417f4846aa16dc8f130b2ef9b43a25ea3a6477f6d305fdff51f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/binary.cpp.o": "fa8ac9a7bd26890d5c142d9087c5450919d35d70b6586b0c5251e43d633311d7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/cholesky.cpp.o": "7dc36b27e51f62083e2b7f4bc1e9fa9cce47cfef9ddff20e4adbeb57da03e7ac",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/conv.cpp.o": "983944123cd755502b17ccc19c62b1f8846b0bbd9fa0e09868d66fed975d7e2a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/copy.cpp.o": "f3f4d639e45322ed8fa7a695c522eedf910769f2dd7905d227a52b28fea5e7dd",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/device_info.cpp.o": "39219ce19e4f0799d12bacf4b8df4a782f1b32e317fbf70c9864d543661c033e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/distributed.cpp.o": "b9fcf46b6d7f1f5c2d36c53c6e06261fc81cbf160ee0dbe2bbd83ecb96ca0a52",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eig.cpp.o": "62275cf9a1d89f5006e113dd7755c445ee8a22fdf1b96acf9f94af6f8f813300",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eigh.cpp.o": "bf231d995580dc02111eeb008fb0f61e1bbbdd631da23e1c8f389ebe8c88bf39",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/encoder.cpp.o": "0c94ddb994b5ee98055adec38a5d9a5450a87afa37ccdb02d3c5abd5b5c1fcc7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eval.cpp.o": "25ef98ae757de3e6ebf37d347aa1080c09dc78534229dfeba22d6e711ad68a8a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/fft.cpp.o": "9eab5b584815f2b316e4cbf2a1b768e8e97f9a6ff43c9544a52050bb0bd01d4a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/bnns.cpp.o": "0fb568aa1ed325fdfedf4b55b249bfdf934e310affafd3c5ac4c97ab3fa462ed",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/cblas.cpp.o": "320ed54f47be3dbae3199ad40bc9757b8c499217a1eb0e4208adef585ba9c006",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/hadamard.cpp.o": "261e2c01b7ee56ee893f3c2822b548647165dd21f97734f8a90dfbeab15ecb9c",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/indexing.cpp.o": "7967a32dd7c90eb05c6d87176562e523a38d02d897b806fd28971ba85d1382b6",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/inverse.cpp.o": "cf6e877d03e0c88c0a04b5e418d3cf3ae367994e98b58f585528e280b0600066",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/jit_compiler.cpp.o": "0fff40492d0f7580aed7d33d956a5e689ae1699feeb839e2b81897f98a989448",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/logsumexp.cpp.o": "6d69ee2eb32c309016ae6d096b6cbf3293a9331d7cee202b1b8fa52ae88777f9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/luf.cpp.o": "f5013195c58933ed0f1051e379d3fc87e602b1eaaf525f3c50bce945101835be",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/masked_mm.cpp.o": "840c47c4604723685ed008beff4f06fe39a90e85ac23fee2c5dfaa573023874a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/matmul.cpp.o": "492f84fdb552c09db154d16964e3f5466ac3057e442ec06aef84f431ff964c51",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/primitives.cpp.o": "d3a63986e4b2d855ac04ed403c421c5d92fa185b5557fdecd0d017b3040de385",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/qrf.cpp.o": "b78b178631155b4c4d65cb7c7844c2c3bfa31810a90c8a01a9c5788fe53634e7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/quantized.cpp.o": "b72f9f8a853b8f65609d2c143f1e24d1b39d1b037d7d83ec317395f16d949fcd",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/reduce.cpp.o": "3ae45925724168989c5248740f71b0efacac0c09d0b35519c079b729bd0a46d8",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/scan.cpp.o": "f4dddd85556bfc6c731485f188de67055b14fb2ebda0dc4c739501104d8c37e7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/select.cpp.o": "3cf52f02aded5074e8b997264b0e3d60bc9689e300788f01077e4df0d57f6e1e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/softmax.cpp.o": "30211f19597d7190e96cdcc6afbc0e4961da57f08fb6e83d72010b296f44bea3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/sort.cpp.o": "86c1534bb8281a75ade0d6abb7c0db137c984ba7b1791a3a5ac192ff87f86c00",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/svd.cpp.o": "04f3530b8e6bac6a5626b65e3d825364306ec5348f021f3e1711879ea3d90a20",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/threefry.cpp.o": "4921c145891c984870dd36c35e62ca45bafeae04bb00ccc6143911020cace5e4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/unary.cpp.o": "53fc58746513684e02fb65ab8c8e2f3e20da16509552b698da9d4a6afdec36ec",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cuda/no_cuda.cpp.o": "9971b0432baf787d91e84a3f3c8ed090c9c9ca4443a98251f80e15953c9dc83b",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/copy.cpp.o": "81460d7667ba1a9c6e811baa48387a3a920b87abcd8ddc48a0ff5777e414968e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/primitives.cpp.o": "71adbff757b9e026bc36489d78745703fc65fea80a767d6e810ff73eab1ceb32",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/slicing.cpp.o": "bb7a3dd9573353b436b45fa51efcb667e9a4c9b47b35ce9bebdd7f031baf411b",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/allocator.cpp.o": "e5508ff87a20f70e3eee503f9a3b07b521cc0e60d037b1b987b48ae77026d4f3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/binary.cpp.o": "9cd85a428aa9743a6a29bbb132fb1cb81d444e6f6d5848a942c2ff1241aced56",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/compiled.cpp.o": "4325851791d3ace0c5068d2e9437027a27657b57e66f9066ff79621241d2fcb1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/conv.cpp.o": "1598e979b81e8c2a89f67f06b3da9918f4df42b91d04b2b3d54f130d2083cd19",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/copy.cpp.o": "a91db579e32e9015291980fc551829cc77311186225516d042775958060213e1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/custom_kernel.cpp.o": "5d4d3666204d80c0d2de59f9763e265249982b67bc77297f97e51ad482a2ed17",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device.cpp.o": "c1c60f4cdaffe5d88d9280d19902d4074fe5f82f18244f40dfb4447e7353a240",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device_info.cpp.o": "4c12633a5087f8827421fb49b32b6e6273738dfe049a1250e39753e2a28a7ea3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/distributed.cpp.o": "16e5bb9dd72728220db9ee51a6051f7b4959096160827bc3f93011355a0ca0c5",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/eval.cpp.o": "bdf73907297c2fa1456193f804d59fcc8376dd585a33fe9ae282dc56e2d9e051",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/event.cpp.o": "50d74143a646f2fc9f50c67839284c44aad33d935515b3da69092271385203f2",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fence.cpp.o": "2b4d0a1295ec5dd9c384162c018324c7802bac6d1c9303daf44546ebda41bc40",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fft.cpp.o": "b551b81ee77df14afbbe72634d2608d3e96fdf1366736ef284e41e32d8fc71de",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/hadamard.cpp.o": "0974711ec11870b1ad150943790720c0e631fe8eb9eb1c79582c01e7a6d622f3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/indexing.cpp.o": "faa5080a948116c233d81aaf320966d4e7bb7b656a1d2388f1c1e8a5219f1600",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/jit_kernels.cpp.o": "af2ecbf4d66440875b0a88cdcb3b8358f8f1e880dccb24f85b550dea264e9167",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/logsumexp.cpp.o": "da54f9598a0231412df05f2aeef92ca9e4f087873b1828bc6f69c8fcdaeec944",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/matmul.cpp.o": "c7796ce9482b2a704b33e4f7b2638dea5e966766967d0d914eaee87bf4a3b480",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/metal.cpp.o": "46e578871a16c846817587692935cb273c04aa4fa9714da6d3cecba5fb97cd77",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/normalization.cpp.o": "924f599b35ca7966cc9d373e7dc630be56ce15c81f6d69b99f5c896456df284d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/primitives.cpp.o": "001596eb7e84b5c536063c11bbec41127f2fe73fb1dbffd0c34c64fa84279ec1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/quantized.cpp.o": "e56dfeb00a71b33a92ad0adca4c77c50dde96fd5728dff3f3a745ce679831424",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/reduce.cpp.o": "348825f13897fc0b8898b3651c1d7699f66633ce34209f29170627c5196e13c3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/resident.cpp.o": "00d61a303d29bef50644a278f934f1d35f61a833aa86e852787d31a8a60686e4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/rope.cpp.o": "5786f1307ad2804ab51b0c9128a4c26a7aff4a9841d617f88b417e6b4b6d369b",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scaled_dot_product_attention.cpp.o": "1de1ccabb636bb34f960ad5bd0db3a7908776c90d3629babb8def148d7598da6",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scan.cpp.o": "1342ca678eeb32d2a30d42aec6f1a7ccf7c3243257482082ca5dfb4c9243d6aa",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/slicing.cpp.o": "161c81655b45ab8a49b6eccebf93e5b708aff3329b2a052acfd95048eaf9c0d3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/softmax.cpp.o": "9610229f541aa7690913a7d5c55dae6737355b01d880394f5411823cd231bd9f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/sort.cpp.o": "53e8642d013707e76c87e39f24c28c1d21d9ba4888a8e8ce96e3f69b64507f45",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/ternary.cpp.o": "902ce11bdf6dfd31307366eaba0f2e422f384219451fef8946b1b8fa0e83cd0a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/unary.cpp.o": "4ffcf1a6d35aea8944a16ded8a3d06755107ec63370f4a4ba33a2a02de08e021",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/utils.cpp.o": "dd8d8f7bcb267f34d0cabb64041a00cc2b1ba2f3b27233d838a42ecb85cfb207",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/compile.cpp.o": "31d77a9a2f8322f814cd049801fa8d08ce702a199ec57721384ccee56da356cb",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/device.cpp.o": "6a7694967ed507d4110d7b9cb1fb8c675a902d7d764e666edda0847ad3667d0b",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/distributed.cpp.o": "4c9c30dcad826ec9364be6cd682ff3bea28f89983102047ed0357847c1b3296e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/jaccl/no_jaccl.cpp.o": "f91c8ab3a155850f58f454f7fd3e74d5d4906ad4c06844e02a8784b38cb90993",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/mpi/no_mpi.cpp.o": "10acd6665cc6ffa3774a59e9cad4f0dfa6cd5c6ccc7fa0129535bb26196ac3e4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/nccl/no_nccl.cpp.o": "78b02e551e66f1dad92a837390fc2abb1b03f401379ae94fbc4e15cb6ed66a39",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ops.cpp.o": "1ffae794bbfe8a6081f9c30f607b214ea3a05a1b247b91a68a5e9ca51c611560",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/primitives.cpp.o": "904e91983ca5231004b1c2804163f13d3d195060fc1030bffa2f408c6e00ab8e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ring/no_ring.cpp.o": "91f20e70446d982d2dca77025afb663bacb742828bc447192b5db85772f7498e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/utils.cpp.o": "c06dad5aef245df0374b77fe859470192ab1fba6f08baff5f85d24eb34369106",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype.cpp.o": "752e9ddaa326f51e5a773630ee4ec00f2530fece516f8eda423ecec20d83f21e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype_utils.cpp.o": "75c4e22a9e754ddecfd15e27c090d5b203b71252857a7b57a08c9540c9eb2942",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/einsum.cpp.o": "9bcf39b825297d0693b166e8438a278eecb2420fe326496599284a9e80214d4a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/export.cpp.o": "2a875945b7038287583879118630a6e61e0e671eed596bd514d89dec4c62af30",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fast.cpp.o": "467740ae1d7ff52f5236c61ff17adab3d08bc1f70a62f5373c75c2a20188af71",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fft.cpp.o": "40b4ca3f8b31f41c63ce8de86f3ce7a1c436b2a47b5ffa3ad7641190fc087ed7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/graph_utils.cpp.o": "40aaf25251ac61ef630077d30239658b90d71d3ce8695bf759b15bddd6ed92ba",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/load.cpp.o": "7451aea7303c2fecf47d5dd039ba472404476983498a715b41c48df61779b25c",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/no_gguf.cpp.o": "b59154f0eb9c18a0ce9b79b7643d6ba02fe66db70c1a19c82ca12a28b64b4553",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/safetensors.cpp.o": "7d548372aa0fe038f21f5ec2b4767b791adc7f7b1494b7330257956ec27b198a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/linalg.cpp.o": "e116159469fca5e577781afe2d1b83ca3656fbc17c67996d1947b823e2d35e4b",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/ops.cpp.o": "d8abe4e0a86579557e63b0ed3caea13452418a295397b82ab316d3b7d012d76e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/primitives.cpp.o": "95b26346c15aaf75c3e1a74fca01a29b72a226cb241dc97ef1b7185db22893cb",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/random.cpp.o": "43f40f0e32d29fab03f12f440bdaf0717121924c25709fe05eea7cc0dbdcb912",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/scheduler.cpp.o": "709e224da58c4a77d5293bf6c4cc744053209d882d21a3098b0fbb43ba894efc",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/transforms.cpp.o": "583e831e8b986e7c4b27099a143294d05f939360199bed62e0c3202f9c96135e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/utils.cpp.o": "1bd46f6631148b3339cf4d9b466783b70a51eca1da1d1b25b31217949e8fe0ce",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/version.cpp.o": "025f08fa0c53c11869f1d012af2b827c6c496b2251d7b9535757865768136aa4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/array.cpp.o": "01a92229642efd1157f90ccf8f499f89bdd5b82f7d020e06ecf94f9666283d5e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/closure.cpp.o": "d269684eb5d2ab380b7f74b6284fca58ce8944cb62e24173a2cef1aad52bab07",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/compile.cpp.o": "af172d64e2dcbf9b26f792f177720826b12e2365f203d5d8dc1c795db8631cb9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/cuda.cpp.o": "4b320306a09a5c2f9dd39c5354fc159a507a144ac99ffc849d4a4f066c2b06c8",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/device.cpp.o": "55d839ec45ee10e70327d79416a7be04b701aba23b5c818b491c1fa4efb8a856",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/error.cpp.o": "d58d2e5c86aa3849a68dd2911bf9ec895ed6fc5208a73024ddad20f0600d14ec",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/export.cpp.o": "363470b9989c7cc436972b18e98d6e2e8a908a2c18a7fefc15e0dd9f3cb2f36d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fast.cpp.o": "31dbf96cbecbcba2d537b387f9cfc55f5ce67f6bfca12c08f7886da229cd3f99",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fft.cpp.o": "ad8e1b293605c0fef89e3cdb5eb50947ef7054805c0e959e1573072d1c2db51f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io.cpp.o": "15a27b007732de44544b5959dd5cb88bea03a29f9148bd2d2463efcede5ecb59",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io_types.cpp.o": "a79671c8bd19c68c8485a498494e260509601b0ff388f52ab7c80ee773852d3f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/linalg.cpp.o": "7fdb0203c67ece5e4d186eebdb66df578d625dd295eb440e8be282dbaa7f7f9a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/map.cpp.o": "f09a6ca0a96e0bbab5c26e20255acdb9bdeee407271e34aec10fb229389ad472",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/memory.cpp.o": "825ac3b57ba0e5809e142051c7f7f7aaab59f7dba7b7ecd46db3dcaa7d2270e6",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/metal.cpp.o": "3a7f4e24bf8c598f25e206b1d8352d717929b470ca03cdea64b5d43580289ab9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/ops.cpp.o": "c681b92007d98636fb56ac734fbc61f1963dd66dda0077ba70d6c97ebf77d9d4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/random.cpp.o": "456279b00802d4ed4b219f095199cd3b675a5a1d6a2e0ade59c5d043f323a7b6",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/stream.cpp.o": "b4f1cbb839d1d57222cfd661c0649a972a0be72985c3b96aa385f675b4cf5562",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/string.cpp.o": "5977dcf157e4d7cc70dc7751691b21838c4a3e23ff718323840bfde20913708b",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms.cpp.o": "c0e342605cc3fb8bae0923c546b449ce2a14c201b6e74676c191e56a3a1bb399",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms_impl.cpp.o": "c60c9ddd0bff9d7e7a54002a6f4ff9e1812f7aaf0665f5a29279d1889199c802",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/vector.cpp.o": "f0f1532531493b9fdf188c4c6e215672e5430de8f5a4ff477f682083c9ada45f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/version.cpp.o": "6a1a24dbdf93764a8bc13ee7352c19f38ab606185bbe67711d27025d0c39e284",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-conditional/compiled_conditional.cpp.o": "af7ce0390e74eaa18614408c91e692fee4887b2fcfb69c1eea3a781f2c903b81",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/arange.cpp.o": "3c9a2b2caac2bce7cbff8b998c66666a55ffbba3d6cd78c47d703f8f0a3b2b43",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary.cpp.o": "e23b144678ac3882051fdea71b2db0dfa8bfd6c0bcf5b90421aa326d2ec161a0",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_ops.cpp.o": "0820b0eb53d379983d9f797527f1bc3320361a1a94ba0ea784e9d4b3d8e974ad",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_two.cpp.o": "bdc0a4f184ae160cf9469acc0560608536a2f71e127fa2afdfa32e9f7798f964",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/compiled_preamble.cpp.o": "851065037d02bffeb8f76fcc71b996d7855b3a536a559ceb49655370d8725251",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/conv.cpp.o": "8db83fdd392a3b85a76d20468a3e8eff56056b68476fbbf9b4eafc2323614ab0",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/copy.cpp.o": "fb6a86580681b44610db9e0263e79cef61f83e8bd2aa7813d6a22e81cd0523ce",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fft.cpp.o": "3659fe8f05ef5932e5f9d9460d2f589974c5b738e8573d2ac968f80dbd383b0d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized.cpp.o": "c944fd234df46a3061f51c60b70972864058b05b6dc36f67d42c33e953399f1c",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized_nax.cpp.o": "8b5f62fa53145a060531af2f19a9ed5fa9f04c195371e47f1f2249d866693fce",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather.cpp.o": "18f727f2638c178c9b67a9736e862a7b950644bf8e637489718da38498f0fc09",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_axis.cpp.o": "e691bd82ed1d1b358306be221c913d87f2d2a3cb925cbbd0fb1171386a745667",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_front.cpp.o": "0b2a408e7fd6d9ee9e307d7103cad98192640bc3014012bbbdacd371a8f200fc",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm.cpp.o": "79bbcf2abdb0e9e45f7adbde37811be39c1eeee44747b4b9383e48baa345b539",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm_nax.cpp.o": "c4b7b788b5b13c9d661ee09dd3c6d52edadd761509eceb100a4339891f9a5de6",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemv_masked.cpp.o": "c6bd288c241bd0735c2721f47cd96a1cddc13672292b50b246ab25fcc4ec1561",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/hadamard.cpp.o": "1a6def72c5bd7ff49a5ea9120787bef731eb1a5d7ef96e42c4245f29b638e428",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/logsumexp.cpp.o": "0970e2ee305242d8cd764567716f6c44631e6b5d9955182a304b8caaa1182d16",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/masked_scatter.cpp.o": "5a8759be17dfc581de12977430fa0f879efc3f4b17b9c19f2af19e5cd615f462",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized.cpp.o": "1e0c182c80e558756b9f39cb3c7dd89ea5730f7faed63828f448531677a625a1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_nax.cpp.o": "257190e7d703f137372d47c373c5536caa7a6a066e2c2d77074ca324d06f28d2",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_utils.cpp.o": "6d2eb0e880fbaca30508971421d725f60679b67a300e45d6bf9cdd86a86215e3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce.cpp.o": "913d0c1e9a26c88aacce7940eff3db218a43d4cb4a1ef7af928a019f1d23d57c",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce_utils.cpp.o": "9c037b06579d5a903aea93c02de5fe35be08f004e320911bdca260e93c9dcbac",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scan.cpp.o": "9422c9ed3ce356965fa1f25af419835201bd32301e2775559c4801b90f729d20",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter.cpp.o": "9303de749ea4b01d183a64ef286334059189e50dfb7a784a53af62aeaaf83b15",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter_axis.cpp.o": "715aebf787d11add63df3f517227c7b690eb7c78d49a2d061fe9edc4a143ad84",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/softmax.cpp.o": "0fb0269673db54b5dd17c59cbf23eb689e94be76958d6a846e8a9eba3d50b792",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/sort.cpp.o": "4e3d7479625da6d164d62a9ae9d8477292a6dec121473e1ac9f188bae63cb248",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention.cpp.o": "6b182f3a2d81a8491a172a919c9acfc7ee568861128a1da040b37b3b1c1f0a8e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention_nax.cpp.o": "c4835e907986c4a184c34c3a5cfc85cd6b2325eba66f662cfd56f6bc0b459c20",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv.cpp.o": "1d1baecd95c91d9481fed8ce793504bd9c84f7281f3e4805c71963da5bb115b9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_3d.cpp.o": "762d30a49c39ebceba474a81090fcda2e9670e4767a395c1a53ca04f01e202b4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_general.cpp.o": "97479dd7f25ef087223d7f8b61ff71119097412a44ed833e9e37ae4d99686755",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused.cpp.o": "e09aed537fce301eb05893442c65e0ff638ef4045d831d0e40f4f2b5621451f8",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused_nax.cpp.o": "d57df12d7db01db6d26cbb6447594d29b016f9b24f84eb930ca44275d100b74d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather.cpp.o": "49796b962b48a84dd743dcc6b610c7b01da199c55109a228fd348d08c2b16622",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather_nax.cpp.o": "da58927f75a52e5b360e4a77c7efdc5669168730ce34cf6cb2f2c36775f278e0",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_masked.cpp.o": "e1bc2327eb2a4386b0b064400de87965c9efb96dd490cbf71b4d26cfb4aeb9e5",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_segmented.cpp.o": "f9656b7d816fa173636d75cb0b0c3ca7de1d6bde6d447bc6b5fba07b8fe8274a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk.cpp.o": "e5f8b52754a5ac642c35af0bb52b4b735f94a8b40d1f362414653e1d4e864cb3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk_nax.cpp.o": "9440bdef84a191f36dec6122aa42769ec9dfc813732f31b14c3f1b818f3e8e44",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary.cpp.o": "fa8c7251c79a1f93bbfa933913e09ffdcb850867fb6e91567d8b30a7db7927fa",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary_ops.cpp.o": "23cc2755bf280a5edffc3050ef591016f32082611bf4292c110dde4a8b058dd3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary.cpp.o": "79e1d8824408bd5ddcad5b51484b322fc327ec08fde04fd53d6bac8d6ac974e9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary_ops.cpp.o": "618b447a12b5243470c955832d5864ba52835b79207168b64569bd34fc19a112",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/utils.cpp.o": "6e777139be46bd4cdfe9a8ca0e04baf55e915050b05c5658063db7b491cd32a9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AdditiveArithmetic.swift.o": "a69d464f901e019c44155221cd05f132384ecd2364c883aaee5486690f507011",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AlgebraicField.swift.o": "eba8a96b7796b6c6a193541ee01ec68e60cdcbce0292f28734ef864eb633b3eb",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Codable.swift.o": "72d6dadc294a92ac8ea8f5d7d77968b5003bdfaca2497fc78aacefaa294a888c",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+ElementaryFunctions.swift.o": "7409e952a8b103cd377ecd1c977f3f080a822f5dc3683bcc59aa65c4f3971155",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Hashable.swift.o": "1bc1dfe97bf8ea0bba48b999e4af7d1550c91599ea10d1dabeab79e7fe279198",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+IntegerLiteral.swift.o": "ce1349ac92d903eaa8b2f6dde3b08905fca22ee2108bd31fd560d2bc8e2d5ef5",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Numeric.swift.o": "6cd53c41482fa9f2d7bad46ef12e332a1881aa30e91cb4178bbed7184d5691b3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+StringConvertible.swift.o": "423f0543333749762d29516681ca5655108dc5e3ddbfc62ad3525f04eafbef43",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex.swift.o": "094f21373bb5a36434dc7dfabf19460def2b00e4aa13b07edbb333fc3b42a402",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Polar.swift.o": "6e625e79d1d2d1c24a42f75c5b63787577cb13555b186262fa600756d75b329f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Scale.swift.o": "4f16291134816209e2cdf307ca427ee47235ed9bf8982d04cdd96107b6b864b1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ArrayAt.swift.o": "84bab294a10b59ffd284b93a8455bd5bf3630277d4cf333e466b2cf87bb8b947",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Cmlx+Util.swift.o": "75a521939250f35f390be134af117e9dc61037dac4ff0ade08bf92218e57d44f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/DType.swift.o": "34d20175e0524325677bc8103616c91958fd1e091f8bde75280a6ec8d89eb862",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Device.swift.o": "6b97d288b86bdc27716b7e6e465bf5b9d1f433c73ec72579cd9316ef2409cd25",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ErrorHandler.swift.o": "0e1e2cd69f22360b7eb04c125f8482a112aeb9005dae66ea4fa24da58191e034",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Export.swift.o": "0b8ce025fd5c396b85b6eb5656914cda0867cabf133566e3c025193931084694",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/FFT.swift.o": "16e41f83ec533894ebef784632a6e98091bcf00d405dde82be85de408cfa5f00",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Factory.swift.o": "9f78dcb9a23c76af2543ac28d0e57482defc000f13f577678c0290e713c185ca",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Foundation+Util.swift.o": "5ea528aec5edd6469e4b7568feda26efb3c87d93d143ad6a2cb177e5a34fb0dd",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/GPU+Metal.swift.o": "02546f4b66d6fa35f0923ff2deffbefb4011910b02010e06ecdcdc7086052d53",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/IO.swift.o": "82a3dc942750f611910c7a29814e4de7c8695ab1921dfaa649303921db9d907a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Linalg.swift.o": "ba47eb93a185956f080a648a6cb06291d37fce67ac4937641deafa2c15879a9d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Bytes.swift.o": "00af9ffbf607691fd965bf6fec0107e17bf2ed1d6f91380f5e64320fa3ae1ec8",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Indexing.swift.o": "751d23d270550cd969ad25d21c290cca64d0f0a0845d7caa2345e435f9b724f2",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Init.swift.o": "3140f413206c893d1fcd17696ac084c97ccce4e7adf852411f1a5088d9ac8650",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Metal.swift.o": "05716b0f8e1853c064ba5d4e0fded0ec3b59916f85e4d74035bdd41b6c3c83d9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Normalizer.swift.o": "a21f2b51fe66070988772fab40ad497bd72be568910cc687a682d18688c8a313",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Ops.swift.o": "1683fd5a0775f73a1ff3521223cb5e4f0233aec23e8e17c3d2dc3cfa51437c53",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+maskFill.swift.o": "e1b8c30e04e04c4992da6641366faafda3f7955c5585d657f76d6b86254b2ec4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray.swift.o": "347c54a948d9e138645a054f9d20559689f46cb9e1927d39444337590a1b71aa",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXCustomFunction.swift.o": "1b4bb8c2f4250409976b23ff07cff414af7d42a3f393092b5eb9162c3a3996ec",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFast.swift.o": "6f9fc8aa1edd0becca15af2b61aef439a86bd4e2c7c566aa7d4d30f1d9d092dc",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFastKernel.swift.o": "632e246c233c5d19044c7d4fb3924e22c72065666269759d4363b8808c1f79f1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Memory.swift.o": "cb08bae8b9c96cb709cb4676bafa146da99c7b0af179454a9cbe4a0cac6af30a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Nested.swift.o": "ee31ff1c33d3e19e0b7a66a77c80b7fc39ab731f2665f9e25c009f5c317b1c95",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops+Array.swift.o": "526cdf83159dc6010b02261cb0d36282259c8d194cd4a88fc9714588b9932238",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops.swift.o": "a0fc7cc1a71eb0d0413f7cc0ddc017dd4fabe257bd1a2fabb62f0ed0fe979ac6",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ParameterTypes.swift.o": "e0ccf750d81190bfa43cec7058f0effe35754ab29faea583d49078722988df3f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Protocols.swift.o": "d8baa0e2bee717fcf6bd2699be6faaa5f686729564bdddeac02708841ea4bf25",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Random.swift.o": "88ec4d44977072165b7dbd5940ac089980803d2c531acc473c6e1148c3666ee7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/State.swift.o": "1880591bd2dd331b8f03949c86477ad33479bbeba7d7558aa36f48d4c813b490",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Stream.swift.o": "f5b3a513906807e6a1f0f7b0014ee8b5251baf5850efe2f87ff84bd67da2487d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Compile.swift.o": "8e91ad773c18b6c9feeabd42927672078f710d9563d1f03e89a7e17957dd9baa",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+CompileOverloads.swift.o": "cda378a0ed311d80cc5737ae31214e54c2d1123621a065b1b2e2c0ffe84f4f96",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Eval.swift.o": "60c49bea3adbb72d494cb23d5b018483ab7632856c6a0ac666039398bbffb4d1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Grad.swift.o": "fc199078c7e6cc48f238ce0dd5125a3615f757880192a34787980fb8a77e4dd0",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Internal.swift.o": "13abc5004d3f85cab008f940bbf7447b5ec26fd68926b58cbbfd12854c370463",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Vmap.swift.o": "f3b88c8e08d1c5c545fb5054513b64f6834806d35b2e395098ce8052a04be795",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms.swift.o": "a09e4bc4bf57fb13c636ef51c5641669b0fe6d3fc7ed21e48e607a0389ffd80e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/WiredMemory.swift.o": "9aa95a6e85e822e4160571214b0d4baba24a9db51bc4cb7de0b5959d4371b9aa",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/ComplexModule.swiftmodule": "f4f78bc6fa741850deaf7da3f213909ae6ba0ad63404a8271344497db0af2a61",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/MLX.swiftmodule": "07ffbc362911aa40f89a820dd526cdf3c1c27764f6fcfab035b71aeb08d31984",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/Numerics.swiftmodule": "b855c0df442fd2baf4f82dd412ca1a844f8536c3069ebf72d8d2628c38c5d2b1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/RealModule.swiftmodule": "7674a92e29d5d93f24a30891fe17ea92eb2ef3eb20008c7aef67bcf563f1b8f7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Numerics.build/Numerics.swift.o": "ab18464a9dd302ea47951c15ad6f4ac874bc5135f0510d01ff9003e122a73d45",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AlgebraicField.swift.o": "6824cdc8fa1e064644fba63d549b948ae7747126e73e82d5be36472d6200d706",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ApproximateEquality.swift.o": "c8faac7ab4ce7ea0de7de3171c4a5943902f32e39a3f16a0e4bd64264bbb3457",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AugmentedArithmetic.swift.o": "acd82faee4a1033542ff9d13f3cd48505cdb56f2c007cec92fcf6cd3d7008b4e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Double+Real.swift.o": "de2a8401e56ff115a990ef6665b1c8e55b47a05ee72dd07f8a0264edb22fcc1d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ElementaryFunctions.swift.o": "ca595b82373d61a316003b9f6d83b88a4e9d5f2ec19b00d230a4785698789ae7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float+Real.swift.o": "be994cb74388a175f7af2c4562168a9a3e72e9cfd8fa7a6ecdfeef24e0bf3c0a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float16+Real.swift.o": "db8b057cc6aab3d803d85903afec2617a7a4ab5839b759f3c5854d4942a44631",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float80+Real.swift.o": "85d5fe5d368547fff5c594292cd23a1eea5a3dc367f15c13453a3574771fab12",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Real.swift.o": "83d203a7c0aa3b5a70ef26971be2ad0e8e7273d8d3783f1761018560506b481d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RealFunctions.swift.o": "4ac89fe2bdbe467a897695b111a83aea078bc13df5743222e69a845cb6382391",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RelaxedArithmetic.swift.o": "4e5565a2d8ff2ea6a2dfda6565f0a508328b9963f2e40f5e76b67ea36181eb48",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/_NumericsShims.build/_NumericsShims.c.o": "b2e808dc4875069f768072c7800ea6ba8b548f9a222478b3e07f069b4d17f120",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/array.h": "d2205ba0ce146ff722f2ca97c170facb19b28784e7ffa47a07cdad69651c9801",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/closure.h": "b43a6d7c0e943a8df0f67377d49d92f4fa76eea79eed049adaff80e05ed854f7",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/compile.h": "448c6aafe37d52c82f63311a8ab3e1b876f7b0d7fcdc250d91a0ac1105a4b531",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/cuda.h": "ee99d74dc4131dca3ec7ab7d9015ff109481ee6fbcf3c015de7ebfdcc7df2644",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/device.h": "3e7556aab2f97fddf943b8f6e30b62064ee589705ad1643716bdd7ea37d6fe2f",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/distributed.h": "68b1dcbdc8dc8c1b4d58220caa7aec2396776282691e99999ff6547b52f7e28e",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/distributed_group.h": "26334e23cabc877a77a85ee212f8c498f35ae9426036b99957a106afe28a0c0e",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/error.h": "80090e79eb9add61961885e7aa491b9f47d1b838d188303734490e528b0db2c2",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/export.h": "723346c34761fb87c9a03a133ecff8f9fd8f83a3d80e680d63557c58739e11c1",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/fast.h": "b24116ec6a5558e976cbdb14474c2e8f88710bf68f7cb5da02d5ba3fa4b385be",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/fft.h": "21a73e39cb7a8f3a69590fff88017f524ff0a9761027c9bf0441f97afb88ffec",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/half.h": "90d57285c4b8436fbea18758661e84bf962c13179d545bbaac52b176de899ed8",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/io.h": "3a076e00fbfbec9d45160b61695e19b72377389cde4d79e0a317cc58abb2a4bd",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/io_types.h": "892e3108eb50b8414091b67d01241ad6b1ccd815fca60cdc707e5e96dbb226f6",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/linalg.h": "10512f19bfcf3f1f6ed9e3de07d43f84dd3492833e7b0ab6e0288ba552f73266",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/map.h": "4d5df4eef2757ca76b83dea06935568611d439ad3a8687c3b0df739902377a4d",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/memory.h": "850ae0be9ac300cfae23ee259441dca2a1e2055606427ac26f3d967b5c03a6e8",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/metal.h": "58ebd8b50add425f046d5fb5ef1bc747eff347b79db8a2b01f6af3967435b8be",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/mlx.h": "aeb941792b77d0de4101d3299f8f24bebfaa478965c466151adbf02702249c76",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/ops.h": "d540165d1321768a4039d0d436e004959e197026b6f9ec964730e3a03746d586",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/optional.h": "b0f20e24bd02cba4c2f624cd83f68a096a9d4ae6b2e4c4eb30d13719660ecf36",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/random.h": "7b21eea9c4b0b19636365b114f36d54ed1e534d9b353446b37aae8f9c3ef4df3",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/stream.h": "560e537e50cdc313c6651ab55e9a116721c591efff778de7b293440ee39cabaf",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/string.h": "29b3cfafb60b536a27c2ad96f9868c892e9242754868e1b770f55b7cf34ef598",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/transforms.h": "2cf31bbda041fdf60a83243cff2f9d000cff148b153f406158f8e77ff2072ceb",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/transforms_impl.h": "2700a13d26aa07339a815b4762b74d9bd6ffa0a9a21298be828ca367b5817701",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/vector.h": "b75108edace10f99f01da0dcb08a146d1449dcfcaaa24aa7b66e48e9f227e2c7",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/version.h": "d1c9aecddd98ad6c16b7c56c056f5b1040a633c4548fe97297481fd625450810",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx.h": "c9c79beb34545869213b31a290d159ba61afb7792b7500ca5f43d60d6b861474",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/module.modulemap": "a97dea631e9b7fa3b130b39f88b947d521e67e1ba5819e90b194abbe84a372d8",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/MLX/Memory.swift": "cb6976cc37aa3e8a0fa1be8269fea2869ecdf5951e469556f67e21604b1701f8",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/MLX/Ops.swift": "f79d9e5032b32cfee1744d5371a62a554be2e39c8a7165b4b022cbc4d4a2609e",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/MLX/Transforms+Eval.swift": "14b867c903be78547b426305257ca70e214b7b854acf1c0dc2cf7c82333f4999",
      "/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/_NumericsShims.h": "361bd79467ead784ac39b7f187895f996e149d017a7270dc590d01ffa0037b3a",
      "/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/module.modulemap": "c97db16dd177b4cee16673108b1dd2703d5cba99132ae45e16e4c0945941d8ed",
      "/tmp/slotstream-optimization-execution/compact-window-native-v302/Probe.swift": "c8880a7f919d73b5a5a141cb784499ad33cc7bc53b5cb6309bbcb5f943f9b489"
    },
    "object_count": 243,
    "module_version": "0.31.6",
    "metal_source": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/mlx.metallib",
    "metal_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
    "source_sha256": "c8880a7f919d73b5a5a141cb784499ad33cc7bc53b5cb6309bbcb5f943f9b489",
    "protocol": {
      "parent_prompt_rows": [
        17,
        256,
        4096
      ],
      "fixed_pairs_per_shape": 16,
      "iterations_per_arm": 64,
      "warmup_batches_per_arm": 1,
      "minimum_clean_pairs": 5,
      "replacement_rounds": 0,
      "byte_equality": true,
      "serving_claim": false
    }
  },
  "wrapper_sha256": "4e792202d3f4687792eccae207b5a816f78093ecb3e5a8b2e5ed0ebb803be636",
  "policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 240,
    "stop_on_new_swapouts": true
  }
}

````

## /tmp/slotstream-optimization-execution/compact-window-native-v302/run.py

SHA-256 `4e792202d3f4687792eccae207b5a816f78093ecb3e5a8b2e5ed0ebb803be636`.

````text
from pathlib import Path
import datetime
import json
import shutil
import signal
import sys
import time

R = Path('/Users/carlos/Projects/slotstream')
P = Path(__file__).parent
sys.path.insert(0, str(R / 'Tools'))
from prefill_bench import digest, preflight, vm_snapshot
from serve_bench import competing_jobs
from optimization_readiness import pressure_snapshot, require_normal
from optimization_serial_build import guarded_run

deadline = datetime.datetime.fromisoformat(sys.argv[1].replace('Z', '+00:00')).timestamp()
if deadline - time.time() < 330: raise RuntimeError('native component requires five reserved minutes and cleanup')
preparation = json.loads((P / 'preparation.json').read_text())
identity = preparation['input_identity']
assert all(digest(Path(p)) == h for p, h in identity.items())
assert digest(Path(preparation['metal_source'])) == preparation['metal_sha256']
policy = {'startup_reclaimable_bytes': 9_500_000_000, 'minimum_live_reclaimable_bytes': 6_000_000_000,
    'maximum_owned_rss_bytes': 3_000_000_000, 'sample_interval_seconds': .2,
    'maximum_build_seconds': 240, 'stop_on_new_swapouts': True}
s = {'classification': 'Compile/link a standalone native Swift component against243 pinned existing MLX/Cmlx/Numerics objects, then run48 fixed component pairs and12 byte/optional-state cases. No Slotstream model or runtime source change and no serving-speed claim.',
    'deadline_utc': sys.argv[1], 'preparation': preparation, 'wrapper_sha256': digest(Path(__file__)), 'policy': policy}
with (P / 'protocol.json').open('x') as out: out.write(json.dumps(s, indent=2) + '\n')
r = {'passed': False, 'protocol_sha256': digest(P / 'protocol.json'), 'steps': []}
begin = time.monotonic()
def interrupted(number, _): raise KeyboardInterrupt(f'native component interrupted by signal{number}')
signal.signal(signal.SIGINT, interrupted)
signal.signal(signal.SIGTERM, interrupted)
def snapshot():
    state = vm_snapshot()
    require_normal(pressure_snapshot())
    return state
try:
    r['before'] = preflight(9.5)
    snapshot()
    assert not competing_jobs()
    assert not (P / 'mlx.metallib').exists()
    shutil.copyfile(preparation['metal_source'], P / 'mlx.metallib')
    assert digest(P / 'mlx.metallib') == preparation['metal_sha256']
    for name, command in [('compile', preparation['compile_command']), ('run', preparation['run_command'])]:
        available = int(deadline - time.time() - 30)
        if available < 90: raise RuntimeError('insufficient remaining interval before ' + name)
        current = dict(policy, maximum_build_seconds=min(240 if name == 'compile' else 90, available))
        row = {'name': name, 'command': command, 'passed': False}
        r['steps'].append(row)
        print('Starting ' + name, flush=True)
        with (P / (name + '.stdout.txt')).open('w') as out, (P / (name + '.stderr.txt')).open('w') as err:
            result = guarded_run(command, cwd=R, stdout=out, stderr=err,
                record_path=P / (name + '.memory.json'), snapshot=snapshot, policy=current,
                classification=s['classification'])
        row['exit_code'] = result.returncode
        row['passed'] = result.returncode == 0
        (P / 'manifest.json').write_text(json.dumps(r, indent=2) + '\n')
        if not row['passed']: raise RuntimeError(name + ' failed; no automatic retry')
    report = json.loads((P / 'component-result.json').read_text())
    r['passed'] = report['passed'] is True and report['edge_cases'] == 12
    r['summaries'] = [{'parent_prompt_rows': c['parent_prompt_rows'], **c['summary']} for c in report['cases']]
    r['binary_sha256'] = digest(P / 'probe')
except BaseException as error:
    r['error'] = f'{type(error).__name__}: {error}'
finally:
    r['elapsed_seconds'] = time.monotonic() - begin
    (P / 'manifest.json').write_text(json.dumps(r, indent=2) + '\n')
    for key, function in {'after': vm_snapshot, 'pressure': pressure_snapshot,
        'identity_unchanged': lambda: all(digest(Path(p)) == h for p, h in identity.items()),
        'remaining_jobs': competing_jobs, 'model_lock_free': lambda: bool(preflight(0))}.items():
        try: r[key] = function()
        except BaseException as error: r.setdefault('cleanup_errors', {})[key] = str(error)
    r['within_reservation'] = time.time() <= deadline
    r['passed'] = bool(r['passed'] and not r.get('cleanup_errors') and r.get('identity_unchanged')
        and not r.get('remaining_jobs') and r.get('model_lock_free')
        and r.get('pressure', {}).get('level') == 1 and r['within_reservation'])
    (P / 'manifest.json').write_text(json.dumps(r, indent=2) + '\n')
print(json.dumps({k: v for k, v in r.items() if k not in ['before', 'after', 'steps']}), flush=True)
raise SystemExit(0 if r['passed'] else 1)

````

## /tmp/slotstream-optimization-execution/compact-window-native-v303/Probe.swift

SHA-256 `9c33545dac887f211b634987e6bae269bc87bfa822f1bd469f5c475e666984c8`.

````text
import Foundation
import MLX

private struct ProbeFailure: Error { let message: String }

private final class Windows {
    var convState: MLXArray?
    var pleConvState: MLXArray?

    func compact(joined: Bool) {
        if let window = convState { convState = contiguous(window) }
        if let window = pleConvState { pleConvState = contiguous(window) }
        if joined {
            let windows = [convState, pleConvState].compactMap { $0 }
            if !windows.isEmpty { eval(windows) }
        } else {
            if let window = convState { eval(window) }
            if let window = pleConvState { eval(window) }
        }
    }
}

private func require(_ condition: Bool, _ message: String) throws {
    if !condition { throw ProbeFailure(message: message) }
}

private func same(_ a: MLXArray?, _ b: MLXArray?) throws {
    try require((a == nil) == (b == nil), "optional state differs")
    if let a, let b {
        try require(a.shape == b.shape && a.dtype == b.dtype, "shape or dtype differs")
        let x = a.asData(access: .copy)
        let y = b.asData(access: .copy)
        try require(x.data == y.data, "copied bytes differ")
    }
}

private func vm() throws -> [String: Int] {
    let task = Process(), pipe = Pipe()
    task.executableURL = URL(fileURLWithPath: "/usr/bin/vm_stat")
    task.standardOutput = pipe
    try task.run()
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    task.waitUntilExit()
    try require(task.terminationStatus == 0, "vm_stat failed")
    let text = String(decoding: data, as: UTF8.self)
    var result: [String: Int] = [:]
    for line in text.split(separator: "\n") {
        let parts = line.split(separator: ":", maxSplits: 1)
        guard parts.count == 2 else { continue }
        let name = parts[0].lowercased()
        if name == "swapins" || name == "swapouts" {
            let value = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
                .trimmingCharacters(in: CharacterSet(charactersIn: "."))
            result[name] = Int(value)
        }
    }
    try require(result.count == 2, "missing VM counters")
    return result
}

private func median(_ values: [Double]) -> Double {
    let sorted = values.sorted(), middle = values.count / 2
    return sorted.count % 2 == 1 ? sorted[middle] : (sorted[middle - 1] + sorted[middle]) / 2
}

private func parent(rows: Int, width: Int) -> MLXArray {
    let count = rows * width
    let value = MLXArray(Int32(0) ..< Int32(count)).asType(.bfloat16).reshaped([1, rows, width])
    eval(value)
    return value
}

private func timed(_ a: MLXArray, _ b: MLXArray, joined: Bool) -> (Double, Windows) {
    let windows = Windows()
    let start = DispatchTime.now().uptimeNanoseconds
    for _ in 0 ..< 64 {
        windows.convState = a
        windows.pleConvState = b
        windows.compact(joined: joined)
    }
    let seconds = Double(DispatchTime.now().uptimeNanoseconds - start) / 1e9 / 64
    return (seconds, windows)
}

@main
private struct Probe {
    static func main() throws {
        try require(CommandLine.arguments.count == 2, "expected result path")
        Memory.cacheLimit = 64 * 1024 * 1024
        var cases: [[String: Any]] = [], edgeCases = 0
        for length in [17, 256, 4096] {
            let pa = parent(rows: length + 3, width: 10240)
            let pb = parent(rows: length + 9, width: 10240)
            let a = pa[0..., length..., 0...], b = pb[0..., length..., 0...]
            let inputs: [(MLXArray?, MLXArray?)] = [(nil, nil), (a, nil), (nil, b), (a, b)]
            for (a, b) in inputs {
                let old = Windows(), new = Windows()
                old.convState = a; old.pleConvState = b
                new.convState = a; new.pleConvState = b
                old.compact(joined: false); new.compact(joined: true)
                try same(old.convState, new.convState)
                try same(old.pleConvState, new.pleConvState)
                edgeCases += 1
            }
            for joined in [false, true] { _ = timed(a, b, joined: joined) }
            var rows: [[String: Any]] = [], clean: [[String: Double]] = []
            for round in 1 ... 16 {
                let before = try vm()
                var times: [String: Double] = [:]
                for joined in round % 2 == 1 ? [false, true] : [true, false] {
                    let (seconds, windows) = timed(a, b, joined: joined)
                    times[joined ? "joined" : "separate"] = seconds
                    try same(windows.convState, a)
                    try same(windows.pleConvState, b)
                }
                let after = try vm(), eligible = before == after
                rows.append(["round": round, "seconds_per_compaction": times,
                    "before_vm": before, "after_vm": after, "eligible": eligible])
                if eligible { clean.append(times) }
            }
            try require(clean.count >= 5, "too few clean component pairs")
            let summary: [String: Any] = ["clean_pairs": clean.count,
                "median_separate_seconds": median(clean.map { $0["separate"]! }),
                "median_joined_seconds": median(clean.map { $0["joined"]! }),
                "median_paired_reduction_percent": median(clean.map { 100 * (1 - $0["joined"]! / $0["separate"]!) })]
            cases.append(["parent_prompt_rows": length, "pairs": rows, "summary": summary])
            let progress = try JSONSerialization.data(withJSONObject: ["length": length, "summary": summary], options: [.sortedKeys])
            print(String(decoding: progress, as: UTF8.self))
        }
        let report: [String: Any] = ["passed": true, "edge_cases": edgeCases, "cases": cases,
            "allocator_active_peak_bytes": Memory.peakMemory,
            "classification": "Native Swift array component using pinned existing MLX objects. No Slotstream model, runtime source change or serving-speed claim."]
        let data = try JSONSerialization.data(withJSONObject: report, options: [.prettyPrinted, .sortedKeys])
        try data.write(to: URL(fileURLWithPath: CommandLine.arguments[1]), options: .atomic)
    }
}

````

## /tmp/slotstream-optimization-execution/compact-window-native-v303/compile.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/compact-window-native-v303/compile.stdout.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/compact-window-native-v303/component-result.json

SHA-256 `96f2a2be7fad101e980d1e2ef9dbb5b92fc535bcbfc056e637758a700620e538`.

````text
{
  "allocator_active_peak_bytes" : 336183296,
  "cases" : [
    {
      "pairs" : [
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 1,
          "seconds_per_compaction" : {
            "joined" : 0.00022426042187499999,
            "separate" : 0.00045395703124999999
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 2,
          "seconds_per_compaction" : {
            "joined" : 0.00024534765625000001,
            "separate" : 0.00045214648437500002
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 3,
          "seconds_per_compaction" : {
            "joined" : 0.00022538020312499999,
            "separate" : 0.00046317448437500002
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 4,
          "seconds_per_compaction" : {
            "joined" : 0.00027716406250000001,
            "separate" : 0.00046152603125000001
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 5,
          "seconds_per_compaction" : {
            "joined" : 0.00025868750000000002,
            "separate" : 0.00056539714062499996
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 6,
          "seconds_per_compaction" : {
            "joined" : 0.000328994796875,
            "separate" : 0.00058325065624999998
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 7,
          "seconds_per_compaction" : {
            "joined" : 0.00027441601562499997,
            "separate" : 0.00053694465625000001
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 8,
          "seconds_per_compaction" : {
            "joined" : 0.00031382876562500002,
            "separate" : 0.00053785221875000001
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 9,
          "seconds_per_compaction" : {
            "joined" : 0.00022442773437499999,
            "separate" : 0.00055483723437499996
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 10,
          "seconds_per_compaction" : {
            "joined" : 0.00032249348437499999,
            "separate" : 0.00052447201562499999
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 11,
          "seconds_per_compaction" : {
            "joined" : 0.00030135156250000002,
            "separate" : 0.00059165884375
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 12,
          "seconds_per_compaction" : {
            "joined" : 0.00030909699999999999,
            "separate" : 0.00053804426562499997
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 13,
          "seconds_per_compaction" : {
            "joined" : 0.00026950131250000001,
            "separate" : 0.00056872134375000004
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 14,
          "seconds_per_compaction" : {
            "joined" : 0.000301255203125,
            "separate" : 0.0004539140625
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 15,
          "seconds_per_compaction" : {
            "joined" : 0.00026724348437499998,
            "separate" : 0.00056111718749999998
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 16,
          "seconds_per_compaction" : {
            "joined" : 0.00033219531250000003,
            "separate" : 0.00057583203124999996
          }
        }
      ],
      "parent_prompt_rows" : 17,
      "summary" : {
        "clean_pairs" : 16,
        "median_joined_seconds" : 0.00027579003906250002,
        "median_paired_reduction_percent" : 47.315092297160277,
        "median_separate_seconds" : 0.00053794824218749999
      }
    },
    {
      "pairs" : [
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 1,
          "seconds_per_compaction" : {
            "joined" : 0.00017859114062500001,
            "separate" : 0.00039132292187499999
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 2,
          "seconds_per_compaction" : {
            "joined" : 0.00019560090624999999,
            "separate" : 0.00035418879687499998
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 3,
          "seconds_per_compaction" : {
            "joined" : 0.000178384765625,
            "separate" : 0.00036703775
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 4,
          "seconds_per_compaction" : {
            "joined" : 0.00022027343750000001,
            "separate" : 0.00039849673437500002
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 5,
          "seconds_per_compaction" : {
            "joined" : 0.00018341928125,
            "separate" : 0.00046004557812499998
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 6,
          "seconds_per_compaction" : {
            "joined" : 0.00026328190624999999,
            "separate" : 0.00049788801562500003
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 7,
          "seconds_per_compaction" : {
            "joined" : 0.00026530793749999999,
            "separate" : 0.00056046939062499997
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 8,
          "seconds_per_compaction" : {
            "joined" : 0.00028028906249999999,
            "separate" : 0.00050607682812500005
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 9,
          "seconds_per_compaction" : {
            "joined" : 0.00026534699999999998,
            "separate" : 0.00051192903125000004
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 10,
          "seconds_per_compaction" : {
            "joined" : 0.00026869465625000002,
            "separate" : 0.00049193164062500002
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 11,
          "seconds_per_compaction" : {
            "joined" : 0.00025091081249999997,
            "separate" : 0.00052809765625000003
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 12,
          "seconds_per_compaction" : {
            "joined" : 0.00029582356249999999,
            "separate" : 0.00050753710937500001
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 13,
          "seconds_per_compaction" : {
            "joined" : 0.00025771679687500002,
            "separate" : 0.00052065559374999998
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 14,
          "seconds_per_compaction" : {
            "joined" : 0.00029151042187499997,
            "separate" : 0.00039086132812499999
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 15,
          "seconds_per_compaction" : {
            "joined" : 0.00025221093749999999,
            "separate" : 0.00048526692187499999
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116168,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 16,
          "seconds_per_compaction" : {
            "joined" : 0.00023873307812499999,
            "separate" : 0.00050245507812500003
          }
        }
      ],
      "parent_prompt_rows" : 256,
      "summary" : {
        "clean_pairs" : 16,
        "median_joined_seconds" : 0.00025496386718750001,
        "median_paired_reduction_percent" : 48.09678912534018,
        "median_separate_seconds" : 0.00049490982812499997
      }
    },
    {
      "pairs" : [
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 1,
          "seconds_per_compaction" : {
            "joined" : 0.00025276107812500001,
            "separate" : 0.00039741992187499999
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 2,
          "seconds_per_compaction" : {
            "joined" : 0.00021689453124999999,
            "separate" : 0.00039906770312499997
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 3,
          "seconds_per_compaction" : {
            "joined" : 0.00023655337499999999,
            "separate" : 0.00051193554687499997
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 4,
          "seconds_per_compaction" : {
            "joined" : 0.00026873437499999998,
            "separate" : 0.00046018034375000001
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 5,
          "seconds_per_compaction" : {
            "joined" : 0.000204005859375,
            "separate" : 0.00042472526562500001
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 6,
          "seconds_per_compaction" : {
            "joined" : 0.00029674804687499997,
            "separate" : 0.00050421615624999996
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 7,
          "seconds_per_compaction" : {
            "joined" : 0.00025035806250000003,
            "separate" : 0.00051018620312500004
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 8,
          "seconds_per_compaction" : {
            "joined" : 0.00027769790624999999,
            "separate" : 0.00039577148437500002
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 9,
          "seconds_per_compaction" : {
            "joined" : 0.00025926235937499999,
            "separate" : 0.00055952409375
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 10,
          "seconds_per_compaction" : {
            "joined" : 0.000305242828125,
            "separate" : 0.00053573306250000001
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 11,
          "seconds_per_compaction" : {
            "joined" : 0.00025879817187499999,
            "separate" : 0.00057037956250000001
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 12,
          "seconds_per_compaction" : {
            "joined" : 0.00028288606250000001,
            "separate" : 0.00052771874999999998
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 13,
          "seconds_per_compaction" : {
            "joined" : 0.000243384765625,
            "separate" : 0.00054426823437499997
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 14,
          "seconds_per_compaction" : {
            "joined" : 0.00031812175000000002,
            "separate" : 0.00055368229687499995
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 15,
          "seconds_per_compaction" : {
            "joined" : 0.00029830729687499999,
            "separate" : 0.00058614453124999997
          }
        },
        {
          "after_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "before_vm" : {
            "swapins" : 44116172,
            "swapouts" : 77536098
          },
          "eligible" : true,
          "round" : 16,
          "seconds_per_compaction" : {
            "joined" : 0.00026277734374999999,
            "separate" : 0.00048736718750000001
          }
        }
      ],
      "parent_prompt_rows" : 4096,
      "summary" : {
        "clean_pairs" : 16,
        "median_joined_seconds" : 0.00026101985156250002,
        "median_paired_reduction_percent" : 46.238403090395721,
        "median_separate_seconds" : 0.000511060875
      }
    }
  ],
  "classification" : "Native Swift array component using pinned existing MLX objects. No Slotstream model, runtime source change or serving-speed claim.",
  "edge_cases" : 12,
  "passed" : true
}
````

## /tmp/slotstream-optimization-execution/compact-window-native-v303/manifest.json

SHA-256 `597f2b26510005308a1556682c3c85f3e5342b62d08c7e3e7c56e68ada7815b2`.

````text
{
  "passed": true,
  "protocol_sha256": "2a61aac9c0a3fc3497696ab018e7bf6228ba7b5675047eea508adf06fb2619f3",
  "steps": [
    {
      "name": "compile",
      "command": [
        "/Library/Developer/CommandLineTools/usr/bin/swiftc",
        "-O",
        "-whole-module-optimization",
        "-num-threads",
        "1",
        "-j1",
        "-parse-as-library",
        "-swift-version",
        "6",
        "-target",
        "arm64-apple-macosx14.0",
        "-sdk",
        "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk",
        "-I",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules",
        "-module-cache-path",
        "/tmp/slotstream-optimization-execution/compact-window-native-v303/module-cache",
        "-Xcc",
        "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/module.modulemap",
        "-Xcc",
        "-I/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include",
        "-Xcc",
        "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/module.modulemap",
        "-Xcc",
        "-I/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include",
        "/tmp/slotstream-optimization-execution/compact-window-native-v303/Probe.swift",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/fmt/src/format.cc.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/framework/Cmlx.m.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/array.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/closure.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/compile.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/cuda.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/device.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/error.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/export.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fast.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fft.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io_types.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/linalg.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/map.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/memory.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/metal.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/ops.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/random.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/stream.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/string.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms_impl.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/vector.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/version.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-conditional/compiled_conditional.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/arange.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_ops.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_two.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/compiled_preamble.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/conv.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/copy.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fft.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_axis.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_front.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemv_masked.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/hadamard.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/logsumexp.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/masked_scatter.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce_utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scan.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter_axis.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/softmax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/sort.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_3d.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_general.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_masked.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_segmented.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk_nax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary_ops.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary_ops.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/array.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/broadcasting.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/common.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/compiled.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/load.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/reduce.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/slicing.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/arg_reduce.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/binary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/cholesky.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/conv.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/copy.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/device_info.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/distributed.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eig.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eigh.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/encoder.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eval.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/fft.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/bnns.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/cblas.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/hadamard.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/indexing.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/inverse.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/jit_compiler.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/logsumexp.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/luf.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/masked_mm.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/matmul.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/primitives.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/qrf.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/quantized.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/reduce.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/scan.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/select.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/softmax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/sort.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/svd.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/threefry.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/unary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cuda/no_cuda.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/copy.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/primitives.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/slicing.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/allocator.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/binary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/compiled.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/conv.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/copy.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/custom_kernel.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device_info.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/distributed.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/eval.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/event.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fence.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fft.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/hadamard.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/indexing.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/jit_kernels.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/logsumexp.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/matmul.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/metal.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/normalization.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/primitives.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/quantized.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/reduce.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/resident.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/rope.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scaled_dot_product_attention.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scan.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/slicing.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/softmax.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/sort.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/ternary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/unary.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/compile.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/device.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/distributed.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/jaccl/no_jaccl.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/mpi/no_mpi.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/nccl/no_nccl.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ops.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/primitives.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ring/no_ring.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype_utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/einsum.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/export.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fast.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fft.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/graph_utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/load.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/no_gguf.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/safetensors.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/linalg.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/ops.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/primitives.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/random.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/scheduler.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/transforms.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/utils.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/version.cpp.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AdditiveArithmetic.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AlgebraicField.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Codable.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+ElementaryFunctions.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Hashable.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+IntegerLiteral.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Numeric.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+StringConvertible.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Polar.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Scale.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ArrayAt.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Cmlx+Util.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/DType.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Device.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ErrorHandler.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Export.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/FFT.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Factory.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Foundation+Util.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/GPU+Metal.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/IO.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Linalg.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Bytes.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Indexing.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Init.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Metal.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Normalizer.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Ops.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+maskFill.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXCustomFunction.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFast.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFastKernel.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Memory.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Nested.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops+Array.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ParameterTypes.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Protocols.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Random.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/State.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Stream.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Compile.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+CompileOverloads.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Eval.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Grad.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Internal.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Vmap.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/WiredMemory.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Numerics.build/Numerics.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AlgebraicField.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ApproximateEquality.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AugmentedArithmetic.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Double+Real.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ElementaryFunctions.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float+Real.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float16+Real.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float80+Real.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Real.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RealFunctions.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RelaxedArithmetic.swift.o",
        "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/_NumericsShims.build/_NumericsShims.c.o",
        "-lc++",
        "-framework",
        "Foundation",
        "-framework",
        "Metal",
        "-framework",
        "Accelerate",
        "-o",
        "/tmp/slotstream-optimization-execution/compact-window-native-v303/probe"
      ],
      "passed": true,
      "exit_code": 0
    },
    {
      "name": "run",
      "command": [
        "/tmp/slotstream-optimization-execution/compact-window-native-v303/probe",
        "/tmp/slotstream-optimization-execution/compact-window-native-v303/component-result.json"
      ],
      "passed": true,
      "exit_code": 0
    }
  ],
  "before": {
    "page_bytes": 16384,
    "reclaimable_bytes": 23598399488,
    "swapins": 44116168,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   716815.\nPages active:                                 773550.\nPages inactive:                               767732.\nPages speculative:                             20842.\nPages throttled:                                   0.\nPages wired down:                             227446.\nPages purgeable:                                4231.\n\"Translation faults\":                    15861292040.\nPages copy-on-write:                       777149937.\nPages zero filled:                       21762994597.\nPages reactivated:                        3568133873.\nPages purged:                               74752124.\nFile-backed pages:                            719286.\nAnonymous pages:                              842838.\nPages stored in compressor:                  1567037.\nPages occupied by compressor:                 577097.\nDecompressions:                           1198246308.\nCompressions:                             1515613636.\nPageins:                                  7813049094.\nPageouts:                                   11175861.\nSwapins:                                    44116168.\nSwapouts:                                   77536098.\nPages tagged:                                 174841.\nPages tagged resident:                        119611.\nPages tagged compressed:                       55230.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6911.\nPages tag-storage free:                         2267.\nPages tag-storage non-tag pageable:            89118.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8554432.\nTagged compressions:                        11571480.\nTagged decompressions:                      10665397.\n"
  },
  "summaries": [
    {
      "parent_prompt_rows": 17,
      "clean_pairs": 16,
      "median_joined_seconds": 0.0002757900390625,
      "median_paired_reduction_percent": 47.31509229716028,
      "median_separate_seconds": 0.0005379482421875
    },
    {
      "parent_prompt_rows": 256,
      "clean_pairs": 16,
      "median_joined_seconds": 0.0002549638671875,
      "median_paired_reduction_percent": 48.09678912534018,
      "median_separate_seconds": 0.000494909828125
    },
    {
      "parent_prompt_rows": 4096,
      "clean_pairs": 16,
      "median_joined_seconds": 0.0002610198515625,
      "median_paired_reduction_percent": 46.23840309039572,
      "median_separate_seconds": 0.000511060875
    }
  ],
  "binary_sha256": "59a7de583644531bdce0e0d77912188ca484da8d753fa0c306c78eb868e15230",
  "elapsed_seconds": 31.467029375000003,
  "after": {
    "page_bytes": 16384,
    "reclaimable_bytes": 23406739456,
    "swapins": 44116172,
    "swapouts": 77536098,
    "raw": "Mach Virtual Memory Statistics: (page size of 16384 bytes)\nPages free:                                   667763.\nPages active:                                 809743.\nPages inactive:                               787139.\nPages speculative:                             26504.\nPages throttled:                                   0.\nPages wired down:                             215787.\nPages purgeable:                               23080.\n\"Translation faults\":                    15861977895.\nPages copy-on-write:                       777228137.\nPages zero filled:                       21763383494.\nPages reactivated:                        3568134034.\nPages purged:                               74752382.\nFile-backed pages:                            737791.\nAnonymous pages:                              885595.\nPages stored in compressor:                  1563584.\nPages occupied by compressor:                 576158.\nDecompressions:                           1198249760.\nCompressions:                             1515613636.\nPageins:                                  7813054923.\nPageouts:                                   11175861.\nSwapins:                                    44116172.\nSwapouts:                                   77536098.\nPages tagged:                                 175164.\nPages tagged resident:                        120352.\nPages tagged compressed:                       54812.\nPages tag-storage:                             98304.\nPages tag-storage holding tags:                 6911.\nPages tag-storage free:                         2317.\nPages tag-storage non-tag pageable:            89068.\nPages tag-storage non-tag wired:                   8.\nBytes of compressed tags:                    8476032.\nTagged compressions:                        11571480.\nTagged decompressions:                      10665815.\n"
  },
  "pressure": {
    "command": [
      "sysctl",
      "-n",
      "kern.memorystatus_vm_pressure_level"
    ],
    "level": 1,
    "name": "normal",
    "stdout": "1\n",
    "stderr": ""
  },
  "identity_unchanged": true,
  "remaining_jobs": [],
  "model_lock_free": true,
  "within_reservation": true
}

````

## /tmp/slotstream-optimization-execution/compact-window-native-v303/preparation.json

SHA-256 `f49ea420a6a10ee1631eac90fabfd9e3f4897ca30ad2816dfb4b78f463e42829`.

````text
{
  "classification": "Prepared only: link one standalone Swift array probe against existing pinned MLX/Cmlx/Numerics object files, using its exact public eval/contiguous bindings. Shared build state is read-only; no Slotstream rebuild or model. No compiler or probe launched.",
  "compile_command": [
    "/Library/Developer/CommandLineTools/usr/bin/swiftc",
    "-O",
    "-whole-module-optimization",
    "-num-threads",
    "1",
    "-j1",
    "-parse-as-library",
    "-swift-version",
    "6",
    "-target",
    "arm64-apple-macosx14.0",
    "-sdk",
    "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk",
    "-I",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules",
    "-module-cache-path",
    "/tmp/slotstream-optimization-execution/compact-window-native-v303/module-cache",
    "-Xcc",
    "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/module.modulemap",
    "-Xcc",
    "-I/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include",
    "-Xcc",
    "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/module.modulemap",
    "-Xcc",
    "-I/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include",
    "/tmp/slotstream-optimization-execution/compact-window-native-v303/Probe.swift",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/fmt/src/format.cc.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/framework/Cmlx.m.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/array.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/closure.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/compile.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/cuda.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/device.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/error.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/export.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fast.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fft.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io_types.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/linalg.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/map.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/memory.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/metal.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/ops.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/random.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/stream.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/string.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms_impl.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/vector.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/version.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-conditional/compiled_conditional.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/arange.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_ops.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_two.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/compiled_preamble.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/conv.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/copy.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fft.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_axis.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_front.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemv_masked.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/hadamard.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/logsumexp.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/masked_scatter.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce_utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scan.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter_axis.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/softmax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/sort.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_3d.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_general.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_masked.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_segmented.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk_nax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary_ops.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary_ops.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/array.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/broadcasting.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/common.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/compiled.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/load.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/reduce.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/slicing.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/arg_reduce.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/binary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/cholesky.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/conv.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/copy.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/device_info.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/distributed.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eig.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eigh.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/encoder.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eval.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/fft.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/bnns.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/cblas.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/hadamard.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/indexing.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/inverse.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/jit_compiler.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/logsumexp.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/luf.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/masked_mm.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/matmul.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/primitives.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/qrf.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/quantized.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/reduce.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/scan.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/select.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/softmax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/sort.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/svd.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/threefry.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/unary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cuda/no_cuda.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/copy.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/primitives.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/slicing.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/allocator.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/binary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/compiled.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/conv.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/copy.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/custom_kernel.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device_info.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/distributed.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/eval.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/event.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fence.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fft.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/hadamard.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/indexing.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/jit_kernels.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/logsumexp.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/matmul.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/metal.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/normalization.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/primitives.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/quantized.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/reduce.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/resident.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/rope.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scaled_dot_product_attention.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scan.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/slicing.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/softmax.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/sort.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/ternary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/unary.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/compile.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/device.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/distributed.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/jaccl/no_jaccl.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/mpi/no_mpi.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/nccl/no_nccl.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ops.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/primitives.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ring/no_ring.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype_utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/einsum.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/export.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fast.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fft.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/graph_utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/load.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/no_gguf.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/safetensors.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/linalg.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/ops.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/primitives.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/random.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/scheduler.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/transforms.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/utils.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/version.cpp.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AdditiveArithmetic.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AlgebraicField.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Codable.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+ElementaryFunctions.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Hashable.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+IntegerLiteral.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Numeric.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+StringConvertible.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Polar.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Scale.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ArrayAt.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Cmlx+Util.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/DType.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Device.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ErrorHandler.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Export.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/FFT.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Factory.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Foundation+Util.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/GPU+Metal.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/IO.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Linalg.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Bytes.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Indexing.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Init.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Metal.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Normalizer.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Ops.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+maskFill.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXCustomFunction.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFast.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFastKernel.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Memory.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Nested.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops+Array.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ParameterTypes.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Protocols.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Random.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/State.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Stream.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Compile.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+CompileOverloads.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Eval.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Grad.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Internal.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Vmap.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/WiredMemory.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Numerics.build/Numerics.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AlgebraicField.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ApproximateEquality.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AugmentedArithmetic.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Double+Real.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ElementaryFunctions.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float+Real.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float16+Real.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float80+Real.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Real.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RealFunctions.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RelaxedArithmetic.swift.o",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/_NumericsShims.build/_NumericsShims.c.o",
    "-lc++",
    "-framework",
    "Foundation",
    "-framework",
    "Metal",
    "-framework",
    "Accelerate",
    "-o",
    "/tmp/slotstream-optimization-execution/compact-window-native-v303/probe"
  ],
  "run_command": [
    "/tmp/slotstream-optimization-execution/compact-window-native-v303/probe",
    "/tmp/slotstream-optimization-execution/compact-window-native-v303/component-result.json"
  ],
  "input_identity": {
    "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/config.json": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/fmt/src/format.cc.o": "69b57112e757de7bdc8e54b30c64931878f8010d38645b687411cc7e4769d917",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/framework/Cmlx.m.o": "8d2a6aa100f8374ef2eb57f902a790cdf31fc451794c427772626789b8ebf53d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/array.cpp.o": "30532dd682b1dd98901b7136b5498aa2b3f585ddf471a8cbb0010c377f93bb5a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/broadcasting.cpp.o": "094105b96239c83ecb7b63a41bcadfeb5e353aad37a097f683c249846f42159d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/common.cpp.o": "3e015bc6b85e5fcaef89b1aceef3076bd583d99cfcd0ff5e7bf3783ae79d2328",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/compiled.cpp.o": "dd92575b42e05bacd571a2e71cce98d740cf5f8e334aabc9383a5c48ba4d4baf",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/load.cpp.o": "7a0ad74eb57c9d554d47436de8600a8ffa2a1b310b6ac8b68270d9717ea9cadf",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/reduce.cpp.o": "510cedbc33ea4f95a63e8dcace1ea243856d5bd383f06fab5d6b57551ca5005d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/slicing.cpp.o": "b4007ba488a292985e6bd3aef85d57f206913f6ea968786390b7df42122f21ee",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/utils.cpp.o": "5e3ca26c38e7bf64c12534597634c1b697b4dafcad73de76a7ca0a3f52f46221",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/arg_reduce.cpp.o": "93c71e348baa9417f4846aa16dc8f130b2ef9b43a25ea3a6477f6d305fdff51f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/binary.cpp.o": "fa8ac9a7bd26890d5c142d9087c5450919d35d70b6586b0c5251e43d633311d7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/cholesky.cpp.o": "7dc36b27e51f62083e2b7f4bc1e9fa9cce47cfef9ddff20e4adbeb57da03e7ac",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/conv.cpp.o": "983944123cd755502b17ccc19c62b1f8846b0bbd9fa0e09868d66fed975d7e2a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/copy.cpp.o": "f3f4d639e45322ed8fa7a695c522eedf910769f2dd7905d227a52b28fea5e7dd",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/device_info.cpp.o": "39219ce19e4f0799d12bacf4b8df4a782f1b32e317fbf70c9864d543661c033e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/distributed.cpp.o": "b9fcf46b6d7f1f5c2d36c53c6e06261fc81cbf160ee0dbe2bbd83ecb96ca0a52",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eig.cpp.o": "62275cf9a1d89f5006e113dd7755c445ee8a22fdf1b96acf9f94af6f8f813300",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eigh.cpp.o": "bf231d995580dc02111eeb008fb0f61e1bbbdd631da23e1c8f389ebe8c88bf39",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/encoder.cpp.o": "0c94ddb994b5ee98055adec38a5d9a5450a87afa37ccdb02d3c5abd5b5c1fcc7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eval.cpp.o": "25ef98ae757de3e6ebf37d347aa1080c09dc78534229dfeba22d6e711ad68a8a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/fft.cpp.o": "9eab5b584815f2b316e4cbf2a1b768e8e97f9a6ff43c9544a52050bb0bd01d4a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/bnns.cpp.o": "0fb568aa1ed325fdfedf4b55b249bfdf934e310affafd3c5ac4c97ab3fa462ed",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/cblas.cpp.o": "320ed54f47be3dbae3199ad40bc9757b8c499217a1eb0e4208adef585ba9c006",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/hadamard.cpp.o": "261e2c01b7ee56ee893f3c2822b548647165dd21f97734f8a90dfbeab15ecb9c",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/indexing.cpp.o": "7967a32dd7c90eb05c6d87176562e523a38d02d897b806fd28971ba85d1382b6",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/inverse.cpp.o": "cf6e877d03e0c88c0a04b5e418d3cf3ae367994e98b58f585528e280b0600066",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/jit_compiler.cpp.o": "0fff40492d0f7580aed7d33d956a5e689ae1699feeb839e2b81897f98a989448",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/logsumexp.cpp.o": "6d69ee2eb32c309016ae6d096b6cbf3293a9331d7cee202b1b8fa52ae88777f9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/luf.cpp.o": "f5013195c58933ed0f1051e379d3fc87e602b1eaaf525f3c50bce945101835be",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/masked_mm.cpp.o": "840c47c4604723685ed008beff4f06fe39a90e85ac23fee2c5dfaa573023874a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/matmul.cpp.o": "492f84fdb552c09db154d16964e3f5466ac3057e442ec06aef84f431ff964c51",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/primitives.cpp.o": "d3a63986e4b2d855ac04ed403c421c5d92fa185b5557fdecd0d017b3040de385",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/qrf.cpp.o": "b78b178631155b4c4d65cb7c7844c2c3bfa31810a90c8a01a9c5788fe53634e7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/quantized.cpp.o": "b72f9f8a853b8f65609d2c143f1e24d1b39d1b037d7d83ec317395f16d949fcd",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/reduce.cpp.o": "3ae45925724168989c5248740f71b0efacac0c09d0b35519c079b729bd0a46d8",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/scan.cpp.o": "f4dddd85556bfc6c731485f188de67055b14fb2ebda0dc4c739501104d8c37e7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/select.cpp.o": "3cf52f02aded5074e8b997264b0e3d60bc9689e300788f01077e4df0d57f6e1e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/softmax.cpp.o": "30211f19597d7190e96cdcc6afbc0e4961da57f08fb6e83d72010b296f44bea3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/sort.cpp.o": "86c1534bb8281a75ade0d6abb7c0db137c984ba7b1791a3a5ac192ff87f86c00",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/svd.cpp.o": "04f3530b8e6bac6a5626b65e3d825364306ec5348f021f3e1711879ea3d90a20",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/threefry.cpp.o": "4921c145891c984870dd36c35e62ca45bafeae04bb00ccc6143911020cace5e4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/unary.cpp.o": "53fc58746513684e02fb65ab8c8e2f3e20da16509552b698da9d4a6afdec36ec",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cuda/no_cuda.cpp.o": "9971b0432baf787d91e84a3f3c8ed090c9c9ca4443a98251f80e15953c9dc83b",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/copy.cpp.o": "81460d7667ba1a9c6e811baa48387a3a920b87abcd8ddc48a0ff5777e414968e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/primitives.cpp.o": "71adbff757b9e026bc36489d78745703fc65fea80a767d6e810ff73eab1ceb32",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/slicing.cpp.o": "bb7a3dd9573353b436b45fa51efcb667e9a4c9b47b35ce9bebdd7f031baf411b",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/allocator.cpp.o": "e5508ff87a20f70e3eee503f9a3b07b521cc0e60d037b1b987b48ae77026d4f3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/binary.cpp.o": "9cd85a428aa9743a6a29bbb132fb1cb81d444e6f6d5848a942c2ff1241aced56",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/compiled.cpp.o": "4325851791d3ace0c5068d2e9437027a27657b57e66f9066ff79621241d2fcb1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/conv.cpp.o": "1598e979b81e8c2a89f67f06b3da9918f4df42b91d04b2b3d54f130d2083cd19",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/copy.cpp.o": "a91db579e32e9015291980fc551829cc77311186225516d042775958060213e1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/custom_kernel.cpp.o": "5d4d3666204d80c0d2de59f9763e265249982b67bc77297f97e51ad482a2ed17",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device.cpp.o": "c1c60f4cdaffe5d88d9280d19902d4074fe5f82f18244f40dfb4447e7353a240",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device_info.cpp.o": "4c12633a5087f8827421fb49b32b6e6273738dfe049a1250e39753e2a28a7ea3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/distributed.cpp.o": "16e5bb9dd72728220db9ee51a6051f7b4959096160827bc3f93011355a0ca0c5",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/eval.cpp.o": "bdf73907297c2fa1456193f804d59fcc8376dd585a33fe9ae282dc56e2d9e051",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/event.cpp.o": "50d74143a646f2fc9f50c67839284c44aad33d935515b3da69092271385203f2",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fence.cpp.o": "2b4d0a1295ec5dd9c384162c018324c7802bac6d1c9303daf44546ebda41bc40",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fft.cpp.o": "b551b81ee77df14afbbe72634d2608d3e96fdf1366736ef284e41e32d8fc71de",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/hadamard.cpp.o": "0974711ec11870b1ad150943790720c0e631fe8eb9eb1c79582c01e7a6d622f3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/indexing.cpp.o": "faa5080a948116c233d81aaf320966d4e7bb7b656a1d2388f1c1e8a5219f1600",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/jit_kernels.cpp.o": "af2ecbf4d66440875b0a88cdcb3b8358f8f1e880dccb24f85b550dea264e9167",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/logsumexp.cpp.o": "da54f9598a0231412df05f2aeef92ca9e4f087873b1828bc6f69c8fcdaeec944",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/matmul.cpp.o": "c7796ce9482b2a704b33e4f7b2638dea5e966766967d0d914eaee87bf4a3b480",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/metal.cpp.o": "46e578871a16c846817587692935cb273c04aa4fa9714da6d3cecba5fb97cd77",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/normalization.cpp.o": "924f599b35ca7966cc9d373e7dc630be56ce15c81f6d69b99f5c896456df284d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/primitives.cpp.o": "001596eb7e84b5c536063c11bbec41127f2fe73fb1dbffd0c34c64fa84279ec1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/quantized.cpp.o": "e56dfeb00a71b33a92ad0adca4c77c50dde96fd5728dff3f3a745ce679831424",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/reduce.cpp.o": "348825f13897fc0b8898b3651c1d7699f66633ce34209f29170627c5196e13c3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/resident.cpp.o": "00d61a303d29bef50644a278f934f1d35f61a833aa86e852787d31a8a60686e4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/rope.cpp.o": "5786f1307ad2804ab51b0c9128a4c26a7aff4a9841d617f88b417e6b4b6d369b",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scaled_dot_product_attention.cpp.o": "1de1ccabb636bb34f960ad5bd0db3a7908776c90d3629babb8def148d7598da6",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scan.cpp.o": "1342ca678eeb32d2a30d42aec6f1a7ccf7c3243257482082ca5dfb4c9243d6aa",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/slicing.cpp.o": "161c81655b45ab8a49b6eccebf93e5b708aff3329b2a052acfd95048eaf9c0d3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/softmax.cpp.o": "9610229f541aa7690913a7d5c55dae6737355b01d880394f5411823cd231bd9f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/sort.cpp.o": "53e8642d013707e76c87e39f24c28c1d21d9ba4888a8e8ce96e3f69b64507f45",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/ternary.cpp.o": "902ce11bdf6dfd31307366eaba0f2e422f384219451fef8946b1b8fa0e83cd0a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/unary.cpp.o": "4ffcf1a6d35aea8944a16ded8a3d06755107ec63370f4a4ba33a2a02de08e021",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/utils.cpp.o": "dd8d8f7bcb267f34d0cabb64041a00cc2b1ba2f3b27233d838a42ecb85cfb207",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/compile.cpp.o": "31d77a9a2f8322f814cd049801fa8d08ce702a199ec57721384ccee56da356cb",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/device.cpp.o": "6a7694967ed507d4110d7b9cb1fb8c675a902d7d764e666edda0847ad3667d0b",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/distributed.cpp.o": "4c9c30dcad826ec9364be6cd682ff3bea28f89983102047ed0357847c1b3296e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/jaccl/no_jaccl.cpp.o": "f91c8ab3a155850f58f454f7fd3e74d5d4906ad4c06844e02a8784b38cb90993",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/mpi/no_mpi.cpp.o": "10acd6665cc6ffa3774a59e9cad4f0dfa6cd5c6ccc7fa0129535bb26196ac3e4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/nccl/no_nccl.cpp.o": "78b02e551e66f1dad92a837390fc2abb1b03f401379ae94fbc4e15cb6ed66a39",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ops.cpp.o": "1ffae794bbfe8a6081f9c30f607b214ea3a05a1b247b91a68a5e9ca51c611560",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/primitives.cpp.o": "904e91983ca5231004b1c2804163f13d3d195060fc1030bffa2f408c6e00ab8e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ring/no_ring.cpp.o": "91f20e70446d982d2dca77025afb663bacb742828bc447192b5db85772f7498e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/utils.cpp.o": "c06dad5aef245df0374b77fe859470192ab1fba6f08baff5f85d24eb34369106",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype.cpp.o": "752e9ddaa326f51e5a773630ee4ec00f2530fece516f8eda423ecec20d83f21e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype_utils.cpp.o": "75c4e22a9e754ddecfd15e27c090d5b203b71252857a7b57a08c9540c9eb2942",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/einsum.cpp.o": "9bcf39b825297d0693b166e8438a278eecb2420fe326496599284a9e80214d4a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/export.cpp.o": "2a875945b7038287583879118630a6e61e0e671eed596bd514d89dec4c62af30",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fast.cpp.o": "467740ae1d7ff52f5236c61ff17adab3d08bc1f70a62f5373c75c2a20188af71",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fft.cpp.o": "40b4ca3f8b31f41c63ce8de86f3ce7a1c436b2a47b5ffa3ad7641190fc087ed7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/graph_utils.cpp.o": "40aaf25251ac61ef630077d30239658b90d71d3ce8695bf759b15bddd6ed92ba",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/load.cpp.o": "7451aea7303c2fecf47d5dd039ba472404476983498a715b41c48df61779b25c",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/no_gguf.cpp.o": "b59154f0eb9c18a0ce9b79b7643d6ba02fe66db70c1a19c82ca12a28b64b4553",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/safetensors.cpp.o": "7d548372aa0fe038f21f5ec2b4767b791adc7f7b1494b7330257956ec27b198a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/linalg.cpp.o": "e116159469fca5e577781afe2d1b83ca3656fbc17c67996d1947b823e2d35e4b",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/ops.cpp.o": "d8abe4e0a86579557e63b0ed3caea13452418a295397b82ab316d3b7d012d76e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/primitives.cpp.o": "95b26346c15aaf75c3e1a74fca01a29b72a226cb241dc97ef1b7185db22893cb",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/random.cpp.o": "43f40f0e32d29fab03f12f440bdaf0717121924c25709fe05eea7cc0dbdcb912",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/scheduler.cpp.o": "709e224da58c4a77d5293bf6c4cc744053209d882d21a3098b0fbb43ba894efc",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/transforms.cpp.o": "583e831e8b986e7c4b27099a143294d05f939360199bed62e0c3202f9c96135e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/utils.cpp.o": "1bd46f6631148b3339cf4d9b466783b70a51eca1da1d1b25b31217949e8fe0ce",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/version.cpp.o": "025f08fa0c53c11869f1d012af2b827c6c496b2251d7b9535757865768136aa4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/array.cpp.o": "01a92229642efd1157f90ccf8f499f89bdd5b82f7d020e06ecf94f9666283d5e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/closure.cpp.o": "d269684eb5d2ab380b7f74b6284fca58ce8944cb62e24173a2cef1aad52bab07",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/compile.cpp.o": "af172d64e2dcbf9b26f792f177720826b12e2365f203d5d8dc1c795db8631cb9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/cuda.cpp.o": "4b320306a09a5c2f9dd39c5354fc159a507a144ac99ffc849d4a4f066c2b06c8",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/device.cpp.o": "55d839ec45ee10e70327d79416a7be04b701aba23b5c818b491c1fa4efb8a856",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/error.cpp.o": "d58d2e5c86aa3849a68dd2911bf9ec895ed6fc5208a73024ddad20f0600d14ec",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/export.cpp.o": "363470b9989c7cc436972b18e98d6e2e8a908a2c18a7fefc15e0dd9f3cb2f36d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fast.cpp.o": "31dbf96cbecbcba2d537b387f9cfc55f5ce67f6bfca12c08f7886da229cd3f99",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fft.cpp.o": "ad8e1b293605c0fef89e3cdb5eb50947ef7054805c0e959e1573072d1c2db51f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io.cpp.o": "15a27b007732de44544b5959dd5cb88bea03a29f9148bd2d2463efcede5ecb59",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io_types.cpp.o": "a79671c8bd19c68c8485a498494e260509601b0ff388f52ab7c80ee773852d3f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/linalg.cpp.o": "7fdb0203c67ece5e4d186eebdb66df578d625dd295eb440e8be282dbaa7f7f9a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/map.cpp.o": "f09a6ca0a96e0bbab5c26e20255acdb9bdeee407271e34aec10fb229389ad472",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/memory.cpp.o": "825ac3b57ba0e5809e142051c7f7f7aaab59f7dba7b7ecd46db3dcaa7d2270e6",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/metal.cpp.o": "3a7f4e24bf8c598f25e206b1d8352d717929b470ca03cdea64b5d43580289ab9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/ops.cpp.o": "c681b92007d98636fb56ac734fbc61f1963dd66dda0077ba70d6c97ebf77d9d4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/random.cpp.o": "456279b00802d4ed4b219f095199cd3b675a5a1d6a2e0ade59c5d043f323a7b6",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/stream.cpp.o": "b4f1cbb839d1d57222cfd661c0649a972a0be72985c3b96aa385f675b4cf5562",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/string.cpp.o": "5977dcf157e4d7cc70dc7751691b21838c4a3e23ff718323840bfde20913708b",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms.cpp.o": "c0e342605cc3fb8bae0923c546b449ce2a14c201b6e74676c191e56a3a1bb399",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms_impl.cpp.o": "c60c9ddd0bff9d7e7a54002a6f4ff9e1812f7aaf0665f5a29279d1889199c802",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/vector.cpp.o": "f0f1532531493b9fdf188c4c6e215672e5430de8f5a4ff477f682083c9ada45f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/version.cpp.o": "6a1a24dbdf93764a8bc13ee7352c19f38ab606185bbe67711d27025d0c39e284",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-conditional/compiled_conditional.cpp.o": "af7ce0390e74eaa18614408c91e692fee4887b2fcfb69c1eea3a781f2c903b81",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/arange.cpp.o": "3c9a2b2caac2bce7cbff8b998c66666a55ffbba3d6cd78c47d703f8f0a3b2b43",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary.cpp.o": "e23b144678ac3882051fdea71b2db0dfa8bfd6c0bcf5b90421aa326d2ec161a0",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_ops.cpp.o": "0820b0eb53d379983d9f797527f1bc3320361a1a94ba0ea784e9d4b3d8e974ad",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_two.cpp.o": "bdc0a4f184ae160cf9469acc0560608536a2f71e127fa2afdfa32e9f7798f964",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/compiled_preamble.cpp.o": "851065037d02bffeb8f76fcc71b996d7855b3a536a559ceb49655370d8725251",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/conv.cpp.o": "8db83fdd392a3b85a76d20468a3e8eff56056b68476fbbf9b4eafc2323614ab0",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/copy.cpp.o": "fb6a86580681b44610db9e0263e79cef61f83e8bd2aa7813d6a22e81cd0523ce",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fft.cpp.o": "3659fe8f05ef5932e5f9d9460d2f589974c5b738e8573d2ac968f80dbd383b0d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized.cpp.o": "c944fd234df46a3061f51c60b70972864058b05b6dc36f67d42c33e953399f1c",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized_nax.cpp.o": "8b5f62fa53145a060531af2f19a9ed5fa9f04c195371e47f1f2249d866693fce",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather.cpp.o": "18f727f2638c178c9b67a9736e862a7b950644bf8e637489718da38498f0fc09",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_axis.cpp.o": "e691bd82ed1d1b358306be221c913d87f2d2a3cb925cbbd0fb1171386a745667",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_front.cpp.o": "0b2a408e7fd6d9ee9e307d7103cad98192640bc3014012bbbdacd371a8f200fc",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm.cpp.o": "79bbcf2abdb0e9e45f7adbde37811be39c1eeee44747b4b9383e48baa345b539",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm_nax.cpp.o": "c4b7b788b5b13c9d661ee09dd3c6d52edadd761509eceb100a4339891f9a5de6",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemv_masked.cpp.o": "c6bd288c241bd0735c2721f47cd96a1cddc13672292b50b246ab25fcc4ec1561",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/hadamard.cpp.o": "1a6def72c5bd7ff49a5ea9120787bef731eb1a5d7ef96e42c4245f29b638e428",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/logsumexp.cpp.o": "0970e2ee305242d8cd764567716f6c44631e6b5d9955182a304b8caaa1182d16",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/masked_scatter.cpp.o": "5a8759be17dfc581de12977430fa0f879efc3f4b17b9c19f2af19e5cd615f462",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized.cpp.o": "1e0c182c80e558756b9f39cb3c7dd89ea5730f7faed63828f448531677a625a1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_nax.cpp.o": "257190e7d703f137372d47c373c5536caa7a6a066e2c2d77074ca324d06f28d2",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_utils.cpp.o": "6d2eb0e880fbaca30508971421d725f60679b67a300e45d6bf9cdd86a86215e3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce.cpp.o": "913d0c1e9a26c88aacce7940eff3db218a43d4cb4a1ef7af928a019f1d23d57c",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce_utils.cpp.o": "9c037b06579d5a903aea93c02de5fe35be08f004e320911bdca260e93c9dcbac",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scan.cpp.o": "9422c9ed3ce356965fa1f25af419835201bd32301e2775559c4801b90f729d20",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter.cpp.o": "9303de749ea4b01d183a64ef286334059189e50dfb7a784a53af62aeaaf83b15",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter_axis.cpp.o": "715aebf787d11add63df3f517227c7b690eb7c78d49a2d061fe9edc4a143ad84",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/softmax.cpp.o": "0fb0269673db54b5dd17c59cbf23eb689e94be76958d6a846e8a9eba3d50b792",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/sort.cpp.o": "4e3d7479625da6d164d62a9ae9d8477292a6dec121473e1ac9f188bae63cb248",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention.cpp.o": "6b182f3a2d81a8491a172a919c9acfc7ee568861128a1da040b37b3b1c1f0a8e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention_nax.cpp.o": "c4835e907986c4a184c34c3a5cfc85cd6b2325eba66f662cfd56f6bc0b459c20",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv.cpp.o": "1d1baecd95c91d9481fed8ce793504bd9c84f7281f3e4805c71963da5bb115b9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_3d.cpp.o": "762d30a49c39ebceba474a81090fcda2e9670e4767a395c1a53ca04f01e202b4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_general.cpp.o": "97479dd7f25ef087223d7f8b61ff71119097412a44ed833e9e37ae4d99686755",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused.cpp.o": "e09aed537fce301eb05893442c65e0ff638ef4045d831d0e40f4f2b5621451f8",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused_nax.cpp.o": "d57df12d7db01db6d26cbb6447594d29b016f9b24f84eb930ca44275d100b74d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather.cpp.o": "49796b962b48a84dd743dcc6b610c7b01da199c55109a228fd348d08c2b16622",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather_nax.cpp.o": "da58927f75a52e5b360e4a77c7efdc5669168730ce34cf6cb2f2c36775f278e0",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_masked.cpp.o": "e1bc2327eb2a4386b0b064400de87965c9efb96dd490cbf71b4d26cfb4aeb9e5",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_segmented.cpp.o": "f9656b7d816fa173636d75cb0b0c3ca7de1d6bde6d447bc6b5fba07b8fe8274a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk.cpp.o": "e5f8b52754a5ac642c35af0bb52b4b735f94a8b40d1f362414653e1d4e864cb3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk_nax.cpp.o": "9440bdef84a191f36dec6122aa42769ec9dfc813732f31b14c3f1b818f3e8e44",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary.cpp.o": "fa8c7251c79a1f93bbfa933913e09ffdcb850867fb6e91567d8b30a7db7927fa",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary_ops.cpp.o": "23cc2755bf280a5edffc3050ef591016f32082611bf4292c110dde4a8b058dd3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary.cpp.o": "79e1d8824408bd5ddcad5b51484b322fc327ec08fde04fd53d6bac8d6ac974e9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary_ops.cpp.o": "618b447a12b5243470c955832d5864ba52835b79207168b64569bd34fc19a112",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/utils.cpp.o": "6e777139be46bd4cdfe9a8ca0e04baf55e915050b05c5658063db7b491cd32a9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AdditiveArithmetic.swift.o": "a69d464f901e019c44155221cd05f132384ecd2364c883aaee5486690f507011",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AlgebraicField.swift.o": "eba8a96b7796b6c6a193541ee01ec68e60cdcbce0292f28734ef864eb633b3eb",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Codable.swift.o": "72d6dadc294a92ac8ea8f5d7d77968b5003bdfaca2497fc78aacefaa294a888c",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+ElementaryFunctions.swift.o": "7409e952a8b103cd377ecd1c977f3f080a822f5dc3683bcc59aa65c4f3971155",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Hashable.swift.o": "1bc1dfe97bf8ea0bba48b999e4af7d1550c91599ea10d1dabeab79e7fe279198",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+IntegerLiteral.swift.o": "ce1349ac92d903eaa8b2f6dde3b08905fca22ee2108bd31fd560d2bc8e2d5ef5",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Numeric.swift.o": "6cd53c41482fa9f2d7bad46ef12e332a1881aa30e91cb4178bbed7184d5691b3",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+StringConvertible.swift.o": "423f0543333749762d29516681ca5655108dc5e3ddbfc62ad3525f04eafbef43",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex.swift.o": "094f21373bb5a36434dc7dfabf19460def2b00e4aa13b07edbb333fc3b42a402",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Polar.swift.o": "6e625e79d1d2d1c24a42f75c5b63787577cb13555b186262fa600756d75b329f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Scale.swift.o": "4f16291134816209e2cdf307ca427ee47235ed9bf8982d04cdd96107b6b864b1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ArrayAt.swift.o": "84bab294a10b59ffd284b93a8455bd5bf3630277d4cf333e466b2cf87bb8b947",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Cmlx+Util.swift.o": "75a521939250f35f390be134af117e9dc61037dac4ff0ade08bf92218e57d44f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/DType.swift.o": "34d20175e0524325677bc8103616c91958fd1e091f8bde75280a6ec8d89eb862",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Device.swift.o": "6b97d288b86bdc27716b7e6e465bf5b9d1f433c73ec72579cd9316ef2409cd25",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ErrorHandler.swift.o": "0e1e2cd69f22360b7eb04c125f8482a112aeb9005dae66ea4fa24da58191e034",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Export.swift.o": "0b8ce025fd5c396b85b6eb5656914cda0867cabf133566e3c025193931084694",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/FFT.swift.o": "16e41f83ec533894ebef784632a6e98091bcf00d405dde82be85de408cfa5f00",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Factory.swift.o": "9f78dcb9a23c76af2543ac28d0e57482defc000f13f577678c0290e713c185ca",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Foundation+Util.swift.o": "5ea528aec5edd6469e4b7568feda26efb3c87d93d143ad6a2cb177e5a34fb0dd",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/GPU+Metal.swift.o": "02546f4b66d6fa35f0923ff2deffbefb4011910b02010e06ecdcdc7086052d53",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/IO.swift.o": "82a3dc942750f611910c7a29814e4de7c8695ab1921dfaa649303921db9d907a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Linalg.swift.o": "ba47eb93a185956f080a648a6cb06291d37fce67ac4937641deafa2c15879a9d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Bytes.swift.o": "00af9ffbf607691fd965bf6fec0107e17bf2ed1d6f91380f5e64320fa3ae1ec8",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Indexing.swift.o": "751d23d270550cd969ad25d21c290cca64d0f0a0845d7caa2345e435f9b724f2",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Init.swift.o": "3140f413206c893d1fcd17696ac084c97ccce4e7adf852411f1a5088d9ac8650",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Metal.swift.o": "05716b0f8e1853c064ba5d4e0fded0ec3b59916f85e4d74035bdd41b6c3c83d9",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Normalizer.swift.o": "a21f2b51fe66070988772fab40ad497bd72be568910cc687a682d18688c8a313",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Ops.swift.o": "1683fd5a0775f73a1ff3521223cb5e4f0233aec23e8e17c3d2dc3cfa51437c53",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+maskFill.swift.o": "e1b8c30e04e04c4992da6641366faafda3f7955c5585d657f76d6b86254b2ec4",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray.swift.o": "347c54a948d9e138645a054f9d20559689f46cb9e1927d39444337590a1b71aa",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXCustomFunction.swift.o": "1b4bb8c2f4250409976b23ff07cff414af7d42a3f393092b5eb9162c3a3996ec",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFast.swift.o": "6f9fc8aa1edd0becca15af2b61aef439a86bd4e2c7c566aa7d4d30f1d9d092dc",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFastKernel.swift.o": "632e246c233c5d19044c7d4fb3924e22c72065666269759d4363b8808c1f79f1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Memory.swift.o": "cb08bae8b9c96cb709cb4676bafa146da99c7b0af179454a9cbe4a0cac6af30a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Nested.swift.o": "ee31ff1c33d3e19e0b7a66a77c80b7fc39ab731f2665f9e25c009f5c317b1c95",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops+Array.swift.o": "526cdf83159dc6010b02261cb0d36282259c8d194cd4a88fc9714588b9932238",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops.swift.o": "a0fc7cc1a71eb0d0413f7cc0ddc017dd4fabe257bd1a2fabb62f0ed0fe979ac6",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ParameterTypes.swift.o": "e0ccf750d81190bfa43cec7058f0effe35754ab29faea583d49078722988df3f",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Protocols.swift.o": "d8baa0e2bee717fcf6bd2699be6faaa5f686729564bdddeac02708841ea4bf25",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Random.swift.o": "88ec4d44977072165b7dbd5940ac089980803d2c531acc473c6e1148c3666ee7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/State.swift.o": "1880591bd2dd331b8f03949c86477ad33479bbeba7d7558aa36f48d4c813b490",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Stream.swift.o": "f5b3a513906807e6a1f0f7b0014ee8b5251baf5850efe2f87ff84bd67da2487d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Compile.swift.o": "8e91ad773c18b6c9feeabd42927672078f710d9563d1f03e89a7e17957dd9baa",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+CompileOverloads.swift.o": "cda378a0ed311d80cc5737ae31214e54c2d1123621a065b1b2e2c0ffe84f4f96",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Eval.swift.o": "60c49bea3adbb72d494cb23d5b018483ab7632856c6a0ac666039398bbffb4d1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Grad.swift.o": "fc199078c7e6cc48f238ce0dd5125a3615f757880192a34787980fb8a77e4dd0",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Internal.swift.o": "13abc5004d3f85cab008f940bbf7447b5ec26fd68926b58cbbfd12854c370463",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Vmap.swift.o": "f3b88c8e08d1c5c545fb5054513b64f6834806d35b2e395098ce8052a04be795",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms.swift.o": "a09e4bc4bf57fb13c636ef51c5641669b0fe6d3fc7ed21e48e607a0389ffd80e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/WiredMemory.swift.o": "9aa95a6e85e822e4160571214b0d4baba24a9db51bc4cb7de0b5959d4371b9aa",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/ComplexModule.swiftmodule": "f4f78bc6fa741850deaf7da3f213909ae6ba0ad63404a8271344497db0af2a61",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/MLX.swiftmodule": "07ffbc362911aa40f89a820dd526cdf3c1c27764f6fcfab035b71aeb08d31984",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/Numerics.swiftmodule": "b855c0df442fd2baf4f82dd412ca1a844f8536c3069ebf72d8d2628c38c5d2b1",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/RealModule.swiftmodule": "7674a92e29d5d93f24a30891fe17ea92eb2ef3eb20008c7aef67bcf563f1b8f7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Numerics.build/Numerics.swift.o": "ab18464a9dd302ea47951c15ad6f4ac874bc5135f0510d01ff9003e122a73d45",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AlgebraicField.swift.o": "6824cdc8fa1e064644fba63d549b948ae7747126e73e82d5be36472d6200d706",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ApproximateEquality.swift.o": "c8faac7ab4ce7ea0de7de3171c4a5943902f32e39a3f16a0e4bd64264bbb3457",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AugmentedArithmetic.swift.o": "acd82faee4a1033542ff9d13f3cd48505cdb56f2c007cec92fcf6cd3d7008b4e",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Double+Real.swift.o": "de2a8401e56ff115a990ef6665b1c8e55b47a05ee72dd07f8a0264edb22fcc1d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ElementaryFunctions.swift.o": "ca595b82373d61a316003b9f6d83b88a4e9d5f2ec19b00d230a4785698789ae7",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float+Real.swift.o": "be994cb74388a175f7af2c4562168a9a3e72e9cfd8fa7a6ecdfeef24e0bf3c0a",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float16+Real.swift.o": "db8b057cc6aab3d803d85903afec2617a7a4ab5839b759f3c5854d4942a44631",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float80+Real.swift.o": "85d5fe5d368547fff5c594292cd23a1eea5a3dc367f15c13453a3574771fab12",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Real.swift.o": "83d203a7c0aa3b5a70ef26971be2ad0e8e7273d8d3783f1761018560506b481d",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RealFunctions.swift.o": "4ac89fe2bdbe467a897695b111a83aea078bc13df5743222e69a845cb6382391",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RelaxedArithmetic.swift.o": "4e5565a2d8ff2ea6a2dfda6565f0a508328b9963f2e40f5e76b67ea36181eb48",
    "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/_NumericsShims.build/_NumericsShims.c.o": "b2e808dc4875069f768072c7800ea6ba8b548f9a222478b3e07f069b4d17f120",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/array.h": "d2205ba0ce146ff722f2ca97c170facb19b28784e7ffa47a07cdad69651c9801",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/closure.h": "b43a6d7c0e943a8df0f67377d49d92f4fa76eea79eed049adaff80e05ed854f7",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/compile.h": "448c6aafe37d52c82f63311a8ab3e1b876f7b0d7fcdc250d91a0ac1105a4b531",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/cuda.h": "ee99d74dc4131dca3ec7ab7d9015ff109481ee6fbcf3c015de7ebfdcc7df2644",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/device.h": "3e7556aab2f97fddf943b8f6e30b62064ee589705ad1643716bdd7ea37d6fe2f",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/distributed.h": "68b1dcbdc8dc8c1b4d58220caa7aec2396776282691e99999ff6547b52f7e28e",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/distributed_group.h": "26334e23cabc877a77a85ee212f8c498f35ae9426036b99957a106afe28a0c0e",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/error.h": "80090e79eb9add61961885e7aa491b9f47d1b838d188303734490e528b0db2c2",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/export.h": "723346c34761fb87c9a03a133ecff8f9fd8f83a3d80e680d63557c58739e11c1",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/fast.h": "b24116ec6a5558e976cbdb14474c2e8f88710bf68f7cb5da02d5ba3fa4b385be",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/fft.h": "21a73e39cb7a8f3a69590fff88017f524ff0a9761027c9bf0441f97afb88ffec",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/half.h": "90d57285c4b8436fbea18758661e84bf962c13179d545bbaac52b176de899ed8",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/io.h": "3a076e00fbfbec9d45160b61695e19b72377389cde4d79e0a317cc58abb2a4bd",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/io_types.h": "892e3108eb50b8414091b67d01241ad6b1ccd815fca60cdc707e5e96dbb226f6",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/linalg.h": "10512f19bfcf3f1f6ed9e3de07d43f84dd3492833e7b0ab6e0288ba552f73266",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/map.h": "4d5df4eef2757ca76b83dea06935568611d439ad3a8687c3b0df739902377a4d",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/memory.h": "850ae0be9ac300cfae23ee259441dca2a1e2055606427ac26f3d967b5c03a6e8",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/metal.h": "58ebd8b50add425f046d5fb5ef1bc747eff347b79db8a2b01f6af3967435b8be",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/mlx.h": "aeb941792b77d0de4101d3299f8f24bebfaa478965c466151adbf02702249c76",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/ops.h": "d540165d1321768a4039d0d436e004959e197026b6f9ec964730e3a03746d586",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/optional.h": "b0f20e24bd02cba4c2f624cd83f68a096a9d4ae6b2e4c4eb30d13719660ecf36",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/random.h": "7b21eea9c4b0b19636365b114f36d54ed1e534d9b353446b37aae8f9c3ef4df3",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/stream.h": "560e537e50cdc313c6651ab55e9a116721c591efff778de7b293440ee39cabaf",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/string.h": "29b3cfafb60b536a27c2ad96f9868c892e9242754868e1b770f55b7cf34ef598",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/transforms.h": "2cf31bbda041fdf60a83243cff2f9d000cff148b153f406158f8e77ff2072ceb",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/transforms_impl.h": "2700a13d26aa07339a815b4762b74d9bd6ffa0a9a21298be828ca367b5817701",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/vector.h": "b75108edace10f99f01da0dcb08a146d1449dcfcaaa24aa7b66e48e9f227e2c7",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/version.h": "d1c9aecddd98ad6c16b7c56c056f5b1040a633c4548fe97297481fd625450810",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx.h": "c9c79beb34545869213b31a290d159ba61afb7792b7500ca5f43d60d6b861474",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/module.modulemap": "a97dea631e9b7fa3b130b39f88b947d521e67e1ba5819e90b194abbe84a372d8",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/MLX/Memory.swift": "cb6976cc37aa3e8a0fa1be8269fea2869ecdf5951e469556f67e21604b1701f8",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/MLX/Ops.swift": "f79d9e5032b32cfee1744d5371a62a554be2e39c8a7165b4b022cbc4d4a2609e",
    "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/MLX/Transforms+Eval.swift": "14b867c903be78547b426305257ca70e214b7b854acf1c0dc2cf7c82333f4999",
    "/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/_NumericsShims.h": "361bd79467ead784ac39b7f187895f996e149d017a7270dc590d01ffa0037b3a",
    "/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/module.modulemap": "c97db16dd177b4cee16673108b1dd2703d5cba99132ae45e16e4c0945941d8ed",
    "/tmp/slotstream-optimization-execution/compact-window-native-v303/Probe.swift": "9c33545dac887f211b634987e6bae269bc87bfa822f1bd469f5c475e666984c8"
  },
  "object_count": 243,
  "module_version": "0.31.6",
  "metal_source": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/mlx.metallib",
  "metal_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
  "source_sha256": "9c33545dac887f211b634987e6bae269bc87bfa822f1bd469f5c475e666984c8",
  "protocol": {
    "parent_prompt_rows": [
      17,
      256,
      4096
    ],
    "fixed_pairs_per_shape": 16,
    "iterations_per_arm": 64,
    "warmup_batches_per_arm": 1,
    "minimum_clean_pairs": 5,
    "replacement_rounds": 0,
    "byte_equality": true,
    "serving_claim": false
  },
  "prior_failure": {
    "protocol": "/tmp/slotstream-optimization-execution/compact-window-native-v302/protocol.json",
    "protocol_sha256": "bf2fb767f143f189cb21572b4425d260f3ed0b43580d6f08116186a405dcfa26",
    "manifest": "/tmp/slotstream-optimization-execution/compact-window-native-v302/manifest.json",
    "reason": "The result type of asData is nested, not an imported top-level MLXArrayData. Use the unambiguous access:.copy overload with inferred result types. Only two type annotations change; byte comparison and all performance inputs are preserved. Compile failed before any probe/model execution."
  }
}

````

## /tmp/slotstream-optimization-execution/compact-window-native-v303/protocol.json

SHA-256 `2a61aac9c0a3fc3497696ab018e7bf6228ba7b5675047eea508adf06fb2619f3`.

````text
{
  "classification": "Compile/link a standalone native Swift component against243 pinned existing MLX/Cmlx/Numerics objects, then run48 fixed component pairs and12 byte/optional-state cases. No Slotstream model or runtime source change and no serving-speed claim.",
  "deadline_utc": "2026-09-07T13:54:00Z",
  "preparation": {
    "classification": "Prepared only: link one standalone Swift array probe against existing pinned MLX/Cmlx/Numerics object files, using its exact public eval/contiguous bindings. Shared build state is read-only; no Slotstream rebuild or model. No compiler or probe launched.",
    "compile_command": [
      "/Library/Developer/CommandLineTools/usr/bin/swiftc",
      "-O",
      "-whole-module-optimization",
      "-num-threads",
      "1",
      "-j1",
      "-parse-as-library",
      "-swift-version",
      "6",
      "-target",
      "arm64-apple-macosx14.0",
      "-sdk",
      "/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk",
      "-I",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules",
      "-module-cache-path",
      "/tmp/slotstream-optimization-execution/compact-window-native-v303/module-cache",
      "-Xcc",
      "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/module.modulemap",
      "-Xcc",
      "-I/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include",
      "-Xcc",
      "-fmodule-map-file=/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/module.modulemap",
      "-Xcc",
      "-I/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include",
      "/tmp/slotstream-optimization-execution/compact-window-native-v303/Probe.swift",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/fmt/src/format.cc.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/framework/Cmlx.m.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/array.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/closure.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/compile.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/cuda.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/device.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/error.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/export.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fast.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fft.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io_types.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/linalg.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/map.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/memory.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/metal.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/ops.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/random.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/stream.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/string.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms_impl.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/vector.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/version.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-conditional/compiled_conditional.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/arange.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_ops.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_two.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/compiled_preamble.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/conv.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/copy.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fft.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_axis.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_front.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemv_masked.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/hadamard.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/logsumexp.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/masked_scatter.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce_utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scan.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter_axis.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/softmax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/sort.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_3d.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_general.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_masked.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_segmented.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk_nax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary_ops.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary_ops.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/array.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/broadcasting.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/common.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/compiled.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/load.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/reduce.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/slicing.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/arg_reduce.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/binary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/cholesky.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/conv.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/copy.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/device_info.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/distributed.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eig.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eigh.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/encoder.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eval.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/fft.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/bnns.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/cblas.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/hadamard.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/indexing.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/inverse.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/jit_compiler.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/logsumexp.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/luf.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/masked_mm.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/matmul.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/primitives.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/qrf.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/quantized.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/reduce.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/scan.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/select.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/softmax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/sort.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/svd.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/threefry.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/unary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cuda/no_cuda.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/copy.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/primitives.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/slicing.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/allocator.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/binary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/compiled.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/conv.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/copy.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/custom_kernel.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device_info.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/distributed.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/eval.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/event.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fence.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fft.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/hadamard.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/indexing.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/jit_kernels.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/logsumexp.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/matmul.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/metal.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/normalization.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/primitives.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/quantized.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/reduce.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/resident.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/rope.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scaled_dot_product_attention.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scan.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/slicing.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/softmax.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/sort.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/ternary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/unary.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/compile.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/device.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/distributed.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/jaccl/no_jaccl.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/mpi/no_mpi.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/nccl/no_nccl.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ops.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/primitives.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ring/no_ring.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype_utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/einsum.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/export.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fast.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fft.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/graph_utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/load.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/no_gguf.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/safetensors.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/linalg.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/ops.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/primitives.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/random.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/scheduler.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/transforms.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/utils.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/version.cpp.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AdditiveArithmetic.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AlgebraicField.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Codable.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+ElementaryFunctions.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Hashable.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+IntegerLiteral.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Numeric.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+StringConvertible.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Polar.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Scale.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ArrayAt.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Cmlx+Util.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/DType.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Device.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ErrorHandler.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Export.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/FFT.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Factory.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Foundation+Util.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/GPU+Metal.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/IO.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Linalg.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Bytes.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Indexing.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Init.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Metal.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Normalizer.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Ops.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+maskFill.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXCustomFunction.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFast.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFastKernel.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Memory.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Nested.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops+Array.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ParameterTypes.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Protocols.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Random.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/State.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Stream.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Compile.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+CompileOverloads.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Eval.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Grad.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Internal.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Vmap.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/WiredMemory.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Numerics.build/Numerics.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AlgebraicField.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ApproximateEquality.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AugmentedArithmetic.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Double+Real.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ElementaryFunctions.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float+Real.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float16+Real.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float80+Real.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Real.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RealFunctions.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RelaxedArithmetic.swift.o",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/_NumericsShims.build/_NumericsShims.c.o",
      "-lc++",
      "-framework",
      "Foundation",
      "-framework",
      "Metal",
      "-framework",
      "Accelerate",
      "-o",
      "/tmp/slotstream-optimization-execution/compact-window-native-v303/probe"
    ],
    "run_command": [
      "/tmp/slotstream-optimization-execution/compact-window-native-v303/probe",
      "/tmp/slotstream-optimization-execution/compact-window-native-v303/component-result.json"
    ],
    "input_identity": {
      "/Users/carlos/.slotstream/models/qwen38-flash-next-mlx-4bit/config.json": "0da22a8ed4323fbe969bf982aeb054743b315206791f28ef74a309c707080ba5",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/fmt/src/format.cc.o": "69b57112e757de7bdc8e54b30c64931878f8010d38645b687411cc7e4769d917",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/framework/Cmlx.m.o": "8d2a6aa100f8374ef2eb57f902a790cdf31fc451794c427772626789b8ebf53d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/array.cpp.o": "30532dd682b1dd98901b7136b5498aa2b3f585ddf471a8cbb0010c377f93bb5a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/broadcasting.cpp.o": "094105b96239c83ecb7b63a41bcadfeb5e353aad37a097f683c249846f42159d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/common.cpp.o": "3e015bc6b85e5fcaef89b1aceef3076bd583d99cfcd0ff5e7bf3783ae79d2328",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/compiled.cpp.o": "dd92575b42e05bacd571a2e71cce98d740cf5f8e334aabc9383a5c48ba4d4baf",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/load.cpp.o": "7a0ad74eb57c9d554d47436de8600a8ffa2a1b310b6ac8b68270d9717ea9cadf",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/reduce.cpp.o": "510cedbc33ea4f95a63e8dcace1ea243856d5bd383f06fab5d6b57551ca5005d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/slicing.cpp.o": "b4007ba488a292985e6bd3aef85d57f206913f6ea968786390b7df42122f21ee",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/common/utils.cpp.o": "5e3ca26c38e7bf64c12534597634c1b697b4dafcad73de76a7ca0a3f52f46221",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/arg_reduce.cpp.o": "93c71e348baa9417f4846aa16dc8f130b2ef9b43a25ea3a6477f6d305fdff51f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/binary.cpp.o": "fa8ac9a7bd26890d5c142d9087c5450919d35d70b6586b0c5251e43d633311d7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/cholesky.cpp.o": "7dc36b27e51f62083e2b7f4bc1e9fa9cce47cfef9ddff20e4adbeb57da03e7ac",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/conv.cpp.o": "983944123cd755502b17ccc19c62b1f8846b0bbd9fa0e09868d66fed975d7e2a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/copy.cpp.o": "f3f4d639e45322ed8fa7a695c522eedf910769f2dd7905d227a52b28fea5e7dd",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/device_info.cpp.o": "39219ce19e4f0799d12bacf4b8df4a782f1b32e317fbf70c9864d543661c033e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/distributed.cpp.o": "b9fcf46b6d7f1f5c2d36c53c6e06261fc81cbf160ee0dbe2bbd83ecb96ca0a52",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eig.cpp.o": "62275cf9a1d89f5006e113dd7755c445ee8a22fdf1b96acf9f94af6f8f813300",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eigh.cpp.o": "bf231d995580dc02111eeb008fb0f61e1bbbdd631da23e1c8f389ebe8c88bf39",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/encoder.cpp.o": "0c94ddb994b5ee98055adec38a5d9a5450a87afa37ccdb02d3c5abd5b5c1fcc7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/eval.cpp.o": "25ef98ae757de3e6ebf37d347aa1080c09dc78534229dfeba22d6e711ad68a8a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/fft.cpp.o": "9eab5b584815f2b316e4cbf2a1b768e8e97f9a6ff43c9544a52050bb0bd01d4a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/bnns.cpp.o": "0fb568aa1ed325fdfedf4b55b249bfdf934e310affafd3c5ac4c97ab3fa462ed",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/gemms/cblas.cpp.o": "320ed54f47be3dbae3199ad40bc9757b8c499217a1eb0e4208adef585ba9c006",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/hadamard.cpp.o": "261e2c01b7ee56ee893f3c2822b548647165dd21f97734f8a90dfbeab15ecb9c",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/indexing.cpp.o": "7967a32dd7c90eb05c6d87176562e523a38d02d897b806fd28971ba85d1382b6",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/inverse.cpp.o": "cf6e877d03e0c88c0a04b5e418d3cf3ae367994e98b58f585528e280b0600066",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/jit_compiler.cpp.o": "0fff40492d0f7580aed7d33d956a5e689ae1699feeb839e2b81897f98a989448",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/logsumexp.cpp.o": "6d69ee2eb32c309016ae6d096b6cbf3293a9331d7cee202b1b8fa52ae88777f9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/luf.cpp.o": "f5013195c58933ed0f1051e379d3fc87e602b1eaaf525f3c50bce945101835be",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/masked_mm.cpp.o": "840c47c4604723685ed008beff4f06fe39a90e85ac23fee2c5dfaa573023874a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/matmul.cpp.o": "492f84fdb552c09db154d16964e3f5466ac3057e442ec06aef84f431ff964c51",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/primitives.cpp.o": "d3a63986e4b2d855ac04ed403c421c5d92fa185b5557fdecd0d017b3040de385",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/qrf.cpp.o": "b78b178631155b4c4d65cb7c7844c2c3bfa31810a90c8a01a9c5788fe53634e7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/quantized.cpp.o": "b72f9f8a853b8f65609d2c143f1e24d1b39d1b037d7d83ec317395f16d949fcd",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/reduce.cpp.o": "3ae45925724168989c5248740f71b0efacac0c09d0b35519c079b729bd0a46d8",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/scan.cpp.o": "f4dddd85556bfc6c731485f188de67055b14fb2ebda0dc4c739501104d8c37e7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/select.cpp.o": "3cf52f02aded5074e8b997264b0e3d60bc9689e300788f01077e4df0d57f6e1e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/softmax.cpp.o": "30211f19597d7190e96cdcc6afbc0e4961da57f08fb6e83d72010b296f44bea3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/sort.cpp.o": "86c1534bb8281a75ade0d6abb7c0db137c984ba7b1791a3a5ac192ff87f86c00",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/svd.cpp.o": "04f3530b8e6bac6a5626b65e3d825364306ec5348f021f3e1711879ea3d90a20",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/threefry.cpp.o": "4921c145891c984870dd36c35e62ca45bafeae04bb00ccc6143911020cace5e4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cpu/unary.cpp.o": "53fc58746513684e02fb65ab8c8e2f3e20da16509552b698da9d4a6afdec36ec",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/cuda/no_cuda.cpp.o": "9971b0432baf787d91e84a3f3c8ed090c9c9ca4443a98251f80e15953c9dc83b",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/copy.cpp.o": "81460d7667ba1a9c6e811baa48387a3a920b87abcd8ddc48a0ff5777e414968e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/primitives.cpp.o": "71adbff757b9e026bc36489d78745703fc65fea80a767d6e810ff73eab1ceb32",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/gpu/slicing.cpp.o": "bb7a3dd9573353b436b45fa51efcb667e9a4c9b47b35ce9bebdd7f031baf411b",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/allocator.cpp.o": "e5508ff87a20f70e3eee503f9a3b07b521cc0e60d037b1b987b48ae77026d4f3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/binary.cpp.o": "9cd85a428aa9743a6a29bbb132fb1cb81d444e6f6d5848a942c2ff1241aced56",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/compiled.cpp.o": "4325851791d3ace0c5068d2e9437027a27657b57e66f9066ff79621241d2fcb1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/conv.cpp.o": "1598e979b81e8c2a89f67f06b3da9918f4df42b91d04b2b3d54f130d2083cd19",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/copy.cpp.o": "a91db579e32e9015291980fc551829cc77311186225516d042775958060213e1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/custom_kernel.cpp.o": "5d4d3666204d80c0d2de59f9763e265249982b67bc77297f97e51ad482a2ed17",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device.cpp.o": "c1c60f4cdaffe5d88d9280d19902d4074fe5f82f18244f40dfb4447e7353a240",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/device_info.cpp.o": "4c12633a5087f8827421fb49b32b6e6273738dfe049a1250e39753e2a28a7ea3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/distributed.cpp.o": "16e5bb9dd72728220db9ee51a6051f7b4959096160827bc3f93011355a0ca0c5",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/eval.cpp.o": "bdf73907297c2fa1456193f804d59fcc8376dd585a33fe9ae282dc56e2d9e051",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/event.cpp.o": "50d74143a646f2fc9f50c67839284c44aad33d935515b3da69092271385203f2",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fence.cpp.o": "2b4d0a1295ec5dd9c384162c018324c7802bac6d1c9303daf44546ebda41bc40",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/fft.cpp.o": "b551b81ee77df14afbbe72634d2608d3e96fdf1366736ef284e41e32d8fc71de",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/hadamard.cpp.o": "0974711ec11870b1ad150943790720c0e631fe8eb9eb1c79582c01e7a6d622f3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/indexing.cpp.o": "faa5080a948116c233d81aaf320966d4e7bb7b656a1d2388f1c1e8a5219f1600",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/jit_kernels.cpp.o": "af2ecbf4d66440875b0a88cdcb3b8358f8f1e880dccb24f85b550dea264e9167",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/logsumexp.cpp.o": "da54f9598a0231412df05f2aeef92ca9e4f087873b1828bc6f69c8fcdaeec944",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/matmul.cpp.o": "c7796ce9482b2a704b33e4f7b2638dea5e966766967d0d914eaee87bf4a3b480",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/metal.cpp.o": "46e578871a16c846817587692935cb273c04aa4fa9714da6d3cecba5fb97cd77",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/normalization.cpp.o": "924f599b35ca7966cc9d373e7dc630be56ce15c81f6d69b99f5c896456df284d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/primitives.cpp.o": "001596eb7e84b5c536063c11bbec41127f2fe73fb1dbffd0c34c64fa84279ec1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/quantized.cpp.o": "e56dfeb00a71b33a92ad0adca4c77c50dde96fd5728dff3f3a745ce679831424",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/reduce.cpp.o": "348825f13897fc0b8898b3651c1d7699f66633ce34209f29170627c5196e13c3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/resident.cpp.o": "00d61a303d29bef50644a278f934f1d35f61a833aa86e852787d31a8a60686e4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/rope.cpp.o": "5786f1307ad2804ab51b0c9128a4c26a7aff4a9841d617f88b417e6b4b6d369b",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scaled_dot_product_attention.cpp.o": "1de1ccabb636bb34f960ad5bd0db3a7908776c90d3629babb8def148d7598da6",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/scan.cpp.o": "1342ca678eeb32d2a30d42aec6f1a7ccf7c3243257482082ca5dfb4c9243d6aa",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/slicing.cpp.o": "161c81655b45ab8a49b6eccebf93e5b708aff3329b2a052acfd95048eaf9c0d3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/softmax.cpp.o": "9610229f541aa7690913a7d5c55dae6737355b01d880394f5411823cd231bd9f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/sort.cpp.o": "53e8642d013707e76c87e39f24c28c1d21d9ba4888a8e8ce96e3f69b64507f45",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/ternary.cpp.o": "902ce11bdf6dfd31307366eaba0f2e422f384219451fef8946b1b8fa0e83cd0a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/unary.cpp.o": "4ffcf1a6d35aea8944a16ded8a3d06755107ec63370f4a4ba33a2a02de08e021",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/backend/metal/utils.cpp.o": "dd8d8f7bcb267f34d0cabb64041a00cc2b1ba2f3b27233d838a42ecb85cfb207",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/compile.cpp.o": "31d77a9a2f8322f814cd049801fa8d08ce702a199ec57721384ccee56da356cb",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/device.cpp.o": "6a7694967ed507d4110d7b9cb1fb8c675a902d7d764e666edda0847ad3667d0b",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/distributed.cpp.o": "4c9c30dcad826ec9364be6cd682ff3bea28f89983102047ed0357847c1b3296e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/jaccl/no_jaccl.cpp.o": "f91c8ab3a155850f58f454f7fd3e74d5d4906ad4c06844e02a8784b38cb90993",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/mpi/no_mpi.cpp.o": "10acd6665cc6ffa3774a59e9cad4f0dfa6cd5c6ccc7fa0129535bb26196ac3e4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/nccl/no_nccl.cpp.o": "78b02e551e66f1dad92a837390fc2abb1b03f401379ae94fbc4e15cb6ed66a39",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ops.cpp.o": "1ffae794bbfe8a6081f9c30f607b214ea3a05a1b247b91a68a5e9ca51c611560",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/primitives.cpp.o": "904e91983ca5231004b1c2804163f13d3d195060fc1030bffa2f408c6e00ab8e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/ring/no_ring.cpp.o": "91f20e70446d982d2dca77025afb663bacb742828bc447192b5db85772f7498e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/distributed/utils.cpp.o": "c06dad5aef245df0374b77fe859470192ab1fba6f08baff5f85d24eb34369106",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype.cpp.o": "752e9ddaa326f51e5a773630ee4ec00f2530fece516f8eda423ecec20d83f21e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/dtype_utils.cpp.o": "75c4e22a9e754ddecfd15e27c090d5b203b71252857a7b57a08c9540c9eb2942",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/einsum.cpp.o": "9bcf39b825297d0693b166e8438a278eecb2420fe326496599284a9e80214d4a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/export.cpp.o": "2a875945b7038287583879118630a6e61e0e671eed596bd514d89dec4c62af30",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fast.cpp.o": "467740ae1d7ff52f5236c61ff17adab3d08bc1f70a62f5373c75c2a20188af71",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/fft.cpp.o": "40b4ca3f8b31f41c63ce8de86f3ce7a1c436b2a47b5ffa3ad7641190fc087ed7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/graph_utils.cpp.o": "40aaf25251ac61ef630077d30239658b90d71d3ce8695bf759b15bddd6ed92ba",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/load.cpp.o": "7451aea7303c2fecf47d5dd039ba472404476983498a715b41c48df61779b25c",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/no_gguf.cpp.o": "b59154f0eb9c18a0ce9b79b7643d6ba02fe66db70c1a19c82ca12a28b64b4553",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/io/safetensors.cpp.o": "7d548372aa0fe038f21f5ec2b4767b791adc7f7b1494b7330257956ec27b198a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/linalg.cpp.o": "e116159469fca5e577781afe2d1b83ca3656fbc17c67996d1947b823e2d35e4b",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/ops.cpp.o": "d8abe4e0a86579557e63b0ed3caea13452418a295397b82ab316d3b7d012d76e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/primitives.cpp.o": "95b26346c15aaf75c3e1a74fca01a29b72a226cb241dc97ef1b7185db22893cb",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/random.cpp.o": "43f40f0e32d29fab03f12f440bdaf0717121924c25709fe05eea7cc0dbdcb912",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/scheduler.cpp.o": "709e224da58c4a77d5293bf6c4cc744053209d882d21a3098b0fbb43ba894efc",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/transforms.cpp.o": "583e831e8b986e7c4b27099a143294d05f939360199bed62e0c3202f9c96135e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/utils.cpp.o": "1bd46f6631148b3339cf4d9b466783b70a51eca1da1d1b25b31217949e8fe0ce",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx/mlx/version.cpp.o": "025f08fa0c53c11869f1d012af2b827c6c496b2251d7b9535757865768136aa4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/array.cpp.o": "01a92229642efd1157f90ccf8f499f89bdd5b82f7d020e06ecf94f9666283d5e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/closure.cpp.o": "d269684eb5d2ab380b7f74b6284fca58ce8944cb62e24173a2cef1aad52bab07",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/compile.cpp.o": "af172d64e2dcbf9b26f792f177720826b12e2365f203d5d8dc1c795db8631cb9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/cuda.cpp.o": "4b320306a09a5c2f9dd39c5354fc159a507a144ac99ffc849d4a4f066c2b06c8",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/device.cpp.o": "55d839ec45ee10e70327d79416a7be04b701aba23b5c818b491c1fa4efb8a856",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/error.cpp.o": "d58d2e5c86aa3849a68dd2911bf9ec895ed6fc5208a73024ddad20f0600d14ec",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/export.cpp.o": "363470b9989c7cc436972b18e98d6e2e8a908a2c18a7fefc15e0dd9f3cb2f36d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fast.cpp.o": "31dbf96cbecbcba2d537b387f9cfc55f5ce67f6bfca12c08f7886da229cd3f99",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/fft.cpp.o": "ad8e1b293605c0fef89e3cdb5eb50947ef7054805c0e959e1573072d1c2db51f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io.cpp.o": "15a27b007732de44544b5959dd5cb88bea03a29f9148bd2d2463efcede5ecb59",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/io_types.cpp.o": "a79671c8bd19c68c8485a498494e260509601b0ff388f52ab7c80ee773852d3f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/linalg.cpp.o": "7fdb0203c67ece5e4d186eebdb66df578d625dd295eb440e8be282dbaa7f7f9a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/map.cpp.o": "f09a6ca0a96e0bbab5c26e20255acdb9bdeee407271e34aec10fb229389ad472",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/memory.cpp.o": "825ac3b57ba0e5809e142051c7f7f7aaab59f7dba7b7ecd46db3dcaa7d2270e6",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/metal.cpp.o": "3a7f4e24bf8c598f25e206b1d8352d717929b470ca03cdea64b5d43580289ab9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/ops.cpp.o": "c681b92007d98636fb56ac734fbc61f1963dd66dda0077ba70d6c97ebf77d9d4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/random.cpp.o": "456279b00802d4ed4b219f095199cd3b675a5a1d6a2e0ade59c5d043f323a7b6",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/stream.cpp.o": "b4f1cbb839d1d57222cfd661c0649a972a0be72985c3b96aa385f675b4cf5562",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/string.cpp.o": "5977dcf157e4d7cc70dc7751691b21838c4a3e23ff718323840bfde20913708b",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms.cpp.o": "c0e342605cc3fb8bae0923c546b449ce2a14c201b6e74676c191e56a3a1bb399",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/transforms_impl.cpp.o": "c60c9ddd0bff9d7e7a54002a6f4ff9e1812f7aaf0665f5a29279d1889199c802",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/vector.cpp.o": "f0f1532531493b9fdf188c4c6e215672e5430de8f5a4ff477f682083c9ada45f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-c/mlx/c/version.cpp.o": "6a1a24dbdf93764a8bc13ee7352c19f38ab606185bbe67711d27025d0c39e284",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-conditional/compiled_conditional.cpp.o": "af7ce0390e74eaa18614408c91e692fee4887b2fcfb69c1eea3a781f2c903b81",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/arange.cpp.o": "3c9a2b2caac2bce7cbff8b998c66666a55ffbba3d6cd78c47d703f8f0a3b2b43",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary.cpp.o": "e23b144678ac3882051fdea71b2db0dfa8bfd6c0bcf5b90421aa326d2ec161a0",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_ops.cpp.o": "0820b0eb53d379983d9f797527f1bc3320361a1a94ba0ea784e9d4b3d8e974ad",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/binary_two.cpp.o": "bdc0a4f184ae160cf9469acc0560608536a2f71e127fa2afdfa32e9f7798f964",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/compiled_preamble.cpp.o": "851065037d02bffeb8f76fcc71b996d7855b3a536a559ceb49655370d8725251",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/conv.cpp.o": "8db83fdd392a3b85a76d20468a3e8eff56056b68476fbbf9b4eafc2323614ab0",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/copy.cpp.o": "fb6a86580681b44610db9e0263e79cef61f83e8bd2aa7813d6a22e81cd0523ce",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fft.cpp.o": "3659fe8f05ef5932e5f9d9460d2f589974c5b738e8573d2ac968f80dbd383b0d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized.cpp.o": "c944fd234df46a3061f51c60b70972864058b05b6dc36f67d42c33e953399f1c",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/fp_quantized_nax.cpp.o": "8b5f62fa53145a060531af2f19a9ed5fa9f04c195371e47f1f2249d866693fce",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather.cpp.o": "18f727f2638c178c9b67a9736e862a7b950644bf8e637489718da38498f0fc09",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_axis.cpp.o": "e691bd82ed1d1b358306be221c913d87f2d2a3cb925cbbd0fb1171386a745667",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gather_front.cpp.o": "0b2a408e7fd6d9ee9e307d7103cad98192640bc3014012bbbdacd371a8f200fc",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm.cpp.o": "79bbcf2abdb0e9e45f7adbde37811be39c1eeee44747b4b9383e48baa345b539",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemm_nax.cpp.o": "c4b7b788b5b13c9d661ee09dd3c6d52edadd761509eceb100a4339891f9a5de6",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/gemv_masked.cpp.o": "c6bd288c241bd0735c2721f47cd96a1cddc13672292b50b246ab25fcc4ec1561",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/hadamard.cpp.o": "1a6def72c5bd7ff49a5ea9120787bef731eb1a5d7ef96e42c4245f29b638e428",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/logsumexp.cpp.o": "0970e2ee305242d8cd764567716f6c44631e6b5d9955182a304b8caaa1182d16",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/masked_scatter.cpp.o": "5a8759be17dfc581de12977430fa0f879efc3f4b17b9c19f2af19e5cd615f462",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized.cpp.o": "1e0c182c80e558756b9f39cb3c7dd89ea5730f7faed63828f448531677a625a1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_nax.cpp.o": "257190e7d703f137372d47c373c5536caa7a6a066e2c2d77074ca324d06f28d2",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/quantized_utils.cpp.o": "6d2eb0e880fbaca30508971421d725f60679b67a300e45d6bf9cdd86a86215e3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce.cpp.o": "913d0c1e9a26c88aacce7940eff3db218a43d4cb4a1ef7af928a019f1d23d57c",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/reduce_utils.cpp.o": "9c037b06579d5a903aea93c02de5fe35be08f004e320911bdca260e93c9dcbac",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scan.cpp.o": "9422c9ed3ce356965fa1f25af419835201bd32301e2775559c4801b90f729d20",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter.cpp.o": "9303de749ea4b01d183a64ef286334059189e50dfb7a784a53af62aeaaf83b15",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/scatter_axis.cpp.o": "715aebf787d11add63df3f517227c7b690eb7c78d49a2d061fe9edc4a143ad84",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/softmax.cpp.o": "0fb0269673db54b5dd17c59cbf23eb689e94be76958d6a846e8a9eba3d50b792",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/sort.cpp.o": "4e3d7479625da6d164d62a9ae9d8477292a6dec121473e1ac9f188bae63cb248",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention.cpp.o": "6b182f3a2d81a8491a172a919c9acfc7ee568861128a1da040b37b3b1c1f0a8e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_attention_nax.cpp.o": "c4835e907986c4a184c34c3a5cfc85cd6b2325eba66f662cfd56f6bc0b459c20",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv.cpp.o": "1d1baecd95c91d9481fed8ce793504bd9c84f7281f3e4805c71963da5bb115b9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_3d.cpp.o": "762d30a49c39ebceba474a81090fcda2e9670e4767a395c1a53ca04f01e202b4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_conv_general.cpp.o": "97479dd7f25ef087223d7f8b61ff71119097412a44ed833e9e37ae4d99686755",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused.cpp.o": "e09aed537fce301eb05893442c65e0ff638ef4045d831d0e40f4f2b5621451f8",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_fused_nax.cpp.o": "d57df12d7db01db6d26cbb6447594d29b016f9b24f84eb930ca44275d100b74d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather.cpp.o": "49796b962b48a84dd743dcc6b610c7b01da199c55109a228fd348d08c2b16622",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_gather_nax.cpp.o": "da58927f75a52e5b360e4a77c7efdc5669168730ce34cf6cb2f2c36775f278e0",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_masked.cpp.o": "e1bc2327eb2a4386b0b064400de87965c9efb96dd490cbf71b4d26cfb4aeb9e5",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_segmented.cpp.o": "f9656b7d816fa173636d75cb0b0c3ca7de1d6bde6d447bc6b5fba07b8fe8274a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk.cpp.o": "e5f8b52754a5ac642c35af0bb52b4b735f94a8b40d1f362414653e1d4e864cb3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/steel_gemm_splitk_nax.cpp.o": "9440bdef84a191f36dec6122aa42769ec9dfc813732f31b14c3f1b818f3e8e44",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary.cpp.o": "fa8c7251c79a1f93bbfa933913e09ffdcb850867fb6e91567d8b30a7db7927fa",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/ternary_ops.cpp.o": "23cc2755bf280a5edffc3050ef591016f32082611bf4292c110dde4a8b058dd3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary.cpp.o": "79e1d8824408bd5ddcad5b51484b322fc327ec08fde04fd53d6bac8d6ac974e9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/unary_ops.cpp.o": "618b447a12b5243470c955832d5864ba52835b79207168b64569bd34fc19a112",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Cmlx.build/mlx-generated/utils.cpp.o": "6e777139be46bd4cdfe9a8ca0e04baf55e915050b05c5658063db7b491cd32a9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AdditiveArithmetic.swift.o": "a69d464f901e019c44155221cd05f132384ecd2364c883aaee5486690f507011",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+AlgebraicField.swift.o": "eba8a96b7796b6c6a193541ee01ec68e60cdcbce0292f28734ef864eb633b3eb",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Codable.swift.o": "72d6dadc294a92ac8ea8f5d7d77968b5003bdfaca2497fc78aacefaa294a888c",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+ElementaryFunctions.swift.o": "7409e952a8b103cd377ecd1c977f3f080a822f5dc3683bcc59aa65c4f3971155",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Hashable.swift.o": "1bc1dfe97bf8ea0bba48b999e4af7d1550c91599ea10d1dabeab79e7fe279198",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+IntegerLiteral.swift.o": "ce1349ac92d903eaa8b2f6dde3b08905fca22ee2108bd31fd560d2bc8e2d5ef5",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+Numeric.swift.o": "6cd53c41482fa9f2d7bad46ef12e332a1881aa30e91cb4178bbed7184d5691b3",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex+StringConvertible.swift.o": "423f0543333749762d29516681ca5655108dc5e3ddbfc62ad3525f04eafbef43",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Complex.swift.o": "094f21373bb5a36434dc7dfabf19460def2b00e4aa13b07edbb333fc3b42a402",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Polar.swift.o": "6e625e79d1d2d1c24a42f75c5b63787577cb13555b186262fa600756d75b329f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/ComplexModule.build/Scale.swift.o": "4f16291134816209e2cdf307ca427ee47235ed9bf8982d04cdd96107b6b864b1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ArrayAt.swift.o": "84bab294a10b59ffd284b93a8455bd5bf3630277d4cf333e466b2cf87bb8b947",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Cmlx+Util.swift.o": "75a521939250f35f390be134af117e9dc61037dac4ff0ade08bf92218e57d44f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/DType.swift.o": "34d20175e0524325677bc8103616c91958fd1e091f8bde75280a6ec8d89eb862",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Device.swift.o": "6b97d288b86bdc27716b7e6e465bf5b9d1f433c73ec72579cd9316ef2409cd25",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ErrorHandler.swift.o": "0e1e2cd69f22360b7eb04c125f8482a112aeb9005dae66ea4fa24da58191e034",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Export.swift.o": "0b8ce025fd5c396b85b6eb5656914cda0867cabf133566e3c025193931084694",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/FFT.swift.o": "16e41f83ec533894ebef784632a6e98091bcf00d405dde82be85de408cfa5f00",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Factory.swift.o": "9f78dcb9a23c76af2543ac28d0e57482defc000f13f577678c0290e713c185ca",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Foundation+Util.swift.o": "5ea528aec5edd6469e4b7568feda26efb3c87d93d143ad6a2cb177e5a34fb0dd",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/GPU+Metal.swift.o": "02546f4b66d6fa35f0923ff2deffbefb4011910b02010e06ecdcdc7086052d53",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/IO.swift.o": "82a3dc942750f611910c7a29814e4de7c8695ab1921dfaa649303921db9d907a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Linalg.swift.o": "ba47eb93a185956f080a648a6cb06291d37fce67ac4937641deafa2c15879a9d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Bytes.swift.o": "00af9ffbf607691fd965bf6fec0107e17bf2ed1d6f91380f5e64320fa3ae1ec8",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Indexing.swift.o": "751d23d270550cd969ad25d21c290cca64d0f0a0845d7caa2345e435f9b724f2",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Init.swift.o": "3140f413206c893d1fcd17696ac084c97ccce4e7adf852411f1a5088d9ac8650",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Metal.swift.o": "05716b0f8e1853c064ba5d4e0fded0ec3b59916f85e4d74035bdd41b6c3c83d9",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Normalizer.swift.o": "a21f2b51fe66070988772fab40ad497bd72be568910cc687a682d18688c8a313",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+Ops.swift.o": "1683fd5a0775f73a1ff3521223cb5e4f0233aec23e8e17c3d2dc3cfa51437c53",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray+maskFill.swift.o": "e1b8c30e04e04c4992da6641366faafda3f7955c5585d657f76d6b86254b2ec4",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXArray.swift.o": "347c54a948d9e138645a054f9d20559689f46cb9e1927d39444337590a1b71aa",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXCustomFunction.swift.o": "1b4bb8c2f4250409976b23ff07cff414af7d42a3f393092b5eb9162c3a3996ec",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFast.swift.o": "6f9fc8aa1edd0becca15af2b61aef439a86bd4e2c7c566aa7d4d30f1d9d092dc",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/MLXFastKernel.swift.o": "632e246c233c5d19044c7d4fb3924e22c72065666269759d4363b8808c1f79f1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Memory.swift.o": "cb08bae8b9c96cb709cb4676bafa146da99c7b0af179454a9cbe4a0cac6af30a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Nested.swift.o": "ee31ff1c33d3e19e0b7a66a77c80b7fc39ab731f2665f9e25c009f5c317b1c95",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops+Array.swift.o": "526cdf83159dc6010b02261cb0d36282259c8d194cd4a88fc9714588b9932238",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Ops.swift.o": "a0fc7cc1a71eb0d0413f7cc0ddc017dd4fabe257bd1a2fabb62f0ed0fe979ac6",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/ParameterTypes.swift.o": "e0ccf750d81190bfa43cec7058f0effe35754ab29faea583d49078722988df3f",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Protocols.swift.o": "d8baa0e2bee717fcf6bd2699be6faaa5f686729564bdddeac02708841ea4bf25",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Random.swift.o": "88ec4d44977072165b7dbd5940ac089980803d2c531acc473c6e1148c3666ee7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/State.swift.o": "1880591bd2dd331b8f03949c86477ad33479bbeba7d7558aa36f48d4c813b490",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Stream.swift.o": "f5b3a513906807e6a1f0f7b0014ee8b5251baf5850efe2f87ff84bd67da2487d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Compile.swift.o": "8e91ad773c18b6c9feeabd42927672078f710d9563d1f03e89a7e17957dd9baa",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+CompileOverloads.swift.o": "cda378a0ed311d80cc5737ae31214e54c2d1123621a065b1b2e2c0ffe84f4f96",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Eval.swift.o": "60c49bea3adbb72d494cb23d5b018483ab7632856c6a0ac666039398bbffb4d1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Grad.swift.o": "fc199078c7e6cc48f238ce0dd5125a3615f757880192a34787980fb8a77e4dd0",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Internal.swift.o": "13abc5004d3f85cab008f940bbf7447b5ec26fd68926b58cbbfd12854c370463",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms+Vmap.swift.o": "f3b88c8e08d1c5c545fb5054513b64f6834806d35b2e395098ce8052a04be795",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/Transforms.swift.o": "a09e4bc4bf57fb13c636ef51c5641669b0fe6d3fc7ed21e48e607a0389ffd80e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/MLX.build/WiredMemory.swift.o": "9aa95a6e85e822e4160571214b0d4baba24a9db51bc4cb7de0b5959d4371b9aa",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/ComplexModule.swiftmodule": "f4f78bc6fa741850deaf7da3f213909ae6ba0ad63404a8271344497db0af2a61",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/MLX.swiftmodule": "07ffbc362911aa40f89a820dd526cdf3c1c27764f6fcfab035b71aeb08d31984",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/Numerics.swiftmodule": "b855c0df442fd2baf4f82dd412ca1a844f8536c3069ebf72d8d2628c38c5d2b1",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Modules/RealModule.swiftmodule": "7674a92e29d5d93f24a30891fe17ea92eb2ef3eb20008c7aef67bcf563f1b8f7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/Numerics.build/Numerics.swift.o": "ab18464a9dd302ea47951c15ad6f4ac874bc5135f0510d01ff9003e122a73d45",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AlgebraicField.swift.o": "6824cdc8fa1e064644fba63d549b948ae7747126e73e82d5be36472d6200d706",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ApproximateEquality.swift.o": "c8faac7ab4ce7ea0de7de3171c4a5943902f32e39a3f16a0e4bd64264bbb3457",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/AugmentedArithmetic.swift.o": "acd82faee4a1033542ff9d13f3cd48505cdb56f2c007cec92fcf6cd3d7008b4e",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Double+Real.swift.o": "de2a8401e56ff115a990ef6665b1c8e55b47a05ee72dd07f8a0264edb22fcc1d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/ElementaryFunctions.swift.o": "ca595b82373d61a316003b9f6d83b88a4e9d5f2ec19b00d230a4785698789ae7",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float+Real.swift.o": "be994cb74388a175f7af2c4562168a9a3e72e9cfd8fa7a6ecdfeef24e0bf3c0a",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float16+Real.swift.o": "db8b057cc6aab3d803d85903afec2617a7a4ab5839b759f3c5854d4942a44631",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Float80+Real.swift.o": "85d5fe5d368547fff5c594292cd23a1eea5a3dc367f15c13453a3574771fab12",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/Real.swift.o": "83d203a7c0aa3b5a70ef26971be2ad0e8e7273d8d3783f1761018560506b481d",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RealFunctions.swift.o": "4ac89fe2bdbe467a897695b111a83aea078bc13df5743222e69a845cb6382391",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/RealModule.build/RelaxedArithmetic.swift.o": "4e5565a2d8ff2ea6a2dfda6565f0a508328b9963f2e40f5e76b67ea36181eb48",
      "/Users/carlos/Projects/slotstream/.build/arm64-apple-macosx/release/_NumericsShims.build/_NumericsShims.c.o": "b2e808dc4875069f768072c7800ea6ba8b548f9a222478b3e07f069b4d17f120",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/array.h": "d2205ba0ce146ff722f2ca97c170facb19b28784e7ffa47a07cdad69651c9801",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/closure.h": "b43a6d7c0e943a8df0f67377d49d92f4fa76eea79eed049adaff80e05ed854f7",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/compile.h": "448c6aafe37d52c82f63311a8ab3e1b876f7b0d7fcdc250d91a0ac1105a4b531",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/cuda.h": "ee99d74dc4131dca3ec7ab7d9015ff109481ee6fbcf3c015de7ebfdcc7df2644",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/device.h": "3e7556aab2f97fddf943b8f6e30b62064ee589705ad1643716bdd7ea37d6fe2f",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/distributed.h": "68b1dcbdc8dc8c1b4d58220caa7aec2396776282691e99999ff6547b52f7e28e",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/distributed_group.h": "26334e23cabc877a77a85ee212f8c498f35ae9426036b99957a106afe28a0c0e",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/error.h": "80090e79eb9add61961885e7aa491b9f47d1b838d188303734490e528b0db2c2",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/export.h": "723346c34761fb87c9a03a133ecff8f9fd8f83a3d80e680d63557c58739e11c1",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/fast.h": "b24116ec6a5558e976cbdb14474c2e8f88710bf68f7cb5da02d5ba3fa4b385be",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/fft.h": "21a73e39cb7a8f3a69590fff88017f524ff0a9761027c9bf0441f97afb88ffec",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/half.h": "90d57285c4b8436fbea18758661e84bf962c13179d545bbaac52b176de899ed8",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/io.h": "3a076e00fbfbec9d45160b61695e19b72377389cde4d79e0a317cc58abb2a4bd",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/io_types.h": "892e3108eb50b8414091b67d01241ad6b1ccd815fca60cdc707e5e96dbb226f6",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/linalg.h": "10512f19bfcf3f1f6ed9e3de07d43f84dd3492833e7b0ab6e0288ba552f73266",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/map.h": "4d5df4eef2757ca76b83dea06935568611d439ad3a8687c3b0df739902377a4d",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/memory.h": "850ae0be9ac300cfae23ee259441dca2a1e2055606427ac26f3d967b5c03a6e8",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/metal.h": "58ebd8b50add425f046d5fb5ef1bc747eff347b79db8a2b01f6af3967435b8be",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/mlx.h": "aeb941792b77d0de4101d3299f8f24bebfaa478965c466151adbf02702249c76",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/ops.h": "d540165d1321768a4039d0d436e004959e197026b6f9ec964730e3a03746d586",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/optional.h": "b0f20e24bd02cba4c2f624cd83f68a096a9d4ae6b2e4c4eb30d13719660ecf36",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/random.h": "7b21eea9c4b0b19636365b114f36d54ed1e534d9b353446b37aae8f9c3ef4df3",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/stream.h": "560e537e50cdc313c6651ab55e9a116721c591efff778de7b293440ee39cabaf",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/string.h": "29b3cfafb60b536a27c2ad96f9868c892e9242754868e1b770f55b7cf34ef598",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/transforms.h": "2cf31bbda041fdf60a83243cff2f9d000cff148b153f406158f8e77ff2072ceb",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/transforms_impl.h": "2700a13d26aa07339a815b4762b74d9bd6ffa0a9a21298be828ca367b5817701",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/vector.h": "b75108edace10f99f01da0dcb08a146d1449dcfcaaa24aa7b66e48e9f227e2c7",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx/c/version.h": "d1c9aecddd98ad6c16b7c56c056f5b1040a633c4548fe97297481fd625450810",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/mlx.h": "c9c79beb34545869213b31a290d159ba61afb7792b7500ca5f43d60d6b861474",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/Cmlx/include/module.modulemap": "a97dea631e9b7fa3b130b39f88b947d521e67e1ba5819e90b194abbe84a372d8",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/MLX/Memory.swift": "cb6976cc37aa3e8a0fa1be8269fea2869ecdf5951e469556f67e21604b1701f8",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/MLX/Ops.swift": "f79d9e5032b32cfee1744d5371a62a554be2e39c8a7165b4b022cbc4d4a2609e",
      "/Users/carlos/Projects/slotstream/.build/checkouts/mlx-swift/Source/MLX/Transforms+Eval.swift": "14b867c903be78547b426305257ca70e214b7b854acf1c0dc2cf7c82333f4999",
      "/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/_NumericsShims.h": "361bd79467ead784ac39b7f187895f996e149d017a7270dc590d01ffa0037b3a",
      "/Users/carlos/Projects/slotstream/.build/checkouts/swift-numerics/Sources/_NumericsShims/include/module.modulemap": "c97db16dd177b4cee16673108b1dd2703d5cba99132ae45e16e4c0945941d8ed",
      "/tmp/slotstream-optimization-execution/compact-window-native-v303/Probe.swift": "9c33545dac887f211b634987e6bae269bc87bfa822f1bd469f5c475e666984c8"
    },
    "object_count": 243,
    "module_version": "0.31.6",
    "metal_source": "/Users/carlos/Projects/slotstream/.build/optimization/read-failure-candidate-build-v280/candidate/mlx.metallib",
    "metal_sha256": "198488eb61359e953580a9c4530400feee1a06dd2f28a930a6ffa58aec66a597",
    "source_sha256": "9c33545dac887f211b634987e6bae269bc87bfa822f1bd469f5c475e666984c8",
    "protocol": {
      "parent_prompt_rows": [
        17,
        256,
        4096
      ],
      "fixed_pairs_per_shape": 16,
      "iterations_per_arm": 64,
      "warmup_batches_per_arm": 1,
      "minimum_clean_pairs": 5,
      "replacement_rounds": 0,
      "byte_equality": true,
      "serving_claim": false
    },
    "prior_failure": {
      "protocol": "/tmp/slotstream-optimization-execution/compact-window-native-v302/protocol.json",
      "protocol_sha256": "bf2fb767f143f189cb21572b4425d260f3ed0b43580d6f08116186a405dcfa26",
      "manifest": "/tmp/slotstream-optimization-execution/compact-window-native-v302/manifest.json",
      "reason": "The result type of asData is nested, not an imported top-level MLXArrayData. Use the unambiguous access:.copy overload with inferred result types. Only two type annotations change; byte comparison and all performance inputs are preserved. Compile failed before any probe/model execution."
    }
  },
  "wrapper_sha256": "4e792202d3f4687792eccae207b5a816f78093ecb3e5a8b2e5ed0ebb803be636",
  "policy": {
    "startup_reclaimable_bytes": 9500000000,
    "minimum_live_reclaimable_bytes": 6000000000,
    "maximum_owned_rss_bytes": 3000000000,
    "sample_interval_seconds": 0.2,
    "maximum_build_seconds": 240,
    "stop_on_new_swapouts": true
  }
}

````

## /tmp/slotstream-optimization-execution/compact-window-native-v303/run.py

SHA-256 `4e792202d3f4687792eccae207b5a816f78093ecb3e5a8b2e5ed0ebb803be636`.

````text
from pathlib import Path
import datetime
import json
import shutil
import signal
import sys
import time

R = Path('/Users/carlos/Projects/slotstream')
P = Path(__file__).parent
sys.path.insert(0, str(R / 'Tools'))
from prefill_bench import digest, preflight, vm_snapshot
from serve_bench import competing_jobs
from optimization_readiness import pressure_snapshot, require_normal
from optimization_serial_build import guarded_run

deadline = datetime.datetime.fromisoformat(sys.argv[1].replace('Z', '+00:00')).timestamp()
if deadline - time.time() < 330: raise RuntimeError('native component requires five reserved minutes and cleanup')
preparation = json.loads((P / 'preparation.json').read_text())
identity = preparation['input_identity']
assert all(digest(Path(p)) == h for p, h in identity.items())
assert digest(Path(preparation['metal_source'])) == preparation['metal_sha256']
policy = {'startup_reclaimable_bytes': 9_500_000_000, 'minimum_live_reclaimable_bytes': 6_000_000_000,
    'maximum_owned_rss_bytes': 3_000_000_000, 'sample_interval_seconds': .2,
    'maximum_build_seconds': 240, 'stop_on_new_swapouts': True}
s = {'classification': 'Compile/link a standalone native Swift component against243 pinned existing MLX/Cmlx/Numerics objects, then run48 fixed component pairs and12 byte/optional-state cases. No Slotstream model or runtime source change and no serving-speed claim.',
    'deadline_utc': sys.argv[1], 'preparation': preparation, 'wrapper_sha256': digest(Path(__file__)), 'policy': policy}
with (P / 'protocol.json').open('x') as out: out.write(json.dumps(s, indent=2) + '\n')
r = {'passed': False, 'protocol_sha256': digest(P / 'protocol.json'), 'steps': []}
begin = time.monotonic()
def interrupted(number, _): raise KeyboardInterrupt(f'native component interrupted by signal{number}')
signal.signal(signal.SIGINT, interrupted)
signal.signal(signal.SIGTERM, interrupted)
def snapshot():
    state = vm_snapshot()
    require_normal(pressure_snapshot())
    return state
try:
    r['before'] = preflight(9.5)
    snapshot()
    assert not competing_jobs()
    assert not (P / 'mlx.metallib').exists()
    shutil.copyfile(preparation['metal_source'], P / 'mlx.metallib')
    assert digest(P / 'mlx.metallib') == preparation['metal_sha256']
    for name, command in [('compile', preparation['compile_command']), ('run', preparation['run_command'])]:
        available = int(deadline - time.time() - 30)
        if available < 90: raise RuntimeError('insufficient remaining interval before ' + name)
        current = dict(policy, maximum_build_seconds=min(240 if name == 'compile' else 90, available))
        row = {'name': name, 'command': command, 'passed': False}
        r['steps'].append(row)
        print('Starting ' + name, flush=True)
        with (P / (name + '.stdout.txt')).open('w') as out, (P / (name + '.stderr.txt')).open('w') as err:
            result = guarded_run(command, cwd=R, stdout=out, stderr=err,
                record_path=P / (name + '.memory.json'), snapshot=snapshot, policy=current,
                classification=s['classification'])
        row['exit_code'] = result.returncode
        row['passed'] = result.returncode == 0
        (P / 'manifest.json').write_text(json.dumps(r, indent=2) + '\n')
        if not row['passed']: raise RuntimeError(name + ' failed; no automatic retry')
    report = json.loads((P / 'component-result.json').read_text())
    r['passed'] = report['passed'] is True and report['edge_cases'] == 12
    r['summaries'] = [{'parent_prompt_rows': c['parent_prompt_rows'], **c['summary']} for c in report['cases']]
    r['binary_sha256'] = digest(P / 'probe')
except BaseException as error:
    r['error'] = f'{type(error).__name__}: {error}'
finally:
    r['elapsed_seconds'] = time.monotonic() - begin
    (P / 'manifest.json').write_text(json.dumps(r, indent=2) + '\n')
    for key, function in {'after': vm_snapshot, 'pressure': pressure_snapshot,
        'identity_unchanged': lambda: all(digest(Path(p)) == h for p, h in identity.items()),
        'remaining_jobs': competing_jobs, 'model_lock_free': lambda: bool(preflight(0))}.items():
        try: r[key] = function()
        except BaseException as error: r.setdefault('cleanup_errors', {})[key] = str(error)
    r['within_reservation'] = time.time() <= deadline
    r['passed'] = bool(r['passed'] and not r.get('cleanup_errors') and r.get('identity_unchanged')
        and not r.get('remaining_jobs') and r.get('model_lock_free')
        and r.get('pressure', {}).get('level') == 1 and r['within_reservation'])
    (P / 'manifest.json').write_text(json.dumps(r, indent=2) + '\n')
print(json.dumps({k: v for k, v in r.items() if k not in ['before', 'after', 'steps']}), flush=True)
raise SystemExit(0 if r['passed'] else 1)

````

## /tmp/slotstream-optimization-execution/compact-window-native-v303/run.stderr.txt

SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.

````text

````

## /tmp/slotstream-optimization-execution/compact-window-native-v303/run.stdout.txt

SHA-256 `e9d49e1478b0334c6a00bd354fb0d7de1727293202df6e019567c85477c1dc35`.

````text
{"length":17,"summary":{"clean_pairs":16,"median_joined_seconds":0.00027579003906250002,"median_paired_reduction_percent":47.315092297160277,"median_separate_seconds":0.00053794824218749999}}
{"length":256,"summary":{"clean_pairs":16,"median_joined_seconds":0.00025496386718750001,"median_paired_reduction_percent":48.09678912534018,"median_separate_seconds":0.00049490982812499997}}
{"length":4096,"summary":{"clean_pairs":16,"median_joined_seconds":0.00026101985156250002,"median_paired_reduction_percent":46.238403090395721,"median_separate_seconds":0.000511060875}}

````

