//
//  PartialApplication.swift
//  
//
//  Created by Volodymyr Andriienko on 07.02.2022.
//

import Foundation

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, R>(_ fn: @escaping (A, B) -> R, _ a: Deferred, _ b: B) -> (A) -> R {
    { a in fn(a, b) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, R>(_ fn: @escaping (A, B) throws -> R, _ a: Deferred, _ b: B) -> (A) throws -> R {
    { a in try fn(a, b) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, R>(_ fn: @escaping @Sendable (A, B) async -> R, _ a: Deferred, _ b: B) -> @Sendable (A) async -> R {
    { a in await fn(a, b) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, R>(_ fn: @escaping @Sendable (A, B) async throws -> R, _ a: Deferred, _ b: B) -> @Sendable (A) async throws -> R {
    { a in try await fn(a, b) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, R>(_ fn: @escaping (A, B) -> R, _ a: A, _ b: Deferred) -> (B) -> R {
    { b in fn(a, b) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, R>(_ fn: @escaping (A, B) throws -> R, _ a: A, _ b: Deferred) -> (B) throws -> R {
    { b in try fn(a, b) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, R>(_ fn: @escaping @Sendable (A, B) async -> R, _ a: A, _ b: Deferred) -> @Sendable (B) async -> R {
    { b in await fn(a, b) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, R>(_ fn: @escaping @Sendable (A, B) async throws -> R, _ a: A, _ b: Deferred) -> @Sendable (B) async throws -> R {
    { b in try await fn(a, b) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) -> R, _ a: Deferred, _ b: B, _ c: C) -> (A) -> R {
    { a in fn(a, b, c) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) throws -> R, _ a: Deferred, _ b: B, _ c: C) -> (A) throws -> R {
    { a in try fn(a, b, c) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, R>(_ fn: @escaping @Sendable (A, B, C) async -> R, _ a: Deferred, _ b: B, _ c: C) -> @Sendable (A) async -> R {
    { a in await fn(a, b, c) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, R>(_ fn: @escaping @Sendable (A, B, C) async throws -> R, _ a: Deferred, _ b: B, _ c: C) -> @Sendable (A) async throws -> R {
    { a in try await fn(a, b, c) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) -> R, _ a: A, _ b: Deferred, _ c: C) -> (B) -> R {
    { b in fn(a, b, c) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) throws -> R, _ a: A, _ b: Deferred, _ c: C) -> (B) throws -> R {
    { b in try fn(a, b, c) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, R>(_ fn: @escaping @Sendable (A, B, C) async -> R, _ a: A, _ b: Deferred, _ c: C) -> @Sendable (B) async -> R {
    { b in await fn(a, b, c) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, R>(_ fn: @escaping @Sendable (A, B, C) async throws -> R, _ a: A, _ b: Deferred, _ c: C) -> @Sendable (B) async throws -> R {
    { b in try await fn(a, b, c) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) -> R, _ a: A, _ b: B, _ c: Deferred) -> (C) -> R {
    { c in fn(a, b, c) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) throws -> R, _ a: A, _ b: B, _ c: Deferred) -> (C) throws -> R {
    { c in try fn(a, b, c) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, R>(_ fn: @escaping @Sendable (A, B, C) async -> R, _ a: A, _ b: B, _ c: Deferred) -> @Sendable (C) async -> R {
    { c in await fn(a, b, c) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, R>(_ fn: @escaping @Sendable (A, B, C) async throws -> R, _ a: A, _ b: B, _ c: Deferred) -> @Sendable (C) async throws -> R {
    { c in try await fn(a, b, c) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) -> R, _ a: Deferred, _ b: Deferred, _ c: C) -> (A, B) -> R {
    { a, b in fn(a, b, c) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) throws -> R, _ a: Deferred, _ b: Deferred, _ c: C) -> (A, B) throws -> R {
    { a, b in try fn(a, b, c) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, R>(_ fn: @escaping @Sendable (A, B, C) async -> R, _ a: Deferred, _ b: Deferred, _ c: C) -> @Sendable (A, B) async -> R {
    { a, b in await fn(a, b, c) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, R>(_ fn: @escaping @Sendable (A, B, C) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: C) -> @Sendable (A, B) async throws -> R {
    { a, b in try await fn(a, b, c) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) -> R, _ a: Deferred, _ b: B, _ c: Deferred) -> (A, C) -> R {
    { a, c in fn(a, b, c) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) throws -> R, _ a: Deferred, _ b: B, _ c: Deferred) -> (A, C) throws -> R {
    { a, c in try fn(a, b, c) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, R>(_ fn: @escaping @Sendable (A, B, C) async -> R, _ a: Deferred, _ b: B, _ c: Deferred) -> @Sendable (A, C) async -> R {
    { a, c in await fn(a, b, c) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, R>(_ fn: @escaping @Sendable (A, B, C) async throws -> R, _ a: Deferred, _ b: B, _ c: Deferred) -> @Sendable (A, C) async throws -> R {
    { a, c in try await fn(a, b, c) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) -> R, _ a: A, _ b: Deferred, _ c: Deferred) -> (B, C) -> R {
    { b, c in fn(a, b, c) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) throws -> R, _ a: A, _ b: Deferred, _ c: Deferred) -> (B, C) throws -> R {
    { b, c in try fn(a, b, c) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, R>(_ fn: @escaping @Sendable (A, B, C) async -> R, _ a: A, _ b: Deferred, _ c: Deferred) -> @Sendable (B, C) async -> R {
    { b, c in await fn(a, b, c) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, R>(_ fn: @escaping @Sendable (A, B, C) async throws -> R, _ a: A, _ b: Deferred, _ c: Deferred) -> @Sendable (B, C) async throws -> R {
    { b, c in try await fn(a, b, c) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D) -> (A) -> R {
    { a in fn(a, b, c, d) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D) -> (A) throws -> R {
    { a in try fn(a, b, c, d) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D) -> @Sendable (A) async -> R {
    { a in await fn(a, b, c, d) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D) -> @Sendable (A) async throws -> R {
    { a in try await fn(a, b, c, d) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D) -> (B) -> R {
    { b in fn(a, b, c, d) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D) -> (B) throws -> R {
    { b in try fn(a, b, c, d) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D) -> @Sendable (B) async -> R {
    { b in await fn(a, b, c, d) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D) -> @Sendable (B) async throws -> R {
    { b in try await fn(a, b, c, d) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D) -> (C) -> R {
    { c in fn(a, b, c, d) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D) -> (C) throws -> R {
    { c in try fn(a, b, c, d) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D) -> @Sendable (C) async -> R {
    { c in await fn(a, b, c, d) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D) -> @Sendable (C) async throws -> R {
    { c in try await fn(a, b, c, d) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred) -> (D) -> R {
    { d in fn(a, b, c, d) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred) -> (D) throws -> R {
    { d in try fn(a, b, c, d) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred) -> @Sendable (D) async -> R {
    { d in await fn(a, b, c, d) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred) -> @Sendable (D) async throws -> R {
    { d in try await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred) -> (C, D) -> R {
    { c, d in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred) -> (C, D) throws -> R {
    { c, d in try fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred) -> @Sendable (C, D) async -> R {
    { c, d in await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred) -> @Sendable (C, D) async throws -> R {
    { c, d in try await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred) -> (B, D) -> R {
    { b, d in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred) -> (B, D) throws -> R {
    { b, d in try fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred) -> @Sendable (B, D) async -> R {
    { b, d in await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred) -> @Sendable (B, D) async throws -> R {
    { b, d in try await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred) -> (A, D) -> R {
    { a, d in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred) -> (A, D) throws -> R {
    { a, d in try fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred) -> @Sendable (A, D) async -> R {
    { a, d in await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred) -> @Sendable (A, D) async throws -> R {
    { a, d in try await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D) -> (A, C) -> R {
    { a, c in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D) -> (A, C) throws -> R {
    { a, c in try fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D) -> @Sendable (A, C) async -> R {
    { a, c in await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D) -> @Sendable (A, C) async throws -> R {
    { a, c in try await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D) -> (A, B) -> R {
    { a, b in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D) -> (A, B) throws -> R {
    { a, b in try fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D) -> @Sendable (A, B) async -> R {
    { a, b in await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D) -> @Sendable (A, B) async throws -> R {
    { a, b in try await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D) -> (B, C) -> R {
    { b, c in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D) -> (B, C) throws -> R {
    { b, c in try fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D) -> @Sendable (B, C) async -> R {
    { b, c in await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D) -> @Sendable (B, C) async throws -> R {
    { b, c in try await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D) -> (A, B, C) -> R {
    { a, b, c in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D) -> (A, B, C) throws -> R {
    { a, b, c in try fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D) -> @Sendable (A, B, C) async -> R {
    { a, b, c in await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D) -> @Sendable (A, B, C) async throws -> R {
    { a, b, c in try await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred) -> (A, B, D) -> R {
    { a, b, d in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred) -> (A, B, D) throws -> R {
    { a, b, d in try fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred) -> @Sendable (A, B, D) async -> R {
    { a, b, d in await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred) -> @Sendable (A, B, D) async throws -> R {
    { a, b, d in try await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred) -> (A, C, D) -> R {
    { a, c, d in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred) -> (A, C, D) throws -> R {
    { a, c, d in try fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred) -> @Sendable (A, C, D) async -> R {
    { a, c, d in await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred) -> @Sendable (A, C, D) async throws -> R {
    { a, c, d in try await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred) -> (B, C, D) -> R {
    { b, c, d in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred) -> (B, C, D) throws -> R {
    { b, c, d in try fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred) -> @Sendable (B, C, D) async -> R {
    { b, c, d in await fn(a, b, c, d) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D) async throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred) -> @Sendable (B, C, D) async throws -> R {
    { b, c, d in try await fn(a, b, c, d) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: E) -> (A) -> R {
    { a in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: E) -> (A) throws -> R {
    { a in try fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: E) -> @Sendable (A) async -> R {
    { a in await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: E) -> @Sendable (A) async throws -> R {
    { a in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: E) -> (B) -> R {
    { b in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: E) -> (B) throws -> R {
    { b in try fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: E) -> @Sendable (B) async -> R {
    { b in await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: E) -> @Sendable (B) async throws -> R {
    { b in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: E) -> (C) -> R {
    { c in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: E) -> (C) throws -> R {
    { c in try fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: E) -> @Sendable (C) async -> R {
    { c in await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: E) -> @Sendable (C) async throws -> R {
    { c in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: E) -> (D) -> R {
    { d in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: E) -> (D) throws -> R {
    { d in try fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: E) -> @Sendable (D) async -> R {
    { d in await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: E) -> @Sendable (D) async throws -> R {
    { d in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: E) -> (C, D) -> R {
    { c, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: E) -> (C, D) throws -> R {
    { c, d in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: E) -> @Sendable (C, D) async -> R {
    { c, d in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: E) -> @Sendable (C, D) async throws -> R {
    { c, d in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred, _ e: E) -> (B, D) -> R {
    { b, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred, _ e: E) -> (B, D) throws -> R {
    { b, d in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred, _ e: E) -> @Sendable (B, D) async -> R {
    { b, d in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred, _ e: E) -> @Sendable (B, D) async throws -> R {
    { b, d in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: E) -> (A, D) -> R {
    { a, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: E) -> (A, D) throws -> R {
    { a, d in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: E) -> @Sendable (A, D) async -> R {
    { a, d in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: E) -> @Sendable (A, D) async throws -> R {
    { a, d in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D, _ e: E) -> (A, C) -> R {
    { a, c in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D, _ e: E) -> (A, C) throws -> R {
    { a, c in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D, _ e: E) -> @Sendable (A, C) async -> R {
    { a, c in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D, _ e: E) -> @Sendable (A, C) async throws -> R {
    { a, c in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: E) -> (A, B) -> R {
    { a, b in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: E) -> (A, B) throws -> R {
    { a, b in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: E) -> @Sendable (A, B) async -> R {
    { a, b in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: E) -> @Sendable (A, B) async throws -> R {
    { a, b in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E) -> (B, C) -> R {
    { b, c in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E) -> (B, C) throws -> R {
    { b, c in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E) -> @Sendable (B, C) async -> R {
    { b, c in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E) -> @Sendable (B, C) async throws -> R {
    { b, c in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E) -> (A, B, C) -> R {
    { a, b, c in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E) -> (A, B, C) throws -> R {
    { a, b, c in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E) -> @Sendable (A, B, C) async -> R {
    { a, b, c in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E) -> @Sendable (A, B, C) async throws -> R {
    { a, b, c in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: E) -> (A, B, D) -> R {
    { a, b, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: E) -> (A, B, D) throws -> R {
    { a, b, d in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: E) -> @Sendable (A, B, D) async -> R {
    { a, b, d in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: E) -> @Sendable (A, B, D) async throws -> R {
    { a, b, d in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: E) -> (A, C, D) -> R {
    { a, c, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: E) -> (A, C, D) throws -> R {
    { a, c, d in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: E) -> @Sendable (A, C, D) async -> R {
    { a, c, d in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: E) -> @Sendable (A, C, D) async throws -> R {
    { a, c, d in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E) -> (B, C, D) -> R {
    { b, c, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E) -> (B, C, D) throws -> R {
    { b, c, d in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E) -> @Sendable (B, C, D) async -> R {
    { b, c, d in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E) -> @Sendable (B, C, D) async throws -> R {
    { b, c, d in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E) -> (A, B, C, D) -> R {
    { a, b, c, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E) -> (A, B, C, D) throws -> R {
    { a, b, c, d in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E) -> @Sendable (A, B, C, D) async -> R {
    { a, b, c, d in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E) -> @Sendable (A, B, C, D) async throws -> R {
    { a, b, c, d in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: Deferred) -> (A, E) -> R {
    { a, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: Deferred) -> (A, E) throws -> R {
    { a, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: Deferred) -> @Sendable (A, E) async -> R {
    { a, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: Deferred) -> @Sendable (A, E) async throws -> R {
    { a, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred) -> (B, E) -> R {
    { b, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred) -> (B, E) throws -> R {
    { b, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred) -> @Sendable (B, E) async -> R {
    { b, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred) -> @Sendable (B, E) async throws -> R {
    { b, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: Deferred) -> (C, E) -> R {
    { c, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: Deferred) -> (C, E) throws -> R {
    { c, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: Deferred) -> @Sendable (C, E) async -> R {
    { c, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: Deferred) -> @Sendable (C, E) async throws -> R {
    { c, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred) -> (D, E) -> R {
    { d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred) -> (D, E) throws -> R {
    { d, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred) -> @Sendable (D, E) async -> R {
    { d, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred) -> @Sendable (D, E) async throws -> R {
    { d, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> (C, D, E) -> R {
    { c, d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> (C, D, E) throws -> R {
    { c, d, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> @Sendable (C, D, E) async -> R {
    { c, d, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> @Sendable (C, D, E) async throws -> R {
    { c, d, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred) -> (B, D, E) -> R {
    { b, d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred) -> (B, D, E) throws -> R {
    { b, d, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred) -> @Sendable (B, D, E) async -> R {
    { b, d, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred) -> @Sendable (B, D, E) async throws -> R {
    { b, d, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred) -> (A, D, E) -> R {
    { a, d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred) -> (A, D, E) throws -> R {
    { a, d, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred) -> @Sendable (A, D, E) async -> R {
    { a, d, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred) -> @Sendable (A, D, E) async throws -> R {
    { a, d, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D, _ e: Deferred) -> (A, C, E) -> R {
    { a, c, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D, _ e: Deferred) -> (A, C, E) throws -> R {
    { a, c, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D, _ e: Deferred) -> @Sendable (A, C, E) async -> R {
    { a, c, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D, _ e: Deferred) -> @Sendable (A, C, E) async throws -> R {
    { a, c, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred) -> (A, B, E) -> R {
    { a, b, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred) -> (A, B, E) throws -> R {
    { a, b, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred) -> @Sendable (A, B, E) async -> R {
    { a, b, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred) -> @Sendable (A, B, E) async throws -> R {
    { a, b, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred) -> (B, C, E) -> R {
    { b, c, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred) -> (B, C, E) throws -> R {
    { b, c, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred) -> @Sendable (B, C, E) async -> R {
    { b, c, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred) -> @Sendable (B, C, E) async throws -> R {
    { b, c, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred) -> (A, B, C, E) -> R {
    { a, b, c, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred) -> (A, B, C, E) throws -> R {
    { a, b, c, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred) -> @Sendable (A, B, C, E) async -> R {
    { a, b, c, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred) -> @Sendable (A, B, C, E) async throws -> R {
    { a, b, c, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred) -> (A, B, D, E) -> R {
    { a, b, d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred) -> (A, B, D, E) throws -> R {
    { a, b, d, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred) -> @Sendable (A, B, D, E) async -> R {
    { a, b, d, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred) -> @Sendable (A, B, D, E) async throws -> R {
    { a, b, d, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> (A, C, D, E) -> R {
    { a, c, d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> (A, C, D, E) throws -> R {
    { a, c, d, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> @Sendable (A, C, D, E) async -> R {
    { a, c, d, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> @Sendable (A, C, D, E) async throws -> R {
    { a, c, d, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> (B, C, D, E) -> R {
    { b, c, d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> (B, C, D, E) throws -> R {
    { b, c, d, e in try fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> @Sendable (B, C, D, E) async -> R {
    { b, c, d, e in await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E) async throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> @Sendable (B, C, D, E) async throws -> R {
    { b, c, d, e in try await fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (B, C, D, E, F) -> R {
    { b, c, d, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (B, C, D, E, F) throws -> R {
    { b, c, d, e, f in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> @Sendable (B, C, D, E, F) async -> R {
    { b, c, d, e, f in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> @Sendable (B, C, D, E, F) async throws -> R {
    { b, c, d, e, f in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (A, C, D, E, F) -> R {
    { a, c, d, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (A, C, D, E, F) throws -> R {
    { a, c, d, e, f in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> @Sendable (A, C, D, E, F) async -> R {
    { a, c, d, e, f in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> @Sendable (A, C, D, E, F) async throws -> R {
    { a, c, d, e, f in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (A, B, D, E, F) -> R {
    { a, b, d, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (A, B, D, E, F) throws -> R {
    { a, b, d, e, f in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> @Sendable (A, B, D, E, F) async -> R {
    { a, b, d, e, f in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> @Sendable (A, B, D, E, F) async throws -> R {
    { a, b, d, e, f in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred, _ f: Deferred) -> (A, B, C, E, F) -> R {
    { a, b, c, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred, _ f: Deferred) -> (A, B, C, E, F) throws -> R {
    { a, b, c, e, f in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred, _ f: Deferred) -> @Sendable (A, B, C, E, F) async -> R {
    { a, b, c, e, f in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred, _ f: Deferred) -> @Sendable (A, B, C, E, F) async throws -> R {
    { a, b, c, e, f in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E, _ f: Deferred) -> (A, B, C, D, F) -> R {
    { a, b, c, d, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E, _ f: Deferred) -> (A, B, C, D, F) throws -> R {
    { a, b, c, d, f in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E, _ f: Deferred) -> @Sendable (A, B, C, D, F) async -> R {
    { a, b, c, d, f in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E, _ f: Deferred) -> @Sendable (A, B, C, D, F) async throws -> R {
    { a, b, c, d, f in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D, E) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: F) -> (A, B, C, D, E) -> R {
    { a, b, c, d, e in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D, E) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: F) -> (A, B, C, D, E) throws -> R {
    { a, b, c, d, e in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: F) -> @Sendable (A, B, C, D, E) async -> R {
    { a, b, c, d, e in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D, E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: F) -> @Sendable (A, B, C, D, E) async throws -> R {
    { a, b, c, d, e in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (C, D, E, F) -> R {
    { c, d, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (C, D, E, F) throws -> R {
    { c, d, e, f in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> @Sendable (C, D, E, F) async -> R {
    { c, d, e, f in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> @Sendable (C, D, E, F) async throws -> R {
    { c, d, e, f in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (A, D, E, F) -> R {
    { a, d, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (A, D, E, F) throws -> R {
    { a, d, e, f in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> @Sendable (A, D, E, F) async -> R {
    { a, d, e, f in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> @Sendable (A, D, E, F) async throws -> R {
    { a, d, e, f in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred, _ f: Deferred) -> (A, B, E, F) -> R {
    { a, b, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred, _ f: Deferred) -> (A, B, E, F) throws -> R {
    { a, b, e, f in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred, _ f: Deferred) -> @Sendable (A, B, E, F) async -> R {
    { a, b, e, f in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred, _ f: Deferred) -> @Sendable (A, B, E, F) async throws -> R {
    { a, b, e, f in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E, _ f: Deferred) -> (A, B, C, F) -> R {
    { a, b, c, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E, _ f: Deferred) -> (A, B, C, F) throws -> R {
    { a, b, c, f in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E, _ f: Deferred) -> @Sendable (A, B, C, F) async -> R {
    { a, b, c, f in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E, _ f: Deferred) -> @Sendable (A, B, C, F) async throws -> R {
    { a, b, c, f in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E, _ f: F) -> (A, B, C, D) -> R {
    { a, b, c, d in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E, _ f: F) -> (A, B, C, D) throws -> R {
    { a, b, c, d in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E, _ f: F) -> @Sendable (A, B, C, D) async -> R {
    { a, b, c, d in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E, _ f: F) -> @Sendable (A, B, C, D) async throws -> R {
    { a, b, c, d in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (D, E, F) -> R {
    { d, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (D, E, F) throws -> R {
    { d, e, f in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> @Sendable (D, E, F) async -> R {
    { d, e, f in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D, E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> @Sendable (D, E, F) async throws -> R {
    { d, e, f in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: Deferred, _ f: Deferred) -> (E, F) -> R {
    { e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: Deferred, _ f: Deferred) -> (E, F) throws -> R {
    { e, f in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: Deferred, _ f: Deferred) -> @Sendable (E, F) async -> R {
    { e, f in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (E, F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: Deferred, _ f: Deferred) -> @Sendable (E, F) async throws -> R {
    { e, f in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: Deferred) -> (F) -> R {
    { f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: Deferred) -> (F) throws -> R {
    { f in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: Deferred) -> @Sendable (F) async -> R {
    { f in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (F) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: Deferred) -> @Sendable (F) async throws -> R {
    { f in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (E) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: Deferred, _ f: F) -> (E) -> R {
    { e in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (E) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: Deferred, _ f: F) -> (E) throws -> R {
    { e in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: Deferred, _ f: F) -> @Sendable (E) async -> R {
    { e in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (E) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: Deferred, _ f: F) -> @Sendable (E) async throws -> R {
    { e in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: E, _ f: F) -> (D) -> R {
    { d in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: E, _ f: F) -> (D) throws -> R {
    { d in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: E, _ f: F) -> @Sendable (D) async -> R {
    { d in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: E, _ f: F) -> @Sendable (D) async throws -> R {
    { d in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: E, _ f: F) -> (C) -> R {
    { c in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: E, _ f: F) -> (C) throws -> R {
    { c in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: E, _ f: F) -> @Sendable (C) async -> R {
    { c in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: E, _ f: F) -> @Sendable (C) async throws -> R {
    { c in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: E, _ f: F) -> (B) -> R {
    { b in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: E, _ f: F) -> (B) throws -> R {
    { b in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: E, _ f: F) -> @Sendable (B) async -> R {
    { b in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: E, _ f: F) -> @Sendable (B) async throws -> R {
    { b in try await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) -> (A) -> R {
    { a in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) -> (A) throws -> R {
    { a in try fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) -> @Sendable (A) async -> R {
    { a in await fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to an async throwing function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
@Sendable
public func partial<A: Sendable, B: Sendable, C: Sendable, D: Sendable, E: Sendable, F: Sendable, R>(_ fn: @escaping @Sendable (A, B, C, D, E, F) async throws -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) -> @Sendable (A) async throws -> R {
    { a in try await fn(a, b, c, d, e, f) }
}

public enum Deferred {
    case deferred
}
