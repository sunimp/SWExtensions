# HsExtensions.Swift

HsExtensions library include extensions for different classes for easy converting and transform data

## Requirements
iOS (13.0, *)

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code
and is integrated into the `swift` compiler. It is in early development, but HdWalletKit does support its use on
supported platforms.

Once you have your Swift package set up, adding HdWalletKit as a dependency is as easy as adding it to
the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/horizontalsystems/HsExtensions.Swift.git", .upToNextMajor(from: "1.0.0")),
]
```

for target: []
```swift
dependencies: [
    .product(name: "HsExtensions", package: "HsExtensions.Swift"),
]
```


## License

HsExtensions is available under the MIT license. See the LICENSE file for more info.
