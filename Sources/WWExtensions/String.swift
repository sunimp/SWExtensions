//
//  String.swift
//  WWExtensions
//
//  Created by Sun on 2024/8/26.
//

import Foundation

// MARK: - String + IWWExtension

extension String: IWWExtension { }

extension WWExtension where Base == String {

    public var hexData: Data? {
        let hex = base.ww.stripHexPrefix()
        
        let len = hex.count / 2
        var data = Data(capacity: len)
        var s = ""
        
        for c in hex {
            s += String(c)
            if s.count == 2 {
                if var num = UInt8(s, radix: 16) {
                    data.append(&num, count: 1)
                    s = ""
                } else {
                    return nil
                }
            }
        }
        return data
    }
    
    public var reversedHexData: Data? {
        hexData.map { Data($0.reversed()) }
    }
    
    public var data: Data {
        base.data(using: .utf8) ?? Data()
    }
    
    public func stripHexPrefix() -> String {
        let prefix = "0x"

        if base.hasPrefix(prefix) {
            return String(base.dropFirst(prefix.count))
        }

        return base
    }

    public func addHexPrefix() -> String {
        let prefix = "0x"

        if base.hasPrefix(prefix) {
            return base
        }

        return prefix.appending(base)
    }

    public func removeLeadingZeros() -> String {
        base == "0" ? base : base.replacingOccurrences(of: "^0+", with: "", options: .regularExpression)
    }
}
