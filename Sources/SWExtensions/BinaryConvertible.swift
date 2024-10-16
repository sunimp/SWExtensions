//
//  BinaryConvertible.swift
//
//  Created by Sun on 2022/9/20.
//

import Foundation

// MARK: - BinaryConvertible

public protocol BinaryConvertible {
    static func + (lhs: Data, rhs: Self) -> Data
    static func += (lhs: inout Data, rhs: Self)
}

extension BinaryConvertible {
    public static func + (lhs: Data, rhs: Self) -> Data {
        lhs + withUnsafePointer(to: rhs) { ptr -> Data in
            Data(buffer: UnsafeBufferPointer(start: ptr, count: 1))
        }
    }

    public static func += (lhs: inout Data, rhs: Self) {
        lhs = lhs + rhs
    }
}

// MARK: - UInt8 + BinaryConvertible

extension UInt8: BinaryConvertible { }

// MARK: - UInt16 + BinaryConvertible

extension UInt16: BinaryConvertible { }

// MARK: - UInt32 + BinaryConvertible

extension UInt32: BinaryConvertible { }

// MARK: - UInt64 + BinaryConvertible

extension UInt64: BinaryConvertible { }

// MARK: - Int8 + BinaryConvertible

extension Int8: BinaryConvertible { }

// MARK: - Int16 + BinaryConvertible

extension Int16: BinaryConvertible { }

// MARK: - Int32 + BinaryConvertible

extension Int32: BinaryConvertible { }

// MARK: - Int64 + BinaryConvertible

extension Int64: BinaryConvertible { }

// MARK: - Int + BinaryConvertible

extension Int: BinaryConvertible { }

// MARK: - Bool + BinaryConvertible

extension Bool: BinaryConvertible {
    public static func + (lhs: Data, rhs: Bool) -> Data {
        lhs + (rhs ? UInt8(0x01) : UInt8(0x00)).littleEndian
    }
}

// MARK: - String + BinaryConvertible

extension String: BinaryConvertible {
    public static func + (lhs: Data, rhs: String) -> Data {
        guard let data = rhs.data(using: .ascii) else {
            return lhs
        }
        return lhs + data
    }
}

// MARK: - Data + BinaryConvertible

extension Data: BinaryConvertible {
    public static func + (lhs: Data, rhs: Data) -> Data {
        var data = Data()
        data.append(lhs)
        data.append(rhs)
        return data
    }
}
