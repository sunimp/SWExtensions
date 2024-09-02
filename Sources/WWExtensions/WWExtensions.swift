//
//  WWExtensions.swift
//
//  Created by Sun on 2024/8/14.
//

import Foundation

// MARK: - WWExtension

public struct WWExtension<Base> {
    // MARK: Properties

    public let base: Base

    // MARK: Lifecycle

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
