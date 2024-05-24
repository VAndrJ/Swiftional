// swift-tools-version:5.9

import PackageDescription

let settings: [SwiftSetting] = [
    .enableExperimentalFeature("StrictConcurrency")
]

let package = Package(
    name: "Swiftional",
    platforms: [
        .iOS(.v12),
        .watchOS(.v5),
        .tvOS(.v12),
        .macOS(.v10_14),
        .visionOS(.v1),
    ],
    products: [
        .library(
            name: "Swiftional",
            targets: ["Swiftional"]
        ),
    ],
    dependencies: [
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
    ]
)
