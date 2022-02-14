//
//  Monoid.swift
//  
//
//  Created by Volodymyr Andriienko on 14.02.2022.
//

import Foundation

/// A monoid is a semigroup with an identity `(empty)`.
///
/// A monoid is a specialization of a semigroup, so its operation must be **associative**.
/// That is, combining any element with `empty` must return the original element.
/// ```
/// combine(x, empty) == combine(empty, x) == x
/// x.combine(empty) == empty.combine(x) == x
/// ```
public protocol Monoid: Semigroup {

    /// The identity element for this monoid.
    static var empty: Self { get }
}
