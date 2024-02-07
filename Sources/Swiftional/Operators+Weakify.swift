//
//  Operators+Weakify.swift
//  
//
//  Created by Volodymyr Andriienko on 29.07.2023.
//

import Foundation

infix operator ?> : ForwardComposition

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to ignore.
public func ?> <T: AnyObject, each U>(_ obj: T?, _ block: @escaping (T) -> Void) -> (repeat each U) -> Void {
    weakify(obj, block)
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?> <T: AnyObject, each U>(_ obj: T?, _ block: @escaping (T, repeat each U) -> Void) -> (repeat each U) -> Void {
    weakify(obj, block)
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?><T: AnyObject, each U, R>(_ obj: T?, _ block: @escaping (T) -> R?) -> (repeat each U) -> R? {
    weakify(obj, block)
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?><T: AnyObject, each U, R>(_ obj: T?, _ block: @escaping (T, repeat each U) -> R?) -> (repeat each U) -> R? {
    weakify(obj, block)
}

infix operator ?>> : ForwardComposition

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, each U>(_ obj: T?, _ block: @escaping (T) -> (repeat each U) -> Void) -> (repeat each U) -> Void {
    return { [weak obj] (values: repeat each U) in
        guard let obj else { return }

        block(obj)(repeat each values)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, each U>(_ obj: T?, _ block: @escaping (T) -> ((repeat each U) -> Void)?) -> (repeat each U) -> Void {
    return { [weak obj] (values: repeat each U) in
        guard let obj else { return }

        block(obj)?(repeat each values)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, each U>(_ obj: T?, _ block: @escaping (T) -> () -> Void) -> (repeat each U) -> Void {
    return { [weak obj] (_: repeat each U) in
        guard let obj else { return }

        block(obj)()
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, each U>(_ obj: T?, _ block: @escaping (T) -> (() -> Void)?) -> (repeat each U) -> Void {
    return { [weak obj] (_: repeat each U) in
        guard let obj else { return }

        block(obj)?()
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, each U, R>(_ obj: T?, _ block: @escaping (T) -> (repeat each U) -> R?) -> (repeat each U) -> R? {
    return { [weak obj] (values: repeat each U) in
        guard let obj else {
            return nil
        }

        return block(obj)(repeat each values)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, each U, R>(_ obj: T?, _ block: @escaping (T) -> ((repeat each U) -> R?)?) -> (repeat each U) -> R? {
    return { [weak obj] (values: repeat each U) in
        guard let obj else {
            return nil
        }

        return block(obj)?(repeat each values)
    }
}


/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, each U, R>(_ obj: T?, _ block: @escaping (T) -> () -> R?) -> (repeat each U) -> R? {
    return { [weak obj] (_: repeat each U) in
        guard let obj else {
            return nil
        }

        return block(obj)()
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, each U, R>(_ obj: T?, _ block: @escaping (T) -> (() -> R?)?) -> (repeat each U) -> R? {
    return { [weak obj] (_: repeat each U) in
        guard let obj else {
            return nil
        }

        return block(obj)?()
    }
}
