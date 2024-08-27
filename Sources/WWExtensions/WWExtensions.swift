//
//  WWExtension.swift
//  WWExtensions
//
//  Created by Sun on 2024/8/26.
//

import Foundation

// MARK: - WWExtension

public struct WWExtension<Base> {
    public let base: Base
    public init(_ base: Base) {
        self.base = base
    }
}

// MARK: - IWWExtension

public protocol IWWExtension {
    associatedtype AnyType
    var ww: AnyType { get }
}

extension IWWExtension {
    /// Gets a namespace holder for WW compatible types.
    public var ww: WWExtension<Self> { WWExtension(self) }
}
