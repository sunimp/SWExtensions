//
//  VarInt.swift
//
//  Created by Sun on 2022/10/1.
//

import Foundation

// MARK: - VarInt

/// Integer can be encoded depending on the represented value to save space.
/// Variable length integers always precede an array/vector of a type of data that may vary in length.
/// Longer numbers are encoded in little endian.
public struct VarInt: ExpressibleByIntegerLiteral {
    // MARK: Nested Types

    public typealias IntegerLiteralType = UInt64

    // MARK: Properties

    public let underlyingValue: UInt64
    public let length: UInt8
    public let data: Data

    // MARK: Lifecycle

    public init(integerLiteral value: UInt64) {
        self.init(value)
    }

    public init(_ value: UInt64) {
        underlyingValue = value

        switch value {
        case 0 ... 252:
            length = 1
            data = Data() + UInt8(value).littleEndian

        case 253 ... 0xFFFF:
            length = 2
            data = Data() + UInt8(0xFD).littleEndian + UInt16(value).littleEndian

        case 0x10000 ... 0xFFFF_FFFF:
            length = 4
            data = Data() + UInt8(0xFE).littleEndian + UInt32(value).littleEndian

        case 0x1_0000_0000 ... 0xFFFF_FFFF_FFFF_FFFF:
            fallthrough

        default:
            length = 8
            data = Data() + UInt8(0xFF).littleEndian + UInt64(value).littleEndian
        }
    }

    public init(_ value: Int) {
        self.init(UInt64(value))
    }

    // MARK: Static Functions

    public static func deserialize(_ data: Data) -> VarInt {
        data.ww.to(type: self)
    }

    // MARK: Functions

    public func serialized() -> Data {
        data
    }
}

// MARK: CustomStringConvertible

extension VarInt: CustomStringConvertible {
    public var description: String {
        "\(underlyingValue)"
    }
}
