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

public enum Deferred {
    case deferred
}
