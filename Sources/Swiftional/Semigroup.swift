//
//  Semigroup.swift
//  
//
//  Created by Volodymyr Andriienko on 11.02.2022.
//

import Foundation

/// A semigroup is any set `A` with a [closed, associative, binary operator](https://en.wikipedia.org/wiki/Associative_property) `(combine)`.
///
/// `(ab)c = a(bc) = abc` for all `a`, `b`, `c` in `A`
public protocol Semigroup {
    /// Associative operation which combines two values.
    ///
    ///     a.combine(b).combine(c) == a.combine(b.combine(c))
    ///
    /// - Parameter other: Value to combine with the receiver.
    /// - Returns: Combination of the receiver value with the parameter value.
    func combine(_ other: Self) -> Self
}

public extension Semigroup {
    /// Combines two values.
    ///
    /// - Parameters:
    ///   - a: Value of the implementing type.
    ///   - b: Value of the implementing type.
    /// - Returns: Combination of `a` and `b`.
    static func combine(_ a: Self, _ b: Self) -> Self {
        a.combine(b)
    }

    /// Combines a variable number of values, in the order provided in the call.
    ///
    /// - Parameters:
    ///     - a: First value of the implementing type.
    ///     - elements: Values of the implementing type.
    /// - Returns: A single value of the implementing type representing the combination of all the parameter values.
    static func combineAll(_ a: Self, _ elements: Self...) -> Self {
        combineAll(a, elements)
    }

    /// Combines an array of values, in the order provided in the call.
    ///
    /// - Parameters:
    ///     - a: First value of the implementing type.
    ///     - elements: Values of the implementing type.
    /// - Returns: A single value of the implementing type representing the combination of all the parameter values.
    static func combineAll(_ a: Self, _ elements: [Self]) -> Self {
        elements.reduce(a, combine(_:_:))
    }

    /// Associative operation which combines a variable number of values, in the order provided in the call.
    ///
    /// - Parameter elements: Values to combine with the receiver.
    /// - Returns: Combination of the receiver value with all of the parameter values.
    func combineAll(_ elements: Self...) -> Self {
        Self.combineAll(self, elements)
    }

    /// Associative operation which combines an array of values, in the order provided in the call.
    ///
    /// - Parameter elements: Values to combine with the receiver.
    /// - Returns: Combination of the receiver value with all of the parameter values.
    func combineAll(_ elements: [Self]) -> Self {
        Self.combineAll(self, elements)
    }
}
