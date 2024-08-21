import Foundation

public struct WWExtension<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

public protocol IWWExtension {
    associatedtype AnyType
    var ww: AnyType { get }
}

extension IWWExtension {
    /// Gets a namespace holder for WW compatible types.
    public var ww: WWExtension<Self> {
        get { WWExtension(self) }
    }
}
