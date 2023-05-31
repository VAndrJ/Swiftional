//
//  CurryTests.swift
//  
//
//  Created by Volodymyr Andriienko on 07.02.2022.
//

import XCTest
@testable import Swiftional

class CurryTests: XCTestCase {

    func test_curryingTwoArgumentsFunction_sameResults() {
        let arr = generateTestIntArray(length: 2)
        let expected = f2(arr[0], arr[1])
        XCTAssertEqual(expected, curry(f2)(arr[0])(arr[1]))
    }

    func test_curryingThreeArgumentsFunction_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, curry(f3)(arr[0])(arr[1])(arr[2]))
    }

    func test_curryingFourArgumentsFunction_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, curry(f4)(arr[0])(arr[1])(arr[2])(arr[3]))
    }

    func test_curryingFiveArgumentsFunction_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, curry(f5)(arr[0])(arr[1])(arr[2])(arr[3])(arr[4]))
    }

    func test_curryingSixArgumentsFunction_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, curry(f6)(arr[0])(arr[1])(arr[2])(arr[3])(arr[4])(arr[5]))
    }
}
