//
//  Published.swift
//  WWExtensions
//
//  Created by Sun on 2024/8/26.
//

import Foundation
import Combine

// MARK: - PostPublished

@propertyWrapper
public class PostPublished<Value> {
    private let subject = PassthroughSubject<Value, Never>()
    public let projectedValue: AnyPublisher<Value, Never>

    public var wrappedValue: Value {
        didSet {
            subject.send(wrappedValue)
        }
    }

    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
        projectedValue = subject.eraseToAnyPublisher()
    }
}

// MARK: - DistinctPublished

@propertyWrapper
public class DistinctPublished<Value> where Value: Equatable {
    private let subject = PassthroughSubject<Value, Never>()
    public let projectedValue: AnyPublisher<Value, Never>

    public var wrappedValue: Value {
        didSet {
            if oldValue != wrappedValue {
                subject.send(wrappedValue)
            }
        }
    }

    public init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
        projectedValue = subject.eraseToAnyPublisher()
    }
}
