//
//  Operators.swift
//  
//
//  Created by Volodymyr Andriienko on 08.02.2022.
//

import Foundation

precedencegroup ForwardApplication {
    associativity: left
    higherThan: AssignmentPrecedence
}

precedencegroup BackwardApplication {
    associativity: right
    higherThan: AssignmentPrecedence
}

precedencegroup ForwardComposition {
    associativity: left
    higherThan: ForwardApplication
}

infix operator |>: ForwardApplication

/// Pipe forward. Applies an argument to a function.
///
/// Example. This:
/// ```
/// let result = h(g(f(a)))
/// ```
/// Can also be written as:
/// ```
/// let result = a |> f |> g |> h
/// ```
///
/// - Parameters:
///   - a: Argument to apply.
///   - f: Function receiving the argument.
/// - Returns: Result of running the function with the argument as input.
public func |> <A, R>(_ a: A, _ f: (A) throws -> R) rethrows -> R {
    try f(a)
}

/// Pipe forward. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
public func |> <A, B, R>(_ a: A, _ f: @escaping (A, B) -> R) -> (B) -> R {
    { b in f(a, b) }
}

/// Pipe forward. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
public func |> <A, B, R>(_ a: A, _ f: @escaping (A, B) throws -> R) -> (B) throws -> R {
    { b in try f(a, b) }
}

/// Pipe forward. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
public func |> <A, B, C, R>(_ a: A, _ f: @escaping (A, B, C) -> R) -> (B, C) -> R {
    { b, c in f(a, b, c) }
}

/// Pipe forward. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
public func |> <A, B, C, R>(_ a: A, _ f: @escaping (A, B, C) throws -> R) -> (B, C) throws -> R {
    { b, c in try f(a, b, c) }
}

/// Pipe forward. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
public func |> <A, B, C, D, R>(_ a: A, _ f: @escaping (A, B, C, D) -> R) -> (B, C, D) -> R {
    { b, c, d in f(a, b, c, d) }
}

/// Pipe forward. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
public func |> <A, B, C, D, R>(_ a: A, _ f: @escaping (A, B, C, D) throws -> R) -> (B, C, D) throws -> R {
    { b, c, d in try f(a, b, c, d) }
}

/// Pipe forward. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
public func |> <A, B, C, D, E, R>(_ a: A, _ f: @escaping (A, B, C, D, E) -> R) -> (B, C, D, E) -> R {
    { b, c, d, e in f(a, b, c, d, e) }
}

/// Pipe forward. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
public func |> <A, B, C, D, E, R>(_ a: A, _ f: @escaping (A, B, C, D, E) throws -> R) -> (B, C, D, E) throws -> R {
    { b, c, d, e in try f(a, b, c, d, e) }
}

infix operator <|: BackwardApplication

/// Pipe backward. Applies a function to an argument.
///
/// Example. This:
/// ```
/// let result = h(g(f(a)))
/// ```
/// Can also be written as:
/// ```
/// let result = h <| g <| f <| a
/// ```
///
/// - Parameters:
///   - f: Function receiving the argument.
///   - a: Argument to apply.
/// - Returns: Result of running the function with the argument as input.
public func <| <A, R>(_ f: (A) throws -> R, _ a: A) rethrows -> R {
    try f(a)
}

infix operator >>>: ForwardComposition

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, R>(_ f: @escaping () -> A, _ g: @escaping (A) -> R) -> () -> R {
    { g(f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, R>(_ f: @escaping () throws -> A, _ g: @escaping (A) -> R) -> () throws -> R {
    { g(try f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, R>(_ f: @escaping () -> A, _ g: @escaping (A) throws -> R) -> () throws -> R {
    { try g(f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, R>(_ f: @escaping () throws -> A, _ g: @escaping (A) throws -> R) -> () throws -> R {
    { try g(try f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, B, R>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> R) -> (A) -> R {
    { a in g(f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, B, R>(_ f: @escaping (A) throws -> B, _ g: @escaping (B) -> R) -> (A) throws -> R {
    { a in g(try f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, B, R>(_ f: @escaping (A) -> B, _ g: @escaping (B) throws -> R) -> (A) throws -> R {
    { a in try g(f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, B, R>(_ f: @escaping (A) throws -> B, _ g: @escaping (B) throws -> R) -> (A) throws -> R {
    { a in try g(try f(a)) }
}
