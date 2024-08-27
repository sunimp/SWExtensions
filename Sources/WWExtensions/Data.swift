//
//  Data.swift
//  WWExtensions
//
//  Created by Sun on 2024/8/26.
//

import Foundation

extension Data {

    public init<T>(from value: T) {
        self = withUnsafePointer(to: value) { (ptr: UnsafePointer<T>) -> Data in
            Data(buffer: UnsafeBufferPointer(start: ptr, count: 1))
        }
    }
}

// MARK: - Data + IWWExtension

extension Data: IWWExtension { }

extension WWExtension where Base == Data {

    public var hex: String {
        base.reduce("") {
            $0 + String(format: "%02x", $1)
        }
    }

    public var hexString: String {
        "0x" + hex
    }

    public var reversedHex: String {
        Data(base.reversed()).ww.hex
    }

    public var bytes: [UInt8] {
        Array(base)
    }

    public func to<T>(type _: T.Type) -> T {
        base.withUnsafeBytes { $0.baseAddress!.assumingMemoryBound(to: T.self).pointee }
    }

    public func to(type _: String.Type) -> String {
        String(bytes: base, encoding: .ascii)!.replacingOccurrences(of: "\0", with: "")
    }

    public func to(type: VarInt.Type) -> VarInt {
        let value: UInt64
        let length = base[0 ..< 1].ww.to(type: UInt8.self)
        switch length {
        case 0 ... 252:
            value = UInt64(length)
        case 0xfd:
            value = UInt64(base[1 ... 2].ww.to(type: UInt16.self))
        case 0xfe:
            value = UInt64(base[1 ... 4].ww.to(type: UInt32.self))
        case 0xff:
            fallthrough
        default:
            value = base[1 ... 8].ww.to(type: UInt64.self)
        }
        return VarInt(value)
    }

}
