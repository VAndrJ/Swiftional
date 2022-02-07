//
//  File.swift
//  
//
//  Created by Volodymyr Andriienko on 07.02.2022.
//

import XCTest
@testable import Swiftional

class FunctionsTests: XCTestCase {

    func test_identityFunction_returnValueSameWithArgument() {
        let input = generateTestIntArray(length: 1)[0]
        XCTAssertEqual(input, identity(input))
    }

    func test_constantFunction_returnValueSameWithConstantInputIndependent() {
        let arr = generateTestIntArray(length: 2)
        let const = arr[0]
        let input = arr[1]
        let f: (Int) -> Int = constant(const)
        XCTAssertEqual(const, f(input))
    }

    func test_flipFunction_argumentsFlipped() {
        let f: (String, Int) -> String = { $0 + "\($1)" }
        let firstArgument = "Test"
        let secondArgument = generateTestIntArray(length: 1)[0]
        let expected = f(firstArgument, secondArgument)
        XCTAssertEqual(expected, flip(f)(secondArgument, firstArgument))
    }

    func test_withFunction_closureApplied() {
        let input = 2
        let expected = getString(input)
        XCTAssertEqual(expected, with(input, getString(_:)))
    }
}
