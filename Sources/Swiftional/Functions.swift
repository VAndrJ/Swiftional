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

/// Identity combinator function.
/// Returns the input without changing it.
///
/// - Parameter value: Output value.
/// - Returns: The value received as input, with no modifications.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@Sendable
public func id<R>(_ value: R) -> R {
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
/// Always returns the provided value.
///
/// - Parameter value: Constant value to return.
/// - Returns: Function that constantly return the `value` provided as argument.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@Sendable
public func const<R: Sendable>(_ value: R) -> @Sendable () -> R {
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

/// The constant combinator function.
/// Ignores the function arguments and always returns the provided value.
///
/// - Parameter value: Constant value to return.
/// - Returns: Function that constantly return the `value` provided as argument.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@Sendable
public func const<A: Sendable, R: Sendable>(_ value: R) -> @Sendable (A) -> R {
    { _ in value }
}

/// Flips the arguments of a function.
///
/// - Parameter f: Function whose arguments must be flipped.
/// - Returns: A function with the same behavior as the input, but with arguments flipped.
public func flip<A, B, R>(_ f: @escaping (A, B) -> R) -> (B, A) -> R {
    { f($1, $0) }
}

/// Flips the arguments of a function.
///
/// - Parameter f: Function whose arguments must be flipped.
/// - Returns: A function with the same behavior as the input, but with arguments flipped.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@Sendable
public func flip<A, B, R>(_ f: @escaping @Sendable (A, B) async -> R) -> @Sendable (B, A) async -> R {
    { await f($1, $0) }
}

/// Flips the arguments of a function.
///
/// - Parameter f: Function whose arguments must be flipped.
/// - Returns: A function with the same behavior as the input, but with arguments flipped.
public func flip<A, B, R>(_ f: @escaping (A, B) throws -> R) -> (B, A) throws -> R {
    { try f($1, $0) }
}

/// Flips the arguments of a function.
///
/// - Parameter f: Function whose arguments must be flipped.
/// - Returns: A function with the same behavior as the input, but with arguments flipped.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@Sendable
public func flip<A, B, R>(_ f: @escaping @Sendable (A, B) async throws -> R) -> @Sendable (B, A) async throws -> R {
    { try await f($1, $0) }
}


/// Calls the specified closure with the given attrubute as its receiver and returns its result.
///
/// - Returns: Closure result.
public func with<A, R>(_ a: A, _ f: (A) throws -> R) rethrows -> R {
    try f(a)
}


/// Calls the specified closure with the given attrubute as its receiver and returns its result.
///
/// - Returns: Closure result.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@Sendable
public func with<A, R>(_ a: A, _ f: @Sendable (A) async throws -> R) async rethrows -> R {
    try await f(a)
}

/// Ignores the function return and always returns `Void`.
///
/// - Parameter fn: Function to ignore return.
/// - Returns: Function that constantly return the `Void`.
public func ignored<each R>(_ fn: @escaping () -> (repeat each R)) -> () -> Void {
    { _ = fn() }
}

/// Ignores the function return and always returns `Void`.
///
/// - Parameter fn: Function to ignore return.
/// - Returns: Function that constantly return the `Void`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
@Sendable
public func ignored<each R>(_ fn: @escaping @Sendable () async -> (repeat each R)) -> @Sendable () async -> Void {
    { _ = await fn() }
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
