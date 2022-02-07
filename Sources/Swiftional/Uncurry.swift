//
//  Uncurry.swift
//  
//
//  Created by Volodymyr Andriienko on 07.02.2022.
//

import Foundation

/// Converts a curried function into a function taking 2 arguments.
///
/// - Parameter f: Function to uncurry.
/// - Returns: Uncurried form of an argument function `f`: (A, B) -> R
public func uncurry<A, B, R>(_ f: @escaping (A) -> (B) -> R) -> (A, B) -> R {
    { a, b in f(a)(b) }
}

/// Converts a curried function into a function taking 3 arguments.
///
/// - Parameter f: Function to uncurry.
/// - Returns: Uncurried form of an argument function `f`: (A, B, C) -> R
public func uncurry<A, B, C, R>(_ f: @escaping (A) -> (B) -> (C) -> R) -> (A, B, C) -> R {
    { a, b, c in f(a)(b)(c) }
}

/// Converts a curried function into a function taking 4 arguments.
///
/// - Parameter f: Function to uncurry.
/// - Returns: Uncurried form of an argument function `f`: (A, B, C, D) -> R
public func uncurry<A, B, C, D, R>(_ f: @escaping (A) -> (B) -> (C) -> (D) -> R) -> (A, B, C, D) -> R {
    { a, b, c, d in f(a)(b)(c)(d) }
}

/// Converts a curried function into a function taking 5 arguments.
///
/// - Parameter f: Function to uncurry.
/// - Returns: Uncurried form of an argument function `f`: (A, B, C, D, E) -> R
public func uncurry<A, B, C, D, E, R>(_ f: @escaping (A) -> (B) -> (C) -> (D) -> (E) -> R) -> (A, B, C, D, E) -> R {
    { a, b, c, d, e in f(a)(b)(c)(d)(e) }
}
