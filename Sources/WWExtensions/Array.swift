import Foundation

public extension Array {
    
    struct WWExtensions {
        let base: [Element]
        
        func chunked(into size: Int) -> [[Element]] {
            stride(from: 0, to: base.count, by: size).map {
                Array(base[$0 ..< Swift.min($0 + size, base.count)])
            }
        }
        
        func at(_ index: Int) -> Element? {
            guard base.count > index else {
                return nil
            }
            return base[index]
        }
        
    }
    
    var ww: WWExtensions {
        get { WWExtensions(base: self) }
    }
    
}

extension Array.WWExtensions where Element: Hashable {
    
    var unique: [Element] {
        Array(Set(base))
    }
    
}
