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
public class HKT<F, A> {

    public init() {}
}

/// Higher-Kinded Type with 2 type arguments.
///
/// This class simulates Higher-Kinded Type support. `HKT<F, A, B>` is an alias for `F<A, B>`, which is not syntactically valid. So, instead of writing `F<A, B>`, we will write `HKT<F, A, B>`.
/// This is useful because in the expression `HKT<F, A, B>`, both `F`, `B` and `A` have kind `*`,
/// so we can work with them using the type system we currently have at our disposal.
///
/// Type parameter `F` is reserved for a witness to prevent circular references in the inheritance relationship.
/// By convention, witnesses are named like the class they represent, with the prefix `For`.
public class HKT2<F, A> {

    public init() {}
}
