// swift-tools-version:5.8

import PackageDescription

let settings: [SwiftSetting] = [
    .enableExperimentalFeature("StrictConcurrency")
]

let package = Package(
    name: "Swiftional",
    platforms: [
        .iOS(.v11),
        .watchOS(.v4),
        .tvOS(.v11),
        .macOS(.v10_13),
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
