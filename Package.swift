// swift-tools-version: 6.0
import PackageDescription

// Two library products and one executable. `Slotstream` is what an app imports:
// load, plan, chat, status, serve. `SlotstreamDiagnostics` is what the CLI, the
// check runner and CI import: checks, goldens, benches and parity rigs, which
// have no place in a product surface. The executable product keeps the name
// `slotstream` (the target is `slotstream-cli`) so the binary, its install path
// and its release artifact are unchanged.
let package = Package(
    name: "slotstream",
    platforms: [.macOS(.v14)],
    products: [
        .library(name: "Slotstream", targets: ["Slotstream"]),
        .library(name: "SlotstreamDiagnostics", targets: ["SlotstreamDiagnostics"]),
        .executable(name: "slotstream", targets: ["slotstream-cli"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ml-explore/mlx-swift.git", .upToNextMinor(from: "0.31.6")),
        .package(url: "https://github.com/huggingface/swift-transformers.git", from: "1.3.0"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.3.0"),
    ],
    targets: [
        .target(
            name: "Slotstream",
            dependencies: [
                .product(name: "MLX", package: "mlx-swift"),
                .product(name: "MLXNN", package: "mlx-swift"),
                .product(name: "MLXFast", package: "mlx-swift"),
                .product(name: "Transformers", package: "swift-transformers"),
            ],
            swiftSettings: [.swiftLanguageMode(.v5)],
            linkerSettings: [.linkedLibrary("sqlite3")]
        ),
        .target(
            name: "SlotstreamDiagnostics",
            dependencies: ["Slotstream"],
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        .executableTarget(
            name: "slotstream-cli",
            dependencies: [
                "Slotstream",
                "SlotstreamDiagnostics",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ],
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        // Check catalogue, fakes and fixtures. A target rather than a test
        // target because this machine's toolchain is Command Line Tools only:
        // it ships neither XCTest nor Testing, so the catalogue has to be
        // runnable from a plain executable. See docs/TESTING.md.
        .target(
            name: "SlotstreamTestKit",
            dependencies: ["SlotstreamDiagnostics"],
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
        .executableTarget(
            name: "slotstream-checks",
            dependencies: ["SlotstreamTestKit"],
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
    ]
)
