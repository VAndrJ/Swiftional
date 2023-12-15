//
//  Bool.swift
//  
//
//  Created by Volodymyr Andriienko on 10.02.2022.
//

import Foundation

// MARK: - Foldable

extension Bool {
    /// Case analysis for the `Bool` type.
    /// Applies the provided closures based on the value.
    ///
    /// - Parameters:
    ///   - onFalse: Closure to apply if false.
    ///   - onTrue: Closure to apply if true.
    /// - Returns: Result of applying the corresponding closure to this value.
    public func fold<R>(_ onFalse: () throws -> R, _ onTrue: () throws -> R) rethrows -> R {
        try self ? onTrue() : onFalse()
    }

    /// Case analysis for the `Bool` type.
    /// Applies the provided closures based on the value.
    ///
    /// - Parameters:
    ///   - onFalse: Closure to apply if false.
    ///   - onTrue: Closure to apply if true.
    /// - Returns: Result of applying the corresponding closure to this value.
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @Sendable
    public func fold<R>(_ onFalse: @Sendable () async throws -> R, _ onTrue: @Sendable () async throws -> R) async rethrows -> R {
        try await self ? onTrue() : onFalse()
    }

    /// Runs the provided closures based on the content of this value.
    ///
    /// - Parameters:
    ///   - onFalse: Closure to apply if false.
    ///   - onTrue: Closure to apply if true.
    public func foldRun(_ onFalse: () throws -> Void, _ onTrue: () throws -> Void) rethrows {
        try self ? onTrue() : onFalse()
    }

    /// Runs the provided closures based on the content of this value.
    ///
    /// - Parameters:
    ///   - onFalse: Closure to apply if false.
    ///   - onTrue: Closure to apply if true.
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @Sendable
    public func foldRun(_ onFalse: @Sendable () async throws -> Void, _ onTrue: @Sendable () async throws -> Void) async rethrows {
        try await self ? onTrue() : onFalse()
    }
}

// MARK: - Either

extension Bool {
    /// Case analysis for the `Bool` type.
    /// Applies the provided closures based on the value.
    ///
    /// - Parameters:
    ///   - onFalse: Closure to apply if false.
    ///   - onTrue: Closure to apply if true.
    /// - Returns: The result of `Ether` applying the appropriate closure to this value.
    public func foldEither<L, R>(_ onFalse: () throws -> L, _ onTrue: () throws -> R) rethrows -> Either<L, R> {
        try self ? .right(onTrue()) : .left(onFalse())
    }

    /// Case analysis for the `Bool` type.
    /// Applies the provided closures based on the value.
    ///
    /// - Parameters:
    ///   - onFalse: Closure to apply if false.
    ///   - onTrue: Closure to apply if true.
    /// - Returns: The result of `Ether` applying the appropriate closure to this value.
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @Sendable
    public func foldEither<L, R>(_ onFalse: @Sendable () async throws -> L, _ onTrue: @Sendable () async throws -> R) async rethrows -> Either<L, R> {
        try await self ? .right(onTrue()) : .left(onFalse())
    }
}
