// swift-tools-version: 6.0
// Linux bench harness: the library's exact download engine from the repo,
// with swift-crypto standing in for CryptoKit. Not a supported platform; this
// exists to measure the download code from a gigabit datacenter link.
import PackageDescription
let package = Package(
    name: "pullbench",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.3.0"),
        .package(url: "https://github.com/apple/swift-crypto.git", from: "3.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "pullbench",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Crypto", package: "swift-crypto"),
            ],
            path: "Sources",
            swiftSettings: [.swiftLanguageMode(.v5)]
        ),
    ]
)
