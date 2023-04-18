// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Swiftional",
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
