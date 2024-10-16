//
//  Published.swift
//
//  Created by Sun on 2023/4/11.
//

import Combine
import Foundation

// MARK: - PostPublished

@propertyWrapper
public class PostPublished<Value> {
    // MARK: Properties

    public let projectedValue: AnyPublisher<Value, Never>

    private let subject = PassthroughSubject<Value, Never>()

    // MARK: Computed Properties

    public var wrappedValue: Value {
        didSet {
            subject.send(wrappedValue)
        }
    }

    // MARK: Lifecycle

    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
        projectedValue = subject.eraseToAnyPublisher()
    }
}

// MARK: - DistinctPublished

@propertyWrapper
public class DistinctPublished<Value> where Value: Equatable {
    // MARK: Properties

    public let projectedValue: AnyPublisher<Value, Never>

    private let subject = PassthroughSubject<Value, Never>()

    // MARK: Computed Properties

    public var wrappedValue: Value {
        didSet {
            if oldValue != wrappedValue {
                subject.send(wrappedValue)
            }
        }
    }

    // MARK: Lifecycle

    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
        projectedValue = subject.eraseToAnyPublisher()
    }
}
