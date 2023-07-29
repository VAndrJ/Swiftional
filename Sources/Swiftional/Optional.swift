//
//  Optional.swift
//  
//
//  Created by Volodymyr Andriienko on 20.09.2022.
//

import Foundation

extension Optional {

    /// Case analysis for the `Optional` type.
    /// Applies the provided closures based on the content of this `Optional` value.
    ///
    /// - Parameters:
    ///   - onNone: Closure to apply if the contained value in this `Optional` is `.none`.
    ///   - onValue: Closure to apply if the contained value in this `Optional` is `.some(Wrapped)`.
    /// - Returns: Result of applying the corresponding closure to this value.
    public func fold<T>(_ onNone: () -> T, _ onValue: (Wrapped) -> T) -> T {
        switch self {
        case .none:
            return onNone()
        case let .some(value):
            return onValue(value)
        }
    }
}
