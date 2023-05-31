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

/// Converts an uncurried function with 3 arguments to a curried function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> R
public func curry<A, B, C, R>(_ fn: @escaping (A, B, C) -> R) -> (A) -> (B) -> (C) -> R {
    { a in { b in { c in fn(a, b, c) } } }
}

/// Converts an uncurried function with 4 arguments to a curried function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> R
public func curry<A, B, C, D, R>(_ fn: @escaping (A, B, C, D) -> R) -> (A) -> (B) -> (C) -> (D) -> R {
    { a in { b in { c in { d in fn(a, b, c, d) } } } }
}

/// Converts an uncurried function with 5 arguments to a curried function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> (E) -> R
public func curry<A, B, C, D, E, R>(_ fn: @escaping (A, B, C, D, E) -> R) -> (A) -> (B) -> (C) -> (D) -> (E) -> R {
    { a in { b in { c in { d in { e in fn(a, b, c, d, e) } } } } }
}

/// Converts an uncurried function with 6 arguments to a curried function.
///
/// - Parameter fn: Function to be curried.
/// - Returns: Curried form of an argument function `fn`: (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> R
public func curry<A, B, C, D, E, F, R>(_ fn: @escaping (A, B, C, D, E, F) -> R) -> (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> R {
    { a in { b in { c in { d in { e in { f in fn(a, b, c, d, e, f) } } } } } }
}
