//
//  SWExtensions.swift
//
//  Created by Sun on 2024/8/14.
//

import Foundation

// MARK: - SWExtension

public struct SWExtension<Base> {
    // MARK: Properties

    public let base: Base

    // MARK: Lifecycle

    public init(_ base: Base) {
        self.base = base
    }
}

// MARK: - ISWExtension

public protocol ISWExtension {
    associatedtype AnyType
    var sw: AnyType { get }
}

extension ISWExtension {
    /// Gets a namespace holder for SW compatible types.
    public var sw: SWExtension<Self> { SWExtension(self) }
}
