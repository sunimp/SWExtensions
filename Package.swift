// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "SWExtensions",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "SWExtensions",
            targets: ["SWExtensions"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.54.6"),
    ],
    targets: [
        .target(
            name: "SWExtensions",
            dependencies: []),
        .testTarget(
            name: "SWExtensionsTests",
            dependencies: ["SWExtensions"]
        ),
    ]
)
