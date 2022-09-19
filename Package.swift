// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HsExtensions.Swift",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "HsExtensions",
            targets: ["HsExtensions"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "HsExtensions",
            dependencies: []),
        .testTarget(
            name: "HsExtensionsTests",
            dependencies: ["HsExtensions"]),
    ]
)
