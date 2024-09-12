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
/// - Returns: A function to apply.
public func ?> <T: AnyObject>(_ obj: T?, _ block: @escaping (T) -> Void) -> () -> Void {
    weakify(obj, block)
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function to apply.
public func ?> <T: AnyObject & Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> Void) -> @Sendable () -> Void {
    return { [weak obj] in
        guard let obj else { return }

        block(obj)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to ignore.
public func ?> <T: AnyObject, U>(_ obj: T?, _ block: @escaping (T) -> Void) -> (U) -> Void {
    weakify(obj, block)
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to ignore.
public func ?> <T: AnyObject & Sendable, U: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> Void) -> @Sendable (U) -> Void {
    return { [weak obj] _ in
        guard let obj else { return }

        block(obj)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?> <T: AnyObject, U>(_ obj: T?, _ block: @escaping (T, U) -> Void) -> (U) -> Void {
    weakify(obj, block)
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?> <T: AnyObject & Sendable, U: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T, U) -> Void) -> @Sendable (U) -> Void {
    return { [weak obj] in
        guard let obj else { return }

        block(obj, $0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?> <T: AnyObject, U, V>(_ obj: T?, _ block: @escaping (T, U, V) -> Void) -> (U, V) -> Void {
    weakify(obj, block)
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?> <T: AnyObject & Sendable, U: Sendable, V: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T, U, V) -> Void) -> @Sendable (U, V) -> Void {
    return { [weak obj] in
        guard let obj else { return }

        block(obj, $0, $1)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function to apply.
public func ?><T: AnyObject, R>(_ obj: T?, _ block: @escaping (T) -> R?) -> () -> R? {
    weakify(obj, block)
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function to apply.
public func ?><T: AnyObject & Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> R?) -> @Sendable () -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?><T: AnyObject, U, R>(_ obj: T?, _ block: @escaping (T) -> R?) -> (U) -> R? {
    weakify(obj, block)
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?><T: AnyObject & Sendable, U: Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> R?) -> @Sendable (U) -> R? {
    return { [weak obj] _ in
        guard let obj else {
            return nil
        }

        return block(obj)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?><T: AnyObject, U, R>(_ obj: T?, _ block: @escaping (T, U) -> R?) -> (U) -> R? {
    weakify(obj, block)
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?><T: AnyObject & Sendable, U: Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T, U) -> R?) -> @Sendable (U) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj, $0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?><T: AnyObject, U, V, R>(_ obj: T?, _ block: @escaping (T, U, V) -> R?) -> (U, V) -> R? {
    weakify(obj, block)
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?><T: AnyObject & Sendable, U: Sendable, V: Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T, U, V) -> R?) -> @Sendable (U, V) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj, $0, $1)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?><T: AnyObject, U, V, R>(_ obj: T?, _ block: @escaping (T) -> R?) -> (U, V) -> R? {
    weakify(obj, block)
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?><T: AnyObject & Sendable, U: Sendable, V: Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> R?) -> @Sendable (U, V) -> R? {
    return { [weak obj] _, _ in
        guard let obj else {
            return nil
        }

        return block(obj)
    }
}

infix operator ?>> : ForwardComposition

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function to apply.
public func ?>> <T: AnyObject>(_ obj: T?, _ block: @escaping (T) -> () -> Void) -> () -> Void {
    return { [weak obj] in
        guard let obj else { return }

        block(obj)()
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function to apply.
public func ?>> <T: AnyObject & Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> () -> Void) -> @Sendable () -> Void {
    return { [weak obj] in
        guard let obj else { return }

        block(obj)()
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function to apply.
public func ?>> <T: AnyObject>(_ obj: T?, _ block: @escaping (T) -> (() -> Void)?) -> () -> Void {
    return { [weak obj] in
        guard let obj else { return }

        block(obj)?()
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function to apply.
public func ?>> <T: AnyObject & Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> (() -> Void)?) -> @Sendable () -> Void {
    return { [weak obj] in
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
public func ?>> <T: AnyObject, U>(_ obj: T?, _ block: @escaping (T) -> (U) -> Void) -> (U) -> Void {
    return { [weak obj] in
        guard let obj else { return }

        block(obj)($0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject & Sendable, U: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> (U) -> Void) -> @Sendable (U) -> Void {
    return { [weak obj] in
        guard let obj else { return }

        block(obj)($0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, U>(_ obj: T?, _ block: @escaping (T) -> ((U) -> Void)?) -> (U) -> Void {
    return { [weak obj] in
        guard let obj else { return }

        block(obj)?($0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject & Sendable, U: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> ((U) -> Void)?) -> @Sendable (U) -> Void {
    return { [weak obj] in
        guard let obj else { return }

        block(obj)?($0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, U>(_ obj: T?, _ block: @escaping (T) -> () -> Void) -> (U) -> Void {
    return { [weak obj] _ in
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
public func ?>> <T: AnyObject & Sendable, U: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> () -> Void) -> @Sendable (U) -> Void {
    return { [weak obj] _ in
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
public func ?>> <T: AnyObject, U>(_ obj: T?, _ block: @escaping (T) -> (() -> Void)?) -> (U) -> Void {
    return { [weak obj] _ in
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
public func ?>> <T: AnyObject & Sendable, U: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> (() -> Void)?) -> @Sendable (U) -> Void {
    return { [weak obj] _ in
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
public func ?>> <T: AnyObject, U, V>(_ obj: T?, _ block: @escaping (T) -> (U, V) -> Void) -> (U, V) -> Void {
    return { [weak obj] in
        guard let obj else { return }

        block(obj)($0, $1)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject & Sendable, U: Sendable, V: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> (U, V) -> Void) -> @Sendable (U, V) -> Void {
    return { [weak obj] in
        guard let obj else { return }

        block(obj)($0, $1)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, U, V>(_ obj: T?, _ block: @escaping (T) -> () -> Void) -> (U, V) -> Void {
    return { [weak obj] _, _ in
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
public func ?>> <T: AnyObject & Sendable, U: Sendable, V: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> () -> Void) -> @Sendable (U, V) -> Void {
    return { [weak obj] _, _ in
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
public func ?>> <T: AnyObject, U, V>(_ obj: T?, _ block: @escaping (T) -> (() -> Void)?) -> (U, V) -> Void {
    return { [weak obj] _, _ in
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
public func ?>> <T: AnyObject & Sendable, U: Sendable, V: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> (() -> Void)?) -> @Sendable (U, V) -> Void {
    return { [weak obj] _, _ in
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
public func ?>> <T: AnyObject, R>(_ obj: T?, _ block: @escaping (T) -> () -> R?) -> () -> R? {
    return { [weak obj] in
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
public func ?>> <T: AnyObject & Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> () -> R?) -> @Sendable () -> R? {
    return { [weak obj] in
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
public func ?>> <T: AnyObject, R>(_ obj: T?, _ block: @escaping (T) -> (() -> R?)?) -> () -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)?()
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject & Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> (() -> R?)?) -> @Sendable () -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)?()
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, U, R>(_ obj: T?, _ block: @escaping (T) -> (U) -> R?) -> (U) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)($0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject & Sendable, U: Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> (U) -> R?) -> @Sendable (U) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)($0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, U, R>(_ obj: T?, _ block: @escaping (T) -> ((U) -> R?)?) -> (U) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)?($0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject & Sendable, U: Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> ((U) -> R?)?) -> @Sendable (U) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)?($0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, U, R>(_ obj: T?, _ block: @escaping (T) -> ((U) -> R)?) -> (U) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)?($0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject & Sendable, U: Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> ((U) -> R)?) -> @Sendable (U) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)?($0)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, U, V, R>(_ obj: T?, _ block: @escaping (T) -> (U, V) -> R?) -> (U, V) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)($0, $1)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject & Sendable, U: Sendable, V: Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> (U, V) -> R?) -> @Sendable (U, V) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)($0, $1)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, U, V, R>(_ obj: T?, _ block: @escaping (T) -> ((U, V) -> R?)?) -> (U, V) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)?($0, $1)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject & Sendable, U: Sendable, V: Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> ((U, V) -> R?)?) -> @Sendable (U, V) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)?($0, $1)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, U, V, R>(_ obj: T?, _ block: @escaping (T) -> ((U, V) -> R)?) -> (U, V) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)?($0, $1)
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject & Sendable, U: Sendable, V: Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> ((U, V) -> R)?) -> @Sendable (U, V) -> R? {
    return { [weak obj] in
        guard let obj else {
            return nil
        }

        return block(obj)?($0, $1)
    }
}


/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject, U, V, R>(_ obj: T?, _ block: @escaping (T) -> () -> R?) -> (U, V) -> R? {
    return { [weak obj] _, _ in
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
public func ?>> <T: AnyObject& Sendable, U: Sendable, V: Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> () -> R?) -> @Sendable (U, V) -> R? {
    return { [weak obj] _, _ in
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
public func ?>> <T: AnyObject, U, V, R>(_ obj: T?, _ block: @escaping (T) -> (() -> R?)?) -> (U, V) -> R? {
    return { [weak obj] _, _ in
        guard let obj else {
            return nil
        }

        return block(obj)?()
    }
}

/// Weakifying function.
///
/// - Parameters:
///   - obj: Object to weakify.
///   - block: Block to apply.
/// - Returns: A function with argument to apply.
public func ?>> <T: AnyObject & Sendable, U: Sendable, V: Sendable, R: Sendable>(_ obj: T?, _ block: @Sendable @escaping (T) -> (() -> R?)?) -> @Sendable (U, V) -> R? {
    return { [weak obj] _, _ in
        guard let obj else {
            return nil
        }

        return block(obj)?()
    }
}
