//
//  PartialApplication.swift
//  
//
//  Created by Volodymyr Andriienko on 07.02.2022.
//

import Foundation

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A) -> R
public func partial<A, B, R>(_ f: @escaping (A, B) -> R, _ a: Deferred, _ b: B) -> (A) -> R {
    { a in f(a, b) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B) -> R
public func partial<A, B, R>(_ f: @escaping (A, B) -> R, _ a: A, _ b: Deferred) -> (B) -> R {
    { b in f(a, b) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A) -> R
public func partial<A, B, C, R>(_ f: @escaping (A, B, C) -> R, _ a: Deferred, _ b: B, _ c: C) -> (A) -> R {
    { a in f(a, b, c) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B) -> R
public func partial<A, B, C, R>(_ f: @escaping (A, B, C) -> R, _ a: A, _ b: Deferred, _ c: C) -> (B) -> R {
    { b in f(a, b, c) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (C) -> R
public func partial<A, B, C, R>(_ f: @escaping (A, B, C) -> R, _ a: A, _ b: B, _ c: Deferred) -> (C) -> R {
    { c in f(a, b, c) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, B) -> R
public func partial<A, B, C, R>(_ f: @escaping (A, B, C) -> R, _ a: Deferred, _ b: Deferred, _ c: C) -> (A, B) -> R {
    { a, b in f(a, b, c) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, C) -> R
public func partial<A, B, C, R>(_ f: @escaping (A, B, C) -> R, _ a: Deferred, _ b: B, _ c: Deferred) -> (A, C) -> R {
    { a, c in f(a, b, c) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B, C) -> R
public func partial<A, B, C, R>(_ f: @escaping (A, B, C) -> R, _ a: A, _ b: Deferred, _ c: Deferred) -> (B, C) -> R {
    { b, c in f(a, b, c) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D) -> (A) -> R {
    { a in f(a, b, c, d) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D) -> (B) -> R {
    { b in f(a, b, c, d) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (C) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D) -> (C) -> R {
    { c in f(a, b, c, d) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (D) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred) -> (D) -> R {
    { d in f(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (C, D) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred) -> (C, D) -> R {
    { c, d in f(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B, D) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred) -> (B, D) -> R {
    { b, d in f(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, D) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred) -> (A, D) -> R {
    { a, d in f(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, C) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D) -> (A, C) -> R {
    { a, c in f(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, B) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D) -> (A, B) -> R {
    { a, b in f(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B, C) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D) -> (B, C) -> R {
    { b, c in f(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, B, C) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D) -> (A, B, C) -> R {
    { a, b, c in f(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, B, D) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred) -> (A, B, D) -> R {
    { a, b, d in f(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, C, D) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred) -> (A, C, D) -> R {
    { a, c, d in f(a, b, c, d) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B, C, D) -> R
public func partial<A, B, C, D, R>(_ f: @escaping (A, B, C, D) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred) -> (B, C, D) -> R {
    { b, c, d in f(a, b, c, d) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: E) -> (A) -> R {
    { a in f(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: E) -> (B) -> R {
    { b in f(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (C) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: E) -> (C) -> R {
    { c in f(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (D) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: E) -> (D) -> R {
    { d in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (C, D) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: E) -> (C, D) -> R {
    { c, d in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B, D) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred, _ e: E) -> (B, D) -> R {
    { b, d in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, D) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: E) -> (A, D) -> R {
    { a, d in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, C) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D, _ e: E) -> (A, C) -> R {
    { a, c in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, B) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: E) -> (A, B) -> R {
    { a, b in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B, C) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E) -> (B, C) -> R {
    { b, c in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, B, C) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: E) -> (A, B, C) -> R {
    { a, b, c in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, B, D) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: E) -> (A, B, D) -> R {
    { a, b, d in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, C, D) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: E) -> (A, C, D) -> R {
    { a, c, d in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B, C, D) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: E) -> (B, C, D) -> R {
    { b, c, d in f(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: D, _ e: Deferred) -> (A, E) -> R {
    { a, e in f(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred) -> (B, E) -> R {
    { b, e in f(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (C, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: D, _ e: Deferred) -> (C, E) -> R {
    { c, e in f(a, b, c, d, e) }
}

/// Partial application. Applies an argument to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (D, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred) -> (D, E) -> R {
    { d, e in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (C, D, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> (C, D, E) -> R {
    { c, d, e in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B, D, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred) -> (B, D, E) -> R {
    { b, d, e in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, D, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: C, _ d: Deferred, _ e: Deferred) -> (A, D, E) -> R {
    { a, d, e in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, C, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: D, _ e: Deferred) -> (A, C, E) -> R {
    { a, c, e in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, B, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: D, _ e: Deferred) -> (A, B, E) -> R {
    { a, b, e in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B, C, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred) -> (B, C, E) -> R {
    { b, c, e in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, B, C, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: Deferred, _ d: D, _ e: Deferred) -> (A, B, C, E) -> R {
    { a, b, c, e in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, B, D, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: Deferred, _ c: C, _ d: Deferred, _ e: Deferred) -> (A, B, D, E) -> R {
    { a, b, d, e in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (A, C, D, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: Deferred, _ b: B, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> (A, C, D, E) -> R {
    { a, c, d, e in f(a, b, c, d, e) }
}

/// Partial application. Applies arguments to a function.
///
/// - Returns: Partially applied form of an argument function `f`: (B, C, D, E) -> R
public func partial<A, B, C, D, E, R>(_ f: @escaping (A, B, C, D, E) -> R, _ a: A, _ b: Deferred, _ c: Deferred, _ d: Deferred, _ e: Deferred) -> (B, C, D, E) -> R {
    { b, c, d, e in f(a, b, c, d, e) }
}

public enum Deferred {
    case deferred
}
