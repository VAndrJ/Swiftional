//
//  Collection+Support.swift
//
//
//  Created by VAndrJ on 23.05.2024.
//

import Foundation

public extension Collection {
    /// A computed property that returns a `Bool` value indicating whether the collection is not empty.
    var isNonEmpty: Bool { !isEmpty }

    /// A subscript method allowing safe access to an element at a specified index within the collection.
    ///
    /// - Parameter index: The index of the element to retrieve.
    /// - Returns: An optional Element type. If the index is valid, returns the element at that index; otherwise, returns nil.
    /// - Complexity: O(n) in the worst case scenario due to checking for index containment in the collection's indices.
    subscript(at index: Index) -> Element? {
        if indices.contains(index) {
            self[index]
        } else {
            nil
        }
    }
}

public extension Optional where Wrapped: Collection {
    /// A computed property that returns a `Bool` value indicating whether the optional collection is either empty or nil.
    var isEmptyOrNil: Bool { self?.isEmpty ?? true }
    /// A computed property that returns a `Bool` value indicating whether the optional collection is not empty and not nil.
    var isNonEmpty: Bool { !isEmptyOrNil }
}
