import Foundation

public extension Data {

    init<T>(from value: T) {
        self = withUnsafePointer(to: value) { (ptr: UnsafePointer<T>) -> Data in
            Data(buffer: UnsafeBufferPointer(start: ptr, count: 1))
        }
    }

}

extension Data: IHsExtension {}

public extension HsExtension where Base == Data {

    var hex: String {
        base.reduce("") {
            $0 + String(format: "%02x", $1)
        }
    }

    var reversedHex: String {
        Data(base.reversed()).hs.hex
    }

    func to<T>(type: T.Type) -> T {
        base.withUnsafeBytes { $0.baseAddress!.assumingMemoryBound(to: T.self).pointee }
    }

}
