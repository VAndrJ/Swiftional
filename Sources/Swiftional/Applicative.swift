//
//  Applicative.swift
//  
//
//  Created by Volodymyr Andriienko on 23.02.2022.
//

import Foundation

/// An `Applicative` is a `Functor` that also provides functionality to lift pure expressions,
/// and sequence computations and combine their results. It equipped with a function
/// that takes a value to an instance of a functor containing that value.
/// Sits in the middle distance between a `Functor` and a `Monad`.
/// Applicative Functors provide the ability to operate on not just values, but
/// values in a functorial context such as `Either`s, `List`s, and `Optional`s without
/// needing to unwrap or map over their contents.
public protocol Applicative: Functor {
    /// A point taking values to instances of themselves.
    ///
    /// - Parameter a: Value to be lifted.
    /// - Returns: Provided value in the context type implementing this instance.
    static func pure<A>(_ a: A) -> HKT<Self, A>

    /// Applies the function encapsulated by the Functor to the value
    /// encapsulated by the receiver.
    ///
    /// - Parameters:
    ///   - f: A function in the context implementing this instance.
    /// - Returns: A value in the context implementing this instance, resulting of the transformation of the contained original value with the contained function.
    func ap<A, B>(_ f: HKT<Self, (A) -> B>) -> HKT<Self, B>
}
