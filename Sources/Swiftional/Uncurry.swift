//
//  Uncurry.swift
//  
//
//  Created by Volodymyr Andriienko on 07.02.2022.
//

import Foundation

/// Converts a curried function into a function taking 2 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B) -> R
public func uncurry<A, B, R>(_ fn: @escaping (A) -> (B) -> R) -> (A, B) -> R {
    { a, b in fn(a)(b) }
}

/// Converts a curried throwing function into a function taking 2 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B) -> R
public func uncurry<A, B, R>(_ fn: @escaping (A) -> (B) throws -> R) -> (A, B) throws -> R {
    { a, b in try fn(a)(b) }
}

/// Converts a curried async function into a function taking 2 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func uncurry<A, B, R>(_ fn: @escaping @Sendable (A) -> @Sendable (B) async -> R) -> @Sendable (A, B) async -> R {
    { a, b in await fn(a)(b) }
}

/// Converts a curried async throwing function into a function taking 2 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func uncurry<A, B, R>(_ fn: @escaping @Sendable (A) -> @Sendable (B) async throws -> R) -> @Sendable (A, B) async throws -> R {
    { a, b in try await fn(a)(b) }
}

/// Converts a curried function into a function taking 3 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C) -> R
public func uncurry<A, B, C, R>(_ fn: @escaping (A) -> (B) -> (C) -> R) -> (A, B, C) -> R {
    { a, b, c in fn(a)(b)(c) }
}

/// Converts a curried throwing function into a function taking 3 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C) -> R
public func uncurry<A, B, C, R>(_ fn: @escaping (A) -> (B) -> (C) throws -> R) -> (A, B, C) throws -> R {
    { a, b, c in try fn(a)(b)(c) }
}

/// Converts a curried async function into a function taking 3 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func uncurry<A, B, C, R>(_ fn: @escaping @Sendable (A) -> @Sendable (B) -> @Sendable (C) async -> R) -> @Sendable (A, B, C) async -> R {
    { a, b, c in await fn(a)(b)(c) }
}

/// Converts a curried async throwing function into a function taking 3 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func uncurry<A, B, C, R>(_ fn: @escaping @Sendable (A) -> @Sendable (B) -> @Sendable (C) async throws -> R) -> @Sendable (A, B, C) async throws -> R {
    { a, b, c in try await fn(a)(b)(c) }
}

/// Converts a curried function into a function taking 4 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D) -> R
public func uncurry<A, B, C, D, R>(_ fn: @escaping (A) -> (B) -> (C) -> (D) -> R) -> (A, B, C, D) -> R {
    { a, b, c, d in fn(a)(b)(c)(d) }
}

/// Converts a curried throwing function into a function taking 4 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D) -> R
public func uncurry<A, B, C, D, R>(_ fn: @escaping (A) -> (B) -> (C) -> (D) throws -> R) -> (A, B, C, D) throws -> R {
    { a, b, c, d in try fn(a)(b)(c)(d) }
}

/// Converts a curried async function into a function taking 4 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func uncurry<A, B, C, D, R>(_ fn: @escaping @Sendable (A) -> @Sendable (B) -> @Sendable (C) -> @Sendable (D) async -> R) -> @Sendable (A, B, C, D) async -> R {
    { a, b, c, d in await fn(a)(b)(c)(d) }
}

/// Converts a curried async throwing function into a function taking 4 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func uncurry<A, B, C, D, R>(_ fn: @escaping @Sendable (A) -> @Sendable (B) -> @Sendable (C) -> @Sendable (D) async throws -> R) -> @Sendable (A, B, C, D) async throws -> R {
    { a, b, c, d in try await fn(a)(b)(c)(d) }
}

/// Converts a curried function into a function taking 5 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D, E) -> R
public func uncurry<A, B, C, D, E, R>(_ fn: @escaping (A) -> (B) -> (C) -> (D) -> (E) -> R) -> (A, B, C, D, E) -> R {
    { a, b, c, d, e in fn(a)(b)(c)(d)(e) }
}

/// Converts a curried throwing function into a function taking 5 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D, E) -> R
public func uncurry<A, B, C, D, E, R>(_ fn: @escaping (A) -> (B) -> (C) -> (D) -> (E) throws -> R) -> (A, B, C, D, E) throws -> R {
    { a, b, c, d, e in try fn(a)(b)(c)(d)(e) }
}

/// Converts a curried async function into a function taking 5 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D, E) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func uncurry<A, B, C, D, E, R>(_ fn: @escaping @Sendable (A) -> @Sendable (B) -> @Sendable (C) -> @Sendable (D) -> @Sendable (E) async -> R) -> @Sendable (A, B, C, D, E) async -> R {
    { a, b, c, d, e in await fn(a)(b)(c)(d)(e) }
}

/// Converts a curried async throwing function into a function taking 5 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D, E) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func uncurry<A, B, C, D, E, R>(_ fn: @escaping @Sendable (A) -> @Sendable (B) -> @Sendable (C) -> @Sendable (D) -> @Sendable (E) async throws -> R) -> @Sendable (A, B, C, D, E) async throws -> R {
    { a, b, c, d, e in try await fn(a)(b)(c)(d)(e) }
}

/// Converts a curried function into a function taking 6 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D, E, F) -> R
public func uncurry<A, B, C, D, E, F, R>(_ fn: @escaping (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> R) -> (A, B, C, D, E, F) -> R {
    { a, b, c, d, e, f in fn(a)(b)(c)(d)(e)(f) }
}

/// Converts a curried throwing function into a function taking 6 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D, E, F) -> R
public func uncurry<A, B, C, D, E, F, R>(_ fn: @escaping (A) -> (B) -> (C) -> (D) -> (E) -> (F) throws -> R) -> (A, B, C, D, E, F) throws -> R {
    { a, b, c, d, e, f in try fn(a)(b)(c)(d)(e)(f) }
}

/// Converts a curried async function into a function taking 6 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D, E, F) -> R
public func uncurry<A, B, C, D, E, F, R>(_ fn: @escaping @Sendable (A) -> @Sendable (B) -> @Sendable (C) -> @Sendable (D) -> @Sendable (E) -> @Sendable (F) async -> R) -> @Sendable (A, B, C, D, E, F) async -> R {
    { a, b, c, d, e, f in await fn(a)(b)(c)(d)(e)(f) }
}

/// Converts a curried async throwing function into a function taking 6 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D, E, F) -> R
public func uncurry<A, B, C, D, E, F, R>(_ fn: @escaping @Sendable (A) -> @Sendable (B) -> @Sendable (C) -> @Sendable (D) -> @Sendable (E) -> @Sendable (F) async throws -> R) -> @Sendable (A, B, C, D, E, F) async throws -> R {
    { a, b, c, d, e, f in try await fn(a)(b)(c)(d)(e)(f) }
}
