//
//  Optional.swift
//  
//
//  Created by Volodymyr Andriienko on 20.09.2022.
//

import Foundation

extension Optional {
    /// Case analysis for the `Optional` type.
    /// Applies the provided closures based on the content of this `Optional` value.
    ///
    /// - Parameters:
    ///   - onNone: Closure to apply if the contained value in this `Optional` is `.none`.
    ///   - onValue: Closure to apply if the contained value in this `Optional` is `.some(Wrapped)`.
    /// - Returns: Result of applying the corresponding closure to this value.
    public func fold<T>(_ onNone: () throws -> T, _ onValue: (Wrapped) throws -> T) rethrows -> T {
        switch self {
        case .none:
            return try onNone()
        case let .some(value):
            return try onValue(value)
        }
    }
    
    /// Case analysis for the `Optional` type.
    /// Applies the provided closures based on the content of this `Optional` value.
    ///
    /// - Parameters:
    ///   - onNone: Closure to apply if the contained value in this `Optional` is `.none`.
    ///   - onValue: Closure to apply if the contained value in this `Optional` is `.some(Wrapped)`.
    /// - Returns: Result of applying the corresponding closure to this value.
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @Sendable
    public func fold<T>(_ onNone: @Sendable () async throws -> T, _ onValue: @Sendable (Wrapped) async throws -> T) async rethrows -> T {
        switch self {
        case .none:
            return try await onNone()
        case let .some(value):
            return try await onValue(value)
        }
    }
}
