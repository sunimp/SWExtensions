//
//  Array.swift
//
//  Created by Sun on 2022/9/20.
//

import Foundation

extension Array {
    public struct SWExtensions {
        // MARK: Properties

        let base: [Element]

        // MARK: Functions

        public func chunked(into size: Int) -> [[Element]] {
            stride(from: 0, to: base.count, by: size).map {
                Array(base[$0 ..< Swift.min($0 + size, base.count)])
            }
        }
        
        public func at(_ index: Int) -> Element? {
            guard base.count > index else {
                return nil
            }
            return base[index]
        }
    }
    
    public var sw: SWExtensions { SWExtensions(base: self) }
}

extension Array.SWExtensions where Element: Hashable {
    public var unique: [Element] {
        Array(Set(base))
    }
}
