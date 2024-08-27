// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWExtensions.Swift",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "WWExtensions",
            targets: ["WWExtensions"]),
    ],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat.git", from: "0.54.0"),
    ],
    targets: [
        .target(
            name: "WWExtensions",
            dependencies: []),
        .testTarget(
            name: "WWExtensionsTests",
            dependencies: ["WWExtensions"]),
    ]
)
