// swift-tools-version:5.7

import PackageDescription

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
            dependencies: []
        ),
        .testTarget(
            name: "SwiftionalTests",
            dependencies: ["Swiftional"]
        ),
    ]
)
