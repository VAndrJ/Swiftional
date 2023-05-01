//
//  HKT.swift
//  
//
//  Created by Volodymyr Andriienko on 15.02.2022.
//

import Foundation

/// Higher-Kinded Type with 1 type argument.
/// - [A]: Type parameter
/// - [F]: Type constructor
///
/// This class simulates Higher-Kinded Type support. `HKT<F, A>` is an alias for `F<A>`, which is not syntactically valid. So, instead of writing `F<A>`, we will write `HKT<F, A>`.
/// This is useful because in the expression `HKT<F, A>`, both `F` and `A` have kind `*`,
/// so we can work with them using the type system we currently have at our disposal.
///
/// Type parameter `F` is reserved for a witness to prevent circular references in the inheritance relationship.
/// By convention, witnesses are named like the class they represent, with the prefix `For`.
open class HKT<F, A> {

    public init() {}
}
