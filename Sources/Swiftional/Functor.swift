//
//  Functor.swift
//  
//
//  Created by Volodymyr Andriienko on 16.02.2022.
//

import Foundation

/// Functor provides a type with the ability to transform its value type into another type, preserving its structure.
public protocol Functor {
    /// Creates a new value transforming the type using the provided function, preserving the structure of the original type.
    /// Return type is `HKT<Self, B>`, which expresses the fact that what
    /// we return using exactly the same type constructor represented by the brand `Self`.
    ///
    /// - Parameters:
    ///   - f: Transforming function.
    /// - Returns: The result of transforming the value type using the provided function `f`.
    func map<A, B>(_ f: (A) -> B) -> HKT<Self, B>
}
