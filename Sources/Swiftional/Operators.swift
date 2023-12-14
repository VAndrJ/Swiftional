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

precedencegroup BackwardComposition {
    associativity: right
    higherThan: ForwardApplication
}

infix operator |>: ForwardApplication

/// Pipe forward. Applies an argument to a function.
///
/// Example. This:
/// ```
/// let result = h(parameter: g(parameter: f(parameter: a)))
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

/// Pipe forward async. Applies an argument to a function.
///
/// Example. This:
/// ```
/// let result = try await h(parameter: g(parameter: f(parameter: a)))
/// ```
/// Can also be written as:
/// ```
/// let result = try await a |> f |> g |> h
/// ```
///
/// - Parameters:
///   - a: Argument to apply.
///   - f: Function receiving the argument.
/// - Returns: Result of running the function with the argument as input.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func |> <A, R>(_ a: A, _ f: @Sendable (A) async throws -> R) async rethrows -> R {
    try await f(a)
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

/// Pipe forward async. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func |> <A, B, R>(_ a: A, _ f: @escaping @Sendable (A, B) async -> R) -> @Sendable (B) async -> R {
    { b in await f(a, b) }
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

/// Pipe forward async throws. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func |> <A, B, R>(_ a: A, _ f: @escaping @Sendable (A, B) async throws -> R) -> @Sendable (B) async throws -> R {
    { b in try await f(a, b) }
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

/// Pipe forward async. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func |> <A, B, C, R>(_ a: A, _ f: @escaping @Sendable (A, B, C) async -> R) -> @Sendable (B, C) async -> R {
    { b, c in await f(a, b, c) }
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

/// Pipe forward async throws. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func |> <A, B, C, R>(_ a: A, _ f: @escaping @Sendable (A, B, C) async throws -> R) -> @Sendable (B, C) async throws -> R {
    { b, c in try await f(a, b, c) }
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

/// Pipe forward async. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func |> <A, B, C, D, R>(_ a: A, _ f: @escaping @Sendable (A, B, C, D) async -> R) -> @Sendable (B, C, D) async -> R {
    { b, c, d in await f(a, b, c, d) }
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

/// Pipe forward async throws. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func |> <A, B, C, D, R>(_ a: A, _ f: @escaping @Sendable (A, B, C, D) async throws -> R) -> @Sendable (B, C, D) async throws -> R {
    { b, c, d in try await f(a, b, c, d) }
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

/// Pipe forward async. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func |> <A, B, C, D, E, R>(_ a: A, _ f: @escaping @Sendable (A, B, C, D, E) async -> R) -> @Sendable (B, C, D, E) async -> R {
    { b, c, d, e in await f(a, b, c, d, e) }
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

/// Pipe forward async throws. Applies the first argument function, returning a function with the rest of the arguments of the original function.
///
/// - Parameters:
///   - a: Input to the first argument of the function
///   - f: Function receiving the argument.
/// - Returns: A function with the same behavior of the input function where the first argument is fixed to the value of the provided argument.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func |> <A, B, C, D, E, R>(_ a: A, _ f: @escaping @Sendable (A, B, C, D, E) async throws -> R) -> @Sendable (B, C, D, E) async throws -> R {
    { b, c, d, e in try await f(a, b, c, d, e) }
}

infix operator <|: BackwardApplication

/// Pipe backward. Applies a function to an argument.
///
/// Example. This:
/// ```
/// let result = h(parameter: g(parameter: f(parameter: a)))
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

/// Pipe backward async. Applies a function to an argument.
///
/// Example. This:
/// ```
/// let result = try await h(parameter: g(parameter: f(parameter: a)))
/// ```
/// Can also be written as:
/// ```
/// let result = try await h <| g <| f <| a
/// ```
///
/// - Parameters:
///   - f: Function receiving the argument.
///   - a: Argument to apply.
/// - Returns: Result of running the function with the argument as input.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <| <A, R>(_ f: @Sendable (A) async throws -> R, _ a: A) async rethrows -> R {
    try await f(a)
}

infix operator <<|: BackwardApplication

/// Applies a function to an argument and returns callable function.
///
/// Example. This:
/// ```
/// let result = { a in f(a) }
/// ```
/// Can also be written as:
/// ```
/// let result = f <<| a
/// ```
///
/// - Parameters:
///   - f: Function receiving the argument.
///   - a: Argument to apply.
/// - Returns: Result of running the function with the argument as input.
public func <<| <A, R>(_ f: @escaping (A) -> R, _ a: A) -> () -> R {
    { f(a) }
}

