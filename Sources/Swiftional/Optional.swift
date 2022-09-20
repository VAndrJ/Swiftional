//
//  Optional.swift
//  
//
//  Created by VAndrJ on 20.09.2022.
//

import Foundation

extension Optional {

    func fold<T>(_ onNone: () -> T, _ onValue: (Wrapped) -> T) -> T {
        switch self {
        case .none:
            return onNone()
        case let .some(value):
            return onValue(value)
        }
    }
}
