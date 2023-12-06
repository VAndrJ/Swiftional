//
//  Memoization.swift
//  
//
//  Created by VAndrJ on 06.12.2023.
//

import Foundation

func memoize<T: Hashable, R>(f: @escaping (T) -> R) -> (T) -> R {
    var memo: [T: R] = [:]

    return { x in
        if let memoized = memo[x] {
            return memoized
        }

        let result = f(x)
        memo[x] = result

        return result
    }
}

func memoize<T: Hashable, U: Hashable, R>(f: @escaping (T, U) -> R) -> (T, U) -> R {
    var memo: [T: [U: R]] = [:]

    return { x, y in
        if let memoized = memo[x]?[y] {
            return memoized
        }

        let result = f(x, y)
        memo[x, default: [:]][y] = result

        return result
    }
}

func rmemoize<T: Hashable, R>(f: @escaping ((T) -> R, T) -> R) -> (T) -> R {
    var memo: [T: R] = [:]

    func wrap(x: T) -> R {
        if let memoized = memo[x] {
            return memoized
        }

        let result = f(wrap, x)
        memo[x] = result

        return result
    }

    return wrap
}

func rmemoize<T: Hashable, U: Hashable, R>(f: @escaping ((T, U) -> R, T, U) -> R) -> (T, U) -> R {
    var memo: [T: [U: R]] = [:]

    func wrap(x: T, y: U) -> R {
        if let memoized = memo[x]?[y] {
            return memoized
        }

        let result = f(wrap, x, y)
        memo[x, default: [:]][y] = result

        return result
    }

    return wrap
}
