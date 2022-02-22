//
//  Unit.swift
//  
//
//  Created by Volodymyr Andriienko on 22.02.2022.
//

import Foundation

/// Used instead of `Void` as a return statement for a function when no value is to be returned.
/// A unit type defined as an enum with a single case for extensibility.
/// There is only one value of type [Unit].
public enum Unit { case unit }

/// Used instead of `Void` as a return statement for a function when no value is to be returned.
/// There is only one value of type [Unit].
public let unit: Unit = .unit

// MARK: - Monoid

extension Unit: Monoid {
    public static var empty: Unit { .unit }

    public func combine(_ other: Unit) -> Unit {
        .unit
    }
}

// MARK: - Equatable

extension Unit: Equatable {}

// MARK: - Comparable

extension Unit: Comparable {}

// MARK: - CustomStringConvertible

extension Unit: CustomStringConvertible {
    public var description: String { "()" }
}

// MARK: - CustomDebugStringConvertible

extension Unit: CustomDebugStringConvertible {
    public var debugDescription: String { "()" }
}
