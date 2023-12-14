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

    func test_throws_curryingTwoArgumentsFunction_sameResults() throws {
        let arr = generateTestIntArray(length: 2)
        let expected = try f2t(arr[0], arr[1])
        XCTAssertEqual(expected, try curry(f2t)(arr[0])(arr[1]))
    }

    func test_async_curryingTwoArgumentsFunction_sameResults() async {
        let arr = generateTestIntArray(length: 2)
        let expected = await aF2(arr[0], arr[1])
        let sut = curry(aF2)
        let result = await sut(arr[0])(arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_curryingTwoArgumentsFunction_sameResults() async throws {
        let arr = generateTestIntArray(length: 2)
        let expected = try await aF2T(arr[0], arr[1])
        let sut = curry(aF2T)
        let result = try await sut(arr[0])(arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_curryingThreeArgumentsFunction_sameResults() {
        let arr = generateTestIntArray(length: 3)
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, curry(f3)(arr[0])(arr[1])(arr[2]))
    }

    func test_throws_curryingThreeArgumentsFunction_sameResults() throws {
        let arr = generateTestIntArray(length: 3)
        let expected = try f3t(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, try curry(f3t)(arr[0])(arr[1])(arr[2]))
    }

    func test_async_curryingThreeArgumentsFunction_sameResults() async {
        let arr = generateTestIntArray(length: 3)
        let expected = await aF3(arr[0], arr[1], arr[2])
        let sut = curry(aF3)
        let result = await sut(arr[0])(arr[1])(arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_curryingThreeArgumentsFunction_sameResults() async throws {
        let arr = generateTestIntArray(length: 3)
        let expected = try await aF3T(arr[0], arr[1], arr[2])
        let sut = curry(aF3T)
        let result = try await sut(arr[0])(arr[1])(arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_curryingFourArgumentsFunction_sameResults() {
        let arr = generateTestIntArray(length: 4)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, curry(f4)(arr[0])(arr[1])(arr[2])(arr[3]))
    }

    func test_throws_curryingFourArgumentsFunction_sameResults() throws {
        let arr = generateTestIntArray(length: 4)
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try curry(f4t)(arr[0])(arr[1])(arr[2])(arr[3]))
    }

    func test_async_curryingFourArgumentsFunction_sameResults() async {
        let arr = generateTestIntArray(length: 4)
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let sut = curry(aF4)
        let result = await sut(arr[0])(arr[1])(arr[2])(arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_curryingFourArgumentsFunction_sameResults() async throws {
        let arr = generateTestIntArray(length: 4)
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let sut = curry(aF4T)
        let result = try await sut(arr[0])(arr[1])(arr[2])(arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_curryingFiveArgumentsFunction_sameResults() {
        let arr = generateTestIntArray(length: 5)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, curry(f5)(arr[0])(arr[1])(arr[2])(arr[3])(arr[4]))
    }

    func test_throws_curryingFiveArgumentsFunction_sameResults() throws {
        let arr = generateTestIntArray(length: 5)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try curry(f5t)(arr[0])(arr[1])(arr[2])(arr[3])(arr[4]))
    }

    func test_async_curryingFiveArgumentsFunction_sameResults() async {
        let arr = generateTestIntArray(length: 5)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let sut = curry(aF5)
        let result = await sut(arr[0])(arr[1])(arr[2])(arr[3])(arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_curryingFiveArgumentsFunction_sameResults() async throws {
        let arr = generateTestIntArray(length: 5)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let sut = curry(aF5T)
        let result = try await sut(arr[0])(arr[1])(arr[2])(arr[3])(arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_curryingSixArgumentsFunction_sameResults() {
        let arr = generateTestIntArray(length: 6)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, curry(f6)(arr[0])(arr[1])(arr[2])(arr[3])(arr[4])(arr[5]))
    }

    func test_throws_curryingSixArgumentsFunction_sameResults() throws {
        let arr = generateTestIntArray(length: 6)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try curry(f6T)(arr[0])(arr[1])(arr[2])(arr[3])(arr[4])(arr[5]))
    }

    func test_async_curryingSixArgumentsFunction_sameResults() async {
        let arr = generateTestIntArray(length: 6)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let sut = curry(aF6)
        let result = await sut(arr[0])(arr[1])(arr[2])(arr[3])(arr[4])(arr[5])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_curryingSixArgumentsFunction_sameResults() async throws {
        let arr = generateTestIntArray(length: 6)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let sut = curry(aF6T)
        let result = try await sut(arr[0])(arr[1])(arr[2])(arr[3])(arr[4])(arr[5])
        XCTAssertEqual(expected, result)
    }
}
