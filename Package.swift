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
    dependencies: [],
    targets: [
        .target(
            name: "WWExtensions",
            dependencies: []),
        .testTarget(
            name: "WWExtensionsTests",
            dependencies: ["WWExtensions"]),
    ]
)
