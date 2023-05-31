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
    
    func test_partialFiveArgumentsFunctionFirstArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, arr[1], arr[2], arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0]))
    }

    func test_partialFiveArgumentsFunctionFirstSecondArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, .deferred, arr[2], arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[1]))
    }

    func test_partialFiveArgumentsFunctionFirstSecondThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, .deferred, .deferred, arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[2]))
    }

    func test_partialFiveArgumentsFunctionFirstSecondFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, .deferred, arr[2], .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[3]))
    }

    func test_partialFiveArgumentsFunctionFirstThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, arr[1], .deferred, arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[2]))
    }

    func test_partialFiveArgumentsFunctionFirstThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, arr[1], .deferred, .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[2], arr[3]))
    }

    func test_partialFiveArgumentsFunctionFirstFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, arr[1], arr[2], .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[3]))
    }

    func test_partialFiveArgumentsFunctionSecondArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], .deferred, arr[2], arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[1]))
    }

    func test_partialFiveArgumentsFunctionSecondThirdArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], .deferred, .deferred, arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[1], arr[2]))
    }

    func test_partialFiveArgumentsFunctionSecondThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], .deferred, .deferred, .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[1], arr[2], arr[3]))
    }
    
    func test_partialFiveArgumentsFunctionFirstSecondThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, .deferred, .deferred, .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[2], arr[3]))
    }

    func test_partialFiveArgumentsFunctionSecondFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], .deferred, arr[2], .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[1], arr[3]))
    }

    func test_partialFiveArgumentsFunctionThirdArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], arr[1], .deferred, arr[3], arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[2]))
    }

    func test_partialFiveArgumentsFunctionThirdFourthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], arr[1], .deferred, .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[2], arr[3]))
    }

    func test_partialFiveArgumentsFunctionFourthArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], arr[1], arr[2], .deferred, arr[4])
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[3]))
    }
    
    func test_partialFiveArgumentsFunctionFirstFifthArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, arr[1], arr[2], arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[4]))
    }

    func test_partialFiveArgumentsFunctionFirstSecondFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, .deferred, arr[2], arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[4]))
    }

    func test_partialFiveArgumentsFunctionFirstSecondThirdFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, .deferred, .deferred, arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[2], arr[4]))
    }

    func test_partialFiveArgumentsFunctionFirstSecondFourthFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, .deferred, arr[2], .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[3], arr[4]))
    }

    func test_partialFiveArgumentsFunctionFirstThirdFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, arr[1], .deferred, arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[2], arr[4]))
    }

    func test_partialFiveArgumentsFunctionFirstThirdFourthFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, arr[1], .deferred, .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[2], arr[3], arr[4]))
    }

    func test_partialFiveArgumentsFunctionFirstFourthFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, .deferred, arr[1], arr[2], .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[0], arr[3], arr[4]))
    }

    func test_partialFiveArgumentsFunctionSecondFifthArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], .deferred, arr[2], arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[1], arr[4]))
    }

    func test_partialFiveArgumentsFunctionSecondThirdFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], .deferred, .deferred, arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[1], arr[2], arr[4]))
    }

    func test_partialFiveArgumentsFunctionSecondThirdFourthFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], .deferred, .deferred, .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[1], arr[2], arr[3], arr[4]))
    }

    func test_partialFiveArgumentsFunctionSecondFourthFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], .deferred, arr[2], .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[1], arr[3], arr[4]))
    }

    func test_partialFiveArgumentsFunctionThirdFifthArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], arr[1], .deferred, arr[3], .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[2], arr[4]))
    }

    func test_partialFiveArgumentsFunctionThirdFourthFifthArgumentsDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], arr[1], .deferred, .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[2], arr[3], arr[4]))
    }

    func test_partialFiveArgumentsFunctionFourthFifthArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let pf = partial(f5, arr[0], arr[1], arr[2], .deferred, .deferred)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, pf(arr[3], arr[4]))
    }

    func test_partialSixArgumentsFunction12345ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, arr[0], .deferred, .deferred, .deferred, .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[1], arr[2], arr[3], arr[4], arr[5]))
    }

    func test_partialSixArgumentsFunction02345ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, .deferred, arr[1], .deferred, .deferred, .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[0], arr[2], arr[3], arr[4], arr[5]))
    }

    func test_partialSixArgumentsFunction01345ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, .deferred, .deferred, arr[2], .deferred, .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[3], arr[4], arr[5]))
    }

    func test_partialSixArgumentsFunction01245ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, .deferred, .deferred, .deferred, arr[3], .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[2], arr[4], arr[5]))
    }

    func test_partialSixArgumentsFunction01235ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, .deferred, .deferred, .deferred, .deferred, arr[4], .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[2], arr[3], arr[5]))
    }

    func test_partialSixArgumentsFunction01234ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, .deferred, .deferred, .deferred, .deferred, .deferred, arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[2], arr[3], arr[4]))
    }

    func test_partialSixArgumentsFunction2345ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, arr[0], arr[1], .deferred, .deferred, .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[2], arr[3], arr[4], arr[5]))
    }

    func test_partialSixArgumentsFunction0345ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, .deferred, arr[1], arr[2], .deferred, .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[0], arr[3], arr[4], arr[5]))
    }

    func test_partialSixArgumentsFunction0145ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, .deferred, .deferred, arr[2], arr[3], .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[4], arr[5]))
    }

    func test_partialSixArgumentsFunction0125ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, .deferred, .deferred, .deferred, arr[3], arr[4], .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[2], arr[5]))
    }

    func test_partialSixArgumentsFunction0123ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, .deferred, .deferred, .deferred, .deferred, arr[4], arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[0], arr[1], arr[2], arr[3]))
    }

    func test_partialSixArgumentsFunction345ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, arr[0], arr[1], arr[2], .deferred, .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[3], arr[4], arr[5]))
    }

    func test_partialSixArgumentsFunction45ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, arr[0], arr[1], arr[2], arr[3], .deferred, .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[4], arr[5]))
    }

    func test_partialSixArgumentsFunction5ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, arr[0], arr[1], arr[2], arr[3], arr[4], .deferred)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[5]))
    }

    func test_partialSixArgumentsFunction4ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, arr[0], arr[1], arr[2], arr[3], .deferred, arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[4]))
    }

    func test_partialSixArgumentsFunction3ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, arr[0], arr[1], arr[2], .deferred, arr[4], arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[3]))
    }

    func test_partialSixArgumentsFunction2ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, arr[0], arr[1], .deferred, arr[3], arr[4], arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[2]))
    }

    func test_partialSixArgumentsFunction1ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, arr[0], .deferred, arr[2], arr[3], arr[4], arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[1]))
    }

    func test_partialSixArgumentsFunction0ArgumentDeferred_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let pf = partial(f6, .deferred, arr[1], arr[2], arr[3], arr[4], arr[5])
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, pf(arr[0]))
    }
}
