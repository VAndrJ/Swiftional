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

/// Converts a curried function into a function taking 3 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C) -> R
public func uncurry<A, B, C, R>(_ fn: @escaping (A) -> (B) -> (C) -> R) -> (A, B, C) -> R {
    { a, b, c in fn(a)(b)(c) }
}

/// Converts a curried function into a function taking 4 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D) -> R
public func uncurry<A, B, C, D, R>(_ fn: @escaping (A) -> (B) -> (C) -> (D) -> R) -> (A, B, C, D) -> R {
    { a, b, c, d in fn(a)(b)(c)(d) }
}

/// Converts a curried function into a function taking 5 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D, E) -> R
public func uncurry<A, B, C, D, E, R>(_ fn: @escaping (A) -> (B) -> (C) -> (D) -> (E) -> R) -> (A, B, C, D, E) -> R {
    { a, b, c, d, e in fn(a)(b)(c)(d)(e) }
}

/// Converts a curried function into a function taking 6 arguments.
///
/// - Parameter fn: Function to uncurry.
/// - Returns: Uncurried form of an argument function `fn`: (A, B, C, D, E) -> R
public func uncurry<A, B, C, D, E, F, R>(_ fn: @escaping (A) -> (B) -> (C) -> (D) -> (E) -> (F) -> R) -> (A, B, C, D, E, F) -> R {
    { a, b, c, d, e, f in fn(a)(b)(c)(d)(e)(f) }
}
