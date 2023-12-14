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

    func test_throws_uncurryingTwoArgumentsCurriedFunction_sameResults() throws {
        let cf = curry(f2t)
        let arr = generateTestIntArray(length: 2)
        let expected = try f2t(arr[0], arr[1])
        XCTAssertEqual(expected, try uncurry(cf)(arr[0], arr[1]))
    }

    func test_async_uncurryingTwoArgumentsCurriedFunction_sameResults() async {
        let cf = curry(aF2)
        let arr = generateTestIntArray(length: 2)
        let expected = await aF2(arr[0], arr[1])
        let sut = uncurry(cf)
        let result = await sut(arr[0], arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_uncurryingTwoArgumentsCurriedFunction_sameResults() async throws {
        let cf = curry(aF2T)
        let arr = generateTestIntArray(length: 2)
        let expected = try await aF2T(arr[0], arr[1])
        let sut = uncurry(cf)
        let result = try await sut(arr[0], arr[1])
        XCTAssertEqual(expected, result)
    }

    func test_uncurryingThreeArgumentsCurriedFunction_sameResults() {
        let cf = curry(f3)
        let arr = generateTestIntArray(length: 3)
        let expected = f3(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, uncurry(cf)(arr[0], arr[1], arr[2]))
    }

    func test_throws_uncurryingThreeArgumentsCurriedFunction_sameResults() throws {
        let cf = curry(f3t)
        let arr = generateTestIntArray(length: 3)
        let expected = try f3t(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, try uncurry(cf)(arr[0], arr[1], arr[2]))
    }

    func test_async_uncurryingThreeArgumentsCurriedFunction_sameResults() async {
        let cf = curry(aF3)
        let arr = generateTestIntArray(length: 3)
        let expected = await aF3(arr[0], arr[1], arr[2])
        let sut = uncurry(cf)
        let result = await sut(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_uncurryingThreeArgumentsCurriedFunction_sameResults() async throws {
        let cf = curry(aF3T)
        let arr = generateTestIntArray(length: 3)
        let expected = try await aF3T(arr[0], arr[1], arr[2])
        let sut = uncurry(cf)
        let result = try await sut(arr[0], arr[1], arr[2])
        XCTAssertEqual(expected, result)
    }

    func test_uncurryingFourArgumentsCurriedFunction_sameResults() {
        let cf = curry(f4)
        let arr = generateTestIntArray(length: 4)
        let expected = f4(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, uncurry(cf)(arr[0], arr[1], arr[2], arr[3]))
    }

    func test_throws_uncurryingFourArgumentsCurriedFunction_sameResults() throws {
        let cf = curry(f4t)
        let arr = generateTestIntArray(length: 4)
        let expected = try f4t(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, try uncurry(cf)(arr[0], arr[1], arr[2], arr[3]))
    }

    func test_async_uncurryingFourArgumentsCurriedFunction_sameResults() async {
        let cf = curry(aF4)
        let arr = generateTestIntArray(length: 4)
        let expected = await aF4(arr[0], arr[1], arr[2], arr[3])
        let sut = uncurry(cf)
        let result = await sut(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_uncurryingFourArgumentsCurriedFunction_sameResults() async throws {
        let cf = curry(aF4T)
        let arr = generateTestIntArray(length: 4)
        let expected = try await aF4T(arr[0], arr[1], arr[2], arr[3])
        let sut = uncurry(cf)
        let result = try await sut(arr[0], arr[1], arr[2], arr[3])
        XCTAssertEqual(expected, result)
    }

    func test_uncurryingFiveArgumentsCurriedFunction_sameResults() {
        let cf = curry(f5)
        let arr = generateTestIntArray(length: 5)
        let expected = f5(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, uncurry(cf)(arr[0], arr[1], arr[2], arr[3], arr[4]))
    }

    func test_throws_uncurryingFiveArgumentsCurriedFunction_sameResults() throws {
        let cf = curry(f5t)
        let arr = generateTestIntArray(length: 5)
        let expected = try f5t(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, try uncurry(cf)(arr[0], arr[1], arr[2], arr[3], arr[4]))
    }

    func test_async_uncurryingFiveArgumentsCurriedFunction_sameResults() async {
        let cf = curry(aF5)
        let arr = generateTestIntArray(length: 5)
        let expected = await aF5(arr[0], arr[1], arr[2], arr[3], arr[4])
        let sut = uncurry(cf)
        let result = await sut(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_async_throws_uncurryingFiveArgumentsCurriedFunction_sameResults() async throws {
        let cf = curry(aF5T)
        let arr = generateTestIntArray(length: 5)
        let expected = try await aF5T(arr[0], arr[1], arr[2], arr[3], arr[4])
        let sut = uncurry(cf)
        let result = try await sut(arr[0], arr[1], arr[2], arr[3], arr[4])
        XCTAssertEqual(expected, result)
    }

    func test_uncurryingSixArgumentsCurriedFunction_sameResults() {
        let cf = curry(f6)
        let arr = generateTestIntArray(length: 6)
        let expected = f6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, uncurry(cf)(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5]))
    }

    func test_throws_uncurryingSixArgumentsCurriedFunction_sameResults() throws {
        let cf = curry(f6T)
        let arr = generateTestIntArray(length: 6)
        let expected = try f6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, try uncurry(cf)(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5]))
    }

    func test_async_uncurryingSixArgumentsCurriedFunction_sameResults() async {
        let cf = curry(aF6)
        let arr = generateTestIntArray(length: 6)
        let expected = await aF6(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let sut = uncurry(cf)
        let resutl = await sut(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, resutl)
    }

    func test_async_throws_uncurryingSixArgumentsCurriedFunction_sameResults() async throws {
        let cf = curry(aF6T)
        let arr = generateTestIntArray(length: 6)
        let expected = try await aF6T(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        let sut = uncurry(cf)
        let resutl = try await sut(arr[0], arr[1], arr[2], arr[3], arr[4], arr[5])
        XCTAssertEqual(expected, resutl)
    }
}
