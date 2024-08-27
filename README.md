# WWExtensions.Swift

WWExtensions library include extensions for different classes for easy converting and transform data

## Requirements
iOS (13.0, *)

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code
and is integrated into the `swift` compiler. It is in early development, but HdWalletKit does support its use on
supported platforms.

Once you have your Swift package set up, adding HDWalletKit as a dependency is as easy as adding it to
the `dependencies` value of your `Package.swift`.

```swift
dependencies: [
    .package(url: "https://github.com/sunimp/WWExtensions.Swift.git", .upToNextMajor(from: "1.1.0")),
]
```

for target: []
```swift
dependencies: [
    .product(name: "WWExtensions", package: "WWExtensions.Swift"),
]
```


## License

WWExtensions is available under the MIT license. See the LICENSE file for more info.
