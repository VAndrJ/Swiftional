//
//  Applyable.swift
//  
//
//  Created by Volodymyr Andriienko on 08.02.2022.
//

import Foundation

/// Protocol for adding useful functions in a simple way.
public protocol Applyable {}

public extension Applyable where Self: AnyObject {
    /// Calls the specified closure with Self value as its receiver and returns Self value.
    ///
    /// - Parameter f: Closure to apply.
    /// - Returns: Return Self object.
    @discardableResult
    func apply(_ f: (Self) throws -> Void) rethrows -> Self {
        try f(self)
        return self
    }

    /// Calls the specified closure with Self value as its argument and returns closure result.
    ///
    /// - Parameter f: Closure to apply.
    /// - Returns: Closure result.
    func `let`<R>(_ f: (Self) throws -> R) rethrows -> R {
        try f(self)
    }
}

public extension Applyable where Self: Any {
    /// Calls the specified closure with Self value as its receiver and returns copy of Self value.
    ///
    /// - Parameter f: Closure to apply.
    /// - Returns: Return new Self with applied closure.
    func applied(_ f: (inout Self) throws -> Void) rethrows -> Self {
        var mutableCopy = self
        try f(&mutableCopy)
        return mutableCopy
    }
}
