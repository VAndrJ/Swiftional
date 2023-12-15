//
//  Either.swift
//  
//
//  Created by Volodymyr Andriienko on 09.02.2022.
//

import Foundation

/// The type `Either` represents a value of one of these types, but not both: `.left(Left)` or `.right(Right)`.
///
/// The `Either` type is shifted to the right by convention.
/// That is, the `.left` constructor is usually used to hold errors or secondary data,
/// while `.right` is used to store a "correct", primary value - one that can be worked on further.
///
/// Wordplay: "Right" also means "Correct".
public enum Either<Left, Right> {
    case left(Left)
    case right(Right)

    /// Returns the value of `.right` if it exists otherwise nil.
    public var rightValue: Right? { fold(constant(nil), identity(_:)) }
    /// Returns the value of `.left` if it exists otherwise nil.
    public var leftValue: Left? { fold(identity(_:), constant(nil)) }
    /// Check if this `Either` value is a `.left`.
    public var isLeft: Bool { fold(constant(true), constant(false)) }
    /// Check if this `Either` value is a `.right`.
    public var isRight: Bool { !isLeft }
}

// MARK: - Mappable

public extension Either {
    /// Transforms both type parameters, preserving the structure of this value.
    ///
    /// - Parameters:
    ///   - fl: Closure to be applied when there is a left value.
    ///   - fr: Closure to be applied when there is a right value.
    /// - Returns: Result of applying the corresponding closure to value.
    func bimap<L, R>(_ fl: (Left) -> L, _ fr: (Right) -> R) -> Either<L, R> {
        fold({ Either<L, R>.left(fl($0)) }, { Either<L, R>.right(fr($0)) })
    }

    /// Transforms the right type parameter, preserving the structure of this value.
    ///
    /// - Parameter fr: Transforming closure.
    /// - Returns: Result of applying the closure to the right value in this `Either`.
    func map<R>(_ fr: (Right) -> R) -> Either<Left, R> {
        bimap(identity(_:), fr)
    }

    /// Transforms the left type parameter, preserving the structure of this value.
    ///
    /// - Parameter fl: Transforming closure.
    /// - Returns: Result of applying the closure to the left value in this `Either`.
    func mapLeft<R>(_ fl: (Left) -> R) -> Either<R, Right> {
        bimap(fl, identity(_:))
    }

    /// Applies a function to `.right` value contained in the `Either`.
    /// If `.left`, the given function is ignored and the result of this function is new `.left`.
    /// If `.right`, the result of `fr` function application to the value contained in the `Either`.
    ///
    /// - Parameter fl: Transforming closure.
    /// - Returns: Result of applying the closure to the right value in this `Either`.
    func flatMap<R>(_ fr: (Right) -> Either<Left, R>) -> Either<Left, R> {
        switch self {
        case let .left(l):
            return .left(l)
        case let .right(r):
            return fr(r)
        }
    }

    /// Reverses the types of this `Either`. `.left` value become `.right` and vice versa.
    ///
    /// - Returns: An `Either` value with its types reversed.
    func swapped() -> Either<Right, Left> {
        fold(Either<Right, Left>.right, Either<Right, Left>.left)
    }
}

// MARK: - Foldable

public extension Either {
    /// Case analysis for the `Either` type.
    /// Applies the provided closures based on the content of this `Either` value.
    ///
    /// - Parameters:
    ///   - fl: Closure to apply if the contained value in this `Either` is a member of the `.left` type.
    ///   - fr: Closure to apply if the contained value in this `Either` is a member of the `.right` type.
    /// - Returns: Result of applying the corresponding closure to this value.
    func fold<R>(_ fl: (Left) throws -> R, _ fr: (Right) throws -> R) rethrows -> R {
        switch self {
        case let .left(l):
            return try fl(l)
        case let .right(r):
            return try fr(r)
        }
    }

    /// Case analysis for the `Either` type.
    /// Applies the provided closures based on the content of this `Either` value.
    ///
    /// - Parameters:
    ///   - fl: Closure to apply if the contained value in this `Either` is a member of the `.left` type.
    ///   - fr: Closure to apply if the contained value in this `Either` is a member of the `.right` type.
    /// - Returns: Result of applying the corresponding closure to this value.
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @Sendable
    func fold<R>(_ fl: @Sendable (Left) async throws -> R, _ fr: @Sendable (Right) async throws -> R) async rethrows -> R {
        switch self {
        case let .left(l):
            return try await fl(l)
        case let .right(r):
            return try await fr(r)
        }
    }