/// Applies a function to an argument and returns callable function async.
///
/// Example. This:
/// ```
/// let result = { a in await f(a) }
/// ```
/// Can also be written as:
/// ```
/// let result = await f <<| a
/// ```
///
/// - Parameters:
///   - f: Function receiving the argument.
///   - a: Argument to apply.
/// - Returns: Result of running the function with the argument as input.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<| <A, R>(_ f: @escaping @Sendable (A) async -> R, _ a: A) -> @Sendable () async -> R {
    { await f(a) }
}

infix operator |>>: ForwardApplication

/// Applies a function to an argument and returns callable function.
///
/// Example. This:
/// ```
/// let result = { a in f(a) }
/// ```
/// Can also be written as:
/// ```
/// let result = a |>> f
/// ```
///
/// - Parameters:
///   - f: Function receiving the argument.
///   - a: Argument to apply.
/// - Returns: Result of running the function with the argument as input.
public func |>> <A, R>(_ a: A, _ f: @escaping (A) -> R) -> () -> R {
    { f(a) }
}

/// Applies a function to an argument and returns callable function async.
///
/// Example. This:
/// ```
/// let result = { a in await f(a) }
/// ```
/// Can also be written as:
/// ```
/// let result = await a |>> f
/// ```
///
/// - Parameters:
///   - f: Function receiving the argument.
///   - a: Argument to apply.
/// - Returns: Result of running the function with the argument as input.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func |>> <A, R>(_ a: A, _ f: @escaping @Sendable (A) async -> R) -> @Sendable () async -> R {
    { await f(a) }
}

