//
//  Bool.swift
//  
//
//  Created by Volodymyr Andriienko on 10.02.2022.
//

import Foundation

extension Bool {
    /// Case analysis for the `Bool` type.
    /// Applies the provided closures based on the value.
    ///
    /// - Parameters:
    ///   - onFalse: Closure to apply if false.
    ///   - onTrue: Closure to apply if true.
    /// - Returns: Result of applying the corresponding closure to this value.
    func fold<R>(_ onFalse: () -> R, _ onTrue: () -> R) -> R {
        self ? onTrue() : onFalse()
    }
    
    /// Runs the provided closures based on the content of this value.
    ///
    /// - Parameters:
    ///   - onFalse: Closure to apply if false.
    ///   - onTrue: Closure to apply if true.
    func foldRun(_ onFalse: () -> Void, _ onTrue: () -> Void) {
        self ? onTrue() : onFalse()
    }
}