    /// Case analysis for the `Either` type.
    /// Much like the ?? operator for `Optional` types, takes a value and a function, and if the
    /// receiver is `.right`, returns the value, otherwise maps the function over the value in
    /// `.left` and returns that value.
    ///
    /// - Parameters:
    ///   - fl: Closure to apply if the contained value in this `Either` is a member of the `.left` type.
    ///   - value: Constant value to return if the contained value in this `Either` is a member of the `.right` type.
    /// - Returns: Result of applying the corresponding closure to this value or constant.
    func foldLeft<R>(_ fl: (Left) throws -> R, _ value: R) rethrows -> R {
        try fold(fl, constant(value))
    }

    /// Case analysis for the `Either` type.
    /// Much like the ?? operator for `Optional` types, takes a value and a function, and if the
    /// receiver is `.right`, returns the value, otherwise maps the function over the value in
    /// `.left` and returns that value.
    ///
    /// - Parameters:
    ///   - fl: Closure to apply if the contained value in this `Either` is a member of the `.left` type.
    ///   - value: Constant value to return if the contained value in this `Either` is a member of the `.right` type.
    /// - Returns: Result of applying the corresponding closure to this value or constant.
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @Sendable
    func foldLeft<R>(_ fl: @Sendable (Left) async throws -> R, _ value: R) async rethrows -> R {
        try await fold(fl, const(value))
    }

    /// Case analysis for the `Either` type.
    /// Much like the ?? operator for `Optional` types, takes a value and a function, and if the
    /// receiver is `.left`, returns the value, otherwise maps the function over the value in
    /// `.right` and returns that value.
    ///
    /// - Parameters:
    ///   - value: Constant value to return if the contained value in this `Either` is a member of the `.left` type.
    ///   - fr: Closure to apply if the contained value in this `Either` is a member of the `.right` type.
    /// - Returns: Result of applying the corresponding closure to this value or constant.
    func foldRight<R>(_ value: R, _ fr: (Right) throws -> R) rethrows -> R {
        try fold(constant(value), fr)
    }

    /// Case analysis for the `Either` type.
    /// Much like the ?? operator for `Optional` types, takes a value and a function, and if the
    /// receiver is `.left`, returns the value, otherwise maps the function over the value in
    /// `.right` and returns that value.
    ///
    /// - Parameters:
    ///   - value: Constant value to return if the contained value in this `Either` is a member of the `.left` type.
    ///   - fr: Closure to apply if the contained value in this `Either` is a member of the `.right` type.
    /// - Returns: Result of applying the corresponding closure to this value or constant.
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @Sendable
    func foldRight<R>(_ value: R, _ fr: @Sendable (Right) async throws -> R) async rethrows -> R {
        try await fold(const(value), fr)
    }

    /// Runs the provided closures based on the content of this `Either` value.
    ///
    /// - Parameters:
    ///   - fl: Closure to run if the contained value in this `Either` is a member of the `.left` type.
    ///   - fr: Closure to run if the contained value in this `Either` is a member of the `.right` type.
    func foldRun(_ fl: (Left) throws -> Void, _ fr: (Right) throws -> Void) rethrows {
        switch self {
        case let .left(l):
            try fl(l)
        case let .right(r):
            try fr(r)
        }
    }

    /// Runs the provided closures based on the content of this `Either` value.
    ///
    /// - Parameters:
    ///   - fl: Closure to run if the contained value in this `Either` is a member of the `.left` type.
    ///   - fr: Closure to run if the contained value in this `Either` is a member of the `.right` type.
    @available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13.0, *)
    @Sendable
    func foldRun(_ fl: @Sendable (Left) async throws -> Void, _ fr: @Sendable (Right) async throws -> Void) async rethrows {
        switch self {
        case let .left(l):
            try await fl(l)
        case let .right(r):
            try await fr(r)
        }
    }
}

// MARK: - Mergeable

public extension Either where Left == Right {
    /// Value from available side.
    var mergedValue: Right { fold(identity(_:), identity(_:)) }
}

// MARK: - Equatable

extension Either: Equatable where Left: Equatable, Right: Equatable {}

public extension Either where Right: Equatable {
    /// Checks if this value has an element in the `.right` side.
    ///
    /// - Parameter value: Element to check.
    /// - Returns: Boolean value indicating if the element was found or not.
    func contains(_ value: Right) -> Bool {
        fold(constant(false), { $0 == value })
    }
}

// MARK: - Hashable

extension Either: Hashable where Left: Hashable, Right: Hashable {}

// MARK: - Codable

extension Either: Codable where Left: Codable, Right: Codable {}

// MARK: - CustomStringConvertible

extension Either: CustomStringConvertible {
    public var description: String { fold({ "Left(\($0))" }, { "Right(\($0))" }) }
}

// MARK: - CustomDebugStringConvertible

extension Either: CustomDebugStringConvertible where Left: CustomDebugStringConvertible, Right: CustomDebugStringConvertible {
    public var debugDescription: String { fold({ "Left(\($0.debugDescription))"}, { "Right(\($0.debugDescription))"}) }
}
