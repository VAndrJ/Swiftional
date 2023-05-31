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

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, R>(_ fn: @escaping (A, B) -> R, _ a: A, _ b: Deferred) -> (B) -> R {
    { b in fn(a, b) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) -> R, _ a: Deferred, _ b: B, _ c: C) -> (A) -> R {
    { a in fn(a, b, c) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) -> R, _ a: A, _ b: Deferred, _ c: C) -> (B) -> R {
    { b in fn(a, b, c) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) -> R, _ a: A, _ b: B, _ c: Deferred) -> (C) -> R {
    { c in fn(a, b, c) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) -> R, _ a: Deferred, _ b: Deferred, _ c: C) -> (A, B) -> R {
    { a, b in fn(a, b, c) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) -> R, _ a: Deferred, _ b: B, _ c: Deferred) -> (A, C) -> R {
    { a, c in fn(a, b, c) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
public func partial<A, B, C, R>(_ fn: @escaping (A, B, C) -> R, _ a: A, _ b: Deferred, _ c: Deferred) -> (B, C) -> R {
    { b, c in fn(a, b, c) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D) -> (A) -> R {
    { a in fn(a, b, c, d) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D) -> (B) -> R {
    { b in fn(a, b, c, d) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D) -> (C) -> R {
    { c in fn(a, b, c, d) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred) -> (D) -> R {
    { d in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred) -> (C, D) -> R {
    { c, d in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred) -> (B, D) -> R {
    { b, d in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred) -> (A, D) -> R {
    { a, d in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D) -> (A, C) -> R {
    { a, c in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D) -> (A, B) -> R {
    { a, b in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D) -> (B, C) -> R {
    { b, c in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D) -> (A, B, C) -> R {
    { a, b, c in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred) -> (A, B, D) -> R {
    { a, b, d in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred) -> (A, C, D) -> R {
    { a, c, d in fn(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D) -> R
public func partial<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred) -> (B, C, D) -> R {
    { b, c, d in fn(a, b, c, d) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: E) -> (A) -> R {
    { a in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: E) -> (B) -> R {
    { b in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: E) -> (C) -> R {
    { c in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: E) -> (D) -> R {
    { d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: E) -> (C, D) -> R {
    { c, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred, _ e: E) -> (B, D) -> R {
    { b, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: E) -> (A, D) -> R {
    { a, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D, _ e: E) -> (A, C) -> R {
    { a, c in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: E) -> (A, B) -> R {
    { a, b in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E) -> (B, C) -> R {
    { b, c in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E) -> (A, B, C) -> R {
    { a, b, c in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: E) -> (A, B, D) -> R {
    { a, b, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: E) -> (A, C, D) -> R {
    { a, c, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E) -> (B, C, D) -> R {
    { b, c, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E) -> (A, B, C, D) -> R {
    { a, b, c, d in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: Deferred) -> (A, E) -> R {
    { a, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred) -> (B, E) -> R {
    { b, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: Deferred) -> (C, E) -> R {
    { c, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred) -> (D, E) -> R {
    { d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> (C, D, E) -> R {
    { c, d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred) -> (B, D, E) -> R {
    { b, d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred) -> (A, D, E) -> R {
    { a, d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D, _ e: Deferred) -> (A, C, E) -> R {
    { a, c, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred) -> (A, B, E) -> R {
    { a, b, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred) -> (B, C, E) -> R {
    { b, c, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred) -> (A, B, C, E) -> R {
    { a, b, c, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred) -> (A, B, D, E) -> R {
    { a, b, d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> (A, C, D, E) -> R {
    { a, c, d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D, E) -> R
public func partial<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> (B, C, D, E) -> R {
    { b, c, d, e in fn(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B, C, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (B, C, D, E, F) -> R {
    { b, c, d, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, C, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (A, C, D, E, F) -> R {
    { a, c, d, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (A, B, D, E, F) -> R {
    { a, b, d, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred, _ f: Deferred) -> (A, B, C, E, F) -> R {
    { a, b, c, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E, _ f: Deferred) -> (A, B, C, D, F) -> R {
    { a, b, c, d, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D, E) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: F) -> (A, B, C, D, E) -> R {
    { a, b, c, d, e in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (C, D, E, F) -> R {
    { c, d, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (A, D, E, F) -> R {
    { a, d, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred, _ f: Deferred) -> (A, B, E, F) -> R {
    { a, b, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E, _ f: Deferred) -> (A, B, C, F) -> R {
    { a, b, c, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A, B, C, D) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E, _ f: F) -> (A, B, C, D) -> R {
    { a, b, c, d in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D, E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred, _ f: Deferred) -> (D, E, F) -> R {
    { d, e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (E, F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: Deferred, _ f: Deferred) -> (E, F) -> R {
    { e, f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (F) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: Deferred) -> (F) -> R {
    { f in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (E) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: C, _ d: D, _ e: Deferred, _ f: F) -> (E) -> R {
    { e in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (D) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: E, _ f: F) -> (D) -> R {
    { d in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (C) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: E, _ f: F) -> (C) -> R {
    { c in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (B) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: E, _ f: F) -> (B) -> R {
    { b in fn(a, b, c, d, e, f) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `fn`: (A) -> R
public func partial<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F) -> (A) -> R {
    { a in fn(a, b, c, d, e, f) }
}

public enum Deferred {
    case deferred
}
