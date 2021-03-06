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
    public func fold<R>(_ onFalse: () -> R, _ onTrue: () -> R) -> R {
        self ? onTrue() : onFalse()
    }
    
    /// Runs the provided closures based on the content of this value.
    ///
    /// - Parameters:
    ///   - onFalse: Closure to apply if false.
    ///   - onTrue: Closure to apply if true.
    public func foldRun(_ onFalse: () -> Void, _ onTrue: () -> Void) {
        self ? onTrue() : onFalse()
    }
}

// MARK: - Semigroup

extension Bool: Semigroup {
    public func combine(_ other: Bool) -> Bool {
        self || other
    }
}

// MARK: - Monoid

extension Bool: Monoid {
    public static var empty: Bool { false }
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
    public func foldEither<L, R>(_ onFalse: () -> L, _ onTrue: () -> R) -> Either<L, R> {
        self ? .right(onTrue()) : .left(onFalse())
    }
}
