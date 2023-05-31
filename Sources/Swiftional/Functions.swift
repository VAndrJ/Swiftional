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

/// Ignores the function return and always returns `Void`.
///
/// - Parameter fn: Function to ignore return.
/// - Returns: Function that constantly return the `Void`.
public func ignored<R>(_ fn: @escaping () -> R) -> () -> Void {
    { _ = fn() }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function to apply.
public func weakify<T: AnyObject>(_ obj: T?, _ block: @escaping (T) -> Void) -> () -> Void {
    return { [weak obj] in
        guard let obj else { return }
        block(obj)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to ignore.
public func weakify<T: AnyObject, U>(_ obj: T?, _ block: @escaping (T) -> Void) -> (U) -> Void {
    return { [weak obj] _ in
        guard let obj else { return }
        block(obj)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func weakify<T: AnyObject, U>(_ obj: T?, _ block: @escaping (T, U) -> Void) -> (U) -> Void {
    return { [weak obj] in
        guard let obj else { return }
        block(obj, $0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func weakify<T: AnyObject, U, V>(_ obj: T?, _ block: @escaping (T, U, V) -> Void) -> (U, V) -> Void {
    return { [weak obj] in
        guard let obj else { return }
        block(obj, $0, $1)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function to apply.
public func weakify<T: AnyObject, R>(_ obj: T?, _ block: @escaping (T) -> R?) -> () -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }
        return block(obj)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func weakify<T: AnyObject, U, R>(_ obj: T?, _ block: @escaping (T) -> R?) -> (U) -> R? {
    return { [weak obj] _ in
        guard let obj else {
            return nil
        }
        return block(obj)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func weakify<T: AnyObject, U, R>(_ obj: T?, _ block: @escaping (T, U) -> R?) -> (U) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }
        return block(obj, $0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func weakify<T: AnyObject, U, V, R>(_ obj: T?, _ block: @escaping (T, U, V) -> R?) -> (U, V) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }
        return block(obj, $0, $1)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func weakify<T: AnyObject, U, V, R>(_ obj: T?, _ block: @escaping (T) -> R?) -> (U, V) -> R? {
    return { [weak obj] _, _ in
        guard let obj else {
            return nil
        }
        return block(obj)
    }
}
