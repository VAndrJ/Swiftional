// swift-tools-version: 6.0

import PackageDescription

let settings: [SwiftSetting] = [
    .enableExperimentalFeature("StrictConcurrency")
]

let package = Package(
    name: "Swiftional",
    platforms: [
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
        .macOS(.v10_15),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "Swiftional",
            targets: ["Swiftional"]
        ),
    ],
    targets: [
        .target(
            name: "Swiftional",
            dependencies: [],
            swiftSettings: settings
        ),
        .testTarget(
            name: "SwiftionalTests",
            dependencies: ["Swiftional"],
            swiftSettings: settings
        ),
    ],
    swiftLanguageModes: [.version("6")]
)
