import Foundation
import Combine

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
