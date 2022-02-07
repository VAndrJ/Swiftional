//
//  PartialApplicationTests.swift
//  
//
//  Created by Volodymyr Andriienko on 07.02.2022.
//

import XCTest
@testable import Swiftional

class PartialApplicationTests: XCTestCase {

    func test_partialTwoArgumentsFunctionFirstArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 2)
        let pf = partial(f2, .deferred, arr[1])
        let expected = f2(arr[0], arr[1])
        XCTAssertEqual(expected, pf(arr[0]))
    }

    func test_partialTwoArgumentsFunctionSecondArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 2)
        let pf = partial(f2, arr[0], .deferred)
        let expected = f2(arr[0], arr[1])
        XCTAssertEqual(expected, pf(arr[1]))
    }

    func test_partialThreeArgumentsFunctionFirstArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let pf = partial(f3, .deferred, arr[1], arr[2])
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, pf(arr[0]))
    }

    func test_partialThreeArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let pf = partial(f3, .deferred, .deferred, arr[2])
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, pf(arr[0], arr[1]))
    }

    func test_partialThreeArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let pf = partial(f3, .deferred, arr[1], .deferred)
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, pf(arr[0], arr[2]))
    }

    func test_partialThreeArgumentsFunctionSecondArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let pf = partial(f3, arr[0], .deferred, arr[2])
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, pf(arr[1]))
    }

    func test_partialThreeArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let pf = partial(f3, arr[0], .deferred, .deferred)
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, pf(arr[1], arr[2]))
    }

    func test_partialThreeArgumentsFunctionThirdArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let pf = partial(f3, arr[0], arr[1], .deferred)
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, pf(arr[2]))
    }

    func test_partialFourArgumentsFunctionFirstArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, .deferred, arr[1], arr[2], arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[0]))
    }

    func test_partialFourArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, .deferred, .deferred, arr[2], arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[0], arr[1]))
    }

    func test_partialFourArgumentsFunctionFirstSecondThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, .deferred, .deferred, .deferred, arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[2]))
    }

    func test_partialFourArgumentsFunctionFirstSecondFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, .deferred, .deferred, arr[2], .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[3]))
    }

    func test_partialFourArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, .deferred, arr[1], .deferred, arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[0], arr[2]))
    }

    func test_partialFourArgumentsFunctionFirstThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, .deferred, arr[1], .deferred, .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[0], arr[2], arr[3]))
    }

    func test_partialFourArgumentsFunctionFirstFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, .deferred, arr[1], arr[2], .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[0], arr[3]))
    }

    func test_partialFourArgumentsFunctionSecondArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, arr[0], .deferred, arr[2], arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[1]))
    }

    func test_partialFourArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, arr[0], .deferred, .deferred, arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[1], arr[2]))
    }

    func test_partialFourArgumentsFunctionSecondThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, arr[0], .deferred, .deferred, .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[1], arr[2], arr[3]))
    }

    func test_partialFourArgumentsFunctionSecondFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, arr[0], .deferred, arr[2], .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[1], arr[3]))
    }

    func test_partialFourArgumentsFunctionThirdArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, arr[0], arr[1], .deferred, arr[3])
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[2]))
    }

    func test_partialFourArgumentsFunctionThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, arr[0], arr[1], .deferred, .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[2], arr[3]))
    }

    func test_partialFourArgumentsFunctionFourthArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let pf = partial(f4, arr[0], arr[1], arr[2], .deferred)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, pf(arr[3]))
    }
}
