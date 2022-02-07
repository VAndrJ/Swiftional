//
//  UncurryTests.swift
//  
//
//  Created by Volodymyr Andriienko on 07.02.2022.
//

import XCTest
@testable import Swiftional

class UncurryTests: XCTestCase {

    func test_uncurryingTwoArgumentsCurriedFunction_sameResults() {
        let cf = curry(f2)
        let arr = generateTestIntArray(length: 2)
        let expected = f2(arr[0], arr[1])
        XCTAssertEqual(expected, uncurry(cf)(arr[0], arr[1]))
    }

    func test_uncurryingThreeArgumentsCurriedFunction_sameResults() {
        let cf = curry(f3)
        let arr = generateTestIntArray(length: 3)
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, uncurry(cf)(arr[0], arr[1], arr[2]))
    }

    func test_uncurryingFourArgumentsCurriedFunction_sameResults() {
        let cf = curry(f4)
        let arr = generateTestIntArray(length: 4)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, uncurry(cf)(arr[0], arr[1], arr[2], arr[3]))
    }

    func test_uncurryingFiveArgumentsCurriedFunction_sameResults() {
        let cf = curry(f5)
        let arr = generateTestIntArray(length: 5)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, uncurry(cf)(arr[0], arr[1], arr[2], arr[3], arr[4]))
    }
}
