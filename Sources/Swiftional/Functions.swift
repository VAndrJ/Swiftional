//
//  Functions.swift
//  
//
//  Created by Volodymyr Andriienko on 07.02.2022.
//

import Foundation

/// Identity combinator function.
/// Returns the input without changing it.
///
/// - Parameter value: Output value.
/// - Returns: The value received as input, with no modifications.
public func identity<R>(_ value: R) -> R {
    value
}

/// The constant combinator function.
/// Always returns the provided value.
///
/// - Parameter value: Constant value to return.
/// - Returns: Function that constantly return the `value` provided as argument.
public func constant<R>(_ value: R) -> () -> R {
    { value }
}

/// The constant combinator function.
/// Ignores the function arguments and always returns the provided value.
///
/// - Parameter value: Constant value to return.
/// - Returns: Function that constantly return the `value` provided as argument.
public func constant<A, R>(_ value: R) -> (A) -> R {
    { _ in value }
}

/// Flips the arguments of a function.
///
/// - Parameter f: Function whose arguments must be flipped.
/// - Returns: A function with the same behavior as the input, but with arguments flipped.
public func flip<A, B, R>(_ f: @escaping (A, B) -> R) -> (B, A) -> R {
    { f($1, $0) }
}


/// Calls the specified closure with the given attrubute as its receiver and returns its result.
///
/// - Returns: Closure result.
public func with<A, R>(_ a: A, _ f: (A) throws -> R) rethrows -> R {
    try f(a)
}
