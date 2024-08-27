//
//  Array.swift
//  WWExtensions
//
//  Created by Sun on 2024/8/26.
//

import Foundation

extension Array {
    
    public struct WWExtensions {
        
        let base: [Element]
        
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
    
    public var ww: WWExtensions { WWExtensions(base: self) }
    
}

extension Array.WWExtensions where Element: Hashable {
    
    public var unique: [Element] {
        Array(Set(base))
    }
    
}