infix operator >>>: ForwardComposition

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, R>(_ f: @escaping () -> A, _ g: @escaping (A) -> R) -> () -> R {
    { g(f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f` async.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, R>(_ f: @escaping @Sendable () async -> A, _ g: @escaping @Sendable (A) async -> R) -> @Sendable () async -> R {
    { await g(f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f` async.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, R>(_ f: @escaping @Sendable () -> A, _ g: @escaping @Sendable (A) async -> R) -> @Sendable () async -> R {
    { await g(f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f` async.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, R>(_ f: @escaping @Sendable () async -> A, _ g: @escaping @Sendable (A) -> R) -> @Sendable () async -> R {
    { await g(f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, R>(_ f: @escaping () throws -> A, _ g: @escaping (A) -> R) -> () throws -> R {
    { g(try f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f` async.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, R>(_ f: @escaping @Sendable () async throws -> A, _ g: @escaping @Sendable (A) async -> R) -> @Sendable () async throws -> R {
    { await g(try f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f` async.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, R>(_ f: @escaping @Sendable () throws -> A, _ g: @escaping @Sendable (A) async -> R) -> @Sendable () async throws -> R {
    { await g(try f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f` async.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, R>(_ f: @escaping @Sendable () async throws -> A, _ g: @escaping @Sendable (A) -> R) -> @Sendable () async throws -> R {
    { await g(try f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, R>(_ f: @escaping () -> A, _ g: @escaping (A) throws -> R) -> () throws -> R {
    { try g(f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, R>(_ f: @escaping @Sendable () async -> A, _ g: @escaping @Sendable (A) async throws -> R) -> @Sendable () async throws -> R {
    { try await g(f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, R>(_ f: @escaping @Sendable () -> A, _ g: @escaping @Sendable (A) async throws -> R) -> @Sendable () async throws -> R {
    { try await g(f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, R>(_ f: @escaping @Sendable () async -> A, _ g: @escaping @Sendable (A) throws -> R) -> @Sendable () async throws -> R {
    { try await g(f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, R>(_ f: @escaping () throws -> A, _ g: @escaping (A) throws -> R) -> () throws -> R {
    { try g(try f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, R>(_ f: @escaping @Sendable () async throws -> A, _ g: @escaping @Sendable (A) async throws -> R) -> @Sendable () async throws -> R {
    { try await g(try f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, R>(_ f: @escaping @Sendable () throws -> A, _ g: @escaping @Sendable (A) async throws -> R) -> @Sendable () async throws -> R {
    { try await g(try f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, R>(_ f: @escaping @Sendable () async throws -> A, _ g: @escaping @Sendable (A) throws -> R) -> @Sendable () async throws -> R {
    { try await g(try f()) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, B, R>(_ f: @escaping (A) -> B, _ g: @escaping (B) -> R) -> (A) -> R {
    { a in g(f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, B, R>(_ f: @escaping @Sendable (A) async -> B, _ g: @escaping @Sendable (B) async -> R) -> @Sendable (A) async -> R {
    { a in await g(f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, B, R>(_ f: @escaping @Sendable (A) -> B, _ g: @escaping @Sendable (B) async -> R) -> @Sendable (A) async -> R {
    { a in await g(f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, B, R>(_ f: @escaping @Sendable (A) async -> B, _ g: @escaping @Sendable (B) -> R) -> @Sendable (A) async -> R {
    { a in await g(f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, B, R>(_ f: @escaping (A) throws -> B, _ g: @escaping (B) -> R) -> (A) throws -> R {
    { a in g(try f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, B, R>(_ f: @escaping @Sendable (A) async throws -> B, _ g: @escaping @Sendable (B) async -> R) -> @Sendable (A) async throws -> R {
    { a in await g(try f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, B, R>(_ f: @escaping @Sendable (A) throws -> B, _ g: @escaping @Sendable (B) async -> R) -> @Sendable (A) async throws -> R {
    { a in await g(try f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, B, R>(_ f: @escaping @Sendable (A) async throws -> B, _ g: @escaping @Sendable (B) -> R) -> @Sendable (A) async throws -> R {
    { a in await g(try f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, B, R>(_ f: @escaping (A) -> B, _ g: @escaping (B) throws -> R) -> (A) throws -> R {
    { a in try g(f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, B, R>(_ f: @escaping @Sendable (A) async -> B, _ g: @escaping @Sendable (B) async throws -> R) -> @Sendable (A) async throws -> R {
    { a in try await g(f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, B, R>(_ f: @escaping @Sendable (A) -> B, _ g: @escaping @Sendable (B) async throws -> R) -> @Sendable (A) async throws -> R {
    { a in try await g(f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, B, R>(_ f: @escaping @Sendable (A) async -> B, _ g: @escaping @Sendable (B) throws -> R) -> @Sendable (A) async throws -> R {
    { a in try await g(f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >>> <A, B, R>(_ f: @escaping (A) throws -> B, _ g: @escaping (B) throws -> R) -> (A) throws -> R {
    { a in try g(try f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, B, R>(_ f: @escaping @Sendable (A) async throws -> B, _ g: @escaping @Sendable (B) async throws -> R) -> @Sendable (A) async throws -> R {
    { a in try await g(try f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, B, R>(_ f: @escaping @Sendable (A) throws -> B, _ g: @escaping @Sendable (B) async throws -> R) -> @Sendable (A) async throws -> R {
    { a in try await g(try f(a)) }
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func >>> <A, B, R>(_ f: @escaping @Sendable (A) async throws -> B, _ g: @escaping @Sendable (B) throws -> R) -> @Sendable (A) async throws -> R {
    { a in try await g(try f(a)) }
}

infix operator <<<: BackwardComposition

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func <<< <A, R>(_ g: @escaping (A) -> R, _ f: @escaping () -> A) -> () -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, R>(_ g: @escaping @Sendable (A) async -> R, _ f: @escaping @Sendable () async -> A) -> @Sendable () async -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, R>(_ g: @escaping @Sendable (A) -> R, _ f: @escaping @Sendable () async -> A) -> @Sendable () async -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, R>(_ g: @escaping @Sendable (A) async -> R, _ f: @escaping @Sendable () -> A) -> @Sendable () async -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func <<< <A, R>(_ g: @escaping (A) throws -> R, _ f: @escaping () -> A) -> () throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, R>(_ g: @escaping @Sendable (A) async throws -> R, _ f: @escaping @Sendable () async -> A) -> @Sendable () async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, R>(_ g: @escaping @Sendable (A) throws -> R, _ f: @escaping @Sendable () async -> A) -> @Sendable () async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, R>(_ g: @escaping @Sendable (A) async throws -> R, _ f: @escaping @Sendable () -> A) -> @Sendable () async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func <<< <A, R>(_ g: @escaping (A) -> R, _ f: @escaping () throws -> A) -> () throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, R>(_ g: @escaping @Sendable (A) async -> R, _ f: @escaping @Sendable () async throws -> A) -> @Sendable () async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, R>(_ g: @escaping @Sendable (A) -> R, _ f: @escaping @Sendable () async throws -> A) -> @Sendable () async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, R>(_ g: @escaping @Sendable (A) async -> R, _ f: @escaping @Sendable () throws -> A) -> @Sendable () async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func <<< <A, R>(_ g: @escaping (A) throws -> R, _ f: @escaping () throws -> A) -> () throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, R>(_ g: @escaping @Sendable (A) async throws -> R, _ f: @escaping @Sendable () async throws -> A) -> @Sendable () async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, R>(_ g: @escaping @Sendable (A) throws -> R, _ f: @escaping @Sendable () async throws -> A) -> @Sendable () async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, R>(_ g: @escaping @Sendable (A) async throws -> R, _ f: @escaping @Sendable () throws -> A) -> @Sendable () async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func <<< <A, B, R>(_ g: @escaping (B) -> R, _ f: @escaping (A) -> B) -> (A) -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, B, R>(_ g: @escaping @Sendable (B) async -> R, _ f: @escaping @Sendable (A) async -> B) -> @Sendable (A) async -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, B, R>(_ g: @escaping @Sendable (B) -> R, _ f: @escaping @Sendable (A) async -> B) -> @Sendable (A) async -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, B, R>(_ g: @escaping @Sendable (B) async -> R, _ f: @escaping @Sendable (A) -> B) -> @Sendable (A) async -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func <<< <A, B, R>(_ g: @escaping (B) throws -> R, _ f: @escaping (A) -> B) -> (A) throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, B, R>(_ g: @escaping @Sendable (B) async throws -> R, _ f: @escaping @Sendable (A) async -> B) -> @Sendable (A) async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, B, R>(_ g: @escaping @Sendable (B) throws -> R, _ f: @escaping @Sendable (A) async -> B) -> @Sendable (A) async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, B, R>(_ g: @escaping @Sendable (B) async throws -> R, _ f: @escaping @Sendable (A) -> B) -> @Sendable (A) async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func <<< <A, B, R>(_ g: @escaping (B) -> R, _ f: @escaping (A) throws -> B) -> (A) throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, B, R>(_ g: @escaping @Sendable (B) async -> R, _ f: @escaping @Sendable (A) async throws -> B) -> @Sendable (A) async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, B, R>(_ g: @escaping @Sendable (B) -> R, _ f: @escaping @Sendable (A) async throws -> B) -> @Sendable (A) async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, B, R>(_ g: @escaping @Sendable (B) async -> R, _ f: @escaping @Sendable (A) throws -> B) -> @Sendable (A) async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func <<< <A, B, R>(_ g: @escaping (B) throws -> R, _ f: @escaping (A) throws -> B) -> (A) throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, B, R>(_ g: @escaping @Sendable (B) async throws -> R, _ f: @escaping @Sendable (A) async throws -> B) -> @Sendable (A) async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, B, R>(_ g: @escaping @Sendable (B) throws -> R, _ f: @escaping @Sendable (A) async throws -> B) -> @Sendable (A) async throws -> R {
    f >>> g
}

/// Composes a functions and return a function that is the result of applying `g` to the output of `f`.
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
public func <<< <A, B, R>(_ g: @escaping @Sendable (B) async throws -> R, _ f: @escaping @Sendable (A) throws -> B) -> @Sendable (A) async throws -> R {
    f >>> g
}

infix operator ~~>: ForwardComposition

/// Asynchronous function composition
///
/// - Parameters:
///   - f: Left-hand side.
///   - g: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func ~~> <A, E, R>(
    _ f: @escaping (@escaping (Result<A, E>) -> Void) -> Void,
    _ g: @escaping (A, @escaping (Result<R, E>) -> Void) -> Void
) -> (@escaping (Result<R, E>) -> Void) -> Void where E: Error {
    { result in
        f { fResult in
            switch fResult {
            case let .failure(error):
                result(.failure(error))
            case let .success(data):
                g(data) { gResult in
                    switch gResult {
                    case let .failure(error):
                        result(.failure(error))
                    case let .success(data):
                        result(.success(data))
                    }
                }
            }
        }
    }
}

infix operator >=>: ForwardComposition

/// Effectful function composition
///
/// - Parameters:
///   - g: Left-hand side.
///   - f: Right-hand side.
/// - Returns: A function that applies `g` to the output of `f`.
public func >=> <A, B, R>(_ f: @escaping (A) -> B?, _ g: @escaping (B) -> R?) -> (A) -> R? {
    { a in f(a).flatMap(g) }
}
