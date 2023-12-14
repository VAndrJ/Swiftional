//
//  Curry.swift
//  
//
//  Created by Volodymyr Andriienko on 07.02.2022.
//

import Foundation

/// Converts an uncurried function with 2 arguments to a curried function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> R
public func curry<A, B, R>(_ fn: @escaping (A, B) -> R) -> (A) -> (B) -> R {
    { a in { b in fn(a, b) } }
}

/// Converts an uncurried throws function with 2 arguments to a curried throws function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> R
public func curry<A, B, R>(_ fn: @escaping (A, B) throws -> R) -> (A) -> (B) throws -> R {
    { a in { b in try fn(a, b) } }
}

/// Converts an uncurried async function with 2 arguments to a curried async function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func curry<A, B, R>(_ fn: @escaping @Sendable (A, B) async -> R) -> @Sendable (A) -> @Sendable (B) async -> R {
    { a in { b in await fn(a, b) } }
}

/// Converts an uncurried async throws function with 2 arguments to a curried async throws function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func curry<A, B, R>(_ fn: @escaping @Sendable (A, B) async throws -> R) -> @Sendable (A) -> @Sendable (B) async throws -> R {
    { a in { b in try await fn(a, b) } }
}

/// Converts an uncurried function with 3 arguments to a curried function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> R
public func curry<A, B, C, R>(_ fn: @escaping (A, B, C) -> R) -> (A) -> (B) -> (C) -> R {
    { a in { b in { c in fn(a, b, c) } } }
}

/// Converts an uncurried throws function with 3 arguments to a curried throws function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> R
public func curry<A, B, C, R>(_ fn: @escaping (A, B, C) throws -> R) -> (A) -> (B) -> (C) throws -> R {
    { a in { b in { c in try fn(a, b, c) } } }
}

/// Converts an uncurried async function with 3 arguments to a curried async function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func curry<A, B, C, R>(_ fn: @escaping @Sendable (A, B, C) async -> R) -> (A) -> (B) -> (C) async -> R {
    { a in { b in { c in await fn(a, b, c) } } }
}

/// Converts an uncurried async throws function with 3 arguments to a curried async throws function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func curry<A, B, C, R>(_ fn: @escaping @Sendable (A, B, C) async throws -> R) -> @Sendable (A) -> @Sendable (B) -> @Sendable (C) async throws -> R {
    { a in { b in { c in try await fn(a, b, c) } } }
}

/// Converts an uncurried function with 4 arguments to a curried function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> R
public func curry<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R) -> (A) -> (B) -> (C) -> (D) -> R {
    { a in { b in { c in { d in fn(a, b, c, d) } } } }
}

/// Converts an uncurried throws function with 4 arguments to a curried throws function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> R
public func curry<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R) -> (A) -> (B) -> (C) -> (D) throws -> R {
    { a in { b in { c in { d in try fn(a, b, c, d) } } } }
}

/// Converts an uncurried async function with 4 arguments to a curried async function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func curry<A, B, C, D, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R) -> @Sendable (A) -> @Sendable (B) -> @Sendable (C) -> @Sendable (D) async -> R {
    { a in { b in { c in { d in await fn(a, b, c, d) } } } }
}

/// Converts an uncurried async throws function with 4 arguments to a curried async throws function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func curry<A, B, C, D, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R) -> @Sendable (A) -> @Sendable (B) -> @Sendable (C) -> @Sendable (D) async throws -> R {
    { a in { b in { c in { d in try await fn(a, b, c, d) } } } }
}

/// Converts an uncurried function with 5 arguments to a curried function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> (E) -> R
public func curry<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R) -> (A) -> (B) -> (C) -> (D) -> (E) -> R {
    { a in { b in { c in { d in { e in fn(a, b, c, d, e) } } } } }
}

/// Converts an uncurried throws function with 5 arguments to a curried throws function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> (E) -> R
public func curry<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R) -> (A) -> (B) -> (C) -> (D) -> (E) throws -> R {
    { a in { b in { c in { d in { e in try fn(a, b, c, d, e) } } } } }
}

/// Converts an uncurried async function with 5 arguments to a curried async function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> (E) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func curry<A, B, C, D, E, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R) -> @Sendable (A) -> @Sendable (B) -> @Sendable (C) -> @Sendable (D) -> @Sendable (E) async -> R {
    { a in { b in { c in { d in { e in await fn(a, b, c, d, e) } } } } }
}

/// Converts an uncurried async throws function with 5 arguments to a curried async throws function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> (E) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func curry<A, B, C, D, E, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R) -> @Sendable (A) -> @Sendable (B) -> @Sendable (C) -> @Sendable (D) -> @Sendable (E) async throws -> R {
    { a in { b in { c in { d in { e in try await fn(a, b, c, d, e) } } } } }
}

/// Converts an uncurried function with 6 arguments to a curried function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> R
public func curry<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> R {
    { a in { b in { c in { d in { e in { f in fn(a, b, c, d, e, f) } } } } } }
}

/// Converts an uncurried throws function with 6 arguments to a curried throws function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> R
public func curry<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) throws -> R {
    { a in { b in { c in { d in { e in { f in try fn(a, b, c, d, e, f) } } } } } }
}

/// Converts an uncurried async function with 6 arguments to a curried async function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func curry<A, B, C, D, E, F, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R) -> @Sendable (A) -> @Sendable (B) -> @Sendable (C) -> @Sendable (D) -> @Sendable (E) -> @Sendable (F) async -> R {
    { a in { b in { c in { d in { e in { f in await fn(a, b, c, d, e, f) } } } } } }
}

/// Converts an uncurried async throws function with 6 arguments to a curried async throws function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> R
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func curry<A, B, C, D, E, F, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R) -> @Sendable (A) -> @Sendable (B) -> @Sendable (C) -> @Sendable (D) -> @Sendable (E) -> @Sendable (F) async throws -> R {
    { a in { b in { c in { d in { e in { f in try await fn(a, b, c, d, e, f) } } } } } }
}
